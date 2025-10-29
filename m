Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EF7CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brizxRBu3LFpj2XHv7UBCSeP95PLEUGrh/8On/FsYA4=; b=jH+H8szAmN2sHaKpanmJzZRDDX
	3r7QcjVD5eh6XOGiaXFj5ScO1TDoe+Dno72vDIEbiOSX6B1g6AskxhQOT7TdjZ+rHZf0abpIhi09y
	6ccjSgg+iv/nIfILjtSf90+5AIfggcWBtu1GpNPTQEUGF3v//TecYLiWLDPuM8LxQg7B8HMCXUniP
	ebpL7CxMnCG7WPxwDagPNyqjt66WhfPoDt4CiR0CslCLULVFOYJz50FqPSoWzM+Fd8kDhk5r7j09g
	N+U3m9ZT8t/1VRUtyiCoLm16TOj2OKXfHCbbYxXZOJ+bMKv3Y4LSm7C7Gy1bLDkJsZ9PqJwo1oAU0
	vohnqrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Pe-000000002qM-2WNL;
	Wed, 29 Oct 2025 07:16:06 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0PM-000000002H1-2zUD;
	Wed, 29 Oct 2025 07:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761722095;
	bh=brizxRBu3LFpj2XHv7UBCSeP95PLEUGrh/8On/FsYA4=;
	h=From:To:Subject:Date:Message-Id;
	b=GjU2IXd6PkwymaUvkTE9jFp822SjnwxBtY2tuju2gt0wMsra9EK6aLL47yxgxE+Wl
	 zZfZASSTthemMhNWbB38ddjliV6/wu/3zfc2Xe2LunsI8baWe6N93UQYQay7/sklGe
	 YfNTU2+Nviq41BV+/ewpSJrbmdqPL+yoyaHKM4lU=
X-QQ-mid: zesmtpsz6t1761722094tafaac705
X-QQ-Originating-IP: 6uKBeLRKt9TvmdEuUvqbMA/JOlRqI8QIJ5dkrGmyzOE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Oct 2025 15:14:51 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10059686084255947240
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 02/10] usb: typec: Export all typec device types
Date: Wed, 29 Oct 2025 15:14:27 +0800
Message-Id: <20251029071435.88-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251029071435.88-1-kernel@airkyi.com>
References: <20251029071435.88-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: NE5Pnkvry7UFYCMhecDQbQs4M31xG+wRVtJNT1y+KXxm1VlUFVE3FuN9
	p3T896cvThq7faeZTXBOdcsfiH92OHkq6mJ8iTXFAWdI5hMRsBSTR/RD5iYv4omkGFShyYU
	ynA7hHE8rH+ovLMbrOJQKs6werzfep3djzmTlWzHdG2+nT7S2c3DRfD4JxgqRfSyYnZoxIe
	yl7cCSlFSkspHUtaxD3VmxuOyJovm9POqagQ0jGDiEpPA3lQZ5voVOsUnarbIIJPjqle2AC
	my92ivocc9J8kQu8PZ+jTjHxEPGAGiDWxQMoE5YVep53YsAyeXen3HnuuZNG6eQbHD6zuPd
	JeNRmxja62pxh0qWwpnjVJRAm+d3Z5MM+qR4WmkoNpUY61CmsE9T0IKzCgjYBIAQC9OLkw/
	gvIxTpLmTslExIWX3rl1JQ2lvCj/vz9rWADWonY7B0ugeuraM+dNWurixY+GdpVRWANX32i
	BS/YiL8x0dSazCmmtmNqZfJ9zM3hJliakoI7BSoozglalvQWlAfA6Ge7MwI52AU1yn9qiov
	/ynrVqvr2Scx2JO+jPvbOSXgTPMOI5VKk+37Tt39hklkWWTXe6WPeNJ3B1kUt8JEyERU4b1
	mMcLoZX8SZZopOF4VfQ25unw5Vsm3kQxK+eecrnaZ5inj6/LtE264vIusFGHFfiDuqGC0JE
	+DNETzK2yCTUAAw0q5fUrz146e2EbqN9ru/7roMsrhlHkdDF3PQlP+Xy0itrB5NN5mgOIIC
	6F2GDJb0d7EbY9+XxcjHyLTEAYR2Ht786USXsg/3UIaIGYZlr1h4W/UamxYlUgDH4luPVAN
	IgjXAKsPzXD0I4UX6/NpbxzzlY5+qEjf0GLBmMY/YOWbPaWaNj37hjwtA8zy3b7ZN4rti1e
	224z5gbpWH8JT8VKKxOeDgKFZjY8rbcXd2cWQG+1y0mMDwtkqZt2fDa0VXDxMdOZbTIZRYU
	HgAyockj4tphOllgltTCXX122guoyFldG4wTmECnFeaqtTgwG63/AUyYk80ZDm3v6kg8RHd
	fR5OWn1v2tKEccti8D
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_001549_632951_BE4291E9 
X-CRM114-Status: GOOD (  12.12  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Export all typec device types for identification.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/usb/typec/class.c |  4 ++++
 drivers/usb/typec/class.h | 10 ----------
 include/linux/usb/typec.h | 10 ++++++++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 51e971bc68d1..04b55f066b06 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -793,6 +793,7 @@ const struct device_type typec_partner_dev_type = {
 	.groups = typec_partner_groups,
 	.release = typec_partner_release,
 };
+EXPORT_SYMBOL_GPL(typec_partner_dev_type);
 
 static void typec_partner_link_device(struct typec_partner *partner, struct device *dev)
 {
@@ -1147,6 +1148,7 @@ const struct device_type typec_plug_dev_type = {
 	.groups = typec_plug_groups,
 	.release = typec_plug_release,
 };
+EXPORT_SYMBOL_GPL(typec_plug_dev_type);
 
 /**
  * typec_plug_set_num_altmodes - Set the number of available plug altmodes
@@ -1295,6 +1297,7 @@ const struct device_type typec_cable_dev_type = {
 	.groups = typec_cable_groups,
 	.release = typec_cable_release,
 };
+EXPORT_SYMBOL_GPL(typec_cable_dev_type);
 
 /**
  * typec_cable_get - Get a reference to the USB Type-C cable
@@ -2034,6 +2037,7 @@ const struct device_type typec_port_dev_type = {
 	.uevent = typec_uevent,
 	.release = typec_release,
 };
+EXPORT_SYMBOL_GPL(typec_port_dev_type);
 
 /* --------------------------------------- */
 /* Driver callbacks to report role updates */
diff --git a/drivers/usb/typec/class.h b/drivers/usb/typec/class.h
index db2fe96c48ff..f04f6987bed8 100644
--- a/drivers/usb/typec/class.h
+++ b/drivers/usb/typec/class.h
@@ -87,16 +87,6 @@ struct typec_port {
 #define to_typec_cable(_dev_) container_of(_dev_, struct typec_cable, dev)
 #define to_typec_partner(_dev_) container_of(_dev_, struct typec_partner, dev)
 
-extern const struct device_type typec_partner_dev_type;
-extern const struct device_type typec_cable_dev_type;
-extern const struct device_type typec_plug_dev_type;
-extern const struct device_type typec_port_dev_type;
-
-#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
-#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
-#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
-#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
-
 extern const struct class typec_mux_class;
 extern const struct class retimer_class;
 extern const struct class typec_class;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 309251572e2e..02fed8293415 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -56,6 +56,16 @@ enum typec_role {
 	TYPEC_SOURCE,
 };
 
+extern const struct device_type typec_partner_dev_type;
+extern const struct device_type typec_cable_dev_type;
+extern const struct device_type typec_plug_dev_type;
+extern const struct device_type typec_port_dev_type;
+
+#define is_typec_partner(dev) ((dev)->type == &typec_partner_dev_type)
+#define is_typec_cable(dev) ((dev)->type == &typec_cable_dev_type)
+#define is_typec_plug(dev) ((dev)->type == &typec_plug_dev_type)
+#define is_typec_port(dev) ((dev)->type == &typec_port_dev_type)
+
 static inline int is_sink(enum typec_role role)
 {
 	return role == TYPEC_SINK;
-- 
2.49.0


