Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C23CEFB808
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 06:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yodi5QudEP1UO/eSIBA4j6uIKhLhBFgpzekv80+iugE=; b=csyzbCSdwB0gpyUVEOTWV3iXD8
	Qt37wTTC4aVF6M+KrCGg77mkFKovC3qSvZH5BU2RgMT44mtz/eruoOn7PpCEk2CgaHWX3xRbuYyiJ
	kJPp8jeycF/9gZ+aL2v36/hi2IVqxjl7U6zBu7mXv/L3CchBCs83gkvaeGQUaEAxdBxLqnFxfzrkh
	16CcnAbgeaRE/3Ee4cF5ktv7hx6D0yVh5HndNQahyN61A9EeyIsVyPJP0pTCIqix0jQywPfAytJdu
	7ZPRzyYfj4A89E2ZQOLcDV+6mmQoyEsOJ2AYr+hNj4Gy8HcZLtUEkRbia1JD+SjYdgT/dBER6xKBx
	pNhH4w9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumHw-00000001Xsx-0obo;
	Tue, 24 Feb 2026 06:52:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumHu-00000001Xsc-2Sii
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 06:52:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D6DD4443E;
	Tue, 24 Feb 2026 06:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE8BC19424;
	Tue, 24 Feb 2026 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771915973;
	bh=aCu4SGTZ0u7PvY1QpTVV6+nX9QunCxrpSU1ytfQX0wQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qc5YGYUStAEoFm4R/vACZO7CmlUB7OtzCPVDthis/63rdRkb0x36arLCbf1FceUCa
	 KVb/9qRT5em4Qff50w0RGtmUbJziREpp596TVFs3LX1gEzGtPBpsyUELFU1LVH57Bq
	 AlHYyRRD2UMKv/N5a0xaPtPQdMiK1WFk9M7q9vXqBXyAO7T3GPitiRHBSCpiqDMbse
	 Bohia8HTR4/BE9qqYPwT73K8CTFXeAopfCPME3bphaKGUMcnKnX2Gy0Y9djGry7c5f
	 Z85mGC1xF9cfUYHIwRqPTt9IsnmAVwvWA0A/7lnb9iTRVdODW4LVKM6h3HUCF4ABvD
	 orCXkQBMpU7Fw==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to
 the msi-parent handling
In-Reply-To: <86o6lfa936.wl-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
 <20260218135203.2267907-4-maz@kernel.org> <87seasv11z.ffs@tglx>
 <86qzqbal69.wl-maz@kernel.org> <87pl5vvchx.ffs@tglx>
 <86o6lfa936.wl-maz@kernel.org>
Date: Tue, 24 Feb 2026 07:52:49 +0100
Message-ID: <87jyw2vdj2.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_225254_657871_95B333A0 
X-CRM114-Status: GOOD (  15.10  )
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

On Mon, Feb 23 2026 at 13:22, Marc Zyngier wrote:
> On Mon, 23 Feb 2026 13:02:50 +0000,
> Thomas Gleixner <tglx@kernel.org> wrote:
>> 
>> On Mon, Feb 23 2026 at 09:01, Marc Zyngier wrote:
>> > On Sun, 22 Feb 2026 22:57:44 +0000,
>> > Thomas Gleixner <tglx@kernel.org> wrote:
>> >> This rejects as you are building against an unmerged change (I assume
>> >> it's Lorenzos GIC5 stuff). I can fix it up when applying.
>> >
>> > That was against vanilla 6.19. I'll rebase on -rc1 to satisfy myself
>> > that this is still doing the right thing after the ACPI crap fest, and
>> > repost the result.
>> 
>> Ah. The other way round :)
>> 
>> My resolution is simple and it looks about right. Please note the
>> cosmetic changes I did on the way :)
>
> Yup, looks good to me. And yes, moving the include up is the right
> thing to do.
>
> I have another small change in my current stack that also drops
> DOMAIN_BUS_FSL_MC_MSI from include/linux/irqdomain_defs.h. Could be
> folded into patch #5.

Just resend the pile.

