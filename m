Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59B2D5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Lgf0+dBjBLhqx3Qaz1kPwYLmZyS25oIhcJijwq4eV4=; b=t2IQngnX3ZecRib10Uu03s+Y7G
	3/g/aci1KFhMFpbFIM8du2XvVh2cInsuTKf73DaWrxdCw/4A/3uZuTMEE7BUv6av9LEqyTVySFXTN
	/90SLwyfFgSCCU0J74o9ePcDNHd7UqkLXhkZU3BkJhR2iCeGesF/5V+o7y2nibetMqlYg/tNMYcma
	vTCD4oUsjN7NsvsiMw7QHCa6NHiaX/+zehw8YlRYfx8E7Ee+JPEvMtK6U/2u5UmfcA4mIHIkrTHCE
	349qfaPiM77WI6sg69siHk/s/HkGPA1q2Nad/ybsntQ/fbXMJNXytdeStG3yIxhzmFxwxdjVSCZMU
	c6BMT9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV94i-00000003iX4-3wlj;
	Mon, 15 Dec 2025 13:57:20 +0000
Received: from mail-northcentralusazon11010041.outbound.protection.outlook.com ([52.101.193.41] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV94g-00000003iWh-06Ha
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZZYE5Fp0ZjHfHqLy4XA19ItgqTUgGU+PHZhkv1dlMyDrYHnWdITteKKkq6kg+6gj8mOcqlPbwW0LaipSzNwn0iclV7UgarsEX4lfl8pmzBw/mrYT8oiGShDOFO4FMkJiHxsx3fEjo7ep0BJ/BnaOu9OE44uTg/lydOO7iRY2jQ/H3P25IyyrpbBKm6TF/tS027TaGRm5yjRUHY3yUnPSG0ViOQ7qJjuP30kvbf6nlzmBYSJwK3IjmnYZX8dfEjByJo3u54pL7HP++SLU6pfaSaAfmZTJR7YnL+PmP4VwG/Q23HL3NZ7/rcOggChfHR12dG94x/C4ruDzqOG7wu/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Lgf0+dBjBLhqx3Qaz1kPwYLmZyS25oIhcJijwq4eV4=;
 b=BoJOAvP7Pmt66we3LEnIltqVHFuSwyCEdK/biwFy2RPgLHu0R+ITCegSSPkLuar1cH233CgKMbwkJkHGv6NU6J/WA69NAKS1iMZRao0ZLQVlE82rG+V357QWTFRDxmrR9RGzfj2BQSyopwcZUAFdnEFB3V5auWgzDwpHLVJyRQL0iIdIlLX0ZdreowkH1eMcDRdCPufGItgEEnpvluBjqkWL2ncmo2bsOSkT7oZtQTzOsr8Nmeb6tyRXddfz1JXkR/wEhM77wqbhVWXsNChnNHPihKqr3m7Pr38FGK0ZrYocJbhUT/2X+jaZmFyOJsiY3sa4LLdwS/IFyI3SpgtazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Lgf0+dBjBLhqx3Qaz1kPwYLmZyS25oIhcJijwq4eV4=;
 b=VBEweZZJpJWYorZNigVLd/Qn9yx21N25K+bw2HP8cabt2mNAMP/MKhljHnJwFOsXIuX57rPhallYSzlQ/Y54GB12UrLNjrpeeketSORn+VL5US+CSav++DCbieC8o6uXJmfMctcoi6CtnbC7oBUP4ewZNQ5cCGFu6IXUEEsings=
Received: from BN0PR10CA0010.namprd10.prod.outlook.com (2603:10b6:408:143::14)
 by MW4PR10MB6348.namprd10.prod.outlook.com (2603:10b6:303:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:57:13 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:143:cafe::e6) by BN0PR10CA0010.outlook.office365.com
 (2603:10b6:408:143::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 13:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 13:57:12 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:57:08 -0600
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:57:08 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 07:57:08 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFDv87K2462386;
	Mon, 15 Dec 2025 07:57:08 -0600
Date: Mon, 15 Dec 2025 07:57:08 -0600
From: Nishanth Menon <nm@ti.com>
To: Anshul Dalal <anshuld@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v5] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
Message-ID: <20251215135708.ij5e7jr3binzmlbf@panda>
References: <20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|MW4PR10MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c270e60-7e67-4748-f939-08de3be1d8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oWKNvOciI5owGF74xHUyaMwJXshfjHTAZyVHPLFEb/dPUiGw1kovpNawJkGL?=
 =?us-ascii?Q?/kFE/nKceZWBCVr+2OnIDhunfRFSizcF05PnG+wYD+PxN7TdzqsvL7U1+V/0?=
 =?us-ascii?Q?+w/Rlg/G8fMQhsWG2E4N7lI1aqts/5VQP5vO0zGn9or0G0EkbtUzwRj4nRVU?=
 =?us-ascii?Q?9Jt8SMgn5wI2t2qmlevIhGhTIT9sDd7y7mwDfzpc4WVFDEy8SEcxBS8/oOMJ?=
 =?us-ascii?Q?wKg+EOmL+LxlvSUVozvtZgvr3Zw8s4eO4BsuJe+KtqetPDzRVwt7mqVmoGDq?=
 =?us-ascii?Q?AFxJrlYDB37cWHUtSamk9/+LxGVqBGAWV2lrtQAtOyvMpVEoCLHyxuIaptM8?=
 =?us-ascii?Q?0z54G/S0EWfrcHEB0uyL3+FeNWZ70j5hNJVN/RBtutPB3RAQKuEusCBzcP/f?=
 =?us-ascii?Q?rPNPcZiQnJElzd90BxblrdXt7ixrVgTAueqZ3r2sJ8w17V4kq/50jrruvxHY?=
 =?us-ascii?Q?q4u112pfDN4qKHFTXkAOoIqsrgIvSDnSZeKSE/b7Xbs7GbjzEsu1DOBeX+Wa?=
 =?us-ascii?Q?W5QX5UJzClNUAV+tcPkaEbSCKyPcqbfrNYg1qV0adDRQD0xP6Loxgi54rzEn?=
 =?us-ascii?Q?HDN8rCDjFFZXG4pQHSP2espCWz3o7UDLRz8/gqBWYj8qnyIAaiTt1m3gegaT?=
 =?us-ascii?Q?O3hRWr+GdEI0jA5f/Gu4vE+DuH2YkutAun+Yw5NOT9wEwzHFAci7uGgX/PFl?=
 =?us-ascii?Q?Y0grQlSovxdg9CNaIMAhq9nVDsQXa/wM9feEQa7xAG4/0UPGbjpZzTTlrG2X?=
 =?us-ascii?Q?QDc8zUX60WtpURMnJMmVZTuhwm2RYdvViIA0qecfM7ayhT3IXq9DJjKNnjOy?=
 =?us-ascii?Q?918R3FeJh/3KxxkRIevQMANCj/CaLcmlkCC8FkI9dQe6dj8aQlOzi4XAQvzK?=
 =?us-ascii?Q?jNHP2Xvcz5TQuVkF39ZpMiXa9v3C83Rz/cJLuP2HXCJnWkz0I83ZbVLbunXV?=
 =?us-ascii?Q?elxeP2t1uyhblZ+d4nFcacPJAp4eJ8owrox/6t8wYqI5vg/5DbFAUlcczL8e?=
 =?us-ascii?Q?bt3EPEtN5z45+GKZZX5Gz9ietY3QrjQaYyNvnHzj4ojYi+SzXBbiXWPPGrf3?=
 =?us-ascii?Q?91wW7araly1PcgLokFt0SuesEGBC6/KWlDexRNfn+Q/He02GxeKMPSB3QVyW?=
 =?us-ascii?Q?+WRSnajNC7jPgyGI6TzpoN23nEyjs05N5oF+pkgJWxx1BeSDkBnfHOmWzrwX?=
 =?us-ascii?Q?YsO4PTOofYSvytM7ZVGVXnTPEaKVUHpE6S3V2M+3sGlkSjAN6L0hXr7j82hc?=
 =?us-ascii?Q?YjgUc4jDaE4dgo5Q91BYuMqQqwGFFPMFTKMOu9SqKdwTdqQ6CKssB/0/6IbK?=
 =?us-ascii?Q?OoYan022Rme+xmVCod+nOaLwPpdA2AuB6e4s0q7XLJqc05TJqP6TVuuFNlji?=
 =?us-ascii?Q?hNZzXVzfmFSBqwgxWU1mbl8jwVvyGibtVqkjEqHxSbZTT8O5dcEI634ck8xP?=
 =?us-ascii?Q?pJ9hOkeJRu7kB7QN7S+CKJALNhAyTSKxkeBMq9qXDUi6jZ5Ddz3R1SLjfWO4?=
 =?us-ascii?Q?bXwQM5E35TxQx6DC5D9FlwkVKcoGpLZYr5AHHLzCmvZY1GROPxATmqayMcwq?=
 =?us-ascii?Q?57N3pq59tb023O8LYm0=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:57:12.3926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c270e60-7e67-4748-f939-08de3be1d8d4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_055718_067292_77A94127 
X-CRM114-Status: GOOD (  22.83  )
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

On 11:38-20251215, Anshul Dalal wrote:
> The bootloader on K3 devices makes use of mailboxes as per the ROM spec
> which might be different than one's available to the kernel (firmware
> spec).
> 
> Therefore, this patch adds the missing mailbox entries to the DT binding
> if the matching compatible is ti,am654-sci to represent the mailboxes
> exposed by the hardware during boot for the purpose of loading the
> firmware. The newly added mboxes are made optional by keeping minItems
> as 2 to remain compliant with existing device-trees.
> 
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> Changes in v5:
> - Added commit description for the optional mailboxes
> - Link to v4: https://lore.kernel.org/r/20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com
> 
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

Please add a different example for am654, i want to make sure k2g still
continues to be checked.

That said, AM62 series of devices do not use notification pipe for
standard communication. So, the schema will break for those.

in summary:
k2g: rx, tx
am654, j721e, j721s2, j7200, j784s4, .. : rx, tx, notify, boot_rx,
boot_tx, boot_notify
am625, am62p ..: rx, tx, boot_rx, boot_tx, boot_notify

we will need three examples, and will need to add am62x series as one
additional compatible.

Though we could play a trick by reordering as follows to handle superset
of am62 and am65 series as follows, but I do prefer explicitly handling
them:

   - const: rx
   - const: tx
   - const: boot_rx
   - const: boot_tx
   - const: notify
   - const: boot_notify


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

