Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1930AC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wgZD8Qie28A4lMky1ZmmngaVSHaSCD6Vbp39BPYyPjk=; b=HTpBJ56++A2+tZ7kJix9ARvXRb
	rsaUrMhXtAACg91VYwGYvtSn8EtsnaYHN96BNcYAi00ekycbNpuCGEKxtoRIxLm036HVrNkixxMRf
	iivun4E1a+zFfmLpNNUL5zVSy9dzLLFpUEiKH498lW8HHFhHQa/RGqAh+fSk86y0hI7CQGXCrAGuk
	IbA9rQkqm3Y7WSeJuyg31RZXH0cQGQO/dyre1BP0Tp13MS0iykhkoaORMKmqAtq5dS3oGJMlWdPYK
	sPdvnCM2tDDqDA929BgHC67Y8TmrJw0vXfBknCk/CyBs0R0CwKoWTjNQz79TErU7ZMyUmcfA2Wusf
	zk8LWQ4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKNz-000000085UP-0BSU;
	Fri, 07 Aug 2026 13:13:19 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKNu-000000085QW-2HAt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:16 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so12146165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108393; x=1786713193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgZD8Qie28A4lMky1ZmmngaVSHaSCD6Vbp39BPYyPjk=;
        b=LkC5zX3OEuf2aqVCiv35pUfNyRaPK5Vpr4oEw3GkazSLPRSOQI9p3Va9plccneJiJl
         v04BrmapXCQNsujif43c9qPBp2nTluAQXpwXVAyzyMUkqR7H5xuvQ7fKnXCVTeHeRhE2
         S+Mx7Jv2XYMfTcWqrZadlg9T38mI+WQRLICmMIBIHNpedekz8F7QmGynbQ93NovLL5Yp
         G4dvR3WzmLvt1xiAksYkkJMO5XzH8sbWCtMkDQPj1NO43n1cTvew6GewVUZWc8KossLF
         XgiNuGUWAzAvLvmeUu3UL2xz9UoxtzaOuFeNUr0v1zHqg8JhTNW7CrHpYn5KG6R6WjkY
         vrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108393; x=1786713193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wgZD8Qie28A4lMky1ZmmngaVSHaSCD6Vbp39BPYyPjk=;
        b=qZEtd2pL1ERLRHctu4JR/+KkPMAiN0uxkJq9J/L0x3KMPl+kh4+s7vZv7v7HYK1pwb
         Z1jrWeXe1bEgMCLBg+2JhyztpXXbJvGdDBzfFp4QM85ERo1ZgMtqHpP0xsfrtyqkHZtL
         +sSvkwl9pPgxzVw9G88ujzKWEYElIYewNtOAB0sK9VbeNpZ7iCC9NQ4SvUDqSiYbzlaJ
         05fHMJ3dOELRmmViOCxWfPC/V673N2z6FTO7UBO49ru1uNF/RaJ9JdowzCq+nGK5qh0N
         Bhd91OERqUHKz2+0M8cSUEy7fWCZmJnuDZ3D4+h0Eq6fuQnOb30k7S9nP6gHAAODwbxT
         Dpbw==
X-Forwarded-Encrypted: i=1; AHgh+Rp79VXsKZiPsb+ecbMAcCPp1Z0avXrbTaV2FOFTPiNg0Oa7v3Dtwz4dOTI8r1WxRep887pyedOk+DDyhvSOLWrq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ChBPzo+QLkHm0B3SiccPh+ud/MACLNqWIJQApe9xDttA8D2E
	jrXbcs/FjbZzFV2CWiLpkfhl5oQ81t5rqre1zM13DJrl4UthV4j+BJY/
X-Gm-Gg: AR+sD10z8QJKv6uhoa8KHHcspzCE94/vTSr2+JRqY4ELY/M4Idysdm/PxxQIFgp6CwV
	NrC/vF1ow+TCAsELpS//7gX8+Gf/QJv5FsARK0tzlwwrWB7KHtmQSqdAgbkEjp4RnXu0PruuLTq
	OSV7BYF3CieltuXvDZ7O7pFDDShJwgh2T6u1+2eTUAfbX01nxAr8npexSxNM9L/myJq1SoFR8AR
	jQLBDaWTlupz+lvIbRShswuMFE90rxUa6DS5NtvrXToM6rRmd63BYGOjPjbiwtjIag5hXI4DLE1
	io3e5CQBNhaNvYUhoTJL7EEcXX4cWIYqwfmyXEgeEFGXWk0ztnB8qHD/qJPuTnarajbyS3URtmj
	KXrfQcy82J2fcVoTqPZaIV/e6W6SEcDcytVjs8cknM61IDSSOe8L7b/9g3NByDCq1QXVNiii5y4
	BlbLCs2TdUN3xcP/3IYoRsOa6tf9tKt90NRbVBDhO9XjOebk102V0qgoKGnuQb3NKJa9bG1qhxV
	mnfRxbgpwdzEEtx4YUHa42FCG4ig/HbdLJPidZhmyUp8mBPnXyRPQ==
X-Received: by 2002:a05:600c:1546:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-499553bcbc8mr134755265e9.2.1786108392410;
        Fri, 07 Aug 2026 06:13:12 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:11 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v11 00/12] net: pcs: Introduce support for fwnode PCS
Date: Fri,  7 Aug 2026 15:12:42 +0200
Message-ID: <20260807131301.192060-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061314_888495_7D38A840 
X-CRM114-Status: GOOD (  34.23  )
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

A PCS provider on driver removal must call fwnode_pcs_del_provider()
to delete itself as a provider.

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

Changes v11:
- Rework PCS release to notifier way (fix race as pointed out by bot)
- Add Ack from Lorenzo for Airoha Ethernet driver
- Introduce devm variant for pcs_provider_add
- Better support firmware node reference for PCS late attach
- Better protect list iteration with state mutex
- Minor fixup to airoha pcs driver (flow control fixup)
- Rebase on top of net-next
Changes v10:
- Minor code cleanup and fixes as suggested by bot
- Drop devlink patch
- Add reviewed by tag
- Configure old_link_state on PCS release
- Unlink PCS on error in phylink_create()
- Use list_add_tail
- Fix typo in Airoha PCS driver
- Update phylink migration guide
- Better handle late PCS attach (idempotent function and
  add unser state_mutex)
- Use dedicated lock in Airoha ethernet driver
Changes v9:
- Rebase on top of net-next/main
- Drop early verification of supported_interface
  (it can also be provided by get_capabilites MAC OP)
Changes v8:
- Back to RFC (net-next closed)
- Address additional bug reported by Sashiko bot
  - Better handle priv interface for Airoha PCS driver
  - Better handle locking for modifying the PCS list in
    phylink code
  - Improve fwnode_phylink_pcs_parse() parsing on -ENOENT
  - Better handle error condition in phylink_create()
  - Turn down the link when current PCS is released
- Fix compilation warning caused by copy paste error
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
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: save phylink instance fwnode on phylink_create
  net: phylink: support PCS provider release
  net: phylink: support late PCS provider attach
  net: Document PCS subsystem
  MAINTAINERS: add myself as PCS subsystem maintainer
  net: phylink: add .pcs_link_down PCS OP
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: pcs: airoha: add PCS driver for Airoha AN7581 SoC
  net: airoha: add phylink support

 .../bindings/net/pcs/airoha,pcs.yaml          |  261 ++
 Documentation/networking/index.rst            |    1 +
 Documentation/networking/pcs.rst              |  229 ++
 Documentation/networking/sfp-phylink.rst      |   35 +-
 MAINTAINERS                                   |    9 +
 drivers/net/ethernet/airoha/Kconfig           |    2 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  190 +-
 drivers/net/ethernet/airoha/airoha_eth.h      |    5 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |    8 +
 drivers/net/pcs/Makefile                      |    3 +
 drivers/net/pcs/airoha/Kconfig                |   12 +
 drivers/net/pcs/airoha/Makefile               |    7 +
 drivers/net/pcs/airoha/pcs-airoha-common.c    | 1303 ++++++++++
 drivers/net/pcs/airoha/pcs-airoha.h           | 1311 +++++++++++
 drivers/net/pcs/airoha/pcs-an7581.c           | 2093 +++++++++++++++++
 drivers/net/pcs/pcs.c                         |  294 +++
 drivers/net/phy/phylink.c                     |  347 ++-
 include/linux/pcs/pcs-provider.h              |   65 +
 include/linux/pcs/pcs.h                       |  141 ++
 include/linux/phylink.h                       |   28 +
 21 files changed, 6298 insertions(+), 58 deletions(-)
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


