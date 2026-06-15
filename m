Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880EDCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rrrEvCguWx02gUvVKJgOryi4lm9miLKLEb8bWHrJ1mg=; b=ZHCvqioUbwWUEDAwE306xyDuNF
	/fGRKMqFIOuMqc3sifJUPisvUiWx41QlX5E+4hHhsGK6Uzb8sP1EuMRl8QEm4AbagwYCqESGnb18m
	9aWsvQQeK/4M32ugHHGSDylQ43y75C/51XlXq7qO+GBpWx5f9UqIuKE3NeE6GSKCf4lWi3Rmote8y
	MLvVzWK0inZGtwMCjC9HIpHUDeum4dKYkDUrm1uqtr2j6G0P/K/Odpq8Rf/HQNxZ4q0nedrAZn1cc
	YzimS8GPc9OM+SBSTBEchGw/WSe8RqKSCUv4r7NO8j6NzW4ae9+3rBkEKsMXwT/QT8sb5mTQdSqKB
	HxgzJKdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6SZ-0000000EBIQ-40iy;
	Mon, 15 Jun 2026 12:30:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6SX-0000000EBGq-13d4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:30:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so26143345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526631; x=1782131431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rrrEvCguWx02gUvVKJgOryi4lm9miLKLEb8bWHrJ1mg=;
        b=sF/jij4564zTm2CBGRQ1jXyin6ZrFV8VqPAMo7/0og7Wv+aLCykDCODQCBCgDT8PAy
         6DYgxgIL0okDYfeCV+/CQpF90EdEBlU9aQ3WJNzrXQop+H5qzyKB1l1GCQTJQlKGgBgR
         5fLJYVKaYwZ88MmzHLb5TLvDrqViJiJN8JE+JA5z5PpFsnEePzU2rvJOFrt/z+jI0uYw
         BE3EMGblUdN5OCFEz3UE0RqaPqbpHelfXQ0TMjevWeorq3dvEpBSHt5BGrLOzaNLjBOM
         3o4StVBeOTvUKoAmW8xaLwqhFbCaGCMbY9W3NzpEHFTJQFg4urMn8TyZqHUeuXy252MP
         jogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526631; x=1782131431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrrEvCguWx02gUvVKJgOryi4lm9miLKLEb8bWHrJ1mg=;
        b=XomvHTOaXztX8vfZFdFIv1OJ8i9gP9eQkum9pGt5P3QD5wqf8S6iNzdahvAKyMQISH
         QfIOtRdd58/wH5TsMgpdiIhQBbH7JV811zdIEdG6bmyIkVnyXxEbxOnR4KVsHcgdEsOi
         pxsB8oT3wzWC9QnbvCOatoikutBUbqiRR+QKnQ5Nw543sPFEwKOvatnOPu5qqmAK6H00
         6FQAx9peBvbe14/pdb+0uvvzmdI96H5ZTFCo2/OqwXKZTZRJjzJmwfOPMWaAohr/KyFR
         Giwvm34QOZnWsVMvUDrKzUmyhfeRfkwZVZePhiul+TE5PAaieLkpeZZafS2+V1/C9sOF
         cXrA==
X-Forwarded-Encrypted: i=1; AFNElJ/gwa9RH4IcA51HoFwR9VGjQIdVfThG9Tnfmux/pLRa6L+IXXK6BLbGWIjzLZx65xI+IL7vyxLGlWsEd+Pe7/5r@lists.infradead.org
X-Gm-Message-State: AOJu0Yw55wr63DAIMno2XUHOZP8L8ElqDdI64HFs7INzfHNSQzW64UQE
	6XmC4u+vi3AxEy95Oz1W9O9M6q93rSYghDFbTN+Hkw4nY7k2Avk6gSRY
X-Gm-Gg: Acq92OEWhw1nz7tyxJbu6lXrOvtFf3ESkKeKz7Nz9lESr3ZlzxXtj6Pf8JJ45LnnRRg
	pdDUjnsQoNmrXombhsF+/MqnWTGXFJcWoiaCG0wunwa8TQQ3FL6cd4pmWZAszkOseEcfLDDKSEp
	1nDw+aFxIGYStNOOptiNBM6xPVFHvK21nPlLU54mU8nI9tKKYLF4X0pYfB79qcDtSp/EtTS6iSd
	V7ZefNVOoZRXMoS+lQxsr78S3dvdm2EhjnhPsqsn85qDt3lEI5u0sOmy9YJqyPLFR6bIF2UFedD
	wzng5HXpP58JRvmkr1QUWiyq2KhxGDbOsESRVfs9Xqwz2QZY+tAeL3sVUlNyyhUN1KcOb/qJvEz
	VpDbb0M+oZTQXUZ4gA0s09hm+WhwZyOwc5MfhewUx7nOz6uWkr3sigfaaJ2+qwJJSqFvf7zA2Ns
	ZmIH97LxLwhFdJQd8bAB5gwH776kG/37iZyOEV5No1eECxo4HJ/IeiN8Q=
X-Received: by 2002:a05:600c:4f94:b0:490:bd66:e522 with SMTP id 5b1f17b1804b1-490ec50075fmr175430155e9.29.1781526630806;
        Mon, 15 Jun 2026 05:30:30 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:30 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 00/12] net: pcs: Introduce support for fwnode PCS
Date: Mon, 15 Jun 2026 14:29:36 +0200
Message-ID: <20260615122950.22281-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053033_337812_736AB706 
X-CRM114-Status: GOOD (  32.02  )
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
by setting the .fill_available_pcs and .num_possible_pcs in phylink_config.
Helpers to parse PCS from fwnode are provided
fwnode_phylink_pcs_count() that will return the count of PCS entries
described in the firmware node and fwnode_phylink_pcs_parse() that will
fill a preallocated array of PCS pointer with the actual available PCS
(ignoring the one that still needs to be probed).

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
interface that a new PCS might be available.

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

Changes v7:
- Address all the bug from the Sashiko bot
- Rename .num_available_pcs to .num_possible_pcs
- Link PCS in phylink_create()
- Correctly unregister the notifier on phylink_destroy()
- Introduce fwnode_phylink_pcs_count()
- Better handle locking in phylink for PCS handling
- Better handle unavailable PCS at phylink_create() time
- Improve Documentation file
- Other minor fixes to address suggestion from bot
- Rebase on top of net-next
Changes v6:
- Rebase on top of net-next
- Add Documentation files
- Add fw_devlink patch
- Fix some comments typo
- Rework the airoha_eth.c implementation with new multi serdes code
- Extend PCS code with PCIe and USB support
- Align schema to new property
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

Christian Marangi (12):
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phylink: introduce internal phylink PCS handling
  net: phylink: add phylink_release_pcs() to externally release a PCS
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: support late PCS provider attach
  net: Document PCS subsystem
  MAINTAINERS: add myself as PCS subsystem maintainer
  of: property: fw_devlink: Add support for "pcs-handle"
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha AN7581 SoC
  net: airoha: add phylink support

 .../bindings/net/pcs/airoha,pcs.yaml          |  261 ++
 Documentation/networking/index.rst            |    1 +
 Documentation/networking/pcs.rst              |  229 ++
 MAINTAINERS                                   |    9 +
 drivers/net/ethernet/airoha/Kconfig           |    1 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  161 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    3 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |    8 +
 drivers/net/pcs/Makefile                      |    3 +
 drivers/net/pcs/airoha/Kconfig                |   12 +
 drivers/net/pcs/airoha/Makefile               |    7 +
 drivers/net/pcs/airoha/pcs-airoha-common.c    | 1318 +++++++++++
 drivers/net/pcs/airoha/pcs-airoha.h           | 1309 +++++++++++
 drivers/net/pcs/airoha/pcs-an7581.c           | 2093 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  257 ++
 drivers/net/phy/phylink.c                     |  337 ++-
 drivers/of/property.c                         |    2 +
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  135 ++
 include/linux/phylink.h                       |   20 +
 21 files changed, 6191 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 Documentation/networking/pcs.rst
 create mode 100644 drivers/net/pcs/airoha/Kconfig
 create mode 100644 drivers/net/pcs/airoha/Makefile
 create mode 100644 drivers/net/pcs/airoha/pcs-airoha-common.c
 create mode 100644 drivers/net/pcs/airoha/pcs-airoha.h
 create mode 100644 drivers/net/pcs/airoha/pcs-an7581.c
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.53.0


