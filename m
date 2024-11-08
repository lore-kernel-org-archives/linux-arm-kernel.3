Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBE1D5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gkWYTfXRRhzmK8RFIzAG6O4Dq5zKISXppIUGrWAYD10=; b=iC5dCgApzTGO6mbtKCWZ3cYAtJ
	K0Bg1++px55YxNMm4IQ8iH7GuIUcySEKcZvBMMu+sbow5quffHHOmrr7VwUPsQX0Pf7zV/ZXNHZdC
	PssC+6fJCWp0kQ88Ypg7LX1nokVMut7/s1oqeaa9EPsAoxRLsae0X7iiFr5mxXQfzAHxqzat2cHcY
	SLf8Xswvjy4Nlv33aS38nsGzVMiaA2znr1GsX0rsVyJk7DnSu+aPX6TCkoeKT7yjdP8UTeEkD1xVU
	kP0OfiOnSKne6Ocz2rNift9vezRcsrAPwVoUvtv2jccpxpS6IdQOVxmu5qZ0XKQh6CBGq9BpJktiB
	KKaJmumQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PXC-0000000Ambc-1Amv;
	Fri, 08 Nov 2024 14:00:22 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PMt-0000000AkT9-1Qz7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1731073783; x=1762609783;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gkWYTfXRRhzmK8RFIzAG6O4Dq5zKISXppIUGrWAYD10=;
  b=mvcuK+IJqg34AkbJqv4ABZ7rMYBx9iZgTnH0e7Dmx0GLN9o4PTYj06lP
   Fm7IyA8BXT7pQzQBanV45e9V1noxHyZGJu3RVmtonnxD1+73hfWijCGE1
   Ro9bLY8MHqCWhVBqA32AKfntMJ297E5oYisHQ29SzeNmX64e4tRpFTipX
   tx4Kgp9WgGUBJob1eLQt0XewWHv5lptO4vGts1ZtjpgqyV9d3HgGSOCFh
   Mx6dndQBVI1gY/aNUk3iStakgibxyV4W4mJpN5+bY3uY65BrMqp5H4AKT
   VjipJJpwCn90iwWa4cxN2ctWfO8yqGzEav8LPTmOLwfQIsJJ0icbiyG/t
   g==;
X-CSE-ConnectionGUID: kPpOHN7XRV2mGjpacNXANw==
X-CSE-MsgGUID: b5F5u3CQQmyGDjidvJU17A==
X-IronPort-AV: E=Sophos;i="6.12,138,1728943200"; 
   d="scan'208";a="39936918"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Nov 2024 14:49:37 +0100
X-CheckPoint: {672E16F1-4-1E10F2A5-CC0651E5}
X-MAIL-CPID: 1A141D1EC8B3A62498EA708BCD2F09ED_4
X-Control-Analysis: str=0001.0A682F26.672E16F1.0059,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FFF816353B;
	Fri,  8 Nov 2024 14:49:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1731073772; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=gkWYTfXRRhzmK8RFIzAG6O4Dq5zKISXppIUGrWAYD10=;
	b=O2So4ga0Fu4lZ8N0e1q945ooBxI3SbaJ+fcSzUgkkvOFl+8YcFFSxjjpzzLvKCLZCkOzDu
	X9d+WK/L4CTM09e8iBpU4Gd+3ykVjE0VPS+QYzBzZxoYR2oBeP/JYLJs3EoIwStjNmN55B
	uyFkcdwDmwOuk383T7ZLAPkj9e2K9AUNspHIM9Hfy1O59rQKEpUzleXbFYKN9MXxpbw8cW
	6mbGWwWEYbNWBUuFq2kqO2yZrodnZ1eebmcitTc1FiS+8a+v0BiPzQ7cU7RvfZ2ZLfoVPk
	WGMqhbeL0b8QRSLm4siNzrb3NIzzFB6laT5d52QvF1Ib1mT57q8tB/z32l+Oew==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?UTF-8?q?Jo=C3=A3o=20Rodrigues?= <jrodrigues@ubimet.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] TQMa7x DT cleanup
Date: Fri,  8 Nov 2024 14:49:18 +0100
Message-Id: <20241108134926.1324626-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054944_438378_BF464A84 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
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

Hi all,

this series fixes some DT binding check warnings as well as removing
duplicated nodes. Eventually IRQ support for thernet PHYs was added.
Additionally add CONFIG_JC42 to imx_v6_v7_defconfig.

Best regards,
Alexander

Alexander Stein (8):
  ARM: dts: imx7-mba7: remove LVDS transmitter regulator
  ARM: dts: imx7-tqma7: Remove superfluous status="okay" property
  ARM: dts: imx7-tqma7: add missing vs-supply for LM75A (rev. 01xxx)
  ARM: dts: imx7-mba7: Add 3.3V and 5.0V regulators
  ARM: dts: imx7-mba7: Fix SD card vmmc-supply
  ARM: dts: imx7-mba7: Remove duplicated power supply
  ARM: dts: imx7[d]-mba7: add Ethernet PHY IRQ support
  ARM: imx_v6_v7_defconfig: enable JC42 for TQMa7x

 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 61 +++++++----------------
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi |  3 +-
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts  |  3 +-
 arch/arm/configs/imx_v6_v7_defconfig      |  1 +
 4 files changed, 21 insertions(+), 47 deletions(-)

-- 
2.34.1


