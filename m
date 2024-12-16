Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F032BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 03:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E81q0mlHKARsxeEjOtAQLSuYK/wvdEx4XVvmaBJNUbs=; b=48SPzBm8F7u4ZieyyH4/Ibj0bn
	hsMD9JUIHNC2QjA735WHNALrS9HxhvT/us5dMbDcBZpwSdF97NFBI5Zy7dyykVvSBOh/aylajbhr0
	1N6jkOYur6pPI35TnNrBhoMHklJHp/uTIuN8nzcM91MZfPUFFF2x5c3mI4BZ1ZS7AQWucCTgrH4bG
	yWYPMbo7bfoS7OL7biCNTHuKviwlACejHj2UR1tvfLHptfjH3n4oInzv2StnwtJN1f04iduYp5W+W
	JRqSZE9/xvloBQmrBmc2AL8w3nwKuUxssu5ONc4DBL+u0ZTwaExs7uvz2HbN+Rh0MItLLBk99KrmL
	4Zni1JQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1ax-00000008u4l-0QXu;
	Mon, 16 Dec 2024 03:16:31 +0000
Received: from mail-m127104.qiye.163.com ([115.236.127.104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN1Xa-00000008tE9-432n;
	Mon, 16 Dec 2024 03:13:04 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5cf7990d;
	Mon, 16 Dec 2024 11:12:58 +0800 (GMT+08:00)
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
Subject: [PATCH v2 05/11] drm/bridge: analogix_dp: add support for RK3588
Date: Mon, 16 Dec 2024 11:12:19 +0800
Message-Id: <20241216031225.3746-6-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216031225.3746-1-damon.ding@rock-chips.com>
References: <20241216031225.3746-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ09NTVZIQk5DGk5CT0tDSUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93cd7467c403a3kunm5cf7990d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAw6Fjo6NDIJCCEhSUgUQhAx
	FzdPCQlVSlVKTEhPSEpDTExCQk1LVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDTEw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=d5nXERDZa0rP2ifjTABNTWBGjZecv/mHnpmkvY7yHC9Bla2jc9AlvvuXMkkZpgzK6udDTSRA7Vl72HDpadzaMUzd/NFM0WlHGZu/QhykKPc4NYjyufJ+TEcS5WhyECOai0D+K/Ske7ZdLJA4IWIV1CXg3elyOK1iKfH3hN0xquI=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=E81q0mlHKARsxeEjOtAQLSuYK/wvdEx4XVvmaBJNUbs=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_191303_195992_F1FC67C4 
X-CRM114-Status: UNSURE (   7.66  )
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

Add max_link_rate and max_lane_count configs for RK3588.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index bfa88409a7ff..6f10d88a34c5 100644
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
-- 
2.34.1


