Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A46C982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 15:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZkC6dAImDRSxbfI8Gyu0PLBQyX0+m8Svrvoe8yIAMxQ=; b=GBcbwo5jwJMEpKWa90TOWfVwIi
	yco1WrLiPj/SqCT2QsWe05GQngmkYZCSCaDTWOP5a2o0LBgz4jpCmzRb1AHuDPojCAQkQ1ekZ3DZP
	PwLjsBCISamWbaJ8L0jAgnD7AJZNHtc/QI1kAQRs1KbXHZWlw6lXiWdffmlhuljTKiFUNVizyv4r2
	LE6FKx70MERpq3ylNHlwMFDf/07CkDI05Dr1kqjnCf13NpgihBMehfZwExz+6E7mUeq7JDyM6fS8a
	rhUCZ6ATcolV/6RkQnK3rcMtyYLJQwZEyx2x24u5m6QkKFipqenzxKhmvOR4hovLdxwr0aKghn8gm
	fStepKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rVx-00000009ZgM-2z1W;
	Wed, 16 Sep 2026 15:25:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6rVr-00000009Zfe-1Jro
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 15:25:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GF9j8H2935116
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 15:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZkC6dAImDRSxbfI8Gyu0PL
	BQyX0+m8Svrvoe8yIAMxQ=; b=o16H6UKWym5Ywe725ILwTKjR5AUBWEe15DmBNs
	HAff0BT9fnPtsVNYZDWg6Qg2twpojwBXc/PwDPUaQdZUX5TMTx6zDNZ9XDR76qpm
	f2OpdXW036tiqM0fAgTj88rARhkG/WtCLmnzSlE8FpOPMarhmA65ZiZW2hhja15x
	Q9xreUXcqpTB8Iqp+rsc2Yov9G0vroDAWLxXhpKpSMOcoOuVK3G4q/OR868V5rzf
	39lAc2Ag+08iv24Q3TAb5sJqohajPI6y+Pz3H0Ikb2hvV9ZvuiekuhM1tFju4gLH
	KIGyDbqPKL7K52ivk8qvTXdyQwNnavzphyN1GQXLHYPrPu2g==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7jr2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 15:25:30 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso1938755e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 08:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789572329; x=1790177129; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZkC6dAImDRSxbfI8Gyu0PLBQyX0+m8Svrvoe8yIAMxQ=;
        b=R/rlbqDJt9oj5IjyKyA++Al6lTDAe8/mjDwzLbn9oBbFsYLSi3jDAHbeWdsc+WF3N/
         JTXLxrU99n6bh2v2Ji8h8QGP70569h7AMiPaKHEM2zpTvJTsIP20zVrwnJFlTvGuteRm
         Z9qzTzwu37h5m3HNumApd/s/tsWjEicdTfMgLFCJenea8jfAp/xGSmxDDtjYdsFRvMtT
         QUqyHOoo19ln1q9i77G+ANC29u+rabin/w+PeBMm5OMPIlvA1OuMk798IatE9k21Ka0p
         Yk7sCZIsfhpdqf/6tHmi827U9Z0EljxPWs7UdUMrC9YMU8jQsZQXAHNqj43R3OJECK6u
         4Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572329; x=1790177129;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZkC6dAImDRSxbfI8Gyu0PLBQyX0+m8Svrvoe8yIAMxQ=;
        b=nfKsHllJlzKpmnvs+YyVc369UhY9u6GhZTO6mS2WVhXAJcZbO8IFf9Wqk2Emtix7qy
         hXUxtQ3ab+EqAUfHk2zRaV2J+hAuSzqEiFTjdGHWyYKDHbK9Bf94A1PO6VVQYuYPO3kP
         AbhiFApxgxdlaFG5H7zU+5P4VFnHd218Aorj5/n/SlZF3kFgOdcI6dnbBNci6tCOej2N
         8vpCJm6BbnSdB1qGoOteGiWTOsFTDyrrE2/F/mgYc+9ihcKO+0BoyN8Vt+gLIq1GM9wc
         T3LHbY33QitAwZMQaqK8GbDMmrgdxj1q9cThEUs3MFCiY0Csa4W/Xcyn8lJfiFikF/vh
         bIQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqx8nQpjstsuBCgb4teytM+TLRLTqHwalUn+KYs8rGvi4UZPMNdNdgApUFM0q9qOf3Mqv+kmb+Fzp8xWW4ZHkg@lists.infradead.org
X-Gm-Message-State: AFuF++kqmR4hcFhAjTOibV4r6FNICqeaCrjgRUc89ir6AsNcLGwZa3fb
	WqnVxT9F1g+x11XsbHhrIM1xAzyhN5kxxlWjkOpTiFYMz+1Bwmmj86WaP7grgYoh7AOvs7vu6SR
	+MNcqjck9IJpskAt53ZUMfnxWLY1mKfE3DnkHazvGaS+fTOgihOXQx+O3fOvNihhikUASl9z+2M
	KpRw==
X-Gm-Gg: AYBFou1eJI1fzjl73NjgJvoGl+95LyLIzTMIa3jZqVfLhHSNA5oM/ymOj/QzTsGhG8w
	QhapFWTQk5l5ui+bIWnNK1JJLd/2gVVfrVEAqvjX434rbDZ6RhUUrKzNypva537xhUru3PY7CT0
	IoXrTQ8UUny7aPPrMaSyMBXCLbnurK8C4wKHBvfo4s1cHs2k8JvgXoVutwXux+QYEoqr8/aH1jh
	t0R0MsK84s88xzY4V1Dy5ziLCrM1fQcM/w8/VHZIANTQZKFhakZc4EtEtFhXtsscvHZEsrCpFIC
	Mzf/49gUlA3BGBlAvMkaI20xk33Pf3DdW4RfW3y0SPEof5pksuqdx8SVEDFny+EixC0MgHwT091
	LdOmLMQPUOvln+A==
X-Received: by 2002:a05:6122:3310:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5c99accd48cmr3861679e0c.6.1789572329295;
        Wed, 16 Sep 2026 08:25:29 -0700 (PDT)
X-Received: by 2002:a05:6122:3310:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5c99accd48cmr3861532e0c.6.1789572328756;
        Wed, 16 Sep 2026 08:25:28 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm8971364f8f.1.2026.09.16.08.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:25:27 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 17:25:14 +0200
Subject: [PATCH net] net: stmmac: fix rx Scatter-Gather support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-stmmac-rx-sg-fix-v1-1-b49b7b8f725f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAzAviI9W9gmiPoV8VBdnT04ZRURZH93e
 EwgeUE5CSsM1QuJb1E5YgFbV7BsFAOj+MLgjGtNb1vUa99pwfSgBlzlQeq88x01MxkLJTsTF/0
 vR4h8wZTzB1ljzM9nAAAA
X-Change-ID: 20260916-stmmac-rx-sg-fix-a8d2d8a3ba01
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: xHeMmWSLlIb5JbnYeLxB7Yk4-b6cR7dI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfXzlYCAByACgkJ
 YhCVbQlHWBROsFmlGMHpgOF7VoTgqLmhV/rJ2nDiaVcdJsQh2mUM22Th7Noi59EtklrvwYxvfvG
 hQkrhFYFplkAmKcWCtSzrbooJfuv5Zsm3fu4cHNA5tAHk+YuWgo1pkpVvDNxpRhgq+ZZL+bMXzA
 W2NVyUwBfQ3kK/AHoU6NCeCNVgzv/of7zQCGBd4Y5DiAgfHSPL9ImJNeWiUlYOHJmHFRHWHvK61
 gaLQlVFjZc+6f7rLilmOKEljpkUQieuFXJF6Ae4i6Lka9jfnkT4gTFOMJjV0+ra3SE2nfgKhcLi
 yNN+MMNUvSa+VJ2frtwpzZ7Z9og9GYFCblmD+Y56YMX3S6nU+yA5shjnzve+sciCAI8qczLakuw
 id+EsNJNkd2c8AksKkhCWfvQpNRLmvod8KT1p3UuPqPOJe9UzvWm1/SoImdbMDpthCJHtAvD9KU
 WbR07VBWnrHoqI8eh3Q==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaab4ea cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=KoM1OlzK6_DTh_BYGA4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwOSBTYWx0ZWRfX+SL1g1WUGBY+
 V6lDrLfa+awO32/0av57PAzcjV64tQmS0HsctIaP7PmXeWj4DM73yFwpwLTw3gq8gCBXEKgx+YB
 DkXXo+avEGcBmjDbHMrvU++iebaiUzg=
X-Proofpoint-GUID: xHeMmWSLlIb5JbnYeLxB7Yk4-b6cR7dI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_082532_013143_D8190864 
X-CRM114-Status: GOOD (  19.58  )
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

Enable scatter-gather for non-SPH frames: always allocate the secondary
RX buffer and always mark buffer2 as valid in stmmac_init_rx_buffers()
and stmmac_rx_refill(), and account for it in the buffer length
computation. stmmac_rx_buf1_len() now returns min(dma_buf_sz, plen - len)
on the last descriptor, while stmmac_rx_buf2_len() returns the remaining
bytes on the last descriptor and dma_buf_sz on the intermediate ones. The
GMAC4 + split-header path keeps using the accumulated payload length
semantics, since there an intermediate descriptor's buffer2 can be only
partially filled.

Fixes: 88ebe2cf7f3f ("net: stmmac: Rework stmmac_rx()")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 25 ++++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 1fb5f804ea23..be7cb0cafeb5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1659,17 +1659,14 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
 		buf->page_offset = stmmac_rx_offset(priv);
 	}
 
-	if (priv->sph_active && !buf->sec_page) {
+	if (!buf->sec_page) {
 		buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
 		if (!buf->sec_page)
 			return -ENOMEM;
 
 		buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
-		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
-	} else {
-		buf->sec_page = NULL;
-		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
 	}
+	stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
 
 	buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
 
@@ -5097,7 +5094,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 				break;
 		}
 
-		if (priv->sph_active && !buf->sec_page) {
+		if (!buf->sec_page) {
 			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
 			if (!buf->sec_page)
 				break;
@@ -5108,10 +5105,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 		buf->addr = page_pool_get_dma_addr(buf->page) + buf->page_offset;
 
 		stmmac_set_desc_addr(priv, p, buf->addr);
-		if (priv->sph_active)
-			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
-		else
-			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
+		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
 		stmmac_refill_desc3(priv, rx_q, p);
 
 		rx_q->rx_count_frames++;
@@ -5160,7 +5154,7 @@ static unsigned int stmmac_rx_buf1_len(struct stmmac_priv *priv,
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
 	/* First descriptor and last descriptor and not split header */
-	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen);
+	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen - len);
 }
 
 static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
@@ -5170,10 +5164,6 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	int coe = priv->hw->rx_csum;
 	unsigned int plen = 0;
 
-	/* Not split header, buffer is not available */
-	if (!priv->sph_active)
-		return 0;
-
 	/* For GMAC4, when split header is enabled, in some rare cases, the
 	 * hardware does not fill buf2 of the first descriptor with payload.
 	 * Thus we cannot assume buf2 is always fully filled if it is not
@@ -5188,8 +5178,9 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	 * Thus 'plen - len' always gives the correct length of buf2.
 	 */
 
-	/* Not GMAC4 and not last descriptor */
-	if (priv->plat->core_type != DWMAC_CORE_GMAC4 && (status & rx_not_ls))
+	/* Not GMAC4, or non-SPH and not last descriptor */
+	if ((priv->plat->core_type != DWMAC_CORE_GMAC4 || !priv->sph_active) &&
+	    (status & rx_not_ls))
 		return priv->dma_conf.dma_buf_sz;
 
 	/* GMAC4 or last descriptor */

---
base-commit: ceac0de741bfb47ca255eee075257b3bb31f0651
change-id: 20260916-stmmac-rx-sg-fix-a8d2d8a3ba01

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>


