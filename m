Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477A0F4613C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=SKeMM0jn26nqzVe3kx3RfigMAM
	PyPIWH8cgI7THEzY1kwcRm0K26KYiST6O/GQNYGddcVmQTK2lQb2NRdF+eBpGfz+MbCjtm8QftcZe
	bHz+fpxmJn/0osuaKaJQvhhZsdB4Fe7SCANjgQbVFOXc4V8juynjI2JGBzGPa3jc6Z9EXao/DyyVw
	0buyfDtgg2EpoDflojmMuK/8H5t7cLItI/FYK2sxYZjVEIIMK9H73xdxLwZgH0gXfAb13BDHQEjdA
	4Tys7irvUoL9GhY9GBeLK2zWEkYTSKGtekOSpikEEOyq3DP73rEYGXvn2Eu7nkVf8tCakvHzDg8dQ
	Y3KdNmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2B-0000000H01a-12bj;
	Mon, 23 Mar 2026 15:17:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h26-0000000Gzz8-0Kyc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGS4J2337021
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=JJ4wsOB+77hQGkT4
	OsVIpJH6Z6ihv73m/qD/CdFRhfTbvuCxYxDHHD3fthwlbL/JTfPoGmt1Bjsl11Wf
	B3H0txhv00WzhQCUH7w8FMRq4HzaXF3jT0oijnI4tuaHXZjBYd3TwVEBwWDDMf5L
	8ROzpiBVhkX8jWxsrKuisNt3AaYNr6yvrW75ILkfEMJfS0PCrE/zQMgEbmTpAmtk
	8PjnTEgkjx1uktE/5J7C6FqnXGBxCqkhE3Jby/HXilnQ0gxT7wOzvGiShmHpY/MP
	oZx5J9lIHxvKwAoNihpmrA6nKeV/I/DTiFRqAxCACBjc0DclTUAbF0x00BajZRlx
	aK/BRw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p79j8w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-56ce5c0a06aso6590306e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279052; x=1774883852; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=B6NOAcAimxRoNoNJurxOpHWKt1qfi8OZH82wb6XgRh2HvaEi05pekAQRZlO5BBppZu
         8nTuZMptDtBxzHM1L9Rb0nkCkqDBHwsOaUcOfm3AJULiPIuLgtW//m8p6lRfbZN6nzvG
         I4MoPGi0GAG7XZouJbPV2UW+G171Y8pKMCH+U56z3lga2UuCfefmNwm5G85AWv/UxPO7
         fcn8+sITGxNKWHZr5tYOCFh/ii5v63MEF/ycTHJc51Ppp1DHQvrDGb7UWYgykDJYwUma
         XrSVB5pylJDD9q111JKZHVI6XsZj20wwgyvoydOY3xgDuHWnTs9RZd+JqxFlLoKeNpTP
         Vb0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279052; x=1774883852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=iQu3r0AN4OyaKyA60UK6MZr9oG/0ulauKvIEQ34MnqHokN0zNWH5EjO4yFSmp9i+pj
         EyvZIW0pkomFsjzpEw+jtHC/vPddLd4rkmxJvnai6agWrVJNmiPhYegWWNVJd/278lBr
         eG29ZwrI/KnGHcyzRpZeEbLs4mrswjI/AZ1GpRfedaoLya6WuK2KULa/23uqqtQhY3FH
         0jB57q27qQM/fQV7VYr+ewpQke7uu070juUmRKP0JxbzCAxdZweUB6MG8h7Z6zEwoEmi
         tta9ZxVn1yAT6FYtaM+gpZnorJ+hnZOj0I8gMuIiOD7a1GwbUFns4SLEJhtRMwGvQqka
         ZP9w==
X-Forwarded-Encrypted: i=1; AJvYcCUYlhyExOtYunAsml2/7Au/auHoEVvE4w1oHxrojn8szaQza27ezTtNmd0iYa1dn1t1JH4jFbmox+AhfLv/HDqY@lists.infradead.org
X-Gm-Message-State: AOJu0YzuWsI2Uazr/HPk8lN5e1mAklbnddhv8ma3cEnJ1VtHDeYZDaMB
	GZCx9UGBPWMrWeSEBQ0aNmYwbt4Q+Jt2wsf/D+62/LuHjFM7c/qJvBHnGx3TQ5/6PQ6DOZ+DPj2
	loLBgf6MyMEPV2epaScATwr7KCYU5ruVLZl45pt1jd+A2CIhDpH0shTVYtdsN8rxFpKeYrWD4Fu
	ed0Q==
X-Gm-Gg: ATEYQzzObHBQjtMVgkaDucd7nfNl+PlBMIScaWp2ZjK4Qdn1PJ+j5YSn4+x5yuedMBS
	KA+VLz2D8/93zBUE5cbYmqV21AbZYU74QJVZSU/Mbjmz0/7tS8J0oGUQLahzskoIJiRbP9HNFUm
	rQ3nJXUvyfv9xz3/yr6Kgn5ioH2hh9EI5N8RjVyQOai7obOlx4VpNspzXWmvFLkOSX3ejdw64S5
	R7yHEHegDsvTSBIlRpRjeyt/GeO0xs6ePMWjxCMpHExF3vaHkzU6e1z7BppiTM+GBon66rl9NcA
	7QzzHKuuZBf9ooBoLuN9lQWKEBNC6FoV6glOCq9MvUYTAWkLKPXzrCxNgAbhLASNge9sN6nmPiB
	ptSD3fkKxMMros/i6a9cY1s8lQWd43hG3f9ou+RtayNjas1yAfT+S
X-Received: by 2002:a05:6122:62a6:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-56cde32da5amr6695164e0c.3.1774279052270;
        Mon, 23 Mar 2026 08:17:32 -0700 (PDT)
X-Received: by 2002:a05:6122:62a6:b0:56c:ca03:b668 with SMTP id 71dfb90a1353d-56cde32da5amr6695092e0c.3.1774279051692;
        Mon, 23 Mar 2026 08:17:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:08 +0100
Subject: [PATCH v14 02/12] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-2-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YERqA6ytYIBXeEnEVHuNkc6pRniKdplpfqUBYqgG5Qg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVl7umMQ3GnFqLlg71VARhQ6e61Rs2KOgtl+t
 o3DQS+zhcWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZewAKCRAFnS7L/zaE
 w222D/9kYrdTy6/L2fho2KYzkGBtX7TQ4WeNPeZvXAVqu/R8LiwuMDunjPLVWIMelX85xqJ1n+z
 ydTwhLSYezv9MulGhZzh8qpHwS1Gqo0bKBtOmT1mztgH1SSsDKvKpPhiNKiRRB7rleYzgYloxBB
 Vz7+oZQsc8wHQ82NIyacWFzBfMvsi/ZmPba3sroND3ekJrKT0SsZ649akSETp2VLppvO0fOJUxH
 EvkgzxJ0RO5tjRCopYWfXbRAxZLuJ+eflsvg/YZ0nYKnIosIZgGBZ6x5j0F1rpyd9zxfqTzg985
 MN+SOfqjroS9vT64JMKgF42V+hrE23pl403wLXl1wF1ZOQcIgR8jk9YNFrqUzMaxXMKvw/y3tYI
 CivzQOX0Q+coDD19AwSmmxwlKj6AX6sB+mvAB/pbrrj4mr3mA0rp3UaDh7bhl2ecBwAufqV68+7
 8/s+did9HpDDrm/EHceTQuvSeANHgVJUCXBx64zSWzdRUGvdELwe+9pCNgsUOPIH/KkygNLRcCM
 ye1O+mBaeBIngMQBV/ukt8Uc1P3SnaE+Q4ESw1sEJURdq2htezUhIaxMePlX6UuGziZNrw1vCBZ
 hDsPpSn3/6HOagrF+GeaOj99gpIunAlRI9l1Yc4KZ2yOpdmowWWwCiVu1zbDUz6sCl39IyLXUeL
 d+pE79VcqEbMZ2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1598d cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: diZdLhZIb4CrtzNeJZMsH_yg1dUQeRM9
X-Proofpoint-GUID: diZdLhZIb4CrtzNeJZMsH_yg1dUQeRM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX+BKP8kuJtg70
 TSNUfaLVaXa8ZfXKCWtOc1VKFjskWX/CAQmxMrFGoLI+wfnZKTQM7DMNlURKFk/9FPA4Y+cN/kA
 /FklkPqyRyDmzIpuIOWhQ0dend6yyWZijdJaHktJh/55DKHFqHx/6c8WU/4fjSN6l2bgW+bxQwG
 ilAkJE/cnWVHFfF8awSFqYj4t8E5YIH9qohy2BcPsrqPWpnWt2nzlse/RBMgMNGfHTmdY5kXR+Y
 wrR0fhqWfe+vJa1RsHErr1Xdtz9lrTzm9mqi/A5UgDnvJUUE8QIEGL/mPwpcFK2J4+PPcsap99I
 c51ZfzVvvYjtJEdc8KtA0O1gKpiO/ZJC1UJLQOk/gIRBDj/lAstBwl4TEc47QOPAG4S/ytVIqW/
 skE/coMWfWUXWB6mz0t6Yw3yZIC4Tzj2+YPVIMWcHslzaVJ4t/ToWVVAQ8tyJXbdEN8dPYxz+Le
 CiNAqcLn40Da57qz6dA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081735_821563_F006B210 
X-CRM114-Status: GOOD (  22.26  )
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

BH workqueues are a modern mechanism, aiming to replace legacy tasklets.
Let's convert the BAM DMA driver to using the high-priority variant of
the BH workqueue.

[Vinod: suggested using the BG workqueue instead of the regular one
running in process context]

Suggested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..c8601bac555edf1bb4384fd39cb3449ec6e86334 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -397,8 +398,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -863,7 +864,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -893,9 +894,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1091,14 +1092,14 @@ static void bam_start_dma(struct bam_chan *bchan)
 }
 
 /**
- * dma_tasklet - DMA IRQ tasklet
- * @t: tasklet argument (bam controller structure)
+ * bam_dma_work() - DMA interrupt work queue callback
+ * @work: work queue struct embedded in the BAM controller device struct
  *
  * Sets up next DMA operation and then processes all completed transactions
  */
-static void dma_tasklet(struct tasklet_struct *t)
+static void bam_dma_work(struct work_struct *work)
 {
-	struct bam_device *bdev = from_tasklet(bdev, t, task);
+	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
 
@@ -1111,14 +1112,13 @@ static void dma_tasklet(struct tasklet_struct *t)
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
-
 }
 
 /**
  * bam_issue_pending - starts pending transactions
  * @chan: dma channel
  *
- * Calls tasklet directly which in turn starts any pending transactions
+ * Calls work queue directly which in turn starts any pending transactions
  */
 static void bam_issue_pending(struct dma_chan *chan)
 {
@@ -1286,14 +1286,14 @@ static int bam_dma_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_clk;
 
-	tasklet_setup(&bdev->task, dma_tasklet);
+	INIT_WORK(&bdev->work, bam_dma_work);
 
 	bdev->channels = devm_kcalloc(bdev->dev, bdev->num_channels,
 				sizeof(*bdev->channels), GFP_KERNEL);
 
 	if (!bdev->channels) {
 		ret = -ENOMEM;
-		goto err_tasklet_kill;
+		goto err_workqueue_cancel;
 	}
 
 	/* allocate and initialize channels */
@@ -1358,8 +1358,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1393,7 +1393,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


