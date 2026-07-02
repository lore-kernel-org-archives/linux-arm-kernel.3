Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF14C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KMcf9JkRhbYGVB9AukfKMgmhoQOxjNBJtU9i55ii+I=; b=dvgWDwiaj6dCNlLyvlA96eaLCY
	EATjyDGBi8/W9eG5HVUmAxhfgi6ld2X9S+b7v63q6EIjIYUZcvqVVyJQm5xqwvndczphV6k7HKPpp
	emXpLi0VvEYcwJMdx9C2RwVXGQTM9HUJboMkdgJ3s+ZtthTojgJ2+rhNavWTRhRxZSY/xBkZ+VDbI
	8Hrah6d4Xzel2nOEP0Hd+h/jOYMYZJqBxXHKjmTVxCjOyUu4kwzdgUbmJU6bfHe3NmldRppF6Njsf
	cMyY7G5EpYavKRawl5FjAGubtnjXe+NOq6GxR4wzDSBEa6aqMuAbK9CgqhHeZPqM38NkVm8DLBp2G
	3L1l+1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJuM-00000004wx0-0GNf;
	Thu, 02 Jul 2026 16:04:58 +0000
Received: from mail-westeuropeazon11010040.outbound.protection.outlook.com ([52.101.69.40] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJuJ-00000004wtQ-2K0p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:04:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDx5B2xSbmd6IDmI4TZca7QfuDai238TrIb5V45w0OkktDraoLDeXQAfhoBAP0fmPQ1I8KU5xtXpUQB+C6VWxNs2XhRGz6JUAR9CRhSKrbRZ8C8aLkwIBeIvDwz37Rz7O8vi28o2smRApKkPObC1ADQPOIOxqgud9y6mlvO41AdebtFr7x83snEqGAI7ZJQ9oKbxbirfy+5h10vZXs8CaXznvwd2GFM7LHHUrGRuPzNp07p76ox/gB2x7kHmwnYTYpEfUlolvZJ+434IdS7HVXhIFHQ7pKwpIYxCS0n/kmOZMfyeTyxFbCNMfjay5rljNlcptWo3ei+G5XL9WrCkng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7KMcf9JkRhbYGVB9AukfKMgmhoQOxjNBJtU9i55ii+I=;
 b=oUM8XX2Q0TWurGevuZxQCMtJRKh1Qz9ibgZTCcWdDUQUnQXwC/h7PpqjANFkCfFAlsJI4gSyONmSYhA7CEFmVLC2jrUtlLmERDSCT7PhdKdE8CLxaynaUahIGUYjwtBRVPT5Y1qsdBx5Fp/uO4JhyNw/I4O3cjywA4gTViyz/Wm0DFYJJS/HuaQ8UwDkgYBWHJBA7D4Uf+MH6cf5srFVi04Am2DB/jxgwF8ILZIhZbYUl+wN6PM0Rp82CJxlQytBOTPPAxeQZzum8c9zVx7RxiYmfcxq9sdJ9Y46Z9MyhhFVrlJ4nbWEz3aiOZwpXgx+kx8ZESb5fGJS23i2fCCOIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KMcf9JkRhbYGVB9AukfKMgmhoQOxjNBJtU9i55ii+I=;
 b=PHoUIcE+5OhZ9nOVieYAiHsmB+a/kJTwH58foH8lPDr4DekLHB5R7oVFhXXKsvj50m4JG0vaLficOqHROJSbtEJcMTDIaJUZf6uVte4PYXvp/9ATcKzphUWJE3OmNkpnE3FmC32Gy0cUHnb+8IrPrz7J8m1K/sGsXHa/wbIE3JEiRqoSWbxWzPR2hJTTnh5uxPy0oEo74Rg1sSl7Wqjey5OhUI2u+iKe5rpFjRFS35HK01/aCZMtFWBA1OsNWZlQeOog9pQoLBhWyZC/xYI8dlt35WWaCQyYS/9NLIRZ+JdErC9UG2uGvdHmHdhCuZT13qYs6qbeAts28YT66BTS6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:51 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:51 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 02 Jul 2026 12:04:03 -0400
Subject: [PATCH v7 7/8] arm64: dts: imx8: add camera parallel interface
 (CPI) node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-imx8qxp_pcam-v7-7-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
In-Reply-To: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=2327;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=XDzUFFjrgRYgcA7s1MJvWABlvnUnYyyLvumD9LWUJEs=;
 b=FUxExZ4/lNM/Hj8/J7shDKJnJ0fXtJ8WiOjM7tdjYneGAKFpQ6JgA4XaL8FxavxFqZjZo3aQw
 aeU6ZKm5FbMAvT3VqHgdtYzu8xu7u3B1IxQz4YdvjD8ASETYLIHe1zz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH2PEPF00003856.namprd17.prod.outlook.com
 (2603:10b6:518:1::78) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c3f721-6dd4-4354-b67b-08ded853a5e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 9N4ae6uU+hgj3/CXTvoH/gmadHxXSOFQ3F4koFNOK4/KJ4BC9uK+neQSRG9ld8YSig9wUg2Qdm5EgnSCvhVkaTA9kjTj9NQs9o+WFXKs07t8Z2WkuLF3+XUw1Dc/+kp1Qjiclp3LhnIG6i4MCjV3adx98fhTMrOC30jrxSlFbzQY2Q/Pp7bgzZ6NRGFuSpepDSjFub01gACEr1PtmbpLsnflOzAy7SQFZAQ7UnSjFAwjBKG+/YNGypT1bHTCNa+qB7Kpn8Dxw1Sjc+xlCmQVQZx3PTsFF6q7+0nB1XFTmxxyC/ucFAEVt3KI/LJ/I7g7LSVFwZZd9SmR1Wre+3cQc8SqAiDyespw5CrJ8TU6pU8EqlSuGIEMKDpdxBUpZt7+ILoyyTw9M61CZCkYpBwLn+KCIVCFA8UID5gDlVe1LbwkHkbmSDtVmcEuuvIFhWpMwcA8yiCstxVpstaqAUGjK+01Tgc+CS25rIXolCTWRxKqfsuSqwlYb4GgdbcbNZlapn/O2oDV5sZDK3axoDGNduB9qbD9sAfLdsATi+/yvqRznRqEp/0rXibQw5uHJA4Ca87wx4RmVbq+9NTmZLYUSDLHiZtYOVYsbx7F/H0zNEQ1Mb1cM3v3vUc3feNBUCdgA6vXG20RG9RO8uMGOBoy1m5FV3A0cZEWS9oPeoe9rEUJ83R1kRSeQZholmicnuZ5GMlW0ObTGq9J7ZNNC98Exw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDcwZy9PWlVib09hZ3RIWGdnVjhScTgvWXZSMVcyK095WUVHRlppakVLbWZh?=
 =?utf-8?B?Z0txUzExYnJZWldOd2VudEJOakJMaVl4WmkxeWhCOU1rTWEwMlpxazNyVmI2?=
 =?utf-8?B?YzlpZ2hyN1kxMlhwMDNaZjZmZDR2TkZjejZKNzFycTkyeTJqTkpNZUVvdFNu?=
 =?utf-8?B?M2FMVm8veTVSQTZBQlI3bkdWdzg2T0J6RERRL3R5ZTJiTE5jekZjL0Q5OTNp?=
 =?utf-8?B?NWxjK2RzUmtSUFNOU2Zsa3FadGhiYWZMeGg1TGd3UUd2YWtGUWtsL2xWVFVQ?=
 =?utf-8?B?WUVGcFloZk1ISkd2a0dqU2dWaE9NS1N2aVUrb2k2T0pWS0Z3NndWOUhNN05r?=
 =?utf-8?B?ZnZZdFRXbGFZRzV5RVlORDVhcnJyYWR1VFgwZG9pRGVrM3MzazN2UDFreVIy?=
 =?utf-8?B?OHJrV3NHR0pSV1RDazZqczQwWDlQUE9VMTRQeWNydlBqbWw1U2J0MGJJZWVP?=
 =?utf-8?B?QVdpekVDWmxxYnpmeFkzdWVoSzZibG5xWWw1NGtLdU9BOU8rcWc5Y0tlbnl0?=
 =?utf-8?B?Zm04MVR4emFETW1vRmtSY3NjblRUY1VoYVFza1hyckZXaGl2WnlzN1JJZU1J?=
 =?utf-8?B?cHJaM29rU3cyVU5JcnFvU1ZHUkFzWmpxNEFqenlkRWlqN2V6UG9ock9qNC9V?=
 =?utf-8?B?NDNwVTM2ZW41bjZzTFRsRHBBdTFGa2RzcWQxTnFocDBDMjFORUZuMFE2Ympx?=
 =?utf-8?B?RlFHSVhwY0RPakRqRHd3YzVJTzNkWWcydWxSWmtZRlR3Zy9aTW1NOGpzenVC?=
 =?utf-8?B?Z3ZEOHVEWTMyR0ExcDNEcWhqc0hTSHhmbWJsemNGbTBYeU1aTzVxdjNnenll?=
 =?utf-8?B?dmF1dDMvdGM3bmNITjd3VnBWTTk1S3kxa3BUVlozNmVtamhvUld3QzFpbHhG?=
 =?utf-8?B?VzBlTnZyWjJLQ3FQaENqb0NjVjlVUHFrVlQwckw1OGdSN2Z4Z01CNk1KR0xX?=
 =?utf-8?B?d0pMOFVlRzhXdjZQM0J5VlFRejRJZ2lma1cyQXVLRVZ4d1pQY3U3WkdCU1dB?=
 =?utf-8?B?aDVDYnZmU2VqSC8ySTg0dzVqTTJISUhyY0ZzZ1RCeEhwc1dmSmN4M05UZ2o4?=
 =?utf-8?B?N0IwQWJCZ2NSZjdFNnQrY1RYYnRCcEpuUTB6QU5jei9CeWdUTzRDd1FoaFVB?=
 =?utf-8?B?NkNOWm5OdCtkYTh1TmVONUhZUlM5a0g3NEtVTE9pWEJyRTIrNXpIM2xKejdV?=
 =?utf-8?B?SzhRa3VNeWNmTEh4Q0Vta1hUSFZ4Tm1qYjdMY05HQ2p6ZTFnRXl5clhSZjMz?=
 =?utf-8?B?UWRmWVN2Z2hhNGpjUkRaN2NHWkVuYjJpUFVjYjF3Nng1bC9UTGNHRmJjVmd3?=
 =?utf-8?B?V2RiK2xqV3hqUXZKcDg1c2ozMHMybHk5Ry9yVU81d2xhL2pmV3Y4cGUwZExx?=
 =?utf-8?B?S1NMTGhhaVMwMnZ2THNCdjMvZjhMdVpCRTBEd0s2MEpONjZOelJQVno4SjQv?=
 =?utf-8?B?NkZ4T0U2Rm80aXNwLzRyd2I0NzViQ2w5MnBVeFEwZ01zejJtYU5lVlNNQy9a?=
 =?utf-8?B?dHhHMUoyeVZFWFRjQXFka2dJQXNmZVNueDhIeHZTNVJwK2ZQbFBIS0NtUW1Q?=
 =?utf-8?B?WE0xSHg2a0NOb3Bjd0dlSk9seVk0NnZRcmtNMGYxL3NORU9ZYmhuZERQbGFu?=
 =?utf-8?B?UnBDMjJrNVBqWTNkZnpxU2QydHA5UkFtWWIvSjhtMkFqOGJjeGx5cURqMnFV?=
 =?utf-8?B?YVk5b3ZFYlFWTXNWeGpZMjFFVEZEdi9sQVRGNTFCS1h5UG1FcDkyL0h5U0Uw?=
 =?utf-8?B?Y1FBU2JoeUd4T1o4Q0VZZ1dtTUZmM0JWdDZoV2VPZi84OEtlWkVOckQ5S0NY?=
 =?utf-8?B?SjZXMUVUTnhydEFyNjBYdVF5M1lEUWR2d0h1akJQL1VZUDBjYjBWalpGaGdI?=
 =?utf-8?B?VFNNUHh1NFdHTUQ4MmZPZzRNdkZJTmViclFvdXZETng0Zi85K0ZZZk5Paytu?=
 =?utf-8?B?clIxMmVibDZGVmZJVlRRL0dJcnl3a1ViVWlyRkdKZ2hteWZ3TFFVdHQzUXpC?=
 =?utf-8?B?WXBUc2dUalJySGJqV0hXbDlxNEpBRVJvdU5TVGRnTDlMdkxyK3h6bGk2SGwx?=
 =?utf-8?B?NjBqckNSalh0Sk5jdktCSzRseWVxQjZVOEhVYjAxY3NBSVlaeldqSTNlZm9t?=
 =?utf-8?B?UGNaS2N2T3ZRbTBrYkZpWjRQOHkxWnM2WmxDeUQxNGFjdDBPeCtSbEpleW8w?=
 =?utf-8?B?Y1JWSDN2bUgxaU00L1lFaWdzNEMrT3BvS1ZDNS9IZWdia0dyUjBqaDBETlhz?=
 =?utf-8?B?RXZzMjNtZGFqVnVVVFRJeU14ZU1qaWJ5RDlMNzNwYks3QzFUVW4rTFpESnhW?=
 =?utf-8?B?a0Y4dmFSenNVckxFUUVHc2lra0xqb3NSbEVwODg2bmUrWHltZWwvRXJUbWJ0?=
 =?utf-8?Q?svEo1gluSPqvEezRPUsOmPLSmTcJQj5xbqQlJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c3f721-6dd4-4354-b67b-08ded853a5e8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:51.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J5ST+ujRNeI4HblOULLyazR7f1SphKh0VPB40dkhsdLie0vOHXcpVuOzkOImcb2ZJR02xyx0jMpTzzNqEPP4X379h0hqcD0XSKcxErWmbiTY5kuEU7XnqJrmRMrYblsY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_090455_604674_9494A01F 
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

From: Frank Li <Frank.Li@nxp.com>

Add camera parallel interface (CPI) node.

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Chagnes in v7
- none

changes in v6
- add Guoniu Zhou's review by

changes in v4
- none

changes in v3
- replace csi with cpi.

changes in v2
- update compatible string to match binding's change
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index a72b2f1c4a1b2..b504f99f6acdb 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -222,6 +222,19 @@ irqsteer_parallel: irqsteer@58260000 {
 		status = "disabled";
 	};
 
+	parallel_cpi: cpi@58261000 {
+		compatible = "fsl,imx8qxp-pcif";
+		reg = <0x58261000 0x1000>;
+		clocks = <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
+			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "pixel", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-parents = <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
+		assigned-clock-rates = <160000000>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		status = "disabled";
+	};
+
 	pi0_ipg_lpcg: clock-controller@58263004 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x58263004 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 232cf25dadfcd..5aae15540d6cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -62,6 +62,14 @@ isi_in_2: endpoint {
 				remote-endpoint = <&mipi_csi0_out>;
 			};
 		};
+
+		port@4 {
+			reg = <4>;
+
+			isi_in_4: endpoint {
+				remote-endpoint = <&parallel_cpi_out>;
+			};
+		};
 	};
 };
 
@@ -95,3 +103,22 @@ &jpegenc {
 &mipi_csi_1 {
 	status = "disabled";
 };
+
+&parallel_cpi {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			parallel_cpi_out: endpoint {
+				remote-endpoint = <&isi_in_4>;
+			};
+		};
+	};
+};

-- 
2.43.0


