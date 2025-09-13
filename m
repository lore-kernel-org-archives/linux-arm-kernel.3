Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669C9CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=252dG71R8/wsuDQzak40yRZblq74Z4LJhIzW4rwDhZ8=; b=pLUE1smlIbZSdfoEzP7y952M5f
	MyPLahDRAkRKW+AONZ4fM+M//JwPQkcqEczf7DTLF1npBsAk3xiLoxG/UcjkeuwW/Tx8185710NOg
	nWu9WtZsuZH5/9PzEB7hBFus0nKuN3xnGK02LpR/4ru3o6LkyuQNHbe331nBZWAggSCDyuHudYMiV
	nZcSlg10rgS0RGZkDEe0CTGZWT33bvPXReJTn1fS5vFeCvFQxAZ7nL0cNGCLVVnmoHEGXaTVQXGaf
	m8+PGuTbdKLV1fJYzBjIxJ0cthKHAUvXaiOfxVw8ghkR9bjwpiQEMKE2MqHFTL0jOuhIp0U29p44L
	qPI7LoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgk-0000000GJY9-3HMi;
	Sat, 13 Sep 2025 21:21:42 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXgf-0000000GJT2-3PaH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:21:38 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3dae49b1293so1653563f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798496; x=1758403296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=252dG71R8/wsuDQzak40yRZblq74Z4LJhIzW4rwDhZ8=;
        b=E4/evJdyUtyqrhxN/pVwsbQJPDCyB0OkBVH/72a2wrEy3oAg2fI0TwhF5KHQWVMGq1
         yaglYa5KMkpZ4Q0mkjdfB06XyQKhu+6duJldQ0SthBG2bNappcQ0LqtHmFlgS2DubtXm
         +ei1fGnQh6cFKDZmOVYW4U2QyRxxWN8YAh924G/nvmHfhWqNq/ob7xH6kqLa1IZn40Uj
         YkraLX7Z49PWuulfaAaIU8HZKW0XqXYo9t5nmEk3YgGoExf9J2Dbpy541Vvhu/XwtH4J
         QzA8RjncgY5u5MiuavCKad8BAcWMj3Z+mra/52jAuEK7Ub+t1JZxAu5pfmTaSOQt4TDx
         cKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798496; x=1758403296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=252dG71R8/wsuDQzak40yRZblq74Z4LJhIzW4rwDhZ8=;
        b=XikpIKR3CBgjavyCzNlvX8XpcDmFeYkTxmlE7hHB9Lc1oGV9b2BfT+IRLGKP4MW1WY
         4gV3QtMxRxj7I0cf/C4HqPOkkKiw6QKXfDclwnuzanl0mpSUqD5cXbSUPxmCtDjLIAJx
         230YOJJ4G48klAzn4I0HyF70gZo1576M5xEPob1dnu2/vuXYuPuSRy8zDnuU9koWl/sc
         1M5i4GpaADDoKvb3W+NpUtADlIL1AsS85eP9MC+2VkauL+VKpI6lAuSAFwjfFnVXWfO3
         XYAB/IlOLGnK8atIOM1/Kaf2ZEuQ6OsLybTOL3URlaHmUbWZJZkisORSOB8iFcLDjvQg
         WyQg==
X-Forwarded-Encrypted: i=1; AJvYcCUI93Scvd2A8wB758Yf4TFB5MJSa91g1EJ6/BgzhvSYWpUE/Fpybuj86zEUKYNs8aBbHFUVow9NbspHyF9qmY2/@lists.infradead.org
X-Gm-Message-State: AOJu0YxPEvDEkcYJgO8DAb6JTvRxZrivj6AqK2plLFaNK2vFmGPiAiqp
	ozPdT4Qjl7xGWHRemqRdBHlsG/gR4t9SQ7AvaN6K+IlUOCS2fmlgN2vK
X-Gm-Gg: ASbGncv5WH54m8iygECH8u6eX1xicQrw5hZ9ytlClTVt6tRsQ7z66OmFIBJmdnBUepS
	IFGxVvfs4xo2IL/6LQiCVxEaX954HEnSixMllx8tDcLDJ7oXosNuZUx3onnJbKWbCApqwYrdYf6
	nI1yMDcaTUVsBx2TvaH0PyldlhIETlYMYkzuMxR5LGX51MBq4sbkHgG7TXmv3xh6v5Zm1gQboD5
	cVKF2qsKZqtXc4oIc3bGj3+BwvD7j2c3YY8SgaCSqPh+XlXWZpRAU81HEcSyH42E56IpscR62/R
	7WhYMzwewq6OWJVToBv2uuJPUs7Yd4CBupn9nwh7U2TsW+A2YtPWanCI2ksx2h4qKj8G65M7iQX
	Qn4OLjGg8rq09rRzDMGBQ4VxKdPTs+J+UBdfys1ZIRA==
X-Google-Smtp-Source: AGHT+IHOzhOcRmPGX9ESktIGDwB7TcfB0Cd8b/2rDPSkgB1eTEkWJ4gz/AUMS7YuUta78c/x3bq5/g==
X-Received: by 2002:a05:6000:2885:b0:3d7:b12b:1312 with SMTP id ffacd0b85a97d-3e7657b0092mr4921139f8f.9.1757798495900;
        Sat, 13 Sep 2025 14:21:35 -0700 (PDT)
Received: from Radijator.localdomain ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd6absm11576842f8f.34.2025.09.13.14.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:21:35 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Date: Sat, 13 Sep 2025 23:21:08 +0200
Subject: [PATCH RESEND 6/9] arm64: dts: marvell: pxa1908: Move ramoops to
 SoC dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250913-pxa1908-dts-v1-6-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=duje@dujemihanovic.xyz; s=20240706; h=from:subject:message-id;
 bh=x0fqWkqgQtK1SSNlROzTYDeTJ7VSRsicm6OwB8pn5ns=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBlHH/hP31qVdWIe4+l05XL9nPhHs4y+LTr8vmJd3znD5
 TvMT4gkd5SyMIhxMciKKbLk/ne8xvtZZOv27GUGMHNYmUCGMHBxCsBE7LIZ/tkf897MIve97fb6
 6WWy7sv3iqW7X3gkNqnscovakQnfJqUyMhyfM997m9rR5dKyzHLXg+R0Pie83LL0h/SBernAWWm
 vGtkB
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142137_873367_B9E56F70 
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

From: Duje Mihanović <duje@dujemihanovic.xyz>

The ramoops memory region is the same for all boards based on the SoC.
Move its node to the appropriate dtsi.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 .../dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts     | 12 ------------
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi               | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
index c28c2eadc42cc538fc5491ecdfcfbe0191004794..dc58b19ef5d11c69f52ea7804323fe2fb2257ca7 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908-samsung-coreprimevelte.dts
@@ -37,10 +37,6 @@ memory@0 {
 	};
 
 	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
 		framebuffer@17000000 {
 			reg = <0 0x17000000 0 0x1800000>;
 			no-map;
@@ -62,14 +58,6 @@ cm3@a000000 {
 		seclog@8000000 {
 			reg = <0 0x8000000 0 0x100000>;
 		};
-
-		ramoops@8100000 {
-			compatible = "ramoops";
-			reg = <0 0x8100000 0 0x40000>;
-			record-size = <0x8000>;
-			console-size = <0x20000>;
-			max-reason = <5>;
-		};
 	};
 
 	i2c-muic {
diff --git a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
index 61498fd75d1dcaf0d068943c1ac14d3e5a7ca9ae..deb1a9df27c2f7c946096c05a684c3f1f0f16d6c 100644
--- a/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
+++ b/arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi
@@ -58,6 +58,20 @@ psci {
 		method = "smc";
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ramoops@8100000 {
+			compatible = "ramoops";
+			reg = <0 0x8100000 0 0x40000>;
+			record-size = <0x8000>;
+			console-size = <0x20000>;
+			max-reason = <5>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,

-- 
2.51.0


