Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D82C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5MhHppldrzGV9m4F/68Wpfv/22VTibFt5G79tY8Z8E=; b=WBCloVA7ZmKV4Tb0+yiVzvDzSs
	9de/9DMVtPGjTi1AWaAOaq0aAHZFUpTWEYSm3c1y2gf8NooBqiQXgwUBOaqhvieSsW3T8vCA/UJwR
	iW45cMqKidEitgn+VTnSkTwahgEipcAet//EycveaufQI2VunvQ3rG4vCO1VqZfHgOIWhCKwaOvyz
	UARYH2+roJbSW3N7R8VSRjuqMvOVWc6btCAqdOEwHizz78iFKQHuo2wvKIk6OCky0FnmksZXahQQO
	t3fMJzMI6FiJTzblSMm510QbAvSWsFjffDdfdUn1wkOTkanq3eMN9eFjVBOcH/zVxqbkeArwotKmY
	a1HrdPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2a1-00000001BFf-0ZlP;
	Fri, 30 May 2025 16:27:37 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL2KS-000000017eh-2Two
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 16:11:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKVRwN8M0HVcdV8HxzWI7BnO21i8w9OeSJUaRvG13DZG75kr0vzlKzkvKbTJN2B9ZCVflRacu4NWOwnXRdGTAF0ArI8/+b/oCJKhLIwYzgw9cjPrDZXdZuoD3V3emNYuzKNuIU5YCJE4vqQUFWzFKBRA9xb4AYVhQnlYHLhIVhiNwa3AE0KZko4TLHLFUNdaAmvMCuIvfXFdCtDGS9/zRyowKBCIyN79+1FNUZKOPqdgWaG2G+m/Qu+buG8FYfuRzyKpwDBLKyK+DPZ3Xl+FghFGZx6pzfKad/wLRGZ+Blaz/PiOcedQ8n79tFdzUWbzcNvTwqgsvfa72N5NUvC7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5MhHppldrzGV9m4F/68Wpfv/22VTibFt5G79tY8Z8E=;
 b=VzwTm6QI6YQMqnUBHRgy7+esjvhQKmpfQHfToc8VPw2mNXagzXk2mMxHcdhwR/RQnHLwP4C9v806U9sASJWY1SOwgzMOsFGWJ/INV9X+nsCP2pEbEBEQo85K+w4FWvW1R11c68sRSSlUYbpTiJZm0HgIK3fL+4DXHae6EVxvJEy4atTZhDuu09hUZq2rKTt76GxCIaxTxEZcQI4CgUgh24RX4mFA0X3xvK6suafaP60X1IoM3N9OeaNxCPTZsUXd4yOXxghFr6MfJK/B/THbG18v3o5RUFLx9nKn95lpeNTaQciPwS7KMIr2jK58coGjQroa6V+cl9WPld8L9ytcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5MhHppldrzGV9m4F/68Wpfv/22VTibFt5G79tY8Z8E=;
 b=f7SBEZtjhOsVRimpQnEX544kmDZjcNGKcVCo1ZbhunrNGpecRzwAVbGdn3KzAKhJF1ZNQVe/UzllJqbJlEMAGwCI5euqWcUEO4C/ZLm8oGKXb2XviXkj0bCEUE1pBPD5faw5+YpaffoLYMjNKRsbDVSPurYjPpIhTkm50LhnxUhmfComzqUhgvgJE54VJDYZU4WtrgUbrSox770a3oUhFWCXGxswzWiDDxa8r8S4Ugj9ks0zkHhGtHee1/lV74ic5MDeb2eBbnshxjztpQKGqiCjiwhCi8G00MmihXis99Lrckj8gCkSE3H7Aw7Pl5YxARVEHgyliTXLQE8mcgJ9Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10398.eurprd04.prod.outlook.com (2603:10a6:102:44d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 16:11:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:11:26 +0000
Date: Fri, 30 May 2025 12:11:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: dma: fsl-mxs-dma: allow interrupt-names
 for fsl,imx23-dma-apbx
Message-ID: <aDnYpeViGvIsGCLD@lizhi-Precision-Tower-5810>
References: <20250523213252.582366-1-Frank.Li@nxp.com>
 <20250526-plural-nifty-b43938d9f180@spud>
 <aDcw0sgN1ZX0kCCZ@lizhi-Precision-Tower-5810>
 <20250530-those-frequency-f8106275769f@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-those-frequency-f8106275769f@spud>
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10398:EE_
X-MS-Office365-Filtering-Correlation-Id: 95976927-3b57-429c-22dc-08dd9f94a0f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8GUZl1AM2hX1oDsJK4q+wBkCyaJYPEcmXMlkwPbR7I6jNLcqbFiVMpJ/4Fni?=
 =?us-ascii?Q?GrQRuW11KjoH3+CBFbp8Nx8Zpe8qBw6/jm9n+CgX9Ntm2lnoT12Rh68X6bLU?=
 =?us-ascii?Q?twkTHGZhQ/uJAH8viidwjg9q/FHKZGjYogv4i2hLPGYpeJLr1MU6ILKXY0T6?=
 =?us-ascii?Q?EhqSmLiGdwyRSR53KWPNalLqFAuwOiqOdGvr+ZycBERkBBhkcMoOh32DmnLt?=
 =?us-ascii?Q?ysa0doKnzAbWr9MWuIlrcApGUYRB9o2Sjd4fioYajqqfgrQNFxsZgKxKafG4?=
 =?us-ascii?Q?FzquYCseachcwjSAJr/1hV2Swj1g52qc3wBMwgyFb8qcMW4ZBO79RlFRiGlN?=
 =?us-ascii?Q?UrVZCLZARV+iX2LTwvEw/Vi/XUeGjkrSlpEvJTpunSsCvgu+QltrZnxOw3GA?=
 =?us-ascii?Q?Em8EodZaDfsuytCDLQMLzsRKbW2zjhOHESLdfcMZ2tg/UPBKu1owLs2J0nzC?=
 =?us-ascii?Q?aVMkP9JWr7qL9ejuKrb4pYF9x76WrzqE4pdpcmPn/fxZOp9NsEhIpjgFevVg?=
 =?us-ascii?Q?MkR+utDhGIbzkgS/eVvpBMJdztFiJ0adJyNkFoy4mX3TzCMLER+CnDmLEMEm?=
 =?us-ascii?Q?Lof793cJmC2Uk40zBRid7qq9Wh2RlvyTrGdbOrGZvq0QxfV5Ega9urIA0sMa?=
 =?us-ascii?Q?q41RGwm8+onmWxa9zVZDuUPzSrwCBpse4NcYbUG1LdlOSkwiBjQkjgDFN/Ww?=
 =?us-ascii?Q?wNLTN6isx1QAnrHPJUiHUzZpH33XH0QDMIj1m195iXNtI6sd4g/0BvijV9+w?=
 =?us-ascii?Q?hSdGbJVRXfr3tFioIPHLOe4xeZmzLY6JpiEvcLh/FFnotTPMFkfA4KV8lBhQ?=
 =?us-ascii?Q?YZEmfDkqMBQ7Q2jz1K9LE+NhxnGhAO8B6stliOmeqhrmeI1TuuF9IouxC0V8?=
 =?us-ascii?Q?yy85NdrlnK6UOlUDJWU5/Bt7THUQCDJ/WKEQvQfxkDowXuCyH5q17xXHezX4?=
 =?us-ascii?Q?TO63/rv0bPGJOrLD7O70Ma0gDvuoxlsNE6lJPXj/4UQ/AoSU1VHrxBwG85Te?=
 =?us-ascii?Q?p8ZEX3rdaN8VCIdYV6ZIdQz/oUs4+5/QK/E6VWGhJqucjrPX3b9mA/9g7VCd?=
 =?us-ascii?Q?SJGTVNCp6pF2jmWlxytFNXHTyz2jc7DjXb1RfO+TLxn8nquwYebLogB1pGAE?=
 =?us-ascii?Q?u4yFUbOztjHuJVfJiavazgMCcpWKS/RQRZ6c9ABDw2kqiCoEtMl9i2siDJZr?=
 =?us-ascii?Q?Vb9BNgIuXQETf4bTsSMFfkLtfXmLKzJcpfqjo1stO+3uPNAtZgHl9R8ZihRe?=
 =?us-ascii?Q?gv5iLLzS97vC45IWT7MyCllGez4p+5RlDZ530ZZyTrJPBFcXFwFCZ+phyNhC?=
 =?us-ascii?Q?kjPK6ajtedoVdnPmbcllFnq9qM0NpgWGMbNDx7D/jaukVtD7rjStTu9ajlAl?=
 =?us-ascii?Q?taDXRj1cn9RHYqlIMHdZvyckL0tNYgoSVdzyyxIQr8Yv8IyCjbIrzLGr22RL?=
 =?us-ascii?Q?dV+JOyb7fw/siAiwgb4kJN8ttrcWx/m8yi0sajDRdnAmd/W+dbvyNgn56146?=
 =?us-ascii?Q?c3TU1b3EyplpIFU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ddUHQS1owlHL5fEIwbAHIozEhphvBCn+KL6MGqoITx9VA8uoTrGJL3zDIWlC?=
 =?us-ascii?Q?2bL9H05jS9iMl50ecdZ3lFvCyNyPRuPo5tgvxBtPipysJJqg16UJSCPl/ViE?=
 =?us-ascii?Q?7GDxZQj7itulYw7VKZ7sNIccCLd7C2XQQ1nURZmYjIbY77YJzQPy9sg9AWxp?=
 =?us-ascii?Q?dJuc9bXZyW50OH23Hxj8COEYPKEQaYLWOXHFfe8MI43tZzM2gKe8l3ThMPrC?=
 =?us-ascii?Q?rLON9faDld4Qv/EQ2NNIWu0iPRxIw098hjBOt84Ynr00pKwwGcZdyyZSQ7AM?=
 =?us-ascii?Q?Zxm7YB6FzddAU0aDf5tpgeoxvs7eaJQbpg7i7XNDillu6K7xyoX/+is7k2kc?=
 =?us-ascii?Q?EPYYW25BA6PUk8ACna+OKuYdxtlxccJkURLEON08c+qwVLOs0DkUYApVJ8bR?=
 =?us-ascii?Q?VYIxdAcepeZ5DlbfEn7AlP6agT0D7ooggf5KbS6jF80XHW8kYnLa/EZaxAEb?=
 =?us-ascii?Q?rv6nzJ+LDd88C619OnYgasUPwGap8QFIqW5wXpw+bovU0xLcS+Tt4HRf2Hsu?=
 =?us-ascii?Q?bF1+njhKc/pBCFjnz+4V2QHP7eJg5tYxiXdHXtXekyl+8BhDuVJjjXFZxTlk?=
 =?us-ascii?Q?fIdaSL2GbZj6a2qS4O+7AB0xjyG17YqiIAapydpU/PrrkK0c8JJ6pe2DD3UT?=
 =?us-ascii?Q?fL5ikUfE+7HQmvkVo1XCajPatZjyGt+3Ej64ADaj6xTCtX5w37camA4M/2t/?=
 =?us-ascii?Q?PdajfGjPVUqz0DNSjXgrVLQBLX2bxotqCo9BbGfLZuHnM86C7YgkVldcEJ1K?=
 =?us-ascii?Q?aQ3zKAFfQJ5WIs5V5HD3br5dUFF8QjBj7bMzZ9D47idhVi+KGyk67rEf87Kt?=
 =?us-ascii?Q?0ZKBXySbLrGDU/0QGXMlwGNPpEkKw4/XySXciCWmlFqq4iw4yQxPKuZ3mP9b?=
 =?us-ascii?Q?BEByQowlj9eVcS4Rje8A/f5Wck5kijvZkRu31N2L+pwj2w3XMlIfAEPELLU6?=
 =?us-ascii?Q?s+raPMlgfLTW849dNV9D5IxtmMm9MRXcELkTaGR83oVEpcQ23cD0N+dVQXe5?=
 =?us-ascii?Q?oCJfDaTUagMcFHKlNIhBhzPVVweiEfdo9wthjVO48+JwmQqOp01S/gDX/bml?=
 =?us-ascii?Q?E+LVWlP4SMLHR5IgQZcXJiCEaPeFKtJ51JQqDDe60liELVChu5G3/J3gqikf?=
 =?us-ascii?Q?NX9JC3Se1iE9dr4aXe5HuIoLyIb7ECoaFNVJatBpl5tm9q+kmngLXAS4qwsP?=
 =?us-ascii?Q?TFklQJmw4tjjIXkX/AU+a1Zsnh64SNWA+fCwB6w1c72X+3x/Fo2FB9ZwOe5P?=
 =?us-ascii?Q?S6z3ESoHvBHB2XqXbbJQovDXDqfomRmPThS3jtA4Sy8shkPPUTxIJ332ZoCe?=
 =?us-ascii?Q?3sDsxitThEcNfA3aSLKszAqAJJK5BCEIuPE1So+X5lKovC1PQLbvE8A0MxE4?=
 =?us-ascii?Q?4hbuOTExQa82er34U0YeJX340/krkhWb+hiU176PXsCnzR2KyY3cHlh6ztnz?=
 =?us-ascii?Q?/cnVFgQcoJl6q3975Uc+xLae/uKj/jeGDSympVJHb99Nnf/eq79EmjA5I+zR?=
 =?us-ascii?Q?UgiNjS2KJ1bImIx3shnrcUcAvA6dIsiS3L6ZHe9suugTf8l62lmljXs0ztp9?=
 =?us-ascii?Q?F6veipuK+e9y0RSVfiw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95976927-3b57-429c-22dc-08dd9f94a0f3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:11:26.2154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZTWHXGzZ6+n55C7+Mh4Qw9mAl1RLuNyS2jyQoQYn8ZCEFXcLjCiWMvYFg7QfwbprcfjnyhAYb892YembdSN3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_091132_643116_096328A2 
X-CRM114-Status: GOOD (  20.02  )
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

On Fri, May 30, 2025 at 04:24:51PM +0100, Conor Dooley wrote:
> On Wed, May 28, 2025 at 11:50:42AM -0400, Frank Li wrote:
> > On Mon, May 26, 2025 at 04:28:07PM +0100, Conor Dooley wrote:
> > > On Fri, May 23, 2025 at 05:32:52PM -0400, Frank Li wrote:
> > > > Allow interrupt-names for fsl,imx23-dma-apbx and keep the same restriction
> > > > for others.
> > >
> > > The content of the patch seems okay, but why are you doing this? What is
> > > the value on this particular platform but not the others?
> >
> > Actually it is not used in dma driver, i.MX23 is quite old chips (over 10year).
>
> If they provide no value, why not just delete them?

The platform is too old. I have not hardware to test if it really unused.

Frank

>
> > Just to match existed dts to reduce warnings.
>
> You should mention this in your commit message.



