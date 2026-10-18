Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2751ACCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 17:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzCxI4jlYWw6JP8PMFSSVZEyEtQxd97FuaOsRZrDWwY=; b=I5LaMDyj+3CONu9MniXuqJ/F+X
	jdfpbsFIbhSyimZurCHMAZaVmYZrtvRT9+ES0OG4/+KTFiHRoMGLYzh2NNzXCQ1x3OKbyHmH7hlUc
	z2S+dY6S2Jkgj1etnjEBmbnEqtFlHYkZv6o9Kc41zuB+UbcJCT6mKBiJi63v46SFIF3oCHK3qk7a+
	rSh2PPjUAD5QVxm7aQHXGTWagtJJeAs/sIX/VM8gVknURg4hCfBACulmTktt0tPhQPqamKrw/DbyE
	tYpqbCenln5RkS+Qv+mJLH+jgccy4QNRKK/oYRTCx/eqi5DS7TAwk1cmIpO+coJst1OClp/Ld2UnJ
	XJ9Ka93Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUMB-000000064Ya-0LX5;
	Sun, 18 Oct 2026 17:07:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIULz-000000064SO-29Zx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 17:07:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IF72H42771847
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fzCxI4jlYWw6JP8PMFSSVZEyEtQxd97FuaOsRZrDWwY=; b=jydJDW5bcVLWC23I
	sy/G/Jx3AwFST64md+v6aPFSnyIH96Q+NdobUrwQNYceqbZypknU/P7fJoRBOzgU
	D1usDxST2SLbuMwgbPe/D+ZGM9Med1Mwu2/6sl/ydypqudFxyiTy9fxQxQeoiS4u
	jxoPsFnyXA+/MCP9Qm0KbiJGIRIxyWq9rBGjOzsOkDSvb9rSOBV9Q/drz+v2Xl68
	QNTqi0fZfO1H/j442oAdGD9wi+LHSbMwV4nqPuXNSHtPgPPRSEOHPIE7X++yZXrD
	j5C7a2LJo1wzhH84FgY+RopMyKXSjJPf3ZP4Ii7Y52Maz7ozk91DyVdr6r8MqAY2
	/T806A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k3d1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so348277685a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 10:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792343242; x=1792948042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fzCxI4jlYWw6JP8PMFSSVZEyEtQxd97FuaOsRZrDWwY=;
        b=kkPUtf8mPI83b+Id9NqTBbisZ2AfK4RbEEfa35MpLd7HZWNXGQ99mXvGZnLeUIrcPf
         LuxOnyPBP4FfJ3JReGLAjMUgiFuugnplEB6LRmBMlaOtjw7tGxBTnDjERmiIlKcBjT8j
         IP9fdAUDXekE6jr1lGqkR31agNNx6mBbz5jeprkp83WJgptfvim4aCwgapmSKk7qViCY
         +3u63GWXGW7m99kFBEehAhEkHNfOhCprfZpMhAAe22M51bzTnoSA1B3CJRc3ch9BmnNB
         B3m4bWi87wrERmjuv1XMhpqkjLndmmRSP2eWPqO+p1aDh4UcNtGWtZSGzvdbb0fTjtzn
         RIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343242; x=1792948042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fzCxI4jlYWw6JP8PMFSSVZEyEtQxd97FuaOsRZrDWwY=;
        b=bAyRtMmrYqAaVrEU4h31sMH72h4K7qALIEwlhUvimWQRzKETmxa33AyqptRdUghk+U
         bqAeoZGeXHqh7HuD8PQK7LhEeq6DZ6Qjc1KqlY9kxNRHpxo/wBz5YmQz8icI30cIsH8B
         EpMHLmZPu1wPDz8xsQ8t+9xGmku/IjNknCyj1SQFt9OhDMivCmbWFOW3WhcOBAA7NOnk
         RFp/5PuJcLa9VdJ/ozVyhOC4RS6Q88ZF4WpHyGGSIUydKMaxxdq4WXdhoAm0KxTxoRE5
         fOvWEGiYvKgZ6n/PEk4+rLRmYX2vgxiZWuR3m0LKlODGTf/3UI8yRH1f5DVbhaiiW/Ti
         AkYw==
X-Forwarded-Encrypted: i=1; AKwUvBxozrI9AMW6e/ec5liQ8zcIAgd4uI2iz4PnAFx5m4/yo/x019TjLLBThF1v+EcvMNxRyg7i5Rrc/GniZwwfhEuZ@lists.infradead.org
X-Gm-Message-State: AFq9FYIBPIHMkVk2BjyqG0U0zr18LKrTrJi5wglLVEcKYrHPFuAInNSd
	Y+6Yl69AmWsKgaZ6msVC18XWnbNtwRjuY0fFIzU5jDf8kW1u5zD+eDwpAba7HG5K+9G0BsraX37
	hXw+77f19C2TO1ygCVBitowFhNf9EQ4p1C/ABrBNaBql1EnetjdXecK/wxnjGsJTPDS9fS1FgGs
	SJCQ==
X-Gm-Gg: AYBFou3XyEV6jSt+D9EXRYF0cXirKoyQ2Ndr01pUE1NaE9hb+muPoyQW/n+pVsaiR1Y
	Zh9KhE+vacX7fAuRcF+79SjB3oMDBw8Xx6/X5n+icDmQ19s87wG3fx31ZTc/a3rq1P7YpxrQ8tO
	sYy352tjTuRFgJ1GVVI1Bl0iCiCB/yaoIS1g1Wl5GDV555B8TIt+JNClXND8uiDQzWYp3ejeSQ+
	VhO+8857JDTlYLTa5h4bfb+4UPlmyPTY5YmdUUrJ39jktFLrHJIt+iCS1PItfmpaDvYsUeIbAyy
	84Tpch5Xgvlsa0eTQPc/x1F837viL/Od1j8hWgzj6GDzsNfVG1hoaUrQQcxeQlyjCrBuONi72tu
	/beQVlMhhgmWWKg==
X-Received: by 2002:a05:620a:438f:b0:93e:4c1e:cbbd with SMTP id af79cd13be357-93f29d5e5e6mr969046485a.53.1792343241958;
        Sun, 18 Oct 2026 10:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:438f:b0:93e:4c1e:cbbd with SMTP id af79cd13be357-93f29d5e5e6mr969035985a.53.1792343240865;
        Sun, 18 Oct 2026 10:07:20 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510d60sm17188394f8f.58.2026.10.18.10.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:07:20 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 19:07:02 +0200
Subject: [PATCH net-next v8 4/5] net: stmmac: fix VLAN tag stripping on
 non-linear RX frames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-stmmac-rx-mb-v8-4-5f58c0b25849@oss.qualcomm.com>
References: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
In-Reply-To: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfX+wlUXAUz0DOW
 M5PW7A+jw6uI3kUoDxKO4gMmn83cKuRRD4rjibWytAndg1tee+rHLQzd+8CHcvIH73X0hfmSwZU
 SfY7e+dmPWbfE53fZiSA88l8VuWx3PaAZSvXCycp46oXrF1k73r+f5IuJVtI6bw7u5KPj2ey4kg
 j6MGaj0f+1G6V0l559UkcSWmJK/rhi1DKjkhlymVw4tcbzJohrnZzi6YYz379nfrVwgV/9MGjcA
 vnbkKSLVcWZQbwo74jUZ5VC66AXWvc8vLrMDzibTBOKR0DDu6A6Vjr+McaSE6AkDvFqOJ8XhztB
 0FjA2GeVDE3KvRsfdlrEnTB/Nyad7dBCkVd0Gd8RkGPcU96ePAGs/5KHToDub3YdTMQZels6fKF
 uXhz0d5D3MvAY6wsBY0F3uxp9040JLwc3GrDNVtwPsSPBtSkgFlZiA7ZydEWUkYOxJZdJF1As/9
 7Cz7eml3BLLfwFqYMjA==
X-Proofpoint-GUID: Xu_q9Y7YuwzBZyay9WsqjEpiJ5H9Qqsv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfX6c3bu+b9shNd
 srHVTNnbR8ceHVVym1NoowvAGEBlFJg6XTs9XnaYW4BWn4UaCUciaZQDZtJHHVeP2LhSaTXbJ80
 A7zU+Xn81r9DSeMTZFBwZi1/ONhk0zg=
X-Proofpoint-ORIG-GUID: Xu_q9Y7YuwzBZyay9WsqjEpiJ5H9Qqsv
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad4fccb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6Uo0uaPXZjLRJ0J4tPYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_100723_577809_BA27229C 
X-CRM114-Status: GOOD (  20.43  )
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

stmmac_rx_vlan() reads the VLAN header straight from skb->data and
removes it with skb_pull(), assuming the header is always in the linear
part of the skb. That is not true once non-linear skbs can reach it: a
program loaded with BPF_F_XDP_HAS_FRAGS can pass up a fragmented frame
whose linear head has been shortened to as little as ETH_HLEN by
bpf_xdp_adjust_head(), and the unguarded skb_pull() then drives skb->len
below skb->data_len, tripping BUG() in __skb_pull().

Pull the VLAN header into the linear part with pskb_may_pull() before
touching it and re-derive the header pointer afterwards, as
pskb_may_pull() may reallocate the skb head. Also move the XDP metadata
written with bpf_xdp_adjust_meta() together with the MAC header when the
tag is popped, so data_meta still points at the metadata after
eth_type_trans() anchors mac_header, instead of at the first bytes of
the destination MAC. Return an error so the callers can drop the frame
when the header cannot be pulled.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 45 +++++++++++++++--------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index e929cc0f2312..04dc6dcaa435 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5095,22 +5095,30 @@ static netdev_features_t stmmac_features_check(struct sk_buff *skb,
 	return vlan_features_check(skb, features);
 }
 
-static void stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
+static int stmmac_rx_vlan(struct net_device *dev, struct sk_buff *skb)
 {
-	struct vlan_ethhdr *veth = skb_vlan_eth_hdr(skb);
-	__be16 vlan_proto = veth->h_vlan_proto;
-	u16 vlanid;
+	struct vlan_ethhdr *veth;
 
-	if ((vlan_proto == htons(ETH_P_8021Q) &&
+	if (!pskb_may_pull(skb, VLAN_ETH_HLEN))
+		return -EINVAL;
+
+	veth = skb_vlan_eth_hdr(skb);
+	if ((veth->h_vlan_proto == htons(ETH_P_8021Q) &&
 	     dev->features & NETIF_F_HW_VLAN_CTAG_RX) ||
-	    (vlan_proto == htons(ETH_P_8021AD) &&
+	    (veth->h_vlan_proto == htons(ETH_P_8021AD) &&
 	     dev->features & NETIF_F_HW_VLAN_STAG_RX)) {
+		__be16 vlan_proto = veth->h_vlan_proto;
+		u16 vlanid = ntohs(veth->h_vlan_TCI);
+		u8 meta_len = skb_metadata_len(skb);
+
 		/* pop the vlan tag */
-		vlanid = ntohs(veth->h_vlan_TCI);
-		memmove(skb->data + VLAN_HLEN, veth, ETH_ALEN * 2);
+		memmove(skb->data - meta_len + VLAN_HLEN,
+			skb->data - meta_len, meta_len + ETH_ALEN * 2);
 		skb_pull(skb, VLAN_HLEN);
 		__vlan_hwaccel_put_tag(skb, vlan_proto, vlanid);
 	}
+
+	return 0;
 }
 
 static bool stmmac_rx_need_ic(struct stmmac_priv *priv,
@@ -5530,12 +5538,15 @@ static void stmmac_dispatch_skb_zc(struct stmmac_priv *priv, u32 queue,
 	}
 
 	stmmac_get_rx_hwtstamp(priv, p, np, skb);
-	if (priv->hw->hw_vlan_en)
+	if (priv->hw->hw_vlan_en) {
 		/* MAC level stripping. */
 		stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
-	else
-		/* Driver level stripping. */
-		stmmac_rx_vlan(priv->dev, skb);
+	} else if (stmmac_rx_vlan(priv->dev, skb)) {
+		dev_kfree_skb_any(skb);
+		priv->xstats.rx_dropped++;
+		return;
+	}
+
 	skb->protocol = eth_type_trans(skb, priv->dev);
 
 	if (unlikely(!coe) || !stmmac_has_ip_ethertype(skb))
@@ -6041,12 +6052,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		stmmac_get_rx_hwtstamp(priv, p, np, skb);
 
-		if (priv->hw->hw_vlan_en)
+		if (priv->hw->hw_vlan_en) {
 			/* MAC level stripping. */
 			stmmac_rx_hw_vlan(priv, priv->hw, p, skb);
-		else
-			/* Driver level stripping. */
-			stmmac_rx_vlan(priv->dev, skb);
+		} else if (stmmac_rx_vlan(priv->dev, skb)) {
+			dev_kfree_skb_any(skb);
+			rx_dropped++;
+			goto next;
+		}
 
 		skb->protocol = eth_type_trans(skb, priv->dev);
 

-- 
2.56.0


