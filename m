Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37125C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 15:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5e5ctpcFMmBIn03UnhR6Z1jPX3bgJpEPc9I+cnX4xlM=; b=Bc8EL6G2jIeVPKA5m+NPuLVPPr
	4uUrCR5CV+op7DyJfSUMJjEpEF5VMyksHym76H/rxf2bD07f2LjApxN8viSn8nl8FqyF9vCsY/ZBp
	FsrXH0iNd7NFPou1Ude0Kh8/RpwKZW0nZ67tJNS73BHOQbwgwbkPNr6dRhI3QfUENimhY4MMR1Dz1
	mVrYXSPKZpiQq0pli1KVW5qhtpveiCWHwWmUifCWHyGg/35nxr76A3ao5ALVAFOCo3QuBBRjQtq+n
	Y0aI1GvUMHcTIw5UTHwChr2f+0tdm/1jUyp+LwJs7Z6kuVU5iVZsipFf3QXg7oDniT1tnlcdLd/Y7
	XYAyM8GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBbCq-00000005V6i-2YtF;
	Sun, 04 May 2025 15:24:40 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBaoT-00000005RWe-13YL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 14:59:30 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ac25520a289so603303766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 May 2025 07:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746370767; x=1746975567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e5ctpcFMmBIn03UnhR6Z1jPX3bgJpEPc9I+cnX4xlM=;
        b=M8EaaSvKZk+68/m7Qo/ysaJ/8N2J5yFcvcesaVqxGOSspNHajapkJdErXzVsdayx9E
         jZKNkZxU478D2MU9vYUxWjqe6pb7M505+V8jMV38KF5D06TSWnRtWXcrHwHYZnl6ffLF
         PTVzrYxDbA4LHdleh4iymHbGoC9fKfyLH5EaSBwzD9STuNNnNyH5W3ZU5z+hdgCi3rRP
         G38ENrxJUigWNsOEWpire4PAOLiIgCP5a+H7wvgj20eksNDRWt9/KfK+GejNXlfYbw92
         C6hESnoLJx6oK5qNnujPRDyR54hKFh8ztHG1GbQtgQJpc2wnI9rI9sQ+nhJ/F0Ps3iVX
         Flsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746370767; x=1746975567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e5ctpcFMmBIn03UnhR6Z1jPX3bgJpEPc9I+cnX4xlM=;
        b=oqe52tjAaSntTxTTYrTK4Uqg0Nke1LLGV65FWmggTdayCeaaIZsQ63yEOZJqsGuW92
         7WQrQAaXoSba4GjDG5ksIvtIk5HcoVDYLzGo98xhwkQprpcxUr3iT7GTUNDOuWw3halU
         UnNn5yhor7L7CddErF+F+xeqAmA34L9pNmNI5FWHPvHlWvjSkJiHCb818e/SH64HCb+2
         mFhzBz2vlNRfy38oIcSyLIvgpTHici4i4nUx5doVF9MRPGpZ1eehpKtd/Tn6zwKjSNpN
         qxQGHHo1wLWXQTFlHyUZY2moStexPhXCZkXRAi0qze8QT4AMAC42IxbhWR8y2B+QGxet
         coPA==
X-Forwarded-Encrypted: i=1; AJvYcCXRkNstM5dS3rCSp8RmhaLSjy5jhukMN8u6KbAd2e7TwLfPlHB5y3u9pNrP+oa4jbu7qLXl5pPmejsaiUK4kCh5@lists.infradead.org
X-Gm-Message-State: AOJu0YyaGzb9yU0KNGOwu/D6p5UyhXI4mOcNxJqkUckX41NOlNMVTkjP
	OnRx3a13rYcl0r1nwoaDPw8BTkkuwyVSPOyJySOpswOT656X2MMs
X-Gm-Gg: ASbGnctA2Gei+GTCOhahLvn3EHkpexKkdD2JyVYl1dOGBM6hzD/Pt6Aox0h7B9DvH4T
	EcQAxvyK4ySN77L/sifmrGBVGJMroDeWvhAg0OgZRVtrLKfR3SwQyoM5cxHiX9oRKrwEiSAQAb8
	KOaRXtC5egzjbtyknMc9P2w8H/Kd91BV/tcL8D8jaBhJq1KUefuJFrQ6d4B3NCZNH7osWCW9fyo
	30SknpU9+ap37QD6tzTt6jDgScOH0CzHqtE4z+SHS3pHokA4QsMUvj8cKr+XCU/03jZ4f8NYnlw
	8gs3thC5sDq7walrTf0Kvt0hRqrg4/iuTZ+Rsb3g7ZOG1IZZC49dHHMAL+yde+BLmJA3OwScnOy
	Dp+5zSX9K9Bckob9C
X-Google-Smtp-Source: AGHT+IGBnWq+blNnaBtTi5tQIOBEgh61djrHUMp0C7i0GrGrmyg+MdR+NIwVCpYw1jaW2xKME9p+Pg==
X-Received: by 2002:a17:907:8990:b0:aca:95e7:9977 with SMTP id a640c23a62f3a-ad1a4967118mr340023766b.28.1746370767409;
        Sun, 04 May 2025 07:59:27 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189508cf4sm336614666b.138.2025.05.04.07.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 07:59:26 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: arm: samsung: document g0s board binding
Date: Sun,  4 May 2025 17:59:04 +0300
Message-ID: <20250504145907.1728721-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_075929_288160_3AB7E3A1 
X-CRM114-Status: UNSURE (   9.52  )
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

Add binding for the Samsung Galaxy S22+ (SM-S906B) board, codenamed G0S,
which is based on the Samsung Exynos2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d..bb3f6a0e1 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -45,6 +45,12 @@ properties:
           - const: samsung,aries
           - const: samsung,s5pv210
 
+      - description: Exynos2200 based boards
+        items:
+          - enum:
+              - samsung,g0s                     # Samsung Galaxy S22+ (SM-S906B)
+          - const: samsung,exynos2200
+
       - description: Exynos3250 based boards
         items:
           - enum:
-- 
2.43.0


