Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BDFFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 18:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p3booFeTa28qe7i7voEaW3UHK1wmjwWoETKgGZqVBKM=; b=rEYDvIfj14W55z09QY+/7iuyY1
	p1VgBRfRVRBcof4uAQqroQsA+OKK4xeG2IpkW6jeNYiYJqbgRnCCz8p+NZAsT8fWaclJ3QxhYfYOi
	h6foKsMiqPBaiGLXTK64jUi87pYHTrFVFsiESHFAc8+J5t85AAZo1zreoasQZOOcrenbnIQCZ3b09
	icFZ4v7qbOyGsyLC2CCvJ2m7Bpq5Z2VI1qSe44QGAih/itMv/ZjHwT8rSaHaI2FF33uKKr0aPzfBj
	cNn/Vdn2gyVXcb/tWMczaWW9COCIyLxQcisjZxcekbJWh9BhwJnfzHKqoem0n9kxnlAKmuYbF3Hsb
	x22eJYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUS-0000000HAEO-2s6B;
	Tue, 05 May 2026 18:27:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUQ-0000000HADW-2iUD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 18:27:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so54312935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 11:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005645; x=1778610445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p3booFeTa28qe7i7voEaW3UHK1wmjwWoETKgGZqVBKM=;
        b=CJ4bsPrd/0fmsX+CNRfkfNfabC2hITmWYioUqKzF5NkBuDcR37pAujETysmzGWAEws
         l2MbqSETSxBf8UM03WmvHksD1vRNnCNgjNQ35N+di9+LWjouWp+TZiXJbUH5ZLH8KHnY
         r3ZO8Rw7xFXAt8V0ZzluuqG70ITe0JXpem0gVlc7SKwQxZuQobiE8rKV3RZQseItHiV9
         oEUpfO+3vBcoy7oDYippC+1oHTXw81sKTaNg+GwW/68uOI/2HcNiwfWXTpab58n5GOSo
         zKuWyi+xvsl8f/HDisX4X+UabNvhtE37S7vsBdD8fVG9UewXRn0SxaBOvD28kfbyNJNK
         NNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005645; x=1778610445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3booFeTa28qe7i7voEaW3UHK1wmjwWoETKgGZqVBKM=;
        b=Gb/cKgaF4mGg/Jghoe9W3LiXKerOHX+bYrx/DX3F/dK5mQhqgswZaxtFchGZML/7G+
         u65LJLoz9pdnoXk/LHarB151e6LPnx/r7gdO1pNvls/CVB2ZTJ6Co9nzXmSz8Yt4+pDf
         oLkwpcrcGUBkHqY0luFycbM7exM4+/CceqQpYacW0X34ci0dyqdjtrAcbt7kk+6DzDt2
         ZoVsmDZS5QNN/1Pw5fwAvNb1srB6O/wV1PXRdYEC4aLXr0TUKJ1S3gC2ztWHv/eAgK76
         WH2gYerjxH3gqsjDtR8xYelG+I7XF+orEeUso4J8yUPipKuYO55iNLQdO2oT3kycskyZ
         AyCA==
X-Forwarded-Encrypted: i=1; AFNElJ+t7suZArC2ArPUZU/HlE9/XGQY55JdlvJhxXuom5Vkj0eW0O134cDslvHyjE0DAwbXxkr4PCI4jdklnrVDPmzO@lists.infradead.org
X-Gm-Message-State: AOJu0YzNRzoKvcOuqzqO/ieu3EFgFYnKdHf5Txlo4dj6ugpdUBkvOR8T
	J6fz7bHFcIOSXEB54iV3EfkfOel/k656l3wjgwDrL53QDEfUeB7+sqaF
X-Gm-Gg: AeBDiesCiWH0g93J0FjgFk/F06ARS1Hbr+Lb/tm0VOV2/FWUH6psJwcakRVnWG1/tBI
	97jw4va40/EMZ2Wk8YGH31CSNMnlMrErT2oRw8KhX+VRNHy5rL8j52jy5HX0BXygqJPgMUWKpTu
	O5HFLYr5v5MbbZTBkuA/XilF7g3U7KvfZjbfEqq7iuEqdSJlRW6rcb2RDBQy0DLSqxA5l+KjPBn
	mOHOZ6V8ZNE6sr2beAQMfSvGd1Pwi3tKWUYE7XrEsu2nKmySu69KZzYHCNU1TQ6+OOoR/M7ORlw
	zp+Umhf2gnDzykANyctjfBYUEQzuG6nYptSrBylZw9ktj3qO2LyDS2cu2yP5XpTzRAreWN9VtIN
	d57q3mET8aBUtBvws7TXKMnZlEr+4ILWo1ihqo9TYHzWmlvC/YadpEfwwSCP5/RyEnnE+NBR+p0
	+HYSCfKZ7+uMSUn/CD/FrsJpFI6yRrkuaw8JQNDl9sJH7LY2u6Lmqh+87DFoB2A/zsNQwqUTsMU
	jMuZ9Y=
X-Received: by 2002:a05:600c:c494:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48e51f42760mr5237455e9.16.1778005644350;
        Tue, 05 May 2026 11:27:24 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:23 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 00/10] net: pcs: Introduce support for fwnode PCS
Date: Tue,  5 May 2026 20:27:01 +0200
Message-ID: <20260505182713.27644-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112726_723104_78D4AD2C 
X-CRM114-Status: GOOD (  30.57  )
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

At times there were 2 different implementation (this and the one
from Sean) but Sean agreed that this can be picked and used in favor
of his implementation as long as his case with race condition is
correctly handled.

---
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

---
Second PCS handling in phylink:

We have the PCS problem for the only reason that in initial
implementation, we permitted way too much flexibility to MAC driver
and things started to deviate. At times we couldn't think SoC
would start to put PCS outside the MAC hence it was OK to assume
they would live in the same driver. With the introduction of
10g in more consumer devices, we are observing a rapid growth
of this pattern with multiple PCS external to MAC.

To put a stop on this, the only solution is to give back to phylink
control on PCS handling and enforce more robust supported interface
definition from both MAC and PCS side.

It's suggested to read patch 0003 of this series for more info, here
a brief explaination of the idea:

This series introduce handling of PCS in phylink and try to deprecate
.mac_select_pcs.

Phylink now might contain a linked list of available PCS and
those will be used for PCS selection on phylink_major_config.

MAC driver needs to define pcs_interfaces mask in phylink_config
for every interface that needs a dedicated PCS.

These PCS needs to be provided to phylink at phylink_create time
by setting the available_pcs and num_available_pcs in phylink_config.
A helper to parse PCS from fwnode is provided
fwnode_phylink_pcs_parse() that will fill a preallocated array of
PCS. (the same function can be used to get the number of PCS
defined in DT, more info in patch 0005)

phylink_create() will fill the internal PCS list with the passed
array of PCS. phylink_major_config and other user of .mac_select_pcs
are adapted to make use of this new PCS list.

The supported interface value is also moved internally to phylink
struct. This is to handle late removal and addition of PCS.
(the bonus effect to this is giving phylink a clear idea of what
is actually supported by the MAC and his constraint with PCS)

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

It's worth to mention that OpenWrt is currently using this on
Mediatek SoC and QCOM ipq807x/ipq60xx/ipq50xx and Airoha are
already ported in staging tree for testing.

---

Changes v5:
- Rebase on top of net-next
- Use the new force_major_config
- Reword some comments and commit description
- Return -ENODEV instead of -EPROBE_DEFER to perevent race condition
- Drop phy_interface_copy patch (Russell pushed an equivalent version)
Changes v4:
- Move patch 0002 phy_interface_copy to 0002 (fix bisectability
  problem)
- Address review from Lorenzo for Airoha ethernet driver
- Fix kdoc error with missing Return (actually missing : before Return)
- Fix UNMET dependency reported error for CONFIG_FWNODE_PCS
- Revert to pcs.c instead of core.c (due to name conflict with other kmod)
- Fix clang compilation error for Airoha PCS driver
- Add missing inline function to pcs.h function
Changes v3:
- Out of RFC
- Fix various spelling mistake
- Drop circular dependency patch
- Complete Airoha Ethernet phylink integration
- Introduce .pcs_link_down PCS OP
Changes v2:
- Switch to fwnode
- Implement PCS provider notifier
- Better split changes
- Move supported_interfaces to phylink
- Add circular dependency patch
- Rework handling with indirect addition/removal and
  trigger of phylink_resolve()

Christian Marangi (10):
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phylink: introduce internal phylink PCS handling
  net: phylink: add phylink_release_pcs() to externally release a PCS
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: support late PCS provider attach
  dt-bindings: net: ethernet-controller: permit to define multiple PCS
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha SoC
  net: airoha: add phylink support for GDM2/3/4

 .../bindings/net/ethernet-controller.yaml     |    2 -
 .../bindings/net/pcs/airoha,pcs.yaml          |  112 +
 drivers/net/ethernet/airoha/Kconfig           |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  144 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    3 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |   13 +
 drivers/net/pcs/Makefile                      |    2 +
 drivers/net/pcs/pcs-airoha.c                  | 2921 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  241 ++
 drivers/net/phy/phylink.c                     |  280 +-
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  104 +
 include/linux/phylink.h                       |   15 +
 14 files changed, 3862 insertions(+), 29 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 drivers/net/pcs/pcs-airoha.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.53.0


