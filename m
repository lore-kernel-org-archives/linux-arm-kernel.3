Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38202FCA173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 18:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6hr5aWs6V3r5DdPWqAM6yzJHoQp9yx6QMWBc3WEuXI=; b=IqM+/V5ldWQmNJBkBgOWUfCMZm
	p3eVzvohK9arQdZGiGkbI/Pimqt1cFW44Lx9Lmx77v3rMLlBwarRWroLPi5udmpYCZQqHuYph9slW
	5shUNUsf5euQ922BrMWiYZg4xbVTYG9bJRI27TXz3ON3Qh95r8FQsqZqgFOH1iM6iY0ptuSSEt27b
	4wOGkH7DpGSwGfDoFQERVjmlfPs1Evg2rY8jsgKeopjb0LtpeBpjHt6X0GoZhMeR+2ba/B/eKBiSs
	9BDU9FjMS9FkEEOPf0K83C4Tb+tUOHyJqoTSSzahXxxQJnnt4KnPp1+8WcqSZg/j5yyFi03Ba1TNg
	pbVnp4uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfh1-00000007w11-1Hal;
	Mon, 09 Mar 2026 18:51:03 +0000
Received: from mail-northeuropeazon11012023.outbound.protection.outlook.com ([52.101.66.23] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzfgy-00000007w0M-2eHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 18:51:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmm5KSvfCSUp0riFdVvHJEPFLy6Dh9IRa48tCZ8HoIy0wcfO4+2vOVzN4uesKc/0HTiZDCOceg19O82pCXamzUduJFvz+JZ8dZwYVdd2BbC8xsdvqRrBfopOpAP3TTgIOX82UghezfBH8p8te/6ygHJTjpVO8msCQ4ELpL/pyc96pQLPSkyjcGo/kx6Nzei9nu+yy3dZfAzlQxOL7l66DL6udMzzbKIaDpGIhSzaylXqo08X2XDKpaYCI8oNybLsQiHt7kQQLWl+QbVvongqL0G5O/ywaZhOLsdfij3RO6DxTzXi6+E/+4NQBWIAjXTp4K9iaTiaHKBRGdxWJI7Y2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6hr5aWs6V3r5DdPWqAM6yzJHoQp9yx6QMWBc3WEuXI=;
 b=RqtgwqdDPcnqQm1pCtN7v0VAHKsClJUehi+gwP7+RIrB/9INE4zS4ZIePbYpgpi+YUTmLMQ7Sw/FghOZ7GUnGV9cpWVlB6y3VXyT4n81fa9DogKYS0jy4KSsw3HbhHzDsgPU+skBf6vt9rt2GmGf0cjmTDXHVRWC0qgNTAzg+mu9qo1avTMrP36TDV04vZgzfD/v+/4fRQkHMGfu/BWVAFCTWmpmEDuB/Dc/uZww7U/RYvDGOYx3963KYjdPXl/NYUk+KQy9uvUdAIEH2ZTHOe9bbveLs+0OSECHTJoccY4G/3woWbNjem1XYxAZIfPaTHZl8M9paiFhhBqyv6HGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6hr5aWs6V3r5DdPWqAM6yzJHoQp9yx6QMWBc3WEuXI=;
 b=WTFryAQZuMAlpLEF+t+4GPszoB4UubpecisZTFbj8oK4BG1uR3BrxWbx4hNcRN+3v/pXthKFZ0OylMOEystoxTRHJd1h3qr6qb+jTvjb7lm2Z885rJ9srhB6XV59Ji0wVCNOl/TxA7KMBl1FoQZIWDxbWgE5gwnYC98IoKW1Ej7zQzNJiN586kKTBg0RKWpMxYWOlKNz2QLIvdychrnnU0vjnCiVmQggi+OgriIWwIkIksJm9rDYw8Gt7iDJxz/vYW960jcbQ+16xEQYnabp0ZXj9KYMB9xtubv629B0qh2SFXRe9smcG22NtfPgmkUU+6kzaJHQbtyQUBfT9jaanA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PAXPR04MB8173.eurprd04.prod.outlook.com (2603:10a6:102:1ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 18:50:55 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 18:50:52 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260227-imx93-9x9-qsb-dpi-panel-v2-1-51d7aa63847b@nxp.com>
References: <20260227-imx93-9x9-qsb-dpi-panel-v2-1-51d7aa63847b@nxp.com>
Subject: Re: [PATCH v2] arm64: imx93-9x9-qsb: Add ontat,kd50g21-40nt-a1
 panel
Message-Id: <177308225316.1761942.5057701167388398733.b4-ty@nxp.com>
Date: Mon, 09 Mar 2026 14:50:53 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH0PR07CA0075.namprd07.prod.outlook.com
 (2603:10b6:510:f::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PAXPR04MB8173:EE_
X-MS-Office365-Filtering-Correlation-Id: a69ecd51-ea3e-4298-e8b7-08de7e0ccbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: HdQDf72s1vVWNTOOFrRChy+YpRZt+fwnxJlZMzj5f7Hx8+sqsle+AFfPh81bnhgFTA1Q+aAn9mGdiJND+oSo1lcg+fPTPrMFZ96kTPsuM+htTJwOOCLWcGTR3rApBN06q9MWqZpH/z40Y/GKfmTLmqzThEJQ+Ej5mmFnNU/7K6/4Hps2zMtlosOGE7BH7mBg/VDL6d6YHc2RJXkQ24djVF+G/4TUQy76bD9Uq5XacH5vYhLcG7ZF1B2AE304K28dNPX/x2OVYbEXnp62P9OK2MG0Cf23oYhyEDwja/Q5QQlx4AHSBGYdGelJmJiX3b80jeeOYbp90Qebi9mCpPswr8dqvT1t9pUJzP9Xua3qbQyPJnw9UVOC8lnJagxEAJ8L1RbEZ31d5RXvoKhPUJBkXx4MalBZtqgwT5ZvymTkTEH0GOPRIOOMGqK4lL1HGjnLTRgOU4Woh/idCJ1QYlwcV64yIrM+JFDWzel5Uf4sfgV+F5bsk5T42bvYfOkAN49GB6Oj9fu0GB/KIGlBIS45KfwYJhPALAssvs5rMCxexLtjgUB4bx8feUpf0jOnYwsK+iDtK/RvsqW4Z0ENBjztJef9z1PgnJtOhdu1ieMNr77u0QHzZm+wknijkIp+cT7mpP7EpBH4PG7Unfrz6aKAMbLYdnbJy4bpTtIUOP58zEKSyz0YSwuJZvh1hUAYZEh6DOQOufzCE529zayKSY6m0NjRtAO4Uh8g56+fbybGnK1Y+T+Ieaiq1WhQNaimraRKX7XO6Q/S9jd6RprB9yGubzHh6CCxWnGFYdPinZh76ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjF0YlJtcGFuTlpDeUMyWC9ZK25LZS8wMU8zbHh3b0dDVXZ1WURqRUR0b3Nq?=
 =?utf-8?B?ZzVMYVVWWWxlczUzQkNvbVZKaC9PWi9salBrdHZyVXl2TTByaERpamNvck4z?=
 =?utf-8?B?MmZaR0NIVytwQ0s1clE2WDdUYk81SWdNTTJuaWsybGx5dG5rZWZrSERsc00z?=
 =?utf-8?B?ZDJxU3lkdTdpdmNPTnFQNmJiNUtobWpCT1JEelMrWGt1cXpQa3ZsQXZPeHlH?=
 =?utf-8?B?T3ZTMGRGcFU3ZGZ0anJiSHcrcUlncndNQWlHZlViREZCc0c3OW1aVFdLcFZZ?=
 =?utf-8?B?ZEwvTkRtSWNvMnh4QlMyYkRCTEY3R28yWW9qMkV1bTh4bUwxQUZPa1NZb2lH?=
 =?utf-8?B?d0lUdnhPc2dZeTlqd1dwdDFXcWpyeERJejF2aDRDTE40OU92bGdrK0NoRW1o?=
 =?utf-8?B?TFJqNHlaZm1IaTNJVklvUGdMWFdIc0pHQ1NHT0tKbFVxU0IvMHpJeVg5TGYx?=
 =?utf-8?B?OGNlazJWMEN4a3VsN29teklyazc0OTErTHBJTlJDTTlCR0Q2blRkYzhoVTR0?=
 =?utf-8?B?R3YyNTlXQWRZT0Z1dUl0dGRHbjYzMTBTbXByd083Z1E3UE40WE1UWjhGMGlh?=
 =?utf-8?B?UUpwSjJVSlRMZXBjTHNqWWowanoremlNQUxLa2lzNW54bnVKU01QY1luWnV0?=
 =?utf-8?B?eUxQRGx4YjIyRzlUY0h0RjlpZDJRdTZMYWVXdTQrL0F5OGw5ZVFDdEUxanUz?=
 =?utf-8?B?WkVFSDZpbVZ3WXJmTHM4a0cwVzFPVmlCWU1QUTQzOXhwRGRZdkZiazRmZlhv?=
 =?utf-8?B?ejlUU0ZKZ2hWTlptR1RHeVJFb1Y1M3FtUFdLcFFzMVhKS3BmUmRSU0lMMnor?=
 =?utf-8?B?UkNQLzQ5cEdvc1U0TW8vdkVxNzFIQzJvV2VsUm50NUxHQklQR1JZRW5XSmRu?=
 =?utf-8?B?eHoxNU93dWxtUTVLNkt5anVXUXAwa3JUNk1udjFGZmdwU2svalFDMWJhSjlr?=
 =?utf-8?B?eXRiY0RpdnRBMm5yOWNqem9pR2FSbmJWS0ZoeXdnd2xxYzhKSllubmY0V2g1?=
 =?utf-8?B?RlVyUWtRNFNTNkdoZkFzbU9EVEQvOXRjdTg2alIvNHN3cFNFaDNBbE5YbDlF?=
 =?utf-8?B?OG9ycW5jZm00UFhxSGUyTTRkOTMrb1Z2bUY2MUp6RUl2alMyYjFJRlUxbStQ?=
 =?utf-8?B?MnB6eU40bjJoN0dYaGVKQzBhbWdsTStBcm8ycVJmMmcwZlg4RVhnYTRJeWg0?=
 =?utf-8?B?d1ZhZjJBVVVYSDd4SkxKVzYxbHd4bEw2V3VBSnc5WENKQWJKSmhRbVVDazgz?=
 =?utf-8?B?QVNZdzFlRHRqcEZXc2VkWGhvdDJsSmNCRUxPd0wrVG9nTU9qQ1RjTytaL2Vq?=
 =?utf-8?B?b3ExTkNEbVJuUk95RGRaNUc3My9YS2JSc2RWbWlYWmU3bCtQY25LdklZeWFW?=
 =?utf-8?B?RXFhWTg0UGZvZzJ0YjZjaFZEQ2MvMUkyOGRDZFhDSi81VktieGlIMXh0dWI4?=
 =?utf-8?B?SkZ3V0RIWGtMQmU4eUVQdjh6S3FOZzR0aEdrUm4yNmpZK0RINXJmN251Y290?=
 =?utf-8?B?cWg1dVdBdjE4MDlpekZrbXpvajhwYjhsaEF1VkZrZXMwM3k2bi9TQ3orb1Zr?=
 =?utf-8?B?NHIreS9LMjJyUUNmSE5jVXExbkM2MkdkbCtMTnExQysvWE9qZ1F5WEZKSzhy?=
 =?utf-8?B?Tm1zZno1NnNCRDl4dnBjWk5UUkF2K1RETVZGVVZMV0NTM01rNVg2NU9ESUhZ?=
 =?utf-8?B?Zkd3OHppVm5PV0QrcEdCaTJtWnpQZXI3cGk5VTZuMFN5ZjRRZlpuZVptYWZE?=
 =?utf-8?B?T1FiZTVzSzBib2huY0o0S1QrNmlXbU03NElMcG80N0UwSVlLelRsYkJicXJ1?=
 =?utf-8?B?QjVTRkFzbXU5bktCRTRHWnVTa1B1YUJyM1JFWXhoZ2pyL2k1dXNhN3NKVzRY?=
 =?utf-8?B?V0hvakpRRTMzZENTcFNueDgzQkE3akpIN0dpSlI2T0NRNzJSbDJ0bGF2TVdy?=
 =?utf-8?B?a1dYRHJxTnRRM3VzbmJnbHhCUVJYVDQwNzNTek11MFhXVTFHUVEvQkVrbU9Y?=
 =?utf-8?B?c0Zra2lxWG0rZmlmOXN3eXpGUVNSUEpCL1hHMEpINXV2RzZ4UXpQcWErV1Zj?=
 =?utf-8?B?SndjTnF1RTlvMkFOTkhSa0VYOVBPMFRpWEVsZG5UWXhQanRCMFk2QVhCTnNY?=
 =?utf-8?B?TUxiZmlHbUV5eUZUK2pLUWFnbUxBNEt5WkdaODBoT25CclVteDJGSExqaE5X?=
 =?utf-8?B?cE9VY2ppQ2IrSVhSSG5WVGhMVmx0R1lFMVJLcmlub3RWZm1GOGgwVnpxSTZN?=
 =?utf-8?B?b0xzVzE5SmlPa3hqRElKcVBROXNYTm1qcXdUM2pkcWUxOFNWenJTV011eUs4?=
 =?utf-8?Q?QtWoi3jldqrHH2dp9h?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69ecd51-ea3e-4298-e8b7-08de7e0ccbb0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 18:50:52.2468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qgTGV6WvAXajk9vQYau4pYoifwMqDgAH5jQmadH1/JdR71l+69GniEEFsRt7ZE7Y8e9tDfCHH9X0uHRMSO3V9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_115100_688582_D39E94B1 
X-CRM114-Status: UNSURE (   7.27  )
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


On Fri, 27 Feb 2026 10:14:05 +0800, Liu Ying wrote:
> Support ontat,kd50g21-40nt-a1 DPI panel on i.MX93 9x9 QSB.
> The panel connects with the QSB board through Adafruit DPI Display
> Kippah adapter board[1].
> 
> 

Applied, thanks!

[1/1] arm64: imx93-9x9-qsb: Add ontat,kd50g21-40nt-a1 panel
      commit: a2264548bd146eb86dc87442e8bcc064a58895b5

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


