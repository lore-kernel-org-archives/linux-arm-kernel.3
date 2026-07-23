Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABA0C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=YT5Fb2UQ55g1ITMrJ/lA8kZF7P
	inaxbTHoa23uLTkgCRC6ZwSN8icNnsakbEASlEPJs4S5IbshXYvokuVFGv+BhBI9whVm+tdS1iP1V
	r/H/rJcyvj93hCE5TiT1hYVj9Reo9MqejRVtbiVoequPQPW6NlwtviWuaotCkK8UwNuPFTwXXQXhk
	qergk/jaQFr1Iyf/1PaQ1F+fHqP9fZP7Nemo80wRaDf9QuWByHh63SJ9r5zAAHHmyFgGmPQ6+oKbU
	e3ZYtX+vC5pvK6+JyFQ6VS5fKbwe0OlEjRYGFvpd95doAp+7BELlp+2gs3+IBoq5RqM28e0ggjtya
	y0z/eHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmww0-0000000EmAA-2Un3;
	Thu, 23 Jul 2026 17:10:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvj-0000000Em0O-46gb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:09:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvYEv3954499
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=RuQZ6qncLTOl9oSR
	ntR2U4RL+S8vxLh8JksY3Ebtk7fUx3Pf2qr24/BBqcSv8WFagXcE1ZaEWivY89N3
	PoisljpFl6pB7m8+WbmUWrZ/wPa3uqzPJpRyXplT57kHRk/1SULaznRQx2Q4OYwP
	Y+YrZzuk0W/J3zSmeRjIW1i6q0RQAfuCQsCfh5Ot1A4YirbVpLxrHRv6Lu7LXonl
	bY1IY2bGeQnR5YfCNLUSo5pJucJFko2Pz8LWkQJ4RN9dJNL13iD6WDZvv1fQo/1Z
	GSXzqFqqO56eD50r2J0LwKdt0TBkFQNylPUQtNdxCEaGsqgLL6lR8tlhIDdEhyxe
	8NdMIw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fke0ktnt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so21202131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826594; x=1785431394; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=PSySFHUyQZMa4MkPoOGTTIUe4htivBSX0NHKTFnNMBmHC81W8N6FEtN+j45/tcN8ZH
         hyeqwzYX+jgyaEmLOxs/tWygmGtED4Ct3BBFS9gYA5yYq1W832YNo4LzK8FTn8KvBHJi
         MUlJtHV3z1jf9yVUtESjmUjHjiliAAyeXOHRekII+9mERjVmai1XcqcL7kHI8d3synBf
         mzO/fbMv4YLp2LwHEAebEjV23+VRifR/5C2MFjGG52VmqsBmOBTSr+eQbOyN9hJRT5ut
         lvKnLcXpqKXO8g1tF2WnWmWz48fy2kcUW+hBs709Tq0XWEVdbp/J0+4orW7rI9quPymn
         xHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826594; x=1785431394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=nHpOv9DFMQEYBdgXet/0bty5t5a4cOYYTbea+dc3DyBqB1MMhVX0QmTzAGEgK/KSU8
         2pbzPazr/noGgar0BQtFt41itzi6RFKdzojkNdX4bVTc2iu+B3P/Ngi1VJ3dRWkQpJX2
         eeLL9EFqAS7C6vSQXiFTbGXmRk0203jJ3rJ5fiCplDg/z59y0VMbQAePGB2FerVpa6yr
         Mlh+RD9i2c1SwAZpFTsMYtUvEt9YkXoXDLcIN/Zf+EOPjP2enOcWa6RdtSY2STehx0OK
         zS1h2CtfC6ESGhwCyRpo6mylwidi4SCC/+IZUXij08ktd0N00awW6eSqXE8IEZYwvl0o
         WTTg==
X-Forwarded-Encrypted: i=1; AHgh+RpXM2RRVEONpM6SrHnyKmrQ2iYei7rUBe7x8JuTDZWdb7jd3AYsLnfUm9MiFosnmElZdN7MotkkII+wqoIdpUqz@lists.infradead.org
X-Gm-Message-State: AOJu0YyuGRofbdvaInYAy1oufqCdlWHf1jcRHM17dOhDlnHBLWjrdgvk
	UWYrgD0sanSe8rfY/wNJfb/CDp4ftIMXf5iQGedHqtRMx3AN1J4K2bSoW8H9xi9avsHnHdU3qLy
	ooraf36a3JLpOXAUIFFqiXINKMd89lu8xx+/GjAZ4tCzMDOvDRueRY0bQLFrR7/KXP3osHPPZSB
	Ns0w==
X-Gm-Gg: AR+sD13Wv0FNXXpRrZRrXdbVmHT2gCIIMu55Z+rGvP+SCohFP1JrvWnCCjV9CVGeYdu
	zyppyvGVqbh44w1MxFL2FU/UdoRbr+I6SY4jCe9hMWnG/u4Dnaj43p2H/eKhc73fKH5D8jPr4U0
	Q9/leRGL1mW2gBCHnHqmKLhRZDl0LYsp87OI7aI1Yx7j7wL35zL0PX25wBL5orNO9v2/vkborho
	8o0AIOKPozOFjSWPn7YTFaFL1ZurxZyrpwZ86h1St1pE8sVLw/Au3l6ARsjaV7nywKQS9zy/Bhs
	qfQ5rCflxtssA7bwVP0gubP/QHUo4siRgHbwQZQUs9FMxQTwzGR6qLXwUrlfgH4UZ7C0Tz4hM3J
	Z0x0sNkOChXTLXKfKCnIF20tVb5ta
X-Received: by 2002:ac8:7d86:0:b0:528:32b1:c202 with SMTP id d75a77b69052e-5283ddb0edemr36278951cf.7.1784826594224;
        Thu, 23 Jul 2026 10:09:54 -0700 (PDT)
X-Received: by 2002:ac8:7d86:0:b0:528:32b1:c202 with SMTP id d75a77b69052e-5283ddb0edemr36278371cf.7.1784826593725;
        Thu, 23 Jul 2026 10:09:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:13 +0200
Subject: [PATCH v24 07/14] crypto: qce - Cancel work on device detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-7-4f87bb4d9938@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NNnz6awfeEqmEC/yqDO0GWP7yizfp6R665Mk39/3FRo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrFXChhPvWs/N/IJBpiKC8XVWqYScOKAwNPF
 CGQxQZdRKuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKxQAKCRAFnS7L/zaE
 w6/bD/9wZpY63c2tN+fULVfdgY8TdNqRNv/T77YoZLohc9Pm9Gee7Qs2XWHGQdHiPLLVSVcCd4S
 TXtc7Sk/SU3Jl0W56Ay8EHyxVzsm4DdysAyDzEWQdlNIPqbweU1jK3L4/qH9Bo2oJG2YM+F2MxH
 5+90KCuhvDIWayeBqbQ+gLo3xAmKWq9HK/SKI4P3n63gPic0zkFglQvq6YnXubK7DtCBYXuLtm0
 it4DYDg5Joi4/HnK4uS0oS5Ao9v4Ckf7JL4I91/gVCJOwIcZmX+a9fIbSlcupDIdp4SaI7oRtID
 lV1x9u1QV/ttYZ4XKByiidT5zQocLaCXIln4cRvUn/YQEWRsVDqSzQllkjR1lKvsdP3nk1PYTFZ
 Kscl+fWREhhiVaMHyKsFSgNagliWKjnTes8JIq4TJ8xm6dYtviNrtS8z0Ig884T8Vzr1xiPDh8y
 drNe0SjR5L+HsGcD6mtd0LZAk4V1BH4MT3DWZBpxWIDmS170ynnK+6k+eREnqbZmBmKfFoBJFG6
 CLyA2AN29pKQ7Ood5qRWfbTLbQa9h3J0vMFjgnllGesotD3mbkd7ujeMaMxsIyxJqKergfdDYzQ
 IEdfHMU96YjlhhzJnEBOE2c2vTzxpe2QXP5pQPPOS6FDKXjRKCvCjxOwst86MkGJVW33fRVjR+H
 lSotaLlYU+tHObA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: EjpW8H9fJxE21bLKmTtVgR0moz8fPQNA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX+8M6MrUFjtHj
 bGzW3kYKHBaTOJvWJ9vmpZoWKmXw27+UOyHiN3/rXuQZOWCT4zyTH7SbS6LrHzn8ep5tZ+Kvq3i
 s+ryRKTUttYQmUh2s6QeiELaZDf3IRo=
X-Authority-Analysis: v=2.4 cv=S7DpBosP c=1 sm=1 tr=0 ts=6a624ae2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: EjpW8H9fJxE21bLKmTtVgR0moz8fPQNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX9UKdNlKiGjbe
 n0WYhQUTNPOV6oCCWqNV3KKRuIEQU3UTWj0ugjpu3YwLh8e5EuSwBhQ+P+INweIBTEZAIZPKxYJ
 Z5s/3fNWqwtCF4Mk3mdecxf4MclXuObVELURZLGSDzRRNf9l1QgqD0ZCMN8557PnfZ0Fe5WH4Qr
 ZHZ+ozswyz4ha695zHxkH04a2D8RdyxYyIJ2zDhBtzI485xBzcJ0iV8VZhTKCMIY2CUyFI5LhzI
 q4sRHmanPHaGNdBH/4wrvKRYTOTsBkclu0E4hy9HRFOyh4WWJZErw5/2GVc7E4rChCHqQIyePCg
 VYKjmQgUu5f8omSZOev3KmlDAXwkwp+Qto+i6QsJ0vbLpVyNL4aRpS+6pERGqyDUP8KYodgviAV
 LAfUDT5fjYGvWHWqCow3HA1XYiqdutpjvnHhlM6VLrr3VQkHSr1OBULd6DoM2QDOUgKxpiXG5SJ
 I/VI7Mt8rWhIbi2ZBnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100956_148232_317A1439 
X-CRM114-Status: GOOD (  18.21  )
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


