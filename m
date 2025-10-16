Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458EFCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 02:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AlMiAnu04or0UGQaGW/qka23taZ4VUW7EHDn8WHbWS4=; b=JG6vYV2JO9qi7cz8oPNHGXMg9y
	LdhIVt/njv/NSQeYMZWd3VjGzqB8oVKrBSupzYAct0WYTNDv/CjuE14YFXXxdie5adFf6A/GlK66+
	OWVIIikfUFszSWXJuQcXlfBwmsmndHAG6rInz/gayvfsh5oGb0hkhdZNar9tucDUSf4P85CRJGfqe
	IwtHeg1nRk4IEXAs6lvjHvhFUVmwmS6qwZfNef0yQ1vriuKC3wlem0CCF2aqREt+cL1gZt0aEU5FF
	m9JRMo+5uNJXCxWn4qOZ7+BAszXy/ceq49NGYUIOLIsstrqRseVRa+IEubDH0h/LoEHg4Jzaem7LF
	JMsLKOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djq-00000003H6n-0KfF;
	Thu, 16 Oct 2025 02:29:10 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Djh-00000003GoF-1j6e;
	Thu, 16 Oct 2025 02:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1760581685;
	bh=AlMiAnu04or0UGQaGW/qka23taZ4VUW7EHDn8WHbWS4=;
	h=From:To:Subject:Date:Message-Id;
	b=AlmgcnNf+6Jr2DEE93Q0uHPxkcmt8CeMZmM9YDqtbZJNAEw0TBCL78Jh6ThH5Ato4
	 747AkIBvaRcWF1vVe2W0bHsL3dtKVC5zGy5DLTxmWNrQMejpYWu6ykgUyiTU6PmBt4
	 4HkHrFlDxlZ5v5FqXpWKKM4G5KghCGe8EI3kV31Y=
X-QQ-mid: zesmtpgz1t1760581683t6699f087
X-QQ-Originating-IP: dRL8Fgzddpf7C4ifv6ilM/yZbCupdu3op2UO1npiUEE=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 16 Oct 2025 10:28:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4592435285348485794
From: Chaoyi Chen <kernel@airkyi.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/8] usb: typec: Add default HPD device when register DisplayPort altmode
Date: Thu, 16 Oct 2025 10:27:34 +0800
Message-Id: <20251016022741.91-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251016022741.91-1-kernel@airkyi.com>
References: <20251016022741.91-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: MTR5disOECbF/ByToAPNP2UrXg6cDnFUTI+NVksj7kNjqThsKexi0UQy
	AgOxK0WESjaZE+VaJpExdGjjKX7OQOza5gJ14rBIv9+JvDOqgvqRGLXv9N/RCbszERezTKc
	9Kp8aJ0OiyVRnwKxMbAuiNYKJMDLITrwwtNAeRMmi9Syc0lqxosxbcNSHPbV+yHTxL98ABe
	+e5B3QE7VrizqeCrS+m41oaXyWLpG50rhdaHUvC8SYyzTp4byCJfeCuzgHFnoHFH6s4NHBr
	7Eb2tNFnj/a6GglFUYvdWkI5AZ2qwW8Jtr1nOKps/0MMuMzVZ+CQbYo6+wDA4nOHIhyWNGV
	zd6Pzxg9FVioabciqrLExHWCSN/UCzzADcONluBdpkxpAKyOWDXzDDYnIJAe5Jx9O4vVT0h
	867xug0bpMmqNW8DF+s7fR4iXfy0DLbEer+4f/er2/cd2fe7ZXfZaoE/ZKRoMV4/f05iiMl
	FDvl69mwMp32r2ZsQW8W8zxhm478V439xhEinK2ZKVxfXb9i1I8dwiA/Dkob9VIiGxRo8/y
	O9XZJnBL9O4BLdYGdeVnna4DpTqVtC/yRY1VFODmES5zZgfXmFQeB+bNxQOTCBzALzrdDTE
	6BGu0WmA4gV6VG+I27dxsKYXJGkzTiPjDRS13E8F+RTRSBZkLm9+BXOlPI+My1ZmJgNvoSI
	37yJT+IpKNh4cQ1MBcikRttpBsJHlbphfd0nw361mybnBl9YROwukcAqm1fuA0bkj6VHxD5
	dVDdEwo3+zzAd81CwyW8oUx9/C7k1LaJpVzalU3OJHyhJFd+O5YQGH7G0w/IJ7/lEoKcS5F
	+a/1VWfaMNiZrOaxMHvFyzl/4t27DhDvyNcmrFK8zkNBqEmXnC0IcjrA87+yplE4pGLfqZ8
	Z2dYA9gOpG8229fE/D1c82kQ0sG6AejeS64u9e0yl9n56M6RDghRhgwVolr4B1sUOw6fNL5
	KxzdSSjknl7SzXhvAGqprwVuefkc3rv8J7g8ErLBlzj+ph2JD3c7ik4QyfygB3uyfhTwsYa
	wz2WOyjlKsHbVdnsUQ
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_192901_965309_C9C7D70D 
X-CRM114-Status: GOOD (  16.60  )
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

Add default DRM AUX HPD bridge device when register DisplayPort
altmode. That makes it redundant for each Type-C driver to implement
a similar registration process in embedded scenarios.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v6:
- Fix depend in Kconfig.

Changes in v5:
- Remove the calls related to `drm_aux_hpd_bridge_notify()`.
- Place the helper functions in the same compilation unit.
- Add more comments about parent device.

 drivers/usb/typec/Kconfig         |  2 ++
 drivers/usb/typec/class.c         | 26 ++++++++++++++++++++++++++
 include/linux/usb/typec_altmode.h |  2 ++
 3 files changed, 30 insertions(+)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 2f80c2792dbd..a6730fbb576b 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -2,6 +2,8 @@
 
 menuconfig TYPEC
 	tristate "USB Type-C Support"
+	depends on DRM || DRM=n
+	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE && OF
 	help
 	  USB Type-C Specification defines a cable and connector for USB where
 	  only one type of plug is supported on both ends, i.e. there will not
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..e9d7772d1a8f 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -8,14 +8,18 @@
 
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/usb/pd_vdo.h>
+#include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_mux.h>
 #include <linux/usb/typec_retimer.h>
 #include <linux/usb.h>
 
+#include <drm/bridge/aux-bridge.h>
+
 #include "bus.h"
 #include "class.h"
 #include "pd.h"
@@ -538,6 +542,21 @@ const struct device_type typec_altmode_dev_type = {
 	.release = typec_altmode_release,
 };
 
+static void dp_altmode_hpd_device_register(struct typec_altmode *alt)
+{
+	if (alt->svid != USB_TYPEC_DP_SID)
+		return;
+
+	/*
+	 * alt->dev.parent->parent : USB-C controller device
+	 * alt->dev.parent         : USB-C connector device
+	 */
+	alt->hpd_dev = drm_dp_hpd_bridge_register(alt->dev.parent->parent,
+						  to_of_node(alt->dev.parent->fwnode));
+	if (IS_ERR(alt->hpd_dev))
+		alt->hpd_dev = NULL;
+}
+
 static struct typec_altmode *
 typec_register_altmode(struct device *parent,
 		       const struct typec_altmode_desc *desc)
@@ -600,6 +619,13 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	/*
+	 * It is too late to register the HPD device when the DisplayPort
+	 * altmode device becomes ready. If the current altmode is DP,
+	 * register a static HPD device.
+	 */
+	dp_altmode_hpd_device_register(&alt->adev);
+
 	return &alt->adev;
 }
 
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..acb0af1b9d5d 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -21,6 +21,7 @@ struct typec_altmode_ops;
  * @desc: Optional human readable description of the mode
  * @ops: Operations vector from the driver
  * @cable_ops: Cable operations vector from the driver.
+ * @hpd_dev: HPD device for DisplayPort
  */
 struct typec_altmode {
 	struct device			dev;
@@ -32,6 +33,7 @@ struct typec_altmode {
 	char				*desc;
 	const struct typec_altmode_ops	*ops;
 	const struct typec_cable_ops	*cable_ops;
+	struct device			*hpd_dev;
 };
 
 #define to_typec_altmode(d) container_of(d, struct typec_altmode, dev)
-- 
2.49.0


