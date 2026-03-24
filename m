Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA3FF54ACF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq6WAFvnaf+mBwZ+ONGh5jXcVA8EYCETPqdRzFFZaSE=; b=k14aMGtDn2qbFnSN71jsWTBhFB
	HRoJTw0Tdbn+dOdSaEWdPWiNPznRirU6vN1bVxm3x1/qYFKVK2WGy+eaKmvMkN3A84L9iy5AjQ7gH
	A5b2i5MkbNqyO8o+J2DXEad47mQsMxxvTaVktQYu6C0VjBPVu4NCCrg+d3X3y8/i7CA64X0/3uein
	+KKyXMiSqqelIxFFUvc/lCv/UU/e7fsnTubBzDHRXRVFdNTAkVbeeuE2QCLJwgTCoaMq3LBok7UEF
	2x5B1hm74gJdWpDD4OyEjHpN7vCBYffYLsCUgVqO+vGIHsjUUprpCfL3d78VxaNFYo8bvaUKkgiUf
	N6rwHdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53NO-00000001j3a-0GWe;
	Tue, 24 Mar 2026 15:09:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w53Mz-00000001iuL-2Sxm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 15:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7D1860123;
	Tue, 24 Mar 2026 15:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF59C2BC87;
	Tue, 24 Mar 2026 15:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774364916;
	bh=IH2XxdQm/+/OqmCcBXugtqi7WO71IXZONI8fSZ9YkcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2D7GdFqjAyEAY5wJEkAPVWAtu1GKYT8mQy/sIT6UpclZiK/ptU3Zo0tnfFDhVN9k
	 4gPS0PItjdMtHcB+L+OXd7RPosL6YhV00NVTDiGzX4GAh+JsEu252ECUs9IJAdgBpt
	 AIPlD0eaPl1O5oTArMg23jjE8rl4H7+oCWM1ttZzwW7eGPpDNhxYiJAD+jTV9tk6FO
	 r5kW8JgFR8AEJQtWURb0BxVmxgXkVu09XFBcpFXob//lcxfqqJL6g+9cynQjFZNTji
	 V3DnvXA9l5UL1bCm3ncPbYyG8sw99yM2lBwmVlVKnp/YX5jDBl36QFGpJjIIgrIHlR
	 nq4upHbDAPf2g==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	kevin.tian@intel.com,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	joro@8bytes.org,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eric.auger@redhat.com,
	skolothumtho@nvidia.com
Subject: Re: [PATCH 0/2] iommu/tegra241-cmdqv: Fix initialization and uAPI related to HYP_OWN
Date: Tue, 24 Mar 2026 15:08:13 +0000
Message-ID: <177436107597.1856788.11362232309690054704.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773361875.git.nicolinc@nvidia.com>
References: <cover.1773361875.git.nicolinc@nvidia.com>
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

On Thu, 12 Mar 2026 17:36:33 -0700, Nicolin Chen wrote:
> Eric and Shameer found a bug in kernel driver that supports_cmd is set in
> an incorrect order related to the hyp_own finalization. This results in a
> unnecessary command filter in the host environment that sends unsupported
> (non-invalidation) commands to the SMMU CMDQ.
> 
> Also, Eric pointed it out that the requirement of VMM wiring HYP_OWN to 0
> is unclear.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/2] iommu/tegra241-cmdqv: Set supports_cmd op in tegra241_vcmdq_hw_init()
      https://git.kernel.org/iommu/c/803e41f36d22
[2/2] iommu/tegra241-cmdqv: Update uAPI to clarify HYP_OWN requirement
      https://git.kernel.org/iommu/c/9dcef98dbee3

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

