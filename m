Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917DAC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yBVJTsPAtcqmESTHuKJCv2a4WzEbjdLZyVurREUbU9c=; b=4N/qqoRICCefd+HV6ZA+SEbaTi
	SJySKBfkJwXPwggLkmkF70n4ITwcBS05q4qIpc9AfYmWSdYJIZTzcNYE8rMZpAsmSlmYX1YQohnJv
	HlnxLcetrcYAlYeY89C8VM9iOeAZvmwif0H7kdMbuu8LL/clQrgIPVoKzaAT1DtXmQP1w3GMYxrx6
	8OOU81elSPggtfQNSDQnCfUJwvnXquklSiW0YhrqvsbeBgSVbltusz5cCYSbLGduT5XrGRXYzmG5A
	mOc4/1rolNjgSjoeoSm0Ltby9tqFhuZEl1+SeCu0jbUKXU8JbkQT7emWxd037moEcRgyHu9bcNVcn
	AJAJjXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwmi-0000000AkJ2-1bAr;
	Mon, 04 Aug 2025 15:07:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw7v-0000000Af9U-0hxv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 14:25:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 49D6343BC0;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E059C4CEE7;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754317522;
	bh=BSGBOSXkEidOKLno5lfnh0peRNvAv6oMZrDPVi1ZE90=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YCmzh4Un7PY9Bsv9Gd8qVjAUQepS2c8XvwqtDm5EfSLOSb0cn4DjcPsEhbGMwoNi/
	 9DrzsFU7c5tzHIFNuorhYeCUlZVA/flDThMIw2hhxYZ4xdeMSMMvvnqrFXbal2QEKv
	 h2mF8UNpsElgRhDQ+7PDaYyFodVpWdS7urpHwrvGAhvpFuAoM3vm7/HrwuOIh374P1
	 aU7nmL921yH6D8DJCp4MLJx+nywM/83H5WBZA9/Jqo/+kWH/LuClxIrx3E3aTh7Enx
	 /SP/PNdk0YybiowIYc5E4a8H4qD0GRH3xLHBa0hygdadDl0bEUXfyPvs+q/1CGWH5Q
	 5IfNVTK7Swkdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E203C87FD3;
	Mon,  4 Aug 2025 14:25:22 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Subject: [PATCH v5 0/4] gs101: MAX77759 Fuel Gauge driver support and
 enablement
Date: Mon, 04 Aug 2025 16:26:37 +0200
Message-Id: <20250804-b4-gs101_max77759_fg-v5-0-03a40e6c0e3d@uclouvain.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB3DkGgC/4XQ2wrCMAwG4FeRXlvpIaXWK99DRNqZzoJu2m5FG
 Xt36wlBFG8CfyBfSAaSMAZMZDEZSMQcUmibEtR0QqqdbWqkYVsyEUwAL4U6oHXijG8O9qy1Vmb
 jawpMoJDcgpOSlNFjRB/Od3a1LnkXUtfGy31L5rfuHzBzyqiZb4W32nmUbNlX+7bPNjQzh+RmZ
 vFyFOM/HVGcuTbKWIdOe//FgbejhPzhQHEcGMMApbISPpzxcXTEU19e2D0vH8cr9sMtHGABAAA
 =
X-Change-ID: 20241202-b4-gs101_max77759_fg-402e231a4b33
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754317658; l=7588;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=BSGBOSXkEidOKLno5lfnh0peRNvAv6oMZrDPVi1ZE90=;
 b=8XBLP3ma5Cjk8qBog4IQTzb+ZmNeBy3h3n3x/404aUyNBbf3ZGBCca/USP49oWNvqyzxehU5e
 5xDzHAwkd9kBmNPBgRtywP/QWsb055AarO9n9SMeFgDF1bk/ZnQ53no
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_072523_255442_77FF8885 
X-CRM114-Status: GOOD (  15.50  )
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

The gs101-oriole (Google Pixel 6) and gs101-raven (Google Pixel 6 Pro)
have a Maxim MAX77759 which provides a fuel gauge functionnality based
on the MAX M5 fuel gauge.

Add a driver for fuel gauge of the the Maxim MAX77759 based on the
one for the Maxim MAX1720x which also uses the MAX M5 fuel gauge.
Enable it for the gs101-oriole and gs101-raven boards.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
Hi everyone,
I decided to completely separate the MAX77759 and the MAX1720x. The
reason I had just modified the MAX1720x initially was because I
thought at the time that their difference were much less important
than they ended up being.

Their common parts could be put in a common MAX M5 files which could
prove useful if more chips using the MAX M5 are to be added.

Changes in v5:
- Separate MAX77759 from MAX1720x for clarity
- Remove voltage reporting
- Add initialization of the chip
- Add device dependent initialization data
- Add access to eeprom for access to non-volatile backup data.
- Link to v4: https://lore.kernel.org/r/20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be

Changes in v4:
- Make first patch standalone
- Separate MAX77759 defines from MAX1720x defines (Dimitri Fedrau)
- Inline device name property (Dimitri Fedrau)
- Separate MAX77759 capacity lsb logic from the MAX1720x capacity
  computation (Dimitri Fedrau)
- Use device_property_read_u32 instead of of_property_read_u32
  (Sebastian Reichel)
- Removed leftover debugs
- Move shunt-resistor-micro-ohms to out of allOf:if: (Krzysztof Kozlowski)
- Fix reg-names constraints
- Fix style errors
- Link to v3: https://lore.kernel.org/r/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be

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
gs101-oriole:
  # Testing device max77759-fg
  ok 1 max77759-fg.exists
  ok 2 max77759-fg.uevent.NAME
  ok 3 max77759-fg.sysfs.type
  ok 4 max77759-fg.uevent.TYPE
  ok 5 max77759-fg.sysfs.usb_type # SKIP
  ok 6 max77759-fg.sysfs.online # SKIP
  # Reported: '1' ()
  ok 7 max77759-fg.sysfs.present
  ok 8 max77759-fg.sysfs.status # SKIP
  # Reported: '19' % ()
  ok 9 max77759-fg.sysfs.capacity
  ok 10 max77759-fg.sysfs.capacity_level # SKIP
  # Reported: 'MAX77759' ()
  ok 11 max77759-fg.sysfs.model_name
  # Reported: 'Maxim Integrated' ()
  ok 12 max77759-fg.sysfs.manufacturer
  ok 13 max77759-fg.sysfs.serial_number # SKIP
  ok 14 max77759-fg.sysfs.technology # SKIP
  ok 15 max77759-fg.sysfs.cycle_count # SKIP
  ok 16 max77759-fg.sysfs.scope # SKIP
  ok 17 max77759-fg.sysfs.input_current_limit # SKIP
  ok 18 max77759-fg.sysfs.input_voltage_limit # SKIP
  ok 19 max77759-fg.sysfs.voltage_now # SKIP
  ok 20 max77759-fg.sysfs.voltage_min # SKIP
  ok 21 max77759-fg.sysfs.voltage_max # SKIP
  ok 22 max77759-fg.sysfs.voltage_min_design # SKIP
  ok 23 max77759-fg.sysfs.voltage_max_design # SKIP
  # Reported: '-234690' uA ()
  ok 24 max77759-fg.sysfs.current_now
  ok 25 max77759-fg.sysfs.current_max # SKIP
  ok 26 max77759-fg.sysfs.charge_now # SKIP
  # Reported: '4572000' uAh (4.572 Ah)
  ok 27 max77759-fg.sysfs.charge_full
  # Reported: '4524000' uAh (4.524 Ah)
  ok 28 max77759-fg.sysfs.charge_full_design
  ok 29 max77759-fg.sysfs.power_now # SKIP
  ok 30 max77759-fg.sysfs.energy_now # SKIP
  ok 31 max77759-fg.sysfs.energy_full # SKIP
  ok 32 max77759-fg.sysfs.energy_full_design # SKIP
  ok 33 max77759-fg.sysfs.energy_full_design # SKIP

  gs101-raven:
    # Testing device max77759-fg
  ok 1 max77759-fg.exists
  ok 2 max77759-fg.uevent.NAME
  ok 3 max77759-fg.sysfs.type
  ok 4 max77759-fg.uevent.TYPE
  ok 5 max77759-fg.sysfs.usb_type # SKIP
  ok 6 max77759-fg.sysfs.online # SKIP
  # Reported: '1' ()
  ok 7 max77759-fg.sysfs.present
  ok 8 max77759-fg.sysfs.status # SKIP
  # Reported: '96' % ()
  ok 9 max77759-fg.sysfs.capacity
  ok 10 max77759-fg.sysfs.capacity_level # SKIP
  # Reported: 'MAX77759' ()
  ok 11 max77759-fg.sysfs.model_name
  # Reported: 'Maxim Integrated' ()
  ok 12 max77759-fg.sysfs.manufacturer
  ok 13 max77759-fg.sysfs.serial_number # SKIP
  ok 14 max77759-fg.sysfs.technology # SKIP
  ok 15 max77759-fg.sysfs.cycle_count # SKIP
  ok 16 max77759-fg.sysfs.scope # SKIP
  ok 17 max77759-fg.sysfs.input_current_limit # SKIP
  ok 18 max77759-fg.sysfs.input_voltage_limit # SKIP
  ok 19 max77759-fg.sysfs.voltage_now # SKIP
  ok 20 max77759-fg.sysfs.voltage_min # SKIP
  ok 21 max77759-fg.sysfs.voltage_max # SKIP
  ok 22 max77759-fg.sysfs.voltage_min_design # SKIP
  ok 23 max77759-fg.sysfs.voltage_max_design # SKIP
  # Reported: '-224377' uA ()
  ok 24 max77759-fg.sysfs.current_now
  ok 25 max77759-fg.sysfs.current_max # SKIP
  ok 26 max77759-fg.sysfs.charge_now # SKIP
  # Reported: '4622000' uAh (4.622 Ah)
  ok 27 max77759-fg.sysfs.charge_full
  # Reported: '4904000' uAh (4.904 Ah)
  ok 28 max77759-fg.sysfs.charge_full_design
  ok 29 max77759-fg.sysfs.power_now # SKIP
  ok 30 max77759-fg.sysfs.energy_now # SKIP
  ok 31 max77759-fg.sysfs.energy_full # SKIP
  ok 32 max77759-fg.sysfs.energy_full_design # SKIP
  ok 33 max77759-fg.sysfs.energy_full_design # SKIP

---
Thomas Antoine (4):
      power: supply: add support for MAX77759 fuel gauge
      dt-bindings: power: supply: add support for MAX77759 fuel gauge
      arm64: defconfig: enable Maxim MAX77759 fuel-gauge driver
      arm64: dts: exynos: google: add Maxim MAX77759 Fuel-gauge

 .../bindings/power/supply/maxim,max77759.yaml      |  76 +++
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts |  10 +
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |  30 +
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  11 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/power/supply/Kconfig                       |  14 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/max77759_battery.c            | 649 +++++++++++++++++++++
 8 files changed, 792 insertions(+)
---
base-commit: bc9ff192a6c940d9a26e21a0a82f2667067aaf5f
change-id: 20241202-b4-gs101_max77759_fg-402e231a4b33

Best regards,
-- 
Thomas Antoine <t.antoine@uclouvain.be>



