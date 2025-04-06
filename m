Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA00C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Apr 2025 22:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kQY49MNV2vw+RYB/lwmnIQvb/vWfn9IT+VLkvnf1e7s=; b=aVnF3koNfo/7i6TL6wOtQ8At1c
	qIimjApAiq6hErc8nPOsNHuYxeiPFG9QOfR0TkkIg68IO3Upi5EzDKUpqMs3pNvElqWiW0yfPZViE
	6Jo/a3vr5tYnNfCKc48rd+9cJ3FOJ1ioz4deeTbQKMIrrpP+jAUHUDY7OL87fGAJFOOS57ukKeO78
	XoHzjwghFs8iXrhTTNlju7Sws8GPfOyrsc45pFUY+zRz3rQh9ZfGLf6Y3P3+akkmDwBO1AL+UCIf8
	wZvyXHjLl8djXtKs2i7ulkSCLy6HYbQ/VJYTiXZ717jeo7gPvDrCMjmEPTlfAFlkktCOtTb14eSt8
	ghw0QK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YIQ-0000000FtJI-23v6;
	Sun, 06 Apr 2025 22:16:54 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1YGb-0000000Fstm-3jr1;
	Sun, 06 Apr 2025 22:15:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so18769695e9.1;
        Sun, 06 Apr 2025 15:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743977700; x=1744582500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQY49MNV2vw+RYB/lwmnIQvb/vWfn9IT+VLkvnf1e7s=;
        b=XzlI6spWtpwxTkJcZ1kHucVyg2GP49VJuAfdDBcmfzduZn//OCyeiVpkyhwldIqbcN
         QYxNI2h53i7M5SaQgo4g7jMPFE1ewurFEL1zZjk1PtOwDWPrkM+/SYoTjk/u1gvkn8sO
         CPKLM2UsCigXifF2WxXxK6c6qydAkatHhoHbly9NL77IN5FfcioPCWR4Tfgn2QyFWGvy
         6agK3ohs+kDV09heHEQGWbKYN5fQnoXYAMfKQcQubsviCZgFrd0DZAs8tz7xrP8rqTlW
         /j05AsLLYLDSj+esidSWfG4PFLSw81hBLbxrKoMyhBJ/d/kKlyDpnUsrPEje08IT/xHj
         lMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743977700; x=1744582500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kQY49MNV2vw+RYB/lwmnIQvb/vWfn9IT+VLkvnf1e7s=;
        b=S/XrnNN9LAGoratBFX9olB1rgJiheOwtXBKRyIoVpQlOJZf4vmpSGuR3X7T2olhK5B
         BRQUHMDnzOGc4nXOkTfSmbPtYRXXEgh1+Cd0kGSWj+Se2BslwssA224pwC4zp9TtWkPa
         Wr29drbcEMjL0undEETlCnunmIov4SpzcC8MvKeGg2LJpFrxX4thtOzd7ADLsWHOHMRM
         X+ZQXBaZ/v45Nua3FrGIvWJD841kqAg/VH7k+Pptmr3emFaEoC/RQoRuT9JvtD/VF8D5
         9gRr09Rr9XNluOy2zS0H8SVbcHvzOLbm7IcxSkvdWm+YVSWQWHOs5UzGP2yKkr8NCwAm
         x7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCV4jWfXTQQzjkGxyzLyMejMHsyE7aCdduxE5qXKdiWm2P1U0sEW5Y7URzIVF7rBgKfu4vfr3lCvzzm3auhkimzI@lists.infradead.org, AJvYcCXgcHuw2wBYD1SD8KTfOiHNGzBsE5E0KbAykZhj9uBdABkm8wIpXr64Mw8uBSRgXU6x8jtvCEVzZZb9Z6ikY10=@lists.infradead.org
X-Gm-Message-State: AOJu0YwG80l81qFZkg0zv8vRMnaO8nUUD/BPsrBPjp8VPKgIGW9qQGND
	aE4GRvPDIFx8uvLK/FZ0DClOgG5rMINHtAmYBdn11zEZmCAEBWR5
X-Gm-Gg: ASbGncsK86kK5351KPcaROfd5s55IrK7+fybdbpPvtHTFDmaI+S1AZVlXlqWpylrMhl
	iuREwlJw2b83GQSlH58HV0fZCVYYuxgi5AGAcW+VqE7yEisnFElyM03lldS+8ghVtxjSfsVCltN
	Ag5EcvJ8Nr7YSEvKIIRke12o3IRX9OQnwxqtTlNEbGrg6wu7/Zsf2VgbUvYGSH5pUziY75mP2vk
	LLUGQYnhlJtEATQ1vMUddC2UTYqEF+Py3KFGyuPRvi5sF/HMBU7c4BjiL38Blp+aJHXMth76cYQ
	l1EMzZL1lMkdEtittiAN4xW3RzgCjN7aQ86OFra6g31ugqXtR26PScYSPgxdwrAFGNEaZlPc0Ce
	RwZ/zqO4to+ZFgQ==
X-Google-Smtp-Source: AGHT+IFHPZSGfdYEiMrh30dapV2ATq2oroNmn/OyTiAdMgqfo6FsGmPAIu/fmpb4M1YuUBVOTcPLPg==
X-Received: by 2002:a05:600c:35c8:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-43ecf86b406mr90635615e9.14.1743977699324;
        Sun, 06 Apr 2025 15:14:59 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43ec366aa29sm111517055e9.39.2025.04.06.15.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 15:14:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: [RFC PATCH net-next v2 00/11] net: pcs: Introduce support for fwnode PCS
Date: Mon,  7 Apr 2025 00:13:53 +0200
Message-ID: <20250406221423.9723-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_151501_961196_335D13BD 
X-CRM114-Status: GOOD (  22.83  )
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

This series introduce a most awaited feature that is correctly
provide PCS with fwnode without having to use specific export symbol
and additional handling of PCS in phylink.

First the PCS fwnode:

The concept is to implement a producer-consumer API similar to other
subsystem like clock or PHY.

That seems to be the best solution to the problem as PCS driver needs
to be detached from phylink and implement a simple way to provide a
PCS while maintaining support for probe defer or driver removal.

To keep the implementation simple, the PCS driver devs needs some
collaboration to correctly implement this. This is O.K. as helper
to correctly implement this are provided hence it's really a matter
of following a pattern to correct follow removal of a PCS driver.

A PCS provider have to implement and call fwnode_pcs_add_provider() in
probe function and define an xlate function to define how the PCS
should be provided based on the requested interface and phandle spec
defined in fwnode (based on the #pcs-cells)

fwnode_pcs_get() is provided to provide a specific PCS declared in
fwnode at index.

A simple xlate function is provided for simple single PCS
implementation, fwnode_pcs_simple_get.

A PCS provider on driver removal should first call
fwnode_pcs_del_provider() to delete itself as a provider and then
release the PCS from phylink with phylink_release_pcs() under rtnl
lock.

This series also introduce handling of PCS in phylink and try
to deprecate .mac_select_pcs.

Phylink now might contain a linked list of available PCS and
those will be used for PCS selection on phylink_major_config.

MAC driver needs to define pcs_interfaces mask in phylink_config
for every interface that needs a dedicated PCS.

These PCS can be provided to phylink at phylink_create time
by setting the available_pcs and num_available_pcs in
phylink_config.
A helper to parse PCS from fwnode is provided
fwnode_phylink_pcs_parse() that will fill a preallocated array of
PCS.

phylink_create() will fill the internal PCS list with the passed
array of PCS. phylink_major_config and other user of .mac_select_pcs
are adapted to make use of this new PCS list.

The supported interface value is also moved internally to phylink
struct. This is to handle late removal and addition of PCS.

The supported interface mask in phylink is done by OR the
supported_interfaces in phylink_config with every PCS in PCS list.

PCS removal is supported by forcing a mac_config, refresh the
supported interfaces and run a phy_resolve().

PCS late addition is supported by introducing a global notifier
for PCS provider. If a phylink have the pcs_interfaces mask not
zero, it's registered to this notifier.

PCS provider will emit a global PCS add event to signal any
interface that a new PCS might be avialable.

The function will then check if the PCS is related to the MAC
fwnode and add it accordingly.

A user for this new implementation is provided as an Airoha PCS
driver. This was also tested downstream with the IPQ95xx QCOM SoC
and with the help of Daniel also on the various Mediatek MT7988
SoC with both SFP cage implementation and DSA attached.

Lots of tests were done with driver unbind/bind and with interface
up/down also by adding print to make sure major_config_fail gets
correctly triggered and reset once the PCS comes back.

The dedicated commits have longer description on the implementation
so it's suggested to also check there for additional info.

While this was developed there was a different version that was
proposed for the feature, this is posted with the hope of
implementing a more streamlined implementation and as a
continuation of v2 with the addressed request from Russell.

Changes v2:
- Switch to fwnode
- Implement PCS provider notifier
- Better split changes
- Move supported_interfaces to phylink
- Add circular dependency patch
- Rework handling with indirect addition/removal and
  trigger of phylink_resolve()

Christian Marangi (11):
  net: phylink: fix possible circular locking dep with config in-band
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phy: introduce phy_interface_copy helper
  net: phylink: introduce internal phylink PCS handling
  net: phylink: add phylink_release_pcs() to externally release a PCS
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: support late PCS provider attach
  dt-bindings: net: ethernet-controller: permit to define multiple PCS
  net: pcs: airoha: add PCS driver for Airoha SoC
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: airoha: add phylink support for GDM2/3/4

 .../bindings/net/ethernet-controller.yaml     |    2 -
 .../bindings/net/pcs/airoha,pcs.yaml          |  112 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  266 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    4 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |   14 +
 drivers/net/pcs/Makefile                      |    2 +
 drivers/net/pcs/pcs-airoha.c                  | 2855 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  235 ++
 drivers/net/phy/phylink.c                     |  283 +-
 include/linux/pcs/pcs-airoha.h                |   26 +
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  104 +
 include/linux/phy.h                           |    5 +
 include/linux/phylink.h                       |   12 +
 15 files changed, 3942 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 drivers/net/pcs/pcs-airoha.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-airoha.h
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.48.1


