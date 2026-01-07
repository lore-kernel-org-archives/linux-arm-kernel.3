Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE3ECD5858
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 11:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vgtfkIJFCFfdBIxZ1NacwLdBLzeQ4/rU5s7Xr3EbC8M=; b=gmLcfrxkATK87+jFUeyD9okVne
	WEuInkADWdS61E8/8QL0yZBvgt67QblL3OfFktpkSFFeG3tEkcdF7w22T6up+WGdsaa6eJs2oQT0R
	zjCUDKQV+QNESf6XxL7Yq9+lr0TXp2T/0W/e26NhHsOkrG9Ju/1r5K5ffGKLrTG3VsAv85xsK3Z3b
	3IIkPR8N+jakywRPVTAlT4zNkAG0KJvRSBZjZLPOIK36dK7mCIKZWWh+iwEZ5YXW5zlFXzSMa9ERk
	71L1i7xTIDrmkhgq4TGKpdBe0Rf2S8IsJj0PGL5oMl/pBEv33kE2nsx9ee2VxHuSdbFwht2jJ7ivS
	V6RWaE4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRV1-0000000EoC4-0N1s;
	Wed, 07 Jan 2026 11:14:47 +0000
Received: from mail-northcentralusazon11010063.outbound.protection.outlook.com ([52.101.193.63] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdRUx-0000000EoAj-1zYr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 11:14:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sqXTVAIuGGxIMt65IAD88+9WeKsL2cgZRlcz9Hrwm5e9qdbVl+FYSu19Rr1RJ2QYlBahi0kJkf2ntZ3Qsg/plr2J/p7NbjURcMDAvRTEx8K9hcjYIJ9Y1Gk07yNr0Q7byVSHHI+AuJIzZqa8MJT1bxFpmhNdYVjOTzglx/EcHqC+lVCJINdtU1V3qst3vWo6dEM2s+vT4si8OsSmV9qJjjeKsCG98tf9UeqzVuAai8QoI7PV/rL/HSLPDsLa/+Ou5LPhs2Ll09JOPpd0AA+zV+YtQFqBS1V3+jMmQV1DN55/tDUmqib6TTliwmPvtCqMr6s4lVRIymOjyBXP8ZFGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgtfkIJFCFfdBIxZ1NacwLdBLzeQ4/rU5s7Xr3EbC8M=;
 b=Z9qWkYuCK2KRBOAZ/Vw8JxVd5s8yG8/47a/gNXa0bJIpq1FBr91GgU43GAXM864C/3CXvgli8VJoJjr1lBEotRNHyEtza9jlIcATk0qXnMFMIK3f5E8MamZ37JwFcX7O4uDsDwlGNLj54wKJyobedermD/Alc6RyW6qrDRgkRNlrKGTRf2UnaDP+QJ6ZKcSe4PsqwNBTJe4+bnZurEsNFsJZZlecV08HgjHBFDS+VpUQ5vBO84tU2UQPPNQCcQfJQ6IAgQdF2L7fbuwCfY6GmVI+DKzl5DbIdiQ0hpB4SrongaM5sa3oC73G/pLI2uHb4aG6QqBu4bSetyEh5Zpofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgtfkIJFCFfdBIxZ1NacwLdBLzeQ4/rU5s7Xr3EbC8M=;
 b=t7tPg4O2vbwTmzq1kTctWjeP3F9yHqgd5FnZcMdFsW7xcJxo3EztDn20sgmaU6Axt1TDU0R0GFRM6Aw7xW3VwjnTccpVNfNDUL3FaNChlbfujCH5+xZkFyUVFWhFysLi5kPUiZNQYND0mOgcLIIjAd949Aw2pz1T2YxV/pIuz9c=
Received: from MN0P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::34)
 by SJ1PR10MB5953.namprd10.prod.outlook.com (2603:10b6:a03:48c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 7 Jan
 2026 11:14:37 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::b8) by MN0P221CA0014.outlook.office365.com
 (2603:10b6:208:52a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 11:14:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 11:14:34 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 05:14:27 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 05:14:27 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 7 Jan 2026 05:14:27 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 607BEQSm610971;
	Wed, 7 Jan 2026 05:14:26 -0600
From: Anshul Dalal <anshuld@ti.com>
Date: Wed, 7 Jan 2026 16:44:22 +0530
Subject: [PATCH v7] dt-bindings: arm: keystone: add boot_* mboxes to ti,sci
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260107-k3_syscon_add_boot_mailboxes-v7-1-d97a943f0a52@ti.com>
X-B4-Tracking: v=1; b=H4sIAA1AXmkC/5XQTU7DMBAF4KtUXmOUGf+z4h6oiuzYphY0RnEUt
 apy9zoVgmRDxPLN4ps3cyMlDCkU8nK4kSFMqaTc16CeDqQ72f490ORrJtigAGgE/WBtuZYu963
 1vnU5j+3Zpk+XL6FQzQU67402EkklvoYQ0+XBvx1rPqUy5uH62DbBMv2GAf6GJ6BABRqLKiI0S
 r6O6bnLZ7KoE64l3JGQNtQG10HgyjEDG4n9R2K1k5QghOXIpO82Ev+VcO9tE6+SDggyOq0N33Y
 SKwn2JLH8yeoYhFTRs60kVxLuXSer5Ayz3poInqsfaZ7nOzKhcME3AgAA
X-Change-ID: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Anshul Dalal" <anshuld@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767784465; l=4166;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=pPcvIGTIGV6Uv6PoBjCOYsKIcDZRuaYofyBWUBZAtAQ=;
 b=JNRVnC70cMWhFfA+wtfit5y/U58G/NBK+SxnL/WJ6K+b+MnZeusJEZrxEl2BhSfc3rfMaZFVV
 530q/r6o4v2AKw3ckCQXlUmJAfFK54TbSBDmYf2XqWArRRcWZGMBKH8
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|SJ1PR10MB5953:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b6c3aa-8046-48fa-c08c-08de4dddf069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEZKTHh5QktmL1dRMlJ6NnkrcnB5YktBYnp0ZHJzdEJjTDJWdGk3SmhEaFc4?=
 =?utf-8?B?RDhjR1pBbFlyRjhNc3A4ZVovUTdIMWQ5TVhOa2FTTk5pcUVIU2JDR0tML3FW?=
 =?utf-8?B?YUdmVUZ1bnpGYjRsRDdSOTBhd2t3ZTFVRWh1MGEzY0xFRWRYYk1mK09lNUJK?=
 =?utf-8?B?V2JGamMxcWQyZWxSSDRJTzE2eWpzdmFrZkJhUElJc1hENXVtbjNmcEdDUFRy?=
 =?utf-8?B?WnVqVkZuM1ZLeUd5cDZOVmczZTZkVWxRYmxxdUZya0xvMmtWbXFhZXdKSlow?=
 =?utf-8?B?cEl6eTA3U2F2L1lYOVpITGw1SzlIWWQ1REt6KytMdG5vNSsxUUFzSEJ3c25Z?=
 =?utf-8?B?NEhmTTdrRzdacGhvNDFUMU4vVTE0UG1KM0dCV1dkT0FWNFNSLzRKQUcvWVpH?=
 =?utf-8?B?T2ZpZi8yb0FGbE1teWkxVkp5WU5qNzROV3ZIK2M1NERIN1JuZHZueFU1UDdV?=
 =?utf-8?B?ck1laDJJRGlxei9wY2VlTG5sanBQM3RpR2tzYk5pMWVtVDN4NFRMdkV0aERM?=
 =?utf-8?B?TngzelliejdKdGdYdFB4WG9XLzJ1T0REeFFqLzhkUTdCQ0l2WVZvWHVFRitT?=
 =?utf-8?B?WHNSb3lteTh5eFVsVEl5SUhIaWNWUXJHeERVQnRLOTYydkFPNmNrYTJpZ21Y?=
 =?utf-8?B?NERwelNiVzRScytCNytuc0c4b0tOcCtUQVl6RkhQdHBkWXc0QVRGdlRVY2Vn?=
 =?utf-8?B?Z1gwWW9NVEJJakpvWEFBN3p3NVJBV3JSc1JaSDVnL0x1NDF6bFlVamQ2Qmx1?=
 =?utf-8?B?MUl6dDJTc2p4ZXpyY0lZUTVEaUhRV0plQXoxS2hrQ2swSUhqUTUvQ1l1ZzF3?=
 =?utf-8?B?bm1FRGZZa0pqczNXRHIvTG9QdHFEa1dDeVVhQW9XNk9EOEhDYzdubVB5aUVJ?=
 =?utf-8?B?SmxCaEh4SlRRK3FLdTA3SG1WQkd6dnB4Y2lGa0dvQUUzQjAxZnVTRVR6Zktp?=
 =?utf-8?B?eHo5Qm81WXVRclQzMDFpZnBkYUhnM2dyK3ZvVHdUV1hudE5YWEVpZWZtM2F1?=
 =?utf-8?B?Rzd4U1drR0lDT1hWdS92TG12bW5yaGZHT2hiRVRESHBORml4aEV0K1pMOURN?=
 =?utf-8?B?M1RWbXhLVnNabGRkZmFRcURwUjMvSldoSXZRRHBaWVNqWDFvRmdwbFBhL2Z1?=
 =?utf-8?B?eGttaHFTNWh4L0xVZXVRRFN2aHlQR0NWamYzRTgxQ1E5ei9XMG80YlZzcHJw?=
 =?utf-8?B?TmE0OEs4NXRQamZlT0IzdElyS1hWOWV0Um5vVUdMRjJEYXNqMHlKcEhYd0Iw?=
 =?utf-8?B?QzBZby9GQjQxNk11dndpUGd0Sk5mS0dVeUZScXQvOU9Ja3ltWmhkK3d5VGJo?=
 =?utf-8?B?cXRPM2FBNkdqNVg3ZldHM1U0SExiWXhNdE1WUmdScnVFQWZycEVla2loeEF6?=
 =?utf-8?B?N2d3YUpWZjF4RENHVmRXZFJuL3Zxcjkzand4L1ZSSG13SDRjME42TzBLSFdK?=
 =?utf-8?B?aEt3NHhMZGtyY1I3UzJJcXRtbUZsRGhJUmhGMTZlaU1CaklpUlFOQTV4cVVY?=
 =?utf-8?B?TzR0eHFvOGU0QmVLKzJhcGVMOGlQbmhIM05YQ3I2TVdjaEdTeWtSdHdxL3ZD?=
 =?utf-8?B?cjdXaGc3SlFyeDdtM2R5UFErSGROeVpDaTd6Z2RSdkc4eFp2VkJUUGZYMitv?=
 =?utf-8?B?UFJNQ1RDUDc1ZVczUS9MWXd1bFZMLzdMWk1OaDd6NmpiMnIrRVRoNkRGZ2ts?=
 =?utf-8?B?cW52ZlBHZ2FvMy9BdFFScFI1bXRNQnpzTjg0VUxRandrZWZVR2dwQk94enpN?=
 =?utf-8?B?WTJ5ZnV6bkpRdXVyaWtjYnBIUVlXZzBEb0lpdHdEeEF5b2dTcVBZNDFMUW1T?=
 =?utf-8?B?UVdENm04NjVkdUNXZkpJSldLZ01kdm5yWUhCYWkvbEV4VHZRZkhYenlvMGpl?=
 =?utf-8?B?clNUZ3pMNGloOHlSRmZrQm95clYrQTJhTE5ROXFyaWNJbW9tekt0RGtkZ2Rn?=
 =?utf-8?B?WjFOUUZjRlBVeFlQTGZKN2pzYXZtQlBITk5QbEpPb3R5WldqTFZwMVFIcGVw?=
 =?utf-8?B?dVlYMGloNkVvRFZlcnl5dHkrQjhEWW9EUHNTTnVoc1NBSVFhV3V0UWZxSkRN?=
 =?utf-8?B?TUt2dFoxL3RHc2FUcElvOURZem5mZldLanF5RTN3SlE0RGNOb0dBVjFBNXBI?=
 =?utf-8?Q?jJipvM01th44ihcBA4It6DjlG?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 11:14:34.8550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b6c3aa-8046-48fa-c08c-08de4dddf069
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_031443_526732_BC410A90 
X-CRM114-Status: GOOD (  16.66  )
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
if the matching compatible is ti,am654-sci to represent the mailboxes
exposed by the hardware during boot for the purpose of loading the
firmware.

The newly added mboxes are made optional by keeping minItems as 2 to
remain compliant with existing device-trees. The new 'notify' channel is
not supported on all SoCs and is therefore kept at last in the list.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
Changes in v7:
- Removed ti,am642-sci compatible
- Keep examples unchanged
- Modify ti,am654-sci ordering to ensure compliance with SoCs without a notify channel
- Link to v6: https://lore.kernel.org/r/20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com

Changes in v6:
- Added ti,am642-sci compatible to represent SoCs without a "notify" channel
- Added new examples instead of editing existing ones
- Link to v5: https://lore.kernel.org/r/20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com

Changes in v5:
- Added commit description for the optional mailboxes
- Link to v4: https://lore.kernel.org/r/20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com

Changes in v4:
- Make new boot_* mboxes conditional on ti,am654-sci compatible
- Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com

Changes in v3:
- Drop [1/2] of the last patch series
- Update existing example with boot_* mailboxes instead of adding a new one
- Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com

Changes in v2:
- Remove maxItems entry
- Remove RFC tag from patch (added by mistake in v1)
- Document the new mailboxes in mboxes instead of mbox-names
- Provide example with all the mailboxes set
- Update commit title to have "ti,sci"
- Split into two patches
- Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com
---
 .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 42 ++++++++++++++++++++--
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 25a2b42105e5..e3f3de0192aa 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -51,15 +51,15 @@ properties:
     minItems: 1
 
   mbox-names:
+    minItems: 2
+    maxItems: 6
     description: |
       Specifies the mailboxes used to communicate with TI-SCI Controller
       made available from TI-SCI controller.
-    items:
-      - const: rx
-      - const: tx
 
   mboxes:
     minItems: 2
+    maxItems: 6
 
   ti,host-id:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -79,6 +79,42 @@ properties:
     type: object
     $ref: /schemas/reset/ti,sci-reset.yaml#
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,am654-sci
+then:
+  properties:
+    mbox-names:
+      minItems: 2
+      items:
+        - const: rx
+        - const: tx
+        - const: boot_rx
+        - const: boot_tx
+        - const: boot_notify
+        - const: notify
+    mboxes:
+      minItems: 2
+      items:
+        - description: RX thread
+        - description: TX thread
+        - description: boot stage RX thread
+        - description: boot stage TX thread
+        - description: boot stage Notify thread
+        - description: Notify thread
+else:
+  properties:
+    mbox-names:
+      items:
+        - const: rx
+        - const: tx
+    mboxes:
+      items:
+        - description: RX thread
+        - description: TX thread
+
 required:
   - compatible
   - mbox-names

---
base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
change-id: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962

Best regards,
-- 
Anshul Dalal <anshuld@ti.com>


