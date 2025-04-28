Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BAAC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 12:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynG9wzIF1Onq+TKNLQFFv9Ro9wi8C9eKPIMe1hh7VGk=; b=O6FbJ3sl0JGH16Gjlm6Y43GW/i
	HdW7LPsIdsHsqa39ypJVwYe1iiFLsK8yg5n8lW8bHirEH7IIueSz9++OKQ/jkGfpJ5aBcpsXd+cGn
	yOUkgegXf/ZtO7cm1GK5dWbmNgDyWIxs9C40D5I82TuVX3BYWSlZfC1sgukHnBKlLf7RI+92ThTD0
	43iG8UowTi+rSpTsyNdNa7ZLCdal/jPzGm0tNiKPnt7xqTE80WCZ2xIMOG5tkylU3Dvx0Kjz+PH+J
	1+YaZU1027gsBGctkjXZt9LkyN7+QsRk4Fb4CjcPFfNeE0w6TT6BHbTYkWun8aPN0A02XRlewRKrU
	xHbtbxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ns1-00000006FdP-0H77;
	Mon, 28 Apr 2025 12:46:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9MTi-00000005uoX-0Ffk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 11:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ynG9wzIF1Onq+TKNLQFFv9Ro9wi8C9eKPIMe1hh7VGk=; b=fIOFu5D0imkSdjRiXvSsovZ2fv
	/7yF1vF3Xx7NLhvlVLB0VsiKe3FGowrVxrbdu8fQIWttnsq/iTnTXbYZdC4nYz6szf+BZj1gTOWJI
	0OE6LJc/t6bp/HlPvfiSJwzP+Y8aELp0rB5G6M4pqyZ91TONxL9HtGT6DVNbYpGqi3XlDol3zZdUR
	i0dYfW+y8DWZqy0/uTGzP80/mB8ZkJhpXJIKUR5nkNZZV8MCqSvYtmsI4rRcptu2JJMQRJ/0TkDVp
	5bA2Uod1Mvko94yhnotyr/Q6v5Y3wEuA/oqjvmyS7HktrTTHxjH3EBA4IeGVfCbalrf3Snkq8wI1C
	RJlyawgA==;
Received: from mail-am6eur05on20611.outbound.protection.outlook.com ([2a01:111:f403:2612::611] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9MTf-0000000Ch0y-0A41
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 11:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fd5FRuKzPyt5dXGhqDM9wp1LlfxPjD6s0Agx58WLrLPKeOXqsUCuCOekc4EE3JZt56oBzeEpUd72yFEtNWZCUys5wkr/N++Fteh6YDLESckOHH4YdYBhf5JKnqUmiTheFtkPDkB43ZZW31SXG+hmz0aE58sOIsKlL50M9m62FbJfyjUcTyO0crCsi8BM2wB9i8Zt6425YS5KJU0m7fATUlmtWPFVVYmaoY1aQYbJmEGqyqzPj0lpRD5GikcyNy15uW6/5Lo96gSiOImFCWOnw0vW1cUHqWgyhSo1VYY+63ju6XlmbYioZiuIT5W0B9AGry+afU6dYpR31Q4NmA5qSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ynG9wzIF1Onq+TKNLQFFv9Ro9wi8C9eKPIMe1hh7VGk=;
 b=yyHbXfasrT35tnhTYIOjnOay4SjFdtcjXG1HWJ6PmfabsNJvKCqiUuny43OMJgeqQbSt0QOCQbtYfV5/ExqLz4UVPubXS2uKPItjt4RY1SQXEWSSVH5Ou9JVZrAPyeHpzviILtQ9evDTUem3WwcJRmvmjzqUyb17om3hK5zKDUnZrzxdiREBkQ5iXU/QyURSUV43xTQyWpW4ZV+IQOI4Y9aSrGoxqi9a9ER+nmvDpaO8BZqtV1Q2x2fdHwBIlGBDOjTYWCxgLyhBbuxoRy9ZYRkJNoTw4J9ZEhC0yZ9CS1WDqi+hsi249Ptk46gs69g18IfZAJrac1fGHmNUoGtLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ynG9wzIF1Onq+TKNLQFFv9Ro9wi8C9eKPIMe1hh7VGk=;
 b=G2n4wsWEByH2imqlPBpfyd+RdYyvOhMwzAXGX5VT/zSsZqH2lIMVT4mqiL9xt6eWVCnIBm8mqUz8PT4bvzzl4XNYkhbfz1MbYcjml9GMTaY7pkJ7nlKixpSAkv9hgEnlOyGq551fOFODKJ3cYTaDZIG8y/7XAszXmmdtFIuJLog19UE3ePgCbRFsBE6yancQBEAeONB56eQRs/2yR4892YcrH3xEm97+QsGFTLYDv4myHUcSe9BkO8fmDxl3vcUT/w/QMJChd5yN4gU0WvneEsPbFfs7lb4epCHiDpIxULDidaJ+mzYuwWHwPeb1UzQi++N2WVsWMpnVigxt5cE0vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PAXPR04MB8624.eurprd04.prod.outlook.com (2603:10a6:102:21b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 11:16:44 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::a7c2:e2fa:8e04:40db%4]) with mapi id 15.20.8678.025; Mon, 28 Apr 2025
 11:16:44 +0000
From: Wei Fang <wei.fang@nxp.com>
To: claudiu.manoil@nxp.com,
	vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 net-next 10/14] net: enetc: enable RSS feature by default
Date: Mon, 28 Apr 2025 18:56:53 +0800
Message-Id: <20250428105657.3283130-11-wei.fang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428105657.3283130-1-wei.fang@nxp.com>
References: <20250428105657.3283130-1-wei.fang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0019.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::6)
 To PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8510:EE_|PAXPR04MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: bdbeb30c-f6de-4526-1bcd-08dd8646284b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?518KI1k3FUmb5Sb/eB72IjB68aRtO1oc6B/eEU6cpUZE2p8/bRyLI/aNuFxH?=
 =?us-ascii?Q?1M9a63rcdcRCBBYoWDauReSqlKukTxxY7izKdXiXLCprPIbCg2ArysXAPDkm?=
 =?us-ascii?Q?bjmxGXqZwdcQXXB6QzmI3EUseSEUBResm29x42QbQfSpp5GkGKld723vFrqc?=
 =?us-ascii?Q?6nfTeReoun8DCZLpl7iuw50YNIlPXBrOrLjFNN2L6CNGMPCtOqo5ARSENL3G?=
 =?us-ascii?Q?4PwB/ejDnSigE9fGRGDdMT4ASpaVQTB1oKhTbqTN40BdVtZPPFyHyK7TMlUZ?=
 =?us-ascii?Q?STArLu69k9kB9KTu8EizsDAKlMyRpgsqgt7eFUlEaKcqu/TAdr+Uo8G+K+Lg?=
 =?us-ascii?Q?UONRFvfQrZrBp+tsdHRAzpIUqfzUCM2bu+n+v/BBR8qQFk05qi0jjHzVs6oM?=
 =?us-ascii?Q?pJwda64zsm05BqCPYlPpeJpZSQxPBQnTHNXhjbSFFMDw7XVhR/Y7W95iV7sF?=
 =?us-ascii?Q?KP7gaEjyYrzDr6aSB7pxh2l6csiP/l1fHCwCKHprjL6pSGjnha0vB8UaTONq?=
 =?us-ascii?Q?6A5y3id345h3sE4ktR1WdNyCTmWKGjZv4qzM4Wnp/lHxkFtrdR3bc/poaFKJ?=
 =?us-ascii?Q?K+GlZDX8v8DIjVDed0T+PB2pzUHr64MFJNXf/GDgd1g4xvJnD7kHvEHHLoxT?=
 =?us-ascii?Q?yZBgxU6MolZ3on6uLzdErlP1dv3k1m6ZpimGWvYThlhdLXUGZYKbRNFvzJnt?=
 =?us-ascii?Q?yfoHeUFu+6PTyJd6d+Xv0zjVMY6e3no5T2V9INh0ZF9eEptgcnwqUEmsYC/V?=
 =?us-ascii?Q?pYOt14y6caALqz6g029Ydvi3Q5LTD5uSYdBoP4NOZMk4SX34Y+aQAqMOcoSn?=
 =?us-ascii?Q?e2gWczSgHxYDcNtpYYwRBifTBR+ICR/xK18DeMLM4zFp5SSod7uBQfwWWJ+i?=
 =?us-ascii?Q?YarMENmcF9NyYN21u/FAbPH8ITaTVwzEcnhjW/cJY+u7QxCdwDj2lvwkffI+?=
 =?us-ascii?Q?ftZa7NnhwxQMY9N+RjTsMjIFPOxTjIFdWHhpTToOiL4U1k7UChPtlMDoJ63c?=
 =?us-ascii?Q?pNCHeVrkkRlkSS4/1ZiIAiAYt1/UgfXOLS4tyVSLQ2jbaY4wjhhLehTWhwES?=
 =?us-ascii?Q?R6WsjZykGtVgGIZk1SBt65w0m22ZWKl7o/hBiX3esS5R8CGml1QtbQix7QnC?=
 =?us-ascii?Q?qItuN62QEYWz2xURiilTRkuaMoQnah8X0AWY7AkUtbL6EsEQXwtKwrc02+Vg?=
 =?us-ascii?Q?/zn4l0LCUoqIbW3nckOYTSoyxGB57w6lOFUUUxQ48SmpaSgtd/8bbBEf2m7z?=
 =?us-ascii?Q?zXxCj2boWRaYua2SHmUOjUpS+59+EMtwbteOfsjv4xh4F0N3ssW/+9ggeD2m?=
 =?us-ascii?Q?UWcEiHgjwO7pY55g5P6qRYO4NJAF3r+6cvGzPdTCzq79DpaGXVoJE3YYL89Q?=
 =?us-ascii?Q?TslEUdhLsZgaAZS8OE9jPJDhqWiPujP5sALZQGakgW17B0Lrefi4GSDkpS/S?=
 =?us-ascii?Q?MJ75l+akeM2k4wbdSaaBjdnWQkmsjsrUhJu3QPprbZZDc3cFkIuriA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pUzmm/Y8hhfpTZnrpXSOKLPEECdNB1uw5HiCx7ADcwaBqfyXrhpSqRu2i1dj?=
 =?us-ascii?Q?co/Ohhy9baYQFxiTuWCkfFgzDRAexgh+4J7d4+NWgTGkDerWk3qHu/+hsrTF?=
 =?us-ascii?Q?1Rs5bSCaD79rsegoyxMwjov+sWAwkiV7Wl8jG7g2QajXOdv2QUY2zkwODzf9?=
 =?us-ascii?Q?+K8rTFhv9fmY4JePnyzTIPClVlAXFogIkgkntkGoKuHRto5odBN9wwc/w7tD?=
 =?us-ascii?Q?unU28VyQBqi9BtfVLyYJauSNV67J/OXFtwKPd+TuK05WnwW7TXfGwh6Vx03+?=
 =?us-ascii?Q?YDmfdO19aPXDfpWNHZNAXI1h5E82G58N3JTk1ffvLbcuSNlQnGKZPaAW9b+X?=
 =?us-ascii?Q?XTq/vHdp0YrOwEoh7xr7CXFWnh+Yz19vzVWmsN3IXBbI+/tKKHkeHlY/rU49?=
 =?us-ascii?Q?59BXGee8Mu79Uep03QuBmpGF71gSz+z2SoUCvmxJPe3nsi0qpCqBvPLprPHX?=
 =?us-ascii?Q?j2nIjEkdfE1xzYlYv50UW9C3UnQD1oFubaS5YY7cO3hciR+OfM4MbuJztLTx?=
 =?us-ascii?Q?jgGGBU/ZC2p/2FB87tghQ58kXEfz5LZqbftjF9y9vLFoBgFv2Qv1CqC3r5vn?=
 =?us-ascii?Q?aN9G45E0fsycVkvdhSuVPZpeQyqFetyh2mDi6MBlX4RXtc+kwhJVD72STqQw?=
 =?us-ascii?Q?wzrOOLHp9AUlmrbZKVQj086f1Ae4WW6KDDKBwiG4tONMwFLexKEBeYexXiYE?=
 =?us-ascii?Q?p+y4m90/mOr7ENmqAGIhYe/1153C3pcik/83DJAxdapE/gltXtrcJ57fZhKp?=
 =?us-ascii?Q?eVuR6afvODlBqzsnXMR5eL/UbArN8/LZYVRYl1AnmSXDW9MzIsoNqgP92za3?=
 =?us-ascii?Q?bUD4NPIDa/amkteN3Y2SBzWs7q/WvWFWRK8L53EhtWqQTyMCgKwIbaRClYKb?=
 =?us-ascii?Q?6YWuqxYqat8TAMJRrymZHG932z9JDyWCCLcuBVYLfnBtZI3JNLpSFq9BLLR0?=
 =?us-ascii?Q?RNndcVGvYUxZFIR0x+2SUIwDCgEtM70wLujXkFS1PL3qe+BtwG5WAznmTruH?=
 =?us-ascii?Q?I8Qf2M7QHd4lIcXaF1Zf53p+ivVzxCFTAy+XCLOlXnDSgilUk/pmcPra1KDD?=
 =?us-ascii?Q?indzQdyOtHQsnc96RDSQCJp6XU2buKXw5wwdndc8fPBlGZ9J4hCZOnNVCirC?=
 =?us-ascii?Q?0CKLeEySV13V0DZuMno+9rN4pFcGhOgElr1n9yVjqJE+uhhVRuc82+IygdfA?=
 =?us-ascii?Q?jD9lriqQ90z54erZQz093GMEeBpmRN/uR1KlmVXZYNcd5EV3rByxlONqEXKx?=
 =?us-ascii?Q?5WI5vYPI/5H5jBWjTJKkkNOsE9tYyDTcTfE9PhSJSe6iqZznmJYNvDkZNmnf?=
 =?us-ascii?Q?ch2tL3LiGFi2bi7rCS/wL/ATD+WJ97Df1Fk1jQPzi41NTDS4AWLMggrolJQC?=
 =?us-ascii?Q?0IYS5g7Ix9fTy8ABwLHxG0C+1zefsZ2frWr8yHPra6Mp+009UmLYKHPA1tgF?=
 =?us-ascii?Q?by8+J5WpKLr1Ls5b4rEY3q2IogXDdp1NcGnUAQ1fzcnAkuwLQfFAu5piUOcm?=
 =?us-ascii?Q?0CVOZKLI2vJJOYCJwjIg+Lntz06WlEedIUW/H6xiMcx2OJ2JNIJenmOHhLZj?=
 =?us-ascii?Q?5nPiMIqkcn37rSdcDvVkSuSyCLA1WQ5sXXmrlRsM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdbeb30c-f6de-4526-1bcd-08dd8646284b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 11:16:44.1241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2q8pg5rAbvqVxa4gLzhgo7E8QICxkEv6eu8KKdw+lxFjc6Kp1q9h8AouYePQ2fQULh1nbPymUJZWTtiLSa8Umg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_121647_258639_45242DBC 
X-CRM114-Status: GOOD (  14.23  )
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

Receive side scaling (RSS) is a network driver technology that enables
the efficient distribution of network receive processing across multiple
CPUs in multiprocessor systems. Therefore, it is better to enable RSS by
default so that the CPU load can be balanced and network performance can
be improved when then network is enabled.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
v5 changes:
Just rebase it based on patch 9.
v6: no changes
---
 drivers/net/ethernet/freescale/enetc/enetc.c  | 31 ++++++++++---------
 .../freescale/enetc/enetc_pf_common.c         |  4 ++-
 .../net/ethernet/freescale/enetc/enetc_vf.c   |  4 ++-
 3 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index daea85cbf043..7e92dc0a9a49 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -2430,6 +2430,20 @@ static void enetc_set_lso_flags_mask(struct enetc_hw *hw)
 	enetc_wr(hw, ENETC4_SILSOSFMR1, 0);
 }
 
+static void enetc_set_rss(struct net_device *ndev, int en)
+{
+	struct enetc_ndev_priv *priv = netdev_priv(ndev);
+	struct enetc_hw *hw = &priv->si->hw;
+	u32 reg;
+
+	enetc_wr(hw, ENETC_SIRBGCR, priv->num_rx_rings);
+
+	reg = enetc_rd(hw, ENETC_SIMR);
+	reg &= ~ENETC_SIMR_RSSE;
+	reg |= (en) ? ENETC_SIMR_RSSE : 0;
+	enetc_wr(hw, ENETC_SIMR, reg);
+}
+
 int enetc_configure_si(struct enetc_ndev_priv *priv)
 {
 	struct enetc_si *si = priv->si;
@@ -2450,6 +2464,9 @@ int enetc_configure_si(struct enetc_ndev_priv *priv)
 		err = enetc_setup_default_rss_table(si, priv->num_rx_rings);
 		if (err)
 			return err;
+
+		if (priv->ndev->features & NETIF_F_RXHASH)
+			enetc_set_rss(priv->ndev, true);
 	}
 
 	return 0;
@@ -3242,20 +3259,6 @@ struct net_device_stats *enetc_get_stats(struct net_device *ndev)
 }
 EXPORT_SYMBOL_GPL(enetc_get_stats);
 
-static void enetc_set_rss(struct net_device *ndev, int en)
-{
-	struct enetc_ndev_priv *priv = netdev_priv(ndev);
-	struct enetc_hw *hw = &priv->si->hw;
-	u32 reg;
-
-	enetc_wr(hw, ENETC_SIRBGCR, priv->num_rx_rings);
-
-	reg = enetc_rd(hw, ENETC_SIMR);
-	reg &= ~ENETC_SIMR_RSSE;
-	reg |= (en) ? ENETC_SIMR_RSSE : 0;
-	enetc_wr(hw, ENETC_SIMR, reg);
-}
-
 static void enetc_enable_rxvlan(struct net_device *ndev, bool en)
 {
 	struct enetc_ndev_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
index a302477c4de4..a751862a70b1 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
@@ -128,8 +128,10 @@ void enetc_pf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	if (si->hw_features & ENETC_SI_F_LSO)
 		priv->active_offloads |= ENETC_F_LSO;
 
-	if (si->num_rss)
+	if (si->num_rss) {
 		ndev->hw_features |= NETIF_F_RXHASH;
+		ndev->features |= NETIF_F_RXHASH;
+	}
 
 	/* TODO: currently, i.MX95 ENETC driver does not support advanced features */
 	if (!is_enetc_rev1(si)) {
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index 4fafe4e18a37..f6aed0a1ad1e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -155,8 +155,10 @@ static void enetc_vf_netdev_setup(struct enetc_si *si, struct net_device *ndev,
 	ndev->vlan_features = NETIF_F_SG | NETIF_F_HW_CSUM |
 			      NETIF_F_TSO | NETIF_F_TSO6;
 
-	if (si->num_rss)
+	if (si->num_rss) {
 		ndev->hw_features |= NETIF_F_RXHASH;
+		ndev->features |= NETIF_F_RXHASH;
+	}
 
 	/* pick up primary MAC address from SI */
 	enetc_load_primary_mac_addr(&si->hw, ndev);
-- 
2.34.1


