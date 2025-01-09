Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A255BE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxoPBG4Vpt094NCbhBZi83tFT/dmeRzBgd6WEYltkeY=; b=HfkgoQtVMxIF7ZI5L24nmVorio
	L5JP1j9twX4V8EpHl1Tf+G4cT8qrrDRt+dY3KDDaAThX/0t/Lvaw+wPkvtIW+4UZA/4dBWgV214Wd
	MaCbazPiUV4o7oRvUHHwaPL/zb77Va+ilD93XtRPjnwxIKexZaPhRosufxIw94W+aE3R1TQ4m5uq1
	yHwe7NhvAmEUUVIXu2H9VzjcVJpYuoeMwFh5aCPAoz3CE3CMa6AK818fB8kgjlOPbtS1dtWPqpCr2
	GvbwRhYWc8g3Y15k7xWBrK9xqcTKF0zE6jxJ+2JNF8Q6//LM6zmX6vyV4Xajw+gKCQmk/w8+Bz+ed
	IaA1k0eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwXX-0000000CsFV-2DmY;
	Thu, 09 Jan 2025 17:41:51 +0000
Received: from mail-dbaeur03on20605.outbound.protection.outlook.com ([2a01:111:f403:260d::605] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwVQ-0000000Crc7-3irN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:39:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CG1LYjBIQ7V0n7juhPc9Gk9426B/P16Jm+aXwjew9mHW97m4RY8zdz7LnzbwIFN/x1OUiCHQeWyFqp/8NhyybTK2URKy1kofpeiGqQ2os0YfvVnFt5F9e6xt751hpRzxESqTn0D/4Ul5lTePO61k6Uh7uRdfMVUkPGxCqYBwWgsqGKN7mx0d8OL5C7JhQ7HxNuVS8My2NCEve3VJwAoThSGgzU98xHZrJ7UaEUEjcoKXJ9R9Y7TYrbr7qXEd+Tu2DKFOvCNqfVzui0dw80DGz2MCm49xVS/uBp9XyW63H4qmDIyPUx0iyosgD6tOUM5Y5lwfiSNCj+Thmw0KcYLtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxoPBG4Vpt094NCbhBZi83tFT/dmeRzBgd6WEYltkeY=;
 b=F8cUyyyWn6BWZkge1yBqwdaG67QWD8cnaqDh5c03mdz+iMldxI/vwZbrgcDbuWhkCxX0lRSkEZ2SrHZH2cIjvfaZsUowFb20ghwOWpZ/SaJh+SD2fgLHUjQDjqwFE4xi7JIMLTr484cgYazWXcFnD5eIsn8A7xlX62smkpxpm1JrD3/8lAP/KmkHt0T0iXAdpLppyKgfy9CTODM+vVEnG2B2Z2GgyZ0uRX4xYytbwnSJsfqo6hIR1Kd9O1sOm9G0mYSLLqvV+xWmlbH5xTvY1wwYwlFI1Ocvi6CAcqUYIGiJewgzYNLNjR92/+bNz4d1q7Dc7SUczbPAW1UmT8gVgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxoPBG4Vpt094NCbhBZi83tFT/dmeRzBgd6WEYltkeY=;
 b=T6SHZfC1aPTl2czP02a2BQDP3M+96PUJQZoYFYqdhEMLaYwRBZwMLPqj2c0UgzoHrgCBLAVobkV73T4eaKQMXHQDToCXkWUEPaCMye4Zmycpyi1jQvd7QO4TEbplUvpP0V2vra4AYVRVK2biM9nMZb4Nw62dxyM22FDI+gHZV8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB4PR08MB8198.eurprd08.prod.outlook.com
 (2603:10a6:10:382::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 17:39:34 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 17:39:33 +0000
Date: Thu, 9 Jan 2025 17:39:30 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Message-ID: <Z4AJ0kc0DxVwhLlu@e129823.arm.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
 <20241221165934.1161856-2-yeoreum.yun@arm.com>
 <6bbc9b64-3ecb-46c3-8c4e-55dba6301ef3@arm.com>
 <Z3+6kL7OGDX/pNul@e129823.arm.com>
 <4f9d2bed-7ce0-429e-83cc-ad6cbcc6085e@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f9d2bed-7ce0-429e-83cc-ad6cbcc6085e@arm.com>
X-ClientProxiedBy: LNXP265CA0072.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::36) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB4PR08MB8198:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f29779-007c-4f85-8ac9-08dd30d49403
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d4/2TFRGv9cMRrANApmo7J2q/aWwizdPZQ4EwFSthjQYqL6HQpkl2t1qtVn8?=
 =?us-ascii?Q?OMDGWxm2kUTWxeUhR459D0WZnr5uZRqK8p8RINx26Yk9O1bVw8oe0YxvHkus?=
 =?us-ascii?Q?ZXzA5uG3RbDwa1DumTaz9rE+/ZYJkUap1vMc7CJYgZPCkfRogmjn1nmkdAKP?=
 =?us-ascii?Q?ArWWXBhPQIp2htOkUUgHxF/zozOyj2sWFqR+48WDEdNG2zkMW6x/lvRjxqYM?=
 =?us-ascii?Q?0ROQqv/FyC6qWSwP2t0N2MuoIOOvX036eRAhr8ZBsEoK/rau37nElPcMPKJk?=
 =?us-ascii?Q?E3+aPqS4W8VPkDf7QRP41NVcUxd8Tge/p/D7QMP2jLkEhCgmHPrxnjhUrAKe?=
 =?us-ascii?Q?6r71NxTffNYOZgpgbWfeakrsEurpl9oTg7NcuY9UzBj7794Huz46Rq/Zar0L?=
 =?us-ascii?Q?lyvtzKu6H6ofEzY/xKCNG6k+HTuy1Mq9KxGJbj5ujwNgz6YCdNvQ97hYddsV?=
 =?us-ascii?Q?sTB/Q9EM9dEGyAw4whzYMWZASeVVGaURXlxZqMVeWOmmmxOOGQ0x4kuNbFTX?=
 =?us-ascii?Q?Af/JowDOp2mLATouWFimbM1o0FJCGns0Z0ter0AA+1GPYGWqUWJlJwZwZ6sJ?=
 =?us-ascii?Q?FUraDAFz2s+3UIjDppp4/FXd00ICCLlM9TYMtAS20f35VDcicuQ1ep5oGmi2?=
 =?us-ascii?Q?uMReaxkjWUJjOdxoOG9VXNpCOUuXfvJh9TIMB3ZRsX45c6K/pb7ImWlonHkE?=
 =?us-ascii?Q?YL05WVjVL9U4Vpfz/v+vhr/PTrHzx9O5LOo0CLbkH/2qzZARLnS38ydW1j0U?=
 =?us-ascii?Q?AJqMI0Y4ZDwgeTFOS8C4k6BuE3k2ipKSvGXfHdqPHoowzzLrVLXQaoV3gr+P?=
 =?us-ascii?Q?TK0VKD70WBXEC8hyajgDOHXrFrtPAkUuT5KLV5tRrcWrv+Qwenk3CmUskA0O?=
 =?us-ascii?Q?DKtISw4TM3v4aWKRQIerM5R/p2sNUs+6mbyQGPfWmPAAIi66PgW0nycyWJLz?=
 =?us-ascii?Q?1AkmYnEbc6Fz0yMFQQCyCDTF5gDyOXn6OFgTcu2XKor+9OkETwc7uTjGVhn/?=
 =?us-ascii?Q?bTxBy221FrabAprVef/390SZG02F8D0FxuRUDNeEdJa29jXWJ5Od19uiKMJi?=
 =?us-ascii?Q?ZTtX7lLut4nHce9j3r3QjwG+bWRSwzlAp5lGHvLQTnw08sdH3TJOievKUnzR?=
 =?us-ascii?Q?czGCPKKndX6YohWqTn60k8x0e6Maul27kTYeqsmfgnzhSFYyaImsQizLjp6q?=
 =?us-ascii?Q?HPWUQc51t4bxcJUfrTs8yxC9+G9gqeYd93pTdbSr9eKO6t+0fH7YlKVUNvjW?=
 =?us-ascii?Q?9JoF7AhHm80aBkfI2cobI6v2wgO12oMPXEwicmvc+qVMocv0fcBXCXqkcfHM?=
 =?us-ascii?Q?5olvoubpU7+dZz0jT8ibBePdniZ7SAlOi2O9Z0O7l2obVHnFbQ5T10b3Z/Iy?=
 =?us-ascii?Q?5xq2PaYhulo1Ii/QxtA1mlkf1uuC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bUDJYXKODAVtudolBblTyn69LREXPD7lLzwnpc6BEEWL7sygxHYlDaAy2dWS?=
 =?us-ascii?Q?vX71ZQHZxlmVxtFKCud/IdewJuF7oRYcNdkVjLwouEFGLNNSdTwo9i+2/uWc?=
 =?us-ascii?Q?XSJeQG5mhE7VWdYE2jDq8ap6/ZSYt+PiHqgf8cidLckY4b+sMmLmLbaA9vop?=
 =?us-ascii?Q?90YQIS+SPG1LLpMFFXs1WAeuM9YQp9wclDkgFZYQI+3j5MgCli8CtjqE4DKV?=
 =?us-ascii?Q?E4aTv3zPJ5kIE1mtRy7oXnbdE7WYsncQbrEtsJx6dqqjqVMT4VxU4pqYFjwY?=
 =?us-ascii?Q?Jlx0JJmLmqkf6MeTwA551LFKGIiFT0cdlbc1qE/7srZmqD4RmmbKLQNhqWym?=
 =?us-ascii?Q?nksJSNRDwfx1D3WDB6clO4b+GSHPv7Oo8q9gYfvDNoaO46oYuaE4+5foud98?=
 =?us-ascii?Q?5aqDoE3nYUSsvg1SUme2oXIcsHcSCOShS8OYDS2jUrOHgS80EcT/LnbYJAo5?=
 =?us-ascii?Q?JOLCaWP9oD4TbhrnVJm7KTZ4zziWT0v+7GB6/wQZrEFIkCqjQdToJxERV0Fo?=
 =?us-ascii?Q?Sh54Jdd1LuQVrFyDtGcZIJB5aKyXBjxgrHN0pO8RXvEKIl72dJfmJF83goG1?=
 =?us-ascii?Q?YqJgzltL9OH/RVWHt6wDXDJi4DCHrh96pYaWPbNsK99aAl8vWiEwSy1FsE/f?=
 =?us-ascii?Q?pZdjMVi2OB0ds2An0GxonRAK9cIiOrxdI68Aw0Nq+C5zNmvG/rhBbd2n4rP8?=
 =?us-ascii?Q?eBpgoGWP9wwT5o2KcWOnpGzY8BBmY/CowGqapLOhGEgcfOyZilvCQcpuBJ2W?=
 =?us-ascii?Q?Qic5yqZyq/g16R6YtE5lYd1yBcRjs+VcKd//+QVjzJgPvX612dinOVQGaDgz?=
 =?us-ascii?Q?51Xe5g+6rtwbg3lJHPoeXGnhnFdd8hQAzOFYZRa2bMbl92jeD0C6/9jzrZ1T?=
 =?us-ascii?Q?77u/Wl5sqCJYYjkSOc2wVPAyR93W14ig8T3imtJoorjUq8JldM0D1mJgw/hB?=
 =?us-ascii?Q?IoMTAnmYeAOM2DTDgalgSXQUUuWkEHDeBA3c2UPzDS7V3vI8Kz6a92Gv4syI?=
 =?us-ascii?Q?Aqe40IZwEf91v89fB2ZAQagpLcDOk7ax1p8of+BYtwTaxT852bj0vcVXx/n6?=
 =?us-ascii?Q?YKbg6Y+CCBYn+ZJQk7nyp2me5d18cnRsReVwRkEDvHwp+vsH4sKHl9aedoNV?=
 =?us-ascii?Q?2/iiAnM3vBUl8IKkT2/GV5Na0uLgQi6cu2jf37uUUj5CHQYMrbIOh8OwroB5?=
 =?us-ascii?Q?PbGVIULI44zIDhLHaWDPHxQ61Z7G1I8j/j1xSLqSHIOwwvIgZw3W4LFwyNYT?=
 =?us-ascii?Q?gwt+3Yu8BFhqxBmiUJqM917xMSs7MjY9p+qQ3MwenE8EDVptEJW+BUZNnmbJ?=
 =?us-ascii?Q?BaYxr7P10QuKyvKqCl0gBLVdweBHsz18VezjJWxkwiCjH0aZ+Tc/D/GS0QpE?=
 =?us-ascii?Q?QswlnTZPjCXsmHF7caTMHOdIJSvZWIHtZVZddMUeXPt2+NXJLiD3KJT+lpqR?=
 =?us-ascii?Q?vNqU2rVbIIZyBUc02543tw3gQ0pWNHN8bAxREc8Zs60S/xF7qtqc56MjZGHE?=
 =?us-ascii?Q?VxZCqDpJNN7zYEnMYlisJDNt1QEr4+mjdFJlK31YxL3Q+oOGl58ZCnhLnFs7?=
 =?us-ascii?Q?JMipX4wJbQrpCnclbsmIpWVR+mHkDYNKq/psM0pT?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f29779-007c-4f85-8ac9-08dd30d49403
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 17:39:33.2625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T2Y1EzN4BMmHzbqQwTl13b2/IOpWeHKGb0S0GO14+XytYEiudcqPow67F0qGJx/+YbFVQia+wN8ExQC9G7/whg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8198
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_093941_072096_B77A0467 
X-CRM114-Status: GOOD (  23.69  )
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

> On 09/01/2025 12:01, Yeoreum Yun wrote:
> > Hi Suzuki,
> >
> > > Is it not better to have separate "configs" for perf and sysfs ?
> > > And etmX driver can populate the "running" config, based on the
> > > mode specific config. That way, the configs can be updated
> > > independently without affecting the running config or the perf one.
> > >
> >
> > That was i've tried but I've accepted Mike's opinion that
> > it's enough to check whether CS_MODE_DISABLED via coresight_get_mode()
> > in *_store().
> >
> > "the .._store functions in sysfs should use coresight_get_mode() to ensure
> > this is set to CS_MODE_DISABLED before altering the config,
> > which ensures that the trace system is inactive.
> > We don't' really care about reading the config if trace is running."
>
> There are two issues with that :
>
> 1. Sprinkling the get_mode call in each sysfs stor function doesn't look
> good to me.
>
> 2. Someone preparing for a sysfs session must not be prevented from doing so
> just because there is a perf session running.
>
>
> Suzuki
>

But, when separate the config, it doesn't show anymore the current
configuration set by perf.
I'm not sure this is okay.
IMHO, If perf is enabled, since the configuration show the "perf",
I think prohabit to modify config via sysfs while PERF_ENABLE seems valid.

and about lossing session, I think this is up to user.
That means to use sysfs, user shouldn't use perf to prevent loss
its configuration.

Am I missing something?

Thanks



