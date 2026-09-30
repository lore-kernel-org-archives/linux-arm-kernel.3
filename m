Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AC3CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y5Ar/J3lXFwxWphKUtD7c9Gh3UMYH3kW8PbvXHpvZmY=; b=i+fciS4lSQRJ9NCPDBbQ/dwKgt
	aXdoKZem928Tx28+dHoZQlN5HQbXAmX2dz7CXIMhojmMjLZmCkkiSZjkjtKYqD0uLnqmsmdw2m2WM
	UmTw0qBPrcn1y4ih7fv2JBHmsgXFIBOxDddK23yWhVSVE1sram92w/FkSOUeG1/28h+YPQGvaIRoA
	An/+eeKo0L1LlVFzCKCS7Hgb+Lgr8MkKJUorJr8UrV2XGmPImGg9xSnjLJeU1f+ZwMLjSFmMYAo4+
	PsbsstZifFZ5iB6TBbUD1IFckjmB1mcabepBepBXskFKndB3dXxSL9FfFqPAjvXDrA9GpUeBzRsnG
	1/jbxPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoaQ-00000005Fjm-0tZm;
	Wed, 30 Sep 2026 07:18:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoaO-00000005FiI-1SkU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Y5Ar/J3lXFwxWphKUtD7c9Gh3UMYH3kW8PbvXHpvZmY=; b=oqaZCnmVPUVnc4bD52JS7FME+r
	D43BSEeFQIM0hArdpwUYWrZ7mZaogPi7s/mjbfbpAvMDl1j0LXmF0n5C092RBvgGKd5Arwx7F78VW
	2EECCXwEQbJ0T9nCV0UwQI80ybpp6rv81cctGzD3J2DET8cIN74+yLqYQvGLa6ixG7iMjIKW/k+z+
	B3woX1ewNiIJcNebrKQPLE9E4YZM5y4YlSRQxkmF329BqEC6bzk/4JiOgttcrZr9//pHW7Qpcufoh
	7NiS8M2yb+kAiP6cOjT7YxZAZObhaIjFWBhOVmhUgSWxeKx6mN1w7xMp+1Cfytu2IDr0IpohiIb2e
	6hGlbU+Q==;
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBoaK-00000003Sg1-3npd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:18:39 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso46448545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 00:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752715; x=1791357515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y5Ar/J3lXFwxWphKUtD7c9Gh3UMYH3kW8PbvXHpvZmY=;
        b=PKUDgAWCpW6vV5aV7XmIsmI9HsTOW4W+ynEqZgQmxeyqX6HzNm2WhkieYTtorTnJfD
         V8TxW0rr5tDVSmKhQBQQ20aTUgcWs0OigXRcgtHYfNo+zl2oWJAyyRwnaS8tR5bfT0fr
         uG+3/LxFacyiKSwygZP4ASo20FmxxjCucVZzz61OO8cejPi9b6aahi0FmNM6YMEqDIx7
         Zoss0SG2q+aKiqTY8yowIy0xDS937fFNwxn4jroMGZW4detchT724V6wvYuWB4I1nLuT
         N16ynxV19bRZ1vDI443LBpujLsYOaVpuP8T9Y1xLgXBlUATgKSJIWPkuu/vs16EEmUtK
         q9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752715; x=1791357515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y5Ar/J3lXFwxWphKUtD7c9Gh3UMYH3kW8PbvXHpvZmY=;
        b=KrLeyEZ+p01vqbniPLZQyvpCd14BdYwxt53S/L9XI/8jRYMIFbEFCz0wSn3O5aaFjb
         bvHeIA71PBbP0kQMhKD/d4CvL5iBy7pfVFY3Q53E35tR0JNa1jcIwbp5v3Z3Fzhlb6of
         ZLAHzSNep6mU7VOTyVQlJFj1Mc62ZfeicY+5iYfP9MU0c57MaJ4LZ5+jJOzyIyYDzDyd
         a9wTfy8zzUTwQaHnE2R5SCZAosBwAXsP/WEiOhx+vz1upv4UTX85bvIhBFSVJ7WZAJIJ
         RfikYzFa8nv0M0wycqu3ftKe5BV6mIRlW6EfQToYY9Fm98b3rs8twLokemqNxlcPBGir
         qcDg==
X-Forwarded-Encrypted: i=1; AKwUvBzpEPx/XMLEKnPxThAYB0tDpOLG9/0gbTlLzShaCuDHFA3XYFDW/UxB3E8ifGYE3okU4KFFHpPL5hMYcXpFjH94@lists.infradead.org
X-Gm-Message-State: AFuF++kb58rQFrRuVg2bhMS7+AhCoWLRtuwz9I5ulHdeFr8oW2Ao2GTJ
	JZEL0LFL9b5AKtuQjPZFu/jj1domQTVAr/dbWXMgBMN1j5Mq6i/8F+BxIiu0IA==
X-Gm-Gg: AYBFou0K6ENEBVVdnJi2wh5qNihjQvMBApKfCaQEEy5tBmhwmcxD7WDVdiQ6q25qJut
	HA53zskgrKdP/Yeiyb703srfG5n2INP+BFng/pP6euDIwla+ctBi77xntOdkHEXzvs8hL4uiEYU
	0MyJfotjw0JagPJ1zEyqBc8aRszzlIS4hufiACD2olt5OU/qNYX4ycFv9ANIWqEJl7pYJ+/U0pi
	81HPZ8892VjS7BLNaAqam6u3DUocvaeMZhFJj4s7uPxVGVIVCwZ85m+T/qcCTCk4UeRy7O1/OsA
	U5FQ9FkZLCnHbYuSVOWDsxEmmhROdNMeLiEMQj5WJQyYbz0iXyKY60gER6f93IXWO/ipdeijKGA
	Z0ml+avqn+wpj0IlTiZOLDS6iOU5kwDTlb0KgnMChdQ2ETPFAS3N6JpinGmBeJ6gNXWyj30QGRw
	F6R8vr/oDsYaTtax7p8dfl906gCysdk4LeuuNvMIX1KHnSzZgIAljgrg6nb9xtmlbqW0PumXks7
	OAAthu6avQVCV+osqZmLvpcg8z5A/+lDFAHTMSzOygCdEkOb6VAQ1mCr10j89Mb
X-Received: by 2002:a05:600c:3486:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-4a01ad9847amr4981855e9.1.1790752715090;
        Wed, 30 Sep 2026 00:18:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a01b1e79e4sm10590905e9.2.2026.09.30.00.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:18:34 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/3] airoha: an7581: USB support
Date: Wed, 30 Sep 2026 09:18:16 +0200
Message-ID: <20260930071826.48811-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_081837_375237_B8383886 
X-CRM114-Status: GOOD (  21.70  )
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

This is a major rework of the old v2 series.

The SoC always support USB 2.0 but for USB 3.0 it needs additional
configuration for the Serdes port. Such port can be either configured
for USB usage or for PCIe lines or HSGMII and these are configured
in the SCU space.

The previous implementation of a dedicated SSR driver was too
complex and fragile for the simple task of configuring a register
hence it was dropped and the handling is entirely in the PHY driver.

Everything was reducted to the dt-bindings to describe the Serdes line.

Also the property for the PHY are renamed to a more suitable name and
everything is now mandatory to simplify the implementation.
(the PHY are always present and active on the SoC)

Also other unrelated patch are dropped from this series.

Changes v12:
- Rebase on top of linux-next now that clk patch got merged

Changes v11:
- Remove clk patch and move to dedicated series

Changes v10:
- Rebase on top of linux-next
- Add review tag for DT patch

Changes v9:
- Add spinlock init
- Add ack tag
- Add review tag
- Add additional comments for phys on USB 3.0
- Add extra logic to make phys optional for USB 3.0

Changes v8:
- Squash header to clk Documentation patch
- Address comments from AI Bot
  Link: https://lore.kernel.org/all/20260520150912.11614-1-ansuelsmth@gmail.com/

Changes v7:
- Rework to double PHY implementation
  (suggested by Rob)
  Now the clk driver expose a PHY for Serdes port
  USB PHY driver selects it
- Rebase on top of linux-next
  Link: https://lore.kernel.org/all/20260519220813.28468-1-ansuelsmth@gmail.com/

Changes v6:
- Fix kernel test robot (sparse warning)
  Link: https://lore.kernel.org/all/20260306190156.22297-1-ansuelsmth@gmail.com/

Changes v5:
- Add Ack and Review tag from Connor
- Implement Ethernet support in the USB driver
  (testing support for this Serdes on a special reference board)
- Use an7581 prefix for USB PHY driver
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v4:
- Rename PCIe and USB PHY to AN7581
- Drop airoha,scu (handled directly in driver)
- Drop dt-bindings for monitor clock in favor of raw values
- Better describe the usage of airoha,usb3-serdes
- Simplify values of dt-bindings SSR SERDES
  Link: https://lore.kernel.org/all/20251107160251.2307088-1-ansuelsmth@gmail.com/

Changes v3:
- Drop clk changes
- Drop SSR driver
- Rename property in Documentation
- Simplify PHY handling
- Move SSR handling inside the PHY driver
  Link: https://lore.kernel.org/all/20251029173713.7670-1-ansuelsmth@gmail.com/

Changes v2:
- Drop changes for simple-mfd
- Rework PHY node structure to single node
- Drop port-id property in favor of serdes-port and
  usb2-monitor-clock-sel
- Make the SSR driver probe from the clock driver

Christian Marangi (3):
  dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
  phy: move and rename Airoha PCIe PHY driver to dedicated directory
  phy: airoha: Add support for Airoha AN7581 USB PHY

 .../bindings/phy/airoha,an7581-usb-phy.yaml   |  62 ++
 MAINTAINERS                                   |  11 +-
 drivers/phy/Kconfig                           |  11 +-
 drivers/phy/Makefile                          |   4 +-
 drivers/phy/airoha/Kconfig                    |  24 +
 drivers/phy/airoha/Makefile                   |   4 +
 .../phy-an7581-pcie-regs.h}                   |   2 +-
 .../phy-an7581-pcie.c}                        |   6 +-
 drivers/phy/airoha/phy-an7581-usb.c           | 559 ++++++++++++++++++
 9 files changed, 665 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)
 create mode 100644 drivers/phy/airoha/phy-an7581-usb.c

-- 
2.55.0


