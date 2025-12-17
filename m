Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1257DD65526
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=; b=InrMu0rotQbHPKbacGfmD4Kg0B
	Q0D94FaSGStPKkTpV12ws4ZDXsxpbN46O7TW7LUE23xzLof476X/2oqxwKGUM/lgeplt5CCmaV4iL
	XapXG9cuwFNP1YILeLAzyf2uhXoQ0ro50NAkWaTSpTW9YFtkKFfHrEBwFB7rdi3rV5qRphVBlR4ga
	TqPLgR/uzXA232ggbsus0ujvckqoEd2GACW0SXIfho75pAEXNKupE11g7VWP/zQhHFGVkibiG/O8z
	wnCGwG17HfWu9Ft9NAI1EQf7mwg/X1HXr+LS/2uM2RNZQJECVcDSzMmmdjLVm9M/sl/+3AWwmq6v2
	PIXqX9iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCc-00000006TGn-0PtK;
	Wed, 17 Dec 2025 09:52:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoCX-00000006TEb-3g8o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 09:52:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3Ex6f2023754
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=; b=laq0HF/LGyXfijqu
	FTHG4rbbN7SEiZsOUGovNlD8nXA0T65Gb70OzfkhoEdmuMi7s2jUyQjXrzJhyePm
	oySKe+8VcfuZpVhcJEUwu8egzrZPMqMmsUHtyYQhyPrBa8zTujvepb06Tw+vhmql
	G1vb3NIkVWKrNEisJZcQbkuN9jy0NuAKQ3Sf3ESdiNIrO5kfoto0UnUehgORy0zF
	HCj501w61dJMeqNHlMaliub2C3ZwEqhnufVZxLM2eg2PfgdrRpmZ1qu84rz0+pc5
	SSqp5foCBhNc3B11x8R4SYAN2gfM+5oyjeXSFkaqChjiKadoXJMrcYHjcjnjxvOR
	pRGABQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39hj1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 09:52:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a2cc5b548so8891016d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 01:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965128; x=1766569928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=;
        b=QVUjFXK+na6AlziNcoSuNbwNxE49tLAcUnFepgFBaIe7zjCiF4CS7mvpKcR7zCLJTh
         wxIRC9gqCMBbmjb7wTUPI5w0OewA7Qpd1fBsnsnLAUVlsYl5T4gmrfnqIQUkLzRiCwdd
         mb0qw7RmvpiIJj70oAtgJdnwT+9kQwFobh/CIHBJMautecFRB43Bnt0tAlP5o86Q47gf
         o/OrlO0GKRdAkalNowItQ7Dd7riK43dw8myYCTyF6o5fpvLnxxbSJxJEYaa2tL2O+4JZ
         t9kI+kaVirqrCE5mylapk6Xx7GlYLyRi3pUfGXtJCrB51wfYM7XaCK6KGuvYiX+P2aLg
         MNDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965128; x=1766569928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YWkiFRWGmUEeIfo9pk1+SznEx7y/iiY47QRvAY739P8=;
        b=TdDHXxQ6i3aUj8jBuU6YHZgkQOAxbxRtYCuyT41xdiuG1UmmeejuPGVTEyyQ+WxF/F
         4s0vzIVkL6kLLdRF4YQ7NBw5cdpmD6mTydlUOywfXvSjFW/kqqZtTYk1h1N3P1BJMNx2
         P+zb0B86VvB2Dqfv3T4+btHhwojGgQVZOVnGJkgSvesfWVXXJDUalnqGvr8gyMSm+77i
         qyw/PS6IlwJVrZwO+QPvRfkT7Vqi7vYVCZ8XRy7PPKed8Mb46wbQr3RKFoZpEd10etAG
         Mmbqve6WR86mACgAVv6k/sGbETMGoUdQNQugG38cxtGwSl9In8m9c7kgbmK1icT/Ls8N
         5aKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ2bY0lG1lH23bm8xRmFwZtf1VqQCW8uZ29XHZ9oc/wiSTAK2TU1uHScgC7zHm5OfSi84TEAipzKLpFX8RUl0+@lists.infradead.org
X-Gm-Message-State: AOJu0YxRE+DsOLi5X0tH2dehMh7DYqDaWH0tLcnTZKZ+5pYxn2lBIDyl
	4LMwVrQ+LGpxMZMhN+3lB4MQBDIkQveq+4KC6di/Jsvd3t+IU3JRePJVenYVo5ZPSjI0ZOuR0C4
	T1kD6GIFGWlbGEMpRuvSmpzrpeTXHdjbegTLs/TvXGuluO0CFWS7Sd1j3T/+EoDE/pAhUAxnfuS
	sa4A==
X-Gm-Gg: AY/fxX6TwYxD+6L5j8NtiqhoTsxTaTSGyt8kJUo0QcsLK/JtCkIcLwBBjlvPznifweO
	hKvAAIngE8rbz4pJqtQ/ykDlB4Th+XnEFS/VKntHpZ5EoU3fEgFT53b3u6maFZ1259SNWE3JJZy
	DgEBTEufNQeu+12ZQvWYG6Uhn6vaiAwkBeTgTLyGiMsgVO3OEC/5y6PvwC8p9vtJFP0loV3PEzk
	p+5dprrfQA/bl3Lgwms1fVv9x2uH7htczJE8M6YnMW4aF/muJyPMD5+mFe1y3DtLI+Br3fIQldD
	Kst02SN//7l/r7i99Xg/wdpNXHNb6MBHR+Deod35HL+v4f4z5qw8v0xpnlz9PoLHy90K9m9cjU/
	mdHlHM+4N3ybMfn10/yTTiARiWGZRa/wz
X-Received: by 2002:ac8:7f13:0:b0:4f0:2211:d08b with SMTP id d75a77b69052e-4f1bfe5615dmr312364111cf.33.1765965128251;
        Wed, 17 Dec 2025 01:52:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsdR4N3vHyv8amDOPM/OH89kFgMV/Z5oKndrL89pNMc4wMQxwekHFD2SeSkPhEiaDcPXyjQw==
X-Received: by 2002:ac8:7f13:0:b0:4f0:2211:d08b with SMTP id d75a77b69052e-4f1bfe5615dmr312363981cf.33.1765965127700;
        Wed, 17 Dec 2025 01:52:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f5630easm1981969a12.22.2025.12.17.01.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:52:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 10:51:57 +0100
Subject: [PATCH v2 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then:
 and constrain more
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-watchdog-s3c-cleanup-v2-4-79d8caf65ec3@oss.qualcomm.com>
References: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
In-Reply-To: <20251217-watchdog-s3c-cleanup-v2-0-79d8caf65ec3@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQn0+2GgQ2ETAUn4PXAy+s3AdxFmkRonLCHYok
 G+Ib60KmcqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUJ9PgAKCRDBN2bmhouD
 1yxeD/0cQIN6Oy3QfGVCiba73/vXoSj1fnzE0ZaYR/b6K9i75xua8CCcvW8mdiPzW+rWSNBUtri
 +45+dwL2x1XbjN9qf4kLaAgsqR/PoER8qhQ0AROmHF/xy8vACNA6QhYarzeZF5DoPQIuCDa34YE
 hNPyG9ifW1sw0Glv3xa2u5JzbyYJhf9XtySjYdBZq/dkdMayQTwK2GnDMKpm2ztXL9zlYH+Je4k
 7XLAB/XvNEAhyKzNarDOa4084QOGsK3gXzC9XbPwmJHSxAwn3luGaCqfdQLYkTCna8yy36/tT20
 bPzrcnzBwHZZOQ94Dt7u0AKdCix07LxYTQjVVFaT8xiAP0RVUFTCHo2y3wUM+IA0VlzouudH5L7
 coBvGE/90gCZzgR7Qhvhq5dSis+Ug4867hTUOQKmHT54xke3EoroBY/RL8D41WqXIpOT+ZF0Xhm
 2qIaYPZiKmnWPPyDffWKNgS1hJ8g+ucMgDHM4v1yueQovcD0+axcvyVfJ/122hZ0j+ffTkX94gP
 5UM4kXOxh9NrReg9HJgl5HSAj4E0BmW8DbpuKIW4J+c9BcaU2UefRfgZtvDsqlTqQI5Vrt66QKI
 kXAnpSmkH2MfdnhH2H5s8d6U5kRPDm+SuygOffxjHJeJUOKbKqD0ynu20UsecCV2F8rG1JU4th+
 hUCAjzLdWUi6IfQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3OCBTYWx0ZWRfX+Qs7EkvV+JMW
 XJ9mB3OttGJa6OnOfP+Egh0giyWBwSctNa/DgStxwdW5KrAJ2YMIe2i8AUYeUX2B3iIz1OY6lrW
 f6a/SoPLC8jVYlVmq/2VOojU0pSMmwlx+x4lROjSjmR3yz4ZpnE9+RmVeNq0t8KPd4QeR7GCvG/
 7IRt4qEIi8UNBW8BekACVcjIWwtQO/1RmsmjQQHZk6Y3Jajf7i8Uw4E4P4i1mc8WM+DkeIhQi5A
 sFt6aGl5CQKKSJZn81nyzcqelsU99E/0Ooh4k2vsRezkx0fehMoQ2El66/asHnX1pAAhQ/wKTpr
 jYV5fsX3+ofSIvXjcJW2NYaH535fBf7KiUZRNbi2naRzmaF00dQCY5R/FxDd4P2UuU1Is5yd3R9
 +ERZrTJQfbPg1x2xJI5ri01RBarAiA==
X-Proofpoint-ORIG-GUID: 5WfdWdIXHO9uCwX3KG3ENqH3u224D-c0
X-Proofpoint-GUID: 5WfdWdIXHO9uCwX3KG3ENqH3u224D-c0
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69427d48 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8
 a=EUspDBNiAAAA:8 a=l-N3HDM6Fn6Kim4WiOwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_015210_046504_36AE933F 
X-CRM114-Status: GOOD (  13.43  )
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


