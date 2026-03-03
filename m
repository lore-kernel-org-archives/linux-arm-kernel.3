Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158B6EB3649
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uyhrdqZlHw4Vr79hIFoPgUvb87j9Owo78niBL4sfkNc=; b=VJiVGPt5O7NNEeUmoB7E01BlrQ
	kjqd9qza/jd+Gw9SYB61kSJqFu4QtaG7KozuxLdPmLJS8iXu7kftF+oIXfX1tqRCZIBlBf9iB3RSP
	sVRy1xQgStdNRxbx4YWAevzIytL0lAEd/c2snwt+GOfJyPpbSC/ZmDLWIVaDt8l4uX7FzScARJiOE
	0XfKcQKEpXncPQsHiK1uiBx/ETMlzGG/yG06bCBFO8nrVCKtOnsYdFFhKyOfNuOtwOmIDfyII5BEV
	XwcNeFAjQmymfqo+sUnnyEQmpckgzR3zu4dqdlrFZ4Goc4sgdo3Rj0Nq+BUCsb0710EOWE71ak6rG
	oAHMgb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEEA-0000000EJ2P-1sU4;
	Tue, 03 Mar 2026 01:07:10 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEE8-0000000EJ1i-02cl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 01:07:09 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c6e1e748dc1so1723970a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 17:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772500027; x=1773104827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyhrdqZlHw4Vr79hIFoPgUvb87j9Owo78niBL4sfkNc=;
        b=kVIYnaCxiYiGtpRbq5CdcsWe53poRlnE+yB3ZyIcr899r83DG0/sy78ADDzflvZOxI
         hcEkc20vRbln9JjllTVb2lH16WHBGqBS8L06xentelVDmK274mp5XCy/7qgBZ/PHCy9F
         shxOcD2uM2B5EdJDs8/7YcppxA2MKBAeTYyNuos3pnHfORM3p0TttTPo0ehsAHUavWIA
         GMWjYsnPf7eeB+VTN6EgRD92AfD6EX6/XLvrqnB84oKjoKr9TZMBm2Xv0xbs6fP2iE5K
         Cx6mZ25QPoUdcUenebHtG8pGw6ZjWWhO7sbGn/lhMEhkBlTmrn0S+sFWV95Vz7LtZMk6
         hGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772500027; x=1773104827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyhrdqZlHw4Vr79hIFoPgUvb87j9Owo78niBL4sfkNc=;
        b=OkMXd3uuM5jtYWhXFBqqnX5A80iLcRqmoqIVGrL1y+ixU/C7ld6IVD041/rxtlrsGo
         eaMqtf77YOK1bQxbGjqy/bEEWNZArTlG9GH57UxuPSPBjPgSbyH032q8YTfcqmzzdOz2
         vaq96L1Z2AAtSxsIcF5EdHwsCk2z1Lp0gX+d8cC2kLSFZrAkkens8ESLRR1D9E1uFxqt
         KnbLM0JH29qnA0hxwLIzHp6N5ZkHLzvlHCFUd31E9/m0I9yFRZIr7Onie/jBRIbx4Zh0
         Y3ekBg1JR+oSPPooxj2o4hzLSssxrmhd1IQaizUZUB/B2q3C9rxpsSDtDWV6gsjxgrN9
         jZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbUDeLMhNfAh0Q06oKQZQoKP/y9KS4DJ3bQ/2nCoqxgMlgO46talwTa1vf3GxxA5wU5KJcNeH+Fp1jR88Ddhna@lists.infradead.org
X-Gm-Message-State: AOJu0YxiNMfmdmWKYXejzZeXavWGEYjGQ3fJHFQqMF7U3jPvaUMVBt47
	S2YcWYqPNmC5gSHD8Ff3yRROwUDMtDufeI87LBj1qyzB3vFjflhqdG37
X-Gm-Gg: ATEYQzyKMHeMJJTPyc7f/x1vqr03w2g2iAJWa0wIpuS6uyNMbl1ttHw7Id1mgTLNyBd
	iX+Z2BA19G+iKtdhYfYZRITWbowTkcLZA20Uh3D/gRwCTq93Uj2k4hf4WG0AzamXAHovwnaDYlj
	mOl8U6MW87e9lghhDz1bwfY0aDRsDkGtYDWvQvTzcUGJzY9dwBiRrEbP8Ec1baLIh6gONgz73I1
	uZN36cA5zJS40SLtxRBBl76ee+jmWUk+C9rJu653x21DKG6anHP9SMlh4oJx1rEudmTi6N0rRMx
	Q9kb6BLEbw6Rp1YFVkt2BzHv9iOP+u4D8M7NyTyt+tlOv+biP2OJurldYK4hbeKIyxXL0mSgBI+
	EzsI2GjKe1Oof+SXCbx0j70O/1+bAGYDABMsu3FEX4NC4XBdGU77QgLXewGdZv17z3ARr8O43EM
	VW+ciw17q6XK/KxmmSTeNqbg==
X-Received: by 2002:a17:903:2447:b0:2a0:b432:4a6 with SMTP id d9443c01a7336-2ae60cc32efmr3595925ad.15.1772500026993;
        Mon, 02 Mar 2026 17:07:06 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae45b5201fsm66337935ad.87.2026.03.02.17.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 17:07:06 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v6 0/3] riscv: spacemit: Add ethernet support for K3
Date: Tue,  3 Mar 2026 09:06:26 +0800
Message-ID: <20260303010630.567674-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_170708_050094_6A823857 
X-CRM114-Status: GOOD (  14.04  )
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

Add initial support for ethernet controller of the Spacemit K3 SoC.
This ethernet controller is almost a standard Synopsys DesignWare
MAC (version 5.40a). This controller require a syscon device to
configure some basic features, like interface type and internal delay.

Change from v5:
- https://lore.kernel.org/netdev/20260227075718.2243818-1-inochiama@gmail.com
patch 3:
1. fix error from checkpatch

Change from v4:
- https://lore.kernel.org/netdev/20260130022705.1059214-1-inochiama@gmail.com
patch 1:
1 Apply Rob's tag.
2 Adjust clock description according to Russell's suggestion.
patch 3:
1. Add set_phy_intf_sel() and get_interfaces() hook, suggested by Russell.

Change from v3:
- https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
patch 1:
1. fix the uncorrect compatible string postion
patch 3:
1. add "CTRL_" prefix to all ctrl register definition
2. only use delay config 0 to calculate delay code.
3. fix typo in the comment

Change from v2:
- https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
patch 1:
1. remove not needed compatible for select
2. drop empty line in "spacemit,apmu" properties
3. add spacemit,apmu properties to required.
patch 3:
1. remove misused phy_fix_phy_mode_for_mac_delays.
2. use local tx clock instead of the clk_tx_i in the dwmac.

Change from v1:
- https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
patch 1:
1. remove phy clock
patch 3:
1. improve comment and include something special about Spacmit K3 dwmac
2. reorder the included file
3. fix wrong delay macro used in spacemit_dwmac_set_delay.
4. add check for maximum supported delay.
5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
6. use assign for the ctrl register initial value.
7. fix input when calling of_property_read_u32().

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 228 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 347 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0


