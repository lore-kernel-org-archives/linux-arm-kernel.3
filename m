Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBBECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbDOmqluc1IDjvYfnWRCm36E4KM8t7PnHuLr7aE5Lqw=; b=US95xSauVhl/UJgCVLyBN+WNqN
	AIGGzZ+qQT3DVIoInb1Emru9yYM1gUJuE+dc7Xbn5hkWubSQQJpIq5Pbp94LbXre5cKk9PUpa+LHa
	rZ07FoqRgc7do9df3t4aOlvzIJMImdPUp0sDgG14DcxhJCL8O2x3HGzt8BczHxMH2t4msLYUURclI
	7/+jDSg5SY9PQO4c3yCHxQW+zEec1WUYOaXWKYALmFLb3LKiKnCwp94dA4Rjupi6+SuYwwkMeE1ex
	sq3EXB6i6RnIxxlLAaMj8ZCb+Z5Tqx6a1+ZP/Png2Jwyup18OuwsqlbiAyz7WkAYWR4Xovn7kHMnf
	yoyxTM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhqY-0000000Fyp0-28xF;
	Tue, 12 May 2026 07:48:06 +0000
Received: from mail-westeuropeazon11010030.outbound.protection.outlook.com ([52.101.69.30] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhqW-0000000FynY-0oe5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:48:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQ49ZVHvavmX1IzUUdDMdrsSXOToJhOIXk9351WNOJgyweAV+jTMYzaNFaAoCe47hR8YSuh3D9KjyVH2QVZirGUmTwAxfHM64+JXYSH4BDOot1NIpBOUeYXa3nfh0pSr3XtvJHB6mRsndJHJ87sErZyGjs09RrDeVFh6CUFISSjHj2LfMXAK+MDKgLgqSE8I5n8eV9UEQJRPceZRvwRInrIzCEOJ6fmuk0gRYc3sGF9yQbpY3FRPyGwTAJWZKRMUbwMFgsxqKV2L4PDaK4gkp8VX0mDMyXEtgNsN0ghiIT+3r/5+D2+SsDU1XOWNM5DX6TY2GHzsxZ82u8OowUUVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rbDOmqluc1IDjvYfnWRCm36E4KM8t7PnHuLr7aE5Lqw=;
 b=SLIATzTpDUKXQ8BOS6tOxhifDOC75wvk9j3I6pYx6q41SZv6BphR9bB3tv9ZGXtFE7dTjbCwt5qxH+aa6Yx0gzkCZ4Hj436ty+Xq/xzCB2pe/XCy9hPSlBVg+WJKe6xXC5Ilr0jnpEpxHBw79jPJF50NozL8qxKK+WoJgnDWZC46YEtwCZvEkwqQYnIGzkOPpo1p7zxK8vKeGKkJ7fiwMp4YNpJID+PC2O4hEW4yUmwtl2OJuigNL+p0qeRYz0etI/MolPDVFlovo8Gh9BESJ5iYP55flQo48a0kWB/mP/XjPWlczXSiBr+8RV30HkAPHyXcGPlSqS2aVc75aYq8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=amd.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rbDOmqluc1IDjvYfnWRCm36E4KM8t7PnHuLr7aE5Lqw=;
 b=qZHLK/oQvynzdiUBGr7HqDazg2lLn7zCHy8aOsBTF8DWIoQ5OhsLmnj03eItZVytW0Es3TIQm5rRY3ftPN1M/Su1xkop5fnlMAzAkpAK2mSB+lwtb0AeUSwjkqvtLS1iyRsjKwD+T3tyeIJUXF4Sk/wap7LxkGJ/d9z23OUp3Xg=
Received: from CWLP123CA0030.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::18)
 by PA4PR02MB6749.eurprd02.prod.outlook.com (2603:10a6:102:fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 07:47:53 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:401:58:cafe::1d) by CWLP123CA0030.outlook.office365.com
 (2603:10a6:401:58::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 07:47:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:47:53 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Tue, 12 May
 2026 09:47:53 +0200
Received: from se-mail10w.axis.com (10.20.40.10) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 12 May
 2026 09:47:52 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 12 May 2026 09:47:52 +0200
Received: from pc36611-1939.se.axis.com (pc36611-1939.se.axis.com [10.88.125.175])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id C6F6A1D39;
	Tue, 12 May 2026 09:47:52 +0200 (CEST)
Received: by pc36611-1939.se.axis.com (Postfix, from userid 363)
	id C118C60E4D; Tue, 12 May 2026 09:47:52 +0200 (CEST)
Date: Tue, 12 May 2026 09:47:52 +0200
From: Jesper Nilsson <jesper.nilsson@axis.com>
To: Marc Zyngier <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-acpi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep
 Holla <sudeep.holla@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, "Neil Armstrong" <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ge Gordon
	<gordon.ge@bst.ai>, "BST Linux Kernel Upstream Group"
	<bst-upstream@bstai.top>, Jesper Nilsson <jesper.nilsson@axis.com>, Lars
 Persson <lars.persson@axis.com>, Alim Akhtar <alim.akhtar@samsung.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Dinh Nguyen
	<dinguyen@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Thierry
 Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Bjorn Andersson" <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Andreas =?iso-8859-1?Q?F=E4rber?=
	<afaerber@suse.de>, Heiko Stuebner <heiko@sntech.de>, Shawn Lin
	<shawn.lin@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, "Michal Simek" <michal.simek@amd.com>
Subject: Re: [PATCH 07/16] arm64: dts: exynos: Add EL2 virtual timer interrupt
Message-ID: <agLbKDWlJzZxB9uS@axis.com>
References: <20260507125544.2903406-1-maz@kernel.org>
 <20260507125544.2903406-8-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260507125544.2903406-8-maz@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|PA4PR02MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: c4c11cdd-3864-4266-9b99-08deaffac64a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|30052699003|36860700016|82310400026|7416014|376014|1800799024|13003099007|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: xRuIvGl0acACs6zEpoQgzYCukTdTI8RgJMLsjNQEuXLQqLzPSAG7ESkr2+izu4nUpuhwaHvf+JBbpD+UJKzv/BwFs/L2QPro+Z8MXVcWLTMObluOAFfBu6slkdqLui9eli5C2E707yNVeyNyX5bOHi1Go2D2ZG6K3mxMDK2K/D73FL5O+M+91K1kMBMtvpjSxN9O234y8qD2vBEnJI/vcHmf3q+hrJPIMxAcYVK6gZT0D9rqO6bHvXraTbeOo2yqk7W/9voiVfvwR4GBosUg/5zXIYy7Kw9bw6NTCLsgCuJtlPm5sQOcT9e63W/OUEDUgpPZwCI46nhdK8ov/vCarVQdEibolFKGn2qv9SEyj9wBzpT1GzTksoDlAH43PYif4zniPDfj1WVHM2sd9L0OhHP6IdMYo4JcYlLJLMV2Egb5EMTtPc93y1MA+nnkN171FFOhgt7nRlg4sKEyWKLkpTjwspvbJqfHiImYexBXjm5ix76gIzVYui0Vy+jiUSoM18bmUNoGyl1LF7Te74I5B2s6RKgM2IaO2XuNhGisiaruTg5jNIINfpMlIZ4bvGSPlY3hq/v4rVPtssnwwHN1SLR9kPxsZJOVW4ff2VFQQSwxVLpuE21mNoPXCDH4hF7k7fuTZNiPQ7ddIaH/7Ozzp+ZPB8T8VqYoDIgih0JeAEGQPgxqYYeHsvoEtHkXcSRimjs2JGmGnUUx+vTCBC9yV5VCpjIwV3j6xCBJerbQX3w=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(13003099007)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ktEgpbf8P7q/9mP9WRlsxwYhVyz4MyhaW87Y8IZx8Po0BzuxJs+72ctUOMlq153V21K4vRk24BZt75Tb1nc5GxwdxMJ4jnU5FrcreIrDSonhYPfIInHuYppgdpffYggysU6jpqZaU/1UWZaCoE14bzaffQbdh0BgIFjVw6rwesZmv45kgufEku1TLlK7bWSgVstCd/gQ244Bk2vojo2wdajxJAX/oQdKJOB8RwNOPqUYodp+VPKCRGESyvZKjjtudvu8mJcuGZqHyvGQqSzc57RqvOiL8OPZ6B/Cy/37IvC9QI2jERQFKOlleRw0w6l6B5YmFiDVEdepa3j3Ktr2BQaPC2glw8nf2+DqutbcV2LvtkW2KT7SSfiTDpwCYQkNpO3r+6V2WtoGXZW4tOdr+BiyxxYnTbK2tMelroHjxeBiUO5JFyMXmOVj9wgzFTtb
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:47:53.4521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c11cdd-3864-4266-9b99-08deaffac64a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6749
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_004804_247476_A6C9C69A 
X-CRM114-Status: GOOD (  12.41  )
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

On Thu, May 07, 2026 at 01:55:35PM +0100, Marc Zyngier wrote
> [Some people who received this message don't often get email from maz@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> A bunch of Samsung SoCs are missing the EL2 virtual timer interrupt
> despite using ARMv8.1+ CPUs. Add the missing interrupt, except for
> those broken designs where the interrupt is documented as not being
> wired.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/boot/dts/exynos/axis/artpec9.dtsi | 3 ++-

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com

