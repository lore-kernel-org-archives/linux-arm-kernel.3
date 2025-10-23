Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B06CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 03:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3Z+FuiRydfa9KXtfzUasAoRXAzbkbbUPpgJYhzIq0U=; b=A1dQOspqZbp6V48u/NGY+qKahT
	m+8xCrqqTlaAQSg3CNQqG8ZrP/ECyffg4EhLHJy6Z1Ydy43O8Ncd3XvwDTrj6XuJMfcAOxkMjc9m2
	eAn4coiwgiayNddAiFo96OQhddRguItQBC1OLd6y8+SLORZQ+6P3Y5uHZ7PAL9kjUxxRJUAc8uE7r
	weJg7fCOTqWBp0d5b0YysUpZFcvnwmgvpXsm4EKpH7UpI/usrs2qT5uiV3SQoYz8kgjEswnBpvpue
	OqJOyJIi8VWM5szSvc8Hhu6H90R58HFrA5nnZHr2PjMKopkodlveNBgVc5kwJ35gcVBRNMiP5t5YC
	4hwxmEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBm2i-00000004vtB-1bsl;
	Thu, 23 Oct 2025 03:31:12 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBm2e-00000004vjw-46st;
	Thu, 23 Oct 2025 03:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1761190228;
	bh=z3Z+FuiRydfa9KXtfzUasAoRXAzbkbbUPpgJYhzIq0U=;
	h=From:To:Subject:Date:Message-Id;
	b=fvQh5Rx/qOdUPwL/NmSRGR/O9HBASU/O5L60P0fi0XssvgAV+Y9TPUnGudA584Uxd
	 BbAhG5kwanEqIjneHVpoxEr5qcJ5Ih3idZVeqmdgGPD+b+gbmkv4/md71spaIdtdw2
	 ZCfpaeTMTENtbrIEacWHQlviev0pB0iumuS44X7s=
X-QQ-mid: esmtpsz16t1761190226t700443f6
X-QQ-Originating-IP: CR3cgQmOsWIwA9RJdPHoa1hKzkyO00I9vsk6MHfqamI=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 11:30:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8850868920315239972
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
Subject: [PATCH v7 1/9] usb: typec: Add notifier functions
Date: Thu, 23 Oct 2025 11:30:01 +0800
Message-Id: <20251023033009.90-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251023033009.90-1-kernel@airkyi.com>
References: <20251023033009.90-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: N9DIJtFs/avns4hvy0i9PlTO1llTc6+s5DYNrWvUUGtIy9BgBfmcWslQ
	1UTPV5mBaQDktx8W5kLRsCl6ibq5kbjHck7obp8QhRFSjAoZt6JUi7p5HQ7spXZN1mHCrJH
	QyNNHkC4cXqKg/ECqvNQ1sqgVJFCz92Eh+6mCtmcw261pLPHY1ZtRvE23Z/I0AKQ+bsSS7U
	o6ocUzGUDM65QCwpfGB4X7goi+A91idEFwsl2wp4Wan6sKZVtHqIaUr0K3MxqFgsi2jZIzs
	i9Q8RINJrcf86xyZxKDRl8rV2SBQAq61jPlPXwikXqyEZS1+cqHvkhB2+h/FSmC+YmefBMa
	2Z8Oy7+F3FvnRQhHa02kww/d6e6RoCQ4T4JF76FNkmGFqfvFHddrygNtIuysC4PUHSuIa4X
	9C14/2XdN86zzv9Qc9/BaqHGC1ubCpogMByZTZ/eGtr9T1r3DdKZFsdO0fpY4Tbm0urdmYc
	XIqjU11npO2M9c5O+yT1L2IN1SE6farad0FJHjhQirZOfY3wKlmaUfuPNQ9B9+KC5BeR3xt
	qVWzH6fQBFRl7cCHrWftcbUaxh8P37Gtrf7JHHa1bUuS9cbwiPG78Dxc1dBbirhvtouJhsy
	DfeC+uG9DauwTI0fcChRtD5NFEGFhs8YuPPIwrTVYfKA9o6gt8oOMLJH3uTzgO+iPhe7mvz
	N5w14N/RzoUcatyc0h4/R16/jl8ZaABi/OTyx7nUR4mKAtsaDrVqC9uHCDVadV+N+Kc/4+/
	YPkpvUER8desoALEvxl3iM/q27iHPd7/nFmXpjMlKUNJoDIjyIjkAC4Cej6omKYVpKgQJqs
	gbLKbX+VdJgTLbYNng2fGaeWFPuoDWESdlw13TW4sUWiqbXkH2el45gEeyh2r42yO5NRxzT
	yyibbI+hs6naBC7N7mXogZ29J0nAoHGJPaRZRI79XUaUlTSFgsMaw4RzlP3cGqAkhEieGGx
	Ofo0AhMtwH7dj5g+OrqhRspGpLlwc6T7KwICTwgiWatNvLnn5iWjDsHVtOXDc7Nl0zVE=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_203109_439408_5C4F2908 
X-CRM114-Status: GOOD (  15.66  )
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
 drivers/usb/typec/Makefile       |  2 +-
 drivers/usb/typec/class.c        |  3 +++
 drivers/usb/typec/notify.c       | 22 ++++++++++++++++++++++
 include/linux/usb/typec_notify.h | 17 +++++++++++++++++
 4 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/notify.c
 create mode 100644 include/linux/usb/typec_notify.h

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
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..11c80bc59cda 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -13,6 +13,7 @@
 #include <linux/string_choices.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_mux.h>
+#include <linux/usb/typec_notify.h>
 #include <linux/usb/typec_retimer.h>
 #include <linux/usb.h>
 
@@ -600,6 +601,8 @@ typec_register_altmode(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
+	typec_notify_event(TYPEC_ALTMODE_REGISTERED, &alt->adev);
+
 	return &alt->adev;
 }
 
diff --git a/drivers/usb/typec/notify.c b/drivers/usb/typec/notify.c
new file mode 100644
index 000000000000..4ae14dd1f461
--- /dev/null
+++ b/drivers/usb/typec/notify.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/notifier.h>
+#include <linux/usb/typec_notify.h>
+
+static BLOCKING_NOTIFIER_HEAD(typec_notifier_list);
+
+int typec_register_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_register_notify);
+
+int typec_unregister_notify(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&typec_notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(typec_unregister_notify);
+
+void typec_notify_event(unsigned long event, void *data)
+{
+	blocking_notifier_call_chain(&typec_notifier_list, event, data);
+}
diff --git a/include/linux/usb/typec_notify.h b/include/linux/usb/typec_notify.h
new file mode 100644
index 000000000000..a3f1f3b3ae47
--- /dev/null
+++ b/include/linux/usb/typec_notify.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __USB_TYPEC_NOTIFY
+#define __USB_TYPEC_NOTIFY
+
+#include <linux/notifier.h>
+
+enum usb_typec_event {
+	TYPEC_ALTMODE_REGISTERED
+};
+
+int typec_register_notify(struct notifier_block *nb);
+int typec_unregister_notify(struct notifier_block *nb);
+
+void typec_notify_event(unsigned long event, void *data);
+
+#endif /* __USB_TYPEC_NOTIFY */
-- 
2.49.0


