Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9780FCC9AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 01:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jh9q9oK8dJjZbCv1zZQGHBj+/iJ6bpxXa86B4nbEcvI=; b=jKisfLDOLNuNbZoLq1lSNtsDyb
	0gsAmXQuiKn7mKdKxyfeWO8PJJKLmcdc+IX+9DqxYYRWiCceHocY7sPghg/KM6IsXAE4m6rj0FcmH
	ESzxC5H9qXOYNEd8Bi5W6c+seOt4+hJKc/GoKLYXtYAkzcELX0ZiiAx6j0/hCQ9H3cTmsO/M9HFl+
	fv1l38zMbeUvPCwgCWUby6RIvJvJOtxqIYIxc7vBJjC0uBdmC5e9HrSD7nQK8/d4pZhn7hXt26Y0F
	RyIJEfplbSYFhPMFlWEF/giipnCy1Jc9W/bJlXZKfv2eTvbWynw0FxYMlhes6n0Fk9RvOP+/TvETV
	rWKE6W9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmKK-00000008XBC-3tIg;
	Tue, 10 Mar 2026 01:56:04 +0000
Received: from mail-westeuropeazon11011058.outbound.protection.outlook.com ([52.101.70.58] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzmKI-00000008XAN-2zpf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 01:56:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeN9AmKBfR9vJgbjIXidZFQsrGN8JSRyGSNrGhyfpmKVAvGY0HI7Wd8IC0D0Uj9WF1VFAQYusPQevVHobCv2ukde5KgBrh9cf5iPyNFAhwAmZ9+RPp0+s1ZKRYbTlgjrNEqZ0efU1znZgXjJa2jo4ZoLZ1lmqcVExKIM8mGWyL3QHWpOUYrS3UoJ1gvTilga96hGwvn0rYtLL3RnfIesOIAIbOmBeYPJGInSZxUfzhbd/KRLgocwZx2asOcpB19Mttt82yEE+mBY4yjFlxyo3edsEFsHuv4t2Vwh3Qu/V4WUxutWfaW3LYXjFsCsu+/EENJCMhYHyZOBqVabDJ1dSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jh9q9oK8dJjZbCv1zZQGHBj+/iJ6bpxXa86B4nbEcvI=;
 b=alGKBPd80V8OPg6qCujJlI9pMMJUZ5M8MdMrL1F5c/5CIhNoHuNdbHL4gihsYV63NuubCYxB0DzoHAGwQXWPW9N1AbKSGTB6NfOftxSenCMTLNOiutf//YWAy1i2GRhbG582YegH5UJL0dkLrpS71Wqn0Io72krshdxa9hec/Xd21u/8SZ1qM+OPWQ3nipaH6DmCPQ+UQu46rbt2ladaQq+b0Xqc2xCCp00iRPF7Op/HuadnNdfhX+cDPmFzgaKbT4R5LBrk4M/KZcylfZqEeQxWrGphTbYPvwpjpI/ZXQXhFJ5X2emq27UGh6wFM8uBUtPreJejqj7rBgWqSlEGSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jh9q9oK8dJjZbCv1zZQGHBj+/iJ6bpxXa86B4nbEcvI=;
 b=KZ3Pdl9uC71lrVP/G/mjYUTNiOc0a+1qFbDRADqBIq0PvHk9nVtjbBvI2xoOEh8ArtFbbl4E+hxxbskzPeLQUrN6hdV05XFzisAdAmIARaSAsBrzPB6jImD5cjUKnU0HjUh2QCieb3wGz1y8G4qpCmg02bWreXI//H6pYbYSZuka2k7vDgYqvuL2a5C7Y3ciEvXwlurZY5oXOZ3EIposT4oVm/pi78yBoVyKlyuqJCYYBzpbAuTFGyZCjWJGBE49oH2nIVjSGo2XjkKen/TxFMFN3oWmtAHz/SJwycY6NyXtdNE3lmr2e1SGRrZbpz50SkoSdliGCpabtOd8+0hHmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB9831.eurprd04.prod.outlook.com (2603:10a6:150:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 01:55:55 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 01:55:55 +0000
Message-ID: <0e321df5-fca1-4a45-a0b7-4d9c1a82641a@nxp.com>
Date: Tue, 10 Mar 2026 09:57:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm: lcdif: Use dev_err_probe()
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Marco Felsch <m.felsch@pengutronix.de>
References: <20260304140426.1499446-1-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20260304140426.1499446-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 162d9edc-83b2-4543-510c-08de7e482ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: nOc+YIH1yHyDB5w3RFBW27ImR0IhGNAOBkIhb4NA6vRh92Isb7xFeJAy18QSbg6kczM7jn3Bf1NRo9i8i8TwyiXCy4qlnBKqqg45CtRfyyKHHF/juRmN67NsDT+FFCdIpNIihUdYqMQFIXmPvTduN8scHUmH0qRWd8YimKdmz4+CLieAKW/3kFzX+xU/fY6Bff94bHeS4yOEUWSAESrfKtZDeUbmrUQ0elpueA9w+WjVp1xHgnG/uQyZd7rCIUsRbhPS7xwPAhQvACT/ADXImC9xEZyY0JInGGOZaVWoz34kZXqDmUZErtj7j89rqAfQ2DPjSAzD/CJwUhqvSzSVyu4rMgYoMqdavASG1qvjpnAHRrrLwJ3Ym/P5ez8HrRKTSkaRpRpVbtLCMnGnpf6Hy+Y/VEt6V6rFIw5izPt3EJ9EImj8wXs8sK3y4qVUs3hTe6ySZI5LXBGSMfe2zJqkK3NLY84bDXkxrtF2GqALy5rJr6httSNDAKIDbtJuD5C8IuSuF3uMm4l6dICGALd86pJOsfDh8jwbNuZFQcn8jkCdjyV/hiMmYtwuJDir4t16pN0VkzvLsY7T5Ir/txBuVXNoik5FHSS3Eni4OdYe/qhx60Z4zrXCfj/di7ebr511sNcLJ69QMRvTHMS+fd7Yeqf9WX4GtySKkT2/ijLc2N+hr4TBNJKnRlzN6/7VIwa/DcPDzMdZrfNjqzsFlXgIuvW0x14e5Ob+w7WQNaXsSvmHWBVgPkA3MS45NiB/bX0QSFBBnVF2gIirq59vcvqVPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVNRQkxDbW1xL0dnSFY1a25NTVhhQmVud0U1U1dLTVZIVjRRMlF6bzUxMW1D?=
 =?utf-8?B?Y1FRNldPSDg3bHJNc1BXNnNUSnNmbHhZV1JranY3MlBVayttRDAzUDk1ZGdr?=
 =?utf-8?B?WlROR3pwQWpTR0xUZmhUek9kZVhxS3hHVnQzamlkUy9xdjFPYkw0RTJRKzZR?=
 =?utf-8?B?dW9jSlY4bERocXdiYi9QQy90WFNrM2FRRi9rQXptdEhjNHBjYjIxaHB4RTVW?=
 =?utf-8?B?RHRrSm41UVJMVENHeWFRUmZ0VXRqNGM5dVl1SDNNZDFvZWFFejB0SFVSUDZ1?=
 =?utf-8?B?TGJpbWVpcnp5eWxjOXhzRFB6R1NZbjRVdmczWXVGNGNuYnV3amw5ZjNRTmtx?=
 =?utf-8?B?RUZVdVRNa0YxR0pHclBRUWpic3NONHZOdWp6SVZ2K0dUdmVnbjNsY09XaGJp?=
 =?utf-8?B?OFZPUlpaUzVXSlMzYUVnSGw4b1c5RXE0cnZRUVF4MDZFQ2R5d1J1SEYybjVX?=
 =?utf-8?B?cWlRTXZ5NlNtZGgxZ1djbXNYdjFNYVpYNnRwNnVWV2V2MTRTNk5wMzMydTJF?=
 =?utf-8?B?Q3NqbXZCL1BZMWJoYXdnUnhYOFkvRXFVbmFOVG9pNlNheENqNTJiVGRuTmVx?=
 =?utf-8?B?OGJETVRLZDVSNlRwc0U2QWFtUmkvL09VRWJUS2p2dTNTSjlFNllMNFVzVjhO?=
 =?utf-8?B?QkZ3VG9mZ0JkN3U0YUcra2I2T2lLc3lRaFl3QlJwU21FaWxnWjFtRUVtc2VY?=
 =?utf-8?B?OTJpS1V0ei9yM0J0clNGTElnbUtLYVUzNkNMQ3FEWWNsUmsyOU5seWVobnpR?=
 =?utf-8?B?bHFBcUtVT3hGd25zNC94TEpJcXpGbHdId2xRcmI5TUR0MDhBRE1hUU10bjdG?=
 =?utf-8?B?NS9STGlpam5jVkhHaVAzLzAxQmVLc2tSNTE2ejFkc2lPenE2R0p2dm1xWG94?=
 =?utf-8?B?a3FXbUN3c2FNc3MwblRuV2svTVZzaEJ0NkVLVTBkT1U1OWdzWEhTLzFqNm5k?=
 =?utf-8?B?SzJtNjZwd3JBbDYrcjZZM3dTeXluRlZ6SWxaTXZ4Z1JSQkVMYzJ5VGhsenor?=
 =?utf-8?B?TCtaa282WVpxVCtrbnB3QTBDSU92QUZKUUVsWmcyUDk2bzVlQ2lBUG5zTnhI?=
 =?utf-8?B?c290YVlZVkNzQ0s0bGtFSTl0MTkxYlo1M1hiZjZKNXhrOHpHN1J1RHlUaEZq?=
 =?utf-8?B?N01QdEdCckpLblN5UHVPekgxRTMwUVk5ejVneGZuSmNCem55anZMWkY2K3Zo?=
 =?utf-8?B?MGYzUEtYc3lkK25mNkVYeTRGS2FsOUtMdzM3VlVyNWpDakVvWnd5WXZlOU5Q?=
 =?utf-8?B?ZktNRm85M2ZHYUF1eitpdlRxMzNadnZueEJXaHBrVzF1MUdlWENhRlVwcUhl?=
 =?utf-8?B?WGhDSmJwTG5wUXlLbUdyenhIWTBRRmM5d1cvT21BSHpVY0p1OS8zRC9LUWZw?=
 =?utf-8?B?QUJVUklaZkFMcHBGL04rd2d4amRudzUweEp6UzBNU242aFYzOWJ0MXhlR3d5?=
 =?utf-8?B?aGRnbG9MVGgwT2orVk5ZbmxxMkxERHRwbHRFaHpzNHZIL0FFdjZjeHJQNGdF?=
 =?utf-8?B?Y1pZWk1nQjhsYldPOFBWSEFOWUVhdFl4YkNHMmF0SzBhUjNaSjNvOWVxcmtC?=
 =?utf-8?B?bnBlVXVoRHRHRW9va3ZlenZSYXBWRlhMTkJNbDc5STZDUlg2Uml4elA1Q2R4?=
 =?utf-8?B?NWFMRmE5QlVwaFNwRUV0STFmcjJHR3Rmc0VMd1JlM2J1eS9MMjROUDArQ3pY?=
 =?utf-8?B?ZnFEZzNVZ1BLcFE1RmptcjRKbDczd0lkZkpVaXZNb2h0a0dHQmQwZWFiK2Fl?=
 =?utf-8?B?T0hWTXo3cHFPM1R0Z0pLZHhuSzNESGlFRGs2YlJLVnhHU3VyNERyZEZIb25W?=
 =?utf-8?B?MnlhS3QyZUxka2ZoNWg4MEFJMWFTd29OZG9nWlZjaXNac0kvL2ppZHpBMEI1?=
 =?utf-8?B?U0hvTUNnQXFIUzVpcUhNYmQ5VGxvc2NVWmFuRHVPY1k1SjZHSWprM3FlbUI5?=
 =?utf-8?B?bkFjVlFKbHZIeW5KdnloaWNXYXZoNVRCZlJmZDVKRlN5NEFrQ2twbnZpcXBK?=
 =?utf-8?B?Mlk0MmZ4anNlbUN4Z1JkNVpqbUhNUngwaDc4WVZBRGI3bE11WE9JUTViTlEv?=
 =?utf-8?B?MDB5ZWZnUm42bVNFcFZSSGtocVh3eDdOcWhKR1N3YmNRZWhYU29mUVMvODB3?=
 =?utf-8?B?MjVkSk9IVXJaeFRmSDJkbzliTmhwbGtwL1NPWllzMmptRG4yR1dhQ1lDNlpE?=
 =?utf-8?B?OStTM3ZlMUJaK1U5UXZGMmdRMytBSjlUUFBHWXVxbHUxL1NrRTl6S0pRamc3?=
 =?utf-8?B?a05xMEtSMXF6b3lBNXlpZWZ2UVR2YkpNNWlkYlN1TWR1R2kydm81SzREcVBT?=
 =?utf-8?B?Yk5ETzBTemdBbDduU0FLemNEUDZBRzl1YUFlZDd4WDB3RnB5TERXdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 162d9edc-83b2-4543-510c-08de7e482ac6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 01:55:55.5820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsCyQLgi85NNhSIjhnqlWNYraZM109rWtjlrrk7E5Pmt86cWT/FFh90UsSplU/CgOQVdwfNGkxaS8t67jbDDdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_185602_759976_5843EF14 
X-CRM114-Status: GOOD (  10.93  )
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

On 3/4/26 22:04, Alexander Stein wrote:
> Use dev_err_probe() to add a reason for deferred probe. This can
> especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock
> 
> Reviewed-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v3:
> * Collected Frank's R-b
> 
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

I take the liberty of applying this to misc/kernel.git (drm-misc-next).
Thanks!

-- 
Regards,
Liu Ying

