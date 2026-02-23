Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C8E98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 10:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cBxLAX25xbkz+QKUzXhX/Lxi/5uExiphv83cURZlTY=; b=vJdulyN5OQQ/ANr1xsLv4U6/6J
	295dQawqvM/1r5877JeoB6Ji/47Nsv8GNRSRWDlfZHQLrhV55OrwOXi+mvngzKhWpxiwY1UdnnfnP
	PrQqUwqtOhJLltIip+NO4xGrNWU5O9ak9CpBXu6Bu2qYeb2kZz3uzW+OT7gy+0U1fG6gRPC69aM/L
	+S+XZNFSU1NlNcnKB8SEycMB1vn9m4RKdnTmlBGUj4VR7p2ij6ehjrgy/VRKnO/3kasQn4yMY+llx
	dnSyK0/Gd4uDgMJ1jL51OZD6L4hNoABaQaUDdlCNSsqyhnx7j9GgtN63ZLpAYmUMmOONxOpr1Vx+/
	Ix+u4Irg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoP-0000000007o-0gkE;
	Mon, 23 Feb 2026 10:05:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuSoN-0000000007I-3H8Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 10:05:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D50160053;
	Mon, 23 Feb 2026 10:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B134CC116C6;
	Mon, 23 Feb 2026 10:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771841106;
	bh=wStn2+PjC1n8XDfeiGKbYBLcOVjDTf5kAPZijXt74vE=;
	h=From:To:Cc:Subject:Date:From;
	b=HoFHwNP48AK/BC6Qxp/PeY0A6vdNQP7x1fl42q1yHlar2qwBXgz+NJ0fo2mHIPA+E
	 +Xh6zfXdq0zbF9gnl7Voejy0WInONBPYkZKCRA4T2sSeJfJBuQdMB7oQjMkQI9yXQW
	 hTjDRwuLm58wMbZpQC8uwp4zByUh/9idY9/nyf1QNuRx7wPsgnuVsbB05YC44Qdccb
	 Id6QDrYf4R+vzHenoI5UnQcxzUTNT89QzOPMvZ2O5fxlIJ0a1gFFfAp1MzmpEG5CM/
	 wL0iYQuZhVPYrqFx9CGnDM6ARZtI05yrJckZEbuHKNQ9mKnbivVeVWjOdDkDiweyWT
	 DTCrzZJBQO+gA==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 0/8] Remove the Kontron SMARC-sAM67 board
Date: Mon, 23 Feb 2026 11:04:45 +0100
Message-ID: <20260223100459.844967-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I was informed two weeks ago that this product is discontinued
(without being ever released to the market). Unfortunately, this
collided with the merge window and I had to wait two more weeks.

Pull the plug and let's not waste any more maintainers time.

Please let me know if this can be picked up in one go or if the
device tree has to be removed first and then the drivers together
with the dt-bindings.

On the bright side, the board upstreaming brought some driver fixes,
too. I'm really sorry for any wasted time.

Michael Walle (8):
  arm64: dts: ti: remove the Kontron SMARC-sAM67
  arm64: defconfig: remove SENSORS_SA67MCU
  Revert "hwmon: add SMARC-sAM67 support"
  Revert "dt-bindings: mfd: sl28cpld: Add sa67mcu compatible"
  Revert "dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module"
  Revert "dt-bindings: nvmem: sl28cpld: add sa67mcu compatible"
  Revert "dt-bindings: watchdog: Add SMARC-sAM67 support"
  Revert "dt-bindings: hwmon: sl28cpld: add sa67mcu compatible"

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 -
 .../embedded-controller/kontron,sl28cpld.yaml |    7 +-
 .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 -
 .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
 .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
 Documentation/hwmon/index.rst                 |    1 -
 Documentation/hwmon/sa67.rst                  |   41 -
 MAINTAINERS                                   |    1 -
 arch/arm64/boot/dts/ti/Makefile               |   13 -
 .../dts/ti/k3-am67a-kontron-sa67-ads2.dtso    |  146 ---
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 -----------------
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 -
 .../dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 -
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 -
 arch/arm64/configs/defconfig                  |    1 -
 drivers/hwmon/Kconfig                         |   10 -
 drivers/hwmon/Makefile                        |    1 -
 drivers/hwmon/sa67mcu-hwmon.c                 |  161 ---
 18 files changed, 3 insertions(+), 1604 deletions(-)
 delete mode 100644 Documentation/hwmon/sa67.rst
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
 delete mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
 delete mode 100644 drivers/hwmon/sa67mcu-hwmon.c

-- 
2.47.3


