Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7ABC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6sanML2Dhh94iBJereFlvYHp/47BSYsKw+xHcTZ++gc=; b=cjII1x2BiEXMWZICQ6fsAMcgHs
	9IXSxhVBjhwel2OzeQVpou/2os/ND3iBl20/gL/O8udAebE4o0TVhaA3QHPU9PRsMhDHh9KQPuGPo
	Zk6H+rWb/CNnJoaMkxCHCVJx094Vq3caE8QBKvLm8nu2s4+RQ/CdHjVJib99GNq6dQPSSsxkzZazO
	8ebsn5tT8F3JMrz7rqdKiocTsTrkbV7+4lMfCCMN00uoK7lPTrcmi3dEU6ZfSfaKaXIsaNVDXZyst
	Lv9SfuUvWALn+poy98Xjy1GQJ+MrN24YtO7L9aadnH21IgHis7pISj6s8Yx2bdN+zEZAJ3s0fOQSM
	xWTHHkXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnhv-00000007zQF-1zxd;
	Wed, 05 Mar 2025 12:18:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0t-00000007gQ8-4AlL;
	Wed, 05 Mar 2025 10:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6sanML2Dhh94iBJereFlvYHp/47BSYsKw+xHcTZ++gc=; b=bt3XTKyMTGaLjAae5i3XT9xV24
	lXKaPIKUSX3UmQD1KumiHOiS2l8Y+VvD4LCSuTu7j0HGlmZWHYIgZOwie9DmnEK4v2VUHVjuIfoSy
	eb38+pU9k9l7vpjHiM1hGNMjinNCDpR0HLL3mnNvCQ7gFlMnYLPB6xlSPja6/sRzN3eMK8aW4hoEh
	YpNQTUMFa1MdGffiVmbOouP0kIOc8TQhXhcWjvpZP6ljor/M7hzwDN3e9joJuinkcs8Yi0WGO9dmJ
	COsssOH2MOCG3wNCwjA1EYblaLl0rUWCz1i8JiEfO7LVeXHBf4jglJdtX12FpDQA/TTa8311W17Q6
	jRlEorXg==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0q-00000005IoL-3rTk;
	Wed, 05 Mar 2025 10:30:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ac21c5d0ea0so33990066b.2;
        Wed, 05 Mar 2025 02:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170602; x=1741775402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6sanML2Dhh94iBJereFlvYHp/47BSYsKw+xHcTZ++gc=;
        b=PX/kUWr9qv0fswhEwYVTExIgAQNfDXhCyK6I4ZiQ0yEy7x0vz883k4+fUco9XnWGNz
         847G7wilCSHlJpkEBA+YVBM5cYkCacTou6/YzDagjaCT2M+uyA73o0rxdCgy+pwgTv1z
         Dkkl0JFzstAxll6CAmaLgdySr3LZaHIQtqYKLfz91QKcoZmofJlQyirrQP/R6Ct+pkC/
         Q0bspc+mUdWFnEe0vB0pTyX1hSah84gWIABnLBfcdaHYrJw2ZzeoZpL67PAljAg+PzuN
         8P+X8EnZZH4LKytMP6vzxJWgezgCY2zasv4XNrd5wKpitZ30y9ZkvXmGgtiHBfzyJlo+
         KDHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170602; x=1741775402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sanML2Dhh94iBJereFlvYHp/47BSYsKw+xHcTZ++gc=;
        b=jdEv9doG6s4f5T9/Cp9M8nzHizjtZqA5K36iaNsdoWzkz79Zikg32adeI7+XOt2Zvn
         kgppIXIYJy+zpI/Kdhk9svPsFA5LpVh+ctNconOPZ+rltYGxKEQPDiXSw65pswRgg3CR
         mWS1onxyGAxBXwabhx5eKV9MB2i65hMA+2cOiVM3CCLOCDyvZ2l8hhZDy9pCZRR9Ley2
         A0Fd6IsQQJAsOuZMxaUIfKMGxjGId8O9YwxKXIRSMHqd7MghTj7zfREK3vv99cza3z/q
         zWKbm1qi3LO7zcvYkKGHpyQ9nnjXwEXeKaTOH3LcIbrqWx/xc9Q5+8wowppcMN3p9oXY
         RFqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKReNYdUKkzJ1kUCT4EB1DU1KHjvqljTBMHwm6R1Ry/ybn4kb3qfxSiyW9KiZ9ByhDgHcREWOj74w2X3Cc3d4t@lists.infradead.org, AJvYcCVLcRscojiEuFxzqrI/G3togEmIrgp4pj2nOUVjKcleyYEvBc0nUnolLm235fwwPTmL7Q/Lkrz9d91gtXFT8+0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfi7DOqAR5FMViFIrwB0y44cvZNU389QXNUg3XBQKVmRmaJzlT
	OEoOetpLR6wSY7POJnD8FqMW9X0DJhYWtDJDWtqvBzWK/XSgkEoy
X-Gm-Gg: ASbGncu9nMPHUoQniU++Y17wgDy+iVA9R1Ut86bIsBx8XMQwQs7PXYyn/9VvElBk169
	uIMsksi/4mVnj5JNVU5Z0JRQHB+3GUmtxDyGwDJTFpzg9doFJrH4eCsllCDffrXAWoYz5YXfWiX
	N9ryQAs9uCYnlIpiX+8ARchORbx1V04Onz2yqmyJnB275Faj/ISniIz3ShJ4Sl39HRQmdGhxFWt
	K04bPFbq4AhOfwUxyTVTXv6yyeojawf4pfmwTSENQ+2FrzCUVkdxfGiRh1+MFA0CwS9VDwhUhzR
	z7OWYWjoYAgr3UZto3Tcin74dETVv4vRnnCQUVBuob+o6drRW8CNlDW8Hd+xNpm0o0YmBDQCsVL
	AKVxTEr2/cUAA1RGFJRUJ/0//ZGTxs8SAZiMV72xSqFWWVVk9AIZfVlCQy4Xw4Q==
X-Google-Smtp-Source: AGHT+IEquGmXyo0QZO6D8xBnPc2YdJ5ns+5Q/gwbofncoh7rX6vx5H6gyD7FpADTdefnpFFr3FhJMg==
X-Received: by 2002:a05:6402:2351:b0:5e4:af36:2315 with SMTP id 4fb4d7f45d1cf-5e59f3d4a3dmr6307326a12.12.1741170601891;
        Wed, 05 Mar 2025 02:30:01 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:00 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
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
	linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v9 nf 00/15] bridge-fastpath and related improvements
Date: Wed,  5 Mar 2025 11:29:34 +0100
Message-ID: <20250305102949.16370-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_103004_970181_35C5AFB9 
X-CRM114-Status: GOOD (  22.32  )
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
bridged interfaces. One patch adds the flow rule for the hardware
fastpath. This creates the possibility to have a hardware offloaded
fastpath between bridged interfaces. More patches are added to solve
issues found with the existing code.

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

I send v4 and above as non-RFC as the previous 2 RFC's did not get any
comment.

Changes in v9:
- No changes, resend to netfilter

Changes in v8:
- Added commit on top: Avoid zero-length arrays in struct pppoe_hdr.

Changes in v7:
- Inside br_vlan_fill_forward_path_pvid(), replaced usage of
   br_vlan_group() with br_vlan_group_rcu() and
   nbp_vlan_group() with nbp_vlan_group_rcu().

Changes in v6:
- Conntrack double vlan and pppoe patch: Set ph and vhdr after the calls
   to pskb_may_pull().

Changes in v5:
- Conntrack double vlan and pppoe patch: Moved pskb_may_pull() up to the
   first switch statement, to the start of the cases. Removed the second
   switch statement. Replaced 0xffffffff with U32_MAX.
- Added patch removing hw_outdev, out.hw_ifindex and out.hw_ifidx members.
- Fix error path returned from nft_flow_offload_bridge_init().
- Cosmetics.

Changes in v4:
- Added !CONFIG_NET_SWITCHDEV version of
   br_switchdev_port_vlan_no_foreign_add().

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

Eric Woudstra (15):
  net: pppoe: avoid zero-length arrays in struct pppoe_hdr
  netfilter: nf_flow_table_offload: Add nf_flow_encap_push() for xmit
    direct
  netfilter: flow: remove hw_outdev, out.hw_ifindex and out.hw_ifidx
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

 drivers/net/ppp/pppoe.c                    |   2 +-
 include/linux/netdevice.h                  |   3 +
 include/net/netfilter/nf_flow_table.h      |   5 +-
 include/net/switchdev.h                    |   1 +
 include/uapi/linux/if_pppox.h              |   4 +
 net/bridge/br_device.c                     |  23 ++-
 net/bridge/br_private.h                    |  12 ++
 net/bridge/br_switchdev.c                  |  15 ++
 net/bridge/br_vlan.c                       |  29 +++-
 net/bridge/netfilter/nf_conntrack_bridge.c |  83 ++++++++--
 net/core/dev.c                             |  66 ++++++--
 net/netfilter/nf_flow_table_core.c         |   1 -
 net/netfilter/nf_flow_table_inet.c         |  13 ++
 net/netfilter/nf_flow_table_ip.c           |  96 +++++++++++-
 net/netfilter/nf_flow_table_offload.c      |  15 +-
 net/netfilter/nft_chain_filter.c           |  20 ++-
 net/netfilter/nft_flow_offload.c           | 168 +++++++++++++++++++--
 net/switchdev/switchdev.c                  |   2 +-
 18 files changed, 497 insertions(+), 61 deletions(-)

-- 
2.47.1


