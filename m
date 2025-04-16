Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1A7C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 23:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7EAt3UluOmXSwF8L74aTCfgjll3Ii4qSJWllOyJC/BE=; b=CF7eEY4C3Zwwew
	hXpYggsnSI524Ev+CRr7O4AVN66v7C+kIiwJHTnKZ2boG4ahrUf2N9huAA9fcjcuFAku2MG+ik2rC
	Zs44z6kVVM+zFufjtZMb1auoDPF1AjuadFXcE20j6f/vgPpYuQVK9eXJJSIdfkOl1gpGRPKcA0w1P
	6Fs97YHRNG0xMqQarZurJ+p597deWW+toJLHHYKSW1nkZCPMepTFtWaUwEiu5zWdjwp06o6mgGEF9
	aUTC0udv7XFjOTBlj2QtVvKUExiiz7LEiAh7TbEI+KESCAHcsSqhAc+9RpCdlmIhweNjM4XNPqOOe
	IYvpCgUPDf5iBrkuWNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5C1d-0000000B8kh-2Auk;
	Wed, 16 Apr 2025 23:18:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Bzi-0000000B8AQ-2Y12
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 23:16:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLo2Gf024733
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7EAt3UluOmXSwF8L74aTCf
	gjll3Ii4qSJWllOyJC/BE=; b=Hin1Ww5fU3tuk8qieRv8MC9Avy+XtKOu4AWA/c
	+y4dZQw90tnBs5u7VluPzn/AGwjki6lxmfvBlqDjXDRt3jj/ZVQIe7VqtcxfVTEm
	fwiHPLrA7cq4WaQ2M9pZY4uVqrLa+azBmToDuiaL/BGlSf9sxZSce1HHR9KJfCvb
	qMoXK5haxPSWfB8PJLiQRtX1JzHYG7kyRtUuLez2kP9hRQR0iEc8ioq2XALsZVxT
	pFMQilSq8hhsAkb8ogHKOOcK5WToZ2tD6KZulktDFud9E258R5uBO+2RaIMT/I+R
	SQ7AFZhYEcdgicSU5Pwl+FkNLZS3ufK7vYaXI36uUGw0mwCw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjd7x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so4923596d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 16:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845396; x=1745450196;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EAt3UluOmXSwF8L74aTCfgjll3Ii4qSJWllOyJC/BE=;
        b=O7ITdmBsOyb3+3dTFEM18iSVQbHl8lhZBDS43BOSqvSg7x1JonmRZHa0zsptEM7JRC
         +KXjVp3+JFXrdvUmCBi8LAAQyyZbDXX8EG7R5FkLRUouPHK8Bo1GyZ5WXkR+2kgIMM0g
         OGRbw2FR7UJfDlqGLCv+NcSKePVKADhMdAmXG0Nwc+HXrJcenf14JTUjkR5csylMnT3n
         b7v/c/qrHh5ajtZRj+8xlT2kDmiQ8w4PxJKDEFNccID/YkCsjPEjWs1Z7OzTK0EefAFF
         UwYHwzytnUwiYNZ0gY/d2/3+qgbxwHM/Avb+Mn5EchLoSzhf6Efsh94ajS7in8s1wK61
         fFkw==
X-Forwarded-Encrypted: i=1; AJvYcCUK+b7LFBi7K/iRaUOHR3a1g9avcuQUYqU73LerPNBDOWOvePNCxmJpAXkOaMmiNrIl3FbykgKfkB+EDQ/O9Ip0@lists.infradead.org
X-Gm-Message-State: AOJu0YxzHn4pFMDcyVD18ID1Rqgns3pdwAdBH7ceweGVfMuAaC5MjeQq
	NIiuWcHyHGagGtyjceDW7xxyit6CkJG9fBPDlUo09Aehu1HONyMrNu81iYYSejwh09GdCrKIVek
	JS2TelR1UQ7Dlzrbxjn0Jr/FeWQvjAkGhUeU6Pe4vlqfMcsoS68EpOVwepQmO/JL0QrY8vSfJaw
	==
X-Gm-Gg: ASbGncsQKUNbefk3QlKWjUL/boDRxc+9FxeYaYmi6qnKZDtzSNcoHDaAu1lAAN4V1U8
	cH5jNFfqzatuGGbT7T/dS85LSP/ZZM4WVQNdryd65KXziE1AP9X0ARR2MOoYrWa+dm6Y4XKDvnG
	PA7zTRWR0vH/T1HP0JiPGm3sR0tk6jYgSZqiFdM5UDCrdUK2AsPx16wxDr81Tyic238nLEQD4CI
	4dKlONpSC6cYEmOI0xyC/o50xLoOsNaNrclhfcMQVNpy4ws7tjioeElH3vZfjgJX9EWZ5FWhf/k
	+5hYeE7UP8GT2O0Df2Qo9bBfBC2x79hCJq/cOHlL3WsEEYKrwZPjaNnaIiDAw1p/cRz1vfK93py
	6GCO44ceUAm7mFn2O4pV3BOXG
X-Received: by 2002:a05:6214:1c81:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6f2b2f8bf21mr53086726d6.26.1744845396293;
        Wed, 16 Apr 2025 16:16:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa9CyYlPHR76U+wpIbjfz5+zG+tcMEvdR/pJVUtUtnG9kDhHh1koGxcXHC08b08rCC56n7JA==
X-Received: by 2002:a05:6214:1c81:b0:6f0:e2d4:51fe with SMTP id 6a1803df08f44-6f2b2f8bf21mr53086286d6.26.1744845395916;
        Wed, 16 Apr 2025 16:16:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 00/10] drm/msm: add support for SAR2130P
Date: Thu, 17 Apr 2025 02:16:30 +0300
Message-Id: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE46AGgC/3XOwW6DMAwG4FdBOS/McULFeup7VDuEYNpIQGico
 lYV774UDtuBXSz9lv3ZL8EUPbE4Fi8Rafbsw5iD+SiEu9rxQtK3OQsErEBDLdlGVBom2Xqeevu
 UDRxAda6jRoPIa1Okzj9W8vy95Ui3e5bT1hSNZZIuDINPx2KkR/ocLCeK4j1+9ZxCfK4PzWqd/
 //2rCRI1RqnoTO6Rjz1frQxlCFeVm3GP4IyOwJmQavOmgrQ1hWcAnN5u9v+/WCZy+boX8eoasf
 R2TlgvtEo9wWod5xlWX4A/W19XXABAAA=
X-Change-ID: 20250308-sar2130p-display-b0601fcfeb30
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2920;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=re5I34eZqbzRiPw/4I6ROijC5iSjI9aW4YjhD8I8qjo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpQt6QnxuHUxftotWk2OlvAZiO1lHUeLTtbz
 n0gHNKPi8GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UAAKCRCLPIo+Aiko
 1dneB/oDKs/x/qXBDu4zM/App/txTQOV1RDcSPyDhFpjDNAaDhm9YKy6/fss2ciMM3oNbTQe7xj
 GLa4DZwyzaXI1oJAeBXrN6sPh6kiGCTbS8q6mFiQWhjixbX8YrxZ4JZxqsfIZhX8fyEMXanGDMG
 G2Z+QL+twxDFsWQRvysKw7usWWOuG2O1aA0I0DvO4NPTyZvXczJuD//vbmZ0JfaLi2tZWv8LRaJ
 ssuXHlM8asP13rn2xUgBcjmZmL8aHS3rtvA6clhZR8ILjBpH3T8cch6WbKZsWUGtgYQpgFLLaLM
 cYlVbQIqPoOmO/2MSAKJ4kr94yvlBCO6uXdH54p8ZMDHAQ2p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=68003a55 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=hvGiVLgBQ5XhCkBqgSwA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: etKvPYjyhjp33t8CykD4AnogBn4YDrtA
X-Proofpoint-ORIG-GUID: etKvPYjyhjp33t8CykD4AnogBn4YDrtA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_161638_654340_25FEC7C3 
X-CRM114-Status: GOOD (  13.14  )
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

Add support for the Mobile Display SubSystem (MDSS) device present on
the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
controller.

Note, due to the technical limitations DP controller wasn't completely
evaluated.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v4:
- Changed MDP->EBI interconnect to QCOM_ICC_TAG_ALWAYS (Konrad)
- Link to v3: https://lore.kernel.org/r/20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com

Changes in v3:
- Use defines for DSI PHY clock indices (Konrad)
- Increas VBIF region size of 0x3000 (Konrad)
- Link to v2: https://lore.kernel.org/r/20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com

Changes in v2:
- In MDSS schema switched from list items to contains: (Krzyztof)
- In MDSS schema dropped extra empty lines (Krzysztof)
- Fixed .ubwc_bank_spread in msm_mdss. (LKP)
- Link to v1: https://lore.kernel.org/r/20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org

---
Dmitry Baryshkov (10):
      dt-bindings: display/msm: dp-controller: describe SAR2130P
      dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
      dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
      dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
      dt-bindings: display/msm: Add Qualcomm SAR2130P
      drm/msm/mdss: add SAR2130P device configuration
      drm/msm/dsi/phy: add configuration for SAR2130P
      drm/msm/dpu: add catalog entry for SAR2130P
      iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
      arm64: dts: qcom: sar2130p: add display nodes

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 439 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   1 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 395 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 434 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 15 files changed, 1314 insertions(+), 1 deletion(-)
---
base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
change-id: 20250308-sar2130p-display-b0601fcfeb30

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


