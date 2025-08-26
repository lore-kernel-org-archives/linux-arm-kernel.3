Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C9CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 11:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYPPBVbCADpKhi1bi9q9qzWJoLo8lysoUYAIi1sKWso=; b=L75jCTeEmNV4980hCaB0v9hxdS
	KnAFuKoIWGOWtnAs5yd5VFtxHV43JPMupi/yey5COTP9WJty6pRcGTOOwJ/yjDEN81mMM1gFdzs34
	DFo8guz1Az63pG5zMMRy68Xzf2qDdpd2JSfTLsMnhrWG5RFJHkvFdozOLrch019PvafbuCAGu5CRA
	fdLhdap0KZ3xYSLtcrY5WvnvDurLy2yN/ZVKeStVr8nSolbIw4IYjN6Fjg+4H9eu74XMe3SHLwWCT
	PAIijrvFQeiont3/5MjY5ITQxg1JvZiaR+h+n2+cS6OdHin2aDOO86Pac1AsgNoXOZR6S85IxJh1m
	o/0Wu6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqrRl-0000000Bhul-2KLS;
	Tue, 26 Aug 2025 11:02:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqqOA-0000000BVnX-35Es
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 09:54:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b627ea685so11636345e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 02:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202089; x=1756806889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYPPBVbCADpKhi1bi9q9qzWJoLo8lysoUYAIi1sKWso=;
        b=PbL15+e2Q1xNwfgjJ/PuhEQFFPx2gWSjrf45xyMqHR3PdxdkGDU2NFv8cdtUhaAULN
         vOxbFcWJJJH7qHF/mDuYSVN5mgXRwTPz7cbzG6+ulwwnwInX5KYOO0opJeB7cz94b1uV
         PDdxPgiyZC0TaWJdYHajJqfRpGE129K94P7X0Fc/SKJe7h0uY6cMlliK0e7P2IUbEAi+
         x5LD6aMz5nOB4NcNZL5qFxWJ0KNhS09KJYsUL/5qLkLb8oc7dtsFyyzphe9hPk7HRcsv
         mstBxPhzrIT//xsYBlHnOoVU5iQiKp2DxTyeEQOF2FKYk0PzxZAdLf8xKwHr+3dWh8Fe
         70ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202089; x=1756806889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYPPBVbCADpKhi1bi9q9qzWJoLo8lysoUYAIi1sKWso=;
        b=GhxDHKHm4BFXRC7POy+vDRdcz5M0+x8o/dJ06cXsaDFmxLSnvivhJmbQksfgllDFe9
         obHYxY6TcAnuB3H9l20ID6CcYbMLEx4pq/gVZJPMyK7YWG8YSGPrdebNnnzQrcX7xabb
         uYYSvUOHdGZ2hdBQiBvAQRZp804a3hjfrKROMz88fNaBKkHTR/dp2rwCMwVSeY54brWv
         NIJ3oWc4T4KwV1xnV0wTmnK6CR7JMwB3pXp+JE64OoEEMHTR7/E9yVk1sNUiub7nuljm
         ol52yMP7qv7vNiSYjgIEEeO+CNu88eYD7EOkJNBldWNirQx5EmdzkiqW5bUIvwCo4ycj
         77og==
X-Forwarded-Encrypted: i=1; AJvYcCUiy8G+x6er5A97SBTY4gbDr05gmdpPozIiqizXxDAcfgkWhNNa1uxmLM+IN7oE0qKQl+TwuPU3up7XXULaz8dM@lists.infradead.org
X-Gm-Message-State: AOJu0YxwK8/nv2So+ne09af9Swtqa1LFz50pZj8DcpxNT5fjr3FhkG3F
	BM5iaKKKe5GYbdOKiIulla40Kdp/huhe3eNAQhnZ7P3wxxHQ8nyOvjF76LfrEIAWpNQ=
X-Gm-Gg: ASbGncur/0u7vkE4zP5yRgqtJbFpmVN2v8qDv686IbHN7qCLCoKe3gi342UKXw04L27
	pWWbY2us2xI399TN6NUWZZa9n82aaX+k9ln2Tnxcdu/ZdlvI+loN51kdZdVKAx5HXggwG9xl3Fx
	VUAHAzEuy4S62JrmJtnj6fQw3ttleQ/qO3aBbTElIoWBZFGEAGKCnTBBwlEwnUK+ohJotyOEWDy
	nvY7N1eW/nbwnyi57KFpMxGkmC+YnW2HnCoczIWIx0LTANdODf8KX2D97M6806JFeQBVyAV3XNC
	9YpKtUKA4hRFpoE1LsPqVwwIhA1VU61trmerWptVa420KoP5uRpRfWBjSHRL9TDuWSI9FF919JZ
	eTGL2p1ATiP+ZpPscMg==
X-Google-Smtp-Source: AGHT+IGpWBizMY//MBhSvlr9tBPYwg0Y5CIU4h89Pdi4ol5gUDn6YVkBG9JRn0IY9DS4Uz+pdj2F+w==
X-Received: by 2002:a05:600c:a4b:b0:459:d3d0:650e with SMTP id 5b1f17b1804b1-45b56f781f1mr93995895e9.13.1756202089140;
        Tue, 26 Aug 2025 02:54:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c7117d5977sm15708447f8f.51.2025.08.26.02.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:54:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 26 Aug 2025 11:54:39 +0200
Subject: [PATCH 5/6] gpio: mvebu: don't print out global GPIO numbers in
 debugfs callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-gpio-dbg-show-base-v1-5-7f27cd7f2256@linaro.org>
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-pwm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Ih0doZjhwnqEDQvY4BwLNFHdMVjlZY2PNt5pCcC7YMw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorYRhcpj4kqrJ8fCQz7UztTDjdV8EBVimDDXsl
 58MvqCng/aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaK2EYQAKCRARpy6gFHHX
 clN6EADhb6sNqywomuQGbo2ieaNoLgLHDA7EmFyphMzWXyAawSNEGuBX4/n0ThtHi25Yi4innjv
 mCr991m26FZq3T/hcccGRbWPXAF5EvVzn8oFTa3ABrM9hxRg1uGzD6d6vdwzo9kp18GW0HfyQcs
 Fz+md/af5QDQzJRHzG2w4D2NDTc+iWdT0lX2nd8Vr08n3FPtw+yJvnaJbavDtGdCgpD41gTLUd8
 3vyl33Idw2mbNroYq2RQFezk84pCh5Y65qYyJAu/8cugvbwXkyFJ8qBHDQqKX6kiYOFGRUsyxuX
 A3wepapXNcOKLKAwA9b3s8SQJug6czXExk29z2Rv9ijJuPxArPScEv5LdYdwIhAEad7u43YpZm/
 sHfCTKhb3PbsY1R6u0J9EQ4GS7rScCaWU/L3ulx/aR8ocK2D+3mSEnIchmuHmmL5PRGzAS0E535
 H5ieprNvRn8jxG+T7OLs+3W70GIYk53ud0qSyduu6VUuN9Nul1eEtgKZplHMjiNkM05iIzDRY+t
 Ggl5wWu2ww+8AjSJnjxEtuTZS4DnKwSg+f4z4sN//F10F0SFquqsVrklUQxSQXFzutLCzrKbg4r
 t6/BU4KTwKIxNB+VFO2hx4KL0iKISjpUkEb7pNTtM6oDhaErh0AULImXD3xg5rgVRmQcToBtyN1
 X2vSa8ptjrUp0zQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_025450_780304_C8128C11 
X-CRM114-Status: GOOD (  12.62  )
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

In order to further limit the number of references to the GPIO base
number stored in struct gpio_chip, replace the global GPIO numbers in
the output of debugfs callbacks by hardware offsets.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mvebu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 261ffd0c614b7189287c361f392f3df6d1b0bc57..ac799fced950e306a967d1965a13f8e1802e77b4 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -898,7 +898,7 @@ static void mvebu_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		msk = BIT(i);
 		is_out = !(io_conf & msk);
 
-		seq_printf(s, " gpio-%-3d (%-20.20s)", chip->base + i, label);
+		seq_printf(s, " gpio-%-3d (%-20.20s)", i, label);
 
 		if (is_out) {
 			seq_printf(s, " out %s %s\n",

-- 
2.48.1


