Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358F4CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=; b=0+xPl93ecDqHzm4ouvulaJjARj
	hhJwNhOPpyxUmDXcYA7211yW8+I2Akx5Oshi9kAbXdEjlNVHGY71+cdXhnlTuz9nKC3Tfxvxk6JJD
	OoNxd740BeTZNSbu+s41GSNlpJoQzaSRqZ9aMOAeuST19GfO0db2eASClrw8qfnBvHrNyb3E7RKsQ
	Wws94sOjMJfvWjsGFI0YGeq2R8Yuil/aOqZIprt5PyYXwLoL9QGZKqE7ND880s2w+xZ+LLkYLrM1o
	c7sJjkIj8LRqBy96Uggy5WX7nr3S0Xb4wd7g6RGJhdoaMcBvUtWXwgMiyzd7yzBnMgtPbVT6HAser
	ujYIfkiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhuq-00000003eyl-3o0Y;
	Thu, 08 Oct 2026 06:47:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhun-00000003exo-4BYB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:47:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUCq928478
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 06:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=; b=NrF1ZJ6iZNzELCe+
	n3pL0uNC7TTGnVOz3igxCW7SFdPuCn8oSMRtiQVq4biNTBfVfWIuQB9OoErnqsVR
	Z/mKHuc24eAUZLaVoY+FGC2kaDGxHNiuQ4OCpG6SD9eueKBimA+KRXH5NFtuCSvX
	Sh3ItMO7hlu/5bAdlGwsDTvTmjrfvxBLUbaXg/QxX6OTjOOKaVY5w51yJiqnFKfb
	C2fvXRq1DfV458pHcsMh/BMeaIjdjptKmZ/WAgvoyE/Eh4XN43OGZaLD4qJsKd34
	xhMn3650qNKqLqwxs+oeLGUp/ppUWThJgK3nV/IzK5h5b7aAOlB4EnDUf6SbElee
	Ly5qNw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2shf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:47:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab0a814c67so159263a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442061; x=1792046861; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=;
        b=VFdxJfnTek/58Gc9o6aRuS8PEAgUUh5it1sIU4/LBMiKjkJNzE1rgODNb4SmX5mufp
         SEWys9DmGbM5a/OZzSwyyWCRUxSe62NCPrWwBEv4dkxP7eQSBzGJZEITEJOrHAgumnZJ
         i7DUZZMbsjih+OBj5jTzWpRM3Is9omdxcQFzey1MvhzG/Ro1FpkWQMbCdSX2DQ6yF9op
         Qv46vEVSN7JABKmUWGYGyzeE6EQa2F5UDlOLYx4vd6C0JqDPBIE10byhEIN7lLAilNC8
         BJNExDswFcnOwuBoZ/zBLry2Y4gKli0SJfMMjiMEXH6hkb34h41Daw50PQopKmoAJ79i
         dZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442061; x=1792046861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71NyeBYDmCqD0chIznv1L3I776+rdWk83Vvezy9W2pk=;
        b=xSsMIg/GB12shtW8Cdnsqfk37U1FDM/2GMyYzwsKXSj0mhoeSw1HIj9LwJMtFu6eMn
         QiE7hQ+4LZLkEHCgKerDcql3JoCu/4fH3Dbnhy4ki7j2pYW6UAom/sRcCw2jFfKKww8B
         B8DQ4YavTL276srKSTMZNKpe3BnDRC/pQBJtlMVEOz1LAJAXUzF6OURjiWejv9b0/gdz
         09WYQOdcRif2QawGtVxeLXSQAdUUCiC5U92hO6khgd5afjqd9D45970D+08wq5RCC9hW
         ramzZ6RZwhg632jxfjRG18w914WL9/XGu78lzr+n8DjnF3puuNECbj22FXWiOHe9Uds/
         CChA==
X-Forwarded-Encrypted: i=1; AKwUvBxjqr1HhxewzkkG+Ioep4lsBqO+smkmi7iB4R03+gtucELeX7Wbuz6zP99lEnqAqe1nq/waxiYRh+BBMutz0yxe@lists.infradead.org
X-Gm-Message-State: AFq9FYJzvALm+F98OvJWWZ8ZJzdhnKq3E6Yh2Hzt7VZgZ4+aRgM3S098
	9R2eeYjW8nm9VWBglb0O1/vY1BGJlGEKkIrKv5K/K3YBm08fPA0Fup/QbOiRF3gxzwUH9YyuA3v
	WZa2kkTo9CpKqmYHVPMl7EfyT6LOIFtyyitvqtgWr2eVVeQF56qzzqNQPbdw6AJll1vlLmnxRaW
	xVmg==
X-Gm-Gg: AYBFou2HlS6oGmKlL6ePf6ivPqjkSDredOftqL8JjjZgF8dOWepQNINb47PVfqWJhyV
	0rMj//X4yYwO59LPXiMft3N2OGLplg3JDxsQHSH6XLFqLHU/nzOoszE+lTbwbaa7IRSvsA+GLFZ
	r7/8mTOaTxl8VnBMtE5bAJCz065iODo/ffYA6DLjYZQXLjN2AYz71/azloEjmuhvK/cSwIF57uW
	djTYarM5uha2fWI0ghC+x2fSegjF2V/UaI2GqLpRzGyQ9uQSmGjU3sKyNXJsL77dRC0ze67k261
	Tb3MgpjDhbME0mLwrKrwxQaSr0sYECrmYbg0UkfN7MgTHt7BjJqmFbt3dypjK8iXvgkpMEEomA9
	YDsscv4DtPkWZC4Ktvvg9TnYOvhDgMpGrAnqcXQ2qj7FRH1VTb1svAPE=
X-Received: by 2002:a17:90b:2804:b0:3a7:eb0:119e with SMTP id 98e67ed59e1d1-3a8a19270c5mr3450677a91.21.1791442060741;
        Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a7:eb0:119e with SMTP id 98e67ed59e1d1-3a8a19270c5mr3450658a91.21.1791442060236;
        Wed, 07 Oct 2026 23:47:40 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:39 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:12 +0800
Subject: [PATCH v3 3/8] dt-bindings: arm: Add MPAM MSC binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-3-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442022; l=7058;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=VRx8aZC4+R/lliq1ecNgi7KxlRqXWCW+Hr/b1wE9+y4=;
 b=Mp0GCgrijdwOmFrCyPUiLdPtAuQDzMPXaDHW9ovkFNm/ztl2jH1wiOts3kOy//givHCEej4ow
 MjqX6aZEUHbDubSsRQvpbaHHPZ4REz9iB7HhWVRY/7qezHXcBgEaU4w
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX5fWATgAG2bLJ
 wdxc2rmvPGzsgloP8TAEgcBGtO+fmzJ8+Z0TANcdVgkl7a6jvEq6hmXR6VAtaTpBIQ2zMnZLjmu
 kqC2ph0t+r3nkM/SIg/dAR8YmCdBpQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX9yYZZsZdyq15
 RjrB8Y85HnAGvMZFJiIkkZYFBOUcO1W/ayrLrdBRYS8SFzRI7YoA2eXTAP7cSRZ4BLDO2R01qwf
 ONo9IBSnsseLocOPC3YcflmkybotYSMyY5n8OU24MAJ/UHS0my43F4+ymJmxGFpw/QivTpk2Z4x
 hxK+vfrA0PH1wp67nxBk7TvhiArpUh8BsyD62ywN3QnEaBcdA15nEaIHZlcIk3i8/wwB4ZMpRHr
 0XVKaPMWMn0i3RgQldXy6h6VzO2aNLSBTOSyJ0jvdAPiMoSDdW3/8y3vbyN+elPI+nCu5VZAzZP
 s3NEgpu1mtLH2ECG6XwQpJ+pq5v6MMUw3KEZMbT5euQ5JBt4zHjbBzw2afTiKUC9RvlByUTpx7+
 6HGUvzpf1NYLL54CYy4bK8HB211YuhM+IK3P9iBlG0RmM4AswE2B2ucZjTTI2JY5TZby5Zb+bSE
 zGOoU2/9WcdfxcuRXkw==
X-Proofpoint-ORIG-GUID: pY2DXST7CAV9qoNPD-MM9lK7CvtsR2MP
X-Proofpoint-GUID: pY2DXST7CAV9qoNPD-MM9lK7CvtsR2MP
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73c8d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=FqHZ4tX-ONj_CKorFbsA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234742_054186_A70860FD 
X-CRM114-Status: GOOD (  21.63  )
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

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will be a
sub-block of something else such as a memory controller, cache controller,
or IOMMU. However, it's certainly possible a design does not have that
association or has a mixture of both, so the binding illustrates how we can
support that with RIS child nodes.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
  standalone arm,mpam-msc and the two-item combination; fix schema field
  order, type constraints and yamllint spacing; fix example reg addresses,
  add arm,mpam-device phandle and remove TODO comment ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 202 +++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..3c7b13a23ff2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,202 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    oneOf:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: error (optional)
+      - description: overflow (optional, only for monitoring)
+
+  interrupt-names:
+    oneOf:
+      - items:
+          - enum: [error, overflow]
+      - items:
+          - const: error
+          - const: overflow
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+  numa-node-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: NUMA node identifier for the memory resource this MSC controls.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^ris@[0-9a-f]+$':
+    type: object
+    additionalProperties: false
+    description:
+      RIS nodes for each resource instance in an MSC. These nodes are required
+      for each resource instance implementing known MPAM controls
+
+    properties:
+      compatible:
+        enum:
+          - arm,mpam-cache
+          # Memory bandwidth
+          - arm,mpam-memory
+
+      reg:
+        minimum: 0
+        maximum: 0xf
+
+      cpus:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          Phandle(s) to the CPU node(s) this RIS belongs to. By default, the
+          parent device's affinity is used.
+
+      arm,mpam-device:
+        $ref: /schemas/types.yaml#/definitions/phandle
+        description:
+          By default, the MPAM enabled device associated with a RIS is the MSC's
+          parent node. It is possible for each RIS to be associated with
+          different devices in which case 'arm,mpam-device' should be used.
+
+    required:
+      - compatible
+      - reg
+
+required:
+  - compatible
+  - reg
+
+dependencies:
+  interrupts: [interrupt-names]
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+
+        ranges = <0x0 0x30000000 0x800000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x10000 0x2000>;
+            interrupts = <1>, <2>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+    mem: memory-controller@20000 {
+        compatible = "foo,a-memory-controller";
+        reg = <0x20000 0x1000>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        msc@21000 {
+            compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+            reg = <0x21000 0x1000>;
+            interrupts = <3>;
+            interrupt-names = "error";
+            arm,not-ready-us = <1>;
+            numa-node-id = <1>;
+        };
+    };
+
+    iommu@40000 {
+        reg = <0x40000 0x1000>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@41000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x41000 0x1000>;
+            interrupts = <5>, <6>;
+            interrupt-names = "error", "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@2 {
+                compatible = "arm,mpam-cache";
+                reg = <2>;
+                arm,mpam-device = <&L3>;
+            };
+        };
+    };
+
+    msc@80000 {
+        compatible = "foo,a-standalone-msc";
+        reg = <0x80000 0x1000>;
+
+        clocks = <&clks 123>;
+
+        ranges;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@10000 {
+            compatible = "arm,mpam-msc";
+            reg = <0x10000 0x2000>;
+            interrupts = <7>;
+            interrupt-names = "overflow";
+            arm,not-ready-us = <1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ris@0 {
+                compatible = "arm,mpam-cache";
+                reg = <0>;
+                arm,mpam-device = <&L2_0>;
+            };
+
+            ris@1 {
+                compatible = "arm,mpam-memory";
+                reg = <1>;
+                arm,mpam-device = <&mem>;
+            };
+        };
+    };
+
+...

-- 
2.34.1


