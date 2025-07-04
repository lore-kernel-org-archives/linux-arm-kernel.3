Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BA6C83F05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyimDtPISc5bGQOaZ31knZy0UAB3YcvDluFuIbhYNAA=; b=Kmh9JpLB4kAOZKH0lnMggHMRna
	yf6CL4DqqNEbox7rkWDmlkrH7769V7GupHSyivRc0TOrmRkDv77frzHOvMcuYzInW0FalSAg14CWM
	FtTUdNTRBgA+UmiWGHSjQAZaKlckqV9pq9sCV4rZqNaMVJZ8syVUOdOPrQRKMaoOKEzi49Nzwq+Jv
	OAxMAhx6vq0d9v0KqUK8dS/f/ARGMcsRICUzBsbYUT448gR7hk23TgBTJxSI2BnPSAxtblSQVKYdc
	By6yBMMA+r8Oyi8lV38yhkgsBv9vdBuL9ZdeRPVPP8JksbDTutY8Ru4dQ+PJY6iaTAydm6BRBMNJa
	a5VeM1tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeU0-0000000EBn1-3Dym;
	Fri, 04 Jul 2025 11:21:32 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbFG-0000000DcxD-0FYq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 07:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615646; x=1783151646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nHMM1O4IslvrfeqGodyglti8CaB1ROJeZIDQqlgaxII=;
  b=XjgSbj4SAIXbvAlmLFjnToeJPx1T9qdrQDUDNPEz+o2qmf2LbcuPcyzR
   J26XdO7ntK+AZzRwpAyO4yzD8Y/PXgSXh/R15bAVNDfcmyMfKBlifwy+G
   A0Twqexx3VaSRFQ/Ske4/9ueirHWV7D6/NaBRIkdhiWJr5u5m6j5L2lFC
   RQTBuJ6i1KluDIkV7NL9W4rpn4KFKdvkjTPUGQthprJ9YAtT46C/0hbmY
   Jpam6BDavHZsrF93DqEYAMSIBKS1JoO0GWKqFT7KrfDvAGHawQqMnO/Zw
   Kp0UAXY7pqDX7AREzE/wiEd9CUjDZ9c90GO3L5tJxpWzCGyAlQWBqk81O
   A==;
X-CSE-ConnectionGUID: eQHst+5YRXOPCZc+xfETnQ==
X-CSE-MsgGUID: 40buvxy8RnaPDo5H9gYW1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494461"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494461"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:05 -0700
X-CSE-ConnectionGUID: 7LTrMyx/QlqWGtX+avivNw==
X-CSE-MsgGUID: xH/cd10lR62+1jlZ97J90Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924163"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:01 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id 14D6944433;
	Fri,  4 Jul 2025 10:53:59 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Zhang Zekun <zhangzekun11@huawei.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/80] bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:53:58 +0300
Message-Id: <20250704075358.3216894-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_005406_143633_C7489124 
X-CRM114-Status: GOOD (  10.82  )
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

 drivers/bus/sunxi-rsb.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index 7a33c3b31d1e..82735c58be11 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -373,7 +373,6 @@ static int sunxi_rsb_read(struct sunxi_rsb *rsb, u8 rtaddr, u8 addr,
 unlock:
 	mutex_unlock(&rsb->lock);
 
-	pm_runtime_mark_last_busy(rsb->dev);
 	pm_runtime_put_autosuspend(rsb->dev);
 
 	return ret;
@@ -417,7 +416,6 @@ static int sunxi_rsb_write(struct sunxi_rsb *rsb, u8 rtaddr, u8 addr,
 
 	mutex_unlock(&rsb->lock);
 
-	pm_runtime_mark_last_busy(rsb->dev);
 	pm_runtime_put_autosuspend(rsb->dev);
 
 	return ret;
-- 
2.39.5


