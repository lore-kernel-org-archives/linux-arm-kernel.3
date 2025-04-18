Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3818C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=; b=rm8qWRtsOPZE1aSjf2sAE5F4VP
	JS7RvDlpKLqgB1GlXEyL2A4R3+F0RA9yKIoFsqtOUfxzs/Bw2rGAhbd+7UNWqr+BQgJmiJTwQ29oa
	vOraZT5+ajJ80/S6RPEaFXzPkW2ZvIBsRSTLN9nzGuIOZ6JvCr04ylrth0R+VRHXjIlNhrMXIo5H3
	ehHCEYmEyRzPic+BmgDelNA3PexYc9vo5d7eBuJYzQOFBAUIZ2n09iH2+lhrMt6ImuCv92HDrB6y3
	MR5+ej1VouRiRVTFkXyOLAAQBPKKP8QoiwZT+U2QFR+2Hdg0qJ9s2t/I01+Cl+auzrlMqInPt2z7U
	AWooOolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gxM-0000000FbVc-3b4Y;
	Fri, 18 Apr 2025 08:20:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gUE-0000000FWG8-3BPL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:50:11 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2xE7x023398
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=; b=eCUqwk7WrldP/479
	+zM4v0Fh1pXTuc4GsMAqJyIuMvJ3xzsCQIPfNxFk/N8AA/sT2xGygz9P6Wsq/gYA
	VweymT92btExAPH+x+7NnRxNsvnUwxKozHbTosZFAIaoWOJResR1+dUlxkORzc5Q
	MDP5xX4ghYInwmeR4Jrn2BKymw7lLqQ6IEbV1mJ4AK8YNgQBbdHFijBav3DeLq3r
	PzIm8n6HV3qshsBXP7KWN+2tlcifrRbtnYWIHn6e8ioDW4MW6xzI0a5Qyq0hZ5FR
	J+/Z3Q4MdZnibrh+Czvn/V0NfyIbb8A1AttQYbmg5l2G+bSt7/xT12xpQPBCbSAb
	08exMA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbq148v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:10 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso18332566d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962609; x=1745567409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAFb1O+Dpw71ujShOY3u1RWTe/53Rsuu84mfXeGabe0=;
        b=esiMhUy9QFqVjD/AbtqsFd3o8yah02nftO/bYrLYBq4ePzlxWgqBLy8kr7u2z0KYp+
         nOuNkXb1sVHy+xzKihrXZNzWMqa/yxICuskr/YFqM8nQLTOLVV4QBhZG9v+l/L2O62f/
         f9rrOuZBIxs/uH//FYZm/JY8ilpjsgFffCAEtoUcD7aWEMztYR0pgt9xlVQWnkDXSpEU
         DrQuv3VFe7FYBMTkfTA9w6bWlUYcPSozxjI1tExQ1VQp4v3qFzOPA9xDx9Gfv5n7OaIe
         NVxdNmRJSRQUT2o9hM8ehiLkYRSnXbXl9nJ2FdLwLxTdSx1rObQnCPD/Hsb6/Ge0h+c3
         293w==
X-Forwarded-Encrypted: i=1; AJvYcCXCzX4UdnI82xsb6bCJ42WeUpOvT2BzZtRaBhfMZ/P8pcSWrHUdok7ZLHhnjzBtwKWhIBjCQS8xs+9sU+iKs4Sa@lists.infradead.org
X-Gm-Message-State: AOJu0YyzKA+zNt9sxfxsXsjVUH+iVffRb1YMzqyFwWo2AUJjYVg12FSJ
	GBTTY0415r9tSBGpfp2t7cB0KI0eqR/Sl2x2TTcmxx7LqsNG9VGph3UAqcGZPCOlNMbbm4Uoq02
	OTt9cjeQidklSbs3uuATJtL3u8dAen1aSO6ohXOayMQNBG0ksJnXtvFwuEW1tNC1hOQgCXUuAUw
	==
X-Gm-Gg: ASbGncvgSuis7jQVQSGoW96F4I7wUUipyxg6VZHC56qtKy5/+W/HTorAN2opM0KQv9C
	1nUp8xwsflN/j0fZJEpqzWJMBW+IgQQVmao+xyyhrjJXjA0Slidq+IE7SrAlDyZby+fdMpVQDhk
	N9NG+0OTHAp2XxM9mYka7aYjIKV3aBhCgH7GRLMRLatvUPiFrknvETNDYEW5BIRqEKLq2nygJKH
	EapbjVaOLGiXxebBh8OWTkLLrT9NMqwcGUPBhwio9lLxj1BepET0aOb4mcVY98eK0o2Rk7BU9AA
	lzUsj/MStWPwYq1Cb2csS+3uwVpOqMI5Bl4ldULv77uqys6+7xVWBBaA0SayHAab2dGEvM6l+Cm
	Z5pLaMjhdHt3J3h2KBZMTE8qW
X-Received: by 2002:a05:6214:21ef:b0:6e6:684f:7f78 with SMTP id 6a1803df08f44-6f2c450c0d2mr29779586d6.3.1744962608818;
        Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz8iXx7BArXCfbFF5WR9Y11877tVEpzeAsMIuGaYxGT6K7Hu2YW/N+89qedFyXXOUKUoeC4w==
X-Received: by 2002:a05:6214:21ef:b0:6e6:684f:7f78 with SMTP id 6a1803df08f44-6f2c450c0d2mr29779196d6.3.1744962608446;
        Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:58 +0300
Subject: [PATCH v5 03/10] dt-bindings: display/msm: dsi-phy-7nm: describe
 SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-3-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=azlck2n2u+qrgsVJ0BAEOEuqH2At8nKdcftYTsEljlc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQpQDO1q+LuOofVd8cYcNAfql+KVE/DX3iMR
 xSQGoRbh6uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKQAKCRCLPIo+Aiko
 1XWaB/4yaWBeX7aw7qlpH3wBLgGazBiDKFtr28dA3vc/SLFaX8gcTWTpYVyZrf9HiwpmRuZjUz6
 9tikLOxqpdjAQaivugxlIoXLdi+NC+AcR2wm6L0vq0XstGEATNdMQnxylDte98WCQJgGOBpIcHo
 KAEnZaZmOUVZUdma+8tysEIbTKDjLWnwMY6A/qPHWNUTuw364cWDf+Fd6/vUp5xO24zufNTD6V5
 3cBvpJcTuWpl/BytPFqQIZKciWjeM/Y1fGT1eKluWIfx4RQ46ZP2ODPJsHCjjOOHBBOfIf6StI1
 c0Beh2gfpnDBwnCsXMAf6WwcSsR5/U/bUSuYGsZP6hqaEaLu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: B1bU1Z_4FuqTZbzXhmyewEbpnZ_ZFlow
X-Proofpoint-GUID: B1bU1Z_4FuqTZbzXhmyewEbpnZ_ZFlow
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68020432 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=5g6dqdCWcepBQtZB-T0A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=981 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_005010_803171_2781DF62 
X-CRM114-Status: GOOD (  11.63  )
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


