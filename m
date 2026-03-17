Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA8EFD877A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11b+1yJu85ESeXUMKtKDJkv58gPmR+Xo9cogdH48WHk=; b=E61avuX/5HQKZGaFWQj4b4nvk6
	LNfmg7oegoP+Tn7nOBXm4nPgvKSkm8JWC+yjPRxNmEBxAEMtQg7daV8zbGu7VEBOcBUTGvIlhyMET
	4UCo1l/R5eX/DCYV9HPNxduEhGlbyn2Jh6cFoWk/BzDlOjofvVhRnlZODM2geCJkuqdQ04h2W5iWN
	iObywKa3oWk+yanM1TxnwdzAN+w87OrUp3RDQvuYQEAJ48SZgvRhLf/V/t5ZinMXN0gOAZJfKLEl1
	nYb8Eppalgbj1D26VG9TdLSGzvHJMov2NKZjsn+eXCWG4CvarDcV2BV9a7sOWBD1sBN4o2cYJTRfq
	BZgXt68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0h-00000006UrC-3HJC;
	Tue, 17 Mar 2026 14:03:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0X-00000006Ula-44U8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:02:55 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8embP2315776
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11b+1yJu85ESeXUMKtKDJkv58gPmR+Xo9cogdH48WHk=; b=kzHQqyAFh37bfQr0
	sPNkqBny7OC0+Q5lE9zHqn3U9poNKBdtObHoPUhwQOPrCbDpDC/ntDKnkRgCANS8
	F3LWibfEHyW8isOzwM5W0R3zTAyWaR0BO/tuxqIoUSbIGGXtKQVd4tGcJP9LeRlL
	ZRYijnCQx9VIRtxqnk7/1gi6Q//ZW18kwGdUu98obmLmClIxNGfH8UU5Mmmue+Mu
	i6MF8Z4DNv19hPMAJIQkdLoYxXpbH+B4h0lfTdqvNtalEWYrh9g2eCqRqFiysMYl
	mri3Atmqum+72drasVls1e7NjvyUsb+jM0/jydfpPv9Q/FhhdkUVcSpC8LAuvjaI
	I6hohA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2c576-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:52 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffc6cb5980so7660224137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756172; x=1774360972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11b+1yJu85ESeXUMKtKDJkv58gPmR+Xo9cogdH48WHk=;
        b=TBQRITVpL8BsODQpXlB+kRIdN0wZC1RfhRc+FD/RmqnrSoeJ6EFgL7jLDMF2i3oYvg
         9HoreBbnnPkvDm+p/vHAkp9PLeYFxMNcnRouVUa4gsWdLxKRo30jkfHNXEn0Dj6fsD/v
         N0l+fP+6/pJnzkJi6rWDKwUJxTVbcjhoWU0nBppLF3PMsbMufvIQ5Yo5YmMz+xjti5wi
         CfnkjGB38bMBrg3iKoa+vbmCwuppDeRC3oqErsUNRcktoXVg4QhVmq4nnpVgaodQq3oA
         JO48jLJcjxoMBCnLyPE7Zz69mX/RnfDcmXsCmEaR1o/3y5kJZHcG38cRAb0EAN57gAND
         xcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756172; x=1774360972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=11b+1yJu85ESeXUMKtKDJkv58gPmR+Xo9cogdH48WHk=;
        b=Ru2+rcqsuw9skESA32tmYCcpzAQPtJMHUJu7r1sCL7dbvhiaHjoczuYHLFwGyumLZq
         PkQC4qO19EySjnPcSNtNVH6v+Ao+jqHMN6JMXc3p02joqaKcLzGxLCoJ7ycbyIArUk7Y
         GCOsRYgJ6BJE8iD7V7YS1FuUDHj2OUnkOs8/AF57Y3Xelc46C43o6NRb3iHURmChdp/W
         F22rQnWHiqmdDhUMIBpi+P0UZiE3RW/GyUFS3fhKTRPNYrb5MUR1bCB+fQGnUfQ2hJwL
         nK8jg29B7Th895viM/swX2lIhxIheaRvUdZSEGxZ+hf1d1w2FOvNFKn5ings+zdRXDNq
         MBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGOKPTLELLY2OYJjPm/V002NBYyovFBxssVacV+jKXcM1dCa60WPEWEuwUCiNliAySDu7BfEpmZPa8zX0fbN7J@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/2m/DRW0ZwEPH6RVXzpGAn8bHxQK3SDJ/X1dfKUQtHmy+pFd8
	R6ZYZ0U3fZiPCk+AbRoJSHaAAuCuu+8ky0eYhEUkfwfs7R6UDPuTS5/xQ/6rH3lUg2a13FKtUqi
	zWYfnzHlnbGz3yBI0DBMahOh3HWVa9c2uPqDDOsyK5q6dOpTBSC7uZiPsYteeO/0m9PhAeywA2V
	6NSw==
X-Gm-Gg: ATEYQzwxXaP6rhvsQA2yOhOfx3bzbKJ42o5QuD431pGWxe2t5u3r5Ku0iE0ybEH1/e6
	TCZyhBPSq24S3Yczb90btz4M8uvuiqf/W58Utxtw1r1aCV/I0gpinO0ZcqjbxbCROdJUIt0FaGc
	XX4vCZAJ6dly+XytfheSgsoIv5D1Fwa/xNylTGUcuVmOW5QMW+IVJkENhwwvUWUGhXTJ5onuH6W
	+oQFwrOFgojCG/QRtQF9oWJRxKiTPA1zzlU5fipjMuZJ0XzHhNbgnvu7mV5NZTjH0mij6X/H8mH
	UuNBdiCrIqfkwqlGmSqj8PopsLXIRLSOT0SeocMbN9X15hciLdpbGdqMyH+sHptLeZbfjrFEyft
	/uiAedbRFQ2QeaEw7Ra+I9Zubn1PM8iTBV7JbN6dcCDki1JflW0+L
X-Received: by 2002:a05:6102:442c:b0:5ff:ed38:187a with SMTP id ada2fe7eead31-6020e1ed1ffmr6223075137.5.1773756172029;
        Tue, 17 Mar 2026 07:02:52 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:5ff:ed38:187a with SMTP id ada2fe7eead31-6020e1ed1ffmr6222797137.5.1773756169815;
        Tue, 17 Mar 2026 07:02:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:12 +0100
Subject: [PATCH v13 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-5-0968eb4f8c40@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8683;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p5/Xkh9v/3vCwHzmvjuWAz1PZrCl432d7hL0iI5alyg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV712xjHxJR+yrqxIiLg3sagzBxcsc4EDIvxH
 6S4CI/q1EiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable9QAKCRAFnS7L/zaE
 w32jD/0ZGSzAuDMJur3nnXt++W24W5kPa3BzT/BW06FobMsPPvbNiJxXSL/T7+14et6DObEK/l+
 MJRifQnATawzICjOnJjpE90ZbsBT16pk4aOKQLJS62KWGOrBUOBMlKPzuW+apA8y6SZHzJmzdAc
 IDyh/Er8vgnEfuuSL66LRLmvU5/fgylESCxqcviXGngA0FJnnkaYZbAVtMowHvpYA1ENmyPHMRV
 SBm7RpIBLrqy1Z+yOnRNQgOsTpIgqkXo03aClo4zv32CJFrB/fze25P6CBaFsiOxeyk8/uxJ23y
 3PDJ9omoaQMbByXDG3r3bBNOK3EJNMpmYrtkIfy6Fnjzpb/Mh8ZCVQw33CWQktOW8TRYAWfBNZb
 kT9RSK6bj7aZAsiK4dqsCsC2oCKpXhE/oxgD4Ujoys8uN+dI4DqE735zBcrsgEZDk3f7vYduG6F
 0CfsOJrebcY4d4fB2nk1wDuUEqzLjSDTT4kP+37udDI65xnrUxxC3iET8jZtVBnh9c00ipwwJiV
 jeR/HJgMj9XRpyz6mrwOI0Lzl4FaHe4ZoC8OVzpdY9eGU30jfF0hay0UI8BOycJu2uZ90aG2hvT
 oydlry22c4zeH9Pps/4J7v+mMl84uJK+KdQMz3CAZnFEk2vF9vhcJyjXy7huN8G77zcca7is9v1
 ErNgXZl3gPWHZPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 3SSUfZqH172iLPAX0jMsoud8r2FKRWwl
X-Proofpoint-GUID: 3SSUfZqH172iLPAX0jMsoud8r2FKRWwl
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b95f0c cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RdU2YfPBjIXQodyA8iAA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX+FQxDWurz9ti
 n3XG7Pxw76bErOV2GQKU1sEYDoqw3IyVrS/yookCHO02Qam0cJ5TDDPAQseAY3T4EgODBGl6Ndc
 maQRU+lBKBG5DouvCNoq6GYNQtazQMGHj5XMWT6QSwVVHcHph2wYQdPBkeUZ/pM28kD1LgyqZfX
 XpsHKl/RL1upXqvL1jrl/Lrs5VGtDpGRtD6bJ+a4mXC5Ffln5WpA5wNd86BX0NJ1toPb+Adkcnf
 DyFBzblGdtB3mTqxWfNTO3WjhuCBW0pqQLuSZct6J5nLN85Fnv4PDhamdhvR0DtlLTB9HswCaWw
 s4Iw+n9RgKHowi4n/LYlWmpDv9VFvpjhU02dRWiMWl6a78JgfLvnTsXkJ+XU2nMhGhru+oT6Pwj
 j8N4vdDr/5gtxIrPzm4pMUMMyOgQwBbFhDNitTlj3hQR8xDRHVcWRUzE7KMJe6+L/oymk1sfZG9
 x5dMuiGDd7Yly9sKDtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070254_141797_2DE6AED2 
X-CRM114-Status: GOOD (  24.74  )
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
 drivers/dma/qcom/bam_dma.c       | 160 ++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h |   4 +
 2 files changed, 160 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..895286452c8b5e701c1df482095e5fe4a49f4246 100644
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
@@ -1012,13 +1051,115 @@ static void bam_apply_new_config(struct bam_chan *bchan,
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
@@ -1030,6 +1171,9 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	bam_setup_pipe_lock(bchan);
+
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
@@ -1157,8 +1301,15 @@ static void bam_issue_pending(struct dma_chan *chan)
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
@@ -1350,6 +1501,7 @@ static int bam_dma_probe(struct platform_device *pdev)
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


