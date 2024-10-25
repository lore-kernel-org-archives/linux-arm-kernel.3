Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7CDD149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=; b=Ugs5QmzJdBkkE8n7mmrti7pNZZ
	dCEMny+8nMvVkdiTYZu9wNdSbnvT7hP/gpvwnbZSLHnXVVuCYuQsObOmh6HUSaJt+tHyh5gEAgaTc
	UPBOMcspxrIY3isYVAbNrd2ckBIA0iLf0E1Jkf3vdsWxhxojlWbP0Be2btj4pZHwztCE/ToycrYA7
	lWC4V5TmIcyu3/YAzKZ9M2ho2goxHL44vurfHbOzztnFqiaCSfQU8c5WLdL+N699Sn3V5YXRPK0UN
	dGXSDgm/CDdwbhTaP8c7ObOwkIiB7w6joVE1vt+Lx5U89N4Ik13lOnoRWFi3ZM5aasuV7MQrZ1T7y
	W5VPKxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OJw-00000004eYb-0VdE;
	Fri, 25 Oct 2024 17:41:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvD-00000004XxN-2K7a
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=; b=Qytcgw9EANVRVnt14sAnrT4+80
	Ykk6X0/kw+dqQ4roBmgH9HmqcdAaJbyE2DOx/BtUc1EL7LBbJSTEACqPFbOB5I0FHSJODLU30zVqu
	8FWAQGlUBMTD/qL44L1nxuv7Pmdi5fRhrWc1b3GO8ERWP07G5zpRRMwPxyM2wELei4tqLv+ynzqtN
	FaqFWj0cJekhUmcQ+qxQeWhEzXYH1EL5Pv03ZJ64t9vbFrZkjDVULlnNgLxCyDXLT6aEckExoulbg
	GqrVftSM6dFrHwy3IvjqDOh5Th8XgZWVD7LitWMtHt0+IRgZiNqikMd4OQdL604S9wQSjwTgDhbFG
	MjjPD29w==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv9-00000008zlT-3lIt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-431616c23b5so16376155e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876579; x=1730481379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=;
        b=NyyxQAqNrs/l8jXvmG7MdNEJKYm7TZlk47M2yx/3S3tJaDKJhqD0G+IRFsdKlVRfiH
         eZ213d310tYaHHMSgP2OQpYfHR0zE2I2JW0QDQCuwv5NQ2rfVC1GImLaekIhDsg2CwT6
         XTdgq0OLtQXR09pE2Yj8ybFDYkW/oy6rNrjQh/cKImORqH0KLreQ+IgNsowCBlsCn85h
         YGQ89e1kDE0WDaeq+Ov2FecHTvS6unwgAmzzYWiMtMJHhYVfa1hTxp5OD5ZV9oJet05D
         1kIrUTOWZqZjcBATTJqiD1v2Bg1zdxvidoLFCDvekZHpk5PlK8XVYdGd+/pBSMVL24Is
         GPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876579; x=1730481379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HIP++Qp2TfBreng6r9lHSlSqd+05ynFmHtOfFUyYoyw=;
        b=i7GTaBhaqWPzV6yxKQiaL81ZLaz91bItn0ZIKAwb44Ug0bnoReLnjhzibWUfdjUamJ
         ZoqRcKTSjLOZwmA8HdG+neC/P88G6jioGKvPErGD+DNPMhAqNP+b30HxpUk8FQ960L6g
         +5GgZQtfFVtQI8HUTNwyWK/84Q4wFDVfH6JJ057I7WvbsyZcu11tCtPaTFg7DEiNDUy6
         bsh58XhBUkFGXnc8RiNQfaLeyMDsnNjS5PEAyA2WBep+If1c2FiZxZ6myIXoF8As5r3e
         pcXDnkY3AHMwW7kOrIWyOHnGwI9hCWbnFPg12BaQ1x+3OGAkHqWIjU9R0pj4BexiNwI+
         GA9w==
X-Forwarded-Encrypted: i=1; AJvYcCWVBibM7HwPPX2VKet0PJudWUbL2hCMX62sPX1UIU5ZkHu+RRhK01j2eLt2bgI0x4iy/+aPR6B3gHHW75v9AjYJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwQUQi2hmBvJubWX4QrJysm3lSx0kjqm5rGfc+TRed7NCOxDrbp
	IIc0WztLgxfXR4ht8x3HP09ZsscrcMjkfE2pBfW30dhRUMzcr8EeUy4fBLCPi+8=
X-Google-Smtp-Source: AGHT+IE91xtUCxvlR1lRvpTqnlZWaqwRX+o7PpgAGm30e7rVreFkYxn6n2RZsnu9N6JSHjePT4SHEA==
X-Received: by 2002:a05:600c:1c98:b0:426:5e32:4857 with SMTP id 5b1f17b1804b1-4319a44e698mr2888895e9.0.1729876578594;
        Fri, 25 Oct 2024 10:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:49 +0100
Subject: [PATCH v2 18/36] drm/vc4: txp: Move the encoder type in the
 variant structure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-18-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181620_279251_04B7032F 
X-CRM114-Status: GOOD (  14.94  )
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

We'll have multiple TXP instances in the BCM2712, so we can't use a
single encoder type anymore. Let's tie the encoder type to the
compatible.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 drivers/gpu/drm/vc4/vc4_txp.c | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 34e72e711a17..70b7a771ff47 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -538,6 +538,7 @@ struct vc4_crtc_data {
 
 struct vc4_txp_data {
 	struct vc4_crtc_data	base;
+	enum vc4_encoder_type encoder_type;
 	unsigned int high_addr_ptr_reg;
 	unsigned int has_byte_enable:1;
 	unsigned int size_minus_one:1;
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c2726ccde1cf..ecd2fc5edf45 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -515,6 +515,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
+	.encoder_type = VC4_ENCODER_TYPE_TXP,
 	.has_byte_enable = true,
 };
 
@@ -558,7 +559,7 @@ static int vc4_txp_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	vc4_encoder = &txp->encoder;
-	txp->encoder.type = VC4_ENCODER_TYPE_TXP;
+	txp->encoder.type = txp_data->encoder_type;
 
 	encoder = &vc4_encoder->base;
 	encoder->possible_crtcs = drm_crtc_mask(&vc4_crtc->base);

-- 
2.34.1


