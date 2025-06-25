Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100BFC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=; b=RkseJ0Cg3WiqaMF8RpDVe1XanE
	fAW4AFTC00C3BAtDgZvT9LTx+5TQLISv16m3DWyh6aVy3DcDzJUbWpYpus6VdLCXxONk6nwKrcMwy
	mgQvppJanoeoPZskgKkjdnY3RJNH11WKnYBFgAFSF/t0z/er8hSA5J9j2TdZxhZrRIdSzochZFw68
	dKyS7ctPM/Svl9xzILmfPUnFL+KrRGqg/I2W3NZFDShCVh5HbbM5nV/A5PuMPGL90zYWHHtoAWZ3T
	liH49H5tSz0WQ4Q0/RoUa3G3hjW4Rm3RUw5E08/RhDYiANStcE4ifMUc7KzSvi7K+Ezt4HTEuGEH8
	nM0a8bZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQiU-00000008taX-3TxO;
	Wed, 25 Jun 2025 14:03:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRy-00000008K97-1f4C
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 10:33:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=; b=UmFQeKt3ACja5lOVvLR5RQzwwC
	fUgfMPG6XftruaEchGU5MNygX+yre53OzJDkg1IGtaKhx4o3kpe76/0gxbBxVIj6ioFMilwuVKQTV
	bBXLrd63AhGfRLPaiMi/6p52FQp7cNx6UJwO3wZMjaHN4QKjJGk+fPmz09nXUOBWiFNHpb0cUHxU0
	jnzZnamDRrbaHgKxLZHalzUQKATydsgT8d6dNrKdrN1KFXu7dVoIri8ygbly/UOsu98ckaiNsmtAY
	74/L5M2iKs9qrHkPbg3VQi42R3d3HHqw7Z6c7au53T3pXjm6ale5tggl80+n7FgqLGmDesYLC9GPf
	oc7iarrA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUNRv-00000005mqL-3oKY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 10:33:53 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so560760f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750847630; x=1751452430; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=;
        b=ua9cLLVed8Aw2efeHr9zfF6kaH53KMVsCe53a1xKCskx887ZZrQqvOE8zOulC6S6iU
         VIAvPKtFUK72knEQtbpV1VztHKUyof5LcMVRc0gAGYBA+2kSzR64U6909NY3E18trBr4
         QJeW7P+JJSSaL9F7juYAb5K79qwQIOLYMAb6rHtNZ1kA5NmVwvy57I63QYLetJDmuT7l
         Qc3OeuXbr3YcsIbSGXZcWtgvmKaulJsp5Qik+dWhB70sb0yvd0xl4aWfeOspv1kWvvPp
         gTi7/+6/hIumBqYfbeER6CvAqsc21O29ykaFU9g5UxdSD0m0LaAqL2LG1TKFDlXmvzOh
         pE/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750847630; x=1751452430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw3Cm0AyZRtYp2u4Mlp87QA0PGaxAk/S4JFRRmCDuKI=;
        b=d6cuIKQ3A7q7czMEnfy6UTic6l/DyEiSUD0VfioVQpYN/Ur1g8QYGQWR+/2pVTqaL8
         yzNCMsr3ssqtcEK5cqlDQCiSxb44L9vN8T3sZByQ1OLnSgBpa2mToKrUAjUEAAL1t6X8
         UE5Xlxzjlfu/R5Rf3o8LH5Wt4z7t+rVnWIMommP39qflF3kKiCIT3K4OwvghUwrorA37
         SPEYOKWd/UnimgHHyRu+54Dn3zx1tY5xiLZxjiCcczwW1vYXbIrezcM3TqoAsh/9T6nC
         w4n80N6Y6Jnp7K3V4lx6/Tq3qO1jGAfjRlSoG3iPYvcL98mBnNIBysoVcgj3lbmVuROz
         ZCAA==
X-Gm-Message-State: AOJu0Yw52L3M+DuKSrkU46SzeRJzpzqlr7iv3chAYNoUSFF8FhbggbO5
	gAOcbzoue6dEyctfeOt/R/J8NTmGLFv1cZrcrf9X86Mzr6dBuFwPDRFVwazFmdOOxZE=
X-Gm-Gg: ASbGncuwnaMxrd2/fUq5Rqe9OroXGvEOkCACcCY7ImrAirhCd3UQu9TpORoY4Tr6Vf+
	O/zmylX/CEEX8yC1VMZZsvr0JskS1T/oVfsjUpMXkfmV30Gy75S3rtCCh32WB5ufZ2panoirCit
	cvpRl41mI/tXeEI1rWMuNHLgOJ4CLFUU9bxUujfFUqBFYs2Qhp9iGRcBh/JvjPhLKjP8RswElGz
	IseOJWp7qdrdUMMqvJKEqt4zTuf754P9vd1VxtIitM4d0enw28myC6/Z4icgH01excp8jjEuvvD
	sSmOOV0SVyu2FK/XOXYD+BLY+do9z3zwM8wREQwAvtUz3HPBIad+sLMM
X-Google-Smtp-Source: AGHT+IEwM2t1XefxZU8DghVTXKK8wSS63f829kSWALD3RIefh4AeNCC3TbqP+9rqackkafREvW4tyw==
X-Received: by 2002:a05:6000:4024:b0:3a6:d7e6:f281 with SMTP id ffacd0b85a97d-3a6e7206d4fmr6033940f8f.22.1750847629787;
        Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45382373c86sm16133195e9.33.2025.06.25.03.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 03:33:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 12:33:32 +0200
Subject: [PATCH 09/12] gpio: stp-xway: use new GPIO line value setter
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-gpiochip-set-rv-gpio-round2-v1-9-bc110a3b52ff@linaro.org>
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Thorsten Scherer <t.scherer@eckelmann.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1842;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iM77eXflH98tEqykW1k+5Ww0CPuJn4LOyCx2J1hnDc4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW9CAekDrQa+N2Lkq1WXdL06pphPPFEQKtl/A0
 icei1YT42+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFvQgAAKCRARpy6gFHHX
 ckF3D/94LKQv+DwKv8kgiajCz0+LVB02vWQFLuawtrrCD3lT3mQR99okl12W8v4bFRqrQgkZbh6
 Mwxo9HqCfHrH9G1wPF88tIC0mVzVRDUcaMkkI/b4FaH2V+0uGdss9BLmJOKb1w4yxHpo1s6ud4Y
 nFa0ZFobojyWKWFqWgnrLBkO6Ee/kCKcHLOWs07yKRQSDbkiyhWoVo25QrzuqAUbBe5SZitOElx
 RP9QH+MV5jiCBF1T5PELubMo9gHJaztZHMs3/J/Cv2sgOu6GNRiU5PknjkdXY9Yr3ViaiGNVoq7
 KzUxVZLCCPxGNwMAtpYoCs8OazkrmTFJgeDdd8FaN+AUMRpzElDe5gMLKbxG4ywUxzqBDToLP9y
 ZBvBSYsWfXt7NVRv8ar/BcFa5+wl2NZu6mFOiME3DM19NoL++9oa2pQAWqa2l1pADddWStrecGL
 fjYRJasuaMjmEYDKKb9nnY7P+EqE9fMlUtwzCvldqXYcMGu6vfuiePHGLGUhvB76UPmHagMWnzu
 gdyb6iE/IAa2qwFBcjxH2dgglrcOhusiGNqea293LnB6a4b2QeAT87hOs9fiH7zhoAByf0Vuly5
 yFmAioTpLemDCiO4jMgJuQy02PedULImyNIjLmPw8V7RS2UW42vPkdfq9THCKWegBxq+langWnB
 lWhe1Qpcgf94OAQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_113352_068354_7D2F3F8C 
X-CRM114-Status: GOOD (  14.55  )
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

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-stp-xway.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 5a6406d1f03aa75e82423f7c5740fdb3df42dd4b..fdda8de6ca366662aec1fccb475f0698fb478ef5 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -113,7 +113,7 @@ static int xway_stp_get(struct gpio_chip *gc, unsigned int gpio)
  *
  * Set the shadow value and call ltq_ebu_apply.
  */
-static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
+static int xway_stp_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct xway_stp *chip = gpiochip_get_data(gc);
 
@@ -124,6 +124,8 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
 	xway_stp_w32(chip->virt, chip->shadow, XWAY_STP_CPU0);
 	if (!chip->reserved)
 		xway_stp_w32_mask(chip->virt, 0, XWAY_STP_CON_SWU, XWAY_STP_CON0);
+
+	return 0;
 }
 
 /**
@@ -136,9 +138,7 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
  */
 static int xway_stp_dir_out(struct gpio_chip *gc, unsigned gpio, int val)
 {
-	xway_stp_set(gc, gpio, val);
-
-	return 0;
+	return xway_stp_set(gc, gpio, val);
 }
 
 /**
@@ -249,7 +249,7 @@ static int xway_stp_probe(struct platform_device *pdev)
 	chip->gc.label = "stp-xway";
 	chip->gc.direction_output = xway_stp_dir_out;
 	chip->gc.get = xway_stp_get;
-	chip->gc.set = xway_stp_set;
+	chip->gc.set_rv = xway_stp_set;
 	chip->gc.request = xway_stp_request;
 	chip->gc.base = -1;
 	chip->gc.owner = THIS_MODULE;

-- 
2.48.1


