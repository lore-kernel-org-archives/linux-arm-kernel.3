Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1F4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gOwUKfyGZPENQcfWwTpWValm3h3akCGZyvUqFdt/mZ0=; b=o3rhNZ6zAKHSnFYzSd0huRA3C2
	aKjumWD6UF7U3J6mRwOex5UdIXNQUAmO0qsWWaMHRex+Ed+Lol+hGR9cvaeXuquEg2BHWsfRIcZO5
	HU06CZwpwkwsEFhpN9/haiGDUHm9vYDdcEUUnw53+SJrdgVTS7fKpsjO8Qx7wqXoQ1kLTIVyRfIdV
	WzNOUzE1NHEQZhUrO6dnZIOqoCFa2QIB5cP2yuwDYi+Uzl3W7b5SWoDZadUqPq58+JVgKaHw7CB4q
	Jh0k5veR9yBrjvk+6I0+iJbP1cfKr+XN8CG9OWnlQdqBofRXPTxpbYvuOqaHOPs3vtN9dAWwaOXcU
	IDIfzYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsfX-00000005Ptx-0wGB;
	Fri, 28 Aug 2026 09:14:39 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzsfT-00000005Pt0-3Qzn;
	Fri, 28 Aug 2026 09:14:38 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowACXnDpxUZFq_zN1Bg--.54465S2;
	Fri, 28 Aug 2026 17:14:26 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] drm/meson: dw-hdmi: Propagate reset failures during initialization
Date: Fri, 28 Aug 2026 17:14:23 +0800
Message-ID: <20260828091424.6375-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXnDpxUZFq_zN1Bg--.54465S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF17Kw45Xw45WFyfury3Jwb_yoW5Zr1fpa
	18Aa1UKrs8Ar17GrW7Aa1FyFW3K34Ikry7ArWjgws7Cr1xGF45JFy7KFs5try5uryUJ3Za
	qa1fCws8uF1YqrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUFg4SDUUUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_021436_221499_A8CB8D53 
X-CRM114-Status: GOOD (  12.53  )
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

meson_dw_hdmi_init() resets the APB, controller and PHY domains before
accessing the HDMI block.  All three reset results are ignored, so bind
or system resume can continue after a reset controller rejected part of
the sequence.

Make the helper return an error and propagate it through bind and
resume.  This RFC intentionally leaves earlier HHI programming and
successful resets in place on failure; feedback is requested on whether
these SoCs require an additional rollback sequence.

The issue was identified via static analysis and manually reviewed.

Assisted-by: LLM
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index fef1702acb14..1b55d1c89f62 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -595,9 +595,10 @@ static const struct meson_dw_hdmi_data meson_dw_hdmi_g12a_data = {
 	.cntl1_init = PHY_CNTL1_INIT,
 };
 
-static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
+static int meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 {
 	struct meson_drm *priv = meson_dw_hdmi->priv;
+	int ret;
 
 	/* Enable clocks */
 	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
@@ -606,9 +607,17 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
 
 	/* Reset HDMITX APB & TX & PHY */
-	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
-	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
-	reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+	ret = reset_control_reset(meson_dw_hdmi->hdmitx_apb);
+	if (ret)
+		return ret;
+
+	ret = reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
+	if (ret)
+		return ret;
+
+	ret = reset_control_reset(meson_dw_hdmi->hdmitx_phy);
+	if (ret)
+		return ret;
 
 	/* Enable APB3 fail on error */
 	if (!meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
@@ -641,6 +650,7 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
 	meson_dw_hdmi->data->top_write(meson_dw_hdmi, HDMITX_TOP_INTR_MASKN,
 				       HDMITX_TOP_INTR_CORE);
 
+	return 0;
 }
 
 static void meson_disable_clk(void *data)
@@ -754,7 +764,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
 		return ret;
 	}
 
-	meson_dw_hdmi_init(meson_dw_hdmi);
+	ret = meson_dw_hdmi_init(meson_dw_hdmi);
+	if (ret)
+		return ret;
 
 	/* Bridge / Connector */
 
@@ -819,11 +831,14 @@ static int __maybe_unused meson_dw_hdmi_pm_suspend(struct device *dev)
 static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
 {
 	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
+	int ret;
 
 	if (!meson_dw_hdmi)
 		return 0;
 
-	meson_dw_hdmi_init(meson_dw_hdmi);
+	ret = meson_dw_hdmi_init(meson_dw_hdmi);
+	if (ret)
+		return ret;
 
 	dw_hdmi_resume(meson_dw_hdmi->hdmi);
 
-- 
2.43.0


