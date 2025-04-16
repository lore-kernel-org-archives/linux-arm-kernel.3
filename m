Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B13C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 23:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=; b=tnSNAqJoUnRRomQ+T3+WVscbAz
	TbcQICmTd1QuXvz30rmf9dfRFlJqUCqBEmeh2d88BaiZit3kyY3Mu8GznuSKmmFFcmhDWXRFrjdDm
	bTm7AhFuaIKPfXMbmxx8GHE2CzUgqajlLIRc1eTaeA6lRGsZ1urvWbB+hbFzWHwL49A+0At7lbdkf
	peianwU8OkYxUJpgQYAh4kyUk8/5MAx5eY54J8851ua961yfAXnKy2+VGDkEfPMco2Ii6f4alrqPd
	m/Z2zEf3WusGCP/wqbqDQ4WSujlDdgQ4sfg9lgrpvfwqZdHbK3KzSmXWk1cmapXySLW7pV91T4j6C
	9bswudGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5C3T-0000000B952-0pjn;
	Wed, 16 Apr 2025 23:20:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Bzj-0000000B8B0-3HoP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 23:16:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKx67N003645
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=; b=YM0AoGGgZmWEldlE
	XW1SpuqCx5Og25VefELc3ZGpd5xTgkzJXNqY2MEWKLU2RgEi9g8l/ETcSlmWLLtv
	3WKNThLnM5ZPsOHQdXzHYrjLKIRL/n3YYQY3eKLupdQ8CByDbKIj4Jn1BDZMytCk
	XQpTB/sRHKji7f0kDevG9RcUOldN7lTQbVWPINcsYjtX2gDfVQbqMseq7h1rjrr4
	Yynf95QKBOBW3J182fu1sLj3MfZIHJWJppN+hdKX+gP5SOF+hn7fAIsobL7zagkn
	78ZBevGbVP/SvAfOd+tlnIMvyBgDeP4E0Q5aEc2uhsjn/oRDLcORnQTuOjKn3LMh
	0L8j8g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rva9mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 23:16:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e91b1ddb51so4923766d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 16:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845398; x=1745450198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMnI8sXQc6fcICVFpeOcXllxBiGB1u5ryoWnljhdAJU=;
        b=guMGO+vwrgNmjFTfNvhd6C7ZfZd3qlTWB80ksWJ7EqogeYXzZ7rlUzghg7PlAH8p/T
         KOiZ+IomUgneS+ycJNduXy/X+aqIOKpaIQxnXUK67qsnYQOnu1IPORD/HixMcx3RymzP
         W21tBiH4SK62KLUD6qH3ODmdYc5Ais1zC/dtqXw+9XVRxH1YopKkrvDcjcrdlw3zuX7p
         LBhTvgR9iMR+rFUJR1KgTX3hRoAwIp18IUkyGeZ2TbaJFazjuCHSepmnrvSIcy60oVkJ
         7NZ2p+7d75ht8UWcT1SQUQ8212UrRROAqehOGAwYNOwuah6rQ14wDg++/MwRhgCuZRmG
         e8KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn0LY3FgDbk5bk562A555eTASZrm3JPNSKAkkEf6a3+KufTG6OcO8XBo2MD7HXc5tqo5uayFcI3tGFhMHgAOGr@lists.infradead.org
X-Gm-Message-State: AOJu0YyV5mebAwgh38QvWU9K/BM0CHF7pAOVPOXKWdZxpzyqgZms0o7m
	sQxv7tJZ1L5n0ahUqD8fuj4n4+HOAMRa+LOaZ/lYmbWiuZgww91uzQV2Tiq/tG40vHeiOMuvu4y
	o7EAgPWXsgsxhUKvcsaIMGWHCMyOIEIyPlNOfFT+I2y/K/HEVkTWALgMSJnC0N85qZiC+lVYZ0w
	==
X-Gm-Gg: ASbGncuxt17/c31pEhwyngxoJTGdDtcNTm+KHsXm5KUj1D9oNIhU0ZdI3EOXwH5qnVz
	bvzbWtBCygDHPB4gB1IQcIUi8uJBi9h2MFIyaFmvqJS0u6raIzfLlP3ImG/tu/Xcg2Kqk443HL7
	49RmC4rk3PUL43sOvQ/UmDAT9KYY2TA9GAlr69IbiR0NLw3qphhThXVnYPEm6pYy8q/UPXgtqna
	0zraIybo7eDxSDH98GENpMDZePoU86FffRSQWKO6xEPvUKeZqQtpxkkBY5iAAsxJsEQDJfCPmN7
	D6HHecar5fxhLipZqHAvH8WHKQ9/J3CNmW2y1FvswCf8I3TWlTRwK/peMD8r875fowdgUrlbs0N
	CHhep2V8Qd6AjSGinf87ph77n
X-Received: by 2002:a05:6214:20a7:b0:6e6:6599:edf6 with SMTP id 6a1803df08f44-6f2b3032dafmr64441076d6.34.1744845398129;
        Wed, 16 Apr 2025 16:16:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV2eYbePEhU79oEJdMTheoNgDUDRrmkT+27zL7lVtFXNTYV95Uc0K6ZKPeVd+SmU+iRObdqg==
X-Received: by 2002:a05:6214:20a7:b0:6e6:6599:edf6 with SMTP id 6a1803df08f44-6f2b3032dafmr64440776d6.34.1744845397805;
        Wed, 16 Apr 2025 16:16:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:31 +0300
Subject: [PATCH v4 01/10] dt-bindings: display/msm: dp-controller: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-1-b91dd8a21b1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=950;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=t96ussCqWyIQAdmFD81iVPY1jwLXVD8SP3JFMa/Qjfw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwaDVYA266YfVUJZHTtzTB6l1azoOGPFGCb6/u5iHhV7G
 ZZKsdudjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZiIZDT7P4Wii0FyBYrLeDbK
 BP9d+SHIqfysl2hye2X6o0C2pL+lG7rnGEu0e/pcSax5nBpsvHv3yWV+j2ZVRJ4Q3MQnUlQ3/eu
 Pu2cKZzW8SbvrWqYv6nHjzxvVi99tT/aq6/Av3qiZYMa06ppWrgpHkOf0xNlhh6bdE0oWVGYx1l
 9Y6vVBjsNXv2iVbcqfsqCFt20LFKV1BOZymrosiPddt/zEpvyZrYelJpb39l0XWlQYkLxx6szfu
 pdjP6bpuhr9y3P5n2zvtP3whlXfn6u+mFV+/UHq9nIdg7nmXr2Ft7k8zHo/FrwttN11LYE7+YKm
 iUnCroBDy6fqPle5Oulhlpq20T3XWPGeK9ri/n+zrssAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ONVvBT7p-eQSyd-Fod_9TvrqOZG1YC_N
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=68003a57 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=qy0Ph95xh7xgto4wCWoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ONVvBT7p-eQSyd-Fod_9TvrqOZG1YC_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=975
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_161639_825165_05922C94 
X-CRM114-Status: GOOD (  11.42  )
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

Describe DisplayPort controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..246bbb509bea18bed32e3a442d0926a24498c960 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,7 @@ properties:
           - qcom,sm8650-dp
       - items:
           - enum:
+              - qcom,sar2130p-dp
               - qcom,sm6350-dp
               - qcom,sm8150-dp
               - qcom,sm8250-dp

-- 
2.39.5


