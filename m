Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEE2C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z8VUK5jtTNpJD38aun+0vgWTIRTBEMGOUuPOyzPQHC0=; b=skiomvUOeMgdyv
	FQeDlAY/DAl6hfO0WkOO+8w4Kj5tvQ1eqpvu30VVWWE8bFHHbFVY6QsbcSI6q2pDdvQ+GBpUZSRQP
	TrrUl9sAM5hEvbmu2IphQWK+sFrcgTnvznwOrFpWxnWHUcesooXasFaMSsUvKRk9xRmHEYtWASvdk
	farZyT1dHSRcdgawSoDx24IWB9KYhSbUhAdDUgBrNjwz7D3XoR3Mf0bxHpqwrfKKMzF2YnZw0PxC4
	lmiC0+Wo0DJms+SXn1mfAMQxW/k9T5IDC7OMLr7rTdWFk101Tst8AmJRzaGsSGBnDT2PqPipfDa2s
	H1eLT9mof0gPfbvd+DEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKY-00000002dGM-0DZa;
	Fri, 04 Sep 2026 15:59:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKI-00000002clB-3paG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:59:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 196A56020A;
	Fri,  4 Sep 2026 15:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AA61F0156E;
	Fri,  4 Sep 2026 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537577;
	bh=Z8VUK5jtTNpJD38aun+0vgWTIRTBEMGOUuPOyzPQHC0=;
	h=From:Subject:Date:To:Cc;
	b=dx0shtEcEUjYeU1vtKnK+Ria6/Sdb/sE4In511HmjmlTTUyeSGiLLUPJNpZIMw3vg
	 70hVQ5hbHU9WtGH/QQi99tnPSFTQKsNVJYKfw/WDhnd4UKQYFybCfipV9o/bqCth4a
	 z99Abh8loK4Ug5iGJwKZuu0UF5+FPeDWBv/PQiHLZgdim/o14iYcPmNydd8pEDudr3
	 vuTvl9nHj8Vu6TMxoBpKtleMHyhb3Rq6VJVTi9ajcKd9TDcpv+ZKKN+NZ/Mcqjm49d
	 5wP1jklbB1IY2HOs2NSYsEGWORwmJTM0vOJRDZMRzXbCj/OO8+3I6ihOfMV51/Wfvn
	 v0e+cwByHGXHQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 0/9] firmware: arm_scmi: Refactoring and enablement of
 ACPI PCC transport
Date: Fri, 04 Sep 2026 16:57:55 +0100
Message-Id: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIfqmmoC/3XM3QrCIBjG8VsJj3Oor2uuo+4jYvjxVlKbQ0OKs
 XvPgogGHT4P/P4TSRg9JrJdTSRi9smHoQy5XhF71sMJqXdlE8FEzRlvqLaj75LtfTdaS1FK5AI
 ANQIpZox49Pd3b38o++zTLcTHO5/56/1XypwyyrQz2jQNa12707GvbOjJq5PFx25YLeqlFcXKI
 6gWlGPKqV8LX6s4LC0Ua83GKGUkGgO7C8YBr1WIJ3KY5/kJcrOvdCMBAAA=
X-Change-ID: 20251017-acpi_scmi_pcc-e44e1233eae3
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0
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

The SCMI can be utilized in systems using either the FDT or ACPI specification.
While FDT-based systems can natively use SCMI, ACPI-based systems often
need to abstract the functionality provided by SCMI under ASL methods.
So far, there has been no need to support SCMI natively on ACPI systems.

However, with the addition of a few new protocols such as Powercap and Telemetry,
which lack abstractions in the ACPI specification, there is now a need to
run SCMI natively for those use cases. ACPI for System Control and Management
Interface document[1] provides a mechanism which allows ACPI-based systems to
discover whether a platform supports SCMI and to natively use SCMI for
selected/limited subset of SCMI protocols.

This patch series introduces ACPI PCC transport support for the Arm SCMI
framework, alongside several foundational refactors and enhancements to
achieve firmware-node neutrality between Device Tree (DT) and ACPI systems.

The key changes include:

1. ACPI/DT abstraction and fwnode transition

   Converted the core SCMI code to use `fwnode_handle` instead of DT-specific
   structures, ensuring seamless operation across both ACPI and DT
   environments. All property lookups, child enumeration, and device
   association paths have been updated accordingly.

2. Unified transport registration for ACPI and DT

   Extended the SCMI transport driver macros to support ACPI match tables,
   enabling transports to probe using ACPI device IDs while maintaining
   backward compatibility with DT-only systems.

3. Protocol device initialization and refactoring

   Refactored the protocol device creation and validation logic into a new
   helper for improved readability and maintainability. Enhanced the
   initialization logic to handle ACPI-based SCMI devices without explicit
   child fwnodes.

4. Introduction of ACPI PCC transport

   Added a new SCMI transport driver leveraging ACPI PCCT (Platform
   Communications Channel Table) subspaces via the Linux PCC mailbox
   framework. This enables SCMI communication over PCC on ACPI-based
   platforms.

Collectively, these changes lay the groundwork for robust SCMI operation on
ACPI platforms, achieving near parity with DT systems where applicable,
while enabling the new PCC transport path for firmware communication.

Note: SCMI will not be run natively for all existing protocols other
than Powercap and Telemetry, as they must continue to use ACPI abstractions.

[1] https://developer.arm.com/documentation/111115/latest

-->8

Device (SCM0) {
  Name(_HID, "ARML0001")
  Name (_UID, 0)
  Name (_DSD, Package () {
    ToUUID("84a2d1c6-86b6-4199-8dac-9c17449d5e03"),  // SCMI Properties UUID
      Package () {
        Package(2) {
          "arm-arml0001-transport-pcc", // Key
          Package () {               // Value
              1,                     // Revision
              3,                     // Count
              Package(){4, 0, 1},    // PCCT Idx, TransportUID, A2P Common
              Package(){7, 1, 0},    // PCCT Idx, TransportUID, A2P Exclusive
              Package(){9, 2, 2}     // PCCT Idx, TransportUID, P2A Exclusive
          } // Value
        },
        Package(2) {
          "arm-arml0001-protocol-pcap",   // Key
          Package () {                // Value
             1,                       // Revision
             Package() {              // Protocol Exclusive Transport Package
                                      // Empty; A2P Common
             },
             Package() {}             // Protocol Association Package
          } // Value
        },
        Package(2) {
          "arm-arml0001-protocol-telemetry", // Key
          Package () {                // Value
            1,                        // Revision
            Package() {               // Protocol Exclusive Transport Package
              Package (2) {1, 0},     // UID=1; Flags=0; A2P Exclusive
              Package (2) {2, 0}      // UID=2; Flags=0; P2A Exclusive
            },
            Package() {}              // Protocol Association Package
          } // Value
        },
      } // Device Properties
    }) // _DSD
} // SCM0

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
Changes in v4:
- Fixed generated platform-device fwnode ownership using the platform-device
  OF/fwnode helpers.
- Dropped the PCC transport’s default y and clarified its Kconfig help.
- Treated ACPI package integers as 64-bit values and validated PCCT indices
  before narrowing.
- Reworked PCC parsing with named package indices.
- Made cached PCC transport maps device-managed and protected map cleanup
  with scoped locking.
- Replaced hard-coded framing and queue limits with symbolic constants.
- Simplified fwnode iteration and made cleanup-helper acquisition and
  release visibly colocated.
- Link to v3: https://patch.msgid.link/20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org

Changes in v3:
- Reworked ACPI _DSD parsing with stricter validation and order-independent
  transport/protocol processing.
- Added per-fwnode PCC transport maps, serialized access, multi-instance
  validation, and module-exit cleanup.
- Corrected PCC completion flags and validated shared-memory capacity and
  signature.
- Restricted protocol enumeration to ACPI-backed instances, handled optional
  protocols without spurious errors, and fixed CONFIG_ACPI=n builds.
- Removed redundant ACPI companion assignment.
- Enabled the ACPI PCC transport by default when its dependencies are met.
- Link to v2: https://patch.msgid.link/20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com

Changes in v2:
- Fixed SCMI fwnode lifetime handling by taking a reference when
  assigning protocol device fwnodes and releasing it from the device
  release path.
- Reworked ACPI PCC _DSD parsing to validate package types,
  revisions, counts, UID ranges, flags, duplicate UIDs, and channel
  mappings.
- Parse the SCMI ACPI _DSD UUID package directly as we moved to SCMI
  specific UUID from the generic device properties UUID and reject
  malformed or unsupported protocol association data.
- Tightened PCC channel selection so each protocol gets at most one Tx
  and one Rx channel, with exactly one common A2P channel and at most
  one common P2A channel.
- Only set the PCC interrupt-enable flag when the mailbox channel has a
  txdone IRQ.
- Added the SCMI Telemetry protocol ID(Temporary to get the build
  working, must come from Cristian's Telemetry support patched)
- Link to v1: https://patch.msgid.link/20251017-acpi_scmi_pcc-v1-0-0adbab7709d9@arm.com

---
Sudeep Holla (9):
      firmware: arm_scmi: Set generated device fwnode with platform helpers
      firmware: arm_scmi: Extend transport driver macro to support ACPI
      firmware: arm_scmi: Convert OF-only paths to generic fwnode in SCMI core
      firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
      firmware: arm_scmi: Pass protocol ID to transport chan_available()
      firmware: arm_scmi: Refactor protocol device creation logic
      firmware: arm_scmi: Add ACPI PCC transport
      firmware: arm_scmi: Initialise known ACPI protocol devices and channels
      firmware: arm_scmi: Validate PCC shared memory signature

 drivers/firmware/arm_scmi/bus.c                |  37 +-
 drivers/firmware/arm_scmi/common.h             |  39 +-
 drivers/firmware/arm_scmi/driver.c             | 201 +++---
 drivers/firmware/arm_scmi/transports/Kconfig   |  12 +
 drivers/firmware/arm_scmi/transports/Makefile  |   2 +
 drivers/firmware/arm_scmi/transports/mailbox.c |   7 +-
 drivers/firmware/arm_scmi/transports/optee.c   |   7 +-
 drivers/firmware/arm_scmi/transports/pcc.c     | 875 +++++++++++++++++++++++++
 drivers/firmware/arm_scmi/transports/smc.c     |  10 +-
 drivers/firmware/arm_scmi/transports/virtio.c  |   3 +-
 include/linux/scmi_protocol.h                  |   1 +
 11 files changed, 1089 insertions(+), 105 deletions(-)
---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20251017-acpi_scmi_pcc-e44e1233eae3


-- 
Regards,
Sudeep


