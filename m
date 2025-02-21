Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BD2C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSY+UBE9kzGHPUbh5Y1nwA/QIwhXvgGkQmB5IgW7iD8=; b=x5Te/f6VT61Fy2szkzSeFSKndJ
	bc4PEn1RVenvayUHuzCX7KpbawxKm7VYMx6HBXy4L/9nUeTuE99e7jX5jV2W2MVP/VIBWVNHk8TIj
	pmGhvXj0eI8jocMMB8wbNe0ZRCnb6MXcZtbwuLkmWlK8uNqaU2y6lNIbjVcL5MWBFsEuPZ6dKklbN
	1FCjuwTGOKNE2lQBAKmPbTnBrUGkIWndgECvqOHbJx3UgZk6gCkyRUuoZPZ++xp1+5s6iPGIcCjn4
	2wOH+5DlaT97hlA3aDTQdqpiNerqSNKRkb95QNJ2IQYcyMvJ0N/pmAo8zYRraXP+/wVjllv1CYxy3
	/EbkKWsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQU1-00000005DeM-1i4f;
	Fri, 21 Feb 2025 10:42:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQGk-00000005BAo-0VmI;
	Fri, 21 Feb 2025 10:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 62F8E61190;
	Fri, 21 Feb 2025 10:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB7EC4CED6;
	Fri, 21 Feb 2025 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740133709;
	bh=IpkbnQD0aqV4zTrDQLNPfko65wJI87nBEI5JGdjdZk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UIKqEBnEV5LV0pWp1sR9OKvfjChJqreqxEiuagU69Y1sI8ht9HdQLWIAP6k48bjx6
	 4x5CQ+7g3Y+13AejCdJalsjgl+v9a+fP752Yr1vmELmPoNsUP3al5qr1fzJ8fDn7Bf
	 ck07SW/BewetskiuxvJZ87Xv0prxMNVYpz5adHo4tS7DcgQLq/emAwXDY4yn6xrW0/
	 LtgrKzC43qbMkqNAz2i4XLhJ8gqeOS5e9mNeBuG5upKCB2cnn2qbnXFFtxExlZ9EXu
	 jxhw+ejVqllE9VyjAn0XFddOIroozCF2XCb3P8rR8CyJLG5dQh7SzYqtnwGuuPiLli
	 ULmLvOviPrehw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 21 Feb 2025 11:28:02 +0100
Subject: [PATCH net-next v6 01/15] net: airoha: Move airoha_eth driver in a
 dedicated folder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-airoha-en7581-flowtable-offload-v6-1-d593af0e9487@kernel.org>
References: <20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org>
In-Reply-To: <20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org>
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


