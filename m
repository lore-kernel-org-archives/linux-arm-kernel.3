Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F91D7497D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKtSBSYuKktai9lNFrMLMD4oW6B4SqV4qHfmpcs+L+4=; b=4CHb4r43qfQOaKHUk9WU4mOlUE
	yVDVyxLfgvZ4VF/VkzeONS6uZ6YCkVg5KVEmeQhZ3lP2a7icz4pwCqGWjgwkq9uT8WYKrWydwwZmm
	Q93ySnSDtsQVb1PpYyX62cKw63v5AXha9dKjqRIa4MYidTdVhbuWl+sWeC9YtV2v+YW/x4lXFoboG
	CjzxIrMVn03c7gm2a1eVUkRxb1AjZaaHVFq0Jfo+8Hjipw8eyMuwL7e2K1ahUuiYUCp5fIynJ7mHr
	hJ1CcBojJsOX/vSv1fvqRloIqfcH7JqylsLHxuGP29RaQOEzSYkw8RNsKEWGDzgj0RoTIFuH5xSUX
	sSrKwZ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPd-0000000A1OG-21Mf;
	Fri, 19 Dec 2025 10:08:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPV-0000000A1IF-3LCo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c58D3318932
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OKtSBSYuKktai9lNFrMLMD4oW6B4SqV4qHfmpcs+L+4=; b=Ndl0vkEMEUdkCxV8
	N3ed9BiryJrCvZMjeKx1MFoIncdkjYyRZCT7C/1ZPxYsnYJqzcr4qeFxgPrV9AOI
	WcPDq6CJKJCQbzVPFlzQ7Hl+4b2IdLLD5eqhtZaMFUdZWJ61piZw5vvIWcQnfauq
	1ZVeW4ivGuxy4oRT4wLCpDTiObHhwyg8bHNJlCB8+ekjvl+N2d4PtNyUsk5F8ENM
	0um8PGcSFRCulClJxdy4VGo7+oImJq7dptycKgASPHxW7DT0JL00MNtzdo9wl3c9
	nachHeRsG6Z5Pqbe/eMQfpX4r/5ogG5cz43oqrwuH8GbME5FuzNiWzWTPL7CRsIR
	jScseA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2et7cg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee09211413so36210531cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138912; x=1766743712; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OKtSBSYuKktai9lNFrMLMD4oW6B4SqV4qHfmpcs+L+4=;
        b=I/jYxlSjrQZnVYreQVcsYEUg6ajAcbv/IzP7U/TRO+C0u8eft/rH5+sIwjOa1zprY/
         PgOJQ+wgFXa6DS/yP+0JAKTG6YZkOwWA2v7/mJyBLKnN14b6u9ivCT8B1SpqI8SsH7ap
         3/qOg1VJgHzFAeIE39rLcxUNKUjvbLC5kGNhNfVO6irHnJmJHTQxxlGMueMpvcflXWne
         FEgefOpIC9kdWJRCbcJFIAZyw5We+jYY8phfRdWG92PqKtnlCjxf9bgeB2s3S/6Dfjwh
         S3lDPQvTsUr3XjSeAxMMiUrZXaY1ekWcvZ5wlato3ZEXCPhb/3XME6AOcUdnqgwnK8lu
         T2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138912; x=1766743712;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OKtSBSYuKktai9lNFrMLMD4oW6B4SqV4qHfmpcs+L+4=;
        b=esnm6/3J/tW1ddviUcdeLkv/bLr4TKcKERklXywaEIUZ67yjW0BptGKKIBoxi+5mVd
         3fNeuxWn2pMeyd0ky5lk+hHEfqBIv4CgbZiF6mt4VmQTU4IGdOnigYmMIpioS/AMK82J
         0s33KMzYQqmC99UbGPh5fiOfNHZwhFLf8on2Ni09vth51sq+42lSfsp4ED1kiXVzOFX+
         H2kymtWJqGFKUtqOqtnFzpk4mPmjlzok20vB/iWTySs0qXk2zr7S1Y9V2kIsCdF1YuO+
         qqWjSUcMAUVWHqZzLP3xz+vRW2xYf+shN1DigaTZZK7rmiUVMOBu8cc559C8i8H6A7re
         IgZg==
X-Forwarded-Encrypted: i=1; AJvYcCXjwbggc0fbZC7zG+lQNtHmP7ObWdiHLvF+iLLMMS+8pcWwXQ78ash6KKyPTo7A7WhuVSErCnI0ACQoEvJzZT+d@lists.infradead.org
X-Gm-Message-State: AOJu0Ywog6qJ0txg7jy4qc1mTqkPucR8HLhf6Z8TyKSbahGugytsi1hF
	DSH46V4hvcebV0abUSn1tKOowfVI2vpGhYMlGTa9DhVaPzYHicpaJ+sELLe/7s3onjcZ5yTHrwS
	8g5/ZQawajOM9tX3dI6TG/jMYjcIbDcUWM2md/r9WAyHRFDUyTYdRfDn7N26DCwhO/UdHxn0o1d
	f+Zg==
X-Gm-Gg: AY/fxX7HRx4ZKEDyrFLxrR6Wd807rWkDHuAy7OLsors7QeQjO9fluWKXAeb0oaQHPvJ
	m7Bxgz2ybFY3g5Bl4+oTgp1v1iBU4Be0e3XwKkoEqeCknYwA51ikm0koXoe5rMaG4IgV5JHasMI
	ase/Od1K34YsONICHd3HjvSL3DXBjPx++Az8fBfDr2gOBEr364C9ISvEh+MIyFQiVbIkoAw6FMG
	g0X3GAMpDly6vYDHSiECkn1NY586iE9v4BBcN/caaFuYdvZkJCEjpxVkxlbRTKWFa8gdTWHisIq
	C2WrmIaYMLWAQCKvM7HaLXtJvn9xqmqaz6n/k90ws0Nwvv//4d49ymSwE2TnkVNfQmRx4ocYsS/
	YplPltg5yu1q5Hs8T6sEzlBdKLF+Z3fENzZI6Yg==
X-Received: by 2002:a05:622a:1b89:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4f4abcd07c2mr28894971cf.8.1766138911787;
        Fri, 19 Dec 2025 02:08:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx4aU9c/3drBxdTal9gjRRzpkhIFGuTGGDieFoT8rX+8Th5TCaz2tgCfcXi74dOJfJo/j0UA==
X-Received: by 2002:a05:622a:1b89:b0:4b7:a680:2111 with SMTP id d75a77b69052e-4f4abcd07c2mr28894711cf.8.1766138911240;
        Fri, 19 Dec 2025 02:08:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:43 +0100
Subject: [PATCH v10 04/12] dmaengine: qcom: bam_dma: implement support for
 BAM locking
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-4-ff7e4bf7dad4@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5035;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ky8hwlPnsaQJGL7zF3W8NhhDThxLSiaPym+IqXC47N4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQQvsUmiLulYKcMt7Dn+ylHkzG53fkNhxgDh
 wsQHoEoaTeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkEAAKCRAFnS7L/zaE
 w8MtEACG6d1PBtOtnqSSYotH582RdbHlR0LL2ik5vDSIR+js62LAIsEzJoNSGDWvy8NnHWcOP8G
 Hhp3DWitWgvuwBJav0rMhIrnnM5I21v33l2BozxeaehaaDe0qrKLbXXjiNY9oyeNk+RL5nKlImx
 hO2q7/2Gi0RxG8clBEpwLIf7hz/Fj7fRuDHGOayKJEU7DrclDToToh2lLeIH0pRmgqGOEKrYhps
 4Ob6kEhPgaYXhxZjSTgm0vd0nH18qcFtoHeqE/uHqsVOQZo9Ov6W54OU97ezQLev03fTOpoEISA
 CN63bP2hoXRb3jSa5mohRAaFwMOfoeyOf0gaDTqxAzBYVZL4DgGSMgy/p9CkgamWYd40fcvdTDC
 GU9ruIpkUtziXSF5ARJo6PY9pHZFuAUoimF6snHTxDY0og30re1TIUQM7zoxWKRTghcB9DvvPPJ
 KBzuu1B27Mhc69Ua+wR2Xq2efRxGxAqI1zbWngLUA32g+Ezdjbj7VnZayBxQflxDSncJFhye54k
 udwIt4afIkVdlnwrSacKjywmYp3mP1dxlI/ZkHSCnM0sWsKmzAQ0+WTxraBpJ8ZndtJL3TfmGo6
 GTUrxEIxSpIsIoqNdOhO5o5iV29MjT5/nQ+jjcTCv9i+oyFaqMa838CIku+L5qedOjfPnb4Znno
 vAPKN4X1W+sA6QA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 6lAmMjTLQVagQan-kmiyX2QqjLdTsMI0
X-Proofpoint-ORIG-GUID: 6lAmMjTLQVagQan-kmiyX2QqjLdTsMI0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX+ld9qWNlVHEs
 2pTVE68iigsCoZwpeKrQGy4UYL64hYNt2qMuAi0X4KpEhUBrQeSHwqrdiVcIFYwRPV7UBKgWjDp
 mC/7ZYkwnIHO3BrKqg2Q6jghmWOWygGeB3xE8OxuHaa7nWlq/ZGT4Wgc0arHNny+fVUAZPtDCZV
 +nG9z6WjcBAHiZAuo6qG3+UDEibvj+q6mqA9YfU8MaEScI4871+ufbJ36AS0S0Ls9Yz2yG19X8h
 F8dGtMSFQwH9I5L+WKkkgJAq1s7nkXiKLLEbH+HPirWb/H4MXP8xNXQOkpl3r9AVYj9cPWptlRb
 y8RV2UFqSGrtbGFCLBCPEb02NnOXmrJV7u9prynelzKnSsa6snXh4o0lf4Vcg6MCnQJUnSqmN2a
 8aYabW9VBahMOYZg+yYAdbpC1TpaWhVezcqn0deAmjNJMcfVtwkezBEIqi3kUB+mWHOuX1vCOH+
 JfNY78zSTGkgD/kbS6w==
X-Authority-Analysis: v=2.4 cv=Tp7rRTXh c=1 sm=1 tr=0 ts=69452420 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ff4Q2WZ4h2nLullQlX0A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020833_977253_B916C10D 
X-CRM114-Status: GOOD (  22.67  )
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

Use metadata operations in DMA descriptors to allow BAM users to pass
additional information to the engine. To that end: define a new
structure - struct bam_desc_metadata - as a medium and define two new
commands: for locking and unlocking the BAM respectively. Handle the
locking in the .attach() callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c       | 61 +++++++++++++++++++++++++++++++++++++++-
 include/linux/dma/qcom_bam_dma.h | 12 ++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 0ce9153da67032dc8ce910f68d1f80019d8b29f4..e35fc73a53aaa2a6b999b189add7d72df15ebf0b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -28,6 +28,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_bam_dma.h>
 #include <linux/dmaengine.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -59,6 +60,8 @@ struct bam_desc_hw {
 #define DESC_FLAG_EOB BIT(13)
 #define DESC_FLAG_NWD BIT(12)
 #define DESC_FLAG_CMD BIT(11)
+#define DESC_FLAG_LOCK BIT(10)
+#define DESC_FLAG_UNLOCK BIT(9)
 
 struct bam_async_desc {
 	struct virt_dma_desc vd;
@@ -390,6 +393,8 @@ struct bam_chan {
 	struct list_head desc_list;
 
 	struct list_head node;
+
+	bool bam_locked;
 };
 
 static inline struct bam_chan *to_bam_chan(struct dma_chan *common)
@@ -651,6 +656,53 @@ static int bam_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
+static int bam_metadata_attach(struct dma_async_tx_descriptor *desc, void *data, size_t len)
+{
+	struct virt_dma_desc *vd = container_of(desc, struct virt_dma_desc, tx);
+	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc,  vd);
+	struct bam_desc_hw *hw_desc = async_desc->desc;
+	struct bam_desc_metadata *metadata = data;
+	struct bam_chan *bchan = to_bam_chan(metadata->chan);
+	struct bam_device *bdev = bchan->bdev;
+
+	if (!data)
+		return -EINVAL;
+
+	if (metadata->op == BAM_META_CMD_LOCK || metadata->op == BAM_META_CMD_UNLOCK) {
+		if (!bdev->dev_data->bam_pipe_lock)
+			return -EOPNOTSUPP;
+
+		/* Expecting a dummy write when locking, only one descriptor allowed. */
+		if (async_desc->num_desc != 1)
+			return -EINVAL;
+	}
+
+	switch (metadata->op) {
+	case BAM_META_CMD_LOCK:
+		if (bchan->bam_locked)
+			return -EBUSY;
+
+		hw_desc->flags |= DESC_FLAG_LOCK;
+		bchan->bam_locked = true;
+		break;
+	case BAM_META_CMD_UNLOCK:
+		if (!bchan->bam_locked)
+			return -EPERM;
+
+		hw_desc->flags |= DESC_FLAG_UNLOCK;
+		bchan->bam_locked = false;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
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
@@ -667,6 +719,7 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
 	void *context)
 {
 	struct bam_chan *bchan = to_bam_chan(chan);
+	struct dma_async_tx_descriptor *tx_desc;
 	struct bam_device *bdev = bchan->bdev;
 	struct bam_async_desc *async_desc;
 	struct scatterlist *sg;
@@ -728,7 +781,12 @@ static struct dma_async_tx_descriptor *bam_prep_slave_sg(struct dma_chan *chan,
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
@@ -1356,6 +1414,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	bdev->common.device_terminate_all = bam_dma_terminate_all;
 	bdev->common.device_issue_pending = bam_issue_pending;
 	bdev->common.device_tx_status = bam_tx_status;
+	bdev->common.desc_metadata_modes = DESC_METADATA_CLIENT;
 	bdev->common.dev = bdev->dev;
 
 	ret = dma_async_device_register(&bdev->common);
diff --git a/include/linux/dma/qcom_bam_dma.h b/include/linux/dma/qcom_bam_dma.h
index 68fc0e643b1b97fe4520d5878daa322b81f4f559..dd30bb9c520fac7bd98c5a47e56a5a286331461a 100644
--- a/include/linux/dma/qcom_bam_dma.h
+++ b/include/linux/dma/qcom_bam_dma.h
@@ -8,6 +8,8 @@
 
 #include <asm/byteorder.h>
 
+struct dma_chan;
+
 /*
  * This data type corresponds to the native Command Element
  * supported by BAM DMA Engine.
@@ -34,6 +36,16 @@ enum bam_command_type {
 	BAM_READ_COMMAND,
 };
 
+enum bam_desc_metadata_op {
+	BAM_META_CMD_LOCK = 1,
+	BAM_META_CMD_UNLOCK,
+};
+
+struct bam_desc_metadata {
+	enum bam_desc_metadata_op op;
+	struct dma_chan *chan;
+};
+
 /*
  * prep_bam_ce_le32 - Wrapper function to prepare a single BAM command
  * element with the data already in le32 format.

-- 
2.47.3


