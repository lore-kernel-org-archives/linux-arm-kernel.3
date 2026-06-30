Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wg2/qe+4da0BF+gj2Y7cJKdG+hCpLIZ0UIJ4logHsQY=; b=dcvHN2vZITfFLd3P/GhKMXAMQv
	0PLCe9NtB+4yIXLLNqDyFTxN3a4FU+Nf0+vfgMJoJ/fV/C67QZhkcNeHsiLZweASv/bdM9YN17Lpk
	GHoScqhV90FrzQvnGB/zoD3QThpjNLndggAdEE7hfKI8tbrHIzhBEpsLFHskGbEQZE0FFA0iJVAsa
	lJRa862P0jNh8JRd4fqR2EjhMQTB4PcJ8zo8d3UMmwHbGBYkbU94fzlTYqlz2ORUDxzdGTf/WCZmx
	K/grWdaYDXTDJEEUR0BVRzbShUqlY9g7zCPu/J2ETqy10w4GRbXWUS6ceRYNJYSawayeFbkfmuglF
	Pr9YSj3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSPx-0000000G2sP-02or;
	Tue, 30 Jun 2026 06:58:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSPu-0000000G2rL-3VhF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:57:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-463f1165e16so4153366f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 23:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782802677; x=1783407477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wg2/qe+4da0BF+gj2Y7cJKdG+hCpLIZ0UIJ4logHsQY=;
        b=ikezYyc6bn85kn7265h5jBnkmLqkmeYYC+xlRAvDGwDzV21Eg12x3IR1zgsVNMf8Oj
         VkTnx9RP6TLX4F60xCvtcqPCTHM+GQmQllN5/oPD3jiBQkH4IbkLTOGdZeVb4lP5eHlG
         qIbP7BJ5R24uFAVrVvj+y4QLdpIspyPBIlgpgb1Zk7zcVI9z5nlWxQi0VdddKKuGkdF3
         +ZbX/1112vqya907WGvhbnONhacd+pvW0DgfSrFx8s214PWiAGGCOLOdWSXG4YPOLGlg
         exJyDpyKHVOv0vYdW2iPtk/A7B6r9Gfqb2nfAIkUKY0+Ggz+ee4M0sHHDkRWwNyZHr0q
         Eq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782802677; x=1783407477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wg2/qe+4da0BF+gj2Y7cJKdG+hCpLIZ0UIJ4logHsQY=;
        b=hPoYbcLFxFE2ACmkxPWb+sHejNuB65TpU0THhcLrc7c3Lz9scQ5DdF0mPrEAJGOdAc
         2uAAy2nhvOg4gx1cZ/0BKFBFqEI4ZIDC6aP6+KOxE8abE0BBiOtowJd5XDMt162v0vPS
         xe2reBUXDOI6u6LKVmTRQMyylOd4Ulo9VfOcQq/QgD8xsDTG0kmzaj6D/oRKGQegZ2Cg
         LjhjnKanqJSfpO9aV6w4h2bJsBs+q4v1RVT4L5FOzYJ9ivTHjatUbfI9X6oUXdjuUudh
         5TZzlcQ00FnVHiBX4bKmEnj88LaXijPHEdR4wZXdN8ku3GL6YiXuXtZqwSjVIuusR9K0
         UDDQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUVkyQdZootvGMZ1F3mswscSouNcNpCm6omBFu8nk87j0JVF5txig1ewwelMfMyhtXByFleb0VJ3V6IJeMrHtC@lists.infradead.org
X-Gm-Message-State: AOJu0YzqwgsxRAUF2R+HMHZzERHcIJjv65RFHaqRWYqcwQExbPHaYdt6
	HeF4mX/kyFlchw9nXRq0iLYe6H9DJYSo5ZVYKpem1gl6I4JSbK2SCYt0
X-Gm-Gg: AfdE7cmEjshpBBxyiOKmAY9BH1FUV417YCPhTu5DfGW4xnhWEAjqZcP9YIXF4Cr9Ik3
	7xNfBCNRvwrhSNm1lCT3kYd4MEBq+dPFodds0ooW2r777JAeGUhxVE0vL45luiZ7E/qn6EdXHFc
	WiD/oRxkJ0YXW5u2wj2rSIRfH9e+SYoI5CBVo2gQM67NnbulhFg9kNhivkX2g+Zj3KRNmd2jzvQ
	iw7Nt728sd3XyCPk77Q0Q0SPHRzUB89M71w9cAL20lM2V/uvVbUAXcdbTXmCizu4csL9SvtgS9c
	3yagax/9wUIK5LYg6i7k24B1qnJ1opWCKwHtMVcoyVwm3ADKSqgMFLuzrFcn+Pa014LumEnNrpr
	5OvT6jSmDOLUB5QZU5GnK39n+Byt/RRGhHz1+INAWCulN71eNpIxiBeQrjMdn4YIwFhSV5eZh8A
	eIWlIsRAk=
X-Received: by 2002:a05:6000:2dc4:b0:474:6a5b:85f8 with SMTP id ffacd0b85a97d-475506e98aemr3116459f8f.6.1782802676618;
        Mon, 29 Jun 2026 23:57:56 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756636cf26sm4570949f8f.19.2026.06.29.23.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:57:56 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v2 0/5] netfilter: nf_flow_table_path: L2 bridge offload
Date: Tue, 30 Jun 2026 08:57:30 +0200
Message-ID: <20260630065735.3341614-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_235758_904936_C5E54EBB 
X-CRM114-Status: GOOD (  11.71  )
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

This series adds L2 bridge offload support to nft_flow_offload, allowing
bridged IPv4/IPv6 flows to be accelerated by the flowtable fast path
without requiring L3 routing.

Background
----------
Hardware flow offload engines (e.g. MediaTek PPE) can accelerate bridged
traffic but require that nft_flow_offload detect and handle bridged flows
differently from routed ones: no routing table lookup, MAC addresses from
the Ethernet header, and VLAN context pre-populated from the bridge port.

v2: Fix missing Returns: tags in kernel-doc comments for the three new
    bridge helpers (br_fdb_has_forwarding_entry_rcu,
    br_vlan_get_offload_info_rcu, br_vlan_is_enabled_rcu).

Patches
-------
1/5  net: export __dev_fill_forward_path
     Refactors dev_fill_forward_path() to expose __dev_fill_forward_path()
     which accepts a caller-supplied net_device_path_ctx, needed to
     pre-populate VLAN state before the forward path walk.

2/5  net: bridge: add flow offload helpers
     Adds br_fdb_has_forwarding_entry_rcu(), br_vlan_get_offload_info_rcu()
     and br_vlan_is_enabled_rcu() to expose bridge state to nft_flow_offload
     without requiring inclusion of net/bridge/br_private.h.

3/5  netfilter: nf_flow_table_path: add L2 bridge offload
     Core of the series. Adds nft_flow_offload_is_bridging() detection,
     nft_flow_route_bridging() which avoids nf_route() (fails for
     bridged-only subnets), MAC/VLAN pre-population for bridged flows,
     and a dst leak fix. nft_flow_route() becomes a thin dispatcher.

4/5  netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
     Fixes zero-source-MAC in PPE entries when a bridged flow traverses
     MT7996/MT7915 WiFi WDMA hardware.

5/5  netfilter: nf_flow_table_path: add VLAN passthrough support
     Records VLAN encap info for passthrough-mode bridge ports so hardware
     offload entries include the correct VLAN tag.

Rebase note
-----------
Originally developed against OpenWrt pending-6.18 patches by Ryan Chen
<rchen14b@gmail.com> and Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
Rebased to current upstream: path discovery infrastructure moved to
nf_flow_table_path.c in commit 93d7a7ed0734 ("netfilter: flowtable: move
path discovery infrastructure to its own file"), so all netfilter changes
now land in that file rather than nft_flow_offload.c.

How to enable bridge offload
-----------------------------
1. Load kmod-br-netfilter so that bridged IP traffic traverses the
   netfilter forward chain.

2. Enable netfilter hooks on the bridge:
     echo 1 > /sys/class/net/<br>/bridge/nf_call_iptables
     echo 1 > /sys/class/net/<br>/bridge/nf_call_ip6tables

3. Register bridge member interfaces in the nft flowtable:
     table inet filter {
         flowtable f {
             hook ingress priority filter
             devices = { eth0, wlan0 }
         }
         chain forward {
             type filter hook forward priority filter
             meta l4proto { tcp, udp } flow add @f
         }
     }

Daniel Pawlik (1):
  net: bridge: add flow offload helpers

Ryan Chen (4):
  net: export __dev_fill_forward_path
  netfilter: nf_flow_table_path: add L2 bridge offload
  netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
  netfilter: nf_flow_table_path: add VLAN passthrough support

 include/linux/if_bridge.h          |  23 ++++
 include/linux/netdevice.h          |   2 +
 net/bridge/br_fdb.c                |  34 +++++
 net/bridge/br_vlan.c               |  47 +++++++
 net/core/dev.c                     |  32 +++--
 net/netfilter/nf_flow_table_path.c | 201 +++++++++++++++++++++++++++--
 6 files changed, 316 insertions(+), 23 deletions(-)

-- 
2.54.0


