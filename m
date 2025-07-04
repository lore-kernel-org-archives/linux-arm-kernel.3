Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48699C83030
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 08:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rjRxZJV3nbGxaWMiP5JJN0ucErS1NFiXzPAZo3cKuLM=; b=fwemKqD5Ac6Lni/+t2ECaSCgkq
	kKi9sZk9/NYH800VEy0vzAv+y56JxHF//+Vm5R/k8eANRoOZLNmLZqVLJsZ+E2Wr3harOrAMmVBMU
	mBRVKaPMBWmOpoaULtXMbdxc+Umc17u5tJ0GE1fyYWLMefrsz26A5rwujtE2dyBDGHLLV4QgFVQB5
	OxSZ3y5LULwuLixyl5uyljSu30+Q9zFiRMTqEHmkrztLX35+Hm3/i7KqdY7dcB3fCff8oEMgjEbMM
	yEoGj3qPhzYcd7qwe3B4bq9wztD863UuGG5b6OQUnhGbhELfMIc5m5bu0epA1ylh8usAbg79wPOML
	Q0Y84VMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbMC-0000000DeLR-1NoN;
	Fri, 04 Jul 2025 08:01:16 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFI-0000000DcxD-05JE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615648; x=1783151648;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TYN32i5byZbG1X85V7D0gufUAODeDj4mg0h1TSE5Imc=;
  b=WrRatoHUXvEIv2kHfmdSpVWt35wQ7209PQgBSX6VXk5lrWMMekKrhdsP
   a9WGxl7esdernrPIVJ41NVZMRPMNyRvMRwFGmNwoiPiHX6N/s3yS1byVy
   OPqBEdZmne7wuyeg+tJS3n8RvjHF8c4ydDrapGEga4TG3EQHxY27FyRl3
   ZVoNmEDdvPrjMczos6RJyVkABxHa14CFrtGimZyp1ThrIpWuBpY8Y3fMO
   GWpu5ZZBzDj7n93bWHTHbzNYFDeGOay5S+6MvhdQ+lXf435bo5dhAzLpR
   JFnKiA0AwQbnRLTrskvFbWs1S3VUVA2e6LZtIebNYzRec5xMgb8lG11bY
   w==;
X-CSE-ConnectionGUID: ep/H1297Thy6/thYoMPcvQ==
X-CSE-MsgGUID: xT155rCtSVKrsQIso3tXmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494473"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494473"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:07 -0700
X-CSE-ConnectionGUID: frYQDD7rTXWTctvPTnoKrg==
X-CSE-MsgGUID: i8ml/69OSV2+5Y+rWWPkwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924171"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:03 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 0B608447EB;
	Fri,  4 Jul 2025 10:54:01 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/80] clk: imx: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:00 +0300
Message-Id: <20250704075400.3217126-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005408_103783_94370D2A 
X-CRM114-Status: GOOD (  12.51  )
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

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 1 -
 drivers/clk/imx/clk-scu.c          | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
index d0ccaa040225..1dae3410ee99 100644
--- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
+++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
@@ -267,7 +267,6 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
 	if (ret)
 		goto unreg;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	return 0;
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index b27186aaf2a1..0ef661608139 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -567,7 +567,6 @@ static int imx_clk_scu_probe(struct platform_device *pdev)
 
 	if (!((clk->rsrc == IMX_SC_R_A35) || (clk->rsrc == IMX_SC_R_A53) ||
 	    (clk->rsrc == IMX_SC_R_A72))) {
-		pm_runtime_mark_last_busy(&pdev->dev);
 		pm_runtime_put_autosuspend(&pdev->dev);
 	}
 
-- 
2.39.5


