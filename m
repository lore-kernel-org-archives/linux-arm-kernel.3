Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AD9C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQvew6fPcJMWBxcVSMD/CPpbE6DFAxAYiyYAZfGA5/k=; b=OR2uGrupe47ysJAh0kriTvfWsE
	tPHFUnbpEGHga4u1OaW4BXPKtM7plR6wtGbWXad9n7wnRJA1Gn1v9e1cpfRRodVE3kDnyeNQkGOBi
	PRQhNAmVjvuVv6MZq+93SchK0ZTGTFW8bdIUiTUA9nMoXW7A2inLTLPiHxuiRmfgU+ak7g0eG1zvo
	xr3PLdisKzyJ8/Y/dtTRxOod2ych0NzMiRYY8IEypH5k8p3BNsGqJ7dy98ZuUt9Db6jd8mSOVtUva
	Ddsi1EH/8Z4CqAHJHfF8m0l5CFGZgqQST/nlGV4Vf5Vrj+xF/6CCWISs0N+0QnVkD8W/hvdhEV4XZ
	HpnXLkSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAus-00000000bgQ-0mIu;
	Mon, 28 Sep 2026 12:57:10 +0000
Received: from mail-norwayeastazon11013016.outbound.protection.outlook.com ([40.107.159.16] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAuq-00000000bg0-0Yor
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:57:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoSb5dyMJcUu8shdL0f3gL3p6GOKBBbadYqFGr5YB36scLV4pbVs6jilEzokqSCX8NONwdlSGv+HjOOshN3uCqEEKK26UyVD8SMvK7pmJuaVG8f694NrA4FmMObMtrSwe+em9GY2c2I89y6o7za6khJUuK6jvSuULMTHA33QkwmUuUVHew0zXAFRLz02H7Ezcd1vyW9EHN6GCZFd7wSAhEY50zI2mTBgHPFs3MD4FARZxBtp0lEt5H2xXVyNyc8NSHchvVelKdT+oynqIxdNeI5f2Go1VNsu+XFLHJcGUeardeZygq0tRZ2/eLkdzEBhFwFdqQ5qERiUURM/OmwyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQvew6fPcJMWBxcVSMD/CPpbE6DFAxAYiyYAZfGA5/k=;
 b=qEucJg1/ztN8SCQgNw8AnJRFGh5I9KPwYZv5loSg1EIKH0mnkqwQO57Q8AwBDe9/RCkJM0iT3IWcupxHNkhnw8igY9GuKS7tOgAZqdN1aIKdI1kSrvwh3qtNrFpKJeuhN3rnJhIj7IfwRi0kGpBRg8fczZXYUSt6A5cO2atx35Nz1Ojg9SgtKI4ZwXEpYKEy9ButUL/1b1HNDWJhhkLDApzl5GMWr0wt+IBTd5Nl2/62eHNd8rOumNiqGqyCYsSy6BqQ1ByR4LeG5xg4sMfD/wbPvWVKNUM2Tsf4WJSIeWp2fhst1ayqhey3KkrSpwAiWDhFrWc3H7p1LsFEHzj2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQvew6fPcJMWBxcVSMD/CPpbE6DFAxAYiyYAZfGA5/k=;
 b=YxmTzAXI+cJU08ltndX8eZz9hCInFuc0zGlQR1E9kBWOrBU1ThXYwszh/dhE9gNY8X9A/2haBSBJuMkgBlJ5KMsfaWkAwNJIVzZx3yS3Un134nxZMYEPeglr52dEj+z2OpUbJa0ntIGfXkgDKOzYo9k8Rnna4vEMxcgzS+MDIoe/hOtmTyPq5NhF79AhwXOAXeGnU3UpDu+LMo64d3xMPxz7/B2ves3wrH0YooKxibzRoArI/pVm+8kmmZ7ogYxoPIR1ZR+MDiyY1ma1OGLrd6UpHgphHt/C7FXziThKyGCcNjP4I5dgeaFiQptUR2aj3uYq/W09+g5/cth9zLQMBQ==
Received: from DUZPR01CA0354.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::6) by DB8PR10MB3292.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:11b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:57:01 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::93) by DUZPR01CA0354.outlook.office365.com
 (2603:10a6:10:4b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 12:57:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 12:57:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 15:02:53 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 28 Sep
 2026 14:56:59 +0200
Message-ID: <131404a0-b46b-4b7d-b01b-032e86bc0e00@foss.st.com>
Date: Mon, 28 Sep 2026 14:56:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm64: dts: st: add display overlays for Engicam
 MicroGEA-STM32MP257D-RMM
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
CC: <michael@amarulasolutions.com>, <domenico.acri@engicam.com>,
	<linux-arm-kernel@lists.infradead.org>, Marek Vasut <marex@nabladev.com>,
	<francesco.utel@engicam.com>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, <linux-amarula@amarulasolutions.com>
References: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|DB8PR10MB3292:EE_
X-MS-Office365-Filtering-Correlation-Id: 19acb953-aa90-49eb-0ebd-08df1d5ffd04
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|82310400026|36860700016|23010399003|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: BtfzPAEoYeUi0XAnnjG4C60JhzBRQwb+VwrTvWB2dsU4BeDA9GhT6jMDk43xfNVXAilvQB1v/7TsxFfcwk8T7YRwHytWy14JFQOE2sPC5tVDsOemhtf13nhI/SRyY5UvLGoXxh3pPjumvhHIjYHSUaDSzl3UQsZxIDYB9F3CyDQMfdBXk7O8BHLiXLQx/Wp8Cxek8OCBSGn801u8gkx5g8lV4bp86pqSgh87sp1mxeBoBGmYDc0dz/1SrKaXsGgM74k7vOKMzy5jBZYHoBrvsrpKIhxKCi8pH4af6bek8ZEvLCm7cx8OVFmc/FnFv4JW0a70ZA2Ii9d1xNBYfWjaAWAP9WnlDYVE6n525fdbo/qDE49p42wPbl7NndpKBhj1+Te2KoQIWX9OOZ52C4JgnMcNQc7MDxwCge0plFbKuoPhwIBRh9SYmiMJNf/LbQi5s+YNF/q0z4Ttlj5QdPn+8JBp3I0Fm9+W3qKO2ZuEcLKwMsgYbh7RhbMjbHuREBGWozYRMvfd/6c3I8S2ZbchNHJ9BcR8z9/KeahhIFTRSWhISeKSwhD+aQTutt3wNipKwSl5yV5k+gZp6F8xLJQC9PJz2N8wlyeTSItltzx5hH5UDX4geU33fSESc7vWlid2Ufxgut1N7dFpk7F3yM10RgCq2aYlGfpGcV5ViTojpr9sn7yPUpP9R6lsXbiEHf569Du3tf1LSZyZaO/4LS8DTA==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ek4ue9teqfKemRptZ3UXVZK/JJwp1lrV301UqnfnE9Hza4v2Eufi5PUBcOY8Pi8OoCR4CWs0h81CpByCSKB4OZ+4cLzsw7adwl7SA3WU572NCq5/k04G9hQ5HWrohPSTBnnf2KoXfTyhgkMmDNrO8DFkSeABOqmqUj79nOoBDShpGSDic0fv00zUTpGYwMRp9ap4v7TJ9X2f+ydrmV1XB4lf0Kpfoa+JU23ufQiPrlrXnr0CkDMlvtqAmL8kwUHGGdpX/z8hvdr4TFKIE+9I5vBrQakkIL3M4G/4T1bVLfeFFemHRLv9SpzH25NkKiAbvl3HiqHGRn4xoAieG3JPKMkeZ6gWcYoJWruSgIdUms6HcjzGV7+jsLBypNUGNpaCSpI2vU/FrQwJj2E+L+0q8pXA0fDX0v6TD9gqRLxrAdxWJikf2HSffKcchAqe3B8q
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:57:01.2700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19acb953-aa90-49eb-0ebd-08df1d5ffd04
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_055708_181549_475FCA62 
X-CRM114-Status: GOOD (  11.23  )
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

Hi Dario

On 9/23/26 17:53, Dario Binacchi wrote:
> 
> The board is produced in variants fitted with different displays. Move
> the current RGB panel to a device tree overlay and add one for the LVDS
> variant, so that the board dts describes only what is common and each
> display gets its own overlay.
> 
> Changes in v2:
> - Keep the full cs-gpios in the board dts, the overlay only adds the
>    panel node. Suggested by Sashiko.
> 
> Dario Binacchi (2):
>    arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an
>      overlay
>    arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display
>      overlay
> 
>   arch/arm64/boot/dts/st/Makefile               | 12 ++++
>   ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 ++++++++++++++++++
>   ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 68 +++++++++++++++++++
>   .../st/stm32mp257d-engicam-microgea-rmm.dts   | 48 +------------
>   4 files changed, 149 insertions(+), 46 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
>   create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso
> 
> ---
> base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
> branch: engicam-rmm-overlays
> 

Applied on stm32-next.

Regards
Alex

