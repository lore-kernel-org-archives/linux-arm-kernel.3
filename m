Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC72C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 03:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KCwUcTW+JCBXhA2O5sLNJvcXCcHuUpmaH1Y5CqHoX3Q=; b=r84lv7VB2HyPZui4fV764sStyS
	saNMpEeUEWu8+faUE6MJHB2dIBx+5ao5BuZB+NlsxaZP81Gsj+LaeAhVBiuv1n3hCKo3uRAwCB3XK
	FWn6zuxy83339EvggUz9CCCCIlj3GpEbKeY5pQiUsbCk3WIPA7rl1LrqKZrE0oAdnEjcD6kdI40of
	ZnzPkGRCxrOtL664OC6zuew5FFzlQYAL1QjquS9983wd2hQkMqJvDKZRJ+Vq4fomrdlFgiSK+7xJx
	/rdzF6phpzUa3qiv5fmeAo+Kt4iu241fMnSvFyZ8ONl1HPmUM/PZqvr5u88XkVnAUkUqB+SP4AcJe
	H3voIYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCrow-0000000HCcq-3sHF;
	Thu, 08 May 2025 03:21:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCrmx-0000000HCQz-10An
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 03:19:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5481DJHo029148;
	Thu, 8 May 2025 03:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KCwUcTW+JCBXhA2O5sLNJv
	cXCcHuUpmaH1Y5CqHoX3Q=; b=bY5KmB7ZnC7NQkyOAArnluwxXM214JmkyckMHv
	83sT9yA/YTWe0S9fDoGYfVzfGy3xDhTR6MaBq04oA/4ErePHDJy5M3mGJKi3sFtH
	KCEz9pLs5Ai4m2tuk5KJpiD8WTbbs+NQUBlZ9zNWFtA2MMZWoYcQ7BiSK3eKc9zW
	YDyFSELQhGdtGvPazZS4zZYioPG9dTLW59NYa43+JIJh/NLp54l1pt29j4mb8nVT
	V2YwPgnTNX6nzhtS9NPGh+VH2bJ04La0JkGvH9C8b1wRBadAEQu4Ket3VKigjqIw
	Ryoryk9mKNKILk+5Jam8o5s2OttgbAQ5U+mXR25t7rTgiSWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuyuw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 03:19:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5483J2DV025109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 03:19:03 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 20:19:02 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Shilpa Suresh <quic_c_sbsure@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Mao
 Jinlong" <quic_jinlmao@quicinc.com>
Subject: [PATCH RESEND] coresight: etr: Use noncontiguous api instead of noncoherent
Date: Wed, 7 May 2025 20:18:51 -0700
Message-ID: <20250508031851.2566235-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681c22a8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=LJGOv-cUfqeUQQqDYsEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Cs70GVF0RP2iA7c48ktTqSrR84qtVv9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAyOSBTYWx0ZWRfX2GtiCQUX1nV/
 7kDIYtnKjSvdGKjSIQX7Mf5GCr1Op1sf4eoLZFjHO2+CaVbR/Xkm79OhtFCsTlmep7IsLAB7BAk
 7JVIi4dd6P5BIuIL6JdaWBwwGMTUMHRZw30XEgOUcKEa33HBPRb7rR5D5RT8IqW64erl2BQfJOc
 m9Jpqhdw4xwrRKysSmTijzFGxF5voHiPQsLJJC94QGRWhAmy9C9mbK5n+gYde24a00Agou04Lut
 OqFQ8vGPseul74gRUNaXqXLY69rT57oUNvsnVrB+3UlErnqtW5LxIl/QYEd4DdqZybY5BbPTj61
 DWKp02ma/82KG1dkIPzO6YB6CHNi6e8/gkot2NkAaaKYeQ1Rd2PoUHf6sE/1l2XbLs/WBIxjCsK
 nCV7JhFuHOroiNbNLctU958evUEPYCHyShetxYvdA4b1mdM08LeFuDNW0uvsALF+f4H0CZMy
X-Proofpoint-ORIG-GUID: Cs70GVF0RP2iA7c48ktTqSrR84qtVv9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=852 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_201911_415558_D9299888 
X-CRM114-Status: GOOD (  16.85  )
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

From: Shilpa Suresh <quic_c_sbsure@quicinc.com>

The iommu support for noncoherent is removed by commit(dma-mapping:
remove the {alloc,free}_noncoherent methods
81d88ce55092edf1a1f928efb373f289c6b90efd). Use alloc_noncontiguous
function for etr flat buffer allocation.

Signed-off-by: Shilpa Suresh <quic_c_sbsure@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 47 ++++++++++++++-----
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb29b68a..3b204f3bd45b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -24,6 +24,7 @@ struct etr_flat_buf {
 	dma_addr_t	daddr;
 	void		*vaddr;
 	size_t		size;
+	struct sg_table	*sgt;
 };
 
 struct etr_buf_hw {
@@ -616,15 +617,24 @@ static int tmc_etr_alloc_flat_buf(struct tmc_drvdata *drvdata,
 	if (!flat_buf)
 		return -ENOMEM;
 
-	flat_buf->vaddr = dma_alloc_noncoherent(real_dev, etr_buf->size,
-						&flat_buf->daddr,
-						DMA_FROM_DEVICE,
-						GFP_KERNEL | __GFP_NOWARN);
-	if (!flat_buf->vaddr) {
+	flat_buf->sgt = dma_alloc_noncontiguous(real_dev, etr_buf->size,
+						DMA_FROM_DEVICE, GFP_KERNEL, 0);
+	if (!flat_buf->sgt) {
 		kfree(flat_buf);
 		return -ENOMEM;
 	}
 
+	flat_buf->daddr = sg_dma_address(flat_buf->sgt->sgl);
+	flat_buf->vaddr = dma_vmap_noncontiguous(real_dev, etr_buf->size,
+						flat_buf->sgt);
+	if (!flat_buf->vaddr) {
+		dma_free_noncontiguous(real_dev, etr_buf->size,
+					flat_buf->sgt,
+					DMA_FROM_DEVICE);
+		flat_buf->sgt = NULL;
+		return -ENOMEM;
+	}
+
 	flat_buf->size = etr_buf->size;
 	flat_buf->dev = &drvdata->csdev->dev;
 	etr_buf->hwaddr = flat_buf->daddr;
@@ -640,9 +650,12 @@ static void tmc_etr_free_flat_buf(struct etr_buf *etr_buf)
 	if (flat_buf && flat_buf->daddr) {
 		struct device *real_dev = flat_buf->dev->parent;
 
-		dma_free_noncoherent(real_dev, etr_buf->size,
-				     flat_buf->vaddr, flat_buf->daddr,
+		dma_vunmap_noncontiguous(real_dev, flat_buf->vaddr);
+		dma_free_noncontiguous(real_dev, etr_buf->size,
+				     flat_buf->sgt,
 				     DMA_FROM_DEVICE);
+		flat_buf->vaddr = NULL;
+		flat_buf->sgt = NULL;
 	}
 	kfree(flat_buf);
 }
@@ -651,6 +664,9 @@ static void tmc_etr_sync_flat_buf(struct etr_buf *etr_buf, u64 rrp, u64 rwp)
 {
 	struct etr_flat_buf *flat_buf = etr_buf->private;
 	struct device *real_dev = flat_buf->dev->parent;
+	s64 buf_len;
+	int i;
+	struct scatterlist *sg;
 
 	/*
 	 * Adjust the buffer to point to the beginning of the trace data
@@ -668,12 +684,17 @@ static void tmc_etr_sync_flat_buf(struct etr_buf *etr_buf, u64 rrp, u64 rwp)
 	 * is full.  Sync the entire buffer in one go for this case.
 	 */
 	if (etr_buf->offset + etr_buf->len > etr_buf->size)
-		dma_sync_single_for_cpu(real_dev, flat_buf->daddr,
-					etr_buf->size, DMA_FROM_DEVICE);
-	else
-		dma_sync_single_for_cpu(real_dev,
-					flat_buf->daddr + etr_buf->offset,
-					etr_buf->len, DMA_FROM_DEVICE);
+		dma_sync_sgtable_for_cpu(real_dev, flat_buf->sgt,
+					DMA_FROM_DEVICE);
+	else {
+		buf_len = etr_buf->len;
+		for_each_sg(flat_buf->sgt->sgl, sg, flat_buf->sgt->orig_nents, i) {
+			dma_sync_sg_for_cpu(real_dev, sg, 1, DMA_FROM_DEVICE);
+			buf_len -= sg->length;
+			if (buf_len <= 0)
+				break;
+		}
+	}
 }
 
 static ssize_t tmc_etr_get_data_flat_buf(struct etr_buf *etr_buf,
-- 
2.25.1


