Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C13CC98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BDZWmJgca/oRmUPYb8QTvKV4Z0J2CBYz2565yw2xf3w=; b=f0xPORwcxdvBr4VqEqQJAjxYNe
	4xxwBh2qfDdV0igh+p+UwFJvLidH6Rpwh1Lrgfq8zAlA+vOWe+6yiXIx7oR5fAKh+/3nTlM5VJCxw
	nIvp5c6cwqW6FH2ZbvMDZ2Kb2Coyjc06VrTJOG+Y7KfhLelMFjKKpHMTaugRYLRIaDlwjJHpk1qH1
	60euUNkoHX8n/MUi68jfx84LnIulBEuJIf+NgFAfB08sBRkMJeoqhYnRSpmtFSgKWjRzhwMcwvqxE
	tI41v3rtv878+DlB88/K9EE8uXJx6eDRG8fEE2EJcC0JN7y6gvG6sRF5mqXULW0ooK5j5j9bSDwYZ
	boy9nFFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kgA-0000000BIST-3fZr;
	Thu, 24 Sep 2026 14:44:06 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kg8-0000000BIS4-13FG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:44:05 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so1008052a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790261043; x=1790865843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDZWmJgca/oRmUPYb8QTvKV4Z0J2CBYz2565yw2xf3w=;
        b=jRLnhAbFu9mzbJdVv5yCnI6O4pcE9I+v4TT8OAVRPt9TIkjDwq53lawcJAmk5Es8YS
         G0lALi1+cKEghtrfl4g9nPmpgxByI/eZp9RRkv0l7aKRxEP2NsYgtnSug2HCpEIg0SEf
         ouLP8yVvhThXwZBlwxvnmXNIbGRb6vvQISbb457thI/qP27dd3xZUjLPNLk37O2Ek6uW
         K7NZy/Q8NsAHFq1DbVgDTIPPLryCh5PocpwVTPXNASY0lI+7CMGdB5uSjF3vMvI0QtnG
         boh3gTfN+VV4UucwxmnTELKjUxsWfqvi1riwUtHmqDrF0Aj+bUEl5LaPv1uY+3TgGjO4
         eXVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261043; x=1790865843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDZWmJgca/oRmUPYb8QTvKV4Z0J2CBYz2565yw2xf3w=;
        b=D8Y7JV2aQl5vbSXQLqOd06oIgeEPMex3kHXnVj85NWIdRNFImqBN7JSaBtrs7PNoVt
         s4aC++Yi1cRF07qB5n1z/pdnLlhdHUvqrflEGGxHaJ2722PEQqYKGmae4jdV1NbcXVzp
         DIO1SXCAEgjynDqha7ts/mJ4yywqQ0u6dD2650RP18lLqI2bVlun+b4TPwlByHPzvTM7
         1TOquxIsOa5WZVq2aKHaCnPhWT5zdUuq76KtDmvInMIQx2nCWFGswmYTORO7DN12d5Yk
         5fAo5APIx2ijjEZuyHg92kTdY03aeCxmLR3HC1rBy9fFQ+DjL/esd0jYLJvAwzZpsMvQ
         B1DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzREVRxt4C8K1hHovc9MH747lfQTAuwfAMiQ1TxKdhoh4evDPkU2yhhG8w5zRLNdUJGTVcN7DxdYP04su8OyuId@lists.infradead.org
X-Gm-Message-State: AFuF++mJ/2rSEElmC3R5TejYCeX8zoNEMGmc2V1PGypl3X4b742VcIMD
	/jXqLrDO3yvPf9oF8wCYfd84iiRjhYIokuh87a34Qnr+bk0HWe1Xoe0d
X-Gm-Gg: AYBFou2YaworhdGxXA74ZichHLxKiyuuTIRfhSi3xT8QaAp8jEe8NOfHK/18qFRC5HZ
	bXZ1ILFYxDvjzQc2MP6muF2wFkmtgkPj0QieZVg2ND3T4uHKTArXqupYffMBWe5aTDkRbAsuiex
	/CCTRefya4QyGUFXSFeQH9RNk6jMia/PleFJm2JY4bhvedqyDS6YHYhzWYuQPHlm7MCSzTmvzyS
	vxcU0JZHFn/ZKiZjhKBFiqGf8A8ktZh9l3WA0rB5Y3j1wYRCgkdZi1Ob2bu1T7Lt9Rt8kAdzJE/
	SX53USNIGhAb2evDWl6ZBCKJii0YlNTmv/DP2ss6QPTijaWbfVrxZKwHrsfFy2lMpoXhpuSRD4Y
	SSICRQRh3wpbUJwMlqLkeQ5Lo+osFMxwkCLOE13Mfw7QiiO9npnsQiMpC4b7XGTPTJepUAgbMxO
	q2MTrswPmkkmG0yLDWx3kKGfGaGpXHlTBjzLzRqc4YI7pabsBIubVRezdtDDvUoA==
X-Received: by 2002:a05:6a20:9149:b0:3d3:ae40:51e7 with SMTP id adf61e73a8af0-3de0e762e07mr2709521637.27.1790261043213;
        Thu, 24 Sep 2026 07:44:03 -0700 (PDT)
Received: from lgs.. ([47.82.103.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f2d0esm2982721a12.22.2026.09.24.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:44:02 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Ludovic Barre <ludovic.barre@stericsson.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Julien Delacou <julien.delacou@stericsson.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] mfd: ab8500: fix child device leaks on probe failure
Date: Thu, 24 Sep 2026 22:43:55 +0800
Message-ID: <20260924144355.1604369-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_074404_294774_2D0BA079 
X-CRM114-Status: GOOD (  12.83  )
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

ab8500_probe() registers MFD child devices before completing the
remaining device initialization. If a later MFD registration or sysfs
group creation fails, previously registered child devices are not
removed.

Use devm_mfd_add_devices() so registered MFD child devices are removed
when probe fails.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: cca69b67b3ba ("mfd: Export ab8500 chip id to sysfs")
Fixes: 9c717cf3fa16 ("mfd: ab8500-core: Add device for new RTC version for AB8540 cut2")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Use devm_mfd_add_devices() for all MFD child registrations, as
    suggested by Lee Jones.

 drivers/mfd/ab8500-core.c | 44 ++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index f0bc0b5a6f4a..55dd9ad285ae 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1194,39 +1194,41 @@ static int ab8500_probe(struct platform_device *pdev)
 		return ret;
 
 	if (is_ab9540(ab8500))
-		ret = mfd_add_devices(ab8500->dev, 0, ab9540_devs,
-				ARRAY_SIZE(ab9540_devs), NULL,
-				0, ab8500->domain);
+		ret = devm_mfd_add_devices(ab8500->dev, 0, ab9540_devs,
+					   ARRAY_SIZE(ab9540_devs), NULL,
+					   0, ab8500->domain);
 	else if (is_ab8540(ab8500)) {
-		ret = mfd_add_devices(ab8500->dev, 0, ab8540_devs,
-			      ARRAY_SIZE(ab8540_devs), NULL,
-			      0, ab8500->domain);
+		ret = devm_mfd_add_devices(ab8500->dev, 0, ab8540_devs,
+					   ARRAY_SIZE(ab8540_devs), NULL,
+					   0, ab8500->domain);
 		if (ret)
 			return ret;
 
 		if (is_ab8540_1p2_or_earlier(ab8500))
-			ret = mfd_add_devices(ab8500->dev, 0, ab8540_cut1_devs,
-			      ARRAY_SIZE(ab8540_cut1_devs), NULL,
-			      0, ab8500->domain);
+			ret = devm_mfd_add_devices(ab8500->dev, 0,
+						   ab8540_cut1_devs,
+						   ARRAY_SIZE(ab8540_cut1_devs),
+						   NULL, 0, ab8500->domain);
 		else /* ab8540 >= cut2 */
-			ret = mfd_add_devices(ab8500->dev, 0, ab8540_cut2_devs,
-			      ARRAY_SIZE(ab8540_cut2_devs), NULL,
-			      0, ab8500->domain);
+			ret = devm_mfd_add_devices(ab8500->dev, 0,
+						   ab8540_cut2_devs,
+						   ARRAY_SIZE(ab8540_cut2_devs),
+						   NULL, 0, ab8500->domain);
 	} else if (is_ab8505(ab8500))
-		ret = mfd_add_devices(ab8500->dev, 0, ab8505_devs,
-			      ARRAY_SIZE(ab8505_devs), NULL,
-			      0, ab8500->domain);
+		ret = devm_mfd_add_devices(ab8500->dev, 0, ab8505_devs,
+					   ARRAY_SIZE(ab8505_devs), NULL,
+					   0, ab8500->domain);
 	else
-		ret = mfd_add_devices(ab8500->dev, 0, ab8500_devs,
-				ARRAY_SIZE(ab8500_devs), NULL,
-				0, ab8500->domain);
+		ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_devs,
+					   ARRAY_SIZE(ab8500_devs), NULL,
+					   0, ab8500->domain);
 	if (ret)
 		return ret;
 
 	/* Add battery management devices */
-	ret = mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
-			      ARRAY_SIZE(ab8500_bm_devs), NULL,
-			      0, ab8500->domain);
+	ret = devm_mfd_add_devices(ab8500->dev, 0, ab8500_bm_devs,
+				   ARRAY_SIZE(ab8500_bm_devs), NULL,
+				   0, ab8500->domain);
 	if (ret)
 		dev_err(ab8500->dev, "error adding bm devices\n");
 
-- 
2.43.0


