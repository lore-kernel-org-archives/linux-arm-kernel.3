Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DCCD7497A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0dPg3aNLiLTtsdk0ITTnyv16WpxcQbHRFBRuopaNp4=; b=Mfc20Aw3ClNEpiFbyU5KkGzJWH
	Aw3ucChaF9N/JJ7rYUHm8hzeloF9nbLGFsWwzzJny9jxr1yINbFJpoluF8/zHJYd6K5FM6bMnDGju
	TyZjmpADzgLR3xZx/nwfi/sjND6piYeCAFewh7TbEMEpr1h6tdoLI1vHRHxqgZ6P82W7OH7TMljYA
	mdQ+bpLiJdb5dZbJ2s+706oy9dk5g+Du2TiTA+MrsCfDqXjcx7rqPZ9ilR9e7dFpKKXvvObpXp+n8
	XEECReuK4D3UWP0/BUA1AE8MBBxVlzqQDtYZsm9xVaEmLiwBdtZ74dlSBpX2YDi/4OPV4kKQyQMpx
	oEQFtBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPr-0000000A1e3-1G1d;
	Fri, 19 Dec 2025 10:08:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPh-0000000A1Sq-1ACO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cNHu091968
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0dPg3aNLiLTtsdk0ITTnyv16WpxcQbHRFBRuopaNp4=; b=hxsuMCAabSsoZhh3
	A1coZJMjFeJ4AUI8Vun1G3+OtGS9JwexKQ5XyxD++pqPyBkVY0l6ra/jfnmBwdsu
	wujaBvUDQs6Kc4uWUq/sOd3Y6NqYe94SlGF77CBFYj2/xPdE4twSMCq3MQhRDRSX
	5YmOUZ2Y5IuEZcgfhFDsjRzNhN+4mqQJ4Ssw/djbDnuNVVJuUaLui3d6KV4KQlv3
	g5//gamYxKzlaCN/TpBK4kcO8Cc/9W2Zb0Z/RvUqtORCGzjnZt3RgEJX+19nVg+K
	k0gfyT7k3DjnLCn0IDovSK56sHNcBT+txKoIeY1UC7qqFtsPxMvPj9c5JsbwphPC
	ShN/tQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ea82x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0488e746so31335431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138923; x=1766743723; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0dPg3aNLiLTtsdk0ITTnyv16WpxcQbHRFBRuopaNp4=;
        b=fD5ZJ4uA/1cEmrWnOvCcQboMrITD8qYK7/bDgUNB25CvxQQU5B7thIVcfy3k5phK+V
         Ag0Z0PEqnApEFWJ86nWsiG7iHA9g4XbYcvWF6+p6cQaVDYBDJ9/a9xT0wZR45dJ4HY4X
         ZxL+HDMcMzbzwAQhD4JloLNoaHgmH6C8xvtgj4+wZONga7ZFTVXum/Sn5vynQMke8H/2
         pqPrcqqornyGiaARgbuGmYcjrVlHCojiMCE0QWDmo3VertdS1Mx0USKMXlzZRT1VYJwt
         sR+2hbgMoqld1d3c26CzP36KBnDx7CEU4i/9+YCFGIHZ6ukn9pMNqOjHWD2T18DjDwJR
         kCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138923; x=1766743723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y0dPg3aNLiLTtsdk0ITTnyv16WpxcQbHRFBRuopaNp4=;
        b=pcR4RolrxrQ13nLP7LDw55CJ+B47tjhng+GDimt2BEf+HYnA981SY9Q46Z/6bSCKA9
         DeUXgqROJy5cIiupbz5APIvGzyPwO+gFZPWSfvR/wS5aayIY7sLEYT+Hv1JnUcFT8Mdq
         DoH7eJMe/DIPHOuV1EeXVTK0Wc8yRW9jJFwP5ZrBVCmW4m1bKODwUU1JD5HXg22Y8hmo
         Z3YePJD4tuLpdv1T/IdI9pe79WFSxm/Fe+YKtt5CgicmlCthqOeLfdu76c+UetdzRoOR
         nxugKgf/7R2/0buRIVHUnt7nGAl1TbYl4X1WaVUQz9SKQqXPamCW9ZOrdwsXB+av1qtU
         otVg==
X-Forwarded-Encrypted: i=1; AJvYcCXPDBpkznZ6J+Rmi3JnRultQ73X2ITsPFjGnHwm6N/5nTn/m42A4TbV0aq6jRaFEPfz7Wdww8fZzZNtc292Ws72@lists.infradead.org
X-Gm-Message-State: AOJu0YzBhVNZ61ciBv78DHPgd2oATS6kVuSiKHgjeQ+/RWgKJXnJU3Us
	8TedpdJwM4/+CMPDUaLS2xqi+3KPbS/hqXg2kgKjysGqBVv4wCa1yLVN4VWkg+FUh9z0EbFwxF+
	z2iooByh97BYwTGfLAmfbU1rQrmAJGcTk66W7FGqlSpobWl5w8u5qIj2irHM0BSm1JPe6OQ8Iph
	sfaQ==
X-Gm-Gg: AY/fxX4YcHmNyDj/0PjV++Ln8nfktXV91xgou29vtlSxqf+Ko96BebSFb6qW1TdCOOK
	QhK63hpCOFzxXhT80grrv8gxEpnzRD/UwnPUo8O0KXKoHspatETHANW+4JhehF13e0WQM/V5XnL
	G8dTmJ0imHFQn5dKb64E3t9yBz+XKVo2hwcBMzFeZ2CG9DFE15NWoV7IlqbKNp/8ZbI+PSrxTMY
	0wQoOXjNW+/nBKQ2N4sodnnIpFhwnFyFmhyfU6q3YKQIlZfOVs5yLGF0MQwi7m/n7ovffiRaWWS
	4FivhrbSgoztJ5IR0A1POhsH9MNj4C0MgmK194Omn1id9tDD8TEbWJ5O4g4/ezA4fGBu9qXnEyT
	fmHRQQFrql8STxrTcjibSxmjfs+ydjPfKUNvMUQ==
X-Received: by 2002:ac8:5a81:0:b0:4ee:26b3:e512 with SMTP id d75a77b69052e-4f35f3b7834mr80035301cf.13.1766138923346;
        Fri, 19 Dec 2025 02:08:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWmwccXEHRM9v2aDIxhb+uD01c1pI0hDhCZLedzGqHYSUDciKqhQk9iB2ZCgb+x43vK5KTxw==
X-Received: by 2002:ac8:5a81:0:b0:4ee:26b3:e512 with SMTP id d75a77b69052e-4f35f3b7834mr80034911cf.13.1766138922913;
        Fri, 19 Dec 2025 02:08:42 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:41 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:50 +0100
Subject: [PATCH v10 11/12] crypto: qce - Add support for BAM locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-11-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4424;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RSOjSpLnp8hi/ybwzozpW3l6rKGzZUMhQm0FWWcI8KA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQWPM7l/1lxH1CHPiAiUivnAjDvIqDU2EKcd
 9WfR0ByfmyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFgAKCRAFnS7L/zaE
 w7tBD/93y0Vezj07ev44/k1PnOo5R6g+0U3UsZXM3EyOhGQ6tKFjY8j9VB2pGGYBnj6889zxNzA
 ZJyXzIrrPNrHBSFoXOw2sXRhngdqFnKWAVhv6ZDfIV9mnMKAZ0fHAAqa2jVoHtfCodf22IEB3at
 QrNhIgtk7J70l5uPLN4cEpCqYEerjH2VBGzCIFq1y+jsJHIAQi9lUaJDf/7Znntk6v0sKRK8KF8
 r6pQUwNji1+xCr5HZW214hMkzi39bMW+ZxILe0Elksoq6DKxvPNjA4n0wovcld++EojDdCQPJos
 i/eT7it5Pm1fgy0kB7WqMo/zTAedD22Ul5vbDTZr9XNbUuxW0ahd2UGEZlB09QYngJN5JqJpZF8
 Ya+djp9ZSSQsJ8MzvrA8UycCb2gVvPAzUGYZYXHNsDB+7nk1fNI+LBFdwqrtioPuJHmS1cC/t77
 KmCw1nlpLP9dNS2ok64KVZQYnGWOX74iO129aN/mQPz39zk373B/938cKXXOIpzdqZlb49RSL7j
 yk18DjlzMtK2oZ2favstKMmsobPCZ8pndKnoKfvX5fGbNhKXUmdK7J93o1w4dbiktbdAAYFTk3F
 uG42EiO/AcPi7p7BYd09al3gutN/dyDmEjgcpQkI6zlFVkIUp0o0EOqmt4Z3+ybWSPsc1uZEqq2
 2Pq3PS9sgsIhWuA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX5Nskf96RmW9z
 Rtyka2GAX+LLGub6rGB3hUozbf8shv84r+iIzjdBZbOavI+hHu+xCm+UZwHFLQSuUBzN6fvnFHa
 9eVOAnSnaOzEMlAxgV8wNIYqpYhNMJKjkrwrN5jIeXE1KrCR1WAOg6LF2FQXf5PueZYekWsQVUx
 ln4PLoZNOjuKWimeVLaLEYAxwdP1oSpmK9GTNWqUbSTsEMkpX7fzr7k1z6vMJvCEwNa22Nw3T4p
 ci42bW69LEW2imrULBQ0t6XCYrKqBJzt+GyeqW9wxSZatUp4ZoevQAs9nfNVBvk04GLWj7WSfrG
 vLqVWBCYeF/G/KXB32SD3rnMd3DpFXaGpMxfAytVc4TQm3lfEQkqphqg62hHXA1CLTbJ4gm3rxa
 YaG1tE4IoPeLy3S0GEJ3O6P7E3VJ84NCOOcT5fX5XRyeac2CQHrwYPK8KscL5D+fI7wo9CxYfKw
 sJkfi654X06IbOE+63Q==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=6945242c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=E80RO7-gMyMBa8V4svAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YXJOS1L2BgZFIImZ5Fh6bPTLlHfJUs2w
X-Proofpoint-GUID: YXJOS1L2BgZFIImZ5Fh6bPTLlHfJUs2w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020845_460436_2FA00CCF 
X-CRM114-Status: GOOD (  20.29  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Implement the infrastructure for using the new DMA controller lock/unlock
feature of the BAM driver. No functional change for now.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/common.c | 18 ++++++++++++++++++
 drivers/crypto/qce/dma.c    | 39 ++++++++++++++++++++++++++++++++++-----
 drivers/crypto/qce/dma.h    |  4 ++++
 3 files changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/qce/common.c b/drivers/crypto/qce/common.c
index 04253a8d33409a2a51db527435d09ae85a7880af..292fb3c7bbd3d6f096bbdc3c66d37d11e9ea109a 100644
--- a/drivers/crypto/qce/common.c
+++ b/drivers/crypto/qce/common.c
@@ -593,3 +593,21 @@ void qce_get_version(struct qce_device *qce, u32 *major, u32 *minor, u32 *step)
 	*minor = (val & CORE_MINOR_REV_MASK) >> CORE_MINOR_REV_SHIFT;
 	*step = (val & CORE_STEP_REV_MASK) >> CORE_STEP_REV_SHIFT;
 }
+
+int qce_bam_lock(struct qce_device *qce)
+{
+	qce_clear_bam_transaction(qce);
+	/* Dummy write to acquire the lock on the BAM pipe. */
+	qce_write(qce, REG_VERSION, 0);
+
+	return qce_submit_cmd_desc_lock(qce);
+}
+
+int qce_bam_unlock(struct qce_device *qce)
+{
+	qce_clear_bam_transaction(qce);
+	/* Dummy write to release the lock on the BAM pipe. */
+	qce_write(qce, REG_VERSION, 0);
+
+	return qce_submit_cmd_desc_unlock(qce);
+}
diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index ba7a52fd4c6349d59c075c346f75741defeb6034..885053955ac3dc95efefef541907f57844b60a3d 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -41,7 +41,7 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 	bam_txn->pre_bam_ce_idx = 0;
 }
 
-int qce_submit_cmd_desc(struct qce_device *qce)
+static int qce_do_submit_cmd_desc(struct qce_device *qce, struct bam_desc_metadata *meta)
 {
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
@@ -50,7 +50,7 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 	unsigned long attrs = DMA_PREP_CMD;
 	dma_cookie_t cookie;
 	unsigned int mapped;
-	int ret;
+	int ret = -ENOMEM;
 
 	mapped = dma_map_sg_attrs(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
 				  DMA_TO_DEVICE, attrs);
@@ -59,9 +59,15 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 
 	dma_desc = dmaengine_prep_slave_sg(chan, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt,
 					   DMA_MEM_TO_DEV, attrs);
-	if (!dma_desc) {
-		dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
-		return -ENOMEM;
+	if (!dma_desc)
+		goto err_out;
+
+	if (meta) {
+		meta->chan = chan;
+
+		ret = dmaengine_desc_attach_metadata(dma_desc, meta, 0);
+		if (ret)
+			goto err_out;
 	}
 
 	qce_desc->dma_desc = dma_desc;
@@ -74,6 +80,29 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 	qce_dma_issue_pending(&qce->dma);
 
 	return 0;
+
+err_out:
+	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
+	return ret;
+}
+
+int qce_submit_cmd_desc(struct qce_device *qce)
+{
+	return qce_do_submit_cmd_desc(qce, NULL);
+}
+
+int qce_submit_cmd_desc_lock(struct qce_device *qce)
+{
+	struct bam_desc_metadata meta = { .op = BAM_META_CMD_LOCK, };
+
+	return qce_do_submit_cmd_desc(qce, &meta);
+}
+
+int qce_submit_cmd_desc_unlock(struct qce_device *qce)
+{
+	struct bam_desc_metadata meta = { .op = BAM_META_CMD_UNLOCK };
+
+	return qce_do_submit_cmd_desc(qce, &meta);
 }
 
 static void qce_prep_dma_cmd_desc(struct qce_device *qce, struct qce_dma_data *dma,
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index f05dfa9e6b25bd60e32f45079a8bc7e6a4cf81f9..4b3ee17db72e29b9f417994477ad8a0ec2294db1 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -47,6 +47,10 @@ qce_sgtable_add(struct sg_table *sgt, struct scatterlist *sg_add,
 		unsigned int max_len);
 void qce_write_dma(struct qce_device *qce, unsigned int offset, u32 val);
 int qce_submit_cmd_desc(struct qce_device *qce);
+int qce_submit_cmd_desc_lock(struct qce_device *qce);
+int qce_submit_cmd_desc_unlock(struct qce_device *qce);
 void qce_clear_bam_transaction(struct qce_device *qce);
+int qce_bam_lock(struct qce_device *qce);
+int qce_bam_unlock(struct qce_device *qce);
 
 #endif /* _DMA_H_ */

-- 
2.47.3


