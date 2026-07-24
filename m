Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69601C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2qNCTVRLYatmEuVZZMDqxlvQqG1O3E6TO+1mmGjI9sQ=; b=JS/xgQVLwVKdEQDw650vTP0fVI
	5m5p+jRPTco4mUu5lNDj/ghFNbz5KCSFGqLzBM14cRHAKJSBNe/sW25DuISeWhCA+qRYEnkokSzH8
	BnoWVZCj+6OF11zZx8UhRpwGFQKGZxg/G9p0/m1rT4ApJ/R/+1CEKhtSXovwyuLpNFD8JfCVkVdEu
	P09oNCk+rBUYvktsW0yoPp3CBJuMk05sXCR8YE6SbFhJuEQ9GIkdLMmcPHnfwEm2jAM8V/GVRAAMu
	DzFhwekTTHgvoIDAtWQLSa1bHk8UJHjZ6i8mJnQ9twBd3esJoaiF6N9inmkKJjkpEyx6YV8vbnofU
	QWi21LdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBVn-0000000FqPB-2uQQ;
	Fri, 24 Jul 2026 08:44:07 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBVk-0000000FqOI-38VZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:06 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38e041ea211so162448a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882643; x=1785487443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qNCTVRLYatmEuVZZMDqxlvQqG1O3E6TO+1mmGjI9sQ=;
        b=hJUKjkhyzguttJDYj56t7KPzEJTgwvqkp/yrvViyjEOYOT43wIi/c7JajpGNCQdoc1
         opu/K7WnMbpaYNRvFtgEArIn9anzvYx9VLS67P7Kv+8CEFpFn93vqzUOIOUZyyhEvO3L
         nqUlAJfI5Puy0Zva2V3ESknBnCl1zKwnNf15Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882643; x=1785487443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qNCTVRLYatmEuVZZMDqxlvQqG1O3E6TO+1mmGjI9sQ=;
        b=VXZV8u+2WzGefYiGqoyiuHaBbs4R3axl7K/cVS06A3tsHDzw5wny5ptVuAxB0BsjUH
         9VNsVwTFPhYEFUUbWyur8bB63Sol7W1xqZXS4PuFvg6qMJv+894ks/Sg1N5Zxxw5zF9t
         yOiQAhNT2jmU/wPvJ4WUmW00z+kO0XgjjZD8Lmtv0xn85hxAUEfU4ePz37Wnjy026VXS
         Olp5rcOKN0tceuCi///OKj4FZafOc6MrHtEgoB8wZ6Y2RvRvaniW10SApV25D5TeFA66
         ABEAv3Eu2KSzpngrFl/kpF50XSyUD5IwOBgZs1I/falbFk3rlJJ0lb4C4esI1EOyjAkv
         IUKg==
X-Forwarded-Encrypted: i=1; AHgh+RrHZGpUFGcGPlXSzbxMH1ikfgz0wFfAATiMoEgrqzTrFs5QFvmBUXmZSVgsuf9VaQ6Zf6oSWLOYhg9g10O53z/t@lists.infradead.org
X-Gm-Message-State: AOJu0YzKHaMGRx/68NmixVoW4RQNPPLH8wqBxSmXgOsM1LRCsXD1A+zm
	zixb9Oltx/WJiokOWShic2/gvYL0anAZyCOcrKRCunEFrP4oHXaI/pvBxtFMSqODaA==
X-Gm-Gg: AR+sD13Md7ASZRW5xPyZrVG0Mb9N31HELrZJgzhsfyc1Vl3HSFxRKRtbtk6l+JBi8TL
	L5xGEfeVegxlvKSypqwXxBFW4w5RSEMDI4BJ1m0+NnMbEmod/OwR42aiUdB56yScK9EePTpMSvD
	ljjD9YCWwSlqUFYD2zXiUP0onm4VQfGtMQBhh7Tb5ulp0GYZDNt9q95bCaCij2OMe/FJ8X0rdVk
	I6hpiYRXhuj5xR0LPWRU2YOkkPY2ieIHl5RRhVjjGQfCycffvg1+a6wj4r47rEhmcAYHlfM03hX
	Ay3IKgFLJAM431yiU1vNdCln3R7mzNH+H+LIPnGvsUtOhp3n5Vyj67cNlfFxNm0Qq94++SnLsnd
	H8qXJvsZ6ji3DHQ1jgDndewPL/3heqrrJXaBbj5bxmLvjMki7pwly+ioM/kulYgYsx47K5Nnmrc
	KxP0/OnHMZDLMR60Ls+62LHM89v5hw4exdWuNMEAG2d/pJJ3oJdfnM/QKRlV8=
X-Received: by 2002:a17:90a:e7c5:b0:38e:895f:25fc with SMTP id 98e67ed59e1d1-38ec6a9b239mr5922762a91.38.1784882643256;
        Fri, 24 Jul 2026 01:44:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v7 00/16] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Fri, 24 Jul 2026 16:43:09 +0800
Message-ID: <20260724084328.3943997-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014404_793587_AD27E199 
X-CRM114-Status: GOOD (  38.78  )
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

Hi everyone,

This is v7 of my attempt at integrating the power sequencing API into
the USB core to support the USB connection on M.2 E-key slots. M.2
E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].
Hopefully this is the last revision. However the pwrseq patches haven't
been reviewed yet, and the fwnode patches need a review from the fwnode
owners.

As for Sashiko's comment about fwnode_get_next_*() not putting the
reference to @prev when @node is NULL, I plan to update the kernel-doc
for all the functions in a separate patch later.

Changes since v6:
- Patch 3 (power: sequencing: Add pwrseq_get_state())
  - Adopted enum for valid return codes (Bartosz)
- Patch 10 (usb hub pwrseq integration)
  - Added braces ("{}") to for loop in hub_is_port_power_switchable() (Andy)
  - Adapted usb_port_is_power_on() to new pwrseq_get_state() function
    return values (Bartosz)
- Link to v6:
  https://lore.kernel.org/all/20260721065413.2306137-1-wenst@chromium.org/

Changes since v5:
- Patch 1 (device property: Add fwnode_graph_get_port_by_id())
  - Dropped left-over declaration in header (Sashiko)
- Patch 3 (power: sequencing: Add pwrseq_power_is_on())
  - Reverted back to returning -EINVAL if descriptor is NULL (Andy /
    Bartosz)
- Patch 6 (usb: hub: Associate port@ fwnode with USB port device)
  - Added extra |struct fwnode_handle *| local variables to shorten lines (Andy)
  - Added comment about passing fwnode_graph_get_port_by_id() return value 
    directly to device_set_node() (Andy)
- Patch 10 (usb hub pwrseq integration)
  - Only assign port_dev->pwrseq if successfully retrieved pwrseq
    descriptor (Andy)
  - Dropped the pwrseq error pointer check in the release function
    (Andy)
  - Added check for port->pwrseq != NULL before calling
    pwrseq_is_power_on() (API change from patch 3)
- Link to v5:
  https://lore.kernel.org/all/20260715085348.3457359-1-wenst@chromium.org/

Changes since v4:
- Added flags parameter to fwnode_graph_get_port_by_id() so users can
  specify whether incomplete ports are returned or not (Sashiko)
- Made pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
  the descriptor is optional, matching the other pwrseq consumer APIs
- Added patch to swap out conditional set_bit()/clear_bit() with
  assign_bit() (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
- Call fwnode_graph_get_port_by_id() with FWNODE_GRAPH_DEVICE_DISABLED
  so that even incomplete ports can be connected (Sashiko)
- Dropped unused |hdev| variable from usb_hub_remove_port_device()
  (Greg / Sashiko)
- Dropped 'extern' from usb_port_is_power_on() header declaration (Andy)

- Patch 10 (usb hub pwrseq integration)
  - Rewrote usb_port_is_power_on() to better express intent and
    restrictions of pwrseq API (Andy)
  - Switched to dev_fwnode() in port_pwrseq_is_supported() (Andy)
  - Added blank line separating normal variable declarations and __free()
    type declarations (Andy)
  - Split out assign_bit() rewrite (Andy)
  - Moved pwrseq_put() to release function to avoid UAF (Sashiko)
  - Added back pwrseq_power_off() call in usb_hub_remove_port_device();
    otherwise power off could be delayed to object release
  - Don't clear hub->ports[port1 - 1] in main error path;
    by that time the port device is registered and sysfs attributes are
    available to userspace (Sashiko)

- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional (Andy)
- Added patch to split Bluetooth pwrseq units (Wei)
- Link to v4:
  https://lore.kernel.org/all/20260709095726.704448-1-wenst@chromium.org/

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING (patch 3) (Sashiko)
- Added missing fwnode_handle_put() (patch 5) (Sashiko)
- Added new patch to move |struct usb_port| related declarations to
  separate header (patch 6) (Andy)
- Patch 9 (usb hub pwrseq integration)
  - Adapted to move of usb_port_is_power_on() to port.c and port.h
  - Simplified usb_hub_set_port_pwrseq() (Andy)
  - Renamed usb_hub_set_port_pwrseq()'s "set" parameter to "on"
  - Dropped usb_hub_restore_port_pwrseq() (use usb_hub_set_port_pwrseq()
    with inverted argument)
  - Fixed off-by-one access in hub_is_port_power_switchable() (Sashiko)
  - Assign retval from dev_err_probe() instead of the other way around (Andy)
  - Clear hub->ports[port1 - 1] in USB port error and remove paths to
    avoid other threads from accidental UAF while the USB hub device is
    being unwound (Sashiko)
  - Short-circuit out of helpers if !IS_ENABLED(CONFIG_POWER_SEQUENCING)
    to avoid errors from stub functions (Sashiko)
- Drop redundant device node validity check; device_match_of_node()
  does it internally (patch 11) (Andy)
- Link to v3:
  https://lore.kernel.org/all/20260703110317.1283411-1-wenst@chromium.org/

Major changes since v2:
- Removed changes for MT8192 Asurada family: one of the device is
  shipped with RTL8822CE-VR, which is PCIe + UART and needs more work.
- Removed changes for USB A ports: VBUS one the type A ports on
  Chromebooks are not directly controllable from the OS and VBUS is
  modeled as always on. As such the changes I made don't actually
  change how the system works.
- Added new pwrseq_power_is_on() function
- Make new pwrseq integration effectively OF only by not assigning the
  port fwnode if the hub's fwnode is an ACPI node
- Added patch to convert remaining instances of directly setting/clearing
  USB_PORT_FEAT_POWER to usb_hub_set_port_power()
- Power sequencing state removed again in favor of state tracking by
  pwrseq subsystem
- Power sequencing descriptor again separately requested for HS and SS
  ports
- Dropped pwrseq_power_off() call before pwrseq_put(); the latter calls
  the former implicitly if the power state was left on
- Squashed DT binding revert and addition into one patch
- Link to v2:
  https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.org/


Major changes since v1:
- No longer adding the "index" parameter the power sequencing API
- Switched from OF graph to fwnode graph APIs
- Tie "port@" node to usb_port device, and use this device as consumer
  to acquire power sequencing descriptor
- Power sequencing descriptor now only tied to USB 2.0 port to avoid
  double reference
- Power sequencing state tracking added
- Link to v1
  https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.org/

The series is based on next-20260723.


Patch 1 and 2 add new fwnode graph helpers. These are used by the patch
5 and 8, respectively.

Patch 3 adds a new pwrseq_get_state() for power sequencer consumers
to query the current request state. Note that this is not the _actual_
state.

Patch 4 swaps out the existing conditional set_bit()/clear_bit() with
assign_bit(), which does the same thing.

Patch 5 reworks the USB hub driver to return the actual error code from
hub_configure() in hub_probe(). This is needed in the next patch to
correctly return -EPROBE_DEFER returned by pwrseq_get() in patch 9.

Patch 6 makes the USB port device associated with a "port@" fwnode if
available. This depends on patch 1.

Patch 7 moves some |struct usb_port| related stuff from hub.c and hub.h
to port.c and port.h. No actual code or functionality is changed.

Patch 8 changes usb_port_is_power_on() so that |struct usb_port*| is
passed in instead of |struct usb_hub*|. This patch does not change any
functionality.

Patch 9 changes some USB hub port power control code that directly
toggles USB_PORT_FEAT_POWER to use usb_hub_set_port_power().

Patch 10 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub. This depends on patch 2 and 3 for the new helpers.

Patch 11 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller and adds a proper representation.

Patch 12 adds matching pwrseq consumer by "port@" node to the M.2 slot
driver. This is only used for the USB target, but there is no attempt
to differentiate the connection type. The driver simply tries matching
the "port@" node first, then falling back to the port parent or device's
node.

Patch 13 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patch 14 splits the Bluetooth power sequencing unit so that the USB and
serdev consumers can separately toggle the actual state of W_DISABLE#2.
This patch is purposefully not squashed into the previous one to provide
a clear target for discussions.

Patches 15 and 16 enable the M.2 E-key slots (or slot-like integration)
found on MT8195 and MT8188 MediaTek-based Chromebooks. 


This series unfortunately spans multiple trees. The way I see it:

  - Patches 1 and 2 go through the driver core, and an immutable tag is
    provided to be merged together with the USB patches.

  - Patch 3 has an ack from Bartosz, and goes through the USB tree. But
    Bartosz also wants an immutable branch/tag to have a copy in the
    pwrseq tree.

  - Patches 4 through 10 (all the USB related ones) go through the USB
    tree, along with the dependencies above.

  - Patches 11 and 12 go through the power sequencing tree.

  - Patches 13 and 14 (device tree only) go through the soc tree via the
    mediatek tree.

Some of us discussed v1 at Embedded Recipes, and I believe Bartosz, Mani
and I agree on this approach. The debate is likely going to be on
whether this should be integrated into the USB core or not. I believe it
should, so that the power sequencing timing is tied to the USB port
being brought up. I do have a fallback option of just enabling the USB
power sequencing target inside the M.2 slot driver if a valid OF graph
connection is seen. But this is less desired for the reason given above.

Please have a look and share your thoughts.


Thanks
ChenYu


[1] https://lore.kernel.org/all/20260326-pci-m2-e-v7-0-43324a7866e6@oss.qualcomm.com/

Chen-Yu Tsai (16):
  device property: Add fwnode_graph_get_port_by_id()
  device property: Add fwnode_graph_get_next_port_endpoint()
  power: sequencing: Add pwrseq_get_state()
  usb: hub: Use assign_bit() in usb_hub_set_port_power()
  usb: hub: Return actual error from hub_configure() in hub_probe()
  usb: hub: Associate port@ fwnode with USB port device
  usb: core: Move struct usb_port and related APIs to port.h
  usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
  usb: hub: Use usb_hub_set_port_power() to control port power
    everywhere
  usb: hub: Power on connected M.2 E-key connectors with power
    sequencing API
  dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB
    connections
  power: sequencing: pcie-m2: support matching on remote "port" node
  power: sequencing: pcie-m2: Add usb and sdio targets for E-key
    connector
  power: sequencing: pcie-m2: Split Bluetooth unit based on interface
  arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
  arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot

 .../bindings/usb/mediatek,mtk-xhci.yaml       |  17 ++-
 .../boot/dts/mediatek/mt8188-geralt.dtsi      |  92 +++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  73 ++++++++++++-
 drivers/base/property.c                       |  54 +++++++++
 drivers/power/sequencing/core.c               |  19 ++++
 drivers/power/sequencing/pwrseq-pcie-m2.c     |  64 ++++++++---
 drivers/usb/Kconfig                           |   1 +
 drivers/usb/core/hub.c                        |  72 ++++++------
 drivers/usb/core/hub.h                        |  58 ++--------
 drivers/usb/core/port.c                       | 103 +++++++++++++++++-
 drivers/usb/core/port.h                       |  68 ++++++++++++
 include/linux/property.h                      |   4 +
 include/linux/pwrseq/consumer.h               |  12 ++
 13 files changed, 525 insertions(+), 112 deletions(-)
 create mode 100644 drivers/usb/core/port.h

-- 
2.55.0.229.g6434b31f56-goog


