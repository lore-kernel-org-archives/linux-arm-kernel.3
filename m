Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9616CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 04:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=; b=uPCxaLm0NCpMVc26jVwRjd1mZX
	3jJevBrz8KHnzTSbAqc9PcPSJL9qNOe1frGFOZLI2Xpklgl7FrrwP7oEuRd4d0hE/9GB9bzn0ax5r
	XxEj7Ee7rMiKYyYDnBHsi/SSfkreqIGED0oYxOh8qjNuoGvqzt4pMJm54wUlewoC56g7zbWKAZwQI
	nUKPe+07nkYK1mvaKepd4ujILn2FDl6ylEW81F58LTvZFMlDHJ7Pf2zT+LTly2HV0XDrtLBAjefhz
	n67ZvQuuptbtwBdz5GoSJ4uL9IomKc8JlCUKFFPjQVi5PS4l0XjALxSA6LshbgrjLkGmVbGIOXHQ0
	qRTxDnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIY-00000000RTx-2gTf;
	Wed, 15 Oct 2025 04:39:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8tIV-00000000RQo-2W6b
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 04:39:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2s6tn003404
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=; b=JH2ZtRT8ZNdz9xiq
	AW2vvYos1zoieDf+tY3EZfn3FiZaR949bUCAeSrSS8bmV3tbRtr5fSPLDfngJBJP
	gJtgaMm1cH82nF/CFktTCWL3rXukYTz6rJ70xx5AdtYMEXw55Abe5WCBJlhTQqkD
	KR6lqMC7dhOlnpjBdESbXdzn2Y0QU6K/zBQ/X1vxAnY/mPW6oO6S2JUpTDHDm74r
	tbLzPWUQEZpM2/uukOS9VBtdmky4ENhnNH4l111rGiIca4FwUFkCTjQUAPrfZ9I2
	t/Pvhp0J7XWhu+tm5RHMvLWzWJ6Z8oxsBj0GR1VDwgS/Q9qnH9oLWNmliFGjysuE
	j8U75A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8hmfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 04:39:34 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-339ee7532b9so27126210a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 21:39:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503172; x=1761107972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIWnFWN9JswVjgeJAZVSk7CUtGSis2EJBGP3G7aJZqM=;
        b=I22oX6AT4xj1sKiUPFdwqEiy62j6vjoHBx3P3ADzoWCCBthOByxKvZ0vPRhu6GuDaR
         bJCxathhFZy5NyFpxqaSA0Q4D073tgb8xPszpmezkpzahjYqLFdkz8h3Dq76XImagTZg
         9NJQWI8P5cVkpvQq7fNGmBjQLYI/f7jzj8NWFVsrHA157Mr4XtMgoI5d/d7GbfFXEsVP
         +BtTQeHSwYapaHMuAdUH83bYJIZUBKmbKFcctNlZGL0VlDvytCW0yvkGPxWdR52J8IEx
         I/PNzz9p6P2C3sxhY19MLyVUQivn6uYcBtLyvrefdZI8nS80dJx71HHtiE/Mclw4Q1kC
         Bt1w==
X-Forwarded-Encrypted: i=1; AJvYcCXSaOgPP+cSdrYMC65LmsiPcfAJO/HINyJ5QMbKT2Z9l4IYhHQcNlwEbwRM5bDBPmZIuDyvUCkEnOwHazF6pCYG@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4SiVekgAU7d2gLcApfinXBwCNyQRI2HdYeRtH0BT6ccHEa02C
	x44/RktboCLfRE1u3KXwaahfk2LiJdYsbuzrjOc8x9SYFWNnTcSF7EIIBAd8xUSjA3w2BK1M3Fr
	AwUmz7hsue8ohSCWeedHRM+3AOdCs+nXhGhhQNur8DzDJgXzsuLBsGWpa7Sv7ClEP4fayMwvzsn
	fRRA==
X-Gm-Gg: ASbGncsUAIFkizh9zaFqJzlETGauL0wGeII0pN+Ml/ntwl7J9RL5aUrMAuZ97Z82YnD
	aRZtb4j7eMz5pqDj1Zdg+ATvWdBN33xuSI9+pZDZCL39D54qck+UIdoDFyY4rKcIToM9E1QN67g
	Js1ln9LsTANpcFykdS5iPUiKig7buMVi0mLePGxPq0eUkNi6lNeMYMgqhHXRD5fsqgkJa1Q75Vr
	+VOitUfa89edP1gqX/iPCjt517i5H6G8QWRqrlPBFFl4yAt0yWEQE45zj2gw00z1y/xKEFCoSyE
	MXCcwCMKN7i6knRBd621X+dPD6xUG1zN9ERRZkS2Ax5JkWkKEYrSGQ/RV675AYpDjYLW04k4a0N
	5
X-Received: by 2002:a17:90b:3890:b0:338:3156:fc44 with SMTP id 98e67ed59e1d1-33b513758bbmr37056530a91.18.1760503172020;
        Tue, 14 Oct 2025 21:39:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGvgRTzb7knqpzNaPhY0yhlNG4N72VqZ7xUOrGAMsJmJgROcSWjkXAQgsIq6bZw5DGhL979w==
X-Received: by 2002:a17:90b:3890:b0:338:3156:fc44 with SMTP id 98e67ed59e1d1-33b513758bbmr37056487a91.18.1760503171499;
        Tue, 14 Oct 2025 21:39:31 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:39:31 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:21 +0530
Subject: [PATCH v16 06/14] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-6-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=SmkKRQQh3S8Gtdgd1oOIc80Ljvpw2jelYZ428aYXpJY=;
 b=xFWNl2F0ikA8PPaXC182saCjtRr1XUwFnvtiVQhNheBP+zjdeXpRqUdgNHkvYcVkRoh0+o1OY
 5Hbgz914qE4Dyp3XBaHoDUpnGA8R0G/mmiGUlTxticmhUydrCTYhxBU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: k4WIS1FF3JB2rDsABWiDJqcmJAh2RENn
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef2586 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfXxJI4b/qmYklq
 pxNbT4vtKP/NEwqt5zA8s21YhdDJoQba/+QXMdL1WSE1mZVatjpTlh94fg8axFW7lH1OXlvtJi6
 y181YA0Cdp8DGen5R3H4mN6m+0l4+IyzLXtoDvZ6+iNMZkUbeRMfX+hiqdzCS32BGgwpqacQK3O
 yy+wssnpzc66NeiL47QXiQUj5PETbWbl+hP0IFVCK2Vw9mCe3eWVySjk6CEtIGMLZrlrSotlMyW
 Fos+pkPf/spJQ+V4buC3ue489kw5NNVuuznbsiOzp8BKZ2/XlWzPjc3ezt6KSI7RLxmpegPCi7y
 wilCtRnafyp7XFXeNUnO3l4DRZ36hnn93DuwZGAeZcgrGH/ob/cVf6idPECKNVelD38WREJ2Bim
 m7YUQFfn78JGQxuwhGVme82k0iPEGQ==
X-Proofpoint-ORIG-GUID: k4WIS1FF3JB2rDsABWiDJqcmJAh2RENn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_213935_772692_526CCA23 
X-CRM114-Status: GOOD (  16.50  )
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
index 7360a2849b5bd1e4cbadac533c1a7228573288d4..eca38f8747d320e8371c1dc37cee2287d71821c4 100644
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
+        reboot-mode: false
 
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


