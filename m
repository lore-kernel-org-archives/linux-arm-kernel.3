Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814C0E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 15:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=; b=UwntRMN+jxQRN1eGHgA8Jyalps
	2Z6CCSY8c5IUGbq8v3mOKVKrPg4ig0nFsP2lQvtiWo50YSo1ELsfsQ5uZXarcaRsr4gJ3eqt2gHsh
	mEzrRFfl2PeyNOlrsdNaXKxgJ/iPsORlZW9G1zWB3Ogz7oFeT1VyVmHLpuPuY2fuA+JIUIu+X4VbV
	4Fc+oxIwZSaq+i0bafgpW+IYxhrclgwkTJIpDct5fdWtzxvo5v9ZBqq6hEtlvpDj8k+6dvVydWb8i
	gSJaMPab7bNxiS0N74RpJqNi8J885DBeHEKV6yr6WQ26mf3+SueN6MlgjrfRS4p9sb6hpu3cJfo2p
	ZrmD3ldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuuP-00000003YOd-0QH3;
	Sun, 29 Dec 2024 15:08:49 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRud6-00000003W1x-01v0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:57 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a9e44654ae3so1383548066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483855; x=1736088655; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=ap0NgESN/Zlcwd++tsf/xx9DNCzs+40MRfbL68P+j0ZfdZ0E6Ob4PkqxeLzOdTpX2q
         +86zNLaabFNn1DCY5VE9cj9vBaHUBABiQ/VdfwbzQv2mbrQKctKarA7o/yQTL6JxMTco
         mqhDMcbHWoOC5Upq2ACwCWm3B5I5Jvw4BvLB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483855; x=1736088655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=FNAKk+8/T/W49qkPPMWJN46lE8UHaMKg/98fhO6gq5fm6mtcWSsKRL49AcKo45bwsX
         5uHRqB5ixqcwjcb7gcKpDVyOKLGeemp4QyEoqMDQmj+Fu/zzEX4RvvmC8NaOLIeUtXxt
         ka5M8tRHLCA9vVjOO9Vfgsd8jYVVOp/T7/BSiEUdwhsTQRlxyJHU1QgsrM70zEaU3KCa
         H1/mWP0E7cR4giLoPBRUiYKt5KfZZtCqTFNGSXuox1t/fGyyAnXWuG+wKFlxVC/QodvD
         U2EJzr6mEVCCOqKBU5ePDQej5kbdHLP1knL6QuKdPOcYppjlLskgQ2gIXg2jxGgMCyUd
         85Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVl6OINGM1sjWlR1BzVV04YPbxOU4sNVzs12Q6rgHIOqDirMNqlCPRRlWXryQPvIb4Osp6l9O8+xpJ9d+Noqo3D@lists.infradead.org
X-Gm-Message-State: AOJu0YzkyqrjJGFOaAzKMN12o7cP6SzDopWP1Ho/oiMPg+drCR8FjfBR
	qL95Y8IPjT3WVkt0JhcZtO7hqZRy+2xUMeQm7XfV6c3VGrVV94py8ocz2Oi2f18=
X-Gm-Gg: ASbGncubb+gGlVbrbCGQ4aFvvtU39LILzd9uYF08LGGh6efy2UkM7Q2M2HLpb7gwNaR
	XLoukrv9NofXSZ7zeY7cBnEebuIr7q8GJ50eeUoeVKQJTV2xi91LtuUvQC1y5wuRKlsdbczDlHX
	Es+pJYi2smCrG0e/5KyQWOsFbet1o58DEj2Sj7uato/t3C3gPgxtEzYP7tsR6MCJI8ZmA/v2khR
	7DuoBA2rszrOkai6Gmvz095AtjIVLH87eHAYwC0d1ajRHRApn/vm+pkIY+ieFkq4sPcLoDIhYUA
	uac9UEkyZRK3RfhWMuh0gg==
X-Google-Smtp-Source: AGHT+IGu2N+6ZD25BGmle+g9l4PupNH1HacLiS+Z1hhM3CuT2AA41uFWrZ6hOnOskLaUH72Ls045WQ==
X-Received: by 2002:a17:907:c082:b0:aae:93aa:9ac7 with SMTP id a640c23a62f3a-aae93aa9bcemr2063864266b.50.1735483854672;
        Sun, 29 Dec 2024 06:50:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:54 -0800 (PST)
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
Subject: [PATCH v8 14/18] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Sun, 29 Dec 2024 15:49:38 +0100
Message-ID: <20241229145027.3984542-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065056_062284_02D51207 
X-CRM114-Status: GOOD (  10.06  )
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

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..01013c1fd61d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
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


