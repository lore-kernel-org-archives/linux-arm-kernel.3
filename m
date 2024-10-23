Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99D4CFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHsrd+uLJ3zzJTfflluftUpg1xM7uGde28YhgXiEaII=; b=tlQNpWd+/E2QQ9z5mKT7eY6Rhk
	gcvWTt900GBwDAElrDOqZitbmeyDRIzZK8lguBwQj0WsyE7m47vPalagm88gBOa3/fX69xBHT6RRs
	xZ1LncPxUnQ5d+hf4dgH74SdRBcKvWIlQdcgqKsNYXvC5+k1Tx9rPLJJCugW3ipc5dqvr/9i6H3ZG
	Jd/a8mhbQHEdHcyu7Dnej95hBRT5cxryyEMONz2qC7uATHzjMvnhpVlTABLr8ZG8XIVZxWfzuxGwj
	8p9hp0v97/poQ5L1st3CC63IZ57LQktkXd2+Tgs0CN9byfeMowG2Y+OFKM/Ckq2wjPATJaG/iyfZg
	ZpRvrTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fYu-0000000FRdQ-2mHO;
	Wed, 23 Oct 2024 17:54:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYs-0000000FDJA-2PU1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=DHsrd+uLJ3zzJTfflluftUpg1xM7uGde28YhgXiEaII=; b=dWHzLri1dsdSadl+g9nKXl/IFo
	9zkSFnwA8wrCJvpQA24DJwqe5GzMp9OZs9/+osQMQMXkrAjawj1YGxiklurflwg8KUwEPDXrF03qr
	2EhfAZnTR6VXp6SoIcgo98edYs7tYUn7qNpIwlgS8N7MJ0A5R5b3uX07/b91rSJ32kcLb+iY+xC2l
	kIhHjq9H8mNW7w0Uoce5lKHkP+C2x8oYZFgHyBV9WMB3+Ip2cyKjOtqIa5CkaPdNd2oHC6niT0QOa
	HJXAdJY2piUW+5qD3U+ZkJqW0+v53gmyBJn9PMv9CFlMxDHCFlC5NexI7HCuGN7ss+71m8+uwtOFS
	cKH/BvAw==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYo-00000008T92-0mla
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43163667f0eso55398015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702211; x=1730307011; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DHsrd+uLJ3zzJTfflluftUpg1xM7uGde28YhgXiEaII=;
        b=IWOPJhUCFeQX22NPJw9hsROaHCycsekEk5wwUccLczKRfZ32Hv+Za6QJZu930VHbvd
         4siV5TZm9uiT3Hp319BPKOGzo+DHiRr+66JRw2pVETIuCtZ6AjnuP0jgrG/L0O/vNwKg
         7INP2uaePY9WAMfG/r7kK0F9pBL2QEnagYn1skx4XfzE5a7oJzUg/SrMbBqjTACXFtU6
         BdMCeJu25nJq9/XHM9qjvTxGQIdrc1LJsLWW2Azu4EsNrr82U/F8Op76WicAIxJ+w9IA
         zE3G6+57OaDcuymxVaQPS2nyhLZSX9zwUWu/WXATtHkquY63LtxNUdpPoyS/RvPiqaCb
         vF6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702211; x=1730307011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHsrd+uLJ3zzJTfflluftUpg1xM7uGde28YhgXiEaII=;
        b=C6x1i/hiE9awnVQGeiENP4aFEAkkVp1stRrEsUajOYvRw21Ky3Rxxr+pcpQ602fKfY
         MJ1LGpRGQFvzwqSWBLvI+/qfY+6J/CPnbBv1kfyvKKA7PKxGJUaIX7lH7Ngi89zw5PZo
         jQn5Xv7MU6hPm5IOATi/v4fKWfHG4pI4+W89yutHDR4aN/O3ctS9SmswgNMjBtswPVX9
         2vKgtHOnh+wSptTtD1eAjHDbXWIVVtg99YR+ah+hABI8w6PfBiXiWaCDwpZw9Z+Kolkh
         IgJHueSZLEOsn6p+IucQexho10VOstUppGOaWedch/hj0XGTV/y0LtITzvxsg0ggZzDq
         jWNw==
X-Forwarded-Encrypted: i=1; AJvYcCVaYkJHVS3YAnAyvO6XcAEOQb00r85QpWtGcm3PgMADTAsUsusRdiMCLV19Tg+UkW+MdCAKEn5XzOVdlIUEL2X0@lists.infradead.org
X-Gm-Message-State: AOJu0YzsmFX13LvzghpdfQLocNIeMq7xUblPrreVu1g3B+QXwb8bcu0F
	otanRliIgMLYGTnKD9QBoWd5tgvMSKlmav+bDkaFc956tYzJNw6B7P4fyayeF4Q=
X-Google-Smtp-Source: AGHT+IERhAzD85giYVwWPW2yr0xeM1afTBRNEqyh3+VJ9Dt+uRH4uKHHawanviz9+PlgBvlZWTrZUA==
X-Received: by 2002:a05:600c:3b07:b0:431:5c1c:250b with SMTP id 5b1f17b1804b1-431841e0ff1mr27913915e9.1.1729702211354;
        Wed, 23 Oct 2024 09:50:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:10 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:00 +0100
Subject: [PATCH 03/37] drm/vc4: Fix reading of frame count on GEN5 / Pi4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-3-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_175014_379453_D572DD0F 
X-CRM114-Status: GOOD (  12.59  )
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

The frame count values moved within registers DISPSTAT1 and
DISPSTAT2 with GEN5, so update the accessor function to
accommodate that.

Fixes: b51cd7ad143d ("drm/vc4: hvs: Fix frame count register readout")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c  | 45 +++++++++++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_regs.h |  6 ++++++
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 1edf6e3fa7e6..f8edb0791091 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -272,19 +272,42 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 	if (!drm_dev_enter(drm, &idx))
 		return 0;
 
-	switch (fifo) {
-	case 0:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
-				      SCALER_DISPSTAT1_FRCNT0);
-		break;
-	case 1:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
-				      SCALER_DISPSTAT1_FRCNT1);
+	switch (vc4->gen) {
+	case VC4_GEN_5:
+		switch (fifo) {
+		case 0:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER5_DISPSTAT1_FRCNT0);
+			break;
+		case 1:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER5_DISPSTAT1_FRCNT1);
+			break;
+		case 2:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
+					      SCALER5_DISPSTAT2_FRCNT2);
+			break;
+		}
 		break;
-	case 2:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
-				      SCALER_DISPSTAT2_FRCNT2);
+	case VC4_GEN_4:
+		switch (fifo) {
+		case 0:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER_DISPSTAT1_FRCNT0);
+			break;
+		case 1:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER_DISPSTAT1_FRCNT1);
+			break;
+		case 2:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
+					      SCALER_DISPSTAT2_FRCNT2);
+			break;
+		}
 		break;
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		return 0;
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index c55dec383929..341a75cf92e5 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -418,6 +418,10 @@
 # define SCALER_DISPSTAT1_FRCNT0_SHIFT		18
 # define SCALER_DISPSTAT1_FRCNT1_MASK		VC4_MASK(17, 12)
 # define SCALER_DISPSTAT1_FRCNT1_SHIFT		12
+# define SCALER5_DISPSTAT1_FRCNT0_MASK		VC4_MASK(25, 20)
+# define SCALER5_DISPSTAT1_FRCNT0_SHIFT		20
+# define SCALER5_DISPSTAT1_FRCNT1_MASK		VC4_MASK(19, 14)
+# define SCALER5_DISPSTAT1_FRCNT1_SHIFT		14
 
 #define SCALER_DISPSTATX(x)			(SCALER_DISPSTAT0 +        \
 						 (x) * (SCALER_DISPSTAT1 - \
@@ -436,6 +440,8 @@
 #define SCALER_DISPSTAT2                        0x00000068
 # define SCALER_DISPSTAT2_FRCNT2_MASK		VC4_MASK(17, 12)
 # define SCALER_DISPSTAT2_FRCNT2_SHIFT		12
+# define SCALER5_DISPSTAT2_FRCNT2_MASK		VC4_MASK(19, 14)
+# define SCALER5_DISPSTAT2_FRCNT2_SHIFT		14
 
 #define SCALER_DISPBASE2                        0x0000006c
 #define SCALER_DISPALPHA2                       0x00000070

-- 
2.34.1


