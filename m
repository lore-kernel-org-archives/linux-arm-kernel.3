Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD590C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=; b=OmYN+mhcyZhznxH6ZzgE3mjz9H
	QHFKqrAkVXzEBNmH2VQra852uqEPUMmq2LbZLp1c66egFxgSc6oTsMmHW4glOe6x5VWNn63pdrbh9
	s0unMLBnWlqfD2HriEo/Jxw3prg5JRZAZ1F0QHb4WtwMUw503CYm81lpOTln2m9g5KdDDXl2UtjCo
	J7wESWMCHL9rO/DIYsdm+9EUDgYm9JbIq0Nn2sswGBLBNrqu/KlVscQbdfhZ7gXpsfC/yUEA+jArE
	B5wT5Q1cH+j43yrqp1begpRb6AYsUJ6BZSGrUGMC+SHDdvE2gk9/RQ1MSlgyTx1nNJHCbRwVSbfmI
	xddl7NGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQ0I-0000000AQkn-0PhN;
	Thu, 17 Jul 2025 14:54:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO1x-0000000A9uk-2kdC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:48:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCC56k022405
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=; b=CdWLIJxFATwrJk1Z
	sXz+cK0ikSSAhq9RFKcE2ix+DNfu5lE9tiDOHj6FP0o2zWVzgOsrjm7QY7STDf9a
	k7v5p7ePBWaIJsTsn+JUXm2Boa+2ANZ6V/jw24Iw3SbPnQyMjieI+ean0HVyUnTq
	LaU69T9tmxB160H7fslKCnqCIYK6ET93yKHk+fbhmyVy6mSzjPeBkNx1JwsS1jZ4
	mO2skWUz0nyjlimMD8qMn71iXqNefDDDPoVEPklV4jJZfYFFTg7gHvt3wH9bWZbr
	wHVeTd0LXd/RXckF9YiFtyun4hmqMDDhPbZe8aqXDJPJT7dpB9N4AjThaVwiXJyT
	yhmTdA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsy7k7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 12:48:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso977050a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 05:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756488; x=1753361288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=;
        b=sw/tCxDH/t0TJANlZD3BXKUUg9FUP0uyOuUiZF5WrrozzGY1KQM0j167bg11G+vF6k
         sKABlf6Kogeu+4SmVCwb4dVq/6pC+s1PeN7mTtM9RjYXRtKxSaGp4YTGGBBhz3tNrOpn
         nb6aGMZ9RVyzeE+l9VXfw6dXg1RHUhv9q4XZDa0CpBgG8q8f0QT+0g5FYlPxOov2PJ3q
         5S2lDxvosdWASU3jsLG96wXwtqwFRe5ulI8jRyLVCT+l+drgWcAWWKeq0W2HPkSEgEJD
         zeRLPquNxgX5v8Qc7VYH3DCMF18k9IV7Yp/maC/NuSFddYtXne9/fF8Putug2y8yN5de
         y7tA==
X-Forwarded-Encrypted: i=1; AJvYcCX9xRC5YlzMxY4HQ0UUXZjME6POI8AePvXsesNhm5/EYXhzqarokZB+i8cQR43Rrq1+2sZFR5Y8bIKoy+y7ongX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg1lgnY6oQSzcJZliZLJT04l6qsG3UCfK+L+RnKDW+PJUDBxFo
	ELu8dt3fAlNghIswU9oKNOxdx3HE3qciKcVdOdZ0mCX1FnvGELU0pJauH/MeTH5TMxLRFIR5WTQ
	/lOOyYUUde9POHhMxi82DpN5G6fxUS5MK4pc5gII9d5luki2E80NglUHtC9D9eF5khqB9Tb6yC5
	DjTA==
X-Gm-Gg: ASbGncs0rWk9ILIiHCM50+6Grm3ytjEy89K1gZr5KxKgzNkZZDlo+NVnCh4oky+KhkP
	Rhks6FnD/YQOS78OJ52law01zveb89rabFEVyy5A/fENCxwb6LYSZCJGkGqEqXZn2WtbngddMJA
	LA03d9EPeEo+6DsHhTUj9q0iRSYJ10IDl0mVZRvxu29DZrB6jB96Fxj7vdxXlAUf8fbMMESfP0Q
	KciFn4dhDeVx1FUwkFjLbZn25BPNB2SP23tP7OpzD5SkK9Y2bjkH/KARqBUHNpekgqdkQQDbfRo
	QgcZQq3VFL9puAVq6Yg45qSvTboQXL3QG9doP4+qA2RnG+MyDs5X/RhRA76Kgcexmr4poc+giCB
	n
X-Received: by 2002:a17:90b:5388:b0:31c:15b4:8e22 with SMTP id 98e67ed59e1d1-31c9f435808mr9114249a91.7.1752756488059;
        Thu, 17 Jul 2025 05:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkOlSWzDs1uSxp1jQJYtEnS6kEvwG5U6hkqUjcCEAR0EVPDQRcrI9D1cToYjNe3mFQ7HLYKQ==
X-Received: by 2002:a17:90b:5388:b0:31c:15b4:8e22 with SMTP id 98e67ed59e1d1-31c9f435808mr9114191a91.7.1752756487531;
        Thu, 17 Jul 2025 05:48:07 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:48:07 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:49 +0530
Subject: [PATCH v11 3/8] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-3-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Pb0JW5FgpXpfFWALyentRdrGNmebMgVj4WCNzS0Y1bY=;
 b=BgwZ30iCRhtExbmDA6TGpA/ZoDLVSuir4HWMJR6quDkTJVIhg8rPL/W6Ku9lD9vGEir88pY36
 8DCIosdvqopAvydgEHilt2iR7zGvvBaGtQw4OuratuzgNcdD01zNQmc
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfXyfZKw6nfaQGw
 ET+l39CLxfEnblvzC5iJiJsiJAULOWOox2NmhQFn7m1JnNS/BaozqGdBkDsh/mUJSPkpOR28UIH
 FzhTe3w/iM0r4W935DhZjdr4Pa+ec3NhrWl55zPRNiGNrl4KIY6BjMcTCa/0J7+0f8L4rDh5v03
 Y9teAPwhP5DoQOFPkGUZBk/I1zQGSiEJhyVSiZ2Xg56QeMutuq4HSIBVgrPrgv3HNkFNx4MP/p9
 wazubMF6Ad90dBNpl++MvcgOVwDh1TAupnbX+Q+XCS4+5qKs/gUrreQs7N+h3XCeRmDEwA7VQfG
 XC89A39bpoM7JggjmPDEoDv88nJ4OdIYIoLdqTRuPOxvI0mnacic6AXVh/Mc9Rpu1XRaQy4WzdM
 1kkdE0UrQZZBe7rH0w7uryWOjYeaTha3HKVyXLmm1TINsCG6OjmNvDAaCZpicOk15QbUwbBd
X-Proofpoint-GUID: 6DJjeh2e72FlsbEYuilsgFgikF2d1jZ4
X-Proofpoint-ORIG-GUID: 6DJjeh2e72FlsbEYuilsgFgikF2d1jZ4
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=6878f109 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_054809_703157_5468CB17 
X-CRM114-Status: GOOD (  15.29  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 43 +++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 7360a2849b5bd1e4cbadac533c1a7228573288d4..da3a584c76b48e313a5d4cb7c8e0c3a3628fd1bb 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,27 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reboot-mode:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 1
+        maxItems: 2
+        description: |
+          Describes a vendor-specific reset type. The string after "mode-"
+          maps a reboot mode to the parameters in the PSCI SYSTEM_RESET2 call.
+
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx
+          is the name of the magic reboot mode, type is the lower 31 bits
+          of the reset_type, and, optionally, the cookie value. If the cookie
+          is not provided, it is defaulted to zero.
+          The 31st bit (vendor-resets) will be implicitly set by the driver.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +158,15 @@ allOf:
       required:
         - cpu_off
         - cpu_on
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: arm,psci-1.0
+    then:
+      properties:
+        reset-types: false
 
 additionalProperties: false
 
@@ -261,4 +291,17 @@ examples:
         domain-idle-states = <&cluster_ret>, <&cluster_pwrdn>;
       };
     };
+
+  - |+
+
+    // Case 5: SYSTEM_RESET2 vendor resets
+    psci {
+      compatible = "arm,psci-1.0";
+      method = "smc";
+
+      reboot-mode {
+        mode-edl = <0>;
+        mode-bootloader = <1 2>;
+      };
+    };
 ...

-- 
2.34.1


