Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8D8CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 16:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5uGbkqYL5BqGtvqhH6fP3VPuTl/sxkQyH/3ZIuzOc8=; b=GKQK+lkWdJwwUNQ+MOpRu4fBTd
	y71eITZS0SRwZWeaHoWJBxAjrohDfYa4H+iBqpn0a5QV18n3u5/RqsULqT0aLSdqPqAC7UN65O55l
	INp/5qfYtcB9bxSIb7a5nomvHrqr6CxsPlUEgaB/u/jHyvIbfYeevlZmG7MTHgygeI6tMmnyrqCFk
	8f3JXxzNK1vnjaZB/LINjBnxYtASn9TK9wkUS/iySCV2H4R17sdyIKpd0i34Ub0uc4mnRdsu9/y9X
	oRbx+u2t5BRQI3BGnW+W9NWQqTTCDsfpDN9UQdeKHxZA2mmVBSqrxKitTLoGIiFtLLxb7Zqa94ljC
	6Yy3Dvbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ8q-0000000B0Qp-0Rjb;
	Mon, 12 Oct 2026 16:44:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJ8m-0000000B0OJ-1bW5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 16:44:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf0I71290967
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y5uGbkqYL5BqGtvqhH6fP3VPuTl/sxkQyH/3ZIuzOc8=; b=ApX9a17MgDArd3zz
	IEIomvFkQPdFNEZXNs0jrcGizyMFUeVYF5lLWptmDLl/KpgiQOSxKV7kL/4U1TYy
	AmW1tc/2b0Wi/uciNkWXg9kAfBjMGrGiBjAI2xAd8eeaeEeeUOiYvhx8ovtORrXD
	Jho97VAk7gsoSqIDdOSEcqr/jOkCGozpykNCLSOsW/OB5qV2JdU5gxeL1ctrt9w6
	fCQa28y+eWoRtycqglvvfeaSXs545imSmPbpeQmrEaqCK9KEAETaoxNbzSYt/G1F
	nbIouPblNllnfcbOvdapMheFfjc/zuIxAo3U5YsNHzsqTbEEN7RBZbzcbyBzGVE7
	KRDq+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcsru1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 16:44:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e834ff4d0so604005085a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791823483; x=1792428283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5uGbkqYL5BqGtvqhH6fP3VPuTl/sxkQyH/3ZIuzOc8=;
        b=RvaJARcY58MJQ28m6s4MvIyRvpi2xMRUPt3Z2JEzBNqQRnEVCycJZn1YvNsHOTopn0
         WXE/chLOl49g96vn4kKU51JrsvYztQQkxPnIFkJOk7zpaO1P5806LHLbt1vChdxFdn2U
         GGWGQXNF5ApgP69RihPnwrApvuWO9bjM6F5ABK0BMvoCFUrlPDlKIF3G0jrmfK7XhH3C
         y1UT0ccIpmdi7J5Dv0gUSgEQvpvLuxA+YhESFa0Gex8r9w5cQEa9IUEjDKMmwX5wsXh6
         iNTK2QsfWB3b+PCF0JDHe/IkXxLAbAwsxrNy9DrEYWJYFqOqqfZ/WOGCy1rEdN0x4yWr
         n47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791823483; x=1792428283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y5uGbkqYL5BqGtvqhH6fP3VPuTl/sxkQyH/3ZIuzOc8=;
        b=O6O6nZz+LrrjMReobXu1RhttUq+lgL9FJ7n9ZEPzcgU7adyUPo2K+k6IL7SWDrDb4Q
         QQfxpckXj0as+oO/SIjxoJwF/i99axila++N9DLVdwJHr5WLdWuNr1Ql8zAZmARho5SS
         97Nz6y40hNLtzMCyoasTHsafvRISDX0gYSbhfDoEqeGIvC6S7l/UnStnFyCLmOfDNZ/y
         W73IYl2seVrjnAvltr9/DysgrQfAcJ3N9tsaG1qCsZgsI66QsMJL1l/dCblp/DhBJ3RR
         XYYSFeB/Rc1EM457sglyiiLiSxpgUVJ2ZGod7Uw6rR2plhzx+LaeFyqURvoPfMRtNXGr
         bDPw==
X-Forwarded-Encrypted: i=1; AKwUvByAIviTPyXAB55ppybaJc+mEj6aTgb3kSSklFgiFTpX2UlKIbbVndDJu6MuEflCU7p29tto6rhDdEzRiBlC+RXy@lists.infradead.org
X-Gm-Message-State: AFq9FYKxFHOkqQC0zjxjsUR4Qxnh2QYgKjY1CZdH1GLf5L+o0jybHiID
	4N0xb1t0ks3Jta7q7Di5iaAFx4EPCPA6wjbuqXSxL3ChJccXTesqg8xa8sO6LKzDsyGoCAS4Vy2
	Bim2pztM6xmHaxN67QrEU4PgnUxE+J85QT7LkcE5lgsZ3CPHNLFfLNojEFlAoQX+B33NqdwME+O
	j59Q==
X-Gm-Gg: AYBFou281HR2H3zlrhgGE+slaTUConIfWkrwHrmwItNXT0KOnMSbZ0FrzJkpjd4b3JS
	C1P9VDixx8XEy0AH59o042mirBrSWLaRBFe3nina1DIXBzomJXyVTCX3qvY5FIezyVWA79VKCEe
	25lzScCYTAPfGCwSyCGv44vGB2XBQVHQN00nUBHQl8Cv1L5l2WlHFocdhzSWxIAdQ3pWXCKIik/
	RVf6YFhNFgzrQHniAJLTDvUjAhS4rMeRNRqg42IO7Y9cduKArTPagV5XatL8d39BM/OF/Bc44iE
	09UdbcOxtks9BLzm9oIWn0YN1xE3BXXWocI2f8oog9bZpkg+RMLC2loos17hxySPxmKc6XnCDIr
	VmkP9fNAmAhNLNg==
X-Received: by 2002:a05:620a:a0d6:20b0:93e:c12c:fbc2 with SMTP id af79cd13be357-93ec12d0818mr1145454485a.79.1791823482763;
        Mon, 12 Oct 2026 09:44:42 -0700 (PDT)
X-Received: by 2002:a05:620a:a0d6:20b0:93e:c12c:fbc2 with SMTP id af79cd13be357-93ec12d0818mr1145449385a.79.1791823482159;
        Mon, 12 Oct 2026 09:44:42 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaaa21sm424502f8f.9.2026.10.12.09.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 09:44:41 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:44:24 +0200
Subject: [PATCH net-next v6 2/4] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-stmmac-rx-mb-v6-2-2225050915c1@oss.qualcomm.com>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
In-Reply-To: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
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
X-Proofpoint-GUID: 636WocSm7sXix8cuv3gVfduVHuEZytrv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX8f6eFnoTwWEz
 KN5vKuXKtp2Gsp5par9Oaxj9ksT9OhgQkkgvaPDTKUjJVHZLOzPwx+DYFHK23QjcCfaGL+xOUr2
 gYID1L1s+XgvM+uk25OFOeQqWbq5KaE=
X-Proofpoint-ORIG-GUID: 636WocSm7sXix8cuv3gVfduVHuEZytrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2NiBTYWx0ZWRfX6QzalZlKeIrZ
 1aVKXITFA+cxNLPmVLExSqVg9zO3AZdZQPUmbn+mHR5TrBSQZ0DktLloS8uEJNNX4dXd0pFadTa
 KutiEOWndExlRJAq7yfGW9k/u00fyTyU6AcR/ci354wXhoveAdbbcO42cyFfvySPAmipRs+ilzN
 vf8dokiKhuztFWUaPawqkOkNo1+o/8/XfrIYk8Olum6JVrABMqJwktIoh8ttSR48hpwG1xfAeY9
 +sb5RQ+QRyYC9ECPMsFkJBHGoHVxAzebyPRp9pHZQrIP0kkxUiNXSsOrkR4aPyWWXzjuBgnN43f
 0MzqQ/ThsSTbczF2STmLIiKbIvzhi6d1TH4IQMqiHF6WzflDoETd10fcJBGVE8Ns8a9eVfpDkhx
 xbi31nMyED4Upxi74xXpDkE3+Gui4DU+4xFTkxKFqPfwOMfZCB0Uhpf2tJ+EZeQKk/m397ZCRv0
 866LIob7BEj1/c+CDIQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acd0e7b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=lO1k50BjLTqofN_Ss1gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_094444_433183_1920CEC5 
X-CRM114-Status: GOOD (  21.44  )
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
                rx_dropped++;
                error = 1;
                dirty++;
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
dropped frame once in the poll budget / rx_pkt_n, and once in
rx_dropped.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index f66b796f7725..426bb68c9bbc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5701,18 +5701,21 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats,
 						  rx_q->dma_erx + entry);
-		if (unlikely(status == discard_frame)) {
-			xsk_buff_free(buf->xdp);
-			buf->xdp = NULL;
-			dirty++;
+
+		if (unlikely(status == discard_frame) && !error) {
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
@@ -5721,8 +5724,9 @@ static int stmmac_rx_zc(struct stmmac_priv *priv, int limit, u32 queue)
 		if (likely(status & rx_not_ls)) {
 			xsk_buff_free(buf->xdp);
 			buf->xdp = NULL;
+			rx_dropped++;
+			error = 1;
 			dirty++;
-			count++;
 			goto read_again;
 		}
 

-- 
2.56.0


