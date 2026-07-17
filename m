Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A846C44516
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 10:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=; b=4pItRr6aZP8O5GqdSpC3JcCnUG
	xfVIHuPAte0VeqgicrRPCNBOYQAKCUgpS/wPJC2BOdNEK5UQE43qm466A19DP2YJxzX/VwkUpEMRK
	L8gnOWBq3uJPcVaGe8Zccj1II53NSqkifnJmWRcJvVv0MLbqYG3B5nPDl3rJLGKgOPIBO714Nhl0g
	UstWS6eP8DiqsDZe86NJr/X2zmsQ+Vap9wF4Y6WGKHvSQ2FyFQJT5bNnEQJi9pATOnRQA+XhNiuU0
	C7C5DXvfGWR8NhSO8lesgqSaaeV9WxdelHU326+yL9jJYOWyBTIAZh2gIig2rgBd5ErGjZ5Np0G2K
	9q72YSsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgE9-000000023lN-1oZ5;
	Fri, 17 Jul 2026 10:55:33 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkgE2-000000023i5-1H84
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 10:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX5VWSA3YHuGZ4QBwclCWuHJTrMkI3Tz6WEY+zqpun9mToJQlP9cYTadqkZ0ahl1586PT1bFjzKyf8I0rt1WseoL7EZjseYKW0Q0ddy0MGWfxXMNC6XNGHtUcBwsidy4g/pBwslLGzOJJW9AdwccVR5Fy6IqNrw3ftA4yBE/bSDGJbPuon0lSBYvVd2zDwu9bvnO4s2Zd1brVEUvv066j4t4NjvPKeqbsZ8GrRbH3F8HKat4SevDN2q2VLDS1AsXDAo0CAZ5dZ00YQkMXjARd5VkHQIWEF3ifENW8X8yRN1RrbIybGqUK8rZh0WYSiig65YP9dWuMP/bktx4EKDZ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=jAe3C/Qw3Z3X2wZ+c5DcELlEbCKhr0o+lyGuE+aD+Hwuy3QtSeNw7//tcCihW4jzKyD9UFcdJZcazIbwbYnLXNM84us3C9Vm1+hLleAj3dSJhR95UgOTWmshohKdBsKhGoj3HL3zg4CEM7Cgjw69xU0PFtkhzAU7eSyFm2saIc76bNZwdtj+ygK1SzckXG9OMapnMklt/0f8ooAucrFFU8d8S/hbD0ygGskfUkxUBDSdACwuSD2BVmcS2KEmv0Abu6oI1ioLuVfRrMYPWYrU0GFeEUUyEMWKOkQwqibNPVNZ+b1FGfEPmZRXHo6DjK2QwBlAuoKmo/XdAlldbTn0aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=me1DqyN79rXcOCNqCT7DuIDvyYq8jm9KqM0P8I8z5W3rs9Ayasue7IMA7THWP8z5QocJrbi8SnhP20EblODWkXzsuaci7VUwj4od19XzUW7nEB+yYgVjwop5xikku4l66+9cLLW+xzXT1z2d6HRs5N8yfSFOCXHw1pNlhVar3r1jmtLs0EpyIYKLxC1HC3fvI8Sma4iJclfRzjgIhQWzQkTQ56Fv3mGsBPjmoFkv834Ok3eopzkQsGDWnKtZxXb7i2a1dwpU3PQhg/4JWAB5xOkdm5CwPrEtehlm/tW0ERlnek0GQx6BB7KOI+IlAKhx7g3Yx90SQ+NB3hNUpDmX9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com (2603:10a6:20b:348::19)
 by AM0PR04MB11880.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 10:55:21 +0000
Received: from AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545]) by AS8PR04MB8465.eurprd04.prod.outlook.com
 ([fe80::36fa:43c3:5ac6:9545%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 10:55:21 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 17 Jul 2026 17:15:32 +0530
Subject: [PATCH v28 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-imx-se-if-v28-1-0a9659c7e69d@nxp.com>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
In-Reply-To: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784288732; l=7403;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=duQr1INe1O0rYGQ+W8jOVchkQ9hVHoxwala3eULQLYpqU8nc4iu0Srrq3N+WwQAiOSYpJtei2
 bfofAZvKRUwBLPQet0GMBu9lc6+qcbpcZ44BT/VXzhewSH5ENtZ7VAk
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: MA5P287CA0021.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::10) To AS8PR04MB8465.eurprd04.prod.outlook.com
 (2603:10a6:20b:348::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8465:EE_|AM0PR04MB11880:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b332d74-298a-4e4b-1857-08dee3f1e5bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|19092799006|366016|56012099006|11063799006|10067099003|3023799007|921020|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wx97dUZd5ZBK+7A9eHZEksUj6T3EnMMdg/H67mEWlZMdpM8UlFRbN077OlrXFI6JEnC6Po+L/zs3TROqzKJdVWrAQyonjl2S98lBCMmSyDyCqPNeCIrSUxFLSQDzAJcYvW4oxr3z1W+iPqgUX9Lw8/pXuSxgxE426cZTslPujaFWHrHxfIvLmTlh5RpplwS9iUY0ozaIlz5geenYPm1lfbadBO9XpECvQgO94uXCPrq2QD+d7nzL6k2Q0EyvB51inglHY4UMcOFLBZfdl+7Tx3t5yKEpTrd1vynVo/n7GaBvgsnT8voJ5u9cydRcs2P8xP8s1Pk/Dy638LvQfsZoVABQuAhoU79FJ/J30M4ev2y/7J2OqttDf6qeYPgwKt7TdnKYpgJcLP/9ojzFk0WELFpFuryFlWxX5ntKUAdIOTrUW3ioxikroByA/iOhw87kfeiCH3p8upzFVFnZAYCPOv+IcyYrwwhW13JRv9OeY335Imxtg1w4OF/iau2sRgRVsBZPFDKTkIYV1ID436PIdlR4XhQmqmYLCtwD2uB218fxF9YI+PnhUTOgYAKCGsAtuppkNJHWPfaBn15Z9HI5Fm3F0uz1g66XWEgSh+5Jjdc9WyeurAdzHaFDP297xN36Z5nqtEkXjiXy4zdTykE5Vb9MucmUcUcaY7edckeApph8M73Ebl+ItfEEwV821vAkNP455K9Wr3QFWNANqL7Nug==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8465.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(10067099003)(3023799007)(921020)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NytYc2hwWEJXMTYyTUNnbkFmeXhDV1M1QlFIY0IybExlUmQwK2hMRWNLWlJK?=
 =?utf-8?B?RndYdWIvNWtqUUUzT0FkekdHZHFNNTFobVZOT2RQR2ZtZHkwWjNTK3BlaG5k?=
 =?utf-8?B?cWxIK0ViazVYa1lwbkhCV1RqUE5ocEU0aFFjdEpxVFVOWTZnMVA1VkZWakZq?=
 =?utf-8?B?MzR4b2Fzay90T3BXenUzZEEyeSs1dzh3MC9iMmxKd0ZRNDR4NlV3VDRZaFph?=
 =?utf-8?B?aHU2UWhpdVRHcnRyUkQ3U2dpMzRqK09RNlRkTUNxQWhTTzdEV1RmQ3QzRDF3?=
 =?utf-8?B?Q283RzFmT0E5SkMzU1FlZTkyRG1RaklIclhzb3h5dUpEY2dIa0ZSd1RYUURR?=
 =?utf-8?B?T0hDTjdNM0tpb1ZYb3ltU2Q0R1BwODJYb3V5Q2F4Zk14empZNFpWM1ZWRkU3?=
 =?utf-8?B?c3ljek13dnZFSE95SElyYXVwU1FBdUVSSW9QejZsdkR2Mjl5Y1RUN2pRM1FZ?=
 =?utf-8?B?YmpEUzUzM2pHKzhOZjc2dUpVbE5UQVM4NmxXbkpZODd5bkljTTlNNENPaWRS?=
 =?utf-8?B?amhZQ1ovQ0o2QVRVNUVHQWZPR3VlN3ZkdzRTNG80cDFNQWFKZ01WQTh1enRs?=
 =?utf-8?B?SXdjWnc1QTZaUUVpOVZVZHM5Nm8yRFZjekczbmNsanZQWk1kNGNBbnUxSWFW?=
 =?utf-8?B?Tmh2aTgwQjFFanF1SkQ0S2tqRDk0K0YwRDErZDEwUkJiZ1M1SFd2amQyTU9Q?=
 =?utf-8?B?MmpWNHZvVlE5RFh4RytJN2dlR1JxdThsQjMrR1hyMGxoQitCTytwWHV0R3ow?=
 =?utf-8?B?RUxYTWdJaW9hUDBXZFJET05Gb1p2VndsdEtwYUtOY1VQdXYrNGdVMmw1VUNH?=
 =?utf-8?B?TW1xa25lUCtMZjBYSmhlOE1rQnM0NzUwcjkxeUFtMUVmd2FDR0JTTDZZVlVr?=
 =?utf-8?B?R2ttL2xwZ3VGdWxDdnQ1bjhSc2lDV29IWEMvRzVuN0dGeUtwd0VOTDRLdGxM?=
 =?utf-8?B?ekEvTHltamhzRE54N0JaOWlZVzFnVE1IR1JKUklOblFaTDVQUjZtdHNCa0Uv?=
 =?utf-8?B?SlhFUFBnelVQMnpBeFJhdVpRY0ZTaHRRNDg2RVUrL3VHeUNKdTRrdVJrYzdN?=
 =?utf-8?B?a213bmJNVW1zSGhDYkMxcHZnUDhKZkx6Wm1sMmtyYnB4QmV5bXMxZmxIV2g1?=
 =?utf-8?B?anYzSnhjaE90N2JYSWE4RCtsS3VOUWlZdjhNTVB0alAxZDdBWU1WK3B3cGpC?=
 =?utf-8?B?cU5qeUVkekF1SzF4Y3dDRFJORmRpOWx4S2c4MzZteVNWTzc2WlZzYzRCVHdF?=
 =?utf-8?B?OTJJRnFRdU9Gd3JlK0tNRXk4UWt5alE5NGFkRU1mOHBtczV0cTNoTEk3UlB1?=
 =?utf-8?B?bDB0OGM5aVVJMys2QkNVb1Y2aWpTZ0FwWEFxSHNuTHBYRlZaWmx2Q0s2dkRl?=
 =?utf-8?B?YmpxbGhQSnpQcm4wcjc4YXdvQStZc3dLQmhnakdJVDZBWDU5d3JlNjRrOWdW?=
 =?utf-8?B?OFQzTmZ1UHlSTVRFUzFNWXZkUk96R2htUUhZWTl0ME00c1dHd085VDd4Wmx1?=
 =?utf-8?B?dk0yb0EzajYzWUdWcHliS0ROaU1BZndRTkVnblhFVTIwQjZ5c0NZZThrZUx0?=
 =?utf-8?B?eDJIR0NMTzYzUWY1MW55Q3VMWlN2RDhwdlN4by9scEhzQmh6UFlrODYybno1?=
 =?utf-8?B?bk1YZ2VmWElMT3Brd0F6Rkh6NTVhUFdtSmdWQjdOZkN1WnZqdVVIdzRKVXY1?=
 =?utf-8?B?ZDhzT3hNWWo0Mnp6ZUttMVhHaWQyK3JIVW5hUEMrY1BBMDl6L2h6N1BmU0Js?=
 =?utf-8?B?cWxwM0RzbHhXenN1Z1FhdzdxZ0NDZzRDVmR0dVZDUlRqZ1FwMER5V1FvNjdp?=
 =?utf-8?B?bFY3RG5makxhcThpdlJDT2w3eWM3K1VMM01uVzA2TUtTRG1waCs4UWdwY0Fp?=
 =?utf-8?B?Nkg4QzUrcWh5ay9kbVBuZkI4S0lRRUM5aTc3SlZNNEl0aGhPdkFoalZkWnJE?=
 =?utf-8?B?NDFCYXZMNThhc05XRjBsd2NVdjJFWkNPVXQvNWJudFJnbkY2d3FxTGJMekVl?=
 =?utf-8?B?b2tBMlVMSUJRb2k5WEZBTGtRUS96ZzZGaHR4OGYveHJmdzNXVXpSaEZ2dnlO?=
 =?utf-8?B?S0owWkRmMjhla3JiZnZyT2xjclJyZ2R0TCt6TTE2RUVyU1JXaUlMcEVuNEkw?=
 =?utf-8?B?aFhtTFlXMW9Scno4T3ByQ0VJUW5Ld2xSS0daT05YRFgrU1l0UUJnQS93RFpL?=
 =?utf-8?B?c084K2h5Ykk2VTlhOGJTUXl6YlN2STI0SVZ4MTI1Zm15WUdoOEtHUHlmaDg2?=
 =?utf-8?B?RFV1RU9xRzFJWDV5YmR0L2Q3M3UySDlDcGR0MXVBTjllV1lMWDdmcXRuWW1m?=
 =?utf-8?B?UDB4eG50Q0lEU1pPMWVnN1hDZ1g4YmdLRTVNa1VJVjBuYzEzUGR2UGtub3VN?=
 =?utf-8?Q?+GEouilL/dPzo4T7oOeSlpOu+ZrvNaKAESIC2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b332d74-298a-4e4b-1857-08dee3f1e5bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8465.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 10:55:21.6447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9n8euppnH6fLUeBOF69bm/Z9GBP9qWG61gFDbGotZZ+tQaeDJlJAjbs0Z771IHzYpSFJ4MMFqXosyF8h7WOZAlBbJt4l24YpHYmjMAnmtSR8IZlZKQQ0oB3OKUDUwIUq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_035526_481064_5DE93C7D 
X-CRM114-Status: GOOD (  13.73  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0


