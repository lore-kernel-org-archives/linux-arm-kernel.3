Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DE6CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1qkiZNzj4i8upyPOuFU9biKPD/HSZhrQR/i5BB3FsY=; b=eQzhzxyeJe9Ddy3eFdF5xoM7+U
	ecSvGURrUxlNAqtzWAtILgnQ1Vzbt3rjLwWlBL0KMsiIw6b4g39vB+qaCE7st8nFaX7OkYP22aGAV
	noQ6Nh5yRcvdUia856d80JMz0WNqDdqM8qtF7xC8/EJL9vFI9mK8lyp+29Kg5ILd67yZULEuIOVeO
	f+/LzKB4f0hUCAlTxmnMnVSR8lIq5/McKn1kvpMKZeYf2Nravsmofg9/uRThFFgjri+fcUqAdMFsw
	iz6iwRZf2O4nHrNQmfhh/Us/yW+QBxLIadNTd1yFVfdm6iTOUbv1NzIOx48qgzwPtg0VnLl/sNl5B
	09dqDEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92f7-00000001vYY-0ZIM;
	Wed, 15 Oct 2025 14:39:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92ey-00000001vTz-2U0C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:39:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2698d47e776so50924165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539164; x=1761143964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1qkiZNzj4i8upyPOuFU9biKPD/HSZhrQR/i5BB3FsY=;
        b=HrxWzXM3wSH0s7SGnfen1xvUJiahstRvKhXgFIKggvca/dIpmZBvlQVYkzjYRwzVT1
         E+hzQjfXltXKHYfvNui/nI5c2LaGL8umkrj2k6gVJnT0TbqhJBCqLbTnYB5a39dpqw3T
         T80id3wNO2DgN0l5k2b9RAvqf2lcY7kivhX/Fgjf01wgxqAasN1XklUwyW9RKV8UsA6E
         fVJpRJdM9fBVCgi2GACMsOcnCQlGX116gDIQ9rSE/gFb/ISWKguU6Sz2uWHWM8NRSOgH
         nTK4jtJmEc+rehKSmcwGexp0Ei4fxpm/3gKHWsHiNrEQWhg/fcitGOFb3zIlhMpu7j+x
         XgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539164; x=1761143964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1qkiZNzj4i8upyPOuFU9biKPD/HSZhrQR/i5BB3FsY=;
        b=iNfaxlcTKKAbCTYEFxd4wFVpai/P3XGiaZwels8ObJZozK4Y/UAXuGkeV3uzOCcaXF
         e3W+vDpQeE8VogxU+ostZRifFjTFkrqshTq929XjzPWTYLMUIcZuYiGxB+979ywoaMBo
         7gGAmf/UIEkGL6cn2Ugg6VqzH8YcbkcfiFYcVLe1UEn9lGnxjRj9oYlMKPU4IPDJH1gQ
         /joxqTdNVuNKEVZUvUn1CnUqgc//d4DGcIu2yWghjy2qqKV5QdR0CcYkB3t8bI+Zaf9D
         9mC6F4XcxBeHuxRSjISgSi3ozi5AXDcpBug632ONBZLpYeH+5U9Wi1b7m0x1eCS/fiSg
         ZtKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYWPUurRpn1ndi4p6lFEAZhuSitAycmEaPVm9VzwOwlaKr+4wBHG+GI8OUrCgfVJi+GIRgK86SadzoKExguOsI@lists.infradead.org
X-Gm-Message-State: AOJu0YxWSFSgJyCXhZDvrcpwq2TCTqGXFkA6BGX+qmqrLfy7fUTgSvqu
	l7S9vHk2CvyZo+R506781bds6sYIxZJU0hSP3YfI1VRwIuQ/tSIAkXyb
X-Gm-Gg: ASbGnct3zqBIfj1iAel2+kOzQCxCnoSAJwZ43rSbXx2MdxpJdJfxfbBOn5oLCjbvHLw
	BsnSbKVSr4kola2TSWKytG0KJ0KiG96hE39DlrSc5xjGHP6J7TOKY7mAC5aqLKMvIPms7K2itZg
	NDcjZt1upUAUmVJNTjnfp1SlRaXLHplp73ky4IZXfrSlSA62eNBjNtCUVut/kqvhixoVnGSMU8T
	JjjTaCpvDU5o5E4hMR0879YlUC0tnNghyaof06M4fyjz24ib7AH1t68+raUDt8TBwFO9he3pz84
	Olv2iM/8vG10SK2KRFvD10Yob5F9xEMYHzfjQiG8aS9L04Nao2mjSsSKh79nmvDFYgLsYQ+paEy
	VdjVta8Dihd49p9PCH8i7WI35QSU6DOOR6qnW1OL+jQCWxlHVJSUdqRfJcAA13POMYsnoE3JORZ
	I/2rjHA55XkvtHYOBNUe5suM22asIkaE4jDqml+sDM
X-Google-Smtp-Source: AGHT+IGhJSIQPh1cVrCpB8ckttgUHuHIw4pB+GNjrgyyBubcVdnekxYCkMTZnEV3Ov7tT/KZdg62EA==
X-Received: by 2002:a17:903:286:b0:276:842a:f9a7 with SMTP id d9443c01a7336-290273a1725mr344577015ad.57.1760539163812;
        Wed, 15 Oct 2025 07:39:23 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36738sm199853455ad.87.2025.10.15.07.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:39:23 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] ARM: dts: aspeed: santabarbara: Add blank lines between nodes for readability
Date: Wed, 15 Oct 2025 22:38:57 +0800
Message-ID: <20251015143916.1850450-2-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
References: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073924_631572_05792F9F 
X-CRM114-Status: UNSURE (   9.48  )
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

Add missing blank lines between DT nodes to follow the devicetree coding
style and improve readability.

No functional changes.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../aspeed-bmc-facebook-santabarbara.dts      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 72c84f31bdf6..4adbf15d913f 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -319,16 +319,19 @@ eeprom@53 {
 				reg = <0x53>;
 			};
 		};
+
 		i2c4mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c4mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c4mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
@@ -380,16 +383,19 @@ temperature-sensor@4e {
 				reg = <0x4e>;
 			};
 		};
+
 		i2c4mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c4mux0ch5: i2c@5 {
 			reg = <5>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c4mux0ch6: i2c@6 {
 			reg = <6>;
 			#address-cells = <1>;
@@ -424,6 +430,7 @@ voltage-sensor@48 {
 				reg = <0x48>;
 			};
 		};
+
 		i2c4mux0ch7: i2c@7 {
 			reg = <7>;
 			#address-cells = <1>;
@@ -469,16 +476,19 @@ i2c5mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c5mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c5mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c5mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
@@ -503,6 +513,7 @@ voltage-sensor@48 {
 				reg = <0x48>;
 			};
 		};
+
 		i2c5mux1ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
@@ -513,6 +524,7 @@ temperature-sensor@48 {
 				reg = <0x48>;
 			};
 		};
+
 		i2c5mux1ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
@@ -542,6 +554,7 @@ power-monitor@45 {
 				shunt-resistor = <2000>;
 			};
 		};
+
 		i2c5mux1ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
@@ -663,6 +676,7 @@ temperature-sensor@48 {
 				reg = <0x48>;
 			};
 		};
+
 		i2c12mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
@@ -678,6 +692,7 @@ power-monitor@43 {
 				reg = <0x43>;
 			};
 		};
+
 		i2c12mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
@@ -695,6 +710,7 @@ power-monitor@41 {
 				shunt-resistor = <2000>;
 			};
 		};
+
 		i2c12mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
@@ -712,6 +728,7 @@ power-monitor@45 {
 				shunt-resistor = <2000>;
 			};
 		};
+
 		i2c12mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
@@ -722,16 +739,19 @@ voltage-sensor@49 {
 				reg = <0x49>;
 			};
 		};
+
 		i2c12mux0ch5: i2c@5 {
 			reg = <5>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c12mux0ch6: i2c@6 {
 			reg = <6>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
 		i2c12mux0ch7: i2c@7 {
 			reg = <7>;
 			#address-cells = <1>;
-- 
2.49.0


