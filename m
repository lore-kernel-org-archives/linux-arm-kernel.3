Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E789BC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zKxSsCzPd9u4xpd7kmKpWDs7KnLnF8iUPkHfPwwlEy8=; b=bwkJr3M2mk/IcWHy7PDKlI6SXR
	IIMxSlABhlG6IY6fDsGfq6e+lo9gUGVTKpftRPrMFJofqMJY+GXS4lSeeMTyOji1lbV6StT255Cy+
	oqzJw3sznWofe6KwuRGe77WNsYz9Zh8uVQ1PATF724KCNktDzVHSEwZuNEd9mrWMJ/nM0BIb6drNI
	g0zgqzgLYPdLefgL9YY1CVzPVGn4sgR7zpNbfU6BSX0zxP1EAFxu1mPG/bQivHFc6KM/lqWoCVp0a
	EL5t5gDOt3OaFMqozvCg1OIDz7Bcthb7ycRV4a46ebJyG7DCWD/BiRrccQFeltD7o6zuzd0Df7WMA
	EQHMnICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhPf-00000005o8k-4BNF;
	Sat, 10 May 2025 10:26:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDhNb-00000005nev-3pNa;
	Sat, 10 May 2025 10:24:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso13416875e9.3;
        Sat, 10 May 2025 03:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746872666; x=1747477466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zKxSsCzPd9u4xpd7kmKpWDs7KnLnF8iUPkHfPwwlEy8=;
        b=CeCxllOd6hr0ksKBxPRyEHjEwK/ZWKYJgtjeLRQXSn6AmlLIDxsYSlCcl8EGABaS0t
         VRxsXxE8oEK+Bt7yYw2NULN8sdQlK30pfklhvYHtdfi951cB7kh/5446wG+KJtuqYe/m
         TV756K1P0xkzFwxo3VU5+h3n3NV9VC7ilvBufrgPXgp5QlsdBCCvpNVIbnLV/9WnPNpK
         0zXEz2hsZuof+AaXn2ecdZtxuaxDbKA1A7TdovVdFPpYFjJkp6He9fhCOP97SV3ZeA8n
         WCo0WND9zCrG/USESGLVJD5q43yp8GtrrpTHhtD8+TUMvQCntpTnVJQbaM1jWNvUdx44
         FBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746872666; x=1747477466;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKxSsCzPd9u4xpd7kmKpWDs7KnLnF8iUPkHfPwwlEy8=;
        b=fOAVqDFqGyoLaVEQOUsVHJi1KpitJvMQRQeOFQyNqhKJ234CVq/fcOFcB7qiYkdGJ2
         /XUpxy4S9IZkRF2VIDIriEtrkeZbOb8d89WG6n1/gQbkQNArG8Gp19fOVoJ2/JMlFJHd
         Xuwqi7wwJG1V9YCTvOqj5GiFgU3/+jJNH1QTbjlwpH90oukdP5bceMmZFh9fhJB4baBh
         4XJwb9NynuoVnWJsgpfFRThSHVeiRyna9Ni4ewJo/w1oEi1WXXO1h4NdO1pWEK4jK2ZL
         hszbPXzxxCsoMq+mYRD5enq1qyS0Zn/i6DvAjEpTSGNzqt+7R33roQTIBMC0yZ+BvnO8
         gRWw==
X-Forwarded-Encrypted: i=1; AJvYcCX152Gi8aDP+Yi37uIKK+DgE8eMxqI6aaXcQKvG0xfKXEQoAsCV4TIA78vilOiUqxdGOZqZNgfzFLNGN0UsKvM=@lists.infradead.org, AJvYcCX9trmc0rmC+AdK3g0V4EgBJ+Eh8seLHVTH83qfztbQlqbOo0HnVxBThwfoQFf84H7NWJnBc4SSMVLeXN4VoyQL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2FMAoWP2oBkeaKAwnRMZHnOIb6y8uGip6NbWePKc0bE0R2zyT
	WdeQS5kuuhPH5c0CfkLQa1Ugkl3t28bAueWgEguBb4UeGC9YnPkJ
X-Gm-Gg: ASbGncuPddWS/1lKUMzOoE3CyMKcFl0Sbh5a9/LWxMWfP5+Y2b6oERIiLHkRMMpjgqz
	oU9Wj8klD+rxQJgU9HMIOj3cqUAUOZ7Kt8OerDltMcEgEBsNtnLsfO0skCE4zxnMx6QiGkHBb0t
	gogE6U7IJAVjIwyBkCKJRtl9+Vx4g4xHLZce+uWj0x5oxTIhJL4GwtDw8hKseg9XCI4XSjFM6ZL
	syCSEERv6KQdNmiWmFNhA1RANKzCR0GKdc4eR5eYL1NpyaDdeeOzsASZi5BORYDsrCnLKSF8yLo
	J+ykiaf06ei7TAH1qQtLU+HYhEXDAaQpDUVqocdCvY2+UYeab5oBtS0DmUPbNIillCMAK0ZYa0Q
	rrje0We8Nw7nzRHmeAEsi
X-Google-Smtp-Source: AGHT+IER7aYGVjZvmxZddHRM9lepgv9quMoiGYDbNTLn8P/0KGg+V5JhDH8HVNHzudh0XVsJecAxFA==
X-Received: by 2002:a05:600c:528e:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-442d6d19253mr56581905e9.4.1746872665475;
        Sat, 10 May 2025 03:24:25 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442d67df639sm57981265e9.13.2025.05.10.03.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:24:25 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH v3 00/11] net: pcs: Introduce support for fwnode PCS
Date: Sat, 10 May 2025 12:23:20 +0200
Message-ID: <20250510102348.14134-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_032427_959474_FDCFBA02 
X-CRM114-Status: GOOD (  26.51  )
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

This series introduce a most awaited feature that is correctly
provide PCS with fwnode without having to use specific export symbol
and additional handling of PCS in phylink.

There is currently an equivalent series for this feature where
a wrapper implementation is proposed. I honestly don't really like
introducing layer of layer of wrapping to workaround stuff, so
this is my attempt at giving a more direct approach to this.

---
First the PCS fwnode:

The concept is to implement a producer-consumer API similar to other
subsystem like clock or PHY.

That seems to be the best solution to the problem as PCS driver needs
to be detached from phylink and implement a simple way to provide a
PCS while maintaining support for probe defer or driver removal.

To keep the implementation simple, the PCS driver devs needs some
collaboration to correctly implement this. This is O.K. as helper
to correctly implement this are provided hence it's really a matter
of following a pattern to correct follow removal of a PCS driver.

A PCS provider have to implement and call fwnode_pcs_add_provider() in
probe function and define an xlate function to define how the PCS
should be provided based on the requested interface and phandle spec
defined in fwnode (based on the #pcs-cells)

fwnode_pcs_get() is provided to provide a specific PCS declared in
fwnode at index.

A simple xlate function is provided for simple single PCS
implementation, fwnode_pcs_simple_get.

A PCS provider on driver removal should first call
fwnode_pcs_del_provider() to delete itself as a provider and then
release the PCS from phylink with phylink_release_pcs() under rtnl
lock.

---
Second PCS handling in phylink:

We have the PCS problem for the only reason that in initial
implementation, we permitted way too much flexibility to MAC driver
and things started to deviate. At times we couldn't think SoC
would start to put PCS outside the MAC hence it was OK to assume
they would live in the same driver. With the introduction of
10g in more consumer devices, we are observing a rapid growth
of this pattern with multiple PCS external to MAC.

To put a stop on this, the only solution is to give back to phylink
control on PCS handling and enforce more robust supported interface
definition from both MAC and PCS side.

It's suggested to read patch 0003 of this series for more info, here
a brief explaination of the idea:

This series introduce handling of PCS in phylink and try to deprecate
.mac_select_pcs.

Phylink now might contain a linked list of available PCS and
those will be used for PCS selection on phylink_major_config.

MAC driver needs to define pcs_interfaces mask in phylink_config
for every interface that needs a dedicated PCS.

These PCS needs to be provided to phylink at phylink_create time
by setting the available_pcs and num_available_pcs in phylink_config.
A helper to parse PCS from fwnode is provided
fwnode_phylink_pcs_parse() that will fill a preallocated array of
PCS. (the same function can be used to get the number of PCS
defined in DT, more info in patch 0005)

phylink_create() will fill the internal PCS list with the passed
array of PCS. phylink_major_config and other user of .mac_select_pcs
are adapted to make use of this new PCS list.

The supported interface value is also moved internally to phylink
struct. This is to handle late removal and addition of PCS.
(the bonus effect to this is giving phylink a clear idea of what
is actually supported by the MAC and his constraint with PCS)

The supported interface mask in phylink is done by OR the
supported_interfaces in phylink_config with every PCS in PCS list.

PCS removal is supported by forcing a mac_config, refresh the
supported interfaces and run a phy_resolve().

PCS late addition is supported by introducing a global notifier
for PCS provider. If a phylink have the pcs_interfaces mask not
zero, it's registered to this notifier.

PCS provider will emit a global PCS add event to signal any
interface that a new PCS might be avialable.

The function will then check if the PCS is related to the MAC
fwnode and add it accordingly.

A user for this new implementation is provided as an Airoha PCS
driver. This was also tested downstream with the IPQ95xx QCOM SoC
and with the help of Daniel also on the various Mediatek MT7988
SoC with both SFP cage implementation and DSA attached.

Lots of tests were done with driver unbind/bind and with interface
up/down also by adding print to make sure major_config_fail gets
correctly triggered and reset once the PCS comes back.

The dedicated commits have longer description on the implementation
so it's suggested to also check there for additional info.

---

Changes v3:
- Out of RFC
- Fix various spelling mistake
- Drop circular dependency patch
- Complete Airoha Ethernet phylink integration
- Introduce .pcs_link_down PCS OP
Changes v2:
- Switch to fwnode
- Implement PCS provider notifier
- Better split changes
- Move supported_interfaces to phylink
- Add circular dependency patch
- Rework handling with indirect addition/removal and
  trigger of phylink_resolve()

Christian Marangi (11):
  net: phylink: keep and use MAC supported_interfaces in phylink struct
  net: phy: introduce phy_interface_copy helper
  net: phylink: introduce internal phylink PCS handling
  net: phylink: add phylink_release_pcs() to externally release a PCS
  net: pcs: implement Firmware node support for PCS driver
  net: phylink: support late PCS provider attach
  dt-bindings: net: ethernet-controller: permit to define multiple PCS
  net: phylink: add .pcs_link_down PCS OP
  net: pcs: airoha: add PCS driver for Airoha SoC
  dt-bindings: net: pcs: Document support for Airoha Ethernet PCS
  net: airoha: add phylink support for GDM2/3/4

 .../bindings/net/ethernet-controller.yaml     |    2 -
 .../bindings/net/pcs/airoha,pcs.yaml          |  112 +
 drivers/net/ethernet/airoha/airoha_eth.c      |  138 +
 drivers/net/ethernet/airoha/airoha_eth.h      |    3 +
 drivers/net/ethernet/airoha/airoha_regs.h     |   12 +
 drivers/net/pcs/Kconfig                       |   14 +
 drivers/net/pcs/Makefile                      |    2 +
 drivers/net/pcs/core.c                        |  241 ++
 drivers/net/pcs/pcs-airoha.c                  | 2920 +++++++++++++++++
 drivers/net/phy/phylink.c                     |  287 +-
 include/linux/pcs/pcs-provider.h              |   41 +
 include/linux/pcs/pcs.h                       |  104 +
 include/linux/phy.h                           |    5 +
 include/linux/phylink.h                       |   14 +
 14 files changed, 3867 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/pcs/airoha,pcs.yaml
 create mode 100644 drivers/net/pcs/core.c
 create mode 100644 drivers/net/pcs/pcs-airoha.c
 create mode 100644 include/linux/pcs/pcs-provider.h
 create mode 100644 include/linux/pcs/pcs.h

-- 
2.48.1


