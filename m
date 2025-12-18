Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4E0D6E2CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAphim/8lNJpWq8YT85qZozcvip6tRTa4pz+GNjLxJQ=; b=IuucPXLOYG021uyyZ6ppe8Etqp
	3VA+FhHPoWVeYOD4oNfvGB3QEe+EXUCBZteNXVgzY6tUTS/Z40iRlubfhimyM87fVFUI4os3cvkdK
	5bNQQGxaUldPqilYEvNKwmEwgiq4E+y+p6mMfT6zNwc93iba4Udq8j9hOfOq9J1S5FfcHugRiQvz/
	2GytDypnCHTEYuO72tvLIL5Aiz1XlwFOeJZdXUAXPqdk5xLLUQEo13zgAtnQTmm5tVXoQKOp4Ke1V
	mqbZdL6RCyGoMkSrT3oePc5s3/jELoTxLfNFVFlwGMb2I5UGwNbmqB/qeC9fP8baszAeRJGU4jGHF
	oRJ1g1FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJJ8-000000092Uj-28z3;
	Thu, 18 Dec 2025 19:05:02 +0000
Received: from mail-westus2azon11012025.outbound.protection.outlook.com ([52.101.48.25] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJJ6-000000092Tx-02hk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 19:05:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4bI1fTbAMahL8nxWIKJAv1Pf28uqHxur4KTcgPLIwuu3UCWVMwZqUGP/vhReUx7e3RsCiTRZCt6pw3cmUXMfpwe2GEjoV1pG71FOhu/IUkgU1K9Fpx8ce5Z507Yl+qHjdUdWYH8PJn8ScJpW9eg8tokoKBUDzqV+IjHZT1hGtZSZepZ3zplBPxnAPYyFamtqHe5oa69dcDAQVGz2pLeBHfU1mmCLHOJ9as2PwvZVG+2uAxQajsVHeDk4c6M5sUL0iuXWUQ+h136VqlxBJflYGU57pj5N1cetaQFVNwoTI8kCfIntioQW+26SYGVwMulKG4aSGiqHtztEZkrZt895Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAphim/8lNJpWq8YT85qZozcvip6tRTa4pz+GNjLxJQ=;
 b=A9Cyb17bcrfK/SThIaWlVfv6AnQkP++nHSZD/wXgEqSN0leaiwxM6t3x5nBcjw0VfosTP9YNx5jEjOXmBKtRNpzoHi26Aqa/fjsUoY6ZP8O/xSCBhNOXCNW9+7X3VS1estE9Ezr6uaTcgtj66C8CLdPIbsQH/0G8JQaSxcTTUWlUcxUGO1OPbFmKf6QpkIM8Po30m1ut2CfHf8xkiv2Fl9jpZAOyKLaOFtWzvLqLUPw3O0dvr2ty5fAjDm3gROXcyk6Yh0hC8KR8lzEvKlqP7w969lT30YA/0QFsjn9bmSv089cOkP/Uxp3BdIGs/y/ScFNm7BzU0jYpIMOqmUDn8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAphim/8lNJpWq8YT85qZozcvip6tRTa4pz+GNjLxJQ=;
 b=IygKVGCvY2G0H7SCPK0Liut40tn1KWQuBB6Xi9fhyHAfgD0mUCUXqfVEoJARLPwCvo2tWTcl0KrCqQhV6/rqNk0LRhTgQQ8AsHdnOY6cwR7Ntnx/hjawtcVl97JhG8VMJAf49PaDMdgrHcxTVRBHa807/6OyPP64OMz3XAFEdMQ=
Received: from SJ0PR13CA0078.namprd13.prod.outlook.com (2603:10b6:a03:2c4::23)
 by LV8PR10MB7774.namprd10.prod.outlook.com (2603:10b6:408:1e8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 19:04:53 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::24) by SJ0PR13CA0078.outlook.office365.com
 (2603:10b6:a03:2c4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.5 via Frontend Transport; Thu,
 18 Dec 2025 19:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 19:04:52 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:04:50 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 13:04:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 13:04:49 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BIJ4nIT3789119;
	Thu, 18 Dec 2025 13:04:49 -0600
Date: Thu, 18 Dec 2025 13:04:49 -0600
From: Nishanth Menon <nm@ti.com>
To: Rob Herring <robh@kernel.org>
CC: Anshul Dalal <anshuld@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v5] dt-bindings: arm: keystone: add boot_* mboxes to
 ti,sci
Message-ID: <20251218190449.cnp46cf6hikt6cqa@freebie>
References: <20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com>
 <20251215135708.ij5e7jr3binzmlbf@panda>
 <20251217125747.GA689283-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251217125747.GA689283-robh@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|LV8PR10MB7774:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ab8923-1b9f-4396-b673-08de3e685347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aoTleKRAs7LpPmpp1coOQCPgdHT0fk9ciWEM+462N0CGWoHupXzK1zNX7efg?=
 =?us-ascii?Q?+XTUx1E+Yy9omC33QamFD1nCpPnVXhojacchdWVBgpGQA5Z1KOYjuPCxUUJd?=
 =?us-ascii?Q?IG6AWRMA9+Dqc5PQY8KkAOp4SQ3b752FhZ6WNWCpj1FZjANIQnnjk//eDfet?=
 =?us-ascii?Q?Ro/TixOLLTknLwa18rkxag9nJcLu8XOnizkeSs3YrPdj3sU5YHAK3OcY9viM?=
 =?us-ascii?Q?k0kXwB/p1mb1FMC0n3wglbUDdngCZlswKOUnc+0OrLYNBQA8Zx6JbJ1VmuT5?=
 =?us-ascii?Q?j6sPSvKPdtgeHuXXmenE+BTW/2jgpzWxrblbVb/RirwZpVnc3QCdsl5ELVyM?=
 =?us-ascii?Q?ALi2qSkSL/4e7AuaN5I7eWgVc521UQbEVW8wRENMsCvaNpNEl9EoMTrUAAQN?=
 =?us-ascii?Q?mqjWL53GPT1RbcIVi3Gx7T6YFP/9JXltgI6woFurqspAGjEtFWDNRfmt9ief?=
 =?us-ascii?Q?f5g6yB2lihPJ3R9sFd8wtavOPZp7QXbUrfjRFiGORWpmu7uW9OSVAYYqG89k?=
 =?us-ascii?Q?nvKkyr3mZNBesqqKRxiid2aCtgRzk+TlKr37K2pjaRu0wH2RFpgXLkON6kxZ?=
 =?us-ascii?Q?Dn1YQcKKpQW0MV4pmX0Dt3Uka4wGBSlUKMk4V7JQf8DC0ohatUrUIwNkOUhj?=
 =?us-ascii?Q?CazX1MNpJYPifiLoxZBTVHcXRaBZ3n4Q4WsP6UR3HIi+WY0H25xM3jkG5DTL?=
 =?us-ascii?Q?HwTxFJPOYubw5b989NqZQcfSZXz6yQ0wZuUyUYOlRSD8T12mAnlL84ZuOkiu?=
 =?us-ascii?Q?NvxRRjZq7pEQpk44MdQR4WTUF7fb75imYrgl0vz6dD00K+VSDpOo+cToN5kA?=
 =?us-ascii?Q?Ow4qsFFOHRV94YKqDmWd2oEtlvJM5P4UQl8ejKNI89IvkpTFDH0CxeO53oE/?=
 =?us-ascii?Q?sIdsj0H55rqFRDD7NVSsJY78lSUoHgvBtfUgO9keIGPbnlyfTTOC5KOfnFlx?=
 =?us-ascii?Q?2/lOzveE8lKJDbeR7+6ZYIgQAwZ8vhAt96tvjwbNcu8HJyn7AXyB+C+Wpw03?=
 =?us-ascii?Q?CKw+t2i7YXoqoFe45th1Ft6tr3jHT55mMw3J3PJYqbv8Xz5E/+hQghqzNvAA?=
 =?us-ascii?Q?VM9t6L46aGD1UB2MatjnSz2FJD4QH3ubDfxnlvxkB01O3mJS4vdikECZ7jBr?=
 =?us-ascii?Q?pvfYLNxqVBEsW1RsI0LrLe7I4RJ2H4QtcMO+QYlvQNM/xxagZmGHRrpeqIyj?=
 =?us-ascii?Q?IdYHwnDMVZZ7/CgT5wJCUvVZCa3eeBtpZt6Lnytxw7jTpmZ8ywqYE3fP15d4?=
 =?us-ascii?Q?tq+PYawxDIHqI1t5rbqO/y/qUiGJaW7uwGf94uDLzJI9RkEAmO51G9UoxQiD?=
 =?us-ascii?Q?AHJ51cGv4cdG/IVmDL8pPFSH6SX1bbaHQq2vp8Lfw6cfA5ejWieron+UQyCF?=
 =?us-ascii?Q?LmTycv2VW8tBnKU62UfJddV5zYw70F1KXJ3JDu2PBwCD1f1H4uxUBA/rZvHo?=
 =?us-ascii?Q?A5ZNC8aE9XCOe1JQm43p12xf5Us/bZ9txRm5Fm+zn2XIcp6q6tbEJCue8Hcf?=
 =?us-ascii?Q?B4LN0rxjTPGYnCGIHqrUa2OPpDnhJLOE+ObClm6q0Pb1Z9/QQtsVGzlc3v3S?=
 =?us-ascii?Q?5k5YxhvL0FoIMHGDzt8=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 19:04:52.7120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ab8923-1b9f-4396-b673-08de3e685347
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7774
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_110500_199105_947E4116 
X-CRM114-Status: GOOD (  14.07  )
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

On 06:57-20251217, Rob Herring wrote:
> > >    - |
> > >      dmsc: system-controller@44083000 {
> > > -      compatible = "ti,k2g-sci";
> > > +      compatible = "ti,am654-sci";
> > >        ti,host-id = <12>;
> > > -      mbox-names = "rx", "tx";
> > > -      mboxes = <&secure_proxy_main 11>,
> > > -               <&secure_proxy_main 13>;
> > > +      mbox-names = "rx", "tx", "notify", "boot_rx", "boot_tx";
> > > +      mboxes= <&secure_proxy_mcu 6>, <&secure_proxy_mcu 8>,
> > > +        <&secure_proxy_mcu 5>, <&secure_proxy_mcu 5>, <&secure_proxy_mcu 4>;
> > >        reg-names = "debug_messages";
> > >        reg = <0x44083000 0x1000>;
> > 
> > Please add a different example for am654, i want to make sure k2g still
> > continues to be checked.
> > 
> > That said, AM62 series of devices do not use notification pipe for
> > standard communication. So, the schema will break for those.
> > 
> > in summary:
> > k2g: rx, tx
> > am654, j721e, j721s2, j7200, j784s4, .. : rx, tx, notify, boot_rx,
> > boot_tx, boot_notify
> > am625, am62p ..: rx, tx, boot_rx, boot_tx, boot_notify
> > 
> > we will need three examples, and will need to add am62x series as one
> > additional compatible.
> 
> Do we really? We have a whole tree of examples in .dts files.

We do not. But, I would rather leave existing valid example as is rather
than modifying it for a new compatible that was just added.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

