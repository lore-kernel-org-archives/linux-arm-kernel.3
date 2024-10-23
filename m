Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3624CFA462
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMBkh/eftMTOn1DNe16yd6Y0TGrb136mnMNPmU1BY5A=; b=kspPMkSi/7YXsin3plzFNF0qXk
	CGmmjqGqNWKhSlo9cfWSOHs2xx+12zXpggFE4r1W87ePL5FxsP0YBD213OGVT/ayDyTYVsHh25j4u
	9ChwkzHYr0QGO/Yo6EpfdYiblG0R0+ghk0wgITwFD95iDjHnpitVJ30uaKKUFWqemXAIT8gRltzT8
	0Mw+Z2Hu9l+JCPVqmGunNRMbahpxkiTNZIEWADYuZmeBCYfKZ6lDrTzckEbpUqOS9lOncXVYAoVxV
	+5mhWYTCajyxojsRQWQXjtJuzlS5vMT6q9X/YwwehP4Hsz3Pq/1SR/pGbovUF/ikTCyvQERHwneDC
	hdykNxXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3grv-0000000FdFs-45De;
	Wed, 23 Oct 2024 19:18:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ9-0000000FDTj-082P
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 16:50:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eMBkh/eftMTOn1DNe16yd6Y0TGrb136mnMNPmU1BY5A=; b=V3nyf+S1uwHnV0MjNygZ1XG2Zk
	Sj2rML4ZVlVJuPju6ZR45GD2af1097WdR6pV93bGrk9U1/tShATAue9boYLepjQ+1YrP1IDpeF8wO
	INHuRbhrRyFvanWtgxRHBw9IvIUltUuG91vJsdRRCICuXHvZQbYXxI8wk2i5BKwc02OY78vuyd/lc
	4JqiwHr9vRHbVLc6rV+rifN2yRmcJnx3lKTmihvBufsXLpDAml8L2BoU3cc5bwJuC+HtN0Zft/R6B
	JCs291L4fBFOXqBqU5mpDzPs1ug/Hh1iQP9zATWjCFbX4KTU4SodCasCRL+ZC86z0fFXVvM5Ihu3S
	5I2OwSNA==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZ5-00000008TIe-2ru0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:33 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4315baec69eso66522385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702230; x=1730307030; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eMBkh/eftMTOn1DNe16yd6Y0TGrb136mnMNPmU1BY5A=;
        b=hTptr3ZsE24PkW/B6oblsobcSsc2YxtNN2QLH7OF2X2KsopAml95RuQ1YvpS7p3voJ
         sWf5iIi4ExEnsk8uFqRv9ESj2VZSjrmdb2p+SGp6Y2nieMmLX4quaMjD5/iEOkLfbYSx
         B96tz5ohxJ6Vm9xho33vvHt3tjew5xtxvp9O6fetWjIbQRCmFDRwesFlvq+w+rz80h0J
         lm+wsqvHrM7aLM/2VtP+dIPZCj8VcsalOhayrFiAOcXVJx6b0JB1xuFSytQmKtcqBUcA
         aIwZPce03Cj8Rli4gOxNXtcZYm5KnLbhELnCJzljQJ75bx4/n1YK1dfQI5j/w9b9SGJt
         Db2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702230; x=1730307030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eMBkh/eftMTOn1DNe16yd6Y0TGrb136mnMNPmU1BY5A=;
        b=DiKR82PI+IkGkAyTIfewrI6obZNkSVYh+GS95pOA9Kv2rtpMxhRN66RwHdRP2D/hl4
         /5F049LnrIE4vDYl/RgL9KWqW1iMecyDmMSKsmDHb1FbJBKlVicek0j2GsCfLMThPeY3
         z52AWRiJkOGLbrjOzoiCrTbT08iVLBt1/4IYOhIM0TV5v3jKZrVy9SxcR1QWZVmGV5wm
         AzULT9K50EJPeDABO17+Iikryk6XevMmLpZQxBsbkxNKKeei6vpkxqNjHNy7fgwRIjsu
         rXknCS5xKaIc7sD3kqibTPeiJO5qsI0fKXcz+/9srazyPxW6IA021/kekVtOkWa5QthI
         j+Pw==
X-Forwarded-Encrypted: i=1; AJvYcCURk9pGJt+zNvjOmZpNkNCJbuLAsIXrpPzHhq38MULSgANHPQufOq0xvj2WQgC/cSOTfQKcdLKxb45ODz7Amh5U@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5QX3Kwo/JJBnhU1gOb7LSRJr8tUpeHoN8Ao11Hty8lnIOhWD9
	O0RU+w7EHAtvwdSiOC8dgO1TeM232jyQ1+txs9PElQ/YYkahn5D/nCXKx4br99E=
X-Google-Smtp-Source: AGHT+IFCvi+5ahxplV53y8LUMCNwv9cz+F40idXE3AmypoYPX6CS2lFPTrKeznboS3XkfQRNLTCaGg==
X-Received: by 2002:a05:600c:46c4:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-43184224094mr28879375e9.21.1729702230506;
        Wed, 23 Oct 2024 09:50:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:19 +0100
Subject: [PATCH 22/37] drm/vc4: txp: Add BCM2712 MOPLET support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-22-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_175031_907000_4C600BE2 
X-CRM114-Status: GOOD (  14.28  )
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
index befb99c9b5bb..aab6fa7a8838 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -524,6 +524,19 @@ const struct vc4_txp_data bcm2712_mop_data = {
 	.supports_40bit_addresses = true,
 };
 
+const struct vc4_txp_data bcm2712_moplet_data = {
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


