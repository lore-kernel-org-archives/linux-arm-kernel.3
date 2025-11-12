Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAFFCCFA1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+JrV/VSJkKJR3eCQ1SYYllE2hQ+ZiDPpyKUZEgiEmU=; b=iZcmvOzcStrW7ZbbjleddGu/Av
	8hY2duvofrkLJPl9puQcMEOJrT0Oadd/n//4mistwWByjRxyL63g4vLEQ0rSmsLX02/hVN0MS4mBS
	CAzhMzHbZoK9WL96OFmh0ZYpvKhER1mXvuQ/or+q1wGh4ibZJJpkZ5eQIgLWp3f68vMOk6uASFx5w
	wtxo73bMqYNw+gVR053SVwiq9PgsCZCeqV9oWcEich/OexZlVBC4mKGurteL089kH79jP4sHFQ3Gu
	418aU2WzBeUoszq7990wHi/0qlzTXxRZxV80PfUUJPtFFOg7pfmpO4vPkg4OXE+HNvvo2gKYhyCho
	whRincfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6G6-00000008M3g-2GcL;
	Wed, 12 Nov 2025 08:31:18 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ6G2-00000008M1u-209t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:31:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNuuTJXOckqyYFeTLyX70R4G+NOwbimQA+/78OkLSzd0SxHazKZELcYTRWVSniZ1Nv2iqHhQEQ1qDmiz8aUT4pcRbyPAcBCqGlYPkPnpuU9Y5v1Eg0DaaKidhppVgzMXINgKShGcYENvFCtWqS6YcJ7hFn/3LgDlUsRAbOvIBz0mJAciFrA67YkWtI1U9ot3OAR3FgZOUE1fjzzyRsKmJ8GC285LYLnmiWbpQJCXpoNx9Glug9sAws0pCBWU06TAGlIk7rcqR7ko/2l238ZSptSmBFCiGZaeJRLY/kofLcjhOItGtmStwEo1/vAcY1j2eI6vkvlOfXD6rIDAnK7ylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+JrV/VSJkKJR3eCQ1SYYllE2hQ+ZiDPpyKUZEgiEmU=;
 b=Brq0YHXow8KXba4w32sj2kra6iWsjDNjqQeN7gzHGMLoqJl88pMcrwn2ys0tWn050O+KXZrb4x39YgvJe1yucd1hgjI1m/8NmbfeA5Y+MpgpVRZHY3i3jH7tysgOh+aSj8TyOS/KTr2GQc4ZJDxBBNgKZ4bJqVsfm6s2RP/sJESIsUeTFL5TJ9yEHB6k89T/unp/yg/Qf8TMhZ4On/t2uIOFUm7ukc8ybR4wwnYrg3SIG2XlLXr+CsvSp5AZPFF4i4RfExalAWwu5T7S+jWUApt06Kj84bq7sTiag9DxxA4gLUXeVQpbZG3qJhLccEkP2jdNEDn8/eMyYiSC2J3+fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+JrV/VSJkKJR3eCQ1SYYllE2hQ+ZiDPpyKUZEgiEmU=;
 b=SNqyHjLwn23V1Bdw3ml3lvFafYetFecbpcmTEMgVlKTwL+FsMqMYzVAz1Kt+g1mgj640nqO2tDWbtLjPTVjdEUwoMxjmPsjdEfao9gap93w7W/9hB+PmyG1uWlwgsP9NKQ/r9rtCwbSpR9ypzYpjrtM67kqAn0W6dJpLJq6HLZs=
Received: from BYAPR01CA0059.prod.exchangelabs.com (2603:10b6:a03:94::36) by
 SJ5PPFDE7085185.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 08:31:09 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:a03:94:cafe::17) by BYAPR01CA0059.outlook.office365.com
 (2603:10b6:a03:94::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 08:31:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 08:31:07 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 02:31:04 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 02:31:04 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 02:31:04 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AC8V3Hw2390032;
	Wed, 12 Nov 2025 02:31:04 -0600
From: Anshul Dalal <anshuld@ti.com>
Date: Wed, 12 Nov 2025 14:00:54 +0530
Subject: [PATCH v2 2/2] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251112-k3_syscon_add_boot_mailboxes-v2-2-aebc1e47b391@ti.com>
References: <20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com>
In-Reply-To: <20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Anshul Dalal" <anshuld@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762936259; l=2165;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=21pDwQsRHIZzCG3Q+sUM5x68H18RXgQWstUgxA9KCYM=;
 b=4Lja9WsirRRM8jD002RgWJELE1kX7iapCUSFGT2sWNzMmyykQlnpIemtJ+LhPl88B7tNPkgeR
 a2qldUCjTC0B8bwumquNC27H9zuV1IyBSGC51OwDxFbIaMtFS9bQAwm
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|SJ5PPFDE7085185:EE_
X-MS-Office365-Filtering-Correlation-Id: baa5d18a-100e-487a-7dd2-08de21c5d3da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b09UdDlqRTNZZmhwTTM0T2ZhZlNqRWJMczUxWGFRbVNhZFJpZXF2RVRqcU1X?=
 =?utf-8?B?dXE4VzlKa2hRZWlLM3cwTHcxM0JxSDgydVlKVTRVWG05ZWNpdzEwY0Myck95?=
 =?utf-8?B?bUFvc005T3YwNysvLzVmck1PTWs5aEphSzhqSHlsakl2UEk0SkxORjB6dTAx?=
 =?utf-8?B?ZTJWRzlGR2Z5T0ZMNDVJU2VEVms0TWFaR0xPZDQ5bnVmQjEySDZjL0JzVUFT?=
 =?utf-8?B?QzkvS1BsQUVnMURkN3NWYnFRdWZYSFQvcmpFSThHWU9rWTFrdEpmNnZaYmRp?=
 =?utf-8?B?RUFWYVpqY2p5WHZlTDZCWUY3Zk9VOVZsbTMzYmhJbTFGS2pJSEh0UENVb2dq?=
 =?utf-8?B?WklOZDlQaW5JQ1F3YUdYWVNEVStOQjJHcHhYTzN5L0ROYStrbmR0YzFKSUVY?=
 =?utf-8?B?bjBJNXJNMEVGaEF0S3J2L0s5UGMrNm1WMG44ajdsb083V29GclA3UVU3c0M4?=
 =?utf-8?B?VXQxR3pIZ3V3N1lldW1zOWQ0NWpxanMvVGpjajhqUmhCUzNJd0ZFZ05ZcnF4?=
 =?utf-8?B?dUVQTDc4c1M1WUdHK1dmOERsVUhSMEI5djB0V1paY3FodFZPZXV4UU5EcU5T?=
 =?utf-8?B?ZGswL1F5UkZ2eE9xdEhTNlZhMUcxTGhDeUkvRkpEbHg1WVpVRWZCdGZLVUlS?=
 =?utf-8?B?QTlneGU1MUlXMGNuSHFqamh4RTM5am1qdExJZG1pcXJEVHpOcUVEVnNUSEpS?=
 =?utf-8?B?OWhIcmJMRXRxWDBWN3U3UFQ1RTR0WkR0d0g4MVlZbFUyREt0NmVhOEJGamR5?=
 =?utf-8?B?OWZqM2RoNE1yTnp5VDZtUmFJNE1CTlZYR3huSExreUp2dDVybnFKd2pOQUdo?=
 =?utf-8?B?eDQ0TEl5ZVIvMTQxR2tXUzFvV1FpT1BnY0lkMDFiM1lOT00zSGFrNHpQbjVa?=
 =?utf-8?B?eExLVEgwc3NvcUk2UWw2ZThQWGs4VWRtek00VW0vVTduK2ZpMThxNE1lR2p1?=
 =?utf-8?B?TUtjQTV3RmdSeTdRWnhHTjdjVHlMSW1VODlGRGtCcU9NMzVScTBrY2Z0Q09n?=
 =?utf-8?B?TnVqS3k3RlBNem5YVUJ2TllVUXRoeHBObUhKbUJVc213NnBkMllabzhyTFVp?=
 =?utf-8?B?VktDY0lWdGt5YlBCdVNPNXZ3WFFGYmdoSVdHYWJJRzJsYTJEaGFDSC9xZWpq?=
 =?utf-8?B?MnJNLy9mRHpmUTU2TGp3OGFZbWtmZ0IxNkk2VmZvZzFQcHNoUkhVMHZiSmFJ?=
 =?utf-8?B?UEZCY3k3MWl0ZGgzdjc4akJBSVh1dURLMzA1clYxVmk0RU40NW1LYzVPRXJT?=
 =?utf-8?B?YVpqRGZsTmNOVkM4WmJEeHVUOVRlRUYwaHlReVV4TURIQytNVzlOV2lyM1Z1?=
 =?utf-8?B?a3ZNUEwwOVVLaW0zUDdpSGd2OVVMMyt3SzVVWTAvUWtxZTkwVTZmckIraFMr?=
 =?utf-8?B?d1ZPbDcxTEQ0MnhQakFOR1dnVVRPVGg5NjVmQjA1KzUxak5RZGx2ZHBrZURO?=
 =?utf-8?B?QythajB4T3U2Wm54a2M0cWNNMWJPbS83cUI0WmVYZFV4bktINUFGbGIranha?=
 =?utf-8?B?WkdLZnVwVUdzSGlMSlZLbnA2TnlEQzdObGhLdlE3ekFvTVR5R0c5ZTZGNi9u?=
 =?utf-8?B?ZURHeHVTd2k2SjYrOXMreWNhOUIwT3c2cUdPZHFYNWFvMTI4dnhwSURPbEZC?=
 =?utf-8?B?ZjF4ZnpmbGppdWpLSTJCQzFLbXVER3Voa0hJK2FuWDBadnlSWHV3MWwyNXRM?=
 =?utf-8?B?UXVrZWZ6UUQ2L08yMTRwNjBINkc0VU9rWWRGUEFGdmRkc0JVSTJObGpFRktx?=
 =?utf-8?B?RWtVM1A0V01TVE9YSjc5Rk5aZUxLRElkNmVxcVBkMFpPb2FRZ0duWUNVSlRE?=
 =?utf-8?B?dy93SEVZWnF0d2cwM0JjSVl2RGI0SVJ0MHJ2aWE5Y0dUd1FLbjRYOS9qOEdw?=
 =?utf-8?B?OHJadEFnMDlhTmxScFlJSjhmYmdQY29UTGREKzE3Z2xZNnk1NG1ReWdyNW54?=
 =?utf-8?B?emFoNjdvWUxUdDI5dzh2L3hYcmtSbzBpMVdJOW9jUlBPTzhNZWY4QWtOTjRV?=
 =?utf-8?B?cG9pamliK05aaCtwMnJKbGZNbE1jRGV0aXY1MGc2aUQ3a1lCWWcrMGdmR2ZT?=
 =?utf-8?B?TUxBdkZ0eWhFdWtVdTdWdUhKRG9vaXp5OUpscW1UM2hYSVlod1JYMjhpd1hw?=
 =?utf-8?Q?tGTA=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:31:07.8778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baa5d18a-100e-487a-7dd2-08de21c5d3da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDE7085185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_003114_531607_73A6E26B 
X-CRM114-Status: GOOD (  11.98  )
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

The bootloader on K3 devices makes use of mailboxes as per the ROM spec
which might be different than one's available to the kernel (firmware
spec).

Therefore, this patch adds the missing mailbox entries to the DT binding
to represent the mailboxes exposed by the hardware during boot for the
purpose of loading the firmware.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 .../devicetree/bindings/arm/keystone/ti,sci.yaml     | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 182915c34fc1429fb627ac44c99c0c76fdf28e0f..770d6bc7c8f83493e448c426cb8f785dd73e824d 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -51,12 +51,17 @@ properties:
     minItems: 1
 
   mbox-names:
+    minItems: 2
     description: |
       Specifies the mailboxes used to communicate with TI-SCI Controller
       made available from TI-SCI controller.
     items:
       - const: rx
       - const: tx
+      - const: notify
+      - const: boot_rx
+      - const: boot_tx
+      - const: boot_notify
 
   mboxes:
     minItems: 2
@@ -66,6 +71,10 @@ properties:
     items:
       - description: RX thread
       - description: TX thread
+      - description: Notify thread
+      - description: boot stage RX thread
+      - description: boot stage TX thread
+      - description: boot stage Notify thread
 
   ti,host-id:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -128,3 +137,14 @@ examples:
         #reset-cells = <2>;
       };
     };
+
+  - |
+    sms: system-controller@44083000 {
+      compatible = "ti,am654-sci";
+      mbox-names = "rx", "tx", "notify", "boot_rx", "boot_tx", "boot_notify";
+      mboxes = <&secure_proxy_mcu 8>, <&secure_proxy_mcu 6>,
+        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>,
+        <&secure_proxy_mcu 5>, <&secure_proxy_sa3 5>;
+      reg-names = "debug_messages";
+      reg = <0x44083000 0x1000>;
+    };

-- 
2.51.0


