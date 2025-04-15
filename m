Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10D1C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W5pt4Gvn4yUb3QxIoLfuNe/1WdZ6d8gxyQp1HcF2MJg=; b=lQTsGydnvlCIBR2g/XhtH7IEmz
	np0yRD1pVef1IWd583m56u7/8ZyclINCjQkaAjg00u1PaS5ShtKhMXsDx8It8ECCo7QkW1xMH3sfR
	vNUoAB0itFa7S7qyFsRyXz+ss4vXuCPq82kWXJxZVi2S3gB3MOC0ZGNN/iVklzxQFZItpVqSpqLs0
	6LW6FrYRa9Hwdkut6BGXJgzmkSR0YxC/8msO0607DsgcihtttYPze0Z7/zXEl/5rUx09nsm10xZiE
	7Fk0NiIU7hIdRS4TP1ilL9w34OYXLwvFL+vnfXvGa62cx9vc/nbUmIXC04BcSKkhdY+tHt6z32z3q
	e/3gg/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ftx-00000005qQs-12LM;
	Tue, 15 Apr 2025 13:00:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fqL-00000005pYO-2WA9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 12:56:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso39069495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 05:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721808; x=1745326608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W5pt4Gvn4yUb3QxIoLfuNe/1WdZ6d8gxyQp1HcF2MJg=;
        b=A+KvCVxAuTAYpsMW90J8d7zmr3j+IOvyN35Vk4RNosNgxPb6d4NCyPaj3tgojlQYyp
         BQcKZW6MIdaLK3cwDX5wFaIKnmAOQENPgxtRldJNfFhCP+s5xdkzvPLr5c+Oth6UH3HF
         9yppgS781OX7b6tkEZb9qR3ZzgnlqWAohrsP0c19iFb/f29/BZGxqVen9dicDP7OlG/8
         q+NQj3lFsL/j4MWIbL6C3DPxjududGu6enWqApqQdJKI1wKkCp/wR57OulXQwvSRZwNE
         R4x7oZwmtnJPV8qachH04oNKvDkjI/OpwZa9zu3BSQ4Bl08GgMbuUh2cSNkJUoqc+BOy
         i7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721808; x=1745326608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W5pt4Gvn4yUb3QxIoLfuNe/1WdZ6d8gxyQp1HcF2MJg=;
        b=vC2iy2hNLu6bh3HCKna9qVJKDR9LT83QCFvwYfITxuGqbY9DySeLAfhnj3BdVEOaid
         lPbchgc75jCW0C74HcSAAuWbbgCpxgYTjVvHwOeoC5FFqKWQFehFeGJ8m4FppYAvrMHY
         IPNzPT8Yi4m2+cGi3zBS5ETUGHmrX2fglkwG3H0iuaFs7NaVPB4G4vfjVZnqI40V/76R
         8onGnUuHGmc4g8rNo5hGJgiX4I2YxlJccsNSYOvw97C5o2JYw4PyxvetoBa3MNd1Dzbi
         7bPwMY4lsIr/mj5fmW5relIEFubgNBZKJYrC8EHzVqIGCzsAzm/waP4HBGDJpUAPNe+8
         Xxow==
X-Forwarded-Encrypted: i=1; AJvYcCVMCJ0RrWDa6O2xVm88AvNQS8J1xB+ZOXhpxBdwKj2nH6IgVsQY1WigrXILmSbsxj3w2U5YOanU4sQ6UNAQY2Ht@lists.infradead.org
X-Gm-Message-State: AOJu0YwEuLe9yUBa/yuylDyFdsQKg8OMl1StihURS3orpYSgwqz9SONV
	O7qqFVF6nfc9x5ziFZr3dfARkUSoeeacxCVB9oP01LXQ3gnkhaqD
X-Gm-Gg: ASbGncuZ1WllnHLhUPLGhN7yfsHhHLhwE7LZhjy+9Htby+b/R0YdxhRe04oppZt8r+z
	UNw7Wj+DRjdLobmpGs9pNnssc5z+L8EInbIojf++0qm8cA9KQPXo/CwdFjGo7mPnARTis8mEIWH
	5CF4d78lipzXuAKVWDF3FTdsVraLik+31Q0/fs8ZSl7/2n6gQ2kfGpUWljScU/T4ehbs7gwN7zT
	Q0gUmN8iU8tXwf8y9xsyHZGNx6sF21h3/nqGzAPPo0N3JTGPzezZbhQdtmHXV5z+7X37CfhbLiD
	oDGyIfkt54tN+7zCCpXwfDeqWiqQFNJLDSOghS68sR+fG+C5I97Xv7fVG7n+WRgZ
X-Google-Smtp-Source: AGHT+IELhuDdfbIl6mFeNSEZkwV/cSRz10AvfqDx/26kpRUF4jOcOhkse6JnsntGo5yjX9aDqfZTjg==
X-Received: by 2002:a05:600c:3501:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-43f3a926d56mr162646245e9.2.1744721807628;
        Tue, 15 Apr 2025 05:56:47 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1883:aa4:a265:bc12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96bf97sm13922334f8f.25.2025.04.15.05.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:56:47 -0700 (PDT)
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
Subject: [PATCH net-next v6 0/4] Add GBETH glue layer driver for Renesas RZ/V2H(P) SoC
Date: Tue, 15 Apr 2025 13:56:38 +0100
Message-ID: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_055649_640771_7ACFFA30 
X-CRM114-Status: GOOD (  17.76  )
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
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 148 +++++++++++++
 6 files changed, 385 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c

-- 
2.49.0


