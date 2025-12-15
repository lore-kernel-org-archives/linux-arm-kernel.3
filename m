Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C84BD5B854
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:CC:Message-ID:Date:Content-Type:Content-Transfer-Encoding:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5Bn36tfD3Ez+fLThok56yRG2qujNavDUxnSVx18fqM=; b=KiLbb7D5VgGSRO5uWU+u1Q3Bny
	2MmLSfCNwLTZWW1pzD0uDQ3TIH4OibJz4C8UGHdZ1DOwavGmXMZs0dWmMe+OOQtmVmMIhuU9HS//7
	qKY6gxaQL+MXFC0m7I1iAZKp6W+Yld1KkcP5z5l7TqsuCM1E0iOIihO/GAh52kQ/h6jgHAmI17guA
	1M/4JMrJw9FlXW5T57OkSayE48dTlJeqodtWLNskiXOAnou6g8//aoPNwYgdiNU6GeGv9sLA0TTWS
	d8iGrHyArJozZWHa2vgIPu73jJlEIGQKva7BkHHm6hOFdMFamC3ydtXtJiiVQLFRuXQEbDtWVLozz
	KaGUqq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBYA-00000003zbj-0nTO;
	Mon, 15 Dec 2025 16:35:55 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVBY5-00000003zYY-2Uum
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 16:35:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfDzMr1o2jK5UPkiV2dEaF5SpUK+iOdbl/yrcFg+uRZLKDjypkWzmAOLKY8I7qIHhRj5r9BPIrRxGLLkgWmzC9+HU0d6yD0Exos2eyFbt15jmmVGI5mZpkSsoAGpJzDXGTFAqk7ZPbaK73eeEdawLsVgTvmIkq5g2png7x4EBDVtRRW5WChh+HrcHdPVblHmgg4nJbrm8g1JPB/QBaP/v6FrOD/rbSWi8nIhm0D0yp5Sw+CDkFOig2F80hG58VTP/e+qiSqrJ6nXoDt0vikK4GAjFru10pEUNkJFYNPUITzxweVdLzj6wuFNqVeQygwROfZpx1OApZTWM4sBQ+Aq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5Bn36tfD3Ez+fLThok56yRG2qujNavDUxnSVx18fqM=;
 b=NVbeF+IvlQCOKU4Ka/rJSwPFe7mxWdZm5sKhdx6gaDHvM9rsC3hU/qRC7dfbtTfOmuriOC9I4m8YaVX9IK85xOqY5bQpjL5naYA6pqkHUqCiu7+9Z1CS6Cg5nrgGa6GYtMdfY+1LIg3Pz3lMxH1tNXqpAWdz7UAJC34und2HoPLV8Hnc/27Kb9NmhBt4s1MNjtplIFYEsf+ZGtOXSvPc7jBKLtyB4/yanl2ELwlsfV98GTTPcp75PUp0350OQEYhBcncdB5Q2MUupyFCZ9vB78HxGAoz/D2LmGaGTgNeLVhURzUdMvlKpgh55I9l84F0YoSKAcFNIScQepk3okxjJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5Bn36tfD3Ez+fLThok56yRG2qujNavDUxnSVx18fqM=;
 b=XgZHNagFuws+30YQg2iTkYjQc7TYJ+UJ7It/VslwrmfDRVaX732S4dvbpH9uh4XLGikfu7P9gXHxV3wyZil38V6vIPQM/itFsyo66OWVh/1FomecVwYR7mfOuCjNjLylj3Rq+iAyO9E5viQzScbq3iq+E76goGTVgvXdCSswDLI=
Received: from PH7PR17CA0029.namprd17.prod.outlook.com (2603:10b6:510:323::23)
 by MW5PR10MB5665.namprd10.prod.outlook.com (2603:10b6:303:19a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 16:35:44 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::e4) by PH7PR17CA0029.outlook.office365.com
 (2603:10b6:510:323::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 16:35:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 16:35:42 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 10:35:41 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 10:35:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 10:35:41 -0600
Received: from localhost (dhcp-172-24-233-105.dhcp.ti.com [172.24.233.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFGZdhF2679427;
	Mon, 15 Dec 2025 10:35:40 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 15 Dec 2025 22:05:39 +0530
Message-ID: <DEYXPZH7UWOY.18YAJY8IA1M0Z@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v5] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
From: Anshul Dalal <anshuld@ti.com>
To: Nishanth Menon <nm@ti.com>, Anshul Dalal <anshuld@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com>
 <20251215135708.ij5e7jr3binzmlbf@panda>
In-Reply-To: <20251215135708.ij5e7jr3binzmlbf@panda>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|MW5PR10MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: f0d0ad03-337c-4aa1-5db1-08de3bf7fd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHEvNFdJS0Njbk9ERVFPUUlsTWR3aEVoNTBITHJpQnd6Wi9IdWpYOWFwaE9S?=
 =?utf-8?B?WEFVZkxxNDB1YzFpMlM4WUJSZFJmcHdLL0Fic0xnM1Q1bHRZYTBaQzdPSHJF?=
 =?utf-8?B?UW9OOVhKUmFGYk5SN3pDN2s5MTB2cnI3eEMweDhvME82L3JhaVJYd2VzZUVk?=
 =?utf-8?B?VXN0OU42RDc4R0JoUVN6L3phdE40TXNwVlpLUVdRY3JqaUVBUGh3VHgvR2FJ?=
 =?utf-8?B?Q2txU0U3cGcxaGxsWmh4YmRVaGQxV2N0MjlTQ1VhUTZVYVUxcXRSQ2MwNjA0?=
 =?utf-8?B?WWlwNzFSVjhBcGcyNWNJQ09wZHdSZ1V6R3hFQnJxaXB0allIdnZESnl5QWNX?=
 =?utf-8?B?d3FFN1lOQnpGQ1JvTUtpMkFCaVVZN2thZ2xjZk9ZdktQOWxCVGhIRDVrNSsr?=
 =?utf-8?B?ZWFyWE9scmRQbmpaS0hVS00xeGJVWFBXZ0x5UERDRGpUVmxjdmhZNjlDV3lW?=
 =?utf-8?B?WGNmVWpOVXh1YnF3UVlwRFFjdXFGTFhaRlRMV2VsNUtrdTlvazUycUhrZEt0?=
 =?utf-8?B?bURhbnJYdURmY1FKTVEwdHFHMjFmWTZidEZpOEl6cmd4THcvOGlMVXBSWCt6?=
 =?utf-8?B?cUJHOHpveW1kTHZsV1luTHZVR0tCUDNlSythZXFOZXZPa0l2b251U25KYjk5?=
 =?utf-8?B?dVhrMTVRWlM4UzlReStJd2FXbnZxcEgvdEYyU2NkajRFQzdvdlYzWjZVREpS?=
 =?utf-8?B?bWczRE8yMjNqYmJQclBKcFZYb2ZzTkdhZjd0dy8xeS9EbEFJWnBxamlOUkdn?=
 =?utf-8?B?b3RGc2VqdCtKSlVtYnhuNnZvWUQ5UXAyQ21md20ySHhzVEpqUXJUYnFhaVQr?=
 =?utf-8?B?VVF6UHZDV0ZpSmc4OG1Gd2tlc3MydG1CMHFpUER3S3FqdVY2RDExaUp2ZWxn?=
 =?utf-8?B?M3d2R1dFY2lXZVFna2MyRkx5TGdwQVg1czF2Ty9rblo3bm9IQndkd2FyNDdm?=
 =?utf-8?B?S2UxdnlMVEZraWpPSnNLMWU5NU4zb0JuTnkxWWQ1S3JTaU1lMnRzM2UzSy9J?=
 =?utf-8?B?bmJWU2RTbWZRRUVGRm5vMVFRWkRHQ1dGMFlqcTB2b1BPQXVyY1RPZ1VPaWQy?=
 =?utf-8?B?akF6dVlpK1RKS0pLSC9hVHVuV0J5d3hrVHdzd2x4R2c0UVFpK0lFZ0xKL244?=
 =?utf-8?B?cHJQVHhBNThxV0tHd2VLbHdTR2dzdXZRbDYxcHRNWHdQNWRaOGJlQ3VrY3Zi?=
 =?utf-8?B?SjAwYUtWZmUySXBxbTVhWFNNSXR5WlJ4cXNNMkkySWhKa05GY2NqaWRyVkRW?=
 =?utf-8?B?Vmo4TTlmY1lUZzUrRzE2VW9WY2s1eFd0MWl5RkpaVkIwemp4YnNSS1NGNkRP?=
 =?utf-8?B?WTRLUkluZ0NvRHVzTThLWnFmRExJZVJjTGUvSnlyaWR2ZDVVaDhmL0d0YUxU?=
 =?utf-8?B?ckNGM1Mzb3QyWDFZWk5qQTY3dFFoUUlvRTJGdVVsbnoybkxLa1psVVBjcW1y?=
 =?utf-8?B?bTlrcjJkVG1sSy83Tzl0eVZiaXdUWDdacnU3NTlvTUk4R3BYeHVjMUZtNnJH?=
 =?utf-8?B?aEpaK2JYOURLRDl3YWtCRFVkN1VwVGdMVm5JbDJxcC9WY3h6ZEhxNXdDNFJa?=
 =?utf-8?B?aDl6aVU2bWNmeGJ4S0JzSURyVTNuUTZWcjBBcm51UWU0RWhoQVFBU1pZL2JR?=
 =?utf-8?B?MTJXVENhcDFyVytLUmR0V29yVUlqZkpwcG9WL2REeGVTZEg4SFJiZEJ0T0NJ?=
 =?utf-8?B?R0MwY2RObmhjOW84UlVySHhnZnY1Z2R4UnROSXZzVnlpWU4zYWMxN0ZmUU1N?=
 =?utf-8?B?eWsyVS9lYnc3UWR6MzkxMnJEM21SZU9JdkdiLzR0TW92cEoxOUN2NWkxOVpU?=
 =?utf-8?B?MHpvWDEvWW9WeGg4dkt0eEZvZnVreitPeXpPYUZqQWJUdmJoZFB0NC96a05t?=
 =?utf-8?B?QWc3aFZ6MjNRVnZ3QWJiQXZSa2lpTWFiN0xuTkZVN1NhbCtXWnA2a3N1K1Uz?=
 =?utf-8?B?M2tZeWZ2b3l2L2tlelo3TXVzaFZWMloydUdxb09EdWhDeFJOREVjTVhWTUpu?=
 =?utf-8?B?YUFpaG01NURnLzVuTFA0bGlTRFFkMEhobnZiSlRVdjhveWh3TWN6RWFnbzhV?=
 =?utf-8?B?eHh3V1RBU3VHOG0vMlQyajFUSWlCNjNqMDRPbWIyd29Ea1ZreEtVNExyRU9D?=
 =?utf-8?Q?mZ8g=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 16:35:42.1902
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d0ad03-337c-4aa1-5db1-08de3bf7fd16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_083549_750669_73DEA73F 
X-CRM114-Status: GOOD (  21.43  )
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


> On 11:38-20251215, Anshul Dalal wrote:
>> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
>> which might be different than one's available to the kernel (firmware
>> spec).
>>=20
>> Therefore, this patch adds the missing mailbox entries to the DT binding
>> if the matching compatible is ti,am654-sci to represent the mailboxes
>> exposed by the hardware during boot for the purpose of loading the
>> firmware. The newly added mboxes are made optional by keeping minItems
>> as 2 to remain compliant with existing device-trees.
>>=20
>> Signed-off-by: Anshul Dalal <anshuld@ti.com>
>> ---
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
>> +      items:
>> +        - const: rx
>> +        - const: tx
>> +        - const: notify
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
>> +  properties:
>> +    mbox-names:
>> +      items:
>> +        - const: rx
>> +        - const: tx
>> +    mboxes:
>> +      items:
>> +        - description: RX thread
>> +        - description: TX thread
>> +
>>  required:
>>    - compatible
>>    - mbox-names
>> @@ -99,11 +135,11 @@ examples:
>> =20
>>    - |
>>      dmsc: system-controller@44083000 {
>> -      compatible =3D "ti,k2g-sci";
>> +      compatible =3D "ti,am654-sci";
>>        ti,host-id =3D <12>;
>> -      mbox-names =3D "rx", "tx";
>> -      mboxes =3D <&secure_proxy_main 11>,
>> -               <&secure_proxy_main 13>;
>> +      mbox-names =3D "rx", "tx", "notify", "boot_rx", "boot_tx";
>> +      mboxes=3D <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
>> +        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mc=
u 4>;
>>        reg-names =3D "debug_messages";
>>        reg =3D <0x44083000 0x1000>;
>
> Please add a different example for am654, i want to make sure k2g still
> continues to be checked.
>
> That said, AM62 series of devices do not use notification pipe for
> standard communication. So, the schema will break for those.
>
> in summary:
> k2g: rx, tx
> am654, j721e, j721s2, j7200, j784s4, .. : rx, tx, notify, boot_rx,
> boot_tx, boot_notify
> am625, am62p ..: rx, tx, boot_rx, boot_tx, boot_notify
>
> we will need three examples, and will need to add am62x series as one
> additional compatible.
>
> Though we could play a trick by reordering as follows to handle superset
> of am62 and am65 series as follows, but I do prefer explicitly handling
> them:
>
>    - const: rx
>    - const: tx
>    - const: boot_rx
>    - const: boot_tx
>    - const: notify
>    - const: boot_notify

I'm in favour of adding the new compatible for the AM62 devices and
handling the mboxes properly, let's fix it properly this time :)

Will post a v6 shortly,
~ Anshul


