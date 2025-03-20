Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB4BC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 15:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsGnq8WpEGq8rItMy0um7W6pcAm/zbCWTBE+mh8Th8U=; b=RBr6G1WF2QcQuYSM1s1daq3IPg
	uMJkVVBKwCijsPeH/CvcuZjMefZFax/Bxc5OdgWwqRFQOKahNvBBjdhW7D+PChTAeQCzPjCBdncUl
	M+ar9/JZBeQ6kreLhzl17/uE509BSXS1bR8kp1F+AFuDi4ONu1MOGuX1YQRMfrY7qJEUlu8kUjyvh
	ZVmpKzp0/pO4LEZd87nV751ITpmD+Qn/APTFQYNfleA2NeYcmNr133A6EkoSzvbEBOi5FBwD3NSao
	cjSXYqCX8OZDIlqoP+++Vj99nZMbakSFaoVHyu+k+bpXrjhwR4n90HoDeqsWtH9vg97mHvr+arWz6
	VKjQJzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHqO-0000000CY2X-0LEZ;
	Thu, 20 Mar 2025 15:30:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvHl2-0000000CX1W-196z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 15:24:33 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-225d66a4839so33627625ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 08:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742484271; x=1743089071; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsGnq8WpEGq8rItMy0um7W6pcAm/zbCWTBE+mh8Th8U=;
        b=PKllur29Nhh7x9uITI4BPhdXsPiKG1mJrMsmHLM7RwtXrOZcJaYRBI9MxIDiv8CLZl
         4gfUOfCS+TXM+kRzu4FaoLtEaDOr1vDnn4qOU83cmJUFJTj29iW2885kAn12Yko/VWRF
         MPPOR640ksg7REM9hOqdL8NmAeIOxmfyAv43CyYdRmJidsRVZ+KQiH8/i2kQeTEa8LhL
         tTVe7nUkV19VRgailbGgaTxM8AZWzoxnG8bDhwaThzCVFAPfgCo/WOIxgCKRsTI9MHCC
         u68FSRYhdPfE+KhTMNKhIDIcfDmepuPsJWAh7T1zVzWxiiUUTRlA0hiIwS/uFXu5IekV
         BySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484271; x=1743089071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsGnq8WpEGq8rItMy0um7W6pcAm/zbCWTBE+mh8Th8U=;
        b=ddjp040+Lr5nHWFBbn2C5JXSmQnZt5TccjYeyeJ5rGUkJnh6xd1fVKpzLPM4cfOK0m
         V/rrS6xDgBHdKDtWXXX/af2vAKIIW/Kwcvr3rFHdvJVmK/xJwvoFFFz8IOxHt3t8XqJV
         inLOtmGxm1XqIWGAYN+2J19GZfDV+suBQxXyU8WJg8zEl0bM4tWiTSMB9qMwcx1j0PdE
         LbyZ3fbAQSacA8oQktP0zU3sdWuD8T3PVToLHKOVB1j77M++fEZDXh0bvs+j2JnnUANL
         CZG7xRKvhNOgHoHAIa922vGUjEJXmGojoEIYK8PfRFfRnnZ3yNXAYT2TCpIUjfaPhy6m
         eB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBwcUVbghuGe27dSF3LyDrNGZ6jNGqEqMu99TZ6N861DFDIxHbTf4NTySZLq2frB/tge1/4pajRn+Jn7M8o1Kr@lists.infradead.org
X-Gm-Message-State: AOJu0YzPhffakOM2CMGK54lT3WR7nLkhIPemCV3Qlp0JyYVUgJN0NIuN
	65vU0Z+gb9ylrwQb+d7HbbVX0qEyzbXtxm/AkPqQu1+q7xEg2vMz
X-Gm-Gg: ASbGncsxx/pu33R1E5o+mRTefDaoogyIMFL3itWSxAfDyRJ/xpSu2Ggips7P2DCWfg/
	g079vhiPOwPVpflV5kPME0vlT0z14U5S4NANolY4xYRbIyATiS+uhaFQSG92pxNOMw+UHrsTg3A
	ghh0DB05BywzggMhAU77w2iLavVnAhDmrzh9FOPm/r+e9g2kNps4L42057sC54RmJSFb8WeynBw
	Dc8MVB/3L9w7qejyNY8hc+4NOZbpVUh4kSsjG6YvPUibNMKqVzpr2oCjhGg704BVkHdd6lysoft
	9yUdXDbLDraRPYEV6Qja5U5Xbe6S3yiYRlaYZ8ytVMRBea7x9wmcWpNssHgStxmPvN0Aor/JER5
	9e+ew+skpNim/boJoIvOo7Q==
X-Google-Smtp-Source: AGHT+IHybFC0zN/Rzgp2ZChfKI2Jk8hE5XOcGV4Y15RoIluk7IS4EwemASEKGtRKwRtujb5+46zkqw==
X-Received: by 2002:a17:903:187:b0:223:3394:3a2e with SMTP id d9443c01a7336-2265e7184aamr45865045ad.18.1742484271343;
        Thu, 20 Mar 2025 08:24:31 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd4a8fsm136905515ad.234.2025.03.20.08.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 08:24:30 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 23:21:51 +0800
Subject: [PATCH v5 01/10] ARM: dts: aspeed: catalina: Add IO Mezz board
 thermal sensor nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v5-1-e161be6583a7@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v5-0-e161be6583a7@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742484265; l=1855;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=ZE8DMnDtK6GtXz/R29k12joihlo+gxEvbFhaGKQky3s=;
 b=Pwk8Uh+93j9LYHavxQFQIFiCHCzIOTgKNDNj8/fEYsR7crev46E2mLJvCsTSj93JoySx9CQyj
 71O0JM47JzTC8DBcfN6GeGIo64SJdL0YhGdfdK5V451j7FQ9RYGGpZD
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_082432_315220_97179345 
X-CRM114-Status: GOOD (  10.32  )
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

Add thermal sensor nodes for the IO Mezzanine (IO Mezz) board in the
Catalina platform device tree. These nodes enable temperature monitoring
for the backend NIC, improving thermal management and monitoring
capabilities.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index c151984289bc..d5d99a945ee4 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -198,6 +198,12 @@ i2c0mux0ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			// IOB0 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux0ch1: i2c@1 {
 			#address-cells = <1>;
@@ -208,6 +214,12 @@ i2c0mux0ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			// IOB0 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux0ch3: i2c@3 {
 			#address-cells = <1>;
@@ -299,6 +311,12 @@ i2c0mux3ch0: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+
+			// IOB1 NIC0 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux3ch1: i2c@1 {
 			#address-cells = <1>;
@@ -309,6 +327,12 @@ i2c0mux3ch2: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+
+			// IOB1 NIC1 TEMP
+			temperature-sensor@1f {
+				compatible = "ti,tmp421";
+				reg = <0x1f>;
+			};
 		};
 		i2c0mux3ch3: i2c@3 {
 			#address-cells = <1>;

-- 
2.31.1


