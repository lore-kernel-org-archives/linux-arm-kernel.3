Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9ABC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=; b=LKS6vluPEFImIs/O2Z418TaRpB
	JIU1SPkZ5iv2IQcTFLjGh7v6LMhid1swHWwIEh8shgwPZNoOooiVxYbBfmVNCe3LIcueBeTttm/AI
	STHcgazVcw3r4ZREYlzgJq0WTF/EXLIfK39Q7D2Gj0YIEYdlAf1AiTmryRxxri+HD/7bRlbmfbe9z
	5jTblsDZ6GNqTHVn3zDE7IKXVmSMGGmxtzlV4+Ai1G3UdzeQAFPvXgqo7vRZRszCPPUdgMuGNJuzd
	HcOnm8sWbS37uWlWQSqxnrrWdTd1MtxIJ0CS+KeBVX1AQw4KrOHQlvAKAEH3Hc1zuhMpB5HQW56tN
	AiEjBDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4Sx-0000000Cx1F-29B5;
	Sun, 27 Jul 2025 16:43:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug4C6-0000000CvHg-2q98
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 16:25:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RFTeOb016975
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=; b=OZynjd0bEGHbnJJ3
	IWW/B+kDbmJVKigmjkl1uTDl5LCq3FVamQjo/ab340CcnS6W4wYsKSqRSuDZ2xkI
	uz8pouY58AIthEQHNdVJwGEj59ZvtTQXhmLF02qtSg7q8eiTg4WaYmnR/CIQ5D0B
	1ZqsG+u5s4c+Jsx5dpDME/gZh48EggAr8o15CvWkLUA2/YO78dQ34EX0bxrsGKGw
	OZJ21VI9E33OgyfTJcE+YqK9O+ShZptev+nOH/8JKUHXN4NtqY4X98m+vKoXn8rh
	yUXH9MTJfN6Mi7Y6Nv9MoR3L0UOP9zON8kbAUOP/PewWsFd1oJ4Vb2E9CEwYx3J5
	Ylt8dw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484racj9kn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 16:25:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-240012b74dfso4306315ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Jul 2025 09:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753633549; x=1754238349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVmI/zpQBLHcmY6/km9+lnVLqKzUs1cGOy2afpNbw1A=;
        b=bv/GaL1bSC2GoDVrcxiSRaOjaXkr2eFi+yUNV/0j3EEa+k0SfTnKd3PbNWfkzQXcqz
         LsP0ON6V5IkR0+rcWPOlJh7uNaeHdRhbJFe3oOl57CLGAPuzhkvGxNS0Tn6WYedBg7LI
         /sEF12oqmk8ysXQnyVO1Dz873Lsw8at6rzSgzM4RYzIXJxZZSc8liqgNsldj9tlmSVuS
         wOXYeYsQKhD0U880cPtUapDLSrpzDFNJbX1Ymrw86au/VXPz2R57FJUv1sRQS8wZzrqX
         cW8LraoBior0VBsI//GTKKi8XB8hyXARRRgZrC0KrsaMXRwSYkhr/eVy835xsnF8zyrt
         xwsw==
X-Forwarded-Encrypted: i=1; AJvYcCV1HO4hUKbuU+pxK6MQA9dWm5aTYzviK96+fI5bfmU87q67gI0ARSMZ0DU24ZNv9e/kXAGxnJiy4D/1KjR7QzlX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh942i8UiBm2KusvTuK8wvC/lm3sZqgWcFRyjG+0HrpSmBXeR4
	SLSwDtg4U41r9y+kt+I3970KXLcLCLkwku19KB2q+GK7F0TL94ZH+7+jMJzky5i/T+abjNDAUyd
	DRW1JdvsM591cHzJDWIzrQkor7ycuDzDJP2e9jJ+VpjcCxCtYERbs/Ewk0MHkj3Mcw29To6Rdtf
	kXZQ==
X-Gm-Gg: ASbGncsZ35Jfhw1CrGV9sBJfN8+mw6CVq6jU+FVvLGf1WscfAB8am3FdmJXbaLg9uAE
	Ur6zxaYqiBEKDhV3vlISINyGH/D68DW9a2Sb51AFh+w1+cDP5ZI1LuFeh97A0uNdx+S+f9gSq+t
	iBDMAKxn5TAsao01IsAiFbnsZnOXXyO9/gWJggnHc2+vtFlFzavqQDtJFNmPhA53LBxSWywG0Qm
	6/oAoLZAA3ElmqfkP3VsjJOpOtcOrIvKwibuDLNJwUzpmPMftrVRJVQ0agFcGttEAp9xbOxGsuT
	zC3J1lbk16TVk6A7OAGucnFzTYDMpsJiu9QmlYZK/qmAeNUZ3Bk/ZrhKe9YfxZv8Gs41xFW3/2P
	4
X-Received: by 2002:a17:903:1107:b0:23f:d903:d867 with SMTP id d9443c01a7336-23fd903d9fdmr68041805ad.35.1753633549271;
        Sun, 27 Jul 2025 09:25:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL3wWdtZ6aYUyxBwD4I04sxzmNGeS8xOyoLA0/pGD4nypDDQZu/utCQqLS7ndqtErXNjHKbw==
X-Received: by 2002:a17:903:1107:b0:23f:d903:d867 with SMTP id d9443c01a7336-23fd903d9fdmr68041555ad.35.1753633548710;
        Sun, 27 Jul 2025 09:25:48 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fd9397ebbsm29110325ad.210.2025.07.27.09.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:25:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 27 Jul 2025 21:54:49 +0530
Subject: [PATCH v13 06/10] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250727-arm-psci-system_reset2-vendor-reboots-v13-6-6b8d23315898@oss.qualcomm.com>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
In-Reply-To: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753633495; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Pb0JW5FgpXpfFWALyentRdrGNmebMgVj4WCNzS0Y1bY=;
 b=q2Cpgc5X/5vvp5IW+bSMM73MNGrPdxZ9TyGWHgnn7fEPw/7YCTssgw97rASyUi8M1FNatC4RE
 D62Y1b8i1PMAAg0ElzQjqtUuEhXWnmNzMVrBj50GG82dX0mbqehtdl0
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=WqsrMcfv c=1 sm=1 tr=0 ts=6886530e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TcB9ljSxvO3195N5_5XM4qIDy0UDB71G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDE0NiBTYWx0ZWRfXxBauFdHcCV9Q
 kbEwZOABH5/548iqd0JtJzrR1jCFlCwmMaa97mHiVYa0tk5uwcqukn4Zlum0wogKjJ47Sdxo05s
 FVBK8MIZp21j7y7NfKbs3puzvywbcX2AdW+8LoowL4TIPXpSiMbfmRLow8nx+uDQicZQqr7jvof
 IBtcU/aPg0iW7QIDUzd4/g5ZMPhhuLDawPA7uyhwBrZsrbRHnzKTt78vpZhCCp0eQnAO08FgZy1
 LalObA0dBKhGq1TrwYEvek+0HS5eAjmm/uqsvA2FtlV0EtX61qnOKGif/ttewUacrO47HZW6UW4
 4jL26zhO94czvSao2pQIUg2ADkpdN06I/dsYFr4Vmp2zF4r+lVNIQwkG6VJTlJ3WkfKSk/I6vm7
 nZmaK1DovTNm1jGeNIXaIfw+OuODNb+VUwNPUjvk1r3YEvLQvGHU0gIL9NhCp/8dGofPnc0B
X-Proofpoint-ORIG-GUID: TcB9ljSxvO3195N5_5XM4qIDy0UDB71G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 mlxscore=0 malwarescore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_092550_732097_1B54BF0F 
X-CRM114-Status: GOOD (  15.95  )
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


