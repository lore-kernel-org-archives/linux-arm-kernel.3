Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EC2C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8psXzlPUn1qaPIoR8K5/IlKByb97VV49Dd43WJ9R3cY=; b=U90bJLI8TveblF
	ea/kxwVEFt4A+IKaTPlB/5L5w2n/dsdbwRSas8SXzXiG8pA7Y+jejWeV7XDb/hfvYsTrUub2GxDL6
	xT13k2hK7DtfjHznzvrZyoou7Iqu0FXVLG2OrYSLzb+3p1z3TWZakWI5pmfgNCfSf2vCxByS2PmVW
	Q6RhzAzfRPi47QwQnh9tIjktJUodP6VDKEmFTM3Pz+CtBK8F9lK2PLxBs/k5D4pBvGZxgvW1HxxJp
	3nbxjb91vNsNg+q3g/3ZJTi3fDonZMbehNsTqB6ncNQYgyi5uvHyfPq8mSZV2enYmyDnc15VD1hR4
	+o28d/4cVwU9EPaZ+BJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWo-00000001eQJ-2hem;
	Thu, 09 Jul 2026 08:54:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkUj-00000001aRa-2CBD;
	Thu, 09 Jul 2026 08:52:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B554D6001A;
	Thu,  9 Jul 2026 08:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80BE1F00A3E;
	Thu,  9 Jul 2026 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587151;
	bh=8psXzlPUn1qaPIoR8K5/IlKByb97VV49Dd43WJ9R3cY=;
	h=From:Subject:Date:To:Cc;
	b=lOIJkr5F6wf2m2HlMDzWb9WTkTrWiKGJb+f+ZevlnbU0PUurj5sZSCvQLqmkglkhD
	 kuumua3+lnvwfHhm4D+NYXWhBUSGfeB2yAPc64aIHoHR6H9co2UtY3h31/FsRnnDwe
	 yqbWO5KNt1j0LFLsN7f3sEClEdxVguVkbsZfA2TUrfs/0lnEf6gnyh55TC9mmq/T+B
	 LGWzgEvErhdbrNyqiWELAE4/R+jVxO0T6pb84BVMlOoUps8/p2KA8J21mXSMSn7S+A
	 ST8inBqcJISCDEFcmO/GiSQBbBijFCqCWRAGDe3hEG4jykt6rByhj2DNW51eAi2t8N
	 JeLidx9474e7Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH nf-next v5 0/6] Add IPv4 over IPv6 and SIT flowtable SW
 acceleration
Date: Thu, 09 Jul 2026 10:52:07 +0200
Message-Id: <20260709-b4-flowtable-sw-accel-ip6ip-v5-0-828ceaf85bab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43QQWrDMBAF0KsErTtFmpElq6veo3ShyKNE1NhGM
 k5C8N0jvGlKwHT5+fD+MHdROCcu4uNwF5mXVNI41NC8HUQ4++HEkLqaBUo0spENHDXEfrzM/tg
 zlAv4ELiHNJk0gVVSSdKhU9qKKkyZY7pu+pcYIgx8ncV3Lc6pzGO+bauL2up/DSwKJDgfyIUQH
 Hv3+cN54P59zKcNXvAZM/sYVkyTi51Ga9HwC0ZPGKl9jCrWGI8tmkhoXy/Tv5iVtI/piklJrq2
 vRGrxD7au6wM4OfNgtwEAAA==
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
Changes in v5:
- Fix ipip6_tunnel_fill_forward_path() to take into account not only
  IPv6 packet since SIT tunnels can encapsulate even IPv4/MPLS traffic.
- Return an error in ipip6_tunnel_fill_forward_path() if tunnel daddr is
  not set since NBMA tunnels are not supported yet.
- Return an error in ipip6_tunnel_fill_forward_path() if encap.type is
  not TUNNEL_ENCAP_NONE
- cosmetics
- Link to v4: https://lore.kernel.org/r/20260703-b4-flowtable-sw-accel-ip6ip-v4-0-00398cd12382@kernel.org

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
      net: netfilter: add ether_type to net_device_path_ctx
      net: netfilter: add encap_proto to flow_offload_tunnel
      net: netfilter: add IPv4 over IPv6 tunnel flowtable acceleration
      selftests: netfilter: nft_flowtable.sh: add IPv4 over IPv6 flowtable selftest
      net: netfilter: add SIT tunnel flowtable acceleration
      selftests: netfilter: nft_flowtable.sh: add SIT flowtable selftest

 drivers/net/ethernet/airoha/airoha_ppe.c           |  13 +-
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c    |  13 +-
 include/linux/netdevice.h                          |   5 +-
 include/net/netfilter/nf_flow_table.h              |   1 +
 net/core/dev.c                                     |   6 +-
 net/ipv4/ipip.c                                    |   1 +
 net/ipv6/ip6_tunnel.c                              |   6 +-
 net/ipv6/sit.c                                     |  51 +++
 net/netfilter/nf_flow_table_core.c                 |  16 +-
 net/netfilter/nf_flow_table_ip.c                   | 411 +++++++++++++--------
 net/netfilter/nf_flow_table_path.c                 |  20 +-
 tools/testing/selftests/net/netfilter/config       |   1 +
 .../selftests/net/netfilter/nft_flowtable.sh       |  78 +++-
 13 files changed, 434 insertions(+), 188 deletions(-)
---
base-commit: a88e11651a59b616a8e614e178f68cd730eed0fe
change-id: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


