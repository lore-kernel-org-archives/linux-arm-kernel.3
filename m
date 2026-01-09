Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16896D232EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzCE2MSivZxOJ1rbSr2C3xjv/6IK0O9prRxNJhHmRcM=; b=dl0i+RxHnAFc41MH1qzMT+rXi9
	k5aZfqpzBmvkY3uqYh9RHnrTrKGMCFVg8hYW+CKxvL22+PyyH7ma3gjfggbE6WCEquFFJPBfB/DGV
	5zLhDZ1XzNuvLceFB2E2EDsZE1DVGFITu0TOp1htBXnsO/lChinYjrs6HYAbJzhpLw4dcGaNTgvxJ
	qeHpzJ0+KbpLzrsK2R6YZjacDEspWXHPc1JnASBHf24Qu9KloltMt2hNa9RCQM9Gog3icOFFB8STp
	8cH3wvGY5Tv0PuqtA3gI8U0GCs48cjk7B9DIDFVje2OnOYuJyTHn2BpDqa2/NK8YbXkO6Ck2MzNHE
	Cz8qIVcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7RB-00000001oQV-1PIV;
	Fri, 09 Jan 2026 08:01:44 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7R7-00000001oN8-3PoP;
	Fri, 09 Jan 2026 08:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Qz
	CE2MSivZxOJ1rbSr2C3xjv/6IK0O9prRxNJhHmRcM=; b=RD0Kf+7WQaUfpGstxZ
	ffVReowiCMj0D1M6Ee0m6Rx1TYC+cTJAvU4NUe67+/qnfLBpiWGk3e/OjFapVuc3
	kuR1+Z3lBZt+RoBphTIk2n5vSvXgAi+oGCTmPxcDOVRba68ZXQAn0B0rNd0PKP0k
	w8ErSOEOcTbOF3pN5qRlpcpbM=
Received: from ProDesk-480.. (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDnzlW4tWBpx1iBFA--.64397S6;
	Fri, 09 Jan 2026 16:01:05 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de,
	dmitry.baryshkov@oss.qualcomm.com
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cristian.ciocaltea@collabora.com,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	hjc@rock-chips.com,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	tzimmermann@suse.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 4/5] drm/rockchip: dw_dp: Add DisplayPort support for rk3576
Date: Fri,  9 Jan 2026 16:00:47 +0800
Message-ID: <20260109080054.228671-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109080054.228671-1-andyshrk@163.com>
References: <20260109080054.228671-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnzlW4tWBpx1iBFA--.64397S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWxGw1UAFy5Kr48trWDurg_yoWkWwbEk3
	W8Xr1DWw4rGr9IvwnrAF4fCayIy3W29F1kG3W0q3WqyF97Xr18XFZ5Jr1jqan8AF17AF97
	W3WFqr1jkFn3JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUn0D73UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxgEQbmlgtcGcoAAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_000134_230411_7BC90802 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The DisplayPort of the RK3576 is basically the same as that of the
RK3588, but it operates in dual-pixel mode and also support MST.

This patch only enable the SST output now.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index 89d614d53596..dac3d202971e 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -142,10 +142,18 @@ static const struct dw_dp_plat_data rk3588_dp_plat_data = {
 	.pixel_mode = DW_DP_MP_QUAD_PIXEL,
 };
 
+static const struct dw_dp_plat_data rk3576_dp_plat_data = {
+	.max_link_rate = 810000,
+	.pixel_mode = DW_DP_MP_DUAL_PIXEL,
+};
+
 static const struct of_device_id dw_dp_of_match[] = {
 	{
 		.compatible = "rockchip,rk3588-dp",
 		.data = &rk3588_dp_plat_data,
+	}, {
+		.compatible = "rockchip,rk3576-dp",
+		.data = &rk3576_dp_plat_data,
 	},
 	{}
 };
-- 
2.43.0


