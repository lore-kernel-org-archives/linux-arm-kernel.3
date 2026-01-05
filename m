Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7114FCD0424
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFzXHytXScL9ONW+TaNE/6VXjGjDzsMwQx2FGngkYMk=; b=z2NrvINdDyPvoUHqgtViz554Qc
	49Z6PWYZFuTQmlhgcv5c16+CtfhFTbQ42Kusx3ATqwXmKxtmxykhTx5avIq1jMsiysSGtWAk1+VJ1
	XYF/2yVRPFibJE9w/91fhr58nt7kYc804L/c+ZDy4UKe1E5FTs+v89HqIee79GRyRfxldzNDqHpQH
	neVQvFqxL4Ce6Y2Ys+29JZMw1Bcihze08chp/l4DbHzGFuYXkSsAcOdIfzt6Q0pmvF5XoB4LJRDTs
	6mvl70B5cXStTUsgv7hOgKJglwUI7+qJMWoYbUOk6IxbdFfZW19aZGXMzTylYao5uHteq81neXASp
	FR1q21YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXN-0000000CCsc-2bIE;
	Mon, 05 Jan 2026 22:58:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXL-0000000CCrl-1FI8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8A166011E;
	Mon,  5 Jan 2026 22:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DAAC19425;
	Mon,  5 Jan 2026 22:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653934;
	bh=za7YNt3enxyPJ4YpLu4GYj73La7HrT7JJAIZfsfnNqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mGk9/lU3+sIOcpG1lUUOhhj5clSduvESN/PzA7SkfjPjMMs0N+IM1m0lV32EYck9w
	 R5jRT2ogLnS1ovYkY++wM71KNkVgMKwgHkWv99OgCQyiuc+AenyBaI5M+LSrq03+zv
	 +/Lh8XOUbC0c+OOtMSbPXesrVfbubLc+7ZDwLHnTwx8Ad+N17e5NEJSkDL1Izy8bUj
	 4BurhbCbQl9ClVrX1M0gwFkfQABa1rTJPaH4BXR50xCOhfZC6+yO5a7AkuKBICTmSf
	 p8slZ1r1aI2JSvnyICLQ09QUn+rXrlgUOoAMf2IWKby92WusmAF20XVOIu2eNT3LtW
	 /xv6TBB2SmVOQ==
From: Will Deacon <will@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu: arm-smmu: Simplify with scoped for each OF child loop
Date: Mon,  5 Jan 2026 22:58:24 +0000
Message-ID: <176764815322.1453267.5338402258433264092.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
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

On Fri, 02 Jan 2026 13:50:04 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/qcom: Simplify with scoped for each OF child loop
      https://git.kernel.org/iommu/c/2026159372bb

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

