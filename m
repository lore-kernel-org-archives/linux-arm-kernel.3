Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F30BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnz2IMViKhDM4Hj0WSKlwwRNtgDGeYFPFQd7FGQc5WM=; b=ZAnK/4t76RqAFom7kcBv0rBrrA
	fOYeBp/18qggkfCdHCenR88pze2/2nK2lOcjcBLUPNJpikARi3m748tVN/WheIH2i6YuCuGqnFk+U
	QP/H+84aTxVgrrp9T/H0xnJX8BXwJeP2UH9GMQbQfGJx+K1QTX/EHfuXl3ttW0NugWPQFtPGX9kWm
	j1RTqUmORNgLIG1jdbkKBSpmc9hhcLDdVSqyPHWE5hrMUnbCIOxAf6Tok7qiIFXfWhqx5NtbaWO2d
	r/hAVhoLzHHTSL9Wcac/CMF4ui82A0igXiivTfffrIa9QYUIW5tvsLqs9/4gnPtypqSFhTSoQZ1iO
	82VvBdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnui-00000004ju0-0NNV;
	Wed, 05 Feb 2025 22:30:32 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnpm-00000004j2x-1HdQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:25:27 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-866f01c2f2aso76332241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 14:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794325; x=1739399125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnz2IMViKhDM4Hj0WSKlwwRNtgDGeYFPFQd7FGQc5WM=;
        b=jbE5UbDtzMHKnxEYEL0pAPLAJ0wsyQm3yct4m8ovtClgXB5B8FERgu3x9jg3Vhtejm
         2yoUcEJwxACYRaeeFT2OUk6/CltIv/OUpoLHC/hcVbJTEORrghqicH0IskDML8HSni9B
         2Zhck8ihaTTVqY8WfN2jEpigoG/H22ksB+fvcMCvD1JdSeXMQo4fcR2e/GxK/lmQZVau
         9EvlM9g4TbTR5uFjslrTRj1owMqVQeVdsL7z9G5+V5mqTk/+lLtPUCm/5wMdVUW5KH/c
         rzSpvw+8ONNGn5GaDfJ2wnsswtQBOE1T2gB58YkP4XDz21j/yIs8BSFjmJXJYAVl/jmC
         QK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794325; x=1739399125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mnz2IMViKhDM4Hj0WSKlwwRNtgDGeYFPFQd7FGQc5WM=;
        b=JsOPTZV/NyJYJPGQI6vUh5H3QHG/07KvLVOWT0/7rDkhM1q/DB03lSASfMxbCM3ZL4
         q0lhuHIQNp9WgTqBV4ayx0KMtdW+AGk1j4MQOG6Gxhu5WUOoSoObiU9zihvS9kJ/CtK5
         WYT0AwMl0nKLshG/AKZsGBvAmZ3UZuaS1EW9tqN30j0HumyG5ZHeNnUproCxnbDskRRa
         RMDJ7lT2L0wvj77slwDkKofrKMQKA53Nma061ly7Z0N6a6/v0UDOJUtxiSf8EMm4BPKR
         BCQKhJZiJeLAyEvBLOHnD2YN81eqHDprIBycuXkGr/CA5kOeYL7rfyMjQa91tV75+n9z
         9fxA==
X-Forwarded-Encrypted: i=1; AJvYcCVWRTGPgPbod5g+nVtV8IrkG8FYX7X6eWLNsYAA4yuJAsV/7U1v5GVu97MK2E0JWCvnaHS9IMPzSKUWrFO37BCD@lists.infradead.org
X-Gm-Message-State: AOJu0YxWLWuNTVwo0XoZailZ7ULMXieke4RjhvH7wH2p1c7OToWhWUO0
	M4erDUbDkxMnD0dBW53c0qbCGp8BIn3ahFYM9npe78uIfxLxd7lBPT+kV8hu
X-Gm-Gg: ASbGnctuPUB8APGRqPGk5IA8ECJHehDp8tmASAmaWlR6+RvKHy1T0OIxyUtMKjhSNmI
	i7gghYsp1Uv5WwHCCV7wIa6ubSTupza/7IATd8bbLUum4/mzt06ybDQOaf8+9iLBXkTb1tR6bRf
	HQoLOURMmBL/Hy3cYqSFB8dNjUU9L6sxy+UdDEsNvQqzMnisMDiQ3M4kaP51jURmIiECnUwkuKT
	Yx68+FmSihV+QadT6G0SzlzDPj27MYS4Ritc/1NuylAWsjm9BoeU8WT00mg94/4/qbaPZOnr0dN
	YvA7c5qS/Tyq09B3HDhWCfDJiXg21Z4V97JwNtstgi6xTTK+PCiYBYiO040bQHhC7UpXOSmmFQ/
	gCw==
X-Google-Smtp-Source: AGHT+IGjopzGNcqEb/rWZdE5VUOc6SG26nGBuvHP2iF+xN8ZgN2V7SZQt93KOh1MxhdKUcdYZH1nZQ==
X-Received: by 2002:a05:6102:1492:b0:4b2:5c4b:5186 with SMTP id ada2fe7eead31-4ba47abc62fmr3535589137.23.1738794325018;
        Wed, 05 Feb 2025 14:25:25 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:24 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 3/9] dt-bindings: serial: samsung: add Exynos990 compatible
Date: Wed,  5 Feb 2025 22:22:17 +0000
Message-Id: <20250205222223.613-4-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_142526_343546_8C73717C 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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

Add samsung,exynos990-uart compatible. It falls back to
samsung,exynos8895-uart since FIFO size is defined in DT.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 070eba9f1..f38be8e95 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -28,6 +28,7 @@ properties:
           - samsung,exynos5433-uart
           - samsung,exynos850-uart
           - samsung,exynos8895-uart
+          - samsung,exynos990-uart
       - items:
           - enum:
               - samsung,exynos7-uart
@@ -42,6 +43,10 @@ properties:
               - samsung,exynosautov9-uart
               - samsung,exynosautov920-uart
           - const: samsung,exynos850-uart
+      - items:
+          - enum:
+              - samsung,exynos990-uart
+          - const: samsung,exynos8895-uart
 
   reg:
     maxItems: 1
@@ -162,6 +167,7 @@ allOf:
             enum:
               - google,gs101-uart
               - samsung,exynos8895-uart
+              - samsung,exynos990-uart
     then:
       required:
         - samsung,uart-fifosize
-- 
2.47.1


