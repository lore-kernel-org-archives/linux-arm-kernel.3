Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE6ECD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=; b=tJR42A/2BImKvRHk7DCFj8XoXi
	Wi2LetE+Y40wfXtdjhEqjo+yGjArvIxNKizMNchAsxMmgypJYBaqNBRo6rzYKieqUN+yUbxyQmeMC
	XEU2hBd9ZvttdvNyYAYpj+uuKr21Vcspk+CLjerztYk6w7Q3M7lLB3bm9rLR8wnbnIIGku2/9DGH9
	tGrNDa4sTQHlMc7vJxZr3Shg26DWz6Ev74Lo0SGQX0O3rVmKHcNg0zXQ5OPVvv6q9UwchLzFgRrZw
	oLxbFdE6tmE//yAMpR3asXBBipbgVo2t6aKL/pK0Zsxd4QoHolemRradjrveM2vqgDDsegyq9HBIq
	xfb8Jsvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZI-000000020tm-1Xq5;
	Tue, 26 May 2026 13:11:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZ7-000000020oT-0nKd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsN8U2705430
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=; b=BZbeo/l/mOWar0i7
	D/Ytr1655XiqsovVdEbKuxFZuUFVUgerl7dwyjrEqVPD3sUIyJih+upM7R9lW/Ez
	zdLO0WN7Dpf5+QfcYH4tdzK1xh/P7KNdaop3eWyEZfFkEtJTtZI1SKusjN2dIiCp
	ZBzaLNA9pytgHizseArXVt8Qz7mgVQmPiLBJYcpKSe8tv5d2r3is2b2X6PvI/2Oe
	o+PuvwH8ki/Gh2cLRrnrIYAVEiuayPr1bO1St/v1Xo1YAfr3vAHTJTaRIOYZS3JR
	YGtqOdXqKyUJn7HQftjZ/4Z78xauLbyiJCWbCTYp2ae8iCpmUn1ylZzo3K6RXz6X
	0/3BHg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vghvje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:24 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95fd5da382cso3394947241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801083; x=1780405883; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=;
        b=FqFMCsqoejMCNHq0CyLc149Z8T0oc0yUGpxAEfw67j2WY7qXkN2n8UG2FT3UXLsu11
         Qtj+sQ8j12Gsd3FfnKxsPQvs/iEXyeCzZ/xHAA38wqZ2PvsWL/SL2pj03nBX/TVDl4Yz
         j/0X7BxPkbadNVBxILnJri/0xoeT+k42xqXCYv1IEtSZC54NvsEnZP30Bla0+Ym1Y8T0
         kx9oSp9NXebn+2d1zSfmbwYQ1/MR3uJ54Fm3IYs3d4gmhjOb0p7S9lK/AJFtiYYsC6hN
         qvmwVLVWX18W1ZaSGWbREyAjoDMbTxR1lECI2G28XLNV6BWPAG3ea/93UGvZhCYTNqDo
         NenQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801083; x=1780405883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2g7T67hXwVirNiCmNO6EC06JYgACQ8VaJoiHLwm9Nw=;
        b=dlQ3gmEvV+sissdzGnhY2ktXeTm3J6Qs3Y4PwAQDFqQzZUo5qXoNbtLXTEjSQOkmyu
         kLLER9tfvW//fVtgt9mzWON7YNkkEoMEH4MllnZGD1l/76icAmkO4wYtundP5j85G+dK
         AKw/aCcA0wusl25J7hqKUC+JAuYl68mgDEzdfkWRvxO1bw3jKCHtkdNc/8I253mwGy33
         VCqQ7eDED6mcn7BKXt+QkGk5FV/3V+UYuXiq+hlQ3I07Z/iUm3/t7UtEmjGuJFgTGaCw
         WzqkdTK10LGFr8iWC6SZcR3mbdioTqtfwdYut3XRatYnJa8XcxZ8WpPC7lTL797gQt+l
         NgqA==
X-Forwarded-Encrypted: i=1; AFNElJ/eHiplZMFxLwo3e2cIt+1IO4bs0pLjUNVAeeE7wutCrJj2xOS8tJMXpoZHRXoGrcOST3MDidZwcGEy4yr58cLC@lists.infradead.org
X-Gm-Message-State: AOJu0YyoysEj0UwFC9xlDw8npn0xMLWvuT6bviCiOZSL8+yZkbubsV/v
	3u2B4asldH9BNWffOQ74OhQylwni+CMhlCt7cGMsodVCuis1PKVAtuNRfUtTqrXb+xJY1QGkcFS
	K1uhsPkXcLkyHMqRSjI/UqFbF2pzpOrUG7ARpKJeHUqUKLq6HjNFSlnU94wpNqcJMSlUxCaJBZa
	pBWg==
X-Gm-Gg: Acq92OF2ZuF1phfXzFKFU4I4iEbCGhqEbMte4bX1Fe4g0UO2OeAhK0dVEtyY9+Ba8qg
	MP9jCUM6EgPwjJCrldD25OglJJatNTewRxq5FtpS5pEo8sYFA9ms1oNzzrP37xCjH+KmDsepjZn
	rnewW/b0LWXDAr1YL+KbFtU+g3hdm2TQSDjMyYQuPM5TZlfJth+WsbN+JlFuhG03gXH/2o0fA7J
	R5feJR+sVV9b0uSTpGgiEwIJ2wnacysVPg88wG9/JM/IzwDFsT/2+I4RBPhoSWzbOHzkfof0zAN
	ohTdvkIvnlugGWT1+00Tyj5yYBpEumBfINrsgVI2/br7uiflyTHO2wg5aGJ3pWLAjHSDfh4+Zv0
	x0rBFnuppMpkmBQUpBlsN/KUbmXbxJTRSAg/tMVhY9RLNTWdj/vo=
X-Received: by 2002:a05:6102:26c1:b0:631:7781:fe8f with SMTP id ada2fe7eead31-67c8a075be3mr8074422137.16.1779801083397;
        Tue, 26 May 2026 06:11:23 -0700 (PDT)
X-Received: by 2002:a05:6102:26c1:b0:631:7781:fe8f with SMTP id ada2fe7eead31-67c8a075be3mr8074354137.16.1779801082801;
        Tue, 26 May 2026 06:11:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:50 +0200
Subject: [PATCH v19 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-2-08472fdcbf4a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2764;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yKvgG0rTvuvJLcjw7C6atYAtuGT91Jlwk9eV3sVaoBM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvp7UZaBHl1OIOMCNcm6ZGnEtt0oh2iZGyPw
 ENtMY6cdtGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb6QAKCRAFnS7L/zaE
 w5SJD/sEn+AzlgXKKc1pQ0NeSWVBb7BQcNXQaxKPk6q72SYnU8eCWrAuvmeH84F2l+i+cL0zAWb
 nmEHYZx3GSXz7cwvHKyBGoOKjrh5xhzTSTPvT6wn1bVPx0R4nN9HTVm3PcjSOWUWf61eRHZP1la
 +UNcU6Ul345VLALhUJh0NFWmdc4cCQZwLQ4p5ClI+tfHkBfVtrayM+N+r+RJZMONh4SbhNbTORy
 WCJFWf4KIjB8sZHqByTiesO+z9uFsxcCGiAVzL3lT895g79R7zaNFbvtfnpCQDniy3UzVYV2Vu/
 upq+wwHrIq94JxPbJQA10Dh9USJPv3OtgrrPx9CoFD3c8R7qEQOmjADC+/oK9IRf9Ah2iwmzmZn
 cxZ7yw+CAagm3e1Ra4c/wxKvk25sNeAr+utNF0ybsjITjR0DJxSnqkEqeY3zFGenYFDqg4MLXHf
 3AF1iUfndmbkSe09RX9ngzipL5RXKZ0n/4Tva9DF+U510x6hzGHe7gOzjHxNEXW7ly0j5FiXqJG
 D3lEDwlhlaM/XbyA5Msi5zXa4CH+sjLFF9gXie7/G5LvJYK28w960meiu9aGttA79tfjoXMyDJc
 l2CzzFbgE1evjGeiQhxHVRt0SdIdTdiGFr1nrnxiXjfrleDZjNftmUdEHXC8BaIvMUbGlN+Bnkw
 MQLtAaAgcEspIHQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a159bfc cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: gfgukVkuum8nMsbDCLI4MSP_NDXwJseE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfXxpzyz+IyFNDB
 2Vw42IFPZMl/n/o8hVyUYa37sTXRqmpEQ/jT+K/VLUh0c4fXaMn0sbi0utwftbp62Q7YU4DAIqR
 zdBobSPraQOkIyhi+NbELxQH97i/B5zNarIzRz7iIxxN9ONPK+5bnPCUSM3GPsKu4fj7S1HE5G6
 rmu1yYj+hRzVgGsUqut9RafrCE2H79OMGdcpBm38YI6upSC68c0K772DOrzlduj/2YFosT2dJxy
 p1fBvxO1q3rPkbFF8vT4OHFvi71aeDM5KASho9d3lJvN+7ADFjFCz9Uz7h+DvpYWuQDXTl/C3xk
 HOYLzooC6wU9d2+FT6ozMJqiYHVzPWRhoa+ZZxun3tMlSYSVrsl4/rabGG5kpiwfo03QatY1/4v
 xbGxkRuiSpUfTlDnW4tn/Y5hkrm0TxDrGhwPrCAgCW32HW5W9fO4x4X8lUkBj4UW6ATYCixoOQG
 HVbOY2Ctw5zaMGpx/6Q==
X-Proofpoint-GUID: gfgukVkuum8nMsbDCLI4MSP_NDXwJseE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061125_356640_86B629C0 
X-CRM114-Status: GOOD (  18.18  )
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


