Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07459C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 15:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D1Q0GyjOqvzrFA6k6racNKN1FDyU6GD/XKQYEhxOKU=; b=miDvvUkL2Y/w1VwHFkHO0DvnFs
	zGk6z3LubSYzJA/CpyPUQ4sJWvo33/9T1N9LohilMZC+P0niQu3Za9ArgPfzYVpK2l/NuXxBUx+sE
	hFzwpy8d2ktAnBkSvsuf9dOXyyBlAqlCzO+D6B+ZF9Emvkd19fVeSwktc9fCUBA2X/PIZdBKNKtrl
	uV5z7hqKv2HOgEn4g8POzohwtpMkxt/TYKQLHBOB6XO55HZnqMJdEgkcd8hig+cCx5KZYMoBSidk4
	GYYlDihOZQ6IklI3UyUNTJ7asGN7SLRdJ37iyRre2mu4JbCtyn4U7iZBW/penc4yDPemwbBQwQUST
	AeUlTrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8x6-00000001rwF-2vHP;
	Wed, 30 Jul 2025 15:42:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh8da-00000001q3O-3exg;
	Wed, 30 Jul 2025 15:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753888957;
	bh=SbTOQ2lEB8QIZMUiX91hFJ98ODaTQ+EtuSSw5D5zFFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pDU/CzXp9HMSSQdMTQd1/uZMT0xzlHqCI/2FmovyCTozo32uqDAiRNQyHhTnKPqDE
	 Baf8h2eXqDoYhsPuLzaNPZvr6n7Xh37sPbmePS1zcETFvli5E7WLk7IoJVCMb8VuWh
	 GYMzD4/RSfA5sJ47YADBmQxcPgECsWAfTOA1kgCHLlHsJVSx6stIFOMDDcY9ofSaHW
	 iz87Q7zOW/jUuww2TAt6RB9odh1+dtP3qH/n3iKxVXazNx8+WrcbJHxpBJwy8gWKRr
	 5ixkV3BhzOYna9BCgnVwT5q+jhvjnu+RRUPVJDQHb6qMa9lIL5xztTfyb1hyrmXifz
	 wqWf63mGQkTBQ==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:41d5:bfd6:7c6f:85ff])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2032017E129D;
	Wed, 30 Jul 2025 17:22:36 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: srini@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: wenst@chromium.org,
	nfraprado@collabora.com,
	arnd@arndb.de,
	colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com,
	andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com,
	bchihi@baylibre.com,
	frank-w@public-files.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH v2 7/9] thermal/drivers/mediatek/lvts: Support MSR offset for 16-bit calibration data
Date: Wed, 30 Jul 2025 17:21:26 +0200
Message-Id: <20250730152128.311109-8-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250730152128.311109-1-laura.nao@collabora.com>
References: <20250730152128.311109-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_082239_051432_9D45BAA4 
X-CRM114-Status: GOOD (  14.51  )
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

On MT8196/MT6991, per-sensor calibration data read from eFuses is
16-bit. When the LVTS controller operates in 16-bit mode, a fixed offset
must be added to MSR values during post-processing to obtain correct
temperature readings. Introduce a new msr_offset field in lvts_data,
program the respective register and apply the offset to the calibration
data read from eFuses.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index fbe735e4fd77..a45f18ce85eb 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -44,6 +44,7 @@
 #define LVTS_EDATA01(__base)	(__base + 0x0058)
 #define LVTS_EDATA02(__base)	(__base + 0x005C)
 #define LVTS_EDATA03(__base)	(__base + 0x0060)
+#define LVTS_MSROFT(__base)		(__base + 0x006C)
 #define LVTS_ATP0(__base)		(__base + 0x0070)
 #define LVTS_ATP1(__base)		(__base + 0x0074)
 #define LVTS_ATP2(__base)		(__base + 0x0078)
@@ -150,6 +151,7 @@ struct lvts_data {
 	int temp_offset;
 	int gt_calib_bit_offset;
 	unsigned int def_calibration;
+	u16 msr_offset;
 };
 
 struct lvts_sensor {
@@ -218,6 +220,7 @@ static const struct debugfs_reg32 lvts_regs[] = {
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA01),
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA02),
 	LVTS_DEBUG_FS_REGS(LVTS_EDATA03),
+	LVTS_DEBUG_FS_REGS(LVTS_MSROFT),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP0),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP1),
 	LVTS_DEBUG_FS_REGS(LVTS_ATP2),
@@ -788,6 +791,8 @@ static int lvts_calibration_init(struct device *dev, struct lvts_ctrl *lvts_ctrl
 
 		if (gt) {
 			lvts_ctrl->calibration[i] = calib;
+			if (lvts_ctrl->lvts_data->msr_offset)
+				lvts_ctrl->calibration[i] += lvts_ctrl->lvts_data->msr_offset;
 		} else if (lvts_ctrl->lvts_data->def_calibration) {
 			lvts_ctrl->calibration[i] = lvts_ctrl->lvts_data->def_calibration;
 		} else {
@@ -1095,6 +1100,17 @@ static int lvts_ctrl_calibrate(struct device *dev, struct lvts_ctrl *lvts_ctrl)
 	for (i = 0; i < LVTS_SENSOR_MAX; i++)
 		writel(lvts_ctrl->calibration[i], lvts_edata[i]);
 
+	/* LVTS_MSROFT : Constant offset applied to MSR values
+	 * for post-processing
+	 *
+	 * Bits:
+	 *
+	 * 20-0 : Constant data added to MSR values
+	 */
+	if (lvts_ctrl->lvts_data->msr_offset)
+		writel(lvts_ctrl->lvts_data->msr_offset,
+		       LVTS_MSROFT(lvts_ctrl->base));
+
 	return 0;
 }
 
-- 
2.39.5


