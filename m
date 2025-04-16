Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB3DC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y5y3ZmHmiZpETZLXQ8JayHf4F0abUzXVddI3VfW9eY=; b=4UeloD1nkfR6pdgIznTyWEiDh3
	psHbFBYYvQcnSoa8pdlExmbWQhV4UQ+UJPnw2EYXJ1UOW0rRL9M8zMEmOxQfZoKkpyaezkUPkaaez
	ECX8k6J7CYg2pHHQKIssaHgbI+70jBbdqkDlg38Yx1LutNE7WWMADzAUZ2nVmMJd6D+lMeHmfxJ3l
	92V7kIye5BwcyCH/xu6xVwRCT7COSPNxB1fGx0WczHvmXdt2Bssg1VcgEZBfURRSW62mVkosJR/tm
	VAA8i67e1n6YHChZtZRN/kYGxlh+M54S7FQ/jyUsjjo5fW4wC8E4tIyX7F4qG3sMlKKuELFa4At7P
	AZdOj2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u502S-0000000986s-2Y15;
	Wed, 16 Apr 2025 10:30:40 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4y2N-00000008ndI-3qGk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:22:29 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3104ddb8051so42112721fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 01:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791746; x=1745396546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2y5y3ZmHmiZpETZLXQ8JayHf4F0abUzXVddI3VfW9eY=;
        b=IEF6ZFSnO8Pc0slHjmTyXmWBZr9q8NNb2QBQLUnMWIY0ycFK9VKpt+Y3w/G0lQRy3H
         HGPyx+E9lSsZjlXYaIK1TgsCXBLVwr7myi6iG7uhF1tRe+lbwvkEu6Hpe+PJI5cNXfj6
         xdeC3nT6a+fsP3pie5/SORoy1pl/5unXpp/cbLiHUZnBJlKPCefIYgxXzVBxsr7KLWNQ
         Fb5g4rhYKX6a3b4luufoOPVupMmX28evaxcxBB6SnwmTQcuLBCI7pcnRClSA3Bh4uGwf
         ADVqejPjscB4i/PAG9FFWoyQ7vmp5cZHZskxH1JrScdYrJawN82jC5NEBM7B0rbXZQDn
         EbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791746; x=1745396546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2y5y3ZmHmiZpETZLXQ8JayHf4F0abUzXVddI3VfW9eY=;
        b=C90cQhNRaat7Z5i/b33vRH239sMsldasLWVbjLWBglFFRA98KfTlY57Uurse97vUsa
         fCVKma6u+sHeOqQgRdvMoDPIUoH7J2XA+o9q0C4Dq83KwWJkC31yUJkQCWgtnGdLC23E
         xkxxAeGhJgwqmxHWP8BGCmz+h0Ktw5SCMIZ0J3Sr4qBNBASq4ovJ47gHX+DfQsKDlKyK
         o1U47S3dowV8IlpJ+9vdVunfiMybafWnHE3nfui8A9pAuVJKlToHtEzcyCkGhwIatqEN
         x7GemCY+bDtEVcdrxQv0XMjn7Eku2bvTcxLiibyA6nJWsRxSlNvDmffzsdCkC7t55PCj
         4mXA==
X-Gm-Message-State: AOJu0YzK8KKl6d/INdeTPTdzBE4rJDlPh86wkkGyphPBEbVnsbw6ziV6
	GFTgOz+LTZ6kD5L362OSTCl4qYZoeTasNRWDxvNy2e/Rk0KPZjMi
X-Gm-Gg: ASbGnctzG/uvL4d+LQAPgO0qGgTx83/9vKmTUyM7OrNlEwpHXZhSMpIkSP7iTgy5j8I
	esM7Fucdl6dRrkCct0K5sfcfUSHqEUfF13yde3BqZC2raM+WtlUIlLV1stcrbsKVZ4dcPSodiHA
	vAiWUKo0ezY3MApDDEl4gzmAJl7HmlmVyqE8CfWYEtIgk4gg+LfQ4eb4dYkLDwRL9pmOalHm60f
	DdZfDVhWRkTEun913cn6wquhI1tvsVFanPkYlcafxih5Nisg9AVHt1eAErgOPtv7gB4NaIyfmEe
	zv7u/XyuIbpgddYLJ9zXgk+AJ2ryrqqT61lnM162hbLYzR2gKm1q
X-Google-Smtp-Source: AGHT+IGHmiw+jcDxFMmYyuWqHF6qUq+/5hAFy3k4yBNyU6kCzD5t65tfejPFzTQNDbufhza2BBNUIQ==
X-Received: by 2002:a05:651c:1506:b0:30c:dbf:51a5 with SMTP id 38308e7fff4ca-3107f73b63dmr2648981fa.35.1744791745426;
        Wed, 16 Apr 2025 01:22:25 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465f7b20sm23025391fa.97.2025.04.16.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:22:25 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 16 Apr 2025 12:21:33 +0400
Subject: [PATCH 08/13] ARM: dts: vt8500: Add node address and reg in CPU
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wmt-updates-v1-8-f9af689cdfc2@gmail.com>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744791712; l=2587;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=T9i9uDAOpIqzeQm8w0R/XGIMMG/IUH9cDEWFYQ3QvqI=;
 b=vmBR7nWOqaQvS/UBFzJR8eJ1zXTYzDytcNF2vW+Q+dE3Uz8KEYGI3HsPw55mTEIS4kAJGYzdl
 jhYbpMHCb8lA62v8QnEjoEr3XxaiChrFy57u4hgWPOEqT1aaS/AAcsw
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_012227_966173_303C86A8 
X-CRM114-Status: GOOD (  12.15  )
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

Adjust CPU nodes according to current guidelines, including address
and reg. Set #address-cells accordingly.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 5 +++--
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 5 +++--
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 09f5ed3e6821b72fc440f9de3df0ad484d2c4e17..1138940ce16cb8603d196b6e935d54df53b9a229 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "via,vt8500";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index c81810b967bb349419a5ac7db4e788faec3695fb..fa76df2830c79a695753c85397d4e916592f6a51 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8505";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 555008120a3e315591d2ca49a39d354925d570fd..5b6affda3b6b8d8be9f3100b36cb303d015f19b5 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8650";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm926ej-s";
+			reg = <0x0>;
 		};
 	};
 
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 309f6e5129fb817d343cd58a8d90340afd8d6eb9..14e1d4f7c093a8ae9cce5acfeba3755f6df93a24 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -11,12 +11,13 @@ / {
 	compatible = "wm,wm8750";
 
 	cpus {
-		#address-cells = <0>;
+		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu {
+		cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,arm1176jzf";
+			reg = <0x0>;
 		};
 	};
 

-- 
2.49.0


