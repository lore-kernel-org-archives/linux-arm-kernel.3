Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAC0C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=; b=d3aqDMXEXebETdgVjcdapV1PHk
	uM9as4Nw5UKhQlknd+vzqOqMhuRTpbSMgo85Gn3RfPh21NChzn1mPIhya2Glhwp3xE94kE7cL0CU4
	FwHnyoPIG3f+hKcT30CEL52LtQI4GF2c/MihT9I18QApfE1R8wy1KoeJN6ZYolh4IR/Z4zpHzXXy8
	yvdjayThVDiTs5ucmYPCqvdS6zwRo71KDxfxkrFxXuPDJneNwAtPutyzVyWPxytdfYnYZgQPHDpTC
	HctVztsI39F/Z/ffFiCo6e0+tgXnbwZl7NPO2g2ugyRteLBLPkbgnPyfc3vAZJPNLsKSzghYuIokZ
	gxUnBmBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68AR-000000043yM-3qPj;
	Mon, 14 Sep 2026 15:00:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68AL-000000043r7-0Pjt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:00:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0VGc3588164
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=; b=S9nrs0NII51EzlaS
	oPQDWtpnPaQQRLUIa8BGGsCw6DbMcjf6l2hropH0DVPM361GXEM7Bdfw8uKwdZot
	5dOgiLl6tw+aB+VWElqzrMmfCq1GH88Sa41UbYxNA0bYRzwTWYmxS93DiKmTotia
	mQ54DderMnj43hGaEWqkAwXXi3K/j6rpsGhQRXwbjH04nbzWP0BZhZza/lfcOIMp
	1pNrHYjjo47G5xuwQBxuKPBIzyWyFqSXimgw7Mm5av/gpzxNL3dG3wV6JYUqHGlv
	Nz6KPv8wCjTyjO36EN3wNZEWB3aExOdQV2sjiMZ7alXNteBk+XLP6itFWwR5O76z
	BZFdTQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg9743-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:00:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dc92350888so56834075ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398016; x=1790002816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=f9t1LXwEWtxH4U8h31Pf9S9lHNQQuR4PQTxLs6jGsZ6RLbmie3tpbgbYsYVis09ciw
         75tV5i3E4l7n5MiRFDghL6wI8Bl+rPX4DdbqWSD9IvfTXfaacTkIbjxswQ1mpq0jenoZ
         U4cZEkKGuDaMZyiPUTOoiLG696UKccXXbsRWTNGc1wHyhn2dK5hZ7l9yvG2i/Ww1BAv7
         jLhNqzZpUzWMnDEQ1p2liokb4sBaxlCrlqwS/9oAx/0BlcDxqtXr+RX8G046G2UxQQPe
         zjc2cI9ofLdmu3+cxBDU4dkp3Vk45MWJe9332QKR9lL4OYB2BSXn00u953Yd3i3SjjE8
         mHsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398016; x=1790002816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DHDwEn+WIWhQ0IciLdsAkajeCelVa0Flp2Kskcti1Lo=;
        b=CWbz/NcdJOqzSymTJ4Y9x7LJXO4VrTm7LluPi9WO3nHbxWCnDmAaqGcPMQrAHchFGh
         KQSXiU004pOgnbeiBqiy8pkjN9SUCWL7vz8hUH3AKFTGNuFV+D/JxIXgJiJcChYxKDNo
         K4VjjkHLwuJZdzNZW3VGJ8CvFGPb3QzsMXrOnzthIn017Cj4eMAFWTX8Yj3IN+Sh0EkS
         hBpen9QF3mQxCLWmnVeSW4YPVbfaVFMz6OkJ/IJI61XSbqaA77ngb630Zt8FEcV9ll2D
         ji78IOvKZ6OGBqiow9kfTZl9f3+301Mm4itIoIsxqBPogNGiJ2bPiy6bUKI10MZvmug8
         TTDw==
X-Forwarded-Encrypted: i=1; AKwUvByIQe42qrEzhOq2ViRCiZ8hQxeR/++vcU0+eX0Q4OKAMHFRLVsMxuGAUSTQ2US9TaA2Ag4zt6DssCNo1i2xGW1S@lists.infradead.org
X-Gm-Message-State: AFuF++mVeGko8V/bCZfZYJS6cslyFoTL6kaTPMyPHlTpSJ5eHA3p6Q0l
	mzlOMPs/FxSWn83/TqOrV2iOp0ClEX+mtzI58urQUfZczIw2fOYplUW6ImZClcbimNxxTsAgeRp
	Z5M+fm74fwTs3K1Ybl9hdgStxP7XMy2IW96QLocb/pZbRula7frC/VccFPcs3SPCoDOxJ50dBgv
	4nUA==
X-Gm-Gg: AYBFou0tk0yGp27IzflFhgq7DKUgTl6LEcdBi41wLEWCqiGdOJ2NGOyhz2MsrVw+VL5
	E3zJr50a72hLtuiZJvMU70fhkxMDE6wIBgOPN17lSsm7dp6cthYi5phlcAdVFv65kJKnykaaVf2
	B5hwzJscav2KBQLAVPR5Cxrx39knowE9vM+6B0Ox1tlEEwl6ts1UHy23PcPrVfuPrH2DHiW1iLT
	P6u0VvhPFZALWzRZYmLv5igVIqPMDaySnbIVPWnKSzS8CDxM95XISCSUjf9/0VmI+tDpzsgdNFC
	EoTbyvbAfWykJmHdtmPPGluvldwzJ+bK18QW6L4ggAwn4ytZdRtkFJHGOPb//vD18WcNOAKy8bY
	m7wM0FHiCtsqvuiHZlUauSgB2K7DXfwDjplkA
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64687915ad.21.1789398015469;
        Mon, 14 Sep 2026 08:00:15 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2d9:4871:393d with SMTP id d9443c01a7336-2dd6c741d36mr64684915ad.21.1789398014250;
        Mon, 14 Sep 2026 08:00:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:00:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:09 +0530
Subject: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=3255;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1LKdaQC3O+xm9aTmJtKPrncrf8fJAOhX1XLDI/B4dnM=;
 b=9f7VltXLt86w6F9+EGr8WWpUIDOdDKEqN7YWpUaS4nIV6sFJpeL13CNDFTmp4mRqRZO347vQt
 fCuknKj9CbwBQX5SYiQx+DzSwdtAWrzVzAFYgN2Gc7+Nd//a8CWe0qk
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa80c00 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VHtpXdJELXZ9Nr0wy4oA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: mBuMzWYQY8jlSguC7TSdhFyofC31im8O
X-Proofpoint-ORIG-GUID: mBuMzWYQY8jlSguC7TSdhFyofC31im8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX4bEmjXW65cLi
 FEkvGjgPHZYEoX2Xz1f0OLFo9NnzSGeAqrkeRRGj559nAmht4yG/do9FK/8zx3C03D/jdUh373g
 avOptW13ZaHBTjNPgMyCRsMf/XR/2+hXXhOOXkqsw582yFtkFhiz95qnzybTIZEhKv3ezuMGB4m
 jk3TCP3bGUCT+f8OD6Wc8YEiW9VdjiQ+qH+ok2NAYB8BdQHQxP4kolkD7CGqBW+Zcx11qky6G7E
 a195jKSQWMw4u/Yuqlkr0VhTWsjXfmFTGh61FbomzSGOc/9epzAjzCgB0xY1cp0Eb6G8VSW7f8T
 TriAhmup9MUbhgreww1EaIm28SnhaQDDtRe32CG0Qe8/+UfEEnF4uxkhz+8PQg0/MMrr2GTwQNh
 vWS0pW3Iy4060czOdwPWSbYucibWVG4Wj9U1ygVIfc3kGUpiQynUmDHVpLQvQFHSi3q+4aIYgra
 ET6UezlOwi1AP7t5Zww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfXznps7yrgH+C+
 Hik5iDhSQUCam4ot2/G3f3JxAZjM20JprjGFCgh9OIDM+z9YxS+1kPED9x+VRx9PGRpgk0gwrud
 MyINPH0Klv9F0ApyUxzL3a+6Fxd/x+Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080017_205973_1B7A6F4C 
X-CRM114-Status: GOOD (  17.12  )
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

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/psci.yaml | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..8b6a28b81ed7 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,43 @@ properties:
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
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 2
+        items:
+          - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 0x80000000
+          - description:
+              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+          - description: arg3 (cookie_lo in 3-cell form)
+            $ref: /schemas/types.yaml#/definitions/uint32
+        description: |
+          Describes a PSCI SYSTEM_RESET2 vendor-specific reset type. The string
+          after "mode-" maps a reboot mode to a vendor-specific reset.
+
+          A vendor-specific reset takes two arguments, a 32-bit reset_type and a
+          64-bit cookie. The arguments are encoded as up to three 32-bit cells.
+          Each mode property is encoded as mode-xxx = <arg1 arg2[, arg3]>,
+          where:
+
+            - arg1 is reset_type and must be >= 0x80000000.
+            - In 2-cell form, arg2 is lower 32 bits of cookie.
+            - In 3-cell form, arg2 is high 32 bits of cookie
+              and arg3 is low 32 bits of cookie.
+
+          All values should be provided as per the PSCI SYSTEM_RESET2
+          specification.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +174,15 @@ allOf:
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
 
@@ -260,4 +306,18 @@ examples:
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
+        mode-edl = <0x80000000 0x00000001>;
+        mode-bootloader = <0x80010001 0x00000002>;
+        mode-vendor = <0x80000000 0x00000001 0x00000002>;
+      };
+    };
 ...

-- 
2.34.1


