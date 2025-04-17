Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFF1C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXozyqUJ9d4xtCCzMWxO4QOFhe8g2i4PdCmKZX1X/X4=; b=dRByNAFyPAlNoy0tpSuevD6TH3
	4sPsXsVcSs+oT5DsD73ub31BGkTSQmvAl3UmtjvQoO7Oyim01BgkRqgYy0eGMJZs2QVy65IDsPwPr
	v361GuaziuOb3w1dV7ST6b80tVPunS6dxfA7oIBVyLIr4Y73Vwa2dnhKQroezPlZTi/hGTClQsyPA
	/MtDYNp5hPpORM/X19sxJN064OKKh1FhNE88jSvG0rPC56En2EI3qsSladVfD4QSuQ2oKxVpgLRaL
	2sidSRGJYoSVVnnSWIWOgty2YgBT8qcH/Kf1mggBa+h65Au9AxLfUnDUa9rJT2/HgKwv3Uoi21xRk
	h3++DFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kqg-0000000CJPc-0Cml;
	Thu, 17 Apr 2025 08:43:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Kop-0000000CIsE-0dnx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 08:42:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso3059095e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744879317; x=1745484117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DXozyqUJ9d4xtCCzMWxO4QOFhe8g2i4PdCmKZX1X/X4=;
        b=nRDzH6B9qckv6odaCBC0GZR+Dzuhk8u0g93yHlEcbQtuWJmh5QQHCh/3Kcdcm5nNY2
         cVI9dKfWMS1EFC2U/xd3bc5SQ+Qc1nddde4L/xa1agm7XmUT/77f9JU0szoTDFAcTq0R
         fA1J7RMIRBQ7wVqND/BHukrstGpGfIEAsEGrgFTL/T5Jc1VMViJmR7rniQ9ixmDtZDgP
         kbXziiHFv+5UhDazFXVOUNN6Un3Xp2DgvTvwV0/6aLUOKy+x13WE/7w3basYJdebjbqr
         /g4A6h+AQiA2/6nQPCy3KgVvFB1pTfFbdikh8roD4Ag2ADW+98h9Adi4F3ddt7SYExpi
         Kq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744879317; x=1745484117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DXozyqUJ9d4xtCCzMWxO4QOFhe8g2i4PdCmKZX1X/X4=;
        b=TntK2PDIrBTCRloYxa1bzdvQVLM695yzPu2mQ8yAAf/NKcHIydB4dgTtEWDjLVrdiX
         CqEkngLMAWAgSvKnwQCBR7HPxoHyGw0BGgMNlKTYZjuq/nBAxB85r0ycIW/xO7dCbZBv
         wL2UfwHgOrFApBhd439RopQdSc2iZKBTmJHtb8uMSRsQXqbntQJpQRu9Yn0iw/HBEpRS
         YM3lj9mLz48RVR+fBG4CKKGpoYOrcPdR86GA45rvOQ5Q071eMPsmmsqUGcNCjbVlzixJ
         1Q6m0I5VGM7XoJ9IJgKEfmuneXY7c6WOOer7D+uKiy4zgn3J/8a41XUb+ZJXTBeihVC1
         tgMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG0+X7Opcx5DNw2Sb4Cz7VCQf3Hj6G9JGTAlgfUCaVHDkRKrzU/j4G+5H3J4iMA5Pqc0Fadt8+EZCQde1hbj+i@lists.infradead.org
X-Gm-Message-State: AOJu0YwRAS0Jhhm9ITik0NwJhGozdSLQByM3mH3HFeCL6q/sL1EoQaLv
	g0bfbHYZelsmKxM9sHHRHZiVTMmVPnASmrJxY4hyXkdXLvma8ZwG
X-Gm-Gg: ASbGncu/Dad6/+sXBmYVcNLNGpUvWh80gZhIY3E8ZFzEMmJTjUCvnZwAzkELRZ9SVgi
	R9zmaH+36r3OUfhVTcgGJ2YNJ642b9M4d63NpJyJVihTxPLZdERYzFRkul05ZLDMfrk3PAzRcte
	wxJxG0cL6Rv6d4/nEIjPk+pQb85PwsXSj4qzyNPQIHLIRNUgtvTDnEa+4WTVv36Bih1Pm0ooNio
	KwwcmqHQMCuUiHZEQ7wKUgvy3vBxnz5Q1e3x81oHKeMsYut1IgkvUc6x5A6ytzhumoPgUbH2wH3
	ysr6phrPYMHyMVWKIbB1SoEPyCKL9JJ8RkP2fBzmKxW8qtqegOiOBcJc0DqCochR
X-Google-Smtp-Source: AGHT+IErRiAS0z3JNyUleWBdVl92EfrzdQ3pXN9rJF3OKf8o4ZU/wUUqjoSjXJtkv9PYKHE0yGdVDw==
X-Received: by 2002:a05:600c:b8c:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4405d61c914mr54409795e9.13.1744879316325;
        Thu, 17 Apr 2025 01:41:56 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3f0f:d684:f4a:34e6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96cf1asm19657712f8f.39.2025.04.17.01.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 01:41:55 -0700 (PDT)
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
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
Subject: [PATCH net-next v8 0/4] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Thu, 17 Apr 2025 09:40:11 +0100
Message-ID: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_014159_193827_70D8675B 
X-CRM114-Status: GOOD (  17.43  )
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

This patch series adds support for the GBETH (Gigabit Ethernet) glue layer
driver for the Renesas RZ/V2H(P) SoC. The GBETH IP is integrated with
the Synopsys DesignWare MAC (version 5.20). The changes include updating
the device tree bindings, documenting the GBETH bindings, and adding the
DWMAC glue layer for the Renesas GBETH.

v7->v8
- Rebased the changes on net-next
- Fixed return value in renesas_gbeth_init()

v6->v7
- Rebased the changes on net-next
- Added Reviewed-by tag from Russell
- Folded contenets of renesas_gbeth_clks_config()
  in renesas_gbeth_init/exit() as suggested by Philipp
- Dropped regs member from struct renesas_gbeth

v5->v6
- stmmac_pltfr_find_clk() is now used to find the clocks
- devm_stmmac_pltfr_probe() is now used to probe the platform device
  and dropped remove callback
- Switched to using init/exit callback to configure the clock
  instead of using the clks_config callback
- Dropped pm callback
- Fixed checkpatch warnings
- Added a new patch to update the MAINTAINERS file

v4->v5
- Rebased the changes on net-next

v3->v4
- Fixed maxItems for interrupt-names property
- Maintained reverse christmas tree order in renesas_gbeth_clks_config
- Returned err in case of success in renesas_gbeth_probe()

v2->v3
- Fixed review comments from Rob and Russell

v1->v2
- Updated commit description for patch 2/3
- Updated tx/rx queue completion interrupt names
- Added clks_config callback

v1:
https://lore.kernel.org/all/20250302181808.728734-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: Document support for Renesas RZ/V2H(P) GBETH
  net: stmmac: Add DWMAC glue layer for Renesas GBETH
  MAINTAINERS: Add entry for Renesas RZ/V2H(P) DWMAC GBETH glue layer
    driver

 .../bindings/net/renesas,r9a09g057-gbeth.yaml | 201 ++++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |  25 ++-
 MAINTAINERS                                   |   8 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 146 +++++++++++++
 6 files changed, 383 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0


