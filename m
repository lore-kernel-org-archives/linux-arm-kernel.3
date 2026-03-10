Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD880EB1073
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=ippm58HFxrQdD1XCsIRtZRsEwI
	4uNR/hNB3BqyH/B6d29FZ5yTwfuOIIUKRBFvpaDtPrjecPSrV67iR7jxRdr61OtHn0TxDYrR2BRCA
	mF7Be2eSdBHffJfa5/CNjx/et2wvqz5yi2znGFphN/7Gq099p91oS9kgSywK5OAyt9/9MFpnyljXt
	6izCXqUPmTjxRv1bwPwb1tePPulaUEBUZAwKB8xxfZvNBR5rh/oUOSayJ+TNnonHiUDOPhKoyYsD0
	KvCiwQ8e9S2xmhQFJ+bMM5sLjPJDsGbrpTONGqJoCTp3pTXWprw6mDWSSniZER6xU8AIPk6V43NLg
	5tTz9i5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGk-00000009qFo-46Sj;
	Tue, 10 Mar 2026 15:45:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGc-00000009q68-3HE5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:45:07 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaS933759032
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=; b=H5XgHHmX9Ide9a2L
	ssC4kHTnxvjQNiQzfqnkAgCp2muei/otaz+Cs2RrEpXCYgYpUOVRgdnyyaB+wL5R
	0fc99fheFD3lpSPX6v1iZ5eZlE5LmAk4KEmFX1iaGYB6YPPA3Eq0thlA4NUP85q4
	TURH2rZpxVKWH1VLS5FX9i68HspSf/fArOU0XEv6QitqEizHLwo36VCN15+CVHOd
	9o+pic4GKqYY+LTU6RUQfhY99Cwofu5Q3DDEmpqCLMKoteLm8aZha3OTwyXlD1lt
	MTMH3VbvgC+OIvCuRx20dVJ6tu2iO9JjOh6eJUTF/+iEFP+QDK+Vz5F/PVWH96bs
	bfCxGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctk8ugsh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7f6ac239so1698337085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157505; x=1773762305; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=jNmlU7pQG6lg1dADZkGVXdTbNx6exEQZNjePOycOlNGWCOvNwFugUyBdOPjqq70RJR
         msZgd3plwlSFlfNOP5N8Keh2mUjGti80bL1FCLwYkfTTHfXBrJsdGLv4+3xabwq/XwnG
         ZX2B4rPgYEIm56wmsfKIq5CfBVpqrd4M7F/5uONWz2ESTqS3j9phdVelwOEbLu4vyiBv
         iDRmdUY0jZO7/i1/98W603znC3w1vnx7GUDjYO1Um6pV453p106Qorkrnyq9uwX/YxJ9
         /BkP12q6Lxd3r6BukB1ObuSB7PxP/MPpMi1joxOBCyyK64z1tAQCiP+LOeaTtuyk/ZAz
         uQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157505; x=1773762305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnBQFcKPOgFHzTGJJB4DToRykxT+JvIdZWyKHEJZL1c=;
        b=fSg3MBDqxBv6ilb3bt28cSr/D6BQaRxIlpzpfm4KtiNzKUsrxbW81ZX9MlHoU+lg+Q
         RG3ov6SpjabJDhSmvQNLuLCJozKHMLX33rgoevPHwlTBZ+MKNicOEK03xBtujUFghO/f
         /HClcVKI2yY6HLmlM+75NrjTNCU7ko/MvbvI0dOA90xZKb0MDYnQ1bEGgBOQOTBjtNeC
         B/DaT7ITDxL1SQjIiwJUHmsuYb72C7mKpppRYoZOPNPjzsjMrvqbq5xoqico7caerRsz
         DiQ8fvuVYS/TxwVsbjhTBkpxu7y2eH2JfinKloAxt1Gro/e47JuFgXIrFvNfrp3mdhBQ
         wgnw==
X-Forwarded-Encrypted: i=1; AJvYcCV9f1UA4/dH/ML/CwSeIqad9Qx5kIqVLIWX/7b0/wWZBSDiJzd7/kYrh6HHTAJWk00woFWNah8rgQcP5g9BMTfY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0BfbR6APwpOH1lw5WfmtPgS015IWZ8FTBVlBKYHidBSEdS29s
	0j+sCvk4WQ8bX8502BpfR2FavFNeKkTN+CtSkq8Yy6QIU+ScIAZ5CV/+1gNoJdEZIdqiWgspMVG
	t4BZ2YsSaEJHGGZyMPUNl9ZLGvQRORt9P1gNqqcweiBZhYb6DLbBNUYtRMtM+ZBdKRtgn6xkSfm
	q24Lfb2b4Fig==
X-Gm-Gg: ATEYQzxkQ3jf5Vw6CJd/QdmXLZYeUl6nWEZpmit9xgWQZDMuPiBs8gFnh8+tN94Mhzp
	pA1aS0qeg8KYrBG6KY4gjeQsoZh1iLWcVnGXMhLMkfyfWvS7qmPd3xywGMT0BNrWHO5YTGQrHO/
	yF5gcYV2eoYLMcYQyrC9L89g58DUKkIgCs9ZlVA4T7LO6XdwHrm7IFR9wB5vLycm9f+dzHih63V
	D7+Qw6kdksdeB1+hZXEUkLZ33PQBZVwKlm5f2PuV14SkmfXO8NEmtAJRaCbvtGWRTvhrN5CeMf2
	UkhYocOZ21k9quvxXf7hbBX0vZhTb/7svxD2ei1etoPIxl1vCu9FjWueDLwuWyfGh3daaX0/Boo
	IlzY5OjtytDUiqfv94FnOhe7YG8qwa3YouewqPRsyMSNfoDwU7ved
X-Received: by 2002:a05:620a:4713:b0:8cb:4fe7:4c8b with SMTP id af79cd13be357-8cd6d46a65fmr1741699485a.62.1773157505006;
        Tue, 10 Mar 2026 08:45:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4713:b0:8cb:4fe7:4c8b with SMTP id af79cd13be357-8cd6d46a65fmr1741694185a.62.1773157504474;
        Tue, 10 Mar 2026 08:45:04 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:45:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:24 +0100
Subject: [PATCH v12 10/12] crypto: qce - Map crypto memory for DMA
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-10-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gRGqUxioVpJcY9zBfeIZn1vIilzfanwkfyseaIOaQFk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxpruHRIFXTdAiT1NdYBgIWl9dwNSWxbmDhY
 MFpLWTuOaWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8aQAKCRAFnS7L/zaE
 w8zjEACU75BhOGlQUrmhew1Echsz07OmDT9fQ5Jvtf3m5VFeQIPOwMPvhOktHYTiLlqBJ29Y3i+
 d+mZGPPm2Ujrp5UEcdENXELjaWDu89uA3/2CtY1Si7b30em9oF2DHt+knNGWYfrFWQfmrOcq0Ds
 jzm9v/o079w4/LCQyV8cp6sMbIKaNpu1IIX6qmC3k2kg88q54U1epWJgpHBNimAOCU7ynoqTMHx
 qtS8ME3YGIHsSrMGbBA2YvSPjTcdbvt6lEUIkyz+SpqrMV3j9nI+F5y+1096/pz8aa3P/DfG7yf
 grBswCRkiIR9WwlU7VtgVT8s4Q++Mnqrg7Nbyif5XF7G8UR03c7uCyahOVUpWYya7osRWNMUhV0
 P2z5O9PEnhDXNSP2GotH2dGEKUN+wraGq5lyXmfiFcjTWccCO06/cjwPz0rKVJQyfhyoisbeqQl
 n5gtxGi/GiLXcRddAgj13RuOXPeZJ+glN7vHS7frASzagP//9y50PFu3AB7AreCuUmukCGWV6yG
 VYWeF1TXvZhVbdClbjDaE4+gyTsceihbUIYyvQ8UBPR7qaIExxsGOIbRqMZ+hPtwRfURHJkJsJb
 XsX/w1VP5qhFOzDoSlUfvaYOTZ+rzENnotBpvim4XuirlMBL0dCxPUXYYCRaLOmJrlXzuY3asBh
 G3844dVFNV3QL9w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 8W_ZqEBDMHZpT3CegzMCDpHMh4hLRyRs
X-Proofpoint-GUID: 8W_ZqEBDMHZpT3CegzMCDpHMh4hLRyRs
X-Authority-Analysis: v=2.4 cv=YcmwJgRf c=1 sm=1 tr=0 ts=69b03c82 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=76fuQ0JqpD8MvifAs1cA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfXxDgu8nX9DVwm
 nDROmoMdEn4PTz5TD3jm8pMm466n0JJ+ned8qRnoaMF2mjAebtgZwHo7md+WHRisoJaKKOlc3Ti
 gW3Wn2zVEShY3iX5+wVL3PUkIcTTZx50aCK5+bvCWIgWDZpWzMyXrO9apre8T3YosH8ByZTYs2t
 Qo2Se1DkVyH4l220EO4DYr5ncI2h5JPhDOHRpaI5I9qAWLyXcTCjBEqM7g7hnrhYcZECzjeOBa4
 RKU4Dy5NsORHjgVJvhM57J62Mw9C8f18vh1eJrAklOMerOPyXiUbcSYghDi4mvJGYeIq9Oft2y8
 Y6X3qB9kwJjH4YRkLapLmnfa/88NCg9ERWNkBVBCwYagYmmjwSnj11PFetPZr8UXy4Vbtyytufi
 46Y4UCz38RTRuaGfFqT0Sh6Lnp1hSC/7c3oCgX8EJl+P6S9N7GQy9bR/5LDyPBf1IiUHax8sDCA
 0D6vCaAf7s1VQjL9Csw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084506_841795_E3D76179 
X-CRM114-Status: GOOD (  20.96  )
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


