Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D443AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 20:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lieoZSrETeNqfqjggjcg7YjI6XZdYix99GC+0aKI1SE=; b=zfdXy5DltDUewG3EHsND4aC8W0
	6tXBexVB+hLiiGrwfGwqctpXSlJR4a8RSLP74kM2lfWoQ/xYsDd+arpMzQESwCldzxJfUvMeTdWhy
	JLFtN8at5y2AGBW9LmDSjSl/aH4bGk5dEk/V/3IXyM5MGrTWAYhTVft1aaNKISFnBbqufvMDhcHr4
	Ynb8xraioliJ3z8yaEgXzXyGZq9m2uclts98MFxknxhCFkZzqzETnSEkMHg/yY5jFCcGq7TlTNnEu
	niCp0LlT+fVdmkLdxIVQXnHEy5mgO38aZZRbo+wtLLxL4PFjWzJgSUdICluaC/q/5CpX9E7SB8ZXK
	HbMhqCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvmz-00000003eGk-09ps;
	Thu, 09 Jul 2026 20:56:09 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvmv-00000003eFQ-3BWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 20:56:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so397610a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 13:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783630563; x=1784235363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lieoZSrETeNqfqjggjcg7YjI6XZdYix99GC+0aKI1SE=;
        b=B2A8woM30j/LL1Mm9SEhHGpBHPANsVuf0ksDAk3sv8hfYI1nvVhs0o5EMONYQ6Py5f
         itYUCzIzNK4ZNQ1hM24qm1DNTzmPwkmMC61EZwPzyi+xg6QHz54Bgve3Xtspu3pDmaJn
         n9dMijmbWNexwkwYoauKOoRA2KP5a0lznFDeiuNQLgh+Thh4HTORJyinKcavRzamyBf8
         lrPA3bI/migbmLdW9WKAWedKuZn1KVBOso5idCoDZnwc7utisOjCpAraGjkWtrKdWWyF
         z8k27xSmSM/oVtfAO4p4NkRtoDnyUkrTZQWKfIpbpCJggz3lV3KW7oB/rApz9hV69NP9
         PTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783630563; x=1784235363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lieoZSrETeNqfqjggjcg7YjI6XZdYix99GC+0aKI1SE=;
        b=ZE58PeOW/dIPzZRdfZl5PjwpTOWb0ceafiVyLAd0jNfPsIIzTLAFfw23l6JBfmfl6E
         r3PVmHz/XpZHnMPWcVnI8me/KiSYC8B6HPoUM53IEv/fpI6uNQamdZPwHp8kdgS7Z/cw
         xiy4LheJ+oJ5CjQlWIkyEXiRbctaeLW+U8uKf7UJt1yIi0Wws6E6oD/9tSkePpnFxnRZ
         4xZxVPhGnAO6FglQmXQJTJCPVN01EIhooPNRWF0g1Jn/QqwV8eBRHUlmPz67ZZh4iykS
         K7Az4yQOFB6s/c9MiA5U+uEVw68yrH50UX1DyDK/EwwzCFMOjRxZchX8OekEwg+U5Ia0
         /CZw==
X-Forwarded-Encrypted: i=1; AHgh+RrlrQISFw5MxRvJPE2yPWot1JoPNDMYS2zvkbr9M+gcW/+4B4clMETNXkqwjuOx8OWrAbgJcJk0uSlL1Ft/dYpS@lists.infradead.org
X-Gm-Message-State: AOJu0YzfhbSJhbv/aSMhXt4ZGu1q+C2hHMXZ+XQsO1YZOpHWCREYxeyn
	lCyU7NfuaFn33/2xT/D5KUGkbNB7hy+cf8iK2fh25q0d6yCtWEm3JVqR
X-Gm-Gg: AfdE7cmrET1xe4Pxrf0wv/8I5Udzd8BI5905FtdvuzkAE8Wm/WdB8FSCR58gK01KbDB
	PSZE3qbW1KpYH6KthFQ2uYxdT9n+64r3dNduc8xM+2nzJbwSEaWmdhVnF8tIa4Fg25V1XMxV0ax
	+UTDJeVeC1yIrpGaDQNAVIAMJp4HBFUknceoyylRxlDcuXd4llRz6XPBGhOQWpzumap88a4ruIF
	vFItSbGY+40HYKBMmcMbXkhAdJxT3IZwjUvCCE0j4P3T1IkPVMNNXag74BtRVM7BPTg8zC0dzfo
	eLkQpuTWZRdAOrD3jxc25J6QBU09QlQO3WPXt0DH8mBUEJWGr2EQ8Of/sq2CFeS6ePExXpVt589
	pFJLTMN2h98Aym2HiPFWjRfO4+NznbiB0kgLyDxx8URceegyf1qtXe0HLmOT+7i96DgoKh0SXN9
	3e8TWHTb+Ueyu1N7z88PoPaxYChIrONnwaw36oQNUm9uKexg==
X-Received: by 2002:a17:907:3e11:b0:c15:f26a:342f with SMTP id a640c23a62f3a-c15f26a5b0bmr128439166b.23.1783630562908;
        Thu, 09 Jul 2026 13:56:02 -0700 (PDT)
Received: from liam.home (233-51-98-95.ftth.glasoperator.nl. [95.98.51.233])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm369352866b.23.2026.07.09.13.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:56:02 -0700 (PDT)
From: Liam Zuiderhoek <zuiderhoekl@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liam Zuiderhoek <zuiderhoekl@gmail.com>
Subject: [PATCH] GPU: drm: meson: inline call to drm_simple_encoder_init()
Date: Thu,  9 Jul 2026 22:55:38 +0200
Message-ID: <20260709205538.73157-1-zuiderhoekl@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_135606_024759_2B280A48 
X-CRM114-Status: GOOD (  10.82  )
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

This commit inlines the function drm_simple_encoder_init for the meson
driver. It replaces the simple encoder init call with drm_encoder_init
and a custom cleanup struct.

Signed-off-by: Liam Zuiderhoek <zuiderhoekl@gmail.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 55c0601df3c6..0dd3a76ad959 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -44,6 +44,10 @@ struct meson_encoder_hdmi {
 	struct cec_notifier *cec_notifier;
 };
 
+static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
+	.destroy = drm_encoder_cleanup,
+};
+
 #define bridge_to_meson_encoder_hdmi(x) \
 	container_of(x, struct meson_encoder_hdmi, bridge)
 
@@ -407,8 +411,9 @@ int meson_encoder_hdmi_probe(struct meson_drm *priv)
 	meson_encoder_hdmi->priv = priv;
 
 	/* Encoder */
-	ret = drm_simple_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
-				      DRM_MODE_ENCODER_TMDS);
+	ret = drm_encoder_init(priv->drm, &meson_encoder_hdmi->encoder,
+			       &drm_simple_encoder_funcs_cleanup,
+			       DRM_MODE_ENCODER_TMDS, NULL);
 	if (ret) {
 		dev_err_probe(priv->dev, ret, "Failed to init HDMI encoder\n");
 		goto err_put_node;
-- 
2.43.0


