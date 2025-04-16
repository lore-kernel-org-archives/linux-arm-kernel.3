Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFC7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 02:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjo4xki33zyLm0/Rt5Gsx8yphQcMjzMQ28GgPBYaW9s=; b=Oq+jaXP4Jok73LDjvFATTcXryj
	vJpwJ9frlt1mBfHOHvs4CrtP7yH3Ehgw9qihEPKI9TvGs3ndfsBvsMptGKSYXduHvBHIUlgmCWagg
	5TMopYqRYnnVVQqAa2sv9C43gLpdXDoewyM0wXpVsnP3Gc3cekXeoVVZ121+BMgwd+VpzdMJmE+V6
	9oLl++wsgP6q+g18k9FQgZTZAKhhP+Isf2471wIp3QMo3NYyjC0uRLBsunqPd7Mh8Bqkf3qascHHN
	hF2lgqCOleCEMXWqxLqCn9+p7bh0p7u83F0xCNtAIjSTuc513jopmVC+FGaJ/ju2S1sPdpssQderw
	h3tsaJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4sVh-00000007wTr-1Vmi;
	Wed, 16 Apr 2025 02:28:21 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rA8-00000007jry-476z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:02:02 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-476a720e806so53151901cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 18:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765319; x=1745370119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjo4xki33zyLm0/Rt5Gsx8yphQcMjzMQ28GgPBYaW9s=;
        b=WKy7wGWuzCXuFJH90OLyBYS9OVvdcJs3L1s8P7LUR7oREHMfP0KmPb/PCA74x5oH8Y
         mc4M59IJtvZTzQ+LHIXQ7SYou1pWrPWuPn85mAKeboaKDkkqlrTlq/DvEei1yUqKEotl
         oXM9M57WH/HjPYsuLc49rvb6j/gRA4xsTEJpbAjzZbVg2w8LBCO9XH+5IbC3Uw1aICv2
         3bYIyNnzpCOoUBsr7MtxBwB/ABSdJEMGnAilcBBWnNDKZi5evJv7tpV58gN8ajnfUcBX
         ngDCOnp5GiLqSAvpWLAkMdtJjSjCdSIM1JLN2KySWsRECBD5JeAxp+/U40cXxc/yyzuX
         oJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765319; x=1745370119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tjo4xki33zyLm0/Rt5Gsx8yphQcMjzMQ28GgPBYaW9s=;
        b=MN13BGZSoaL+WpmwseH6ISpUPVjBbPJ57MfwRKPxpgiYZ5X2fE/JrYAzRADeAh0hA/
         3bBzBN3D1OJzSLrBAzrjibIhhWS3IiclicyQ2URWCYG+WkI8K4cb3BdDkzzDaZPGHE5Y
         IS29U3P+je3C3HCw/UOzVqDcRhZr3dIFCE/KMNBBzkEHHUeIHO7n3dIJgfMVKPCugMP+
         xgI70ZyEBwAxpQpmWmjez7cKPBdG79DmpE7+iwKKOBskHKX6TOHBiQkShTm1I0jhSaLF
         IePAH6ON/Hh2VjLO4T7u5uj277nPkjFLL1WQqjQQ6f7Ekxg0xDBP060WAD8oqSGurSQI
         iWwg==
X-Gm-Message-State: AOJu0YyFFAptYf5G1mxarGDCYMA6pS2+XbM1wvkZKltNyUySUNfS+3ZA
	dKiQvWNwqirnhV7E7oUYAVk1dHfNkNKBIyp6qMpNV7s3HsmQb4YSqkd3Sg==
X-Gm-Gg: ASbGncv2IyXGu13eK0Caq4TlQp9sotSg/KsHFH3ylyfLsehi7C0xxWWx1VEaM61tkno
	0F4D0Tle3opO6jQSaNwxIW9yf4emX5EH0W77mQqYz3lE1Rm54BmGr4n5Zvs2hrGeq0a6bkzBgk7
	LZZ6+X6uPzlztvunpDWUNQvXtMLnd7IwdYtSHJMDtxBYZvkmM1bT40Ca4QVL7pSOaLFhZaseTXp
	svq8KoxTDqXPw7UNzcWPd5iTtzsyGieBa4npHAMDuChPy2gGAVhOkJJaliCl/oGYOCfYuSzKfB3
	SvPQ+MZi5NwZg7LbuKYC4Vyzx1chRpb5rKLxY1fF1R2Gye1JgCHCi2COoqOKsaEjNT6WnCSFWXl
	3THGAhKNIYG1zKyk=
X-Google-Smtp-Source: AGHT+IGSMllLvdBmoO21PrxCrBybdmOg5B+CK/K/ej/O/jMGk3bZh3tsbpTy6til3V66e2jkSmJD/Q==
X-Received: by 2002:a05:622a:1e0c:b0:477:64b0:6a2a with SMTP id d75a77b69052e-47ad3a404aamr25266811cf.26.1744765319578;
        Tue, 15 Apr 2025 18:01:59 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:59 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 07/10] arm64: dts: imx8mn-beacon: Configure Ethernet PHY reset and GPIO IRQ
Date: Tue, 15 Apr 2025 20:01:33 -0500
Message-ID: <20250416010141.1785841-7-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_180201_018563_BC8F5AB6 
X-CRM114-Status: GOOD (  11.53  )
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

The Ethernet PHY setup currently assumes that the bootloader will take the
PHY out of reset, but this behavior is not guaranteed across all
bootloaders. Add the reset GPIO to ensure the kernel can properly control
the PHY reset line.

Also configure the PHY IRQ GPIO to enable interrupt-driven link status
reporting, instead of relying on polling.

This ensures more reliable Ethernet initialization and improves PHY event
handling.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Update commit message. No active changes.

 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index bb11590473a4..b3692b367a42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -88,6 +88,9 @@ mdio {
 		ethphy0: ethernet-phy@0 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			interrupt-parent = <&gpio1>;
+			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
@@ -326,6 +329,7 @@ MX8MN_IOMUXC_ENET_TXC_ENET1_RGMII_TXC	0x1f
 			MX8MN_IOMUXC_ENET_RXC_ENET1_RGMII_RXC	0x91
 			MX8MN_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
 			MX8MN_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MN_IOMUXC_GPIO1_IO10_GPIO1_IO10             0x146
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x19
 		>;
 	};
-- 
2.48.1


