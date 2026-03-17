Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ECAFD8748
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=dS47Y/qvgv7TCKuWTzrQJbaUk8
	70RsSG0YPUtoMW6QrGzHtjIB1SecjTVxS9PCv52VMwx+/3bsA8lEjZYKt/+GCwkFroptesB5GskVd
	VZyJNEUQpo+IgOlYE9NcRJOb0wVuLEbJwORXWDiPVunnhk4FTxNJUO4C8MS9x85iJ3RpdWzln0zVa
	U9hJW9VuPJGyxsVEMeScKCU8FZGZY3NLTechgMPqpLrI3vatl+ZwpL0dce+gy+lSe5jc7Zwu81OL5
	u7+zMNmtoV2kMJd6tIpjbbbFd/jKf3lNwVfiIQQ+bPPlrndk7V3QJ/FUtaUTUNv8HY78RkJCFRXjk
	WN9lnTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0i-00000006UsQ-1nGE;
	Tue, 17 Mar 2026 14:03:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0d-00000006Uo8-2ffU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:03:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H95QkU2314566
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=; b=VG1sP+XcRIQOo27a
	fGyYspmQeIdEzjMzHKUofSMMxPgamN9T0s+sFKFNKJTSbR0TONoyibJ4F7sEnCcY
	cyYCxHAa0A71FA9ygyl8a8LEeSmx+zfxLi6NQP9J/CoHamEGXG13w3w95oZsxc/d
	bqKXNK8IGWkH0GWbAZyOffrH5v0RPtDFBs5J3/nFnz+DydAcwVqvRxrqtbgag42P
	7/wFQN6kA3hH7ZImsBveXT/MaFXSSNO0Hzxah4AoEng1JNYtiIHeR0/fLSUxM4iJ
	xRG7/FwPBUK4qG3PuereA+0AoaIkeECGFPdjuOCv/nDTC2UwtyVFZ+bCTYKn1dcj
	9u3xfA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2c57v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ea747d58eso5835130241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756178; x=1774360978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=JlxQro/e9IOaMSErUmAZBJi1UrkbgEfufTslwvom0dfz9QRjjtfXJDHvSzTK0Xfzyj
         arEUL1H8ZYsX2rX4m6nlWneR+MUMRx81j3VnDf0+o5vi2T71vmBdX8CbBEiDRswsPo/U
         lEUtqvkQjzPGo6dXYb7SoOcqcl7RmEXXHfb+hoRw07nxOF2z70ZAuiL90YtaUhkZ2i0d
         3FzzD2QAch8RgcmQDfFI9/1N48yLtfaMxK2j0Qvajw76w3vnNQt3uIJtw5Q5IX83gnxZ
         iSZxgAaZw4x/JrrlujPVwBlP7oyEyut8HSU/qwLZWb3cdpvSI979sE5VWmFU/2yaQcaJ
         KPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756178; x=1774360978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DQ9O/WxlrEXbsvKUWZga3GBiGSWqxH7TMX/h6DSnlY8=;
        b=auRTRd6VUl/UO+4LfPSidWoaiJx9klvx0uo0NbWaIBY9FL3JPnmvUlq2gtYSCZ6Wsv
         2pDl4KzbSuFi65Z573ozoSNgkrsvFccBx2sfSiCyNQ2P5GPjzFNTLF7fAkPRPNlOnXu6
         j0swAsxalWxHSGv+bQd5pATp7wJxgcIOH1R3ym5wroqVjhfVUZfFz8d9j5l3H1DnQT1u
         pa00gPugnZblrAdlbN3TIWe39W/U2FqG42fY6fv4Gb1Fnrh3yEzzoa8TqNJ9wIgqaWRh
         8MjTuYDWGnT488kjpH3IBomWKY3loHURMyXKTJ7c5tljGq8fhuJBStdAghwzapEZBzh6
         28sw==
X-Forwarded-Encrypted: i=1; AJvYcCV3QC62q2ely66VUvIlp6kLuocd8xWJS3vyaV0O1Je44iM0aloK2/ALxzUJL1WbWkmtfF9vJrxEs3W1hDRyfHqd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu9PTImlecqfCo75IAS3AnFcL06XbfM9HyT5+zS6CHEeEnYzwE
	JkWo/oUIQHpw0y+s4PgpsQ0/STuhk+o6qPs02j4ZKKV5NiE/ioAv0VjXtaek39z8KH5KKYF/HT1
	e2nOIvEqpcn8fo0oJQQmZMcKwOl132oaJrcY8qYlZZ7uq5BvjZ8pYI0N+znIIbZc4OlhnlEm9Hy
	vSbw==
X-Gm-Gg: ATEYQzzzH7LWUG1C7Mv0eaTYnifIjkgwU7XDhrjuaB5HTOptSVfVX4kM1AlBvChfIfM
	X0l0Xpi4TIa+MOZLW+f38jW/8pYf/X+CalbB1wxUaXMd3sk60nfi2WZMu6pU1GLGeJ0FcNLStzU
	xW4Zd6Av75K7FwQgS5tZ3hXInCNBuRbO2xDTY+w4ztTpPzkzw24cpnv/H5BnuMNNguCvIWFvvsO
	qAJzjZk5pBdSOkyP49SUgkdALtA4992hkp5nncICwm9pViNa/HfNLaJ8LjSglorLNL2wPjio+Xc
	PjSXR9pOLRzgPUctjE7v3ac17Wzv9+LmfnIRfmb5I+5jorD4f7UANwqwBZucEvfDkw2/6x3HGsM
	Hl412rL4jXeC+FKvOWU23AjHQZXhzTWqFG9S9GEWQYiWeWz+u+XCF
X-Received: by 2002:a05:6102:510f:b0:5ff:17bd:9e83 with SMTP id ada2fe7eead31-6020e236a11mr6181951137.14.1773756178120;
        Tue, 17 Mar 2026 07:02:58 -0700 (PDT)
X-Received: by 2002:a05:6102:510f:b0:5ff:17bd:9e83 with SMTP id ada2fe7eead31-6020e236a11mr6181878137.14.1773756177471;
        Tue, 17 Mar 2026 07:02:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:15 +0100
Subject: [PATCH v13 08/12] crypto: qce - Simplify arguments of
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-8-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV74v6AQxf7crq9AWxEvZhNv4EhOR72KDttI8
 q/1nsz7n12JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable+AAKCRAFnS7L/zaE
 w9dXD/47ORISq1CjAaQ9sUDFL6I1kw3hWOnPBV2CWeej4dNIPVBTHadvPvyqpoIS436Mi7LAyjP
 HOqkol46skL6jyZCAJtQDYY4yjjN2bH52aNG+GZ0n3jGkrqCptM0K96l4UObRAz1h4HTD0nu95J
 FU9+RnrrdZIylaSCyWHhG/JKDWJXjtHhIWkTMS4qlxItVkZIfRidt1EeEvnXfv4MQY3ZRsfc6vd
 1TQ1miFuQ3VN0ow8EEGUKJci+qh9gqF8PIpyAV085Y7ilsXbixV8KBXOimussoptXQmvltZn1qQ
 xTFFVTfxLSv+MfnEv2jv1NEboVyxE6/F6oMFSKrEoiptInuIwlCBV0OnneiZbY0lwvThs0kYBJi
 SMWEBKg86VbgW35Zv1Z4Scb/6PWI5zZJ5lILy/4hho6AE4lhUkUbdkTwmC/HN/rPOr1RwSusRKG
 QbCN/psbd5VoNUetU4jFsTCaft0wmGmTBcjj6RSP4fGhJpKYHAJLlYGL/BRXHZVBHwJzCx48Ef6
 KEr5Xib8bhpboYJ1IyMilK1aXmfl3ZLLWxzrVr2YFxXy/iVK4cCAkiW+J4SI7FTkcf2ksgwLwKf
 0pfHvPPqG307MrLoCqKfg4BiMoOB8ixIXySA1NeK95RU9jQgwuZ7J7F8j99MHGmxefd9RM1sgC+
 NBcINfQUca+8n9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: mSkJNuBdvsyEpP-UQrYz_WQHWpJ2Wx7z
X-Proofpoint-GUID: mSkJNuBdvsyEpP-UQrYz_WQHWpJ2Wx7z
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b95f12 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=KrkfD191a8oFwBap4LAA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX1xulY0PqwSN6
 aSrFVjWt8h4SY+OpsYTucEyhcw4ArqedfdfB6Kaqoc4uv1hVZxP9zk/ed5QXL3Au91yVb2uy+dl
 7bMk0eJ1O8n2oKjkOhbcC468hrOu7Nbg69z7DTw/w/Zr/lfUdQwtDDwIk+m5Z2gcOhNHmY7AWT4
 TL9pZF/RGEpD51sZpq4EUYWpgPrZbC0J0G/nC5wfBsbVMUXIl0wCZ9nPgrezrTiFbn86hHjylpv
 Hh0rwIuzwdSIJVt/vhmEmtCUMmjEskQ5oTkT8McIXnYZ8IyDzTKHwj0Q+WySeKe+WzYxPdVHsN8
 AqJLZxnNkLXGT5DPhxVXDuGIiNbtgf2TI0Z7kunQeHm3cxu0PmtQ+ePxVdzQrk6cYaBKfwJSuWP
 aXjHeGwKOFsQCwTQhuX9Cu9Sd5cjRhI4W2tD4y1SaKn4h1dym9W0UDvj1QCe34XQYqE2Zqy8tKp
 J53A3YWuCgWdxYiY1qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070259_806409_EB913FBC 
X-CRM114-Status: GOOD (  19.75  )
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


