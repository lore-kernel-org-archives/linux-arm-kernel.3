Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293A2CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7yznlhzA/LCCyg8VcHmCAqbKM1iwate4R5ON9EtsImI=; b=t3UzqBtmRTwKR+H2lmDro/6l91
	/ibAhSwxcSkayiBtkY4aWAJqgFFUt3mkmUCad6obLbveYSoSAS2nvGeTbSK6dXbuUiBqrKcrVlRU5
	qRA/X8J8h94ycVEEJ7f1QHQUKTdd5rwSCqeScdJqAlN/6POk/ZbaggfacU+2KZVcNwi7m1MhQTEw7
	qr7l+J25C+aLYmxz+J1LJRnTyIgQmZw4tBcCTBSQaDqA9OHcs5HvrNJLbDZDPt1mkzojvlMTolfCh
	qcYtyfeIe9Q27gSwm93LhkU1Gf5bfbAq0RTH04WWch2I8TKljt37znY6TNrMc2/b4vCwReU5CiJPT
	yjIoGDvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhH6-00000003byD-0ea3;
	Thu, 08 Oct 2026 06:06:40 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhH3-00000003bxS-487L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:06:39 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so144142a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791439597; x=1792044397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7yznlhzA/LCCyg8VcHmCAqbKM1iwate4R5ON9EtsImI=;
        b=UfQHwrTTy0oetfi4E8FdC8rxuq8MIrn42dECOyKDkso3FsH2am2cqM/ztEoWiPbPYY
         qzBJS8LkHRkUN427yn7kyR4VjUsl9inY6FiEVPQJGZI/xdUpmpVnYFz8nGRLwfC+MaCm
         GR0vtpA/MP5kvJLksy1iplAZyIpHOffGTxfg8VcxqDerWPuUgktqO2NOFynQUghULGFs
         r80YuSmeveYpF5F5NM6plis6/cTjPoPy97Ru2cg0WoiYp6yi2duMKj/dqpopOYiO/kIm
         a+PSzZFVwgpk/LKaDTkre6GCt4ZQKENeLuxmOEAuWezH1h5T+XlLZAjloOu3/mbmKQMy
         axgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791439597; x=1792044397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yznlhzA/LCCyg8VcHmCAqbKM1iwate4R5ON9EtsImI=;
        b=HdFqs3RVa7TPwpvo1FL/wtUpLFtBF/u95fDfHSVM4CbPc1f4/kBsLC2gaZDjGfATXB
         0+RqlcTM+pHc25BLG4al3qVz/A1HrA59m5FCHf4uJqwp/PrJeg9o9zlBhS84nuc33Z4r
         d6vHiRc367U4pIzgmAo5qjVC41ivA8HIHPAJH1bB2DGFMJVnLOesbkbwFXL6aM94Td7F
         eWrD1S/QAlIFvG8sdLlxYVb2T+9NqLb1v2S4czE9DC2Gjtngx5F9GEUDc5LINXsqoacj
         tPFbho2aAEwGnpp2PCIjcZEgFB1d3fFN7ejXjB+jPCkOrFkzrPBF4itAEoslwK/taCc+
         bPcw==
X-Forwarded-Encrypted: i=1; AKwUvBxLUORzGU13d/+T69DZqfgxt5k6ONojov6vA40V5FibDJnsc9sgbOHJxN1HIpQVLxiVWXDS0tFLrZYFzfsl86G1@lists.infradead.org
X-Gm-Message-State: AFq9FYIKuEGYhNyDe2cmw5E2GEEsDosvfnrsnoePjbi76U3ZINocBtBQ
	hY4X/HzG5OLTGLvi3E3yDs0l/MxeIBpdKdtJ0rKzTXEdUuanctKtfuBr
X-Gm-Gg: AYBFou1xUn1fRDpkhTv2KSnL0fa3I9VWXk3V7fAAH1E0TtiSC2qsZEKiM1w4FvQQ1s+
	dicISzx4a+DLdz6fl3L5b2nYmmorCzYmraVP1ICvJNJXrzdUNwVXIksNxQrCrSXB3709qFzX6Mx
	A4SeeHQVXTfaofklyWtEB8OtaAtlDjjQ88F6jR4O1zcccTAuS5Enc2wsYp4y/Ewc64h+mGldyiK
	2WNtCHDuyAkboq91/w7AMQdzVu/VSeopoYy8UdTrMkd6uOR2h1ygZK1nJSkGLW+0aL1Z6wadj0s
	mD8GAsYSF/BlvNhv2vPmQDQljf/sGXS7Lotu7UMXg4r02HTKc5fqpcrlqapEJ/DyRi0mrKrZJI4
	VJ4iZcSHkG5B1IMMsceSGmYwCin5qg76U+KEvJkXhfNCHxi098zjYUTg/oWqdckRAQ3EwiQ+Jmj
	FNE9atRnEHxjP/Zltwr2LGSJVDwDs+UnrddJJp5SPL9Z85IMLwXPVn584fdGWWMUntjKFFtivk9
	WfulOTMBIC7p9RrAZTZWduaTyqDaQ83d5Nror8YOF/Z3TWA40RWog724sbVjSMV/m9AmEleCw==
X-Received: by 2002:a17:90b:1347:b0:3a7:9ec3:ea0e with SMTP id 98e67ed59e1d1-3aaed7c10c2mr702874a91.22.1791439596767;
        Wed, 07 Oct 2026 23:06:36 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm2632203a91.15.2026.10.07.23.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:06:36 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v7 0/4] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Thu,  8 Oct 2026 14:06:25 +0800
Message-ID: <20261008060629.2736806-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_230638_024356_08F351BB 
X-CRM114-Status: GOOD (  12.00  )
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

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v6:

  - phy: update the copyright notice in the rewritten driver header to
    "2024-2026" instead of "2026", preserving the original 2024 date
    rather than dropping it.

  - phy: split the unused linux/io.h removal out of patch 4 into its
    own patch (3/4), since it's unrelated cleanup that predates this
    series (the driver has never done direct MMIO access; all register
    access goes through regmap via syscon_regmap_lookup_by_phandle()).
    Placed immediately before patch 4 since that is the first patch in
    the series to touch this file.

Joey Lu (4):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 286 +++++++++++++-----
 5 files changed, 390 insertions(+), 77 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0


