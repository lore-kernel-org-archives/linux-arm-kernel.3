Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80B8C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 18:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=; b=GK8Da8ByrKwDuD1b7/I65u6kbO
	1SEQ/iMZKIJw6QbwaOHMNvnyVKNeWNz6u/fVZjn1+WkSik6ORIiLSFqOoiEitg2x5r7K/dRnZ5DI3
	gRKauwKXvWJRpRTCu7fMvYwrlM9m60al5CB51Ri/p+BBzI0nb7Mqg99fchrfybPRJ68MDiWbVbLNq
	DUucCBArx7I1T/2QUDV5wanUrrKDvK+sDT8eYIIPCdEhXYiZ+Ff1Up4S0XP0Pr/9T3eQVgbj2Swxz
	InTxSIODr09yxWjgUXdI+YFyx4Hmsbz/4poXfn3uPQm/rA+/LclN/7pn+T7kBliV6eX/arOF1ySu/
	yFa11Q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udviA-00000000SFn-2nFi;
	Mon, 21 Jul 2025 18:58:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udvGW-00000000PvG-471P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 18:29:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LG7EKw029344
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=; b=Nz9IARnSnjy4o3WP
	enj39xfEdma5CFqTgjQsX0Ks4/lU1+Q4PTwNMxFoSdJ49AGzdBlDtcF6behBXAmQ
	FQylQDMi5F9khivZUgHTAr1iXBK1zklqqQ3iZXT/pbPF+iDGXB/9suzemK02r8lM
	f6X0yX4RgsHnxJWQEFZvoSCdVTIBcmvs/gv68JR5lXeusf/A2m09mdfIx+N6Fup/
	UvYm8f8WyqmFvjFB3bNT3a/Rwjz/LJV4Fv4qn/VoAdW+/LM4nlJdmtt9Puvb34/s
	743xUP7hPlv1EuhRzG3eUu9iCxO9ziY8IaPwgE//2YQw42ASynzefq91YxNC3c1I
	AGbdJA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048ter4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 18:29:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f77f86f6so44298335ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 11:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753122571; x=1753727371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=;
        b=xFVcmJfiu0zXyEyFvplQjh8hsoMYNskBLn9sgTZEzqFCQ/TkqX7UOdPp607CLS93Zz
         Kz9eSO0t/d3HE4w68o7fy2yQt38rMjZlXVOyl+KNxfUqdDCwUlfRtozrah5aCnv1fktZ
         Xn2Y3SZaB5rh3HwoEmNj8nD+lXK8Nyff8oow30r+hQoNdOkPLXgie8YkHcT4/jhKD+6g
         rrSXKj0ww3INDNVpejKNGjULrhcDBF/9JU6SFK/p57DapjzIOcA5+GFQsWtCQXfDL+cz
         +HZwMZVRvG4qr5I2IPcTl53lp5U7GaBRrqBb/ZqN9bMPkZpKhUJHiwyJVJcd2pZmcO5P
         5LaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAv3sZLSraVAy/KpNdE7ntdczNJBMV9xclIPONDAiQaFS2FuOJVenil6iIlulpw9s0VrBycPyIO2eWI4XSBfBK@lists.infradead.org
X-Gm-Message-State: AOJu0YwnPsVPDlUxIBjjRvglV7NyXwsbGkaXeTl50v/dLDT8oM9wolwM
	JzVIEOeNUKPIGBIBLZXBYIggl6iUCeM1qf5HtWyMdlmnmpewyA6cNtejRgCr4at9AQMfF+WMj1l
	lnHNmputUePvxKYv55qNvTzhpbZIBToxMcjqCozRk2PPIybbT6bS68h2iMuyeKfJh50ziC6XVbb
	9P+A==
X-Gm-Gg: ASbGncuP65hyebT4ds/B0Cg7JvM4PK+V+uFf08W0IoAq8pYJBBIkijmoYRU3QwcGecD
	CKwf2q7WJdMzVcQj53fFWDJ8pqk8dhQmDjycweDXaXXdKNSljSkLq4dnTjuL8cDsMY7U4pvGVJY
	f/FWEfmOdt48LSIAaSmwHwg0GyWrohr/ewie7gg7Zo1SsyP0iEW7jVOG9zKn2Dw9wT9Z3WDeMUj
	vTf1Wg+leqvbJfJfXIuB0pWAIsvCwdsEoGPmQT92aEvUGv7W9DZVxb0+Ndd2thLt8VyJWqT2C/G
	u83o+4nfiPBvP3EyCH/WT6U7S6pt7fkj7A2jGoS/FgEvQS8pWDdeqlMKfiPPeXAoYOM8yXVK/w4
	/
X-Received: by 2002:a17:902:f60a:b0:234:aa98:7d41 with SMTP id d9443c01a7336-23e257608famr282083545ad.42.1753122570637;
        Mon, 21 Jul 2025 11:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2v+24oc4EGuXA/VCAKEi0tkhjcXI5flOV7/cv88JcfHdhd0j3Bztjw4+c1dSccqUc0h5COA==
X-Received: by 2002:a17:902:f60a:b0:234:aa98:7d41 with SMTP id d9443c01a7336-23e257608famr282082955ad.42.1753122570168;
        Mon, 21 Jul 2025 11:29:30 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef4b8sm61414545ad.194.2025.07.21.11.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 11:29:29 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 21 Jul 2025 23:58:50 +0530
Subject: [PATCH v12 3/8] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-arm-psci-system_reset2-vendor-reboots-v12-3-87bac3ec422e@oss.qualcomm.com>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
In-Reply-To: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753122539; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Pb0JW5FgpXpfFWALyentRdrGNmebMgVj4WCNzS0Y1bY=;
 b=pptw5r8GqVdGNeKRHeianN38LF9fFIuF8QV2U/PQ7Mx8OoSZB0w/WPhNdsfuuQZ8vBD1NQoVo
 Czo/OiAwv1EBWHrKCYsHwu6lR2k236wFsub+A8iOZv7TumxiO4APofJ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE2NCBTYWx0ZWRfX3aymBZMJXlcO
 0T04Eje08E23PrC8+74xAdfRJkq0GLMPueajCfaG8d8p2/bLwpMxQ7kWXMSAb+7BBkkV+FiYoWG
 nYoMZSBWBwbPsEKP4228dcc6qyKcxVMEmG08tUmPhxSHP13wbsZs3R7HHRFdVvCH5WAyT/J9GeO
 rurOzyr2TGGfYfNYpnzZzXfXtPWovOjOt6bIltpYopMdRdA8foqCtBmRei0WA5qW767A4E2SjBL
 mD3RYT/++7kTv8wOSvGp1Ad2/9oPtTe2W97lL2PoGnMS1lg+dGBbvRhCjOFTEApZFXNhOxq3YKg
 VjKzAxG1rHCi0FGNIUkkd5ZLCRXFzlDgKrd/vGPlPN/+kCSrA8fQKkE9zpypcPoI2XdpglkgOso
 PZKkA6BVk+VuioXJqUOh05s2lmDdjEghN08JJECR6wqxIqZ0RUqJWG383BRgirbvlH4iIB/v
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687e870b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: liO4RVsJGNs8REaaPPoV39Wuf7lUl_VZ
X-Proofpoint-ORIG-GUID: liO4RVsJGNs8REaaPPoV39Wuf7lUl_VZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_112933_141653_8F8611AD 
X-CRM114-Status: GOOD (  16.42  )
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


