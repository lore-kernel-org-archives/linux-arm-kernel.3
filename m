Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B59C18E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvuzt1LgfD7lshsurbTr+15jFO6jCyn46ulRYyR16dg=; b=J2DNZ1J1mkcEZQ40UbUIyCcYkY
	FToHvEUVivkTe/di3QBp+TPQn0Aorq51DuhZMitCwGz63/5eXrRvn5W+4aHQBW0hXncREUd44DZ6y
	dzhQsvnCboAuR76dTv7R+NC2j2Cz9txodRfgLADan3DgMZuLzGSAGVc7hIu/NUYPOsHHHJ15yEDrg
	/GSPxSNdTbZUaHJE7eq8WJW6CQ5rezhs/qv65TnX+EPIGzIFZIxQHWGD4zoapv8O6gHtHXjcpp7PM
	En/glw1uuPvWy/SUoFIJGCSRP+givy6HIHUDh6JhBQNHFScpO/A9TJF3WhelaKTvoRITprgHQkDQI
	5NM3E8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIY4-000000047kB-2NDx;
	Wed, 26 Feb 2025 14:38:08 +0000
Received: from mail-db8eur05on20601.outbound.protection.outlook.com ([2a01:111:f403:2614::601] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGg9-00000003ieB-1Yd3;
	Wed, 26 Feb 2025 12:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQO7By8+bhITxbY2FDWHytZIz/0bkLa/Mew3KhqM5OyIbtOCnpPH5bEb+UnQVmcXFD1JfedXYq6FGHmfiR/55CMBRsj8vilaNwxlM7TAUnCHYLyJ6fyBTaEF/M+L20HRIy6phHKtjUsF+xWgs33uD9l/qOzxsTd/RRa3yQOR4aRQ5l0/i5RQ2e/b4T2S9F3sVYpKCHnB3PKQu758JeiSKVKoLFxFYI58MICScKw24JVKNksk5pdVWAObnj7FPBC/Xr8EkKLh5HLTz61Dy1MlGFYC0WRtZd1t417aPKRIX6E/lu9i48bhuqrPcJWOeWQUequ7caOje2JOtt/zYi0LCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvuzt1LgfD7lshsurbTr+15jFO6jCyn46ulRYyR16dg=;
 b=HDEbXGXpieIzq/8uLJ8OuS2D/ijr2Gjoe0fBAR0vTHZ41ZZpE7ET7uEyGCh2n+u9UMVnFSNibQCmmEpbF0ujRVlUP+FWpJoRI63OkwO1S9X2xfoerIkP6tAOtLTIEjOyZjy7/cHUhWYtS4k4Gao71dhBipU76QrJKGULQzIqpZlgmKNH380IJgrWLnACiswrXCr2nxSMQk3yI1UqEgLjIvYivESSic5ahARIFQfuI2Qq39U1eWGFuVflR+UiVGOdgHcJ0hDvbOROW5eM2MRadrrs7bWaERPNqXZR2qcXgFVc0j350axPDmqv5KZGmSmogL+Q+vIN0C5dxOtWbOJ6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvuzt1LgfD7lshsurbTr+15jFO6jCyn46ulRYyR16dg=;
 b=DpRBgGkYN2XFJ00FMbBoszEFGkL83YBoWpEw+Nygdfbr+IRsnU9xDXUsE4BddaAeffuR3KH/v1R1xbLpCeJCh3/xT5uh+8ZohXycYYIZshFlr1XWPMplKTq4FCkr280mUCd9s3TfBBZlUB8Qw4hh7q0rP0dEFrSoxkupUQiYQ6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB8188.eurprd04.prod.outlook.com (2603:10a6:10:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Wed, 26 Feb
 2025 12:38:15 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 12:38:14 +0000
Message-ID: <02757b21-7599-4ee7-9f97-247b04ba646a@cherry.de>
Date: Wed, 26 Feb 2025 13:38:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] phy: rockchip: usbdp: re-init the phy on
 orientation-change
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, christophe.jaillet@wanadoo.fr,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250226103810.3746018-1-heiko@sntech.de>
 <20250226103810.3746018-3-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250226103810.3746018-3-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB8188:EE_
X-MS-Office365-Filtering-Correlation-Id: 14429453-32c0-4d46-d0a2-08dd56626e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHpnQmFFb2wrRm4wUDNWZ251anVVV1ludDVRRzFMS1c0NWtEaDh0WjEyNUdZ?=
 =?utf-8?B?R3pGWWN3cUJ6MmhlcFlZeFNPaTVHSTE5WmRUNUEzZHUyQktXSXRNZFdWeUJW?=
 =?utf-8?B?VWxJY2ZvVHEzNTEzbGpBd0Uyd0FxKzZ1TlUzRk1NUUZwTTVsSGRPWjVUcGdN?=
 =?utf-8?B?RTkyY2g0QVBFZnk2SXBOTXNLM2JIbytlTVU2S2ZlL3dUTVBTM01qeWp6L093?=
 =?utf-8?B?aDZIVnZVY3pQNnhwQmRXbGJSYkRXM2UzSlpNL3N4eXkwRUlkY3lUYWNmRDZx?=
 =?utf-8?B?M3VIUXRXak03ZW5uMjNRN0VtT2M5b2d6NkM0Nk5sYUFwNjhyWFdOTUx0d1hD?=
 =?utf-8?B?SDRnZndGdlVMWEEzTXFsN0kwdDFKNytsRkh3SnEwU0VJVVlnSWZCQ1A0eXdM?=
 =?utf-8?B?c3cxd09adGZIeFlNaW9kOU1nYXdkbmFvd0tOaWRoV08vellJWmZQbUNwZU5m?=
 =?utf-8?B?Qy81My9hOC9kcEczaTVhZHBSRUNtd3hXUjNGZ1NIUHVVWUd3dzZwRXJJSGEy?=
 =?utf-8?B?bVJrdTJKWFRPamEzZmZidEpvdmJ5U29ramhERiswc1d2QkpoQklpakxuN1dj?=
 =?utf-8?B?cmVBUVJtaU1jbjNFamZpQkhPc3FjY0g4YnVoRUMyYmkxM1lKQ0tuemt6eUZM?=
 =?utf-8?B?Uk4zb3N0OE5aeGJYU3pjd0VOdEdRUXI1bkVmbCs0bm85QUMraTFrK0gvMndk?=
 =?utf-8?B?WllNc1NtZS9MZEtKclplWWJVdTNvUlhrMHE0eGVkYmZtbm5MQkZvSlpiR0Zz?=
 =?utf-8?B?d0tzZGFyYjFvMThxMHUzek84TXYzMlpNVlVsQmFLWkw3eWM4a2hUSUh3VkJp?=
 =?utf-8?B?Y2pIVnBqZ0JXdThzR0NNR1hkSk5vTG9ibkxlOWFqcDV6QXliWGVnMDVicFpB?=
 =?utf-8?B?bzl4QWxVVm5TS3FoanhnZ3FRTDV2aHNuMnQ2dk53WUZ6a3grMUd1bFlYOG5o?=
 =?utf-8?B?OUpDWWhEVll1aDY1UXNLRG9uRjBFQkFEcGxMR1RVZTA3ZDNuenByMHFNem15?=
 =?utf-8?B?ZW14ZWJrNUpaNnNMaERkL0tTVUZuYithVnl6eHlPVWErNFllbnNibHl1aXdJ?=
 =?utf-8?B?OWtQbUpNV2ZVOHRUNFNJYitpaThiYURYZmN3eXg1QURBd2grMTlrbWdhVCs2?=
 =?utf-8?B?TnVGQll1YnMrcnhobS9zZGhydlI5d0xxL3lqelRjUnVERnlJNnEzNVVOdVEw?=
 =?utf-8?B?UzdUYXF1ODNtNWgyc0FBSjQxN1RPK0ZRbUVGaHNVUXNDREI3bmdwdlNwczl6?=
 =?utf-8?B?K0JXR1RPRXEzdUtaTmtlQk1NdkhWOHNOU0FrTzBnbXVHOUloTGFMemcvdkVI?=
 =?utf-8?B?akN4TnFrU0xkdXlCTmtLYUt2OWNrMms5akpINjJrZFNaYmh2WTVPU0U4SDQz?=
 =?utf-8?B?cHpLSWZGMytJZGxMWWVZYmZpWEpId3AxaWgwV2N1dkQ4cXJRQWJ1SGV6S2xE?=
 =?utf-8?B?bG5jSjNMUnVFemcySzZGZ09RbjgxWmphdkhTb2crR2MwdmlxT0VNb2lHWHMz?=
 =?utf-8?B?aGgzVjJpcVkyUXJTMGFxOFFlRjBOQ2VHNm9XWXRnZ0Rlejc1aHdVSFFTTGI5?=
 =?utf-8?B?em1XY0ZKcmxHK1pKTVZNZHhLeFVZUkc5S2RKWUFySUczQTdybDZveUVZQTRk?=
 =?utf-8?B?TmNPQngzaU1XYTUzeEVVNklzMlV3TEl3aTRZN09vVnJTSk1nODczdGJpdDA4?=
 =?utf-8?B?N0xiK2hSS0FjM0VFY2tORU9BL1RPbUNQMU1xdFpMUUUzTVN2akNkN2lJQlNn?=
 =?utf-8?B?dk51QmVJWnVQVVZGTXVJNjRvTDE5UGQzaG96UWU4YzNuS0REZG5rMk9EMXRN?=
 =?utf-8?B?dGV3d3JVS3d2QnRZNmRBRlozY3lLSUJFS05TYktOVFRpSHI1NlNYQ1pJZm5u?=
 =?utf-8?Q?k9dOCoSJnlhyy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJ0N0t1YmVsZFcrcDQ2T0RCRFZLRTExWW5kSWNGT0NmdUxVRUZ2UTNUalZH?=
 =?utf-8?B?N21VbCswcEh2QldyUG8yS1hUaXhFUTI1WElPUWZFMkUwck5SaS9naEo2UEVj?=
 =?utf-8?B?Rld4TEJPbjR2WEVIL2I5UXROY3p4WGR5QVI3dURhSUZUK0xrbjRhK0ZTdkNj?=
 =?utf-8?B?a2puQ01XY3MxYjgyVlNYZERiTENrS0wxcFNXd0pJN2JjOVpZTEFVaU05ZTZR?=
 =?utf-8?B?Z1ZheHJHSjE4dk10TDE5Y0xtR0ZPTCtQZ3NxYzVzY3J6WTlqZldzajhQakVH?=
 =?utf-8?B?eXF4dXdXb0E5OXdadFFYb3hKbldGZkNWUS9kWi9CWHg3TVVhOXJ3Q0dSemxp?=
 =?utf-8?B?TnA0MFlSajFUZklGM0RSQzIrUzdIRDJmb3paV2dMMzRQeStldHp1V2lKZG9T?=
 =?utf-8?B?RC9TN1VMS2lzakVOR2szZkVCUjFEenJBb3RiaHd5bjVYU1ErTldpK1Jua1dE?=
 =?utf-8?B?V2swL053ZGRyZHR0Q1gxQVdXdWZVNnBtV3JOSTNYYUFkbjM4dTIwSnJoaWc0?=
 =?utf-8?B?dWFIaE91YTlPWWdGbFVacXNrQkxyY204U3pjSVpadzRhRDVUeE1zbzVxWUZX?=
 =?utf-8?B?Tk5paFMza3Y5MStxVGtmMWVFTUFOZ3dJSkZLbC83TGNiQTZLa084c3BHVlBF?=
 =?utf-8?B?em1SeFlsTWxiVE8zRkVzN3V2OU02cUQxSFA3ZVp4dmFSL085ZEVXR0E2djFG?=
 =?utf-8?B?VVp1UU9IWE5jdVNEcG5mVk1ZNUp1NnFkK09WQ09hb0RRZkdSSUpPSEdJT2Uw?=
 =?utf-8?B?aXBMQTUxK0pDcVR5aVBQaFNvL3hIdGIzaDVyS0swazB6WUxUaC9wbDZSaDJh?=
 =?utf-8?B?Y3JRaTdkYVUxY1NMc0hCOS9hbXl4Smlrak5HMnNjcW1TcVJnWFI1TkdPQml6?=
 =?utf-8?B?LzIwTlBmKzdtYTlZbEZwT0lNZDBHeGNlNmhlQm8xN1hBL1VucGVlM2JUL3Bh?=
 =?utf-8?B?YmpyM1ZDT2oydXBqenhLUk5OUzcrUGRRekhhdk5OcXZ6RklaeVZFcitjNVRa?=
 =?utf-8?B?OHBoK0d0TVE4RzBmc3lkK1ltU2RPYWhWV0RpMW8vNkYwcmoraXo4S0dDUDVL?=
 =?utf-8?B?RG13SkwyM3dqejNwZUEzWGhlQWs3WDhhak56dnduNmlmMFdnRzhTaWREZEQ3?=
 =?utf-8?B?R0toTmVzQWNJenhDTW51RjhHM2FabDNMWDFMRjJxK0R0L3NuSDNab3lTQVBq?=
 =?utf-8?B?amwwSERqR0dibTVjZmtoVDhFanVIb2NqOTdDR3NNWjFEVWdHNDBIZk1CaEQ0?=
 =?utf-8?B?eUVZbDR1K1VvcmV0cGtsZG9lbWFIbGljMURBVEo5M0xRdzM4VGpPdWZCb3RF?=
 =?utf-8?B?bzh3dTI5Q2ZoS2FsNjhGSVRwWHAwRzZpdVVWcVh4U0RXSll6WGwwVHp4K1RT?=
 =?utf-8?B?U3NPU0FBYXlTVUM1WHNFQ0NCY3diVGRYZ2ZDcUZKbVVBZnpYcGsxY1BLOHRC?=
 =?utf-8?B?Yk4xRDZDQWhFVlVkbXlXY2VxVG9RRlMyVjlnSGpRYXRCbEtvUTUrNDZhWHFG?=
 =?utf-8?B?MFArWXp2MjRpaTNiVGFremhETkc3MHZ3bXhDdlFxTnBHbk0xTmZyS3h5bzc0?=
 =?utf-8?B?bjg5V09vblhlSjA1OFBLQ1NmVzIwV1RUdG5zR1RTQ0g5RHQ1STN3T3lRQ2tk?=
 =?utf-8?B?L1BSYm1EVExhQnhiak4yaUhFNDB0cjZIUHYvR0ZEWGR4UVd2TVMzaXFJVmR4?=
 =?utf-8?B?ZFdKNVVwQXdHb1FZRW0wQ21pQ3dFaGorc0lXWEdFbk8wRVB5UEZubUlnelJR?=
 =?utf-8?B?T2pZeWVUVkYzMDI1WHZvYzZ4bEcwdGIwYUp5ZzI3OUFzeStDVGZ2dFJaUnVz?=
 =?utf-8?B?YkQ3cGpwbDNMWEdJZFh1ZzBEMVVvb1F5NG1uMGdRdmQ0bHkzVzlPaU9qL2x4?=
 =?utf-8?B?RklzWWdWeFlyLzRQTnIvaFYrWDBsUlZpelFtcjNYQXA1amxha0ZpV25TTis3?=
 =?utf-8?B?bTFYNXA3Z2RTMVFYU0VZcjhndEpWbStURDJvSHlUVzh1ZERlbUNVbGxXcTl3?=
 =?utf-8?B?NW43TE9sTTg5L2RkUWt0VjVzZ01XaDlNSkRXSWdiODY0UnN4MWV1dEUxMzRK?=
 =?utf-8?B?QjlVNURCY1A2dWZiNU9rWWJRYko2ZEsyZVIvYkhiU2lxakFyU1kzTnFMMEJk?=
 =?utf-8?B?aklodUtXald1MWxmS2ttUUptOG1EY2RZYVMyemhDdVdtR3BvTnZEa1kyZUdy?=
 =?utf-8?B?UXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 14429453-32c0-4d46-d0a2-08dd56626e5c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 12:38:14.8063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ou5p6B665QZx2ts6k8yW4bMsoa5okY9Zs0KLA+kMMSmX8+mSaQbT2b9YzRxhVIL/wG+xfrN5STaenzytxzn1CWwRRee400e5qba+vV/VLG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_043821_425314_96F37C93 
X-CRM114-Status: GOOD (  27.52  )
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

Hi Heiko,

On 2/26/25 11:38 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Until now the usbdp in the orientation-handler set the new lane setup in
> its internal state variables and adapted the sbu gpios as needed.
> It never actually updated the phy itself though, but relied on the
> controlling usb-controller to disable and re-enable the phy.
> 
> And while on the vendor-kernel, I could see that on every unplug the dwc3
> did go to its suspend and woke up on the next device plug-in event,
> thus toggling the phy as needed, this does not happen in all cases and we
> should not rely on that behaviour.
> 
> This results in the usb2 always working, as it's not affected by the
> orientation, but usb3 only working in one direction right now.
> 
> So similar to how the update works in the power-on callback, just re-init
> the phy if it's already running when the orientation-event happens.
> 
> Both the power-on/-off functions as well as the orientation-set callback
> work with the usbdp-mutex held, so can't conflict.
> 
> The behaviour is similar to how the qcom qmp phys handle the orientaton
> re-init - by re-initting the phy.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Jaguar

> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 960cad5b01a9..c07b79da5b6b 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -1277,6 +1277,7 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
>   				 enum typec_orientation orien)
>   {
>   	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
> +	int ret = 0;
>   
>   	mutex_lock(&udphy->mutex);
>   
> @@ -1292,9 +1293,13 @@ static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,

Unrelated to this patch (but may be triggered by this patch?), I'm 
wondering how flip is really handled.

It seems like we have flip store the orientation of the cable, but also 
if rockchip,dp-lane-mux is set to <0 1>. But wouldn't that break if we 
ignore that initial flipped lane-mux whenever a USB-C cable is inserted 
in reverse? Basically, shouldn't a reserve orientation of the cable when 
rockchip,dp-lane-mux is set to <0 1> mean "normal mux"?

Cheers,
Quentin

