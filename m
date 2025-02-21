Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3407C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=; b=t2FWMxaM7s+RkA4D5Lg5A9/oNl
	8LVUM3twHP8BiAd/2Nc5QTe8EUq24PQRnj/rQ7QqecjZyUjqxrqfQJ2O0L+ly07M4vKMo9DTzJc6G
	I8n/pn36GUaYYbo36uJ5f8OwnNiYjl3wv5esmIcPmxNcY7VqDQBymAbf4DXQMG9g2b1yDhxVgEJNb
	1pDnHhP/3qEhit7TEfE0sQByynxxOvKHwZcBgqSzPsma/0XuBxImKdNu/A3A50Kp4WTzec1qhhGWg
	dfjrGlwaLtFea4Fw4UhbwY0j/46PymjT+Rxj6Er4o3yAEQgfPMz84fka28ZVLqSQRlOJYlxKGbIi2
	p9s2TgDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZbw-00000006mjK-3lMc;
	Fri, 21 Feb 2025 20:27:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZS0-00000006ko8-3ODx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 20:16:45 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-abbec6a0bfeso401226366b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 12:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169003; x=1740773803; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=;
        b=lvNqgtWgxYKVN5Len7ezR01Pr8R+IcgoIvp2XtbKLCUwXmD5dRqLMrXXspXmXahvVZ
         4tfAG9nEru+ZphZnWrjyTQvfkAEp60tIqP0U/rsiL3jWCv4mGHqb3vKRxLQyil8ALhhI
         uudeLfVTSLyHNg/0K2bOjxiwzf5VbRW2fOH7fBt24itJAx+L6AdQDvcMlrBpKtWyHFm4
         qykGOmEUjtnUHw0y2JPYFV99O33CSEWjEAwRfqvO3IBFsHyCG6GSK5oxc7332M9mFdvH
         6RWsOXuLhzEa8ac5XdADzkRVGHTVEja3UAv8yLEhwXEBy5Bc4YK0TUz/mjPRoO63mceu
         QbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169003; x=1740773803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=;
        b=NEY+rta7Z/FkdAgS5AKU2d0aUWHOP8QOFEHZF2v75fqQlC8JcJx2nC+uUUt/zdLi3t
         dr/anepLqIltqRdhxQ2JUrnTW3Vw8oi8zshQBUSy8sKjYu151UD2myryhpTjY/qGhhCD
         XhP6KsO7zft0G0kZ8usItpq3NLFt9nnNXEA3HbV0sqw/w+m0n4Pm2u+OdKO1msfZM0S5
         IMYTHXEcVINSyZhCCaN/Jl0ElA86lje/4ZLpZ7tCoLS2p87Ge7/hWOSYqhgU0MpiITXX
         Q3zxiszijVPTPJ2qiMwlN2+Mlq5v/i/hAKq6iJ+PRTW+3KWoUiyI2gW2SFTEzOJHdrai
         BAvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaLgz3NrIQyR/2IAS6OmPWxSWNPdcKoGSzIQh4Hmw3lWO/f3znIHee8BFOWOH/bx8a7eSaeXUAnBuo2VQGc7io@lists.infradead.org
X-Gm-Message-State: AOJu0YyK+flHB4cF6ust1kM7KiaRDMRX+gqX0nDxBo6LrJqCYgQQTGXN
	gxpOGGj9PNUWZSiEbTHNi88BkAqpIGPb2rm4FaCe3sAdcuaazNHa
X-Gm-Gg: ASbGnctFq4sV2sea31/mtT36AbAP+VC/CIxfThNwwL2b3VURSkjzVrX845Ymwc+DtKD
	hWPflM2Tbzgf+jlbvT0cQODU2zjxUjniZ+KZlz82xhnY89RBarvHk2paxpMMH2K1uiJTmz5oxGj
	oiNlWmgLfI4803/x0TNQQz46gkHimRJN4l4FdYZXLUdqX1N/y+DJ8rHN56SdrEaXFuMZBQm/A9B
	53tU+Ho9nftQsjihm2s3s0iMfjwEj4Xar9o20R7mUqqUjIZAeavU5q6kLMcfGSzk8uPImy/T1Pb
	S23NDw1/ifiqUkhbcp+F70I+QbAgDCy8FgLl0p1g4TroaxzMKuH2FdR8EpFf/wjVYnmi+o0x
X-Google-Smtp-Source: AGHT+IH+uvFHPhjJ5Xj1KehQoD4CHZBTb+pHyDr5HtvV//y3lys5Kp1ula0enz7XNu/uAsi00fXMyA==
X-Received: by 2002:a17:907:728a:b0:aba:608d:4a22 with SMTP id a640c23a62f3a-abc09a09707mr482919366b.21.1740169002909;
        Fri, 21 Feb 2025 12:16:42 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f70sm14127594a12.12.2025.02.21.12.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:16:42 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:16:28 +0100
Subject: [PATCH v5 6/9] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm59054-v5-6-065f516a9042@gmail.com>
References: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
In-Reply-To: <20250221-bcm59054-v5-0-065f516a9042@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740168989; l=1115;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=By/MtmZFNRfjDngs4ERybGWRLb6s1X3+TidkVsSq1AQ=;
 b=gNFwFh1u1kW6rTOgxhdsSw4umldZ5Jr+kBAMTgdwKzpUGpkSzfc4BWBKh0PHeWgRvRw3YoV5j
 wfUEF1jy5j0CW1oRBLNTrfil2Danx2WT1Dr2ucwQm8kW2dhiCCMJXKa
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_121644_847974_DB7EC5CD 
X-CRM114-Status: GOOD (  12.93  )
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

Instead of calling dev_err() and returning PTR_ERR(...) separately, use
a single "return dev_err_probe" statement.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Added this commit
---
 drivers/regulator/bcm590xx-regulator.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/bcm590xx-regulator.c b/drivers/regulator/bcm590xx-regulator.c
index 9f0cda46b01506080ae5fa709104a8df4d174a8d..a17311fa30e4d48c0a4925778d7bed486ac7a982 100644
--- a/drivers/regulator/bcm590xx-regulator.c
+++ b/drivers/regulator/bcm590xx-regulator.c
@@ -340,12 +340,10 @@ static int bcm590xx_probe(struct platform_device *pdev)
 
 		rdev = devm_regulator_register(&pdev->dev, &pmu->desc[i],
 					       &config);
-		if (IS_ERR(rdev)) {
-			dev_err(bcm590xx->dev,
-				"failed to register %s regulator\n",
-				pdev->name);
-			return PTR_ERR(rdev);
-		}
+		if (IS_ERR(rdev))
+			return dev_err_probe(bcm590xx->dev, PTR_ERR(rdev),
+					     "failed to register %s regulator\n",
+					     pdev->name);
 	}
 
 	return 0;

-- 
2.48.1


