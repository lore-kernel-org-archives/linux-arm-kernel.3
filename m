Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40723C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 11:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PnTd3WZG/fm6S5+AMV4x+2ufZv6k6uyirKu5AAni10=; b=2SzAgOiC9ioLLQJ964MPKFt4MQ
	iRwdme/9x57GQ80ga5Aru8Wrf3my/a8baBsswRPKnTD7Hoyg1GWLyT4mZ27oU8zvNjYPXQZ1R/bq3
	8pMMe1FYSeQW19oy84rPbOAqMZaUv6XV+iYYucpHU/DBNsywx3uUMiv9vhfREYchsNzEBPXHBy6gF
	Q3Ce+7h6miVCVXHGFRSkCqHUiepJi/OwvR22HSrXd3QrCIe8HXgalfhFOA3pNC6/fHuv6waWZVwRM
	RcnXH8WUbgR2bWC9EoO5F9XQrLNAdmnggUFM4tDqaCBbBrhu488junkG39BoOwKAVpKcG5qlgA0Y+
	hqZyG8NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyWn-00000000Kxj-2mPc;
	Thu, 07 Aug 2025 11:11:23 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyFY-00000000IG2-0XO6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 10:53:33 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250807105330epoutp03e12d04fc7b97998be7b1e0611315d0a9~ZdqvS1HMa0887908879epoutp035
	for <linux-arm-kernel@lists.infradead.org>; Thu,  7 Aug 2025 10:53:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250807105330epoutp03e12d04fc7b97998be7b1e0611315d0a9~ZdqvS1HMa0887908879epoutp035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754564010;
	bh=0PnTd3WZG/fm6S5+AMV4x+2ufZv6k6uyirKu5AAni10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DcjrStTwbsGSZqOgcC4B/HUUX6oXYfMjPjIfSC7/q+wmINptksvYz4lYcew9W3W8f
	 QnHW940NUWIM5mEKsW/ZnEyAYdDqCzkmGBQZ/qgxUtMeiKSvucSul5ymahXOHwOX1i
	 UGbP+KAHbxRMTIOWanzdNn/JIcPGomwLWWrjxqOU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250807105329epcas5p1edbd7ab30549989effa47c3ed866e28e~Zdqumj4CK2372223722epcas5p12;
	Thu,  7 Aug 2025 10:53:29 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4byPCX3Lxwz6B9m9; Thu,  7 Aug
	2025 10:53:28 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250807032520epcas5p47545f2b03e29296b583248f8315abf45~ZXjcgwDPU0583105831epcas5p48;
	Thu,  7 Aug 2025 03:25:20 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250807032518epsmtip24960da37a4e98ff6e17bd9d0006e6de2~ZXjajd3B21700017000epsmtip2e;
	Thu,  7 Aug 2025 03:25:18 +0000 (GMT)
From: Aakarsh Jain <aakarsh.jain@samsung.com>
To: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, m.szyprowski@samsung.com,
	andrzej.hajda@intel.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	alim.akhtar@samsung.com, robh@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, aswani.reddy@samsung.com,
	anindya.sg@samsung.com, Aakarsh Jain <aakarsh.jain@samsung.com>
Subject: [PATCH 07/10] media: s5p-mfc: Modify compatible string check for
 SoC-specific support
Date: Thu,  7 Aug 2025 08:54:46 +0530
Message-ID: <20250807032449.92770-8-aakarsh.jain@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807032449.92770-1-aakarsh.jain@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250807032520epcas5p47545f2b03e29296b583248f8315abf45
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250807032520epcas5p47545f2b03e29296b583248f8315abf45
References: <20250807032449.92770-1-aakarsh.jain@samsung.com>
	<CGME20250807032520epcas5p47545f2b03e29296b583248f8315abf45@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_035332_478263_BD4E82AF 
X-CRM114-Status: GOOD (  12.46  )
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

Modify the compatible string handling in the MFC driver
to explicitly match SoC-specific identifiers.

Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
---
 drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
index 73fdcd362265..d13770058e63 100644
--- a/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/samsung/s5p-mfc/s5p_mfc.c
@@ -1711,22 +1711,22 @@ static const struct of_device_id exynos_mfc_match[] = {
 		.compatible = "samsung,mfc-v5",
 		.data = &mfc_drvdata_v5,
 	}, {
-		.compatible = "samsung,mfc-v6",
+		.compatible = "samsung,exynos5250-mfc",
 		.data = &mfc_drvdata_v6,
 	}, {
-		.compatible = "samsung,mfc-v7",
+		.compatible = "samsung,exynos5420-mfc",
 		.data = &mfc_drvdata_v7,
 	}, {
 		.compatible = "samsung,exynos3250-mfc",
 		.data = &mfc_drvdata_v7_3250,
 	}, {
-		.compatible = "samsung,mfc-v8",
+		.compatible = "samsung,exynos5800-mfc",
 		.data = &mfc_drvdata_v8,
 	}, {
 		.compatible = "samsung,exynos5433-mfc",
 		.data = &mfc_drvdata_v8_5433,
 	}, {
-		.compatible = "samsung,mfc-v10",
+		.compatible = "samsung,exynos7880-mfc",
 		.data = &mfc_drvdata_v10,
 	}, {
 		.compatible = "tesla,fsd-mfc",
-- 
2.49.0


