Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0214C98309
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 12:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZGjRR4bE84GpahnnVxSpqzzsPWMTO6jcs8PAfT5Of0=; b=Q0wlREUGe2iDjtJx4drkTDsmid
	CiTWcYePc0G7YQZcyt4RYs4vrdaiUKDfTmb/Gw6SLGCxmS0fMbcPC8N7b3zkBvFMRzmQaAIILsXTK
	LIsjEJCn7Mx+qFIDp1um6YE+YCeyIpIAHmOdPVCbyRbzAd0iyI4BHyL354ObZ8TRtjIqHRrm9t4jT
	IFLd92mqn2Np+ghaCQpbgxN3Nngj0CafyFbM11AgILsik0Gxg+NGh08i7Igim209OMIq290O2d2m+
	VIK4NK5hVPwRmgRN0/pECvXB2Uzsa33vbfc3/89VEC4KWUfDA3rsRdZI+OwVBC4UKijf0GXSNVxtI
	bO6BJZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904s-00000005OFT-0VLC;
	Tue, 22 Sep 2026 12:58:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x904h-00000005O90-0UEn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 12:58:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPeC3269221
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XZGjRR4bE84GpahnnVxSpqzzsPWMTO6jcs8PAfT5Of0=; b=ahpZQs+hgJ4BnWqy
	r8zDxs3duzjY3RBW3GAIJNncaKRe0LvW9yrJhn+ao99tuVzozHn4/h154+nZnTcF
	U7b99wBu9IGObJslPHDGA5Trpi08MonY4f9+09ree4qTCKP080G7RgV3nv6bkm1b
	a/cLQQlRMmazgwTAypPLTnbwaFb3fTE//UPo6xy40rlHoZf7P4/1TckVB/4hrUnt
	XxpE60a0jtvGOsqD1bR1wnM+CWdzqsIP7Rd7MCMia1ChXTtZF5vDHlMYLudJOWAs
	zjB66mP4yRaBw6ZVeV4kgvney6Q9B56n3YnJu6WBpHNSdxTroLaVMBDhTt5zAWsE
	wj6IIw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gufbatqdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 12:58:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c8337b12d0so1340831e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 05:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790081897; x=1790686697; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XZGjRR4bE84GpahnnVxSpqzzsPWMTO6jcs8PAfT5Of0=;
        b=V6RfXz/r8wFz4Xh6yaZG01Lwt4/f9KysZnU9aojl7HeW5lp4sXoHrXRgYImm9DsnAU
         iLaSQCRATi0pwlkXSiLXYApD9l3g3OunD0tGvbWGw/FVZMv9FRmnlSl0L9YxlpxQm/n+
         fVYaDM265SOB6Is8qitl5evf4fKqOgcTGUzJbigCAYQulFYFbDkFYdEUyikOZMGQwZlM
         P8jk9s4Mks9iYJwuyUzoYqDJEN7Zxh1qzf7d9VahXIZ7M/gsff7h3tshP2SHk+NEDj3W
         HteFiq6wqtNxqc7ok3N3WyhbT4P7AN96RlA6x3udwrseyOB867E8PbzmkrwlG1ZX1vUa
         H5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790081897; x=1790686697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZGjRR4bE84GpahnnVxSpqzzsPWMTO6jcs8PAfT5Of0=;
        b=HTR0uEHugSP8PUBaEpeLMdN4xwAez6KO2J+tnoGWRau2rpm0Sgk30VFDYrOmTozpy5
         6O8beSSyqq/bPfSKu5KWyc/YrNyW0RkI/v3GzkDaTrHQBOvzmHO+Jmmeiu5h45O/f3Wt
         DtWERezv1jbTHGrPXSYmEyIZHVjiLbLscCVbtfrfGVxFJM47SRqq/5jzEtkwItpL5Ftz
         aDl39ci+lzsYBoMzrghWilJpE81evvdeJ4Xn5T7feSWnkYe9Au72HMTMOEqeipwB3LB6
         1Z7zXNCguBQP+ppBCQnQXNGR//ZYbKckeHYMlQ+IEotzQvV5/PDVIrME8iz0yht25H6b
         zENQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhe+06EczOFUrlOPrS23JY9K42SfLcn34iSKGdMZjrMAnGrHUrgUqORsHCmfQekUmEmRvh21Nlu9adEtggYJ2U@lists.infradead.org
X-Gm-Message-State: AFuF++n9cYAbGvepZRD0PFDY1BsWwhrMXIOHK0zHkbN+tcHCuNdojt0M
	QTyYCsHAS+YO44BZAy6GInFTKd/ce79iaJDfl2SXi4pR0j5crY6zxHe2z9GRwV4vxtS8JYFK0mH
	4dZO2OMul4nb2YHDK67HOjtqHitZTdmav86d/yeWCV6Q/9RwDJJMDI3L8Ahvpl6fZHOzhPhI3Hm
	cYDA==
X-Gm-Gg: AYBFou39LVFYsFpyLkQQNbIZ6yH3d73Sgcin5gvVmxc8Jh/vDADvo70AR2vdYeU8MHR
	r0oh8e/U4lUAjpXFz5KCG3qRSmDrL0AJOsYBMr7dXz/MlCMuiWnIZeq1AlO5ZO6zsm9Zc58twiZ
	hJ8JPceEqVBnH6G0Zho7J7+FuqNqe00F4Gypbb9rEarUIUDUlD1GXHtg3wTq1rFHQ+wTAqGZHCR
	hUSf9axoPBOYZ9CP9ShmI+n68CqUKs3rBWDgQhpqLJYDZi971JL33L0bKDNcDJYhHGdPBcqEJVP
	bOyh7l4WbmjXTxd5fd54bDEaBrO2j/zO2bfOR5FDIzXuAn7QlA6r6CYKWUEyFob8aO8FKdC8cxe
	RTlJe/uuDgvcWT1o94C3B9v3f810=
X-Received: by 2002:a05:6122:3b82:b0:5c9:a60b:e5d1 with SMTP id 71dfb90a1353d-5c9b5a027bamr7763470e0c.11.1790081897198;
        Tue, 22 Sep 2026 05:58:17 -0700 (PDT)
X-Received: by 2002:a05:6122:3b82:b0:5c9:a60b:e5d1 with SMTP id 71dfb90a1353d-5c9b5a027bamr7763442e0c.11.1790081896818;
        Tue, 22 Sep 2026 05:58:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa4537b5dsm1097669a12.30.2026.09.22.05.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 05:58:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 14:57:27 +0200
Subject: [PATCH v9 12/14] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-qce-fix-self-tests-v9-12-b1aa742e79af@oss.qualcomm.com>
References: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
In-Reply-To: <20260922-qce-fix-self-tests-v9-0-b1aa742e79af@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4833;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SZ2dL8TwrDpPKl/RZfPPK/8ppxvf49E+FLMHDVsmpq8=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGqye0CjFATY8qRJUxSTrr+MR4MKk7y483DIvvUdG+Xfxslmr
 okCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJqsntAAAoJEAWdLsv/NoTDvU4P/0g3
 ScrXNMzcgD5Nubh/LB92lMnZ1rh9sko3oqFnLkywoIYzu+dXEHCsh0HNoLTm9LBrYVIfqORos20
 GOD9KHsJotIc2yMiOHjoH9dr39j+GzkJm8y92uwHnpNa93AqIWsA8bNxewRQ/phrWXmRR+70wv4
 in7wuSo43KCEVNthQmYq5KBZ7fx4QWWQdaf3zqFofAp2JFAyvmNolIpDFwWvQPgUoB05XR4v5jv
 mz0Ek21ROJwdp57risy8zPZo87UpZqTgJyLmOqP5MdTD33Go1oGBlR6OXmuwRnIPrtN7Wwap6IJ
 QaXedjpXY+4KNJ9wsdpTa2qFFf+uYtmL+PR6qWVWYUqEsN8JixE9OktyCjRtTOv4HBQBhJOvr2a
 RapYdU9sxLiqFG2M+gZGd2B2LftOSnfBtRFunQeQYlh2J9t45Xp8NfZb/KmDvX+ClrtREcTmYR+
 3ewRVKu2UQk8zhYp4RQAwsK819nh7g5pm8Yxjb4zxkKFKdKsD5jcM4EKeIKSTqmZloIq4DO0ZxU
 +Odwwmq9UmdDVe9BkW+LXyrF81aTPbvCSOPNpzbukfcKbMcKpp0xBPedT3EvyjvVreuaMVBQ+sy
 bgkq0iKWdvrO7te3KaCtD6gOk9RL53zSCTAvAupyuiDRjeAWkgQ4fhiJHg/zK/9hoZz9oyyVrbY
 NNBOQ
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE4NiBTYWx0ZWRfX392MVOllC0yi
 qvvO7QuBU4N/L0RfdYDk7QzSnZ84FM1aECfqqo3tqKbl0WgJlnIagNzycCsX1ZtOCzrEy/O24yz
 7Fhzo45rZGFWijYqqUkguxRAHArOcmOnzFDTtkm02FIUcU+QJGQmioqSLDvnnqO/RIev3vz/4zQ
 8Hl1lREgxqI2SupUC0i5fdLDSTwWRiRzkNDSsH2e7PEo6toKlXkdEJKg8QT2dyWKfCjzmJQIVfA
 pRJIjCrxCajevNA1arYIO43uobBSSb6mh4syM72o+V5fOpPBgr2S+3dOV0tXM2BByIbFx9b2ACj
 pmOXG9ttTeORpMTlb9nJuQA2FaRNCcQNcDThz1n8QRZceN+JYNAhHLP6cpomU+rDtLMhKtH5zfM
 B/vBIE+5130rIUad34FKDTHdSBgiA7TJA/oyy0wE86rIwuC4zHr5IEqj/B4+lvuf65RzvtnwR6o
 whYiBiWMAQy7gcgo4tw==
X-Authority-Analysis: v=2.4 cv=IYYSymqa c=1 sm=1 tr=0 ts=6ab27b69 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=EhY2VP3nYDlqWzrqXREA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE4NiBTYWx0ZWRfX2X1OA4zkJYVL
 STvwduICZ1DyeuuUVmlb/YT4zKW27x90ICESfy0Mx5Nomqu9O6YGTISl9LVLUVWNZnpTb0bbMIJ
 yrP4Pv/K+fL2uVPZZkoiV2HPN9VP9bE=
X-Proofpoint-ORIG-GUID: AmLbhjCAFejVhtRZzAAwacOiSwvWy5uQ
X-Proofpoint-GUID: AmLbhjCAFejVhtRZzAAwacOiSwvWy5uQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_055819_280787_A0272542 
X-CRM114-Status: GOOD (  23.72  )
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

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2b524154d9fb331199fb162e43b0acfc03eced6b..859835a3dd1d98d1e4099f708d75f36ca89d3f3e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -122,6 +122,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 798643be3590cc8303854658fd483b7807d2230f..33dfef07e7db2c0488b14c78f098afebf689d013 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink.o
 obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..8a9d070935cc87eaf20ae2db25f304cf4b2694c0
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	static const char *const *subdev;
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3


