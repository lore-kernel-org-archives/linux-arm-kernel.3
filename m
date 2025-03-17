Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21615C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 17:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gkl6eCmRuyDLWawoZFLZ9C1YgB9c1AFZt2R9KV8uAUk=; b=X/cpzbCpGRRinLGZBu6s3hMlUL
	muLCB7C4WqcVB7Tl2eAv1snlGWEhIiLCv1zvPxs8wqViZZ896CBAC0BE3iL42aKQy5x9XXeyt4wyt
	2XHDehBaZ0QgD1TltPWYWlbwIuHLd3sGmPSzh8ujdh7qFYfP4v+S7OKpck5UP1OZoVeP70YzKe6q1
	lhrGwxXcZ8vObIC0TW5OpTIkjUhoZdQWiqXQRxSLcUC7w2q0cVzermxETR457Y8YwJu762uZ4+8em
	MYsw6e+WDs4OgL6nnZJDrDsK5qoMl++W05jaXrMpRVwb4xx2s7uWjv7xFclycCMXJU2CAD3serEiR
	lmdMcqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEZU-00000003az4-0RIm;
	Mon, 17 Mar 2025 17:48:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWD-00000003aOe-2Lkg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:44:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HAMG9w002343
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gkl6eCmRuyDLWawoZFLZ9C1YgB9c1AFZt2R9KV8uAUk=; b=PAPAce49r6m/dx1o
	gOOuGj4sVr3R7poy0Oh8gllfRrNCw9k0EK0d9O0jPTx6opekgaE9U4n85FLkvWTF
	RFV+lznhDsUjOvelGP1CeyEbiC15GH7FCoqOvyPCbsqrx+hhgK0cbdAVNDFAzDFY
	olaXqNBcuWyFR1TYYEXYsypQhUeXfPebHOuN/UNCzUAy0wyoMFVhe7H756fxfRbk
	A6qi6SLdk9kWqS5qqIeGowTElQPWSZbVd2t1nHVqG9gkzEuA79QgMKOFx13prxqb
	GIyRC1JxIo4h37z8kGxmfTbgPfz8eD7HTY9z8097h1TGoLlPSKalV4BmMfCvxcYy
	HPBoEg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1s3wjvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476623ba226so90043111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233491; x=1742838291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkl6eCmRuyDLWawoZFLZ9C1YgB9c1AFZt2R9KV8uAUk=;
        b=X6OS+yIsaaSitReKN6b7/mJSwXCxR8CdaNHkx7nGO4TT3uSMIgoHiitLtFgfyEBDGB
         A3jqLIKSvwBfNYk37RwhwtjtjyQZU8kC7DB3d8imBaAMHZg4fi3fOz9dASgLpHS76cdG
         HqdqgDCwVrWJRL0wiJWVKrne2njnDf8ET0/Dw81QSzlRWgxoxSa3iq7tVLEywLnyE0Kq
         VSou+/RP6HbLZ9YLVbtteuyhsIGkkJF97T7wiqc5tnOgdhlZe5NpH1XcTzQBt/H2BEIx
         oVsyRMOb3Uy11nFwsZDTMHU/6gMQZkMLE2lOu+Hck/x/c/4oyLi1rGd2A4FBmbi6Umob
         K3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRN7BGryaA59Cs5N96wx2RTmpRHOqghk9W3p4JmQYU3QXaMIXk1bmtpt8uM53M3+suGX7lRAgFPLCs+nOXBlQ+@lists.infradead.org
X-Gm-Message-State: AOJu0YxI9x7jI0WRxGw7dYKZWg9yPgbNKKuFMFNuopDvnBeNUqFXw1y6
	FET//nHF7prSc+Hy5TAIOxWJOKp+iBa8xKPbMLDqofgTnodEdsL4WPggYerBhWTohR1UB8UjhMH
	0waS+J2i1L1mpvC0xStikFuezTr+UknEHa7htrmwx3I6+1JgBd9HcPp08WVyEafD90bm+I2mJAg
	==
X-Gm-Gg: ASbGnctbJAXUW4PIG1Aj8DTSOqNRT5mqvytK1abG2RBzliBldbjwmWXY7/l/HrfE3k3
	csbinY1i+CCu35EUVnjJsO/j0GU57OE9S4RCdeRRV5hbaJfeHGLEa4zCDuJ+WDUM18+8nayvJlW
	huXlxYm7h94WRRyJxWrj2B/1fC2tcvWOOPXKLJ+N92NSE9cNbXZu6iC42501+PmxMto8N/ImQHX
	gK3j+E3z8b4cU5Gx7XOwv7wvn2/j3GhBpNXo8yIyAtpba//ihA64SfwVj3T76nVlybf4WPR2SKA
	Smm/WpkOZyfn9ikdrK//wvOw7VBoZ0yM2WJoQcZUiCElXo8jQpR+CcwmhxafB4x1BdY7/8N4RDN
	QIvkumKNS7fX0W0taTWMzpq/fg+T9
X-Received: by 2002:a05:622a:4085:b0:476:7e6b:d297 with SMTP id d75a77b69052e-476fca3d2a2mr8052081cf.41.1742233490839;
        Mon, 17 Mar 2025 10:44:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtySEefB1iOeyT733dBNs8KEWKeAXOCDLMFnWYda2WB1QcKMY7zPQ3rW2qWeoF354/mVSvgA==
X-Received: by 2002:a05:622a:4085:b0:476:7e6b:d297 with SMTP id d75a77b69052e-476fca3d2a2mr8051571cf.41.1742233490507;
        Mon, 17 Mar 2025 10:44:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:37 +0200
Subject: [PATCH 2/9] dt-bindings: display/msm: describe SFPB device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-2-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
        Andy Gross <agross@codeaurora.org>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Andy Gross <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rj/BQJOxWu1x2bPq88z2kFa6I0Eut5zPlFs23aO1bN8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+G9FSkklxSck1lzwxO6ehX+nVPI1iidJgA6
 N2c8I+iNHWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1UOGB/95qSO6E2NvcbCeLrIUgq6EANBxwKNBqmIXmTRZpZnEoOjlOZCYhFXYj1K0XPoozhl/FUR
 lWFwmc8hho8gsrf55Ye3kQvvKHx/3952yP2YjyeFPadbEPIiBHlNI8Bb5jB2w0U+p+U0PRtdR+h
 bn5/r+gCSYhjyNEgqdEirdooWPaKTlOMMJvOVl9DZ31hIYQOwB/XL6UQCUfSE5Wt8ubPOauWj0a
 vwDT9zwYZVym3kPkzCpAkd0TxC2DeL/2MZw1z/oE288vEvM4XR5eRTKpwJa6yPWCupFadzNWVLY
 l3ZUJEHsPJ+kvFImYOeywVGicR92vlMQHhy321qaRklhSjLm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=WbQMa1hX c=1 sm=1 tr=0 ts=67d85f94 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=zTbJe62L20pqPav009EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: p9d567F6VW4rlKWpJND0R3vXVkksEht3
X-Proofpoint-ORIG-GUID: p9d567F6VW4rlKWpJND0R3vXVkksEht3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_104453_608335_B397393B 
X-CRM114-Status: GOOD (  15.50  )
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

Add DT schema for the MultiMedia SubSystem System FPB device, which
provides several registers to control interface between multimedia
devices (primarily display) and system busses.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..7ca105c97edd2f305527c58ae89b9b0cf22d3c8c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sfpb.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sfpb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm MultiMedia SubSystem System FPB
+
+maintainers:
+  - Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
+  - Rob Clark <robdclark@gmail.com>
+
+description:
+  The SFPB provides several registers controlling the multimedia attachment to
+  the system busses.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,apq8064-mmss-sfpb
+      - const: syscon
+
+  reg:
+    items:
+      - description: SFPB register block
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon@5700000 {
+        compatible = "qcom,apq8064-mmss-sfpb", "syscon";
+        reg = <0x5700000 0x70>;
+    };
+...

-- 
2.39.5


