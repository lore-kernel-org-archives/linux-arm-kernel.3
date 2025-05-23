Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A630C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jfvyOT2qQJmDemukIqtuWAp3lV9Gs8pt3uqlQs5zhio=; b=2DDbPV2pwh55sqwlt3lHG7O1Dg
	buG/QAhX79J0IiI69faN1Jd72X2xJ4LcUDIaO1e8+Vn5CTserh3zA420rSt9EWpKxGarD+hjdC9eP
	g7TSChwscVLY/Zo3QKm8hPNvKrO4sIMKm25q2l2T+v4JKgJ9bg4HdvCKl5yMGqnu2DFUF4LkzDq1M
	Tn/N1a5cXzUo+2hqcp5/KMvpdyk/cddMacyf/MTJSlzw+JW0AjyKj7jVhNG7l77BPcgOGBxZB8ky1
	Ncc6GCKumomLNACzZFzlhDM8wFoeMhev5emsAIzBH5yOMF+DcEI6PCXWjg0nyHuQxXtAkr5ONaaVj
	9fai4vlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIMix-00000003BnJ-05ZR;
	Fri, 23 May 2025 07:21:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIMgn-00000003Bba-2T6O
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 May 2025 07:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jfvyOT2qQJmDemukIqtuWAp3lV9Gs8pt3uqlQs5zhio=; b=CwaoTgqrlYy3J3GH8E5VQcB7tr
	4hl2Df2oKDQhbmiT6IHwIPuRhlIt32ipi5in61gaai1TcIberXils7JijSkNxqM0hpNHlt4oly3gu
	vYt49StTLWUTwa2iUJFFbG/0PiXrbloew+hqRhyEhk/6BF1z+HDa3eaXXBB1xTL4dWKA0O/csPT+J
	3/Auedpcvg0hEGR28mlvmiwN/kaZ/7pzy5h7xxG7d8+yBrmweZofUX+EJfBfwmWVAsFpP06yUR9Z9
	iAcA09GHJnuJ3lR8uPkUNSFH195pUk/TwpuE95oZm6Z13PcK4uaffVLSZpB5sIGQY0M+eWaLQxbP2
	VOyGX3Eg==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uIMgk-00000001ByP-30GS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 07:19:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a35c339e95so1088747f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 00:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747984768; x=1748589568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfvyOT2qQJmDemukIqtuWAp3lV9Gs8pt3uqlQs5zhio=;
        b=of4h5Gat+0l7uf+eiZTq1V8eHnUoAc+gxsQ/iAdUrO6NWmIq4pTWy+qiEckRwNamfp
         2Ab7lFJqSTmQOhkWbrBkbsiYShU56pBWyML1bcwpBr9PCwt/jxylaKfNemNIwGH1kvEA
         iPm8nq2G4AvA7tGvHV9dr/vOyyXxPuksS+rgIWVXh+9pROwiEZlWPYrj407JldwbA39U
         /4XduGf0yKQCRE6hx1HL5QeGFxXudk6l5pNjanfq3CF4hKEp6RFJ/5HOLEr9aqFe3SyF
         2CR92JPN5ptTYOOLA72d9bHZuDaJsgFLNhuGNIuH7pNunso1OCJ7486atHRL4HESoIBs
         vpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747984768; x=1748589568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfvyOT2qQJmDemukIqtuWAp3lV9Gs8pt3uqlQs5zhio=;
        b=b66qpL1C1Wh6HN9xzwDmp15yE+9DAe4OI/4Hjxvf+kriCkHtd1ZTjv2JxP7D8bQqm0
         LxDPgFQPpMxDZec5id0/HpTqyW+lz9iyjuxPFzggClAWhv2bplrIlm0Tsq2gjvpvf7QK
         2pIUkqGSnBJ4pjayN3+wb9uoYNGLZs8/LeDjEPgjDq4QBYKRL2524my2zUrCuQ/Ps7Yt
         lfebV9Y4HM/4VTTC9JWRiXoU4SrSo6+BcsFc2IxkAV83EPHLCtJ7FQseJVBQ+w87q9YM
         Dn2pHnpLJRo1mwtEqeGs38qDH622Qct6JAjUN2Dv5SzIl2geuMdD1MAx5U94rnBiSZ1L
         xDpw==
X-Forwarded-Encrypted: i=1; AJvYcCUipRqmxZR3EF+cIQzblGSToCuf+Z3Vn3e+8uoxxIPycKIRbFMXQM5zFJw/wS9n97r7TZgsWIPjmKD+Edpyo6CF@lists.infradead.org
X-Gm-Message-State: AOJu0YxbsdJR3HYYwbfNABYnG+VP+rpkKMOiIPgpWEIcaEUapWYjCm61
	CkZgn6ZLpPubzxFdWads6puB9QlOlTTLggcwhGx3WISzxWHz68g/Pl3QuH8m1Z21O4A0pXDP/FW
	QmRUT
X-Gm-Gg: ASbGnctBknmF0zr59US+4GhQtuAJXpj6ukEt5HIErtllwpCNAA8TFk6QSVdpX6226ys
	47xeyLE1L37pLfplEgTOtq2U57ucqhzDf87d5i3Shvl8FWtAJdZiPizRXdxfcRULajce7hBzXpv
	47TXqoZG5lYF9+2ucxUanVEq8ynts2Q3Krufpv5yVGdSUaP6NST9MSfZJlXUZGA0x6VGOGSFkip
	rK1LaeAU90+dogDC9jiIEYR8oA+hlVnb+S34nwUS7XXeQJz6eXwHdVQyWVlrOkw0lym6/T4MsHY
	UZmpprUvPIG5wN3bqkCpFbqdviudcQBCLom6ndcfhav9YQwOx3s1rQ2q5Bvucg==
X-Google-Smtp-Source: AGHT+IGBNOsoOK+S41pp3KUoOq+S4YrQwUjMqxnUCD7vywhBYAzJhRIuqVg+IYydO5PV7DwyagRBFA==
X-Received: by 2002:a05:6000:2384:b0:3a3:5c95:573f with SMTP id ffacd0b85a97d-3a4c2b3a3eamr454612f8f.3.1747984767899;
        Fri, 23 May 2025 00:19:27 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8899bsm25436432f8f.62.2025.05.23.00.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:19:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Xiubo Li <Li.Xiubo@freescale.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: vfxxx: Correctly use two tuples for timer address
Date: Fri, 23 May 2025 09:19:22 +0200
Message-ID: <20250523071921.43216-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=IkqU1+YOZQL5nm1ikl+F6IOi48x3OtFpXoZm9jK0g3E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoMCF5bxPJSgi5/ne/yPzZtpTvhOereS0imHenz
 /t/xfi8AzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDAheQAKCRDBN2bmhouD
 1/ZsD/9IR1yuwC98pxQq+Pv+yBs9rB2sGVNDOWYzxKChgcmNhPD2QJ81RbfSVYSVy6LniSCZ8lg
 Qwv3jyDqIiA8p4LaIt4/W0L/JvuBm1Tagbj2ah3/VyXbjZ+ai0dkez7mLbnngPo4/1CZPYBvOm5
 NG6HmTyOEaW17YbMXe8s5xDtuDCZSAYEP4kvpl0+nPWvRChjexAMbM4WquP3kwpRNHsYssLmAuL
 aKgHT3mMg4iKbQDg80/12nP7ebmxv0lJ4afrTTbd9x1i0iL2agh2yEpSK4Pk0K0MpAA2qEcYEwK
 u3Qeu9AFWLeriKZFPnc/Uz5dg7TuQ2Mju7MDSro+8IyCSx62y92hLpdcU5KrWjyhV3iNcIO1KtT
 Ue6v0t9HOZmXPV1mw6AAUYSZVdtOtUdXD4N4b5LpX3NBOKwHzb5o8+9eKNRhyjSicwiSWFlS8t2
 PoMjjP/Fpv0bdnDl0dzBUIUwpWC+DYSF6lGtWs0MhLPaSjUOQ9hUrb1AfULf9oNQMIEGK2TNO1E
 fteS5GDunzy8P6UE4r/SixFq8A+SuaGZOg2f8qm2ehv95zCP2Y3jh9haPeRKnJnPJWOliGfyK4C
 9N2VmeznJMolBRpDqo+S1+4oUOImeioh//CuEAX+A2PsLKe+Phcsik2GxkFHkS8UXB9fItfCcRY WikOMLyDVIZ/ZrQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_081930_926579_E56498BE 
X-CRM114-Status: GOOD (  12.22  )
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

Address and size-cells are 1 and the ftm timer node takes two address
spaces in "reg" property, so this should be in two <> tuples.  Change
has no functional impact, but original code is confusing/less readable.

Fixes: 07513e1330a9 ("ARM: dts: vf610: Add Freescale FlexTimer Module timer node.")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index 597f20be82f1..62e555bf6a71 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -603,7 +603,7 @@ usbmisc1: usb@400b4800 {
 
 			ftm: ftm@400b8000 {
 				compatible = "fsl,ftm-timer";
-				reg = <0x400b8000 0x1000 0x400b9000 0x1000>;
+				reg = <0x400b8000 0x1000>, <0x400b9000 0x1000>;
 				interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
 				clock-names = "ftm-evt", "ftm-src",
 					"ftm-evt-counter-en", "ftm-src-counter-en";
-- 
2.45.2


