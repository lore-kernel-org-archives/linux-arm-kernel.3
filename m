Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1309C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jXTwQ9t0J4ctbtSgOVyZqJqazCiZmUwCYVwcmyoIwQ=; b=mTky8n7W/owwwDky9y0PRDIkxM
	RhY4jT6Xxo7LG6GhysExACnuD8mNgzzx604Rw4eSsTczcp5XnkBeNslsvmtwjGXZ7UyaDRttzxZTG
	Ey9qfGk2z4zlFi61fKeatQi2zmV9zlQrt9WM7UXLs7iqqcOscwQvUf7qJ+XzwTwcvrY8E9K/vhWPM
	Q/FXPgOGJByDwZQcFh2WJ5OOcY54whs9MyFrudWwVMKcQexI/qJByINr/7QX+bwmhHqKXrxY+0hBs
	whbXkenIbF3PwGMgvDmOIWkdZOesZqb67npVM3WuTOjnPWFOjHOsKSFuQ5r1gyuzkKuh4mfwz5GOz
	X/YfG9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppbv-0000000CwDl-21Y9;
	Fri, 31 Jul 2026 15:57:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppbr-0000000CwDH-1Y0m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:57:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACFC8204C;
	Fri, 31 Jul 2026 08:57:13 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59F3D3F66F;
	Fri, 31 Jul 2026 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785513437; bh=3fE17VY55jEg8Yh3SdwZWySOppkdrVhRKTzR+2tl0VA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MybJcXmny7qIExuu143hMNLviFJLnxpF70W9oe2p4DTW3MnID/2HuO5QNgXiysHEi
	 FGGmh7m8ehcMMWp6YJG0lPt1Az0XridfkJ+FvSlcBJTCRTdFOiq3ZmssZm4stks/xa
	 zTTmlB0nZseiYr7fywVupjtsg5kCan2d0oCo/8YU=
Date: Fri, 31 Jul 2026 16:57:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Hongyan Xia <hongyan.xia@transsion.com>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiazi Li <jiazi.li@transsion.com>, Pu Hu <hupu@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH 6/9] arm64/kprobes: Make kprobe_fault_handler()
 noinstr
Message-ID: <amzF2Rfan44rYxI6@J2N7QTR9R3>
References: <cover.1785153469.git.hongyan.xia@transsion.com>
 <c18bdf933f9712d9c1d5c06a6c07600d8e62746f.1785153469.git.hongyan.xia@transsion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c18bdf933f9712d9c1d5c06a6c07600d8e62746f.1785153469.git.hongyan.xia@transsion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_085719_456975_5553B80F 
X-CRM114-Status: GOOD (  20.80  )
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

On Mon, Jul 27, 2026 at 12:25:43PM +0000, Hongyan Xia wrote:
> From: Hongyan Xia <hongyan.xia@transsion.com>
> 
> kprobe_fault_handler() is reached from do_page_fault() when a fault
> happens while a kprobe single-step is armed. Everything it calls (the
> save/restore helpers, kprobes_restore_local_irqflag(),
> reset_current_kprobe(), register access) is noinstr after the previous
> patch, and being called from an instrumentable caller into a noinstr
> callee is fine.

I think it's fine to mark this as noinstr.

I don't think we need kprobe_fault_handler() in the first place given we
don't permit kprobes to be placed on instructions with an extable entry.
Any instruction which can be probled cannot legitimately cause a fault.

That and kprobes_restore_local_irqflag() can't do the right thing w.r.t
DAIF, since it only fiddles with the value in the pt_regs, and doesn't
touch the live inherited DAIF value. If we need to fiddle with the live
DAIF value, we must do that much earlier in the entry-common code.

Mark.

> Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
> ---
>  arch/arm64/kernel/probes/kprobes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index e9fa66fa4217..4172998d48d9 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -310,7 +310,7 @@ post_kprobe_handler(struct kprobe *cur, struct kprobe_ctlblk *kcb, struct pt_reg
>  	reset_current_kprobe();
>  }
>  
> -int __kprobes kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
> +int noinstr kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr)
>  {
>  	struct kprobe *cur = kprobe_running();
>  	struct kprobe_ctlblk *kcb = get_kprobe_ctlblk();
> -- 
> 2.47.3
> 

