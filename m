Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A849C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gnUCr2DU/JXR6L4o56f6TURuvVsK2OuxGdTmuEiQLYE=; b=ov8pPDSv0Wm7VcfzBFfcUvILjd
	D8Sc2r+XQRqQEk3kA4hgziGdRgF4qnWkljZYkrGmrybP8ksqGLKGXuQV2Y3g5DcoYxIdMwgY1RVkm
	HI9lmO1ZPpoOwBZmQ0Ztrwfa2Gh0asiEGG0zE9aBc8L+7qlGthVlV1xgftTQbzXT6maAdqqfDpnBm
	LPbHE86xfs6X+FGel156g+QIEvj+MeW0LYASCCVrpjjNSPaTNW1Nm4q5uDrBp6Oyi51NRCrlPJa4H
	j/0RYNXI8ckd+gsNLgNR9vXd+ba9BGW3Yj8bIabhteJEX5KhK+RqU108aGwBD8Nwg+SYk3KHGdVSM
	8J65w6yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDCX-0000000G7t8-3ILb;
	Fri, 24 Jul 2026 10:32:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDCU-0000000G7sN-3vcy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:32:20 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso2220015e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 03:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784889137; x=1785493937; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gnUCr2DU/JXR6L4o56f6TURuvVsK2OuxGdTmuEiQLYE=;
        b=RA6uN+R/DvmOoN6RzTPZP7Q+0SkswYShrv86VcnnDL8QvADBaR1Vg1D3NEDkI0rk84
         rg7OqbwdGVV/JqYYcgtsy51I8qjKnDzQETu3+mJHiu+/urI825TyWfWDgZGoDfah7H9P
         hnkRIlU3lDWlpT1nwEwKel3aUPbuD3V2qoxZwPvBUh66srh1elDfcGUipFVqjEsySzxp
         4cNYz047RPAZ0on+OyT1UoQpY4qVWKBgq54YDt1+tedlhhezac01oHwkwK/5KRDjSnRq
         IC3kw7a50C81NiRP5LZPCG8HGFFqaqHAgtTvwHXnHHRq2rlyXtNVGviQRlpqrm+RwETo
         /DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889137; x=1785493937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnUCr2DU/JXR6L4o56f6TURuvVsK2OuxGdTmuEiQLYE=;
        b=Y3GI2/XDVk5mXqMShX+vCczpgx1as4VODEOEs/B0cmI5UoFRHCwY35CG3MxJPKoYRy
         XdpfFDZDiY0hYoUqEllyZKuetijQrNp7if4szEzBqo6fR8HfD/PV/PFbv/0UL9sYwhrX
         5kZB56tfpDg/yzeo6jG9oE7kpvVm/Q8fNcyAXJwu1wHrE/NmUTKPdH5mEjGJ7i+gwXQl
         LsDPlRmr+OZYQTMYwZ7OkkuY5o8DCc7ioedBjbliu0kdBLUi1Bnm966jVTEOb5MTAiQR
         7B7gMImL8EDLetXdstilqXR7KKa6KEdztzpJwBTCZYFPLV+slZ2xRKl4N9dS+MH90Pvx
         uHvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAmQx0qx5YDkU05PHj66MIFyyk0u0c2c0sl23UjgJ2fK+vhfQuhoECE31tcgQhiRH+QOWAiM+dTjGd3vmIXnuE@lists.infradead.org
X-Gm-Message-State: AOJu0YxBp0xHSMyA+4hWAogC4xv5McmIWfdaX/8nHljmupPewykXpoXv
	3OV/TUV9UB26cC51lSTRxrb/CLpII5QDYRA77E79WgNlAFHH3lAUFD/U
X-Gm-Gg: AR+sD122/XtloqcLvZNsInEyzmewKxOXiwSOxB8uc7zGTrcr6zW7CRoRX0+vc6rOdk/
	SM78qMrE1WQAoJkvB536ftBZJ/WSQqWhOxpK1cl6WtuG9hScj08HuT/xyt5yxFGqN6xGzhnUy+h
	TubB9eFAvY7PLMSJNbsth1ns70uAVFC445vIsLFfDxRWqqN0L4dkFgAwfWgPQE44EXEfdkv4+yS
	6XNl/+5qnFQom43T4b+r14FeGryPlnchl9upQsUV49CyxuHaSFQTQns4E5yENmpPeg1ne06HZRJ
	etAvwtwt9cegPFfcybNQn1GcSxs2cVCxQE2jbgGCxvPDTt8YvuD1htBgLmMdgSLX+6fBQssmgdi
	KCR66i6v34RwmkDzRK61+eO8TTelNqE3J7jUbVTmGBvHbgf2euqY6Sde2yFbWHqQ+UQCEdNmoH5
	jj/FZDDcNrpQ1ZHvQJ0tpCd9Sn3WhKZp2X7WEpxyWxv/qD1FoO01iipv9BZnXQX0/4YCvrAdVrX
	YOTpey8X328MPhJPUthUBW0uw==
X-Received: by 2002:a05:600c:35d5:b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-49573c8c8c4mr71266265e9.5.1784889136179;
        Fri, 24 Jul 2026 03:32:16 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957afac1cbsm55709885e9.10.2026.07.24.03.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:32:15 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP
Date: Fri, 24 Jul 2026 12:32:12 +0200
Message-ID: <20260724103212.41821-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_033218_984149_DD941B43 
X-CRM114-Status: GOOD (  10.13  )
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

The 10GBASE-R port is connected to an SFP cage and requires in-band
status handling for link state reporting.

Set managed to "in-band-status" so phylink can manage the SFP link
through the PCS.

Tested-by: Stefano Radaelli <stefano.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index ccf7e77016e4..3479abc25df2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -157,6 +157,7 @@ &enetc_port1 {
 };
 
 &enetc_port2 {
+	managed = "in-band-status";
 	phy-mode = "10gbase-r";
 	sfp = <&sfp0>;
 	status = "okay";
-- 
2.47.3


