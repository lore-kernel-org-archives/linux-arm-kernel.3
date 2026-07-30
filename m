Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7E2C55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQB705iUg9cjPgL+aBVmOnrDJY/xYVqVa7zVBN3y69c=; b=XNJoY31F0q6xE7NEEfy0rMwxuy
	vefaBd8pwrk2+M5LEAvNvdEolSqZnOFBqTIiDaOUqO22mIqwRKlzOzcJtUtL5iwgw9xqY30oV4N7D
	+Cn1kb/1KRDgeQdI12WtA5xk4VEs2hqAfgCXL2nkERWJ8cZSakB5yQbScczJCu13zgexxAbRqsADi
	HoubNzYiJIM9SHIVQimI+1MqxGv8a0cyRsdNWxGRUKB81z/Dx54vrIv9HstPhxVxeY5IsB3r338rN
	ZP6c06Mr3NTTuIxMPHpvUSm2Tut1bWJk0h7YICIRVbB3/k0J74APJlpyFt/Augr0oUw6VHfP80Uvr
	/q6HyD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTG4-0000000AwHF-1kVh;
	Thu, 30 Jul 2026 16:05:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTFp-0000000Aw8z-2vE5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:05:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UFROls1146404
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQB705iUg9cjPgL+aBVmOnrDJY/xYVqVa7zVBN3y69c=; b=P59Y+N5L7cVuDVWt
	zuGX2bG32jSGlZ0SovPg35dI0f5HBwFVcTOylO2/2+c0jWwVxPe6hLPbUzca5YpW
	m0bVcOX1RqOi5WQscJW8y3z5r3DIAV9/b00ZallZvsOmpPLHJvgPK4Mk99MH50fF
	bR3/G57+apjiZKrKSII6IgvcW6NcKQHgCndt2bhKx37reFi0e1N3QhLAOyEb0SwY
	uqJEq7TnZQKJwC09dSHbYLXPwzwIFwpAfc7mwHc9aYFGLFbLcvf23nVn1AQ/aoZr
	zhZoyN0JphAcyA2Az3XtQvSE7dUC9+oRmboSwakPqFwq2+nvg4FwYi+ueo8TXJcy
	fs/cSQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8k60gxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 16:05:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bec738909so19580101cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785427504; x=1786032304; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQB705iUg9cjPgL+aBVmOnrDJY/xYVqVa7zVBN3y69c=;
        b=IAnc+idwR+ZkhGHHdXGd3FjjsmSe3OcD0QP43tL2hLjQnaymiotCf9SULSvOoO59kO
         thw8i32PS8UiRNhN0Y66mrq4mC5eWqJS4H8RHLiulzHEwMvSYzFYegt03wA5rWIPZ1z5
         gITtH0z9hCL7427dpQ3uMTzavAlIDCAI/GxjDPR1Do5UtEsqqRn20XiGbKjc97zj4TiC
         wZhT75XxDnwLP/op+povEmK7ARRn5MY5QiW75FWHYDC0CrGxd0F4mtzfSpPs91jZsR9o
         dkyTFCGbjjp+XCTjuWfLt/wH8TJ7MhyjwFNHZ4qoROGRJqYmHmFs6r4TZ4psb+dAmaZ2
         QXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427504; x=1786032304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQB705iUg9cjPgL+aBVmOnrDJY/xYVqVa7zVBN3y69c=;
        b=A3Q0x0piu1Ek4LbabTja6hN3QPFyo/hehHQzOlugeKPKJaJkDvr99eeROPsT+LeS0i
         d2Gr/0V8IEwZ9pyl8nqbltj+LDz0cTWc1mQVlIvqPxjP1GUpFszDT6ZdTCHSf9xpJo+b
         mU8mhO4+RowxpwefYSCjVzjsVN9L7//j7co2+Qe7hrrjiVqeIpf0D0aic9pQiWrQFAsw
         8SQj0Lb0cOsmc0nLltNBihjGdpA7P5Ef4uRcqOaa6BgHr12Ge4qNsettCchgidVbePjz
         ylOQAX94lcYoDUi1fAvXaNvkYMtcUGqayMj9Yj6aSvlAbhdYaE0K8cPEVY6lHX6DYvsd
         42+w==
X-Forwarded-Encrypted: i=1; AHgh+Ro7BwAq2EueTjPWuY4w25hf+/Lk8A/Aal342Kysu6IJusv8oxwtXep7MM3/3RCaPNdy4hhA0ySHwEVJUhPoyjEe@lists.infradead.org
X-Gm-Message-State: AOJu0YxrbNDkLXILgbKweAUpI02ZchO4Hkt2IjYyz79dHfy5XZWj3Pez
	fNbQda1mUtJhApNZV0s7i5ljtiVvVh257L5YFs8WDkdM5cn9PLeypDcs5WbTfKF45qJqZkPGn+g
	Ik5xH6xsMjYYkGpwsFHS9CtEOUYerK3yXoMe8cAGX0ygeakKpjRtAhCd2Y8oNZvT4hBnLCyI56H
	dDvQ==
X-Gm-Gg: AR+sD11jU++Zf8Jpv6bCt5wLkEG5BHAAQ6gtuBCsFrBm3O6zepYckjIQvr90KqMT2ZV
	KLfYkdGUgAPJln43cAEOLze+n8PAh3d3iB8WURvPsfL5P4GLig2kP1Ilzoe6bo/9iM3zbLKwcnS
	X2mS2q0IErmxbBOc6rC0Pjw+ypcl0AeIfXTkqv3CSePMc/4SaXYqY8XoMx4GqYsHtLM6HAl2tTc
	P1WY6Kthy1MKtqHjrycQcojH8Hc1mNkXb5LsbLZMwimhdPXZmQWLqxK1RaCM2UfzsyVXVdo/Ard
	Jr/TrCV4Ic/TRr415d2eoaX6kwfphaaSdrxcvk6oA6Zf/Kmr3DSZxcfkb1HWzaiXkuroIuDH9bG
	U+3uI/pK/XZHs5XmdFoAn/YPHM+R6YEIP+9oQUT3yb0ePmBiwcURWHIG8AoLXnHKLssFSJ8jhxJ
	OU8841WSbOXZvvJQ==
X-Received: by 2002:a05:622a:2512:b0:51a:bec0:1040 with SMTP id d75a77b69052e-52b383784b6mr31060961cf.12.1785427504036;
        Thu, 30 Jul 2026 09:05:04 -0700 (PDT)
X-Received: by 2002:a05:622a:2512:b0:51a:bec0:1040 with SMTP id d75a77b69052e-52b383784b6mr31060261cf.12.1785427503397;
        Thu, 30 Jul 2026 09:05:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db8a3bbbsm455174e87.0.2026.07.30.09.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:05:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:04:56 +0300
Subject: [PATCH v2 3/3] drm/msm: detach the ARM DMA mapping before
 attaching our own domain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-fix-qcom-smmu-v2-3-18e0daf2d836@oss.qualcomm.com>
References: <20260730-fix-qcom-smmu-v2-0-18e0daf2d836@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v2-0-18e0daf2d836@oss.qualcomm.com>
To: Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <jroedel@suse.de>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2786;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YMHA00MGVdMnlcJxJUco7AZri2HHepPYlEdrPa5Y7M0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa3YnaPFREPHCdxSgZcp5fpVW9xlJ/nlVPFcVS
 v0UUSRLrMKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamt2JwAKCRCLPIo+Aiko
 1VQHB/4jV3KN0jQQp5q7JC3OLW/+7/9QYHQszWWEPbzovZ7YSoVIaUjgRZYI/1ctEi+wcrpzaAv
 Va5WmD7hjl/D2fCOXFhNsDNVitwbyzMoFcySrFAP6HHiFtTWfb0LolQS2OWn1XDa6L78DNFut9s
 fJJlX6ARuf/n9NgAbt3aVC3gHG+EXDp7uX0Dgo5NNP72nh/ericsR62eeX3/BOo2HjazwEyDnqh
 76tcLP0DlMrGzVG4djvTwWelXB6ADuZvwe4f2F8EtHfEzsw0GpbMok6Z+pcijQJU69cv/8GOjvc
 qO76MtdwYmfE05Nk6nmAJJcIncdyXlN+lD/MqChGEPSB6DSi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: c0GAIvmWzeWnwOrlg6V-g6etH64ebOfG
X-Proofpoint-ORIG-GUID: c0GAIvmWzeWnwOrlg6V-g6etH64ebOfG
X-Authority-Analysis: v=2.4 cv=Wqgb99fv c=1 sm=1 tr=0 ts=6a6b7631 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=epCurf6C53ZFYVxhAokA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfX5uLZ0sCiW2wX
 WkuDDVCC//FV20+6cEzF6xQSeltT7275ay80xN3Dal0N8ReS7II2Ri5UbKS/1dFL+E+aTMh2HGb
 ez+lFfyKUWsJUNtTlN0RLJN9jE3qhkGZ1cDNtnxWfvlU5d0n51OPOYwbyC2I7HndXR5WHxDLfzV
 rgzt7ZzTQNLyWPC4JYgk2ty/q9A69TqKfUdnzD09cBOxIvG5x3cLDjll++zdvcbIfXSyr+dj3UU
 YaujpAPpTeSiaNg4H5YuEISCBDYEXHMZDuvLB7xfQQ3DsSywVe2YC1+b3lS7wvvBI04SVtEIM0n
 ua1LXcIEpUMHNLnSNrVYaZX0ORkPyvkRQoA5IN5ZZGrlSrPoKAw2b7YI3JNZn6yQab97CBbREJB
 wrkzdh1dFhRFEFhxu0KF49APGXudE60hrvTkzk0EX5GFwx7PkIS7XqIG5FxWrQy9aMtk/cABgqW
 IfSLZmLi0Hr09vAPB8g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyMSBTYWx0ZWRfXxkPi4Cq07lSJ
 sl8oDfTdyFWUoj6G18eK0sszfnN695yaAu1GPKsIXiDJx6THtdPfc/7AjR6Ru8qv+E5kpeZjP3p
 u1nLILGx4dg42smDd88x9mdP0NnUaSU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_090505_766994_8E00AE1E 
X-CRM114-Status: GOOD (  18.48  )
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

Assisted-by: Claude:claude-opus-5
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


