Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29D9C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=; b=HbC7OBci+aYpT6cKKR8G9Mi4sM
	G6oelXP2jkdWJfio2LH+s15N5umbi9xL+1ZpBVpSN2uRvW2y4jKNQdi7sRqeFL8V6EoMSYwz0HO7p
	jMnUJL2mpAj7p1CctjnHQwwB3cvPJf1KWY/FXVG9eZ/rSOfmGS4hI0z56R8PgpCCN50CylIUu0z/0
	eZ0YdoeSXulNNmxRMJs3sx2HvXC/XPKT9AqEKBvoCcxvWMm134o0OZ8tKnIAckwtX4LEGD8/tAZk4
	mY5Bw6se721OSskm0eTaaNB38AwH0xdwilpaLXPRUkn758OKQmBwPXnUlajo9mcceJYNNBveyx3bt
	Je4wr/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAoHF-0000000GKgg-3mPh;
	Sun, 27 Sep 2026 12:46:45 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAoH7-0000000GKct-0t5G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 12:46:38 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912df756so17238655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 05:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513195; x=1791117995; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=LMRM50NwTtb3OqA7ZhAiO4vy425WD5H6BrHAEfCp0yM2BgHWORl44QGxQnLm0aW1zg
         EjLtNMhmJ4wVtnlY89nbR8UKdVHHjvW2COWxPCRPb4+S9L3qB7Kftp0pmyASvQW06LhO
         yZR8teETteN0Nko9yCDFyEtwjYJpehgZQGQShcDmQWL0v7P4BvBuZEIC2OVUheKhXuGL
         5sPcHKc8UsPMhSyZ1Xol3tPPf2JEJa+kuKbAA81aZQK9ok4lUvKDA1tYY7IiF3MlmDR0
         c+Q/dScebOLSow4ZPrKSCZxlZ8B8rw21uLDbsq793P0KXvxpHCQOF5dU0vQ+QY1CwPlN
         VQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513195; x=1791117995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6TBF9avaY/bTBgvPOC6p2G/lL798dgydRUW2YJl/tA8=;
        b=HNlpWCXcG220UQeS0iRxdNRXEJW3r3/AUEf0N5Fgwb3UR/p6404Ft3BgRkoSTQuct9
         uwfRgmxaXii3IibJnjd4Ws5893g7mW6L0TOqrpM+jDabsiyQ1Jpa3LZK6zNSXFa11vaL
         gx4Q4ELVNP30Y1Wpyc/pzsudH/69qX6YLBI+0kx/X2L0vkUe7/VY00hl4bdBpF/EilGc
         vdq05R654twM0DFa2V4DBo9h9QsvaNMt12H7+MyOleVNsInV8eGqpVR5PsUdvnLqoDsZ
         S76aaAnhAbPal2a1KjO6wH0uH4cvbH9FEZ9Hk/mSNJT4fTeINdcgvrkteinW/mESMDHz
         5riw==
X-Forwarded-Encrypted: i=1; AKwUvBzWWhGlJBGBGdBC0PGC2mOGA8nvEQQ7CzxpxPQHyviRXh/7EV4+rPTfGG/lHsqLNWe26SHqTRH6kcY583YJsDzZ@lists.infradead.org
X-Gm-Message-State: AFuF++lRP12VDpw5oKhVIV37GLi4mJ0d1N/45WOb0wrbcearTVbxrIS4
	FTgBRSE93MzUCmBxzKvUUQSThGl+ihDJfhtTqco7LhllYPgsfKQuBOcP
X-Gm-Gg: AYBFou0dctob1kxiZGnsSW9DjwWXvVKMcvxNWg3Df9I+oUII5iboy26YpglBm6hajEr
	JByIDgpp6IlkeanmpaJH5uENKkBfWgPypfsHXJ9b2f/7qF/cZCdxTU3VCQkJKXPSJTnDUvg8Jsy
	M48dMY4pNLB/crPjdpLXI9gxtQagqvOpbGjM+k5XF4UqazgCsfekbuG8emYlBvxBg+iY+EMEAo3
	9Nd3tB8ERVy/JJnN16f2cfXyM9dcK0T8/u0fN97EfoFbMeB+2DWoRuhkVAPdnJRuORR4Sz6/+ZR
	jO7+cVJYp6zTtpQ9IEiGRHMsEndnPtTz5FH3aVZXLHuMQXF+YG7/T5pMhzapSAHT7hLUUctup+d
	fAW5LjEyvui1Zcyge2goP2oNYDLc6OsHz57IfwaJ5maqN7SDVVP8N3ioMsU6cT8IfJlMnFtz1jy
	ziJ+f9v68xLaGkCyxSVgsQn3eSV0UtRnOBdxXygfTNGwsq7KkyH0dRZWxTUHYEX9s5BkJlm0Cr0
	BNasaM3/iXjqUV7+oogEnSXp5cIW5jIKyERexEj0zm+cIsMl8ketpUaM4CUkpyUif6aECGjyzUn
	vnmYtA/R/nhPiF/7Kg+0/btOsv4WU6MJ
X-Received: by 2002:a05:600c:8b34:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a000b647f1mr30425705e9.0.1790513195410;
        Sun, 27 Sep 2026 05:46:35 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:34 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 02/12] net: phy: micrel: Check RMII clock select property presence
Date: Sun, 27 Sep 2026 14:46:17 +0200
Message-ID: <095af7bdb3b28e7776bac12bb4f3f661d057216f.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_054637_269963_4D3888FF 
X-CRM114-Status: GOOD (  13.87  )
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

