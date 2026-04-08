Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BE41073CB4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HntEs+8pzBI+y7qt7t4W2UrvZTm4MrVZ9wGejJw7xFA=; b=hBqCjoioiJTpVtyMTqZq1P2jXS
	gu4C43htcTafgp0DEHIL2SoMoTOBx3SFTdH5q4DpfFTcsIKsqhE57uRYzNMh6IBFCPFvY7oyX3JqM
	9AtH515KBJj9siWM/r2ovm+yPWIBnbhkDshQcfNILosCREWzOL1yPzVcpUnKLldpqVrfyP2JkalJ0
	rb7YTQKVbwBEvbPqHj8MHAwmHtd2mf2UxjneIKZd9+u9YMyP2sYAG+6kmAw7NLqLwMM0VBLJYn3qx
	R/lywJm91oOFzr8yDCAuvzI9sYvUNedMn09BqdRwIFSUah3yDcQpeQDgncb8Zhajjr1787ypIMNUl
	hewaEwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASe7-00000008tVl-2y6b;
	Wed, 08 Apr 2026 13:08:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wASe5-00000008tUy-2Ml0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:08:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6389Lrf42411822
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Apr 2026 13:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HntEs+8pzBI+y7qt7t4W2U
	rvZTm4MrVZ9wGejJw7xFA=; b=hOQLOC4Pqd9JJMAXOHmewoVLftRrhHPEDd1v17
	/ttW0cuJGyHHlKIj/bbk+ZTexlZVNa2np9A3PRrbFSU3YhqVR0i3MiOZXWMHEfit
	h9KX0UiWjHrhZC2Q+JkbpfmXD/okIiIO/wT6vEXmhY1lHzQRBErd5+OJJ8qXfNAA
	xX19ydjn5RP8VNfeyjmV/wZiumJntxPwCloADOXELg3GV/wiN/26ztsnXu2uZEWc
	zSLjdeBnjVLqwQmzDfdLKMLgvma6LK72EgL3s4R9cellB0Ss2jAXjhNbPVmHfR2s
	NbG50WP8K8M9ZJJX6Wdqg4vtX9vI+ORk6JJsXF3lm4QM7HMw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd61vbvgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 13:08:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7691378914so2852361a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775653715; x=1776258515; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HntEs+8pzBI+y7qt7t4W2UrvZTm4MrVZ9wGejJw7xFA=;
        b=PMWb23vqjcr2A+la2sm5pVQLP5EwV/iCECqhi1FvBFuO8lZoajgsWngQSRuBH7B3pj
         iTi0qBPS/cY8y7KZ2t6jiw4+QZIoztIbwR4vvK/qGWZyvCkRwQ7jq5fdUv4MaP6cJ04m
         +FZD5jpYfQaExSkpbhZ55VpuwUBiU6Fh1bqlacbd/IEypTxUh5p64oMPGgX5HuC1YVAJ
         LYa9xcr1Wu9ayD4c05ciyHsOxzu9edVZAleYKXlQvUTdp2Z2nSgqO72T4dHpjjw+Zfd9
         fh2RxrGGj5OAKyAS0xpV4TvEvblWuTHYA5DpZLxsipxnB1+JDXN6Hf7/sZbuv+HK7dMj
         JjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775653715; x=1776258515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HntEs+8pzBI+y7qt7t4W2UrvZTm4MrVZ9wGejJw7xFA=;
        b=I470cIUILMlqs4vH29sTCEKVWjIf2JS7vJ7zBH6GkQ4yC0YnnOi6XWw674JYp0dIbC
         UDhfPd0oG4K1PpM92ek0PJaIgPb9Nqi98tFKz/8MtZ63TUnhVtnB8z3ENCv49fT+5xQb
         PMUkIS1Ooi0SYrlCMaD8YIWrYef7BvQKAcgMHUf/HmTIfGIMTHQdgV2jRWdUum48uwcU
         E2GIGTfzJo8mAkX1OFXKz0UzlOx01DX/2sE1PY5oRDXilOkmWVpML8OX3PllEzRoQg+2
         xce+oL17Ax7VtfveN8gu7Vd+G5HouX1INO/JVzME8mxsZszI3Xe/xxE+EnEbx7G5fTjl
         vt1g==
X-Forwarded-Encrypted: i=1; AJvYcCWYGZHsny3Pj1C43CL94CxT7LGZqR7ESMBGpAZYiH5aBko44RN1H+FLcQErzV6k/xaSP1Sh47bH6VKvF5wO3kUZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzab18nN9JyaK9d4B/bFHuM+jzm+KfXMclkpmofVsUNeO/rCJiz
	yICsAV2Ixv4jqza3KYyMQCGAgG4672ieD6+I4/FFp25dMltgr/CcdnbZWjlSVLI6B6m5ClfHMiG
	mS9evhbR7UDAW+Cd20T4+sW0ZGEKwt80MDVh9p//eF1hoLKeEOMDmpqx7IJz6TiBpLYU9WpRT+C
	vIqQ==
X-Gm-Gg: AeBDietVUIyfl91ejfzY+Bmy0ewL3XWaoFunc+xAYRYFccLLVzwqQmYH090bxdbp/or
	uAsczHiKOZKaWHP4rmNlbX0NpaNRkESWI6jGpfsSJQ11ctkCnkgK7HiqIfHXR7hrUkoN/ACjYt0
	rmFZxFWEAPTgfqoZ6AmkdjsPcoW79RyjJNdaitGUOvOUmVjuDRHfaBn95CkFDcROypQBhmFlmVB
	mryPhMRl3j1n1uP28Y92gnlQ6d/edpIG7mYfeh+3UZcolsP1nktxtHdy9kJmrGuH07PAZIgwhzW
	YvBLyeu4WHaz25hrYBpzl7eYPzr1+GLDW6j1dVqMmthgknIXyAzpNm2gHmY2vyNW7BeqDsCEHrt
	rLNT7ZNbpNF0xyklxEgLSzyFmNkaMyCJDZc7lAJVXK1q50d+0l6Fm
X-Received: by 2002:a05:6a00:2e85:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82d0da9dca4mr19823931b3a.23.1775653714531;
        Wed, 08 Apr 2026 06:08:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e85:b0:81f:3fbd:ccf with SMTP id d2e1a72fcca58-82d0da9dca4mr19823878b3a.23.1775653714032;
        Wed, 08 Apr 2026 06:08:34 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c4126bsm20426192b3a.36.2026.04.08.06.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 06:08:33 -0700 (PDT)
From: bibek.patro@oss.qualcomm.com
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Subject: [PATCH] iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
Date: Wed,  8 Apr 2026 18:38:25 +0530
Message-Id: <20260408130825.3268733-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDEyMSBTYWx0ZWRfXw4lVKiYEl+X2
 4Zm5dzCpQiv1/CjdWIw00RiCbqwG80dDnNP1GzoE3T333pv8nH5Sjnase//ISzy/M+pKhfs/7Hh
 hrp6UBSX1oXaq3zwT74XldZDZvX8k/rJLRCAeokLae9x8k/1Zj7nCTyMi//Ziw2OQnry+uLBKLg
 F7LMkgae1SbyVyWYhBs9YLtgi1dGQwNDmARU4QJ/NikI1JtHPXAu4CLeodxEEjnLhjt20+OjkHd
 xV/WHZYw3WgWU9P056gyGHsGgXshpIb9+rHAZt5Vdrd4s3wJExySDN6I00mA5tAu3N00wrBYJna
 CPOlSgGM782ljfrfBaIR9mYXd+OCTIliEjuHi1wnJ6Zg0CD3RGC97fY39jm3iGT6nVVO5YSQpse
 DUrVtOmWm/Q9Rb1TfaOr3AfWM2YnlcpPCgs5GX6KITZ1TNC0PgDzFucUBJ+YmqtWzzkBkys/rql
 /FAd7wFoCGRW7+M6tkw==
X-Authority-Analysis: v=2.4 cv=FecHAp+6 c=1 sm=1 tr=0 ts=69d65353 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bCvnzbEyROO2_-PIDOgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: tpHIMAKlUWgQP9MbPH2hMAgvaD8fnfSn
X-Proofpoint-GUID: tpHIMAKlUWgQP9MbPH2hMAgvaD8fnfSn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_04,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1011 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_060837_738199_7D35F987 
X-CRM114-Status: GOOD (  19.53  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
the compatible string for applying ACTLR prefetch settings to FastRPC
devices. However, "qcom,fastrpc" is the compatible string for the parent
rpmsg channel node, which is not an IOMMU client — it carries no
"iommus" property in the device tree and is never attached to an SMMU
context bank.

The actual IOMMU clients are the compute context bank (CB) child nodes,
which use the compatible string "qcom,fastrpc-compute-cb". These nodes
carry the "iommus" property and are probed by fastrpc_cb_driver via
fastrpc_cb_probe(), which sets up the DMA mask and IOMMU mappings for
each FastRPC session. The device tree structure is:

  fastrpc {
      compatible = "qcom,fastrpc";        /* rpmsg channel, no iommus */
      ...
      compute-cb@3 {
          compatible = "qcom,fastrpc-compute-cb";
          iommus = <&apps_smmu 0x1823 0x0>;  /* actual IOMMU client */
      };
  };

Since qcom_smmu_set_actlr_dev() calls of_match_device() against the
device being attached to the SMMU context bank, the "qcom,fastrpc"
entry was never matching any device. As a result, the ACTLR prefetch
settings (PREFETCH_DEEP | CPRE | CMTLB) were silently never applied
for FastRPC compute context banks.

Fix this by replacing "qcom,fastrpc" with "qcom,fastrpc-compute-cb"
in the match table so that the ACTLR settings are correctly applied
to the compute CB devices that are the true IOMMU clients.

Assisted-by: Anthropic:claude-4-6-sonnet
Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---

While there is an ongoing discussion [1] on how to differentiate ACTLR
prefetch settings between compute DSP and audio DSP fastrpc devices, it
is necessary to first fix the compatible string to "qcom,fastrpc-compute-cb".
Both compute DSP and audio DSP fastrpc nodes use this compatible string,
so both will receive the ACTLR settings after this fix. However, for
audio DSP devices the effect remains the same as the current
state since they do not actively use prefetch — the write is effectively
a NOP for them. The fix is meaningful for compute DSP devices, which
actively use prefetch and were previously being silently skipped.

[1]: https://lore.kernel.org/all/9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..2d006049dd61 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -39,7 +39,7 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
-	{ .compatible = "qcom,fastrpc",
+	{ .compatible = "qcom,fastrpc-compute-cb",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
--
2.34.1


