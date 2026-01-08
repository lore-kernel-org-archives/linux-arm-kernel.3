Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33913D148B7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 07:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gSXBXQERa5USla5LikQUFSRMJYLQrTyYKzjlYdRmT7E=; b=z64EA41rVuDrMWEYSxXX/gug2O
	cBRfrpLD/z2et6blOp4gpO+9EOTyFtKbXTszAt5FdCWM6JbW0YfYCFIqWdt/kKJCDLV8VYYA+4fp9
	JzmRa2iTNMYrC8bHfaEHL7w7+c53Uu22ZBSdYm+vHWbnqtfgr+1Bn/lYFRQR/7hO9aU0eH0WEqTmf
	G86DbMehzu6f+1uXpmq3p3Bi60TcTZEXyisPsOtLdmKfkWSDIMNLhr1d0mC84z/p7I7wKT9ExEH6Q
	XOMnSHaf2u2dIAm0qbnzLVjC55thQf4dq3ec9t4KU6kf9sY7BI3KJLDmqfikjU7MdUV+LfUo7d/A0
	43nr021Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkhn-0000000G85D-3106;
	Thu, 08 Jan 2026 07:45:15 +0000
Received: from mail-southcentralusazon11022116.outbound.protection.outlook.com ([40.93.195.116] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdkhl-0000000G84N-0sbE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 07:45:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3QNMNnMAUuW3GPuipzZ5HjoBXWTXryvog4hJ9uR5e/0ufgabOyTHtQAKAWKLf6uDbJ+KTMocORwf9gtse4xE4Q8THRdrdW0Z+TM4KK1Ln6EbeVm51101HQ1+kQcoBehnX1W1O7sWZAPwb17bSWLtpxYvTL8zmwpTV8DwvMItwHjWyhzNqjhFcVJEO7hWfcuqO4ooGo/d6E62vFCBT+odcsNIWaVEuygMDr22pCr4PKSEsBk1V3phh6SPsWGEFHDLER5yvIhU3XmncoJmQkZjdRBaFK1KZ3OiJfFoAsNsxrw68ML9Zj3SbtkLPbvElbBi0YqiPRI3G/kDOZkJVYbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSXBXQERa5USla5LikQUFSRMJYLQrTyYKzjlYdRmT7E=;
 b=dMRM2AqdFhuhhVJ78u0W//Kb2dGDOcTkQih74DIGcqr8C71JMe4Tu/ya0U3SRCFMbRzPDpgWSLsguVmgorbf/FciJkhnFY0FEiTnsSxz2NnDQfxh1bprcK7cGnw1sjzCm0CYYZoBjakLgxq9wnVlWn7n/lzlA+TwSakAp6KAwp4CNSMNkoqJ5i9ndiCIQWxeiQFIC38U3llxuuA5rGtrqEO06EQEXUX6bLdDYF9tQM4tZ4OB8zlN5pMm0Hg9KGL8tHRUXcLIprcaOHqjtHk9+mCPYlbdY2x0JQZNQMag9nQKHSNuK5KHiLjrRTbPgtAUZ1A4XCpjLfhS5rMNCoYY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 4.227.125.105) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSXBXQERa5USla5LikQUFSRMJYLQrTyYKzjlYdRmT7E=;
 b=cK0Zzf54XTVKYNs8Rfwditbm7SrbQPSaLaju6pzycVextVOv/LqlHfOs6qJqlWQW/CRvdMrTpMyHcYflH83DJ48WyOVw34nPx2XUY+ff8jz3jozxx/1MSz5qLr3qDtFSSHQT8ci6dsbTQcdQlAf0k+iUx/Vs53xJqUqopHKMX1ArB95QfKHjndbtgANgO7y5AlXeFqB+1d+PGd0+VrRfPfvSf5mDBXLVY9adHg6Saw0IqzbgRe/mpcU1/QfAyWulwmf1iBMk710ze3EotomxAcoEJAgjX8jO+OLMWdaGzN4M9pbIuxkpm3sG0cofBg15b31X/U1jGLLvdMfn6nlmwQ==
Received: from PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::10)
 by SN7PR18MB3839.namprd18.prod.outlook.com (2603:10b6:806:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 07:45:07 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:510:348:cafe::c0) by PH8P220CA0032.outlook.office365.com
 (2603:10b6:510:348::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 07:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.227.125.105)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 4.227.125.105 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.227.125.105; helo=[127.0.0.1];
Received: from [127.0.0.1] (4.227.125.105) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Thu, 8 Jan 2026 07:45:06 +0000
From: Vladimir Moravcevic <vmoravcevic@axiado.com>
Date: Wed, 07 Jan 2026 23:44:37 -0800
Subject: [PATCH v3 1/3] dt-bindings: spi: axiado,ax3000-spi: Add binding
 for Axiado SPI DB controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-axiado-ax3000-soc-spi-db-controller-driver-v3-1-726e70cf19ad@axiado.com>
References: <20260107-axiado-ax3000-soc-spi-db-controller-driver-v3-0-726e70cf19ad@axiado.com>
In-Reply-To: <20260107-axiado-ax3000-soc-spi-db-controller-driver-v3-0-726e70cf19ad@axiado.com>
To: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir Moravcevic <vmoravcevic@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767858304; l=2261;
 i=vmoravcevic@axiado.com; s=20250904; h=from:subject:message-id;
 bh=kbTU57gWD1KtQGZesKBK2zg4Rh9coJMCrSPbwROnotg=;
 b=MyEsM0j3ABMWIU0TMuMzlaAHQ29XR/6GKo1+RrmIxG93I18nNP9+gNWNjcsiIFYrnGV6jWyvo
 qGIubr3HvcNCB+wUHQSO3EIe6NRujkVIBVqQrCXNxRPCDqOI/b7AgOU
X-Developer-Key: i=vmoravcevic@axiado.com; a=ed25519;
 pk=iiyhWhM1F4HlCbbW3I3qKZhPCE8JsCrDQMgCBRg4YMA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|SN7PR18MB3839:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c2679c-3ac5-4319-f3cf-08de4e89d7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXlxb1RiYjRmYmdKaTcyRDNkbTNRbmpuZ3duTm92VFRObnBYRlZMNyt3MlBh?=
 =?utf-8?B?T1NTS1pOdFhXQ2FoWVU0QmVmRm9HVk9reVZBajFiWDdvTU5NVXREZTRNalpD?=
 =?utf-8?B?cFRUVkVVRFdoYTdKbzBXYnhBeHRUQTdDSVhsU3RKSFhQRHBxVkREVEdRMXFq?=
 =?utf-8?B?U1hvbkRMQndzaktFVUtMalYvZDhoOG5Oell5WXpPNVRremEvMUFvSFZSc3Fw?=
 =?utf-8?B?L1B5M25COUhFQ3dnd25EU3dwY0Yyb2tXaEV0ZEtmeW5xd042UGFldU9ISzhT?=
 =?utf-8?B?dXVmQUhjaVFxNDlwbGNQVnF2aXMxWHE5TmViRElJaDJLOWhIa0tpUzIrYjA1?=
 =?utf-8?B?ZnlZaVg0ZnlzQjZQOUpSR3hiaGpKeU8vVHhZRUIyN2dDODJtZ25LTmFtb0Ex?=
 =?utf-8?B?UUFNZG0wZ0xGRDliVlZPVDF3RFRQMjlSZ3V2Sko3dXJuMWU3WWkrL0duNG9N?=
 =?utf-8?B?QUk4OS90SVFKUUkvRUpWOEZwK3Iwc1NibkNyTE9ybjI4Q21rakgyMWVSK3pj?=
 =?utf-8?B?cDZRNHJuL2Q3ZEpsdXdIRDB0T3diQWlVTjZ3OWN3cENHcnUvbG9XNGhjZHNn?=
 =?utf-8?B?cjBuZlZmeUw1L2drdWZhb3Npb0h1M3d0MlhRZFE3TDFoYUIzbWJNTTdLWmxK?=
 =?utf-8?B?ak9uWFh5aEh0YzBTbDBubjdmVGhCREV6ejZjaUZhbDRUd3BxS1ZTWndObmhs?=
 =?utf-8?B?YlpQd1FzbzUwNG1WeWx4NlFUUzlUbHZLWFUrYXI1MmUyVW9QS004NnZ5RXZU?=
 =?utf-8?B?dVFvVFB3dUQwK25qWHZnQkJ6cGNSUW9tc1VOVC93SUNHYXJJU2J1dEZPOTMw?=
 =?utf-8?B?TjFwb2lwY0hoQjBrVTNsNWd3SW5mT0JERFlGTW9JRk9SV0FIWUVteXRnYUpq?=
 =?utf-8?B?QTljZndLN2swRHNYbmZHek1FZTVOQ1AwcGtPWmh5bUU1dG5ndXlZSllkVHIv?=
 =?utf-8?B?enUraW5tbDFQWlV1bGRWNkI1OEc5d0IzZlkxblBoS2MxejRXRDVzc1NoQ1Fk?=
 =?utf-8?B?Q3JCZHU3ZTM3ZTlVU0hEVGdGcHRBdFBrS1Izb3FVTzVmcG1iWnp4eExKYjI1?=
 =?utf-8?B?cGtVUlJIRnJPSHZiUmQwaEZyYkN5Q2dHcWZCVEdtTkVsWkhVbW1WUVdoUm0r?=
 =?utf-8?B?OWFWTlNJSDZwVm1GeWJmam8yQVpYamVUcUpjdG5INTRYTHFRcGhqNy9tRXlw?=
 =?utf-8?B?cHdUbW9NNTlxWnBVaUFaaEo4QVREWXRHbTVEcmJqSTdaVVZCOHJYTTJxNVZQ?=
 =?utf-8?B?M1libjZTU0RjeVdtNzI0SEpSVVZNT2RzdW45VXYvS0xlQ2pYNEJrQ1Q0TnYr?=
 =?utf-8?B?aDkraVovbGhXb3JVTVZUZTduaTJBRTZLYmlzczBza2lwV3lrNEZmZWpOMUtl?=
 =?utf-8?B?bzFZRzZKNGcySTAyVUhuelN2NnBwUnZQVFJjMTQ4Q2dUMy91VWZwRDludE1L?=
 =?utf-8?B?SW9XbDJFOSt2QWtlNHhFektReS9WbGhKMFZmaXU4WWQrRGFlUG11d2NxRmEz?=
 =?utf-8?B?QU1FMDloOVVZbHJ1bjBtUzY0OVJGSnVpZ3h6a2xJVEVKQ2ZWWEF5dGJ4ZzNu?=
 =?utf-8?B?YXBHQkwxa0JyQmFmZUR0YU5DQ0hPVXZ3bjBjOTU5bkZkODNQU01KNmNoNWRS?=
 =?utf-8?B?VjlqWXRqUVEvVnpVL1pHdkVHMjlrSXM0a0oweU9xelhRS1dKdXp1Y2Ntamhx?=
 =?utf-8?B?OCtyaldmYlZPMC9pNGM4T1VCNEphVDIxWDZVMVlNNVA4WTRrMmt1dExqUUVv?=
 =?utf-8?B?TnNRbGJJMjE1cVo5dUpLSDgzWlVxNHZvZ0w0ODR5aWVEanpnaDhvV2tNU3d1?=
 =?utf-8?B?S2Rla09ZZ01xdDB4SDBhbjZpbE9RY2g5NGlLd3BDQU01b1hqYk00NmpkVmVx?=
 =?utf-8?B?TC9FYXVoZy9IWkhZSWtYOFJLK3JwT25lczc5NjMxN3YrdGx4WGJLbDZzaEdE?=
 =?utf-8?B?REE4MWVQc0VXRjNpUGUrN1BGT3V5THNsY0lFT1phckZNaWJ2eWVKang3Q1FD?=
 =?utf-8?B?ZWtCMEx0SGpJM0N0ZkJxQmM4bGhibXFGU2lWNGRSajM0bnNjVFkyek1VczRO?=
 =?utf-8?Q?tevwR6?=
X-Forefront-Antispam-Report: CIP:4.227.125.105;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 07:45:06.3951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c2679c-3ac5-4319-f3cf-08de4e89d7d1
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[4.227.125.105];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB3839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_234513_621845_F0BF0C23 
X-CRM114-Status: GOOD (  11.08  )
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

Add documentation for Axiado Digital Block SPI controller.

Co-developed-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
Signed-off-by: Vladimir Moravcevic <vmoravcevic@axiado.com>
---
 .../devicetree/bindings/spi/axiado,ax3000-spi.yaml | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
new file mode 100644
index 000000000000..cd2aac66fca2
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/axiado,ax3000-spi.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/axiado,ax3000-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 SoC SPI controller
+
+maintainers:
+  - Vladimir Moravcevic <vmoravcevic@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Swark Yang <syang@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - axiado,ax3000-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: ref
+      - const: pclk
+
+  clocks:
+    maxItems: 2
+
+  num-cs:
+    description: |
+      Number of chip selects used.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 1
+    maximum: 4
+    default: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clock-names
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+   #include <dt-bindings/interrupt-controller/irq.h>
+   #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+   soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      spi@80510000 {
+         compatible = "axiado,ax3000-spi";
+         reg = <0x00 0x80510000 0x00 0x1000>;
+         clock-names = "ref", "pclk";
+         clocks = <&spi_clk>, <&apb_pclk>;
+         interrupt-parent = <&gic500>;
+         interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+         num-cs = <4>;
+      };
+   };
+...

-- 
2.34.1


