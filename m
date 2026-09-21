Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1478C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jl71JFVeIBL/MZQdt3BzOfazAM3dFwYN4cwsPwRgqwI=; b=ljqTbowdnbGQPbGi2AAHqJUTH0
	wCpQwYD3s68QnplObbpkDBrW3+w+hTllrJz9TRZnWM8BZyL/RtlLu1iJbZ6znJPKcqkoMRdmz/EUM
	GNTpuh9yzAT+uBWU9gifdO7AVx8elOrM9RUGRmcCD0HoBvOWihnaQRf1m9nSm/3rlHPQHPvSaVhte
	Szdo3SQkIxKEA6C+VCmj3ApwuVqRYeolzo143Be3keGOJwqICGmZLHn6JLugEtV6vb6Zxio0dfzvq
	uElytJSHvM5TNfKzi1Pm99sdLHuOA2rbhgpL5gGFKXgjuZDU0UUJ1/gMLIQnJHcCUUSO8krPr2V52
	0hCo4dIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZrK-00000001Q0k-4AV4;
	Mon, 21 Sep 2026 08:58:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZrH-00000001Q04-3dZi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 08:58:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79suF1096065
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jl71JFVeIBL/MZQdt3BzOf
	azAM3dFwYN4cwsPwRgqwI=; b=WC3JviOgm0t/YkloMCLjbL/OjH1KiL/lK2ZAo+
	0TF10UZABlaG1ds2eKPduppVq1lAeOMNgCdXaL7JdX5smp5Y6ImlQNvH7RgSNQOQ
	/kfRyI4Q8Vq67zP8NrDGI7PmD1i3toYCS/xIuGQv221CnT5dsoTFqiaTeLKUfbc0
	7+JRjmWMC+p4mUuDrjdj9yB/pV/BmQs5h5ShBWDO5lGXcryMM5hgfq0vnXwVF4m1
	BkrQfaelhi+jc+B4wTfiAbNeH7KZEJjlt/60vuFiIES9WyWeqQT8u9cWCGtqGZZg
	/ZuF4OFP2zJNp5QTAlRp3/Pkkuae2f4azziqwi4M0hVB868w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw0fgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:58:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f925ba4eso383934085a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 01:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789981122; x=1790585922; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jl71JFVeIBL/MZQdt3BzOfazAM3dFwYN4cwsPwRgqwI=;
        b=QZ0wTpOIrQ++iFKtpAMZjNh536oCPkqnU4WZlsqVFIYOzNUnSf4//S8g4z6QD4OCoT
         CqZVN2mUboZREcmwjOh2piNgeHiniL8Ewvo4kGY5qBgFGZNbRX3SNK21rfz6sPi4I5hw
         ISaZf3J9e/AJwy2bL4ifWHMQAjBrF0Aag2ZYnQGE/3/mafUNGrMBtxjASNgW1q415Fm8
         ybmtDtWvE1M3yFnrx7LHgDIywecpooyibNvAMu89qKy33hOzL054py7ig8F5xWbCYZ95
         LMbyp4AAp8MPgsWY8TMqDf9JopA38vqFk1BAPgb0npy5j0U40mYBliIRdoaRa4rGG0d/
         8nqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981122; x=1790585922;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jl71JFVeIBL/MZQdt3BzOfazAM3dFwYN4cwsPwRgqwI=;
        b=OK+ahFR0rB2xcNaDHBNzXuCYzYm0k/s6oVlyjJV113ixp0KdZvn2RfVs1tjkv/teQa
         04lWtkl/s/6/7a818gS16L7jAYD3sNFgvXhV37tiBQhiqPUBYjAC5mqd8u5gxfBAQK8i
         91vV4KdOm/y4pa4pYGM7GpVOUAw+0ERLjYTFtP7m1hci3Sa/VLd+BJHK7L9RPxCapwss
         M4VXXsxj9DogWF0H6uM+SRqkqlVIn5qqeCMxmdVGEzF4hhd4OgFaJUVwLGv4hRfuHIVO
         Cc+imX1pgTIsT5PQyrTLF1fIBybR7+3NqQ/QxPsAh4K7HyQGx5nT766iWiYyaOhxUmdt
         ZBQw==
X-Forwarded-Encrypted: i=1; AKwUvBwQ7Ksw7HZwaYYtzWqFSoEorTkoXaNc+YuXZkNGWPTw6TOHRtpMtoIzk/gJA8otcefxDMXnu/xCXYJSShTxOJIf@lists.infradead.org
X-Gm-Message-State: AFuF++nEw22pr6RTQ9LRAikBUHF3ttX9bM9YWGeo+QH5PkREQKG3toP1
	FTVyGEtx3epFIL5h8xYfmsWjIzSn+8SP1hhyQ8uxggvKwj6VWmx+qJR10cNlinBybWVudQeJ6bu
	u4ebJ4GzNJVbT1Otw7mrOrTERUW2iCk3cTJcHO/F9swfQrfj43f3Am5/+dRq+MRns43ZcrEZNAg
	q2gw==
X-Gm-Gg: AYBFou021Y0wMJRwR7Wlj+go9Z7PES+npPLYLkPgoo4eiiLo+PD20JHdDPdmaLr8UkA
	0JD/3lBKqLGuHTcaiA2BRCpUAjSdys6a9uY1rtu/ocm7KR2e0bBgLJSxZLpLjSA5jmUcM+72YtL
	MZLuB/FPk/AcLxwbiNc0lu3pd2iC49x4ZEIJxcDO6kEQrU580R9q8jxoJXg8elT8oPIK6m00wQc
	nXxEtc/IyL8Dp4H/eoSjNUNz+N9b+SYrnUaNmwsMOD71rBtKbOcSKCdYi4qBI48fKcfUNB5Mw2o
	UnrlIVucU+WqV6Crt+xuUJOHgj7b9jA4YQ5zfXkoT+vTm613yRPRTW3BN+JVYVZFGnCPyfWzRsU
	X1gdRmG2pV8hjWQ==
X-Received: by 2002:a05:620a:298c:b0:93b:d7a1:ba0b with SMTP id af79cd13be357-93bf5742f73mr970964185a.54.1789981121893;
        Mon, 21 Sep 2026 01:58:41 -0700 (PDT)
X-Received: by 2002:a05:620a:298c:b0:93b:d7a1:ba0b with SMTP id af79cd13be357-93bf5742f73mr970961685a.54.1789981121379;
        Mon, 21 Sep 2026 01:58:41 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244608e7sm22478423f8f.6.2026.09.21.01.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:58:40 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:58:26 +0200
Subject: [PATCH net-next v2] net: stmmac: rework stmmac_rx to support XDP
 rx multi-buff
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-stmmac-rx-mb-v2-1-6e826e1ff306@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQqDMBBEf0X23JVsSLX21P8oHqKuNdAkbZKKR
 fLvDZ57GXgM82aHyMFwhGu1Q+DVRONdAXmqYFy0ezCaqTBIIRvR0QVjslaPGDa0A1Kjmk7LlhR
 rKJNX4Nlsh+4OjhM63hL0pVlMTD58j5+Vjv6/ciUkFIM6UzspofR88zHW749+jt7augT0Oecfp
 O31FbkAAAA=
X-Change-ID: 20260918-stmmac-rx-mb-16469a2714ea
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyOCBTYWx0ZWRfX0yHto3l0LUI3
 +PH5IJKOFH9KnEd729TUab0kHIao+Y6q4t85DYVwsMkrByMk/biiK7mrgVPSlnxxcs7Q7jlDYuq
 +H1pX9KQ6mhRFbSGBYBOeN5DSms/1cFPR0G7Ks6mkRVmLaF+0Opk6ptPDI4LLqtBL5Li+sgMX+e
 73g1Ji8Om+J5CgKHRYQKfw+R6xR/A9K8GBtjaRyXIsSDffozlWVE0vOUFYj24q1ayy/9KrVNyem
 4RYUCtusfMM2RIFW/KlshZ76IbjsqeTmk4vNMRPefar/h+e+rUD7GxHPwiqPTlD3Wb7Zy5dqOHL
 vP9SPkaZZKhsg5D+O2khHs549lSMREXTnpIXMyC6/VDdfKsbr3gpAkPiGen9GzOlXQelDZyXpfv
 TYPRsgy1sKKGdM1i/rUT0Qv6Hgzuufbikr6E5B0kznkpZPfxDd4JZcv5noM9ugyzhlPovkTFueu
 T+vkJupW+Cfom/MGkGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyOCBTYWx0ZWRfX9MMVdTiVx3DC
 WFqIWqfc0gP7ariJh5EYEQIozqODNYxfbi5VENJAd0cn1s0lJursXj/R2A8r6uJJ9/pn28CRzki
 n+tlFisRd2ilY4o2E8RfvjW51Zj4LEI=
X-Proofpoint-ORIG-GUID: LvxDNufA96hGBwLdNv3Njiu9ncTK21Gs
X-Proofpoint-GUID: LvxDNufA96hGBwLdNv3Njiu9ncTK21Gs
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab0f1c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rAskiDj5dFfVSkN7usYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_015844_035701_33531D26 
X-CRM114-Status: GOOD (  27.96  )
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

Build the xdp_buff by accumulating all the descriptors that make up a
frame, so the XDP program runs on the full (possibly fragmented) packet
instead of just the first buffer. When the frame is not consumed by the
program, assemble the skb from the head buffer and the collected
fragments via napi_build_skb()/xdp_update_skb_frags_info().

To do so, store the in-progress xdp_buff in rx_q->state instead of the
partially built skb, so the accumulated head and fragments survive a
NAPI poll boundary (mid-frame dma_own or dirty_rx break). The state is
saved only while a frame is in progress and cleared once it completes,
leaving it untouched when the poll does not process anything (e.g.
netpoll invoked with a zero budget).

In addition:
- build the skb head with napi_build_skb() passing xdp->frame_sz, so
  skb_shinfo() lands on the same shared_info the fragments were
  accumulated into;
- attach fragments with xdp_buff_add_frag(), which initializes all the
  shared_info fields and takes care of the pfmemalloc bit;
- release all buffers belonging to a frame when it is dropped on RX
  errors, instead of leaking the ones already attached to the xdp_buff;
- drop the whole frame when the number of fragments exceeds
  MAX_SKB_FRAGS, instead of delivering a truncated one;
- skip zero-length fragments, which can happen for non-first
  descriptors when split-header (SPH) is enabled.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Rely on xdp_buff_add_frag() to create xdp fragments
- Fix bugs in rx_q state recording
- Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
- Cosmetics
- Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517d404af@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 202 ++++++++++++++--------
 2 files changed, 131 insertions(+), 73 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..69bdbbf4b920 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -132,7 +132,7 @@ struct stmmac_rx_queue {
 	dma_addr_t dma_rx_phy;
 	unsigned int state_saved;
 	struct {
-		struct sk_buff *skb;
+		struct xdp_buff xdp;
 		unsigned int len;
 		unsigned int error;
 	} state;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bf9e7e4cb1c3..7d1149511c55 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1695,7 +1695,8 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 		if (!buf->sec_page)
 			return -ENOMEM;
 
-		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
+		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page) +
+				buf->page_offset;
 		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
 	} else {
 		buf->sec_page = NULL;
@@ -5140,7 +5141,8 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 			if (!buf->sec_page)
 				break;
 
-			buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
+			buf->sec_addr = page_pool_get_dma_addr(buf->sec_page) +
+					buf->page_offset;
 		}
 
 		buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
@@ -5735,6 +5737,70 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 	return failure ? limit : (int)count;
 }
 
+static void
+stmmac_xdp_put_buff(struct stmmac_rx_queue *rx_q, struct xdp_buff *xdp,
+		    int sync_len)
+{
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
+	int i;
+
+	if (likely(!xdp_buff_has_frags(xdp)))
+		goto out;
+
+	for (i = 0; i < sinfo->nr_frags; i++)
+		page_pool_put_full_page(rx_q->page_pool,
+					skb_frag_page(&sinfo->frags[i]), true);
+out:
+	page_pool_put_page(rx_q->page_pool, virt_to_head_page(xdp->data),
+			   sync_len, true);
+}
+
+static struct sk_buff *stmmac_build_skb(struct xdp_buff *xdp)
+{
+	struct skb_shared_info *sinfo = xdp_get_shared_info_from_buff(xdp);
+	u32 metasize = xdp->data - xdp->data_meta;
+	struct sk_buff *skb;
+	u8 num_frags = 0;
+
+	if (unlikely(xdp_buff_has_frags(xdp)))
+		num_frags = sinfo->nr_frags;
+
+	skb = napi_build_skb(xdp->data_hard_start, xdp->frame_sz);
+	if (!skb)
+		return NULL;
+
+	skb_mark_for_recycle(skb);
+	skb_reserve(skb, xdp->data - xdp->data_hard_start);
+	skb_put(skb, xdp->data_end - xdp->data);
+	if (metasize)
+		skb_metadata_set(skb, metasize);
+
+	if (unlikely(xdp_buff_has_frags(xdp)))
+		xdp_update_skb_frags_info(skb, num_frags, sinfo->xdp_frags_size,
+					  num_frags * xdp->frame_sz,
+					  xdp_buff_get_skb_flags(xdp));
+	return skb;
+}
+
+static bool stmmac_build_xdp_frags(struct stmmac_priv *priv,
+				   struct stmmac_rx_queue *rx_q,
+				   unsigned int len, struct page *page,
+				   unsigned int offset,
+				   enum dma_data_direction dma_dir,
+				   struct xdp_buff *xdp)
+{
+	dma_addr_t dma_addr = page_pool_get_dma_addr(page) + offset;
+
+	dma_sync_single_for_cpu(priv->device, dma_addr, len, dma_dir);
+	if (!xdp_buff_add_frag(xdp, page_to_netmem(page), offset, len,
+			       xdp->frame_sz)) {
+		page_pool_put_full_page(rx_q->page_pool, page, true);
+		return false;
+	}
+
+	return true;
+}
+
 /**
  * stmmac_rx - manage the receive process
  * @priv: driver private structure
@@ -5756,11 +5822,12 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	bool first_desc = true;
 	int xdp_status = 0;
 	int bufsz;
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
-	bufsz = DIV_ROUND_UP(priv->dma_conf.dma_buf_sz, PAGE_SIZE) * PAGE_SIZE;
+	bufsz = rx_q->napi_skb_frag_size;
 
 	if (netif_msg_rx_status(priv)) {
 		void *rx_head = stmmac_get_rx_desc(priv, rx_q, 0);
@@ -5780,9 +5847,10 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		u32 hash;
 
 		if (!count && rx_q->state_saved) {
-			skb = rx_q->state.skb;
+			ctx.xdp = rx_q->state.xdp;
 			error = rx_q->state.error;
 			len = rx_q->state.len;
+			first_desc = false;
 		} else {
 			rx_q->state_saved = false;
 			skb = NULL;
@@ -5820,21 +5888,21 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
+
 		if (unlikely(status == discard_frame)) {
-			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
-			buf->page = NULL;
 			error = 1;
 			if (!priv->hwts_rx_en)
 				rx_errors++;
 		}
 
-		if (unlikely(error && (status & rx_not_ls)))
-			goto read_again;
 		if (unlikely(error)) {
-			dev_kfree_skb(skb);
-			skb = NULL;
-			count++;
-			continue;
+			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
+			buf->page = NULL;
+
+			if (status & rx_not_ls)
+				goto read_again;
+
+			goto error_free_frag;
 		}
 
 		/* Buffer is good. Go on. */
@@ -5855,9 +5923,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			}
 		}
 
-		if (!skb) {
-			unsigned int pre_len, sync_len;
-
+		if (first_desc) {
 			dma_sync_single_for_cpu(priv->device, buf->addr,
 						buf1_len, dma_dir);
 			net_prefetch(page_address(buf->page) +
@@ -5866,6 +5932,33 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, true);
+			first_desc = false;
+			buf->page = NULL;
+		} else if (buf1_len) {
+			error |= !stmmac_build_xdp_frags(priv, rx_q, buf1_len,
+							 buf->page,
+							 buf->page_offset,
+							 dma_dir, &ctx.xdp);
+			buf->page = NULL;
+		}
+
+		if (buf2_len) {
+			error |= !stmmac_build_xdp_frags(priv, rx_q, buf2_len,
+							 buf->sec_page,
+							 buf->page_offset,
+							 dma_dir, &ctx.xdp);
+			buf->sec_page = NULL;
+		}
+
+		if (likely(status & rx_not_ls))
+			goto read_again;
+
+		if (unlikely(error))
+			goto error_free_frag;
+
+		first_desc = true;
+		if (!skb) {
+			unsigned int pre_len, sync_len;
 
 			pre_len = ctx.xdp.data_end - ctx.xdp.data_hard_start -
 				  buf->page_offset;
@@ -5887,26 +5980,18 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 				unsigned int xdp_res = -PTR_ERR(skb);
 
 				if (xdp_res & STMMAC_XDP_CONSUMED) {
-					page_pool_put_page(rx_q->page_pool,
-							   virt_to_head_page(ctx.xdp.data),
-							   sync_len, true);
-					buf->page = NULL;
+					stmmac_xdp_put_buff(rx_q, &ctx.xdp, sync_len);
 					rx_dropped++;
 
 					/* Clear skb as it was set as
 					 * status by XDP program.
 					 */
 					skb = NULL;
-
-					if (unlikely((status & rx_not_ls)))
-						goto read_again;
-
 					count++;
 					continue;
 				} else if (xdp_res & (STMMAC_XDP_TX |
 						      STMMAC_XDP_REDIRECT)) {
 					xdp_status |= xdp_res;
-					buf->page = NULL;
 					skb = NULL;
 					count++;
 					continue;
@@ -5914,51 +5999,13 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 			}
 		}
 
+		skb = stmmac_build_skb(&ctx.xdp);
 		if (!skb) {
-			unsigned int head_pad_len;
-
-			/* XDP program may expand or reduce tail */
-			buf1_len = ctx.xdp.data_end - ctx.xdp.data;
-
-			skb = napi_build_skb(page_address(buf->page),
-					     rx_q->napi_skb_frag_size);
-			if (!skb) {
-				page_pool_recycle_direct(rx_q->page_pool,
-							 buf->page);
-				rx_dropped++;
-				count++;
-				goto drain_data;
-			}
-
-			/* XDP program may adjust header */
-			head_pad_len = ctx.xdp.data - ctx.xdp.data_hard_start;
-			skb_reserve(skb, head_pad_len);
-			skb_put(skb, buf1_len);
-			skb_mark_for_recycle(skb);
-			buf->page = NULL;
-		} else if (buf1_len) {
-			dma_sync_single_for_cpu(priv->device, buf->addr,
-						buf1_len, dma_dir);
-			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
-					buf->page, buf->page_offset, buf1_len,
-					priv->dma_conf.dma_buf_sz);
-			buf->page = NULL;
-		}
-
-		if (buf2_len) {
-			dma_sync_single_for_cpu(priv->device, buf->sec_addr,
-						buf2_len, dma_dir);
-			skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
-					buf->sec_page, 0, buf2_len,
-					priv->dma_conf.dma_buf_sz);
-			buf->sec_page = NULL;
-		}
-
-drain_data:
-		if (likely(status & rx_not_ls))
-			goto read_again;
-		if (!skb)
+			stmmac_xdp_put_buff(rx_q, &ctx.xdp, -1);
+			rx_dropped++;
+			count++;
 			continue;
+		}
 
 		/* Got entire packet into SKB. Finish it. */
 
@@ -5989,13 +6036,24 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		rx_packets++;
 		rx_bytes += len;
 		count++;
+		continue;
+error_free_frag:
+		if (!first_desc) {
+			stmmac_xdp_put_buff(rx_q, &ctx.xdp, -1);
+			first_desc = true;
+		}
+		dev_kfree_skb(skb);
+		skb = NULL;
+		count++;
 	}
 
-	if (status & rx_not_ls || skb) {
-		rx_q->state_saved = true;
-		rx_q->state.skb = skb;
-		rx_q->state.error = error;
-		rx_q->state.len = len;
+	if (count || !first_desc) {
+		rx_q->state_saved = !first_desc;
+		if (!first_desc) {
+			rx_q->state.xdp = ctx.xdp;
+			rx_q->state.error = error;
+			rx_q->state.len = len;
+		}
 	}
 
 	stmmac_finalize_xdp_rx(priv, xdp_status);

---
base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
change-id: 20260918-stmmac-rx-mb-16469a2714ea

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


