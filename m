Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6826BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=R5BmKZwT01WvOVHqTEhAdiq0JI
	unYfSR2n/oDOaAb07ITc/fHXeWQ8d9CKJUqnJmeEDZQBjybMCIi6/sFjJOOuK7x5/8hhHOOKKyUHe
	Pp7R+IESkaGJWKalT/jkV7YuqgCnMndoG/kQL49U8XnCW01R6GUr0jJb79LPgP0OZoQ5xTFiu0F8n
	GBzfBwVwGb7rvm1lNOamr8Khc6f59MZILOKNBgV+4PRYEKL6sBMkbbZfuK5AkxGnKeUnYKzASQRr8
	ZHr6ZS0OQyKWeOx/vt6S4twsHArDsLWIbetGTY394txt3asL1xCBg0Xoek0QDxcQ1obxuvvmzL85S
	BhmNXnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIJ-00000009Hwq-3kdW;
	Mon, 13 Jul 2026 13:01:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIA-00000009HhH-1zUp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:01:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDdtj1480703
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=M65MNopOV93GUyBp
	bGUu7yuKBO4aN3cADTUPCgFE7bxMQ4PD637A24sb5Qe/ZAqVyoQ7q7SgkHvOmAxa
	YiRejNlh4hBbi+bfuetDusp+OwSyIZAwdtS+aHQvY8mlhEWTkNynHTvyAgESCw6Y
	fcvoH6B2WNuwTGy4RYabcK5/W6N8AFy+ySotFo4uirWiaQBQjs/gJue7PavgkPV4
	IlKhXjfBuPb5gukA38rgslHphDg08RuvjrQsrJngomgplXt2UwYa7lg8ih7DmRfo
	4Sdi/T+UrPlh7y/thZhX0KP33e/eh1j0IwO4OdEfdub9X2R1HUykgvqpyTMpukri
	U5k6+Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavrsq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:49 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a0c02365c7so5384033eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947709; x=1784552509; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=BhrEuiUVph7Y8SHQDEQoP2VAAVjJkvU8aSLlXBnv/6MHTwv/GI4Kk8akVLoiEJBCk+
         CFnsHwLTgJwus0TMYE+ifDiX6mMxH1zv+8xjMl1VFB2fsWCh+rlXOMyBbxHK/gs/d7e3
         F6pz3phUQDFy/9gDa969pYVdLCo12MOGLL96HdNpKjDcS6fFPdBdbjUz8XCn9DeoPiXo
         IkmJSE8c/wKUj1+c2aq3TT7XlKv3lbaJdtgrua0+Vxw48jBGxhrZQqbR+L1fWN2gCywD
         O5tDTtAmfcz49N+mPA5kxJ6g5zEPSY6tKNE0k2e1nUYoiYzhzWZT5RIroPrbVceeZatR
         F+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947709; x=1784552509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=nazM5DLG+cAx+n4hVaTGzC0O63yQuD2Q7YFZ6CctBPNG8PfXLbB93Jjn4372qBRW7L
         vLjZsn5/UxLfV7Rmlvl6XeKMfU8oV71t2khTaoWR6CitJipt9RIks/5VV6YEjpIuTzzR
         loa2OIjUuP9C6JPHLguIvqrxaPWK1+1iphTkGRFO1STVIP39cDe+LAkIGKE7h6VoGQxh
         zGK9rw3GF4EmvUiduFN0Mi80yE78WgsWLB1cKjXPh/ihL4jGj7aKOxGoti1TBQ1Y472p
         gF0vfLh5jJ9M7H/MbaF/XLMeWJXMUDQH5wmub9R4IXWsho1iqNDF8W88hibZy6mwPbOB
         UguA==
X-Forwarded-Encrypted: i=1; AFNElJ8iq2B4E3L7EFBfEMA7lVXOa364XtBxhJ/PJTsXl5OpZmfxfzJsdktEEfDD+ynZLJxTObVk05+Fx/O41Lkz4QSv@lists.infradead.org
X-Gm-Message-State: AOJu0YzMgwMsB60Z8rXeOU1raCtoC/nfjIIXlDaFbQdUUgfJ4VSxMQ/a
	yLAsvdNzO51ix4WD+V9j4GWp/YDGvSsrqA8duKyWQjiWHDJ84zhKuaCH8lu3SDJ3IUya0kYAAuh
	WMUAmczWsZZKnSt+ps5edMQjyKDUcAlk5Pa1ofrtoUQFK+mwpZR+poOh9hNvJ+gCW47W65ClXcr
	THuw==
X-Gm-Gg: AfdE7ck4iq6X0Ql1Swra7gO/PKVm5tCS2rwOjGzLqwA0B7V+2k1WLABUqgX7dWYqzEA
	E/burBfjHBuW0AoXfMh6anDGuBESqVkGZPvOaLiPqwEcB6nCfl7bLww24WGUQ4RrUxfej/76ZTQ
	h33oThfmKOgElc8mIXQHEdDbA7puP+B6xbwcZk/HKjHz7z9VUp1IgjsTYJx6JVHX1AK1kEdE8ny
	pMk3Caz3jj5s3jiQOCbQoIo9Br7dBtvZxV1AUCrmkPdIXHpo2gzBEpzVMGhJ673RtyUgeT5jRvy
	MWuPN56BtvmIVfGigznRM1KCgJiHBe06ak7kd3Of7Lghh1kLagpy6DL0aAgj+WLX0p1uJSNB5cC
	l8sG5TiNGCh+G14mvTGCN8eeCQD8xa65aEPRsibDT
X-Received: by 2002:a05:6820:709a:20b0:6a3:7976:704f with SMTP id 006d021491bc7-6a39a5b9a15mr3798590eaf.26.1783947709003;
        Mon, 13 Jul 2026 06:01:49 -0700 (PDT)
X-Received: by 2002:a05:6820:709a:20b0:6a3:7976:704f with SMTP id 006d021491bc7-6a39a5b9a15mr3798556eaf.26.1783947708525;
        Mon, 13 Jul 2026 06:01:48 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:08 +0200
Subject: [PATCH v21 07/14] crypto: qce - Cancel work on device detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-7-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
 bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGcH5zXrPcNI+T6P+/gycikSb+qYVbQi1DQU
 r+MiQXQlcqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThnAAKCRAFnS7L/zaE
 w0KCD/4yP5QoiE+i1I1Dzf1dFEqW7uoinT53GfY75/yhspqMCi7HzFWv3k/Fy/mD88OyK5AZGIS
 LRY6tDCfz1wOru9Bus5K67jEZgWlcWveAsPJrmsoaoRgJUP7sdCG1bkn5Bp7ODqCCHuW7zf14LW
 UmYMbCvmd5gySryeZUEocgI+sWvKLhBticmjTdanVKNNqsDh4jUxZn1NvcIkFMK171gLiVVEsIe
 QFsGfMP/AdcNcmSnlJy8bqbBXMTybZZ2+Mk5lZRmmYk1l4KBmHfyp6+s4McQCjip4ePxj8Itkh3
 r3XyPBOWSJAwOtNKStvuLxNheCdjccFNBlEwdZIfK2AmLlEWFcQkUO+ebCalLbT287JVhSezgqN
 hqIKxzTQ07014Vey1JqC2KzYWDfqdJ+5OAS1KoVlU0Y3ADY/x8U7yI6rJ9rebE2Sg78yV1GekIh
 Bz/lLUY2E1azgPj/PBQOtb15m8o3Cs8aP7JcXEiPJideSbc35+4o/MYKG46lkTzU6ypjPKnyye1
 Va6osQNaXPyKd2Royu6DliGPJWGT5Y3nBQWV76oM0IhRPKZBxFhAeuhi1cYJhHje92vDsgJPk6z
 52nF14H/e1UWFsqdgf/vnQfEOHSc/a4qMXqJC93+tcISNNptsbnhkf4Cp7YUPw+wZ40a4uuAYI5
 WCfSXCMXdhbo7FQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: ln0rzdVhZXhXR-OeKdx4wj6XFyysMIyd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXx7Qp9L7x0FfO
 +nd5qicO3cpM+RWZUKr8x3BekqD2IMb5XZFIu9HO/T4E0rS9hBQmfqlXccfrYIWY8Dv/FxcbPax
 5FQRp7EoFKydbr7pq4v3QSCbNNlv00H5p4f1PSEXz+KGKtiLAc3DvD6scSRHtzyU0gVIB40Nlpd
 ewTVZdtRB1+VgWMHdINh1wD8HQkPzdOGLMUEgmXL9CZz9COPb+w+iMXwPFL4gsCx9kQBt5gf3hn
 k4W8Y1DSR0iEFoEbOyL9xmCUeku4IgR2lD/xK3vobOlqZWQzKr/+LzaOY+hYPHGpkK4ESnnpFfL
 MPfIoaVSrasSbfUOyOt1QjFaQkkjD3cnhauCJcY0VYQ+UUZtBKiL0TFKN9e9Ou2kFhEBHkLby2a
 omG/6SSYKlQYfRvTOfbUqR+Zmo7qgBsjqjlqVghayAicvSqeMCU7tt6M91eMh6WQeT8NkmXUHuQ
 7hz+vYCln/g30US1Png==
X-Proofpoint-ORIG-GUID: ln0rzdVhZXhXR-OeKdx4wj6XFyysMIyd
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a54e1bd cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXzTv+Cb7S8mKg
 h6kL4ndnCwnxp6no9ZiO9JPIHSxWPI5Q4wN8/nGVD8QApXkokDR23a+20umckHhpWuVW53Nh6Xw
 9K2bZZGJ0hyVvs37kkVbXDM1vIp0NhQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060150_573433_1F5A7DB0 
X-CRM114-Status: GOOD (  18.30  )
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
index ac74f69914d6175b39ccde43f16269570fbcf715..b52a26ffff5ee733adcf4e8cf8bef75018dfa63e 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -185,6 +185,13 @@ static int qce_check_version(struct qce_device *qce)
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
@@ -226,6 +233,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
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
@@ -238,7 +250,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
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


