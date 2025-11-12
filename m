Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EF4CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=; b=yqDj0iVxehjN5jNDU6s1Wwjm1i
	vSKX/dXo8rPaQjBt2y+xTiyeFMGqL3HkQRLiGR3TAYkfVONooOFZMvGu5EJmuL4vZp9PQyGtV2M3S
	SzCY3e5V1oG3eSOfa4b1U7c+yoBwfiYEMnfUUbB6hVaDowAeHik8YpoMDlruX0KQ0nqUcNcOc0cNJ
	wGwzBoNawjLal7W5ptkYihWGZ43+z9dmMTeb8qAWB/Gfc//pTCsjSgOVMexCrB8rnENmvNppQN41Q
	mbcKHYHafVCcOuLlq+eWEeCLlWTaszFi9+B9Me061NBw4BKmxWCfr1lnPRcuj0kdVCPeypM/3dPp0
	tQyfy9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8s1-00000008fUd-2z9u;
	Wed, 12 Nov 2025 11:18:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8rr-00000008fNb-3htV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:18:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-298287a26c3so7896695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946307; x=1763551107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=;
        b=Ljso8C4slZ5yiisUSiy1YEAjahzSYeBzwc6cIQrQaBbey5eCarefSWyn+uyh8guYSC
         Bsf3f4xIrOdoI4fHj9ZF0jGTo/poUu1CBuhYWRtmUZfwGtp5d0zyJwlA1dYW3gW2CJUO
         +awc9iUbuttCK9yEy1QFl3lg3XtfU+2JCASyrUpc5UrjWMpddBt5z0bNVFBkUE0OETTU
         neoiApowZcSjUPxev3mA63UJ9LnmHB2mJdZQA2mBzsjXA1bnRUB42/5f2RKxmwIZwfLU
         BAbTZDUVdWoaqauG3aora824aKtik3iuDJOEZEuUP7zIzgI5Kfd680W0jl+KTynPvtMj
         7bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946307; x=1763551107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=;
        b=ffHUM9IG+m3+m3tqu2MZQl+2I4eu+2+/k0S2dE49H1iWKqCoiglKjbLKzX2epKG9fb
         R5g+3X+qoc5j2KZ2afeMYXINaPPnMov3dF3lsr0eZa8hE8ieV4j5mH/lpiJffOOP2dSm
         H/YrXelxvZCO+LqVxHgI90Az7vvOO6sO6GW3mr+KrNqlIVHeTEquAGo7uEZjmzoZNqSg
         cW+xZK5+d6DDBNvXuDYAbcF5r8zYHpVMPEUQI9Zt5u29UAx7UVrvL0f+YKlK/yvruJZP
         Oh7BOSx+dNRZsoL+rzd7S73oaPiHi7dguRo7vQ/8TkzdHZuUoWy59Z4b+fvh4j3xe0xO
         3zVg==
X-Forwarded-Encrypted: i=1; AJvYcCVZPonck6hxRve2zhd7DZsM2ZpSA+/Fdof7jVw2YGuKuqb6CxDe9Znwe/7bAJN8Qci6O5N9ZGcyJWMBNYnQ4lP3@lists.infradead.org
X-Gm-Message-State: AOJu0YxuzR6FRpt77rAdwVlR/F8waahctf+iltM3qU3DNBY22G3GuvP4
	n8Z7rIJ3APJU5PA9u3z4LldpcEu+9lD+AmTLPB2Uc0fGHSlpwbFagCXG
X-Gm-Gg: ASbGncslseHZe3taGAE+TDmkCODUGqq8faBMf1ozIckkOLhb+qcLMMQW4h5u913WQEW
	+kVMLrP2x/rakuWIClOnu6OPD53eEgDhF3sweoP0M4iJDKqH2Gy2KZNPrfUOYslSDpYLLtqtPKe
	4do8xr0CrwEG38Kg2nX1YyYI0UnYpxkkDwG7i11Y1uRV8s1fOwDotFtq3ERKwgYIy2XgU4gqA1G
	smg3r/BGLQYU3lNVY7jqMJh0fV6zsfljOK0CeMlb8W0hNmUgwwB0aG87Q5mTNttfO4rKdjA53+K
	L7H/g/pcIiRmt1b8gtIh1K7Fd1s3CRsKaC9TVzMwjIFauBAffOI9Wm3+T39RGBKCtVf38mU8jRr
	YD2OiqW0yH+R8LGCnzV011T/iCrQhCkZwmDnobGQw1v8QzZEsjrLqqKhaGuRUshsdVIqgfb2SXV
	XdixcRRO3/tFmqjuUt81ciG+RF8bdJZQY2Ml/w/Gxkdio43RxZsM3qBt0CwO2dUnO13sdrrNYuW
	F+qIM0YFOa8YbAiMI8mcg/9uHr9ConJepuZzHtmd+XLyN48/MbsiyqGfV1f99Q80A==
X-Google-Smtp-Source: AGHT+IEImt2oq5AVyAyincVqTizrLP2oINP9hgu+RQmDQEbV/h6h5zM29LTMvGX0qa1Tj+zk9/lS9g==
X-Received: by 2002:a17:902:d60b:b0:294:fb21:ae07 with SMTP id d9443c01a7336-2984ed92d45mr33420405ad.21.1762946307045;
        Wed, 12 Nov 2025 03:18:27 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:53 +1000
Subject: [PATCH v5 07/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-7-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KDo5qf6VinF0dcocAqVHp8Ouk8wH3LA0jZpPa6Inudg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUdZA4+/VDxp9c31mWLPB8Z1xzU9H8o5bWfLi7zwL
 fz9vPJZHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKkumMDwv+iDSLuozZuJUz69v8Z79VyVRceJ3QsUthr+n/mbd2rAklWMDLfnfll
 6aovjr827RbynnHifxf4lfqXZyn/z+aa9YGbaXM0MAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031827_952647_F09DC4BC 
X-CRM114-Status: GOOD (  10.52  )
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

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.51.2


