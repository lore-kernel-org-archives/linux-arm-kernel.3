Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D71C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=rJ7Zllsd/AamPO7q0c35T3FpLN
	l2CCvIKfyBZ8CDgHbPsvRB8gFHxrwQmTd95D8mP9kA1lRpB5ccnTQibW1vjyTM49DsgVhshaKwijM
	HBYErh1W+DoAHZhjOXVl5cfLrH/L4mYJlh+SrUEDYQIst+kFtBDcM9e+jPA0E6J/F2sM2XieZBgvi
	/EoYo9x8hWSwFvCIYE7I5aecOV0nLU5CBRZzDrhvN4UI6l3lGgvOeMP4NuqX9O06vO4adQ6kMhoWQ
	h2wTuY7n8M9xK+uHXJFhEnTuEm5pCqSmoWq4HlW6qK04HKDeoTtlfRKQmpjllUwHxiOUqljbQSQu1
	uQzmA+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8pb-0000000EIaX-42tw;
	Mon, 29 Jun 2026 10:03:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8pY-0000000EIYA-0oVl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:03:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8xfXr2431930
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:03:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=lxd+YGM+KoQxlNeH
	8pH+churOwNbEFL+qWr4HRWHCEr3Uop3Ij5kQnsEWZiTrq9LCMnfYAQFuAJXC0G1
	RvJm3Vvj0mwZVTYEMRq4OZm6aKl1pvMuMPt8/tI70W0Fav+WLUP6sCDOAMeTIkg7
	sYyokkHnxy90WWTH02di6CAtw73PBmkuY5DdzpQAYDz1Ho/8Cjw33prc7DWH2Ug9
	9iTA4r2rLsp5dPiCD0dcd1FegZy6kiCBK+ZT/QxbE9QPgeZgy6KYlu4Lwv38bFFL
	sOzWe7ftUFoAM2HFW7I8TYNAJblflt5TAX9D9nUoBCH1xNJbW3oTSsDo1NbKf21J
	lYtM2A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nper975-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 10:03:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5bd6e81f792so3084766e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 03:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727386; x=1783332186; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=I8cSOKvWig9rVhD2PQKPpnJdqu7xANqFh+Rf6lNSP/5r5tmEgneGPmhdDRS6lE6WCn
         OF05LdskboYox3psQZ1W2pWgn2Vrb5cvVI3pxFSpYQ7vD55AYwEx+vDiy5BnPuG0UWUt
         OqjAZMmkeG76vJVfWAPlggIZRh3J2KmLK3/SUmCwoxiZpER19Z7mt29+gBUp0EURtScy
         fRSPBZH1kT0oLTbcYsGPhaQulMYAe3cEmBIZ0pMkfQnXM6w90hu+0OUtj2s1fjX8qFfO
         LC1jMj/zIEpvkoCH/NCAC76PLTb1IJZ2wyTg/E1UmygYczV0LNBSJsLWtWyRu+rb16mh
         NZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727386; x=1783332186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=HV5jdYAlO0VPNKIqbs88yt8bRkdFu0hDEGzWutAUDE/O3J5FwhC5HRK9/OnN6+WRdb
         Dz1UcOP7rn+C1BK4vl80xQjoecp5+r+7Q/kYacnS11rO1m3Yeg4IPWeBoe0k/ZoatMxa
         ILxY5rmB6oBlR+wv7UE2Xf5I+raknazci8wgFF7KxdmkIF0LoDepo0eNS5+ElosCmQg9
         K1JlHucBpULCkgIvQhVsty6IeyQ6bUQVNMYd9f4aCp90WWV2HIJ2zvW02y7BFM/Tq/YJ
         yHGYd2PwTmpTZY1t2L79sAp3ZfZFgO2tPBoOcZc5nADWQdPnQ5ub7BaRFkDKUiaPoyl6
         jIvw==
X-Forwarded-Encrypted: i=1; AHgh+Ro706YYKG68fDKCaV6wFIxuf0/dt+HTV6d7AIKvaBUylXmAxAmS3dnm/keLzjiS1oEhfyhPw/skldwNCQSctf4C@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8otBGZNNx5yBrDhQ2aDUpQ2yMRxStuylC3vSqul2dK6c7Z4Ut
	AvnztYTn4WpsOOzFim2lxAvFQEGFQzOKUpGRcaUlaJsRAgqsilTq5xKISgDxfQxNMWUJMPZ/tUu
	CakGoDgqe6tNZ4Z+Qis2Tq7M4Cvz4hdQ3cagvk50mDfVZd+4Js63lF6eDyFR5lRQjXiZIZbaNf4
	tW2w==
X-Gm-Gg: AfdE7cn+UWNpiHEAEnh86YZ47D9bO618EQC/N4TQhQ0dUaEacCydffqB18agnNGeHi6
	FcJ7x5SlLo9a/+SZoM5+PJkuSzs6H+uGQ+mR7oAv60B0L9hqHsOcJ2XgWMUanb+v67jTpI2GHIb
	2hHeROCfLRmKArAJfTZjLr+A70SBTMcLFoDFKlZCuTcQJLaVE2K+kMAY7l1YMOLcx1cltMNfYnC
	iGEra1aUxsjPbL2RVvVqBSnt9urlOIC9CUPzCIYGS19n6jVcyRKql+8lsxuBiyNpKEeOqFT6cYG
	gWr/q4NIbMSFU4a5SzZDbKcsngs/Q8DRAlx3qD4teBBjBOCWDCvzk4a/6J8I7ER//Wao5J6pLwG
	/ZLVm+bf4wf2YR7yGnTj9VBAOtZYNgZIc9LJeBadl
X-Received: by 2002:a05:6122:7d0:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bd69dc3af5mr7025463e0c.12.1782727326066;
        Mon, 29 Jun 2026 03:02:06 -0700 (PDT)
X-Received: by 2002:a05:6122:7d0:b0:5a5:3eea:4513 with SMTP id 71dfb90a1353d-5bd69dc3af5mr7019570e0c.12.1782727294041;
        Mon, 29 Jun 2026 03:01:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4705f8ea729sm24729405f8f.0.2026.06.29.03.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:01:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:01:05 +0200
Subject: [PATCH v20 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-qce-cmd-descr-v20-3-56f67da84c05@oss.qualcomm.com>
References: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wCpLSEqzl6yoBDde9p+VABZfQUJK0dP0DnJmF5kRzKI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQkJqJG4NZNDsu3JpoCMiZp9XSSPn3ihDbswpT
 eRQcXp5nSqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJCagAKCRAFnS7L/zaE
 w0O7D/9JyrQzzkB6Wv5aFDilYPXHCfO21IAugUnx/jhdZge7cS0uKPqSl3fpxRpgvSXj+RRR5kg
 9H9jHZKnRdNXuz4SUrASw4kQ5c8ljBRgjMchfuTJ+LdIo25IcgjzLivdnrB1BpfNe43LwQtKL+x
 neMud/IXvYTf2wCDQ/C3AZRNjxVzSel7XqEw31QvO9+R7bqQ+fJ1CJA/MSBM4HRyaYk5BkALVuo
 MDh4fw99EflxoUkbyXJNgHKNfdch3FC9Wgt8qpy/JrjauwCgv/rxtne/IRWQ6eGx06YVSk5jvk7
 G7MDd26+G5V5DCznpnGLerUympvDBJaaKsqhb+szgyEfHcyN7KJ6Q5nJHkyPLnlG/jus12CAMLJ
 2V/bE7YPzzhNZQUO3U7u8F6Xo21Tw11UDlx5ZcSqYWgXO2KxAl9CUMff30s0O/dXCUOeffsScI7
 gk9hnmJAjWw2ROgbnw4WZO1Zi+1DfN+N0fOubDPkHsmR86sJelDk3yUxDS4lJaywRdRjOH9sh1u
 HF8ImB/FFfAZEucm2WvC8Wr1qaUs7PhhNfogsTbBCNvwi10Ty/z+vv9Y0yzR5MCmGx3e00fwDMx
 kQQj/Amm+hntJH42xAxr1RgzK0jaMHrM2SqvygNewU5I8u8+i70S1W1IltItgX9QhPe1SAbRzDl
 dvjlUNdtwr/vbuQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfXwLcmSDG0dOoV
 1HHV/alodeaqCVcwsKd/IbJFhPw/HdK8utgG38PHGJTlCajFkmKYSKRaX0X4UjiDBP1DIwUbxJs
 dWo4vl6UVvhrKqEflcpwWkGg3Yl1l/rOJaVOfZirSPHvi6LblkXFE3u87HNlQlfSEMgJpkwyIsC
 JS+4z4jxFYg5/cv8QiaClTpngePNORKmp3mMe8AEm2ZhC4SRD722vdDDpdIyQWKNhFOFnZThjzC
 whxLPgCu//a8gzKRk/Ahg1qk5nK2tPwNbXSVgNTW3vZE+ezcZz6yHEOWRHqzNpiIVPR1AzNy6Pj
 DkvcreUmbCzyLOjLZoW0h0Cz1r91UDaO25ZBjEBIIyo5dmmE0RLZjYNqooGS/CvuT9Q3a+xLPUQ
 91IhDkntZ1k28HgdJA0DxXTN2jVgs724IVG8Shxhq04AO/N+1kxeLIlmZ0ujgzEZgbvNlFCJbfs
 87ZAxRry+2tMVNCLTHA==
X-Proofpoint-ORIG-GUID: Q_EAt116T0XLFN6SzkogU-861tUAcw9z
X-Authority-Analysis: v=2.4 cv=T6q8ifKQ c=1 sm=1 tr=0 ts=6a4242db cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MSBTYWx0ZWRfX/Td6JrcJlYvD
 hnID7xLmNyyrAo4shr/5IhxTTKDa6bcmecFC6l8546Nyj95rBY+t/j0vWp+zqVE8vB1u3/SbY38
 iJg/zKOYwufMswwS/BSQLjUvwN8o51Q=
X-Proofpoint-GUID: Q_EAt116T0XLFN6SzkogU-861tUAcw9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_030308_270970_FB2E6ADE 
X-CRM114-Status: GOOD (  21.60  )
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
index fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15..ea3df28e777f99c0532761b6aee6807ab23ab4ca 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -42,6 +42,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "../dmaengine.h"
 #include "../virt-dma.h"
@@ -426,8 +427,8 @@ struct bam_device {
 	struct clk *bamclk;
 	int irq;
 
-	/* dma start transaction tasklet */
-	struct tasklet_struct task;
+	/* dma start transaction workqueue */
+	struct work_struct work;
 };
 
 /**
@@ -892,7 +893,7 @@ static u32 process_channel_irqs(struct bam_device *bdev)
 			/*
 			 * if complete, process cookie. Otherwise
 			 * push back to front of desc_issued so that
-			 * it gets restarted by the tasklet
+			 * it gets restarted by the work queue.
 			 */
 			if (!async_desc->num_desc) {
 				vchan_cookie_complete(&async_desc->vd);
@@ -922,9 +923,9 @@ static irqreturn_t bam_dma_irq(int irq, void *data)
 
 	srcs |= process_channel_irqs(bdev);
 
-	/* kick off tasklet to start next dma transfer */
+	/* kick off the work queue to start next dma transfer */
 	if (srcs & P_IRQ)
-		tasklet_schedule(&bdev->task);
+		queue_work(system_bh_highpri_wq, &bdev->work);
 
 	ret = pm_runtime_get_sync(bdev->dev);
 	if (ret < 0)
@@ -1120,14 +1121,14 @@ static void bam_start_dma(struct bam_chan *bchan)
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
 
@@ -1140,14 +1141,13 @@ static void dma_tasklet(struct tasklet_struct *t)
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
@@ -1316,14 +1316,14 @@ static int bam_dma_probe(struct platform_device *pdev)
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
@@ -1389,8 +1389,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1424,7 +1424,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


