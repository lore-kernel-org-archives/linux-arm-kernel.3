Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA1BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/cNxTnvpnGt4C/Q5S/zKa1rB5jBFMIQb9v0xLmzsEI=; b=XeLOo3zCPpWI2LaT7ZUSU6LskF
	iD+vctQXEmv/aoMMGaCbsdULZIR1fXfDAzdsYf5w+Vw4Da3/pw8TCyuW2/uEbOzAQacjvGxaAdjVB
	NU1CzofjoboBQTahSnVMWCNjO+IG+4hiDAwX6K40Nb9uTtHZQVD27GvXDNi+ut3D1a593pragCN7N
	eTmIeEuSepUsufrg/irir1jPlBI73DrM56gsXEn+8Q9iROB9bkVvSVZMrJfxh5Nm2Wg7VoS5BV/UV
	PJ1/fspm6DGdEcUk3oz3BUrhp5MZvpZ/sA9PsOdaJLyZfunEGWHfXZDdtHFLCV2zb7Y9P3/LBzeY7
	gPxOw84g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu53-0000000Chld-4963;
	Wed, 17 Sep 2025 15:28:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyu52-0000000Chkh-2UWt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 086D5601ED;
	Wed, 17 Sep 2025 15:28:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB7CC4CEE7;
	Wed, 17 Sep 2025 15:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758122903;
	bh=tCpYKYOs1RRFEZTeEQBT6Jf93AtipOf9WVQbNEp0FSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlsKh/KOWTz9EJsOhxbcsQD1AonOuNxGcDYCaLEvof0go8Kii2EdkTTE3cwzPY4+x
	 pezqfTuKvi9Fyq8mgaea4SqDfa9UD6PRx+EjdXTuYIXRZBRf44v2XLveKJsGGoCqRP
	 602qHH66J3aZQttpSl5FEe7O1QIUSnuUChjwlwFkG9xvRbSnJopQl9bpq+fWTNqDWl
	 PXwste2mqnB34TEm4tS16177xoqY7yOlcrmkPIyBm5rty+gYZd+0D1YEz9+J4mt7UX
	 2uF+bsk4wVK8zl+k1Sax14G72QagFZhjpimL4OyCtSA/RpByUaOKLlD3Lr0gs92s6v
	 hUbwmgbk6ZzcA==
Date: Wed, 17 Sep 2025 16:28:16 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
	anshuman.khandual@arm.com, robh@kernel.org, james.morse@arm.com,
	mark.rutland@arm.com, joey.gouly@arm.com, Dave.Martin@arm.com,
	ahmed.genidi@arm.com, kevin.brodsky@arm.com,
	scott@os.amperecomputing.com, mbenes@suse.cz,
	james.clark@linaro.org, frederic@kernel.org, rafael@kernel.org,
	pavel@kernel.org, ryan.roberts@arm.com, suzuki.poulose@arm.com,
	maz@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v5 0/6] initialize SCTRL2_ELx
Message-ID: <aMrTkLhLOhas8Viy@willie-the-truck>
References: <20250917145618.1232329-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917145618.1232329-1-yeoreum.yun@arm.com>
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

On Wed, Sep 17, 2025 at 03:56:12PM +0100, Yeoreum Yun wrote:
> This series introduces initial support for the SCTLR2_ELx registers in Linux.
> The feature is optional starting from ARMv8.8/ARMv9.3,
> and becomes mandatory from ARMv8.9/ARMv9.4.
> 
> Currently, Linux has no strict need to modify SCTLR2_ELx--
> at least assuming that firmware initializes
> these registers to reasonable defaults.
> 
> However, several upcoming architectural features will require configuring
> control bits in these registers.
> Notable examples include FEAT_PAuth_LR and FEAT_CPA2.
> 
> Patch History
> ==============
> from v4 to v5:
>   - using .ifc in set_sctlr2_elx
>   - change (re)initialise position after SCTLR_ELx
>   - add docs for SCTRL2_ELx
>   - rebase to v6.17-rc6
>   - https://lore.kernel.org/all/20250821172408.2101870-1-yeoreum.yun@arm.com/

Sorry, this is a really pedantic nit, but please can you fix the typo in
the subject if/when you next post this?

More importantly, as Dave says, I don't see the point in merging this
until we have a use for the register. At that point, your patches can
hopefully be a prefix of the series that uses it.

Will

