Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE54FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=DrUdTFcrr8hpRDwNoCGZKjOV38
	1FnOiTI88414uQUtNcTpgiPZ86j8fpOrSh7d7lEQCXg8WI4+E7BACIVF82vKXZJZSazV7N/1GHFpU
	25RdsHdPWtiBUMMCnVdYvMzc2ivMFh8CC6FL0mCqvN3PAiT0gMNdrn4p5ZTVQHID2N0qjNUNRif9Z
	Q7/bgYRznYiP+IsMc3TmevBjp9tPCOuRN8WipJ6vySEzHmaitQTQPYMduX91DYefRnKEgOKFnlD1c
	e43iMeWrhg+0XjBZTjrFUUF2HNFNcHSDD9n/wAdZliyemKdHKP18vtwenmAN5UzH6Gykw+Skn37+3
	+zXvOyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4W-0000000GYbp-42Qu;
	Mon, 27 Apr 2026 09:16:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4P-0000000GYXr-2svr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:02 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kEL73961889
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=ZWJTr3pXlqCC2RlR
	FGlJ6AX3AXqMklp6Ymy372sFwRBv6WSMo5pagYddmlAHtIDWQI75fUnBQTV9YFQN
	vdCRsvcxKfFFotp55zhr3VXiQknk8BIaAE9MdeKzGg+ZYti3R0E+Te9bKfoMuWu2
	B0HsvlVx8Nx6U/dGOKH5Z8e/nt4L7SG7XSHV2PIbr0rjfLPYEex1wl0Uia0vGPjb
	PjP2zpHcypgvJOSuF2mxKzDX4D6vydWeG08p8pwzGmtb/p85Vpg0HtcYDb/FKBQl
	Gqf1Kv+HSIqO/c8Nx1bPQl/9Bd5+2RuFz0P0mdnnuCIGA5KerLvq0hWhi1IIHGra
	XscZXg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k309ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so134479321cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281360; x=1777886160; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=L6fM+kRzzdagQrf9pkHkGJB4xTcQTaxzMyLkr39l3B3HyzNCA2K/z8LEXhfFFBToyo
         A2mhqdTmG10j0XCPX7M4yvLmUDyx0dxidvhz91p4nQK2tOLXV9eyV0MgbjGEpp849fAC
         +suce1I9P/fipKT+qaH2pLP8OPpy48IglC8EunVuc5D2ya/s4a6AnXDcxti+CHP8yrhf
         3QIBa37HX55nc/TBUCuMOV+C0Qc6e9/4uIJH2l189M4j3Cx9PiE/DNFw/uAbg7s5sF2l
         MsZxGMWFcQLWRxHQOlFXWYi1dCsMba3eUzgtMbV8t2v2OZHI9ZpPOwlPf7VHPBWvFQyP
         21mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281360; x=1777886160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=P934Xx7W6Rg2Pqi4pWZRzBxZfztfo5pA66kz1y2dnuTGbSrgyTeJbW6fcKeaWefJYj
         ioZkfMoOzn6eSC4Zz9Rzn71j2lCA31D03STFRqMppIbpRYGvhaaWR1YMJ11ZP5fUdPu2
         EIER+1Ne3CJFax6pTAHKMKGWIUb+/ePDG8jpNltgZeudQy0yLxNL923mt5drzXX3Xn95
         DH3CXTXgIShpFZiFx9AX7nyz8baiyyHw46MgLXPORqkRz6yCiIMUQsqctmDdK2BTR5B+
         UM5K2f+1T0CFMQMTED6h2Eqdm4lf/uRmbuc3ybiWoP0ooGBTqf9Dy0JxbfHswcNmphYk
         vn7w==
X-Forwarded-Encrypted: i=1; AFNElJ+5iq3bU4JdU03sKbs4TkGi+FRoq87KHlPRyWQ/6eX/pO6lfGK32MVGFzc+o+O/5iEHMhMZ8+6Hsjw7JtmtsjhR@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl6aQZz+WzO80FNGbWgFPRLeCS0YsdnWKplbjldrXyQN0WoXgZ
	IH0FkoCxPSBpPYWrz4i2TEgYwjC01fwB84kaQ8L0TQcLqDRoAVhM8V7Ur1jbd5R2xip7MKWXteG
	h1A0hrhhV7L3KL7uRupHvuuEJOk/1WxZ+SlD4f0NKeYdRFz+l29ndIGvWuIAFVTdxI9DoeKLvUl
	4wtg==
X-Gm-Gg: AeBDieuFTEv77J+MOIiWJXv8Mu1BUx2M0SegUvhlG/rqXvSZww91ZMET0Rg19VFvhfj
	zAkHYWv4UDYvK+JWdt9xXFAeE/TsFHd1qTutKs02yUO/OqCaZKGbu6deY4bvuA09nuJhftV0Rmb
	qi2x9qWGoyhJQjDObcqLD/dXgCfg4HTq/j9Qr5EOUmiulciLzIfqnbpQlfjtB8/cRO5wo8MFdfN
	/Ue/pXowIm+mQ+q9YDkCaylDfQHxeEVbxQMU0jv79X3kFNg601b9tLhicFOlPjHSh0sNAl9OzNk
	fHuGb21kf3HZaXtmf3KaGrYhgHER8wbTHv2ixytnV/MqH9Ojm3g1F6Csc14IJN1SYPP5xmt5eS+
	X0gbsReJWT1rkCq5H4fdt+4kP/73J7uTu66UxBj6OnrKe00Xkx7zmJiYRKmyo3w==
X-Received: by 2002:a05:622a:590f:b0:50f:c2f8:406f with SMTP id d75a77b69052e-50fc2f847cfmr313194321cf.25.1777281360050;
        Mon, 27 Apr 2026 02:16:00 -0700 (PDT)
X-Received: by 2002:a05:622a:590f:b0:50f:c2f8:406f with SMTP id d75a77b69052e-50fc2f847cfmr313193951cf.25.1777281359494;
        Mon, 27 Apr 2026 02:15:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:15:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:35 +0200
Subject: [PATCH v16 02/12] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-2-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7yk+0IR02U4vnvTl2IX14Yli5+ns+gg/PlpWP
 b+iE3z2vWOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pPgAKCRAFnS7L/zaE
 wz9YD/sEVzMrsUIG4UaK+/mt54Mp3VBFDDXVNm2K2U7sk0ppOLMYr4EutporK7oql4DcPrzFBZt
 Qk56jWtdQOpI0X/p2Z1Ppe61eX49zb8F9kDXiI0plagIc3EDjan+8SgKgoVcge0aROw9CUXl4tM
 u7sHqClBoegraSAdRDDiwFQ5BjsObELo79m0DRPET+gPZ8GcTm14Gi/6VjpQ4WK/+Tn8lL/qBGl
 cAIu2CcguniTHKWhoDiSU/PqGfcLYn5Qq9f9SpaEj7ywWy9TjyD0sZn/vfA7uhc1aavq7PloA+b
 5DNrQpskyFl9k5uRr6j4wDGvvEIgwlw5mLCrq4CvOxMdW7INCUJq9yZZ0BPteEW0DP4B2GjdsuZ
 K+AywqtlfyVNrr3H2Bo7OXyC2G91MoaGPl0YB4fODR/fQxbx2X+P2O6/4Z7eVW7saTGruN7MAR2
 paNamOud48+wEY00NhkXCBc13vGO03AuGGfrF2h946eDZn3DsES1wL9znf5CHaCAmPt1hrmSTIT
 LCkgZw3ij2COfvaA4QRIic+ovd9iN36hYLfu86L4C0ipCFJmwck4++uWzad7N65CySvLbRdMb1w
 qbUVfcb2+ovKD0nhbcSwWVHrb7M/21CbmG79mv2EkJOdQT+se+2A8hV8p7v0/2o6jeh6wkt+9p6
 6+wtVqWTC3L6smw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX6iERbWDiaATI
 5wBVvMNRODUqoKKYzj16glElq+xi374D/+Iddi8cgH2DA+vkLGLjyaSkQ0sQVdxFWhVO0o/9Qju
 MTc5HHVbLsiSG5l20p/050horxNuEc1jVoVVcaEFGQ+zmifkvvgbLCo9bQN/Db3LPAbyT/6dCdg
 W1JZoM+8qGdE/qTqLnESaemp3+NdG0iOUCU+oS2lJ1QGhgOM0Z0rKuj17enfJL3ktCVjbV6LFQ5
 7vVpr4lXLOtCr+U1CA+rvNKWuK9E+7uKWzokBy8kcdicWH6aq0Qf/o4sMbKCRr6xLvxEztUDW2R
 EskIaxoDJsDEynM6aWsDJiLeMkLNA1jZ1ylCYkc8pK4jHAkEZpUQteHp0VwcpT/FAUsXHAfMDF0
 J+2IZ4ULAoGcAqvhDhbegaKpadggGC+OwP/w4r6T8DyqYdguiKQQUp2JEv1NCp6cpMAZseJqFK/
 u1uC1vYLJk8RlEGChtw==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef2951 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: bnK7YhN6eskNeW3bnWZ6fP5UY08AyvzR
X-Proofpoint-ORIG-GUID: bnK7YhN6eskNeW3bnWZ6fP5UY08AyvzR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021601_740465_281BE9A9 
X-CRM114-Status: GOOD (  21.31  )
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


