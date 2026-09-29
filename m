Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3446CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFE9LdtdYAs5eAg39qz6yH1XbrxOARGWKf2glnJZAQo=; b=nyBYLR7LEqTPBLE5YFDJi3qLkt
	IS4YDnNY0NYER3XMR1wtdenXlRFK+xCHJZtJ7Zn1UexF2nvQNVQtmCoCzhFAMoQwttl0UdbgW4Ydo
	BlPP74sxjdZMg5+hprOcvS34hBAFwEk4onBH+3hxf1jmIrhioFidwX0ixPCnBY6TpDj12DVnFsFub
	/qACXqVGf+ktoDvpF91bI2he/U39+Vn//n8LVH/tTkeMjHnNYia4aa77atI11DDeu6GFcTpfI7BWv
	asTu7RlHNnQ4nefyBRwvnef99U+C9HoxNqKnu6UoAAS3a8GXpTvZwusLTK8n80XqWk8snw+6yf7j4
	43l2JrxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNHE-000000026BO-32gK;
	Tue, 29 Sep 2026 02:09:04 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBNHC-000000026Ac-0xP1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 02:09:03 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4cacd3409so2082356a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 19:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647741; x=1791252541; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IFE9LdtdYAs5eAg39qz6yH1XbrxOARGWKf2glnJZAQo=;
        b=MCme9l8ScgYhru7SysAQMtlXOvX2ivblRBQVyPgbiJAjYF6Flk6+lh/r3iwXfv/uX8
         zZLdSHlaDmM77T594ynWe0RNC/XEpva8QlfX57/Y84tLTXELqDqsnYxP3cBSkpP4QtnF
         Sk6oezed70726dbFBCpvZzoJIYq/fP6fhYeLSZ55PbdstJ+kgXax1C5kjmyM3yv4hXTd
         d/s3GBxvV8uPTntPtuICPz8MXsWDW0vRYk0RffMzTyI2sst4OzU/OfHPm2xwtxc75E9K
         i8+NA/8MVqfeJ0SXUnHImJA7ZZnWs+iZ/lgsFXQquW3CJ6ehMghqoB+nTCiOaJ0hYDYI
         LH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647741; x=1791252541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IFE9LdtdYAs5eAg39qz6yH1XbrxOARGWKf2glnJZAQo=;
        b=DVgLkkHxXhgOXDrrERb0mz3aT4y+b6UT4IPSIG7MUl0epEq/mc04QyYIc/LfMXzZqR
         FhV79WaHyHKOabdDYIRun4NhxjWARAHA94O0gnp5PabPGnm8FTnb6RgSUTdkjp0D2Qik
         q1/OsxxtlCGiuIEWgCSkZY5eOMJ3r5PSkocfqHXLhbt9TaS/mB4gMG/Ur4tawugjzrgk
         wuGY1PPnGODKvLYCiSv4WCs1/5h7JZA7S7P56D8lnBLZiq1SBuX980cp15zIOULF5QJY
         xjpKSt+HaSAEo7yth8/8QuoZGW8Wa3kbAak8a2kmV1w8ZxucC6+vWS4RWM884DxGsf1O
         scQw==
X-Forwarded-Encrypted: i=1; AKwUvBxRW8s1svFnVEdQRMBZ84ZjojAP2hKE6gVjnqwqEAwxBzzA8h5DgcxJcSZjSozb+w0BdPVzIHE+kx1VwViwxkka@lists.infradead.org
X-Gm-Message-State: AFuF++nrD5IR+eK6camZbZv4YJnwEqfhH0SLg2aXqM1dCQr7KaZSB9sv
	RNjNmgTJH5NkO3d4f66I7X4bqnvrttQtek94T/HtMowlOES2HXLORzHm
X-Gm-Gg: AYBFou2FhdBovjg2ZfzLrnonJghLNhhw2+H+F/Q54Lvk1SxDIQnBcYMB9YgEBoar3S0
	abZg4Zi3RO6PIO+zebMfoL08O5MudNGqFOlsJOG5+dtYtAK1fJQIUzwNtlI+tVu/752ZTH1pGEI
	6inX6YqMIcvuTnlnn9N5ixMM6rCSL5fnZvuXR8tTBg86s1s7RXBSoafsKM3cn9mDOTEsF3shUyi
	7V3icTVjAJ6fS+/B8cew8+2e/BrpY5ks56va/HTBpx2fSVbr9wAdxOLf0/zSDz6E7OZ+yOdFsB0
	IO4hS/iEIRGxjN+hWkNv4qAfYbkDNvRlHqi5WbjkvdI4uCqZq7C2XPUiMVXX1nM3xcnDWiQQcOz
	w8On+IObt8FPC76gZ9s/7aaKwtW31rcwTBh07VpgVg3Yf4MJlIQ9EEvh+Z7Nh4P3C4uJBmDWSVr
	n2ofNnIy3Rx+iKVCKl9ohB1ct7Slmk28TV13DqspL20FNvrZBK/mcvPeXwtRhMLqfRwbhAkCbcG
	9OT7HOhq81nHEdPobzOKVsMKj14dkRqAy6LiPGkEl+jaXwE+vLwIAH7T3FMbZ33
X-Received: by 2002:a05:6a20:6f03:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3de0e6f42a6mr15736585637.1.1790647741047;
        Mon, 28 Sep 2026 19:09:01 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78796cf39sm5448596a12.32.2026.09.28.19.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:09:00 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
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
Subject: [PATCH v6 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Tue, 29 Sep 2026 10:08:51 +0800
Message-ID: <20260929020854.1282339-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_190902_296194_DF51BA2D 
X-CRM114-Status: GOOD (  17.13  )
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

Changes since v5:

  - dts: rename the hsusb pinctrl group node to hsusb-grp.

  - phy: keep the clock-stability polling when SUSPEND is already set,
    per review comment:

      > +       if (val & USBPMISCR_PHY_SUSPEND(n))
      > +               return 0;

      Please keep the clock-stability polling when SUSPEND is already set.

      If the initial polling times out, SUSPEND remains set. A subsequent
      phy_init() call will then return success here without checking
      whether the PHY clocks have become stable.

      Skipping the reset sequence for an already-enabled PHY makes sense,
      but both paths should still check the ready bits.

  - phy: clear MISCFCR0_UHOVRCURH when nuvoton,oc-active-high is absent,
    per review comment:

      > +       if (of_property_read_bool(pdev->dev.of_node,
      > +                                 "nuvoton,oc-active-high"))

      The binding defines active-low as the default when this property is
      absent. Please also clear MISCFCR0_UHOVRCURH in that case, so the
      configured polarity does not depend on the state left by the
      bootloader.

  These are pre-merge fixups to patches 2 and 3, which are net-new code
  in this series, so the commit messages are otherwise unchanged.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
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


