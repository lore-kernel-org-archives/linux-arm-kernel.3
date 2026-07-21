Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA59C44536
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=eWanV/AqQDmHY4bfa9tjXOal4g
	p8RXD07hL4CRjDNjoUZEO4oLdB2ZA5JHQtwiLp8MXz4ku16h+MNmsZrMdeBHFgVatrd619k2VRXEH
	kKiqkcHFLxmOvGS5HhvjgBekPpdOitOvZhY6e27HP/nDwC7n8rgT8+bL/P+KVopwksGE192Ae+DFB
	yReFmm6Q8euhRL/l7ItVVlvh+V8py0ayogiTXEOd5iRuqhOptzIbyWAmjCxKnNa8OcVxq4nFCAKXl
	56/8ccKGZpsZa0BdWK68AqSzGGOrOiMdbcB87bCabS83WoDiBLyGEWz1wIOGrSXpfo7u1QL937i+s
	lyRq/4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbr-00000009XI4-0o4k;
	Tue, 21 Jul 2026 13:34:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbe-00000009X75-2Gtg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:33:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMHPF1793848
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=; b=Oktra4WxIy5mT/Rc
	cGxA8xNH7cInm+1056wbJrcVVQOzcX+TC9N4KgwRotMJZciaSaewZJfDbVnYHnWr
	2UriZ7K3J0pE8Jk2jWlIHVnANvcxBgpCA/vdstf1EiLd6LGyyvMuzqjLt6gsDG+f
	WRsaNilSBGGdArpdnXPONHB1nRG9K9p3nVwu6cOZvoSF1haSA35UouTyEcRiGGNJ
	xtRIp6AMW4aHsGyxtMRVGSBaATz/3RmvdFvv2BHRxko2Hx6ZfwKCwPzH60TMTIqq
	jKZgZkXpZFJ3rIY7TLPYAJpNTX3gjqOz7kPho3N3Of5WU6xMB7l5cShxTL0erdYz
	AHsgRg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se2emf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e9489f62bfso250238256d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640837; x=1785245637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=SEmrdIovHlFZISo+sxx23vCCosiZZzVEH+2JRFgYZiCNpMoApwKPncyDGbbiNkEH4f
         8a1HhdvFTrBdqBk5iD9tMOlUPupk2ZxTtXW2wTkqoy82OTHynXkmdqc1C36amxQwD1aP
         buajapx1mQVHnLMeDT0UYX3QUA3psti9tJ0uNrA16lFD/jIFLztkdgnrWPNyZ60rquG+
         mfXXSX+GCWpGc44zMA1er0AiQAlxTyoCTuIz/XMY+nIteRhOLrpFGbHG3AJhj0YqMeHq
         ZknfZg5TnO16mAA0wfhEQcDfpZMeRYeRIb5G0k/ltQ7Lkdn6Xyxx2SOrw1D9QDZ7JOH7
         YCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640837; x=1785245637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1qOoj9SQUQgxQzB/fcCsnUQs1r8P8lLj6KzEKTr4FY=;
        b=ePOOIcJuJdxJPOwbe2S5RzTkbH6NLdQK0Mmv208d7LE0jUemrk73Po0GPwYeaebCNH
         lylufM5H2HsEfjDP5w9UmsfKVDQKCPvYAfiKiVezf6T1lG+cXnoApIdTqCDkL/Ic3XBv
         1wElBEIhVDdFdS6si2YsZT6ed4M+GXOMr0ggHwtiUsvlWs9v9YWsN4deiNrcCqt1V2/z
         wEdYUkJFfxYzg2UlfX243xvZgriNR8A3EAo/Gv9uOBOgUpsb61pBvCK7JfXnS7aIOz46
         SiYOyhWU8AExTJPCtMMIN1mAASOvhF6MCR8LgFbyhm2mD1kGMmZNRtjnEM93PLqAaXQD
         ++UQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLD9RexbH5ItQeeamMT3/mjuxuq3ma/cFAO1uqDPsSt6pxwYesRHsCRxKw0CFV58MXapJbowi+qqxoYurUD8ss@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv6MTLtTsIBIoQwdMA+haTQI6Vbpb12XZHVqOfj/jXnNr9TCdO
	Zxr09QHS/+fhbxs/dpd+HOeBBXXnyD1JXwiP4whPEGrL/KlhFHyFDlUOIi4hUNCLjczLzflOMC0
	82Q0gLcX6+GnLQ7eniCufMJzZ8W/Be4DRq42xHfqjWRb1h4ub3FKK/BLV7mWzsOaD/YnO1GWmO2
	Mwaw==
X-Gm-Gg: AfdE7cnDeBWXIShwN232YaCSQDcY8hnB2LnF8EdKPkJityfCWh0GMCbxL0F3JbY7t6p
	vL9TFloDI/eZOnpAtJ3U0vPg98xeIH7j8lEOvwcX4mwrBJScPbFalmiXR4wqjTUxBq6ooHe5AC7
	tGbvdaMBctTZWXRjwvIoisFTxt0K/n/gK/0ZRgnHMTY5vm7bksEqSKzjyJdUEKF1WCWpCb+ItVK
	b6LzQKNvgZTM/4ic7x70OKpNbo4+m73hk2j5PwmeoNs+24eCDszj5pHYTlHbV733cwqWCwQuoGC
	HpVa3Lhu4VWilUt9yd+fZ0SYM7mq9Fd5f+7Gz4nrcflpz8vbwRqRIHnqgJU1f7ehZ7AwVfAUXrh
	yQg8CcPnoe0EYc+njZoh3xGiEB6U+VA==
X-Received: by 2002:a05:622a:1a8e:b0:51c:478:32a1 with SMTP id d75a77b69052e-5213bb216b1mr179481701cf.18.1784640836790;
        Tue, 21 Jul 2026 06:33:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8e:b0:51c:478:32a1 with SMTP id d75a77b69052e-5213bb216b1mr179481301cf.18.1784640836247;
        Tue, 21 Jul 2026 06:33:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:12 +0200
Subject: [PATCH v23 07/14] crypto: qce - Cancel work on device detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-7-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3Uk7Gq+PO+9JFm6m3MN5V5JSBvVfsrV4+20O
 3cnUuBFwn+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JAAKCRAFnS7L/zaE
 wxoBD/4rXCJuoFrp6WDQETNj137xKTCo4AWVRa70FCHK1giT2tutkZjbNdSM1iO/nAiw2k+UZvj
 BDfSmmlgXcoFKRBehMco7ws1CA0ZqaignKj47bp3qyKDnFPYB1Kz1e2hhtV4tber739KEx4DGRO
 AFLSanGZ9LQHVMkmY8kGSmhifuqRMZj5aJzq1T9imMfMxXrY8TMswyXf6wQrYCVhEkUTC46CXD2
 EVwnamkIY8tYD64L9Dqiiw+3r+9um05U+UnuUTye0q+M1y4ZPS0jMunsoTQ7etsrmBbtZ3QDzFe
 wT3ObE7wmGBpZK2Y7untGvfNMPz7m7Y36nu95fRHwEP2AzW9n2YXbRnM1lQW43K/dgatJCxtfv9
 Oul9vq6saVbTDSyREmfZNS1KN3OG0s336Pe9n5eYe5tc9IH9P9QfmICcf7XNSWbBMJbG8R8gdSu
 7JxrNYWLn4PGjKHJrD+3nU930mDkBhozEvz6hrENV+z1A8hOiepulqntLpiCU6qtnyoXbEijb52
 MPdpyE6EW6RoOtci6FVKcKpDQeva3Vaz8ZEKovwWtA/sJ6sb7lAGVvcalmRrggv93xk3TBJ/hmP
 ZIwNmfcTVg3MDTkLAsd4r8H+MAJFLgGtlcNkSAe3WDNJlxx2y+pxDMcNquTFn14xV/7XM0Kkndk
 uG6QpnNQQKHJ5gQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: OHwxLgbO3-ppRnz978vtj3b8OPpF7XfF
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f7545 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX6Af8jqrItwR1
 6EY5slRN7Xr4d88NDgJH1gphRgD6uBY3T2uzFIs8d7szmT+1k1sgT35EVaIg4UOSp+zoIrGCnt1
 E4lcEtj3VRFFc4+XuFDslQnbsOs4LhU=
X-Proofpoint-GUID: OHwxLgbO3-ppRnz978vtj3b8OPpF7XfF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX8Q+9nIJHD7LW
 6BUmOlQWSxCcvTV0NbpF1Hv9hehueJb/s3trkEtZMYF3YOzPLCrX4iH/T6pd8zhFHj4FNoverhd
 Q8mZkUyUH7Z4K0Smhl4FD+LXUuMjhaU+X+ZtNBxATaJ7rxOrHWQjZJqgnfijGAeXWfrxVjfGQ1i
 i3GHxE8scZDGLSxQ5pln6oDBfNvuAk7q7mpJWtYl2XQGNK+OFYg8R6TL+oEkqzR9koAAmiD50Sn
 1Gikd7lLLq2AQmwtMVBOQgVRfn95Cp7Y+w3pAqSyYmTk0iBq9qB0gU9Fmu/9h5ZqZer56xgGsOU
 ZoAwCHTnOkGVre+ux6+YVIbOH0xQkeoqX+kM/SQAi+U4LtNi8N8iLEnu92qW+iX7I9x3vSyRoHj
 UtNiZu8NvsIEvsAV73dtBGBTTeTivNRSdUXgl0jH3xjH6WRVhdxY3JEaKfPplwXBJXlK+KKzyOV
 Rxu1y3r2/cYwMG0FnwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063358_703091_CEAB3999 
X-CRM114-Status: GOOD (  18.78  )
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


