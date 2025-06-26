Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA8AC7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 21:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMik+GHj52uoVxxBe7t1QLzP2UFZJzC3gMfHq5L927E=; b=vrtXTjJm/IvGkM/rzEQMrJvCey
	TgnbymQtRhU5mpa9gj6uwkhLWT+td4PDPZFXDmS+oav0+k0OoZugP3FqP1CYdYd2WQLj0EyO5zT2F
	acOyE4KcqHgnGK8eTRhoB2nic0MozjfENYws3GLRe8SdQPJRHwJyUhIfKbcKAQMFjoXJV7yib35Dr
	NiV/smT+ORMpuSH2od1oVUNZS9XA+Xldo3y1cZklTjldowwTjIpM5dYPeK5nZ66mgsbhFCwtyTsej
	2WmpPO03QVwzR30WBgU57g6DB8TKOCB/DXvhBDJ/rdpno+nEocYaNpDMy+Oqak4CZV7uwV2OQL/0j
	QGApVk0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUu4a-0000000Cp6d-2fO6;
	Thu, 26 Jun 2025 21:23:56 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUscR-0000000CeA9-3IYy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 19:50:50 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QGfQPr018806;
	Thu, 26 Jun 2025 21:50:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	NMik+GHj52uoVxxBe7t1QLzP2UFZJzC3gMfHq5L927E=; b=boAc6D7sDxuZgQo2
	kqHvwl2FEnBRRtz8JuPWC0AgNCXs3zC0y/wI2WgkfZcG01K/h6PxX6PuyEu8CwT4
	7E67jltvksEdz2EANewZAZMfXoCN0rYMRfoM5codEvzd9l70QnyIkJpn3URJGvjq
	o12ZPUunLE4AkE4L7B3aOCai5KV2qLLPIke9/v03XdDERJ3YvQKXO0WHKunsV/yu
	PSP2ZGeO/qe6QB+uM+PjTfg3ZoGRIqO4dSWH7jqX1/34PBJN2D0M7MhwsUjrLcMN
	A17UERgLzQTQTJnfr2J3GZiFSvjVEXrLEzFCztps9/2a1IsjUGgAjHjEg8Zvzz4R
	/fBSSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5p16jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 21:50:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8A66840046;
	Thu, 26 Jun 2025 21:49:32 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A7119BD23A3;
	Thu, 26 Jun 2025 21:48:44 +0200 (CEST)
Received: from localhost (10.252.1.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 21:48:43 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Thu, 26 Jun 2025 21:48:34 +0200
Subject: [PATCH RFC 1/2] dt-bindings: memory: add jedec,ddr[3-4]-channel
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250626-ddr-bindings-v1-1-cae30933c54c@foss.st.com>
References: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
In-Reply-To: <20250626-ddr-bindings-v1-0-cae30933c54c@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.1.90]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_125048_113652_EFBE3A11 
X-CRM114-Status: GOOD (  13.89  )
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

Introduce as per jdec,lpddrX-channel binding, jdec,ddr[3-4]-channel
binding.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 .../memory-controllers/ddr/jedec,ddr-channel.yaml  | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml
new file mode 100644
index 000000000000..5271b41279e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,ddr-channel.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/ddr/jedec,ddr-channel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DDR channel with chip/rank topology description
+
+description:
+  A DDR channel is a logical grouping of memory chips that are connected
+  to a host system. The main purpose of this node is to describe the
+  overall DDR topology of the system, including the amount of individual
+  DDR chips.
+
+maintainers:
+  - Clément Le Goffic <clement.legoffic@foss.st.com>
+
+properties:
+  compatible:
+    enum:
+      - jedec,ddr3-channel
+      - jedec,ddr4-channel
+
+  io-width:
+    description:
+      The number of DQ pins in the channel. If this number is different
+      from (a multiple of) the io-width of the DDR chip, that means that
+      multiple instances of that type of chip are wired in parallel on this
+      channel (with the channel's DQ pins split up between the different
+      chips, and the CA, CS, etc. pins of the different chips all shorted
+      together).  This means that the total physical memory controlled by a
+      channel is equal to the sum of the densities of each rank on the
+      connected DDR chip, times the io-width of the channel divided by
+      the io-width of the DDR chip.
+    enum:
+      - 8
+      - 16
+      - 32
+      - 64
+      - 128
+
+required:
+      - compatible
+      - io-width
+
+additionalProperties: false
+
+examples:
+  - |
+    ddr_channel: ddr3-channel@0 {
+        compatible = "jedec,ddr3-channel";
+        io-width = <16>;
+    };

-- 
2.43.0


