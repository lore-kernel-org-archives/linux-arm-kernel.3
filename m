Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CF9CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 16:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGNIh5htDF2hI87Ho84p+/Lp2+ZQsPYtdWr2zj9pSSY=; b=pkKNpeTMVP4g/fNN+Mp9F1bs+c
	V/DPkCoN+k15MsJiqc4sSYIKHoWn9r9+RaFJZTWbO4OfbwXSZIbGAOQHPoRgSl/FNto3+ZjBUtb9r
	YjCtpS7iHuMdJ0R+fjIOjH+kn/6cBt+sXqcG2UJWNidpol8GJOQtjwb6+8nB2bvCFuFfNTnnV8GJA
	iOsytNaQ5PwJeiRj+zarPK+7Etbuzz1L5O3IsXmr+Z7gjtLCpNLcJo5KS1+edGzVuORR5IAjw0C5Z
	4D1EBPwfVJiDXKYK1erYrPsYcU0OzfbUiSBtG0iysqKhjyShssRBqj/6ekIhF4tPKLilphUOdGgPJ
	F4+IOsig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGio-00000004Sub-2NTr;
	Wed, 27 May 2026 16:03:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSGil-00000004SuD-3wPr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 16:03:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55FB635B9;
	Wed, 27 May 2026 09:02:56 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABBAE3F905;
	Wed, 27 May 2026 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779897781; bh=9aWYw2Ah14kwgPI8Hk+rKnAnhntsKh/W3j7keCQLUYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbfTl/0P2ORJqDUfhfOk1zBM+esZIjrLwpPceD1IU4vaDdWwVfKOeNJnc5B4v64Rd
	 FRZlkDPHlLisd+4DkhDCY7ed473Cbx+9HpFDTy5NcrPAtxkHXmwa6ShgxkOdHjeezs
	 7avziFmaS1z4C+x6vEs2SdBAIP9oAN4kHe5YLOnM=
Date: Wed, 27 May 2026 17:02:57 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 04/18] KVM: arm64: pkvm: Remove struct cpu_sve_state
Message-ID: <ahcVsVGPtOmF0nIC@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-5-mark.rutland@arm.com>
 <9670cf97-b844-4029-b77e-25ade600e024@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9670cf97-b844-4029-b77e-25ade600e024@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_090304_029555_4E312C9B 
X-CRM114-Status: GOOD (  14.98  )
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

On Wed, May 27, 2026 at 12:58:47PM +0100, Vladimir Murzin wrote:
> On 5/21/26 14:25, Mark Rutland wrote:
> > -struct cpu_sve_state {
> > -	__u64 zcr_el1;
> > -
> > -	/*
> > -	 * Ordering is important since __sve_save_state/__sve_restore_state
> > -	 * relies on it.
> > -	 */
> > -	__u32 fpsr;
> > -	__u32 fpcr;
> > -
> > -	/* Must be SVE_VQ_BYTES (128 bit) aligned. */
> > -	__u8 sve_regs[];
> 
> 
> It seems that the requirement (driven by SVE ldr/str) is
> satisfied with the new sve_regs pointing to the start of the
> page.
> 
> I'm not sure whether we want to keep the comment (or perhaps
> enforce this with explicit checks) so that future refactoring
> doesn't lead to time spent debugging alignment faults...

AFAICT alignment has never been functionally necessary. The LDR (vector)
and STR (vector) instructions only mandate alignment when the relevant
SCTLR_ELx has SCTLR_ELx.A==1. For kernel and hyp code we configure
SCTLR_ELx.A==0, so there's no alignment requirement.

Per ARM DDI 0487 M.b, section C8.2.437 "LDR (vector)":

  The load is performed as contiguous byte accesses, with no endian
  conversion and no guarantee of single-copy atomicity larger than a
  byte. However, *if alignment is checked*, then the base register must be
  aligned to 16 bytes.

Per ARM DDI 0487 M.b, section C8.2.777 "STR (vector)":

  The store is performed as contiguous byte accesses, with no endian
  conversion and no guarantee of single-copy atomicity larger than a
  byte. However, *if alignment is checked*, then the base register must be
  aligned to 16 bytes.

... and in both cases the pseudocode shows that AlignmentEnforced()
depends on the value of SCTLR_ELx.A.

Given that, I don't think we need the comment.

[...]

> FWIW,
> 
> Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

Thanks!

Mark.

