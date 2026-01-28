Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD7FD25B57
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=klJSobxqRNPxXq5lBBZpXaYGDx/qIxNfyIEWdrVXkm4=; b=Plld5RwYsJV8VDFXkuwRAcpdXq
	049msHesaKNd+z80P5vl5lb7WZM+SfqMT0M30tPKjt5mjhAcpa1m64gT3I7JG1YEQyfnxatoEKOh1
	Yg2ZRFjjKiKGCidXmIAz/1sYhZRUvM7yDa6q1rU0N5jA+wCYmmOb59Q+e7ufez1UZFbXryTWst3Ve
	PHe6EdTEPAHwmJ2kCGwdSJ0iN0WYOrTQpp4wBEK6RQZJoylqdor5Tub6IAy+3xg0BdrQ2Anca/EI7
	/cOauuWl2YGLzb9IAfV0LKGeRC/cVptxrxktg17uCIekMUjhpFzQfLcOmfwHb5TX1+ww3KJqOq6jd
	uQHtCwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl58P-0000000G1ds-0PGq;
	Wed, 28 Jan 2026 12:59:01 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl58M-0000000G1d6-0dlR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 12:58:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b885e8c6727so176306666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 04:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605135; x=1770209935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=klJSobxqRNPxXq5lBBZpXaYGDx/qIxNfyIEWdrVXkm4=;
        b=FgaYSNtEG7IXK/fD4CpaL5OfuDaI6Ji0vOPvPgao+TtK6rXiHhRMSuaBacI2BlTDnU
         6K2puMxLPEN/x0VhqLwY0TEqJwRHbKy7yWa3DcrxpiiEx+bDrU0Ekt/50AURnFE+TydJ
         H7Jjamds+YTQPj3HYy6yVjVc1To+BviTCR4KcJpVxxRFGsy5tB1lbvEbP3/3LaO9lA4T
         AwYCrezcQluW2o8wD0yzNanBSjwS7BIr+KZKe5s7Po5TGeuxLVIVjGxgCRxigciTmGiT
         z/saO/eClRun+ylRLjWv1wciolcOlK9vtrCf+CG+2r9XHKUEb4JsbNcMZPPpKPb+OFYw
         sZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605135; x=1770209935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klJSobxqRNPxXq5lBBZpXaYGDx/qIxNfyIEWdrVXkm4=;
        b=WM/dut1q+iJrMt4sLBTE7LPvntL/3NX5Gwub3pKG4J6XLA4Ua5R4R4DAGNF1f54K2a
         +3DM5OWrfZLrMDUtBzedr1ZWzOJ3c48N55c2Kl/WNa2I0GxVlVz+qxOyY52+qJel3EzP
         o8fHCZG5u1AM4aNpal/DR1EurCv9NESfDUsE12u6R2sSpYnPvvwtJ/CxOFX5jSt9aLjx
         uaqtzihq11GFa+rWOq/1Bor6pIF5iAsTDnNNVVQBmtK92GlTT6mwqVbN347DyOo2GyMt
         VDk9J4BY0uyC9/VoQbxve7USBGGBjCggG6cchLbI9duUih5+owliCdXgQuJcQIFi0+CQ
         B5bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmCjnPH9uRwAdyWFI98M7L9QXnqDiA8/Wo9CdJcumy16MJsZefcKMeb2gBh6CqyDhAJFQP+yc1WkeuYTMd+KbF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5kFVfF5sP9PGYxLZ255XKfHHDEDORUpVDYEI6j10iCMH8hMVm
	xBhuVKLOM+tCKPxisUCnp8T1mM8tXMEw9BBA9ARL76eehtOUfb4vJpdw
X-Gm-Gg: AZuq6aIzow1edDu48oTt1P3bymSiH8FlAV/iok7jH0hIMcmmPY1CA4bPQVE70bypawl
	AzTgxY5UaaSnFChtTT+3ue/MHsKZjtGLz53lYju/PD+8nn8r1TL+4MLmnrOkEvDJR/E1yqIBsM8
	PQ+9H6D7sumslRoMq/GmCYtGqHEg6ng4SpIHFWLerYMf00EYNrnX6koV2TMkLq8ilNVj0Gpn9hn
	HaB0MzMTdd/RZDsATxKbTdUXcZ3vRG1OaMnDeYwauLKub2t/zCKPu5aZcwrt5XFakZZA9rNzOyK
	U6ykiArKtQfY4W7+9wNWt7FZzDEhGz2LPMRa8rKrvYjLyYIerWccM6xaxgJWLaFKIKQmVt8CisU
	R6XXcJ1K1vPFn2ulwgETWIJFQJkPW+mQCwofSQQ7WMOsQeL9mmenSp8KbM9vlF7vz4dvxvvOWNC
	smErzldB2P4YViZDGFV4q12bWvzifK21r8r0iUdgGMKoYBUg==
X-Received: by 2002:a17:907:7f8c:b0:b88:3d20:3f44 with SMTP id a640c23a62f3a-b8dacdc3040mr351146966b.26.1769605135007;
        Wed, 28 Jan 2026 04:58:55 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:54 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next 0/8] Add support for Renesas RZ/G3L GBETH
Date: Wed, 28 Jan 2026 12:58:37 +0000
Message-ID: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_045858_205787_FD5B9419 
X-CRM114-Status: GOOD (  10.36  )
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

From: Biju Das <biju.das.jz@bp.renesas.com>

The Renesas RZ/G3L GBETH IP uses Synopsys DesignWare MAC version 5.30
compared to other Renesas SoC such as RZ/V2H that use MAC version 5.20.

The RZ/G3L GBETH requires an extra clock compared to RZ/G3E and has pps
interrupts. Document the Renesas RZ/G3L GBETH IP in bindings and enable
the Gigabit Ethernet Interface (GBETH0) populated on the RZ/G3L SMARC
EVK. The eth1, pincontrol definitions and hotplug support will be added
later.

Biju Das (8):
  dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC
  net: stmmac: dwmac-renesas-gbeth: Add support for RZ/G3L SoC
  clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
  clk: renesas: rzg2l: Add support for enabling PLLs
  clk: renesas: r8a08g046: Add support for PLL6 clk
  clk: renesas: r9a08g046: Add clock and reset signals for the GBETH IPs
  arm64: dts: renesas: r9a08g046: Add GBETH nodes
  arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH) interface

 .../bindings/net/renesas,rzv2h-gbeth.yaml     |  77 +++++-
 .../devicetree/bindings/net/snps,dwmac.yaml   |   3 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 237 ++++++++++++++++++
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  35 +++
 drivers/clk/renesas/r9a08g046-cpg.c           | 120 +++++++++
 drivers/clk/renesas/rzg2l-cpg.c               |  70 +++++-
 drivers/clk/renesas/rzg2l-cpg.h               |  10 +
 .../stmicro/stmmac/dwmac-renesas-gbeth.c      |   1 +
 8 files changed, 539 insertions(+), 14 deletions(-)

-- 
2.43.0


