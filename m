Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572E4CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AV9tmVKum9YrJoJWP0QRLd4eRfkv0CgfW6YzK0/bKew=; b=RXEkMtLMJMTcizyECqrZDkd7ms
	G9JXpHWnIBHAD9Z2ijarGYLmE+WdCl/DipdK2TSJvzXo/No6aIRtytV5ZkcXd3XA+pRaN4v27H0xs
	LZhR/dgVB2Fd+xHC2rk/pW+8rmZOpIpU0ifHbro5XqUbaHT4RgowLfzwkkLyrzdMdb4Cy31t+QnDp
	x1Lo/B++CTPR/7wqWQWcC+7Kn9m/xF1C5NSrkSvn/Cn8MLhMP/hdtXdr5k7vO3Lq6PSZi9epSFGDu
	buXyFKgbuLjc6XnKRnxusEqUBqA+GqNPnCPURxREEhlGSrJKzdngPdyYz1om2Xo4XlU8GI4aSMRCe
	0Rbrbf9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHu4-0000000AnIX-0sn7;
	Mon, 12 Oct 2026 15:25:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHtx-0000000AnFo-41Ha
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:25:23 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxx86800868
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 15:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AV9tmVKum9YrJoJWP0QRLd4eRfkv0CgfW6YzK0/bKew=; b=hHLA21iUdjNz59Nh
	73E+yS0r7blRxp1lxC0B0sWq6LVx4m7LMpj67NlHHwlhFHoYSrX+edzOT3GmsroU
	EjUp/rnIz+4V0tZKr++Pejkfhyc08666ZtzvM8YiStTGgu2TSFRDSbGRje9jttPT
	GOU4aPI6IQlVaPFB4ZgQzbvD668ClYIzEexBe8JwNv1YMnAZnzrTTOrqJCJQ4VeC
	5ASP5QGVktP2JMBC0XkZ/Hrp7q0PQNwDGgA1c/UqvI0ydKe5zzavWeVNmQ6oUxpR
	WfbBC3husBUay9Hspyruf8/PejTFg2dNsovVlPiMAdwdMncsVlm427YGF+CEn0X2
	mdgC1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsd58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 15:25:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea1b6c89so396372785a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818720; x=1792423520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AV9tmVKum9YrJoJWP0QRLd4eRfkv0CgfW6YzK0/bKew=;
        b=PhtYAnhwsVDVdCzhefQUk2NPHKCqGu4T3Jv8sScrQkhzctdDyLoj0HiivLaJm/+2B7
         Mf2tWOPr17w6IK9jihy/uXgZR7ggkTMZ4YJeeiCCjnW5fyU05x99uA0S2Np47cUgBKFU
         uFmiKHREz6ZuTg4dALKhILzkqHeDjA3Y5//uwJmfXjDVxau5w52tJdIF2DL82mLDrZBQ
         5cqQ9Eeh9e9MK7w+a5wKykjRVnxAWWhMLVzkEu+hanDzC0s2w+4MGhFR1ycwaruT09Pu
         RWY5LH7F2CGYAgXs7HUu66n/w2f+YY2hgc6sLeks580oa9c8Bmjr/WAmNXJw89N3Bw5u
         dnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818720; x=1792423520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AV9tmVKum9YrJoJWP0QRLd4eRfkv0CgfW6YzK0/bKew=;
        b=bkM5o2EUfJbuYKwc9gjQo2Sb3B5mn34lHql/3MJr/8XSnfjzEQmxkSMswOmh11V7wR
         s7T/4mNZn0LgN0ElSQaR8yrIZ9HepyueAsfqsSFjrymYaDSYXHdLdGQO79ZFvAXxeg12
         l817EUqKIlq0rWMY+gOPTmQbGHUoCGNBf803SThd+InsXkIClTxWN8nL+KK37R6EaMDV
         7asN9wOOcFr5pTjGj2pNKJHRAOA5ora42PhWbo+KhMbwAX2GfFhMNBeLCZ57k0vqKx8a
         AD/jLeer0M5QmX0vlfBmsRl8hs0fKDjRoCmjxjhIdHJXMvtP330oEFssNnqZnnjWe5P8
         jTSg==
X-Forwarded-Encrypted: i=1; AKwUvBxhK07X6H7JaXkEfDqjNEOleT8msxas87TP4NUgX0/uwSWqRTJfBOXYZ35So0SKkixkIKJbQ9Wl4iJTrEqxaL8B@lists.infradead.org
X-Gm-Message-State: AFq9FYLxzyu7LJhrT7qjur8RlerpJ/MXuIGaZYt8oelmZ25Dio3+90pB
	3+9nSY+lt/TaLfWwddvsLcjy8hMJOZ066yWIW6DwBIl9P4tvNkwtCU8EmRJKKGGNom005+KQBv7
	4rc69olgzMU7OXFsTo7hGiRxrvMQ29tLWNdy8SK7cW6Mc2HgfJwWjPZ5+O0du/SgzHXJcAAqhpk
	NEEQ==
X-Gm-Gg: AYBFou0foWzK44UaXD3m7sXuNZGT63EFU67omjkniQUzVB+WwTWczCy6MC3GLUws6UZ
	/2Wp1SZOkv4NxfXmE12ydD/D4eICQUDJ7FosD0dLh/I44Z/CLXCmTCNRbGBTr1af2JbUSDClkYC
	2lrJ2eD/3DyYy+WG9u2SSe6NRjkopV5HQCKwC5rnAeBoiC3HX7vsL1z43lcUdWQEsqnL+PPBKo9
	wG4VJWEWclTTOH6VEgx5PD/YlrokRZv7V7KRLK3eC0GxI4kdtMvjvBRP/6o7gPdu1hydiNzLuMF
	9HkcAUOZzliGfCnb795bfwThzP6kIA8jGJnjVr/Q3JhNcuwQVf8uknFKw3p5AkJhoTtGQwpmDQS
	o8d2kx+lB1z+RkQ==
X-Received: by 2002:a05:620a:3728:b0:93e:c12c:43f6 with SMTP id af79cd13be357-93ec12c490cmr1632981485a.67.1791818719996;
        Mon, 12 Oct 2026 08:25:19 -0700 (PDT)
X-Received: by 2002:a05:620a:3728:b0:93e:c12c:43f6 with SMTP id af79cd13be357-93ec12c490cmr1632976585a.67.1791818719393;
        Mon, 12 Oct 2026 08:25:19 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac35dfsm33381f8f.33.2026.10.12.08.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:25:18 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:39 +0200
Subject: [PATCH net-next 1/2] net: stmmac: fix XDP TX DMA address for
 compound RX pages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-stmmac-xdp-tx-pre-fixes-v1-1-05fd0c90f7e1@oss.qualcomm.com>
References: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
In-Reply-To: <20261012-stmmac-xdp-tx-pre-fixes-v1-0-05fd0c90f7e1@oss.qualcomm.com>
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
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bpf@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ejPIHnAOKC7JxdoPWF-szHalSs8KUIX6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX4rcCRQLwYdSw
 623RqpnwPFPtEPwECa6y1Fzc0drueQU7XAxQQddSTtAgcYnV+w8gmbD/f7zKbEVImSJqx8Lx4FQ
 qut26qI9n+h637ZPKe+Z6GavRVGavMU=
X-Proofpoint-ORIG-GUID: ejPIHnAOKC7JxdoPWF-szHalSs8KUIX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+Icb+B6VmPGc
 S6rYJV7NBkTmg+tkw77YkxMv/KeGc03NbPdLyKAeDhyUCfKaunIu9qx+JknovCQ8EcuTOTk5N25
 gqIlwkfHko5hak+1lpuR/LQt+VCDywbBBLYzc+SIe4KizPF8I1rP143SRRMeiSF6sruh9lgI65e
 xgvtiXD1abA8EhT2OkvpAg1/A8yQrIMtxMLsl43gtcV68TA29rT2P741ITBZ4x9asVRBw5fyGYk
 zLk3VQNxGkzKKa8V0Px205MRQOApY777VQdngu7M3vz0+FM0bRP8LGMzKSKRD4I2CNa8zZ1uDXa
 z+0zZMgsWTIbs5oFNPfz5S2yfqIFmdsPkqlwoFRVMkdP6nvrrdcvK5zF2xoMDMfYmifby+DIkaI
 8929slPx0fnW9+s9MLMMhoWtVYBGd7H73aTM+S7mY4Y3toHm0I8rDZYf1LVjMQblqiEFdh/njA2
 db/n/EWuGj5Bj/yWpxQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6accfbe1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=X7MBymmcuZ5hxvlvhugA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_082522_006819_8A68E280 
X-CRM114-Status: GOOD (  18.09  )
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

When RX buffers are compound pages (order > 0), only the head page
carries the DMA address programmed by the page pool
(page_pool_get_dma_addr()). stmmac_xdp_xmit_xdpf() computed the head
buffer's bus address from the page that happens to contain the data:

	page = frag ? skb_frag_page(frag)
		    : virt_to_page(xdpf->data);
	dma_addr = page_pool_get_dma_addr(page);
	...

RX pages become compound as soon as dma_buf_sz needs more than one page
(pp_params.order = order_base_2(num_pages) > 0), which happens from an
MTU around 3000 bytes once dma_buf_sz reaches 4096. If an XDP program
moves the data forward with bpf_xdp_adjust_head() by more than about a
page, xdpf->data points into a tail page whose struct page has no DMA
address: page_pool_get_dma_addr() then returns a bogus bus address, and
dma_sync_single_for_device() together with the TX descriptor transmit
from the wrong location.

Use virt_to_head_page() to read the DMA base of the buffer and keep the
offset relative to the head page (sizeof(*xdpf) + xdpf->headroom), which
is correct no matter which page the data ends up in.

Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b8b4de4c5b1a..ca61ab449e32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5301,7 +5301,7 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 			struct page *page;
 
 			page = frag ? skb_frag_page(frag)
-				    : virt_to_page(xdpf->data);
+				    : virt_to_head_page(xdpf->data);
 			dma_addr = page_pool_get_dma_addr(page);
 			if (frag)
 				dma_addr += skb_frag_off(frag);

-- 
2.56.0


