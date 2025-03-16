Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1D5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=; b=gP1zZ7uvFcLz8eg9rU+QqFji6c
	IXJq/cJQ7oOx+GZriz0TzyB6+5It7Ff06OoBzZwPwPDudgecL4gK1Qs6KvCSd8olgQhi5LTHU4vpa
	GkbYbyo7FqKRuCsgQKz7YMAkFujZI9CbClXaXeSyAD1oscfeDpfNCUTI7SM4VMWjVk5VPtD+/iU+C
	yzmqS6KMO5Cy+/3OsLF9HxrAyOvWL8QquppBMoDHH0shc8W0qOVeu4ZIWBKQ1nt2GQNX32y3Vtsab
	N60jII6PuRI3qaksN/Gc1Kcdz+4Vrt3i4n1htiVavXMdisO59ebNgemGu0H+dTTCZ0Nej7fDE53Dx
	oHtCPozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsn9-00000000THF-3r6N;
	Sun, 16 Mar 2025 18:32:55 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttsa9-00000000S72-31ZW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Mar 2025 18:19:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aaecf50578eso664447066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Mar 2025 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742149168; x=1742753968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=;
        b=HnSGuUz6hJ9dkm2noTR8hufDshGfpLgvZ3mgC8MJCEAZmUbIJJ39xx6AKzb228zZ/X
         E9ub4RRYSU+9e7UuypvFa/iMB1R+eGxbtequEcd6/H7dgrHxwqW3g2llPdD+YEGWycxV
         LfTfGLfoznedbXNdYpgO0HD7w3DqNcdv141mWUnRaTCuWt4GJnZhwzOWPjtKQlHpeDcN
         IoZHfl4tzqj5IQ/Z279DCC82+PNiDisWGsV2KiNvjFZ1DiYCU7z6yFi8TngRcodAMDY4
         ZWFWVGG6LnNSxty0eVJNRsH2uT/LwimDSN2Hq6Kef2ijizSpYFm4sJ0YSmzeXxSR61ty
         7u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742149168; x=1742753968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=;
        b=LJ3/7nOnVB+HZvf8iIdMn8l0/hTqhurFkkyi1I6zEHamYqfLLziAzKdAsB1sDYwn5O
         Br8aJzvXIWL3LpPz7RdCF2Ma+69yeeqJue4+qOb3bsz1Mw0YwCBjGZMbHKe3aaeOyBEM
         ngwf6SMH9B8kPJWYR2XsVVPJwtD3cCRvp5B1iTHVhk+rgXu7vU7YnTNN4HHqC/OehzlN
         ObLo6Qe8VcJv9trf4TDKH5UONX/vl9d/6FSX/t0zEycBHjRU653ZN19z+h6mm/OskYNR
         TAH8FNY5w1bvOjtjm7oCBy1dm3bf1/VM/nfRy1td+iPsR2WpLJd39605QDWcO2yv0pdL
         ykfw==
X-Forwarded-Encrypted: i=1; AJvYcCV1bnL8HGuKxwh2EbC1olnB04WqNZgc5Trj4svNvjzFm1sOYrg0XScNYaKKcuU2GDWj7WV/ml9PfU7SQRhdaUW+@lists.infradead.org
X-Gm-Message-State: AOJu0YxOczeqMJldld2BO3/mlY/E5M34InMZkwN6SLC1DcCe/KN8FTJ+
	c2DQOBIH11+JKo7J/I38ikUm8QX2IjX9LFu7BMMG74+nNzcdHx0p8CgiOg==
X-Gm-Gg: ASbGncsw3zuN9ZEWcJXy0+Z+37eUVMqcbUA69iZtbgX1n2SKsDkTrPFvQuszLLgjGq8
	HyvOIdePgke4aqIFMv6XT//oCGFoaGmxrhayLLw8EcWik3AI/osm0f9N/8+nKr/pMHqEiNEWl6m
	48Raxs/Fni/sAsqvFaYDbgUYWdYV2Tb9zcqmi8SztMZLF1TXRnn8m3adWiuNpdKrOLAvqrGCh6n
	m01HSV8FwpCsVzRxvz/k8uLjTk7rcyzFdg+9x3nMgu/PuKkH6JMlr/uSTS01A2H9k6Pq+S3XdKb
	hpP1OfYcaNXvfi408u8/LXftkPLaWLSgZYenySl0rnOAC3YM2S4mu0YY8Bv/SQ1pp2+YkMlZ5LS
	q9hr0QjSWUW2Vl2aIGQ==
X-Google-Smtp-Source: AGHT+IEv1VDRXxX1pGR0UQxt+AjO6mxGqoEmUs/RgC1vV2jOgv03SzF5RsrY2ijlnCEH58tY+1xEwg==
X-Received: by 2002:a17:907:d0c:b0:ac3:45c1:34be with SMTP id a640c23a62f3a-ac345c13c3emr673566966b.9.1742149167892;
        Sun, 16 Mar 2025 11:19:27 -0700 (PDT)
Received: from hex.my.domain (83.11.178.210.ipv4.supernova.orange.pl. [83.11.178.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm537951266b.149.2025.03.16.11.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:19:26 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 16 Mar 2025 19:18:55 +0100
Subject: [PATCH v7 07/10] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250316-bcm59054-v7-7-4281126be1b8@gmail.com>
References: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
In-Reply-To: <20250316-bcm59054-v7-0-4281126be1b8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742149152; l=1115;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=By/MtmZFNRfjDngs4ERybGWRLb6s1X3+TidkVsSq1AQ=;
 b=/3MOGtkV9moDIs4AaSZwT7fVsK4xl03s0Y5kDJkIsdUz4faBuNZczOS0L4cRok9hGHOI+GH+S
 X4LtS4QORlRAtIjdZ33SCklSeNG7l9bJn1vFpknSR++9UuC2Jh0huxK
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_111929_763682_DF88F389 
X-CRM114-Status: GOOD (  12.65  )
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


