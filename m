Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDB7CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=; b=tlBCY9l4FrAWD0kGoRZUw4NlnY
	TBQGM0f3MW+L0De8Du+VGiGw9BfaukUm78yFfhTM1MHNquL4zPwA9iJMinATfnUvp596cXXFcIbzc
	6l8vfEsdvo2FK4k/KgAgzA6O79rmtJHNWK/ADLRhTpVNWcJ7uwN0y93hbDh7Vv06A6zZpLOZ/caja
	/MuAtCGg/JXmNzH0fiSOp71VAvikQj8aEIg4KoFW/kfcBOXZQDpCiCm3dvHWAVPSrRF2HrP5Sb/Mf
	BNYFLlN2XJIJu6Q+Y23rWtXhnln3T4L9SRuBMge1hxkauIaXIHtC7nQnadIMNx3ligU9DEXGwiEH5
	sh91w2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ74-0000000B0fa-2pb2;
	Fri, 22 May 2026 13:40:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ70-0000000B0cf-13ze
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9p1MP312901
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=; b=No6M8RjpytrH+Ej8
	nPxPuBMdxzhYY6j3kJxMz9Qs6FkM1YzdFcOha7sPXPST+aN9pMfAxzn4XjhhKYtv
	tCf5WeivKclkFUQBlZepbztZ0otTM9+ZGcTgGzS0EOPRfPgDva4cUg5o//zTunfV
	2CADJzvneru1kpFX2jINryf+HPy3PvlSFYuQdOaFS3M/lE5uel88UmBoYsH6xo1H
	H68qlK+MkmWqpUGqDaTsRxOZQmA9wFs5Kc6pZ7uomo/I/0nuIcqLXyBiV7tFFqBh
	sAIsmGFSnI9OJOb5n8FTdaG7dN9NyAlP2yWWHT8oAKRHjmzHRWHw55tT3tTxJNxs
	xarMEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea883411r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d19f68acso26870731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457225; x=1780062025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=;
        b=TRAWHTZj3OAnOpCV8g4RVWlCpBv0EIzED22Q/8yRaOKid0LrfnNe73gl/GbCKzkSa2
         AgKQTLH1wNAz+i+vc0GIjlICYtFH7rnmjxZZaNFQjEBmMK05sHTw3I6+KNVkxkyPVo/H
         U3HQNWzBMaIU0Zxb7R23q/eNE+MNxMlaF82sBsS0SfqYrjKl4vpwoCxXhJfeRy4GFlYT
         GEDObjEZuyZ4cyJiEQQrtytXFFwh8O2dEP6B1Gs95bvNPFjbBYZDF9lIfUfrtpspP8Hu
         VzaVLtBnxN4Lqo/HgEIYl71/yBvFOlk69KICh6lWUCJuceSjEzoeje1gXdBfYvwgfr0H
         ArgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457225; x=1780062025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=;
        b=G8CAX8GNQFIWamkCfjGGB3LjX1BwZT8shdelb+M2CrfPiv3taaG6VcQs1/g0aVrEw+
         Yfb5GlX4xoRG6REGsyYwuH4jOI/E2HYNkvNNmd20fp4DNDBs1vkrShNeNaPC+VWVQVae
         1Pube/JxRISwydHAY3rllkg9HCw4TJzitqXzE7tF7+SUz7+nun6GXh3V9sdOtpx/RxCa
         h8r0cY4smUDAFa21SriYV0FtVl1yqDmwQH/atkz2O02qvid/nKpSlSREJi2G0Y4O343A
         8hTveGRmxdQ+il2fmTRROZCCN3MDLb0A/1xLdLSnyZK+QAZuvdT0ByP7Hpr9eUVTCh/d
         G1FQ==
X-Forwarded-Encrypted: i=1; AFNElJ+gRKlfUk52VyCQKLpkpPfSjfNm03kaqt2HG0A8M61Vo/tBPxDwpaJc+ekvgjRIOrb93XHXzmoq9hMC8AdudLmH@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ2AkP5STfC9SUamQ9nmGHwcyyfBzVsQaF+pYxo2rjlVVo6RJA
	5F8U/gcD6gVAQvyvg/gMq+HVIf+vb5FwpDGr7IY+x9obZxPiv3Qp6nDx9BwK3DRxVmK3Tyi1xWz
	JWvY+bV4blK8BfoqUb+sLHohS0EyxjYwm9xv+gvNQnZzFVwH/xfoEi2gf7K5NPhq4NDqwea6jFU
	DJyg==
X-Gm-Gg: Acq92OFXpVXJ6sr/zaIvgOymdM9HLr2FIFtW44bwDlZLq29YXgE4uYPLZgueKYj1+zX
	zhgtEtLnO7bVqp4uqck91C0+kEelzoZEOhVooxYXvggeQ2XIg0ry8eOKLA+gQ9bcWZ7DQVrRJhi
	P7OvW21kkt2F1SGyjsGkuQHqp8M1CuC3SY+cZ2eyglRyP8WUcE9mhB7FBkcxzgnSbm/b00BgJNC
	2GJG4uKBQRxEN6Qdxljshh97ZdmA5zuSVXXouEg9D/zOVq/16BwV53WWoZxvnlRQF4UzjRpz12w
	uTWF2OCW15LQTVpjwxp5/mGPO9Yp6dzoFhD016JdyRFFO0hS4rZa2Nt0BQyXNcjMiVKtgq8K2oW
	tV/1f1ORca4GZWuPhZiof9ACxJNRcQX42qVW4lFzj6R+3sYlu7Q==
X-Received: by 2002:ac8:59c8:0:b0:516:d1c9:8c63 with SMTP id d75a77b69052e-516d419a58dmr55277601cf.0.1779457224547;
        Fri, 22 May 2026 06:40:24 -0700 (PDT)
X-Received: by 2002:ac8:59c8:0:b0:516:d1c9:8c63 with SMTP id d75a77b69052e-516d419a58dmr55276951cf.0.1779457224043;
        Fri, 22 May 2026 06:40:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:39:56 +0200
Subject: [PATCH v18 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-3-99103926bafc@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8kt/r9HrIy2XInrbgvfr96jusMTBkm3qidl31H1ffz8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy0QgoalJd4nsv+KyNxeRwnVz7T7emmA0iAn
 w+bq7A/yZqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBctAAKCRAFnS7L/zaE
 w8mtEACcAKWhiKNBPOKaDaJWsMVeL5dSBaURqzzIgwKoPMxvuoftrlvuBf9efXzi/pqWbtaH27k
 zaZ2VYgftBIn3qooLBaL0NYAUIEL0rkJBjRJo8M+OrFTJMRa/zt4/8EMlssPdQ42Z6O9IuYvqXB
 ltpqe+k1ySWpH8rH/jqUymODykLOR+Vh42x0oxLXw0eKowTJCVaLgza1j1In+LZE1gisl3EuPeF
 kX0WWm99riJ5ldQGaKd7GF+DKVF15LNhbVMhQU/wJdzkajj28R7ZppWrDj9HE6UJRUUs1MiFJPG
 uHVZDNMB/GaQ4W0ZGae1S2Lv36kurmV0NGASA1lzZmw3/n9xnNywj/Xc7WqYQ0aAyyuBbIWFG8m
 z4A/vK2REBIoVkpStuaxEV0fV0omG+8va5zkFTPuOaZT/Q/g9SEs4Bo/atbQE6YvngQJx8P+0QY
 Mg7WaYS0gSIHxj7rlXGXWNG8mgA2w/taXG4P/bRXYcDXeWIgTurtwBY6UIq4Tb/YeRn7xxHqvCV
 v9ZBIadNbVG0A2yw+TTYB82HBOPlZKQOnDjG+g6Y76jg0l9df0lzUuDyLLoq2eBHz9+Z+KsKxcl
 B9+cO0gPpUZSV7V7fz83npdvNUp0ZCQo8BrNQiu3DMAhWI8ssB2KQ+SO/69U2QVphTM6bIGp3Ia
 ArAwsHajuC1N1YQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX0cxiNtaFkYMT
 NOQIJdvg6SCTj2rZ5YiXuAaCANflfQHjsomD+745G4DfAIQPgOuiIc6D4Gh5uqkDZNTThYEfgE7
 dhgIlcmbEMiZBmmgKuemQsvTesvmYHie2TMqOLM0HPHbrVZ8TgaX6Eiu7q9JSLCpRARSHeaCYC9
 dmJNqso/+pZ7rl97v91GSUlpKsdk5jGBIF7PV+NvFVzmzd+Xdwg4Sw9ieHzX08P3/bsIQaaT+BH
 zmIngbrKLCXme11xsInpGQsEJYNiOqoQNYuTLaiWzrckvL+tyvrGpJZLDsAMNlOdFDfHGGGNDzM
 NVTaa5CLf8nLc30Na1Yxo4aESb3EVHKqJC5d5UmRi4UGK+5XQrSHq5+1AugiDAG7+ROnXALn/9I
 oIR4alSoWA8zNORJYNlW4P+tRG1duwvk1DMsP+r324mxEtdSk8pcwfesSzV5XUc7MevyFeuBBZ7
 PhwjBYgNRzMRMvq/Lxw==
X-Proofpoint-GUID: i5m3ChwZYWeB5gX55WkEPf6KA3fhS349
X-Proofpoint-ORIG-GUID: i5m3ChwZYWeB5gX55WkEPf6KA3fhS349
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a105cc9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064026_419979_C8640A3E 
X-CRM114-Status: GOOD (  22.01  )
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
index b3d36ea79984385fe0d05ce56042d3e6e3030c5a..1c62f845ac0b956e311857b93f5b504086662f45 100644
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


