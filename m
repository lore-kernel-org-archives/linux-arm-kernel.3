Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47237C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2IJA96cn2epCMiVThMTa+CHJ1H46iDl1Xl8KOw8NEU=; b=YoLtmNw9ZYnpgtfnPPaq5zCY3s
	sonJ0cD6EZEhQbP7NOcIomvaF0w9pRcVaQ1msgfH4QWdOh1GhSZfXZ0jlshFT6f6U7tNzVBjIyAQG
	KKZZicVsDdy92Q8n+vnm6Z+oZSSPwjkmuYflC1uKh5Ez6JBrDUkJTzeeP7ube7WLebi8Wule51dnh
	ZHRDWWn+dqHv/jnONAS7BvFZxK7XBV5/9BmpuD4vLhmq82Pr03B9fI1JbizZr2d2IFw2QVgy8sZ4g
	pcUAw/k0y6UxvLHy7UBunWRcSIZQvLczJkyidZ6gNoFP2dSVEziJoOP2QuXjhuibPODUYrfuqHhsX
	f7V+Iv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkUVF-00000009qUI-2Rsm;
	Tue, 18 Feb 2025 20:47:37 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTIy-00000009aC9-0nzt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:30:53 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5df07041c24so6141708a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907051; x=1740511851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2IJA96cn2epCMiVThMTa+CHJ1H46iDl1Xl8KOw8NEU=;
        b=ZO5cSFtFK7xy/0fAXFlHnnPXESJkFXR9IMjnaAYyk5FPRCGKSwdHBWuwBV7OqYsZtD
         Ictcv3m+LaYCPBl7LWChUZXmzo7phTqUNzNZj7+E+cXKtuPlYhOuIIFUZlM3msaaOfDi
         7gZDGUKJTTPVUnduNxHrPPLS4szX1LixKI6iUkFgdVrCiLrJdHCMyRSha4G5Umiqtlq/
         Xs88hK9ZxY0wWwljKMbGXBI99vhPQNdTX7QX00k7I87iTATLJehJ82bltZdvu8NQXgc7
         Dov8IA9eXAoAJPUF8X5lPz+jq/UieQU7JL3jVmwVxmnRK3E1zcTYbSLnz94Vhq9JticK
         E2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907051; x=1740511851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2IJA96cn2epCMiVThMTa+CHJ1H46iDl1Xl8KOw8NEU=;
        b=QZRS0z7kHoUMtDimNQ8RRFh4ZRGnLTtjhnvTUyyGYbjlRJ6DpAPJGsqufP26poCpQ7
         vOP3XSGznxqgpSdsEiAffQcJrjbn1RXYdxtDUfXOtlnctMB8qZhYhv55tnrqtSibLOvW
         XFz2YIZjkJXMbi1n4gQKTCmbZfQY+WOp7agY8/PqevRLTi3ii1NOTdLo+BHaq2ck22lv
         nF3+S25MAmnitZNTTa2F+yuxTZnwhZ9VzxZ1OHcHCoazDuKbC5HgNzr+9stMjw/sakbp
         HMPb5UXHR56N/daEOB/ptuXzlm0o9qAwyIjiXVvau3L8yHQDwf1Kv+aEpjTQ1W5GoCzQ
         T3Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUXanGHUxZylBEy8hHsmhtPA+7ZpPLnQAHwZZWqT9GPHr+PWgs7WTi0lxxlZ1zPUjcsZMNX32l3pcjp7MQlfyOS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ffPixJTZSshrdQEFWgF0M9UrBP1xP71d/QJ/NbpdSD/sfJhz
	CgdkiqTgaFj64GRtcmvviDYggPTQwsOlt5pYv7/NvBVvX5W7jbB/uZ5KZj+9qqw=
X-Gm-Gg: ASbGncsp+zIIFIQwvbZ4QYcU71WlQRKwd4ClxkY6jM5xmtsoRzmDU2IWNm3+PMt31R7
	fWP5b/j/vtGeOYO1T87Urb+KEdDYkrf4rojn+S/satfcBDWXNwc2PFf63GJONZ/h/tP/N2/3Mjx
	Op9nbTGHGTZ5Jg8+pboSAEqEdOwIgivZuW6fjubbmJ+d4/h1RytneY7iB7ihha0cJVxFuxBvx+C
	qZpGkSV1PtkxcL2O/aM8X1YJVlU8xJf5/i+qVy8mDBUk+3qohAt+vOLo+xHnEiHEjRmR7vtpe7V
	4vvktrunGHbm339rPGHAUraHoi2C
X-Google-Smtp-Source: AGHT+IHXtRDavoFEuaxpZTZMT0EqHfm1KbVfaahxr8Qdj+LPqSMJy9KjmSUTGyYJHs3yvBW2gyEYug==
X-Received: by 2002:a05:6402:1ec8:b0:5e0:69b3:441c with SMTP id 4fb4d7f45d1cf-5e069b34491mr6798656a12.26.1739907050796;
        Tue, 18 Feb 2025 11:30:50 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:51 +0100
Subject: [PATCH v4 6/8] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250218-aux-device-create-helper-v4-6-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Ay58eJ7ot5/ul3WJ0A2vWFebi7iz9JDlKKz/MQBcPk0=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/UNRwYRSxCacN/wjpG+gTD5T1KG1hcBQsMM
 QnDuvUYONiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf1AAKCRDm/A8cN/La
 hWCyEACe+SnGCN6YdYLKgHmg2tCmpB+scSaVfptOtiiCaNmkm2ceymUua+hl4HQuc+cggoymEAI
 NRoyFjvpDwxEsenxo50indBSo4J+xKz/BxfWgchbJ5jBN98rcIbG8qbRJoK6bofmL8VieWY/C9n
 QziuMeen3+L6VIqwheLwS89czpdFIbtEchmvyO7447kPZT/f9tcqTtHyZZQ9ZWmUEPqyytQH3g1
 FXnb/QkITd2cOjX8fiWKCwqHnHuZZioCk73ybWlnXFChDFTJO1C/Kubw+Ku8ou5Oi1eNm5DpAKD
 AnhlKqHvcd9jAybx2STZQG34ILyCq0PGKCqdShGQNi3dEiokHFL3C08wZwHaieTJgG/BRqHDLxd
 +zWCAJ1BPN4sHUG0VUhEU1N3y5PLQTlN+fqW1PfZs66fZF3RWN2m6IST2cjtFQqOp9qEe9VL2m9
 h+b2UEflNPJZnzrxvGsMYOa1GOe3xEDN35bjBbnpOKh+SqsEnFVFvC/O08+02k2pGEvuCJgPAjN
 cmFW/PiIsKprUWk5c8WAdIAGfcL4OPNoHW/au92eXmWfXnZY45TkkT8Hkk2hgbQosUEC1eOtFKf
 MF1kq+BTKv4twjueAZWSPLgmQ+t+yWBdXZDVBktP2ocMRM8KOEqTeFZuMEw7Sebi/SXGVa4YK25
 DPOtNJY5VIKPj0g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_113052_237665_09983DF4 
X-CRM114-Status: GOOD (  14.82  )
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

From: Théo Lebrun <theo.lebrun@bootlin.com>

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-eyeq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b42921e3e511148cd29f215b5fc5e..8018fa895427bb1e51ea23b99803dc7fe6108421 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -420,17 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)

-- 
2.47.2


