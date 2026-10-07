Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E75ECA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJyMx7alhHQas0qR2FUpt6mXFl2mH2bCYTtwr4BnL0k=; b=VWhuy/Cq6wBxVosYbR3mhCB2qs
	BVDuVlPL02WElZEmkuW4seirf/Wejjz0SS2u5Ug2FTFHbcF96BHxWeWT3sNi94YeGKnNaxM0ceDVp
	PvFs8gYBrqVYi6nryMPyqVoc7LdlZI/DnLamG/SkSbV/L5AqKKBf4sZl0Ox4yiPLpQkcv5KxqElyK
	CEfEg4+evdliJ2wVrQr/Ay058BaeEdwnl6HXnhg3v06becMxqgpCmI3teOd54CTMRfUiGsSU5uiAl
	yN6QNvqVTHicq8CXHrh73iqiT75mnnj8cGcM3XXN5P6r/2ArnHhQwbi2ZfUnuNG7QlCLKDgRZ/hCy
	/H19Isbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPBv-00000002Dqi-2Fe3;
	Wed, 07 Oct 2026 10:48:07 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPBs-00000002Dmq-1TPk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:48:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyNdp1QF42plXe7/F3rL/HEYfo02SyyZ0dp0L1mpyvbhYDGxk5FskPXTPPjzu7QPwfFni5AKP+rkWONPY3tGodulDoTTfAbKBa9dCi2TSGMDTiDsY3lqZorZ2fZyNSjy/ogb5FNEgTFWtMGfCaGh5GyJufmhaBzGCYlt1pO5j6eVi96lYxpD7Fz7GqanzI8753w/KKfFYOqsWdas96M0SQTFIZ0wpN2H/XH4Sb8pp5QsmIlYve1Z4QetmYj3n3DVQS1SJds4PX/Pve2Mj7Qv8H+855wjbWIlrIHm4qZFItZNYX+prpvzC3kS8UDuXhq0u4lhnQrfGNB6aZVuEKczGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJyMx7alhHQas0qR2FUpt6mXFl2mH2bCYTtwr4BnL0k=;
 b=GmPzexm+8DZFnngaUyHa1MZzZeqwNIRSbfVyokOShWW5GYTCYL7qGklEne6d6s3AWXkWrsUYpskgmA2/wfdQqRm+ykIIevRgwubpM/aO8dv8UsLpuyMEzHcSsh+olf+XbUb2C2evoN/S8+oiKPyt7KWyPYb3PuVMinmeXENOe4cgmzBNoKPB1AWzs2mAfNQ2UHSVIWlcvGZuezkF6vpuzlgoMjytTwNJAIBhhUYNYYeg2QlMDMxivHJIQUIZxvqBAFAhuVgDVRRz6iESVPVe2xqm2TeATws7WbTxj9q4cgrn3F0hWXdkxbrjoBiGeCSduAzFRsEBJ92C4xbe/Ns5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJyMx7alhHQas0qR2FUpt6mXFl2mH2bCYTtwr4BnL0k=;
 b=hnliw9XdThw7EqDUmgVXZVYy0keuvo3BsvP2b5FQDh+IAOF++J8uJYVgXfIfSKECcmIhP2ijz3yPxNl8iRlcPX0CsLL5XadJ5TM4n4j+PoSyI7eDCwgil+38uarakaWxjR+vlPVPy/jSQkrByFpsGkhdjLP+x4iR2XP152KComvr0ROY4GUVRGLoCy2ovHrQwxSWvsyQIWhJBimV2p7KDPJF2aFiTg55X7xO2uLOK86xwTG69IfZljXX6BxU/GrOoo0c7VkkUrMm/8Uu+haG3iImK82N/aHqoMh0wn8fjSpvFMMJlMGveGn9Zq0R1Pi1tCyqGAKQuNwlcrwGAfGpGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB11738.eurprd04.prod.outlook.com (2603:10a6:150:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Wed, 7 Oct
 2026 10:48:01 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Wed, 7 Oct 2026
 10:48:01 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 07 Oct 2026 18:44:24 +0800
Subject: [PATCH v4 09/10] gpio: mxc: introduce MXC_ICR macros and use
 field_prep/field_get
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-gpio-mxc-cleanup-v4-9-c9f5a8b50df9@nxp.com>
References: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
In-Reply-To: <20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: ab24f4e4-4d43-468c-b77a-08df246074f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|11063799006|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lviSIEjvrfF8/VLHLcJZAzByYoyNCMNeniKtElH2f+PuivRi+abaWI0e2BavgJeP/4dI6r0rgiNdYb+2nQzDnLeKMxRczl0s6H050BmkSTj5s2LxvjD2+kDfHsBGFDZxXAjXUuXZH/LB9lhWPUrSiDpaixIol82jD7eKZgaxZEBfVcvgD0jfSA1/Tk9Izy6iZLXbMsoB/vbjPVxpdGWSB8tnoi2ia2zS3yWXvuxkGnnz7IWW/Zc+aANYFB52v9TGqCY62F5za5/QZQ4x7tPAS8d+saj5wtpsL+Gg5/t8gpHI+5ZaC7mDfGyT+p1xrl8w45Hw2fJQdkMGImI12gb4DAnqukq8B3CS1c5d0yOxjQwW2V3dC6DXUVDk0814/NVeg1Ts2hCqDf3jwCaEIGcLNGHYX38RmMil1BWtHguD1xY7sSE8xnAXqmrsDphZ32++1JaKWG+pRjMV595X673d8KnoO2l2Y1P6Fp/BqXzMrPbZfqLH1DEHqQgMZvSxpnf917Yw9uwVpNmy2JfLclgboEqi8zpHAokEPEvZMfZPTplzuq7slIZvKqT4qSoyBkQaUw92H75/kBbfpMBFwZgdWkQRDxyV7DSjxdEfhIaEWrTatjTCJi8ygtJpvUI9XNOVD9EWfHPcGuwVAP4zA7TfEtx2vuMQ1NxrWJLT6OMM4L4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm4wY0ozSTZtVE9yTVIzaVgwalVhblQyWE92RDRQSk5QOUx3M2ptc1ZNQW56?=
 =?utf-8?B?cThjSEVvNXNpOXRlQUtOeDFNbURrdEo2YnhGVG5VOUtDNVJOWlFHdSsrV1Nh?=
 =?utf-8?B?TUtkZFRRZmNnR1N3cVVOU3JRY1V0OC9tOWhFekNqWW0wdkVmOHNGSWMvZTVV?=
 =?utf-8?B?NWw5b1lGTWJDZFNUdjVONVNUWTJld01oQTZMSVZiQ2J6cVhaaU9MSWRJbnVN?=
 =?utf-8?B?c25BRlZYMzVCUXRnZGtXd0ZNY0lHekxiTEpKZHkrYnkxam5QM1poZ2xPU0U1?=
 =?utf-8?B?a0pscWlYZytoWWwzWXlDU3JaRzQwWm15ZEcwelFMLzBFdlVNM3NpT0FkczJk?=
 =?utf-8?B?aC9HSGlJZEtVREwyUU41c3czaTVQek4yV3dsSHBCZFBDaXI5MGRiVTVPV2NI?=
 =?utf-8?B?RHBDWHZjWmEzMjhiMGlTWmR0MHJkNXlEMzFyTXR6dkdUSXhuQ2RHRVorRnJ1?=
 =?utf-8?B?RlNsQ3pwc2dxT1FwZkdJdVhFMUtaaklSbFBlTVUxUXdOd3h5SUNkZStqTFRn?=
 =?utf-8?B?bUtzR0dlMVp1Z2FLQk55NmNrK3ZLbmFuVHRtdXZPMVQ4YUhsaGQzTlorUkdZ?=
 =?utf-8?B?ODlTT05lUFUyNXpmaUt5MDRGZnRCN3pQTVVvRWZFb2VwenJTQmxHOEpyY3pE?=
 =?utf-8?B?OXFDVzl5V0NHS2dJZGljREhDTy85U2xvZ1hTQ25xUjRrSkR1N2RmVjFtNnZa?=
 =?utf-8?B?MXlFNjBGbWMvVVFIYVBiRVgyY0NvSUhQMnBGU2FteHd6ajRDVXoxY295RVlr?=
 =?utf-8?B?a1BDcThZZUZKSkpZOTkrMjdQNHI1VlhyODc3NWVFRXh4ZTJQUTZZN2lRN2xn?=
 =?utf-8?B?RDhSN25KODQ1ZGFCUzVXeVBtVkJHOTlXSHhNcG9XbkJGL1lDem1yUzhJemRo?=
 =?utf-8?B?WS94Wm1yMVc1T0VtMzB3UWhmZEMwRXhJdnVseDdFRmtmbTFRMEw1eVF3eVd0?=
 =?utf-8?B?ZkZjWi8zR3YyT1hXK2d1c0taTDdHZzYxMHIvMlJEUkRjTWMrbE1GcnRIQzlm?=
 =?utf-8?B?Sk9nRVlCYitGZlhQNGNVdnRrYjFqa1VaYTVBZHZwWllIMkhxaW14VVVtRmIz?=
 =?utf-8?B?bXh4SVlJalhJWWdORVgyeW1sMDlWK2MzTTVXTmxSNVNzU1VESXA1alN2cGhD?=
 =?utf-8?B?N09WWFFPWFhNTGxkQS9sbkZOQ1dZMGxZY3lFTGVGZU9BRWgwVlFna0p2R1FR?=
 =?utf-8?B?K1JjV09sN25jYXBSVjdLbjhTZ09ieGJScWEyUjZMbEJJOWRuMFhWYkRqZHdZ?=
 =?utf-8?B?b1hjWnhaTURKZyt3Y0hYbTRJOEVEMzNZZDVSY1F3bnBFQnl5NGZjZVB3Nm9I?=
 =?utf-8?B?U3psKzFuTzY2NXdJT21seDkxT09EV3N4WmpTRkhibnJXaUxCNGs0YzRoaDRo?=
 =?utf-8?B?OGcydDdWOWh0TTdyWEU2dUp2VWlITkRTK1VVdUttTkZKSUMxSmRGT0VicFdh?=
 =?utf-8?B?azZaSStJTmswcjAvN0JlOTE2MnBzY0dYaXNrNjM2bzYrbjBSSC9MU1plYTNV?=
 =?utf-8?B?dCtFeGxFRlZVRnczNHp2d1kzdUxFZkxheWtpVlhiRW4wRkpUVzFrSGpVTVRz?=
 =?utf-8?B?NXFYN1VqdUM2bkkxdG4xRmRiU2hWdFdMblE2YjlCWTFmbHFLRlpKYVd1VUdZ?=
 =?utf-8?B?QjgxTy9hWVlaNUozVnVLcG5hSDV0OW5ib09raXRzeWpGVnpLZ3AvT0h5NFhs?=
 =?utf-8?B?bFR1akhqQnIzblNGUXkzMlhsbEttQXZwUlRFczZzcThsYVN1WGE1QldOMEVK?=
 =?utf-8?B?VUlqTkFMY3Frb2UzVFZPOGpzcDl6TGpGMEx1c3lRV1lBVW9MMW13UDVreE1B?=
 =?utf-8?B?WG92NGNDYXEzU3I4UDRGSytLZjZGUHdjK0hiSXZ3NW50ZlFHRGt5RmRzU0xV?=
 =?utf-8?B?RlJ1NFJlRGRXZWw5bGhwalRIdE5xZjJieE1SNGhFZWEySVRKaDBKZGZGcDFC?=
 =?utf-8?B?VGFFTlgwQ1VDNnU0RVZVSmV0VDJJeTJmSFczSkFjNTJjUTBqQ1NnU2NSTGxH?=
 =?utf-8?B?NENwcHpsM1dISSt1eWtFTEJJNGcrdlRoRVZRMzlOR1B4QWw1RjJjTG96bFJw?=
 =?utf-8?B?T0twU1hzNXBSVENEY2VwSmp2WG9iV2t4TlZqaHFZa2lOZFhkNkdERC9XZGM2?=
 =?utf-8?B?a3BCaWJjYTY1M0RncWl0N3NHbFNpRjlhY2h2R2JHWTdrOWczaGU5RVpZNkRY?=
 =?utf-8?B?RW9ZSXlrbnZhdW9MN3lmQWVLbEU3NXRBZnNUR0wzR2pnWTZXZWJCeW94Wi80?=
 =?utf-8?B?dGtHdVNkZDAzU3ZXdlZvMFpvTExIb3AxclRkTU1zMFlVenBzMCs3NFVCSzVs?=
 =?utf-8?B?OXFEZVVZZXV6ZUpXZmJkbkx6SHRwbGE0d09UeS9kT2VlUG0ydHBvWWJhd2c0?=
 =?utf-8?Q?Xn2W1JKkaWRj4l2ge6VPjBMTPr8UfqwIZKZjb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab24f4e4-4d43-468c-b77a-08df246074f1
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:48:01.0096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KKQ6xhH4jvjI8DDrG/BMQvR95qP8ZLHlX1LKPETkHaheEyB555VrhUd2Kf6z7tHERSRuGP+CZFPasJ3JoZYPMoW8N1zS8NT5piRocL1HPWLASewODuTbiYGUg8hGwYI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11738
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_034804_894086_866E1285 
X-CRM114-Status: GOOD (  14.83  )
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

From: Peng Fan <peng.fan@nxp.com>

Both gpio_set_irq_type() and mxc_flip_edge() open-code the same ICR
register selection and 2-bit field shift/mask arithmetic with magic
numbers (0x10, 0xf, 0x3).

Introduce two macros:
  - MXC_ICR_REG(gpio):  selects ICR1 (pins 0-15) or ICR2 (pins 16-31)
  - MXC_ICR_MASK(gpio): 2-bit mask at the correct position

Use 0x3U in MXC_ICR_MASK() to avoid implementation-defined behavior
when shifting by 30 bits (pin 15 or 31).

Use field_prep() and field_get() from linux/bitfield.h for the
shift/extract operations instead of open-coded shifts. The lowercase
variants accept runtime-computed masks.

This eliminates the intermediate 'bit' variable from both functions and
makes the register access pattern self-documenting.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 9d69524e06db..39de616cd434 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
@@ -174,6 +175,9 @@ static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
 #define GPIO_INT_FALL_EDGE	(port->hwdata->fall_edge)
 #define GPIO_INT_BOTH_EDGES	0x4
 
+#define MXC_ICR_REG(gpio)	(GPIO_ICR1 + (((gpio) & 0x10) >> 2))
+#define MXC_ICR_MASK(gpio)	(0x3U << (((gpio) & 0xf) << 1))
+
 static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx1-gpio", .data =  &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
@@ -200,7 +204,7 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	u32 bit, val;
+	u32 val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
 	void __iomem *reg = port->base;
@@ -250,10 +254,9 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		}
 
 		if (edge != GPIO_INT_BOTH_EDGES) {
-			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-			bit = gpio_idx & 0xf;
-			val = readl(reg) & ~(0x3 << (bit << 1));
-			writel(val | (edge << (bit << 1)), reg);
+			reg += MXC_ICR_REG(gpio_idx);
+			val = readl(reg) & ~MXC_ICR_MASK(gpio_idx);
+			writel(val | field_prep(MXC_ICR_MASK(gpio_idx), edge), reg);
 		}
 
 		writel(1 << gpio_idx, port->base + GPIO_ISR);
@@ -266,16 +269,15 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
-	u32 bit, val;
+	u32 val;
 	int edge;
 
 	guard(gpio_generic_lock_irqsave)(&port->gen_gc);
 
-	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
-	bit = gpio & 0xf;
+	reg += MXC_ICR_REG(gpio);
 	val = readl(reg);
-	edge = (val >> (bit << 1)) & 3;
-	val &= ~(0x3 << (bit << 1));
+	edge = field_get(MXC_ICR_MASK(gpio), val);
+	val &= ~MXC_ICR_MASK(gpio);
 	if (edge == GPIO_INT_HIGH_LEV) {
 		edge = GPIO_INT_LOW_LEV;
 		pr_debug("mxc: switch GPIO %d to low trigger\n", gpio);
@@ -287,7 +289,7 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 		       gpio, edge);
 		return;
 	}
-	writel(val | (edge << (bit << 1)), reg);
+	writel(val | field_prep(MXC_ICR_MASK(gpio), edge), reg);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.51.0


