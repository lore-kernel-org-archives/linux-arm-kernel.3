Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707D4C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmytSW5t85CAAUF8zU1nLaZq19UYTLcY0RXfcP0CySQ=; b=3iuamJ0hrUm8of4F8H1SDWu7Iu
	me3dmTNfWQkgLAfxLC5uyK4g3bTkGCn6q+5yq72LyG+98mL1upB1QeNu6BzRcgi09diITohzswmgx
	8KWCfj2xQWHXoKBQexnPbsxqiIDdy63JwxwJ18FzY4a4LqTjSnOkK4hzd4ibOM2qjhECMUDVHW9/9
	SOA9PRG+y53CI1HgmWnn9po3MOESKQruN6Rv9TWIaeLZAhYc2OFkHeSJVJHVIngRhuVNVMqcb7P5N
	XwQkCsIp+RxLpXEKLkZpiTP/J2W+fli+hBt6TVzgA+E3sG3hD6V3A1PfpRR7rVTe/awL1aR+Y9L3x
	aRztv9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq0p-00000007Cjr-0UUC;
	Mon, 20 Jul 2026 15:34:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlq0n-00000007Cjh-2Cxx
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:34:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SmytSW5t85CAAUF8zU1nLaZq19UYTLcY0RXfcP0CySQ=; b=bYY8cHLhvMRXLDZN5eiRq5chnH
	8dOiCVSZ0jaPFTqQJw+GBbJXpj+c4etPIxma08+DulylVxVNY8YJEmLTI1Vcy9oWAAMhQ0/l5B3zg
	o8+lKgV7Rh8nx+3fyH8dlunyKP1oZNHWygdoFJh06gjJ3btbQHX7TzH2C0OKGd8cwXNTm6d9mSQrh
	zXDdCiy5YiDKmQ2tFqP65FID1px5BNbdbfUBJ+UODoBu4FJ8xtdUNCYetrtXj17QMzzUc3oAZxcH8
	F/C43f1o20JopfXYfyPo8q8IKaXNrZw+bkT729VKD4CX9AZze9axImswP4Jv3M2GF5Ndktl4m4NkW
	Drn7z6qg==;
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlq0k-0000000Gjs0-1H8V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:34:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8lWDdFHDMzHkPGQ7yejpvUBBPIc5J8U30BhYWmiCELcwSBO93/hGpz4lRkJ0HqIEOy8FhZ0GasC3YYwftfL3IIrlTeapNayP8y57/9v7RSF5Gri/4PTwpRknbC9fPZ9UzAdoDA6tYF+BcFr8mg6xhn+T7n2LXKX68q+Pp6wGoMfB+wOm34FexQx7QyOKQX2Mk0pNmyQvN4lSxmQI2020q4eMWx4zOGeeo4BSd9y6MrPrJSdOw9lnQbMjPQkaszYqvjW+Qcq068+iqH5PL1XPRei9AtFWcIO3sK9vZsYG95veO/yAtQvNu+O8roM9WRwUMlPbFK9JUeMDtjR5d+QhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SmytSW5t85CAAUF8zU1nLaZq19UYTLcY0RXfcP0CySQ=;
 b=GSXQAuvMrAPTQ9DhhP5kZAVfsvdZNH1Vp8Cah9sUeST7RzpyOXQlML3fdEnWT262UbBo2wjlFSo27VMTNI/+e69yowo4bFrfJdLgovuu89H5E1AY6oD7L8dF0ubzBJ8m/HKuZGzZ+VjFh0rNLHKO8WrGEt0dmGU1ew5s4ogk4g7C634T4sKDcSbuicrKFLDAmjxQliRh1SzOC21FbhEVhzByAY/DAu1FNiqfxPoVnoSNuRfzfYrGT12HlXGLGyhsk8/toAqDlOb1GMDMhiGQP1GAuGBt3tx50pcMF9q2BhDtnQmPuGeI4sKoXJjFc7OueMqEKZYCr/IfTQHFA4UYRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmytSW5t85CAAUF8zU1nLaZq19UYTLcY0RXfcP0CySQ=;
 b=qaKjBD5pNo8du7eM9kksEi1wq9BLEn1SL+Kn676MZKfuBE3fUnHDd/8RpvZbf0hfjw21+PJz+IUk9WWmUcMFbnrwgNGFYb9mgSWcDYcdKXCLgRSJ7YR0ompuFse9Vij8y2CXYSZgUXpO7xqG+gjXh/eY/T4hBzwkJbBcZT91ScD91mVqmh5s/ZtnFzDvOMCSKshNSLIN5MMRVIQepNbrHetcnuo6OWB7ke0DwHqQteGP9UqsiVCC4VwwToBSSt+m3EUVsmy4AXIFoHDw7yK3oa29dh7f1xIfr/YcD74FhN4UoQ6SzNyh8npWxKgLb87opXi2yc5ACCqeyPolzQT/Qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8152.eurprd04.prod.outlook.com (2603:10a6:20b:3fb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:34:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.012; Mon, 20 Jul 2026
 15:34:24 +0000
Date: Mon, 20 Jul 2026 10:34:12 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/6] media: nxp: imx8-isi: Fix per-stream reference
 counting for multiplexed streams
Message-ID: <al4_9MFuz0lVzxHc@SMW015318>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-3-45845bc5d4fa@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-3-45845bc5d4fa@oss.nxp.com>
X-ClientProxiedBy: PH0PR07CA0097.namprd07.prod.outlook.com
 (2603:10b6:510:4::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ece4a0f-ecb1-4021-d196-08dee6745fef
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: ZHLfmea0FUwVCyYRMautEqiSBqw3nhRazZDTWgZhrdnfUew6G4zJL/VkTLpm0EldyZWUI7E6cJfTY9uOJe9NAFMf3YtfMSw50xyIgcrkWZcwqs45g0DKdZfZzIxK0mOjM4TYgrsjjpRIOwlKuUHLSgW4xRimvUwZ+daISQhuRa986g2ka6xLccStoTZ2F7MEfl3lRJaXQLWTRZ1s9MTtqwQz1ZCrzRzYAVRsU1Bu8rUlxnXvyUl5NzH+Tk4ByFRecMPu2miqq/LDKnUrnKp5hc0CN6AEL2qogUcNsabnMpcw4by7TPs2J0GpGitTjpmZoFCpAU5aHxIXCD/pwH2nqw4ltaHM4/JyaonhZ2Ryea1BvoPKrZeRprPzH9apAmlfDKrQWjcAefORHh0TBuM2UuiaeZe0NkEKi7O5BwL0ITLABg3U2YzyjViCATWyUrR+omX4CZJQBKTw+jebnfc3wnZrzGtpyd6ngt9P/7oynPuomTnS71Sp2jFyl0DtNJFMvOuy2N0JVGMS54rQm4PDNvDQC3DGXZzHxKRVI/DKvOAkW6iMGJqnVxn2AwW8caPsctK5OxJ3+SyN1wlmF55P+GP6N2LwJuzNvW0I3Jl9R0mStSeqP4HvVxED3II9aH/ttMJOEF4nTkyiAGkn48JZHfpGYEVwXJpxZTQyNcjOjoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vs8uI+Ytdg/s+yhE/jHdfxLixo/gy4tVz9aFf8hGZoRkst1eOUloY1akdE8k?=
 =?us-ascii?Q?x8rVvLpCFh/9tnjv6Xey2pd8XgFER5+ZRoqH2itgj/HoHJyvWhmvOSC5qU3V?=
 =?us-ascii?Q?ObxgH5zZfSZYXZ79WnlpaaOEliPGEEn4roexjoIQJRDtwEulQAwD+6S99GDE?=
 =?us-ascii?Q?k0d0nRYNr43h6zQRsmOyikMvw7Z/zuxkJB+x4UAW54+8DaxiGDTSEzqo3pgj?=
 =?us-ascii?Q?17Vy8Il5yL81lf9A0TPnQ5Pf4quOa5ywDU+Cy67xanEh8QW1eP3TH69I1D1g?=
 =?us-ascii?Q?ZeRi9eOUqamdHbsffAcdgsXNfdH08CbslDTXOsafCjo3pN4X+3uXq2ioobwr?=
 =?us-ascii?Q?AY9TOTpK4ScoWv18VMRBpxem+PWPldbJjk1V2CMieGH5PdqdLryr/x3sQHOg?=
 =?us-ascii?Q?N6SCDsCmrjcVr4Y2idjPJZ+2bVEhAfuBfAqxp5L8TC9UwB8GiJkSTmFkCjHw?=
 =?us-ascii?Q?84R5Qc7a71ftu8eo3NRkv795pVGq7yGDe/qtSu45wEkxlw6nkRazv1Aln1Jo?=
 =?us-ascii?Q?/PX+EOTELujTiY6Se+cdHaDM7GsI0dRLfuODEud6wylvJoNJGerS9aXNXbvK?=
 =?us-ascii?Q?Tl1khjzOkd1z/P1mzcBy2FiqAM4ryMOyIBsYf+zsac0mGXgomSiPErDsX6Pi?=
 =?us-ascii?Q?MgIteulMaSmgsI02LNgHQdFBjV1/HCotXWYX5ti5SUdTFjVol4272FvbKZfz?=
 =?us-ascii?Q?3bw7OHgoaWz75ksd/a2EmlduZRLjhj3IOS71mxCniWHN1C+GLFdITOaeOtKa?=
 =?us-ascii?Q?pG31jFsp+6JuhdoyRxK6dsNxv3KFFKbWs7Zsa+fMq7iArsmUSYM2ES2FhBUj?=
 =?us-ascii?Q?4oF5VLkE1hnFaJoM5UJNc8LQJkTeAcoOKQkGm5rUgNWrzHVsY+lcsWGDWkVf?=
 =?us-ascii?Q?PA8Dyvk3aacCSR+Wqqv3katXGRFrCELTBUYV95y0TXCuJDJ3+5Scx4Grkt7l?=
 =?us-ascii?Q?/9AI2sYrn/xRa8AgwTHQflxN0lz94Xqh9EcXWX3DEza6hcGVh6wqPmczb1fx?=
 =?us-ascii?Q?eIL1nsFIQdCZtqMcNf3Te2fQ1JxcIj1awq0Jh6mjTEbXWitQrCPVLZE/n62R?=
 =?us-ascii?Q?aKTQskYVTMsSUHT8MSWXpPEzRrSKNfglf+YPF1iod7qMzy74jyNaXyz05Hmb?=
 =?us-ascii?Q?gJottp0ekv/omD8cVBxWDNvlJBWoXzR7MTDe+/f/bFsyCQHvXKWHLQp6y50Y?=
 =?us-ascii?Q?yWZiC+QkiN7njYKEpNyNATSMm/KAsQN1erfnGPY6zMwwWtEXJc8/LRLq3uvm?=
 =?us-ascii?Q?Vc/20Nl6X7DN4Is+qa8+zSA4Zp3I5/iC981KmxlwvzUvbqCAQ4putmXa4tED?=
 =?us-ascii?Q?VZp7e0VHzzLALp2TU0tzSRLvJSOYzD5/mHJNnWZ7vuBu/PBzad66MYJzekO+?=
 =?us-ascii?Q?VMwl74crHvF6DWVPijTxUdp/8vVjkDE9/vjXDX+3r3/lF/9IVjkWogX4OhwT?=
 =?us-ascii?Q?syXru8ghtXcZOXNknYahT+7VkBBI4ZtDdj6U6mRmd9RmvWGkn1lxVoaPra8h?=
 =?us-ascii?Q?DsZIjaPYIQMXifILjVaQ4H5D3/1tTArHC7aRzH8nt5T8dDt9ItTt7HLI1Hz3?=
 =?us-ascii?Q?m+SUwNBi5C+LG8TIlCShH7xDAHG4Q1Iw9U4pGyD7zrdV6mQfS+Yg0kKJ1w0F?=
 =?us-ascii?Q?dVEgdeOGqL4YcNeDrhp+0VelbUrUbNer0kRV5u4lPMuisBHSGeMylabHWf2h?=
 =?us-ascii?Q?B3IVY6M/jNQgG5BF/SUD/HJQnVYp+mUYh2zB6tq1hVXRotbNy9wTQPC9Mibp?=
 =?us-ascii?Q?2VM7OJlBRg5dUyyqdYydJgP8ynN7KeFJhxzqKPOb1PCN8DMXn0uE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ece4a0f-ecb1-4021-d196-08dee6745fef
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:34:24.1463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjjMo4LsttB+36GT+XxEH3n4fytq4KvZF9VTqpXMJ9aI+lGdL1BIIKL0TWvCqh6SVGi9hp+hBjo5YThbsCayEiWXHMKQA1GCsEMyUogM5pvSzC0XDxLWzp6Dt6eXmwA8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_163430_514675_C45E6F13 
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

On Mon, Jul 20, 2026 at 11:34:05AM +0800, Guoniu Zhou wrote:
> The ISI crossbar fails to properly enable multiple streams from different
> virtual channels on the same input pad. Only the first stream gets enabled
> in hardware, subsequent streams are silently ignored.
>
> The driver uses a single enable_count per input to track the input state.
> When enable_count is non-zero, the code assumes the input is already active
> and skips calling v4l2_subdev_enable_streams() for additional streams:
>
>   Call 1: enable_streams(stream 0)
>     -> enable_count == 0, enable gasket and stream 0 in hardware
>     -> enable_count = 1
>
>   Call 2: enable_streams(stream 1)
>     -> enable_count == 1, skip hardware enable (BUG!)
>     -> enable_count = 2
>     -> stream 1 never gets enabled
>
> Similarly on disable, when enable_count reaches zero, ALL streams are
> disabled regardless of which streams are actually still active.
>
> Fix this by tracking per-stream state using:
> - enabled_streams (u64 bitmask): tracks which streams are currently enabled
> - enabled_count[] (array): per-stream reference counter to support the same
>   stream being enabled/disabled multiple times
>
> Now each stream is independently enabled/disabled in hardware based on the
> enabled_streams bitmask, while enabled_count[] provides reference counting
> for scenarios where the same stream is enabled multiple times, such as
> duplicate cases in the ISI stream.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Use fixed-size array for enabled_count instead of dynamic allocation
> - Use BIT_ULL() macro for u64 bitmask operations
> - Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
> - Remove mxc_isi_stream_counters_alloc/free functions
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  7 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 76 ++++++++++++++++------
>  2 files changed, 63 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 7547a6559d4c..9adbe2fe7cf8 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -184,8 +184,13 @@ struct mxc_isi_dma_buffer {
>  	dma_addr_t			dma;
>  };
>
> +/* V4L2 subdev max stream ID is 63, need 64 counters (0-63) */
> +#define MXC_ISI_MAX_STREAMS		64

Any existing Macro define max stream ID as 63? it'd better to use such
macro

> +
>  struct mxc_isi_input {
> -	unsigned int			enable_count;
> +	u64				enabled_streams;
> +	/* Per-stream reference counter */
> +	unsigned int			enabled_count[MXC_ISI_MAX_STREAMS];
>  };
>
...
> @@ -396,19 +417,36 @@ static int mxc_isi_crossbar_disable_streams(struct v4l2_subdev *sd,
>
>  	input = &xbar->inputs[sink_pad];
>
> -	input->enable_count--;
> +	/*
> +	 * Decrease the enable count for each stream. Only disable streams
> +	 * whose count reaches zero.
> +	 */
> +	for (stream = 0; stream < MXC_ISI_MAX_STREAMS; stream++) {
> +		if (!(sink_streams & BIT_ULL(stream)))
> +			continue;

for_each_set_bit() ?

Frank
>
> -	if (!input->enable_count) {
> -		ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
> -						  sink_streams);
> -		if (ret)
> -			dev_err(xbar->isi->dev,
> -				"failed to disable streams 0x%llx on '%s':%u: %d\n",
> -				sink_streams, remote_sd->name, remote_pad, ret);
> +		if (!(input->enabled_streams & BIT_ULL(stream)))
> +			continue;
>
> -		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +		if (--input->enabled_count[stream] == 0)
> +			streams_to_disable |= BIT_ULL(stream);
>  	}
>
> +	if (!streams_to_disable)
> +		return 0;
> +
> +	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad,
> +					  streams_to_disable);
> +	if (ret)
> +		dev_err(xbar->isi->dev,
> +			"failed to disable streams 0x%llx on '%s':%u: %d\n",
> +			streams_to_disable, remote_sd->name, remote_pad, ret);
> +
> +	input->enabled_streams &= ~streams_to_disable;
> +
> +	if (!input->enabled_streams)
> +		mxc_isi_crossbar_gasket_disable(xbar, sink_pad);
> +
>  	return ret;
>  }
>
>
> --
> 2.34.1
>
>

