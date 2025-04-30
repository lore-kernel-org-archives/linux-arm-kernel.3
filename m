Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFE3C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjD6o/anWPJqHcfWOgZVCotzX69raOWCDkK+7Q297NU=; b=IjCgkaWQZoHA1qYxrjcE8caAhg
	SLCtuGxH0heNwQQ6d9jZxCPq+iaiTOl/uiFn8dsh6VEJlMNVoEiPzMAJCeCMIb5c/yP+tNiUq1GAz
	zh70P2pJ+k0HNnOd5aVRVefbedd8opvqX5vFZ+aKnZ009m2y23NpvOe2qMZI6Jq2ITMoRqR48QCJN
	Bs1eWuHsIBTls8n+PYg9vJsteTYqX/1WiN5m/yqtVi3Opzg/acxNIq2B58cA2VxzSNTQ0jqGDSaGg
	zJO534M+3jtYo2XQ5BCjftgTgYlAIrOmrD/3ojiRuk9+943Y2tfSPlkYtOb+eo5JLHxlgvxlKVk7S
	yOcH4tSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1mb-0000000ByaO-27hA;
	Wed, 30 Apr 2025 07:23:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1XV-0000000BwU3-3ufc
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 07:07:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bjD6o/anWPJqHcfWOgZVCotzX69raOWCDkK+7Q297NU=; b=Uf+E4kirNCR+7F9cXVNRY8yY8q
	3HmH2Hf/gtPTFB0ua5n/vroPgPMKBqMFN+Vaogu0SnszgUPi0dtpuyMQlTIcwVmsXso1mhNT+duPn
	is+k4uZDjOPauQwxIbViJiE8Wj76AKcTntOOpwMBI47TvwW+isN7vcIIUcZazBMGXKRjH1LvfSMyV
	N7dVHbNN0GO26952S8HbLd0toG7JPeYR0Lac2Oz2VqKqNg4OLYFgqGSc3+CCKYwo2AAiNvaAPTUSg
	4zv6zC3EwTSIXDyZVC8KcSk3HKkvP6ndcnfXRNOQj5fmEgNttNZwDRcJR0Ug2vfKkhd3javHniwp4
	Pf4FIzGQ==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA1XT-0000000DiP0-0PHI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:07:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so12600687a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745996844; x=1746601644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjD6o/anWPJqHcfWOgZVCotzX69raOWCDkK+7Q297NU=;
        b=a5zltYQKCbxiBdpD693Tdgg0TgBiWIdP8MNHemj+F0UtQGKwLssTAIehzMuO0pd7pj
         d2lPwNfJhnwAVl3WQ5aBZZ0UTCWT/aJRJsHz2rbr/5TydMaCNGGwQZKyxhQQjuzNzr+S
         rNoKdNq2kGqGL4Y0N8PcDJcF2E6U/gjJWureUlyI6/8gARpPYwsdUys1EqS5+yu2XtYI
         sAmPUbVA8Hb9OCOrNY/lgB1gItNZwZ+GNFG76Yy0jUSZVDrLgTgF6D2ezTBHlka9rcxq
         qupUJNpjnP59khGBG3c6XIehwmRdIAgpAp3CCykFCYchyj1cOncNRBfKthTz+tpebHbi
         2eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996844; x=1746601644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjD6o/anWPJqHcfWOgZVCotzX69raOWCDkK+7Q297NU=;
        b=b0bDtDz6drVubq/mL3160Ln7vOzg6ibc4IPumgs3JHX5DhmjNZ6zyhbuScOkUvKMZs
         kUqpIO4czpCCUDaaMh7I07PUgE46KGMMH6SsJkuJGUsJBLKLII+411PBrY/bUJy9fzrc
         en7YNWXaIyKMh+5KD2aKwNqIr8xGBitZbOJuvR0rBgaF6M68Ym5ZTtAhGyWkg8gm+p8m
         n6g8MsA8gcP732HKagns2GLqRi7Zlx2vaQkU7AUiHeYQcYv7FQeRdMT7AXivtBrR1zcr
         LREkw4MKen9kjqXocg8eSdpUoeBQAHNFbZLNTdXOfXMrArKYmeqR25DWSLtCFNg/9773
         kxDw==
X-Forwarded-Encrypted: i=1; AJvYcCXA6M5dsQ9UxPRR4kVQBHoEFl+9Ye9nVhsB+iOuX/FiCdqq3rmIeKche0c3fXpiPXZnxrpoZJS7pj0NLlZtTnq3@lists.infradead.org
X-Gm-Message-State: AOJu0YxqcG7G/wFiYwBxp7TXHw03QsSwyrItufujC4Z80guzK9X0HAXH
	Z/7PF8iWFjVvBiciQEdfwrHuR96mTN9kyf2NX49Op2mx7sXkV7l4
X-Gm-Gg: ASbGnctpQaPMnmA2EZaBz+dIQMGdGvQU9DsKC/fS0D+HsxE1c/acOqyv+7FXdo3SkCP
	yc65vfigDqZQCZV29nIqehv5X4Ha7A2Etborark7htkKalZpOhG5FqS08A8V7gjAcpfYe/m86/Y
	534nG4KFWt++nvJ9ylq4hOpv5mprKvIQfNCHxgjtrqDRgrhwoXr2fQn1geXNZFCt2R3ALBGIjoW
	RQVD1Zh8JuEFjos3Ond6KJFbxHyfuS6e9Tu0xh0OmqfV6XdTf1y1DdbjCHDVPoA2E3cnySYaHZM
	TCYeiLYcK3xcMKPW43QNws0wdYniFSXjKmjy8RRWM0TnI6x6oaiYOa7R2ZiASn3TZeTHRHqWUqi
	uaN2iOubmWLE=
X-Google-Smtp-Source: AGHT+IGy8lPaSG6g3uyt1tMJXqadrwwZjz+zmAhTL9j+tzHaJW6EPVja61ZR7mlmlOOJA5VlbLXZkQ==
X-Received: by 2002:a05:6402:2345:b0:5ed:2762:727a with SMTP id 4fb4d7f45d1cf-5f8aef7ef1cmr1055997a12.11.1745996844210;
        Wed, 30 Apr 2025 00:07:24 -0700 (PDT)
Received: from hex.my.domain (83.8.121.197.ipv4.supernova.orange.pl. [83.8.121.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fec3csm8334314a12.19.2025.04.30.00.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:07:23 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 30 Apr 2025 09:07:10 +0200
Subject: [PATCH v8 6/9] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-bcm59054-v8-6-e4cf638169a4@gmail.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745996831; l=1115;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=3p4uTNZuJCVCY04RngL3HijVPVoeTTwZHmaA3AfSjYs=;
 b=MOZ5SfrNp5aZLJw/b/aGeXsAUTZ17aBm26czPcfPC/rsnP9lCtVIG2WEwzAz/UKJZKJW8a77j
 sUmuysLSACwAV/xddDwZIeLUK4T10EpC+ayGvk4hardmmeSUtchMS2j
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_080727_248573_40644EA0 
X-CRM114-Status: GOOD (  13.25  )
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
2.49.0


