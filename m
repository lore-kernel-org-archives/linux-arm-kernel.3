Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E83CC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=1lZ0CBUoHqmlE/uoJCUsTPQ1TN
	fJB51GoJfkQhiIqN/93/gfiGmFbw1I5P5r3fSMLDBwdv3VVQq1ckferFrhs8ex/k16ps5xf1hLq7c
	Jm5dsWxxnu1sHwCSVW7NWN9LXL1L8RAsM8lHKXMEVnN4HeahSQkpH05Rg/CrVCCOWiCOL8c9+TI4K
	G/wbykbzGM43g0Pk0x2b6xuvxBHsw1kEmCF1Z/S71c/vBPYpa0ePK6i8rpS0+PTRIwo+eS3adiAPQ
	WtmIsRSPg5Il3X2xPqgFsQFtD13vxpgT7yhl9prcJlKED+I4G0Oo8nKhE6v+a2ozqm+l5/Vgf+Fx5
	666Zy5ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbS-00000009X02-3axq;
	Tue, 21 Jul 2026 13:33:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbO-00000009WyF-2kvp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:33:44 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMRj01864653
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=jR6dkYVoqTYQpyCE
	0yE0q2kSI2nvymCD72OM8tj2J6T48uLz3VOzK9bHGlZ99XLqbN5n53IDRh7cf5Gq
	vNpPTIRre2FXTAYYttkzM9mQy7BtMGgpSwGPj5CZbPAd3maYF2Zhg2pofBdOT9T3
	824YjCybS9cSFPjQEgqCMwv2ih305ybtc9fmwJR0jdNhJ2VV8GugieCNeD+YgJeB
	07jGDuPJ7V2MkWg6jmbFAmaHeP+HqN+alEJEiofWHS6ueXSkhFOFglJTvoc4Jfep
	IKAmAUTR5er859lQxXaMQBu9wv85DInsBgcP/5UGks+dur/WOoxIuSiiFVgrWE7P
	9q10oQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dujkb9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c20762d21so109816631cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640821; x=1785245621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=Axd3QCxLGWFJeQjvOe4/rHgMXq26ItxxyvzFXX/tUmWpFXOucsJkj+DdNWyuLD9Fl5
         QrVzv4eRRj3NCuywUqXzjFkqY+5dHzCGy1Tg9+4Ef1NDz/4rbSS5Q+vzR1MyVt96mRFG
         78/jfIYkUg7H2djI7tFiWDH9KdQgY5rDQzVDswLIUj9pzRr2lqAPdQV5bz//U1YrrBB9
         X4aUa1B1wJ9KSRGYlo+s8TtAPz7FmY4mhXMbmnvfJRvouoEhEv3ck9gn5JK0l1IiaB6a
         MNnCrc0tfSC3wdGk0h2omu/dpGA4ml461fd9ovdW68wPl4/mqyJUyeB+19CyHFE0X+VU
         YZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640821; x=1785245621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=XQ8oKx7n1NsIVJb6nNNDiSW/8baTXoF/5T003yBmXISyb8Dk2CvLZD5PLtSz3D/Qvn
         t2shegsOAdXjLGla7oEA9ZZFWiLKAFX31QhTgmDMcNK3VKwf96lNe2t4F5hxUjcu8gHi
         VzmVgdSzWOhD6eNXpQwp/XYUxjhBgItA6W8ryhs4Wn+KygVNTysBGumMvyyGSgImFWbH
         9FA74GHtOp/tfZ+2CDRmlxuxdAStiZmoKsI/ID611+B5yH6IDMOConopygXU8KKEKdDz
         ne+TQEVLxP4qqIoExuvFCL8W7u0qCFNO/c58Qgr0KjVy1e5LqJZI85xyISAiEjSGp+qU
         Pqgw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/torq+66iPnyEEldQL5T59QqYun5EUJT9xv3E0TdNO2L4uFkivvoRzcC/riYG74AZajaAGqSwY2i9HKWLqsTo@lists.infradead.org
X-Gm-Message-State: AOJu0YyRoyDSgpUaaOSsq3ew+O4I6t8J+3M+wIeANOF4Dr0IQNRf7fvh
	MbbKs05dCvM5m2jfMlyuGbJe5mLpSVlmqa3pIS6Nn8V+PKPY41jK1WgwfAO1zBCmGEwM6i7CnUF
	05C2M9KNi19/2ecGFysGtq0C3dXcVcMaNnmd34Witm6NGSYMNevjkdHhIiNjtjXsJqYCgTujmn1
	wHsI7UN+MfFw==
X-Gm-Gg: AfdE7cnbBH4oMVfFaPFyfI14mKgtxpHAf2RrFB0wylQoeo4f3pj2W/7zGGFNpZVV6gy
	kPc4Pps9I1CNjahB/s/a7a4gpAYyzDqoDOm51NjdVrXXjqBzknB2sO+GrKvAERki3x8MFweG1Zk
	5EFlOVt952xXC5Cx7sqq/EF5LIYBpxlZzRpiFxrm5dU2t7q4re0jFWrGcaf42cRP+LLUQ+GqxCU
	/YWWkJt6FRyOZYDZIjw0ScxOMDCaeZUtJtvO24fPS0n7YYRyR/KEaanH6vve2QCi0K10428sOdr
	Exzye2CNyICcpsYPFVQlL7NoypC7R9tnP2a7dMmzEW0GfgUo4LArMbqUabXrFW0d6iaE9ioke3Y
	BH9ek6uuajpnJdoN/hnd3n0VRQ+eCVg==
X-Received: by 2002:ac8:7f13:0:b0:51a:8c99:1f17 with SMTP id d75a77b69052e-5213eb8266cmr168099781cf.70.1784640820888;
        Tue, 21 Jul 2026 06:33:40 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51a:8c99:1f17 with SMTP id d75a77b69052e-5213eb8266cmr168099441cf.70.1784640820325;
        Tue, 21 Jul 2026 06:33:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:07 +0200
Subject: [PATCH v23 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-2-1be02deffda9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UeTf5yPkR71GYC9HakPsyBmOns0Ff6OXLZW
 KKH3mvzMz6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91HgAKCRAFnS7L/zaE
 w1qJD/4vuV9Fj22we4zA4r2X2pev1SmEHY/SdBxLsKFopJ77s01KnqiicTUPULuJ1DJ0ju+ITYE
 Sr8a8HpraTM+koiOJ277s5Ma3PySt+/raldHmeoH8DgvFT2ybAuGGjcUnTEqjupk69BStbTqvPK
 PGisrWeh53ehwPJV9Nx/8EROv73Rq22KmMIlQo2qQmFDnY6kLxpXUDcK/Z3DUtBZr+zse5lQME8
 c6a3SYxx9lV4aSXgp/rOOJTVlxDu+jtNYmI+NNsKLczXxFL+EBtY4cLMvqVGBNUZs6JaaZAtwqC
 Y0r1k2l8txUqORKpZfNLDnDRWrvvYHq0pZqMUu5daBpN207cKVp9jgkM1lFnDjWFCt4YJgf4FHZ
 ZTCpaRMvjWj8i/tgdvX22I84e+N4xShzIBlPe+O1VxIwKwCeS6Q1QYM6SdGtE9OHVdrswwUgZDJ
 3YeaG1mYZmzzDdxtqKOEAwAx03wpc7xg+EjvDWTNaob3gBxLWiGduc/S37gJjIWWYNdg1cnB0Zz
 a7sE9oGUrIJy0N/xU+qIVue0ErYS6xFduavN0DBuu/6XqzrHbdQ52SaxQUUPyaHw0dZvVG54CUX
 xg1x5STbAno4Tb26snx57KMcE5huCqlfvySuirjbAzpWwB9dUrsVLS+4jTDdYu9ouB9SPzIB7Kx
 mZhnaJ5btSxq51g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: yEBAuadKvO-RJ7aD07f6mQxYjLHBSoO_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX5KByQ2GFWh5p
 WS9S6E1nnjReG6t/jBOGO2nL6kh1/V1ag2EDubz4q33d3XF4TfICilSmEPRt9tB50+WQKt7zFAE
 u3TJw/vTKcYY38EXDV9FlSAuHKQg1qIzqXorIjCNe+3aviNdPyd8UUADtqciaqMeBLvIAAmXUAI
 wvbJ3CdURddQOA2nB3APtvGo/9MU3iDMreVO4nnG6IWKV3OIt7roGxC+BoYU4oYItdTkGZ2w2IU
 3tUJhCGRgRyczJOIYQJVNVolVrSbewHta93kGLAQygIqkN5dL5Cpf03250v7S1yBp4MVsABw5f6
 6lTpV0XQ0NWxiAlXXryS8Qo5ZhT5DA4GhJb+gdIofJ9ieyTDgHYDLrLvwV8mPgYdTqaspmdiO9B
 0jgWdPX/QLCm6yVdpjfcubTKEFrZrPWH8HtSySi9L98hpBxtLJUni2zDQA2g9k3FYhvZeWAcVdb
 ThRTSbM19JeCoMO6+EQ==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f7535 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: yEBAuadKvO-RJ7aD07f6mQxYjLHBSoO_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX9u8hkFgGqmIJ
 jNoZKco+bwOKdCFbs3UvBSkjdOVe5wZ/UdjBddiscOYkZGdN6LE5JJJDKqY2TK6Gxxd3bmv5c4K
 7mszUKRaTh3TZWhM9yxajbXWTFLMd+M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063342_818818_2542A014 
X-CRM114-Status: GOOD (  17.90  )
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


