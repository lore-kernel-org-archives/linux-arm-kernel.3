Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA85BC44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=koK1SqHKbKVtpLwUpINSVqCW9P
	nojY5KIWAswGA7pcicphbdP0BBVuF1VNmov8LhbrXpkNGIM6JswWqEGX4BjGHMq+2a7jaHKw8V4v1
	BZAwAtvSOeOTpOQlRFIFP71jWr3yif/00GmGEVsxPmfo+/bO9JMlEdGBRkg0pGIVcOocS8J7teurH
	tzfDEPwhoIFhyksLYgPSEzHDPwOedhbp7XV9sL/SJGBFbxtAXwFRf26OEgMncm48CuFXT7gkcGJsp
	vmx9kQ1HuXCR0A6UwkhPItUq3l9WqIBo4LrOAcIXTYDHeTUcWOuqU8Q1+yZ/Ob5NBEnIGAs4XyfGm
	whUPIRKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbb-00000009X4Y-46df;
	Tue, 21 Jul 2026 13:33:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbS-00000009WzL-12sg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:33:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMNAG1544925
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=jQJNAIvHvUB7R3vB
	AGOxMJAYulIc3vYqLX1z1j3Wa+nXzFGTJMtEDIybTzvOKPwH5l7zvpz8xMTEf+SI
	sWUN9OdF4Gr3e1ptzT/WjDyAVsAZ6wPChXwLaXD3jriYJ0Ab2ELdtseZh/L6GIQm
	CFEhNpTITPFEfeDAwy+h6hBLwhnI+6dgBwrDYYHv3x+s80b8g1khJ6pH3pmdj9AF
	f09Y38joVqkHXlk+QiEsaEsne8mqWosoXZ8dbAHSyAk1k6uI83YPGUE2Vpz+d8f9
	2fHhRdFzcI6AMZCqz6JCpeOEVOpjov82Uvpf9e/8btT0hdm11hokvGCUk3hwzkIU
	NeQ+iQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as2yvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso99188681cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640825; x=1785245625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=SdQqKDBPvMmi+BxBNHMvOvmkSc5UM3zDQZqyw25Jns6npewXxOIe185+K+aEAjHXJk
         M4zYVlD8OBJ0hasDoBBYJfLu2UskTn3/0EhFOU/wsap0v2UNNmeqKlHdMG17VgJaHEn1
         nan05cpJSNGWKC8RvLQ7aSny4e/3Ht+qiozZEH7zcv5/vIpktLDdeVaqCjhtYdi1yRHb
         X3Iyumo+OxlXqTqmjiUrfCT7GiVXqkNStZzLA3+j/UabCP27rFqoGmzKp4E1LYaxxCuK
         K2TYHDiIZ7W3zcraDaIbTLgvBX02LoT9HVB/iWYpvbXHbznI8TQRQOiFg4saYkuj5CPi
         zG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640825; x=1785245625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=Fv+56hhcDnRI2bRxhiTmHUcXayb7xeJUweWDqgKNyn8uhnM1pgmOxXf8+m9nv59N0s
         ZBKR4VCpQSnORkwF4JjWcR4z0zSMqg+07BNjWsccLyxlko5gA1hbtHeTL+HIIcPcq0fk
         ffWs7zH0tICOCrbZdYA/jqCcvBcSbCFubl9HDutD51j0UMc0ElLy0JJJbl3FS2+fd7NP
         w0U4pP8txvw0l/jkfpqDYDJK069lvck1x5MyLfkg6AL1GnZ5QuE9Ia9I4a/uoJmmuY9L
         +wRB75YTVwur6MqdHiNXM1oIC/B0ZOYPpvkLBeGNOmBN22Wz24F2p0/dPZpdXyiZ3/KU
         yfVw==
X-Forwarded-Encrypted: i=1; AHgh+RpDIDqdqxUlxBpehG4u7UT+4Gi6TKYpkimF2weLvz/XrbBLC7L5sqju5hvQTJWlQVGTek8OLrdCE6bs8avBVcze@lists.infradead.org
X-Gm-Message-State: AOJu0YwOSfFyAZ8aXzpkOWlvF1hwVQkzP0h65W886Jjtjoxg1sqALhVR
	UbIILLXPuMAtiuLgrHegIw2LsYmUTZezcJ1PCIJv+rTXxx2QB9kRvBWRy1IFXKIXyTH2wzKWP1l
	uxHGfKmYmQNXL/LsS+eHlt6bPfQRY3KRfRqQU1m4TMeosiYcPKc31KAhOHL11P6twxCf7f++p5A
	IVpQ==
X-Gm-Gg: AfdE7cmGkPVxSvldC452Uc5yts6ZVdtlToHRy14EhLdBFVDymzdGgu0qPD/NpaHDKke
	ovO/26zvwV7p3fK3+TR5vqwn1NzELWcm+cUnCI1Zl6d2jPa80b1a+VCGd5GTkVqAqOjblUktIQS
	iGJjzrjy1+fLVdOT5QYbR+Dx0/BiN3K+HO5hTNPfXZ41Guuaf2+CgMW9SaylCWPXQWsfKyJuA/v
	AV/ev3wpwhlObFVwr1Q7ZGEetuvN11lnd3HfPQaRpvgSQ+znOYzf7Z5dg6KCz+jcMoMTNFy60Qw
	iZ4N//khXROESC/cQ4epLt0j/XbK6uyZog1CkSrDz2BL2lpDB7Vl8oA5BnGrjyfmcWvBPIGmLFM
	WR01p1GQdfDu5srBmwP3AugOJVliRIg==
X-Received: by 2002:a05:622a:4008:b0:517:6d82:9aec with SMTP id d75a77b69052e-52138ec2c01mr163913481cf.0.1784640824607;
        Tue, 21 Jul 2026 06:33:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4008:b0:517:6d82:9aec with SMTP id d75a77b69052e-52138ec2c01mr163912961cf.0.1784640823889;
        Tue, 21 Jul 2026 06:33:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:08 +0200
Subject: [PATCH v23 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-3-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UfbWQcFOVE5hNy5ORpDyLVvvPVlbwquV0eO
 UIZtQ4iqweJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91HwAKCRAFnS7L/zaE
 w9VzEACVgd2ByyZhxiiqIrqQ5VRlo7dmVYDYtB+etZcBxcZUXxwbXQkJsT5wyOvMgREkMdqEmJv
 a6zK9M1ajOkxL2P0RjHMmlxUKrJMIXEkPLasXDg7cKAtVkhtDLq+XaH9nEGMtZhU0slVi0J9v/u
 aXLizLyRua8zHDF2qRY/l7DrBa4vjampFpyvAORJyLn/I/44U9ebJwvIt7cIywP/H3bRNmVFrFP
 37PjSkfSxhBj9UyZ3ET7LozvKFCN8sGILU53dptezMXZHIsdSEjCTu0IrUShmz/mPEQcqA+rQSf
 JFoOYkQnhF2hT0riPA0jnFMKX/AlYVveILEWx/0syGzaAQHtPZvGucBvwaJrIuwcaof/xK5qc84
 qeBwJXLnoMuFmFIKmp53gYRYf9e9zvJ4PkoF5CzjUWtwi/AwBGhbdD83zv9mKVI4JBLU+ZLCGZn
 XU/YV1LO6Ojy/GQLvLVBTCCugiMDZsUzcU7IL+miT+j8Vzr3JslwIcZVTxtDbxbRcxIheDxRl6l
 U6J5HgUUSTygLFOkmXZ8Ma5PuV3hUVyWnIR0zo/g2lriNjsVAm1GmYr+otWQTA2s7pZmrCkQa83
 z5GPpoFEv/4OLkJbAige40aX80ytzB1XyGIDPQNPGetlVq6W74B/4I0FFE1HszG+usPq8KEYpJH
 35qR+l4u0wG7Y8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX0pztfGR5xQWn
 DOHZLWM5Bp3MbasCxkiDV0tx8Q3HIzc3E/PPQPgVTrASiKaYssR0g6m2msCnJsYsDcEouLLU85c
 CGD3aZ8UL+JDuv3bjZyItaqvEshw23ZDmE+so+Y8o5PUtTzqLWsP4t1LsZ/tGVVBUfOH6VU1EdJ
 oGkMbFwcSpsmfgkvNU3C4oDJ6lxCmzNui5K1VykKsAXX/S29F20cK8+hwPUHAwrv4m3w1XV3kVY
 mD7whsvYfrpFGjBZO6mMLIPGRyMFo06jR+gCOmKhFj4eQH67NeIZfv48mWkddN2tpn+TmamxWSu
 M0ldelU19dtMSkIbQ0xUZuq3CtJfPeg31MMCSGmYT2ODi4RuMK99aX7HNBCHZ+5/25EuiOSovOj
 d7aQovHr2l791oX9PxnldcIwkHRu64Pv6oTaSfXNQjL0XlZl50o/8Q+CpGHv29chYz9GcUJOdU1
 9zJGUoET4uTTt2jz6BA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX+rMj/Hf/+5mp
 7/QeUizv3Xcl9DE2gIC4mwGMc79Lmvl95mrzfbtnSDysDk9PeOu5WURTEToC1lBLhpeEWR4VmW7
 91TmaT9gOyKphjPYfYUWQCOCa8DAHZI=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f7539 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6kd6yWdqc4TmQC3PqYVmCk4LQwwCg1KR
X-Proofpoint-ORIG-GUID: 6kd6yWdqc4TmQC3PqYVmCk4LQwwCg1KR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063346_304373_37C35882 
X-CRM114-Status: GOOD (  22.17  )
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


