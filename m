Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9ADC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cvGP/3CRa2t4gXiy9Fv9ps8S84kk+BXASAtnC9F87rA=; b=qSBxN/qGNQC3uqn80PBLXyp9zg
	voUH70fewLNN/Q+6wRA57UtHUts5EIRbM/NGjFgeuWVvJHBoUX1/+DWuba3rsHDUzAWjUKw3rbahW
	sysfqb/zaZtmtazGAo8P82P8YPuiM4XpNzHMoAFYiKA/uOZfX1GAhRDSiLSCi/AEpUNCoaEY2uX9A
	5OO40UKn7e8IVR2aLvcXPeSpNp9LDgLRSaLh+SAWLEz7uhgLYQ4KF+Vz4PO4O8FnEz9PXFRweWuaJ
	zGSzt/jUTekj17mxD+MPBJpa0G1eiGXSAZ+m3AdFtNlUJfpQ8NTit8vqJE7raAiU5xv71KqeBM0XK
	sSE4nKSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKy2y-00000000RGd-23uC;
	Fri, 30 May 2025 11:37:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxmJ-00000000PCE-3UVB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 11:20:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-450d37d4699so6725785e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 04:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748603998; x=1749208798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvGP/3CRa2t4gXiy9Fv9ps8S84kk+BXASAtnC9F87rA=;
        b=SuuElcNCQA6q17q/2bqb/5ybUAFitIts9YxaTFfE9BdM6JjBCAoaeJUeHuloV1oUUR
         /Cjp/Mu+HaxyWkDbid0/AT8YzQCMCak9KwwpZKlft6isVMDHGHmbY8JH950JIp3H02V3
         Yt6dlanRnuzlb2P85HL6YjvzZiFX2SjZMU7E7h3OLCYQ5vfJ2D2HG0Uh13fgXQwLCnO1
         QEwUNjm+LE+ZQ8odqAXJoq0DayTJmcyxfVrbJfLxpBoPZCv8+C4vvErHCacIEZ2NTXKB
         7neaHjNcySlrCMyjDLllPLTA/ayqKiyzeYZPdOaSQnsEJLEzdT16ElJ+INX/3HCBCA/r
         ZRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748603998; x=1749208798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvGP/3CRa2t4gXiy9Fv9ps8S84kk+BXASAtnC9F87rA=;
        b=X/6jb966UOs9B+MBYCBkGlhuwIPQXennDb7ZmI0ToPr3V5TbOdQ/5iaA/fKRxy/Buy
         7JKVnZFkJ94KjVDV4KU9QqZAAcMeY1oPhLBZKW9C27UzJnrEAYMD1Jhm+Puw5E+wXhve
         crSwxp2TZkNVOcPzGWQDMAUeadDkddkuEl7lk4hvnhnqipp7Oh9semo3iq78RdXM7nbr
         0nYRNSHqKINHxUg719HWWAfXGr9v6zpt1kuQEevMYjXb20HY3vDeot29mLFrTv6gtS6V
         hmELyZ+KfdKFm4bBc7Rp+EU/BOXOADw/Drh5XMMgK1QguylSy2jKv/+hrilJespD28fg
         7pww==
X-Forwarded-Encrypted: i=1; AJvYcCXpc06ordsN/CimVJ2pS1C+raW6Byad9Nb7/T2D97fXSQrzPow6xnjpf3SM8dP8y0/stK5mKrruQHTm7p7GDfly@lists.infradead.org
X-Gm-Message-State: AOJu0YzNVUD0Vf7GAur3fyr7oR8Mgszj2BNF3ty5E2wf57CKo1919lxv
	ZuNeXQHJvMDJLzdj3Zp1/uDPzXt0u3IRNYBLgivjoHHzd2Z9qLxGW3VeBYS6JDLeWfs=
X-Gm-Gg: ASbGncusTtXiu7DnmW24ur0DPwJ0vXJcsRO/XvjQ68OucPft0a6XQ5JPOtPlqXprrfj
	o6TDKYM/zzjPXSzYI1c+8bg17O5P/tBDQPzkAAOJe5VPdwR/QoD67Mj5CBod21RQfbWf1mc8yRd
	8ViNnsqd3bZn5dKiSZlU6C8ZvRKXp9tT791Lt+EEQP8n6A+IS/8yiZsIMZ3QcZlfYl8MkwgSI6+
	70kD8jyVeLRBf3hDFaA+lTDu7S4ddDxn86/jbLYWiu10+2cSHCSnPPGR80x+BWQUnuSTygxpTYj
	CugM0l3vHr6deZH0iyzQDFdi1r0DwExLbgiXJTorlN8FOHUpuiSoq1iTnxZ/I1knsqbuA3dUnum
	CEJvZDQ==
X-Google-Smtp-Source: AGHT+IGxApXe/sZJcFH1MLc5rJG+X9SmRJKeviScP7B6tRgI49wzs/sJ62PD40lFB7+X06xl6Ik4Pg==
X-Received: by 2002:a05:600c:3582:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-450d655b02amr21460665e9.28.1748603998156;
        Fri, 30 May 2025 04:19:58 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dc818f27sm3986435e9.18.2025.05.30.04.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 04:19:57 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 7/8] arm64: dts: renesas: rzg3s-smarc: Enable PCIe
Date: Fri, 30 May 2025 14:19:16 +0300
Message-ID: <20250530111917.1495023-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250530111917.1495023-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_041959_872977_7E1CE730 
X-CRM114-Status: GOOD (  10.28  )
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

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

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


