Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDB4D58B00
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=; b=eRNxp3oDURtxRAEkutl6+9+NSH
	JXLVt/usgXGV+BvcMUELxb3zc5zYVk29nXJSzP0CgVzR5vlGTkScKyDPFNuvxFTrnH1kzEI9N1G9r
	+Anm81OgpH/9C3eVfrCpvpzbMMb40DtWVt5k0QvTnHLNAa0VMVZiRI6bb78WtiUxwfVxVgoTiNPP/
	gCnsxx+lCHv1t5pTmK2SvLnrS8FbxE0y0HYlPQAcK+3dA5HieG3dQvvgXFQN0btz7FZGZkJNqhKbE
	/MQv5TR8MQ5YYxPODUnkNcFL2etC6b3w6ci0MB8nrYokh+S+KwN+gGQxP29mVbvcdBh9ixyerTO8p
	j222YR8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2l-0000000H0U2-0WXm;
	Mon, 23 Mar 2026 15:18:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2b-0000000H0MH-1obj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:18:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGUTi274101
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=; b=O8rk/zpXpgJ6xfFB
	gKetOgIHP2LnO3VSBUuiW+IwSQK2TF3wiJ38ea9sLr4KyDr6AiLzDfmdMDASS4fN
	rcbef5GSJ9EJpTQhTltG0GgV92y9nHXxhS/NIvzrlcDze15JiLEa2+QnP8acKidg
	wH2uMuDrdCbjmhThpp2SYzI6mrT/tQVZ8SXQYOdUKRrBwiKxPbakwMWKXnFiG2zU
	EJ49vFFUcnF0dI/NoJf7EtI4Wsd9sdjn/pNSGreHQp6GyYx7gZ1ojoR5I4gXQqf+
	Y5qtiseXTgjAM8x01WSGCz8joxgejGsi8LUUgNXaRIQwbsueC70EO8BJh3Sb2/QB
	GF/aGg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jghmbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:18:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffc6cb5980so1594190137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279084; x=1774883884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=;
        b=Uj5xMYjNUiofAthuWFrrL6oRDd/ICeDAYcBa3AHDASD7VbrHs8xA6c3s8LUDUQBUKO
         +m9l4jy04nA7ARNq8CFsyjcnOIORwi1Y+ATnntHgyXMPwzkkjBNA5Z37A3xgYrqUsQlb
         jaunQcUOyC71yvnMqAZM3P/dPvFzmDvoU4tohgbRJqx61ueNm2Mf9CEoE+QoUsKerr3f
         l859uxrVM41wn1rvqkOnUdL52PO/nEW6syl4XS0CW6mD59lWaJcWmLsxjX8S7rMWwvLn
         4/JsHqX9HnzG3qL0ueicyhR6NNj1vmpfwBQUD1n0S1rcMkltwUkma0C/piKNzk4XlAH8
         00hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279084; x=1774883884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nLZDYW56A6RoHAFTzDl5i+KhZW9amsZPLqs+n6djD5w=;
        b=dBdxzRLtqZN/xAran/XbLFkT32rOXIRXXWmp/gAS78pHxgveXAHnwagGNyqPLifnro
         EJZD1Xb1uDsGLOjUbG1JG3shF8bhk50mhxUq/7H+dvtPeFT0GNTldD923rpjhLEhbknr
         gXXRR8fa00l2k4naYnVTSX0mHOvPSAHR+FqOu5ObqFy0DqHi4ub5v0nd+9OTEew1ir7T
         0LSQ1eWAl6PYsDVzROTqmydooYGtbM6cIEzGByQPRu7flNiKOHWhBlMrhOXTE1EP5r/r
         N+4R8137foHRw6aFbTnTj/sFILGN9qJSdd5PdTfxbAVx2hE5iR5ocTHo64r15t9DdrgI
         5K7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiweM3iFgBYzCUf8DOQlG17UuyHCXUU9DNZXuyN4TbxSPgGeMTR99REODcfo5vP15rxI1y/WdTKWMy/ZD59Hfu@lists.infradead.org
X-Gm-Message-State: AOJu0YwSuhSQb2PEXnpa1Tfwkcqzc3v3KLfqdOO0WdXFae/AFrafuWQC
	RWpNhUhz/FyITf4f/BxJvhANfkVvcJ9Sn4wNBfGhumhOtM55VKzhobDAPSJWQoNngi7Z/tGrj9S
	FWQzvIK9gXxt+hDpdQycHdIhGsK5qG3WcXiyfbyGvjtHcj6UBPowudeoKX2014drTqggA+S1yEz
	7ilt51MkWJXA==
X-Gm-Gg: ATEYQzyoMhVFrXqPr4wLclqU7Kr6MDu5bfJsWnH//pRP/KcYrY18gcNWw/zTOtrIu0l
	+Ovqsil3bS/m8OXNrkzFbvYADaBVFkPeG/RVqyo9sfkQZILvTbo7gEoAJDg+qA+1cnEAZ14/0Mb
	Nf/KoVEl2plEwqrjVcPM4BSMLy/GxconnUdqxcziDAh7N9Ala4ZeGmjWtHyzOHkw2aLecRYIkW4
	DOWBi88dZ3w09IJG6s89fvwl8qX3idYtdpx8+STLiRgjsmA8V93LYCAaUf7DpZmeDxqbhU7Asru
	7GXcBlymd2tw+WXxUXCUWMXu2VD/6YtrXS29vMKIv3Nv+UsveC9/JQ0eW+oeFDm2jkR5gEu6eZf
	4x9VUpthwwnhbwqUNANq3elPS3Uw80zTzy3qG+E/LFB1zx0KNF06h
X-Received: by 2002:a05:6102:6b01:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-602aed07a8amr5468747137.25.1774279083657;
        Mon, 23 Mar 2026 08:18:03 -0700 (PDT)
X-Received: by 2002:a05:6102:6b01:b0:5ff:c5c8:2734 with SMTP id ada2fe7eead31-602aed07a8amr5468725137.25.1774279083158;
        Mon, 23 Mar 2026 08:18:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:18:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:18 +0100
Subject: [PATCH v14 12/12] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-12-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVmEIhNA+qGksy0E2v+Dt0LShbj1QNg2y86R/
 vOoNZth0qmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZhAAKCRAFnS7L/zaE
 w7xkD/4xdbKrTGB7J4C8rkvde0/WRQFmeaByk8e35IH820cDb1zFim4oxGxug62Gt2ElgCJN5kS
 xZsQ7ey3+VFbU4w0uFyovx3bxhax55cV+yr03pDTh/fDokqAO6KyXyi3Vf/L7Oe5fQdAWFgJPrj
 FD+IJyvZzax/03Jj7CirAcBwAOfYwGQ7ra8b3A850SWX48wah2ncH3S/Gz7e5F9bpWqZjmRY6ww
 Zp7PfY2+oQwGMnq8rv+0m+E6vi5iTj9817XI1T4IQpQYE/iUkzITIhmVljlZyHPphm1pEWwZNmQ
 lMf4In+3V93D+/vu0TR4JKX+KMF4/5wjzMYybAGOY3I5klpEUhCBpIJHXIe2RIrpqpGAZJY4vul
 8uloju7us6uY225sKDTpnQQ1DpapFkm/Ir5clmslKrvnt/b20h6oYP8c9uh8yBVmLFTIlgEahoj
 73yRozw3wSjjF9frUEmQ+DFMviySFyLX60GLmhOPkQ9CximM3mRm3sK9+9kmFdL9pBhFXyFxT3d
 roMQoIzCZSKLSfuC9UkgNOK/ryTAOB647Lx0+DxpobTUmKNcp2YoiuE7mSwNxFQbxU9m5IBBC/c
 SWYx5SAwoU/9cD3mTbVbeI/fK5RF0oCDwVq1tVTgDI9yQqMSmDoLC3Kg5HCAHVCgQhhK6C0z2Fd
 wEAVl10ejvTe/+A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: wmd1n1aXwcdQGVSP1gBfvT3glgIwicx4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX4Y+pyjpmfF7+
 WVc71hGGan5LuMqNFpZtZzDMbxxGcY802Anzhrm84UnS5k99i1DPKPUP0HUR3xUoAcYA7J6UkvK
 /leZby1vdGEittjzr3rZZTFa1u8tP8EL6VtVXv3INrBnwdqp16Yda/vv2c25GZYpI7GkkKv6dCm
 4K1iEFAjd5mrrG/nPuySu6KTDgIas7NS2kYxItQ9i/bbD9/k6RrvwbSxDdarJ/lKRemAXkT1/pq
 O+M3TT1BQQwN7tjy2TBJci5JYD9nj69xkv1QRWunjUAphrDZVfrj29ukRAIEekDkNlmYP9ZzspN
 zEKxi13O7/7sM843EgzEy8yjXpE96hq8lgIgpU76NKbhb9a+NvrQryK/SSJamLcFor5zxUd5RsU
 pYhZmopqmP1uC1RMXW25IvXbkpViVM287Qnq8ptT+cFbEFsZw0/GsOd+sCBIAcoyTRIqbutceAx
 XV8ZU5JcRlyt42arPPw==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c159ad cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6g4OycmRf1yXlxMorl0A:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: wmd1n1aXwcdQGVSP1gBfvT3glgIwicx4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081806_598083_BCD5699B 
X-CRM114-Status: GOOD (  16.96  )
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


