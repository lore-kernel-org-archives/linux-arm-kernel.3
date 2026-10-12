Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C5DCA9EDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXZTmKkMcGuDeUTUL96BB720ckmcOKz6q8AGXttmsO0=; b=EtNp3koOtP9tWS8tDAcpcPK04a
	SyGOhboQs/xHVu9gZdii++FthkxQJDa2rNfDF3txpvV+0nYNazta13HlhYhG481QC3kFwly589dyW
	P7dCFCy5XybuSVIPVNpDX3aIg/LY1/V3/2dgAzFz9VDKu6KajPCeOqYlUxe9n/b4iweo4ghFrmRVj
	YwHJdNFA+HMAKRoFZ6l3gUikcEDMD6U6AtmslpLSB77/gBPgVJnv80ggKPmJ0Xk2AhVj6AgC2lNJf
	Dhc5skr/k08xjgk5TwY2Sfj62sIh2jZQcU8uOd+RvURc/dllFrsF87+MZEEW2mpehUMyMVyQoK+bW
	28U/95vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH3u-0000000Ah2S-2eu1;
	Mon, 12 Oct 2026 14:31:34 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH3s-0000000Ah1X-1Jel
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peIF/XWZjnCLOkLJJQfuA0f+9icPa91ie109RO+8LWyzyziSeTB7+oaigB/7BQwNJjnbopxjjoL+CeaxqsUqFQTIZcU32zDlAzLcLDCFBHqdGQHvjaYQe6FJ4Jsi9SM0hYAD+0loCFr4gVouIuBlZ8atNzsfrY5hUem+O8Hf4GOp40pTlQUza1/FlYvJ4PiOGkopCVUAtl4uh6wG2V0ELELgyigZK+noJ/So3zbEEAFgJivuseTK4v5/SMKAq6N0QshERfXyJKouatKtyfKmmhKjqqLNFPl3k3KfcvLvUa0J/beKXDcpR2JtabgXfz5vPxZGyfOkDgub8xSDnY+Ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXZTmKkMcGuDeUTUL96BB720ckmcOKz6q8AGXttmsO0=;
 b=vKZZbo/UBteJGp97s2hl8QdcfmebpDOHHZpjxcNWVN3xkHQarUyMvv6cFSwCGmqxp8+SPvXccDiFcPbLoO757nWxV9dV76cz8OdGE0mnXKalZ43541d7yZmN/Wpk/nGdg9mJ2+Yn/Hw8iN8Xrhf4WLLOMEkwYAuP/ErYEzpSV5VSqlpw+ICxJvFrn18Vnqt8naQyl/6PjZbt6W+Sibty9+iyvFiqmkwTQj+l++L1msaK+YL+HgWFmuV2kxLKgDF4hzXL3iTEGDVhGmq33OAXSDYuJbKw1v1rwEfwtDmW8HVXChGbFKUo+XVofo2XMPQ1r3qLMqihgGiCF355+ItZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXZTmKkMcGuDeUTUL96BB720ckmcOKz6q8AGXttmsO0=;
 b=yJOEKwHwkjb7TtQFfDefoxU/eMksvxP357Edo6UxiH5jNeZL2C+6pOm5tocqNHa/JaxXZyIOAECea5FfCGiMpOrwNQsIJJub3bDj7Xz1PuyTI+rmnUDmvhGzlAxuB2M2dnvpA6PBtU2pr4Lm77bJQkEqxbDsPGE31/vB5StCeonlBYU3UA6QmXHbwlTXfYRGc4t2GlJE1GQlsppQMQdlEnVjro+0B9d+g4V4ivGxDlof4wI3AJeI8yGsauHxoE9Qm/rTd6wbtjx8t1uadlQyh6SI7LL+HsG/2RwGjbm9mSCH77k8/XAJOE2IO5nTJo8oL98Pj3GadeEgaO2Jqvy3og==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8209.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 14:31:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 14:31:25 +0000
Date: Mon, 12 Oct 2026 09:31:15 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 07/13] gpio: mxc: convert pad wakeup compatible checks
 to hwdata flags
Message-ID: <aszvMz96uvVlodth@SMW015318>
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-7-cb47ce2ad758@nxp.com>
 <CAHp75Vdkh50W7j6oh9mg=DqyNu0ZZYX-aA0goqW+Knf0MmJ1ag@mail.gmail.com>
 <asyv6HK0c0VnpKp+@shlinux89>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <asyv6HK0c0VnpKp+@shlinux89>
X-ClientProxiedBy: PH8P221CA0049.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 598a3d88-ddab-4b60-e871-08df286d7e74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|7416014|376014|366016|22082099003|10067099003|18002099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: zUVTxd/8iXUCUdj7h2HALDQYGLZr8661pgBxSOORQVLKzQEaEH8+Je48f3JIyFHQC/c9HIR0mwqLZj/ncuGcrq3fwv9Vdje22NAVjigg6lOnTG1FxPGPo1u3WAZpPeODPm74Bq3R3UH9P1VaxgMuF+wMUzRSzOqfOJB8hXvytQ+7ECR8MJsYOz8KIMXj+vsuz061fMYIcLX8Yzwj2v/NOzZ/z2HJqcx7q1eJpGRbSX8QiCHqvEgqiGVDUathJo8rLe22BuRlQaOs26f0i3IGwr1o3AWSYrHhmA290p+BstVX5TnPO1Su+mQWosdDynpKYqALWsLM4gOY56f5JswRnN6L/V/kA5uv4VnIuD+qS6XvNjbpj7igRDUas+nhDT1Lj8vhUnubLEyb6OypMXfnLXZ9XrtGdC0VZRWzkBab1M/6P0GqiZvDZBZposHIulvzxNO7Y8n6pFuPh+Xxjj9/rC5TfEjSZoGSPW24HC7+2zKTV8XA/mK/W0aVyFpF2le780CQw4iOuwvGlM2+OG66y7VALgara0RgN5RrLAeIfb8NymZ+dP/E/mwGkzB0vh5l/m7R6hGP/9e7aiop8MB+GM/WKr4JvIoWOnJ3Xu12+8Kb2MqANRVNGOJr+sUCDIWcf3cPbliHzaYhBii1iqRrwLHnT69TTB15QFn+R2G75I4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(7416014)(376014)(366016)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUdWTjNEWTNJUlh4QW8zMWEwZSt1YWZGK2tqb2NpaDZQZVI1dG1hVEN1dTBR?=
 =?utf-8?B?VkhFM0FkRlg1RVgxVmpITjVTcWlmMXozUk9hZytIdUExVWtjRkN6cWpFSHgx?=
 =?utf-8?B?bVd1aW92WE1oS0VqQUpBeU1zVy9tajlYaE85WStVbmlrTlJUVTFGU2tCK3c0?=
 =?utf-8?B?STZ6cXlaVDlUMGtvYjBKQy81cnBrZ25IRVFqMG95MTIvb3dDaWQ5cFZSaUpq?=
 =?utf-8?B?YUlaTy9xM0RpaXBTRlNDSHRYeTJsVTZsRUl1S2Z4Y2R4UWh1N3RWRnU5by9N?=
 =?utf-8?B?Ni9xUkc1MXBMN0NCczc5YVBNN2tLT1YvOXJpS3hpbng2eVVCalhYemJZYldu?=
 =?utf-8?B?NHJlck1jZEVQTmc1aDNvbGZCeVZtVzQ5YW5zTTQvZ2RiaXh1V1ZIU0dEZ2w5?=
 =?utf-8?B?K1EwYWhXc0dZd2dMZDFDNjRaSUZGSmtIeWdxU0R3clc0WmtIbG9RenNkeCtl?=
 =?utf-8?B?NEtwSjRpbEovSnlqZzd0d0dNWXJqK0w0cVZXRVBPcG5OSUI3eXBwOHNtVTBu?=
 =?utf-8?B?WEJKbGFtSVBNUTBMdnM0Q0QveHEwV3FIV1JmY2MwU3c2cG1PK2JGUnIzUlNF?=
 =?utf-8?B?SU1xay9FMkJlVWtJMkQyNlNQSkhrWWFTMkVDalJLWlhQdVBQSlppdnhzcDRB?=
 =?utf-8?B?R0E2MFBVMEJ4YWtBOTlHWE9pR0kxbWI3OGJ0MG1YQmtOMVhLekxWV2x1UTNJ?=
 =?utf-8?B?bXJlSS9aMllQbks4YWNnL2NCb3kwV3BWajRRcjFVc2l4RGFROVVZK3hPKy9I?=
 =?utf-8?B?TDVLdnFkSDA1djRhalkwL3ZjMVFuR2JncUsvZ2k1WUlOdCtxVEVCbmZuTWJP?=
 =?utf-8?B?b1AzQU9aN21oclhsVldLbm5DT2M3UFJDQjI5N0VZTjdJcUlOK2lwQ0g2RWMx?=
 =?utf-8?B?TElqOS9mRkVwV2pnWXQ3S0JiaWxOcTkrYXVtcXJjcHl6MHczNURvaUV3UXVy?=
 =?utf-8?B?NVVMVU9mTG4vTWZ2N01nUmpzMmw4ZkRPWTdkZEtyV2NsMUVCU0g0dVBtNzdM?=
 =?utf-8?B?VDlBbzltOE54TktCYjc2alBSdDBWbFJ0U1Jid2dHNkxJR0Y5UXdIL0VZbVhT?=
 =?utf-8?B?M3pQbUNQSi9sb3c3ajNnYjVIMSt5eC9senRrc3BCdjc2TXV3dGxiU1NLQjFD?=
 =?utf-8?B?dFc5Zjk4Z1lBb0RUV3F4eUMzaUhzWkZ1enQzRFFaWFZnZk43aHBXd0pocnh6?=
 =?utf-8?B?WE9HYmh4M29wbzlXUHRHb2pqclJSZnVrOG82ZURqZ015WHh1enNXbXdOcjUw?=
 =?utf-8?B?WHcwQkEwV1FyMC90bXlIR1RyQjBCU3ErR2RrckVWeG9aYVZWUWxGSVRkT1dm?=
 =?utf-8?B?TTd2bXBsSFdENkpCSE1oMXpucjZrZ21XR05jdnRwUE5xZjYxVXNUMktCUldm?=
 =?utf-8?B?YlZOcUJmbzFoWVhaYjN5ZWRlL244bVRUZzJsdmMrUXZzZ3pyWTJ6MmFrZ2FW?=
 =?utf-8?B?OFlWYU1qR3dVQmsyOU02b3ZFT05TSDBVdlJmd29DK2dOUUhCdUg1a1dnVE0r?=
 =?utf-8?B?cm5lUzhjVGFQZEtkVnJtL2ZlaVNseHJLaTJwalUyUzZiYkNSMXlTRDJWY1BX?=
 =?utf-8?B?OEU3UUpkZWVTTG9JdVJkRVVhK1hsaXFvWUhyZzFlcDhCQVRETWxSbHdSQkFJ?=
 =?utf-8?B?aEVKRGxzUU5WS2VDUXhWc0xwRUtXaXNIQlJOM0hJRHY5amp5UWJZcFdya2Zv?=
 =?utf-8?B?VlZYa3NqblcxVzRDVkNmMVRsSkNwQ2srUHEwMHJSRnNYUzVpeWZuVllJdTlD?=
 =?utf-8?B?S1BMeGJjVkNuc1VMYnQvUDVZc0JMWGFFYUxKZndzN253NDNNM3VDQytlNGZL?=
 =?utf-8?B?SkQraVFRT2JxT1RybGNNbVdaNVJSZ0IwQ2lZR2RwTG1sdzRtN09tOWUxWGR0?=
 =?utf-8?B?eUd6Z3dmRDl3VjZOTzBYYjlYRkdsUUZFaVJHVWxuWFVPei9EemZwNy9QVVVs?=
 =?utf-8?B?ZjYvZVpxUXU2Q1pvUkRQM2xva3o4RjBGZ0Q2M3NNS2psWUt2UkQwU3M1MWs2?=
 =?utf-8?B?VkR5N0xlU0NrUVkyVEV5TzVRbXh4cDcweVdTdmN4N1kraEJ0VkNFTzNJME14?=
 =?utf-8?B?VlVuS21QZ3NhSlhvdmlJK1p1Q3lhSE5sWjhUMGdCUWRJTUpZdkVpdzhxbkFL?=
 =?utf-8?B?VWZ4bk1uWWdHbGVUZWdxbE1RbVhUNTVCMk5td0FITVFtUTZxaWNFWFlzak1l?=
 =?utf-8?B?cGZtK2NONE4wWmNWSW1oQmlQRkNtU0VYSHdYYVlvNVFLZytMS0xmMXloMVkw?=
 =?utf-8?B?VDZ6cUY5L2FwRUZYK3lOWnQ0MFBqL3IvNmd3azFpK0dNNno2Y01neUdnZ3ZJ?=
 =?utf-8?B?bG91d1MySHRyUE5yMTdmaGdKTktVQkxLYkNGZHRlNjUyMVIvOFBVRHdjSUVa?=
 =?utf-8?Q?6MQiI95UyGLIr+qpNQl6MVDfOZGx7ELR8I4B+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598a3d88-ddab-4b60-e871-08df286d7e74
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 14:31:25.2403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tN2y4/LcZMYaqh7/KUhVmZWWbHhp1pQullhnRr4j/v5FQUeegjYXQ3w/NyTtxnLZIo1j+aXPsXle2NyemWjaUnHhpPmabvqA4Hkltlr/1GwqC3NlJxR8JWFPegw+Jw2g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_073132_358203_E95EEBEF 
X-CRM114-Status: GOOD (  21.16  )
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

On Mon, Oct 12, 2026 at 06:01:12PM +0800, Peng Fan wrote:
> On Mon, Oct 12, 2026 at 12:27:24PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
> >>
> >> mxc_gpio_generic_config() and mxc_gpio_set_pad_wakeup() call
> >> of_device_is_compatible() on every invocation to determine pad wakeup
> >> capability and i.MX8QM-specific behavior.  These properties are
> >> invariant for the lifetime of the device.
> >>
> >> Extend the hwdata flags scheme introduced in the previous commit with
> >> MXC_GPIO_HAS_PAD_WAKEUP and MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN, adding
> >> dedicated hwdata instances for imx8qm and imx8qxp (also used by imx8dxl).
> >> This replaces the repeated device tree string comparisons in the
> >> suspend/resume path with simple flag tests on static per-compatible
> >> data.
> >>
> >> While at it, clean up mxc_gpio_generic_config() to use a local ret
> >> variable for clarity instead of the == 0 comparison.
> >
> >...
> >
> >> +static struct mxc_gpio_hwdata imx8qm_gpio_hwdata = {
> >> +       MXC_GPIO_HW_DATA_COMMON,
> >> +       .flags = MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN | MXC_GPIO_HAS_PAD_WAKEUP,
> >> +};
> >> +
> >> +static struct mxc_gpio_hwdata imx8qxp_gpio_hwdata = {
> >> +       MXC_GPIO_HW_DATA_COMMON,
> >> +       .flags = MXC_GPIO_HAS_PAD_WAKEUP,
> >> +};
> >
> >Okay, if you want to deduplicate that, make another data structure
> >inside hwdata, or wrap hwdata with flags. But really, kill that
> >definition.
>
> Ah. this would need more invasive changes.
>
> Bartosz, Frank,
>
> what's your take on this?

I think your change is good enough. If need, we can change in future, which
only impact one drivers.

Frank

>
> Thanks
> Peng
>
> >
> >--
> >With Best Regards,
> >Andy Shevchenko
> >
>

