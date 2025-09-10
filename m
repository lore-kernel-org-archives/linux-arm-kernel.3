Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC8ACA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=; b=MOSUrEtEp/nhD0mZNoDsvD2W5X
	CgIloJnHpj3yS/5zUUbWieMu7EkhANqQiBerQq2OlC69DwsNuqJZa9z3A+y4p4JEW+e0lFKLHeWj+
	A7J7lQ6AcDNK1wcQHPq86el+8ZQYPevSZ4LStxtzG4viCajwn85sCpytSlzXP+Ldt29TmPgH/tlRV
	Kwunkgh5zAw+RwotZQBysDei44aszBH2WiEJAjfvMMeerwxUvH6Tf6fVymyi1jPhKPbbP7+v8mI6j
	GvlLMT50700G2S7PoeICH6KwJYzW+5RccBYaWmWsKeUeDfX8ueI2qlLPYqvA8tnuJ0iTpQUT0fH6G
	17LJ8p1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF1J-0000000CS2v-3qw1;
	Wed, 10 Sep 2025 07:13:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF0s-0000000CRMM-1bwd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:13:10 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso14272135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488384; x=1758093184; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=16QCSthO9GnBFjZeVlfTa3Ib8EHuNzMTn5CczRxrNnBgylbWF85UnFjiGrXYVk1og9
         Ce4KVbLwlJIGbAnGN+hqDVDk9pkodCyMpyepNVlbQCzV10zCyn9zP9HBZvNzhVkLq+Ci
         5gTUwB7M2ORLosw3+dAR9XuHvUEHuoHoZeRVZU56cCh9gVQn0LYzohJNRXqLpBEWO/4B
         Nfexw5UZJZzZsMdhx+cYhz314BsDZQGy79T7AhNe14n6q7At0TbKPWPd6IrgTE8kHLix
         ck3DP1Kqluj5WJYot6cKDDa7mlEa9WZ5mBuDLfEmJ2RNEQyxYup5SEv20sUwIbnFBkBD
         vTdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488384; x=1758093184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHR8kEAINHQx8cEJdNb56gXGfX3p65LuAbViPfkkq1g=;
        b=qebto+QiJqcYRdjkRmoyl7L9MxrXmgqU++C58ynwHAamUpeuW8ekUEfjFxAR+iY3uM
         j3fRmSMiA5zxD87oIzS0rWHNAcouULX3XFobndtLMHWS13u7GCcVFYPsimTlZf4Umj10
         TF2xG0owPc9nijl6rWisD6G0yktLJSs9PTFBG7dgVAyUWJlIvIuKkQfjm5LaAxZA6fqF
         UPGX9losgJ365cQTKKKSy9WDp/Vk7NUzxlYREktY/HbrCKGKK8MigO2W5j5RsY8NSNgf
         o+fd1dBQDk2QIH04PKNa3ECi96or+i2DEJx4fJtxclDCrnVWYWsoUEVTaG1s3eBGuDD6
         bmog==
X-Forwarded-Encrypted: i=1; AJvYcCUZeW9kWd8ybo2WQFReB1CFL7y2D6ic3bKnHTtolTTdx3ajxcjn6oKPNaVHsXfIs/Etxcmbjap10NzEWPA6niFa@lists.infradead.org
X-Gm-Message-State: AOJu0YxDeUl0uzFxFq7XM6wqgJnJQ+T7fF0/kAiMmFjbrPraY46qV12U
	AEWJoe/lVZh9NS/r287174MBxI0cqka5rHnFBaHZEaHMwaL9Kv3aeWg/hLa7NB9N5fM=
X-Gm-Gg: ASbGncv6mncQQWmQE6l28chHrMo1OY+M+yQ1p4jPHnxoSt6tqJAL+0qKsu7N3BAqQIM
	SQ/lAry07aUMfNqhsTUzAm9TWilMsvi43KGVTmol9Z+umE83jwowTe6mDWeDSlI/WpjYuovruOW
	r4wwovfkiob8x5oGGfwTSJorx5po1YkpXswjIkOw43q3+fOZ2orXMUSdlF/wuNxnP6Yxe0EGkrV
	aOgaThcLA8bt2cKqKG2VLPMAIeMWPdN2nEO5JDvJ2nQhDRrBbg4kEikYEpzRc8VgXp+x1WQMqTx
	E5F3oZnaJqreJST7I+gRjdr5ngYaZVHvChEoVF5BA1ym2SawZl4oppdT87U5TsEPqed1+CVSDLT
	b4oUnhqsgpdgALtVJ73iceWnnV3Q=
X-Google-Smtp-Source: AGHT+IFSdci3CHq8VqUJcbVpnmzo+2lQEmXOuKmC8RRv+wtgm3NDfrNeLIsCyZlc4vVFVDxHItzjfQ==
X-Received: by 2002:a05:600c:c4ab:b0:45d:d505:a1c3 with SMTP id 5b1f17b1804b1-45dddef8c61mr118822845e9.37.1757488383998;
        Wed, 10 Sep 2025 00:13:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:42 +0200
Subject: [PATCH v2 06/15] gpio: xgene-sb: use generic GPIO chip register
 read and write APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-6-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=We0X7xb7ACmLY+lbQa1fcNw6pP25NDN5z92R8VM93TU=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTtTDj4oNGwDRR7+qL+H0qpz1nceYdGpGDPH
 ia1yPhYhmCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cltID/9Ctub5VaMhx1Y9F7RnCwKevVF+bxKd+hpiZxi/K5bnOELNFhQC9MrYe3Jo/xgNtSOubP+
 e6d48QqOuSuIV5d++/Pwni9yyHDsRzqCfGPA2sfV/Bab6KBoWxhzDFn7s3lGqcOecV05i8onc8w
 wFCuxdoJ2i+LvKp0salt7xPfvkjgcIgKGzQmTopLYLKahtb4dC4nWif9HBKqL3RiNU2dkpEQiAI
 ippQcDB6/0i6YRrnVZAEtqpMgKaPwyRaKiOa0VdiVA+ZmDw7GrC1p+27jgEkErOCxYboKXTW5Ae
 gKTqLhDKSVO7c8IKGCdbIQxYiJEsGZCrYFuLA0pAogyydqwf/ZrcVP6UgJSOttmdPXlWCEfaWHy
 cLBcQnSi7cTCuPVS9mvSF6h4umNbP3tpRfb6pOfp7l0RY4i9BJsC6WTDRDQ/vHekGy86Kwi6Esq
 IzhKLr3OO4wfaano0EJJ5Gs84UnV4nMnYW9Nts1TM7oIybmuoDUgWV2QyuT4HcBQmTL6/b7FDyw
 82BVH/fdSFI2eKKOB3z+/AkHtl9+TcngTVS3xIAQWvL6HdAmpBuy2zbPJ7GMd0eV+meic7kYxxF
 1/MoGJeiOoVwFVOK5uGV2GtBCFo8xz97rQ3SKuV2hyxM9CExMXw9JCmDOBulmxf8+Vd8Afmotk7
 5UhY14It5j5GHJw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001306_487371_20550450 
X-CRM114-Status: GOOD (  14.83  )
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

The conversion to using the modernized generic GPIO chip API was
incomplete without also converting the direct calls to write/read_reg()
callbacks. Use the provided wrappers from linux/gpio/generic.h.

Fixes: 38d98a822c14 ("gpio: xgene-sb: use new generic GPIO chip API")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-xgene-sb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-xgene-sb.c b/drivers/gpio/gpio-xgene-sb.c
index c559a89aadf7a77bd9cce7e5a7d4a2b241307812..62545e358b6c4b1cab25e1135cb24ccc3e955078 100644
--- a/drivers/gpio/gpio-xgene-sb.c
+++ b/drivers/gpio/gpio-xgene-sb.c
@@ -63,14 +63,15 @@ struct xgene_gpio_sb {
 static void xgene_gpio_set_bit(struct gpio_chip *gc,
 				void __iomem *reg, u32 gpio, int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
 	u32 data;
 
-	data = gc->read_reg(reg);
+	data = gpio_generic_read_reg(chip, reg);
 	if (val)
 		data |= GPIO_MASK(gpio);
 	else
 		data &= ~GPIO_MASK(gpio);
-	gc->write_reg(reg, data);
+	gpio_generic_write_reg(chip, reg, data);
 }
 
 static int xgene_gpio_sb_irq_set_type(struct irq_data *d, unsigned int type)

-- 
2.48.1


