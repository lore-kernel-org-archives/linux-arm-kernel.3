Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9FBC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=; b=oydoyuIRAlDNKJAv3/xPmEvr5c
	VpFafmb9SiIW9pHxYZsqpLno13G00/EJaXZJOo9PL3cKb4R6Xx4w83+hTHugUzV6gEAOsWFhtgV23
	MYyN2uxqfNiYB7K/c+HR+fwaA+swosfpgaL1JmVga2ytqIM1zAWaiI6XzteIk4v406XF+z7TwCiYU
	tTlKckULaM0aL3mG/DGQoL0Lc1uAYIBmsaeh+JxgwOAworFUqtGTw+INxKwQS5RbynzNXMdgpIRBT
	qdmkmS6niDH0yvOk4BBiAzW3kiNTIeFyaHOkO5g7hiw0DEu94Sx1mSfFUDGN9w3QFhTaonrkjNmIA
	2kxaX44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1H0-0000000BFMF-3CfL;
	Fri, 28 Feb 2025 14:23:30 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to11U-0000000BB7x-3A57
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:07:30 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e4f5cc3172so933672a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740751647; x=1741356447; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=Skmg0PDZ6aTEM1UQM2YOYOU4KpBZIBFqyoOQ5W5ch3JCED4Sw62F9ujqUT0TZE+lf/
         9zoRCEezZiJ8Ja5hhMhtbjvGTZfhOAu0IpQjlCMFOLi+jh5kQ8FaHhOw1snclIBL1v0W
         aooVUH8fn5+R8Qji2X6xLdaS2TbVyRl0TE8qrlfAjtUkYhh35/MAZDYLJp/zoOZP8xrw
         oYtIOK9sbLjLS3PTHGd+bBaKG8AqXS/Iu/8GNpBfZLixMrHonhL++ifyPGTC5gT2oqKU
         wJgFeb3YhxIn02RDelaltOnsOMLI2CGKuZ2N/WtlJhe0rk4zoW8isBn8mtY/yoSKhJSp
         +aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740751647; x=1741356447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvWUKPp3Qf/mJMvtGf6kleKwT9jTpA0O53gNmEgl49A=;
        b=KgimeBMtSHl4RGUCz7S251OguQk++u91xaJ0KZQ8PCq/OmWzb+EEfoCFL3Va/1zn/0
         IWNT0qiwvtNRoj67Szm6oAiMuUDcWrYil1nn0gxhgOJ7LlEN4eV5fn8exanSmIggdpAu
         t5lOD8cHNPeb/Gh2Qc+rien5T2Z+wSv0subvB/bet61EyLzlX7B7igHQiKwFYDirMuIH
         wie2CewpblbDv7tTum0lmZ7bIWg5JTbzA9k/v6GAvHfI25YCDTrnpBxG0aMjObJq42Rp
         LofBDvPEXssVOz1nX09DrcCYn6Il0VBzN6bu8puqHphuoJhPiGvLq2+6GI4fC8HklG8Y
         1zhA==
X-Forwarded-Encrypted: i=1; AJvYcCUobtHrLmrfu5kBBsaw5khyq5daiFUmfwAk636AeHmYEpmIxNWbBRzJFeTbFIBKFKGjkwvI+dM9f8oPAcGVv3pd@lists.infradead.org
X-Gm-Message-State: AOJu0YzDL7LxyOLvVC7s+nXdA66rSkJFtCWG8meduNfxc7KU/mcnWYh9
	Ip20ykhlXSe9GYiNywaimtd7ob166zB9nYBlkcsP5qASvN8J2ewYJTI9WOmEdSg=
X-Gm-Gg: ASbGnctqeMqcviSCxBAjvGQsOcYzqYmIEPOy3rSxSAA4qCFfwhT9WKutrAK27FI9yHf
	s0Mt5S88g3vCBomjH4psY89eHYzy1os760VKr1vN7bIhJwkbhdWUJldZKZlYuzQCWA8YlIIWauu
	vLWVr+CpnpGEvwUlgOZLmILyNuEZxItJXb7npHb++v7ur/VgNADcfECiXdJZsuYQUdDjWrQdDIO
	N2bdFyIArhYvKZZWk5vdxt5yjGK+yUw5/p4fmzm/0nZZDatRIdIrPshUZLFscIJ5sjUwRrciBH9
	zEqFVU209v7Wkdtqw4ecdYS0deIxPcWmePJk3hqv/EE/QcVoVwMMio64fWGN7yRYW+6Y+DlNiaZ
	YrKer59HvHg==
X-Google-Smtp-Source: AGHT+IGZCKi+h7liDGF2k254zFpRo0bnTt6a/BEgRPyIDc7kptNekspya74S4whe/rs/kwdpZDQeGw==
X-Received: by 2002:a05:6402:27d1:b0:5e0:82a0:50ab with SMTP id 4fb4d7f45d1cf-5e4d6b6240bmr2836488a12.27.1740751647311;
        Fri, 28 Feb 2025 06:07:27 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c3fb51f9sm2550839a12.55.2025.02.28.06.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 06:07:26 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Feb 2025 14:07:22 +0000
Subject: [PATCH 09/18] rtc: meson-vrtc: drop needless struct
 meson_vrtc_data::rtc member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-rtc-cleanups-v1-9-b44cec078481@linaro.org>
References: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
In-Reply-To: <20250228-rtc-cleanups-v1-0-b44cec078481@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_060728_807972_F98BC78D 
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

The memory pointed to by the ::rtc member is managed via devres, and
no code in this driver uses it past _probe().

We can drop it from the structure and just use a local temporary
variable, reducing runtime memory consumption by a few bytes.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-meson-vrtc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-meson-vrtc.c b/drivers/rtc/rtc-meson-vrtc.c
index 5849729f7d01d7ec7868ff3bbdc5ed599aaa8238..7d38258cbe376e5a1b2af6250cb6d04c313175fb 100644
--- a/drivers/rtc/rtc-meson-vrtc.c
+++ b/drivers/rtc/rtc-meson-vrtc.c
@@ -13,7 +13,6 @@
 
 struct meson_vrtc_data {
 	void __iomem *io_alarm;
-	struct rtc_device *rtc;
 	unsigned long alarm_time;
 	bool enabled;
 };
@@ -65,6 +64,7 @@ static const struct rtc_class_ops meson_vrtc_ops = {
 static int meson_vrtc_probe(struct platform_device *pdev)
 {
 	struct meson_vrtc_data *vrtc;
+	struct rtc_device *rtc;
 
 	vrtc = devm_kzalloc(&pdev->dev, sizeof(*vrtc), GFP_KERNEL);
 	if (!vrtc)
@@ -78,12 +78,12 @@ static int meson_vrtc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, vrtc);
 
-	vrtc->rtc = devm_rtc_allocate_device(&pdev->dev);
-	if (IS_ERR(vrtc->rtc))
-		return PTR_ERR(vrtc->rtc);
+	rtc = devm_rtc_allocate_device(&pdev->dev);
+	if (IS_ERR(rtc))
+		return PTR_ERR(rtc);
 
-	vrtc->rtc->ops = &meson_vrtc_ops;
-	return devm_rtc_register_device(vrtc->rtc);
+	rtc->ops = &meson_vrtc_ops;
+	return devm_rtc_register_device(rtc);
 }
 
 static int __maybe_unused meson_vrtc_suspend(struct device *dev)

-- 
2.48.1.711.g2feabab25a-goog


