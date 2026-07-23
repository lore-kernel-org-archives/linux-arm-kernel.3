Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C399C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=ZUlqoicQ0imW7feBFb+9K7Hak+
	DR5lwiCpBXSHy7FDseOQTMt+81oxjD6c9iGocO5GjoSa7FeVs2ERrPjoLFiOQXsVPzKrHqxCVmN3m
	9vwTylltNgvl2NEFgfwWhtVMkKMDctTQjQBdXz05uQCGqTkx6GGdWt+Dsf6gANysGitIlZaY7VWP3
	jmh5adPwpvHdD7F1f00TwXwkdLuUj91Rc3s0rt/kBv0RQXoOucOfndEF4OXIlNKU3xoLG2R9TryqS
	XSEn48E9LNZ01WcTHgO0nBHMI5Y0iYOyNs3mq7elOozPWfWa2cKOQXh4Z3Og9OGcH2MLwRe0s1cAF
	N8P4W6ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwws-0000000Emmg-41sI;
	Thu, 23 Jul 2026 17:11:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvw-0000000Em7D-17rE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:10:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF5KrX1325727
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=; b=K39y9gztZxLnA4zR
	7bJEVeCZ7GuWpK52y6cVKBXuBkrrvZF5d0Khpzl+E4RytfNggMM+BsIpYAUEa19g
	ElslQqwPQwTi8afKUQQCUZHsL8XItdk5u47ApJvfAcxFoXZ40Mp4V+XX/7jCE2J8
	8VJEimp0H5XFzrEdYRivdxXs6jwB7/N+MXNDWJg2iGdJlofcmA7s8cH/MaSDjGEc
	ECbK9nRLJRQYorJdI7/SAbz0pFdn8tM0it9y+cK6F0tC2WYIp5CMQXTLl1AEB9wA
	PpUtFojNZm+i3u6vw/RxQsJZBy2jcyczwOLnsc6F31dV7TrS3ZIDefhwZR8hP4mb
	fReINQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a0myw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:10:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e6f602cso15103851cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826607; x=1785431407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=Gc3TrGxmJF/F0qbvj8jFi9Di3r1bV8bt51Ln6l4ydowfVyo49iFBPG0+Il6zXUZeeM
         71V3xGUgWUI/1cgbYlcsut8MF1uMo1q7Kla62gZybStXzy2dcRz4JklsRFSSTcsUge0z
         iWk1miuyXL6UoSp8M5jyPmI0cLch7A/NrE7MBnyjrETG+lFYRS+9VSJWmctIUdW56BCX
         4uoKHBgE0hGTWGAAE5UOYxi5MfehyCNqMrUSHvd04ncJ7PpkjJIzJepa0EIZ6hZLfHXP
         Rj6hNdFLTnoaEqJq7GrQZ+TLxwHAtgNnxZNdJ1EWjaosGXQoQyhyXgWZs43DwuS9Kdlz
         qVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826607; x=1785431407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ulYiF5q27l0HtYTWxPl+5HbnGbtV3QzEBY0v8bm+NY=;
        b=jMH77GxW/FBHi6d221PSR/baplYou8RVmdKq1hKrdoamepNY5RYx5g+ps/NB7CAqyx
         aQvx/JqKwkMlpma64VT1Pzbp9VpaFmuicSWWUaIDzmhTrxTMp47m6Yg3TVYatfVaGi9w
         Czi0clxTqxXDTGDMUKx60edGsgB4/rzBLxHqyht1nXBuNpZ0OIwC47eDJBOJpgrfTqxT
         aDqH1JnWJXx7JR78mRdqr5YmTpKwvBh3QqCSUb3VDd1gDDdku8kZyYJbpti4ewERF0ID
         kPBzVIhQ5qfHMkdn4r00eUPClUzZPUX4NV5P0iHBEb4nS9qnhvszLzsBuqBeH/prpNFh
         rDqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRMGc/UrzturzNwvc4pXwlYeu4015GeZKt9XHws1QqtLVdGj0rD0y6PB3O3NhAVgXOXq5dOEUuKGBtpjJRXDTC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwbhaim+tPAurEK2JPAMQ0p64aYqHfpmeJgOBQp8VWa9muOJs7
	3q1uX6n9ybRbKhGTEDJ9NZdNzWA5kutCw4pRvNdkbdxfYlRrEJXAVME5bw1xQ6AMKTy1p9n5jnp
	ZXFy1GsrmaxqfQ/tLor8DJPcBhO+Bcv1qSbkUkibcc6GZXw7+WAjJPS7/Xf+GSHfRqu2NZ3ykjH
	8+6A==
X-Gm-Gg: AR+sD12lr7EB8kamJngiI70RCrVD6wr5one0Wcijpu6cAHKfKRucEHK+gGkSFO7ceT0
	GsYXsyf+Cz4BtlZjUKOkUwVJg9QAkGuM8g4vfdyHxWNPcbIi7v2tmvpYNgjKUWysm0cO3dzWnzS
	8i02qwYPgefJmsrjvyyCxvS/Rr4IrKnNlNJS5A51Q2s3VGUI79ATJAnNRK9w0XnqAi2sAcRwwaa
	icmLoOM6mYpVBf4C8jS+a+5t79LcF52iMFd8mPS7lvCouS5cH+/lz/Sjx/ywydW5n7dHvrUkOqR
	MGrrGXlGiGnQG6CDsVY9PiS3AZ7mKxXWboFk53FGNOFCyh6p7Hj+qzanXx2Hm2gvmisj/EeAvc7
	GE2hcUBn5jw4/xYLiJ4dXF1h+yUtT
X-Received: by 2002:a05:622a:c08:b0:51b:f40b:2fac with SMTP id d75a77b69052e-5283df4fea9mr36098221cf.50.1784826606794;
        Thu, 23 Jul 2026 10:10:06 -0700 (PDT)
X-Received: by 2002:a05:622a:c08:b0:51b:f40b:2fac with SMTP id d75a77b69052e-5283df4fea9mr36097591cf.50.1784826606341;
        Thu, 23 Jul 2026 10:10:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:10:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:18 +0200
Subject: [PATCH v24 12/14] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-12-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zV1OR5DiqlcnDzl6TeLEQ0wLAWkLclKWK2ow4Gd4Hb0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrJWYMHq7kgUQ1IfzagISl+V3RwfRRpCm6Yd
 khK5qcSBeeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKyQAKCRAFnS7L/zaE
 w9xgD/92jcrwEhths1pM1e26qDuDJsTs8VIHecHJGIKG2MtyXCynY5PlgFVfMaFI2Stj/0kd8eY
 G8J1L6CENOXg4sqkzkyCadGZcMbOFk5LrvNWyRjM3pWC7bS/fnMgspSQtm53psPCCWMZeIG35XP
 zcyjmf/5sYnVBKahalPJ8iZ5pjAr+UZuVSJEzUhOCQ8meMFW/nXUmJ3eiJuLUPAAIXtyZxv7ihw
 eyboRKSiJ9jYNRqhln14yyjX1OCzcWswLTyPdpk+nrOI35GXijzwyLAiYpIJVZ4VUAy5Q3RKP+Z
 M01nXfEcldcYqOn5xa2gz+KvkyR8FpMGN6ii9o936kNeN04gsRR4NNzbqK6oZt5AyAQOsSm88e2
 fJ19D2Ohu39cVbAWLJT3m8C340yYc4mMHGPXVeLWOlA+QdroTy8xgjxX7P2Rouz49JRb2RP39Je
 JnPbJMlty2L7uTD+y/LcloDitkR5VoKHsOhUhBZz4nXuJ6nDj+y/NGSTHsB+Sk5xsx4dm4gcC6d
 NVf6XenrRTQzz3SZUDgW/JVDMIdkYsMXFeHqMwBZx4ZPK0goy6K3zVnNoqw0NzCL6xGmMlBEvJs
 3vxdKjiflG/X1ofeGO9yQ8BLW0wtLeJjSjIlAkhzB+MtMcYi23Vb6Qu3vzWI+Z1/jvECmh+x3rJ
 5Zkj+xQYXoASXdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX7cJMksan2azn
 /rG8PObaOyNF+BBUFE1BDU/BVjTNlYeeMDvLhmmsM4uP+9+AKnGA+wXkSYQov5CAFLQ+Rx5sCF3
 L7KnKeJl9sUGy1FLEMIQWvpz3VTz/rXNxfPfTU9PvaiuAlFS1v2kGR8iL8yU1MQNB86+QLGqDKn
 wuTjzbbMPxuMUd4ptfujXHdrPIgiZVSH2hEizJV6M8Gzi8ptiPmfLDQhTCX2WWPM+6l1hqTFyF1
 bAFhk3thBFKuofvKPZgu3xEYhyu/HgduGW9/Vu5hN+kaRJ2vSP+WgKCAdRUyjr8bqqIQ1PFIjzK
 jNJRN9QbGIA7yRkiymgGAwplW1FBn6VppMW8ngSxWvnMo8IP26fspMB8iaAA4ECqoID0bfB67F/
 j4yZGFnz0Dq24PyvcSBcCtWTMIFJ+RBE0umd+HiDcMMB5Z4hMvIPB2IoP5YObnhEaktZk2KQrrx
 628L9GGj/Kiw3k7k9uQ==
X-Proofpoint-ORIG-GUID: M7DIA7_ORDrIunhdjOZ3dbQTnbOyWzFd
X-Proofpoint-GUID: M7DIA7_ORDrIunhdjOZ3dbQTnbOyWzFd
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a624aef cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9tNk7rGwWxUH_P3zroIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX3LkiRxCgxfah
 g4w4SFk/5s2+rlFTuGgcQVwT9KzGva6G3VhL3C597VI3zo7eqJY42ppEQCySWaaYMqFlWk2cbUj
 hxFGgrB5hzxHchrTKuqsQPCjh9yojZM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_101009_047432_E8384651 
X-CRM114-Status: GOOD (  19.50  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 23 ++++++++++++++++++++++-
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index aa4a0b17749081f1ad653424bc265ee81e348e15..4031b4516d6519fc5024bbbcc439500a7b3314b2 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -191,10 +191,19 @@ static void qce_cancel_work(void *data)
 	cancel_work_sync(work);
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
@@ -204,7 +213,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -254,6 +263,18 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
+	if (ret)
+		return ret;
+
 	return devm_qce_register_algs(qce);
 }
 
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


