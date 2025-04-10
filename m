Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5909C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AETJCm92Gaddp7KArrHx6Zkppk0IpRlpsUfZE9LW2t0=; b=d/9D8s21tNGRMXI7oXJw9gIbsf
	nxGLxe5LcnKJmA//w5oN/XHQ7uR3vlAvO/l3mlXyweJJnMkhpSpuGPCrnaxWNYghOayozrsx5o7s/
	sE1fF2s5R2Y/AWYsmZ/fRjEOt2ZHWY+IqZc9aP8Gzi2SMm09EduEfyHa0M/Jp3S7D5Trx+8oK4kv+
	2pptTGyhmjJSdzITI9e5HsypkNFACiMQuIYCMsAIkDvRl5176v/v/7fAMqhDvDDDIGugSx5CuY2+U
	jJnCthHyWvONMDLUuSoq+m7UXUwWNUTti7hE3j3Ox1QO2qHJrEwXw4Kzg/9y/2tvO/Rqw5UkUBrHC
	yUKeiT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gU0-00000008uIe-0Icx;
	Thu, 10 Apr 2025 01:13:32 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gGZ-00000008sBc-37iV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 00:59:41 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7c55500d08cso28461085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 17:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246778; x=1744851578; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AETJCm92Gaddp7KArrHx6Zkppk0IpRlpsUfZE9LW2t0=;
        b=fsZsZOQw/0I7xnMFNO96PC2jDXSZq6NhTrAAvB2q6wtp4SpZXZd10N9LIQwHCiJQ0Y
         QsHPcwHYfuybhyAxwhaI5V+hC9kpLBR4DXKYw5ul5Q93MvojkaJA9Xmqi8kxsul2PGQW
         Ic0OCEDZJ8x+C6sxC4s/CCwBdM8c/aAjbIOxDRXbPaKWDntr3YgsnG+UY9gzr9CktV0w
         K4fsaTdYxwMDF0QtcDAGXeZ0uKJj36oDb9JW40yVIdnvhjRqTi+YAkSemPPmaZCkcTWL
         L5lXCo9B/qK/QUv7CHy6pPm/cqUVeXMSZX21YrAiS6s1N2Upv4zc/WK+jv/qBjBqe95X
         +3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246778; x=1744851578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AETJCm92Gaddp7KArrHx6Zkppk0IpRlpsUfZE9LW2t0=;
        b=cHDWsrTBNy+Dcen91eKJ0G6+i5DkMDIyQC6uGUa4cWpnhGHjzBjXFx17v+VxQIfrUz
         9ur8K/lM42GBnu39DASWz/O0AgNHirBAE65Id3kpjaJdxTLc/FFWy6zO0nHi/iHLkWPR
         n2l4L+vwFLQuGcqCYB0TERIv+9mbcOeHJaAFL1G/NvYjzJciKtA7rtfBiVmxcg6WTJK2
         hJWlx5ZvyKcihOfqncX8ZBYt/CeRakJx/xOX1umbC3hKU8N5shb+6zGXN4Ek36Cgwlhs
         KgEp46wbVaAuQIFi8VfRJLAFKoMoK0eCOtG5XxEQ+NvQCm2kGsdED2UQwLahzlMs110P
         8lUg==
X-Gm-Message-State: AOJu0YyDosP3C8TvkdfSo/MQk2hJiE6Ppg3AYICoImSYdWwPdotc6SAl
	DO8jr+FO9YEVpMpIQdhWPVDUxXNOTMkvGOm0NQ46nYgri3l5+C8foqCctA==
X-Gm-Gg: ASbGncsjOR5D/IqKQT/QbvDPzmF8e6D0kPAo7q89mbG4al8PJDXCpHejcv2B3H/4hg8
	U5Ssg5bbRO/tB0kxkpUz2VrU7k8qBV4aScR7KdBrO6iVvG3bOXGSSEQfnU5DxlVQ39guBMvPYsa
	sN+2ZZevfAo1nDu1IGb6H/MqDQE7vXn+H3cLZzgW8/jxlhC4xrceBf/26JfVma5TuwLmCWykTMs
	xyXkZ3i0xc3rDIplO4Wzkd7n90RSLo0exHFHshR050G+tiY7yniB93RvgkCLwLaZd74X4PdVYrb
	F2KNmV8Btqd1HJrUheu0Q0rKzVCq6CNC26uHqhSB0GTwRlvcF6pqYu+aekrJsfa89T4oErhu6lB
	ZJjdJ4Au8M3BVEdG3wLx9jUcOvA==
X-Google-Smtp-Source: AGHT+IHuQHSJS//F0LBuhXq27KYoLsGaxUVz13ydAdOd20CQjtYTmWnqJXqodma0O0CBVkzHWRdo7A==
X-Received: by 2002:a05:620a:4310:b0:7c7:9349:e468 with SMTP id af79cd13be357-7c7a765485fmr117923285a.12.1744246778340;
        Wed, 09 Apr 2025 17:59:38 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:37 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
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
Subject: [PATCH 7/9] arm64: dts: imx8mn-beacon: Configure Ethernet reset and IRQ GPIO
Date: Wed,  9 Apr 2025 19:59:01 -0500
Message-ID: <20250410005912.118732-7-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_175939_886016_7F351D97 
X-CRM114-Status: GOOD (  11.11  )
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

The ethernet PHY setup assumes the bootloader will pull the PHY out
of reset,but it's not guaranteed.  The PHY is also currently
setup to poll, because it does not configure the IRQ. Enable
both GPIO settings for better optimal ethernet performance.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
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


