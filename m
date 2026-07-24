Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02911C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1weQEPtCt6L/FdpIqFlrl2FPj0IFyjzFKaUF4Q9Zaqc=; b=WCgP/DO66vKrCaW9RKletOKhAB
	4YByVN2ELvQA8rGduWuJmTMt9jHFYvMEwELjKeLXnaPzONRHBKswNGYwb43rAuv5iX5ShPY/wo4Tq
	zYGZXX2I8VF7k0weKabP2eut0RMPbSm6AGR4qfH+aH2r0PcoGWeWNI6CWmf3izjz0S0EbgCnRbCg/
	2eIdGnOCScBxSNVKCBQ1st52AF2Imfuo7+/fUJtUV4QvK1TzycxlCv+xCXc0n3EJ1e4WaVqPYIA7x
	eEqs+8TuA7fiqb/oET3oVF0XifSPV2M7JlVBDyB2CGnC9nJwpCT92Z6fti7/5qK5d3THCniZi+CFQ
	3vqCzdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8xE-0000000FXj3-0NVw;
	Fri, 24 Jul 2026 06:00:16 +0000
Received: from mail-westeuropeazon11020138.outbound.protection.outlook.com ([52.101.69.138] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn8x9-0000000FXiT-3s28
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:00:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSxGtN/H5QGu+R9JfuOmTZ9kQhJ3a/HSrZzFqjWRzTQ+bRtyL7Gc7EWURzh+gIpi2YVySGHqzBPiwwRIIejSmr7aAKF0BY/aiG61Hg9iwABLgyXndzembWRtAmq4LjK6/Pt38RWJRtRgZd5Moa2x+RfF8iD1WriCdBvML7xWm1k5/0q1YTVMFqA6Jj5HjU+O4l6w9y2DRUiFddpR/nBsiFccx0MgYJqApLwbqC0iDexYdLiSC1307G3McBjBFe5djbEEwVQoY1wqCHI/J3gOWXUeWRDdfbpD1YoIFRK8uX0kOLnroZjp8+ZD505/mdCFuWDWl1/6a9KYXs2ooByWOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1weQEPtCt6L/FdpIqFlrl2FPj0IFyjzFKaUF4Q9Zaqc=;
 b=SYFykvUUq/bHUOQ03fMjwfy64MpQMEGWAIrNRa/reIv+Vs9AgWkyE8rbM/+75C5Z+/wxpVqFkMsR9zTi+7SrvrUGsaDhgkl3Mp0sDqvn6z+KwjORMkR6sjEdhCMVjCSe9Mbhb+oC/HPmKuYxW/tm55j51TgmRgddd4u19LTBmLTArnBmmG+rkyq/gwp78GX0PZT3mNzF4iaLt+b2AupGRrm1BlwEQonmo285VM9QagdnamOyk7eEiW57Ee5K6A9jOFWzmJPFwLrZ82Jn68xsqQese9zB9gLR6SstXBMSdObeQtOYHp1zOWSSycbnmkC90f53p5aZ0AaWtTuSux2r8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1weQEPtCt6L/FdpIqFlrl2FPj0IFyjzFKaUF4Q9Zaqc=;
 b=OyWHep0S2TrlTkrJh/xcAB9aktGhZrbP4y08efdH8x0U8YwGjo1ErZcVXXM9zT8clUlXVgXIigkUp7EFS/yN7/lrfHHwafSFyJz6KYj5R2ImAataAC5hZqbJ1ExfCQPt8dRhy0CvQlsn+I0Yiu7dLJUWv+IA0S34YL4mg20H7BFd32mXcL9R1rFrJ2aWtmrvmq1ehb42FIL14RtceBVB/+Wkx5jqQf7Iz415Nzw43+VQto/qOlxMhRlxj6On/06N3Ww7tPWdxvGOBoZFyvbtadtp7AVXqoxbWjIWm4imRjCfDC/mclHBkHWBYKfXJ8kz1k5A6nxzqO7H26voosJEIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4b3::21)
 by DB9P195MB1242.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:293::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 06:00:05 +0000
Received: from AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a]) by AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 ([fe80::295f:9a59:b66a:621a%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 06:00:05 +0000
Message-ID: <74d36642-81bd-4d79-98d9-e796c360f887@phytec.de>
Date: Fri, 24 Jul 2026 09:00:01 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [Upstream] [PATCH 2/2] arm64: dts: ti: Add support for the
 phyCORE-AM62Px
To: John Ma <jma@phytec.com>, nm@ti.com, vigneshr@ti.com, kristo@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@lists.phytec.de
References: <20260722214052.1962414-1-jma@phytec.com>
 <20260722214052.1962414-2-jma@phytec.com>
Content-Language: en-US
From: Wadim Egorov <w.egorov@phytec.de>
In-Reply-To: <20260722214052.1962414-2-jma@phytec.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0106.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::21) To AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:4b3::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P195MB1456:EE_|DB9P195MB1242:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f55df19-dfcb-4490-bc98-08dee948ceaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10070799003|18002099003|22082099003|4143699003|11063799006|3023799007|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: TTm+OV3KrZBVc7xd9DNAjPVz9pag+X6VkKs3ixv5b9q2NXbnINk4FHGPsa4Vr0CrKAtMENGleLyTwKYgDrbAi8Ab/DWUbsopM5nRHbmEu4YZqn4EAq7K8YAle1p2lZJkU3Ip6kYiK16x3dcsTj+ScpY63NFQ3wLqrDNzZogmIb4UO1z/88qwqNMmZi3YJumeYlebCjC87xApalvOeF+l/GCJ3Towu4A73mf1Ecd58A0yMG5iQ/jVwT8gzPsw4nQ+TILXKTqeIBU5R91EfYW1r+wKvJDK5LTSU48l/ZI68IPUSsXlmasI8IXSgbhgSNBw5gu5jyFXQYcB4PGranLqRBClhHymWgoj50SNbETNjs1WkavSsgH0cUk0Wm8/sQBPfdJqLHsRAMss4hBJkaId5hJaU0BEXGqfOxLZQ+58D55wn06Y9TFouihImhM6zzlNudAkRw2aZnUC1grF5kA/6q+KUbXAvuYhZWDRU2B/hI108jdLySbO5IhYX8rfQMj81Zo7o5kkgdn2j63gN9Wvci60Nr5R7IOad935slrhWxNFGLYkfYYujwIq1xCJnN3tf3xMuPI+BJmBpoLsREniYb/mOfnTQ1+A6E7re0TthKmGQKz1nyyx64JedX1QOzc13tsUp7DilMrZcAHCF7sa7mpq3IFzUH4SU7Ja9sicbKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P195MB1456.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10070799003)(18002099003)(22082099003)(4143699003)(11063799006)(3023799007)(10067099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWk0UmIrdzlnbUtkMFd3VVozcE90a2lLcmhzMC9MbUpDTXZoeVo4N3RQOHN1?=
 =?utf-8?B?Q2VkL1NRV2tyZnMycFFlb0U2V1Y3WlZWeHZ3U09ISVFPY2hxN1BUbU4ySk92?=
 =?utf-8?B?ZDhxNWFVcE9Fd3RkUFg4TktoeW5pMkI3NitRZW1sS0NEWGViVTlTb0toK05U?=
 =?utf-8?B?L0dLVm9FZDYxejdDSmZWbVBGaXFNTnJxc3VkRmNEa3pBOU51TFBGMlR6V3BB?=
 =?utf-8?B?amg2OWhqSTRmU2RkZk9EdHBFclllc0lPRWRqTW4rMTJ6TVpXVlllVXAwMmk0?=
 =?utf-8?B?N0xHRkxQQzVZQzdxS2Z5VUh3cXBzRGJiUEdTL0Jlcm1YVzkydmpBeThtVHN0?=
 =?utf-8?B?cXBLSlVTQmlhNFdOM2JBaG1WU3VvVy94cDJjcDRjQU95Q2xwVkF2Uk5VUUU1?=
 =?utf-8?B?TDdtVmtEZzBGUUg0cUcraXFqcGRxUkZYUTByM2tVZEMzVUF1OXBjbjZlZCtu?=
 =?utf-8?B?b3BCcXA0M3pUTlhvWERFK2krSURUTnBZMWp2QVZPTS8wZFhUckwvN1RTQ3hL?=
 =?utf-8?B?ZUVXUndpbE5ML3hldmVXYmJLM0ljYXhOM2Q1Z0pyVkMwQWoybHJFZG9PRms5?=
 =?utf-8?B?RCtSckg4ZGhzcTkyTm95bTd6TnNMVjdUMWZoaVFCMSt2VzBhQi9mTFN4UnJ5?=
 =?utf-8?B?eEoxc0wyYzVWaGt3cFVidGRJZkcyMnVuRVd1bE40cW9FNEs4bzZQTUtiZlJX?=
 =?utf-8?B?MTBIVWREQzgyNEZQQ2RMbFR3L01XR0p6VVkrZkc0OTh2OHBid1huZnRSM3lV?=
 =?utf-8?B?RU9yOTM4U1kzc1BoU0JrMmJqckxzeHlvdFVDZVJVMjVvSEtNSDBvdW80UCtY?=
 =?utf-8?B?U1FIVDV5akxPY1FyNnFQNmplUUxtekpveGhQa2ZGbDIxK0k5NDEvTUUzc1J4?=
 =?utf-8?B?V1ZaVzhXT0NBbXlFSlhRMFVrT0RZVVV2Ry9zM0h6NEFFV3NmMGQxMUw2SVFw?=
 =?utf-8?B?ZGZUTGlBclZYMHR1M29iZnRRNmtsaUFRcmx3QzkrZXoxYTcyeXA4Um5kcWNM?=
 =?utf-8?B?cWp2ZDN5UjVjYVVndGVlVTVTTndiQlpUeENaZ2JRUFNsdHRrNFhQMys5YlMz?=
 =?utf-8?B?MmJCTnZBSElCdGp4U1AvUVdQOW81NE1uN1htTlI5YmlGQlc5aytkdUJBNzll?=
 =?utf-8?B?bk5LRUFsUklrYVBZOS9meFFMcy91bGVyU3I3UndJQ2JQeWZ4clVuMnZldjZT?=
 =?utf-8?B?cGJEYWlxY0VrZzZtOXc4azRtcVRObzhLTUR4S1ltNTZ6QTBVNnZRWXlHT2FB?=
 =?utf-8?B?QXBHQkQ3WEE0Tk1vdFNiN1k0U20zODBVSGw4VlRlNHYzTHlxS0k5VkZJcDlC?=
 =?utf-8?B?VkdFUEtQRFBCNUc2SDB0bU9CSUY0R0xvWThza3R1MmJKMWdPKzRoNkZGbHRF?=
 =?utf-8?B?ZjYyeHBHczhCR3Z4Q2dwVkNFSmozdU5EWXZUbGNyLzhIN2ZGMzlMUGJtV3lr?=
 =?utf-8?B?OWFzNnlqeS9Hb3AzNzRIeVdobHhFc1J6UndQMWVvSFBySzl1RmNpMm0zUG8r?=
 =?utf-8?B?d3RkUm0xLzk3WFVYajNkLzBMZkNHeHdvOFNhYUtVUWVlQjEzMG9uTTNueUlh?=
 =?utf-8?B?VVhSbTBJaHYrMDNBcU5NREl6STZOSS8rK0VVOEJhQTJFbEFtMFZpbHhlcFlq?=
 =?utf-8?B?aWtrQ1EvTGJ6RndKYjMwMERnaFRmTVdhR3lubmdWbnhoVmpVMVBTbFFzQVZj?=
 =?utf-8?B?aGY3UloxYnZHelFVeE0vV1NuS29vdzNIUTFPd1NYN2VhUm9OeXZQRGY0eHND?=
 =?utf-8?B?YllJV3Q1a3k3UWpDdUtlWHFWbVN6OTlYSWkzQWZCNXVJVjdFY1IzemJ2WEwx?=
 =?utf-8?B?ODZNYmZ6NDhWeEZrRGRrUHg4aXl1clpyNlJ0WTVGb1Fqa1BYKzNSTmVLdnVi?=
 =?utf-8?B?alEySzBJUWwxMDhKREo1MWxhaWErSTAzNENPMDQ4RmgxQThmZTh0S3A5QTM0?=
 =?utf-8?B?b1Bic3JvaWpsbXhQcXM2RWRKbVUvdk15YThkUDZIMHJNRTBUSWNoVmVHTWZX?=
 =?utf-8?B?RjNkVVVhYTFWcWs5T2hFaUV2N0FKNlJmQnNiSkwwSG5IUS9sNDM0eWtFeG1G?=
 =?utf-8?B?SXQvREQ2OUl2Wm14cXRoRjRiQ29scmEyL29WM3l3eUpacXdpMENOU0VhNHpQ?=
 =?utf-8?B?WUUwbzR2RU5TLzVTQ2lrdnQrOEtJWGdGZzMybE1Cd0hOLzY5K2JvL3NKcElt?=
 =?utf-8?B?NlhrYVFhZnZsejBPUnhVcHlWUDVhTWlYeml6TGVsaXhuZlRlRzZoTi93Z0gr?=
 =?utf-8?B?cE53bDBrOFZBY1haMDY1Y2hvaXJIVVJVSCtoRE9iVnQzck1FK1puZ24yQUVw?=
 =?utf-8?B?elF1ejBncWtxZUN5WWRNdFBRdWoyOEJQZEd1bWJtU2FjYm5wL1ZMMkdGbWIv?=
 =?utf-8?Q?KMwk3ztBHxhj5FUIxu443zFS1dzVU2W0dphpsRRTpFQOW?=
X-MS-Exchange-AntiSpam-MessageData-1: ljeEB7mfGFkgzQ==
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f55df19-dfcb-4490-bc98-08dee948ceaf
X-MS-Exchange-CrossTenant-AuthSource: AS4P195MB1456.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:00:04.9993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2fcWQyxjZC7d3pLNzyxKPhIICH2Eps5FU0IxpM5JLIoipn5d35NUO3Hgmop5H1llY7OFVRv/5uabx6YBgt6BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1242
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_230012_171710_A556333A 
X-CRM114-Status: GOOD (  18.32  )
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

Hi John,

make sure to run dtbs_check build. Also, make sure to order nodes in alphabetical order.
See more comments below.

On 7/23/26 12:40 AM, John Ma wrote:
> Add support for the PHYTEC phyCORE-AM62Px SoM [1] and the
> corresponding phyBOARD-Lynx carrier board [2]. The phyCORE-AM62Px SoM
> uses the TI AM62Px SoC and can come with different sizes and models of
> DDR, eMMC, and SPI NOR Flash.
> 
> Supported features:
>   * Audio playback and recording
>   * CAN
>   * Debug UART
>   * eMMC
>   * Ethernet
>   * GPIO buttons
>   * Heartbeat LED
>   * I2C EEPROM
>   * I2C RTC
>   * Micro SD card
>   * SPI NOR flash
>   * SPI Accelerometer
>   * USB
> 
> [1] https://www.phytec.com/product/phycore-am62px/
> [2] https://www.phytec.com/product/phyboard-am62px-development-kit/
> 
> Signed-off-by: John Ma <jma@phytec.com>
> ---
>  arch/arm64/boot/dts/ti/Makefile               |   1 +
>  .../boot/dts/ti/k3-am62p-phycore-som.dtsi     | 339 +++++++++++
>  .../boot/dts/ti/k3-am62p5-phyboard-lynx.dts   | 549 ++++++++++++++++++
>  3 files changed, 889 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
> 
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index f4d109ef6798..dce7e0c1cbd6 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -81,6 +81,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62l3-beaglebadge.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62l3-evm.dtb
>  
>  # Boards with AM62Px SoC
> +dtb-$(CONFIG_ARCH_K3) += k3-am62p5-phyboard-lynx.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-dev-nau8822-btl.dtbo
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
> new file mode 100644
> index 000000000000..434dd81a611d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p-phycore-som.dtsi
> @@ -0,0 +1,339 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2026 PHYTEC America LLC
> + * Author: John Ma <jma@phytec.com>
> + *
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +
> +/ {
> +	model = "PHYTEC phyCORE-AM62P5";
> +	compatible = "phytec,am62p-phycore-som", "ti,am62p5";
> +
> +	aliases {
> +		ethernet0 = &cpsw_port1;
> +		gpio0 = &main_gpio0;
> +		gpio1 = &main_gpio1;
> +		i2c0 = &wkup_i2c0;
> +		mmc0 = &sdhci0;
> +		rtc0 = &i2c_som_rtc;
> +		rtc1 = &wkup_rtc0;
> +		spi0 = &ospi0;
> +	};
> +
> +	memory@80000000 {
> +		/* 2G RAM */
> +		reg = <0x00000000 0x80000000 0x00000000 0x80000000>;
> +		device_type = "memory";
> +		bootph-all;
> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c800000 0x00 0x100000>;
> +			no-map;
> +		};
> +
> +		wkup_r5fss0_core0_memory_region: memory@9c900000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x00 0x9c900000 0x00 0x1e00000>;
> +			no-map;
> +		};
> +
> +		secure_tfa_ddr: tfa@9e780000 {
> +			reg = <0x00 0x9e780000 0x00 0x80000>;
> +			no-map;
> +		};
> +
> +		secure_ddr: optee@9e800000 {
> +			reg = <0x00 0x9e800000 0x00 0x01800000>; /* for OP-TEE */
> +			no-map;
> +		};
> +	};
> +
> +	vcc_5v0_som: regulator-vcc-5v0-som {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC_5V0_SOM";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&leds_pins_default>;
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +			function = LED_FUNCTION_HEARTBEAT;
> +		};
> +	};
> +
> +	opp-table {
> +		/* Requires VDD_CORE at 0v85 */
> +		opp-1400000000 {
> +			opp-hz = /bits/ 64 <1400000000>;
> +			opp-supported-hw = <0x01 0x0004>;
> +			clock-latency-ns = <6000000>;
> +		};
> +	};
> +};
> +
> +&main_pmx0 {
> +	main_mdio0_pins_default: main-mdio0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0160, PIN_OUTPUT_PULLUP, 0) /* (F17) MDIO0_MDC */
> +			AM62PX_IOPAD(0x015c, PIN_INPUT_PULLUP, 0) /* (F16) MDIO0_MDIO */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_rgmii1_pins_default: main-rgmii1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x014c, PIN_INPUT, 0) /* (B15) RGMII1_RD0 */
> +			AM62PX_IOPAD(0x0150, PIN_INPUT, 0) /* (B16) RGMII1_RD1 */
> +			AM62PX_IOPAD(0x0154, PIN_INPUT, 0) /* (A14) RGMII1_RD2 */
> +			AM62PX_IOPAD(0x0158, PIN_INPUT, 0) /* (B14) RGMII1_RD3 */
> +			AM62PX_IOPAD(0x0148, PIN_INPUT, 0) /* (A16) RGMII1_RXC */
> +			AM62PX_IOPAD(0x0144, PIN_INPUT, 0) /* (A15) RGMII1_RX_CTL */
> +			AM62PX_IOPAD(0x0134, PIN_INPUT, 0) /* (A18) RGMII1_TD0 */
> +			AM62PX_IOPAD(0x0138, PIN_INPUT, 0) /* (C17) RGMII1_TD1 */
> +			AM62PX_IOPAD(0x013c, PIN_INPUT, 0) /* (A17) RGMII1_TD2 */
> +			AM62PX_IOPAD(0x0140, PIN_INPUT, 0) /* (C16) RGMII1_TD3 */
> +			AM62PX_IOPAD(0x0130, PIN_INPUT, 0) /* (B17) RGMII1_TXC */
> +			AM62PX_IOPAD(0x012c, PIN_INPUT, 0) /* (B18) RGMII1_TX_CTL */
> +		>;
> +		bootph-all;
> +	};
> +
> +	ospi0_pins_default: ospi0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0000, PIN_OUTPUT, 0) /* (P23) OSPI0_CLK */
> +			AM62PX_IOPAD(0x002c, PIN_OUTPUT, 0) /* (M25) OSPI0_CSn0 */
> +			AM62PX_IOPAD(0x000c, PIN_INPUT, 0) /* (L25) OSPI0_D0 */
> +			AM62PX_IOPAD(0x0010, PIN_INPUT, 0) /* (N24) OSPI0_D1 */
> +			AM62PX_IOPAD(0x0014, PIN_INPUT, 0) /* (N25) OSPI0_D2 */
> +			AM62PX_IOPAD(0x0018, PIN_INPUT, 0) /* (M24) OSPI0_D3 */
> +			AM62PX_IOPAD(0x001c, PIN_INPUT, 0) /* (N21) OSPI0_D4 */
> +			AM62PX_IOPAD(0x0020, PIN_INPUT, 0) /* (N22) OSPI0_D5 */
> +			AM62PX_IOPAD(0x0024, PIN_INPUT, 0) /* (P21) OSPI0_D6 */
> +			AM62PX_IOPAD(0x0028, PIN_INPUT, 0) /* (N20) OSPI0_D7 */
> +			AM62PX_IOPAD(0x0008, PIN_INPUT, 0) /* (P22) OSPI0_DQS */
> +		>;
> +		bootph-all;
> +	};
> +
> +	leds_pins_default: leds-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0034, PIN_OUTPUT, 7) /* (L22) OSPI0_CSn2.GPIO0_13 */
> +		>;
> +	};
> +
> +	pmic_irq_pins_default: pmic-irq-default-pins {
> +	       pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x01f4, PIN_INPUT, 7) /* (C23) EXTINTn.GPIO1_31 */
> +	       >;
> +	};
> +};
> +
> +&cpsw3g {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_rgmii1_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&cpsw_port1 {
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&cpsw3g_phy1>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&cpsw3g_mdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mdio0_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +
> +	cpsw3g_phy1: ethernet-phy@1 {

Missing bootph-all for network boot?

> +		reg = <1>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,min-output-impedance;
> +	};
> +};
> +
> +&fss {
> +	bootph-all;
> +};
> +
> +&mcu_pmx0 {
> +	wkup_i2c0_pins_default: wkup-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_MCU_IOPAD(0x04c, PIN_INPUT_PULLUP, 0) /* (A13) WKUP_I2C0_SCL */
> +			AM62PX_MCU_IOPAD(0x050, PIN_INPUT_PULLUP, 0) /* (C11) WKUP_I2C0_SDA */
> +		>;
> +		bootph-all;
> +	};
> +};
> +
> +&ospi0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&ospi0_pins_default>;
> +	status = "okay";
> +
> +	serial_flash: flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0x0>;
> +		spi-tx-bus-width = <8>;
> +		spi-rx-bus-width = <8>;
> +		spi-max-frequency = <25000000>;
> +		vcc-supply = <&vdd_1v8>;

vdd_1v8 is defined in carrier board. Use the som regulator.

> +		cdns,tshsl-ns = <60>;
> +		cdns,tsd2d-ns = <60>;
> +		cdns,tchsh-ns = <60>;
> +		cdns,tslch-ns = <60>;
> +		cdns,read-delay = <0>;
> +		bootph-all;
> +	};
> +};
> +
> +&sdhci0 {
> +	non-removable;
> +	bootph-all;
> +	ti,driver-strength-ohm = <50>;
> +	status = "okay";
> +};
> +
> +&wkup_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wkup_i2c0_pins_default>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	pmic@30 {
> +		compatible = "ti,tps65219";
> +		reg = <0x30>;
> +		buck1-supply = <&vcc_5v0_som>;
> +		buck2-supply = <&vcc_5v0_som>;
> +		buck3-supply = <&vcc_5v0_som>;
> +		ldo1-supply = <&vdd_3v3_som>;
> +		ldo2-supply = <&vdd_1v8_som>;
> +		ldo3-supply = <&vdd_3v3_som>;
> +		ldo4-supply = <&vdd_3v3_som>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_irq_pins_default>;
> +		interrupt-parent = <&main_gpio1>;
> +		interrupts = <31 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +
> +		ti,power-button;

vendor properties comes last.


> +		system-power-controller;
> +
> +		regulators {
> +			vdd_3v3_som: buck1 {
> +				regulator-name = "VDD_3V3_SOM";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdd_1v8_som: buck2 {
> +				regulator-name = "VDD_1V8_SOM";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdd_lpddr4: buck3 {
> +				regulator-name = "VDD_LPDDR4";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vddshv5_sdio: ldo1 {
> +				regulator-name = "VDDSHV5_SDIO";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-allow-bypass;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdd_1v2: ldo2 {
> +				regulator-name = "VDD_1V2";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdd_1v8_phy: ldo3 {
> +				regulator-name = "VDD_1V8_PHY";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			vdda_1v8: ldo4 {
> +				regulator-name = "VDDA_1V8";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +
> +	vdd_core: regulator-vdd-core@40 {
> +		compatible = "ti,tps62873";
> +		reg = <0x40>;
> +		bootph-pre-ram;
> +		regulator-name = "VDD_CORE";
> +		regulator-min-microvolt = <850000>;
> +		regulator-max-microvolt = <850000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c32";
> +		pagesize = <32>;
> +		reg = <0x50>;
> +		vcc-supply = <&vdd_3v3_som>;
> +	};
> +
> +	som_eeprom_opt: eeprom@51 {
> +		compatible = "atmel,24c32";
> +		pagesize = <32>;
> +		reg = <0x51>;
> +		vcc-supply = <&vdd_3v3_som>;
> +	};
> +
> +	i2c_som_rtc: rtc@52 {
> +		compatible = "microcrystal,rv3028";
> +		reg = <0x52>;
> +	};
> +};
> +
> +#include "k3-am62p-ti-ipc-firmware.dtsi"
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts b/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
> new file mode 100644
> index 000000000000..6bc909a6944f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-phyboard-lynx.dts
> @@ -0,0 +1,549 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2026 PHYTEC America LLC
> + * Author: John Ma <jma@phytec.com>
> + *
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "k3-am62p5.dtsi"
> +#include "k3-am62p-phycore-som.dtsi"
> +
> +/ {
> +	compatible = "phytec,am62p5-phyboard-lynx",
> +		     "phytec,am62p-phycore-som", "ti,am62p5";
> +	model = "PHYTEC phyBOARD-Lynx AM62P5";
> +
> +	aliases {
> +		ethernet1 = &cpsw_port2;
> +		mmc1 = &sdhci1;
> +		serial2 = &main_uart0;
> +		serial3 = &main_uart1;
> +		spi1 = &main_spi0;
> +		usb0 = &usb0;
> +		usb1 = &usb1;
> +	};
> +

Can you add a chosen/stdout-path?

> +	can_tc0: can-phy0 {
> +		compatible = "ti,tcan1042";
> +		#phy-cells = <0>;
> +		max-bitrate = <8000000>;
> +		standby-gpios = <&gpio_exp0 7 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	usb0_connector: connector {
> +		compatible ="gpio-usb-b-connector", "usb-c-connector";

Missing space after =

> +		label = "USB-C";
> +		data-role = "dual";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&main_usbc_power_pins_default>;
> +
> +		id-gpios = <&main_gpio1 50 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			usb0_con: endpoint {
> +				remote-endpoint = <&usb0_ep>;
> +			};
> +		};
> +	};
> +
> +	keys {
> +		compatible = "gpio-keys";
> +		autorepeat;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_keys_pins_default>;
> +
> +		key-home {
> +			label = "home";
> +			linux,code = <KEY_HOME>;
> +			gpios = <&main_gpio0 72 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		key-menu {
> +			label = "menu";
> +			linux,code = <KEY_MENU>;
> +			gpios = <&gpio_exp0 11 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		pinctrl-names = "default";
> +	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "phyBOARD-Lynx";
> +		simple-audio-card,format = "dsp_b";
> +		simple-audio-card,bitclock-master = <&sound_master>;
> +		simple-audio-card,frame-master = <&sound_master>;
> +		simple-audio-card,bitclock-inversion;
> +		simple-audio-card,widgets =
> +			"Microphone", "Mic Jack",
> +			"Headphone", "Headphone Jack",
> +			"Line", "Stereo Jack",
> +			"Speaker", "L SPKR",
> +			"Speaker", "R SPKR";
> +		simple-audio-card,routing =
> +			"MIC1RP", "Mic Jack",
> +			"Mic Jack", "MICBIAS",
> +			"Headphone Jack", "HPL",
> +			"Headphone Jack", "HPR",
> +			"MIC1LM", "Stereo Jack",
> +			"MIC1LP", "Stereo Jack",
> +			"L SPKR", "SPL",
> +			"R SPKR", "SPR";
> +		simple-audio-card,cpu {
> +			sound-dai = <&mcasp2>;
> +		};
> +
> +		sound_master: simple-audio-card,codec {
> +			sound-dai = <&audio_codec>;
> +			clocks = <&audio_refclk1>;
> +		};
> +	};
> +
> +	vdd_1v8: regulator-vdd-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_1V8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vdd_3v3: regulator-vdd-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vdd_3v3_aud: regulator-vdd-3v3-aud {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_3V3_AUD";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vdd_3v3_mmc: regulator-vdd-3v3-mmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_3V3_MMC";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vdd_speaker: regulator-vdd-speaker {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VDD_SPEAKER";
> +		regulator-min-microvolt = <5000000>;
> +			regulator-max-microvolt = <5000000>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +	};
> +};
> +
> +&main_pmx0 {
> +	accel_irq_pins_default: accel-irq-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0084, PIN_INPUT, 7) /* (R25) GPMC0_ADVn_ALE.GPIO0_32 */
> +			AM62PX_IOPAD(0x0094, PIN_INPUT, 7) /* (T24) GPMC0_BE1n.GPIO0_36 */
> +		>;
> +	};
> +
> +	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x00a0, PIN_OUTPUT, 1) /* (P24) GPMC0_WPn.AUDIO_EXT_REFCLK1 */
> +		>;
> +	};
> +
> +	gpio_keys_pins_default: gpio-keys-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0128, PIN_INPUT, 7) /* (K25) MMC2_SDWP.GPIO0_72 */
> +		>;
> +	};
> +
> +	main_dpi_pins_default: main-dpi-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0100, PIN_OUTPUT, 0) /* (W20) VOUT0_VSYNC */
> +			AM62PX_IOPAD(0x00f8, PIN_OUTPUT, 0) /* (AC20) VOUT0_HSYNC */
> +			AM62PX_IOPAD(0x0104, PIN_OUTPUT, 0) /* (Y21) VOUT0_PCLK */
> +			AM62PX_IOPAD(0x00fc, PIN_OUTPUT, 0) /* (W21) VOUT0_DE */
> +			AM62PX_IOPAD(0x00b8, PIN_OUTPUT, 0) /* (AE24) VOUT0_DATA0 */
> +			AM62PX_IOPAD(0x00bc, PIN_OUTPUT, 0) /* (W23) VOUT0_DATA1 */
> +			AM62PX_IOPAD(0x00c0, PIN_OUTPUT, 0) /* (AA23) VOUT0_DATA2 */
> +			AM62PX_IOPAD(0x00c4, PIN_OUTPUT, 0) /* (Y23) VOUT0_DATA3 */
> +			AM62PX_IOPAD(0x00c8, PIN_OUTPUT, 0) /* (AB23) VOUT0_DATA4 */
> +			AM62PX_IOPAD(0x00cc, PIN_OUTPUT, 0) /* (AD23) VOUT0_DATA5 */
> +			AM62PX_IOPAD(0x00d0, PIN_OUTPUT, 0) /* (AC23) VOUT0_DATA6 */
> +			AM62PX_IOPAD(0x00d4, PIN_OUTPUT, 0) /* (AE23) VOUT0_DATA7 */
> +			AM62PX_IOPAD(0x00d8, PIN_OUTPUT, 0) /* (AE22) VOUT0_DATA8 */
> +			AM62PX_IOPAD(0x00dc, PIN_OUTPUT, 0) /* (AC22) VOUT0_DATA9 */
> +			AM62PX_IOPAD(0x00e0, PIN_OUTPUT, 0) /* (W22) VOUT0_DATA10 */
> +			AM62PX_IOPAD(0x00e4, PIN_OUTPUT, 0) /* (AE21) VOUT0_DATA11 */
> +			AM62PX_IOPAD(0x00e8, PIN_OUTPUT, 0) /* (AD21) VOUT0_DATA12 */
> +			AM62PX_IOPAD(0x00ec, PIN_OUTPUT, 0) /* (AC21) VOUT0_DATA13 */
> +			AM62PX_IOPAD(0x00f0, PIN_OUTPUT, 0) /* (AA20) VOUT0_DATA14 */
> +			AM62PX_IOPAD(0x00f4, PIN_OUTPUT, 0) /* (Y20) VOUT0_DATA15 */
> +		>;
> +	};
> +
> +	gpio_exp0_int_pins_default: gpio-exp0-int-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0044, PIN_INPUT, 7) /* (U20) GPMC0_AD2.GPIO0_17 */
> +		>;
> +	};
> +
> +	gpio_exp1_int_pins_default: gpio-exp1-int-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0050, PIN_INPUT, 7) /* (T21) GPMC0_AD5.GPIO0_20 */
> +		>;
> +	};
> +
> +	main_i2c0_pins_default: main-i2c0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (B25) I2C0_SCL */
> +			AM62PX_IOPAD(0x01e4, PIN_INPUT_PULLUP, 0) /* (A24) I2C0_SDA */
> +		>;
> +	};
> +
> +	main_i2c1_pins_default: main-i2c1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x01e8, PIN_INPUT_PULLUP, 0) /* (C24) I2C1_SCL */
> +			AM62PX_IOPAD(0x01ec, PIN_INPUT_PULLUP, 0) /* (B24) I2C1_SDA */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_mcan0_pins_default: main-mcan0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x01dc, PIN_INPUT, 0) /* (F20) MCAN0_RX */
> +			AM62PX_IOPAD(0x01d8, PIN_OUTPUT, 0) /* (B23) MCAN0_TX */
> +		>;
> +	};
> +
> +	main_mcasp2_pins_default: main-mcasp2-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0070, PIN_INPUT, 3) /* (AD25) GPMC0_AD13.MCASP2_ACLKX */
> +			AM62PX_IOPAD(0x006c, PIN_INPUT, 3) /* (Y24) GPMC0_AD12.MCASP2_AFSX */
> +			AM62PX_IOPAD(0x0064, PIN_OUTPUT, 3) /* (AA25) GPMC0_AD10.MCASP2_AXR2 */
> +			AM62PX_IOPAD(0x0068, PIN_INPUT, 3) /* (W24) GPMC0_AD11.MCASP2_AXR3 */
> +		>;
> +	};
> +
> +	main_mmc1_pins_default: main-mmc1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x023c, PIN_INPUT_PULLUP, 0) /* (H20) MMC1_CMD */
> +			AM62PX_IOPAD(0x0234, PIN_OUTPUT, 0) /* (J24) MMC1_CLK */
> +			AM62PX_IOPAD(0x0230, PIN_INPUT_PULLUP, 0) /* (H21) MMC1_DAT0 */
> +			AM62PX_IOPAD(0x022c, PIN_INPUT_PULLUP, 0) /* (H23) MMC1_DAT1 */
> +			AM62PX_IOPAD(0x0228, PIN_INPUT_PULLUP, 0) /* (H22) MMC1_DAT2 */
> +			AM62PX_IOPAD(0x0224, PIN_INPUT_PULLUP, 0) /* (H25) MMC1_DAT3 */
> +			AM62PX_IOPAD(0x0240, PIN_INPUT_PULLUP, 0) /* (D23) MMC1_SDCD */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_rgmii2_pins_default: main-rgmii2-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0184, PIN_INPUT, 0) /* (E19) RGMII2_RD0 */
> +			AM62PX_IOPAD(0x0188, PIN_INPUT, 0) /* (E16) RGMII2_RD1 */
> +			AM62PX_IOPAD(0x018c, PIN_INPUT, 0) /* (E17) RGMII2_RD2 */
> +			AM62PX_IOPAD(0x0190, PIN_INPUT, 0) /* (C19) RGMII2_RD3 */
> +			AM62PX_IOPAD(0x0180, PIN_INPUT, 0) /* (D19) RGMII2_RXC */
> +			AM62PX_IOPAD(0x017c, PIN_INPUT, 0) /* (F19) RGMII2_RX_CTL */
> +			AM62PX_IOPAD(0x016c, PIN_INPUT, 0) /* (B19) RGMII2_TD0 */
> +			AM62PX_IOPAD(0x0170, PIN_INPUT, 0) /* (A21) RGMII2_TD1 */
> +			AM62PX_IOPAD(0x0174, PIN_INPUT, 0) /* (D17) RGMII2_TD2 */
> +			AM62PX_IOPAD(0x0178, PIN_INPUT, 0) /* (A19) RGMII2_TD3 */
> +			AM62PX_IOPAD(0x0168, PIN_INPUT, 0) /* (D16) RGMII2_TXC */
> +			AM62PX_IOPAD(0x0164, PIN_INPUT, 0) /* (A20) RGMII2_TX_CTL */
> +		>;
> +		bootph-all;

I dont think we need bootph-all here.

> +	};
> +
> +	main_spi0_pins_default: main-spi0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x01bc, PIN_INPUT, 0) /* (B21) SPI0_CLK */
> +			AM62PX_IOPAD(0x01b4, PIN_OUTPUT, 0) /* (D20) SPI0_CS0 */
> +			AM62PX_IOPAD(0x01c0, PIN_OUTPUT, 0) /* (B20) SPI0_D0 */
> +			AM62PX_IOPAD(0x01c4, PIN_INPUT, 0) /* (C21) SPI0_D1 */
> +		>;
> +	};
> +
> +	main_uart0_pins_default: main-uart0-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x01d0, PIN_INPUT, 0) /* (A23) UART0_CTSn */
> +			AM62PX_IOPAD(0x01d4, PIN_OUTPUT, 0) /* (C22) UART0_RTSn */
> +			AM62PX_IOPAD(0x01c8, PIN_INPUT, 0) /* (A22) UART0_RXD */
> +			AM62PX_IOPAD(0x01cc, PIN_OUTPUT, 0) /* (B22) UART0_TXD */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_uart1_pins_default: main-uart1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x01ac, PIN_INPUT, 2) /* (G23) MCASP0_AFSR.UART1_RXD */
> +			AM62PX_IOPAD(0x01b0, PIN_OUTPUT, 2) /* (G20) MCASP0_ACLKR.UART1_TXD */
> +		>;
> +		bootph-all;
> +	};
> +
> +	main_usb1_pins_default: main-usb1-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0258, PIN_OUTPUT, 0) /* (G21) USB1_DRVVBUS */
> +		>;
> +	};
> +
> +	main_usbc_power_pins_default: main-usbc-power-default-pins {
> +		pinctrl-single,pins = <
> +			AM62PX_IOPAD(0x0254, PIN_INPUT, 7) /* (G22) USB0_DRVVBUS.GPIO1_50 */
> +		>;
> +	};
> +};
> +
> +&audio_refclk1 {
> +	assigned-clock-rates = <25000000>;
> +};
> +
> +&cpsw3g {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_rgmii1_pins_default>, <&main_rgmii2_pins_default>;
> +};
> +
> +&cpsw_port2 {
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&cpsw3g_phy2>;
> +	status = "okay";
> +};
> +
> +&cpsw3g_mdio {
> +	cpsw3g_phy2: ethernet-phy@2 {
> +		reg = <2>;
> +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> +		ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,min-output-impedance;
> +	};
> +};
> +
> +&main_i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c0_pins_default>;
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&main_i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_i2c1_pins_default>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +
> +	audio_codec: audio-codec@18 {
> +		compatible = "ti,tlv320aic3110";
> +		reg = <0x18>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&audio_ext_refclk1_pins_default>;
> +		reset-gpios = <&gpio_exp0 2 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +		ai31xx-micbias-vg = <2>;
> +
> +		HPVDD-supply = <&vdd_3v3_aud>;
> +		SPRVDD-supply = <&vdd_speaker>;
> +		SPLVDD-supply = <&vdd_speaker>;
> +		AVDD-supply = <&vdd_3v3_aud>;
> +		IOVDD-supply = <&vdd_3v3_aud>;
> +		DVDD-supply = <&vdd_1v8>;
> +	};
> +
> +	gpio_exp0: gpio@20 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_exp0_int_pins_default>;
> +		compatible = "ti,tca6416";
> +		reg = <0x20>;
> +		vcc-supply = <&vdd_3v3>;
> +		interrupt-parent = <&main_gpio0>;
> +		interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		gpio-line-names = "HDMI_RESETn", "ETH1_RESETn",
> +				   "AUDIO_RESETn", "USB_HUB_EN",
> +				   "DSI0_TP_RST", "USB_HUB_GLOBAL_RSTz",
> +				   "LVDS_BKLT_EN", "CAN0_nEN",
> +				   "WL_HOST_WAKE", "BT_HOST_WAKE",
> +				   "USER_LED2", "USER_BUT2",
> +				   "UART1_nSHDN", "UART1_MODE_SEL",
> +				   "DE485_F232", "UART1_LB";
> +
> +		bootph-all;
> +
> +		p0-hog {
> +			/* P0 - HDMI_RESETn */
> +			gpio-hog;
> +			gpios = <0 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +		};
> +
> +		p1-hog {
> +			/* P1 - ETH1_RESETn */
> +			gpio-hog;
> +			gpios = <1 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +		};
> +
> +		p5-hog {
> +			/* P5 - USB_HUB_GLOBAL_RSTz */
> +			gpio-hog;
> +			gpios = <5 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +		};
> +	};
> +
> +	gpio_exp1: gpio@21 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_exp1_int_pins_default>;
> +		compatible = "ti,tca6416";
> +		reg = <0x21>;
> +		vcc-supply = <&vdd_3v3>;
> +		interrupt-parent = <&main_gpio0>;
> +		interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		gpio-line-names = "CSI0_OE", "CSI0_SHUTTER",
> +				   "CSI0_TRIGGER", "CSI0_STROBE",
> +				   "DSI_LED_COMM", "MCU_LIGHT_INTn",
> +				   "MCU_TEMP_INTn", "M2_BT_DEV_WAKE",
> +				   "AUDIO_GPIO", "nFAN_OUT",
> +				   "", "",
> +				   "", "",
> +				   "", "";
> +
> +		bootph-all;
> +	};
> +
> +	eeprom@51 {
> +		compatible = "atmel,24c32";
> +		reg = <0x51>;
> +		pagesize = <32>;
> +		vcc-supply = <&vdd_3v3>;
> +	};
> +};
> +
> +&main_mcan0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mcan0_pins_default>;
> +	phys = <&can_tc0>;
> +	status = "okay";
> +};
> +
> +&main_spi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_spi0_pins_default>;
> +	ti,pindir-d0-out-d1-in;
> +	status = "okay";
> +
> +	accelerometer@0 {
> +		compatible = "adi,adxl345";
> +		reg = <0>;
> +		interrupt-parent = <&main_gpio0>;
> +		interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&accel_irq_pins_default>;
> +		spi-cpha;
> +		spi-cpol;
> +		spi-max-frequency = <5000000>;
> +	};
> +};
> +
> +&main_uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_uart0_pins_default>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&main_uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_uart1_pins_default>;
> +	status = "okay";

status comes last.

Regards,
Wadim

> +	bootph-all;
> +};
> +
> +&mcasp2 {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mcasp2_pins_default>;
> +
> +	op-mode = <0>;          /* MCASP_IIS_MODE */
> +	tdm-slots = <2>;
> +
> +	serial-dir = <  /* 0: INACTIVE, 1: TX, 2: RX */
> +	       0 0 1 2
> +	       0 0 0 0
> +	       0 0 0 0
> +	       0 0 0 0
> +	>;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	vmmc-supply = <&vdd_3v3_mmc>;
> +	vqmmc-supply = <&vddshv5_sdio>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_mmc1_pins_default>;
> +	disable-wp;
> +	no-1-8-v;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&usbss0 {
> +	ti,vbus-divider;
> +	bootph-pre-ram;
> +	status = "okay";
> +};
> +
> +&usb0 {
> +	dr_mode = "otg";
> +	usb-role-switch;
> +	maximum-speed = "high-speed";
> +
> +	port {
> +		usb0_ep: endpoint {
> +			remote-endpoint = <&usb0_con>;
> +		};
> +	};
> +};
> +
> +/* Required for USB DFU Boot */
> +&usb0_phy_ctrl {
> +	bootph-pre-ram;
> +};
> +
> +&usbss1 {
> +	ti,vbus-divider;
> +	status = "okay";
> +};
> +
> +&usb1 {
> +	dr_mode = "host";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&main_usb1_pins_default>;
> +};


