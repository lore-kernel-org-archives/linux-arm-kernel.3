Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F8FEB1073
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=; b=CONw+Zv/JY41qcuw3pQWwbMBQk
	SwqeRRTYcfjgFKzZRT5C8QQhFTmMfNwDkAIDPi1I4bRsBy200otBmCjro8zF5Y+2jBDGPoWAN6l1k
	BcFPlT4OvFV/G3VIIQsaHoY9l0i1zVP5wObmfykxMYyJg5KHCs6YDGltFMVdPjGXYvSjB6wUz5E+V
	1DF2rCdaxp1cKFc+Z4wEdj5UxGyUJMW+OaeXKN+DdTqRnSqqVwYKwLlKp8WczODQQlIyQ94xntqu1
	pk2xM1Gp2C8t0/QEer25OanqBtO+d7guClo449CHJHbxNGYH+1JXYW5SM1eLVoPdf6n7KKuFtX1rp
	j04NWZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGT-00000009pvg-2E7w;
	Tue, 10 Mar 2026 15:44:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGO-00000009pt7-2S6J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:44:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACavSd3418255
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=; b=Zz/dQiV+ICIzss1l
	FW17+uI1b3bFMMU8aL18WAY0vY4sb27u7dQRJmCaAYJiFxEtESwqvN7OxAyI2078
	wZAW8YUUZzuKKOdVD8miGxJpFfvVcTu6Xpqcqa6OIfkBuUFH9n0mVQ8J6xzbcPZD
	2y99kHLUQpHYtQr0onv/9lNWFPbJHJkZQqOWJzjLEuyFT/eNWy1V4DyOv+27Ix9I
	IO0Fx8YfYsDyKWCYz7+sJ2PocMhowRz1SL3I30Y9UMbmWhcraHq617EtzNdpLhmX
	S2ic9alTwoIMXUkNxwuPQxAThrAjpRC12YEHnmcwpxFyDcsLB8BwW5JzetpEpWp+
	ycXD2w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctja290j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd91c0262fso841089985a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157490; x=1773762290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=;
        b=JY7xlxH5nXwOY58AOWUQvjZzsQVGmAwBdOQpoJyggn4dGrCqGf5wplWH6tO1xaqrrJ
         A+2lpUVTHv8/j2V9RvtVP7u0BMcBn3y4vcRw2r31XqTmtFbnC8Ajm4Bp0g/SHAP0CfFn
         qgTVfW38+fJGNJ8nc0yJPBIOx8RK5d0iQvDhRCdEPSk8eu2v+H6/mIFk3Bx/UGOO9sAw
         +svM1Zy3bYcDqQSwol3Jvu4NqzH4FcpfzJZNLmDTdx0je9dTcHpkc+KgY/A8OkYOr33a
         XEusx+8fvlWF9remxZQdeg+kpqqpkJqm9HBrSq5Y2oFOs3zFg8nSgoFFuibULs9VDPth
         XAiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157490; x=1773762290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FqTHsx1l1/9oEj5e3q2mep/esitBtih9Ht1cGIH4yFE=;
        b=RScvR3D/tGhdQnrZMVgSwlNXA0CZwSoFqEYgUsfiMb4I4hS9eT3IBkMtGHbZ+IQYtz
         qwL3nouVWh5NrhLFtBXBvnjVzQ0FAzM3QQZIu/vf3s08giXSIeImbLpOOeG/qI1F6bAL
         UsnNvxzxrUls3VHWVs+MMWHBN+j62M9w9M28IJQVy/jUK5Ca5Lg6/hT0prbMN9O47012
         5tjHp/5yNbLCzNIxvlX5Kc+o1PRj1rZdifaBhAusR1UG89EuKbrgFMgX6QiAnQXX2aIX
         QkeBsCtw8hYCjnYgSn1fxSLQvINRTQMphVXR0K89jtEY1SJKmuY3cDkXeRnq0WKCaww3
         4WBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZqJP14xJ9ASoo62Nc7aah9CHl9hepUYkUwutQb5OS2+spDByd7l6bvkruvPMc3KdwALKNhP4SDs/vG5TRSnLg@lists.infradead.org
X-Gm-Message-State: AOJu0YyIoseei7AmrlYdtSnQxRag9zOFIwQl8mkg0MOr5fbqaFT7VOlH
	r5qoyHbC8x6QZGurn27V0U0Ay6M+lDLLz3oD4/6zGO8RBvn/W3lC/lxftg7wbqmbEObtO4vY3no
	svRfD7bRKurYOWCEsdVuqEITYhrDx9v7kx3tC6TVH7p8rNJhcAqj7YXzhKfgQyFJXtAgTvuVp82
	YReA==
X-Gm-Gg: ATEYQzzi64BJ88e7GKJQX0R7BihoHsPZAH/G7mcNslw4W/Y2/hmaGPGMui5EurNgScY
	35OAGkyBVDWyP/M9xXEHme38x4UOLp81v87gVFPyNww3t/I8Ue1g4vqzc7Qj+MS4tO0yM0EQdPt
	ezISm/YujOuyVGbkgYUj2kQwUD56KxexNrr7UbaQsO+79Mwt8GfTzI2RkyZGHhoGM5JcHbq5dcb
	nlY+SCvoHnCS808fvbPU1+wx/2ArLGK3ud3R8cxEI+xsfK30265C0Vzhbd4O0kqZFKcEKaDy/ZO
	nW/wh28WGKDNbgy3nqZAFQ82KYjrlL1iTQP/DD2HmPjZ8d3e7whgWFf22ypspmSK2JkOfDWdFtO
	SV/lXCd4o8FbbRZ0/zsCD7yGLNhtjoHLUTN9iGA99JRGH3dfuJXX2
X-Received: by 2002:a05:620a:4089:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cd6d40d280mr1882571685a.17.1773157489583;
        Tue, 10 Mar 2026 08:44:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4089:b0:8c7:1118:c514 with SMTP id af79cd13be357-8cd6d40d280mr1882566885a.17.1773157489042;
        Tue, 10 Mar 2026 08:44:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:16 +0100
Subject: [PATCH v12 02/12] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-2-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4367;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZjTo93puqxgLaTUXkUuT1EliesGs2ukWThDJ46ZWj64=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxg3vLRv4Cb5EFc9ZrgxnkqHCgnRCrb06RB8
 jAQPx2EncaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8YAAKCRAFnS7L/zaE
 w2WsEACzlbvZsqHI05T9FMT/nknigqs92ad3jGRwPGVD/VshV312hnaSfUsov7+a1X7dgXn2f0A
 exh4/NUI5d44CHBFspXvpAY43uTy7J8EF66Q9Hs2GJYdC92S/yTkWujdhwoelWWfpXvCyL5apWG
 XhW0AHmED5m/0InJni1bZ/Z1h+k6cEfZEfPz2yUd0wChIyIpqCw4SyQamdbqnjDglXA+t95RhtM
 x3jI2wEGzND9Rv4ln8OD5AFxZwYblABAFk1xWol5+2PUeJbYP+2UTfV2Ef5jIyvJdaQli/8AFB7
 v61RJifx0GHsBTyvzkbjLcNbPjCj/6DUgB+5KgpXAD3D8gsJHNPVi7+65eFrkAoQff0Co8ROeyp
 kED0BMAKnVW2wAlrYcm1mly1X6HWRDrDg7EspfFmc9EsJV8JsY1jjYH7LrZiIYa5AX01pNf9UT6
 I57T6CFj6EjcC37DCKza6WG8XjfYC3iHbLKcP1gpklnZ3JSI9J0mEESdV6vGHEnC6KXN7P0fUPa
 BKZuonBLBnZSv1Qly6sfTAE7gsabuWkF/03K4Nm9dgvK8l6xwdH5bksyrAE6kGZRlr4vgrc0oVy
 UZJ0K4+Pfze++ekR7yVfMZCFDQHLi1ePQ2lFctz373eH/WPXpqXCNiKuVjLrATBPPJlT/96wLnA
 Ez627dzznZ89zNA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c9WmgB9l c=1 sm=1 tr=0 ts=69b03c73 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Q8Pf_E7He_NBxbEUyT-KlbR5rK3NqVYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX2ign5bg2jcrA
 JF0REI2KxOwwhQ6VdNwvqqqJMCOklUGgl1qDuNHPrzRLb5SFTMkJRa2qTGc7N77M7F/OoInDYqs
 p8aPXiL4r7zUrTXy8pjJfX8lphrGScLpfQYRyXEbbGBRfIk/HyZXoPk3YdajKEmw41OtEX/3fLM
 hcG3MItr2IaX4SYIbvbcgVXgsBHRQi2I2qfS1syjKipYu4KokSDPy9TNOL9sap5p4H8/xPru75g
 qBLSkGy3ADvGMZSBEddf0mIZEM4W9T16bIUVNDYv8DxpNvS9QeRdEb8TWM8WgldS5LpxTR0gRJb
 1p2qjIps6/nnglDcAlLMs/bCjjxggGdsQhdnEPXUVn4hv0+UcjohIkliAPk26HiQC3HnYXuqI0U
 +zpa6xYGq4R5cuVY6GtMqKs/rVCVYsZ0F1Zu2hyp53mHPnf/+jeF3uDnk5pEEGl5UlRewwplmTc
 ndXofvqA4//44ePirZg==
X-Proofpoint-GUID: Q8Pf_E7He_NBxbEUyT-KlbR5rK3NqVYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084452_760879_90BA7086 
X-CRM114-Status: GOOD (  22.43  )
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


