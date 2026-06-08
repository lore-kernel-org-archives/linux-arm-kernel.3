Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF2FCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSdVweeeqpqUp22S7ae+ncZRontrBojNHEK/UDtT8bg=; b=rUtKFPbWjZn3BdiDPHQ2ufI4FP
	Us4v61KBXbfHdGJBABUYRDfj499kobc8Cn15Rw608k3ypBf58ctdatevQNWvpIOT6eplS/hliNoPG
	IWBVq3tfAxUhfcJFD8j4n9xm0/D+Has5ccmnz9Aibm/jc4xTL/3/Si2egrDoZKtlpQNKZr2mmb9Io
	/V9SfUn1IcKcQGTiAzmqDmuRRFVJngTdnDAVBN9Aqk9Acc9Cl3Orj7s8yn7BEI300vx9uTl8GMWh5
	wcvIvIz29UVFw+4FKnC8xZdasrGyi+WLn/xGY2PMYy7aACbQc2S1DR5mTXVpmfEZARdlOueP21GNj
	sAIjDzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAf-00000003oQd-2Rmw;
	Mon, 08 Jun 2026 14:41:45 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAW-00000003oCG-1uQA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490ac357c55so49559845e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929695; x=1781534495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSdVweeeqpqUp22S7ae+ncZRontrBojNHEK/UDtT8bg=;
        b=gb6/o9q4iHlUbo9GsaTkC1x/x+9t9WkxtGIzMGARz1POyCImb8gE88ZYorNkU9Vqjo
         G3K/dVOggTqh1GMWJcTBd9H3ehRovGUBviP1vpYXikHqzwKjFkqcVs/q2FJ4/NLDJMHu
         ELGL88xIsEpFIkjNyRhu6JDCnVUIR8mMX1hmTaVXmow/QbiA0mFRtiuNYHh8HSk74/SH
         dXCwEMlIj1vSJlds+NTPr7hpkS01of5ZXUmLpytVGwhA/lpERKIDUaAmwggeuJa/cP2/
         x1aevyOAEdoU3QruGnzXlm7KCZhL/pp9z2cTPFWPUztSEdIIA2RQBAI8VnPCia6k9gvf
         tI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929695; x=1781534495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YSdVweeeqpqUp22S7ae+ncZRontrBojNHEK/UDtT8bg=;
        b=fdKFpccnA8+vPoiYHE/F0/3XSNR4L3Lurdo2M0bKJZmoQDQRlxzSkaf2yjyuKkBGYx
         /MHs/cPMkHrSqL2JduwXjeNppE8M43JhPneu12uRwbe69DFb/unjS0SYozE8AcwEcNu7
         PLVi6NEUurUrb7Y+aZZvmj8Luk2mX1QNEuE1Qcc/XL2p8Xb98Wd+TOIzLgNuPHgPDjto
         99LWGe6OErLPl8vCgXgOuxhJK5RLHvU0o6/D9Qjp1TveLbSEjvgUcqwLQlpNZnBnxHKp
         Ph7RGOWLDd1UQwLK08kLXCwV07LPY+aeZVMcNTwxKVZyCFi7iWYVfbzDHlk2clo0S3CO
         WlEA==
X-Forwarded-Encrypted: i=1; AFNElJ+p6UKtXmJBd46FV8eNSBbRzJUOwIOJlvOm8fCuFHL+lAy5VZW4vI2fAL+RYuyMENC8U0SDNBMlXx/Iz3hS7ILm@lists.infradead.org
X-Gm-Message-State: AOJu0YxmLOn5VnLxCQBCCo2BL9XFizH1hqCd+LMbn+czyppRtq9c0T4Q
	QKs0oDDOgkX2tEisipZ9xW0Xcglnk8Nc21UTFu0cgBhPVcrh5a/HhmuR
X-Gm-Gg: Acq92OEa+NUBXMgra1Lks50gfDjWfCbdPxoRUft+5VgbT5ActhJ+AnUpGCDoLbqGO+Q
	6v2yaUj8HSBnqRSiyJjocsQ1VL0Pj+7Kw3W8Leo3wvmZDmSr+VvYX6B8NIZdoYLLEOTGhla6yuR
	gfdDymiDwmkwnHBD7MhQwsNrqCo0BEYIVt7ZXcP7uSh12XsTiMWDdT3VcNgGn89SKixDZbiZ5tg
	+IAgM71Ymw+3fqIrFsxVtQrERQdmK4PsbxcNUOhsdHWD2MIozoqmd2btwoGMOUjJJnSfl2dzumr
	GwFZSQ26ClgW1YH4Vu/BPfyNKXPMohpGJDxnoRZu2bV2UfG5dywsrQdFkM3wCKB1bcjkTidCZFC
	i+gIyVaTL6X5CVrwLP/CGHpT48z5gAQy4hydtpgWKVP7MRa/ZuisrCHPyudQOc4Ss3SbuBqNy3F
	QBWZ3eTU/qTeMVUh8Kg/NY9KPpvmJtZ7EddcUxZm4iQt9M94B5JQ7lQaS/eHosqiW72V4ZlYaHn
	LJFikx+SXjCfraF9TilCQznfa8v2XKpGTzMJaC3FOwhv3L7
X-Received: by 2002:a05:600c:34cf:b0:490:b8e2:6380 with SMTP id 5b1f17b1804b1-490c25b1243mr281916035e9.12.1780929694545;
        Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v5 11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Mon,  8 Jun 2026 16:41:12 +0200
Message-ID: <909c174cdbf73440be3ffab5a7a2a60343c99940.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074136_541296_6056C890 
X-CRM114-Status: GOOD (  10.76  )
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

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 7f5109bb4182..54cb5725c4bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -247,6 +247,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -400,6 +406,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3


