Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64F3CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3axxsyw7wtlGRfvsiPJsqxcDDxIPl8NIx62QZHxhcs=; b=mHRuVTpDN+pZhplOC/736W4Ym1
	78olYAw0Dk7UiJ2MSWbDjWSUMq277w9kwkWkfj0XBkkJII0D3R2oW3a4QMa4Usd0KwjHZE4fgAYr6
	Bl/XW6yRih+4GlIQk3IE0YHxIz/6H62TWb8wUaBF18yao14F6PEPGF9/3tRGyitB11agCruJ3UBiQ
	ynFk621NzI+7ti61yCoePe8imGtjzO/89/OXHWg7xE58tCIb7gdQ/KHAw5sWAwZoGo2WWgIQdCBAs
	s5br++nYz5yn5v88lWHGiMd2SsLCdy5e6R4a+u7DdP6rJygArKJRPiMCfqyCq7Ivqu2A81mS4f5rt
	7cPHWUtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFL6-00000006xPD-1XMW;
	Fri, 09 Oct 2026 18:29:04 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFL3-00000006xKF-1evm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b060ec084so72595f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570539; x=1792175339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3axxsyw7wtlGRfvsiPJsqxcDDxIPl8NIx62QZHxhcs=;
        b=OFJBxOZoCk9ubq4DA+SynKCOXcPxKSttRX38oPcL8H+xabwcEzs703f2GEdHolGP5b
         vMpmmb8SLZ1x68FO3dl3HIODpOJ0oEIzpn+SbcwQWBowuvxKV69fdmFfkJTOXXBGTkvf
         gw6OKakccuJQqnBhkuec6Qimv9QDMfot+4ZQ+jAf5WkMHXUCtcHYogBo1jhMgba6ETEK
         vqE6XeLmPCL8u3HN7MTGo8dTqtLrVtWkoApcwd+qjuQJhizwfozN6mNUbCNQIBehNfUy
         HWslFBqyK0NVX8wVpT2D9o8HSYqJHKmU4fLJ3v8roPTZupAybH5m256/sYYfvJ8xemOb
         suMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570539; x=1792175339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3axxsyw7wtlGRfvsiPJsqxcDDxIPl8NIx62QZHxhcs=;
        b=2HTK8SB/ICUKdal/KKsqGew69PyVUtGEVW3SeUj83rPawYz8fV1VPuKP3oi7vhPCJR
         IojiB7jMzpHTg9VzSyn+uhhvXuhd8LByLzQfV5kpAo4f6Fj2zWTQ/QA+mw2/14TzeBCr
         uk6+9grOSP/emWWNZVNEj4RfF2C80OfXcgxfl5wJfqzFkKmqSkmKxmG25ps1QNW4RDex
         hsPKMDuNUKJMwK7S6DSkm+qRI3tZ4BJ5KOhOOOtr2yB897FnAmg95QY9hNqiTSraMPk+
         kjMCK5DJGxYxA+NeV5LF39CB4nyFR3lzxwlMzuSU9XzO5pcV3/NtBGMvINsdoPSNtcdC
         uJMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxhjC19+4Mgm6iigAZvb7aoTzrq6Skg9xI00Tz7DsiU1AiY84uRr50clJZpGa25IXYN7uqEhkMpMjnCWH7XmQa@lists.infradead.org
X-Gm-Message-State: AFq9FYIdIq14idZN+o9xQ9kBFI/XXZOIOOSWF6Olbk6nNWN++aUUWzh7
	Oc2cWYIKDTcJqHmgrhi8NYEpXzNGkDqTsnxQIJEfZUdwX4zpiKfyEr/p
X-Gm-Gg: AYBFou3mQbzbI7ED63ZjwqPdOxYhvTjcRGEKHkpjfYRW7z03NUJLq4ftZtDGWf00hCY
	haND8z/afhN8Msjn5wG9ShOI2YZR5g5K7fj53jn/luGFWsjOTzELM2Ydt5MsuyQxw5WPKTuWLpt
	q6DkbNiC3KqgQGTjGy1Gz2LyibmGtJkZlAeepMK3cUGZCUBgowpKiwASOp129ayJ5cdn2u51Byc
	iBhsYFgznvu5yokPuXtYn7oTeC2aonOaBK87GS3M0kTzfqFPxQrgDjhD+7IxGAckbchPTJ9fOu8
	GL/lOW7K2/d/vncqZkIyhv3lc1kRTFYKQNJtw/iEH2/JHc4q7CTfsQ4JHZOheOkX6l8Q8qFaCPR
	8L7vxLPwtPMtej2sCPitOub8gTFAQtlR4U/TjjXPzjRpF/1xdYsx8MtJp8Q1EVNkhE8c+KE9Tud
	ignGY4aAFp7SAu0fbPwz++cyscTBHS3ykaZQTYSBoYuJUgNB57qUT2zF+HsjGj4A5RS4Me/2pHP
	PUGdbO3UE0w5AlZChUH1baLsT3l+e4tyYNXfsu+xYlc0DSpHojkjLBy8WXJZ1g48l/2ry8I5sMb
	ccgfryoRNbTviXK2TQ==
X-Received: by 2002:adf:f302:0:b0:48b:d17:139c with SMTP id ffacd0b85a97d-48dbacf70a2mr3704273f8f.51.1791570539274;
        Fri, 09 Oct 2026 11:28:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:28:58 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH net-next v18 03/12] net: pcs: implement Firmware node support for PCS driver
Date: Fri,  9 Oct 2026 20:27:59 +0200
Message-ID: <20261009182836.50631-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112901_610392_51C65410 
X-CRM114-Status: GOOD (  32.24  )
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

Implement the foundation of Firmware node support for PCS driver.

To support this, implement a simple Provider API where a PCS driver can
expose multiple PCS with an xlate .fwnode_xlate function.

PCS driver will have to call fwnode_pcs_add_provider() and pass the
firmware node pointer and a xlate function to return the correct PCS for
the passed #pcs-cells.

This will register the PCS in a global list of providers so that
consumer can access it.

The consumer will then use fwnode_pcs_get() to get the actual PCS by
passing the firmware node pointer and the index for #pcs-cells.

For a simple implementation where #pcs-cells is 0 and the PCS driver
expose a single PCS, the xlate function fwnode_pcs_simple_xlate() is
provided.

For an advanced implementation a custom xlate function is required.

On removal the PCS driver must delete itself from the provider list
using fwnode_pcs_del_provider().

A devm variant devm_fwnode_pcs_add() is provided to automate the release
procedure.

Generic functions fwnode_phylink_pcs_count() and fwnode_phylink_pcs_parse()
are provided for MAC driver that will declare PCS in DT (or ACPI).

Function fwnode_phylink_pcs_count() will parse "pcs-handle" property and
will return the number of PCS entries described in the passed firmware
node.

Function fwnode_phylink_pcs_parse() will parse "pcs-handle" property and
fill the passed available_pcs array with the available PCS found up to
passed num_pcs value. It's worth to mention that this function will ignore
PCS that still needs to be probed (returning -ENODEV) and such PCS won't be
added to the available_pcs array.

Co-developed-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/Kconfig          |   6 +
 drivers/net/pcs/Makefile         |   1 +
 drivers/net/pcs/pcs.c            | 245 +++++++++++++++++++++++++++++++
 include/linux/pcs/pcs-provider.h |  70 +++++++++
 include/linux/pcs/pcs.h          |  74 ++++++++++
 5 files changed, 396 insertions(+)
 create mode 100644 drivers/net/pcs/pcs.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
index e417fd66f660..ba2caec866a5 100644
--- a/drivers/net/pcs/Kconfig
+++ b/drivers/net/pcs/Kconfig
@@ -5,6 +5,12 @@
 
 menu "PCS device drivers"
 
+config FWNODE_PCS
+	bool "PCS Firmware Node"
+	depends on ACPI || OF || COMPILE_TEST
+	help
+	  Firmware node PCS accessors
+
 config PCS_XPCS
 	tristate "Synopsys DesignWare Ethernet XPCS"
 	select PHYLINK
diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
index 4f7920618b90..3005cdd89ab7 100644
--- a/drivers/net/pcs/Makefile
+++ b/drivers/net/pcs/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Makefile for Linux PCS drivers
 
+obj-$(CONFIG_FWNODE_PCS)	+= pcs.o
 pcs_xpcs-$(CONFIG_PCS_XPCS)	:= pcs-xpcs.o pcs-xpcs-plat.o \
 				   pcs-xpcs-nxp.o pcs-xpcs-wx.o
 
diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
new file mode 100644
index 000000000000..39550d9a12a2
--- /dev/null
+++ b/drivers/net/pcs/pcs.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/mutex.h>
+#include <linux/property.h>
+#include <linux/phylink.h>
+#include <linux/pcs/pcs.h>
+#include <linux/pcs/pcs-provider.h>
+
+MODULE_DESCRIPTION("PCS library");
+MODULE_AUTHOR("Christian Marangi <ansuelsmth@gmail.com>");
+MODULE_LICENSE("GPL");
+
+struct fwnode_pcs_provider {
+	struct list_head link;
+
+	struct fwnode_handle *fwnode;
+	struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+					    void *data);
+
+	void *data;
+};
+
+static LIST_HEAD(fwnode_pcs_providers);
+static DEFINE_MUTEX(fwnode_pcs_mutex);
+
+struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
+					    void *data)
+{
+	return data;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_simple_xlate);
+
+struct fwnode_pcs_provider *
+fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+							    void *data),
+			void *data)
+{
+	struct fwnode_pcs_provider *pp;
+
+	if (!fwnode)
+		return ERR_PTR(-EINVAL);
+
+	pp = kzalloc_obj(*pp);
+	if (!pp)
+		return ERR_PTR(-ENOMEM);
+
+	pp->fwnode = fwnode_handle_get(fwnode);
+	pp->data = data;
+	pp->fwnode_xlate = fwnode_xlate;
+
+	mutex_lock(&fwnode_pcs_mutex);
+
+	list_add(&pp->link, &fwnode_pcs_providers);
+	fwnode_dev_initialized(fwnode, true);
+
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	pr_debug("Added pcs provider from %pfwf\n", fwnode);
+
+	return pp;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_add_provider);
+
+void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
+{
+	if (IS_ERR_OR_NULL(pp))
+		return;
+
+	mutex_lock(&fwnode_pcs_mutex);
+
+	list_del(&pp->link);
+	fwnode_dev_initialized(pp->fwnode, false);
+
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	fwnode_handle_put(pp->fwnode);
+	kfree(pp);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_del_provider);
+
+static void devm_fwnode_pcs_del(struct device *dev, void *res)
+{
+	struct fwnode_pcs_provider *pp = *(struct fwnode_pcs_provider **)res;
+
+	fwnode_pcs_del_provider(pp);
+}
+
+struct fwnode_pcs_provider *
+devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
+			     struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+								 void *data),
+			     void *data)
+{
+	struct fwnode_pcs_provider **ptr, *pp;
+
+	ptr = devres_alloc(devm_fwnode_pcs_del, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	pp = fwnode_pcs_add_provider(fwnode, fwnode_xlate, data);
+
+	if (!IS_ERR(pp)) {
+		*ptr = pp;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return pp;
+}
+EXPORT_SYMBOL_GPL(devm_fwnode_pcs_add_provider);
+
+static int fwnode_parse_pcsspec(const struct fwnode_handle *fwnode,
+				int index, const char *name,
+				struct fwnode_reference_args *out_args)
+{
+	if (!fwnode)
+		return -EINVAL;
+
+	if (name) {
+		index = fwnode_property_match_string(fwnode, "pcs-names",
+						     name);
+		if (index < 0)
+			return index;
+	}
+
+	return fwnode_property_get_reference_args(fwnode, "pcs-handle",
+						  "#pcs-cells", 0, index,
+						  out_args);
+}
+
+static struct phylink_pcs *
+__fwnode_pcs_get_from_pcsspec_provider(struct fwnode_reference_args *pcsspec,
+				       struct fwnode_pcs_provider *provider)
+{
+	if (provider->fwnode != pcsspec->fwnode)
+		return ERR_PTR(-EINVAL);
+
+	return provider->fwnode_xlate(pcsspec, provider->data);
+}
+
+static struct phylink_pcs *
+fwnode_pcs_get_from_pcsspec(struct fwnode_reference_args *pcsspec)
+{
+	struct fwnode_pcs_provider *provider;
+	struct phylink_pcs *pcs = NULL;
+
+	if (!pcsspec)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&fwnode_pcs_mutex);
+	list_for_each_entry(provider, &fwnode_pcs_providers, link) {
+		pcs = __fwnode_pcs_get_from_pcsspec_provider(pcsspec, provider);
+		if (!IS_ERR(pcs))
+			break;
+	}
+	mutex_unlock(&fwnode_pcs_mutex);
+
+	return !IS_ERR_OR_NULL(pcs) ? pcs : ERR_PTR(-ENODEV);
+}
+
+static struct phylink_pcs *__fwnode_pcs_get(const struct fwnode_handle *fwnode,
+					    unsigned int index, const char *con_id)
+{
+	struct fwnode_reference_args pcsspec;
+	struct phylink_pcs *pcs;
+	int ret;
+
+	ret = fwnode_parse_pcsspec(fwnode, index, con_id, &pcsspec);
+	if (ret)
+		return ERR_PTR(ret);
+
+	pcs = fwnode_pcs_get_from_pcsspec(&pcsspec);
+	fwnode_handle_put(pcsspec.fwnode);
+
+	return pcs;
+}
+
+struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned int index)
+{
+	return __fwnode_pcs_get(fwnode, index, NULL);
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_get);
+
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	struct fwnode_reference_args out_args;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		ret = fwnode_property_get_reference_args(fwnode, "pcs-handle",
+							 "#pcs-cells", 0, index,
+							 &out_args);
+		/* We expect to reach an -ENOENT error while counting */
+		if (ret)
+			break;
+
+		fwnode_handle_put(out_args.fwnode);
+		index++;
+	}
+
+	return index;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_count);
+
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs)
+{
+	unsigned int i, found = 0;
+
+	if (!available_pcs)
+		return -EINVAL;
+
+	if (!fwnode_property_present(fwnode, "pcs-handle"))
+		return -ENODEV;
+
+	for (i = 0; i < num_pcs; i++) {
+		struct phylink_pcs *pcs;
+
+		pcs = fwnode_pcs_get(fwnode, i);
+		if (IS_ERR(pcs)) {
+			/* Exit early if no PCS remain.*/
+			if (PTR_ERR(pcs) == -ENOENT)
+				break;
+
+			/*
+			 * Ignore -ENODEV error for PCS that still
+			 * needs to probe.
+			 */
+			if (PTR_ERR(pcs) == -ENODEV)
+				continue;
+
+			return PTR_ERR(pcs);
+		}
+
+		available_pcs[found] = pcs;
+		found++;
+	}
+
+	return found;
+}
+EXPORT_SYMBOL_GPL(fwnode_phylink_pcs_parse);
diff --git a/include/linux/pcs/pcs-provider.h b/include/linux/pcs/pcs-provider.h
new file mode 100644
index 000000000000..15c198ffdd58
--- /dev/null
+++ b/include/linux/pcs/pcs-provider.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_PROVIDER_H
+#define __LINUX_PCS_PROVIDER_H
+
+struct fwnode_pcs_provider;
+
+/**
+ * fwnode_pcs_simple_xlate - Simple xlate function to retrieve PCS
+ * @pcsspec: reference arguments
+ * @data: Context data (assumed assigned to the single PCS)
+ *
+ * Returns: the PCS pointed by data.
+ */
+struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
+					    void *data);
+
+/**
+ * fwnode_pcs_add_provider - Registers a new PCS provider
+ * @fwnode: Firmware node
+ * @fwnode_xlate: xlate function to retrieve the PCS
+ * @data: Context data
+ *
+ * Register and add a new PCS provider to the global providers list
+ * for the firmware node. The relevant PCS from the PCS provider
+ * is retrieved from the passed fwnode_xlate function.
+ *
+ * The xlate function MUST return a pointer to an existing, already-allocated
+ * struct phylink_pcs and MUST NOT dynamically allocate a new PCS.
+ * The same PCS object must be returned for a given firmware reference and args,
+ * as PCS pointer identity is used to associate PCS objects with their provider.
+ *
+ * Returns: A pointer to the registered PCS provider on success, or
+ * an ERR_PTR() encoded error code on failure.
+ */
+struct fwnode_pcs_provider *
+fwnode_pcs_add_provider(struct fwnode_handle *fwnode,
+			struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+							    void *data),
+			void *data);
+
+/**
+ * fwnode_pcs_del_provider - Removes a PCS provider
+ * @pp: PCS provider returned by fwnode_pcs_add_provider()
+ */
+void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp);
+
+/**
+ * devm_fwnode_pcs_add_provider - Registers a new PCS provider
+ * @dev: Device of the PCS provider
+ * @fwnode: Firmware node
+ * @fwnode_xlate: xlate function to retrieve the PCS
+ * @data: Context data
+ *
+ * Register and add a new PCS provider to the global providers list
+ * for the firmware node. The relevant PCS from the PCS provider
+ * is retrieved from the passed fwnode_xlate function. While at that, it
+ * also associates the device with the PCS provider using devres.
+ * On driver detach, release function is invoked on the devres data,
+ * then, devres data is freed.
+ *
+ * Returns: A pointer to the registered PCS provider on success, or
+ * an ERR_PTR() encoded error code on failure.
+ */
+struct fwnode_pcs_provider *
+devm_fwnode_pcs_add_provider(struct device *dev, struct fwnode_handle *fwnode,
+			     struct phylink_pcs *(*fwnode_xlate)(struct fwnode_reference_args *pcsspec,
+								 void *data),
+			     void *data);
+
+#endif /* __LINUX_PCS_PROVIDER_H */
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
new file mode 100644
index 000000000000..ef2134c578c7
--- /dev/null
+++ b/include/linux/pcs/pcs.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __LINUX_PCS_H
+#define __LINUX_PCS_H
+
+#include <linux/phylink.h>
+
+#if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * fwnode_pcs_get - Retrieves a PCS from a firmware node
+ * @fwnode: firmware node
+ * @index: index fwnode PCS handle in firmware node
+ *
+ * Get a PCS from the firmware node at index.
+ *
+ * Returns: a pointer to the phylink_pcs or a negative error pointer. Can
+ * return -ENODEV if the PCS is not present in global providers list (either
+ * due to driver still needs to be probed or it failed to probe/removed).
+ */
+struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
+				   unsigned int index);
+
+/**
+ * fwnode_phylink_pcs_count - Count PCS entries described in firmware node
+ * @fwnode: firmware node
+ *
+ * Helper function to count the number of PCS entries referenced by the
+ * "pcs-handle" property in a firmware node.
+ *
+ * Note that this function counts all PCS references in the firmware node,
+ * regardless of whether the corresponding PCS devices are already probed.
+ *
+ * Returns: number of PCS entries described in the firmware node.
+ */
+unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode);
+
+/**
+ * fwnode_phylink_pcs_parse - Parse available PCS from firmware node
+ * @fwnode: firmware node
+ * @available_pcs: pointer to preallocated array of PCS
+ * @num_pcs: maximum number of PCS entries to scan
+ *
+ * Helper function that parses PCS references from the "pcs-handle"
+ * property of a firmware node and fills @available_pcs with PCS that are
+ * currently available up to @num_pcs.
+ *
+ * Only PCS that are currently available are stored in @available_pcs.
+ * PCS that returns -ENODEV are skipped.
+ *
+ * Returns: number of PCS stored in @available_pcs, or negative error code.
+ */
+int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+			     struct phylink_pcs **available_pcs,
+			     unsigned int num_pcs);
+#else
+static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
+						 unsigned int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+
+static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
+{
+	return 0;
+}
+
+static inline int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
+					   struct phylink_pcs **available_pcs,
+					   unsigned int num_pcs)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* __LINUX_PCS_H */
-- 
2.55.0


