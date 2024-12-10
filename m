Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76698E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UocVRl+s36yfKdOwyD9w/O24SaGw6oRqRxZTrP2zIsQ=; b=CuknC/3pRTjZMfAeNqfi6C+uPz
	e9xbGG7Yn1hNlX6BI4ejoKVqbacI5TRsm0YNFrRa1nswVm0zkVjpUldI9YFlxLfjhWElbipZ2RYDM
	9Hml3UihrT7ougwGdL47PBl9rHgWVEY00onzr4qcch5NyB7oqDSjd3NPCL2tVwG7mWCnhKTS8vFVQ
	lEZyv/mGvAIfTzYbi/upXPvxoYvv2PMg3pvDRQWzHCvBFYzISEduhgXYtvGOyedZbbvTyyOdeIXjW
	Gy9dAp81B3hk+t0wN+Ms7PPNOmrwGPFxUbWIiWLV2/fgpO/KKT8NDQRUpM8QwlcROfLjMIII2z9oW
	W45r3Pqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwps-0000000AzV6-3lZe;
	Tue, 10 Dec 2024 09:47:20 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwoo-0000000AzCd-0itj;
	Tue, 10 Dec 2024 09:46:15 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5d414b8af7bso2160515a12.0;
        Tue, 10 Dec 2024 01:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733823972; x=1734428772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UocVRl+s36yfKdOwyD9w/O24SaGw6oRqRxZTrP2zIsQ=;
        b=LL/x3YO5AbAXJzfMbTtaFfRQjOy8tkGPTG6M9zSXbDIgbVlSJ9rAr37mxvbXGP4cUK
         9W8zgi2aly0MNeNp/9Ix/NHbBZrFQZzD++tTRh2UJvNL/x+SSW6aRCsWw63bS2W6vxq8
         ivqFo/e65JOrFON1+4mnF+vlQfsGDnBiVPwigj2Z0W4INuih2x7WQfzpJ1NiRRdC/4a1
         7MEFKj2HnewwKT8fk8wYyimJO3fBx/jgLzpxC/LG8J93t2PmldTLuKME2XPkqyInGxxF
         M259wj7c3IEO3fPlR3/mmlNc7rgpt/BsJ+86QTE8LKAjWL6eM5DjZnpxJp4IFplGgFlB
         mT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733823972; x=1734428772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UocVRl+s36yfKdOwyD9w/O24SaGw6oRqRxZTrP2zIsQ=;
        b=Tms/gqA4dJGCLQhMi/BwMfkS+QnfNvVQmZUvo8uIITe3EivCYIvSLvGWMEG9ZvYwnY
         qyC1lDNBJxuPkAIFCltddZxzL9VZNpo1llR3Cxnxl7iLQzl8pd+mBULB6sSkKvdfBB6N
         LNKnxmTJPOgn2z0oQXy71TEk2paNqwrE+uumnb142V2SEDJasTqlLSZORLq6Rg3Ova1o
         X8/cGU8lmQv0r2ZaB1IEGhDsYi+kbgwbhoj4J2TlHnfrTsF4H+ShZ9JCoSe6ZL+zapRa
         q5luUGkFX3cVtHY+TneTH16Y/QQgJwvlpndLHEAlsoTR1HANyrKaC6d/hq1Yem3p6QP/
         hD4g==
X-Forwarded-Encrypted: i=1; AJvYcCU+33UkUeFPzR9pWvGOakkhA3m5jXm+rD5WPeFLnyNRWNip2Ndb7S7RE7SYS6kR7DpVi81qzU//wQf0f2ydKSs=@lists.infradead.org, AJvYcCW0YdDxa7Y/RdpOMA9UaIu/jroQMqTuND6msXqEIZIK8QuXYP363QvnKbhvzN0RZyrw4qn6dWsCmDME6LO0yRwH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2ycmJ0lx5EHKru6G1LS+D8WcPSODBrf9TNVs2Figdf4CwyrdK
	y9H8WjVqdvPFC/8KqMwDsIvnSJwiqTxPIn6zqOsyMtqGYc7aEZDD
X-Gm-Gg: ASbGncsE2TOxh4bzAx+UHGXi7i1Yh+9SUlYJrV3y/N1qn6oYynes7FV1mXPrAaYmck9
	pNFPoaoc+VLhlvCtTNEXhx6gI2DqChXXLP9W2r7U3a6a/YrdAp+uZJtCib+p9t6izuTbKoRwsKO
	tPuBkCbhiPGgLT0XcWnJ7j+O74mX0VAkVKJvoDaGL+cuQZC5dbXBOQwWmCade9mT9a3322XmM/E
	A2AtdKqqGxRNBi1NCnyMGlHgl9e8e8gHrX88NLi0IykDih/NWhySxEHVcz3BRl7gl6GCG+G1IWm
	R45lsy3AWtTgbl82NsOxr7256m7oftAq1Wjzponp+cMRYMzwm9rpnCHLqUdCjB+S5VmkYHU=
X-Google-Smtp-Source: AGHT+IFCrrW6RNVZquoW/mErh5cCOuR46lfhdmTnJoE8ueHEeCps74gS5DZ/AuLUpkGnYzNZigdJOQ==
X-Received: by 2002:a05:6402:320d:b0:5d0:d91d:c195 with SMTP id 4fb4d7f45d1cf-5d3be73fd12mr15089760a12.32.1733823971640;
        Tue, 10 Dec 2024 01:46:11 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14b609e56sm7313936a12.40.2024.12.10.01.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:46:11 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Ahern <dsahern@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH RFC v3 net-next 00/13] bridge-fastpath and related improvements
Date: Tue, 10 Dec 2024 10:44:48 +0100
Message-ID: <20241210094501.3069-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_014614_212110_8E70C5EA 
X-CRM114-Status: GOOD (  21.10  )
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

This patchset makes it possible to set up a software fastpath between
bridged interfaces. This also creates the possibility to have a hardware
offloaded fastpath between bridged interfaces.

To set up the fastpath with offloading, add this extra flowtable:

table bridge filter {
        flowtable fb {
                hook ingress priority filter
                devices = { lan0, lan1, lan2, lan3, lan4, wlan0, wlan1 }
                flags offload
        }
        chain forward {
                type filter hook forward priority filter; policy accept;
		ct state established flow add @fb
        }
}

Creating a separate fastpath for bridges.

         forward fastpath bypass
 .----------------------------------------.
/                                          \
|                        IP - forwarding    |
|                       /                \  v
|                      /                  wan ...
|                     /
|                     |
|                     |
|                   brlan.1
|                     |
|    +-------------------------------+
|    |           vlan 1              |
|    |                               |
|    |     brlan (vlan-filtering)    |
|    +---------------+               |
|    |  DSA-SWITCH   |               |
|    |               |    vlan 1     |
|    |               |      to       |
|    |   vlan 1      |   untagged    |
|    +---------------+---------------+
.         /                   \
 ------>lan0                 wlan1
        .  ^                 ^
        .  |                 |
        .  \_________________/
        .  bridge fastpath bypass
        .
        ^
     vlan 1 tagged packets

While testing direct transmit in the software forward-fastpath, it is
useful to enslave the wan interface to another bridge, brwan. This will
make sure both directions of the software forward-fastpath use direct
transmit.

To have the ability to handle xmit direct with outgoing encaps in the
bridge fastpass bypass, we need to be able to handle them without going
through vlan/pppoe devices. So I've applied, amended and squashed wenxu's
patchset. This patch also makes it possible to egress from vlan-filtering
brlan to lan0 with vlan tagged packets, if the bridge master port is doing
the vlan tagging, instead of the vlan-device. Without this patch, this is
not possible in the bridge-fastpath and also not in the forward-fastpath,
as seen in the figure above.

There are also some more fixes for filling in the forward path. These
fixes also apply to for the forward-fastpath. They include handling
DEV_PATH_MTK_WDMA in nft_dev_path_info(). There are now 2 patches for
avoiding ingress_vlans bit set for bridged dsa user ports and foreign
(dsa) ports.

Another patch introduces DEV_PATH_BR_VLAN_KEEP_HW, needed for the
bridge-fastpath only.

Conntrack bridge only tracks untagged and 802.1q. To make the bridge
fastpath experience more similar to the forward fastpath experience,
I've added double vlan, pppoe and pppoe-in-q tagged packets to bridge
conntrack and to bridge filter chain.

Note: While testing direct transmit in the software forward-fastpath,
without the capability of setting the offload flag, it is sometimes useful
to enslave the wan interface to another bridge, brwan. This will make
sure both directions of the software forward-fastpath use direct transmit,
which also happens when the offload flag is set.

I have send RFC v2 as I previously only owned a dsa device. I now have
obtained a switchdev supporting SWITCHDEV_OBJ_ID_PORT_VLAN, and found
there was more to do to handle the ingress_vlans bit and corresponding
vlan encap.

I am now sending RFC v3 as the previous RFC did not get any comment.

Changes in v3:
- Squashed the two 'port to port' patches to avoid build errors when only
   one of the two commits is applied.

Changes in v2:
- Introduce DEV_PATH_BR_VLAN_KEEP_HW for use in the bridge-fastpath only.
   It is needed for switchdevs supporting SWITCHDEV_OBJ_ID_PORT_VLAN.
- Different approach for handling BR_VLFLAG_ADDED_BY_SWITCHDEV in
   br_vlan_fill_forward_path_mode() for foreign devices. Introduce
   SWITCHDEV_F_NO_FOREIGN, BR_VLFLAG_TAGGING_BY_SWITCHDEV and
   br_switchdev_port_vlan_no_foreign_add(). The latter function can be
   used to make sure the vlan was added to a switchdev native device.
   When that fails, adding the vlan with br_switchdev_port_vlan_add()
   means it was added to a switchdev foreign device.
- Clear ingress_vlans bit and corresponding encap for dsa user ports.
- Add check for ingress_vlans bit to nft_dev_fill_bridge_path().
- Adapted cover letter description to make clear the patches apply
   to software fastpath, making hardware-offloaded fastpath possible.
- Fixed clang error for vlan_hdr * and struct ppp_hdr * by adding block.
- Updated !CONFIG_BRIDGE_VLAN_FILTERING version of
   br_vlan_fill_forward_path_pvid().
- Removed erroneous check netif_is_bridge_master(ctx->dev) from
   dev_fill_bridge_path().
- Cosmetic changes.

Eric Woudstra (13):
  netfilter: nf_flow_table_offload: Add nf_flow_encap_push() for xmit
    direct
  netfilter: bridge: Add conntrack double vlan and pppoe
  netfilter: nft_chain_filter: Add bridge double vlan and pppoe
  bridge: Add filling forward path from port to port
  net: core: dev: Add dev_fill_bridge_path()
  netfilter :nf_flow_table_offload: Add nf_flow_rule_bridge()
  netfilter: nf_flow_table_inet: Add nf_flowtable_type flowtable_bridge
  netfilter: nft_flow_offload: Add NFPROTO_BRIDGE to validate
  netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to
    nft_dev_path_info()
  netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user
    port
  bridge: No DEV_PATH_BR_VLAN_UNTAG_HW for dsa foreign
  bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
  netfilter: nft_flow_offload: Add bridgeflow to nft_flow_offload_eval()

 include/linux/netdevice.h                  |   3 +
 include/net/netfilter/nf_flow_table.h      |   3 +
 include/net/switchdev.h                    |   1 +
 net/bridge/br_device.c                     |  23 ++-
 net/bridge/br_private.h                    |   5 +
 net/bridge/br_switchdev.c                  |  15 ++
 net/bridge/br_vlan.c                       |  29 +++-
 net/bridge/netfilter/nf_conntrack_bridge.c |  88 +++++++++--
 net/core/dev.c                             |  66 ++++++--
 net/netfilter/nf_flow_table_inet.c         |  13 ++
 net/netfilter/nf_flow_table_ip.c           |  96 +++++++++++-
 net/netfilter/nf_flow_table_offload.c      |  13 ++
 net/netfilter/nft_chain_filter.c           |  20 ++-
 net/netfilter/nft_flow_offload.c           | 166 +++++++++++++++++++--
 net/switchdev/switchdev.c                  |   2 +-
 15 files changed, 490 insertions(+), 53 deletions(-)

-- 
2.47.1


