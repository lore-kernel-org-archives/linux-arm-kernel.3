Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C594FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 23:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYFaGJjs6zdm7TyT3CtpkkMGY8e2lZAMgKRo5f97W30=; b=Hhyt93zX4pDGRN3uKaDFv0nULc
	uLxLHhx9VsjYk+Du0cUa/j/Z3lcEFrmT2x6c6V5o/mMCSijHQqHDtp3YDsitecKd3jPlapQx1vnbI
	p8hre3k4x8wtiFG6hzbNeVS2i3msKFMGG8cbD3fSn9IqsEJI8+0MmUeR7iA9Szwfa/G3W12V6FIIS
	6vF1kGwvWAUEotkURV9S6/XK5tY1oIDcb2+wjGiZfRdFCDgx+/GpHcLOYV86B/2DKMuWZLSGH8DIM
	g9+RJ7hugBtuvNZSE308RzgH8WoQw03zxdLyzGL9jztsyiPIUt/AnadeJ7FzQY+wWJ35RUIal9JRG
	cOzXf7NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZHWC-00000006srR-2zvF;
	Tue, 08 Jul 2025 23:14:32 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZHTp-00000006sOM-2eLr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 23:12:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752016326; x=1783552326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F43DrlOFqpVCv/gcMSySHNfblub8XfWCe+WeSdLWo7M=;
  b=QimQHUKFqKWjhNsShY7WJ8uPSxXadgxpIoqyZ4gYtZfCwuAt88XSMozr
   9/Urfua3o7LoqD0oQpGrzDdTcztz/PU4+3x/iD9taJRcukh3qV+ilb8VO
   sfqNvYe4u130Uc3JMX7SFsWujI+jZLQcNUit4PHNosNTjPMfUgApAz3t9
   5uwYE95N723UWd+/5zEBPExYYjo4EHnCXZQCbuBQe5vAFHnOcRnh/NYGH
   L4Uqb2WrhxnKuwDoOrMDxWTdSKHf2G/hkF7wRyjSMTLVdCjf5tqbpXDQf
   KsqgdXVLPfm76TJm+5PagkyA31F8T+IHdEcm1j06GC7dCUvDkU/NDH6rx
   A==;
X-CSE-ConnectionGUID: 6DJwFwp0S+WaDy1Weywdkg==
X-CSE-MsgGUID: bhO9JhDdQZWT7UvM1KfQFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="53986929"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="53986929"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 16:11:59 -0700
X-CSE-ConnectionGUID: 6ayOncwjQAmKapZsXhhAqQ==
X-CSE-MsgGUID: a2iii1U6R8SgIWzW2rSfoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="186622612"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.102])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 16:11:56 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 9DBD21211BE;
	Wed,  9 Jul 2025 02:11:52 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uZHTc-0044kN-1z;
	Wed, 09 Jul 2025 02:11:52 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/12] iio: dac: Remove redundant pm_runtime_mark_last_busy() calls
Date: Wed,  9 Jul 2025 02:11:52 +0300
Message-Id: <20250708231152.971550-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_161205_756828_93EAA4E7 
X-CRM114-Status: GOOD (  10.74  )
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
 drivers/iio/dac/stm32-dac.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index 344388338d9b..0988c991cf60 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -95,18 +95,14 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 	if (en && dac->common->hfsel)
 		udelay(1);
 
-	if (!enable) {
-		pm_runtime_mark_last_busy(dev);
+	if (!enable)
 		pm_runtime_put_autosuspend(dev);
-	}
 
 	return 0;
 
 err_put_pm:
-	if (enable) {
-		pm_runtime_mark_last_busy(dev);
+	if (enable)
 		pm_runtime_put_autosuspend(dev);
-	}
 
 	return ret;
 }
@@ -349,7 +345,6 @@ static int stm32_dac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_put;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-- 
2.39.5


