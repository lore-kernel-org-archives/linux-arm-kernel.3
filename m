Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76DACA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bS3pk4A3vwWotpGEwKef8o97dm0WRz75Dj7bwTZ/WIk=; b=rI18pcTsXrF/ono7fEXgZVkeJL
	GPHRAHDvc5SH9vvhwMXdNgkeJYtxYDGn6xC73THgmRtrRtv2+qiuYbcMCpfRHzeyMIRQpGy2PsC7G
	amReg/cMP0JkNTlXlXO+hLyGnVcBM3DLTcZ/5uV6Tcj1SdoTZ5yHSJhlQUh2SU4k/lV5plw1e1jEr
	AkRi5vpaxNNuU2ZVFmMhse9JwESt515cwEwUOkiiCX835Uj//fc8KQArIRyurHZJlAguS+t6klKUo
	8rYxf0tCAMpVchCkccDK9yw3QsgrCJoMT5vnjbCaNZMrFNrm0303VosAJakUTYijwpI34a3W//wUi
	KDiK1HCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphkH-00000003wdi-3Afj;
	Sat, 23 Aug 2025 06:28:57 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upQfF-00000002RqR-2eYa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 12:14:38 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso281959a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 05:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755864876; x=1756469676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bS3pk4A3vwWotpGEwKef8o97dm0WRz75Dj7bwTZ/WIk=;
        b=kTgxTqIJsJHBJ8v9I2lKNQH7ZgZ3Ly6nqonLg95uBZmfKRND2puE9osoGSS3NKbx1p
         uv4YQzq0vYXv6Kob3exwh2fj9WmQ4GMnVnsATqIeCJLj/Ru8Gepze9oGhpjWRe1xFy9k
         FGyorSlbjlhkpqjl76e8HL8W0QWfPabmPXlK1hGNdHQ81DAy60VoaVY1EF9pShJTzy0z
         rUwl60lgk/kOtoG1+K5WLggqJxAwJN0z2PxMZAYgxa3+MIjQCWylgw56Da5F0x5L465L
         bdyVoC5ymgzIwg2OikrScDEXvU/xCNd46gAyYgcBlK5PE2bu8uEQTyKfa4Z2PG/aWSRz
         Zs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755864876; x=1756469676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bS3pk4A3vwWotpGEwKef8o97dm0WRz75Dj7bwTZ/WIk=;
        b=FPpPDv8XhrHLUs9F5VGdMGhG4NSVJt1kIldIL2JFmHH3ti2+20ABcwxS82T8whaPjD
         hjOHQk+cSigqxBYHRkdOyQ04D4gwXyeLWFMhUI4wLmRbwjh32gvwR1S6z2Bw/m2SE7Vx
         lTHWg6UpwrBhRKtG53R0T+klk1yGTXu7x7JMWSXG+xkro4AmnaWpzvW+sRDs0MIMqTq4
         j3lD2q8rJxj6LA7qCpZUGFjPplr4GbKUQYGldN3pJFWB0mXHh5HwFB6PrUo8UiGa+AXC
         uXXkS9w6t9vZ4XFVHXN2MY9Dr1+cl8gg+l37Tja4MDK7rBJMb8JA90sE5gm2XJeccDs9
         i5ow==
X-Forwarded-Encrypted: i=1; AJvYcCUfwjodFASWUZQEFi3EFRHHbTzZxz/FaAVEvr7YzLMWuyekVmtmU30FX4hoHnt+Gc05YA8eoKos05E/d4FnVQ5b@lists.infradead.org
X-Gm-Message-State: AOJu0YzE4E7tonU9fpogsG6ELLtEgIe5UjBUyLOL+6UN5EkQWUOW7XB+
	l35/o3bOKaonX0stb6HRwqD9HM58QGsKBCV0ZSHc176DUpe/RcqLaAN8mcZy99Vw3Ts=
X-Gm-Gg: ASbGnctnPXablPV4rVfNk65sz9r9Ih3KCPrZDi3qq07OBliUwBowla42oyk+xheM6wn
	XlpCam/IlXn0h29pu7rrvwAyGeiZj+RyqS+pg8eNDM0SZ30cTrDpPkJpvbN0ASw08EsfHJ0Mj5Y
	JAmtdKMXH0JflSjfFpnVfcnDhOjHrsXpIeNjXTqQ7U71z9FBgK1iuo6GI5sGPIk8hzzf02xvQPz
	ye3E0k3kgDQVSSe9i2+WXJwd10QJ3Egr6VuTQjDv6S7jOhUBkUDSTIkCRiUpS30KHphUB47IHC7
	8mCNUP+n7FDHqeDiZxO6mqOffp8DL0vWh3grj5xmZr0S760rbL1D5Zz87LGnbiDzNOK6IYmCBuB
	cWfczMOJ3gpzaZGDEaC2rIvYUhmN7uIOOlMxN3oU+Xlgz
X-Google-Smtp-Source: AGHT+IEs5KmocG/KlG2h0mSlEdpjChfOeNLb5C+4lvVluwFDeR16CG9SFzVcRYZbx4Bk+B/miczFYA==
X-Received: by 2002:a05:6402:34c3:b0:61b:cadd:d84 with SMTP id 4fb4d7f45d1cf-61c1b2193c5mr1231624a12.0.1755864875727;
        Fri, 22 Aug 2025 05:14:35 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a75778c5dsm6842065a12.31.2025.08.22.05.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 05:14:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-fsd@tesla.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: dts: exynos2200: Add default GIC address cells
Date: Fri, 22 Aug 2025 14:14:27 +0200
Message-ID: <20250822121423.228500-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
References: <20250822121423.228500-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Xg8fbeULkVAunNHSuMSzm27A8P/HmltLuUUNMaXdfUY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqF8iqytdsSKdAQp7OV0wh+MN7sQXLAODPAJWe
 RxyvnA72wKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhfIgAKCRDBN2bmhouD
 1/FrD/9T8gtPfLYVVMoSMObYA+o3SUHEGhUwlrr6NN6OsRErI+9TnP2Q60WHSUBrmH1Vch3Us/B
 egXQwdy5DAy94htJnu9b1V/jPaM6OfVsOOPCW+2hJZR0bBo3a8DRn2Wsh/KJRLhswIO9cA3EOUX
 zhz1blWRGOpRavXkXC32Q2zE+73l/OVNrKzOdAlt2t2Pzwyc4pmkptaEm4UKR3CIqAdBK8lkPAw
 5WXFs1090LyabpZhqMwaLKxg+l97LUfrico+E/8eez/UP0dIzbgPF4wz3dj/LOWohZVCR4TDHvT
 77VPH/BA/3UsW3pUVSKsgl4/TRDQG6rZHfHOzGtmxMNfJYIfc0JwhYdJqig/nyNGOQiFtNdgF5N
 YO0A7jVXw/Ut721AguDqg3J4/7kZEprvgjXIna38iX6WCi82RupWRtIFu/IdrFGcfmPv4iCICDr
 ew0O3vZr3wdD311zj77Os6N+Gm5hHnr52YyKqm1QNo2uny5P4oq5QPRo0GYt1T2K3cweGPn+8Tx
 6mHu6xRaGKidjX98H5ACEwF11d4vZvRZQhaDPDJtG5R/YRheG1N7XNTZ8RVH8vss71G+TFpxr3D
 Nhedh15zAS1ym05PrHCcBiXqDhMyBXDF81XmMRaMomjHbmUyK3r5Sq6xPOKqBwL7tIkeIOqg9Mm Dl45IID/LarMebQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_051437_669624_A3E2EBB3 
X-CRM114-Status: GOOD (  10.14  )
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

Add missing address-cells 0 to GIC interrupt node.  Value '0' is correct
because GIC interrupt controller does not have children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 6b5ac02d010f..b1fe315b40fd 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -273,6 +273,7 @@ gic: interrupt-controller@10200000 {
 			reg = <0x0 0x10200000 0x0 0x10000>,     /* GICD */
 			      <0x0 0x10240000 0x0 0x200000>;    /* GICR * 8 */
 
+			#address-cells = <0>;
 			#interrupt-cells = <4>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
-- 
2.48.1


