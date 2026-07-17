Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F9EC44517
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=s6kPVLLP8IYARUSgzfYzMNW/PZ
	hDzPFyB5kNW+4pm424C+NpMnjqTWUkBsCPX4nN8W/xM0rnoKq7QGgSgVAHMPfmDHVUNY0dApTOvAL
	S6FW7mmjitpaFNBDjglEbcEcE0LEFwloLACv71JbcaxwNjQeC0M4qhfvyh74d+IJNyFDIOcvc54kH
	FxGlxjhOSwBkseqJbGYsbGeFjNWbxFm6xDOXlK5lRMYweJ9N0tmNUl1TWyv1vIgjOX+H48VZDW4HY
	FX6u6ByChh6/B7QiZ5TJji2I2H5tnTcJOKfOyKdVXcVmTOiyMslel/0kuEymwcF1fzprlzq/Mb7jg
	SFfaPn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4e-00000001gJh-312I;
	Fri, 17 Jul 2026 08:37:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4P-00000001g5r-2nq3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cSPG851587
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=ds64FloEI7O1r+6J
	/BBIau1q/5y/P21Htokkrya5+WFQzTV2cRuC25aZERy4kU3dLKfilY39uE+pooYC
	5dYXaYI8woc3KYd7EyMkN7D4zjs/1Q21Ji8YcYiSoOBZtErl5qiW6J+T8c0O8Cb0
	cemfOw6pwtu89xo83btlPyv25O9PbxkTM84KyvZVZIl03SoRnHxMwIt75yq7hQok
	hoDi1EWLi+Da9rYxh2wWFhMyadojmjT3sSNfqmfvFtn1T5qnh+jRI85n2DsV6Bud
	jRXJfcKuw/O60HUehV8VqOwfpq2xp4O9u9Wgi/c6u7JxEp5sUvQLHQOx5I4Jcl6d
	95/Yrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9p8ena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so72707301cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277440; x=1784882240; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=WggcJ8SLIZR/cTxcLxu6hE4vW4xKLnjNu0CmMGhowN/CbiLCd7y3s253WaPPLiZX1z
         Q1/nmSqq0s0EvrJ56TKajWdoCIQsiGpQ/hXaVpIsEN/3No7N9f9Z/JeueC4GA1D7YCXW
         pncL2U7Qu0AM9lqZFrYDoyc0TyshC/z2FjeyFEjGNrYRjxqLKJMplsHXuu93IwiNOj+H
         rZbWUqJWlwl6DmtAucoayaQ/60eQ80VQbFB1b1l/4kEXbcYFWDHEeZgs1cFTaC/EJswT
         juUMk9KsQAgs9PtdZmfLX1rFgTwxgIU3gbXnVaK/Kr80UuK/Ua+eMDnkkc1r0BKU975G
         xX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277440; x=1784882240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=M5SU5BzTosXckSQnpX5LYFCPmJLAXFkZ7odc8r03Y7nr6sWINihoHsIkIvPUbBERRt
         FFuc97np4461zTY91yZpyawaz3kpxcvx44YN08F7S6zhD4IOSwCOAKgCYlkI8kE3eVyx
         jPk9P7bsGaehRjQrrq9Z9bGhsxSev7CUf6VTSEkvy9lC0q9Mke+sDGX6NeB4+FkpOPz9
         GOkunbcvF/8QOws3xnX9Xpkz03IPVvDyDJ4dChlLhkXBSQzkltDswMb7POjcFiNl0ZA6
         mTaHoRdAKHNB8R1tgDSVy+R2erCopUOgWSqoXovKU4r1oyX3Y//R9ELUjPYnjJcRmsTb
         6HAw==
X-Forwarded-Encrypted: i=1; AHgh+RrTgz434U9rk3vg1dtSjqbwqgbXD3z95nWIkm+Qk0CSaFrfCm1m9u40s+WmtrSGEBdQHxxK7kTeqCkZdCBWS9YS@lists.infradead.org
X-Gm-Message-State: AOJu0Ywklu6PNa91yq2EkaS+MEnBLjgNRcRjNPMsX26povhEZpk71YNA
	gIheO1Vj7Nu05A5TLhCfZ5EtfzT2F4dn6wsVDfCg62lJ1IHdCuPuUyVhSs7hSiXuEhnmm6WV3qf
	lgIz4xrHKyrlN+rpyF8/55YRmnBBNjTq0Lf09OWhidBR7hwfmS+CZh6GEJiBKV3y7/YTxZ6Va5Y
	zLSA==
X-Gm-Gg: AfdE7cnL8hyUo7irlICrHrloNsyzhT/9A+pLO9etDZLPz14IghHMW/14wNncbNdHKkN
	M5s3mx9jm9xxZuSUUklX3ZqR4ordRBkrOOZlyYZgse9luPjxHIwADUrmfjn/GhcM+/d77B1eFD6
	A74K05NDNv822EbF/MLnsgnYAMRFch63Y8R2kmtHj09WJxmW0jDQzTh2S6l5rqqEcaeofwzXEh/
	m3sLJJuxpxZ9+XE1WeKZH+g2eE5gXJCGGPQmB7WQgHjv0goxJVl1nb3gjXNqYi98+LjR4VN7FbE
	DLnb0S0qxVdFr1YQQRnftnukf+31XW6A0aHCMzhUyx5zljynFlSgOeZvSPBcMhlXcPdqMnsJbbP
	kzmyYd1I624+DRnT77Jg1f4JbVHeB7A==
X-Received: by 2002:a05:622a:4e8d:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5213c006b72mr10846121cf.11.1784277439978;
        Fri, 17 Jul 2026 01:37:19 -0700 (PDT)
X-Received: by 2002:a05:622a:4e8d:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-5213c006b72mr10845831cf.11.1784277439521;
        Fri, 17 Jul 2026 01:37:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:38 +0200
Subject: [PATCH v22 12/14] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-12-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zV1OR5DiqlcnDzl6TeLEQ0wLAWkLclKWK2ow4Gd4Hb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemfnlDWNKhyFhnG3WGGBPIlfDB2J3nQAiAGz
 irhSXRHqdGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnwAKCRAFnS7L/zaE
 w4/1D/9iXxL0YvvfHiRFEJMhlPOGpWG8EAwuJyh4NbAHwkZAQW71y1g9x+mIyhvlZIzwXh8evkv
 HDKSOX2v0tw2JrtorVHYNVEvoKBgMg1SUz4zBaXigcuCR8/dkE71JD7eVOeg9QbdGk4KCdF2xF4
 xaZcVExvA3G8VcYLISbzU/HZXqN/QhlWTiL1opBQw+XjSO09vlOJy7slGw6qxWt0+h8xT2cY4lr
 vq9e2dST/vX3VBnk4t5MU9/LteNmYHUQ2pNP1oFA0b0pE4cfL1SHoCwpDsIxU4uUWZ4my+4guNv
 r2IONgGTzRUKMD4DYPCGTGb+hCDdbLTdZvFo0P8sr8ZzWq+NoYlxgkTdgcJvY5hxp9mlC4PPqxW
 xhp201+l+j5zDZHY+D8bcP79g3tTNToym+6Y9FFSuPOWebuPZRrifGO8hJK6k1tHIPqQApSOCct
 v72zioDhu1URB/cDeQ2lG8KYVTNy3N1GDpwCYeFAB6uGLeATVk4vo7+R39lBDFKWM14P1cjobpq
 +rkydxlZefCkSHa1njjxA9jYxd7oWmEDyLYwXT3ojPqJCNzxe8+s1Boas517IA7OnKQ5i4WDEeu
 g+hl5R3O1hhkj1CsX7QqoEFPH0wTpTAqnUvvIcZoevNplU/9f6WRglFSK8tUzEuq9u9NWDDtEgD
 N0ktyPmuYTsJUKQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: z7MsUX_vc7CahKt3CA-KXP7XTvnrjR4p
X-Proofpoint-ORIG-GUID: z7MsUX_vc7CahKt3CA-KXP7XTvnrjR4p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX+gpZBe4cUCpt
 UqZrp+86YZfKlQ/+jtjoE3GiF9jCA2C3sxwF6k1wzP4urbqTQMZLrlsaVtCVskSt1QAREKvKsrT
 D0p7LTqOz+zqZzI5APqaWH0dZSgAxPTR7GSIkK4lY7IjeIYB6KBfEmXEKE0x0noti1H2p/gVSUA
 WtpeDsrYasOs+lzTzNEHcprKtjZWCd33Yxfbu4UoDLwVoEXGRzgwktS2kUN0VB7VgS/jSTojVr7
 SteoCt5HTCKuV8Gh7HxpJZx0rBSVW30P2n0mweAgnRhUyZlUFTzD/1Uh0boDfsV2zINv8lWkvFC
 iZbsZJe98xzkQEhPmXJpb395q5jQxad9kp+ZECUyuw1lBpFTbsJiQWYOQ44JVnnreu//+SmMhZ/
 mTaV1XlHhP9TPrntsbuC0/VJkzGuJFyuOTwXv+b7qi1LQMQqqkbyInVIyByYcQEhO/Y2ifHp3L+
 XNUWljb/KOl6Y3FI61A==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a59e9c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX/ys0BMp0z8IS
 g/Wd1TGfP4Qojvziw0ieJyEyY2pOCH3zkvGCtjW5cgjeJ3bGBAuYrpqNDj35HNnNfZijBuJ8FI7
 ROKEbz9bnUPQE2K7ITuD+QhJiMqIRxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013721_864474_94C384CD 
X-CRM114-Status: GOOD (  18.67  )
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

As the first step in converting the driver to using DMA for register
I/O, let's map the crypto memory range.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index aa4a0b17749081f1ad653424bc265ee81e348e15..4031b4516d6519fc5024bbbcc439500a7b3314b2 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -191,10 +191,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
 }
 
+static void qce_crypto_unmap_dma(void *data)
+{
+	struct qce_device *qce = data;
+
+	dma_unmap_resource(qce->dev, qce->base_dma, qce->dma_size,
+			   DMA_BIDIRECTIONAL, 0);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct qce_device *qce;
+	struct resource *res;
 	int ret;
 
 	qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
@@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index f092ce2d3b04a936a37805c20ac5ba78d8fdd2df..a80e12eac6c87e5321cce16c56a4bf5003474ef0 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -27,6 +27,9 @@
  * @dma: pointer to dma data
  * @burst_size: the crypto burst size
  * @pipe_pair_id: which pipe pair id the device using
+ * @base_dma: base DMA address
+ * @base_phys: base physical address
+ * @dma_size: size of memory mapped for DMA
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -43,6 +46,9 @@ struct qce_device {
 	struct qce_dma_data dma;
 	int burst_size;
 	unsigned int pipe_pair_id;
+	dma_addr_t base_dma;
+	phys_addr_t base_phys;
+	size_t dma_size;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);

-- 
2.47.3


