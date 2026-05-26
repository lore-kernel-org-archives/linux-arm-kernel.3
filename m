Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688D0CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1nmBooCYIL6gijj0RhLOpiyGlP850IpBxaJF2Uaxp4=; b=Y+0yTLaosSGb+ULDnu/GSBWqDS
	rdP3O8K4eJRWWsVY14t+T/JWDg0eciZOtzL9eqD8zUpPLXpqDPSPD/pSrbZ245zsyvzHvzWxFbQm7
	Mmgq+IFzjenTLMTkB6fHA2tqHdzIlKPVjSufqIHxTPm5zfRdS1l11XsYQ5Fcy8mtaC1dJO/74nFvC
	jKskqeC30EKk8a2m9nAJmjUbBukA0Ieyb6tt9ef+1ARQ8nynhT562Ag74szYOFBh5Sw4k/GZZn6td
	klh1gbDjxfVem3mlwgOubuKZvcj7ZggkemnpPuqrS1qeUlIcLGlEcbco55SSqTig7gdTIV89TX7u9
	M1umNYKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZf-000000021DU-2YOu;
	Tue, 26 May 2026 13:11:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZG-000000020t5-3nuF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsCkk2554544
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1nmBooCYIL6gijj0RhLOpiyGlP850IpBxaJF2Uaxp4=; b=GimBwBjMGP2fclBL
	AKTWRMQn0pV40D2BED3S/IHANk4+2s3Hqm3BEfrhTZjsUVYVZEm3wQKL6zL/uCYa
	XsqNhUBT1IIhmJ9SD8zypKE50zX/Or6/rzM73vlVdIgZAUJzhIogcQ65ZIbUe+TZ
	bTG4SiNE8gZ07p4SYA7B2KP897aZiCwsMIhUiKQ0yXbM6hP/fT+CLvB+yJIOFjFr
	qnoB5Rtl+OFXdvpN9yM9Ji7/rmuXK+oJE+qDcDCNvh8eBLDeFbZHHT/gGald/1JD
	YuI5Al59xQFokwRrfbwZO+9D7XPwJvcz/USZlbRWIXyOii7UZCoC3QGnvQG4Xj7D
	QkJc+w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3svys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cc77982c5so12284147241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801093; x=1780405893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1nmBooCYIL6gijj0RhLOpiyGlP850IpBxaJF2Uaxp4=;
        b=bYifXm4wdy3c0kBt2WlLwjU8EScWULFxsixMIJTHV4lBzxcXs/V4QGddCBzMJtDTtv
         xRnnxrQa65W7HqSDSSdCkOcep79EoG1lgIMvlKN+ZJS0LMCx2eNCTztOgV6EcpkpOgcr
         vahMCaSF8/azTb9AmiTGZEu/hQNOlL4x2CrvxfCIJ/b3MBJlr3X66tVeJR3mfanZQbdd
         SZ/uzUWA+PXhRJMQ3Dd2PjquZcGbJwhtJbgtPHFniadRUuugumdJhXrLPx6ri1MzY2iD
         LIEe+cmokMDyErYUPY+k4Ibi8i9UqIPQ2syy/G9klQfi8vOp8tK7JMTyupA9muL6E06a
         5QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801093; x=1780405893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t1nmBooCYIL6gijj0RhLOpiyGlP850IpBxaJF2Uaxp4=;
        b=nGVpY4vRZO6wmHZNYIIbRvNLYrLqFCXf83QuWallsl39JEKYrTtPq2vT5BJbzpiH5U
         y3+rF5cokByv3SiquISZ6e/e1Wd4ZSV7OGQ0pIzDVrDjCkuJZAgrJWSk0V4Ma9gX2lMg
         BE2HvSnHQ6W7R9uM4TMuqEM1wdzycRxWm6gler7AAQQH4KEZMYKnDVXpp1aQNEQSDW5n
         tHS9jK+1+ijCFgsZKbpdnf3V5eCLcVJxSDUEiR8BBzWHA2bZt1be6hjUmJpz/LtWOzLJ
         rvHQjVhU9F8A/3opWE/wbL/Y/290lEfx3ljZVgeK/zeWiMLev2np+S201EoO9WVzw41/
         iefQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VylquTivoItqAyfklNwcls8DNM6m3gph+RIz4gmzIx3avXvc2xNDJKzO/DcMIAR+9rgNGhYNCrIIqt0O0KWJZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxseDtM16QYJsw7gBMM7JIBlWnulzhhBtRwmxL1k6do8StU+nTX
	k8Gv9jlcFyYWfSX3mqsro2gUBmhhDSaYMS+WilsJrBhCQAHKQeAOC8xz+Nc1B/vWXoqwzGXhAuO
	umTcGNuYFdPZr1eY9Ne6PbXIMOmKtGtaRa8sRX0ugMMoFHHcgQce8Bmqo3SqkX8I77Sl0U2bqhB
	nj7Q==
X-Gm-Gg: Acq92OGTd4aTg/jPNaRRSa/jCEK6iBlzXsgeuJjoCRIMXAwE6IogL/N8z9IvbCinqUQ
	Ws8leYtqhlDyKnV4bG/BBw/pemZZwjmE43DxR1hSuJNx4ITHXNdSONQgU4ji8ZwDUd7QRT0xW2v
	HzpelRXCXw2hYevkheu/iDGpTXYYMsd3200VWsxUkK5fLJXGqJ1l4LS8QWXBdole9XYpAZaHlpR
	0MZ7DUEEfiLYDKe9wnY2xPSNt93ugyciJMKueu1d/Qlct1D58kj+DAhqaBKbLg1QNbDCt6EneUd
	spmaW0zPQPGUizew4g13m3pKi8y6fpPNViIiw1niea3fno9IOWHEes0ohvN26BuNoXc4xdt74YS
	4Vxk5VlALKijqRTwJ5OEtGVk87r1DW4i1ku3+ZdH9BfUK9jdRpg9kKjmo3zYThQ==
X-Received: by 2002:a05:6102:1453:10b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-673bf88569amr7323136137.4.1779801093255;
        Tue, 26 May 2026 06:11:33 -0700 (PDT)
X-Received: by 2002:a05:6102:1453:10b0:633:9ac8:6bfd with SMTP id ada2fe7eead31-673bf88569amr7323089137.4.1779801092792;
        Tue, 26 May 2026 06:11:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:32 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:55 +0200
Subject: [PATCH v19 07/14] crypto: qce - Cancel work on device detach
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-7-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=atD/C70BmAbtLpgtk/gvN3TNLFsQT9cfTHvoiJm5/zo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvub4oPxpUvAbSVN4B/pj5xEWuzyl0SR2VFe
 rF8kbhuJYaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb7gAKCRAFnS7L/zaE
 wyeFD/46/l63yuSUdQlhfYT4OY/W+59STZtAewnx+aiAWACncqNoBszVXsTs7wsrckSz0VvVGaS
 29ESTPTJbrPNF7es3LUrk+dZ9e1clxUNaDDw1v1p2wk7Ppy2itCaDxO6TGOL8VNWUC5ppAv5e31
 gZprPnxh62JRjqFBqTEGLOGLLyVHy9jAVdPNvD793KQb+egpZrFw0MTMQZf+Rq2lQl4bmboXt6D
 +U16DuZPtw6KXxPUg7UQp/SSey+jiFr/zUd0Xb2juh9TsvXOK7V24UTJc1/ooLH4ossJwVJDpON
 lcrCUrOANF9NvsSDH74i/UYjXzr0NGMyy7fAXUwiJ45U7ofzg2/JMcBNY1i4VPSucL/504OEKDR
 vlaocEYX313WRsXI1Q4MLru3WQbJ73qX3JgPdEDE+Oitdi1hr9cXfXbrMXRlzq0bVv36LFXOsuF
 jFgZeOcS/W1qT5lDsj9XukBwleBmYfvray2BDzRftHqKmq3xGtTS4ThOhHPthm3NEFpO3IqjsG7
 C70BRz+oqcQGrXxSN6pdJ1fs6RGdcsy0rVf8GRIKe1PYyLX1XBE2SduPJNKPNfRR/mFWZzci0gm
 8wlPzyCSzk4I1SynlWAl5Zk0nVrkI7EzK+tCmLAqHdYYAPfLqepSXqqjC+JjeiwriryO+BRrG6+
 bA8kjd5gU5WehkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfX+pMew35DEIL6
 AK9exeqVXM8jbX9lPmwJr6ZCd59N/gx1ugB86NEO/AtUPAEPRgmq61TsBBsjLA99TiZaZ/CXJNH
 pfn//ZvMUPQbl+v7U9XtWAZlBPFg7Q3d85+66FE0x5DvG/GI73lTTNy0zC4n3hoVjdrNM6MD63P
 CCMHSr2BmW7eWBaEKMpbwS5HxS54o4lqL2Z+olYkVjI+jmryY88MEY/kqTrGNLdq3z6DUi2G2y0
 5b7kH4vNZprKMzOUoP5DJhffpYas/K5NnPX/zYltISoibAll9gtUQVKtAI0d0FAxKq8YSwUJ8hg
 BbzucTemcegVbAOS0Ig4+ezFzUcfv+wzTlmmjPAOaWhkCrgmvJAUbVmvjKDZsd8+10EKRB0UaGJ
 O4xu4IxO1zbM7BSnV2tCBihKr+x9xJeqbKK9u/5NgTOGCQXj/3ZWcZNOy7AADF7VyBYgRnF64V2
 Va0B46ODpJCXhlq65Gg==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a159c05 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=SDQHpg0AWQOuS8LWovAA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: if5fYd71JuhtIg_jN57E5bu0PLTuyuqK
X-Proofpoint-GUID: if5fYd71JuhtIg_jN57E5bu0PLTuyuqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061135_065918_4FD76ED4 
X-CRM114-Status: GOOD (  18.40  )
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


