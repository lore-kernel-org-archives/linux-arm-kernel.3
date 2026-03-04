Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F67DEC1425
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=umiDmXimKnwg21TsfCEQ72OkpzfSgk0ygJP0kl6mnKQ=; b=sb5OxOJuilQcu3g1SzFEOHKl+9
	P1ZxmO/UCUDjLpmuUzLBULqKy6OM4V6dG3z3b2cTacVqQVSzog0CqXHyLUgaq+eIwN6LUH12JBszq
	kpT/gC8xB/0JV1aI5xTwI9qhrB8Xek8JzZOlmXb6GfwiWOnX5KExVYuvcqmRrHzDC+Z4G+kJHR2Vv
	iJUbf0HmysvJ+pjTA0yz1L/nYUMB+ulQME7r8rd+5fo0QY2DYT+uoORi9ALzGAQmzSz6dErrrKJkd
	dXI2VjnEEoGkV+IwyTp5h0kdDUMbB5S4K1xKhrLpYxbHpH4ga+89GHUJWk+wXuRQLttbBVziFs3vN
	wr/JqUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGv-0000000Ggro-2zZN;
	Wed, 04 Mar 2026 08:07:57 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhGs-0000000Ggpu-3aeB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:07:56 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c70f91776fcso2557680a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 00:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772611673; x=1773216473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umiDmXimKnwg21TsfCEQ72OkpzfSgk0ygJP0kl6mnKQ=;
        b=Hx1tm/fOCgKnWvFG9+cAjZ4bvtTMwGB3hM58EkzUD8MAM7JNVst/aDCltUTTwzH/qR
         AevlS8KRqTgN7MXsuEO5Ph8qQXgRR3s+C4roFOrDufex15p0ItAXA1jaxwgRkdojmZ9D
         MuvpYntQiOPL2cG7djVMR4phF4dZRVfHiqdexEi+aSho66kw48Yidw2yC1XmNll4SSLz
         XH41ee5E1m4kiZlRSPGGdsL/7l1E0HinAgoLB7XqYsK5yGJhAfsci3GRLFCIwRRLhhcH
         mIjnX5WKvSAszES2tHqDFmTI1ZsdWm3yWUJAYbVleGUkaRUPn7yP5mE5UH7eLmpGrh3N
         o2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772611673; x=1773216473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umiDmXimKnwg21TsfCEQ72OkpzfSgk0ygJP0kl6mnKQ=;
        b=ngePcpb5Rq8VCPEsQ2irxpYZqUOabyNI7xT+DWdcqDBq1j0TqlObUy9fJzjdR9xeqO
         duECnFBK/NIuQv2wl+Bslr6QJOJZenAZAnEyzyKKqaAcDxYBuZSnYKzZNmrSrBBgcnvH
         cRVtpbQ61BKqLG0+RKbIM3/EgCxpXAmME41t735mDarCBWPAhXGhgdbhztwTaP7YSpop
         xheyKCPFVFBdQIqurhkgiNJ7nTJ9hitv9av0mpuGNW57cAR3ysA7Jn9N5DNDDvy42e7r
         beHWZOPyIWvUK5sbmyM1+2Het0HW3LGQjAUnwExLqJQ/U/mJ3o/kOBRNrpQfKuVJPMEF
         BY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVr9zcDU7y/3g9mas465Yho9oVSnCoJOM2Pio65PkogTWc0We9tknm73bFknImP6FztmmDSmfZ6k/vfTEkovxj@lists.infradead.org
X-Gm-Message-State: AOJu0YznPBF6X0U81z7Vcz+pEEcFDBOfwtGexueIWs6Iy06En4xXgini
	UBtB6BlRB9mhbnfm9zZQsu1xzOFgCkXGlbc9negpBRwH3gOL/gbEzTRm
X-Gm-Gg: ATEYQzw3+fkxOfrSia3g4VmL8/Ft0cVih07jmPdbqpCgPI0RtX3LJFYgPj/6grLjNDT
	eD6R29Fm/uSOAmNL/AWp3s8WYUqDdu0c9ox3Dati0H8kxoVreuxmbqTdZzV1YR5yNChp1Z5el2+
	P9Wf1czzS2D7ILuIvEs8HP2uct+MzcBjF3+WsCHY2j4/vMhxzQ3/Uzu/6YQBfskLF7xi5dhCSIq
	x9PuBbzuVym6nVUsw2zrJ/TEldBkzo3a2JvzxvB3M+qklekpfh+nVCfb+QqX5GedOwa5fluDyLQ
	1LjKck0jetgp+A7ncPu06JWUubEafrLrkRKqv626Wpv/VR2hJDv7YJqwjvW13L42r4j3hTneYEx
	pfHyfNaZrRmdaDHYo4ojZgDjWheQuak/4cLI4pG3fwiZvtpqWoLZrtryIQtSy/MIZ3HxUJHf3PT
	Lx25UoeICkwM8EA0pakVdjhrcxXPDuXO32yA==
X-Received: by 2002:a17:902:cecf:b0:2ae:665c:8b16 with SMTP id d9443c01a7336-2ae6ab5ac69mr13854625ad.53.1772611673352;
        Wed, 04 Mar 2026 00:07:53 -0800 (PST)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae489c3626sm94364275ad.8.2026.03.04.00.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:07:52 -0800 (PST)
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
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
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
Subject: [PATCH net-next v7 0/3] riscv: spacemit: Add ethernet support for K3
Date: Wed,  4 Mar 2026 16:07:17 +0800
Message-ID: <20260304080721.1658224-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_000754_892320_1C194926 
X-CRM114-Status: GOOD (  14.62  )
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
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 228 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 346 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.53.0


