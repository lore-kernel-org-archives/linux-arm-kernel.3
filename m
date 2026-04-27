Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865CBFF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=kTD+kLIwUwW5SuyLXuaT2cPI6H
	K040tJ1YppOn44UEouv0KYOc8GCerUa6l+ZPxCeM74MzkcxKo+e4+NgiVpRv507G5mllyNX+dsm7d
	pMl7Z+lIU4cCYTveDHDShwaVwl0X9UFTizPrFNKwxNBS9aaXwqOuI9MZ/BeadsnFVH+3VbAA5tmIR
	q8Eyb9FLNeRbSffkHnD0xIiB17yBOIx7Do9Ad4HZ7Yg1Yi5OgVCM6BVCDu0OJeWhB/DV4VGbHfQTd
	ySitAj+4VQ8BhS578ztAKF4ZV0VIb4jEqHfYzqtk6ua4oNg/7BU0zo7PEcITfoB0BJThw6hdE83Jh
	xOQYXt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4p-0000000GYss-2Ame;
	Mon, 27 Apr 2026 09:16:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4k-0000000GYnY-3ZN3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBSm665666
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=J6KyCAOigrI6JMUi
	2FW4hWpKgMMtLx9sgxLJcU5fVxhKef1+SUGmBMu9Tmi0+bQm4xuScshXl00PzhWd
	G4ESrI5uCxyqk0kPsk/Zpqa+LaOexx8aEyQsxkkQCPSZHOHEfrXuiJ/KUN4DflHr
	L9yFLAgjb1OcS2LDWWI4A/91DZaW0sgjTmsjj/XDOb43r+KvpduM40lOvr7teci+
	o5m3UH5i0gGj9tw5cBR0Nk3qnflfKFix35Fr/hVxEc4I9EIB5IhdnaeX9xVCh2r+
	2RjfSPFzwiOlnOsHDOihnL+eVYot6KnJX/gHb7NyYBE+2MpcYzypDjap2bohXyN6
	xJ7JQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0kx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fcdd579e1so73117371cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281381; x=1777886181; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=a1saL4GmQ5j9zoWdV9fu36vZeeTrhzKOrHNhSb6kaz0750GFpTZ6nUq7vXtTsFYSO9
         QR95gP8f/VDqdnmwbB5Z2UUctkUdmVLFURY5FrGC/4UOl8KFT8nsUb8hshylpczYeE0Z
         FARGShmUnV0vme2DEQ3HBRsSILq2Enbx4JwoSxIcr2YUhfWDmrltApiDjmwtKHw4goDF
         tCfAGbke+HQ3USNM0fxk+mQJvB87rk9eWaYShTSPO7s71oGwsmFAsRALG8dK7uYYOzo9
         +F4XrXhX/dxtvCqKISZoJ4uhoc+hJ1W/mvPqryVaQTb3ZiMRfZjdL+noLVQWKfjDrEKf
         0lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281381; x=1777886181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=p3H2iT8ma4Y8pCc9gB/YnKcSX8fr+1o/p4sDPCFBgpvuokzHlwbOQ+5AhHVmAQRAqW
         fuztO51y/TUQvckb0NIZ92KPUSwEBBKqBeoCQfd5Xa/lKu8NUXxgTMbhZX32lwwg7qCE
         flLO7nFj6TBKHh68ow5k33yu3mljPY10JB/3uK50fX7DTE8VaLx5NL0jNy/DsYLEORKY
         y2PyyCwgA2yxhw4M0jl3QXPFceV8KHfmFsXu+u7mYxudbou1UI/9JNXIWGV2/Ya/Okd8
         wEDIgrsA3odKjiHp1nDJy3K59JUEwKngbaW5ioaYSDEynaMUGrOt/4gFuBAtEOrEWRfI
         l4LQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fPje0fIrYbht4bqLfdVP8d1nJ0aY1Cj2L2qBUbT0GBJ9PBbzPaVVh73H/Tre50Ap5YeBMZdrTRL8h7p3xefJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YxrfS6DXjc5W6OPkQafZjsMuZBMixfQlUfjoJ3AxcrqsjG7UhJQ
	tbkVjHebudMZJY96Q94uyaz9TmRiOgVWxI0KOKaPNj9JzMZetB77v7qLoY2eas1oiRcjbwU1z8Q
	4qaaLB3vlqkR4B0E6ph/nwgm045ASqVg8mQDob2IjJXGimJR6d5tF9Ox0C09wCjKdTxGoLgk2w9
	n3zg==
X-Gm-Gg: AeBDievH9HJEJwt0a7VhcxJaeaqQq0rrwEYH1guOeF7AM1ZKi2smOA3UZd3iwQFrKWp
	5rYJmNnjTQ6b1IcbnrZEccxbhJ3rBP4gb9Uq+9IrJyPZl0/G4GbL/0vzZ9zHcg1ge57/YghgY9S
	UfIXicx3z/wYogNrJNx6QQo/sbHO6JY/FhXx1Fp2hidHL39T2gGzxqcwgt48UFMwJZ3y/4n6DI/
	8w1L8KlK8WFc8ZEda9cAAk0t2KR/XiADXJvTsPMj1HjLaB/5p0J3/rSZMIG7YZ57/ITKROUpaBv
	nH7dEacGLxfiu/G+xSVFuRJMXD7WPjFemECaL7bJCCAkIlCcmBn5NL6AeHyQdTaJx25uJlF6Iwg
	F1arrNTIf3UaW6LKLUUvK+3K2XOqtF1UF3OXGR7dUBWArvOMTF7FJ5vWsJtRxRA==
X-Received: by 2002:a05:622a:5149:b0:50f:ae44:515b with SMTP id d75a77b69052e-50fae4453cdmr438255591cf.37.1777281380990;
        Mon, 27 Apr 2026 02:16:20 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:50f:ae44:515b with SMTP id d75a77b69052e-50fae4453cdmr438255401cf.37.1777281380602;
        Mon, 27 Apr 2026 02:16:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:43 +0200
Subject: [PATCH v16 10/12] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-10-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylGmClCRw3//AfCjDOHernDiXEiNO3iuUlCp
 gZtKgrriaqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pRgAKCRAFnS7L/zaE
 wwtREACcEpKAs4f12xlr9d432+UiRM2mqQ0WBb2tqTkHrB92fG3R6QIfX/0r0TAp4o2j3KzY4LH
 i7C9hOGNmxiatWeBsAqptPxi7GQzaDrSfwSJMkQvcnBF9LhCSKIv+8NGfVlwKhat+QzjZkANPK7
 rPv8TeukHNlUuFYifbu7zryjeH1ksha4ZQ9k+BtMHbGgZm3GsWdCaoaXQked3UoY3qewm8nzWfw
 4tBicyc/b9QrNvOSyIhYWl7taI5r8JiWfnrxH28tcs0uCT+8paNvfNcjaHflLqlnKMeTdy2DNqq
 OkniN/g7MRsVxtajBfV+xsgrE3kfd4kxLLZMT2v/ec1XQd8WToXxLgNYQrmSr+fxzgclxL8gCSw
 zlPpakDKsBf0+VbSgDrMdHJs8uR/etgu2gN2WstJ7SnukbBElTYmqZ3s17ARRLL2cfoJy1z8nmY
 bJPPm1GwkeMoNd2AoLA6Le7OoK8FTq9zcwpoBBrZrYvn+TRTpKGd9JoYliEMEjKiOV9UItpEQfq
 YpZCupTT0ymSqFzi4KCE+93mXXWMQn+/5ArMejrPT30QJ60pxe9h5Xc666ZiyJ25zDt3rGQDY5s
 EWFvFFDQPiGyT5VrQr8j55uFwShKCq2GHoRqPbipjOeaGxenIkhID7vjO1YwkrzuHDRflyEsQrD
 oAp75Xv2eG7HPcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX0UYyclRh0QYz
 Jgl4EHHz7hVJjBX6a08J2lNBF+p8h6wNtA2U7r6uw7CZ4fLA5nkhl4axHwXCCk7O4F3wRKWSbSW
 hWEnSzlMeH3ElBgVXDCNBDVtNoskTNbuMU1nXltxE2AbXSyy9Ztny9VIEJbfL8GgWfWei/JK1qm
 cfZY8UZ/U1Ve+JzUWDePF881eCvi3zzaqboVs/XwAP2sRzwheb8wQvYg9w999okZ1GqTbLeAdyI
 VCadIBF+lo7Rx8cTlKJzAAd0T6ULCeQQ/jMfUkgRUdx+60FpCrs/HaUOfuKuu5nITZho8J9wtJQ
 mXS5Va2aghG+YNelpnnxArhZ64a/bUYGd12D3sHczwUQM1qMIgfDaoqvWK/qL0nCebyq7GV4PRR
 3TmWYMhPDVlnLApEQ6mCi+bVtDgmJzcMHT2t9+DusknhYgGynw/AEycqNcONX0ac6MPqk0fexX8
 mL5w3PxlZc4Vltvikhw==
X-Proofpoint-GUID: qSUaInUIxaJPcUXQnBHDPJG56qqCTeqj
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef2966 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qSUaInUIxaJPcUXQnBHDPJG56qqCTeqj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021622_916152_D795CC03 
X-CRM114-Status: GOOD (  20.50  )
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


