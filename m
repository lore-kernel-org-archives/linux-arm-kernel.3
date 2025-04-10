Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A28C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 05:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w78hQh4O0NhgmK0dp4S3FHnI5NsyRI9HZwdaKQuXLUw=; b=AtxN4HjscEUBS1qTV6RVO09Tqs
	48T2FlnNqnDbwqMFdZi/Vnk6Gxhj4Lrto3Kai33LDVZ0ZIByD1NkI+Sl5FXUVvt55vEXEOJ68vGSd
	Bn2kJ9ZpDAoI9jVOTDcKxg0KuVzq5Pt86Va17RIERLZReodQjGYN4LDzOPlORVztz9LC8b+72e3As
	CtL7YxonsEiZdfJwpagSGw79ytdb9Hob1NAG9Duo1js+mUeedLl3fYARMxqbKhFpBRC6eoV/qrLW1
	8RP8S1OQUPDPIQblBV8vj4QpkmKFfnW5O37SNKaThny5eAbqsKwMqmA0f4CGxlbtEu44CrlWJVfY2
	hulMywuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2krr-00000009JNY-1H5F;
	Thu, 10 Apr 2025 05:54:27 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2kq3-00000009JGR-13Fe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 05:52:37 +0000
X-CSE-ConnectionGUID: As0fnxYxSp+ksbv7bZCSmA==
X-CSE-MsgGUID: rFEIlZNZR8+GjXdpmE5CoQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Apr 2025 14:52:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.117])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9C797419AE41;
	Thu, 10 Apr 2025 14:52:26 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4] media: platform: exynos4-is: Use of_get_available_child_by_name()
Date: Thu, 10 Apr 2025 06:52:21 +0100
Message-ID: <20250410055223.5048-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_225235_395836_E4986293 
X-CRM114-Status: UNSURE (   8.50  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Readded Rb tag from Krzysztof as it is trivial change.
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


