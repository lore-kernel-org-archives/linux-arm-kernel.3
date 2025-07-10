Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E95C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITUbPKjz6nt7F9zre32Uex49fG0CgP037IfGy1Dq7d8=; b=YywcbXe3j/lZEBkPqOBYHbWZ43
	wKu0kALJrFZYwu+Y0qOW7vykJ3CJRBOiid0VFprhbaUReGvjtj31UyLZyc35SmvU4ykLrtVK0TTTM
	1gBEFObHEfrauo1/a6YG7pVYKL9VMFWc799hCOCOMux08H5yBfM225XsmM92rnx7vBDNjs70Bvkw4
	j0xzOrzuXCuMDeN2za+hGXvTWQHby16UB5oGN4YuXfjwFxJIIKJnEeifgGlkU7LzF6OY66h2eu49K
	tLe6GcdbrgGTWW5zDk59xk9LDtJamn1AfcjdycBcUu1gpaIA0h3PPINClUcDg3sAUpMEOkfyVmfyt
	fj9NupTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZn1N-0000000BElK-08Ml;
	Thu, 10 Jul 2025 08:52:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlo6-0000000B1ou-2b7G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:35:03 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a52878d37aso97707f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752132901; x=1752737701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ITUbPKjz6nt7F9zre32Uex49fG0CgP037IfGy1Dq7d8=;
        b=dJ4ZvOpf5t83RzXbp6BjlAIWiZnTHZG7irC2j0+/ACTXtq67DyyeEC7MhlcriL7kUy
         kgeWLy6DU6JqycD06eNPZTRJ9qelBZIDhN7vwjvM3ayKfxMRiS9ICLJyEyHbVLIiRgUT
         EDVJt4hXpHRNkQtKL0fpV0oB23y5X3GZgLx9TIA9g/Gm5qLVFEa8ga7FzOFVzeYsABcq
         X5ygCaP36OF2fCNaB01xVgXN1Vn2oaG3asMVE5oRkgkLPQhaX745qCkc2qyQNh4P07HM
         OqxTH9eKaDJfjkFdvvw7ZrWDhqUNHhbGQlzwmY39qnU87PXcDfdAOccfRUeZb+FlocQI
         XqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752132901; x=1752737701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ITUbPKjz6nt7F9zre32Uex49fG0CgP037IfGy1Dq7d8=;
        b=fE8e88HZwGl4YxUlM4Dbd5qgfMHZk7+do7+wxHgNFMEnSPf1gvkQ76u92rkbhr1s3j
         wkJRO9Tkwx8EobC0MitxdF43ah2Ux+LJl13r4F/0TpIT0Ygz3Uevpxdrhto/hw2qNpvP
         rZcqCDMEAq+EoHDaI1fvKaBN06DpOeDUYc1hpqc2ree0SSwSF6ehYtt5xb9YjJF9d7l9
         p+zJiqt8+kSKipnyCUtq4zPOh97SoZKZs6KPyr4WtsCrYEQ1srQiqypRp03rqpaGlKGT
         TlJbUvA2szF6Hi1rL4P1ynjpIdc7dmjS2UIyPUty7kgssPrR26x7fctq3jlGcHtj9vVp
         NJVA==
X-Forwarded-Encrypted: i=1; AJvYcCXYRZODxkZaZXN471kdmdPgvumu7WbpmlBnBb3VIwe/wGtAzpuCgVpCQmw6o2zYqaAOlUXPcAcLiCRx3QkWwmrE@lists.infradead.org
X-Gm-Message-State: AOJu0YyegwJC1RKvRlbiemJPnfdN/UPwWZSG13wxuoKmAu2X83dyxyzn
	UtJRUiiWKQuY6Dxs4/3+QCYJPlqlrjFHqHySSKR9/zzz/a6oXF7wDhPHTvZI6vETUVw=
X-Gm-Gg: ASbGncts5zS0gNbpMYYx6y6c2vCpln6/WUoLM+YEK/8wsWlxYjr5Auxqb1VGtn2S9os
	N8/pOFFqR0iEULreBNXL8PfaZEiGdy+/IC75t+9wX+1Vofl1QVNPH+IOqhMvTvb2xQ+LfyJUZCQ
	0Q1c/CxsSc8ROsBgQrXsomYocx/znAjocHpq7oeHNjSsBvU8YBSrE+2/Nbb7pezzMfmyvNCTqhF
	uDeYV5zFLI1NSPsdq3CqRVUJU9mZiu90moPGkbEMiQNZbaOL0xTjfdkwEygueNAeEtpM7FzZ1Cb
	aBWoTN2SP6n6BG1kZeGP5FbELDe5B+Oxvz9xhFJV9q3Z2Jz96DfgTno9bLW+dG5k55/ahFfgGMv
	aygDGy0WMjA==
X-Google-Smtp-Source: AGHT+IHzDyfTOcdmYClAhYTQidw10ZwlS9z8D2W1xO1hV9teei6UadmtYmLqVDhpcn3elTELAFK7sQ==
X-Received: by 2002:a05:6000:2406:b0:3a5:324a:a04e with SMTP id ffacd0b85a97d-3b5e447a874mr1570352f8f.0.1752132900931;
        Thu, 10 Jul 2025 00:35:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd466154sm10826555e9.12.2025.07.10.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:35:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: samsung: MAINTAINERS: Add Tesla FSD DTS to Exynos entry
Date: Thu, 10 Jul 2025 09:34:45 +0200
Message-ID: <20250710073443.13788-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
References: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=3YlMOIgu11vBoJjUEqiVPSS+lh9NXRYYK3t5EeYjBic=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBob20XQQOTWxlqLjKHNNyaH3n8/WSBNW/mnXcu0
 xFUmc6gGwmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG9tFwAKCRDBN2bmhouD
 19h0D/45ArZflYDgoL5gbSjHj6laJbsN8NIETDO2vubnftED+Br8KEQ2SXkxq1iLWL27Mt+KdyL
 hQRPb7VIqm5S6kGi3DShOE1IHEy2unlB4P4ovWGVT2L/I2IG0e8BGre23UQKtbR2o8n7hrs/c+S
 50R5h31IjXFgYNTlaGPtCCnI59pbL3pSPdVBEbI4/81/WlU6P7Vyd0gBQpFwdMAza0m89uQMBBt
 0IAR8n09LBS95ivakTkCo9yd2+B/PuTi5WXsb5y9FWOyqYzaf+QBhxfgH4v/5uYpP31dTAUfbiD
 dtG6b9HRzGJGZ3H0QlX8kMVYulXlZCiRThwoLqNdfrxtgc0pEPicFsote7V+zSFW//E/et9jlbB
 DNpIqM3G2ba90tnxrQYjWkpYwIYQXPep15sHhxjjsi1vDidWBUwaCk6MfuqF4ag1SBygxdG3MAR
 2fPcN+cGN6lE5C0yTT8e7xq8I8zaxNNDCq7ug+dQLrkhM4R3XZDxQRNdZtsfMf3eObcYmDV42OK
 gFiq8cUDGAV/cIAAIJ6cCvd1vNRn/l6WGXE9WAsuc3ZY89FXf5Ro+Ttcz8JB1iwYHEXxN4PHdtz
 DCAAjbWhTfFUeETPzigKWVLONKNFyGXRg6obkLo4tAPNbB7A45KNgLIvoHGiknQIJ6Mbzxm7gJZ cRotHgmER+hQ2gg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_003502_655580_E6961190 
X-CRM114-Status: GOOD (  10.42  )
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

Effectively all Tesla FSD DTS patches go via Samsung Exynos SoC
maintainer, so add the pattern to make it obvious and reduce the chances
patches won't reach these maintainers.

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: André Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4073f7ac978f..a2e1d879cc01 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3205,6 +3205,7 @@ F:	arch/arm/mach-exynos*/
 F:	arch/arm/mach-s3c/
 F:	arch/arm/mach-s5p*/
 F:	arch/arm64/boot/dts/exynos/
+F:	arch/arm64/boot/dts/tesla/
 F:	drivers/*/*/*s3c24*
 F:	drivers/*/*s3c24*
 F:	drivers/*/*s3c64xx*
-- 
2.43.0


