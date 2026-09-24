Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648BCC98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 12:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hAWT8Ciayk6jCv1TOsDfitytwzy27gxf+SVO9yuGpAY=; b=dgS1Y3A2gTaLqjyVD9aku4bheb
	nCIUjh/CUmOSQHoa9xA8g4hOaxlV2mmpvccX0bCosp87Q5jdHdMun+wCyaYskFUo8PxHik2BMgfAh
	EyPY8syhuGbTQ5QIsNAiHHiVP2U+HE6meDjRKwLifyNCPIT6yRB5L2wphCRD5gLZaXfIGtBlEfgOL
	eRdmRet/g/qOgBtsUMZMI/9v7yqycBr0YB1JfKKmUx/DRnuUZzk1/KATjuB9JjJKHTtsCOTmiQfo6
	C5nlG1Hf2hp2ZuNeFUALEklTjCAHsAZQWcBN6qbkQW1P3ct4ZW70jvue21OPO6OWkONcPUQx9WtZ4
	O7bDzRUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9if2-0000000AzLe-1bsz;
	Thu, 24 Sep 2026 12:34:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9iey-0000000AzLF-3Hvd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 12:34:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4nbu1437492
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 12:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hAWT8Ciayk6jCv1TOsDfit
	ytwzy27gxf+SVO9yuGpAY=; b=NRJSdYBni0Cyjcjl9wIjsZhuKkyZr3AGesJg8r
	e9VPo5AMy7W4hnNkMyacnRmAeckXxmmu7CSQT8uBhKiHcFg0PKf6OYgnni22CzGx
	BXRqQiUjVYzO0Y4ZJv3ohuK2rdLo4e4d8UqSTqcCEo8j/KUyC1sZqa0OvkLvZ/x0
	kh+usyFvh0BWC0HQt/L53itfWTbBiFaxs2wwALHbI8ELZWU+aqvKQllUmRq4hQnd
	WBFYpqxYz7XYnM5XVRcTbDaNu/hnSDG3Oh9AlwCXRdw7ocF+lurYM8jhmtcH/hmc
	TWcg1LC7VC09LARiFjFw8H7XZXIDZvxLaGjCvNXvUJANL5uw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7rhyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 12:34:43 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78580a6b2fbso671186137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790253283; x=1790858083; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hAWT8Ciayk6jCv1TOsDfitytwzy27gxf+SVO9yuGpAY=;
        b=iv9ALocbnvMr9iIrQcatUa9MECewBvJJt0YicJWnJrx4fJscElwyqfzG0KVH0PztmJ
         dIy3ryjsirQ5GNJTQRJt2ItxAvAp+oxxmOfNjLQaW3yyQ6bOACTzhdiDpWD22QcZ+bff
         0gF0G6sCp4Yoqf7cx9iZ5jYU3oDYE839dUZPGwjgv6aFi9fcdOsh9KX9PCLNfYZCvl6h
         tkWgxPI6KiyIDexhL8NH06a/9vY3k+A2t8tRz9kRDHAmL2WCCeMa9uH2vaHduIntDCw0
         IITZYfDQzBE0sj9j3NHKnhy47N0pespYbNreFYghrQh1FkEPX/5v+MoxYSGltHG0426A
         Qb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790253283; x=1790858083;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hAWT8Ciayk6jCv1TOsDfitytwzy27gxf+SVO9yuGpAY=;
        b=scut/bsOpnDVai8fHmFEMdh2vnOERerun3HT0hxjxX4ZeaGH3Dgvrza3fhjoSESC9w
         wQnbE+tt5xjcPqR4sbqYRfLnG7qwsl/uN+JMYg8g0Q/7Hzh9u6WZShSYQgE1r+aaiRRm
         UWT++jUKysQzSY/WkagIbQXd/ionR2LUpadKFgPj3uagV5k9kRqZOXcafsCWaEfsqqsU
         rZ6f8DMOqenk5nPvN9IOsW4nVShPSPv9Ez3Njo1lIxGSZtltFADc6035Gge0+qrcuAjC
         6cSb9a5LZZlrFxlhUiin04PivSARfVIoTsixDRApsroHNoXMo4pD0MQ+MrJTRLw437Ki
         nsvg==
X-Forwarded-Encrypted: i=1; AKwUvBzTmTIYaygephUJc5GmnAdkHiQbFxNXs+i5V5sfHPuEJ82Fq+cTSPq6F5adejeIIzFrNrMeXsiDv7ACwA6cmPHA@lists.infradead.org
X-Gm-Message-State: AFuF++kebjUUSBBsZrX4PAIO/fBMSDKK4raN6orwKO0jT4hakU9hlzUB
	KuK224bi4s8ikX5SKZZa8XRUwE1vpFhD8aAwetCwQzH8HoAnw1kryWnP9+YbRI0cYjHnky8mWPV
	BGbFQio4C6NahfDQUHZmP5fI3fIsLIX17rFif1DogmLT8gS1HCPGCXB6+vax6xk7KS2WQXF7FaW
	5b1A==
X-Gm-Gg: AYBFou0/Hnw41mp/OFr8lqnd+BKj0ZGaNNe/+dofcX1lYlK8mLS+/rnU1DKw/+m8Sb7
	dNYrucRzRmj1xHSr0470hMtcCO2gS9Knrz/b0hLrNyWM25RAXCGRM+WQUS7I4zz/XPctH/RSibj
	eqj/00ZpEBJ4zo2ptXrVvM3wyMDcKXOtXCB4bYtasyAGxL3mHJE4mbnjYp+ldbJiYjaTPauhX9r
	LXbwlImOebTVGvNqPely1FsKC60YHPmBx5C1EJuS4H9dMjl1T5T6Sqel194Hhs+SuPV1B0qvnHy
	iJ4G8bv24GqBpx1SOkMl5/WsDhmXSHSHpfkOLxn8lvogfSktNvuctdSH+X9CVxx/8Urayz+MfY9
	CxC9v3iybiLcXKA==
X-Received: by 2002:a05:6102:e10:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7af1c58e8a4mr986329137.8.1790253282700;
        Thu, 24 Sep 2026 05:34:42 -0700 (PDT)
X-Received: by 2002:a05:6102:e10:b0:790:c7bb:43fd with SMTP id ada2fe7eead31-7af1c58e8a4mr986317137.8.1790253282074;
        Thu, 24 Sep 2026 05:34:42 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682673bdsm14309616f8f.2.2026.09.24.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:34:41 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:34:18 +0200
Subject: [PATCH net-next v2] net: stmmac: add XDP multi-buff support for TX
 side
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-b4-stmmac-xmit-mb-v2-1-003347b7bc25@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQrCMBBEf0X27JZmjW315H9ID0nc2oBJNImlU
 vrvhuLRy8BjmDcLJI6WE5x3C0SebLLBF6D9Dsyo/J3R3goD1dTUJyLUElN2Thmcnc3oNGrddlw
 3nTSDhLJ7Rh7svDmv4Dmj5zlDX5rRphziZzubxNb/vIc/3kmgQNUKJcyRSEi6hJSq11s9THCuK
 gH9uq5fmb0dGcMAAAA=
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
X-Proofpoint-GUID: EDgxPcB8mafZ0SOSCrdPGaiVnmyNbzC1
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab518e3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=r9eGS2uEWaK6AkG2OsoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MiBTYWx0ZWRfX/AHFAOrax0OT
 XIvcW83yUinF4EeRFYIvyI3GOfBNtezLsotChHVYRywjVnBWxwstlQZQK/Z92qEJuU1t9BXvGfX
 6rsMDVugleR5G+6dQI07YHPwXi1iqD0kXubB5nZO/jZwxErvWOBOn8vs7K6jAl5MCUBrcFgOims
 pZFNkgVd4cj5QB3OUC9wTv9NjoXSo4IOEKK01RDVvQSAsH6MkRnEEbpJSIPj4PAuTjhCNn5AB8U
 U4vJcwKaP8JFkuiYHD5QnQLwq1SXspGQOmeH5eGR+G501xNNjibnMRMLOGYoh6XVfskt8p+MR0P
 WtSbob0KSoV2hC/qXMYGYRk8td6cyGOlKLitcE+W2wrqc15go0+eFCJstXeI3uhqBCdeioYVyth
 wF307eCUerzPBBEgLLwLvv+RaarZ8u3YvfoAqgJZ2aYCMpaxM4+unIZjRnxRq55HG0/fR0mQ1+1
 VF+P3viLk06ruzP8xqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MiBTYWx0ZWRfX6pLtvn7VS57s
 OOsOqwed+fNR6pQX10zpOIBGURfpabP5/AsBVx0TOuFvzFFndH3EvHkNuTjNE/jD9HynWUWa5hk
 j7ix8s23Gmq0sDTxx7u2VQPzeHWLdrk=
X-Proofpoint-ORIG-GUID: EDgxPcB8mafZ0SOSCrdPGaiVnmyNbzC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_053444_949770_0AE2BE33 
X-CRM114-Status: GOOD (  20.89  )
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
Changes in v2:
- Fix Tx coalescing logic in stmmac_xdp_xmit_xdpf()
- Consider the max between STMMAC_TX_THRESH() and num_frames as
  threshold in stmmac_xdp_xmit_xdpf().
- Link to v1: https://lore.kernel.org/r/20260923-b4-stmmac-xmit-mb-v1-1-a71a1c522142@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 126 ++++++++++++++--------
 1 file changed, 83 insertions(+), 43 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bf9e7e4cb1c3..089281ef9e61 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5239,77 +5239,117 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
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
+	while (true) {
+		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
+		int len = frag ? skb_frag_size(frag) : xdpf->len;
+		bool last_frame = i == num_frames - 1;
+		enum stmmac_txbuf_type buf_type;
+		dma_addr_t dma_addr;
 
-		buf_type = STMMAC_TXBUF_T_XDP_TX;
-	}
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
 
-	stmmac_set_tx_dma_entry(tx_q, entry, buf_type, dma_addr, xdpf->len,
-				false);
-	stmmac_set_tx_dma_last_segment(tx_q, entry);
+			buf_type = STMMAC_TXBUF_T_XDP_NDO;
+		} else {
+			struct page *page;
 
-	tx_q->xdpf[entry] = xdpf;
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
 
-	stmmac_set_desc_addr(priv, tx_desc, dma_addr);
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
 
-	stmmac_prepare_tx_desc(priv, tx_desc, 1, xdpf->len,
-			       csum, priv->descriptor_mode, true, true,
-			       xdpf->len);
+		entry = STMMAC_NEXT_ENTRY(entry, priv->dma_conf.dma_tx_size);
+		i++;
+	}
+	tx_q->tx_count_frames += num_frames;
 
-	tx_q->tx_count_frames++;
+	if (priv->tx_coal_frames[queue] &&
+	    (tx_q->tx_count_frames % priv->tx_coal_frames[queue]) < num_frames) {
+		struct stmmac_txq_stats *txq_stats;
 
-	if (tx_q->tx_count_frames % priv->tx_coal_frames[queue] == 0)
-		set_ic = true;
-	else
-		set_ic = false;
-
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
+	 * for this skb are populated.
+	 */
+	desc = stmmac_get_tx_desc(priv, tx_q, first_entry);
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

---
base-commit: 1c85ea5df86bed136589a2866c22f394020d3fdf
change-id: 20260922-b4-stmmac-xmit-mb-bb78e0684cf4

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


