Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C3CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HwZCR7CXSepUsMbY+93SJP1bjRl8zYzozj1KBBR75A=; b=cPgvoV5AaTGfSC1+0rwFlk1uIf
	nn/28qAuxVk/mYaoGStxPgTEHfkzPjrKov6ABH6bA1zrpUVEhx/5kXs47ampk2cb57lO6OaVxLZzZ
	8fWhMFowgsFuICRmKH829UxZtYNuYA9G/uNCySJ3jOhsW+uxLxio2Pqnmmm1NcappVD/QQrRA/abA
	/WF5L+6NilQP0mF4O/SwN9QIVJrLPzX25Vieuvvl08DcoO/FGeSO4RpM5Xceicp/bnhAJ47YQzp1D
	AVsITBt6ftdrdf898NCuT8D3eIcM17Cis3AUaQX4LpWsXSTEpQ2N0sJxrE4FeUEuUosYlvDydYCM/
	8JbZoCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXW3W-00000008c3a-4BIx;
	Thu, 11 Jun 2026 03:26:11 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXW3U-00000008c3H-45B0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDo8Y1ybmcEIwE5F5G7s2O9c/YZY+EVsbC3U4Xqvuey3pHBX99QfI3S7aQlM9oZZr3gm1uzfcA2Vir0RSe4nWXnobna+lIbW0En1Sy+dm6JdOkLt7AIFrc03t07t4lKqThDJYmq58EYfgebP1lNH2iK1qdHOyorK7fFf4emUuUhF33Q7Rgim7c2jFqPG/wA79+uoTZLbC8H/f0zbQg2v2cl0PIM4dJHgioqj5ehh96VaR4l8wdCxrIbNwjHzca98CpFtp0byQIQwv143oDZsFqNgNkiYbJiLSRHrpVaeZJcIq8gTGYVECmzTdGkhqvBgq11yTvcFi1ozgzXHgB2X0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HwZCR7CXSepUsMbY+93SJP1bjRl8zYzozj1KBBR75A=;
 b=Yh9P23sFxGRFHSQaAqSFj722KdETkPgvXQRq5YFRVV56HBDIui9JvIF3KukGTax1Rr94bg59KIrSoupnH+dh6Gv14rYw9uAW2IISmT5yG25/xXwJPXOxM5Bv957EHP+OeOO2tuCWfKUidhdSl7Efq0SQz5N4UzEHPGsJ5oGXzvnChRCWp032rHuYFC7bX+PMZyKyiebNVf/ZyCUFLk1kWvxH9aeeXWjSCiWOYEMdElEZAO6iN9TUEhvVtvCtESWeI50tzesbm/YuH4ods7tw1AWvsRvxjBJXJXAzmJy7M3F6FCPwt0ZJ4Lg4MbzhOwwgXlN6rY3xiy72JGV6tYq6LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bst.ai; dmarc=pass action=none header.from=bst.ai; dkim=pass
 header.d=bst.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blacksesame.onmicrosoft.com; s=selector2-blacksesame-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HwZCR7CXSepUsMbY+93SJP1bjRl8zYzozj1KBBR75A=;
 b=RHvx8087w0XN0TM/H/KHj8+tDq5QFsZVNX461MxIGOkRgp7MqXIe5YDrWgZAwEEdXDkUbD0MtlqelmITHiDDdHezGSu6BVkWysm8bqcIvXWqBcy/t3NMWsx0lOqiTjIWxwS6LatQacAVLG9gsCo51Vz1p04dvz1BrBP1kI0vPkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bst.ai;
Received: from CO6PR18MB4434.namprd18.prod.outlook.com (2603:10b6:5:35d::16)
 by SN7PR18MB4096.namprd18.prod.outlook.com (2603:10b6:806:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Thu, 11 Jun
 2026 03:26:01 +0000
Received: from CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885]) by CO6PR18MB4434.namprd18.prod.outlook.com
 ([fe80::66c:c77f:192a:f885%7]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 03:26:00 +0000
From: gordon.ge@bst.ai
To: soc@lists.linux.dev
Cc: arnd@arndb.de,yangzh0906@thundersoft.com,linux-arm-kernel@lists.infradead.org,bst-upstream@bstai.top
Subject: [GIT PULL]arm64: BST C1200 eMMC defconfig for v7.2
Message-ID: 20260611.112340-gordon.ge@bst.ai
In-Reply-To: 
References: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 03:25:59 +0000
X-ClientProxiedBy: SI3PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::6) To CO6PR18MB4434.namprd18.prod.outlook.com
 (2603:10b6:5:35d::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4434:EE_|SN7PR18MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: dd5b9c64-34c7-4cbd-279e-08dec7692912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Gyj2Z7OOqN2lqvwFsM8zKDVcrukt0jGfz0LIQB6SaPxuSV12Udh5djdUNJsjB0MJiyc0tUlS9u/4A5M0rBZB4C70BSaPRhzkQp6ftiUO7Wn0y4narStt4QkJFYEsCpMsYj+HTeAcOkqIfKacOgJeI0CpXQZ2Gpl6/YFobDYkAybftCsXVDZ4CTGxTbQqd3xmogAGcKj4HXQeQvEedxx50DevaXCWjRMQCHpaPn1uCDjvrVVmIiqDkAUR/wQq2OF4lvHsOT45XPHchvVoLB8tphmcfu9H+iwD6vDKbMTtl1/0gUTHmpp/mI3pzj+oRne4nWpzpV2SwTMYxT5a/hE9HaOjehWIMem+aDLfT0pDrhX6gemE+qidEdVw4ySULo0EiKBeIcHm7ocnEFbPSqps8+OmWpdFQW6ysI6cM5cm4JJqVQsH0nDX9LY2BchhMwyAXo+LLiVDgquGHza9zB7D794DKdr+xtzNQcUXVNPGM8UXMeR4ZHExYimM6sLrFS7CcjvifANJTrq6cYhs0+sGvy6zBaKQIouzA4J6SodMpSyoPX+DIfgKXWJB4NZP/f3jSq4/DifdaaDVumh0nf2wQpAYj4AXTCLPckaxpZHlSu1mCVrx24tRA3R+m0FBJ31JLeG3T4Rtw4F6Y4Amj4OEr3g1lsy7s60rcd2stzvSObuj/9S8tUIQFGqfRpc1nrJ7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4434.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VG5yUldMcVVCSE5LRXU1bXRlcnE3ekI0QlFrcmxQR0xtQVZaUlNGSklpTzJp?=
 =?utf-8?B?ZFllUWFGVzREZUE5M25rQ0h6ZGRNcnNFT3pmKzBsRFErV1pEdklwdGQxQkxo?=
 =?utf-8?B?MXVFWmVOVDhXUWNTZjkxQTc4Wjc3a2NoTTVQRzJjbXB0dlZ6L2NFaW9aYjN4?=
 =?utf-8?B?dnMxci9MNzVJRVBnbDVZaS9nNEdFWlRiNExFL1BWdEVXV3BaR1JwbHRpYlZU?=
 =?utf-8?B?TGlMYisxRVV0NGZxQW1TRzh4U21MaVphL29Lc3BTMlZ0Q1dpb0cxU0cyZnAx?=
 =?utf-8?B?aW51dWwzVkVXbElwOGw0THhwUExwSDJpUDVTTWt4Q2xmTlpRdEh4d0I2YUpO?=
 =?utf-8?B?R2xlUThRcHZXNnQ2MFhCUXRKOGNkckkwT3BIdXhGbmpmYktTMVRIL3NFNjNF?=
 =?utf-8?B?ZUdBVzIyVitTRUF1WEhpMkp5NW1DR0gwWktsejk0V0E5dXUxVHJWcmhqQjVG?=
 =?utf-8?B?azh0ZGw5cGVnNXFnd2ExZ1NWRGxqVTBqUldpR0VSV2RGRTNLbnlYSFJ5Q0cw?=
 =?utf-8?B?VDVleDYvK3dETFRKOGVWTWFHU216YUZTL0hJWjR3aXRFTVg0a3pZQTdxWXZ6?=
 =?utf-8?B?TDd5V0kxb1hmaGVYLzVvNTV3SEJlbTEwNStHVytTdHF3a0pWNnhPbVlDMDFT?=
 =?utf-8?B?bVdGT2hONm42Vi80RWRaL205NVIrb2lEZUZ3eHIycnZiUEZySDNNWDc5d2hM?=
 =?utf-8?B?MG9BY01FTmZzbGswVmdkemlPQmNqQTV5TWUreHRpNjZrcmlyNWQ0RElydFpI?=
 =?utf-8?B?cTk0MnZvdVFIVDAydXY4N3NZczJjM29Pbi9WTDVNY3l1UnVSTmQ3a1ByOVpG?=
 =?utf-8?B?QTg1Y2NLZlU3NXNQY1dEeUt2dDg1VkVCbG1WdVQ1Mm0yUThnVllBeFZCVFNv?=
 =?utf-8?B?RDVUMEZUdGd5cjhTeU5nMVp6akRINnMyLzY1U3FLNy9SVDdVc1R6SWc4ZFg0?=
 =?utf-8?B?aUxGV3dCTG9TNzJEZUNEUUV3Y0tpb1RGaHg4VGFLL1A5SnAvWE81UHhFWmNu?=
 =?utf-8?B?L2U3aDJiV3JzTzVzSkNvRmx4dW1uTk50S0dHbFhpVDVBNmxtWENBU1ZkUEVM?=
 =?utf-8?B?d0F5Tmd6UC9mWTRVaDdhajhtZmlSSWk5UDNyMHQyeWdrOXV6bDMwbUs2eUs2?=
 =?utf-8?B?aFI1NzZyM3phRTVtVG5saFdyaHJqNmJwRFR3UnZyTVpMbDdTejRhZS9vclpa?=
 =?utf-8?B?QVZ2ZXhzZmlZQ002cGhPQ1hJMmJBbkpsVmdNUjhJNGdzMlNjcFRTNUhUK3Yv?=
 =?utf-8?B?Yitua2hSUGxPditGRkpncnY0VVNHemNJZUYyTnphbUJ4ZTdHYWpJanZaa2xE?=
 =?utf-8?B?dXU2ZjAxd0dBZkVXbWRVOFpDWTZER3kwc0pvY3owdE5CaCtwcEVxUjh3TUZv?=
 =?utf-8?B?VU5mbjFrbENWQlQ0WEUwd09pa3p3TW00VW1aVituT1YvOGROZ3NWRmZDQ1Fa?=
 =?utf-8?B?cXNKTUl5WEUrUGhYdjMwMjVzNUVEWk4vTTF5Y0NnZGlveDFLbTljbFFlWlpI?=
 =?utf-8?B?QXIxU1J2MDJJSGtpK3BZQnhMMHl6d3FCcmxBcGtnVzBoanQ2R3JSeTRxUkZl?=
 =?utf-8?B?aVgycEFveVZUUWJ0SVdGZTVvdUk1cHU3Y3o5a3BqbHJJZjVhRVorOUFEaHUr?=
 =?utf-8?B?U09xNzRobURUUmM1eVlUM0Q2Nm1lbTVVOHhtWVNYTDhOaG91MWtqTTBPNEV1?=
 =?utf-8?B?RVRad1FEQ0ZuNWwxMDNsS05lOWFBZTU3SHpqZFQ1bzk4N0RmWkVBdFluZjVN?=
 =?utf-8?B?QlMxSFRmdENMRXJkSUw2aTFGRTh3YU95SXYrZ0M5OHhqRkZUZzN6V0lCa3ht?=
 =?utf-8?B?Zkd0Wit1dXV3dkRncUl6ZWM0OTN0WXFqWXZnOXhuTnlJRHMyR3BxVDkvbzBK?=
 =?utf-8?B?cjh3Z3F2UmUrVnY5M3cwMENlRHpsZnFnK0hKaU9QOGo2NThxQXRrYU9iWlVP?=
 =?utf-8?B?c0FxZ2JPbStnNEZUU0pBMk9la3UrT1ZVbVVZeCtyUEpvd0gzMmc2bTAwZVdD?=
 =?utf-8?B?aEdjT1NIZUVxcUJhMWRETmxEVDRWTy9YSE1GNllMOWkrTEpQRG1wYUdxUVhN?=
 =?utf-8?B?UUxRRTMwUEhRWFBBWHJMRzNSa1d0amUvT1FuMGtzZ0x2UitGS3ZudDZ4eEtw?=
 =?utf-8?B?SmFucXRWME5oYWhLNHJaampyZ1hNWG5DcjdRa3JjV1RuSzhxTU1iZ2NDM2xQ?=
 =?utf-8?B?WEVuR1BKSWRxdTNxd1V3M0tyTHVmaEVRTHRvRUcyQnpsYVNsQVFndytMZ0tJ?=
 =?utf-8?B?eVErek53ZDMzMlZTb0xxOEhpRTl0QUJFSzNFNm4rSGpFUnlndGJ6K0kyUVkr?=
 =?utf-8?Q?Ps4XYBFAs6S0lrF1cB?=
X-OriginatorOrg: bst.ai
X-MS-Exchange-CrossTenant-Network-Message-Id: dd5b9c64-34c7-4cbd-279e-08dec7692912
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4434.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 03:26:00.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00dc1a43-b766-4686-8706-33adb3b74360
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNJ1/aBTekB1sB2oNw8ryCqo03CYJmuHj5xJHmmZmzVGiI3TWi6j33Kud09zHMTB608fapVNotfPJSVVW9bvCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR18MB4096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_202609_019498_8BD204A7 
X-CRM114-Status: UNSURE (   6.42  )
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

Hi Arnd:

Thank you for the review.
I have fixed the two issues you mentioned and updated the pull request.

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git@github.com:BlackSesame-SoC/linux.git tags/bst-arm64-emmc-defconfig-fo=
r-v7.2

for you to fetch changes up to 6e2453ddd971f598290da40a0bcc8cf5c11f50c7:

  Enable CONFIG_MMC_SDHCI_BST to support eMMC on Black Sesame Technologies =
C1200 boards. (2026-06-11 10:42:11 +0800)

----------------------------------------------------------------
arm64: BST C1200 eMMC defconfig for v7.2

Black Sesame Technologies:

Enable eMMC controller on BST C1200 CDCU1.0 board:
   - Enable CONFIG_MMC_SDHCI_BST=3Dy in arm64 defconfig

The MMC driver was merged via mmc-next in v7.1-rc1.
This is the remaining defconfig piece.

Signed-off-by: Gordon Ge <gordon.ge@bst.ai>

----------------------------------------------------------------
Gordon Ge (1):
      Enable CONFIG_MMC_SDHCI_BST to support eMMC on Black Sesame Technolog=
ies C1200 boards.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

