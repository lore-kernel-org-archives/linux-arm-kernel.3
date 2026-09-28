Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CD1C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y/CZep6ohxgA4WGMpffaOg6jtKktfc2ERETEgC6f1UA=; b=jp9W5nTwtZe+pwf/YPpm4prWZ7
	x+qrsCrRi/uv43n8LPT9Lmsns+mBnWKIcpR1MZhIxPSUd31lnrKdT7yv4SRNyMVhCsBaj4VQ/xnen
	aSmxVejeMuNz+fd6X29vpOYnLvycwjkw22LDLXBSMX2gssavS6jP5yx7OwB+RGW4dcx6dzWmGPTiD
	Bx/fDjEZCeIr7wQ+V09LZ7V2r1uoUhZwONJQEGKCWgmox0YLrDf2MxtV3tR+fTwb2+rnrhDPp4lA8
	d9AJRajCFsum/+KadDHIr10HiHEMZfi0vKglxDVhsVsdfL1BHaYPtSN0kee12ZWa9O0GgY0tTwbFn
	LHJNUciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4ZM-0000000HQBr-0q3A;
	Mon, 28 Sep 2026 06:10:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4ZG-0000000HQ8s-2if3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:10:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5P6DD675163
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/CZep6ohxgA4WGMpffaOg6jtKktfc2ERETEgC6f1UA=; b=EhrrnYuXXGQSe2j5
	ZBmFs6ajGq2VD1QuqCFPMgBGBsRoagRPlPtUAXxu3JliojS/AedzfixtldV4Azor
	RqkVenio3PDtmQf/A6nrgwIB2WUqVIxOslanNkbOZAuMQCxd+2Yf03XJKkqJuFm0
	ADQyM4eHLa7w20xQFNWo8h27Q3tEmBNtCOkWQXU6PG3eRIlbqF3wTTAfUuvuwljT
	Fdoq13YCjDhYoOPX9Q0W4qRZC8PeQ7+gF203bDwZd6D6EtVqZ4HnM6uNcHwolyBT
	kE0zzfbmqi3vHg/SkfXO75AzzsruuhjLYodMbZzcE04i5UP/dLhy09DOawnjEIV1
	lBjOug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s04hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:10:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso4056722a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575825; x=1791180625; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/CZep6ohxgA4WGMpffaOg6jtKktfc2ERETEgC6f1UA=;
        b=IVUMA01RYqkJ2pHa+8uoDcFOrTAmpHidhR3PxI0d3i8S+wORmnkYDT83ZB+VBWqIVw
         AKdiaglF5xaorT8qOcKHON5y6pGxKSPSQ4JZEymDL5H6oZKQSRavooAA5knM8ZcL6ZBd
         BjD0CdqMR3D6U8fc/smh86Z4G34VOUejXtKUwvzQt+8RhU1w/I4n8rd0LPBWs/StlO8w
         o006rHwQU1BTy1gTqnARFfC8gxOjgOBsOktWXIO01LlnechMToZ6i0adBNcZQIiX3CHT
         DnlW10ZOEKIPJgnz2dpWjrIwNTzOJYFEW1RG4ugzXzS53+oTCuS/qcfFwEgvX9fZmWij
         wglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575825; x=1791180625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/CZep6ohxgA4WGMpffaOg6jtKktfc2ERETEgC6f1UA=;
        b=GE8RBUHyhpJuLlNwm763EAjLhni6qopZKEDTIxM5lg1BGg+PzTBTh3co+EyLRhev8O
         nq7y8+9txX6ubks2VcIVqMT4iiANZ5/QFN7AEa24NmB19OgY4zK+bLi9Jm/z8AdUqs38
         XzF4PAfgzJgfmJXrsfJxCoUJZ2JHLXqXd351kr74hyS6jhGLwbkt3h7TTTen0jVembU7
         IDsil0xKnv9Ho1GrhYEZa3upecihBxJWFFV+ZgvE4uXP6rCHn6e06f4it+2Yye0oRma2
         JdncBlTQvwfMWW0nN3ZNxYich81p4QwkaPY7fE/g1vWEkmnzjqHTlhhNsbUeoaI2Swfy
         XgiQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5F57tlS6khwu/VVL4exY6QY55FtmafgW3pFrn0dV8xlpWOl7+XNiDiwr1m+z/KzN2uB4dWPohxWSq0ND41dJy@lists.infradead.org
X-Gm-Message-State: AFq9FYKQPRCpFfBsxjAwlKLvZ7DdCr9nXZHcG/uVUaRnzJke3W69ogBq
	2JsOzU8AL7fCmI2KtW5g07ZnuSkUl9JXPYTu4dwHGdwtPOt1OFN2CC7QiW/FFD7Ea2VoSavHGMu
	wloXCkpj/47G3L3PyQ43cN1GXOEBF+i5Pz5d9GfwMse5lXltRd8fGP16fA9k1LI8uu8mY7Q7NgA
	7Sbg==
X-Gm-Gg: AYBFou1j2ssbu1GWwsd9rpocH+PiGp5G/07JNQ5cBwv23H6WhEYLWWLON6qOzMILZp0
	CoroRUQUEcGg57/BlavLetjf6mJ1NAcJ8RZ7hMQYjxcuHbo3Irx17HCxe8yjXF2ecdJKc3dnnEu
	EdiCa+7LkLUokzi0LQwXRExvzlf2BUZSkeomhCZ4qPG8A6g3sAu8COKjaW8NflYax+LgSulYTN0
	SLMkBxTDHOe1hwV1Fu1YjgamsLlwfq51p0/SCbJ56M25FocuvRQzEMcswYg/gCs1AS0QZE2dK9V
	ZdxVzlAJe8iW7pqGfCmK4sPEL0rOSyi0LOGbpNnfBDCQwdfgVsak9x5IOIoSuiaVynDQX+poI9H
	4XhgNpx0+Ng/rZA5eUtF+9X9tyZb991YJX7Ve
X-Received: by 2002:a17:90b:2d8a:b0:3a0:b959:4472 with SMTP id 98e67ed59e1d1-3a0b95947cdmr7634952a91.41.1790575825373;
        Sun, 27 Sep 2026 23:10:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8a:b0:3a0:b959:4472 with SMTP id 98e67ed59e1d1-3a0b95947cdmr7634923a91.41.1790575824896;
        Sun, 27 Sep 2026 23:10:24 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:24 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:17 +0530
Subject: [PATCH v26 05/10] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-5-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=3059;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=X9KZJr7kgVXbU9Bx9ClV9IK6kpd8uGbGeYXDcH/AfOI=;
 b=5901wfsiP2wM4LURUGsDnb2W4ctDY1mmhAlaROpftYaWoGFdJydZj5l5XbdLqRnvkbZJ52h9Y
 kCUyy0nJYo/D3YQUokIA/EkT/qcy51K7GO1xEIEPoTFPL3VGT50qV6r
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfXy1hzGHNok11G
 ZXddB+BXtIixWy8OvRCUGHpOgVMdbL5t6EVIW3w8yZnpqiRWoMThYgYmdFLf4Z+eJPBq/ql5z1N
 bExf07IE1FJJjfeH5mAfdixUIosOOzOpS9WgzNEx8e+CVQgXoNM3FVFN/00KK7I8wlDhF1VVp2I
 yuue0l0nfMHyNMesvTQgpJJT7Y+VL+U07sHuXsrFs0qtsULjYAQgSx3CuOfZwHF5Mzz7+n4YjYE
 y+pTUlEyb0bWCsfsLdJvRPF88P3Um4kjJRuQT/mkOHLqQaHcG/YPWO1iyO8DnwO81L8Enl8yRt1
 DrF8WTuDucCntk9ccVxOsdR0aeDohk/ridqdqHSCT+O7XQoWLi/z7z619pQ3yiG70p+oud9YHWN
 JeUJuQRV7RsC569a1SPxm78DyGrt8cMOCYDKN4wi4tPrJjpbykSDXV8UAQyWbDOULXrmZKcsdLv
 QYAVhUnqg62F/8WwTaA==
X-Proofpoint-ORIG-GUID: _rTmPFZofioSkUNddksEW-BiLks_1XKK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX82m6UtmE25qq
 c0uRkfTZRDAGNwr3NeuFgof1XcJUlp3IMjLF+qSF6YUaVWUS54GVPaQwFCKVxiXbP2G8g76DNQ9
 00GzmFbjgjJKqUAIyevXEmwaOX26OtU=
X-Proofpoint-GUID: _rTmPFZofioSkUNddksEW-BiLks_1XKK
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba04d2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=MLL7hoemGGfarhQ97J0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_231026_727802_E9838C19 
X-CRM114-Status: GOOD (  16.70  )
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
 Documentation/devicetree/bindings/arm/psci.yaml | 56 +++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 0d04389c81fa..82ae25e7a338 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,39 @@ properties:
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
+            minimum: 0x80000000
+          - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
+          - description: arg3 (cookie_lo in 3-cell form)
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
@@ -137,6 +170,15 @@ allOf:
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
 
@@ -260,4 +302,18 @@ examples:
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


