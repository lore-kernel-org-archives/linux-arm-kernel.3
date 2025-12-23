Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C899E6F06C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 08:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:CC:To:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFveH0HQlvPKD2WOQr5gQJdhPcfGFAOSfZPYHK+ZMlM=; b=fCJzbyCdY//OZV6udCOXxXKq8J
	iATPv6uIF1hAraf6uCLW6Imduev5k8FPMjvG217lZ+aj/wxCJKllpzAl4Lwzvfo5kW37Qt6FPQCyv
	I9TPTgyGX8LXYyxUa7hwEaJirN7goWo2w394KMwbW6T+kW/KS2+BeiH5cZK3Aaa2l5dKFAcmyWf7e
	MZiyP9L2xav0NE43Ax7I3TtwlS9W7jHtM5z4NWGQEFVtDg8PDZZJ+sVGts1OrKDuhL85PtiM6YDn8
	KXns6P0HbNHI0chywqV6lhCYIH7fVNy0Tk0GuDSqyjugU6tze0CQP3+sj/4Up+3O8G+p7ySr/wTl/
	IiOxj9bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXy0N-0000000EhWo-3Ch4;
	Tue, 23 Dec 2025 08:44:31 +0000
Received: from mail-eastus2azon11010031.outbound.protection.outlook.com ([52.101.56.31] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXy0K-0000000EhWJ-3P7l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 08:44:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/FHxbsheBXSGwURjk+Mbp4CfE6gxL0kOMbpjQRMt89Genm7GQyVY65waw8pecmo4Yz8lhayl9YwMT510VzaaBSHXUolQ2a0BA5Kb142tHtOthTsGlK8cZqLuZkoPXwdRGw2vsPK83AqVhHbAkuwmC1t2BcRUx3qKbc+DM1NyP7noZRnNG1sk9+jcxpPoy7HeR2a96CkKjSoADagcl7CQI+w4y/Ehci8xug5POgl7Zq+dTHBug1/4cUQhTCuGE+hGP54tXgezvTKsoMoEUUPEn402YKB+9VBR7JW7HKWtGn9Qo1sISjEUSRBTFwyiEhD3Hg/Atbx1wJcLVaIw4p1YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFveH0HQlvPKD2WOQr5gQJdhPcfGFAOSfZPYHK+ZMlM=;
 b=DU2Cb5w0AFyCiphHPRXn/hr6+AKAzfl3a4vS9DvSEIG3CutKMeWgNxPs1dE2ziuB4ExAl6TDkx98uNHKbXSG5+UvqfDdPknfYVGVxrjsgj0ekEr1kEeH6G9GgiKF3DVv292EKaIJfCPUHybUdlRNi/4830uEWRKtZ7i0V1Jn4cX2F0ABoHEVnBoRWnLCvDMK0AxJ+XnZ18emIKsDxjhW6xwwDOGqU9B4NYOCA0bmHUFa8dPw4haUn2c4Fub7wObFLT6ugYGLHy4GXElmYL+xcQBeGBF9EIJUBeGA95swfRb+s2+z/Dk3pZH/Qyg8QFelShGTKdshfltiJL4yJWOJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFveH0HQlvPKD2WOQr5gQJdhPcfGFAOSfZPYHK+ZMlM=;
 b=XRLqBzsI/2MBeVFRTJx9NnvVejQIzSSz2xEqT9WY2cLizB9N8APpLrxheVIcf1UVGhVzct45GIAQF98H942TE5cG7SKi2JQXeRyK1LhwgnV+O3B7sOq0pCAxMxdBj9vunpr3M1UwyYuoUqR4E9SdaJ2nw8ug0S3X0+Fpc9cYq48=
Received: from PH7P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::35)
 by SA0PR10MB6428.namprd10.prod.outlook.com (2603:10b6:806:2c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 08:44:23 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::7f) by PH7P220CA0036.outlook.office365.com
 (2603:10b6:510:32b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Tue,
 23 Dec 2025 08:44:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.9 via Frontend Transport; Tue, 23 Dec 2025 08:44:21 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 02:44:17 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 23 Dec
 2025 02:44:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Dec 2025 02:44:17 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BN8iGWC2741852;
	Tue, 23 Dec 2025 02:44:17 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 23 Dec 2025 14:14:16 +0530
Message-ID: <DF5GPF5U7NPA.2ODE22YOF8E1R@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Anshul Dalal <anshuld@ti.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v6] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
From: Anshul Dalal <anshuld@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com>
 <1844147d-543d-4739-a1ec-a59f8a4564fb@kernel.org>
In-Reply-To: <1844147d-543d-4739-a1ec-a59f8a4564fb@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|SA0PR10MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c85464-560c-47aa-3f2e-08de41ff780a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlVFUk9iZjVQVHJRbFVleVNHK1pMMFE3YjNiU0w2K3Y0WWp6RHdpODcyNWRW?=
 =?utf-8?B?NitUQVBGQnZiUklFRnRFcG9qVVlSTVd5N1BJSUJnaGlMMjcyZzNtUGNmN00x?=
 =?utf-8?B?bUg2U1BCc0h5VUhMY04wb0Rpb1hUNUMzbk9jQUlxcERQZURZdHhwOVltazQy?=
 =?utf-8?B?SVJmRG8yd1lHWlVMYjJCS0oxa0V2Yk9Id3Nwdkk0ZWExUUI1Slh4QmhhUGRs?=
 =?utf-8?B?bXhDelpaZHBpRXJiSk1sZ2hva25jN1gzU3dVdVZBcy9sbDJlUUpnRkJlSEhJ?=
 =?utf-8?B?cGxhQXpOYnJ2VnRCRE02VDVRblVoSEcyYmRuVGtWM3hBOFRkbDhpdHdTbUlR?=
 =?utf-8?B?eXdKYjQyazhOUkRiLzd5Y0ZKaUxZZ0ZSSTQxK3VkbjRUKyswcG52dDllU0J2?=
 =?utf-8?B?UUgzd1dPVjJENUVrVkVhd0NldUxzc3FuSmJzdlNtcmV6SVFmSy9XaDN6QlF6?=
 =?utf-8?B?d1dLN25NK041SUZUVkJseHgyRU5jN1RHZUMxTmFMMndnZnZrUW1iSFpWVVdv?=
 =?utf-8?B?RE9sYWEyd0taSnN6VVdTS2lRRklVWlZCL1pxamtIRm1LczRvUXhYK0w2U25X?=
 =?utf-8?B?a0hCQ3JWRVVVemRTVDQ0SytWa3FLWjMzb2RrMEk1R2MrbjhqU0MrSWcvc0xS?=
 =?utf-8?B?bTg4Z2VhYmNaS0NZZ1h4SXMzSUsyZWg4UE5LN1FwTkpKUVBiOVdUeWhpa3RH?=
 =?utf-8?B?L1JaSm0vTzJ5bmtEK0VPV1VFaGYxOUJ6d3lRZGFXSThFdXZUZlZiUXEwMDcz?=
 =?utf-8?B?QlRkcHpTa09SZXN5R2pjaVRBYkFmc0Z1Ty9UQTU4UjlXbnVuT0h3ZXJvZEQv?=
 =?utf-8?B?TjYyYWlqSnVWMHoxTDV5bnVDRDNabk9PVis0T3M2amR2WWdoVmN1WmlEVGdR?=
 =?utf-8?B?dTQ2cUtnVHo5NHBJRTd4Y0NiQ2luTTRwNUN6YmZkOTVTZlFLRlY4RjlHdUZB?=
 =?utf-8?B?bkYyeFE2bXVBMFF2NWFvQ0x4MUVoQWpHclVUcUFCTzh6ZlgreldMMlRUQWNz?=
 =?utf-8?B?SXoxTEhNUG5HUE5SclUwazBLZ3ljenk4OWFhdDZuZHlUTThVUzg4SGNtMFlI?=
 =?utf-8?B?RGdNcS80ZCtTaWM5TmdHS2hsdWs5VlcrMzh4L01Ddk1nMXRpKzVZOUlwMzRD?=
 =?utf-8?B?b3dqS0JUL3UrZEtRSTBxYUMwc3phZldyK3ErOFRZUVc5aWtDSlFOS1F2aklw?=
 =?utf-8?B?TS9QNG1XRG5mS1pUNWNMRzBlVU9IaDhwZFFTK3FGQm5ja1lVSm56cFg2Qzc5?=
 =?utf-8?B?c0FHa0dGT0NBNEtncnBsTitCc2Zzc1NzbDVTOFdNSlBwUFpBVW9Wa09WK3RI?=
 =?utf-8?B?YlBiWllIY1I3UTFMeTVyNlZZVEZIZGN1OEUvZTNwQVZUK2s2TDJpOFVOVENG?=
 =?utf-8?B?UUlmU0dKR0NCU29vZjF4NnZYdWpOSEdBWTlEbUsyaHgwQTE5cHJxblJqWFVx?=
 =?utf-8?B?OGFOTnBQUVY0Y1ZJUHZEOVZCdWdUb1p3UUdHMU1nK0Z0UW9OZ0xCUDlLZE5x?=
 =?utf-8?B?YlZ0RjBVQnhSVW9EVVU1eGUzVGtSSXpEeXBjMWd3SU1FcisyeXI3Y2NKK2Y0?=
 =?utf-8?B?TGM5VXk1V3hjdDhWd1c4NDd0VUp1VTlDZkhXck5xWFNGWUF2cmd6TUMxMko4?=
 =?utf-8?B?WUE1a3ZCU1UvRmxVb3NyemlxcGtyQTQvOEhOU3YyaTNCQ2xMZ09rWVFoMmJM?=
 =?utf-8?B?OERvZ09LMklucHZucmk0bzY0RlJ1cUtLbEFkdkhTbkcyb1cya1lJSmRwY0Iy?=
 =?utf-8?B?MVRhNStnUm1oUldXYUFEN3RsdEVGM1N5clBHMU01ajcrb3J3MVdVdEg0Vi9o?=
 =?utf-8?B?VWE3UnlNTktRSGZuZkpvdDhXUkE4VzJ4TVJtZXJiL0p1bFBYWldJa0xQallq?=
 =?utf-8?B?OEFXYnZPWjBybGpQcjNlNmc4dnY5MWhuaU50c0dhUDhQYjNGUzRYTHlCVjN1?=
 =?utf-8?B?WVArTVozbU1iWWRmNW5IdWNCcWZMbnBvcFhtNDVYY1NUcmJHc3pybWFXUjc2?=
 =?utf-8?B?UnRCVlRPU2VLWndtK1AzSUVQaEljL3BpbmZaUVNtZ01vR2JoakR1RTZtcjkw?=
 =?utf-8?B?VkpvN1ZXb3dGT0hxWjEyVHlNMzJqZ0UrMy81SHBkRkExR3MrUWJBWHhIVmlI?=
 =?utf-8?Q?puBY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 08:44:21.9159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c85464-560c-47aa-3f2e-08de41ff780a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR10MB6428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_004429_077888_A75D9C39 
X-CRM114-Status: GOOD (  25.72  )
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

On Mon Dec 22, 2025 at 2:23 PM IST, Krzysztof Kozlowski wrote:
> On 22/12/2025 09:43, Anshul Dalal wrote:
>> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
>> which might be different than one's available to the kernel (firmware
>> spec).
>>=20
>> Therefore, this patch adds the missing mailbox entries to the DT binding
>> if the matching compatible is ti,am654-sci to represent the mailboxes
>> exposed by the hardware during boot for the purpose of loading the
>> firmware.
>>=20
>> The new ti,am642-sci compatible is also added to represent SoCs which do
>> not expose a "notify" channel as part of their TI-SCI spec such as AM64x
>> or the AM62 family. The newly added mboxes are made optional by keeping
>> minItems as 2 to remain compliant with existing device-trees.
>>=20
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
>> Changes in v6:
>> - Added ti,am642-sci compatible to represent SoCs without a "notify" cha=
nnel
>> - Added new examples instead of editing existing ones
>
> Why? Rob asked not to.

I had followed what Nishanth had said[1], I'll wait for him and Rob to
align first before posting the next revision.

[1]: https://lore.kernel.org/linux-devicetree/20251218190449.cnp46cf6hikt6c=
qa@freebie/

>
>> - Link to v5: https://lore.kernel.org/r/20251215-k3_syscon_add_boot_mail=
boxes-v5-1-5a8fe567fd31@ti.com
>>=20
>> Changes in v5:
>> - Added commit description for the optional mailboxes
>> - Link to v4: https://lore.kernel.org/r/20251205-k3_syscon_add_boot_mail=
boxes-v4-1-8e216fb88941@ti.com
>>=20
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
>>  .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 94 +++++++++++++++=
++++++-
>>  1 file changed, 91 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml =
b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> index 25a2b42105e5..0f2c764eae5a 100644
>> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
>> @@ -40,6 +40,9 @@ properties:
>>        - description: System controller on TI AM654 SoC
>>          items:
>>            - const: ti,am654-sci
>> +      - description: System controller on TI AM642 SoC
>> +        items:
>> +          - const: ti,am642-sci
>
> Why this is not part of enum with previous entries like that?

Yes, I missed adding it. Will fixed in the next revision if the
compatible is still required.

>
>> =20
>>    reg-names:
>>      description: |
>> @@ -51,15 +54,15 @@ properties:
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
>> @@ -79,6 +82,66 @@ properties:
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
>> +      items:
>> +        - const: rx
>> +        - const: tx
>> +        - const: notify
>
> Move the notify to the end, so you have only one common list defined at
> the top and you only change number of items per variant.
>
>> +        - const: boot_rx
>> +        - const: boot_tx
>> +        - const: boot_notify
>> +    mboxes:
>> +      minItems: 2
>> +      items:
>> +        - description: RX thread
>> +        - description: TX thread
>> +        - description: Notify thread
>> +        - description: boot stage RX thread
>> +        - description: boot stage TX thread
>> +        - description: boot stage Notify thread
>> +else:
>> +  if:
>
> No, that's not readable. Don't nest these.
>

I agree, perhaps we should drop the new ti,am642-sci compatible and just
reorder the list for ti,am654-sci to: rx, tx, boot_rx, boot_tx,
notify, boot_notify with a minItems of 2 as Nishanth had suggested?

>> +    properties:
>> +      compatible:
>> +        contains:
>> +          const: ti,am642-sci
>> +  then:
>> +    properties:
>> +      mbox-names:
>> +        minItems: 2
>> +        items:
>> +          - const: rx
>> +          - const: tx
>> +          - const: boot_rx
>> +          - const: boot_tx
>> +          - const: boot_notify
>> +      mboxes:
>> +        minItems: 2
>> +        items:
>> +          - description: RX thread
>> +          - description: TX thread
>> +          - description: boot stage RX thread
>> +          - description: boot stage TX thread
>> +          - description: boot stage Notify thread
>> +  else:
>> +    properties:
>> +      mbox-names:
>> +        items:
>> +          - const: rx
>> +          - const: tx
>> +      mboxes:
>> +        items:
>> +          - description: RX thread
>> +          - description: TX thread
>> +
>>  required:
>>    - compatible
>>    - mbox-names
>> @@ -122,3 +185,28 @@ examples:
>>          #reset-cells =3D <2>;
>>        };
>>      };
>> +
>> +  - |
>> +    system-controller@44083000 {
>> +      compatible =3D "ti,am654-sci";
>> +      ti,host-id =3D <4>;
>> +      mbox-names =3D "rx", "tx", "notify", "boot_rx", "boot_tx";
>> +      mboxes =3D <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
>> +        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mc=
u 4>;
>> +
>> +      reg-names =3D "debug_messages";
>> +      reg =3D <0x44083000 0x1000>;
>> +    };
>
> You already have there two examples. You do not need three and for sure
> you do not need four of which two are exactly the same. Rob already
> commented on this.

I can edit the existing example instead if Rob and Nishanth are aligned.

Regards,
Anshul

