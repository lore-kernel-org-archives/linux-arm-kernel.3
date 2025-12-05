Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80FE3D2F7E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 13:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kQyoSraOEXVID+ZJvxoZ4s60JAS/KetMSwStMq2z7M=; b=fRekg1fO8qtdJ1UhOFQYpUxOvy
	5q6WvALr5sLYTuftxiXIHbK+/P0MC4lSdsrXYYZUulQMkmImkfP1suXpTF5ZM9Nt1ybwiQzG5/mTy
	LuV9ccp/1nrtYQhf3desJ6WqnJ+ovdB9UK6obK0U1LDWI25xVJQYq3aabqKalk+ifFS8Swl6mYeVI
	NtvQjwvuEbY6jUEJMNOThLkGsz9Q8JEmv+uk6TAK3/4sxekyiKWfzqsH/xpb6qdkIX2GkeqalMVXs
	kFKqBcOw9JfbfVYqIL1VC4bFJGVKZk0xMFUFotux+Hu0Ee786zBHkUCIJ4qnMAg1xVVyNI9/RDBFM
	i57hgA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVRJ-00000009VYQ-14JA;
	Fri, 05 Dec 2025 13:01:37 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVRG-00000009VXr-288d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 13:01:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP03NzoB0qi5lF/u673p3bWygRpky4YKVj8xCbdYCqPhgu1zgoP8t/itjGtLzCnZJpYjMNC/LrCAL0xwd36cuVuQ4rzAiB5Cuwjnr7jGQqv1nQOZvcFOX3lrgJf9LWyizmfcx16ziS22GiGR5XU3jbreh0z8/BmdVMRaLywi4iur+GJEWOTVL/shp3rjt6qWzBlMz2WZ+RiVSNdBbd00SbmHHJ1uq1dVOyEt7vNu8iWBTc6Qz3E9dIEha71eSOws8GwnRCn4BY6Y4OVNjI1JIBh2Gh5Kx6N06sDqN8x3tcEwD/tBBAmrdQrmp8ButJsJe9zxa3byWvCNypS6CcG3Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kQyoSraOEXVID+ZJvxoZ4s60JAS/KetMSwStMq2z7M=;
 b=MpwTBZQdJ/USFF0lbCnz3F7mmqZ8xbbOufbXPB0Mz2Xl8VOzC9Ms6rM0N6SAYoEljfzevn9sB5leXDfAKSPkydaGUmFnfJWJc5ya8n+iE+sGB3AzPNUHUuS1uq8C1vhTT8oPmvq2Qh+edYoXcy2zQ1TU364MYOqV8F/M9xPMWxfYY30JM9MNZtMPIJMMhu+7+42jg31iYSv2l23G0fVtmCa6AfmRRJWPsBDjqtjiB2JsXIVXuoPBTv+wJaW9ND9ccaVsTJ3rEh40yIGaz74k9ryMuHN9YAhkjN2qqJdsWI2asDKQEDNuT/At9EkRZkqYjyRLVxiQHN8U6E5u4yVUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kQyoSraOEXVID+ZJvxoZ4s60JAS/KetMSwStMq2z7M=;
 b=pZl1faMFobpFXhe6aZZkNLqchp2qTutiFfPgODgRDpd7GO6hh0EcUsmfc113ytOueZpbV25CjwMA41goj8jfINQRliiJ1z8QMZaC5fWIIUrK0HePotvNBSfeYVtlng1M4HDBKzLagc1hQUxt0zmInRRhA8NJHPblV/VPfJajkbU=
Received: from BYAPR02CA0005.namprd02.prod.outlook.com (2603:10b6:a02:ee::18)
 by DS0PR10MB8104.namprd10.prod.outlook.com (2603:10b6:8:1f4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 13:01:28 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::fb) by BYAPR02CA0005.outlook.office365.com
 (2603:10b6:a02:ee::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.11 via Frontend Transport; Fri,
 5 Dec 2025 13:01:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 5 Dec 2025 13:01:26 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 07:01:22 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Dec
 2025 07:01:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 5 Dec 2025 07:01:21 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B5D1LoN3337859;
	Fri, 5 Dec 2025 07:01:21 -0600
Date: Fri, 5 Dec 2025 07:01:21 -0600
From: Nishanth Menon <nm@ti.com>
To: Anshul Dalal <anshuld@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
Message-ID: <20251205130121.7cqsy5zihelh6ity@launch>
References: <20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|DS0PR10MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: f44989bc-da9e-4ccd-6fed-08de33fe6639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uD4hz9rTUdVwUpaXDsSz/s32jmbgBZrTdZaLeQe3PoBm+2G3uitp2LK5IMyT?=
 =?us-ascii?Q?a9IoEQV/5y6T2hjRe5H1Ufas+RjmNXsyqNGKWzc9JGtbDUqsMDyCBXbnLWQd?=
 =?us-ascii?Q?oH4fTqoAFCAtzmzJK+VazXg69ZsJIVXhVV3/OZTA5PdoFSCbtHiZH+OJKKnr?=
 =?us-ascii?Q?Z7xuNodxBe58KYOkPwnTGRTP6oTH+34I93DWM11ciQUgjEmxgmsbF0uCXqTR?=
 =?us-ascii?Q?MPWnUI7cg++GTr4zzHJ7zU2OJjmRMZ7oj9BHaX/VALfi6fGEwB85GH4UkTgI?=
 =?us-ascii?Q?4chxYOPh2Ny0J1wYTT8hh/L6fCSPazp7lP7AmlME/JkGHleFWmhjnPyU7pfR?=
 =?us-ascii?Q?gJbMEs2nYZCc0vb2FWzv1KCsLN4pUGMMXIIGKPyBkJieLnPYWr9wXS21tG1W?=
 =?us-ascii?Q?JytnCTO7LJogfdHRiTd4P/BO3y1otPTbXOY6gzWDRTyjUMyVAJ9M8b8xS5YE?=
 =?us-ascii?Q?CEwhvtZGDCBNO+TFxtCasUdZV4fmUD9LfIuqRY6bbwyNSDlCeKMsE3ekFxkk?=
 =?us-ascii?Q?KpP/V8ceNnOBqZfguo3jcqe5VscIXNCOI0ohUcyfYPZna2xgI0p38jt6Y2YO?=
 =?us-ascii?Q?FzCi4tuVrgoMQ6Fo5ng8REwyJueApVWYKfc3OUYzXDX4lk2Kdf0PZgjZFlvU?=
 =?us-ascii?Q?BPajFhfxcCejV9sQFsuQkNDeC8HMq72t/E23RzelEZCcCsm6A3xVby+HuV6p?=
 =?us-ascii?Q?uL/cGEL3jFdHzn1OhtnpwuQfnSv6J1oZTzMujqcIrDZ2wlNpqIjtdwSNA67G?=
 =?us-ascii?Q?3caWXJHhT3APzElXluEu+Y9nmaqANSXN9urFFyhWBTj0uqM3SouV9aavxyle?=
 =?us-ascii?Q?Ehh/X/AT5Wy55wJoNBRjihOmqRB/sK45fcNU1Z/robzI6uX7x5aWPB90dnd5?=
 =?us-ascii?Q?U2tFiCjmHZG/7C00S9+VkFA2K1LskowRH5ICwP+alGBVcN6ZwB1yA1WSd0Q8?=
 =?us-ascii?Q?xWvPJ9wluMjzKegxbXXUd2NcN0b9WjXdX3unD8RMPCDw2FyQ2hhQmOtHAS8+?=
 =?us-ascii?Q?IEjWNcezCMc+l9yln32dG4uIOF1EZxTW0gCSI0jW3C9ok2I7bGpeX+pHnKcc?=
 =?us-ascii?Q?BbafPSUkeq1xQMwEjgX+BuwkxcHgy9gt4NEXsixLPZOiivAuSc9vR+QUjpbB?=
 =?us-ascii?Q?onF5BWEqvYKGlzt9W5xeXa8mBOgl5lbr9bu/C5eluVnGR8qJgHSJY/eV5bUa?=
 =?us-ascii?Q?YuoZ23Gih/bXCOWphmrCmq9Kg4M2joIGAoILg3Fgvk2QjaEyCj3pOsFaOZKU?=
 =?us-ascii?Q?osw6MlcS19GG6Z8mzP4dgNlZFcTroAx8dLW7jjClx9f8MJ/myIBJoPUT7+nX?=
 =?us-ascii?Q?FVS8r5+aVz/v9gUmO4eIWuVsGGePX/fKoMzK6hKZSFVg8UUhAug/m7IvTuzZ?=
 =?us-ascii?Q?6LcRd14M1pBJdcqdyOOiDbSCJOOXEmGEYSP+K+Ib06aw2Yjpd/xLyE4GWCtD?=
 =?us-ascii?Q?g9F7KDWPjh5ucL9cTBFXUQ6kirWxhe7h7WbOGkoyfaH8w8GyENb2YbB1E1wF?=
 =?us-ascii?Q?NhMxYEf04qsT4DFi1HoCxposqpBThuQabEo6zgcXIf+Jhq6MaGGy50W1sZMM?=
 =?us-ascii?Q?NTxBcW1C3MJXyiISaAU=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 13:01:26.1926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f44989bc-da9e-4ccd-6fed-08de33fe6639
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_050134_551018_18D878DF 
X-CRM114-Status: GOOD (  23.62  )
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

On 11:45-20251205, Anshul Dalal wrote:
> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> which might be different than one's available to the kernel (firmware
> spec).
> 
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
>  .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 50 +++++++++++++++++++---
>  1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 25a2b42105e5..d9eb2a81e539 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -51,15 +51,15 @@ properties:
>      minItems: 1
>  
>    mbox-names:
> +    minItems: 2
> +    maxItems: 6
>      description: |
>        Specifies the mailboxes used to communicate with TI-SCI Controller
>        made available from TI-SCI controller.
> -    items:
> -      - const: rx
> -      - const: tx
>  
>    mboxes:
>      minItems: 2
> +    maxItems: 6
>  
>    ti,host-id:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -79,6 +79,42 @@ properties:
>      type: object
>      $ref: /schemas/reset/ti,sci-reset.yaml#
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
>  required:
>    - compatible
>    - mbox-names
> @@ -99,11 +135,11 @@ examples:
>  
>    - |
>      dmsc: system-controller@44083000 {
> -      compatible = "ti,k2g-sci";
> +      compatible = "ti,am654-sci";
>        ti,host-id = <12>;
> -      mbox-names = "rx", "tx";
> -      mboxes = <&secure_proxy_main 11>,
> -               <&secure_proxy_main 13>;
> +      mbox-names = "rx", "tx", "notify", "boot_rx", "boot_tx";
> +      mboxes= <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
> +        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>;
>        reg-names = "debug_messages";
>        reg = <0x44083000 0x1000>;

Create another example. why are we dropping k2g-sci - that is still
valid and the schema must continue to support - so functions as a
validation.

However, i'd like to make sure this can handle two different patterns -
example: AM62x and j784s4.

>  
> 
> ---
> base-commit: 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8
> change-id: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
> 
> Best regards,
> -- 
> Anshul Dalal <anshuld@ti.com>
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

