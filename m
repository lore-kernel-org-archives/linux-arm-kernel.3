Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B27D7497D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=SAuOjb552I6WKzOG30vwawb9k6
	cVj6fVvwf9AdNFIlkjanCvZ+KFgbWv7GD44wlJA3Xm+xusGLppTZAa0fTu3P5znr6INbkLPyGZi/S
	mumYYXhDzYwgz9anf2Wc+KBVG9Sq3LoumJbuc1CMUSkTK8ykinJCbntcg6EvYjtWhrgUlq+XN5IXl
	Ge4ZhnmNGJf7Kz6PVnbDuoxAkgJdqB+pyM+o1QcVM83ZqSnp0q1JGNZRcKFq7Go8XvYsmUGQ83PO6
	NJL0wJFNma7PowuYZgFBZv9G7RByT11+yotCunV2uqTvF500xb8vNxqImO2MzVvWglRfu+xN3rxb+
	9Egm0bgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPq-0000000A1dQ-3fjv;
	Fri, 19 Dec 2025 10:08:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPd-0000000A1Nv-1dBh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c3333939222
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=T61wVVoEF547vU/m
	/4wzOx1e+sZFk7oSZAq4Et9N6dQJ3zOtTBbDrpTFNSqb3pvrosLMx5bfbPzER6tc
	cw27Um1x+yOFJA/KD3aE4m1vSqbwOrkuWvbiB24iYAqgkYZxnPF2ANDL582qTs7X
	9GmBkDbxLWd58jyGUFnaHKz9NuV539sDf2Ug3q7o8dHHmVXql3ZfcPWcITajD69B
	pQj26GyYXes4PQjVYE0q7F55MrFkJykSRDJkN/Eb5beacNOQfmDE+SfjcfhOShVq
	7TPbMIrFdVND45Z4dIVWrIKyDoquPCH94tNLsx0EKRcanEw2DcgNgkyuf8B8uoR1
	0gmzfw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c28tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:40 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f35dcb9d4fso51517561cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138920; x=1766743720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=f7n1nNeI3T9L3HIL+6uw0CxM93j/h8/kiaQkpQx4U4Mjyo1PaupQLskSiDN8mZIsYH
         S+JqrMsNH1VWIin/dtZG44k08cGT8/XGHvmaJrjY9bhONrRDeqBZ3BDlsEPGtRi0B/N3
         k4MS4EJ4O/Y2Dp1d9uncG9pUq3130OvRZXV/b8xF93208YSk1HLJq/e1aKFQzE8YsAHT
         noEFKWV/X3EbBYS4tJLv54RDSUnbjSKK9fqI/Yok4lkBn1NM9YZdd/gHrIV8R02znrTi
         FJMSgCEE+n+ZHP1jEyB20akkSBfqGs9nlP1ncqixi2JsJcvJajNhpo9ry7bwYTlVc+QP
         H2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138920; x=1766743720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=usL+KE0OlvI/9xqD7WdTRAcaRVVWD6vJM5daXtf5pIecCisU7unSHvjjvEsVTW/3d5
         FZMHPbeCyhZIOW3G0I+bwOtQRrOrdekkA4ubNY/QFCxIViyEORCgbZO6cM2tuYp1n4y0
         uSkdeLXV05vHuNTOD7piH4i05HPur2SiSDp3eO00JkCqX6gDam/Ac8Iyy/weBKMRZ7XL
         jY3U+zqqUoqK7jyLULAcuZ3I/Mzhh0JIrnVM6/2D6ujeRWQ2lHps9xWHDcJn7CNL62Jh
         VQ530szxNUfRczYvaeoaZ10aqPfPXYfPkaFybGJPguJIWsQhq71m4QmqVWaYDkn5TLjC
         08mw==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/MeFlyBmtUVCILRbFHs5GBYOaBMKAzqbWKPcPPdBM11SsHyhp6JuLRWbthXkOsJvYdXAPcfLPN56jcOBB7t/@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp8yCAIRXWBI6G5hGSk8buY676tWGr7c9WPy5dbFpXIpNPb9oZ
	cu4JwH7mT4GIUzbDxkiDqRMkNboBRwsUf7tFDOBMHl/IJOUPlP5fSHkU7LLQ2TvKyKIn5xtKZRk
	kazA+/cDcuFa9T13kFP9QwFNWhhLbp4rWxwKwIYptPlQLVpsqw16aX2MXEiPhiIPw1WjWboxbv5
	JmZg==
X-Gm-Gg: AY/fxX5+mpx8HM9T07nWA8AvPcPoxHg4CdopJU8K6eP0oYi97FB5FjL29D6cufeWeLX
	4s1r4IfNgxcxLZ2rKMru/jxlx0Wbg4lg2nl4FP82uzjto3/ooaYLdGfBrqmQcJpv/+1kJKMFSbI
	9IFSYYgaA/1KJYr7vj0AcGqkX6vBUDM0gu6WKwbodJoZkFaeFRcpyFPLpxt5wIU2mK93SnFnlmk
	is3ISWF4Pkw5Y6Zd3Ts+IHeClePCIN3RIFPodzkLGh/NFr1DZaTk0Tvq+WxF7p8GDrN94BeqeCb
	JFXuUKayDnoHI954wrA7VnikPIx5VtC4YIpUHLbUf3bE8ZjoWNY6t8/Sv3Xg8Ojl9J1EKm3Fg7m
	QmnUFmHn80er5LRtmZ6sJXjusPCMQC2AKmIHslQ==
X-Received: by 2002:ac8:5d10:0:b0:4ed:64c1:16ec with SMTP id d75a77b69052e-4f4abcd2a4fmr31730081cf.23.1766138919784;
        Fri, 19 Dec 2025 02:08:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8evzCuL8bcIFiYtwnbQ/Fn0Agh9kHBYubQBpio18ThoiXkcAeiVzR8M+80D4wHn1z4oYyWA==
X-Received: by 2002:ac8:5d10:0:b0:4ed:64c1:16ec with SMTP id d75a77b69052e-4f4abcd2a4fmr31729791cf.23.1766138919351;
        Fri, 19 Dec 2025 02:08:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:48 +0100
Subject: [PATCH v10 09/12] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-9-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQV6J8jitsCsTQ5/OCwoTR5WiYjuWzbdVisp
 7XbUnPmV1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFQAKCRAFnS7L/zaE
 w7a6D/9U3orOciDL694kuvhMWVRO2YzSkzD6x/t3Ztw2vC3h4+TiTwQEF+992n9vFsjkpatfTL2
 K/FtjcWUAZ+xr3iLRhMrdRtid2SV0A6gtP5USRTjoyouHgap+p3JGs7OKq+q6l65BjTJg5vzlV6
 06/ZWAnswsVPU518NSdHmcEq1hOKvcOxgowU64ok6ZvjqepcruKfTJT5uPLA48z1IhTs1A/bAE4
 icRNm6iUQ5OmBbFCvJszbQ/w4ijaSd40+i2ag/I5n4G5y3XRNzO4Fu2eZOwVPr87yfDRU6qKcuD
 ZHHOYqm9Jo6Gfl1G0dvM/ZXtP66DqAoNJN7aaaCHtDhApBnNTc7MTquaHp853P0rO+HLDmekALP
 7tj6E/jJnjVzJfEgpZu3G8Vf21O1ph+tjq9hth1EOIDIImmNtF2V0paGsTELJZYff0jAQjffAql
 RisGP/ZPauZRYeo7HW9WEkTVrdmKA1wYjzJENcYdFTAuPLyIl9WmJIWDJIeCHCEkGfZRBIoEc8d
 S14UzHCwiw3YOAtj4sEvhRtxFcNPBmSQM0L7Vg8s0sEzHddoOG6LmXM69RgZYLURpQkbiDZlIcj
 KrCWJ4gYv0nrXbJHVBD6+kbZfYUXY5hBQQt3UOGbV/oU3iA/aJgykcsI+TQm7saK2Ce9cpHPnBG
 YPGM3dadzHnJmCA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: cVLKauB-I93NywI5kPJZCND5ooqtzfol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX34lTjpr1NaVj
 4gK3FGFls4lv1ttgyl1CrNTOLNHedto62dDiGQJivQmWoMkGTPLJCaRaWYM/KacHDqeGMpfm2En
 P67Wwi2bBCyUIDcWyaVdNGfp3jhaIhS+inlPM8dSCU/+CLqhcQqykhKJoFmhxEMePlx/2Gg96pG
 YJyW89V4yW3fuQkYLT+OywfGrzz/IFn/q8DrWRaxcvqGxgvtNnvENPJsg1uNe304y9di7qbtnMj
 wvxY2pko1eN6oXdm1xneYXfw4azPoFy9yoKh5RlLgv3XeR7qIJCvmH+fRcVvRJDyfEF7Gz6AvNS
 Sidvlo1tJLW5egU9Cn0rFw5ayzJzcwLJ5usQvi28FEc8ZrgO9hXcOgtMLgUJHTQFIE8Lh3s6Giq
 ay/fb+YM335oCLd1LBJ5sakgqeNKlnBCv8vEekLRznZzfzwGhBiEg3y1m485SpNIq6I5DLBTnA+
 mQccD/qgDuMlf86HJdQ==
X-Authority-Analysis: v=2.4 cv=feSgCkQF c=1 sm=1 tr=0 ts=69452428 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cVLKauB-I93NywI5kPJZCND5ooqtzfol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020841_451008_80B75409 
X-CRM114-Status: GOOD (  19.82  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 25 +++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b7bcd0c420c45caf8b29e5455e0f384fd5c5616..2667fcd67fee826a44080da8f88a3e2abbb9b2cf 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,10 +185,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
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
@@ -198,7 +207,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -244,7 +253,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
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


