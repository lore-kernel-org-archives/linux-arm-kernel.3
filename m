Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25D6C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=uJ3GZFyuRO97e0uSxEf08ViKUG
	j0vapQgVosu7pfQC12UEZWWo3GaS8oVt01Tk9ltO9Byz92VtsaYqDN8LC04RO5BiVcfi0RR7hp8PZ
	B316cr2PTgw8MkfsCdxvRccY3OFqLQ7nltPtLed2m+k8X3jzYHVmqmTKPj/r9HtqUV1YxRqxGE7dK
	8cWu7hbECKjwgTYZD6YV2/+oZaFMJFGwoIyklOGqXI9yYEWTlfOH81K96H9i5UtaYcv4Vj1jmF7CU
	FyKRWWaQytmzK3bcisKq7ZIWamlE4EQqB+dMrOfbaPRYhCJgxPykzYadMbpBcKGa/OsMvzfkxks+I
	E9R45vcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oj-0000000EHoQ-3tCc;
	Mon, 29 Jun 2026 10:02:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oJ-0000000EHRi-3CGh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8aS3L2368197
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=S9OAkwAIYEUAKT0X
	XLf4xVUVvaEN3iAINq/viZfv+lfc5YKX41m2dzKgUfDAgU0J5wkw2bEjlpUwTi/e
	/xtu5eI2Qb4QcOgI34TYD65OO41Yapkbtz7Tj4okHqx7ETJY8s471qm/h1UViPz/
	8SW/42sMOorSWWoNocJ2EI1kzb5z/MmAhWcrlu0HzlJrNMWquOGQd2R+WEH1oWf/
	1R2kzmleYqHygnByGYc5Fv0kCGVQnC362hgzGTnj1sAt87Ev4dWL0Go9QQmjMprd
	kWEUzkwZzxb6QOlKr7FjjrZrdQ+bwYjgrcsU4limihaFggreztoT7KUape3ctTF2
	pAmDZA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrbc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-737cd7b76ceso465332137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727310; x=1783332110; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=RtbwPbwqs3yBx5HEHftIVh0y4TGEpuLUZtb82XovjLFGjtc52QlF9zb5ziWT6IhMAz
         PEJm0T8V4kbytJJX1BBwnr3FIq+zSaFFbM1mLQKXr/dMmeYx1msGF3okYAqt1ZXZN8Ld
         Q8sQYSIfUnP99MIJRTCvdlgf1VAuUWCc1sQIfs9wKHCp5XbZKzeFT3Wc6NzVQec5EfE1
         awSiSPv5QPFItEhv/NyQk0AW4NDXd2YJNUXie4evdIpkDnIMZxhtJUrpr0rLjX9zwhad
         pMOhoa9C6VnamVZx1AeMtiV7sHlMMmxx5B/FKkh1kYcCpax7zOnsktZWdv3iADWx951+
         0SFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727310; x=1783332110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=RjVKANO0Xb689rf21EU3axOUVzxTdTWNzg5r16SPxXUwHRTfRjDkqpU2T1YMCQ3exk
         Btv4nF+snSmMOyyNG5A+DCo7yDZi3Yfv3bAhL/of30SXkxI4X5sreWdcqJpN0ibESvrE
         /E4tkCjiLOakqSySLpCvpRW5bma6S27yCaoequIazeicEKfyY5g7HUnbjzbYL7AgO6Zg
         UXJE9cGPTQBQmyZsrVPwF/aldOu1BpieT9nFc8pPCvPBvR0BJlrS9Sh3h1QZeZbFH2Gx
         r70bLuVXON73P7Wt4fldbmk/2oSoHaSq24rJIC1pi5vx8B+Zf+0H9XHFMBi00omf8LAL
         Abzg==
X-Forwarded-Encrypted: i=1; AHgh+RoA/BSTcthFs73ry7h1ILNAu0aEIOrilb82hBcmC6wLhesR/ZNCPlKjdxX/lAJ9kOUzu31jISC1rc7g2Sb6jjID@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4B95qptJrTYVdKvboC63X7uZTssIpOkwWLYphf5ELgQ9YtatO
	adVfO2LpLnINnXvULNFW4ErkO6CA69I5zpR68vPYWRd1iVyebzTaPuicLjTFORuQyTfYIgsfyBL
	Ux5XyGdK2KVClshtZaHjIcJ3TGPLPciLmHrkKc5UfRyIOSHbu8hhKXDXI3t45Fbn2fZmbHjELgD
	gHyg==
X-Gm-Gg: AfdE7cmSv802fugWIAL9ShnaV5KC0vMSyD2wvGnq9+WkPtVM9XyzZrnw3YTTS9cUf6a
	OUiiUC7W7z0SyDhQ79nBJMb5QrFXSJen0QcR7lNjT1FACp238bvj21bZccPJopGn1a6xLRvmgOe
	nqEYXLS92l0WdDnZ02n8om+2zUPFEuCzyY6Qwh/srhoRpMkjdtBQxIN8CJuVHiC3VPMV3qK7V+b
	c7qBE/TtkBgA1gx5TNBpPMzQddjg2cPGUMKGQLQliRIcW99qDy206/V99zE4vyq7dqx2qq1icNd
	ZZMS5SzN4q1owMFTLHwSqX3UiU/aYkT42M7OP//fFTZTKpQk99JS9YU7e0aUI+MyyVHqHMToAff
	AYL0by7Ylody693dbKmVN+KBlizUqi1LS+5EEwKyv
X-Received: by 2002:a05:6102:145b:10b0:737:491:5e49 with SMTP id ada2fe7eead31-73704917be2mr1657433137.18.1782727310017;
        Mon, 29 Jun 2026 03:01:50 -0700 (PDT)
X-Received: by 2002:a05:6102:145b:10b0:737:491:5e49 with SMTP id ada2fe7eead31-73704917be2mr1657345137.18.1782727309443;
        Mon, 29 Jun 2026 03:01:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:13 +0200
Subject: [PATCH v20 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-11-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJyHpUyHCZ5FJJ/hRQlsQgITkeHIvkKWPNaV
 KbuBe5DCf6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCcgAKCRAFnS7L/zaE
 w0yoD/938nKtrLvcmNtwPBvQtvk16CDWCuP+LKzIDoJ1pGVJuQZ/RvpKJoJ8IvGuihPKpm0npV6
 yRFy/B5DKLO9uzMWhMP3sujf9UP5DvaoF1AvufRc+loKUGDuCdSwYfajZk5ohDrCcHviFV13IFc
 d9kul3oI9n56O1vJ0vGK7j9i0qV+JCGgIVqVqnKUqMA2E3Wox5tNJD9z4uujuZ5l+i1Rw3j088r
 A9iz8vt2sxv2ruvHdGVttLBBAnOyM8kfK/iQEKG8wS5gy1P6COTsx0LMM/vYDasLvidz30/HnDI
 tsMjZXFPjERU0/jMVLUu7a10Y7Jxs0w0LNPdHbszxUgVCSMyIKpZ+9NLVuoWUYoAkMt8lphYCGc
 Pqbz7qnZnQK26j9PCS9GS4J3ZosO+Mh5lfRYDLsk2feOukRMj6CCNSb2nF3e0IMYUKWwhQh/P3w
 LxM/x32vxOsQJPd+NJcrSUq55HiEufJkcsFaz33fiC45FX87y4GrH1ge5HS2K25DldCNNz0BmZG
 ViLggdvXwRdxttzZpuuZXmGG11bRiEg1IxqsZXjvRAlp8AntAdHaDkzYxUf74Zc21W5LDOdUaC5
 PBWZErdoh0wAyRxPKZsv8TAj5UtvSgQYmBubpQaeOvytNOxgwND0igJaYpcMDkUjf/2jGDyELiL
 KhucIneY8ymMNEA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: BxPQVeXAbUxwjQuspQ-lI5k2T8VXAnC0
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a42428e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX7ZEgh92mxnmh
 zbuvMmfanpnIQHvSO3q63oH+hlI5heE6EBBotzZzUNkbvsJDXXZDbh5emBqczRbDqKF0UaTc/iB
 Rvldaancwh5mm0S45r7aDbdks5Qaftk=
X-Proofpoint-GUID: BxPQVeXAbUxwjQuspQ-lI5k2T8VXAnC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXx3qiiqpyNias
 sZ+NHF7PAfPQUQDOWhcynJyJdeRYRy4wbl705QfQ20Y66M35cvP1YcGo3H6qr8zUDNVTzs7bf/9
 kwFigDq7ksBaX/lkoG8wA3vZJ5vOTAkDr7h2ar6Ww8vcUjF7m8+CSebmrw4v4AOO7/0ZZkepOxh
 jpG7v8+O7iOMxTnMHVLQUL0781amE+m9YxJnVlAFRyAknhr7u8OF+J2aqqpeVGHoWg2xzPdYfPI
 ydEZKIrPwoT68MW1ECDY2sqS26htHibNfYQUb8WJYBkfp5aHE1bimuZ44BFxUBXdJ7bzNyOAp3s
 8yrZjyH3BcYDwZ6swVbWZewDxDWzHookyo2cmzOTxrzYtlsXLzddQ7q3J0gaeUCyv7R6AE0fnKu
 yMO12HUL5R06HXhZhxE/8og/OfcCxUPewX2lF0v3M/pJADlRufqP5nO2NJt3JyeOqgnXCi0R7Lx
 cU8VlDosymDNJeLLgHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030154_030556_241BA7E9 
X-CRM114-Status: GOOD (  15.37  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
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
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3


