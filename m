Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A529D3EE9C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ENyW8vhcMpTbA5wLYYoQVZw2DtaQ+hQIijaJv7arj0s=; b=J+AZ3yyxoCwIkj
	VeDR4kZGpRaMCgG5lCPgeiVm4v619QXPwuMONHtAJuVxM9c5S3rSX6gnqm6OKTZjbAhcivTjlRADD
	7kUCouXfydDrvETYEtSJpdrL4+z64tQFM1blqJc3YshWVFaLcFT0kjXVOI7uJyXxLtjwPJgpKdqc2
	fkE87fAgttpp+cVSGR+PJoOJpnEQnQJA9zqutWKXOJZHLEhiA+maWTBRDIqxKDmFcivAVlVY26WIl
	RgRWORu+P32ZQXvJEOt804AqKQ2ZplPQC1i763BOVzX9LyeY6n+1CwCt/bq1nL0ozE/wKjymtEu9C
	5G2jnrKy3b84FqJnWsDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyLd-00000007YU3-0KhS;
	Thu, 22 Jan 2026 17:19:57 +0000
Received: from mail-westus2azon11010051.outbound.protection.outlook.com ([52.101.46.51] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viyLZ-00000007YT9-18Gw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 17:19:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSEqMeGkcWsp0qqV0CHBPfcXmDSHZBZX73QgcbjXx5sckkGSta35KAyQ3rfB4ZoRfyQSf9QjKGaI0Xhxvg/A8QWoBC0NlMKNBGBvlyvVdC9dfkpWIVPPlwefCTqdfOYVM6VbS/4OOEpyRo5rVD8mPBBwDSxSwr3wDEcpDitO+0bunbNiyv1LdgjVdpYD+VJE6/OBznJnIPXwPjVX9CeI+PNwCJ5DXP0LRAbqizGhopEJDS/BIGIx3hG+MQ1ygea3ZD2x3Rk7Lr3dXamtoftKC17FJus/MxBfl9ykvO2HoZYkpwAbd/MLAu1/VnmDokQ0Vf1WzkGmzsPnrqZgxrdVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENyW8vhcMpTbA5wLYYoQVZw2DtaQ+hQIijaJv7arj0s=;
 b=x4Yl0zPmj448o6ZzZzNwg/rcmT5vuWjlIQaUmk4tP9iZSw2itptwHbm6NouaJDnpfOLldadvA0HqnD40gkt3OCgAgSoblDeKszzbwOch73A5rv1JovRymQNbpTZ9cGgFuEcbexMA2R+sKhAuN5Q+ORU+/b6GS4iDgLoN6mZGkopYbscFziAnp1TZusrhTMxR/43kCGkffe6dK7IcF0tBC8BKVCKLyEZqUjP3JQ8y15vxfmYS31uI0qNtpivIidrgV3v2uH/1Ci05fvdcodDcKPwwuElgw9WGVXvrzes7YJ/2jDjsWbZL2LkNHYvywOiL1erLOVpUlqrb7nU5FiNHdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENyW8vhcMpTbA5wLYYoQVZw2DtaQ+hQIijaJv7arj0s=;
 b=NiKuYDlTYl84byG0mGXPDOntwZLJbLG9TJ8LPrRTB2QR4/PeL26GIh0wA8PmrqBM/C6+ti9M7HT2g52O8x1fxAWiqeibHEPZ529eCGuWNRfUQ5SGfsvI8ifSa9cthbu6av+c+rHodGad2GGRr+yn6SP0Uokrz3VkL8IaEeYWhBQ=
Received: from BN1PR14CA0008.namprd14.prod.outlook.com (2603:10b6:408:e3::13)
 by DS0PR10MB7067.namprd10.prod.outlook.com (2603:10b6:8:145::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:19:43 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:e3:cafe::54) by BN1PR14CA0008.outlook.office365.com
 (2603:10b6:408:e3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:19:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:19:43 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:19:42 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 11:19:42 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 11:19:42 -0600
Received: from psdkl-workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.234.127])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MHJcoN912039;
	Thu, 22 Jan 2026 11:19:39 -0600
From: Aniket Limaye <a-limaye@ti.com>
Subject: [PATCH v3 0/2] ti-sci-intr: Support level+pulse interrupt sources
 together
Date: Thu, 22 Jan 2026 22:49:12 +0530
Message-ID: <20260122-ul-driver-i2c-j722s-v3-0-4ec3478f3866@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBccmkC/33NQQ6CMBCF4auYrh1TpqS0rryHcQHtIGMUTIuNh
 nB3Cwvjwrj8XzLfTCJSYIpiv5lEoMSRhz6H2m6E6+r+TMA+t0CJWhaFhscVfOBEARgdXCrECKV
 pEZWx1jde5Mt7oJafq3o85e44jkN4rU9Ssaz/vVSABIeGTFMrU1s6jLxzw00sWMIvAOVvADNgF
 EpbOd3osv0A8zy/AemPxKr0AAAA
X-Change-ID: 20260116-ul-driver-i2c-j722s-48f223899dbd
To: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
	<ssantosh@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <j-mcarthur@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Aniket Limaye
	<a-limaye@ti.com>
X-Mailer: b4 0.14.3
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DS0PR10MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba2e030-7290-4265-f514-08de59da6efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0Q5U0xsM2wzRGs1d2dRY2NPZDQ5T3d2eUVlOEpWaEFGS29tRXdhaFFnUnpR?=
 =?utf-8?B?MjJWL29EOVZmSDd1Wlg3V3JwOXExWUR6MUhFdGQ5dHpLM3BnR0FhcEIydXRM?=
 =?utf-8?B?Q2o1MEdPcC84TW5adjR4YkJDajR1SjVkOGxGdExGSEpOYjVjTFVWamtHZHhl?=
 =?utf-8?B?NGZMZDNqRzJTRjlRdGNFZ1IySVBYVjFnYmZvNktQek54SXFZUC8xTmRTbTc4?=
 =?utf-8?B?TGJyWFltMGxRTnBYUm1SZVZ4d0ErbWxuYWJTcmpwbEpqQkk1QXRYbG5BUkhl?=
 =?utf-8?B?QzYybEw0OGJIdjF4aVg1ZkVDWDZCQ1lJbUNDRGZNL1FpWTBJaE5XTW1TcUF1?=
 =?utf-8?B?dittYTNzUTFiaG1RV2ZqK3BKSXlSeXNpUFJVcU9uZTl5SkpYTVdCU0N1VlNx?=
 =?utf-8?B?cEg4U3FGSlNkYlVLWm13Ky8zL1pjLzlZV09nK1ZsZEwyWUs3UkY5dmY1ZlJB?=
 =?utf-8?B?NG8raHlrNnlTOGk5WE9PTmFLdmROdk9CSU5xYjlSQ1pvMFhyUjVSKzVnc3Fl?=
 =?utf-8?B?S1VoTmVpckVUdllFQlhQamM4TU1NMEpGK2EzME1sVUVacEpLdWxpOGRHTVIw?=
 =?utf-8?B?RlhFcjVGd2UwOXZRcnQ4YVVvanpXSk5LV1dvcHNXU2MrMmRCUzh0YnVwYWNm?=
 =?utf-8?B?a3drOEVYTW5mUWZGaER2SzFlTTJvZy8rc21RRVNyRVgyejhkL3VUZnNxbUx3?=
 =?utf-8?B?NTlBMzg2eVhRdTAxZDVuZEY5aXJuNDhZcGg3Tk10WVVPNldsQVBMTzJhbUVM?=
 =?utf-8?B?ajdtS0VzZkgzOW9FYUtmUCs2S2szYzRKdWdpTUxaY0xUZTBGazc4VTM3MHpT?=
 =?utf-8?B?UytiWGozUUgxd1VTWTdRWE9iMHJ1SngzOUhTUllmSmNTOENQWUhSWUwxQ0Yv?=
 =?utf-8?B?azh1N3NnNTNiTjl3UHFHK3pWOStzYUIxUmlIRHlWVUU2ZmJvT3NkVTRoM2E4?=
 =?utf-8?B?ajhueXlZYVZqdGtUcHo2MFhWeThvaWh5WkJqWldjTGhVNUV4c3VOaEJNa3JP?=
 =?utf-8?B?TGgzMEJlK0tVVVVnamZGWWhlYlhyOHdpaDVhKzU1aXJiVWpRc2tXQ3J2MWla?=
 =?utf-8?B?dms2UkxCTERhY2kwNDFFbE9SbFFnV3h1dndacmErbVNkSVdHK2c3MlFrR1dp?=
 =?utf-8?B?RjFGMGVlbTBocXdScGFrVXJiYTdhcUtuOHh4QnFmUGc3VlNleS9wcE1sWk4w?=
 =?utf-8?B?Nm1jZ0RrNmJ4YXhMdG5vNjRYdVFFK3hON0xmMTlHRUlmT3BpSWNOUmJ2bWEv?=
 =?utf-8?B?WlM0bUFwZG12RGtORFUybk5RRXUvK0F3bzJHRVgxcjhtMTllTHlrQzR5WDg0?=
 =?utf-8?B?NE92U2NZcm0rMG1SYlB1bVd4Q0VQVlV1bmlzZjdaZEVXTjZWVFg4UDYwbzBr?=
 =?utf-8?B?Mi9UUTRob0FYZEtpa1Z5WGc4cWk1VUNvRitCdmtMOGhTb3RoSm0vT3VjWFpO?=
 =?utf-8?B?dERmd05FVlRUUTVSOWk3QUhTeGM1U1JEcFZ3SDNoQnJIRTVJbUdCUlJsdXNK?=
 =?utf-8?B?K3dveEY2WnM3WDVrYk42TlNSR1FNbjgwS0FGT1UrOWVaNjZWMk4weDAxMitz?=
 =?utf-8?B?R3QxUTNxWFhEV0dzTDRaTVhaS04xNXU2YzZXTHo1OEU1MjBoeVNiWitVeUdv?=
 =?utf-8?B?MXBuWnlEbFNsOS96Z3FoeEIxYUdNa3N5YWV3QTRBK3V1VGMycE9pcDBOSi82?=
 =?utf-8?B?anFDNlB1UDFhNGVBNzN5b08zZW9YOW9RU2pRVUw4TEVVNWRZMW1yMTUyZnhG?=
 =?utf-8?B?OGYyRmRrMGJvZDlsMisyMUtqVmoxeDZaZ3dLMjlMU2JrbVQwOVpWbHBHekZy?=
 =?utf-8?B?d0k1TlIzeHhtclYyanBOVitBRktMSUlNOUpSNWw2Q2hrbGkva21JbkxBUW1V?=
 =?utf-8?B?Nko5RGpHcGxiK1dOWnFKNEpOOXAycG5uZ1duWHRlUnQxY3dUd2s4bGk1VTNL?=
 =?utf-8?B?QlpDUHVRV2FvTTVRaE8wUFo3N09Hb2xhVWtSeTA1VitONFFJTzZONStlbThy?=
 =?utf-8?B?VHlPVHdGd29pN1lnMWdJSGozOHRNMWdBWGNJdHowdWdzdk9GYjd0aUxEbkl3?=
 =?utf-8?B?MDVBNVE1OHhuZGFMR3dmNDVKYkh6OHJ2dmIxUE1TN0FKUE9mNFVXamRYczFi?=
 =?utf-8?B?WGpIYklPUVM3MDdGcFBHc3psZURudkJ0Tm56TUp3R0VhLzF0N29BdUsyVTI0?=
 =?utf-8?B?aEFxaGtOVmZsV2t0aDZGQlc1aVM4L3BsOXNkT1JJaC9GV1Z6eXZBSFJvUFQ2?=
 =?utf-8?B?aGpSbCtuYldQb0hNbXJWaGRKZ0l3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:19:43.1942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba2e030-7290-4265-f514-08de59da6efe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_091953_324557_33585EA6 
X-CRM114-Status: GOOD (  13.05  )
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

The interrupt router does not support interrupt type conversion and
forwards both level and pulse interrupts to the parent (GIC) unchanged.

Hence update the INTR bindings and driver such that
1. If "ti,intr-trigger-type" is absent, parse the interrupt-type
   declared by the source, per-line, and use that to allocate interrupt
   from its interrupt-parent.
2. Else, the global setting specified for the property is used for all
   output lines. This maintains compatibility with existing platform
   DTs with no changes.

This change is needed because:
main_i2c4 on J722S is a level type interrupt source while the rest of
the interrupt sources for Main GPIOMUX INTR router are pulse interrupts.
main_i2c4 on J722S is not present in it's dts yet and will be added
through another patch series after this one gets merged.

Testing:
- Enable I2C4 (additional DT patch) on j722s-evm and run i2cdetect [0].
- Add testcode to ignore the NACK interrupt, which results in an irq
  storm -> showing that GIC is actually receiving level interrupt from
  the INTR [1].

[0]: https://gist.github.com/aniket-l/b5825cd8f2c1d11da4580e011c656ed7#file-j722s-evm-i2c4-working-logs-txt
[1]: https://gist.github.com/aniket-l/b5825cd8f2c1d11da4580e011c656ed7#file-j722s-evm-i2c4-irqstorm-logs-txt

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
Changes in v3:
- Avoid new redundant value IRQ_TYPE_DEFAULT for "ti,intr-trigger-type"
  when "#interrupt-cells"==2. Instead, make this property optional and
  check for its absence to use the per-line interrupt-type setting.
- Link to v2: https://lore.kernel.org/r/20260120-ul-driver-i2c-j722s-v2-0-832097c6b64f@ti.com

Changes in v2:
- Use correct Patch Subject prefix
- Reword Commit msgs to better describe the patches
- Fix function argument alignment as per coding style
- Fix variable declaration ordering as per coding style
- Link to v1: https://lore.kernel.org/r/20260116-ul-driver-i2c-j722s-v1-0-c28e8ba38a9e@ti.com

---
Aniket Limaye (2):
      dt-bindings: interrupt-controller: ti,sci-intr: Per-line interrupt-types
      irqchip/ti-sci-intr: Allow parsing interrupt-types per-line

 .../bindings/interrupt-controller/ti,sci-intr.yaml | 44 ++++++++++++++++---
 drivers/irqchip/irq-ti-sci-intr.c                  | 49 ++++++++++++++++------
 2 files changed, 74 insertions(+), 19 deletions(-)
---
base-commit: a66191c590b3b58eaff05d2277971f854772bd5b
change-id: 20260116-ul-driver-i2c-j722s-48f223899dbd

Best regards,
-- 
Aniket Limaye <a-limaye@ti.com>


