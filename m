Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE47EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 06:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFn9WNhIZrh97636o3Cx6G1eC6K6jAagGXa9qEDTNUg=; b=xgqbQi7MnGUwTHFm0qsb8gz8OA
	hRcN7GIK8oOSGz76o4vawtpBDvJ6MKhGN+FYl8Q1rWQJlfyilo/HZzOEdv4ve6im5r3v4iesRAGn1
	bp+O1yiiS5u3zmkH9eUkcxgEh9FxQk8myxdFdV7M1YsEbmGdV5ow6yn1uJCMBKXZCp1EP7enkSgfs
	iKGpRNLcjul2EkZ29JeHkD/cWq37uyARjsBReRMTDADodwOBCGpfHwu4bVzZfr1E+xEN9uPR+LoOp
	tqOL4P30Y80D1EZzgUDk2Ho9erjJiq5VFZZAcC1Kg1bdTpkHh6PSOkSdM1N9bcp77EziLkb5oeOyf
	d2Wtglbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhf9-0000000FL6G-3Jdg;
	Thu, 26 Dec 2024 06:48:03 +0000
Received: from mail-m15596.qiye.163.com ([101.71.155.96])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQhRQ-0000000FIh6-2aae;
	Thu, 26 Dec 2024 06:33:54 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6dc51182;
	Thu, 26 Dec 2024 14:33:47 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rfoss@kernel.org,
	vkoul@kernel.org,
	sebastian.reichel@collabora.com,
	cristian.ciocaltea@collabora.com,
	l.stach@pengutronix.de,
	andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	algea.cao@rock-chips.com,
	kever.yang@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v4 11/17] drm/bridge: analogix_dp: Add a new member aux to struct analogix_dp_plat_data
Date: Thu, 26 Dec 2024 14:33:07 +0800
Message-Id: <20241226063313.3267515-12-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226063313.3267515-1-damon.ding@rock-chips.com>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlJS1YfSEsZS0xKTxhLSk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a9401abdc4a03a3kunm6dc51182
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KxQ6Vio5MjINLkwiCTpCK09O
	GTcKCQhVSlVKTEhOSkJPQ0lCTUlDVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCQks3Bg++
DKIM-Signature: a=rsa-sha256;
	b=McH+MVFCMlLaxvdy9YIx+//j7qFgWSnbqnbrf7WVVNghO5EP8XbwFQ6c1BuyKWJJubLfBSawZ8HO5c1jXVKF79hgHz498+j6T3xiwcf/u0em1BAZXDge4nymPbW9r8L+zF7EGgeMONqaCC9yYali7MH2ySR0DKMmooR18v50VRA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=xFn9WNhIZrh97636o3Cx6G1eC6K6jAagGXa9qEDTNUg=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_223352_870538_E8BEDE11 
X-CRM114-Status: UNSURE (   7.01  )
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

The member struct drm_dp_aux aux of struct analogix_dp_plat_data can
help to get panel information through the DP AUX bus, which is the
more recommended way to obtain eDP panel compared with platform bus.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 include/drm/bridge/analogix_dp.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 54086cb2d97d..d069852f3e7d 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -7,6 +7,7 @@
 #ifndef _ANALOGIX_DP_H_
 #define _ANALOGIX_DP_H_
 
+#include <drm/display/drm_dp_helper.h>
 #include <drm/drm_crtc.h>
 
 struct analogix_dp_device;
@@ -28,6 +29,7 @@ struct analogix_dp_plat_data {
 	struct drm_panel *panel;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
+	struct drm_dp_aux aux;
 	bool skip_connector;
 
 	int (*power_on)(struct analogix_dp_plat_data *);
-- 
2.34.1


