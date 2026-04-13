Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9F9F34C63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rV/MIWTwT48YMZwMmF2Cv5xUqVS1qo4fO7NrYq2vYhI=; b=PVUPQ37wlJYazJA2P/hweAIAo5
	o2pQSz+oPvfb5fSuiL5ox4Y+W3vEulMfeeXFslNF8RQ9saLZAGx0cJEdO2PwEpmLG9Fsxc9KgfteX
	9zKHbL6Bdsdt9VIqDsjkP4Q8WXVtKih7NoxP6o/Dd0/LI4NMQQ7ZA3FUnO7iuEoEwQuus343lScAG
	PehiyY9i3scIlII2Zp0fEO/ZtfFDVmk4QB2C4bhQBcKewFyslK+fE0H/caA3EF224PTSpmuJZF5wZ
	gMcwUdiDlSrBpAJz8ltEHxtJ5bpBvKT5j/REYZ6Pgow7GMC9mdK7TjNEJaNfnMxzn6vXSMsn/NlF0
	mc6gN/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKaa-0000000G5jK-0tgB;
	Mon, 13 Apr 2026 16:56:44 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCKaX-0000000G5ho-0hOq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 16:56:42 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DF4Vk6312862;
	Mon, 13 Apr 2026 09:56:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=rV/MIWTwT48YMZwMmF2Cv5xUq
	VS1qo4fO7NrYq2vYhI=; b=auqwFBAb8YInSVNCIuK+jLNVkxo+EjpGsweqU2CPi
	6wVMde4KGm/Ze9Iy7oUxO3SXrHCGlaSqMG8ZrFHKGro5lsjN59TRPbBMTWSdI2Mv
	xjKui+GaMfInr0CyI1EFSYBuh6d7p+CtlYlYCnvZp5wFyO+IOcCYGy7Bbfq6phNU
	k8yqWThOSKzbt+UCWw0hGnobmqjrmmuHXxcsk4TtMG3hYUSdV03l6HwlX7ePiCjv
	yN1t0+SOH+Q0zGoHtqreq+dC+/L22njNVZFradNG8DA0mGdVtUJhkE0In7EOgzjL
	Zqekh4oLAt/n3ZmMbJC6qbLHratr/oWEDOYF5voa3tOtQ==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4dgaja2k5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Apr 2026 09:56:29 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 13 Apr 2026 09:56:29 -0700
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 13 Apr 2026 09:56:28 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Mon, 13 Apr 2026 09:56:28 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id D47D83F7075;
	Mon, 13 Apr 2026 09:56:25 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: perf: marvell: Add CN20K DDR PMU binding
Date: Mon, 13 Apr 2026 22:26:20 +0530
Message-ID: <20260413165621.10921-2-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260413165621.10921-1-gakula@marvell.com>
References: <20260413165621.10921-1-gakula@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LLxu3ot9QvGzWgNB7Ph-GtrQoGZD2oT0
X-Authority-Analysis: v=2.4 cv=W4YIkxWk c=1 sm=1 tr=0 ts=69dd203d cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=gEfo2CItAAAA:8 a=M5GUcnROAAAA:8
 a=cxBr6QS3EhuSzrwsu80A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE2NiBTYWx0ZWRfX5Q/yJNJB8dYm
 WILQru0fbUve74KIVjxERaHrqdJplvCPoZKAXg6MqhCAv3NP+Mc1IvCLGkcykmnV8qGNuua71hq
 drwwSgTMg7HJC6Rfu5k6oZr/5ZapgNqO9mHez5zL8M7/GY9v8c5TVH91VFhTAJ3aBq+zthOXkNV
 DBxcK9bXAiIKuPzRnWnvZjgXPU7de3PxLg8k+/c+OQrHm3SR+nWNyvidW/Cl8Zo+N9uJi+VtFVg
 hNe0Tlf3Yi3SNEnO4BT2Suuzn/HctCmJXLcSQFtjzhzxhvcMqNXYw2T3nGEB8aMSmA+OhhBSdQA
 3QFJ8XKQeYIlXqOfHCTdM0jzi5sQMKkLFUESdb+B1G6M0DcvPWl+6FsQxpecYH3h2QAoujOfiUG
 Rm69uKJPJxirTmeeTTBkNv/efbdBMlFPThEbGaRXHJzPTSka2Ne62pz9LBVa/4c91oyfWDdXcBy
 92pLiHd1VIr+pVhizuQ==
X-Proofpoint-GUID: LLxu3ot9QvGzWgNB7Ph-GtrQoGZD2oT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_095641_217083_08D0D791 
X-CRM114-Status: GOOD (  12.68  )
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

Marvell CN20K SoCs integrate a DDR Performance Monitoring Unit (PMU)
associated with the DDR controller. The block provides hardware counters
to monitor DDR traffic and performance events and is accessed via a
dedicated MMIO region.

The CN20K DDR PMU is functionally equivalent to the CN10K DDR PMU, with
minor register offset differences.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>
---
 .../bindings/perf/marvell,cn20k-ddr-pmu.yaml  | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/marvell,cn20k-ddr-pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/marvell,cn20k-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/marvell,cn20k-ddr-pmu.yaml
new file mode 100644
index 000000000000..cc6aa760de49
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/marvell,cn20k-ddr-pmu.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/perf/marvell,cn20k-ddr-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Marvell CN20K DDR performance monitor
+
+description:
+  Performance Monitoring Unit (PMU) for the DDR controller
+  in Marvell CN20K SoCs.
+
+maintainers:
+  - Geetha sowjanya <gakula@marvell.com>
+
+properties:
+  compatible:
+    const: marvell,cn20k-ddr-pmu
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ddr-pmu@c200000000 {
+            compatible = "marvell,cn20k-ddr-pmu";
+            reg = <0xc200 0x00000000 0x0 0x100000>;
+        };
+    };
-- 
2.25.1


