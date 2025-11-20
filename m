Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD00CF64A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 02:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1djG2TFE/CUEyP0COdHWqSO/caFFOIst9KD5pPTwfU=; b=eXz0IgtAw2Aqfe8WNl5CuMBzNR
	z++HcaYCEDBzmUA7lgecT0L2vrk7ODyjUu63hvY2B4HDbxC1cJz3in7ORB7oEQyufHzBBv24316dx
	JPVU7OwcEz7FfrDi+/N2j3fp7M0g8MfXzXg9j474aq4LCF1fj7IpIylyf9eFEdvckWuL5TBT/GZKx
	1/EyJ36Anest+FW5cGO8+E/qwZeUAFFppF5CWS2+UqzWw0ud4mH1rfslKxeG+Lhy+QtxeT/DPd3FX
	lMQcvka9vGS1WhiAvJ9+wUu1KEYb+R1iYnQWrvyrFzYSBtuFf8edMqPvBwT/bZMH56vHPeyjAUv3h
	Y0oUFanQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuLq-00000005yNe-3aaF;
	Thu, 20 Nov 2025 02:24:50 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLuLh-00000005yH9-1HRt;
	Thu, 20 Nov 2025 02:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1763605438;
	bh=j1djG2TFE/CUEyP0COdHWqSO/caFFOIst9KD5pPTwfU=;
	h=From:To:Subject:Date:Message-Id;
	b=BlVMdBy7Ltf441wLnCmm0AVUXNNXTZ3ZWlUIy4BNh3+xUzTTU2XbgXzBhTOBz7Wu2
	 ZpmUgkC19gH5rdC/0MfNQkHGjckdTMbO3qRrVnu2uO31Op6KBfZ97G1rG2UTs6Kv8d
	 LobSEOUIwcV8KY6HToIkSajUDgB+GenvllqlBB88=
X-QQ-mid: zesmtpsz5t1763605436tb3e0b544
X-QQ-Originating-IP: xlc9ysITpbSHXMdJexYj64rNZJQOqI/N1w8Cl7S5hso=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 20 Nov 2025 10:23:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17663910937081771390
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
Subject: [PATCH v10 01/11] usb: typec: Add notifier functions
Date: Thu, 20 Nov 2025 10:23:33 +0800
Message-Id: <20251120022343.250-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251120022343.250-1-kernel@airkyi.com>
References: <20251120022343.250-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OeWvpHj3+EsSv9xKSW9oV9ok1IEWWBRVoxF+28Qa+4hqt4fjLvBEJEKx
	v12u7Dg1aEMKBJLHFOyL9ZDXKwpSAoy5+Cgs6tCv2TfdfbjfBt5FStLDN/f6t41HDfeZK2Z
	Zo83614Y7R7P7aCzf9/cbznW+KFNgQ/OB5Ew/DZSY/gRdqaE6clzx1iSiZvKkzQXXRjG2eX
	TVR+fz4Iz0KVtqj/shfyJT+HfMIsXCPBQj9AcSVf4C7ceVrarxsYDELwdyZQMJK/40yGXgh
	HHUeXLN+GruVkt6/hqv2ZLY5lzAOAJZzP6+uyU1Cl9WvliSN5vtiPCAFKkJFBDyUCtH5joR
	DkGrTn9Dl6XmpnaGr+TaEBAWe+Fvjck3CyU0qPdDFuyNHjfML7/08PzLavZYk7KIuLCGDv0
	+6O4cd6XYafGlkFgn+GhMuxdv9ijD81pobFfb8gXrdUut2LkGAWBe8Ghi++huV3MLmLuu19
	nEsgrd+np/rgplqKyPaXftNNMxko2+TLCAwepwSGLeBxy/pYB8+dFquAWG2+OtCIKdnlWgd
	AV3NXxANYqbkanz+YWLIU5fz2OtRIrDBpqwHf0Ku0oKeOmVS1YVQS3scrD4KyET1fKdgLGU
	ouKGw1tRnIU9Cr6lRsSw/O0Ch5myL9SZjA9hm1khx1186KuXQAFYZ2p7Dcn5MBEXOZXl8kb
	J8DcsNJJm++9kqltJdT8hHMlgpQHxaRePZbFwGQADhRVwlPlkX7vkQH/ncFLRWkFJVZln+K
	Q1hYwWwXx2LIBG0JzoDwOfJ+X5RfW4LnI+UHUgd3ciZdZcGramjaeIXnEGJsDG0PTx5K7qM
	4NVOULjH0yPP4pOLEkmERoqJQ92prHflJwg5eoC0vXdDOeyMU+tuNds/nSODbh9keiBQTi3
	/eZ6P7xS+Vz/aC0fRLf1NYh9L7QPM49MqQ9icpbxA8s9BXatC2LDOF32V2hDvVohegwfzU4
	I10NGddqLhPWzgahsk8S1wZoInwm4h/uWzrEB/gKFqkuErIVth14IqEaOKQhxvbLBIxr66a
	MiUjpgPQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_182441_858464_98060035 
X-CRM114-Status: GOOD (  16.06  )
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

Some other part of kernel may want to know the event of typec bus.

This patch add common notifier function to notify these event.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v10:
- Notify TYPEC_ALTMODE_UNREGISTERED when altmode removed. 

Changes in v9:
- Remove redundant header files.

Changes in v8:
- Fix coding style.

 drivers/usb/typec/Makefile        |  2 +-
 drivers/usb/typec/bus.h           |  2 ++
 drivers/usb/typec/class.c         |  3 +++
 drivers/usb/typec/notify.c        | 23 +++++++++++++++++++++++
 include/linux/usb/typec_altmode.h |  9 +++++++++
 5 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/notify.c

diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
index 7a368fea61bc..20d09c5314d7 100644
--- a/drivers/usb/typec/Makefile
+++ b/drivers/usb/typec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_TYPEC)		+= typec.o
-typec-y				:= class.o mux.o bus.o pd.o retimer.o
+typec-y				:= class.o mux.o notify.o bus.o pd.o retimer.o
 typec-$(CONFIG_ACPI)		+= port-mapper.o
 obj-$(CONFIG_TYPEC)		+= altmodes/
 obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
diff --git a/drivers/usb/typec/bus.h b/drivers/usb/typec/bus.h
index 643b8c81786d..820b59b6d434 100644
--- a/drivers/usb/typec/bus.h
+++ b/drivers/usb/typec/bus.h
@@ -26,6 +26,8 @@ struct altmode {
 	struct altmode			*plug[2];
 };
 
+void typec_notify_event(unsigned long event, void *data);
+
 #define to_altmode(d) container_of(d, struct altmode, adev)
 
 extern const struct bus_type typec_bus;
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9b2647cb199b..1ccf5385d559 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -600,6 +600,8 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
+
 	return &alt->adev;
 }
 
@@ -614,6 +616,7 @@ void typec_unregister_altmode(struct typec_altmode *adev)
 {
 	if (IS_ERR_OR_NULL(adev))
 		return;
+	typec_notify_event(TYPEC_ALTMODE_UNREGISTERED, adev);
 	typec_retimer_put(to_altmode(adev)->retimer);
 	typec_mux_put(to_altmode(adev)->mux);
 	device_unregister(&adev->dev);
diff --git a/drivers/usb/typec/notify.c b/drivers/usb/typec/notify.c
new file mode 100644
index 000000000000..9e50b54da359
--- /dev/null
+++ b/drivers/usb/typec/notify.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/notifier.h>
+
+#include "bus.h"
+
+static BLOCKING_NOTIFIER_HEAD(typec_notifier_list);
+
+int typec_altmode_register_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_register_notify);
+
+int typec_altmode_unregister_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_unregister_notify);
+
+void typec_notify_event(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&typec_notifier_list, event, data);
+}
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index f7db3bd4c90e..59e20702504b 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -10,6 +10,7 @@
 #define MODE_DISCOVERY_MAX	6
 
 struct typec_altmode_ops;
+struct notifier_block;
 
 /**
  * struct typec_altmode - USB Type-C alternate mode device
@@ -77,6 +78,14 @@ int typec_altmode_notify(struct typec_altmode *altmode, unsigned long conf,
 const struct typec_altmode *
 typec_altmode_get_partner(struct typec_altmode *altmode);
 
+enum usb_typec_event {
+	TYPEC_ALTMODE_REGISTERED,
+	TYPEC_ALTMODE_UNREGISTERED,
+};
+
+int typec_altmode_register_notify(struct notifier_block *nb);
+int typec_altmode_unregister_notify(struct notifier_block *nb);
+
 /**
  * struct typec_cable_ops - Cable alternate mode operations vector
  * @enter: Operations to be executed with Enter Mode Command
-- 
2.51.1


