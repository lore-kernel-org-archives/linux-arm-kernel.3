Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C30E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 20:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeT/C/SSbJIZtC2cQMnIGXsMju3vNCxxjxClBuI7DfA=; b=qgZ4aOCZfBudNmi+AZwsKUpnEZ
	XTXDuSunQrCVLUYy2sp89pprySsvFlY9gSLbXH7KtD85ViY8pMQ+jAglOn4/Qs28F+kknrrXPY2pL
	S1ZhEn0zQXIQE0pxEt/4Edmu1ylUG3d6CC0a+3GM7FqbVPlrZn07IB4UX/BcpJFCt8SMhAAjt9KhC
	MDG5x+af1TPWNo0cEJtYiCxDBc+7rptJ+sElWpgsDMrTTo4pJdu0+eGWtO5+cVB7gMTJJD3iC1EQC
	EtSAO1xdWm7loLYNMp7XrW8mtRHmo950moWb9UCnb2xBA9WeUCOaAxAmgUm8au441ftknwERGk0nT
	EARiS9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS4l-0000000BQFQ-38fH;
	Thu, 02 Jan 2025 20:45:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRzz-0000000BPR7-46fR
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Jan 2025 20:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HeT/C/SSbJIZtC2cQMnIGXsMju3vNCxxjxClBuI7DfA=; b=YBQ4dm9/xZyryc12t6wus43C0L
	0e4ggou3AIWXQ2sVNSM6+DhsVmX5XLHYihzgKRuPg/xf1LIywDS8E6Vb24WIKyjEyDkigFM0QnZrA
	H9tH9P8ng9a0x4EcG0sUbMo5by+ki4Eb8X2X/am5kS7dv5HS0aMp73t42SEs9p0pKjKg+6Zc9beBB
	G+eDY5/DRMPeZ/DWE1VMrcScWK9/2WLSgzdB/k5YeD9XVMcLK7X0vEOfAHE7PqNsiOI42TzHDy2cX
	Zv2ad+SMKd5pcyH2IFfbcgHOsX36xt5eDb9EFBZnxyy8jxpJ54nVdtHsEQUXP82NJz2i+dT+Lo6Of
	AKmGVODw==;
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRzw-00000008FIH-2oMF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:40:54 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa69107179cso1909615066b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735850450; x=1736455250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeT/C/SSbJIZtC2cQMnIGXsMju3vNCxxjxClBuI7DfA=;
        b=foP9JujOk+uVcvAAXAgYauxLSPajWWYWsECB2dTbs4aX4rSfwxqR+ni3A186/Fw6Gf
         WDIGbJxhTCuzqJP69beZggaf++0PkJk1GmQL7zHtVSu4g3CLywpZ+J4T3jAvo09FZL2r
         Gfp9bIGxsHX/dhrNN+IMKl49xmO5L6iYuQkmvLC390afzshvMxPHb1Jj3K26vomXctGj
         YITmll9WgofZUVdmPJp8+At/UZZOVq6975qq0QI71TYecHrA4bi1q88Ags8tUESOit+H
         pZyqbyF/3VZCYIYD5COCUvIi576UAMxY2CaIFCjVfH/P9pZ+beEZwHNqH9K1ganPXPeC
         6DkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735850450; x=1736455250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeT/C/SSbJIZtC2cQMnIGXsMju3vNCxxjxClBuI7DfA=;
        b=rBh+jDoVvpHml1w952fluNIYU73J3tGvChZqo29D8JU9mpahJZwmcH2nVR0rS64aFm
         B7lfv+SwXf0G3OcM3a1QjYygOjC3SjxSUXxrwMROo7R2oP4elq+qmjHpoxUgQSgEeM7J
         yxiLolWE+CxGdbGQijrxeIsql4Wq7UE/H2RTVMHD20QNZ0vCVKXFmM566rs9d5ylM5Xy
         svmEQilJ37NFSEUehO17KclY+oluXEXK5/iNUNnXEAgM4YUnbOyultsmR18TRFfnfvQn
         2CWjz6Gj6YKmps1p73Zt5CRsPydogDnK++IHV9itqwXQU4qqA3eyQCCd/xVSGHKC7ZR7
         F/Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWzEBn/WcgCJiIep9/3yS9kUed1I5q9vawePEXvIerwf00Y2uumYWgz6ul9G1f2COjYh1mq0dqtJCZ0QLhSGZzX@lists.infradead.org
X-Gm-Message-State: AOJu0YyC3Af3oUy3dGb3XthNcpuGbsCBokq+T8njpqliFDE7A5VlpEzl
	VWuIzjA0fEPuOfoKNL7zB+TXcYPusWpX3HCTIlfbkWJR3rJsZgoP
X-Gm-Gg: ASbGncsrpbtWI9inDjr692h52GUq1z8MNh4LW35ZAVodvIu+KwCvvAuTO6NdX1nKpZg
	0KAEhT7i0atDlYFOJZvSwTbjAwsTkKi3QFum+8+hEfPExU8c2smI6EoYsONZe3RXfvZ6Mpx1L4G
	0qTjCOCUgqhzeMpqVdf/Q8A5Pwc3E3uvrCBELRiK8oKiYRmGzRrFfSwTjEzOnJJ39OWOmumCk+U
	hxHAbAK5Pp+3RExKzgL+IVPP1FB4GPKg1r2BuTBfl/MGiDwvSNl7Z+KUMJwWUTpADVUAuxOakA4
	YhxEHRXW32Y=
X-Google-Smtp-Source: AGHT+IE16m/qv6YyZuy2UxiPuwTI+1RflvGC9DGeTDQtRWhwSzHOwjXiBbrxlDMRXRN3Nn/1oFYnGQ==
X-Received: by 2002:a17:907:3607:b0:aa6:88f5:5fef with SMTP id a640c23a62f3a-aac2c9948d6mr4725876966b.32.1735850449504;
        Thu, 02 Jan 2025 12:40:49 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1814251866b.98.2025.01.02.12.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:40:49 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for exynos8895
Date: Thu,  2 Jan 2025 22:40:13 +0200
Message-ID: <20250102204015.222653-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_204053_113235_794AFEB4 
X-CRM114-Status: UNSURE (   9.84  )
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

Exynos8895 has four different SYSREG controllers, add dedicated
compatibles for them to the documentation. They also require clocks.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 3ca220582..a75aef240 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -21,6 +21,10 @@ properties:
               - samsung,exynos3-sysreg
               - samsung,exynos4-sysreg
               - samsung,exynos5-sysreg
+              - samsung,exynos8895-fsys0-sysreg
+              - samsung,exynos8895-fsys1-sysreg
+              - samsung,exynos8895-peric0-sysreg
+              - samsung,exynos8895-peric1-sysreg
               - samsung,exynosautov920-peric0-sysreg
               - samsung,exynosautov920-peric1-sysreg
               - tesla,fsd-cam-sysreg
@@ -79,6 +83,10 @@ allOf:
               - samsung,exynos850-cmgp-sysreg
               - samsung,exynos850-peri-sysreg
               - samsung,exynos850-sysreg
+              - samsung,exynos8895-fsys0-sysreg
+              - samsung,exynos8895-fsys1-sysreg
+              - samsung,exynos8895-peric0-sysreg
+              - samsung,exynos8895-peric1-sysreg
     then:
       required:
         - clocks
-- 
2.43.0


