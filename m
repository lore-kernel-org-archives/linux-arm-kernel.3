Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD16CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 17:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHmd60/I6Rn3BFHeK6JI59ohI+LrPrPqxSimo7k7Esk=; b=ITk08MVSStEfse1Z1LsbYjCAyn
	/NMY8Mn1VWbu0CSewcvqEDwlk8LTmwYgQJiV1P3qwTyc9ZDqudCoz1RWqHIG2sOucOsFdiIEvXNs2
	MxklddPJ8HdRzcLqAiBFoVqvlZKrCUIEKGrPWihntmkUOOFYGkypPN8iRRsUfQvIOcyKQnZge6Sv7
	0JB+/io8oxwB1c3plpo5cKhkAeXjF5+aGulNKVegpHj9VgxFr6Fz+tvZFFSq6+kCAIy1pPO0z8G4H
	gAufhMXUSaWrw79S5xs7UR4Jn1C+G+jEUzQcwRTXK/deWFdoiYJ6Fcy1RyRbvSL2vXOMPxpibnjuX
	47TpkrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUM0-000000064Tq-3ccx;
	Sun, 18 Oct 2026 17:07:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIULx-000000064Rb-3YE2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 17:07:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IF8YSH2774158
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHmd60/I6Rn3BFHeK6JI59ohI+LrPrPqxSimo7k7Esk=; b=MNzblhRePkT0FdxP
	RYTjgd2NB/eoLIPOgYxF7GLHzMpO6ieEFkvJsPPkXZqkUFZlu8gYTQF1JnFH/tCa
	7jhcJD4q7ksoT1Smqwp3+VUaGmNVO54e68gNsJ0Se4zO8kJ8SfcOYBcEXvyXn83t
	bT2Vr2X7XqZQOEAYS7Ej+bxzsXhkS23pfi0eWccBRO9wFg/IhgFU7IRqfUWEnxUT
	PKImAb1JvEGFHxW/LU3CwxQghUrg97raM4O6oRhKT6T60nqn8Oe32PDTAhHx9z0k
	5tDHkUzo/aKVXEXPgDq2WBfJrXbgNc2mIBag1S03BCKwF2uIrCYP9VOzrTI1AtVQ
	ku/UQA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k3d1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso227977585a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 10:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792343240; x=1792948040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHmd60/I6Rn3BFHeK6JI59ohI+LrPrPqxSimo7k7Esk=;
        b=ZrJnPCxwIss+w/wiyqpl3kklXLa8wGddr9XVuCSD6k6AMYAPROsz5Pny5s957n/5U3
         LJjbLbXh20J0VHYVthVcWxj5wQE4JicOQaMN5S1K1rOyg4EMOYvLrA0T4/6Qj/RgasrR
         RISErMxgGy+IMjxF/wlOwFwa+p28gDn0ScYmjEpaVnILurJ5XAS/51ln7WEWzHObRtax
         cj2lTh0I6QdOWnP0TURrH3qL3UHFEFLxbSJe41JA8DKRjrnEKmHGZ+hnR0etoGdogN0t
         tzvXaNBRd63FUm/FX0pK5FzxF7tvAn1WAda7KarnF9OctVJ7tqfriBw5OmFnE8imw1oW
         NV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343240; x=1792948040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HHmd60/I6Rn3BFHeK6JI59ohI+LrPrPqxSimo7k7Esk=;
        b=wiTBkVjGP9KBt0WqJ8sl/T88s1HuDIGuNoEHopeBcP4j1YsgZFiRw56zgFLcvONevI
         y+e6XO4wY6j1AZ9iiOd8RQr5ziMsuLxonzE7kPJBFdgcJ49oGY/lTjunVChyP+Z9lRXM
         jwIFbjv8yMfrihrW5jfq5tQ1soypbLbBOJLEsZLuO7ecd3uChc3hVBPD35tayNFjsuSC
         M5r4IkK2GEzQcNX7gs1Xj0niv6Da5cLlfoMVFFipBz+PBBelZ00ZuueJdjbud4zIYjsG
         Ivr5npfYG9pbzut59W4lwdUKnIc2r1J8hR6sifRvtosbWe3MnZWHVIKqoebjtnWPUzx3
         dDPg==
X-Forwarded-Encrypted: i=1; AKwUvBwRS6Ul2dzQNVvgkFRpHeH5FZsC1GVxVB0u3AOoJpKohpgQ+SKgjHWcT0JO2q5sGRskAo9tPVeKSccRR1AQbVyv@lists.infradead.org
X-Gm-Message-State: AFq9FYLiBL2cLHn7NXRaZk3IgdVrgxxocvKNnPcaAWGyIQdzOsPAT+jZ
	zp/+xactc544yfwPUtjj9C7fUJPhVOn5TYncYWCQ8Qmxvprb439ax2ps5Krb1sj8K5AoeubedE7
	swfVqtiB3nxkI+cFLolR3cnZ/Kel5DXv9j48qRCa7+PqgxgvZoPY7yJjtHt+RP21Y5oz+njtu1j
	cpcQ==
X-Gm-Gg: AYBFou1lef+cwIYzY01da/8PXDvJs73Nmb342p/DGWkSwW/md0xfh9ASYTe2VsUYkJS
	cVuW10WUnaoywGmPJenHzRX4o4YWWO/om0QEt7FldqxES8YA+7Hu1J8uMwkQOSyo4UkIluVC5uy
	DFXbLWm1n5Hwnyg93cmUcTGH7dbmb2P3mMO9JQbn5tcqQJ+lTN7NgDpP/XY415hjP4w1rm2QMq/
	I2ZyUa74jEnKBhociALHcOU1oHrmZ9mYz2KyJ1WMxREZRZ3gzRAWX6p+MOQwamSnDUJx8hBo06r
	0T7C3+k9YCPI60p1/zgWK8yd1jzt6ECArG3kK7XZokPNzrlBRCiOWLeI4iy+nzr+YT2j3uzvvYp
	IHr1hzx9IbUNOWw==
X-Received: by 2002:a05:620a:28c4:b0:93b:e6d3:3145 with SMTP id af79cd13be357-93f29d54479mr900026185a.64.1792343239851;
        Sun, 18 Oct 2026 10:07:19 -0700 (PDT)
X-Received: by 2002:a05:620a:28c4:b0:93b:e6d3:3145 with SMTP id af79cd13be357-93f29d54479mr900021385a.64.1792343239240;
        Sun, 18 Oct 2026 10:07:19 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm262440925e9.12.2026.10.18.10.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:07:18 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 19:07:01 +0200
Subject: [PATCH net-next v8 3/5] net: stmmac: drop multi-buffer frames in
 XDP mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-stmmac-rx-mb-v8-3-5f58c0b25849@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfX/LoWtKfdU5ar
 PFvBo7Ozzu7aRVx52cR2dAjMcCvClnV3oMTnBfe8VqgAKPnu0hWurtBzBZq9Yl2zElHaYCXWHq9
 xIZN2MiD2ZHJTFLq03WbyIMC92XfqWDzwT748TEeXzlwY3LX7I4wyEdZTFwGE/pJeSW+XtK+fwz
 tRvmt962XvZjEb8+ToAG7sKYLS6siWlQ5WN1jWs5On4kz68ODIEQTp7JJOKaKH2tb9KISV4GLG+
 wJtUX2afHKWtIRkxVP4YlxyndrAv+zJTB31+am8yS9cUaI8JDjTjkrukW4OcMzyL98LbbSU8zVo
 7bnx5d0+mFNcBrRcNA12Qs8KKnzIaZfuzi6fgz24/H1IF2kBN+2OEPFluh4ph1L1EcoO5YNMJ/d
 cnk3cJkrjbRGUViRhrLqlH9fnGq3Wy2utVNK5QnQxgf4pjaTN4ZeLRF42tHEojEWVRzj6Y4NzGp
 6qbtFU3FhOcB3GTB5lw==
X-Proofpoint-GUID: n-kcKq4PeCAZtmLzIAnvOLGTqIqPJZxT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfXxwGG9+GzKXcU
 Iz1Dd3FyLXwwHp4qOeF/m/ctWJ8KFADuZvsrzVRxc0wrzYDRbyepgeeBtpJP6GPCBBRaMz2Ipn4
 lsRLb1PUmhyAt8unK+l/otErQwGzvbI=
X-Proofpoint-ORIG-GUID: n-kcKq4PeCAZtmLzIAnvOLGTqIqPJZxT
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad4fcc9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=b-cMl9P36as69-4SBTgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_100721_896475_16C04590 
X-CRM114-Status: GOOD (  24.44  )
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

stmmac_rx() runs the XDP program once per descriptor buffer and uses
skb == NULL as the only marker for the start of a frame. A frame larger
than one buffer is split by the hardware across several descriptors;
GMAC4 enables jumbo frames unconditionally (GMAC_CONFIG_JE in
GMAC_CORE_INIT), so an on-link peer can deliver such a frame even when
the interface MTU is left at 1500.

When an XDP verdict ends a non-last descriptor, skb is cleared and the
next descriptor of the same hardware frame is parsed as a new frame.
For XDP_CONSUMED this happens via read_again with len preserved, so
stmmac_rx_buf1_len() then returns min(dma_buf_sz, plen - len) for the
last descriptor, which can be as small as 0-3 bytes. buf1_len -=
ETH_FCS_LEN underflows and xdp_prepare_buff() puts data_end far past
data; on XDP_PASS this produces an skb whose length is close to 4G that
reaches the network stack (skb->tail and skb->len are 32-bit and wrap
below skb->end, so skb_over_panic() does not fire). A 4+ byte tail is
instead offered to the XDP program and delivered as a standalone
mid-payload Ethernet frame on XDP_PASS. XDP_TX/XDP_REDIRECT instead
falls through to the next iteration, resetting the running length, so
the tail is re-parsed as a full-size new frame.

The same fault exists when a single descriptor uses its second buffer:
GMAC4/XGMAC always provide a second data buffer per descriptor, so a
frame up to 2 * dma_buf_sz can land on a single descriptor while the XDP
program still only sees the first buffer. XDP_TX then transmits a
truncated frame, and XDP_PASS appends the second buffer only after the
program has already run over the first one.

XDP does not support scatter-gather frames until the multi-buffer
rework, so drop the whole frame instead: mark it as errored as soon as
a non-last descriptor, or a descriptor using its second buffer, is seen
while an XDP program is attached, drain and release every descriptor -
including the last. Removing the re-parse lets both XDP verdict branches
simply complete the packet via next.

Note: the subsequent "net: stmmac: rework stmmac_rx to support XDP rx
multi-buff" accumulates the whole frame into a single xdp_buff and
supersedes this patch; the fix is kept so the net portion of the series
stands on its own.

Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 35 ++++++++++++-----------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index efa88cd359da..e929cc0f2312 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5888,18 +5888,23 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 
-		if (unlikely(status & discard_frame)) {
-			page_pool_put_page(rx_q->page_pool, buf->page, 0, true);
-			buf->page = NULL;
+		if (unlikely(!error && (status & discard_frame))) {
 			error = 1;
 			if (!priv->hwts_rx_en)
 				rx_errors++;
 		}
 
-		if (unlikely(error && (status & rx_not_ls)))
-			goto read_again;
+		/* We do not support SG in XDP mode */
+		if (unlikely(!error && (status & rx_not_ls) &&
+			     stmmac_xdp_is_enabled(priv))) {
+			rx_dropped++;
+			error = 1;
+		}
 
 		if (unlikely(error)) {
+			if (status & rx_not_ls)
+				goto read_again;
+
 			dev_kfree_skb(skb);
 			goto next;
 		}
@@ -5911,6 +5916,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		buf2_len = stmmac_rx_buf2_len(priv, p, status, len);
 		len += buf2_len;
 
+		/* Drop the packet if it is split over buf1 and buf2 on a
+		 * single descriptor if the interface is running in XDP mode.
+		 */
+		if (unlikely(stmmac_xdp_is_enabled(priv) && buf2_len)) {
+			rx_dropped++;
+			goto next;
+		}
+
 		/* ACS is disabled; strip manually. */
 		if (likely(!(status & rx_not_ls)))
 			len -= ETH_FCS_LEN;
@@ -5960,17 +5973,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 							   sync_len, true);
 					buf->page = NULL;
 					rx_dropped++;
-
-					/* Clear skb as it was set as
-					 * status by XDP program.
-					 */
-					skb = NULL;
-
-					if (unlikely((status & rx_not_ls)))
-						goto read_again;
-
-					count++;
-					continue;
+					goto next;
 				} else if (xdp_res & (STMMAC_XDP_TX |
 						      STMMAC_XDP_REDIRECT)) {
 					xdp_status |= xdp_res;

-- 
2.56.0


