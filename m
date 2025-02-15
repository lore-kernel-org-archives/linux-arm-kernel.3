Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF84CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=; b=bdshR4REsLbUmXMtfmW+Vcwlxj
	4JhOPY4jEtOCR1NV7hWJ5hvcs3FmSc51vUh/kQ+ULuGRgo5tVjEC+M2VIImIgYLMffgwROufojsxV
	GoEhArCQ+9j2Pz0Nq5pc1hpLssPyB/CjJfDbC5IW3K21oMaCUOO5cpgQWwMTCyrYLYkad4/MqBdGn
	3uH9dQtNHEeTcG/eIB7ln3LMlYnj63mvpdMuXfSDO50VukORU5nqPKB1lYSKEbsMQtsNhoi6vnNwW
	GkVBL1jmM8MXG382SEfW3+C0mcS6I1kN99rGxixHi23SRv3gwCon38tcZt5y+l3aP6sv1faXSVeVD
	CmKHGIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEoH-0000000HNEs-0cma;
	Sat, 15 Feb 2025 09:50:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjEeU-0000000HLdN-2Fmj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 09:39:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab7e9254bb6so418787766b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739612397; x=1740217197; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=;
        b=eCbh4HgxbrC1zkFXKIJQXcClxKWYLly8CS8kCe9lyWcZGz7q1zKakSIGJmQkrwMERH
         km0hnZyLFRAGMBdo1oTbg/MLZtaxw785D/2Ao9tGvWp+4BJqZXrQYLMu5XDCji19nZF2
         qoPbHDkPox2aZfDYwX3BfXseFcwI7QTHWI5FkQxdsL6cfcqMAShFGHysd69a3vnQ4PcB
         nXlNSVbi1R6qVPH6beCy4sq5nIr4LWHY2IVg7zE2MbmXECi51RN+hJAU3G8idqkWwBEu
         zJTcXtqiFD9bDhojEQEY4ROv6DnZ/LAL0b3MltwS91okfZoKUtm+nO6bVMih5aF+lcnH
         2rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739612397; x=1740217197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8i2lzKiQXFgJCM32Stuyrr5VV9AUaCS/hseyM/SiD4=;
        b=MbsQ3pSxBuWk/afN2XdhPTBGwy2DfVR0hk3ZegMXwBK5YZUmQAZoTiW4AC2vtExRpL
         JRSYbPNpevvFugSSG6VBic026QBIGZ/h+8o31ebXydi/eFDo66hhqpRMO94jcS/svxXp
         vRS4uvSDXv2flS1HPOgVt7Wl5fqLY2UizqClxpRPC0GHWoE+L2mazwkbVqZ0105T3iFA
         ekqHCTVprmrLIbGmooaGlRrlcw4lRKIqWO+zURzIOdUgIN2sPZ/R8HJ6BLKU1HYbJWGb
         anHjsGiCkEMTL8JnoDEo5gGYGd9dO41lV2y71BrTt4g5jdojzHBsrjYRoqNSLMH3R1RT
         VNIA==
X-Forwarded-Encrypted: i=1; AJvYcCUEHU9bwkUmy0SgetRmxQnM2bu78TbFoOdd7bgaymtSIO7GYEqeoEu2JbM7fthR5RAH27Gogxhp0eKY/YlYOROH@lists.infradead.org
X-Gm-Message-State: AOJu0Yze5inaradE1YFEAnAzlGYDmlQzyqULRvvDzoXcWUHaItNy1Esk
	C1sGo7U0toRJ3d+FrNbp36SP9JBBOkWNXRoVB2DmN/BjIrY5DUA4RXQ+Qw==
X-Gm-Gg: ASbGncuMgxTDXbjprID0bs3xlwGYoOiy1iJnmChArfWYm90aMOYc+Zw5bHDG2rGCh5P
	DnOZh0oKc5JgNOuHf0pmF6Rotu2WO8UhbHkUs92aJpwlLM1xq/ng3XSijrslMLh/XVMEpFjNKYU
	FNDdr6pxm14pg50YxILyL+DDUpksC3vPubHFmszQv5FmZanLhwhT5uL7FEYC/2Pxn+mDa3m+E3Q
	CKMt+huevcTZyVggVlFGW05owMpcNHK6uXh1noUByaJN0PV0OTuL5fXSCZEV/qE3dRci0bAHOhJ
	fG0LhCmNf1g+urbsxW40IF5k6oGUJi07UJmk4JfxkaCEw7GvrFZCP/9RiXSztg==
X-Google-Smtp-Source: AGHT+IGBNxf7QRukB9YNTcF9z5UPDHR1Qg0t+NZS7yEeq1ag8nojEeZW3mk830V/Fks54naT61DK8g==
X-Received: by 2002:a17:906:4fd5:b0:ab3:4b0c:ea44 with SMTP id a640c23a62f3a-abb7091d9e1mr203583866b.9.1739612396772;
        Sat, 15 Feb 2025 01:39:56 -0800 (PST)
Received: from hex.my.domain (83.8.115.239.ipv4.supernova.orange.pl. [83.8.115.239])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb7aecd3d5sm69698966b.148.2025.02.15.01.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 01:39:55 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 15 Feb 2025 10:39:41 +0100
Subject: [PATCH v4 6/9] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-bcm59054-v4-6-dbfb2d76a855@gmail.com>
References: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
In-Reply-To: <20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739612381; l=1115;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=By/MtmZFNRfjDngs4ERybGWRLb6s1X3+TidkVsSq1AQ=;
 b=R9XvjJGcaWdPCm6Jdi9wNLsTkzSlSOR4omPAt1XaPtxtdvO3uQoccX9JuyxahL3oA/jBwN4Rk
 NCdbNz82H/jDmOxvkm41aGcQgATe0Pgy0S1fpbbPs3Z17eLzSk27nG1
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_013958_578105_6BD2ACDC 
X-CRM114-Status: GOOD (  13.05  )
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


