Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A3DCCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 03:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oLqDvu5I7JlAwNybBnp+q/NWLExf0+AtI016xe/bA7I=; b=BH78WzznQ3/MEW2ZR/9rmfagBn
	iGtafUDvyPoAc0u480K7lYStxB+jLY4ed7LMjbbq8iTcrMha+SYEetufkexuiIB3M8eXkss26Q69f
	/aLegBctCwTlJLoV+HUH1gjv+34awiSlqevir+7UgE+v1t9V1PxlF1AZOGU16x3QDeHXo1elMdy05
	qy8Ko1GqEihefcFoRY96AR4BsCsSwtD937WwkRCvfOtq97EXptmJQWTuGhGFoUGOCUAT8PJHwdrqI
	mTipGqEhxtN+FHW2lfv7UF6UqfguPY1x376PJ2aOWxtv02KxchTuAray2bPFzNBzJwzWJdOe19eIA
	J4CiZ04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd4-00000006UhF-17Ih;
	Mon, 19 Oct 2026 03:01:38 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIdd1-00000006Ugc-2jTY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 03:01:37 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-93f1cf92c9eso176344785a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 20:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378893; x=1792983693; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLqDvu5I7JlAwNybBnp+q/NWLExf0+AtI016xe/bA7I=;
        b=IfQIAXZO7yZYzEwQ2LsyLVn+ELitmYIz+gSNIPid8zR2PfijIwQpXOAViHp5kB83kU
         qe5FLJWWL2Z8fCPAKXce/cf2WXpJQHE07uB7auEqMcsGI7GkoyfVs/4iuNk7yE2paGyo
         w9GEc6j0aAuAUPEZXUiSGI7qGMmETOwEY2gY+ypkk2T0erDiaclDvXVkZmBZ5FRkuLA4
         tTApesoovlix5tgBM3PpiwFOfo4xNkX1xsow8cyp7vFAW2aODGpi5ecmwZD5jiXP1CFs
         tluFo8rq2aMhuITsCOt72UPxkoJTXD6zsCFco+Dzv1bwYN6AchAvtpbDRl7nU/9MnKlz
         v16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378893; x=1792983693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLqDvu5I7JlAwNybBnp+q/NWLExf0+AtI016xe/bA7I=;
        b=D6+qNyvf0nRZmZ+Y01AfsxdHNgioLcAJWGuk4pA/qrWK/wnlY8thkgyKRncxFTlIQD
         JVWzZN26rHnKcItY3xtB6hExApHL8LAm5TK6eYuVcrpulLGsb2k+V1o9vprzMedjVt2K
         XoMvZFvpvI7e+qovVh5Ux45/SNa4Ro2ChZqgZf31kWQda/1xcvCD1cyilMiDSEAUOPjy
         tQq3tz7YinZtq+y8VObOsO4/uPNnekIX5qQ0Ycwg9d923BPr4lBOHE8hhkXOkeewq8DT
         8MD+hLUXtH9taNuMeE5sUvVF9e9lKFxqcSWwX/feDwoA4KkY3TZir+gmCJVHSoK6tSTF
         Lseg==
X-Forwarded-Encrypted: i=1; AKwUvBy6rtGEoxqzII0hnQ9YLOK2LfhD9tGT/kkiBY+hhF+I9w8CIyj7Bcfhw9apSkK14ncVl4AeCO19IKWW+z6uXcPN@lists.infradead.org
X-Gm-Message-State: AFq9FYJyn6xYVxbAdYbXXeSkm4fM4dAzEll1WPhpBX0ZCSNQh+N/o6Dr
	u8rxCbvC2gMS/YEPEhi9o7zrPWzh3JJpLwyq6w6FvDAyWSxD4jv5n8Xh2kXBZjhmHbI=
X-Gm-Gg: AYBFou0D3t/bKc66AYlgaI2ab73Twn/HTyCUhVsSa/Tsa+w96+97DpvToYNx5BR2U9c
	WQhry7sCZFSfqR3LOapejrW8oQLGfZj2DT8vZfJJbj3X3bYCZ01i3vV0odWizmzG0y4mWD824VX
	qzAmm8I2MQzH4Sy7vd+w3xRhE/C+eJdXhyYQjLTvDjjUPyxEm3uU6y+sj7FAZdAxqDiI1W444jM
	0dio7TLVubVAWIm29SH78cCVqs3oiQM9Oz4Vn3V1cKwLIRNbF7MILUPRUcI8d6Mtxoa01xcOyS8
	AtIdcAH+oX/LS1vU7d8OpymrcE3Y2cO3ma+/iKMs+bH9D4fZGYQvYaX3vohNbJXqpeafAqAPkEi
	Y47T/BdxGSd4B7S8S+B3ZFJKoM2Bv2lLYLz0G9qZMXebcaXWIu35qdzmsZnMRJ56JDtcdq9Ccb6
	Z7B4AvE5tDaI1jIkLvimfSWF3VCHoV0QJCMDVpfvGGkCjTt8/+/FEhBtfHncaDXewQfeWQf0HcF
	pI=
X-Received: by 2002:a05:620a:25d4:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f29e0edf8mr1056254885a.80.1792378893364;
        Sun, 18 Oct 2026 20:01:33 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	daniel@riscstar.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/5] net: stmmac: enable Toshiba TC9564
Date: Sun, 18 Oct 2026 22:01:23 -0500
Message-ID: <20261019030129.1470307-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_200136_437813_B0B5AD94 
X-CRM114-Status: GOOD (  12.99  )
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

This series enables the two XGMAC interfaces present in the Toshiba
TC9564 SoC.

The TC9564 SoC connects to a host using the upstream interface of
the PCIe switch it implements.  The PCIe switch has three downstream
ports; two are exposed externally, and one implements an embedded
PCIe endpoint.  That endpoint has two functions, and each of those
has a 10 Gbps capable DesignWare XGMAC interface.

This support was originally submitted earlier this year using a
PCI driver within the stmmac source directory.  This version
instead implements a platform driver, "dwmac-tc9564.c".

					-Alex

Alex Elder (1):
  dt-bindings: net: add support for Toshiba TC9564

Daniel Thompson (4):
  net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via
    regmap
  net: stmmac: dwxgmac2: Add XGMAC 3.01a support
  net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
  net: stmmac: support the TC9564 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |  26 +-
 .../bindings/net/toshiba,tc9564-xgmac.yaml    | 327 ++++++++++
 MAINTAINERS                                   |  10 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-tc9564.c    | 590 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  10 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  70 ++-
 drivers/net/pcs/Makefile                      |   3 +-
 drivers/net/pcs/pcs-xpcs-regmap.c             | 169 +++++
 include/linux/pcs/pcs-xpcs-regmap.h           |  13 +
 13 files changed, 1214 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc9564.c
 create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
 create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h


base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.53.0


