Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B95C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjXjlNJQjaowHbkG3YqM6O2XdQTkytP/jZ3dM3LDh3o=; b=Tmg2/s/TUXJIUXsFJjeg/wbqzj
	9uzecVLMmmE6iaLqwRa5/E5ygkjStJ93YFWzNlGkeER+CdHnWJmy7nJW+Dp/eguxOC7WxjwPgOXpr
	pA+bASmrix4XB4/pA45ZwCbyNsylNKUYK+lyMssFJLSlOmlPEL/SPAVfCUVIIleITUEkV1/flDxeh
	cRHxY1s4pJxEkMte/eYHDiGE/Cocb5AfoRJrUzvfEJzqMeiQK20my4mtrS6vc6KJjoUXSgNp/Blx2
	eOi+nlUSXpdfbTKaweHY57mpjhA49JNjCfdz9Uj0mREdyDcfzyIaLfQSEqjVof0zr5du6KzLoIoHs
	PwTemBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4czv-00000005DpV-19Ox;
	Tue, 15 Apr 2025 09:54:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cli-00000005Asr-1wKL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:39:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tI8L025039
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjXjlNJQjaowHbkG3YqM6O2XdQTkytP/jZ3dM3LDh3o=; b=GxPMCufqNj1yNkQL
	rqcaw+cuLilECb62T0LZOrN/kBBE7h+mmoGkFDmM6rJJDMTbJ2cNnHCR8iCFNMgn
	eCNmzHY6htQ1tjDaOVyTdJ+QeqLaowwJEXREwEe226o24czNnh+CjR1bl5UikSm8
	X8pe61YJyS685xEd40xRgFQEyOVmtzaCuvnSTZWVz+3YRYq0V+bc4/bVKyEFr5QY
	TCFalDrGaqj0wPJErN+jsueAXu8hcrFT9BMl60878CtrySsZVnzEGeSGh4fbOr4u
	xuPc0KJURnFGJZ7lqgA48abnkPvDZopAe98r2w1oSGe8NhHTYByuOs/7E6v3gwHE
	doKwzw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qjr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c793d573b2so954964485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 02:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709988; x=1745314788;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YjXjlNJQjaowHbkG3YqM6O2XdQTkytP/jZ3dM3LDh3o=;
        b=KKkgQndWtoKGPxhigEwef9z89hdsBtL87W1D+Btu593MAgZE5GZmyH/iOw9HtgllsU
         o9DhfOZomBKb0MGbxYGUxoY489MkpJV0HdDWQNjvJtBV6Ye4O+IKbUMWvgsGSb+vwlIy
         XEEEw30YqxH4pnwso2O61G6S+U3ZtFKsy2Ugn6EiyNIKmhlFMwPiu15WspyfATuzRO1P
         F9FONKRUkwT9hxhPS8YgfgwUutT19Tf9iwxncY5aLzn7fjkhGFrvrWUyxXncm7bBUKbX
         BbeJumuChClkf8kD+WqgMkQyTFZpJ0rHiWEZAhTu8cWB/K6V7L95nkdXsfrWlGPgXTjF
         1jZg==
X-Forwarded-Encrypted: i=1; AJvYcCWo7T9nSrMg97dyEWMSu/ho51PYnKo6cD7gDFkE6GHowjNO6+m2R0tIk01p7j81J8pBrM2aC3KKMLj/S4Xb9bCg@lists.infradead.org
X-Gm-Message-State: AOJu0YxpEf/gLOm/9VcSKDepbumSwAVx9OAjD5oG2Kx8Wm9VL/nZSjr+
	BefAXlE6rg8fIXsyQX1wiNZ2LXp07KBsaONcOXI40VLwAIKjkv9wLOP98j9GIABG5bZng6hyXuw
	IxftJAig7CZ84TNh5Ymh3j4+WsQzp9APd0XGgfLkdyr6/vzkOJ+YmHfhH0c0jgOEr6Rcj5IPT7w
	==
X-Gm-Gg: ASbGncvBEkxmXDdvfWXqy/cuShN3X6B52qa6378GJKxOFPvs2eTAeFLCoeikExl72ag
	pVXFPakf5b0Owa06BS+Mgb/D89D140OBw4xnaLT/mzYJWFEefKWR3phpYH00p+DKhd3Ac8EDe3k
	pKc6owsIJRDQgHaLbBG2i3G6YVoKt8fIlbN5in2NeAQzd6tDFV91B/AFXSEoz7y8yi0XcAGEgMv
	C/ij/6FDpdovC0o8WkSvXPq4bw6DrFZHyGjZshw5NTHXJkSz8LAryr3xYSHIRJ5+WTRTPiktHWR
	Qi6ixWVVgGgcA7sGFa1j04/yGSewhj9eLJ0HK3HEoSNUEvMAT5NFGhxwNBMlsLMe0zQXY+9zY4C
	3ZKJ9u3Zz1j7IBgyK1T8O2FtX
X-Received: by 2002:a05:620a:3185:b0:7c5:6cf5:9439 with SMTP id af79cd13be357-7c7af115a65mr2232288385a.37.1744709988664;
        Tue, 15 Apr 2025 02:39:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTt3VU9M5DSQiZNLKLDNX7P+6oRMR/cwV9Qvdh22sv/7Dpfg/hivv4ML/QFqiWfEQYSonzGQ==
X-Received: by 2002:a05:620a:3185:b0:7c5:6cf5:9439 with SMTP id af79cd13be357-7c7af115a65mr2232285985a.37.1744709988296;
        Tue, 15 Apr 2025 02:39:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:35 +0300
Subject: [PATCH v3 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-7-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
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
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3195;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VXFGPbLULr+xGELX+USGVkfaqafdytyi08lrC/x1doQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilXA1DFE9LR6Dw8AVasEoRLrlP+3oPztAgJB
 53drEbQdyaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVwAKCRCLPIo+Aiko
 1ULTB/4mLzW4sxSigYkdzsjo5a65yIkeJB+3gZhK5UceQi1MBNqYKOjyKpn3l2rYMueGWV5Ff16
 f4XRGcSW1UF++CMTjmTCD7j8m+NYpHVx9m7XH02aBVgvLTVr17cnx0j5+g1rgDqPhxejLr9MyjW
 gjQMuidNq6D2duf77r08jJ4MhFCL2tze4ZByyKqJG3ygifvZSCypxv/ZQ5nPbNMHg2b6UIGt4hE
 QiNyO+puz769Vgu5yjLk4zIFmg9fD+nb+SDNF+W8vK5qgrVzkyIuLCGuRTyIuWH5WiCx33Pp1iS
 GOv0Bx05Bj+guv8a3F01idqXSzynkEOuyDUvBTdBjkU9y1nt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Qgf3wTagcJYrEH-UIuKgQxcBut6ISfBP
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe2965 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=WWvJJprN3eueWNfT7O0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Qgf3wTagcJYrEH-UIuKgQxcBut6ISfBP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_023950_631584_CBDF0ED1 
X-CRM114-Status: GOOD (  16.20  )
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

From: Dmitry Baryshkov <lumag@kernel.org>

Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
the configuration is the same as SM8550 DSI PHY.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_7nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-7nm-8150",
 	  .data = &dsi_phy_7nm_8150_cfgs },
+	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
+	  .data = &dsi_phy_5nm_sar2130p_cfgs },
 	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
 	  .data = &dsi_phy_7nm_7280_cfgs },
 	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_97800uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000, 0xae97000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_98400uA_regulators,

-- 
2.39.5


