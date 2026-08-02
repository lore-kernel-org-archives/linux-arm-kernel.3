Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66293C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 12:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOsdimgk1hcuikqltrmpauaFiHs4qkbEXMgzVNkUqh8=; b=hugTC18k432iINKxoRcIdY3HFN
	n0mHv+y3X/IpHqsWzAgCqWjwVQ538JA/9qCQpabiulRa6v+Yj31p9CkFI3QFRQhqXPOksP9cIM+KS
	Y8mCUhOSJ05fS4kvNg93znCIQXjl5TIUb2WgoGTGkFTZ/YnSW21+ggf0cWOL7O8bqLclLye02tOYX
	YKO3JQaXKoscOLnyCFwwvLybt2/muJ05XJ7wyWQX5oLiPGZmaKpMrAaUn2/hQE/1RbYIi4eNMG9qs
	fh73+5cAXvnj07BiE5p/KXkzk448x5Se5aHSzOuP7gmr2OeIA/SbhWnBHOo1RvMh5RKPZcmma3cLc
	EDZ+Ozsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV40-0000000FbmK-3VXX;
	Sun, 02 Aug 2026 12:13:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqV3z-0000000FblK-3rTz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 12:13:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACC0643B6E;
	Sun,  2 Aug 2026 12:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062C01F00A3D;
	Sun,  2 Aug 2026 12:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672787;
	bh=HOsdimgk1hcuikqltrmpauaFiHs4qkbEXMgzVNkUqh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XegY3zryDTYzLZ0sDrgsP4O1R2SKJfswe4uKlJx/7cjZjSR0xCmopSl2xpSpf1xlZ
	 eMyOCHGXhg7/JkMoM3zycz/9o0RA7ExW27aBHsrmL7bJ/bcOZJ+YN9ZDz8pVrBioo6
	 dgHcf63OzfYQTputEaP3uRD8TCkkrUvDQ/3qEFkR4LpQRnPp4ovVgiw6gk8Z/FAL/g
	 hsmHrdecW5pl5hV1VXlEfUSANolTBZABUh3sbw6AnPW2OaGxzmLsvrKYOKrYG0nrR9
	 T19cJkf/OsMD5rcHxrVQskcx+Bj8BdSK1qjsvJZ4bCl+Sy/N4zgn1eBGKS/P5vcSK2
	 dudCmwe3C+8XQ==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Pranjal Shrivastava <praan@google.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Convert to use atomic poll timeout
Date: Sun,  2 Aug 2026 13:12:28 +0100
Message-ID: <178566514482.939612.15682351054124522231.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260728211123.1059708-1-praan@google.com>
References: <20260728211123.1059708-1-praan@google.com>
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

On Tue, 28 Jul 2026 21:11:23 +0000, Pranjal Shrivastava wrote:
> The arm_smmu_write_reg_sync() helper is currently implemented using
> readl_relaxed_poll_timeout() (that relies on usleep_range() internally)
> which becomes a critical issue when used in the gerror irq handler.
> 
> If the SMMU hits a gerror and enters Service Failure Mode
> (GERROR_SFM_ERR), the gerror handler calls arm_smmu_device_disable() in
> hard-irq context. This becomes a problem as arm_smmu_device_disable()
> inevitably calls arm_smmu_write_reg_sync() which might attempt to sleep
> inside a hard-irq context.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Convert to use atomic poll timeout
      https://git.kernel.org/iommu/c/eced8058c82a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

