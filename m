Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A407C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+7IJqvcZA5OncSvcOJnYdP+bmpbkD68/BvSiNe18T5E=; b=c4nbNMP7jiTFMA
	02m9rQNG4u4JkjP4B4rPw9Mfi3G/1NEfSq4U15X9edStys3LULyblvF9iRB1C/yzvEF1yV0S+ME9h
	1RMnUsOC7/jE2fQBQ1TSUIqDTnBofEF8p/7A8g0awh7ZHMO8nRJQfF83rJQ+6/GF8BNHO8fDjHWmG
	qctL+OsLa+EhROtvxX1qEnuA3qsQSIvYRNhNOMonq0yklf5hFgv4ddusrbJ1gzZPEgT8cxKAsWXqa
	CMpBAPeflt9K22EiipE3pREZNQjc3vygqulU5Te3MLJv+hYeLZzirox3ZdWA7jPZWa+cmG694nRmi
	LDoMHf4HJYG+qm9VBt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4byQ-0000000E2lB-2c87;
	Thu, 10 Sep 2026 10:25:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4byN-0000000E2k4-3zL6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 10:25:41 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-485850cf499so4893959f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 03:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789035938; x=1789640738; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+7IJqvcZA5OncSvcOJnYdP+bmpbkD68/BvSiNe18T5E=;
        b=fSGZ+2FYnh7mOcr1pNdn2c1Smpmms++4eH7y46ODg4lCBVFeRwJxszzQ/CStz87kRi
         XWHRZzNMQ+mtly/iRUzy9sHKECytgj0jFHlUUvwh6UqZQJeeFuknroL2sNrmMGc2naiU
         nzPobsrcajOSfnAClW04PYTHIWChoHmb5pJSRS9xogdA3DFzOUVtHuK94DbRGEci3FyP
         eo8TjXnyNneciO9z5svb3p50j6s0nPbl8a5S0Brxjbu137LhTIlM3Czc98lqdAAGgy+Q
         o9CkQPh6XJEXUs3ghrde8EnkskFxjiR3/DZKPB0MNm/rmftCO6UpvdgSen2Kr/9UBHIK
         7APg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035938; x=1789640738;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+7IJqvcZA5OncSvcOJnYdP+bmpbkD68/BvSiNe18T5E=;
        b=J95zodwyFAj9kSy9E6/MElxJqOd9JlpVQm7SF3F3T28Ek7lXdztXzwwx7X/9HvVSvg
         HgDht6Y3+coJrsIfMLhZUSwWQbELrQUWDN33wu8GIq3EqVn6KWh6+W+75oQHsP1QPrpN
         hoG5PavV14+MRCJJ2vGuLBwGbixV77aNWRvy1ZESGKR8mDUrmI6B03Z2OZJgNDleELyk
         c9vEN97w9NcybEsL8Ehg6wLPh+7w80MyeHNqG+m2FpXwS6UulLZxcCXuRkGpexK+zh6A
         bS61qUVwnmaUZAh44ZPfzMGw5hzYXQfAzDbwbixD/qrwtKeO3SfPEKZRySSl0s3RP9Q3
         9wPA==
X-Forwarded-Encrypted: i=1; AKwUvByuhoD4btpY4d/bcrwU3PzHJW+2Wn2paBzI2SqZ3EaeLWE/cb1Af2uo2+Dnjl21vgH3FgeRzC+9RPrm+dhDMdDR@lists.infradead.org
X-Gm-Message-State: AFuF++m7yYGNFBhL3Hn6NEfifjmp3R/6cYQIhBkZbodYD27ViEBMfVib
	wSxZJ/Ey99QyJp8HMwbua5TTYK2KT8EtmQ5LATGsSS/Vyo5nNMeM0l/8jzxNQbRkhSM=
X-Gm-Gg: AYBFou3ZjZ006Ze6re5bRp/PUANpWsAez6hrFXPkTI2IV/fpdGHAITNLN+fF9ljGUbV
	ELnXon86hBt1YD3fvOsZ9RaMKMjqvhiVQui3giGD3VreTvuSkuAE55nvGF2ztYdKwdY8usAEZ1+
	Pu49EwQRnVf4cJr9B40HO88jZKq1qB1x+7Hcmj4glG2UarasrgvBzSnlAXE4B48kRK6c1QS9/Ef
	ThWk+DRKWPdfAMI34xeo7V4TG0BV1++BkFu2T+8JqwcxIFkg/COz59wegIeaxa6TooO9Ma/mW13
	ecAok7FPISrEQ2BadezVUL+azDjZOK3L3HbJ+p+goTJGW0oDXoqu2ZQBebcJTmgZOe5huJt5Ym4
	05j3tqBsZ7CMOiKr3PAPHvoym0T96xtxT1XaqbASeqix7d10nhCtxWsuQl5blkjMIy7GB5nzHXi
	k9ZM7nJQYitVfmc/Di7kf8Oq3AAm+ZJ6TARQPT/SNnLJOWGd0JrepkuS5zMJ5PQCY42SllInrUE
	i+BK+SD44LGkV+CZxpqNFB92AtF
X-Received: by 2002:a05:600c:4e8c:b0:49d:93c:d903 with SMTP id 5b1f17b1804b1-49d093cd93cmr287529095e9.20.1789035938072;
        Thu, 10 Sep 2026 03:25:38 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c1bfb5sm70880845e9.5.2026.09.10.03.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:25:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: Add support for Allwinner
 A733 GMAC210
Date: Thu, 10 Sep 2026 12:25:25 +0200
Message-Id: <20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWFomoC/42OTQ6CMBSEr2Le2mf6E4G48h6GRVseUAMtaQtCC
 HcX8AIuJzPzzawQKViK8LisEGiy0Xq3C3G9gGmVawhttWsQTGQslxxV132scxRQ5VJi0yuDcRw
 GHxLyTOqKODP8LmAnDIFqO5/0FzhK6GhOUP6cOOo3mXTAj2xrY/JhOY9M/Gz8tTlxZFgxVeRS6
 FoV4qnV0lkd6GZ8D+W2bV9+z4//5QAAAA==
X-Change-ID: 20260731-allwinner-a733-gmac-support-163bde10c152
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Andre Przywara <andre.przywara@arm.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2982; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7qUwZtlr3g9YvFUyXqLdgxisTOChhV+RcK33AC98QRc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqooWdOxAijB+jJS+fc+wC7Ey7871ysV+SjXf4b
 Nbhv0NnxkGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqKFnQAKCRDm/A8cN/La
 henXD/918KHss64h9WEI8q+zv9g4EDRbjvrn5GDcLZ6kxRcq4Cq4CW+zC6fvSQ3qg/cCngZ5Gld
 LktODbMz1g/VLuibDxDkP1r8b2Mpj83kJiR86padlPKOlyQeUfmejmMy5FzC5t5d49kEC77KwS8
 CUDsf2i7NhfsxqgFc0ZeDuU44EQ+02pvHKItXbAQzpGsvIjF3AA0DWzEONfnwvyONCJHndkSbfd
 0uyts01se2An64GMtICogGNygSaK0Y7+Ko4isgbioxJuB9hJgd26dP86aNtpimyAczCqiSFDqxU
 21jmXAjAr5ff3qqzq6xfOG2k+dr/1p94ttFS9bTG63ogRSEnyb1Hf2lzbTBaGRQu7aXRGX7CD4S
 G9hhtgZMrHKPqKQLbL8gZCQ6f8bBClbHPp2ZaB6I5x2+CrXCnfiOYliVbtmNVMwLRrAgyDrqFUR
 q2AmDPEYgW09v3aPl28CCdxGkvVx2c1wygS2x52UuugVyNge9oIpfFV7kTlXpm4od2hdpE5P/VX
 fGUrRUJ5jLLJ+0/twR64ARZEYzgs0c/VMecuv7d+PBpaBFUXENEbxZKA6dbfjHaw2tGleg/jNbS
 Xq3xMCP6hBv7ObaQJf2hDYYeevyktHNPM2pZUc7EJz9WOy3F6XbMIfQNh+1JnmZFeRm4+RHn82A
 A1HO2hQngziPiKw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_032540_025531_43D2C0AA 
X-CRM114-Status: GOOD (  15.84  )
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

The A733 GMAC210 is a DesignWare MAC 5.20 with an Allwinner glue close to
the A523 GMAC200 already supported by dwmac-sun55i, but with a few
significant differences:

 * The glue configuration registers are a dedicated MMIO region of the
   controller instead of a syscon register.
 * That region is inside the controller reset domain, so the reset must be
   released before the configuration is written, and must not be asserted
   again afterwards or the configuration is lost.
 * The DMA channels have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * The controllers do not require a power domain (AFAIK).
 * The TX clock delay value is 5 bits wide instead of 3, split over 2
   register fields.

The DT changes for the A733 and the Cubie A7A board are not part of this
series and will be sent separately through the sunxi tree.

Tested on a Cubie A7A, RGMII with a MAXIO external PHY on GMAC0.

Problems found while testing (none impacting this driver directly):
 * Unstable EEE/LPI: If the device stays in LPI mode long enough, the                                                                                                                                                   
   link sometimes (but not always) goes down, coming back up when the device
   exits LPI mode. This is apparently due to PHY, the vendor driver disables
   this feature. Solution is to use genphy with eee-broken-* DT prop or wait
   for the incoming mainline driver:
   https://lore.kernel.org/all/MN0PR19MB609154F210DF84DCB29D3696ACC62@MN0PR19MB6091.namprd19.prod.outlook.com
 * Tx-delay: The vendor kernel ships with a Tx delay of 1.2ns. It may seem
   to work at first but breaks under heavy load. It turns out the vendor kernel
   is configured for an external RGMII clock but this can't work on the A7A.
   Th 125MHz input and 25Mhz reference output are not wired to the PHY.
   Most likely, It was not tested on this device. Using 0.9ns Tx-delays works well.

DT example is available here (gated on CCU and pinctrl mainline support currently):
https://github.com/jbrun3t/linux/commit/7b8be41a4130d2471b187b3a1ab33643970ef8a7

Changes in v2:
- No driver change since RFC, just more tests.
- Rebase on net-next/main - proper prefix added
- Link to v1: https://patch.msgid.link/20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (2):
      dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
      net: stmmac: Add support for Allwinner A733 GMAC210

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 130 +++++++++++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 145 ++++++++++++++++++---
 2 files changed, 242 insertions(+), 33 deletions(-)
---
base-commit: 211f2a875f6f447745d80d5762d6d614503ac84a
change-id: 20260731-allwinner-a733-gmac-support-163bde10c152

Best regards,
--  
Jerome


