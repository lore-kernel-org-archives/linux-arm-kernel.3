Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23153C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=Aosxxy2ftAVmttGqWs9OmBDu1G
	hVSF5rVW+mpqLLvyK5hazCeQMa4KUDR2VeJoyPfyCxhejqB1peLyUT46khKr55MtyHIKvofiuTkvT
	tZggWroslREeot+2QalS+j4cwx+uqyLEj03XfKJPFM8y2fITE/7a68F8vGYr0I3zjjBhxjbAa74Jd
	/z4MjyocDKDlkqJdHrcnPVnMpNfL0poaL0o8VD5O90AGho2fshghxeSTm4tzP5JGDj9dr/O9ocy68
	DwwhtqRZjJq2a7tcJx7OeXyK0uhzc/mExKa6flxp5Kq708KX9aMM00o2frUGA46/fFvTNxux7TsZC
	XznP/BNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGI9-00000009HfZ-2m57;
	Mon, 13 Jul 2026 13:01:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGHv-00000009HN8-0VVO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:01:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDbwC1299339
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=BPMW7qvk4rSt6hfp
	63NVF49Uug/1J+UqZRmu13NNmzyySLm+WIuCm8InPagd22orXm3WJQHbabsezl3t
	SgzsHsBJXP/0IuzYU4ChVZJVUMzZ0cDk64sZzQ26MzDO1zJ1govoSOLqDumCAVww
	qHFJ3EbQac2wbxux3joUkrpJCYNDFVP9UOUzhb4abwFOmBknvlfA3DpccDzPY7UJ
	2m6iWDMoHs6rBEXMZQuz1kfL0hIa4hNKxkCukX5Sd14MGIeI0rOgtSU+22xBvGbi
	OMMPGrWiJ+uCwVtrhMJFtMh5tq1WkgwY4jJQIYYewBeSjb6q3+x/HtPrbN7gcrwp
	KM59hQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gq02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:32 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7eb711362a2so2330953a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947692; x=1784552492; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=LFd6a8B4vEqX9/r7Kskv5/zx/AdSK0kjQ0FCzEJuc49NCFLZiDjmj7uLTVYAgdpXHI
         S0doG+9ECAIeI5BX0HbYPDTqXCRa3pe1S6EPGiC8Dh4W3WirrOQyV/WeEdaRBzPfG3Dq
         fIqtS0fS9S1kGF8h4jTcSVUIMezJhmNf+llFOSdMIh7iGavWUIQVbszokUU3Fjn7H6+r
         7+me3BgBwP3kfNsH3pGdpe/eWxm1THwMrvNJZTB6mO9qCNEl0LjWSgmy514bwxKmOY+z
         l+3hwCnrcpABYQOq/FuLFhTH6d0R+Al5Yl0QGHVCfE6OF+a1fGfHgkCb9j+gO1sWcPec
         4b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947692; x=1784552492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=dd7a0c3G/iWSpSUDF6EqnnPHIYi0mx3vJv8v69zuW8OEHHBBMs0BsNPyw2lkpgDWdI
         djv471n1og02tGl1VpZf6jVdzG1WUxOAVSw3BxMjVcrSwhNbTcNEITO7JlEvHm9ijDj+
         d9x2YaXtMo/zMKMw2PVgdWdQN6PYPbl5rwp7bCTF1tcF+JdexrIU/D30+Tb1W9H7JXGl
         26CuP0xlc8xYlnq9T6PYZpD99vhbx7p0cB74APAGSdx0Bw97ZJylY7uGseR3fReRCi3n
         MKJfkqa9AEcQnjC1aJIWtyhtWIHFqIjbvQ129HYIzFa/uETPxl3D5hmVMlrcYgaeT8kQ
         DIlA==
X-Forwarded-Encrypted: i=1; AFNElJ/9n8cWRR5YjXKOD2Q+K8Fn3FirHhG+cG63IvNNZpfzFlZmZvV3nKqGJJcfAiYnot0+k2Rd5nyl9sOStlKeQrgW@lists.infradead.org
X-Gm-Message-State: AOJu0YyozvLKTRBOg9JEaUr5Se1mhtlC+GS2ARvs/emBXI/ftgjPvpxI
	7GjsJZVzYEgsEV5DL2ahuUUI0GNDo/hiAgzx/q3iRIvTdnssGIvMYesvuG0Qqt2xlQsk5uu7Snx
	v3/8VxAXHHP3JVj8SZejaGogojoScXz/E+uVF+dhFmgsgvW0fE5LcoTHCAj7odBV6tFEhXSaiVL
	hciQ==
X-Gm-Gg: AfdE7cmEoqxfjQSk+ajFPDQGDZukQ9M8my3GBrdwgk7tFKInIqdEJ3n2reIWNGbvrGR
	4Sg7oJ+41WvbpnJ9g2Zdf1taMwZSOMW+LhJDPAo02UfcPSewBx9SW1yxZF/rIsHa74D1AFldB3j
	vZ7ckPr6qOpXZuKd+H7gFAMJxaPp0Pa7nxhA11ofMEbAYG64HcE5bgQWYsewuwxQRt7X+ZwL6YM
	Z0FMtqnbR388E5Xa6lvkW/FhoXYTDWtKlshLwGaKD/kd4Au4wMP7AfJ3V+YI+NjEStaRbuOaKNw
	wnhWtfhuNMMbDpikDX70UUC/1fumQQBGtKp77MXB4xLRdJ7nWKOuYbtKQGqhV9gu2x+j8fQjb3i
	hhX84gc1eWFsLLoVtJGkntjQVF21AAvMu/pk2vsW4
X-Received: by 2002:a05:6820:709a:20b0:6a1:87cb:c34e with SMTP id 006d021491bc7-6a39a8bc0cfmr3777043eaf.72.1783947692035;
        Mon, 13 Jul 2026 06:01:32 -0700 (PDT)
X-Received: by 2002:a05:6820:709a:20b0:6a1:87cb:c34e with SMTP id 006d021491bc7-6a39a8bc0cfmr3777006eaf.72.1783947691457;
        Mon, 13 Jul 2026 06:01:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:03 +0200
Subject: [PATCH v21 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-2-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGW93v0sClC2ft1uCv5Hw3EHtNtjlSJJwq2r
 tE4EdQeEpKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThlgAKCRAFnS7L/zaE
 w/uzD/4w7eNiuNpdXOL3t9tZlS5LdaL8UOWb9G3C8AYDPtr+fAN90n14n2NZg3uMrzojjmDpFUt
 9Iksuw7xVCS8Q7h06Z+LOwUYoaNcF0Gc2xPMRwd195hnUU/A+s7yXeaIJBr5PUJj9SG+Tij0l0q
 4bMuNqytBjFwaz08h6FCxbDKCbL9Ff2GWef6txBaonkpWuyrvUvT3V3h9z/lk3gLr1W3KH2dT2j
 POs49V+Qbj1NxYMoJW2YDLOhagEbVsSydQW2ipiXh4EsYKumCfShgSwuZAD8YWz01K4wF4o86YB
 Sj+m4+o3hUIbfnqo9ftCfyMDopd1O6fuaTMGO3yLaxOv1SEcoQIGNBpgHsaKsaj82CESkHpYOq0
 4vzS/QnSmT/XNVCQ352PE2k5HJssuzCzUFiX21caaVJ9HegTqNjL+sO7XXyFHiHx+eyhevnboX6
 zLdH9SIZuysid7hmCa6D6JwQJfiaJgT6naeB6YZiXeiqNpnlF5YdKB08eFK4Xy4U/0FnI1GIfaU
 MTQvGK1+c4PQOI/98pLZIEKZj/V6+LWNqt4LwDjhTBeQ8HFC6p0P2RqQfqpw1MnErtYQAC3D+Zz
 TUMi/XvI79oxiLqk9uhZMCGkVrz/zuI1f/T24vQF52gXfwhD71tnxmULJ2aTCOV5TxdY2AcfMnv
 qYTuv6HHSU9AEKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: XbAUjmsq2JNi2MZKuzYsF4gxl-5oKgcq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXxGSU6O8c0ttC
 P34hvidB+w7/vg8s+TNsrYuuGF6qF+wIdfJv2kgAsjk06fpq6TIlV7nfDkXuryoCLVBHy/mao/d
 A+KQN4Ch9kE1UJ/iHs5Em9xYegZ4G1s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX4oa/RrbeWcb6
 4ovOUDGdvvYB/Ey6s8vI/cHyVnSd9u0M6MtVndbjk7X1zL2E209YCl8l+RVeATc4jovHN0+RXqV
 BuPz9ftA/9NWZBuoLkCWOkpj7CJvr7uKP0Fqy3to82WngQdCq0mAYq351xuTZJ6mS2kwzV8Z6gG
 AEdQKoNY3m5YW05sLXgNplwbvoBQ9JRd9JHy3zteRDBsoIQ9B6E5yHidjB6Jg+f7hKPgladOw8z
 t0qWworXnH2enf5enKOqKcsDarLOC6KP8gEUlI7LEjSYN4nZzrXQJIC1fcR6K3/9s6/P2trjIwJ
 Hew0KQC3ul+4N4hrK7c0EigdlZdwaMl0b6jLE7MchTtu/alMidfeIjhLmmBCnTFGhXbUBZxyhaG
 AjHEleqTM3C7fSmne46qwrYL9uVQBA==
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54e1ac cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: XbAUjmsq2JNi2MZKuzYsF4gxl-5oKgcq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060136_604364_0F4FADE9 
X-CRM114-Status: GOOD (  17.89  )
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

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f3a16f97e0d4b86c945c252d97f57..fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1365,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1384,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3


