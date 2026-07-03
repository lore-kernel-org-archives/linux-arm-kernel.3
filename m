Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F5DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q54AXXZibLac2loujR95LlShSMkgwbrUGcLWCDQjqww=; b=aC0dDlgqJqn/qvJoB+vNuTq/aF
	kRkXUjuwLBnvpPjDuiRZyx6BvmCwU8Ypm/zMYjAkxyMkVmQ++bBJwP/cwLE88hyge+tr5imxh2mG0
	0gNMFrqrhK1klMOlCnAkSV4LIDnCsjLbpizU4TvvgHf0MAHS9Q01/JLekdczRc1cFcA+uyr24iQoP
	Z5euVD9tykkNzSowmoh+44T46vZqMJOOl/Rw81G71LwucupcRz7t9Fa6DvI/EXJPYo/R7u1FYYNrC
	cy6eZo/7oetPMzfM2GTYZ/9uQBQzAIS9Ca8smgFr+lu5Hu94MY26b7Zkx9ZLCwCw6ffUFX5wMO7io
	GRX9p4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff1O-00000007Hkc-04zc;
	Fri, 03 Jul 2026 14:37:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wff1K-00000007Hhk-1fR6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 14:37:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C7A81A0DE2;
	Fri,  3 Jul 2026 14:37:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E25060300;
	Fri,  3 Jul 2026 14:37:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D0258104C952E;
	Fri,  3 Jul 2026 16:37:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783089447; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Q54AXXZibLac2loujR95LlShSMkgwbrUGcLWCDQjqww=;
	b=NMvwH68N6nGwocQePGi76dtg1BIJt1/ZVE1kBfmqIZfGN1wUvER97WkeOi46prZjg6tHfv
	no9Vzl795Utql7giF76e7b2UUN7QM6UKvhLY81KznCmfjgjVw13HmnTWXJvFTLAKf2+baA
	+OHvmYoBuV/A9oaoR3b0d+UVnQ5ojoRT1EqtgPh8VQEGh8Ey0bz6Cacj9oF2rQmnQPUyDq
	ccod81oe0YuvWwlwyP1azUXSWTS5lfstLsnJmloTak15Q5L+c9si/DZ4AFokWMhqKQk8tB
	cK+Vi+Xnk8sU1S3UT5e37axIEHBMW9j18FSuZ/3hKJP593jbSPD2zDGq/FhVRg==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] dts: ti: k3-j7: Reserve memory for LPM metadata
Date: Fri,  3 Jul 2026 16:37:11 +0200
Message-ID: <20260703143717.177362-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_073734_576349_5102268F 
X-CRM114-Status: GOOD (  12.00  )
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

For TI Jacinto SoCs (J7200, J721S2, J784S4, J722S, J742S2) which support
low power modes, a chunk of memory is reserved for LPM metadata, needed
for saving ATF context and the certificate information of ATF and OPTEE
and the DM image. This LPM metadata area is firewalled to be accessed
only by TIFS.

At boot time, U-Boot R5 SPL copies the DM image into this memory region
so that it doesn't have to be reloaded from storage at resume, speeding
up the resume time.

U-Boot R5 SPL/TIFS use this area to save and restore:
- ATF context
- ATF certificate information
- OPTEE certificate information
- DM image

https://software-dl.ti.com/tisci/esd/latest/2_tisci_msgs/pm/lpm.html#lpm-msg-lpm-save-addr

NB: Unlike for Sitara, this memory region is not part of the DM memory,
which is not retained across suspend, so the Sitara binding can't be
re-used here.

Patch 1 adds a new binding for this layout.
The other patches add the memory region for the TI Jacinto SoCs (J7200,
J721S2, J784S4, J722S, J742S2)

Changes since v2:
- Split the DTS changes per ipc-firmware.dtsi
- Reference the LPM carveout through a phandle
- Add a dt-bindings patch documenting the "lpm-metadata" memory-region
  name for the Jacinto layout.
- Use the generic @memory node naming instead of @lpm-memory.
- Clarify how the DM image is handled
Link to v2: https://lore.kernel.org/lkml/20260427160326.370415-1-richard.genoud@bootlin.com/

Changes since v1:
- add specific lpm region for j742s2 and j784s4 instead of the common
  one since the addresses are not the same.
- add j721s2 lpm_memory_region
- change j722s addresse to prevent holes
Link to v1: https://lore.kernel.org/lkml/20260312113446.1857592-1-p-mantena@ti.com/

Richard Genoud (TI) (6):
  dt-bindings: remoteproc: k3-r5f: Add Jacinto LPM memory region
  arm64: dts: ti: k3-j7200-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j721s2-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j784s4-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j722s-ti-ipc-firmware: Reserve memory for LPM
    metadata
  arm64: dts: ti: k3-j742s2-ti-ipc-firmware: Reserve memory for LPM
    metadata

 .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 18 +++++++++++---
 .../boot/dts/ti/k3-j7200-ti-ipc-firmware.dtsi | 12 ++++++++--
 .../dts/ti/k3-j721s2-ti-ipc-firmware.dtsi     | 12 ++++++++--
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 12 ++++++++--
 arch/arm64/boot/dts/ti/k3-j742s2-evm.dts      |  2 ++
 .../dts/ti/k3-j742s2-ti-ipc-firmware.dtsi     | 24 +++++++++++++++++++
 .../dts/ti/k3-j784s4-ti-ipc-firmware.dtsi     | 15 ++++++++++++
 7 files changed, 86 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-j742s2-ti-ipc-firmware.dtsi

-- 
2.47.3


