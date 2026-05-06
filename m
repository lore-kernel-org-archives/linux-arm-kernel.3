Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D008CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 17:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FRxSzaJmflC4zkwHRscnnk8+aKqFH8eNHS6ArWZ+cM4=; b=UEkujMdqh9FEaE
	XRU6UB5fpmDqvcfccI/wby9pP9Z0Ml786yEQ96B6tUJ8qNWWyqN7OZC/xwxZGi5JBM2psCReoWDUr
	fZxgIAKb9XOl2osK0hQdJO2ZGP/4qbaHfq+fT6gnWyw5eTMbs2gIwRObKQhst7k8YiW+WCz/8ZMcP
	HlBgJJs+k1jiIdd9eT94wk7FiQIMhEttdqVWsR1k6F4ARv4LuF8LTT+ErR9+ZM1LO9RdzT3OqM+lz
	EK6DcB+9AaPLjkLYDRsvJyzI0z4CwdP0HRbtkXETgJrXRvN8bbutvuwZkFPbx+YP4XiK9saCYZiPc
	IAhuCbhQDzZHIiFPnlkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKg2v-00000001eEJ-0gvj;
	Wed, 06 May 2026 17:28:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKg2u-00000001eDM-0gdg;
	Wed, 06 May 2026 17:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E56D60139;
	Wed,  6 May 2026 17:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63289C2BCB0;
	Wed,  6 May 2026 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778088506;
	bh=uuxr4GBoi0HWmp+BmOao9Djtoy1CtJ8ix1066oLK6tE=;
	h=From:Subject:Date:To:Cc:From;
	b=XC70NEBp/ts7waDtWSLkQvU+sYZjSyh6hCX3Q4pe7E+UR3Em2rprQNs8jBxF05EnS
	 VxwwtqFm5d+Jf4eQt9TXNbtsbJdptnOspTsuAzK7YGdJXK1E7icyLsiLrvn6NRbjHr
	 fsj27qfssUagGK13L98mQdj8H0JmChqycKgmNAKmN0nmooh4w0wQFWq7TR/n7o2NRC
	 Kx0P6ScHxNLzAsnRFTqe2y4AZaZkHA+mKTnMRskZax9ZZVEYaz150Q0o4o4hPxtgJG
	 HfOnA5Lpu/qDuh/ypnNuR1QKx5xn8BBj023FZIYT1fNuqlBZQTpjQLT9cPkiYw3af/
	 LW10Bt/B7t0Bg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH nf-next v2 0/6] Add IPv4 over IPv6 and SIT flowtable SW
 acceleration
Date: Wed, 06 May 2026 19:27:31 +0200
Message-Id: <20260506-b4-flowtable-sw-accel-ip6ip-v2-0-439fd427726e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSwqDMBBAr1Jm3SmJX9JV71FcxHHUoSFKImoR7
 97gCbp8PHjvgMhBOMLzdkDgVaJMPkF2vwGN1g+M0iWGTGWVKlWJbYG9m7bFto4xbmiJ2KHMlcx
 Ya6VVXlCnixpSYQ7cy37V3+B79Lwv0CQxSlym8L2uq770X4NVo0JjKTdEZNia14eDZ/eYwgDNe
 Z4/LPLH6NAAAAA=
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
 net/netfilter/nf_flow_table_ip.c                   | 386 +++++++++++++--------
 net/netfilter/nf_flow_table_path.c                 |  16 +-
 tools/testing/selftests/net/netfilter/config       |   1 +
 .../selftests/net/netfilter/nft_flowtable.sh       |  78 ++++-
 13 files changed, 402 insertions(+), 165 deletions(-)
---
base-commit: c1e5127b577c6b88fa48e532616932ae978528d5
change-id: 20260505-b4-flowtable-sw-accel-ip6ip-7101034cd147

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


