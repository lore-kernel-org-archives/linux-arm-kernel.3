Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95354C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=; b=zlw5O+m4caN6YLe6VnlLtgz6yO
	syORCVQZQ2xzDF0+OoOvTqAlDO6hR4TUi4X1eTWSbRRiFc63kBxEXFDV0m8n+Hbop6ydoPV70c29K
	WG2PBc4IOxF9TjnWr5CtyW0LXWl8GBZ+xmNRMRWyRVo06OKH5q4JbIulI7/OSHDndGkww+2j690W9
	QXhOWwNlUXE7QxlV2dpuJXYoDdFk9+N3DjRzU1pS3CT5udQWFILnli9ahiUwstsDGV9JXKJ9UKU3W
	a5h+PrA86K9MAiMa96wHGemqKCbxpdt1qEkWVg98s/em4CscN1X2nf7hdlMCpKiDDyaBOByAJuF7o
	uaLRonXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXjaQ-0000000F15u-2OP7;
	Fri, 04 Jul 2025 16:48:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXj3s-0000000EvHi-3urh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 16:14:54 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so187486266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 09:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1751645691; x=1752250491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=;
        b=KPUkM7h2Yl2she7LzOUb5g4mKp26S7jnCSC3I0ZrAdevZfXotdd6lDrhzl2OSDUbQG
         Oqv19dN5NIajgiNURR/PdY1DDzJxdTd1zkUI5elYPwx0/pCDq51edHvqxn0h40uhq30P
         +kfpRIuV44aIVmVnqBsMm9dzj3eeR6H8QrBAO5S+sqGJOhQieHfOAqJvl1pdhDQTQO7M
         cgeWgDDHOPFvtZQ9JNzgHbBjb50TrpBFUpTcr69l5AoafWG9rCPOYGKRmI7mSd8ZC/Q0
         4/3MB7MfA04lKk2TZqxaPL3gHjmXUqfc4eXjO/QmO5ojxHXkAEaeUipuU7Nm16xjtMAG
         RZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751645691; x=1752250491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDg1DpjdtfK3/pj3Ed0aWvzIW/qZbuuI4Dyv55kxUjI=;
        b=uwLlkk3UleJaoNKOW8sPL1A7P26PLHl1fjep81i6VYWqXx1Z+Ktp0q5CZtSq4/p6M7
         dYyZlkezcG1XeImGIL9kexVLIJcNTWqAgBILqOYCh6JHxYoNFh2kCEeNGbDIA5nndY5y
         I+XjHBlWXi2k7zLQUIZQYFicR9WcC9G2iAzPpHcF2K3TY2xX2sMiLsrH7w02bi+hjRyY
         PQtKHiiE+MZ/NUAp6PnuBpBaTtaWtmKJHerw96Th5Wv/gV2Gtu3AOvcfW7vMxpzYyr8Y
         FSye92TnzF3VyJp7j+A0FV/w8/+nHBOOPQjqFcVHkMNQiHawLIeSJ35lqxI8VYfpBR8t
         dhrw==
X-Forwarded-Encrypted: i=1; AJvYcCXPTYZcp2stUrRhCSUNwCBcSrfi4TjxDfmH2nNkGrcXl/zsvzlCGh7lxtXqSfph5IZjh4lle8KSzXpxxYQ4sQcm@lists.infradead.org
X-Gm-Message-State: AOJu0Yya4jWytq91M97RyZKUaTso5rHKawuzJr9nPcChHuxaWwQV9SqP
	H4mdCCmjAzxldQifsrtrtyx7WGiSuBbXIIibayAWjfuoORh4zCGu6tMRxTRPRv3Yczc=
X-Gm-Gg: ASbGnctPo1PUS21u+vr1k4afugt1+nlVbigOWOMIZlBaYTKmSEyjAbF50UbeXyd6tDW
	8qx/w/fP6p/B+hDEoMtQh0PuekeNTmpJZ7dAphsJr02Hm5AT5SEd3oisemumOdGCjptQ32eb4UI
	n5wTxl6pT35C8yW4I3cxzqUS55yX162GI5BsD6xy3Y+4M/w+5o45Fu4AKCYIoZMcb1MRKUJE09/
	Gx2TgDMWKXIhJYgLjEvTMb0ZzLttbRW83LBB5TFZ/gqEwPPC2wm5OTMWCg6LrGtwaGAo8mnz0N/
	ZXB7+2IweeqETRcIMzDMxI3GxndWfiig2DXTf+43dGhs67qRdHQLWAcB7IMnhThAbg89wZIQxZt
	tTj8HuILp/22aAsA=
X-Google-Smtp-Source: AGHT+IEZfr0ji4LDK9KAfq64DmhYMTWRTB1pQDXq1rT0Tuj0QwG5y9ROAnPBq8wcVt6C4csWmuVLvQ==
X-Received: by 2002:a17:907:9621:b0:ae3:a717:e90c with SMTP id a640c23a62f3a-ae3fe695451mr259268966b.23.1751645691353;
        Fri, 04 Jul 2025 09:14:51 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9215sm194703766b.2.2025.07.04.09.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:14:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lizhi.hou@amd.com
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 8/9] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Fri,  4 Jul 2025 19:14:08 +0300
Message-ID: <20250704161410.3931884-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_091452_976440_F47E5AD4 
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The RZ Smarc Carrier-II board has PCIe headers mounted on it. Enable PCIe
support.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index 5e044a4d0234..6e9e78aca0b0 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -132,6 +132,12 @@ power-monitor@44 {
 	};
 };
 
+&pcie {
+	pinctrl-0 = <&pcie_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &pinctrl {
 	audio_clock_pins: audio-clock {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
@@ -159,6 +165,11 @@ key-3-gpio-hog {
 		line-name = "key-3-gpio-irq";
 	};
 
+	pcie_pins: pcie {
+		pinmux = <RZG2L_PORT_PINMUX(13, 2, 2)>, /* PCIE_RST_OUT_B */
+			 <RZG2L_PORT_PINMUX(13, 3, 2)>; /* PCIE_CLKREQ_B */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(6, 3, 1)>, /* RXD */
 			 <RZG2L_PORT_PINMUX(6, 4, 1)>; /* TXD */
-- 
2.43.0


