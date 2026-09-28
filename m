Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82141CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 14:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nTxf3g7MHfc46jtOlfQr/x3upd+z4/f4dUMPgxfxrHk=; b=tL0KVStVq44bk5sm37BZ6wb6iX
	uWkxxmZyMD4EEueL95aVepJopjq7cxG1qrG1STHmnoCT75U2sp5J5iKG9Nq8sD5i8wC45P9RVK7dY
	RFArqN4i9My1BxYyA9WJRcf+d90B6C9Euy8OmWVAXak+AhPIcc0A4zNbnrX8X3+ssB1x0SNpNbghE
	ne8qN3WMUSfxQJDGOUttlLRKjMFaWLcSqfy1JRYuVEJ8hwMoDiZorQPBd7ORvIZlLnWsiFwFrAXyR
	o58/dl0UPRKsHgkaGu5AZlKLNAjghbffhgqLbcjzZEL+l+rAZPmQDpE+XAH1OwSwmbgZ+SGruDOfs
	F6VTKXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCiH-00000000p9o-2XUn;
	Mon, 28 Sep 2026 14:52:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCiG-00000000p9b-10Ib;
	Mon, 28 Sep 2026 14:52:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A199341363;
	Mon, 28 Sep 2026 14:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E201F000FF;
	Mon, 28 Sep 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790607135;
	bh=nTxf3g7MHfc46jtOlfQr/x3upd+z4/f4dUMPgxfxrHk=;
	h=From:To:Cc:Subject:Date;
	b=LP/RlWEYCcno73BsmdUCQ3MYvg9M5gY+QItkF6nEzp9DJgDTRP9s2iUvqDBaX9kcd
	 4EoSagQq2MiWMgiyQNdG30Llr4nwZRM5zEwiDKZmB5k5M36xeq8CMig5C/rSr/9cjl
	 /FKE/Fe/I4zBoiaqPeB3pFMiEWRwaIRR1JMReCwxyB9SRlyf77EHfWjAGw4qPctrwy
	 y1qGCGYO/kB8hDgmnTmWD32H4BtcLs27d1kvBMFkOER5zGsWfawOpuZAInXJGC6fmp
	 KEV77oNs0fGGmtzZjUq5QvP7M5Ip/hWhZGnj4QRL1ei89TIuE9rS0/3wP/xlc07AIj
	 AepHjXkeD5vwA==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7996: add NET_AIROHA dependency
Date: Mon, 28 Sep 2026 16:51:44 +0200
Message-ID: <20260928145210.3153783-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
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

From: Arnd Bergmann <arnd@arndb.de>

MT7996E fails to link as build-in when NET_AIROHA=m:

WARNING: unmet direct dependencies detected for MT76_NPU
  Depends on [m]: NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_MEDIATEK [=y] && (NET_AIROHA_NPU [=y]=y [=y] || MT76_CORE [=y]=NET_AIROHA_NPU [=y]) && (NET_AIROHA [=m] || !NET_AIROHA [=m])
  Selected by [y]:
  - MT7996_NPU [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_MEDIATEK [=y] && MT7996E [=y] && (NET_AIROHA_NPU [=y]=y [=y] || MT76_CORE [=y]=NET_AIROHA_NPU [=y])
arm-linux-gnueabi-ld: drivers/net/wireless/mediatek/mt76/npu.o: in function `mt76_npu_init':
npu.c:(.text.mt76_npu_init+0x4c): undefined reference to `airoha_ppe_get_dev'
arm-linux-gnueabi-ld: npu.c:(.text.mt76_npu_init+0xf8): undefined reference to `airoha_ppe_put_dev'

Add another dependency to prevent this configuration, with an explicit
special case to allow the NPU to be used while the PPE code is stubbed
out with NET_AIROHA=n.

Fixes: 377aa17d2aed ("wifi: mt76: mt7996: Add NPU offload support to MT7996 driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I am not sure what the use case is for using only the NPU but not
the PPE code, and it would be good to add a comment near the
dependency to clarify this, or possibly skip the complexity and
just make it a hard dependency.
---
 drivers/net/wireless/mediatek/mt76/Kconfig        | 1 +
 drivers/net/wireless/mediatek/mt76/mt7996/Kconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
index 2ca96e0527c0..a4ece38f938d 100644
--- a/drivers/net/wireless/mediatek/mt76/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/Kconfig
@@ -40,6 +40,7 @@ config MT792x_USB
 config MT76_NPU
 	tristate
 	depends on NET_AIROHA_NPU=y || MT76_CORE=NET_AIROHA_NPU
+	depends on NET_AIROHA=y || NET_AIROHA=n || MT76_CORE=NET_AIROHA
 
 source "drivers/net/wireless/mediatek/mt76/mt76x0/Kconfig"
 source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
index 5742bce12fbb..3c51b402f44e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/Kconfig
@@ -17,5 +17,6 @@ config MT7996_NPU
 	bool "MT7996 (PCIe) NPU support"
 	depends on MT7996E
 	depends on NET_AIROHA_NPU=y || MT76_CORE=NET_AIROHA_NPU
+	depends on NET_AIROHA=y || NET_AIROHA=n || MT76_CORE=NET_AIROHA
 	select MT76_NPU
 	default n
-- 
2.53.0


