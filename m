Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3972EC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pOeC9bH/10g+x2ymJYLzmSutmP+1dn79sICTa+MWWjc=; b=3VxgC+Uma6kvSz0CPKg9xHVIEE
	ddc1BMFgpItm5m8RRp9b5nYjFefIpyaNNWnsO+xX+cLHFWyFYSVBP21M+gKz9Iv1iXYCbkVt23pu5
	ixmkTtlimaf26/CZ/AmnOcMBz6dIFawio2nlil2SoL5h3DyzLMV8Fl1kxFhs3zCXlYKUZD6P42VVC
	5a+fE4ATOglLTzY9/EcwzHnuE+blGalKscUbnBIUBFJMMhpyl6EqmgeTfCQix2KY+ROCiHOOCRozg
	I/YGbLol2Iur/PiXIM0Bx1b8rr0X3XSfk60OZceP8qbcYzZAzbB1DpM0SRzm1EoV6i3IcMXkY7SxP
	UMJfIVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xQw-0000000GFMt-1TBJ;
	Fri, 11 Sep 2026 09:20:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xQr-0000000GFI6-0nf3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 09:20:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kpNo2311494
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pOeC9bH/10g+x2ymJYLzmS
	utmP+1dn79sICTa+MWWjc=; b=hVUze7nnRawRkOIdZ0Hr2RpCU8flo/K0pZDfmm
	LVlalXQezk97crqeaIxwxHh+nFzZkI2O2ZQYlA1vdPBXr7YKPEquHITzILJmoWFT
	SfREbh3A3D4AQvL5MbYQfZSP2BUCnseb1jnmuJt3No5TPdZuAXiLoU8AxCQVQDgF
	1VCZyZwalOwEYP+Myc8HMYNhiXuncbO3KxArvhbJCiDT3iDYPT8R6+R77DEibda8
	+IdAn2Iwp96SzzylaWxE6jHZ9p5BNj5HTAliUXYPeQqLBnQcHk0cMQ9Bt0O1al0q
	t4L3Z4fnXR7iOrp2KJwWyB3mPVdKsUqGHHbbpp5dHmmcUT+w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7uchpu9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:20:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so118884285a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 02:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789118427; x=1789723227; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pOeC9bH/10g+x2ymJYLzmSutmP+1dn79sICTa+MWWjc=;
        b=dbV2kNluyIz/gzqL8jVuDdKULvPk72PN2VFgd9vDrw52i6k7eFGIpCoee5BFQxjmyv
         de2Xj3YYc23Mt1R8VbmtknilMXyamufDIgt63634KtJ6nzcdl0cjT21aRJ/kC38Wlm93
         qOonKIy3ZHGt1S62767oJOYe2QxJgpCkAvupG/RO+e/ZtZSZKxuhttDKYWiLsvVC0Mez
         wlIfNaVr3lD2AIjoJpN5uHCQw/kWuX5ufqM3fSlWZaLSELhKvlhQIrxoM7M5reS+vvkD
         9MtLASdBLDu4iv2cxG527aZZkPo2+BGE9v+frMbFghTDiPMPuWTP5h5HXeXwAnXvM2Cx
         sn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118427; x=1789723227;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pOeC9bH/10g+x2ymJYLzmSutmP+1dn79sICTa+MWWjc=;
        b=OWohs0nNgzpnJ2MGpeQwEGlsIquuR9+bdPUCBDgMPX+CwmPQKuVRmYAaE+MmFpZhg8
         V2mc6GakN+cXEfpQbvNbnwPbWQtPLislgW9XafkNLKXBWgxGiwS1BNbUdC42JkqLwLa2
         FZk062Ud/N7cZNOR43T0A4hELt2TLBlj8flkZ2dVad1cZ6d6g9TC1Qsqr/R5XtA2Gu6y
         2n0KY0YdIU6TAgLBqOuldUCt+oBxEOqrjVLUKf+rYOlH+DQliGxCZ9ppSszjfbBmEAjK
         8zn+awMiGNCimFtW2zRkGv9h39M1uJ2svrMhiNIHoSN0HQ6HB9qknfHX31YXm686+Edn
         lZXw==
X-Forwarded-Encrypted: i=1; AKwUvBxPrBMZG2Dgc8FRyAWphH4qXXI/AlCa64pkj96t9XY3c+VJZsjTZUT9jU/Kar8NvqoMkjg13ICFKvCTrNFsJh7B@lists.infradead.org
X-Gm-Message-State: AFuF++nMscfC3mcI3aJhkJ3vxkkyY9zBN62SXYxXo7QziRwVwdatCFSS
	hJ8HKoeEEzetzfkYq2wVLoqAm1rog2V2/Ou9vItIhoMXl6RdxmwLRNBBfKK/S9WtiT9SFSTN0+S
	Hmhspy1UIiIgUbACTYVG5HLMuvz40JZHoGIB3+Ml+XIPGoMcZpc++5kGIEGsTF6YPneLWdRhZI4
	+lhA==
X-Gm-Gg: AYBFou0arzJQP2g7phEnmQPT15wUlKZRJzjQ4AzsppKVa1vE0hRPEk6Xfk+fi8zxhll
	iW2zr0e9CgMe4kD+jL/ratLOWkiXrN2viJrLiu/0vynZeITSKfrEr7LOsKPnDmOVqujgO/HMEQf
	KlVGg5CXBQNto1HoxmLLplG8Omgh3pjk3ueM+Wp2HVidcH9Advu36JbQQCet5qwGcZ5UtdKF3cb
	E3XJP2+g9zv8LKUc99b1zy9D8VEuyYshd3mvngzwUjzOUOWldM1jxKMtWgnxO5AaXZ03M9Q6NbI
	aCRe/LVDXPe5U4FSWLbOajVM2sX9oxTowVc5dJvMSdwgBz7psAoA+QNIYjAJEyR75OeNZxZNAla
	lfOLyZyAIe4jlFQ==
X-Received: by 2002:a05:620a:1a24:b0:939:40d1:2d6d with SMTP id af79cd13be357-939ea27718bmr375851685a.37.1789118427447;
        Fri, 11 Sep 2026 02:20:27 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:939:40d1:2d6d with SMTP id af79cd13be357-939ea27718bmr375846985a.37.1789118426844;
        Fri, 11 Sep 2026 02:20:26 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e62227071sm32076935e9.3.2026.09.11.02.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:20:26 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:20:15 +0200
Subject: [PATCH net] net: stmmac: fix TSO header length truncation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-stmmac-fix-header-length-v1-1-8fc103334327@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MwQqDMBAFf0X23IVswED7K8XDYp5moaYlCVIQ/
 93gcWBmDqoohkqv4aCC3ap9cwd5DDQnzSvYYmfyzgf3FOHatk1nXuzPCRpR+IO8tsQqcfQhBqe
 LUM9/BV2612/KaDSd5wVmmVe9bwAAAA==
X-Change-ID: 20260911-stmmac-fix-header-length-a1d526d60af1
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Niklas Cassel <niklas.cassel@axis.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa3c7dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=JMNiLqPw9-2bY0mBONAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfX60qdJfJT87+2
 301Q7NGwP8q1JBxLqJMbO8uvy6bRsiPL19p3PIGtqv1aGRE4SR5+y3tEc+obR/4Re/SHdOVagYT
 6mfAQIHOlVidFWqvLY1ZA5Q3rAFql6qmT6Tcjb9rlo2BdYII4x+fiChAB1WoDBzAD1/xO4dXPvF
 akKHPQtCQB/zFdDhGYRXt1Sl2wTT2IEdLKLFKvIZvYuzDK+xg4MMEzAR0dInOJXAEQcVLJxGi1z
 zqn6ewPDorSfZ1zvUWqXlI+HAjC35HZ/NIka/ABzwnntkk9vbTueml7axOvZCtAU5HfFS3m2bvu
 P6cWnmcxUOO5igVqknmFjeC/FixURpDG17bPuGisQggNy+7IpNdTmWA0qlVk15E5iOTCV4uzmQM
 ikpNEOXl/r5d3uoGtr9rd0lN5vVmNYY8BhYHsx3QxFXrg98enJ+SDQKOTfWCDm0mfEszAyuORYd
 anKSq+JFUTExJoxOgtA==
X-Proofpoint-GUID: 13WYxSPpm9m2emTKG3SZv4bdP1XH0pLa
X-Proofpoint-ORIG-GUID: 13WYxSPpm9m2emTKG3SZv4bdP1XH0pLa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEyOSBTYWx0ZWRfXwZiFZjYRV2lE
 nVrBsIx67543f/gf1p9QhuhM56mq/X8WdWS2Re4fr1ainqlXK0Xt21S0DaoRMgGZIYyYAjEfhYP
 4IXdaEns+Fcl9ziSzlPAc2z0h53Fr3k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_022029_283678_09AD5EE5 
X-CRM114-Status: GOOD (  15.82  )
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

stmmac_tso_xmit() stores the protocol header length returned by
stmmac_tso_header_size() in a u8. stmmac_tso_valid_packet() admits
headers up to 1023 bytes, so a header longer than 255 bytes wraps modulo
256 (486 becomes 230, 256 becomes 0).

A TCP over IPv6 socket carrying a few hundred bytes of sticky
destination/hop-by-hop options makes skb_tcp_all_headers() exceed 255
while staying below the 1023-byte limit, so such an skb reaches
stmmac_tso_xmit().

Widen proto_hdr_len to unsigned int, which is sufficient since the value
is bounded by the hardware limit, and adjust the debug print specifier
accordingly.

Fixes: 9edfa7dab811 ("net: stmmac: enable TSO for IPv6")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 62c3441911e7..1fb5f804ea23 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4513,16 +4513,16 @@ static int stmmac_tso_get_num_desc(struct stmmac_tx_queue *tx_q,
  */
 static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 {
+	unsigned int first_entry, entry, tx_packets, proto_hdr_len;
 	struct dma_desc *desc, *first, *mss_desc = NULL;
 	struct stmmac_priv *priv = netdev_priv(dev);
-	unsigned int first_entry, entry, tx_packets;
 	struct stmmac_txq_stats *txq_stats;
 	int i, first_tx, nfrags, ndesc;
 	struct stmmac_tx_queue *tx_q;
 	bool set_ic, is_last_segment;
 	u32 pay_len, mss, queue;
-	u8 proto_hdr_len, hdr;
 	dma_addr_t des;
+	u8 hdr;
 
 	nfrags = skb_shinfo(skb)->nr_frags;
 	queue = skb_get_queue_mapping(skb);
@@ -4570,7 +4570,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 
 	if (netif_msg_tx_queued(priv)) {
-		pr_info("%s: hdrlen %d, hdr_len %d, pay_len %d, mss %d\n",
+		pr_info("%s: hdrlen %d, hdr_len %u, pay_len %d, mss %d\n",
 			__func__, hdr, proto_hdr_len, pay_len, mss);
 		pr_info("\tskb->len %d, skb->data_len %d\n", skb->len,
 			skb->data_len);

---
base-commit: 78445023439506ebd83b86d40b1e428a3b309d4a
change-id: 20260911-stmmac-fix-header-length-a1d526d60af1

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


