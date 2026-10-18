Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E203CCCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pr0BIM1b/ftIENJIu/PmddyoAADq6kKkfV88iiNDJVA=; b=w6j6+s6MgPQNL2h4NBYcnFGour
	7bRwznC2T3fZVb/ZBkpals0f8ZTUX5qqZpy4dWYklyeeCin1fSs7zPw9IE1c/d7xKQQaLXYZsbEA5
	IEJAsfFniikH5mTgKnVslFePGSbGrLeSh5P6xXhjNpPluRH4dx1wmNmxcKZw8JUMB8kNvUdrFeCbV
	IMXQ75PyHuk7gLgB2luTPMV78qr8YFi22q812n7qgiWPoNOmnZCfAUHnipNQM3fIcOIX1eZc2RiAr
	N39JNz0xMmDO9VohqJbpHft66G8Q4czIFz7+2kW6odCxqt/ak9ElfycbvXJHn39IK2jxzJaiJcWNC
	q6iY9ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUM0-000000064TT-31Za;
	Sun, 18 Oct 2026 17:07:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIULv-000000064QZ-3Wye
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 17:07:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IF73Dn3393537
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pr0BIM1b/ftIENJIu/PmddyoAADq6kKkfV88iiNDJVA=; b=WAdBZpIE+0qKeZn6
	DYj0MmPwjU2sS4oJpIkDg1+Y8aJ6DUUNGJ+UEqhzRcTYJmv7H6fDXf4uhLK0Gyzu
	Vzffwbf3tKNbk6za+npei3oG7ho+DQl3EGv+tXjq0oDvWwmH7rRXlM7znS4VvWsn
	huy9QNKxBU6Xv3F190ZpIzB9xuN43vydboNqC4u5V6fdFPzXaJd9WdbSm0dyiqaL
	UPDsTf1kVVxbP/grN11vnRR1/VtuWDEFyGo2X0c8bssBby+AJ/Kze/XSTIGEB7d1
	9fm9l14NSD5oPx6QSarRqzyPYyJj4Epqo0bAieWb71qJuztTcj9bUM4tZziJ2prQ
	oVvs8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9kcjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:07:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so248566785a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 10:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792343238; x=1792948038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pr0BIM1b/ftIENJIu/PmddyoAADq6kKkfV88iiNDJVA=;
        b=YXBH5MLrItvNiZRuCP05HZQMdzzhECkXzBmJg549cSI4eWBD3D+Nov//XCjdySgyva
         OPcKINnenehFVLyUwi8ZiM3h6GaL8BaRmt4bkgR4IQUMZr6imDvbqYMqH7RnLK/MQoqD
         r0moQAzeScBFPdcmAQGD/sWBq46kSqaXCLyOpgaDXE/eqd1ycg/J31LATmYBNVBrWeI3
         v0oNTUZGQ92t3RCgNr5klStKaceiT4Lwj65/Vtz3eBXj1SDDvxgtji9tqRAGDPj2wr6p
         kGg+8eRy8uNWDRAy3dCyBsEbUcT0kHUQSsMgZ/U1Z4rLkQFFfxafG4pA5cAFzDbjWkQr
         G59w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343238; x=1792948038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr0BIM1b/ftIENJIu/PmddyoAADq6kKkfV88iiNDJVA=;
        b=W1mwU1dJ0xWOAYU4tQO71cisOV8ljQJb4ISIcck1eqrmnZQZAUTfci17tOsU3X2mGc
         pafTzvA9Oapxj61Jh0jgkmM4Gm/2XxNhfOiqsit9+Kbs7J8L4g6iv43R2UrG0bdUojli
         gwScGIBrdZj/gvlu64GFZVRQ/ofcZMEwqI7UaexCkEX+maaPBOyyOnUd7Hsu/fIOJYcm
         Ab5ZpmMONAFDSmI/gLekHvMCalQ0/kuH3y+nKmk/ZY2TrOBpBNdgHjkLyUi5FM0iG+Cf
         LXKavazFTwo+mj526d07REoqTCp1mavhX/JYQ1IL5F1ad0/YaggG567QitIq12R94eGF
         xqig==
X-Forwarded-Encrypted: i=1; AKwUvBwb0YhJGiK6W0jLmRncW0czg83+M8YXVXC43Zw2BKCHwS3NQq+EVbx+xIX939YZGBKv8GMK+hIQ8s8jW0HVxagX@lists.infradead.org
X-Gm-Message-State: AFq9FYJkugATkaF97W5TIo/sa/Tvr/WfG3MQA3Srd/sltAwoCDAIv0EV
	ki/jczAX0M1o5IaSznAYYGC3ene4fzJaWXAkzXCtsXDQxWLKLkZ6vbEGjMvUQeXSH8OV48R9M4I
	wklJSUX3061laCXAWHmfDd8GxYhEUM45JqOKuKLnfYDKjgSbj8XcGWjnvCvHVasXkKT4M4WQ2jx
	qU0w==
X-Gm-Gg: AYBFou0cisUv+f/fbwPgJYURhpS+C65novgVYGLyqWjUlpCtz8iVBfxempHM5icsaLZ
	OO8Q7gHiQ/4liW1G9kZPocpMzpl93qFt+GdWV3Q9KodmE74Xo0pvhZ+cTPXawcgR4/+tvDZy1dJ
	J93JuzGcYZwba/f/v+Me0ZBs4fyFELP9a+VoHc/e5iz5FKR0gfoXdYMji9nXVd3A/xquREjClFR
	dIraOPMHVqKXi1u0yymWED2b8U8vDdzj92xjIxqhy/c3SEr0kz9J6Y8YlatW5nrfpiAfg9QlbmY
	lMD3dkssW+Ey8f/NxK9/08Q92Ws+TrmhK3eNGjGmkVqu4DaYQ0A1CBWxQ/DRGVgOTgfXHMXl/m2
	w0/TPpZ1fwDWwQA==
X-Received: by 2002:a05:620a:2550:b0:93f:22f1:97be with SMTP id af79cd13be357-93f29df1d34mr948994085a.72.1792343238202;
        Sun, 18 Oct 2026 10:07:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2550:b0:93f:22f1:97be with SMTP id af79cd13be357-93f29df1d34mr948989185a.72.1792343237661;
        Sun, 18 Oct 2026 10:07:17 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d7659805sm177655965e9.7.2026.10.18.10.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:07:16 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 19:07:00 +0200
Subject: [PATCH net-next v8 2/5] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-stmmac-rx-mb-v8-2-5f58c0b25849@oss.qualcomm.com>
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
        bpf@vger.kernel.org, Nicolai Buchwitz <nb@tipi-net.de>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfXwTHllc6xQtuQ
 K4MeoiQR0P4CLT2UN9QX0vFWzzwsWL+y3CfgRBYIoCzUW0sVqS+7eDsawZOK/d4AKv2/zXykRG9
 w88VzwQzcVm66PxTi8LOo7R5TcCIJ1Y=
X-Proofpoint-GUID: B6c3nmqs3hxI9dqxaG8n9TCeti04ihaj
X-Proofpoint-ORIG-GUID: B6c3nmqs3hxI9dqxaG8n9TCeti04ihaj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA2OCBTYWx0ZWRfX6vQSj/f+Ig8Q
 2kh0Hw9WM7OAnlOX3tx636ObBTxSKQkftBc51mND2ap1C5aybaviapBWNWo53g+0haWrfkep3OJ
 0lv9/DGvVRmluExVK6fPc7UAmMCqGB/Tx4Dao7+2a93ppjIq2UYaA8kjFxD8cbWi0H1GkqkkS3y
 OEgYDWwrcomMhu4SerPy2GhBtbefPjmiST3lEtSu9ATOsQonVVVmoluf3Ss3T3fD1a7MStn2m3I
 5QX+WgYPzlurQsoRcHcALIpSNXd7FplhylEQ9KjXhV8P/j9s5ZKYPPgVyqup4ujneHfbNF8GIpC
 4ie0uGOzuZXhd9/y5v5ZqMumLN4YroGx1u5S3PsDviWWSEpz9U0r1ITZUV9Otrzicfq5/CzKqyz
 9+Ro8cWRZylNTOjRLmuCyOi6lZP1XRA3q/qQVhlAzATfsLaX4VoFcM6RtE+FAvGUtg+7bmpnhCU
 67EDykaShrnUUMSgxFQ==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad4fcc7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=CzSfKeaMSJ9arFq4QbgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_100719_891653_0801AE5F 
X-CRM114-Status: GOOD (  23.00  )
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
index 8fd2acb25fb6..efa88cd359da 100644
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


