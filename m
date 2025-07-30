Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5132C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6f0FwhvW4mq7M1CCFYzcRZRTS9S4BaVix+fIhnxA7VE=; b=RIXpR5JeMTkhHeGRKco8pNBK5j
	tHN8MlU5Ew1oADxmcNvmDTn8z/j/ooBmF10WCZHwVLFEbAXkDk1Nv0ZV5fexz2lKLsjopvsIUxw5t
	IJMw9jkYatv1WgdGX67ch7n4Qc70YAW5dqTuRqRR3+G7+8IQ/h+5ultQVEDzSgX233615OgkveYnu
	NqwKUEr60OLOhb3yPSIiOp74eLdKfar1pDeHRnXCOHD6urzX2GrdUikO4vm9tODsorfYVTKJmcthL
	SYFJrG/DIdJRx3ZuqtTP50FXfFJeVZZItdRYVKQdcNz7MkLYAEKajYqM+NAgQWX51/jT0PlwCp15f
	ofNo0IXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1GP-00000000sjS-0e5P;
	Wed, 30 Jul 2025 07:30:13 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Du-00000000sYT-2VDv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:27:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45892deb25bso4902315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 00:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753860457; x=1754465257; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6f0FwhvW4mq7M1CCFYzcRZRTS9S4BaVix+fIhnxA7VE=;
        b=McbwBnD36y7HO7aBy0+L2OLrb4pDzrg9eqe1KvK7ppCJCf9PvcKGrXqmZoIgEGU+HL
         zPcfXnBsdUZe0Ds/n8Xr7PNdMSv53rl1kjPNUl8HuSTd371SmabmfrMrUHNkNKSmSyaK
         1ILcl/IWiiJAjo4y/H9Gr603PRhHb7GIpcxmCQRSbmQWz4vFHUO5r+Kv/TI6KDsRudAe
         bN4qTsQmzIbaBBzVy5RY8/e9p7J3IgfgFU+bDdUjSDQNyT6JC0GMjrk0cxgqH73pet6t
         vqLamtTZwM/cVem1qj2YqcZJm06zyUlHGiUuHjCwWtMJ74YiX2gf9Qm3NAkpfZnx5WWn
         gxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753860457; x=1754465257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6f0FwhvW4mq7M1CCFYzcRZRTS9S4BaVix+fIhnxA7VE=;
        b=qB/AIX+YsvY9hH+/9sqR9rqEq+4AtL1r7fGykEFySfXxuJhjcqnct9CGJvs346NKQ4
         ryB/Cb+TWGNJijz+OWWT8AWjFJPahKXwPcGjdEMiGVyUZDt8FzGHYo+sqN6fth5FOQUP
         D5JCGMGkpPBdWeRYGfOl7PQ4x2yY1VP/pfaDDgTd3ZvZeXiIDEvbYhbxUkBSIkcA3bi1
         vi6sesez39JJfXRHRkmiFO7e7kyutMilRapaUOT4IiQwyMu/naZiYtnT1tas+FlKu6yp
         ot4ZH2ok2e5JRSd1/7UKyYGbgxPD1ceHGZAMb/eqNtPITdGGbqj7yVEYWVpHvSISsvu0
         xqkg==
X-Forwarded-Encrypted: i=1; AJvYcCW0hcQfplfNqvFJ3kFQOOpO25URNSS9ZHiAijSq3+a0wjuKG+UBh6SQuV8SYn/OQZI7BWlc9itIN+NGpILDvGIz@lists.infradead.org
X-Gm-Message-State: AOJu0YzmHgJh6srISRyJ/2Wl9w7v36IzFHlbZtHe/zciLrvFkF2uQG3Q
	LKHL7eKnuxmEpQIwWn+pYrNbRa3h7sHIZBzcMoNgntZ3QY0mweLya82m
X-Gm-Gg: ASbGncv1mFuY78VxJeVYbI2mFXaIrybGZ9aIT+oY7eYgi87je+K/C8808JQW4FT8WTH
	v+JU1MtLeKG9SXJ9Un+pGMJNiCDGvbht32zNHybpwiQRAwj7TxL1DFG+TvxQPHJ9X6xwI6MdQPZ
	f/uJo/5P+2CXhmbBTDddEuMtjR3l315nq0LXXSqNWfICvxC9wmXNZ/V6Xp7vOBAYes+LPzz3e3B
	MzZOW0LCDiKKNDLdklklTxN5vsAk4345nIAjz6pTW4jjLnxvLBCfTHLcUqYLLLDPE0OcHrvrmBj
	j1OGUscjbbIGAg8bOrPRkW51RfZjDOknU6Ry4fJZr3BTewNsQMTS/7y0UBFKUOfaJjamMPeNgMx
	klo7n6v7gfSBv5MQz93VJsddu2gxqSbBPd/HXtbPBzcAg1NDegfOWZTePyeZ8o460Mi6o+h7UOg
	==
X-Google-Smtp-Source: AGHT+IGitxQ0sOEC+WgVaNX9L6/ItIfmQxZmM1ZdgBtR/19JOebjrySx8wjPj96seElfIW/TIv7EMQ==
X-Received: by 2002:a05:600c:8409:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-45892bc58d3mr17968365e9.20.1753860456652;
        Wed, 30 Jul 2025 00:27:36 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78084f79csm13259467f8f.71.2025.07.30.00.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:27:36 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: soc: samsung: usi: add samsung,exynos2200-usi compatible
Date: Wed, 30 Jul 2025 10:27:30 +0300
Message-ID: <20250730072730.1882549-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_002738_635645_61F06226 
X-CRM114-Status: GOOD (  10.04  )
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

Add samsung,exynos2200-usi dedicated compatible for representing the USI
of Samsung Exynos 2200 SoC.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

---
changes in v2:
dropped the first patch of the series
added a r-b tag from Sam Protsenko
---
 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index cb2263709..c694926e5 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -36,6 +36,7 @@ properties:
       - items:
           - enum:
               - google,gs101-usi
+              - samsung,exynos2200-usi
               - samsung,exynosautov9-usi
               - samsung,exynosautov920-usi
           - const: samsung,exynos850-usi
-- 
2.43.0


