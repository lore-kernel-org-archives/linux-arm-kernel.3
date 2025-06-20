Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CA8C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GK6e6w1xb/5R+UW8gTgnT6hijKGuDluLmnbi1Q0GbwE=; b=NGmPRcsoUfk8Ic60gipo5JQ26U
	j1NzhAsiI2SxNg0ziJmKxTrtWAoei4eaEEHHLSweAPgSZtn30HHLqguQtDJcReqRqTKessv0M3mEj
	x9kW8KwoQkxcKZDtOI9pQzZB2+X1yMmVvn2okS5g7JkVlt3xIRTG4pJRLhFinrF/US1RJhfhPSVxU
	aldjrIzvSD4KI+4HgvGC1kzfoPE21lRW0YZ5ROFvmkSko/vDEDdAJO3Vz87nVrTQOJu+sGxwc1HXE
	UKdN3aE0sDxv7lp1MsiZeoop1ZagMI9XQ/emfdpAU4q3XVldSggl/9Xn1cUXgJss4Z2AgtjhxMbUJ
	9zKZmZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaN3-0000000FWFj-1eiV;
	Fri, 20 Jun 2025 11:57:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZr5-0000000FSXi-2MZ4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Jun 2025 11:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GK6e6w1xb/5R+UW8gTgnT6hijKGuDluLmnbi1Q0GbwE=; b=DMDZ+EbokDKzccyCxvrrirdJPr
	WaFXRMvnWJbudE6FQiQsNWfu/zBbwPlcr3yohcbQA62TTuk+zW364/h3kkRteyxMDsaH1t7kfz7kj
	p8pV5cG+YIMZxoeGylZtk+VzooZdzyhGvisMYcWrrCel3YtQeFYBcmPeHB7taLSlfRH7X/YUqGxyn
	NTpYEODUy/30pvHiP7jjHGQyyXk05HB+vPNa5/pNCnwWpJ3rMd0nXsTSpPjmhbWob5rTvkkjlSDKl
	79CQill9HUBB5yavj/PrB06vZkeEcrShtKkWiymbuX20ry3nZkIYhD2cTLTANNd0bMqhf+Msgz+Lx
	/+3HEyMw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZr2-00000004iME-3N3r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 11:24:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6031C176A;
	Fri, 20 Jun 2025 04:23:58 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B68553F673;
	Fri, 20 Jun 2025 04:24:16 -0700 (PDT)
Date: Fri, 20 Jun 2025 12:24:14 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	James Morse <james.morse@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: move smp_send_stop() cpu mask off stack
Message-ID: <aFVE3uuNCbHF7f5z@arm.com>
References: <20250620111045.3364827-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620111045.3364827-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_122421_124292_B8708A1F 
X-CRM114-Status: GOOD (  19.84  )
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

On Fri, Jun 20, 2025 at 01:10:41PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> For really large values of CONFIG_NR_CPUS, a CPU mask value should
> not be put on the stack:
> 
> arch/arm64/kernel/smp.c:1188:1: error: the frame size of 8544 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> This could be achieved using alloc_cpumask_var(), which makes it
> depend on CONFIG_CPUMASK_OFFSTACK, but as this function is already
> serialized and can only run on one CPU, making the variable 'static'
> is easier.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 15987100c0cf..5c605dc7f5be 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -1107,7 +1107,7 @@ static inline unsigned int num_other_online_cpus(void)
>  void smp_send_stop(void)
>  {
>  	static unsigned long stop_in_progress;
> -	cpumask_t mask;
> +	static cpumask_t mask;
>  	unsigned long timeout;

This would work, there's a stop_in_progress check and only one CPU would
modify the mask.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

