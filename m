Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAED7EFCE4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 22:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E45rulTPCYj9cqd8INLiszMLtxCYsLMuQe08qmhBNqQ=; b=uxwTU+IajIPl9aReidjq10F+c3
	d/YX7/l56NrK6fquFl/IT3mYNkCdlMIsSh0aOF21adWKmCUn48GpCf/hIlKis18ECy9IxnTv6poAU
	UKZvOOHH2Ct0X8BmLNPeHJ3OXgZQoAgcR7cMl65kXc59qCyMU1OKx4DGtXIBMR+Gc/yUjOoKTlS1y
	HCDBy+ndLVmAAXbah7dENJPTnDOr/3OzXbGre6ifBxEStHOk6aoP7jZq3uPMG3RZBwJ1FOMV9/TK+
	EElJXj/Uonn13EtNhFqRjPsJv6MkRXNthSbNhnOZ8GckkjqYN9kQRuAcsPeHxN9C28uPgmKNX2HJo
	amQA3VOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxv6N-00000000bsn-1n1e;
	Wed, 04 Mar 2026 22:54:00 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxv6L-00000000bsQ-01ay
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 22:53:58 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-79854193a54so73628197b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 14:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772664836; x=1773269636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E45rulTPCYj9cqd8INLiszMLtxCYsLMuQe08qmhBNqQ=;
        b=GEgYfmXbkXwfcULNCA8FlGcZJZ2Xj0gLKSYSTAHOKXwCXqF74R4vfh/EFmObh4ep+X
         BLczGqgKuHTICu3iPd0vBUCyeEv7GRw8oKP+BePODaIss02sntiMYfWqiiSpu27iPZnv
         EWGD6/4P1T5DVap9Q5sKgbAGcS4OkUELueBjQNO7n3A15UG5HpEM3bC2/3JK2GtKHLsa
         0cVGBKAbWtkfI0M3LOhEr3S/SkJgY2YMpJDu4/GprD9A9n1yKwYfAF0sXhIpobIxjaMT
         bj7e0G22mKMfjBEubv1pSKdSrG39UDsDhH+yIIR/f3eBwTIS8iA3VPYXQFfVxSiuv2Xb
         BZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772664836; x=1773269636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E45rulTPCYj9cqd8INLiszMLtxCYsLMuQe08qmhBNqQ=;
        b=NS7VX3A/okex5Px1n/HqiMuepVaXg8MqIvxTCa/HGuYTtHHVw17a3woBK6LPE0zhZD
         hNAJPt3gVfhZuM9beP/y2jZlUlCuhJHPy6jeUxMiPSklbiqSmpNtK2OZEjRUupuljpG3
         n3npWFhMejnXKeVWCMvpubJZnoNXpV8W+Sz0rBa8n6iuxJBkGRNti1S+dY9xC9z7zLpf
         GbGUPHkb8drIuaNY7UG97wHCEWu9f5mcgPFrIn84Y8wI2vFW/C46qqu/InSLcVjopDN0
         x2KDuf7TdhnbfDBlY4rJdThBT0yDkoGhUYIknIY1jrH6srLBAwuPchEUuAa80oBtm0iW
         mzgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUImkCzUMK79cD+fhRDhkZB3+UYGe454naTU/crRgpc2VeVmhRSHXN0N4KtVtm71Dx+J0GdWEYMJscnq/xe7uap@lists.infradead.org
X-Gm-Message-State: AOJu0YwxxNG9EBfO88sfOSPNSIviJqU+hec5HAyqJScpLhOcD2xvbBmZ
	w09wOM0Ta9DgsUA/bLiyMLJ6Am87BjXo+V+gAHsDOgLGuSgOyMmw60Qm
X-Gm-Gg: ATEYQzzD6Lc23JIn1G3SenytBydD+It1LMIZ3wCJOpxAuU6YUiIhdGlgVAXSpNfDqQC
	fJtIGm5Cc3Oueo3Rvy1AW6/fFwcVf4javC06LwRjbYDkpfk9pAS3/caE5q7aKbjRRdeVQwreguv
	Y9JXgpAEvWTYusPQXHkqnAJVEBj2EuP54bp6W6UiwYG7aagA+VHFpQ2dn0wJzVYL1C5xS1C5kbg
	oOwSwiDLMtecYIb07gjaUaFESyuAIPvaW2g9jgsfGRMT/NuUVzX7/8uyTOdy8+OZCQZQp2YCALi
	UI9uklfoKI8j4HlvUfSAiJ4pGfSDxS9dJswd54zqmSzVReKRi/SXTZVwws2cpdletEjt6ij7lwD
	ybO1YRAb1bfQ1YYBI+XZ5KRSS/JcOT8zukrjYL7pDqI6dq+DbIpcN0LEWQZ4xlmFz3M2xLLFn09
	VO0CFkamVyJY/hjOATFSP+UOlhzoSIz9zSDxF/T33dAt/qTehSI5kEjw==
X-Received: by 2002:a05:690c:46c2:b0:798:58be:3262 with SMTP id 00721157ae682-798c6cff985mr33425647b3.62.1772664835707;
        Wed, 04 Mar 2026 14:53:55 -0800 (PST)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798c97f759asm9454697b3.38.2026.03.04.14.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:53:55 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rtc: armada38x: zalloc + calloc to single allocation
Date: Wed,  4 Mar 2026 14:53:29 -0800
Message-ID: <20260304225329.24510-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_145357_050314_38525439 
X-CRM114-Status: GOOD (  11.09  )
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

Use a flexible array member to simplify allocation.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-armada38x.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
index 713fa0d077cd..245290ae1a8d 100644
--- a/drivers/rtc/rtc-armada38x.c
+++ b/drivers/rtc/rtc-armada38x.c
@@ -72,8 +72,8 @@ struct armada38x_rtc {
 	spinlock_t	    lock;
 	int		    irq;
 	bool		    initialized;
-	struct value_to_freq *val_to_freq;
 	const struct armada38x_rtc_data *data;
+	struct value_to_freq val_to_freq[];
 };
 
 #define ALARM1	0
@@ -490,18 +490,13 @@ static __init int armada38x_rtc_probe(struct platform_device *pdev)
 {
 	struct armada38x_rtc *rtc;
 
-	rtc = devm_kzalloc(&pdev->dev, sizeof(struct armada38x_rtc),
+	rtc = devm_kzalloc(&pdev->dev, struct_size(rtc, val_to_freq, SAMPLE_NR),
 			    GFP_KERNEL);
 	if (!rtc)
 		return -ENOMEM;
 
 	rtc->data = of_device_get_match_data(&pdev->dev);
 
-	rtc->val_to_freq = devm_kcalloc(&pdev->dev, SAMPLE_NR,
-				sizeof(struct value_to_freq), GFP_KERNEL);
-	if (!rtc->val_to_freq)
-		return -ENOMEM;
-
 	spin_lock_init(&rtc->lock);
 
 	rtc->regs = devm_platform_ioremap_resource_byname(pdev, "rtc");
-- 
2.53.0


