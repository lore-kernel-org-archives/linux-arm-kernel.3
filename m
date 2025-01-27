Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7700CC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=99yQJvw7FpzRgdFhYow/5Nzmw1VclDAyJ3HG8KXeU6I=; b=vL7p8uZ/TJb0MsVW30nlx3evMN
	SdCCO1EOIduCOW+BOz6xoL88YgTWZxTOtnNWxe4EznSa9kAScltc3XHhVzOIwNiKilwmC3Mzl4fwl
	9es1e/6J8K8ZAilixbsMQgsHb2dkeVeDAu28hfl+C8CFLjVp5X4JVOGS6Zd6gmrKR/z2K7Nam+4nT
	BwapfnjfeO88WwRZB6fVvWOj9ujS4Jl6Tqyw7mh451suDB/HYqStP1Bd/6IVhn2Tpe8RT88tzXSFR
	YbDD9YlVcwIlN1aiVVpl7FZHlBJF/58K+C9K8VxzTNTpJHNgUNbz+gZYDyYGhy82F9FauLw5lJRcB
	/eNrM4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOgN-00000002KDI-018n;
	Mon, 27 Jan 2025 12:57:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVp-00000002IID-37y1;
	Mon, 27 Jan 2025 12:46:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso30699045e9.2;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982004; x=1738586804; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99yQJvw7FpzRgdFhYow/5Nzmw1VclDAyJ3HG8KXeU6I=;
        b=T6jjScgbcyP9wEQ2UpbB4Vl28BEpSwoss4XE9NcxqfNjG/hvmmHERUwsoU5cPZfOLW
         4swGxf4Bc0zYF+G9iVZvF72qJoZIBo2P0gOuGDcrL8avpJNcZwTX3V75yWxfir7lSLc5
         VL/byf4aUdYEDEl++JAPalsD7JgRuEgsqJwrbsLTJQ8OVs0RUMko6GFOjRznZs/UOdBI
         Smg75sEINKh9jN0zMCCvnmZPiDrDg5FqWkvpUQQKh4a2WufRFLotTbNfubHoffUZK9Xd
         9BERNW/Eez3Ih2S5YCTZpTf+KRYYPMOJ73YGPNAh2Vn6sccS9/oF7NW45vvoR3JK8Dba
         5CwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982004; x=1738586804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99yQJvw7FpzRgdFhYow/5Nzmw1VclDAyJ3HG8KXeU6I=;
        b=b1nliAWkmyANxfcFonTcjKNf6TgC88gJaKxXtFYtRHGLp8be4NZGh5NnEm13ka8yXE
         vI+UYdziXqrbyDFjMcrxnHK+R5xuS2vTue7yUeW/e2abJh7PE+fkGOw1RJ5syG52+Y0f
         3od1x6nHgVHwfbddqwpGKROBforXFGTSphZXsw/B0mbw7dRbLdNAWCQuYscjM9XqnPY+
         /dV7xhgavhU+sz/3qAPf/ZMq3zZoQ9U7ymSzXB5LPZEHBKfglx603AQGlUh40Em7BP2a
         64eJ8QGxdH0yfbwPahmTGg2C3sN37JbHSfuYgi23NWUbVZr4IaPVS1ujqo0bDQd9VFzk
         am/A==
X-Forwarded-Encrypted: i=1; AJvYcCUddvCgK+x8Bkjc6GQAQHZJnSMWICB0K0x32J3CbMucXJbXBSaC6iH/jTybGpji9MVIIjNjBnXE7ZfPTIrvM5HC@lists.infradead.org, AJvYcCXv7FT8ljeE75upau/XYRbmRTXcwnd8lPGQefw/UUPo/FSFb7hmrEkf9NpDIe6sMcpX271gekatOHiieW6okT8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzC1vMvbtWKcmRonFLC08NUNPKCeGNNIyQgfGLpVWJ+RGoffAFb
	Xub4BuS8tDHrbIL48Bs+8ppUaCnnOi+0S06V7eenKJuWUurtlG9r
X-Gm-Gg: ASbGncuoQyrprJ1PUHMRB24aKZbSlWi5376t8pd9qXakPFX0kJzs2KRo5VyPJnqK7r7
	gfWsJNBDbOdA2vlpeVqgG3fT5SRWiaj2/97IR1w5eJcPPGqJmihYu6JA9OKcBvxOF1ey5vfwhlE
	HLyTIwAK33WKNaLgNO/p7udOf2y2ukwRao/a6E+dJo8GZu5I52/XntD5za+PwUCxHbW3jHpsdj5
	iZF/aTOmFQavBUf40HXe8467f4WFbCM/5w5rfm7N5t/StajBf6TLy8+3WS35Ppq1ZKeZofGJfFs
	RJMU
X-Google-Smtp-Source: AGHT+IEzXfi1CJNqlEJYIv0M8GW1g0R+EoqB1v8834fNOrIJA2KY3Jm1vR64nhkSLO1a4e6G7kWiBw==
X-Received: by 2002:a5d:508d:0:b0:38a:673b:3738 with SMTP id ffacd0b85a97d-38bf5688e01mr32366544f8f.33.1737982004137;
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1764c8sm10813557f8f.3.2025.01.27.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:02 +0100
Subject: [PATCH RFC 07/14] ahci: platform: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-7-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=jtsYpUlRDrqFp7RoesBiE8F7bGnmxPqG1z9eHllOyN0=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArnbhTeHcXctkkP5+YTLsGuNIu3latgSJOo
 K96meEhDp2JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tSKXEACZC2yDU102fcE/qoyz6wlJRCDZkBrZO7Mia21i5SUuNDjLaYr3DTEd5Rl6C5JUr6CWRK4
 AOyqi417PD/PwNi6a4MhVe27GmYTqJ1ZFgG/vUOWhrKzokMjs1PMH0E8jvWjseeqgWw31ngGDcD
 wb+QFUPZs7tJ6IB6f6hVeUox7rUiVvjuyZDtR08VND5UhRXXG57I+ZkkvniQUJLQt9ZzbPNo4x8
 gGglXMk635txYfzMQ+A0s5LF3u4U6hVkmzYZ8+sPQDi2PvmdpdnJkwMX2FTgHwr0XnB72bsHazE
 Qd+BFCSx8dBGTmad30NQCFwTPomf0/SCW67dfkeQDBesTZxl9xumd7bxs8M1put1RHaJMM+G7cO
 WAjaN3Mm3kuJDjWHs+jEaA06rndfPYhgqewwkWucfergWLuo2MD/J8y5xwqmmQ9wfe6aeZ4rxsg
 Zu2TQUs4WpQ17vauPW4myryEl2D4bV0ZCUhldINKLd5e3vJ6kuOhkUVON/uUJu3VgVconknh/kk
 KsoizoWzHcJfOE89+flaHckKCLpzNxUTGXoFOL05g09d9C/oojU8/Epzm+r4MoLRNlpPvkxElGv
 WkvElsJaG2eXzFOeddLVygkSh8gUC0xX2PzdYQMAnBBqW0LKNgkKvm1o3wS3/tpBJNq1p7TaTGs
 0E3puBPEoanayMA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044645_806531_0B2B0651 
X-CRM114-Status: GOOD (  12.85  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index c18054333f7c968cc4e131545fc3127f03ac27e4..cd5d89c1902fab6c936aa04eefb461c968726185 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -74,8 +74,9 @@ static int ahci_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "generic-ahci", },
@@ -102,7 +103,7 @@ static struct platform_driver ahci_driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
 		.acpi_match_table = ahci_acpi_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(ahci_driver);

-- 
2.48.0


