Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD71ECEBF88
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 06:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:CC:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9vi0QJ0M5pziBiXs19Q/RK5qdux00oTKd+SYt7fS8w=; b=vpuT4uq79aSVmhXmJCFlhQA68H
	xYQCfe/tP6QOa1ge7/czPKaR84pL/TMAaQXZPAxJFYjBlu9inYpIgN4pYlfeYMoTlYTddD6wmDqsZ
	nBr4wAi1Nt8U0nnXzss/8r201X0N1h+RslgfDaJmJKdJI0+ZO08kJa6CnmPf2UYncdWkqTK0CUNd0
	FzLhkjTvnh7ml8kxAx11gHox+qTcjMV70FLYHo2BKsfe51xmr5OiwPGnzfVqBuNJVoq7sjeeGodfL
	Xrwwt94hhhz2ni/hCdwF7V9FfnMaSRR0Rqy1j73APiCQWLfcgSdkOXBl5EQxrfi1+ceFJbFYxrgtb
	JgGjq0bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUmw-0000000ChDK-0TRS;
	Mon, 08 Dec 2025 06:32:02 +0000
Received: from mail-westus2azon11012006.outbound.protection.outlook.com ([52.101.48.6] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSUmt-0000000ChCD-0lBv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 06:32:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvQwnyE0gF5WcVDU0Ag+AbEfu3Vl4KlrmibSrd33j4NY3PTYH3Bw0ZPKWimcRBM74gKZOd1NzBERjimb8jAsy7aU2kDM22C82iWU6paF/I2I5PbpscVl1EDtEgVqnD0o0Q8lYhi4HpaFcjesZXSCFATTvwPejO8bWo0qWc9r2/BbEWJA8T6oQSU4nKF4tJuRDWRf2BEcEStUkAGKpujralIFhj8pME8JfAP6hqtUkrpDfQVblBctdQX4Aw+KI0cgvgXSuLronbbrEu+7td1sIc9nyeGeW4qOBsFmx2EhmJp1w73SgHgXJ91FAFYGWTVGivctTMdARRAVxto0PKFmGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9vi0QJ0M5pziBiXs19Q/RK5qdux00oTKd+SYt7fS8w=;
 b=NW7KYvf/Yz6si9iBd8H123KAbxfo/wGB52XVV1zZdtRuIVWYLZ/3HGrSIbPYz8KBtSaRhzo4at4GooqX+aj5vErIOQVHOvuaIToviv2HygShHKQQsNLRmAf3l04AI2zoaeaqJvecp5LMQd/s6NEWtaU3RKm/UjvaMMU83SHkKfwCNxo1A8j56IUkpGZv2eXVshWCbsMhVzPuc2wUegKWh096kEx5g/SkaRytC0yK2zlL4jGTFLTL6wIO9uQXQPyZZ0e7VEinkHEFHZVyt7ddFb6+4RC/PmxDKCkW1b9LQW0YIzYsRi7w1jyqfPAMLXa4kJ8ffqTFlZB++vKDS2EQzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9vi0QJ0M5pziBiXs19Q/RK5qdux00oTKd+SYt7fS8w=;
 b=Gj2CEZ9IM65WnM2C7sw5lxSJ0Z3ZTlN5F5bXnGsBcTWbJV4qzi7K+QNTGiMux90Gr/6l8x4aqYeYqALwc6jHyiV3TdSNfX2JMczDMVQ5ZvRZDNC625qzgg3ABZhfqXLVlCTKd9mGszbwk8i0St2lqyCq+YgvDru6pZr0tE1/ack=
Received: from BL1PR13CA0163.namprd13.prod.outlook.com (2603:10b6:208:2bd::18)
 by MN2PR10MB4352.namprd10.prod.outlook.com (2603:10b6:208:1de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 06:31:53 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::6c) by BL1PR13CA0163.outlook.office365.com
 (2603:10b6:208:2bd::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Mon, 8
 Dec 2025 06:31:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 06:31:53 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 00:31:31 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 00:31:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 8 Dec 2025 00:31:31 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B86VURq3175391;
	Mon, 8 Dec 2025 00:31:30 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 8 Dec 2025 12:01:29 +0530
Message-ID: <DESMHL7FCYXE.3TE3SG6TDVJ39@ti.com>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH v4] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
From: Anshul Dalal <anshuld@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Anshul Dalal <anshuld@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com>
 <20251208-abiding-hedgehog-of-lightning-2fe7a2@quoll>
In-Reply-To: <20251208-abiding-hedgehog-of-lightning-2fe7a2@quoll>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|MN2PR10MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: 321ef47b-6883-457f-3c75-08de362379f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDlDaDdCV3RrN285ZTJhNXlQdW5VNUllRDJ3RVVtd040aWhjOFgyRnFqbk9J?=
 =?utf-8?B?a3l5ZzgyZXlIU3VGVVdYUC81TGtnaXNFVk1ZSVhmMmJDeVhDV2JkeXhUNVFS?=
 =?utf-8?B?ZEVoS210cWJWMUs0L1o2ZHJRcy9xa2orU2YvNkJvKzYvU0xyV0o2YWNZL2RD?=
 =?utf-8?B?NUxRaGFrRnc5Y1BVdEtoSURUR3pucm8rTkpTQlZ5RTNpZjJtQU1tZHU2Nyts?=
 =?utf-8?B?R2JxWjEvS01jNno5VHdYbnBkU1JTaGJJS2VUYkZZTUNQUVFRTisvejYwRHRq?=
 =?utf-8?B?dkxsRWRNb0FiSXRmWk5DM2tQRnR4OHVOY3RDQ1VSLzdURVBseGJSRkJ4MS9o?=
 =?utf-8?B?ZjVORUtrNTllYkNSSytvRlBZSjNIL2lsd25ZUURyYWNHc3Y5aTdHQThVd3VE?=
 =?utf-8?B?aGNiZXE4aDJrMEpQcTltMzNub3VqRjcxZUZrNXhMNXk0Y0E2Y3pZQTQ4LzVt?=
 =?utf-8?B?NHhHaWRvMytTVERQM3VFY2FVRStvU3FmU1JVVzRyOE9DdVZqWlJ2ZHkyVXg4?=
 =?utf-8?B?dmh2WHRSOVZuNWIzMmE3bHIrdUtQRFpGZUZ4T2dFZTk1WnkvdW5sN0ZyemJK?=
 =?utf-8?B?TWE4VHBOT241Y3BBcHlwK1FuOFVEZDdaTUx6RXpoWUEycU0zSVZVT3Z5VDlK?=
 =?utf-8?B?YWdwWFVkL2QwRFpJVVc3UG15YXNGb1gyY1dMbnAwZlV6NXRKYnhheHNacmRC?=
 =?utf-8?B?TWR2ZGlzbnkzM0dzemZUOUNldXdBdDFsS1NqWSttanlJSFA2SmNwOUFpc2Vh?=
 =?utf-8?B?YWR2L0MyYXJsd3o2KzVQK0x4OHVlSnJqcDY4T040YkJnQW51OFlRSzNDRVNw?=
 =?utf-8?B?MVZuLzZuV2E4Umw4UWVzdE9peWNGNUo4NlJob0VYKzFWV0w2UjBTL2hjbFpl?=
 =?utf-8?B?Wm5OSWYvL05wZ243OE9zYStqaUFBYmxLaVZGakt2bWtMQlpNZlVEZTdKbEV6?=
 =?utf-8?B?aUQ2ZkxZakNQb25Vemd3bWp5ZmVEdk1qOEtrTmV1ZG1KTUtOMEFsUWVzNDdK?=
 =?utf-8?B?K3dXMk0zTmFxL2ZTN3NTZlZFaXkzeG1UNXErd0pWMENFSlI1SVRwWTB5SXlq?=
 =?utf-8?B?Yng0M1RLclFONnlPbFdOZVV3NCtHYVB1ZFc0ZEZHMDF2M3hNQlZmZ0lRQUxN?=
 =?utf-8?B?Y2RMaUo4Z0VweHU3ekpSdjJ4WWJDTHNvUzZpT2J3akdXQzhCMG01cjNrQXY1?=
 =?utf-8?B?ZTFvdURqVU0rejk1SEE1ZTNwTk1tRlNZdGo3eER6cFpJV0lOakNKYnhRWGQ2?=
 =?utf-8?B?Um5oREtWdU5jMFBtRFNUT0VmeFZiT0RUamxRYXYrdGk4bXlLS1dkK0Q4VllI?=
 =?utf-8?B?NExzMndFU3dDWm9qZVJRYzBPZEVvanljVUdtKzlYRE9OM0RZNUhSdHlmR20z?=
 =?utf-8?B?b2x4Wm9xTHAwNDU1RUlKTldQWUt2MG9qMGsvd005dHVkRXZZalhoM1RoeWNR?=
 =?utf-8?B?SlBFOVRabG9VdUhnNkcycWpaS0RtUnY1MUhBOEg1cWpZZTloMlBSbVdxTWk2?=
 =?utf-8?B?eVByOGJQTVVtaE5MRTJaZDVPZTNwVXliY0hUWTV5bnFFdUd6L1dpOVBFY0JB?=
 =?utf-8?B?U1VWQjB2WC9JR3ZWS3NzUVh3Y0huNWNSOXE3YzBGcWp3cTVLaGJuUEZIYWMr?=
 =?utf-8?B?bHJjaDZxUzFITEEwamU3ZEZwUHIxZGtPc2laSUxUMTBXa0FFVnBPbGtnOHl4?=
 =?utf-8?B?ZnJpVVhSTUFuRE04cHVOT1dTRXdiUUxGU2VGMjRzSm1nU2U3UVM5RlNQL0FQ?=
 =?utf-8?B?SzVaWTlpeUc0WkU1K0x0eTdxa3VqTWx5MkJXWXk1UUZIbUFCOVg5MWVzNE1H?=
 =?utf-8?B?eElhOFdMK3VMRlFOd3o3a0V3bHlmZUM2K1ZNU1ZOK2h5SERBRVgraytxTlpY?=
 =?utf-8?B?YXFxMWhxOXZ0UEpIZktsK3VmTkNkK0cvejQxSUxXODdyYStIdEk1VTlOT0Rh?=
 =?utf-8?B?bTdWSW5iaEJTdUlwR1EwVkxsMTA0eHVXLzRNSHlOMnBmZ0JWU2g1VER5V1JP?=
 =?utf-8?B?eTRQYUNiSlllWFI0UktQV1ROU2MzV0thb1JuSmpBaFJBVXBSNDNlelNqa0Qx?=
 =?utf-8?B?ejNxRFF6YkFXMnVqM1BRV0dKT284WXJmQmNpc2FtT3g2TldiMkx3WENhQURj?=
 =?utf-8?Q?JE3M=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:31:53.0189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 321ef47b-6883-457f-3c75-08de362379f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_223159_303694_D1C36BD9 
X-CRM114-Status: GOOD (  21.48  )
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

On Mon Dec 8, 2025 at 11:50 AM IST, Krzysztof Kozlowski wrote:
> On Fri, Dec 05, 2025 at 11:45:43AM +0530, Anshul Dalal wrote:
>> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
>> which might be different than one's available to the kernel (firmware
>> spec).
>>=20
>> Therefore, this patch adds the missing mailbox entries to the DT binding
>> if the matching compatible is ti,am654-sci to represent the mailboxes
>> exposed by the hardware during boot for the purpose of loading the
>> firmware.
>>=20
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>> Changes in v4:
>> - Make new boot_* mboxes conditional on ti,am654-sci compatible
>> - Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mail=
boxes-v3-1-66155a4236dc@ti.com
>>=20
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
>>  .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 50 +++++++++++++++=
++++---
>>  1 file changed, 43 insertions(+), 7 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml =
b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> index 25a2b42105e5..d9eb2a81e539 100644
>> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> @@ -51,15 +51,15 @@ properties:
>>      minItems: 1
>> =20
>>    mbox-names:
>> +    minItems: 2
>> +    maxItems: 6
>>      description: |
>>        Specifies the mailboxes used to communicate with TI-SCI Controlle=
r
>>        made available from TI-SCI controller.
>> -    items:
>> -      - const: rx
>> -      - const: tx
>> =20
>>    mboxes:
>>      minItems: 2
>> +    maxItems: 6
>> =20
>>    ti,host-id:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>> @@ -79,6 +79,42 @@ properties:
>>      type: object
>>      $ref: /schemas/reset/ti,sci-reset.yaml#
>> =20
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: ti,am654-sci
>> +then:
>> +  properties:
>> +    mbox-names:
>> +      minItems: 2
>
> Why is this list flexible?
>

The idea is to make the boot_* mboxes optional so the existing DTs that
only have rx and tx remain complaint. Also, the boot_notify mbox is not
supported by every SoC.

>> +      items:
>> +        - const: rx
>> +        - const: tx
>> +        - const: notify
>> +        - const: boot_rx
>> +        - const: boot_tx
>> +        - const: boot_notify
>
> So this list goes to top-level with minItems.
>
>> +    mboxes:
>> +      minItems: 2
>> +      items:
>> +        - description: RX thread
>> +        - description: TX thread
>> +        - description: Notify thread
>> +        - description: boot stage RX thread
>> +        - description: boot stage TX thread
>> +        - description: boot stage Notify thread
>
> This as well
>
>> +else:
>
> Best regards,
> Krzysztof


