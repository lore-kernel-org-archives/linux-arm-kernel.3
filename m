Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A9AC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Pf/nkqA0SULv06cZ0E+jJZ7O5patIvpCkeSbwI2yaY=; b=T4vmW4pJd9mYcZMY4ZadTaX2q2
	CKGVUHqej1b1BcVb4dsx2Qx36H4FcYoTHDu1aPMPUknpn3rxWGLLtle/RdLZ7SONRnA0j+cjEsLND
	UrYi33xpezvqHGx0QoUwu5WycLeZMT+gTbllckuIlLoU1QJRXluXzx1+GjTbzirA9zaLKOol2JqQV
	Z20a+uoUNt+tQELZ7JVBhxg2c6efzG/Xn1fRpV3LzOM7uYm7cuYmjv8sX3aE9x0Y6JrT+b2RZy31g
	GIRYlimHboRvd2RNRWDHK9VmQIPBrySiNkFGTVF7EMQmpt2ecWziffId+bLhKPH2W9u9nv0CkCcCe
	LngBBSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA01F-0000000Bl57-0Ag1;
	Wed, 30 Apr 2025 05:30:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zqS-0000000Bjb3-314Y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 05:18:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4Pf/nkqA0SULv06cZ0E+jJZ7O5patIvpCkeSbwI2yaY=; b=mprmh7C8jKPSP+gEUjGQv3ivMd
	YaOmBOk9dsCIuAHQUlnALYkCqrk34Fabc6Un+QAhAHIsdV0y9d5O8qzx9nVKq04psd9DCgVfgY4f7
	G8RVhrtRcByujVym30lD9PgJ2YagFoSkjke2xyR6vZ2LAbBBng49nqRoILPqyNJ+5MzkpR6LouTBV
	DSR9G7jevEMkOAhavQCtxa6k7ZDkRqrIJ7TjMVM/ViFZXYWCmvWX97/2vQB8C/39THb5hipyYpVv0
	x+vtKwwQG2hLyskw0S97KHRDc2+z6mgHGgoEQ4tKQNscpSGc3Vym/OLO4teG+hh+jvs3pWsHKD+I8
	nvZF4NhQ==;
Received: from mx.denx.de ([89.58.32.78])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9zqE-0000000Dh4L-2EBx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:18:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA49310269590;
	Wed, 30 Apr 2025 07:18:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1745990318; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=4Pf/nkqA0SULv06cZ0E+jJZ7O5patIvpCkeSbwI2yaY=;
	b=LQWQTiLouaOojUD+6bj/4JKim7kkNm+q133XFFLc9DEZd6lRYDEzi0cMImb+c9KvL5b5S4
	hsFsjN6AxGSKzDBSOwKa3oHwRaaxV4+q6KdexNPI7efWHmVrsBW1/0hyVdVgejKrRnxVbL
	sWXflrOQJO6g2pc8EtNVVrUNjO9YbiObGuJsjL8gQQ+ktQ2FZ4mEDVOU1HAosEIp4QjKqC
	Xonr7KZSkLdL91qroLIVOc2I/krqNwQ5EfQQuZUqz1WHzeESvmjQsp0IaTGQTz1hazjou5
	0VbQibsyKX6JtLj7ZN6ySIAnHDoXXSnnElfMuLfCIppULpWNB62rdpUdNcIbnw==
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
Subject: [net-next v9 7/7] ARM: mxs_defconfig: Enable CONFIG_FEC_MTIP_L2SW to support MTIP L2 switch
Date: Wed, 30 Apr 2025 07:17:56 +0200
Message-Id: <20250430051756.574067-8-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430051756.574067-1-lukma@denx.de>
References: <20250430051756.574067-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_061844_960470_BD3873BB 
X-CRM114-Status: GOOD (  10.41  )
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

Changes for v6:
- None

Changes for v7:
- None

Changes for v8:
- None

Changes for v9:
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


