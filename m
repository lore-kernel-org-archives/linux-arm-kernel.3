Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6907CF46139
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y0wDnbloqZyr+tffy5v2L5LGuKsXqmk7G5sbV/+toc=; b=GdMpdYZkG1R5AieZLoRXJnCe+6
	gvBC868xJU/yw6GvkC2bjHKeXgQ1/9mL28+LFEzL0qQhlyKtohhZZVKsYkgoDhJGstd2lonr3z7ey
	fR/1SRlLLhDOVpOAtl0/zyXoM0UNFqQAbSCAbDlUekkxoqgQJsg0ZaYEP9ff6dgFU37e9emKhC9Zq
	SeG1Owi7Z+B0a5LKlrXtJUEd1b6O7N3656WJFrIkZ++zuziUO2Wxs7pvQUaOP4wLcMyYg2xOVBVOv
	FZRWAfXrLHwLFO/EKBh4GGjzLJJMhzU3iIr5q2fOgFkvQnkGLAa+/RMxpvXaTtx2i1wvIX6VLFWYK
	Cb0ADIzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2Q-0000000H0Bd-187M;
	Mon, 23 Mar 2026 15:17:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2C-0000000H02M-2OuQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGRIF020548
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2y0wDnbloqZyr+tffy5v2L5LGuKsXqmk7G5sbV/+toc=; b=WXc6WxQv7ig6fn+V
	PQzxiOo7hKM+KAo3gzR/j4J1/VPTZZtuPtGj9IBeLdUWMrQIlHdm6K+oNTfnKUm4
	Ax92xwqHsVffCFnJaib9h986D+SSVO+ZIO5n7uuUwmG1VhRgoRpzY+RMOIPaDIql
	hgc5TWBopFjr6zB2U7gXWl7WHaKMrtZoHII41tqSI060kYmaAmMLf6yc9ij3sOhA
	YVWasxLl4izCv9TZqafJqR+4wtb5JFMTYwKJCk8aPEtm9Yg4tVPgAH1vM2H7mL1S
	kzQKP4V1Thvo5BN5Wf7qLeb4io1ie3Myb+enGccJGyj9nn7FmyQJs9hVrKfNuRLM
	1AdF+g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k311s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5675cb317e3so3026612e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279059; x=1774883859; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2y0wDnbloqZyr+tffy5v2L5LGuKsXqmk7G5sbV/+toc=;
        b=kSMI/dFTzUdUt4Ja/kvasBEKDTImAoXe17xdEowUQbsTrx6GRLTgQde3EF3fBTblQG
         D15w4S3GIY3c4Jvaix4UbUPk7Pv99ROZH6JJjLerKroCNimCs4SyYYZZJDpK/Q2FTNS1
         WSnnsHYKERWEUbRTk3v9dGy3EMQEGfe51+iR6mFf+I0BmZmarhZi1mWe8SRiYACNAjBL
         zaSzrSDBwPBhLfFRCOW4dC3E0/qGlbatio6H/Lja4cMPXmqyO/soYG6yzTJkGP7uCHlb
         t9zaKPYqiwmp0gJ10lzE2qoo9FXmA0Ot/Jwa2w3tRcup5QjQN1cP1MftcznQsIPE4iKz
         VkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279059; x=1774883859;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2y0wDnbloqZyr+tffy5v2L5LGuKsXqmk7G5sbV/+toc=;
        b=F3cqGfucC5uk24XOuBpDvIWT4Lr1XtHloXhJBLhrGE7JTLmZpxaQgc2DcPLrGUAXPP
         KD68EbSQzg4Wi78eFk6QRW9SzbAt+gBE1edNDYZppD44r8LDImZjNCUEEwngxKz6fZC4
         SPze7YqjPFXdImy1sIHlSMiHdLY4Gnu0gbBRsPVv/hZuhOgjPyu+6lnODoIcWVKXdx5G
         qnfnnvv3/WoNtRTg0t2rlJONW/ZOvFDieMdW6tuLNLIIBPIP9Fdwm6/YNl6JqsT4sTud
         n5genTNNvHXoz26L/RUBEg0yasqFY/3wEu22PLykxhSkI68GixFNWkGb3B/zH2i7mCkj
         dPag==
X-Forwarded-Encrypted: i=1; AJvYcCUW+xz3pq7bxsjzzwAdA/PdQWdpxYW3pVgPYIkQUt+Qs3QcsARD5P05ddMORF26AhYNkkGfrvJUQ0QIwEqREQBP@lists.infradead.org
X-Gm-Message-State: AOJu0YxFGdpsPvf41uT0cqiBn9moCZVDq/o48md5jwVTG0eN4qahenC+
	mPCgczsQcXOVfJXkqNirsTtVW9TeL2Ffxah8ZfzQERCBZpWQvYKCfGWDldOxKbOSljGld2BidHo
	a9ZHk/5s3IBPGXYMGinxSOEtL/c/PRsnadN3KjjexsqZp4Jku2IiY9Vnj3ZmsMD1KtjgBdsdIrs
	Jevg==
X-Gm-Gg: ATEYQzz1bFhpO9uYe6zivwXYmckDSXRzndFrYR8oVYmpJ4dCyl5jWUNfaxQPn7kXaar
	FLB4A7BH0nolBFtBWwGe4dEd648gZ+Mi130yu3pwAcoyHvx5COvLVXIQegqUY3JQp5dj97mu1Fy
	RSoP+8W1b3InOq4FvnffAblQfAeeZirG8GpWXE3M8DAIM/wrsOref9wDYp6B3dLiSwdex2DXELZ
	38fUNOCT5ngSoCpT9cDUyr63MmBJ9rnPG9S9CYUYyiau165nx6jYEbCsLuB19fsvyR0lYZTlyfQ
	wtgvhXXj8c1OqIUAN1RmfQWLIab3k+nfRYiOBI7UfQ5njchow/cly3j2OispCcjWo/3YUPtFYKQ
	iXslDvfb/T+RAkIcu+7ziIYlyD2XzvKL5uzXJBoGPz+uzfhsS8FbK
X-Received: by 2002:a05:6122:d1e:b0:56c:d59a:cfe4 with SMTP id 71dfb90a1353d-56cde47e3camr5670680e0c.17.1774279058957;
        Mon, 23 Mar 2026 08:17:38 -0700 (PDT)
X-Received: by 2002:a05:6122:d1e:b0:56c:d59a:cfe4 with SMTP id 71dfb90a1353d-56cde47e3camr5670592e0c.17.1774279058409;
        Mon, 23 Mar 2026 08:17:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:11 +0100
Subject: [PATCH v14 05/12] dmaengine: qcom: bam_dma: add support for BAM
 locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-5-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9224;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=rWOE47026mczpuQ+OpCmY6UmFXFZSFt73L3FX2KDFWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVl/U2pDgQv5YxJHbZX0VcINEtapypUTtW6+Q
 G08A0O5glWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZfwAKCRAFnS7L/zaE
 w238D/9yCNG/4+r3GzaQR/gjiJCNM1R+ndI3hsQQnE2EU5YjB9lPbmyo+6Frz5Mnxa6DJAxmprz
 ASU3k8COi5+hBlGRgZOFGnObO+ztW7s6w3gSYgn0KnMhJ0Eb5SbHTE30ZecNSCV+wZlmhztJ2xU
 dq8dURfoGz/hsU/nK0Uqa/eFXYkWwkHHzsf8/FCDwgUVFY93K1DJA6AEsFiQlgG9WOBvegOGk8b
 LxQXXZTF7Qnu0wv9pz1iC4Em8Lrg5svC1n31PLNPUh8LGEeAyRp4rDtbIZa5zsvI+MHFwCKNV3P
 kvurpbgqj6DoYiX3OFwFVErqJ10G4UBuLpLWePWcdZdmV1FzVoV0GrCYnH9lErTJxKVqkj5h+7/
 BGHa/lVEN8WjuXTiJaoyNrUFlFgt8DurWofp1OOJ7L+ho9Kot3Gb96cyV2xRqYeHj7zkLPnb94R
 FH+/A9IPopOM1CbQl331/HFRfA7rNzp5hLJAeH4QRv9qaz5Ohvd2wQ6pEjgqw1VGjYUURzErbcE
 l/Kfjf/IX13AFA3sA6pdwoQZMkM61DxGFxngVVQoe0kH2akN0lt7/AzDCzlnoZm0M0TQDsFhUSm
 hAWF4RnTvLK/wjeuniT6zb7uTWMhXrzeIhioku2Rb5+buHYxOuIHOwrMe0pO+AlS5CDL4hTW5qr
 y6v1a/Xu/M/OULw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c15993 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=RdU2YfPBjIXQodyA8iAA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfXxlJKlKO6PHN1
 tMXuw3DazinGTfWJ0nTQnn7tXpUvavBTNt+J6wMXT3q6+GMLpGBN12h5cCu5hRdLV+gQ/t2Byfm
 58MDdhXhNqqwYUbYsvM/ES1TFGVT3IUy/VpFgLpP6UFgyLFkElrtF9Ox5TWC/t8bGqH7MO86QvY
 d17Ml/uhWH8S9Ysd9WAGu9YfgLmioC5N0aPn71Iv5LvFyZpirOJV5zKuMY3+lPP5ZAzTh38LX0Y
 QUSMX20+CdfKixutHQO/T+KYoXOmVb/+N0yVnsNhXwzPPSTbePdshCZy8wvrWYNSNEKKuDuMuPU
 6XsWNJc9SYdu9oqK6WIV5kaEPsvE6E5AjxiEslpwgm9yh2lLTqdyexrA+HBHCtnSiCRgljLg7TE
 rAHYRvrFHPTEp68erGZU8lOo8qYiOFRPfWlaVKQ8Hk22lITYK1obqpB2rOnFncdlxZ9AB2puerg
 RdKC7TA1M5EdK8Q7DYg==
X-Proofpoint-GUID: lqeIOBDU02mXQcNo_Ji1kOuj81ZOK_-R
X-Proofpoint-ORIG-GUID: lqeIOBDU02mXQcNo_Ji1kOuj81ZOK_-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081740_750605_A7BEEE6E 
X-CRM114-Status: GOOD (  26.36  )
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
 drivers/dma/qcom/bam_dma.c       | 165 ++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h |  10 +++
 2 files changed, 171 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 83491e7c2f17d8c9d12a1a055baea7e3a0a75a53..309681e798d2e44992e3d20679c3a7564ad8f29e 100644
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
@@ -391,6 +395,13 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	/* BAM locking infrastructure */
+	phys_addr_t scratchpad_addr;
+	struct scatterlist lock_sg;
+	struct scatterlist unlock_sg;
+	struct bam_cmd_element lock_ce;
+	struct bam_cmd_element unlock_ce;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -652,6 +663,32 @@ static int bam_slave_config(struct dma_chan *chan,
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
@@ -668,6 +705,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -723,7 +761,12 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
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
@@ -1012,13 +1055,116 @@ static void bam_apply_new_config(struct bam_chan *bchan,
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
+		return ERR_PTR(-ENOMEM);
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
+		return ERR_PTR(-ENOMEM);
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
+	if (ret) {
+		dma_unmap_sg(chan->slave, sg, 1, DMA_TO_DEVICE);
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
@@ -1030,6 +1176,9 @@ static void bam_start_dma(struct bam_chan *bchan)
 
 	lockdep_assert_held(&bchan->vc.lock);
 
+	bam_setup_pipe_lock(bchan);
+
+	vd = vchan_next_desc(&bchan->vc);
 	if (!vd)
 		return;
 
@@ -1157,8 +1306,15 @@ static void bam_issue_pending(struct dma_chan *chan)
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
@@ -1350,6 +1506,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..5f0d2a27face8223ecb77da33d9e050c1ff2622f 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -34,6 +34,16 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+/**
+ * struct bam_desc_metadata - DMA descriptor metadata specific to the BAM driver.
+ *
+ * @scratchpad_addr: Physical address to use for dummy write operations when
+ *                   queuing command descriptors with LOCK/UNLOCK bits set.
+ */
+struct bam_desc_metadata {
+	phys_addr_t scratchpad_addr;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


