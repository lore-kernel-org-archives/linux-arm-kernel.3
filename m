Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37419C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4J7folVOZx8TY/qmn/xPwdR0rdNFt2w7Yp8DFB2VKw=; b=d9xtABw7zHAuJoMINPcn1ovMjm
	7Bgv3rdC330JW1m/wvl+4B8z2aVu9k2pqpx6UDQha0jjY5syZbOVgJRZ39Lft4OA0ADZTXkA7BpqP
	m3koMDIsbFrnN7MznZe7N3/pKksnuodd/vbL4Q5iUZOMGJ5FPrWwqCu5/z5im3/KkQ+dYmXqbiHeP
	+NkNM7ys9zxHiBUY5ptnjFQlUJgrf8X83pLucQ5Sw0LrJcM0u857Y8wpJsjdqYWLapGPFk71K07ZU
	ClQY2yZVJwO+VeXeXAnGNxr8AmrrZbTwo4QmoozgdXY8Boqn4g6LPnja2pnGt3GBKuMQFznKdIBqx
	gQ96p03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeU3-0000000EBqR-32nq;
	Fri, 04 Jul 2025 11:21:35 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFx-0000000Dd8m-1jkK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615690; x=1783151690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gjeDw4vIXjSrxqdxHy0Im4aZwqFHN+s2mpooAal1uHY=;
  b=Hx4Z/2mcs3MwDTkAoJD69T7RV+2j85scUVqsSSMlvs4ZUB5e8r3HfcbL
   +rC+tO79o8THB/K4gqJFz7YhWCD/k8qvmMg/eadms3L/TF+mJBh5+YrXh
   EPYJ9A6VNTDAtNHe627Ui+Z85/US8XECY52Uz6kxY4z7wBuRhgprbwpV4
   k0G/dAensy7wt3ze4AdyT0/DGaOH785EkAtAoHqnFjPIQR+6E3kKaXRz3
   k8Pv2MI03ych35eteQeYsWHvTxG1O1CzYGCS7JIJZIEXRWY5efiCsuOSg
   9EPzvU8MFRlGBeogmVH5m8XucmfWXMJepzWMqvPo+L17F2nRdlGW0rKxa
   A==;
X-CSE-ConnectionGUID: y4HkjEnYQeKOZvxtywP1XQ==
X-CSE-MsgGUID: 5ujXadKOSECoYXHfuRQC/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64194241"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="64194241"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:49 -0700
X-CSE-ConnectionGUID: /bzuSEQFSLmXBgTqlRBzJg==
X-CSE-MsgGUID: fs1mzZWtTNG62igOJzDl4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158616625"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:46 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id DD9DD44419;
	Fri,  4 Jul 2025 10:54:44 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 57/80] regulator: stm32-vrefbuf: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:44 +0300
Message-Id: <20250704075444.3221445-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005449_487135_2A4B5A40 
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/regulator/stm32-vrefbuf.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/regulator/stm32-vrefbuf.c b/drivers/regulator/stm32-vrefbuf.c
index a85ea94f0673..9e391206f09d 100644
--- a/drivers/regulator/stm32-vrefbuf.c
+++ b/drivers/regulator/stm32-vrefbuf.c
@@ -67,7 +67,6 @@ static int stm32_vrefbuf_enable(struct regulator_dev *rdev)
 		writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 	}
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -87,7 +86,6 @@ static int stm32_vrefbuf_disable(struct regulator_dev *rdev)
 	val &= ~STM32_ENVR;
 	writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
@@ -104,7 +102,6 @@ static int stm32_vrefbuf_is_enabled(struct regulator_dev *rdev)
 
 	ret = readl_relaxed(priv->base + STM32_VREFBUF_CSR) & STM32_ENVR;
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -125,7 +122,6 @@ static int stm32_vrefbuf_set_voltage_sel(struct regulator_dev *rdev,
 	val = (val & ~STM32_VRS) | FIELD_PREP(STM32_VRS, sel);
 	writel_relaxed(val, priv->base + STM32_VREFBUF_CSR);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return 0;
@@ -144,7 +140,6 @@ static int stm32_vrefbuf_get_voltage_sel(struct regulator_dev *rdev)
 	val = readl_relaxed(priv->base + STM32_VREFBUF_CSR);
 	ret = FIELD_GET(STM32_VRS, val);
 
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return ret;
@@ -218,7 +213,6 @@ static int stm32_vrefbuf_probe(struct platform_device *pdev)
 	}
 	platform_set_drvdata(pdev, rdev);
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
-- 
2.39.5


