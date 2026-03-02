Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E123FEA4E29
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=LohMpWf79ZUIB1NcrZunIB/D03
	N4GFAlYFkqsNtp3KjTwxAtR0oEq63HiqZBy+WIOYIIJQ6KSGX+ZvFuBd0BWWxwZ9/dHd5XoeIiUam
	4exwC++zMjHvUyfT4io59bpkeE6rJeK5iHYw0sh0NEH389MtKQypftQYlVhHPmxDmPYwG9fbWtn5o
	Cu4fbwbgbWarOBUd15yD+mAcATe9Jph+Hu98b11YlAjaPfrBc/c4hFjDs3Cz8aEgEfSiik6qsye2X
	rhXcy+SLM0a6aaf+73QUQyFUKK8I0D8j1IZa8u52f/0aZ3g1t8zR9JkAWLOhhHSx+uOAKSFJmqTuH
	1SwVyR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eV-0000000DPxD-35OT;
	Mon, 02 Mar 2026 15:57:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eT-0000000DPvJ-1H7P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229EuxM3630829
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=aQ6hsgyOrwv/XjdN
	K6Cy1RvPnmTtr8oQNppm7QSEZF9mP1iAI3EE/3M4IRTINiC2ljQ1DugLmN5+A8EI
	f6D9yuyLC6kLqgbo8tUw7owiDL2E2wgdeIpGjG6gX2L2o7CKwaF9v5VOc6SwLRRE
	0KENO3c0sOQXBk/iI63PbC0L38Z+0TRsqwdXzhq6n0SRF2/tnk7c2CSPy+lPFseu
	aNIM671nmsTIEBp6Gx6W0IkAB/lWEjnWoCJt+eDcQyTOWPrfKdDLBsdqiqr3DAcG
	NnYiWmjjykkIZT7ccuroU8D/rC6/lor85rvxvfQiVJ9u2tEieZS92yK5coEANcqB
	sFJWPQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7rhsc8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4817f3c8so3080182985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467063; x=1773071863; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=fZ4RtdCFukegxfFQwW7MSpd9ZS5BBb01OP0xGHFjNiXuuyqw1Nee9zWIzpBjUZ9eNA
         CiW1DkPB++9cTZtva+ChyAipa2I69vIwaw3NxHrVsmoaoHREKXdTAYzkbfTqXym55aj1
         csazJfJ+W+qTx+4x8VJlmNb3W1QUSxD5PqdphpyyZWkF/19rwhFwlZn2Sftya0oTIPjR
         Au/sDT4cmmIYczntExmyEuElcKjQwtn1yqRbFy/ECB5na0fQXOxk353MIZdj06nI8HIZ
         FNhnG/SwfcD/xuCOnRpddl2+YVWL2H5fiBYolUZXTDIKwm/klRuePpqMrOE/9zhU8v7Z
         LRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467063; x=1773071863;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=oZGTd9mKWKp7UDVc5VXSquD2C1+AjyyU1jCxyd8s4ZXFtEwES4oYmS/Mf+rgHgPCep
         HSMOkkpBw8dBX6yNLduZACF3oI6rYHvGXhOTHWzRqkpQ6+yCqbcwcN98EalxSrBpHDuM
         VmhVtUVLd8Crkw0X4b5HiYi+YUcskr8jEWgW0xPGJ7e9ENv8GR1cHQn/cmeRjRdiE+D+
         BxM2mbEiSuX8fVSx+MCJijgfgtl8qAFjVrYcgI5+FR08ITJe2j3K6ZYPL9KMYaggpeRx
         mq0RYzunhSKhbU++wPkYVNrn2fOJ/j4taDtj9mh2GxGQZWk+OSj9RuWERu5sK/bskJBZ
         bZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh7tgsbxM1cgAU3bckubWAgyTjUy7PII82BX4j4k2cDCO4nkGuWr1VQZ0DmZnsZ3ASUar2FlsfsPGb8H4eFKG+@lists.infradead.org
X-Gm-Message-State: AOJu0YxwfUY6lyJ18oDgj7HGnteeNujJ8sD9CKY5kR4u/WxDPsKBnxVF
	uvM2X0oldpXLO82c5DIOi7GXgmDn18eokb7tQTPk9C63xvYb7/Zv55B/CbKtrkbeINFhYVIxTYA
	gE0QQRFemZTG8NSSFsYWDWF8zljNkH6Zeu+tptC2QpXKhWi7dQB996DmMIdF4QKa738HdO9ivPG
	ZV+Q==
X-Gm-Gg: ATEYQzyLZtbExyRW3jBov8AujAqJlO9Rmr6duTkA/ASFQh12TVA84DhGzn7LPaZvz7g
	1Y9gvNWzCe9vgiuQrvwVpCKLfPy/9WUbZtM0Jsj5EZ35WcR6AkO7vWCmACXjE5vflk491EuOcB6
	7lc6AQ0+B1cFOMVqJn6iSLS+wKtofjIzLqMt1qpLLD6g3vzvc4bjSJiJuparrpDRxkIlAyhOSGY
	Aq8qzsY8+s1CLSWZSF/4tKPen42Xw8GRfPGl2xzj6sm8OXCxf/lIiVJQtmAgE38z8mNsMxEf3pQ
	HkS5ADqlBgnPk1wkU0PWdDoS5oWyY5T/mcZ2I38YNAf2KQMuWOobji9kRSxok2mEuvwe6xAQAnH
	coqrRcoc8Gn9YJGYCM0lqsF4T+Lz/vC2eLoA5AZVcEJW/nrJ3NsgQ
X-Received: by 2002:a05:620a:4608:b0:8cb:4a3b:5e06 with SMTP id af79cd13be357-8cbc8e222c8mr1398997785a.67.1772467063404;
        Mon, 02 Mar 2026 07:57:43 -0800 (PST)
X-Received: by 2002:a05:620a:4608:b0:8cb:4a3b:5e06 with SMTP id af79cd13be357-8cbc8e222c8mr1398992885a.67.1772467062914;
        Mon, 02 Mar 2026 07:57:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:16 +0100
Subject: [PATCH RFC v11 03/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-3-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNlZG9LYSOKfu5TlTDseIe/TgDfGHUo+ed7K
 9LnJ2eJ032JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzZQAKCRAFnS7L/zaE
 wxShEACbtCvIVVakGFfkdp+go+XnzCkQJ2cVC+uPIiyIvG8vB0m5MYzgjVEEQuizT5Om48orKFO
 Dv9WnyBpd4u5lsgJCcef3LjQuOconyGuIZwzF56VlNnrHG4gRO3FrUMYaEpvDd/avaUZWvXV5Jq
 tRpDzMLe8+l+UfkbS2WJ8xyxBRaR5kqUwrCvzGzjb1V+3BqQR0p+ccdNX7hYBOXsVj3MYawfvf8
 0jYdBwK7B+ilI9Fev2ZkM6IZ495svAEWmEAlqwGn7LprjASLX8pyDX0MJml5ATSMx7W0arufyZS
 3QWunDUcsbD2Jt5g1XYNoE+S0yNDQCs+dTkVP6k0V3+idx2VwhvRuACHCAr8zpO9Ek+VrXGDcUD
 yD1ogpHf7riRlIPLmlnpKYf/wBUgq0P9oGuO58bNfLOqBmGrPzT2IAD0wvaQJ0i6kFqAr91Ip1e
 fcb8YuYR7DSDS46UbMKlzsHe8tAXX8O9H92eJEFvanCA9MbsjYQEAHCI6w3WVOtqJsHzDUh2mjP
 Dx8iMe0vezyl9gWvaradWUGc7T53RoVja9XHFD1UkBh70E9ElXDi6Lub5Ng+JJDs9VRMXS5TbvB
 cpnKz/UMqM9mG/gESnL+YgDvpA8aZt5/UZC/+0AWonxkMHfKY/ixMu2BhEVAesKwHYlP3DO+he8
 4c8t2NdUEFvtphw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: is3WyOf7UN_yBSWhBwa4Ngc97Yg-x8X0
X-Proofpoint-GUID: is3WyOf7UN_yBSWhBwa4Ngc97Yg-x8X0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfXxIJhoRujyuXy
 RZZmjlGP5QzmDP33POTT5Is9ricsu+QtGSA3FlMXilPF3FWo6lbzLH/qiX5n/w3LWT+nMxZvSg4
 0HXZsI1SVzxAuPDrZQ+9RhUWt9apTU7H/nnxNa5VgKQqPVXFsWopiHMS2/SqWxtuhbffrERLv6o
 Twa5DucCRv6FRHHDVs9Jd0TUxEWIHZiBlIrVaEkVcUb5QRCuuyX/tKU9/OI/E1ph0+H+fYTTv9T
 JQQBCdGOSCiJJqi/C1W1jQUPPA7ebsyjNC/ZnjHjV2ryXh7+f52+fQ+Ku16cQd9Dg7MZCoG0alc
 R3ZoWkYP54VYU9qXLvL22cdE+6OWXgyEATI40psaosAlUJboaZkUvFxjB919qTm4lzR8qEQIDAI
 SnUQTyBV0IJ1lSW3J5/Tvs9hl93zAm9OXG6iqgw+0FpLcbPz/qaQrr3nsqWpVKQ48ruap/Z7jHJ
 hXlEUzizgjpDnFGOk8g==
X-Authority-Analysis: v=2.4 cv=cLntc1eN c=1 sm=1 tr=0 ts=69a5b378 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_075745_477269_4396FEDB 
X-CRM114-Status: GOOD (  20.23  )
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


