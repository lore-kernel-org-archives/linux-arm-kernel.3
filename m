Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7193BE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=ooNZBMKVkhkq109BRyVMm/i029
	hvGvr7exnAhIkTRI4RXJ+lvy9jvgKNcrshxIA+/rHBtPIRpHNlAEWc1Z5FyXsZfOZPla4LGXpx4bP
	p8gNp2DydnWzvrIpZVXyIlFB208fgWnWFza22yd5Zepz7tnQ+79g+LNQJDONwJwviYXKDK91m9xQ7
	xTMf/jFwJXNx9egjnRtQuxgJQSxccyLKeM5MulGnTfXX7z2qnHl8Pev0h/QbhdREkJeuDLHec5KwY
	FiYZ/YZ4KHksyWhBdbptA4fasZfIOHJTvYB8CW3qps05jSGOmGBItwMGTBncUdXEaWRwignuR2CJS
	J3w8V0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSE-00000002uPz-1tpB;
	Sun, 28 Dec 2025 17:21:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSB-00000002uO4-0jHH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:21:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSCUlSA2986068
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=; b=OSQIj5bsChWqAj48
	ABKxrp+IiSLJdlruUNl+3hQwW/bAb5ORjivIaXpgBMaAL41LvyiQ/0GicdqN7loC
	yqjSCsJJxOY3yBx1Vao1YV7SXAafdX+YNAstJNNdLyxZdORtlthxiVBuqkSWExg4
	TaLYUfpleNBtzPCCRyWlKwxnHAHz8CYdm37K9JDwZQLYO/XK2hDZK+OwMo1JdeLB
	7I61P0f0PMXzB8vvDvagydD2YzsETKA7I2kKcejeISYydD/43fPZ/RFM3/k1Nv/S
	OJIfl0pqrxI5m/q6IM7QBoOklTF6o11u2IMh2b+wWYJWytsmXEtL5dBcvKy+bXwe
	eRUNIw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7u5jevp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0b7eb0a56so224381865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942472; x=1767547272; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=CEpaJcQvGQO3ycX8nDAFqaUmZZQHJlBLc5JY2Dm947oWs+bYmO6sg3404FYxo4sxB7
         +3VBqSAEJ1FL1vcdG8Zgi6YN8n1YW4vxSRpCvFX7H4NsPnT9KqmCXjtAZLXVmsQ/8trr
         qqI2guWfDGPu2lGFU0MTnBjxdRhNzaNM+s2VBYoYS4b0CYkjQLIagKojqp1EOczHsUhG
         xSU6VSp5vLm4HtHgvRFm42CoSFq5ycFVGJx0w4gVqVOH3kVeHlXYi3116HdHctwTpleK
         Pg3/0r5dfCe8qMsrdjAMD2w5OAoe9P/khBLcvG0huXffVZ/ynWMMUpgxm00LtNFzJ8zj
         OG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942472; x=1767547272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PO6gg0/IWEmCTv8xrfB/fKl5SzRNa5BhzNOETtSDJoo=;
        b=cZGQ8MlmxMYLoJNZ8xs1o/xizOlGQQ/BUdt/763UJ+Gm4pdUxD74HdxBcARd+pPQ4E
         5IfCKalv+CRNMdpoHcEP09zWjygKes7uH8K0r+uej3cOQVTGYGcmdSr0LmusNZGDIoz0
         JPR/cjHPiE/NRQI+qlv+y1utU77XbKi5ShhveQcmgtGDhGtyZlY3nnWzurQqDFcEkP1x
         u0bTKlNTZiIX+33ocLJRUM1XStUtZD8a5iRqdgTg9AH4PQvB7pWOUqJ31tehCo3SCuW8
         wcFL1leY4Cz6sUNrfWsgv3+emW6hqSqCrvcD9Nffe/wPcfRgwdAzXYuHEGbY+L35H+eO
         2oZA==
X-Forwarded-Encrypted: i=1; AJvYcCXzKaC6NvPKp5Z7AVeq6vPL6OygUo7HgRkODi8D/Bcj7ePQY22jrbF80siMRq0Cjc02zLUcBnB6AezpTi0V5U0e@lists.infradead.org
X-Gm-Message-State: AOJu0Yz86/GxbC3r0glClAcNYcygNDW4OOTMQsAE1w04758mcwNdeM++
	Ge3AwfzNLmB0M/xi/+H0rmLiHwCdL+VeC2v5FjE01qEym34q+KWkfX1rnvSVFdGN9zHNxCazZRe
	bdfdHfMGRcCo9gYsZxC+67czvGa5n+VZLIvfi3w318jkaxUNyTOVbOp5mh967zBOUTaX75/uSfj
	3eFw==
X-Gm-Gg: AY/fxX52paa1DDu6S2s7nmeCkYV3QDoKxukwf3weVgJIZ2LJXbJA3ntiqIEGFiU3Nsr
	uxfUeLKh4GeXInWKxlUDu6zDbe4IjUeAIMgKbHiGdwiWLsoYQq71WI7Qj2fTesrcIHgHpNbcPd+
	jqhp4iejrfYT7LiJ3v2MCD2f1dbMmGaXdEDeD2uX+jPwkcdAI98bWUJGCmc5z7+2HOESmIbSioV
	/4nsPQGLIUx24xG6xINObAq1M0xlJlFEjv3RvF4olI6xwXtuSPzgf4APTZWE5c9XlRblD9dHA2E
	0XTVs9MQzsif5H2g4Bh89UjTCt+nzasK14tPvThx6tsQmPiCUT2WrsP56QqPQ+EtIMpx4OCs8vv
	1uXm7BAse5gFKsDVxH6cXcgfVdnD6D6aDikgoWWW40mFgbg==
X-Received: by 2002:a17:903:1b6c:b0:2a0:be7d:6501 with SMTP id d9443c01a7336-2a2f2329b6cmr254838515ad.27.1766942472318;
        Sun, 28 Dec 2025 09:21:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJf2zEoW26feSF7xfX0vkApu3sXD9MA9CPAaRfd1rQL7BloGMJh2vU3CewAUPDXyVkr6gtEQ==
X-Received: by 2002:a17:903:1b6c:b0:2a0:be7d:6501 with SMTP id d9443c01a7336-2a2f2329b6cmr254838215ad.27.1766942471808;
        Sun, 28 Dec 2025 09:21:11 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:11 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:23 +0530
Subject: [PATCH v19 05/10] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-5-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=2477;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=yBVN4FEHADdTSQ++LEmhmTEyByZ3pz1DEJtf2+BqO1w=;
 b=/mSBXPgpKpEpXY4spqPm2N227p+KGOphi1atXCWYlPsvNtAR59MP91OzPkYBYlTbvVwzmKfp2
 FwPhzDmbHllAzgtvHSoDBk7867mFBkgQkUlz14ZEPDiDZQqD995MelJ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: YyQauHfFHV0lHAMwuwgeS8H_cs80Zv-G
X-Proofpoint-ORIG-GUID: YyQauHfFHV0lHAMwuwgeS8H_cs80Zv-G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX5FXFC2V+w2qz
 JRMi7aQPwoxAJhNS09m1do1C5T3oBF1TIMFVx1SLagSwZL8OQGqr+IYVrYcQzZ3N5ydgDtU0feT
 QS65w1i3jw3X3vycyH+9aNmK1HNRi7C4oCFdwO4lYjYA/ULLP6IKxu6zQ12ojdvioav6TYIEnLT
 nR2RfWs9rPm76yv5Lz34Ugnat/d+kzKvUX1QQoyQx5H9uE2bgUNknLbeG15zBkc4Y9nNy5jVVj1
 BsDm43nuJGVBfhS+Ipp7DpKOUHo7zXqjGEPIPx1G0AsIZrJQ2QfMHbpUml5bB1P9XKquvKDOIvM
 q/TaE2OuSbFadftJS72JnWOxyWbn2OeM9SpOmbBhN1PGkQTiud6wx+DmsTdk5NjOfIj5D0pQvt3
 afFvjzgywJpyefANEQygn/FzjD4dTGP+9POwzR6amCVg0xfysQBeBh45tKT4C4REcGPWRx3EVAd
 eTLowYvC1yFX1nnvz3g==
X-Authority-Analysis: v=2.4 cv=DptbOW/+ c=1 sm=1 tr=0 ts=69516709 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Z1E3qa2j_4PWJv3PNLYA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092115_343107_9DCF130A 
X-CRM114-Status: GOOD (  15.10  )
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

Add bindings to describe vendor-specific reboot modes. Values here
correspond to valid parameters to vendor-specific reset types in PSCI
SYSTEM_RESET2 call.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 42 +++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 6e2e0c551841111fbb0aa8c0951dca411b94035c..5fdcbf331ea5620363638feb6f8105427a87c00f 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,26 @@ properties:
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
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx is the
+          name of the magic reboot mode, type corresponds to the reset_type
+          and the values should be provided as per the PSCI SYSTEM_RESET2
+          specs. The cookie value is optional and defaulted to zero.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +157,15 @@ allOf:
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
+        reboot-mode: false
 
 additionalProperties: false
 
@@ -260,4 +289,17 @@ examples:
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
+        mode-edl = <0x80000000 1>;
+        mode-bootloader = <0x80010001 2>;
+      };
+    };
 ...

-- 
2.34.1


