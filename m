Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F2CCD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 15:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wEA0Bbgp1Lh9hZrXgrHbG5c4JJwRefDBjSbZn8Oqiw0=; b=cnN270Dibfzn3j
	eJ7LBIYzx6kE1plVpnItpfdXw8jlKUbUV8IYgLtVdvTiXu+Xa1D1Xb5IPVLo3sOHh85DMvyIXkwLD
	JFZ5PMrGZ7FiGN5XqDtgaNGp4C1pYaaulRW1v8l1Rd7jRKICyWqk7o5PqZVlYAZJ2cb+NMFsX9PiB
	l+gC+RrucHAFNcyOk/d8MS6NSiLhZcfeb0BdSeJDr1VictyxmEtpdOedFaLFEiPmnEbyzjgsjsNky
	k9S5+7jKNM0HjUFOsA1k4edS7U5bJRGnlTKD0HXlEHrtKGE5C8HoYr5J1jzxqvCjnfyWMkAJyhG5n
	KOFHyJwomJKhqX/YbGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiRY-00000009ihx-2bAc;
	Sun, 31 May 2026 15:51:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTiRX-00000009ihn-2npe;
	Sun, 31 May 2026 15:51:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04274601DE;
	Sun, 31 May 2026 15:51:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2086F1F00893;
	Sun, 31 May 2026 15:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780242674;
	bh=wEA0Bbgp1Lh9hZrXgrHbG5c4JJwRefDBjSbZn8Oqiw0=;
	h=From:Subject:Date:To:Cc;
	b=oki/6QFUUyyGK9W04e9LbYnAp8ro5HD6cnIuYp9RXShE9o2UxEBQIQEITEoINyf/G
	 fpFAdrs7kVcKGjFU94AAxNJ799IQqCXSM53GVkyUspmNKtEMOyDPMcgMDcjMp3FKMK
	 Fa1b5AjetSoIcMgGr/zKL9enQyxkImiAt9Li93uJiQVtZWWRy8HaTfRFEK3ZCQI12P
	 xHhgd0rghMItWmnCrAysB4N8vE/KnsLcNDpOHlaTD8Lw+D8lcKcR+jUMvDkgJrNM88
	 cx49SkQzrWFZP0NboStt1ghAXmkDttlYPgxzllbvUCc7fF3XHCKY9yejrGTFGDlNur
	 ur7c2pbRXTP+A==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH nf-next v3 0/6] Add IPv4 over IPv6 and SIT flowtable SW
 acceleration
Date: Sun, 31 May 2026 17:50:32 +0200
Message-Id: <20260531-b4-flowtable-sw-accel-ip6ip-v3-0-56a2826f3279@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NSwqDMBSF4a2UjHtLXiako+6jdBDjVUNDlETUI
 u69wVE7KR0efvjORjImj5lcTxtJOPvsh1iGOJ+I623sEHxTNuGUK1rRCmoJbRiWydYBIS9gncM
 AflR+BM0oo0K6hklNijAmbP166HcSW4i4TuRRQu/zNKTX8TqzI/91MDOgYKwTxjln0JrbE1PEc
 BlSd8Az/8TUb4wXTArTNpJrzRV+Yfu+vwE/G5OaHQEAAA==
X-Change-ID: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, 
 Ido Schimmel <idosch@nvidia.com>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
 Shuah Khan <shuah@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.14.3
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

Similar to IPIP and IP6I6 tunnels, introduce sw acceleration for IPv4 over
IPv6 and SIT tunnels in the netfilter flowtable infrastructure.

---
Changes in v3:
- Drop nf_flow_tunnel_v4_push and nf_flow_tunnel_v6_push routines
- Rebase on top of net-next tree.
- Link to v2: https://lore.kernel.org/r/20260506-b4-flowtable-sw-accel-ip6ip-v2-0-439fd427726e@kernel.org

Changes in v2:
- Fix MTU check in nf_flow_offload_forward() and in
  nf_flow_offload_ipv6_forward()
- Add SIT sw acceleration support
- Link to v1: https://lore.kernel.org/r/20260505-b4-flowtable-sw-accel-ip6ip-v1-0-9ac39ccc9ea9@kernel.org

---
Lorenzo Bianconi (6):
      net: netfilter: Add ether_type to net_device_path_ctx
      net: netfilter: Add encap_proto to flow_offload_tunnel
      net: netfilter: Add IPv4 over IPv6 tunnel flowtable acceleration
      selftests: netfilter: nft_flowtable.sh: Add IPv4 over IPv6 flowtable selftest
      net: netfilter: Add SIT tunnel flowtable acceleration
      selftests: netfilter: nft_flowtable.sh: Add SIT flowtable selftest

 drivers/net/ethernet/airoha/airoha_ppe.c           |  14 +-
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c    |  13 +-
 include/linux/netdevice.h                          |   5 +-
 include/net/netfilter/nf_flow_table.h              |   1 +
 net/core/dev.c                                     |   6 +-
 net/ipv4/ipip.c                                    |   1 +
 net/ipv6/ip6_tunnel.c                              |   6 +-
 net/ipv6/sit.c                                     |  26 ++
 net/netfilter/nf_flow_table_core.c                 |  14 +-
 net/netfilter/nf_flow_table_ip.c                   | 403 +++++++++++++--------
 net/netfilter/nf_flow_table_path.c                 |  16 +-
 tools/testing/selftests/net/netfilter/config       |   1 +
 .../selftests/net/netfilter/nft_flowtable.sh       |  78 +++-
 13 files changed, 403 insertions(+), 181 deletions(-)
---
base-commit: 8415598365503ced2e3d019491b0a2756c85c494
change-id: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


