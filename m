Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 401EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWWltOfdcU5pE4GXibJ5kTc/Rstivzo5YwiD39mqp+c=; b=wEaaebs1M/x0kiRIyL9mlyLvpM
	D3eFxwv14ZC+WHcGqJ7jbwKwWnd3lBYZ1m7aLi8zdjbsGMZFmttRFWLCPPa995EdB7rdkVvwzD+Ev
	UwVtWhjSgIm/wZLbVGUfFtUfMb+HJn30RZKreVmkLKIgLpPzXSlXtrkL3LH0qaTxutHH2JL3q7haM
	yHLkDtvitEFda3M90Gy7OWDrnLhlvMdTTfvtGpvAT+wpMIe9HYj+hEPwYKtmMEAirlsBcj4eRKONG
	3R54PopsSAjQMVfCUZb50ZrxJYIvwZSBs6OB8A5YICe8LRZnTytirZxWmoQ61D3A/m9iR8a7BwOXv
	bsvY3w0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXV-00000006OLs-19y8;
	Fri, 03 Jul 2026 08:46:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXP-00000006OBo-2pDN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so2386195e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068378; x=1783673178; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWWltOfdcU5pE4GXibJ5kTc/Rstivzo5YwiD39mqp+c=;
        b=LGg9lZmvzZT7HPc/l1kjLHDuC64hH11Qv5hrA5kogb75/E+1O70iCjnoUJWrtfZglz
         Js0iyWuzsbQThQA/QpoBEEZh1+NmIERGuvOYM7Z6hjhZHWvRzG0Tp/wsDlwHSWLuWLCx
         IBqqpfq0KQeJpmWZk8joSHiyyLxy/zewPbvbSiG2tSv17J/x+ektcPoR14KGK45r3kxd
         OvF3yCKcThIUA3uD0uVdbGYAlepAVx+ec0qafPuc0+X+abihCcp6EqceVyvDgWW0Lc5A
         IOnGoJ9a/UwNFWC57yoKE+grTAyHia5JDCfd7gd1F3/Z/kW6B+Zz1WfoCmHaU1bB1NPW
         D7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068378; x=1783673178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWWltOfdcU5pE4GXibJ5kTc/Rstivzo5YwiD39mqp+c=;
        b=J5Jov8WG95EvE5iJAQffKq7lmA1WCPin+ZM5wHjbdYLZ4WsNflGBjsop1SPSPuhw2t
         2MRvssMvgygiZOH4xrXAGYzVH1JTTdhVchNR2wnm2A/QhUhGR0H5FVoQ+s7E54/85CKt
         iEY2JqE1MF4iJptqi85eaqrUlbZjqSgrcIcxbDJTWqMLhPuiZTcbKZO53kVvRfKbWJ6e
         R6Lfzz8CnNTwLVXflg/WcTrrFHTdv6hx0MazvelZLPmWXi5hA7RaUG+bwUJMk6f3iSJU
         ylScsBycwbQTSWompt4nP32+W3t7am14YSZu7NKDqFwkZWHYiLBk262mzCLuJyrFfcA2
         Voww==
X-Forwarded-Encrypted: i=1; AFNElJ8Rx0FNUodwRg94hL2EVv5lhpmgSiSfLXgttOFfdxMaJGxipK35uxbzYeonCJX08f5LsxG7UJFKtY616GSLXhLl@lists.infradead.org
X-Gm-Message-State: AOJu0YxN6MDF6zj7mQwUhL4qpDFtlUnFqh8MNOa4GfulXDLMOxvIdCAP
	SdhJlX/JV2TTsgq8Aetvfa/6Z7L5bjfr2frD3K/Zx0FXJzYrzVhUyXcf
X-Gm-Gg: AfdE7cnqwBh4/5BWfrVd3ZV29jt6t+DOg3Br12Rg/knIqI3XZaLuudx3trQAuUyoMv6
	yyO0y+HjNi0c9E0K6hG/TIkl2zpB8wWqTisOaAlGVgp2/BHdyYki6zPPqX0Q/bhAwcwq5fSC5Ok
	+1sJHuLZ+gPnrvMHJl+3m3VnCABMt4o4uv7Gmn8c8RLx5ZusP+2gAFRqEcrs72DOYErSuav2Vr/
	Q2Y7opDlYRpRft8HI8PcakqEjcNXliCNOoberLiP/Mf57EDltmZq5Orm2lRZIEfATYsf7TacsSk
	OrAfI1r5Jh1KhFJWZGO/mPbK6W5TLq+RUdI585ov8McUh/R7R5je/ZUBL0bmzleUwfTZgxQT+No
	e1xUquP4XFHFuQK22jXgQCPzK7UnVCKuyyXtZi5kWMyMyNghBQJ8i/wO+BOIt/gCkgDx/X6DFPq
	WHc3KlPwJ2CAU5QRCNKfYQuROVMi6JV9Rzi2b0WNlrocTwOt4JZuBRGxoYu6mgYtVqJtczJYDzL
	otODM3WkN0CbvX5xEs8kw/c+Q==
X-Received: by 2002:a05:600c:c2:b0:490:469c:556b with SMTP id 5b1f17b1804b1-493c3cd9c2dmr74057675e9.12.1783068377769;
        Fri, 03 Jul 2026 01:46:17 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:17 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 09/15] arm64: dts: freescale: imx8mn-var-som: enable FlexSPI interface
Date: Fri,  3 Jul 2026 10:45:56 +0200
Message-ID: <858f10730612e0225b69257eef833c3b84052ded.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014619_745768_F277D15E 
X-CRM114-Status: GOOD (  10.10  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the FlexSPI controller on the VAR-SOM-MX8MN and add the
corresponding pin multiplexing configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som.dtsi      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 0abc2d33e711..259d9f36f8a3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -176,6 +176,12 @@ ethphy: ethernet-phy@4 {
 	};
 };
 
+&flexspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_flexspi0>;
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -456,6 +462,17 @@ MX8MN_IOMUXC_GPIO1_IO09_GPIO1_IO9		0x120
 		>;
 	};
 
+	pinctrl_flexspi0: flexspi0grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_NAND_ALE_QSPI_A_SCLK		0x1c4
+			MX8MN_IOMUXC_NAND_CE0_B_QSPI_A_SS0_B		0x84
+			MX8MN_IOMUXC_NAND_DATA00_QSPI_A_DATA0		0x84
+			MX8MN_IOMUXC_NAND_DATA01_QSPI_A_DATA1		0x84
+			MX8MN_IOMUXC_NAND_DATA02_QSPI_A_DATA2		0x84
+			MX8MN_IOMUXC_NAND_DATA03_QSPI_A_DATA3		0x84
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
-- 
2.47.3


