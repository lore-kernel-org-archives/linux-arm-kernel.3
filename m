Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FBFCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oml2/FGrlWi30Gq33/V2Fpu8C4n8TmTdona2QadZTxw=; b=Rj6CqRVR6rzmQtWbaAt25k2r/k
	rUoCjyGkNOqFc417g1d2z5d4wv2MqJig8SjW448H/IKbZQvtGBWw4b77MfdpZXncSK9T6m5YcoOxz
	3YwtshTgEfGehKRe3j6w5DFRqQ86KtAvUVi3BgYy4wIdRkhFiqjZFnea/KPpUVouLMd3xJ/W4qgP4
	JBmz/rcjFwaMXIMmirokLR/WYka6kOTwALDoJuTok/6Vi4MNI/BDYwrgFAvSNH9LZQ1R+1hdKn8Bt
	zYPgwgKMDOXcxrayI+ujxjtlh/1VaO2mfmaJmUCGTy8v+QluND24xFAyqEuKwltHmExF2DXppVU1X
	KYAdEqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAW-00000003oER-2Mej;
	Mon, 08 Jun 2026 14:41:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAR-00000003o7H-1u2a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:32 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so3093731f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929690; x=1781534490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oml2/FGrlWi30Gq33/V2Fpu8C4n8TmTdona2QadZTxw=;
        b=k2MTGcjcWnMtqjlNTlvI80VwghcVwGUo7f/atcC/oVX2QaGsTMkfKe8iTrxIesMm+R
         AgPtLNPY3G01XUcpuOrhmuZ2ixhnCvfS3DAnWZTcF61tA3+vSd6sZneYQW7Brn+H/1LL
         zQTngq8decAbze4bM4Cl2r5NQeOFQV8jr94AmHIHCllJIU1T0Mri1iE9pGPeZa7wJzw3
         d+wkE7/Nd4ks0rKadQq27oeN4s1K1DFAl/JzdDe+p4tco8KYFDygrx4hmFRHBvJ6NGpd
         OqLRvNu1eKs+rez97roAkZWJPOz8/ZqgbTBbmwYF5ticSrHF/yLRBEkqCkpql3q+3gzd
         8lEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929690; x=1781534490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oml2/FGrlWi30Gq33/V2Fpu8C4n8TmTdona2QadZTxw=;
        b=es+dynZcR+VvSJ4nhVUe8zUFQTV3wBCyZCVhPIPWnqcp1uDokKGD7DQlC43UI3UT5j
         HOCQmS6L13sDFa1GMjnNkRQJJdYHyQypoGmXH/C4/82G71aSzpziIDLQIRBRi/RARqNV
         fOlVc9pkWmxfjpxDhUG0Ai2z+Mpla7d9DI1qgl8MUwu7zR2UbOA2wfJcvVSFo9xzzh7e
         XG/xIXo++KVylR9p81y436bC1KcDZyuuKuWJy8wcAxckYtvG1Mf+Up3MIt6YPkc3bkxs
         OyYi3DgK78t+MTu4IZ/BS63axXRIJafXYMTa9v4y90G/LdSZJQZ3HLbaxN/8tqVIWCwO
         A7tg==
X-Forwarded-Encrypted: i=1; AFNElJ8NZQjnDkJbFDEJjAQsKzc9RMEbNS1yPVzOhamucWfJGCqHIQAgOfZFOOrgYhxWK9I+F+ruhBLT8rDT1ujtYK7F@lists.infradead.org
X-Gm-Message-State: AOJu0YwFHmbiPp0tdF5ofxW+w+86yYNwaxflRBuILn5aTYWjG/djl1nb
	tgTCdwsaxWXu17UKlmCcO0hxCUO0mxX40kJgLc2VHZHEL9aEMXFNrPZ0
X-Gm-Gg: Acq92OF6PNtNw2fL+CilBvWYLQhR0NGctvmzpwFFJyaHFz+X2jibOye3xm7PFMH7CE9
	G8gVYluXOR5BeVuwWa0Jv0NEWntWaujf7evEfmP0rEN5783pqEfCl99uPHbcEoUyXh/tX4J29WL
	i1PFRZ7vtKyIiz3favVg/23x3wJ2gNopqF7Ir9mue0ypxqo6mNEIE4O+sVttFiViKpNRLcf3/pL
	5eMJBn6FYyMFeb+LyLKjU+od7WQb490cIZ4rWwOy1+gIZr3LEQQLIeEu7LLoGvyNl5uQijSsN7M
	u3RW5nD5QsGug/G/CpzF1SGtGjHRPMApD4ip1Dto/PT65f7cX7hMe8e9XAzgbJ+ThEGZZLp3DbV
	KU9mbn9zcAllx2dMfGTdEME/FZgdCqEBuDqLt2gz//jJ6jA0SyYdO9OkMk04HhdcnROSgdq91AR
	Ovu6XUh63hFPhITG5Q+TbuJ4ocRIGtTUseNauNcH3uZwv/qlJEhQHa2JP6+2Z0T7258ZAwoNjLb
	NMSePQHrOGpnflTyZhsm961VH+dKFY7KmU8Q/VX1Hy75ibz
X-Received: by 2002:adf:f911:0:b0:460:24c1:db8 with SMTP id ffacd0b85a97d-46030777545mr20410603f8f.38.1780929689827;
        Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:29 -0700 (PDT)
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
Subject: [PATCH v5 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Mon,  8 Jun 2026 16:41:07 +0200
Message-ID: <26b5b602c3995a5a74f64b84576ab4d54ace23ee.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074131_558807_3BC6F4D7 
X-CRM114-Status: GOOD (  11.01  )
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

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - Add pcie reset-gpios instead of deprecated one

v2->v3:
 - 

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index fdac4ceb4c19..698f02fc39a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3


