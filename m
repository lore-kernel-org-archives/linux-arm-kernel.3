Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDDFC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uaI3kmU3uE8s1l/mKjAGktkJ2ehGVLhz/2R5u1l102s=; b=Mjll0Li5fvUJLyafS8moFMcErx
	W9xTsrrF3VKst27DggS/GOn4UmC5EmHsnwuN52zoStkkXpdSYaHy0O3A1bMvnjgJbR8IPgHH+zVIr
	Xpx2xIeY/uO2hnesB7qeaTSTq1BhyC6D+mbpkDPp9Rxgs3VyxpKCYEKgkIC0SFol1OARptmSmrudg
	KBnVLiAXHhIdV0K1USQKnsNtqfUUkc6ozhhKFmBZbYbZziZqfonq+vq6QiNgNwSAEtjZ45/9u2FGg
	nLWCuO9gtCD4pmE1JT6gB+1Mq4qTo8rbg25F9YFuXfKTfbJhMjUrkm6onqQdtxjFhF8J3bf/oOxCK
	BVHk6PDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fJp-00000002Rqm-1z1r;
	Mon, 21 Sep 2026 14:48:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fJj-00000002Rpm-2E3d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:48:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGgSb2404379
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uaI3kmU3uE8s1l/mKjAGkt
	kJ2ehGVLhz/2R5u1l102s=; b=R0ATRRtLgmhprp72UGtSf+HLQUdYK5GgPOY8/4
	S3ZMu3hkX3IAGJjh/t5zNjKkONlQ3W9B1zJf92oFxROt4+tsJ5qzxLrN9IboGkLQ
	ZljeltC5oj5Cvh9tgmntlyuv2zM5p9x5g09wQjC7KTeVoubc+72TtQQJekwAkUOd
	o0x3A+YzaKF9N+UiJ04EAhqPBAzRrWJETseIFqrO9FLshfReve8nHvHwm7p1MDBT
	LbqY9koOKH6/v8Zj00+0TETmcuHxX3gBswszrpAWWEFFzA8CxTpDlrNM2goRnxKF
	raYnwV8isBj/LJ29etwH5kb5o3QCB4hhEJEKgiiv3gWcASeA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3vax7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:48:26 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7930cb5cd3aso2222787137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790002106; x=1790606906; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uaI3kmU3uE8s1l/mKjAGktkJ2ehGVLhz/2R5u1l102s=;
        b=NAw6iwDUfLteFTJqc7QICvVpfYPFaUvlXemsSvxMByjtgEu2rxjepwgsUJsNSci6eG
         sLoD9n4E3WuGjz7rSVOoJ7FhwdfoxtOaQTDjkvE5jkMJN7bnJkHWTyar2f6qPoIkqrM8
         vrCz7X118fvq/fRoC/fVXQjnFsLwrfzZGBoLvstmBLgfg0qDofVuImJDJHIQPC3w54dc
         csSvOnstdaSA8uiTrWcqg2TpyM4ogMt1huyA6sWPvOZBlI6VwnBhQbknlKnPLpabiWEG
         OModPAzzmVUW8qRTUnSX33QO/sVc92I2ZqhOokoR2yC0mQAH2uOBwZxMExhAzT0l3FTo
         9yKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002106; x=1790606906;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uaI3kmU3uE8s1l/mKjAGktkJ2ehGVLhz/2R5u1l102s=;
        b=UCiZmzMGi3hTcMJi+f04tYD+6oCzxvCBdpbTTb8IxH0qb29YNV9pn2mUafbP/v2Kf7
         MM7sGvCoCjP3utkGglk5GE97QBQ/Cbawa27ibYbPH33A5KyjACuqmNmVL8PdzMOgzIxk
         MgcH12eusj0AruiEfjnAOMVEf0bJNocIH5tzc0Z7v2T7NZ5snBPtjNZm8DDdSEAYo05P
         ftW8cNLodfkf1gr0B4U4BjV36Np42OqRclq1ezfIefp2nmQNWPK9WMTMYR/GZwclcdPh
         YamyA6ZczmCFy654ow2AAefS9T0My7mEmMbTPAWhVR7VWufkF8t1xsoia9VyYIV84qRq
         N05g==
X-Forwarded-Encrypted: i=1; AKwUvBzLI0gFH7F5jTiDcZFdDdkazXbE4EmdquPH/r3xAO9nxJDj5bWKS6klRcw4d07hhAgxVDIZj7/NLRnyjzMTWrbR@lists.infradead.org
X-Gm-Message-State: AFuF++mlQHEDlhQN1MugksQcT+2r6CYmQ0TsHwTaaOq2ekVTCOOEFDX8
	YI/rEIqCqSK8N1Zg8kwOmWLxpFVQQbkRDDbACIMtxrKFtWajpIEQ36VNMR7BJGe0adPzuWKdc6A
	aN71Nk8TU5wSu4wB92qGcnKH6Ja3zD65T/fW2pXZGhaQoX3bwE1LEm5Fm6DzmkR5dO8c5ZQUztV
	VLdQ==
X-Gm-Gg: AYBFou3Hv8jCfWAFsBhCI2KcO9YmQOL2AKjwp2SG0J+aOvnMweD4L+tA4KL+Xo1BFvx
	FV64geuSIVSfyZPu1AH/TDQSV9xipbMV8M2NC1FniVU1E0qi8O4xERYouIogkFd2RVEJ4y/mepc
	4xDwAIwWJmSnp+/bcWsHyxcOZNwKYa7okoTx8viSrwCmP9q626p3+6BnOAhNPOUjgxfYL1poorW
	z4POFXTJogyhnnuUWv5nm6aJ4pe0gM/GaW55lic02iOIoaQRnUXFAK91zIPVqNZn9EM0VK24arL
	C0e1DXmWdaDvwTrVO45n/6ektv/kv8eQiOIKBenLpqC4dV41AUC3Hi96Ln1d2PP21zwdhshBEiT
	nMcInrbEz3o9n/g==
X-Received: by 2002:a05:6102:e0e:b0:7a6:ef60:dac with SMTP id ada2fe7eead31-7a6ef6011abmr3250808137.34.1790002105554;
        Mon, 21 Sep 2026 07:48:25 -0700 (PDT)
X-Received: by 2002:a05:6102:e0e:b0:7a6:ef60:dac with SMTP id ada2fe7eead31-7a6ef6011abmr3250729137.34.1790002104845;
        Mon, 21 Sep 2026 07:48:24 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd1f0a061sm170708595e9.12.2026.09.21.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:48:24 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:47:53 +0200
Subject: [PATCH net v2] net: stmmac: fix rx Scatter-Gather support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-stmmac-rx-sg-fix-v2-1-b6d88c5ac2d7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6DIBREr2L+ut8AbRW76j0aF6CgJAVavjU2h
 ruXuO9mkpnJvNmBTHKG4FbtkMzqyMVQjDhVMMwqTAbdWDwIJhrW8QZp8V4NmDakCa3bUMlRjFK
 dtWIcyuyVTIkP5AOCWaAv4exoiel73Kz8qP4TV44c9aXTrZa2FVd7j0T1+6OeQ/S+LgJ9zvkHW
 oLSxrwAAAA=
X-Change-ID: 20260916-stmmac-rx-sg-fix-a8d2d8a3ba01
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Ytia1IYX c=1 sm=1 tr=0 ts=6ab143ba cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YI1BYhXVuOdgUOMkKCkA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: EEJpnG9xOI9E3YSF6PnUUHNgxI1YIB_a
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfXyoZvwOtxundY
 XdyMztREid6yxtl+Heio2aEI7Lqwi9O3ta8Uwl1vBYxdqDX6LOsXuUjwiZ3P+dHF9tcWuSoYBMw
 YqvnhWZatpsZ/3+SzBGVlpgXkEuaxKw=
X-Proofpoint-GUID: EEJpnG9xOI9E3YSF6PnUUHNgxI1YIB_a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxNSBTYWx0ZWRfX/4YkqZOpZdTJ
 M0iJTSymbHKsq8/CRbtBZdhqpSwmnW45eKwjv7gRuC4nA8vRuDyA9P1puNcJ5kZP/BZbnFo60iK
 HkhfEuVgrXE3h7sVYvvrfbwBraDPY8/T0sIMo0GWqzbLj0Y4K/bfGbZQiPsXsQjfmuufNUJ4nYi
 8o+F/e4EQ1cmYI4k/ewLLAYdatoVDZ3Q2zn7yDFQNVF5wnjk1/zQ7fxmGe0YM6ctLKPD6hSzAQ7
 WxKfCK+Edr0yKPj+jxYBYcZywzxpTBt2l3fPZGT2si81D/PA9KRi7xemrPzcJTCcFZkyVdym/fk
 KIbbDzV8uo6W+PpX07lqLUmy1o4OkW48A9pImYVsaxBk3Bk3/M55ZfQPYGEzZt9gmsNkAhMRXAn
 5CoOy7EZN+BM0yso/aIVlQO9pgCTC6x/vXqMDIlSITA0LSgC9FEJsdu8AFzUlgmj6vzmbzyx/pX
 z0YOYugVPn00OHRpfqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_074827_596697_900B3A05 
X-CRM114-Status: GOOD (  29.42  )
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

When a received frame is larger than dma_buf_sz, the DMA scatters it
across multiple RX descriptors (rx Scatter-Gather). The secondary RX
buffer (sec_page) was only allocated and programmed when split-header
(SPH) was active, so for regular frames buffer2 was neither allocated
nor backed by a valid mapping. As soon as an incoming frame overflowed
buffer1, the DMA wrote the overflow into the unmapped secondary-buffer
address, triggering an SMMU translation fault on IOMMU-based platforms:

arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x7f0011, cbfrsynra=0x1c90, cb=11
arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c90
arm-smmu 15000000.iommu: FSYNR0 = 007f0011 [S1CBNDX=127 WNR PLVL=1]

Enable scatter-gather for non-SPH frames on cores that can program an
independent secondary RX buffer (GMAC4/XGMAC): allocate and mark buffer2
as valid in stmmac_init_rx_buffers() and stmmac_rx_refill(), and account
for it in the buffer length computation. Legacy cores have no set_sec_addr
op, so they keep buffer2 disabled.

Since buffer2 is handed to the DMA at page offset 0, the page pool sync
window is widened to cover both buffers in every mode: offset is set to 0
and max_len to dma_buf_sz + stmmac_rx_offset().

The FCS can straddle the buffer1/buffer2 boundary and a descriptor
boundary, so it is now stripped from the tail of the assembled frame with
skb_trim() instead of from a single buffer, avoiding an unsigned underflow
for frames that overflow a buffer by 1..3 bytes. For single-buffer frames
the XDP program must not see the FCS, so it is removed from the XDP buffer
before the program runs.

Native XDP currently only supports single-buffer (linear) frames. An
oversized frame accepted by the MAC (jumbo enabled) is received via
buffer2; the XDP program only sees buffer1, so on a TX/REDIRECT verdict
the frame is forwarded truncated. XDP multi-buffer support to handle
this case is planned as a follow-up.

AF_XDP zero-copy RX is not covered by this change: a ZC queue still
programs buffer2 at DMA address 0 (and XGMAC has no buffer2-valid bit),
so an oversized frame overflowing buffer1 can still trigger the same
SMMU translation fault. Handling is planned as a follow-up.

Fixes: 88ebe2cf7f3f ("net: stmmac: Rework stmmac_rx()")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Gate buf2 allocation by stmmac_rx_check_buf2_cap() routine.
- Always set pp_params.offset to 0 and pp_params.max_len to dma_buf_sz +
  rx_offset.
- Do not remove fcs_len from buf1_len or buf2_len, just from len
  counter.
- Link to v1: https://lore.kernel.org/r/20260916-stmmac-rx-sg-fix-v1-1-b49b7b8f725f@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 84 ++++++++++++++---------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 11035b7d944e..d41892b56c5a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1629,6 +1629,16 @@ static void stmmac_clear_descriptors(struct stmmac_priv *priv,
 		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
 }
 
+static bool stmmac_rx_check_buf2_cap(struct stmmac_priv *priv)
+{
+	/* Only cores that can program an independent secondary RX buffer
+	 * (used for scatter-gather overflow or split-header payload) back
+	 * buffer2. Legacy cores have no set_sec_addr op, so buffer2 is
+	 * never handed to the hardware there.
+	 */
+	return priv->hw->desc && priv->hw->desc->set_sec_addr;
+}
+
 /**
  * stmmac_init_rx_buffers - init the RX descriptor buffer.
  * @priv: driver private structure
@@ -1659,16 +1669,13 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 		buf->page_offset = stmmac_rx_offset(priv);
 	}
 
-	if (priv->sph_active && !buf->sec_page) {
+	if (stmmac_rx_check_buf2_cap(priv) && !buf->sec_page) {
 		buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
 		if (!buf->sec_page)
 			return -ENOMEM;
 
 		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
 		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
-	} else {
-		buf->sec_page = NULL;
-		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
 	}
 
 	buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
@@ -2256,13 +2263,8 @@ static int __alloc_dma_rx_desc_resources(struct stmmac_priv *priv,
 	pp_params.nid = dev_to_node(priv->device);
 	pp_params.dev = priv->device;
 	pp_params.dma_dir = xdp_prog ? DMA_BIDIRECTIONAL : DMA_FROM_DEVICE;
-	pp_params.offset = stmmac_rx_offset(priv);
-	pp_params.max_len = dma_conf->dma_buf_sz;
-
-	if (priv->sph_active) {
-		pp_params.offset = 0;
-		pp_params.max_len += stmmac_rx_offset(priv);
-	}
+	pp_params.offset = 0;
+	pp_params.max_len = dma_conf->dma_buf_sz + stmmac_rx_offset(priv);
 
 	rx_q->page_pool = page_pool_create(&pp_params);
 	if (IS_ERR(rx_q->page_pool)) {
@@ -5097,7 +5099,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 				break;
 		}
 
-		if (priv->sph_active && !buf->sec_page) {
+		if (stmmac_rx_check_buf2_cap(priv) && !buf->sec_page) {
 			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
 			if (!buf->sec_page)
 				break;
@@ -5108,10 +5110,8 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 		buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
 
 		stmmac_set_desc_addr(priv, p, buf->addr);
-		if (priv->sph_active)
-			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
-		else
-			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
+		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
+					 stmmac_rx_check_buf2_cap(priv));
 		stmmac_refill_desc3(priv, rx_q, p);
 
 		rx_q->rx_count_frames++;
@@ -5142,7 +5142,9 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 	unsigned int plen = 0, hlen = 0;
 	int coe = priv->hw->rx_csum;
 
-	/* Not first descriptor, buffer is always zero */
+	/* Not first descriptor, SPH enabled: buffer1 only carries the
+	 * split header of the first descriptor, so it is zero here.
+	 */
 	if (priv->sph_active && len)
 		return 0;
 
@@ -5153,14 +5155,16 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 		return hlen;
 	}
 
-	/* First descriptor, not last descriptor and not split header */
+	/* Not last descriptor and not split header: buffer1 is fully filled */
 	if (status & rx_not_ls)
 		return priv->dma_conf.dma_buf_sz;
 
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
-	/* First descriptor and last descriptor and not split header */
-	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen);
+	/* Last descriptor and not split header: buffer1 holds the remaining
+	 * bytes of the frame, up to dma_buf_sz
+	 */
+	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen - len);
 }
 
 static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
@@ -5170,8 +5174,7 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	int coe = priv->hw->rx_csum;
 	unsigned int plen = 0;
 
-	/* Not split header, buffer is not available */
-	if (!priv->sph_active)
+	if (!stmmac_rx_check_buf2_cap(priv))
 		return 0;
 
 	/* For GMAC4, when split header is enabled, in some rare cases, the
@@ -5188,14 +5191,15 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	 * Thus 'plen - len' always gives the correct length of buf2.
 	 */
 
-	/* Not GMAC4 and not last descriptor */
-	if (priv->plat->core_type != DWMAC_CORE_GMAC4 && (status & rx_not_ls))
+	/* Not GMAC4, or non-SPH and not last descriptor */
+	if ((priv->plat->core_type != DWMAC_CORE_GMAC4 || !priv->sph_active) &&
+	    (status & rx_not_ls))
 		return priv->dma_conf.dma_buf_sz;
 
 	/* GMAC4 or last descriptor */
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
-	return plen - len;
+	return plen > len ? plen - len : 0;
 }
 
 static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
@@ -5718,6 +5722,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	bool fcs_stripped = false;
 	int xdp_status = 0;
 	int bufsz;
 
@@ -5807,24 +5812,31 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		len += buf2_len;
 
 		/* ACS is disabled; strip manually. */
-		if (likely(!(status & rx_not_ls))) {
-			if (buf2_len) {
-				buf2_len -= ETH_FCS_LEN;
-				len -= ETH_FCS_LEN;
-			} else if (buf1_len) {
-				buf1_len -= ETH_FCS_LEN;
-				len -= ETH_FCS_LEN;
-			}
-		}
+		if (likely(!(status & rx_not_ls)))
+			len -= ETH_FCS_LEN;
 
 		if (!skb) {
 			unsigned int pre_len, sync_len;
 
+			/* Each frame starts here: reset the FCS handling */
+			fcs_stripped = false;
+
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
 			net_prefetch(page_address(buf->page) +
 				     buf->page_offset);
 
+			/* The XDP program must not see the FCS. This only
+			 * applies to a single-buffer frame (buf2_len == 0),
+			 * where the whole frame and its FCS sit in buffer1;
+			 * otherwise the FCS is stripped from the assembled
+			 * frame with skb_trim().
+			 */
+			if (stmmac_xdp_is_enabled(priv) && !buf2_len) {
+				buf1_len -= ETH_FCS_LEN;
+				fcs_stripped = true;
+			}
+
 			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, true);
@@ -5925,6 +5937,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Got entire packet into SKB. Finish it. */
 
+		/* Remove FCS if needed */
+		if (!fcs_stripped)
+			skb_trim(skb, len);
+
 		stmmac_get_rx_hwtstamp(priv, p, np, skb);
 
 		if (priv->hw->hw_vlan_en)

---
base-commit: 9bca72a2dd0663d4b39a5d4ed252ad78a8569b5d
change-id: 20260916-stmmac-rx-sg-fix-a8d2d8a3ba01

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


