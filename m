Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4721CC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 07:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BS/TmVUgFRyZOyjVnszJqpF/8S31xxnZs1Y2Qe+EyN0=; b=z1MrMEQkZiNrAf4KSwqNO2RCLb
	4ApOWHyHGJzr34pQz26VpOrJt+H8A9favLoIjntdrxAJfkarouiEv4fWhT+DdSmuKxHkAoK09jpSH
	JAsj2Iae0jHZlLsFd1vKO7grsIWc16YyVx8CaRWLIHfKUmRF9NZs9IigB3pS9woAIuqqC+329sDbW
	cOUDJwB/LeSNITINeA5s38a7j5QP39r7RSlQlhobtpqNxHNo5OGe0uAuanryD9d4KHj1MNmLVBOe4
	Sr22i8sJpQlM/PIgnjiSO4BL2enYx+Mk5qxO3TiH9Q+YV5AFA0WZGPcFMTm5WyC2UlRELR//CZSdx
	Ft884b0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWxo-0000000E7d3-1qeB;
	Fri, 21 Mar 2025 07:38:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvWo5-0000000E64n-192H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 07:28:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-224100e9a5cso31322025ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742542119; x=1743146919; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BS/TmVUgFRyZOyjVnszJqpF/8S31xxnZs1Y2Qe+EyN0=;
        b=GFzwcarEM8fi8qM+LcEgbw19l4Z9y7Hj7pglROGj7iCHlTDzcjbjG+BDtWKPgPIKX7
         PgB3AzxXuYlRYhv/uzJVlQ1t6j7Iat+X2bPqWqaS7WEjLzBw/gpLs00MKUS7QSLJnIGf
         gvB8MFRc3KvoR9cLonpJiKgsxc9M+lomQh1sxSRySELCN9dYBn86llEekeGXZVhhVdcj
         PZBhUXqnBFMchYyG+iDmeiycW06EcN59AHfktBq5xDzhDvSEECFpCXbIjpMnSLiZi1mZ
         mi0hggbJ3N/SL8erpJeWUh1cIGVqrOyBDnFiO3tvEcVPVlXBvCjO8uHDG5w9GLJdYtoU
         anuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742542119; x=1743146919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BS/TmVUgFRyZOyjVnszJqpF/8S31xxnZs1Y2Qe+EyN0=;
        b=su6W7mRT/5SRwtuXwQzQhUiQlJxU+R5QdRHNfixnIF6QGzbT/9Z2CLfPSkj/9DBRo5
         J7SBIF98K7ct1KFzoh0W2zw3n5QHTcpePJ5wEm1oszOwA/xODphz4V7tA4DbhD4NUWMW
         XwOzBUUI91GGOv/TtRFb3SnRXpnKFTRmKFbYSn76pey2xQKfuWuWa23aElUK6JuEN6EN
         2k86LLKcEUDJabO8hcl5ZLmyyCnsGc7ZhhP9Q3SpRH+InVTbQbVKD2/xWd/nF1E63VMd
         Tew7ABattjoXiS9q+XhNI0xYi7Hkn2U4QPuH+3Q4i7j/rPJztT8+PcEjE/rj5p359Vxj
         AR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX4NZubkqPDmIoimVljxvzWTTZu8tlJ82110hnxCFD2ApVOJ15N+r/3+ko82kbI2IRBpMAlbCK6vl/foofzpCQL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxga41PVNypOdPIF1deWmvBXm3kRLQBRlro/axGF2xBaW+AVBez
	lPNR5sxMPEGdye9KLnNR77QtcYHtKb8IhpTOLNl5SokhZ8pHqIvbZ034AA==
X-Gm-Gg: ASbGncvndggG88sZdhOQO3c9qolu+jw8nqyI5AkzQgFQ+JLbXvwumDyEXLsgoLBnSR/
	oOgfeySxvDBzzHUOxokgTnXYJbe0T8R28uvVE17Id+qOvQQTNgPqX3X19qQgEs2PzatzoD/4Nxb
	lZ1dgEKMotYJkhFAsNvn5nVDh/EdyK4DI5NjKSCkrCj6Lc4mNtPmMdLmcaCoHVzSy1W/V7aQXMM
	3VlBL9ffPO+hRH1B+wAWCMbuazZu4CszH2+1Bp50nVhB3DR9iZp52r3StJFr4ZOAnq9jzPO4gRp
	jDdUhUTJ5RaRz8fNCFMQs01rycpd0px5u8bQuRFfIRmakjhAG+XPBoUcCDIKkpPAX0IarmE6TJM
	dKIU0iTeYYSHCjvMKfkgAFA==
X-Google-Smtp-Source: AGHT+IHTntVL00x9Ot2AtrftECNKQGtuavdLeqMD3j9ehPfSEF0bdNza6lVh0Gk1ZXq42/xU5C0Akw==
X-Received: by 2002:a17:902:c949:b0:220:da88:2009 with SMTP id d9443c01a7336-22780e23fcfmr29362215ad.45.1742542119351;
        Fri, 21 Mar 2025 00:28:39 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f396fasm9862265ad.27.2025.03.21.00.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 00:28:39 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 21 Mar 2025 15:26:06 +0800
Subject: [PATCH v6 05/10] ARM: dts: aspeed: catalina: Add second source fan
 controller support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-potin-catalina-dts-update-20250102-v6-5-4bd85efeb9b4@gmail.com>
References: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
In-Reply-To: <20250321-potin-catalina-dts-update-20250102-v6-0-4bd85efeb9b4@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742542103; l=2501;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=2rDyUX5mX4sDiO8XhZEFmbAdAa78bSLytJVw4UPc5d4=;
 b=m3Q7dfRD9bnw8tKiRxDF+GNGHdX4hLaO9nLnypaLt9IE/146J8937vtLCgJBp6r36hqN448Ol
 LT8oNDoehWPB1MJzmGWlPMUq96YhNi1gl7ixdFUCAY2DOz8Rsp3Ymvp
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_002841_314168_91E5AE6B 
X-CRM114-Status: GOOD (  10.15  )
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

Add device tree nodes for the NCT7363 fan controllers on the second-source
Power Distribution Board (PDB).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 792b739b1103..f0c8aca152e7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -467,6 +467,82 @@ i2c1mux0ch2: i2c@2 {
 			#size-cells = <0>;
 			reg = <0x2>;
 
+			fanctl2: fan-controller@1 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x01>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&fanctl2 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&fanctl2 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&fanctl2 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&fanctl2 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&fanctl2 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&fanctl2 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&fanctl2 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&fanctl2 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
+			fanctl3: fan-controller@2 {
+				compatible = "nuvoton,nct7363";
+				reg = <0x02>;
+				#pwm-cells = <2>;
+
+				fan-9 {
+					pwms = <&fanctl3 0 40000>;
+					tach-ch = /bits/ 8 <0x09>;
+				};
+				fan-11 {
+					pwms = <&fanctl3 0 40000>;
+					tach-ch = /bits/ 8 <0x0b>;
+				};
+				fan-10 {
+					pwms = <&fanctl3 4 40000>;
+					tach-ch = /bits/ 8 <0x0a>;
+				};
+				fan-13 {
+					pwms = <&fanctl3 4 40000>;
+					tach-ch = /bits/ 8 <0x0d>;
+				};
+				fan-15 {
+					pwms = <&fanctl3 6 40000>;
+					tach-ch = /bits/ 8 <0x0f>;
+				};
+				fan-1 {
+					pwms = <&fanctl3 6 40000>;
+					tach-ch = /bits/ 8 <0x01>;
+				};
+				fan-0 {
+					pwms = <&fanctl3 10 40000>;
+					tach-ch = /bits/ 8 <0x00>;
+				};
+				fan-3 {
+					pwms = <&fanctl3 10 40000>;
+					tach-ch = /bits/ 8 <0x03>;
+				};
+			};
 			fanctl0: fan-controller@21{
 				compatible = "maxim,max31790";
 				reg = <0x21>;

-- 
2.31.1


