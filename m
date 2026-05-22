Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2621ECD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=; b=olWJRHpQmTRh3zI2JlGN6dDCIb
	IPp9DTk08vslVU/JpUaCjsXu8rbekb0r+gX6rlvePDN/zVU3ViII84B61eWslxNv8JMzNWXws4U0n
	q9QbQjARHrKP2jZIlKjVMjv92vKoIhTzGCvwuDn1WQgXT1w4Wd3hDyll5vqnONeY/1t7EvW0k95Uo
	qNq3UMblRyoa0OmGzKt8KE0KzZdI+ej4w4wWoudd0q8OQJ/ZyRAjHU5eQzzpU7S61yCl4VbtBqthS
	1K2uRXOtBi3Aj/1um8dt2jlvYiJBznRnxifbFmAlLmlh3rgGJIIZZjr6q/e4xoR0CUkhKB1uzG0CG
	CIWer6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7l-0000000B1L4-2Lz3;
	Fri, 22 May 2026 13:41:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7L-0000000B0tS-1KLS
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 May 2026 13:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=; b=mfqAs2PBvbkl4Q4qib80OCYnwZ
	s87CwybKyUm+i/zWOwkxj/6IKsm2tCtSyii3tV7g3WGVZ1s6pZ/U61FAgaKiX20yfGN0ktr/gpJkK
	M//z3Y5hCNRwY1tsrRpD942CuEtDPJZmlRU/oOl/1qYS7SzZ7IlhtxAaHovRzsc3WKg4zRboTLu5K
	e9Rs+Itma+ZnLIF0TjD4Oqu+/i8alwQ6zwrTA9C/KXZKAeHI5pOIo2nWTrIYUU350f1snSrhxf3Xu
	EZg0DRAfE5x2jH21tYlNfHW5ONoeUJn+BLBuG4RgCYyZEKizZcwfyxWaZ7awOLB3Tq6jIHFys97Ue
	mGagKifw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7I-00000004TsS-0Oe9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9vQgX312987
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=; b=Df8gBVEdewbjthEr
	lmrcQuB/KmhvN82MZyiSw9wvvjS26ar3CQVuZBONp6A7g8c5B9Sto7iums/WHcnQ
	WMA4mZArSxZBuM+NNXQmnMIJfz+tWAzvuEIQkNQw3ivdiX1PVj6oBedalP075z+b
	BDLR0fVSg/7B0cDnAgVhiTjT2mvkQ1qx8mEMksHsIB7mLpmMBvybnrLhICIR+Em7
	YAoBV/emk/Ev+aGBo+cXzjxdSQqSv1u5Rir5/krRbRJ4i57zVc2ZfjECN2w8mH3J
	Vo1lPe9dltbVorMnhLLiExMFZ3OG/ZWrxnCwPIKnDd8yXUAPchXUK452LlB59NSU
	MhiX1A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8834139-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516cdd89225so34479961cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457242; x=1780062042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=;
        b=L3hqPJojtWg8q2jmmx8hbZfov87ZatMncVQ+s/vmi539qAMFkDy7ZuoyypCoqA85Xm
         3oX6iV0BGKGc57U58Zc5tdxtSsQXD6dGtssLQA02NVaveN1zSyzAmo9cxgF9OZ5hZMfj
         W06OhTW2XNvfXCyhQOinKIiBtuPqNrNmqiizkj6FHbRsY0RFcPbUv+A1K1KobUEmh8OL
         ZkBFMi3pvh50CDMfw223eh2nX3ohPxeJqbGCtaX8teyRVlG1F+G0q5Hp8m0Oa+yGPMCB
         3LhiR6k2vEAZt02jp2+ECZP8J5ZIDUGUq38r95X+QDX/hKXSKvIReJQPAy46iFQeI3Wn
         LrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457242; x=1780062042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUFRedyxv2ZWJh5/udxxljoSXdv1UlG0qZX9Fs/V80o=;
        b=bs2Gh/JPP3NMuQl63zNg4J0whvjQwAZClZGHOZ+mp5Ed5A/cdU6tKkGbbKlMO+Bkhl
         l+Ier0lruSD6mFBHMTexmjsfaTHvJjF8cbmu9VRVihc9YvdQr/bGnkSErhRh0KSbwZfR
         pfQN0nod/NGPr1Y4px4xshcj5HwotGPLimdvPdcV068fdDf24KPygjxa8nCK6ROSyjH8
         5nPLGg6aNwPjLLcpu9+ltXdVJD5rqL9cDkMieyrDWaxH3/MFlsFddbz2LANabdY3pA6z
         rasF8ibkTMWGF54dyEdr81xsGwQgaTI72/QdwB+b2mBuRy/3f1oUHD6WvzZkZl1l9Wv6
         sNrg==
X-Forwarded-Encrypted: i=1; AFNElJ/CSWHIFRQPyEH8ob7RiSsckrcA5X1Nun0fVcINObahJ9G72n14PeEbyNDfoH1d4bfFgj1MEYhzpN1fGBNVxaH2@lists.infradead.org
X-Gm-Message-State: AOJu0YztZAAnTdo0BCUOg14kovVhKnw/yYDmWTHUX4hhpm1L5J0I/qxE
	fUcPFhlQjgmdNgdg2mojCRXFEW16eWCZafxxz0LSQVZLYMdWnfvw0rTWO0rJJcfmfIgQ5b/qpU2
	TD1V21xwS/JfLgbLMjkr2g1QWzT/7wMrDKMz4TaN4CzuLdv5XiWgP69ONV+nwvDarg6FbwiQ3gQ
	bK9g==
X-Gm-Gg: Acq92OEo+g37EMPsV4dRHDUJd9K4KpCU9wQdl2gwvqO+Vgfs/o8F7Im+7cYb/CC21eT
	01QjBSSeVkuIKw4tZIono0SiVAVFT9WlNT13Tdow4Q7q23Ml0WotVtDT3xJSwKBBpx3vA+j0Y2d
	VbAOFn1LMGEnmRv+lRXMVvAUOXXRw116vtom00UDlWFvZbTxy8OJVddTolqvaAL91aBar0Epz1M
	6c9TWNMlxgzGKU4j6jchvF1mcrhYZQK8TaH4GzjftR+BPbvPmU35Qt1EbFiV/2boExcMFnmxLAL
	rcBjg7/YkHMg1aHCsSpao/DA7pHeiyBZE/uR5/abmtuk8YM9YCEi8ht4vWlwHaVhRjGzekdHpg2
	Wrg9/ebWUc9313+fVaQZjWIpzMJYaerB+kBc9qQp5BIEdXyHmKw==
X-Received: by 2002:a05:622a:a901:b0:516:d720:4656 with SMTP id d75a77b69052e-516d7205069mr33668901cf.48.1779457242209;
        Fri, 22 May 2026 06:40:42 -0700 (PDT)
X-Received: by 2002:a05:622a:a901:b0:516:d720:4656 with SMTP id d75a77b69052e-516d7205069mr33668621cf.48.1779457241783;
        Fri, 22 May 2026 06:40:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:04 +0200
Subject: [PATCH v18 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-11-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Kub9ORcm7+PjuGNnZqvGfNQgLhDmAjRY+udGQlXYRFY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy8sVsJ1rqtkGBlZ35x+opyw4shtSjbnc+wk
 W66vCyk7y+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcvAAKCRAFnS7L/zaE
 w0v7D/4jw+3q8HcVHo1FlT0N6ArmoTBNyabY55CYkleyMxUYKB8XxGjywgksaiO5jRRmO+MYqUB
 aavzVOWySEc/m3myQIgSCG2jjUNwlaHfeWHDZHqCPTAOvVlhwO5ZSnwvw0BqtW6c5vntgXxaUC1
 Dh4EXXfwjZWiZkuQXW1rCj309B+9x5NDnwfoCgvlfZoKhIKuCKOCUydFgZTN9uwB1bzdeny6CST
 EGWvYyadkUROQ60PH8FvoWrJAFvdyxjnKaPxrn+xcXU5KY0eK5LpfiBZ3iLE4gp8wOAKkvV+3Nd
 RVsxhVUc9EHmruF813wGw83U+cH95oiWRJ1P15uIh90Q2ERxeAKOjxy15foAYJgHcANGadsXcMG
 kOZu4LXl3JOm+OcAj1/vYXDkCrmXSfyGkOaes4qMqLlMHMpmyRCGoH30HRf9XXFhdFjYmJk6eNZ
 RECwm/+dmZOtSYnIg/U4W+F6eaKIesM4ym23bM+DLyv5n1t4a+Xoy9eLuHZN7Ml0rA+7OYzTQT7
 r1qMjO+6J8nV92upfXI6YTCu4QG3/DTS9fZiVosBqSLntMqB1EAPQ2jLrv3gxroMLIiV0XbS83m
 fnr8BaV0ybEV0a4K8bh8xCNssgGnakiDq9/2DEtKkbxlfncd59K0fbs6aQBndrPTjlLyKMLqvC7
 aXB0Le0+9+/3mcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfXwz+yWsmrlCb1
 5N6kqojT9uHA2OW8qST0gZCq5M+N29UtNHzOXzDqfHOQk4khKAkz+dMJIzPDL/ZETMuYaK8ONGY
 YSNbz4Rqh5h+gp+ICKCjpKLgfzT0Ba/NVYhakSd/2MWqQaMBrOvi9LRUp3x2dtvzSHLoexl5n3B
 Y0Np6MX82D9DdTqZZGvqOwZ2wV6w1w8YSgmrsIbfygGkhArVZj9mHJboHLjPExpQzvSkn4A2wGm
 oytKBrlehoISl54g9nTc9ajAzkNTLMAjBRpr4TXTTX7AXLk7yTZJ/8HYC8uP+uMIGKp2VE7pvBF
 mwfHrtVDg/cFfPyOoJYjjC1TSwy/gFnlbKYpYsE5SnFoUvQ8gOcvZuAIpFK/VPdujNi94VetKgX
 uBuG1WPBESLDLXOUPHvajUJif7gSLjiVbxFqq3x4BVnotPO6TrPma2KqlPsEmI4+TcXrrtgPyQf
 Apb7sQx1HRVPRQYNusQ==
X-Proofpoint-GUID: xm6E0HbUBZNMtiKTR593LV02lz-QX4tG
X-Proofpoint-ORIG-GUID: xm6E0HbUBZNMtiKTR593LV02lz-QX4tG
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a105cda cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_144044_736534_E56A01AC 
X-CRM114-Status: GOOD (  15.16  )
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
 drivers/crypto/qce/dma.c | 41 ++++++++++-------------------------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..3db46fc0c419a0a387abce93649084fbf4b1f128 100644
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
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


