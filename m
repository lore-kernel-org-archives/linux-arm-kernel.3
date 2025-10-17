Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA59CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DPp39CzxY3xVbftJ6LvbRo6CHIhqOpMT1xq6qQ/KbNs=; b=H2PH6orT+tXkoxN6I+avGcdNf8
	50bNTcwPL7d1fwhav0zQodPld/gy+y2/Gxl59qbPqJkz5av+Tb1jbb3Ztq7/LZ6Tv6rWYoiU8FOBc
	tZm2Ran2uSCf/j6Iq/YHl2fcPLbnczaprr2lSrZ8m90Ft8yI3VV1pkHlotNNYh4uHHh7GAh2ZsGdh
	q4PQHbmq9JpUZoojy0raot+CBqjKiSME66kWN9uZoHauHgeFEoJ1Lf2ohQeXZK2ujrwsk/hrmdcsZ
	7mNk6xjPLAK+K6z1Dq9ejfKUbIUA25E+JpVHhs+YsDIvSnU2unWrnBynrJhB4u3yriX/76GMTTYhx
	PR+is+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9krk-00000007zRb-3Tgc;
	Fri, 17 Oct 2025 13:51:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9kri-00000007zRE-0QYB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 13:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C501F45862;
	Fri, 17 Oct 2025 13:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 772FEC4CEE7;
	Fri, 17 Oct 2025 13:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760709089;
	bh=gV7eznlDj3fQJt34KPs+aNCRbI0Wc21YzA0aXkfJlHA=;
	h=From:To:Cc:Subject:Date:From;
	b=ahHXrnoSlHByNTzVCDZi2+lVU4PxrOCF6kJhkn42gdcT+A31a8zGDHDfPrcNSkk6O
	 HqcO7g1pH8EDT13MtkGgkwaV3/8brte2L12cEHTuYo1iD4DQ41ft3f1o0nBA4qbIF3
	 hVsq2h6dZPP1W1NVL9GWLAen7VyVnVffvSDfHy6VYvKkR6bWO+MFD5351mx+8ItlsD
	 o1WTRO4t46qDKP5v6FtizmtlbOWEq08cJ3cRhb6nYxmUZTZTr+BTQMaZkeZdS6tsnC
	 CRm99FQRZvu2cFeQs7KCuZVlONvyG0cMTcYLISkGUVU1mQCvBzXPC0O+CcP1LEi3oI
	 zJiuKVNp09EMA==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v3 0/3] Initial Kontron SMARC-sAM67 support
Date: Fri, 17 Oct 2025 15:50:43 +0200
Message-ID: <20251017135116.548236-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_065130_182222_B0666213 
X-CRM114-Status: GOOD (  15.81  )
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

This series contains the remaining (device tree) patches for the
Kontron SMARC-sAM67 module.

v3:
 - dropped all patches which were already applied
 - add 'bootph-all' to the usb ctrl node to support DFU boot
 - as all MFD bits are now merged, combine the patch which added the
   system controller node into the main one again
 - drop duplicate RTC node. This one was a left over before the rtc
   node moved into it's own overlay
 - add a new overlay for the Kontron SMARC 2.2 evaluation carrier
 - add a new SMARC gpio overlay to configure the pinmux correct.
   This is not integrated into the default device tree because it
   will conflict with any device tree which will use the pins for
   different purposes (they are multi function pins)

v2:
 - dropped patches which were already picked up
 - new patch "dt-bindings: mfd: tps6594: allow gpio-line-names"
 - separate driver for the hwmon, add missing hwmon documentation,
   thanks Guenter
 - split the DT as suggested by the SoC maintainers
 - add missing copyright and license to the overlays, thanks Andrew

Michael Walle (3):
  dt-bindings: arm: ti: Add Kontron SMARC-sAM67 module
  arm64: dts: ti: Add support for Kontron SMARC-sAM67
  arm64: dts: ti: sa67: add overlay for the ADS2 carrier

 .../devicetree/bindings/arm/ti/k3.yaml        |    1 +
 arch/arm64/boot/dts/ti/Makefile               |   10 +
 .../dts/ti/k3-am67a-kontron-sa67-ads2.dtso    |  146 +++
 .../dts/ti/k3-am67a-kontron-sa67-base.dts     | 1091 +++++++++++++++++
 .../dts/ti/k3-am67a-kontron-sa67-gbe1.dtso    |   26 +
 .../dts/ti/k3-am67a-kontron-sa67-gpios.dtso   |   61 +
 .../ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso  |   31 +
 7 files changed, 1366 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-ads2.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gbe1.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-gpios.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-rtc-rv8263.dtso

-- 
2.47.3


