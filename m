Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D7BCCF9E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=; b=z9jM0qMCryk7rkQ4bbGwvV4Q3d
	rJP74ud/NS2jB6B9NTOUFnTCXain8IWj3PqulPl3hBXBL/TwaXTFFJDhONl8cwlsInqdjaCp9GJoU
	3a9FtgItzF6LfwH4P/AkbEFF4SKo73gIKhndhU5M6ERJCrslNa+c8SMJWIo9jCwkjG7LUL1QlebMl
	SX1B6T/RXXxFAI2uttiY0uQNe7EQtQLrBpVzVDypMrXViSdjXgK+Yx1B5OkFNxSZO9LOOZtF9Gybj
	z+/ix1vtqtbXUvoLksYDG2jv31PeGAweThYVPhyUIYY0RVXThsOTtwU0JNq1THGktXh7hmcTdS1w4
	o4BF0Eug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYco-00000002wLq-32B2;
	Wed, 22 Oct 2025 13:11:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYce-00000002wEF-195J
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Oct 2025 13:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=; b=bgYZUQFl2CdIyNJqDp9fpf37bN
	5cLaluo0kuQXkOCLpMYb6MKeeOhlVK1/9PmPeS0gU1lsTR52Wwf+mNh+qIuNdZ40XcflJD5rDMNau
	GLrf+ED0TdPC7kbp/e6QTVPFvuhEn7ZA1ZYEbI7+WN96DCewRiHw4n5490xb02y6YlVCRloaEnLpN
	CkN1LxGtW6jXlBl4T5+hGssDUCv7kFMC/Ye8N9VwJEDiXF98W92/dPiUJZ15NCyZBCHkRtuKovEi6
	U6r0CvOsWsrOhjaNckSKXejm77OPuJrd2Hz5/hIhXvohW4qJdydNQc4Gxa3OTVqzQf9Xng/bPgmEC
	MBra/EfQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXkv-00000000ZU1-2XTY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:15:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43229265e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138680; x=1761743480; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=cGIF3TTXEnZzI4/0jxcEmynBiqkjAG7N5j9ZYIdaAHg+BiyTWwLxRnzPZDv/4tu3oz
         zMh+4bEN4Q1dDJCZtYXYHDtpwf/S7b67W+p7JqXI3i00HbNfvUjFXGSa3YuKC+2+06dE
         5GqRb4C7+0dCmOs64mSPi/vyYt9E1WQNxPxpf1MEdzEr+PrKEW9fSQMkXlH5kfnXMmev
         AqDX3Oc5oLOoiQ4OIuGTJlRlSz8GIPqpq1tRIZKcyqf+CYz23akzckYjS737ZNNCh/ee
         NETYkXqPS2PnxDIdX7oZTLa8KcSGHETTMrE4d2L+wOxmkLj4Pqn0WJINUIRU/adz/3KS
         EiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138680; x=1761743480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ndMaJDazpE5vfGfuGA/DbEp6kihBYbJYnxWQMZaUODQ=;
        b=BvDwj36OCelUytQdmOiVdN9V31oqthzhdPWv6zdcQna/hvL/6+apphfRmsnleGrsjQ
         u3SDaaoh7UG0oIyVjU6w6kT0VTnBqXd2p7EBO+e+WbynFR0eL7faCedWm+cUwGL6rQYB
         RBJlcnX45xOwtUgnZwiw2PJlWMd7cO3K0TVvEO0d9G9J3gQBpD+9hMvVoy/fUVvuAJQ9
         0u58HWlODRMqBjzhQeC2TFVc3CvssaSSWwAud7EnOwuWreBhUKH7DiXi8FTUvjseHoNK
         +3ti6THPcXcgl5KeD+EFn19cI+r3UG6RGa9ysq6jWv7QevnqY3XTgKA/woZ8wyxG+7dr
         QNOw==
X-Forwarded-Encrypted: i=1; AJvYcCXE1ByFxVtAVe445bEC3pk6ZYyS9unD3hg/gZQ3zq+E0J5ZLXiTWPbHrl0xotH1s1giNxAcFSVcy+uVWGXar0xe@lists.infradead.org
X-Gm-Message-State: AOJu0YxuQXHxSf26Q2/CnlRHHN4NeBFrY0Xt15Z1Jx9phnF+DP7UNEZA
	TdrGwhfSBBL4eFGoPje7w6kfjpclogd89WgJYFetB14D7ejKMRfZpMJAfj/iY7xr/YQ=
X-Gm-Gg: ASbGnctqbaVC+CdPoaG0RbGRCesB6ZKgZXf3kujUxwWvdubW//3bJH0tsfjSKKf6cGH
	6Jh9PQSUV0HHrqEoRaMevLfdBcC4dRlNM/44aeWaVrRHBk5w26XspGTguIx20Un5rH31FNN+jVx
	DjAnLD3t50r57my0zwthw1VUkFH+Hkdkk52+nA2dDPfBhac/aqFNdy3H+HkTiaR94ce9PYuOsj/
	k7QhCoTKcYulr1fG5PtVyZeJRqjPPJu/Qvh9dYczwYKa37p9bRxWZ9eLTD72Mm0PIRY0HNnGkr5
	syvGsXu1IegxBf5tQzsbrSlYBB4nKO82XlN4+vGjxKQCeFDPDj+7510Zw7MbmRjQLjE4jXgVLwC
	iDH9R1BukeqpxE8yx1vpZgc2I0/iHqbnOAT/llDk2Q6qkb0p86iGNjvEWnWFIF1Yc+PUNVyg=
X-Google-Smtp-Source: AGHT+IElmfoCM4Q6owceAuIC32Swd+WBqF/ju4yk1O7IMXyO8uZfHXXvVXon02N5YX5wAalBpK6E0w==
X-Received: by 2002:a05:600c:820b:b0:46e:27fb:17f0 with SMTP id 5b1f17b1804b1-47117877244mr152930715e9.9.1761138680082;
        Wed, 22 Oct 2025 06:11:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:48 +0200
Subject: [PATCH v2 09/10] ASoC: wsa883x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-9-d34aa1fbdf06@linaro.org>
References: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
In-Reply-To: <20251022-gpio-shared-v2-0-d34aa1fbdf06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=xxM5DFs0HrWkdhU2lVlfFzKEyxjnJBr+LeYHk9Z5T9I=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfewAfk5p+4oeOvjAnI585CCMJu5zdsTl5su
 CQCI6kaATOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 cm3nD/9X6poJlB7hW4tB328EYqSDhizysWMNuFzzrMAB/gZ/dCtlUIbLV2FGSN4/hqWPj9FLVYa
 EfjcmFjHENOOZkS30hb0L5xxn1mh/rjIAWHwi3pbleTnKTDUoCF4W0wJ/Zs6ckL9JzdcWHVuuMA
 Az5VbXNST9iwIAUxWYdmAeAZ2AcD13/pqNrkGvH9uqEwQ3e+wEmMY512+R8xKRhlHPRJwhTR8dL
 5onGyAoPZdHP3Ob+9N9Hlxc4WyTB8rVa83OTlpu7Tag7fbqhRXzngDxUPwYsvABWFvWcdIg8IYC
 k42uNeJy0KNjseRxvzZxC1pyACVME7kz4ig6TJOmGVyfMCenQJ78AeaIqNIGlnKqr3viJE2kxzm
 UevcSl/ZfjTeBVfrRSgC5+3JzKpgYOX7mVPsxyrfPWh74V/Zq4Ba2Pjxbe7Ay4xY3aK+zTbjWrs
 Z58p+1vzp64cUQ+Rqm7Mh8U9+v4gMcbBexYEZFt1g9pqhawriddU5vyYGB724c1Qe49WoWGfae/
 mArKavWc7ccOhUfWgffapFXIglUnrG/NtQcJszys7vV+yPa+djWNZjQ94nRuNhU++rtbmNoDPYK
 77Gqebezf9XhV9ixSvIGqf6I1zHHkROLC5eYTZy6EdG9Saxw8sj7arI4mkuQke0mNuh060xP4OE
 zX/Whv3fFll6glA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_131553_731215_A44B0ECE 
X-CRM114-Status: GOOD (  14.42  )
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

This driver is only used on Qualcomm platforms which now select
HAVE_SHARED_GPIOS so this flag can be dropped.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index ca4520ade79aa2c9377449e29cdd33e9e8dd28c5..ba60b4de6cab7740cd8aa70c89f6e03e1dc2dd12 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1572,13 +1572,10 @@ static int wsa883x_get_reset(struct device *dev, struct wsa883x_priv *wsa883x)
 	if (IS_ERR(wsa883x->sd_reset))
 		return dev_err_probe(dev, PTR_ERR(wsa883x->sd_reset),
 				     "Failed to get reset\n");
-	/*
-	 * if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios,
-	 * which does not handle sharing GPIO properly.
-	 */
+
+	 /* if sd_reset: NULL, so use the backwards compatible way for powerdown-gpios */
 	if (!wsa883x->sd_reset) {
 		wsa883x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-							GPIOD_FLAGS_BIT_NONEXCLUSIVE |
 							GPIOD_OUT_HIGH);
 		if (IS_ERR(wsa883x->sd_n))
 			return dev_err_probe(dev, PTR_ERR(wsa883x->sd_n),

-- 
2.48.1


