Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C362E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utrtzX0BikqiRd9W8AnOBRqRtg+QJOuM+jfMBE/jgdE=; b=yjKJ7RA+ImkmDFwb2I9D9eOP5n
	kN8L4edZeHi2Zn2eVMssst/t4f4ku7UE5ehRNXEnyb+++O4l2F/py5vXr6iTDToUSb9NV9NRV6OwE
	rWQluXAlbbtUveXDd8GZSur9J7GPB2g5mgYe/ANw/ygrfG9YbEnk7HXtI45toM4PaErnEGtUfcnC4
	tvyVTotZUyda92BreXZPRJnuJVv7yu332MuQ+X7f+VnbsY4YDkfTu6RjZMKEHdftbqp++UYNVB4nQ
	BFnSqh1VQLJqb8D9hPkp/AOQYyIIqzhEXI63IHW7J69roz7dgrhMt9nh9Umo6xYKc0XtKvGwIem94
	azvcCYlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrFP-0000000BnRK-2IZW;
	Thu, 09 Jan 2025 12:02:47 +0000
Received: from mail-db8eur05on2061d.outbound.protection.outlook.com ([2a01:111:f403:2614::61d] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrEB-0000000BnHL-1H5s
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:01:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vG24GKgHuTAdqjsnQaGod5+vi602CEUFL0mfjgIBAI2xcbPYr0DIOCXiV8cy9mQC0bfo2/br3f8tzTdX1gDiknh3Suqu+PgBQffirUoG4FXYpVIDHuH8g98uvDF7za3oohPHSCLwTZZ4V7AddQD6yisX1gqTsnRtgzswgw+AOZaHPkhiJ69GuE6u3QTybJt4tz+WvidWfPz+XFi9J9kMJ8QvYAWVRFisafCkJbsHn1bDaOdWzkYbtWohZCqAUFKBsEd97NQ4ADzZrWqgaOZEkJ8RJRQ3jId3qlUX2hIt34fN5n4OpqCmcS3SCv2quOAMpFSszjoAbmZ88+3bF14C8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utrtzX0BikqiRd9W8AnOBRqRtg+QJOuM+jfMBE/jgdE=;
 b=b6yOQYarJU1CuCbQq66YC9JiHMFTp4Oj0m2Z7jSS8b4/JAALF64rMnU2PQL/2H57hrUvH1WRft9/52zUAqKGnkrxke4PMMicJQtX9ubx2RvcPMupyVKOvsUYo3jHCGce4mvczoTbDqBWgt6S4VNCnjCThILZtS9jB8pVT+rzaYB/y69O2+keKIt8hL1JsRh7WwhZhChekOG+P1qJZk/aWwvF1z7Zv5YdpmXTHxPK/yS9jyqcq0+fk/rlbNYW91iVoVJGQIT1gjCf2INoMaLiiGcrOqckllFrhsE3hpzvd9XObG1cWHlVqmHU2vgZ+geHGNxm43WjKwiJWkBFzR3Oww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utrtzX0BikqiRd9W8AnOBRqRtg+QJOuM+jfMBE/jgdE=;
 b=kGEydK3KiHsSuotMx/cQETJvMSK9SZFLtbeECZcZTJj/oQWqxPeGzMet6pq//RtwaChT4odyePShvkYuHiqRpbDc9lmMtTvKkC8lwa/tHQ5pPNcNLmxFDy060MZTA+IV3Zx7GC7OhoQTSq2+ae/XJ6chiT6IM+8zNWe2yq9AdIg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB6458.eurprd08.prod.outlook.com
 (2603:10a6:10:258::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 12:01:23 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 12:01:22 +0000
Date: Thu, 9 Jan 2025 12:01:20 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Message-ID: <Z3+6kL7OGDX/pNul@e129823.arm.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
 <20241221165934.1161856-2-yeoreum.yun@arm.com>
 <6bbc9b64-3ecb-46c3-8c4e-55dba6301ef3@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bbc9b64-3ecb-46c3-8c4e-55dba6301ef3@arm.com>
X-ClientProxiedBy: LNXP265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::33) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB9PR08MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: b19639fa-9005-4c88-c83c-08dd30a555fb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iQK33s4UVMWsirjtmg9luTA4bU9AreWJrLYuE+ocDEOLvqkTkzBThAWoXG9g?=
 =?us-ascii?Q?F4G8JpRfFwuPfRmQNWr2tKpdx3YrjkvgVpe3rXs5HPViUnmYl9wtWi3gmRra?=
 =?us-ascii?Q?lk1ytiBl12By7F4gDLOCD5le8Dwx6JWACSf3uGEjeHZBULUHxjLZ/7TuUjrh?=
 =?us-ascii?Q?om5gfQnCHysbQG4kuxBBd3zS3bi7AtSdfaW3Qpz9XUfPxXzJJqoqLo+KTlgw?=
 =?us-ascii?Q?Xq+HMbKGPUMI0y0THB6coPjrlBIoZAwNv5eRGGtZtHoodiaXouJsQ2AaYrlE?=
 =?us-ascii?Q?Wak5CGlTVmgjAnL4b9ixHvo0LsVuY5+puiuWnPpwkdSM7bTltq51ZjTMAm9g?=
 =?us-ascii?Q?9yLx+ljTldcz2HjeUDAc7MwHJ6vuWRn9vHEGZOrb/ky90fagzQEZtcJ0083x?=
 =?us-ascii?Q?E/RdNNHQzNPrn7918at4ZXxHM6IdVRRw8g9IXABXlz+U62EqB0qCxRj6LVmf?=
 =?us-ascii?Q?ICNN/tGVJ5wyNUrqyDyq7NhGalEMIKObywrtMT7QAtS3bdGCBiOjx62NTXpI?=
 =?us-ascii?Q?dPpvMCd/emFUXFJKkquXrzdhcBnGWQqKlMMlKpuRLIAMQSQu8mOFOwzlTgql?=
 =?us-ascii?Q?Q5Xy4bgcYClaWh+X+ybxIsoR6yxTjUUshPWpKLc96gYg72X8H1ZVztiaGYlh?=
 =?us-ascii?Q?/qf1EOJXZGlOK89+YCj9CsawGIiiu8vSWiWGSPgOHqCmdH9VNovRQtbYZVZr?=
 =?us-ascii?Q?P7qhjXjYpnoszUsiIEu9X1y6gKTY7SA3+qtRlN5CZVpCx7B5NGvBEusOOJJm?=
 =?us-ascii?Q?YcX/2UZB7ntdqD0Xy3W878QV56k+Gv1jwcI2g3vTM7v0rRTaeCYTin77uLNQ?=
 =?us-ascii?Q?k2fZLI0Lsiy6xOTwM6I2pEldz8NyMne9rkvRqWLDFfby3kH2fSJsVrsEN+HJ?=
 =?us-ascii?Q?0qXAy43yYtRSUCF2vIRMSsCi/H2OBzd5g5B7rTHKuKl4yb2ZuoohNfhF5PE0?=
 =?us-ascii?Q?3k5wMnQDYYUaBNWFPu20D6nv5rC6pBsjVoACg4/QgW115KKwhvw/G21NCiCB?=
 =?us-ascii?Q?8OEV96PFsDqoPrMSPzDZIewLVM1NH9M3mqrZb7cr/EMREdKsHTbCkUG9MxoH?=
 =?us-ascii?Q?kFe8gtsfadKAdKMZOCgF0yABRIWpakIiF82C2WVLTpVOBHorLtx2zg3GVG0J?=
 =?us-ascii?Q?wXcs/nZqAsC0OCtz1YyzUPU8NbJZMFXe4GMoZURfzFKrvBHtkS74Nt5JI/3O?=
 =?us-ascii?Q?6J80gPOZO1wRRa9rKttTNtN0x3YOPLmwoFQYI7BeO89qoD1q7uRxFwvRG2nU?=
 =?us-ascii?Q?ZZUxVteN3gZiiIJs5bybJLeeRJtl9mmX7bZ7b+LFzdqb9RpEN/+iLegJH7B4?=
 =?us-ascii?Q?7vrIC7mZI03ToPhsiyjV5FmLsCVevBax02b3g3aCbL3AHtbAXDxTfuMfC1HW?=
 =?us-ascii?Q?fuvpu30wZ1BvhDHmf7GLzf49Dlx9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iBMAL8juDkRnULNlaCqlJzYd5lqAo6pJgvJn4/FD3DQQuX87n/yZJo1OypnP?=
 =?us-ascii?Q?UsRDcif7gZNbRI5iqGeIUCDnb7q//W+YsFRiGTw5epjtfEWmMXcFetL51VEU?=
 =?us-ascii?Q?hlznv7njao8JaXmd09a9KYUBlxnkD2Z3cwoCP/rBpSDglZalIjWFQoga9wTq?=
 =?us-ascii?Q?qClj5GCKQilMK5ZyRkOvFn8ypwohuZaT/b+P0sVXQRWAIUXgSvUEeJ6sJ6vX?=
 =?us-ascii?Q?ikghV87pO+oMq1Ickm3lcrpizBJ4kUc03sm6oWw5bUH0xddBYaEHqmj0PV7X?=
 =?us-ascii?Q?jBzZvqC2GVqB/HKp7hwafci5ChWIh+/ixAvCFz/LwRwoLEpGAz+Su4fZnW/4?=
 =?us-ascii?Q?crmio0AN/Q0A/ts/kKFL4X12ANLrtgQR+IXh2uZvdIDcyNQWkCfO6e//taMW?=
 =?us-ascii?Q?6URnDxpcHRGW1+7gEAa6vxnPkmGMJ590Y+rvuSoeowN/c4NXGggK+vOBmiWL?=
 =?us-ascii?Q?hk0o3IhvcsfhUu4lidlyoyJBR6qQT15PM6Z9BnwhiAhQxw903W+zTKhFssp1?=
 =?us-ascii?Q?cK5RbopwExLEXlABjq9bCgSxCobtCWhwlbvF0XPb/or9kc2qoI+Hoi7k5XLH?=
 =?us-ascii?Q?Z4VqLaX2Jyijh5UjFWdhCw0svh74OqtYjs81a0UfTN0vgeXy7/o0MZqcfGb+?=
 =?us-ascii?Q?7omSxIITp3bng4VQA26gYQImm0Tr4lVlymV+tiACpi5nxUxFfjM2M2Ketwjt?=
 =?us-ascii?Q?khzrSzhEk6/0BfazLZQVhI87VHwE7EDEtdsyPC3SxyOiZE2XjrRTdH02Ijg3?=
 =?us-ascii?Q?TYOYkJgqJEZDYDmZULOreNxZAdIf+G56hLmfpny1EopSb2u6zIunG2E78To0?=
 =?us-ascii?Q?sa4U0A6QOI2ZW/mupb/662qw6ABiXTWgIm3qi/OOPr1merni2jQJhxxdJrtj?=
 =?us-ascii?Q?e2Rx5UKDzxU6Uo1hcDMUSi1N9qH8L8bzKToyOxksPcwjFU2od+mewu3m9f1C?=
 =?us-ascii?Q?TD+YFf+KKCa+/OD1r3mesF2gr/IOLIQGCP9JPPxCDaJ1BupLhpcRzPuh1lw3?=
 =?us-ascii?Q?jULyfjRKQO8B3KXqB5vvKfjI1qYT5twf7DV6dxvzlHFky+Wf0s2+Wel0FguI?=
 =?us-ascii?Q?cAfmrSUXupCvK1u2eUYWgPLTOtQ1AJBA2jAGdk2h9c8VJJhRy0+ysgPSAb4s?=
 =?us-ascii?Q?OHMfNKBqtNn6MuEt3zf6ZpZAogV1SCiaH37W6WQap/d7q5cCLnBEkp7KsIzO?=
 =?us-ascii?Q?rrNqktvyxFDf40z1NgiF+vgZFeUoe9Lu7D11i1PpZVjyQmWPUHDfmuCuDdZL?=
 =?us-ascii?Q?RkXzcy2hPkpENWRRPkXTQ1c/JA+em/T63H4e3JFl9aMZSYvZkEgW9FerzGxc?=
 =?us-ascii?Q?vE1IT4HtZk5p9XUc3oZUtnC+1kSuzOnt0M3jlrdvxZN6t1fTAO3g1fdWKDII?=
 =?us-ascii?Q?ZQCBx3Skb2mWq6aQZ3KF0ssYjiQrdRY+hQ7pX5H2LSCQLBdYCFE/6zj7Ne/O?=
 =?us-ascii?Q?suKiMuq7Xg0b/Nqif2NAMDyPwmR/1SEpYJ2lJAtrnySs74VR/klguj6wPmPr?=
 =?us-ascii?Q?9MmmK9+/6hM7pbBN2bH4Fyj3PrsSr8OjePhBvfPddUFQSn2yn533QCubiEKd?=
 =?us-ascii?Q?/mk182ZMeA+fpDJvZ0wNnEOrszASlbTHXhywtwP9?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b19639fa-9005-4c88-c83c-08dd30a555fb
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 12:01:22.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETtKG3GirM0TbOwmljyR+8rEWqOG2+ouC9UFgjkRzaZMgzCPBqxndXlqYpxZIT/7EHFAdUlpx7vCm6HvNpT/ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6458
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_040131_640706_3E9C897B 
X-CRM114-Status: GOOD (  10.52  )
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

Hi Suzuki,

> Is it not better to have separate "configs" for perf and sysfs ?
> And etmX driver can populate the "running" config, based on the
> mode specific config. That way, the configs can be updated
> independently without affecting the running config or the perf one.
>

That was i've tried but I've accepted Mike's opinion that
it's enough to check whether CS_MODE_DISABLED via coresight_get_mode()
in *_store().

"the .._store functions in sysfs should use coresight_get_mode() to ensure
this is set to CS_MODE_DISABLED before altering the config,
which ensures that the trace system is inactive.
We don't' really care about reading the config if trace is running."

Thanks.


