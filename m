Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE6DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4wa9FNFNOPxjnPG68Tfb2qd08hOncfWCOKtdxzoiwkU=; b=K+atoDrLVxdtku2G2rsMd+ui2+
	QHi9LUU5f7JdJK97PYKgRhCgIkpHgQyPa6W4XPQhbVkOMpB34kGRRSPA6ZGeuTF6RMFE/EJYmtEaa
	CjAmUyFl4O/o7EPOyukT8E/WHsJ9Rl5pjlxao/fPjiJ5yBFj9v9TCX4NdQIjyyh9kny5L3l9vKQSh
	ISIeMqmBomh01twYJ3/6/Ewe9FSb7mMfoRCqHEQCpscXIaJgq7FnGgXHVIZmuSJWJUwnRb/fIQbsF
	rP2HyNVIWqkxJt6vGTVvUs37UfEZAiRAdJyFKWqhO2u3deDZYR+GzovHsswMWgg9LUsshCIIS50lz
	O8aq001g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrd2-0000000GKBe-1QAE;
	Wed, 18 Dec 2024 10:50:08 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrXm-0000000GJ5O-3GE4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 10:44:43 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BIAiTt8104011;
	Wed, 18 Dec 2024 04:44:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734518669;
	bh=4wa9FNFNOPxjnPG68Tfb2qd08hOncfWCOKtdxzoiwkU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DIMGmaFVsIlh7hwpf2PCCQJfDIoie4fEOtecGvOSiPswQjQ25FWt3QiDkTCfIiAf6
	 SL5s09YIc67Gy6Es9GKZnBcyTkABS5TIh+JOkJ49J5/ZnFnoJsNsntyjwQwYAHdVxz
	 t7g2uu/ABUSqce0DGyGKtmKMICSiCcZiX2iCRJeU=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BIAiTvs111287;
	Wed, 18 Dec 2024 04:44:29 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 18
 Dec 2024 04:44:28 -0600
Received: from fllvsmtp7.itg.ti.com (10.64.40.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 18 Dec 2024 04:44:28 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp7.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BIAiSi7089723;
	Wed, 18 Dec 2024 04:44:28 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4BIAiR9m026894;
	Wed, 18 Dec 2024 04:44:28 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <tony@atomide.com>, <mathieu.poirier@linaro.org>,
        <grzegorz.jaszczyk@linaro.org>, <s-anna@ti.com>, <ssantosh@kernel.org>,
        <nm@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: [PATCH 1/2] soc: ti: pruss: Fix pruss APIs
Date: Wed, 18 Dec 2024 16:14:23 +0530
Message-ID: <20241218104424.1257880-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218104424.1257880-1-danishanwar@ti.com>
References: <20241218104424.1257880-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_024442_908255_7C1EB175 
X-CRM114-Status: GOOD (  11.63  )
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

PRUSS APIs in pruss_driver.h produce lots of compilation errors when
CONFIG_TI_PRUSS is not set.

The errors and warnings,
warning: returning 'void *' from a function with return type 'int' makes
	integer from pointer without a cast [-Wint-conversion]
error: expected identifier or '(' before '{' token

Fix these warnings and errors by fixing the return type of pruss APIs as
well as removing the misplaced semicolon from pruss_cfg_xfr_enable()

Fixes: 0211cc1e4fbb ("soc: ti: pruss: Add helper functions to set GPI mode, MII_RT_event and XFR")
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 include/linux/pruss_driver.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/pruss_driver.h b/include/linux/pruss_driver.h
index c9a31c567e85..2e18fef1a2e1 100644
--- a/include/linux/pruss_driver.h
+++ b/include/linux/pruss_driver.h
@@ -144,32 +144,32 @@ static inline int pruss_release_mem_region(struct pruss *pruss,
 static inline int pruss_cfg_get_gpmux(struct pruss *pruss,
 				      enum pruss_pru_id pru_id, u8 *mux)
 {
-	return ERR_PTR(-EOPNOTSUPP);
+	return -EOPNOTSUPP;
 }
 
 static inline int pruss_cfg_set_gpmux(struct pruss *pruss,
 				      enum pruss_pru_id pru_id, u8 mux)
 {
-	return ERR_PTR(-EOPNOTSUPP);
+	return -EOPNOTSUPP;
 }
 
 static inline int pruss_cfg_gpimode(struct pruss *pruss,
 				    enum pruss_pru_id pru_id,
 				    enum pruss_gpi_mode mode)
 {
-	return ERR_PTR(-EOPNOTSUPP);
+	return -EOPNOTSUPP;
 }
 
 static inline int pruss_cfg_miirt_enable(struct pruss *pruss, bool enable)
 {
-	return ERR_PTR(-EOPNOTSUPP);
+	return -EOPNOTSUPP;
 }
 
 static inline int pruss_cfg_xfr_enable(struct pruss *pruss,
 				       enum pru_type pru_type,
-				       bool enable);
+				       bool enable)
 {
-	return ERR_PTR(-EOPNOTSUPP);
+	return -EOPNOTSUPP;
 }
 
 #endif /* CONFIG_TI_PRUSS */
-- 
2.34.1


