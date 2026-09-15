Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7FCC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Tz2CwjjJhiae7LDEb+iwsLlaTftt3gAWGBis4F4zcg=; b=O4aCaz/9jb6RtG58f3yafFcxPM
	iaUyQ0WOtAkivyIxjH35BDju3fX5VOUq0yeHsvvJEhmfcvLVe7j9tl47z8wKWLj2nAYk+gVsWe0j3
	PJPQIMRUJEIE3g5Hj8hX+OF/iiYZhEscGd9Vq/wQBxVAV2jfs8QlMJJa/A35dPb6pJYdcYZ3ODDlm
	GC8lXVNGT1GXxTxy8wH4CQjKfdzPW+gNSyBJiJWttze/72horg8XMtgkpoj7ZLk6BhBurbpGcrDGF
	u/EXIHvRX/2YorZU1V5dUbfTwHjSL1xxdMKp0SAIOA0/2mrlJvOiy5h4t+ut7HZN0xmEDYfDS3MxM
	Wba2iF5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SRC-00000006X9B-28mo;
	Tue, 15 Sep 2026 12:39:02 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SQn-00000006WhT-0udB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:38:39 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d097b4939so14752045e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475915; x=1790080715; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9Tz2CwjjJhiae7LDEb+iwsLlaTftt3gAWGBis4F4zcg=;
        b=CyxShZ0NfqNO5uYtn6CkRUfF63JL1WlIIv0o1h4NcxfcRBo06WNF0fWgA8jwkcHOaq
         HOJQUkjMLo7uDpqtmI4HfIxwn6QKesHXB88YpbJd6pLP6WODfgAPs5OF3nnyA0my5Je6
         y4JN9lL1q37qGv9mD6XEatgqgUJ8JAmPKMKsLVmB6yVa2WrrseLMBUD7pc4b9KxyJfp6
         yODmKIUjE49Fz1UU6nsJrAsBq6jJYndyUsmQ8tZYnQ3SfDtHIxYKIU8pkG9TczmBMBKR
         dEb2lTDAsexluTAe1JKScoHwvJxOTmOXIF89q2OrjXoRlsL3ceU+P/2tfvpBMyIzkwL5
         kGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475915; x=1790080715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9Tz2CwjjJhiae7LDEb+iwsLlaTftt3gAWGBis4F4zcg=;
        b=xIWC9TFCklCGN3B26gn75soBEhcKdsOgb7/wZ7j8mlU1UteS5WEY2z0OVy1i81CvEK
         hygvE89g00qBXLjTi5BIuzJRI16Se9PJp0J8YNjwp5hWbiiWmbqnc+2be5/2wDr11L06
         lf0BwGUaFxVzZmBidDP9T1A6AQTRW56bt7hBMVQfZPqF1AINSzlySqJBJpAvrfXZrd1M
         5Onnron8v9Lp374w9ivSw1ZwFVHOUL/6kj3/5j/ngNz69l723VC2c1cEcS7ed2FYiyyY
         HR6MoleLOTujqxMn1TAQ6REbOy9zgGnfTBmpzGfNIq0gWRNR4mS5/3hMT8Exw9e6Bb/w
         /JXg==
X-Forwarded-Encrypted: i=1; AKwUvBwxiB96/8SvufU1OnSagHJxhtSmi9XUZySGdWZ8y6YJ3YFLDsO0OknOH8f0lkTifj++cH05EJ+FVbCrhtQwalb/@lists.infradead.org
X-Gm-Message-State: AFuF++kBcjzfmuCvACZ2twrRfAsOdHZR/l7CfGHBQyscubNFVbPVp46/
	8QI56CxZmkNNnjVRhqxT+KSIeNYy8vaFWvIf8xxHbROLeX3ioLuXPKMf
X-Gm-Gg: AYBFou1kz1aGpRdtHGUf+6MXAGBL130ANsMNdE2JMWVYrMMnt/qgcSdxSv/hXlVfF9u
	V7msYcKg1OCA6zAkhiDQcHqDcFzlCLYx+lo5LPY5M1p6+qcuNuolSpHssVSkWsdhG67vHNMoF6q
	vYGY5Q3P3zQqQL0d4C5OtkxGQdtEPT7jaTYFblKQ9D81eBr+4yYUQC8qFpNMG6viGmCSOmbLFnx
	LvqaPZKv1e64kRsrHrexnSxyYO+GRzCMUNPZsz5Nq9oM+v0jxhhxiLOvmrEiUe9L3oCagPW7TOr
	N7IxVx/J1l2rv2O8pGzSaggpSUU9mVXHgMQKUY0fJ2vy0lOYRyaKIEUcUGa05MkoIGtXhyNpPNO
	hy8Uyz6oS26EsbVWwHKzv+75XCmArudZIHz4nApuuuJZEQjB4kezJKVD2mf70osWwYMST51gOjn
	KnYlH8Yl3AN0N+fXWSNjwSL/I1CFkqp6l/STyssIi3SkZ70owQnXAJaLkXFKQA/k4jLt5toQdtE
	GwYi+nSmxLt/xcdqJeBcd+xZ9DzzsN/rddQM+9pG4JkvvLyOgW/q40WpMbXNh2T
X-Received: by 2002:a05:600c:4e90:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49e7a65ce45mr95145365e9.4.1789475915466;
        Tue, 15 Sep 2026 05:38:35 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a8d5asm62958635e9.9.2026.09.15.05.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:38:35 -0700 (PDT)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v22 6/9] net: dsa: tag_mtk: add Airoha variant usage of this TAG
Date: Tue, 15 Sep 2026 14:38:03 +0200
Message-ID: <20260915123812.14747-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260915123812.14747-1-ansuelsmth@gmail.com>
References: <20260915123812.14747-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_053837_421160_5B6392C2 
X-CRM114-Status: GOOD (  20.02  )
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
index 7507d632e7c6..c5659e9ab6d3 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -61,6 +61,7 @@ struct tc_action;
 #define DSA_TAG_PROTO_NETC_VALUE		33
 #define DSA_TAG_PROTO_KSZ8463_VALUE		34
 #define DSA_TAG_PROTO_MT7628_VALUE		35
+#define DSA_TAG_PROTO_AIROHA_VALUE		36
 
 enum dsa_tag_protocol {
 	DSA_TAG_PROTO_NONE		= DSA_TAG_PROTO_NONE_VALUE,
@@ -75,6 +76,7 @@ enum dsa_tag_protocol {
 	DSA_TAG_PROTO_KSZ9893		= DSA_TAG_PROTO_KSZ9893_VALUE,
 	DSA_TAG_PROTO_LAN9303		= DSA_TAG_PROTO_LAN9303_VALUE,
 	DSA_TAG_PROTO_MTK		= DSA_TAG_PROTO_MTK_VALUE,
+	DSA_TAG_PROTO_AIROHA		= DSA_TAG_PROTO_AIROHA_VALUE,
 	DSA_TAG_PROTO_QCA		= DSA_TAG_PROTO_QCA_VALUE,
 	DSA_TAG_PROTO_TRAILER		= DSA_TAG_PROTO_TRAILER_VALUE,
 	DSA_TAG_PROTO_8021Q		= DSA_TAG_PROTO_8021Q_VALUE,
diff --git a/net/dsa/Kconfig b/net/dsa/Kconfig
index 23b4b74004ed..07ad0f13416e 100644
--- a/net/dsa/Kconfig
+++ b/net/dsa/Kconfig
@@ -24,6 +24,13 @@ config NET_DSA_TAG_NONE
 	  Say Y or M if you want to enable support for switches which don't tag
 	  frames over the CPU port.
 
+config NET_DSA_TAG_AIROHA
+	tristate "Tag driver for Airoha switches"
+	select NET_DSA_TAG_MTK_COMMON
+	help
+	  Say Y or M if you want to enable support for tagging frames for
+	  Airoha switches.
+
 config NET_DSA_TAG_AR9331
 	tristate "Tag driver for Atheros AR9331 SoC with built-in switch"
 	help
@@ -104,8 +111,12 @@ config NET_DSA_TAG_MT7628
 	  Say Y or M if you want to enable support for tagging frames for the
 	  switch embedded in the MT7628 SoC.
 
+config NET_DSA_TAG_MTK_COMMON
+	tristate
+
 config NET_DSA_TAG_MTK
 	tristate "Tag driver for Mediatek switches"
+	select NET_DSA_TAG_MTK_COMMON
 	help
 	  Say Y or M if you want to enable support for tagging frames for
 	  Mediatek switches.
diff --git a/net/dsa/Makefile b/net/dsa/Makefile
index d15bcf5c68f0..57739a488a6a 100644
--- a/net/dsa/Makefile
+++ b/net/dsa/Makefile
@@ -28,7 +28,7 @@ obj-$(CONFIG_NET_DSA_TAG_HELLCREEK) += tag_hellcreek.o
 obj-$(CONFIG_NET_DSA_TAG_KSZ) += tag_ksz.o
 obj-$(CONFIG_NET_DSA_TAG_LAN9303) += tag_lan9303.o
 obj-$(CONFIG_NET_DSA_TAG_MT7628) += tag_mt7628.o
-obj-$(CONFIG_NET_DSA_TAG_MTK) += tag_mtk.o
+obj-$(CONFIG_NET_DSA_TAG_MTK_COMMON) += tag_mtk.o
 obj-$(CONFIG_NET_DSA_TAG_MXL_862XX) += tag_mxl862xx.o
 obj-$(CONFIG_NET_DSA_TAG_MXL_GSW1XX) += tag_mxl-gsw1xx.o
 obj-$(CONFIG_NET_DSA_TAG_NETC) += tag_netc.o
diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index c7dc7731675e..f8087d768da6 100644
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
@@ -99,6 +103,7 @@ static struct sk_buff *mtk_tag_rcv(struct sk_buff *skb, struct net_device *dev)
 	return skb;
 }
 
+#if IS_ENABLED(CONFIG_NET_DSA_TAG_MTK)
 static const struct dsa_device_ops mtk_netdev_ops = {
 	.name		= MTK_NAME,
 	.proto		= DSA_TAG_PROTO_MTK,
@@ -107,8 +112,33 @@ static const struct dsa_device_ops mtk_netdev_ops = {
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
2.53.0


