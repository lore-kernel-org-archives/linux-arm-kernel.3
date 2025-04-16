Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0FAC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mv5JrbOdws3HwC8g5+UOFGbdPAGiQtrVxdnxmWTTx/I=; b=aGDbrPkWuocmH16Un2flj9Bv69
	lbqmS/uepXq3X9mPlgXfFckw2pepWyhuAklbQyw+Ol2G0+XLX8T3kmwZcoOy6h3Mjaami79fgLWnK
	9ssAauzYK5Mf1PhCSKZe8tbJ2pwG35YtbPuDsO0Dtyik/smIGMm1I7OMC44Z5QyBagXpd1ELC+m68
	z6khAYsFolVYINPIEurAK4M0kqekTMM/9/BDfP9wcs45oTPtaJsmSFG5ZeBzFxsRdVGIz+56hhoRm
	FSMrTJUP9uCzyERcqJBHycrqOcUQatWC2nhE+LFjacxNiiRP1QLhU8zMkXrtEe0sC4Ob6lw6oXAcT
	FE36r8Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50Dm-00000009FdI-0jj6;
	Wed, 16 Apr 2025 10:42:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u50Bs-00000009F6v-3csR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 10:40:26 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so255350f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744800023; x=1745404823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mv5JrbOdws3HwC8g5+UOFGbdPAGiQtrVxdnxmWTTx/I=;
        b=FfZcwiMzsWXZl3TgAv6oKFOAvnAgwv5VkE5E4zLIGYw+8ngUmzMzETw6ObBmKF+iEq
         WOCoYTzfbICLHuwcS47rofqL8usv0b3MJgfYITkpgvXp8PkDwRTTRADNSTkSSnJ8HYQA
         hUOa9rHJInp9RMDgH04asLkGc2V50xawN/XsVVFvzhLOoTbjwfDzm04pSJm69hGwSr8q
         /kH9gyfeDVIb0sZKOvIEPsFCpmUW0Y9OgiAi5TQql8xFxvExmMwwsFVGzlQTLdmce9iZ
         7pU8TYEvL/9jEv0IXhJVt7JGmkedgyVWw7TpcOp00qEnFKXSWwGBMXIo1n4jM20v5E+o
         hFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800023; x=1745404823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mv5JrbOdws3HwC8g5+UOFGbdPAGiQtrVxdnxmWTTx/I=;
        b=OfD7vSvzsoprdtqulLaBeD2Jhd8kJcheTnvDhlac7IfSfvaTVw6yMcbhdq2HwZLZGL
         OKfsSO/qVmVZAtEKUyeedgCLtS8YZsjA49hn8qiNrA7jA/gKPCfg5Z/Mrxl64csLhR0O
         cViXXvWgIjK0LKh2v6r8oQoV4CmTIhRPXpu6YiN3X5ekchX1guK2oBNM3BBK3eWl6My5
         Ygz0ug+eQwrg9HcTrrJgUlrT79kRwPB1SG4mj0yrHhY0Hf0Xa28kxp4/1Qli/FhyFztT
         RXKopOygjZ36m490/jd5+fkQBOwmzpISh/nnm9yQwrGC/fOwgGF8/uXGjEQyfOXL5QW3
         5VGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi3RPcoBwf7ufcNb+P3hLvIVG8F9xPDCrUjTat7I7O+4bElbDrhQEQPFr0JmqE1+Psftfzl+XmXFqQ4BElPoDq@lists.infradead.org
X-Gm-Message-State: AOJu0YwpB1Kvxr4shuYgXaIM8AbVYPpFiMEtaNFf/DY6PJoIkZM8pToY
	8eH3T/+PIsncVOEm0EkOaZwVFJ6kKBVrz8YjwvyFXgzjglgkEnQD
X-Gm-Gg: ASbGnculi+NwK3Ydjs45iyAlQs0KXxcXZhOX2ySR+2vMxFxa5XCzG0TE+E5WN8ZOCqF
	r3+GXkx0woXnZa5mlNzeZTGLsml2Ai3b4oXd2XNcFvk8OZ6WAROFrkgbLpkdzluVMSGIy1Lh/Tt
	qRLPEFaBH1XheMyK7DYLTEMQimNqN9qxhQF7Ne1YTEd4RreX+7igX0SLXiHPN0VgQ71hOzsyKdE
	eIdIfwmjZ6RebU38m3vMCJxOZ7b91prQO+/PzP0bSrmJCviwRlDOSc/i8o0P5wlNBh6G7Drl2/w
	qMtJlTswRn42EeJehDaBI7G4ECVTV/+jhIsVLpl9zf48Vpg3XFbE0CeSqLndJJ6sDQ==
X-Google-Smtp-Source: AGHT+IEmC1A8qA+sRExHfTeMoNJfkOFZQJ7/LGNEZ1U+WdFIhRlxg60Mb+7It31CYcz1Dh5JA30pqw==
X-Received: by 2002:a05:6000:4312:b0:39a:c9ac:cd58 with SMTP id ffacd0b85a97d-39ee5b1d601mr1003925f8f.29.1744800022869;
        Wed, 16 Apr 2025 03:40:22 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b4a2:e121:10d6:ac54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964089sm16824975f8f.15.2025.04.16.03.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:22 -0700 (PDT)
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
Subject: [PATCH net-next v7 0/4] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Wed, 16 Apr 2025 11:40:11 +0100
Message-ID: <20250416104015.47788-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_034024_902142_67BED7B7 
X-CRM114-Status: GOOD (  17.64  )
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


