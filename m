Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB83BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 14:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVzJm2W1uVdEFEZWkXxZ+spN7k+YpzBUagSYY5jbkr0=; b=Kmto5k++PmEDsOIV6gxcke3lgY
	w5xwgp1OPMOlvR4jaEHRuoDQ9bDVzI8rNRysqk3rSLUuQiMPFBIEd7wvbIvxDmDM4rtBUlGI44c0b
	Z7Ffu0pV6WEunO3a2WEoUvdkHln/Z6dEa5ewICOCoU16auXfe36iU82ZVD6mM9Jzjdf1vQ1dY11p2
	is1NcdZ/IQH6MvanEH2ljw69ilZbdp6lynu9ka6yaJEegUSNr6UcC0r2lnaTNrLyWaLZub/PN38TP
	ZCWYb9kVJaD63AL1a17tweejoQ++77gO6H1ZWMfzBIknIBL+YZA0l3zpNMcDvyPimUrRm4u3c3vgo
	PE2ImDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAoY-00000005H1i-2gyt;
	Tue, 07 Jan 2025 14:44:14 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAk2-00000005FiN-0TSW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 14:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736260774; x=1767796774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XVzJm2W1uVdEFEZWkXxZ+spN7k+YpzBUagSYY5jbkr0=;
  b=WBTSAxUR9mNrGrB+BIXE05KLc1UrUR4nXpOfezQo/ygIPECuTJXORTi5
   0sl8K38wfYq6X/QK/RISe43td7xKG++7PnM14jUDhv7mSnUQGc54JbXIH
   myuFffUwCYP5ZsYWzPrnPi3Lu8ouCnAc6IBfrZSNlYAo87vAFQKIIprZZ
   z2OajiDg1t5UAqz7gq+k60F0SaCEnHB/e5W6EPYWvLrZwUifF7LatIbUD
   xxuvBZZk6MvdvSEYE2pHpRZvjCqVLehwn2HO9ReHvkP6xrX++VDN3TCEX
   XYuyx/WCmrzgYsmgrmgjdcA7xgFTZm4s5yPnVjhg2IxRTET+uLCEotr9I
   A==;
X-CSE-ConnectionGUID: jIb3ypKkSKyrja3ThHtuZg==
X-CSE-MsgGUID: kaeze2RMQtO2pwYlPLFHvg==
X-IronPort-AV: E=Sophos;i="6.12,295,1728943200"; 
   d="scan'208";a="40897250"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 15:39:33 +0100
X-CheckPoint: {677D3CA5-14-1D00F64B-E6C57517}
X-MAIL-CPID: 800858C3296ADFDF66C2AAAF0E539E43_3
X-Control-Analysis: str=0001.0A682F15.677D3CA5.0092,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D6A6160B22;
	Tue,  7 Jan 2025 15:39:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736260769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XVzJm2W1uVdEFEZWkXxZ+spN7k+YpzBUagSYY5jbkr0=;
	b=EllWyCh9SvK4sD0noz8TqzYTsz87MPpHWGJx3iLQ+dsF4rFFUyeHuv1JxV6vKmssHezoYt
	vTdohZGKG3dXtwtlZPtTrrjWt5N4YboIORAs9Sua9hyqOX2tZrst+K+QI/46AENHPx5Pw0
	LRUGxZsTI2SXuJAqQnIHZtgybEKhB7Kq5+b6bb5DkO5n0mwCI6BmGb88YONYQfvZFhN1gF
	sWAcDONNQjMJ5WIPpwnVFPPf/RGNKz9onpxeEdDQF5q52W9kMbfuCT0pEvHGP2KgKpCx/l
	kT08aoo4YIE8s/bk77hnylJcSUn4UaxoDyMs+6u/T44ThUXJk788xpTPUAhhuA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/bridge: imx-ldb-helper: Use dev_err_probe
Date: Tue,  7 Jan 2025 15:38:59 +0100
Message-Id: <20250107143900.988567-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
References: <20250107143900.988567-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_063934_456443_27FFEA81 
X-CRM114-Status: GOOD (  13.03  )
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

This simplifies the code and gives additional information upon deferral.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/bridge/imx/imx-ldb-helper.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
index 9b5bebbe357dd..2c9b862af74af 100644
--- a/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
+++ b/drivers/gpu/drm/bridge/imx/imx-ldb-helper.c
@@ -167,7 +167,7 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 {
 	struct device *dev = ldb->dev;
 	struct ldb_channel *ldb_ch;
-	int ret, i;
+	int i;
 
 	for (i = 0; i < MAX_LDB_CHAN_NUM; i++) {
 		ldb_ch = ldb->channel[i];
@@ -177,14 +177,9 @@ int ldb_find_next_bridge_helper(struct ldb *ldb)
 
 		ldb_ch->next_bridge = devm_drm_of_get_bridge(dev, ldb_ch->np,
 							     1, 0);
-		if (IS_ERR(ldb_ch->next_bridge)) {
-			ret = PTR_ERR(ldb_ch->next_bridge);
-			if (ret != -EPROBE_DEFER)
-				DRM_DEV_ERROR(dev,
-					      "failed to get next bridge: %d\n",
-					      ret);
-			return ret;
-		}
+		if (IS_ERR(ldb_ch->next_bridge))
+			return dev_err_probe(dev, PTR_ERR(ldb_ch->next_bridge),
+					     "failed to find next bridge\n");
 	}
 
 	return 0;
-- 
2.34.1


