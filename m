Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23BFCAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M/o3gVX4A+pC8uV/C9zqtdbM1sj81BgITs/nnRizczU=; b=J9EiPHCWn6vqX87Tb8M0sPA0qe
	iZfQSShwaFc1f9B2yLsl8ofbJoLt8BSBU2YOEnJvoV0qpjHwMvldYgq6bhJiOBoX43k1sos2jXiWS
	3TPP85npT7G6NHuJK1RU0wSvd8fgvRhUGIk7ksba0f0WRXVEkjYTPJF2hdU3glApsY71DBVDxmdAl
	LJXB154tBfCn2dOCkRwqkNKp6U6faUnGfyP6XwWIr5laEVRigJ9R18l12fETH7/GB00cYgvxm8I6G
	pIVWZaVZuotaHVXWWVpPPMa5D+MwQ3O3mmth1Leiwl4a5zzGS/IiW7bIppT4ENBlBPjyCE1H8SM30
	r/JoHgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvacX-0000000GrmX-4836;
	Mon, 08 Sep 2025 12:05:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvZab-0000000GVtG-3GWK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:59:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45de1f2cdeeso7133305e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757329152; x=1757933952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/o3gVX4A+pC8uV/C9zqtdbM1sj81BgITs/nnRizczU=;
        b=QgZcSIUntkE/9LupbhBFe2Q6nJYj26ZSOxnEODLCLN27U2UIpRSKlolBpWRK3Zxv40
         C/YCUoqF5fuRpLa6JZfVzUyM+WAip6MZ1U06uI5tFuxn+O8G840rV6EvAKgF+nqw0jbZ
         u8yObU/LGSLzPAE6DCqBN6kaqKk25F1J0zMCJ2DpPuU8OQ4DHlHVcEgzDZOtpCEnYy6O
         yclzjUy8mNCOv5On7jP5WgAic9srPfzdUnkbkwYQ6ONCW97DjR4rRF1UrxhvmkTCaQhC
         1GVsm7N4StQdfjUmKDVuwxhGBNcrBF4OzbfDi/LrVVR+c/NurvTfM9HO6ynJASPvrUs4
         +GrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757329152; x=1757933952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/o3gVX4A+pC8uV/C9zqtdbM1sj81BgITs/nnRizczU=;
        b=ttG1uhKiNJm5tX6vLX3AHT1BG+sG9kErY0tAgCOeLGF+ikQFNtAQylQicdPAn6hrjF
         jBv3ZSgo1d/DJuBLjiBGWw0DyPcobfijAj3ttoqJOLt6mjrYrads/xhwwheYy+xJ4Zbw
         SLS6T6jNbEm6lIFbjZ3Q0ozpq0C5emPJPdMubaY++oEIDL+ZnUZzqRfxQY4Sg/c1bVb1
         rNAXLvU2P6pSC1Kjva4SAzo/JsQZxwgdRxpgTa4jW0waTyg7npWVq2MFvsT6kXrP6cfj
         8U4OcKlJ7EKvt1g7u4pWFMJcpJ2mIPIxcqjr7o1y8K0af8P32+XsCaeBSWI66gnlnLid
         OJEw==
X-Forwarded-Encrypted: i=1; AJvYcCX73I6x8OONq07yVxgq+ie564evMQpukdd45q6LQCc5f7CfIQ9AWukOnD7nKQ1NMxLUM7Gts/5YruuRzp/oQ9Ll@lists.infradead.org
X-Gm-Message-State: AOJu0YwoH312GeeMCbUhJddkWKXstZFiZy4KrK4Ojjo6iCmydlK4xScK
	Lq8kv5RjRP9fkf3s+cwGNrXhkQY6rjFYvY4nAfrYQpItpiLr9zdqIw0b
X-Gm-Gg: ASbGncuibEA8PEUnVQxtOlVIZ3YWynF17UQdeX/ecmiqYBc5PXHcNG0EZHrkC9qGkuK
	eD9k9iY1SHpZ9K/FevnOFjf7zR38fvc0yVQS2H9/gA3hlZq3RZzyKZGQLnU6Snyu2+gMfoXY1/F
	XJWKbShajF7k8RrQyPcr+OZjloKZWBh69v3SXWAjurM4yqBtPnO5130fXTZxZs6eNV2plIi5s3c
	xP2yMpkGe5rlNNvnrT/KVMwp8PENBY2TImpYZbhDjwmvLE5cHE04DnSEP2rUWAiTulhgCujqgvH
	iBUweebuIggQimyi1mTXKTmzRmpgH9sL+fiSplKGNyJTuPIBh1MNCFqj3fl/kxQfGuzCUKp2zlY
	mTWWzPmN3w75R9iLeb/sIcwLXYv1QUDWid7DNvm8Ij4+gVtIy9hwU094Smg==
X-Google-Smtp-Source: AGHT+IG6IGAiVacXOQNaZCh79TsdsAnmzFtfGBHM8HXzbwbzvmmNbEzbLXTJmKcec+tTtlvN5FexMg==
X-Received: by 2002:a05:600c:468f:b0:45d:dbf4:888a with SMTP id 5b1f17b1804b1-45de6da472cmr20141115e9.25.1757329151701;
        Mon, 08 Sep 2025 03:59:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:393b:4605:1f6c:eea1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm91063195e9.3.2025.09.08.03.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:59:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 0/3] Add GMAC support for Renesas RZ/{T2H, N2H} SoCs
Date: Mon,  8 Sep 2025 11:58:58 +0100
Message-ID: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_035913_816252_F90FA529 
X-CRM114-Status: GOOD (  15.70  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series adds support for the Ethernet MAC (GMAC) IP present on
the Renesas RZ/T2H and RZ/N2H SoCs.

While these SoCs use the same Synopsys DesignWare MAC IP (version 5.20) as
the existing RZ/V2H(P), the hardware is synthesized with different options
that require driver and binding updates:
- 8 RX/TX queue pairs instead of 4 (requiring 19 interrupts vs 11)
- Different clock requirements (3 clocks vs 7)
- Different reset handling (2 named resets vs 1 unnamed)
- Split header feature enabled
- GMAC connected through a MIIC PCS on RZ/T2H

The series first updates the generic dwmac binding to accommodate the
higher interrupt count, then extends the Renesas-specific binding with
a to document both SoCs.

The driver changes prepare for multi-SoC support by introducing OF match
data for per-SoC configuration, then add RZ/T2H support including PCS
integration through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0]
(not a build dependency).
[0] https://lore.kernel.org/all/20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v2->v3:
- Rebased on top next-20250908.
- Made sure STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag is
  always set for all the SoCs.
- Updated Kconfig to include RZ/T2H and RZ/N2H.

- Fixed commit message typos.
v1->v2:
- Squshed incerasing interrupt count changes to snps,dwmac.yaml into this patch.
- Dropped un-necessary blank lines.
- Switched using "renesas,r9a09g077-gbeth" compatible string for RZ/T2H
  instead of "renesas,rzt2h-gbeth" and used it as a fallback for RZ/N2H.
- Updated description for reset property.
- Added pcs-handle property required for RZ/T2H.
- Updated commit message to reflect changes for patch 1/3.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and
    RZ/N2H SoCs
  net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 178 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +-
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 108 ++++++++++-
 4 files changed, 248 insertions(+), 59 deletions(-)

-- 
2.51.0


