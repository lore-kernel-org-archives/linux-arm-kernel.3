Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE5BE9B356
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wb04UDTugsq30zQHJoUggufCY/5X4aWyloPYSd0xPeU=; b=gBibpB5G2F+Ayp6K6Kz8SNa+Xl
	QeLdc5eL9MYIHpzzHOV9nrds5BHQUTK64y1T2fY8lLNkIgbpKwCLXXzym69qGOiaJftCZbi5l7D7T
	AteyeoUMOR8Cz6yM9j2qwoltlFsRz0gsLXpD2es/rUiFURWPUkuLOUo8/7aKzysuHALlHDnC/lY0T
	lgSweo7PHewUNPxoUGbfGunq+8b2AiAD6kMXbKbso+TlJf7iVfwzbrPPen+3FM1kVlV5WgmqSJYW1
	4VJGPxOuRHhnWcbkmlS7wMRi05upfpbqWzxUIl3NKLcKOryZ3ufGC7iedCTLA/NXW5mfX8KFke2JR
	2ZmthELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0Ui-0000000Chba-2uAY;
	Mon, 02 Mar 2026 10:27:20 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0Ug-0000000ChbA-33Gw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhPUJZwajYf6SFXGopFh38fh6ia6wADGIwAhCiBePpN+TfF29oNl5aQmHeJByKPYu3rvcquy58LDoeTNvr63XhEn1H4GQjpYOsgL7xAlc+T3FMFHrn6PkbSXmWx40rTd4HlTH6jkPfd3y/GJV7xQALWE4B4JLqLaxzRYZnJKrP0vi+puzgkLjWFbsC7IJ4zSnHFZiolsZTeLoZHAWRLEjvIDN1Ri0m5t5W6LukEp3GlfaX2IZfy/nlViaBdMRRYYHTs5G9RQkDHnkXyXWlP94NxHaPVeJRFEoTPQh62YFr/nZ1LiZ0206dRPne28yyKc9RLRwMKJLiKOhjVFzTvx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb04UDTugsq30zQHJoUggufCY/5X4aWyloPYSd0xPeU=;
 b=B5s9skztztmEQbw1J97q3i3e8rn/KwBX56bJPvMnGs95ynHYra2O0Se2o6iliRBlsDveY/zv0hXACz4HorxDgmKMbkhzpHc0Wg1ofmwVu+owzsquLBA/lje2FKf0FEo5Q5b7Rgx88VUZNHTAnyrm3SEo4/QlsTmic7fpr7oicK8RAQ8BdYxXDHZDNDTurv9wKV+senvb0VOzjivDmxJsDgjyw7Ou96EjO2MA8Zx7vFLzQDC92WsIoQqq9TuzP4H0SaRIa6XQsQKOVAfIO2Uv/VmUlO9V/yOcoXz/fHl6C5o6QVXJZOEXhPccHrNnpZfLjHBNYlSuIEnbzZPw7onWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb04UDTugsq30zQHJoUggufCY/5X4aWyloPYSd0xPeU=;
 b=dB9dTVx0vzsUhYg+7uNZ1HD1tMuwNQELGbYaCVWqimFrJeP4Are6At+ZK1fIjN19/rzAjoHHGz/HbLLeBrn33Vx705J4mlRlKkkVVOKCAwKOhIVCvPU3ljLHDy8leWEc4MNh/oXMxBOTbsged65sdOu7i/nXP2bZiXpX7IfdXjMFYN/TGMfI43xntdw6JTXgx3/CjHPu+0c8h0koMuh+3PJQr6fInZlvop2tQe1QPvJ73jE1PMs5g2W7+1gnM++TTZMeWKkifkPzeL7P1D8hakxWGu7K7qSWePr2SnX6CfeP2EqA/Z7PHJOa+GKHpExbf4zPlQf/Xmr4bp09xZnSUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU2PR04MB8632.eurprd04.prod.outlook.com (2603:10a6:10:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 10:27:12 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 10:27:12 +0000
Message-ID: <6f7fa663-3994-4b09-b9e8-a11e9ccc19a7@oss.nxp.com>
Date: Mon, 2 Mar 2026 12:30:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] arm64: dts: imx8mp-frdm: Use symbolic macros for
 IOMUXC_SW_PAD_CTL_PAD
To: Frank Li <Frank.li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 maudspierings@gocontroll.com
References: <20260227130242.1702329-1-daniel.baluta@nxp.com>
 <20260227130242.1702329-3-daniel.baluta@nxp.com>
 <aaGzj11fjemaKLrQ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <aaGzj11fjemaKLrQ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR10CA0028.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::13) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU2PR04MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: 773ddd8f-6d21-4f14-b4a0-08de78464427
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: cr1iYVKdSedLDhv78VP/1gtXjURGXGENOWgvkjXZ+TbfW69hJ9uazwjF7k/tZh0536ORRA4yxZJ5tiT5kwbHZ1T7wCnH44eZ728PxMe3Z5+y7Ew8DBglM9QaHlUeEy3eL2g7TLb8vcXGofZvNn3XI243cszHVJxZUuxqinqHwT2QMJinQdA3CNKxlij53LxF9tK1GB2Oy5PXw88Yhsi4nAs0RIDZgGc3p2I8riBcc8G4laNWyuzEXnPnuTGSdw5XfMep0aB0p4Xtw34nAbrqTdcPbqfeuMFUM5Jf4SCUXPI4Fy5H77+7L1XDG4tXTREA3KU29L2oeHC6EUflqS5Is2xMOJYwDM6tbJRp2TPd7ROGIjiizer8+b6H5PGIr3ADAqbM2PlwEw4WcKMJ2MJQ6SPba9MuiDtAOKYIRoUpN2I28kPELVLPRk/ySYklZKsVl5FDn4QGhRnfUzwWdsgsB8LacnfAg9YwdszraXV5iLVcawT3ec3/YFme6CdonApFLUnrYyE13sfeduxzI3gEvYs9E6WKyHgx7r7mjN9n+NvDSr0vnp6ZxUjTYFdjhDBMVkBdj7anndCMSjxMY/WIUyBjHMLawKKACbZ/Do3DqgapoQ8qZY4wGTAfL37A5DLtRz9Dyi/le2Dq5vhpsiVsoLYwJerWjX58kOuptaCvV9DX3B9zaKNbeJqrp4GYrhMZdjOfrCEkLjrIgDZE3inkJVzK3KC2D902o0arHbCOyBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXcwbkcxZUkxbkpaU0YrUGxZS0JCMWVaWkZVanQ5d3Y3V0x3cjlpbks3ejJv?=
 =?utf-8?B?SGlWd1lhZzhYVHcyOHMwUGlVVkhpQnZqOUNZN1NqSVpBbnVLbzV4VUdvdUU5?=
 =?utf-8?B?MzBORlJIQm54bU1Ud1RtS2xzK0UyMFFwWmRaWDFQbStCeFRjRUExa29rOHRQ?=
 =?utf-8?B?NGtyaTYrbFpnNU9nZUNkNld0ZU9RdVpLZ0xaWGdLOGR5WkxYWXFjUXFENzZ4?=
 =?utf-8?B?YWlzMlBDNE1NZHdzaldRaVMwMjFVUW41RGxVQ2d3UUJPZkhFTzF6WlVmUFJy?=
 =?utf-8?B?WG0xaFYxRjNLMGw5SlhIMldSM01BK0pvbmhtbTJCUk92Nzdxem1NZDlvMmRX?=
 =?utf-8?B?OFpxNmF5eml4cXdvZ0tqRXlHMTdldkhZN2Z5dDd1MnZNM1dpSWFWZEZPbTFj?=
 =?utf-8?B?OVcrQ05wUjB4bU1lbmRYajNZMkFsaWNldUtIZ0xwZHhDd2ovdjBKeExVWGhU?=
 =?utf-8?B?T283ZlRQL2xmcXRML2VZL2xhL3JkZDVvQitZK1Q1MU1ybHJ0Y3FVK3VGWmJm?=
 =?utf-8?B?dWRMOXF5c0dxSWs3OVNwZUpIVnJsYy9JNlhlcFdPck8ra25jMWtpSFpUWnpE?=
 =?utf-8?B?KzYrY1lyTGNnekw1LzdHdFdCUlovUi83OUJlRHRSZ0RVWXFZNnVaRG4zdHdU?=
 =?utf-8?B?cjlCV3oxT1RRMGhDUUpQK2Y0MlZRQkpIZHVIci9vRXhGTTNVQlg4RVVWb0ox?=
 =?utf-8?B?MzFNYmdhL3RmbklzNkhkbnpFMHR5bHd4R2hyMTIxVnpPdjNIM1FlQTFwMzl5?=
 =?utf-8?B?WUZuWExqaC9OYjVxR0w3cG9kTEgxNytaWjB6TG1pa3N5SEFxMjhiaVUzL2wx?=
 =?utf-8?B?b0llWnhKbWRQR3dacDc2bk1ab1g5emdtM2ZuTmlWQlJHSjhKMm1EaDhGcERl?=
 =?utf-8?B?dk9TSVQ3RkQvZU5DSDhMb05JbXVXTWN5TWVmRFdVVW5mUEw5L2RyZ2paQVlH?=
 =?utf-8?B?amlyYmduNnNGcm5kVFRCdEFhNzZpWUp6SThNWHdGQzloYVdZcWliZkpLME5Q?=
 =?utf-8?B?ZXdTOUtCaTlhS1F2bXRpNUNITjR2a3VOVFNldzVXWHM4Y1JmM1VMUEIwMXYy?=
 =?utf-8?B?MVFySis1K1FGYmdrMjc4WFh0akFUWkpYTlJzZ3V4UWJ4ay9rWDJEbWdVWWxt?=
 =?utf-8?B?ck1mTlBSN09odlJXL1dkVTYwZUYxUUM4YUx4ZzJpMExmYnJEUDJKUjNRdU9U?=
 =?utf-8?B?bHN0RVp5WncwM1FUbllhc21yeFNBOUVLYll1QWVFTmVMY0l6dXEwdC94S3Zq?=
 =?utf-8?B?M1RDZGgwRmxqQkl0S0xhdXMwN000V1A2bEFFZjZiZEo3Qmg0SG9DeW45ZEo2?=
 =?utf-8?B?SWd5VHNISGw0eTNVUTVoTGl5eWR3VlNieTVCM1FhWWxmOHNqSFFrRjdGQjhn?=
 =?utf-8?B?ZmZXR1QvVWxUT3c5T2x0dVdMRXZFSVJXU20vc3FoYmpsbGhMR3R6Q092UHNv?=
 =?utf-8?B?bXE1RTBkVk5SajRnZCtGR25vM2R1L1p0bExPRHRDZlJNbm10QXNOSGhDdGJv?=
 =?utf-8?B?NlJIcG9ldDY4aDRPNUEzaFpBNFU4Qm56cmQ5eDFaZTQyTnBvNTBvWlZPWVJ2?=
 =?utf-8?B?QTUxQ1ZlWnIyd25zRlVVMUFWZzA1NXBoVmdSbFovalA0bzhkc3NJZVBjZVJt?=
 =?utf-8?B?L1RGT3pOYVFFZm93YnJoN200d0NFWkpWZEJ3VlNBTTlkVU16MkZ4YlAzUUdo?=
 =?utf-8?B?SEQyWHk2M0VCeit0TStyRkF5K01aeTMrblBhb3FnZGh0WDV6WnZFRC9hK3hS?=
 =?utf-8?B?dTBjdUk3dEFjdkR5d1pRck1Ic2ZLRDd5bkNkaE9OSXZiYU95RGtaMU5GdXov?=
 =?utf-8?B?MC9EN3VQdEs2L3luTW5xY0Z6bTFnQ08zR1A5S1dXc08rOTBYNUZ0QmZWMkxG?=
 =?utf-8?B?b0wrbHU2MDN1MUJTbU5ZWDF2NDJOc0VxMUpyYjhRTnNTS09kOUt6Sy9WNFJl?=
 =?utf-8?B?TkNzOVRldHlPN3o2TEFoVHBRK01kRGs5NjZEYWNVNThZTGNEb1dKa1cvenRN?=
 =?utf-8?B?VDhKRmFmYVQ1ZFhoczNpMWoxeDlZRUx4UThqSkFWZzNrWEg0c3h1UGhkMU4x?=
 =?utf-8?B?YUpjaklPdjdpSVpCQTJTN0s2VTdpTzZ2djhjMTBzdVBVTW8wOFlXZ2lPU2Zp?=
 =?utf-8?B?b29oNEJWbEpESmloWW16Q3FETkhVT2tSTE5ZRDNKYjh0RUV6Mm42dTFOaHAy?=
 =?utf-8?B?NW1mZkdHMlNCTEVFQ1owRGFqcFBKM3ZDMjhvMEFKckM2T1ZJZ3k5QlNCSlRL?=
 =?utf-8?B?a1NZVWtpalJyMS9YOTZuS1N6NDRNRG5BdE9sZlBtcVIwNWRRYUlNbnEyNG1B?=
 =?utf-8?B?RVh3ZFAyMkpLQVVhR0MvRnJMMVFKcWJCak5qOFV4NERCMm14eHdkZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 773ddd8f-6d21-4f14-b4a0-08de78464427
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:27:12.2222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vi0+euBLd68rbIvATylhcvLiZDGXKoVfdvE+oRv3OUpw0OyerZhR77/KKT3Nx9LXdN1lraiKTy8iCALznwcJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022718_767910_82756280 
X-CRM114-Status: GOOD (  12.05  )
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

On 2/27/26 17:09, Frank Li wrote:
> On Fri, Feb 27, 2026 at 03:02:42PM +0200, Daniel Baluta wrote:
>> Currently, in order to configure IOMUXC_SW_PAD_CTL_PAD a magic raw value
>> is written in this register. This makes code not obvious to read and
>> modify.
>>
>> So, to help with code readability instead of the magic values use
>> symbolic macros.
> Use symbolic macros instead of the magic values to improve code readability.


Will fix in v2. 

[..]

> +#define MX8MP_NAND_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
> +				 MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
>
> It is not NAND, should be
> 	MX8MP_USDHC_DATA_DEFAULT
>
True. Will fix in v2. 

Thanks Frank and Maud.

