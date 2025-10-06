Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3716BCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 15:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGcuv8Yd9q2uyY+aUlzCadaLNPcWn0GaF5PiA+ShlYI=; b=YQi9Y5uA0vrc6ySC1oeg68x1KJ
	zWG79tRyqmUqgcyqSSuJAeudxxaVt8p24ohyMKqHCiCRnPV0ZJUgw3f6FFW01e5RRzCYYYxr4Komq
	aNeu9CeDiY4yYAbHjltRDXD1uSFkQRyePWvPSd4Euq1u1PEYSr0NW5gxN80YwC8+MS+0D/mlabiXT
	/rblzuNALaVs6LLgoRldp7kPctOmWOwhmHmaQElXtgDtlChASMpm9cLGEcK6gG2h1KB/aImeE+7Aa
	iW4hgchGoNaYScv8DygrGtzlxyTb7eoYrTctixc/ztvBDNLZhvUKed3NQl8hl00aWWlDGGX0LV4qI
	rjQANneQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mi0-00000000FA8-1Ljl;
	Mon, 06 Oct 2025 15:01:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5mhz-00000000F9y-0jdT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 15:01:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A1586053F;
	Mon,  6 Oct 2025 15:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E92EC4CEF5;
	Mon,  6 Oct 2025 15:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759762862;
	bh=PRg9QTHdBIQ2drBq4Jauhpal3A3q0Xroku6xft7iOEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ghD8fpiZsoXXJu9uoHHp6SN+bVL1Vz+pFOosG1v3TxPaC8aN6TsjsZXQA/60mCtJ6
	 XEcwlIVFTjDI/+5DzteTNePKVXs0L3MRU/dEYfN80EVa2uj85p9Pu0yX5vDS3NhnpX
	 9txbpPWiJ1HBrN15Xi8AYwUi0Q7spUqFcG/j7kqctqPSx1Of8MHdENllihszCYIPPT
	 3zEsxeu34QItDPb+izcWyc3wl375PUQcDQdFHREDx4Io84ucrxRYK6477xv3IYLMJh
	 /XZjjkC54p/EytjpOioxbPtpMF+Zykm+GPVpW/kTNSU64CX6jSOOcmgLAPmSVUAaCz
	 n2a8WrmSGTCIA==
Date: Mon, 6 Oct 2025 17:00:56 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix GIC CDEOI instruction encoding
Message-ID: <aOPZqM2xGIrPJH/d@lpieralisi>
References: <20251006100758.624934-1-lpieralisi@kernel.org>
 <aOPEXEx-QRv7v9A5@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aOPEXEx-QRv7v9A5@arm.com>
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

On Mon, Oct 06, 2025 at 02:30:04PM +0100, Catalin Marinas wrote:
> On Mon, Oct 06, 2025 at 12:07:58PM +0200, Lorenzo Pieralisi wrote:
> > diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> > index 6455db1b54fd..6cf8c46ddde5 100644
> > --- a/arch/arm64/include/asm/sysreg.h
> > +++ b/arch/arm64/include/asm/sysreg.h
> > @@ -113,14 +113,14 @@
> >  /* Register-based PAN access, for save/restore purposes */
> >  #define SYS_PSTATE_PAN			sys_reg(3, 0, 4, 2, 3)
> >  
> > -#define __SYS_BARRIER_INSN(op0, op1, CRn, CRm, op2, Rt)			\
> > +#define __SYS_INSN(op0, op1, CRn, CRm, op2, Rt)				\
> >  	__emit_inst(0xd5000000					|	\
> >  		    sys_insn((op0), (op1), (CRn), (CRm), (op2))	|	\
> >  		    ((Rt) & 0x1f))
> >  
> > -#define SB_BARRIER_INSN			__SYS_BARRIER_INSN(0, 3, 3, 0, 7, 31)
> > -#define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
> > -#define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
> > +#define SB_BARRIER_INSN			__SYS_INSN(0, 3, 3, 0, 7, 31)
> > +#define GSB_SYS_BARRIER_INSN		__SYS_INSN(1, 0, 12, 0, 0, 31)
> > +#define GSB_ACK_BARRIER_INSN		__SYS_INSN(1, 0, 12, 0, 1, 31)
> >  
> >  /* Data cache zero operations */
> >  #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
> > @@ -1075,7 +1075,6 @@
> >  #define GICV5_OP_GIC_CDDIS		sys_insn(1, 0, 12, 1, 0)
> >  #define GICV5_OP_GIC_CDHM		sys_insn(1, 0, 12, 2, 1)
> >  #define GICV5_OP_GIC_CDEN		sys_insn(1, 0, 12, 1, 1)
> > -#define GICV5_OP_GIC_CDEOI		sys_insn(1, 0, 12, 1, 7)
> >  #define GICV5_OP_GIC_CDPEND		sys_insn(1, 0, 12, 1, 4)
> >  #define GICV5_OP_GIC_CDPRI		sys_insn(1, 0, 12, 1, 2)
> >  #define GICV5_OP_GIC_CDRCFG		sys_insn(1, 0, 12, 1, 5)
> > @@ -1129,6 +1128,17 @@
> >  #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
> >  #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
> >  
> > +/*
> > + * GIC CDEOI encoding requires Rt to be 0b11111.
> > + * gic_insn() with an immediate value of 0 cannot be used to encode it
> > + * because some compilers do not follow asm inline constraints in
> > + * write_sysreg_s() to turn an immediate 0 value into an XZR as
> > + * MSR source register.
> > + * Use __SYS_INSN to specify its precise encoding explicitly.
> > + */
> > +#define GICV5_CDEOI_INSN		__SYS_INSN(1, 0, 12, 1, 7, 31)
> > +#define gic_cdeoi()			asm volatile(GICV5_CDEOI_INSN)
> 
> Would something like this work? Completely untested (and build still
> going):

I tested the GIC CDEOI code generated with GCC/LLVM and it works.

My only remark there is that even as the code in mainline stands with
GCC, it is not very clear that we rely on implicit XZR generation to
make sure the instruction encoding generated is correct - it looks
like a bit of a stretch to reuse a sysreg write with immediate value == 0
to generate a system instruction write with Rt == 0b11111, it works
but it is a bit opaque or at least not straighforward to grok.

Obviously the patch below improves LLVM code generation too in the process.

I don't know what's best - I admit I am on the fence on this one.

Thanks !
Lorenzo

> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 6604fd6f33f4..7aa962f7bdd6 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1234,7 +1234,10 @@
>  #define write_sysreg_s(v, r) do {					\
>  	u64 __val = (u64)(v);						\
>  	u32 __maybe_unused __check_r = (u32)(r);			\
> -	asm volatile(__msr_s(r, "%x0") : : "rZ" (__val));		\
> +	if (__builtin_constant_p(__val) && __val == 0)			\
> +		asm volatile(__msr_s(r, "xzr"));			\
> +	else								\
> +		asm volatile(__msr_s(r, "%x0") : : "r" (__val));	\
>  } while (0)
>  
>  /*
> 
> -- 
> Catalin

