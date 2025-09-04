Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9540DCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VHuZOG1JpG+6j+YJABc/R/0AWg29WXqcswDzV+63td8=; b=TmfgabTdTAXQYbLowIOdYtZWcf
	YRdXnzYlmxL9T7o3da9fcqC9NT+1Wlwryj/GIfZZ/Clneo4nKKGaGjPSIwpkcxXD2ZDPp76CYni32
	/CBeXYKgFuzwP9RKVdb16PirvXdQMzQONH+GPly5P8BZrOSHNK5v6AIpqHg1DGbQ9v4JYKIzmHZh6
	AgaQBPtpxsf25o/O3UZH/uK3Y1fkqDlIS2W+eCAZrhfFqalWPsB7w6ciHRpwhA6cwPcNFZqywjoFW
	pGxESD8QgCeOE4KpvK4UOw57UhGfkmr49eVHe9d54msRs24NafVshjLtCP3Oww0ywNiythB0z0+VE
	5tH+B8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2t-0000000G1QJ-40Mw;
	Fri, 05 Sep 2025 02:19:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGkN-0000000EKZL-3iTQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:39:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b627ea685so12509595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757018394; x=1757623194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHuZOG1JpG+6j+YJABc/R/0AWg29WXqcswDzV+63td8=;
        b=m+TomznQB4WsR9uHQSVL8+N6IHrx+n30kV5K4O0A8Uj7lgICJe/TIg5DaPJnN4BqQN
         saAT8X4wSAQfrmaBGy3GyVxK6SUa1uO+LRbEXBGqIkAJQ4Bw+3hLB65eVBQgLbo5xAoZ
         t4pFlpCVSW2zeHWHRj0bz0zFlQawx2OEnZlam9KBI9PIWkuQ4iH4TJOXPs9Mm8QbgyvQ
         4pjHTWq30M9sb+u3E9W1Jk1HKE83WW/uaX7kqmyeVLN/+JpOT4IPT6tePZW+tQCfaz8k
         2dJdsyDykyxEo1Bu3CwCXFbQsOxM3AuTqGRgLp9lNaZplNvUk4bq+1wVWldJbQsIec3H
         wOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757018394; x=1757623194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHuZOG1JpG+6j+YJABc/R/0AWg29WXqcswDzV+63td8=;
        b=AqjL7BrNnu3pEomXxQ6MWKAi4Npv4nrYrjLFN2H/pbXhYqyGvGFoM3PrHodS2iRMPl
         geDPR91smKlfKJpRavoI1tztgqdcSe4s8dmeCrOQN+Sl1y5CHv88vouwTN4ET2TyhwhT
         8mBYbTJbvXm2VUXWSqNz2ucb6glaJyB4JmSRA2HnrTMLI/jEhv0lor5NmzVy8+6vOMPG
         bHbCK6Ro+gx1D0sM12NnrFuj25AuwevTwBrvyD/sjms2s3y9g5y+h/ghHi19RKY2ynqh
         Gk7HlOHw+QLTQGwN6Tk5WfC8mO+tqxYA/+cTbgMbaxImdpI3nL5n5nx1B4oYw+tsWwkz
         HEpw==
X-Forwarded-Encrypted: i=1; AJvYcCVlh0VGn2zO4Vvvk2hF7dyege3qX+ETRIbTrbW8Z0Zz4Yn/5ntuEVeN2rSAIdD3wYF8nzDcJgHi3WghpWZX9pxk@lists.infradead.org
X-Gm-Message-State: AOJu0YwXMyMbTmwlR21LwmgbaU+9mFOlNDWKj1YxiWMJuP82gRXm6wki
	qwHJUeqPzxgOyxDPonptGigsg6XQLxirZosXPZI0tEVOiy8xyxFPSn4o
X-Gm-Gg: ASbGncsmKQEQrEy1NDbLC+4AkQKT//tvtnDktp48e2bhPNUorubwKUx2xO38mnkgnqL
	NlNnpLB+mQYL2GcZNxB8Dg57Ktc05ukDGQ15Vw/3eV80OhUYfAN7Pt6yrdod7KUQpINIRk19VFb
	2bG6A65E9E9R2bucgsRQlkI99P1e8xjxRlsaihbCbyNxh01bHabV49Sq+U1+hoS5cXXOegcS/I1
	3d4wgSTfuG+JNaOLFHpMGy4yp+Y3m6OFFKsO2TgAtP9fWz4xrXr5hE94KezZfToViKVNWCSZ0vi
	YTIC8Ml3R8hdvryeb3n5mUHcfU6os/ErEtFwB0c2ircZUwv6/MWUcwlCyZwIorElcIek+hyGNEO
	CAK/+rhcFIszL/ZAjA/Y/5214k4mHX4fMLDFAMWV3LtIOyGjpMfEh7WSkgg==
X-Google-Smtp-Source: AGHT+IHlvUXFtdZ6T+mhP6WxjKgMVUGGmx3Q9V4gCTiNFzGUlsXnsJbQjfN4KMrRuKQgbFoPLcI9rg==
X-Received: by 2002:a05:600c:4f81:b0:45d:d1fe:804d with SMTP id 5b1f17b1804b1-45dd1fe8388mr28814195e9.35.1757018393660;
        Thu, 04 Sep 2025 13:39:53 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f306c93sm385528165e9.14.2025.09.04.13.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:39:53 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/3] Add GMAC support for Renesas RZ/{T2H, N2H} SoCs
Date: Thu,  4 Sep 2025 21:39:46 +0100
Message-ID: <20250904203949.292066-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_133955_927350_3D9E8F7F 
X-CRM114-Status: GOOD (  14.68  )
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

The driver changes prepare for multi-SoC support by introducing OF match data
for per-SoC configuration, then add RZ/T2H support including PCS integration
through the existing RZN1 MIIC driver.

Note this patch series is dependent on the PCS driver [0] (not a build dependency).
[0] https://lore.kernel.org/all/20250904114204.4148520-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |   1 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      | 109 ++++++++++-
 4 files changed, 243 insertions(+), 54 deletions(-)

-- 
2.51.0


