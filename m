Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73098CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=; b=nIcC2PXlstZB0EhSMX2qX8py4U
	OPmW3bkKvVjltKdQNiIdQwhyGoI9v6fpB7o0BqAWCHGBdxkCa2xBSBfam0muEQ6Jw9Y+PEiW6HG0z
	jkxL46RscEztowLBxrLaw8v8xx4Hp2EybE4gEkJ76R9OIgUdgqO4P84UaQtZEP7FqCg8rJvITtpL9
	y6AWMMMQxtVfSsjMsfRJuB9xH6pdxudqCRy9j2i1/eXtlwaCY72chG3Q5tVfzD/d/8AETJNQK35ef
	AE7nUsBFavMKkBkk+tS+l82SSfO6HAs2bClsntwDWpGJPxfq2Q5lcV8WNeTSucizlvg71s2waE77x
	1Y8xMSog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZI-000000020uJ-2Orf;
	Tue, 26 May 2026 13:11:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZ9-000000020pl-1E8U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsZRq2496686
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=; b=RIGObwRvQEsIuu83
	TIxVHDCq+f3ZVlf6oD4onWTVPk2xx6xqVLaLMWqTXdxrB+C1v0e0Okp8CYssmaMP
	e/LHB1CkaLP+kLn2q7WHFiYWwf6yZhbgHBQiPH97zS4dfiQdSPwQvjxA989qWPKT
	nC9FtJXPuQ+RnoDPcKgiRjMub+pmYPDRZr31yt/pzCKIeZEhnfXoCbEDf9UT8TPD
	Sd29FPdXAWqa0lKn1smUNPcinw3aDFXJIHNUGkfkcdVLXm5EBu7UExZORHu/XttT
	RD04vUyWanphDh8aF+dZI8rtjnNDGAft+GhmcKnD+sh6V8ap5QyfV8uzT0vGzZVO
	wLdK+g==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpyqmd95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:26 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43b68fd3474so1980123fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801085; x=1780405885; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=;
        b=D04+Pfn/2PRpaEQAQTwplrIrV0QRkb+vUF4JzOjxvnG83J8csjHvpdav5LMi5fzj1t
         2FAgl6m/DDSA8g+Oxts+djN29d59sQFVq9sVOGbGfl2taFD/OhCr7bTSGjz/3fZk6oOr
         uWFJ13J6lzT64Nsh3i1r407Vs/o/jZc3POuZXim9VfVnpnvcDBXTBQJoPNpq+y1GuoJZ
         DchmlUehbnUag/yyEXNT9eQNSchKomOK4HARY9HffNvKYKCnIQEU0fldZQ2l1fhvmHkr
         vb20IqbrdMh+f6B5nY7GKJZPMc6sJTF194u4SbKajWI1SeU9qFUJpMJJlp+CRytCfDJ9
         y4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801085; x=1780405885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tEzaODDzYECg7HtqD+MDkUrvvRFJmjC1+RPt1k/O9MY=;
        b=GPWEkoP6Q+I5dTbjigjyEaughuh0ydIRFbQFsabuCPT9Hi+UYhqVPq0/SFQqzab36R
         PsRiGs3GQzyBxzcroz/uKJAs5IShzbxmVCEuwsSqS6d4cYIJPJOc9D+IF9NOcFdImkCe
         BGQHCMakZsrD4JfyYLTucObhcvcTGhR3hJmOuVIZZdyYUF/UFnVJNLliQ9ZLqfAhhaph
         7RpaEYO8wO0kXsLvfGrWVOVB1hl/P8pYmHO2nA7wlKI1IAoQrhbue3kNH4NKR838k6XK
         Mz+pHOW3DZbaMuuNxT4o3GWVWRXOu3tnIR6Ebi1fNIzfG6DLPimFK7roibDKQKRgTjVO
         7yZw==
X-Forwarded-Encrypted: i=1; AFNElJ+7RflpBr1ljuk8Rk/W7L9y4o4TFRsg36TScza/11jgA+6rFaws42WbPfV8lDJQx+5p0bAQUellJW+pNaQu0Fg3@lists.infradead.org
X-Gm-Message-State: AOJu0YxcpwrazgBnJNyjxdKJEXgtCf9sQVeH8MPttLSrLSWs2syC3qhI
	3f0y9H0nR9W389eMy5zoKy4iN9J9lnRLk2mQEGRSePBSG6QB4lXveq1x1Gxydh3CDA8YHtV22Rg
	lqzfCXt0t5nxh+m+mK8lthOYqX0zl/w+nMnhTao87LAsxiazwQUlKk3Ksz2vpyLdIBjc6l74wp7
	SSEg==
X-Gm-Gg: Acq92OFgwOhuNClZIRXsa9UvRD3VvHpeBnOTMCyTqrWRAn7PVrRRF63D8Qc9pkHQ5Xm
	d6jSa5nnFKLmaaIh6H/lEyEAGdls23zp+3jS79B4ih8DbLa6TYwbJsIxsGQo2B9pxzeKsVXRRJf
	I/SRMVuvY12qfOcjED9vYZ51KNxbhJfUlaDGkMVIFF2ryEzaha6VgFDUYMfTMPbGc9mEHM4xfCR
	y5l1KCJVDZiCjc/4MlrNHeaZFcEp4yws3I2aWvDAzFubPsxhjMy0BHSKluaaEtpdDWlZh+UvDcP
	DkRpgyf9vofTyu6RcLq2v8P5foU+pnYEJ0nHSRL2Urh3Ffa8h326tUjP36cC0s2+opvyPUMQKVi
	bmN/HstgtuN61VuMt7UwIsgZR+Ww20DkEwiqecRHKjj7XLla9PSg=
X-Received: by 2002:a05:6808:1a0d:b0:482:4dbd:4fe2 with SMTP id 5614622812f47-48549edd3d3mr10664331b6e.15.1779801085510;
        Tue, 26 May 2026 06:11:25 -0700 (PDT)
X-Received: by 2002:a05:6808:1a0d:b0:482:4dbd:4fe2 with SMTP id 5614622812f47-48549edd3d3mr10664275b6e.15.1779801084959;
        Tue, 26 May 2026 06:11:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:51 +0200
Subject: [PATCH v19 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-3-08472fdcbf4a@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8kt/r9HrIy2XInrbgvfr96jusMTBkm3qidl31H1ffz8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvqAr/c+zOJnBlNFR6ajuIeqQEySV5XeIfMv
 uCGrvzCJgmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb6gAKCRAFnS7L/zaE
 w7mQEACvAXElwu/GR7rmlovyB3QgxwBOCO6PIzDULjvU9h+onJCDdyJP9XK4gBgRgLoDKQ30ktU
 ewZlA+VfBMfD5wN7K5C6ogMpdw0PvFuBoYPL+vMkL/fy/L7fI7upSqy+W0TdMwFbr229q3u6C6P
 PBuuUGlkCOXhy9EGGx0p/TwOc6eNnYKbyIUHtJebx/Z1c/JDMoNUYaFqPVUxIr/Qb8YjYzP4bwb
 CAjf6MZf/8GYrmj61MRYVaqM/u5Cb3/VR1NNYLxzEhgVLTwz9sfm4kgIusmrxfhKxYjPbcsRO1Y
 /hQcZ4rpJZkPiA3noFslaF8NPJGkH+6pZyFgjpKOtjwFgT0/MZ3snJt9VX74ca1QfJRObgezzuL
 Kts7U/NauCGTBhNKJbTAazHYuzoPpFKXuN4Rl+nCR9dUDTo3c6YaCq2Po3+c2u1CdUmlBvo2Wzj
 6+MneWI6OxTwlBdz65ssOha/7lSNyrfUot78zsVGHDViCGRx4YS1twZlcCiWVvFRxxpqzvYwE9U
 0TzGQMjhcjxSRtdSm2hTUVOF8G6KkDPn3zznJ/B0RWWEtUndeAL+qhrUEcQCGwCN3NxeGLPDZL5
 RQhL7c38eXnTKKDY4ktYEcvSCPX91lrxf/UIo8qO3QH4RObfmFmKQMUYA+g73bEU4XFKBU+6zIa
 mL86zae3L8y7ozQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a159bfe cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: hlxuBVFYjX9YPhazxJmy57hr6HD5KtbO
X-Proofpoint-ORIG-GUID: hlxuBVFYjX9YPhazxJmy57hr6HD5KtbO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX9twoMApC+OSx
 FMZxOt4yiTyM5szXodj0TLqtaORyeBybyIdY8xIeyMAaA2hUGgjt5ysAGcsF98bsGQQKlTYF7J+
 IuLuyEz75iLwqfm63itaJAZ4ipdob7YrUX8d2CM52RyzZvwYYhhxB4ANvTGl2JyUODjWChhDeWN
 pFU0bMSP0iJ8/3IM4k0vMHpvf4EjwtL8Xpm1MtpmeUYX6dwwdbxG1Ciuc+fD03nQSUsTLD2Zu2t
 feFqpnKfylL3zFCeM9dUPnBnGwtsYbHLBdpk+tdrfGNNyXycgTFLdEK3WqXAzlNLPQRMewElcbR
 MacsfhH7XtmyWJweo7Qt6+h4yw8FN+R9mLBqUyaSQ/fHPU8pkpGTVAaXImpbj9UU9qaf+9/zzkD
 fuly7t8tm2Z6PiBJh5Dz7EbT5C3bUbJ5BjqtmgCBy3me6gUpY756GIquZulZTtQ9fvwnSarhxhU
 3Moo1P31s9UkaI3hueQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061127_351125_B5117A26 
X-CRM114-Status: GOOD (  22.22  )
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


