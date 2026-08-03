Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A869C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMEuNu0nFpwdyIlST3IaGaCYudzb0g8bdp81Trxe5PE=; b=M/eqkguGJvzSjkde7ozxFAtzfS
	xUSU6wmprVJtsHhv0cKiRV5WvnYd2ikESVYpJajaF6gU/1n1lL3Q1t45PZEPhs9fdFQ5uL7hxgEyl
	ONKWxthb3N4KNCirqKm2sSkbWuNqt/eqs03X+EqgOqoU1lDhvSXr5I9uB9YlVJ7FxUUo9VPouaaUL
	Db8aKGzr12Euj0HasQjQscMdN/1V10L9Ml3xs9rEfqn3YY8oJJOxxfQfy0yIz3enAu0B5mhPYMRee
	fq3pSz0KdvJDo4/b4kRWrPheAzOlXXgsO5VV4r3w5iZy4WsRKf9wZQ1odPp4fXdhBBOEotHAWRIcZ
	GTdBPyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmCT-0000000GRm1-3Qbl;
	Mon, 03 Aug 2026 06:31:01 +0000
Received: from mail-northeuropeazon11012031.outbound.protection.outlook.com ([52.101.66.31] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqmCQ-0000000GRlQ-0UKx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:30:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TteRKpR0op4TFR7hGe9QiQIKs/ZuIottLt0DwXFEsV70P4P6N09n76WRmIPxDSjEoW0FJieavs0jZeudu4gjpCwJoNIdD2IFDQFOM/KzFg4uq3ZKN1RRuakBMj1oJpMwP8xBO8ykMY7dTB5IewVOfQImp9GgcxZ/s2JxdPUWfX8OQXvf3elW3AAxgWTQblJtWBpOdQM6M3ACIdhCq5WxZfe/wvBa09PID/FLDRkaVN0yx5KegC3BKoEiUBOrnhtfkR4V683IV8581jrVQ1e6jcZt82n1UcG1NIck/xWDVdtfM3beUmfXQNiN8JyDX/iG+BcmTRTMee8QCbYmYZ0FQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMEuNu0nFpwdyIlST3IaGaCYudzb0g8bdp81Trxe5PE=;
 b=VgcO36IDsaBH6RSmvkJkSrxFrG/73ySxqyC45zgpHyYfHzgm8l0cI/b1Lrn6TcBa7K7YO7AgHbyEH1P/RxsNhgCee3QZOJOH7Jfr1zlr0VJGxiTMpXUuTiEXlgcfzB45BLO+dKjrE7TGBGPOppNE0WRXCJzGteQGqiPWPfbzPx5US8kmzSpjJvkK+S/aqzWmBgIkCEF4bfYyEeroNLDNOVTTWYxWoSjfYtTnN3ZYFWzuMmjtQbNuSKtMM+n609eUu1/LdVBJ3L25quh12O4wKGWWVh0LzjJ+y0gzk2ZAjR+pNHp2q3OyGRYx4+FiYEsJLZ3NZ81meZa3f5cAgItsxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMEuNu0nFpwdyIlST3IaGaCYudzb0g8bdp81Trxe5PE=;
 b=T4x6UBibobBub1ab1OwdTtaOEdh7e8p7GlxEoKQL7UlgGFSw2n/sVTf+D+Id+hKmcrbNbkgdvIMTDs6nz2NhUauF4uewuCd0IoHvIpk2DeqnnNRdw0arbqB0Z9KrT5w/WM/+NqqpGYFi4Q1/uH2v6Oy/B5/Ez8/Skin3SVp57PCkrlETJ8NCUGxzJJvpcxvaz5O5ZejwbBdwpub7wWZ5qVfjTAXfx6sDvMutR2X9Iuv8LjokPrZfdiyzNskzWHrAeXq6dhDfKlcONoGRvhNYPOs92FjDTY+ptLpn+CnLTDAGmXfGydZRNN7q0aJN7h4w+RVsZWQ8bMnX0JupBVCf+w==
Received: from AS4P192CA0009.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::16)
 by DU0PR10MB7567.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:401::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 06:30:48 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::46) by AS4P192CA0009.outlook.office365.com
 (2603:10a6:20b:5da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.17 via Frontend Transport; Mon, 3
 Aug 2026 06:30:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 3 Aug 2026 06:30:47 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 3 Aug
 2026 08:35:38 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 3 Aug
 2026 08:30:46 +0200
Message-ID: <857fb9a1-e151-4e83-ae33-7db6d0be2928@foss.st.com>
Date: Mon, 3 Aug 2026 08:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: st: Add I/O sync to eth1 pinctrl in
 stm32mp25-pinctrl.dtsi
To: Christophe Roullier <christophe.roullier@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260730155913.16285-1-christophe.roullier@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260730155913.16285-1-christophe.roullier@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019A:EE_|DU0PR10MB7567:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c509032-9da6-43ce-70a2-08def128c17b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nJPWE8fKhSqC06hWNJcfxDgYjp/Jg/U6GdrkAjPF5Jn36RowEB7n69f4n+QDoLIg7RCkn0HGMwGO7WvL3Cyzzrkrz9Sn3I+PMtr+m7Q0qz3Epy2Vs5eReU0D8qG2BTmrYLJCf9c0YluLuTLKQri5pMjZ0yIxaUn9+RLkJgiIz4tNDM8qBDMBpPkig4a2dhrORmtz0yeMNlNePjdHF/zrDINwK8FRe3LVWY5gAUsYg9bNk0wBRwar+JUVevSq43meQFDbmG+YhxukUqr/7dofDfSjj+Rmx3MLx1+GHFskxnBPJuxgSOG7zuY00xOfL01ZwmhfUx0B4xq+SHv7q1z2ro9ZSKAHB9uXag+BnGADt63W+/AT63YZZs2qY0c3fTky4cecS+DQH1dyYjeGzm2SMGc+1nmei15r+XVDe3B6nr3nBk7a+B6f4kU8xvaHnqwK4teiLGn4oQrAhPUSzs/C7tsjnH1zFUcbb1YWCd+Gg0whn7J0nP0o0f44+8QD+krknuFa2CCrn+YpNcJevsJ1CwRSwj9LHs+nBZMCyRhYoIVThGidVYK2YMLW7/7rQizAo1+G7dpKDrNiuAZkdVFeE6qfnEEOScavcf17EGQGIWZ0ZS5mZybtLRNy4vmH+CvQXPMHfmE7iZmlzojebM1vF2wocgFa/T8pSxwKwuIUFcfwNtc40YDE18vZjLiNKVnmS22XRpEUwtVfLjJtP9kGeQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p9ifuc6ndwyGklNP5Cgtte8dnSRCWSpYT6hueDzgaO9fCQW49dawKxQmmrPREHyDEnAKXjrqEkNPijzCKZcYuELBKkwao6VbOaLyXmE44IFZUwDpdCK3uTGPwyclDQ5Y6zNFMu0oJMRa0EdgdwNX8ZO9zxdJQ8p87sond5nFokIuZmRxIvAlqIcSXlPPgaN0uxYkix4/qrnjzQyPdLymLUd6qPmkqaSTN9eltEkPiLZH4ZQjmsvETAUuQH7PioHZQyw95JYEA03vB3YduoEv/cU1ecHTDpUIFuE79D5k23PmW1oPqkplVsMMKbB+RrEGMSsRUrVhR7ZYAK7+VoY4N1M9fXR3Ggn4MyC6farHzDnXAqOGaynbNGGEirWKzyUGBAk74RxoEnaEdXV7dkoUBwCc3RCQXnpyknhXzxVh2HIq69CKOeh2cxVltsy7E+Yj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 06:30:47.9378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c509032-9da6-43ce-70a2-08def128c17b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_233058_575768_0FB0DF44 
X-CRM114-Status: GOOD (  13.41  )
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

Hi Christophe,

On 7/30/26 17:59, Christophe Roullier wrote:
> On board stm32mp235f-dk, stm32mp257f-dk the propagation
> delay between eth1 and the external PHY requires a compensation to
> guarantee that no packet get lost in all the working conditions.
> 
> Add I/O synchronization properties in pinctrl on all the RGMII
> data pins, activating re-sampling on both edges of the clock.
> 
> Co-developed-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

I think you co-developped this commit with Antonio (not with yourselef). So maybe that the correct order would be:
- co-dev...: antonio
- signed off antonio:
- then your sign off

regards
Alex


> ---
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> index 456ece7f8ebc..4fcfc4528c5e 100644
> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> @@ -95,6 +95,7 @@ pins1 {
>   			bias-disable;
>   			drive-push-pull;
>   			slew-rate = <3>;
> +			st,io-sync = "data on both edges";
>   		};
>   		pins2 {
>   			pinmux = <STM32_PINMUX('H', 9, AF10)>, /* ETH_RGMII_CLK125 */
> @@ -112,6 +113,7 @@ pins3 {
>   				 <STM32_PINMUX('H', 13, AF10)>, /* ETH_RGMII_RXD3 */
>   				 <STM32_PINMUX('A', 11, AF10)>; /* ETH_RGMII_RX_CTL */
>   			bias-disable;
> +			st,io-sync = "data on both edges";
>   		};
>   		pins4 {
>   			pinmux = <STM32_PINMUX('A', 14, AF10)>; /* ETH_RGMII_RX_CLK */


