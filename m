Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF21CC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 20:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=; b=qPq5X/F4A9h0AYGAsAzowAd+ZP
	ZogG8OSedeRuUtbuTkQ9plcPIWrTcVOSZZTGmjsW13QQ9QYBNY85qkRSrsd9l3cmaOETbg+IAeDBx
	9FSvrVnCmJHAKhkBR7AB7+gXf2pCiu2OO6h8i3+ZcuvjkOF2HtjJLlIgXDmi4maCR/RUnoYGJYyBZ
	Hnl0Xr5C9pzvHl8Ki0aUcQclgnzKpXiM2FLxyPCTng3UGY4kN4wTqiuWms52Q7ZSTKQQTnLWcM2mP
	rbebnOL63egHf8pwhgTZGzTV/tSMj2jQVpxrg9HZlMsHYFwAzwbYtsXkqX85Ij78oKywKEUmJ3tVf
	r9pHAcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hYX-0000000GQCb-3vmm;
	Sat, 12 Apr 2025 20:34:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3hRN-0000000GP01-2Fu3;
	Sat, 12 Apr 2025 20:27:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so21564595e9.0;
        Sat, 12 Apr 2025 13:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744489620; x=1745094420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=;
        b=CpdhtK8bLvL2IxfpF7hpFUvMSh5SEqWKi91XCK3E8LAO7gFViJXCZFid6GfEzH11v4
         MH9xE+9xs045thuXWRpCS7Z4YW30cfyTBUdTeQUTArBffV5LFmAFPINQNu11kqvx5J2i
         05Jfu5GxmDliH3kejADrEIGVVG7qxP9k3ZcWwYTLjjmfk0mYmr5LxQwHP4VTEQBthKAf
         b6GI3e6rfXmi4fZYb5h8+6U3zv3+ePp+DvdXjIWw5dTq6+CRWSgnqRRU8vLtLFSp3RKf
         8zdWLE8wJHJHwNsui5E+f1MdEZbm+c4elbw9Uc3COSOs3eJzYHRXrEtObO5hMKbOQM9D
         CHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744489620; x=1745094420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2usqzIFp+F+sor9mgGvMP54EUED928aPFjm+huTcOyg=;
        b=spyuIXr58KM2JKe9AvaLv+3ArQu3NubNe2/QnctbHdi0mve1Tu7PQ7hCiJpHA4Fd4o
         jBTfY0vdGdm9yOUHNArWXeQK1IyWUzYOPgk9iTKuSXGe5eOx6vsr3jFTjF9bIv57KxE+
         JBWZs7ELDGgi5gh1GLZ0y74Dm1Ll2upZjwR4J5WyOLxgQiUNc68cBdZOn+Xx2UPTewxH
         +JL7tcaby259lVwypHiUDX3+1smqdW0YVc4xt/L/QwRuRwEy0/O2/OSED1Ptt6deUdCT
         BfvTBVj6+hS3hof85DG+PiIrm8ufkASQrfN5rqEFB6YpsR6FSoMlSpy0DF7KC7D7EP5N
         8wAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBAUlojjgiQYHR3vsaIQqOyJXfoS/wJcYHXMMH4IT6blpE3mOcONt6KyTYy+BPf3OMzGvR0KjjmtDW@lists.infradead.org, AJvYcCXyNzlrFUlbwtQivMhDyXFrvJdp88Mu/OvQ9iVRIqd/6IcRdH2EtxUijBJS4LUu5nnkr4R5Zr2jRa91rWraY4Ud@lists.infradead.org
X-Gm-Message-State: AOJu0Yymux/ta1oWz3r0py9c3dT05m25UmY7LC26IL0rmSfpRnjxuSaj
	66vJzNINmTJBSrJ0FhX8Q5jkq00hK9p02IIxPHBJoCyWFPu7nAIkrMyQzw==
X-Gm-Gg: ASbGncsZXHpor5GH/qOzlkyjbha7hROpEZQD/8qI9bqkwHpWVWxRBkERFK18qRUXzNN
	h8SnHOuizZRRYi1Ccxu2P+sU7EaneGq+mivyOSqS6AxrzVpRJ0W7JEVYP1QWDRsoCEi/Rmpv4Mn
	AkzifZbfTuod0Din8KVGa0OPjy4ROt389onxUQv4M/VGne4onidcHyVLhh3lGcSPns19dwxV8DJ
	lnZZWJrtCAiiOnN9Mtv0FUHQb8cjIJYK5C9ICafaLOvlhCPr7tjJQwO6K/pI8w8aXg+UgfB/sx4
	ThQ+KCUpilGoeLJgmAW8Pbz/QAIR9xjDOowTTxVHK209Zf/oyIwSm5yvWzbQ5mPNVh3cWBXgQH5
	QpSLsUuFGBsqTiy+B
X-Google-Smtp-Source: AGHT+IEah7+QhHhcMI502D3K184AdzgML6oZ4zalt7NAyqUNE6otZecWQFpnPiMPSdxHbSRclrEr4g==
X-Received: by 2002:a05:600c:5107:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43f3a925477mr59707825e9.7.1744489619878;
        Sat, 12 Apr 2025 13:26:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d802sm131797845e9.1.2025.04.12.13.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 13:26:59 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
Date: Sat, 12 Apr 2025 23:26:13 +0300
Message-ID: <20250412202620.738150-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250412202620.738150-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_132701_590096_78A7CCC8 
X-CRM114-Status: GOOD (  12.74  )
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

As not only Qualcomm, but also Samsung is using the Synopsys eUSB2 IP
(albeit with a different register layout) in their newer SoCs, move the
driver out of its vendor sub-directory and rename it to phy-snps-eusb2.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/phy/Kconfig                                      | 8 ++++++++
 drivers/phy/Makefile                                     | 1 +
 .../{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} | 0
 drivers/phy/qualcomm/Kconfig                             | 9 ---------
 drivers/phy/qualcomm/Makefile                            | 1 -
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename drivers/phy/{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} (100%)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe99..11c166204 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -43,6 +43,14 @@ config PHY_PISTACHIO_USB
 	help
 	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
 
+config PHY_SNPS_EUSB2
+	tristate "SNPS eUSB2 PHY Driver"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enable support for the USB high-speed SNPS eUSB2 phy on select
+	  SoCs. The PHY is usually paired with a Synopsys DWC3 USB controller.
+
 config PHY_XGENE
 	tristate "APM X-Gene 15Gbps PHY support"
 	depends on HAS_IOMEM && OF && (ARCH_XGENE || COMPILE_TEST)
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442ac..c670a8dac 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
+obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
similarity index 100%
rename from drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
rename to drivers/phy/phy-snps-eusb2.c
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index c1e0a11dd..ef14f4e33 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -125,15 +125,6 @@ config PHY_QCOM_QUSB2
 	  PHY which is usually paired with either the ChipIdea or Synopsys DWC3
 	  USB IPs on MSM SOCs.
 
-config PHY_QCOM_SNPS_EUSB2
-	tristate "Qualcomm SNPS eUSB2 PHY Driver"
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
-	select GENERIC_PHY
-	help
-	  Enable support for the USB high-speed SNPS eUSB2 phy on Qualcomm
-	  chipsets. The PHY is paired with a Synopsys DWC3 USB controller
-	  on Qualcomm SOCs.
-
 config PHY_QCOM_EUSB2_REPEATER
 	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 42038bc30..3851e28a2 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -15,7 +15,6 @@ obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
 obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
-obj-$(CONFIG_PHY_QCOM_SNPS_EUSB2)	+= phy-qcom-snps-eusb2.o
 obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
 obj-$(CONFIG_PHY_QCOM_UNIPHY_PCIE_28LP)	+= phy-qcom-uniphy-pcie-28lp.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
-- 
2.43.0


