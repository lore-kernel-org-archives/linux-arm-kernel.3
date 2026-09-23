Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDA1C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mslKy16LyiWKXxpmPMj1rH6QX6l6C4PGFHhAsJKIKZc=; b=ivpK4WDTrfmqYb
	UzOMVbVWtCmRRWGGfj/SetSk0CXr8q3vYLVXYYj7bkl1Zotv3PWkDAm6MOr3lSs93Z/RacvCC0RdD
	EdUh29yz0jR54H/bLScbr2r4jBPkPdTh7ElEiD2onuqzjPDwCqND3oLCUo6vxqpDqFqpLEAGQJWKr
	4ITRwTH9ciLXuOJ67vjonoKsHFmReESlUlzEy/GRwGSPUHDPCTBwKs8EJ6OyyZwE5qK9MpqZkW2Af
	jx3kxTUwyOhfwKnunKTjp4NwhntnhBd2qFTHUbQuNg6CBcir19IQrGonqSU0URCXe6SEpFjc7Y56P
	WiSxnWpVL+5SIkkN8QdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TsZ-00000009VOW-2OsQ;
	Wed, 23 Sep 2026 20:47:47 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TsX-00000009VO2-1CP5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:47:47 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e2406so6733575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790196463; x=1790801263; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mslKy16LyiWKXxpmPMj1rH6QX6l6C4PGFHhAsJKIKZc=;
        b=FDzTu6QcBovexFJ0lLiwAx9yV3CJso6v4YtNdEHNpdIaDssSLEYG6EkPuDEDFoVBX8
         lZwMm9nAWk7roLFhX/Yyt1RQp5owWtcKP7ouCC85bp3yPvuDH2anRdlhXl9Z6GDbVVIl
         UX6SSV55s7worDaqazR+8qKqMV2uhr95ljDL/IdNXLfbib/xJdyIly6q8StAewz5YFIU
         f85TYx/kJ7Li5rIMlsn/gr55JFcR1BNc9ZgoU7uPdgp4bdtfyAxJRTa7Qj5peVQTV2yY
         I3fi3d8CZOyfCrPg4bw1JT7GmTlDoS0L/sNIvVXFK9Yycaa2ZWtlrLR57BSoaX0yAwlg
         vv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196463; x=1790801263;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mslKy16LyiWKXxpmPMj1rH6QX6l6C4PGFHhAsJKIKZc=;
        b=HJ31seNmy5ElS4Yzh94k3M4icsjthvr732Ld9zce4plzp5BNsRZUap0C5YnU/mu4Om
         pOpeQIF1p0Snynaa2pF9BX+ckriQ1W9J7Fi+kKHVjaKFHnNO1Ff70bShsz573pbxrgwN
         IE5k8wk74MnpebDcl6WT4abNUGHir8RQKUpuAyN0DrecXdyyEIUZTkFZACmkAXMoO/J/
         lalDZ+XHux8UumQmrCFtdcGxKL/7eSxWgD4RmZzEz7nPYsf5JSR9SNKTKAyAjrNNSRxX
         IheSjll+5dTl4cY3mCe48avF8eM9ym3xkNyT+p8cQpWDbXBSBsKX/QvWjodUJU42eCHr
         Ir7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzRVR82fUF7C3p6p1s56PtdP+nXh4pRxgcvAlw8Cw8JhiKofTN/kb1DV9j3GBQFTOwcKawyddx/K2C7mUp1W1kJ@lists.infradead.org
X-Gm-Message-State: AFuF++koXXOHIs4xQQe+ZtQBvB0bNgyBYK/0SysrkVqc7Mltg7mWVd8d
	hlNqoXBT2iWeTiPRufBryfikk6sA+8V54hSFX0QYKZJyR6IqcQY88UJRDKbDFx/JhVQ=
X-Gm-Gg: AYBFou315AzteHXXTPuR12KhXDq9GYuUmixbLmCn5BsA8h/sSomIAXf+yrojMHewP5B
	/Mvxi9F0wFT6WqDsUGzsmHcrDvHqJ7/VdON4Y+Ye6KZcmrCNyjQJBfzlqJA3BQ5I3IHzQNFLGDw
	0yzxXk+avqHWyjy+SQDxEAMUSj6/Oh0SWDAy6HjZKHkuYBiq0qSIXG+Nz9BsBvIUqmG3FCU399D
	mCNejTg+47KMdPUN4qnJKorYouRt37BN1X8ejN2nOEabRyw7f2LIBNTJRg0y6iTtlCN/NYpm6q5
	jYpwx2J2ed59jAZXltG3G7HYSVPeBZBO3kx1en4HBl+HgAlmxad2rvUqEDPjUwOD3hqRkOeoNsR
	HnaFU7dFfmDTKshnIV1B0PaWEzcxs3qnZ37VWYc/FM4spE/xiAfbZ12Do51BFKh358cJdemck5h
	1IQoSL3Lmi8mkBo8ucaO71XPAo+AKSW4lLxT9nlpW8FyKYj92yddl9sEqxGlj1Lwr+uJsuCBcH5
	7FWOVtai0NUn0V+dGu6vhkH7F1DRUraCIFHV2g=
X-Received: by 2002:a05:600c:3b01:b0:49f:ce79:7a8d with SMTP id 5b1f17b1804b1-49fe670b3e3mr6025275e9.17.1790196462747;
        Wed, 23 Sep 2026 13:47:42 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm10385455e9.13.2026.09.23.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:47:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next v3 0/5] net: stmmac: Add support for Allwinner
 A733 GMAC210
Date: Wed, 23 Sep 2026 22:47:30 +0200
Message-Id: <20260923-allwinner-a733-gmac-support-v3-0-15735155a789@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwQ7CIAwG4FcxnK2Bok49+R7GA7Buw0y2AMMZs
 3cX58HEg/H4p+3398ECeUuBHRYP5inZYDuXg1wumGmUqwlsmTNDjlteSAGqbW/WOfKgCimhvio
 DYej7zkcQW6lLEtyIDbIs9J4qO876iTmK4GiM7PyehEFfyMQX/tptbIidv8+PJDFf/NWZBHAou
 doVEnWldnjU6t5a7WlluutclvDD7QX/zWHm1tVaCdogNyi/uGmanqgCvJY0AQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3884; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TdnLH5DwhqtG6C7m0a7hVRyfyRfRxyaegwP3kzUxBVU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlbrN48fSmf7CLPEqlgcOnr/5A/UQJdgZVMKk6nBOyuF
 Uwpk+/oKGVhEONikBVTZKnhrhZ/J6n1ZdZ0ndswc1iZQIYwcHEKwEQkTzAyXOTkLmJ1DtOOvbUv
 /Lr3O7mNz1P8zxoc38NzMyLJbIJmOSPDrosPAxyOvBaYnrPVbdbh22Wvs3y3XCh/aX/+t662b0o
 CLwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_134745_357458_B5BE2CD7 
X-CRM114-Status: GOOD (  19.62  )
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
 * That region is in the AHB reset domain, so the AHB reset must be
   released before the configuration is written. The configuration
   is sampled by the dwmac when the other reset is deasserted.
 * The DMA channels have their own interrupt lines.
 * A PTP reference clock and an AHB reset are needed.
 * The controllers do not require a power domain (AFAIK).
 * The TX clock delay value is 5 bits wide instead of 3, split over 2
   register fields, and both TX and RX delays use a 180ps step.

The DT changes for the A733 and the Cubie A7A board are not part of this
series and will be sent separately through the sunxi tree.

Tested on a Cubie A7A, RGMII with a MAXIO external PHY on GMAC0.

Problems found while testing (none impacting this driver directly):
 * Unstable EEE/LPI: If the device stays in LPI mode long enough, the
   link sometimes (but not always) goes down, coming back up when the
   device exits LPI mode. This is apparently due to the PHY; the vendor
   driver disables this feature. The solution is to use genphy with the
   eee-broken-* DT properties or wait for the upcoming mainline driver:
   https://lore.kernel.org/all/MN0PR19MB609154F210DF84DCB29D3696ACC62@MN0PR19MB6091.namprd19.prod.outlook.com
 * Tx-delay: The vendor kernel ships with a Tx delay of 2.16ns. It may seem
   to work at first but breaks under heavy load. The vendor kernel is
   configured for an external RGMII clock, which cannot work on the A7A:
   the 125MHz input and 25MHz reference output are not wired to the PHY.
   It was most likely not tested on this board. A 1.62ns Tx delay works
   well.

DT example is available here (gated on CCU and pinctrl mainline support
currently):
https://github.com/jbrun3t/linux/commit/aa6f3a5ce4cd6e09ff9be1828915bfe8e87c57df

Maxime, I've tried adding a new init callback as you suggested but it
did not work out. The config needs to be written before the 'stmmaceth'
reset is deasserted to be properly sampled, but it can only be written
once the 'ahb' reset is deasserted. A new callback would not help.
However, tweaking the stmmac platform data as I did in v2 is not
necessary since the reset is shared. I've corrected that.

Changes in v3:
- Split the driver changes into preparatory patches and the A733 addition
- Use a 180ps TX and RX delay step on the A733, allowing up to 5580ps
- Release the shared AHB reset before writing the glue registers instead of
  taking over the stmmaceth reset from the stmmac core
- Link to v2: https://patch.msgid.link/20260910-allwinner-a733-gmac-support-v2-0-4f4a1e520c23@baylibre.com

Changes in v2:
- No driver change since RFC, just more tests.
- Rebase on net-next/main - proper prefix added
- Link to v1: https://patch.msgid.link/20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (5):
      dt-bindings: net: sun8i-emac: Add A733 GMAC210 compatible
      net: stmmac: sun55i: Add per-compatible match data
      net: stmmac: sun55i: Make the delay step configurable
      net: stmmac: sun55i: Support TX delay extension bits
      net: stmmac: sun55i: Add support for Allwinner A733 GMAC210

 .../bindings/net/allwinner,sun8i-a83t-emac.yaml    | 142 ++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun55i.c | 184 +++++++++++++++++----
 2 files changed, 276 insertions(+), 50 deletions(-)
---
base-commit: 944ae66642b726bd6b25ae71b1e9ff88a0e0bdb0
change-id: 20260731-allwinner-a733-gmac-support-163bde10c152

Best regards,
--  
Jerome


