Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF38C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 22:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYXn32s/xxT3jvoAIsR5spgK8iD2v662pvFF1rwfLDk=; b=EBWoNH2uB5budvaRdpyfV+z2Xd
	90YVnQRsqr9dGiAALVVl0D7Nl6hLWOWw/MsPm3ohvu8SM0Q39dVfItMuczaCFkGSyxn1ji32B10W4
	OWaA91YcJBqPgpeD3ptGcG5vLY8t8tsk43dRdLkj/7sdVO3AXowvZNLQGJxfr9NKqxOKCAT7PbQTa
	xyotM0DNoAz7hJzP5yoGLp2zAZ7i6X9WNWyMOmFVWqJxwcpllU94o8/GYkn68RPnaePprHG5Y9N5r
	+UJmgH11nXj69R25sQXZZcDwgrUQcS3sv0NYR2s/BHSBro+Hxq/4yuHi3XLDHJuQGub7wheDMl9DW
	FRp18XRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub5Ux-00000000isv-3jCt;
	Sun, 13 Jul 2025 22:48:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub5SX-00000000idl-1ign
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 22:46:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 40C83A507C2;
	Sun, 13 Jul 2025 22:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4AEC4CEE3;
	Sun, 13 Jul 2025 22:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752446771;
	bh=JnUp2yg/CJKtlP4jODU9pih+4FgginRFGssMqlN1RLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZTjTzON5a4Tk1uNO38cGBNO//z0NCoHFguYe+iRgTbJZhV8go8vunUI2GS5ATblfY
	 bfMH+BQkV5BlKFjDOnZ8niG8WlxWAyAjhqc4ZargukHFamFu4a5tBV0qLoBrpLNAfo
	 0YIPpfjZ8RanOter/N9CbDVA1O743qZM49h8qkHWtJnGDvgvkPQ9Ir2DCJVRSQemq+
	 mrwdMfYdfL40qVdrufLTdLJxZcgBvuXzkejEm7b/is0mmYyQDIim5pa8uAtgTIuIXB
	 Q1v7ibj91unzhLXdEGjOGRhaXYELUFL1gi1dYfN6YjDA7M9VXdVLiy9I2L95+8Vlxx
	 VRU7kKQ+S97QQ==
Date: Sun, 13 Jul 2025 23:46:06 +0100
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, osandov@fb.com, leo.yan@arm.com,
	rmikey@meta.com
Subject: Re: [PATCH] arm64: traps: Mark kernel as tainted on SError panic
Message-ID: <aHQ3Lu27_mLfR8Ke@willie-the-truck>
References: <20250710-arm_serror-v1-1-2a3def3740d7@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-arm_serror-v1-1-2a3def3740d7@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_154613_509641_1A258713 
X-CRM114-Status: GOOD (  14.35  )
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

On Thu, Jul 10, 2025 at 03:46:35AM -0700, Breno Leitao wrote:
> Set TAINT_MACHINE_CHECK when SError interrupts trigger a panic to
> flag potential hardware faults. This tainting mechanism aids in
> debugging and enables correlation of hardware-related crashes in
> large-scale deployments.
> 
> This change aligns with similar patches[1] that mark machine check
> events when the system crashes due to hardware errors.
> 
> Link: https://lore.kernel.org/all/20250702-add_tain-v1-1-9187b10914b9@debian.org/ [1]
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/kernel/traps.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 9bfa5c944379d..7468b22585cef 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -931,6 +931,7 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
>  
>  void __noreturn arm64_serror_panic(struct pt_regs *regs, unsigned long esr)
>  {
> +	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
>  	console_verbose();
>  
>  	pr_crit("SError Interrupt on CPU%d, code 0x%016lx -- %s\n",

If we're going to taint for SError, shouldn't we also taint for an
unclaimed SEA?

Will

