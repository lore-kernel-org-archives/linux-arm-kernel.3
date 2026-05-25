Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E68FCD5BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 01:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lh3E+qhv3/kQfv40DBxNDJmOjlWOJTi5Ytzn7Ux4m5k=; b=DKWm0EpXjOlkqGmZAlVRAXRL6L
	DEBTRMmOYVeBHSOJD61+OxHvNzSaqz6LYG11aUAgKfitIOaMls+iGN0pjwh4A4lLKBsZiZaZjCbqv
	emY9oUMNW4MCXl5MBEdTZRzxWm/MajHZkWi/osEHYBMR18RvYsf4I6SuUv3TunfznazuLzIGK9tge
	+n1/5FBNR3U9bYPOJeq0xB9C9sfTghY6x8dN9Ata2Ye0K9TYjV3a0jU2s5B0lnjq/89U5YPuowjjs
	RnydhJQhVpvDE0YAgiolbZvvwL9Mim9BdJVpazSPtH1QhkvCRjdvrMx02z/gX/GjFEDo8Hskw4u1R
	hDBfHUug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIe-0000000G1yG-0PV4;
	Mon, 25 May 2026 01:40:12 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRKIV-0000000G1sj-242h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 01:40:05 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e615b4c2a7so445243a34.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 18:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673203; x=1780278003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lh3E+qhv3/kQfv40DBxNDJmOjlWOJTi5Ytzn7Ux4m5k=;
        b=lMUPFQUM+FnpLTSryj11y8Yd7+twXOJ4I67U9ob31dbgBKqmePzqEu6NaD7vX9DblA
         aHwdPojMVLhyNCxeNCPs8DY86/7t9RyJWUwkP45lQMOEs/283Zf0T73TZt3rVfz9mpWz
         O8B+4iNwQ/9j5F7v3bfE6b7ZoG+uTLYP2Y/orCft9mcJKx/K71kzqOzHMNFGV6C2munh
         jbadPSWrpiDRpn1XSyDId0eD+LBIoNfIllFqLIHV0gjfRybpYw2U7hEpko46LGxuV1TX
         C1D77c+MI8fQhqA7yIcfGFHThknGb3Sr3Y0HDqP+nuFrjfjHOECQmJyekCr6AIrIoFAC
         D+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673203; x=1780278003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lh3E+qhv3/kQfv40DBxNDJmOjlWOJTi5Ytzn7Ux4m5k=;
        b=q4akTQh3N+w80AgVdFlDlybG/t2nyB3xahXjkEH2jecEbQdmB6iFtfHITWdE7x591J
         dLqf4/v56F9dT4mMgCFB7FrY8iSwa5e9s0dB8Y4MLT6k06nVZCbx2Id2oTqiRo+l7nXl
         kiCD94a97jer5dH/5LTyujfWtDGXXaVxb4dOWINjC8XTrG+YWclmjhLkKS0vNss91gOW
         179zkY1v29nsx+ejp7+fMjyJNg1yT+HWVgg+yVlC4jDiN8S2fSFXBB3XpCC0lX9dpFCI
         XSKT3E7BiLF5Zw6oSKEUAUTd+qRiVGL/282GqFsn3pPAl/hVLdTXLHGYVphXe1qCvhwe
         ULDA==
X-Forwarded-Encrypted: i=1; AFNElJ9g2WvdmJ7pgBfVkSvtTLIl7fa1gcGgpfTNws6LLDK8IuSe4aviyF9ZslsnwKSJ5xliB/cQt5KBMilP6CqR3W8s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy41xVhBHJybPL6Qnq0fjYbZhuGNc5gML73Q8nXC/jxlki6eVo9
	bWbKosQbcrvqGYyg2syNrabI4/2oJHlYPkq3LlyUZxy3AB58tTUOQm8sLMRqksmbo24=
X-Gm-Gg: Acq92OFcoiQ4PIGi5I1LwwdRUbkwGi2IdxHTIk7UTNOoUZxBrO7Ce/0yAMQV3RBJFdv
	usoHmzlYoYXx8zL8wQJN9g+vSwa+G3qDqc11T7oBuymcO+6nvIINFJuHeJLyPEyHke2Q17/HOK9
	4SdkIITgoR6sZX7JFODyGfT1qfj5VXIUaW7AjZPzZhZSQsnkUHjyV8PKXBIyL66QSC3v6AERtnR
	a3on+X9IDmM6QUl7ZYSbkY+sM99UIuJjoqXPvEqO+0aqxo1V9khRgolCoqK53li+HMvfLas7ZY8
	SECa6VyZHzT0VtllZSsVa1W6JNA5zgXHFW20ueb9C436RCPr3c3cB7Vmr1pprMKXDCRDJYM1QWV
	8wLT80f+sJA9NbhpcjceDk1ZJSiODCDSbTLfbm9jXX1ig5vr9+9XPFudkeOqI0MuraeR8/+72hO
	PS9/YLmMUE6pwmUHHyHUOnFhNZj9sO
X-Received: by 2002:a05:6830:6b0d:b0:7d7:da05:f2d2 with SMTP id 46e09a7af769-7e5fee1654emr7987729a34.16.1779673202703;
        Sun, 24 May 2026 18:40:02 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6060b2dffsm6250206a34.0.2026.05.24.18.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 18:40:00 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sun, 24 May 2026 20:38:40 -0500
Subject: [PATCH v2 8/9] iio: light: cros_ec_light_prox: simplify timestamp
 channel definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260524-iio-timestamp-cleanup-v2-8-c37c9408b7f7@baylibre.com>
References: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
In-Reply-To: <20260524-iio-timestamp-cleanup-v2-0-c37c9408b7f7@baylibre.com>
To: Jyoti Bhayana <jbhayana@google.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=7C8/5+5gnNT6M2AlhPrzghavej9n+bAnqS/RcFC9G6U=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqE6hSvUsVar0/xUDDV+QUJ/9QMjDeZul6qiVC8
 FnvZCNDU8CJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCahOoUgAKCRDCzCAB/wGP
 wGyxB/0Qj/N6aCMaKcrDRbJ5BmZ+vj037ba3Q6iW+PZkKjvGsd9n4PoFI7wD6diSeSxvG2GERAV
 0x7y5cPwTJeGgFrLU4Qo8z9NcqmY/opoPqkC68DGf1g4gTHMT2AFHuEgfGeY7XqOwhRn02ByyZ7
 +BgbYfMmx9PIrdrvLqgkhF11SndRrlvItLg165vQBWRtZa5DSb8jybr8+fyduA8COR7s0xmuXU5
 PQaOeq17CpIVkbeYd+2zJNY5zR//JrrRaAgbcQ1iXR86OAIlopDA2T+cAjRX1sezQfNGetxEBw8
 nhehymX7MVyKCKWxDzyMp+MovU+rt5IIKdRMjaV9OqcsI0Pj
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_184003_547495_FAD233C9 
X-CRM114-Status: GOOD (  11.36  )
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

Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
manually filling in the struct iio_chan_spec fields. This makes the code
less verbose and mistake-prone.

Also drop obvious comment while we're at it.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/light/cros_ec_light_prox.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/iio/light/cros_ec_light_prox.c b/drivers/iio/light/cros_ec_light_prox.c
index 815806ceb5c8..d09dea9c0782 100644
--- a/drivers/iio/light/cros_ec_light_prox.c
+++ b/drivers/iio/light/cros_ec_light_prox.c
@@ -223,14 +223,8 @@ static int cros_ec_light_prox_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/* Timestamp */
 	channel++;
-	channel->type = IIO_TIMESTAMP;
-	channel->channel = -1;
-	channel->scan_index = 1;
-	channel->scan_type.sign = 's';
-	channel->scan_type.realbits = 64;
-	channel->scan_type.storagebits = 64;
+	*channel = IIO_CHAN_SOFT_TIMESTAMP(1);
 
 	indio_dev->channels = state->channels;
 

-- 
2.43.0


