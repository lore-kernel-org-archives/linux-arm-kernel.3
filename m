Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473C0C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEinb8x1n/52ikO4dgPpIDNXRcccL4tQe99OcpqrHQA=; b=daqc2zJtEw9OCdxNBqq5utMhn7
	Dz7vmsAVFIm9BusjuEwUKOX5md9Qk9GEwBP27pRjZQ06vXiv4nyQAQMty2THcG1K5Kp96Z7WXbs8J
	8dL4rtZ86k/THH+QC3xLTxnd0s1x094PRX5WdMunTknWvK8L3cwrI+frFXcxdfytLqvC+opf4HpMI
	1P6ziDWQ56t3xTgRdjJ1ytIoxMFbHP4R+s6AsnkZsCE7gDtg044kfw4sj8Mdj3d9quqzGhtQdWjjO
	MIaCvMa55ObPdZdMqgp80y5Is8DxeQ8UNv3DLh3kQSEMuLgmfdnjql3EVuLSR4eGxVLLBnU2vBBVc
	mpHNLa3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmegz-0000000CpzD-3w5d;
	Wed, 22 Jul 2026 21:41:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg6-0000000CpeK-2EYu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46F2E402A5;
	Wed, 22 Jul 2026 21:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A5DB1F00A3F;
	Wed, 22 Jul 2026 21:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756434;
	bh=EEinb8x1n/52ikO4dgPpIDNXRcccL4tQe99OcpqrHQA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J4D6ypM3TPGTNABv/hy3lXYHz1JJ9mUQaxzoPi1r8kH5TsAvIb8+y3Z6y2X/eyXM6
	 rJVzRJDuMdBmHLDCSH6R9PKI2Z7+5INC0C1B2P8Ili1m5AjSHWrhRcq071ezmTtJ1j
	 vjpMzq0ge7hRviDfdBr3wNt+oJHnqU6h08geXPitkeEt+hwuzTFc3CgQRPljc7LzAe
	 jHxOxVMA9SHmwFS6Hmz1Vo2ZFoeS33z3sbQdYVUoucbMj/KpFnZdAfD+EUR92zGKRU
	 6ZiDyhXlGUB03EXQoCYEhU8wsjJdqt95ehEovB8WZMhoh6s9HrCi4ECs66UlFkhIJr
	 xyaLH66dJlN+A==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shameer Kolothum <skolothumtho@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	nicolinc@nvidia.com,
	jgg@ziepe.ca,
	joro@8bytes.org,
	robin.murphy@arm.com,
	nathanc@nvidia.com,
	mochs@nvidia.com
Subject: Re: [PATCH v3 0/2] iommu/arm-smmu-v3: Fix Tegra241 CMDQV CMD_SYNC use-after-free
Date: Wed, 22 Jul 2026 22:39:32 +0100
Message-ID: <178472672974.2884042.6708017212584302884.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260629094106.251694-1-skolothumtho@nvidia.com>
References: <20260629094106.251694-1-skolothumtho@nvidia.com>
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

On Mon, 29 Jun 2026 10:41:04 +0100, Shameer Kolothum wrote:
> Changes from v2:
>  https://lore.kernel.org/linux-iommu/20260611084205.686559-1-skolothumtho@nvidia.com/
> 
>  -Addressed feedback and picked up R-by tags(Thanks!).
>  -Use explicit type casts in devm action callbacks(patch #1)
>  -Add Cc: stable to patch #1 as it is a pre requisite for patch #2.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/2] iommu/arm-smmu-v3: Manage teardown with devm
      https://git.kernel.org/iommu/c/2bd22a0d4050
[2/2] iommu/tegra241-cmdqv: Fix CMD_SYNC use-after-free on teardown
      https://git.kernel.org/iommu/c/9ff145a25c5c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

