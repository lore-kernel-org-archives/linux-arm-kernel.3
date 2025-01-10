Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC0EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAlsVkvjNe/9JvatPE66gMffUnB33UIIOCebIlDB1hA=; b=zWPt9/b9xjHlikOZhB58JT0nyw
	e4NJaZStKkelBnKGltFj+h1JFfyvDz1haf7HuSMC+xCoJwn0tJUPgMFN7zhPJ3PQ7y3/m5Nclq3zM
	74TjanVPPgRvSTkE6jzHb1SJa0/NBpScnOCOVGosNQtgXcaJbJ3R2c5VnYxa1CSS3S45ErfCiFQTo
	5eN9d01FV4ancmsFzOGgS998AsU8EdTsyFMXf863ijZnAVDISqAHc7wFBVwiNZCzcAqLrXpd/wnjn
	ZLq9MdXC1JOoC1r219eiYQ2T+rLn1MnPwsAjc9ex1mZdvJUF8utLixoTmmOqt134V6fSLMD42m3qu
	jDpp/kaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAPY-0000000EXEX-1q16;
	Fri, 10 Jan 2025 08:30:33 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAOJ-0000000EWr0-3yjv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 08:29:17 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50A8T6up3390430
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 02:29:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736497746;
	bh=pAlsVkvjNe/9JvatPE66gMffUnB33UIIOCebIlDB1hA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nJG3CEm5vOMKkuad0YIiNYu2g5y6tR/6df94dy4K08x9WPdDW0bwHQuSFmoVCMJGH
	 jMXkcGVww7qkKb5j5wd3HhNGbEjHycF/420+AjQajOriubAsxnX8RLH6JNL/TIMX/2
	 RJJaF1334+ZG55ORzIRvbFSTNrdTyWNARIWP7DgA=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50A8T6xT007587
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Jan 2025 02:29:06 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 10
 Jan 2025 02:29:05 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 10 Jan 2025 02:29:05 -0600
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50A8T5de012777;
	Fri, 10 Jan 2025 02:29:05 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 50A8T4NO021289;
	Fri, 10 Jan 2025 02:29:04 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: Jeongjun Park <aha310510@gmail.com>,
        Alexander Lobakin
	<aleksander.lobakin@intel.com>,
        Lukasz Majewski <lukma@denx.de>, Meghana
 Malladi <m-malladi@ti.com>,
        Diogo Ivo <diogo.ivo@siemens.com>, Simon Horman
	<horms@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller"
	<davem@davemloft.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Roger Quadros
	<rogerq@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>, <danishanwar@ti.com>,
        Michal Swiatkowski
	<michal.swiatkowski@linux.intel.com>,
        Larysa Zaremba
	<larysa.zaremba@intel.com>
Subject: [PATCH net-next v4 3/4] net: hsr: Create and export hsr_get_port_ndev()
Date: Fri, 10 Jan 2025 13:58:51 +0530
Message-ID: <20250110082852.3899027-4-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110082852.3899027-1-danishanwar@ti.com>
References: <20250110082852.3899027-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_002916_077756_184909D8 
X-CRM114-Status: GOOD (  18.18  )
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

Create an API to get the net_device to the slave port of HSR device. The
API will take hsr net_device and enum hsr_port_type for which we want the
net_device as arguments.

This API can be used by client drivers who support HSR and want to get
the net_devcie of slave ports from the hsr device. Export this API for
the same.

This API needs the enum hsr_port_type to be accessible by the drivers using
hsr. Move the enum hsr_port_type from net/hsr/hsr_main.h to
include/linux/if_hsr.h for the same.

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 include/linux/if_hsr.h | 17 +++++++++++++++++
 net/hsr/hsr_device.c   | 13 +++++++++++++
 net/hsr/hsr_main.h     |  9 ---------
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/include/linux/if_hsr.h b/include/linux/if_hsr.h
index 0404f5bf4f30..d7941fd88032 100644
--- a/include/linux/if_hsr.h
+++ b/include/linux/if_hsr.h
@@ -13,6 +13,15 @@ enum hsr_version {
 	PRP_V1,
 };
 
+enum hsr_port_type {
+	HSR_PT_NONE = 0,	/* Must be 0, used by framereg */
+	HSR_PT_SLAVE_A,
+	HSR_PT_SLAVE_B,
+	HSR_PT_INTERLINK,
+	HSR_PT_MASTER,
+	HSR_PT_PORTS,	/* This must be the last item in the enum */
+};
+
 /* HSR Tag.
  * As defined in IEC-62439-3:2010, the HSR tag is really { ethertype = 0x88FB,
  * path, LSDU_size, sequence Nr }. But we let eth_header() create { h_dest,
@@ -32,6 +41,8 @@ struct hsr_tag {
 #if IS_ENABLED(CONFIG_HSR)
 extern bool is_hsr_master(struct net_device *dev);
 extern int hsr_get_version(struct net_device *dev, enum hsr_version *ver);
+struct net_device *hsr_get_port_ndev(struct net_device *ndev,
+				     enum hsr_port_type pt);
 #else
 static inline bool is_hsr_master(struct net_device *dev)
 {
@@ -42,6 +53,12 @@ static inline int hsr_get_version(struct net_device *dev,
 {
 	return -EINVAL;
 }
+
+static inline struct net_device *hsr_get_port_ndev(struct net_device *ndev,
+						   enum hsr_port_type pt)
+{
+	return ERR_PTR(-EINVAL);
+}
 #endif /* CONFIG_HSR */
 
 #endif /*_LINUX_IF_HSR_H_*/
diff --git a/net/hsr/hsr_device.c b/net/hsr/hsr_device.c
index 03eadd6c51fd..b6fb18469439 100644
--- a/net/hsr/hsr_device.c
+++ b/net/hsr/hsr_device.c
@@ -663,6 +663,19 @@ bool is_hsr_master(struct net_device *dev)
 }
 EXPORT_SYMBOL(is_hsr_master);
 
+struct net_device *hsr_get_port_ndev(struct net_device *ndev,
+				     enum hsr_port_type pt)
+{
+	struct hsr_priv *hsr = netdev_priv(ndev);
+	struct hsr_port *port;
+
+	hsr_for_each_port(hsr, port)
+		if (port->type == pt)
+			return port->dev;
+	return NULL;
+}
+EXPORT_SYMBOL(hsr_get_port_ndev);
+
 /* Default multicast address for HSR Supervision frames */
 static const unsigned char def_multicast_addr[ETH_ALEN] __aligned(2) = {
 	0x01, 0x15, 0x4e, 0x00, 0x01, 0x00
diff --git a/net/hsr/hsr_main.h b/net/hsr/hsr_main.h
index 7d7551e6f0b0..7561845b8bf6 100644
--- a/net/hsr/hsr_main.h
+++ b/net/hsr/hsr_main.h
@@ -121,15 +121,6 @@ struct hsrv1_ethhdr_sp {
 	struct hsr_sup_tag	hsr_sup;
 } __packed;
 
-enum hsr_port_type {
-	HSR_PT_NONE = 0,	/* Must be 0, used by framereg */
-	HSR_PT_SLAVE_A,
-	HSR_PT_SLAVE_B,
-	HSR_PT_INTERLINK,
-	HSR_PT_MASTER,
-	HSR_PT_PORTS,	/* This must be the last item in the enum */
-};
-
 /* PRP Redunancy Control Trailor (RCT).
  * As defined in IEC-62439-4:2012, the PRP RCT is really { sequence Nr,
  * Lan indentifier (LanId), LSDU_size and PRP_suffix = 0x88FB }.
-- 
2.34.1


