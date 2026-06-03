Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128F4CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=; b=uUuPKqq3O7eEDjCwn6PR4v9DqZ
	ZSiszOKL3fLPf+D3a7GT9GOsRRrx5N/uajM2sgLH3k93wvN9iK0zm7xde/ihrMtEKCYiz+IHXXlOF
	Tst6ANtL4atTACf4HI2vr+eyi/nJ5Rgvje+yE3nDtSYIUemsdAqob9jdbQ6YeMtI/EgG86TsHaiVI
	HyVlcZmGWWyPJ9swHYd02KpZvlgE4eFTPMFBxkoEuctYg4HCR5Lj9ZBP1QxdwVEieUEAOH5z/L8+v
	zyPjyRrx0wpbth5NINwFvG0PBiYLQ8hOjTo4hDZSjCjKXBwJORfGbN8nF1jnXYXJYATDSOidnvpkT
	7FTMcBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4a-0000000FJNR-1Psq;
	Wed, 03 Jun 2026 15:00:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4Y-0000000FJMR-1O1L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:59:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6539vRaY2368040
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 14:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=; b=n/kZaWzy+7rupsEH
	dKKhdpNDX2gmHMsQQmIxtQv+1JBkx6YQPTiAAjIkTarEXS9IgJg2mmVh4+VKlrR/
	STUal+Qga1WrbTzBqtFqkU2k/IW5An8fdgdmATThKdmbTRH/fpmVev/zTUViv/Ak
	l2f32rfJWzB/6PdIZLeTIQMNIsL2MP5fCfLJ01S/MCVz178wv+imrML+N01qAFIu
	pGs1GFz3c2+7cWPMV+LPZKEMpkHpseKcDNoplbHjDYpL62GI+3qQLNjqqCtQYJkt
	YLSJ0q6DGL4uIqXuJpIAPwQCdmlfUqafOS82oVgDoVuSn6lH8tx6zSWE/NjNDKha
	Jk3dcQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejj3gh6b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 14:59:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8425a9979e1so2134751b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498796; x=1781103596; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=;
        b=Fx1womJVVC39gSCrfTw3nZxdkqafnc/bq0whiuGk9k07mW0bf/3LWR+i0TBfZ135F6
         RIyOUFVX31XyMHheglZDsQeHGiXdSlII70wwie8okQIg+7ojArzFwrXGnEflyKSvhUYD
         wGVQFTx+IK2xAAPz2LbU7eX6Ir5AvibhDBgEVPtqts87nWftalx7PNmM3lmQ8v9cPl+W
         D9/47QOhTNgEZNcVvuetRD/cmKzlhxFYOG0JOBHWFIXmkU6I3Y4+Un49BZKGLmMNFcd+
         HjFm0EhYi2gVUN/DKginNG22TPaJhAFyb5PE1dKIKtwVXtXsMGqmrshxv6GKb6G2av5s
         cQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498796; x=1781103596;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FHuvTiy0GQmvoxD8SXi2K1/mdcWexwa17cUS/1kagZg=;
        b=TX+EcTNil0aiODS6m0kyrLHHM2eu2jgU4TBsPD2vurd6obSmnfME/F/6LWHxVBOAh7
         FO1vl+WyxoYYWHObjrJb0m5wYC7u38jLyayASom6yr+qoiodvHuqJERPG1gG2pZfocfk
         ojbkFfjZYO2rolrEFZE6ZU2yDQcpHI1juvAcw3+13yco4e2TQT4B5YltEsfObNOweEzv
         OMnelWQadFEUVqJ2gzBnNBwoWp+/4deKvgGacYbDf+7hd3gPwmv96ao0B2+HVN0kXv4o
         SpMiSAa4IkYWWbkxG5mExcXh7vEonpjFM+5WrW6hQ2A5QL5l8Ff0OgKKsD4sTF1qJLnO
         HvVg==
X-Forwarded-Encrypted: i=1; AFNElJ9tAwKmnlqtPTVl8pEPkyABLip70VaFaPJblD5uyE19aIzvjg3llytFiadq2YW5I3F/kQm2r2+jfSNjMry3DdI2@lists.infradead.org
X-Gm-Message-State: AOJu0YycZDKnkzA+SbuQeMmCZnOeDbMY140dCPOTlexzcHv66FP4G5TN
	yrS4eWuFA6u3+5H02wvkz+jtW37PA6LmTcWWOL1GC513vCf6MMbpdaPQ2sR8/3uHD+n6+m8/HM8
	vXHHhMGFwWAu7MhL89RmAkC2bNpwbWAL6ctQ8bLd/5uwIxfPcvvJNs+uDY9agsg2Qf2iIs250ZJ
	MLRg==
X-Gm-Gg: Acq92OHKEB8twbLSYH2YwPQ0v5Oq5n+VmG71c8lhLNUbMmD6oH3ujf7oP+jQuqtNiuF
	W8usj782MNP6VVsPvFCWSSoUQju58Gl/1ismDgWgGW8DrrU1GLi2BefEW6RN3Fayd58fw3bDNmF
	zA1+HlCcqz4s2IjsxAYCjn8YJMinOJMKO/E1tnzuXZoKp+mXqoCaxFNrO7VPb785yBt5slwMHHi
	DaVFuWmdF/syxJqCsXKYVEtIvBYNv+vVCfbVODHruMuEzyoH7BdVr5KPQACo/83RLplnER5p77b
	CTAOwzRgI9F2Gt9XLjYVc8rgfZo86NL/lOU2toYaQfYFdgJdaSAxxartWDevsJMqTf3dIBBiqg7
	JYxf5l7+gWjo9Hv3E9dS8SYihA5q4Ac5Jqe6fXsy5VVZGU2AN99z91AvK2V0=
X-Received: by 2002:a05:6a00:4c8c:b0:842:329e:7635 with SMTP id d2e1a72fcca58-84284f8946amr3803907b3a.45.1780498795944;
        Wed, 03 Jun 2026 07:59:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:4c8c:b0:842:329e:7635 with SMTP id d2e1a72fcca58-84284f8946amr3803860b3a.45.1780498795425;
        Wed, 03 Jun 2026 07:59:55 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:54 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 03 Jun 2026 20:29:27 +0530
Subject: [PATCH 2/5] drm/msm/mdss: Add Shikra support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-shikra-display-v1-2-aeac1b94faa7@oss.qualcomm.com>
References: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
In-Reply-To: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=1977;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=lXWNmEJrXxHXoCAHvxq7qK8w3dDJ4/31/UMC2TNJybs=;
 b=fl8GxWFvvAxL6W8VYehdEukb+WWSYKOdLhDUGdXMeoIWzjnTFGm7XxYarDgwo+rK7e26ilCar
 sbsCIpXoMwLClv7E5wQZVUjKe9/oSpcQ1BsITrMiorkZUzsAClU3cYN
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfXy1DzxWoieaie
 ZZHhYniL13I97IxgcNFlC52uc7Pz7af0Q7ebyTwSc/AaL4kzl2ImUh6vddx6ixzUEaK/jn/sxIb
 Uj5qRU76GO2ylGq8Vs8DkwaQVeSOH/95xK0Jt6ots1e7Fh4hzLIT4IkR4FM/Vlk24phbTi6PO7X
 0d2nlBxywzvyBi66ziAhh/YocuyL5Vln7r1wCQWfH/mISUghbbXErLscKFAbngiaubcPE6daiwI
 hFcWGHh0SlgaiuP75zHsQEsIQC/OiAufbFd/nXSkJDiFXelt6bRHHfYIKIrQzcKgNSPcgiNL2Mi
 RkKR64tLpIR+YJIEOzl0qtggXG4sqXPiSo0j/Vy4gtoTkpuiK914+w/bZ/Hd+xFEIEDohyCfhDf
 v5Fwh0QD5qO97sqTT25TXvmqFBmNzsTuXa6OkGNGFqwaxOK2N4Nj+WYGqit8WhNrrTpPkdxQFyY
 eelicA0SPbfgAoMy8Jg==
X-Proofpoint-GUID: EyC052Ed17NLX1bQDjHTy5ADYelop_Ca
X-Proofpoint-ORIG-GUID: EyC052Ed17NLX1bQDjHTy5ADYelop_Ca
X-Authority-Analysis: v=2.4 cv=UvhT8ewB c=1 sm=1 tr=0 ts=6a20416d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IH1-U3DoIKz-FfJ46FIA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_075958_492498_401D87CF 
X-CRM114-Status: GOOD (  15.50  )
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

Add Mobile Display Subsystem (MDSS) support for the Shikra platform.
Shikra uses the same MDSS and DPU 6.5 hardware as QCM2290, so it
reuses the same AHB clock rate configuration (data_76k8) and DPU
catalog. Register qcom,shikra-dpu in the DPU KMS match table pointing
to dpu_qcm2290_cfg.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
 drivers/gpu/drm/msm/msm_mdss.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index da3556eb6ecc..8abe8ef6fa9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1496,6 +1496,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sdm660-mdp5", .data = &dpu_sdm660_cfg, },
 	{ .compatible = "qcom,sdm670-dpu", .data = &dpu_sdm670_cfg, },
 	{ .compatible = "qcom,sdm845-dpu", .data = &dpu_sdm845_cfg, },
+	{ .compatible = "qcom,shikra-dpu", .data = &dpu_qcm2290_cfg, },
 	{ .compatible = "qcom,sc7180-dpu", .data = &dpu_sc7180_cfg, },
 	{ .compatible = "qcom,sc7280-dpu", .data = &dpu_sc7280_cfg, },
 	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..03f27e6b0ae7 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -537,6 +537,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sdm845-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,shikra-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sc7180-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,sc7280-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sc8180x-mdss", .data = &data_76k8 },

-- 
2.34.1


