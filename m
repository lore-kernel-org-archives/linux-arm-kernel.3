Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0D1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fZwehbr2XrJZtv4Jz0Zzz8OKa5r2/2zkv+U4vpu6Nc=; b=UN7UV9ITGzG47NKZZgh8dh1MA0
	LbvPdr5fKx5wcrZZ53DyD8pFTZ16JZ9/LVdw6WrtAACVhmB1arFqlDtRT6ioIW3QGnoddWdMngkVS
	YGS39SdyBPzzhgeCRIY6niTWhqt2F5B3E2GpBuLYK1BLURuWHX60XSLcS9xr5MJr7KmIW8NEBIyZV
	XTuaeGC0KkLRMMjjzfQv9lGLe74bCpiCuBoI/sqYY4cCtTMMeCijTZlOGCc64aGd7cSp2rn9RIjiz
	SisTAJoxoLvrHtTmel9InlMWM227bbJE/RDHiCnt7yWSyNAJ1hEB/8YiGAfGCei/T8PrujRnwrJVZ
	YgabZ+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGOp-0000000HYKh-2Qo6;
	Sat, 15 Feb 2025 11:31:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGKX-0000000HXHS-2hjx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:27:30 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4396a82daf5so13719455e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739618848; x=1740223648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+fZwehbr2XrJZtv4Jz0Zzz8OKa5r2/2zkv+U4vpu6Nc=;
        b=ne3FQq3eIxJJ2nWUZVCprcyFk52n4h1xQWA1rpn9IoC9t4k0hMf/5T1knnyyLl4mhc
         kM/Pkbci0unnPDkQsFzJta8HkyZg9py6QrqJgrN465JhSB1+2D1gQ3CYZc3QBAq56Owx
         Rzsmw4xlTcsxnMJEPymjBX12+dxDv+s5v06akPoCW4+X7y1vyR8Iy13W3HIssos3MRW7
         WgpgBCMCxGY2Xv1gAhlbYyxANjCHu+ItG1/CRRzmvQ1EkTk0BfnJl5vLAO02xRpRJBIp
         w0cK0wX1lLWUO+bKNYieNFEuoVzQ4X2Q0MvC5dTHAYVG7qn51VP1t+cqLsR0w7zx1flp
         QYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739618848; x=1740223648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fZwehbr2XrJZtv4Jz0Zzz8OKa5r2/2zkv+U4vpu6Nc=;
        b=O2SLtIciIumc31gAhMid9I8grkJSseQaYXHoBmr9ZSgwumr6rmd7Q300XULEFIZOur
         I4dbWWQgUiN/OO4/bb6IEwhgQjC2mSSa5FursNDSn15Sr7OV2fMmGxg2AfIAJkmBm42/
         RKvMeqlvViGP1vgUoNYNSdC9FmG+mrsKaBGEDox90B5Tg/Nwvuk38I2HdoV5m+oEOZ1g
         CSzQ3aNlnaxoNQ82mkcGIRsTEERTzZFAjKqNNHcnwxvy7E6eydGskRL4RwyXd045qbot
         GbcGM5QRtMkevWx80Hbc2AkJG9+663njY7H5oD2oGz8vIMenQkeUk/XaCdlKP7A4mFlA
         972Q==
X-Forwarded-Encrypted: i=1; AJvYcCWgesfDsBeWJts9FbXJ6mMmdOXgkr/xbgZ1pbLpRUxfEtS74W1DIrkkcsYatGhKtBgr9kM8Ks/6ANtvNLk7FU4z@lists.infradead.org
X-Gm-Message-State: AOJu0YyqwbmhB8eLAlsckBMl6gPF+tgYL7AutjRYSCey5o0GBcsGCR5P
	gTHt+5NZmwrtdbbzoMSifAOTZBoZGnoB3nLTAlyb8Ad69/zMONGwaSOEIw==
X-Gm-Gg: ASbGnctEB9sUys8MaBdJxp9ZqlcBIIymXVQM4TDWBYnqWbFKTByCgtuQmWHFx0VWdyV
	gK2ZZztAwKT5DDhTOu5NaPWPbwKauGpsap/sXIWcxRnY/2Fn6/GPZ690hmwyanEEBdUjrOPCzyX
	0FVwjEHDro1LdMy66j9FEMgX5xGrzs4iadFMKBVPzHOthXFKqE+ggNdVs4m777UjJPAzokFpWj/
	vLQ1oKlIewU3M28yfoaKvm1VhokRX2rwpBPz26U8wNy91jLjiLBzOcUEO2EjhkxiHifK5hV3tik
	PyzJPqujGAoFWA2TA7G5yMZlNQH5TcsD6t+agJLT3dqlRvb6rjqTGJuXYpgK++r1DFw=
X-Google-Smtp-Source: AGHT+IE3Ax7YXeQvW8F6OYKYkGqRzPswCt//GHzqdwNQdkl1VjsLn/m8bKPuGOKW8aziDaMWyO8gjw==
X-Received: by 2002:a5d:47cb:0:b0:38d:c364:d516 with SMTP id ffacd0b85a97d-38f33f50980mr2888564f8f.54.1739618848008;
        Sat, 15 Feb 2025 03:27:28 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b410dsm7018841f8f.5.2025.02.15.03.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:27:27 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] dt-bindings: soc: samsung: exynos-pmu: add exynos2200 compatible
Date: Sat, 15 Feb 2025 13:27:14 +0200
Message-ID: <20250215112716.159110-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250215112716.159110-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_032729_680869_962A7327 
X-CRM114-Status: UNSURE (   9.91  )
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

Add exynos2200-pmu compatible to the bindings documentation. Since
Samsung, as usual, reuses devices from older designs, use the
samsung,exynos7-pmu compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 8e6d051d8..26bdbc3e2 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -52,6 +52,7 @@ properties:
           - const: syscon
       - items:
           - enum:
+              - samsung,exynos2200-pmu
               - samsung,exynos7885-pmu
               - samsung,exynos8895-pmu
               - samsung,exynos9810-pmu
-- 
2.43.0


