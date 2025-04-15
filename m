Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBD2C369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=; b=cgREzAyUbARC5O3VHO8IkmLdeX
	spTlcbkO1+Df05aoADe/e2KrH+asoKRw3/cEBNUeHYXcxPtIqIgfzezV4g6scfptFDRSX+9sl23o+
	hov1/a+5ro9T4Jiejit+VHr6FZIJbOgGoEwksNQnlHMSUew4lF0GVt01BiBz9jEqQ54k0cp9TNczL
	yo7sqlL5PB2oWLp3LhY/LGCRV8Xievswt3yFQdXXBKUpAlHLdJkOrJ2mPITRVuKPcHNgX9gWcnuD/
	RXSYBd4RLaOlud3WYh71pmEnO/r8m6Lk+FFk6UrSzseYh8U7dGWfSHAwDgfvcYSlVl4tV5I3CSsI+
	jGdYXeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cy8-00000005DUg-2Z6B;
	Tue, 15 Apr 2025 09:52:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4clg-00000005Are-2spr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:39:51 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tI6q018988
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=; b=VEKy+Dijiq3D2HS9
	CttI6+q/ldNvecUyGFgk+PBDZd+y1COnsv091oUDpau4C70e4fnZyfbm47wUfPRb
	5nqukibWXYS8Ak/Ok6BuKz/PusuXH8vX32lNBK9J45KoY9WPx+1fIuiz+usA0B+W
	+sGsuE1kXRfhGo2oEVDT/iEYNmaFeUXtb8xR6ct8rw7qxFuU2RufPOH4v5uDEeLC
	Rx8t7Yo2f2TE096mF7X4OF34zfNhHSlb38eVL4lVhR2shNf4lo5mjuPjueSD5Dh3
	Bvju9vlAPU9wR+4z05sT3D7Yg7Z73KV1zjthK8mGqN0xUSBHTIBiqK4WfMc4WlRh
	varBSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjfgb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so1292386985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 02:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709987; x=1745314787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9AgmbDCtg5twjkdaU8ecsDLSo+5QAUYUantq6/JrfI=;
        b=tVOs/VjTtjAEnuBF3LL+vDenOPY7wCerisEuNFhYdCemGf0Bhq5M1OlwFkOF9ojXno
         aXHJ5Zlu/oVoS2kvkzzqG+QHUpE+hlT0Vu6S0Z3Hk/TRyrIt+mL0HxCtlhODsJq/kCJ+
         3TIvtLVzTChoEBYZuEUykJJSSgSsGPou/dmhA6qgl6K8qnhHkcG37OyFy740TeOOP0b2
         jxi7qcvIIG+8uBV5/WZtZhXUvr2W6n+GZNF73Vh5IrYOtlUUPWfxsqEwkJ3Lggq4mAHT
         U1DsQy1mEHilYVI0C9/TOw8uYbZj16rDaH8XNaob4i8W03VK4xc/ImcWBKRDc6zdSSxh
         6i9w==
X-Forwarded-Encrypted: i=1; AJvYcCW+C+9R/FFxiTvXc9lxTQGQbEdLEUmk/dN1R6VN4v6mxiV4NkvUHINF6L2YHNs39jJ589kKlhA4wuMtgWwoVCwx@lists.infradead.org
X-Gm-Message-State: AOJu0YzcYc4UdwobTfs37Bg5G3C+Fk1kUnYqoqmZ74u51LSIkCLHpv0K
	6aCymxLVahRy+juGO1EcNk05qFeffbBVYYa3dt5RttKogV1lbJNls3+JoIMhZNGutL3v/VnGE4R
	p9pQCEhLM+7GX48u4r4enITMMtrVKjfYYDhpD6UWOCc93/zrgFom2Pu4bqA/LZtZ+atPVZg8rOA
	==
X-Gm-Gg: ASbGncu/91Mdu7Y3QQ9mh8secbeUUlL1IrIfa0EQxib0tSz8LA1Ner9FawmF+s3x3aQ
	XOxXDW9xT8H2zCyRFnZ4sQZA7i/SeTeKEU7WmE4WVF5BaAeT4ySqRJS/u7mJtwrmPAlClsStdp6
	h1WQ82oATOm9xFTzrtVr6SeEYAzS2IuNHokjCB2J571K5rpUrEJTh3GoeGumldVyedBbtzBr6+c
	I2sNy0zPki4ioYYctRFC8/o3OuK+ge1h0nvuxDnFKNs+aTTKnUXjaEAwjqP3WDbWTQ2azuaEu0h
	FUFfrvWcVfiHaHErAbB56jy7LNL3//ke2Ct1PatZSLqbHqBpmUVVg12fV5MO3mOVv0glz2tMoJi
	YzHTZHAlHLNC55/VUoObh61iL
X-Received: by 2002:a05:620a:811c:b0:7c7:bbc9:aba0 with SMTP id af79cd13be357-7c7bbc9abbemr966509585a.35.1744709986961;
        Tue, 15 Apr 2025 02:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNnFLA5vT9LBSCJYCI3wYTMJxns+5i+5nNMjNTaaqHqu7WIdEd0lcCu19hVoYSlOsP/K6bQg==
X-Received: by 2002:a05:620a:811c:b0:7c7:bbc9:aba0 with SMTP id af79cd13be357-7c7bbc9abbemr966507185a.35.1744709986634;
        Tue, 15 Apr 2025 02:39:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:34 +0300
Subject: [PATCH v3 06/10] drm/msm/mdss: add SAR2130P device configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-6-62314b1c9023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/w/74iYrKtAn6Ezwjelu2gFTZwiy2nDMAwTnc7sQiaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilWDQOXj32DrIB5f1c8i1fbFrhMbXUgwFwuJ
 rK+IaXWOZGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVgAKCRCLPIo+Aiko
 1VumB/93BM4l4rNb1vaPru2JaZuDFAsHysckNuR6nbScwRoFXGKP3DshlAILzwors9FN9+qfY3I
 FPMgJHcrKuzX7MfYGB37yKDkW84JsFXofe177vif7emU+yNciQcpFCt2OMLEC4YicOKMg/YwRLR
 JKkTp1+cbbuZyyTjX83GT332xV0oVphd3hdH+mBpR1yO/kOf8ngxeKlkxLes3AwPo9UYoODfly8
 2OYFQBakGA8BC2JN5bg0t2E/i6gkbgNB793qiSr/CvSn6sZLdWYpODgNu4P2C3BPyYB8535ahbb
 HGAKYIM52l/E67bm+FTgxudqZ8MMZZMjz+R1o4U01fhNfCYx
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: JvL0fDNyc-tGnyjDQhGWaW5Gm8OBtdx1
X-Proofpoint-ORIG-GUID: JvL0fDNyc-tGnyjDQhGWaW5Gm8OBtdx1
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67fe2963 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Zo32ic80xGYl86IK4a4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_023948_854781_72637A3E 
X-CRM114-Status: GOOD (  14.96  )
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

Add compatible and device configuration for the Qualcomm SAR2130P
platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..f706e44231a9c360ac4abe26e4050e416d8c3940 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -592,6 +592,16 @@ static const struct msm_mdss_data sa8775p_data = {
 	.reg_bus_bw = 74000,
 };
 
+static const struct msm_mdss_data sar2130p_data = {
+	.ubwc_enc_version = UBWC_3_0, /* 4.0.2 in hw */
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
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


