Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22D3EB1074
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mX7VZc0C4Y6KtnlB3JQWqwZ8mA0msAHnsmKHvmZNoXc=; b=QgItMLHUO9OGKsoQQxcUPLAolz
	AKgA1kb5M/xzEWx9qETVKtxQvPYV3J20HQfPOcRZPTOOKwCu78GcdSvHwP4YV0BB+VJNFz8wAYMWo
	DG5ttS1jN1QlosKbWhj+fUGVo+pL/Qh/X1nMfFQNcG32lWx8KLtrpubQ9vkUmlZ+PoEkey7qE2RRZ
	lmD6yY+CCozEpzomTRmH0w5onqMqw3pGa4Vlw3eIwKPHsgjhrvVNRDGNKmekS7GUYljVGzhf+SQxS
	gNd8YXwbLJZjT4FHDsWCdyC6LiRT/6V4ZVNwtmbUhZU06wC0TaKN0yx7gJMNZUgmTxkYutqhrt+c4
	dkUhAJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGl-00000009qHG-3emK;
	Tue, 10 Mar 2026 15:45:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGi-00000009qCI-00qC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:45:13 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACanbu2862598
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mX7VZc0C4Y6KtnlB3JQWqwZ8mA0msAHnsmKHvmZNoXc=; b=m3ODAHPJ+mLT+uru
	3AWl4atTBvFth+TCsSNP1pw8J0FNJxmXF+/HqQQr01U2cUwK90w02qHaqfWxpvI5
	O0CTMvkBjZI2/OnR0DvfJ7FtIzDYGGWYHXz/eWz9BjbmkTXD1W6DWDDHzlVAdDi4
	7r4UhhI4sX72Xk4ZGDAZQrNmMxdDBrUYyoTRGedmf2rzAnBqV7TI7nQlxDAcvzQO
	eVdVyi+PF4nOKPxX6ZA3hzsEgdtqdZ3LxgLveXXjdthHb3WSGkBeMqSPXD3wzlp/
	I1dsvfSB8dNmbqxjuE9pNho5H9sLKSt41M7Vi8qgHtwgE8agPc5f8jm6WLdXwmnA
	+jzMPw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3wa2j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509172f1134so116965241cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157510; x=1773762310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mX7VZc0C4Y6KtnlB3JQWqwZ8mA0msAHnsmKHvmZNoXc=;
        b=SwYUtYhHqSh+AJDyKCTWes+j+ZImky4lBM+bS/SQzWmRqQtVZSbsfMcm1dYeR8BAqf
         Yd1pXZaoONEXlwLQ3xW2H08z1MXIU0i1PCKB1pmN5BvV+5RUMyYt4qEYjkIupgg51sLa
         In6XGhkr+3yt2/wUk2JlZ58QhOwDIwi9PxJwwz/g3QdNE7FmPCAywVe6OKCqRJDYx+li
         QauOFOGcOqh3/UjpPW8OcgCz9Xd4gNH2cr/N2mYEYLxHgXPuOFVG3puNOgi/01kTNJ6C
         3xU+0SKa1a8dLCGtj1jpq4zVXKwoNLJgkRYJi0TJXV6F5537J2AYyW4mYfJtZPUZDo4v
         tsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157510; x=1773762310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mX7VZc0C4Y6KtnlB3JQWqwZ8mA0msAHnsmKHvmZNoXc=;
        b=jzjaATm8Gz+z7N17pu+Ns7SVmeplPyKdFqTncZ4v3Xfs5lutqAVydh1OTwsWdmdHDW
         Lpk2Dubn9SycTmJvDCai18cRYSFC8muxxtpkpZgHapGXtTseVRTQy8h49MRnEopn3stX
         7fVJdJXr3eOSZ+5k0nEdNi4meSn8FDs5vfO34RX9nD7dd5euQF26K75GaNlkNYlmHQm0
         9KCxGeHpopousE+layjzU6E7irf2TsMw3+re56CpPIWr2se8lKQ7eFyFRLpx100948x3
         yKWimhkuhfnSWQjE4MoNqouYFnye+dYuccyogvfuU0nEUsK46M6nnNQ7Hl4yD20OS5OQ
         W1Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUS03EyUs0TqEr149NXjnRZpzah1WhHnTugmaQZ3Zg5ye5dGdNdHVzWh9ipTnbotZ4FJlluBtqW1qehhgucWIjb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8s36S73SnuRjrmlUmpSOWt9b3IMJQ7Dd+b5fYRJihN2iNpMdV
	5AXsKCY9Vbtx1hfHF61lTT9wBz84LjNQuTUkoGVsM5YTCxPD76lcTTEFW0g049/Yhjxndj9jwsm
	WxXwKXr++KlfapTMtwHP5zjm029Dutzqv8czwT1g0Od2fKYluD1sk594o4Zbffz1c38M/ZB64Oi
	D2zw==
X-Gm-Gg: ATEYQzyI2MqL2pH/siIgvdQO1oxuu4wMspXhaGQcm0ibZ9welAPBNIkbQLleQF2wgw+
	F9gJrKX8uVNANX92oJJQ+P5pZAZCTgwFhPY0VKSPtvgLboCuXFlLAYaT1E74Tvj/LJqOXuT2P+S
	/dd7txQrU7lrWz0b+s4kZYWw/uayyvV+hIdfglxgJ8R7hrVe8E/1GavDXKIYMXS75A9BAZjWULA
	m4EWMyb8IyOpokIbj0UvOMG48y3EcLWVqxL9wWluF6xb293pmTzCnafgadR2/H9LwWvrHf5bLA1
	6r5z+D3YMbRemwPlYh8p8m/htLcZ/D1cTVWspNEOrB0ICRST+wsKjxwsmzoMhxZHVCYnyumcTT4
	Zq/GazH4GX1lj7wrTZJ7Gt6UGf0REKhRlFdCRAdW+ICL7h9lZDWj/
X-Received: by 2002:a05:620a:459f:b0:8cd:91f5:7a29 with SMTP id af79cd13be357-8cd91f57c94mr600694285a.53.1773157510208;
        Tue, 10 Mar 2026 08:45:10 -0700 (PDT)
X-Received: by 2002:a05:620a:459f:b0:8cd:91f5:7a29 with SMTP id af79cd13be357-8cd91f57c94mr600685585a.53.1773157509620;
        Tue, 10 Mar 2026 08:45:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:45:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:26 +0100
Subject: [PATCH v12 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-12-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
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
 bh=E19Bzt73t1zSAfX2/01ff6pZaiXi+Fsgm2+zGDQ+P+I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxqf7crh0eAak9U6C23Q3P+wGjMPB/1YbCCD
 xeEoYobLaqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8agAKCRAFnS7L/zaE
 w2eVD/9sbXB64zWnj0AaeA4iZQubFXVyULCqF0PkraiQCXOMIT+DW9nQdGdDILB3UKyvDxHrhgK
 4xkO0LIePybUCrJiHWbhi6jBM69iLjN8gGXsLZGSvXJE2h6W9u1CocQditDn3OR/quXy+v6UHVp
 YfMEUO2g3vzgxNaJEN1gH4m1hvWcDKPhS9aWY8gaLmdIF9V8g3AMXrGcpUO7gs97exG9tWhMt25
 OqczZWp7n8hPrNA9ITYVTf4u38DKNzOrha9NIrGQicdyzxV/iQUxJAcPYdnYYf0ImZ2dS4TVq9O
 uIMb5DMp9kr7mls5zZTdzT9/JUyafbKgAPfxs/5R9kf4XXhOWM8KmVPMFWANIRPKaYCFB43dxfo
 k7JTtTXM7KY9VLJi0P9I7lVL2pWxaEKVTEe3cVcWmBAGDJoNab1ZUUWJNjbYidNznEoNkrGYj1S
 ijobV7GkrSBYXj1wZ878807AnKDYsUL2+jSjTMtPRWvjtqle063PcJ0h9VpB3xUxll+2qh9Eymu
 s1Sp9zR7FGu8eIn4We/kpvP8hRK6HUA11O4HLcugh69lLvA4KoAzOseFFZKZEyrirJfyONFbxYj
 K/MEezvk7XR8ym9xZGKEWKIA6JL1rLC7hgWFMVJv+Pb2uOBXkaUVaozTtfwmfGq084TQwkEAzLq
 9iuJO1MQRs7FuCQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX+R+MF30XVO/8
 DMGpo1RWWRWmnyBraGG0E35LwBgXYywMDA5+Yd7OzOxmRoF80MMHfiB2nDfyIyz+MXxhwTK7+Jh
 +68B21IFNAiZjpCJ5IaqMIwJ8mPwsXabpwMXxAtC7kcowwY5/3SlFxw+ZtEVJ9VaHhNXujLd/Cj
 2IRX84YEJWu6c1z+hwYEi99N2ifgSgvGqnZhJ6QE1mVl3ogM2xUZ5/cnLa3Xm579apyk0D/6lUI
 2PNb6oo/bdwPpJtXFfvR1uQtLTlhMh+TibIOuOXk+AaU0AamNzgZkW2L20wxbToyQso/R9nL9FQ
 GWmCYDokccTeMwn33hrEGGEdi/6Ptsxrs4VIVOoQ4gBBWOAg08pCmb/b4ohpqp1fv93zArF/FSS
 ypop+l+6DvQvEEI5JkDCU/q+C07op0xsBryc/L4dLA0bdQeyfajOAz/DWQE6OdZEsDXPYJFmgq7
 J2i7O8gkU5cR6zUCcFA==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69b03c87 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: mrAHGH-5diQOpateGlwzNFE4kfYZSRgI
X-Proofpoint-GUID: mrAHGH-5diQOpateGlwzNFE4kfYZSRgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084512_088525_98DF2931 
X-CRM114-Status: GOOD (  17.39  )
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
index ba7a52fd4c6349d59c075c346f75741defeb6034..6ab352261223c3c4815a01e84238447e8e61e040 100644
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
 
@@ -109,7 +117,9 @@ void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
+	struct dma_slave_config cfg = { };
 	struct device *dev = qce->dev;
+	int ret;
 
 	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
@@ -121,6 +131,11 @@ int devm_qce_dma_request(struct qce_device *qce)
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


