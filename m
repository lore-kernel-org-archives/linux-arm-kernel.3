Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB526CCF2D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 09:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZqgPAK3qCRahA8i4sg+g4mjrkMXV0k64hT6sbLeLv0=; b=Xl2ikfM+WsmpCLv/Ar/zWxJ3Xg
	bUJMsS/pSdOlDH7E332tRmvtOUh/wuwZUb7uc5r0BHm2lV0+X0lSHG/68aUb+k+8e1kgGCdjp8vgT
	LEsoJKFbMW7FDSd8M0V+gZPpgrRGm8iz1pCZqGfZtZD82FJyM7z0dRwPzs+K4JUSJz5mhyNxdIuTn
	xqx6N1FVvfZaEgIDWHjza/wXt309aAY3WfnP1BJUkrTauXTjkg5JX+X4w5SLhU25bitTe8FkiZWUX
	KnVQVVkuFdwtYTeaKm5KXcESI34Dw9cz35+POWfI1FnRRWB8wN8XMOaBu98lIZu3AY/hGhxa/l6dg
	YHwnarMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlvS-00000001fVd-1bMW;
	Mon, 19 Jan 2026 09:51:58 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlvP-00000001fUM-1c8m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 09:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOmg8sVoRVZY6FxDnLCuY/WE/0eJBFpvTMjzcCSf9VvvPa2LsNmFtMtTVeGcjI2BUnNMeUECQupYHE0yTfhi/g/bFRLQwi2rmWtbn6t+aTf6EmmcOXGS1Zlq2XDrO8TO4kaCzKDFcLXmtsrFEa3rsGzdoU/aIFKRUjPqCDkJafsdjKIQdS/vt6Y5zDBXWKyetwWPg1EtkMG4yBgugBgy3T7wK33m7RWdOZzCB/rnBlVSr7vShX70os93WJSw74IaJ5SMDWgGRcg86eU7qNR0QfCWENvNjz6iZ06QoiypSksQvMdb/kldwGVXfrHLNXwefJrq3cJsj84DGenhWb0H1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZqgPAK3qCRahA8i4sg+g4mjrkMXV0k64hT6sbLeLv0=;
 b=xweoEeo2Q9NK5EYezocBImYCSoQDIOR8ARYL+N6GekCaZwR/EU6ZZlANZHo9wfBAGemjMseUhhk0FD6wg7IdDIJFjMJIPxmLQk01GgqwsRj12mi4iTuDhC6kuV5km1rbcCWma6zB6zRlfc1BWUXZ0E5eSUWtXADj9RVpDuNSlnRQMoOvYBKx/R7Kp3kfmqCun8495smr9Ve6e3FTU2VvgPuC3+pcQqVDQFnOs/H1CKI6vYVy7aj4vW9i+OnmYIodA/+hj4mlMaUx0/0An02SzAfINevibbgbUAJQqwKjs6ePV//ygabjoXJQZraSdSVymQ9mXzzEENKz9iVChV7uRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZqgPAK3qCRahA8i4sg+g4mjrkMXV0k64hT6sbLeLv0=;
 b=gVonZp3Q2MYluFjfexRJ+Fs4AaeGbyNodhu+zWFRLm6baP2dEWS9qRfs3io7lq58IhDMB0+Qa7uXHzZFZtYPNkxuBpVabjOjGgRRJr6r1Qssc23XfTqz3I45a8JctQMwD6CONToXLDM7Tf3Pi+SdOos81GhQnZ1lrLWlq3Iqeby6888JdEKmTVkaFBYF4GOktmnFGbGlbCINuhBYEYZGek/mnHLjei6ClS64YccZJBThJAczq16e+GfwzFjCN2X75lwV/NxtHFdA4pbGrXWylBvC6OfgFj6041T3ou933qa8JvPadxSLYu7n8er9WWt6qJyCqAew2PCnCZfG2OnGPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAWPR06MB9950.eurprd06.prod.outlook.com (2603:10a6:102:4c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 09:51:49 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 09:51:49 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 19 Jan 2026 09:51:29 +0000
Subject: [PATCH v3 3/6] rtc: zynqmp: check calibration max value
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-zynqmp-rtc-updates-v3-3-acd902fdeab1@vaisala.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
In-Reply-To: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768816307; l=877;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=+7UxDfV4ES/9VFjxL/cIcZKdjtGA80EZrWk71p3SUcs=;
 b=2utyZ1FaBnhJBuV12VibF8DMgHIJjtyvdApd3oZtz91PlZJo/BDXe//LipA1ryBza9LjGhdeH
 dvMA8a9nBo5AOupspaX4RBEGCRBTGAD6O2jR+Yqk0/3EghSa0Rj2ywq
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00003827.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:6) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAWPR06MB9950:EE_
X-MS-Office365-Filtering-Correlation-Id: 139de817-272f-4218-fa64-08de57405da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MHJmeFFRUUw5cG1KTVRRbmR1bGZNUXRabWlTQitQeFl3cGVpRFczUHJrMmZY?=
 =?utf-8?B?YkhNa3NNMWF1Q2ZFSzZmOGliUTFQbDBUaU9aR0RPSnVsNzR5WFBuaklDMHp2?=
 =?utf-8?B?Z2FQc0w5UnlnSWY0ZENZTCtSc3Zvdlp6Y05na3p2SHBsbFozYm5RTGJ2L0U0?=
 =?utf-8?B?MngrSTdGMzVOQW9sODR6UGNiRFliK043S0NhMlVjVkRRN21IRUY5Q1FOWEZR?=
 =?utf-8?B?VHVENTNZcTRnUDMwU3d2K1BqaWNhY0ZKeldIeXVUdGxtS0R5WVlHOVliTngr?=
 =?utf-8?B?eGx1T3JuUk5yT1NGRWdJdEhvcGFSMitiMzBOY0swZFkvOXg4NGRwMk95Wkls?=
 =?utf-8?B?Q3RDQWcrMm5vd0NTMDBER2ZNeE80NExQa1piTHJZem1hV3dUSlZ3dG1uWmts?=
 =?utf-8?B?WkZVSm1wZUJ2em93Ynk5dGYreG1RMTVoVTZuMHlGT2UxZWNrTnVkRU13QUlL?=
 =?utf-8?B?aVZ0VXJRaHRleUZFMGRQODkvSFcreGpiR2UxK0tCbWkvbXRScktWTE41bEV3?=
 =?utf-8?B?bTlhaWtWcEljWTMzR0RsTk1wWHYwV0RaR3hiZHMxZUprYWxWWFA1S0lKRE5o?=
 =?utf-8?B?R2krWVNBdEdLYTIvVEFWZWNNUm9oWEJJSWd4a014TUp6eUp1bmR6NG9rQXUr?=
 =?utf-8?B?V2tqNXdXR2UzUVhBaXdBSjFlaHY2TURXbmRvTTNuZy9CNHRaRmpHMWNCSVVq?=
 =?utf-8?B?QTFkUnJuYUpVZVJ0RFE5eGR5clVaRG5jTVpwRGZKOHhnSE1LYWpnQWVqT0Fi?=
 =?utf-8?B?VkJCcGRpa0dYKzJvUlVybDlIMTR4N2NrVVdpN3I2bml6VHQ5TjVBeEx5NGJu?=
 =?utf-8?B?dXRVdTNGQTh2UEhDK3E2MjVoT0wzTkFKdnJvTWxRbGhwaWY3Yk9WczJCNk1I?=
 =?utf-8?B?WlByR2YzaVBJR0NBRlFOVEFUM1hidmdmU1RKM0p5NnFTYWF4ZFUyZjJWa1ZU?=
 =?utf-8?B?Q3I3ZW91UVdEOTl2M1QvZUMwU2NiMnhzbjhvN2Vta1p5Tm44S1hPTjQ2STFR?=
 =?utf-8?B?MjVNazhrSmVOazBBUisxaTIvazczdUtGaHVCWE55a3JZdzdHUnF2UEZvTHJ1?=
 =?utf-8?B?R21qRmJvR3ZqK1lFNGErQmtQREpBdlF2TXRvVzNmWHhUSWtGL3JHcTBOUXFY?=
 =?utf-8?B?Y01iV0x0MEQ1NXpoUXVHN2pndjVmWkVqK3FuVDVPUFdxQnJBeTU3S0lQVnIr?=
 =?utf-8?B?aGEzY1FBSVNNWEpUL1Npc0VXcU9OZ0FUcEo4SDIyaWlZSHdxbDE5VFlmN01I?=
 =?utf-8?B?ajg0Q1RxV2E2T1NSUHlOa05DdThvYmpONXcxMVpJQjUvTEkreWpiem80NVVn?=
 =?utf-8?B?TjlYcVIwbDUxdG4rRmFpcys2MVJvWk5QMHRYV2dYSER2MlBlTzhNL1ZrVDVK?=
 =?utf-8?B?ZHV3NTMvTzBVeUdJWmtYKzYwclA0MXNCVWNUNndLdCtkdzdVZjBLRjZHRy9j?=
 =?utf-8?B?dDNleUI1ZncrRjZMN0IzcWNRR2c3ZVFQeGJNbjJrT3FkbzkvaXRyTDVYN1U3?=
 =?utf-8?B?YklodlhpbkF2VktDRFVOeTRKQjJMNGtXWmVrMlJUU2VLMkw1c3NCQ2xQM0tU?=
 =?utf-8?B?ZDdsQVcyeEt0b2doemFOY29rUWpwOGFYV1JnQ0U0b2N6MlZnVzRBQ0szSDBY?=
 =?utf-8?B?cW1kOGUrQ0wycTlmbTR3VENXaGlNZGpqeC9nbysySmxhTHJ4cmVGTkUzU2JP?=
 =?utf-8?B?QklVR0ZwKytBeDB6TmxEU0M0ODdDNVJROUtXc0drbGEwVzMrWlBhR1psZDJV?=
 =?utf-8?B?Q3BIaFhPeWxsMjJmUkxHQ3J6cmxIVC9yT21hblI4R0tQYjJyRUNoQmxWMFFQ?=
 =?utf-8?B?d1JNRm02Q0hDbVdBZDh5cVJadTRzMkJxRDBWR1dlZGdvaklVdkQyaUlvNTFJ?=
 =?utf-8?B?VWRTWTFVblVYM3BBSG9zNFVDeWpvWmdyL29GRHRSdEF2MUFBWnlrenJNei9n?=
 =?utf-8?B?YmxnLzhnS0RoTHNWL1ZGV2t6ZzEvZVp2ZHQ4WmhtR3A5QmxocWJSeVdoU3A4?=
 =?utf-8?B?Z2t6RXhvYzJQT042Y09yY3Q5OGw2UndYV1VjQ210L2hXMkpwZkVDSmRHcGp1?=
 =?utf-8?B?bG1tN0tFRnEyLzVaTzI0dGRDU1I2c1Rva3p1NkFsUDlGeGpHczdja3NTeUJj?=
 =?utf-8?B?YVlSSUJmUm01MGJMM2xJOW1HYlpUc3dXd2sxNGw0VlExbTkvbVJ6RUc1Qkcz?=
 =?utf-8?Q?dQcbG2Wg1NIC57yGNAPIULE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBrbnlLNkR6KytpUFRFQ2ZONGJBWnpZY3d6ck83NFpKZFByWXFZMDdoV1Y5?=
 =?utf-8?B?cTdkOEtYd3lVbVFQaUx6TWVSYXhTUDRaMnAwQVNsdForUUNWSWhnMjlybVRS?=
 =?utf-8?B?TVF3QnY4dkZCckpVbXZkLzBOOGRabXZtNm82cWFtOC9HSm9nYTB0T0VqeTlJ?=
 =?utf-8?B?bWgrbFVEUzYzU2hZaWlDcGxaN1dOVXZpZk91V3B2NUMzT0hkV2dvcTB5cTda?=
 =?utf-8?B?bzd0ZEVUQzFkVVQxK1FJSEVHRzhVZnV3UjFFeHVJd3RpYjRGeTBOeGdyQzN0?=
 =?utf-8?B?ajJzb1BUUkdTOFdQMUowenRGd3A2WkNIck1iWWxZT0FndTJFMFBCMTQ0QWVX?=
 =?utf-8?B?djQwdmpSbXJWVE1Vbk9FMlI5U082dytwY0EzVTdBdzkxckZSemRLcWNnbGN0?=
 =?utf-8?B?WUdsUTlxOGlsdGF5L2xBR1I4L2doQ0xSNXhXZDdlUTk0Y1k5eGN2Yno0OG80?=
 =?utf-8?B?T1lzK2FuWTBRcWpqTnhaVFhFWHRPT2RyblI5MWQ0cTZKTGtiNnlxczZGMmhH?=
 =?utf-8?B?SjRtVXBTdGh6d1pPS1BxWjk0OW5nQWJtZXVNWmM1SjR5OXJsYjU0aUpVQ3dl?=
 =?utf-8?B?VlFPVng0NlNPUzkvaFlMY2tVcU45YUk1eGw1R0wvQ2VZM3NvQ21WTVE2THBh?=
 =?utf-8?B?VDA1aGpMMlF1ei8zOHk0aHpHWG1EZDI5UGlZUjdNMk9NR1hZMEZ4M2ZsYk42?=
 =?utf-8?B?QWRXYzk5Z1VHWFlyYWlkMHQ2SURiZERtdXlZV3ZGZGJWVE9DMWh3Y0JMQVNQ?=
 =?utf-8?B?amo2YjdOd1JEclpablBwaGY4ZWZQazYzdEY5SmpJL3BmcWd2RlpoZTg0dUpO?=
 =?utf-8?B?NUx4NDdtL3RVb3NweVFrbjV0cUZjclJuZ0RvbFJ5SUoxWFBvdjdmdXNGNDJ4?=
 =?utf-8?B?YWRZbVFNaXRKdDY2RVJseFJTZjV1bURaZitEa0NIVmRvdW9EWjlLNnYyditF?=
 =?utf-8?B?YUdDWVBhTUt6MENnYTBweXVHTHpYNHdlUHJ6V0NHamZNekNFOGFkSHYwcXBP?=
 =?utf-8?B?c1BkalE3b3NZQ25SMHJ3NkcvRzIxVFJrMlllK1YwdkdMbHl5eXd5elV2ekwx?=
 =?utf-8?B?VHUrQnFEMWdHdWlPKzFacUhhMThyNVZ6RjUraFBzZFZJTTh2VGd3cnpHdkpK?=
 =?utf-8?B?a3FDbTMwTkJtZGRXN0VIR2dpcVFQRGYxWEl4WGErTUtUYzJLcS84NCs2b09T?=
 =?utf-8?B?Z05WY280YnkzQzc5ZWJWdTl1STVCZDE2SGE0Rm5QY3Q4QkVicG9BNXpjOC9B?=
 =?utf-8?B?U251Z01MWVBIY2NuM3U4Zm1vTmhqUE1ReDR6SXpQREc3TG5kaWxvVFZZV3lp?=
 =?utf-8?B?dG0zWFdJeERJSnRiWkViRmsvM2g5cmpDWG5DLzAva2RPbWR5S092Uk9DQ0NL?=
 =?utf-8?B?RFpkQjZ0dlpSR3hzYXZGRVc0YXFLQ2RGdUpiSUJJYk1qM0RWZ1B5dTVyZk1B?=
 =?utf-8?B?dU4rdjN0bWtKdGR3VGcxaVEvY0N3aFRTY1FGUUllaXpUSmtJTHUzQjRHOWpU?=
 =?utf-8?B?NThxQzdlVkk5R0t5SUhKMUJVbW5Za1RIWjNhMTZxV0RyY0thY2k4KzJwK2lP?=
 =?utf-8?B?cDFvQ1l5Q3g4djR4OWRzV2grQ0pSV2YrRTU2Z3Z1K3lwQ285VzJHQWYwd1RR?=
 =?utf-8?B?Z1hQSmhtQjRJR29QbGFTOXFCR3laa3lKN0UrV2lyRkRrUUMwZWV6VEhUb2V0?=
 =?utf-8?B?VWprME1GdnQrZThuZmJYKzVSNFlXK0FhcHoxeEREZUNSWUdlcTBNM0E1NmtD?=
 =?utf-8?B?VGhoZkNmWlBEMGpLK0R2MmZONDBuaHllNHRHTUswMVFMdDN6N3BtZG11OWd3?=
 =?utf-8?B?RzZVV3NNMnVWVUlVQUE1aUhJQjBGV0hLM2s2dDR6R2xrVmc0NVdUMkNSYVNI?=
 =?utf-8?B?eGZySkhQZ1N1UkVKdEd3eGdMVGRpME9OQ3NxNnBJeFFUQ1ZrOWhEL20rVmg2?=
 =?utf-8?B?c2d4SFM1YmRRV045dkpUaUJTZ1ZTbmxGYXZGVERhUzMxTHpaczFPWTVucVMx?=
 =?utf-8?B?T0NMcGRDRUVRbDhtdUZKMlRsNkhhV3AvR3ZJSkhkdllzZGtPQjBvOW1ZVXE3?=
 =?utf-8?B?T0VGNkJBQVluYjMzOUFKWkFXdmI4OEVuNWNTdk0rV2dmd3E3UXBmRzV6clMz?=
 =?utf-8?B?cm5KbGlPZGN4UHJyUHZFK0ZvamorTUhNSUhMc3BzcWVlNWN0UlBLakRmQWQ5?=
 =?utf-8?B?WVEwN3AwUlk0ck5Ga055V1BWOFJ0RjUvdURSanhKUXAyY2FrdnI0cEQ5ZS9W?=
 =?utf-8?B?UDltSko0dnJwend5d2xjbXdDVDQzVFFHa2ZZeFZuZjcydDVtQzNDdHhUeUN0?=
 =?utf-8?B?enA4clZNLysvK2lndFVOTGk2Tm5QbHlHZUgzREtZRXFmUTFKdHVDRXFsYjdq?=
 =?utf-8?Q?TgQ70dsYke3C+ZoI=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139de817-272f-4218-fa64-08de57405da7
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:51:49.4763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GK2jnp4eMMnBy2ycBGB11XlHc4XSxgjyDOni+X1q+fzN0/ovVLEXuaq+Ab2cYyspN9XwyqkZ5WP3SP8s16Y3kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB9950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_015155_428218_97E7CA52 
X-CRM114-Status: GOOD (  10.20  )
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

Enable check to not overflow the calibration
max value.

Reviewed-by: Harini T <harini.t@amd.com>
Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 856bc1678e7d31144f320ae9f75fc58c742a2a64..caacce3725e2ef3803ea42d40e77ceaeb7d7b914 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -349,6 +349,11 @@ static int xlnx_rtc_probe(struct platform_device *pdev)
 		xrtcdev->freq--;
 	}
 
+	if (xrtcdev->freq > RTC_TICK_MASK) {
+		dev_err(&pdev->dev, "Invalid RTC calibration value\n");
+		return -EINVAL;
+	}
+
 	ret = readl(xrtcdev->reg_base + RTC_CALIB_RD);
 	if (!ret)
 		writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_WR));

-- 
2.47.3


