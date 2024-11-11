Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C407D3ABD6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 17:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8PL3sfBABFMHxWVX8328EQ2AURBXo4YGLVX6+XvSrAo=; b=ASaQau1GV3/wj+TPCdQkC/CoKc
	x3G/Bx2vdH87VwaBlS3K6E25geDC9foRQBckV/kapnGwcPfZirmJY2xNjh3ZC60vAvFEMpnnOhpoG
	wieqwX0S8kvEo7xFXwFlGmqKJ4CHs/mm5VmeA3NLh5z7RoxyEFcqHt//d1Dgb4s2FTe69VXeGdmsd
	YgJT1b8HjsFEE0YHBqtAsBrYDW2CZ2aW8afqcLtQ8D0Rk4Pq+DgoQXWJ1dM33788+XzPVNECmh1pk
	s/GqTNqYEOf8/tSt9EqGt852TVxd9qJTRhrvy+9uO4QASiFDWi9Sbu4kzzlNWHQN91eqLHTr+6F89
	7Roib/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYO0-00000000kZZ-1TXI;
	Mon, 11 Nov 2024 17:39:36 +0000
Received: from mail-am0eur02on2061b.outbound.protection.outlook.com ([2a01:111:f403:2606::61b] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYHL-00000000jCr-3t3u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 17:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PtgkJ7NuThufSm9gq3fvSf9TnlVGMqUkTLvxs87CLyd+M4ayK1afzXj7FKKkd9r9+nOjrbfeegQt/6RhfdHwj/KdUBwIglMglYYsDCqndcBdjuYDbRW8T6b6Ij6SmO7iS1WJjci/QSqIwtrJSQmlmPIb41sENtSfCADxdMOXnn8u+8JrwmVvFuOSRMA8EL79kHBH7zzjUSvTeMG6F7NcPJqdHnbZ+DqoymHj1OCWRK3fuMMhUFH8LfW6r/WDjzA2QWDK6419w1K/z9YrUokKVH/nTJqVPbskVhCsddKMqL1VMiSVc4hFrQa2EmdxuAKwPLSg0PoX/0IGnV11OWKDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8PL3sfBABFMHxWVX8328EQ2AURBXo4YGLVX6+XvSrAo=;
 b=nYSW8WFkdq0Oo0MjLOpzvQ4RDtROq5kdr43CGahca6qOUsc0QtPLwoH70YZB8/2lIOIzyA8QlC1PCFJFMNtosTWrQG1ba67cUfqgRS8T8mAjiVZzgjnsxzb0R070YGXZhJhxqzFw58zyqyFSjhkXl+iBTGJww9WnN/Op3a4QuJX8+UD2EldIxKyOtB1OTo+IUo3r/VOZzU2L5v9T+qFZN2g30oOse2yvzFCnzr1SIu2xJI4clcb2jKEM0KFN1ud3v2w/TUy20chCOM5G2qNE+VsWoXsKcnPAfM8pSjlxfxuNldDH+xQ13gV+cAyJZ+CUlNf84/dWrf4mje0auOKCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PL3sfBABFMHxWVX8328EQ2AURBXo4YGLVX6+XvSrAo=;
 b=NVoI5pMn8RbsSzuWM43xalVHoDzej+MeFWVjEU1uwYJBd1mFguCq/xNEIbzSJz+IlfdR2aWqOaqZCTlRODG0o/Mnhll+2rt6CntIqnjagGYv2zzXOgKr0cCKtENC5Accx6uaF3y5njrnHfT2lKwxfsf9krRmPIwfYD7L1ucCprLeJ5oJwXMpeuy+z8Tn+sAusy0a38R8cf5Y/S9McN+fKueBiKDGmD+x+2nrPJT1DsIa2XPqoij9jqma5KiNCP01EjtQ1fM+WnmtLKoNejj0pNfEvctI1sqYy7kf6GjMka01fxs7KuJXatk3xbzsmuYCUoXqiIoUEtnnzd7CiGBQag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10086.eurprd04.prod.outlook.com (2603:10a6:102:40d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 17:32:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 17:32:42 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 11 Nov 2024 12:31:59 -0500
Subject: [PATCH v3 2/5] hwmon: tmp108: Add NXP p3t1085 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-p3t1085-v3-2-bff511550aad@nxp.com>
References: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
In-Reply-To: <20241111-p3t1085-v3-0-bff511550aad@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-hwmon@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731346348; l=1810;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=TiawW5mUcZ1qwCQdS36zCJKhOJAtTITu0JJSFb58/60=;
 b=RDEWCVGIbo4Q758cjd6eCJtbIgjm6KncPtQy3WvxcVP+QTpi5n4uVPowL+bORR2JZlCRmYIgh
 preu34irbY9CNJL3b9fUa1BQi9Kx2wj/Od+nBMBMRnksNL4g8VXUZXA
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
 To DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10086:EE_
X-MS-Office365-Filtering-Correlation-Id: 6200731a-30ee-4cb8-0510-08dd0276d8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEtYajdEMnFtRDFUZWJmQVFYTW5zZHMwd1Nzd2FuZnhMZ2pkUlc3UWVkMWk0?=
 =?utf-8?B?TlZsSllxRnIxVjBxSXVNTDNnWndhZkxSZlNCK1pzQnNzWDVqbnpCR0VkVjZv?=
 =?utf-8?B?SnlhaUdCL3pvTm1uZVc4ZytyaGlITm5IVmlqR2FHU1BPYmZheGVLWjJTbDFp?=
 =?utf-8?B?YU1xSzhVVDd1OTRrVjBTSUFGL2Rocm11bUV4MnFlQW0wc3pjWXh1TXY3V1o0?=
 =?utf-8?B?UG5PSzE1OEVVbU41RnpzaGFadW5MaXByODhENlhPcDF3TzVSR28rSlpid2du?=
 =?utf-8?B?ZjNlanBaaEhHaFJqMTBNbGIreGR6N1ZWUVVQcCtWajlOQ0U3d3RmZjZYQXVs?=
 =?utf-8?B?ODVqNjZObzRxVUNqTG0zaVkvUHB4eFk1ZDVjYzhvWDFrSUlqbW80Q0xLWDhK?=
 =?utf-8?B?OUIveWxVQTRtakhIdUdFVzlqMzhVNFNia3dVQ3VOMmxJczZUc1NiZU9VYjEz?=
 =?utf-8?B?VEptNCtiQVVOV3pQMzRhWjlQM2Z6SmsxUEY4TmJUTU91VU5QNWlPUzRDWjFx?=
 =?utf-8?B?dXJTcWw2Z2p3QXBoMDlzaUpTb3hmZmQrc2VreUQwR010Z1d0NVk4ZkhpWkxw?=
 =?utf-8?B?c2tjb1lRM2RBSUd6VWpsNHQ3QzZJRXVKUlhaSmo3MXdGOSszT3VocHVKTDVE?=
 =?utf-8?B?V3c5TzdtbmVrUHFVeEFUN3NiVjhpVlhwNW1lek5hU3JINkdxRXJ6anBFS3Ew?=
 =?utf-8?B?ZjB6QlhJT0Ira1EvaWs3bERFbEVMSWZuK210Wm5BejBkb2hKejlQUTBnSjFq?=
 =?utf-8?B?aTdXL0t5djRQZWNpbXFmWWh4SzB6cExrRlhVTmNHNG0zZmZkbUluZGRlS3h3?=
 =?utf-8?B?UjBWdzcycjQ1NDdhNlU3K3RTUXUvN0pDMEpNTnBrelpzeWc4MHB4UC83SVk1?=
 =?utf-8?B?TUVyWUdTZnhIMEhMb2NMOFJVT1EzK1h0a2pxQ0dTcjZLdi9uazVkb3hIa0wr?=
 =?utf-8?B?TllwYzAxeWdXcjFqZUxwejIvSzJoQmpHTkNCd3ZaSlZHRG91M0ErbHhDNXd5?=
 =?utf-8?B?b3dIaHVzVmtQRDlRcFpIb25TSUJ2QTUreTcxNTJxTzl6T2FEUHB5NXdjSmxt?=
 =?utf-8?B?WFh0WlJ3L0NEWEExVGp4S1ZrMGprcFdXTitDZzRIZmJvUFlsQmc3eHVoaWpp?=
 =?utf-8?B?aUFDVzYrNmcxVjY3ZEtneUoxWThnRnVvWEFqQ1R6ZmhmUEFlbVFnYUhJRVdu?=
 =?utf-8?B?MEVhUnU3M2RsWHJOZEU0dTVmMjlQVXdWajdkMHNEblVRdVJMbzhVTmxSVjlk?=
 =?utf-8?B?RHAyQUlDOWFtSlJWRUlQK1JORWhxNjZqdFFDY29YUG04VFpJS0swZEFYQWpJ?=
 =?utf-8?B?RVB2R2pGU1RDc0tPUVpkeHV6TXRzVXhRYkJhWTFaV2NnQUVzWkpXMFVpdENM?=
 =?utf-8?B?UTVpcWFSY3JJeUw2bmhsY3VvT2JKeHQwV09wckF3cW41NEhlVnFKRC8raDJz?=
 =?utf-8?B?OVh6bzZsUHJGOU0xZ1AyV1ptNXpwL0VXZDZGM0lqaUJVaVFONE11MXozeUsz?=
 =?utf-8?B?SnMzMUFKc0ptYlpGYmFweG1DR0cvcjhhUkNuUXhDUEFCK3ZoNzIzbGpzMkEv?=
 =?utf-8?B?OTA0THN1eXVXdGV2MnR2MVJXOWxsOVB4b3RMRDJ1ZjYrUUpkYkpYZUFpWTEv?=
 =?utf-8?B?dkdvVkc3UEtJMnFZM1VnZzV0Mk5WNURjMXo5dFEzNEpzOXJVL2FCK0xwZmVu?=
 =?utf-8?B?Q3V2YTdTOXFKZzJTOU9laGJTeWgrK3pSM0tjeTRSaEswSXZoSXlqbnd2bFQr?=
 =?utf-8?B?UnJ3OGRvdCtVTEEzekxLQXc4UFk3STBIeVlHY3pXcUZvWENTTG82MlQ4YmI2?=
 =?utf-8?B?T2NHbi9lTG9GUWFTS2NGZ0RQUE5YK3FCU2pUeWZmSDFDUXF0b2ZrVzZueTk2?=
 =?utf-8?B?Q1FPK1pZa0FRRkY4MG9sUDZRa1Q4MkJMRjRsMDg3b3VBVHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anJZT1lCY1NQWjg4eWYxRnBZR2Rvb25LS0hjNW1POE1lc1N5bVhSZXQrYUxo?=
 =?utf-8?B?b2s1VUJrMVNmcWtrRHVjbjNOZS9rYTNnTTdkWlpiUUxpemhRUllmZkhkTW42?=
 =?utf-8?B?UkFqRDUyUzF1eGpvdTFLOElKenViUmphWVBqcUN5YzhCTzFaMlp3MmJaQ3Z3?=
 =?utf-8?B?Mm9wTVhhOEJFNkJjRkEySEtxRXdsZVQrYmNURjlzNVBZbVpGa2RRWnJuUkdz?=
 =?utf-8?B?RnhlQnZHQWRibVpGTFIxS0p5blBkL0cyZnZHRkVJeXJVMVNrcWx1WXdpRmpk?=
 =?utf-8?B?Ni9SMVpYcUVGWGhVcUJ2VHdPNnB6bGMzL0w3S3l6Z0RZbWU2aGFNWEM4RnN2?=
 =?utf-8?B?RFBBclZTQyt1TUFOTHQrYkkrQVRYSWdsZm1kTGJNcDI2SE5lZ25XbHRmZWdD?=
 =?utf-8?B?ME14SVVmc2gxL2tmM1lGVXJrVkxtTXlyckMxUUtQL1hKanZsclB3blVmZlNw?=
 =?utf-8?B?SkFsMmxpN1czVURZMDhFVHl1eG5Qdzg0enpRN09HMXlrRUdDVys1T1FGUlhU?=
 =?utf-8?B?OGRqdWw2RVBTZko3N2Z6QXk5WW5FREFCQVdlZFJlVmx1cjJ0Qnk5a29DanNO?=
 =?utf-8?B?ODBjOTEwWWNZZ21aWFl3bmo1L0plZEliZEVUYUtuWWlSVEJoS2JZOFU2K1d3?=
 =?utf-8?B?QlJ5cHo5L3N1UndZdkkxWFJobW9RVCtNT3gvaHNkeXBZcEFxWFk1dlBTbjY3?=
 =?utf-8?B?SGwxb2ZrajIwek1WWWxvSzFRS2ZNUHJJY2t1a3Q5V2ZSV2Q0VVJLemJvUzZR?=
 =?utf-8?B?LzVGeURsdFd5WHpsa1Q1MExKeUpUcHJWMlhhRFR0eGRWR2g2QlRDYkNhVXFR?=
 =?utf-8?B?NERVWVBWRWZkbE9HcnphUUNKQVZxQkhOOEN6dkF4YVhSK3FYNms5cmdZdEdz?=
 =?utf-8?B?MEUyZFFGbUVZR3ljMlBsVmo2emxOZml0QVNPaVI5MGdVZlV3MDJtdndlQW1n?=
 =?utf-8?B?dktSR1FyblZuaVIrRi9NRmlQNm9vN2pOZGVUNlZlcmREV2prOHpSVTFpVWRW?=
 =?utf-8?B?MVlDMG43OHUzSXAzM21palBsUGx6VGJ6Y3BRNVRPemxjMTZKQ0hmNVpGai9H?=
 =?utf-8?B?dmQ4cE1pZ0tTNUVjWmpyMTNJVWFsQWdrbjZobkVsTjAvZ1VRNUgwK0YzbHc1?=
 =?utf-8?B?cHVzb1JkWnpBNldlMHVCcHFFZE80OGtOOGRjWmI1U3R6aHQwOTIxNktiNkpE?=
 =?utf-8?B?K3lTQlgyT0xpT0I4bFNnZEtqSWdiSE5hL0hsMVFyditnRjNSUDI1cm03TlJt?=
 =?utf-8?B?YXEyYjRHb0o4VWEzcnpjMlFRWGdqbnFjQ0J2RnNFQ21BREZ5Y2V3d0xrMkRB?=
 =?utf-8?B?OVgwVS9VRVN6dFZCUWluYmZDR0VySDg3cEEvWFdkUjFoRXI2dG9BZGlvNENQ?=
 =?utf-8?B?QXg2MWdBbHFqZkpDbzdSTXNCY1c0YUE4YXdFcjk3eGxyY0NFUUdVWTdQQmdh?=
 =?utf-8?B?czMzelFscHdUVlNmTHU4M2lmcEFiekVFdTJhL05RNmRWRmliUUVhQmJxRkRn?=
 =?utf-8?B?ZDFMSEVWRE5sZVFidi8vMmhvb3JiSTFaT08wQ0lKbC9tbllDUzdBZktnODd3?=
 =?utf-8?B?RjZMbG4wMG45VnlqQldsbjIveDVmSGcxVHZBSW5ySGdvemx5Rm5QMDU0UlVT?=
 =?utf-8?B?eC9YdlJLbjM0TXRhT3ZnT3Q5NVdqMGUyVHIrczdIM3RxR1dYb1NrN2lWT3FC?=
 =?utf-8?B?a3o0elA2bkFUdDhWc011YTFJbU5GeExsU0ZWaXJhV3Zqb1Vjb01Mb1RMRm9l?=
 =?utf-8?B?dnU5eUN2SjRDWUttM25pL3pLcGZJZyswalA1cXFyQWI3cTVNSWxLVm9GbWVZ?=
 =?utf-8?B?RzRsaGJyaCtCRFZha0l3dXRRUzNoZ1FQUEY2YU5yT1ZkWmNwMDd0SzRWRUh3?=
 =?utf-8?B?R3pRa3VmQ0NOcVJVM2tXUjdUZGlUWEc3ekVUcG94TjYvTWhUZkZVOTFkL0dm?=
 =?utf-8?B?T2Z4Qi9OT21MOE9LMGFqWWIyQ3MwdEhiMWg3QU9qVWk3N2lIYzZVSEw4b0Fj?=
 =?utf-8?B?SXVqTENjc1R5allGbHkvc0YrZ1gwSWdLWnZQYjhGY2tVUWVBbWk1OW5OUm4z?=
 =?utf-8?B?Q0xaSG9uVEFHbnFaeE1CcVJUT1VOT2hDYWF0NHNSUC9WMHExZlNKOE9LQnJk?=
 =?utf-8?Q?bhFAdr5VFPCDihn60HhQjhrQY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6200731a-30ee-4cb8-0510-08dd0276d8d4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 17:32:42.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSi6VE/WyzpstP51Y4Ak4o3Lfp4Sb91NAaga/mAixP4QNeP6EfWmely5adgmvMYNvg8VgSxrmBRiPdWvoXTHqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_093244_112511_6EB4B899 
X-CRM114-Status: GOOD (  14.41  )
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

Add compatible string 'nxp,p3t1085' since p3t1085's register layout is the
same as tmp108.

The p3t1085 supports I3C interface.

Update document tmp108.rst and Kconfig's help context.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
- new patch
- update documment
---
 Documentation/hwmon/tmp108.rst | 8 ++++++++
 drivers/hwmon/Kconfig          | 2 +-
 drivers/hwmon/tmp108.c         | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/tmp108.rst b/Documentation/hwmon/tmp108.rst
index 6df7cf1b42f49..bc4941d982681 100644
--- a/Documentation/hwmon/tmp108.rst
+++ b/Documentation/hwmon/tmp108.rst
@@ -3,6 +3,14 @@ Kernel driver tmp108
 
 Supported chips:
 
+  * NXP P3T1085
+
+    Prefix: 'p3t1085'
+
+    Addresses scanned: none
+
+    Datasheet: https://www.nxp.com/docs/en/data-sheet/P3T1085UK.pdf
+
   * Texas Instruments TMP108
 
     Prefix: 'tmp108'
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index cfb4e9314c62a..d43ca7aa4a548 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2300,7 +2300,7 @@ config SENSORS_TMP108
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for Texas Instruments TMP108
-	  sensor chips.
+	  sensor chips and NXP P3T1085.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp108.
diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
index a82bbc959eb15..b561b452d8d39 100644
--- a/drivers/hwmon/tmp108.c
+++ b/drivers/hwmon/tmp108.c
@@ -420,6 +420,7 @@ MODULE_DEVICE_TABLE(i2c, tmp108_i2c_ids);
 
 #ifdef CONFIG_OF
 static const struct of_device_id tmp108_of_ids[] = {
+	{ .compatible = "nxp,p3t1085", },
 	{ .compatible = "ti,tmp108", },
 	{}
 };

-- 
2.34.1


