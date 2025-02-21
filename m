Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EAFC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 19:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=; b=DxzhRDgd0wr2hbtSNbpz+YeNs3
	K+d8on3aLwbGeyS8Khpb+8QcGlSH2FiRry70gMKJCRL41XSZIaVuaG4d16iB3R58AbLyEW3MjMkXk
	V6ND6TYxSggjiWIQ0c4BiG5hfB6VhDgs6FvpSOIRdnYaq1LEHAr018M2apW++TYv+Ok01k0OX4FeN
	Go6XPPaqYY4K5jyEIsVAM3r5HizlE2WhgckkU2lSbQE6/j0g7xUXhDW1rgo0N1Y6F4QmsO6445/N7
	pmFXoXTAWqJmsWF2+nb3+IEepVCwNlVpPM9Mt8rlBW15Boq1arOgqojrF2gK3qv4mVyiSK0x1M5Tt
	IfQ3i42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYVM-00000006cfN-0IkM;
	Fri, 21 Feb 2025 19:16:08 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlYPh-00000006bWP-2J4B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:10:18 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e050b1491eso6207878a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 11:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740165016; x=1740769816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=;
        b=UL6HWjLfSIiGonM9e8GAUtp84GxRBbKfrxbBnIOHum7pUH8VjSsHRau62FRqwJEYB0
         2HSTpmJwinUV91f6Xy7yrOO34+rDXOsQVHZMWLn73dR//opXLbIWSWWvcPobdLiTAFFS
         BGU/wVZUv0GyqyPCUFkKol/9NbDwEFse9X3PQmP7PZa5/KY1uT8RE2mRDRrHNuB2yu5C
         aKOs9+YGSPHG4pLHGynujtEGp3rEVn/h5dzCjJLX33xougtcPS2bpTxz3IKRPB9DZplG
         iv2zEfuJgpkh4ahWhcX4V0iz3CHKKavLHPoE9Tuyp4oKZjlreaq22/jWGOsZIfbMYk3e
         xvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740165016; x=1740769816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=;
        b=DLaRdQUw5hmkUuxYD4ZmAurDMPkN20uhVOw5wddu4MJb+A1hrwzP57NrtMnrJTqJgj
         NZNvKwu/nyna+zjU9/RLpOmgGiiX2eGXX6EMtapfqbz82Eg7b/lHptUstBHcp7J8YvTf
         JIfwVYvHNMzzAiAbrdcBRNr1093qLmE4ADFzsjaFRKyjkfYy6hxmZgW48ggkbOF+mYsg
         1MpQjSVa0U7mvPdvIHbwb8xXnNVFZ5Z+4+vRw3jzCBWlMeOjeDMcKZEKGE7v+RKyI1OS
         +t5FMTk7wnsY8IeMK8GrJjr+MhTlboD1Sw1lDChQoEfKCR1qvmdOMCUJVxH5HWETDny5
         LOVw==
X-Forwarded-Encrypted: i=1; AJvYcCVCYzd4cYOMyD8ijmzeF//7yd8z5MTJY9sMpki61+NHckZCFX+jIDzoj0mEMERvLQgtnim/nMUaKVM26Ir9APtA@lists.infradead.org
X-Gm-Message-State: AOJu0YzKfiPILYhg4koGgiqkPwhCeLpy5Vjmcp7deHGR2RDYQdV/Toe/
	DXv2pDlWsbzZYkdHyQPgeuu34/CbP3I3m8kaCJAglp9zDXrfBFP5
X-Gm-Gg: ASbGncseL2t7kVIBD/2eOKqazgK49ME7nsmfoUGvGlijVjAeCP24/rzFKFZJQLRJ8S7
	ZcoCbF5bwCvN9q8e/sSBoWJ8uYUJ8Ny/S5jN1sPmx9pRULZ66nYLyM8R3mTyIIe8KAItd2aovhg
	tzv7r5ZByxEle+UV2ArUKHHW2msgyDEgI14ttEjF/7hEMQU+gLDI1WvQ4nET4TVaN3hth+sg1O2
	dTKqOJ261FcASz/TZLCoZJpyniXABQ9No+cSKlCwzHa5/nUvIamsaQiPGXyOppw8C5Bgqm8G6sM
	xw5RwuKzCeuko4UofcuvFE0S1MXxtJwlPe8CNqjLKNgPO25cj5XBTA79NsU=
X-Google-Smtp-Source: AGHT+IH2yYVlH5R4OYQQsbx0L1fsjd6ylbWYVx6pl2giZCsE6+FEB6nEzzNoq7LJ9eixK0JAOpFMOA==
X-Received: by 2002:a17:906:308c:b0:ab3:9aba:ce7d with SMTP id a640c23a62f3a-abc0ae1ab4cmr359498466b.1.1740165015786;
        Fri, 21 Feb 2025 11:10:15 -0800 (PST)
Received: from playground.nxp.com ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9b187203sm1027261566b.61.2025.02.21.11.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 11:10:15 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
Date: Fri, 21 Feb 2025 14:09:28 -0500
Message-Id: <20250221190929.31469-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
References: <20250221190929.31469-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_111017_589018_4B645CDA 
X-CRM114-Status: GOOD (  11.20  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Needed because the DSP and OCRAM_A components from AUDIOMIX are clocked
by AUDIO_AXI_CLK_ROOT instead of AUDIO_AHB_CLK_ROOT.

Fixes: b86c3afabb4f ("arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..86c3055789ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1619,10 +1619,11 @@ audio_blk_ctrl: clock-controller@30e20000 {
 					 <&clk IMX8MP_CLK_SAI3>,
 					 <&clk IMX8MP_CLK_SAI5>,
 					 <&clk IMX8MP_CLK_SAI6>,
-					 <&clk IMX8MP_CLK_SAI7>;
+					 <&clk IMX8MP_CLK_SAI7>,
+					 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
 				clock-names = "ahb",
 					      "sai1", "sai2", "sai3",
-					      "sai5", "sai6", "sai7";
+					      "sai5", "sai6", "sai7", "axi";
 				power-domains = <&pgc_audio>;
 				assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>,
 						  <&clk IMX8MP_AUDIO_PLL2>;
-- 
2.34.1


