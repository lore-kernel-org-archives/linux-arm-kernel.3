Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11726C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 15:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k3pBNULljxFqavqzf5bIsc7svxX6l9nSf1+vZLbUXTI=; b=SlsYUMIKhbSMef/Tk5taLwg3mB
	BYtybQfCgjofmQiREoW+xUiEjtQNj88XfZGiiOZ/ie+zSWlxSdE6286kqC4SU2tESd0fZo2xSvjKI
	OLy6HhMH4/osklc6HNKN+WmmYBsANfvES/gvL/Q4O/xZ6JCzv2ZikDRiLVArBdc+Vw3YhKmHWfaUx
	Za9zGfYhjsR8Ct06hPzrrk6wxxmItRAZOy8IA3IooxSnScYopptRb24DwsOo8U/vj1ZxnZHAbYBNI
	aKeRhMwuB8zJ1OWA1jZg9f0X/bbI0HbJhlmh5BCmwZzFZA0zCp+TAJiqL3A+k3eM0ZIVXqqr9rjmy
	I2iuFnpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Fy-0000000Drp0-3YQ3;
	Fri, 25 Sep 2026 15:54:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8Fw-0000000Droc-1clk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 15:54:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4NiJ609372
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 15:54:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=k3pBNULljxFqavqzf5bIsc
	7svxX6l9nSf1+vZLbUXTI=; b=KkkpwkKpWNwyXVcx7dlkFZvWGqxy3xOwqd+xYj
	ROEGKBy97MOrgwW9y/kEPKRokVe1/Q9KATNRlvA0Ep0IJpj8wBrd4cP/3IwrRzIo
	FpyqAhQsJekaLO1b3ph87t2oZA4UbEZLGZDfQYV62xbY05vzGWhvNy7gC5cPId4+
	essK1hqoiIuPoP4zGFMF2OQOtdacVhRktYNmFzl/INvTFTEhSI9ViLu5laYXWmhT
	/hwsokPB1S7fyZzKTgGLCS26BqtD+GeDvDEW3A5ZzrbHcPSPBV/yjAgipNIBr0CO
	lxcN4AuGV+sQmr5fAgnWNz2BNC/+7NU1JTAo73SqiblrrGjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns678-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 15:54:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so201251385a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 08:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351675; x=1790956475; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k3pBNULljxFqavqzf5bIsc7svxX6l9nSf1+vZLbUXTI=;
        b=exx6u2tkNhfAPKcmf9UKVINYeH8oFRZ50VGQbPCU4KQDmoZUbr/eyh8Hb7xvJ00g5/
         OB8xtUhp1kTa6uPQUIGjmnCD8I73xntyIanoH2tXS2qcTNzf+N/yG1zCO23tYwcvBxL8
         LKd3/Wwi+OYM/OiJ3rgOJ3SYicqwMv/nJ+EpFXrMcR+G672oAUl1RxdZTa0b3G2wQEbs
         kgZeR4VDi491V0NzbBboTHpMd7mlb/oXpLbauRACOKyJrqH4/oW/p3mZr1vjUxYkKTk5
         cGJSlJswDHXIRQAEVAH2/eRwkEdYZiCOWH076XUNdNjuUY56fOltL4DDOlnsx8WpvYGb
         f1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351675; x=1790956475;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k3pBNULljxFqavqzf5bIsc7svxX6l9nSf1+vZLbUXTI=;
        b=IvrWlbmjzy99nY7OGRnqx3/xxmVuty14OGKeGxE+o6tkdkgVRvuunWbKBlPglDB7YK
         0kuVKajq5y0irFHBaGtzJR+d/wCbkNFGU1yZCms8x5i3o0U27GWlgRdyifh5B5+aLEda
         O3Wlv8oLcVxaV5mZs0cEDR933ZaO2mEGJdxE95wOlRXeQLoPlQHQNx8kPglGEJ2odZ4I
         9mnKFoB+Ze7SUl4SD99Poyvneoz8HgcRchkMjQyo2cCzY3AsLKpHi/wJGun1cQ+UpfWC
         hCfmKO3ygajWWiIYl338cEiu0++YMyJaBtHjB5xNROJ3RAJgYwakfo8tsJsihPkYRMKT
         6WQw==
X-Forwarded-Encrypted: i=1; AKwUvBy1VKpyB/vqc4iM2RIlfIemdn+0zDgEx9qcxCuNwpe9xSC2O3nr+K9USOcqx0CRskfmuU9JSCs4qau/3HU+fWVl@lists.infradead.org
X-Gm-Message-State: AFuF++kktg4+5RDMZSFF6fF9kbscdbc0kSwXs2vfSnQgbNB9eaYAbt/8
	oqofY8bba47bomsmF0YQD/MDXbBVYYZBxd1STvM8j2VLbqRNnCE2B27MX4h9ynYl6B/2DAJZrqI
	pxQzquFaPocXJzp2Cl7iJgtbK7nOmdOtlK0EvHfMHCVSvrhd0mqMS+lRzFywKgP/ZfZiT9Z+7tO
	PUxb0gmAbCiA==
X-Gm-Gg: AYBFou1Mg9ubTPrfZITQIA36okEZB6ONZvcGF2vAY15SsiY1FPuN9DnnqFbzXujvPg4
	K1vfQsSTIFzAW3/jnieXaYF2qRgV3jlhTzZ1vSTJ+oRJco2Z8jMCK78WQwEJPmLqxpqIR8W/1ls
	EOasMIZQIDMX+Acq4CDKn4jUkR21tHOxh1CasFx4NAbq9iO8m5tTOn0jBekC6Y/LZ91PyJ/ciz2
	vKBKfcmMX6hbgmt/Do/NSNSjkiBUNBCTZSK+cwjghWAJ/vi/tRnfw+x0A3L06D9HBSiusgPGpjX
	llCrhALtl3S8gt866lsOlwn2cJmZEMP8sfAz4ILjmo3jgiEDj7ug6VfdVUh1Q7jNw3hR/rjfxmv
	3paKrdMJvrSupwQ==
X-Received: by 2002:a05:620a:1a1d:b0:939:8373:b552 with SMTP id af79cd13be357-93c43b7e879mr515644585a.1.1790351674379;
        Fri, 25 Sep 2026 08:54:34 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1d:b0:939:8373:b552 with SMTP id af79cd13be357-93c43b7e879mr515639085a.1.1790351673777;
        Fri, 25 Sep 2026 08:54:33 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff42b7074sm42234815e9.6.2026.09.25.08.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:54:32 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 17:54:21 +0200
Subject: [PATCH net-next v3] net: stmmac: add XDP multi-buff support for TX
 side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-b4-stmmac-xmit-mb-v3-1-ca08f029e81c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23NTQrCMBAF4KuUWTslmaY/uvIe4iKJqQ2YRpNYK
 qV3NxQXLroZeDzeNwtEE6yJcCoWCGay0foxh+pQgB7keDdobzkDMWrYkQiVwJickxpnZxM6hUq
 1nWFNJ3QvIO+ewfR23swLjCbhaOYE19wMNiYfPtuziW/9z6123IkjR9lyyXVNxAWdfYzl6y0f2
 jtX5rOhE/1DYg+iDDFWVaJVrdJU70Drun4BwaqQyAwBAAA=
X-Change-ID: 20260922-b4-stmmac-xmit-mb-bb78e0684cf4
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: WX6e6-8BJXXjo_oHCdST4oVAbzymKjVw
X-Proofpoint-GUID: WX6e6-8BJXXjo_oHCdST4oVAbzymKjVw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX3akqvjPw24xS
 b2AVmdnif6YA3KtE7banBrmZk9XeFcH7adTV5SYvhoJTdAj6qxKy22vPKX2o6rs1WgtYXOsTGoo
 gaqJyRA7Ti7/Ya7/ykF57oT9oephHlQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX65snWJJ5vM8v
 QZJutDmdShVvjqvZy1M6d/5d8PKNk/1GZmvxWr7gSWlqWu1twt9hgymgXtt1xGUdrOvq/uX8W5h
 b+3oIC4tT2yxmMKEPn5ElsSHMT4gF5KEqI02P5j/XT40/Pou0P0u4I4M2HlW73HDRDAZFGO9QuK
 ZQiRiJNiXpaypQIeytMVp/I6uXB9b1GKSDq4PfNgM7mhrKF3MW69pP3WaNg/EUrGsEzFECXHXsr
 UJM0z6XX50cgtlpwfVWF9D/2E188PyGL6qK1SizyDQDUhl6kx17zSsV7jdvstH/c4dZH66/nhzv
 wM3HxdKbjkawXpMuDfVUXSazrC5eB5nkjAvzOnls7IEKrSL0RSUP0NqsCg/qvYaI0thQaMDuZ6t
 KBjHPh9PUm7L/bZrD7fiobEB86qqMQNDlb/RZkWn4c8tO9XB7X9NOOTrWqu20Ryvklx7DYce2Hm
 P+0ZOSgbtLIt64EoDXg==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab6993b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tCc0xJYVa54DUFqMxLAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_085436_584807_AAF62571 
X-CRM114-Status: GOOD (  23.22  )
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

Extend stmmac_xdp_xmit_xdpf() to transmit XDP frames with fragments
(multi-buff). Each buffer, i.e. the frame head and every frag, is mapped
and programmed into a dedicated TX descriptor.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v3:
- Advertise NETDEV_XDP_ACT_NDO_XMIT_SG capability.
- Add missing dma_wmb() before setting OWN bit of the first descriptor.
- Link to v2: https://lore.kernel.org/r/20260924-b4-stmmac-xmit-mb-v2-1-003347b7bc25@oss.qualcomm.com

Changes in v2:
- Fix Tx coalescing logic in stmmac_xdp_xmit_xdpf()
- Consider the max between STMMAC_TX_THRESH() and num_frames as
  threshold in stmmac_xdp_xmit_xdpf().
- Link to v1: https://lore.kernel.org/r/20260923-b4-stmmac-xmit-mb-v1-1-a71a1c522142@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 127 ++++++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  |   2 +-
 2 files changed, 85 insertions(+), 44 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3ad9252bf6ae..f1e9ac2f9859 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5241,77 +5241,118 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 				struct xdp_frame *xdpf, bool dma_map)
 {
-	struct stmmac_txq_stats *txq_stats = &priv->xstats.txq_stats[queue];
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_frame(xdpf);
 	struct stmmac_tx_queue *tx_q = &priv->dma_conf.tx_queue[queue];
 	bool csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;
+	unsigned int txq_thr = STMMAC_TX_THRESH(priv);
+	unsigned int first_entry = tx_q->cur_tx;
 	unsigned int entry = tx_q->cur_tx;
-	enum stmmac_txbuf_type buf_type;
-	struct dma_desc *tx_desc;
-	dma_addr_t dma_addr;
-	bool set_ic;
+	unsigned int num_frames = 1;
+	struct dma_desc *desc;
+	int i = 0;
 
-	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
+	if (unlikely(xdp_frame_has_frags(xdpf)))
+		num_frames += sinfo->nr_frags;
+
+	if (stmmac_tx_avail(priv, queue) < max(num_frames, txq_thr))
 		return STMMAC_XDP_CONSUMED;
 
 	if (priv->est && priv->est->enable &&
 	    priv->est->max_sdu[queue] &&
-	    xdpf->len > priv->est->max_sdu[queue]) {
+	    xdp_get_frame_len(xdpf) > priv->est->max_sdu[queue]) {
 		priv->xstats.max_sdu_txq_drop[queue]++;
 		return STMMAC_XDP_CONSUMED;
 	}
 
-	tx_desc = stmmac_get_tx_desc(priv, tx_q, entry);
-	if (dma_map) {
-		dma_addr = dma_map_single(priv->device, xdpf->data,
-					  xdpf->len, DMA_TO_DEVICE);
-		if (dma_mapping_error(priv->device, dma_addr))
-			return STMMAC_XDP_CONSUMED;
-
-		buf_type = STMMAC_TXBUF_T_XDP_NDO;
-	} else {
-		struct page *page = virt_to_page(xdpf->data);
-
-		dma_addr = page_pool_get_dma_addr(page) + sizeof(*xdpf) +
-			   xdpf->headroom;
-		dma_sync_single_for_device(priv->device, dma_addr,
-					   xdpf->len, DMA_BIDIRECTIONAL);
-
-		buf_type = STMMAC_TXBUF_T_XDP_TX;
-	}
+	while (true) {
+		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
+		int len = frag ? skb_frag_size(frag) : xdpf->len;
+		bool last_frame = i == num_frames - 1;
+		enum stmmac_txbuf_type buf_type;
+		dma_addr_t dma_addr;
 
-	stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, xdpf->len,
-				false);
-	stmmac_set_tx_dma_last_segment(tx_q, entry);
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
+		if (dma_map) {
+			if (frag)
+				dma_addr = skb_frag_dma_map(priv->device,
+							    frag, 0, len,
+							    DMA_TO_DEVICE);
+			else
+				dma_addr = dma_map_single(priv->device,
+							  xdpf->data, len,
+							  DMA_TO_DEVICE);
+			if (dma_mapping_error(priv->device, dma_addr))
+				goto error_dma_unmap;
 
-	tx_q->xdpf[entry] = xdpf;
+			buf_type = STMMAC_TXBUF_T_XDP_NDO;
+		} else {
+			struct page *page;
 
-	stmmac_set_desc_addr(priv, tx_desc, dma_addr);
+			page = frag ? skb_frag_page(frag)
+				    : virt_to_page(xdpf->data);
+			dma_addr = page_pool_get_dma_addr(page);
+			if (frag)
+				dma_addr += skb_frag_off(frag);
+			else
+				dma_addr += sizeof(*xdpf) + xdpf->headroom;
+			dma_sync_single_for_device(priv->device, dma_addr,
+						   len, DMA_BIDIRECTIONAL);
+			buf_type = STMMAC_TXBUF_T_XDP_TX;
+		}
 
-	stmmac_prepare_tx_desc(priv, tx_desc, 1, xdpf->len,
-			       csum, priv->descriptor_mode, true, true,
-			       xdpf->len);
+		stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, len,
+					dma_map && frag);
+		stmmac_set_desc_addr(priv, desc, dma_addr);
+		stmmac_prepare_tx_desc(priv, desc, !i, len, csum,
+				       priv->descriptor_mode, !!i, last_frame,
+				       xdp_get_frame_len(xdpf));
+		tx_q->xdpf[entry] = last_frame ? xdpf : NULL;
+		if (last_frame) {
+			stmmac_set_tx_dma_last_segment(tx_q, entry);
+			break;
+		}
 
-	tx_q->tx_count_frames++;
+		entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
+		i++;
+	}
+	tx_q->tx_count_frames += num_frames;
 
-	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
-		set_ic = true;
-	else
-		set_ic = false;
+	if (priv->tx_coal_frames[queue] &&
+	    (tx_q->tx_count_frames % priv->tx_coal_frames[queue]) < num_frames) {
+		struct stmmac_txq_stats *txq_stats;
 
-	if (set_ic) {
+		desc = stmmac_get_tx_desc(priv, tx_q, entry);
+		stmmac_set_tx_ic(priv, desc);
 		tx_q->tx_count_frames = 0;
-		stmmac_set_tx_ic(priv, tx_desc);
+
+		txq_stats = &priv->xstats.txq_stats[queue];
 		u64_stats_update_begin(&txq_stats->q_syncp);
 		u64_stats_inc(&txq_stats->q.tx_set_ic_bit);
 		u64_stats_update_end(&txq_stats->q_syncp);
 	}
 
+	/* Set the OWN bit on the first descriptor now that all descriptors
+	 * for this xdp_frame are populated.
+	 */
+	desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
+	dma_wmb();
+	stmmac_set_tx_owner(priv, desc);
+	tx_q->cur_tx = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
 	stmmac_enable_dma_transmission(priv, priv->ioaddr, queue);
 
-	entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
-	tx_q->cur_tx = entry;
-
 	return STMMAC_XDP_TX;
+
+error_dma_unmap:
+	while (first_entry != entry) {
+		desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
+		stmmac_release_tx_desc(priv, desc, priv->descriptor_mode);
+		stmmac_free_tx_buffer(priv, &priv->dma_conf, queue,
+				      first_entry);
+		first_entry = STMMAC_NEXT_ENTRY(first_entry,
+						priv->dma_conf.dma_tx_size);
+	}
+
+	return STMMAC_XDP_CONSUMED;
 }
 
 static int stmmac_xdp_get_tx_queue(struct stmmac_priv *priv,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index d7e4db7224b0..9af9e0cb366c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -135,7 +135,7 @@ int stmmac_xdp_set_prog(struct stmmac_priv *priv, struct bpf_prog *prog,
 		stmmac_xdp_open(dev);
 
 	if (prog)
-		xdp_features_set_redirect_target(dev, false);
+		xdp_features_set_redirect_target(dev, true);
 
 	return 0;
 }

---
base-commit: 42a9fb3382fc2573e92f41d203b095d9a372cfc9
change-id: 20260922-b4-stmmac-xmit-mb-bb78e0684cf4

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


