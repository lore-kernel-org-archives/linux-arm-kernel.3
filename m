Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1681CC6B02
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=SY7sIHDp9JNNjVXpQmQCDaH8wG
	PDLgR5E1tbAG4FV3WpOr8qbYUdnTICb3dqGLZqJKkw3aJT5NJ40IGH4EP80567vomEJV3IFEhan7C
	tJNnskj9Nhgkj4Ha/HRlmTGp+Zo9W8NeFTtDuaWzgJ+q836X/FVJ2cP7vJKAPDpYlcstvf+e+TOnI
	Y+iEAbq4v1llaAHD1byybqtBG6DXD04PccqU3OAL/FnDHUATSROjyYSqpGKuDlckC01bZ3M6CPFh+
	4jjHMW77QAZATg+7eGBmC/co1nvUHkzlwtpo9Tx7ywMqY6An3HRxx1bqAjzJgcYIzRKFFWQVt6e8l
	6dYFla8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSj-00000000Nuy-1Ud5;
	Thu, 02 Apr 2026 14:56:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSg-00000000NtK-3xzb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BtV0S3238871
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=MEj2w91DidZrVNCt
	x5ou9ZYnlt+bQtSBgl7CXV5ssiWW9aMTebaPLvL6xd8cnlGkoE4xoCIQzLw5WkvC
	2SyX6AhSgPxQAFkKym3mikjT8BJVbSsxmwhYLbxmxXkEGdbvZX3Wjko5ESkqId8B
	Hlwc/9oxmstCHiuV4qfQt3C/NPEY2msZBNWmiRAG2yAdt8DIr45YHjXDtcvav99K
	2VpL8Ypyt5jPNzA95A3EhUVtBowS/a8+QwvA+zE1GFXqrxkjd9h0T/SsGTKnDtoK
	epJ2oRDAxHulr8/dPDuWCorQmq1jLmI2AmeSkpylcz6lHRXKnWpVjW5cFSzWCYYM
	eTMscw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9r0u0r3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:55:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b323c43fdso20198921cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141757; x=1775746557; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=RFVlWM/8OAT1aRveB/Z+siv8sXr0I1Y2NkgkkONkfA2p3aaouC8mWYo9dw0z5y+PyQ
         sr1kjVilEPgHovHFr4psjIG+ViETcZEfLXaFLse/tZZSE41ARWL3N3N6TCNpIz0I+tYe
         QNntggKVZB59l5uhCLEATrBDPJJMV498h/ksY/Wh20XtTU7hb4CQIqODssE3RYrc9fPo
         y8fIfKIwjbnGBazOLTc23ouyGUkHL4du8sVb8FtkZ91O1H5/8yj3EzI1v0aAUuexgGVE
         EPkoW4Qz+IWfsaOCnUc2zg1iEtUo25XFLc6O+EgMIz6fMEjLsQMOt70r12GC908Tc5cP
         HoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141757; x=1775746557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=LB7IatM/M3Jrpl7kWoe3/be/amXt+xBIkxJxloG397arRAHuBb1xo8EfbuMebxghDA
         qs6DS852uw3VIj9f8+ROAZZu9JHn7m/Tfim/iLLVM7XB38UIjNTRtMV+fKnWBtwJS98W
         RBy7RR30mGOkrOEDaCSp8bOY8GF7+OCikKXrhoVNSmw/Ajm3eLhDibilpJiY3PX1tAfj
         B8fhU0AibifxXbbfqrbUSLrlX8jOjrt0jTjNXUUbubqT//KNV4fehtXYka7QMYkfgxzM
         RbLtAsnmPVaUchek9aiPswDjdXEQUfZmoOFPbubFcvvxbwoHmC2S37mNMA6N0JKnf7ZV
         UAxw==
X-Forwarded-Encrypted: i=1; AJvYcCWG88QHWFuhgyhIK5gaYAy/Nn63/D/XXGxR26Gou4hmWC9wbXWjSCwdN8NKXd1jIsnstibMYhgb5etBKjvHPf6+@lists.infradead.org
X-Gm-Message-State: AOJu0YyvDc1+n6Bdgn+JGnvQ1xv7o0QwPSqjPDG5krXBqU+fowOonJez
	ba7+vBEhYUTPfc1354nl7o4Jg4P6W4zCEySqOmeINP3msEt86/IW+9Yc7/mw+RAiQXwiqZCfFIh
	pe7IlsA/VVue/Ig0eB5juQZ5QKHH9svbZaaOE8uLm8gy1p9pu5rCt6defStuDRxISCNmclLlQUi
	8QQw==
X-Gm-Gg: ATEYQzy5Z6FrRbBZsZzcKnVq1G4078G1IV1t+Um5GbY9piIf2qOfm2ELAFnJT5xlmm9
	rsrWf0HlDJl9zqhKuDx217u31omAxffp457nvps+Fnrpfgc2TH/odBYa5Q7eVJN7GQbtm/wAwDx
	82B/0an9yMhnIRiGkboo9gcbpIjJvXgSKOdxHLNDouiXjF8SPTboIMk5mIu6UyFTXaDYXlHK8Dm
	tU6wy89Ym2LPjaSYpf5C49/B7YUkFeA/bJBrg1haK7CwkvXbdy3MiVjin3/OcKJSZkUIEoGmZNa
	MglflOw6X9ZB8l15/JibjiMw1R6zqwLBrvrCCliWMPO46Uc3lqzwoJaIfSj7jGmZVe6OqInMtfG
	OHiWGqWlpKa/3J5WrOshqkUKUFho1dpn0foKX+V+vNC4NDHukNvJz
X-Received: by 2002:a05:622a:1345:b0:50b:5402:62d with SMTP id d75a77b69052e-50d4b995f71mr54639021cf.11.1775141757062;
        Thu, 02 Apr 2026 07:55:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1345:b0:50b:5402:62d with SMTP id d75a77b69052e-50d4b995f71mr54637721cf.11.1775141755389;
        Thu, 02 Apr 2026 07:55:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:13 +0200
Subject: [PATCH v15 02/12] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-2-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNsPXTXq4SVhzIheqeObqWYTQvIRMuziOMQi
 0C36f+/s9CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DbAAKCRAFnS7L/zaE
 w2pmD/440DWURcBlfLoxG1ut7dDL5r75R2Z2CNwXCwbe5iuVQdWSyQYU3GAqk7OJ6e/rskSlhXk
 d1bLbZl2YSIQwJu1dk6bRulANWGYCAq+rfmgbGrD7IIbPxOg+YMsXrSQnhJI+uaSdk5T2S5X1vm
 C8EJGN/IrBOhQy4U+RlX7jj/JbU/cUgItwbI+45LdR5NMwN46RLwplhhA5ZS1sZg8FUo2++rT/y
 bhbBU5IdlKANNsn1aHPftJ43l6cSnVWE4wXpo6yvljECtaxq0KsEGfH83hS5pmX1irMTkavuUXL
 bl00yb1QZAf0yyoO4oSQBuUZ33VyfSm5fUOQ5yk8+GcG/31SYObMjo/9WutCfX9cnR+sks8DdXt
 FhfwDGskJhGBrQ6Brb3ydCyBo5ld6LMWL+izYTIwEHZvMRqj79Eb6y4tWg1UkQRdY0t83RnDs+N
 l4FhjXw20/C0Kp6hqXtSuIQxgodaeja8WLAHkvm5COePsWSphIqjMTXnmmwpk7LFmhwKjIpC/zl
 m7DWI5uw0taCun+0/5GP3jp/bYYr4EJjDGZ3prKW36iHwCU/kcWLaSTG2zbt0femaNamOSCqUt0
 hSVhTkDGZJ9BOMLAmMSZicivMWfNdp4DO1Hn14ZDfb0uub0RkNWs02EUqZ+4hij6c+suz/BxuaI
 WFZXVzDVuX0pCWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX7ZKJZOcInwJo
 KhyoLQqY8SIiClrWUwGH06hPWB37k8+GkzVNWk3nshQL6Ul/XU0+SbQVB5w6+TtdSC4KeE4TzGZ
 hyb9/LqopWtz4VbOpECySO7lqaFF5/1Xvb7nWku/D6ABb1sZJg/phyhxWiBUxoWyE82OOZiOdaT
 eIwqpX0fhnE2Mbdt3ueNBQndONdfw4H6yPKaKBqIsVgF6wVKWJw/PLllmoThzMKlhdhEUmAGEX3
 NBtSa4nAzFfDGczuGPx+/xbFPQjH397taRduM9emAYU3jOiUzUG8NCi4YG3YzP53/Jm7jD1SC0N
 hombsE0OihyWx8rv8wB02w9e+poRKk0D1kJWPJ0NMenCNzOLmNbu/d6sfQivXZZP5woW9PPrWRi
 TxPbmMVOwo4jAOUznuwTfyyRum2uU9KotpOPUF3I4/ezLGgPCHfSPYUesgK05YrZN9UyOp1wesU
 Fr4nu1VSi997Sm3+4SQ==
X-Authority-Analysis: v=2.4 cv=D5xK6/Rj c=1 sm=1 tr=0 ts=69ce837d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: MS7DbVDjRHCX73dA-aVLyhj7DyW7CBM1
X-Proofpoint-ORIG-GUID: MS7DbVDjRHCX73dA-aVLyhj7DyW7CBM1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_075559_113267_1418E4CF 
X-CRM114-Status: GOOD (  21.74  )
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


