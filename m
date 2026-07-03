Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9977C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 14:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9WmCg5KQV9+WEylsXDnXXYCT0wE60z9FdM4u/lEjPoI=; b=XhWtKEY9zdvGIO
	ybjYq/yF7hgOZZGuWEriUW6khD0yy79IuSmfi4vcqZ+Ol2p4UY/67yQRvtGrqehvBcB0lm3gO7efz
	wszxEIfRKQ/mRp4cW5FTjTJxk/3yXdDftsXtINSFzrUlhUH1jakjOntTywAiqOzmEKyk3zJenl5I6
	3jOxlqGPUfodM1nGCBM5/RK+t3fNTsotGLY8ry5ziuZ6IRNwmIVqjnquSUvb5MwK0dclXShfU6GZR
	x136hJ5oS4eezQfxQr0mg21vvxv8eUookblJeZ923d98cGjt0JE+1ptnGXhvJlk8eKJwqV+/X/0PZ
	nhtvBZLlIjTly7irNSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfebp-00000007DJC-2CH6;
	Fri, 03 Jul 2026 14:11:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfebo-00000007DID-0oSv;
	Fri, 03 Jul 2026 14:11:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8612E60051;
	Fri,  3 Jul 2026 14:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5A1F1F000E9;
	Fri,  3 Jul 2026 14:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783087871;
	bh=9WmCg5KQV9+WEylsXDnXXYCT0wE60z9FdM4u/lEjPoI=;
	h=From:Subject:Date:To:Cc;
	b=nP3sDrQWQDE9IxZvNZP/QSicRHCHwVfF/BHyUOXaVCRxjIB5jCBDwzYibyoRXToph
	 ldcEvnrCdsK8xa+goiRypyrUmgLvnDG96E44OskJ70GILGZeM89jODKVsGl7H0wYvM
	 Db9xx55VsF1LViL4+9QD1AEwd2T8zM16+ID4ABI0XQ+yr9/1i6RpusfrtO8sEhQk7q
	 xYfHlms8n9O6RAcjQKSuGGILsXQ+WIP2LmkeSVGO0cvrcdxC9cHCD0NxUz5PiH1QvK
	 b3kr+lC+5BvBq3Fb90R46T4oxXoVjIDgBwjsC1DkmhlIZy3lJdHf0ntwsFehZps12w
	 dXEkAtB0rr2DA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH nf-next v4 0/6] Add IPv4 over IPv6 and SIT flowtable SW
 acceleration
Date: Fri, 03 Jul 2026 16:10:35 +0200
Message-Id: <20260703-b4-flowtable-sw-accel-ip6ip-v4-0-00398cd12382@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OQQrCMBQE0KtI1n5JftLEuPIe4iKmPxosaUlKV
 aR3N3SlCOJyGHgzT1YoRypst3qyTFMssU81qPWK+YtLZ4LY1syQo+YNb+CkIHT9bXSnjqDcwHl
 PHcRBxwGM4IJL5VuhDKvCkCnE+6IfWAqQ6D6yYy0usYx9fiyrk1jqvwYmARys89J67y05u79ST
 tRt+nxe4AnfMf0bw4opaUOr0BjU9IXJN0yK35isWKMdblEHiebz2TzPLz7XmRVqAQAA
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
Changes in v4:
- Rebase on top of nf-next and fixed conflicts.
- Link to v3: https://lore.kernel.org/r/20260531-b4-flowtable-sw-accel-ip6ip-v3-0-56a2826f3279@kernel.org

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

 drivers/net/ethernet/airoha/airoha_ppe.c           |  13 +-
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c    |  13 +-
 include/linux/netdevice.h                          |   5 +-
 include/net/netfilter/nf_flow_table.h              |   1 +
 net/core/dev.c                                     |   6 +-
 net/ipv4/ipip.c                                    |   1 +
 net/ipv6/ip6_tunnel.c                              |   6 +-
 net/ipv6/sit.c                                     |  26 ++
 net/netfilter/nf_flow_table_core.c                 |  16 +-
 net/netfilter/nf_flow_table_ip.c                   | 397 +++++++++++++--------
 net/netfilter/nf_flow_table_path.c                 |  20 +-
 tools/testing/selftests/net/netfilter/config       |   1 +
 .../selftests/net/netfilter/nft_flowtable.sh       |  78 +++-
 13 files changed, 402 insertions(+), 181 deletions(-)
---
base-commit: 6fb33632323a396c9dc2bb9bea483e013e547d57
change-id: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


