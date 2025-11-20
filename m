Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35438CF64A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNllLzwzBdbka1nV55jX2kPT1B2apGnU6AJpIMBuw2w=; b=fSg+zRlmHDzQLoQu6599ONp9ps
	0bPeuYN670YUw/f40hiJ7KXQizfPskfYJoplZP+71Z+rWtfF2XgZoBJR9T5c/hGHSFlMBvKzDwpyQ
	wkDtWWd/QKZdVKwSqv0MHFM6UyE5igOi91wctYAirgsO8plZDdRxlnrQM9bl1jkrNavJbcZ5Ad+cf
	G84W2mCFhaNZEObB0HgO+Wcg4FJ26/Z6ygCx7cgMj7LCfxLbMFNNydBrESMAS5sIpg7gXNrRe0fHr
	OYguD0NT4Tf7+eOBpotrzB+/qG/3H5F6RWrJvebIlazZGWMRLAdqnD1xf2md8Ru3IAWuCFNJHgusM
	pi0EfCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuLk-00000005yJW-1Oxs;
	Thu, 20 Nov 2025 02:24:44 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuLg-00000005yHA-1Q0T;
	Thu, 20 Nov 2025 02:24:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605442;
	bh=sNllLzwzBdbka1nV55jX2kPT1B2apGnU6AJpIMBuw2w=;
	h=From:To:Subject:Date:Message-Id;
	b=QIGs7h07c7TwQWmHT52X4cRsRrfSYK9GKGbCoyHkzWbyzXUrKYGZj0tumTA+P9rlf
	 R/exwNh8CTv0VQwmdu5IB98R7AlGUtYu8RFYcceiHAUbNuopjX1F5MbHGD6bG7kVlq
	 393hL+7hXRFiZnHupznHh0lkUuIgvAlpYlh5JaMk=
X-QQ-mid: zesmtpsz5t1763605440ta4483ad6
X-QQ-Originating-IP: rY8CRKUnY2Dkoe7g+ABEYFCRQNfG+zxyr4d4xbHKp1Y=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:23:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10264243527081182811
From: Chaoyi Chen <kernel@airkyi.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Chen <hzpeterchen@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
Subject: [PATCH v10 02/11] usb: typec: Export all typec device types
Date: Thu, 20 Nov 2025 10:23:34 +0800
Message-Id: <20251120022343.250-3-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NAtipnnbTPeaZ/ASbvsIPvHcDcYmUcP2go493Itjt+DXYO3okZi7JgLe
	i8aRyp+PTYf0xIfEmiZrjiTWb5a39VjFhcPFmUd3h3ZNPDLahqv1vKGlSyG8bQXN7sAdmpW
	Gv7ksJTeOqhSyHqQ44ovvbWLuvGgM6aPg1M1J/cD04kQb26MkLUDAjJNGTxex9364vA0tPs
	QL8LZV2teGXTRxi9SDsBGyuVTzT10CrKTmzA8p5RDF/GgIZOqhcoM56bxPT3L7zSkS4ytuv
	862UlkkLXd0YizrhQ+vM3C2t/F0LnwlCAaILIeg7FU77O2r0AzS+YVjhmcjmMBDQni/Evfe
	TtUCXK2QlbmbLV6diQ08sNfzG4kzNaEi6jhFp5QP98oSYqVa2HHmR97p9BuYkhZVHNUtVaL
	VdbfkK3lZw3NipujCHjXUgyAVYwbIeOpFMjkO7J86zofmLX8qKCyFNdTv8wkhW1Ckkaaxvb
	hXltyrnlCZ3+51jvag2wX/Dfp+1idfHJCZ2kHY7Yg1SdzpSW4CEg417Sm/02rl3HdnrKNR/
	E12fBJw+D770A26+lD+T40IavucLhngVYJRdBOmEcP4kAi0HZAvgRZ7ZNdaHQCbZsMyrurs
	++AYGzHr5TZciCwfb2oNchkXoqSN5m2xERNlkfhpci0uefMMDj90CoeBK/KOBVvniTeo1ET
	x+JAS8xfpRexvdQ3ibgGqZNWvzNIUY+P/NaCl3iaylpttB8QUoSHcaQuI5lbmHkGCOz5yNN
	eQnYdhQCtjDpT1XlFnuAT2yr/fb4lwEThkQOlQjiunyzXesDxZxRhN4/EECoE9WMemhPsOE
	Pao5N84gbEVuYu7MNYEZiXAKrzpwGNyjtG+CiAqfSxQF8hk2g9ETze/54pI5Qi2DtfcA1OF
	7L0ft19RdT+AzUoPFsuLYmb0qp/LvRcAXAQ1fE3065sGLIOCr8cHJOQHYK+ZGws0yHdK8ES
	+qduAErIAmUTwjLHQuuVnwPBORyhY6atWW/A8C2F9WWnbbGvp8LKDHsDf66hJg5IPRuQ=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_182440_781535_6C0834FA 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

(no changes since v9)

 drivers/usb/typec/class.c |  4 ++++
 drivers/usb/typec/class.h | 10 ----------
 include/linux/usb/typec.h | 10 ++++++++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 1ccf5385d559..957add6b73e9 100644
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
2.51.1


