Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFB1D49780
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/0iXUlDnHB4vmCkCvqYino8rMZyy/qKapLkvYLstbs=; b=St4eTajpA/D7vKDiy12T4j+6SE
	VFLmgjaucNutifJEWAg6upFl0xcghwc230UkFOg2oQBLruwibAoUV0gpC3iX8lulUd5gsTJsNPpQR
	EhSqmbZkw16Fy0/sf3F8eut0qC4J8n0u7x85OQz9a420/h496EevDduz9ZRPyYhf9KAMI4ZihRVp0
	Zply8Rr/6mVyDcFoo34yUCpCIFxQCgDYEUgZ6CfFUxvDWAJ+eg4Z25KJnW3dcQUJ2aS1Al0jEZ9QZ
	noFpouH1+MDSdvRxkO9dlrVV45pkZK6JMeic4rMsl8+9c8y6YceF+sJ/efzmnhxizpIYbrPTEDO5P
	5ipMeqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoGq-00000004Awc-3gEL;
	Sun, 01 Dec 2024 18:02:12 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2r-000000048ZQ-1TuX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:46 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-aa52edbcb63so795354866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075264; x=1733680064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/0iXUlDnHB4vmCkCvqYino8rMZyy/qKapLkvYLstbs=;
        b=FA24m51QbpiXzR0oXW1+U0STYpqjPNT9NDno9snpI0j2Qtvli84UgGO9vDF+A4eBtf
         3w9+wjUhUehFgOAViOvaviymrtxLxTCs1CksApJ0yG5MD+9AYKJxYX0prGAiyhzyiva9
         NRZxdSLxn1i/82tGVePIVoxIHF1W/lPVKhEPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075264; x=1733680064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/0iXUlDnHB4vmCkCvqYino8rMZyy/qKapLkvYLstbs=;
        b=Kb+Ii5D2RzVEpHC0oQWBcI+AehnZVi2i5T0JBiuD2IQP2lIIpXDiVw+GRJMigUo+0u
         KwGXSwqoDaU+8JjEqn2usWwiRbkaCPrRSnvY6Ne6J4we3/tCxdoxvV1DJW8sU+HX8pl3
         fdtmhmGvQ3vJG1Qf5/kZBumEWCNREJda8EqoSTRtaWu71eUt9SeCd1amr1LQzbnfSEt5
         MpAfO83cogPRRIums15vCf79zeMDXEeKWfL9EvXEn1tDM7CEBThBhMJdIB7ZMgE2H2Yv
         qmGoTtK2TtpTgqyvIEPDYrWfdaUnDFZJ8nnwB6EL4uZxGtrdSAfQ8MAus+6R+FUESJAb
         wJGA==
X-Forwarded-Encrypted: i=1; AJvYcCXRpHhA7JSlAHH2H9IIk/PbuPnkAN7HgNuhNEtbk/IgYpRqujor2MFP1xy5ICL3TWImx4YsVIH2RcfZT/VrXR3f@lists.infradead.org
X-Gm-Message-State: AOJu0YzQ9nzSWK3ueX+URxZXaG5IjU9/YiWI/sMAktnuVvl2zx5g86jg
	Cg4U6PTLuNyrukUmefjtL81zgCPJA0HyV5c2ZKVA+ub+osfVZDbop9WavyMAOdw=
X-Gm-Gg: ASbGncsk6u5Likjs8LoNl3h3LE5Bi1/Ick0Dt1d4mH7atLq4S7vCoYM8mbAFAfmzJF6
	1LAuaKNQdXQTSvttG3NtpNCQ2foed3yl04+qEyBUOSKDUfJ5VHNf5VZV4H4jftX8j9kjJZ+MZlZ
	c5MGhGAmV0ELNXpHqW4QbQ81b56hbbEkffWRxbA4LHqkTu/G7jlO6WVYEqp3oVuoaJ9a4mbhv6r
	JHsEbwN3qjzHaHQX7pJBYmaxZtSN6tsjH0VOSIPKbNz/n6jzkH+yTY15zbx5maHr/Twhkdv9gIW
	N+Ms0gJj3CPRRgtTQWvXjGXxme8F/WYxsIpjgS56O7Hcq+t+tv9hnHi28dnQQHXx+Dk3T0m6Xpo
	H/SBFFkeEA+SrTUnI
X-Google-Smtp-Source: AGHT+IFj8fxBbCctJozB81f2fryKqDo2iAN8X7SxR3YpQJadp6U2uwo7YTwRhSu0ED8hkicMtVTnog==
X-Received: by 2002:a17:906:3cb1:b0:a9a:5b84:ac81 with SMTP id a640c23a62f3a-aa5946e6d03mr1472151766b.31.1733075263673;
        Sun, 01 Dec 2024 09:47:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 14/18] arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
Date: Sun,  1 Dec 2024 18:46:14 +0100
Message-ID: <20241201174639.742000-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094745_387939_1973EF3E 
X-CRM114-Status: GOOD (  10.03  )
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 597041a05073..0b35aecb6755 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0


