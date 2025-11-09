Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120F7CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITVJjoF8oZpX6CH3gig4SV3VeFTPVCOpuJTI/Zh540c=; b=Bx9TkkEIiqp2tPD3ChAY4iYaC/
	stbG9eCA40KVnCpiEEt0OhHnj4luvBR8nqAco7T5C8niePriPVPW6XlZ9Upv8sMGnorlhZi0DoZl3
	RmcCfVyHyNrHgVhun4WMsIHGqsp7AYYduIGsjahTv0Z7FXo6bZhfUFvWM/9Uh5yZQYcuAAefHNL7A
	KXjXLQ0+o+sbBkB5LzWS5QhJCbX5CvhQPgAgAu2SlGBenKPWgboX7kGLEo9xIvlliEx3cpC/++9QB
	psJ0omPMuF3VvIATIekmPJgcuB7IlXsZCgCQ6UoI7GCkjziCuBKAgkde/SEh9M/V2MvoXDxozL74p
	0HXojBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6ZI-0000000459b-2ONE;
	Sun, 09 Nov 2025 14:39:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6ZF-00000004573-326M
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:38:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A96dTAu3750376
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ITVJjoF8oZpX6CH3gig4SV3VeFTPVCOpuJTI/Zh540c=; b=O/U/5VgCt0tVUGhi
	1sTWsd8rg5gNFsb9YQ14KZGzk3An53UKweDTPlyyUGLwufyg6TAHWhCZ9t9ZzGgt
	rR2F6stJbxw/f0Trw2JuSHnXs2HwzKeO0l/CdTSLRKqeWptBDL9KaxJZ7EaBwlEH
	nvel7fBlaBbi8jhX3t3JPGpdZ2/JWB7FiNQHX/dru4O+kuRYUp8E/00i+NpL1yDk
	p5lOReIsheP0BPveaff9CQyU3Noof+MNQ6pmpuAGu6JsOj1JQ3z2WAMmVBkemyYP
	vV5LXSvDB2eg2jvIoAx2wkrgSXPLtKcGzse9Bks9iPCqlZKLEw0OhBEijK5fBbyc
	mRwVcA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y1h27e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:38:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297fbfb4e53so10430145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699136; x=1763303936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITVJjoF8oZpX6CH3gig4SV3VeFTPVCOpuJTI/Zh540c=;
        b=HryhibjagT1yEGY1GYOQRaVAOLP/kN5CGH9lVUPFLluFWmZcbnvlztA4fLrIAm5QtJ
         4rdCaYmnYpszxR6AeqnCeID+kgyUGE4HFp9qMM0HLgVaO3At1YU/cko2xmahb0Uqnia4
         kmv6RXLG0ejAzCxg2CdQCXAeJtdH2BbXaw1kynfyv8GR6eBoUlGSm/+uqjq5Gkj3fJfq
         gbXTk6+3sBlh7Rm7P9gck3l7xHonl5LZuij4QHPsZJmJCcYk4vhFsYMRhiV498mBYf6U
         aQh3VV/Is8FoMF1qZhDb5u0idXtJekkMK2J+1NO46qqx7q1EZfIdTjv4QMlryTzWISVh
         5+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699136; x=1763303936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ITVJjoF8oZpX6CH3gig4SV3VeFTPVCOpuJTI/Zh540c=;
        b=Ir6+hOFS5d+lHWYhLqadHPRe+GVlULZiVyVlB8+QJuAfq8cwiAvlIdrpDgDkwzVYwy
         j9RHV8czlTsaSdA7hP3MLmiTorMFV7K4l9KO3Cw/OP1oMFxA2w5C+ZyXluCTsOmZG9Bd
         vd9MbcddiK/qx+/YNddNcb8Bcm2x2S2guOp+3bXM72QxfUq6gTgiEolMEN2IhCkEiJGb
         0gVUAOnrrfGN4VZN0GuhIH9FOZdF363ZW0JjPtJMjtM+712iSD6GsRnhCM8U9R8fsZeX
         lPlEDP/cWWjNG8gpylfOWh+8Ht6w9oV/14+SniRjlZwIsFAwM0FzLpUFT2+PKHc35gkj
         xz1A==
X-Forwarded-Encrypted: i=1; AJvYcCUOzfq74nifbArkdfqclRNRTPEwL3CGRmdMrPt8be/9nV6DlKC7dSL15dqwhzvLwtdt4Gk+MKrXF/Z8pj4TUVv6@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq9U2vLYdH4cN1amRkwLN89rOUfLPbOBqscqqgf7BaWLHXy8K0
	yOXkOJcfJDoGm7091A33k4NhTew1vMb0fxmuCFzeS5uB+X6nz37kbHHLUnxBxT+L09ZZdLQ6GiQ
	Gb1Hb59o9sIrkaBsxOpwUcaBIRhNuIElKjyj4f+tRsc6Tw7/J/yE758N0ph+NV47BXqkkLv5e+h
	lqUg==
X-Gm-Gg: ASbGncsZ/oX8u7zCmO4fa1zsF6Ys2g5UfDhZcSreb3X1a5l7uNWlm5ZxekGIeCE3ful
	G8tyHjwhN4TZ/K/Rw5kNDj/Emg4TcnnurgjV4fnKYKN1DP4Q4+AtIXbdyh+tThrBSrzaupO5/9g
	uvNmYtTV09GJVBHumBeYB0nf2aIjXQGPKF5VRhUyj7NR0BiaP2J4roTBlCh5RAwXQlk3d2qw89O
	SPh5+tSfwCaX7Brz/XQqtRVWuooQ2hXeF1rO6eHo+xKx6eXf0xqVZR1KN+iNSezGE6LKQK5zrOh
	ainNYR0Tek1tFN9OZ4N1VLiwOi8BiUG0elcvn9+xnlVRb1XwlEsglW1ajcTeVxEBX+GAGz36Dbm
	sxB5XAF0R529YvF6JTMQst+VoqIsWJ+e9Ivc=
X-Received: by 2002:a17:902:dace:b0:276:d3e:6844 with SMTP id d9443c01a7336-297e56d88bdmr63591275ad.33.1762699136471;
        Sun, 09 Nov 2025 06:38:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3UK3IxssuAt8f6Uf5qJF5IzeFnxGusDT91RpZ+I9igX3d1o15ZrL5lOOJz8dXAPHVZHqHFA==
X-Received: by 2002:a17:902:dace:b0:276:d3e:6844 with SMTP id d9443c01a7336-297e56d88bdmr63591025ad.33.1762699135919;
        Sun, 09 Nov 2025 06:38:55 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:38:55 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:19 +0530
Subject: [PATCH v17 06/12] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-6-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
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
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=2577;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=NXUaK0H1266YWuSrue+BtWJ+iZQFKGg3Cd3Y8xvw8yY=;
 b=IBO1GIE/u618IwCGMuCa43qSii19KTQHEGwFzpPwYdrhllUCpnl1RodmdS6Jqito7Taa7pZ2j
 zMh4i8pdHxiACinhu7JfTus6mkQ6xs8ZVE6UrCP7Mrbw3Zehfpdh1i/
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: uKFKZcdmzFEX48Q4cd5FURBAgIWXo2lE
X-Proofpoint-GUID: uKFKZcdmzFEX48Q4cd5FURBAgIWXo2lE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX7BGVRculaWuW
 ooW+TIyApnhNm0u52Ok1mx1jW6AnoxWs8FG1+KRrBmhpufVxI5xdhEAna8LImyfZC1V9c54AzNn
 +sHoCNGoylLfIBfu8nXaw5oEwS4GEsGyokkqBQEIFHCTXRiOwJid4rzTwawkPhm76XJWxSj1ihI
 bI5ZdxnGEj+NvjQ1tMihbxYM8K0acXPT2BUxO6o64Is3KfppLMEciInDtSwZjJ8dcxX5UOPmCK8
 nvjxYhK1CdNN2tVwNSCnPvgC/C9I/6JQkEPrGlHUHQsyQxW9ezUlGtGRP+91Hz3L2dePdJWBhvS
 895ekUNU7vZbtSOhtpIpSUqU4rqgf8PcFs/lnzTiC+msgqVg0zz5vtsj/zBbcz+4gVAcU0wzttg
 tkE64OfY1oSU93j4b8NM/zAaPkvxeA==
X-Authority-Analysis: v=2.4 cv=Xuj3+FF9 c=1 sm=1 tr=0 ts=6910a781 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063858_161789_AB64D7B1 
X-CRM114-Status: GOOD (  15.78  )
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
index 6e2e0c551841111fbb0aa8c0951dca411b94035c..5d4368d77d07e3340bb380df93aae31df40e2779 100644
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
 
@@ -260,4 +290,17 @@ examples:
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


