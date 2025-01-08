Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A110AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMhEQ5FyK9OrG4uMjs+kjYbwMOyJiryWj2ETzJ64ZW8=; b=4wiMgco4h3yBF/ZKQl2hCNPXha
	GFmywFl/cTmss7ChMfiJTdwrlRQXYZNiWKPdlshGtcfChxYQ69VCNBFU/btE3oSSnQt89EsjBIMAh
	N7/6XnAYA2z6bfpk7aBQLhB9EWY5Lmgrd+mYa5vzWwXi7CnA5mTAUcHE1z56065zMKwf05kJ9dCYH
	nR5zpdHWNB2wiBd3xrvrCii7Ciaddv4A9m+Cr8Emt3tu81/feynNhMNSxh5+gyReGe5/VwnS2+RPI
	axBu+PxXQaSN77t0NjAd9E0IHziDVgOqYk2bAaOEtgabDQcpoN1B3ljkomO4kS4oG3DniqgOemFNJ
	QbjB8WHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVW91-00000008cMT-3ZNG;
	Wed, 08 Jan 2025 13:30:47 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVwp-00000008ZuJ-0fir
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:18:12 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089S8OV008424;
	Wed, 8 Jan 2025 14:18:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	WMhEQ5FyK9OrG4uMjs+kjYbwMOyJiryWj2ETzJ64ZW8=; b=3z0BD2Q001meWpkk
	X5ESTUC4tt7ZZ6ehHUx25y5BEDUBMyntcisTlrK5WKsXzCLEvYxIngc9CGwNCgY7
	Zt9NQ46YXllLqBENPdlrUge9esidTp/heN4HZL5eMUVhowMeUKqWiiB7NUcSTCQO
	jGMrtOS0kNjnvPXsBDPdAdbcOQldWrbmEVzwaBjzl+YECkBeye0Drz6G3uHFrJt+
	p+hnJVufWUOJvhTTVzdRRSUAn91WkeqUhJsEjRwcNibv4fkac89CGZxBoKfPEcaH
	tZ/bqoWia5AaD6Ei1QulY8B1ixGaUk1D4TfnGvZLazGoRt7gParBLTEHSSaufXLC
	P4EH8w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441m7t9md6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 14:18:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C3B5240048;
	Wed,  8 Jan 2025 14:17:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 197542795F5;
	Wed,  8 Jan 2025 14:16:12 +0100 (CET)
Received: from localhost (10.252.31.140) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 14:16:11 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 8 Jan 2025 14:16:05 +0100
Subject: [PATCH v2 2/8] media: stm32: csi: add missing pm_runtime_put on
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-csi_dcmipp_mp25_enhancements-v2-2-05808ce50e41@foss.st.com>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
In-Reply-To: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.1
X-Originating-IP: [10.252.31.140]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_051811_562387_A19F8786 
X-CRM114-Status: GOOD (  12.20  )
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

Within the stm32_csi_start function, pm_runtime_put should
be called upon error following pm_runtime_get_sync.
Rework the function error handling by putting a label in
order to have common error handling for all calls requiring
pm_runtime_put.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index 48941aae8c9b..e2f63bb47d33 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -497,21 +497,19 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 
 	ret = pm_runtime_get_sync(csidev->dev);
 	if (ret < 0)
-		return ret;
+		goto error_put;
 
 	/* Retrieve CSI2PHY clock rate to compute CCFR value */
 	phy_clk_frate = clk_get_rate(csidev->clks[STM32_CSI_CLK_CSI2PHY].clk);
 	if (!phy_clk_frate) {
-		pm_runtime_put(csidev->dev);
 		dev_err(csidev->dev, "CSI2PHY clock rate invalid (0)\n");
-		return ret;
+		ret = -EINVAL;
+		goto error_put;
 	}
 
 	ret = stm32_csi_setup_lane_merger(csidev);
-	if (ret) {
-		pm_runtime_put(csidev->dev);
-		return ret;
-	}
+	if (ret)
+		goto error_put;
 
 	/* Enable the CSI */
 	writel_relaxed(STM32_CSI_CR_CSIEN, csidev->base + STM32_CSI_CR);
@@ -567,6 +565,10 @@ static int stm32_csi_start(struct stm32_csi_dev *csidev,
 	writel_relaxed(0, csidev->base + STM32_CSI_PMCR);
 
 	return ret;
+
+error_put:
+	pm_runtime_put(csidev->dev);
+	return ret;
 }
 
 static void stm32_csi_stop(struct stm32_csi_dev *csidev)

-- 
2.34.1


