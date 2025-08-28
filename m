Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F17CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=647jSt1sIjORsNn0IAcm0ax43/3c/xN4CtJ2RRz9SZQ=; b=wHfjedqGawnWStpn8rFzLfGzDY
	pTVo+X4uWJ+vWvbhuJyaD2RkjhgHDFL8QbQabpKkHldp63HbJ+0zKlncL5GlD6rB8XcpSIj8Pl26M
	QiUtacv8Y0RWqTSEadjmHn9+5Pc1Y6hoOspmxJWIbN5FTDSLiWCwDqxyfOd4i5gU3fgzE3HXbaVoh
	5niUKhixJCJDcxtVRknWf8JZiubttFGN15bo1mgdqgKOVL1AU3Mf8SsOPZNwJ0gQ/VaXp5u80dPnZ
	Sfn0gSGe1GWuCmdIAcrQOo2P8CKVPyd/XFRR1bkruVWZn7bX6ya4YFLsvuSQaDmPIczKVSRXZEk6c
	O45ptIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgPg-00000002V7R-2FVO;
	Thu, 28 Aug 2025 17:27:52 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdGn-00000001qj3-1mI3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 14:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756389990; x=1787925990;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B/siCNsmCwDQeXpu3CoMuywLNybWqg95GF25BmBeqh8=;
  b=Dsrvk70qTX8WqBRElE2oCmKrTdKUYawfMTg1CUGDtQRvrs52rq+WuYW4
   NJ9i/Zy+FTy/qSZYrgVotlMCkmoq5ZH6z9iCoU1XpOp3jtRba9OCmnn5q
   R0mz50Aggrujj4840swu3rhUg1r9sfEUrnHM7g4qpUiZ+JwKn10y5Jib/
   u7ztVl4P9Lln1kYe0OvM957FVqwzXYxLnY+ywCIFFMVVONUwfRI1IbISk
   qFCVJPilHR7MFDJdLueLFg3BADClfeU6/9fjlRvjZnUalLM9D2n9Lb7vP
   vfy6TxVNmU/TOY8pHkNhimfhio64SyuK8N05G5eXHM9W5SVy3Noj6VE7c
   g==;
X-CSE-ConnectionGUID: B/+HoFZGSWmrZirgPqyuUA==
X-CSE-MsgGUID: jR53C1aMR8KX3LwkBO1YSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58761031"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="58761031"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:06:22 -0700
X-CSE-ConnectionGUID: t6gOAOP+TACRhUM6B+ICGA==
X-CSE-MsgGUID: 8xq7RtMETomLkqQZxpW0+A==
X-ExtLoop1: 1
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:06:19 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E44B411F9D4;
	Thu, 28 Aug 2025 17:06:16 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1urdGb-0000000DOiq-3Rlx;
	Thu, 28 Aug 2025 17:06:17 +0300
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
Subject: [PATCH v5 1/1] iio: dac: Remove redundant pm_runtime_mark_last_busy() calls
Date: Thu, 28 Aug 2025 17:06:17 +0300
Message-ID: <20250828140617.3193288-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_070629_513396_8297C0E5 
X-CRM114-Status: GOOD (  11.56  )
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
since v4:

- Rework error handling.

 drivers/iio/dac/stm32-dac.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index 344388338d9b..b860e18d52a1 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -82,9 +82,11 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 
 	ret = regmap_update_bits(dac->common->regmap, STM32_DAC_CR, msk, en);
 	mutex_unlock(&dac->lock);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&indio_dev->dev, "%s failed\n", str_enable_disable(en));
-		goto err_put_pm;
+		if (enable)
+			pm_runtime_put_autosuspend(dev);
+		return ret;
 	}
 
 	/*
@@ -95,20 +97,10 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 	if (en && dac->common->hfsel)
 		udelay(1);
 
-	if (!enable) {
-		pm_runtime_mark_last_busy(dev);
+	if (!enable)
 		pm_runtime_put_autosuspend(dev);
-	}
 
 	return 0;
-
-err_put_pm:
-	if (enable) {
-		pm_runtime_mark_last_busy(dev);
-		pm_runtime_put_autosuspend(dev);
-	}
-
-	return ret;
 }
 
 static int stm32_dac_get_value(struct stm32_dac *dac, int channel, int *val)
@@ -349,7 +341,6 @@ static int stm32_dac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_put;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-- 
2.47.2


