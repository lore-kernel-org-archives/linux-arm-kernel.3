Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B12FD8770
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=Hfytr0z81wCYG3W/KH7/6a+88H
	ns2KdLa0S5CczMhMq0XqUULSVuAXRiDN2nCOYRzXZcKQTcSmyyrjoeHQdOz+OxYBrWwS2Yes46FMA
	4JFH+S0NQYqkmsUzA4vqSRKMGeyTilA4AhtcHNjbPknTyr+LgCQLnScYGQbiH/GiS5//3UzXiBDBo
	fpvwTFfBvcHYojzPQZ+6b9HPPmNfOsSwz9KjJDVtdlbL9PmJ8ioyg3Pp4yrOZHFBAUW/kA91nfKll
	8ndpLE587YVbFydJiyJYxjmWXw2gVOhTZwoYQujwS1VibLvSGqQoWjXt6g+FQfE/jJH2C/8kPnDC9
	JKZ4U0ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0s-00000006Uzh-0kNL;
	Tue, 17 Mar 2026 14:03:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0i-00000006Usl-3Ilb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:03:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HA39Pw2071568
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=YDNtySmXX4XlOATY
	yk9X/dvdLV8NzjGiSbTXSe4IHF8LFEeWxkHT9Scs4wA/cKVJhhGaJnwdCKwGO0oI
	0gx+bLf+A66FM7++3lCMTeFZ88glVRQjssJDjWcuDIeXMcsabgvP+7++zXQwqlf+
	+jcfGWkQF5Ty2/HERlLXw6Ks37Mg1mBB50Zlcl+xnY49dEwilsk7mpysYn1/G6jQ
	IRzHGZJtM1PFfotkjty9pVtWnW8phXiyTkGBhTnfJS6ijMQPmqGhyP2Nq4hMyjDH
	pOVojcpOOf/DfRGtdZMEMOxXNI2psvnhOtBFv55UEWPMidiDJm5ThokKcVArKPwv
	jrzTVw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6rsfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:03:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-60132c655bfso8737074137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756183; x=1774360983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=YLhz4mmBB7Me9y7a+KUhILQu79ErTvzVLyxlgyXRtDbD4FW6xTppvLI9V2NcSA/8G6
         i28ZPEyF+0ABDkWfETay+vwAGReEykSHdmCJzfFRfKCFT5sDZztx4VM7Kq7+9Umd8fZw
         iLkHqj8S94T4gJeG2L69vtJ5REB2M29SZ+qNn6ePqMjqsbpolzke8L8MOi4mIBUVtCcB
         lr6I45yQmGd/dCjOlAQ+3AoEICy0hs8YdcpOlAaFYf+LAE3auTGpO7VFd6HEzasuO9yl
         wx1jYp17Iyd31WJhK96z1QQnBAezoPjdLLGG5KGZfAknE72aKqj1n7krhu9eir0FY39Q
         q8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756183; x=1774360983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=Mn+ipnDLfTtqQm8ZninToYqBalLrPnaS4VWynI/xLBgMqJoU87Me4JpOVatsq8E7Dk
         mTKdYSXPMnCfAIiNFuiPHH75oNdiAOVEq7g6pLUoqgElSKM2/C6E3PMqYetlCffLK44H
         lHCJYRiRvklKLgZ3GA9AIfUcVSivmQFALDEUiZ1aQRyhJVeaNyDD5RaLGNs/h7wV7+8u
         a/ThqhbuOmqvg9xI730c5JncUTj7sQFUzWnSN/huwExxLwvntSfWQUwKb2cA93Bc0m9L
         BiyBU9gZZKcrHuojgT6YLL6JuT2cL+xPz3fK6v+LSjdmgbU4YHcphOc7hH/O1f2RFhp2
         qozg==
X-Forwarded-Encrypted: i=1; AJvYcCV6aA6hGucbKbdSBjwQ88I8SUG3BH6ZuUHBAQB7jepo2xQ9ybwBefV9rku7/FHbsehVYexM0V8fcmfQq/AQ0w+c@lists.infradead.org
X-Gm-Message-State: AOJu0YyXkTfdNQP6WFRegRG0c5qQVsMSOE1JRb/C46LT9QjJL1tXzGMV
	uSkowX5b/qQA0oKUUdjNvctEvwrRygMo6FGu6KZ7/M7Bmz87rsNipoCFHQwK1s0sdGbDSOkInV3
	cevpKVIXPfsPfvyxrzv1PubzsVHa5ZqiXP1b1vfaCDWutagslBZuOM8Lw8pMC/gNNN1kppsTh4V
	269w==
X-Gm-Gg: ATEYQzzxcWE9khP8jpNjpekL3MLdcUJRtiauSi+I1MKG/3IVS7LM8KTs5NEw5fry8DP
	mQGiORke7JaEx9CEQj0QUndLsH1OhNtd59eynKZTfYf7/EP+uqGsnjLncngzozeowxksKYIWMd/
	tbobHQbD1UTxeqXcS9Kf5CHAWFEpwwB3PwoIn+ZGbNhZWH2IyQ4v25e3uQQen6bvE7Dsqcl+Tn8
	HrLt6cwcbwRnVtip/VM6tygwJHfnn5N77BfacHapjGyR1CWdx0jqkuXRDKw+OGm4GPjhfFrNtNj
	SgfeaWD2j4aEK7I3N7SacL3L7ZlmQP7jCh7vb9v0D7izOS93tz/v1dLV4wVqAs2IIf1lTZP2jJB
	3I2sD4o0PEWdxCv++aJerG547gCCVMU14UB5u7kqWtMPjZd5unnr4
X-Received: by 2002:a05:6102:374a:b0:5f5:3739:100d with SMTP id ada2fe7eead31-602639f0278mr1650029137.0.1773756182993;
        Tue, 17 Mar 2026 07:03:02 -0700 (PDT)
X-Received: by 2002:a05:6102:374a:b0:5f5:3739:100d with SMTP id ada2fe7eead31-602639f0278mr1649926137.0.1773756182244;
        Tue, 17 Mar 2026 07:03:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:03:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:17 +0100
Subject: [PATCH v13 10/12] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-10-0968eb4f8c40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV76HVh57AgP0R+TYtCCz0g0UnQ8j5eW4E4ty
 3CYzoK/296JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable+gAKCRAFnS7L/zaE
 w2A8D/0Z038+TobMkyZZqP+SDSSDNwa1odcRZSoyNzjcRFTBXMa6SJJ3snAENqMgYG/RnAcvhd4
 iNsvGJ1wpEWRbDVYRPP+EnVSbmI7/Ukg3r0LfbUHIW7tcUFbqes5MU3jGXRm9mJRT+Ni3WhtFHi
 gkqe7N5xak2W3WWZa4YeOskjYaEfSVZYfYmBCE4Vxqnayi18XwhuUnBTiePeuPfJ8PaZe+Wx17R
 0jIyyHugkG8BrVJrpQSHJGqhcp4GKO+RMwFOAG+YKXBTocAaDWyjTspdoJa/pfCvs1SoZzE+7tQ
 +NryNOFOyvy1HFaeWJECfqio6gzz/NBvvy8IwNyhBeiZOl3TOs6g2PxMtCHooohoH12qS1I9Zyf
 gygZkIo7Fmq2B6V0eBLHrY7AlMY8J/Za0eJgOmThWHL38rp/8ZlajRN0zxpb1ujWDOH/wgSY+Rz
 tGh5nP4YayhiRQQ8+8PMKJrsIfoxlcJkoc52irs8nl9Ktvh0uxycW13joStLMyC19+w1JLgc4E8
 DOEzlU75E4tSXYEKMKc2IpLQYIze7IR3yE08OrBanNr2xW6nhxzoddz8j21AqNYSDdhui3vL7WP
 KcMvsmgbN5HQvSW9dMjn826yM7EAEYqGaS1y6GgJPbbq5VjiAvCnr1k9C75sjkRPG19IdzPzUf1
 9Yr1RMNxNIiY7Jw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: wsZ1TXT22fzL0fqCVMZtZukje7m2kUBf
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b95f17 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wsZ1TXT22fzL0fqCVMZtZukje7m2kUBf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX4ij0DiXxMDYe
 rWCbM1C07NDap7x7SBc1JabDiQ+Mn2hd1TTn9RoavHJ+6nh6DxhOzzoxyZ3ZpQE8u+/MzsI5Q9j
 7CAA+wLyQDjnXH3XTJwk0MvU0E4XR1oIk9bpa+9gY/bxY+kqDDliOE3cJtjPTcTlay+HJ4F1ltv
 imXSkIe9VFGDCbWHYszeK/dF5YUohy42Ut6TxdaXWiihcEYShA+hn6ngcnhoReoI17IV6TOcrlM
 p34yvjsgzRULRKfp3AZUhkdAiPxK0TSot1QuUiNx47NFj6r/EWrhWoQnKDzHQsCIBS6OUpYx6UU
 jPbgav5iWwz5bQFMuwDMCarBVBRZGvTygmnouSI1FDFRSwzhdEJtIfdFGHNQQOXlZTDwO1t1EnN
 uyVttPTEt3fN8M6vNv65wi6rQL47SBXKbIu0pw9OA6c1VBOzQ6v0VIBnZEcl8WHx/e73JJSoOcl
 JHLwcQCAysPXina5acA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070304_879987_75CD5560 
X-CRM114-Status: GOOD (  20.08  )
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


