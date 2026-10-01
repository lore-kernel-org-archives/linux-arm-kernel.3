Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A19CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pldxfBBUJszv2h95WSmrqJHgRj+RN0mpAukKCJ4Us+g=; b=G8RNRl642T4SdRA5tuCNMuLGRc
	igIxuHwRhi5B37HE9suEbAlm9KgSibwc6WHjfNPaS8BWloisCz1aV4vcdGn/2t8k2es4xBlYfwX/R
	tll2ts5W7YHeP0WnZUF5mysAegrJIw5QE62AHeF5OLZEeZidfjFZGD/xOA9EVYpcYV1cGtBhJRaPE
	rjH0Be0FY9ctslivNIfYCeOID4P+bFU8xFq7xYNTj7Cr+hsNCHbu0qp+MtyT2NVG1FNuYCGVYKWdd
	BdipYoc/do2kiWWe+SRRiS3kt/JaY11WforjEpNAb0FDiMkHekyH2MViMn87jcjtXwlLN76STZHbH
	/H3pMFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCK22-00000009mLA-3YNp;
	Thu, 01 Oct 2026 16:53:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCK21-00000009mKq-02Rf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:53:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7E9C740193;
	Thu,  1 Oct 2026 16:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204151F000FF;
	Thu,  1 Oct 2026 16:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790873596;
	bh=pldxfBBUJszv2h95WSmrqJHgRj+RN0mpAukKCJ4Us+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LvbSVCpaCUVkCAz7so8zugOU3NwB259fPKMks2lna/kHm0w4qsV+s9KRttiSYjuTA
	 YWqi1beCw/63VRYo0D6E/5KjdiQoKuWAd02GWBKBvUyHv2gNb5OpWIBZgmsUN+JO77
	 fPkC76O599BnM951u6Mz1XTKKEeAlR3aeV0Pw8AKnIPyIHfQuI6mwgdcokO0RvViPk
	 RdT41/5KVCI+WaVbKnShZrhW6IiaQJW0alniE3u/M/Mzo96jeQdxwX+5sWe3XE02nT
	 gHobMG1OESuD/ILEtZBbpiDZA1gbnXyxoe6/X/W0xeRaKXMcPnl4XzBCqJkfx7M4xQ
	 tOdXdnwJxlghw==
Date: Thu, 1 Oct 2026 17:53:09 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 15/15] KVM: selftests: arm64: Add GCS EXLOCK
 exception emulation test
Message-ID: <ar6PJqq3Ujaz-ibx@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-15-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-15-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:25PM +0100, Mark Brown wrote:
> When running in vEL2 ERET is emulated, this means that we must emulate
> the behaviour of GCSCR_EL2.EXLOCKEN. Add a test that validates the
> behaviour.
>
> As per DDI0487 R_WTXBY PSTATE.EXLOCK is set to the value of
> GCSCR_ELx.EXLOCKEN when taking an exception to the same exception level.
> As per DDI0487 R_TYTWB if on exception return to the same EL
> GCSCR_ELx.EXLOCKEN is 1 and PSTATE.EXLOCK is not 1 then the exception
> return is illegal.
>
> We nest handling of two UDFs to allow us to both observe and modify
> PSTATE.EXLOCK, checking that expected exceptions are generated for ERET.
> We also repeat the UDF tests having enabled fine grained traps for ERET
> to try to ensure that the slow paths are taken.
>
> We also attempt to write to both SPSR_ELx and ELR_ELx, again using a UDF
> handler to control PSTATE.EXLOCK. We do all this both with and without
> having enabled EXLOCKEN, though only for code running at EL2 due to
> framework limitations.
>
> For completeness we also inject a data abort from EL0 to EL2 with
> GCSCR_EL2.EXLOCKEN set, ensuring that PSTATE.EXLOCK is not set.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>

This all seems reasonable test-wise, but I wonder if the discussion around 8/15
might alter some of what's tested here?

In that - if it's only hardware that's doing the locked check then the SPSR (and
probably ELR?) bits might only be exercising that rather than KVM stuff?

It might only need a comment update though :)

--
Cheers, Lorenzo

