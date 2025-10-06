Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05408CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 13:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djQsWL/WueE4nEcX5qV4mtgzS6yiMOnbxwJGa6gL7a8=; b=wBlRQV9UQED1xWN5Zyg/ejWlC4
	yNSXKw8/zxPQTKBFawwjVOs0FzW9oVSATk0UOcZtwv6BjqkVFCtEWeduaOydcJktd8PHL/+wxM9SA
	N6Msg+2kXkaYKqo8liw2Xv9Nu8PD6NRazDoCO/FANydyU7m3jfjGa3tVyO/Nw98BF/UYtOhmATB5H
	peCI3zSLmoKYGYDbzdjF80JyBL7khGCpDXzqIIrn35EudLI6X3wA6UJYDXrIm1RzycQkYFuSK08fc
	KDjKaa7D/weMWynpxxYubB79sG7i7fgQT9veYX/Mn2sk63FifZ0KjKM58vbcOhJsMTvBFjDtDiBxh
	DAn93Leg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5lI2-00000000651-3mxt;
	Mon, 06 Oct 2025 13:30:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5lI1-0000000064v-11s7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 13:30:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A7D4B604C1;
	Mon,  6 Oct 2025 13:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4568C4CEF5;
	Mon,  6 Oct 2025 13:30:06 +0000 (UTC)
Date: Mon, 6 Oct 2025 14:30:04 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix GIC CDEOI instruction encoding
Message-ID: <aOPEXEx-QRv7v9A5@arm.com>
References: <20251006100758.624934-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006100758.624934-1-lpieralisi@kernel.org>
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

On Mon, Oct 06, 2025 at 12:07:58PM +0200, Lorenzo Pieralisi wrote:
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 6455db1b54fd..6cf8c46ddde5 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -113,14 +113,14 @@
>  /* Register-based PAN access, for save/restore purposes */
>  #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
>  
> -#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)			\
> +#define __SYS_INSN(op0, op1, CRn, CRm, op2, Rt)				\
>  	__emit_inst(0xd5000000					|	\
>  		    sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
>  		    ((Rt) & 0x1f))
>  
> -#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
> -#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
> -#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
> +#define SB_BARRIER_INSN			__SYS_INSN(0, 3, 3, 0, 7, 31)
> +#define GSB_SYS_BARRIER_INSN		__SYS_INSN(1, 0, 12, 0, 0, 31)
> +#define GSB_ACK_BARRIER_INSN		__SYS_INSN(1, 0, 12, 0, 1, 31)
>  
>  /* Data cache zero operations */
>  #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
> @@ -1075,7 +1075,6 @@
>  #define GICV5_OP_GIC_CDDIS		sys_insn(1, 0, 12, 1, 0)
>  #define GICV5_OP_GIC_CDHM		sys_insn(1, 0, 12, 2, 1)
>  #define GICV5_OP_GIC_CDEN		sys_insn(1, 0, 12, 1, 1)
> -#define GICV5_OP_GIC_CDEOI		sys_insn(1, 0, 12, 1, 7)
>  #define GICV5_OP_GIC_CDPEND		sys_insn(1, 0, 12, 1, 4)
>  #define GICV5_OP_GIC_CDPRI		sys_insn(1, 0, 12, 1, 2)
>  #define GICV5_OP_GIC_CDRCFG		sys_insn(1, 0, 12, 1, 5)
> @@ -1129,6 +1128,17 @@
>  #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
>  #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
>  
> +/*
> + * GIC CDEOI encoding requires Rt to be 0b11111.
> + * gic_insn() with an immediate value of 0 cannot be used to encode it
> + * because some compilers do not follow asm inline constraints in
> + * write_sysreg_s() to turn an immediate 0 value into an XZR as
> + * MSR source register.
> + * Use __SYS_INSN to specify its precise encoding explicitly.
> + */
> +#define GICV5_CDEOI_INSN		__SYS_INSN(1, 0, 12, 1, 7, 31)
> +#define gic_cdeoi()			asm volatile(GICV5_CDEOI_INSN)

Would something like this work? Completely untested (and build still
going):

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 6604fd6f33f4..7aa962f7bdd6 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1234,7 +1234,10 @@
 #define write_sysreg_s(v, r) do {					\
 	u64 __val = (u64)(v);						\
 	u32 __maybe_unused __check_r = (u32)(r);			\
-	asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));		\
+	if (__builtin_constant_p(__val) && __val == 0)			\
+		asm volatile(__msr_s(r, "xzr"));			\
+	else								\
+		asm volatile(__msr_s(r, "%x0") : : "r" (__val));	\
 } while (0)
 
 /*

-- 
Catalin

