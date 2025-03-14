Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA2DC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 06:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=; b=1aPWE0ABMuy65+eXn96xn+xgh0
	eNiQxHyT7WdI9nY1QhMADYnuCxdQYgJiqn/3N7dO/MGgVA7qcWJjf/hAV1p4jdahaJ3CIRsJFZWNn
	mopsM5COdbE3r2obQ0HFmJR2XHbX5GWVRqLg08+H8g1160zraDUv1wy5v/jdxwbjERGRl41uu3K37
	4gj667OZJ2WRSKiAuUGxfwTGNiIiPN+V+peLvpRB8M3CfHAPHEQk67EwxwoEmnTLxk7NIXkigydGk
	+5wCgfdAfaXPWNrgUjezRbIpmszuwMR3Em3ITqT8tPggs1NZ+3h8hgnoxvFTAeIR7ygRrlONXNYUv
	KlwffC3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyJM-0000000DBTL-2Zaf;
	Fri, 14 Mar 2025 06:14:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsyEX-0000000DA8r-0cH0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 06:09:26 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKDSW5027830
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 06:09:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=; b=ht9t/N2vrwazGsIO
	SKv/5nTOfmyws0IP+io2QjYroBsDjo1F0Dfj2S5JzCgK2FWGAWnkfUYxqkY7H6u1
	y6UbN/rZi3d0uZMAhkJ23Xbk1brUIGWYHxSII9JuhvDtR+sYN5ifQiv3rAwwh+TP
	8KtbRvxfzoIqPZn491kGZBOB/hm2azsimE6Vj2UGe5a2O67HEEPHJPlcil/wa5h7
	W3/PiooKTC0c/hPEeElYojWiJAoABEW1Rwj3nef1VFN5f7LLIatiHdzaN+4cTU27
	a1e1hgONAPyI1Olg3I/aQEWixy2w6RX4WBwo8lFZvlH2DsFOjXbrbGmPma8fi2mc
	NDfGkg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c67314q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 06:09:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47693206d3bso45527571cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 23:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741932563; x=1742537363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=;
        b=LvB+MAbuWzXlnMiSLh8lY+/1Sq6vBpHWkt8hpyeIcxX+yJOqfjTd62g7EGZM+eSj73
         OEz0a6n25r4swaGs09sVynMjAJvtV/SSyenUw8VofboKtfBufvvlg+HzEV+cR9IXdDvJ
         JwCD4lp6bUZ7RR3p+Vb87orzLy+k4VHYrVYOgwSj3wDU5Kq07WhdxT0J8vfovK9wygR1
         JSchKOSQCZ9ni0Ka9KGZgItGGSFEEkbX+DhhR3yzX0lsFxfqG7wvBXFi7QmD5q/mJyS/
         Be97Nh/OfWiqoD0WbOX48P4LU5KyWTnIO42UQkg0CEnlBTQ9ANBYiP9KmubK/F9gy69X
         WN/g==
X-Forwarded-Encrypted: i=1; AJvYcCWRPmbUBYnghJKnX6AeONINrg9Mcn1vBPVSyExTCv3NOh0nNqO4KlDEHNp61eD+DSG64ZMx8tEAn9sxr/3SrtY7@lists.infradead.org
X-Gm-Message-State: AOJu0YxzbE33WykffOSK1oMO2ORD03ZxTaWhBLJTsoELHFfaBYZ0/ST2
	SYqtkHHbHR+Jr+IKE0UpJZTGcWzLY5bOuklkkpVAKz9Ri7b7kGK5pzdLqCdhZ6LLXnHIBJzPOoK
	bXa66RM49aDhKu3CCfO93wumzYOYPNWuh+r99SdJxDOjKiRNOVTPwfn/HQs8+HLGPW8Drb5RoeQ
	==
X-Gm-Gg: ASbGncu3NmKYL+Q8Zy6gnuHrKrHmRoSRqQNOxAN5J8q9UkKnN2a9ysISNpeZjxfBK+f
	TWR/KBaurK7kDTgvi50syek+dbQprbmXt3YDdaF8TVbH2MY6T7Ts96JW00lo6VJLsANtBj8vFAx
	DQxACnzyITaJkCOKEmvMCgtseYm5kmoQeFzvNdX1nd29m8+nTL51jxoiTez4glkC+H4nEQpd9rn
	kc+AYBMls0BeOA4IIkz5nnFqWqABj76K24bvVTVygQqaGUdDa4leNFgSY1Id9BmE2ywsfr1/GXp
	rXipoQBdPxQYgypgFjA6XOeR+f6SWew3vmLP4KyqKiD7mKzr7AVgLeUzG30FxUTdRaCYrj54iqL
	jrGNl7M2snBhCg/KjrdqOYA5usJma
X-Received: by 2002:ac8:5fc1:0:b0:476:a03b:96e7 with SMTP id d75a77b69052e-476c81de5d5mr17607321cf.51.1741932563373;
        Thu, 13 Mar 2025 23:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+n1SUt3ZgWbjBVBsan3UxzAZliUmUbhM/LGRIG/kEjkmc4qgG0/uQ1PciTX5CcH0qlwakMQ==
X-Received: by 2002:ac8:5fc1:0:b0:476:a03b:96e7 with SMTP id d75a77b69052e-476c81de5d5mr17606821cf.51.1741932563035;
        Thu, 13 Mar 2025 23:09:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864fc9sm416071e87.140.2025.03.13.23.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 23:09:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 08:09:06 +0200
Subject: [PATCH v2 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-sar2130p-display-v2-2-31fa4502a850@oss.qualcomm.com>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08gGLHauS/kbPNT1IjIi4HWBO66PbJY3yYljy
 k7mnK8wyUqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PIBgAKCRCLPIo+Aiko
 1XCDB/9C9EqdRpyEiVH9DTNw4lOwlcIzfsKfOlndFaAglZwn453xFx3QqoOzkdMmXny2vZD3b7r
 2xJGe+JOVOfEL64u+8osiwklNvu7rg1wlUT1asglG63bGWZOzaSbG5LKmeNttnIZwfRf+vG47WR
 TEgrOvXAXW5x21m/qxkOJe8MLQViXZFZ79YhJ7SZdG0i3iw/Ax+4eS/fqMi5mx9iHzreSUgWBaO
 NX63a0+4pjs/VpcZ9qwG1LNmtUFJ3jtZEbqd2gBANpWKNjSAyQEhycrd+iQT0q5lw0/a6wPBDzq
 2fyMTWMyC9XItTvu11hl74MFrtsmDBOJNVFeJ+gvu0WfIeN3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3c814 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10 a=eRSyEd_ZPWdY3HzJaUvg:22
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: F7zuMvYPmd7uTHSSSz7DDPGfV2WZLerE
X-Proofpoint-ORIG-GUID: F7zuMvYPmd7uTHSSSz7DDPGfV2WZLerE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=912
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_230925_198471_F9407ABA 
X-CRM114-Status: GOOD (  12.58  )
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

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5


