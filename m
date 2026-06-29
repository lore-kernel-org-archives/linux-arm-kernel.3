Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B16C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dak13vsaTB1dmsrIHeCt+zMpkHOZXt2RO0KMkS+FxIk=; b=qCmTZWEvbUF8CBy9m6h8EUhIlA
	3+aWBh5SmQTTpzqFbDw1EcwOoK/rj7bYrvkkJT5WHy2qRy6jfG+DyVCvNZdxqTB+SSjonj0bAiGlM
	9dk3zfboWAXRvGiEhfeV0IgoVO60Tbx2Rwsm7i/O64Bxr3UBZcmuPilL9Fz3m/suUZDLnmkzB75SR
	2vp0+mAa5pphlc4gLtP/qx1o866owyYtUly0L+VYBmJ6iSGl3Sa3SPBc9uf9/hyRz9BK2BoMFqv6c
	Z/96B51vjMpb8+bLcs2UkcGVestHPdW4JnA0haihPIMw2ZfXG7hgGnQykRA3QRhXtC77fYWNT5jhF
	IfuqBKQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oM-0000000EHV6-2kcf;
	Mon, 29 Jun 2026 10:01:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8oG-0000000EHPf-3J7u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T9nAwO2529491
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dak13vsaTB1dmsrIHeCt+zMpkHOZXt2RO0KMkS+FxIk=; b=FpkTkdW94q5lBN3g
	dkdN4jE77PcLbI4Qf53nV3+FAUoXtJE6R79k1lnsg0zWmc5sHC6uDAwk4ykMGyax
	pmCEmOKnHieLa+kvngcD9R2fRnAVSel6Q0y8bX/f1WsrWIgulXVJy6n0BSaNkD3/
	xPkFfwoj20VBVPdzgc6lSivn828PnQ73hvMncO6qjVO3gK+yhvaJcxfBDFAL2P5P
	vUCXPP+Txt2gzygMvb2UOw6pQL/jhC5RwJrZYqokcEKhvoAf4/o3WsU3qA3oDC7c
	9rQj1jMs1tfrgrJaLGqdKM9yokDBN5SU9oh/vpXOJUI50MovpOxOOq2rxJw/Zv7/
	qSWApw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdkr1m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:01:47 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-48f680bda84so5044025b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727307; x=1783332107; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dak13vsaTB1dmsrIHeCt+zMpkHOZXt2RO0KMkS+FxIk=;
        b=Ch63feDkja/AL7TWzVirDPSQyUpZkgwZ3b+XgH3ZsuAmJyYR6kZlctpA6RB2BNGMBd
         QYDKwYgx1iR/ScMKGtV1Hw+4eT5OJtOrDB5kPAEh4dhin5aO3PWF2poImGrMSGgWUexd
         Z2DlqYJcdBkf1Jb97RFkZkg0v2jmVRYPwPAobKAZhXzFQUm/x999BuaYY1T6h7EUMsyp
         JV6mybL8hD0bqyVUqpWJVSWT6HKCIRpo2GR3mjp8EDtsdG+qP+qvdeN48v6izNrhvp0a
         StjC57XYwTzb/ccUiRTT8b1gg0WeS/HBH804uSGBfUCqv3LPSljP8XOgGpAqAag1GXGJ
         VQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727307; x=1783332107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dak13vsaTB1dmsrIHeCt+zMpkHOZXt2RO0KMkS+FxIk=;
        b=iCU/r8wH5OuaQ31G3SKdwHd2J2mWiSUGkyoiEbUKSu83MhmCeSUSPi613Cq2Q5RIlk
         QnNlQOjrEZUgJ8ksi/lELsFy8RqfQ+GTtVl+r+KwfgzVJWrk42YtSJBc1xDQEL9D+l4x
         xf6DuiAemSXCWaBM4tvpUxEGEQ/MIrjy98bdz1BIVuF4mNDqvXm9xH5FZlCG/tjvdhAq
         7yBZFr5kR12NEOWVQRmhmpZ0oWk4dXC4R/O77Q9seXzWDkqh8DypYt09zqMGmgnh2JZe
         mdxCfrvCiwzCXw//SYdiBou5Be6GUXm874Y3AR2aNZRSXC20i8uIkhPepQZxQKR1mmFe
         /CoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8J2yxu5nZWRjOX3RqSn3GzBDdxnrYEND7zm5qd+jn+qNu0J2Tidj7hujp59rHoBIyp7jpj35k5BKUFkC2ouHXW@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn6UFXhF4nwwubuXJTjssdS5RP9FzojveV4Mti/VlOCkNzV9iE
	j2ahHtIJp44yUV6MF43caoj3k+OuJax3k4ETeJ6BmIWqaS3YH4e+kiY+I36P5TherpeKpNP8zaR
	xNt8RTxynyT9eg/f9QyGXWtm3AXcbuQM0EctYHXVkzhE89f9l31tr9XOQFj0dqQD2ZKIaXvP2xT
	59mw==
X-Gm-Gg: AfdE7clG7hCPGI0M4B3ty9yu30xJh/MOo3F1VELVIs2sBhxPmjuVlFD3Vguom9iIvhJ
	gRSUCmtVK7q2eNedQqVBGGOAH6w2Hbqa3UJPIAcD9yRYoSYl4tUEIHEfkVR65batBamwHbsZ3xQ
	ilI3vZUXMP5h6AoLjIfxcOmTwUFCmWgnjm22J27LCn6YPfa7gvWw0CNraPQvTHlEEwZ1OVjL6CO
	ZMv4ry+xWMoh40gIj52JkgVHxRFAoAvaYJKaunfHAUKyXqEqcnPcscvJgAdpHp++hg91U8xm8LJ
	eaFiZH91mP72Mb7kptAwa0qgCzBhHDLIm81+F5jRckfTwlc9bcJ+Iz1sUNdoJEklJ6WZZ4qxWz4
	wgolUgHjjsfhH1YKSL2TC+gsc5vhsOEQMcb4IQqvF
X-Received: by 2002:a05:6808:c2a8:b0:486:560d:aa8b with SMTP id 5614622812f47-49217721151mr14163796b6e.26.1782727306886;
        Mon, 29 Jun 2026 03:01:46 -0700 (PDT)
X-Received: by 2002:a05:6808:c2a8:b0:486:560d:aa8b with SMTP id 5614622812f47-49217721151mr14163591b6e.26.1782727301644;
        Mon, 29 Jun 2026 03:01:41 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:09 +0200
Subject: [PATCH v20 07/14] crypto: qce - Cancel work on device detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-7-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k97Y8ImiDOSEM/i3DdCydkceZy4j+DJOA/cqgxZHohk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJu2j4B5iGt3lgZNmZCIOqxBYKHlpUlmdmNK
 obLr78GakmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCbgAKCRAFnS7L/zaE
 w879D/wIIjeWzgU6Mgj8NFmmou09FD8ZwLrlnpBMuNQ6T93B9MmEWJzLggmXvFhz0tK79qStVi7
 RlFA1/40f9ZOVCiE4h5hJTh/8nVw5M1LhbO/ExjeCCtYg1IMpaVWawKSCQX+SuL5b8bqn2A7ZOL
 /fADVqxxeaHHQMnfAE2QYylq7jrwZqoeKnnIEsjJrbn3mvSj7vZrYKX1qLySAQSSvBgycHbVyVC
 jiLWDuToa6BMjh1zxM7/JKiEL+1pWA/EPLbPeiTtQGv6dHAEjov+aZFsldpbMyhM+c4HAZi8yeg
 yebcr1xdDCo2ybpZHTCm30+H2vRIgxJ3lp2/wXk0JCBBel++LtHIJnIZwPqCGa65BCAQC97SvOy
 txKcOpBdCc42/+MaF6qKbiTHoThSsNRRePD91nWsukHoi+NknUEbCJIW5Xmsnyd4otJwucURvW1
 umW9ZwlW6fm1cmhOiqXOeqZ005MhbIlulCbWFYW+dO8m8Fk6KroqlsrNm60g3CfOxNkcJqdCCpN
 P9AIBooZmPNVl8+D3tJLbkKQyxQI8zlwmP1g8sO89KmtQ1j8NPJ9fflrN6ZEeNQYvg6iSK3XD7V
 ldjRIfvRjQrMootA/aeUjlzwf2unZp7y4cLvtO4rQ8M6x8f8JQFfk+Zh6XZ2ayoxqePAMWGWGBJ
 l8GySfJl5GhypWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a42428b cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9
 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: OWsMvoGDv7lTWoqMG8hZU5DP9GCHSfBB
X-Proofpoint-ORIG-GUID: OWsMvoGDv7lTWoqMG8hZU5DP9GCHSfBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfX8joIZyF/3CB1
 RS61wAOTurcSaC6ynnEHwiE2pm1EeRtun9OhgCPA50Q9AG/K2u91XQq5diJuxpndD234FSKTMIy
 Wyj+IUZRGqJ1YBmDjKB01ASL+y8btZ+FwiO9IjT1b46okP9EhSEP5XQflbr/x+6QoN7j13JQ0UM
 Zt+Nq0h5IDF4Pv7PycyXegQL1/cpiW7PIO2olJPi9caFujelOqcL22NuuV7DGqErLLgKxiA5laR
 7Vb9xA8j4MSqNugAVUqV4dIAMKTF4dJPy+aOChSrm1kS79SXfwTdx00BOQlFkgZihFfnvEKVvb+
 5b3yGWRdL+bjFzTAFudPcmclJUK8s4nRt+bVJSWrQJzJcv/WdNRSIbHM9DlshB4XRwa/mq6TxIF
 wkDMA2RqjwEE1OvlvhDrgoyy7P/JEQCDGhtJC6LJlHkQEj1arYwhNny0UOaNNwTvDJXmnOORR6j
 VXKTfmX7LuW5PhLPorQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MCBTYWx0ZWRfXymPtHLaaY9iN
 xTPMhCdVPWllqg6quAI76Mt73S1yUZpP1n6+/V4ud9dLtDVcf86tUdOHnIIDYsGtIjfnQwzzr0t
 HIqW3u19ulZ7l2cxvrhYzbcKLo1w8dE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030148_952289_1354ED87 
X-CRM114-Status: GOOD (  18.17  )
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

The workqueue is setup in probe() but never cancelled on error or in
remove(). Set up a devres action to clean it up. We need to move the
initialization earlier as we don't want to cancel the work before any
outstanding DMA transfer is terminated. Make sure we do terminate all
transfers in qce_dma_release() devres action.

Fixes: eb7986e5e14d ("crypto: qce - convert tasklet to workqueue")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=7
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++++-
 drivers/crypto/qce/dma.c  |  2 ++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index b966f3365b7de8d2a8f6707397a34aa4facdc4ac..f671946cf7351cd5f0c319909bafd87e3af701c7 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -186,6 +186,13 @@ static int qce_check_version(struct qce_device *qce)
 	return 0;
 }
 
+static void qce_cancel_work(void *data)
+{
+	struct work_struct *work = data;
+
+	cancel_work_sync(work);
+}
+
 static int qce_crypto_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -227,6 +234,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	INIT_WORK(&qce->done_work, qce_req_done_work);
+	ret = devm_add_action_or_reset(dev, qce_cancel_work, &qce->done_work);
+	if (ret)
+		return ret;
+
 	ret = devm_qce_dma_request(qce->dev, &qce->dma);
 	if (ret)
 		return ret;
@@ -239,7 +251,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	INIT_WORK(&qce->done_work, qce_req_done_work);
 	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
 
 	qce->async_req_enqueue = qce_async_request_enqueue;
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -13,6 +13,8 @@ static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
 
+	dmaengine_terminate_sync(dma->txchan);
+	dmaengine_terminate_sync(dma->rxchan);
 	dma_release_channel(dma->txchan);
 	dma_release_channel(dma->rxchan);
 	kfree(dma->result_buf);

-- 
2.47.3


