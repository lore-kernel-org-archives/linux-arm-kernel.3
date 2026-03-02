Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103DBE9B342
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zpCsC76A/B8FEp6NQth+KPKVyK8PduJ80CXc9DihGY=; b=H0bJ48KSQ1kh1f/3N2QwzkKf6c
	WIuqQTuSf6JHfarQlbmDizQC5TVTIzqQsjPMk7L6cua+s3TC/P7FSCZdoZGsUu1NlqsdsaqPBainj
	bKdvi9Hai/vZ1weFlQMhme22Xa7+WdjVQ8waWAwi0pw1dHT7mDdIUZ1DVdKJUrcRTZG3zuspggNEt
	Sh3RSd+OLvyn1h4Q5GL3kzZewNZL+7tfjME8Ek3XkjwP64n2XK3vQUvP1R1y5gZ9q3onkixuTcCm1
	kHZM1lbwufFd4CzMOIKiJtfhdu/0q7uJTlrM/P+8ElXqQMGPY7ISQ33BGllhuaLBOGM+nRzueS7en
	ZNp+lWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0at-0000000CiXJ-1Z3K;
	Mon, 02 Mar 2026 10:33:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0aq-0000000CiWG-2dJ9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:33:41 +0000
Date: Mon, 2 Mar 2026 11:33:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772447601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zpCsC76A/B8FEp6NQth+KPKVyK8PduJ80CXc9DihGY=;
	b=agDuY6VSHjOEVidIw9tmeJdXttkw0fiS17n6SGkI/4sKaOdW3x451mWnod8UdVEJ8Q4wky
	LqAV/voYBIHtT1nF+GjG4Tfldk5ScLL/XWqJjtBZD78+E1EhqJF50N5uP8kyIyXrPKc+14
	kBdAPp2MzMWtUDbwyQWyg7PvKWGgTMALIMZO5oJKYqsFmUL+yMR6FKKFtjara5awUReslW
	4IcE6aDrrGdKdEFrUVLA/jWNwYW7JgDn9OPx/Smbi1UwV+9QsKeLGviv5ThJdxjZCACznX
	M8WRXzoyT2Ii9b69DQRsHciEGEjW5kQCLq95P6o/gEy6wpe2ZUh/hX0+wJk2hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772447601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3zpCsC76A/B8FEp6NQth+KPKVyK8PduJ80CXc9DihGY=;
	b=qLfEhmvnxGcsNliQohntBn3K6GLY3gY5LOFdBG1n0YwuyoOzlDQYN4lsWFmAV2BlNpy+m3
	i4YMjG1POEhtljBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	Clark Williams <clrkwllms@kernel.org>,
	linux-rt-devel@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/6] ARM: ensure interrupts are enabled in
 __do_user_fault()
Message-ID: <20260302103319.VI_GSa_5@linutronix.de>
References: <aaG1wrNUaq_L0I5g@shell.armlinux.org.uk>
 <E1vvzcS-0000000Awnu-1u0H@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <E1vvzcS-0000000Awnu-1u0H@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_023340_935433_F4223282 
X-CRM114-Status: GOOD (  16.45  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 2026-02-27 15:19:08 [+0000], Russell King (Oracle) wrote:
> __do_user_fault() may be called from fault handling paths where the
> interrupts are enabled or disabled. E.g. do_page_fault() calls this
> with interrupts enabled, whereas do_sect_fault()->do_bad_area()
> will call this with interrupts disabled. Since this is a userspace
> fault, we know that interrupts were enabled in the parent context,
> so call local_irq_enable() here to give a consistent interrupt state.
> 
> This is necessary for force_sig_info() when PREEMPT_RT is enabled.

Reported-by: Yadi.hu <yadi.hu@windriver.com
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm/mm/fault.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index ed4330cc3f4e..6c27ebd49093 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -190,7 +190,8 @@ __do_kernel_fault(struct mm_struct *mm, unsigned long addr, unsigned int fsr,
>  
>  /*
>   * Something tried to access memory that isn't in our memory map..
> - * User mode accesses just cause a SIGSEGV
> + * User mode accesses just cause a SIGSEGV. Ensure interrupts are enabled
> + * for preempt RT.
          PREEMPT_RT.
>   */
>  static void
>  __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,

Sebastian

