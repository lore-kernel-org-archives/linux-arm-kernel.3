Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B56CD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lK0+ywjBOh+XN+VJoI8pFkPksQ/EGbIta4VIkH+QnrU=; b=XqP5NpzieNxFbePkUtN5MN2DBN
	7kLPQz/YKh3qwjV1UrdK5iaZfhftHub7fdaLQkXHz5J4g8OjyRKsuOaf5kP7q1qoomsmyV3fb+O+p
	n+yc2cAt1c3HH4/HAbEhX/NXQNXGpkmH1KDgwcRUIMqN9E1tfMlDdTwSnAd/9W2Exm1RZtG9WHA5G
	uj66T/lqgOwGba/aqH8Ar6nwWHmhjGC9tZBNZ58bmFBD74yQgHN6601s4CO9+pOGKfCY17r2bNBDu
	idCoqNTRdbOM43FjhJGlljY+dwmHIbfNL4T0zu3gi4KZ/T2dW5naYkEQbGHsqsQAec6ALxkY8D/Va
	axf47qrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmj2-0000000FH2I-2uAC;
	Wed, 03 Jun 2026 14:37:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmiy-0000000FGuk-3HKF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:37:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-490af320e2aso29372725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497459; x=1781102259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK0+ywjBOh+XN+VJoI8pFkPksQ/EGbIta4VIkH+QnrU=;
        b=Ekm7uKEMR6c1f0G48U5ovVUbpXaVFfROslDcQH597xtvy20VzS7/YMvf5EuYbROEIj
         z14nGlXacxGIudSX49EmtDHM3/NblYr+WmlhMTGa65gZ2D+Gtxg5U6l+pFR3P2fTFkgR
         IMWAxdiVGU4SM+JhJnyRjNmmEdQSVf5RNSESvVbIE28A7IuNHRJDYixjMLGLHfCcDmaF
         uL/jiS+PJ4G7kDcOxonY5NYfsIVWw5bYPifyCZ7AVyIm1C3/7pTX9lTj4O9SdX9RWJki
         AMN9CTbWcqDQahZRfYSHfFeaKnzA5sk1zRGosz3ufsmNf6BsGrjv4ZJNdPeyuh1mYiCP
         ytog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497459; x=1781102259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lK0+ywjBOh+XN+VJoI8pFkPksQ/EGbIta4VIkH+QnrU=;
        b=EZxmb7K3AObM4IcCz1hfeyLF8CKJApVONMPTUowxtR13+qUQ5mJ8+FOaV7K1qpWR1s
         dazMD4T8fMIUCL7iFBclQjQF/HNL0MO/mwGHMHVPcHG33bcBziK7uk/OR6LoMPvGyHQq
         O2XyeQVw2pIJha7WGgGdQeryRlzr5WSeQRXwP5G1iU8R1L+qMMFfNaNF4V25TQAWCzjI
         qa1KKtE90Pj1f4qFaxL3JdUccwpXHQVNOQ33OD2nOLU9/DGqNeiF/iple4+eBFOLj9TZ
         UYITTy0xgHS2Q0VwwynWVxm7IrvSqMt90OyWiGgsby+Q8hYpW387Jzy95A+7FUUW/tfc
         Lg5A==
X-Forwarded-Encrypted: i=1; AFNElJ9wOcn/061tmR/TKLOuwj9hnBf57ZhmAVBj+41rZyYJtEF2owPu63jw96s/eYzR33J7BabAYwVxuQ828frGMjES@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4IaFiFALBe7SnhUClrOPPxJ2UzGUHlAYFc4YzcUd17eXoUOrZ
	zw6e+qQesHRzjTAYk9BnsnEm8jhjLLrvV6KPHVBRic+8lzsrqjbpNOMX
X-Gm-Gg: Acq92OGtIfTNvdo5tq/emPyF8hscwxD49jz82fA0Gp1SU8C6XU6+ffQdPDPm2Ex+6/z
	/8u/SB8SsJgSaANvk7nbhNMuVzG/7f2Dxk0FiimNYwL5S7yfMREmgJ8p8UYGOA+M0TQaxg4B2nr
	FhwXqaBgb3x3rg/ymWDFQwCWkqao2ar0eT+aTi2C1EndgwWbuHfVI32bwK+aRG0snNPvo+1T/f/
	ibM0usw1GWSeJPi8V/hbb8idsO5d5hT8S1C3/kBtFzKeRfvV2EM/RxtzRkgYifxvyPM8OQNNtXA
	NLAuPsbAxVAxbDSxgMVO83MvHw1OS3kOwALKVkNeJdfFf9VU80RObaY5xVAWMV2+akQmBsM5Rxk
	tE/JBLDMnCg+20nT0L845duYqqGE0UmsnwHnC66IarHd4b5GSXtboh700+CdP8uvq+HlSrl/3IE
	+owEQlzkrS4Gnt3mHN4mH8XineqBUKSwmy8RmpL1jw7a0Lgsl0H6NJd9f7CmQCdYh4CfNBrBnde
	cq/OAO1lGV4+hbnhet3SgBkmaBzQq7T0LVtzBFJJ2pelOF+
X-Received: by 2002:a05:600d:2:b0:490:b99c:9337 with SMTP id 5b1f17b1804b1-490b99c943emr39485645e9.10.1780497458788;
        Wed, 03 Jun 2026 07:37:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:38 -0700 (PDT)
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
Subject: [PATCH v3 11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Wed,  3 Jun 2026 16:37:18 +0200
Message-ID: <04c8d4b2d184c210d24a0ae40e0eef7d47101c63.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_073740_844558_EC3F3A26 
X-CRM114-Status: GOOD (  11.07  )
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
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 06d8dd7a5b54..28424c2405cf 100644
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
@@ -399,6 +405,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
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


