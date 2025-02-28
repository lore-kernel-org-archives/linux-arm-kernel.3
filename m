Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44FFC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=; b=xScNPJhHcjoxX0SMMzaM2WyWvJ
	4n19vV7Ag4h74a224H/7uN7C4aeXmpTwzhrylkOhyoQLaauuHLvol/ut4yxZtYEISqXdOeiW+Md7r
	Ns5NdEXyCX+ln/nRWOHlZVVFND2CGrAoQAORjU6ZXCzF72EHwENG0GuE3w2DUg1hnR+RW84jMmXvS
	zppOrfAG3+1zV4veL5d0R8UDXYaZSLP5KGBV4iLwunFAtjcON/kHWxaOAgx/MjtGHJe1+tpMNz8ba
	uVetPdNQ+bWBvh8o4DjMnrpp3KsZjduJND9H2BBVXnlOuJLWCHpc+lss841JWfJStFWZ5Oz0CuxFj
	1J6Pp+Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnsGn-00000009l8d-2bZU;
	Fri, 28 Feb 2025 04:46:41 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tns3O-00000009jmC-2YCs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:32:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22356471820so24828705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717170; x=1741321970; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=;
        b=mb3q8f9gsTLx6ERJuSmMM5bVR+t+r8jFF9pptp6dp2E1Cw4UF9uUQu7UC3EgSlZ88X
         2Lx0jj8JaKrk3y0/bR1VhGq+WQslAHpxP8gg0sfOLzGTWavtt3N/7jl2IxByBOoGfXwu
         NwydCX3i8h9reGH8nIs438FUa2kyC/gWeCMXq8jQ3yBKZO3Pe/Dpa1fxc6aVn5r7wlRT
         w7Eky7GVRhUwwpyHBeS0FekYyXzHca44PK5NB7dkSIw/f4cQnBuFhcH4s/7StNVnM1wJ
         E4/iw0HfoO2W92LZDcCVE9pp5oTS7RSwRmBCm1U4RjsVTKEJd3/w7dQ6Si5eVcTCyudp
         Mnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717170; x=1741321970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=;
        b=QbKev3wewmMfztN1moggnwJKjVvRjPRZUuMfMs73YB3k3l2utKv7rmInQyfDa6WSWC
         N7UfG1qqiEtixLUtsLO95qzFWs8GZbKNDYp+vs/5ZdT/Alko3rpsR7OLU5H9zEhqFe51
         6JIt14wtsZZQ9zmKCBrQ75OI4RP68sst3g5YS5njXFK5IlWgU2k94sSBxfM/aM2ckIRV
         6+bvyZpGnNoydtWd7+Uc2QAf1OkqGYfGgcJop1TT64402zwO02madfn8rXv2/qBskUzu
         aiiyc9BukiHjRQuCDQjPvtc6JJ73aPy2Ca/oIRQSsLGwmICf5/yp4wXm00Mo8/I/dLXi
         74XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlrkFgSotM68IHn9+mzalTY9FXvsvemw6hy7EOzctE3e18tfgeY+UDeP+qjcfx6IfOszQ+n2pUq9a8xeqAzigk@lists.infradead.org
X-Gm-Message-State: AOJu0YzG5yFZn2ysyhLZYbH1f8GdEQRZWOwiZsAmEcFGTEL1DbtJh7r1
	dfJRCtfRt7jTdbYmzjFzT7cHgXzGGO0cRXEKtF0Xr4kVrkopSBs3
X-Gm-Gg: ASbGncsxxuC7ueNCSG1Wx+bf+0aZPs/gOriHqES3ffWShKhbBK3ulqpVRgelBOpog+R
	iCwxVwhuuG7QTyWDv+KVMcS1INvxbEnlQOQoO2CjLF6etaw98rnkQFYR1NTat8eeFDZFYHrXM+y
	EwXrae5LW+xBgLBCnjHV8YDWWLGdoBweRQaANQXtrzlflpkZGsQWc+AOYKkqfV3dVeAqW2hPiE3
	sMoYCP6ixxqAUclRPWSXyRUFIHlVyYSloP10oDpYvbyMmREsZls45s2ESv1CNNIQp4HQ6HWeJgK
	yL/JMzpeYOTnD36ZKW0UznOsGc4Q
X-Google-Smtp-Source: AGHT+IEd45BbRxuJcc/ODzZoJKKfv+EegnhVjoVMaQy8U6rbvnXBM+bXYqV4j3BtClJXhPFYagq+JA==
X-Received: by 2002:a05:6a20:7283:b0:1ee:e16a:cfa8 with SMTP id adf61e73a8af0-1f2f4e01863mr2897050637.34.1740717169879;
        Thu, 27 Feb 2025 20:32:49 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:49 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:16 +0800
Subject: [PATCH RESEND v2 5/5] arm64: dts: apple: t8015: Add backlight
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-5-69e450bc4bfb@gmail.com>
References: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=qZhdXikI6UVY1zdlQzyoBJcvZeFaA39QMPy5jc+lJ4E=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxhj6M3NanBr5AvddymnbZR2d8cHPaGW4NzK
 2jryU6pj5GJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YQAKCRABygi3psUI
 JKWhD/9Kye4j0aRu2dTcTj19vBKZO44Ncolu40yJZDoGyjZ61paCAKdGVjuTcWY9c7tit399/J/
 A2uRCQNQFddsl6uIBMMMHvkZd1ldws1boplm2P90ltqOkQ9IsQVcUqia/WlcR3Tx2GG2IOI6ee+
 ypekvAXxcSeKhAvjl4Ds410iPec+ueF9PWWP3eFDHojA7ge+DH4ummzhnrtVscaECWM3zpd5/AD
 2lb4/jDhCWWZuWfdeUhTdl46zakdZIiFImP5OOHHbvpFUf+RPhcrV91g3BI7CVhL12TEZtmBNzW
 5T+0buNt166NeM90BHShWxPKH7fofypOIQFjrXydSF9XKchP27u8TClv3gBRS7cyUcmd18CbFm0
 SM2Y+pbIv3aNU5uf+B1ctiARPi4Gv0oAXhj8Agg+D3hMEb7fG5gfFHNoHJSqChlbEXqsr3GgKhm
 JLlA41rfnGvnZYt/SbXF5Qo57Jul7m7ikBXE7d6LYuzQuM4a5BJ3ZZDBiHOfDrprrQPKsTO914A
 hLEWFZ4wzSvzFatsslxPy999apbmmWTjmHtBNyqDphTDeL2eK9Vl7AN3zPuNpbmZrjbzisQzKze
 uUywQTswPe+5TkBYL0T+gWSnNDbFnGiyCp5iSnhoXlohNdDvl0KhN6RlxrjaZgX7MyyaR1pxQ9O
 5QOv4NskCVgf18Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_203250_655914_9B67FE14 
X-CRM114-Status: GOOD (  10.38  )
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

Add DWI backlight controller nodes for Apple A11 SoC, and enable it for:

- iPhone 8
- iPhone 8 Plus

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015-8.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8015.dtsi   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015-8.dtsi b/arch/arm64/boot/dts/apple/t8015-8.dtsi
index b6505b5185bdd728a7416efaa3dd53d1c6a5fab9..0300ee1a2ffb7d2bd0558f6cb6f86514f4b433a4 100644
--- a/arch/arm64/boot/dts/apple/t8015-8.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015-8.dtsi
@@ -11,3 +11,7 @@
 / {
 	chassis-type = "handset";
 };
+
+&dwi_bl {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index b68647bebd20782ba7a125e670b3264c184b62cd..4d54afcecd50b50ed1fd386ccfc46c373e190e6b 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -262,6 +262,13 @@ pmgr: power-management@232000000 {
 			reg = <0x2 0x32000000 0 0x8c000>;
 		};
 
+		dwi_bl: backlight@232200080 {
+			compatible = "apple,t8015-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x32200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@233100000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x33100000 0x0 0x1000>;

-- 
2.48.1


