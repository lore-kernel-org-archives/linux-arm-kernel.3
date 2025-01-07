Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A029CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzP22F995dnUC9OBPfwDm3k2YQwjH+JFEHdHvXGmmiw=; b=LKHAYWHzcuozfQLL67dzt2KS+r
	3nH9umDDUl1XzZFm3Jk5Wc3DXO2b2PlLtURwHPMAYizgSITr/J6v1aEbEqtT2d/7n3EZJ0p2vHl7s
	uZI2z3RbcxZMkPwa4K9Bwv2tSR+uHZ4E+vqMDi1Iodklckcb97xWth0Dix0/CWUfJetKR9Z+n4NC0
	Wi3ZPQjKdCF4TJilN7C+zCIakLrnw5hVCyZwRaKrqmVgj+WwAEGowOzxboL5r2W2UZ4wk0S9fBcfR
	wj7mSENVc5/cNhkBeDE2DNt1xPs5LesV48ccbH4lf5XEiZXpyWm0jXP6Pz6m5wd6QvMQqjmiAXXGs
	nTNcYQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVD7s-00000005mlA-3zo1;
	Tue, 07 Jan 2025 17:12:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCfP-00000005gTA-3iWp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 16:43:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 49BDA5C012F;
	Tue,  7 Jan 2025 16:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADAFC4CED6;
	Tue,  7 Jan 2025 16:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736268175;
	bh=baWwtF1w+geq+KjvSOWUWaiuN8aV6ywKcKbSE05GCq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Mtt3ghXB5IecyfyJLJHtV7Unz6mbhvjGhTJ+W3O3LKhKsYiLqGvGfyuNUsKgGbN1w
	 gK85tjzhugigyHQMiMzLBBU9UugJBkLHYEvgFZJMlwt2noxIdKjB3KmlickGp3vJKY
	 2RP2WLTk0lJECxowFX5BOpEcHLse5IefNOj5ZP/3bQGGzsB8gIQd5OiMG66pBMWN5R
	 MJBPvtcLAjlUokaXBgq1S4NmDfJLdSF15W1KlSdcTy9ODAQksfiI5OQr3/qnn4Xq0j
	 XD6z+vdnel5O9AvExLarBUgv6ymUTFeyHc92uVGNcOVWfSgPKtUQG6AktbL1yu87cb
	 bpAeqPOlFmc4A==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux.dev,
	Rob Clark <robdclark@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Mostafa Saleh <smostafa@google.com>,
	Rob Clark <robdclark@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Joao Martins <joao.m.martins@oracle.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v11 0/4] io-pgtable-arm + drm/msm: Extend iova fault debugging
Date: Tue,  7 Jan 2025 16:42:40 +0000
Message-Id: <173626454505.2884304.2651538990179658967.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241210165127.600817-1-robdclark@gmail.com>
References: <20241210165127.600817-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_084255_964518_947FF91B 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

On Tue, 10 Dec 2024 08:51:18 -0800, Rob Clark wrote:
> This series extends io-pgtable-arm with a method to retrieve the page
> table entries traversed in the process of address translation, and then
> beefs up drm/msm gpu devcore dump to include this (and additional info)
> in the devcore dump.
> 
> This is a respin of https://patchwork.freedesktop.org/series/94968/
> (minus a patch that was already merged)
> 
> [...]

Applied io-pgtable changes to iommu (arm/smmu/updates), thanks!

[1/4] iommu/io-pgtable-arm: Make pgtable walker more generic
      https://git.kernel.org/iommu/c/821500d5c597
[2/4] iommu/io-pgtable-arm: Re-use the pgtable walk for iova_to_phys
      https://git.kernel.org/iommu/c/d9e589e6ad73
[3/4] iommu/io-pgtable-arm: Add way to debug pgtable walk
      https://git.kernel.org/iommu/c/aff028a8192d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

