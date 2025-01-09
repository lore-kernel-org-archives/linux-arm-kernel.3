Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639D6E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 03:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C1hAPTJc7QSuhxV6FNIUWt0rSqGrYqk38GUyZZwa9fQ=; b=hlym3P7/zAGRMYtbJM6Plv4cLL
	z+puSsHa29b2EgPIGbjflnO0a/XyD4jlcy+cKLGESlk7fV3A3BgrIiQR3iFOD9bDfdghTSKj2lgq5
	jmsz7XaeAk83kdWeBrB8lKw54esFwZx/mizY3diFxyNzgzr65CfcbLGA4ATr4WA37elfu0lpzjk1h
	Tl0Rzazu4uLkdTeIzY8VPNPgzHMWhHrntFVW8eRoZ3aDqGn6MJv782mB/79RMWFMjAIQqf8VfUh4i
	X7b1UBczjlQO2QzG6IupG9Jeb9rRopOH901O3XyulmT5iZtKC4e0meMrN+tC2HoR7nEQJeU7Uh3mR
	3t9yr7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjLg-0000000Ablf-1hXP;
	Thu, 09 Jan 2025 03:36:44 +0000
Received: from mail-m1973195.qiye.163.com ([220.197.31.95])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVjDg-0000000AZnF-3VYx;
	Thu, 09 Jan 2025 03:28:30 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 82c01aa7;
	Thu, 9 Jan 2025 11:28:23 +0800 (GMT+08:00)
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
	dmitry.baryshkov@linaro.org,
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
Subject: [PATCH v5 14/20] drm/bridge: analogix_dp: Add support for RK3588
Date: Thu,  9 Jan 2025 11:27:19 +0800
Message-Id: <20250109032725.1102465-15-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109032725.1102465-1-damon.ding@rock-chips.com>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkpJTVZIT0sYSkxOT01NH0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a94491b27a803a3kunm82c01aa7
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46MRw5FTIPLRQhPEtIQyMD
	DiIKFC9VSlVKTEhNSEJISEtOTUJJVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTEtLNwY+
DKIM-Signature: a=rsa-sha256;
	b=jS6AlauJP5JyoWDRM/RGHExuVWzgQXi+Ln5yWq8iRsEgl//Kc5uMZ1aLrCGAgVr08X9Nt0WjEmzfWdhlScKTzbrpV9BRLnN7hzLBjX3j2fZC9GhnOCqNqWoU2prs9eaEMT+sbRZt+FHwvk1BPNpQGBbT/qvLgER4ldu/ouTXcfo=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=C1hAPTJc7QSuhxV6FNIUWt0rSqGrYqk38GUyZZwa9fQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_192829_082377_2082386C 
X-CRM114-Status: GOOD (  10.40  )
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

Expand enum analogix_dp_devtype with RK3588_EDP, and add max_link_rate
and max_lane_count configs for it.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v5:
- Add the RK3588_EDP related modification in analogix_dp.h
- Move this commit above related commit on the Rockchip side
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++++
 include/drm/bridge/analogix_dp.h                   | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 78e78fb474d3..9cc07c028043 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1513,6 +1513,10 @@ static int analogix_dp_dt_parse_pdata(struct analogix_dp_device *dp)
 		video_info->max_link_rate = 0x0A;
 		video_info->max_lane_count = 0x04;
 		break;
+	case RK3588_EDP:
+		video_info->max_link_rate = 0x14;
+		video_info->max_lane_count = 0x04;
+		break;
 	case EXYNOS_DP:
 		/*
 		 * NOTE: those property parseing code is used for
diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analogix_dp.h
index 1b119b547988..10ea6e7759b2 100644
--- a/include/drm/bridge/analogix_dp.h
+++ b/include/drm/bridge/analogix_dp.h
@@ -16,11 +16,12 @@ enum analogix_dp_devtype {
 	EXYNOS_DP,
 	RK3288_DP,
 	RK3399_EDP,
+	RK3588_EDP,
 };
 
 static inline bool is_rockchip(enum analogix_dp_devtype type)
 {
-	return type == RK3288_DP || type == RK3399_EDP;
+	return type == RK3288_DP || type == RK3399_EDP || type == RK3588_EDP;
 }
 
 struct analogix_dp_plat_data {
-- 
2.34.1


