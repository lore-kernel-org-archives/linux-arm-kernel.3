Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7698DCD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moLln03VVvMKZIRmek9qRzT0EwTuwdZZIig7cvQ2zRU=; b=jvcHFRdrsP5sFYnuow9+y5fF00
	qcJ5I3eS4ELop4pYAv3cnKHTHAn+3/nLueprQmZkhCY7DfUPwQSGgIlXJQZ7kfLBbsxXzNzrTKvjS
	Q+rB/bzg/TTrujO7Be96uHd/Rrutr8zEgBzaxFgK2ubtNm2utmBrX1LysuaorjadMgxi7zUP4zzJY
	5E2uxStNi07/drGbG1fENFFV7qzJtN6Shy8y0+Zby/ckeqxcer1Cp8tVDApJz1f5Y4INSOk4OUpll
	8ZtV3AqoD3qY28LKDqUHR+VX93JyAjwHF/dMMDDAfmWGyLH8HQMCZ8LcSGHYpLbobnvK96TJr8ECn
	FkU2BhuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLC-00000001cLL-0jD8;
	Tue, 19 May 2026 13:18:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKL8-00000001cGa-1Y12
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J7OOfS2975778
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	moLln03VVvMKZIRmek9qRzT0EwTuwdZZIig7cvQ2zRU=; b=BjcZyfX9OW56lcFk
	qr3AoW5Sg2qj/bTx6Y7WBYJZTEKZ0S+l0XrnmIx0ry5I40GhxLQ64vIB/Scl1xtX
	TZqody7SAcqVe4iMnoN8xAiER2jb1TA715Sj3kGiEd9unBZ4qj+Gf3Vwwi96oFwS
	S98k3GKmxxgbNRQV1LhF2nOZFo2y6UcTcv4JwBMVQXnNvFuvD+FRJBg7GnVyDbTf
	Juxu5Q12v/CCo/EEf3aFORcmKVvbFepslulH9FaYDfdzVub7vgVYlAttR0aJCiaj
	BGTZAd8P0N52D9hrS+yLAf9TSmr60PHhK0qPpngHekJ3PXKNHf65IqI45fHs+5BW
	EFAJfA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v4cmx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:29 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5752402f5e1so9491385e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196709; x=1779801509; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=moLln03VVvMKZIRmek9qRzT0EwTuwdZZIig7cvQ2zRU=;
        b=gf8pIhYmbOhc7c3+4iUBrxXE+c4TmvmDBT50Qufj2SmSxutuHvbEUdxiTqKn46jvVj
         XXziEj14ogWcLEHrx7gSpJj9ObScvqt/+lL3sXGGUnq5bhUpfnj2MSHKLEnPeeoBE3PO
         qgsIyTuU7v8LPd1kWovNshpNQTZbnA8BhIjS9Q+JGAL7cAg6L+rI3oXB/9aQrrbRZ+2J
         U7gt4LAKCtRRHURqiALJabWU5dNWa84UFZCOVFimUnpCBrTz0LwPRHsdbt2xmB6JzdhW
         0h5zsSi1jBcsMP6f0/Ibnf2Zn4EoD6M5Qt+LInHe7daJ1ndSLOC4GWI5x5JokIVSHPIs
         GrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196709; x=1779801509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=moLln03VVvMKZIRmek9qRzT0EwTuwdZZIig7cvQ2zRU=;
        b=k/5SePOHm76nsP/jSu7v+tAHrkmP5F/kCbh6ZDFnfZtYh6HRQ2qSGETyuazlf2JwCx
         PkX5JPQjQc1KaKSlouy7cQN4bmsE5+3XIvgA03Q76Fvhz1uVk+2yMuCt2oyUsg0ucs02
         JAgvCpZRmA1MnyP1SlRcFYHzvA5mpA7EH1h9svbAl9jGs3quDTpN4C3R8Lc2OfUck11h
         ZJCUBOTWuMpSqyw9ujEEW2pGOAS+ddOxGqYXPeBPVU7lzUnphHR3k40f1GLyq7HHyY5R
         xXC5EJ5m7x7XKzvdNJ/rfJerCAPE+tTjTl/79GJs05sW/ItZpVgDFXXPN9fLN5ZV68pA
         iE9A==
X-Forwarded-Encrypted: i=1; AFNElJ+AdPIQvWm/2dI7X2PtCPCLkgsq8Giqi6pqoq/ZFZ2osuh0MhygZ+yOv4ioTuQorITZczATyUFhbLR80qT3XNMj@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd/DXoV8I1MqbYQ1zU34vLggmyDbQipHsBSzSSYwNeruoXXOFi
	5YTDqsyRoigS2tcTtsnCRhoZX8wgo+oh9S8IcDJFjfCXdazMIEEkc1Dcn96iub9f9UcLz5T110Y
	B/Dz0pF8KyZ7oklwXNRDoAEwvpj39QdsDZ8XZEfRRcbOpYjmxnjUcudiNcT2shWYPy5qR9lcGMZ
	Xv/A==
X-Gm-Gg: Acq92OE00UGlpIGlcGHTd1n+s4+glVb8wzf3l9o6IvYwL47R3/AXzQ9IH3fKcLlsrTR
	ZEs94pGXEvMgIB+t6ExWLaAxJaZyJSVRu71HF3zJNyD/OTsVqdOoqCGA6x9bkwRhpXVT6rwgbBE
	Jht9VQVD9hugH0Esg2t9nK2/GylWzaxnVr6OuO+JCy9rYqbW7ZrNsVKUO1JF+nb7M+a1fb4ybIk
	famj4rZ1xct/6A7c78v67KjJ9hZMW+hiY5YDsxbOnltp74q9wEm6aVqnbgeeEWvPRCml7WE0G1S
	2S5l0Au4jXnbLjertkIow6AucnlgR5DlQxcCUY8Kh7/eySPm6GjEXI0PlJOm8wBWm8/jpm2AkTK
	SQUVy44igwKMi5riZU5wY9mW9j0OMLlK2bC/jcREh7W2vhGEpXsw=
X-Received: by 2002:a05:6122:3784:b0:578:9e26:e439 with SMTP id 71dfb90a1353d-5789e26f35cmr5125438e0c.10.1779196708976;
        Tue, 19 May 2026 06:18:28 -0700 (PDT)
X-Received: by 2002:a05:6122:3784:b0:578:9e26:e439 with SMTP id 71dfb90a1353d-5789e26f35cmr5125360e0c.10.1779196708538;
        Tue, 19 May 2026 06:18:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:52 +0200
Subject: [PATCH v17 10/14] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-10-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2674;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=z8R+ergOMQqtDBFCzhyJGktXjtFI7hHEfPs4Hn3rlAg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMKVfVhUnZ6X9Zd2Eo0bF1f8BSs5/ZGQpiO9
 hV6+UnhtjGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCgAKCRAFnS7L/zaE
 w7IdD/4nEEUBAVXy5CuT/Ir8QkQouzdfD3V53LDe1R7dg2dyUuk+VJShWPPRnTGEo2C0+a7Lezj
 L7TGHgPbJISccas+3c1Z1GU0uzYZXtAGaj4XNiObEQILe7fiN0Z6/vmcfjyH4chgDlRWClc5kOb
 7nwVCfqJHBEupZjPPUMGQJI6rD7sCHR7ydkVxN1rGk1ofXG2tj7PGKJqrQErTQtaQXPU7ppCJ85
 yP2OaxDbw8QvULphApl9Gf7slKPi+vUOOUElsvlSBo22/ZNl1o82pgRVxdCdz+c/6ndppXII9jo
 M25dEd9CL58BFTj7cvsoDpWbzorhU7HYAwitKMVdK8EZQTqzM+dIYDcH5MjqGayV68kUVwTuqug
 UVk02hexvaEWxSpI6ctGboeQecBGkMuooqebMVKwoMPA7aoPYp6tFUNM6j102j4C3wSAw4oXBf1
 U7fpcJEvPoQXepRe7zHxsmTQvaPuoOG4sC0nXAsRDYMwoRbWC+Pw37ft7P8YptBYtG3V8U2Qyh9
 A4cz4lYzuokzHq52HD0erpEhUO4/msOJEHQ2ecCe9HSxH68cezqYiAqlVHo6dhUYv+ZIrAnZ0Ce
 iBS7bak7gPcQOgaJDxow3yNptpGzHcunMrxoKKbcObWiaTZqyplN7o2hVGcYNFBwvyZDuloQSqc
 pa//L2nDAR8MTUg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0c6325 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lH6k5GM5CfRwGFUYfCYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YT5ifvf18eSDv93Z_DhrE_lnBz4ma9H2
X-Proofpoint-GUID: YT5ifvf18eSDv93Z_DhrE_lnBz4ma9H2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXxQrt3OH7px34
 h88/nbwbGOaLY4vDkv9xAnhwYim1fOLPUUGWRgS0RjjwLd2SSPmGIqu73a82PW25oTNSi9z4Sqe
 DBuZdRFrEWb8U8DIQ63OOCNIboJ9mtWFL/4T7uaIbFGGEtVY1KRDsJHL5B9LhnkRxhAz+1CQEO8
 SQ4T1t8SfbJSOatMpGNBUY2A+oEN/jrlMs8rEqTD8kLbNYAP9owDqIae0AypIVo9oau5i/EAyNH
 TxsvnVtB14DPIXUBs9yQscGCTjq/RABL8KtqJvDBZQZuHIegg+QhsyYHP8m/qAqV1EFBtyc8k6k
 WZCtA2EikMBWrsLQBe67FDhgRsGF6sr+an66UvkbrbEOB7C6k2W49LV/k1DtO9w2OH60aejOi8z
 6+UwEPsReUmZTTA6AHf5qWuRsJmgb6a3+vWSUFw3nFN2k9Ea90o/CGiA4qMqflylvkWOLZOIcBr
 KEFGWM6vFt1sm/9iQUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061830_425292_9EA91A4C 
X-CRM114-Status: GOOD (  20.33  )
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

This function can extract all the information it needs from struct
qce_device alone so simplify its arguments. This is done in preparation
for adding support for register I/O over DMA which will require
accessing even more fields from struct qce_device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 5f724db7c65930991218557394d99574418fb68c..90f44db6606173d8afbd295a6dadea177b7bcd11 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -233,7 +233,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = devm_qce_dma_request(qce->dev, &qce->dma);
+	ret = devm_qce_dma_request(qce);
 	if (ret)
 		return ret;
 
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 08bf3e8ec12433c1a8ee17003f3487e41b7329e4..c29b0abe9445381a019e0447d30acfd7319d5c1f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -7,6 +7,7 @@
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
+#include "core.h"
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
@@ -20,8 +21,10 @@ static void qce_dma_release(void *data)
 	kfree(dma->result_buf);
 }
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
+int devm_qce_dma_request(struct qce_device *qce)
 {
+	struct qce_dma_data *dma = &qce->dma;
+	struct device *dev = qce->dev;
 	int ret;
 
 	dma->txchan = dma_request_chan(dev, "tx");
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index fc337c435cd14917bdfb99febcf9119275afdeba..483789d9fa98e79d1283de8297bf2fc2a773f3a7 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,8 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_device;
+
 /* maximum data transfer block size between BAM and CE */
 #define QCE_BAM_BURST_SIZE		64
 
@@ -32,7 +34,7 @@ struct qce_dma_data {
 	struct qce_result_dump *result_buf;
 };
 
-int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);
+int devm_qce_dma_request(struct qce_device *qce);
 int qce_dma_prep_sgs(struct qce_dma_data *dma, struct scatterlist *sg_in,
 		     int in_ents, struct scatterlist *sg_out, int out_ents,
 		     dma_async_tx_callback cb, void *cb_param);

-- 
2.47.3


