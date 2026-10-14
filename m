Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351E9CC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VCwModZDCtBhM3y4K1tnj8cU+tnsu+uFycA0xv3Trc=; b=wkEZEzrVdMmEPnZ8/blJ1qUTLB
	Io/1PUpgvMk0MYy3eoXCHtgg9i8y3DWJ1nzMCzBdjCqFV9N2WII3zi9OwInG52TTFjcj3UQBYaGVR
	3ZFaYpgQZUuqInSeELy4xK/DLWE31qHV+MOGU2zgzB+uvbZN9wpEKbF22SrrbXvgliIn49Sl3ivY5
	OGmLofydDdgMHPknC+0F9AbHcfBiQxLrkULU6rZIcFs1gAqDEPt1Um0VYhiLdWv2RDxzeAxqIitKC
	kc3yIxC9C6e1DNWFBDLhEHgPb9luLb7i/+EAqYrw5w8l/aNTbS6y16BrA+NSjH/inFY06y/b9ZwpH
	z23lk26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGykC-0000000FXYQ-0abe;
	Wed, 14 Oct 2026 13:10:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyk9-0000000FXWl-0HKX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:10:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1VCwModZDCtBhM3y4K1tnj8cU+tnsu+uFycA0xv3Trc=; b=h8d9IXKijCtkduCA1r9bJnxBgd
	5b191jo9TD1DjVLnJkSfwwkR/wcLCHW6Egj0QsDd1RJSIvlc3XeG4SoOioArB9J9y7Xico4E/NrqN
	txGGNZC6u9rpcEoh4gKa3RUDQ6GCGPAZai2DhnSiGAKjDKv2wlu/f4E+mNycfJJho+amVxLO5JsE6
	zVIkz4M0fjR9PeAbxDMsDH0O8pVuieLKRHv9qPSCRLWCGA3DSv4QHz3d7OeZVGbFDpHVXCrpyK3V0
	8l3bSo+BwI29prjiDIv0FWiIECbAztbNcngVXgYQeIcybLliz1A7hGGOpg3fomar8uyJmfVxurAwn
	IR3ghUqg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGyk5-0000000GnXW-3hqp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:10:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBV57X2685171
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1VCwModZDCtBhM3y4K1tnj8cU+tnsu+uFycA0xv3Trc=; b=NJVrRUysbB17dyLJ
	IayeCz8/x52ovPqtRHaoVKrSx6jZ+ORObHAy4JN2OGF7BPdBhY+HmbEX04KDy1Aa
	KI/k1JB72Vy4E+F1hmgXXETGKRQGRpnr+If6XyCKhKKvhnk0yY8lmDwDT8SQXCXM
	9G1M7tNhtZisPOnSJPUvf/3ALKWhFIrXkLx1LmvT1i6vPuMnVJB3HmRzyOWTcGif
	UqHowTzsjUSbYl0cXutXVMSNKa7Tm18sKD7t5Ksi7NlV+r2N1xrY50q36foVdWtz
	MwieIOkyhBw9/Za4j58A7WiolIzAcsOYdKoKc9mt0IFKe1jxA2HQtmPEo5sY+6+D
	JB7cCw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u1pkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:09:59 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so232583241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983398; x=1792588198; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VCwModZDCtBhM3y4K1tnj8cU+tnsu+uFycA0xv3Trc=;
        b=j66UtIrTs7myJJQhqJOEVjUErDE4Hg7gLuEF96qseYZK0V5JI8zpMu6guObTtDWzoR
         IEACMaZVo0evPR+gs5Repvc7d5FggcpUGCnFtdx6YBR3t0FBESe2bwB+jzBmJ8VIjHWV
         90YDcq5nYjs1DNh7B5HmCCCA/enqhF/E6y+Bxa+2mcUX8rYqH4laM3TYe1uWX3pUF3vL
         afiEjcIV27pSM2Zhv+svmwToi3m9mhu1HlwQNG8slLLGIGshuof1B73Wowm6PowSaqrn
         JCZ+LonhiQzyI3pN2SoDlG1OAnysjSoFgW4HB1WN5ZmiN+nEZ2wXe5gEW7SvPtJAWB6M
         L4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983398; x=1792588198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1VCwModZDCtBhM3y4K1tnj8cU+tnsu+uFycA0xv3Trc=;
        b=RYK3yNAvE1cHZSEcSHBV+M4xBgdUGDuhCe0rncRWbWg3FgsRXAxFJWFWwyOJAMxlpK
         3VXUX6iO4SJIN3V4NgzhPpaZ4qiny01pQV6MC3GkrC2BdhtDyaly/g9MUT8bGM4rNyla
         HIj7ZQ3Ed5hg5QIzo5GGUDtnrvUT4y/HfZ8SMO86/xORbU1cSlltPKfpN06OpKUHLxRc
         4b33ycUYXysBHjpjDuKMtTRjNgiGeevaILYhrx1xWq8gbt2BCtviGail+kkR0e6ADCHi
         vGDSXCAhsJSl+fo+lOhulHBGKSBIWRBSn5P1iwUJg1XIGbCLAC7DqCaiTonZ56WwKkC3
         EAFg==
X-Forwarded-Encrypted: i=1; AKwUvBz2npjoJ6McFCcAGelIUmiK+1YC3Ilw5C7I+2+M/WOZr8PFjzo63VZ/2nm9ES3fh4V7Gujdg38vM9jeHdyenKWW@lists.infradead.org
X-Gm-Message-State: AFq9FYLBD3xUHv6L4/nNtH1Dz75GONb1DZhCxaiRfbJjH5EqEzlGQxT0
	c6SE5v2gafX6SwMVpl34HHIzUqPUu5KPuBIoFO5ymENUyhnIY3JdaiD4dtAvxdOB+nOu0ao5wVu
	pEe1D9ka5uO+Sd9/QzIyH+WmzPODLvtrA0uZ+p7tqm42hfv+Fu40DDhoTiGSSk+lvDqCGKvQ4aq
	hSWQ==
X-Gm-Gg: AYBFou3quLUHyc4QCeEZLDjcDl3VrlBKqJFpdiSgUKRs/BLy39CYDQ/BDqEmignfFdM
	pAc9U7splyqPiG49IpZzwgma0pae6keleIV9z0ohESVxlO+mOrbyTFRsUFFFELRnrDM7tG2l6L4
	7GcpcWqNstuu18+ESO0iEVmu9q8r99L+w0Rpo+uZG7s0sVT+/zVLhBEs2aunqztuRKOLCTYOopS
	E2SV05Ls176FTAdyAKbMJHMHDtWLC6aTpzmsmKn8lu2zugwPmO88CS+62vHo5arjJoHE77QwnrG
	/nYJvK/3rqdpvjkDqZWiFQqdNyxkkTfFW+zoV2txxPX+kaGJtrd48GrZTNvXR2OgKUgcQijalIJ
	ZVfeffz9UQanUog==
X-Received: by 2002:a05:6102:1609:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7cb372de97dmr3646953137.17.1791983398202;
        Wed, 14 Oct 2026 06:09:58 -0700 (PDT)
X-Received: by 2002:a05:6102:1609:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7cb372de97dmr3646922137.17.1791983397411;
        Wed, 14 Oct 2026 06:09:57 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b2ec47fcsm55844895e9.1.2026.10.14.06.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:09:56 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:09:36 +0200
Subject: [PATCH net-next v7 2/4] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-stmmac-rx-mb-v7-2-5d2d70f052cd@oss.qualcomm.com>
References: <20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com>
In-Reply-To: <20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com>
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
        bpf@vger.kernel.org, Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX9S044dZL/GBb
 vHFuCnuECuXHKAybIZLmcRB057FPCSQJpT+UNDu4LNjz+FKQvz41/Z1z01O0SAkZJnwckcngO+2
 DIDgW5qgEfcjY70ZDiQ3EWHPi3dOXWk=
X-Proofpoint-GUID: Rb_ZgRelIH9wBKUyVsPPhs-0DyAQi0xS
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acf7f27 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CzSfKeaMSJ9arFq4QbgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX373sSgEzXe1y
 l0YFp93WApyPBrHHFdoatHOL0rpNosojmz7Mz+fOVQ+QWMJZ8nxngkRfWsrcCTMqRBT2nPklL7s
 oFe0RsFIiL+DSTFEqesYFLStGJ2B4IfjX62TTyWqbyLHaUAOsKq2T/C/EPhs9N5mTVfEb4TeVOV
 MowhOF8rZolsxDL5otEh1Teu3q12DP7va9ZCBKVHVKqVTXhGIxDFuo0Fq6o/YqefJD0N4P8ohRq
 1dY1adcVbZEmxelLB3T2Fyfc5BWRvL8V0G/T5R4EtGkhIMvTNaZhgCUonj2HAahc9b+abUh83Gv
 ATrphsS5Uzk0Y0UiIDXUq/b3Y8XlNlGnk4WgNnn33b08T1ZrKLd8HA5mfxh6e4DL0JlnN0ODdJp
 CkhZwgPysasinTRxV0eesTaXa5ZyuAyidoO9YCqM7MYG79oZ2sINzYKh8RX6s0raM8IrZnan8xY
 gNL4O91wKKZMn1GnK0w==
X-Proofpoint-ORIG-GUID: Rb_ZgRelIH9wBKUyVsPPhs-0DyAQi0xS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_141002_469609_AEB9D5B7 
X-CRM114-Status: GOOD (  25.21  )
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

stmmac_rx_zc() assumes a 1:1 mapping between a received frame and an
XSK pool buffer and drops any frame that spans more than one RX
descriptor:

        /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
        if (likely(status & rx_not_ls)) {
                xsk_buff_free(buf->xdp);
                buf->xdp = NULL;
                dirty++;
                count++;
                goto read_again;
        }

The non-last descriptors are freed and dropped, but the frame is not
marked as errored. When the poll reaches the last descriptor of the
same frame, error is still 0, so the fragment is handled as a complete
frame: it is passed to the XDP program, copied into an skb on XDP_PASS,
or converted for XDP_TX. The tail starts in the middle of the original
payload at a predictable offset and, parsed as a fresh frame (len == 0),
stmmac_rx_buf1_len() reports the full dma_buf_sz length for it even
though the DMA engine only wrote the tail remainder into that buffer, so
the reads extend past the received bytes and can reach beyond the end of
the XSK pool buffer. GMAC4 always enables jumbo frames (GMAC_CONFIG_JE
in GMAC_CORE_INIT), so an on-link peer can trigger such a split even
when the interface MTU is left at 1500.

Set error when the 1:1 mapping check drops a descriptor, so the
remaining descriptors of the frame - including the last one - are
drained and released with xsk_buff_free() instead of being processed as
a new frame. Account every freed buffer with dirty and count the
dropped frame once in the poll budget / rx_pkt_n. The direct 1:1
mapping drop also increments rx_dropped.

Normalize the legacy normal and enhanced descriptor callbacks to report
rx_not_ls together with discard_frame for non-last descriptors. This
allows both stmmac_rx_zc() and stmmac_rx() to drain split frames on
dwmac100 and dwmac1000 instead of reparsing the final fragment as a new
packet.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c    |  2 +-
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 21 +++++++++++++--------
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 051253601225..297e2428a8f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -184,7 +184,7 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 
 	if (unlikely(!(rdes0 & RDES0_LAST_DESCRIPTOR))) {
 		x->rx_length++;
-		return discard_frame;
+		return discard_frame | rx_not_ls;
 	}
 
 	if (unlikely(rdes0 & RDES0_ERROR_SUMMARY)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index c4b613564f87..d19bf7ca4db3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -70,7 +70,7 @@ static int ndesc_get_rx_status(struct stmmac_extra_stats *x,
 
 	if (unlikely(!(rdes0 & RDES0_LAST_DESCRIPTOR))) {
 		x->rx_length++;
-		return discard_frame;
+		return discard_frame | rx_not_ls;
 	}
 
 	if (unlikely(rdes0 & RDES0_ERROR_SUMMARY)) {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f0835be2f65a..10ea72cbf889 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5695,18 +5695,21 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
-		if (unlikely(status == discard_frame)) {
-			xsk_buff_free(buf->xdp);
-			buf->xdp = NULL;
-			dirty++;
+
+		if (unlikely(status & discard_frame)) {
 			error = 1;
 			if (!priv->hwts_rx_en)
 				rx_errors++;
 		}
 
-		if (unlikely(error && (status & rx_not_ls)))
-			goto read_again;
 		if (unlikely(error)) {
+			xsk_buff_free(buf->xdp);
+			buf->xdp = NULL;
+			dirty++;
+
+			if (status & rx_not_ls)
+				goto read_again;
+
 			count++;
 			continue;
 		}
@@ -5715,8 +5718,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (likely(status & rx_not_ls)) {
 			xsk_buff_free(buf->xdp);
 			buf->xdp = NULL;
+			rx_dropped++;
+			error = 1;
 			dirty++;
-			count++;
 			goto read_again;
 		}
 
@@ -5883,7 +5887,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
-		if (unlikely(status == discard_frame)) {
+
+		if (unlikely(status & discard_frame)) {
 			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
 			buf->page = NULL;
 			error = 1;

-- 
2.56.0


