Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29811C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZM2+/DNap2XvMBkXeZdVaL7WZiTVsmAQ4E3nLTBF/zY=; b=mrM5kfZbaagbAnp8KwIqPTL3Jv
	0ROOJBviwHgZ3VIIthq1adkMKqUnY+zjJotxrzXUS9cQ+TCLssJcDYwQuCrzIaNs+uIKtDlTT5tKl
	mSf7dHEg5/h43SrkP+BWnXDGNohWxEHbs6CfloKfODM3SWryxU9Oet6qIERvMVVF+0KNf3kSsVc9s
	+64Umyo4PdbEMmo0VpB4VENU9q5e6xWq0+2L1zAuQtMbWFuUbEhbYiQ1K3jbYNoRuMAjrr2eGV3Di
	7xqgI16Z/0LSppTOBDTU8zQhVoUEN/VCpqGYiM9nhWok+SJgHslMI609/8/IvOA8yhdSxuKwEH89i
	Vnv4MuIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAsGo-00000002KNq-0lsn;
	Fri, 02 May 2025 15:25:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAryt-00000002HtW-3ftC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:07:16 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAryc-0004HG-GP; Fri, 02 May 2025 17:06:58 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 10/11] media: verisilicon: split read/write debug
Date: Fri,  2 May 2025 17:05:13 +0200
Message-Id: <20250502150513.4169098-11-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_080715_904213_48EA1B70 
X-CRM114-Status: UNSURE (   9.87  )
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

Allow a more fine grain read/write debug control. This is very useful in
case of hantro_reg_write() is used to not interfere the write debug
prints with read debug prints.

While on it, make the reg/swreg value clear for new developers.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/platform/verisilicon/hantro.h | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index e464bec47b11..7b031df5b0a1 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -367,7 +367,8 @@ struct hantro_decoded_buffer {
  * bit 3 - contents of big controls from userspace
  * bit 4 - detail fmt, ctrl, buffer q/dq information
  * bit 5 - detail function enter/leave trace information
- * bit 6 - register write/read information
+ * bit 6 - register write information
+ * bit 7 - register read information
  */
 extern int hantro_debug;
 
@@ -391,13 +392,13 @@ static __always_inline struct hantro_ctx *fh_to_ctx(struct v4l2_fh *fh)
 static __always_inline void vepu_write_relaxed(struct hantro_dev *vpu,
 					       u32 val, u32 reg)
 {
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(6, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	writel_relaxed(val, vpu->enc_base + reg);
 }
 
 static __always_inline void vepu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(6, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	writel(val, vpu->enc_base + reg);
 }
 
@@ -405,20 +406,20 @@ static __always_inline u32 vepu_read(struct hantro_dev *vpu, u32 reg)
 {
 	u32 val = readl(vpu->enc_base + reg);
 
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(7, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	return val;
 }
 
 static __always_inline void vdpu_write_relaxed(struct hantro_dev *vpu,
 					       u32 val, u32 reg)
 {
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(6, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	writel_relaxed(val, vpu->dec_base + reg);
 }
 
 static __always_inline void vdpu_write(struct hantro_dev *vpu, u32 val, u32 reg)
 {
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(6, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	writel(val, vpu->dec_base + reg);
 }
 
@@ -433,7 +434,7 @@ static __always_inline u32 vdpu_read(struct hantro_dev *vpu, u32 reg)
 {
 	u32 val = readl(vpu->dec_base + reg);
 
-	vpu_debug(6, "0x%04x = 0x%08x\n", reg / 4, val);
+	vpu_debug(7, "0x%04x (swreg%u) = 0x%08x\n", reg, reg / 4, val);
 	return val;
 }
 
-- 
2.39.5


