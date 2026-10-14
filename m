Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894C4CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 13:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/M5NnOjUNxwzJe64yCg4dQMGH9jNm9FmAahLCCnknSs=; b=zkzUEt8HoDtPRqNvK9rQY8THh9
	ZjEzl3yrle0EinLokwS01RtL5OiukphWha8UVtlKtC5JEtviTZ1E8IniY5y7ypiPmj0wuMxW2y88X
	9IUnilQr2OtioNSih07IBfUkIVgs+5cgp9NZ5esaNMpg4S7vVmeIzCWLZkihUiNbVyalOAdOF9Qg/
	KpqJbbKloytOkvrPNRSSKemoVR4aQkkJvKK1Kyge57U21ktc4tRV2+MiJYZsmNu6WRb3DJQjmFe81
	qGWOd46V0KW+Hi3kX11LhLmgNZ812RmGOo9QhQJCvQ0kcJHB14OvoovN105LCuNZCZ6RHOp9OUUJg
	6wLvQOZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGykK-0000000FXd5-05xT;
	Wed, 14 Oct 2026 13:10:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGykA-0000000FXXZ-2IGX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/M5NnOjUNxwzJe64yCg4dQMGH9jNm9FmAahLCCnknSs=; b=qlXhHlI5RWwdPH/qPx7zfpdcQi
	qjVtoziJKwgRR0QQFL4QwpYTyhIv/fDC+OgpzrISb1KgBF1hJ1koi5AkHkzDdzJWfHoTGUPbCaCq6
	BD+Wg8xFTjhdsvYoZ6AbRy/AHDZjoI3wBSwUrZ0FnKBt30SVvd3O7qfSG1oiDaHeINgHVEsADmMKZ
	tQYPFsYlVivDtywf+NhbpqHMC99TSRyswcg372kTyPskyynq8PWL7sqTBTHC8hc6DsHKK+rG2IWvL
	E8yoNvqxKS3+14IzpapPytI1nj72wNAdq8V174bq/F8eIEGkoemDIv1lvvk8g1QMXRTiHWixseLeW
	/0Y34atw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGyk7-0000000GnY2-1gGz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 13:10:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ECQCjJ2088183
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M5NnOjUNxwzJe64yCg4dQMGH9jNm9FmAahLCCnknSs=; b=XUhfRrSNI6K7JEtH
	Xj8al2ZuCdt+1nGywiaamP4ppp29UXkdbSWJabVA/TVo3OlwIZqDCsaBJRK6JdjG
	OF3isxHjx0gWc5cHEtLvUAJAA35QgcITy/b2kWssjRfSTRbIENVAKktMotLYEAYv
	WFwqMw2ku30dthlRHEXxUo9lzOU+oSdkksLBayj7yG+efARYG9kkhsEsP0S3X+N1
	505s3bOr/Hon8xgVBkmZulsxsa2sQ5n5SPdsOfLA6l7yeS6lDfTnyIc9oJC3QQqr
	OVv5A/IvcJnIlqsryLRIPSuY98oDCf5G9iiz4GqQu44YLhjP9qiS8pUhNXhuG5k1
	dGlp1w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49jyvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:10:01 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso3101470241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 06:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983400; x=1792588200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/M5NnOjUNxwzJe64yCg4dQMGH9jNm9FmAahLCCnknSs=;
        b=E+wjZQLfX4dyWF0NUZRnv9YOIWSIxeaoRweLtbX1lNksASqfEqIdMwYUdMWHGbzCPn
         e5MygeJE00Zq2WPihIgLjOAOnofj0LOUVdIjjgwIdiD+52qQ9mSsJHgBCvmOcTVFM9FG
         aOGvB4M0FW16d7f/TKwZJ62VBnfbyqU7l5cdYfN86bi0PiKEl4n66wUbpTtt1IibYaNd
         l4/ADkjnY/kDiGNfvrPx4UJVmyviLC6Bp8AygPNyvbgS3d/WPUS3w+OazHlN2el4xShM
         v6uHAiL+r02KiIxUM2L9V/h3UUEgkjN/XypeYDZZWmt2IFUTutolq2J5c3g54mePZzAo
         SNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983400; x=1792588200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/M5NnOjUNxwzJe64yCg4dQMGH9jNm9FmAahLCCnknSs=;
        b=c+NIyXV1KOAQ1liTD+FBj04Ie/khSzvZRRXclKLTjQU06H6zEB9nawebBr8SBPaoqT
         ZWoQY8SrwLM8k9WMO8qHAASwd1b4WDUbGZxyqY3Wtn3guQ69W1yGHwKhI0C/Kqv+4kSQ
         fvOf9e9IjgYX+zc2pdDId+UxiQY4ho8V9s7gLOZTtxNyWSe4A9Bfhh6UuxIZCHFuaA6g
         0NNPw6t7I0LVfyX5rJympF5Gyul/gjIV8l9EA8PZ1SkaYJHbbPOtWUAL6sGg7Re9U2sC
         cBY6T2hw/9I5pj1Z4z1DtlY4QQ66WVZpvzy2/6IF7umZtOp6r4ow2GxJPhc/xYqAbPRp
         w2rA==
X-Forwarded-Encrypted: i=1; AKwUvBw4tK+eClUAf2l4CGJOyPrE2HWqYNl7teMA+WWdN3lJi4xOvrTUTKqQfQa1Ou22QB2NDgGEcsiVJseL8mashq4b@lists.infradead.org
X-Gm-Message-State: AFq9FYJf1Kn/YtwnyjB7AI1j5iZ6pBxYk6CIR/nU1U8Q66GchQSjj2b4
	0DPwcxjH9xP6ilXwMHjwHcKKVc3lYQ3pppvRZPfeb/uRA9MOm938xMzEqBQDrZlpyhEPKbbNnZv
	1OcEjU+OEYrdaJQpwSImjFAQWrYlu4aLirBs4BM/S6n136CSa9T7OqjvhZmftwdETBTbVNAl3yg
	tw8A==
X-Gm-Gg: AYBFou0sthriUzz2/Zmzk28N1uzQVX9Zy9zPTAF0YJcjZMI+5M9cCc5eY3Mzz4CNgzB
	/UwbuQ2y/87Y8QOkyHNvyCiZMtjlV35bRNTVtRZtiqI9xt6y9q+1zZ6M7AGSy7GDI7WeAE8io3r
	goN4KK1AJTGPLyRf4Kw7dBeusS9oyyi7Y1V+/Eg817GgZbMoHgOPTCfxROEUWx6ukobPkHn2ekz
	ja8srgJM3KSgBj9JYSxeLS5CvfThT9CXFHzg+2wkx+7udfPM9Kgrj5q8KclxlpeVpEhHwU2Az4o
	qDVK2QIFlXuM4Gy2tUkeAM6PJFYBAnWAUyAiAyuDTBYom5gBnX1u0O5imV5HBmgMXqySu2Bn09E
	Ll+S0epwwVaSxQw==
X-Received: by 2002:a05:6102:5cc7:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7cb373e1426mr5095283137.29.1791983400070;
        Wed, 14 Oct 2026 06:10:00 -0700 (PDT)
X-Received: by 2002:a05:6102:5cc7:b0:7b2:7aac:8ccf with SMTP id ada2fe7eead31-7cb373e1426mr5095254137.29.1791983399314;
        Wed, 14 Oct 2026 06:09:59 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b489742csm34280125e9.2.2026.10.14.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:09:58 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:09:37 +0200
Subject: [PATCH net-next v7 3/4] net: stmmac: drop multi-buffer frames in
 XDP mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-stmmac-rx-mb-v7-3-5d2d70f052cd@oss.qualcomm.com>
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
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf7f29 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=b-cMl9P36as69-4SBTgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX+sFHmF+UMUTP
 B3YznqBCUG+K0r2B/kmUITnVlr6a3D4QPaOpuUn8HL3d1J4hthQeR03oiEc2wJ6og2wB/c/dZQs
 ncQTTgkOEoy+GForFpWy7IRFPRHl/lBn2Y4BEB/H7fcrQw/9DbBPJ/XOexnCeuGOk/lckm2N+wC
 kwiWJk6OyDEPbDcPdfcRg+GeH9HAdIMfFXVv3tk/A7g4fnKavzkhzcA0cGfUvklpaQ8/JJK3zrM
 mSDO9nsWAunZluH3vN/eOs4kOjc87uFX2aAy38sv1AzzJWIsGgLzA+TfxYjJ2tyWJij7ZcUMbrM
 pq3gR6VDHaBj9hdjAFQhygX0ISdJC22lo1qcncHAvGpxrD/5GExwAC/CM8/w4bJYNCgI5w9p6GH
 U5fh759gHb6RynowbVSO4yrhm6zB6l+KNNnWIiITiIduPZkBB3wiTBE23TokoZpGu3Y3Q6or0WP
 BvunHBQjWwBgXrvM1Sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX/b81uGs9Mm7x
 lVFUGDFNwOuEOPuW4UgrFGtv/fQhA+9FwDO85Nr6pegQtUjcrFauIULDqZZjX36IHgte/jYfF+s
 0hWJAQEpmnStWuCtLtYtUkE2bwg0JdM=
X-Proofpoint-GUID: FJrOVWS9-yH8Rc3lDl3rn-Hibs7_N1rA
X-Proofpoint-ORIG-GUID: FJrOVWS9-yH8Rc3lDl3rn-Hibs7_N1rA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_141003_880218_B8875454 
X-CRM114-Status: GOOD (  26.29  )
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
index 10ea72cbf889..f4beb0ff6fd2 100644
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


