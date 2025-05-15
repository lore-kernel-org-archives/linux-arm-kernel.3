Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF681C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3UDIwrt8q2IoO3p0cBHqtcQzcmLYI3JiYKPqxI7uzI=; b=ERuYJTtoKTJN7b1qLlhBY9IHL9
	uaBt9o5mRJK3ZUbVKLBnneEbK5lHWI9LJb1Vp3T/Pqcups4JAMGF5VKM2V2exNKy/6MMQj0OqOl5j
	AC2RK/AtHvzEdMbT3eWv+oK+6BWdehPEyUOIMFDqwKeHqwebRMJDQxlQZ/uwSFxNNeljl+fyftkck
	8IfraLmU74Znyy+zf9WqKeozM8Wsim8+UaZSWep55GIC+InKVXz2R7SYRc02LKZo5Nm7qvnv8ppZc
	f2qhB8BXgwFehXiJNx5eSxvgk+K0jVSK88arVbaUHFsciFke2B0pCo1iNgj8zkO+zQjKpMl42e+j/
	YzHbpnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZZy-00000000t6m-3IDN;
	Thu, 15 May 2025 14:28:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZO7-00000000qxJ-1op6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 14:16:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad24677aaf6so128006166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 07:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747318602; x=1747923402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j3UDIwrt8q2IoO3p0cBHqtcQzcmLYI3JiYKPqxI7uzI=;
        b=mxgvDcZ4QAphjI5klf7qiV35I02JEy9FmTRJ/1FCrXwVVA5KvVwxuea7c5zXz6mrAp
         f4Ef1SoKEj/nrj6v6h7EpXbp9i6d9Ftl4J8hwr01PXrjlBKhtHRNneqTpMPJ3/BnfPKL
         f+HtWbRxwAEur3zgRhey6gi9Z4YlQ6uKIT+vhnrtu2ZYr+vp612FLMXSkGPLic6/Esgf
         ptS/EGAoaIE9eNMJflcm0Vhb+OUkIyAlcOaSNlw0mNMV91YQTPNlJ1lQyhBLn0yxygEJ
         ASjdzXmgcimzRUXxW/Drii2KlNb01WRebHv81BVCO+AdSSA0jgGn2YR75KZa2+WUaFoM
         NZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747318602; x=1747923402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j3UDIwrt8q2IoO3p0cBHqtcQzcmLYI3JiYKPqxI7uzI=;
        b=Yw/mPBw9I+IKqTRBAVztgM1qArlSB3aJ+ZPShbuJ6bMGQKL4PiLFfGtx6Mcobv9nz1
         +8lPckF2wC+l+Ql7Otozj/+m41dSZff85oDyHOfAEXaZrgdEm3INZ6rOmI7oe2F7nOwf
         mRo7pHQJ/0lmIjzv6sLkjGgtHII7XnqjW4VMbVQ22goBhtbHksAnae5TZMJhc1CVDnK7
         NTlqnZxFYm9gbHMt0aaDWpwxkF8FlyUCEFe3et/Z/bLuq7Hu6xfr2hFI9uSclGmU4fMZ
         ye5tLrc9d/XTd9z9sgWl/4+MRH7D67bF/pM0PtLuk0Vc3hnQ0uSYW34PWOJcVAjBtZO8
         LTYg==
X-Forwarded-Encrypted: i=1; AJvYcCXnl2HgumfJukoDylZNq/g9uyeurKrr32Csd/Sh6buSq1aSq/Jl1YfBCOv1TqCvxIqPteI2ReDSVh+mXDGzH0S1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxitb27lMSjNaLEKdgP00FpIPk2oKtn/vNT3jJP4x0eNpCgjuB
	j36kj+gSZkAaii8VToBLKt7RWEooV2RM3xiXXGYnwx0E+JuKVcGt
X-Gm-Gg: ASbGncu0EWD7Ii/8LepVULaWQokqlFtaUSCro5O7Opp4SLoFDeMBxOm2I3tqrTVh9rO
	N6fO1iJ/cmQ21i69EKcM2X50ZKmaAUU6PqNqmXMAuRC/xkjraU8W3/5ZZLGrjILdEgFWLDGcGQX
	vDiWyWJMzGO4dz12QQzAkRPXaO0+XUQ2aflbbaWXLGclJs1JA7m4y4u+0AGOd/qP9x7IlvYnq1h
	BGDb/hLQfCB/M7f//kmYNiZnTWUXPXWdJ3uxSe0tUwbj8g8/4squgpbM7NuoV+FjQb6zI75ZScf
	hoqTyrFmo6ZDZGgUz3BCQP7Mw48rCIWMLkziohY0rgAATvE7OwQvscW4tVe+3pOJ7WTQl341pZz
	wqMK/TeI0UtEW1078EjclHCLrN7rDpPrh
X-Google-Smtp-Source: AGHT+IHDnCJ5OcM3OaKjhVLJS7uemAJqnm0OcV5tal0KrD+Vmzr2b9JmP0FGtbI1pOMCPRLeROP6rw==
X-Received: by 2002:a17:907:6a17:b0:ad2:4fb8:c0ab with SMTP id a640c23a62f3a-ad4f71e99cdmr712484066b.31.1747318601543;
        Thu, 15 May 2025 07:16:41 -0700 (PDT)
Received: from hex.my.domain (83.11.178.15.ipv4.supernova.orange.pl. [83.11.178.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8535sm1110143966b.8.2025.05.15.07.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 07:16:41 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Thu, 15 May 2025 16:16:32 +0200
Subject: [PATCH v9 5/8] regulator: bcm590xx: Use dev_err_probe for
 regulator register error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-bcm59054-v9-5-14ba0ea2ea5b@gmail.com>
References: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
In-Reply-To: <20250515-bcm59054-v9-0-14ba0ea2ea5b@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747318592; l=1173;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=7vXj2lL0ABhnybPOu3woikYgEpsr5/S9c7rX9e+zIdA=;
 b=/BTWBM2DePXxZdvfSKM2bAtC7wlRqGwG63cagASWO9dexV0q3QfMB+e6Kb5EQvvT78vUqP/hx
 ldrxBdEtf/7A6L6UcO8XQ5YI/H+5FU3v5GI0ZW+t+T94qV/WGOZcXEK
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_071643_476659_56FCEC9D 
X-CRM114-Status: GOOD (  13.08  )
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

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
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


