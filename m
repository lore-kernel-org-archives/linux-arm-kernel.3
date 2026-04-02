Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A903CC6B02
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=14WptSDKUVAN/BkIij6sSaiKCN
	RIGz7S+ggEstVmptrBJiM/116poPvMfipnOIOTwG+fwVzcoPYe1Tvy0T54ALNrM9/fS3C37vjFbZG
	Z5N2scerY/1HWH8aivIRxk3JBU3rPSrl+QkKyowY77gaGuc/A2Vv4E6zQuGUvgpRNXqdHl8bhy1Yn
	fUiNIXtKlta66oIOM7nqbklCGtpk/HErFxm7NcTFd8jCtPKzncqSO3Zfuoam3MO32QYLXmrktc4s0
	+1CX7L2PyYkkZ9h6Tedjmm5kqhfZ5Be0lnqVy3HWnU9ua2uG/KUAglsYpT5zZSzUEIOUaoqJxOHr0
	DMO5iPtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSy-00000000O7T-2Lx7;
	Thu, 02 Apr 2026 14:56:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSs-00000000O0C-1qca
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632D30BP2798832
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=F2b5mPE6MOju8Oyg
	ucejf9qJ95Sn6iowkA9IjZroJMROxZyDVVUqfVJWVWCD/0MfDpxLxwYPU5lZ5r31
	tNdB97i7BHyPTo88WsQU+QCyG+HAM5iWgT/hwMOKFxS61o1C6LPn58ch5Da39EPd
	k3kK/q4V1kFDA3bAh/2UvuWTn4Ke0PiRdDj6oMziXDlMWnZrmiHFPD5XO7AgD1tj
	KKyPpflwehWHWwpYWid6cq1TMzRkLcLWXKnAK3fzdzc1yk9uFN1Tu260+pbrD9BP
	GHeyzv7k7VF37OtfYMmeIWXzVcJsDSM0yPvewsc5x8n9Ywmm3h8RAO4oA7VgFHWt
	hWC1hw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96hk4ptr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4987c698so5088481cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141769; x=1775746569; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=FT7gu4PATSg0sv9Ng7PuQKIMQODmxvt9VIhM0m0x767C9Wkk/y/26wSKbc0t4rub7n
         THx4n3fp7YTAYg7soUcoTWm9gHBidBcUwx+5oaqxJy0jIrQ4RPb3+pCjSKc79LhXEfkn
         uc07m0wJwj5lzDOqzXRoSoov3j21N6Ak6f32NP7sIxrigu80v33yMdt1G71SRAsRxgGI
         r76U5Cbs0E7f/gJJWPOGiydT5WZk44hV3oXb0jwVXH/PKxBWwyzfNVmerLIqZXL3qa38
         lZqMiqDr+0oM89bxaC2P/ZZnIdpoZsQxyv9zxa1qJDRIq/q5KyflaCiRPtYkNaLyIXk5
         h+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141769; x=1775746569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=Mu9hrtYwdBhijaSXssJMjiS1deXYhYqOPpmPCFU2wkTqOCgWHeW4yC3+D/yRxduS7p
         YTkgl9Hi6Jw8d+yYSHUBZTF44A4HFnTgKteIVcinUp0KcvUBcbtG6h/4oX81CUAI4cJ2
         +2114XlOhW74KVYEYNaz2INgLR6Q1lzrGknE4mQzjtTm8cxWuSPErWp0jnK/eX0JuWuj
         6fA0e2Ova8MB/KIfiDMqhHrAVBeYcV/unb8asYAH/ZqpHGAYiZvtESxFElXSAyje+x5U
         G7jkVW2JKsXrk1t9b+FLb4HnVemvL+Et/ovGDgzvdeAFnYMQN+w16lDk1NyDf5/XRPQ1
         4lqg==
X-Forwarded-Encrypted: i=1; AJvYcCVmlpmNO5CbAISOmJGBKkMV5ZMJ82y7DGPCk/PLPLFx8Gqg2/ShHR2eEIsLC34UUcH3ZxuOzjhJH85h5v+ph/Py@lists.infradead.org
X-Gm-Message-State: AOJu0YwZVBP6WW3HRylSdUUBSZXQNJReF+Evs/6cT1o/Bi4j3rNnX81u
	+LDM5eXSexIB9CkAwEhn3B0eyDKu7he2iRmESSZqBk4LVmJmv+3Lt8vAH9+xCxGGd9WhglckFgW
	TLG0oVWH+ILVj7UXSEr7YzK/Ayfza5MkyoPQAfQyvOl/VMW4COMejHAqX3GNDK1+mrWOmQWRlW7
	6hhQ==
X-Gm-Gg: ATEYQzy15zI5IR3PjOpLNbio8OXqpkTRbVkYB47LRa/t9tATJcW3RwBaT01iX/z/l1h
	jwrHcZHKEaXYoIdbO8IRMo3n0qaJhxm2nIgSAtXyHmo+SPLq5ltefSCrBWfmkDU3iYLAw0ek7b8
	lO1yIEBms3gkMZGz94ekqdkL7HfmANtBvjyxaVbxDZo9ryLamYjt5Xw86K8VhAOkNU0gvmAlj9W
	9lx2WGwFReRM8z4ZhCT7yNEdUH//64Nf5si54s5JlXIdBVkfkoMRR90I88STfYw+MSwUQw6eccz
	A/l7QNAfhuy6Nve9w9FSNHH3GSJe6XwTNV2Rscb01bmoZmFbvMwWn5NLhlf4Azx0aJ/uW+QoITF
	OCtYNf+S0sAYVpPD2Kr7oERRj49igPhrI+5yyiq1QueCheGZg4jQ0
X-Received: by 2002:a05:622a:9010:b0:50b:88ee:2a9b with SMTP id d75a77b69052e-50d4fa3611cmr29715001cf.8.1775141768723;
        Thu, 02 Apr 2026 07:56:08 -0700 (PDT)
X-Received: by 2002:a05:622a:9010:b0:50b:88ee:2a9b with SMTP id d75a77b69052e-50d4fa3611cmr29714591cf.8.1775141768162;
        Thu, 02 Apr 2026 07:56:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:56:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:20 +0200
Subject: [PATCH v15 09/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-9-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNzeuggNn5BCNecoJCLrUyCjkRPdUQVVkp+w
 mFiIH4xYmWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DcwAKCRAFnS7L/zaE
 w0XhD/9ZCEKhdsA5TR+k++pP7kqMzhvGODEdwO1q5oZmaA1dMdmuEdfcYRhRjuRPXldSrajs8yw
 D5+EgI6MEdmLjLUT+Tji/dBPYrWLmNXFLQ9odMFTUEU8OGO4UxdX/WbKzwQXJFEV4K8Zw+6S+bu
 TgWOMtd6DVjNr4r+ELCqXIUr07rYI0sehCueUohwgkqUo+qNIf6N7v8beK/2xRtdhqfaudcXQ8S
 FbBnHZhyWpCNg6ED2xtAeZNHPwZbEj0Uu+BBTCQZqLmGy/keNmrJv8g4QaS452Is+hOcdFGwhWR
 BLZzae8ApdncQPoRSOVfoGtZQpodazl5E1WYplRe881BebahXfFO8vuD6Wcqyr3jf9HwnwRll9a
 XipnTViJZBLur2Ii2gw770lrAIis33gYUww4HAc5oOmnNrP/lLBcPF505vA1YrbjRnK/oRf3YCG
 BWCa6OorgOGpRdRPa9vyi9wEIx8z7ngbF9JBVPLtpINnSXEaatZFk2qng17Cx4cYlU0TpLOTAh+
 3QaneSn05WqQWzq/bnuGUbnG5klFLjR3DP3lGvzboalllN7rEnwvZ2RjPQzyEp4Ncu/qYIDtcxn
 SRP+vLHbnGpB7jOruI70NfQ8Fi4N5bYDm+tnpRZ/21fXa1UsrPD5333rNp68E7iWtsXpQ8jrqOg
 H+qXuRJM+RwCTUw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX0D2HbXJlAeyh
 uAsNyLfUKEuYnLrxGMWs9jcFFWEo7TXnyE/IQ5N8jj+MdQ5XDIOjjcWbSWTDFOtamLO5wV+uxdM
 4RfmVbzq16l6IS8KlG0gGGisMqL3nktC85ekiRjuDFMutqP/pqzsYaHHOGMOko8mqRrxrNFst9P
 Po8zT9dgjsjoKktpvFkL0xL5QwtrMHgVXaeWfNfYTWzpeNDdEAWhkJnimqCJ4NxN490KO7R9caB
 BwS9OzJBASJMzi7LUyo2f0rG5oQQ27/E0dtdtj3Dhm3E9hkvKVd/PaYgSRbOe6+jb1mW1n8Gw//
 f8229PbayATxpoCHFhoA4GgEzpJos5raxGkLJu5ofCpkai4XvOelQMpH4LrNc9WQo1P0SRoNA9h
 4MRqhSnCnLRfbJC9u575Thv5t/c10wDNXKEktyHUjLAAogCFz57bcqV4kieA63zyoxmIZHhBVqd
 QpSMLZs8gkcbbTmnNVA==
X-Proofpoint-GUID: XLqwvIcoLcYKsQzN8rETIpK3iS0KmNlo
X-Proofpoint-ORIG-GUID: XLqwvIcoLcYKsQzN8rETIpK3iS0KmNlo
X-Authority-Analysis: v=2.4 cv=e9ULiKp/ c=1 sm=1 tr=0 ts=69ce8389 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_075612_497468_0F90B899 
X-CRM114-Status: GOOD (  14.77  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


