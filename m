Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08AEC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=haX8T6ux93mtpL1JjFUgbQw69+
	Kl68tWE2EA+RnyhuDVFX60ZyaUjc141vcYaXWJ0rzQ9JAK1pKs3T3lDgnaqXklFTcuq4JD7K7s+Se
	fpuiGxx75i/iIWTeZECkqnlfkzvHUs3SbuaXzvOgQYEjC6ZkwbkY2Dp9cf//YWG/tVGnKVH65cQv9
	NM0i7Oq+5MFuXyXeoEMerMk/pYVzQ+x4Tx0982MkChdrlusD9XioTRf+gYeY0KgdIuV0PTeB4igVt
	6M78p7te1mCF1LrUBDXGGHWemH07gtEJKKB87dKLM34SEiPXCQqPaE12tDHEXzduOf092PqcEZvKb
	QDn6RQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke48-00000001foB-1TSO;
	Fri, 17 Jul 2026 08:37:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke44-00000001fm7-0alH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6chfq1093033
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=; b=Gg2fIu34xbbfj8OA
	dt19v0TaKmCyNsqs1YXGX7b6eNdZXjJpyQTH3J+wxRO0uaqueezvw2w+9RN66Hv6
	W0l5WJiq4/+Fc/Gw0EeECDxVVZgNAfn9qlvmITGH1WSo1zC/V8KGQZePH7QP+Euc
	PoQDNM+uejTuTxKAutrzpDyZv6hp5x+3VipDRd+ZtPDOa3GFHhTGE2OHu8jNSBcz
	JqqY9Q4b/HSpOXmyilpPDlLW/H1jKCMSPKi3hOjhBoYcJTFISAqnXQYKCzpR1apb
	pc23HN9Z0je2WjjX8uoaCCthsOwq2yUPfD70OOcnE188xLMx2j9bhgIUTNbjHo9w
	7x4KhQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urrpf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:36:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8b0a08d2so110555051cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277418; x=1784882218; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=fFBvns1erNtiUug0TP7sKWOUSz0Gxq27/HOW35ZX5aH8IfcpzqiZ4Bq0BW7dpTBNw2
         ueP2bRxuQnVHvDEFrCQr9+QKRuFLDDFIGmafa5Z/Rd547iH0kAQz+ONyhZMn436elM0w
         5jU3O3BvXpxGhreCXiBfZV6tYaRf60yQXNDkeK7cLbCvBi9eUwB1OCCHrVnFWfl1Sha+
         AX0taEXC6OgzOTjli4Stnh4pQPpFBpRahsiNF/cNWzdl8nXr2g8Tnfi05vOyGIP76NPM
         CmCu96vmAu1sc3ny+aZ3tPnbAAdwRcsKPpDIAaVKpACeJ3wp7aEhBqXhqn2ECeSTdX8e
         e2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277418; x=1784882218;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EisVJTTfRpbffhmQLHO5RqC6wDH0dg02BTw4k+UhwPA=;
        b=XJCUsL1cLfNs/6z6B195Wox3g2S96F2SPW3CtRIwHXla1fW7uDvUViIOObN5FizdbO
         AcExajMh96RypmIqvb7LgnlTdKA+MhshvAsEuyLZSMXcbvlOKYhV83PCDtLP7gXjNu5H
         iaNvH3ZrqMUoU9aUxWfTTAdCG8ff2sGR8w4XDsNMOA+Cl6v4Ug9aEE6vyt+vGoRo0/TS
         G3B7OAuV1bOUvAc0nfP5Odw+bgTPCe/LgK98KTHc7ShlInobV86zVI0OUs/RLY2VA/Bv
         FvXExD0ms8zzxLGsrfVk9rwJyK4QOltU3Wmv/RZoFjQAKufQdOtA9r5HeG9sj/ts9zCQ
         oyGA==
X-Forwarded-Encrypted: i=1; AHgh+RqMBrBOPQlBZxyNxLs4jmNaLV9W73OMTK2tZfhufBI9CL8iOwYrDdBY6eO5FfnT3FaL/bcg0nARCF26xIbEwAzb@lists.infradead.org
X-Gm-Message-State: AOJu0YzKZQOBCq0M8TZ/kqRxn5bKBn4RxtKhFGluMiI5RexqirxysTHF
	XwSuJ4i9/iLBf3mIyTwkrpBLUeU/+WIIcu0FGg5DrSArHleT+6qTgJe55RKrvkvo/q3URiRTDVz
	Npt6Pxx+ZDuEFGNaHkMfOmeP3sYJ9QCOzZxAX64V/jo4sWK2gTpH2QpJER/5GpAiUedlAU7hKip
	PZWw==
X-Gm-Gg: AfdE7cmoBxwoZDO4A9L/Wvyk4tA81j3rRd2SJfMYHCokkuk2+FH/GIiDkRB2FudFDA8
	NeC6zRBs7sQ6Et+dVa3Z/dkUx6eFY7nrpM8xKXWufS5pHl8Z56CZ4oX3eAib17y95Q0Qewehg2Z
	BgkfFGUqWRaISpdQzqyuI/CDdjJWta/ZH04gy3WtW8XGYmG/XDGKOCmXg2hrg/0Skh57MMxqcpG
	CKjEqOZ9gMQyX2nXmqt4A8y76fVuO8sF7FTHYigGTQ5SOxAwWZDHNCRdCIF/FOxTGGMg96PW5Nh
	KP+nimqLGNEdEaHe4bLKZAgA3aYetkvTtnSpVwA/DjyxmXRcrAxsxaPAdAXZqEnSXVRaKVdOAHA
	vi5ffWetqbp0JROHOoP6Y1ZknNMkPYg==
X-Received: by 2002:ac8:5895:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-5213f07a839mr12223931cf.85.1784277418452;
        Fri, 17 Jul 2026 01:36:58 -0700 (PDT)
X-Received: by 2002:ac8:5895:0:b0:51c:7b13:62ff with SMTP id d75a77b69052e-5213f07a839mr12223541cf.85.1784277418071;
        Fri, 17 Jul 2026 01:36:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:36:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:29 +0200
Subject: [PATCH v22 03/14] dmaengine: qcom: bam_dma: convert tasklet to a
 BH workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-3-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemXqINjgp7q9Ps4aTCpU63x396zfX76ER0nL
 PEUXHbq54yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnplwAKCRAFnS7L/zaE
 w4BYEACodtihodcjAOmf4SQNdnKJj1MDtzmr8CduDo0LVP5xpzBN4cW+Iryn04rrnH/7NLN7Dnc
 THDrA9/smhqXo3ox4l7Sp3oqC4KiMfPnwM/SkUsLtAmc4l96ePvFCy9VecYiEUjDIvcJ41wNSPV
 e56uyXLkW1JFg9xhYlmjehYbNr2eIYdC3VE9IlbCaqAjL7QkFiJQEmMQwCzQ3SlaN3l/k/s4t4K
 xAhwMLFuZUyF8Xljr7e/f2PUzgVeW0iY6mfvSB2w76fAzAsIS+L5pqfg7uTM4N3wV5DaOAXldVY
 ch9TkWQEau4Enf/FhO8Y+ZDA88mCgKa84UPTwPhtYDruA9jyEcOLJyrf0z1xWPSKSDvhyxq6q1P
 tdBbDWh/zNVJ1ug7/WdopaVLyYI8dihiP5SQpXLwRcaNVonJPPB+QP/INL6Ov+yXqTyZ3iVOclX
 a4fSVoqeUgShbEWjqTLIZMD3V+YpQJ7b9gkXjV9izBrjaXkpVljZzC174JGiAszUqWPMST7fT5A
 1CXdtM2l+1MiOBlMUFjYLXm2f2Jse3/jFpQ/deP+gji2eqJsqlSYJopJFGmX9B9KrS692ZTs4gi
 mv1HBdmH+Fl1lV8BZhUbxZJ3gwyDuoA4CkNIY9zbtOABg4YD3XSP0JVCGB5/v7VesiSU+ph/tzR
 x5FsRWwlnTOMvBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59e9ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=u-biHsxzOdRIXVMzAPsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXwcX+3CkdBa9W
 Fz1mkQ+QmmdD5OJxWJTBToP5XkBKe7d9lBZ7ehCxBqoF6GmiRMq50pVY/ZNgffyUSPNBoICCZOG
 Rx6upfNdg7G1ygJMYBoqzJJrNwkwahd4uLG6yD7EkTD2mEwC+2qDIMDOB+MKQAKq/9f2+/FBz25
 1IAXhv4zcPUmSdg9lBQ0etxD6u7bJ7RCOlHRf1oeY4a1jeFcF4Wm7+hwxGDCaM4nrTMnfXWYpJl
 tb1cAS36HhM+l2rZGF0C2HHgeAhwQ6o7Az8Yoss1VBaaqLbSg5RIujssDm02x35zJ3gfMfjq7Dz
 ViN77qUcLBG+IP4PnfQ/AFfJKD6/EuBouTQwtK7LpOgnm1OJ1NiWVpNwNSlYZbhXDQ8WW7tdbjs
 ooUAqTp3fJZAjaDio4pYq0/E6L6clJKPUx3QAaGoA48G6ekn9cAMHc4HPZd50d7jBm4K2EYk1QN
 KVMBRLJVVyMOwMcGhOQ==
X-Proofpoint-ORIG-GUID: NUGXnQv8I50Dyv1k-PCoQi4PirRuEpvv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX5xnA4xBqSbNm
 yWDysUEPUhHCI8Hc8mF7gTwF38thDBOwhrePsFO5I59JU+49/wq0avfgIUttZGh2707u8/ICFHH
 gex+RGFZE0duUeeiU/eQwOW3dhhVXY0=
X-Proofpoint-GUID: NUGXnQv8I50Dyv1k-PCoQi4PirRuEpvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013700_307365_582E397E 
X-CRM114-Status: GOOD (  20.97  )
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


