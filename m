Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A25C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 17:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RUXefn1qNNUFYpYyqAwzEaojm3EYakk9J0kKXfCQO4=; b=raDEhtQX9PolUAhIHMIIbz2I1V
	8TMVPNpiWjC6psr5JQRyRcnz3xsWWEKKcTqPQ8ubiRjM/LZtcpxTh6eL095UlSfY4+9W1Qf4LNVpI
	X2MzLZBBYY1GIN42dSIU1KLINEi+TOdeNlqSt4FOz442CWwX1px7eUqmT2gOVOaWWTyL+jtnHGCdI
	i9kALXn7AHdv2u/3qJ3e9Tz3QQSptXb0+IYMMoe9/zyazXKzADdXSkxiuUyhh1msdxSjjY6sO49p0
	Bro0tJdKIlmJhlVe4xUMVwoqpTK0QEpJO4yR9PBbKmU1Zq0rNhAapO4RO2CVova3XRLDeQiUwJ9TF
	N1pVQZCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEeQ-00000003bgF-3Lup;
	Mon, 17 Mar 2025 17:53:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEWJ-00000003aQF-0mEP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 17:45:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HATWXx004640
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RUXefn1qNNUFYpYyqAwzEaojm3EYakk9J0kKXfCQO4=; b=dyrhuZS5BJE9o4sV
	07Ky9QlmwDtTJXbKA5chvgKzd+XzN7LdgB+hx2lf42tfKyZq4XAUofkh2ZZoKaua
	+BZc25fNzPT0upHcHpW/uiW6Dl48ielUZoSWQ7xHVMLINtIiCNEpuV/UEbUJDFBd
	Omq6Xl3ZiqbTItRk+Gr7Aiqo6rducoaZSjIop/AW+aiPZBv1PxAFu2FD0qZjlnuy
	i1zqucgS2pda6+tUiukHz7fub4MIQYYY5i+N6MNSbd9W71Gi/B/IeQBRg2GLsGSl
	/A8J3HeBrPSlqIM5BbGX3fuhUEq2f+QkWYBjJwPyCdQDOGjqrBEetbuhJgP9xowK
	1yvs6w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r15jmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 17:44:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f184b916so146644006d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 10:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233497; x=1742838297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RUXefn1qNNUFYpYyqAwzEaojm3EYakk9J0kKXfCQO4=;
        b=vZDTwdEzw6n8q09Jk2QjmvHerDnfLl2zk4EUX7ukj7rtFcMp1oMr3k27QyIZBvYCzf
         reGeIpIYwR6otnwSADOJ5Oj6pDrllsoHtTmbpSX4oYynTx5AK882EnU2vqeeiP78p5nc
         5OFtj4GHbHvjoVMGKsLR8tO8iHjdF0UL5imoQ9E1kCcr/gdZijeXu+J7Tv8HCEdJZITt
         uwd/7uMskijxiHNLW1iI3zxlQhai2603KGTtWDNe3CDVLcPCbwTwrgZCcYO9i3zgdHQ/
         Mt3rXdAWWlXk6t7IUJWyXTtRZMV8QvZ9LGqaWnHQ8MsEMlXj/Eh98+T4tymh0e3xe62l
         mC4A==
X-Forwarded-Encrypted: i=1; AJvYcCVzRenlibBGDdYNVHMevermJsRfU6FaUhCi89NAOUp8Uocmk+7DBSnAbUNcFril4m0LQCyLyBDOvhGj3bf0x1w4@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8BYsMKIHXa6TLm1QRj5/uHvj9eu974rrYhx6KZBAdcOiROpK8
	hb+MUQZbzlmpOZJz7QAS88fKaDETAhPAL5vZeGokh1GIuTCtWu/yqdHxFNtXSojKzhJ1RjrkR7i
	HQ4z71DfHZYy7PYZZ2SQhXMEDJ8A9x03UBddWWGIt6nsBPngvaSZxIX2BAiEwoaYPdpdaQQ32mQ
	==
X-Gm-Gg: ASbGnctpxlcTi4F7oLUP9+gh1LJp1ATjrNqkND7ocIayrIZNa9QFFwys0xQmLFoKLop
	nur4sp3LITZTFeTdMjkbjpiH7agEXCrMxXYQXH20WzOZX4iT4viOC8cbwQcGG2ufQtndbuCDlKJ
	YnLGM5naKNYaZzK2hQrej8kuypZDVDOlFMXcVD7z7lrPi6CkYveiyn5WFcCD/8Ds33DWt3HcaPH
	Yny5nCXN4hDhsmDg9B9JSGnhCjRCdlJAJ3oXiSyahkpNHLYrvcnn9CTW25NZtxghgNeFFt0PT58
	On5QXSY9c7ncv5fuP/UWdtjOcQi1WAR1qxLuF0EDnghC9Xkfz90oBb+RTCgSeI2Hg/goP2PxIUJ
	7fBgpdZlpnQiD6Tn3k3yPiRtC7gMY
X-Received: by 2002:a05:6214:ca9:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6eaeaa1d006mr201930496d6.19.1742233496964;
        Mon, 17 Mar 2025 10:44:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3cSX1c6SJ9kLCUiPChpT3soohcu4UzGIqx2wB+7KFeneHQMOwxrAqObCKaKdSyWhaKcyCug==
X-Received: by 2002:a05:6214:ca9:b0:6e8:f3ec:5406 with SMTP id 6a1803df08f44-6eaeaa1d006mr201929896d6.19.1742233496615;
        Mon, 17 Mar 2025 10:44:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e9985sm16687121fa.29.2025.03.17.10.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:44:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 19:44:39 +0200
Subject: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=txiRpz+F35oG+X3p1ZZlBKKL0xEtuncaqk683Q7tOLE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2F+Gi3a2yLvvEDKt7jd0IO+ZfP38GqqgQok1B
 tT9MqSCwTWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9hfhgAKCRCLPIo+Aiko
 1bv9B/4/pumYqZ/XAfocif+U1tbBb3jivCcFFyihCjH2rt+nL0YHk0nuFKb0ECkOKK5WxkkBdnx
 RFT4KI2aTmHnVBMEUs6JSijZgYpAHmi2DmGxOc6t8Pym61paG6IkuHPBWtjRYJLmUK7bcAuZXED
 CC0gCwzR+bB+indzwn7Ze0CU87k7xnym3FfdNsSIviNE6j1kBW3Ez1395Lx9G4l2aLfP3b/OzPX
 jGbkMW0bRFPewsZigG6l4WU58XfNyL5SGq7OCK+UPsKfc7HkBAAka8Xkj/D8f4hpqPK3Qzar3uG
 hCGLHiWRd1Qq/We7axyNNHEzmg4LI9tInYk/7Ykiaq74W9zM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d85f9a cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=9GbQm46mxl9eb08TZg8A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: m6Al-gqUcb_JuRE2ttZ1_D-P4C-1U7S0
X-Proofpoint-ORIG-GUID: m6Al-gqUcb_JuRE2ttZ1_D-P4C-1U7S0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_104459_351891_FEA3B34A 
X-CRM114-Status: GOOD (  12.53  )
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

As most other CoreSight devices the replicator can use either of the
optional clocks (or both). Document those optional clocks in the schema.

Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -30,6 +30,16 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    minItems: 1
+    enum:
+      - apb_pclk
+      - atclk
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.39.5


