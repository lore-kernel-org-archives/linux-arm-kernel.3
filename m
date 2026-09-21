Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9773CC982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 03:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBiZyYVBdz7e8MBo8dJNsuvO53JvDE+I2EWijeaOzYI=; b=iojYkdcDnpevM9xz+tGBPjAYkn
	dzgq59sF1bX+cIL1ErCMJcSXUQV/YrLAknxPtKquzTf1HLZaSzA8zfaBWwqYxIZCOIRASSOilbAFx
	6z09q8V/naptN6/i8g1Y8Mmt+Uv4cK4a+1DftkxNqE8G4YLi4gjElhlKR+EGAfJI9z208mUvShfK6
	/gpzoIKUfbzNYtG3N6IEtA/xSELls9yBDywzcshvuA34BXzLMolgFlcq595MMJeU5M/hC7Piv8iEk
	5qquP67IOJisKm0mRCKOxmpoqZ+Wx9BsfAWTVIIDHVlz/PPmU+Np0BABurUEQPMu6mlisth2R7PMk
	qF+xlsIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UqX-00000000m6t-22qb;
	Mon, 21 Sep 2026 03:37:37 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8UqT-00000000m5Z-3hra
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 03:37:35 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d91a931f66so16062475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 20:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961853; x=1790566653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBiZyYVBdz7e8MBo8dJNsuvO53JvDE+I2EWijeaOzYI=;
        b=ihogR/3DSPTBxQykyOIqCK81gQJ5AmBb8bRUfD+kWXFmzWfKU6Vn/krsICOeRbmNAz
         aU2WOvdPTAoDUtI5QWAxVzTjNnyZpZxeBX7YfcDLoB4iyADIttqC9XJhUPtwYiDYvuAf
         08NVa5k++i6Y2xbTUTivkW+jtkd/VkcOqOUgdl6bwP2qWPfkp6Yu+Sv4QRrJIcHqDQrI
         Oc/JKh/bTodYYrX7mwo2gPJGFsLLrmdtMhb5S8QKaOSvYWZtKOC5A4iEXSZVQsZbLrwn
         9b28eALFS8GKWvc4A9VyGxDDvs/zbUntzwTDjBZLkez6ILD2Yz8AGWSWORvxi1MnuLNe
         ig0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961853; x=1790566653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBiZyYVBdz7e8MBo8dJNsuvO53JvDE+I2EWijeaOzYI=;
        b=Yqt1P1x6Z1aEjdVqOgnpt/NeWKLPdBx+kMEC6VpPbWgrCNDNxFaCD6li2Fv1kgKV3G
         oAcK1qbMSbggQOBHXlpw9dyx8pIw3ajFFFcicXRxsZW3xX+UGPgvSXUBGQJW1tdhTev5
         VjGxgOq7XrM0/JCxZNP/9dFU3+CCRLv0dm1ZXLdtqtCVSlfTDWB1UGJXVnHmyvRIRAR+
         rgi3ltiyIxs8eDiGUniN4MZCNPZVkTrPrheb/iI8j5B+MD2455w1J7dRllq5EwuYg6OU
         JwQ6LRqsVrlHbaXon/MOjdKyujZLl0m+8bGOMMpq/fduHvTT2ZSp873OS+ExwMgVBHzB
         6Xzw==
X-Forwarded-Encrypted: i=1; AKwUvBw3izj1eJlUo/YQ7ULviQlulMAM2+dCruMLudsIuJazd3mTIikkFg3ISmkOCL6+cISuUo/gQ77Lpum+8/cg7mNl@lists.infradead.org
X-Gm-Message-State: AFuF++nNx0wBgDXrcUFlR8oXB+mjDUFmQUENppJqBIPHpRP+FgGpOiZ+
	I2TbdWS8IeiRugJpbu6AyqPFeOxayrKHzW85yYGr8ENR031GQ3cFg8mC
X-Gm-Gg: AYBFou1hXKg58YjpT+OYYxXBkmWWGxbS5GiK68ZY4DkhO5R8y9FADg9TMlAoXYSn4TH
	8Yr5nKZso8s3jh0p5XQh5bBHO7Ku4zXhNJtIz4dhsWQbwtxSjxDeTRykbPuFDt5wBWjqFVXeo6J
	vw3Z2P39EIBYZFWLhiSKRvyH8Iuei6NarqIPX0CoYe9nwMEu7HFIGI2Mbybw7KyCbfcb5xdhZ6i
	LvX+LYKmtLLzCCp79lgHy4SGiHev8MFm74i8khD3P2c2Zk5NHJq9HTBjQcx5GLczQsCfCPMozH6
	/yUxjJ0G2NHDbK5JZ9SvCRiJZtNRwiLaA6BbDKOyhsoLVxbqGzlp6fQ90qDIFoZ2YfHalsbMOpO
	iEuj7IHUC6ps8nsPCPvVIKtxZTgS0vrovVly6pidMuIHoQyac2+76nEbvactl4P8djM5NEpDDjt
	gNIDRlxWR235L1Fl3Rt5KMCvYJZC5B1JeZ7koabrHA535Fz5+dOFjePPVzNoph8Z+w1NwPY/AME
	cTYOMuONOuHwho03vFOT7a56HPbkObW3InWkjhuDw0nt385/JzzKhf2meNYsV7AiBr4bQnOTivv
	rUvCJJGW622RSQ==
X-Received: by 2002:a17:903:468e:b0:2dd:c100:4b81 with SMTP id d9443c01a7336-2ddc1005f8cmr84060475ad.56.1789961852965;
        Sun, 20 Sep 2026 20:37:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	rafael.j.wysocki@intel.com,
	Jacky Bai <ping.bai@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	u.kleine-koenig@baylibre.com,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:06 +0700
Message-ID: <20260921033708.14433-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_203733_948824_88ED6D91 
X-CRM114-Status: GOOD (  14.32  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pmdomain/imx/gpcv2.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index a829f8da5be7..6a54ee734514 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -317,11 +317,9 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
 	u32 reg_val, pgc;
 	int ret;
 
-	ret = pm_runtime_get_sync(domain->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(domain->dev);
+	ret = pm_runtime_resume_and_get(domain->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	if (!IS_ERR(domain->regulator)) {
 		ret = regulator_enable(domain->regulator);
@@ -1397,21 +1395,13 @@ static void imx_pgc_domain_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int imx_pgc_domain_suspend(struct device *dev)
 {
-	int ret;
-
 	/*
 	 * This may look strange, but is done so the generic PM_SLEEP code
 	 * can power down our domain and more importantly power it up again
 	 * after resume, without tripping over our usage of runtime PM to
 	 * power up/down the nested domains.
 	 */
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(dev);
 }
 
 static int imx_pgc_domain_resume(struct device *dev)
-- 
2.43.0


