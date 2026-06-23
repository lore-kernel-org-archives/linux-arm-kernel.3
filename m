Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87167CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RnWoMIES/CzkhCcSsrHFJ9LX/JyT5AxMedV2CmbIQA=; b=nM2dmxpIoqdEQ9GJN8M/Cb/SYy
	HPLZDwe7/IPtidSteJxWjfQvYyD3UHUZ5s7h3m9zT65zA8kZb03kVrpx9zFwBABDJI9zxbJW87mxA
	FPcgfuV5p+FlNAmBTCw0eIuLQ6R/LXHyddt38ifflZpx8ieWihHVkCCljEpGNRG65W6hv2VhYteFi
	e8bKtn0ALkeHLLQHW9+tLa5Pbphig6xdPJEFuIHGvH6y2wyWocVfvxEO3QFGYxU8Okk9rhxYX6dtf
	WUPbOvSzD7dLLMwuaabxQgHuB7qjWM65lRc96sEGbxlXvYn3jd6pnxw3BQscby2kTddYHsxpr/oEl
	PCLSVmDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07w-00000006Fe1-0ljO;
	Tue, 23 Jun 2026 12:21:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc07r-00000006FbC-22vv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:21:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NC6g3c3744652
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0RnWoMIES/C
	zkhCcSsrHFJ9LX/JyT5AxMedV2CmbIQA=; b=h6Dplp4ljdptQgfUK5V2C5mLp4x
	af2n8dcAiyqdVAfwqqGG3GuI6/2JL1DygKH0XWGHK5khXCzA+EyhUV0g8GNKdz9O
	FBCfxiKNc9l/wubjXek2MK6sUq2P/H93HITVkwqAn3H9mPMAbxBWH4tUSpuFWfPV
	7R9K2ijtYtqgBuLURQdWyOaLEZpAs82NRZaiqP8LXdLhOPDB9BP75tR/aVJ3IlW5
	xr4eMMPBzxOcrrL4UouSQ6KCVHvCnt1pL4G71F0hm/HzYOK85o6W0T2KmZ3o7/2y
	ICYCviZ94Vk5vX92F1SV0UKY8dsJMTutI+r0NF4pjDB138rlixUMfZbMQrw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eysv3g1gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 12:21:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8422ca754d8so4012160b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217270; x=1782822070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RnWoMIES/CzkhCcSsrHFJ9LX/JyT5AxMedV2CmbIQA=;
        b=CBQt2aIUO3MTjVduxrOONwrgfwv22Q8zRd15dSi5OLYr535Qavlsri3wJ7NXPVFC8O
         tu1/DJxRyMczEtOMNx81s1yuwYbBCxs61v857ToaFS/sFKGfIx3lDXtQeOPuPIy54ElY
         kqbdE4ykuDrJsjp9+g4FzijWfCRlgzem0jS0wsVnNHI57J/A77rkYxp8IX5ZhTsB897C
         y3oINzcnWKy5fDzUPwNW2ujqGjqt2ACcHTikD4cEDlCmEdtvu2hx9pfb/rX2kASmCN2L
         eqhSSTEFI5xjBRYJapGbGZqgivntbYEq03QtQHsk264RWgFNfEmQNir9wruc8r3u9HuO
         Qaxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217270; x=1782822070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0RnWoMIES/CzkhCcSsrHFJ9LX/JyT5AxMedV2CmbIQA=;
        b=XfHBH7YHABqCJN1a1CW32PjqsyY/CnlOj0A0elyMXO+2J/X0DKYz4hr99hnKzwj3QW
         +fKtgyS7rYaxQA8sHnckTt28GNxzbuEa5cz6NJWS8UeFgs9iyVZWpN2UJIwD6RWfEUPL
         zMQNaV3sexNQHEi7nuPb0WBzLxReW163UZdvoWzl+FuoTi61zY8yUxMk3utkglRWNbRs
         uKMP7cXUYe4++xssjbZ6+AmLReGAFAzXo1HZTnKpRm71L22Dcv+czQDZinjPIXrJuAVK
         1VzfWRztgD/twyWQPbxKOoiJEdIbmWpOSeUhnx1xLkYbzk0cfQntwVr7xn7u1ux+3nBT
         s1Kw==
X-Forwarded-Encrypted: i=1; AFNElJ8FeE4Catd9FEKd9+CB78bQIZGef0+5aaM52y4tATISV9ubZWHyoDKhF88K8NnJGh0skJcq2brwsuVab5XqtW8q@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4q1kMUbbrilm4oZ70PeBUsHY4MX/C2Rb6NjNqUE8mvlsHwZ+X
	1gw+mNA+1e5Tfnrtje3aO48zn8JmFQ/ndj/Xatw9onRIsXDUngOLpx5SwPvfjKurzgxhYz02YWr
	B0kWoQnH6QvlzNBBcUqhNBRHJJbRnvN8kKnk5+CjTjqKc+YpLqI24VlfpjjVziCX36T47MJJXpb
	w99Q==
X-Gm-Gg: AfdE7clD5z5aLaYP2guBrF+DBBhAIYSSECVpjRgfYcxLcFZZ2tN+JJvDa1ubY7wFzbq
	soAFsdbDTOODycdTdFBFzGaowf88ZVSJkMO/wwBR8F6oiELgDCLb24gkQgvciihmq9opG9QsI0p
	JWRlF+HA4y3aPDxHK+IOxw49rACqnLnRVo93LhuzhURcIj+EZCs9K7UFp9eHmvMdTHzGE/iaqHb
	GPT+yXZwwqBUvbJ4vcGERtDmAOz6cOsMZzh9ELkxzkQxnKlTmutQaLkP/CIvDLYLO2GnbnVj+8A
	CLi755CAKo19YJYHtIcAFrg9Gc0YzzsC2LQI6BEDX6CLE0Qt54ViMZ+iWuOOVcjQRwiqVW02Au8
	ToCVQB+58tEwrC2ud9yE42A1XvtXc2d/C2PpE+g==
X-Received: by 2002:a05:6a00:1408:b0:842:5b1e:5908 with SMTP id d2e1a72fcca58-84562535544mr19225480b3a.25.1782217270040;
        Tue, 23 Jun 2026 05:21:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1408:b0:842:5b1e:5908 with SMTP id d2e1a72fcca58-84562535544mr19225423b3a.25.1782217269487;
        Tue, 23 Jun 2026 05:21:09 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:09 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/8] iommu/qcom: Check pm_runtime_resume_and_get() return in probe
Date: Tue, 23 Jun 2026 17:50:29 +0530
Message-ID: <20260623122034.1166295-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXywD5h5IRV1dl
 y1MqK6t0DCGNiGM4UYNWTV17j6QRaerCa+u9Zqucs7gt/uZ/bDlDaBCowk9lBYMVQfvPFkJqSfl
 gGR8GQCPt+CdYtJNmybfLctCkENSbEw=
X-Authority-Analysis: v=2.4 cv=WtAb99fv c=1 sm=1 tr=0 ts=6a3a7a37 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=uh9JkKNIBQsmCcNjqRkA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: xYSUBaKF5SrC7ZO9wck4W_MuDwKS3U08
X-Proofpoint-GUID: xYSUBaKF5SrC7ZO9wck4W_MuDwKS3U08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX6igliSaE0wpB
 eNVxeTCJHbDDTKK4LlQLKHhc7VT4vM64K4UHuLeHPdz1Ld0rViuUokkvsWb5JIWYXiZpJLqiSgr
 ute62a1JKsmeL2COXHk01mwfTiX/2z7HO5ZhasHquNt1C+VqBbe84vQ0Qu7gzpPTSu+sHDuwDy3
 J8eWlqPyNFNlSUTVLByTrb5trDVh7Di7OmcEhHdvOThO+qVzatINGxoxVeu2q5FnDRWXHnZIimC
 P5kpCPXTWA3aEpAczdukJDp1wdWp1G+qR/Jj4khjQXt//b17Ajgw9zm7Fr9IhNJTntOOCqL+Asq
 jA3caJ2Hax+jOR49+3PP1rUE0N/uKR7PgNxMgsUFNDVDyhQrmC4/BzMMsCvtg0lRFuEV5y04Sah
 VQjCfQJOIiee7MEX34/Ti/6otCkeqBFUqq30OqqGnLO9z+EsmrCHHN5SuRB9KcLN52l5i/inzEs
 npDslyYWj+QCbB3SXQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_052111_532062_25F4E327 
X-CRM114-Status: GOOD (  15.47  )
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

The SMMU_INTR_SEL_NS register write in qcom_iommu_device_probe() uses
pm_runtime_get_sync() without checking the return value. If runtime
resume fails the subsequent writel_relaxed() would access hardware with
clocks potentially disabled.

Switch to pm_runtime_resume_and_get() which handles the usage-count
cleanup on failure, check the return value, and unwind the already
registered iommu device on error.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index cb43276f4a39..4e714a8e1fac 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -859,13 +859,17 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	}
 
 	if (qcom_iommu->local_base) {
-		pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err_iommu_unregister;
 		writel_relaxed(0xffffffff, qcom_iommu->local_base + SMMU_INTR_SEL_NS);
 		pm_runtime_put_sync(dev);
 	}
 
 	return 0;
 
+err_iommu_unregister:
+	iommu_device_unregister(&qcom_iommu->iommu);
 err_sysfs_remove:
 	iommu_device_sysfs_remove(&qcom_iommu->iommu);
 err_pm_disable:
-- 
2.53.0


