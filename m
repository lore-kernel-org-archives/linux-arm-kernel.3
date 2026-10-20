Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3125E606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 12:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=imLKfTlg;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EteR52t8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YyvabeuZdGCyn0mzdaqPxqGEL8hOcf0Gwpe0U8+xx+c=; b=imLKfTlg5h/Ig3ZzCEHARXix3H
	p3gIhznd/SkJwpF8BTVz0eUJEnNyQXOHtGHz9lrLIQCBW9cK1NoCrbrMhg2f3ZyCuSMNSVR9Rkc4d
	xbU7YIyKLAAeJ+8ZjxzLJ9Yqtr76s5xUGogwEBUxo0yZeVctyqkZkQQaxw1/63DQKG4PrSZ3YRqNh
	F7ZoswyE6sOuA6eAlPQPJYle6R2IsiYbCW+hXb9iC1ccygwroFUKkHVGSCfaLjs3q1jFel9Y0k7hI
	jQqiUQR+qXyx1/IIt2O6ZSEnp8peWz+rKStrsn+BGrI2V3GnwDqBzEHe3QwMArgkMh+v3wAcDNB1M
	K+HTxB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ92I-00000009fnn-0Q0f;
	Tue, 20 Oct 2026 12:33:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ92G-00000009fnP-1hun;
	Tue, 20 Oct 2026 12:33:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC06F40033;
	Tue, 20 Oct 2026 12:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436C31F000C5;
	Tue, 20 Oct 2026 12:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792499623;
	bh=YyvabeuZdGCyn0mzdaqPxqGEL8hOcf0Gwpe0U8+xx+c=;
	h=From:To:Cc:Subject:Date;
	b=EteR52t8RjKpe3vVE8R/r3w+RKREW07yyRakPdNS2Xv0S4HldkggSHeijwlBYLMNZ
	 WGuHaXgiOG93n3t58CsNicTEdjSt0KbtZuw70MLZ7LO9Q/t6sSGHdmUEWdAWziCYVu
	 qqjVaW5P8ecdN/XEpb3kWE69ugdJzDda3XRP4S5Jsju+I5qQEDusQCqjzrWppiusle
	 zVnkNmIQfjbeCX5hnpQHst1P9iuCmwOygSk15cBC5bfhWy8vcf3YfSmMhz0SWGVEsM
	 7NJm8/5NCqiV7OofOkHC6clwV7I9Z4Fl3yBFxDpzH+XUPEWXdv7l3d+kFQUP56nQ26
	 8Ylcv5VfY4LLw==
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yue Wang <yue.wang@Amlogic.com>,
	Hans Zhang <18255117159@163.com>,
	Rob Herring <robh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jon Mason <jdmason@kudzu.us>,
	Myron Stowe <myron.stowe@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>,
	mx2pg@pm.me,
	Niklas Cassel <cassel@kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Frank Li <Frank.Li@nxp.com>,
	Mahesh Vaidya <mahesh.vaidya@altera.com>,
	Ricardo Pardini <ricardo@pardini.net>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/3] PCI: Fix and improve default MPS configuration
Date: Tue, 20 Oct 2026 14:28:54 +0200
Message-ID: <20261020122854.1500883-5-cassel@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13914; i=cassel@kernel.org; h=from:subject; bh=GKq1pZrgivOXBIyPXFoDErstixL1L10Iv5wDtYmz7nI=; b=owGbwMvMwCV2MsVw8cxjvkWMp9WSGLKux7VVaR2X+LdV6t0SwVtPJ/zKt253Np51vfq+wpzI9 lSrjImHOkpZGMS4GGTFFFl8f7jsL+52n3Jc8Y4NzBxWJpAhDFycAjCRTf8Z/kdwsqzYIl20bYah +0KR/9wd4XpC/6NuFd1LMFS0X79x9RqG/1nqahyJa13rJ0oc6N+SunbuTMk8oYyPMZNaVuX8/V+ lwQEA
X-Developer-Key: i=cassel@kernel.org; a=openpgp; fpr=5ADE635C0E631CBBD5BE065A352FE6582ED9B5DA
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series reworks Hans's series "PCI: Configure Root Port MPS during
host probing" (v9, link below).  Besides configuring Root Ports, which
that series was about, it fixes other problems in how mainline programs
the Maximum Payload Size (MPS), and lists the problems it doesn't fix.

It is based on pci/next, which has the first patch of the RFC (link
below), "PCI: Update saved Max Payload Size in pcie_set_mps()".

The changes compared to v9, including the commit messages and this
cover letter, were developed with the help of an LLM, based on its
review of v9 and of the sashiko-bot reports, and reviewed by me.

Background
==========

A PCIe device must not send a TLP with a payload larger than the MPS it
is programmed with, and a receiver treats a TLP larger than its own MPS
as Malformed, so all devices on a path need compatible MPS settings.

Unless a "pci=pcie_bus_*" option is given, the kernel uses the default
strategy, PCIE_BUS_DEFAULT: pci_configure_mps() programs each device, as
it is enumerated, to the MPS of its upstream bridge.  If the device's MPS
Supported (MPSS) is smaller and the upstream bridge is a Root Port, the
Root Port is lowered instead (9f0e89359775).  The other strategies either
configure whole hierarchies in pcie_bus_configure_settings()
(pcie_bus_safe, pcie_bus_perf, pcie_bus_peer2peer) or don't touch MPS at
all (pcie_bus_tune_off).

Problems found in mainline
==========================

Enumeration:

1. Root Ports keep whatever MPS they came up with.  Fixed by patch 2.

   Root Ports have no upstream bridge, so pci_configure_mps() never
   configures them, and every hierarchy inherits the MPS that firmware or
   the hardware reset left in its Root Port.  On platforms whose firmware
   doesn't configure MPS, which is typical for DT-based systems with
   native host controller drivers, every hierarchy runs at the 128-byte
   reset value even if the Root Port and all devices below it support
   more, at a cost in throughput.  Host controller drivers work around
   this: the Meson driver programs its Root Port to 256 bytes itself,
   regardless of what the devices below it support, which patch 3
   removes.

2. Lowering the MPS only works directly below a Root Port.  Fixed by
   patch 1.

   - Below a Switch, the Switch ports keep the larger MPS, and a device
     that supports less is left mismatched with a "use
     pci=pcie_bus_safe" warning.  This happens at boot whenever firmware
     or a host controller driver programmed a larger MPS than a device
     below a Switch supports.  It has been a known limitation since the
     default strategy was introduced (27d868b5e6cf).

   - For a multi-function device directly below a Root Port, function 0
     is programmed to the Root Port's MPS first.  If function 1 supports
     less, the Root Port is lowered, but function 0 is left at the larger
     value and can send TLPs larger than the Root Port now accepts.  Only
     an informational message about the Root Port is printed.  This was
     introduced by 9f0e89359775.

Hotplug and rescan:

3. A device hot-added directly below a Root Port.  Fixed by patches 1
   and 2.

   If the device supports less than the Root Port's MPS, the Root Port
   is lowered, with the multi-function problem from 2.  If it supports
   more, it is only matched to the Root Port's current MPS: a Root Port
   is never raised again, e.g. after a device that supported less has
   been replaced, and without firmware MPS setup it stays at 128 bytes.
   Devices found by a rescan below an empty Root Port slot behave the
   same.

4. A Switch hot-added directly below a Root Port.  Fixed by patches 1
   and 2.

   The Upstream Port can lower the Root Port, but the Downstream Ports
   and the devices below them are only matched to their upstream bridge,
   and any of them that supports less is left mismatched with a warning.
   With patch 1, nothing below the Root Port is in use yet, so the whole
   new hierarchy is lowered.  If the new Switch has hotplug-capable
   ports, patch 2 then limits the hierarchy to 128 bytes, so devices
   hot-added below it later can match (5).

5. A device hot-added below a Switch.  Fixed by patches 1 and 2, unless
   endpoints below the Root Port are already in use (7).

   Only a Root Port is ever lowered, so a device that supports less than
   the MPS of the Switch ports, e.g. less than what firmware programmed,
   is left mismatched with a warning.  Patch 2 limits hierarchies with
   hotplug-capable Switch ports to 128 bytes, like pcie_bus_safe does, so
   devices hot-added below such ports always match.  Below a Switch
   without hotplug support, e.g. when a device is found by a rescan,
   patch 1 lowers the whole hierarchy as long as no endpoint below the
   Root Port is in use, since the Switch ports themselves don't do DMA.

6. A Switch hot-added below another Switch.  Fixed by patches 1 and 2,
   unless endpoints below the Root Port are already in use (7).

   Same as 5, for every port and device of the new Switch.  With patch
   2, a hierarchy whose Switch has hotplug-capable ports, e.g. a chain of
   Thunderbolt devices, already runs at 128 bytes, so the new Switch can
   match.  Below a Switch without hotplug support, patch 1 lowers the
   hierarchy as in 5.

7. A device added next to endpoints already in use below the same Root
   Port, e.g. a new function found by a rescan while function 0 is
   bound, or a device below one Downstream Port of a Switch while an
   endpoint below another one is bound.  Only partly addressed.

   Directly below a Root Port, mainline lowers the Root Port below the
   active function, which is left at the larger MPS.  With patch 1, the
   hierarchy isn't changed, and the new device is left mismatched with a
   warning instead, as below a Switch today.

Other:

8. With pci=pcie_bus_safe or pcie_bus_perf, devices found by a rescan
   aren't configured at all: pci_configure_mps() leaves them to
   pcie_bus_configure_settings(), which the rescan helpers don't call.
   This doesn't affect the default strategy, where pci_configure_mps()
   configures each device as it's enumerated.  Calling
   pcie_bus_configure_settings() from the rescan helpers wouldn't fix
   this safely, since those strategies reprogram every device of the
   hierarchy, including ones in use.  Not addressed.

Approach
========

Two constraints drive the design:

- The MPS of a device that may have a driver bound can't be changed
  safely: the device may have DMA in flight, its driver may have cached
  the value, and the core's read-modify-write of Device Control isn't
  serialized against the driver's own updates of that register.
  Changes to a hierarchy are therefore limited to hierarchies in which
  no device below the Root Port, other than a Switch port, has been
  added or made available for driver binding yet, i.e. during the
  initial scan, or when devices are hot-added or rescanned into a
  hierarchy without endpoints in use, such as an empty slot directly
  below a Root Port.  As today, the Root Port itself may still be
  changed, and so may Switch ports, since they don't do DMA and the port
  driver doesn't change Device Control after enumeration.

- A device hot-added below a Switch later can't lower the MPS of a
  hierarchy with endpoints in use, so it only works if it supports the
  MPS the hierarchy already runs at (5).  Hierarchies with
  hotplug-capable Switch ports are therefore limited to 128 bytes, which
  every device supports.

A better solution would be to quiesce the drivers of all devices below
the Root Port, e.g. the way a reset does with ->reset_prepare() and
->reset_done(), change the MPS of the whole hierarchy, and then resume
them.  That would allow changing the MPS of a system that is in use,
including when a device that supports less shows up next to endpoints
in use (7), and hierarchies with hotplug-capable Switch ports wouldn't
need to be limited to 128 bytes.  It requires every affected driver to
support being quiesced and to cope with a changed MPS, e.g. drivers
that cache it, which is beyond this series.

Only PCIE_BUS_DEFAULT changes; the other strategies are unchanged.

Why the Root Port MPS is set from pcie_bus_configure_settings()
===============================================================

v9 raised each Root Port to its maximum MPS when pci_configure_mps() ran
for the Root Port itself, and relied on lowering it again as devices
below it were enumerated.  At that point, nothing below the Root Port
has been enumerated yet, so the kernel can't know the smallest MPSS
below it, whether the hierarchy has hotplug-capable Switch ports, or
whether the slot is empty.  Raising the Root Port there:

- can't take hotplug-capable Switch ports into account, since they
  haven't been found yet: hierarchies that have to be limited to 128
  bytes (5) would be raised first and lowered again as those ports are
  found, and bridges that are only marked as hotplug-capable later, e.g.
  by acpiphp, would be missed;

- raises empty slots, so a Switch hot-added into one later inherits the
  raised MPS;

- happens only once, since a Root Port isn't enumerated again on
  hot-add, so the Root Port can't be raised again after a device that
  supported less has been replaced (3).

pcie_bus_configure_settings() runs after the hierarchy below a Root Port
has been scanned and before its drivers are bound: from pci_host_probe()
and the ACPI and arch-specific root bus scans, and from pciehp, acpiphp
and shpchp after a hot-add.  It is where the other strategies already
configure MPS for a whole hierarchy, and pcie_find_smpss() already
computes the smallest MPSS of a hierarchy, returning 128 bytes for
hierarchies with a hotplug bridge other than the Root Port, which is
exactly the limit patch 2 applies to them.  An empty slot isn't
configured until something is hot-added or rescanned there, and every
hot-add directly below a Root Port re-evaluates its hierarchy.  The
rescan helpers don't call pcie_bus_configure_settings(), so patch 2 does
the same from them.

Configuring the MPS in pci_bus_add_device() instead would also run after
the scan, but once per device rather than once per hierarchy, and it
would move all of the default MPS configuration into the driver binding
path.

Behavior changes
================

- With firmware that programs MPS, e.g. on x86, a hierarchy may now run
  at a larger MPS than firmware chose, and different Root Port
  hierarchies may end up with different values.  This could matter for
  peer-to-peer DMA between devices below different Root Ports, unless
  the Root Complex splits such TLPs.  pci=pcie_bus_peer2peer remains
  available for that case.

- Hierarchies with hotplug-capable Switch ports are limited to 128
  bytes, even where firmware programmed more.  This costs throughput,
  but makes every device hot-added below them work.

- A single device with a small MPSS found during enumeration lowers the
  MPS of every device below its Root Port.

- A device that shows up later below a Switch without hotplug support,
  e.g. found by a rescan, next to endpoints already in use, may find its
  hierarchy raised by patch 2, and is left mismatched with a warning if
  it supports less (7).

- Read completion coalescing is now also disabled on Intel 5000/5100 in
  the default mode (quirk_intel_mc_errata()), since the default mode can
  now raise MPS above what firmware programmed.

- Scan paths that call neither pcie_bus_configure_settings() nor the
  rescan helpers, mostly legacy ones or ones without Root Ports, are left
  as they are today.

---
Changes in v2:
- Drop "PCI: Update saved Max Payload Size in pcie_set_mps()", which has
  been applied to pci/next, and rebase on pci/next.
- Patch 1: Don't count Switch ports as devices in use, since they don't
  do DMA and the port driver doesn't change Device Control after
  enumeration, so that a device that shows up below a Switch without
  endpoints in use can still lower the hierarchy.
- Patch 2 (was 3): Limit hierarchies with hotplug-capable Switch ports to
  128 bytes, so that devices hot-added below them always match, instead
  of leaving them at their current MPS.  The hierarchy's MPS is now set
  rather than only raised.
- Patch 2: Stop at the first device whose MPS can't be set and restore the
  previous MPS of the hierarchy, instead of carrying on and leaving it
  with mismatched settings (reported by sashiko-bot:
  https://lore.kernel.org/r/20260930150617.CE88A1F000FF@smtp.kernel.org/).
- Patch 3 (was 4): Update the comment in meson_size_to_mrrs() to refer to
  MRRS (reported by sashiko-bot:
  https://lore.kernel.org/r/20260930145752.C0D4D1F00893@smtp.kernel.org/).
- No longer an RFC: raising the MPS above what firmware programmed is
  acceptable, hierarchies with hotplug-capable Switch ports are limited to
  128 bytes, and a device that can't match a hierarchy in use stays bound
  with a warning, as today.

RFC: https://lore.kernel.org/linux-pci/20260930145017.1356088-6-cassel@kernel.org/
v9: https://lore.kernel.org/linux-pci/20260916153907.60344-1-18255117159@163.com/

Hans Zhang (2):
  PCI: Match the hierarchy's MPS to a device's MPSS as necessary
  PCI: meson: Remove redundant MPS configuration

Niklas Cassel (1):
  PCI: Configure Root Port MPS after scanning its hierarchy

 drivers/pci/controller/dwc/pci-meson.c |  27 +---
 drivers/pci/probe.c                    | 194 ++++++++++++++++++++++++-
 drivers/pci/quirks.c                   |   3 +-
 3 files changed, 195 insertions(+), 29 deletions(-)


base-commit: a907c0643fb44bb260f3133b9c73bd34fd125e4c
-- 
2.56.0


