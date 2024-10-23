Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8555FD2E021
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yduD7Yur7A49ZoLtK/EhMGC3yO42q7dr2dI+lhwPQOE=; b=FZ+ZucLkkRQCHogzEOoPfd6t6W
	R5c+SrlGnluyhTPRA/cQL9ORjhYiIlJt41HAzHUs4O5RRrN52vnLUaI8LiL2jM/xnJvdUzLicIMPK
	av16KfiMlxmydEtC9VYnkTclWwWnqn5OPPW/n2EHJqixssGIrHncAsxj5q1YrU7Xjgj4uby0KAlZJ
	dMfYAmqIcuPFSpjryNjaEoInYHlJDEZ8kPLcOUTknAHzrd//8cjzRxHRzEj2hs7Cryk0XXFIljQJ5
	qqnxZ2GOgA8ZnHljKRBDiuxeRQLNQDEB+ItT39Yxjtyoo1oykM2ribSgFPfhpEfGxoWVyWlqDalAC
	mw91dS9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wgo-0000000DYZY-3WIL;
	Wed, 23 Oct 2024 08:25:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WU4-0000000DVxh-2i1Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:12:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTv-0004YU-3E; Wed, 23 Oct 2024 10:12:39 +0200
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTu-0010Hk-1f;
	Wed, 23 Oct 2024 10:12:38 +0200
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1t3WTu-00FrPY-1M;
	Wed, 23 Oct 2024 10:12:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 23 Oct 2024 10:12:30 +0200
Subject: [PATCH 3/4] nvmem: imx-ocotp-ele: fix MAC address byte order
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-imx-ele-ocotp-fixes-v1-3-4adc00ce288f@pengutronix.de>
References: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
In-Reply-To: <20241023-imx-ele-ocotp-fixes-v1-0-4adc00ce288f@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729671158; l=2098;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=Ss44dTfozznrGkGw5ypZa27kr0ux3PCowUrrQmM38eM=;
 b=gvNFy2NDPhoLC81Bwz3lLc0+TPlOsd2dBi01QS7ETe3QHj/VSMS+9Ug99BfKgd+O5V7tlWgzO
 ZyIROFX9HUPBYm1kMFshH032+PEDiJcxTnowwxSUwkt23rTBUsrHCId
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_011248_856019_AC3AB7D1 
X-CRM114-Status: GOOD (  15.99  )
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

According to the i.MX93 Fusemap the two MAC addresses are stored in
words 315 to 317 like this:

315	MAC1_ADDR_31_0[31:0]
316	MAC1_ADDR_47_32[47:32]
	MAC2_ADDR_15_0[15:0]
317	MAC2_ADDR_47_16[31:0]

This means the MAC addresses are stored in reverse byte order. We have
to swap the bytes before passing them to the upper layers. The storage
format is consistent to the one used on i.MX6 using imx-ocotp driver
which does the same byte swapping as introduced here.

With this patch the MAC address on my i.MX93 TQ board correctly reads as
00:d0:93:6b:27:b8 instead of b8:27:6b:93:d0:00.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/nvmem/imx-ocotp-ele.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index b2d21a5f77bc1..422a6d53b10ef 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -111,6 +111,26 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	return 0;
 };
 
+static int imx_ocotp_cell_pp(void *context, const char *id, int index,
+			     unsigned int offset, void *data, size_t bytes)
+{
+	u8 *buf = data;
+	int i;
+
+	/* Deal with some post processing of nvmem cell data */
+	if (id && !strcmp(id, "mac-address"))
+		for (i = 0; i < bytes / 2; i++)
+			swap(buf[i], buf[bytes - i - 1]);
+
+	return 0;
+}
+
+static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
+					 struct nvmem_cell_info *cell)
+{
+	cell->read_post_process = imx_ocotp_cell_pp;
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -137,6 +157,8 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.stride = 1;
 	priv->config.priv = priv;
 	priv->config.read_only = true;
+	priv->config.add_legacy_fixed_of_cells = true;
+	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 	mutex_init(&priv->lock);
 
 	nvmem = devm_nvmem_register(dev, &priv->config);

-- 
2.39.5


