Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE21E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 17:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3H13EAbQnYh5KL130M+yAXwGl0WzQAYvdh+BFvfpuk=; b=d5JvQooZo1Ev+vUSkueHWtgx9w
	3xCB5zD6qw9Vl8tSyewTWBXHiNDdhzzespiwairQaEiNblqiIAj/0gdfAvz7TXwUOnKlsrcIAgqws
	9qfVbVh74i0xqMlXAPBQeEPEVb9Djm6r/1PybimRiQph+P0qdxJuO/M85NAYou0W9r5TIyUq1oiqc
	VWNx0fSrpX92GYjNdL0Ticfzo2/kCKt9k94lGlWNW0P+Ca3fSHwapKbYZ3HxNih8QJ+AM3UGcJHff
	i+VlF3abh4bzIeH9l33AzsY682ooeL4yl5kKH2Xm2oXP86Z//Veb3NqgGvxP535hHsCRbMK09RJmO
	ogh7WvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDtE-00000000grO-2pBT;
	Fri, 27 Dec 2024 17:12:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRDej-00000000eY7-3XHN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 16:57:46 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aaeec07b705so497663266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 08:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318664; x=1735923464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3H13EAbQnYh5KL130M+yAXwGl0WzQAYvdh+BFvfpuk=;
        b=HZn/pcuPKoXoNZibncYqmSfQufCSl1kT94cfX23rcahVgAjBicJGes1wcBx+bJyw7w
         Pyv9AgEpH/Xd6+OMqXTxAsPf7MpIYjB+oGEEZMRVVxxFgBTESl6WP1ZZSwyBWnHdTDyf
         pcFcRyWSpfut5nRCdZ1AKQuhe0O0fL5Ylx68E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318664; x=1735923464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3H13EAbQnYh5KL130M+yAXwGl0WzQAYvdh+BFvfpuk=;
        b=kLTaA4cYYpELECL1W9/9mHwBbD8NCxK9QMNSSq2TB4TuNzCSyXaIAVqL7AVwVSFUS0
         HJ5uBegiuStICQ/zJ+D57lQlLYeqdEO1Oy32bZVELg5o2XW7twa/gzlnSI+BCsFyLkSt
         zq6SeWNJkAo2k0uMGYtEMtlsiq1Ndyh1YSN4jwtUous+3Xc2PE22UCLg3SC+X1C0TEus
         eABxkxWPXd5LSE/9y/3snwPuExvxMoLuJrZv6cn0mRwBNriu+d0PXUfJ/t35NqtaK9CX
         Qy9rcTEcynAGXvHxSKr1JvbP7G8FOTap2aZk/Oz9fjHgXgt5XxRUB+5vGBWpYiA6y1i2
         mutA==
X-Forwarded-Encrypted: i=1; AJvYcCV3Q1YyYvJtSyYgighrFRRlRiEeCsDnYiXJaMFDlrUS+QpEX46UQoUA1oB7kypqDHIk9H+qdgEJTGrZKZPSyTbA@lists.infradead.org
X-Gm-Message-State: AOJu0YxJ5Zq37o9jQdG+80Uy/NV0QQTviAKYyiZ/8kAdXbIT/YpFe5Po
	pvN9t8UFlZwHgOA0VAZ0BjvDiq8iDpDqzMhvgHMqJS+JHlfeQidmnQ6hpda7Tj0=
X-Gm-Gg: ASbGncveYdFlz9MDTVvW+ZI1ubFpFr9Xf8fU0uD7YKp1LIkk/yggqySj1q7V7YGaH+o
	pAU5O1g8P0KfhAmaVbo+S6NW8Fnhyk6U5Eh3DFyTJ7WssnKPQDFGWKRpzLvo2FuoNpxhVot0+KH
	JEndVZwYT+lqYNapCAZOKHo5O304ivc0ulK6rRigbnjvSsUchNV9tg450ZWwJnv/SVdQqaMYoH8
	wMMKN2oRMK7xzgRAgtJuwZO16Vtj65lbkQbm2kpDkRoU2OkEq0ObNriC+sYSQApuZmjAWksmg40
	tozE3LM/VQ5SUbco/uepNw==
X-Google-Smtp-Source: AGHT+IG0IOUDjXj7M8HLWY3rdlmEmUiO6k9aRVSVPoDq9wO9uWrUVEvcWB+pKuqU8J+AxzpC5sR7Iw==
X-Received: by 2002:a17:907:3f12:b0:aa6:7220:f12f with SMTP id a640c23a62f3a-aac2ad8abccmr3008858366b.18.1735318664166;
        Fri, 27 Dec 2024 08:57:44 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:43 -0800 (PST)
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
Subject: [PATCH v7 12/23] arm64: dts: imx8mn: add phandle to anatop within CCM
Date: Fri, 27 Dec 2024 17:56:15 +0100
Message-ID: <20241227165719.3902388-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_085745_880376_AEF7B38A 
X-CRM114-Status: GOOD (  10.73  )
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

Add the phandle to the anatop node within the CCM node. This makes
explicit the dependency of CCM on anatop for generating the clocks for
the on-chip peripherals.

With this change, it will also be possible to generalize the CCM driver
code, as it will no longer need the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..68efa77535cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -646,6 +646,7 @@ clk: clock-controller@30380000 {
 					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4";
+				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0


