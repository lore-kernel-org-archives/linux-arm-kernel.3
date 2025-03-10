Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E84BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g0FHvk7naxccnXtThg65SMBGYmS/oNOjelthUAROF7I=; b=itjhpKEjNaG3+M
	/FGY9L/hWH7LCpqXE/REurJo3f7ys9aR2DNZm0EMmy5oiQNM4UivBJ/MFFvTVCCkGvFyY74NrLI2p
	W7FgWqGZ7LB3Spv1bFw5HMGgCeqdwZe5shbSwE992XRCdIa8MEqnUwK4D7kLksUn9Z0XubrMTu3BX
	il9fv27+mLPiU8DQ0oKAaj8H5xyo7WSqrb63imomWLTH2yVUrmBSmii0POl/Rxd66UVLfohxlOzfx
	Z3fxgM60Wi5IKJ/j8VLp6glqo226l5ydmPFhIMUAsVx0mrLHf5wlh50Wwtpnjf9iX8ZFmCMJWo76Z
	KKgmpv+PxZ2+MdOoq9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgWk-00000003R0K-47MG;
	Mon, 10 Mar 2025 17:02:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgAm-00000003Mw8-3rpL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=g0FHvk7naxccnXtThg65SMBGYmS/oNOjelthUAROF7I=; b=PICi5llpOcR1W55pjBLjLwI0Yo
	xKthcN5jL2i0XILYLt7Xw1dnDMEXe7+HAL+3KLi3+hri/DhBdHVWgk+FWMiG8RGg9jc3yAV4f2SnT
	fyfEYW1g4F78Tav1UswrFdP3E5UE4BWp4AvybdK87vt0MFMttHcZhxd8CUe1THPJkhogsZ3673oJ8
	DcTIEtIxhVdKelxeaK/YTXuRAOR2G+Z6Ntff62LM7aUyuM+AvLKSOxEtDmUZdqdGXt9n4ajfDPxQi
	VnMnWKzCTMznjueEA1O7a2au1WY97J+HnUtCrrFTaLPoZEdE4MYI4QvUONLtfeFU+iu/c0F7hNO7u
	y53799CQ==;
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgAj-00000001vpM-1bQj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:40:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9462B44420;
	Mon, 10 Mar 2025 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741624806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g0FHvk7naxccnXtThg65SMBGYmS/oNOjelthUAROF7I=;
	b=cZAJdWPeX2l6AmnRUrcI6g36eTjGObKFBUGlz+W2ZGYkamFITqLe5V6R19BKXwlt6JpWJz
	y2GNpuI4qwbGQiuHZLSRebaj5L0gwBYZcoh2xqYJNbcxpAeKDKpooqsr2hOgQdryx22jr9
	b6soNUnbxVc2kDUkFz3qAAxNlkul5kSXNiLIMb4i0ojz2vzkQ2CesoX5fE/znTJV6zijFx
	cVeEj5fRonO4GyD1Ak5gtCYrKKctkDK7s5+74mVn0ceOLlBQmIR+TeIRPcQRHblG8KBhgu
	pXi1s35+U3ev9P25WDy2geiEW+GpVkdCSbZsPuwnVE1sYPrQSSxOJoTT8OVliw==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v4 0/3] Add Variscite i.MX6UL SoM and Concerto board
 support
Date: Mon, 10 Mar 2025 17:39:47 +0100
Message-Id: <20250310-varsom6ul-concerto-dts-v4-0-6034fda6ec64@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANMVz2cC/3XQQQ7CIBAF0KsY1mJgKCiuvIdxQemoJFoUkGhM7
 y6tGjWmyz/JvMmfO4kYHEaynNxJwOyi820J1XRC7N60O6SuKZkAA8k4MJpNiP6oLgdqfWsxJE+
 bFKlhixrBKOC6JmX5FHDrrgO83pS8dzH5cBvuZN5P3yQfIzOnjGItKm3slhmrVrX36eDamfVH0
 qMZvqH5KAQFqhpjQYNUeqH/IfGBBB8tmUWBpOSo2JwLCeIX6p69A54v5Y/pVb7rHp3J0CllAQA
 A
X-Change-ID: 20250120-varsom6ul-concerto-dts-a08be2a6219b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=XPW/PNHU2C/8e9ggxKB1To3j4bIZAqkuOL8WACIX//o=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnzxXlA4CwvIV3hDMNMGAj0KX5KcGsHpcacPtqQ
 cVQ4ig44iKJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ88V5QAKCRDRgEFAKaOo
 Nk05D/wN7QtblCSzXP24wqWsH+praenTTdVTidGDLesjDjGPOC11EKF1hUp6HpdZCgIl8p+QEm0
 29EPDiD8b31hRZs+fL9eDN0LdhOtbtD5Oj1OqaHq50unamFep+0VuHenwnUcm9cHyYdB7uAbyZz
 XuDCeM1itX303K/hmPh6gQ1fJdfTJkYNsuyd9dbPiQwEqL7jiFFwbmgRClIXY5YUAybnsf89V09
 cGjH5b2UMk2OkGsDG4sSoShJ4i7XHRe2OwSG2Ti6uyGx7iB5RyC64F1Zr96oIf6ZxH7Fh73N6/p
 M+FQ8+ePUD7sr2sJWFBQuBURjRwn6yyZwduOMiIerbd2R1Uf15ZQ6fPfttHeaMxZodTCbVK1yFo
 18XYMZYP1H1nL6uibTVaKbGoYN1zPVbpy9QH1BjGF9g/vWvGmR/PfBXb/AF97kgtJEpuT3lCGHV
 55JO+kOqsrMyKx6SeXP/Hypx1bZQjpXwD4zMhkZvk7yNpSbZe10dg7UARm0TslPOIJ5B0yapC8A
 HOvTEYjKXTRjWI/CrUobOmoGWGUANxKmrD/kT/V963ZTBDxB5rTlB4T/+9Xt3wi8NEaD8mCRGik
 XP+JmQlU18Xob0mSUvTv7ifOIYYMD++f3rxQ9HyndqGi8yOS3V5tltX9HcQqOx0BSZtVN2Ba9WO
 B72aPWUTGX5YkNg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtudeuhfelveehueevudefgedvtdfffeevleefuedtjeeuteelgeelvefftdejteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjegthegtmeeirgguvgemjeelgeekmeegtdehledphhgvlhhopegluddvjedrtddruddrudgnpdhmrghilhhfrhhomheprghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehimhigsehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_164009_697605_CF6C19C6 
X-CRM114-Status: GOOD (  10.94  )
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

Add support for the i.MX6UL Variscite SoM (VAR-SOM-6UL) and the
Variscite Concerto Carrier Board.

I tested this with a VAR-SOM-6UL_G2_700C_512R_8N_IT_REV1.3A (one variant
of this SoM), meaning I couldn't test all of the possible options of the
SoM - so this device tree includes partial support for it.

These are based on the 5.15 Variscite kernel fork but adapted for
mainline.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Changes in v4:
- Add missing trailer on first patch ("Acked-by: Conor Dooley
  <conor.dooley@microchip.com>").
- Link to v3: https://lore.kernel.org/r/20250310-varsom6ul-concerto-dts-v3-0-551e60713523@bootlin.com

Changes in v3:
- Reviews from Shawn:
  - Fix alphabetical order of nodes and pinctrl entries.
  - Fix rmii-ref-clk label (remove "-grp" added by mistake).
  - Fix order of properties for eth nodes.
  - Convert deprecated fec properties to eth properties.
- Link to v2: https://lore.kernel.org/r/20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com

Changes in v2:
- Reviews from Krzysztof:
  - Use imperative mood in commit descriptions.
  - Remove backlight node as I am unable to test it.
  - Rename gpled2 node to led-0, and set function, color and label for
    it.
  - Remove unnecessary comment "DS1337 RTC module".
- Rename binding "variscite,mx6concerto" to "variscite,mx6ulconcerto"
  since this is for the VAR-SOM-6UL mounted on the Concerto.
- Remove pinctrl_ft5x06_ts_gpio iomuxc node, unused.
- Link to v1: https://lore.kernel.org/r/20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com

---
Antonin Godard (3):
      dt-bindings: arm: fsl: Add VAR-SOM-MX6UL SoM and Concerto board
      ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
      ARM: dts: imx6ul: Add Variscite Concerto board support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   6 +
 arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
 .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 320 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 233 +++++++++++++++
 4 files changed, 560 insertions(+)
---
base-commit: 66683f3b2661643f694607283ee8f01b7a934c83
change-id: 20250120-varsom6ul-concerto-dts-a08be2a6219b

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


