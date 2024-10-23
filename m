Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B83CFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rM/PLpT0bJIFrHHYZG7pNuWN750b4ZOA/oUy8wRZ+s0=; b=NsF8LMhq+9N3+ea3a69LbSPOzE
	F1etxWACFTEZxk8jX2dQHnnYoyvmAXYgUkmQRDN/V/s6qOx5lfJaAExpD0R4E4DF/56S0RNCMoEy8
	69M8kJ46ojdfC0Z0geNmn8dSqDSWICuQJDIdH004uOBWlNdX1l5vwfl53XiFCgG/nkLlgbAeWvhB2
	7dnR+gGXpzjyfSCAuIDWfUdFkMpKC9qNR//cscfc07AFxepYh2DI0Iu6TGxTdiqDRTTTcwLbm3ovR
	T6bAr8aB1Yt2pnR+E6++V2SKOb9EmbCThSbffsbv+NCMLc6nNgtYawcDNmbeZpAvhhgb9J9ojLvLb
	G+LdBT7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gsL-0000000Fdc4-3rZA;
	Wed, 23 Oct 2024 19:18:33 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZS-0000000FDfq-2AqY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:56 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso4874147f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702252; x=1730307052; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rM/PLpT0bJIFrHHYZG7pNuWN750b4ZOA/oUy8wRZ+s0=;
        b=sfiiEiSYh/0dpOn2pB655GK09ryHUwhvJuFKNXA6s5dzxxupLL7mC+gij1i1hiPCap
         TGUH5b6+hwIsBDjgKR/jTpMXIjXhEVFtL++XvuyK6YNaM7t+N9DxUujUqEYjubqsE1Z3
         16rvXsUnReVcbCyz2YM6mw/ce6za7e2Ad5vIiV1Px4AAV/hDWlT3aoFJ9pqNERoW4wHa
         AYp8V7DAmb6VGqaUWsAZ4bQHYC46KiUbhZsFHGAoux9IHGCWlg2gakveLY4yiZ6MsMg+
         4yvNZs98FkTS0Gtm+QrmyAj7oeRXkpUqPN+DFGPIwV7uKh/t6q5WhtOHO41JakJZAPAq
         rQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702252; x=1730307052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rM/PLpT0bJIFrHHYZG7pNuWN750b4ZOA/oUy8wRZ+s0=;
        b=Ij+aAfbYztXuD/NWNe6USYnDTdlGQfp7zGoMImSudPA5c293toKEJkgi1FIDL7vzsr
         tFn4XnKvjXSE+NVnuRrURQzpAdu5lGdQUm1aJ1hkG2vakYsCa9RiUSNh0cRFgxPCunO4
         U7egO/w71hy/G/D5aRLKzDEWO7o9uAUwJaESEB5R4M4Xy6qdWHuNdMMw1ebMV0aUDNmn
         6xK8eb5MPnOqBHBL3vfOW0GjyF6mZWtu3ZtLS6htjLYEUluwvgMV6ucHZ7UF/Kik1oC9
         /vo2bfpHUt1/rHXVzPsfdMbskQM1GG5aJU9+a8p9YueZBqSvtO+gY91drTJeQDfOTkXT
         Gamg==
X-Forwarded-Encrypted: i=1; AJvYcCUkCCLIjpzOP/RI2mZbpGA8EK1khAkW8JGJI/XqLKDzvoz57UdkwCuI8708djkO2ECKMOuw5j77ot/6eN/6vQDb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy18h6H7VJAjKwRsxbQ8mmfOC2CcWKPha2EYcDVFF0wFzQgjtV8
	/QHxR5HXZm/uiMVwpah6XgVWVlrpnKnSSkdD2/JYEOhzX7mmp69yXx2D4+4TTK8=
X-Google-Smtp-Source: AGHT+IHztOCCr87oR87Z3+JBdAivrEgxHT4i0hywZWr6jUvTWMEc0lm3QWh2DVlbarj1WpyyJN12PQ==
X-Received: by 2002:adf:e009:0:b0:37c:cc60:2c68 with SMTP id ffacd0b85a97d-37efcef190cmr2044356f8f.5.1729702250772;
        Wed, 23 Oct 2024 09:50:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:28 +0100
Subject: [PATCH 31/37] clk: bcm: rpi: Allow cpufreq driver to also adjust
 gpu clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-31-1cc2d5594907@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095054_562821_C8F31D68 
X-CRM114-Status: GOOD (  13.81  )
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

From: Dom Cobley <popcornmix@gmail.com>

For performance/power it is beneficial to adjust gpu clocks with arm clock.
This is how the downstream cpufreq driver works

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6d5ee1cddded..274176a938c6 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -156,7 +156,7 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 	struct raspberrypi_firmware_prop msg = {
 		.id = cpu_to_le32(data->id),
 		.val = cpu_to_le32(*val),
-		.disable_turbo = cpu_to_le32(1),
+		.disable_turbo = cpu_to_le32(0),
 	};
 	int ret;
 

-- 
2.34.1


