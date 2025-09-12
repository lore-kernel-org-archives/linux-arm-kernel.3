Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4AFCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uyd47bBGlb81TIx58uZxfLBkgobx+X8dUQ3HzEd7g0U=; b=pcn/gIucuVq1adG1/cgTUIgkGl
	Q0tFLrALBRapg5ANAHcxmuRk++jHGlH71WTFINuRp06omFcs9dTL1K+NBs+Lk0NYnx6iMHoslywSA
	H/ogPw92rC4vlXXyEbSVxb6J2z6I3IVYbto2BTXFGGRrj+axTLYf38qWKdb3vNbm4Qy3PiJx5l3xW
	KdD3LB0Cu0JclpQRMdF1uduov2og+WEogB78B0t/2cVlzykt6AK0g69sfagY10f+vWws5LxrFmOZM
	ZG09v7SXNI/SOxiO5pulPtVRjaBDATf0zh/bwfVOTA1IHXojdXBHFERJtuVDdURHylgiZc9obZpdV
	LgiGXSTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2ZV-000000096bo-2gWA;
	Fri, 12 Sep 2025 12:08:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2ZT-000000096aK-1dzj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:08:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B947644841;
	Fri, 12 Sep 2025 12:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60C92C4CEF1;
	Fri, 12 Sep 2025 12:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678886;
	bh=wJwOnYjjBM2ff4ferRQlzqp+j9TiO4Bd0Gj/yWI3ikg=;
	h=From:To:Cc:Subject:Date:From;
	b=Iv9ihUa9xREJ4gWjwJcF5xr1lwQt/bJPmEEaxFZsTJaec8mXvhsuFxHar1Pvdn0L1
	 62/2z+PMzdTRxSbqob75l56WjpDK07la2JA0t18sfigTv0c86yeptCnvhcG7iany0c
	 +b9LP/B1kJiu8wCk9UFqzg1NQoL8NQz4wJEkQvnT1wDvnNziwh7XwJED/pil8dvqMc
	 4GkLSxCbqOAhIQODcE+8q+k95jO/8D25n5sge4tSDI19mz2D3w+3XYnrTsee82mP5y
	 tdkr2Tsm7Aio5UeU84EUkmL4Fu+43KOB9Z3+554Eua04Foh0JnuXDh253qrVtmlhcU
	 8taeb58Gbix0A==
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
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>
Subject: [PATCH v2 0/7] Initial Kontron SMARC-sAM67 support
Date: Fri, 12 Sep 2025 14:07:38 +0200
Message-Id: <20250912120745.2295115-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_050807_481261_2B4BEDFD 
X-CRM114-Status: GOOD (  16.73  )
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

v2:
 - dropped patches which were already picked up
 - new patch "dt-bindings: mfd: tps6594: allow gpio-line-names"
 - separate driver for the hwmon, add missing hwmon documentation,
   thanks Guenter
 - split the DT as suggested by the SoC maintainers
 - add missing copyright and license to the overlays, thanks Andrew

Michael Walle (7):
  dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
  dt-bindings: mfd: tps6594: allow gpio-line-names
  arm64: dts: ti: Add support for Kontron SMARC-sAM67
  dt-bindings: hwmon: sl28cpld: add sa67mcu compatible
  dt-bindings: watchdog: add SMARC-sAM67 support
  hwmon: add SMARC-sAM67 support
  arm64: dts: ti: sa67: add on-board management controller node

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
 .../hwmon/kontron,sl28cpld-hwmon.yaml         |    1 +
 .../devicetree/bindings/mfd/ti,tps6594.yaml   |    1 +
 .../watchdog/kontron,sl28cpld-wdt.yaml        |    7 +-
 Documentation/hwmon/sa67.rst                  |   41 +
 MAINTAINERS                                   |    1 +
 arch/arm64/boot/dts/ti/Makefile               |    6 +
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 +++++++++++++++++
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 +
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 +
 drivers/hwmon/Kconfig                         |   10 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/sa67mcu-hwmon.c                 |  161 +++
 13 files changed, 1377 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/hwmon/sa67.rst
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso
 create mode 100644 drivers/hwmon/sa67mcu-hwmon.c

-- 
2.39.5


