Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5CAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=; b=4mR/K41Vs3+fUDpBJk6Cr4YKIn
	+2taUsE2OQFf3wyKmMRN+GoPLrKMO+zdkMTZ0/zfyZeRZ+QsvYGzjUMqx899S/aiAshjrCMqttWOa
	UO6gGOWxfQ3YBqJ0NlVKCnRCiS+04VjTiGgPRE58LIq0/SDNMQgRTgsdT7ClWX5tEweXrr4HN0doQ
	EWR1pmqZ05e/bsi9oB3XxcfkmJPYaQa1/GhIrjW8Mx4ADAq79jBMzWDVzhzBa8iqFfBJXkoumayJq
	DABC5DXcO80svd0aj/33+wcW9ymtn7cEegGaw2sv53vAnOgmUqcuwg250+JAXiFVnn+fDuwEArGES
	jqYGRfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLry-00000003IUx-3ZPp;
	Tue, 04 Mar 2025 06:35:10 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLeG-00000003Ey2-3fQJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:21:01 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so2145776a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741069259; x=1741674059; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=;
        b=aoLQt6C8O13jbVkp0nC5Vv0HNGOGKWKEgfulpwEczuSLS4Gywib9lpV83un40+kaPu
         P6V5yaNpQiruP6jucfuvpa2EGfvPxLawFzaJeMdTwjwoHJeTWd+F/9+zsauP4YOqAQLo
         mGZFXoiZXaYXsEarJfjfYrwcaBVHlZ7CjesgjwyGBnk6bDu3RvlEimMyrV6HGBYGRBzP
         uu9/gOGFQBWQecn4Vk+lYf914w9uABe6fgPfIk7MntTX0KB/geJBu8WTQW+5yCKZWMSf
         ZbyStgCLgmpd1EiCJOl82g6MHB01Hxamls8lhxRc7IF623WWM3xRL//Sjl22UTfmMAIO
         by2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069259; x=1741674059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=;
        b=Gk+6OFmmCc1JbibiEaIicL+MeqpDvjnKbZ4pr75sAUG8tCL2O64Ui3Hz0QhHeA/Sa5
         5GHsihGVcDcftiyo/t/+nMA6wsdGWCwlBXwiTjJF0zOl6vHu1vsX6f9CuHncn4v6eGsM
         j8kH0/FOkajlfTQLVMmsg8uIT+AxZk/uhikI/UK7snOJ+DtuQSd9zbYx1JQvUxFBSo1f
         RDwICMyohOa9op1AWQhgWfeQX2xDPtkqqBrd6f/nnlMy1teb30+o956VJu9Y5XxhYebt
         G55VN21Lb3Eb8uRwWyzX04sBAFRtkzxfXNbdAvBIJC+A4l+QsiaZ2gF97G3BkL3FhpJv
         UE4g==
X-Forwarded-Encrypted: i=1; AJvYcCXf39o8wL+3B2poAoue9OUtzDsRplXaOGhnJMoEqXzkXxo9/3v/DmemA6cfRQumLcZ3pmCOXrjOd3QL78b+SVO+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7gMCsJwSpKFKaM6/8beZaTM0vaNNIRoTs0QpPNuxcC4GltcA+
	T56/jPIArIMS+FxUDFCSDWpK4/EDCvRRT7c0BkBA0Q7KN9t0yhKN
X-Gm-Gg: ASbGncuhMT5LWSf/gDVaGwuBxd+7w1zt/pjQjC/a0zh8d9HukWnbeUo4CeNYEqp/X92
	4jw+qBSfOgWrVB3ha+mFrck/DzuDsBIIpy1kHpALfZZqeeEAdWIYECFnk+eALlW3Iv6fwobyYuh
	PPU/SIFHgY38Npq7C5ps+ovX4yT4bqVKb1hlsiK+AlFJFkGx3pS1/O6iYs5U2OWi4G6KguhGQay
	26hHLQnDSeB2Kgg6hGcW/zfVgkJMXdkJR7PzTfecYfzJZ8Q095W67rCCgdiBQ8hQro6Zka2grJ1
	IC21kZQrU+JruCNy9RJZjRynrNSIOPRn3MzihpEIizzdurQqr3osg3ogZFFXwClWb5RlsWnJPsq
	+X1DQxrwcmih7FRI=
X-Google-Smtp-Source: AGHT+IF7k65RuFpi5vcMQUt9egy+xwhpGTj1cng+wp5sw25dBvunYDYYpr0mx9G5nQvOMdoO58Hq8A==
X-Received: by 2002:a05:6402:2747:b0:5e4:d6aa:82ed with SMTP id 4fb4d7f45d1cf-5e584f09047mr1884443a12.12.1741069259446;
        Mon, 03 Mar 2025 22:20:59 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a663fsm7609036a12.68.2025.03.03.22.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:20:58 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Mar 2025 07:20:38 +0100
Subject: [PATCH v6 07/10] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-bcm59054-v6-7-ae8302358443@gmail.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
In-Reply-To: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741069240; l=1115;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=By/MtmZFNRfjDngs4ERybGWRLb6s1X3+TidkVsSq1AQ=;
 b=s4Ry2k5Fl/z1tcHti2oR4JD7kL/AUosoXm9JepTzRP7Q0GbcI+ScfcP9E4YGPzG2k3Ox0cbLI
 i4E9Y2Onm8WAdS6a9fnsc8eTjIXJSJENAFrBVrUnz7zzp6ZJ6rlsOZi
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222100_923116_C875D674 
X-CRM114-Status: GOOD (  13.43  )
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


