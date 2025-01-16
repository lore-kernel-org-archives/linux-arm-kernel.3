Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57852C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TzHMR6JF+KqE7CtWAI0Qq2+AtyXzvbuPG2xUvINM7x8=; b=EIND+HnBzpz6w9uFGThufcyyYO
	oURncvAFJKL8/+0y7208auG8X1JhmkwCso26wGBkPZfj36h9CgoY5Q+a0EigzTrIWmUhRhE367Cur
	0335zrWa2DLqLNdXQEDwQq9V+lxWaTxbmt3gZemnuybOfcO2S7phvh3XFLK3uGbjuq5oU3O6gxGLy
	HudVKZZOOhx2AXeSnyWo/eyz21nC/zMYFp/ruWRktJ1LcLFzWm2lLeepliI6CBP5M60s9m6ArHVch
	fbwnzQJ3u/QZ5wRSIIUVD6QgqkCBhji/5q2RKS7X/sa+gNcJDNEDUANG4b3lS/mU+ehCYRKTeT27f
	dSTi0eVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOj3-0000000Eqj8-0Daq;
	Thu, 16 Jan 2025 12:11:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYOhl-0000000EqXZ-2otJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 12:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737029429;
	bh=2c8yFcJ2945jsqZAOuS5Vel5mEF7uycmdZ3MUexcKTA=;
	h=From:To:Cc:Subject:Date:From;
	b=MmbHzs9Uzn6x1yTitYWT6OjUu+fMkQEHv1S4BsQBDTzKowMK45iF2mwV5ukHuG7vC
	 MKdikE4/VzCDABCdyC+hxLRCmNYrF2SPdReDQX1i7rfZBtfrK7Ga9dCIhm15ExILpT
	 XBqttOnKgQDwav5Aq/JF9mTizQBN7wxvVCLoBsU+6SiAOaOjkFZ2FDojZT5CgZPAGV
	 r2XeIgAviXoRSbXISXVBkmBBVl1jBid9LaK9H5Xu/vex0w0qlnIzgg75DmOopySG12
	 Wgc4WxAAVgKTSlFbFkaEmk3UzPiXGGriBgHlPzDSN61OI7F0+qlnlnmEPYwhycajEj
	 hJKIv2k3WoO1w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EBEE217E0391;
	Thu, 16 Jan 2025 13:10:28 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: will@kernel.org
Cc: robin.murphy@arm.com,
	joro@8bytes.org,
	jgg@ziepe.ca,
	nicolinc@nvidia.com,
	mshavit@google.com,
	smostafa@google.com,
	praan@google.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] iommu/arm-smmu-v3: Include string_choices.h header for str_read_write
Date: Thu, 16 Jan 2025 13:10:25 +0100
Message-ID: <20250116121025.118464-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_041033_865059_59554D93 
X-CRM114-Status: UNSURE (   7.90  )
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

The str_read_write() helper function is defined in the missing
string_choices.h header: include it to resolve build failures.

Fixes: f2c77f6e41e6 ("iommu/arm-smmu-v3: Use str_read_write helper w/ logs")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 0e4cbb2c64d7..a0e395da8a88 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -26,6 +26,7 @@
 #include <linux/pci.h>
 #include <linux/pci-ats.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include <kunit/visibility.h>
 #include <uapi/linux/iommufd.h>
 
-- 
2.47.0


