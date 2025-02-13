Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110F6C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=; b=0zo4XUWHk+5WvbGMATHwcciSob
	6N2FdE4DE34fPNjfJhL/tGzEQhF025u/z3Bea2Ww8K9WkZxkVmLQVc83UFKORGiMnSXjyaPq/wbNA
	ZJETSIUnMfSYQKQnCQepGj0BMUrNCkLflxrdESb0Ai3Gyp1MGWz2PJe4ZNsqs1xiFH2RRd60i+2Io
	VluaUbijY/SQsv6N1ztx43xaywazugPe8+Stei4pvk8q7snZQ3C2Q8X90c0BTGF5Fr7C8dy4tFTFs
	XMup0PuGX2IJdOoUnOQ+QJkRpASV222zca+KG5An4xSy6Ofmv/u4yFhdESp2ywR3j4hdnjpyXfRhV
	dxQ/efiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig40-0000000CaLu-3hKV;
	Thu, 13 Feb 2025 20:44:00 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tig1C-0000000CZNK-1gdf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:41:08 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-51faf3342b3so387964e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 12:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739479265; x=1740084065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=;
        b=jGGymHy/4wyTIIZqJ/youxSQ2C0Koj7qo4ld4BuR4JPbK+KXCVsWauQf4wmM4NnqDa
         jkITc6xpL3ffyn5fO2oAs2kNBlwNaRROOzjx4BVspupD9pSmBXubKk5Qp/9ZVq2eddrA
         bLGngSD8RDxs11tpnRA5yhkdAcX5vloCJ/x6CrLd7FmUgJfkpkOOzM0xw6r6CzRHmmUN
         RycFtJvUoSiTQg+boPZ9y6bYD9mI7RYT4QBTAnAVqdAcJOvWSc6rPMYDRo+U9LeWemOI
         OEnpThxe67MSEX5pbJEUP7b/xwIhJpA+5FY3+yxCg2SWO0x6G1oTTsUKV5YcPGdVD2Wx
         iv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739479265; x=1740084065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TS5Knb7XMjcuFKIBATQ7nHoTfU5um3mKBC4QXOJc2lY=;
        b=oL6JR+wMnPuDQqqIOFG/Em8aA9OkKexePtZCqWJZBVzI8mJtCAjPs7rGBLLBoMBOEQ
         LF4sw3ftw0ZfG2Hh5uIszQ4lbGiCGxumLiIDU8CLeXhd43NxjYnhwdMOAs8BVSYfvxiH
         KI3Z3WnQyfTjcQYnEyXU+KzjtaXtoT15cOwhg09u89W3SIqP9fL1MzYqkgsC3NgSDu+1
         82x9XnvrqPTnR18WPZnVrf4Nsn5k2xNH/CXS8tn2qHdiB6g2NTuczBXGvCnhX/7+mBfq
         4juDYFWP10KHtzkK8oPiMOTWl1WVfjbqsUHg7Yuu1C5p0QM5YB9C+H1pXizvuwaswQHj
         gA5A==
X-Forwarded-Encrypted: i=1; AJvYcCWaB9EJI/hh+YVUppLevsJgoGuX9/mLZaSkpyEJCblg2g9QukzAqI74ehV6BnVz2NOyQrCyJI/GeUwuHPTd3vz3@lists.infradead.org
X-Gm-Message-State: AOJu0YzVUq4DItnWIVTYaaAoFCJNkNCt86dttsKr64lBNAbNHeoQSehD
	VPph6RJVAbnYCLrWdpz39gfS4K2KvYMaGJvyfRunmwHlZ2uwJR70PxNwsJ5t
X-Gm-Gg: ASbGncvK3XXxQgTML7inf26lrZQQ3Ebtz5uDs2y4b4F+Xe/D5KEHk41rQrgU+TyoP9F
	iYhqqb2jKcOSwgYX0/UnEE9Y0P7Ai/g8jOJTQMiQspQ7qGROsKTJpwTlOX3iJGDiY7X+SiRiSQS
	Cf4QiAYyTq6fU6XVGNGnm+Fj4O7cJDRydWXMLhFV7Y6vFyF4g7oM5Qn0Gdmxa7xg00S/s8MO9g+
	ne3xX9IcszXCtnQlMBpclk6DfibqAbaTWxR/kvB9m+jedO/oHSfrUYHsT8kieUE6t+sgAYZXCJT
	bThKQIDL509c3WGgltzEQu3E+nRJdQLNLhSXrgRV1KSbgUlB+V4lEaSE/u2N5kXX8WNMaalx46i
	KoQ==
X-Google-Smtp-Source: AGHT+IEhvth2aVAFgZnYvs2HU668sqO6z0dn5SU9R5BGr77aqA+pRXB0bdFJZpLiuUpt/W31Sq4HaQ==
X-Received: by 2002:a05:6122:3109:b0:50d:a31c:678c with SMTP id 71dfb90a1353d-52067bf1a31mr9044764e0c.2.1739479265197;
        Thu, 13 Feb 2025 12:41:05 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa40088sm285572e0c.10.2025.02.13.12.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 12:41:04 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 1/2] spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
Date: Thu, 13 Feb 2025 20:40:43 +0000
Message-Id: <20250213204044.660-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213204044.660-1-wachiturroxd150@gmail.com>
References: <20250213204044.660-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_124106_435126_0CAB10AB 
X-CRM114-Status: UNSURE (   9.43  )
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


