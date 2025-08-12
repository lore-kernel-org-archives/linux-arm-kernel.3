Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F5C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmKR8JpPWfv4WaNwQVhdrBic5IcFl/bs6GFja7W2eT4=; b=25N/6we86sOgqqwIc7UDzb/nVK
	bHs/Dl+wlCSV0PgaJSX2lcMkp2gZJgN7bOJxafDXDr3KPfpjCHgMNRs60USPK0Rs+00FdRXk/rS9G
	5ICb01F8qwEwoWcGm2lKpYBAmIpr3j/N1JQ5oVr954JV/WsF4SifJ6TBJDprfOj+4CJMikVgLdxiQ
	tvuVWN8HbwkZpnK2dke7HXVgLNHFDZJ12EB12938B+55t78DsG3Z/+ou91iIt4PoCz4jvtko+Pl2Y
	c8SuiLUqqcyACH0hXrmjom9leyApoAVG2LHBPHAVxKi0o8gcy8SWV/aF5Q/Q9eRbWuFkImyCWJHSM
	f5SLjmFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEl-0000000AhtA-061W;
	Tue, 12 Aug 2025 12:36:19 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulk0y-0000000ACHv-2kT6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:05:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWaE/kjJLoBIoFZ2kgWCppn+42kbftsW10MfOyKmqUt+BTZZv1xIn+9BRRrO6lcgCln+3LjPw9tdl8U9u8lAJ3EmpcmFeeaErkLuRamuVS6C6MmBjlOOwJV5kexvxjqrxw5F+RUiSe+Uz/c+p9MIku3vvtzriJYlRFOPaO2L7ljuWjXdDzAnr3y5xVl4YDchoo65/8DwxDKVPICfRuc2gYGzk+cTKQDzLlzUkBH92tLkbfxwuzCPfJ/e1X+2IR3nT8HV6PuBsMZR3JZ5yMoiEzw6yE82LMVOwKwAPvUssxGxd6tF3h+rJPLq/X+j1b2bgv6zpBNPEGLS7utG5nL9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmKR8JpPWfv4WaNwQVhdrBic5IcFl/bs6GFja7W2eT4=;
 b=WsXTkAXS4ya2WA3Bxzt8BYvWTuoCU1DZgMdk1NjXCkTjZV5ESP8wGOCqC0aakoiBTEbkfRVCmQw6hVWbl6sy6dHyqiGTcrYC62D0WsVenZmxtL4MuwJUkZUCWsz2Qw4Qc97W1WJ/C3+RTyppHEQtRcUCRo7YT06DMFY6iZ+zHW66vWHr8hHQvp8tK+68Luj0HHURGxuRB47FZ2YKE9mICQEbnOYm4otfPp0dDsXo6pi0gBfRRzODnde7yliko0PdRNAYN/bhSDmc9oQo3mdz8E5+TY3r/QPsF1KyJdJ9SfdMy4TcU0mDuDK4meCiYWdAMluye6P6i/An/4Z2K/VonQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmKR8JpPWfv4WaNwQVhdrBic5IcFl/bs6GFja7W2eT4=;
 b=hMhrUry+nw/wlK/gaEtr2JvJPId1B25V4ujNM26mu5UvRvNLRnGzKKpMc5QcfOP4BPHnRiGVvTjgnzIfduuT5duDeZABVYXl1F3cHZViA8JORIj7XO1FRkEXlHJyxs8EuUQl1JC0q0elNHrgDA24R+NlpOpIL1UYWQ70pPapdvNXAZLjo7Oici0T+xbJCOsoa3sqDvzUNml1aQ+st5q5A2W5gQabn6fC84YTWg2I8ZAiW7IN/GbqVfz9rHSJykGtUT2d/EWUyok8yJ5foYr/A2L4dabvoqcj2KbdWNLoIikA1A09aPpyCZZcFtovXMWMKC9fD1L35TKOA7uOD5YJrg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by PA4PR04MB7984.eurprd04.prod.outlook.com (2603:10a6:102:ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 08:05:44 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::4fa3:7420:14ed:5334%4]) with mapi id 15.20.9031.011; Tue, 12 Aug 2025
 08:05:44 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Date: Tue, 12 Aug 2025 16:04:23 +0800
Subject: [PATCH v2 2/2] iio: adc: imx93_adc: load calibrated values even
 calibration failed
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-adc-v2-2-0260833f13b8@nxp.com>
References: <20250812-adc-v2-0-0260833f13b8@nxp.com>
In-Reply-To: <20250812-adc-v2-0-0260833f13b8@nxp.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, primoz.fiser@norik.com
Cc: linux-iio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754985925; l=2548;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=BuYplVtqwSF4/83X8IuH8y3VzFoZctiAVrDGj6armCQ=;
 b=SZm9LdkxIH5kkeabHttNkMZ0wGgT4s0T188Ss3Ag5Qrd394NZoteJ9neN8YNgB6DsHz/9zIlh
 DjqNjpjoel2BHI9sDFEon9PSU98SL/aXisDV+nrSeA0NC6pGzhYUQp3
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR06CA0192.apcprd06.prod.outlook.com (2603:1096:4:1::24)
 To DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|PA4PR04MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: ada7a0e3-17e2-4047-7222-08ddd977097f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHdwOENDb3U3ZTVaVUNEMkkvb1VBbGhvdklyOGtDWlBUbEluU0tTZmxjQis1?=
 =?utf-8?B?MFpXTTk1V1FTYzJ2RmxrUzBtTEFNWU5WRHFSYU9WVU9MTVhGVzVGUk11WHhM?=
 =?utf-8?B?UEE4cnZialJZRFYxTkNIYkxVYVlNeXlrZ2xLVmV3S014eTBlYnhGYk5JQWQ5?=
 =?utf-8?B?OFQySlkyNVk2T2VoUS9iY2dFT1lVazU0c0pYaG55TjZwZytQK0MrWVByMzRK?=
 =?utf-8?B?bUQxdEZqL0gxc1JITDhpUy83WlVEamtUemt6Yk8rLzB0cVoyTEJBTFlYdlpQ?=
 =?utf-8?B?MEMvbXprcXZkVHphNmE3SlVLQUp3TVduaUcvWENCWHNBWFlWU0ZMaXJaMktu?=
 =?utf-8?B?TkFTYjNLZVlRQXUydFRIekFyZmpqUlMxazZ0cDBYdDIwZmlkUThBODFIMXVh?=
 =?utf-8?B?eUZyeHAvK2ZGSGtxVVNxSXErQ0E4bjhhbkhCdlRTNkppSi9jY2pJZTRvajhq?=
 =?utf-8?B?TDJuMG51bndGL2ZDYU1GbjJSekY2RTdMM3k3a2FDdnNkVm5uTjFZeWJqUWRv?=
 =?utf-8?B?cTduL3Mwa3R5cEV0MFBYaUdiRzNqYlJCbGpJNW5xU1c5NHgzYTJxdldDb0wy?=
 =?utf-8?B?Vlk0aHVudjF0TElZUnVEU05kL1dKdjA2RDB2MmVodjlWdjZLQ1BUQlNCb2t2?=
 =?utf-8?B?TzJHTXJ0bSthQmpCME9nSnd3QUx4MzFONU5LMXBUT1E3RnFFOHlGblQrTTZs?=
 =?utf-8?B?K2pjQVlrMFpoZ0xJYWpYb0xxZWNhV3lkclVFQ1V3WWFCdlB1eGZhMkp4RnJn?=
 =?utf-8?B?Y0U1Y2dac3NyWGxkcmFCVm10REoxUnNUYWlKOEx1UjFYVkpydGowb3ZwWUNr?=
 =?utf-8?B?RTYvYjdoVnc2MmI2RHN3T21zQ1lUZU1mQlBPbjlOeGliOGVtbFhlMnBPenA4?=
 =?utf-8?B?bWhacDc3d2JxcVZBazFDTDlEenQvNkI4RkFYY3NwcDJXdzNjTW15MkRkSS83?=
 =?utf-8?B?dUxFd0RwYjlZa3lzU3pNcEVsNVFGb3BhMmRmWHlaQmJXNDY4Slp1QWdwL010?=
 =?utf-8?B?QkYwVzZ1c3FWaG5tTzk5dG4xM2YzUjcyZVZpM0JmR2EwQTYyRjNPZThnRlMv?=
 =?utf-8?B?aGRBaUhPNlFIWHFKaytCb0hTTTlLcVZIQ3BZRy9RWjl1WEd2Q1FkbHNtS0pj?=
 =?utf-8?B?aG43WDgvWFcxMU5DOXdjY0NKRE1abDc4djN0T1VGc3NQekxHV3UyN0JnRStz?=
 =?utf-8?B?SnlYeEMyYTQwcklEMktTTUtaeDJvWkx5cFlmd0xaNGRCVmorZnBGTzRVc3hF?=
 =?utf-8?B?Uzk4TnFicU1TMVlQV24xTWJIc3FId0o1N2ZqaG0xSFcyYUNrZTNEMXEwa1dp?=
 =?utf-8?B?RTI0ZDkveUl0ZjFOLzZpWE5lYlp1SUs3ZlYrMGtHaXNkODZmanRsRGF3WjBo?=
 =?utf-8?B?RWJIRUVnRy9jU2RabUx6SjdxUDc5ckRsdWdqc3QyZlYxWW5OM3Y3WDlMcU9C?=
 =?utf-8?B?QUs2TUNEYjMyUkQ4Q0p4eTNYenlwSDNHTkpDVlo5eVoyOHY0bklaMTRiZWww?=
 =?utf-8?B?cnZOYUEzdVRoRmFxRzU1N0hiMmRkbnBIUjVDOXlPWDM3aUpsWlkxMi9GamRV?=
 =?utf-8?B?YUZIS1NzVVhXYnp4NmpESTJhbkRQS3Vsd29jQzgzNEh6SXFjWkFBY3EvMlBV?=
 =?utf-8?B?ZzRlbXA0bHh6bzZKTE91dFhIbWh2OVNXMWlLWUlEcVZETW40VUVCV3IvTnhz?=
 =?utf-8?B?VHhpYmswL3Z1NzIxaHpQd1JZRmpVVGk1KzY1endBM3lHUlkvRkdOeUdhS0g0?=
 =?utf-8?B?SFh1OEF4UjR5aVdYSjVCaUpmRWVLTjZva0doVTMwdi84MHVaRjA0bGxTR2Fn?=
 =?utf-8?B?b2ZGTEc1WVJxRGhpcXRqZ1lpTW1nM2R6aC9CSUo1cy82dm8xRkprRngyT2o4?=
 =?utf-8?B?REdWWnMzdzVtSXpaM1FxLzRVMU1oc2FseXlDaGtwMm5NM0pTOHRhTTRIMEYv?=
 =?utf-8?B?NHFQTXJpeVVUVWRGc3B6UVU1QkQyaHhWMkg3d0liMFFwb0E5L2tJTjk1RHZr?=
 =?utf-8?B?UjFxTTBubHlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzZGcW1HbVljbGdvLzNTd0Y5dDY3YjlYa1l0ODR5ajVUaUNwazNuL2t6aXNK?=
 =?utf-8?B?L1BmVjNjMzhMVHlha3Y2UjlDaGlweHVoOHdLNEZZNmhuM0JWTGNLMmR0cG9r?=
 =?utf-8?B?cTdZWExjZ0tHdEhoZ0M3enBQcVZFTERZbks3OXQxSXJFRGdYWm9TQVV0S3Nv?=
 =?utf-8?B?THN6UmZzSXVxNXI0dklDbkttV28zM3BkL2ZVUWE4R2hvWWx2MkRZNU5uUE4z?=
 =?utf-8?B?SWY5Q3F0MWVNY1FreWNmSW1yeWkxNnNqZlllTjRyaHlEL3duZGRxQWNTQ1pC?=
 =?utf-8?B?Zk9GOEk2dUJpZTQyMkd2WTdzYnFUVmpsS3RYUmRUVlRMNDJzbmVZSHRDVDRB?=
 =?utf-8?B?LzFBdVpwbnNsU1JHM0VVZitobHNDL2g5UWZWL1NvYzJPWXVNQTVmdlFya3RY?=
 =?utf-8?B?RTA5aFppMXgyeWhhbU5ndTBxUDU0STVCcWt4dU53OWVwSkx3NlRUZm1tRGlm?=
 =?utf-8?B?bjdwbmJVTllmWWVOWitMK1hCeHVxaXQza3RpcThPazk0cUpmSURxcXVxSVgv?=
 =?utf-8?B?QStlOXFsZzVsdXJSak90alFLSnF4VjBpUjR3dEF1dWErQ2E1Q1RuQjBxNERo?=
 =?utf-8?B?S09GdmE5RE1KKzdicHAyeG91Y0Y4R0RWcVdDVlBhN3dvMmdRc2NqYVhLM0dZ?=
 =?utf-8?B?NW9MN0UrUFJIREJTQ0p4Mm05Szl2aURlWjJGNWtBNy9TQTZvdzhWb284aXBM?=
 =?utf-8?B?QmUvalhJblNFVTJxWUlDdVlwSGZJRVBYUlhiK1NLL0svNWN2bnV2T1dCMHRJ?=
 =?utf-8?B?L0FOVVNBSkVmaXlMcGlyV3RRRWx2SUc2SDluWEhhUGFaTzN3VlNKKzdzekFj?=
 =?utf-8?B?QVJDQkZwVUk0YnhRQ0FwbUlsamUzeC9QbjU1SFNKYksvbFVxK3krT3h4WXc3?=
 =?utf-8?B?MFVuTElqSmh5bHJOTWJGVzNmUzcwY0lKRHJGQTFMZHRCODZLQ053d3ZDUHh3?=
 =?utf-8?B?dmRnSm5Ic0hUUGQxQ253YlhhMUdpNkcwb3pGK0l2cHY5SmlKb2tXbFFjRnhB?=
 =?utf-8?B?d0Q2dW1pbXMrc3Y3ZVgzb3NJenVPbDJZZ21ZSkRQRXFZR29mcGxvbFpqaXg0?=
 =?utf-8?B?YmpPbnBpUGs3d0FoeklzQ1c2ZlF1b1l1TjViRjZZUXlEcTZUWG5jN1FVV3dS?=
 =?utf-8?B?eFlJZ29RVGJVSHZ1MXYvaVlnYUJ6eWhGSWQxdDc4aG5oQlFkTXFBK2tRNVZH?=
 =?utf-8?B?SnhmaEdYMUtrajFhbS9mcGN6S1kvMXpjcHpydm40NnNNQUtMaTFBQW05SXp2?=
 =?utf-8?B?c0I4dWt5S3ZpUlZTbE5zYWo0OGd1T2hLMXNXNktzYjFOckFvb0lMbUJ6KzFw?=
 =?utf-8?B?REtuT0l1bVpKQ2VZNFpOd1pjREVTbEVCdVlHb3ZvbzhYMFh2VGJrUyt6cC9z?=
 =?utf-8?B?QWpDQWhpdGxhY3IxbTYyVTIwaXFXUnBseXA4eHJKRjRwSDM2M0wvSVM0c2dx?=
 =?utf-8?B?V1l0QVV1WlRucjdkaUJ0VGNqdzlwRS81bnNrRXVoVHFyL0ZTam9NZmJybFhP?=
 =?utf-8?B?aW5qa25vZ0pCWTYxcU9kMmwrdFhLdlRjSFk4eW5ua3RVYTd5RXk5UFRZTjJY?=
 =?utf-8?B?TnpaSFp3dEtjcExWODk1b3JoNk9VRHhqb2Z6OWpSaVZyU3Q3VG44REdvRlZr?=
 =?utf-8?B?NlBkaW5Hazdnb1NDM1Jzd1Q5VVFIaXdFNWVEQzZ0eTVIZWxOeFJpOHZ0SitK?=
 =?utf-8?B?ZCt0bEYzVzFjVWhjWkpNcHRVQytlTHI3eEZraVM5Mm1wanE4OEpKaHpWU0ht?=
 =?utf-8?B?L0xyK2dBMzNXbDJYTFY0MmhSVU9RZHhjOGJNRWpxc3JpY3Vza1ZETS9WeGc5?=
 =?utf-8?B?SEpzaXN4TzYydFFLWk9qUUdhaDIzMmthZjVLbWpTUU5NUndhYlZBYWJEZ1lM?=
 =?utf-8?B?eUpQRWxaUEg5b0szeUhJWlRsUTcvSXVSOC9RZ1FGcWtOUVBLcTFqb2UwQVFi?=
 =?utf-8?B?eG53WUt3NlhmaGZHN21XZE9ZVGdJUEg5Z0J5bTFXNXovMVphVFFld0pNUHNJ?=
 =?utf-8?B?dUFwTnczK2NBOFdyckIzRkRzWjNvMThDc1NJM0tMOC9zYWxkSUlkVnRpd1hS?=
 =?utf-8?B?RHhuZkpITTI1VXh5UTNzZFJQTDlZZ2EwUW5jQVpiT1ErcEw5aFUwWW8wR2FP?=
 =?utf-8?Q?pJ5tjqYnkpxUum03YzoXo/Tl9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada7a0e3-17e2-4047-7222-08ddd977097f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:05:44.2347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e3VtX6YBWRFltTFWljhVu7vdUuEljEgPZhSkiU2VKQe9A29oTXI8ugEtBIY0w2Yn6FKCV9tYqup6ON/Grp3WJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_010548_700736_5660CC29 
X-CRM114-Status: GOOD (  15.99  )
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

ADC calibration might fail because of the noise on reference voltage.
To avoid calibration fail, need to meet the following requirement:
    ADC reference voltage Noise < 1.8V * 1/2^ENOB

For the case which the ADC reference voltage on board do not meet
the requirement, still load the calibrated values, so ADC can also
work but maybe not that accurate.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/iio/adc/imx93_adc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/imx93_adc.c b/drivers/iio/adc/imx93_adc.c
index 8471737ac04a2bac0417a6397f20865f6a2c01ca..17b0a2548b0a3614ac537b01e28bc3144d17d6fc 100644
--- a/drivers/iio/adc/imx93_adc.c
+++ b/drivers/iio/adc/imx93_adc.c
@@ -38,6 +38,7 @@
 #define IMX93_ADC_PCDR6		0x118
 #define IMX93_ADC_PCDR7		0x11C
 #define IMX93_ADC_CALSTAT	0x39C
+#define IMX93_ADC_CALCFG0	0x3A0
 
 /* ADC bit shift */
 #define IMX93_ADC_MCR_MODE_MASK			BIT(29)
@@ -58,6 +59,8 @@
 #define IMX93_ADC_IMR_ECH_MASK			BIT(0)
 #define IMX93_ADC_PCDR_CDATA_MASK		GENMASK(11, 0)
 
+#define IMX93_ADC_CALCFG0_LDFAIL_MASK		BIT(4)
+
 /* ADC status */
 #define IMX93_ADC_MSR_ADCSTATUS_IDLE			0
 #define IMX93_ADC_MSR_ADCSTATUS_POWER_DOWN		1
@@ -145,7 +148,7 @@ static void imx93_adc_config_ad_clk(struct imx93_adc *adc)
 
 static int imx93_adc_calibration(struct imx93_adc *adc)
 {
-	u32 mcr, msr;
+	u32 mcr, msr, calcfg;
 	int ret;
 
 	/* make sure ADC in power down mode */
@@ -158,6 +161,11 @@ static int imx93_adc_calibration(struct imx93_adc *adc)
 
 	imx93_adc_power_up(adc);
 
+	/* Enable loading of calibrated values even in fail condition */
+	calcfg = readl(adc->regs + IMX93_ADC_CALCFG0);
+	calcfg |= IMX93_ADC_CALCFG0_LDFAIL_MASK;
+	writel(calcfg, adc->regs + IMX93_ADC_CALCFG0);
+
 	/*
 	 * TODO: we use the default TSAMP/NRSMPL/AVGEN in MCR,
 	 * can add the setting of these bit if need in future.
@@ -180,9 +188,13 @@ static int imx93_adc_calibration(struct imx93_adc *adc)
 	/* check whether calbration is success or not */
 	msr = readl(adc->regs + IMX93_ADC_MSR);
 	if (msr & IMX93_ADC_MSR_CALFAIL_MASK) {
+		/*
+		 * Only give warning here, this means the noise of the
+		 * reference voltage do not meet the requirement:
+		 *     ADC reference voltage Noise < 1.8V * 1/2^ENOB
+		 * And the resault of ADC is not that accurate.
+		 */
 		dev_warn(adc->dev, "ADC calibration failed!\n");
-		imx93_adc_power_down(adc);
-		return -EAGAIN;
 	}
 
 	return 0;

-- 
2.34.1


