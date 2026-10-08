Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DCECA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=; b=1nuRaVG8aeNjq34fTCYp84TJrI
	dXhKD2C8WSf8fpb8aGTGc2YRJ1RFi3bRuQfuEVMLWonDGGWo5qLDU4ZFSaMheUOlqLC0hmlwolnwt
	q+fnFd0TjH4MizcAlViFHbL7Z6p4ETKlpgdqukwWm+8mgDaImc1MMFYxxqKBmQKI1JePf5J/FzVZ8
	e3hAZhdSpfW04ZKQXYpfHI4eXCrUtmUfgyz1JfUJca0nQeDQ0nx1TfOW0ycsDK4d9a9XBsgBSP+4R
	oIF9Wwly03gqFyK0Aw03ZBj1jHNA3QFEU0/XuwuPIT53/OW17iaLZ/qVqZBOlwIeARWsm0ctelgh/
	4DxfEc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyc-00000004wWz-1KzR;
	Thu, 08 Oct 2026 19:40:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyZ-00000004wUM-2hzn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49ff680331aso62241835e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488422; x=1792093222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=;
        b=XkwYgOuGP4XYj2VOnStn0v1k3FUv1H3G1D6gg37+QfTwP4zJzJwNYUizzWjdvGM6Mn
         RkevOY0SXeh/ESTDcTnYwaPvL8ZEXvu5DcrIzFrE/ZPXeu9U+8FeIZulgWLO3kSJA+Cg
         KosF/Q2TIDlElP5C6Ka0kXB6zZUjNZQzWykjpaxhhVRVstpFAYfK3DW/LG4wo+IdS9e3
         5qxrjcuw7gqpSzYu7ro7oJaftINgI1kUSb23q9th8HQvQuCDvR7XQfqFsHJmqNRsF24h
         FmgOgzSncNohxbJ0jM2Gz3wAE/JdyI5qyUijhew2qzDB6XjpJcik4hyLXZEJNVLcBbix
         7ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488422; x=1792093222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUKnHWhbwjMVr4mKYh743dRcYI9pzvORcI6HHWVVZSU=;
        b=QEnCIcaA3azjl36Qo+jYlt5TuRN7hQ+edu3VlzCu2wXUNaOfeSyiw2xjGw3aDwYBos
         L4RPUbkpTpfsI3y5pKOQwiplCs2+zxCcE5P03KjWjRraEjGyCamIvdIzIuDc+1U0bFZH
         5+4JEyxVgnxsC7emHTgaJQlUBpjaEgDlpD8WeSvrIZZn7eboNUdtxr2PPk+ampfx+ovP
         VBm6cdd8PuDJroCi1cB6FkuWPatnR8xGnu9g8zZ1kY3YR5EeYN9VfQuKy3WyrKRvbhHD
         X39/ZTno2TARSk88iAlTQq87L4pWWdox98ie0hYmSSJVxJiJl1JCGqk0wlii+awcQcWK
         YYdg==
X-Forwarded-Encrypted: i=1; AKwUvBz+qWdzzE+luYBGukPqBG/Y4MbFltEPvJPGj6W/bzWuf8OiGwnZ1Of3w7moJzI4yGLnH0Xt0gpeiTfAHg639rT6@lists.infradead.org
X-Gm-Message-State: AFuF++mMfB+RwuThqlecm/RB1+lDdklruNAESTzs6hEda11R+7ojbPwF
	Ort4LpEvxhSRe3D9DG0FQ0WwHFU9HfUegBlWOn1QYU4vzNQidf4bqIf5
X-Gm-Gg: AYBFou3xuJq/12E7tVpa/lgIto79kfZudHbzvsTx5aKhBzys3Lbke82vX8IaW/gBMNC
	EB193paGR3b1sce0S4SONm5bdM5No76N3OU0RzhRi5avR0bGDjZrrTybev+nHGarl/fwsCw/2tP
	J39gJfxPZGBGjJJNOmD9Uaj2Y6uHUzsfBa5gjxPITIHDesAP5eSqiCmAZK5uTz376Ep0X4kYEp/
	2kU57L6nHZBDfk0YFyCUyG6NX2hSLuXqneI9ljsVcUWtoHRl5T1pzcdH985IZNJGJMKEQZd3D2O
	0w28YiRwtJJV5LBkjA0BoMtsuCa0p09XIgRDF4pe3I9SefxBirg0ULVCfOQPAevEcDmDbalQaFZ
	8RxTb/IzbimrO+ERHzJOXb9KL4xqNlzMjPdBvRYO+YoHoiBh+RzgWUXna0Q+kgnMgHxyZVxFYlm
	8zCOyIogCHogyrwbsuVugVP/XAmJYVS15OBQ2kDHvhYksOYM2qkE39OXDAI/JV9BnvOXtSvTUV4
	P8BZkEtnJFloaiTgXMKtBavVnmbJ5m02Qe7OV/igO9/O8w+maXeg6cr9iEgs4XVNKhnD6vD/7QY
	jEbIFUfvOsaHGl4vekzaKQ==
X-Received: by 2002:a05:600c:5252:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1806878c3mr107026915e9.33.1791488421519;
        Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:21 -0700 (PDT)
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 04/13] net: phy: micrel: Check RMII clock select property presence
Date: Thu,  8 Oct 2026 21:37:44 +0200
Message-ID: <6271eea14eb6ef93031921cedc12d87cf5e25595.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124023_723120_C4A9964C 
X-CRM114-Status: GOOD (  13.40  )
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

The micrel,rmii-reference-clock-select-25-mhz property is tested
for presence, but of_property_read_bool() warns when the property
has a value. Encoding it as <1> to satisfy the DT schema unit check
would therefore produce a warning at PHY probe.

Use of_property_present() for the presence test. It accepts both
existing empty properties and the new numeric form without changing
the RMII clock selection.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - No changes.

v2->v3:
 - New patch: use of_property_present() for the RMII clock select
   property so its numeric form does not warn during PHY probe.

 drivers/net/phy/micrel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/micrel.c b/drivers/net/phy/micrel.c
index ae830781824b..acb481a29c25 100644
--- a/drivers/net/phy/micrel.c
+++ b/drivers/net/phy/micrel.c
@@ -2791,7 +2791,7 @@ static int kszphy_probe(struct phy_device *phydev)
 
 		if (type)
 			priv->rmii_ref_clk_sel = type->has_rmii_ref_clk_sel;
-		rmii_ref_clk_sel_25_mhz = of_property_read_bool(np,
+		rmii_ref_clk_sel_25_mhz = of_property_present(np,
 				"micrel,rmii-reference-clock-select-25-mhz");
 
 		if (rate > 24500000 && rate < 25500000) {
-- 
2.47.3


