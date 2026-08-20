Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5327BC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVIgXblTsaIe3y15n7rCNuIfBDjmi/AlXg5klh4CbPU=; b=3cw991D1n9McXFJNDVjoJN2lvc
	4dc/MeUeVkYAfftlb02GbSK6qFFqwi0azBK4K+HpbFfq5YtGf0iHGsaS1JGi+NMB8Tw4e1gDlYvSm
	jVaJYGHf5WJCRyuUvxyoVVOjjMm4Be1rMGR1A5fmhku+1fTXcqVjwBwfQr8eFjhaN3WLdZJOLK4C3
	GuKhJQhdhgl6uv109NpaNdALwVi2rXoSjio1TLoAcHqklxM5i5oett8FREMElXRzcsz0LpQOmHnEO
	INczv0Xfhcu8j14di38nbL+C2eeyawJdl4p6ai6hngKTKBv1dtFyuZdCbSswgj4HLMF7HTb2o4OP8
	rWpbZ9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2fx-0000000Bbk3-3vGQ;
	Thu, 20 Aug 2026 13:19:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2fw-0000000Bbjr-2MtF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:19:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED4444150E;
	Thu, 20 Aug 2026 13:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB60B1F00A3D;
	Thu, 20 Aug 2026 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787231959;
	bh=CVIgXblTsaIe3y15n7rCNuIfBDjmi/AlXg5klh4CbPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f9RAfe4YOXv158IuPNCYvPKxGpwhZ8WdMakINlo2uqVRTGXUH6kVcWqKwFn011C/Z
	 VWX594hRJZLoKgTKiV8xbGbGQtYuSrjeMkQH/pVcHm+pJKVFdsyjTtXt5pVUTvlpvv
	 gEPTkeBavQDRG9An8ywVhwc4VlIp4lu5HyCQ0tTYNYAWNp5SkmItqHyuz21ylb89NY
	 sO9mEo2I1U+qD5/1qutaXxr6+JaRm2JAsnsezaMCx8+QI61AqPI5vpTdpFBIwn30BB
	 Oidd5Kb7swmUZQygrKbNeCYKZI+Zzg/B8w/CJjrWzwLUCRUzWfulEhb1NR8g1afeIc
	 DuptOWkNTgkbA==
Date: Thu, 20 Aug 2026 14:19:14 +0100
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 06/12] arm64: assembler: Remove endianness helper macros
Message-ID: <aob-0tByMtlbIaxQ@willie-the-truck>
References: <20260811140132.22778-1-will@kernel.org>
 <20260811140132.22778-7-will@kernel.org>
 <a16ed8a4-28cc-4270-a257-b9268ab9e9ea@app.fastmail.com>
 <aoGGCqMdb8iZvZSM@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoGGCqMdb8iZvZSM@willie-the-truck>
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

On Sun, Aug 16, 2026 at 10:42:40AM +0100, Will Deacon wrote:
> On Tue, Aug 11, 2026 at 05:04:43PM +0200, Ard Biesheuvel wrote:
> > On Tue, 11 Aug 2026, at 16:01, Will Deacon wrote:
> > > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> > > index 87a822e5c4ca..8951ce693552 100644
> > > --- a/arch/arm64/kernel/head.S
> > > +++ b/arch/arm64/kernel/head.S
> > > @@ -138,8 +138,7 @@ SYM_CODE_START_LOCAL(record_mmu_state)
> > >  	b.ne	0f
> > >  	mrs	x19, sctlr_el2
> > >  0:
> > > -CPU_LE( tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
> > > -CPU_BE( tbz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
> > > +	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
> > >  	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
> > >  	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
> > >  	csel	x19, xzr, x19, eq		// clear x19 if Z
> > 
> > There is some more code that can be removed here - see
> > 2ced0f30a426c7301350681f838344d5aea711e3
> 
> Good spot, thanks! I'll do some more surgery at -rc1.

Looking at this again, I'm not sure we can remove much here. I think we
probably still want to force little-endian (i.e. clear the EE bit) if
we're entered as big-endian. I've changed the following EOR to a BIC
(see below), but I think that's about all we can do?

Will

--->8

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 8951ce693552..8dfb9db3722d 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -145,12 +145,12 @@ SYM_CODE_START_LOCAL(record_mmu_state)
        ret
 
        /*
-        * Set the correct endianness early so all memory accesses issued
-        * before init_kernel_el() occur in the correct byte order. Note that
-        * this means the MMU must be disabled, or the active ID map will end
-        * up getting interpreted with the wrong byte order.
+        * Force little-endian early so all memory accesses issued before
+        * init_kernel_el() occur in the correct byte order. Note that this
+        * means the MMU must be disabled, or the active ID map will end up
+        * getting interpreted with the wrong byte order.
         */
-1:     eor     x19, x19, #SCTLR_ELx_EE
+1:     bic     x19, x19, #SCTLR_ELx_EE
        bic     x19, x19, #SCTLR_ELx_M
        b.ne    2f
        pre_disable_mmu_workaround

