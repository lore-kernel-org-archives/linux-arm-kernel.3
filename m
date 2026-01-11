Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8964D25036
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 15:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=; b=34q6jSjYyfE9NfDtPit2e2BRS+
	zkuD6UGoDVJUYSq+q2h2TA6ZKz27eompfUb8b+/1jaTD61Bgnjlp+wJmmXlGFqdH3dnQMcmQ3Ty7W
	/kntY62ksXPJSBgWTY7c+w2bTNFVbH4Em2McENctmOGp3guh85uYSP7QeYzOlejFydSFoXQRvMaLP
	niQFwreDiYjgy6Woptng4T/TeqLswKCoX9SUUt4OUipOhGP+ifaSL3goBOdWqF2QFo32Pte+qf26l
	Lhvxko8s3vWsnVNBVi7P9XwpTrrIZtAnkkUsvbrdI9k7L/XBOSPbcCWKFeXoCIRKf2Xvj09VlkECV
	2YzCSOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdX-00000004L0W-2tR8;
	Sun, 11 Jan 2026 15:45:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vexdT-00000004Kyc-3bCO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 15:45:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60BBw5Yl1752685
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=; b=h5fp5/fYf8Cp1u+J
	eNTAV/cR0CVaewv9cUKxrGQdU0Seky51/sS8dGfd4k4x1+bpQ/XLZEywiHkajwFp
	fkUtmzXWhF7YzKB53+ZqsjKEjNn67rTZePTQbDuRrC6nok7rADYo7ue0Eq/mWX5j
	fvGW3OuGqdanLEseF445GDBxLCbcG4wia3crPz5T69WuQEcqYm1kzBOUre7ok5Nx
	JuP3ZDU8Bc632si73nPakeDRozNw9pRsZqbUqMc6QchjCBYZq8RyxrCWtu72W+0v
	/MM3TOrhhgeM5DzM3Pif6mwAatw56DvdVbg/ozQ5kF793n3fNzag8DR0+YMMHdNk
	c7YnXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkmem1vr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 15:45:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b17194d321so854181685a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 07:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146346; x=1768751146; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=;
        b=i2M65CFG9GyaGIHIFVyy5GTvfmM4J2MJj0AvmTy+uPT1m7HxN5WSVZNIr8iVHx5BbZ
         YE0XZR7NACSmB+eLT4MhAQLjodpSftYlAbAUq2RthqY2oZvqfbGTYD5sqB5kAtXNBs0I
         VXMDF6uVj+BOgfS8/1lZ2Y07VxDrfbjuS4/pO2gxH7x8VfiDbxhCqNcH3imDOH804NnN
         /mHQ8ycg+gbIvsKbZHb7f9VkvCjzrqg2vB2YKL3EoJXs0ETM125YH8kEO0bFM47qjPfn
         9oU8Hfn0fh5fizhXSTVn9p+i1zhS8AsP8yc/cYcvLtHyOktLao6bnouosirMBi5+UzIP
         v+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146346; x=1768751146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=;
        b=W/FZwpv0KVC1E8zha+wSa2Vy6LE7DG2VtKPhQdwMolwnU2ipG0GM939AF+8VQc/VFk
         wTuxbrjl84hOFCtMRXscvpHF6laWsBxUfRKHIHbYVaHJTtpI6LHUJuFAaVcBlE2ucXkY
         Hfvzp4pjQOOve7iNTDZZFb3EK7s3EivqCCHAy4F0WRRFedqD6PB9iFQUeA4Y0bwz/9Ok
         kguDISsTXbxxsWJ/6aJ92I+F8OOvtRlr4UMYm0ygUWnC+NirDMKC43xkrqij/HpGaj09
         C6gm2g/2fZjA7wQLXQPIOJOsOiwE8amB4EA3JTp4wdZn6+byuOBl1lF09/hMB6exHrGo
         Yd2w==
X-Forwarded-Encrypted: i=1; AJvYcCVqTzYzrjQCrnyqiGlBLHvs3fEhAXrE91W6LHMn2hXIrX2tGdyTEgNpvvvFEk0ciluKSIZgdrzyhmYKdsjkmrgV@lists.infradead.org
X-Gm-Message-State: AOJu0YwOjmGlSNPYqJDMKz++XDRIesVa9PjAvRHx6Go0skbj1rG/GT2F
	3wcTG5B0odw++YIGg/WaE7qZQjw+x8TMuNzTLZdHdDO39uwF73UFAAY1eNTdPX/lpOq/dvwWqpi
	X14i9/kxAUQLT2DQv1/o1Btm+rEZ/BcaDOhJQ914sttrkKjMPnhYbpzgN+1Ih5UkvWxYzou0fiV
	eEnbEW0O6goA==
X-Gm-Gg: AY/fxX5WnJnaOuFyPJ8P2kb+IskebSp+OxwgT1IheyUX2Rm24HPiey18/dd1TLvPli4
	uyo4Z4BnEdYpcAk1kB89RaSKBn2WdvW3IaXd+48vHxgto1/Zqd6q6Y+D+BgvnGHs43S5KVTyH/e
	bMCRAJmjxiJcU7pw+EJvmc7Zhk1eXDCptoMRvTT7Bs3N4JOtKEaNWJSb2+SZpaJpxKFgV24lUjN
	neWGDikImDnYdHBWxdduxeCsQ/HBL5Rquh4yAR9O2njORuj9fW6k9ZWHdFr2wZfzPhjiHUG7ID7
	CyvjufTCqw2HP36btXgQi/Gnq47qeakp+0UQKZoPy7wDsRut+9I6aE+27F5mUV7GkrLdf6uoAQV
	NVtoTX4fkd5LB8NhAsyDPRE/3Z6yxFidQcw==
X-Received: by 2002:a05:620a:3714:b0:8c3:7e51:94c6 with SMTP id af79cd13be357-8c3893de845mr2022082185a.60.1768146345899;
        Sun, 11 Jan 2026 07:45:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGKCvt3hBx24DOeWZG5DTt6M06psOg3clXXiYCgTQKo6WJrNjb3r8dXi6KuFzWcDmgDp9+yw==
X-Received: by 2002:a05:620a:3714:b0:8c3:7e51:94c6 with SMTP id af79cd13be357-8c3893de845mr2022078285a.60.1768146345392;
        Sun, 11 Jan 2026 07:45:45 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a5180bdsm1636605566b.57.2026.01.11.07.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:45:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 11 Jan 2026 16:45:33 +0100
Subject: [PATCH RESEND v2 4/4] dt-bindings: watchdog: samsung-wdt: Split
 if:then: and constrain more
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-watchdog-s3c-cleanup-v2-4-fab2d21a2048@oss.qualcomm.com>
References: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
In-Reply-To: <20260111-watchdog-s3c-cleanup-v2-0-fab2d21a2048@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3929;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3n8ScSa9U5u4J9FORj/r+W2S9YcBhcL6ToUsDlBBb8w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpY8WhdFP5yqpjM3ZPjrwLVRO3GL56PVsbsEIff
 KyB3+gLX3GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWPFoQAKCRDBN2bmhouD
 1/KgD/41ajtitwvCnpMd6WTsG/peGerhYrdHSWLTNBE88YKohzQug76g2yb2FEezfpBDGmBCSex
 lbTw35oqqX5Q4G/NrQfaEoauXl1v4txxnODhunRRpHbA4aakwYdR6l0A9xkZ1SaxaBqrr14vPhn
 IiKoYHhQfWS36aQ2GC1bkSVkHWn+P/GMfdpqfgzDhVFrF44eFTRkvoqkqpZ00FSskZhQ9GtoV6U
 CXemanWg85tCLKDeiqUsyUlyQ7sjI7Xyw81ojW248XQkBf4Du+tUSVtcqtkEDTp0VTGaMrnnXZp
 SlRjQENldY3e6FR0DpkMQ805ImLmtEIT39PXyoWqAj2+BZ3TBdX0AB5M6QDOZfzXLzUArNv5NFq
 x6rt5a/iYoGutMAMiNMoNgDOjKRvFpGCrewzO0YYGZrBgn2ID7T7TvJLmDhPBH0XrNcwFfqkuvq
 eT3i6oG0kDSJa/Jd9OQqe5NkuJxvfWWEjFN61zoN2qWs6Di2egLKDTfb7uWI/vh3lNGZbG94kkL
 m6CGpbUI6k3yiuG/JOS6wgDDeJ49VArLfFy4zBWGU4AfsUazBlbN6uK0eAMP/zrHuiLZ8+AAVwu
 zD4JyeqGb0SKokpTfp1PF5gWKuptqd2g0SG1+wxnBOCFcStZiZv7V8MoBAwFVeW2kSgqiM8gItA
 TIUAaj5Mgl8upOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: ScqmPAriBmFP4JGTaBv2D5OeV9chyE-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NiBTYWx0ZWRfXyxkXfZzAiJuU
 tMm1jrCnulg7H9grEguG1O2MCC1HCrw8YaN/F7NHtBeWcTuBalHOds/Hl4uBTVOd66kmRnZF0ho
 Bf0ZPIBIOZjw9yHr+wnSLZ/7IEA9zgZQ8qb1hTyYx4YwPxjI+QkzYnJ3idi8DMAhPQqnyCiyngp
 kdbu2WkT8BW1+neueooIj5KsjM4zcYO61AbLJEfok1UoO5c5SsVqZv42+tlJz1zFvUPYx0EljF1
 xpKWSS5zR1Eb+ZMWw2YjYfNgshsLBuyDD0FVpx4A6vAXp50Ob5RTb1ofvRzf9AgmF4uaNNDh0im
 uTgk7Xb9TFmp0ceHwPct4uqm8KPMH+NyAp3UrB+dTDUgR85bGQeK8umv3XuVqVbAm+HkqDPoqxu
 zEMV0qGdvvBD00KTYhrPh5H6o2/p92OixHzhtNAyw+em4SOl4CEonngL62Rp5eL3N+R2/DnVp8V
 GdOBNIZFI1iu3xKshaw==
X-Authority-Analysis: v=2.4 cv=Z7zh3XRA c=1 sm=1 tr=0 ts=6963c5aa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=l-N3HDM6Fn6Kim4WiOwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-ORIG-GUID: ScqmPAriBmFP4JGTaBv2D5OeV9chyE-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_074548_050201_23D9EDA0 
X-CRM114-Status: GOOD (  13.94  )
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

Binding defined two if:then: blocks covering different conditions but
not fully constraining the properties per each variant:
1. "if:" to require samsung,syscon-phandle,
2. "if:" with "else:" to narrow number of clocks and require or disallow
   samsung,cluster-index.

This still did not cover following cases:
1. Disallow samsung,syscon-phandle when not applicable,
2. Narrow samsung,cluster-index to [0, 1], for SoCs with only two
   clusters.

Solving this in current format would lead to spaghetti code, so re-write
entire "if:then:" approach into mutually exclusive cases so each SoC
appears only in one "if:" block.  This allows to forbid
samsung,syscon-phandle for S3C6410, and narrow samsung,cluster-index
to [0, 1].

Acked-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 70 ++++++++++++++++------
 1 file changed, 52 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 51e597ba7db2..41aee1655b0c 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -74,24 +74,7 @@ allOf:
           contains:
             enum:
               - google,gs101-wdt
-              - samsung,exynos5250-wdt
-              - samsung,exynos5420-wdt
-              - samsung,exynos7-wdt
               - samsung,exynos850-wdt
-              - samsung,exynos990-wdt
-              - samsung,exynosautov9-wdt
-              - samsung,exynosautov920-wdt
-    then:
-      required:
-        - samsung,syscon-phandle
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - google,gs101-wdt
-              - samsung,exynos850-wdt
-              - samsung,exynos990-wdt
               - samsung,exynosautov9-wdt
               - samsung,exynosautov920-wdt
     then:
@@ -104,9 +87,41 @@ allOf:
           items:
             - const: watchdog
             - const: watchdog_src
+        samsung,cluster-index:
+          enum: [0, 1]
       required:
         - samsung,cluster-index
-    else:
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos990-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, used for register interface
+            - description: Source clock (driving watchdog counter)
+        clock-names:
+          items:
+            - const: watchdog
+            - const: watchdog_src
+      required:
+        - samsung,cluster-index
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos5250-wdt
+              - samsung,exynos5420-wdt
+              - samsung,exynos7-wdt
+    then:
       properties:
         clocks:
           items:
@@ -115,6 +130,25 @@ allOf:
           items:
             - const: watchdog
         samsung,cluster-index: false
+      required:
+        - samsung,syscon-phandle
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,s3c6410-wdt
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus clock, which is also a source clock
+        clock-names:
+          items:
+            - const: watchdog
+        samsung,cluster-index: false
+        samsung,syscon-phandle: false
 
 unevaluatedProperties: false
 

-- 
2.51.0


