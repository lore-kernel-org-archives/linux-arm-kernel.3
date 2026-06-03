Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24883CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OHsKV+ltiKXXlmj8cUFWo9IbTkRATlv2GK6UqkbO9h4=; b=Sh9RVUqDLEQmbN
	wb/ltb3XrEXfMcg/JpSXe/knLmr2zDEcHJnBjBlYXuxn7Rgt27Y0Ib2dZWM09gI15hVzhzuYM36mN
	bH5D0kvoGq16bTClecEy500leoOspQAHflpGF5ctMao4SH6xRpjao5NXBhcu3+8RJaN82gTH7FLb5
	jDXVXRIEJTo6Tza9no5ND87vfpPuLUF7Qr8HCOvbtkjeCITyKHYO+RU9IEZVncqATitWzjylLR+Hi
	erWVfsEjJm8SdAvbHJMLNArEeBRC0MYftMDDK+L+7X+5Gfisx+efwbJGvysSJEAzstKM1siRUHpd0
	qm3RyA0e+R3e3eHRnkhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4L-0000000FJI5-0ADm;
	Wed, 03 Jun 2026 14:59:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUn4H-0000000FJHS-2QHs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:59:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 653D4Zgf1956521
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 14:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OHsKV+ltiKXXlmj8cUFWo9
	IbTkRATlv2GK6UqkbO9h4=; b=LGP0dkdDB/zIX1VP4TSAhzZdDunN+X8a21fjfc
	kWdA25gpjcSUH4hBGFoMDe15TSA5J62MDzzfPpR33WVdWY5QlZ++2ocwmD8DT0im
	/CSnTGyUec9kqbVoNIzXvCLbZ8wHhm/fdT8tjf8lY5rs/G3h0wUxJWQGUg7JqnT9
	tbuLiIZTgtxwggkRGdUQshxJsIEP8se1b4FYjiD4OHnlhAKYXP3p4k4qBszLFiS+
	89EVsCwGN9DfKnutMcAfcVKnQrhO3cxak98I09t18A514ss5hzrWZIPhKJD8GTdA
	JrkY9YAEbCBdbioM3v58dOE13HczH2Ce4JRf5CnK/KXN9Hbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejfqc1ufg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 14:59:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8423f6247c6so4516927b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 07:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780498779; x=1781103579; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHsKV+ltiKXXlmj8cUFWo9IbTkRATlv2GK6UqkbO9h4=;
        b=TNp4P5ugMR4bWQbPul+TSsqVtpWrb+Dy43k4qAzp31kKESpd7lMaa60UWMjWNV/IAy
         XyvVUY53KzDX8i3SDT6HV26Q7MuvUsv2UwaxhWkJ4GKQKIaFFC9j0ZO8lZrh+YHm/mpP
         KBP/e8xhGj1jbJAAVgURplawurcjEgB2n1cH0xEB4Vjf+IeHKLFRjqsPYwzqWj1NJtTL
         +tCstLCKE/KrgdwWwP9xpft3YW5WPFYIp0ASntutv3MWm03jMTuTqmGcFbJ6RQyYQ2I/
         otkQ69BnPVWavwbKk5YeFVcl1eeIsajauJxkzm8bMEa7gE6+FH3pY7PwfAe1btbRseLw
         xU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780498779; x=1781103579;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHsKV+ltiKXXlmj8cUFWo9IbTkRATlv2GK6UqkbO9h4=;
        b=tYEaUFv7mRre8pP94YqInPNx2qSjQkhkMxtlt6dtVGKKmw2R++fmTbeMkykPw1mwOW
         JCkw32utVz1Eu6PFwxcZ6Z1A/KFOn60w/plx6ZqeotEy9zk0OfJnymZwbHSrL1EdsvBZ
         rdXCIvYx4RAq+UudfpHC+ceAapPgr5292Uao00FCiIZTlwtrbmimL1voKNdnyOwzgmn7
         TW5I3b5iBzgxft4WTE2wVkElI46QlG4UVn154P0+6DFLwgxJl1z5tlDA2jE+S8BmGo1Y
         gnUqIK+sfhfnsEnFNDBCN/hZQcY07rpOUOvwucFLrUW+Fygr9ou11dEfmu8NlCUCVzAr
         Lgkg==
X-Forwarded-Encrypted: i=1; AFNElJ9+Eu1U7FuZxY6QtvMt3xYQ+5hy1YAGqPPPHPlRdQLMxeHWNHqS8ErKsZP32xaMel+uxen4d7EAg23KGaBYbq2S@lists.infradead.org
X-Gm-Message-State: AOJu0YyucVDzbgYSfgGOUUQnzk6h41+1M0ttm+1xyhYqfDC+t3/G7qiQ
	xCom6M4xFLhlKGBV+zt0FyhAJQGWSTnHBZAsqVaEgMY5tQIM0GonbavyAxbIQ6IGRa8E3Aw6UN+
	PXGYAXODnhS2QDHYuROFfEFwxHEJJx+0iFXSuqthYtyW4guOZUl3AsROwclM4ZOqaoRXxj3BggX
	bodw==
X-Gm-Gg: Acq92OHfLDWUEDU/EXcJX64TwxDCJ1wqiVF0XwRMnGAhhk/iyJSI70uyFBhsIQt71qJ
	uqDWfb30VmbaQdiAS6gMZo2kMrGhT1cgSL9V1tMyNXXH38uKsMPpq7TW8wk/KXE2nauHS4DaxS7
	P6Zcw+ltR3QF1A1iH8Hd7tpsslgdITXRx6da9U62EV32rXkc1tISDemlGsI/+f4eV3g7+Dw3zb1
	sbBXSAJnE+oxOJM+m8ptCEG5Zo2DPaGlXjIYCQIw/1oEWnEVySeCluJpprMkfYl5gHhAf1mL3Ki
	+WR6eqWa2MS3rdN5mvjrALKBRetXdCHKIKufq5JLFFo5CQbHNDD44IfcYfMgpg3nuxuXWGJoZCu
	2WxMh0C6KG+btiHvZEqD4k4dEO9R895d9BvfKWScDZlZ7v6kRZ815mdTfe0g=
X-Received: by 2002:a05:6a00:4085:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-84284ef2c4cmr4096558b3a.29.1780498779028;
        Wed, 03 Jun 2026 07:59:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:4085:b0:82f:6e9:d1c3 with SMTP id d2e1a72fcca58-84284ef2c4cmr4096526b3a.29.1780498778597;
        Wed, 03 Jun 2026 07:59:38 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282882170sm3747409b3a.30.2026.06.03.07.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:59:38 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Subject: [PATCH 0/5] Subject: [PATCH 0/5] Add Shikra (QCM2290) display
 support
Date: Wed, 03 Jun 2026 20:29:25 +0530
Message-Id: <20260603-shikra-display-v1-0-aeac1b94faa7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1BIGoC/yXMQQ6CMBBA0auQWTvJUJMWuQpxUdsBRg2QDhAN4
 e4UXb7F/xsoJ2GFutgg8Soq45BRXgoIvR86RonZYMhYsnRF7eWVPEbR6e2/SM5ZZ6hq/Y0gR1P
 iVj6/YXP/W5fHk8N8XmDfD+zSrYlyAAAA
X-Change-ID: 20260603-shikra-display-07767208fa90
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780498770; l=2627;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=tlczd3hbO7jRStxmbXwY/7Pvez+jwqK8qrOvD2gZiqc=;
 b=NuBmKboJ2e9mtFWMrrsLSiNUZwFZCNOuWYAD9ECbT/obdMO75IR3X0zKzn8SsFhx1YCJYfXpd
 t5w8rKtPPLWAIxXudncUKr9Kq4VWoutNylTrUaf1UuMDOP8r2sgYGcu
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: RPnrjILhgLelwF8qQrCYU-4WjHXYDI17
X-Proofpoint-ORIG-GUID: RPnrjILhgLelwF8qQrCYU-4WjHXYDI17
X-Authority-Analysis: v=2.4 cv=e602j6p/ c=1 sm=1 tr=0 ts=6a20415c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sFAlhcv5WihPgsyf0pgA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDE0NCBTYWx0ZWRfX7XPY4ws9RGPU
 ZRhDBXCYSWeHMGgQW17nxX25n6SSP5zFbl8raRZS+W91NRnFH8xrByZHP5BdD+O+eINrETptiJe
 lrGiG72mDDeAkSRtRzsAp3P/dQaPmzdh07q9obBI58mMwv9a0XT9DTI+3R9Ap19SKtRFR5bzdal
 /0nGWZJHHBmQ3OU7ExAap4/nj5IRgLFDRid26QbdrK2Lx50B87WWVXjaM5u+xtCDGadiZx1HbIr
 uUypEycdoccXvxWdliloSHJjWlP3tsrU9T0GulUjT/tpTg3OnwmO2jWnIW9nDrQDOHONK3udm69
 HiXp7pCVnzlrX/2z0R5h9escxKEMM7DVjVlgFncKAzkxtcUrrJwv6havbe+jHX+ux+Xr4G8kuW+
 L1jIipXLrDhfNlHyVlXzU+XMHehr7DSqzFgLR2/lQ/XnkR+ORUs9NB/ERZQ/R0B5kl9RF00F5Ct
 kqQWqNHASfOMeAkW8fQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1011 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_075941_738124_99970893 
X-CRM114-Status: GOOD (  14.34  )
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

Shikra (QCM2290) is a Qualcomm SoC based on the QCM2290 family that
reuses the same MDSS/DPU 6.5 hardware as QCM2290. This series enables
the display subsystem for Shikra by adding DT binding updates for MDSS,
DSI controller and DPU, drm/msm driver entries reusing the QCM2290
AHB clock and DPU catalog, UBWC configuration (no_ubwc_data), arm64
defconfig enablement for the ILI7807S DSI panel, and explicit SMMU
client table entries for qcom,shikra-mdss.

Tested on Shikra EVK board with ILI7807S DSI panel. Display
pipeline probes cleanly and panel renders correctly.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
Nabige Aala (5):
  dt-bindings: display: msm: qcm2290: Add Shikra MDSS
  drm/msm/mdss: Add Shikra support
  arm64: defconfig: Enable ILI7807S DSI panel driver
  soc: qcom: ubwc: Add Shikra UBWC config
  iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU client tables

 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml		|  1 +
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml		|  4 +++-
 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml		| 34 +++++++++++++++++++++++++++-------
 arch/arm64/configs/defconfig							|  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c					|  1 +
 drivers/gpu/drm/msm/msm_mdss.c							|  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c					|  3 +++
 drivers/soc/qcom/ubwc_config.c							|  1 +
 8 files changed, 38 insertions(+), 8 deletions(-)
---
Prerequisite-Message-Id: <20260518-ili7807s-panel-v1-0-d7b048163b1c@oss.qualcomm.com>

---
Nabige Aala (5):
      dt-bindings: display: msm: qcm2290: Add Shikra MDSS
      drm/msm/mdss: Add Shikra support
      arm64: defconfig: Enable ILI7807S DSI panel driver
      soc: qcom: ubwc: Add Shikra UBWC config
      iommu/arm-smmu: Add qcom,shikra-mdss to Qualcomm SMMU client tables

 .../bindings/display/msm/dsi-controller-main.yaml  |  1 +
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  4 ++-
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 34 +++++++++++++++++-----
 arch/arm64/configs/defconfig                       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |  1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |  3 ++
 drivers/soc/qcom/ubwc_config.c                     |  1 +
 8 files changed, 38 insertions(+), 8 deletions(-)
---
base-commit: 3a34f9c13cc0688f8db2a0db8506bf8c0d90737d
change-id: 20260603-shikra-display-07767208fa90

Best regards,
--  
Nabige Aala <nabige.aala@oss.qualcomm.com>


