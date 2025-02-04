Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9921EC02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 19:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QzNGhJruh/A3o5EKmp9puLXeHAUAwve2OQ2lbtbluBE=; b=pEItAHwW04r2/44ZvTobvE3yC3
	/tqb1HQ4o0W/wJKsv8VzHEMwnEOMDe3uOLDwFjkJPVDhaJzeB0uPzw84g0W4TWg574KK+hVHMVsc7
	EtoUxJYdZEqEuiaY/OE0gZxCcPh4oKM/vQWrxqNlNlsxZWYJ9+40FcwYz16tW9eyQmU2x4mjGVCgX
	jDhVaNn9ECwTKqucC4yX/BPpc2pZTIDYkryTNlGlF9IYsoZZJMRsxHAEBE0E8wiT2fDgRV2dc1QVi
	mYK0B3sBSXDaOi3x3Rl3ml3sR7sSaCX553Nk3LROjjI4S2yuUySO9w7svzJiUizQUAbMQRoK7p/Nx
	bTTOzLjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOAN-00000001Iqa-3e8P;
	Tue, 04 Feb 2025 19:00:59 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfMz4-000000018zs-1rzU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 17:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738691114; x=1770227114;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1fpGWk6mcJocAb/EGYVT3NiN/ozuxcKfoYEQ/m8hVfU=;
  b=JS5JJLOoMFFiL2yt0BBP38SuDRPGIK7z4n7HhdhUVhbwhTuy5Ksyz7d2
   euBrtSptLmSUVm/X0UKO6XuCQHkadrnpQ4yZZ5xbqdDARy+SDNiRvjMs+
   1JwTRBRKbW2hpc5m9n3wb8XM7uCBsqhFevGSdiAC2GH8EOhbAizotvm9U
   S5ztT0UO/H4i9Mn0Ey74gCGG38HB0V996qK+Mzcvftyv7WcSNWxEn1ylj
   ZE0ZDvLeOzxoYMa3AV0pn4NKqt0p/liD8od3TLtTzeWf+n67hcANW5djp
   A/VDNnBwB/wndf7izaUoBRMOH3096gBM6CVzlmuFgmM/3iB14p3LDRJPF
   Q==;
X-CSE-ConnectionGUID: RizCDypmThG+ISLBMZK0EQ==
X-CSE-MsgGUID: GFfMQsXXQRmYm0xE03A2DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56656267"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="56656267"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:45:11 -0800
X-CSE-ConnectionGUID: MV74HgZMSmu9/X1xXcp4IQ==
X-CSE-MsgGUID: 9ieNoHT7TsKGKxBMxnGQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141526270"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 09:45:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A96A5353; Tue, 04 Feb 2025 19:45:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Mark Lord <mlord@pobox.com>
Subject: [PATCH v1 1/1] spi: pxa2xx: Fix regression when toggling chip select on LPSS devices
Date: Tue,  4 Feb 2025 19:45:06 +0200
Message-ID: <20250204174506.149978-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_094514_559303_2725B070 
X-CRM114-Status: GOOD (  11.00  )
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

From: Mark Lord <mlord@pobox.com>

The commit 78b435c9044a ("spi: pxa2xx: Introduce __lpss_ssp_update_priv()
helper") broke speaker output on my ASUS UX5304MA laptop. The problem is
in inverted value that got written in the private register.

Simple bug, simple fix.

Fixes: 78b435c9044a ("spi: pxa2xx: Introduce __lpss_ssp_update_priv() helper")
Signed-off-by: Mark Lord <mlord@pobox.com>
Tested-by: Mark Lord <mlord@pobox.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi-pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 5f9cac41baff..06711a62fa3d 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -399,7 +399,7 @@ static void lpss_ssp_cs_control(struct spi_device *spi, bool enable)
 		lpss_ssp_select_cs(spi, config);
 
 	mask = LPSS_CS_CONTROL_CS_HIGH;
-	__lpss_ssp_update_priv(drv_data, config->reg_cs_ctrl, mask, enable ? mask : 0);
+	__lpss_ssp_update_priv(drv_data, config->reg_cs_ctrl, mask, enable ? 0 : mask);
 	if (config->cs_clk_stays_gated) {
 		/*
 		 * Changing CS alone when dynamic clock gating is on won't
-- 
2.43.0.rc1.1336.g36b5255a03ac


