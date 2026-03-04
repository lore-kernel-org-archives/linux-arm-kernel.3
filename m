Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F53EDEC04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmyyVG30bX101bf2W34RW/cyuzhm7tLo/emel09MezU=; b=XKmxjDD4QPGK/j1hClPtVSgMWl
	7ZFkb6kyICAo3m2XNwnZ3L/wHbhFMIAtgDc09csaOeKOFXiofMV0Iba+QZGaj0reBKDXM4Pkc7Luj
	7C9zG3Iy+NBpkdG3pWT3i3oM2cmpcynLQ81OYZyPkuUyU53xmcgSOniVph+FxbRDtho/vQYxxaaEy
	hqhGcEH/zfRzeFXs1aWuAvZBB1bNm0+DhPfCrWUyVW6ksOCb7RY7w6fGIsVLExFLeEhl0Hi9WUH82
	wQ0J49NPFs5s6kS+Zxg0Uo13lj7E0V0finOZCGAXQXK5hOYhgr2KHQfU2Njqy7PcgiT2KjB5vkjEW
	VmowP/gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeEG-0000000GSFh-44aG;
	Wed, 04 Mar 2026 04:53:01 +0000
Received: from mail-centralusazon11010011.outbound.protection.outlook.com ([52.101.61.11] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeEE-0000000GSEx-2Lkh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:53:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNoo/WWOUAYNTa10YWQsv0zHF7LbOjMX5ab8ncqlwGW3MMKuJoI4vkcnrVEYuqiDLJh+9cXONFpgxyvbq5bBvffLWSOGUTmHBRVbPu3l0dVD0pTE4jE5XMZ/8ZTqhEbdgCcofr3Xsu8i4EJoGyhWPpjbfndhH9Vbq0Z1UmM6MRZ7Ck4+Cg/ltv/WELeTdC47mXIJnd8ZIa1VD9hA0cmhG7bNI1CjVPOOjHpu1B/lnN6kPe28i9/VUqDq8dp3BBG5Y1hPG1TJCPuNn3OpvEq+ouUYEJ14BkzZAmjYtolTWu0rxU3iT2ruhaJaTqutdCaT2v996lJPvfiWfXrD9dnbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmyyVG30bX101bf2W34RW/cyuzhm7tLo/emel09MezU=;
 b=sb9s+R0qzSvSMkiUF28U4B+Ag7C9Hcj8G75ZtC3EHO2Y0XMA0ECAkLB1TIh+ThOMPc+Z/jkLfuKsJGFaDzYsv6c49lEOESpcsWJPvs1SiJynH+DG8WOkOu99g7ty6T0eAhekvbtMAYDKIKo3tUjpWWl2GtAdz9OlJFCemmXRlsv4RBV/8kSxu6P/3IAkTKxEqQ/GXvWwtILGb4pObwRhXL6p/4d3/vEq7LeOVG8u/0/kSGHg7bHJJ9cFhchjmUMmWYX0VJPmb6XwO/DFJwyS9htjAB/pyl+6r+oojv72akT8d2JGIWSvWoabk1U0Btp+usseuc8Q/3K5MCAmt2mvuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmyyVG30bX101bf2W34RW/cyuzhm7tLo/emel09MezU=;
 b=FHyAmdvlgOTee7tCdNkcBj7ZW87NzJKko0Wfi7ULuO9eK9RXubo4c3mIhfRxu+e9h+UyDSBgMxLWF564x10qFkXsNwI6RWUMS+vZM7VPyA4ZDU3Surex/xFNvX/n+Ha17oHrB8Xsur9KHA2Wvj0E7EuNxpPzmnxfVFoXIsp/wt0=
Received: from SA1P222CA0120.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::16)
 by IA3PR10MB8276.namprd10.prod.outlook.com (2603:10b6:208:57b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 04:52:52 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:3c5:cafe::c9) by SA1P222CA0120.outlook.office365.com
 (2603:10b6:806:3c5::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 04:52:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 04:52:51 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 22:52:44 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 22:52:44 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 22:52:44 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6244qeJo3916368;
	Tue, 3 Mar 2026 22:52:41 -0600
Message-ID: <ebf6ad7e-cd22-41aa-b168-9b07f8387e62@ti.com>
Date: Wed, 4 Mar 2026 10:24:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <stable@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Fix pinmux for pin M19 used
 by sdhci1
To: Judith Mendez <jm@ti.com>
References: <20260212130843.1054100-1-s-vadapalli@ti.com>
 <0633e48a-27a3-456a-8b9b-32e88d417560@ti.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <0633e48a-27a3-456a-8b9b-32e88d417560@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|IA3PR10MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: d0f66f94-f4b4-4199-b2dc-08de79a9e436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|34020700016|36860700016|82310400026;
X-Microsoft-Antispam-Message-Info: qUbzulDMRIbKt7ezcoRkmLqq5XIFQH/mlM09sJcQ5sCgxN6IfBzkr61sKjD5ANahXGnxnbUcN+nKMs/9XWdURqaqeOBNJ1xvd+wj1u3AV8+cLfqRi25Q5d/9/b9AUir/JRjLmrq6FxGdJx1BpxBpei8dvlFQUxEFB3KEYuRxUfLVE/EKk4OI5QIog1jea6BKmKDquPfTFeEXJqWlHQuKDHCLa9X6FD5rD3vG/Do6FmgPlVobskGMjTbBT/6bRw+CndZ2xvKpn7THDZeyyojQ79wypa4XWFCsh8siVu/7SIOISzN8X30QYaO5VM7qutO7AEXvDm48j9ZCzJKlbT0cpX6ysQVrFy2g3TzqkQtR1NsKg/UCDxLg1Wiv0l0GnVA6r2jFFqW2j10bNYN2VE7ImqaikvWnmh3OMI4C5YjSV4NRA4dgAg0DvnRkfT69gPScHeCLpOJ8ZvRK8xHqYHXL5s190PcYKxw4mZj/jj0cAHEa4nNKX0amvSGXUNCYr+dn/M4vxb8cA8XzSe+P2gTlXVhrNZhlnh+cgJYy5LMtmjHRLmNSRsDh6QNjIhyRyxeNh6QRAkzC6se0gNVetsIx4F3rEoJzBx3ZlIh3HiNj/Zaqz7+2RXh52sYV6h9q1ulPypg356HI5ICNVrfAkJuO2t7DDsTKrbCeyskYFaMVEVsS6L6w8KImu7qz/wri/gEHRX6S4i2DqvA9jOMVvTx20dD3CB5+G3KYVNkwnrxqWFNVjPzI9JTJkz352uEh082pgEf0yVE/WNDAxiH5F5qUrQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(34020700016)(36860700016)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: k5PAFe6WAjKlrK04vPHRy/A9z9BKyd2Vt0jNpajHrbge2EP1k7UZv/SBI0rungdQi2O5dDqshiT43DdaCK7CJrtWLodH6ItRubzrbYeL7P1CDvOIJPHoYShrLlzly3Nds1fVbqqvok1WJ77qOUbo4tDSRPNJbEf4LWJBIE3iQaXJ1lMgPQsMVwSdprTrnbOVzTL2TFHzaCcSVSoubEM7/C5WAmywANpgrEiV/P+s4zZ7QWmSOBlq1iXkBEQVrkDvv2htaGhZfm3mlFo9MVOHnvDg2ZtHj6XoT0C8dV8hH9ue1Ar1oKAALCXazd0WwndbWqIg5b7lTq5ABUVr15y2AmuMpn3OajQoLjbKmxF2Yjbm88Oo3Un5NbfAP7bYPgeSHWJX9kIxndfxuQ9h+hLf+daqhnGTKWl1VD3UaK82R4yAuOI2gC4B5vGtb4PwfsmM
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 04:52:51.7615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0f66f94-f4b4-4199-b2dc-08de79a9e436
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_205258_726134_6F6B9E81 
X-CRM114-Status: GOOD (  23.00  )
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

On 03/03/26 22:06, Judith Mendez wrote:
> Hi Siddharth,
> 
> On 2/12/26 7:06 AM, Siddharth Vadapalli wrote:
>> According to the datasheet for the AM62Ax SoC [0], pin M19 has the address
>> 0x000F40A8. Therefore, the offset to be passed to the AM62AX_IOPAD macro is
>> 0xa8 and not 0x07c. With the existing incorrect offset, the following error
>> is seen when Linux boots:
>>     fa00000.mmc: deferred probe pending: platform: supplier regulator-5 
>> not ready
>> with the SD Card being unusable and the boot process halting due to the root
>> filesystem in the SD Card being inaccessible.
>>
>> Hence, fix it.
>>
>> [0]: https://www.ti.com/lit/ds/symlink/am62a7.pdf
>>
>> Fixes: 8f023012eb4a ("arm64: dts: ti: k3-am62a: Enable UHS mode support 
>> for SD cards")
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>> ---
>>
>> Hello,
>>
>> This patch is based on commit
>> 37a93dd5c49b Merge tag 'net-next-7.0' of git://git.kernel.org/pub/scm/ 
>> linux/kernel/git/netdev/net-next
>> of Mainline Linux.
>>
>> Regards,
>> Siddharth.
>>
>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/ 
>> dts/ti/k3-am62a7-sk.dts
>> index e99bdbc2e0cb..9cfe7e7b317b 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -398,7 +398,7 @@ AM62AX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15) 
>> UART0_RTSn.GPIO1_23 */
>>       vddshv_sdio_pins_default: vddshv-sdio-default-pins {
>>           pinctrl-single,pins = <
>> -            AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19) 
>> GPMC0_CLK.GPIO0_31 */
>> +            AM62AX_IOPAD(0x0a8, PIN_OUTPUT, 7) /* (M19) 
>> GPMC0_CLK.GPIO0_31 */
> 
> What! I don't think this is right.
> 
> Looking at device tree, regulator-5 is using main_gpio0 31 to control SD
> ENA with PMIC. Which is GPMC0_CLK (N22 pad) and VSEL_SD_SOC. Which is
> 0x000F407C address in the device datasheet. So as far as I can see, the
> original address is correct and just the (M19) name is wrong. Did you
> test this patch to see if that fixed the failure?
Yes, without this patch I saw the following:
[    2.108345] Waiting for root device PARTUUID=076c4a2a-02...
[   12.261669] platform fa00000.mmc: deferred probe pending: platform: 
supplier regulator-5

Since the pin was named 'M19' in the comment, I corrected the offset to 
match that of M19 and the issue was fixed. So it seems that although it 
fixed the issue, it isn't really a fix.

Regards,
Siddharth.

