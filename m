Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7D2EB1060
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KN20Si9oKhQSEQiwsnBiXWUeYCUJsC5pN0vFqnC/K4I=; b=UeSfnvuco49rXyO5G7buF1Mzcg
	iE88FXfv6VohRul6Ks7ccA6gQ8SmcvCtyMnwBily9jmWfEKrY5oJ3gBUTde6RLxPj44lOlV2jToi6
	OaLOGLPpWzZmUf9P4F1ql1IpTVED/WCfhEMHM1Kjhe7j1NK9ddZ4jMNesp+Ddh4/lI/0x8f7SGHWT
	yoEh2Stv4xbj4q5oxvPMIP0IWjoNcEPIWRHeuXte3hPQhTZcsvkdtqcFbtWu3ErN4XxwObwOuk08y
	aBtABwAflw7isM55VmknBOfgl4DHRoZmjLyuDud6Qxprlem8dBp3J0ulIiCVH/q8XKQWHlz+W380g
	W+UmOHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGa-00000009q1x-0C9P;
	Tue, 10 Mar 2026 15:45:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGU-00000009pwK-10R3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:44:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACap0k790196
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KN20Si9oKhQSEQiwsnBiXWUeYCUJsC5pN0vFqnC/K4I=; b=gVAbF12OUhHS7c/R
	uqCr7/dhqU2UW+QqLngu0W0ZTlEYZJ7ES5xJffCjn3OrGpcz7lkb0gOAj0Ie/NV+
	QdlcmojHhxXMOna2d3Nxeh847KAe1v1QE9XK5YDFVxrmtiPXpIruds2zAczlIZVc
	uido0z4zoV7XeiQ0BAIlWC4eTy7uFcjVUMF5KVxcClJQG9Q3lhe2Skt046LYH/Nv
	ctj508B4nIAjReoPdTeTRlyFPgM4s9ZEEuSkSsjEwQ4Abs27T/TXEyUVCMpIF+g6
	V5PYE/dml0eJMlEJEhWXXT8Ec7UqNy87rZ9Wr32s79vcKxPiO1XLb5Z+qk1BhsxR
	ECOUJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekvknd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd84943c76so5756185a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157497; x=1773762297; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KN20Si9oKhQSEQiwsnBiXWUeYCUJsC5pN0vFqnC/K4I=;
        b=Ldmc5x+o0Jpa/nXOXW2gm+xfHN6wiSd4uPFxMbtLg2Uc8T1SJ/D3GWfCOZB2ScP3Tt
         jYu5Z3scxL0Lr2u6cYFRoqaTEK5CvoXiEEC9Eezjt3gP401kyEhHcT8WggnnxQYdYupV
         Roo2kb+D9uAH0d2C7wSiEZaopgHaRNCw1tmeVgBII3CPROnB2ZC9NRBt644ydhQ3t4Fu
         WeoZ8w3XVgqpjdOpaRVTrytw+deg1JTDhD256IoYyEDoh64qTMqoY47DzrE6S7JNwUQk
         z502Y7wjC2NDy/9GmgFcZxcH8Ud1iAk+FbjGiTKGMxIiLWppmNLD29LNCOHOcXRyqGzp
         jb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157497; x=1773762297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KN20Si9oKhQSEQiwsnBiXWUeYCUJsC5pN0vFqnC/K4I=;
        b=opqjl0VVPoGSRKLsPRxEw3e1wPvQTRtbXUhM/+o928c5b3CALHH+SRY84eBWuGtAol
         WEXxuqC7WQM5/hSh0V6Zl4TZ3OExdAQgIkvo9Y6azqoUovLngcn+pLVKqBtCfX+Zb8z+
         WHmK8IuqUG5GcIx41BhlyFoDNU3EqNUD5/j/DQW/GhiS6509n19+nTznLWI36VKEEAPS
         IWa4JYk2QzjI7zBqQNAkI34khUCP/pHV5bH+kwP3YLEjXerDaj0L0rXDjNnODqi3kjJI
         9wTV9J7w7mFT0qoY8x/SJmSPXfqvUBrloAlsGxlZEoolQliCVMaiAXxfhYlwFLObRaRd
         62PA==
X-Forwarded-Encrypted: i=1; AJvYcCValCORxCFwlUnIfBYPKx8p0MzUw0dv/sVVDL0Gzs+BibtNObyzPXe5b3ezT9VsvK3WSXFCoOucLXh3e5xgnfbQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3hufk1r05Fffw8K3FbKpTtjjaGHy2/jKtUbu4Edt9uWBI3NQq
	pWOfDZ4jcKraFrjntCR5wlfiwogcCoWcGFaHC1njeYC5KACFlzOziuFd9w9l/WFPx+k2YihcTnF
	1co04hqKb0xR4h7nF9Ov22BP0gevi6ed5RcYa6Ll5t3FglpCKxeMx371D5Ll7Z+p+yexv4LaIN8
	taTw==
X-Gm-Gg: ATEYQzyOwu5unCzYq+WIA7XZcidlBqSz0Zxo40FvpfkxMijCsbhDngOi60XsL/2v4+9
	m81mXd+xU0DRisFofBW8rHn8jafvdO2enlilhsZOCIMOMIKTLdLfNcELvuZqniP/6qJbJ1cCmUF
	yXv7QQ+3eDIoHLmVhlaipVeB3mMeAwPGF/PaTBGDxnbaXIAGh1yh7QmlAMRG+wUd7S6+6x1fgTx
	ay1jY3IqGEdPJsD3JVunRvBp4daUTJx5Hd86ap2wdRxlvWhhexc4MPruWKbFAvtVFCbYqpbPaNm
	GfLR3FOHAxsZyTh6PNJiigOnHEN2ep8wg+gPDhkFGd5u0swjL1lemvK2E0ROdu35EtO4EMib7y6
	3YNbn5nYHMByQrcPvpxGNpjP8+lrW+oJGoJF3DgfXcAp6VwRCgGFx
X-Received: by 2002:a05:620a:890b:b0:8cd:9584:6340 with SMTP id af79cd13be357-8cd95847345mr17426385a.43.1773157496061;
        Tue, 10 Mar 2026 08:44:56 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:8cd:9584:6340 with SMTP id af79cd13be357-8cd95847345mr17419585a.43.1773157494902;
        Tue, 10 Mar 2026 08:44:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:19 +0100
Subject: [PATCH v12 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-5-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9496;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=elhTKwJOdnH8ShS2ww0C9I/XZ+2m164JUZdN202a2VI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxk9TY6tPxiPsXw43Ve+PSIj4tq2H5V4JJJb
 yw1r7r9dzWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8ZAAKCRAFnS7L/zaE
 w4x0EACxKbLwWH0BU1Begt8G28jzTGiJxEdXChvYM2Vr4aOS+ELPeSH22pJI6xxN46I8AvnwT9e
 xkONLqCR3ucI/p3eI6zeAbogxfPibrQKr2wlfGSOz6U6ILPwz4A+1KHOFlSQZBwSr+yxIehYeJL
 RNgWeQWMNMl/sbDf3QPr7sfyzAU8N1csgNyQLY3OeceiuJJvIqcrtqa15I9RXRg3j2fE7t0Qhn4
 8DtbpfMnAS1/uIyNKGSV2Vy4I81xyJQ+G03K8OsSe7cb6blFiupG/eX7I8iVmkvFIDQPtcalYPV
 WAww8lwySoQThKBHS7xChrEfqnTIuGtdUPYWtogcH/VSn+CI7OIT0ntZHC4OazxBctlh0aDt8wU
 tx7vFhWXCbefEFUeUtUlC9+vDkD34YvqPcnODKsDPn2B5akFGemLqVoqpZ6IzsUPlVO59Rqc61w
 O9VBSCXHVJmyAaNIsO2+/QO/cxHdGwEBkqrb4nyUKGKaoy2VUwlxHFAtS+rs/5s0WP/JnyXdYQh
 WgyNnW+UkJiAuVBJp9EpfTkhb3Jwa9JQoRMlxpnvepO2GLf5R5Esx6UAMWoeqz0EQFD8MREMMVL
 eD9bZWyqkS97qe+1SHhhfczOHegXdXi7uMIa1m4PPQzZ4GLD099CqVo7qLwT7kpHVDvtibkN4ZK
 7gaNLWok5bCpXJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: g4YoX03MW-9wUFXPmj1MAfVInNRfX4ug
X-Proofpoint-ORIG-GUID: g4YoX03MW-9wUFXPmj1MAfVInNRfX4ug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX/d0cakQ6aehP
 8Qdbxeljs37vtPyyQXxpz6B3GnrciRo6wZqGt7+wJ21cwPgJbRoc3evaB8K0Kp4q78/RIRTWRGw
 5voEXhYxaePOMGVWLZd8LlrxaGOZUCMSF6tRYeLrHsk4iKdr38FvK5XX8/+fx8oUdYE+KY4sz/6
 1UO3B24uhbqNGNnA8LVzVnMCATMcUUFk7h406aO+RozPFF/vkR1Oi5Z7ymyaeiPO9cy4zPVBUPs
 zK57ZlTcLiwpHnXtZ9kShILNA+2qBr+2ITdg52GDox+VT8gDo+Rei/gU1oqo3k3XOPaboxRd8i7
 hnjeXmjUngHkpPi60mdtnAYJBbNKAP9DLZLUIaaX4DPiRhClD4jQQCrnJ7EXfEqJinHRWmbNJyv
 PtrYPxm/chxEMAjzA8p+gI4a6GsCe7AVghBef+XTKprBYRwT/AAM21o3w4wR6vLYoTSidYNtO6I
 Z2YUyGz/GgLQkNrDNTw==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b03c79 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qJbEDo8Lr3yLsC1F8HwA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084458_310470_7772FEB2 
X-CRM114-Status: GOOD (  26.52  )
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

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 175 ++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h |   4 +
 2 files changed, 176 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..627c85a2df4dcdbac247d831a4aef047c2189456 100644
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
@@ -391,6 +395,14 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	bool locked;
+	phys_addr_t scratchpad_addr;
+	struct scatterlist lock_sg;
+	struct scatterlist unlock_sg;
+	struct bam_cmd_element lock_ce;
+	struct bam_cmd_element unlock_ce;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -652,6 +664,27 @@ static int bam_slave_config(struct dma_chan *chan,
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
+		return -EOPNOTSUPP;
+
+	bchan->scratchpad_addr = metadata->scratchpad_addr;
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
@@ -668,6 +701,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -723,7 +757,12 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
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
@@ -1012,6 +1051,112 @@ static void bam_apply_new_config(struct bam_chan *bchan,
 	bchan->reconfigure = 0;
 }
 
+static struct bam_async_desc *
+bam_make_lock_desc(struct bam_chan *bchan, struct scatterlist *sg,
+		   struct bam_cmd_element *ce, unsigned long flag)
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
+	sg_init_table(sg, 1);
+
+	async_desc = kzalloc_flex(*async_desc, desc, 1, GFP_NOWAIT);
+	if (!async_desc) {
+		dev_err(bchan->bdev->dev, "failed to allocate the BAM lock descriptor\n");
+		return NULL;
+	}
+
+	async_desc->num_desc = 1;
+	async_desc->curr_desc = async_desc->desc;
+	async_desc->dir = DMA_MEM_TO_DEV;
+
+	desc = async_desc->desc;
+
+	bam_prep_ce_le32(ce, bchan->scratchpad_addr, BAM_WRITE_COMMAND, 0);
+	sg_set_buf(sg, ce, sizeof(*ce));
+
+	mapped = dma_map_sg_attrs(chan->slave, sg, 1, DMA_TO_DEVICE, DMA_PREP_CMD);
+	if (!mapped) {
+		kfree(async_desc);
+		return NULL;
+	}
+
+	desc->flags |= cpu_to_le16(DESC_FLAG_CMD | flag);
+	desc->addr = sg_dma_address(sg);
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
+	if (ret)
+		return NULL;
+
+	return async_desc;
+}
+
+static int bam_do_setup_pipe_lock(struct bam_chan *bchan, bool lock)
+{
+	struct bam_device *bdev = bchan->bdev;
+	const struct bam_device_data *bdata = bdev->dev_data;
+	struct bam_async_desc *lock_desc;
+	struct bam_cmd_element *ce;
+	struct scatterlist *sgl;
+	unsigned long flag;
+
+	lockdep_assert_held(&bchan->vc.lock);
+
+	if (!bdata->pipe_lock_supported || !bchan->scratchpad_addr ||
+	    bchan->slave.direction != DMA_MEM_TO_DEV)
+		return 0;
+
+	if (lock) {
+		sgl = &bchan->lock_sg;
+		ce = &bchan->lock_ce;
+		flag = DESC_FLAG_LOCK;
+	} else {
+		sgl = &bchan->unlock_sg;
+		ce = &bchan->unlock_ce;
+		flag = DESC_FLAG_UNLOCK;
+	}
+
+	lock_desc = bam_make_lock_desc(bchan, sgl, ce, flag);
+	if (!lock_desc)
+		return -ENOMEM;
+
+	if (lock)
+		list_add(&lock_desc->vd.node, &bchan->vc.desc_issued);
+	else
+		list_add_tail(&lock_desc->vd.node, &bchan->vc.desc_issued);
+
+	bchan->locked = lock;
+
+	return 0;
+}
+
+static int bam_setup_pipe_lock(struct bam_chan *bchan)
+{
+	return bam_do_setup_pipe_lock(bchan, true);
+}
+
+static int bam_setup_pipe_unlock(struct bam_chan *bchan)
+{
+	return bam_do_setup_pipe_lock(bchan, false);
+}
+
 /**
  * bam_start_dma - start next transaction
  * @bchan: bam dma channel
@@ -1121,6 +1266,7 @@ static void bam_dma_work(struct work_struct *work)
 	struct bam_device *bdev = from_work(bdev, work, work);
 	struct bam_chan *bchan;
 	unsigned int i;
+	int ret;
 
 	/* go through the channels and kick off transactions */
 	for (i = 0; i < bdev->num_channels; i++) {
@@ -1128,6 +1274,13 @@ static void bam_dma_work(struct work_struct *work)
 
 		guard(spinlock_irqsave)(&bchan->vc.lock);
 
+		if (list_empty(&bchan->vc.desc_issued) && bchan->locked) {
+			ret = bam_setup_pipe_unlock(bchan);
+			if (ret)
+				dev_err(bchan->vc.chan.slave,
+					"Failed to set up the pipe unlock descriptor\n");
+		}
+
 		if (!list_empty(&bchan->vc.desc_issued) && !IS_BUSY(bchan))
 			bam_start_dma(bchan);
 	}
@@ -1142,9 +1295,17 @@ static void bam_dma_work(struct work_struct *work)
 static void bam_issue_pending(struct dma_chan *chan)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	int ret;
 
 	guard(spinlock_irqsave)(&bchan->vc.lock);
 
+	if (!bchan->locked) {
+		ret = bam_setup_pipe_lock(bchan);
+		if (ret)
+			dev_err(bchan->vc.chan.slave,
+				"Failed to set up the pipe lock descriptor\n");
+	}
+
 	/* if work pending and idle, start a transaction */
 	if (vchan_issue_pending(&bchan->vc) && !IS_BUSY(bchan))
 		bam_start_dma(bchan);
@@ -1157,8 +1318,15 @@ static void bam_issue_pending(struct dma_chan *chan)
  */
 static void bam_dma_free_desc(struct virt_dma_desc *vd)
 {
-	struct bam_async_desc *async_desc = container_of(vd,
-			struct bam_async_desc, vd);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
+	struct bam_desc_hw *desc = async_desc->desc;
+	struct dma_chan *chan = vd->tx.chan;
+	struct bam_chan *bchan = to_bam_chan(chan);
+
+	if (le16_to_cpu(desc->flags) & DESC_FLAG_LOCK)
+		dma_unmap_sg(chan->slave, &bchan->lock_sg, 1, DMA_TO_DEVICE);
+	else if (le16_to_cpu(desc->flags) & DESC_FLAG_UNLOCK)
+		dma_unmap_sg(chan->slave, &bchan->unlock_sg, 1, DMA_TO_DEVICE);
 
 	kfree(async_desc);
 }
@@ -1350,6 +1518,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..f85e0c72407b5e1a733750ac87bbaba6af6e8c78 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -34,6 +34,10 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+struct bam_desc_metadata {
+	phys_addr_t scratchpad_addr;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


