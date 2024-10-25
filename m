Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44492D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xU//JPSDEyUFE1ZFqfKvgV23VREouvKrVYoOcahlOXU=; b=ZofhZTbyH0zkv0lVlkUxDWGPqb
	369N+ues4dqhRIlia67Ms2Ip9+DYuaFZN54dhVdOqIKE6eVgkvdrKZH3EDzwf4Er3gstkmj6a5GnR
	Q+broBOxQTcX95Ael1WpAMrku7+4dVnjKPy3/t6MPj/Wa1hQyUssTCnPIfRnHmFiqhdwNtxYjy096
	zDtapKTAGlPsBz/D/2oX5Rv2/bUKq+49oxZrrAldJSUj6KBSAvmCFeNPpB+hMLa7PyxGEXpObPlpH
	KsOA8EsKh0CKpqow6oBbx2kmhBQ7460tc+ZvDhFl+7zTDxYjcMdNjUe08f/KwVvuyqtpbwdM7fAG4
	5hfYG25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OLZ-00000004fHC-0g8a;
	Fri, 25 Oct 2024 17:43:37 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvD-00000004Xx4-0TSk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-431616c23b5so16376455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876582; x=1730481382; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU//JPSDEyUFE1ZFqfKvgV23VREouvKrVYoOcahlOXU=;
        b=Alzx9MSTl+xMRGbU4Gp2mbxnyFmAy7x7msr67NK2F23O5X+77TXH/Nb8aCegTO4WV0
         QIe2WOpmXb1lIBfXS+dzUf8QIXQlZNQkjqtBiiuZAEZ0mD7aeZwzSQN9JZjYtfDEeL06
         RS/l1xYl65rcrnx6NlCKVCeio+JidDxlMwTny279Jry8my63fx3b4nedc5VoOOECHQuR
         6RIQ1dL7GbbdcAwE/9YcH0dAD5xWgt0xlH37LoXN4eNUTHzN9NU9Q9PW+4ezZPD3fBZl
         Y5xWJLmZiJZNpl6nKIQVvMYdvNFWTpSvElVpmartyGPwMduAshAW+gWa2tHLHLA9vmbJ
         uvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876582; x=1730481382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xU//JPSDEyUFE1ZFqfKvgV23VREouvKrVYoOcahlOXU=;
        b=n8htHHpEUrcixW66VV9cp0KY6umTFGkB98FmZ64K07yeRrKbSnH1BDn29dB2/o1C/F
         Rq6iHgeANadP1o94u7rundLsbYkz7T8HpJOZvBa6lVywwylPeYNREiPXWgiGz6qwNhSO
         v6SbVLGND/8ju+eqM58/sXZf5e9Cc9lcOzSMSs9JOxRCJrGa8Jtt8uTA7vlh+O8Pq/Sj
         4mstJG2R4IZlJwl02MCGLLCI35jFU2QCVIYDPscyrGsTL9HDVS1eTeMEFzx6px9UGaEG
         8Tv3TGipM+LpKgnaXilBjhnEWvxMrCiTmchmDnV+oOGKyajPMWYT53zufRAu4+w/ioPk
         DuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAbJsJeYA3CSROMH756xX5WG44vdWlFfOIQ1dC6lKmAKb/xpR1M7Ruvkzg9Ju4olgeYrvUri5gZxskbG6bx+uo@lists.infradead.org
X-Gm-Message-State: AOJu0YyqWyEq5JeVnEirgT1hSc978za0I11hf08qeCNLKbqTmKsuGXAS
	UOQd2rMXy9ZtDdkXiHbSJjwQKQY7M70fsllM3C/aH+o+GtbytnaSq0qRuK5M//o=
X-Google-Smtp-Source: AGHT+IHAWpLHmHwxEQ7ZVCnrScJ+3akRtweGAEi8Ve0sUsAzGKfVQQMDJC1MG28sgbwB6TwBnzAs5Q==
X-Received: by 2002:a05:600c:1e1e:b0:431:5226:1633 with SMTP id 5b1f17b1804b1-4319a576ba8mr2501215e9.6.1729876581722;
        Fri, 25 Oct 2024 10:16:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:21 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:52 +0100
Subject: [PATCH v2 21/36] drm/vc4: txp: Add BCM2712 MOPLET support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-21-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101623_296743_27AC77DC 
X-CRM114-Status: GOOD (  14.45  )
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

The BCM2712 features a simpler TXP called MOPLET. Let's add support for
it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 0fb8a57652b5..f6b6f8627f61 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -524,6 +524,19 @@ static const struct vc4_txp_data bcm2712_mop_data = {
 	.supports_40bit_addresses = true,
 };
 
+static const struct vc4_txp_data bcm2712_moplet_data = {
+	.base = {
+		.name = "moplet",
+		.debugfs_name = "moplet_regs",
+		.hvs_available_channels = BIT(1),
+		.hvs_output = 4,
+	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP1,
+	.high_addr_ptr_reg = TXP_DST_PTR_HIGH_MOPLET,
+	.size_minus_one = true,
+	.supports_40bit_addresses = true,
+};
+
 const struct vc4_txp_data bcm2835_txp_data = {
 	.base = {
 		.name = "txp",
@@ -630,6 +643,7 @@ static void vc4_txp_remove(struct platform_device *pdev)
 
 static const struct of_device_id vc4_txp_dt_match[] = {
 	{ .compatible = "brcm,bcm2712-mop", .data = &bcm2712_mop_data },
+	{ .compatible = "brcm,bcm2712-moplet", .data = &bcm2712_moplet_data },
 	{ .compatible = "brcm,bcm2835-txp", .data = &bcm2835_txp_data },
 	{ /* sentinel */ },
 };

-- 
2.34.1


