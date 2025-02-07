Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B85C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e2+AE/2LJAYye9HkKHifG+tBEn1kiEbNgM5Be/SBU0Y=; b=FLjGXuQcUbtCErHNRuidRy7WWA
	Y+WjdBlpMj/m3z+iZoDREefQ8nT13lRnASdIRGB5cHnnSGHA/f8t/2Gk0Gzx0u6CWoMF0iKH/1+DA
	2JOOfzA9sN76IvNeTR5ZBj4oi+hzfMsUlHuTkv8C8ebDf7mZ89w1G7fnClm5Glt5z6JdLgOg+YO2W
	XcKhvVTHpoRjCOEqR3lHjGOruKT8oYhhdYxRUq7bUotYN6nC4HCZ8P4kPxnGcmK4HC7kRP9QFoVq6
	P9Gd2h8mbJcqJQro8h5qtVnjrZVCOQrH/C3KGMpa+G9EMT8GmF3swl+dakvCibyL8UbKfjXCQ2ylB
	76/IgS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJsR-00000008qbA-0TjI;
	Fri, 07 Feb 2025 08:38:19 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgJr1-00000008qEz-1lwC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 08:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1738917412; x=1770453412;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=e2+AE/2LJAYye9HkKHifG+tBEn1kiEbNgM5Be/SBU0Y=;
  b=DvLiedO6UEmPWOac+atZ6ZTukiRUj2eV7t+gT0PnC2kE8oe4/UojDphk
   cBZNgoQPWCTsxOIItawv22xaDm9oYppoYSG2rTtOUzAqbWL4KiNjkKiSn
   g+NHPpcSglruEAYozwpvS/KBU1TaTE8TV1QoltJ9barfaJnfqAKi/TBUM
   dTXt64p46pgvKtBVZRyAHtFAk/3kETsCQ/PK9CHxItIobi981oAz1C0ZC
   b0rcffVT+SQ3a7H/HAvaV3eGjHzbKtoEt04k53YbkfIH+rg7WmqszJm8U
   bepBOR2Cp1SFgtIYsh8MqYB0CEM8TIE2GfizvONfyZpNgcP7mE+jjpw+j
   A==;
X-CSE-ConnectionGUID: av5eSYpcTbOPWv03T6b2pQ==
X-CSE-MsgGUID: 3BW5DVBDRlKWS9YBHJwkog==
X-IronPort-AV: E=Sophos;i="6.13,266,1732575600"; 
   d="scan'208";a="41636068"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Feb 2025 09:36:25 +0100
X-CheckPoint: {67A5C608-2E-2D67083E-CAF60585}
X-MAIL-CPID: 986F74BA90AE23D311AA173614DDDFF0_0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11841167AAD;
	Fri,  7 Feb 2025 09:36:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1738917380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e2+AE/2LJAYye9HkKHifG+tBEn1kiEbNgM5Be/SBU0Y=;
	b=Sq5bQilYhtLsl41kYmMh+fxhdDs43vuoSiecvSFOK6itUhRXpRpxAyac9Gm2cdrt4ZhcSf
	ynrbwFbxxgJje0dyPiRtbGdsk4LQTiEqXBqtbSp6Wn3/dajwQ3/MVTb3uzVySAxNiR8C3w
	KKTpxw+7m0ZIAty2oXy0gOJFPh+pY4DIKYbC4UkOPBEsHFFWcPJglqQghkPJcT+7ehBKy6
	QlP7pplYMPNKypCF3oSslFKjN9RXiZ5weE2QOVo87ICRfU1HkQju8s3s1jzcTy57l7gery
	kctGmaSw2DegfQaLcXQJlHv+EuOtSs/EUcAPgA46rLk6DBvv0PoXunPMTSJ1Nw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] Make i.MX8M OCOTP work as accessing controller
Date: Fri,  7 Feb 2025 09:36:05 +0100
Message-Id: <20250207083616.1442887-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_003651_957885_0EFDE0C0 
X-CRM114-Status: GOOD (  12.63  )
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

Hi,

inspired by [1] this adds the accessing controller feature to i.MX8M.
The OCOTP eFuse has bits which can disable particular peripherals, such as
GPU, MIPI-DSI oder USB.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

I successfully used this on a i.MX8M Nano DualLite which has GPU disabled.
Without this patchset the default DT completly freezes the SoC if GPU
is accessed.
Using this patchset the GPU is disabled without any DT modification from
bootloader:
> imx_ocotp 30350000.efuse: /soc@0/gpu@38000000: disabled by fuse, device driver will not be probed

Changes in v2:
* Encode all addresses and bit offsets into DT directly
  This eliminates the need for platform specific code in imx-ocotp
* Added support for imx8mm, imx8mp and imx8mq as well

Best regards,
Alexander

[1] https://lore.kernel.org/all/20250204-imx-ocotp-v8-0-01be4a4bb045@nxp.com/

Alexander Stein (10):
  nvmem: imx-ocotp: Sort header alphabetically
  nvmem: imx-ocotp: Support accessing controller for i.MX8M
  arm64: dts: imx8mn: Add i.MX8M Nano OCOTP disable fuse definitions
  arm64: dts: imx8mn: Add access-controller references
  arm64: dts: imx8mp: Add i.MX8M Plus OCOTP disable fuse definitions
  arm64: dts: imx8mp: Add access-controller references
  arm64: dts: imx8mm: Add i.MX8M Mini OCOTP disable fuse definitions
  arm64: dts: imx8mm: Add access-controller references
  arm64: dts: imx8mq: Add i.MX8M OCOTP disable fuse definitions
  arm64: dts: imx8mq: Add access-controller references

 arch/arm64/boot/dts/freescale/imx8mm-ocotp.h | 31 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi    | 13 ++++
 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h | 26 +++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi    |  8 +++
 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h | 42 +++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi    | 26 +++++++
 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h | 37 ++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    | 15 ++++
 drivers/nvmem/Kconfig                        |  3 +
 drivers/nvmem/imx-ocotp.c                    | 76 +++++++++++++++++++-
 10 files changed, 275 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-ocotp.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-ocotp.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ocotp.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-ocotp.h

-- 
2.34.1


