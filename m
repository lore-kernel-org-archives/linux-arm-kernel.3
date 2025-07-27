Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0FBC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ld6XcFo2nFClhnmI2e8dmSx4ODmTEkT33YgLtXkJqxQ=; b=vZ5fPvUOsW8/o/VDeO3hv0fg6O
	Ud1Bf14UO61byqsCsxBFJMYnWodTqwCoD9Lu6vY5ROg75AL3Fdw5ylExh9KFvW0Vx6H4Xmbf1XHHL
	ionGV29GOyq0v4P+DVCr+ZPRoMTAk49k17QmEtGSY3wc5jYoknqr/Pzy+J1CudK+vBg5+rMwTHb6O
	RbNeJh7cEf9e4h/WVlywl9NKOdeUfL6toKt4zBwV818u7kFMyImOH7JQUmJVvBMhEqGulQ0aPlwuH
	2pvYPFJfRes4NUym4uxCv3zhDNoRyWsRH/BQw7YvzQltyp9WHESZ+TragyDH75OFcAssAY4dQEPBo
	Wr7yjIkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufyj9-0000000CcP4-2WHH;
	Sun, 27 Jul 2025 10:35:35 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufyCx-0000000CZhu-19wd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 10:02:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 330EE1038C12B;
	Sun, 27 Jul 2025 12:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753610537; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ld6XcFo2nFClhnmI2e8dmSx4ODmTEkT33YgLtXkJqxQ=;
	b=E9VDOzStwgb7sWdjjQdQzC/V5MsiTTxYsz54RdAD+Nm33qiSgSSceX60eFYu0Bo/Zv08o8
	F25QRq5w0DYgIpx8KSbnZr7u1N534AYsmC+Bl8k6Wu0Onj1ylwH0FgSVkkdYMTsILyj31H
	XZoMKm+kv3HfG9Qfma5YrLlcuBCIxVnm9uOJYyVLEg+RiwnSJ5Npm3CN5JkxLrW73zRKr+
	2zj4XaT4qBTVtV0b3eGkRriqtEYKG0+JdVlhKyqKi9BWbQopVLKb84OeOJjjd1f4QHIHbw
	23ZvaUumYo/kQz0CGIUEEaM3+/0/OCz+J/lFS8z8nnSCCZkvU1Ee/7bkxp9V5A==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>
Subject: [net-next v17 12/12] ARM: mxs_defconfig: Enable CONFIG_FEC_MTIP_L2SW to support MTIP L2 switch
Date: Sun, 27 Jul 2025 12:01:28 +0200
Message-Id: <20250727100128.1411514-13-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250727100128.1411514-1-lukma@denx.de>
References: <20250727100128.1411514-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_030219_457674_9697E6D9 
X-CRM114-Status: GOOD (  10.31  )
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

This patch enables support for More Than IP L2 switch available on some
imx28[7] devices.

Moreover, it also enables CONFIG_SWITCHDEV and CONFIG_BRIDGE required
by this driver for correct operation.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
Changes for v4:
- New patch

Changes for v5:
- Apply this patch on top of patch, which updates mxs_defconfig to
  v6.15-rc1
- Add more verbose commit message with explanation why SWITCHDEV and
  BRIDGE must be enabled as well

Changes for v6 - v17:
- None
---
 arch/arm/configs/mxs_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index b1a31cb914c8..ef4556222274 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -34,6 +34,8 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
+CONFIG_BRIDGE=y
+CONFIG_NET_SWITCHDEV=y
 CONFIG_CAN=m
 # CONFIG_WIRELESS is not set
 CONFIG_DEVTMPFS=y
@@ -52,6 +54,7 @@ CONFIG_EEPROM_AT24=y
 CONFIG_SCSI=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
+CONFIG_FEC_MTIP_L2SW=y
 CONFIG_ENC28J60=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
-- 
2.39.5


