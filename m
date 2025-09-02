Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC877CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 00:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q1mPp0F3Ah67cHyiE48MxxmEH4zAc3hcVRk+cgDLZL0=; b=DQ11kd3xcXWWaEcjgI0YhNb/Wu
	GQQCC0r/bI9MyK5U9HSno/Y9T4ePoIUUEvKU7Rk2PpJMOXlBipk76/S/TOxYhob5Kp4ZeHSNfUyyx
	YSoNHskuWZvLhl+nxWc80hS8b8boJUhazO18fy4GYtOwwEInx4dTr2jKv2pU+FJe5Fwcg5rEJQ2IU
	pGSYz9+s3YOKJjsvg5iDeztKAS98MudYv76SO266uLCT/b4qSU/GjM+0uYuqLNOAu2bOEblfL1Xbm
	q+breDPcFHY3Q4bu7UlIWbUwWlHRTLZyXd2c8AjpHHqwhcdgcM19sNwciAcUEKtE+igo00FTp7y9L
	QuJTvJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHx-0000000EbPj-3hi0;
	Tue, 02 Sep 2025 00:54:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utEe3-0000000ES7d-2QPe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 00:13:08 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b869d3560so21398765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 17:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756771985; x=1757376785; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1mPp0F3Ah67cHyiE48MxxmEH4zAc3hcVRk+cgDLZL0=;
        b=Pz+GoWAramnHpt9bWEceXtSw0ieg4jZ3nKVkyrouC4bniXMdoip79B5OcNeBm1gYH0
         9X53192J3Ep2RfpwEG1U31xIkxXSrH0WMBuOVadCp4yDaq1mrM5KTeCD8fy5MDVCoN/C
         kih8D6KgdeMgjT3fmQI8NfDcJAzEWWiE8xIidI1Lp2M9ZzXg9xI3VHV4NPtZ3oBGmElv
         Ue4cvQHRDXH6nr+r+XUTKFwr7FeXaq+b0RI3lYBXUegBvHtYFl2FiaV4IKi2veWONAXI
         7kpfj+qx7lAEG2XZmc4A6rGJ92lcx7gG9LefcZEXWcoG+LtJFnYSGrLS3WD+7VqrVa/v
         Uflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756771985; x=1757376785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1mPp0F3Ah67cHyiE48MxxmEH4zAc3hcVRk+cgDLZL0=;
        b=gXvHvPduz2HIWYXUdx9Vi/96wVkxmoZwP5ovWtFkVQm0KIjtsp2QMiWUfqmqNRlfFH
         UF1W9RSpF1y366g7H8SfgSbwGEGlkZrhYgKU9XKz+D0etu4WIp6RU+1AF2mDL6uPhWnQ
         6hwWHMz15qLpR7iRTwrBzfdMZYizclPjOOR9s7Tc+gJGCGOzXv88TanwL1oGcq/VfDr6
         mu6JTyh+pwfDbGt9PCqQfo0b2hOljLJd/i5KUUEGWL6iUiK2dJI9YOKj/2Luo8DFR6P2
         PHeqqhk952luXpV87//wUb/kpa5O8yIvCTk/joUlsbhiYTFBLWreqjUOakOn3GKrgzQw
         POnA==
X-Forwarded-Encrypted: i=1; AJvYcCVmUdILP0GlllcckqZdO+E4ebyZs2lqFkfUhEC7Y8gDLSJ0m3kREzjhfjvQ3go67NQMehCLl/Igqm1ZwN9bZj+l@lists.infradead.org
X-Gm-Message-State: AOJu0YwkY6eYFd3zGGRgAp2vyuzu7NuNADoOg1Ju2/8eP1WvEmQ+VgKe
	fhCSTblWeyyu2SP8jYf979SX7fx4gukyia7q/FTYZL8n4AyKNnkEgw2c3Phbps+T
X-Gm-Gg: ASbGncswam8gKyIKvIza7Y3Dd+CU5SRtSCJa0EdRFU5V5ihglmX/zxTQjXQgCLLC1gt
	PUB3kA5c2yPqt8eQ4jRxp61sdqPygfw3BmbFElFHy0oNuOA+2WqQAC9i1D8ncMgs9K55B/UQJXy
	9L48Hv7k6Ra/9bzze7AqaqTEYQqQHP6XxaePnEptwVT6X7d0cHiMn5Qmgntr4yqnysMCaud8W2Q
	tqI3+FA6LkZjcb+BOGBW6bcXORd9CpY8TKxFyxlDu5lQr+VDYapQL73P8TMAsjSHz87n/muGO8k
	lOeLz3DwHFJSWPQW2i3joGxvs2OUcqp2iAQpN5orF07S1Z/k19tTw5b0c84rLRrclmCVjRQsNy4
	uJf6OdnM6GGI9Ul840GkvUrVIOJjOnFEJ5pAF5hXKumeZWU5V0ATCdQjD
X-Google-Smtp-Source: AGHT+IHlL6b2SMKKVhDDUJtZ+fYdvzkf8dl0zJkUIm+063lRCpw2Z5DZm3K8fgdPIHbsJgZXADiykg==
X-Received: by 2002:a05:6000:3106:b0:3d1:c805:812 with SMTP id ffacd0b85a97d-3d1d9ac1cbfmr6494920f8f.0.1756771985380;
        Mon, 01 Sep 2025 17:13:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm2138153f8f.21.2025.09.01.17.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 17:13:04 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 0/4] Add GMAC support for Renesas RZ/{T2H, N2H} SoCs
Date: Tue,  2 Sep 2025 01:12:58 +0100
Message-ID: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_171307_619272_ABAE5C0B 
X-CRM114-Status: GOOD (  13.68  )
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

The series first updates the generic dwmac binding to accommodate the higher
interrupt count, then extends the Renesas-specific binding with a new generic
compatible string "renesas,rzt2h-gbeth" for both SoCs since they share
identical GMAC IP.

The driver changes prepare for multi-SoC support by introducing OF match data
for per-SoC configuration, then add RZ/T2H support including PCS integration
through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0].
[0] https://lore.kernel.org/all/20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  dt-bindings: net: dwmac: Increase 'maxItems' for 'interrupts' and
    'interrupt-names'
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/T2H and
    RZ/N2H SoCs
  net: stmmac: dwmac-renesas-gbeth: Use OF data for configuration
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/T2H SoC

 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 177 ++++++++++++++----
 .../devicetree/bindings/net/snps,dwmac.yaml   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 109 ++++++++++-
 4 files changed, 242 insertions(+), 54 deletions(-)

-- 
2.51.0


