Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88DB9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=; b=y+9r9alzvJ57M4kdLkA5mBpfqf
	IDZO+fggQX87vuXnnrolXoaF6KJjrZW7DIXMrscWutTA8tjzBMaZmb4WR5w3ABxc3pc5EKF80OzfM
	nTyOOcdjjMs4aYrR+0uXpWWG4LNR1CYQRLCv2XVylh3L3yj7F4aC7NsnM9bWIcZ6UgwPNPcKKHoFd
	sJ2/2JWPUqlNQ1GLU+GPOjd+8azePqy9Z5B85F1QJER+fcXT+D2MMmdHsvtITTj2AiBs6lTkGtKXA
	QHOySG2i9nD6UqYgiOuGVP6jx8fKklCcEsZAWcoPo/FDBK5H5LwU8YwMRQ60plabxCyQPJTjUw+NQ
	DM5xN0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloF4-0000000AiHa-1ePh;
	Tue, 12 Aug 2025 12:36:38 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLk-0000000AEee-2x3d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so26170495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987235; x=1755592035; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=Cykq9p2mWpnhqGhtVLj024NaeQDbrR7FHcG8BSpzCgc/eJFO32xGa1XpsM/cZ8tgwy
         FKes4KIR3s3qplDwmdXpho7Ox2P+TRKq4jPY47y1gIBZuCUA/FKVh2sfSyjy7jRqXDzt
         knJxsv7pPaxguvoSdaT2jP3x1fc+hXd0JzdNI7i2PkEHZc+NAZmIFA+KRnwrpxWGqXzV
         9rFKTPx4lM7BcocI3eR6OGXCaAdEM8XcMG/qqQonQqDjBBXaSxbzEiT5y1uDtwrZY9vp
         TsmAa0vOmXxcPCUemvN7SovNys7MSwGb9CE6mq2O3WqCd4EmtYGCIsfD4OBXLQe5svcg
         UgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987235; x=1755592035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=BJ2j2+M+1se2zbgB91Tm+mJkjgygzkCIqxmstPYSmbSOZ2AlaXjbr2K/K7voGZGMx/
         yJ72FWT/lWplpC6DvlJBWLCtrA+1di258M/1b7w6JeMx35GNRWRHDQV61ehnx918vGvy
         oEUX4c4iezseAsZ4tHB2b+zkotx6FjYKsgeTRD/nYPLtV1rv+oa76CnPMSnkh49G6UZT
         IY4y+O5xsEnLOqFjgMFGPKWdrHgXJHo4S1nu+Ao+IMqt66JugUbfNEm3tQE4a7foK64Y
         8QWzC2eUH9N8p03qC6Kp+jV9Vw6aS6yeaxh84oFWU8+2cnsb0X57ozc2pzuaawYoal4Z
         lurw==
X-Forwarded-Encrypted: i=1; AJvYcCXpF/8QgZ/fWh6MA8CkbaGFHXQ0ti49IwsfRXP9QXCoNtWPXSPTOKuovL+AQqZwz74rRjzMtA4ZF9e98p65MPsf@lists.infradead.org
X-Gm-Message-State: AOJu0YzMGFXz1xgBfbMlAWoyi1IJ3qqfa+1UlRV4Qr6z341wdfa6htVx
	JDtWZLw7YlHneSANFfJBjMNmSuYcN7YJhJ28zGWLVqRwQ+UnNSuKfB1GTwBrN+kwba4=
X-Gm-Gg: ASbGncsMLdmvQG4+Uf2YiWQjo4PAuDm6AGkS4E7/7YTh8BlbBBLuTGIB3+4yyLbJ69L
	Yw4ZVaiId6IHfiuhsOgq6PPULbGnxEbz3B5nHoEmLjuF2b/chSfNFZugLPR9XyYD8mdWAxlD5Nn
	aUQ9NhJPulG0NyKNB+WmZuHBUixyN61vn+9MEJrtGXFXHCYJ6/2/ylMSkqSAbcyPU2QGN7hmKJd
	2zH0DcdheIa6Nff7mEtiMWyjh6MSOdOHnxWWS7YFvC+RCdkEgcGdzKxpwTPKBCscZFB8ijPmaDc
	gfK9GfjAAIrM+/Kjso8UFsyfOngKnvROHXBD5G1Jhne75MDp4haEnPCMPOlvqx4+BoI+ydNhPk+
	221RMCoK2Pkl9/s0=
X-Google-Smtp-Source: AGHT+IFdKvznDMFZVInYZwwYDHVNkoHUkpPZeGPe2WfSJ5pngAh+BKH1PEfINHP8AliGuYpxgpRk9w==
X-Received: by 2002:a05:600c:3d92:b0:459:db80:c29f with SMTP id 5b1f17b1804b1-45a10b9f437mr17532975e9.1.1754987235079;
        Tue, 12 Aug 2025 01:27:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:03 +0200
Subject: [PATCH v4 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-4-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2873;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nunH5KiVSLA9eNaj6eipx8y2OBwu+tjBhQLeBJL1rQM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrXGC6Gq0nJRiXqaR76dk7/R12B6PvbWm35x
 aNzc3XzxtKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 cvhtEADdNx7DArN5koidQnVfF+xi0aUHcfFGOuW8vpax22Hyr2Scf/VG3fJlaP4c5NFyv03lfv2
 m5QXrrhpqBJRNJre3AS3sTt+5DFtU2x3XQe4g0YTzwVUXtZaMXzozSdl7dUdVAaS3d5bkfVQSoN
 bZqJ8Xn6GewglMBvisZh/eR7hVh7fsiDLRSGwzB0txJXy915USWDYvKaZAzaJrUNqH2DJPDkIdt
 hJvpe1DRASLLubOKWqhS6RZYdoLI1vMKaOeXRLJ+uJHwgaGX7acED/nxlYxNTFvJh1rEv+cvg96
 D09YaOGaUsK3oJcDeWsShWamJbDXg76mz6PFaFOU9pXnO0gGch+wg+Ni4hrDfSOyPHmUTYxSJ5o
 rozzU6iNpaTtSsIbtXjcLDebrclN7xi088hZzvuiBccesTXa1rV37gq6lyqvvTWtHmk3qroaTio
 GTxkp49IaL5d++Z5Cid2pYg6PSQqidLMXqc3eMw/M/lw0tU6769CLGAOIPfmZw8pIQ1aVBEjPiW
 Wh30mUS3iHzRTUZ95x6mwyTgZDpBUKbP3wvI7XwSj2P28ThwZkNHX3iwas386F1Be10JolQ3pZw
 LWKA8cisHe32kL2K0hNad7VOpO51ebJNo5q6uC+jebFgDQrWSmRdS1nalBHRZbyorG+GSy2cb8G
 M4bBijT2vNehGvA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012716_769787_EC83C190 
X-CRM114-Status: GOOD (  12.51  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1


