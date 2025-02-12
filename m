Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE1AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=; b=nEYu14I+/ytDK60bbgzH8IsXOB
	1lWTUr7O45y/u61eRE9cdB7XjYqaMu0wjeRh+AbJyOMd+VqzT64lSJvKCjEPbdKuKcCQ5l8iFUjOe
	CR/3UwFG6D3Hu94s/I44E+EW3QdqsNOa4gJiP0BmrWZ6WZlLUiBIhn24VBK/zrKqwbGET/B1xCe30
	fzGlajHQZg+ZCkcD9WxuiJewSPkbpXz7b7BQajHvwFh2LZ3r7AV7exSBWSWtZILI0jMEsQs4FMjhH
	W0Ld8dFDO90NSLMfU2bdyGXguK3L5vw906lkTihwVKRWwMHKRMk9Q6KKtVhqWrb/eC7q2ZpKWOUly
	Dg8Gu1IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIDC-00000008bna-1Tbd;
	Wed, 12 Feb 2025 19:15:54 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIAS-00000008bFO-1AhK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 19:13:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21f6a47d617so104095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 11:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739387583; x=1739992383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=;
        b=hIQi1xWv53Nh/cMkdqAS/sj/vEn1g2uDj9dOD4Q0155fkZWpZSmWZ92QS7TLBtt0HN
         VtOE2ZhwfuZacpB3pzDltj5zlHsRfmOWQ5lZJb3tNg1mvcUPiHbiFTg4mzHCpJU0TWpS
         rC/3DHGaBBVOIngE4+/zxGKIbBVhCXf4CKhkgX9geznDQy+btOwGvr1ay0jY4tdzmvu1
         QTpxfvnH/HVcdOSCqIpW+XN52AGzQHFD0nSNkjZINuV0cuzKDxYgraLhyBhwi61ZDUO9
         4lNs7iljDPGRnuQE1wM2ds/Y80PVUx/FhdLkNCCeqfdj1CT3gtnNrNcsd3+db5dBI+zv
         vLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739387583; x=1739992383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=;
        b=DTNJAUl5o7vj5KyOdtv6tT298tq7VGvhTKhETfFqIfENlgHXTJ1AO+iVps/ueF9/JA
         gvO26Gnd131Mjpy31Z2skM0C6WPV4Oobmq4pdRRPdBqfuDVirwdgaShDFGbmAjnxgbMt
         oM+lc09QnGCVYC0v5LP7LpNZ9raN7bIEqwrzb8l3UUh4XHu6zOuM3kE4B6Myf3OksnfI
         5+lb9GwOR9JZqYqaruQqpkWOyXs5C/B/6WBxp4HVSd76gBP6qlAw4/K7PV7jkg3+JqPH
         7OtpCHnvV4z/KVTN/Fv4BWtY9xGjeNAUPb6ja2XyaAqgROUsmzCY76UXUvVsojLeyjdm
         +P/g==
X-Forwarded-Encrypted: i=1; AJvYcCUD5gIGK4erejn890S9bQ7I+fobCTqocC9e4GnadoMoU1NuRb0n/F3npEhPSwYCmqHvQCyAL+bVqNVp7ZewB9C4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0rlqBwyC+kLNU27CvvrZOp/nAEm/ct33vA3fQho43SOKA67qX
	3ot2pxyFB41gYxGM5muV2NZsFRERdNqJRWlbW7PxIIt94VUKLjJG
X-Gm-Gg: ASbGncvHoGHE9JaJsPk7kxk4SdZxXJAQM1DXA8L+L9RlEqA+2Y16+jXRyf+5VQWZd61
	v0gtcGFDryPhm4JWyJ4P5EIhP/lzswtdS8AXvzViS3SZ59Jokme4HzxpdJv012OWWi00qJzC7o8
	QsPllMFpuZtcif/5qHWQ3HMiODC/iXJwU3wr0WLOLQtyGUh5AxDITfTLP9OLq5OFywLAbvUVCms
	OFDK55jyWcnH2XlA+F+QLJRNjraxhZQVs5wylTe+Mrkqn0Ih2ASjYUDFJK5X9oIgTQKCBrE3RiH
	J54zFJ8wVUVv9VCX6rqJ0zpJVpdME5wrPFm7swx1GNWh7ZPZz8r3Il/gHwHFVRT50GWpBholFpC
	LwQ==
X-Google-Smtp-Source: AGHT+IFwhx9qe0p3LuepYHTsbWN3x3smfLDE7DI8Ahudl0uVY04lMZzW6zWdad8DMjVaCWH+CLzlxA==
X-Received: by 2002:a05:6a00:1aca:b0:731:43ca:5cc4 with SMTP id d2e1a72fcca58-7322c3a21e7mr7297950b3a.11.1739387583347;
        Wed, 12 Feb 2025 11:13:03 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048ae7f79sm11536944b3a.77.2025.02.12.11.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 11:13:03 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 1/2] spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
Date: Wed, 12 Feb 2025 19:12:40 +0000
Message-Id: <20250212191241.280-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212191241.280-1-wachiturroxd150@gmail.com>
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_111304_316452_4E05C70F 
X-CRM114-Status: UNSURE (   9.61  )
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

Add "samsung,exynos990-spi" dedicated compatible for the SPI controller
on Exynos990 SoC. This ensures proper representation of the hardware
in the device tree.

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
2.48.1


