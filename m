Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0B0C55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ume27hYtZmliUEfOmZSy3B7vRgSoVATVO1vURK6pOyk=; b=HvBeig9hAiZO5bANZiLQfvR2cx
	v+YM/tEf1rv01TXV2XrOR0zNG1J5a7SGLpGM0U7W+4BF8ojZS5Dbv576yD0WxvyoJ/KZXC6KOxZKJ
	uVJfA1cwglfec81H1hf6B+XDDZO0Dp507zSWfgQF/0IiwLi8NbksuNej+eoQJvJdVuuIBngUGl8KY
	0LZrr/70jBEx1BkA4JWk2M2sWjNZ7AxTL1uhJWgDg4FWgaF6koLINcjRvaqE+gBS01DPlNm5LpLuD
	zwnUuq4LA89srEKHhwpAf5cSpf4xYaYZu4Hto4kr0Ynhy6ldH5I6iDpaHeOJ2IPmlYF8l+8N/Tzsf
	YAsz9dWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV48-0000000Fbso-0SLh;
	Sun, 02 Aug 2026 12:13:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV44-0000000Fbq3-3zed
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B332A40695;
	Sun,  2 Aug 2026 12:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EBC1F00A3A;
	Sun,  2 Aug 2026 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672792;
	bh=ume27hYtZmliUEfOmZSy3B7vRgSoVATVO1vURK6pOyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RkOhPPKB6u2i4p+F7nWexnh0pAH8cc3xFSfFKa0bL3ggBCmgtLH6BYUaleMvYo73W
	 6q+zi3Il5hGrolNigznNDZ1FF36hxcS5Gzh5nEaWb8TGE+BxcLmETS2bmeRkEOGzRd
	 9CGsySwhHaJ01ffaiWgGjl8CfZeMv3seJp+iSyz6UcCug9yXvZb3KR+MHpKKpDykr/
	 sFdLhYDEefUjtiSkFGbNZGdb5L2NTrq9RCCQq+s8wLHaPqh/yqcJRzi47Z3pmrCA7b
	 WyR65TEuv1xpNBQBVfKXS7/QUGXtMrpw7GEtCR2soF5j9RKpcJEbtVyBw6x6OsW9Pw
	 UuCq7Ql45ZC0A==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	joro@8bytes.org,
	Robin Murphy <robin.murphy@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	jpb@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 0/2] iommu/arm-smmu-v3: Fix SVA vs. HAFT issues
Date: Sun,  2 Aug 2026 13:12:30 +0100
Message-ID: <178566509348.938932.16551878749567703264.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785153415.git.robin.murphy@arm.com>
References: <cover.1785153415.git.robin.murphy@arm.com>
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

On Mon, 27 Jul 2026 13:03:27 +0100, Robin Murphy wrote:
> v1: https://lore.kernel.org/all/878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com/
> v2: https://lore.kernel.org/all/cover.1784814923.git.robin.murphy@arm.com/
> 
> Further to v2, work around the contentious CD update.
> 
> Thanks,
> Robin.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/2] arm64: Add override for MMFR1.HAFDBS
      https://git.kernel.org/iommu/c/91038c83a250
[2/2] iommu/arm-smmu-v3: Add HAFT support for SVA
      https://git.kernel.org/iommu/c/f99d3b4bb095

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

