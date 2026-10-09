Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DF8CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYQTo7SNBQvmwYB7sCqA9G9P0Xu8uvqQ8jOhaY+aihs=; b=oTHBhXA7UtB3RYz8yalWIfNH2E
	ODQ+y8gZgbzVqImM+sfEkm1m73sELSLuU+P6lMXIBBYDaD1JcAhHQEKPWNM7rdsUEcSGAhe1BB3tO
	pMckv9Rkr8xX2BKQ8vse234vDf4BVQViyTIa+3KjOL5Gr03ZuQHL9LHs4vH9FSoCDnrw9Xk5OuTRQ
	/+aINt62vwfk8Aa4LbDN9wvswQUCGF9UIw76OWl/+ELLTND2Myq3PcAIJLOgzyn1OAPZuPCtPrw3A
	fxWttXNhYetHHiW1RPAuLWN1oB641vM4lSaaGRNGcoJc1AWi8GaVgj09HJVxE0PyygnaMKiQD/79A
	x/rVlH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDV3-00000006emv-3veU;
	Fri, 09 Oct 2026 16:31:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDV1-00000006ema-3Qbr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:31:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA7EF1D14;
	Fri,  9 Oct 2026 09:31:04 -0700 (PDT)
Received: from gentoo-vm (kajpuc01-mac-mini.manchester.arm.com [10.33.9.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB3983F66F;
	Fri,  9 Oct 2026 09:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791563468; bh=lb0DeCf/KMhA4VhiVFBNKtdZtnLIGHb27hHQyGK+1W0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m9UDeTbFdfgXuDllcP0z+USXUbNALllDc1DrHcUzL3liG/CBnASY0XhUCXBbbzmAO
	 Kz/iBNI9RzRw2LPWu/iPYZUBCVHY4dZzx62fu9BxbmdsvbTZEg9hkbFRFoqAx4clpt
	 QWOeK+lXzn91zzicw8rbyu1fp88aCGpscI7oibxQ=
Date: Fri, 9 Oct 2026 17:30:59 +0100
From: Kajetan Puchalski <kajetan.puchalski@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jing Zhang <jingzhangos@google.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 03/10] KVM: arm64: nv: Don't loop on AT S12E{0,1}{R,W}
 with an invalid VTCR_EL2
Message-ID: <k6hsxo35ou3b5bcdo5xiew56zo25c4dmxqocnxszjvuqd7ct44@owruwfstprrh>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
 <20260928152507.2116110-4-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260928152507.2116110-4-fuad.tabba@linux.dev>
User-Agent: NeoMutt/20250109-134-7b7c50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_093111_904083_3DDC0177 
X-CRM114-Status: GOOD (  13.77  )
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

On Mon, Sep 28, 2026 at 04:25:00PM +0100, Fuad Tabba wrote:

(..)

>  	stride = wi->pgshift - 3;
>  	input_size = get_ia_size(wi);
> -	if (input_size > 48 || input_size < 25)
> -		return -EFAULT;
> -
> -	ret = check_base_s2_limits(vcpu, wi, level, input_size, stride);
> -	if (ret) {
> +	if (input_size > 48 || input_size < 25 ||
> +	    check_base_s2_limits(vcpu, wi, level, input_size, stride)) {
>  		out->esr = compute_fsc(0, ESR_ELx_FSC_FAULT);
> -		return ret;
> +		return 1;
>  	}

While at it, we could also add a check to validate that the ipa being translated actually conforms
to the configuration. As per the Arm ARM (R_DRRZZ):

> When all of the following apply, the stage 2 translation IPA size check generates a stage 2 level 0 Translation fault:
> • Stage 2 translation is enabled.
> • The input address to stage 2 translation, whether or not stage 1 translation is enabled, is larger than the IA size
> configured in VTCR_EL2.T0SZ or VSTCR_EL2.T0SZ, as appropriate for the IPA space.

Currently we just clear out the upper bits of an address larger than the IA size and proceed, but
the architecture requires that to cause a L0 translation fault. Not that it's a particularly common case.
That is to say, I'm suggesting something like the following:

+ if (input_size > 48 || input_size < 25 || (ipa >> input_size) ||
+    check_base_s2_limits(vcpu, wi, level, input_size, stride)) {


