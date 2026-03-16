Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BC6F30297
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SIPI/q2re4TeHZpgDpGUyFzrkzN62EoFr65JPUJDx7o=; b=TslizUh0Auo96dmfyDnem5A9s1
	9Dpt9gn9drria3seSSe1QKSfgoDlyiLIHy/16ldW3j/z8gS52NL+51+ANPqkm4Zb1+i33Csm/uuXj
	f2CAHKd86dkdUxYOEh+zDrjoiE+WtynXPSjqAuJBsymsGpQZ+257y4/q5zb8zrUF1XyOkeqHFRNFR
	lJqZN3nT5p4ODuixj0aRlN2cJ6D1/HQnmR4w6PreDy0rKSHDk069v17OHyPFDtB24PENkXS0+mc5s
	gaX7BVz0pVjSqU0whRzAIjc74Q4lRd4l8P5i7KG9uBKk9+lLprRhHG13S9aK7Ghy4UYMq2j9HrHY9
	7uHKq/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKT-000000033r0-3leN;
	Mon, 16 Mar 2026 01:01:09 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKO-000000033p3-1GNC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:01:06 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-829a27414a3so2293201b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 18:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622862; x=1774227662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIPI/q2re4TeHZpgDpGUyFzrkzN62EoFr65JPUJDx7o=;
        b=Fgp68Eydy6L8BiUfA0iReGfOfQkcZNxseW89wpa/lef70Ay8FjpOZ7nthH4Bz6gdMV
         U1QJrjEMW6yO1FevjWa0rcv86c4TX/Jxs5aWt3EF9PW3I+AvSKswDXfiFnxrzft1wpUH
         rENlG3I/4czNRDVx+beIsRvYc7+teMHsVVS2N+TWK0H/tYMEF2FeYIs/gI1lS5aKpLfn
         oMyZ73PqOSBQ/hmMoUm3yyQHC+jM5/lC38pKABuDuHiqHiXkIKGUtzj2FSfb4urMz/H1
         RW7I6uARYemSidjc4Dl+PDBaRwnuakieAwfn2Icy4SMlrqGhEpIAzX5rz57vrJ2qd6hD
         ZK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622862; x=1774227662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIPI/q2re4TeHZpgDpGUyFzrkzN62EoFr65JPUJDx7o=;
        b=M2e4o5wzrF0Wvr8XvqUfF/e084p4ecLWtu+k7hxrrE/91x+nqXD+Rxa9caVzrr1/jR
         BxKeb2f5pDi09NWUfQmYo1DA2a2mrvervrXf5tM0sI0OokyC1s73mAUD2IyvdH9obh96
         /vlTjFki0bzIRAtDDrbZ+11stS7ofUEF19dpa33TvdZVHi6B9koBNwU4g/teMNNBdiiu
         GPDGugI75pPxoptXRhoE+/32smhNSTdTFwC6wn652eUri/v67ELE7kILWzf+DC3lCMk0
         a24wkaULP+1JgVv1UPqgiIMKmvi6QE6CiV7rEZZkVlo42cRvRT6575+FZMjjqKVK7XsC
         7yhw==
X-Forwarded-Encrypted: i=1; AJvYcCWmzbfhlzT5ECYm3cO6nkCGZTX4LuJ+1B7I2DmOT5rviuknPvWLmEFBMcQ4edQpf55f6dx8jyuY42ZqUa+h+Kdd@lists.infradead.org
X-Gm-Message-State: AOJu0YwDGsTinaJb0yvPlqW9ealMsAL/Yu9d+SCMCnHWawt33egtCt2U
	hKYEldsHDwFmgx0TnFLmdXsqwtrWXX9MSiMEcTTAG1QF77YzLQ2iETR2
X-Gm-Gg: ATEYQzy3Q3PTYZKT0qzWKKHl7GbKxGQJBTgMuota9P+3d0o5Td/40VL6X/DH5nkh33V
	pVc0zQ5FEg3MXaH4xzPjfZCVD1C9VU/CIv+9Z15oejkgkezWw3H6ssA5NQ8+E7/DGBvAmEmWuJ8
	6Tj+vH+rAMt6XVLoS0Sh/TLMYSnO8fRaQ4+O4tR8sQ/qWf2uVUYbBQi2nHOd7ZmFLRUbGbytyfI
	oCN/UpLKlb9SVlUk9dOzX6cI2K2NV/IlOU6QmExZOoFq1JluspGCfNsurIEIXoLUA2Zv/8QRMqO
	/DM8qUyOb55pfayLsg/OXoLix56PIB1Oz2Z7XMgZnvC/uSLMw8j9jkyGeo6GKWrd/IyGmznhZqC
	Dr2UI1gtyDXGG2ozoduZNgDu3fNSGwlE0pX1X/5Z2rR39BDXeG0l6VwfmN5oBBo/prmv2o4Y+f7
	WI6h+2FS0G6u/nggpo4S/mRWg=
X-Received: by 2002:a05:6a20:4305:b0:398:c351:aa0e with SMTP id adf61e73a8af0-398ecab0dabmr9889114637.25.1773622860419;
        Sun, 15 Mar 2026 18:01:00 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c74028eecd4sm1977320a12.26.2026.03.15.18.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:00:59 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
Subject: [PATCH net-next v10 0/4] riscv: spacemit: Add ethernet support for K3
Date: Mon, 16 Mar 2026 09:00:36 +0800
Message-ID: <20260316010041.164360-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_180104_347517_400D528F 
X-CRM114-Status: GOOD (  15.50  )
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

Change from v9:
- https://lore.kernel.org/netdev/20260312012232.373713-1-inochiama@gmail.com
patch 3:
1. fix misaligned brace.

Change from v8:
- https://lore.kernel.org/netdev/20260309004305.315018-1-inochiama@gmail.com
patch 2:
1. Apply Russell's tag.
patch 3:
1. reverse the order of the local variable to make it "reverse christmas
   tree" for function spacemit_dwmac_update_irq_config() and function
   spacemit_set_phy_intf_sel()
2. Apply Russell's tag
patch 4:
1. Add MAINTAINERS entry

Change from v7:
- https://lore.kernel.org/netdev/20260304080721.1658224-1-inochiama@gmail.com
patch 3:
1. Remove unused parameter in spacemit_dwmac_fix_delay().

Change from v6:
- https://lore.kernel.org/netdev/20260303010630.567674-1-inochiama@gmail.com
patch 1:
1. Drop the extra blank line at the last

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

Inochi Amaoto (4):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC
  MAINTAINERS: add entry for SpacemiT DWMAC glue layer

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++
 MAINTAINERS                                   |   6 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 7 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0




