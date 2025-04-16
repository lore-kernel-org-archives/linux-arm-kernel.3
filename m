Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CF3C369B9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 01:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G8RdxQVeg31wQ+e1YW/h7pUUyXwTQfIzEi1LZKqkEQ=; b=yDA5OxAL4/E5tll4dzsT7oywGd
	DitsKIuKlkvxj75PmaAV1boitKxBCb40Kqm/CmHY8EVBwbZEZCboLLcYgwLBtCz2CM4WTQGj+1VbK
	W76O14VgYmfT37DJE2M7wJv1NnyA+2o/0uz8eGYlmiyXBsd/G1mE6wvJa5p5zllcnz2dmQN6tpRar
	Zn/VHQWM/EWhh224RV1XHC9yJLxAf+0d6DIo9Js9U20oDKS+ci+X6SZYs6Oo6DWpmPMNMaOtgCO7P
	VN9pe8bo7Z5htvphg+oPLgIwH0QNJJQ5vbSgq2h98BSn43wmiYguKzUkENdJKHYHIFuOx1Hwp9XMa
	K4Rx5K5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rZY-00000007oFI-3zEn;
	Wed, 16 Apr 2025 01:28:16 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4rLY-00000007m4h-31Gg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 01:13:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6dmkxGGbsUxbYkHYnAISPDuQ0R3wKoSMXTbi4PDKav965+fq4mfYjHzXUJSYIaYxHGWMrdiJX4RuEmJvTWVecTlK4amrCjrmbPBxc8NEghk/x5N/LyhQSnbNu2FQMISX1RskjO2V20kj4wVyGQiJo7TgKNA0xyO1if84NUFSKhoaoww8l18CsI/Thrfytx/xrCTHaQC2dMfVcJOqMvuWuCYzea7syz8kFONbVZpfYifzH8aERVOcMD8T5+l3YlItVpkWLkjShutUN8jF8ApHgOoOIRviq5rMRO1aMroYtUrcx0rLCs7c9SrgsP55ChFVYiMKRppIgYZbHeekpKk7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G8RdxQVeg31wQ+e1YW/h7pUUyXwTQfIzEi1LZKqkEQ=;
 b=dCQoL5bb5atdgird9EfDX2zRIdJYVNTuEPhkxLbvVvOB++e9dZKmW4zAi+6j3JEzHITVigJMMIen2WYefWGsvXnNWBfJLAGhBJy5dTh1nds5LEVPZP3R/fnsp24XeaeJ5lN6sB7U+Vxntb+QTPU+36InVD9/bnVpxd6yANFCSE2pPxO46cqK35vvu2c87KdYAePuThFdiwQ5yWby2oavyDc1n2eGlLecXWP14L2pvFOA+RlA+kUXfZbjHNPrwuidPvyMVRLN8+i0G8wWjc+JPLsYkxHCTGcUbQ72py3th4EHg1YsejuNS1AKAl7POGNLLdN9vyMsMqtI/3bls681lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0024.apcprd03.prod.outlook.com (2603:1096:300:5b::36)
 by TY0PR06MB5428.apcprd06.prod.outlook.com (2603:1096:400:219::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 01:13:38 +0000
Received: from HK3PEPF00000220.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::fa) by PS2PR03CA0024.outlook.office365.com
 (2603:1096:300:5b::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 01:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000220.mail.protection.outlook.com (10.167.8.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 01:13:36 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E385940A5BFB;
	Wed, 16 Apr 2025 09:13:35 +0800 (CST)
Date: Wed, 16 Apr 2025 09:13:34 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Kajetan Puchalski <kajetan.puchalski@arm.com>
Cc: <soc@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<arnd@arndb.de>, <jassisinghbrar@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<cix-kernel-upstream@cixtech.com>, <maz@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 09/10] arm64: dts: cix: add initial CIX P1(SKY1) dts
 support
Message-ID: <Z_8EPktc5ogcUmRb@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-10-peter.chen@cixtech.com>
 <7cnhezft5jzvtdjx6m2vjmtaxgla33j4fynd6ef4c6b7dh5pvo@4cbxewawilqp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cnhezft5jzvtdjx6m2vjmtaxgla33j4fynd6ef4c6b7dh5pvo@4cbxewawilqp>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000220:EE_|TY0PR06MB5428:EE_
X-MS-Office365-Filtering-Correlation-Id: 746d5d6d-5f60-4ebc-1400-08dd7c83ea5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2aPRmtHviE0+XdzeUr8X9GkWIiDmJAJxfJmYdxPZ0CWUPn90P7O6cCDXdPkO?=
 =?us-ascii?Q?NNV/5BXLXWXLBpoAUDANrewxZ9CCZTn1H8DOebogmpxyn+SF7AhXa2sS0wkH?=
 =?us-ascii?Q?bth+p92wkygSQVaFsk8hpw8kJSS1niUxzwj/X+lXPoaYrHDe0pvAckq2+Kv2?=
 =?us-ascii?Q?leS8/M0QtnEfhsa0Bva1Xb0L1ulvUgzhodWV+CFp44tV5ltJnOLnS7f0E4/2?=
 =?us-ascii?Q?Cx1psJGrYAaSQ1vk71HfY6lYovfXMPjyrw8Ly39Fzl73jMcUdXi/55TJ2Q7b?=
 =?us-ascii?Q?K4+fC2lwlOq7MkZ0F+uAYuv15hZYOjdN0cM4sW4ApR4l09mJ3EH0jMgRsEZE?=
 =?us-ascii?Q?IanK/kkpMlU1Alwzdeak5E7Ko1mIdfX5uhnf4IBZYbafXE+c1MixPtcTEzWh?=
 =?us-ascii?Q?xEkakfLmuqza78B8RQW+qsY9/wD0duIRLwEgmj17P7eds8CNM0PJ9+GwAdOd?=
 =?us-ascii?Q?ZQ1Kjw2HCO2+AYxbBELAaNnaUNTbja388eo/Wq6Ierrx7Qkqqynpk2Tll6AB?=
 =?us-ascii?Q?H4oWstZzKMTJXF7V3lZn7O3OE5KcN+SGFdhhWhYFXhFlfx1qd1o8Np7UTf7q?=
 =?us-ascii?Q?45vxuoSkQpTW6ZIdPCY2jgJpAeGv5h1Pf2e432qgfFxYFYsJ7c87UYUIQjnr?=
 =?us-ascii?Q?m9X3OwVLvoDjiGOotOVo+bsWaXaBEO67Ql1uKsRR+joMyf3gIPLdQcLZgLDH?=
 =?us-ascii?Q?ngne+LWQREMRGzRFHeaBVzBCDWF2w7CyPFpYLHOpgJdrQ3VVzo4ZPwOg1Paq?=
 =?us-ascii?Q?DYwVasUa1WkiNnKJSqaWm0dD58iRcQdO7OlJ40P1EbiUGt/+bDWw7q1sjMYo?=
 =?us-ascii?Q?vUDzvjA2JNA6b+k+RMSDD44Yj7/lHJi4dR/M2M245a1nd1eWooat2LXnlH0f?=
 =?us-ascii?Q?kcuTh9KrVlbYrDa345VgcPzDA+b6GiMhUJ5KwlFkGXeqrXI0C5X16i/J79qK?=
 =?us-ascii?Q?IVK5BXCWQPbJQqRQOsqDvEC4g4CWjqLpBIiZvZUUbArWE9Bletmvvkl5a6vd?=
 =?us-ascii?Q?/6HAnhczgWXWtgLCn7e7AXAChP55J8LF+z0cZR3h+31vPQC4jSnH+Bs2nhuD?=
 =?us-ascii?Q?jPV1aRwWHeToX9Yy9dN6RZqF6YFSfICPbQ4LR0vRLM7fHWtvABiUiP1a6yd0?=
 =?us-ascii?Q?v/Svky+ztPfzfJkYNgTN/QE+rGiM9IBVKnkMHkBqW0almbyoOIKSB1mCIVxG?=
 =?us-ascii?Q?dpQghidgmcR4kFQjogVULJJ2+rUXcA/Sul4c6JdwEAZGiBE8SZLBj2OB584u?=
 =?us-ascii?Q?zHWUxpPp0y7K5gcqZapqDfm/Ynbtmrqvsa7dkoEqf3sv9U9PM3/WfCgxn9aq?=
 =?us-ascii?Q?4HYxr6/W7tNIecbDosXO2W9giZz1BQmkNk0q5iLSVE4/TtCrjGgBbX5aZOwb?=
 =?us-ascii?Q?u2XTsktEH9EhclqyfXSGRLNd3pqVb5cY0yHURDuCEAip0iG/YnjmQu92zRUk?=
 =?us-ascii?Q?H/ctZ/F+tXMD+rZYc3xBi6yto4PwM3qOtSrXOOAYR4zG0FC+LZ6kUw=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 01:13:36.8728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 746d5d6d-5f60-4ebc-1400-08dd7c83ea5e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000220.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_181348_760855_DAB86830 
X-CRM114-Status: GOOD (  14.70  )
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

On 25-04-15 13:48:38, Kajetan Puchalski wrote:
> 
> On Tue, Apr 15, 2025 at 03:27:23PM +0800, Peter Chen wrote:
> > CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> > and Orion O6 is the motherboard launched by Radxa. See below for
> > detail:
> > https://docs.radxa.com/en/orion/o6/getting-started/introduction
> > In this commit, it adds sky1 base, mailbox, clock (scmi firmware baseed)
> > and uart, and the kernel could boot up to console.
> 
> The commit message style is supposed to be in imperative tone, i.e. "Add sky1 base".

Thanks, I will change subject to
"arm64: dts: cix: Add sky1 base dts initial support"
> 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> > Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> > ---
> 
> I've tested this on my own Orion O6 with 6.15-rc2, the UART does work and the kernel
> does boot up to the expected point. Feel free to add the tag if you'd like.
> 
> Tested-by: Kajetan Puchalski <kajetan.puchalski@arm.com>

Thanks for your testing.

Peter

-- 

Best regards,
Peter

