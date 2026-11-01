Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B264606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 23:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T2R3Mwa1;
	dkim=pass (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=BaBsMro8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=; b=T2R3Mwa1+a4fLrSWr7u+Irzbna
	SsyXFTe6yI0BCwtGHoLofr/DW41Gcgvsj5qGkeEFlBsZzndT1bkWD28bMq88Bft5aW6YiZnaXwVPm
	UOaw8gey5zZbYeZQNoRMS/fcTwrrd3eIFLra2r1gSyNXSapEFQSoupNpkDL7+nzjPqvkfses1xbyy
	qp8xkXB88lOcI2n0mY9SC8TlleBEG5ui8APGYJbf8LcUo7mjL3M7vW9eh30fzqSfmzsp3KSoFrBUB
	XHyVLeJd7djVVjj0/1sF69EQUO470ch67oSndWAZ+Z9ImeN1esQWA2Xk/Bq04ob28WiZWY+ODQFek
	QaA5+eXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeqh-0000000FCqr-1bp6;
	Sun, 01 Nov 2026 23:20:27 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNeqe-0000000FCq8-22yE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 23:20:25 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so13675545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 15:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1793575222; x=1794180022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
        b=BaBsMro8FBF2AZZniu0HPnuyu1/85VznIGFIDb4nXBbz5KIetXkfDupNHcTkN4C1Ps
         V8QeJ3DAI7dpFyGypiO1mbB7No9MCWjDgM65A6b8RBAU1431hGcH5h1c9uXHn5c6hGW8
         GEmyWHYlkZfQS+VQi4rraY6SvKpdKoXcyKla98mjTglgzOKnhRi7hv32bBgrhI0alGnV
         52Yg9HmChXybnYD1xranhDGRYo6mFhWxeBR3/r3/6WcTfhwSQ9Isd1T749TyAfbTDuiK
         /dr5iI36CmRLeRwrK31DcWv4pFx+d0ZuVWFFYxN6ToNzqzFYca6DsOAakQBUMpxMumz5
         LTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575222; x=1794180022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMz7QH5hxHuI4HppoMOO6E5SNWmF8pkb67kqxTZZ+hI=;
        b=YH8azVKxwZH901Xu5Y89wCnlVOhr0mM9v2hHJqYoKlOgokIkKcGaJHEpehdryIz2sr
         O28YXJ1Cof7bIQ9iJL+VPskpzLCbBADGbgC9yYdbYpmlEWyljNPCndRgqz8Fg7tL9vL+
         b/6DOHhEpabxGJJrf8l4FjvTMZAtTjLfmazFs6AiyNYpK3KCnF68brwiuXjtMwzfnUBo
         F7ib0dtP3BKjA1YoeH8S8tqlFl2G4jnO0lSmwqueo1oydMqQKC90yRz/6/Lx9h+nX8m1
         4B29/j+gEtctziwM7a7dLws1rkSqC3mGONm34mfz4Fla0gEfsKo9RQzf9C06d5M6YS3m
         AkcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxPrkeTp1Wf4YoemNZSWsmEZ1RR8nSdBNr1ISlg2EEUoF+mELEAXVCpSdOxQT1z+wVy3r+rX6rybIhM/oDD32C@lists.infradead.org
X-Gm-Message-State: AFq9FYL7gHsYQ2Loj0AIvcufVhB52QWTFl349RyCMCJTXcu4eLQ60n2I
	x5tRA7Us2DWg2bBkoes8qPbnmE9pc+khU5DYYqIMci2iYmPOQx1wU2u0iH73ag==
X-Gm-Gg: AYBFou0lfCVNnjtJ1hdVAOqD9kk+BYV03YAQhq41nj9U5Pc/a0zSUzhDSWUiX1npQtR
	4pvo+0vsNX+fgH+hVmOlKBVfZyWV63LG/ypgrC3XOZeqy6XxjqnLmpkTkso71pqnrDqFJPDycoX
	Y3+qAXEFHd+5VIBiHIJQ6WrkJHiCsyAPuY7qJG1TPcfxZX9Nz7aQ5wlmEn1SJKK5sl6+Lpy0gHJ
	7IZjGWBmEc5KzNsUsTjGxJLLxV/wiVTZblAi79druQwvBH80nBaPrE0JoenbTXjjDYAAxS3meBh
	JbuaU6tcveWf1lQyMFF/Hj4XwhI4CVMYhXqj1ApqO4B1o7tpVWR+XLuWXNHRCpXfMaaatz735cu
	nvHfgfzjwUKoUFobDGvyU3FuAFfNbeMVL6V5bXMOu6lcEw3okuZShqe+qRgmnl/ct8k7NYEifSd
	lO6kckJHTB3nA8qsWV2pmfY9gPi8P+8WVUM+yUL/WW/sLdpNjy4kKDEOpxcCLjK/TQcZ+3NAfSU
	WlK0drSqWzbYH9JFPUM1TRshcOllIosdgxeD0pM0iWBBps+R2ygvxBKI7VyVegwspj9MYTdh2mt
	UQIS4rO7DJdOQ/aGG5gJeYhtZU9d9qR5WQufrLZt3ZlliDYULlZbS+qtU/F3905GVSKLu8wERwz
	b/vec428eh0Y/GrhnCznjvMAkY27RlSPrH2nctjBbqLilYBkcnXXNAvVN
X-Received: by 2002:a05:600c:470d:b0:4a2:191f:7cb8 with SMTP id 5b1f17b1804b1-4ac1899378bmr187344695e9.17.1793575222418;
        Sun, 01 Nov 2026 15:20:22 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-b1d0-8200-f22f-74ff-fe21-0725.310.pool.telefonica.de. [2a02:3100:b1d0:8200:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm303691815e9.4.2026.11.01.15.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 15:20:21 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] arm: dts: meson8m2: add dwmac 3.70a compatible
Date: Mon,  2 Nov 2026 00:20:11 +0100
Message-ID: <20261101232011.1172410-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_152024_556647_3A368780 
X-CRM114-Status: GOOD (  12.55  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Meson8m2 DWMAC reports User ID 0x10 and Synopsys ID 0x37,
identifying it as a Synopsys DWMAC 3.70a core.

Add the "snps,dwmac-3.70a" compatible to match meson8b.dtsi.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/amlogic/meson8m2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8m2.dtsi b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
index 6725dd9fd825..cdc47ee1a233 100644
--- a/arch/arm/boot/dts/amlogic/meson8m2.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8m2.dtsi
@@ -25,7 +25,7 @@ canvas: video-lut@48 {
 };
 
 &ethmac {
-	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac";
+	compatible = "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
 	reg = <0xc9410000 0x10000
 		0xc1108140 0x8>;
 	clocks = <&clkc CLKID_ETH>,
-- 
2.56.0


