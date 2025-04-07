Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C911FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFtRQyVCS3dn5wa9TjiymwbyJyxh4kXBe/DHvbAgBUo=; b=xY1W77RpxXGmugX6dE5Xp2uI6t
	8vtCRQYymnCDZcOD1P8dbgIUsUkBrwkO9dHZfZvtuAjyt//iyiWCpWjW8fTp8x9jkJHP7WLTGgef0
	siYUPDX78f99TVMUuUiafnrmo8kr3NOjvUtUHEtmS0OJxxlnRq8Kju5bb+ebW3n6xi+P7Pt+XrIVh
	K7RkQEKlyyxV/LlLHK84y6VJpRYHor8xjw9F+CchwcAS8ySlcry5l/KNyhGCZC7SOguZlagNgJifp
	qo8c+7NEZeT5IFMV5dH9WXl3+U5dT7/Ylj0aM9ZbSWjL0Sx/VRPY757baYPOnus8GnooVvcDO3NQC
	PCsS0TVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kRi-0000000HXOa-23xP;
	Mon, 07 Apr 2025 11:15:18 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1kI8-0000000HUwF-3ov7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 11:05:27 +0000
X-CSE-ConnectionGUID: r/vz6KOiSdWPScPuRYOYbw==
X-CSE-MsgGUID: WeSd6SwyR/amjgABX9Mdng==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Apr 2025 20:05:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 038554005473;
	Mon,  7 Apr 2025 20:05:18 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3] media: platform: exynos4-is: Use of_get_available_child_by_name()
Date: Mon,  7 Apr 2025 12:05:13 +0100
Message-ID: <20250407110516.41124-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_040525_059465_4EA821BB 
X-CRM114-Status: UNSURE (   8.90  )
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

Simplify fimc_md_is_isp_available() by using
of_get_available_child_by_name().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Fixed CHECK: Comparison to NULL could be written "child" reoported by
   [1] https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/74116132/artifacts/report.htm
 * Dropped Rb tag from Krzysztof.
v1->v2:
 * Rebased to next as the dependency patch hits on 6.15-rc1.
---
 drivers/media/platform/samsung/exynos4-is/media-dev.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/media-dev.h b/drivers/media/platform/samsung/exynos4-is/media-dev.h
index a50e58ab7ef7..ea496670d4b5 100644
--- a/drivers/media/platform/samsung/exynos4-is/media-dev.h
+++ b/drivers/media/platform/samsung/exynos4-is/media-dev.h
@@ -179,8 +179,8 @@ int fimc_md_set_camclk(struct v4l2_subdev *sd, bool on);
 static inline bool fimc_md_is_isp_available(struct device_node *node)
 {
 	struct device_node *child __free(device_node) =
-		of_get_child_by_name(node, FIMC_IS_OF_NODE_NAME);
-	return child ? of_device_is_available(child) : false;
+		of_get_available_child_by_name(node, FIMC_IS_OF_NODE_NAME);
+	return child;
 }
 #else
 #define fimc_md_is_isp_available(node) (false)
-- 
2.43.0


