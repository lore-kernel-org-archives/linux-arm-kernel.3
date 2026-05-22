Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79AECD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 14:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXdt7SVf/FZ6AuLTLKVeyM4jn/YfPr8JdQLw7VC/8Ig=; b=mJR72Kjl9KguqR5IVEFfcYLn2G
	f0Om9pl+5tGAVMuHlXY1XpuivubleT71RRo/cPgLzcMw1KcaP9EUz8YN3qnan/MFHusAZGL3a+2xn
	nIOwkyId6G5+Gvpa4iYyIQY2XZ1/4AI/iruEANxHCfj9fwzvNoZ/Zq0WGgGX0NJZcFp/tjd6uf3vC
	Za0BjvTmvN1ZwbRT6BToukB2yid1yBdxRgzMcnX4b1I6W7hvd2gIIYUz8sWOglEL8Uvc10Wb9uYuA
	YteacEAcgfQHUTXc8sxAtG3fWGz3XwmNqJZzMAjqghbZrL46nVDvYpiRscGdvSpcwmGMColqtaSPJ
	LFymw5Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7L-0000000B0uN-1xc8;
	Fri, 22 May 2026 13:40:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ78-0000000B0k2-3iDr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MCVDx8778711
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fXdt7SVf/FZ6AuLTLKVeyM4jn/YfPr8JdQLw7VC/8Ig=; b=fswkFDvcWcNggqXy
	PqIZBlmngvWd3q/Q0AcKl0BPzXocRb9cU0+6VA/C5dibb6gdgLwHTPCK4z3Te+ij
	nQ0S+yLEK5nMzbPI3469k0Kb0B39ObjlrUicds3fAwLRYDLarGdIMLNLW83HD51j
	V+AQXsylq3DTny8+gR4rFzEbgVxrKEHNP3+N7peHd4aMmhLJt0rxt1vDl7Ft7wQp
	xVL+hWj3pk9GQQx2m5Yta2qhgRHK/sWJkIpNGUrZgeqtncRecB3XVUdRko37g9XX
	FmL1mxwNc7uYXy9p3jgZY6y6Wt42s1L9u3UZjSDMWTCfpX1OLVO2UM4ey3R4Mykp
	dbtmsA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7atxy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:33 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so200480621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457233; x=1780062033; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXdt7SVf/FZ6AuLTLKVeyM4jn/YfPr8JdQLw7VC/8Ig=;
        b=f/si+oVJGEWT9ptItyXT8Y/+kx71ov7dBGT+PbxbvFn4kzPMFFGrEIcFKOx/OVH431
         aeRTGD3G0lQeIsikmCQpu+d8YKo0NSWG+eptWrdVvp0UtVfha/zADHSpUxN7D4gcza0T
         ltot7MQvxP/buA8tjc+0bSGBfpe4RKdmsqnUfilzKXV3ZxvSROWaWdQ97Ql3P1h8+F91
         64nXUAmlyrhM1/G8TOnJYVfE8abR+9j8y6bhQTnZDczqblBPgiNWWqtOVFZKUgagGDzb
         vgByTbax9uOLmJzxE1AkpOiCvmnZq5kDTnRyeZ6wQdFlc/Bvmd6Pb4pU7i8PzzJcR20p
         hYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457233; x=1780062033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXdt7SVf/FZ6AuLTLKVeyM4jn/YfPr8JdQLw7VC/8Ig=;
        b=TT6hrc1F7eMbroHVbQYlxK2OnU5rnqx5dMhRFUw1rtnVFW4AuPAjNFuTthjOtVsp7c
         grtt3ap9neU95bE9UlUQhIHnQFWRKdBiE6kSLxjvOXGiixsrViHy3yZZpzajxZ7pFDbP
         EwZwhsVhWGcuz/rAwes/HfSLRJtxOrR8WpNeHc3VEMPA1l0CJ/chE+bGhHAaqh5AyGhM
         ZYbNN9yOSxocAg4FKmDLMRRxL/6MtB3IvEKZW3lossI4JMthQhUaIm/0buu50rN6tFyP
         VPjTt+ZR3/F6B8BPO4aPBH3aUncOpjwljv+/J6DmUg1D/1BRIL0XhHdZeXP/4JInPUvD
         AQzg==
X-Forwarded-Encrypted: i=1; AFNElJ8k7mqZeNJSQHNWZJITwTG3Dqu5kjEp0+vvntNn+B9RwMLWS376y2IYL3tJyzxACeQ7SNN1yevt8rWJ92x/z2Ty@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3BweavnwUYaUu5asMJyzNHgo9B4n70tQ/a7EwGntT3hw1Z5ei
	NX/L3TAsSrVwxWa1J8t0YN8HPuW/14O+OZh/gOFQLVnuuB2SrMktIJFfqjlWKxWb277gwg3Lx7E
	9PDz1/5avRZir4FFEBqrcEYWL5ll319a2KBUuUL4z7ERmTuvbeKwRfQ0o+lZTEL2Aa06D9zWobE
	yaLA==
X-Gm-Gg: Acq92OHb+KWNzr1ozjXXETRgGvKlpxcW7M+TjOdUzOBiHjTFRuNbtLiYhYZNhCu7i6i
	c1UioszGI0Wb/S4dToMiS7gTMWZHx8yNxTaMfwfJFl12L5fXvg5vsreCuN/NBYHfponlXwXBiKX
	qS+CKHnlf2wZZ0UVyUCKhRmfZSsH/M0BREU3c8aWLsnwL+ce722eaOu4BXn/mQkrBlhHU3QuYhI
	r7DNZU6540/fXhV5MMA2w/EgJM/NIv8tiu4lnO/MUpJ6FSO2YVS6UstmXCv1iZJOgJIQDfn2NDV
	RpbY2gmx/4We9UyZzBrQJLceTl2aYUeGRLMJ1HFmVYcxmcd9Gmroj9XbN/Cf4pczh5O0rbzbpVH
	dASucTJzCy838+pbYkL8OLk98WBmtBUL9ddcUCEvrkyIsihjOlw==
X-Received: by 2002:a05:622a:5984:b0:50e:5819:d7e7 with SMTP id d75a77b69052e-516d43dc0dbmr47748991cf.3.1779457233307;
        Fri, 22 May 2026 06:40:33 -0700 (PDT)
X-Received: by 2002:a05:622a:5984:b0:50e:5819:d7e7 with SMTP id d75a77b69052e-516d43dc0dbmr47748331cf.3.1779457232774;
        Fri, 22 May 2026 06:40:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:31 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:00 +0200
Subject: [PATCH v18 07/14] crypto: qce - Cancel work on device detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-7-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3gGtptRmzqmCc/s80la+iOH6ohsBGrbmA4x74A9e/WQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy5mkKClz2fgik+N1QTc+VutSiwBTRy+E7IJ
 MSlUN86WayJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcuQAKCRAFnS7L/zaE
 wxMwEAC11uWJsM+dHhtr9jLXScbswvOXkSzN4sO+6uRizeQwBY0QOxHsKrAtgQO4ZYJIP9pzLbv
 Yy6li0Stg/PaIitZnP67l5Vlga3V4ElVg3Ih1N4l6p9QlL9Vm1ZrSh/1bqAhlyfURBPCw56FrV5
 x0A9LZXfBn41Xj8jlBjQ52ZiHHAOzd8LpWdXaDevoqUlyzAr5PBaYWSyJGkRhGYGnj9CVCCYVlc
 b0MmGbM1UFWfFknLVZtNpf3k9Q+2aeY3Zz1z35NDLKuVkvORlDJrGR18t8ZN3oDnG1PKyuuFj/7
 HsNotGFhzhgPLQo3f28zpInfBh1ValihEOQoIBO/wd561cbr/etjVUOGuawbUy0gouBh9j2mnxf
 E31qjFRxK1mTEYypb1C1mXRik3P03+9y8kZSF4Ji1x6y3Y9WlO/pxh9lx35D2XSeOHqXpCubh9Q
 nO03kCbiTcDnQDQ3QZVNF5eWsOmed9rlQg1h3Vr1XwCc3SOnOSAv1e4yibbHvLwU1KqHchSDDZ2
 0KRoIdO9L6mAdYoK5ln7hhMznc/rXCbZewKujkiSZ7arbFEz5TfTZc/PE5gTtY5EOE8C55/e88q
 h2d5F24x968paTCS69AUg/XsUcKA7LvcQPVFig/Q1ROKK8JAJeBindm49qV6iJbHNggXXkEuED0
 sw+x0xgVA6rOcXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: EtJWIR8XkYla-p8vTAgeRSgjVXyHn88v
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a105cd1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=ETIHtu0_8y4auhP-DQsA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: EtJWIR8XkYla-p8vTAgeRSgjVXyHn88v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX2OBr40PInASq
 5zFnzPCT90Y0idRRi76vBsPdjWjywdQkJrf7v3PXZUCCRcTPEnkuAY3cxGkEOM+O72oH0zILph6
 8WbG/bwZD2aIn5iIhlJqFuJhpY9Y3gzEZ7XeFpXABpxM75rFWFQqsuJiZ/brhzgpp7T+sbsHpiX
 s5vONEZU6+7SW5KZpTNOjszhD9k7lOYu/Rg5/z32sDLNuBG+YF9qPso/E9JqdxTQ9jS4X6Nh072
 HhHeOdPfRzhuk6E+6k7x34nTQT2yt5howQAKIS46P7WsZ/2Ag6Zh174RzO3yr03m+VG+EQJmQZ/
 nvFECoRSwINDasyisi+A1OcTz7uGlrmZbj3hShLpllPqwzr8DDl776jPUUm8BDRhgSfNjLzh86E
 RbapBPdu83F/9NkzW96xXGeWT+5SyyOwTmZD+ZCuqz8fP9xZKeMSRoKYQmZNGtqXFvbZp1LK6Wv
 QTtvDkrig4vlMKT9JrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064035_049056_47784D31 
X-CRM114-Status: GOOD (  17.60  )
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

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..f671946cf7351cd5f0c319909bafd87e3af701c7 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -186,6 +186,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -227,6 +234,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&qce->done_work, qce_req_done_work);
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	ret = devm_qce_dma_request(qce->dev, &qce->dma);
 	if (ret)
 		return ret;
@@ -239,7 +251,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;

-- 
2.47.3


