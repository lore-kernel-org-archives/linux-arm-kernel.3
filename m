Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC52C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 12:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSY+UBE9kzGHPUbh5Y1nwA/QIwhXvgGkQmB5IgW7iD8=; b=UxcxsY/Fx9I3/XdY6NjF29Wq/9
	q8QNZVby/QbNBW0H64+JKk39R+YeDPla0BPF6Xgj7VCDWYvuGGK2DPjzStp0YtEB+BXskIotSUqJQ
	5upxQbeAgag0kxMqsPMI0CXGaGz441GRSXi6YE93FahuV3+LrV0BRz8SVj26NuQLPfmou1L13Twkp
	QK+bYjINzxeBIn7n5E0aE++HFd4OmJh3M3fottilOLViOLIVSPMZy//p7zZqLLQCPHKgyKbXx85Em
	ALn0M2dxc89kjCunGVT6xyaGfAVInE/lvbNua3IOr+Vkoqk+VjUwiToIZxauzuCgwl4GCPkAZk13e
	akM9NG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th6H2-0000000EpRM-2wIr;
	Sun, 09 Feb 2025 12:18:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th67r-0000000EnXl-0Klx;
	Sun, 09 Feb 2025 12:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE847A40231;
	Sun,  9 Feb 2025 12:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 892C8C4CEDD;
	Sun,  9 Feb 2025 12:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739102966;
	bh=IpkbnQD0aqV4zTrDQLNPfko65wJI87nBEI5JGdjdZk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mxMjloa7I7y5e0SMZhPng9MWFq0bSy+fl4AZ+7Pb6F/r7veUbSRbE5v76QwiL3I1y
	 tnqf/LuFj3rnHiU69+mBdZ0di9hDaI2jg1cnqh96IZmrarNvak3/qBscyWnTuq5c5w
	 RXCz+Ts/IjO1GX8r4NmblMiYaRdjKaaVTFYkAV9AEOe/vgibrnTkEI4OPSVwML7N4J
	 nhhV9CU4WYA8w15z8qbKt9MpW4E8lhiEet3uuaksv752mrM+KCQRpqcirRxpzk3uEt
	 rqaLPI7Bz9Uae21LpxMPs+t/EsrxU7rF2E7wKSEvk4IHo8Drz93NaxlcG2pfZT5pIZ
	 UO5a3TxSAprdw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 09 Feb 2025 13:08:55 +0100
Subject: [PATCH net-next v3 02/16] net: airoha: Move airoha_eth driver in a
 dedicated folder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-airoha-en7581-flowtable-offload-v3-2-dba60e755563@kernel.org>
References: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
In-Reply-To: <20250209-airoha-en7581-flowtable-offload-v3-0-dba60e755563@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 upstream@airoha.com
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_040927_241776_56202D14 
X-CRM114-Status: GOOD (  15.17  )
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

The airoha_eth driver has no codebase shared with mtk_eth_soc one.
Moreover, the upcoming features (flowtable hw offloading, PCS, ..) will
not reuse any code from MediaTek driver. Move the Airoha driver in a
dedicated folder.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/Kconfig                           |  2 ++
 drivers/net/ethernet/Makefile                          |  1 +
 drivers/net/ethernet/airoha/Kconfig                    | 18 ++++++++++++++++++
 drivers/net/ethernet/airoha/Makefile                   |  6 ++++++
 drivers/net/ethernet/{mediatek => airoha}/airoha_eth.c |  0
 drivers/net/ethernet/mediatek/Kconfig                  |  8 --------
 drivers/net/ethernet/mediatek/Makefile                 |  1 -
 7 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/Kconfig b/drivers/net/ethernet/Kconfig
index 977b42bc1e8c1e8804eb7fafa9ed85252d956cad..7941983d21e9e84cbd78241d5c1d48c95e50a8e4 100644
--- a/drivers/net/ethernet/Kconfig
+++ b/drivers/net/ethernet/Kconfig
@@ -20,6 +20,8 @@ source "drivers/net/ethernet/actions/Kconfig"
 source "drivers/net/ethernet/adaptec/Kconfig"
 source "drivers/net/ethernet/aeroflex/Kconfig"
 source "drivers/net/ethernet/agere/Kconfig"
+source "drivers/net/ethernet/airoha/Kconfig"
+source "drivers/net/ethernet/mellanox/Kconfig"
 source "drivers/net/ethernet/alacritech/Kconfig"
 source "drivers/net/ethernet/allwinner/Kconfig"
 source "drivers/net/ethernet/alteon/Kconfig"
diff --git a/drivers/net/ethernet/Makefile b/drivers/net/ethernet/Makefile
index 99fa180dedb80555e64b0fbcd7767044262cf432..67182339469a0d8337cc4e92aa51e498c615156d 100644
--- a/drivers/net/ethernet/Makefile
+++ b/drivers/net/ethernet/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_NET_VENDOR_ADAPTEC) += adaptec/
 obj-$(CONFIG_GRETH) += aeroflex/
 obj-$(CONFIG_NET_VENDOR_ADI) += adi/
 obj-$(CONFIG_NET_VENDOR_AGERE) += agere/
+obj-$(CONFIG_NET_VENDOR_AIROHA) += airoha/
 obj-$(CONFIG_NET_VENDOR_ALACRITECH) += alacritech/
 obj-$(CONFIG_NET_VENDOR_ALLWINNER) += allwinner/
 obj-$(CONFIG_NET_VENDOR_ALTEON) += alteon/
diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..b6a131845f13b23a12464cfc281e3abe5699389f
--- /dev/null
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+config NET_VENDOR_AIROHA
+	bool "Airoha devices"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	help
+	  If you have a Airoha SoC with ethernet, say Y.
+
+if NET_VENDOR_AIROHA
+
+config NET_AIROHA
+	tristate "Airoha SoC Gigabit Ethernet support"
+	depends on NET_DSA || !NET_DSA
+	select PAGE_POOL
+	help
+	  This driver supports the gigabit ethernet MACs in the
+	  Airoha SoC family.
+
+endif #NET_VENDOR_AIROHA
diff --git a/drivers/net/ethernet/airoha/Makefile b/drivers/net/ethernet/airoha/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..73a6f3680a4c4ce92ee785d83b905d76a63421df
--- /dev/null
+++ b/drivers/net/ethernet/airoha/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Airoha for the Mediatek SoCs built-in ethernet macs
+#
+
+obj-$(CONFIG_NET_AIROHA) += airoha_eth.o
diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
similarity index 100%
rename from drivers/net/ethernet/mediatek/airoha_eth.c
rename to drivers/net/ethernet/airoha/airoha_eth.c
diff --git a/drivers/net/ethernet/mediatek/Kconfig b/drivers/net/ethernet/mediatek/Kconfig
index 95c4405b7d7bee53b964243480a0c173b555da56..7bfd3f230ff50739b3fc6103cd5d0e57ab8f70e1 100644
--- a/drivers/net/ethernet/mediatek/Kconfig
+++ b/drivers/net/ethernet/mediatek/Kconfig
@@ -7,14 +7,6 @@ config NET_VENDOR_MEDIATEK
 
 if NET_VENDOR_MEDIATEK
 
-config NET_AIROHA
-	tristate "Airoha SoC Gigabit Ethernet support"
-	depends on NET_DSA || !NET_DSA
-	select PAGE_POOL
-	help
-	  This driver supports the gigabit ethernet MACs in the
-	  Airoha SoC family.
-
 config NET_MEDIATEK_SOC_WED
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	def_bool NET_MEDIATEK_SOC != n
diff --git a/drivers/net/ethernet/mediatek/Makefile b/drivers/net/ethernet/mediatek/Makefile
index ddbb7f4a516caccf5eef7140de1872e9b35e3471..03e008fbc859b35067682f8640dab05ccce6caf7 100644
--- a/drivers/net/ethernet/mediatek/Makefile
+++ b/drivers/net/ethernet/mediatek/Makefile
@@ -11,4 +11,3 @@ mtk_eth-$(CONFIG_NET_MEDIATEK_SOC_WED) += mtk_wed_debugfs.o
 endif
 obj-$(CONFIG_NET_MEDIATEK_SOC_WED) += mtk_wed_ops.o
 obj-$(CONFIG_NET_MEDIATEK_STAR_EMAC) += mtk_star_emac.o
-obj-$(CONFIG_NET_AIROHA) += airoha_eth.o

-- 
2.48.1


