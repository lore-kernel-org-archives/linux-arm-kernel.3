Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9C6CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iF+wFLzqJgcC4lMJZbTMW9CSMXwTLFbaGRq/VOX71hY=; b=uGI1QFAx14a5Y2qe5FGWQKRTTN
	40ILRAILrwS9LsXWnRBUf/BYQwigp9uozcW0IQe6uVyDfhF9HjWIQKVUizZg4sOw/jhQxD484eosu
	kTlt+SdcyUp2fzfMlCXVWKJg2L3ldpF+avRG2kFj8aub+jodtksCPBcTrPWwOtS2MWN5SEmODL7CV
	/4faRrbXWYdCtLbx8LGoR/tYesVFp7hmCmcDQvQH98rqZ/zTx444wpWPjeFnod9IAPWPkWRV4fja0
	hIjdCTwwfRb82Z2IhwkyKv8I8f6xJm9KnveZKCNCPsh2JIKhd4Zq9PVv33RzEIaScYKfOmCS8N4St
	G96Rysfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhXC-00000003Hp9-09Ut;
	Thu, 11 Sep 2025 13:40:22 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhX9-00000003Hkg-1ips;
	Thu, 11 Sep 2025 13:40:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45b9a856dc2so4784315e9.0;
        Thu, 11 Sep 2025 06:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757598018; x=1758202818; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iF+wFLzqJgcC4lMJZbTMW9CSMXwTLFbaGRq/VOX71hY=;
        b=HQmKUOJCXV2VOBCdXEwds9Bs43/NO7RFqT0jnUtLbJIdEji4hXgUTgAmFP8u2VG7O3
         euW7VdJn4d1+mpj2W/oj/OlgdnOhLLIEUH5CtJ91zzWQtEkp/pkozdGL1SiNeCgbsMF+
         q8zImy/uX8J108C2rF5xgLIu0GkkQsd44ate2xLWC/Q6wpi92dgJhfjNKktXSZkI/hwC
         dzLu5n9sl2Q9sU2w4dF2HZGFOKbPRFT5oeJhoDFGDyyq3/Ogz6bZO3QxCpw30Q1QcnDg
         gulWpQuTz3hRR4vSgxiRq6Hi6obL2aX5K3vXm8nBxdRxQtyTLUKJD//UUWGF8SDRSEsL
         IGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598018; x=1758202818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iF+wFLzqJgcC4lMJZbTMW9CSMXwTLFbaGRq/VOX71hY=;
        b=XDGRDPhT6KD7VKssvhZf7SNkhJENs5FbztRFTIf5iAE/mX0EhS9u5eALJpg/00lWi4
         nOIf8qwFV9aacvV3XWWGQQbHOnp0WCMpyqMuUmvdqk+ET1N0E4KjSDiKLgUe7RMnAmB0
         nWNunmti+L4PeyD6dIWLFh+DIhf5CY4/c1OflUFsP1TrPaH21zbIV0mW3eTe8q5jf5tZ
         ehL83rMg9kKa7i2MlFRl1gppI6Qyct5XqWrHMiOgYcMbqbeREZKIV6K/+9Gh4d6KaWyB
         L5W8O+ue6u21L7kSTymwa/7TFG/E39KrnlYy+xodbPusdyLiGJUiyxu6Qf3F9Sea4Hto
         ebhA==
X-Forwarded-Encrypted: i=1; AJvYcCWnlOHbQbuUMgoEx2osk1QophfHn/k6arqS7BdLb8jwxtskZtXebupgooFR3s6OxeXo57mPEbZkKCk2NnYFZ8dG@lists.infradead.org, AJvYcCWy8Ts8FuijiL5zeisb7YAJn4/8FMPI7VDNQSfCdcORJRSgYOumagaT0LOx0Eo61H9Ragp1a00TqjRf3jqWu9U=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLlhFRRuGyNF6PH8tTqLh5DgsxebAokyAW50Lx3+ZIgxdpgSke
	ggDgVytA0cVa5qBq9/xIddLwVpzO/tWdELsScCgrLptdJfGrohU8L9u6
X-Gm-Gg: ASbGncs3d3pf4uddI/G7cI37Xj1LXa8fqOjnT23vi6xBN8hdoLHnXt7U3horST/Rkof
	Gt7BVMM/X0TowPlNyx2eWDgHx8dnuPYLKpKSdan6U/qUYfPijhpYBDD96wdVpO00cv8GE3iMFPp
	qrbWrV9b6m0bHOhEvReorXFFV8VqFhLLtN2Hrpkn5XEhcyLT65eA3aNM3l8+6tpimL3vckOs7y2
	aGHE9vXCMIc5autf9m0MUCZpSxixQjyA1D7EsrHqRFYzDK8uNFY9+pM2QL/t3kGRtsmMO96T2U4
	z7vJ/AvYs3WedGdXuBkxFV8xBbkDwaRtSX34UIPNL3i9LxH6+u5G/bs67FfqoEcjecmpD2ixmIK
	WmdHEMiZq8CsO1blBJ4Rtty5WRlntXqUA85cUbuKHTIBPj+Z3nqh2nRT6bn+KE+UsMAFZH1A=
X-Google-Smtp-Source: AGHT+IGuwzWcZDwxxcvVkWfDhLFC1rWc/wqy7pHhoHCwjrwLB5tlCcfVs6X3rr2PFxAFnnKGiEukzA==
X-Received: by 2002:a05:600c:1d16:b0:453:2066:4a26 with SMTP id 5b1f17b1804b1-45dddec9927mr243734635e9.16.1757598015942;
        Thu, 11 Sep 2025 06:40:15 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45e037d741asm23413475e9.23.2025.09.11.06.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:40:15 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v17 4/8] net: dsa: tag_mtk: add Airoha variant usage of this TAG
Date: Thu, 11 Sep 2025 15:39:19 +0200
Message-ID: <20250911133929.30874-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911133929.30874-1-ansuelsmth@gmail.com>
References: <20250911133929.30874-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_064019_513839_B38EC458 
X-CRM114-Status: GOOD (  18.09  )
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

Add variant of the MTK TAG for Airoha Switch and comments about difference
between Airoha AN8855 and Mediatek tag bitmap.

Airoha AN8855 doesn't support controlling SA learning and Leaky VLAN
from tag. Although these bits are not used (and even not defined for
Leaky VLAN), it's worth to add comments for these difference to prevent
any kind of regression in the future if ever these bits will be used.

Rework the makefile, config and tag driver to better report to
external tool (like libpcap) the usage of this variant with a dedicated
"Airoha" name.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/net/dsa.h |  2 ++
 net/dsa/Kconfig   | 11 +++++++++++
 net/dsa/Makefile  |  2 +-
 net/dsa/tag_mtk.c | 36 +++++++++++++++++++++++++++++++++---
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index d73ea0880066..bf03493e64ab 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -55,6 +55,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_LAN937X_VALUE		27
 #define DSA_TAG_PROTO_VSC73XX_8021Q_VALUE	28
 #define DSA_TAG_PROTO_BRCM_LEGACY_FCS_VALUE	29
+#define DSA_TAG_PROTO_AIROHA_VALUE		30
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -69,6 +70,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
 	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
 	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
+	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
 	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
 	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
 	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index 869cbe57162f..7d63ecda25c8 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -98,12 +98,23 @@ config NET_DSA_TAG_EDSA
 	  Say Y or M if you want to enable support for tagging frames for the
 	  Marvell switches which use EtherType DSA headers.
 
+config NET_DSA_TAG_MTK_COMMON
+	tristate
+
 config NET_DSA_TAG_MTK
 	tristate "Tag driver for Mediatek switches"
+	select NET_DSA_TAG_MTK_COMMON
 	help
 	  Say Y or M if you want to enable support for tagging frames for
 	  Mediatek switches.
 
+config NET_DSA_TAG_AIROHA
+	tristate "Tag driver for Airoha switches"
+	select NET_DSA_TAG_MTK_COMMON
+	help
+	  Say Y or M if you want to enable support for tagging frames for
+	  Airoha switches.
+
 config NET_DSA_TAG_KSZ
 	tristate "Tag driver for Microchip 8795/937x/9477/9893 families of switches"
 	help
diff --git a/net/dsa/Makefile b/net/dsa/Makefile
index 555c07cfeb71..7aba189a715c 100644
--- a/net/dsa/Makefile
+++ b/net/dsa/Makefile
@@ -27,7 +27,7 @@ obj-$(CONFIG_NET_DSA_TAG_GSWIP) += tag_gswip.o
 obj-$(CONFIG_NET_DSA_TAG_HELLCREEK) += tag_hellcreek.o
 obj-$(CONFIG_NET_DSA_TAG_KSZ) += tag_ksz.o
 obj-$(CONFIG_NET_DSA_TAG_LAN9303) += tag_lan9303.o
-obj-$(CONFIG_NET_DSA_TAG_MTK) += tag_mtk.o
+obj-$(CONFIG_NET_DSA_TAG_MTK_COMMON) += tag_mtk.o
 obj-$(CONFIG_NET_DSA_TAG_NONE) += tag_none.o
 obj-$(CONFIG_NET_DSA_TAG_OCELOT) += tag_ocelot.o
 obj-$(CONFIG_NET_DSA_TAG_OCELOT_8021Q) += tag_ocelot_8021q.o
diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index b670e3c53e91..32befcbdf4be 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -11,6 +11,7 @@
 #include "tag.h"
 
 #define MTK_NAME		"mtk"
+#define AIROHA_NAME		"airoha"
 
 #define MTK_HDR_LEN		4
 #define MTK_HDR_XMIT_UNTAGGED		0
@@ -18,6 +19,9 @@
 #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
 #define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
+/* AN8855 doesn't support SA_DIS and Leaky VLAN
+ * control in tag as these bits doesn't exist.
+ */
 #define MTK_HDR_XMIT_SA_DIS		BIT(6)
 
 static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
@@ -94,6 +98,7 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev)
 	return skb;
 }
 
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
 static const struct dsa_device_ops mtk_netdev_ops = {
 	.name		= MTK_NAME,
 	.proto		= DSA_TAG_PROTO_MTK,
@@ -102,8 +107,33 @@ static const struct dsa_device_ops mtk_netdev_ops = {
 	.needed_headroom = MTK_HDR_LEN,
 };
 
-MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
-MODULE_LICENSE("GPL");
+DSA_TAG_DRIVER(mtk_netdev_ops);
 MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_MTK, MTK_NAME);
+#endif
 
-module_dsa_tag_driver(mtk_netdev_ops);
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
+static const struct dsa_device_ops airoha_netdev_ops = {
+	.name		= AIROHA_NAME,
+	.proto		= DSA_TAG_PROTO_AIROHA,
+	.xmit		= mtk_tag_xmit,
+	.rcv		= mtk_tag_rcv,
+	.needed_headroom = MTK_HDR_LEN,
+};
+
+DSA_TAG_DRIVER(airoha_netdev_ops);
+MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_AIROHA, AIROHA_NAME);
+#endif
+
+static struct dsa_tag_driver *dsa_tag_driver_array[] =	{
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
+	&DSA_TAG_DRIVER_NAME(mtk_netdev_ops),
+#endif
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_AIROHA)
+	&DSA_TAG_DRIVER_NAME(airoha_netdev_ops),
+#endif
+};
+
+module_dsa_tag_drivers(dsa_tag_driver_array);
+
+MODULE_DESCRIPTION("DSA tag driver for Mediatek switches");
+MODULE_LICENSE("GPL");
-- 
2.51.0


