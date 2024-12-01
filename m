Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30184D4977B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 18:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxJsjMJwTSMPDYd3KHgHpJeZxzAqqmLbUkKQAeNGZLg=; b=LBajbTTQ1wZS3BehrTismHBzlG
	cmR54PP4bonwiYSM5+vcQumB1522FK/SR+YB0SVMs4PYG+ToIfr2AISmqLjo7++uinJBd76IajLqo
	ZueMi/ZHU7mhBsxta5yZr+dgXANAmjgXq98Qb3F6jHYK9zFtlqnLuP+Kq6yb49VJeg1kZ0kJmqqSW
	SfBmp3vJeeJ/xlEX5fNDCQ+xT8x6G00Lu7p8ixZUCF+VhusJiJ3ojGN/vMMSjBuGFz2PHpOYZP+bo
	ddJwDFc9xPqFzuSAAfAtVeRbpCFNFkvm87F8Fg5vWM7L3MkhXbFUnfO7RRK5XyMUNoV9kSSYDig0k
	py9fKWBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHoHn-00000004B3C-2B05;
	Sun, 01 Dec 2024 18:03:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHo2t-000000048a9-0zmK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Dec 2024 17:47:48 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-aa520699becso581455366b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 09:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075266; x=1733680066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxJsjMJwTSMPDYd3KHgHpJeZxzAqqmLbUkKQAeNGZLg=;
        b=h/gkrjoahpufs4MC8zmwdoFd0cbN+ptLW3ML4UCOf4pV64gXxDvceWseG0qrnIBPWD
         o69KWTxHnFgK/HGIOkSrahPpONWovTJI7q36ehQ/nOj419Rqe8l7ayDVeG0elH7W6maA
         LOFoH4LU21Zw0NstswlSD0FsqXDtfcIdAsyfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075266; x=1733680066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxJsjMJwTSMPDYd3KHgHpJeZxzAqqmLbUkKQAeNGZLg=;
        b=gWBsvN25eR9bfGF1PUDhsNKH1aQZ0V4WgGZ/CusVNXDuPqa+u7S4WRI6KeINPfs0cH
         RmjgHgLTv6xMIEfHjU1p9aESOBt6PLuaaQpjE27OmixgksGoVMgfTEJ/1mzwkgyEhWWN
         gA0s4S3CPlXxjAQA/8RmB5p24L3gF8Q/McBVS4JwHqs9rKlU0ROQfBGuuSiBb2d9ISUQ
         ZCDkFp+0P6kQrSLDECoNBulPi+38Pc3s53pnSK5Yd8qTm/hTO6TYQHomESJSs+v5jFzI
         YsJfL2J6bdqRDXda2ritFKX6RM1AWpKEtBk+welYtOzkH1XjEIfh+tfrP7ZPDNGdTju+
         Ecgg==
X-Forwarded-Encrypted: i=1; AJvYcCUt9jTt1fOpwU/LE9qbNuVtmEq83Y/1m9AMHAVuNFATf6oCZUjexrrD5mvw4iUraiXVtG2dGDVV6yyhwsqJLKow@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy5m0n6iTwxemExgif3jWkk87CrkcgnND9fUDnYvtFqAcdsYDG
	WQVvS2zlZBxY8wyBerZxMCROrDeqT3nci9VkQrKiOPS589tAcVh/FURLu2qHGvo=
X-Gm-Gg: ASbGncteStdPDo98LCP3E1I4QDr2/S7GhODo0MC1+OV2fHEv35NKAa0g3vnExSCnfCb
	k0r1lamkiYstqx5tmBWFeJXXkYiKnkqSOrLJwe8Cy8DpkywP0mkgWF2sLidjOADFwOz2ddxN4iq
	yXtiRKpAvlXRdesQSaIKPrnHARjtQPqgn3+PwBI8zBolpdObxG3kLeLz9kDoHX4ljZ8pqOZt88E
	eOOeqktn+O91YPMsdtgSMxWxcihPmnH3ViVvjuFM618SE3LdAdLmWUc4gBMmU4wBWasSG3h+guX
	G+xnJXAFB0kjjlznKFAZYoaBAt7N1d5tKupoZxPfFPk4lzFLTnzcuUAcmOUDQPfDedSQF3S+F1o
	JZmsK/ZbriNoKusmM
X-Google-Smtp-Source: AGHT+IEMnDbFieUd095y2eErzlydo05nTceNj0JCkVkJZiYgYFWL+9eesGwhsPTyw1VD3PBNGdcTHA==
X-Received: by 2002:a17:906:5a56:b0:aa5:50b6:a612 with SMTP id a640c23a62f3a-aa581093a27mr1555171566b.61.1733075265912;
        Sun, 01 Dec 2024 09:47:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:45 -0800 (PST)
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
Subject: [PATCH v4 15/18] arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
Date: Sun,  1 Dec 2024 18:46:15 +0100
Message-ID: <20241201174639.742000-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_094747_271795_508CBC92 
X-CRM114-Status: GOOD (  10.15  )
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

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..aaa179784717 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0


