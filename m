Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049A3C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 01:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr1twA4iZh+FcXu79e86gzYn/j7DQvtF/WDnxVBdvpQ=; b=ScT8qOHPu2fWDc3Dg+bwSDY6Rh
	/IwJlYsEdzcGMae7Aitttnvs3M1twxuYoq8zn0OeA5k5bryKDR/gDE8iaAlfhtyYM8pIIGTntzFUk
	xAPgZ1FRas9o8ar99WYsosG9FhCMMiL9jwHIXCxe/2pI5j2DCeoRHmxxt1F9PYn7E8gqNSZiSOgZg
	HpIcD2uBaPom+3ujeKuf4s1jboLd5IGT91Zemdvw71+2RGh9nW8A+xKt4TRbDh9NzYrja2On4eijj
	eWl/sob10awj4kZXiFzw0rbGysNR8xoIVfvL4IqrXA2WqHrgxIF5CdZjYq7aHQsw+lXRGCnENx4tV
	1GvtTlPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv0q-0000000F5b6-2Djw;
	Sat, 17 Jan 2026 01:22:00 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgv0n-0000000F5Zu-1xRa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 01:21:58 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2ae38f81be1so3395204eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 17:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768612916; x=1769217716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr1twA4iZh+FcXu79e86gzYn/j7DQvtF/WDnxVBdvpQ=;
        b=PN9ZRlabA44lPtUCEf9hEJj7pDUhN8OJfFb6J3pXzn5ST1JjsmQ6SkIKpxN+FhrJnF
         EGJTMefTkTRQFrH4afWrYPJq7qBvecPjZxTYWuRYUa9j1Nku83boNMr9EzmtWHu8wGYf
         tmEPMvPykmpN1XVbtWsCp5sMK1rit2dxpVGqjbw6HlnrmFRd1/GemAKAamTjKstexCd8
         VWUUvnTf3DlHtLAQPL6csyvRIi3B/ZDBSADEA6WGEzfh6BCi6fKpjzllaNNFyXZQ92ww
         fBqEjsnEa4EH3afoCTRIpMxxWoHxT9J7B3Y2rbN6UnmYTpxURiDrhzVsYa5LifHTi0Ac
         S+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768612916; x=1769217716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rr1twA4iZh+FcXu79e86gzYn/j7DQvtF/WDnxVBdvpQ=;
        b=Ab6vwTfhAEr1t2Z5B7IYPkfcPYRPwtJxydup72A+4ZyejNH1gbwJbSyKQS0tS/8M/8
         2LecAle4ihap1Uc2VBhigWTEOArWFxn2FLaNbornc5BavRkmfqbNcoYqkmdiUqDMDLo1
         UeJyDfPQAZuWr5OsBY9WOMzJd11ljiU/P3bWqx7MPU5zE9MTCUMSjbOTuNeE1OS1ODq2
         huPzD4ec9Ue1EcBGo9pFHbnbWd2BiM2qH4YLENqJIYp4NTKD/KA/ogZ4TlePe173zSdY
         zwRfx399c69Sk1zWl5cHetwSuNOIUOrP6CJEA9gblpiQkFv8XUgq+i49UQ4ViyTHkOYM
         PnQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwfh+1YBCjwDE3exVcYBlTgKyVa+GykiczvNVwRugRdHmCiNJP64Tf/9xSPAWqvqrITdgM5m2WshhWtIOfWlOX@lists.infradead.org
X-Gm-Message-State: AOJu0YxDp+u/fJe5q5Qv29USrlZ6f5Tfpp+tcAu28U0egrIOM+RN4DWk
	3i9N7r+FxC66g17ZM62TYmv+dqSYuCjPPeGm4yA8AfnsOIMstO1HTIwFYsCjLa13Fng=
X-Gm-Gg: AY/fxX4tTNSMVEmQzItcVrzLWcKle94O1ublS1izwHto7tLBuHRYpsG+70NNb6WT1w8
	+8ZXsGWIIRb4d5QzAWqY3UriVymlgOvwvqWEzb20CeBuSK9LmKfWOgOx72iTFSk+y/Y2tn+583j
	kCrKVt9qJSlJ1/jyApsIEnwq8IZZl4rJcDEGaO75z2ES7zSubnrkcJn/YJNHJLW3EdHCKflYroc
	5Ivav3pfcRsrbLdu5XqHXkQh0+AsZjPXESle0a6qpmB3CEMvmdKxsPpwReWXhP0Gnnag5B6TUt0
	a/b+Aq3WZX1ntKAKgQo59m5OW7sPc9vGi3lsWZnjEuRdGhC0HYwXkLtXmEhMV9vlQYu0NKPOeW1
	SIcC0foWXH7RPhzGEMAdyJ9AdgOQ20Zz7VoyresDXpym8jHf2g82L2+JzweSijsZBiXfu2R+eoi
	u2QTrhxddsDzQ=
X-Received: by 2002:a05:7301:1687:b0:2ae:5b32:774 with SMTP id 5a478bee46e88-2b6b46d2a6bmr4932689eec.7.1768612916322;
        Fri, 16 Jan 2026 17:21:56 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3651f39sm4128837eec.24.2026.01.16.17.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 17:21:55 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH v2 1/3] spi: xilinx: use device property accessors.
Date: Sat, 17 Jan 2026 01:21:34 +0000
Message-ID: <20260117012136.265220-2-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117012136.265220-1-abdurrahman@nexthop.ai>
References: <20260117012136.265220-1-abdurrahman@nexthop.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_172157_500465_596F043D 
X-CRM114-Status: GOOD (  12.36  )
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

This makes the driver work on non-OF platforms.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/spi/spi-xilinx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index c86dc56f38b4..c4b70e95b695 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 		bits_per_word = pdata->bits_per_word;
 		force_irq = pdata->force_irq;
 	} else {
-		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
-					  &num_cs);
-		ret = of_property_read_u32(pdev->dev.of_node,
-					   "xlnx,num-transfer-bits",
-					   &bits_per_word);
+		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
+					 &num_cs);
+		ret = device_property_read_u32(&pdev->dev,
+					       "xlnx,num-transfer-bits",
+					       &bits_per_word);
 		if (ret)
 			bits_per_word = 8;
 	}
-- 
2.52.0


