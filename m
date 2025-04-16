Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DD5C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 23:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=BZXIvKcfRky/ZNzi9emFwuvJfU
	iRcfyPx+WAre0c7wi37zKdkkxD8o64epZsgKqnzXZYqXMsFvZZ4lUCbaSYbWH0kVdEy78SPVy01kO
	WTrCQpM+laa8jPWXA/Ix2K+ff5degA/tFBF7oEngJZi8D4McqYYqzIKDoXo45DibMJXcxcGvzXxox
	caZ1/BOOGhuEOT1bBHthhDKE3RtP+67skPKyRyyQJvAQUC/MgWST+5WB6lWvoAIZEExR+zBeSs4yL
	fQCfF9KJfZD1wE2sM+d3DMBhALPsEVbkGCyFMudlQYhR8jCBIi+7fyWVzUJaPnMiLPsAtW/RYwmgl
	CKSE/h2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5C79-0000000B9UB-2tGp;
	Wed, 16 Apr 2025 23:24:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Bzn-0000000B8D0-1IJZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 23:16:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKxMUj003419
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=; b=Ypmt7D8HkfGahof3
	uLHNUAbjnYGzyfK9/AP5egc4Ntryyv4nlUMLwZtyigudYw1x6Zdd2kxp/l37TNUS
	cwmKftw5nfrpm4qTs3LK+JTz6DgfZVwRQlkDLNOG6H1mz/AGBs0arbLvfTTebJrp
	SsGI6LlKzUmZOTrW4dlxUfMfD+oMobw5UEKhmkgcXZ+3EDHwTLCBXiBujVfmKhbu
	K+lGBO7Ir5bjF025AydkFLtm1d192V5fHdHsOgpT3jQAeYT2UxGaM4GE4f5GxRwy
	no7sXaeNErQxjSBycevi0oNqEjpSDttSK4YPsxe8l95pURHF8ek8uzsbUysjDQ8J
	iJDtkQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rva9n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ed78717eso3425486d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 16:16:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845401; x=1745450201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QbvJSKxnfDapkwl00/Ate2tQHcvUoOl5cDQeaEM+xs=;
        b=oiWcAEujLR5AGjKh/GuP8ol7TfcxhEv6x5AyJEgMJaOn88jIXB2hxezep4lV3sMc9n
         jZyOsi/l5tOHJrJQNXlx2uZMWNA/L3jSrsTMjLtm51lFvNY2IRuVRgBNNgO8wxun/6sQ
         2TFnLGjDGuozySMxlL5VyD+LaBqUhkwSiJek2KJA67aWY+IqTLREkaPAcvv34u9ai6ho
         9xg16uz4jnCl6BFDjFLwm2bg/AxBJ7Uw2GrMORmgTjnTKosi7DjWwiDAJegTMnuaJQP/
         NlUzcCBMY1oPAoPJes3j9ryyx4X0jTEodj+D/2HurrB1bIfw6N2OaabLwL0TgrqxaU+j
         MXxA==
X-Forwarded-Encrypted: i=1; AJvYcCV+RKLKfGjGT+TiHiJ1/cXNPd08j9oB38qLhiG4TiZappkCHJLfZ8un38NjWjiKTKqwq4buIveXMoB67pIYmNPU@lists.infradead.org
X-Gm-Message-State: AOJu0YyGrEEdYMl7Ark6XRBXDWI7zTuwnqx9rDgwOJonrQP+dHv4y+Oi
	6Kp0b6EbrM0trwr6n5KhKqFD1wJNzJDca1+HlSxClD+TZncH6kXn24+iVI6ZuAr/zBx/whu5ZO3
	PBQUfyzFA2b85Uh6lD2roK3cEGZN7Z9B2wvgNLrG1EQCa1aTWzCG6NJf+jrKN0gRDwIOyqhMJdg
	==
X-Gm-Gg: ASbGnctxfxXVJiwSyFJwh4ABRoI60talZ7tLFgTfR5lxOdx/RovlxmLS1vyLDaeeinJ
	Z64svXdZtMyPyrQNAgDEG3iJQB+rVZM1bTrMZTzzZajVSxwD0dZgXFMGUhxegzQ42MtEiUvG84R
	BRlftIV+wvZA+Ju7h85sMaqxyzR0uBWrcHYzMGw7Dop3vLwXNvTDzwEbwdntBalePw2dnWIz0gv
	NeL0HokepP1wyLGNpBsrLuAiccKstb+Yr6GycZ6bFjSNSXWHxxMhzPTAmeSou8YxNg/vZr2F6Ub
	L/nkAaowXh28YkxGDoYG23vfPPfjpqJZRekRi32PKL9j3gP8oeEIiMvpikQ5hXF9d1zNjOA9k+7
	Pt7Thha36llojG/x9V/T98u7S
X-Received: by 2002:a05:6214:21eb:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6f2b304b384mr65723976d6.31.1744845401554;
        Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFodq3zesjzB5AD8ZHwYudSr6HtnwZ1FwskPTmT7ERKcUtRooBLKijOcL1qw2PrbhGDKECqzw==
X-Received: by 2002:a05:6214:21eb:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6f2b304b384mr65723356d6.31.1744845401109;
        Wed, 16 Apr 2025 16:16:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:33 +0300
Subject: [PATCH v4 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-3-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
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
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpRqFeCbsoSliYom6fgv+FNrJxUdOL9SE2pO
 L35U8RUUXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1aCzB/90xZfYQtLjQ4Gcp/7a+/k3O6aBnT1+SEVNnkCFB7B2SpWZzM4FKoNNzTmPAdlxNAQ6pV7
 uwyyP6e5IW24Rz0J0GVCzdPCyhdxL3OHl9yko0VdElC4+W2RkCUXDKL94GyolrRmU0GG8WtTNGX
 Zp0jcL+mKLfRDmJk7u3kTpsVYiaWr0iSYhZLOQa0e/yoTMlXZ24HgA4NpbP9k5si6mJeXpxQV5B
 gwkNc8wbu8flZkg93wMvWjvX0kYwPbTZfY/Q2jXkJGFWsk5e9E013W65zVfCRoa2McSCsXmVSL5
 /W1ToGzJRdarfdz17vfvONGPGWfUMZZ92wPwjQkStZYyWLU9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JH5nHyXBUTuiyWC19vHKbjYFBACoupGe
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68003a5a cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: JH5nHyXBUTuiyWC19vHKbjYFBACoupGe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=976
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_161643_366520_51A53C58 
X-CRM114-Status: GOOD (  11.23  )
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

Describe MIPI DSI PHY present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 321470435e654f1d569fc54f6a810e3f70fb168c..f79be422b8892484216b407f7385789764c2de1b 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
       - qcom,sm6375-dsi-phy-7nm
       - qcom,sm8350-dsi-phy-5nm

-- 
2.39.5


