Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0649CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQqY0UL2nLjc4RrriwL51KFOc4p6BErL51PZlbNU1kM=; b=tnJgbeqEmaItOePUe8d0zOHsfj
	dbgqPC15nZiGnNUNG6XO+Zh/Qj0/0hexbQaAPRs+Slorw79oCwefrmn3R09r3IAkWzfLKADFYqkjF
	XX23KdkzCRrRm7RjvzmY4Ogz9czR8ph1Kw2pM3YLmDUmYAHMTS9PJa1HmDyH9goIbDYMc/FUEgKi+
	j757wqVqi83hwbyVPtb/2kE8H5p7BFt+j6wdc5KwVaMSIpwao2tZgwH4hegpNOaRZYy4nJE24BJvS
	c79qJ/+pxOS9rY6t0qQa/6sGRpeBrWTrFR2Z+XaK405uxmx/qh26l7mKg0u5Ft6j48JurHvNKUUYq
	xoOXvEOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMJU-000000021ac-1K3E;
	Tue, 19 May 2026 15:24:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMIh-000000020wm-3XI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:24:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EE3C60224;
	Tue, 19 May 2026 15:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53394C2BD00;
	Tue, 19 May 2026 15:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204247;
	bh=T2/UZ6X0oL5N+IpYiiuiP8No68KS+6FoVP6cqqxB9Lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d8es0zpGRVA5bOQn52Ey9+FnokqoG31xtshO7rf2q9VPQ2q3bmUUG1mcJePKSo4c/
	 ydaM9jhSVHOaZYM83+BggOigk3JPqr6lUQtjVSssR+HS5Mb5g/E9y0EwRJJxo7HIa3
	 IPNHj4CnsjghaiSbpL4uSk44+kZ+R+5kJSFISYSXf7upOvLKA5lEkHjVy9ncml9kQW
	 h8cE9VK0MNVxFlpSAdxYig+gQO1FtwkE4JUvhGT2gE0Bfzh4ccrmlWBBkYBRefwkEl
	 PHz5imCLjUxLiPGstfQy7rYVaDF/DxfjSKQAt3T7KuuGUUtyvUZ89lU7z3Fo/mQz1b
	 p3F9zj7SWAwSg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants
Date: Tue, 19 May 2026 16:23:03 +0100
Message-ID: <177919680700.851863.10253442471292780349.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260519074059.61405-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260519074059.61405-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 19 May 2026 09:41:00 +0200, Krzysztof Kozlowski wrote:
> Many of SMMU on Qualcomm SoCs come in two flavors using the same front
> compatible but a bit different fallback:
> 
> 1. For application processor, usually without any controllable
>    clocks,
> 
> 2. For the Adreno GPU, with some controllable clock(s) and using
>    additionally qcom,adreno-smmu fallback compatible.
> 
> [...]

!! Please note: this conflicted with the Glymur GPU bindings update. That
   was trivial to fix, but I've also queued an update adding
   "qcom,shikra-smmu-500" which you may want in your list of platforms
   where clocks are disallowed?

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: Constrain clocks for newer Qualcomm variants
      https://git.kernel.org/iommu/c/75949eb02653

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

