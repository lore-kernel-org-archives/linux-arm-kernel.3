Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A37BC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=; b=Qf5xbKM1qTqiCKvMbWGC1TtoFv
	oCeWcedo38ot5QJNlQroBwle6uoLgpmyOmBZ2r4k2uj7rpnhkJDoc9Inl46lHIDeKD1C/VRE7H2yX
	Org3BpNScWP+nYOuIq2soisRWQe8NY7unbLCpwyuQtVeeriPBAHxW/JMmpnzvWFogeHKf7x3NEi7C
	QRiFNPlGnYf6ClJRzZuhxb8DmCrMSVwNJWhmPAe/W7UK6HIUQoRcolXqlBnEOufdjtVbxBvv+V9P0
	ZokTTfJ64PAPueSA4Z+KYqv01wntYVzs5VCLlKNqYj3NMb5eZKZltBPGsbgE3m+NDQ8JWCYGk3LMc
	t+ewH/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK1L-00000008DmQ-2zq3;
	Wed, 12 Mar 2025 11:13:07 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZR-000000088nx-183O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:44:18 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso11214868a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776257; x=1742381057; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=;
        b=UJQodZo7jNfDZQyt0Mi0+vCZlxAFsrnr3FZlx1aiT2fI8o5dhYcEi+gcu+aTgq9SJU
         1bpXZ5WKfA1PQPHWnZGRrepfOrCrJF2h5oey9J39pPQ1PVBuhH+bj3NrawwoQ0SX48eH
         P/7jO68w1UEQGO14oYbJrWlu7AoGeDpbtZKhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776257; x=1742381057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e67a6xJ2fya7iTHBTm4CMpwBESFmr8ztnJRq0kN0BTU=;
        b=MccpH0tPGeTlR9axeZ19RjiIIcyRD72QM7S8RH9np1Hn8FVQe6uKcc5scYmsN3GZH4
         C9FOtf255vJEEbR/8U311k9dbycHKfliJ7IO9Rmjo1uk2FzulTkJxJ3yyLSxOIOTgdgW
         asLYWxQuf5cIKKuFMk39FUmeBCLjRx8HHYHFC9XV7xxRnnvUtLBmMNoBh2rG/Hj7g4Z7
         XwlgITI+g3mJPXEEI2HUZvPFOAiOLeiSh/EHGDz4MdKxjJXLivDw8H0n1C3SqyGbGrm2
         wIfdhmUD4jbC4+lDptRvHvuCcfOOzD6LrrPOoNzuTiGWvDH4NTKHqHpDDSlmGHqe1gfF
         j01g==
X-Forwarded-Encrypted: i=1; AJvYcCWfX4qkTyD+xcwQcxHkUY8ymu4q3hUjzKN7I69B5mntIDCJDqVQevi775wNx4kInY0IEHPK6rR5GS4/jfRmGlzZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyqgNxM6xR0R6Kalx4VjoGEWNnJ3iTSHtNkifRXqOtv5czZBZ1T
	WR+W+89yd0BBp096YyVbSrVb0yNfzXz0rA6gjgDhcPp3FVuQ0cImQoMD0yWrzw==
X-Gm-Gg: ASbGncuI8Rbsx67TrJ8WDCcKe0a6h8IkLbex+bQwauwqwbS2AxDafBI/75ljYucE31S
	AzqbGqbDISyFZ+Q2kFck81wh82/QUkS8MjCNqbi1z/N6uCq0jYavP7CgFBjfmd9G6Dle2B3noi1
	j5kDY9z0cpS+9IWCSQdrNvGZ+0y26MoICUddg9vNqCYcRS1gJa3wibFUvN5+GsMJ18Ld3AUGXOd
	YEo+flxGoHNhUORTVBb3LZmr6iFdmrtgNMn6Qiamax/9w+FHZaPm6MwKf4e3MUUr4rDK842sA6s
	zDGXQUs1uX543Nt8ueIjcwfSxR+7wV/hm08MzjQ/p0e1Fo4ntXXBeeS3pfBem3s=
X-Google-Smtp-Source: AGHT+IHnJ9RN+rcEBHk26VixrUf4szFNagmQDG8odQqs+oPATVUlo/6Tywg9lfAQyAwSqd1m1Il2tg==
X-Received: by 2002:a17:90b:1a86:b0:2ee:53b3:3f1c with SMTP id 98e67ed59e1d1-2ff7ce59755mr29857671a91.5.1741776256738;
        Wed, 12 Mar 2025 03:44:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:44:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 8/8] platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle
Date: Wed, 12 Mar 2025 18:43:42 +0800
Message-ID: <20250312104344.3084425-9-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034417_317504_DA4F7F2C 
X-CRM114-Status: GOOD (  12.99  )
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

The MT8186 Squirtle Chromebook is built with one of two possible
touchscreens. Let the prober probe for them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/platform/chrome/chromeos_of_hw_prober.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
index eb01851e1cf5..a3ec583f316c 100644
--- a/drivers/platform/chrome/chromeos_of_hw_prober.c
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -59,6 +59,7 @@ static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(trackpad);
 
+DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(touchscreen);
 DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
 
 static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
@@ -76,6 +77,17 @@ static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
 	},
 };
 
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_squirtle_touchscreen = {
+	.cfg = &chromeos_i2c_probe_simple_touchscreen_cfg,
+	.opts = &(const struct i2c_of_probe_simple_opts) {
+		.res_node_compatible = "elan,ekth6a12nay",
+		.supply_name = "vcc33",
+		.gpio_name = "reset",
+		.post_power_on_delay_ms = 10,
+		.post_gpio_config_delay_ms = 300,
+	},
+};
+
 static const struct hw_prober_entry hw_prober_platforms[] = {
 	{
 		.compatible = "google,hana",
@@ -89,6 +101,10 @@ static const struct hw_prober_entry hw_prober_platforms[] = {
 		.compatible = "google,squirtle",
 		.prober = chromeos_i2c_component_prober,
 		.data = &chromeos_i2c_probe_dumb_trackpad,
+	}, {
+		.compatible = "google,squirtle",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_squirtle_touchscreen,
 	}, {
 		.compatible = "google,steelix",
 		.prober = chromeos_i2c_component_prober,
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


