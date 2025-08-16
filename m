Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65725CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50Ntk2ae5CUZ3DU9PEgu24q2kwxt9HUqPcFOtly0Sk4=; b=IiJFtDZW38AyoOuLcgx0UuDb8L
	cVfEwhfobhHdLfDXxEGx+T/fdPhofFZKrO51euw80BLfPRV4tS/MmhzovJmIOtXb3cs2aVjri9Jee
	89gYSWnVTzYazb262BH+yW5P0YI5uo/0/9JHlSq0VE6VacsWhK4Wqyf4/bk6ydfqxZNBqcUiZQg+Z
	JEOQVavbSn+H0eTEZfZlrJMSZdH9+0JcoTSfa3SNADiIWPScsuQkcKsUPW0XFdy4LCtXqU5wVBwEu
	YIR+P1VVFcMjp0e+AlO3poTppYOb8yH87u+Dmh73Tt4c84Fg2as0wbVvvC40egBs6TA1favnfnCIa
	y9b1yU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCjb-00000004Ku6-2mVI;
	Sat, 16 Aug 2025 08:57:55 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCZv-00000004K9V-0aiK;
	Sat, 16 Aug 2025 08:47:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b472fd93ad1so779298a12.0;
        Sat, 16 Aug 2025 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755334074; x=1755938874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50Ntk2ae5CUZ3DU9PEgu24q2kwxt9HUqPcFOtly0Sk4=;
        b=lEDo2UV5Rkhp8xPIAmcGzQfUZPARps8RQVV4VLe+gIl05VwGrRxIQdUT8zgU3866XM
         E3yNPG/mcFDFIS8KNgswU/xnIZ0NJ0SylLcMoHEHX9e1YfdRAjXQjkvZwDEcOEU+PNnQ
         M9fuyhH0q6HafSNLOEvuXmfqqIcSgQHqXnIEgHk9Lr55K/UDqQo9PXel//0x/xyKo6pz
         a1S1V+8T9zaJAr5Wlo1suyImK8TX4Juf9JR9N5igjkSYfoGUqCTx+RLTfSzRib8RGAPt
         HmhGf4Gn4Nx3THiis3b+BgduUqrYXFCt0s/cYhfcO/+cKdoDfRtkZib9wY1h/4y0cbAY
         /F2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755334074; x=1755938874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50Ntk2ae5CUZ3DU9PEgu24q2kwxt9HUqPcFOtly0Sk4=;
        b=Nur5Aa4u0nxYf5rinIPhZAhV/Kl8FifirBmlKlCeBTbFbmZapRdg4CtPXZANvGvD7g
         88YPudGDA/Dg5UywZimgYFWVzkD40YpT91hGaLORjgtOFntPcY0z0kT37EJeVVQlMDPG
         6KIdcov8DFgpu3HKEbtjPQPtpZBsmPXkLxxctHn31/DOA8YY1B2fZbtXPhaQw5HKowdK
         qV9+6g7xAi6r+zeWz0uDfvuYxM+8b+jPjJGrn3jYJS0wXM3SIIgjykF3Uksvu+Dlj7Ln
         lT52mqN+7f9iJOvITFK5UZmwgTsoxUkV83+rWAeECT/unKtf5H7o75N8YW54kfXu9E8u
         x/2A==
X-Forwarded-Encrypted: i=1; AJvYcCU3gLV/kvq3urWwpuxLbwDRcyiwxVrn/7EGJiSeF9ACtksg0AjUnbaHzz6LgFm46qDM0CHsCOXxbsIphnd0RVA4@lists.infradead.org, AJvYcCWo8gMqJk2WLY7FdVz0V75HwBuWJeosIFa7uW5r+beXYDREQDHICox+XebkoEI8cK0IG2guoWgTQLSC@lists.infradead.org
X-Gm-Message-State: AOJu0YwXC/gGvlMHeoB7wtPOc3fPN7QdiUAl/abU6Ef9TJvKmKjGg28G
	wIpkN2VrBccUQWLhwGCK1zM5fWySXCHjLAgcMTHDEx6TuE+WeU/szPU7
X-Gm-Gg: ASbGncssqqX86IxPAeh5p+Y7tKoxz470pdXbct1U7UXsjh7mXeC6+BIvDziky1a/hbC
	IDA7j4LRMEudkXNJ85kjJb7xvi1yKqbxAYtbm6DquRX3T9k5vSazubNLKaNj/20dqq85Le2jX8r
	wzBPyrTCBzMOHFtl4TSgq1+9QRWPFYdIWuGWO+MCa/JexsdKFG8Sr4xd3sJbcYarYqXndemmBD6
	2551VOHK7JBiW8lSNKQXpkPNXQhlx6EVJI/eUeBw07ItitzGE52f5lM+dtnbEotkPYRsyxWUEUt
	w28ousyt4mVLLLyH8CvkPLwoeo+nynKLvLXjdARjMHuggikjAaZ9P0Ei/ceaoI6PCtVEqWIw94N
	ZxTXL3metCAQ=
X-Google-Smtp-Source: AGHT+IHH2hwegF/f0OgFPR9gVfjZpUsDlbhxI4wzUfEICoM2jQpliSfPj1xZkFqOfFWIa8JxKO9MuQ==
X-Received: by 2002:a17:902:c98b:b0:23f:f96d:7579 with SMTP id d9443c01a7336-2447900cf44mr20352345ad.37.1755334074401;
        Sat, 16 Aug 2025 01:47:54 -0700 (PDT)
Received: from junAIR ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d57f12esm31048215ad.157.2025.08.16.01.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:47:54 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/7] phy: sun4i-usb: a523: add support for the USB2 PHY
Date: Sat, 16 Aug 2025 16:46:56 +0800
Message-ID: <20250816084700.569524-4-iuncuim@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816084700.569524-1-iuncuim@gmail.com>
References: <20250816084700.569524-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_014755_178657_2F33ACDD 
X-CRM114-Status: GOOD (  11.95  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

Previously, USB PHY was compatible with D1 and did not require
separatedata options. But now we need to add a third PHY, which makes it
incompatible. The third PHY is used together with USB3/PCIe combophy with
DWC3 controller. In the BSP code, the third PHY requires a separate glue
driver, but it seems that it is not needed.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 8873aed3a..bb79339f2 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -1025,6 +1025,15 @@ static const struct sun4i_usb_phy_cfg sun50i_h616_cfg = {
 	.siddq_in_base = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun55i_a523_cfg = {
+	.num_phys = 3,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+};
+
 static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-usb-phy", .data = &sun4i_a10_cfg },
 	{ .compatible = "allwinner,sun5i-a13-usb-phy", .data = &sun5i_a13_cfg },
@@ -1041,6 +1050,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun55i-a523-usb-phy", .data = &sun55i_a523_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.50.1


