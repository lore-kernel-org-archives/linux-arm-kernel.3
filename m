Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A2FCA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jqF+qYHICj5HER0svNlKUByr8EgTf60Xnpf6q1p3Hc=; b=fx/oJDw/aUIFEBdvzSqWiVj2Kf
	02g1FX0tfAURAs62IlYIcp29LfwngtxT77S2SyoapD+AMCIny97OfS/WvGoXkOfgtGVQSCJ4ictCC
	zWiyrW7TW+PmipDarjW7/P6IuIAiOQqcTw3AWiwLVYDWOAbFs69eM+JSbDIzhHFIvqXVcGG3eQuAT
	aASEDTTux1bGIYyx/g0Fi5KqwkJtdgawiuJqoYuJ+11PtCzEn6TVO9K6fJ1ilaOXajNM1+esIowhY
	LJEpPq5JPJr42zAz/k/PM3CRk2BENXJG/EhjD6hkKEuv3Ew50eW8WR7VYZzc69w6+bm60UYJ7uC0/
	QPRYxxGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHu4-0000000AnIr-1H5i;
	Mon, 12 Oct 2026 15:25:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGHtz-0000000AnGL-3LQm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:25:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0QlR2088624
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 15:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jqF+qYHICj5HER0svNlKUByr8EgTf60Xnpf6q1p3Hc=; b=dxwrcQebicojW1Xq
	PvOE0VKUDwurCLfgVIQiiiAvDaOwAT6uZLscLJp12Q13kt5w00QoXCQo8sAF9vye
	vq5K1qF/8UY/sU50zGgiEg2soAPpj5g4vo01zdoS5dsdm2GohCjjCTyzu8MirCbi
	Ee3QFV/FCMX9abRkzAUqwK73+zUQfz10TK5vmPuzyRV1DnhET8oVkffRiNtlI7PC
	d2oFa9LMbLl0HYYhIjWIOuVEG1z3U/WOQzMgHC+IDbupdHEDHJ9FkAZs/uwaiKkv
	jxefz+3X14wlRHFW7mv1EXLYhTzRVXX3I+24G3pkt32OfSeGE3qAhcRmI52yuGry
	2kr9zg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2kwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 15:25:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5339732335dso35425321cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791818722; x=1792423522; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jqF+qYHICj5HER0svNlKUByr8EgTf60Xnpf6q1p3Hc=;
        b=i0isVRukNZleMauOv3TacWzyh/QBabGJuvxmipML25gnOh8gmYHU5t4Y0zaqoyvKyV
         TAdz1kZ2/CINQWpCqhg71EIvxZm+IKE/HbM31Zx/7RQ/3TxLHU1wG29CRoVJukAyC/zF
         OpvpcPqwWT58px2D0vX30fZxLMh7K3rhgkxTELWaVUFl+FcP7/0sqFquPWYPKa/ZSNxg
         Jh5bW/tV6obFbxj+8+ppAXFDFp1Y4CkbZ9JSE9XnilvKFb8tQywwCjXI/yfqz/ZZUVaS
         l1Xq6tGSW8oQVZILgWMtRFltpdGr89/4avkICnEcc/A6gZ4rzCPbisFf10XT03p9MbUp
         opjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818722; x=1792423522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jqF+qYHICj5HER0svNlKUByr8EgTf60Xnpf6q1p3Hc=;
        b=g30j8BMouxeNT3JpBQ0CbZ4QrP3/x4hcTpKRdTNqmRSz3wk95DGg9dhtLmJyHJeIcu
         9a7R+m0FnjlzkcAVIXWmHqdeCSEBgPmJH/a7vNU+a5qjCtCgBkVkPhbPS2CfE3Zjo1Ar
         4f8lbo4qfAQ7DEjvmTHwnDCr5GdN7DDAzIwi0p1Xhx0rlVhj/B9OoyDQ+JwXKxCGzOTK
         bVmR2grX49QVIxnWDlTPSR4A4/CJJWshAs2r2DmZfHFs9JyONDqpKGkSURXYDTX/bE9x
         ZtFZqprl7GLADDdTRKp95ZsvI1B8TSAh+wQ5OEhulRUpPBSWcBl3ib8ZXsDGrhF2plHz
         8Rrg==
X-Forwarded-Encrypted: i=1; AKwUvBynmYjkLAtsnSzKrXvF2m+tE+Ig2JTdMXv29Ku7pVuCh0TxuFT700H68+98Deyfp8PjcWcd02BuvI3rVTQHY2x+@lists.infradead.org
X-Gm-Message-State: AFq9FYJgT3E1vSv2o4SHQopzDdz5f3y9qdy2tCxdqihoHzOfd/FDksEK
	BuO24+WQluvRRtL0G8sVtmtImvBWnHdTs4rGJfx5z1TXHUrJwdPYNWhFRwuSYfahiPowsHpMSIn
	qxaBc3CZ7DqSTrrqzaEnvTE2teTaiTP4YZag0Q8fYfdwC8Dclg4LUSn1449DB/rJpZuu1zdVWhz
	CuQQ==
X-Gm-Gg: AYBFou2d9Nfek7Sv7zJRBB0D77W8HXs9OZN/ViFTtpJhsBpTOn7+VvBp55nJsnPTMoX
	yrqMashqQSZ+pvTf19hbLfo9sp+p4qEyH5/AJYZ24yS/ZGQVEKxx4g5qbPE3Rb4Jdap3KJgbJrE
	RaI0s0PVPLDi1bDhUPEHgJG5BRNUcoU61OKRRQd4IEJCocUr4GjeWyvBOq2DXBdx9PHyGAM/ZfH
	cYEw0jq9ivoP3FBNpDBbS3rvlsI0maZXtAu8xL2jyn4XHJc+d4gKkUwKEQ5FMHs0iaKNfPUVGSH
	9HBfcYZ9mk62sX78BIEx1wuKpebp/9E4dGGffNQ067m4BfQdMlKfPZxkB7U6lAWveFubCZun5+D
	PX1SRZLLXx/WSTg==
X-Received: by 2002:a05:620a:2a0f:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93ebd2445b1mr1566454285a.59.1791818721723;
        Mon, 12 Oct 2026 08:25:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0f:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93ebd2445b1mr1566447285a.59.1791818721037;
        Mon, 12 Oct 2026 08:25:21 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm177527835e9.2.2026.10.12.08.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:25:20 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:24:40 +0200
Subject: [PATCH net-next 2/2] net: stmmac: disable TX checksum offload for
 jumbo frames on bugged cores
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-stmmac-xdp-tx-pre-fixes-v1-2-05fd0c90f7e1@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6accfbe2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IBDDDhxC7lntIW3zH5MA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX8EH1oiljv05+
 4zCjqRyWrA9vzrDWvpQzwhP0Eftb0g+T0zoAMue4RO2dOjDZFsS4PxM2O4hMx4GlXn+iF04s0//
 bT/apOU93AmW7UzPq/dTQOLpDV0/hD94608RLKiTnrrUJt9lVn4DCWXkp7Hx6biNLnEsURjr0qy
 M6BgWtR1Uj/TDfPrHBEa1RsudGC/Pe1Cq/eADKhyFW0FMd26D60VWcztFyPHgqF9N0Gcto3cN/9
 4a//cgFpEUO3A39FBl2hwloQ4kO//46v4XU5BS1HXTNY5aejII/sCCHGM9N1hDpwYBcINFb7S6P
 Qx4AZf0czcz/ucaPBeAb4XG2InHEAoOZkGvUorz+uDkhBW06wb0N1yqX0I8NPI/HJ21R5V//RKE
 XhgZ5cmQMndbstphDR9kfwMy3tu6THOM6VfvpIe6wllNCzN5EGk+2AYr4I84ixCtKhh5v2eH4jC
 6w00yFWNW3DOlA2cbmQ==
X-Proofpoint-ORIG-GUID: aIB_6Gsd-00KbjBM40sDoTkBCMgJhkAT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfX+iwrhe+v7c2b
 NaIN7SfaM32Jw+w8E75EmBnnkQaKQwm2jGvIgSCgjmilQ47RFiyla+b0/rnqvS5nhEObo3KB+bs
 7Ixr5LBzWdxAL/cwhAwb9aP8kuUEvs0=
X-Proofpoint-GUID: aIB_6Gsd-00KbjBM40sDoTkBCMgJhkAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_082523_969344_3E479BCE 
X-CRM114-Status: GOOD (  16.41  )
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

stmmac_xdp_xmit_xdpf() decides TX checksum insertion from the queue COE
capability only:

	csum = !priv->plat->tx_queues_cfg[queue].coe_unsupported;

and lets the enhanced descriptor set TX_CIC_FULL accordingly. On the
bugged_jumbo cores (snps,dwmac-3.40a, snps,dwmac-3.610 and
snps,dwmac-3.710) hardware checksum insertion is broken for jumbo
frames; the skb path works around it by clearing NETIF_F_CSUM_MASK in
stmmac_fix_features() when the MTU exceeds ETH_DATA_LEN, so skbs are
never marked CHECKSUM_PARTIAL and no checksum is inserted. The XDP TX
path bypasses that workaround, so once XDP is allowed at MTU >
ETH_DATA_LEN, jumbo frames sent via XDP_TX or redirected into the
device would leave the interface with a full checksum insertion enabled
on those cores - exactly what the workaround is meant to avoid.

Disable checksum insertion for oversized frames on bugged_jumbo cores in
the XDP TX path too.

Fixes: be8b38a722e6 ("net: stmmac: Add support for XDP_TX action")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ca61ab449e32..0e29c5d04714 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5276,6 +5276,14 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 		return STMMAC_XDP_CONSUMED;
 	}
 
+	/* Disable TX checksum offload for jumbo frames on cores where
+	 * checksum insertion is broken for oversized frames, matching the
+	 * stmmac_fix_features() workaround used by the skb path.
+	 */
+	if (priv->plat->bugged_jumbo &&
+	    xdp_get_frame_len(xdpf) > ETH_FRAME_LEN)
+		csum = false;
+
 	while (true) {
 		skb_frag_t *frag = i ? &sinfo->frags[i - 1] : NULL;
 		int len = frag ? skb_frag_size(frag) : xdpf->len;

-- 
2.56.0


