Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E001AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=ZoDUAruNgegD2eNsZiFq8wgVD7
	bTPv99960ahTGMWVgAdfybXWRIJf//Q4Hl4hiXvw57Amx1mlS5V5JBqaj7sTsuFMTKrL00BVeyFA1
	iwYcAuehqhqDwtoOpCA3BYXpiaV2babfM7AfqLdBbGF/vDwJh+xdDwdscUknv9KOtr6gS/WqdB0Dv
	OR8RlciPR0+GKx3cjfFk+2yqah17PNIY3r4LQjXg3HDwRYTV7RsO0CpuUh/7Enn6v2ff8ylUCockz
	xyvbTRpirqAY/5IKFVb2lPYehQOp4NpLYeVR24SfapDchkplXoZS/AKTfArHfh+PrcqZ3TtlBgtAk
	ryQui8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIA-00000009Hgo-0Xi2;
	Mon, 13 Jul 2026 13:01:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGHx-00000009HPx-1gpQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:01:44 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvdq1494374
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=As319bkHmB2MPCD2
	hVjsqzb/0oNnhssWoqFyIUeaZrYkdhwxn+OQ85KeMoE/K+8tSovvuYCrh/Jrrjo7
	aQpJUhvTmDJsFFFCG+CL80mbt0+G0F+3OY0Ulf3Bq0izs/3L8GU/s1kIVGWjVkU/
	xsOxCeLDTwyUqE8E5fEdEuVyb/6kWLeayDVkudLc1axFCx+dhXQnU9Nwfq0/HEcl
	Y8bUd9y0cXKCli1rBJbsIjdkA98Djd+R9eTNHFY9E2/hUFvlxzrvwp+FTFtQj2Rj
	T2Iv6tueOC/iAwkRoBLfrEa2VmYzy33vVuricBtYNx2GKBVUpfe8Xh4ugw6SROnm
	KwkwXA==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2mhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:36 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5976d74so4537866a34.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947696; x=1784552496; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=F6zzxtcg8WdG4kl+cFzZli9ds2a3wSz2OK9gzj4plCLoEEo/NnMpx+w7MDpKf+td18
         Ib5QjfewZ7rdvErequ3Qqrv4TBuHb94iDxJ7SEn3BbERBSLUU2tYwY1ZabM1Yr1ucsfF
         NS2DlJq5lvkVgENyMG07Qwl2NthO7JvFLKsN6MFkfBwt1KJ5O+ixzdhSNSXupDVNKXA1
         mtdwCmdV+o5NAvZv+BNtqwnaXvwUBscl9fACeBye/1VmlgEaG87UmJP+oQgAFPb18VPP
         jiXqgulIpf7v+XUjltxxoZE7PQdG7oK9dViqLn6dquEFmZulLSaaq2vbGOu7tdrRgd+H
         xt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947696; x=1784552496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=CFQqJx8Er1bLSsTo/3q0FrBE19UPBLGCgvquE/zAN3gyMCBM6qGWMCNhuI8JJQiQFE
         JAprGoLoykQz4VbADwusKvtGR1pU6c5SwVIW7U2KyFe21Rue53k/Jy4s3xxHALRBEAsT
         5C1kSAlvBh/f7rlK3PoSTe9XdkbxKmfYXRMgkjpxE5OkuiqFIZCh/00Mq+Lf+c+hlSB+
         5tx6n+fi4oYYw5Jf8QLpN3sdjBj9cNL/UUl4qozLJXOU10/AqfFQFfqwL4V6Erc2o10n
         wuYoXgjL4vha60RPfGQJvLNNNTo3M/VSB2xGv6EQdClwnucjsmMC1KnMBgCpxUcJ4pFt
         /PGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+hNHyAiyqNmGQP593JFCUMgW/XvEje/vvKCN/whOcrx6+3EsUZyfWrvgmZnIo/nkxhgjBJAwEcG7LmSOK1GNHk@lists.infradead.org
X-Gm-Message-State: AOJu0YzGtvg2QdCPxOyelamVLd95S1rqJZansUhg0mw2yvczmMxHIovs
	xqVWo6hGBbOPjnrByeIJdDTBTXiz74PJD+3SRevl1DhOikVXE20rlMIoIz7dSRYHGU5MlUocniN
	ORIMyyhQqNoXBw/zVGxbd/q44lzcfAZFttbx/4hg19bm3Z/dJBYp4fq9kfmp53ZT8YBR2NpFSIV
	a99Q==
X-Gm-Gg: AfdE7cnNsy90VTD861PJ7oQ8f+z/oLUoQjhIYBAiv//UpBu9FrAoNV5wurtUUB0ZtgK
	YDEKkid2Tbqt53U9geL9kpuzRN+54h28VVnPrap7ODNjKXCW4cNddDE3V0Z41FeTqilo29eJy5P
	BVqUVjNsXvIgkXzIDDL0jGh62tdy0grwctNehWNLndIQw7xbRMtH2E/+rykghC5/bCQ+jjjG6nX
	nMacdYAEhT4JodhrMjqqgCU2XlfiT6Dw3oSxTm41Yp0lsClFXRkw1kqW7ELP12K+RboKBNOBzNK
	bqWrmQfNPxC2qdN3xZwbjAVA7ELiKD0Z2eqQTzKFU3KSp5TkfIDn/opJyPT7C5yOYPEORjzwVxl
	Ak8cIuVp0gw/s9+j577R/i1QMIxdz4JHJBGH49W2/
X-Received: by 2002:a05:6820:2081:b0:6a3:955b:846e with SMTP id 006d021491bc7-6a39a6e469dmr5625859eaf.34.1783947695789;
        Mon, 13 Jul 2026 06:01:35 -0700 (PDT)
X-Received: by 2002:a05:6820:2081:b0:6a3:955b:846e with SMTP id 006d021491bc7-6a39a6e469dmr5625784eaf.34.1783947695041;
        Mon, 13 Jul 2026 06:01:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:04 +0200
Subject: [PATCH v21 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-3-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGX/Y8gCg+vNlb9b8QC+y2NfOdxPRPOTVCmq
 xAw/gdxeH6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThlwAKCRAFnS7L/zaE
 wxhED/4n1veWAxQWpeJS2JF4WMRXE7Qvtg/6vxq21gYhDGmSsHSQgS2lLYK0DMGm3oqm2Ft3zsf
 sZQtzaxhO1DLE79xiBvNcVoZ7R61pPwrxOisq7pviB95rRCoxwmUXppCWgpQTTnAdMQ3ubwLAKZ
 uGHGu0lUlsSPutnLVQEqCrF4Y3/j0wm9Bc4WCw3+YU5tYXUr8LYkxzF4lGwOqK1igDU9xGxC2vT
 nh5+aKVbKrDN7kOLGFRXwf5TnvqK7JsecA3krD/0SOuKTrV1sHI2tnDhm2/VEc/JeYBokhT3U9h
 Uph0Nh6JK6419lTFFTBt65ASG77FNh1NfPs8gIeCi4VGAZVtkJHOyGsafxbFWz5EJ6sZhGjmQWM
 A0ijR2UslRW8F8q65YwAggdfUKLCPnZBMmMBi9FgxpJvzccZvK7bwnbI/tEcGQOxu0xXOsny/o/
 62SJZxyiSKAJmZ0ki3ku+nmOKed2WhouprsvaIYUslRMsUj+BiD/JQ6lczGOyw/1PRYwqXFomlF
 gWxQnJMPfFwtGRssFRfGtlcopFYECP2rHBuYi9eqohJ6xvDzFD+h/M61zMmqIUdoLijMLLmFaeS
 XcNPtsA148e2Ij3mjmX/uC0Xf/wqcEjBdAzRs8VkI9Fgs6QXrOGA3JadnwSaX4B/r/ts3Xq/PMc
 Wz2+SMMC9BOM69Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: WLtTOXhdkdEJZfV2Zr3PwHl5HG64QiRz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX+FfDA2l1/q2l
 Wgz0BTN3fseOtAvfUFk9WJi20EY+6sY5oG3Gl7Kd1+EpnGZkjR66Gj8IjQPYfQeGfr0cWOvFGqh
 7M5TkhC/2SbNNyjmaS3WpCQWdoxa+4vZ2rilu3pq9pTmzVy4OgLxtkWOyJQLh5vCyCwV/h9/FEe
 KB4bYlLw4Db8OLgnMidaM6/JRflqcgyAAMnaeL3H2TxvjTloH7ArW5Jrd5PQx6tS0ZkNCBbeFde
 QDqS2TPWwK+aQ0fIwk0MLXQGWw2DvguQbcG7iWBbIE09UUBq3jiKCDzIxjL59Kkqq3L9ucrBX1j
 J6nHFD7M8xW1b4NmYurWqdJaI6FsQJxYC9UMZ/KssOKsLIWbgktNlBU0ZeHpKZvj7pvwX+/XVPA
 vCk/qURGKASxRdns18v3wuC/eoLiYTOz1ITapsLRZeJ5p1NoFUyRj6Duf1srDDhrpUDH7gTZxWo
 iCDg+Jb6O94Yya6cbIA==
X-Proofpoint-GUID: WLtTOXhdkdEJZfV2Zr3PwHl5HG64QiRz
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54e1b0 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXzzvt6YZ2FnWx
 czsZjCKuYJW7oaopxzi/R51r8ijA+MB9aPhNk4wsHZaqp2kQDfCu+9ZJ8LtJN+KQYBHNj7Hlppd
 YUo4wyoZJFsQLTM51QxVCcH6pXoUh3o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060137_502095_72789443 
X-CRM114-Status: GOOD (  22.11  )
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


