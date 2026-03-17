Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B0FFED9F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSN1fGj+shIHoomLoHHQFmz+QmTzvHPToGcONz2oTRY=; b=YuqdsO8/UfxLQaQ2RETZ3GYSPW
	aqz53aMMcY2SQAG+StItJM4ruh6NqN0RJ5QKYNaMgFhGhMa//zYvaygWm7Gtpd/vVXEzL93PzBiBL
	h1vtqolf52ch27u+v5eQeTZRN1hO6/Ai3pzOeTHRQoUQOplIqBv/xwJPP8IS/0/IWXhZAFg9wz6h0
	gOXWx0MRxLYrjr0UO54WJbXjeMDb7KZRzzDOHlR7e41jI4+jiUZJsHj8dV5vkHfUGgrh/++HkU440
	yCT0g4F4Ll7ju9TrulEW7cPRj7Ow9XazFtHcZBmbacCETsZm1a3TQVbOhgSV1SkWTImW3mnWQnj3M
	ySPbJxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y0M-00000006tzK-24Dl;
	Tue, 17 Mar 2026 17:14:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y0J-00000006tyZ-2Yq9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:14:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HFORhq537045
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:14:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JSN1fGj+shIHoomLoHHQFmz+QmTzvHPToGcONz2oTRY=; b=ceaBeWjswIg0qZfh
	ttRV6wLp4bBUgX2DsaPJR1sSLYb/hznOZjYQ5DX7mb0NS643YkAUjtRwTzoslQ67
	pnUPfhGTokViMfxrD1edIzXc6msnSKkN5oTpZdBjztsMXbmqjyeBQw3dLwvN4OQC
	70GKEHp6tDYliNq5GdUpi9zVjngwjtaGP71dRIYiIhsQlmrWsA//tcH5LL/7BUZA
	kVSmg7bm7F+lrBYiaxumDQFr4nmmxxIP5aeoXv0SP/rxP2yCOgO3vBNECMw2UTQd
	QNxgLWt1yKU6E63HaCRGdyC51GcoWcOOWoYriZVqlD6YLVp5xVBHq/jK9nzILwNu
	WkjVTQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy9jr0ept-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 17:14:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2aeb90532f6so70507195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 10:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773767690; x=1774372490; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSN1fGj+shIHoomLoHHQFmz+QmTzvHPToGcONz2oTRY=;
        b=h4ng12UYaV4vj1uM7XHGcBO5Rc7sVJ2OwyZT0FT1JTujYtwEtc9rvdZHU18SKFYlNk
         g3lsGnMGwAmC4zOgToVOXo3vbxVGQtM7AMKt/q/ZkC0YynzwX7XaQbdjuAAO4+K86mkF
         NmS8nHBFmPu83mpIJjhqVdsjiMpEuZJx7bdAFxaaboaiKhjvw3mjBlz5onvX1OwrzOmy
         7BHxPyLIKAvDpMRPB6Y50hidtFaS9vsQ5SO7Z24Dv/eJgT8TwLMMY8XKjsD8L4IRgEJs
         KmKcxnI3GoT7w/K7hRu2MEMbiuaJT41XH2bSYisTUb7VR7JdsKH5x7Soo5gpSNsu1Njo
         q2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773767690; x=1774372490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JSN1fGj+shIHoomLoHHQFmz+QmTzvHPToGcONz2oTRY=;
        b=oIA1iW49A80w0AqHMN0MZYGfIytAvMSCY+HhCJDw28X0e4D8exKhrArF3Yf+A++XIB
         ptLTYwR+qmrbHwD1tGtmU4KJzS4kqdrt6dWB/oBpgK64aSodNBbeZuBYLIQOZgXmJl07
         qpKXxP3FZ6rBwqf+ajWnS4yb3rVcxfszPfdZ4uk3iCdpHvjzUndynHBZX/pI3fDu3abW
         5SVwYBnROz5HeWHt3VerAmlhOTjSlDqSu8rPfJxUmW6TQMOjIkp8Z5K2G+MPDtLB2B5R
         uGY+FLgUORAQ24l5ovieP1UjcxH6qrUxlX47KPf3UzjPBvQBx/zR/LAnaRDVeM0j91qp
         jrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHIgWr+3hImGvsh28tcpqIrIfFhbp2+5EcS97Rc2ml2gDhHBmeH0xIlqbYqvVdwV0RQ4DwtjtgPPm4K3oprjnz@lists.infradead.org
X-Gm-Message-State: AOJu0YyO2WBFMg4LXUE7h1othcz0MU6RtIuosSWCkJTqFwZWQDWB1h4b
	5/LVDaIZ65wZdHXubXuo185u3BBQqwLSU8Fyxctnvdhe/vn3gFOvo7PrlyTQ7UREPUdZeq5HcvG
	Wy+NxbWkvmR7SvhWt+bwJGuOXFykc9KUyC4VpuMro2jLcI2Ie9NPsR2MTdV3Y4gM1HrEM/stQ1Y
	wj0Q==
X-Gm-Gg: ATEYQzyP8TbOXw2r9B9Tg9rsP+BWx/jvgSUYdnBWVLa4yIBH05KZTwhx1P1EH8/xY2S
	hbTvf1Mm8CxOt7LS8DGINcJtd0BcxAcLcfzw7jOEhskrYe0oNMuv/0SHX9PcljOU4IRPizmGu8d
	4m+1dUN+lP7mALMlnoSksY0uzfrckQgEFuO2oyxN2b2MwGUB+AWqdPyCCrvuqv4EhCuzy+lon4r
	KlD0787FzbvKyzSoHwAMQzOMKeU3oWNhimWUO0TtYqYIml05EsdNSuQApPSuBpjPwN7QzJKnoFm
	EO4O9IJ3MH9OMmnQITKjRweV2S5zBl2pdb5nebUXS7BWt2JLUFUFE1DbMuog1jooSM7foe6x2E+
	xMEu9zeJdgFUg0CeOOtC2yxbsPLBTHyl1oIOnOPJegyoa+A==
X-Received: by 2002:a17:90a:dfcb:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35bb9efae55mr168326a91.22.1773767689541;
        Tue, 17 Mar 2026 10:14:49 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcb:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-35bb9efae55mr168300a91.22.1773767689014;
        Tue, 17 Mar 2026 10:14:49 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bb9f1cb48sm28919a91.0.2026.03.17.10.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:14:48 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 22:44:22 +0530
Subject: [PATCH 1/7] dt-bindings: clock: qcom: Add video clock controller
 on Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-eliza_mm_clock_controllers_v1-v1-1-4696eeda8cfb@oss.qualcomm.com>
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: LXlmmzGFixLJXY71qxpE4MdBsnDAOC4q
X-Proofpoint-ORIG-GUID: LXlmmzGFixLJXY71qxpE4MdBsnDAOC4q
X-Authority-Analysis: v=2.4 cv=NdjrFmD4 c=1 sm=1 tr=0 ts=69b98c0a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=O5AFsRJ8ltlpu4YWMHwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDE1MiBTYWx0ZWRfX3AZ4jpcWt0b8
 WvaWWvkbO3FuZaZ2oFCMEWjajNuMBpdMIMB/lI+kwJLQcdHPlO7NOpsGuJ3kvY7CoS5ftIELQQR
 EAYtRFNlMv76+rIGmYOP76GG7PtOD2izjDafXalp3ilYcaPvkY8B88zle1jXKdVDnIKIL3n8SrX
 ymsvJjvDJk8hD0TXRk6d/qlQDpiPBlUxiFdxfiUSkC4nL//2D03SFZRdogbHDEaYZ18y2i7MN1B
 cPGhixXAP4u1wA00zvqr1gSnQIUGBKIaYVQpvLs9ikpwEpmiKZbGHAAvt+rVil5SB9o4CNQ56KR
 A0MefWsR/4i2GXo2bIWSh3mSbfD5tXEI6MNmPpBTxQwHIuEdhnKf2e/UNcfOrjryDmSxbz49wHy
 YIlXgkJCotKgbjydX9WrwkWHE0k5glt1iw1SsRaK7b0tNqz9+CVQ7Em53e0Cn+LjsexIifb/1mt
 kodXuRmwzEbUh5UG7/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_03,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_101451_771729_0AEFFABB 
X-CRM114-Status: GOOD (  14.82  )
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

Add compatible string for Eliza video clock controller and the bindings
for Eliza Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        | 16 ++++++++++
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 7bbf120d928cc506a4f7aaeaa1c24e5da760e450..b75dd0896e194c5a2fd132cbe51c4706899fcdf7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on SM8450.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
@@ -24,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-videocc
       - qcom,glymur-videocc
       - qcom,kaanapali-videocc
       - qcom,sm8450-videocc
@@ -65,6 +67,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-videocc
               - qcom,glymur-videocc
               - qcom,kaanapali-videocc
               - qcom,sm8450-videocc
@@ -73,6 +76,19 @@ allOf:
     then:
       required:
         - required-opps
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Sleep clock sleep source
+            - description: Video AHB clock from GCC
 
 unevaluatedProperties: false
 
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


