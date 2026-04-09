Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB16EA3C59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mYxDq21wNilatLFje+S38uA+ypMM0UsStJOhwsy8x6M=; b=Xd4MHsLFYBjtwHVboNfqvwoBpi
	/fnW7Ycp6DwasclYmUkcdOs23/AKUy7XaY5JR9dMwE6lbrUgwv5+uk7Yr8MdAquQ5P6wh5f03bDpg
	DMsvuQbsRkcsQ6tk8DdIe1dMUHW6xcGNZvEiUuPvV5NIwTgkMPx9yuS2as304tCGk2/SHTAWgUUoY
	msHANc116f1x7iCGwMW59ezJbRYCBOOkwFplfoF8tCReK1+/Xw2gVaG3e0gMdFMbZMoTC0miF4PqS
	Inl5n/tTdgnEXRRWcHKtokfJVwUEA12OSpbtRsfsxpDsGduq5pyVvCcEuahpVkeUYkn/1/r/4M5cy
	yXiaM+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp6l-0000000ARNB-42SY;
	Thu, 09 Apr 2026 13:07:43 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp6i-0000000ARLn-3x8z;
	Thu, 09 Apr 2026 13:07:42 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wAp6T-000000001k1-21AP;
	Thu, 09 Apr 2026 13:07:25 +0000
Date: Thu, 9 Apr 2026 14:07:22 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Subject: [PATCH RFC net-next 0/4] improve hw flow offload byte accounting
Message-ID: <cover.1775739840.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_060741_747356_99D70C7B 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

Hardware flow counters report raw byte counts whose semantics
vary by vendor -- some count ingress L2 frames, others egress
L2, others L3. The nf_flow_table framework currently passes
these bytes straight to conntrack without conversion, and
sub-interfaces (VLAN, PPPoE) that are bypassed by hw offload
never see any counter updates at all.

This series lets drivers declare what their counters represent,
so the framework can normalize to L3 for conntrack and
propagate per-layer stats to encap sub-interfaces.

Questions:
 - Sub-interface stats accesses vlan_dev_priv() directly --
   should there be a generic netdev callback instead?
 - Are there hw offload drivers whose counters do not fit the
   ingress-L2 / egress-L2 / L3 model?

Daniel Golle (4):
  net: flow_offload: let drivers report byte counter semantics
  nf_flow_table: track sub-interface and bridge ifindex in flow tuple
  nf_flow_table: convert hw byte counts and update sub-interface stats
  net: ethernet: mtk_eth_soc: report INGRESS_L2 byte_type in flow stats

 .../net/ethernet/mediatek/mtk_ppe_offload.c   |   1 +
 include/net/flow_offload.h                    |   7 +
 include/net/netfilter/nf_flow_table.h         |   5 +
 net/netfilter/nf_flow_table_core.c            |   2 +
 net/netfilter/nf_flow_table_offload.c         | 174 +++++++++++++++++-
 net/netfilter/nf_flow_table_path.c            |   8 +
 6 files changed, 195 insertions(+), 2 deletions(-)

-- 
2.53.0

