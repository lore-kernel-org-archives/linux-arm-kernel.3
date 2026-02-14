Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19D7EF99E1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 04:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R43m5m1ez1GonWOxLG/dVD5h7A9CUwXvLk5pXGze70s=; b=hTnpJJwTPTXn4moOgF/6NdwHGb
	Rmks6IAnWUEWD3nn++6W++n2u+iGwwJTJweLegBv6EaaJ7gyTFmNk3IwbhtEN3ei719vPv9UKEXaY
	xKdJQJzTclqU3PB64pv5+y9AGxqJS4kbjDJJrgmYANpuIS489Sgo4/b4vA1RKpuPlOKAP/kHcRwWz
	lYdEcRkXlpkt81yCozan5uw+5KoBPWAUWelOsVGSVhIsOg4yuaDm8W43Ku1ypI8zfZmZ1wuxOz13U
	rybqY0TUje2Xf/N7+QLlbMd4hNDNi55BS97wAdKlZjJ9ZuUepxOf5ECN2VkeKsx31kzdSxHQYOlVD
	Sr/3CCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr7XU-00000004HhI-2ntL;
	Sat, 14 Feb 2026 04:45:52 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr7XS-00000004Hgx-1UHi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 04:45:51 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-649e97f1e99so1519670d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 20:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771044349; x=1771649149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R43m5m1ez1GonWOxLG/dVD5h7A9CUwXvLk5pXGze70s=;
        b=EVdpz8Kh+14zAehPUdkAVe4OloTiedE0SH8sP+OfV4Xvg2SJc1oOzGiEW+3e1nRuqu
         13T/znmMoIQItXsM37IdSNhC6u8kPcmZZ/2gjGt8upOQmmhq/LOZla6uIb0y/zRwBxnI
         9/2K4LE6Jpm65USP+8rDS2b6iYc25Acm+C5wfnZ+unLwADacwQ5PiT1lHKg7I8rC394E
         JMvOxJVLFaV+SD09xCKDDCaJ7BNGjNEKjxP6bl1MF4P4shCVj5yVmh1i1egNREt5vmZM
         c0Ck657lQ9juNnSGCncpElH8uqFHmFCj93SVBkU66LFOkGvwCd0Xs0bCwkI42QTZHke2
         HIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771044349; x=1771649149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R43m5m1ez1GonWOxLG/dVD5h7A9CUwXvLk5pXGze70s=;
        b=h3fXQ/gFt9Y9vlmqm3jlHlrs1rrhahsbBohV5DuHpA4sia8G5Ct+teBw0RPXbMekda
         fAY7dzHLAZGEDcQ+49LHz1FkU9yQtJvhb50f6VPAPz8xQp7/v7y7dziwuTuSPuELaeMZ
         nAoNSQpocpFS/uhAF4swA/9oYD94oR006IUdnuAQa6C3VutiYFLay5i441AMurYWbVqT
         BD9aeOvAhz19stRKphx7+zHOj3egGlvllvwXcvGXq9Ac847l1yRrywQht5iVdMwa9e9j
         zb9o+Z4OL4FtydsE2jP1P1r/Q5waV29YyRwki/ZxCcgfvtkY5Tkml+P7UuPVDmzniprR
         Hc8g==
X-Gm-Message-State: AOJu0Yz2za+eQ/MqXPneNNTspOCvUQXm5f9jq3zMyBid+wEV9T3nKSbT
	XMofIUySqYNI8MBkpnE/r5kBfCzPtOIOoPPqTFeIOFJwcav0Y7+2Ufhv
X-Gm-Gg: AZuq6aLsHxCB4oD1ZESNbiEzZbRboPk592f+Wwa8Q32G4v6g7TlhaztdoiGc2KziNwx
	VYqLZHpwXexCTCZJFXpbCoE6kDkwULIdopgGyuY1e8hAMsXQou0gu6Zvz+/TXVvUBHuDS2SYUdH
	pFhZYgTycsqm2MlDmNA0WSwhSS2U3ZIJZ4Q1bgX7jkR5Y6zRn4Uifzgp+FFHI3Al5ug57cdJPyy
	m5OZrwWo1fNt/n92CkS1rhgmf9ehImcI9yiJSy//0KcE07IdX5RuLJp8WHlacppFAZDwyWnzfoI
	hFk/jCr604xKR3P8G3kC3qZLfn2G+DwJmePCnXJaFPLM94ysNlW16SZVmlImgah/aXKg9zY9k7N
	H0YxaN5yujY3QRFiVJFmbmwOK/ePkNT3sNb1gTzSxTATxS4IMYhSRU8rW6CZt0HtFT1TTSXEEky
	cZDpB5DyZXsXEDqdgQiAZSxfPzNyMbgcmkfkL4OHOPDmeYsnqNa/i/1U2ng9LPmNU89KP5JQoej
	5Bd35L0+pzwcFjH2LP3EB0nWB+J/W0ur5NgCecFdKrSuOEKfg+lRA==
X-Received: by 2002:a05:690e:14c9:b0:64c:2114:17a2 with SMTP id 956f58d0204a3-64c211418c1mr1742970d50.62.1771044348735;
        Fri, 13 Feb 2026 20:45:48 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00:e3a8:26f7:7e08:88e1])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22eb2059sm570067d50.10.2026.02.13.20.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 20:45:48 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] gpio: nomadik: Add missing IS_ERR() check
Date: Fri, 13 Feb 2026 22:45:31 -0600
Message-ID: <20260214044531.43539-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_204550_399442_3888B72A 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

The function gpio_device_get_desc() can return an error pointer and is
not checked for one. Add check for error pointer.

Fixes: ddeb66d2cb10f ("gpio: nomadik: don't print out global GPIO numbers in debugfs callbacks")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/gpio/gpio-nomadik.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 97c5cd33279d..e22b713166d7 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -430,6 +430,9 @@ void nmk_gpio_dbg_show_one(struct seq_file *s, struct pinctrl_dev *pctldev,
 #ifdef CONFIG_PINCTRL_NOMADIK
 	if (mode == NMK_GPIO_ALT_C && pctldev) {
 		desc = gpio_device_get_desc(chip->gpiodev, offset);
+		if (IS_ERR(desc))
+			return;
+
 		mode = nmk_prcm_gpiocr_get_mode(pctldev, desc_to_gpio(desc));
 	}
 #endif
-- 
2.53.0


