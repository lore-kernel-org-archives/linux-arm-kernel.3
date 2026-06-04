Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D91CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQ341wTgPWJ4ZbIRg4FfnWBxi31BDa73hHv5RFkJJNs=; b=pdrS0BKn/obK4NXQjQxEAkMQws
	zCIQbjfygKJ8BKiLWY3mkFWRVoI/8uoN0K+9qkIYpcucsOzJmbNq/NSY09L9xf8o0N+fCxUe53W+k
	hcpSR8i7NVHhcBwoIcydgu05y/0GihMifdCVll8T4HO2D+B4rwutXAqyrzrQQCtHBtSuC7Jotz74N
	ZCyNgTT5lLrWEJpAHS8mjmgDfV3Uyrzx/TSfaN5+Gpw8dBhEnqMFs3rkexnqZL/DaM5nzzaRo8zqk
	h5aaXEau78iG2Pp+Prz4PqBMu7PEnwQ2h/pxOuUuHtaRiNuGyLvXc8ZXTks8qUGm6gbxHOITs5ncq
	JWcs5/RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4Bs-0000000GTgW-3BqK;
	Thu, 04 Jun 2026 09:16:40 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV4Bp-0000000GTfR-49Jv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 09:16:39 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e8zIy6zxQHiEZEKSso2aVR2tG5vDz3aTszkzyLxhOBOoCqz5mkAEP0hYKgqviEuAhRtyc1/SZNaGtUoPV3K+vzI5RDfCa36Gbd9NsQ/IEy6LCgY6BlD3SikSvEZ66bxq6uuBqOLwr/12EnpMCTntaL7+/IaDPpNLgm0CiW9CC/bNfuUfuTL8/BisLAdGResSnr0tNGdpey7FxKDF8+0Hof7nQibDGARHfpWnHjuOfE88YyOH2H95g4Jggm3rDMcqdB3PWG0FdjaBJyO44Q2mcZkJ3WbwW0gJO0rTIZPQUrGx0VI99bVknyxUDyyIxZKwV7KX6wXU28hHcVWTfREfqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ341wTgPWJ4ZbIRg4FfnWBxi31BDa73hHv5RFkJJNs=;
 b=nYxRibw7jx8ajpmW5Zf8BpQ3d9rZWTC/CBNf64cwNJryZfNHCUarBEuA+S8+Mv2IiD7Mzl1RoE+iroHm3EZSCwQt/twE4RwFhzwBV++Q54hX3HVth/AFbK7jnCD/1BgnoGPb9a7WHcU/wGocJZAQBDX6dxDxQmJzl7NcqDSkzd/hZ/ESMsMPZsHSqBzLmBzlyJT6gOePsiiYyO91JhrhfKuxMhDs8MzaXpiCZ0NtH5bucfulwR5emwEhWD/wKkhwFfOE1/6mCCR9HqmTy7K2CxItEjFYBQDo4XocouvOkd0IVbQKTx5mMrZPXmC5SuHftuahE4yoTKl7FRRTWIX+Hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ341wTgPWJ4ZbIRg4FfnWBxi31BDa73hHv5RFkJJNs=;
 b=Vl95tQL4ZUrf4YE+7WfLZRGPqfwjE+jw8Sgxvn4MaBFvw+SkJ4c1+4OtOeGzekIqpASyE/zO8aT/TRS97lRJAxyYIuNBs7+PlJd1cNfDgBxsdf6uVtKOC2xaT9BNkK10gvQuLDzUtioVxf/8hmimu/kiuWKiY1DztLlPwKrjJD0=
Received: from AS4P191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::26)
 by DB9PR08MB6571.eurprd08.prod.outlook.com (2603:10a6:10:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 09:16:27 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:657:cafe::a) by AS4P191CA0050.outlook.office365.com
 (2603:10a6:20b:657::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 09:16:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.5 via
 Frontend Transport; Thu, 4 Jun 2026 09:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IIkpitt12DPkTMOYWQroIP6KY3hYc9sg9EAS8i/Y/gfgLTqQHS0TxKzwnOyZrPL/GjE+CKp2sHbSaPQCIBVvu0ZljyP640Ro2G/9ERSklsh2fqB+eCbGNoWkfI3uZTgdPm5iNOD7k9SUienfbkpQ4RI0PdBhTVYNaxNQea6+ZOrXYSqvBgCdb+VDQbT8jTDmqwD+KzZcVisoQJJjJ9IoswoFmYgTUULfiGXTw5u9mhWJ3Bvca6ObBGqRaNAou90WlU19CoazSJBxLIWXQ64r1zKQyVj0Qc1X54I+YEXGO8aGJXCBHws/4bErmhP/hEgQ7N65xz2inMlZunnjlckvxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ341wTgPWJ4ZbIRg4FfnWBxi31BDa73hHv5RFkJJNs=;
 b=vsB7Isi5DQT7d+4wkhSzCC9v5B25Mho4JA/e0drHRe6mN8yJa6CxqGTQmE1TyUgvEp5Fdljt/pphSyqCKUXHOoiB8Nbt6dnDgLyaKoszyKEosSQ6TKla9VH/A+VdzXIvH2OzzJd+mOv3S8J2r7214mH/q6s9lKS299FuDUzZ4C5BKySM+6Nj48QpKnUZAgM9ZNzgzpw3GiTQ7FUe32Qgu3LoMxDj1lq8uKe8SoPZZO6e59Fmtli6lS0ifMjnEyyWvTb5Z3rcBCQrmZsfuVOUNUBKxqBa9XhUZMbzd/OuTMM0L4ynn2IhcxmhQv1hrZQnBr+IDLUq/QfOSiWD3B0VXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ341wTgPWJ4ZbIRg4FfnWBxi31BDa73hHv5RFkJJNs=;
 b=Vl95tQL4ZUrf4YE+7WfLZRGPqfwjE+jw8Sgxvn4MaBFvw+SkJ4c1+4OtOeGzekIqpASyE/zO8aT/TRS97lRJAxyYIuNBs7+PlJd1cNfDgBxsdf6uVtKOC2xaT9BNkK10gvQuLDzUtioVxf/8hmimu/kiuWKiY1DztLlPwKrjJD0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by DU0PR08MB9582.eurprd08.prod.outlook.com (2603:10a6:10:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 09:15:23 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 09:15:23 +0000
Message-ID: <a4bdfe22-12da-4053-91f9-b0e8ede4737f@arm.com>
Date: Thu, 4 Jun 2026 10:15:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/13] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mike.leach@arm.com, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, leo.yan@arm.com, jie.gan@oss.qualcomm.com
References: <20260519154812.254884-1-yeoreum.yun@arm.com>
 <20260519154812.254884-6-yeoreum.yun@arm.com>
 <55b306e3-1e33-4a5b-a2ce-043132db7154@arm.com>
 <ah1yhaZgddq+8fCW@e129823.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <ah1yhaZgddq+8fCW@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::15) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB10975:EE_|DU0PR08MB9582:EE_|AM1PEPF000252DE:EE_|DB9PR08MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: fb351dca-b147-4440-94c2-08dec219f4e1
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|22082099003|18002099003|3023799007|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info-Original: wNThcgdC3JrMUUVo5nT4B63lzCQabS3Llv2FMqyKxuWiu/XwRU404qtGLYf5ZNVD//deQyiXfpFPyU9xjyiujqyuF1Q2Rl+wbdxyF1E7NMvD7Spp0gZhzFeA2/6eg75lTW9kXitdw8sa1pBWDpNzZvyULCHkLu4289GwoM0NVgXWhFF8UWodEOL+LlHAGIdJJHGkUecXMHwPpr3EnZxvw3rbIzR+u3rxx9cWrcMDWJkZcLaO+7QirnIxdhLo8tRSm6JsXTOtkUXmitiqB+lhRrbzHyDabgiidllP6KAl4s2DpV4R5RlNj5bqeunTe/yuxHap/un+NflEj1N52ivEjrOLEztM6UzmOFcy5hOZPHLq+rL047WYIB9A6ICfWX874KFbOfXatY7UXNive8bd9Ew84u1mBTZ2EORh7YBsNPMTuI1a4voPdFnrG63B/SuuPdq+EcKEEOQQAbfdcvd3y45uJt4FYtaNR0nO+iTottTlG9EnXA/QDbPytzTsC1ZW/I6oxZSl86lyjD+jBjz0ownCtqd8eoU8zsLjl+ogp+v4XAHH7YuKkTeJqAS8L7Gj/ETaP4hzYOD1wfymesoeF39iJFEXNafAFVBdQ9lH5VSfYSeD8GcHfo8XoMdpY+bNRvG7MCZCcoaO283xyyWrHbdaLSOT9P8IiOBb7FM+hDDNpdHjLgztnjrQw/VEoYZv
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: nKLoz4qvL8RQ07vV9eN3FUCntPtMJcPDNFyS2mydDHlzpUU0H4IVUMkmIn5QReYt+iu2D28z7h/sFWfczD5YHrpIW3ywybsXaorPz6ok5HdxvDgYPYFd9kdujey7QqYwCCv6NjlmKt4PzQAWThwwZfCt+Wxpkpm577MfHLDv1mYhpBFZ1lMJU9aK6ia6aXxIHqUoudTZfg8y1bnTT8zyIwVQmXRY3yQW4GRS2+oDFUySGM3xe+jCbdnQAFph35jWDx+CR1g4y/nuhYlbExZDBvTPM5EZqUo0pQwHfuDj5iv9wfMqoPYm+caCyd8QSxpnEgH0eUCEMvmPWFEyk/2IeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9582
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f5bee015-148e-4513-c364-08dec219ce96
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|35042699022|36860700016|376014|14060799003|82310400026|3023799007|22082099003|18002099003|6133799003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: UmpffllH9FtMbTVQA0TjfXxMxSP7VNCjbK8fs2s+4zeo0QNMS96ATiKLPaZU9VjdgzPZf8BCBTSg4YpG9yfKPAT/F5QsB0USoNrrpUaU2YLqz+9zL8pQo2lyYtKFHL1SphnvpqH6seusQKhGgEGBPuJS0MXzwroMRaCcYyMBo8FrpXavFHFlX3lkhpndWctSiQ0jVhGoU0RgidzfZEpDN92j9E0qQjEg0VJRUUpHEVWnvyXbR3yxUpJ6HbuJHQR17uhDkkS8Vv4DEqB1W5PjSpSffp2yf5fwtYiNC3fGfRQ7otLYBAjBXG4R5V0nkgovoi3+Q9lYapvK9478dmxrjK8EpUg+E6NMt0w54PktBcI06SHH99+hcmJB9pJsdUQX4Ce0ZroeHHFTpTO433nrOlT9hBJfK3JsBuhBMRThFagsSzZ49Eao4KeueYbrBHJjZI8y1ILv7pXbAByS5gR0Mu3VriDIXUnGYcrtn86dwvW0Opy8FuYhifc2N6CE1Td1k88E9SFJTj8j6iZ8gorDPgEnu8aqrjckSnWOdNVpzH/3nk3Pe6Og1yWz3iRqVP7LPX4dyh2IyYWvn7UGmgYYY3iPONUKsCzeqmMGW8wCb92/fltT2U9n4KfCJufh31urfBaDmyieau3PPt0wr6zCyk2vcuEpfizaRRtVr4odQ+kjS+Tk4F9NAQZcLWnIg14NVPp8r68DGpVQvt9arO2DAUCyLRRN40qBkqzMpoNFVME=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700016)(376014)(14060799003)(82310400026)(3023799007)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ADYD9Qg3AlGgZwpQ7ZePuNkWu1WvBWH2n+R+XCS6V5FOXlvcu4kFGbmyb4XmONk4EDIzYWcwrgumOfNuJhEcB3fevYKTX0PGLvYZjxsYuI+NxLFx9W8CJN6tma2eEV2bZP4x2Rnef7Vga22SJzBhWQgm6zNTBd8A5uYLDMtvOqIOzmfK0I8xLam7ALF2/c6xNlP4KSD7aXpgtnLu2yQBTXvSSiAkNRW4/8dDp9DlxWaAayxjTvEZsj25BJ/r93jVy4irG9pURgeqHrI9dNsOS3g7rMlbOh9Q5mJFLCjUN22Tc1w8w1UffuYIyxqjBrdckV7O/WNzpgCjxdUbc64fX+WHC5Vdh4XGjP23x5/E7E7XWnjMI4gIDxc5fIut7+h9T4E228tRGMpsXefJ437xDOebqqIEZS5cHkglYmoVzcORhSkig7CI7GHrxZU+L3ac
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 09:16:27.0504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb351dca-b147-4440-94c2-08dec219f4e1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_021638_240844_BC420851 
X-CRM114-Status: GOOD (  30.32  )
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

On 01/06/2026 12:52, Yeoreum Yun wrote:
> Hi Suzuki,
> 
>> On 19/05/2026 16:48, Yeoreum Yun wrote:
>>> The purpose of TRCSSCSRn register is to show status of
>>> the corresponding Single-shot Comparator Control and input supports.
>>> That means writable field's purpose for reset or restore from idle status
>>> not for configuration.
>>>
>>> Therefore, exclude ss_status from drvdata->config and move it to drvdata.
>>
>> TRCSSCSRn has two different types of fields.
>>
>> 1. Capability
>> 2. Status
>>
>> Moving the entire register from "config" to a common dangling place looks
>> like shifting the problem to me.
>>
>> Could we do something like :
>>
>> 1. Split the fields to two.
>>    a. Store only the capability information in etmv4_caps. Bits[4:0]
>>    b. Store the Status bit in drvdata->config , as it is really matters
>>       to the session ? Bits[31:30]
>>
>> Add a helper to write/read the TRCSSSRn which would apply/mask the bits from
>> drvdata->etmv4_caps->fields to the Status/Pending
> 
> Well. I'm not sure about whether we need to this.
> When I remind of discussion with Leo, The Status and Pending bits should
> be preserved in the *same* session theoretically However, Unitil today
> In case of *perf* it doesn't keep but always cleared at the time of
> resuming session and this behavior haven't reported any issue yet.
> 
> TBH, I don't have any idea how perf could utilise those bits except
> the current use case for  the sysfs to show the bit via *status* file.
> 
> Futhermore, IMHO, config isn't good place for the Status/Pending bits
> since those fields are not *configrable* fields so I think it would be
> better to locate saving information for the status and pending bits on
> drvdata or by defining other fields.
> 
> But, until we find some usage of those bits in perf, I think we can
> delay this separation you suggest and it might be better to keep as-is
> for the purpose of showing the status/pending bits when sysfs session is
> finished.
> 
> Am I missing something?


Agreed, this can be cleaned up in a separate series.

Suzuki

> 
>>
>> Suzuki
>>
>>>
>>> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> ---
>>>    .../hwtracing/coresight/coresight-etm4x-cfg.c    |  1 -
>>>    .../hwtracing/coresight/coresight-etm4x-core.c   | 16 +++++++++-------
>>>    .../hwtracing/coresight/coresight-etm4x-sysfs.c  | 10 +++++-----
>>>    drivers/hwtracing/coresight/coresight-etm4x.h    |  7 ++++++-
>>>    4 files changed, 20 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>>> index e1a59b434505..9b4947d75fde 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-cfg.c
>>> @@ -86,7 +86,6 @@ static int etm4_cfg_map_reg_offset(struct etmv4_drvdata *drvdata,
>>>    		off_mask =  (offset & GENMASK(11, 5));
>>>    		do {
>>>    			CHECKREGIDX(TRCSSCCRn(0), ss_ctrl, idx, off_mask);
>>> -			CHECKREGIDX(TRCSSCSRn(0), ss_status, idx, off_mask);
>>>    			CHECKREGIDX(TRCSSPCICRn(0), ss_pe_cmp, idx, off_mask);
>>>    		} while (0);
>>>    	} else if ((offset >= TRCCIDCVRn(0)) && (offset <= TRCVMIDCVRn(7))) {
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> index 53fbc4826628..7783c97b53e8 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
>>> @@ -95,7 +95,7 @@ static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>>>    	const struct etmv4_caps *caps = &drvdata->caps;
>>>    	return (n < caps->nr_ss_cmp) && caps->nr_pe_cmp &&
>>> -	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
>>> +	       (drvdata->ss_status[n] & TRCSSCSRn_PC);
>>>    }
>>>    u64 etm4x_sysreg_read(u32 offset, bool _relaxed, bool _64bit)
>>> @@ -571,11 +571,11 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>>>    		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>>>    	for (i = 0; i < caps->nr_ss_cmp; i++) {
>>> -		/* always clear status bit on restart if using single-shot */
>>> +		/* always clear status and pending bits on restart if using single-shot */
>>>    		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
>>> -			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
>>> +			drvdata->ss_status[i] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
>>>    		etm4x_relaxed_write32(csa, config->ss_ctrl[i], TRCSSCCRn(i));
>>> -		etm4x_relaxed_write32(csa, config->ss_status[i], TRCSSCSRn(i));
>>> +		etm4x_relaxed_write32(csa, drvdata->ss_status[i], TRCSSCSRn(i));
>>>    		if (etm4x_sspcicrn_present(drvdata, i))
>>>    			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
>>>    	}
>>> @@ -772,6 +772,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>>>    	/* Clear configuration from previous run */
>>>    	memset(config, 0, sizeof(struct etmv4_config));
>>> +
>>>    	if (attr->exclude_kernel)
>>>    		config->mode = ETM_MODE_EXCL_KERN;
>>> @@ -1064,7 +1065,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>>>    	/* read the status of the single shot comparators */
>>>    	for (i = 0; i < caps->nr_ss_cmp; i++) {
>>> -		config->ss_status[i] =
>>> +		drvdata->ss_status[i] =
>>>    			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>>>    	}
>>> @@ -1497,8 +1498,9 @@ static void etm4_init_arch_data(void *info)
>>>    	 */
>>>    	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
>>>    	for (i = 0; i < caps->nr_ss_cmp; i++) {
>>> -		drvdata->config.ss_status[i] =
>>> -			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>>> +		drvdata->ss_status[i] = etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>>> +		drvdata->ss_status[i] &= (TRCSSCSRn_PC | TRCSSCSRn_DV |
>>> +					  TRCSSCSRn_DA | TRCSSCSRn_INST);
>>>    	}
>>>    	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
>>>    	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>>> index 7de3c58a47b4..71e95d152ee6 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
>>> @@ -1829,8 +1829,8 @@ static ssize_t sshot_ctrl_store(struct device *dev,
>>>    	raw_spin_lock(&drvdata->spinlock);
>>>    	idx = config->ss_idx;
>>>    	config->ss_ctrl[idx] = FIELD_PREP(TRCSSCCRn_SAC_ARC_RST_MASK, val);
>>> -	/* must clear bit 31 in related status register on programming */
>>> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
>>> +	/* must clear bit 31 and 30 in related status register on programming */
>>> +	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
>>>    	raw_spin_unlock(&drvdata->spinlock);
>>>    	return size;
>>>    }
>>> @@ -1844,7 +1844,7 @@ static ssize_t sshot_status_show(struct device *dev,
>>>    	struct etmv4_config *config = &drvdata->config;
>>>    	raw_spin_lock(&drvdata->spinlock);
>>> -	val = config->ss_status[config->ss_idx];
>>> +	val = drvdata->ss_status[config->ss_idx];
>>>    	raw_spin_unlock(&drvdata->spinlock);
>>>    	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>>>    }
>>> @@ -1879,8 +1879,8 @@ static ssize_t sshot_pe_ctrl_store(struct device *dev,
>>>    	raw_spin_lock(&drvdata->spinlock);
>>>    	idx = config->ss_idx;
>>>    	config->ss_pe_cmp[idx] = FIELD_PREP(TRCSSPCICRn_PC_MASK, val);
>>> -	/* must clear bit 31 in related status register on programming */
>>> -	config->ss_status[idx] &= ~TRCSSCSRn_STATUS;
>>> +	/* must clear bit 31 and 30 in related status register on programming */
>>> +	drvdata->ss_status[idx] &= ~(TRCSSCSRn_STATUS | TRCSSCSRn_PENDING);
>>>    	raw_spin_unlock(&drvdata->spinlock);
>>>    	return size;
>>>    }
>>> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
>>> index 6d4fbae78448..43db1eb6f8cd 100644
>>> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
>>> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
>>> @@ -213,6 +213,7 @@
>>>    #define TRCACATRn_EXLEVEL_MASK			GENMASK(14, 8)
>>>    #define TRCSSCSRn_STATUS			BIT(31)
>>> +#define TRCSSCSRn_PENDING			BIT(30)
>>>    #define TRCSSCCRn_SAC_ARC_RST_MASK		GENMASK(24, 0)
>>>    #define TRCSSPCICRn_PC_MASK			GENMASK(7, 0)
>>> @@ -730,6 +731,9 @@ static inline u32 etm4_res_sel_pair(u8 res_sel_idx)
>>>    #define ETM_DEFAULT_ADDR_COMP		0
>>>    #define TRCSSCSRn_PC			BIT(3)
>>> +#define TRCSSCSRn_DV			BIT(2)
>>> +#define TRCSSCSRn_DA			BIT(1)
>>> +#define TRCSSCSRn_INST			BIT(0)
>>>    /* PowerDown Control Register bits */
>>>    #define TRCPDCR_PU			BIT(3)
>>> @@ -978,7 +982,6 @@ struct etmv4_config {
>>>    	u32				res_ctrl[ETM_MAX_RES_SEL]; /* TRCRSCTLRn */
>>>    	u8				ss_idx;
>>>    	u32				ss_ctrl[ETM_MAX_SS_CMP];
>>> -	u32				ss_status[ETM_MAX_SS_CMP];
>>>    	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
>>>    	u8				addr_idx;
>>>    	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
>>> @@ -1073,6 +1076,7 @@ struct etmv4_save_state {
>>>     * @config:	structure holding configuration parameters.
>>>     * @save_state:	State to be preserved across power loss
>>>     * @paused:	Indicates if the trace unit is paused.
>>> + * @ss_status:	The status of the corresponding single-shot comparator.
>>>     * @arch_features: Bitmap of arch features of etmv4 devices.
>>>     */
>>>    struct etmv4_drvdata {
>>> @@ -1092,6 +1096,7 @@ struct etmv4_drvdata {
>>>    	u64				trfcr;
>>>    	struct etmv4_config		config;
>>>    	struct etmv4_save_state		*save_state;
>>> +	u32				ss_status[ETM_MAX_SS_CMP];
>>>    	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
>>>    };
>>
> 


