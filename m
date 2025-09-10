Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF1DCAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=; b=sGpZ6BULuFWA1LfNhO01pPIdaL
	O8Xx+WwjSC9ldegQj+ss/ChD5HjUBwfCks24ZZqkck0diMMLJvV2A9tJCMpTF8NSgwmAXBVX3UmAD
	pWyV0jKba66pjg1E8Uu99qd8I2ZigdhEw0EuBhl4MTDZrrl4P4xQNN6Dm+P9ZZNg9/Uu/EhnV9M44
	byRFHopbl94A/+BqENg99y/OqJRLLaDa23wdquKJV/N1ADpdVr6KDN6/L22kURtMKgZ58g7BA5ZaJ
	Zt/eOCYm2ggYjkRWNQSATLKOo6xRw0+b5hVuOQsplMpdiMENI2Io501Wy54L1TiI6KtbdSWE2KXi2
	Pl77qBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0l-0000000CRCj-1JOR;
	Wed, 10 Sep 2025 07:12:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0f-0000000CR21-2voV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:12:55 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45cb5e1adf7so53296615e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488372; x=1758093172; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=DZZ0b1yKigZNyczdfxVO0fTaL2n0LzsCB1XPx74eiLwuVGc7tTMjM6F5J06I/B3Sjk
         CpjolOpI4vnD0SQcNs/dOIwLGpB6WPZg1T6NXsPcCUL7VuFp2tUwymb0/E0d2Pu2AmVG
         hWi/wfRer6mGNAD+0LJmUqN2aiAQRSeKeNKpEZ9lc0rbAh00CPrUI5QwlDmq6sISotVI
         /6Ma3rzt82GhPAdOM0NvnBRdJkgeCD2LU5O3o8pTEvH21YHwxzfynb+Qs83C2Cgdv0ye
         sfEChfXrGYjyPiUlIszdIApId+ZYsyyf9PjK8pjXK5LAZpwyt4puQMs5zc6Izmyflbty
         0GAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488372; x=1758093172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7pQfDGCPblKxfSBCBsu+k2H7lASoalxBm+PQPOef3U=;
        b=xA8hmnCgppExZ40ml3qiAtDuRZrYYhH7UqsbBjitY2xcje16pV5/0+76nmpxnnB2bP
         Rw4L2Mh9/B9CiglXCE3Kd51i3c6RqGf5oFJOqrcbqMoPhbMq5FtioRCvBTJn3j6Q0Vld
         2xgCjcCNGuI7EDeN3sDsM4aitegmetACV+4y9xLx/GEgtEWX2C/KxvGr6unNAavmfbVD
         f6HShE4660qJjrqtUSTOg+yrM7yZ9zBz7xirmwDth7xLGQKovBSf56L+HMtrdheXnhL4
         SikR89mNmiBL3Z2fdNr+dUezy2KOkGAvCcS/VIzWFyOan36k1uj8/Wn0TNGTF784IXVb
         Amcw==
X-Forwarded-Encrypted: i=1; AJvYcCU+kPus0AIFXUTwMAiL+DE25EjnFbP2x1bSRyoTLr/Y6eESV/r+vWPp6P9/RZR0nR31VQvs+FVzZG09NLS33rcG@lists.infradead.org
X-Gm-Message-State: AOJu0YwEwK4QG6igYTK3bAhF11f1Nxw6t8hiCEPeuqjO3n9dQQK4lgx5
	cLmGWUzwgNwDgwwuwrlbuJ1K1Eew7ZJKaK/qLsmhKTIcPaMK8fODiavN/CeH1kS8s0U=
X-Gm-Gg: ASbGncsLOecCBFkN6tYfrSoH1j7x8c/bWirEgRAOZhUnFyT8v40WM7JhuXZqhEdI9lC
	0SN165sjHFXprwJC52Sd6Feb6IWcwGGy+TgqMnePGpqXaSk8Sck79vbUQUEj/UUeY0TUCIio/5C
	eFVQ981Dxt9NuIbO13ozuP7LjxBe8q9PTO1lL0AEGtI3WAFOM1VCEAlf1dZj4r7JNlm2MS8X/as
	PegGEO6dEzDG8FP9CoDiosEGQu2dspDWZnbowBDiEB6EWyxbX0Qy02m+z9jfdmYEAaFdlgrxsEI
	hV/kSW4OYaZUrkin+N9SUX12bNT8WQthskaQ6L/tYZOwPz6F3g020oQrosCpd1lCh89tr4fS3e8
	Hn/S3x8ECO2+zFs8k
X-Google-Smtp-Source: AGHT+IEKdyheRTbxpZeobOaj/kiQcyqSdEjwXl91ot4Pp3gVY+W0lJCPHtV2Imjqq20EGU/uJIPCgg==
X-Received: by 2002:a05:600c:3103:b0:45b:9a46:69e9 with SMTP id 5b1f17b1804b1-45dddeeaa9emr137392025e9.31.1757488371739;
        Wed, 10 Sep 2025 00:12:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:37 +0200
Subject: [PATCH v2 01/15] gpio: loongson1: allow building the module with
 COMPILE_TEST enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-1-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=739;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iZ4PlFFkHvr3VSD1LivXtszs5JdORDU8d2OKjqzKoYc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsAuSSpb/N/lpm/J9TyMpn18U4V/mrLLrDe
 Nb4aV9WcKKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 coJID/9hXOYitzKUXEqsQTqE5rBhujI/Occo7tHWgfIzIoAYIrcKEjGZOM/F/dZQvTTO3crZcoi
 suPbR7zuB+Jwaigt114BA9+7sQ/fsomvdtZfhpDTuvsoC2hy+nvFaqVB3/AbtBU/Nm++6/6lC/N
 I3tHd2uMu6qHDBuZBcppNKNG4SbEq0JKpYwTu+MnLMEwtc0N+6h53H/41eGbZq5dZPBZO1Rs1UR
 DnsfU3NyzIvVPnS/UCPKV9yNJQLf+rM4PJxRp8cAsk8sEbncOdYImG/068XM06CPN+DGmmXrkGA
 fYhey5N4vrqvCWZh8TxID78/CdJfbkmeFDRgMDyP3mhtvARDEKEA+AKrlDBZHa0RpwxBbvvWCho
 gvUvkB9GZhfkiX2JmGAZIOs2nOEWqUor9AfytBA2we9xDvE13Ah2As+XI7cozQfLrc458cUOiA/
 PnhYb3BR9BG5uQD8C9Nard7cUzzMB65mag1/chlPkkKo3QnsuHfH4DibdeO3gne/qRwL3RvcyVA
 h4K4xVvknUUR3yUuq93JVa8I5Ld6yvsffOcFkmBa9Dig+3SRyhmk6pO1BvmfiVLl5SBTRO+1oQ5
 T2/6+Bnqw+ctTLXI3lmM5qPef07X9J86lhVm1+uhfTnzHoCWhndRZdVqNsXDBDWTKhjK4nd6OrJ
 h0UFM4WxGx3TqIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001253_789188_5DFEEE41 
X-CRM114-Status: GOOD (  13.43  )
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

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 31f8bab4b09df1640c892f4d839860edaa2ad6a3..09cb144f076661e0a2069016175d0692257fb156 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -885,7 +885,7 @@ config GPIO_ZYNQMP_MODEPIN
 
 config GPIO_LOONGSON1
 	tristate "Loongson1 GPIO support"
-	depends on MACH_LOONGSON32
+	depends on MACH_LOONGSON32 || COMPILE_TEST
 	select GPIO_GENERIC
 	help
 	  Say Y or M here to support GPIO on Loongson1 SoCs.

-- 
2.48.1


