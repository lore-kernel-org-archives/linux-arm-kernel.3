Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE3FCD5BB5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=; b=bhvBIbCG4raQkOZ/1elE5QNBTy
	Zqpn1HmLmyqCEdf705Zaf1StUtbYlS6WH4oPyH7BZnQCti8h55XqEPCP74pH/WkhRUirV/0xFNOpz
	fWoLidgGdRNxLqtPkcveYlSWQ12aqBBzOOe7siBbXNLu6R4PPXELyHIwA9Q7ycJR41bpEz+EfUuM0
	JxbGTqij31CvxVZRZzbQHtdKZD9YpvjPJpb9q1U23KyZOJNPhpMEqR98lxALLZXv8GShvOwl+kw/Y
	U0Rrb6LU+uSw6V1409CQVn7OyYHnlRcJJF4tcn1nwbkamALClZ+yOh9KUZtf5/m4Hrv+X42TMY8hH
	XXpAovgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ74-0000000B0fV-2Gzs;
	Fri, 22 May 2026 13:40:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ6y-0000000B0bZ-0me7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MC1u5h779268
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=; b=V9QMcUOi7GuPFjlk
	iWsdKoKhc5xnnmNqA0jCFDOGNwx6V6T5eNUHnqAMEHx8ivt1habATb0HlK1ov731
	BBX/0y5CjhIaETy3u2BdCIx/G2q+d4wb6Rci9txyiVFK5yQRta/etS16TAXGTI6C
	Q9gbYtn3lC/yBbW4r0+QArhi/hVwIeejFvhmkHCjwM+I84lHjwLaOryxzD+3p796
	KuVkqmCw0dJOHOMKjGnqu0dTsupbo3QKywOmfbnZ5iHvsh/I0vwmKV6ubhfCvxPL
	SzHkR9RKFkuwjHkdOcg92wocaDkWFZeFhPpqGscNHbCyO8Rc0RyxpL8o36BA0/e1
	g1y2NA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7atxx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514ae0e3ad6so186240361cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457222; x=1780062022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=;
        b=WApWyy7bg0geYmftS9UoxomI6iZSHV+ETl5WTpOapKi5YhVYr/vIRQAKkaAdgtPcBl
         V4ASyMD891XPhIVd7g1W+AJwghzz1Jl5ADQueGTBOpKv3NW5xTLUZRWnhLDdAYf4IvNG
         8SNYe/801y3bqBz+RuwsOiS9/4CRhoWiPDp8N4KsiAbLG0mZSazcc5Zl8BFLdARy29bh
         sDN0IPC52zkT0qQ7yDNesJ1tzoePBOQsFgeQwoLWrK94vaiP8f5yojnMrkOgIKBY/rWp
         C5JiAbV8gTqGVLTpvCPJGSYgocJ9btusGQlEk1MytYCrUXCcXu4LrXkPCPf9F8FI7eql
         pKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457222; x=1780062022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=;
        b=FENNrQ+32en1WLnedkw6f+3VMOR/rj/8BpvQBxf9pfVInozegQ/rXwib0MLeLaWy+R
         tiCewCAZ30IpLvW4unxjjXpjpCdJtyrcyJlWN4NGmHAGVVdAMrqqiUpWoAN8KyJ4ggQu
         apTgXgBNzgZOySI+ZOpmsDXEjDzG4zivYXpykkEdR2YC+EHAcVRrCaokeCEarME3gZtN
         Ulsp75eBjkSjE3Eb/ucPBK7FQirCsLM2vQrc7kHYhgmbYCQPP2do4RCyOiUYPbT/ZKPK
         iAFlArQUGnlvOVFd8GfqvhdjNy1utbdS/XY5xVEicqmORkhKVSYCkFD9reKazFlShFrS
         sOYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+b8IzRv9cIWbLeLkmwhg/oBKVVuuDQgf8fhtrOIKB0XLOoGasUF/ofgL8FUFzqQOWnH9TDFODQ82IzO1y5ZVl3@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb/qE4K2zAoUYWwqcp8BPuoqC8iixIX4x5fTIMasn03Si6L12o
	gui2RLEY6cPKt3q6267bzgvntSOSOdmjIzgO+pLM4j82I4JZAbf/ri8cfjtgpfy/YYZcKZONYbk
	PmhzAdLJBr6ZabLclP2ELq/AsKJWmUckeFbFoEwFH5QayFhT61nabRcBn3KxYyFV3GMNhE2Wss4
	qKmg==
X-Gm-Gg: Acq92OGbLC3E/5NIWKCukr5bO5No+hLQjcQQ3l4MYyaYNI3gKap8HdDjW2dOJhX2KCa
	3A/EAfvwQl8PDJXffPUq6l6SCSVe5ELIOHmD8JazJOmJhtCZONeUWE9fD0T0j9F23+Odb1/ntUG
	oaPhYAvjUsN3r0udfOdgV98H/n8E5LCRS8H8pJ1MKVeF6mB/Hnz9ZfaeuYiWUQyMRkpBUx9noxu
	GcBYjSDi/FWFz/g4bxRVcjh5Opad3wklGP+Po36pxq755LHhNJE3dufXzjL6ect0qpgVvRtXKTK
	udx5vjc4esdDcFUmVh9zEcNXHYMTnu06V2Y63RUjawfQrNt1IobRLPXLbgRsONuXRtaeUx18K66
	3XzX244OTDuLrewGG2JMrN8cDpfMVVvOW7SMygWDP0uoHmxlxDQ==
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id d75a77b69052e-516c54cdacamr67015281cf.2.1779457222328;
        Fri, 22 May 2026 06:40:22 -0700 (PDT)
X-Received: by 2002:a05:622a:a90b:b0:515:7d69:4c0a with SMTP id d75a77b69052e-516c54cdacamr67014841cf.2.1779457221737;
        Fri, 22 May 2026 06:40:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:39:55 +0200
Subject: [PATCH v18 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-2-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yKvgG0rTvuvJLcjw7C6atYAtuGT91Jlwk9eV3sVaoBM=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGoQXLPIYQPrnZ/xYu60uh01cd0qPgA+V20Gnmo2k0X5SkfnW
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqEFyzAAoJEAWdLsv/NoTDIUgP/1Rs
 8KhvkXDlop1eW5Zm2UYtzwQ8MWsBJXIcYHv/LvM40EtGmuKFx3Dv1xPh6uG/54rAtUWB6pdUTt0
 Rt9yQ7eXGUbiO6q6HRm0Nh7SCwlHZEAAmfB/vUQqNa6+FQ+vRujcfXj3tPs41Ra7H848YAYrCJ6
 tMMHzVsFSeQ2mEQ9JDc5cn+F5Z3TWqq7uNfrAxocXFAvdO7/eg6zQrjEbqvWyPB8xxwK2mSoe0d
 tTTRZdmXS9nGoYK6CWq/r9W//W9Ur4DRnzVOBCXsFBsm5Px08pp4sdFZOQC/pBM8mOnZVLmBJ11
 tMSI+TuVsEkxgEfu3OsMZQrL42RDjyrOl4bgXD6GiFERrp6+dU8+KsQbzdMmRTAi30wncJW5wD+
 0XevaHhE2m1YkGstKi6MLn7JQYlXZwkVJM/2k2BvFRDgHel+nZp35Ple22kd/s6/Vw0CIIFlczO
 kGtLE+okV0fbXc0IXMEZhP2ybDw3YrIJQQqLl4P4R7EqaGGcOZEHIJRsZ+ijTZTowqV9854hMnp
 Qu52D3mczLLjgod+IrcP+e5SKtmlZa3jc+mdmI/N2lQiPM1unFZGtUoQ06Lxl/ljfLNwwU8RhIs
 w7g2bdH6iZsY9W7MZdpBnc2SWBMojiIBcy2eF0Xgcj6Mnq/O/84w4q0MwypJDN0BigyVnVRWhT5
 GIU7R
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: jx8fgLn5uzouEJr6yoynQYfFzgsF4QnU
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a105cc7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: jx8fgLn5uzouEJr6yoynQYfFzgsF4QnU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX3kyVxsQcdizq
 s1RG/g6oljL5H1NU7dXhexcXYeogfJXv3T1pBXWYelMldu0kJNCvJbAa4oCl3Ik12B1j/8WV02D
 PtuCD0vsyqSfxJUlnePr0fJPmSl3P0rlWsULJo9MI/JqA+juLvUpZKQYgTlsXYiNVv1RRub4CX2
 I+Fw1hZdxi1JWnh5Qo4iHQK3dC+U5+I9Y5qgeou44mVjoxteRiywB3qy9w6UdkZcLuzZ8ilWUwv
 EIit4rzVVCpzznYO3RCJH2G8Z6mQJUbHG05boNJiu+rifvYUA2IDCS97UYc2w2WQ9Ygf6ZulRep
 /FNVA9WjEl23E2d55Dvo6fYFLRkiRKnV+pZLQqZeHxiF/vT06LgjWgUPR10AP6FzApvpKZYXMuq
 xsjTxN8qiu5lqvJYrtaCNBcU4C9qGomISWD6oNhfMJRGWhqK+5zxMdsaeRjCg/6nBz6XswrEggg
 IwtB1P5YIsUC6wXpJeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064024_355802_D39B424F 
X-CRM114-Status: GOOD (  17.96  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..b3d36ea79984385fe0d05ce56042d3e6e3030c5a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1302,8 +1302,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1336,7 +1335,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1355,6 +1354,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1371,6 +1372,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1379,8 +1382,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3


