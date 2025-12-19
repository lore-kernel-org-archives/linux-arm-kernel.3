Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1E9D7497E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=Qw37MzNq9lQlkBcV0XXH/3fm4p
	Wqri9KINn367+ij4DCTBuxzfEHJ3ILoPFQOWPisFs6pKDuf55yhJQnmFtEuPLMpenA1qpbTn/BjQs
	eehqjQtF00xEIUcACg17zvmOSwsdrYXIyi9gMSWtKYS+x8XTxPr70nKxCYDr71fkiV6MdNP5Wt8nr
	uljcejjF7hs/CGXVZsZ5FMbdWP4MalA5PqrKjREW9zEsma4PuT61fSxHIsWB48ZMz9etOuRCHBBRQ
	qgUXBIWb1pD1rXyl6e+YUh5+WyKsCRPEMWetUBkGCJ3MOLC1VQ30MKBhCdB6qIg9mGYfKfQulV/mG
	O+JxTPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPe-0000000A1QD-3xTu;
	Fri, 19 Dec 2025 10:08:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPa-0000000A1Ly-1SHk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:40 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cUH63700913
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=FblUbiksDdOT6ybC
	0eFMd8FZPiQC1MNzvNl0gINkd03cAer4YZ3VDYH6Qp/KIeOKp87DQRyRcMBHn8Se
	6xEsfWd38BtmAtbA/vR6kHzZw8eknmT8ycBjFZNTyk2zPTCAjrKMTFvSKQOyfyTz
	8GmGmJnIl5vxodjlvfpDszkHG9lCuntckx4hdwg4cbm62csSDDUqn7dH1psnJbGB
	plMnJzq/ngYmMsQi6UPw5kXjudYO9axYaldM+YUCsDZiNe5we/ok3VvX0806ysXZ
	xGGLy+4gligIZbBSYWG3rqrjzqmkbDRgZGRQVOTReT7s5tx/ZWSFplGtcjl7XQeA
	TQIzVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ej6y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b4f267ba01so649517085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138917; x=1766743717; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=dS5PN9aplzl1f5ySMDZnXSrAr427g2APnXxH5c+B+OMylyzo/3Fd8E4B2Iqen+5S8A
         qbezEtvH2REHqOCuNOSp9XuLy0XQUbBqdbEcbPJqGe0nKHxEuzG6InL/ckfFoorBiWXh
         +2urE4l3609LYo+zV6DZ+5Xpd2DnNVBMgCXwUwf2Rb9sp6mzDyTv0U8o55DwQ7BjaNWD
         W5z+ERWd/XgomsCL6uua4HDiwmhKssYndSl+kSo7kAaQW/rtfQEGl04Z7mar7ggfZc7I
         gQqE4NReVTykeLfRB057sHyDyFfCwN+mYbzi/YTvnQc2nsZoeCPXvCJW5zBD2RnNWd9F
         /NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138917; x=1766743717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=GbMiaIuREmBiF8qBjA0WxHoU1PXHRgB8sfLEEdSGAwglpX5DSgAjHLPoalPNhccOu8
         pM17/qjEpY4MOVdttZ8z6+nJJiSjzeCppaWHj8qp6o7o4KlY/9IKMlgw6+Yb3dj6LEJX
         WbUFt9x0U6cKLXzf5hcVnJQ6cFecFiWrt4XX8VlKmWcOKukyPSZ7BysvvpNnxFESuya4
         9LRnXWik69TArIi74pH0CSHtRWFXiMVfyyjt3gYwEECEY7ZAwjYJG+uPAWIlPFGXvAPp
         WLdf44IILStoujt+1mJuET8aXpXuMTCwxaMk3l3DRQdihYzLEflzbN/iYfROtwusC/wz
         O6AA==
X-Forwarded-Encrypted: i=1; AJvYcCV87eBOSI22YQ10y0mc/CETVwVU8epIbbAbmleHJMfRl1dy3bRXCxUPVz8RZvaRAFe294lkjpFxNS8UPcJpeDo7@lists.infradead.org
X-Gm-Message-State: AOJu0YzJQUmCYxzZ9qTf7At9B2ya04fSHEZD9xhQts5ANNd6yPq7qf3S
	51cxv8VIlu2O4HLamu/vdObFRHc+v3XHTTAXrVS3qNGF7XFCsAeFq+mK6kveoS0cvEZ4B9y+Rq2
	2zyn8nIYWp4rzTiLoC9aZZtFp53suMraoGyFa1x1FRC1rS0nkyzn9axugpTxK96RB8HUGoproaL
	xndw==
X-Gm-Gg: AY/fxX5rA2Pv5eLRXilpivZvW44+LT/8/Vp86UL5zAaCU1EqvREuW+zV/53BjJBTv87
	a452cq2dHubBUxjESfYy6OAnIPZsMRT+hEyfg/n0JPOOKYmUIjD/s2YKXCb5pbafhmO41iH1o0m
	2NlSqNeeZlkrJwN8dglzfmrvWsayrCgWju4+GzncwoDfCpAXiwrEIJWfKAVRP+gNmDcoa7yMe6l
	eLv14+20PWq4W96S7MgN7gb25jwbdKHa3biN7ttcDeiH7Ixu1Fv/J5/V3wmbOgKaACsiIpjw3L4
	+9SShKm2cfAbYhkY1Jowx7r4zPsX6JKPTvF1SXD6cjKgycNn9IdkCNFP3OMobCHU1ZiMw4kgYon
	Ak45zPhq+2HgFUE7qfkFkEsLnjinNJvSl+xjMPQ==
X-Received: by 2002:ac8:5f8e:0:b0:4f1:bd60:eb7d with SMTP id d75a77b69052e-4f35f3a0f1dmr74754731cf.1.1766138916740;
        Fri, 19 Dec 2025 02:08:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3KPEegnMuKT75tg6XjQJTnbgPfXlp5ec6OVQCeKcX2ems3nTyFKNO6BdQDvZWNhuFnoUV5w==
X-Received: by 2002:ac8:5f8e:0:b0:4f1:bd60:eb7d with SMTP id d75a77b69052e-4f35f3a0f1dmr74754551cf.1.1766138916340;
        Fri, 19 Dec 2025 02:08:36 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:46 +0100
Subject: [PATCH v10 07/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-7-ff7e4bf7dad4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQUTzmSGLFyrlG2gEZOV46m/aXCFMmi/dETO
 y9XVLzl7a2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFAAKCRAFnS7L/zaE
 wwubD/4pvTivO1ePmCtJUdSnGlI1Y295t5L5NP4cseSIqIWmOvUk6OR31ukM+4U6a2uyw33CL8N
 x46pBMvqf3dk99TNSzqsweJdYITYtYNiHv35f+/Yjo84hL61azE2qcrKuKPZTgMgzebKIGqC5FG
 LxOmE23qmKuJZZXfW5RDc7wNd9PWswydsAeH++Pyl9wPmuiwgLDKPaR0jJANiFSb/MoorrsPx/u
 MFxFlTCQPDkdq038laMZnoJjEWW5mFtwu3H8rNckqPAlrQqbkn3OLCZmFzIarv/hhV3M2Hh8Q17
 WYnfprGleqa2vbJp0WFdPp69hQSTE/LXo3lpqenRLxRgyuqAnmKps1L44kWepRpnXXaRZzr8Fsz
 L8jsdHcuJA+rSiU2KGfDZgPgNfHmbMUgPHuHqc2nPwj3bWgn4tx1m39uaTobEKD3mBrs+7HDKvt
 rtR223K+FYfkO7G+hCKKJlhGOUtG0WL0wtroFkK7lfiCQGwUhw3mUGkdkkX6UWlp4U4lkkm23KE
 wMC+uJoHqxNSSXCnVuPrMR2VpG+T9+PJZoL2cfN2D4Mg9jku3vnJ0coxe9h9747DrL8uvX9x+p7
 ho44htD8gWdrzYQYR8o67RyLFPKMvtWeHSM52kCeUFspOS9m9muUlwZ1T1+G3tWJBxo/GSvZ+aJ
 fHmpKPKfJq+71OA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: l1YLjzGS0R2MXAVFqWvljn4PK9M9QUc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX6u1QZro9W3fB
 tP0F8SFDij4aOpBay+gwzkCl/MjA+jRyZkKKMQ0lRysP8HL/7fGQNt+j5XKTivM22H2GzrGfvfB
 phc79oFWyBDNLFwuHe6ioSx+KxWXILcT7128UNCfBIZg17blnBftYK/yKxlOa+FFTb+E4jqyu1g
 LAOeB5SfWhBVZeQHJpq/R44MTMm0wVuOad3U65SsxBiGeGTJMGwx8jfRiGdNX6LWXUWEs+h55m7
 rD0S34bMSYMeJFFQ7Yq44SkFUOVG2O95xrowvazPTJoXXTY59lW4FGN9ZYfp3T0YpW1+pop+3Qv
 mtwvu9BpcUStW9J+XU6HJ9Vmp73QU4ZdMcf4+ejD5/XG/UcmLZ/XVtFl84S46Ueh3Ux/1yWH3Qg
 MVR/2IA7eHjiP0rrLZgp4BaEI124i6Sp0zicyMB5ASMhXvUEU6udNCAC2VmkF4DATQ2sC7sw3+s
 O3PVr51BRq+DGXsBSlw==
X-Proofpoint-ORIG-GUID: l1YLjzGS0R2MXAVFqWvljn4PK9M9QUc0
X-Authority-Analysis: v=2.4 cv=EabFgfmC c=1 sm=1 tr=0 ts=69452425 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020838_516677_3BE132F0 
X-CRM114-Status: GOOD (  19.91  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 2 +-
 drivers/crypto/qce/dma.c  | 5 ++++-
 drivers/crypto/qce/dma.h  | 4 +++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 65205100c3df961ffaa4b7bc9e217e8d3e08ed57..8b7bcd0c420c45caf8b29e5455e0f384fd5c5616 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -226,7 +226,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
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


