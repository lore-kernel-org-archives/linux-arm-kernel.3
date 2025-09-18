Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BB9CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 20:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwExCvSRtITqTswr8DvPRQEChv2HZdcz8728vjxNyMs=; b=RiH2zIQmIonDWt4RYfXT00pIMM
	5j572rahSSm8yzRn7Zu/BLaGQYOhuK/H8iaLXeA3GeoVDYjsY5HgBemikjCXW9eX5BMcUB8PPCX2S
	8sytRQ4WfMhU+8/pN5gBfEsF43cBDtKKTCQV/6e9wXmiQgK3NmcPERgUTWyq+1uZTyWRnXGUTfLXM
	5JXZSpqTveFhx6De+kYnW9aGxUIbFlsI57XSYP3AtzUW1bbUynh9GWdLsDgfCjHyrVp1fK0HryH1x
	vLft9pkXPu11PhZnrca8aFqToWJgI0D1Q3kCAM+rnnXrLono91m1XTAtzYlrNYY7Xl/fsxtOGiX3z
	Mc5/kaOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKvv-0000000146Y-18Ju;
	Thu, 18 Sep 2025 20:08:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzKvt-0000000145h-2udN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 20:08:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BADEC60211;
	Thu, 18 Sep 2025 20:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B15C4CEFB;
	Thu, 18 Sep 2025 20:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226124;
	bh=tMsV6oWM2CjVGDVuEwYMj2bcWme2aqNHw1loQMqwTJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPkWjrvojGXkv4cPINpxX85btxAuaBJi2ORp1V99InC6wj69QkWH844eWH4qH57Bv
	 VsHCym70JgFlA6ad7kjNAnNuUbIAFVyEdAY21FaWfy4pe4PhZwnmxFx5c+QusO085n
	 Zavev77jGLnk4tDRyEXIKYa6w5mEHlmCWN640okSR3d5CUA6Z9sz1mYzF/l3pYqJkq
	 JcrM06oBwcXecSTN8pnHq4peQ/sfVCyVu5osCsNiNBQ2tBPdHvkxVx4LRc1xHAWkMd
	 XIhzWbMgZcXhnTMhZFVm2kV/+4XExuqidK5J7fAvUeyQ+jI0lDGPq6nhY4rXTv1CPp
	 52oi8W/OYvPbw==
Date: Thu, 18 Sep 2025 21:08:40 +0100
From: Will Deacon <will@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	mark.rutland@arm.com, liaochang1@huawei.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: probes: Fix incorrect bl/blr address and register
 usage
Message-ID: <aMxmyMRxRRRj9phu@willie-the-truck>
References: <20250918175424.3483164-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918175424.3483164-1-jeremy.linton@arm.com>
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

On Thu, Sep 18, 2025 at 12:54:24PM -0500, Jeremy Linton wrote:
> The pt_regs registers are 64-bit on arm64, and should be u64 when
> manipulated. Correct this so that we aren't truncating the address
> during br/blr sequences.
> 
> Fixes: efb07ac534e2 ("arm64: probes: Add GCS support to bl/blr/ret")
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> ---
>  arch/arm64/kernel/probes/simulate-insn.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/probes/simulate-insn.c b/arch/arm64/kernel/probes/simulate-insn.c
> index 97ed4db75417..89fbeb32107e 100644
> --- a/arch/arm64/kernel/probes/simulate-insn.c
> +++ b/arch/arm64/kernel/probes/simulate-insn.c
> @@ -145,7 +145,7 @@ void __kprobes
>  simulate_br_blr(u32 opcode, long addr, struct pt_regs *regs)
>  {
>  	int xn = (opcode >> 5) & 0x1f;
> -	int b_target = get_x_reg(regs, xn);
> +	u64 b_target = get_x_reg(regs, xn);
>  
>  	if (((opcode >> 21) & 0x3) == 1)
>  		if (update_lr(regs, addr + 4))
> @@ -160,7 +160,7 @@ simulate_ret(u32 opcode, long addr, struct pt_regs *regs)
>  	u64 ret_addr;
>  	int err = 0;
>  	int xn = (opcode >> 5) & 0x1f;
> -	unsigned long r_target = get_x_reg(regs, xn);
> +	u64 r_target = get_x_reg(regs, xn);

This part isn't really doing anything but it's probably worth being
consistent with 'u64' anyway. I'll pick this up, thanks.

Will

