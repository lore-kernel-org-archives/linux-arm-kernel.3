Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CA7D68BED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkTiNz3pyA9itoti44UzYuHhlxPS+xvrEI3POr+5XlQ=; b=e0uYIOHxybyFt5LpUs02yd/1wA
	HECkezIb/Z76qovu06nWrNnOOCV39QNG1jNyTlg+N+hYyZsXlLBVSgcrVim7eeSWGcIv4jr1qlRai
	SdSnCyz0ntmVIUo0F6yeQ1ogD8+5s1IXIrJNOERynFR0nxfF2mbQP4Fcw8EF5ztg2mwGk6wwSDcef
	za4ztO8Fkmj2N54cGnJ8+K+oXRRIWu4kpHEMZ5dwSYuOhYT7tpYYorLLhu7MZ57swOBhLxcGght3m
	efEHkE9vUj9S/b5MZDS7ubhRXksdUmVKvj3l+fasazZpgVuecAOwEz1svfNKGmEG81/RGt3LOXWRn
	arekt1nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW964-000000080ps-3LxB;
	Thu, 18 Dec 2025 08:10:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW95w-000000080ls-40Ew
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:47 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI3apps754967
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZkTiNz3pyA9itoti44UzYuHhlxPS+xvrEI3POr+5XlQ=; b=jpWH7FEkZBBKoSVU
	rfj6cF9mfGDEP4D4j92omH7mz4SN688Vi+LkzPALhwHqiLIrnMpFZtMpM6loJogb
	52g6n+J1ZRuvsbO7d6/NNPqBjybATO5A4EqLq1+aYZNq4mHkNXmaMq+l/CX1XEXo
	hZ16pvxBOrHtfBajbBG2GMhgtFNkJ4BQj2k4pzqMzpviAePxv5i8tN4ZKQj/jCVk
	0QLwHRJWjSF078F7WLMG7siFhqKqzgVX2p3OQfAXdTm+Ztn+sL9FgaKAmeeM9XrI
	I6Fd6oOrK1vduAiPPBtIdOrEgj/1Y2kQN1yXupyFqki6/+8QK/rIq1xfo/jqEdo+
	ai+MIg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0rpn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:42 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-bc240cdb249so401541a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045442; x=1766650242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZkTiNz3pyA9itoti44UzYuHhlxPS+xvrEI3POr+5XlQ=;
        b=DR4zDMjEPvfDu2sWdLi4huNooSv3d2JjQxKJp+YuB3iYpbbBsoOuWgkFFh6Z0Rill9
         E+MEO6S87HGm9l4TA+DLkmwd7Oz0lTvB0DLhVqjjBONoFDoZuskAi/Cor351Zgiz/nJO
         VFgvlaCbdT9XHVKibXSRAb05A8yUrV81o3fliZM0R86MT4pdSgDC+oo0Ftg+HZAmchnX
         AB7l6XGBc5/VUkNcBURgBRotF05UAfYr7pwTGdZ/QEg0KiZn5PtULXnfSJT0Tukv8ulB
         HzperkTvdexiFBlsy0GwoM9/6fjkrbTQKW29MmBf3E8Z4rhev3j0m2iFWPA9mPw4dHRW
         JI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045442; x=1766650242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZkTiNz3pyA9itoti44UzYuHhlxPS+xvrEI3POr+5XlQ=;
        b=XRpdYF//+bHJzgWqVleVnTZnqSI//9vX+JWbc3iY8LkzdKXYdKzpJCZOitruKSUqzu
         Fj9wO8ysTHo2uVqOMaaMnlMdYtdGs1K3N72mm24LmLWSdGqh97JKm0P/YKHzMRT0eTBe
         TftIF/GtVTE64+ogBuGs3Yk8rGQvb7Qy0oLxIqkPZOsYCzK8rhl94w4wd0k1ig6vvnP9
         +Dj5owiMNcDXkEN79u8Zj82GHW/FfZi9pwr7OJ1vnbmHw5UiAReIjrvX30vGVJAT2M/i
         2gyTWgiAPXPwDwvRl3m5CfD0F54qh5R5I9ghLrm12W1IN/zLnitfhFF7xCcEXXL/ViDF
         Ikgg==
X-Forwarded-Encrypted: i=1; AJvYcCUnAFYfUUdOecFE2I34grLwkRuh5ZFm2yEKq/QizqcqDosgAw7dW4AKhTlVmIDjFVrMTXY7tfjqaol8Cq931XHQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyiXPyLSmODsrH7rrmGc1aigzRogB4Km0FUZmapufwXBHcNmAqe
	AEUM+fw7x2JQQqGzjT2MvYUGicJq45aJMLJCMmU/fqf2FQO9PLiUraPmvBDzxLgL7NTI/fwAvi8
	0niuu7TSUb1CC/zDl8RCPCYB33LhOYdjfG73XnG0P9Y4TzMCac8uizY+625h8qK71gPrTI1YVV3
	jQtQ==
X-Gm-Gg: AY/fxX7EqiMkTKuJJWQpWWogrqU/x7IixKXTBW+CnZGPmeKL6LwD098AIqkjDr0bacT
	JTaD1ysNczZhQW3iPo9cnoExC4Xp55zbZs5Mpb3sjLYU+4Lx/nGfAk0L7qgmlZkurcfyI+nu+gh
	LXTn4PSUAnXB47dJL+xh6pdcPJwKeq5XMIei8r9G4RsUjpzvUsvdO9M5+jlcA+XIpxpvST7hbjO
	scACRtiHe3wDEdNtz6Shpd6+NRmy4DOUN2YyOZoP7siG1hdx6G6miSnB0yzlB6RDSNzSdBBiiCB
	pkj4jfzAruvRHy9BGySI0YzY/AWVcu8r6GhhDKjCdKu+6qZll9kWILXephSAPPh1iQZgRCO2GFy
	a+apzTYOAuKUSAv/AXmpTf7sRnEx2/3bNv8i3PfsrcKr6v0Ydf5cz32wNbe7LXzDXpWI=
X-Received: by 2002:a05:693c:40d0:b0:2a4:4884:e03d with SMTP id 5a478bee46e88-2ac301fad99mr12556623eec.11.1766045441869;
        Thu, 18 Dec 2025 00:10:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaDc+tdn8dz/1azt+99U8sha2Qy8hrm5AGs8FFige9H3qCjFhCgiFTf9zVCb1j5rvBRmpiLQ==
X-Received: by 2002:a05:693c:40d0:b0:2a4:4884:e03d with SMTP id 5a478bee46e88-2ac301fad99mr12556586eec.11.1766045441272;
        Thu, 18 Dec 2025 00:10:41 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:40 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:41 -0800
Subject: [PATCH v2 01/12] dt-bindings: arm: coresight: Add
 'qcom,cpu-bound-components' property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-1-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=3052;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=+Jqa7JFXnLG9afqUMCpYAS5qCe7jJ7CCqJKnko2EM/E=;
 b=QxzfOTMXLpA75RWYYuwBvLFwkh6xifOv2aAmFGxZ7X3aUgF6UJGRlSWV7WZkOOqFEveY2HRNN
 BZgiyJ9fG8+Bh902i2nsoVUOu33jThGzWU31j9n/CWl/Di2RwU1Bm8E
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: pYyem3OUgx-M5QEI2KOOAMZq4t8P2sbG
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=6943b703 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zthVEJJq2wqy0CFkTqIA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: pYyem3OUgx-M5QEI2KOOAMZq4t8P2sbG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NSBTYWx0ZWRfX6AaGh4KNqw6i
 jTmETj3NKoDfuFSG/BUGmQX4l8zLhEH99qZbcBVYx4l52iQte3YDMyY3tpZ5OzON5oD4ltHF5+y
 d6DjGNZXRSNw8mP8BY5Q5wILvmb9LYFhI79wkh2TUXjUOyGMVySUUqYXImO/xZ8kk4fvXB/abMO
 oNvxxmxOR0Foqxa/gU8ql8hryNOiHAq05TSuNz8Fpj/sIS/CgcbJ3XKbaTVpqcuxhMyxnvHPlHp
 gjb5QeMTT2T5lOJftnofvPNU1End6KH+ybTiduImzwhe/AIBIcf1FBYFDsU0vIZSmBWxxhpzwRn
 5p6MyB7aZjlDM63zKKzoUcGf1PWBXdToJETv4ncA4PndbmbWiX1AKdwdvALZ/8ptXNBuJhPt9Bb
 R845NA3yAzn6POYh8ZV8OgXzTd5Y9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001045_120866_705EDF77 
X-CRM114-Status: GOOD (  12.84  )
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

Introduce the `qcom,cpu-bound-components` boolean property for CoreSight
components (TMC, Funnel, and Replicator).

This property indicates that the component is physically located within a
CPU cluster power domain. Such components share the power state of the
cluster and may require special handling (e.g., cross-CPU register
access) compared to system-wide components.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml        | 5 +++++
 .../devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml    | 5 +++++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml         | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8af2226b817f6af5f533b1bfc74736..a4c7333e8359da9035a9fed999ec99159e00a1d9 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -57,6 +57,11 @@ properties:
   power-domains:
     maxItems: 1
 
+  qcom,cpu-bound-components:
+    type: boolean
+    description:
+      Indicates whether the funnel is located physically within cpu cluster.
+
   label:
     description:
       Description of a coresight device.
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index 17ea936b796fd42bb885e539201276a11e91028c..2c6e78f02ed84d95bb4366e4c4bbd1b3953efa32 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -67,6 +67,11 @@ properties:
       Indicates that the replicator will lose register context when AMBA clock
       is removed which is observed in some replicator designs.
 
+  qcom,cpu-bound-components:
+    type: boolean
+    description:
+      Indicates whether the replicator is located physically within cpu cluster.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a39138df9adde0c9c9a6f5583d9da..8c4f2244a5c74dc8654892305025a4e6bccbce07 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -86,6 +86,11 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     maximum: 15
 
+  qcom,cpu-bound-components:
+    type: boolean
+    description:
+      indicates whether the TMC-ETF is located physically within cpu cluster.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.34.1


