Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499B8CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C5H0rm+xLCVucwlzvQE4adec9tRcirMaUW8kXlCmwbc=; b=2Is6euAeZTrkzIiUnLHpO1EjtP
	hfJU5F3Wlb0nnt+5+2OegQX6vFSiKYB5JqjGM6B9vS96UrCl2kde3479k2xIiSQQkKtc/68jOelu6
	MInLXbFZoQ9j4EJxdUOBUG4U+XqPhsqalpoG3mASn51HAu/yjQ1TgkgqnkcSc9x7WpKg4pmr0/6Ds
	LlnS111XyOcD+W506EfOuVrgqST4Ap/jj2XFHqJ9SLdAGRgDt9aT/10detSJ5hrG2mW0CE8Nec/yM
	sKsh/ofjAhuWrnxbrGFweGbS2DZWSntAvJMhXzV+ek82Lyz7nT+s60uh+pexDyCtrTGoe493s8CMY
	caVJQR8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphm0-00000003zBF-2lFZ;
	Sat, 23 Aug 2025 06:30:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRcQ-00000002ayU-4AOi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:15:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 51AB960268;
	Fri, 22 Aug 2025 13:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8702C4CEED;
	Fri, 22 Aug 2025 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755868546;
	bh=QM3gjLdrNdwQPyENWkbDDxd/9VE9sssykatbfX7JD+I=;
	h=From:To:Cc:Subject:Date:From;
	b=Q3vb/9bRAAfrzjQZl6sT867unT/MdR+1UvalIDRdaHZHoo+itisutypbRuzKVvP21
	 5BxuWWfnwZFtsk0ZtvDJ8ot4xBqP0lfO6dIKZYoAD/Tk6rNuzkGKhTWPf1WJ/TwFHl
	 IPXYunMUsxtKnA8fQbxJ4leIu9TvhjFAAUErMPOPKhkOWmtH1LedAlW+/xKPNUd6k0
	 9xIn1ThPiROt9D9w9V/Gkg4Nv2StW8Vq70/bGvm3YNGxgjIIXGaPfXJFhGKKztcsUt
	 kVlXekwq1IXGFJk0Q9pqgkHXszSoT5O1VH+KuXLYNDRIE0bWwzgXPtfqETUkStfjXw
	 ZfbeBIZ4uHX5w==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1 0/7] Initial Kontron SMARC-sAM67 support
Date: Fri, 22 Aug 2025 15:15:24 +0200
Message-Id: <20250822131531.1366437-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
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

Now that the PMIC support is there, we can finally, upstream the
support for this board. Besides the usual device tree, this
patchset contains the support for the on-board house keeping MCU. It
make extensive reuse of the drivers for the former SMARC-sAL28
board. Besides different hwmon sensors, all the dt binding patches
will just add a board specific compatible (in addition to the old
sl28 compatible) to make any future board specific quirks possible.

I'm aware that there is a patch [1] which moves the sl28cpld MFD
schema to a different directory. Once that patch is merged, I'll
repost this series. But I already want to get some early feedback.

[1] https://lore.kernel.org/r/20250822075712.27314-2-krzysztof.kozlowski@linaro.org/

Michael Walle (7):
  dt-bindings: arm: ti: Add bindings for Kontron SMARC-sAM67 module
  dt-bindings: mfd: sl28cpld: add sa67mcu compatible
  dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
  dt-bindings: watchdog: add SMARC-sAM67 support
  dt-bindings: nvmem: sl28cpld: add sa67mcu compatible
  hwmon: sl28cpld: add SMARC-sAM67 support
  arm64: dts: ti: Add support for Kontron SMARC-sAM67

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
 .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 +
 .../bindings/mfd/kontron,sl28cpld.yaml        |    7 +-
 .../nvmem/layouts/kontron,sl28-vpd.yaml       |    7 +-
 .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
 arch/arm64/boot/dts/ti/Makefile               |    6 +
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1092 +++++++++++++++++
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   19 +
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   24 +
 drivers/hwmon/sl28cpld-hwmon.c                |   76 +-
 10 files changed, 1234 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso

-- 
2.39.5


