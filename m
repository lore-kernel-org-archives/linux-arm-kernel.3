Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D9D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:CC:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlITydG0VPKKgHKEoMPeIzEjx1OwozLNfXIPF6PpkBo=; b=FIPxuRfaZbUB8AKpkC2EZ71ncJ
	++oQrX7uqLPnhEDrG5xpMxhtLKmkmYFD4+aWmwc8wx6001Y6cgjiYcv1aSKG+bHgnvErtsy4Iqp4Y
	sToYKzKkPZFuWGZDJt12ryngza46jtLIghHqld+pBZl6B7unGXIFo+lwvAlBIyXzT8pUU6Qd58pXk
	vZJZFooQeh1tVAS32NHbL/TiILn+4KUEK+rtwrAgGLToM1iQ7IWibjHWZxXno1MZu/6DxIHAO8FxG
	tGGUTLAaN/j7GbmGHOrB9R4PY1I0xMg/sq8/y+27JyUrBqSkJQRX9LJ2QVssFJPVFL172aVwAgspj
	VDNdkUTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0kQ-00000003Gtb-3VGh;
	Mon, 01 Dec 2025 10:03:10 +0000
Received: from mail-westus3azon11012012.outbound.protection.outlook.com ([40.107.209.12] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ0kO-00000003Gt9-0INh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQH4pxAVCFRqR+VgykhCwdWwX5ikrr8GFFwqHRMXXkIytzg4tA4OOavH/XFoUT2t+xmutvg/5aSuAYvg/vIfDw28ZAy+WYI8DN+zIkJeekoiDfxQv+8frV4DS5XT4mSD4DVnOJU9RBc9QA3T4WOSwDmC6NA5q7uA1knpajAy2USVYiy0duGGo64VYUN6g+rZNfkSHBqX62SEPDXPZK6fkz1K1w3JUZHL75IY69omyfHHwF0CV7uYPe8rppuoW5cicq4bpTZV5x98+XMlWhdczyU0mLNBUUwbuhCfLNtSNNEYafUOq9qW0CNf0Td7DTy9CBTaTOT9Eu73y29D4I0ESg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlITydG0VPKKgHKEoMPeIzEjx1OwozLNfXIPF6PpkBo=;
 b=daNXCD3DHGh9/PGi96KOF8ddksvtmxrA5otwvJD73tmVVzAPspM0/QsutspfE9EmrqwXmJ7nOtqf00omoTGb3pW3eEnV9SCfGzTGKiSLtDZYKNZs3x9Swrt32gYo4WpwoB493KsrmUxQwO/diygRkIwJZz3rfrDf88W9biKDvqN6KdgPmgBFrAKtd3aaP7gJowqMA/q8h1RGHB9zdLcaXQkZlIh2j2wji3qMQmL70MCqOmyVYfTfpJ4xCHrtaw8imhmI+7bAfQ3As7wpEYYGn+gykR1n8XWjtmKFvW6j1wojzlRWiWykRt0mUsS9UgrxZMy7cQfO79QXlZbzCmZxPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlITydG0VPKKgHKEoMPeIzEjx1OwozLNfXIPF6PpkBo=;
 b=TMu0bQklVl28PIb44e7iOrixSJjp9Y1IEGvNrkBn7P4mRXtaXFgjnzSYvm1S9tzcv0A9Gmwr0L8L9pJxNS0O7TjP/YKBSNZ5y9r9u7g3/dZtg01y48hAMCXKn7izrivAtTrrMzn8ll2Ndwiap0m+b5bIrU7YN//mARg/tCxxFBY=
Received: from PH8P221CA0043.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::23)
 by DS7PR10MB5928.namprd10.prod.outlook.com (2603:10b6:8:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:03:02 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::14) by PH8P221CA0043.outlook.office365.com
 (2603:10b6:510:346::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:02:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:03:00 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:02:57 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:02:56 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 04:02:56 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1A2tIj238147;
	Mon, 1 Dec 2025 04:02:56 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 1 Dec 2025 15:32:55 +0530
Message-ID: <DEMSLNLDXSNY.2CMMGUMUOYA9T@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v3] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
From: Anshul Dalal <anshuld@ti.com>
To: Nishanth Menon <nm@ti.com>, Anshul Dalal <anshuld@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com>
 <20251112152806.zsinwwzaht2ws2wh@headpiece>
In-Reply-To: <20251112152806.zsinwwzaht2ws2wh@headpiece>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|DS7PR10MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: bfc704d2-b537-4b55-32f9-08de30c0cf3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0x3NFlFbEZGM3ovYkU2SEtOb3pNbVExN3ZLNmRWSTd0c3A2K0NNaEhpRnUz?=
 =?utf-8?B?Z0FpUlB1dTg4T1hOelordDZVODRxb00zOWN6Rm9xSG5jQk1wRUZZUVQ2NjIw?=
 =?utf-8?B?WDRmcitsOEovZ01SR2ZsNHpPWVlia2N1U0E1eFZaMGQvck9JSklZek1pN1B4?=
 =?utf-8?B?K2VZalBkbVdwakJuWG5mL0s3emZIMFdUVGNuK1E3ZWdYR3pZV2VVOTVLMWE5?=
 =?utf-8?B?OXR5ZDl5elM0bUxNVGl1d0pqNVlLSWZSUzAwWFl2MWdibCtNc2FBVzBrWGhr?=
 =?utf-8?B?eWR5TmdtSHFibk42TkV4U1BNS2hVYmpRaVZJNmgxUUM1OHZKdnNOVHQ1MXFj?=
 =?utf-8?B?ZFdhWXVmaTlLSWtNb093UCtjS2ZVVnFIYUhpTHF6VVltTVBTUWVYaFMzY05u?=
 =?utf-8?B?d0ZkWmUwZEc5M0p1b1hibmQ5cnlXMVFRZDRPYkllRWtiNkRTYzdSMjJ4OWds?=
 =?utf-8?B?RGZGa1QvamVyUlhvUDJZS21veHg0SDdrY1ZsUm95MXRubjkyS1NnNlB4WTF1?=
 =?utf-8?B?REJtbEZUeUU2UHQ1N0VKdVUxWmprUFA4WlYvc0F0RXRYVU9aSGJyR2hUa080?=
 =?utf-8?B?TnA3MGYxa3g3dHIvLzJMMW9OL2lFTy9Xell6TTVheDRKTm9jRlhwUkJ1ekR4?=
 =?utf-8?B?WVpVakJXMVFWRUxNYnFTb2o3QUdsOFdQbEZZMmV2SmgyMjdGL3YxSm1wL3VQ?=
 =?utf-8?B?aXM0clhBV1Y5ZmxpaDBzbGZTNHkwNTJNc0xHZmhDcEVWaVJVcjVWZG1EL0l0?=
 =?utf-8?B?UStRU3JkT2svMXV1ZUhlaVpGbDl3NkRrME5Hbm5FQ3dENzFBWit1M3Frb0k0?=
 =?utf-8?B?aThHWXd0QmJhbVY1d1VPVzFsM05tT0ZCR2pmN0h4cENoVEFtNDIyazB1SFBq?=
 =?utf-8?B?eUFvTVRLcE5QWDJtQlNNMXVKMndCemsrQ2IyNG9xUXF6WWE5QVplVmdSR1Jk?=
 =?utf-8?B?QitJOW01SXhNQWtuQ3grYUZxZjczVmNkOU5vZkh4QThxYjJzeXN5TlBNMnl5?=
 =?utf-8?B?eXRNbGQ0SlU0S0VmNWtRbURZajBFQTZDQkpERmFGYUcyMnlocnE1aFkrL0ph?=
 =?utf-8?B?UWpObXYwWnc1amRwZnZ2bkh6dDFPMnAydTlHZUJCdkdGUnR4OExBV0JwSVEx?=
 =?utf-8?B?b29nM0N5NU13VkJQbUFUelNzRUp0S2ZzY3A5SVBUcG5RMEFMNnBiNTRJb0E5?=
 =?utf-8?B?NVZ1eGZwWlVhMGxRVUlZSkdLWVQxT3JueWpPYmp6Q284TEdhblFOSm52RkRF?=
 =?utf-8?B?YVI1UitMTnMxem1YZUxrOUcyRVhnQythQjhncTI4bUZ3QW9HWEJaZlllNkQr?=
 =?utf-8?B?cEdwQWh6TWNDWnRVbUxLbmRxeGpiaXZrMnUzSzRyZ2ZaamdqZmw3UFFWME9o?=
 =?utf-8?B?SWpobkt5dXpnSXJpSTZhNlBvc3RocVh4VEhCMUlrYXlJMi9MQWVhTWdVSzRz?=
 =?utf-8?B?ZGd5TGhxV0RadXJ5alMvT1pEQmQvQkMxRnU3bWhYVTBuV1Y0cEpZaXU0Q2dq?=
 =?utf-8?B?bCtBNGRNUURHVGk1RmE2QVVxZ1JaRlBYOHlZMERjQXV0TXBGK3FiaTkrU2hN?=
 =?utf-8?B?eVVvbm01emxyQm5tcWc5VE1hak1DZnU0WHVJdVBlRjdVVmgrVTlheFFLbUQw?=
 =?utf-8?B?R2VkK3pIcENIS1VSUFZJY0hucGlNT2F1YW85RCtSemhnR1grSDhMTlFyYVlk?=
 =?utf-8?B?ZUpHbGlZV0FSSllNeVQrOGF5Y2J6MXBzdjFNdmptN2dGNms4cFQ3RjA4Vzk0?=
 =?utf-8?B?cVlxN0tHa3UvSEN3bm5qQUowbk1nVENkeXRjWGpzb3BxM0w4enF0cDh2a3Nn?=
 =?utf-8?B?dmJMNGJpZzJHMjlIN0o4bTVUNTNZanRzNjdHVWJtSGZPdUQ0R1J3eTJhZ2p1?=
 =?utf-8?B?T04vZ2xoSHMwcCtoem9SMmwzenVrSHgxbUdSU211eVpWTU1aeVJ3bVdlSWVB?=
 =?utf-8?B?Wk1hcVZrWE9vZmptN1dwQktmQ2kyR2Z6OW9VdldNT1AyWmI4bjg0RWRHV2lF?=
 =?utf-8?B?ZjIrdTZ1QjVEMzJkdHh3L2cvL05ybTNhZ2JibElmcWxkemlmdUJwQWJRTUJP?=
 =?utf-8?B?eXZTeUxOM09vQTJCWFdFaTE1RVUvU0I3bWUyNnlxZmZpN0RhaDlNSnhtaHVL?=
 =?utf-8?Q?/oTo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:03:00.1210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfc704d2-b537-4b55-32f9-08de30c0cf3a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5928
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_020308_118994_1D29B8EB 
X-CRM114-Status: GOOD (  22.50  )
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

On Wed Nov 12, 2025 at 8:58 PM IST, Nishanth Menon wrote:
> On 15:54-20251112, Anshul Dalal wrote:
>> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
>> which might be different than one's available to the kernel (firmware
>> spec).
>>=20
>> Therefore, this patch adds the missing mailbox entries to the DT binding
>> to represent the mailboxes exposed by the hardware during boot for the
>> purpose of loading the firmware.
>>=20
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>> Changes in v3:
>> - Drop [1/2] of the last patch series
>> - Update existing example with boot_* mailboxes instead of adding a new =
one
>> - Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mail=
boxes-v2-0-aebc1e47b391@ti.com
>>=20
>> Changes in v2:
>> - Remove maxItems entry
>> - Remove RFC tag from patch (added by mistake in v1)
>> - Document the new mailboxes in mboxes instead of mbox-names
>> - Provide example with all the mailboxes set
>> - Update commit title to have "ti,sci"
>> - Split into two patches
>> - Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mail=
boxes-v1-1-529a27f21076@ti.com
>> ---
>>  .../devicetree/bindings/arm/keystone/ti,sci.yaml      | 19 ++++++++++++=
++++---
>>  1 file changed, 16 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml =
b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> index 25a2b42105e541cb3c8ad12a0dfec1af038fa907..be8a5b2b051b441884795059=
c70892910d981130 100644
>> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> @@ -51,15 +51,27 @@ properties:
>>      minItems: 1
>> =20
>>    mbox-names:
>> +    minItems: 2
>>      description: |
>>        Specifies the mailboxes used to communicate with TI-SCI Controlle=
r
>>        made available from TI-SCI controller.
>>      items:
>>        - const: rx
>>        - const: tx
>> +      - const: notify
>> +      - const: boot_rx
>> +      - const: boot_tx
>> +      - const: boot_notify
>
> Sorry for joining the party late.. just saw the thread while happening
> to glance at the pending list..
>
> k2g does not use boot_* mboxes, the load mechanism doesn't involve
> ROM talking over mboxes, we load the pmmc on that SoC! ti,am654-sci
> onwards does. This would be a good case for adding a conditional
> property, IMHO. That said majority of the K3 dts entries still use
> k2g-sci for k3 (#facepalm.. i should have caught it, but missed).. but
> that cleanup is for follow on patches that could fix.. driver seems to
> be able to handle the same.
>

Should we therefore have the new mboxes be conditional on "ti,am654-sci"
while k2g continues to use the existing "rx" and "tx" mboxes?

Something similar to:

	if:
	  properties:
	    compatible:
	      contains:
		const: ti,am654-sci
	then:
	  properties:
	    mbox-names:
	      minItems: 2
	      items:
		- const: rx
		- const: tx
		- const: notify
		- const: boot_rx
		- const: boot_tx
		- const: boot_notify
	    mboxes:
	      minItems: 2
	      items:
		- description: RX thread
		- description: TX thread
		- description: Notify thread
		- description: boot stage RX thread
		- description: boot stage TX thread
		- description: boot stage Notify thread
	else:
	  properties:
	    mbox-names:
	      items:
		- const: rx
		- const: tx
	    mboxes:
	      maxItems: 2

With the top level mbox* having a minItems of 2 and max of 6.

Regards,
Anshul

>> =20
>>    mboxes:
>>      minItems: 2
>> +    items:
>> +      - description: RX thread
>> +      - description: TX thread
>> +      - description: Notify thread
>> +      - description: boot stage RX thread
>> +      - description: boot stage TX thread
>> +      - description: boot stage Notify thread
>> =20
>>    ti,host-id:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> @@ -90,9 +102,10 @@ examples:
>>    - |
>>      pmmc: system-controller@2921800 {
>>        compatible =3D "ti,k2g-sci";
>> -      mbox-names =3D "rx", "tx";
>> -      mboxes =3D <&msgmgr 5 2>,
>> -               <&msgmgr 0 0>;
>> +      mbox-names =3D "rx", "tx", "notify", "boot_rx", "boot_tx", "boot_=
notify";
>> +      mboxes =3D <&secure_proxy_mcu 8>, <&secure_proxy_mcu 6>,
>> +        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>,
>> +        <&secure_proxy_mcu 5>, <&secure_proxy_sa3 5>;
>
>
>>        reg-names =3D "debug_messages";
>>        reg =3D <0x02921800 0x800>;
>>      };
>>=20
>> ---
>> base-commit: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
>> change-id: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
>>=20
>> Best regards,
>> --=20
>> Anshul Dalal <anshuld@ti.com>
>>=20


