Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB81CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pSf0R7tWifC6OwsYwt6uP7ibjMLjaY8AWyTpXb94lXI=; b=CklPeko2CgFJFuKCTxRXecTbT5
	xzY57X7CbD9ybZ4qzhbGD465BfKheT2RoWa6hUteMuW119jInz5xN81R+rPkQI/4GjK4cQkE09zrh
	Ev8/Md44Y10o1p5xN3Tr88skLI+Eah5hPEp/UtDtoPv0NvnvpuYyqt49zvKWX766ZGCJ5kRwB9Ymy
	CbuKYLOqDVW+Kn58FHDpRtiUg6wfT01Pbw/7D5egeoB73QrYYrsXb9oWwitJ6HPQFDfaUTABq7c/r
	SEVi6AbK189LIa0jID7ne0nR9fhkA0KE1xAOAYiZFfylApYLMEafsU7CKfhcXquIlgHEIJWsZ2dXs
	BQqIDZfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8r-00000005sRI-4AzU;
	Tue, 09 Jun 2026 15:13:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWy8m-00000005sIc-1rmx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:13:22 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-bf84a2b2077so231982466b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781017999; x=1781622799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSf0R7tWifC6OwsYwt6uP7ibjMLjaY8AWyTpXb94lXI=;
        b=sUVXSfOXngcfczW7zbiDeP24F6YzIkhSw1DDQEvyTBhGAskaZwg8s+c8giWUfWUFg0
         m0+V1jPwTaVrcvY6FrhVM+Qfp0GbKXzUm7Gr2IY4hXgWeqWkgpu3hmXHP/9GS7sIERFP
         60uqayu/VNw6z2kUSk9OLrz0hjiM4JBLOgSSOLOsKfgTlPlscDCNnkmziG1XXgz1/U9v
         k4nNzNgx4BrDXfsx5mM8urIpHKwd7eZO1yqnboWaxSiQRQO9jKaEA6UR7k1kQpROqRwR
         E8kvuBe1vyE3A4TsF4EKB0Ks9EO+llB5u4wKrolDm0giRkrA7t4kYUYs5xuUP7NjNY/H
         QoPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017999; x=1781622799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pSf0R7tWifC6OwsYwt6uP7ibjMLjaY8AWyTpXb94lXI=;
        b=Y8ELVWJ2tiliEIxu2OguqWfJDTN+/fznBO1ZPpslvkKRpG/V6ee6Ca3u/TS637wdIQ
         n0s/IdarFoBvKeM/+XQyJpSoYucNmLGzV1c89R7hB0VSqnRULWTrg1qd00OoO5hHEXUB
         BTRsLS9mGLpBLKv1rA4ZICC7cj7nTj3W3OhAYUZp3J2np9MJ3eWTDSjx8ff12BZpfX3Z
         GCtU4rWVRKlBlFDSONcT/37GJDPKvPmx+zunxxIls4juotTjAHTlObZ8Nf/LGuWaEOJT
         I+dqeMVHrEfa+Mh94YBPBynJBFclL6o4B4iTzagWKk8tbiBf0z5Y02LUc2XSVvR9UfOg
         CXig==
X-Forwarded-Encrypted: i=1; AFNElJ/dbqlofqXVoaxJN4es4IAa3HWhCkoSInHntPileqSU4xQUZBO5HJaaNkpDrZmz6BONkLWUlq6kUJh4TiQHgpYO@lists.infradead.org
X-Gm-Message-State: AOJu0YwuB0JmCSh5NSJ7zrUoyz5nZQ9QvYoh3XxJjJL8YBkBaevFDSfY
	Ol4r6kiMUyxxIvnLbq9OWafzjz44LhnyNQlkf0sO9KoRiy00FugCxub7
X-Gm-Gg: Acq92OG/A/Sa9fL6mHnMHqMmIoy3aCkDz4TV0B0H373Hp2CkFgre6Sb9DJsZLRC1u+j
	plmL59b4uYt3RvBbaqhwit/r+MLn53UV3/yyl3IqQml37WhHc/H0lHYmjGCUqbXqNWPxm72AuIF
	BRB1NIJrIvxC/3JZyp7EcEEvVJqJSKFP91PzaSK1icRQOxhiOjMQuEOzOJMXbSTSWZnCHfjvXs3
	JWhZHIup7I8DT3J5l6dG6IoEvlvNu8+Mb5Vk7T/TpUm8xaCwJ9MEM1Kwu93keg79Hd/uz2p0/qE
	fvycADPAJLS5pJ4Zqc1C5cgQGrkQt2nIgB5wzULfaxU7lIiJLmaAoGF/QAB2c8rXUz8qZlCf1Sa
	HORHRS8WyDIsN0Gw6NS7MF7oJOysPEppW7ZItAPpC12VYKAEwdZXgyZeLsAoa/AOgX/fX1M2WLL
	KtRc77ugnPJVmrZfbbi5p9FFhsuZLSyhUp
X-Received: by 2002:a17:906:6a01:b0:bdb:a519:5677 with SMTP id a640c23a62f3a-bf371a55a97mr920359666b.16.1781017998468;
        Tue, 09 Jun 2026 08:13:18 -0700 (PDT)
Received: from Ansuel-XPS24 ([2.195.136.12])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-bf0517721e5sm1073637866b.9.2026.06.09.08.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:13:18 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v6 06/12] net: Document PCS subsystem
Date: Tue,  9 Jun 2026 17:12:02 +0200
Message-ID: <20260609151212.29469-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609151212.29469-1-ansuelsmth@gmail.com>
References: <20260609151212.29469-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_081320_700606_815E01F9 
X-CRM114-Status: GOOD (  36.13  )
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

Add extensive documentation of the new PCS subsystem and the fwnode
implementation with producer/consumer API.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/networking/index.rst |   1 +
 Documentation/networking/pcs.rst   | 228 +++++++++++++++++++++++++++++
 2 files changed, 229 insertions(+)
 create mode 100644 Documentation/networking/pcs.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 44a422ad3b05..3fce8f6ac089 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -28,6 +28,7 @@ Contents:
    net_failover
    page_pool
    phy
+   pcs
    sfp-phylink
    alias
    bridge
diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/pcs.rst
new file mode 100644
index 000000000000..9436ba43cebd
--- /dev/null
+++ b/Documentation/networking/pcs.rst
@@ -0,0 +1,228 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+PCS Subsystem
+=============
+
+The PCS (Physical Coding Sublayer) subsystem handles the registration and lookup
+of PCS devices. These devices contain the upper sublayers of the Ethernet
+physical layer, generally handling framing, scrambling, and encoding tasks. PCS
+devices may also include PMA (Physical Medium Attachment) components. PCS
+devices transfer data between the Link-layer MAC device, and the rest of the
+physical layer, typically via a serdes. The output of the serdes may be
+connected more-or-less directly to the medium when using fiber-optic or
+backplane connections (1000BASE-SX, 1000BASE-KX, etc). It may also communicate
+with a separate PHY (such as over SGMII) which handles the connection to the
+medium (such as 1000BASE-T).
+
+Remark on usage of .mac_select_pcs and fw_node PCS
+--------------------------------------------------
+
+There are generally two ways to look up a PCS device.
+
+1. MAC OP struct .mac_select_pcs (considered legacy)
+2. firmware node (fwnode) PCS entirely handled by phylink
+
+Implementation 1 leaves the entire handling of the PCS to the MAC
+driver with the selection of the PCS driven by .mac_select_pcs.
+Custom implementations are required if the PCS is external to the MAC
+and needs to be handled by a separate driver.
+
+This implementation is considered legacy and it's suggested to
+switch to the new fwnode PCS.
+
+Looking up PCS Devices (fwnode implementation)
+-----------------------------------------------
+
+The lookup of a PCS device follows the common producer/consumer implementation
+used by similar subsystem with a ``#pcs-cells`` on the producer and a
+``pcs-handle`` property on the consumer::
+
+    pcs: pcs {
+        // ...
+        #pcs-cells = <0>;
+    };
+
+    ethernet-controller {
+        // ...
+        pcs-handle = <&pcs>;
+    };
+
+On :c:func:`phylink_create`, phylink will use the ``num_available_pcs``
+value and ``fill_available_pcs`` helper function in
+:c:struct:`phylink_config` to compose the list of available PCS that can be
+used for the phylink instance.
+
+Phylink will then internally handle the selection of the correct PCS for
+the requested interface mode based on the interface modes configured in
+``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+A PCS is considered eligible when the requested interface mode is present
+in both ``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+``supported_interfaces`` describes all interface modes supported by the MAC,
+whereas ``pcs_interfaces`` identifies the subset that require PCS selection.
+
+For the special implementation where the PCS is internal or part of the MAC
+and a dedicated driver is not needed, it's possible to leave the implementation
+of the PCS to the MAC driver and just implement the ``num_available_pcs``
+value and ``fill_available_pcs`` helper  function in
+:c:struct:`phylink_config` referencing the local :c:struct:`phylink_pcs`
+struct allocated from the MAC driver.
+
+Using PCS Devices
+-----------------
+
+It's mandatory to either implement the ``mac_select_pcs`` callback
+of :c:struct:`phylink_mac_ops` or ``num_available_pcs`` and ``fill_available_pcs`` of :c:struct:`phylink_config` to use a PCS
+for a MAC.
+
+The fwnode implementation expose a simple helper to parse the PCS from
+the fwnode :c:func:`fwnode_phylink_pcs_parse`. The helper takes three arguments,
+the fwnode where the ``pcs-handle`` should be parsed, an allocated array
+of :c:struct:`phylink_pcs` pointer where to put the parsed PCS from the fwnode
+and a pointer to the maximum number of PCS to parse. The helper can also be used
+to obtain the number of PCS parsed (without filling the array) by passing
+``NULL`` for the second arg. In such case, the third arg will be set to the
+number of PCS parsed in the fwnode.
+
+A phylink instance may use multiple PCS devices. The maximum number is reported
+through ``num_available_pcs``.
+
+It's mandatory to specify for what interface a PCS is needed. This can be done
+by filling the ``pcs_interfaces`` in :c:struct:`phylink_config` struct.
+If the requested interface mode is not present in this bitmask, phylink does
+not search for a PCS for  that specific mode. (example MAC doesn't need a PCS
+for SGMII but require one for USXGMII)
+
+With the use of the :c:func:`fwnode_phylink_pcs_parse` a common implementation
+is the following::
+
+   static int mac_fill_available_pcs(struct phylink_config *config,
+   				                      struct phylink_pcs **available_pcs,
+   				                      unsigned int num_available_pcs)
+   {
+   	struct device *dev = config->dev;
+
+   	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+   					                    &num_available_pcs);
+   }
+
+   static int mac_setup_phylink(struct net_device *netdev)
+   {
+      struct phylink_config *config;
+
+      // ...
+
+      config->dev = &netdev->dev;
+
+      // ...
+
+      // Parse available PCS and fill num_available_pcs.
+      err = fwnode_phylink_pcs_parse(dev_fwnode(&netdev->dev), NULL,
+                                     &config->num_available_pcs);
+      if (err)
+         return err;
+
+      config->fill_available_pcs = mac_fill_available_pcs;
+
+      __set_bit(PHY_INTERFACE_MODE_INTERNAL, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_SGMII, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_1000BASEX, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->supported_interfaces);
+
+      // PCS required only for USXGMII
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->pcs_interfaces);
+
+      phylink = phylink_create(config, //...
+
+It's worth to mention that it's phylink code that takes care of allocating
+the array of :c:struct:`phylink_pcs` pointer for ``fill_available_pcs``
+callback based on the value set in ``num_available_pcs`` for
+:c:struct:`phylink_config` struct.
+
+The ``fill_available_pcs`` callback must not write more than
+``num_available_pcs`` entries. The third argument may be used to validate
+that there is enough space to fill all the available PCS in the passed array
+of :c:struct:`phylink_pcs` pointer.
+
+The ``fill_available_pcs`` callback is called only on :c:func:`phylink_create`
+and is used only to compose the initial available PCS list. Ownership of PCS
+is held by phylink and :c:func:`phylink_release_pcs` should be used to relase
+them.
+
+Writing PCS Drivers
+-------------------
+
+To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
+register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
+The :c:func:`fwnode_pcs_add_provider` takes three arg, the fwnode where the PCS
+provider should be registered to, a get function to return the requested PCS
+based on ``#pcs-cells`` and a pointer to reference private data for the get
+function.
+
+The PCS will then be registered to a global list of PCS provider that the
+PCS fwnode implementation will use to parse it.
+
+For the simple case where the PCS driver expose a single PCS,
+:c:func:`fwnode_pcs_simple_get` can be used as the get function.
+
+You must call :c:func:`fwnode_pcs_del_provider` from your remove function and
+release the PCS from any phylink instance under RTNL lock with
+:c:func:`phylink_release_pcs`::
+
+   fwnode_pcs_del_provider(dev_fwnode(&pdev->dev));
+
+	rtnl_lock();
+
+	for (i = 0; i < data->num_port; i++) {
+		struct pcs_port *port = &priv->ports[i];
+
+		phylink_release_pcs(&port->pcs);
+	}
+
+	rtnl_unlock();
+
+Late PCS registration handling
+------------------------------
+
+It's possible that a PCS becomes available after the MAC finished probing.
+Contrary to the usual producer/consumer implementation, when a PCS is not
+registered and can't be found, the fwnode parser helper returns ``-EINVAL``
+instead of ``-EPROBE_DEFER``.
+
+This is to prevent race condition with particular devices that register
+MAC and PCS with USB or PCIe and require the MAC to be registered before
+the PCS.
+
+The phylink logic correctly handle this special case and keep the phylink
+instance in a fail condition.
+
+The PCS fwnode implementation provides a notifier to which each phylink
+instance with a non-empty ``pcs_interfaces`` in :c:type:`phylink_config`
+registers. When a new PCS provider is registered, the notifier is called
+triggering the :c:func:`pcs_provider_notify` function.
+
+Function :c:func:`pcs_provider_notify` will check if the just added PCS
+should be used by the phylink instance. If it should be used then,
+it's added to the internal list of available PCS and a phylink major
+config is forced.
+
+If a phylink instance was in a failure state, with the just added PCS
+now part of the available PCS internal phylink list, provided all other
+conditions are satisfied, the configuration is retried and the failure
+condition is cleared.
+
+API Reference
+-------------
+
+.. kernel-doc:: include/linux/phylink.h
+   :identifiers: phylink_pcs
+
+.. kernel-doc:: include/linux/pcs/pcs.h
+   :internal:
+
+.. kernel-doc:: include/linux/pcs/pcs-provider.h
+   :internal:
-- 
2.53.0


