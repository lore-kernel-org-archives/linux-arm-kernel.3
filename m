Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E86D16804
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wexDerHpGSJFdquYd7GS2z8cagHA6emprlVWE53paH8=; b=KhJ3Ew1K53AmF2XBKo7PAF0WBD
	8DvPzX3XdWjNVQxyapV/nSbk9dh3RAieeevOwVHQKXS8fRheC6zBl36Tu+GEb8eMiWIuUgpGr/vlO
	/qYy5q7Qo4aiOAY4fIRD/82pghiNG1Wc2mr8qoo/sLYM4V8sYfBxC1OTqWM/Wl1uQI3qAo1Hr4Pg4
	0wMHvWwrwvAVZGxx3S1LspMKFh4EqRDecoEoSxWxfmHxv5OBEPsEOKMVQwM3KK3FQS3JdRn47oPjS
	0RDr0xpVlZdye8bwXQQ3V8gMse5hmV9jeFcyUHVnQGfLTfBdjAa8GS/qtgduaDqI4A3c79OVjDyog
	WpgnEvXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9uw-000000029Fl-1umc;
	Fri, 09 Jan 2026 10:40:30 +0000
Received: from mail-westeuropeazon11010058.outbound.protection.outlook.com ([52.101.69.58] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9ut-000000029Eu-3eM0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:40:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3CY7Ii/KIPEZMz4bfMyG3/JDuJTv7S9aBurzaZCj9OqUbCvWy589hBVAkTgA2DijqXRCjO5aVy+Wr3Pc4pUl5pQeW+sMkCU4+SWb8BT+seTH5EnZ3CyvHigRe/yzTe6FEJThrcJzOSgNPM0RCNneAgRSxKxZxxOuPgMEDsDmgigLmKqm8bJc+9NKG5Sd6kwY7x5F+uawfJbA3BUmc89RONN7f+TUvcaVaWLGrDpf9w0KHBfY910WgiRhaqbUjbQONe6Jk5YHSjkjQMkv5+mihxtgStWlQIAhjsPP1W+BgtKKDRHU6INWXwzP/e4Zn7eFB4Z92hYZh1uHdiJx70Aew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wexDerHpGSJFdquYd7GS2z8cagHA6emprlVWE53paH8=;
 b=hKnjxOKXB8VCrTvD5RZDGXAYHEvFQac79kpLlkVhNRKRbwm56MzqbrgD/tuP3kpJF+g7Q9PCmnoIkXSBBkXuzF7F5szUR9vCVMUtf4f5/95swPbDn1+TkIKsHuzFG0gMB+c9NWZ6OfcYCAFVlNGUtQ80zMCtLz7f07Q3NhCL+3GswXEHDIIomGzQhZu6vWbZaS1mBHYAVSE69mU0LC8tGS5zhMwrCqddARmazgHo5iNNJTVTzFub3Gj2Jbl5y4lLGdcL86ERYJiaCFzNlJuCgsQ2dOipNAHQxdJYOM4/6A5Fzr4xGh/z9PpKzWa6Okr7BZeqQ1kod0VsFvIVsADW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wexDerHpGSJFdquYd7GS2z8cagHA6emprlVWE53paH8=;
 b=VHPLkbMve0+N/8mTAtbqlXcezuVuTFNBlEOXxH4uHSLcjhI9aKkxVSKy3V8RPdZirMCySsIKFVwYNUnJH/vw4kZCU9ZaKO5UQKxmHTiQESJg+Js+FzDZbsHUpWadZfTNdGDiMJBWd7nt7VgIi1pk3WosqxZXI34JWp3BPicazuFvP9vcadJw17S6oxPdhfMAVDMiy+zDmarwbTMqZS2udrBP+tf3W6IhHp8cKVvQKEnoJVA4u7yGNJS5/FlvKwkbHfDySkFxfz622D3t0hQtCAMzlh9jCmSXeOSsapn42pNkwMUs9visrmgxQs4YzpIeEcuz7wobYklYGkxJD0MitA==
Received: from AS4P192CA0036.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::29)
 by DU0PR10MB6899.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:466::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 10:40:23 +0000
Received: from AMS0EPF000001B2.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::45) by AS4P192CA0036.outlook.office365.com
 (2603:10a6:20b:658::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 10:40:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B2.mail.protection.outlook.com (10.167.16.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 10:40:22 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:41:39 +0100
Received: from [10.252.25.201] (10.252.25.201) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:40:21 +0100
Message-ID: <58006bf6-425a-4016-996b-4a01fdb22cea@foss.st.com>
Date: Fri, 9 Jan 2026 11:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH 2/2] arm64: dts: st: add TAMP-NVRAM support
 for STM32MP25
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-amarula@amarulasolutions.com>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260107194541.1843999-1-dario.binacchi@amarulasolutions.com>
 <20260107194541.1843999-2-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260107194541.1843999-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.25.201]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B2:EE_|DU0PR10MB6899:EE_
X-MS-Office365-Filtering-Correlation-Id: f5777c0e-8e01-467d-dc74-08de4f6b7dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTdsblFnNFRSNVRTdHpnWmZXVVN1N3IxWmk2R2szNXl2QXBOWjNpZ2NMMkJO?=
 =?utf-8?B?cHR6NFZ4bStYTjBWYXhsTmJUcVdabWVkVGZnaFpBZklYaE1iVC9HTW93SFNp?=
 =?utf-8?B?L2tVWTFITE5oUk5lL2tMNkhsakVaeEZmSEozUURkbE1BZmtpYTBUemJHcFBn?=
 =?utf-8?B?ejJCUFFObjhhWkFsZXpzbUNZaFpsam0yNExkNU1Ea2hrVzJsMXRaM3ZSYmR2?=
 =?utf-8?B?Zks0ZUpKaHUvWlhPU3BSTUdRZHJFcFNBTHlKRk1oQ3dkSE94TlVaRHgva0Y4?=
 =?utf-8?B?MVFvckdDaW1NeUdPVnd1TTVGN3phK2hMajFQZnE2R3JLc2hwellJdm9VTkFS?=
 =?utf-8?B?TDVRTzU4ekg2cEY2aEszVEdaQXNUYXdFc1VTZGszaVVFTUc1NTZGMzRBdjB0?=
 =?utf-8?B?Yi9SbDVvVkVGS3o0a08zMWlrZEJpN1NNR3hjMEMwZ1g3N0tlY1U3eHZxdTFY?=
 =?utf-8?B?dkdkTWdRZWZMUnlSTWhGYzQvR3pNUzlnUnpja0VZb3dTZHNOWDlwdDNVOWJ0?=
 =?utf-8?B?QUh2UzhIeThqR2R5blAxUHM5VEF1SmFFTHNudjhhMmZSOUE0Q0lKZDZPejcr?=
 =?utf-8?B?OVcvRzJhWHRFNnFsZmhIeDFUaGQya3Q4WmhLTjNyNUtGNEhsRkVoQ00rQnI1?=
 =?utf-8?B?MElubXRVVWNqdjdVK1c5bVJnb05YUmxWK1h4T3pVVGlobTFtbVloYTZ6Y3Ju?=
 =?utf-8?B?cnBGeGNaZ1hna2RMOVpZeS9zMEtFK1VjNXVVbDczcEhFRkQwS1I4ME5sUm92?=
 =?utf-8?B?WUVJc2NUR0FPbm9ZL3psVlZrZGZYZFFkS2taampMV01RTXVZMjRHdVk5dHEy?=
 =?utf-8?B?cS9sTTJBaVlNWTdydHlLbTNqcHozam5IMFphV3hNZEZaeHhtci9nTG5oTGs4?=
 =?utf-8?B?akNIZFBGekd6MkhHOEpRYzVMWVZCVjBrZU9Qd0VCUXA5cUszaXVPZ3RmWGNO?=
 =?utf-8?B?bXJGWVhhY0M1d011TlVjaTVZVXJ6M1FiSlVPck5sNnA3d2w5VkE2TE9zUjZ0?=
 =?utf-8?B?WE9EU0VmdUJHR0JZdkdRK1YzMXVteWNKcFZaN29Gam9qLzdSamRqM01MNWdI?=
 =?utf-8?B?OUdOVzhCV1hLWmY4ejZsSU1RUVVwbDlBQWFTL1J2UzRrWGVPY3BlcG5XSTFw?=
 =?utf-8?B?c0YyS3JRSlZicHFpZzduRU5qKzk4UWJTTmtTL1lBc1BRVnRpN2xGWitDQ1Yx?=
 =?utf-8?B?Zkd6bVlmaURCcGY4Z3E1aDBDUW8rZGtoVkUrR0EvUW1qc1ZQMUhsdFhVcENv?=
 =?utf-8?B?eFAvMXZDcjJSU1RBbTJZTkVjWGRMTWVtVWhqT1FXL1pjVU96blRSdHRtdEdN?=
 =?utf-8?B?TDI3Njk5QkVCWFVhZnpTY2VURStSTnpIWjFiSTcxL3RhaFUwclVLTG1zN3Vq?=
 =?utf-8?B?M2tIQWVDZlBGaHpIVTJHcHZhc1JVV29ZOXZoTGFVRGNIYnloWXUvamVKTDgr?=
 =?utf-8?B?NXBMYmJ0MXVWU1pKQWtjbDRHN1BTdHBjZlB2V210cDZ1U1hvZzltZGF0TmRO?=
 =?utf-8?B?aTRKS1VIYVd0bEZCYktsb3hUWDhhMkdvcDRqTTFFdFFENFQ4dUNlcWpIanp5?=
 =?utf-8?B?OVlJWkdkMExZSTJJcDkvV0ZoMG1GV0FENnNRSEpmLzNUMzg0RERpZG9xNDVk?=
 =?utf-8?B?YTF1czJzam5wNndkM2pkY0RhcTZ0dVhlWnVEQ2U2V3VkU2VyOW1wMkdSeXNR?=
 =?utf-8?B?NWxmdDZGRE9oMjJKSitoWXdGcmZucUtjbEVLbHdrV3hjd2pib2J0RmJzZXRY?=
 =?utf-8?B?Y1psNlVSRHhOald4UHZLeFhsbkc2am9vT2tGSXhwL2lFVDJLRlZWTStRRWti?=
 =?utf-8?B?aXN6aWx2OURadVJmSER4anFVekdIci9lVThMK3dneGJzNXRCcXg5VnRlY0wy?=
 =?utf-8?B?YnowMGJ0UnFkZ1J5S0JrajJnMzRuUzdLcnhoSTVyMUt3dWEwKzBBWkFXNkpm?=
 =?utf-8?B?SDVrQUxoOFVXYm9CVGROZ0NZMEVvZzBXVW1OQmxaclNKN0kxMXFyb0k4WDFP?=
 =?utf-8?B?V09xd3kzU2VmUlArajNDR1BvRXVwVjVIQjN0SmFBYjFmRW9wWEJkVCtYd20z?=
 =?utf-8?B?R1FFMXRFdmhHejJCTXR5OW9zVDlWb3VLMXBMUjZjQlpGWWhjWit5Tm1hRHNo?=
 =?utf-8?Q?LoDQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: oCzytRUSAncR7wYh8ZvrsvWtQsKjyEd0bLQzUAMSx0UFpBg/sKGtC1edhzASfHQiEcHNRFQMrbrZvjXOlfzU2BxvaHhh3l+Pv2yDBk4ZDXeX/kPc2g0plIqckvaddryN5W3xeicorfKliz9o6KRWqoQC1AZYIJOAu1Lnc7X4LVEJ1o4zUTZf5fCjYKZB3/qrMUMhJwviywC+k3lLtm5Nq1fvgLXx0A4XPdwY6kRWX7cbres8tqBgfzVNBctSbSLDGg5gcdky8Y71F/kOgXJU+b3x4Mr27d2odGaHSr3+J46MeSE71CPTT9WcHQTxEEb73DPFzRquf6b7gIkyX6atWmDkhVQdGUA8U+ovTiIhiw6WJuS8VKgkrSadaD7mTQWHkQcDybvIpg/V7nDtS7JTpT4q8W9WftyCwx78rUow3jjtbNLJs7lsdvD/bnlv1qXUk1Cg5OTevnuggwkshZmQVkwjLS1UupFf6Ilg7xI4CjqoudQhCLvc3aQY3rKY/2zQbeG9iF82qltmtUDZymZVORMVmz8tKsvIrNbU86ByJemBmK5e9hox1iEdA/McDFC+qz7+BSrb84/wYW+Sou8VdmqToZMA0VWVEvftrXS16NYsojrcpFRBr+ecJ5os0mNYsZtwXy0dbdcnyz3aCIcOo51JfSPFVzbPidrNHUNnZiJLowRScZeAnigKAQuLJMjp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:40:22.6277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5777c0e-8e01-467d-dc74-08de4f6b7dfd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_024027_921962_F5288C10 
X-CRM114-Status: GOOD (  13.78  )
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



On 1/7/26 20:45, Dario Binacchi wrote:
> Add the TAMP node along with its NVRAM child node and define the
> fixed-layout for fwu_info and boot_mode registers.
> 
> The TAMP (Tamper and backup registers) block is a system controller that
> provides access to backup registers as NVMEM storage that persists across
> reboots.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  arch/arm64/boot/dts/st/stm32mp251.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index a8e6e0f77b83..c7839e732f31 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -2084,6 +2084,32 @@ rtc: rtc@46000000 {
>  			status = "disabled";
>  		};
>  
> +		tamp: tamp@46010000 {
> +			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x46010000 0x400>;
> +			ranges;
> +
> +			nvram: nvram@46010100 {
> +				compatible = "st,stm32mp25-tamp-nvram";
> +				reg = <0x46010100 0x200>;
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					fwu_info: tamp-bkp@c0 {
> +						reg = <0xc0 0x4>;
> +					};
> +
> +					boot_mode: tamp-bkp@180 {
> +						reg = <0x180 0x4>;
> +					};
> +				};
> +			};
> +		};
> +
>  		pinctrl_z: pinctrl@46200000 {
>  			#address-cells = <1>;
>  			#size-cells = <1>;
Hi Dario

At STMicroelectronics we intend to upstream tamp-vram driver for STM32MP series.
If you don't see any objection, we prefer to manage it in our side.

Thanks
Patrice

