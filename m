Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC1C103E2F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 01:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VyB5pKnWn9O1wtjxVZxKBeu/DBXMCZY1EfBDXvBRKnY=; b=0Kr9snRklsqXqlVExes7esPpZs
	rWLt9hcU7vb1SQYE2Smn7q3h9cfurjL1j3xuX3/LzCi87vgnKzD7NheCv/cUksljIKrhPFD+4XafE
	udEIY4V3WCoYMaDITTG6Nf2GfeV4X4fJN+dDeKW8KXdR33pOto6rzROTKUuqYcuYt8ZKMjdEd3dZD
	XUyXUnsNP/G05bypMhIlqqgcGvLIYW0thdwZsLCysBGKhX1wi62fyPIHzu+fMcCcIQP1Oat3r6H0r
	tm1AjrMQKzURQSdpmjGzJA1JE6MvWG/k/ChxKHkslKPp3sUzE30irMR0auL4bFn9fH3lUO8XVMIwc
	R88VX0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Ulm-0000000CzoC-3F5F;
	Thu, 12 Mar 2026 01:23:22 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Uli-0000000Czmu-3FKX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 01:23:20 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8cd80bea5f3so26831685a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 18:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773278597; x=1773883397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VyB5pKnWn9O1wtjxVZxKBeu/DBXMCZY1EfBDXvBRKnY=;
        b=ekSEuVMWAOmqAEVrkRqyZmjJ4cTMNBoqr4Om6hEg6kZgG/43Q4TYw6n1kxyu2msYik
         uzpNnKF4TY6N0XIe6KlxC3W7slomTUOycJ9brevLQEUhiR1O2MLh7s0DsQWaFtqWeGcO
         gnCTNmH23hKOY/gLKRdbAhhSOAhP6x2IxDepUHi37hmp4hbx0wJXyL1rjodCL9sdZVJn
         22T9FUnqOFMH+jR1vBkFl5PYc2zAqWVyK3yuRvvQSyjhYHRNMvbA5e+UHPF79SIYzJad
         iY8SPk84kRWhwk4IR1CyfXd+JEYxeAlkJlNjlHhjq2RSjNrZ7g7h7D8A5d8oQjbmywZl
         svxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773278597; x=1773883397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyB5pKnWn9O1wtjxVZxKBeu/DBXMCZY1EfBDXvBRKnY=;
        b=l9a39QwFtbnzUuqV8ifcozK7jkABTUN7u+hiQTXd1dKxcQ311QK2xQzQR42JPYSW2g
         jn6wF3ZFiJAGP8PmmNp9UXtlb6Ob2I3GOV/62hWzVZglpqjWYDDZn/sSQuvaGz3ZVrkz
         LGYKSpziSZC3D596iGzVe4EOFO3ByGo+F+jH9irLzQ22JRrqJa6Zsy31j5tTCnxbjnch
         FxiTEZrzJ9Y7Z1L9ITPoa3/eC07eKQs/U5pmQiTrXrHg1z532XpK+JBvD/EQePP29qN3
         pgBQmCulliqm3YyJWX+ZcsuEZ8SO6R2JN5Puz1StXWar8QHVC761Co8fo2xKvIs3Zldx
         lCag==
X-Forwarded-Encrypted: i=1; AJvYcCW/U5V9nuRv2TRcBtgvIAQRKHNd0sQ+mvibmmZzGPK9QJcwCJzMjcLXHEL7+GYhgSDWZKo/E20TjIHhvuPAiCUf@lists.infradead.org
X-Gm-Message-State: AOJu0YyovDzqQCqZ/lPmkzwImME6KLICDRjFa1R+2JPVyczUIRUpzQUJ
	9Qnmm3oBD4oSB/1UpKWWQ4g6fLe6b17lo2zfRU++W5fJClwhES0tPG8I
X-Gm-Gg: ATEYQzxdp7YhFdG6b8YEHicjj5dhNYhr0N81zc4GAokIMLq5jR18W0Zolb15q8cW2yK
	Lxh3XueNhja+aJE9tnNeSShoBMcZoRcibE4y4zmfbZN16hzF1XtGNk21blo4LSCLheN5acYp+D2
	MrRRG7YA0FcHJ8IH0jniP2IS8b1arWURmaKxZHvfZiQIIeXgl7kGQYRoyyMSsJipfmYWQoEGqIr
	WazUDhUbf2hl2Ll6wOpGLr0dZj3799riWHoE5sIP++7q+RJyKz1NayRc9wlaSpCyhgQk1e0C961
	E3EsKarx5APFgdcLGSKonvwi1gGOCc4ntnd12EWOPDeW+lPQrhy4hXWNgjljVnwLqUcQbkGl0Nv
	RcF9cgwh0QBZyQO/HfUdtOfTwYXGFGtESt7/zrtymNwQ2f9lFCDjv1+E/JwSjZWFJLu7yD8iMPJ
	m3xs26KYjKcYJsMm8oFFoFjdo=
X-Received: by 2002:a05:620a:2a08:b0:8cd:95b4:c521 with SMTP id af79cd13be357-8cda1a311e0mr596901285a.45.1773278596866;
        Wed, 11 Mar 2026 18:23:16 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1ff7642sm266671585a.21.2026.03.11.18.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 18:23:16 -0700 (PDT)
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
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
Subject: [PATCH net-next v9 0/4] riscv: spacemit: Add ethernet support for K3
Date: Thu, 12 Mar 2026 09:22:22 +0800
Message-ID: <20260312012232.373713-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_182318_818790_AAF075A3 
X-CRM114-Status: GOOD (  15.83  )
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


