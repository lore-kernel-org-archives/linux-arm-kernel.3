Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E289CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 20:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=304g+X8HMdNg1Y9olmLeyO+hMV2r3ASCyS4oyM9+cKU=; b=IGKoSMzbWYqR/C7BkqFI60EsWy
	RYeYOpi1VBfy8ZhsZ7NDHmZKOP6UJmYxbv9lsW/Zf62nM7w1lP3kkDiMmIq1RqkxzsK8uBwwyHN/g
	Jia4XIOMxo+68++nKxT6gRDWmCYwYBnyT7m1sb0Swe5F/ji6Icl4UsU3gCI3bran3ySv/FhAutqNy
	RekxWxTP5tF8xCCwMrpLU9Z8XuIlYQgT8t7tZYoa5NiSZPgbawZRFejPSDd4pyjKhnBUM+qgzQ9lb
	qvBlEqDJF1Z+EksMT6Jo6j+rN2bFCzln0Awk2uqkftpxbaTM+8USIgxk2WQ0PsWKU5AMDYWDd9fR0
	+elbIAWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqeG8-00000009hko-12DF;
	Mon, 25 Aug 2025 20:57:44 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqeBy-00000009guQ-3of9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 20:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756155208; x=1787691208;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s3tmR7nxofceGS0RADamNfNDc9paoHZFEDJVu8jYTu8=;
  b=hcg+SA8PdBODQtxoUuf8O59CF403mjgLdNtgLc5aj92Y4TnU4WYidPVx
   u013Z7Rgc3JpvCtW2/JDR7rxc/Z32jEhKILXqxxMhMlClcsrJA23GNFMn
   8cmAJtCzftdNlb/HpboA7iPWQ50aU6dSKrcnZOCif4l8VLwZSUUtoNPdO
   vyfbLh1lW3P0WG3+qrDboo1MFzCA+f+2ppdxFw5L1rg3ftEZdNn8YRTdh
   8LlTyMKKGMr3LX5hDc8dw5X1ZIMVdVdrbx3WpvAk0HAGOvCvAnUECOU37
   hu+6dEsImx+XZKcg2zVruz5fxeBnwmRPu+Y4OMqaQ5g3pm/rfxM3XHc/O
   A==;
X-CSE-ConnectionGUID: No3S9QQHRtyx11rSzIO+ug==
X-CSE-MsgGUID: lV/dXThcQiifFbxbGibA4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62205757"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62205757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:52:43 -0700
X-CSE-ConnectionGUID: F+7z9UEqTpCLzRepANTSzQ==
X-CSE-MsgGUID: hMmmi/nIT2mlfySCXjSzQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200286930"
Received: from rvuia-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 13:52:39 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 33C1C11FB0F;
	Mon, 25 Aug 2025 23:52:36 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uqeBA-00000007PWX-0Pyt;
	Mon, 25 Aug 2025 23:52:36 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v4 1/1] iio: dac: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 25 Aug 2025 23:52:35 +0300
Message-ID: <20250825205235.1766401-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_135327_200745_3129CC92 
X-CRM114-Status: GOOD (  11.73  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Also clean up error handling in stm32_dac_set_enable_state().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
since v3:

- Fix condition for calling pm_runtime_put_autosuspend().

 drivers/iio/dac/stm32-dac.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index 344388338d9b..874e6dcc0d61 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -82,9 +82,9 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 
 	ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
 	mutex_unlock(&dac->lock);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&indio_dev->dev, "%s failed\n", str_enable_disable(en));
-		goto err_put_pm;
+		goto err_pm_put;
 	}
 
 	/*
@@ -95,18 +95,9 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 	if (en && dac->common->hfsel)
 		udelay(1);
 
-	if (!enable) {
-		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
-	}
-
-	return 0;
-
-err_put_pm:
-	if (enable) {
-		pm_runtime_mark_last_busy(dev);
+err_pm_put:
+	if (!enable || (enable && ret))
 		pm_runtime_put_autosuspend(dev);
-	}
 
 	return ret;
 }
@@ -349,7 +340,6 @@ static int stm32_dac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_put;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-- 
2.47.2


