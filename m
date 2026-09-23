Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B79BC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zE6L+gjyieqOTGl2iQcRKJf2Sy0tFK3Y45RRtxJziN0=; b=VJM6ijEOo6Mw/Ya4Tcuw+kQEZZ
	F4UhG4eeo1oV84pBkFwMP0gEcU51nh4mFTQ+vTYPTUvSvUJYllvfoKsgqWJg24LHPWhy61uzuzh3t
	c0S68EXg5bti5HG6gcKXSTTvfum3IIS39TZzYMATCY7EIFOSyn/m2YJtqy9uZ2ly2JqBs4MxJ0s4R
	gzwczQCfaPRo8KKaZnK4EQoGMwP/WRu2Oq99E/MpMivJt0XAklhLuuE/f50JBWbSuUxtNygqcRqN9
	83Yr1f+OcGEcpierCm+HaosVvhirVqPNQ5noJpgZPgEs9AeVQhC6HKojkSJbxadIiVaTa7Kx35UtZ
	cbDlB2Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J4L-00000007hJp-1Pch;
	Wed, 23 Sep 2026 09:15:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9J4I-00000007hIn-1YpO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 09:15:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N9Bxld2120859
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zE6L+gjyieqOTGl2iQcRKJ
	f2Sy0tFK3Y45RRtxJziN0=; b=GK8l/JoEfbCd075lQj3aMuBchcQV66yitf8aJ+
	IFbmz45xVIyBaB0kkAU0z8ce9r+G8c8iAC1ydhlvHBX1HN8DbHBaXY2KwmwjQFOM
	PHM7o3wPeJrCNtjyxdUR5yQ0ekrMKMtPwOsWhoXpis8PjvX9oC7KrcHAuynOHlw4
	uXDuuLwHoVmAXxdGdTsQJMIC+31WqvYwT3DIwUbptOcZWlQIl3fqxncjtDXSC0VD
	yGA1PNOqcO1Ux2Gn4HBe9XstrRiU+iuWeuZj1BJB52xjxM+bByd5j8rnGs1AEEPH
	ikMrGKs9OEYDxtBms93g6j9My3/mZ+p//IEAXbuwjtm+b3PA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7g0k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:15:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso100202585a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 02:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790154908; x=1790759708; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zE6L+gjyieqOTGl2iQcRKJf2Sy0tFK3Y45RRtxJziN0=;
        b=S8rOezfeezArFZ5cT3Xl8QxY68bxIiaw6Av9SUyPtDtAiZQWLwv4Q3T6LoKutyQeNB
         8/oRFYSZQJbdeayVY9N4sN2NQ0lV+EPQIlCmQ0pxUOjdLfZTCyeuxtki1XXJW93VKndg
         /0XP6SiA1NQh8JTbXV5z8KspSkaUCFTtKLHJVb01moMQX98uAbPiHxvg/RYCtjD7umvE
         xAV1NbmpaBFF7Xw8rtwHLo4zKONg3TY180d+37RDWh6+ALV+HWEpJ2znn2IslTqyTpjl
         v75FDgc5Ww29ZukCO7KohglffvUkE6FxZp7eIp+vJQmZLhOVP7WSf61biMKhK6VT81M0
         xO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154908; x=1790759708;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zE6L+gjyieqOTGl2iQcRKJf2Sy0tFK3Y45RRtxJziN0=;
        b=n+LkhFh8QNQrh2m0s1Ehbfqu9QW/PzwSOZwba9Wf4vSHN9ISEQd8lLbNpkF5R7rmU+
         QDYMjm28hM29bhPyI00q2rV+eBVnt4voZ9SY/ZPLux9iJ9J2JjvCyTOy6J1xVLklhJGk
         j2frAfAe5AsRSMbRCfIN8KKJEpY7fSEtULcKx3BMgAekSg90yb8d3knhMm+X+ymjEDty
         VUYfEdaD+EQD+oe2OvMOKSH3dflDIc2fy/AN2zEEnuH2V5I7FzxiNsJkbtEl51dvOJQa
         YBY8hEG3gM3kwncWduk3NJAmaogqeq4p6kMXafWDizp3oPBU3n0nxk54u/84WUrAJWvU
         Whug==
X-Forwarded-Encrypted: i=1; AKwUvBzAcmJ8efjUJNqdNxy+YAaRweI4ZSbg2shwgdEXOhnNEAX0s2uE9yZNxO1E9mAL7J7MjySkoqSLxgTjLB7pTvRi@lists.infradead.org
X-Gm-Message-State: AFuF++mHzgx7Q9z9PMa+QNBBLtWPzBQBRjIZ/iaVWJEBxLhkDgPXXk4I
	xpZYBzgFpMQ05hKYRXA/UUbetWTs2p74keEM3QENSdb2SQVZIe5oZltIozS51Np22ZWKC6Jf3C5
	E/WV4DzNqqJRTbXv0vDX/RA6DUpLgTAwtCJKGGs49iedOHwwR4Kj7poD9PvhlC2yZ8aoSukH60r
	Q7/g==
X-Gm-Gg: AYBFou0IXRfbiSkoNY3Hr4wjP9mmrSv4UA9S/D4s0EU/VLE8LKgmhpGfFffCpdwmCqF
	9L91QKwbJMNrLtZVhAwKVggDV1tFKjnp8jRsLbLFujWRcO0h76OWfECZIw+oHuyzbBTi9GRclpd
	F/4PjE9wHEH+8pUz1RsgHppc7l7DAc0z+yRIgg9Ak39OFyOBwNe8JsP3EVxXeY+oDdDm9bMDZVJ
	pfzhh0Sm/W8baj9gkyTv6eLuMykUGms4PH2yi5bE7/NQFCnstFYV4TjDB/IBb0UpFBZ9oN7tc/j
	7IpxUMenUGCob9bxyWaAi9/Sg/DSNjD0OQ6FjU8my6k5HfwhoWUaTQJrVWAeaRzhGGtlC37dtsv
	ZLvkh4aDpLJVeKQ==
X-Received: by 2002:a05:620a:4412:b0:93a:2a78:34a3 with SMTP id af79cd13be357-93c250c41fdmr317005885a.22.1790154908324;
        Wed, 23 Sep 2026 02:15:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4412:b0:93a:2a78:34a3 with SMTP id af79cd13be357-93c250c41fdmr316999585a.22.1790154907639;
        Wed, 23 Sep 2026 02:15:07 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1da00bsm59253745e9.10.2026.09.23.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:15:06 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:14:28 +0200
Subject: [PATCH net v3] net: stmmac: fix rx Scatter-Gather support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-stmmac-rx-sg-fix-v3-1-ed26fea7180d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNTQ6CMBAF4KuYWVtCi0Bx5T2Mi/4BTSzVDjYYw
 t2tXbnAzSTvTeabFdAEaxDOhxWCiRatn1KojgdQo5gGQ6xOGVjJmrKjDcHZOaFIWAgOpLcLEVw
 zzUUlRUkhnT2CSXUmrzCZGW6pHC3OPrzzm0jz6r8YKaFEnjrZSt63rO4vHrF4vsRdeeeKNLIZ2
 Y/D6I7Dvk6jOVe1UEy3O862bR8ZqqVSBAEAAA==
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
X-Proofpoint-ORIG-GUID: Fw6bpVS5QxrT9-hnQBfSFv3uGrd8EzL9
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3989d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s3KYQWbFtadNlPGyPsYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNiBTYWx0ZWRfX+FbCvkLSlXzw
 fCIBiZa6tlJpdfaOFwIIYhUBRq3OrV7XDs4c+fucmtM3htObri2FlQTGKjKvPrgNClFQQBPmIkO
 OYnp3nmavCwo9GQyCtHUUtmWBDhNgn0+3I+0Z9OOuiKBiXn9e6GrnO9hpXu2kdV2Ek2YVrrrsa7
 2VHYkiMDIqrYXcge4578s1CQgaUvqazEe5cKHpKHsq45htgHL/BQC/SJC7PIbvM1VndCPbF+7Eq
 zVVix6jQB+suH0PotURMbHUSf4QLx899OR6SavdUQPPcbiNfAz26HDBc4FFA2fp7lprktJvH/Fi
 c0w7yyN61uQ6miZs8vLkj1/NaxlLy90fRnMLnUFpdxg2+wH1XYzUOxozZb74UZfOC2PrVMPvlar
 8HgLd6NXMKL2VLwOxY4/CtkLUKR9mx5OSfkTSvODCGRTfiyYAy/VqcxWk1D87yaMiZiNcRcOatl
 LxqSlq9uqTgJo/oJ9Mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNiBTYWx0ZWRfX+ORrxX9kp7Ek
 aKOFES8XQcWfozhHNs5cInKWO83+MpKN+vt8dUUp27WCoqhtCL8bk3cpErZJOhvMpZGmDpvROmf
 LnYOxdTUwBUYq1vTn8V9/JnBQJG2KgM=
X-Proofpoint-GUID: Fw6bpVS5QxrT9-hnQBfSFv3uGrd8EzL9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_021510_442614_4C6D9C0E 
X-CRM114-Status: GOOD (  30.47  )
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
pskb_trim() instead of from a single buffer, avoiding an unsigned underflow
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
Changes in v3:
- Run pskb_trim() to remove the ETH FCS from skb tail to take into
  account non-linear skb.
- Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-sg-fix-v2-1-b6d88c5ac2d7@oss.qualcomm.com

Changes in v2:
- Gate buf2 allocation by stmmac_rx_check_buf2_cap() routine.
- Always set pp_params.offset to 0 and pp_params.max_len to dma_buf_sz +
  rx_offset.
- Do not remove fcs_len from buf1_len or buf2_len, just from len
  counter.
- Link to v1: https://lore.kernel.org/r/20260916-stmmac-rx-sg-fix-v1-1-b49b7b8f725f@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 83 +++++++++++++----------
 1 file changed, 49 insertions(+), 34 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..ec62fa7418f4 100644
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
@@ -5099,7 +5101,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 				break;
 		}
 
-		if (priv->sph_active && !buf->sec_page) {
+		if (stmmac_rx_check_buf2_cap(priv) && !buf->sec_page) {
 			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
 			if (!buf->sec_page)
 				break;
@@ -5110,10 +5112,8 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
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
@@ -5144,7 +5144,9 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 	unsigned int plen = 0, hlen = 0;
 	int coe = priv->hw->rx_csum;
 
-	/* Not first descriptor, buffer is always zero */
+	/* Not first descriptor, SPH enabled: buffer1 only carries the
+	 * split header of the first descriptor, so it is zero here.
+	 */
 	if (priv->sph_active && len)
 		return 0;
 
@@ -5155,14 +5157,16 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
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
@@ -5172,8 +5176,7 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	int coe = priv->hw->rx_csum;
 	unsigned int plen = 0;
 
-	/* Not split header, buffer is not available */
-	if (!priv->sph_active)
+	if (!stmmac_rx_check_buf2_cap(priv))
 		return 0;
 
 	/* For GMAC4, when split header is enabled, in some rare cases, the
@@ -5190,14 +5193,15 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
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
@@ -5720,6 +5724,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	unsigned int desc_size;
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
+	bool fcs_stripped = false;
 	int xdp_status = 0;
 	int bufsz;
 
@@ -5809,24 +5814,25 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
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
 
+			if (stmmac_xdp_is_enabled(priv) && !buf2_len) {
+				buf1_len -= ETH_FCS_LEN;
+				fcs_stripped = true;
+			}
+
 			xdp_init_buff(&ctx.xdp, bufsz, &rx_q->xdp_rxq);
 			xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
 					 buf->page_offset, buf1_len, true);
@@ -5927,6 +5933,15 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		/* Got entire packet into SKB. Finish it. */
 
+		/* Remove FCS if needed */
+		if (!fcs_stripped && pskb_trim(skb, len)) {
+			dev_kfree_skb_any(skb);
+			skb = NULL;
+			rx_dropped++;
+			count++;
+			continue;
+		}
+
 		stmmac_get_rx_hwtstamp(priv, p, np, skb);
 
 		if (priv->hw->hw_vlan_en)

---
base-commit: 4d56986fe713d91889fec7e155131fcc2c99a2e3
change-id: 20260916-stmmac-rx-sg-fix-a8d2d8a3ba01

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


