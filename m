Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9229FC72C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=DAVmcjwdyrDph4SQOef/v42VTr
	F3E8I09KXDDy4u41K9qvDMekd8y0eIrWkT2p1dnPu6svsnc0VUy38r/ijCgNqmCf2jicTkGHdwmTt
	/EfdZL0V+JV1eDftYCfmvMP7DAmS7KODFrM+PfGfGb2+ErU2E5QqpWu97VR1sYOH8wqj1269hdSPS
	oARAtrVoH0Ezkr/9umz5KDAnQd5gbZcWIL9gjVPScB+GTgEoEWkz0Lf/68iTT/prb0j31GrDQ0rjg
	ODiRhNTe6fGJUdTe5TTb9HSl1n6433fMhEQot7RKzYesmQ8ZeXq6k9n+2RP/79LGKmHw4ZybO4run
	EVaYPLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2k-0000000H0Sa-0tmE;
	Mon, 23 Mar 2026 15:18:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2W-0000000H0Hj-0Mdq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:18:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGwWt3589850
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=FUxOJaweHYmdSkal
	kIWOp5Pmy0Cx4lcl9BR8gL1sKoSV7P4jxSxzu7/jAiDB64xpnpggU3+mamQSpmcu
	aXdHmjfR3j+1VA3YvroES1FGGC4J5eiHcKrDFT2QHdq7wo+GF3jAdfn/3NofPMef
	tB2KGaaQvX2ohL5W1Yit/GAyRyjFLDYT9dOO+1r0b4Gt6tUZkpmpIRBAzFimDdG4
	3UzR7P3UItRCxw7dFgtu6E9z8JiT8VsCC7Lony+KkR324HQSxg3xe8hOHe0662g+
	0JzYfgvQ8FF7T2KGulydhcJpQJ2MlD7KR9nwKPLMG/Hb+D//ICk8W/tf+q0rvM5P
	CMichg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0g5uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:59 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffc6cb5980so1594103137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279078; x=1774883878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=ePGHcCT1Ic7wxiMlQov0LpRHS/8xxdZIji7rmiMLYI6dItrXlY4O20zszUOZH56k6g
         CLnAwJ3sz6otnihPKEklWcwIdp2OV/5rh5fgMKpjvJX37i2UCsZf8d23bKn30y21utu9
         yeFXySNfwIoQU8h60lPauVBj+5gHf7JNLownedOfADxrnuibAxsCGEk4mWs/UGpsNVX/
         coBCrSqRH3LS0JpNdCC3QvslnaO1pbzKZSpjOI/NVbAaz8l0TKGUna6beLMrJTlbxgH/
         0VGvqnCiVaQ8YcIB/KZlI++RuIry6xVcQXTjZTSoHovHabcsswPFw7UfuOwghfIOkuLd
         JjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279078; x=1774883878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=KWN8KC+vY+qzFMoAWCALCsTUmLqgf1TVC05Xb2OFPg6hSN6FE0NKSbUBu0R0kINYiY
         bsk4LczZgcek5vh3GQz4swdUZfFf+sqHwO5/Vjx+GGWU0eORuQ62DzXouvjNY7FUjKHq
         KrDR3qJQmAzl/42fPxdfzuLpwQf7Wd1rNUFZMDWjn5VnkPqrv4+8ziOsEp6awicjmCFQ
         CJz/+/omTJVluHYrLDl1swwVMl5H60tbEF9C+RdNI/Y/l7Lu+sldXKo4y1UAD+Yj+TYT
         1vGYCqbYlxf4gdnqTi9ad9RPCQ8sCFUWAMojSg/REEm8ET7RyKgKi0+UCPJFaxEQp9xn
         G1WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNGEWvgH0VpoEzOGx9SrNWSJVLCUWN5gA/t/cn4HGfbl6w+WPZU+CmcPEBsHxAvYv8+G/NkJVTLV8MWKq8Yi5+@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1zbWEnFFaeo+605OWipLbfhkcr5A4BmizZVqrOOii5NQcj/I0
	3ijw/hz3Kv7S4XFVNGV2VD7uvB4HJVIcjCfzUsP1SvQKX/OlbKxJm1Hth81+fo1tZau2sGbngni
	OHZ4iXoL4ESZn6B057agP75CXyLUpf8ZTCgBdpLhRlQsl9X1EmPPeE8NlG7QhbxUdx33OUXVG9C
	xDqw==
X-Gm-Gg: ATEYQzyFQE5Zltn1LpNDEYV1gdfWB6By9P8VX/qC1GSgRWMeJV6DMNSRoyEafA9003P
	FjGMy/T9Phkcm9Hk2jyQ94WgXiXyCR2ra3FFZB/zp56XjQzjA8v/aIC5K9y1J8KwGHDfixxSgBw
	ruxxY50CwKYS43nQoTnNP2QX4MAL6Im5r/2FRCNrclAu9Vz8ejVAYP85VkkdKU7TjfuLLcQcCv0
	JyXbER7dYN4kQiYAJyouUHufKTH0SNt3KRnxzcSSA7/LSEDTE3NsdmYACO4tbpwgBPXchYkHJ8G
	yeQwhNZYLI7VMl+7bYZCiE/kqH2YvXy9NkgEP54yDhunHY2cr/aqFcBxgjZIqITCukxi4HUnGcu
	wCqqpDRQFDIiBw16PF8Oai6JJrbNJD7Pnrlrjpngkdt0HEzHjTr8D
X-Received: by 2002:a05:6102:605b:b0:5ef:2457:8015 with SMTP id ada2fe7eead31-602aed2cf91mr4164268137.29.1774279078495;
        Mon, 23 Mar 2026 08:17:58 -0700 (PDT)
X-Received: by 2002:a05:6102:605b:b0:5ef:2457:8015 with SMTP id ada2fe7eead31-602aed2cf91mr4164244137.29.1774279077982;
        Mon, 23 Mar 2026 08:17:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:16 +0100
Subject: [PATCH v14 10/12] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-10-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVmD13r2Am7+SmM6Nm34ZCXhyvI5Vew5D7Iar
 vEE0IzdsEeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZgwAKCRAFnS7L/zaE
 w2EcEACY3fCs3Yh5lWl3/XHzMLQFZNwKQZ/k9C2OXOqzLPfweIjH6GOVNQwsNp7Gs6yxHSFYAx/
 XR26vYVkhBIP8DpR/mYkQNqvp189NvAsr3PGrt4xF6Iyn/CuXrbpzoVZ9ZXgwRXVVDBrhGWrKtu
 mdSTdIqJau2Q0n4UGzjYlbhGRncGrIGjqqme+2Fc6+dwuE0pnDS+JJ9OO9uTyuhvA5PWMcDc1L4
 XMwax416HRKoAe+ffnVPKgKEQv1VCDDwFt444d3cu8G/T9vN0k+T09cQ9c3IssydxWAc4xj6fG9
 UMSFSxfMQVNcjprHSi+TJUD1LCfbf2J4VlK3hkHA+ZZxBVkiF7aLQRW+lnZz+n3mro4JTu1CFBA
 tzksi1CUKRerz2m6FywZ1tZW3VbDipZLxUX5SZWkGwYa3XU+1kt/J2+Goy8vvJul5pKqCUyGkJW
 E4CN2LVhh6G4UVtumezbbh9zb+0WWPkLwyyi1Q3kXqiD/3w0ZYIU8GMPjEA79ADG9fJPXYl+u48
 ed3FS4ubvxZtPgoU3EW0hZOXb5YTnoA6I6/W0IoynuvQQB1XGMIbZbO5dKpZ1b+NsLJHxEomgdy
 vnOQAJgvmTj55RFUQHqAyYe4xSw1hznvvNiI/B2hwntLNZ5OUSud8cSRc1eNd1/49O4zkj9yzIH
 zipi5FcHGyAi/PQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c159a7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX7peCEL7+4suW
 PPc0mkqEnHJoJUTLZhSquhBscvk0vrJaQoy2Y75Ue+QJiMNOOkrSrvAF0gi8asWP+gPXdf124E9
 g0MbjmXTA9j8KhIImbKtjnVVT1KPhOiXiTdslqX99QL1BjVxz6b/h/guMLDLyIL5bBuoFRm+48u
 oWqHBh0CR9PneTKrBLWQrQhrrC3nX2m/RLIl3gUMo3VQa1T8/7F64L3dC+h+HcpPlM12uhPF1xm
 WPxE+Ww1W6wS8LiBxPFi1/Mlg+I4R8VZ1Yw1BKHr/+QKvUciT5gd4CJShOo2go3VUHiynes8+x5
 r1jWb5jUexQLKvDnZ1LTPEDrjblBYT+n+nqyLTWIK4kewVArOg0PoLFW9DNfA6MH9640yHkKDOS
 PUdUdRlcRZny95Jqoa3S/jo7vil+ok6EokpnVL6n+rUfnz2yPAyemY54RRiC1NqfNfK6/cCZZ9i
 IpGfVFRWG5sYeCN1Fow==
X-Proofpoint-GUID: zUcKpz4_cQLdPpPebtE7xGa7j_jV_smM
X-Proofpoint-ORIG-GUID: zUcKpz4_cQLdPpPebtE7xGa7j_jV_smM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081800_157897_CE4F8946 
X-CRM114-Status: GOOD (  20.27  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 25 +++++++++++++++++++++++--
 drivers/crypto/qce/core.h |  6 ++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8b7bcd0c420c45caf8b29e5455e0f384fd5c5616..2667fcd67fee826a44080da8f88a3e2abbb9b2cf 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,10 +185,19 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
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
@@ -198,7 +207,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->dev = dev;
 	platform_set_drvdata(pdev, qce);
 
-	qce->base = devm_platform_ioremap_resource(pdev, 0);
+	qce->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(qce->base))
 		return PTR_ERR(qce->base);
 
@@ -244,7 +253,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	return devm_qce_register_algs(qce);
+	ret = devm_qce_register_algs(qce);
+	if (ret)
+		return ret;
+
+	qce->dma_size = resource_size(res);
+	qce->base_dma = dma_map_resource(dev, res->start, qce->dma_size,
+					 DMA_BIDIRECTIONAL, 0);
+	qce->base_phys = res->start;
+	ret = dma_mapping_error(dev, qce->base_dma);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(qce->dev, qce_crypto_unmap_dma, qce);
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
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


