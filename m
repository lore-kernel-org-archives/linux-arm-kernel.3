Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83A7D32D95
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKYYoBGCdkYS8VrIkqLI9q7hFhvnIJGFbsGqlf7Jf14=; b=NV0QjDgsKh/HEHVqQwYUaVZR50
	4EFLLS/CDFRPIIZ4lBb2me1/W7zsY5F0ilh/HZyhHLAyL2qawcmrz+hWEimxo+XLdwctuxi74Lct1
	MZrFs9OEHgpDEXc0KNxdyqy1wcK+VpbPAyaen42JjeQkhBHKVQfGLvTy5/V7PXF4xtI6FrTwYvmMH
	IwezjlV1gFMdJTYqbAUEkwiDU7pKzmjIs0RtaUTLxcQ6hV3oFm/jeqDMMRorF9JL0Vm8fVtyf7nZv
	aTLjQ5+Q0ufequ8UH6+49c0jHOESY6+I8Q/CLXj79sDPO53nqqpnn0H4Y1GZIQSLx7M8CE5fE8Xs/
	zMkgnb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRXGi-00000009cTd-1lqo;
	Fri, 05 Dec 2025 14:58:48 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRXGe-00000009cSr-3Nmw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 14:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5s/QQATBx52hZWaqWcz+lgFIwAnaItGRVo8SDjY7tjCdMIpJKTVjVDy+HKX0sArw6+btHW64vklpFpZzF0kfY2AHOAiL3UtVsq0yR0qmg1JbNoYY+ZxeEn4tmXnWn+IC9rdtlWWgwDP/2/73p+RI7qgW70ipd6wdZhth6QLdGP+8mZx21rq3OOZv9YZ+FIHLVLmZNwWpQhQFg6/GfNjE6O38C+Qr4KrMd6r4lqPUhqJof+J5W+SJskuXnB7qrgCu/INb28yoxwOvszXCA5lWWVmOLWv+oym3aiem4RKPNe+31Z7N66nRdENHMmYQS1VE8oLN99WcpL2tkeAcEuyBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKYYoBGCdkYS8VrIkqLI9q7hFhvnIJGFbsGqlf7Jf14=;
 b=DOMJmu0i1Tf4UIexxm+DWDkU2AeGitXORtf077ZEMe00XjYixS4d+XaPowgQkuYxDRjFfP3ZcTAp7vI7iVIDVaK5htez3tIhKlbi0bsSGOA3aFDidM5kSsY4Gc9yklxBSBgv+lDJiDMVCyTwE8hY1UVfYggvedsoie2H22SLPaED7V6gvL0SMbMWduYlslOfaD949AOmESzRjmq8edpjF/mrEBErAgAxE7v/7kWsp+M3wCl2F1QihsB7G2XZtcvy77WzflJEIjFob0DJ9Y+ZtKsp8oLM02ao5mx1Rve186lqOP2wTxTYhIrSsfwz3YSSuazC9WafAHsJnFKTlk7JHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKYYoBGCdkYS8VrIkqLI9q7hFhvnIJGFbsGqlf7Jf14=;
 b=D3kvVTfQpsPTK1NYQLsdZUTlbxbNyr0q0/e5JiyI7qOVjQJlQJjEz8l3xNO1tjvYAfJvJIuuZjIRWr1oId3SKgr6MZSswgbOXo9O57qtSF0rcgZHaL2W7SqsudoN3BbouXwDMsEXuv+QGtFCkV2mMtbcJMNeLCLqXvlSEDOTuxk=
Received: from SJ0PR13CA0121.namprd13.prod.outlook.com (2603:10b6:a03:2c6::6)
 by IA1PR10MB5945.namprd10.prod.outlook.com (2603:10b6:208:3d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 14:58:39 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::df) by SJ0PR13CA0121.outlook.office365.com
 (2603:10b6:a03:2c6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.1 via Frontend Transport; Fri, 5
 Dec 2025 14:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 14:58:37 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 08:58:27 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 08:58:26 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 08:58:26 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B5EwQeK3458498;
	Fri, 5 Dec 2025 08:58:26 -0600
Message-ID: <533a5027-0942-41e3-87c6-bfef4a98ebcb@ti.com>
Date: Fri, 5 Dec 2025 08:58:26 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
To: Anshul Dalal <anshuld@ti.com>, Nishanth Menon <nm@ti.com>, Tero Kristo
	<kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
References: <20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|IA1PR10MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 46da5fcf-9d84-407d-7bb6-08de340ec4f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHRZSyt6TVp2dUppTURtYW1NQ1ZjMG9ZQThhQnNoUENEZ3V3UjJOL2lCMjls?=
 =?utf-8?B?YjIxNU1IZjR2V2VUR2d6M3lBTU5BcENsMjBrQXdXUHhLY0c5WFAxNENIbTY3?=
 =?utf-8?B?TUQrclJMWEtCUkVRaXF0aXVUUFMvbVFJaithbjExbDByalFnZ0x4WElRVWRG?=
 =?utf-8?B?QVpkWTF2TXFITGRnUStKSjMrc3JJUVIvK2ZyQ1FjenJ6M1MyYWIvM21NVzBh?=
 =?utf-8?B?c3lwSUtKRXAwYVlYZmRQaVh4dnllUDZ4YW9TOFVaL2p6Tnk2N3IwcUNDNVdQ?=
 =?utf-8?B?dUNLUkJZVFpaUVV4M202L0Fuald2Szd0Y2xlL3R3WFE0eDlnVnhxTWc5TS9S?=
 =?utf-8?B?TCtEbXZOb0N3MzJ1ejByWEpRaVllNVhHUlpJNFFHSnpWNmZPOGNOYmo4QjI0?=
 =?utf-8?B?ck4reHRCUTkwdFZEbzhjRE95MGYxSjk2WVBOdi9tbWpiT1BUNitiSFpSZGFO?=
 =?utf-8?B?TnhxTWs1NU9EajQ5V0pmTzI3Vm44enorODlMNEZzQXAzWmxWZWNVU0F2RzRm?=
 =?utf-8?B?TmVLOVdTSXB5OWo3bVp5V1ZBbWJBVjhwQ1ZXQnYrT2hQbE4xd3Zxdnl4L3dh?=
 =?utf-8?B?bTBJNVlsNStwVU1JQ3U5ZFhCRUlJb1NDSWYrRmUzNDNOb2ZQaElDb2Vya2xj?=
 =?utf-8?B?UmxpVjgrNXB3Si9ZQk9yeXBld2t0M3NkdkdUQzI0SUJHTmxhT3dEMm5HYjBR?=
 =?utf-8?B?QyszTjMyRmx6RERuYjRQMFVSNTVXNWRUc1VJM2xiTmdRdkhOOXlxL3lad1Jv?=
 =?utf-8?B?ZWYyVlJwS2t5SmdqNWFrTXJjWVBsRWdKVVdOSWdsek9WSHBGZ3FPNkpKUVpW?=
 =?utf-8?B?Ylg2UlhIZWs5YXk4a0tLL2x6OGpyMXpZeHZPdmdBZEZMSmxvS1hlcE5EOVJm?=
 =?utf-8?B?RWNaU1VTN1IwaytjcU5VK1oyVithd0lJZ0syNTVIM3F5SDduM0U5OGp0d3ZS?=
 =?utf-8?B?a2M2dzErSE1yNzR6a0JjSnp0bmRKcllhS3BpcEhuL0lLcmd5bDJZQnRjSG9a?=
 =?utf-8?B?a3FFNFhDbmh6OFZsSHJzc3kwWU00cE5mUUNoOFNwR0FiTHVvTCtaZkpSaEFj?=
 =?utf-8?B?NXdOUHh2Sng5b2c5R2RLYkE1QSt0aHh2dVBTaGpDd0U3KzRkM0ZwOTRZWWRs?=
 =?utf-8?B?a3pPWlkwMVRiL2NEaXQ1QmVJK204QlJhblAzdG5mWkt1V3plcVhLa2cwcUQx?=
 =?utf-8?B?RkxZQVJKQW13bzE2SmVJL0RCN3hQcFVKL2g0c1lFN281WEFRUndNT0lMemZX?=
 =?utf-8?B?OGFpb3hYMHhHQW1abTdJeXV0eWN5aDkvaGdKTnJ1RGhVMTZ4MHd6eVFDcmxX?=
 =?utf-8?B?V1ZYQ01ZTmFkK29PSXdtckd3aTVLTDhtOGF2UGZiYmRDVFNLL3BYeEFwQmZE?=
 =?utf-8?B?bHpaK09qY3hnSWJjandkUnkyd3VkNlN3MkdGWHZXcnVlK3IyeThlSlhmbDky?=
 =?utf-8?B?U3U5dEZ1QkFrNzlZdUx4Q2NzOVJSQitrZFN2SjV5dm5CcncxeEE4cmZQdmpj?=
 =?utf-8?B?VEJwRnlCOEozWlBhU3dPZ241dHAxaEZ3VnpWdnRtVDJLM1gzNU5kY2UwQ05R?=
 =?utf-8?B?dFlNZXg3QzRuclNEZmIvb2pOckczOHdRWS9HeSsySFFkUkNBN0gvRmh2YXpQ?=
 =?utf-8?B?cXByTzJtVWhXZ0FQT04vTGM3ekhnRndqNlcxM1RKZWhkZnh5K0ZDMVQ3ZzRr?=
 =?utf-8?B?L1hON2RiY2pQM3lVdldiYlBXRTB2YklGVkM1d3pBbjdqQnBLSVh6RzBEL2FC?=
 =?utf-8?B?L0hHZUJwQVMwZmtjNFBPamN6WWp6MkM3dFRmdW1xQldES3FBY0dzdHNyOUdQ?=
 =?utf-8?B?NXhENDRHaGYvVy9CMWFMMnhGNENsYmtYazdHRkQwYnMyM3JMdGk3aG81T0V1?=
 =?utf-8?B?SEtYSzh6VWF2c0tnUS9Vc1UxRHY1blZTbjJQYlFHMGxNbzZCbDdBbytmWGN3?=
 =?utf-8?B?VzEvNXZBS296YnltLzRjSWVZR2t5d2ZqbitLZm9GTlZGeG4ySXlEckN3Y2ts?=
 =?utf-8?B?ZjQ2clI3cGE3Unp3c1NzMHNoTWJ3bmk1MEVOeFVlcGdwMmFPbEhRSDFrdUMr?=
 =?utf-8?B?TlV3dVlsRjc3enpsWC9MRUZhVmxHTytCZ2poazZpMGRCTSs0Smd4RGJCaEY2?=
 =?utf-8?Q?Tflo=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 14:58:37.1245
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46da5fcf-9d84-407d-7bb6-08de340ec4f8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_065844_934342_0303E6B3 
X-CRM114-Status: GOOD (  25.05  )
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

On 12/5/25 12:15 AM, Anshul Dalal wrote:
> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> which might be different than one's available to the kernel (firmware
> spec).
> 

See this was the part that confused me earlier into thinking this was
for different processing elements. But really even the same processor
could need both sets of mailboxes, pre and post loading the SCI firmware.
It isn't about "boot" vs "kernel", it is "ROM" vs "Firmware".

How about instead of boot_* you call them rom_*? Or at very least update
this commit message and the "description" in the schema to not simply
say "boot stage".

> Therefore, this patch adds the missing mailbox entries to the DT binding
> if the matching compatible is ti,am654-sci to represent the mailboxes
> exposed by the hardware during boot for the purpose of loading the
> firmware.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> Changes in v4:
> - Make new boot_* mboxes conditional on ti,am654-sci compatible
> - Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com
> 
> Changes in v3:
> - Drop [1/2] of the last patch series
> - Update existing example with boot_* mailboxes instead of adding a new one
> - Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com
> 
> Changes in v2:
> - Remove maxItems entry
> - Remove RFC tag from patch (added by mistake in v1)
> - Document the new mailboxes in mboxes instead of mbox-names
> - Provide example with all the mailboxes set
> - Update commit title to have "ti,sci"
> - Split into two patches
> - Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com
> ---
>   .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 50 +++++++++++++++++++---
>   1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 25a2b42105e5..d9eb2a81e539 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -51,15 +51,15 @@ properties:
>       minItems: 1
>   
>     mbox-names:
> +    minItems: 2
> +    maxItems: 6

This doesn't seem right, why add these here when you set the exact
items allowed down below in the if/then block?

>       description: |
>         Specifies the mailboxes used to communicate with TI-SCI Controller
>         made available from TI-SCI controller.
> -    items:
> -      - const: rx
> -      - const: tx
>   
>     mboxes:
>       minItems: 2
> +    maxItems: 6
>   
>     ti,host-id:
>       $ref: /schemas/types.yaml#/definitions/uint32
> @@ -79,6 +79,42 @@ properties:
>       type: object
>       $ref: /schemas/reset/ti,sci-reset.yaml#
>   
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: ti,am654-sci
> +then:
> +  properties:
> +    mbox-names:
> +      minItems: 2

If you are listing 6 items, then the number needed is exactly 6, no
need for a minimum less than that. I also think this is enforced without
needing to set min/max if you list the items explicitly.

> +      items:
> +        - const: rx
> +        - const: tx
> +        - const: notify
> +        - const: boot_rx
> +        - const: boot_tx
> +        - const: boot_notify
> +    mboxes:
> +      minItems: 2
> +      items:
> +        - description: RX thread
> +        - description: TX thread
> +        - description: Notify thread
> +        - description: boot stage RX thread
> +        - description: boot stage TX thread
> +        - description: boot stage Notify thread
> +else:
> +  properties:
> +    mbox-names:
> +      items:
> +        - const: rx
> +        - const: tx
> +    mboxes:
> +      items:
> +        - description: RX thread
> +        - description: TX thread
> +
>   required:
>     - compatible
>     - mbox-names
> @@ -99,11 +135,11 @@ examples:
>   
>     - |
>       dmsc: system-controller@44083000 {
> -      compatible = "ti,k2g-sci";
> +      compatible = "ti,am654-sci";
>         ti,host-id = <12>;
> -      mbox-names = "rx", "tx";
> -      mboxes = <&secure_proxy_main 11>,
> -               <&secure_proxy_main 13>;
> +      mbox-names = "rx", "tx", "notify", "boot_rx", "boot_tx";
> +      mboxes= <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
> +        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>;

nit, how about:

     mboxes= <&secure_proxy_mcu 6>,
             <&secure_proxy_mcu 8>,
             <&secure_proxy_mcu 5>,
             <&secure_proxy_mcu 5>,
             <&secure_proxy_mcu 4>;

Much easier to parse out the mailbox numbers visually. And to notice
you only have 5 items, but you list 6 in the schema, where is boot_notify?

Andrew

>         reg-names = "debug_messages";
>         reg = <0x44083000 0x1000>;
>   
> 
> ---
> base-commit: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
> change-id: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
> 
> Best regards,


