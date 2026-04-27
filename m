Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB498FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ws3wC5jqIqaO13gZQcJaOHssTZuGV6QPS0RLw3JFDoI=; b=WLpZ6y4SopcjDotOWi66LAyzG+
	1atXNoYUfZQK4YcHnGoYweqh0u9nDXpvF+2dRRPqqluKz5/zv8Y63RqVzA3vXPVQSZYGWqCxwP4oF
	DrDZPtOrJhv0Fxrk4/gcv/ZZVHd7LLNNzN5CIBmJysyUT4Jca42YWmqR+KnxBtDcDnRMcQdU3wbB/
	sc7kcHBUBvtCSbjUYKl0/yu5PbA2mxqaIy9fXpKCsmYdKSUhddGaNHUMKlZZAUZTCz1eaDCa/pawZ
	dR7b7XaJ8/SXSVN3ruwtq3pkli8wGjkawW1oE6VUZ5BTMcxStDyH3IFHx6SRJZ/luEy7/QvKMDal3
	cpCT9CHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4e-0000000GYgz-2RNE;
	Mon, 27 Apr 2026 09:16:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4W-0000000GYbV-3dGy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:10 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T95D1762042
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ws3wC5jqIqaO13gZQcJaOHssTZuGV6QPS0RLw3JFDoI=; b=dq8ZplD63uYrfyIO
	RCdlHMplQni9IK3tp0yROxWNC7aOD7UNes1hy5ErG67emLIdRFWu9fyZZFqtg0Z/
	jogqYXZouMu2AfrrkUcqVZ5pK7FIKs9UV9CRD5m7/Ah3ss70GDno8h4PPOEI9QwK
	wZV9OEkhsQqO5IMSJ3g26Q/C1GjP/mp4RUlSnmAkcGuPrOh7q+mkdzvuPqGoh24A
	c4T3PXmLvTxRrgDUdYm605C8OpRu5SyRiCjOlKdSFW0OUjTNDUwkhwq2dt2qEAG7
	B25gjvqwFHh5IpTQ6d+xzxXuYY38CJ8dP7IQp0jDvE4F2RK5fzo2nEt8wwqL60Sm
	hFGcWQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpw9da0q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50faf575af4so38014241cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281367; x=1777886167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ws3wC5jqIqaO13gZQcJaOHssTZuGV6QPS0RLw3JFDoI=;
        b=A+OHFJkPY4ZZC835ykghrMZnvdVrw1BDzuVuGYf2lyaOFBy6w/RYlqj+SfUB3ATYIQ
         /Z/yUrVZZamdezRmRtCG+bw8FbO2l4sjHeV9n3IzFDJ2SnF439fbZTDWHOnXpqqSe25W
         elewqrTGhW9DYtHUjTc354pypZAkUyEjMdVwHu79IlqydJyqyQS01tGoBbCVdi2JfCZB
         hhDWTzszoX1nbCtvZ1QXhyzcyHEQrRNtksJw+nq7xPyPIn1jPoa1bgbuje6lYjAc9xFb
         O+ur6tRYIVgqQWaXfcx6IKAAPwPIjR4KSwu3lavVnKHPTmRRKCPa/+qgGzwguWMxeVVD
         KSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281367; x=1777886167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ws3wC5jqIqaO13gZQcJaOHssTZuGV6QPS0RLw3JFDoI=;
        b=fY64EaQcil5eh+Aj2rcf9RXNs4ojkxDerl4nSRKVt3KoIM12BzMOXczxHErFee4YBF
         3mCQ0d4QwAsYGVPuz8IoeflcYraDNLVrqQpX/Uh0PC7JBPl2G2ENP4MH7REOir0pMmtN
         dpCcVR8d6pkiO+QCt2ATwoJpjDgnogpHysRvRla6kTAcHTkVwUPmVa+CkaigDTfNavfB
         1JjoYVjZbrI+yH5m0E66FtzVhdNtWzui7M7tL7aBDT9lLzT3NNsDxq9DfnrNks7pS8bW
         ehQrP8urrCm4WcLG3CfJcmqCpTTxE+iWS38exJVedlGMJOGpgw+RBBMAcdea7+tSV1Y+
         +IMg==
X-Forwarded-Encrypted: i=1; AFNElJ8xOjkBrscE8lgcuQXS7dXM75xnp5QztKI0tcn17PIKQ6Kjq5+Cqonkf0oIw2Le6qnuh3Hl5Z4askPQflv4tsbQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0M3adUUXlAlBVlcLL7wdAuCXim3l0WgOi1wP18PaRRpqo0lzr
	c3Hdt8iTYYOa2g/FaWDpJcrI177s6IAptUoprMz8Sk4co0kAsCAgOlT4o4VAW+8qcN5HxWfdKoL
	VFFslpaU7yFaE+VvYxOX22XxFK4OGTTa7cIkOX/B/hxa4ZJwwGibmxYkSRhXzFG93ALM82cKGWg
	rWFQ==
X-Gm-Gg: AeBDieuHnQXmXFcdh5PLNsQnL7wRmjlyQhh1laLcI8dlnrtMD/7gg9XUZvTJ8ytp9qv
	DTokrgzvycGAjpTkKym1LYScM406Wr5RulNdJDYTkj5ME+Df4WU2TFfSgNsJE8BwCzCgzPU0CZo
	df6u9tjEHw1TvTK9e5Hj4X/68HZAKWr+NIPdoTt40sf1d/08TTQpx4qXvoLCeunMUy/DRg6UB5X
	sj/rvXYSL1Qk+0HdW/QwuoGoe3x77EH/k6viU1xy7hRbLFP+ArsqA6GKmxpEG/i8ksh1rH+Uh33
	mBj3+U7LvpHwjQHdMeQ2vR7jxuU0pLgnGcR2Szmp2oZD7zIBVhhDzmRTMpLfLCj+e2aFoJb7F7y
	S1toyBjsOhepMgoOk0ypCxPS0foorSYcGIgUI5/gojia22cA/ASDBuk6tXCbwYA==
X-Received: by 2002:a05:622a:1dcb:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50e36837466mr618717561cf.4.1777281367260;
        Mon, 27 Apr 2026 02:16:07 -0700 (PDT)
X-Received: by 2002:a05:622a:1dcb:b0:50d:74e4:56b7 with SMTP id d75a77b69052e-50e36837466mr618717171cf.4.1777281366797;
        Mon, 27 Apr 2026 02:16:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:38 +0200
Subject: [PATCH v16 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-5-945fd1cafbbc@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9515;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zej38AY1HURQQPXixRl2Mg7k2dmudX8XuCBnlPTpkvw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylBc+D0D78uvZgn/UxumwtcRmuQ50D1VE07h
 C3Qz9NU4sCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pQQAKCRAFnS7L/zaE
 wz5NEACSdLgrHVkQPS1+qmro7GbDrjKp2sOIB38bdhxIBd9fNoSBt9yCbpLviZOq3V/asSYQiUN
 AlEXJpWXBzTOFNlElDgkV8pVeEMNVV5DSFrPp3Qa2Js+vN1hx9OIR8ryD2LhGvljeHCX/6MwLYI
 B7FruU8D9UHlux68h7DlVftp4hewQCTAYriSa0gKx38hrmbi0quvALPw1aBK1h2GF5rUP3Z9iy4
 9VcaL2bj1UT890Nk/eo+g7LDTmGmr8VT5BEmXrViKDu1tYCTQhX9HjAgVUXRXAEvkGJ/GcMCfwk
 9m/BKBvmuDHHduDtIj4LowyZQ8wjxDXYnoXtptPKaz10ST1E0sXhgtGaZqCWydMqNvunDSDGzUH
 Xhsd5v4+o+1WLnB9F+65sAmOKot/wRXJ4i7f6Ij2ugxyhqKh3yHT4Z4zlw8sFFEVj4zB7yNZSqu
 n64dokU0WJjHQusAJ3ZgKXCUPzXhtI6ONuiT3nmjh8EER8DswKifW6fsJ8vusSjaSf6cNSomTBR
 +/pNRtgJAO8Wqvk7xdO9ftVjB89v/7cwDkQle/N4euNB7+RB2hbH8zUWebck2zIR5l8K5glhye/
 dEXoDeHX4ajmIsTAcqLGm3AP6wU6D3GV1yObhbhSkBAekz9NALLUfVnRLwWTf1xthHPlU9bCg/u
 /C/kueO9iilYJRQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: QeQuzxVqQPyfv2KrvnPxYGmJyc6QLd4k
X-Authority-Analysis: v=2.4 cv=H67rBeYi c=1 sm=1 tr=0 ts=69ef2958 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=j-cXwOq41x9PnjJ4jooA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX8I8WEJ6E7qfb
 yUCjQaedbtN5GTTU+mz/EEiFxiBDqRFfvx4xbGCOhkkZTe33XRtSCfN7w85HBiqmKNxoz3fnWM3
 UzJ0FuunZhuTiWvDSYV7meySjXnacvcB+xE8ad56lBdEfAfKzt9M65M6Zp3rtt0ENeKwWFdJFdb
 WKmoGYKSvKePKE3vav0lRCBOcFXztWJLMp2jiDg8obliXSH6N/saQ7PIavsKm/fVjElpBrryeT/
 4fx4CMEsbcG119Kd3rQVm9Nw5g+vHc6Zcxgv88WAeeVe7a08ZnqEocL1gtB7dkRhtxdG56GMm6w
 NlrmG2UP2mwCnUvEHtACXdFJ/4b3ukHqwD7CZY6eYAd/4M1ubov0eY/DA284JBsnDmnsQjFS4cY
 Gv+Tqv6oOzZ/+F2MM7f0Qh4KYIUbQVHfn5QzD1kdqG25oBUOfTrS6lamaycZUFbm9XbQPfVEBxN
 9HJPx5Ljn2tbpb506rw==
X-Proofpoint-ORIG-GUID: QeQuzxVqQPyfv2KrvnPxYGmJyc6QLd4k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021608_922309_03006745 
X-CRM114-Status: GOOD (  25.46  )
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

Add support for BAM pipe locking. To that end: when starting DMA on an RX
channel - prepend the existing queue of issued descriptors with an
additional "dummy" command descriptor with the LOCK bit set. Once the
transaction is done (no more issued descriptors), issue one more dummy
descriptor with the UNLOCK bit.

We *must* wait until the transaction is signalled as done because we
must not perform any writes into config registers while the engine is
busy.

The dummy writes must be issued into a scratchpad register of the client
so provide a mechanism to communicate the right address via descriptor
metadata.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 154 ++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h |  14 ++++
 2 files changed, 164 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..85d8ace8e11e3f78a0a7b13d8fe44afcfa75d98b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,11 +28,13 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_dma.h>
@@ -60,6 +62,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -72,6 +76,10 @@ struct bam_async_desc {
 
 	struct bam_desc_hw *curr_desc;
 
+	/* BAM locking infrastructure */
+	struct scatterlist lock_sg;
+	struct bam_cmd_element lock_ce;
+
 	/* list node for the desc in the bam_chan list of descriptors */
 	struct list_head desc_node;
 	enum dma_transfer_direction dir;
@@ -391,6 +399,10 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -652,6 +664,33 @@ static int bam_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
+static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
+{
+	struct bam_chan *bchan = to_bam_chan(desc->chan);
+	const struct bam_device_data *bdata = bchan->bdev->dev_data;
+	struct bam_desc_metadata *metadata = data;
+
+	if (!data)
+		return -EINVAL;
+
+	if (!bdata->pipe_lock_supported)
+		/*
+		 * The client wants to use locking but this BAM version doesn't
+		 * support it. Don't return an error here as this will stop the
+		 * client from using DMA at all for no reason.
+		 */
+		return 0;
+
+	bchan->scratchpad_addr = metadata->scratchpad_addr;
+	bchan->direction = metadata->direction;
+
+	return 0;
+}
+
+static const struct dma_descriptor_metadata_ops bam_metadata_ops = {
+	.attach = bam_metadata_attach,
+};
+
 /**
  * bam_prep_slave_sg - Prep slave sg transaction
  *
@@ -668,6 +707,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -723,7 +763,12 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 		} while (remainder > 0);
 	}
 
-	return vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	tx_desc = vchan_tx_prep(&bchan->vc, &async_desc->vd, flags);
+	if (!tx_desc)
+		return NULL;
+
+	tx_desc->metadata_ops = &bam_metadata_ops;
+	return tx_desc;
 }
 
 /**
@@ -1012,13 +1057,106 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
+{
+	struct dma_chan *chan = &bchan->vc.chan;
+	struct bam_async_desc *async_desc;
+	struct bam_desc_hw *desc;
+	struct virt_dma_desc *vd;
+	struct virt_dma_chan *vc;
+	unsigned int mapped;
+	dma_cookie_t cookie;
+	int ret;
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	sg_init_table(&async_desc->lock_sg, 1);
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(&async_desc->lock_ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
+
+	mapped = dma_map_sg_attrs(chan->slave, &async_desc->lock_sg,
+				  1, DMA_TO_DEVICE, DMA_PREP_CMD);
+	if (!mapped) {
+		kfree(async_desc);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(&async_desc->lock_sg);
+	desc->size = sizeof(struct bam_cmd_element);
+
+	vc = &bchan->vc;
+	vd = &async_desc->vd;
+
+	dma_async_tx_descriptor_init(&vd->tx, &vc->chan);
+	vd->tx.flags = DMA_PREP_CMD;
+	vd->tx.desc_free = vchan_tx_desc_free;
+	vd->tx_result.result = DMA_TRANS_NOERROR;
+	vd->tx_result.residue = 0;
+
+	cookie = dma_cookie_assign(&vd->tx);
+	ret = dma_submit_error(cookie);
+	if (ret) {
+		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
+		kfree(async_desc);
+		return ERR_PTR(ret);
+	}
+
+	return async_desc;
+}
+
+static int bam_do_setup_pipe_lock(struct bam_chan *bchan, bool lock)
+{
+	struct bam_device *bdev = bchan->bdev;
+	const struct bam_device_data *bdata = bdev->dev_data;
+	struct bam_async_desc *lock_desc;
+	unsigned long flag;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
+	    bchan->direction != DMA_MEM_TO_DEV)
+		return 0;
+
+	flag = lock ? DESC_FLAG_LOCK : DESC_FLAG_UNLOCK;
+
+	lock_desc = bam_make_lock_desc(bchan, flag);
+	if (IS_ERR(lock_desc))
+		return PTR_ERR(lock_desc);
+
+	if (lock)
+		list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	else
+		list_add_tail(&lock_desc->vd.node, &bchan->vc.desc_issued);
+
+	return 0;
+}
+
+static void bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	if (bam_do_setup_pipe_lock(bchan, true) || bam_do_setup_pipe_lock(bchan, false))
+		dev_err(bchan->vc.chan.slave, "Failed to setup BAM pipe lock descriptors");
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
  */
 static void bam_start_dma(struct bam_chan *bchan)
 {
-	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
+	struct virt_dma_desc *vd;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc = NULL;
 	struct bam_desc_hw *desc;
@@ -1030,6 +1168,9 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	bam_setup_pipe_lock(bchan);
+
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
@@ -1157,8 +1298,12 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct bam_desc_hw *desc = async_desc->desc;
+	struct dma_chan *chan = vd->tx.chan;
+
+	if (le16_to_cpu(desc->flags) & (DESC_FLAG_LOCK | DESC_FLAG_UNLOCK))
+		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1350,6 +1495,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..a2594264b0f58c4b2b1c85e243cad0d5669c26dc 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -6,6 +6,8 @@
 #ifndef _QCOM_BAM_DMA_H
 #define _QCOM_BAM_DMA_H
 
+#include <linux/dmaengine.h>
+
 #include <asm/byteorder.h>
 
 /*
@@ -34,6 +36,18 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+/**
+ * struct bam_desc_metadata - DMA descriptor metadata specific to the BAM driver.
+ *
+ * @scratchpad_addr: Physical address to use for dummy write operations when
+ *                   queuing command descriptors with LOCK/UNLOCK bits set.
+ * @direction: Transfer direction of this channel.
+ */
+struct bam_desc_metadata {
+	phys_addr_t scratchpad_addr;
+	enum dma_transfer_direction direction;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


