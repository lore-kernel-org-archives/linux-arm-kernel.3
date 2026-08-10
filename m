Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF03C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4UO8qPAO8frCYWtoAaRmCVey/Lsi+/jl3bkhCqRwwQ=; b=gMmPGq0evT3zEkFnRxsVtNECB9
	fakMDUJ0U8f/qZL4ao1Pnur1IaK+ITWBBYrx8udKstBCEbxsehaCjPQdl7nADBooMFjnR4OHmX7S+
	tTnbOWwl2wIiYMniC+B8eXBuZMXWOs/mCgEB99S2m6pIakdCMkQaqB0BOBdSFHRrZrf/iVWXxoQqC
	qpNi80Lb1yD9HDtDVmpjqTw5XWOuAhdfyB0EY60LXFcyI6HZ7ewl5Rhnu1sQlHX2xmzQhKtJcB4qd
	CEyN/h0GF9Dc/quF+3ErBRCAsoa2qowZNHf4BwdAZVDsMkhHb5O5bApy+zzotdlSYLD8S10k4llky
	pOdCkqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLm9-0000000BLSr-1knj;
	Mon, 10 Aug 2026 08:54:29 +0000
Received: from mail-francesouthazon11011053.outbound.protection.outlook.com ([40.107.130.53] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLm7-0000000BLSU-1bQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:54:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seSdmmGKb1MKrEcyB7JJgZGeZfkaFKE8dYdXtk8rQ6SpSXJpeQdApKPpLzZuC0seoBxy0547eqrIkxXsZtdopxtQWEUwffXeAM4cn+grp2lRyg5Ph1u09yTSN2OT/yiNNwMHYadego1e/2qpkQFsWQ8E9rB4JxZRVQxVU1JsFDZ0B/1lfA3CsvHpum6m7d8DjvwPdmMa6+q33hNoVEgBx9YLqSEbBS9FBkgEnW2GVWnQf3LFN7NmdGOv6A9MfN73GZ1Z1bXOA0G1RF7TlyAIfEcR9Q2EeHa4rCKmfDXHOCjt6SXdHu5Gzr6clm6+Hh5+Uym5nXr+HP5VAgOE4aMzwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4UO8qPAO8frCYWtoAaRmCVey/Lsi+/jl3bkhCqRwwQ=;
 b=UqARwvL+QfsnDwX66MclW+3SXviawsLHzFcL6B721CZJKxYD7kMD0t3dBBLnD1A+Hiabk1HlTUxTSM9XxpUE3HiQgRCnvmchm49W0uJoAvzP4Qktbx6G6uDIL/X/0F4ZdN3uj5Qo+tJ03HCNjjHT5N9grnJbcu5ewOyPsbvrCcAmlVMKqJSQcUqEeYJUd2jgO8ntxJa4NRQzzSK/FK0K5hBC9zFvao3RgDmoRmSuzsDOlWHTtz+WMGkb6KdkmKu4ONtBFrenA7cX0yWmKIaZFiB0OkXqayjqvfKzdXb3SYKk0b4UjlN2D6renbcXyX4tMPY5C44xGZgvTFBnfnGtXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4UO8qPAO8frCYWtoAaRmCVey/Lsi+/jl3bkhCqRwwQ=;
 b=kN8PnbUKNsMVofmb1xs5QkyEDiBuJwLOitATxGKb3pEXuXTin+XjFhIMPHr73ooik1BrzALYnpgxSNbAeL3YYoTBk8WCXKJmKAJImkFk1df7/b6jXCGWh70JX78AZich6vv9s/JX2wnjuEF3f6/3ySw18rkY6ddWKjc3eSMYqe0XGo4cLamhbg2r7JehGois2pghCiHyRUbIFBMHyzFEo5Pz5dElOmRglyXeQ0fW0I3J7ngN1KTTSEA31Roc9QGcWARBCWF8K2f/qOUv8T1xXubrD8TrIuQH73LJUFXUHftWtyCLac5qqDAS3m0Q3If+F6/yhRJ+AFJIN6RH5DLyeg==
Received: from DUZPR01CA0349.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::14) by AS8PR10MB6793.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5bd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:54:19 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::25) by DUZPR01CA0349.outlook.office365.com
 (2603:10a6:10:4b8::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 08:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Mon, 10 Aug 2026 08:54:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:59:47 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:54:18 +0200
Message-ID: <3cdbd4fb-83a5-4421-a7d0-ea9128b7740b@foss.st.com>
Date: Mon, 10 Aug 2026 10:54:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: stm32: add LTDC / DCMIPP access controller for
 STM32MP135
To: Alain Volmat <alain.volmat@foss.st.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260721-etzpc-mp13-ltdc-dcmipp-fix-v1-1-a969f2ab8da1@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260721-etzpc-mp13-ltdc-dcmipp-fix-v1-1-a969f2ab8da1@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|AS8PR10MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bf431c-7c01-4faf-49a5-08def6bcf70c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: HZHWN7TW65Sn8m2loHmZP5i0+2Gs+frFzR+XXJm8Fjo1MJW+VKZHlXMc9JPiuZVqqKVlUq1Wm/S2f2Hh/BLXFdzy8PZ+UkaDMGGKZxdzLl+YKJ+OIoqxEnV2OkzcnSq30HxdOrQ9jMZWgYT0vaxKpOlNY0UtfA+t9l7eiO1LZC9JChieK5hjEZu7uZ2s7CgE3Pccqs1te48gz20HR8P6PyHZ+3Fdi3uAy4wuAn6yaS5IkrHpT4puUjrb+iLt5c/++5kEmKa8h57ITXCUxoI6iDwl1CabvBuPALE6dW3ycPxDpNMnBT80KhVM27K1vhExFCw8daFjaPV4B2qjPWShQrwElnI4r8RRdC2ZklulX7GTgxc53OtuV8gV4xGfVvagiSlhiXton8u+V2GIFlbPtPdJcS+xeBA3yplF7rmOE2FHrFrnPecMY+k76zuyF1MsRv/ang+LZ6SkxFtJ3bMDmJ3+dIH5eMiVfHfUdhLUhfwgv16rzAgWqOTgjk8uDP/cP6Yz+p2AIYgv+KzDeZO8NdBvsa+rsLijxqkhDDE4j3Ymr7bfgig7nq/3uyJ6MagPeuWhK6IRmpv/Vey0pPYEw74U4Ls4okKLmdERlCfBuUxs6+pEdyUuuXaRhH1EEem5DG9MUcpuUUTX9R5GiKCpkdLjkuPtqWPc3KvvPeUrSd3S7pT/Q3gzSOMMyBilnrKI5cfL2t379z5pzu+nauOa8Q==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6TCAhh+0hqB+9yYIY/4wKp5rW8O2su7BqLdwKWLSfaU7RviT10n/wn/pnRUBxhjVPg36qzzVbb8JwTJUg6O4FKNPyqIqpcZ0skQKcGfcF0qggbNQeDt3B60l2I7Y7RAHIAKZKaXw12VICmDzDWpJma8tpiZ0ZXdL/D4M2kgCIv3hDEnWslPzpXYYZrnIKFDSFPoEtgwnXKlQr8ew79VjtexApa6xpnKIJkUugrxZPiOWgkC5SZgTV+LZtxplGCxM4Bi/0WLAIMUTxuEqafB39Ql+q1YUH3ft8a5BllRNt79xKsXTesX2EfWIQOxiBtJg18GE0G0dLRXcIdoW5/dbW0c66i924o9RW2CH7UCAEWrHOj72K/7sexH7QTQ4AnRCQgRgiCwp8cxF3UjJqQm4qiiZRHO+LcFrndCjvwa1kVrdLMLp5aR1yAs0PKu/huzk
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:54:19.1010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bf431c-7c01-4faf-49a5-08def6bcf70c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_015427_437513_A354350B 
X-CRM114-Status: UNSURE (   9.97  )
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

Hi Alain

On 7/21/26 19:00, Alain Volmat wrote:
> Add ETZPC as an access controller for the LTDC and DCMIPP found
> on the stm32mp135.
> 
> Fixes: a06b9560eb6c ("ARM: dts: stm32: add ETZPC as a system bus for STM32MP13x boards")
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>   arch/arm/boot/dts/st/stm32mp135.dtsi | 42 ++++++++++++++++++------------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stm32mp135.dtsi b/arch/arm/boot/dts/st/stm32mp135.dtsi
> index 834a4d545fe44..f573335edf6b4 100644
> --- a/arch/arm/boot/dts/st/stm32mp135.dtsi
> +++ b/arch/arm/boot/dts/st/stm32mp135.dtsi
> @@ -6,29 +6,29 @@

Applied on stm32-next.

regards
Alex


