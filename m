Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC49CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 19:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ix3tqGj9O/73OPDzykQq3AN3AmgT+JSGiiTMGr+5/U4=; b=39KRxSOIb2sgLZWS5cMG1GGXwz
	uOM/T0okqQnlWzxLiuxHu5jdI+TtbIqzKvV+TrkdAq/1a3buBEwUcgCGsphrPXY0jd4eF0oPOgFUt
	7fyoFjmzaMvtbg055R491aHm8HOBVDAYW3mGrZ0owBhIJ4OtcnDwTxoB0HUn7/lP92yna9TQbo0CE
	Az+LeUT5eFj/oUCUB2/5X9W9JPbdHRfcnBIDR5oVnrm914dVvBnijHmIMKlB0qWFXQHT2Qc6kkzmc
	Sar1vMgdQg3oqy1HNkV8lknQjV4CS5OphDBNbQ4vAekWrBVUnSkj7eX1nUEEL8boKxp9TW88UMBPy
	vz34XZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3wh-0000000GlCR-2uA2;
	Mon, 18 May 2026 19:48:11 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP3wb-0000000Gl8l-1hKQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 19:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779133684; bh=ix3tqGj9O/73OPDzykQq3AN3AmgT+JSGiiTMGr+5/U4=;
 b=i9wkstBjXuW2iJ6R4OUVlT8vfxaw27j0cPBdGbQnqZFjCw9Tip9JsBwAwTHTIYamUKQWxroy9
 LZj/tswsd9FiD+0iCTPXnoLDaqi+ZLTcvw2NoAOWiLd6eB/X99jDGwtWlCsUqV3JS23oMFDEaQD
 AUVqE/YYQ1zHEX/dW5WBzORZlOSnS3kryuWf30XNfVzhmyv71YDrW7OIDmTqXSBY0DTiM39sC8l
 Py0QMvIpBkma/aDte5A5Ibifl/k5V0DfFrJoUuS+aN5Tj5girs4+QcQYOsdHr+m4OnnXwFpTYOh
 mLQ8y40QT+astmZcRA6fAh4WSQpHx/mjI5cP90lgFBvw==
X-Forward-Email-ID: 6a0b6cecb74b0ebd362eee20
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 01/13] drm/meson: dw-hdmi: Report connector status based on HPD bit
Date: Mon, 18 May 2026 19:47:29 +0000
Message-ID: <20260518194744.2483580-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518194744.2483580-1-jonas@kwiboo.se>
References: <20260518194744.2483580-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124805_526293_44AE3AD2 
X-CRM114-Status: GOOD (  11.49  )
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

G12A added support for RX-SENSE, status for both HPD and RX-SENSE is
reported in the TOP_STAT0 register.

Limit read_hpd() phy ops to only report connected status based on the
HPD status bit in TOP_STAT0, to help ensure that EDID can be read from
the sink in the connector detect() func.

Fixes: 3b7c1237a72a ("drm/meson: Add G12A support for the DW-HDMI Glue")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 ++++--
 drivers/gpu/drm/meson/meson_dw_hdmi.h | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 2a8756da569b..993f6d5d4b29 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -457,9 +457,11 @@ static enum drm_connector_status dw_hdmi_read_hpd(struct dw_hdmi *hdmi,
 			     void *data)
 {
 	struct meson_dw_hdmi *dw_hdmi = (struct meson_dw_hdmi *)data;
+	unsigned int stat;
 
-	return !!dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_STAT0) ?
-		connector_status_connected : connector_status_disconnected;
+	stat = dw_hdmi->data->top_read(dw_hdmi, HDMITX_TOP_STAT0);
+	return stat & HDMITX_TOP_STAT0_HPD ? connector_status_connected :
+					     connector_status_disconnected;
 }
 
 static void dw_hdmi_setup_hpd(struct dw_hdmi *hdmi,
diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.h b/drivers/gpu/drm/meson/meson_dw_hdmi.h
index 08e1c14e4ea0..cb4616daf667 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.h
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.h
@@ -157,4 +157,7 @@
  */
 #define HDMITX_TOP_STAT0                        (0x00E)
 
+#define HDMITX_TOP_STAT0_HPD		BIT(0)
+#define HDMITX_TOP_STAT0_RXSENSE	BIT(1)
+
 #endif /* __MESON_DW_HDMI_H */
-- 
2.54.0


