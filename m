Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D1FC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 06:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aPJH6AMt3R+0o42l1hNuerOXIrFuPaoPXNlRFcEX02M=; b=lZ1ks1Mk/69EIE
	E2mkUFtodOrpZUUFHHtlAfdjU6n6D3eDKD8cUphxaQi0esBHx8YRaMZ6eIUkpvnMUNAOvbz70A5fd
	1qEajrJbgE/RgGsF38TNjWA8tzjYdRgqqZvMjdVPZSecPye4zPOffqSXmEQc7SVtB2LOeQy9BtsFO
	f8v9a7U1NVMnAISo3xAVDCtgMlnlfWGBkFkbpRVwbMWnLHicN+yihZvaIYieNz4FJhfuIPo47763a
	1RNSIIh4XIH4pPtUMcLXFCV8fu1nTgeqY81LIsb4w1aRmCPlnGBDA9DvwaQYAF4UNHqkBe9P0luSH
	BlHwRL5H5Y4hbZHGeZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyG6-0000000DAcB-0BEX;
	Fri, 14 Mar 2025 06:11:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyEP-0000000DA7F-3YsD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 06:09:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKE2FM029237
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 06:09:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aPJH6AMt3R+0o42l1hNuer
	OXIrFuPaoPXNlRFcEX02M=; b=KR17KZ1jGpoMMw+0ZRHfo83sMMfmCxecGflW5R
	aoSc+1xcAPkgZ193ocpHsQy/3zlSQe/xP+KvW4Op2x9ZNkxbQIa4nCMwkLmxokEG
	IegdU5EJumfyzxOM8TiUDr/99yhI63v8l2xXv6Ewb5+UU/1XRfxM5YZK+zT2VpXX
	8nXboHXvmhC5z9MnHEiz2bMHYW78GP8i2icmHURyon8ZyoXMwtcgR4vj21ys3acy
	U38YZD/MFLsi5T8XE4cqaQa10pXSTgFWxo4dUH4Sigc7EyZ27dBHHfUDjReG5P9y
	Ybre4wHP/mS3ml7fxqVVxwtpyu8mIGcXtqiC804lGOurNvgg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c67314pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 06:09:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c543ab40d3so298883985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 23:09:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932556; x=1742537356;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPJH6AMt3R+0o42l1hNuerOXIrFuPaoPXNlRFcEX02M=;
        b=sTWtdZixD1EMWCT9rmGa+bL0AHEJkgD6EYULzp4WmcZ0kLseLibYqx6KGEVY1zfDCh
         wFZuz9MT5/W+T/MwMiENNzdYyjOovY+a5ZnQmHeuSGrzRLdfZ/A5BUiK0AzR2TlM/yWk
         icnj2jerY/gD/HxLSA5RowVT0uuQShu+aleV8YkDGGU6umc5iaK34vk/NmuSvJI8LdtN
         ySBq9JcZTiPJ1KJAMG2qOYPOBPEMmwpL38OKx7wZzHfEsfBmFiBnsKzLDD8CDPmrkFN/
         0CqLgPs+ZSvkesOVcDGba3gAYjwMCXsCjOpXeULXXgh6LVLe0XWnabZNcupb9WDvAM8Z
         Q9DA==
X-Forwarded-Encrypted: i=1; AJvYcCUmUBT3H4JdNlfdFvnSoQRJYmeiDXPt3LJO4suEtO3BdrIQ1coDaqzS42V2/O9oy5goIS+0N3K5NtwIJyjpCB4b@lists.infradead.org
X-Gm-Message-State: AOJu0YwI0FSJZUMYAMZanQkrOuAPufN3zY18aQIgIwH/WHEsjTU+nYpP
	MOjJ5lEWfqUSM/bncX5W5tPv71/PyO6hS5+gmkR1cVEZretbpOsQ+pWXpO0Z05W+TaxK52ksfbt
	Dc9H91T5RVQg9Oik9BrYEKVndh0pHLKpo079e0zMjBkySXvifkYhzlVhaH25X0DIZgtm+najlgw
	==
X-Gm-Gg: ASbGncuixxUbeqH8jku+lb3GfXOmSnztYcPqq2cpgxCDf3HnFF1VZI9kNFqoOfm2KZe
	EB5e1dyI/W+ly1LbLm5HzjF9Jt5KK/QANQGfrxvP7zVKV8TugYVFrsPk/hDfX5AjzAXOGVzbBVZ
	23g248eHOka4G6NV1OIGCZ9AyOUan3ulTC9NcBIH6U/eGi5/GBqoJA4XBm+0IZYpMZE9ibnQHOA
	g/9M4I06O673YtKwcqbe0GwSaQ0I5n9TeOZGnjk2YIBfsd+HKfguQgpafwTbMZSASkcjKpvFfti
	L8F75m9mvezJWVtor4LGcD/A4FofpwdL8B4DRLo2jIlGkQN17VnSKkFjuw5kAxiRntKlsnltjAG
	UWFMMT1w6bRIqyVdsQa3W580da1R5
X-Received: by 2002:a05:620a:4387:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c57c8f2fafmr153254485a.57.1741932555840;
        Thu, 13 Mar 2025 23:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGU2fdH1nYknRxmyE0Pv1gs73Y7wtDiY6qmVkZjEOFWyyh/E2KJTtu6R4id2U1COR7/iYgZsw==
X-Received: by 2002:a05:620a:4387:b0:7c0:c469:d651 with SMTP id af79cd13be357-7c57c8f2fafmr153249585a.57.1741932555466;
        Thu, 13 Mar 2025 23:09:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 23:09:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 00/10] drm/msm: add support for SAR2130P
Date: Fri, 14 Mar 2025 08:09:04 +0200
Message-Id: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADI02cC/3WOTQ6CMBCFr0JmbXXaojGuvIdhUWCKk0iL00o0h
 LuLsHb5vby/CRIJU4JLMYHQyIljWMDsCmjuLnSkuF0YDJojWjyr5MRoi4NqOQ0P91E1nlD7xlN
 tEZbYIOT5vVbeqo2Fnq+lOW8i1C6RamLfc74Ugd750LuUSeBnv3PKUT7roVGv/v/bo1aodFs2F
 n1pz8ZcHxycxH2UDqp5nr/LdYw04AAAAA==
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JcgEM0xedYxu5bYof0Ovcu0EaEeskIX5tXdtwYapZDI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gGsPRmM7wX4zdSQvNqp8Q+K5YNl0IUjqldp
 1a8iYn/lUyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBgAKCRCLPIo+Aiko
 1fvtCACoM5/p8j/jiu1MRW5fm7gny1R4+IwOUzJ3uIj1j5bnsUYdAGdgeJdtDhX24RsqIWpk1U+
 Me5C1z+Bp953zcjJx8/lOJFsjdZV5hOAqQjeNkTeFgFpMtT0fyAzzL1jycxmXWGy9XgIB/Z/bMd
 soyL74eqB6Dad2frQ+7rs3SJNZZhQt+Aab4+RrTpmpSp8EeiC5nndVMn8ZJrGiZvcha6hoxI8Do
 +FHJP7cgHGqFPBSNasJ3TQl0pxVqosTAgBKBNU1Ec0UtmUwVpy1BvjmZov7f3jBB3Gc/Ur00VSF
 Q9ws5Dmd1JPROErmBHfToVHVPPUHi5O2BWiIFOFdqco7LRcd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3c80d cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=qnNoV65vq9fCYBTq3NIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0ivtfWKQGthq_NkBu94R0LiQZQbv21de
X-Proofpoint-ORIG-GUID: 0ivtfWKQGthq_NkBu94R0LiQZQbv21de
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_230917_903389_0B227B2E 
X-CRM114-Status: GOOD (  13.85  )
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
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 394 ++++++++++++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   | 434 ++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |  23 ++
 drivers/gpu/drm/msm/msm_mdss.c                     |  11 +
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         |   1 +
 15 files changed, 1313 insertions(+), 1 deletion(-)
---
base-commit: 613af589b566093ce7388bf3202fca70d742c166
change-id: 20250308-sar2130p-display-b0601fcfeb30

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


