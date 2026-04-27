Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90ECBFF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=VlcjKnfePys05LdIAlsJVQrSGI
	/ybBukl7YEr5MxxacXtIhCihlqNC2uefFH7/lf0Q+cf/R73aaUI8Kl0YeJJxNpiTKFUDxcd87we3u
	B64r8ILUhdTsv+LxuyzMBNuqXetY1Yxtw4Jn6p0gaB1beoPypFQ5Jd457Oij3w7dBnPwP9cXIrRfd
	hrIOPtDaoZlmDo+hvBEwMBeQu8mTlAVdrwhh6H8dTWX36hcTIiD+7QM0EjMTmfAGW7/EzCEFpaMs+
	UylRNe7wk8YIwF1x/A9R2Xb+Bcqcsdb4V6F2gSsSE8lI0cKSFowKwc+nZlbnVomlLl8V4u95gv0p7
	MKdWphOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4o-0000000GYr8-1JyI;
	Mon, 27 Apr 2026 09:16:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4e-0000000GYh2-3EIV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:17 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T97V1762094
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=cqjECPOQBhgp/xal
	uuHwTLcClDvcuPKjvo4pdqq3w4WLLXHo+18z2NvIlf5MahPhuSE/gacEw2ZSJQRR
	6gdhKiDFOdkqIehtZunjo3pHI0oDXyQMqjmZ/e927XPUVSNPkMCU7Fzxr3ufnqe2
	jFcM7hL3QtHlbvT91hKKBKkHGWu0SZ/PAtKG43B/NW6V4EaSiIjhkqzf0nCXesfK
	Wb4UDUvt7xV7xk5ML+lkbQ5P87apMMg/NksrNyJX9KsUEZJ+9nwpYzkLkXQ1skAP
	/KPodTh3wDjVnAJz3P38Pd4i601f+gVeKtx803pwf9IDx7/61nJ/bnRzUUgJdFTI
	uT2p6w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9da1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e575a50bcso104365201cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281375; x=1777886175; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=V3h2OyF968ZjOL3dXnaHzZ571G1EsI71Pwo8wzVrfYc5XLB9quUpX5i3vbtuV3Xcf1
         lvNi+BDg/IZ/w9I5ENiWc3yYB4vjqmTsH2tzMpaiUhbsTFnd0p1I+klZIEXLDQy/HM7c
         o0HUMU/O9p/Jz7gMXiq776zbb2DEccZl9/5IagqGX6FC3ZY54KIq/BzicC0vg6pqcTox
         jBPvAURZwfdZuotdiIvZxYpq8eWr/GnbEiInZozi+hbjgvt8yTwVrs5zgoYrTxUVD6YS
         EW1gJNW0dMUMK9CK8O9IVGZqCLyI/j0tiaRtlKv6lFzAuIcNIG6Z/4E7JIrMS7bRutt3
         44Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281375; x=1777886175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=ZC8+PVDNdEQbqLljHjUTFsHifpChX4I6aaz9KT5vqYJ4sjHA3YICBOJXtzwiJlCSNF
         DtWPAeWaAyGhQpBYiJTMU9Mx61Q3SNgMb//xM7GDAS4aoaA8cJwQvF2/1EBcGxBMKecL
         nsfIJZofHHBIsFxb8ynTgKNJzderZGpSG1OuREIRmbOOO2RW2sdNzZIWAkP/OoSeTQlq
         YsdNxVOKhHS+tCT4NAEbF6N8YASqn5UY3U+LemF+BCV3jwWRFaG45LXOXzYICgCiNfTS
         qeqLO7SZAZJSoU9sI1v7j18fvOglcBCFcPXW3/M1TrRy1CHJQqRSxUMDX5UpzPjZLShV
         Lmxg==
X-Forwarded-Encrypted: i=1; AFNElJ+NGqRJz4oKuNXkXKFkFivWELKLeuolJ+PyGxn1ImtX/GUMJVlV+PjvxwKEDOyStfOD+UHRC6A0Id3ihh45vLFE@lists.infradead.org
X-Gm-Message-State: AOJu0YyQoyrv9stySMtemVoZH8piegkQAnHFBX5SPlWRRj18HDhPr57X
	8cPtJ3sTCqAQXUCZfJ3sRh1+CMqMQWOujBD/TSYCwPvOP++wQvJ4aq5/Mhmt2TPCzKBPOJE85jQ
	df2Nc/kATrNZqC9MQ0i1lxc+l9G31Ld64eXLlPDW6wO6NZK96CxcnVZiwRhjteLm9/joghD/tBT
	5kAw==
X-Gm-Gg: AeBDievcIP9MQDW7Sm2YGY2tPNkhlJxxZjtQdqYSSHC6kyh2KDiX2EDza3IASTsz8Bg
	1kj4Q0vF4RaS4yQGoUZMIHIkEWUEYCYMomcWaRkyzqMQcX5CnMHaFKVXZd9UNagH1GTt9JoMBoj
	7otLqCEiu7kTKVhV5keWe3DdDWj3cAVBmfDwBNJqD2lCxJSVDrFbfkj74m6tJmWAL9wNsHjdDO6
	0j3+JXMANyfCN+5AAfATBTZeRJ1bMvln2Io8MlnjMeXaqVS8g8v2fNetQOitnj2ryXvGQsK7ty1
	PM30P+XREAJLiucOEWVvi4zJfAsYKWOgrVaAlMyG/MkJF9a01Tc4XQzFBFzb6P0MhMoukaiLm2G
	zzD84LIr9F8bakOS3z8W9Zz3peZwR7rMSEvKTE7sV2UR3Z9Gy4G7GzySVjmHQFw==
X-Received: by 2002:ac8:5f4e:0:b0:50b:5056:fcc4 with SMTP id d75a77b69052e-50e367fe796mr649757691cf.4.1777281375227;
        Mon, 27 Apr 2026 02:16:15 -0700 (PDT)
X-Received: by 2002:ac8:5f4e:0:b0:50b:5056:fcc4 with SMTP id d75a77b69052e-50e367fe796mr649757311cf.4.1777281374731;
        Mon, 27 Apr 2026 02:16:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:41 +0200
Subject: [PATCH v16 08/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-8-945fd1cafbbc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TfRVgyaOMZw2GJQ0rx6WhRl0huHGm4mvuAmz76BcVUM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylEQkBhfE2gADseHBpneI75TXF7a2W4RqCZO
 UVezU0cEJuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pRAAKCRAFnS7L/zaE
 w+ITEACxbn5lhWiDiA22lakYAcGbPiPdloTEg9NsX4hB7+zQweJ2BKQ44w1ptY3J/fkSyYhHE1b
 VDD+3mq4jShPWTj29HhzHhHaRone/BLUmgfswv+pvMD2jnyX1VeAbb3y+uUSRVIAWHqXjTZgEAg
 QAqnzxUyHtIhVJrz/q59A2176m8ZxsXboa3p2aiEO1HKQJOlGa+McDuNpz2nIcb4pt2OmjKugZq
 MNBkXuCcrWp6ApU0KTSgzn+1qhrfb/xT5eNfFdK4cHvTSC5TowMB+v4XftQ0Ph+pK9ajt2udYDN
 dBkWaoivuAAfj7rakf9E14msoeLGihUWaYlqhZemDplPDWyF72i9TcxVIdItOGSbVi9CkIjpHeh
 fkqV92BSQjGTQ+SX+geWnA6JTdLq6zj0ndO1vjkpOzlL2jcWRFkaMFkFfOQwht2uP+Z5T9SmsHV
 pL7SIoheRcKEnrZyzLJwH2OPKbOVsegVUSPBX6lEbonu9Tfd3f7VHjcdkN5lSR+MSedxi+O34kI
 CfIiqO3ueachpEuE8Qomk7U5gd0gKhpwm4+imM2xbYz+7ef/YPSc1prbh9GWZ9KjzLBGgzJDbOa
 isAJmwUL+2/o2d/01i/76RMn7M2ZxG4iEw+3tzW9/hD62Hf3LzA1RDUSyttDTAH56g/sUe08dD6
 +edq9r4HES1frQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fq5DJjWT7IiPIidxB11O9w_oaecU8ONK
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef2960 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX0Ji8kMO5q6FZ
 zRCCXhz+gSbPG8TC0oB2hlfdSWhWdO26OEMrw/yqpkfY3hBNK88rNW6i50WGRrILxbCnQCAqZJl
 4g5gfGepyHSjW8MxGsykTuSsPtY2mEMaI6XtMHVKcjaaxjv4DWqyGdCfmDlDQU9YBU1cKXnyjgt
 Vhu3KBmeHyL55haJZsPX7C0ZejrGTG932IKi+FPBvGRjhH95dJZ6dASCgMV0ZYZ73GwEILx6Gc+
 P/bk9+NPVZbiJwbtj5DTJuz06cVHGsJjwsjS7NJTwJsNHA2W/IYRzXs42msqiiRUWJfTREkEXwz
 suX8X3ifF0gbqom75I/B1l0WQCR3ExtIaPWz/dj0Zq/xy9hR4zTcfIS1K4vGrfSaj9HiuK7Pi15
 Ji5sbKeGXOGFNMjGqH3vAAoCWn/4g+RT3uLTMfsYobKzwZ1mBdN7CnldZXv9xXUaaKfX1tm+YM/
 ih4fnfWuAW07n3WXzxg==
X-Proofpoint-ORIG-GUID: fq5DJjWT7IiPIidxB11O9w_oaecU8ONK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021616_830720_A3A9AA2B 
X-CRM114-Status: GOOD (  19.23  )
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


