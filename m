Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1599FD877A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=; b=kKX0ytdXSbjHAj4D1baiEx6+kx
	G120CApaSPCP0MliEtyXzar9wGIIgRfwY0KX22hHUyTtFE1A5NO/admLoZHESJ0TNcdfe+Hclf/AC
	U5N/3/PVz77FHK3BX94IakJZBWYkw+UCi0VWaJOwLGvM1cdfZRtxeJZnsr6/y9etpHXAgTDstxwJr
	SAbFgsDKeGSNeJIj49bhR399YpVwWobqyXzT+JoYPLlJtQ5yFmaZamBHouslqVzdrQ9kVed8b1sVM
	OsUZhCX+lcwVtnK4lKnuBgSYGUcG9ZdNYBKE/0xzyVCgGJ6KM3kLtlH2RSoeUVofm6Xz7tEPrsK1x
	Cjem6fxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0t-00000006V1P-2Afd;
	Tue, 17 Mar 2026 14:03:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0o-00000006UwZ-1fl7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:03:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8vsai4022256
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=; b=PeSQpoHgCjkDtOpF
	8xeOshEXMg4ZlauTggV9b9YBkoEKe37XcZ7EeVFd/6tJwGqKWol2ScLNk2xdEIIH
	pyNAokq1UBmH9GFMeu6/KCBbWHi6rNnL7LCpkQ00mfwYZ1CExBcuZQPmMjBfMRvs
	icqFAgUoODE6b54sozyN/12caC4wKLjRwY/4GTbHSfd3fV4X3AzYPnyCdsW9UhDp
	Ex6li41eEdPpTmbuMZ4WoqjKp5PpS65MMZn8n8TKwf10CwonYHW18kt0ruC+MXNi
	ulqV0wv09KEQjXCUTsSooU/lDfRAwrdfg11TO7ppTTVxRmtm3qT0SjFbG9IhOlNG
	z+hHMw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fm01c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:03:09 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-950be47e8c9so8909920241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756189; x=1774360989; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=;
        b=bzL74C3Oxx8rLQlb4AOjystJMAwh9439wQPytgKsZ7d0O7meygK7Oz8wmdR7jWo/EV
         awqi/uXH5h+cTlDoGQi5QljMPartmYrQP4+m0ujB7lSw/Rcznt6mQeColH2VDlOOwD+H
         hTGQEb+VhYOlQ0B07gYH73/8B7z+70yNXRsyDQnjwjJWx/JF4YkwSq6l4iNeLI6QnCOt
         nA0kx6a8RZWtladMqzWdZ7dgkjzdHR2BnzLsueLiQyefk1upXdBYJmxaysRDEX3KV5Fb
         SNRoD9phPY3M1QGY0zM0IIpiBuRPx5koQ0OehA35wDm2CeWX/a+FZx5WNHKKIfkr+vO3
         mAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756189; x=1774360989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=;
        b=OSXfk7pHYFcpZufGIIsHLKPWHOF6i78pvPmy1H398G1nb466RGRmwLIJZW6wbZPkHC
         Ke4IF3TA0CwBBWgb0ZH2ainp8Tn9ZCfYCqnZnlNV3exkuengBE3CGmzx6RcCixLOmnAu
         jtRuLZQnGH6YJhpSZes8HD+wIay6xdrI/LeQdX0/GRMCO0fWMkoIrvicPaAo3XnYSrsr
         XW5FcunSWnmNkIWW2sa0sxrZsmFbho/D0jhgAKdSfN3HX3w1UyfY9Yun+5Hsz7Hyu7De
         ErSIl1kNGAQT8lXjc4sIpTANIR6UM33Cp7sPFz2h6FcEqKUsWcqvmFDUBSl4QcG7kfP3
         T0RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSzSMsipEMyy0KGkE41rBm7sZfQKBefyQEpJmuy3LexSKP5OFg4BMfZGj5nEd7Ef3X442alqYGGeqAeOmXQ1BS@lists.infradead.org
X-Gm-Message-State: AOJu0YwThs/ZIRiAiV2qoMGtxoBLMc0+w7kdR4tF5qICG80Fm3VviPDT
	cTkg0qlLp3PRYC0Bcm/tMfh5v682OtbI2IOBPbGiL3eF/aHkCCeYvISE5qIabRI/zEbwjAlLS3U
	YTG9vDqB8JJE7RDga7xu64jxokMK8tyBB6SwOBJiTVA3eKvWLRTsBNU056jSFHkyhAWadyvyf1m
	4wYA==
X-Gm-Gg: ATEYQzwAE6xYj902sJg/murDC5xA3cba9KMjOsAursNpQV241yMMbD3YMzPO7L+9tFC
	uL2nsPpQupQZMpQL4mQVPBoffY/Mvu7nVcMJr8BtF3ZgvPCFtAQr/IAZSbSm2Qi4ZE+gkT7R3UB
	KlrJ1vKwUwXWyNQp4+hF7uNkjN7CUBNcIhyh+n3wq+mxx14oyltvGPIMd7ZLY77nOrtuy91Zutz
	vLakWoEs48QegGioCehVj91XAb0GW28x11H6anrSmPoWkfH6pVL+4A2d8UGCEXSk8UPud6hIPW7
	xIt5pY2PYDagjCwKTZ/1ijCiMNG6EqZjonLFLMNg9ftOPAb6VAPKSEnDuVDm6a7x5SdJeNpk1xL
	k1ryIvqKyuwbKRWq6RM/g8ixdotidKkLvf9AzbD3vkhTTgGCG5aH9
X-Received: by 2002:a05:6102:3e94:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-6020e501571mr7432163137.19.1773756188464;
        Tue, 17 Mar 2026 07:03:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3e94:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-6020e501571mr7432059137.19.1773756187757;
        Tue, 17 Mar 2026 07:03:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:03:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:19 +0100
Subject: [PATCH v13 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-12-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zaDjliGI9P8SDSmb8oK5ZUowNY4iBaNue5t3+i0OgLI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV77vDCIAYQfI0C3VRl7ukLCKUCkcp4kTAmRc
 iM8NiplJyGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable+wAKCRAFnS7L/zaE
 wxoDD/0WSHRC6PfNqAmPMsnjMbE0sIR5179rvqrjPAs4tHYZjlfgSKp93rEdS4eNLqf3JrBuB3C
 tDP+ethl4+iQ1U/zNVHVLX0UoL6dd+kelGmj16HABRYfZE8OAww7gsCqgt+i/VuPJC1FvAtmXmC
 GdJBFhKm6ln6wNIiyYHEaGXbLCbrJAtSBQQ4s1ehX4guY2rrDaqrIzmdR7FYxzLRZKcHc4GrJ6F
 epJsJcM9LsAAp7UI5gUjq/OwYPZKCtmKp0A7sS6AUZAj/0vsOY3ery5R1rG69LOCBQMvyYjWefu
 jkn5BT6zjy6cyV3O98r2EqReK63cX0ybe5VlsUqhLynoFZUfeJD8aRIdnamKhjBxW/BpzcmP+1Z
 dJadF7bph5q5ZQWll4GvPeeR4bWR6fpE7CIejftDYidq3NDLDSofdlkKkiw3wMLxvYzJMO4hMT6
 DqrmG+lHvPf+R85RPdBBclZ2/05xpRXVT8xCDmnW3VrkxHUOROXBacLS3kXbP2gPz66VydFUzKF
 tsbaqFJ+nYrKJvbRRN7KYnx2xWUXgHdF+1ltnt/KTrPykMf6z89/PtWtJLQ0mDuwsBPZDpU7io2
 GmDJEP7kGuvldOvDCahNhdcmw8iTOnre/lQ8zI3aUM7sUmA/3hTfTGtX1A1DyqgSZEI3YJR2SlM
 rGyUPdHOIWTH8Sg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b95f1d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: 9xa774pkwXg1OuAm59kXQGri8oxhry2P
X-Proofpoint-ORIG-GUID: 9xa774pkwXg1OuAm59kXQGri8oxhry2P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX5HgS0qkr3C+o
 TF0NGtNcsfhwMAghZyI4aKUzhg1T012z5w662BY5FB2xqLOPXM4kXWTkkwbFE2vxPKVKGt4nXxG
 wElOhsXsNeuMkWiks6lW2lNJ+T4NunveFakAQOcwbeipqNroBo7MIJiUzCtkko7UlEpgHVPkh9f
 N0ycAkPfda5Q9985sr80T0WnDSGc00a24Me8PO4uAuZuHGhTjGEdlTJ40WTNYmVPjQLBa1BpuG/
 hV/HomlZDv89ta0rCr5f8ft95ji21y8Ago2g4z1+VzIVwOw47eXRVoMxdLqwhVwNwNrgljtKnlp
 gfhcd/em0UBLjelCcZIKlc3yfAC26qepLID6uYTV0sWB1+3kkbYvqAg/vjWJ1SxTgFYB20tS0py
 h1wEuKzwe405I1Ww//VwVea9cwj2Lv835X3d71M8BOqkNFQaJeibMYrhGwBhOxrkDeMnGdlv5x0
 ODYjNJ093aoO6vmrLbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070310_580132_DC29A1A7 
X-CRM114-Status: GOOD (  16.56  )
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

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor as
well as mark the RX channel as such using the slave config struct.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 5c42fc7ddf01e11a6562d272ba7c90c906e0e312..635208947668667765e6accf9ef02100746c0f9a 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -43,6 +44,7 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = { .scratchpad_addr = qce->base_phys + REG_VERSION };
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -64,6 +66,12 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		return -ENOMEM;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, 0);
+	if (ret) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return ret;
+	}
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 
@@ -107,7 +115,9 @@ void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
+	struct dma_slave_config cfg = { };
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
@@ -119,6 +129,11 @@ int devm_qce_dma_request(struct qce_device *qce)
 		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
 				     "Failed to get RX DMA channel\n");
 
+	cfg.direction = DMA_MEM_TO_DEV;
+	ret = dmaengine_slave_config(dma->rxchan, &cfg);
+	if (ret)
+		return ret;
+
 	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
 	if (!dma->result_buf)
 		return -ENOMEM;

-- 
2.47.3


