Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FE6106B53D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wu6GYP3rJMvRxbskPe4sjnJkFyajoSKnDGiNq8cDPUU=; b=VRjL4fDGRdsbpOhK6KcJdST2h1
	a/0g07dvtmh101Hd+j7yKaPEmfZr+J0UW7QiIQX+LU60uokNklefKIXHIHtO1RsEDC/cOUJeq4RtD
	yMTTZBqL1YS/nq+bFrO4YwQu/NX5+GcCo4M7Yf+0K34mhGOjpJyy/Qqc5rzzY131kOxM5VsAOmWMv
	p1Go1NoBJRnoZroCnAzcX2us9NPTf1FLkW7vUFQsBRkbv8/ryxnpO5LtwsHfG46hktQyqkm1/p283
	A0pXZeXLsWHPQoV3N4JdSdp9Lj29IlX9Xi4EDXClHNGlGrEyYODLp8+xfGqECvNjpMbu9TLmO0C6r
	4y5+88xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ond-00000003Vy2-0gv6;
	Wed, 25 Mar 2026 14:01:35 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ona-00000003Vwp-0IEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:01:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3JP9ttrgtdu2TfCiDacwlxyR9bP7zlJcTRjrF+cgQQe37YavyYlKgzBraaD7zz9bgjEnG2Shc3EZQHc91579dElZtXMPUskfGkQOqOes/77d94anaMAa93d9hvwVoLQZrBCKH42VEcJxPfFw780UNnPhwdSLqfnJqd0VQCBk0oCtwBjDupC8jFZslTgaigNNG7nOqKp8rVs5ik65BQCYNPisAsoytH7tVTr30MQucwI8GSMBlSJSnyU21aMOM/6tGQ8t3r5jruIdRHlJAICsyelYTHerVQ5eUCxxGlTwltjiwNH/gSfeP7b64xhE9N0Cfa4wA9AuvoE2wAQ6HhkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wu6GYP3rJMvRxbskPe4sjnJkFyajoSKnDGiNq8cDPUU=;
 b=uMtO9SZUcNvZUon/Zs8mcz4qui1T6NEOj4HbdTKFcerAfYMS9bU98nOz38mrusUaKgGIeGeVdjAyP2o2yvEExmFMs9Mm3vUy0ThfOYKuG43VWzY31dkKPOobnJI+MzlpfqHD5VGDPOy78yAZQov2SQtMl9Zm6pS171fFY0IW4lXMJYbxr1+BOoW9T6YP+taRKXD8Pw2PyzVqwv49mREXdGHIpFkMnHesPSqZrSZWaLVdaG48cBW44vY+vRHSK55f0lrqpgCJONC2LSZpIowBQTJ59IL5EvTwZVwsHPtx35bc9xusjxI8hrSDgkx6aBRqaJHHGCptXTFwdcRjnv/RaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wu6GYP3rJMvRxbskPe4sjnJkFyajoSKnDGiNq8cDPUU=;
 b=Bmy5j/BEqx31GQq4EqAoaqyXv4T6su2Q1OHmOvzz3PtKn9JFtf39XAnpnr+5JrOcI6vzHY+sdO/NU2RZsRRO2lqQeEI+7f2HBWi1ObKc+veqWAmTYwJrqmOCXC9mpLf/8Hc2GtGfvjudZFxKL9gHzG6HH1Yxksc7lzEv7RlJlpkyfjKDrpWlSxLoFkQio9zohsUVqcJYtIase45hbvn8obu/ADYUHPpgW6kofyLhr+Dsz932C6DHYilPVaPYKomm9YWvpWn+Q8r0+Ka8WzSu151j/gNXH/I3hPFUKHp4ZNVNVo62N0HL9L24YoC7st3nkeqcRSNn4fqjxqeESJCOzg==
Received: from DU2PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:10:234::12)
 by AMBPR10MB9374.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6aa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 14:01:22 +0000
Received: from DU2PEPF00028D01.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::ee) by DU2PR04CA0037.outlook.office365.com
 (2603:10a6:10:234::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 14:01:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D01.mail.protection.outlook.com (10.167.242.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 14:01:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:03:03 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:00:25 +0100
Message-ID: <82835523-4d3e-416c-b65c-6e6204369864@foss.st.com>
Date: Wed, 25 Mar 2026 15:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arm64: dts: st: Add BSEC support for STM32MP21
To: Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260211-upstream_stm32mp21_bsec_nodes-v1-0-8379bf97b0bc@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260211-upstream_stm32mp21_bsec_nodes-v1-0-8379bf97b0bc@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D01:EE_|AMBPR10MB9374:EE_
X-MS-Office365-Filtering-Correlation-Id: 6afdae07-1244-40ee-292f-08de8a76ff24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: ZyA/7w6lMrMlEbhUvKl9NStX1toMONtEySHDTfpIokXfIXuGHFzkUwId7MgzwlZhA53o7Dj2r+6JmcAkkNv/jmN41Nh10nAAVpJ5qAI+DR+ow7YqKw/EEhdRbeSITnD4/IDJxv2xjf+2HwLx9lJI1mh8hETBKp/wXHlbBUMlc2AF7Mrv/Wb3W5+VXDfJByrXISpBLgnRseFoL7J0/TCW5vPczosGh4d7669S8mW268CUxFyXj81wbL6D657N36sw7/e9953OHEJnOwunEnyl/C1ugxXjwS4kA5P+EWa0fp3/z2SgMU3xkzniuWcT24nwsbFXJI+i5Ow3kXSULdLVinuot17WL9OrQUUvUdfG/1GOUfeht/okrpQlQc0vW+PfG9HiwqJis/7UHoLJsG/zZyIUHQQGFFpnHiHrvDdPOYu0gztSXvjykMXNbNG7IUHp5nXbYlz4Fbke5EZrPC5830tntkQ1QjOpZNf/BK6kukgWZSbYDhxKCMmeZSVZiBLUZYoXbXZUv8Xk/d4h2cko6ghTHGaa/hrr6G6ujn5Xbg9Ych3t3RlTZZKWDzub4ckMUARnam7kwYgeg1nOSSUGXHuRvAVNd9M6bLsL+XncQp/Q1LHTrDx0LP0dhHWhkIw7nEDZXwhJ7Yd68pLhCuihUK+p8at2f9ydg5Y3XPvtwlxNmFip0yHaCNageWUXzPo/wImrX87vRZkGoTnW1nmlhBvf+mzicg8m2k32pVsugluKwvQzJqjY1XA17f9WzXAFqN4rmkXvyBHSj4PHAuMzIg==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9190H47m4qSww4sXzBV5ZLJMVllC3qMaIgVDDsUXrDXvpYrMOhDpdy57NjBVF+EOl0A7DqMgBoX0661h8WxMhcvqTnxUnZ8DnV30IY91qDTm7HAfsd7Q1oRiKGfLHrhFoLKgPPu1Q2fHgcAw2scPFl1azP7PkR1s/eHxSMS+Nvgd6q4dPiPPWp+XIdC9O0ukWmbYf2oy+lBiqKabjL7VBQL1v3mThkjZYEpRC9fpigk5h1asjhfHRqhGHiTifc2F6yugevs0aF5mAu/4BPPqkiEV26oE+Tij7xRtfg7DTsMZsdpRsAFV6un4FB/LeAMukldIA3nzvBxBGe/NRBSkPIK7SqbP0s7HkWtmrOA/DetzOzFEX4J7+Qrb+TQmGBUIPVDAP4EHrFV7HE5Efev7UWcDDHLy5ubS8chRtPNTbOXTymRsA8EjCcAUGSW5MwvP
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:01:22.3425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6afdae07-1244-40ee-292f-08de8a76ff24
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR10MB9374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070130_580551_EFD8AC9C 
X-CRM114-Status: GOOD (  10.27  )
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

Hi Patrice

On 2/11/26 14:55, Patrice Chotard wrote:
> This series adds BSEC support for STM32MP21.
> It adds bsec node in stm32mp211.dtsi and bootph-all property in bsec
> node in stm32mp215f-dk.dts file.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> Patrice Chotard (2):
>        arm64: dts: st: add bsec support to stm32mp21
>        arm64: dts: st: add bootph-all in bsec node to stm32mp215f-dk
> 
>   arch/arm64/boot/dts/st/stm32mp211.dtsi    | 16 ++++++++++++++++
>   arch/arm64/boot/dts/st/stm32mp215f-dk.dts |  4 ++++
>   2 files changed, 20 insertions(+)
> ---
> base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
> change-id: 20260211-upstream_stm32mp21_bsec_nodes-16aa826a73dc
> 
> Best regards,

Applied on stm32-next.

Thanks
alex

