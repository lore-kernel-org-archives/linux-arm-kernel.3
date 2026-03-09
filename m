Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D940CEA8554
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 04:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3E+EUAXtkii6IMzBDsPvOQS6R2JfkwNHrgvmoqSWRc=; b=tWfqRWUJKrOJj80us3fb5lgEKJ
	f4xe0XEC9l6CMz/FGAsn1cMcAjydvYVWORkB7de8V/wQzpRhcmqu2b3S7IwbYFPxFtRXbI6BhdV2d
	FO1DS6l6kht+NQ178rptnaGajVfPGnsOhl9FeEzf1E+mCHf00wLSnRTyNEJhD7oWD7pnLh9dogWXj
	ZGhnpIvM16CJwMQPWA5zI1Gzn9MGkx+7mUD7Ldt5DgZyqDkRjeWTRH1uCbNjgXJSLYNWQwRPbP69o
	b1DgjGIdZGEcUvX220tFdgxOKAMqkyfqzvBRTMAffjkAat7UkSVYe3sOSbzxnKOPspe4GuBMJcio5
	PweeHHyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzSKx-00000006eXV-0vN2;
	Mon, 09 Mar 2026 04:35:23 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzSKu-00000006eX8-0fYR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 04:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KcXq7niSo/StjmZuZ7GUbxNvUtbWDDlRi8B8yqOSlysczOWsRs10Y36ttIWWl3IgDtT0XD6gjzYKRKuAU4kZM8449ud8CI/UYJxY3dstsDp1aYhIJ1CVlR5t1RRiaXyNWteGneghh+NVakbVAyz1Oun3t5krHfOIscmIwXMX6rAeeVTjJg4hdb7WD0VPdDKLaPtQWvTvK1jx9ln5JsVhC+PM2ua8ispKt4pMbUHFZACTEHh+7KxZ7qY7liP0j7Xxr/lcSQGeezocSYWx29nQmqONiUwuREznnJxmGfimsbo4hJ5w2WXg1U5o8VHQryJk73VQovjNH0okpRr5MKw+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3E+EUAXtkii6IMzBDsPvOQS6R2JfkwNHrgvmoqSWRc=;
 b=gZ/xfQIdL4RZFQZZHU3Q2hExumXSLfXbHSknbNSer1yaIQbEWrKPYLizHFFUzxbwj9h7nxThPWNMPlvqPb9iJMtbi+5KQyoLRVXFbLjlLZAN5gb25dhwAhYN9A7hcr8GUifBtw1WBtSxvEZbiQE7aAyQoVjNwfZDIOYWLxX526MgkbxbPhPKRCcw9q0UNkhggINyqgBRY5mouNC0ip0Eq8h9XhNBPYzjk3B8BypZ/kxY7ufYoAL+OTzOIqY2gf0diysLzs/B8aIBdIBCOTIUyBAlIUDFgOdEvbfS+WzzqbpK+LbL5O2s2XAPSjlPbbYAF4+4jFxDq47Iu/BrOzCnaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3E+EUAXtkii6IMzBDsPvOQS6R2JfkwNHrgvmoqSWRc=;
 b=CECfa9KcD78f7E0PPzBoplMlkDA+lC2EqsuKSgNqby+V4AQeIZ5FPhIEZpSbUZFLFT5/PnXRPxZfPPoymDjXKgK8ChpSy4yL43Qn9/Ci6UhSEHHPayUAAa9sj5i/nQCyQ0bZXh7n1/BRWRL7wB6DZNtwsWeSuYZpJbPZf5FmHMk=
Received: from BL1PR13CA0167.namprd13.prod.outlook.com (2603:10b6:208:2bd::22)
 by MN6PR10MB8072.namprd10.prod.outlook.com (2603:10b6:208:4ff::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Mon, 9 Mar
 2026 04:35:16 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::68) by BL1PR13CA0167.outlook.office365.com
 (2603:10b6:208:2bd::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Mon,
 9 Mar 2026 04:35:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 04:35:14 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:35:14 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 8 Mar
 2026 23:35:13 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 8 Mar 2026 23:35:13 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6294ZA1E389753;
	Sun, 8 Mar 2026 23:35:10 -0500
Message-ID: <baba390d-e695-4df2-adab-e76061a75601@ti.com>
Date: Mon, 9 Mar 2026 10:05:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Fix pinmux for pin M19 used
 by sdhci1
To: Siddharth Vadapalli <s-vadapalli@ti.com>, Judith Mendez <jm@ti.com>
CC: <nm@ti.com>, <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <stable@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
References: <20260212130843.1054100-1-s-vadapalli@ti.com>
 <0633e48a-27a3-456a-8b9b-32e88d417560@ti.com>
 <ebf6ad7e-cd22-41aa-b168-9b07f8387e62@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <ebf6ad7e-cd22-41aa-b168-9b07f8387e62@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|MN6PR10MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: d6dba21a-6f7a-459b-087a-08de7d954239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014;
X-Microsoft-Antispam-Message-Info: nFKLpRWv0SY1+xnUcZjF/XoaoHkl7hImPfTQ0pBuBRO7Y9txR17mvCD0zY5zoQiy3SWLdO8WSmGPUUTIBp5YgQy3kSWDh6/Yj4g6d20w7R8xncve0v7ecK00D4FpAdKkVatHAl8x57RwbGNqqr2vAqp+IEoJxlFeYKdEjthzLDiQSW5bMj8gJTRQGQKNdOwulrFC28CjpB5K9F/vjRI+QEsf991Aj4ScgfAd/xf5OxTovJAcooU6t9KbOl3LHH9lmMox0DEnuc8VpY4jWYJ4l536OPIYt8OYsBlzMMKhc3H45PQEYt/6zNnPLhToLl80F+6g+p4ELxjxIfglJkAMi6l42x3uqXa2vk6i9nv9zo6sA5jsXSR31bl9xdzN01eMNfv8N4poIl5h34BmeQsSM1NXTclMbaJr4vVEBILp3fX443a7C6+KKB9MsS5sg8H+XkokuXXGs5UF893/4UdEWoPgjFADf/KiJf7lVFYsghtl/OqIJ7qzjmraYg4u/nD9UYLWq8kyWA5mXfcKpAqkpEkAET5KiCT4GDCQFsTw8Qvmw4OnTvO/d6z0QJpYqkrcuQ3LDvXVx7slcGEtqVZbOu9zIgiGlpanFcghT23d85PyPplPrz4IBOEJTFwSmzCjDiyzbuYHH9JWtTN6VHA0SGhrVDK2Gs4HoSTE5727jSym7yNqU+te3bUn3x0kaEWuGhUaiYPbuDVi8xxefkB9wVGi6QWwqhmt4ZIhhAwgmYs=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iH4Lc0cv2pi6rWgvKZ32Cga3KC/553hLOWFCM1EXKE+wlXxpnVH4cqZmCgd1/dIhDn/vRZZnZpHJ8cFC+a7LLMfV7OGJ3jUJTC4gRbMMY3AQ5l7zXpjAZu5Yy3+tnkzqUsFf/mNvy5hcYHUvYqlMYjA8IhDH9Fhf4qag++N2oEGKqqqBcoZkY6u41rrCfabE+DJs4VbBGCV4HWHK02QGlvVtjO+6Fnwa0jBfLq/Jz+4/a3y6XUdqrqlXKMbnftHhw+2oyCTiTvAyea6wVJwPP0wsf9+uiwcGRCqzIW6ceDbEs7HDge3k+BPIb4BWaxMWHJWm+8syS7MkId+0uSqV7iGpUXEvLHsEPXjR0gu4ZswEnnaN3/sa4yhAfZ0hdG3/kQfQBWcD4C0g5d2+R7q530dSDEu19r3f5M5tcRyutUAnbIY+nE5ZGe/63883cdMQ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 04:35:14.6618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6dba21a-6f7a-459b-087a-08de7d954239
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_213520_203851_3DA87E7F 
X-CRM114-Status: GOOD (  19.51  )
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



On 04/03/26 10:24, Siddharth Vadapalli wrote:
> On 03/03/26 22:06, Judith Mendez wrote:
>> Hi Siddharth,
>>
>> On 2/12/26 7:06 AM, Siddharth Vadapalli wrote:
>>> According to the datasheet for the AM62Ax SoC [0], pin M19 has the
>>> address
>>> 0x000F40A8. Therefore, the offset to be passed to the AM62AX_IOPAD
>>> macro is
>>> 0xa8 and not 0x07c. With the existing incorrect offset, the following
>>> error
>>> is seen when Linux boots:
>>>     fa00000.mmc: deferred probe pending: platform: supplier
>>> regulator-5 not ready
>>> with the SD Card being unusable and the boot process halting due to
>>> the root
>>> filesystem in the SD Card being inaccessible.
>>>
>>> Hence, fix it.
>>>
>>> [0]: https://www.ti.com/lit/ds/symlink/am62a7.pdf
>>>
>>> Fixes: 8f023012eb4a ("arm64: dts: ti: k3-am62a: Enable UHS mode
>>> support for SD cards")
>>> Cc: <stable@vger.kernel.org>
>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>> ---
>>>
>>> Hello,
>>>
>>> This patch is based on commit
>>> 37a93dd5c49b Merge tag 'net-next-7.0' of git://git.kernel.org/pub/
>>> scm/ linux/kernel/git/netdev/net-next
>>> of Mainline Linux.
>>>
>>> Regards,
>>> Siddharth.
>>>
>>>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/
>>> boot/ dts/ti/k3-am62a7-sk.dts
>>> index e99bdbc2e0cb..9cfe7e7b317b 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>>> @@ -398,7 +398,7 @@ AM62AX_IOPAD(0x01d4, PIN_INPUT, 7) /* (C15)
>>> UART0_RTSn.GPIO1_23 */
>>>       vddshv_sdio_pins_default: vddshv-sdio-default-pins {
>>>           pinctrl-single,pins = <
>>> -            AM62AX_IOPAD(0x07c, PIN_OUTPUT, 7) /* (M19)
>>> GPMC0_CLK.GPIO0_31 */
>>> +            AM62AX_IOPAD(0x0a8, PIN_OUTPUT, 7) /* (M19)
>>> GPMC0_CLK.GPIO0_31 */
>>
>> What! I don't think this is right.
>>
>> Looking at device tree, regulator-5 is using main_gpio0 31 to control SD
>> ENA with PMIC. Which is GPMC0_CLK (N22 pad) and VSEL_SD_SOC. Which is
>> 0x000F407C address in the device datasheet. So as far as I can see, the
>> original address is correct and just the (M19) name is wrong. Did you
>> test this patch to see if that fixed the failure?
> Yes, without this patch I saw the following:
> [    2.108345] Waiting for root device PARTUUID=076c4a2a-02...
> [   12.261669] platform fa00000.mmc: deferred probe pending: platform:
> supplier regulator-5
> 
> Since the pin was named 'M19' in the comment, I corrected the offset to
> match that of M19 and the issue was fixed. So it seems that although it
> fixed the issue, it isn't really a fix.
> 

Refer to the schematics and not datasheet for pin routing. Please submit
patch fixing the comment to say N22

> Regards,
> Siddharth.

-- 
Regards
Vignesh
https://ti.com/opensource


