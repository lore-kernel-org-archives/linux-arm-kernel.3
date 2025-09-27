Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B6CAC5BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 12:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q1CQFEKaI/Sy/SZOKDp8joIn6sS6FqYKFWGC9eEth2o=; b=b/gNrxebY3TQM6OPYb0K6ODFNb
	2rkUg8aFwLB3GA/I+PQZpB+LGDvxgbvYn/u+2fkFiswvZdXmPYUn3Cyq9yU7OTJ41glDG/8MQ7rQS
	4mdOC++zbzTleoEt26Jx3iuTugkxbmr/wtEHpVCFQxq9Dt2uN4sOe3RgD6TvaSHsMw2IOLoQ+uM/P
	ju5cX+PabT19+fjyUwo5eYFMZTutnneKzsZvMI2JrSNjPiLiSZO0XlFStciq5/YahqAG8ehaDWcBF
	e3mcNDiHYTlbQ2DWauJgSgrnt4voV3dJScwyIX1TDbRXuaP6dzCrPgkSsSnKgw0IhspO0yMa93Q0N
	it7RlxQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2U0E-00000009f97-1g9m;
	Sat, 27 Sep 2025 12:26:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2U0B-00000009f6J-2mzz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 12:26:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-414f48bd785so1186017f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Sep 2025 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758975969; x=1759580769; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q1CQFEKaI/Sy/SZOKDp8joIn6sS6FqYKFWGC9eEth2o=;
        b=n/Lmhc1Vg38Uv+7UkiIypBUaUtgcvjl3MiqGsU+LeHKtw/kjSUO+hqVtbIAFY4pAZ1
         yzBAhZINBMYaQCNojUHwwgpZDLqLJ4qSlvdx1LNMpyFlDATkzFgK8lCcfVn7tobSl+7a
         odjdEl3KMUdkYavtbRMv50uLdSj3kA0UFSbPIKNjv0ybtxzi1nVNQP0KsemPkbqiufi+
         IMDy4/SE39h9SD9oU52uAonMe1R81431sUtxgCRsDgImvQ4vD5/awtnCLuRBRgiYzbeP
         cHdfuVscuUHEWcauneKHepDVwXTNtVQ1k1d9CzQTAFuWG5UPYbXcnILCBRhROOqNO7R1
         Ii2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758975969; x=1759580769;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q1CQFEKaI/Sy/SZOKDp8joIn6sS6FqYKFWGC9eEth2o=;
        b=f+Lr4buqGvyXKzbZcoiNS+p9e0byWtS+xOXGAOjeK/nOBWm3Yq8zdtFxISvFp4jhhi
         XNoOFeou5jv0R3soWyGHzK3pc8etEtAEavRmrE3dOcChtn+rkOTQmOsORAGcWYRlWr4p
         yJGb2k9bRoA38K3QGrg0YaNm27EDnIhYzWdDchRUb3sR0ByajBpdunpDTi8B4lv9CJtB
         MMvsiVAK86PMORok2j8mpariwqbfFWm+cjvzwZUI+EDwhop6dn3bINmErBfMAEACQDZI
         ktk1r8txozK9uYAjh7/p7oJO4cM9BGNia6iKWKpUc/cDbZrvZ8Ab0k4fflysx8s1Yf+j
         9JbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXum6lV5tFq57SgTrtjYHwBAJL8YRAqdNl8tAsr5Go63zypNfB43pUeB4diHU+gNFuaqzmbyVPvZsF/DP2seHmo@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+J7vffYfG47MJah5AinObLsXaNr9N71aDE2+VjZoIoLUDx7JP
	GXWPsW6ywt0yK/KfG9V5mg5vjkGyJPPfjrh26ttUc7R9qe4h9b9oW2RVAnaDWSJVVUc=
X-Gm-Gg: ASbGncsbFkTFBsbVkdWZ+5u8ENv4rXqHmrhNmzgd1joETfHjzyCn7Vzhszm81tApOQn
	9rapKGOQs8QsTWiUtw7/uUoHcWJwQKkXdWICCvviuMzgJlESr0BZW6x6fx/Iw+ovWjCMZmObxZE
	mo9t93f+45+Yoxtlz3MZFG7Sih9wiJhtJsYd0W95kf7VbUsBKJ1QB/96U/2eSqnE0/zG5LVAemM
	9MwOynrWBeVMAaIWY1Y2iu1cV4bIhJRGxmpaCbcdrvW3a9TZJgAt+RRtTxwjg7tuG8YA2wrAPMm
	cA6PLI6+WS8O6CpizuPF/w0wEnUu8b/vDihdpG4wuvs4ZNYIb91o2BmiYHACikQW+Ejyp/b41lM
	/tn2IK3f+rWg4sMFdA4ExrX+JB2jsxEeJiH8kbqhGzQEai/1qaQ==
X-Google-Smtp-Source: AGHT+IHsxb/x4MSuZGgdkKW/ZTkoD1gTaQGZDhqAYNlhS+sWUJEsl7l8ii9uzN93TtclonUe8lxATA==
X-Received: by 2002:a5d:5885:0:b0:3eb:f90a:f6cd with SMTP id ffacd0b85a97d-40e49e728c9mr9989172f8f.60.1758975969377;
        Sat, 27 Sep 2025 05:26:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e2a996bf1sm154772885e9.1.2025.09.27.05.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 05:26:08 -0700 (PDT)
Date: Sat, 27 Sep 2025 15:26:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] irqchip/aspeed-scu-ic: Fix an IS_ERR() vs NULL check
Message-ID: <aNfX3RiyIfr3A0ZG@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_052611_711474_48A17111 
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

The of_iomap() function doesn't return error pointers, it returns NULL.
Fix the error checking to check for NULL pointers.

Fixes: 86cd4301c285 ("irqchip/aspeed-scu-ic: Refactor driver to support variant-based initialization")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/irqchip/irq-aspeed-scu-ic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
index 5584e0f82cce..bee59c8c4c93 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -215,8 +215,8 @@ static int aspeed_scu_ic_of_init_common(struct aspeed_scu_ic *scu_ic,
 	int irq, rc = 0;
 
 	scu_ic->base = of_iomap(node, 0);
-	if (IS_ERR(scu_ic->base)) {
-		rc = PTR_ERR(scu_ic->base);
+	if (!scu_ic->base) {
+		rc = -ENOMEM;
 		goto err;
 	}
 
-- 
2.51.0


