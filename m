Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A344FD15DAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 15:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbnI1mDpgJaFCT87lIpnU4wscpTjjaFgOK7UGW9hc7Q=; b=r7TlWVh16lkYLpHGIRhF9K66IH
	NxcjTVB7t6/fJ8ZzXKee7NkAQul6k1MZuZMyom7ZcwXQQtw6dLg2fl5yne8ChbLUGBEfN4KA9gA5c
	FwHtc8OEA53MjAdplbiuMuNT38fkqwM5aNiDm6DxmDIGYopfhHcYIaWRyRf25FEqIdlt2h0hSACjT
	lyFMwI3l4lOegqPisiHysDz8G8+dWHuO7D5UibHX6Vok35uFpmCqumRrM2CcGN53MTIZ/OBv0SvP5
	pPQYkWSOx//51s6jeR2Pxb1ScWSZOyqTVTmVsmwCBU5/M/8JVDah5x5yFc7Uxd8mhOVTv+buho4WT
	n8nP/XWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAw-00000006jO8-2udl;
	Wed, 03 Dec 2025 15:53:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQpAi-00000006j2A-3PGP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 15:53:43 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=peter.mobile.pengutronix.de)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1vQpAd-0007dW-Nt; Wed, 03 Dec 2025 16:53:35 +0100
From: =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
Date: Wed, 03 Dec 2025 16:52:34 +0100
Subject: [PATCH v2 12/22] media: rockchip: rga: use card type to specify
 rga type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251203-spu-rga3-v2-12-989a67947f71@pengutronix.de>
References: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
In-Reply-To: <20251203-spu-rga3-v2-0-989a67947f71@pengutronix.de>
To: Jacob Chen <jacob-chen@iotwrt.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 =?utf-8?q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_075340_862417_164F7759 
X-CRM114-Status: GOOD (  14.50  )
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

In preparation of the RGA3 support add a filed to the rga_hw struct
to specify the desired card type value. This allows the user to
differentiate the RGA2 and RGA3 video device nodes.

Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga-hw.c | 1 +
 drivers/media/platform/rockchip/rga/rga.c    | 4 +++-
 drivers/media/platform/rockchip/rga/rga.h    | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
index 2ed4f22a999d5..8953960d33bc5 100644
--- a/drivers/media/platform/rockchip/rga/rga-hw.c
+++ b/drivers/media/platform/rockchip/rga/rga-hw.c
@@ -617,6 +617,7 @@ static struct rga_fmt formats[] = {
 };
 
 const struct rga_hw rga2_hw = {
+	.card_type = "rga2",
 	.formats = formats,
 	.num_formats = ARRAY_SIZE(formats),
 	.cmdbuf_size = RGA_CMDBUF_SIZE,
diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 46dc94db6f85e..c9719c7bcfc1c 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -306,8 +306,10 @@ static const struct v4l2_file_operations rga_fops = {
 static int
 vidioc_querycap(struct file *file, void *priv, struct v4l2_capability *cap)
 {
+	struct rockchip_rga *rga = video_drvdata(file);
+
 	strscpy(cap->driver, RGA_NAME, sizeof(cap->driver));
-	strscpy(cap->card, "rockchip-rga", sizeof(cap->card));
+	strscpy(cap->card, rga->hw->card_type, sizeof(cap->card));
 	strscpy(cap->bus_info, "platform:rga", sizeof(cap->bus_info));
 
 	return 0;
diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
index d02d5730b4e3b..ee50f7f3ed601 100644
--- a/drivers/media/platform/rockchip/rga/rga.h
+++ b/drivers/media/platform/rockchip/rga/rga.h
@@ -147,6 +147,7 @@ static inline void rga_mod(struct rockchip_rga *rga, u32 reg, u32 val, u32 mask)
 };
 
 struct rga_hw {
+	const char *card_type;
 	struct rga_fmt *formats;
 	u32 num_formats;
 	size_t cmdbuf_size;

-- 
2.52.0


