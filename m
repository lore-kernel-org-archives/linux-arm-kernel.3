Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C16CD6E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfF+RXqoejGgiWqoKcAHP3fk5A5vKuoY8Cwpe8kKlEI=; b=4of+TVw0gZcXdt0rjWHhdwxHb2
	kvTmWXCHICi2Md9s0Tt4Ouk61nL79hbO1JvcncAcKbisPbcISaqbAozfzqVHhM/gq8fKSeTk0vH9S
	Ryxp+8GfGNwf148Mk18G9m1zvyKnpi05BOmadQ9fWld73FrjKhPgMZCNj0hzQ8vmVLLmK3PfLpwLV
	jzRjAN9TH+UEDAH5i372CLh9pwBBAq7O9jSAGx2d9LGQSPAiFrEx6uENi/QKpXLBocZay0qzvLXs+
	LzCZTMAzVzEuMQq7sSaLqoSN+3AaK7Dxw3ZEjj09u1SBaIJayYTj3O/9H0CGqyW5n8XQhKJ0sbVBm
	ok+0Fl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSupq-00000007E3N-0eA4;
	Fri, 29 May 2026 10:53:02 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSupi-00000007E0R-3PCX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:52:55 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-45ef42dfb26so120148f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051973; x=1780656773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfF+RXqoejGgiWqoKcAHP3fk5A5vKuoY8Cwpe8kKlEI=;
        b=IFHMvFOfX5Fnt2ft+NzmfQwXX4b0vgOrOzf2jbfRZLZKEdGfNoxpQMy/PAPBU12lan
         OYWIzfj2MqrU3sOa+57aly7Y2VbbwgD6ne+J7ncyfsvPvonmgqeBTNOIyvjgoUUKmawy
         MNabtEbEjWQgWJhpnfaxw8GZmTi2fEWPAFpQbOn+TtstiKQosVsRldvYPe0UGgymnTv0
         8N+S0L8N6GTKrZTcjcC5icJJfB8AfksH+zlM62id+2YT0EeSee4lPTDjqwV35vA+FM5g
         xU0q8fuGeNVL4BG5wCIK5G4gPtMI8tiGfOh162W8EC9/IEvwBcdmIzoxL6Be6OWNkM+K
         SorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051973; x=1780656773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JfF+RXqoejGgiWqoKcAHP3fk5A5vKuoY8Cwpe8kKlEI=;
        b=bwGklUj2muznec3qvVMXgzSagBbfrUHrJAxcOxTIz9S0bnTxU8NQQihNQDnhvURc2Y
         B4jJ/fKA0lk6YsznW9NG744TgSUbtC5YEE2JbM24622FUJhTcyvtYMFM+n2dFWTK7svp
         BhVG1c9cN195FkFtIuTEtT1kc+eKjLhF/O2v4HL1U89If1nDfopGw5RyCQJoa1USGfY7
         0xWhEcf7R4SAy71dWJLthEIwMdCAlhVsHWI1bmKom3893RkXqFcH7SRnXGcp3zVP5dZH
         Gs7L0n2MWMkSBzvgvD7awr00Ij3p7Ew4ERfDejmxFTnlGMtW6IYTBVWZ8/WyJ7WBGbJg
         s3gg==
X-Forwarded-Encrypted: i=1; AFNElJ9ao8CTbsWr0qN/6ImRBEj8PQFyXVz2LBcro0VAyp8vFPVBAtKxzQLKX0iUwN6d6wuoxJNSefem7moXYchJtx8p@lists.infradead.org
X-Gm-Message-State: AOJu0YxUbAQsr4KzShGK1YAiKRokNYggC9OZHPz+zSHjFcR3ny9ayRS2
	qdACVRtNV4j9X0QKRK/iSj9IjgPRo98r8Gs8jtB1OfYN6iZA/QFiHEn3
X-Gm-Gg: Acq92OFTSysfNCuUr79iELIO21xWYeQ2KVcWg6d7uNOfDBvRfuB46BJkbyudvHWLVoY
	Wh0FVF2jCxV0hN8BbcxOKVw/Gmg6Xf5vsSMAweFou4Ti4hS43Lrx4q5sDbRLLmE8QoGgyG4kT4+
	SAs2c2fFWl7AJZmN0nfnNB+vI8AnAjNXdqC4YIyOuOb32FOm2WVowbUbWF1mDI73Qkwh3zoNNJc
	RhtBy8Ky9IT2vKSymGz3t50EWr5xxn14ZYk2ExmD0QYP0UE8Z3UI4L6B+mQDS0l79HcMUd5vCdl
	SoMJQwqmz+tNn6fIlpJZ5ErZcOOSPX2Mj43gt+fwkHdLFYvoXPOaHZbcTXxuvJbWF3PsSCHOgpt
	A7SgLWiR5/3GKOIKvKoaC4bs4seb0+OaCtBOgjudfJfF2neRcBQFKuKDymSDSd2K41dYGyPcOWZ
	Wz+Y8mVdnJHrki9RPCD8z/EpzGmosJ7Q+bZtPP2vaoxQG1L/nt/69OrWthk/kf2bjZVWG849Zo1
	MP4zpaNChmV0fgqOWsTsIXmNEnL0UfxyCnzxu7igHYNeqs=
X-Received: by 2002:a05:6000:40c5:b0:45e:ec27:b4ad with SMTP id ffacd0b85a97d-45ef143eff4mr4491582f8f.24.1780051972829;
        Fri, 29 May 2026 03:52:52 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:52 -0700 (PDT)
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
Subject: [PATCH v2 2/4] arm64: dts: imx93-var-som-symphony: enable UART7
Date: Fri, 29 May 2026 12:52:45 +0200
Message-ID: <d7cbbae223dff7ad797b715d34eb79db9ee54203.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_035254_864571_4BDFFAB3 
X-CRM114-Status: GOOD (  10.31  )
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

Enable UART7 on the Symphony carrier board and add its pinctrl
configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index f541308ebf6b..f313f168cfb4 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -35,6 +35,7 @@ aliases {
 		serial3 = &lpuart4;
 		serial4 = &lpuart5;
 		serial5 = &lpuart6;
+		serial6 = &lpuart7;
 	};
 
 
@@ -310,6 +311,12 @@ &lpuart6 {
 	status = "okay";
 };
 
+&lpuart7 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart7>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -446,6 +453,13 @@ MX93_PAD_GPIO_IO04__LPUART6_TX			0x31e
 		>;
 	};
 
+	pinctrl_uart7: uart7grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO09__LPUART7_RX			0x31e
+			MX93_PAD_GPIO_IO08__LPUART7_TX			0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX93_PAD_GPIO_IO18__GPIO2_IO18		0x31e
-- 
2.47.3


