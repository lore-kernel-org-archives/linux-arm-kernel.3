Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A5CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 17:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT5JxJdOP/gH5XTnLdTvDzX4sF9AguuL9+g3UDm7e08=; b=C9qGoyizQRI/AuhVXLvpN1JkvZ
	tFMmpyOExjAI/PRXU1WSbgmf2hSRh7yXaUX2Q6O5sQUPoDFE8GxwrKZ9Z/m6z2SoKnR4ekGPgAa2e
	GHKt2a69F8GkxObMZ/R8gXn8qx9XVMS8PlWMFfsubAvFvMsdMNReH6j5vfZLGcyEWdmSfbqKHMcvY
	lKDgX4TaR1vJhV/yFQn8snRE4WsVwxEDzkgcVAbEyFOK3Ez+krPopr7uyRpVAYpwRHYkaBURnBCtP
	IKuDKl/TvfC2UHpkkIe7GEwUTDxZxsiJn62VAX/TCzkK+q4tXVTo0LjXKjD/jjGzMzKk3P3xztWbH
	/lWDdtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udu5T-00000000HrH-00Nf;
	Mon, 21 Jul 2025 17:14:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrlh-0000000HZzr-3UCu
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Jul 2025 14:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gT5JxJdOP/gH5XTnLdTvDzX4sF9AguuL9+g3UDm7e08=; b=BPYHlAey2M6yUHVaqvKNbJhLh9
	O311hJI06UKSy4ZvvfGftKDicmuOmm9Fj17ladmIV6MZ/ZkwDAlF2SpWoNOIGeE9Kf3DAHg6ELDCX
	o26UIdMexac2eaJK56/A3jP9a5tlNycXRP2zavEaRmpNmn30h/lyeAJsD97jH9HKao7WxA9/z/VIa
	zg6pFDDSM70kT9DXjfqmojqTdVVzJLBQIsqL4dIboAaQGLG5TAzIVlJuDBCVTVnoVW+vvDHUTckUJ
	+O3vF00Rx3TgHnnyrgu/S+FOiXTzLJcgaTe8rf0zzEL6AIXhjBgZc0jR5SfaW3+BQVMPqyaVJYc1y
	VAiDMhWw==;
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrlc-0000000B4HA-3dI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 14:45:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LW8T0TpgQ8FmbJx9epNSa9ub/AgspDWBOq0meQheCpTVuMf7gRzmdqu5yAoXj76Y+ERS2JeqOw3YMBLot+wwc7RzH0odNyyoLpmhHLJN13WtD4b5ZIsMUwdXpzu+hpecgQeVUsrcc8fPfBUc04GEpfCcaoXG1Y6n2IkRfBMQT2Lkh8FwXfKYmSiH6AvdQjp5UpFTsvXDVMYWqxYIH9ZaAdr8L89HK6HkopqNmqWtYBiEBV1hpFnyTVi+OF6QarBj/NYietedupnYPg/mHgNLSf7kA8Px2fzdwpAE57n+t/XGCe35C3ykTbU79wxXJE1yCBgM0JFIAgOgb3rVrOsM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gT5JxJdOP/gH5XTnLdTvDzX4sF9AguuL9+g3UDm7e08=;
 b=y9yzFQGL4GUFciYKIjZrPipBXXO8d1fuiHRrZOtNTNJ7mGEcD64/eX0No1iN47T2ozqUyVdF4WQQJTPQXds+wad5UszEO70qpWUMB3AV82wmxIEhoEkmlCv5fCRWEMEfZkjrHk8GK2VvxxVyll4omwmajN0SLmSgJHc4hCX3/z2dttlNstNM8Yeb3Kiu4CHkBCYh6g8bf2kipvD2yRbjzdWVNiZNmTifc+Bf1whZ50tTmo3pd3NS3sWLaOOt58Un5EYxxEDnA1Au3w6OFEXMYm2p3dHxfTA/YIi+DyP8tXFhMxz+CFsKdhv8y8HfsE5qTWJFacIW586KlCGO1ZVTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYAPR01CA0224.jpnprd01.prod.outlook.com (2603:1096:404:11e::20)
 by SEZPR06MB7060.apcprd06.prod.outlook.com (2603:1096:101:1f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 14:45:08 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:404:11e:cafe::f1) by TYAPR01CA0224.outlook.office365.com
 (2603:1096:404:11e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 14:45:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 14:45:07 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A22C2416050E;
	Mon, 21 Jul 2025 22:45:00 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@lists.linux.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	sudeep.holla@arm.com,
	kajetan.puchalski@arm.com,
	eballetb@redhat.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Peter Chen <peter.chen@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: [PATCH v11 4/9] dt-bindings: mailbox: add cix,sky1-mbox
Date: Mon, 21 Jul 2025 22:44:55 +0800
Message-Id: <20250721144500.302202-5-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250721144500.302202-1-peter.chen@cixtech.com>
References: <20250721144500.302202-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SEZPR06MB7060:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 47c7524b-e195-442f-b1ca-08ddc8652fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c4Bi+MYB6aX4ighXWFWBmWZzvDmFGBCn+Il8RUCT4bnjB39nG+t95QdFiD0s?=
 =?us-ascii?Q?11VSiPo+EK1JDouTEdjxJNKI6GFUzdI1yNA3qxeFV3DSdR/UYgeX+lAyNL5J?=
 =?us-ascii?Q?mLbspQ+po2p2lvmiN3xhisba/JmThJJbIippJAf7S5baK8O91MLrsBgfRBPj?=
 =?us-ascii?Q?r0D+PA2o1otR6Xc/0o+ABKfvHOl8CxGy+X+X/O8uL78a3SK2xPOXWirciwPn?=
 =?us-ascii?Q?R7wEGIo3/mWkXvBwJCawpQ955oSnQ8VLs7E8F5iYBjPsQqymPhLWOri6Za5W?=
 =?us-ascii?Q?mKnpjWwpij1GrMbl7fqntuNo5ZzubDFvU52FWCG0eNXgWEvuE+ADHrCOGcPQ?=
 =?us-ascii?Q?Ag9AVXA+CKMVSviENJCHD1R0BaE+JRQfiHzYvVFwiKJt9q+1ya4lxRl7vrav?=
 =?us-ascii?Q?qUlGUCFHegTrk90tk2fgpBWLJYemQVbktducdKoaZtldUZ/jDqrPAyH/RUDn?=
 =?us-ascii?Q?x80tyqbE1RRWxzX4DfBL1ovc/WiGs9GBFkJlJrtcdQmUnAoLNsNo3ub7I87e?=
 =?us-ascii?Q?IRJUA7TpQumiM0rLMCnjYxFfvRJPxG4HlHTRQEBJEbF6pwLoHZt/RlsCco4B?=
 =?us-ascii?Q?b25Buks7K5nNmflYtW5VE56CTNh2kKe+jCSgSJiPX9YqnQatO9N9vJZTiJ/Q?=
 =?us-ascii?Q?MU7IBIlPXAteGlMH4/mKUs8FvdEJLUeh+4WV1y+5tnDd4mIlyCZxhWTLklq/?=
 =?us-ascii?Q?x9BNwqH8+EyVdhJpO/YLAsc9qUN1S99HNbeEZUteBMkvTsMHonj7f53VtHeq?=
 =?us-ascii?Q?/Z+mScbpMEGhxO8SN+RnrJpD6S596h4oqY5QwEryyWUH8Fn19m6bhP6kAjRV?=
 =?us-ascii?Q?n9+oKQEJtpPj32h3D2WoGtkWo8kmud8uZq5eLyExp9AlI+0sEPlGKCZU2YsT?=
 =?us-ascii?Q?j7w76IDIK22FOHo5vrOKgeF17Z6yub1aUZ2VEM23ewk2x3QJMR1FLCiGrpqk?=
 =?us-ascii?Q?AJk96QtpMaS1hMblToYOaDwQyya//vSZWURhG8UqKY5B686vfUeDXM+XdWhf?=
 =?us-ascii?Q?JaQ6jo1GWmq4/qFFSFN/AOKB1v63E/P+eapRoBz3xhKJHxi4iXGAgEGNpM4y?=
 =?us-ascii?Q?cJv9yRSjzBW4RMAZDRqiSzI+jXqHGngLuhCEKzHHFTNlK7tgKwK9utsSs2ds?=
 =?us-ascii?Q?blsZVCdKYTrN93naLnaaJZ7sqEwbieNiZQ0LPGeOH7IHh7jYcWoJaEjtIOlk?=
 =?us-ascii?Q?ml+3tLM6NXxcWHgIg37kgdz7BloPhx4BU3ypr9I7JkbgblNC8HgD5bqAQKmB?=
 =?us-ascii?Q?RrkWM3oea6efh34cPokrZD9v2OIHJqfZZ7S4rWa0xpqIgYgFfnEK7GydNzAC?=
 =?us-ascii?Q?BBVxEKZSYWO7HNoRr+tHKb5mlXj7xD/J5UQQc5rMCjj5UQeQV3GF/9JVOIZ4?=
 =?us-ascii?Q?4kMhE90K4tXLu6xFnGIvKBzRE7hEWTMvxZmjZnp7UbOqMdQ1qMZJLJE8OMLL?=
 =?us-ascii?Q?xde7VqiH5VvF9qrzMUy/h2Yy/x40wkOFI9lU1jonK2L972xqGYnNTg=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 14:45:07.5074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c7524b-e195-442f-b1ca-08ddc8652fe6
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_154525_076775_1607B378 
X-CRM114-Status: GOOD (  15.36  )
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

From: Guomin Chen <Guomin.Chen@cixtech.com>

Add a dt-binding for the Cixtech Mailbox Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Peter Chen <peter.chen@cixtech.com>
Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
Changes for v10:
- Update the description of the Sky1 SoC use case.

Changes for v7:
- Add Krzysztof Kozlowski Reviewed-by tag
- Add my Sob tag

Changes for v3:
- Replace the direction attribute of the mailbox with the strings "rx" and "tx"

 .../bindings/mailbox/cix,sky1-mbox.yaml       | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml b/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
new file mode 100644
index 000000000000..66d75b7bc8c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mailbox/cix,sky1-mbox.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cixtech mailbox controller
+
+maintainers:
+  - Guomin Chen <Guomin.Chen@cixtech.com>
+
+description:
+  The Cixtech mailbox controller, used in the Cixtech Sky1 SoC,
+  is used for message transmission between multiple processors
+  within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
+  and others
+
+  Each Cixtech mailbox controller is unidirectional, so they are
+  typically used in pairs-one for receiving and one for transmitting.
+
+  Each Cixtech mailbox supports 11 channels with different transmission modes
+    channel 0-7 - Fast channel with 32bit transmit register and IRQ support
+    channel 8   - Doorbell mode,using the mailbox as an interrupt-generating
+                   mechanism.
+    channel 9   - Fifo based channel with 32*32bit depth fifo and IRQ support
+    channel 10  - Reg based channel with 32*32bit transmit register and
+                   Doorbell+transmit acknowledgment IRQ support
+
+  In the CIX Sky1 SoC use case, there are 4 pairs of mailbox controllers
+    AP <--> PM - using Doorbell transfer mode
+    AP <--> SE - using REG transfer mode
+    AP <--> DSP - using FIFO transfer mode
+    AP <--> SensorHub - using FIFO transfer mode
+
+properties:
+  compatible:
+    const: cix,sky1-mbox
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#mbox-cells":
+    const: 1
+
+  cix,mbox-dir:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Direction of the mailbox relative to the AP
+    enum: [tx, rx]
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+  - cix,mbox-dir
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        mbox_ap2pm: mailbox@30000000 {
+            compatible = "cix,sky1-mbox";
+            reg = <0 0x30000000 0 0x10000>;
+            interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;
+            #mbox-cells = <1>;
+            cix,mbox-dir = "tx";
+        };
+    };
-- 
2.25.1


