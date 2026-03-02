Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B51BEA4E33
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jaflwW6FEldwA8Q9whUHn4tI6Yz8ZPYp27zevtdW7w=; b=leaSyL0YxwipjzpYjfPqyMy/Jr
	wnvRPPUPSAHXVmTeYB/fDyXG9Cj3J6S8uNiGuCGl5mE5TDgq9u5yUSnc3pKPVoo2hYAbeO99xH5Dj
	GEWQ6Vm5ZmQz0T2x/BiKrej+8ixJptxq6e4Ew/T8w+1qYLhpvR6gYWiG2pvGE+YlzIx/X1j57E24C
	XnfQnMy5B/7Hz0mbR8j499IyYYg0aPwFIavvGg9YifCPSlml5SsjL5xwalArfdjThKfQpWla0Hb//
	vQLHK1vybKDt3M8/I/0PEeRS+aP0pz7jwVa71/XEmGKDhw0A8Wy3t8sonngXhYCE8DAd5ysL7lstX
	WmpcHgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5jD-0000000DRsH-3oLR;
	Mon, 02 Mar 2026 16:02:39 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5jB-0000000DRrg-2Ylm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 16:02:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEn8mPo4VkOhKzec32pJeDFGABfYIkX6mzNW208BSfjLBkG/ZDU/n8R94a4dw/4P4uUo6G/Rz6BVPUnZTXczDVF+KWViB+KyIfCc0FQh/W5dSxexSh3eKzEJUMCde562Mao44XxBro1DtG0v++HK3WVayQFPHBQJwvHNlFRPnexWLl4fscUWilwBC6IIyNN3/DWVwTdoUroYyiSKSksJB+6CtfYewEaqFmGQ8Ej+7oUG+Vdv224B9J3WFUvwkKkYS/aI7fHu/+aL7GiQ6tL1mpq2pXuAk56AdoeyUjlb5T3DASycG9KL0zsh+VCV/II3FGGlyaKWUNT9KcQNM1W+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jaflwW6FEldwA8Q9whUHn4tI6Yz8ZPYp27zevtdW7w=;
 b=HH1V6M/6L+eSmEhLbn55o+pIzJhdOwfpyi30xXkPvQCAlxQoeqLjmOhu+wXII8Oa2TksgcIBalMEaMnt6FIqIgJHgDxzNHI2HxK0/nW4lG9Edr5gucflFcYNOx7O0yIe5DT3FiZkwblHoqDtPEfogtbGPeHqnfnL0yDfNqFNYt4BwVr03shNB83S/kEcRaZR1D3WTeL/ee34FpkK4Xi0ABFaas16M5zdRuUaMLHREtI4XetgI7FM+k4j6SkpH48783hCtEgxK+MKRP1ue1kkq4Wkmh9htjJo+JLz2VbH95MS+EIlvPVt/SYeQBXW3UnBTNSV7/yg8Ep6ck3UJvT5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jaflwW6FEldwA8Q9whUHn4tI6Yz8ZPYp27zevtdW7w=;
 b=JVcvZshtF/hkQbToWtdksdvmK3IGwjhjGewBNilWUNZwkG6g2IAG+ed4rVQkPcZn/8w3pHpir5PZtQBJXlznqeI1DKl6DX4dFsayojFJ5gGKvg6PLosDf14X+RCCbHEjfzIN3sQngEqFOt92UZURMW02Olm5ULhPITKAdKU6il4NLw2zFMRzuLhfAXkxZ90jyh77Tb8+4cZDicNGRSylzsP/+l2l6ehY4rdtYPsJeSQBW8zLecpO4Ya4uZiXKWoyDrtloUzTSfIDVxgrdI7xIvAanISXt9DkzmCp8+18OojiX57w/Fs0oLRxCyeGsqqwUMwlfyI2mImWgt0v6dexLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10983.eurprd04.prod.outlook.com (2603:10a6:10:58c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 16:02:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:02:33 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add MT35XU01G SPI NOR flash on i.MX952-EVK board
Date: Mon,  2 Mar 2026 11:02:09 -0500
Message-ID: <177246730944.2027729.9926523017309373685.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225-dts-imx952-xspi-v2-0-c9ca27de356a@nxp.com>
References: <20260225-dts-imx952-xspi-v2-0-c9ca27de356a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0086.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10983:EE_
X-MS-Office365-Filtering-Correlation-Id: c80a2d01-2bc9-4fa6-0734-08de78751d24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: ESawwpwmYDaZ2HqdrkyxZcB9PKhpA2J3y8pMYq+Ye9wKscfwa9D3aZDphBcT22h/UN67fxhsANjI3ULJBtm+GGs4CKDEix+f/o08iw3fMNzo8jPMtxFvC1wbulGzWtFhvHcVkTYGttB2g6V6FeXqTksjAN6Oiuzuq+PGXQ7xP5xUdIO8hYVquxNOUfbKGFxBfCnaeFYAqimy6w123/C379VkzGVVwN/D0U5RByaiVEorvFGpzCdfxIItKxFSOiCN72HJfxjAaNjYr8YKPl3Q+Qmo5SmSu/dQKQ/AHEAlIWARVC7m4lPBdvsgy0JeDaPJgt1abtrtZs3W4XogyXK94SIQaUaRB/Jcmcfm3tv7bLD5GL8qYU5LVOtHnQhUpZd9lgmV9KPOelDX684XSgiypWXhWDuRKWmmcUD24B09Xypm/bnAOWQZkOUW/ZbNUaOY2Dsc9tL++v/nbWa85t/xZ77sd9lVID4oTgJ+UfqMQ/bdeiXPkv7XxRjXCgenprn62oZbxcfv1ybANXbJvGrVsOVkBToU+rR29y4X+E+UjStatZov0cfT0Q5vGvpyr/xrkK+ysvaPzx9W9zIG+TQEw4crVtoCLID4j5jZeCluSVh18j1kMJC/HwbePCBfmRPr9FrsV0B2gu+879x7y/NbfIOq10D69WZ3OVQrNyJG/dq/cDqsAK4aJZ92UDoGuxtD0Vhk1azcYVxzAj/rWdC0I59a6tylK1rI33l6jbIcJfv8/kpMNNYz6RG38oPLJ6jPruETezX/GpKMSF1bp1j6mBEbMCfJ6UHzlYWXrRvtqoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THpZQTVVUG9QRERNNzd6bjVNbHdpRHp6Nm9vMG8vWEk5ZFZwMnZuWElWdzdD?=
 =?utf-8?B?QUIwYXorUTJqWGVYNVJkSGE2N2pUcUk3am9EWVBNN0pkUlpUdWtxNzRyb0U3?=
 =?utf-8?B?V3BwUXpSSnhjUXc3THgwVGtHbU00QzJBUlE5YzdKMjkyNlhKV1lDYldhSVBL?=
 =?utf-8?B?RGZVVVlrcUJveGFvcVJBWTcxRjlWOFRzNVhUWkNtMmVCOEtGbnNDc3d5bXY5?=
 =?utf-8?B?cmxTUjQwS2RTdG03eTF4VVFiQXdDMUFoTENNTGx2MFMxVnVva0h2NWxTUmtO?=
 =?utf-8?B?Ty9PK0dZbmdRWlhJRjlBUkh1ekVKMzEwcVg4aU91Qnl3VmpmK1l5TGVJSTFl?=
 =?utf-8?B?YllTc1EvQXNYRTlnbFJ6QzUvYkhyRVlLT1BYSjR2T24wN0g3cjZsOC9MK05o?=
 =?utf-8?B?N0tWMDFtRjZhV3h6VGZ4Zmwrak9PcDZ1cFZHNVozSi9rUXd0WlgwZ2JKNEw2?=
 =?utf-8?B?ZTdybEVyWjhMTW0zSFdZNzQ1ZGlTSUQ4MUNqQnNTR1VkbDN3eUJ5ekdHeERu?=
 =?utf-8?B?NDAycEloY2lEdFR1bldwNXd2MHJicEUrMlNZYkhqdDA3MGcwVnp2MGpxRCsw?=
 =?utf-8?B?bWpCRGRxK0FEdThtYnFkekZVRkdiUjk3eE04eU1rR3g1MVRpYnJKeCtaaFBW?=
 =?utf-8?B?RWpyYnVEWUxSR0JNV1ZUME5HWjMzblpKM256VitJL2hyMUE1NXJGanRRRzFy?=
 =?utf-8?B?TVRxS081VFBmTTJRSWxRS2trcmFZQWFHcU1vWFBlWmxMSUgvcExxbk05RXFY?=
 =?utf-8?B?NjNxS1lsWkV6ei9LMDVqUlhLTjBML1lVSkRjek5vZHQvWElBd3gwWldIejdF?=
 =?utf-8?B?bnZpUnJjUFprTUdYYzBtSGZyd0EvZ0RSVUd2RGt6bGZFdWdsMlhPWlF4TU56?=
 =?utf-8?B?RnRnUFBJUS9xRVFqYlBsRHdwSFlEck9nTERHZmxtdURmU2FpeFgwY2Rzc3Jv?=
 =?utf-8?B?bXFMNXJuZHhIUDdkRUpzaFVJYjhsQTI2ejBBelpkK09VbzJkUnZPUHFjZU9Y?=
 =?utf-8?B?bHFORlVFQzJsQkFhM0hmc1N2Slg3L2JMem93aFhqdkVHamxVNjNSU3dFMUdP?=
 =?utf-8?B?SjNCZnVsNnFQbkxZQm0xTnZGTTlmc2hPU1FCY2dUUlhwZHVYMDdWcXNScyth?=
 =?utf-8?B?aVM3bDNFc0lDL1hTRFFQR1ZSeW5na2JwS3BYMXUvcVBsc21mT1pyWnNmR0JK?=
 =?utf-8?B?cTFjQlZSaDdXd1BpZ0RSZjExQWhXUHpDbENKbXFBQ1huOFBUSFZkSnE1bk9s?=
 =?utf-8?B?N25DeDdWdlBuNXhtMmJ5NEZreWtYLzE5SzNsWk9vWnRQSisyaGI2eS9PRndC?=
 =?utf-8?B?K2hZUFk4eFg4T1htMWRld0lWVlA1N1BEK1dIYXNlT2xNVVFZY2cxV2hxYkhZ?=
 =?utf-8?B?bFhVcmVvc01BVWhUR1FvSVF6dEtiZDZacHFiNzBzZkIzelhWOVRGK0xyTkMr?=
 =?utf-8?B?a2xiZllyUHZRNzZ4YUhRZXB2ak1nRkJ4cGwxRENtTlVGdmRmMzJIUy9aeXZR?=
 =?utf-8?B?c21mVmxnWGlHRExTdHljRlI2bU9jcDREaVU0NVpaRElqV3lTZDh4aUl2RVZq?=
 =?utf-8?B?cFdOL3RhM1ZsRnRIKzVRRUJHVlAwdmZHSVk4Z0V2N3lWOXJPYzJOeXlXSjN3?=
 =?utf-8?B?bitIdGlONDlYOHFEemdrV3o2eUx2MkRpaFpTU0ZrMzRuVnc2K1hUZGxrNzNM?=
 =?utf-8?B?N2MxVWF5TnZVQ3puUVBqczBmOXl2OEZKdVlweW9RTDB5WWFlNUxEYldXODd5?=
 =?utf-8?B?R1d0eFBhTWd4cjFtUHlZNVNacXRGM2RKazU3TUVUTE9zckJ0R1d3TmdIbjJB?=
 =?utf-8?B?VUNjY2xWTjdzTkl3K1lGZ1FDNlBadzlRaTJXak9OeTRSS1RlOU5xckxKZVhh?=
 =?utf-8?B?ZzBoVllDR0dUcHJkYzYxV3JEV0RXc1dBQ24vL1VoU1hadlRNb215M2xQREtk?=
 =?utf-8?B?QTl0L0xKOGR6azZIVEZxSTNvK3lVTlR0dE5Gc1kwRlRuMzd6bjFnbzlzTUhO?=
 =?utf-8?B?YjVSK1o0NEVXTUJialNOT1FDaGRoaTRNdnpWQzdtUSs1eUlQeDNTeU42cnBM?=
 =?utf-8?B?U0E2ZFdkVisvci9nQ1o4RUx4QWozSFRCbERka1I3cWZYbGwrd0l4VmJDNHNN?=
 =?utf-8?B?WjFYMDJoYXdFc25hWkcvbnRyY1lXNnBZQU51NDlqcGZHTnQ0MHdZQ1lmZnRC?=
 =?utf-8?B?NmlDbFZycGJaRWU0NGJNK0I0L2REMWsvbUk5QzRQcFU4cDZEUE5tVjBRYXNE?=
 =?utf-8?B?dTNlak90Y1ZkUjh6ZnZKRXN6YnZzM3dhWWxjWUoxWDdxcGVMRkU4QThXT2E2?=
 =?utf-8?Q?tRBzHjQD9KWca0ShZ8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80a2d01-2bc9-4fa6-0734-08de78751d24
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:02:33.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5xzOFHbx+6MtAPIG/06AmKD1jWlDd6WHDA54mAJCTcG6A5Vuj38tjjA8zK6nGFEoHUPHBbXjrk0I7SETR3S+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10983
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_080237_647356_DA56C5BE 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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


On Wed, 25 Feb 2026 14:47:24 +0800, Haibo Chen wrote:
> on i.MX952 EVK board, there is MT35XU01G SPI NOR, i.MX952 control
> this nor device through XSPI controller.
> 
> 

Applied, thanks!

[1/2] arm64: dts: imx952: Add xspi node
      (no commit info)
[2/2] arm64: dts: imx952-evk: add MT35XU01G spi nor flash
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

