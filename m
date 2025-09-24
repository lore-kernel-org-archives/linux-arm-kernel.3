Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B47CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhDMW9EyWA9awJNXX9Q3cXommnoch0fAiufj04SUcx0=; b=L7mLstN9XChEBCteL3rlxtvcdc
	rpPgFmNTPo0pn4W6HYUTckVNsUHDvo9axtf1MjfAlMuuC4Hn90MkWgoJi5f8l5h4ixbX9HflN9AIH
	WksEHXr5lI2+VVAlKFNhmDSptF+5DoggMyZl5LqFQDAznms9T2WG7j/km8EjkU/j3cs/+BiR/DBjf
	19sR+5fLX463qU20C/m4KI9QUEb3fCshA1B/hSOrKtwvq6U5wbSDpzGo8RNDqjbGy/WG9lUCjksKd
	rsg8bLPSDNHFzqwT5yA/E+eClvzXUQ7aX/aaqPcayTarAOJNc6oghMQxmZL6MJ5FJmDrMvLTf8Lvc
	ugIEJDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqh-00000000t8a-1cYv;
	Wed, 24 Sep 2025 14:52:03 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Qqe-00000000t4A-2a4z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 14:52:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so9788095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758725519; x=1759330319; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhDMW9EyWA9awJNXX9Q3cXommnoch0fAiufj04SUcx0=;
        b=Nl3XKXgw4nyK7zO++W2AI4cBop7yAzJ6axBcJphmx4BogUiAFQcR294o3WDfxz0CoE
         LZiXCcbWBPiaZ3cc+KGxiVRnqOeuJp0ZleQKEUSHIInH9v56AUOKQS9+jF8j/n2d7B0y
         lTifk5gFB87TpBFrYQMuh7aUUh6kIdnIaxVuthmL4AZK414iYJwCaFhvdsVVputJ4UDV
         4nO4zuudxzq+Qe+24uaruAiJNG2v7UI4Hd2G0jS0xHKpi1dmX2WpStKT2epwvMDfuNOq
         PZvAli0HR5BJXAFj/XPvS6u3ihAeuaCMhnT7J5MKOh5Dn6gOZGg4H4FiTYttT/T1gAr6
         cKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758725519; x=1759330319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhDMW9EyWA9awJNXX9Q3cXommnoch0fAiufj04SUcx0=;
        b=w9FE93lyfYPwX0mn4q2SO1YvPzU2MqNzbsTcuQ9YAyde6s2G8jKkqOYPod0fzhVUpq
         luqko8HOFQPQTa3ZuqabDo73Ov5pbl+mjo9A1G6pyp1v44vUHX7um0IHdx7d3+e2K45s
         5RSl8A0Q7JHqzylfJunaWdJTSyJ5krmdR3bi2WhOlaXbrTDb6JUZwRQUaxo60eKD4XiP
         msbzHWhpFe8o4Icqo/drfltE/+6YQFOA7e3G277qf0cqFPKN2S7BXyuRBTgWnub9yG5x
         ctLJacjwHtyySm7kmse+KPZR3GGMpB2ieFZ2m16ZQPi4fBEPnU23O1rTzn7v08LtSXye
         tcPA==
X-Forwarded-Encrypted: i=1; AJvYcCUnEhY+AZRXTeDv2+sWc6CO1xHnNNu1fF6SdL+IUHtE1HUjq4At2G7ba1nHFzAW7IiHcc6koJ6aj0lNImAt7hnB@lists.infradead.org
X-Gm-Message-State: AOJu0YxA03e0c40EBxAMZlyN8k3ImaGlHPmP20wefrrkTr0ABzPRQ5Pj
	izIaXPZhaqb4aUCBZhwra34VYLzlZUe8z7jn3L7yb4g0JguPJw8/qrsdKe9rnPhXwd8=
X-Gm-Gg: ASbGncuZtVw6/tc116fA/qThoJLbrDBhnr1Hbl91lC08tEbFLBqFVc/4TRlaaQ7rRIa
	ti4MDwr3bMFQDUYY95epFiEukqIYD6UNCIToVAuiz7Ny9/cMDXgVh19L/E8TpQPnpKAYdSpq/Co
	tFBjrN9fvA7pur4sizytElVk4o9RPY7ZhiBlS8ntRjzk64p6A0QCCC82tJgA9ovLWoKx7LcNBHy
	P9TkiThYTu0jGvVbfcQgcqIciA5Km7XMeUT3qK91Wiq7dCePgxrKbGB/bag69xcpLpF67ga24rJ
	oyyV8hiO2Zn5r+oxKL+WFEvbxx8lUSAnHDIH7iwno84nFzEQf+pIe6BoO/vvZtlQh8KdaQTOntW
	MeDcrygudNenBcZyQRg==
X-Google-Smtp-Source: AGHT+IEXQ1OsqbaopW/81AV01FMskOhevY3liqHQ+TaZzWyXAp5VdKtAaaFJhzum2Q2RFl6zG/ksTg==
X-Received: by 2002:a05:600c:c168:b0:45d:f897:fbe1 with SMTP id 5b1f17b1804b1-46e32a0de18mr1279345e9.32.1758725518644;
        Wed, 24 Sep 2025 07:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1729:c9b6:7a46:b4a3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbc7188sm29514750f8f.37.2025.09.24.07.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 07:51:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 24 Sep 2025 16:51:31 +0200
Subject: [PATCH RFC 3/9] gpiolib: define GPIOD_FLAG_SHARED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-gpio-shared-v1-3-775e7efeb1a3@linaro.org>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
In-Reply-To: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
To: Kees Cook <kees@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=der9rbuzwFrj8Ks9ulK3QjlAd3x3WVP4lOrBQ5vkuIQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo1AWF7GWhBGJxTAGF0PPNPgubeRhYpSPwz8NCv
 Nvi6uNAKwmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaNQFhQAKCRARpy6gFHHX
 clM3EADgqkPo+x/ufaWkg/WHiN9hw/cvQg7FiJdhEdeFpxtrREOwOstiUn/WMlvJf2D4BMLn7cu
 mokj2sl9AHpKriv5ymzg4FA1FGhJEgjkK46mjC6T56uk4Lj9yapACQkatEbVat7XhRM8PnBgluX
 Jc+89aNvU/Dx088tAolt+UYFAl+45zfiOJEARt1xuEWwW8P/26l93XIE+bDy0qu9fGkKuWiRiec
 5PdwrLSNmbfVKAra7sRgOFFBewIJM2rhf9J34K74Y3g4fM9WjzeTKconSAaEHPSkgUzxHn2Q8Bo
 sSz2uatngoMnPxxCaiAuGawKLv90e+HbbLng9dghn5mD9Espf42WF6cqI5EJ1kbl76L1Xv4oiue
 4RnSq6pmGN3nL+LQg99+Yv2BmrBcQsjFh5vIuLyKyCGI7YLSssw+V5trZHExBH3knl1QCTqHCNH
 V3CU9z91FC4t5KeEimKB2XzTMj6XkCOI5YUN3iau8Od1M16+qMysica7cKJ6L+gPMKCrgkLVfqP
 DV6Y3x/EvuCr1EbBd2jXOdBJ0vxxBXrwn4+N1KFQR3AyEkhgar155iTpZRzVjehN0VABnc/eJCp
 sRS11jZ1qiNgb7iCtv05Cc3QFmyId9CcL8ck/LYyTKXH2HqwC9kuIWvmrc27II/8qMFiGJZM5tT
 G4vQ94hkIbTiDFw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_075200_683492_60EE630E 
X-CRM114-Status: GOOD (  13.19  )
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

Define a new GPIO descriptor flag for marking pins that are shared by
multiple consumer. This flag will be used in several places so we need
to do it in advance and separately from other changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 2a003a7311e7ac5beeaa1c947d921149ad991acf..09ac92ed0853f2ff0013d1b16a5dd082c9fd162e 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -204,6 +204,7 @@ struct gpio_desc {
 #define GPIOD_FLAG_EDGE_FALLING		17 /* GPIO CDEV detects falling edge events */
 #define GPIOD_FLAG_EVENT_CLOCK_REALTIME	18 /* GPIO CDEV reports REALTIME timestamps in events */
 #define GPIOD_FLAG_EVENT_CLOCK_HTE	19 /* GPIO CDEV reports hardware timestamps in events */
+#define GPIOD_FLAG_SHARED		20 /* GPIO is shared by multiple consumers */
 
 	/* Connection label */
 	struct gpio_desc_label __rcu *label;

-- 
2.48.1


