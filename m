Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE90CC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=fRHylXtNIC5EjwLfy5FtjF7smZ
	dBYx/C+EuAfrcgoVWFCEo3gbcTXgLAVMftb12oSQeNeLdvloo0zYxiZTPyyywZfPoyoncC1FpHY7z
	FV6BGy/Hzdr6aQKyM7XFuf7DCky2wPwUDkapNLCt2wy2g/ILRKhP+rPu0UDd1D0arhywxkuq1/GI9
	fG5F3F7dlc20HFra1Aq/3UXop94wsqEHEGgR/KD2dAUVYkQS03NLgVOp8wCGMbtuWSnOfnHVYsu7W
	kqpR3h14OUccjm0ct9NGewISQKC6QoUffok+GLTFChYAZR8j0MWDEGIxWQ+TQmdtDSiSkuBJk9nYY
	Y2Cev+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvd-0000000Elxb-2QzS;
	Thu, 23 Jul 2026 17:09:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvY-0000000Elvl-3D8k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:09:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvTjA154414
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=kn1hPOoe0KcUbjHa
	+wIOfkQ+gSJv2FonGs3nvAeM9E0OnBoX38UvSiqErEhF3Pi6rZathVDxUyNXgZbU
	XoabpBtiQI3+nn9a6RcrZ4BcZGpgkRMZ1MqwdHtRaEid+oemJ7/j/mr+zFLdYQER
	ZwV8FPJSPFVMt4CSyzOSXmX0KXjK2dj8gbd+1PtEEAnGrmc/NNrWWb3WQ/RjPmUv
	ACIm2bBW7iw9KcdgutioXB0rpuFfDkNvhcKW4zt4XMuZSYsNRFlzC00RFgEE2/jR
	zYp2pxcHk6BdJUqsYSSHpkkJcoOaQAykrQQB7pjzBjd6A2nRRPwyZRXNbO4tTNf+
	eaQajg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b5461w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so23070051cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826583; x=1785431383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=jUea9r0BElJ1OW844fO+K2mixt1S7BR3a1sZz+pha92WpuhGhsgKr5qpkd+QJ0A9Ca
         Go0Vcav1CFEu9LKvS4T5xX3eMs1KG9Y8jc9zZuFusHclGjeU3PxWIV2QUddNsP8flCO3
         CtwDJwIDyfcJxtJDclFoppuVzelb8BPgDtzYE4PszK1pRw+r0yfk0H8XmV6/SZOETJS/
         58m7CIjfYD5sWKN75dAUTLXpDPhczY1eB3r9jXtzoenzK9sIgqp2+iGtF0hKZ3Kn6UXZ
         hP85zFW9i2rJom516XwWQ5l2Vm2L+RNAPn2WLZUOJxgSPlSlg3V1RPQ0W4ULwgN12c7Y
         7MFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826583; x=1785431383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=O9qAkPR+WWnust/3nIJCquikGqeKrCCltjr1qZkpYiU1rQJPDJ8lAzTtZvySQ5drAn
         6XwihI/16cp6mZ6EN7P6HEgXWkgoOKNxZus8GtY18EMEbtvAmtyy/XrOsLQXgf1aKD+r
         qLHaomXUFuK9SzBv+40PWWwSvcOyKpiM8SVJsmohsMHZPawpRhXPt/QseCB+PJiI4Ts2
         N0C8TIMlVNs/5O4CBdgNcwnW1vOhnm/nnEJMeFFwMvje8AkN8XH1TduLqDHEtISHeRcv
         YY8uX3d4S7pUbQKtFrkCDOKccZYNg0/BFhuGENvqbjU3e8q4J3sN89i23+2g1cHgGMNU
         M1MQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWb8kWvYN4SkMB0Azd7AHKzyqw95fFWhBp0VSkS0KXHHeMwVScklf1fj+vxSXpNM1POUxdLJ6LhVBlB7Em6aLz@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2fnuF35PuSCNvUnbDXbCjZ+CVZk1xMmbTUahEQl1HUw8twwdt
	SkRuxR+Id25bDGG4Hrnn3SUskRJFAQDLWjuLEmouEPL+VUhBb+WDlPLCYpJTxtTWdasWSMTyRcd
	f82d87w2JQoMx1iAjWan3KdWQ7OnAZIeva2bm3hpBtVulP5jnqCfLLRUJpnVjgfuM26jbxjMWY7
	cJ3Q==
X-Gm-Gg: AR+sD13IgyDLevGtY8LbBC5vlp8sbbK4hC41VOJqZWXhvPHSRcA+JPEeS5sdOw8Vrgy
	P7u68xHBIvUlOTM5Hsi8B8g1fOBXMoI2GkvjKIgewno0pQ16n7JjzYECm9YP7mFo0GLYxO6qT/n
	LTZ3Bv4GH2FBF1dMY3x7s5QKFW5yC3gmuZmtJ1M3bmNvORk/+ZfZ7ZtxsHCG4S8r8b7eQ/TIqZ7
	POnIUSIvmr53WSem1y24T9WMtJyA3KPmDlJcSCA9g+Zyafnz84K3v2cAY4X+EMct+3VKu7e4W9Y
	mEM4KVMe2W/RvOFEkGlVICY7w/tyfyPD/HJLmgnylJbTS09h07IdtzmuToFLaYXiaaOxtaPabCW
	lUcYmDzDGvOr099nrEF69aARKjdbI
X-Received: by 2002:a05:622a:5c17:b0:51b:7af7:77de with SMTP id d75a77b69052e-5283dda3ebfmr39083111cf.14.1784826583026;
        Thu, 23 Jul 2026 10:09:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5c17:b0:51b:7af7:77de with SMTP id d75a77b69052e-5283dda3ebfmr39082491cf.14.1784826582431;
        Thu, 23 Jul 2026 10:09:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:09 +0200
Subject: [PATCH v24 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-3-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrBvXqR9TZC1tbg8D3QSJWkpFx+AucHs4s7N
 H/zFMiPLRqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKwQAKCRAFnS7L/zaE
 w+cxD/9Vc4yJMbV+XbQUTP6CYYzcaJyhYB+RJkFnIEGSb3RFNPchjtx3OR4fq44eQ68G7WP2/CT
 Yo1PXNdApTIEiJ6wuRcSYmqUHzNGgUg+KiRbdfdkag89Wma1+/pvLtYJ3GMM2nURtrFR5h0MsE0
 p8BZLw93ejhP+gL8rSjEqjmdH1ayehxewGh9QKAneLyk6225eFvO+qu7Dmdj4FLWjxyXN7q7WCp
 nLNxnFhf/t+JH+yInWkzzxIAySxRB0g61mWbkFIxCmlU6HYnek8lOGfh7dIdQnAWaFWTny7QFKr
 yjSzS2Wh6dxxXN4IvXYo55kV+yUpMdERa5z0+zw2Jm7OfZFXrnISL5evJepkVxTEg18/9G8mN2f
 sCrGEXbkmkZo8wrhwtCVBCTRn2MIFDLG7EkqvHZpop2+OidVsTKv3KFxwAVztLJ6T3x7N+obVMc
 uY+bhBU685gyJGijKrwpDxrbao7AU5h3tqJ/T+qjQ3oHEOsW+qb7O5E+txRz9RTYwl1MgMdIRbd
 qF06NvEq9aKoPhge7B/gfmVK4CjoDYMb9w39TJOS+OGVKgHHIw6toyew0X+nGeSM17qoR7GPDrn
 cLlWTfWqwWtcx+h0mjG0WXm4FUVWPYy0UagXxeCaFTdyzXLAPwlxa5WCi6uPU91be5aD0sQy15p
 8BxnhIrzqhRUSaw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX4VY34pqqNpw/
 oQUDb4Lll3IphqD7VXk62ZOC00WD0dbjdbfjg7YjhzkWQqxO4N2lMeOwwdBbI/YFASkIE0uJYfG
 dkPbrf0Njh8SuUJLqp1g8E5XWB+Np7u8IxguTo1khuMtf855nJQrDOMwb4jYdlClx4ir5Fbp9Cr
 0QTY+yXnwr9VgcPFldWAmqoij41X2VIdlDn+kfkNh1PTEGPBlHIOIKJ4ZthYfMYa78OvARdp/+J
 3oQX8trrhz5Xou1dQsgtjsCavHAT59HOejVqKs38vVgcMR4AnXIHoVnQUaCur2RyAM4OhLCdL7T
 hEVJ+kJikU9hK39Kz8fSXhzDLF2bbamLFbwDVlM4cc7ukEbqilj2GQwQUJQ2K92Z5JIHrwcIt2W
 MFJ3hJ1GDFWYU0Ma9IQHbBoOzVgeem5ODmsjfS8xPiFPDlZ/xbq7WwCOJ0v0IlMQvqY9mJiq8ue
 gbXmK3qOu1z0CouBt2Q==
X-Proofpoint-GUID: AZ7TeUIERpZ_im7hIxENmZR_RyTNax4Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX1NqOlHMlwjzr
 Hku2nHxHdaM8LDtg2usJOrccMJ63G+1MXuKU/bnUJs/hHgw/KspA9IUpz3VnCF1sMOJRTeGeqVX
 eXsxdt7LxvdqcVFPinCgIGDdBX3Y7IE=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a624ad8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AZ7TeUIERpZ_im7hIxENmZR_RyTNax4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100944_829183_6855181D 
X-CRM114-Status: GOOD (  21.85  )
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


