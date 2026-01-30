Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946AFD73EBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 04:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=; b=cX792u5KWQCY95oBqN7dpLU3TO
	UIcsEBE31GUfvaTPAmakPylhJD+pfqrcPYPXkPcdbfgy7oNstpgWCQynj/dOZzbIVCLzvvFpBvZ3q
	V4SaZCOgejMRRbQ9C0s5HWRP5cLgNx+YMxSQuqJJz4TXxtibITbW/qB7sXhBY4DghhTQw7lupovl9
	32EUoa8iEhkWcV7LLmBx84p8XostUyINPktkxk6IS7IcZf9lN8x5UHGAgidqJIde/hA2SXDnDZoQ3
	oIeuQQL1SO4IFDD2ZXAYQCKaWjXDlUDYBt7rOi6syIwZQFgcSZHXT94WvPISL3OClRmd2ha+7dCSV
	MG5JN57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlfsb-00000000zXu-37SY;
	Fri, 30 Jan 2026 04:13:09 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlfsX-00000000zWu-3aH6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 04:13:07 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-56641200d6eso1243574e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 20:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769746384; x=1770351184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=;
        b=glWAWnLD4VFcOacM2b+Cb9Gszx3+8xa+pxQ9AMT+3UxP0oSrGqwORKuoMgZ7rZs//q
         hT8rUMzMdZK00Ie+Q3TWA9qXK6Xt1m1tBUuFRpw2uxerVdJlgn2K+KP5c9ywArWcGBR7
         ZVp7JGMrlPBfIKN0DXS5I/xY6fjaLimrzufVslgis2+j5e7Ayg2iBd+AGIXkJLV1wPJP
         w+C67a+ujcDUgmYfnQqf6n0dNrEXzmLsD6RU32GQT1e7INnMpjwIoDLKfAWyVf5ay9R6
         FjNKPko5xkiLEng759fvgKKlxNo8u/YaDYG03pLRcy4fMEkR8mcAvnrCdVPZ0mGMomcu
         Rk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769746384; x=1770351184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZc1WohjUyOxX27WIht/QOavnc3r+d/i0XwRkPc1NWc=;
        b=UrYEw8Agv6+kMYrRp93VM2r+8jdJiS/miMURd8Wbybk3LfEeYdO7Kyb4Y+KwmlPmOe
         H7KBucE999LlJxAiUzDdGkWBAXBzWhJbP8BCci9ENj8eDIzKrnKWpQgZ+1Q7uBrUKicM
         CM0dk8YVMuYqvacrFCIlFBiWgEbYGa4SFOchyI0h/KZrj6WO/tXYrCa8PxxcYJyt+sVK
         1c/kJ7jYP+AZO1ysVaS0dpHOp3fn7fQV0yXep7R3laa2ylU0yaDzcUZ+/5wy/AoCy28E
         U+pQDTBB8wiFvu+El1hVdsnLQp/GhxQmitGMy3wNKS8Wp6H4sG1R1snVtw96Ir2cDxtL
         1BSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/9xdiMS9KZyrliRa/mLz9E+5A0GVUn46D5I15qGVPPWFAELc6xdwm/wQP3Jk7coDKOa5jouP7ehlThhGAKWO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw42MC0XiVUnE7FHjaLz46PioHmavn0dkYHfyKxzf9bdnPipAYQ
	ytOdhE91m5w6bCrXC+TKtV1yng3yvBzFmNhFLMS6Navk3B58L3D4qGK9Ndf8KTrd
X-Gm-Gg: AZuq6aK65Bt7L4DA/A6tX/I/BGUqwsCealHPM1f6EB+OlySYXMMoJ1dtr8lEsT2C2If
	HIzmeoxkqYHA3GH5czpSl4m7OSVVfphZd/EZ3N3k8IJOQtchi5nZoamjRhGOOSfquHgXTq15ItR
	ho0GNh9IW3rk0bDxN8GpwhMFehRHHVAA6M8hAft+B6Os5dUW+4/WfIy/dtyYN0A3i1udomPBIhH
	7DY/cwpcgVcXOKCsWF+ngK53vrinyz7v6S/zCQKOxw/MV9SdqqxpMTzgiOpAlO3x6eOwI2IswrM
	95lGWVQbELyTdTx/YnAaW0nsyl6mJ5zkxM/wWLl1EJiiv5AoENMRfvvJx9JYJPvSm5PVmOg+pkz
	niAwJuOV9skni8kWdQOoNa2KY1ZtIxrZ0sYKMoWv9yZJPKTouDslsg8PfwLRhTo9kNdhbQ+FNUA
	ie70aYDELT7Q==
X-Received: by 2002:a05:693c:228a:b0:2b0:4ae1:b4ae with SMTP id 5a478bee46e88-2b7c88d6423mr747779eec.24.1769740046251;
        Thu, 29 Jan 2026 18:27:26 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe938sm9799883eec.16.2026.01.29.18.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 18:27:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Yao Zi <ziyao@disroot.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
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
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet support for K3
Date: Fri, 30 Jan 2026 10:27:01 +0800
Message-ID: <20260130022705.1059214-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_201306_589920_71EAF385 
X-CRM114-Status: GOOD (  12.91  )
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
 .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 194 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
 6 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c

--
2.52.0


