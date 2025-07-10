Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA505C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bm688pDoN1t58GLFHGhBI++/OTcmZdbP8x57uiG6loQ=; b=XDCZNdJ4/uRiW/nArK+krW1bF6
	gPsM5pV73jAMQ4CFS9y6Wftwe9inq7vJIBVog3hpMMdAX1D3f3zfVSDcdNAOUsLu2Htr3WG/yV/yp
	7fQFb0Z/MxsAb8UO1OZGH5Gy/JS69rQZVQHBEeoO4cG6tf8L6vLLTfucYw2HM4mDhl+eFqBkfr0tR
	O9NtMeOFkemqltW4IzeK/RNddthYJyWJIoHU1o2VaRRZH8sglLHfqDBsE/o/Vqzc66hIsatwa+inZ
	ym90HtmLhjsZ5prYktIZ8oBpzaHJbvXX9P5z/hKlb1HlrO/E2NskKEizIQFSOqpfJ0GVDSp1WA2Lc
	ByOXA5/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoT8-0000000BTX3-42N8;
	Thu, 10 Jul 2025 10:25:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnP3-0000000BJcY-01Pp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:17:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A97Cm9012565
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bm688pDoN1t58GLFHGhBI++/OTcmZdbP8x57uiG6loQ=; b=ni2uPbDRJeSqMnI1
	f5s4NXc92iTmeb4IiqlqTefRpdkV3ssbPXnkVqXkAAld3lrVzQD1hX4klx2Ooj8f
	89z5aHK6uVOdc3rE0936FhwbP75pr+yoDnkQdLYtqtjf4Sar4xpk3loikBcq+FMK
	Cjch2UovUfMG/CMATQlqe6GOo0ToMf/kqj++zc3uQ9+bzXtydsNwW5n4FVoD+5Bq
	fMfP7H12VkLkSD+aKEin91RVxLZIxvtZJiQJhrbRpFyboJbPSLnEmtbxNQRf+A5C
	+IESMd4WSO4/mANV5+oUz50rfb1+fMNHA+wdy+B2XuxNBwCqx4L1RpgEaUTPS/Q8
	vnPlQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn7vmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:17:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369261224bso9183805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139035; x=1752743835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bm688pDoN1t58GLFHGhBI++/OTcmZdbP8x57uiG6loQ=;
        b=FYwxGGBBENyDfqRrrbblifNK0hX+9dXO8vEsVuG5aiLQ9ma9KoeMEn2DJEL8bQzdsd
         W8ztvKy2Xh6azIIHV+dEGoMYHWHV0xxGbZw1/GL/NoAesnjADaqepYxLWMTYe2Y8zaDj
         B32oTFO+fOfzNJGf9in7TDXdyHxWnVN54NW1A7vlSnCHQEhs3bplBsBKWHebAcMOmpL/
         rpWg5T8Q5YMHAHy6xgyjZiTm/3i0AzeiIbmBBPlARAmYzU2B7lL4cipXXqyxbbGSyWdY
         SR/nqGKyD6CEUe1JMthljPogsATCP3/3CISYc7OLhUevfP2UyjWHkOczGSbuhL3rAzhO
         07qw==
X-Forwarded-Encrypted: i=1; AJvYcCXmuxMZxxVuY00X75UF9CCAHWh+Es8k9FyYo+6S0PWWY++N/4Pm2iJ1fs6NeQn3m9BHUZTWkhmBXGHFNJGR28/w@lists.infradead.org
X-Gm-Message-State: AOJu0YzHzT1ZcZukdkX8Tg7PK31Y5nYQCIvwXDTMRB5poQnBwnAfujH6
	bbnu0XMnVq4K4TpJoMKW186oLptwRroJrH/x/+wcVxTmSFK9pllNWTmN/LDNPpSJOSp+3yp9vzB
	L1CisGVGw2InIqNZs6UO8Pj6mIrAcmxOGbg2YB2P1h8QpOhiHLVbzEHnDwULgh0dU2xzYQwGeWR
	wcPA==
X-Gm-Gg: ASbGnctGT6Z8SozbiAMeJlIpucTVb6IDegYpyqT8Z1Qh9L07n5L9OGlj8Kn4lBa5CxG
	fUbmtXHaD7W3naQ2Uwg5BG1hyzyk5kYGob5l5zK7YPNAP5SflRXtQMHqxA1KdI1L8CPQiQ5Ajgx
	BkCzleIvOt+drKV7zZrbZfrV6Wr6eiF7HacU2JfySJnFde/ukLQHq9/lgrn2xt5RJwO/OhvzHdo
	lNMCgEedVq29LQw1bWxxbAAqZv2HdDkbqJYs96MsSzANYUNBRh/tTWDkcy0uLtcGJsf7X6LmTLU
	H//eN2oakLNFjXqvnaqo7PR6PuiApJRaAjPeKfH0DT83dxPwE1dvmdxF1zs=
X-Received: by 2002:a17:902:cec2:b0:235:1706:1ff6 with SMTP id d9443c01a7336-23de46edf4bmr28705085ad.0.1752139034608;
        Thu, 10 Jul 2025 02:17:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwquEcV/DEQgNHo5i5rKIMG5wYJOS8HD0ETiQ+J8XjUT4+2RRoWOqCstZDWnrO0s1dBiyXug==
X-Received: by 2002:a17:902:cec2:b0:235:1706:1ff6 with SMTP id d9443c01a7336-23de46edf4bmr28704665ad.0.1752139034147;
        Thu, 10 Jul 2025 02:17:14 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:17:13 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:46 +0530
Subject: [PATCH v10 04/10] dt-bindings: arm: Document reboot mode magic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-4-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=2500;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=LJQmaaDtgt8TROVTUTsTmEnpeK2uj+7rigIrzNpy/l4=;
 b=iy9PU4ZJOiTEn2epqZUOkW8+Xr7tjFQnf02iWN5UFpijHHJzDb+DQE9zwiCZcqY66/IiKYTBH
 Qa8lCfgZ15ZBxIImBn1nkijQHRDyoW0jh2GQrhRaXOvI4e1VEJRpOEa
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686f851c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=UInjrUrXc7y1C1sAkbYA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 1PuChaEDh9pjad02B0qf1_KM9zqeWjnr
X-Proofpoint-ORIG-GUID: 1PuChaEDh9pjad02B0qf1_KM9zqeWjnr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX9qpGZ5wOSfIa
 f+Uq4tUc6fXN+CxPePjHrcuXbZR1tAQFqajhAU+k8DRiA0HAU6lkO9FH/HHmaVdtwy68Ii69yJ7
 dwnzO9ZkNCRf/hSyVkgxymWQeELabhU/nkGte5uVU+DVGS+0PMzZK+EVA3vN8BAYtIZJROMiubg
 EDNvpwu3Wkf8y0IrJMdOv0eHJzOD59LRQLEZKKlNkHsbuqmNAEE/FUG8s4HU9LEJ+wpW65n0uR7
 Mrn5ECS+na1xGTFiMztQ9EaxGN/LlI03RHapgxcSOqZpyu6jPFe7h4JqdMqMRxxyaIEdP1lkrMN
 R3/kTOFoLgY3PyMxRafLfirITHi1aS34lemPsLZHEWd+c7RXcSWHZznQ6RD27c16OC3TNd8mYcZ
 0CJJSj6d44nBGd/yalm5Iea5wzoz31JHMKVSCukTnlgaoWjSmpxp330tTvRNzzWLm7+mBnSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021717_165493_A3C354F0 
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
 Documentation/devicetree/bindings/arm/psci.yaml | 41 +++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/psci.yaml b/Documentation/devicetree/bindings/arm/psci.yaml
index 7360a2849b5bd1e4cbadac533c1a7228573288d4..672fc28f69ed7cfed4baf8c2185e0cd7b2024376 100644
--- a/Documentation/devicetree/bindings/arm/psci.yaml
+++ b/Documentation/devicetree/bindings/arm/psci.yaml
@@ -98,6 +98,25 @@ properties:
       [1] Kernel documentation - ARM idle states bindings
         Documentation/devicetree/bindings/cpu/idle-states.yaml
 
+  reset-types:
+    type: object
+    $ref: /schemas/power/reset/reboot-mode.yaml#
+    unevaluatedProperties: false
+    properties:
+      # "mode-normal" is just SYSTEM_RESET
+      mode-normal: false
+    patternProperties:
+      "^mode-.*$":
+        minItems: 2
+        description: |
+          Describes a vendor-specific reset type. The string after "mode-"
+          maps a reboot mode to the parameters in the PSCI SYSTEM_RESET2 call.
+
+          Parameters are named mode-xxx = <type[, cookie]>, where xxx
+          is the name of the magic reboot mode, type is the lower 31 bits
+          of the reset_type. Both reset_type and cookie must be specified.
+          The 31st bit (vendor-resets) will be implicitly set by the driver.
+
 patternProperties:
   "^power-domain-":
     $ref: /schemas/power/power-domain.yaml#
@@ -137,6 +156,15 @@ allOf:
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
 
@@ -261,4 +289,17 @@ examples:
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
+      reset-types {
+        mode-edl = <0 0>;
+        mode-bootloader = <1 2>;
+      };
+    };
 ...

-- 
2.34.1


