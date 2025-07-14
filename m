Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD74C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 21:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+LwWIr3Jj5pUkaCWTkW6zVZ/mYm+/WqBxWcLl9BzHZ8=; b=x0HHdVQLxAQDKxiVjWha9Pyd21
	EewL1EhJLnQqsnCLu1C+1o9Wge46JpGS7bdLs4zdxeSLM3LkZU33vkOoEUo8410fWvzXqMmBouqLg
	gdmmLS8/ZzCaWa2h+C2PONHv56QXxKD6CdzZPDlPcQfMXrJo/BdTQ70Rn27gStQLJghrQ5pW6o/Ep
	Jc6V+oX1JeiNh4+ufvJKhsIrcTej9mwkpqeN9AM0+uPh1mSDMWAKtebzb9R4JAT2BODE46n/yyAJj
	ZkVkXAeNfEX2S0NsCseQ6J+ogEGdDQd3uVE2s7yEm+xHmN1RsqBlMdUJuaWDsSbidaB0dWSPZBAOp
	UhRsZDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQHi-00000003GSu-2Zj4;
	Mon, 14 Jul 2025 21:00:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubQFG-00000003G8C-22yF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 20:57:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B1AD0A56FB7;
	Mon, 14 Jul 2025 20:57:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA8BC4CEED;
	Mon, 14 Jul 2025 20:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752526673;
	bh=FoXEiIKsEnSTIC3b0/xiL8qZVHlrN7UH18Be1tRtm50=;
	h=From:To:Cc:Subject:Date:From;
	b=ej+Cv/xybP3w3Xmx9ukBwO9o6Iy+dWNANcIqr8mh+YFSOl9yZWioLJ5nMyROR1cnW
	 9V1Qs9ktFnfUZy/pEzRra40OFupdeixbdTAsgAQ3MWB0kzRcl3vLAyhW60iM+lmvKE
	 TS6sByjoSK+T0KGyaylrxuvBMajsJ4aRx2IByQmlv5XPzbvQSarpNCVj5Ru/YIY8io
	 tyZrFcYKYIRdVYusR9gke7N0oYHxR/wFqx7tp6S2X8bDUV8hMX9zwJeZOJhL+vuRBe
	 ikO20TyBcS8IJ3NDPUN3XlYYwmi5h/1dLVYnFbJ4y0EkZUblEqwxCxRyVRE4QkPpLE
	 bpiVAmOh3xHFg==
From: Arnd Bergmann <arnd@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Pranjal Shrivastava <praan@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	"Luis Claudio R. Goncalves" <lgoncalv@redhat.com>,
	Nate Watterson <nwatterson@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/tegra241-cmdqv: import IOMMUFD module namespace
Date: Mon, 14 Jul 2025 22:57:38 +0200
Message-Id: <20250714205747.3475772-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_135754_594751_86B62A44 
X-CRM114-Status: UNSURE (   9.00  )
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

From: Arnd Bergmann <arnd@arndb.de>

The tegra variant of smmu-v3 now uses the iommufd mmap interface but
is missing the corresponding import:

ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_object_depend from namespace IOMMUFD, but does not import it.
ERROR: modpost: module arm_smmu_v3 uses symbol iommufd_viommu_report_event from namespace IOMMUFD, but does not import it.
ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_destroy_mmap from namespace IOMMUFD, but does not import it.
ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_object_undepend from namespace IOMMUFD, but does not import it.
ERROR: modpost: module arm_smmu_v3 uses symbol _iommufd_alloc_mmap from namespace IOMMUFD, but does not import it.

Fixes: b135de24cfc0 ("iommu/tegra241-cmdqv: Add user-space use support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
index d5d43a1c7708..eb90af5093d8 100644
--- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
+++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
@@ -1329,3 +1329,5 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
 	tegra241_cmdqv_deinit_vintf(cmdqv, vintf->idx);
 	return ret;
 }
+
+MODULE_IMPORT_NS("IOMMUFD");
-- 
2.39.5


