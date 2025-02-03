Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5284CC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ent5BMlYQPM9j3M+5ahy76qYgLanS7SSLSe5SbsU8f0=; b=wtwE5Fyn0AXEplV4a5Xg7sNCht
	L79W0JysZQNKHxHE/PomvKQij4sL/wrOgYnHES9aIMvhpT26H5CQZys91LDNM6qyspl6ocy4E96mt
	SNeVvrCVQRRtc5PF2SLURywtCE6OPFgXmCLGRVAthSkVLjKwCx8/BhNI2ODPNFWrycwqxEv5OpgAn
	xVtvO1xXHtYEZCGEzzsMrBATd16ffNFW/tAQPNFThSL/jsXqRs14YZSDjnRDJFQNWk4O7JZdI/Frb
	f/rFQ6KJ11nBsIEvQsxOAhe9u2+aNN3h0qdLnDjjLZ/C9UxZ1JO25+nWeeCgJQlzYg7kBJwM9cN+o
	Ftj3o/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tesxa-0000000F1S7-267G;
	Mon, 03 Feb 2025 09:41:42 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tesr6-0000000F0ZO-2toI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 09:35:01 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436345cc17bso30408835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 01:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738575299; x=1739180099; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ent5BMlYQPM9j3M+5ahy76qYgLanS7SSLSe5SbsU8f0=;
        b=gBQWKPZkmr3y7HBZQn0GSVl/stC2aWxtfYQ6jHfMRkZJL3I9Dh8x5zy9XmTKzIwdmu
         v1ZsEEfkEDL/5Gr5tDr5G02Xy0ExHjTtjuQlw8rDWGc621jJf52BDP6VwHSHiVEgbECw
         mWuTECdC2YNx10CsC09rW/4BLCZKJ1ITsgsanzTvOPAUu8G+V0dFN3sDemJqnPhXYUDR
         AEPQniPKyhC4xgAk9XL4KSHsG0eNWfCEraQkK/d1d6A4UBJe1r9BIdN0W1lHukDyOl13
         xCyY0DBWK5s1tp9G8Hlo1lZVhX1GRQxS+HGAatxFx4rvZvzfaRTxMkf5Mg2odtyTHxeu
         Dsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738575299; x=1739180099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ent5BMlYQPM9j3M+5ahy76qYgLanS7SSLSe5SbsU8f0=;
        b=skGRrMcDkpx+n4wCKGc+uu4dhDgh0IavsxCopBstzAeExQuv0Cy3/XZyXBeodNmw6N
         oSgqfpbKS1G8i2FqqkR6Xp2w1qjN1A4sU2B2xptrvFTG/73N4Ok586ZVoFhiHHUIXCtD
         zgZglMYcZHHklcTkepiufNYmVOfcR+Vnw66upK1UIf9jjuOkR4ab1pEQuuzcOF0n4BWa
         FuCTbCPuKlVgvblOamX3AwFBZOI21ejhkQ77ocrZX4ZHXuiGgDiV3UT4sZAlJwP1vkZ6
         1BmN1S9kXnbxgIgBdxIU6tRs2gTFrNyxsyl9imoqKcA8PP96vgKx0XZztvcpxST5UnGF
         9Azw==
X-Forwarded-Encrypted: i=1; AJvYcCVJK7j4h1x/2epc3kb6X0gllhiDAyIRRhAe2EqJfVVV5tmPKf64IcT5Ht5jfImiGx/2zmFlYuNdkcJPVV7QjEA4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt4+GGKpF6a9m+IwkEvPSqRIqU9oXzYgAdE2u+RFvRC2d15oQN
	x2RQG39MMjMfQ144sHyUMgK0ehayCRiIH9DauinmMHjknZcc8FWlFGnVtNKgXww=
X-Gm-Gg: ASbGncs6eI5QiysNIWiqrLMpcGMnCKZmZg/+ly7djBhNzAtEixZtRzHH69GkO2KMGsB
	W1SUWnt8g73oRWT+NNfA/PSuWwerOZzh1G8lwxar+PRN6LnQg0TYUfd8UC7cirKWdfvGVnDtNUj
	NlNvUX4YbGX2ROm5qQhrmNuZkQClV/U1XpnZQYO9KB1pMiC0uvxhGRzD4w31W1d3RJjj+Z4DNdL
	43hMu1AJKsloAgRZDUX/PG6evhNEblnbfqcf7Gsdt1bhKjPkF8U5J9r/u6hvLk5sY6E7rmEJaCL
	/r3sSoEz7l6V
X-Google-Smtp-Source: AGHT+IH/i47rSy0zBDmlrlLi+ULkPx5emtysPonhzE5Zko+R3RefPIXy6uiptilCB0KPK0c9Zu3S0A==
X-Received: by 2002:a05:600c:4e01:b0:435:136:75f6 with SMTP id 5b1f17b1804b1-438dc34b179mr206291845e9.0.1738575299204;
        Mon, 03 Feb 2025 01:34:59 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c0ec80esm12373391f8f.10.2025.02.03.01.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 01:34:58 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 03 Feb 2025 10:34:12 +0100
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62p5-sk: Add serial alias
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-am62-serial-aliases-v6-14-v1-3-f26d4124a9f1@baylibre.com>
References: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
In-Reply-To: <20250203-topic-am62-serial-aliases-v6-14-v1-0-f26d4124a9f1@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=694; i=msp@baylibre.com;
 h=from:subject:message-id; bh=DM6U8sXm8knG/sEVdw0Vde11Blu3uduqsrLQMjwQyb0=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNIX9O4qPPS3tUzkLIdzwvus/D33e1QaDmqmq9V95ZITP
 +tzYMrJjlIWBjEOBlkxRZa7Hxa+q5O7viBi3SNHmDmsTCBDGLg4BWAib5kY/odVai7VVvn89sVJ
 o5tT54bYh+/IkKkxnXcsn/1xmsfquNkMf2W/GUjobZr+IFvog8LJs0xcW5WWxrVzMms8VH3sIbb
 tGTMA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_013500_738989_30A527F8 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Vibhore Vardhan <vibhore@ti.com>

Add alias for mcu_uart0.

Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index ad71d2f27f538d68644491bc6c1831acdd9263cb..81504ebc6a585f0c88cc4f448eeeb04e215ee27f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -19,6 +19,7 @@ / {
 
 	aliases {
 		serial0 = &wkup_uart0;
+		serial1 = &mcu_uart0;
 		serial2 = &main_uart0;
 		serial3 = &main_uart1;
 		mmc0 = &sdhci0;

-- 
2.47.2


