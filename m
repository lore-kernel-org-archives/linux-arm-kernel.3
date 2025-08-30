Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E2DCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xy2PldNrENiSaVtPT3x+tCYdtLAjiL+P5W5nR+7AJsQ=; b=j1PVDJvvVyKL8cqzOe0b0//4ii
	wa/q5zliUD2F4TJLlkiDggTY2ul2FXykwjT+q90xkz0Azcq55MbaPopdA253FQpCHKRmvaoITHhVU
	UWzy1pi7aj4jGWJnF7bt1pUMVr+ynG3X1wkZCRiNmn5rRRIbiOd1lMBml+u+eLyCxIeIFjT34s2G+
	V85YnK8dSRxb4tAnGRra8xuaoCBqix4xmj+kVCzCXse6+VqtTzpsjEV5uQaiTzJpP+Lt0NyUGCDU8
	Peo9PsTL+TNY0jg+tS1oQAyBPFkuCT5PFk+qID47q0Qvs+CktrPALcpMLtMRI0kzO3x84oN7Q/RKz
	r7za3jZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJKZ-00000007m7o-2MUI;
	Sat, 30 Aug 2025 11:01:11 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIwL-00000007kY3-0t5c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:36:13 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso37741966b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756550168; x=1757154968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xy2PldNrENiSaVtPT3x+tCYdtLAjiL+P5W5nR+7AJsQ=;
        b=OaTTnKemW6Of+jMR3ioObxXpW3fpACIdc043TXkgqYDJLDIb2fdcMBP7FIAPfekCF9
         jg8t6x8C+pfR0+THjQLIuOEgoT0MrQHq40mtsnRglmFt1ASntmyUa5zJnvnCJIeAFsW1
         //VxfqR6B47SuMbJj28wN6Q8E27c2H5AU4Sbu8LTWmeqnLcFU83oN96P6G8iONTDqXV0
         tWCqwxNrE4ewxa8F/87ME6EFHYfYzXSX1ddy+MxZ/2GpoRX5Ac1Mw18T3dXQTarw7lva
         pHvPFgnAjQo3NiMeimOF1zfbXhqLYnTEHtjgVy9vrodFZBa5aY9Qgj4GPBmD5jRAGItr
         rxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756550168; x=1757154968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xy2PldNrENiSaVtPT3x+tCYdtLAjiL+P5W5nR+7AJsQ=;
        b=WMFIqtL4NpIPunygiLf9WDduXhe8rhwRLOW/57/hsM97hVJ2S2n8b9lkO7jz4qPtMb
         6NCs3GN7z/VmWSFjO5lUhCTogCA/ZVt/B3eALuUQU/fEq59/NVlQXUnmcFA5kgCQ6ZMl
         m5bitxMPOfHK49vCd3eskAAf0QCFNKppER0hJtXCYxGlU5v6Bar9JgMl/fIHvQ9+EKB1
         aqPRkT6o7rv1AgSMsTnDjtel8MV8ciZ+EJ0xHujPvVLd3ipwkxoPF1nf5qTJRG3Lpy6I
         5oqbMfJKdP5R+C2UIGw4Rs5QqIaRiM99d+ZDiFXBD1AuUURvd4CYz+GOh1dKGLpMUDly
         Ce5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWo5BZea9Kg7BmTF3PCdI2ihOFc+h2kY76AYG51GM5xo7TZiPAAvUVwraO3geOxGfEX97i83vXx1Wo51Ih2Gzo3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0BatSl54wYsaV1+9CBIWMLWTWrKYT/admYww5amvLiY5KvFv9
	sFk2V4nQxNvpw3xBLGAKHT+ihdeowSGsAxsLyY2MLHir7LOk7U9sBZ5JQZbBZuFF3SRcZn7LGIc
	JKyNn
X-Gm-Gg: ASbGncuXhYip4lezAamVkjZxYAzfrio9rlXDl/5WlR3uYXC3o3NGWWeT9kD8XNBvdFV
	kjS3i2NAaYpR2yfRj0fWGux3XqIccatLm2q8ayXqvVA/UwaHEKEBOwMIWnI/pHT6ToYPuN6Ty8/
	rOevgeW+XihHZKlM37Ar2Dp4Fc47I/TFK4/a8/W6JV84L7eiEGKrBfnZQn5ZkMk01kjV95xTXYd
	f4zio+KjrNXxfL9WmjbTAgRXJb5L6lI+cboz+nLD/QYHSmlmI75NfO0Ag993iCpB9lxgSDe1N23
	tNC2mWjwuQ4TwNWxbPz9E/X6cuNNEHS/zzmwmsI5gBj1VfWFS7OHaul+pEvoqpyQBg+lnw2xB8U
	0EGkm0wqpjziMPRRZuBVSgxWJJbZ2MGDwPg==
X-Google-Smtp-Source: AGHT+IHns48R/scKvtWP4TWucE7E7d46yoyfHop4qHeB2gkDdo7J3ardp9aE3MsDoUiXrG5oxykknA==
X-Received: by 2002:a17:907:94ca:b0:af9:6580:c34f with SMTP id a640c23a62f3a-aff0f132f63mr196770666b.9.1756550167604;
        Sat, 30 Aug 2025 03:36:07 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd9090sm393749166b.69.2025.08.30.03.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:36:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: i2c: samsung,s3c2410-i2c: Drop S3C2410
Date: Sat, 30 Aug 2025 12:36:03 +0200
Message-ID: <20250830103601.82046-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
References: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1225; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=OqkXFaVqOLu0Cm9orjJGa0kO4kQoIt5LQSmBFk9V1j8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostQS1uyd9N0GDHCqVVSX6oqHmmLX/xx4H0z2u
 /GjYzXDLzSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLUEgAKCRDBN2bmhouD
 16V/D/sExMdSumruUenHBTZ2LC2Ld6Eo687uWRhy8+EsSXGEw+Dh63Bx4DG07nh1xePobQdweO9
 pv8xLTdgMUOyZPgqm9P9Xeme2Ys6Th0tgbwLHebSTreUKfTNYkfUtP9590Ze/KKhgg41m0XOkUm
 KLZeP0Whkbckym3b3kPdGRneHwICnfX9x1p0Jwkd023pm80H6+ayu0QojNI9fjndMe02bngi+C1
 ugDXAUHrayw5+1X5jxZp5wWCwgIyV2Hm8OpZoI3P2zGKB8UFmoGe0uZ7VeR/BWkk5fx1/vF4HjO
 eOLallZ/wPrlhvb8hd7uAY3gyVQ2Br2vxDmE6CVCOoZbm6jNG+/FCLN5qWZ1TXMbmwUDC5KTQZ1
 aIfINltTdbou4e3SGKTg00OTDTVAMyRpfwgQV95O7xd4s3t8SghtJAbBRu1A1EdFtEnnEgH3U8x
 /5Ozor31W3+P7vYF9lkWSb/j3Y0VcmeDFsT6/MoH2drVnpMLPqiR42HG+ca4GfVZBlNr+eo0AbH
 idjDWTsJf1ZL5+KKsPQgd6LOSCf8GJ0Wi2Wpl9brqQ9Irhmerp7ec0YTyiVdeidrZQjPViUaWN1
 HhAlj7rAacD7aqgr+pxqQPLSdrYm1kwjXXAkqlGL6n86sww9YULj2uQXqUg4QjQKd31jyxuSINx +JucnGYbFIy5ZEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_033609_252698_C464CA2C 
X-CRM114-Status: GOOD (  10.75  )
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

Samsung S3C2410 SoC was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
index 6ba7d793504c..a2ddc6803617 100644
--- a/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/samsung,s3c2410-i2c.yaml
@@ -13,7 +13,6 @@ properties:
   compatible:
     oneOf:
       - enum:
-          - samsung,s3c2410-i2c
           - samsung,s3c2440-i2c
             # For s3c2440-like I2C used inside HDMIPHY block found on several SoCs:
           - samsung,s3c2440-hdmiphy-i2c
@@ -93,7 +92,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - samsung,s3c2410-i2c
               - samsung,s3c2440-i2c
               - samsung,s3c2440-hdmiphy-i2c
     then:
-- 
2.48.1


