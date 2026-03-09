Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F1AEA854A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 00:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oSzKv/Yso3zqJtEhQa2CN7kDXaRLoQ3igKM1IB73swc=; b=jREP9Wv7GL+6bK+EbINVccLSvL
	P6MwjpOwwxTeIXvsIx2nVD5KjV5c4KghJFWhOK005InkmLCcSQHruZhtubdUcpUPYFvvK8TGhT/Sh
	3bSwFQkz/AzIgk20oQurZZk8kTg04maPj7bM/0nYw0Iw/vlf+8IbmjXmyongMxb4f9AEJ94mm+e+E
	syapEAY539K1IISPk4nlhoYP/DuGFG+I4vaJNDGb4LT7sKevrjBMsdFfm3lGbYRtIr0TCJ41fQDMY
	aU5ajRAGajOoPhqPCYJ40l1tNb5QXSQPkJ24+tfXs412i0ETyVqH+LL6qqfrWYPuorBpSr18PiRBJ
	CrU9BMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzOin-00000006TpT-0fEh;
	Mon, 09 Mar 2026 00:43:45 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzOik-00000006ToK-2pUy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 00:43:43 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-829afe24fb5so1250245b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 17:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017021; x=1773621821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oSzKv/Yso3zqJtEhQa2CN7kDXaRLoQ3igKM1IB73swc=;
        b=JzKY148Bs4n5aeqLCGUH8QSBO6Yte8YdG82QwFr+wGNV38Gm9APisyMsdYy8mgr1wr
         28pjGsdZMH8PuAgEo1+5iH7tMMj44qu/f3DwruUTwAzFPj56JKy9IcXJ+WaTUluXr9+z
         cFTS9Te+l2W3OD+fURs4qP+qgyyIfDZ+9q9++uTLmHx84gWxwTg94t1mCaTrPMoj0dxJ
         B942DYofve9OaXe5Qt+zav9RvYy5CdbLUtk3PytxfQsVc9uZQiGUFnYM0nLV0BxJhzfV
         U/X3/BpyZsuCEzzBSajHY5Gm5Gowd531f7KxRdUVjY0QGkvRKsrXDCzn6Ae8vpukzU84
         iEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017021; x=1773621821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oSzKv/Yso3zqJtEhQa2CN7kDXaRLoQ3igKM1IB73swc=;
        b=phOpGt3jmdKQvThQ+TItn2FRHvliyhCPPIXVK4awg03Mx+j6ctCFxTY+5R3yndnY0D
         KKn4DfEie0wcfgqt1wUJdUj7mnuvs7TBbH9gusvfbsthWoh57WyoOZRAeNqZaZAScIZ6
         Ocafjha6z381Gi5zysZa5GccosELVHd2ze/kOgpumLuBKTDCdVtc1zGF63r/gGOTWt64
         WaLEgan2Kqh8nZgkE1WngcW8Lm3g3j3rdwlAasDYi/aZCOCzjznoLQdRX7n634YUxFPD
         HfIx/JEhtQbRpqeN8L2Jm+exS3OLDhLrZOPSAuOhSQoktMmfkaBreuWhNc94tWEa3z2m
         jQzw==
X-Forwarded-Encrypted: i=1; AJvYcCW4YUg8arGGLqOpGk7W8nuFqFDgux7l9upGeEdOafdepvQ0MZV5L2BAT3XELGTD/oEr4k93WsoplyLL7AL6dzpn@lists.infradead.org
X-Gm-Message-State: AOJu0YwyObUqvWqi8DRuc/rGPWvthjRfyk2cSOTeXOPtSluomWuC005r
	WK2nXkAmgK0iCGpLJ8bUEd6mQQnXrZ96fH+XHaC0A5h0v0z2UlMhQCzI
X-Gm-Gg: ATEYQzz1YY35r+9eQdURkAaGJi7ZlWsxB8O4K1XMfvr5bJQlu/bqvawx3zY0iXm84Y4
	CU4r9mnLn+augqD75NF9EnOvV8PwCC2Oc7/FOUHmWh9yW4GirOe40Z1DyGqcm1lifaYrPfykqM+
	8vuA+1DdZlMB4FY0cI1wHyGsoxrIJdGnYREGImr2vIM4cOuFtVnRsAHxtu5PnFnLzTBHPcR7Xk3
	hosyA8CiIluaz8xWwv7k2++ena/ia8PCeE4itJi8LGP2NkDuO8+Tz+Nh29lNpLPCLLhlT8cklhu
	5s0nvvRzh23UTo3E2i0Rg7G1/M/+WPDabh8DOCqx/6btb4jlJP4O7wrB22zOQKr1iejUw+csPJf
	SXvgRzsUqsksmT6qf2FHjK2X40wMOr1skkULMlDoqfxQO8FXe3g4dQqoSvdLpHbKTVqoay+I6Nn
	1lI1ZZ+af2ZzCrqrL3U/rOYyG/xFTE/swIpQ==
X-Received: by 2002:a05:6a00:1a8c:b0:829:810e:8af8 with SMTP id d2e1a72fcca58-829a2dc4f99mr8946097b3a.22.1773017021121;
        Sun, 08 Mar 2026 17:43:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46369d3sm8200195b3a.2.2026.03.08.17.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:43:40 -0700 (PDT)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
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
Subject: [PATCH net-next v8 0/3] riscv: spacemit: Add ethernet support for K3
Date: Mon,  9 Mar 2026 08:42:41 +0800
Message-ID: <20260309004305.315018-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_174342_719690_FAC33C77 
X-CRM114-Status: GOOD (  14.24  )
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

Inochi Amaoto (3):
  dt-bindings: net: Add support for Spacemit K3 dwmac
  net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
  net: stmmac: Add glue layer for Spacemit K3 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
 .../bindings/net/spacemit,k3-dwmac.yaml       | 102 ++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 345 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0


