Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2809E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=; b=3dPXuGNze2jGBWQcH3Y9LhR756
	9ui+8spN+BJ9PnCx/q0FgUYjeu7AsKKeWI5LG8e5adCFxJL7DR3am0YQrXV2c00YC1+WARhYXccts
	XEtdnKWQcEQ/wL4LYa8g9Is4JhwmMSNQPSvnjDcHpjJ1wnmVFygIoPOwQzfGhmVd2qJtlnjDVaC4p
	eZ5dF2+pZ/H337mSUoy+ZXIKDBAcf2O+YDO/EGf2dGjku90s1ASmpp4iJT7b6dLtS1+TTGd9mWmuJ
	+z110hNr5crZJZ3srl/cyRVWS7KWrOqDx2wRl3Ls4Dj0tEjwIhqctjTb4z6l/E+5aDrDcu9/pmJR+
	sU70vP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJABN-0000000FkPH-01sC;
	Thu, 05 Dec 2024 11:38:09 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tw-0000000FgkZ-1Dvh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:09 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso161682466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397607; x=1734002407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=;
        b=Joo4TR5juoxaJK2rSdIYR9jSmS1J66dhZ83H8gD+sQkCzMDuniyh5y8owtcFgDuohH
         GQgGoqm+5vXblx/OKrr0qz9IMvejJh5f7zfPmC0PlR8rCk8BAuETSQOTeRGKRBUAAD9J
         FdMs7w4MmctN3BW4+hYXzGeK+YcCMks8EGEBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397607; x=1734002407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deJRTkp3cj8LQIAgwHRGE8nfXmDlGN+dwLVOnyJ9CpQ=;
        b=m0px8vZ7J8q5NsuQ7IKbFgBov3L0EA6ylkCdg2uwAhMzEqu3Pz9/WjOr81uXAxpm7Y
         sOePlcMmhME7AYGc1Qm9sSDCh00Qh5WuUxyM8NlyjW4VO2wKypMPz+eAEiNLiL0AO9wO
         ZucamHPbQ4z1av69eQG2e/F2+Z9lhRTePyc9oY9laYbX+Mv8lstSHq1Azzxh6FPXmE39
         Y50qsCYkInHXBr5nvzZ3EP10QnHb0ISNNKInn9Z/bgEdQftlMa8FKQ8xaW7EXEveLE7x
         8bibKtVStoCjBaae0K3wMHwpd/tz0ImcTBVixr1Uc7iiIW7IMPwwJb12ZRBBt1cUBEpp
         wLNA==
X-Forwarded-Encrypted: i=1; AJvYcCUYOXJrKrCOhlNaf497zgSrU7zhN87HFWTWrHRnXsDvNvV713mfD1Am9vWFMGc4hs0GjxQAeqvVpZkABJhn52l8@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4hT/ldB17vg8kRe6hSlPZGkHUWS1kvXo/eCR0RdnULpHCHYW4
	zGrn5Ome4S/aQma442sHgWuT6y/DnN6wG37VqXSK2Wqrpe1HgssosYHUEn2TOpY=
X-Gm-Gg: ASbGncv4s8b/tI5rapgzF3H8P0aaer+XiquHVVD+mm7aGJHov7LQ5afBUpwR8FqmgRO
	Aps5jrycYmu1ED2b/o2usF4g2MIuKGNOC54XRgVdmtIWx2AUzyuNxNb4iAC7G9Vm8zR0boJeBtb
	1K8d+asRys8PLVl/AMlw4ufQcF8ALmj8LxQiy4OmWI+uxZJxItJ/jZ2VH+aQHRq1wn8WHRd4a/n
	yYdVQWv60eJedYnSr3nOTgPsWnVLaBou00gv1WeDRYHObe0Srf94r74dt2AOKvneW8ZITAd+HGp
	/MtmIG/tFR8YofsFMpHtWYig7PfwSBhuTJ13075jwQKT0Q==
X-Google-Smtp-Source: AGHT+IEDfHJCy4mKgveNLG8+12l0nNuJTsz+6IEw9fSTRFtpyymfLeQoj2SsxUuqEuLQtMZgkWDydQ==
X-Received: by 2002:a17:906:328f:b0:aa6:25c4:7a71 with SMTP id a640c23a62f3a-aa625c48787mr161327966b.16.1733397606942;
        Thu, 05 Dec 2024 03:20:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:06 -0800 (PST)
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
Subject: [PATCH v5 17/20] arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
Date: Thu,  5 Dec 2024 12:17:52 +0100
Message-ID: <20241205111939.1796244-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_032008_329419_7998264D 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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


