Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7287BD58D4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbS/T/h9zSMqC3sdnyIAxaPCqFU4fMlM51TlmewgPUo=; b=NGuoluhd3ukGf6UyeZkENrImKb
	OfMSRHOcs5W8BLl4RqTTCR/la48QRZOCEEkVJQ4+Tl6qdDDHaOKceYmwoZij3lT/foe12eHqFvIRS
	OElgyFnEqiY+IdnJtcuuw7UmpZ9Tjn2++KV9SvF4X24MO6kRMbACGFJIhJLDOsS4FQsRWbzwSRoUp
	I0/KTgSJzeLKjvcIdjedYSavFBcTw/3XaXt3QOLztblL3CTN1XyjIOvfxay0fzXO/Ib1HTkqH/xcr
	xW+miVt6ciRBcnWcIGdKL8kCK/K7nC7vH2B2L+3MPp17oGtd++KsljlzgwfjSjG+1qgw47ahpAYw1
	Y1iAv5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZWD-00000008C6R-2rlS;
	Mon, 25 Nov 2024 13:52:49 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZTQ-00000008Bcg-2Gle
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 13:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GbS/T/h9zSMqC3sdnyIAxaPCqFU4fMlM51TlmewgPUo=; b=KAQdbuXsj5xCJKm50TjrtGNp+V
	i209reSTd1vjASfKxdLD8fBDDFo9rw7cbgKuOh/DDBW6EMo0qPOscLeGyn1M+GXrejoZvGn5K9SOS
	j2a8UIvr5WaMs8p4V0eGw2tpSsrW+idP/6onXmnuUfos7yNXIZjM6ANr1FSITg076CIVZF8x3LRO1
	qP5jrh1DAi5vzDgFB+sCaoAKQnSbFb6M7nATGPlb63OEveVmQrYumytEoV18oGd5qGM4VaS0q0zCv
	EPgQXwJ0++mejMsU7xuInz2xTdUqq0DeCx2jUYXW5W88KX07VHVOJTCDDqxaEtecaTeocN3dxO43g
	DOLW70ow==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sean@geanix.com>)
	id 1tFZTB-000CcZ-3G; Mon, 25 Nov 2024 14:49:41 +0100
Received: from [185.17.218.86] (helo=zen.localdomain)
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tFZTA-000A3a-0S;
	Mon, 25 Nov 2024 14:49:40 +0100
From: Sean Nyekjaer <sean@geanix.com>
Date: Mon, 25 Nov 2024 14:49:26 +0100
Subject: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
In-Reply-To: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, Sean Nyekjaer <sean@geanix.com>
X-Mailer: b4 0.14.2
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27468/Mon Nov 25 10:36:56 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_054956_711797_D2E8356F 
X-CRM114-Status: GOOD (  11.78  )
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

Check if the required pixel clock is in within .5% range of the
desired pixel clock.
This will match the requirement for HDMI where a .5% tolerance is allowed.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 drivers/gpu/drm/drm_modes.c | 34 ++++++++++++++++++++++++++++++++++
 include/drm/drm_modes.h     |  2 ++
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 6ba167a3346134072d100af0adbbe9b49e970769..4068b904759bf80502efde6e4d977b297f5d5359 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1623,6 +1623,40 @@ bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
 }
 EXPORT_SYMBOL(drm_mode_equal_no_clocks_no_stereo);
 
+/**
+ * drm_mode_validate_mode
+ * @mode: mode to check
+ * @rounded_rate: output pixel clock
+ *
+ * VESA DMT defines a tolerance of 0.5% on the pixel clock, while the
+ * CVT spec reuses that tolerance in its examples, so it looks to be a
+ * good default tolerance for the EDID-based modes. Define it to 5 per
+ * mille to avoid floating point operations.
+ *
+ * Returns:
+ * The mode status
+ */
+enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
+					    unsigned long long rounded_rate)
+{
+	enum drm_mode_status status;
+	unsigned long long rate = mode->clock * 1000;
+	unsigned long long lowest, highest;
+
+	lowest = rate * (1000 - 5);
+	do_div(lowest, 1000);
+	if (rounded_rate < lowest)
+		return MODE_CLOCK_LOW;
+
+	highest = rate * (1000 + 5);
+	do_div(highest, 1000);
+	if (rounded_rate > highest)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+EXPORT_SYMBOL(drm_mode_validate_mode);
+
 static enum drm_mode_status
 drm_mode_validate_basic(const struct drm_display_mode *mode)
 {
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index b9bb92e4b0295a5cbe0eb0da13e77449ff04f51d..4b638992f3e50d2aba5088644744457d72dbe10a 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -549,6 +549,8 @@ bool drm_mode_equal_no_clocks(const struct drm_display_mode *mode1,
 			      const struct drm_display_mode *mode2);
 bool drm_mode_equal_no_clocks_no_stereo(const struct drm_display_mode *mode1,
 					const struct drm_display_mode *mode2);
+enum drm_mode_status drm_mode_validate_mode(const struct drm_display_mode *mode,
+					    unsigned long long rounded_rate);
 
 /* for use by the crtc helper probe functions */
 enum drm_mode_status drm_mode_validate_driver(struct drm_device *dev,

-- 
2.46.2


