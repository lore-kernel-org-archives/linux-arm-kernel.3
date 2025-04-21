Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F06C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oZoddCZtxXk5s+zvjaZZC7dsGAKrXmUD1PyumkFluMk=; b=1t0/9fHbSfOCFD1a1X+DnIPLIc
	TKgsrFOm3bRMdLnalnOZjHcMoWnX1cgdSYf86qfir1Qaybb4dytqgOcYMnmPG7uJq7Sw3Sd3HjEVR
	NxkaZjvOdDG3j5P9eT5RyllbTUBoKmOnXbMp/4123ZkEXrtpghn4UwUNXTUxhT+Mt456O6e4dXmam
	yWWvby9WxgBawqmIp2mxYbpx0yK1M5uNplNmBP89obr7BQW0O8EMOaXZT8Cf9KEOytBRh4ldFRvZR
	saYcP228J5+XGysJoqoVLzPxQDDZBVg3VX3igAywrEyMZJspYioYzT5MRaonu7iCDcqvuwuG+yR9v
	EyUurqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6vpX-00000004uJj-0fn8;
	Mon, 21 Apr 2025 18:25:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6veU-00000004tHE-2G9f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 18:13:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFB5A43974;
	Mon, 21 Apr 2025 18:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 357B9C4CEE4;
	Mon, 21 Apr 2025 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745259232;
	bh=dhTtr4K5vrV7Ifdau0v9q818igO+jXIFRbDPCub+EH4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=n7aVrTM4SSiqBQsCcmlfb/iCV95UvM0+xkkUXFNELTCDTATexZEYW5OsonA9k3Ayy
	 gyAGBk/GHrCItpPeR99EkNRQoXcOH7MH5efrZlJqIQp5C0GKgNo96/lA6m4tnBA6A0
	 YXc40UzpRGl/ishD6BNxpsBnUj+8AiL+8HbDQu3JrXe0osbN3NlzWTL2PpxlqPF6F9
	 DVlejcjcY0mlL+UslpOyNiIWDnd7B4Xj8mOWuS3I1cEBMQ9v6ZyWdKCkEv38ZFKsyP
	 6SgGrkXkw0fdRqerKlbDMAbTWs1JJha1gTeEorYjX0Ixmw+QMQ2uUMpX3bMoBbCGWU
	 wciqDZZFfhsXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252F8C369AB;
	Mon, 21 Apr 2025 18:13:52 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Subject: [PATCH v3 0/5] Google Pixel 6 (oriole): max77759 fuel gauge
 enablement and driver support
Date: Mon, 21 Apr 2025 20:13:31 +0200
Message-Id: <20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMuKBmgC/4XNSwqDMBCA4atI1k3JS2K66j1KkUQnOtBqSWqwi
 HdvFLoplG4G/oH5ZiERAkIkp2IhARJGHIcc8lCQprdDBxTb3EQwoXge1CnaRc54fbez1ro0te+
 oYgKE5FY5KUk+fQTwOO/s5Zq7x/gcw2v/kvi2/QMmThk1VSu81c6DZOepuY1TsjgcHZDNTOLjl
 Iz/dER2Km1KYx047f2Xs67rGzi+m2oDAQAA
X-Change-ID: 20241202-b4-gs101_max77759_fg-402e231a4b33
To: Rob Herring <robh@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745259219; l=4444;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=dhTtr4K5vrV7Ifdau0v9q818igO+jXIFRbDPCub+EH4=;
 b=3CyC063e2T/TqTX5MRwjHsd8hbpR6TjK1Pr6MnLxmcY/r8rh0CIB1UVM+rSZUHbSbmnsg+VHB
 +tYJgdik7b/Av0XZI4sCgokWmJuekfiYOdQMS3iNVrZba8CINTf6tbK
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_111354_626843_1A052080 
X-CRM114-Status: GOOD (  14.55  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The Google Pixel 6 has a Maxim MAX77759 which provides a fuel gauge with
an interface with a lot in common with the Maxim max1720x.

Modify the Maxim MAX1720x driver to be compatible with the Maxim MAX77759
and enable it for the gs101-oriole board.

The voltage, current, capacity, temperature and charge have all been
tested and show coherent results. The charge full design and capacity
equal the ones seen on android, the ratio between average charge and
average current does predict pretty accurately the time to empty under
a constant workload and temperature is coherent with the dynamic state
of the device.

Health is not enabled as it always reports overheating. The time to empty
is wrong by about a factor 2 and is thus also disabled.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>

---
Changes in v3:
- Update base tree to avoid conflicts
- Fix capacity computation for max1720x
- Add separate properties for the max7759 to disable non-functional ones
- Take TASKPERIOD into account for voltage computation of max77759
- Simplify vcell computation (Dimitri Fedrau)
- Switch has_nvmem to bool and keep it only in chip_data (Dimitri Fedrau)
- Drop the yes_range from the write table (Sebastian Reichel)
- Add test_power_supply_properties.sh to cover letter (Sebastian Reichel)
- Switch back some changes to binding and actually use allOf:if: to
  restrict constraints (Krzysztof Kozlowski)
- Fix style errors
- Link to v2: https://lore.kernel.org/r/20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be

Changes in v2:
- Add fallback for voltage measurement (André Draszik)
- Add regmap for the max77759 (André Draszik)
- Add chip identification for the max77759 (André Draszik, Peter Griffin)
- Move RSense value to a devicetree property shunt-resistor-micro-ohms
  (Dimitri Fedrau, André Draszik)
- Use allOf:if to narrow binding per variant (Krzysztof Kozlowski)
- Remove binding example (Krzysztof Kozlowski)
- Change defconfig order to follow savedefconfig (Krzysztof Kozlowski)
- Fix style errors
- Link to v1: https://lore.kernel.org/r/20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be

tools/testing/selftests/power_supply/test_power_supply_properties.sh:
ok 1 max77759-fg.exists
ok 2 max77759-fg.uevent.NAME
ok 3 max77759-fg.sysfs.type
ok 4 max77759-fg.uevent.TYPE
ok 5 max77759-fg.sysfs.usb_type # SKIP
ok 6 max77759-fg.sysfs.online # SKIP
ok 7 max77759-fg.sysfs.present
ok 8 max77759-fg.sysfs.status # SKIP
ok 9 max77759-fg.sysfs.capacity
ok 10 max77759-fg.sysfs.capacity_level # SKIP
ok 11 max77759-fg.sysfs.model_name
ok 12 max77759-fg.sysfs.manufacturer
ok 13 max77759-fg.sysfs.serial_number # SKIP
ok 14 max77759-fg.sysfs.technology # SKIP
ok 15 max77759-fg.sysfs.cycle_count # SKIP
ok 16 max77759-fg.sysfs.scope # SKIP
ok 17 max77759-fg.sysfs.input_current_limit # SKIP(Dimitri Fedrau)
ok 18 max77759-fg.sysfs.input_voltage_limit # SKIP
ok 19 max77759-fg.sysfs.voltage_now
ok 20 max77759-fg.sysfs.voltage_min # SKIP
ok 21 max77759-fg.sysfs.voltage_max # SKIP
ok 22 max77759-fg.sysfs.voltage_min_design # SKIP
ok 23 max77759-fg.sysfs.voltage_max_design # SKIP
ok 24 max77759-fg.sysfs.current_now
ok 25 max77759-fg.sysfs.current_max # SKIP
ok 26 max77759-fg.sysfs.charge_now # SKIP
ok 27 max77759-fg.sysfs.charge_full
ok 28 max77759-fg.sysfs.charge_full_design
ok 29 max77759-fg.sysfs.power_now # SKIP
ok 30 max77759-fg.sysfs.energy_now # SKIP
ok 31 max77759-fg.sysfs.energy_full # SKIP
ok 32 max77759-fg.sysfs.energy_full_design # SKIP
ok 33 max77759-fg.sysfs.energy_full_design # SKIP

---
Thomas Antoine (5):
      power: supply: correct capacity computation
      power: supply: add support for max77759 fuel gauge
      dt-bindings: power: supply: add max77759-fg flavor
      arm64: defconfig: enable Maxim max1720x driver
      arm64: dts: exynos: gs101-oriole: enable Maxim max77759 fuel gauge

 .../bindings/power/supply/maxim,max17201.yaml      |  34 ++-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  10 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/power/supply/max1720x_battery.c            | 271 ++++++++++++++++++---
 4 files changed, 280 insertions(+), 36 deletions(-)
---
base-commit: e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
change-id: 20241202-b4-gs101_max77759_fg-402e231a4b33

Best regards,
-- 
Thomas Antoine <t.antoine@uclouvain.be>



