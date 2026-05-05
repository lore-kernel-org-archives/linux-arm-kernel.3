Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D40DDCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 15:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2y/zDBFY8x0p/Kr3vkkTbRZSv4XP5+ZImeqIIvGIPg=; b=2Ka2k3vO+vtz1/Npv/GeoBkYVB
	7kl0dYoCvJzY9SX4FTUSAe1mnzZT81BHntK9Wg0X12guAhJww7/PUU+4eT0mYcb9Zucj0Ukfbg1uN
	kkakrt1VF4QbK4uW+DAQlWEaGHxYhg566x2XLJUxEOFFnfQrGgBzmg5b+heJveGFkHEtdtSVbru2Q
	FCbN/lwlVCOuNz7aQ/CIaAm00qKT1Jx5eoo4z8uadIsLUxeZX1SkaVRPYQdXXy0tFxesqfv2ZYpRP
	2NGTGiE1tA+gYUhrwOmM6hhjNtmFI6hUVkJ1+BZv+wSv3/6VI6TCHlShB3t103nh7j/Fxfhl+Ryzg
	b/XSP/7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHNA-0000000Gbss-1r3K;
	Tue, 05 May 2026 15:07:44 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKHN7-0000000Gbqw-1JGI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 15:07:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzbpjc5aRfaCkkZ4NdFzsQZVL9Ug2aImrJsGqaQNh/27XCYjkXOD0MmfSvpJ34u4Pu0oZMIRNmcAhNasW5CFe5NoNa4vU9PWruDqO8olH1JKBdDMqv05e9/qoyDGNKst4qIXymnYPxwvOQZFViwoQIu7zTxWsmJUnHZ7GbzSDyduhVBHMotH8AL6vEgp0CM5zTqTmjoBacUbrY7oZC3n56kd/+wscMFeMpC8lp0/m+n0BEAL9Cs0YczvF2lmxOomHC+3xMD64Y4bF8r5ro/P3cN2jfGFfnh4wMAXw0E1Y95OqyXoHsg4nefflCJKgqZ+O+XwPxKIWIAxc/P2bLkpPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2y/zDBFY8x0p/Kr3vkkTbRZSv4XP5+ZImeqIIvGIPg=;
 b=ivkbnLQMyG05CyWpJKO8VIuCu4Ct0QASdg66tyuTwL9LegspZ5L/piqkqTBwSJyWxXG75KNTe+fJrKedIQXvEbY6ObrSjmpo+wEYUkKgQSmDJT9bur9NsY6rAL4D2izlv9/ezXoHCZyyyk9OkdsEXVhJftesazEyEC39OFpeAy51VmXhnAW5CFaJmMCH+vymS27czJSTE0CkGrcv3naNSdxPyHwL+C46/oWhzp3uiBuE9ZABBBds/v02iCdd/Ue9z7A4pNCNHTJ0BEIj5m74UfgG7mIDdbyS2AlJb237TFzdqQ0Pphjh+Ey+n6y9nylJLrFIoEO6p3ftOnYZop9zyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2y/zDBFY8x0p/Kr3vkkTbRZSv4XP5+ZImeqIIvGIPg=;
 b=eNNWtrUMcQDW2XG7NOhvmIDLKn3Vd6pWyduapmrQeEAn9y9kZ7RDpPS+EWWY9cvwhRVA+/djWvnN+5yEeggsn9YochAVm5nO5aqv8shpimO1LyLSWDLa3WuzbFR+j8sL/JZxJbeO8ftXUBY8EvtsLgqaVycyPeGSqg99x/vdjeA=
Received: from BL1P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::10)
 by CH0PR10MB4858.namprd10.prod.outlook.com (2603:10b6:610:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 15:07:34 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:208:2c5:cafe::96) by BL1P221CA0023.outlook.office365.com
 (2603:10b6:208:2c5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 15:07:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 15:07:33 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 10:07:32 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 10:07:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 10:07:32 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645F7WDj3227041;
	Tue, 5 May 2026 10:07:32 -0500
Message-ID: <86e975e5-96c3-4301-adb0-f100c26f7f9c@ti.com>
Date: Tue, 5 May 2026 10:07:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: Add k3-am62l3-beaglebadge
To: Krzysztof Kozlowski <krzk@kernel.org>, Nishanth Menon <nm@ti.com>,
	"Vignesh Raghavendra" <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>
References: <20260501233148.4180391-1-jm@ti.com>
 <20260501233148.4180391-3-jm@ti.com>
 <b96543f2-8907-4128-8f77-f670c22bbf7d@kernel.org>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <b96543f2-8907-4128-8f77-f670c22bbf7d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|CH0PR10MB4858:EE_
X-MS-Office365-Filtering-Correlation-Id: df595466-6ad6-42b2-0eaf-08deaab808f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: fSmtF9HZ9JNYK4UqQKTWENC4hP1sUZOh4bQl2KkeSe9DJZVY4s+kLXqpAQEceGlkQaDlX+iO6icjAUeHPikeYmD5NpfJjSXqDAMxloH9yyI1dPQc1kBYuXZ/tJn01e3EDnQUddP66PCeFFH3vXXIoI7AOzHFACvYdE0oyv5rD0k0kswM0pRiV3PsF7qV0YUXVAJat9JCRtkwDez8JMsMeAkgSOwSZ6GepSwtFjqXqzEJ8Q4G3PTSWgsqri7U/Syxa5zp2cdMGalpskJgf1RwibjtdzszRKHXkr3GfSBJ8NKfO6CTjwbX+YIKWkppQqHp6vlaQHhM9Hg4Y/WzY0sptRZvyI5rOViAtPCHlB+Km/NX0vAdm2GS+Fx7x2PPB/j6BeOOpo0WSu9TTeomf4IUTVZVCrAVkfjsmFyIB9JP9m7fQwrfZQ8kpwWv752GohbTzrHqkzP64oLz0HIi0+iXOUzviyyvc3MNztWdwbiXSlMqkh1AvVLkDUt9PXUyyhF2Xv4LpGvYpR/iOV4LI+NLQTeUwI43y/ROTR7Cv0HZDK5sswQBa3iFYKPsJq1X8TP54EmUlz/Ti8KRpu7lcN31KzKDWHxePGz/pvL+SFuqGSnm2oxYMpK1pXEV5K28NiWBuW3LQMBiwX47vIKCYUHN4X8aBwlsqNf7XcudaSblnAI=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fr/IDViOcDVbk/9qOUP74tlOdJ+AQoaqnwZADyO/suhIwx3A6XHXSOgrpohhcADEu9qcRmY95gItQAF26f5CjIDGPx/tajOmpsRsX3Dpj7XnD2eYrXu74b60ULBxiO/NAjq88d6aS7XhH1iilF0gsvjPQG7FbjkHoGspwUSb2pLlVakJOgbBp4xOSrYyCPMFQyt1KcYoHgPl+1KDAdf+zz+jKOyXmFXGOH6xprhu5CycfEgkM3EZ6U9WRGORbhwrEASUN+23iUDna/O0G21sO6hqpl5ipUmnQdqYZltu1KI45ytLcZrxzP6juouqkgrtSeDBiQmHmx+Z5sGN/Tg9sBzDhTOfEoYrkTvw7GPhb1J83+TWH6CzBZMupdRf2W9WkSyhOmjTeB3HbYX9zYaOzqBYNX4bMBAeHXS8DkZEpg0954v1pzI7Oer+u+Eoij9F
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 15:07:33.3091
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df595466-6ad6-42b2-0eaf-08deaab808f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_080741_415376_1C621CA0 
X-CRM114-Status: GOOD (  12.01  )
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

Hi,

On 5/3/26 6:25 AM, Krzysztof Kozlowski wrote:
> On 02/05/2026 01:31, Judith Mendez wrote:
>> BeagleBoard.org BeagleBadge is a compact, affordable open source
>> hardware single board computer based on the Texas Instruments AM62L3
>> SoC designed for IoT and embedded applications with low power consumption.
>> Expansion is provided over open standards based headers including
>> QWIIC and GPIO interfaces.
>>
>> https://beagleboard.org/
>> https://github.com/beagleboard/BeagleBadge
>>
>> Co-developed-by: Andrew Davis <afd@ti.com>
> 
> Incomplete DCO. Please read carefully submitting patches to understand
> what you should do here.

Will fix, thanks.
> 
>> Signed-off-by: Judith Mendez <jm@ti.com>
> 
> ...
> 
>> +&spi3 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&spi3_pins_default>;
>> +	status = "okay";
>> +
>> +	sx1262_lora: lora@0 {
> 
> Heh? Lora?
> 
>> +		compatible = "rohm,dh2228fv";
> 
> Nope, you don't have this device. Stop faking stuff. dh2228fv DOES NOT
> EXIST! How could you put to hardware something which does not even exist?

Will remove this node and respin the series.

~ Judith

