Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79575CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTfz7NVKSYasiaQ+Qj6RScTytUGsa7bdJ2iYVLGLoTA=; b=iHg2ISj9wVL8gJDuyqBQGBt/za
	hoKmQq8mVYocw1PaKYA6YKCrUj89oyFsv2No0ZjYL8OtIu7W9ciQRqsvIMRsbbzeatxEKYr0kf6vY
	wmqyjiIPVMVwTZ6NdYOoXJ0NqGVBAqtH1kdguPkoYD10sWHt2KpHTQBUwTeU7gw3jY+D6nXT5iyP+
	wItb/cXpZ4qPpvv46AqJ3paHzir6qaAiLvlRog89bShffAqkfHDGa9rG0KXFkF74VbrrBPRwToXYc
	l4NSjpVDLm+ry4isO08/oPnUJv9q+f5O7qN1wC6wPdJ73dXClNz0Or8x62Xb9XqxKpk598nFTZz6x
	dJVzuDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKz-00000001c8H-1mX8;
	Tue, 19 May 2026 13:18:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKw-00000001c68-1BdE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9kqK21256987
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zTfz7NVKSYasiaQ+Qj6RScTytUGsa7bdJ2iYVLGLoTA=; b=dRARRmyqf+rotZXY
	9sM/CsoOGiUY0r4VUi2P1eYEdw//lUpn/rRzDhmv/AwSK9NYtFcQ5rDp0ti/JZIX
	ZYfsrNkW8i/eBC/w3DUH/KcpqvR5TfI6ohvRbzSjzeRAgfoj1KLqL0y1FM7IG6AF
	87ORwWrwYimG4tV+Or4M9VcMkjE004J/ZM/ux0yspFbk6ONOjI0Mv9+uKJ3NqpCo
	M69pFPRmmHqadKaT1AcmNxdQ6TTXL2lXVcMV0oJec/bQuIBz6wDJa6EDk7I1s/Is
	FRTTCQpJSbRXLlF8WG8u6E1tDtWALZIQHiu3tt6gaEAw5+2pShS8rzS0keLxXLRU
	fo1IzQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj8s2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-956804755faso3979300241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196696; x=1779801496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTfz7NVKSYasiaQ+Qj6RScTytUGsa7bdJ2iYVLGLoTA=;
        b=CirricyiZcBFgz6oo9nikOBIE2RmOxBzTOfZe8QjzXAgJiOvY4VOO2Jc2/lmRhRfvj
         mgjbEUySzrJAmOfhz58DSTx3zDYnS+mijpOrt3Np9287yDs7x/BklCT0DcdLoFsNStY+
         04niWy7Q7knA33CyFIAsDfmgtVdLS12hBk4AVPTvl1dsnYaN5Mz8DyeVsBs9aLHqJxqj
         pWWncErR6etjgw2HGvpGoBNRd6ZVewx9z8NVhbgPhlyiBsKZZGSBiBF7f7Z1y9+rF174
         LYHhrP2bZU+jYgXC5PX1Wmyfo7Odqq1l35lGm0My4Aq4hhnc+RZ+2ifgzyExREOdT25U
         7Kqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196696; x=1779801496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zTfz7NVKSYasiaQ+Qj6RScTytUGsa7bdJ2iYVLGLoTA=;
        b=gF5coiveQ6wuPOKzq8bYQ+ajRJB7zwO9mUPsXtCivxWV4eflxH69wA/3NiFy0EKs3a
         gNOfnYe4ecTqXsXxJ0Kn5qwHw0NiOTHJJchHQhrEI9F7CsReQB6yWRI1PJfNDXaugtLr
         YPc8jtVozxDo7vzxy02fdLdubZpbWJPRomJaak2pN0GYDDUYcn8z7bs1ggghOuXEY24U
         gZ5kSEQ0M2NwFc0VEEvrojSsZW6lhIoDRetPeVi5U8vmI1/aOCYAk7vxUrXAkpVNj6+3
         brI9zOxbI9D06kOp4JxI6aNt263/10HQ17/Zhh5eIt/2mnjL2Bz8L8TWYH6bVo09W8jh
         hPmg==
X-Forwarded-Encrypted: i=1; AFNElJ937f1iTZaGfJRtKsBKQkzi992CXD2Udif/p+SUexB4c3Zsrq4uV7A9HgqdcuderfJ2JNVSI0bnHWuBa45G0Cyp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg3o0G/UH7DdpmAdiCAWYS+EmBckntLcIDNgE548LMi7I71XF+
	IkWuueBiqSg55d+li8jBa2RQTzq61rEFv6z8xTWAdzGMhkjJcQlsRNtvdctmoA77LCEu9qAz3uu
	g3i/wsfjlML7JC12lzTtlQPhsEp/8YVoBQeoFc95/7nOGOQ7ifDvegnFnnlo4MVjXwQJWaKKsKq
	WVWg==
X-Gm-Gg: Acq92OFkz/uvd6oFbIluXTVVPaLranoN0iEt6uBwIuXtbR+7RtKv4p6nsXBY1z+o0rz
	tU+1c1imyhJfjfPjtfifJLhFrTb4gOcilPKprIHBLz1R9fhiILE/5aXqPQGAN3RrOPQagZ6fVMd
	2sZD7WspfMuBfhml+T6kKVMWYMBZ7To/Trg8jyDISEBCw7+5RGj0j2g1zMnlQc1AnoHSy61aRsx
	Scj03UROyKDMDjh2X4B9W2Y3623VMV1vWosRrdxMqWAJInjR3sOIRNteWpCrOY4gYy++zrJ1lah
	peYapg60IgUWSxZ+QQ+kWzlA5QewMEIpp+gG2PmFkyuHy4igzWDFAGJADa1x3sfBt1xzoQcDCQ8
	9s4vPMM8gfpSAFkNhvr3DaEr8nRJzD5UOsbhpyel4OsOtBD700Kc=
X-Received: by 2002:a05:6122:8605:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-575f589f027mr7985216e0c.10.1779196695731;
        Tue, 19 May 2026 06:18:15 -0700 (PDT)
X-Received: by 2002:a05:6122:8605:b0:56c:f222:7d7e with SMTP id 71dfb90a1353d-575f589f027mr7985186e0c.10.1779196694979;
        Tue, 19 May 2026 06:18:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:45 +0200
Subject: [PATCH v17 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-3-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
 bh=3UZYwiIbKBd4buCQOF+dimTZzhwjtTmU9xpQcGXwfFw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMD04sAXfDjG9QFVOGes3j+ovzfhoeqdRGcx
 UauntlsFLOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjAwAKCRAFnS7L/zaE
 w2xRD/wMKEqcgRKYtiGqHi0TwR4lCcBVEVXesiV3XMpRVecp/HQ+esqoGRTmsBO2szp09SEH+oS
 L8gH+fnLzfaCxYPG6LHorwjF720COOI/9ZrU3CBZtFKFgS8aIY9W+q7FZrb9w5+5SI2d57QiUR5
 fk/FEURVEokd622IRC9s1Rla6iuRcnYEV9uU6VdNmlpa/sfffP6bURg/yuXaRZe2s8eBDdeFZo0
 vTUZb81UDvgrOTXG/lrA0oe6n0IQ1zt4Pvotn685SDfZtto7k/MZwNjD3A8He0HgYFD9cmfozj8
 kIObvyKylzIzoQGGlRHcrFhU/1nRHFHAmyLFpA3CvwGtC5y6hTBZSyVnBbXz3Dp3+2DcX3iEE+s
 /x3U8bkKcfNSdlBu8lb8BwvLRlsaosSFAEy/R2jNmyLxzqRCbcHuhwAZZ4DvJyhfccmhZiYjuKs
 mx1w0r+QBu3FjUIMIH1Lcp/AE8D7sffW+Rpj8qZPVwpAtGVh/fhCxdJ88gNoAfbkVxp3xfR/UEA
 44ibbPPhPpVMhO3d1+MVO6gDprIQfRPV4ot/LHp5MV2c57PGZuuv+CcBX36Acnln8j+d4LmLzV7
 FIURrKdwRMS7ZtnCl6/CQwbkviXmw/v3uUcN1uoyrEtx5VNMI94w4sCQ0CFyGq2A4qXNv0g67/I
 LW+Je6Ufzre8z9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: -K2Z8YLYrwLw5tSSchkIEmK3R61H1SQe
X-Proofpoint-ORIG-GUID: -K2Z8YLYrwLw5tSSchkIEmK3R61H1SQe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX5OzU17Dm+h7A
 oWtbWMx45s5g8PRkTcfPqCg17NE6121I1EJtogbbEClVIhwivCB5+/CP5c0MAeHajuIMcICQo0P
 9CmuMp5OOENTAtV5Fa4E+qYILmGIuFu1wap7e65mg2rgsLTcsQ61u5hzatonOgC40qYgzndTt8d
 1X2d3HzJTHsgiqb/FwCHKYIuZS8nuFhANx3gLS1NaoKdJ8HaEgeSiAx8pxzxRXTEAHdh2DJlhH5
 8Zy0mMFPdltPpSYSTk5YUy6rApgXNjnIS6Yi92gAev5BjAdsI9ajJf+hRfZ/H+pj1cj1TBaszKn
 KIPoJC+OxGGz8vberMDb6j2+HUZ3e2ukhdzLMM/sSz/VvLuFlrd54Ssr7oINeAQvEV9HTPRWvyT
 RXXE0a0BU3Yaan0lEQkHlMLZln2PKhhDi+LYNFDjqhG79IMCCjB1UnvoUmD5furA0GZ27ukkTcF
 oaq3RvnNuyrGEixMM1Q==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c6319 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061818_447652_8A6F8C81 
X-CRM114-Status: GOOD (  22.18  )
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
index cea44833201d641ce6a657840d354abb443501b5..e2f16efcdb55f7465950fb81e22acb451e63ba0c 100644
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
@@ -1359,8 +1359,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
-err_tasklet_kill:
-	tasklet_kill(&bdev->task);
+err_workqueue_cancel:
+	cancel_work_sync(&bdev->work);
 err_disable_clk:
 	clk_disable_unprepare(bdev->bamclk);
 
@@ -1394,7 +1394,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 			    bdev->channels[i].fifo_phys);
 	}
 
-	tasklet_kill(&bdev->task);
+	cancel_work_sync(&bdev->work);
 
 	clk_disable_unprepare(bdev->bamclk);
 }

-- 
2.47.3


