Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13B2D1D480
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9yBEMTE2mj5bvjjlEmkJZFdS2qwLh2K57I5LFSHJaNQ=; b=jorYZlu+jhV/jF
	VbKWqYLvaL9bfUASLUTk41SNgCCamatyPOsq3CXdJumWUirJfmFOeVZufJEd2m6AI3bRyIZ3og0Ag
	csQkso3K23gYKZmF5Lxe0Qdu4/wNALCLhnIFr27iV5kZBYYM2j1JzPum3HSmLAtNPF4QirTkb5SOz
	VTB4cRtQqPrN3vNPIVt8LytWzn0HQv6sJKZipQDPlorUS6qX87ZKlTm3olChRpfn95PxCOjhNTFTk
	1hxwQFbuZP/uf+m6R2AanjDQDLPQTDkjUAlzL8FqXcyhVLXzDdDqT9Zw0JXo7VWKd8ucK5iS0xpe6
	O31Qr7z/dxz0LUlWsRjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcJ-00000000LAk-0BGh;
	Thu, 08 Jan 2026 17:16:11 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtcF-00000000L5w-40QH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:16:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOdNSYlPSeriZfQ09+KN3LUxr95zhMD4aTW6y5pMljczq3SVXyAzK3R0pdeXvYu0J2/7ZvipxnII1Se/JqfNKRHAj3gNXF4r92SvCAoW+o9hX/QGrFEagkcOFCgqdsav35milbdR90oum19WOlYTbstnZMA51pAqq7d9Kr04X7jc3/ws/e48tVs6HFZYKAqtwTz1MO2dym+K4TdjBSd2w8xHT0VStzeqkVODILD6iNZk7z4ng2r0TSE4Dpxca2TzK4f6EcwH7/Qu9FxgVsT7OolXylnfXbWE1JdMNkmQh14rUpk7astPAJAXeholkCOAOpYa/moVaeCUifIN2VSkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yBEMTE2mj5bvjjlEmkJZFdS2qwLh2K57I5LFSHJaNQ=;
 b=w5jJ0zMoJzWNguRr/X5lHZgc87kKomakNbfUpfJXbmC9HWuiASyAariUyOkr2EEhpzFI3ECAicsvirEh50i4u71eSh64Nov9UXz/oV7718rnRIeax6KaQngW+YElnWe3AGmbEMos32+70mgRSmY83wmuaJE5eS9yMLeBQbyNZoqX3Ue9F902v8ypRVRjsIs+5mPbRbLwgMJOtSN/OacxKk0i3gmFIYmfEWnyGkH8q6PVKLE+Hli/pVeVpzERRnjJD8fTBSXA/N0UZ8ASF1fHLtt4K4KW4/JgZCKocSI57QWAh4Gw8/5+9kt3PnXyOspNfnvBPnRWmHJt8ibi0+Eegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yBEMTE2mj5bvjjlEmkJZFdS2qwLh2K57I5LFSHJaNQ=;
 b=EhPgxIXZwgHodGlL/c+LQknmRwIzhVUOZWcY7tltMK6O+KJ0ec3KpuQJRY23YDQZsSMiTH+PrAMvDOFEv+VhJqtapbkhDOpFzIC8jafGclmAZ/I6AR8MZZlENcqUQ2gBai2nFLzUlz4BVktQ9wrth+jMiQuO5cb6Z84tuFUkD42zZUXHgMObqdfXaI3tSOG8R7SpCKyB4PCr1aS3Mdd2OYvHdxfcO4kHT4FT8vzP72EuKiLMwd8cMYn+ioFmk65F59RjXg6Ca+gHvIwESKr2m0KHU5PEVJjuTBCvw359RrXB7hmQd/wWLXBUnJmcw4HhCEB7NolFwjx30WR92IwJ7w==
Received: from CWLP123CA0101.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5f::17)
 by DU4PR10MB9666.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:640::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:16:03 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:401:5f:cafe::b6) by CWLP123CA0101.outlook.office365.com
 (2603:10a6:401:5f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 17:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 17:16:03 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:17:19 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 8 Jan
 2026 18:16:02 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH v3 0/6] Add boot phase tags for STMicroelectronics boards
Date: Thu, 8 Jan 2026 18:15:59 +0100
Message-ID: <20260108-upstream_uboot_properties-v3-0-c1b9d4f2ce8d@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE/mX2kC/43NQQ7CIBCF4as0rKVhANvqynsY05Q6WBYtBCjRN
 L27tCvdGJf/S+abhQT0BgM5FwvxmEwwdsohDgXph256IDX33IQzfgQATmcXosdubGdlbWydtw5
 9zATlXDZMMSUV9CTfO4/aPHf7ess9mBCtf+2vEmzrP2oCyihTcAIhamAoLtqGUIZY9nYkm5v4p
 yV/WTxbom6k1lXVdMi+rXVd37ox8Z0QAQAA
X-Change-ID: 20251112-upstream_uboot_properties-22480b0b4b1c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrick Delaunay <patrick.delaunay@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|DU4PR10MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c315ed-6dd1-44ac-87f5-08de4ed99a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWp0WWlTNlZKM05wNmJZaVBaOGw1cER2S0Izc3N6cXcyVndwNXFSUmdsZGdK?=
 =?utf-8?B?Nlo5SFg3UDlGcGVKZkJXSnVQeXlWMStDVE5PVGJJNCtucUZ3VmkyMGZzcklT?=
 =?utf-8?B?cUFGMS9qNU5vSXJ0RXpnOWt5NkQyNUh1T0pIQ2RnOHQwS3BEVitISDVtSkZ0?=
 =?utf-8?B?UzFjOUVIbjlCTWdJUE1vQnpQa0tDcldnR2dNcVJmZ2RsYWtwMjVGS3U0ZGUx?=
 =?utf-8?B?djdYeldldFdjZ2U5M3k5Nm12dVBQcFVTUlpEZnA0NHF3elNpWW8rYWdTVmEx?=
 =?utf-8?B?ZWF4THR0V0JINGY2YUJaKzNzVEJqaTQ4UjFqL2xMeCtHQTlzUTdadk1yRUJr?=
 =?utf-8?B?dnVmUjRockZGSFd3Qzc4WlMzb0Z3TDlQTThaM1FoQmQva0FIUkd6aS9nZGwr?=
 =?utf-8?B?Y2l5ZFhveHZMREpFbHJFL0ZzODBzWmpZVVA0RkZ6VEN5Z2h1UUpFeTc3ZTVH?=
 =?utf-8?B?Nkl6eEhoamV6djZQcjVnWGEwK2xYdzZyRjhOMzk2bGpoZWxlc2srbFRjTmZD?=
 =?utf-8?B?OVc0NUJXc3RPMG9JYzlHRVl5UHlOSFp6bnpRai9ROUtkeTk3YnkyNWdzS2U1?=
 =?utf-8?B?V0RuRW4yQ1hPNGZ6VWVkMWhyaktBRkpSZFVGd2dNMmJrUDlmUlY4KzQrbnFq?=
 =?utf-8?B?dWdKbGVROEF6cEpxZG9xSlBXWldKVmtWRWNjbEhtK1BnTzFTZ3NpY1FFMWo5?=
 =?utf-8?B?c0UrMUtHR0tYSFRMNFhYNUtOK2U5TmVnZXg5VEdnVGxJZERrV3N6NEtMZUxn?=
 =?utf-8?B?YmRNM2lwVE9idm8wUEw1QWxUaVNHSjhOU0sybUJtcFRJaEIyeU9vWmk3V09G?=
 =?utf-8?B?R2lzS3hIdWw3eUF6R0d3ZURBNHNKN3FsbVQ4RGoxR2MvOUl6NjI0SVBZMTF0?=
 =?utf-8?B?NzVYaHNtWnE0enBDMkxadC8yWjFHeVc3bzI5dWc3YmdtMlZ4V0V3d2JQdFVY?=
 =?utf-8?B?SlNRSEVaZjA0ZThsdnBpRSt6c3VTYjFMN1dxRi9aQXVPSmZTV0hhNy83N0cx?=
 =?utf-8?B?eUwwb3VzUWQ4TzFCTjI2VWtCREk4dXd2SVlDZUd0akFVbXpGeVg3UW9nb3VT?=
 =?utf-8?B?Zm1YVFpZT1dNMEJZajFBUzluZkZLYktiVjc0Sjc2Ky9hSnBWSXV3aU9zZHlN?=
 =?utf-8?B?RS9LcFBLZnE1MDhYM21ZMEFjK3lzZlUrTHU5K1JZSy9aVE1tc0pyVWtna29R?=
 =?utf-8?B?bkFFTGJmK2YzVjRTUWxtZVMvTTRaUGZWbDByYkhZdDk2TmZ5OUtSbWZ6WWZH?=
 =?utf-8?B?ZERIV2FhVk95VTYwNGRkd0hLdy9ZMEZPUGk4b3I4WHFJWHkxZkl0Y0VHSTFr?=
 =?utf-8?B?Q1hRdURoKzNSdWJwVE53OFhvQjNjVWVBZkxxVUhLVDYyOGxFZHVBNmJmeXE4?=
 =?utf-8?B?MlJ2T3BQMCs0T2U3VXRNbFFkcTFpbUpZbmpEeHB4blhiQVdZN2JwVmxPYk92?=
 =?utf-8?B?REhNVXdOM1YrQ0tPYlMxcXBzSklybWlRMENDNzAyL2ZqeXYvYXBZOTBLd0dH?=
 =?utf-8?B?eXF1bUkrRnd6aEgyTk9KUVRXNVdEOFVPeVRXV3JKbHAwVHRkSnhLSjhCbzE2?=
 =?utf-8?B?YVZRbVZ1UGJqdkprSjBPOEhMNFUzL1hRSDdSSWV3WmxkMlRoV005TUx2QjNB?=
 =?utf-8?B?TzE1bmtDY3d4d3RvZ0lJZkh2OUZLaXlLMVFQMUdoZkF4RUJIdDAyLzBUcUcz?=
 =?utf-8?B?eHBXZk5kVkZWekRWR0VsTk14Y0ZuMUpaVkJCbEszVjRObXN3TzA3Zk1DNXoz?=
 =?utf-8?B?bGorVUhzcTZBTklsY1lpU2g3UzF6LzRwRFVxS1U5VHdFVDVhQlZpNGJnVFVE?=
 =?utf-8?B?RmRKZnFWY2pZMzVubloxWE5iYWsrbE96TFFjSi8xancreFdSeGhOaisyRlBH?=
 =?utf-8?B?eDF3S0xsZnllTkdGRjVJV1Z3K2NxZ1Y1Vm5aWHIwMFFHRWZDellMVG5GeGJo?=
 =?utf-8?B?NnVHNXB6VTdXaktPaUI4WERSc0s0MXpsbHhuMXFZQmQ4TmZkNHEzY0NHb2ZS?=
 =?utf-8?B?bHdTTUlTTU91TUhVTDNLMEVEUlp4QzJQc3drcUpHZGxCS0p4djRCWTF3ekRj?=
 =?utf-8?B?cERBT3UwMXF3VWRnZG1VdjNUdHdsOCtTWDgxRkZENWpYaUplc01TNWFKVE1i?=
 =?utf-8?Q?PvNxexLBdIkTDE4d1WjIES6ld?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Y5asFsCNaebPPeIK7NVTVcBob3ACyBptU5SjLICwvYgLgvHZQsYNh8GSG9PlaNqlAhM8XiS/l6KsE13DiXA5X6OHhD+mCT5NareUZtz61MqoI8lWupvHiqYPSMJmQ/qzwLoaSAS4X68lU2GnuVqRMgkFX5gZfUyjlIinFQfEgBHLB60ye2MrPB2ATeg5Moc6p4+rR6JL0grWKTjAVjyZq0/XdJHkysBn8zd70OpVVgJikEB5TYEgueAE+nYmDp/gd6+fIV2Mgipvf/JodTvt6jnVz+xCodfmEdtF33HrYCp6WXc6roBTByAvOiKPjdfSBdjQxbG0UnUeXpse2g82aDOkBpaoTBAyERWwYQX/FTMYf4BoSFcGKRTO8EG4p7nsOzx3jTl8+eIVmPMc42duutPNwUBDc4dQ3ybp6YHiXKQMY33Tm84PavdPBw1EwW437BOdwcifCYC2+d1wb+qU4mMv0x9bZaQCE643Xd1I9HZlPUPRVmtGM2Y3a5Wo+NGOGSVQOH4dIRoXaVUfFVLqJJrzQirejr6ry7DELBdp/QR39rzTvGmJErAfI08D+bmUmGdDnYaGWW/lkbBuD2ObBoj9U04QvcqGDz/kVNV4dvU3e7kV9eNW68ZfEa8QUqBO7ChPTp73qZT9opXqVDdAP+LfLYhFdoo9Tn3KDIbz5iNj+24CIqdWdQz44L6G623S
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:16:03.1706
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c315ed-6dd1-44ac-87f5-08de4ed99a0c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_091608_002533_7548A585 
X-CRM114-Status: GOOD (  10.89  )
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

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.
    
To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Changes in v3:
- Remove duplicate bootph-all property in ltdc node
- Link to v2: https://lore.kernel.org/r/20251114-upstream_uboot_properties-v2-0-3784ff668ae0@foss.st.com

Changes in v2:
- Fix 'pinmux' is a required property for arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb
- Add bootph-all property for lvds and ltdc nodes for stm32mp2

---
Patrice Chotard (6):
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f4 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics f7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics h7 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp13 boards
      ARM: dts: stm32: Add boot phase tags for STMicroelectronics mp15 boards
      arm64: dts: st: Add boot phase tags for STMicroelectronics mp2 boards

 arch/arm/boot/dts/st/stm32429i-eval.dts       | 11 +++++
 arch/arm/boot/dts/st/stm32746g-eval.dts       | 10 +++++
 arch/arm/boot/dts/st/stm32f4-pinctrl.dtsi     | 12 ++++++
 arch/arm/boot/dts/st/stm32f429-disco.dts      | 11 +++++
 arch/arm/boot/dts/st/stm32f429.dtsi           |  9 ++++
 arch/arm/boot/dts/st/stm32f469-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi     | 11 +++++
 arch/arm/boot/dts/st/stm32f746-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32f746.dtsi           |  5 +++
 arch/arm/boot/dts/st/stm32f769-disco.dts      | 12 ++++++
 arch/arm/boot/dts/st/stm32h743.dtsi           | 19 +++++++++
 arch/arm/boot/dts/st/stm32mp131.dtsi          | 21 ++++++++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts       | 11 +++++
 arch/arm/boot/dts/st/stm32mp15-scmi.dtsi      | 26 ++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi          | 29 +++++++++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157a-dk1.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-dk2.dts      | 43 +++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts | 14 +++++++
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts      | 60 +++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts | 25 +++++++++++
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      | 36 ++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp211.dtsi        |  7 ++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts     |  1 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi        | 22 ++++++++++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 11 +++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        | 25 +++++++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi        |  3 +-
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 11 +++++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 11 +++++
 30 files changed, 536 insertions(+), 1 deletion(-)
---
base-commit: 53c18dc078bb6d9e9dfe2cc0671ab78588c44723
change-id: 20251112-upstream_uboot_properties-22480b0b4b1c

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


