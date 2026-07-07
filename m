Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8396C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EouyGj5sjPo+B4PHzNf53hocta38XiCJlMuSXmrEmIA=; b=siad1luSnxJIg7S1KhFpLXyhie
	UtgyUnlSbVUUwwrziMDpQi+q0lp1WKhLgyrrXE8RW4KCjy+nXS2rjd6nDGQfs0PJgfTB6vq61tb+g
	F3WEaM95qc7Jx2wGxh+nB4rbr6AT98qYonQBIsL/2nVZFXALR0VenSxiEYZ4z4f81PjpkomDRRyLb
	3j95XU/3nk5R0fhCM3jC/n8I/5Q5/SLDCIILArtv6gT2ojHHeOafl6C7BPAQGI+xFwC0GJktkeFLG
	aNK+AVWmQnTqwbmBh2MFUZ/ouFmV3NPMy4k+N7UCDe7slBaCSgawp5fec8ait1xUZ702n6Q9aY8Ij
	0hhtNXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9ru-0000000FaaG-0aui;
	Tue, 07 Jul 2026 17:46:02 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9rq-0000000FaYe-0x78
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:46:00 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174556euoutp02ac1c5de14e475eed8297c5fd7503845f~AEwMhxZeV1975219752euoutp02C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:45:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260707174556euoutp02ac1c5de14e475eed8297c5fd7503845f~AEwMhxZeV1975219752euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446356;
	bh=EouyGj5sjPo+B4PHzNf53hocta38XiCJlMuSXmrEmIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vS115uFRSA9jV+Q2D5fuZY7+w6Rjcc+W6YeD6PNNC3CVtcfRF431uRrj3+M9swFe1
	 Ae9pPmdRxYoXVUX2lRIEOA6RePzwAhFE8sGYYpt9P5fWQAljiRIbAtq9rXFVg6rayM
	 Kat5FZ0lyVtB7lSfUVBQEcONyZaPIeF8N+K+Wc2w=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260707174556eucas1p141142a61e5669032194f9eedf6393895~AEwMImIM00456104561eucas1p18;
	Tue,  7 Jul 2026 17:45:56 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174555eusmtip23cbd0982b060a2d218f86b6508de3608~AEwLe3I761463414634eusmtip2R;
	Tue,  7 Jul 2026 17:45:55 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net v3 1/2] net/stmmac: Check for STMMAC_DOWN flag in all
 XDP paths
Date: Tue,  7 Jul 2026 19:45:50 +0200
Message-Id: <20260707174551.1264558-2-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707174551.1264558-1-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174556eucas1p141142a61e5669032194f9eedf6393895
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174556eucas1p141142a61e5669032194f9eedf6393895
X-EPHeader: CA
X-CMS-RootMailID: 20260707174556eucas1p141142a61e5669032194f9eedf6393895
References: <20260707174551.1264558-1-j.raczynski@samsung.com>
	<CGME20260707174556eucas1p141142a61e5669032194f9eedf6393895@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104558_776145_C19EF266 
X-CRM114-Status: GOOD (  15.59  )
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

Currently STMMAC_DOWN flag is only set/cleared by stmmac_reset_subtask(),
to notify driver to stop processing of TX/RX frames. One of these processing
paths is for XDP, but it is only ever checked in stmmac_xdp_xmit(), which
leaves all other XDP paths vulnerable to processing data while interface is
restarting.

Make verification of STMMAC_DOWN flag consistent by applying check to
all XDP paths.

Fixes: 8b278a5b69a22 ("net: stmmac: Add support for XDP_REDIRECT action")
Co-developed-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Chang-Sub Lee <cs0617.lee@samsung.com>
Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 2a0d7eff88d3..b9ffff001baf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5260,12 +5260,18 @@ static int stmmac_xdp_xmit_back(struct stmmac_priv *priv,
 				struct xdp_buff *xdp)
 {
 	bool zc = !!(xdp->rxq->mem.type == MEM_TYPE_XSK_BUFF_POOL);
-	struct xdp_frame *xdpf = xdp_convert_buff_to_frame(xdp);
+	struct xdp_frame *xdpf;
 	int cpu = smp_processor_id();
 	struct netdev_queue *nq;
 	int queue;
 	int res;
 
+	if (unlikely(test_bit(STMMAC_DOWN, &priv->state))) {
+		xsk_buff_free(xdp);
+		return STMMAC_XSK_CONSUMED;
+	}
+
+	xdpf = xdp_convert_buff_to_frame(xdp);
 	if (unlikely(!xdpf))
 		return STMMAC_XDP_CONSUMED;
 
@@ -5310,7 +5316,9 @@ static int __stmmac_xdp_run_prog(struct stmmac_priv *priv,
 		res = stmmac_xdp_xmit_back(priv, xdp);
 		break;
 	case XDP_REDIRECT:
-		if (xdp_do_redirect(priv->dev, xdp, prog) < 0)
+		if (unlikely(test_bit(STMMAC_DOWN, &priv->state)))
+			res = STMMAC_XDP_CONSUMED;
+		else if (xdp_do_redirect(priv->dev, xdp, prog) < 0)
 			res = STMMAC_XDP_CONSUMED;
 		else
 			res = STMMAC_XDP_REDIRECT;
-- 
2.34.1


