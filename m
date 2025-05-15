Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE394C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 19:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kPip897cJRA1ZyK07OQSKvEd5nXI23QmwVusagPdyo=; b=NNVAdh8djr86ctAtqVjQMLV3Zy
	nuQ6aQr/bJMNd16WWjYiZIbaSFvbK+9ALQck8IUNM6NZufpXZmRAirxF5oIX+na8iiM6VuYzdIRbV
	Z9gPOlTiHZxMRaTf2RRExF4ILbCSK7YMrLltJYKim3WkNc+u7rYgz7YxaLqpCgS2lH7YS1oObrfh4
	801EtpM2TRKAxbOBOcER2ZMevtJhqsG2/WMrIbxbPXyLcps1i+MjCwahDAX1wBjcvfNOQPaGKMNf1
	u1epdrzODO+Q7D33NCRB/XQrIVI2O7ayCHw7eyHPZ3Or4Dq+OWDFbCixSPb7hOyL+qNj8KMRzzjGe
	Bq1XQ13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFece-00000001j6c-43mg;
	Thu, 15 May 2025 19:52:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFeQj-00000001hQ1-2NnO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 19:39:46 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-54fd1650b83so1499524e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747337984; x=1747942784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kPip897cJRA1ZyK07OQSKvEd5nXI23QmwVusagPdyo=;
        b=C7dCyG9jZo3PgmKtgHM4sS80xXhgXvrn5nDg7YXgHdDD6r2jf0/Vb6psVcL2+Aa4/I
         o/bc5TD0fufFHz7HEeA52fOLkzdqGRI5bsC1r4XYsuIcRTYFmJX7oJaJrpDGGAwJP48T
         ztPEabAFdnK8fd+gUxxUr4yD4F3NtXUrJbrfFgaR9UGhqKYBGtywQdOE0fh2bQkrDx15
         o6RQV44oesrT6dG1HRuF17DyM+W0Ud1lvLcIrQw9Kwhzqbj9GMSSuvISSpd5ftJp6spT
         ra7PNExC7+OKBKjrKRtTW961O63E8DKDPTMjFimgmBkMj5v0aZXPl+EoSavMauBN7kJc
         wDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747337984; x=1747942784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7kPip897cJRA1ZyK07OQSKvEd5nXI23QmwVusagPdyo=;
        b=Ktqa42DvrjcsMZUo6kiED05ELQPzHiu9ZNmHDIf2lLZxaM1sW1EiD/n7KBJpQeNnhc
         8Efn05gBGpyERSaTM8FUOQF5aR9FceWqjI12l9KPkjcaBhqDNtJ0sdEmf8JfXI5dAZru
         Yd5NFnnCg7QeADWROD9HO5D7N9Im1bt5x67kjExb38ZD8MV7rTdupKc84N7Ixnvollsk
         jFycSWV45qER2jCCkZc0yJFvKl5Nd4qecdiwN2C24Ei7oWK72kc/oDqKQYCDoRWKqCco
         fkQhLaRQz9i9KIDUgA8xW4BTCK3vSQibGvsIPzcy2rYiKOmbEZ/gbrGp7zncp7XbjkyG
         wCBg==
X-Gm-Message-State: AOJu0Yy+y9lDGy+Zzt5QD5vfLh/AKY7wShnp05fKhRxv/QZkFVoWlU3b
	Mo/RgLoQktxB70uk9XDJ14pXo84n/E9wVegY+wP8eO1x1PKrWIBFSe1kLuOwywoQrGt4gw==
X-Gm-Gg: ASbGncuH4kucJiGny5mtNoQ72opsSxUcppZxvujS+U5IXrF4b2qp0GoG+H9hWmeasoW
	uC9f9MEi5gpO2iZZgDlF1KQ/w1eI0Q90nO8uVvV9+nko5VrqOp2qEGxDpFNxgpUxryO8G9svfaN
	W1HhDG/8fPNQoHrak++9QEiI4L2ShUahqFlUXT6lRG5b4BuGCySzRXviIGJYN9OjS9uBt/fXcgL
	LoUmWmkK5WdGD1EihNZ67OCxRbEt1fVicbmKiBs2sOk9Scn4Knxl2VjYFDgPwn2qQpsdzV51zex
	bt1WEji1pPv3lJfIK96cUMYa84dUolxgbN53/jAJ0Vo6+/KrdaJ4UADtV5rFl22T
X-Google-Smtp-Source: AGHT+IGN9dWtAS1fQY6SOJ3fdKPGUo+dS3MzUROaHS6AFlbQQs/x4ruOrI7j3gsIpxrEv1h3EVxcnA==
X-Received: by 2002:a05:6512:6301:b0:545:2a7f:8f79 with SMTP id 2adb3069b0e04-550e71b4a93mr230229e87.16.1747337983574;
        Thu, 15 May 2025 12:39:43 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f544sm72297e87.235.2025.05.15.12.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 12:39:43 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 15 May 2025 22:38:44 +0300
Subject: [PATCH v2 5/5] ARM: dts: vt8500: Add L2 cache controller on
 WM8850/WM8950
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-wmt-dts-updates-v2-5-246937484cc8@gmail.com>
References: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
In-Reply-To: <20250515-wmt-dts-updates-v2-0-246937484cc8@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747337978; l=1530;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=DSJDp1z7Pob8W8/VBKGX9pG7ZPkhnhBiDbakz3e1J+w=;
 b=hwJTzNQJOYQCe6IRsbCMKSqAddv28lmp6tN7TrwXhYQbbq4z3f6Q9twes4NDmNZJw2jId1sHU
 p2D3+CloCBlBq/z1wjmefdnxS2S56XFF7QDJQ2TmC5JX5bqi5hoVDi/
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_123945_610170_AAD3EFC0 
X-CRM114-Status: GOOD (  11.48  )
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

WonderMedia WM8850/WM8950 uses an ARM PL310 cache controller for its
L2 cache, add it.

The parameters have been deduced from vendor's U-boot environment
variables, which the downstream code uses to initialize the
controller. They set the following register values:

aux = 0x3e440000
prefetch_ctrl = 0x70000007

Their initialization code also unconditionally sets the flags
L2X0_DYNAMIC_CLK_GATING_EN | L2X0_STNDBY_MODE_EN, so encode those too

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index f741a3e88d74ab4740f200b9b96201b3dc799bad..58109aa05f74b67cda82b5ebd0127662e475ded6 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -18,6 +18,7 @@ cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
 			reg = <0x0>;
+			next-level-cache = <&l2_cache>;
 		};
 	};
 
@@ -308,5 +309,18 @@ ethernet@d8004000 {
 			reg = <0xd8004000 0x100>;
 			interrupts = <10>;
                 };
+
+		l2_cache: cache-controller@d9000000 {
+			compatible = "arm,pl310-cache";
+			reg = <0xd9000000 0x1000>;
+			arm,double-linefill = <1>;
+			arm,dynamic-clock-gating = <1>;
+			arm,shared-override;
+			arm,standby-mode = <1>;
+			cache-level = <2>;
+			cache-unified;
+			prefetch-data = <1>;
+			prefetch-instr = <1>;
+		};
 	};
 };

-- 
2.49.0


