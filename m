Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385A9CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J1OB9wrnfRrLpJRqO2TJVsU1eDqTHG5eRxmlRnhudiw=; b=OLwA6FCZjY9gBMpyNDQKXor9eV
	tWU7t2vMA9Cnxe0giLZNLpzWZMqssp/jE+RI16NfVRm0ZanuhMmonpR8rhNkYUQ4dTB8KTlaYJIlq
	aeJX5hBjKDged1ofjJmF6976+d39Zx4tLeU8y/wNj9tXoD6zQDSUgMbPXuFm5d2PoKCe0TjjOVDjj
	H4mndhttJo/qJHIXkTqil1D4ofQGbWIodi1CB+PNvJsno6cn5dYkHvOfKELCNi5N7Q3/b+Rip0F9m
	91YCg+bSrVs9rBHkcqE2ayDwCILcGPi+IC7MgyNWfoQWtDFDyxYW2h49UPZodA9AM6GBPvFbp+45j
	M6zZHymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNML-0000000E3YD-1BxX;
	Mon, 27 Oct 2025 13:34:05 +0000
Received: from mgamail.intel.com ([198.175.65.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNMJ-0000000E3Xc-3U7X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 13:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761572044; x=1793108044;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pDOIWQm2Pb2yaskYb7YG9zNBNAaV4QP98n/IzFf/fTs=;
  b=PUyEtdkPdOkIbLvrEUjQRUbN8whL0O5KTdHvtZNvUf4fgxXS4KsAyBtA
   AV88kIANXhDf2aErBDQx9Drkx/M7zFkZ4exLiQr/JHBd8Jwo/Zi/0Dudg
   1obJH87Y2lgVUJvnA10x/3gmljqrpmnORt0Frbn8B2TA8mvQ6F/aNZBo/
   EEJOAykkZ9r2wtaimagY/NtZDCATx/YOcHvxGHmZrJmvPQQOZe7XPa90h
   eBkETO2N2exVAzzvDHTW0MjBO60m6eoKOT/pMs3P3A/DAHmTrTMn2HlJL
   zUyUIXfjr9nO8Jgr25qEm/JhnCrRe+gw+v87nnYPwGhELxNZr6YqgTQjY
   w==;
X-CSE-ConnectionGUID: K/xt+ppYS/KBIzKRz3Szrw==
X-CSE-MsgGUID: 68yjTRmbSyWDJLADQjEerQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63573361"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63573361"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:34:03 -0700
X-CSE-ConnectionGUID: MAweIGDcR+6Uu4QLokWN1Q==
X-CSE-MsgGUID: oyiT45llT5+5Seg48/7Xrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="190256817"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 06:34:01 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 2898B11FADA;
	Mon, 27 Oct 2025 15:33:59 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDNMF-00000001eEe-0bu7;
	Mon, 27 Oct 2025 15:33:59 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/1] bus: sunxi-rsb: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 15:33:59 +0200
Message-ID: <20251027133359.392984-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063403_918978_F85F4144 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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
2.47.3


