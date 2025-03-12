Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B68EC2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 19:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aOWkOfov6Ug8kSD3ytxhpEdz1NAHQrIAipt+pWPwsOc=; b=R6fVGE+M7+K6pCDGEaRypBFTp6
	FhDfZ5tkR0vqC8af31UBlmFuesBFf1S7GKVL0Tt6Dzabj+vtkJngYms2mFcKvGXtK99cmJJob9HJx
	TmDlZs1R22W58ZVVR7dTlVSQjRxAjjLe2tYVaP2DpDxH6uly+KJLR3Qpttu2lH4aIIWF04sBxPD3l
	WyJCgD0RGQwHbi84IvZV9sMultqVtINdIZYgmZWC8FjFtMDmS44JuCz+bRKL/hhRa0gi4ym/TBBl2
	dTgdJOtS/PFWGkZOTYqGS+zE6MWTSY4Ny8G7jxdZ3yHGpqebsHp3XW6bdPMcPnEfX4Sf97+OtoyXn
	S9FnsRMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsS6f-00000009N1w-3JB1;
	Wed, 12 Mar 2025 19:51:09 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsS51-00000009MwC-34JH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 19:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741808967; x=1773344967;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ti1igSpQFrj2iRLbg8INkCYbJeQOHwWHZWFI3mHVIgY=;
  b=k/5kjOdJzgwGpjoofTm4bep3pB4FWagRVD57xZHBryoyxjcFTwym5KF0
   nSQCGSDtOftJodhQ7+F2JYvPm83ksfWQFiiXnOwTTDy2QwVa5gA1b9qLp
   s/PU8H0gutcO/uw3xiraPqeLT+wQ3pMkEz3izO/80MX35cyLKAAhTPd37
   RV26roqqveG543Mg4q51ZZAIB9sjCLEOPd7iXpO2UvUFnFdJ0pX40+/fY
   GnsVx1bLycw+pOFwMvbT+qg5u+QiiyqchRnrOE48EVDqCS4VvLvXzlon0
   OLe5du96LhikMGSGCO0p6UfUcDQ2PD4DM+Ae5yGJjdAkoIGiYBQuIbuHB
   w==;
X-CSE-ConnectionGUID: mvcUsUB5QGS3Zi+jq81hCw==
X-CSE-MsgGUID: l26m5sZUQXuOTuTewaFsnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="53114872"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="53114872"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 12:49:26 -0700
X-CSE-ConnectionGUID: LKEHGIaeSgu21tNL5P53PA==
X-CSE-MsgGUID: unt58CmrR2y0cpRRlrqAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="151554119"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 12 Mar 2025 12:49:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EACF61F2; Wed, 12 Mar 2025 21:49:22 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] clkdev: Mark some functions with __printf() attribute
Date: Wed, 12 Mar 2025 21:49:21 +0200
Message-ID: <20250312194921.103004-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_124927_814720_3781724F 
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

Some of the functions are using printf() type of format, and
compiler is not happy about them as is:

drivers/clk/clkdev.c:185:17: error: function ‘vclkdev_alloc’ might be a candidate for  gnu_printf’ format attribute [-Werror=suggest-attribute=format]
drivers/clk/clkdev.c:224:9: error: function ‘vclkdev_create’ might be a candidate for  gnu_printf’ format attribute [-Werror=suggest-attribute=format]
drivers/clk/clkdev.c:314:9: error: function ‘__clk_register_clkdev’ might be a candidate for ‘gnu_printf’ format attribute [-Werror=suggest-attribute=format]

Fix the compilation errors by adding __printf() attributes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/clkdev.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index 2f83fb97c6fb..e0bede6350e1 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -153,7 +153,7 @@ struct clk_lookup_alloc {
 	char	con_id[MAX_CON_ID];
 };
 
-static struct clk_lookup * __ref
+static __printf(3, 0) struct clk_lookup * __ref
 vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 	va_list ap)
 {
@@ -215,7 +215,7 @@ vclkdev_alloc(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 	return &cla->cl;
 }
 
-static struct clk_lookup *
+static __printf(3, 0) struct clk_lookup *
 vclkdev_create(struct clk_hw *hw, const char *con_id, const char *dev_fmt,
 	va_list ap)
 {
@@ -303,9 +303,8 @@ void clkdev_drop(struct clk_lookup *cl)
 }
 EXPORT_SYMBOL(clkdev_drop);
 
-static struct clk_lookup *__clk_register_clkdev(struct clk_hw *hw,
-						const char *con_id,
-						const char *dev_id, ...)
+static __printf(3, 4) struct clk_lookup *
+__clk_register_clkdev(struct clk_hw *hw, const char *con_id, const char *dev_id, ...)
 {
 	struct clk_lookup *cl;
 	va_list ap;
-- 
2.47.2


