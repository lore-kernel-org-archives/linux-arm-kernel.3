Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FCEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScD54QhFAL4dcMaCxcJ6tG7bQegQHxlFO2l6APiWipg=; b=kJXAa27qEfUKepnIpmIRxi8fMB
	4ARGss/MonHJP1AWdREdYERIqDL9MXFCFHg21IDYgJUNnm9PNCQ/M8Wl/dycsusl67+5OxrZ48Yk0
	napbEnU8sdvxLH5KxA4hEnCtr7S6A8IhU0qrPuqrSJ1aulgw+xqZ4tDOJgiWF4xe5hj0n0aX56lsU
	dHL2eBth+eB6Ne0PPvzBTMaZi580mrAv2v4l/7/U2pTcsfM4eIHKGyWLIdHhRlF4hZzZ5IeMYvwHD
	3s1z0MC+/ndskQCXd4X4o86BOVNlIr+WAON7qmpf7aAo47CKhkea1zwLceEXBfQhGxPXq6N32Y8YM
	zjQmkcrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJHA-0000000FUIv-0yTu;
	Mon, 29 Jun 2026 21:12:20 +0000
Received: from mail-westeuropeazon11013058.outbound.protection.outlook.com ([52.101.72.58] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weJH8-0000000FUIZ-0BjJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 21:12:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3XYInR8TlnHzHZYzgfecVPvP7DEtWjnmfLzhtUkmpfdKg9SXpHdJ3TEh46I2yZLGdvkhM6XvtLIhA0mAl/77ZRp9t+T7CsjAi4lXfQ+TCB/HcCAbZ7qDv+LJEhsdYOhwJZIM7kbJvUoEq0rlFydq+zyjiXw1QDRlWyImnGE16Z060qyCe2pbxEJIx/RBTYGhBU2uU1D0yF4cBH3SJnCIfa78y7uHUXSW8B7g+HrX+YQtRv1SGbvG/4HAacMQPe3XWcULHy4wT99RzudABY1U2mhd1fE0nq343afx8ByvREpDOhN/qP3xw/96HHVfEDZcH5H4sb9yMtGvQFaQKy5Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScD54QhFAL4dcMaCxcJ6tG7bQegQHxlFO2l6APiWipg=;
 b=kOkt4nHf4jC6zBoUbx/WSnGMDI6kp/HYyRVp4lrpwkEUC7HWSkMFhMiVh3TqFN/5Z9KfhF2COiZ2+Ak25/IXu1fRYJcosDf1E0JIW3M2SwZqMenaDu7spipe+Fn2r4VZDZltDNKDh6egyJjdMwjUHqOs8km5Ez+o3sV1//89NhmTgSZ/UvcIi1Rma8ZMB0jqsO7Zx9QHU/ll4AYvmkuCEJQVseaEnR3HFqXHnc2W/b868Z3mjPXHCCySYt4rKuqCOnyMLy5Qc7/GM0Ekn7pDVJ0F7rJF3LrflK3K8GCMR9SYxhXQiYG1pnQIQp/6zfik3nAOdtEtL/HcFMJjZBjo0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScD54QhFAL4dcMaCxcJ6tG7bQegQHxlFO2l6APiWipg=;
 b=HnBA5LEtUxojghtkN0OM2TkTzY8d+2rePiAKFGS4jUtwthr0/brTggrlJMKUgRp8ZUYDdGsX+n2W5V2uOkRU9gSYRrsxkHrvSYdyAYL+YloTXzRAzeCoDrkqtsnSgaYESkovboQrpZlRWtDDndJDvenM7P4T9LT2VNnHZTn2SigPnKs0+xH+W98M0OwhqOzlm2W3vO1l6M6n4H2siRuv360oi7bK8l8iZL+BC3O3JG3AtKGv5L46VNeiWTEsLtkX1nxavJe2OfR4xCEfpXsY1qlTEMsKOej4lkxZfIMAbiUzKDQ5Nsngmmd/ZeJvHmvEvdMHqL4bnI851QfipgoWxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8524.eurprd04.prod.outlook.com (2603:10a6:20b:433::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 21:12:13 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 21:12:13 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Date: Mon, 29 Jun 2026 17:12:07 -0400
Message-ID: <178276752372.2498119.8965955961315145259.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
References: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8524:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b8b11aa-ff38-4748-7779-08ded6231744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|6133799003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zFUaD80DIcgXLnO0ZwrCWmcssWJPDyGwVXgXL6uWBKfwlcJR/ICAFdIVO84npu7QDO3rJbD4bLCJLrhOg0dJNZlwkLJMP1U5a8d3I4uDj50OL2rZ6Axel1bXnjU6nemNyMLGYHoJQMepYYlOPL0DJtkWqbGrgzxEWTwBZN+I681lUkBQcY4aTo/9pvRqWbsoZ9xFtWcG+gMnoqB3ljrGh+RqBR6JOfIkkVQ6ZzPLiKbSrEX5n93VZzLle9ahYRPIVBnEva3XNqyPeBJk3DHFdX7eg8e+y1NLlQwYMVhAY0o8e1jW73oUI2obbKyiwpbeCYavLfzbVLB1MYfEnjei4WtGKeqQOUmWBFVEpVBBVUT/MEnFhI1jowDKEmueYXdzZ4C02DEpYLjUGpvQihjLV9eOQNA+HHBGpss547iH1r4YkZfwVIMYUoGz9rbpyhynm5DkQD0+wKRIL1xQUGevfu5CCvQd3RV3HN+clc4Gd3l7IwSi0gndXcOrUKbNyNPa5TLuA6EO54xNLE+34vvjqbujOqQMx+KDTShS15VHxxk69JHhRnCzUjcnwM6J6j68WgH24pcC38PIL3F1AqTa2QXF7n/zm1d6uaBYu1Qvxwz0b8t86kCkDUG31UOV9JlKQmFLVnniV/nbZjxHKDWVkmVF3CDgAEbEqiLI+wOpSbw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(6133799003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDVOd29peDBvVFF0ODJEMjdCMWNCbHpqRTA3REZUemQ5Z1EzWmE1T2FMbEJI?=
 =?utf-8?B?dDBDWTUxYlFvcWtibEhlbC9uRGJNVnk3Y1dyYWo2N1dVWndmamllWFBaWGJ0?=
 =?utf-8?B?R1FlVFlGZUNHbitIMk53WWlxcWRSaExnQ2xwWkhqVkgvOVNHbTNkWjl4bGYw?=
 =?utf-8?B?S1lFOTVqb1U1RWxwRFh2bDJlNjJJNGlDSHRPKzFURVVTZlBaWVZCSlZmQ0dL?=
 =?utf-8?B?YkRQSStFdm1oRlNPbWtGMzJyMzRwcFE5Rlh0VExvN0xIRlRtS1JxRXV2OTlC?=
 =?utf-8?B?eGFDTFdWenNvYWZVcGREVW0rdGdad002R0l4NFRBQk1MWmNpQ2VNVXZ4TlV4?=
 =?utf-8?B?Sk9HWHdweEc1dGRHVmFPem5oWVFRZzI0YUI3R2ljS2IyUjRQRVVIemtnVGxC?=
 =?utf-8?B?ZjE0ZVlGeU5Qbzc3WkZvUzRkZFBrM24vMTkyc2RmdGZ4LzVlMlJxWTBRb213?=
 =?utf-8?B?THhFZ01KdldnWTgyYzNFVGczWndTUFhoK1ZadUNmUkxFTjZ2VzlCbG1jNUVz?=
 =?utf-8?B?RzZDK21sYSs2YktXQ2pEWUxUZU43Nmova2U5UFZBMzdWOUlqWm95aVJVQTVU?=
 =?utf-8?B?WnJWNFk0VGx3UVREejJHYnBjcGc1c1RxYXk4S0JOcTduOGhwcmhLQnFmU0Rx?=
 =?utf-8?B?SmR4K1FWcDVkb1hGMU1sSnlXLzA0d0J6TzROUHRpU1BaTnhyYkRzY1U3KzJP?=
 =?utf-8?B?MUVEdUxSOXREMnFYdWJ1SDZUSjNhOHZGZDdqTXJ5Y1JFTC8wQkQycDhoRDFL?=
 =?utf-8?B?Wld2RmpiVzlnbzJlZXhiOUxyWjQzU0pBbDRVVlYxSWowL0ZyNkFDYjN6STdl?=
 =?utf-8?B?ZVlCeGFMZFZMR3U3RGJocmRhOFpLSUZRVVh5V2pqTFcyNUxrczExRTNVMWJy?=
 =?utf-8?B?U2xRQkwzWkhwQ1VJSTgzSWlrMjRGbzJiK3FXQUplUUNDU04wbzYxblgzcUE1?=
 =?utf-8?B?dTlqQ0ZobVQvNVVnbXBTaG43YjVjUkVTUGRtcmNDcjZCQXpmSjNTNis0WEYy?=
 =?utf-8?B?aXpFZHhBK056WVBQZ0RTQndMTkplZUJoUjdkL3JPZENvK2JnUEVmNGJUSWl5?=
 =?utf-8?B?SzhqT0hLclNnSWNiNUpIN29JSlo2RkowOUJaY2hUdkNId013WEg4aVJjenN1?=
 =?utf-8?B?aUorTVNOWmRiTFdnWER6UU5LQ3o0WVFYUjFuSFdBSTlZblFxM3ZCTUZneFRx?=
 =?utf-8?B?cnR2Zm5yM2Q4OXNIRFdlK0VLbjd6VkphQlBUbkkzaUJVU0ROWTBqNkMvMVRN?=
 =?utf-8?B?REVUM01UVDZBazQ1czZmaDRUM1lzVnZuMldSZy9ZL2MzK3R2UGFKckNNTFJT?=
 =?utf-8?B?NEdHT1ViZDRPNWU5ZmVlNmtna09QMHBzWkI1T3FLOThkODZMVFhUT1lUYlQy?=
 =?utf-8?B?WXBrdm1GRWdCTEtWOU8zaG1RbHpIdXZyS0hMLzc4Wi9wYVdvVTZWRmNDQlkx?=
 =?utf-8?B?Z0IzT3N1OUN6ZmRSSThmMHZ3bTNTR2IxT1ozVWwxUXFrT0JwYzN2Y2llMkJ0?=
 =?utf-8?B?ODQxaFdiWWFhbFh0dG1tZFphd1ZEZ3ZmQUxVb1RrZXJnNnlBS293YWd6bm1L?=
 =?utf-8?B?QUJyRU94LzEvc1ZmY2lVd3p5M0h2c3A0aU5HMlFyWlRGYjJvSkNsQVNzcUNX?=
 =?utf-8?B?RzQzbUFvTkN5UkZNNWVlOStjb2RNbFd6bVAxY3NWcmt1T0ZmbTVmZVhZQVo0?=
 =?utf-8?B?S09rRENFNEFYa1FQZzBuOTlpdENFVHhKd2grWG5OUnpsN2pRYkhFTzF5TTFr?=
 =?utf-8?B?MXFObXZUanFYcnZHQmoyN0ladG4wOENLNWVrMTFXUWlWV2hEWnBhRmRyNVZS?=
 =?utf-8?B?NVRycnNJdGw0MjZTTlJ1SEhSUmduczBMMG16QWZDci9vS2pzNGRWWnppTHp4?=
 =?utf-8?B?MmRPMGwyRTJZTlgrK04yL3pMZW1pKzFieEw4dWE5TzlJb3QvcjNiUXp2bEJ3?=
 =?utf-8?B?aW1WMlN5TUlSWTVmMkh1UGxkRFc1cThXcUFmVU1kMlZ3Wk43MDdmRjFuVWVU?=
 =?utf-8?B?bFdic0RscFFXN2V4QmhqNU9XWGdrWi9HMW5NZ1haN0FmYVNzRU5kR1ZvaGwv?=
 =?utf-8?B?ZDkwcjRBdC9KYTVpT3drQlBEQkREVlR1Y1dlYit4dGJ3dGtWOVRFWVdsUmFK?=
 =?utf-8?B?Y0NiQmtNZ3dSU3JWd05sUmpDTzZyN2NQUkpaeU5EY09ZWFJZQTdjeWt1d0Vv?=
 =?utf-8?B?cmxiRnYwV25kZkkrKzkxL20zeE5wZVBIRlJaNkxzU2ZWL01KODZybTdxQzhy?=
 =?utf-8?B?SUFYNmR0UnZPVHBWZ0o5cnRmbmJzK20yY1RHaGVIZmFubm50QVZWM0dxd2cw?=
 =?utf-8?B?cXdHMUNlVUIzRmxXVTNjMlJWdDJqQVA4dkdWNml1NVBQcTBaZVpXUjV5UWdM?=
 =?utf-8?Q?1n2ZoJuVms+EkAhcKHhrZ1jtZP9BJE/1ZaQWL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b8b11aa-ff38-4748-7779-08ded6231744
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 21:12:13.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjXlTQiu81qK/Y1l/82LZ1RpMx6uFeg0+u57sJGHWRLtwC0t+x8iSHgV+C/84ePrOq4oNQ79xa+bw7Sp9GS+lfCQN5/hj3PpL5L6oqWWdx8zXH3CVzoGQsEBBpqv1pNi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8524
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_141218_109785_1DDB56A1 
X-CRM114-Status: UNSURE (   7.56  )
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

From: Frank Li <Frank.Li@nxp.com>


On Tue, 23 Jun 2026 12:45:57 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
> 4b563a066611 ("ARM: imx: Remove imx21 support")).
> 
> The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).
> 
> And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
> ("ARM: imx: Remove imx device directory")).
> 
> [...]

Applied, thanks!

[1/1] ARM: imx: Drop obsolte stuff from common.h
      commit: c195d4d1eeab9391f6ee16519c8ccf017adb1d98

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

