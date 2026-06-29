Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W6yfFGpGsowdA7nocV8Q2ZeGgDt/heljVkQt2pc3Sqk=; b=kTr8Fmxl+zlgOgfUrqS1zdhEjA
	tRSySu/ogk2o9eaYJ2CKuDsE02N4nq2aWofsOBtGdanD1N6fmLDiPecfwqZTz1wohf75mV8lMvNNA
	o+lXKOMUpH9GASnOXAKi02LxspWhpAiBIadFK/fWxL1KTOuVtEhVWICWLn7wDNLYyWMiPTDh3WYpq
	Ia4tJHqSg08sdvupEGsDemkSmWGqG5CrG707kLIroezQSOs3TivYVeEFi3cS55SaLEh5OFC0ckEJL
	e6CTjPKStdDPt0eqB+VwG9ETsFEBVSS0VUhN5aogctnURtVbHbXexwz9XxfQttSSNdYZudoLv8YKx
	eXOXVzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAj-0000000EZ0f-27Nc;
	Mon, 29 Jun 2026 12:33:09 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBAh-0000000EZ01-0x72
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c1268d56234so97661066b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736385; x=1783341185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W6yfFGpGsowdA7nocV8Q2ZeGgDt/heljVkQt2pc3Sqk=;
        b=CaCrxxqnUzshY9q19xocT4qGRLxBgguOw6h6VBPDESOqlPhDQ/8x0dcAJGtj1LrU4u
         R093cAbRFZT1PjqB+Ww5rdE8D8VHv1xrgfXv3nlXQO7K74ZAwhM7C+4VgTcJNc1vLvON
         zzWAAu3fXDhD6f8e1irZcbaP60+FgwFZFzYxg4pfsyy5d051COPwEo3u39WqOT5Y0lh3
         aCUt2YSmsy63waBlAfKGUJIOs7nUXRBJ59K+UQ3y9FWq+YtaZfr+cSn5WhrfZFooslVx
         eK8/N7xv5LVY83VmiyUbQ/CzBAGsXnx3Dw+LFfzXE031tTIuX0xauDE3eMqYzhdknF+/
         1Uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736385; x=1783341185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6yfFGpGsowdA7nocV8Q2ZeGgDt/heljVkQt2pc3Sqk=;
        b=ZuOS9mMnG3q3a23aycQIpMiiivrjvdUGqE2KTeihLtEqXAiKTjhGOwfb5+7oowqcQp
         RtY0SCxLNjqZxR73EW9Uy0zvHvI/KqQQt2J74jjOkj+E31juKQopqPt7HuW2Ehd/atiE
         QbedbYqp8Y2bUCTh7wvFT8zAMorjpL9oiXDQ9bvVx77OCqQL6Fm50yQJMndCqnLAKxQD
         pN7uImByvWmqYEJD9NBLUJCjUZMUbDa+uiJJIdzxSl0dPXtfd4ozXCVVKDhBgioQbK+j
         WzK4bNpkDwMELkvN7Ydvf8HyeN5qE8OR+x9xE1kHHqR+pnE3+G58IzaQSkSCSxeGDlNj
         leoA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3Cp3A1ZnoSRsbHGe4+BCmLkhyilbnkEBRn/HvjifXWoBuVHQldE35ds4dhFNaFWPJ9v6MUrvDbSLbZ58xqkx1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0j13BqUUBQRh21hOp0pREc6TTfpZEYffueG8R7IK/c3rS63Hl
	ZTOo7GTICT9uAQWorhljWRGlteUhbHLAe6dvPQS7tpeD9KMbP6RS75S1
X-Gm-Gg: AfdE7cmIX0kK/z/CQfxhYPCkBe9G3HHIkwHu/XEsPYPYlUKcApYXvysPWn4u7pyTT6G
	zOsn9gKMzYE+PTNpHwOizBzMsZdiQeou82ZXi1A6vTRVWY3I8EAdqk8eQsXuKFUH3M32Qn0j+os
	EpB9DCQ3g+oxShbWm4/ZTzHHMU/lQUnsilw2Y+Aqb5PwP7k7JTaU0Kwvp3nV/DE7NO9I2eGMH5i
	y9jJAap7FpR8DD0Pu2pgT0AwLJfzUM4StP1pLj4G+OmBKkHlbr+zw2s8MoN5R3E6GS3aKNY70kf
	Hlldm9ZkRPMVyYrzhvt0TaIREtabA/5vEAHph2uQWNYa7rUNOWCUFKacpVvfCHdLMaF66WH+ghs
	MnhaqfTkm2JwZMPJwJIdGybRPkrqBpx54KvdPyDRlXClj7euq4vP1GxEZaslbUN93vf4muUivLf
	ps/Ij1uqw=
X-Received: by 2002:a17:906:f116:b0:c12:2b66:352b with SMTP id a640c23a62f3a-c123342a062mr351983366b.5.1782736384619;
        Mon, 29 Jun 2026 05:33:04 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:04 -0700 (PDT)
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
Subject: [PATCH 0/5] netfilter: nf_flow_table_path: L2 bridge offload
Date: Mon, 29 Jun 2026 14:32:48 +0200
Message-ID: <20260629123253.1912621-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053307_313703_40F264F5 
X-CRM114-Status: GOOD (  11.10  )
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
     and a dst leak fix (allocation references in dsts[] were never
     released after nft_default_forward_path() transferred ownership).
     nft_flow_route() becomes a thin dispatcher.

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
 net/bridge/br_fdb.c                |  32 +++++
 net/bridge/br_vlan.c               |  45 +++++++
 net/core/dev.c                     |  32 +++--
 net/netfilter/nf_flow_table_path.c | 201 +++++++++++++++++++++++++++--
 6 files changed, 312 insertions(+), 23 deletions(-)

-- 
2.54.0


