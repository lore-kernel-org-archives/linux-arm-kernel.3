Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6A7D149D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=; b=CRjQr4vglr8LWSfzBbMZtCQbKX
	yjuLJfkg2fRThIfSbaPImgGdzUmIQi2K0KwHVGQTfCTaTjAGxYGyRCtJL3i1sFaU023nL0VQDFvq+
	FwAdFkIhAkx3v0M6j4WoNKcfsDjRvgSoUYMr8t+INeJUlp04s4hAeP3sG7nuopJq2qEfFI2+qaZG1
	WhQSRcMG6H8jDT0S+iRuzKLOg2yTxe1YE3f/xlcZI8J/+RhQiTNlvATvI4AgZ4JgpqB3WjzU/Yxzw
	czrXkfpAeswhMGrvBBadBwi6IcafL1153rPo1MT/mKvLB2hCI5CsESL/6xinTEtblWXndAoNXus5+
	pFoJsSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OCz-00000004cnE-2Ahw;
	Fri, 25 Oct 2024 17:34:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv9-00000004Xuj-3bvG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=; b=J4F+hTtnTuibJ2Ienp37C7Nhde
	uX6xUnpm/UdgRFBKMwujlp7nXVN3jwZLgfgmeJB35W6Fl+5fVrh1CDaHWg9EsY5eqCm9Cu/oMMCU2
	8x0W0Y6VW+7Zn9ec7ghf6fpswkPcNErexIxWvWJZouUrKSDtdkKo7KbfhY/ceGP/iWzKLleigITK6
	TS++UpW1QPecYhO64foshVytRnrxwYm8Wov7ZDykBixcerd/asNQ5FKv3AxqQjtPxXBogM/9bsl3E
	UONSeht8rTDdmMAhymD0+A/TMTcn4905Coy56EM+zj+6TW+t56QniRY+/gF91X6C36LhVhcydlY/b
	Dl2DqhxQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv7-00000008zkP-0IOI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-37d51055097so1492718f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876576; x=1730481376; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=;
        b=Q1XQJ5o9hsECMPljhdy2yLrM+wUCWxkTwg2bAg4BXi0SMisAQHZ7Ck9tf25isNU6bq
         is90yqMKdeKvrsK0cpBn0bvz4VR6i/bKpm7M28d23wn44F8lqbuC1GzWzwoRAgktkaxm
         919h9TSpX1QG78rxrFti1uyDSQiBEATvnrQygcWOyAuYMOze8+r3zH7oK1hJeE/zfcUn
         QXU36LvR2NBOMPw8U1egQGrK1Egpy9Q9B75U6WUhAtOdgZkNPb+kHGdeHCF/L4gIecx5
         /3M64YGNyavDMMmV0GxCNfyJyzUvhd1yv/xwChdFY2lrFoqqN1dtkC7fs4sSTIn9MrVC
         N3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876576; x=1730481376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QATmMbNk3c4g4hXx1UR19WiwFTrUbM+WoGxURwc9BNY=;
        b=g6wlLdmpQM7ydl7JAdGV9phxXFkv2XiDglnyZn2REmK/UIo4+LgrcI4Sa3VJp43rs7
         lnlSMSFcnj1lDPVqEaPGfZltpbDpy0Rqafv1Zkk7d3Sj0aDX6KBwV4RxIal7nF/bd3R8
         Ud+fq0LvhN++T10nRDElQNHADzbOfhBE/oPZg7kdZ2/cNLiO5xbzcZjbg9OqKXKBS3Pp
         PGa4rn1h71kSw6V1FScgejqSAjsbjFgcwVWjg2xLK/c7jKqCLulPkRQrEBNa6AzR67YW
         7Tkwp6uXWAKnDqsGaapBoiV0oFJjh4u0X0nO885fJIoefgNZkxbm6/qSfuh2Y+4OrsZy
         J6xA==
X-Forwarded-Encrypted: i=1; AJvYcCUwXDQwY/1unGFkt59BOIoBFIXQkas0KSRaVvvol4lUlH9YdRgzdoE2jUjZv0aoSl6Q/IIja0bUlBuE2+GyIH2V@lists.infradead.org
X-Gm-Message-State: AOJu0YzuqkulptfQJJYiRUyucMGptTEMX3cgFV42gQPQkdADnJaUB2TO
	T+DcBjz5wvTQLrhPFTBfaXNrHHid24Zd0P49PzXpQCnqeA823mEVFPGxhesgQAQ=
X-Google-Smtp-Source: AGHT+IE/VfikFrZHBGY91VEfdMxjOv4Me9kCVd0mDGc13MQEknYwxLSPdeWAl2uAqA6slK2aB7I+ww==
X-Received: by 2002:adf:fa83:0:b0:37c:d299:b5f0 with SMTP id ffacd0b85a97d-3806120c614mr82922f8f.59.1729876575760;
        Fri, 25 Oct 2024 10:16:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:15 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:46 +0100
Subject: [PATCH v2 15/36] drm/vc4: txp: Add byte enable toggle bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-15-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181617_204081_91FF4708 
X-CRM114-Status: GOOD (  16.23  )
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

From: Maxime Ripard <mripard@kernel.org>

The MOPLET doesn't have the BYTE_ENABLE field to set, but the TXP and
MOP do, so let's add a boolean to control whether or not we need to set
it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e08c90245f94..27deb4cde02d 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,6 +538,7 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	unsigned int has_byte_enable:1;
 };
 
 extern const struct vc4_txp_data bcm2835_txp_data;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 6fe378b454ca..eaf30b2cfb5b 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -287,6 +287,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(state,
 										    conn);
 	struct vc4_txp *txp = connector_to_vc4_txp(conn);
+	const struct vc4_txp_data *txp_data = txp->data;
 	struct drm_gem_dma_object *gem;
 	struct drm_display_mode *mode;
 	struct drm_framebuffer *fb;
@@ -309,9 +310,11 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		return;
 
 	ctrl = TXP_GO | TXP_EI |
-	       VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE) |
 	       VC4_SET_FIELD(txp_fmts[i], TXP_FORMAT);
 
+	if (txp_data->has_byte_enable)
+		ctrl |= VC4_SET_FIELD(0xf, TXP_BYTE_ENABLE);
+
 	if (fb->format->has_alpha)
 		ctrl |= TXP_ALPHA_ENABLE;
 	else
@@ -492,6 +495,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
+	.has_byte_enable = true,
 };
 
 static int vc4_txp_bind(struct device *dev, struct device *master, void *data)

-- 
2.34.1


