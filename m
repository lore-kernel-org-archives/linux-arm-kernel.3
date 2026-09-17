Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04091C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=; b=tdHHc/XT+k2u3sKv/uZHt98aMv
	geM3b2WpIHEx3eehv6EX3nixTVK837qMUYyFRp1kaj9LuPFLrkO3l/sgEVeEIc1+4i0EEdqfeJAhx
	Dbdw6WLbp6xNvNAL31zzdHeXZLwZlX9K9hfMRN7yOI8cihZSXTFDqLLnsCmajsF4nqi6Z8qD2Zr/A
	Sdwhqnx91MtTtJWPkUjRt62Tv1+UfzLuw8I0LOizuGyZp4gRnCpCvpqe7XIkgQfmcI00hfGQKnUu/
	O24Xpa4wNEZzzxPh2klSWiEG1fAkh7gh010SJTxg9tHW3BE7TBO+iTNAoAo/u4FTQWBj2g1F1FVMN
	BelD62uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DjY-0000000BdZw-294M;
	Thu, 17 Sep 2026 15:09:08 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DjR-0000000BdW8-1qpG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:09:02 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c2790ccso600293f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657739; x=1790262539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=;
        b=IkjJE93SnYFEl/ZmY4zSy62oSA0LWoTZ2CdIOlshPWqMcgWcTEoefjuDZXLQA/KEaU
         vgM9L9ArYWToVkaj+8Z1L1hSq6HpmO2sDqqGH032O7clT9AYP8bTNTQ9q3x+X0pyRywe
         Fhr0Kj1OaZzzaKGDHu13cvrVaTEJuV+Vn1gdsuBXHV3XxYNquSDmBFgTU9cHnvEU1VPK
         YyMCh/yNY6EBftB8TRjbFlgdKKXpIO3nEe3LgvPfTfdmY8l9IJPbGkDOJsU0K/MCll8g
         KaQJ7qCDRTYin3R93mS61u4jsyBocf0ytJ8kp9Wwm80joNxZUv4NzSwQTWV9KlbGyjpN
         ZLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657739; x=1790262539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdbF+rIH2kuomyDNZ8PZiq5VuqMW/f4lQBUYl1lQH/Y=;
        b=TlviRKbL4S2NU1FvTDDW/ArE0C98JVBuxDUR2i54nRZ0+O24E2g1tc8l/LiGCs4PLB
         nrxBa/eKhUIfoKPup3ZWi1aiiXoCfNdXQyauaI5Yrfeq1lAzdT8oA1pa3wRuoN9yZSda
         jurCnRIvh1xI6Q9pFjsuYwrQuR51C6dsudY1l1t5pg5DK3tnnb7kQUegG4TW/8n5UFWG
         kbuDgEETQVxN59NurLpeC6u8HoinTFnf+xGE/SUed+V1NXt4mdJWFDpXN7wetKXdnlJs
         m5X/qL1y/5euVzkAr5jXpxWqFtyh3+7OFomap+pdumGyH2cb95bKzFB6pKsN/tTWfAtw
         kMXw==
X-Forwarded-Encrypted: i=1; AKwUvBwxqaHpCf90MTVHzWC+AuSPPB3Rulj4Hpao9KY6fZzRWcCWH0YYsedfEQiXD1T4avE2KYTG9GSiSuIneEqSPZo7@lists.infradead.org
X-Gm-Message-State: AFuF++k+Y1OCnImBcNgZmuo3kXEesPNP9utXpo7v9x2bqUw6tiITEbJj
	oeXxi6WpfCwnUROGE+4m5lAM7jQgFzSk2YZKnqm1PYl7++weJpxtfAjs
X-Gm-Gg: AYBFou3JatMlvnabYeym9Y0elu3d4VW0rYwEnRPeXsP9+mFtb86sWrJg+6IgdIcMibH
	CsFlooD6XsBpxBhYIT4wS5+ATlbFIvvSrWk0tNoHSR0ygG54LQFlciYnOSeKRyzBOYgIzqxicLv
	aEoaXebaNyaH42eKZ0zaifU7uSZOdPBF8AubHYFGFc+1uX6UI+0RXRU7rerCU1YLvLd6gEvpOwC
	WB/aDYmc80S2L4BuW5EwwqEhsD4kFcsQAzsaizM3Mtafb5CQvHvYgGjN1Dz5eVrxUj1cBLkuV+x
	5xn2wflc71iw/eIESw9e8Nn2aLKuvN7EYeI378LHhHX+hhr1cIUe3NxUXQM+ivsJD/POrHzUsn9
	w/LkJc2IOvvXP1SgfUxYm66SmUQduqg95unreA/kdDJfbidmmexJqPxxbfT4Q3hmIbJsvE9e5+H
	PWMMfGOFNZk5eZ9sqxWoT/zYpbB31dQR+2Cf6DVTMl46s8fZLCRd+a1E1xVjaCmWraegqWjoB+f
	i0uYOn1GV4hfr8sYwktUP8RCg0F1uf4Y1k74oAZdqjLLJ9DRu+nB1Mdg/FR3mel2qqYrYr1F35t
	gjFu2kVhJVCuCHSkgJO87WI=
X-Received: by 2002:a05:600c:4e91:b0:49d:726:cc9f with SMTP id 5b1f17b1804b1-49eb72f39d7mr165685185e9.5.1789657739517;
        Thu, 17 Sep 2026 08:08:59 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:58 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Ferraro <francesco.f@variscite.com>
Subject: [PATCH v1 1/3] arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
Date: Thu, 17 Sep 2026 17:08:43 +0200
Message-ID: <f155648a50185df5d273f697f10fcd7efb154364.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_080901_494679_2C73D603 
X-CRM114-Status: GOOD (  11.35  )
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

Configure SAI3 to operate in synchronous RX mode, so that the trasmit
path uses the receive bit clock and frame sync signals.

Remove the TX_SYNC and TX_BCLK pinmux entries, as these signals are not
used in this configuration.

Co-developed-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Francesco Ferraro <francesco.f@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 2324063f8fd9..c7a9eb23e5e8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -305,6 +305,7 @@ &sai3 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <1536000>;
 	fsl,sai-mclk-direction-output;
+	fsl,sai-synchronous-rx;
 	status = "okay";
 };
 
@@ -446,8 +447,6 @@ pinctrl_sai3: sai3grp {
 			MX8MM_IOMUXC_SAI3_RXFS_SAI3_RX_SYNC		0xd6
 			MX8MM_IOMUXC_SAI3_RXC_SAI3_RX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_RXD_SAI3_RX_DATA0		0xd6
-			MX8MM_IOMUXC_SAI3_TXFS_SAI3_TX_SYNC		0xd6
-			MX8MM_IOMUXC_SAI3_TXC_SAI3_TX_BCLK		0xd6
 			MX8MM_IOMUXC_SAI3_TXD_SAI3_TX_DATA0		0xd6
 			MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
-- 
2.47.3


