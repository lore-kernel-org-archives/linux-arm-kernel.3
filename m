Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B15CD7497E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsfR0Ng+trtCxWXr8RJfsUoS0vYwVZ8Rep8jGuwkJXE=; b=HNSs01NJ/M1O/6BtBbhCULJlns
	R6KbwBTVafYdnlwn4HghAaHDxpmX9ukrgZpBXtoxh0NdkCJymTqxBIfFNIWBqXxuaN9Xy3CwfFbxM
	g31QhwvOBsFoEOtUr+OHjs4TqwKDEgB3aICCRaHV3pQ4fVqNAg9TYjwLs0N3AdyBWsArigUwiRRQX
	T7NVy4wbFK7R7mbUIJgQ3GzV4Yy0DFIMG2hrqVzlhJvmRwMaqlR0jpkhU/QDeV4YtOssvxI+yWJ8L
	yUvKiol8I/PlgE/sWM8qekvGdg3CkWBAuzKNDWDCfvPHRHFZqyDbnHnKFGhlZ9+YA4shKOi8i/hFr
	eyWmtFLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPs-0000000A1fY-2drV;
	Fri, 19 Dec 2025 10:08:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPm-0000000A1YK-0K5A
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Dec 2025 10:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AsfR0Ng+trtCxWXr8RJfsUoS0vYwVZ8Rep8jGuwkJXE=; b=gnohtQL51K8BMU2jXJ2SCWNujQ
	5UJ35KO8ZhL7t0SbS0GMkMjHNu0THqPnt+YGM6zYVhi1Zci0lxaYviKp9Iw2N2gP3FjG5Uzmkz5Tj
	BQ6yE+bjrT3a6DczYBbz5uNfAv2dJnvBOV7/WIzm6Uq4icaUPoqABs19zwhg6jBvx9U60qTctSSF0
	0BEkKVhGrreYNnUQtpgxRAJolMHkk+L91AUc8xHFgwljYcCzI+CQCINWlMD2xSThVDaLF+AQd+2mX
	zFU2nZVPrJuYO7QwMu3uQauuzz8XVvQXHHgSgSsK7vKWZ7AvWLPzfJvRPrY5n/MILts4JgZmztN3H
	T7mGPakg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWYG-0000000AY2s-0Clj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:13:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cFMr3991947
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AsfR0Ng+trtCxWXr8RJfsUoS0vYwVZ8Rep8jGuwkJXE=; b=TFDeXbjrFrYgpgLQ
	kK3ETByF+XbgHvp/3dLKBWVjxW3fH82gF1t+lmI53Pr5Agcbtq+N9wq2Wwb0RmfI
	vqZh9sYkrEzaIPNNmBH7vSGypn4na/+f14Nvsf78mtYHIsqlTYAH5YX8ioYNVGVW
	fTVWUmitFXyDtuZtS8ow7tJfvaegetHjjjALTn3sVgd0dD91rb9tJDLJrZKEFoSW
	oon0J3WKd/v2l4cosJq9e1wIy9Zpd0YXK+G3Kg/4aWUQJlQHUH89i5V28jaxD+Wi
	HIbFak5aOAfH29Su5+1+WYJtUTwZbsX8akWvcMGju2zjF0x5Ydq7eaXfeai5UCtj
	NFKrog==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2da6nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed79dd4a47so30836451cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138921; x=1766743721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsfR0Ng+trtCxWXr8RJfsUoS0vYwVZ8Rep8jGuwkJXE=;
        b=KkPx4+IOZdlphnhRHpFhsWbnM0+wELfd27XL9C6Sh5jmc+Xv99Tl/3YvN8j4Lcuig3
         cPcvB6qpEAEsJ0C/Y15vsxmxgWmqU47XJ7yGdZ1MqzjWnj8dWwWOEVv8RP1PmPXPbhhs
         bur/CGPB54rQHsHtwPIYgPQrBYNNnhaIP0mHWwCh1Hm7Ar1vgGX2AJ8y9j1/3PKdR4yG
         nxJGrOWTH9zgMLrwSDhnvVnaYda1a6MqOin+INy8Ng/G236lY5dEyMbakBEcyhyuCgur
         dyO3nqC98H8x+GQwXmUD3JjTshVH61ngEQqU2Ziule2hIMIcAAwiLIM0H4/zMganQkRx
         unIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138921; x=1766743721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AsfR0Ng+trtCxWXr8RJfsUoS0vYwVZ8Rep8jGuwkJXE=;
        b=XV+5T+VN4stKUjOSXvEC2bzBvkFm2NGo/BuEeBOGgXHREe+1TQrzr8aJqQkDaFV8MF
         Lv1kNRa4ukaqKnmhnZlsR48yPI02uddmBUlgllcFpEyQdzx5auo1q7WIEc7XySeRDhnu
         X5bnnrTwJi+idJD++70V7zWvV6WbHeRd4OaAl52SMk3PCVHOA2opTv2OKYqNwkFLhJMz
         tIKd63iNxttZJ/44EWHyHpt04UWUuG/FGR/9Yz+/1WmOJmHtM/JmEfu/8Ma6TYTUV6Ai
         FTtKO1YHoV/kI+hxCkFY826QVV49uzaGC/M7IZbx/1XTm1L3wAXNSOPjJtrWGxPcSzcK
         G+EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu6yllXLUd5jAvYvNjuYpwv/JbEmAQ8ymQaH32ziPniyABlk08l+igi81kb7+8LGV4lkwab0Dze/YGVrqf990i@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ1YtSRWVhVvhWsBA8KbBINKmpM2oNqh5w4FPkwE5kUPhUumOh
	4N/7tC5Wxh9fmPL7BV38Izm1Jnxz6k0u1ChaHaI6ohQDWNNNX5yIFmvQ1tbq/pM/EfeNJ07lFNT
	jNkA0SRIVpyVlZOTjB19pwmND8pa8NDQZ2UC0Ig87y8gTHbnIhYVIMohrQgUpvdSobwFwIaP7Ob
	GvgQ==
X-Gm-Gg: AY/fxX7l1mx/FVGg0k1XMwsxBRe58wr9rnu9Srcda1yRi149L0uz/TEBM4O38DoWmYi
	hJ9xcPczHar2NkCz1s5qsp9F/kueX4fKhFvbBU/WTj1GTBrjwtx4YHMsPpOePfKAwaLZ5Px5khT
	ls39CYNGX31JHcqlvGdYRbQpxHcVUOIGPT6yNhw/834k7pme2PsWvPcPePBCEVTHgUesFDyH0Nn
	me+RpuPI80v/4Ntsh1v7k8/cyX6gZQ6S0890tAOeI13bSgQxOY17eqYCcjm73P1+px8bqpnydzn
	vGq+Lbpg3hQRp6UCYkuMNFruafOxnYslRKO0uD2P9Xezf6h+oSef+arGOfvIBLp2QUEmzZKUnvN
	QzYkRnGtefeKRu0J+5C0ub/eNu1s0rzjVZY+d3g==
X-Received: by 2002:a05:622a:110e:b0:4f1:dddb:db6c with SMTP id d75a77b69052e-4f4abcd2b29mr28277811cf.17.1766138921193;
        Fri, 19 Dec 2025 02:08:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLWIIZH6dn2g0LJ7sXhg7c9rCUSr4NrjHFbJy6f9ZZtbiONrsZjv0bkNSmQnx+9j6jPiwdXA==
X-Received: by 2002:a05:622a:110e:b0:4f1:dddb:db6c with SMTP id d75a77b69052e-4f4abcd2b29mr28277501cf.17.1766138920762;
        Fri, 19 Dec 2025 02:08:40 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:49 +0100
Subject: [PATCH v10 10/12] crypto: qce - Add BAM DMA support for crypto
 register I/O
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-10-ff7e4bf7dad4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pYNdX79IsEIfqFLc24whwQ5VhyXqWC/xkdLuNIvPWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQWWy6tmDN6lEKJplrycxbz3c3ipqiwC7uVN
 C4G4SJfw0SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFgAKCRAFnS7L/zaE
 w+O8D/4sEb2NQwa5xHp1gAD5kXSpQRLSDjZtPoAONLsTSMLr3gDDE6XsCixHEZh0P1rp44AY5BP
 QOXs5KuYSdM20vviONmVFZ4vzvf0iuUwYaaJgaSl8ajE8XX6DSkSYU/BBUz8OXoYpaVgOxhbUvV
 7dJan1tMesdNmlH0ZM6pHhLta31CzNDwvrXIrdUQJ5Dy5cSbcL5IKipKBVGbsHreb8qHOh0SASP
 nC8/3x5KMPUgrWHcNIXq8pTiTnttaESioP6AZ7sZmISo0OqI6MlU3GGJBbR3rOHbhYPH+mUFykk
 Dmwt9tNPAwGYHgtWWlCvN83RhFdWhI4yf+4j0N0X02xQoIZgqDEaRtvRGc3H+C3SNJtJ2tnIe/f
 FBAhqW6cLgyWJPve7N+rLw2JakryNZIFPMMX5hlSZ7PlJbRG0qu+6ulsVxE31Oyxkbg5OBuRC4j
 wKpVsz55WilzEHK8VGHFljMynKI+gEPQo5xxTNFS2ko/4tNgPRe3doq+t8qAO73RvbkK9HY+SG9
 Uenf1KXuYj6t5Npd/a1oh9/JAfWO1A8fCQXQMlRWQMoJGBtYLudKdsw1akwVY0DkuYAGzTtblhq
 VRh7pPUMmfjI94YjUsskfxXExOTf5/A24F2r7Tal26r+3sDSv9aYAvS6/kL30t3D08uP5dnP7y8
 Y9X72FCrnKj5Kuw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=6945242a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qGjQl-v-kXvwofw7MDAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfXxTjLKsF1Xpgv
 8jogHArgogtgWwLkwHv/kCZZHFZ+bmCWncdp7GsNKBeaftkdHrkYBQ+ulJUMAFAXBo0H28TA8iV
 9GI86Jw7YYP9EsDtxOxdmGzOwzDqDdmIg14lTu6OsHSSpc5Myjtb8QUi1Ru1BBdk5g3HLl07AB3
 6syia2RZqcCfKXkB8ZbWY9d1isnJPzgGJJNRCYKjQqg5ykalNbO6hCwEQcRX7238nIDkRo2HCuw
 e7/BIZ+XI6EtOhet5MVoJ5iIKoin/fdvPwiFTaDmU2StCrlNX+MJlLkwQl4itV+AqyhHadL0C80
 jOFhAjuWX9nVhPHfQT5bj//cngq1tQ3R4DikQX/DUHRl96072UPxa7y5V8htoOEk9IG+eMHNMdw
 B93yRw2c0oR5Njm2vihctTc3TGX8qbRF2K0ataFYyvsZwgthojJJoZYDU6Vytol786I2HafMM7c
 8Cp8D+2Swn+CAmZoC1g==
X-Proofpoint-GUID: A5_NQ9hgYZInEocrdJW_yvhSuK-eGOHI
X-Proofpoint-ORIG-GUID: A5_NQ9hgYZInEocrdJW_yvhSuK-eGOHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_091332_501813_3895BC29 
X-CRM114-Status: GOOD (  19.60  )
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

Implement the infrastructure for performing register I/O over BAM DMA,
not CPU. No functional change yet.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.h |   4 ++
 drivers/crypto/qce/dma.c  | 109 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/crypto/qce/dma.h  |   5 +++
 3 files changed, 118 insertions(+)

diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
index a80e12eac6c87e5321cce16c56a4bf5003474ef0..d238097f834e4605f3825f23d0316d4196439116 100644
--- a/drivers/crypto/qce/core.h
+++ b/drivers/crypto/qce/core.h
@@ -30,6 +30,8 @@
  * @base_dma: base DMA address
  * @base_phys: base physical address
  * @dma_size: size of memory mapped for DMA
+ * @read_buf: Buffer for DMA to write back to
+ * @read_buf_dma: Mapped address of the read buffer
  * @async_req_enqueue: invoked by every algorithm to enqueue a request
  * @async_req_done: invoked by every algorithm to finish its request
  */
@@ -49,6 +51,8 @@ struct qce_device {
 	dma_addr_t base_dma;
 	phys_addr_t base_phys;
 	size_t dma_size;
+	__le32 *read_buf;
+	dma_addr_t read_buf_dma;
 	int (*async_req_enqueue)(struct qce_device *qce,
 				 struct crypto_async_request *req);
 	void (*async_req_done)(struct qce_device *qce, int ret);
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index a46264735bb895b6199969e83391383ccbbacc5f..ba7a52fd4c6349d59c075c346f75741defeb6034 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -4,6 +4,8 @@
  */
 
 #include <linux/device.h>
+#include <linux/dma/qcom_bam_dma.h>
+#include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <crypto/scatterwalk.h>
 
@@ -11,6 +13,98 @@
 #include "dma.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+#define QCE_BAM_CMD_SGL_SIZE		128
+#define QCE_BAM_CMD_ELEMENT_SIZE	128
+#define QCE_MAX_REG_READ		8
+
+struct qce_desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
+};
+
+struct qce_bam_transaction {
+	struct bam_cmd_element bam_ce[QCE_BAM_CMD_ELEMENT_SIZE];
+	struct scatterlist wr_sgl[QCE_BAM_CMD_SGL_SIZE];
+	struct qce_desc_info *desc;
+	u32 bam_ce_idx;
+	u32 pre_bam_ce_idx;
+	u32 wr_sgl_cnt;
+};
+
+void qce_clear_bam_transaction(struct qce_device *qce)
+{
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->wr_sgl_cnt = 0;
+	bam_txn->bam_ce_idx = 0;
+	bam_txn->pre_bam_ce_idx = 0;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
+	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
+	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_chan *chan = qce->dma.rxchan;
+	unsigned long attrs = DMA_PREP_CMD;
+	dma_cookie_t cookie;
+	unsigned int mapped;
+	int ret;
+
+	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+				  DMA_TO_DEVICE, attrs);
+	if (!mapped)
+		return -ENOMEM;
+
+	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
+					   DMA_MEM_TO_DEV, attrs);
+	if (!dma_desc) {
+		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+		return -ENOMEM;
+	}
+
+	qce_desc->dma_desc = dma_desc;
+	cookie = dmaengine_submit(qce_desc->dma_desc);
+
+	ret = dma_submit_error(cookie);
+	if (ret)
+		return ret;
+
+	qce_dma_issue_pending(&qce->dma);
+
+	return 0;
+}
+
+static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
+				  unsigned int addr, void *buf)
+{
+	struct qce_bam_transaction *bam_txn = dma->bam_txn;
+	struct bam_cmd_element *bam_ce_buf;
+	int bam_ce_size, cnt, idx;
+
+	idx = bam_txn->bam_ce_idx;
+	bam_ce_buf = &bam_txn->bam_ce[idx];
+	bam_prep_ce_le32(bam_ce_buf, addr, BAM_WRITE_COMMAND, *((__le32 *)buf));
+
+	bam_ce_buf = &bam_txn->bam_ce[bam_txn->pre_bam_ce_idx];
+	bam_txn->bam_ce_idx++;
+	bam_ce_size = (bam_txn->bam_ce_idx - bam_txn->pre_bam_ce_idx) * sizeof(*bam_ce_buf);
+
+	cnt = bam_txn->wr_sgl_cnt;
+
+	sg_set_buf(&bam_txn->wr_sgl[cnt], bam_ce_buf, bam_ce_size);
+
+	++bam_txn->wr_sgl_cnt;
+	bam_txn->pre_bam_ce_idx = bam_txn->bam_ce_idx;
+}
+
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val)
+{
+	unsigned int reg_addr = ((unsigned int)(qce->base_phys) + offset);
+
+	qce_prep_dma_cmd_desc(qce, &qce->dma, reg_addr, &val);
+}
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
@@ -31,6 +125,21 @@ int devm_qce_dma_request(struct qce_device *qce)
 	if (!dma->result_buf)
 		return -ENOMEM;
 
+	dma->bam_txn = devm_kzalloc(dev, sizeof(*dma->bam_txn), GFP_KERNEL);
+	if (!dma->bam_txn)
+		return -ENOMEM;
+
+	dma->bam_txn->desc = devm_kzalloc(dev, sizeof(*dma->bam_txn->desc), GFP_KERNEL);
+	if (!dma->bam_txn->desc)
+		return -ENOMEM;
+
+	sg_init_table(dma->bam_txn->wr_sgl, QCE_BAM_CMD_SGL_SIZE);
+
+	qce->read_buf = dmam_alloc_coherent(qce->dev, QCE_MAX_REG_READ * sizeof(*qce->read_buf),
+					    &qce->read_buf_dma, GFP_KERNEL);
+	if (!qce->read_buf)
+		return -ENOMEM;
+
 	return 0;
 }
 
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 483789d9fa98e79d1283de8297bf2fc2a773f3a7..f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -8,6 +8,7 @@
 
 #include <linux/dmaengine.h>
 
+struct qce_bam_transaction;
 struct qce_device;
 
 /* maximum data transfer block size between BAM and CE */
@@ -32,6 +33,7 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
+	struct qce_bam_transaction *bam_txn;
 };
 
 int devm_qce_dma_request(struct qce_device *qce);
@@ -43,5 +45,8 @@ int qce_dma_terminate_all(struct qce_dma_data *dma);
 struct scatterlist *
 qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
+void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
+int qce_submit_cmd_desc(struct qce_device *qce);
+void qce_clear_bam_transaction(struct qce_device *qce);
 
 #endif /* _DMA_H_ */

-- 
2.47.3


