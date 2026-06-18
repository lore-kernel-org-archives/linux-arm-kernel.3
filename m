Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41803CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TO+Ak4zJi/v1bL2VefH7uABaSEsm9tKlSZAKDUnjVD8=; b=hmJnNsNgy/XFr8f0fVRsOIfW12
	YX8UYXmXvszPvyBIuthrp5S0+Lum85uNrze0QevTmDHIra15YsvmgbvUiWHZ3H9SIoifOzRZaFMcP
	gszK3lRlEtfVJiUuw/+/83LoQxm+3h9Ry2kj0yw5kuVgawBADph0CIJZbbs/8sAfO7KuUjQL1ehr6
	pRJ/rEkYowkgfbfoVCNG8ymF2CgfiH2kdi16HzQLqIzsjtQ6Kk4pttmgiL7VI/1y6rTM4DF1IBfJg
	huAYR2o3qOxLrxM5x583o4fTC2c8/QK+cP91bSEm5Nh49VDv1tCJ3KB5XAFPeigK+ou8DeDevMByK
	KOvjdHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCXD-00000001KXs-1No5;
	Thu, 18 Jun 2026 13:11:55 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCXB-00000001KPV-1UXR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781788313; x=1813324313;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t2sY6g9hByHB2M8K2YsDB0IUJTaJLj8nTbSpTHyibdU=;
  b=UXDQmyifSaZ9wxkDZ+lkhQcvceT46+hXTYoFKSmIIAbIwgc8amQ6dWMk
   n5ifE35ZCc3b+iRBOqBbflpnkx+34cu+WRiCrkIm5850hy0eB8AmSxW7H
   l4QEWGZ7olo36xDjYHPqiu7vvp4UEXonIq6TfBv8ZTm64AxgI7kvtd4Fj
   EGVvFxF9fjkgO71iYZBy+WgFhFrnmsYX6UFFS/cGzgVYJ49u1xm37RDhy
   0rJs7L4Kkj69RbfQBjYeZcxuVZue53oFEGSIevTrLoGYCtRSwt6Q5kya/
   putXYkvqC/0YQCCR1GbrpUochwj4nFFCQv/KKr5SugB4cJlnNLZqoSV+v
   Q==;
X-CSE-ConnectionGUID: wpFzpncrSSeTNOLWSvMtHQ==
X-CSE-MsgGUID: fZaq1VY3TTydjouFrDiWTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="93995630"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="93995630"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 06:09:52 -0700
X-CSE-ConnectionGUID: eneU7bW8Qke86wLXSFGiXA==
X-CSE-MsgGUID: 4zllHn5uT5icgldsto+xlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="245990395"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jun 2026 06:09:51 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BE41F98; Thu, 18 Jun 2026 15:09:49 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 1/1] i2c: pnx: Use generic definitions for bus frequencies
Date: Thu, 18 Jun 2026 15:09:48 +0200
Message-ID: <20260618130948.3199768-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_061153_407552_BDBCC76F 
X-CRM114-Status: GOOD (  11.17  )
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

Since we have generic definitions for bus frequencies, let's use them.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-pnx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pnx.c b/drivers/i2c/busses/i2c-pnx.c
index 8daa0008bd05..e1cc2b2bd628 100644
--- a/drivers/i2c/busses/i2c-pnx.c
+++ b/drivers/i2c/busses/i2c-pnx.c
@@ -24,7 +24,6 @@
 #include <linux/of.h>
 
 #define I2C_PNX_TIMEOUT_DEFAULT		10 /* msec */
-#define I2C_PNX_SPEED_KHZ_DEFAULT	100
 #define I2C_PNX_REGION_SIZE		0x100
 
 struct i2c_pnx_mif {
@@ -606,12 +605,12 @@ static DEFINE_SIMPLE_DEV_PM_OPS(i2c_pnx_pm,
 
 static int i2c_pnx_probe(struct platform_device *pdev)
 {
+	u32 speed = I2C_MAX_STANDARD_MODE_FREQ;
 	unsigned long tmp;
 	int ret = 0;
 	struct i2c_pnx_algo_data *alg_data;
 	unsigned long freq;
 	struct resource *res;
-	u32 speed = I2C_PNX_SPEED_KHZ_DEFAULT * 1000;
 
 	alg_data = devm_kzalloc(&pdev->dev, sizeof(*alg_data), GFP_KERNEL);
 	if (!alg_data)
-- 
2.50.1


