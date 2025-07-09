Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4A9C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 17:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/0cHEX1WGiZE8mwyI/JPOFvvGfe/GVd0huttz7DYHs=; b=o0/Cjw2agDHG/bGC3W45Z1xmME
	Ybxp3a9afpFoK72xi4NHVxu0nQ6lEZGWh1c5+fb9FMOLsSZsa00Zsf7GvzObmpA6w2+EQ+dzB5B/O
	CwbjLnpy7sX/auvZbs8stI5qTq1Z9TlGRhhd9F2SYQFNT2EqygqCzYu3AMndDYiXhu6PmawW6sBiw
	jMm0yXvBZ/bsuwkkQyUyGBYsqZfVNty5ebmObHVfsEVReDlerK7DRgLdbVBZwjmlYQZJhFn5KYeYG
	oCIQMY+r78ffrhwX8+CfH/A9lDQM0sV+OrRKrNQvHjfD5J6YZ/UIbiGy6q+OdMf9L/cfbUANPniEb
	hlU4S4Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYDI-00000009Np7-1pfH;
	Wed, 09 Jul 2025 17:04:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVx9-000000090iM-3CoF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:21 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451d7b50815so47351625e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071958; x=1752676758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/0cHEX1WGiZE8mwyI/JPOFvvGfe/GVd0huttz7DYHs=;
        b=dxaxFHj/XmhZ0FtFEof6FzCYeUfukVvaglPxkEjVOED/XfjuZKiCUfH+qWod02exmp
         Jx7UuqRnE7+ZljNqR8kJcdyiucqTe7HD4a4iYLrPiOlHHZi+87UW3S6jkzV805QpTq31
         E7Saun5AbOjrc516G3w1nHQ564y0/+bjk/doxYSsQImH8U3I5bwTiwvmlybFHmBG0U6i
         t254NV8U4Vp+Q48/jNp6/IFO39CoAB1nov6Ih3L6cwAA0xL7oE4fCYfrfL032zaWUgqF
         4JXmHefD7mTUZfwFC5HQcspNAYtk7hn6cvXOYBImyEIrufQ1KxwKyoUAE83GeMDukrMw
         vyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071958; x=1752676758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/0cHEX1WGiZE8mwyI/JPOFvvGfe/GVd0huttz7DYHs=;
        b=to+Zb0R5rGoMPz4XXizK5sdXCUn7J5574t8q3ItYaFV+tJzi7PvtWrC6X8yYbYMHec
         wnp+bW9bGAinxI7tjNUfZUQrMOM/rPpMQ6LTemJbRqF2ZbqTs7XEfj/D6ID148pWea7d
         /fnlwo19mU/dOauza5DnG/Q7MLaF/ieDjhh5DfqCi82GWu8KW0FToN500oFr3URCkEo/
         iZEAwRmmpKxYxohC/M5NDLsRoussXvxPzWLH3KNGIsmsuoWG90xOGOYa8yjeA3h47ZTj
         5XzTtbv3JJV+aKD762XKbh67+4lKSNTS3qe1JhFTnxXImRT2Q8kjGrv0U8woXx7U5kr4
         2gtw==
X-Forwarded-Encrypted: i=1; AJvYcCXUTD4j/8TMjLCP8d5v5eAbz48fG1vBMqYS0mNvoRuVSOndkGsdWYMyywbtMtOWA0dqaHyzQ1un2JeD3EzJ5LtH@lists.infradead.org
X-Gm-Message-State: AOJu0YwieS69/ATKfy9aBTJDCeyGXYOa9IQSd4kT1kd1DhHRhKLPfCgK
	chj8vI0c4dgxB9p1K1cgtRfs3zssDHTo8CQu6s8mnJxlQta61tLpQzdjJ3NC7jwfZGQ=
X-Gm-Gg: ASbGncsvjZiYeWC0EcrFBBHfM2hklBdsHDkTVHiNAnPKMnvvz7fzMSunKC1Ug+FmipP
	cJDT8H796pg2pk+1makLrV070bIGYT+eXwh9Xo7hrKBjZujbf/BVsW/G5dBIbkXsMtDf9UPx7dD
	IeyDR3AnSs9F39w1YoNhveq0nJ6aqM7fLdfhfwhTSK831rMvgVv0g4HbenUGXiv+I3NZLVMe6WR
	3ago4E7p4arCEDxZEcMZEhCXVEOyjxd/of23QmMYvhpurKeaUz0yAiQCDE1dSTB7aXd7l3RtFlw
	hGh2q19UmliOQPcXAH0daKxhTV1MMyjLXOgFT+4cp0jYMe+mPra5tsQ=
X-Google-Smtp-Source: AGHT+IHJL3AtHw/EonyubylYUgvsAX3aEA1kWb+hfmhi4rwD64AqP18DXBVWa7fZWLEMijUB//O7/Q==
X-Received: by 2002:a05:600d:19:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-454d5c8ae6emr21757475e9.7.1752071958441;
        Wed, 09 Jul 2025 07:39:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:39:08 +0200
Subject: [PATCH v2 12/12] pinctrl: qcom: make the pinmuxing strict
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-12-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1081;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iQ18p+opwS51aj7kQgPPUv5KuYwgsHKMpCHQbdUzIuo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Hh53vwVwSAhW66U/ZVT3BJ1K+Xx5actm8W
 SIfx8mfLfuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BwAKCRARpy6gFHHX
 coG7EACGCen1sbTZOcLtihqfgfleRvxd76y5gasx5ejhY5jN73Ryz+vjJHtDwd0l8c5SrMksrB6
 t7OuK5xDmCoMqMKP5oOyeqLRRCAkG+Bmb5B2OQB1nzWC9+7adNNl5rNXdk1UlZJum3AJqNI2xaU
 HzQ2ZDMceCyhG/Rb6B4qmWtfdLKiwGQTSjKvy2FoyiKyP1Kkg9mta/0tJcbaoCJ4KIGpY35E1Bz
 vNq+LbVz1VduLsXlH77XQUw5YQApX2JOKQ6E31YI4F6oiDHonqOoshmaQi+J0BEZYUgZEJIgRGe
 U0vwdMdBK4dlY3yHw6HrK2Tnqh8kawBRgh7OeZYoldO7ICasE0MkR1/VRArAynV34jM/THvbj3H
 +plh1jmtOLBgb3t3xLuhkdAjsXU7lLuznLsCsL+cweuriClQTCPwJtO/CuPSxCxQ0O/D4BSRZu5
 cVnckT4XlctODT6EkMNWLvzHgb/PAfHS0ZpGItYuV+nSdQ0nI653/gECD1stS1bkCeVnT/tJ0nJ
 WcFn6s33bTLewA0UiRkRJa3fwOCoP8hZripGucl8phvCVzKI8bI+ueBfR9B0nZzOJjwDDtVTdjj
 Xun95s+UXln6QtpXMasLGtGzUdktTreMUdgPihMF9TwaoN0biXPnFeXfQt2JXn4vWrGO9/mcIM6
 vn/2GgtvVmDuNAw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073919_830179_34C7A9F2 
X-CRM114-Status: GOOD (  11.19  )
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

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 7010be8d1ace062fcf7743e539d2065d4aed856b..ad572c923e2ab8caed134207ec02c4107d4dc2bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


