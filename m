Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2784C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=; b=CupnFR3cuXVpBa80agPBchI35f
	8VEFuJiNZDPslvf3oRgYCGpFpr2epIgWMK8O9nMWA+kdn0XdEcg7iWbXuoFs8H1GLFhGBbtbhBHSW
	3fP05KBZmNWD1QBMGBuh5c83QbyADKwB3BI3C+SLPPBXNuSsLpjItSkwzIRL+uqABa3CIOrT3uWGS
	X9BxpyBoIMD+mUC72VSOHfca1hI6kz6HNT10dqnd1/PVhp5mjBAd5TkFOvJ221azKwqtmpAsu8vzU
	BZ5MZKjPJIZBpRNA6iGFIlBQvFrS3ZjtYWzw9I0VdP6EmaoszyFdMCfcWQXgThn5XTGkkruI7AsW+
	bo0RNmkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gvX-0000000FbJ8-0k7W;
	Fri, 18 Apr 2025 08:18:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gUD-0000000FWFl-0NOJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:50:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I2S6vh012576
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=; b=PUru5XpqfqFRT08T
	nHXHpsDY+VA4QmDzbPrb5brP5c9smsNx5LyujGtOp/tU5LTKQJNIzySjOyXQ3rae
	woNy54c6BgotoSqLvCQU5rdI+IrD1L89soeEHgH2zRoYNLjSz8yZhvewKJVnUx1D
	K1vaJe0fWPvxsqf6BFUTeaPxd7jtKFUzOdC5h21iu14xQLKfKrPwGb9dmBV/j5Yt
	S9IDzEQGgG7Ua2AusjYOmxa3aAHyfpKpU/grX5hpqmuwS1OFYAwUIU3tZfekpKD2
	51mFG4iuBSP8c+4UzkDW4fxdnW/4M1ZBlUdDxW2chteS1o6Qye7mOeHYvq7jU0T1
	+cjEJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vsg97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 07:50:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c53e316734so251543885a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 00:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744962607; x=1745567407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGVPApRnv/m9P6KivA3acYjlWKhzKhS23njLJHpDY38=;
        b=JxSK1dnsZdnVX0fzq6ji87twVpAiPuG/6YtXD8Rd7u6Va6sAqQJhbzmlDJIc9gaess
         +mY6GwN/8ZE60zNNFReHITtRLYzj8eNaSi3FiXvMBkXVoatGB6H03TALDaBBD+htB4ZN
         TUx65Mox3SpObxu+n5p7WoSztiw7o/B1qdHQmpAPemJndHou4pt3eOOoqqwoDhQIheY3
         4ZmqvEBsD52hv+hcqf7/kxrGGgJJfvSNTIa5eWHxc9Q9gC9g4Bdmxz2THpQiFHbdpLlT
         1Dw1ZocptDTcs5hdLkvPd06u0CKJJdRgHcYOA7p0qFTGatEZgssP2hies88W2BqsWRRx
         R7gw==
X-Forwarded-Encrypted: i=1; AJvYcCWKBbSmMhx+4P8S54DTdewfwHrz5QTwiftKufWfONliPyLF68nlaUqb+3ha+zsuAEF4qxKxq22DXjfttUfIk8Hp@lists.infradead.org
X-Gm-Message-State: AOJu0YwBz6pglCC/uGY5+dl2bM6ZJMO0r6xBPXMS+lmYxeST5CaT99re
	g5M5v9di6kAvzncl/69rrqqqGUjjXQkLn7eKpuBynExBh28GxXeWa6reu0ghfIlEF3+jOdKgyO9
	z/CDpm0yLKmZDEtM0qyI5QTIYcqxAxYS58DHPhpmh5aMoVUjjJoMBiRE5N7p++UsBUBVvhTXdfw
	==
X-Gm-Gg: ASbGncvHTzRW8GHu9OAAAIDfaWuOmuOddMQWhORzDKS05Ti9pn1rhtGyAwmLIBetY+7
	kR44eJgrKU02tNZE0niJZewggmiUiyLm/dSEKeyYgIAxz9x1ghxAvtTFzKSSa8zO3v8eqsR2SSC
	F9fnfbge4AZSc6xtg5j8YFuSt7cKnXwGs3wWGhQtZCuldOCY7H6gQ2vu8EHmTKaFShleiZhG+Ye
	LsMvYa1+6aE0gFQWh/aHnjss4Gkqf16uQdydfHUdC0zv230PKd2t3fegTsHJFFX8wLfncTUllN4
	+jHN7uCV6VI6wjhaoNG9FpGgYvBi7lCpmu4zK2inAUC0ZKWy6iLtgtN1RFCGDdr9Tn79psLJ4OL
	bgakpVvXVWnsOZAb/UX1MX9Ks
X-Received: by 2002:a05:620a:4721:b0:7c7:a614:7214 with SMTP id af79cd13be357-7c927f6f516mr346456185a.5.1744962607349;
        Fri, 18 Apr 2025 00:50:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDI+S1exMgbzLCMej/vP2nfjUJLnp+OrKaG9LB5gOXVXZjTqPv+rf9maHdYP/+WoLEwO4v+Q==
X-Received: by 2002:a05:620a:4721:b0:7c7:a614:7214 with SMTP id af79cd13be357-7c927f6f516mr346452685a.5.1744962606991;
        Fri, 18 Apr 2025 00:50:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090863bd0sm1649061fa.113.2025.04.18.00.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 00:50:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Apr 2025 10:49:57 +0300
Subject: [PATCH v5 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-sar2130p-display-v5-2-442c905cb3a4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoAgQo8uHksX1Z+bs1K4UU3yWjKbItou1IWL6VA
 r8plrMG+d+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAIEKAAKCRCLPIo+Aiko
 1b8+B/4/69mTxB6Xp31eFpiNqiB0oxvJqAspedgY4BIf5/wK//uiBNMiaCSKV+bgmKVemFMFHhj
 uQ0ZVtpxOHg7yFI4FO/C9N3O+LrY6qvCYjUzJSTU/QpaOk+uDG5OWSk3dCUK/0FeAT3l6ftF3PT
 QNvbSr/kPMIB6GQYieP+36ZwckxTd7eJif1zkyDgE62ASTYxP0JltgMLoYis7PrcSMUiSPXpDz3
 3qgIjXVUAJNxVIvan2mhesuAHcx9/Ta8xzifZrBXAHfjl+48oDqDkjUy02tinKEAQEcpka4dBw4
 6UCTIdF1x2SMdwefypizfMXeXYlkUFPqPUVa7bRc7d6gTwXK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: FbBJu6I3dJMID7zRCJ3l3s3ReWEkzhEu
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=68020430 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: FbBJu6I3dJMID7zRCJ3l3s3ReWEkzhEu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_02,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=920 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_005009_135351_6A55B513 
X-CRM114-Status: GOOD (  11.29  )
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


