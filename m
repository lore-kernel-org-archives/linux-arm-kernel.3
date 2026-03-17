Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9BCFD8748
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=jIakp2zdFo+xgMwoq4nUMIpGCt
	0qSvzO/rwP00s//RRO9JUOwdSkJiKHRLyqyrgyIo/DE6XYf27TsLRLkkJnRBkcPKqlJ7yFQ4PQ0ew
	FjytFv27n6djv4tmjUfQDwcgNT63gEI8XhAAd6YgHsc5YztTmaL2zJBfif5ktmh94fzP6TH7ZNqeG
	muXn7HmYuSD3ORNRIxOBMKNjSxF0UxX7V+8CFmrCwqLlEbKJIgAAmHd7/m0h3e15nR32ycdXRs7Gs
	HmSC3Ie5nzhCIekrOFeFUCmjTuNCsLyku/DgESgK+IKbB98ERVuefX9NrpcwnHbSTdO8ep/FhNc1a
	fz7iJF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0r-00000006UzH-3DCu;
	Tue, 17 Mar 2026 14:03:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0g-00000006UpQ-17h1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:03:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H83K823295281
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=EGz+aa29zlBil2m5
	eJtCvruY8xpVmLJNEFbZoZ/wVHvSvjr3+pp9x+bQH/t2w4oeExip9jIqnAiVnHvr
	60QaLxx0nObYr8jXe5dQXvOG/3tl7tSwvSor2oQQqVPbgmnfleRfC/Gbz1VdfCK5
	j0zZ5D9Gix7tB1WkVSLXE01bDMi/cr5JX1Zyu+qv1/Dru+Df/0lLQOvuBkoHk4do
	/azoLuQKlJ0l9ALhq20AQsIcnKLDSgFQdMQxApW73N1vo5zsMDKfrWn4xpWWx/9f
	H6PJ0xCiNRheRw/BM6bUeiVOjw4/V3MQraaC7VU+aTWXlgMHstOnNiWBCacWPvC3
	4JOhcQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy4a1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:03:01 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffcb3a10f8so6119857137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756181; x=1774360981; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=abJoQtV6Hmq5JAowhLqA4nnRmCeSNbMvpRdTx5HXPow57a+jXCedlVwznJayGcy6HD
         9+8RTWyHwsz2LrHYgVb76XOrbjOS6sKM98qoXF7pAm942F9n8Y7AH1yrsw6mXMzqUOgQ
         G0ZhIkXnAqGasvn8oryEqDrJGCHSSmnl9fDDc/G+6o8ffugqIHsXxRCWIkevKNYXB+Xk
         Vh34g55sWAt2rXukvFJ+ih3mxUaO3a54DIhK2R+kZJWMgEwGfyDbkkTqe8MTy13jYHex
         +sznj9rkdVnRXNK9G10pw2OLTc8+tlnxrQkT5gn3PJhIpynxShAZsmpc4XNNJkBS7dpw
         G/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756181; x=1774360981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=aOEJ6xYpjGvBXICL6k/gsdaihX20XY8Ql41UwWp6XGHtfXOGvv0l9IzL65d51wibys
         l6f040KfU5FBjeDzdFHpnOgLFmVudnMBCAGzZvOTYFOd7VXFyDX4Ur/UAkPHQkEi40vU
         Sn0h487TPBbpLxSh0/svj8yEs8NH1uYSKTjSOY9V74opqEVxG5Z9nRccHqSNCJAIUlvX
         gHxRm3Dckf6iHjvmfvVPrKjfbZ+d6hq/B5A9kyWgR2AMKs/2RsLKltWdstrA8p4Et8j9
         S9ArDGjnzy+TemTX/Wx42pnyfq3zTAE5ZAurdD/brTrFbKq1s7rWQ+/aworkCrRJMBHO
         ZGmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiyB1T4hghGQDYZ9WAdCkmgwtweaxtaWtHd77+svkt0MaUnT6q+FdRTCFxwld0SlKv97DI/4xSlFV7+rrYwIeq@lists.infradead.org
X-Gm-Message-State: AOJu0YxWh/6JFECbH39OxvYplL3qxudv+FVEchNs5WcoiAMhyimJTEqQ
	NGMqrAudSX4SHNrLRKcSv0x7AQqj1TxC0x2gv9Ay/8GPx+s21ciSjfIfLASM/c21G8kdss73ln3
	8eIM06mFNc9pf+gpLiK/2HciFEwvJwBsm4FlP++Ok2V1BbV2nIxTg2xKCkC7wqdlW0Vo1y2Oejr
	l2SA==
X-Gm-Gg: ATEYQzwE6fL0wINndtQasDe5udVYwB2MDjX4XZXv0U3DuUQe7bHQdZ9nkbjtyWnSsa7
	nM/KxhjRYCzLqYWwN5cD5yTekjS2HZAbwb0IXnAwA5lbQXsn1miy5YmOU8B7AnHGWhVMzTXfctV
	okOVidwJmUqzte5AWq0V+8mnoq7xp9NoyC5NDdNSW4JLzduPANLhta3jSJ4f6iz2rNFf05Kpp/6
	ANxVCb7euvK9hDndf3fwr6kUV2sziKWiaDOeKRFsjkk1x7WDR7zSeyil4FJvvEiiEzSQa82wRUs
	8MqjTkonX8Tfa+C4XUhcxoCnDLHFIOiwDmVRoszcQWXR5R9wr+Ey3W2Eep6ZN+HAGuQez/e4FDH
	Ha51/LgIKFWEm6HrCwngr+5jbn5L1LBKHe4Zne4gHksC5ehEbQoTQ
X-Received: by 2002:a05:6102:3e94:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-6020e501571mr7431259137.19.1773756180551;
        Tue, 17 Mar 2026 07:03:00 -0700 (PDT)
X-Received: by 2002:a05:6102:3e94:b0:5ff:befc:6769 with SMTP id ada2fe7eead31-6020e501571mr7431185137.19.1773756180060;
        Tue, 17 Mar 2026 07:03:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:16 +0100
Subject: [PATCH v13 09/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-9-0968eb4f8c40@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV75a/3hqKscMttJVdIpHU0Ak2Rn1jbf9LnQu
 W95CnUaur2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable+QAKCRAFnS7L/zaE
 w2XtEACBewY081381qeqX5U47HXcuZKex2c6satG7MyFWMealTHUY3EW1swTfruzBAe4lrO4rP6
 93JvwRd454mu76difO54tSmpYX2kWMT3A1cKuy47ag+D52tLLRdf2FrLwjIVMnEPEMEnGppBJlV
 nqEB3a0Omz2xwXEeKi9RWFskSG0stfmIMvWg1Khgb7X0mi2WkEh8DU7r06mbS7TVH18Y5EqL5Ur
 PhYFzqd8VNdNmV41K1PBY/G3xlJiLgsq5VEC2k8qwqz7hLmLGCHgKtfl8DpLlq18G/rxSOCy0Zq
 efFms1UhJo3WBqpoXBkFuJZxpNrjL4LbSksIOrU2YTzur+p3zQgICAeUDYxkm4UKSsufe8ADPsN
 y8XW3LA1P6K4YHqGwbq2+E4QRP77TA67KSobE8MSUlnEILPcJEvxG9eT3J0sGOEzdYcuYdN9/MN
 bHlW1Z9LStS4t/bmPnRYJH8uCAZOjlU+cjCK/+XTW2P43ASegV8CqbK/kc1ja3oybX476cW+dRp
 lHm+VSbjFfRNaxzWVeFmxna/bJj+TgYOr8dmjYmU2HleCupjq8O/odr2awqucVTxpHqaRUcJdHD
 6gP9jYe1UetONfiII8OQyZhJicACUml61IKwd/gOUz8R3L0JNtv2miSDbAjfr0MfSyTTz9Nf5de
 7lCvFlvWj6eC93w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b95f15 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfXwN5e0Nyl3juE
 qqMQlr1jdsK2LmSb770skmz2F31eoy+wEoEpXbMgrXk7rLh3Xb4uGfzo4ueJxBH+teV+lvnsGGq
 1IGrQdbcqEuOorXwjPhBNQ1S+57FZmxKWXhXTdfTf2WlbFeWvmYkpZF813F0OLdKuijJqtzTBXd
 9ovVJ1JZQCRh4RW72tMjcLy6Id8fiLhIo36Oojq3Pe4CQrTBHAFL1qB0n5Ph16tCZnidIPfKC5/
 jOZGoOxzBdjN71/qsy4aA9jaAEVoey+W/RmIvd4dvBsXFc8OffaM4X488D4TI91YPrMoksgL2jk
 7NyNel/KHxKEZ2FBwjRCCn9nNIGJQQeSWcmuRU9vAvhOGXJYOspT+u2xEbMw2k3kwaBqAo4++iD
 s3CB2CwsfvEictzzCf7QxgoPLuwNJG7GUiydnQ3z4vMM1yPlnypnaexn6PdMLxfIL6ZSQgDYpWW
 WWrUTm5MwnaJK7aU8tA==
X-Proofpoint-ORIG-GUID: 8W9YgeoAxaS3VMZ0f2BMohqPHX3jUwYV
X-Proofpoint-GUID: 8W9YgeoAxaS3VMZ0f2BMohqPHX3jUwYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070302_435631_C01A33DD 
X-CRM114-Status: GOOD (  14.28  )
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

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


