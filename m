Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4BA106FD9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78IBcE+B45wRLbgcyTuTGBG0Z6njh7FKylyFqaHQznQ=; b=wuppM3jB35Vzh3u7gAmMwHHJJu
	a48+NPqXda4x2XI/875wNLwHNq8+mP8UlEoOOVbTEOvxykjyidjzipUKek+Mtd55VmBEwxcFRqQW3
	TgsD9tCBQkbgHrgFBUpxF7RJIn/9CUZjkXx9CB31CLEkYsQWr/XERvzg86KJzAaWiJkGlQFVTv8RS
	5BteyzRzZehZMXj5o3sV6WjxMUVYG0o1pd4Iiu8dn3bvnddZSwOoL9rccRUY5k0FNUa2eh9pB87CW
	+ZaM/5hds71d/l/7jMsmF/ZwcT3EM7oUrQU97AHSuRh5WGXgfZg7M4LdZzHdVrWcwJyyY6uTw+CWS
	8BJw3/Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xBd-0000000H5g0-05iN;
	Fri, 13 Mar 2026 07:43:57 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xBa-0000000H5fa-49U4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:43:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xAK8Pme5x8dfxhzHT2dIbvbpykNUmZN6ASvJoAhzA5DixpE+Sc6k9zR1k3TlgCv4iLXi2/cjM4Go5QrgE2O3WI/U0R82Ahbnn/ABqcuqob3nAh41HDB5YmMs2URtFjsrSXilgDEOVYOXO1useJ0aXrdtP1wwnbCgjB8L2o0Dv3QFw3GlGrColoy/otlJ4cEVY9D+moE5eN/uSUEsd9zxjC+/djysQt9fbWYjNEm8qwPpeSmHM/TwlkShHdptGEIlqPZtH3Qv5F02j3N0JZVZRMNDJxhjMcCdWxU9PCfHNRNCmEHRfkbVAS2DbYrgSWFqNAcE4kNMz8hdNI3fP9SV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78IBcE+B45wRLbgcyTuTGBG0Z6njh7FKylyFqaHQznQ=;
 b=HYXmqA4XtDZMXxCcRsTBurhLWxmjP6Cg1m/Q+Mhmj1nG4TrMyCyWRCoMomgRj1r7LFYkXS6YWrZX9rINDCqNyanT0fShgIkj3Ge8/DSSP63cibRIhKRqsuYE9QGc0EpznAegk9s0fxtT7voHr82OYVUgt5rOuRQkEoYQIGR7ADwkWwDnVdtYeUG+XXVLI02/67v3jL7xmtSgLb3ttZ4tmlTwW+2y+aYj1qxCfJEXSxWMB28f6d35uo4SnkLNLZNF8YsOH0kSb108WlpxVz4Jantckw+vXNhMn80EXxixXq6MnpiF+UASTZsKPUuNdhL1/LqEEzxLRaQSqXT42hPLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78IBcE+B45wRLbgcyTuTGBG0Z6njh7FKylyFqaHQznQ=;
 b=NR53lqLNUoHf/YpjjgZ0vtDj7zf9dXdDG6bXO/4Bwh7KzxeCy//KchYR8eY7OWZBrvgEG12Du0lZLcjc5icmLQqKUGedXdJauA81bhoWIkgNNdXnr2+Rpu9Pg4p4pmfm4hOCwjDbwK6paHBSd+BDZEg/4R15k2kPvdRq1ef2NC0=
Received: from SJ0PR13CA0127.namprd13.prod.outlook.com (2603:10b6:a03:2c6::12)
 by CH3PR10MB6761.namprd10.prod.outlook.com (2603:10b6:610:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 07:43:51 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::1b) by SJ0PR13CA0127.outlook.office365.com
 (2603:10b6:a03:2c6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Fri,
 13 Mar 2026 07:43:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 07:43:50 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:43:31 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:43:31 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 02:43:31 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D7hRuE3842840;
	Fri, 13 Mar 2026 02:43:28 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>
Subject: Re: [PATCH 0/4] TI: k3-{am64,am65,j7200,j721e}: Add ti,min-output-impedance
Date: Fri, 13 Mar 2026 13:13:23 +0530
Message-ID: <177338196938.240421.8239416374591537115.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260223105448.1110428-1-s-vadapalli@ti.com>
References: <20260223105448.1110428-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|CH3PR10MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 001545b4-973f-485c-f9b2-08de80d444dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: IfMl1EJabUA8wANebS9SvdKeB7Va6lHfzN6wHNdQwZ6oe80ok+Sz0Fo1FYS1YMJTsGBFJ6GyThJr0HGxKrIvleKb4IirnhiEbxlpAhIS+TqAwRvGuo8m6TswZz0rhzS4VL4LMN6d9fCYqQlBoFRLkh9kHXcaHCslS0ZSnsihKqTZR+J5gBwqlsLPB5/x8QMpnbr/X7q8O9/roLmnN1ZHT+TPY5wTKUo2XHu5iAFE9tBL1ubAdBO+eMaNhK7GRnd8mDjQfrAzEOZ2L7CqdOVuV3AQDWQc4N0kUWSQLkiIoNqV4JD7PafxsGl8sfgn4LyMwJTCBIoc+mB7kvk/HpWoqqm6kcNbndsZBVgLuSC3ofS+cduygx8M8l0fKIdeJ1Q1VN4wu67rGz67hyc0SO/MHL00lOzZYRCAgRkSdi4oNu2OTgRooKaEmxbMxIqEM/9O2ZGSD+TYh07fU1fCQ9FtPGdat7lhEsd0tgBZBGFcLjmrdVhk6zQ6rmzQJ1eU585A2RDn1ssrhogtma23HFEqtqzu+gjc1IxMzeSyQPk3WlpNjY8bXKTI+06/7rmKHYO6SKM5fD0oOYo1oBt86O0lESn6knTchxlctMRShRaeckwLnAqn6BMtDQFW6kG8AqsLgMCYF9f5TZ8OgHwAS9R3FRrRWEFYQaKbPNVmcLiEPEH7iP2GDVFa7hGMk6auO0yAxJo8u+szy93wnEFoumYOFHvzVFspRWzmJmcinnZ0qsY=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7ugKwdNJ8jyN6fzHSmtVkSM9dgyi3+sC3yGhPDF41EVBEwmbVVOPEbKz1ttzFaMnDdRaJZGeJI90LRn1sB3Vw+sluJTan3Eea7zmodl6HkLDaG37amhquy+Fkhd3twNMTMG+wh9n8kC7BVexrGGtlelCDdJGRGr6o1GVWCSfJ4fa86HEfp0YnvXN8zeVtW5XvnQUcYkxEmHS2c0psmDjNO+UhSbK6afZNoZhgOt5rKb3guVkWD9AG+x1GsQIOeN4o+Ju4JzZ6Hqj1gAMRQk/LEG6bMxEDxTYAeyyIBH33d/1Aecsxz1Z4sz0SHbHNpJ13+s4hwWKyMxeH4XmWZJaBVIiGshyIVYRFWYRg8xb5106doiMQjqpBq39OgSezwkxtM/F7RaAJzcs+nQb9fP/qxB545rX6GTwrFuYP/CdxYpXNXsrY9Sy88pyXtRXXNAm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:43:50.8686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 001545b4-973f-485c-f9b2-08de80d444dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_004355_051598_17446442 
X-CRM114-Status: GOOD (  14.18  )
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

Hi Siddharth Vadapalli,

On Mon, 23 Feb 2026 16:24:11 +0530, Siddharth Vadapalli wrote:
> This series adds the "ti,min-output-impedance" device-tree property for
> the DP83867 Ethernet PHY present on the following boards:
> 	1. AM642-SK/EVM
> 	2. AM654-Base-Board
> 	3. J7200-Common-Processor-Board
> 	4. J721E-Common-Processor-Board
> The "ti,min-output-impedance" device-tree property is used to program
> the I/O Impedance Control of the DP83867 Ethernet PHY, with the
> impedance of the MAC I/O lines to/from the PHY being lowered to 35 Ohm.
> The board traces are such that the default impedance of 50 Ohm results in
> voltage undershoot on the MAC I/O lines resulting in CRC errors for the
> Ethernet Packets.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/4] arm64: dts: ti: k3-am642-{evm,sk}: add ti,min-output-impedance
      commit: 2870e4deda9cd7e63ab140ad1df7904d4708f851
[2/4] arm64: dts: ti: k3-am654-base-board: add ti,min-output-impedance
      commit: 48c2db8733ea3c03e4081268a6b1031ec5e5a186
[3/4] arm64: dts: ti: k3-j7200-common-proc-board: add ti,min-output-impedance
      commit: bd24b82e1f98994519b48b2f491334a764710caf
[4/4] arm64: dts: ti: k3-j721e-common-proc-board: add ti,min-output-impedance
      commit: 6195b626bbb76415409d0eb4f5f9547cc2765ee0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


