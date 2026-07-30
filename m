Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8821EC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4GiyYr8BNvsq5rBrfJ99f2IOVz7T7wBUN5vtVYuv3w8=; b=YEoHjV7FTcYmbr0Q65wrtm4UG7
	4C9hxSb1/Qw1lm2duUnQjD1qLnm7mDsFpkcSZyo50OcXmiCKQVBfPZZQKYa3dwS7sfU/mZTgxrJ+J
	zJsBG+Khl2UaPP4IzOwiBsXaTQsuZDRn+487bt59jwFME1ZB3pE5H15+tcUQdAzF8bMVv0xHEuC/Z
	lLMKy16DqMg+MhrYkIjBxYPD9dVmLqqnz8az88N4mgAOvNDi0MzZ5rFlAutUuXimCmAh7aSwU85zo
	yWLEdy9eC23HkvpiNd2HfUWnQKCprgjboQjG+dEmEjDmqJR7WXMwDZ+gO4psll0kplUc+YoFKKyzR
	Uvt+ourg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQpZ-0000000AbNa-33dL;
	Thu, 30 Jul 2026 13:29:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQpU-0000000AbJq-2UZ0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:29:45 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDEpq2093998
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4GiyYr8BNvsq5rBrfJ99f2IOVz7T7wBUN5vtVYuv3w8=; b=LYURgvp1IOeS0d3m
	HJGWxB91RSgH72Uo0Wdct4qEB0Z5w9mxpcC7DbYvvYgDuF1tehH0if988qoHbQYq
	Le4FvAaQhwnLlpAhDjC+Uf2YdruL91L9z3E/sI6FTdT6/uBoD8ABT8NfEreerjze
	TUut3vh+uCVTZltfqpNOLy4MeoIYwudZua9D0jXR8J4tbo3jB1qBLkpAkJ22i2zg
	UudXYyrIDWVIK7zHsR4SQ62EX7OnbzzAQEWXvV1kRqS0fuY6ClwmX62gWdItC+ed
	zMIWYBBCVSmlxo21fpgvXeVO9+NLYuIDXOtl9x+2YmLOxlS+lWoJlzX9vsL7aOqL
	LzdfQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6ky8946-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:29:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e8004d60eso469269985a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785418183; x=1786022983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4GiyYr8BNvsq5rBrfJ99f2IOVz7T7wBUN5vtVYuv3w8=;
        b=A+SG/q4gEECqQUcrRNLuJ00mdlXXzZsILGwFj87QSCCmV82aO+FdcMkXEufensDwIj
         L8IkKa73qw6EtN/vMzan2T9QeFSr94t9A2/tXfxDZSBt/TVMdSIf4vvMLUyq/szBvU2j
         ysoPikI/senFMGKkRlSGZKsLG+8ZXu9G/E+DhQLH/Kxdhec55X6QIGU6fpfrAuazTQ5/
         vdUxvT+psMTHJLF43umhxIwNSv3oFMUrHktuVtsmgO/dUFUZVFgXCpqsQgkqjnEp/2TW
         uWAOu4nz9hxLZ5BSdJdyvE7FmeGnRyeYScAeaEA27tAhLKo+UEy2vzvHLh8S/U/8GJVX
         avSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418183; x=1786022983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4GiyYr8BNvsq5rBrfJ99f2IOVz7T7wBUN5vtVYuv3w8=;
        b=Ol4r/8pBuqTheqJjRBTUgeiixm9vKtuOCqzOS066UX9lG7vULUnobUjmrLVFbeg4wR
         YzZovhM6VNimOPntdQ00JHgpMUmNmbH4n9NwfweddExA0mhuv2XovuSJd4SKySWQydLs
         3WCUlm2HuOw17P/PN/dutBYqYtjd96drgU8VP7mMxFjHHUy9LJHHdzqqZ1viKGejuuhm
         p7jITkGzqEHgRCSh2HU8pWkc/MaTuHT4ZvtyfFOq0B/MZ+Ty4Dbh5x6+Hr7YxpEcDbm1
         8D8GZqnyKP5KVRsGf0HZiJLipwKMZxazfGM5XcDt1z7TRs8Bm4V2/Z+josPndDEqpiag
         4QKQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBYGI/3MtLO7/TheaZGudvjQ8Yvb59YlM89pmblmUI8BY1mr0WZ8mJ5NkUkz4Ku6BaukMPJwnRyzITy8tiNTbI@lists.infradead.org
X-Gm-Message-State: AOJu0YyBNk4xpzrhaRouTCF+HcQDv4Aw//j/7RsbPHQL+xsn5DZnt8tb
	cX0FwfOjZKtyfsIJrtGym295SDXI66+6NgS8ses5RzEDHPfgCapPFcZ8JPDr7j1nKNa6UVHZT3f
	qhqqHDzoQtbuGDGRUedDZO7F/NIr7W72LZpQfzK2r+QXip108PDgJgfXm6IuNY76KJMtXL0UHKc
	dIDg==
X-Gm-Gg: AR+sD11DLcvu92ZgnT8a2GySjyFP9bzjaxdTBeZGbddGiQKyOu9d/tXyIAHFpX9CPdO
	RvFk1vvaaLzPFYvx54Hdw15UTOJETiE53fhDrYr4iFBWWAfGS5wir2QnOmkOiZjZ5fK/wmJkSk0
	4ryTKFYUWAI8XprNM01KwRuya0eMjDsfH28+1qQjm6/XGNoU63JF56pwR5wdv5gGP45s2UiBUqw
	RMms20eKRPNBvfstfp6e4SFIrkUvgCJpLqRgmg+RgOkX5tzHbuDibwgiEixWt69fthMNgi1ZKln
	2stg6Lh4r3FqO+nT3G7Hm1sy8I7/d55GLD9Pu6I4aXaU+cHwd2ufYZaaPoY35ZdO4OLrDroyXoa
	YQjjME2hFM0Fn5X+mQDGArCk7GDWKNlp9mYlwfAoBPyx0VzcWfdtsWGZprOz6sbfUc7JI76DTbL
	zmMKEl9YbtEK5Ajg==
X-Received: by 2002:a05:622a:5ce:b0:51b:eb55:2916 with SMTP id d75a77b69052e-52b384c4702mr28152771cf.34.1785418182505;
        Thu, 30 Jul 2026 06:29:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5ce:b0:51b:eb55:2916 with SMTP id d75a77b69052e-52b384c4702mr28152121cf.34.1785418181713;
        Thu, 30 Jul 2026 06:29:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f6acaa009sm2976631fa.34.2026.07.30.06.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:29:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:29:33 +0300
Subject: [PATCH 3/3] drm/msm: detach the ARM DMA mapping before attaching
 our own domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0nxp1o2ipBKscUADiWjzkVftGYkzppsXEG9Cty/+pmo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1Z24J6b6wVbFP1Dv968/8bQ87nekTkSTCwmWXuZJ85pD
 0p7dd+ok9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQATYZZg/5/7tEvjz+Qk7vJX
 k3zOtPEfveHQZOPl4cMrqnnMZovt2isnJ07bw6x5j8vBskrclyXQJOLU3mYN69k+OdufMkn28yd
 oXdC4vNBQvF0jvuL/n/j/7K8ND0z8nx1RFSH2t/XxES9nFumAE3fvXWXY3DaTe9kqjnu9bZuNdo
 dLV1y6baTwef+y11rGEiq3b7B7s71kDXk0Z+4zrVfqWba7mTbLbGKtv2mh8vb1iVWJ3zx2CRku9
 i18yJBVJC0nkiZqmZ1xIevEvNvmuSaTanI/pWr3Ou90PDhR7LSPW+8h1VfV63zFRHgmWO5Su/0z
 ZW7YKlWpl857L8hvdYlhjq6SKXyqyHe6lFEr5nTGR6P5AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX1YoWkhdhprJd
 9apBI7U7ft1jIltShPS2NeKgXMOJz427x8j77aCfFPfDUVv5r/4Ek815DPtEiW83aSify1GhJM+
 /S787+d0Q9oH5T4qROC8H3HI4Cq9kdvg7dIBMJW7NwmzCj1/V400F0zgP73VTeoooAqp0gfrYPB
 SiwsbCek9Ow+donczyowsSSlQwTf15b15D4ftMzvIUMuCqrKp12odYEG/8WXxKv9sdzqJ0ppxtR
 jiN5fHp3+i2xkGh4X4ejqAIYx70t+emnCUZx66mxYs1M7EwFyC4k747C/PdqsLPQc8DkDYIaUTY
 sMaiGXKTjYPNNimRXJmfe9wfn4ujY9iNTtPybK7JHWLETl3LTZ10JKZXVJsUWHA84Tu5EwWo1q4
 YHP04YQ2nJ6g9DTgX/JvKz5Y/ZW6fvluTnIRkYKlc8t/qeQneoxFMiXruNcwX0/K0+cUwDSpxz6
 bMV2zm9PEL8NY6/aENg==
X-Proofpoint-GUID: fb61z6pUTo7j3nVR3ZEnNSROCY53jvk-
X-Authority-Analysis: v=2.4 cv=ctOrVV4i c=1 sm=1 tr=0 ts=6a6b51c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=epCurf6C53ZFYVxhAokA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fb61z6pUTo7j3nVR3ZEnNSROCY53jvk-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwMiBTYWx0ZWRfX7VMoUyVZPIG0
 nyp3/AY93k9h6TDxZ/o8UHmkVz5MWzRxj2l118lFAYrEcfDRVDss9OtwCNAH9PZRhQKN0gZX67U
 jYkjON/KZ/PCjarBxwQ0Hjc88D8aXNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_062944_656488_FF346D71 
X-CRM114-Status: GOOD (  18.33  )
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

On ARM32 with CONFIG_ARM_DMA_USE_IOMMU, arch_setup_dma_ops() creates a
dma_iommu_mapping for every IOMMU-backed device and attaches its domain
to the device's IOMMU group. That domain is neither the group's default
nor its blocking domain, so when msm_iommu_new() later attaches the
domain the driver manages itself, __iommu_attach_group() refuses it:

	if (group->domain && group->domain != group->default_domain &&
	    group->domain != group->blocking_domain)
		return -EBUSY;

Both the GPU and the display controller are hit by this on apq8064
(IFC6410), leaving the board with no GPU and no display:

  adreno 4300000.gpu: failed to load adreno gpu
  adreno 4300000.gpu: probe with driver adreno failed with error -16
  mdp4 5100000.display-controller: [drm:msm_drm_kms_init] *ERROR* failed to load kms
  mdp4 5100000.display-controller: adev bind failed: -16

Other ARM32 DRM drivers that manage their own domains (tegra, rockchip,
exynos) drop the arch mapping first. Do the same in msm_iommu_new(),
which both the display and the GPU paths go through.

With this the GPU and the KMS device both initialise:

  [drm] Initialized msm 1.13.0 for 4300000.gpu on minor 0
  [drm] Initialized msm-kms 1.13.0 for 5100000.display-controller on minor 1

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/gpu/drm/msm/msm_iommu.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 897e42c8d5c8..da6782fca6bd 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -7,6 +7,15 @@
 #include <linux/adreno-smmu-priv.h>
 #include <linux/io-pgtable.h>
 #include <linux/kmemleak.h>
+
+#if defined(CONFIG_ARM_DMA_USE_IOMMU)
+#include <asm/dma-iommu.h>
+#else
+#define arm_iommu_detach_device(...)	({ })
+#define arm_iommu_release_mapping(...)	({ })
+#define to_dma_iommu_mapping(dev)	NULL
+#endif
+
 #include "msm_drv.h"
 #include "msm_gpu_trace.h"
 #include "msm_mmu.h"
@@ -749,6 +758,19 @@ struct msm_mmu *msm_iommu_new(struct device *dev, unsigned long quirks)
 
 	mutex_init(&iommu->init_lock);
 
+	/*
+	 * ARM32 attaches a DMA mapping domain to every IOMMU-backed device,
+	 * which would make attaching our own domain fail with -EBUSY.
+	 */
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
+		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
+
+		if (mapping) {
+			arm_iommu_detach_device(dev);
+			arm_iommu_release_mapping(mapping);
+		}
+	}
+
 	ret = iommu_attach_device(iommu->domain, dev);
 	if (ret) {
 		iommu_domain_free(domain);

-- 
2.47.3


