Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF17FD877A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=BGqe/qvkbSaCCXVNG1d/0ajn5W
	rytptyYUPsEQSp9l0v0iXbBkmjXduAEhmoQIYTdYMGFm8xmJlHQpqCSZM/ei5xcdUQRmGMhO9QbLs
	9ZBc/RrLgbopZge9BhC+A9P23hTLzCCR+up+o8Hbne+1zXTtsAGP/lkiFgiMQxCB19sSkOcN+sX0Y
	q1Oyh79Bs9rzQo3AggizjVsu1bUk/KMKKynF38YtKTlF6eUwggjwezGtQjKIEA58wdfFP6dVV/anR
	9aCKAx/tqLkKuvbSGi/1VCe24SxUv9LuQivSMmFc+7/iDOtLpV0QswJP3YiwQbbgS4lnYUj/rhrvw
	+gSurkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0V-00000006UkR-3RFm;
	Tue, 17 Mar 2026 14:02:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0P-00000006Uhv-33Y3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:02:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HD50Mb668966
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=; b=GGg4yN0eygj/0biO
	29VrrpLUm9gihxxqKae7wIMSDGOT/MEq2dTDuGVnQIMilviGHZEY/Xhulqfg+dgX
	jEIqLHZ1FJnKW2QaL8YU422KzoowJWGxcdPsJzu52gG4S7icPxyeVnR3jw3U9ejJ
	dZ12dHOI1oL7GexNZ++Y36G22c6/ruOsBDwhB6NLBZ+MxVtkiP8u4dbcFr6SlhOg
	ZXkZfOi+F1j4PJg63Nb7IFufzFqr1VJwUFBM8jtykFiQiWW9GeK6Cr7KGXHu8cp0
	UxjxEnsYDmpaV177P5cXpNO64RePlH5fZMApIMBGKcvGwtTelb84y+VVDHhFkeOr
	sVgB6w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy7he06v6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5ffa1faa59dso2556504137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756164; x=1774360964; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=U5oX6FOrO7oKRelZcqcC+n1cT8G0PYuP41SNleHMUOU/Qi5J+3ixeKAIIaqlHBMuk6
         LbiINEO2zKAUcfOfLusnCe0k9KXpT+lbARUX/sMbd3NxQram07JjJWn399B1kzPLXeUb
         3IG6jNB9ul/XI7CTGMed2tWdTT+ETeftD1TaALtV7D7m9KYu+07foNbaUdGGW4I85mZ0
         OtUydfeInYo5/IgFlGF1mON3Ho4LFrzeOLIpOx1+GtzhbeV1rhQSf2SYR5ItYA1krTII
         AnC87Q4y2dMa+/nJucafAfEXXPSQ13LvXDqY+/0FQAlw1vc5u/f9lzilgLzeKPRJLArC
         +PyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756164; x=1774360964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YJhp9RjB1CYlks4dixIKSaB1cc2NAImnrh4QNBeenlY=;
        b=jYgTgiljRuGXrHNKH6LpWEI2fPYx+uk5QF/rMyIPadwResHngiugGz9w9VpryW691/
         SsdphiAeDIuQ/6Zk5j/AwHftm9xy9hOIn1/+xCd2sAt5mBdnOsn/hEUKnmVjrVgQ3txs
         c6cHE9BQTpBAQrB/Eihi6bBW3Lq8UtuSq//EHQdSaOH5lCkqn4QTKScqURjD26xw+ktZ
         KSJlKlWQw6IVW8fa1kKugzytph1A5eU56djXiJetSDjtCLShpe/G6qLRGrSN8cioJHbF
         mWRJ8TyPiAPiC+QE7kpV2j3Fl0ioh5D9TdKOcvDtoYxcGEBuk/YWXiF5br9F+Xbcs0vq
         y5Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUyBkQ9+2JE0FPaHK2QDdpk1/q44PenzL6ALT/UxUkJFW5u27Jqs2M/7sQVhQDuXkwXmyngyceUYnHLM7hd2u/e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz97EN4XPm2CPnbdA9dD7bqGmOdQYVFL0mcWQMfWsklx2dv416u
	Axm31qQPVh48MwHdgbn4ZgwU6QOz5FBGBQTIyFQHah42BlfqPzM9t++DZFzWfGYwV8gsUvbbUjt
	zuJ/HLE7Vt9E1MHOiauDwrbETJ3GVYouUoBeM3D2uOwT96oZMEX16RVtno8aOvKrOGDhEMYKiBf
	0RJA==
X-Gm-Gg: ATEYQzwdIn4DHFe/3qPfA03+D258iHiCF10SZg4ZHkXJnhnRTWRbgX+zIa6sI/bEs7M
	53JYnUPB6XoFLcL2aPr9OHmvHDd9jDUzMlCe3guh5YQQScCYGdVZoWbl0HFjwHytaV/Xpc14sj/
	CnGd7/aBkK82+1HnjNTvpvMgpCQ5Ebcwdzwe1aR3Tg+B66nZzoK11iVmJOIct6B1Lvb71JK/ziM
	RcmNBP50PqKvtzLtGYdVsF4lNPjLillWu/TCKkgCVzMXpLMDK3mkHZni/1K7RJFhvUn2FPYy1g4
	L9wkwqVr+sSSD4GEQjc9ECO0IN9AauKdj05pawUKf6+hzweFxHO8DU/7OZNJhu8+5nslWs4/JL2
	YGwlU0+4uimCJ3fOwTmDxSrRaSrSC4NOoOzbd44y4aj28nvsfNmiq
X-Received: by 2002:a05:6102:c53:b0:5f8:e2c7:a3f2 with SMTP id ada2fe7eead31-6020ddf66c5mr6210959137.0.1773756163812;
        Tue, 17 Mar 2026 07:02:43 -0700 (PDT)
X-Received: by 2002:a05:6102:c53:b0:5f8:e2c7:a3f2 with SMTP id ada2fe7eead31-6020ddf66c5mr6210873137.0.1773756163124;
        Tue, 17 Mar 2026 07:02:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:09 +0100
Subject: [PATCH v13 02/12] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-2-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV7xt+LlRYHrokXeVDSyCM0tjcBQD8bv6/GOd
 olQFJHXG9uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable8QAKCRAFnS7L/zaE
 w8MpEACPTAhsCkekQZHg1QpPSF0Hp6XgqVqtwzWYMjkwMgysyX43m7vp/u6PrcV9OFyBo6txlgi
 4/jak2/RK0SPZpwkXbToZyeeMtV7RdlVXCTjbkJRG2coAdboA5DakhVJcZd5j5/06b+FfemLa8u
 vZzbzfGYbAxI1ULsMjDUG5BJ97hajXklbtiC2G4llLEHYJCZcfZ0ytbV0RcRW5fZtTCAmb8Jd3e
 ONOqzTmaquqFo3EwHAxqnh/AXKjMDpLxvB5VOUnL+++Z2VXX1PHJWHwomMnPms/Cpuoz+gCcWcq
 FbwlSzeJaHlrzkofIM+56/gKjJV6zmxS2oLvodUfKctU2SAThffXQ774wopaEG/K7MoPh78G3Ox
 /C89Ic+WLXBg0Vtw+E7KINkmagpERTuVAumxjyS0tz0ZJbRhTWX7x1WJGmmpiRlAcHARQlQfR1U
 uPSI1yrHAS8U4tSqO1+3X/dkddeS51EXN/QxwjDBdaxpwKZUjn8KzRB3ERdW/xJRToUgkAe7k8B
 8kQveXFx248wHSauR4R/2+8erguPWup5Qbk2/61GghdQrjI2LvMIN6rsm1w5oYxHb02rQynKInI
 O65uZni/ha25rrWUV8Xau5ibECKPoepozLIYWXxFZrFBELW+yg8mKfIlA86eGpN/Oct7p6AyvXK
 lzhBXUmnnNyJ75A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: CEzGFz_v29nhG6KkVKfkMRCUl8-m0sCm
X-Proofpoint-ORIG-GUID: CEzGFz_v29nhG6KkVKfkMRCUl8-m0sCm
X-Authority-Analysis: v=2.4 cv=QsVTHFyd c=1 sm=1 tr=0 ts=69b95f04 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfXxCGZSbn+N0S1
 KLkx/NRvcROID7ZnuC4HSWGrB3gXl36TZvsyFky6Lri2MQZnz/U+KdNgH3Im5cmAF5PpzHaO4Gb
 7QbtrQR2nV/Xnl1HO/9koc+BmfzbnwSyUXXfYCZ74vdkhMLxEMDRzO3zbKFSvLnraj7yn7YaaW8
 yXF181EQ27rNcMsBTcCu1gITqw4771CFHoI6eZWy1lriziSzfFJAFkoc0SJvB4oet8hjR8bEbQk
 KFK/sBWF2b2itY76mrpf8XDRTaVTXLp6oxha6zkRnHQwkQu/2ntnXZJMUvV9FVzzVOfyju3dwYL
 dnHVb4tfJNrFiG2sOaIi8nW7ix6ScahDdqNYTlQD8WOVlMnlwm6YISRKoejdIi7gN3d0BQKrvMx
 oohQW/eyZwYCK63u5/wqO4GAYZfPnJFhVTZOXShEDbyW6iYgQh9OQV1ZzOswtDzAnVuPVuF//yJ
 /nTqUV41EdXx5ePaBLw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070245_913790_85C6EF89 
X-CRM114-Status: GOOD (  21.80  )
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


