Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E19FD8779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=; b=aAhQzVURP3vW1EeDTLZ7GS69bU
	N4BWkbT5nCX90o37nFZzLj02BN/U2wFu1sABG41UuRP47Mf9lcZfcilZaEfDed94GfrzQPzkh9u/c
	HBYFZyeW0fqmQzIdiAHrCsFX3r8tixKzydGjdhmWHzcPgpQ05OhfSRmRboCgZCIJ1QiIGet5PmH+p
	xPkg1okK8yvRptidurm8CLPrE4KdDRQ0TxPnyjCxeKOo+cjLcSNzS86o3LQGfgSzqNjy+qJeus3Je
	ZtnW5OyRAGFtoCofzmFGYulMac9KDDVc1P41ksiTAYVxI+o+nKciUdXCEPiXVgJFJ54qysy0SxoMc
	IwG74HQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0P-00000006Ui0-25RD;
	Tue, 17 Mar 2026 14:02:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0M-00000006Ugf-3wz6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:02:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HDnHJ03124248
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=; b=egUMiK6p95gLK7Ec
	5yzvhek1Xp4HHsGJLveD9OYZn9s+ZM88kQOuR8osYzh+E8bXlTALwGwdq1FRyBLN
	ib244BKpyu7pqR7j0/dR6+Et3+mE0LrObAgi28O3fkJv7s2CcgQ9gr/YpzBpqGy6
	d+hog4tSifnJv2iwJ124JwZ7ORfP9/56xQ1dWsKl9/g/Ttwmklh5lXgJvSPLe87d
	q4hxzdwBouGbBEaXe8rIcTf1B6QW59VKt3mPPoIQLyCxyZqKP8jdonofAeLDiBON
	+jx1IBxeMPrSbQCwgsXPyVfUMO2k24/FS001m6J98GPzLByiDmwaFetjymtDYtZk
	vE7nNQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy2fbse6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5f934f736d4so1868692137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756161; x=1774360961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=;
        b=TVkyZCyUGb2INZQOsgOsVZRi+S0jDk5xgCQd6WxxHJBlJ5hw2fXcco7Lp9EXRdC5g+
         1pEcxhkkS+Z25CKF6ovN+OCVFSW1W1oFfJkKwXzvp02E92APl5DrvdnfGuwQUXVOY5yG
         EGjCNvlsn6efLkqdG/Y5citWZ3pLenIi4BI/IWQXbHVHmHzUnP44qJ8Coo/l2bnjTGdv
         paCrMnLcL0TTLHAyZ1MkceoOMpB69hdOEMRDcGPe0u2FrguRYkcWJD8W01qYPWBQeqYC
         7GEG+EopBOCV/Di0nJ0KCgpeyLjFSv2ww4jL1M32PB1UvQsW100j3UEoBjJr+5q+A8+W
         paRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756161; x=1774360961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OOwdxQEYbJ9Or9A0mYUFJoOOp6SzbaWszXsvmPmeoCo=;
        b=pY8Nmh+PTpDhn8W2Wr+Gu7or8fzBlaiTfsnDAzAOquk1/1ERMVoq+a4E+8jlS/cbge
         70OaWiWvZydQZZrVOTkFxwa3Z7zukL7AWviNkOYMfzyYMk6HxY+pQWGE/4KMggkCBeNu
         W3HTNVRPljgIo0SLl6gUH6PmUubt1DHcJvcB0xWIXgTyiQ4IyBB5XOFM3woONJcR02M0
         fAy58lOtnqBuqtHO/cF1yhthuVCTW+BAPtz0L9dh6JF0lhe3ZZ+8o9tcAATvEM/QpWOG
         Qq9UgMKVBJXo7UNs7JhAklWi/X13d4THaqWtjFQemvSHJ57pvRCSS7dWj8vpkkzhxYgk
         yleQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKZ3rNcOURLSu4m53pOlfRAd/woZbPc7xEBdIlIvA0SlD+/hTkHNB8+O7BaGHGdEBq1af8OVhFxbxQv4sj7cpX@lists.infradead.org
X-Gm-Message-State: AOJu0YzTg7scwTGjsYY2boqCW87b/dBaryCJR4powekgakRzMbSvO7+u
	sj2ggEb+iGOHipoBgii0T5eSEiMdugjgFUo0i0sDfR+KM6inv3qCOwV/zuwzrPIaNMCiLLZBj+m
	kw1zrBSBnrrwW/x6WFZfEH3v8zs6WwPGUHT2Sqod1GTPoiESVKocAPGy2VNeSyg7V+UFAL+qDhQ
	Ecbg==
X-Gm-Gg: ATEYQzx9qU6JM1sDOCGFurObwz4uT5CTyl64YM7/lpO5hBgmnjBO7A6AYiMlHKU/119
	oRYXlwZEJds6+UPlSw82xNPVFza61puNYLnL+ZNwjKhsynudAamGHUJ2VwVWA/OarGZDhE9lZSn
	Ci+lLhsTVHSmBoQjw4P6pY3e4JO6NamRajpKdrxI3FwNf8JnhkyeHep3iowXwVp08dGPc/goT//
	Pjwb5CIXRNrWefOZL+4mmC1Zynb99wwN6R59nSNriFjAudY6O2jk0agbWkAH93vJNBVfAyNQ8VF
	J5WlsQi1L9RTNNqJnuL43yQY4pwZSV7PJXUGsjiQ6xrRjOBuoNSmfldplf6ufrgQf8i5CUientn
	ZHxFQ9+UTqMhtpkRdlGvQQFU9NjCi5EVmE4AeMlQFDlnWpZlq317P
X-Received: by 2002:a67:c994:0:b0:602:6e95:bc82 with SMTP id ada2fe7eead31-6026e95d27dmr566476137.33.1773756161185;
        Tue, 17 Mar 2026 07:02:41 -0700 (PDT)
X-Received: by 2002:a67:c994:0:b0:602:6e95:bc82 with SMTP id ada2fe7eead31-6026e95d27dmr566403137.33.1773756160622;
        Tue, 17 Mar 2026 07:02:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:08 +0100
Subject: [PATCH v13 01/12] dmaengine: constify struct
 dma_descriptor_metadata_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-1-0968eb4f8c40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2295;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/kExSnp4gLekFUspVMuJp40Wa32cu/zESSu6vck61c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV7wh7HuGH5/DCVeb0SkWUTqB0AF86dPpu7g/
 72XbdlMm+yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable8AAKCRAFnS7L/zaE
 w9XrD/9DdkZCvQqumSRBF+lrFXBsxZxYUgEXfN+mreAzhSLJYbs41bwA6vMJqx2u/xa74pIHcRI
 E6X2kn+0sMgaqUZUFnbGghcb8lvX6u0/D3PPxuDpMbrRK41KGkpWrVqK66I2pMLSGbGAGqrb3Jm
 riFP3OW34JDf85ETjMlsvsSkhvH1vQlbhjrb5zKwExnzF3ZhyFsp/Z6ykcJfudt7pgsz1e3Qnrs
 CxaJXHaW8VVAg700d6BOQcZJLJwiz8WZvl19u6ls+uZpp80IbSC0N+b9W3KzYGGpPJ7oC/UQeGj
 Rm3VYVFcUVta9/EolEJKIDs+GKNzfWUYN6/Xh6bRzLzhIWcU/QvdjfzCY73ViQd3x62jGrfst98
 SiHa74zHS1wdck0v9ZVzg3z5qbhjH53km5ewIJS9LWxG/h4ttLL1HKFpunJMxnSa2p94VfYrwVc
 IloeSDr51fePrw3ldchplm+0St42EqZzB05sgomDRO+jcnCc3IqYuffFALsoFTEbOztegE1k8Bd
 KNWHtxAyws1j8ykk0purkFy/LdSOKOUiBw1G+wcFznNp4NrFZF7GhGcUYYfsjcuIpBsDc+aDk5W
 3SAKF385mi9hge5rDMti7WMIqSN3jU/WMTo/z3CDmfJRSFJ8fRaNxrTssIqdHVODlc22dJWP9/N
 UtxRbRqtQMgBn9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 7CLU2IRP7Fmbaaz8VQpWQvbyLDifwNvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfXwHantU7YmXjI
 TIfbp8TRaTTXyCMzDwX5tbqopqGKBG+mXZtXIXxDIpxD5r/rOuHacLaRMtyAsaFPpHVmPVcm+qW
 14TjFmncyndJgS2SIREcFm0JVNmOO9x5kGrvc1RzH+s1MuCpYU0Cw7G4K7Eeea20dODC13NSn+9
 5hia4ZdcZ/70g3D2XsyQSWeIULBd29OdViJVUCE5E8ya1MsDNnUzILMkbFzi/0WIUQ0KDgscEUR
 qI6f27Lqq58EnJgWylTWiylk78ggvWqaDWA68JIAl2CSIY0rjC2c9tRpu9+VBOZ1+BQ819GlVzx
 QG5daaNPCJrHiIH1cDZgVt1prxjMet0zOBcuYfYfXyJF4eWgjOaheFYXtej7ZyhG4k1GojRaP9f
 WFMJs5xITFwMZvq/q8TNXJPgfUamLNw1NknOcEWvC1yrQ/7W+Q54Lozvw1MmW7GI+X5HZEYaBMj
 x303kSxX7S8K3JOyZLw==
X-Authority-Analysis: v=2.4 cv=fa6gCkQF c=1 sm=1 tr=0 ts=69b95f01 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XeVHrwws4l7kqE2Ex6IA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 7CLU2IRP7Fmbaaz8VQpWQvbyLDifwNvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070243_099691_2C8B62B8 
X-CRM114-Status: GOOD (  15.82  )
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

There's no reason for the instances of this struct to be modifiable.
Constify the pointer in struct dma_async_tx_descriptor and all drivers
currently using it.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/ti/k3-udma.c        | 2 +-
 drivers/dma/xilinx/xilinx_dma.c | 2 +-
 include/linux/dmaengine.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b68d86e4bbc9b62bad2212f0ce3ee9..8a2f235b669aaf084a6f7b3e6b23d06b04768608 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -3408,7 +3408,7 @@ static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
 	return 0;
 }
 
-static struct dma_descriptor_metadata_ops metadata_ops = {
+static const struct dma_descriptor_metadata_ops metadata_ops = {
 	.attach = udma_attach_metadata,
 	.get_ptr = udma_get_metadata_ptr,
 	.set_len = udma_set_metadata_len,
diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index b53292e02448fe528f1ae9ba33b4bcf408f89fd6..97b934ca54101ea699e3ab28d419bed1b45dee4a 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -653,7 +653,7 @@ static void *xilinx_dma_get_metadata_ptr(struct dma_async_tx_descriptor *tx,
 	return seg->hw.app;
 }
 
-static struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
+static const struct dma_descriptor_metadata_ops xilinx_dma_metadata_ops = {
 	.get_ptr = xilinx_dma_get_metadata_ptr,
 };
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 99efe2b9b4ea9844ca6161208362ef18ef111d96..92566c4c100e98f48750de21249ae3b5de06c763 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -623,7 +623,7 @@ struct dma_async_tx_descriptor {
 	void *callback_param;
 	struct dmaengine_unmap_data *unmap;
 	enum dma_desc_metadata_mode desc_metadata_mode;
-	struct dma_descriptor_metadata_ops *metadata_ops;
+	const struct dma_descriptor_metadata_ops *metadata_ops;
 #ifdef CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH
 	struct dma_async_tx_descriptor *next;
 	struct dma_async_tx_descriptor *parent;

-- 
2.47.3


