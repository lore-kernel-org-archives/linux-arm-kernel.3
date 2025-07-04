Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D3EC83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwgvG2OF//PuC7kNCfh3X4X1OODYMNI8I+SeAjJyLy0=; b=Q/JYnNswLC2uGR4bOeVRR9z5/m
	HlyrN1Fq9FlHWSi62G/AD7HY/6H5T0F5arRUXtx/UfuY4up60SfedTzyzome9dgcOxWSg3uoHXF/F
	VVQhyjrYwPlmd3qjpv17AD6aGniZSJPh/hbPQgLi1CIpwY6bRjgcI+BAHZUdGqRAH86okqqc+EvK0
	oiY1/6JlFmjLgyNzG7J1Vg4KOI4/jQUuEmPZWZGTrwhj8j8d+C3fM55kauV3ZjPHfO9oSJFUQFd/Z
	SJ101hstjzHLAect1ovkxa2bV7EOgcHaOul31zu485UT4twfuSsTKH4Xj024EyhdyHdVNEy0Y97IO
	ioMF/KPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbei-0000000Di4F-1Meg;
	Fri, 04 Jul 2025 08:20:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFi-0000000Dd6g-27u3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Jul 2025 07:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FwgvG2OF//PuC7kNCfh3X4X1OODYMNI8I+SeAjJyLy0=; b=BUZox0VoFjehEwG9aTtklKhYWR
	+gA5oIh7AiuaP9OqUkIXZciHNy8ZLXojwAS1PQbxCfnvY3zNWI2Q2BS7sBxOC8XXw4VNHqnUu2vID
	4qcugvlPEnF94R360QeH/1Fe9wU9CVq8WHbhbZsza6Uwc1HjP7xhgbv5G70T0b0pkngi8EU8v258Y
	JpR4r1EG+aFyqZAiWBlAWRI1ZB69MBkrbsskgWztB/801f1CFfzYjx99+rJsn1SYfttW3TTHDLW5J
	U6wJsgLw+9IA4DpeGYgv49X5cYOLnDbXx1yjWa7msewjn8TD6GRWq2QtcEmV1focQfN8JFdK6P0qz
	nhxrBUSQ==;
Received: from mgamail.intel.com ([198.175.65.9])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFe-00000007piV-054k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615670; x=1783151670;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iWBWM0U4T919tQGPGfn9BScin0AJyspS/yqsVimSI2Q=;
  b=AfRJ1A5Kp9diCush0N2Iz6z7qOFvR5pdOMwodlhAqeOKtMJra0fykt+I
   gH+0NrKF1BDFbQB3GYdBYL8XhENggSuUQLSHCd7dhkrFgX5y+8KYwOua0
   ol8t4Zf8uvzofj10Xq6UFBaUUCWuu1Sz0KM/U7g1xlAAkVXbf0J9vw8oY
   2v/gJ2ILTc43zyoGUfCcuQ/PspzmvQCfVwLgr4w6dWwEub9hfwnfXIuI6
   2AX83aAMIMwPjXdngPwwvraY9nP6CA1nrNioSdQLV5XCjahD2+GAdNFQX
   IU/bjdcHyw1WCkHNuxMfwCnyKAjr1K/g/jxWGbicGFc42gxt8TSAx8IXO
   g==;
X-CSE-ConnectionGUID: sgrCu3umQaOwIdfzbTxRYg==
X-CSE-MsgGUID: 90tCYccmS1abzXopriv2GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494645"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494645"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:27 -0700
X-CSE-ConnectionGUID: 1PPAJs0KT4yeS0NQgpsEJA==
X-CSE-MsgGUID: PargF/5ZSQyGI5qazvbrfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924271"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:24 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 4FF4244A4B;
	Fri,  4 Jul 2025 10:54:22 +0300 (EEST)
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
Subject: [PATCH 31/80] iio: dac: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:22 +0300
Message-Id: <20250704075422.3219331-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_085431_733265_8B39F1A2 
X-CRM114-Status: GOOD (  11.24  )
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

 drivers/iio/dac/stm32-dac.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/iio/dac/stm32-dac.c b/drivers/iio/dac/stm32-dac.c
index 344388338d9b..7d47c7dddbf8 100644
--- a/drivers/iio/dac/stm32-dac.c
+++ b/drivers/iio/dac/stm32-dac.c
@@ -96,7 +96,6 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 		udelay(1);
 
 	if (!enable) {
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 	}
 
@@ -104,7 +103,6 @@ static int stm32_dac_set_enable_state(struct iio_dev *indio_dev, int ch,
 
 err_put_pm:
 	if (enable) {
-		pm_runtime_mark_last_busy(dev);
 		pm_runtime_put_autosuspend(dev);
 	}
 
@@ -349,7 +347,6 @@ static int stm32_dac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_put;
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
-- 
2.39.5


