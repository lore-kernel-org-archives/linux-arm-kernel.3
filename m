Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CCAC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 08:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCojgqJD5RNVsuSKlWQXeXlsHX7xNPh0TCkFmdSQ7Cg=; b=lh4qh4V3RtUVhMM0QdKatJegL5
	nf789buGNoLE2aYtfu94VAkRa/UtRBH3/cKH6Q/KhAf2udIrBDQZaFxq89vinN2q0XdSU8ZDILoLx
	qiZBoNJdiDR6O7vuzBHVxJD396VKaqh9w2UiHb7j5ePHFLxdLNB6NDM3qe3UFoPkerGZxD9OVm/iX
	VkFOsBS0PrsxuWrfMXO/MPWiEiJzD+nK4M8wSPrCAcK5IPXG+OGPiYojJ6M6oQb6lGQDs9QXqHSx8
	qRyLwBgCYHXalSAaDA3C4zzjAZi9I65CGZGXchu4Kk/gu9NeBxnsxnaFo134aVXaIDx4h5ti7YuIX
	oLLJd+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VHG-00000009fz2-1Zvl;
	Wed, 23 Apr 2025 08:16:18 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UYL-00000009WPM-2vcz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:29:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7705102A4BE8;
	Wed, 23 Apr 2025 09:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1745393392; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=eCojgqJD5RNVsuSKlWQXeXlsHX7xNPh0TCkFmdSQ7Cg=;
	b=fVwAVkf6KZ9UfQzmYbTUImgLTygtLG0TWeWjCKbdonsR/ELbFCMD9kz5wZUxGZzcTneumf
	hxbv9i/HyEsh1NcJPuDjOe9XrrNUgnIsADQlmj9bzNCDApCNW3yEjd6MesxYXUT9eBdhDN
	Yy1kUWZLuAJlY7SEj1cRWSwROAdMmOTgzwknDeZj6mAr//VkIJQO2bMJcbo3Lz0LqgV2ff
	s0aBsJFqHQlm9Gr/TLTT6Oa4bxblVb+TqO/1OI4N/jq4Ud3qIzgBd6ZMFCmppTnQFiNOAS
	gv1tq5hkYWjy+xNdE8k6vhu0NseiKyE8+kPeLf1MTUHknT0mebrdIoUCC1Oq2A==
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
Subject: [net-next v7 7/7] ARM: mxs_defconfig: Enable CONFIG_FEC_MTIP_L2SW to support MTIP L2 switch
Date: Wed, 23 Apr 2025 09:29:11 +0200
Message-Id: <20250423072911.3513073-8-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423072911.3513073-1-lukma@denx.de>
References: <20250423072911.3513073-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_002953_878271_5F1A30EA 
X-CRM114-Status: GOOD (  10.06  )
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


