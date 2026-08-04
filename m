Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E050C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=18E1/RUjFk0aRQ0YKB+NTkuCVA
	krb2QF9cVtWJRwXbjMTpRhPnBV5JFOWZ60fZm5h0iYZjfPW4TLq66TN91QZFtu78+oKNkEeStH8ik
	3EuldfDtpjktWZdQ6Yg3ozz5hT44H8tyBUNUgItFvc2D5xabbvIyvvjjWFy514kef8iUjnm9i8/my
	p0ngJbskYXEnNz3Tw4SgZKOEYb39Ao+vHPfI55TJwxmP8Mw8ruLHk/24HfSjjfLnbfPrIbyacYXf1
	xBi9Vh2X9PA7a/yYHxy5Zlml5Wg2SAtSAOvO2jP1qVtvuQMRoxdWkU73m4/YV4bH8Qfdh97ObswOK
	dio4cZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJIC-00000002XMy-0tyW;
	Tue, 04 Aug 2026 17:51:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJIA-00000002XKz-3NAR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Aug 2026 17:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=frhGP9jA/3BoyItl92b49RZFXD
	D5vw1KK82sbkOqlXv508ao/Qj3nBCcfgbx/FkG+572FACrG6vhGBW8dudOw2DtyZxZBypxxQDwWe1
	EKwqWIV+RJUba59kNn7woPgbqR5HNLqDwSRXcUpr5LaeW+vpXk3+BdC8OnrgWPputd+XqGWTVROjO
	13HTzVs20xiw/mSxAXLfqLY1UXHkSoEkNJjA3wvpa0smts4JhdMTPkTSHlGqFwUURvWBdGiyRLLkM
	88e43fO/KFd9dbpKePIryBXnV/RJk5WYYOCklA0H6qc3BL4caX8bjp4LLk+8dTUP14a1GhTqApEZ9
	SudMwiNg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrJI6-0000000A8dZ-3abj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:51:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674FfaK8369178
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 17:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=; b=MtZro+PpmfRPxLfO
	TZQXNmFeTsF5cAnr3iwhnaLiFQNPciKWQRCWB6jTh0OGF4p0l3T/iaBE3pqcueMp
	f63KZ8vtN9c4Xi/Dm9fm+sbXX0bkkMSPp9FqzAZvtJpMoS1rIG+H/fUIqxy9ajWB
	OBXOEw6xK2TAguWvusbjyGhIXuz21jblHHtyJ8XyPotdhvTSavkTzSN0FPlA9wRM
	T3tOmYjUjsLi/P05CHzIfFLBkNlHld54MtljCxpc8nMmdu+MWXp7DiA6/zyJ9l7y
	jRGYT25mWjiT7L4phTC2XgGjRsshtPL3K9iPAidy3KXY3jdvhYWh80xSmbsy3wq3
	3pL/1w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fug659h3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 17:51:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cea6a46766so2270075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 10:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785865860; x=1786470660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=NPmIBNb8NdeecAKCOW1/amyoRo1G3ACxPT013No5iiZ+U6a12VsRN9JKZMx8K+y0gl
         CShwAXD3Hos+JcWkZqBrl9wXE+2gf5OovUGcmCRTz8vB98pU9X8shHjuVKan9J+Df99v
         epYK71Hp1D8mIT1Q7DKGhnveCzKDkw1WJe+gj4w+d3qG9jfMDjuT3A0CkKA6eKSC/1Kp
         gQqp3bCeY1XJSuM9Aas33gxc6tOJopeLKvOTXamoZ0zofOpxcIvge2eCKtfFZtL5jnWM
         5gGk254zXHpanE40vxfGw2d+8N5CgjHwzf3RnG5iMjvM6lStwtC44if24C/1tkiis7Mn
         bNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785865860; x=1786470660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArZQOm3PIrl1IrTI+k2tiieQUx9V7TvvZgVtHFPwegA=;
        b=BDK5PPs+Sf7EPWZ1b9dPNUGHjHebuVRTcF0qgzlf2PEUn7oxjsUT+7UEm3J+yhEgP8
         UsUNB04JOi8rDkKOtlFttPc0XbINILiDontDGe1ZIK5uvejibxfVXV8UziePc+yypP7a
         /bkcdNxxhS3WNPKzXqmtGWzgEAqyv20wn89iNynUhz+SWrVhT2U4TMNcJ8/71ID+ZUJj
         LNBHPwhQf6S+kfGj84YRBXZsSkGxKOsrEhJdgzp4LLqUtvXIgEXEiSV+Tetpx2lwD8dM
         xt2HOZSoZeAn76LpE3pKlzPsuLEV5cKlgqyd3f0pa6lk1/ZS7WUQ+VUoqDYPMBqXuPsO
         4rtw==
X-Forwarded-Encrypted: i=1; AHgh+Rrae2KQtlcqdOojkxK4GyMqr7PgeGcCtRwvCuiuCuJyoMBXQSvTZKiXIQOocEjIn3Uf4+1BwSq+ao/80Nuuegk9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy265x1hVPd4uWO2qi2bPsJ7tFoQ/dsdO8ovIFNTZOMkM5xKq1e
	Zoj/7oGn7cGTQnRPoQORwUm/VJH1dfYuclTFZ3wgvpYQ1kxDo3ZXm/izErqXm1HYl0+BI9zdagK
	QZXhaD3lqs92aC/+iBgKknmjlVzqNISo6wtolDxISs+xRJrKp/xyrYDsuBn7cdFQa5CMiLYA3kY
	p2Iw==
X-Gm-Gg: AR+sD131EWbYmIZJ2mnIXUJl/P9cviUY5VFnzd9l+kHPFiJFVwarmKZmY9SYtKp1wa9
	NsNvL2jyF/I4BvdVBZRTKDdWnvw8BtlWR/f3YcgqSarKHcLC7mjw7hArY19DNZxlRrLGyCPOuXZ
	cuQThyPTJEf2j6L8Z9kaTnhwFVUfqoKeU0NnPf+QEZgx2nFBHJTiWXICvvaT1Y1l9WL5ZUEmP/D
	qydgRBdkF/Q8JlLvWj0VGYlrHRHxxIwRoKYfdTPtdjHUlWwVHi6shfFZ9NYt6veTcLCNjEpw8J5
	cvZo2v7fIEdb2ALECgV7zpTYP62pk4gijwxI+bkxjM49QfdaM3DD1kptitIb9douwezU9S+y1ms
	w9JCfB5t6oFTJFpWmRqkdXNjO
X-Received: by 2002:a17:903:26cb:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d0ca9620cbmr5665875ad.24.1785865860198;
        Tue, 04 Aug 2026 10:51:00 -0700 (PDT)
X-Received: by 2002:a17:903:26cb:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2d0ca9620cbmr5665185ad.24.1785865859768;
        Tue, 04 Aug 2026 10:50:59 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586790e21sm7052108eec.24.2026.08.04.10.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:50:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 23:20:17 +0530
Subject: [PATCH v9 04/10] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-eliza-mm-cc-v9-v9-4-39067760dc3c@oss.qualcomm.com>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: OeEwlgVPAFOnCBZ-CnzEEeVflLCOVF9P
X-Authority-Analysis: v=2.4 cv=fcydDUQF c=1 sm=1 tr=0 ts=6a722685 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6H0WHjuAAAAA:8 a=hPke8q22Y-dA_sy_I1MA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX/fI1vYtbMpVT
 pv7WR82XPT//2p94S/JjJxfLs4YNcdHzju8UaQ7nHfHlKyTPOcOg8/7NP21Q5ftTewanEtjTGZH
 nAxhUF9CYILR5qEQvOssvqmAJ/Ik2fs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE0NCBTYWx0ZWRfX6LXhNriZxfUL
 asax+8zqwDIxOtAMdJlFEB5qFI1/KPf5ojKOVJl9XJVWDSIRc4eO7TZ0TQV/4U8ezFTP40htO++
 NqQbUo7dO3kzCp1WL4VPDYQO96CFiQM5EfvYV2S5cKPmYB94x5CLZpSumgfHSJLcHHyDtm1XxS8
 /aHTkXKYbTZmAn8vbhBUE5PWGoVcrFucR4xwPnKHYGwd0g8+4LU0p0EFNwdedsndvKiNjWd9X8T
 c8FaD5g+aCZsF5pjJ+XJX3bMdxwvPmmjWb6241WVZaKvfeHb3dI/TV19f/jVDDdXG+sOH0Quojm
 6kes4ocioZmEGATpL8pEkyschffa4tP7+NODejLcSUtFWW/jtAOO5Tmc+l12K3fcb+UGJSjAEgl
 ooqiWE5KKI0lqtsy9WAWu7gsZFjrYddiMHpa2G8kx2CJL7JR6ATRJ0hxiomicxAAtzGd0Z2Fu0h
 rL0578SErD2nwZi1a4A==
X-Proofpoint-GUID: OeEwlgVPAFOnCBZ-CnzEEeVflLCOVF9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_185103_232786_5D2BD153 
X-CRM114-Status: GOOD (  18.65  )
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

Eliza Video clock controller is on CX and MX rails similar to Milos.
Add compatible string for Eliza video clock controller to the existing
Milos videocc binding and add the dt-bindings header for Eliza.

The video clock controller exposes power domains, so '#power-domain-cells'
must be present in the device node. Add it to the required properties list
to enforce this in binding validation.

There is no ABI breakage and no impact to the existing devices, since the
nodes using this binding already specify the '#power-domain-cells' property
for videocc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,milos-videocc.yaml         | 10 ++++--
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
index 4d8d109cd304ef0f5afc5c3fc7961a6156003d4b..08898f1d74e4ef0a3921eb7cc5f13d14bd02975b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,milos-videocc.yaml
@@ -8,16 +8,21 @@ title: Qualcomm Video Clock & Reset Controller on Milos
 
 maintainers:
   - Luca Weiss <luca.weiss@fairphone.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
   Qualcomm video clock control module provides the clocks, resets and power
   domains on Milos.
 
-  See also: include/dt-bindings/clock/qcom,milos-videocc.h
+  See also:
+    include/dt-bindings/clock/qcom,eliza-videocc.h
+    include/dt-bindings/clock/qcom,milos-videocc.h
 
 properties:
   compatible:
-    const: qcom,milos-videocc
+    enum:
+      - qcom,eliza-videocc
+      - qcom,milos-videocc
 
   clocks:
     items:
@@ -41,6 +46,7 @@ required:
   - clocks
   - power-domains
   - required-opps
+  - '#power-domain-cells'
 
 allOf:
   - $ref: qcom,gcc.yaml#
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


