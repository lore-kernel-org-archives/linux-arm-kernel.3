Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8192AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iimhEWP2oks/eQMvU3Ted464IrTOFEriTwZPB4Aj4J4=; b=E/1R7hpdaIEADiZ7B1oShFzBPZ
	52ZbGLclteXDPqcLSCTGazuZcF8TVVmPXVgVK+2iZvHIyHT7wXKbW/FvJdnyc9Cbp6+qIZkgm2G89
	8xCqC89Ln2+NJla8w5YYkQi9NiJysayfK8W5uus64IfEEGsfAAZiqVd2fjPxmFQ0nooLGirJ+bLfd
	b5/grqB5HbTyk3hDQ8ko6Wcj0Ae8ck5s3b1/01VrryiypS4VGSHfH4CGVQtUwio95IrLyb3MrRVUQ
	JvaN4DuXeMzqKfZPHfTTjMHSy9Z9vAMrFkrQy6/VXIfzL1W5eMr1hY43/rz4K2zxb6z4/7cq7W74c
	DdBQNg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjOC-0000000G1SF-2sVG;
	Sat, 08 Mar 2025 01:54:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqjDV-0000000G0Cz-3sN9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 01:43:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 94053A45760;
	Sat,  8 Mar 2025 01:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C700C4CEE5;
	Sat,  8 Mar 2025 01:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741398184;
	bh=2D0mactFOj14u8gSqC96vNkY8H1lUrzV3X/QcoVcSqc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F5LLJGD7OaG8ziwJMqd+BrNf711TNDgEJsOku1R//xTgZ+gsCZTkjCEf2c/a8Cfhv
	 +Rg4ZotbsnkgBZmyx6iTxvOMv0ELoHRgIjm57AwFwEA2RsW8My+7ADzvhiUIWJmbZh
	 VdyHQX62d2zYfTkO3r9SZf6WWHC0+RSLX8Pvmm0elSbEdzPuSsh8zb3kqh3d+qFY1Y
	 RB5Pojw5snfFjLgrqkAskRqJq+gS5nBts0bSspwhIzrJCElbtxrZjGI17ZzV8az5uX
	 3PgG/3e55hpl3oikGrVJFhaAyns7V6bXxjGEW2fupXmhfVBUQfibIAGbEv9N9hp+Ic
	 n2fRM+WBW9z2A==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 03:42:24 +0200
Subject: [PATCH 06/10] drm/msm/mdss: add SAR2130P device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-sar2130p-display-v1-6-1d4c30f43822@linaro.org>
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
In-Reply-To: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vamBBACjk8tANq08hvJz3G+yfor78/Ii5rj2IDuoZiI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny6B/qznHG5lCxb7ywFf4TmMXgesSHLuwznEDZ
 eU7l9i+pymJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8ugfwAKCRCLPIo+Aiko
 1ZffB/9PRWd84GsU0grE2P2LUTDFWCPDs9W7Dx+VgVad6tVqwot8UkEIgQhTMW8+Xhs21PpFuu1
 Ip1ALCBLDpLofSPbNVuD7cSTP3bxmbN7CAWWsAo5FWWPTuDAZsHUyxZjgKxjIQ6tPYRZZRgzJTO
 fEQTIM3UIIE8tkwmZpbLrhjz9fevECpxDxP9A8efbj4TiwfEMTEW+vBBtnX6cVHXjyDPQFc4Fz8
 MuLmmgEB6fNY0PQWrzN9hv+xCDFBbPVRRWUp2RJec/XhpDtB8pHRsauGpyLHj7nIx9veKc7jNW2
 icD+QCrNgjJY4R/NO2zXwXIjCCxQoYsjQkDLJIq45rlfyaBq
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_174306_141987_9D997841 
X-CRM114-Status: GOOD (  10.32  )
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3e82ba0885d03107d54eab9569bb4c5395454c7a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	.highest_bank_bit = 0,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
+};
+
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
@@ -738,6 +748,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &qcm2290_data },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &sa8775p_data },
+	{ .compatible = "qcom,sar2130p-mdss", .data = &sar2130p_data },
 	{ .compatible = "qcom,sdm670-mdss", .data = &sdm670_data },
 	{ .compatible = "qcom,sdm845-mdss", .data = &sdm845_data },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },

-- 
2.39.5


