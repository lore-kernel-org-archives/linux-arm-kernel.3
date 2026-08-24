Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A96C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 12:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rq4CL1HpZA87nEWIN6bZhJKfM5EHEzo0xnV7w+OMOBY=; b=BztsGaxyELSSp0pdxjTtEAVhg5
	f+GeU6zI9O2UoEcEjxvX2z5Qi20JusSPI5+ySovicXDYczSsx3ajn3MHNnHDTB2JOz0BTQNWEqX+s
	ccyvdy4upgjZ8PxRcmWLRPrHgItoiy9fFgFun/7oPW+UnN6TZvzmyhtkpm7jozTXINWxomga7BEoi
	mBENQnHwFzKbLU+779OCv+MvJWIXHXEColDIM4Ucqt57mZch1RVf75bv+6tjYmRAcWOlayXIGd3EA
	C4KKZC8QCMI2BpnPQ1fJ3DCd41AogUX+eYgTHSkn6XxGYqIWnJay2ZrSPe/mxozv7w8l2uxos6NqM
	jVh+Jypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyU8M-0000000Gcz3-1zBj;
	Mon, 24 Aug 2026 12:50:38 +0000
Received: from mail2.dspace.de ([80.228.58.149] helo=mail.dspace.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyU8J-0000000GcyG-28ri
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 12:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=dspace.de; i=@dspace.de; q=dns/txt; s=dkim1;
  t=1787575835;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Rq4CL1HpZA87nEWIN6bZhJKfM5EHEzo0xnV7w+OMOBY=;
  b=Noqz+fQ5xkvPtoP12QMCrfjKfB9TYiqkxgAOuCukl8gtDPgtkeAvZ0wM
   M9P7D/cztaOdpS+2EgufQ8mdDItTBkAGfrJj2FHgsFIIS9tVOWXj+pH64
   7LNokAW9/1+iHrN/CUkjprQMbJnpaUm1pOeZBZystUzLAf5zfF4ZB0e+l
   4=;
X-CSE-ConnectionGUID: Hkk5cpyeSmOOcs3EgSe1/w==
X-CSE-MsgGUID: 1CmGOfl8ROSga6u2nnxjCg==
X-IronPort-AV: E=Sophos;i="6.25,240,1779141600"; 
   d="scan'208";a="5059063"
Received: from unknown (HELO Z1-1000) ([10.1.1.222])
  by mail.dspace.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Aug 2026 14:50:33 +0200
Received: from VM-Z1-1000-LIVE.dspace.de (localhost [127.0.0.1])
	by Z1-1000 (Postfix) with ESMTP id 664CA60038;
	Mon, 24 Aug 2026 14:50:33 +0200 (CEST)
Received: from exchange.dspace.de (EX-DE-PAD-SE.dspace.de [10.100.196.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by Z1-1000 (Postfix) with ESMTPS id 55C6760037;
	Mon, 24 Aug 2026 14:50:33 +0200 (CEST)
Received: from PascalKW11-NB.dspace.de (10.71.4.31) by EX-DE-PAD-SE.dspace.de
 (10.100.196.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 24 Aug
 2026 14:50:32 +0200
From: Pascal Kneuper <PKneuper@dspace.de>
To: kuba@kernel.org
CC: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com, 0x1207@gmail.com,
	si.yanteng@linux.dev, larysa.zaremba@intel.com,
	aleksander.lobakin@intel.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	DBaldin@dspace.de, Pascal Kneuper <PKneuper@dspace.de>
Subject: [PATCH net v2] net: stmmac: restore NET_IP_ALIGN in the RX DMA
 offset
Date: Mon, 24 Aug 2026 14:50:14 +0200 (CEST)
Message-ID: <20260824125014.47862-1-PKneuper@dspace.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813092923.284285-1-PKneuper@dspace.de>
References: <20260813092923.284285-1-PKneuper@dspace.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.71.4.31]
X-ClientProxiedBy: EX-DE-PAD-SE.dspace.de (10.100.196.14) To
 EX-DE-PAD-SE.dspace.de (10.100.196.14)
X-C2ProcessedOrg: 563f5800-21cf-4d8d-8aed-fddd1469e4ee
Content-Transfer-Encoding: quoted-printable
X-TBoneOriginalFrom: Pascal Kneuper <PKneuper@dspace.de>
X-TBoneOriginalTo: kuba@kernel.org
X-TBoneOriginalCC: andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	maxime.chevallier@bootlin.com, 0x1207@gmail.com,
	si.yanteng@linux.dev, larysa.zaremba@intel.com,
	aleksander.lobakin@intel.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	DBaldin@dspace.de, Pascal Kneuper <PKneuper@dspace.de>
X-TBoneDomainSigned: false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_055035_993949_B0D83EF5 
X-CRM114-Status: GOOD (  20.20  )
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

Since the RX path was converted to zero-copy, the page pool page is hande=
d
to the stack directly as the skb head, and the offset the DMA engine writ=
es
at is what determines the alignment of the packet headers.

Before the conversion the payload was copied into an skb obtained from
napi_alloc_skb(), which reserves NET_SKB_PAD + NET_IP_ALIGN. The
conversion moved the headroom into stmmac_rx_offset() but did not carry
over NET_IP_ALIGN, so on architectures where NET_IP_ALIGN is 2 the IP
header now lands misaligned:

  64 (NET_SKB_PAD) + 14 (ethernet) + 20 (IP) =3D 98

Same for the XDP branch:

  256 (XDP_PACKET_HEADROOM) + 14 (ethernet) + 20 (IP) =3D 290

On ARM32 this is fatal, because ldm and ldrd trap on unaligned addresses
even when CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is set.

Any received echo request panics the machine, e.g:

  Unhandled fault: alignment exception (0x001) at 0x81873062
  Internal error: : 1 [#1] SMP ARM
  Hardware name: Altera SOCFPGA Arria10
  PC is at icmp_echo+0x38/0xa8
  LR is at icmp_rcv+0x22c/0x370
  Call trace:
   icmp_echo from icmp_rcv+0x22c/0x370
   icmp_rcv from ip_protocol_deliver_rcu+0x2c/0x224
   ip_protocol_deliver_rcu from ip_local_deliver+0xc8/0x1a0
   ip_local_deliver from ip_sublist_rcv_finish+0x3c/0x50
   ip_sublist_rcv_finish from ip_list_rcv_finish+0x110/0x118
   ip_list_rcv_finish from ip_list_rcv+0xc8/0xdc
   ip_list_rcv from __netif_receive_skb_list_core+0x170/0x1c0
   ...
   napi_complete_done from stmmac_napi_poll_rx+0xcb0/0x1030
  Code: e24dd068 e59020a0 e28dc010 e0822001 (e8920003)
  Kernel panic - not syncing: Fatal exception in interrupt

The faulting instruction is the ldm of *icmp_hdr(skb) in icmp_echo().

Fix by adding NET_IP_ALIGN back to the RX offset, which restores the
alignment the stack used to get.

Note that commit a955318fe67e ("stmmac: align RX buffers") made a similar
change in 2021 and was reverted by commit 12d125b4574b ("stmmac: Revert
"stmmac: align RX buffers"") because it caused packet corruption. That
patch raised the offset from 0 without adjusting the buffer size
accounting, so the DMA engine could arguably write past the end of the RX
buffers, though this was never root caused.
Commit df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX
path") since derives the page pool allocation from stmmac_rx_offset(), so
the extra bytes are accounted for.

Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX path=
")
Cc: Daniel Baldin <DBaldin@dspace.de>
Assisted-by: GitHub-Copilot-CLI:claude-opus-5
Signed-off-by: Pascal Kneuper <PKneuper@dspace.de>
---
v2:
 - also add NET_IP_ALIGN to the XDP branch, reproduced the same panic
   with an XDP_PASS program attached (Jakub Kicinski)
 - retitle accordingly, v1 was non-XDP only

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
index a71f0df263785..4d4b155d0d931 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1527,9 +1527,9 @@ static void stmmac_display_rings(struct stmmac_priv=
 *priv,
 static unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
 {
 	if (stmmac_xdp_is_enabled(priv))
-		return XDP_PACKET_HEADROOM;
+		return XDP_PACKET_HEADROOM + NET_IP_ALIGN;
=20
-	return NET_SKB_PAD;
+	return NET_SKB_PAD + NET_IP_ALIGN;
 }
=20
 static int stmmac_set_bfsize(int mtu)
--=20
2.47.3


