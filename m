Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68F3C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ltZ1PKKJEdoyMgbWayeMUNrmRxrWHgSgaYMEX7T15KY=; b=PAKvKW/XG7tcsr
	Xf6xyQE0S1zU7MXxjUDSxpux54DrVwGilzX2mriUEK61nCOE9fq3Nrc4jywz24uZMVi4KYBgPJeVH
	gRZXYWKM9yQ0lRFsxtDM8SAMj49Ar1QTGqdo7kvaAh+CdtQoQz747uxkWEvurPNtLYuBefWOGnZ+g
	drbe8inLxNwKy1lXiSIE3wLUnOT4yM1Hetjvyk7ZUqRtx2hEV4A2if4odJBLUPUYN9xHJwvpDLMZ1
	iwrUmhmPl815C5G2XJu3K3VswYaBmhrPQT5LUQf7gkhfFLtm4OlgjZfPpLEz9dIS3ABqdYs3vofU0
	YzvJULz9MQjH4/lX4g0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjEc-0000000G0UY-1vFQ;
	Sat, 08 Mar 2025 01:44:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjCy-0000000G02D-2rfY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 463C1A44E90;
	Sat,  8 Mar 2025 01:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E758EC4CED1;
	Sat,  8 Mar 2025 01:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398150;
	bh=0xzbMLIyrzOvtrnxOzYygHtiJhTxXWscGZfJynbxvwE=;
	h=From:Subject:Date:To:Cc:From;
	b=QJ5pZUKbRsqvbYz/lq9JxpxMM0rzw4BP0U3hvqByTUqqfWq4I7vgoOZlhe6BmDanN
	 bO0P0K5+BXoyPKc+2JlRUgTNIDuhKONbNV2ccbADr+rm3RChmQtaI2xzr6f2LZQUJJ
	 PvjpbED9drEJjfGoYIoJxR+96D8L0vx5jY42PdS5hcb2TxWUyq51daID/23iwWRJr6
	 zSvSx9banYT2m5WKSY70oj/X1hBPPwo+sQ4dQ8gohCwwS0CqCjeDoptJA7l+CTSt7K
	 35MQjJRA3JvzrX/nl3mIG7MQyjdNxaZRHKeK9RxnTIDwvRy61lNZdHYA0DHcdpHVu2
	 WyW1llAYfADaA==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 00/10] drm/msm: add support for SAR2130P
Date: Sat, 08 Mar 2025 03:42:18 +0200
Message-Id: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHqgy2cC/z2OQW7DIBBFr2KxLurA2GD7KlUWMMw0SLXjAq1SR
 bl7aSJ1+b70nv5NVS6Zq1qHmyr8nWu+7B3My6DoHPZ31jl1VhbsBAizrqFYg3DolOvxEX50BAd
 GSDgiqK4dhSVfH8m305MLf371cnuO6giNzr27DjEIOeJkR2fF2wURxcwilnyC2QVvowE/jo/uv
 +VQfMCpy/0JxdktAinSQuAoTSNGTwEF7Z8VQ2VNl23LbR12vrbXLdTGRZ3u91/lDYi6/QAAAA=
 =
X-Change-ID: 20250308-sar2130p-display-b0601fcfeb30
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0xzbMLIyrzOvtrnxOzYygHtiJhTxXWscGZfJynbxvwE=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBny6B+rPiCzDjdVbOKP2y8wSLBqEba+tnYtIVmQ
 /BQyLQBNAqJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfgAKCRCLPIo+Aiko
 1dKsB/jpWhfIyF/tcV2lxgpDgnw8y1WeevEZbOVeV6M6hr/dE0v+HYy5JSfJH0SYh/d4kpmaBgu
 q2lvDQQ6dOLnvyE66RdOK25xRXmKKEhS74IB7vlf9Gdi9ZPUZkIY4aMhApDoME5n9wDQ9nkXYXV
 munhewHGKbi1hb3gSvLdQtc49VswONOmX4bGR56E/mdIOF6HHglpV27/FAisCkJjRdB9V8ou0Zi
 myamgawXe81BJWb5X2RCdz4KOw4ef8Sn23aueGrwrTyTuHSmKVVNVHk8/3xIBdB1SxTivTNvvLZ
 BOYhKeLuhUSkKxH9fvghEFZHjsQDM2pIlopMOAEK/G+I5uM=
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_174232_901178_4DF7E5E1 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 445 +++++++++++++++++++++
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
 15 files changed, 1319 insertions(+), 1 deletion(-)
---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250308-sar2130p-display-b0601fcfeb30
prerequisite-patch-id: bafc6ced2462f729333f18ff2c7d086a72b10744
prerequisite-patch-id: 63f7a35baf213cb869f0dbc9c06cd543b7ca3f32

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


