Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27461C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fudfumjX9RZBH6qmvyzpFv6ekbh13Mvx8da8aLOM2hY=; b=EF7elvrqSIrVEN8WWiJiRkC5HC
	hEfPXDw9GfowuK0Mc1vooSdCkoY5xrfujC3SLNikeOVVWyUsous23xy2bGmgfk52rGopvfYBcNuXT
	zsxiQkNNJxhisa0X7zM6BOFcCumWnml30DC0z2DuFut6yj1amsHGfPxCBM55ePDkjevJiwZFF1y6i
	Mroizvicyhda4uYnzZE6FpW6t6hnT4FYBzr0CFfuiOulRRz3/9nAsGmNS+rB2QDcb6FhFjijRHelJ
	Ji7gs1pkxiRJ4gEKsIekyCVvXx/ZQFnfQB79M486ZBFqQnOqflSosuvvTRO/3FZm3En0+PYnXYNyJ
	nyRCDu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnxN-00000004kJC-25wH;
	Wed, 05 Feb 2025 22:33:17 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnpq-00000004j3j-3cV7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:25:31 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4aff5b3845eso81210137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 14:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794330; x=1739399130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fudfumjX9RZBH6qmvyzpFv6ekbh13Mvx8da8aLOM2hY=;
        b=GPhzRmE+0URTRvVwGRb6wgl+vNFJBDPY/MLCpI+hpL+oez0iocNGzxEc7TfTwbcdr1
         BC/IsJzkTrZrBOt9Wt33jvLAzDqGDzioY+K45O/or+smc3+Q2ODWS64EoLjl24KYEL55
         K5BA2FL5Dzknw+oIIc0y8PLbAQNSkLr7tATNhAVTyK/Gk9mLLn9AOKjXrsMFKeqXmkbw
         RMH4sBeViXs1m7uRNdH45dtvtKtld6RMlJQreBFzsrfBbIcYXncXZNv+FjvcsaqPkWnI
         MOe1UPV8fyMwJR0QWDT8SM8cql/WQq3UjnfkDuYQpqdRmbNSaMMc8c0G/Qazy51f08Zj
         TfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794330; x=1739399130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fudfumjX9RZBH6qmvyzpFv6ekbh13Mvx8da8aLOM2hY=;
        b=p2q1pKTSYHeY77iPNVxDZ1dp9naJ0AW1MGdRCkr7l8dQoHPlS6Qq4g8dV9EF08+7Ga
         r95ECJnFiKlntPTLpS6jbENjYansG6/GzcsE4B4FcL+H0fB2CKaBdi+Tmk4+GbNgQwyz
         m1BrhTNcHqqru1GmlO603DzGQfZwIXeHgdF+Mh8CX0zD4rxVxKvbTngSy+igDFVugmX+
         wF/mVPJrqcVrNH9r2yo6uHFG2mck31C150R0U04ikH28yvzjUUlWcRt5mQ7zjtznVdb+
         ocNjIaQH2oaoryN97DocsvrJ5gElpagq2j6yZnDlB7vAlYbDksXXyJtusXUZMEiVbEhi
         DWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7hnHU/5NspDLgXykN4J4Qi+XF4hqALb7Of4ja+Cw4N6PZuy5M+MQCmLWU6ClT/l/MKttn+nJ+MI4ak114cqne@lists.infradead.org
X-Gm-Message-State: AOJu0YwFo+/6ypjOqWYQtD56ckLMRfiXLgQrGSgJtJv7qBcgBSW5BuBi
	Psha9QhMwrYaxnTdfq895dULSde+Wx01vcPLhPOzBwsFOKjyT113
X-Gm-Gg: ASbGncssT6Pk6BUszEERBoFbHpHN9JULPYRooOEjxN4Df9deOL0yOV4gDHoM0grhFh3
	GgwVSzlnIaNuYhLSZNThXjHWbEaI65A+FvamHRCO6yYzMnSd5jxbUmxX4oq34zA2rzddtvaj2Gh
	sM02qKSu9WX2LgIO/fpDX47g/37A6IofPMU5rZoWRyCwuSJbzY49XYVhjrxqcOeD+UeAPVx5At0
	rhqzu19w48n3EM4l3njozSb2y8AsGN79FnSa59VFZmIioOKdkAkgkdcP+OMlRTn9d2xEEEDHA0i
	07iUMgMa1Fo6Q99g8vVOjp27pAqZC72auX1L4YBbj58hrpT3uHOrVc8pRfONq6hvUh+DxxOaV4P
	lvA==
X-Google-Smtp-Source: AGHT+IEdJ0L14y+yqJvu1qivXHC8OglVARnsngubthm0PnC7P3RsJxZ/FSG6acgtAR+YQSQh8g2aNg==
X-Received: by 2002:a05:6102:3f05:b0:4b2:cc94:1879 with SMTP id ada2fe7eead31-4ba47ae894emr3528199137.22.1738794329685;
        Wed, 05 Feb 2025 14:25:29 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:29 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 5/9] spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
Date: Wed,  5 Feb 2025 22:22:19 +0000
Message-Id: <20250205222223.613-6-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_142530_898906_815DDF7F 
X-CRM114-Status: UNSURE (   9.74  )
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

According to the Exynos 990 downstream kernel,
almost all of them do not use the same 64 bytes depth.
Some SPI nodes using a depth of 256 bytes (SPI 9/8/10).
But in the end these nodes work.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
index 3c206a64d..1d3c95bd2 100644
--- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
+++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
@@ -24,6 +24,7 @@ properties:
           - samsung,exynos4210-spi
           - samsung,exynos5433-spi
           - samsung,exynos850-spi
+          - samsung,exynos990-spi
           - samsung,exynosautov9-spi
           - tesla,fsd-spi
       - items:
-- 
2.47.1


