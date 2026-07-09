Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFFEC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BG2vUOiSPIba29gWhBMtcZSw2rJwWxQBPPTNcsunIWw=; b=uJfj4/7MgYX7hHjez16T9JkDbH
	np1gvGqIrgOOlMnypiqU0V85u/53piT0Q7zvK8vsk6QGTTradqK/iBcwWrlrr6e0RPwzKd8gBQgsj
	1ktG4ChJbFhVRehjoLTTiJdSi2DjQuPTeFNaoE9SkN3yshjs0vAEmAt5H4eS1WWJP29AA8kbVpvzC
	NmMEisTlwSIOXt6z6+A6rTxkMBSNUrTNMALhfK5Iq6wb7/ci6BK2KTTQqlt6wJi6mrZuhwVJ+Q2EP
	fVM41x4ZwnuZ0DTnHW1p1XP7WCBc1xPnVMEM9fMOTaPtPbwzLmGiqxCx0IZDcMjP6XEUxU/qlAq4V
	U4ixpj2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVp-00000001ola-3pP6;
	Thu, 09 Jul 2026 09:57:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlVj-00000001ohs-25iM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:57:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cc80b585bfso5636505ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591058; x=1784195858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BG2vUOiSPIba29gWhBMtcZSw2rJwWxQBPPTNcsunIWw=;
        b=FAei4X8wWXB9qqE1EhcabswGjgOCiH1jJoukClxddKTClVoJs2oM6CIlVAhcBQqaqV
         NEQyPdLlRTH8Pt2AgfajMeFuEegh001nxam49aIQYR3xGpLuCmrWGzWDkilAhpWiEv04
         QeVkmGGPxB+UAe7SWoP7Cm3Bq2+nWv1amWBfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591058; x=1784195858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BG2vUOiSPIba29gWhBMtcZSw2rJwWxQBPPTNcsunIWw=;
        b=L3tEmo0re+WTNjY5cDrrlsWI2OPgYxQtYixWiykMdX7I9Pp/7UhQxME3PCLja4ZcqU
         3b/STPiLymuMLW7MLK5JnV+jyIW/MBTxJNdN+QkkF6xSqnYvGyWLJ2wGP4FdEU/pIxFo
         R79QSF0PHXtNsGdSbgKJWkErU6Oh+D5AN0JFRGJ0trPilJAcvlYFkSrRzFtQ+CfRNddu
         Me4Ba4Vrjj+2Oi8ZEU2pue5YNEO2P5gptwY58XNNqUt3CeMSUN2cCsNqg6rD2HmvOi+h
         W8Bp/4pcvMxllrbjridnBkC2Wk+RV/Fg2jV9D7SfH72qb4w9cWywEWxFaeotUiPRjvNZ
         enxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmZYlR+6pX6kk1aq2unl+5u7ZJDdRKM4ZMjotS8hPd1tePFXyPNIw98KWjn+1HnrwCZ3EjAADgmb2yCxGFboaD@lists.infradead.org
X-Gm-Message-State: AOJu0YxN2POZ5dF8sheBZ0o9kzWM/aNrMSsfgnZXtEDdFGBRPZ+PJtln
	k7LIQMzgez3A14s/K6t+r6r5+3itWdOTv2ySMcnKd9a2Jptf5JNeDy87I3aVfnbUXg==
X-Gm-Gg: AfdE7cmZbZC5IZnrWZ4XP5A2FkjR0RRDqVaNcTtqHcRzumB/frnRF+kznyzL83W968p
	PmHg5nhjNDImCSlDLRoMgXzllEGpj23veuWmH/mL1D4iRJ6LOA4yJMwX4VRDlW7ZhYNNcdI3NGr
	NXYiXwpqIVcmKyzCF94A8xy5Ztu8HgpkEo74A34We6KybBjJW6bBKl/DG2sr97kVXi/GhB+EL2e
	tMhx/+PDhFydxEr9Xk8d7C4JZRtmCWug8+lrTf7Auf7y4j5pvmFmKb8a97vrrL8pTWt4EEUKv41
	YUfLQ8R2XAlLa1846r6A74797Cx0ngVCESbkz+wuhiqp6YzSALyKRxjPSU+DuZS0jEUWUiQ3V0b
	RWKMY0Mkn8JNCP/9uf46xU0Wms0qbnWX73QYFI+7vBP5NVQP0DmiLvrYDPAaEbHhK6f5uxH/2RY
	G0jcxXF4YDmCE7r/JleVRWXRXsoSMGZ2qmtk9hYKy6/QMXSUiPUK26nghZmLi83SGhKm/9GqlWv
	bByqBQ5
X-Received: by 2002:a17:903:644:b0:2ca:cef2:dea8 with SMTP id d9443c01a7336-2ccea46aea4mr43494035ad.35.1783591058447;
        Thu, 09 Jul 2026 02:57:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:37 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v4 00/14] arm64: mediatek: Add M.2 E-key slot on Chromebooks
Date: Thu,  9 Jul 2026 17:57:05 +0800
Message-ID: <20260709095726.704448-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025739_576902_5BFFEBD3 
X-CRM114-Status: GOOD (  35.93  )
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

This is v4 of my attempt at integrating the power sequencing API into
the USB core to support the USB connection on M.2 E-key slots. M.2
E-key was enabled in v7.1-rc1 with just PCIe and UART supported [1].

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

The series is based on next-20260708.


Patch 1 and 2 add new fwnode graph helpers. These are used by the patch
5 and 8, respectively.

Patch 3 adds a new pwrseq_power_is_on() for a power sequencer consumer
to query the current request state. Note that this is not the _actual_
state.

Patch 4 reworks the USB hub driver to return the actual error code from
hub_configure() in hub_probe(). This is needed in the next patch to
correctly return -EPROBE_DEFER returned by pwrseq_get() in patch 9.

Patch 5 makes the USB port device associated with a "port@" fwnode if
available. This depends on patch 1.

Patch 6 moves some |struct usb_port| related stuff from hub.c and hub.h
to port.c and port.h. No actual code or functionality is changed.

Patch 7 changes usb_port_is_power_on() so that |struct usb_port*| is
passed in instead of |struct usb_hub*|. This patch does not change any
functionality.

Patch 8 changes some USB hub port power control code that directly
toggles USB_PORT_FEAT_POWER to use usb_hub_set_port_power().

Patch 9 lets the USB hub driver look for power sequencers for each port.
Currently this only works for M.2 E-key connections, but it could be
extended to cover other cases. It should also make port reset via turning
off the port VBUS work, even when VBUS is not directly controlled by the
hub. This depends on patch 2 and 3 for the new helpers.

Patch 10 reverts an incorrectly modeled OF graph connection for the
MediaTek XHCI controller and adds a proper representation.

Patch 11 adds matching pwrseq consumer by "port@" node to the M.2 slot
driver. This is only used for the USB target, but there is no attempt
to differentiate the connection type. The driver simply tries matching
the "port@" node first, then falling back to the port parent or device's
node.

Patch 12 reworks the power sequencing targets for the E-key connector in
the pcie-m2 driver to add targets for USB and SDIO. The former is used
later on in this series.

Patches 13 and 14 enable the M.2 E-key slots (or slot-like integration)
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

Chen-Yu Tsai (14):
  device property: Add fwnode_graph_get_port_by_id()
  device property: Add fwnode_graph_get_next_port_endpoint()
  power: sequencing: Add pwrseq_power_is_on()
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
  arm64: dts: mediatek: mt8195-cherry: Add M.2 E-key slot
  arm64: dts: mediatek: mt8188-geralt: Add WiFi/BT as M.2 E-key slot

 .../bindings/usb/mediatek,mtk-xhci.yaml       | 17 +++-
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 92 ++++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 73 ++++++++++++++-
 drivers/base/property.c                       | 47 ++++++++++
 drivers/power/sequencing/core.c               | 18 ++++
 drivers/power/sequencing/pwrseq-pcie-m2.c     | 52 ++++++++---
 drivers/usb/Kconfig                           |  1 +
 drivers/usb/core/hub.c                        | 71 +++++++-------
 drivers/usb/core/hub.h                        | 56 ++---------
 drivers/usb/core/port.c                       | 92 ++++++++++++++++++-
 drivers/usb/core/port.h                       | 68 ++++++++++++++
 include/linux/property.h                      |  3 +
 include/linux/pwrseq/consumer.h               |  6 ++
 13 files changed, 483 insertions(+), 113 deletions(-)
 create mode 100644 drivers/usb/core/port.h

-- 
2.55.0.795.g602f6c329a-goog


