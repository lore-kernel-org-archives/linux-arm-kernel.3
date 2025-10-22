Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732DCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=; b=shKlviOwdWI9nBPVG9Tvlbl/qg
	hhl5D6qn67qorgwVQObbsGg9LO2yrtElnN6Vlp2TF8PpCQVZcvIli3WeasCvjXcN/7dWl4VXxBkQa
	o2wo6FT2jYdbCUSndxSceN9K4TAzC+1suRQV2rOzJYwstQJ5iv9iJjkKRPOv3hhAcO+ARqUcuCEMM
	UKuU5LZ210OLyJRE+PlllHCBlwYGfZ6W8NAAAq9fcMJnp/+6UvP3kyB6ZfS1Mt5vJ1qNuoBBTbodV
	ZG/DuPiFEsovJHyqi0w9La1EPpRr8L52iTsC9x8WqGkmcCoPYGpr4YHiHFbtIXBPeranlN0KzMrtR
	KdhWStcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcr-00000002wOQ-2rKX;
	Wed, 22 Oct 2025 13:11:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYcd-00000002wE8-0sbo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 22 Oct 2025 13:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=; b=glN1i7hdkHdhdnW2F1cB6NWd6B
	nJgExm58CoqojMOSg0B2zPrypk25SP3+hdBHu/KjK8oW81CPE2f/OsaOUO7lIfoJXvGNK+38M5YEB
	xsUXDUfcXhqw7W+5kH+HV9JJ+rd7qttzPdJwohMA2ZbHLvShTu6CBaWgbpNG60LD7T3DMPrxv+6B9
	pdPtEYtK7v3Q/40ihVE2GaJ3uI6AKpcI7DJJ58A9k8vxsWRcJ1cOdoChsSdDSOxensO9XlkoGAoYd
	HpZPz3ImKEttDCoYGaAC1lXSnpdAJbIdZs0/xPOvsGztieenjEa77F/iLo5FrnPndmpgrQLCftjD6
	YlgwwL8w==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXkt-00000000ZTh-3xhZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:15:54 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-471b80b994bso51756805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761138678; x=1761743478; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=;
        b=3ZcjFJLXM9jG+js89xhOCxAmBZbvZapF5oMnhiTfGUGqPpPoGs7foPgnGKt7hP/Qla
         jmUilBnxG5WXdKfexFCyZsC7B47SNN2CaxIIqSl3wESGsx7YDm88MF2JuyFlkG00W9vI
         sI3Nf36eMN24jEfe05YPLuUrn1HrbcspTaW6pSMh/T4e05giOayfijV1NuO8B4w2mp/F
         907Gq0mofLdo3WfBbCf79P2k12xydQqmb2E73pdcrbfAhrGLKlNZ86wffmVgQJWGm+4N
         UzXPc4XxVImfpe4fhJqngacsadodwPnkL+gSEfvqelmvpc0k4vAHQWblGYGc9aSNF6yy
         RO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761138678; x=1761743478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JSTA3g5ank1TH+h8Aobptwj96daqy8jbcBAobAq2Oqo=;
        b=ogFRfB7wKkhe6DTDXwHhsRviXy8j2n514xXpwGt7l3JTlmDIDr34T0rMqaDCkQwnGo
         WGaWAPqn5+7YMjcmNJoZbtaclVjMR2drrvwuWpjVWAWbkXcwRH+eXqLSG52ipRBpKnB6
         6yovysD0RKrBltP5823X8kS6LxN5sFRQk3Kl17tBG8DtCgVd0PiXNZraXhorSpzlqTWt
         CKefaffVcRxGrwjS5ofdE5k5v59jSJ30jzhzdzxi/FfFxAsGJP90kgqZj9BnJMl5DQIC
         onBAq/X67PoJ/TXDzH2P94ehdT0jC296LVnHiL0B0SUAU5cCTYxKs+G8rx4XBEx0tZFW
         A94w==
X-Forwarded-Encrypted: i=1; AJvYcCVSUthtQQUkIVL7gFBcjOUcBYEKgm745ExRnDCxw7o3NXJqcAMC0k2l35lRmhhoF7R6e/oj2Itku4nrRzsxc23I@lists.infradead.org
X-Gm-Message-State: AOJu0YwDD63NFKGZLOC/iouqe27MPi8whE3i7kLRgFZcYRDKuYsfYhJV
	UQFXp8QSENAEgh/2C0p8yIALcFKeOnYjmE7sV3UyNO6vRazBVqe17C13RQqDioY6eCc=
X-Gm-Gg: ASbGncujbCatLcKqHGM/XHfJm19/EoEnrNIiHtAP6bHCk54snFhAuB+SMnPxn83Vzv7
	s3aEW4g0TByb/ejAeDsB2ilqELbdQIoWsc9CdtHpCyYIVcJiG/lf/HQQp3Z1L5uBzKRMhXjc09Y
	kVFSe1o8qXRhl0TDxdKXzSh7gEmramU9JtoeZg0IbwyV0NUCjn9SRhdwoWizPjvEGj7s6R2kDUN
	3F2RnxaU6RY+g3wFXkx3c83iThDWzgqVOnPhjuahvfZgBHXGXEoZX4UeleinQA3FyeXKevHz40O
	u1sus4u/2fKQ63FfkUU/8nmzV+YfiJkhGR7NgURDoFkfT6jvAegL0wJpOxZ03EKM81XvLbMdi1E
	rqMc5x61qTS9FNYd9kfcRT4v5fSS5rav0rfepSXCMfV3UrqAlHxfoPCGmFbVnh7iYyUcYTZE=
X-Google-Smtp-Source: AGHT+IFPbcXLAtn4sbFkYplsW0U9MyKC7XwA3JcXcQOZluMyTLcgHp4ST5MfcutgxyGiqz0u3cVNNQ==
X-Received: by 2002:a05:600c:a214:b0:471:ff3:a7fe with SMTP id 5b1f17b1804b1-471179123b8mr105019195e9.19.1761138678192;
        Wed, 22 Oct 2025 06:11:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:69df:73af:f16a:eada])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496afd459sm38839905e9.1.2025.10.22.06.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:11:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Oct 2025 15:10:47 +0200
Subject: [PATCH v2 08/10] ASoC: wsa881x: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
 flag from GPIO lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gpio-shared-v2-8-d34aa1fbdf06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=vspstOLquen8UYYEalfT4SF6xCukX3qfgdJchdoYapg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBo+NfeRZqOvOB01WUMzaKtGFbfDIcDIo9Al+qfC
 +wjKxE0T0eJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaPjX3gAKCRARpy6gFHHX
 cqOBD/wJGzpam5upjt4XFG3ZtnI76Qt73nTbQAr6FUYWgq99m4KBvN2kA12dfb4qlkwNn7EoUjW
 SRmIlbN0zVeIoKGUrYP1ZX2Td4/d5eE//J5BAx70ZFkCnbIe2cQQdyMR3Qml7oKKdtE63vg8dCr
 Qu5FHzCdTlgUfT2/2uIPdU9r6i0ALa5XvaEjLLC82mevOPG1gtrUf83JWiVqWWwZ6msRsyR8GY2
 XrTb6OI6XEkj3q/1E0iIviuAujfBeq9T1Ownl5xR7pdIBs5WOa80hNH447+vcOFh7AzkfCBK3iX
 6dwc9e7MuhS5qhlfytzC6kern1Q2LyAbPgbSF0K2lTcpStRr+TL0C5u+/v/u2dlWaiQV/5vgsY3
 M38/d/+SMR9NIR6RIIk+gmsuODW5tcXiet+FSnoN/NdlEC6CgSZxjOwHiOrYi4WnmtXcBEdGzgE
 r5xh4lhOWKOX9bb3Om8wiUdg+R24dQXyNu8yvSMPq85qlKROmlzenKwAeuC2YAJy++X+TSWMIgj
 4lglVWusNTJscQ4jiIfdA4WEfjPwEeFljCXRMAex66b/J+Id6R/Z2yCKTeEXey+5tirG4UwEmbN
 6fQ70BxWL5mmJU+NhsjvDwKCH7yVfWqNhcvZptN3Ji+1XZMmeTXbss4HoAjdl2x6n0ko6/T6ydQ
 TFgFaXpvdEUEjSw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_131552_665102_B291467B 
X-CRM114-Status: GOOD (  13.14  )
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
 sound/soc/codecs/wsa881x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 636e59abc3772fc0b333873a329b65f4213c3ef3..92a1e3bb8371e178571a6c1ed6f1185fe6c2e757 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,8 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	if (!wsa881x)
 		return -ENOMEM;
 
-	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	wsa881x->sd_n = devm_gpiod_get_optional(dev, "powerdown", 0);
 	if (IS_ERR(wsa881x->sd_n))
 		return dev_err_probe(dev, PTR_ERR(wsa881x->sd_n),
 				     "Shutdown Control GPIO not found\n");

-- 
2.48.1


