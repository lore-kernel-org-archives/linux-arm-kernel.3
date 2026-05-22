Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F6FCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=sIvQFj6mBKAy7aEKTVC0tdcpsX
	zsWe1TDI+dnVekUcRgKZaqLY7LbRbKHomvaUEXQvJ66HsKA7kd9jOiHzTanYdBFzNQOHrBrKh7GVY
	+fJIPOVhZ3c6SJiQKOLSN+WQbh3DTqddsstJoX18pZJVsWp5tLESeIIZ6dVjE6Xf14mOQBXQnCcrJ
	o/5x7bSDw0Rbpr2cNP6qDydoQ+sN7zAPE+BRncq0E9CaJYw92aIIoYbaIhiOY/v3BQ0gVm2JRLrdg
	CF5b5nz1u8VfpCWugEij+m4ETyjYlQPxdFwSOX8qvG8nKN1OP6aZDg8GR07zsknWlyhHXK7VPLFSc
	NJZPUqhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7l-0000000B1KY-1JCE;
	Fri, 22 May 2026 13:41:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7J-0000000B0sX-2Oys
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA4Ckn3947445
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=; b=L0bLFzQ8eB8qbZY7
	r0FH9KylIh7vCVAzy2P+aRxMGDMF71H2/mgtOVU5GuDJW9ZhHIJci89kGsxQNIGg
	+mCmqghMEoSbOJOK4KwlfqTR54KOdf68H5DayiImhl6nXq/PiywcFTs8ZF4WsElr
	9FLzJWMqMeS1YYY0Kz5myN72PaUQWnhCZLSnLa8lSuFmnVDDTaHo8O3fOTSqd1mF
	IbK7KJSIt/oDIdkcPZ0HAtBdY0z68cZ51AWK4QHQttZ4kBzbA9k4IGw6gAhW/DTY
	b6nOQD5xYE7s5/1vFskf3/uNjKJczu72MRW1vCRmr/Jp7GZOdTWyVi++InfMnIsp
	+B52SQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ngqd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d6cf547bso18134551cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457244; x=1780062044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=Alw0z2+i6Ef3waTlDmfhxLpWpoCY8iobWWg/tC7boSVI0KnyAPsSupsXdD0ve5RfVZ
         k/+ueTTpDi/UW2NcTDO1FOv1P8lXCip6NkgSFz9ylqwrvfqMA6FIRSTsxQ2c+SC5vanA
         LMKPAqZIqMLWyBOn++DNaLdiNRi9oOVHRKL6leG3k79BCVVo/+um6TXg4ToCQsSoFBbe
         OVR4xP0yJYLF8OmfMkvnx6QS7p4LSSg8GavXcEHW/oYG8bHeA7NeabhSYfwpmI76UlDO
         ypMHBzNdUDn3aRnnCnJvnBkHLboJDD8QvyHMfjKjZr2TOpb1DdomwM47Cl8gcZNvu0rr
         ZFGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457244; x=1780062044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FYq1r0spQWHIRnEkazipWdL66tm0s91r38cl3E1vzGg=;
        b=PUZdnxzV2hx9rN7HAdtnJYGc5+mMTMj5gDA2GZild+SWJydVIdRYU9kwtFP63FTaEq
         QpiF48otSy3skCvLx+URtRw/NRRpQpCIzVcWE26MR8cWk4kIe+fjPSmXpX1fkIMnCqEq
         8r+aMLhQ7FT4c/UbWODs1zVt1+9UR/eq/cRVrzOc5ZUvo4MZbjTuLi2loD+MzdNvvaWL
         QPVU0fp6Junx/yyrdWCYG+1IfKknJFLtbVdNDIIYtW2Q72KkiG/J6JfLruj7LRud1+n3
         xuD12Car65E2CzjfSsUsbuxe4E/rBj5RdWGjhLaUI0iABFFMu4pt7hyHJp/VnbuonVWp
         svcw==
X-Forwarded-Encrypted: i=1; AFNElJ8e5Zf2vJQAf6Nutz+e+C8SAMoXyyBukyD5l+Bx/Fq6fBE1hzKBM+rx9fKkjT6EGmIdBF0Bm26YDVDpoFUmMWAO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8eYzFJrtaqw50kMS2otIQoecHm1lxjVkYWljGP4/OGU6pnzdi
	srWcno6yPoGeYOVmaUXU2Tht6tH43fDzDcf5UNA5vXiOcHbxzYL3zQiVUTduiTwOqyz6UnlvEOb
	cRsUO+X9FLWh1oPck+jPTSYr9k/ERy1yVxMSs40C0PtLNYXpdxwCQDMeMjbul2vRJQzBU4joYIN
	y/fQ==
X-Gm-Gg: Acq92OEryJg2qVpancq5TNOgvb85zTKHm2S51C1PW/B22KeOtzlF7MiLtItoTkptPLK
	NB8haxmqAVWdVerrs6HumvTPdSIvWwZHK41aGnnHYKhLt4mL7T3H5nyhONfXC7ujft4NY9xoVUT
	lWbbc895WO1QROt092yKfzjFB37Ry2jv18jCibPhSeBvZS32HLF3zMwqUfNjbvUSAs79wPNLuZ1
	VooenSifW9Hd3XwQmLtWhj6qctQtF3+doEojP7XWoGpAmza46aR+R8C7fuRN1TWyMTEyxvuqmFV
	PyNXzRFn/5qfNjb5JXo6azzWF5cu+g5Si3fXE2iQDCN/sQoXm8PyPudt/foyjc7bv0F7hV8zUXF
	27qIRfI4MrBKF3IRAe//DLHOgZR63mZU2CdJGW60qif40FyO4Aj1cjRTWakrV
X-Received: by 2002:ac8:5a42:0:b0:516:d812:c35e with SMTP id d75a77b69052e-516d812c62dmr29096321cf.21.1779457244085;
        Fri, 22 May 2026 06:40:44 -0700 (PDT)
X-Received: by 2002:ac8:5a42:0:b0:516:d812:c35e with SMTP id d75a77b69052e-516d812c62dmr29095691cf.21.1779457243645;
        Fri, 22 May 2026 06:40:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:05 +0200
Subject: [PATCH v18 12/14] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-12-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlCDdZs7gUpD6zwuSqo1JfGszglD6fOxI/qdoCA4A3w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy9GCej0i1Cd1aztfnZZqtnXG3WAa7q9+ntF
 QHPDWveOlWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcvQAKCRAFnS7L/zaE
 w+TZD/9vRYP2DEf7Qu75DhCLbQDS2mmmkVJ4+R9oiI3lc6AVdk6u3LDUGd9bYd6FWE1rKOHYVMc
 ax67m1Fw6hUcKQoO3SjAcPfR8emrmbcp9KmC6tuB2d4PGFa56saczmhwcm+WIIGCXM54g0mCT0W
 LQcJEChKGrkdWsR/LL2YGRjKkLBZBP7YK/i/p2hVnyr9aFVBUQ0ERj87TB5Boh7IrjmXmYQ7MOU
 OD6V6n3pk5hletbVoErK/FrvbEJhbU5h5Ib4T2PU0J83jfFNqFUmAY85bof5EqMSTOC9OC6USr1
 Q77NhHZvFQblQkJZH7+qGFQALv9Xp4+c1CgBJ3gKChzY0ME7O5GbW/4p55XCJbOc8Box9+W2q94
 uG1XZvJ5/2gYj/qoO7KjWq0vdO5Fb+md13YyaIrQtmaFWMZlaUB1IIEZ/R2A/YNg3zhmyqYChk3
 eceXwNyVKjTDaVbvNWHH7Ie0P6jG9mebIWguUTA7qNEeg0Hf9NuLkxTqnWkDrzz6gRRVqnPXy7J
 rvDPW4QzOSUkhTiBBKRiFAS6HN/4fZn9+MQTyZbRGl/Fl2qwEGfbXthepOXqviVS3wOJKslnf6t
 6cm8E/jw/pnYRuxt17zrXLvsYnoHzdG57xMDlQ+IEtFs+jjtRIc2e578qqvdkewcL4pmVYTUXo9
 R1+t9Owjk2x8BxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a105cdd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PIdG3EWrWxhPtoQtvcGuQonph5xJpLmx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX532Bg/lUlcLU
 WfqH3I/Gc2J4bT9wM7kUWkK7KiG4NWZN107UE9oStCceky5LzsMZrHAXMtQKyh5WgOCEJjPAVYP
 ILIgj2ERfuMsN9YE8hskVPU/6DC8Uf2KEm8Y1RDzTOlZC+C62LJcWy+XLRXYYrAOneODe5y8oHv
 Og0YCKHn/TlD3I0C/YDVcPegGZTWxh4g5B0gL60HOrXSfTZfY/7zfV+GemJBMNZM/44Vk1wMfOo
 XRcU57C+jXQsMWFfxNpkSqB2iQ8QlpN7c5B4h/wkashXsWQewzYcsG8888MImzlnR1NePUnD9Bj
 Xknq9Sjf2gd/tPVE5IhuFoLcdAiEzoA8jvoXcDtpTJFJAHOPjisUMQH6u3VTljceySaJ3aNG/h6
 ZWJBPFoF/5F1VpDwWygN9BoP94DIgH8ZCpEPq77quZ9z300TSpLRMvccQta1LfUjXrC9LJGeZs5
 nZfy+85116R6VCQEeUw==
X-Proofpoint-ORIG-GUID: PIdG3EWrWxhPtoQtvcGuQonph5xJpLmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064045_627940_A41418A6 
X-CRM114-Status: GOOD (  19.33  )
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
index a0e2eadc3afd5f83e46724c8bc3e3690146b86ba..d7b7a3dda464964afe6a6893bb329d5bd5759dcd 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -192,10 +192,19 @@ static void qce_cancel_work(void *data)
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
@@ -205,7 +214,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -255,6 +264,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
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


