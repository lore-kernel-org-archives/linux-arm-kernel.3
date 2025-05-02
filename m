Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECE9C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ua1Mgrs4EITkHu9Wlb1C/DG2JyxIPBF3sI7wLMdZxek=; b=m0xebap38VBB8OZfM+WaRv8s6D
	gCvby2K0pCEEu9q5C2AxEBGyDrxPtcz8LWjHm0NW1cmkC0lhx4f+x6wfwXLx0kLe/NzvdxSGeuhwX
	Pkf9DhskG38++dVBXXFbNxXMxQV/dPn0/GrtXeWo3Kmq9i0emO2t12rkZa3fbTV9sYgrRXD3G9Ssr
	OuFCc3OoDwZ2NMnk+k38ZxDYqAEopkCPBDg18CIV5HtY+i7JuFuoi4U3YTQLzaJx8LAZ8z/rOrKpf
	XekVCwJkOzT5fgspXAyJBRt5JVyq2OdbLzo6EdU33YBaFY1yMxgamoiJx03Qo7rCze3H5EuYHu3re
	AwC4bXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAo5k-00000001hks-2VC2;
	Fri, 02 May 2025 10:58:04 +0000
Received: from mail-am0eur02on20624.outbound.protection.outlook.com ([2a01:111:f403:2606::624] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAo2E-00000001grp-3GSb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:54:29 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zNxOI2I/PaWS9pvLaAy8PXfWr3zUIVc0fiQ1CQNHZFjfP62HfPaFuDOG4ThnFpyNSoZxy6kAtGlgkyisXtZf+tekOmNnaCSItp+P0KK+zdhDGUuQgjsOnLjbqlCeLfdyMGXo5wErxauhODtax1OiXU2uu+ZRVDncIJk2V/yKWDYY4cb15Oadf9RNJFILR32cbvE5dq51MbBHusNxKBrJOWtEHzN1YvIISRQub22To2PhY5gnkhuTR4BKzw/lzMIIetd8EGUBO6O3zCok2iNZmJCWO+kdqDNGF0rnEJjQcxidifHKmvGr98ZPDE78IgrRTpw0CSamMwX4aTzjPDsWOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua1Mgrs4EITkHu9Wlb1C/DG2JyxIPBF3sI7wLMdZxek=;
 b=K9IOqciu+ffAugPN39d+9XQ+InhCgHbtF9mOYipmABm10L8o0dFJ+ADhD1q5RZC7ngIeX/L8v+NxGaL9dvBrLOzAOGnKqWVlBnF8CQbw0IrlYvgZpeCihpkVIiFNp7zSrYGpyt4Ev1SjOWSoss8gMYJ0SSp4O5TLwuCbkQ7bcsojEnU/SZX22qPDsogy1jQk5b2HS9WI1/GavbvH6XyCQdpbWV/Wyh7kMbxbKPJKG6fz4NGDf7nJloVmTCADIHJjTLcWZWX/VrSocOtjmunYUaFAqtnZJ4WoKEYbDtMUZui9JUjVt59BPOvsB8WQ+pfM3NWN1pOb32qmvhY6pITrXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua1Mgrs4EITkHu9Wlb1C/DG2JyxIPBF3sI7wLMdZxek=;
 b=mlB19LvwqZb6BDOfLB5GFAVCfrzpbJL2uhTpYTinav35g95VHJEVirAgzvuHM9QAZzep1EhB3VNCMDc3udMqmuBr0FQy79RHKztpkIAq9trmlLcBfPdODbk7Af48bWMHBTGkrVDdcbPtKA6mCu0xpgxk19o0WeKE3SZVCmzAUjk=
Received: from DUZPR01CA0106.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::14) by PA4PR08MB6223.eurprd08.prod.outlook.com
 (2603:10a6:102:e8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 10:54:20 +0000
Received: from DU6PEPF0000A7DF.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::9b) by DUZPR01CA0106.outlook.office365.com
 (2603:10a6:10:4bb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Fri,
 2 May 2025 10:54:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DF.mail.protection.outlook.com (10.167.8.36) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.20 via
 Frontend Transport; Fri, 2 May 2025 10:54:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/M8w+QPI3HyWSuRIHbc/Tv2ladBQf9juKBqBRe4KpCHu5DsTiwm27AH/vsp8t2KjbBV35OSAWzjWIivl1+NPme/efQJOPBxmip9AoKgVzv4c+SFrc7OjtSrlhEGaw0LWQ9mFpiNgI7lmn1stddgebaT3U6GxYZqbW/qxkcPhJiRWpHt5VKZAOmZvTvHBWW1bmobVVbB50WMc7izX0xOlHvShdxfCukyAOHGjI4sc1K0+0rqM2YMpSht4qHjjwzD3GoQcj5f9v8heI+sHWs6NEhRmkrPxt8/mme7eCjzWFfa3jNN7JrZQottUGPQLUmp64342PFitQjfTl4GgLqE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ua1Mgrs4EITkHu9Wlb1C/DG2JyxIPBF3sI7wLMdZxek=;
 b=QSIGj9B5GzG2FuKDbRX+I0WahnGD6h5T0IL0ZvmP2fVgtNzF9XZsMI+g15/ak3QkqiNDlZ0CH6jQhMxPkt18IEniyxsKRTv2lV/x7K2undTptnZOZplSN71V943dUvjJXTf7pif0wuRJvOy0+9uu6wFKzqJAfY2ydE5t7ajl5eLCgLkWlC6PyMJDEOGsrqES094LFwB/vbYNpbj/4o64WgIjktTLO94X+NrJsicjo/imfdfugno5QFUCyQ1/CUQeCJ+A3qaloi4o3t88CqVu/ZSFJP++0lL/ilJhhpxojCvJRMoDusq5Ra+xmwFU3j5tjC33DJWvEMDTRKCvzjeg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ua1Mgrs4EITkHu9Wlb1C/DG2JyxIPBF3sI7wLMdZxek=;
 b=mlB19LvwqZb6BDOfLB5GFAVCfrzpbJL2uhTpYTinav35g95VHJEVirAgzvuHM9QAZzep1EhB3VNCMDc3udMqmuBr0FQy79RHKztpkIAq9trmlLcBfPdODbk7Af48bWMHBTGkrVDdcbPtKA6mCu0xpgxk19o0WeKE3SZVCmzAUjk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB8PR08MB5386.eurprd08.prod.outlook.com
 (2603:10a6:10:f9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 10:53:46 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8699.021; Fri, 2 May 2025
 10:53:46 +0000
Date: Fri, 2 May 2025 11:53:44 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com, mike.leach@linaro.org, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] small fix for configuaring etm csdev via sysfs
Message-ID: <aBSkOGdRygbhTym4@e129823.arm.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221165934.1161856-1-yeoreum.yun@arm.com>
X-ClientProxiedBy: LO4P265CA0148.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::12) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB8PR08MB5386:EE_|DU6PEPF0000A7DF:EE_|PA4PR08MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fa85b9-fdc9-451b-4435-08dd8967b112
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?6Ya1vAFHH2XYu9SkQ06HsFjvYRH5838LeogN3Z0PyhR2FCN4yNRc9WBfK87Q?=
 =?us-ascii?Q?mGLBVnh9h5pQJWJ9hPim1WSjKQHoPZGOK95BHvXAAYcV++qyO1z+z/hTLQSS?=
 =?us-ascii?Q?0JLWGrsjxSa8+G173/0se+rFOQCVAp0f9Cmu7BmPXn0aXjBvTr/eo1IZwFLA?=
 =?us-ascii?Q?LYjbNfpfMt68DLq93CvRTwn2pxV0r0gYEM3jZDCnlgHoDyCVBtJbW78IENQO?=
 =?us-ascii?Q?HiNdWX4jbb4/KhPj1IUVBqcPM1ZA5dkMN3oCuH4grdgxCpMFrWMRgHLEKy2Q?=
 =?us-ascii?Q?sPBjZ9Cpa8jrIamYBAynPAWP4Wo5vXt9MHayIMUHtzgAxYus6IH7AsQb4aOn?=
 =?us-ascii?Q?f9tgYkqVYXKmZkxpDO0tzWdoCLyMgHD3LpBFbN2nRIdYp6xcOXVwdoZ8ktyD?=
 =?us-ascii?Q?oYZnMbxZSjcYmNTQ8NtHdd8DzKVgWwYVX/ErkKoaJswZYIK3BLqpMTficcAc?=
 =?us-ascii?Q?E8U204xCAYWB805rwbUsdHTRrDJbjXt55KVKjDSX7mF32qkCtHUVPeXGs7Wa?=
 =?us-ascii?Q?Da98qoM+ogVD6Q/f7eLisvxRqKurHXn5AnivOzt+1SV6U1sPk0tOutTdS8Rl?=
 =?us-ascii?Q?am6ac4tYkliXCg+NspPHGOdJKtnI7BtqZNA2x7MCtniwbZJPq9kzTmHfPsDR?=
 =?us-ascii?Q?agR+Gu126u8k+MHxpbEjeGpya5EQ06sh18uFxbHW45fwYELPRIIPsxe6UfGD?=
 =?us-ascii?Q?pkZPgh5g1JbP6d733WQrHEBJzFWx3lGJEWW2S0W0bkcJl7aXBiM9YQJQwmUr?=
 =?us-ascii?Q?5euXaVrYByp5FqYlsnpk5wOf0Bptghde3+Q1Z8zWJqkZkb0j7Q0Pu9qbBJ8z?=
 =?us-ascii?Q?hh+diJ7HtPghSQXzqte9EMRD9SlYXi0QajwMpdmpqtStPKfCFqLaNFlVSfCW?=
 =?us-ascii?Q?K84JdrluPquV1H7dCMzdcfLwkWtOrT53a/Tj4hRKLgi+oCcWsTkSJcvabM5a?=
 =?us-ascii?Q?FW2m+e211nnkDP+4nBmsY0Iqokqy+5WNe60PDV8RMBjuZknxhUTkmhBLWD2g?=
 =?us-ascii?Q?6Ob4bPqrIDlvMWp/dMHpZ/r03ReiwHZU+ex0z35liIQT+4XPWKHYy1zUNvdV?=
 =?us-ascii?Q?nrjoo386VVsRC0ucuatrHjdIvxen1ddD6ND7L2m4ce2CU7MhJvzODc8wnNQv?=
 =?us-ascii?Q?8xipx8yin1LU0baU7sl9FJx/G26IlwejNUX/PLkQfB+XTvI+M3KtuIbSkolv?=
 =?us-ascii?Q?zajyKozXLEdgfnMMc8LhQLOOe7kVEJ//JvfCTLu+jzH/PcYNLRnGO3dypcFx?=
 =?us-ascii?Q?aHduCqk4P1lIyGqQ5dGce5TqPwHNP2iWWToCMjbLMVwCkTrjNSR6SzROnO3a?=
 =?us-ascii?Q?4odFYq8NfGzwa3gPnkyVopBMF5zWPvIu47bNPHGYpFZpHLh6krlu0I5CkvDq?=
 =?us-ascii?Q?SltJOGBwn8Ku1cJlZ8BFZ2kHRDneelvgOHumlBeeZQabUIqbUnVJJ4mlD5yA?=
 =?us-ascii?Q?bAaFq0zV65Q=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5386
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a26a84f5-1e3a-4aa7-69b7-08dd89679d03
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|36860700013|376014|14060799003|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YfP/LV79/zoyF63Ec5VnYuhkJ+47tdLau5VsI1i+nKtgCrDpARjecXrq6cMU?=
 =?us-ascii?Q?gc7ytjP+J/+qhp6AyjsEnvM/5Myg1pZStdj6Ree+qDpdktPajciXLD6+FdXx?=
 =?us-ascii?Q?gtrYxvDjuEqL6SII5a5QyjU1FtcUATkB35AiISOYrsav15Gp2kdAJqgfIv4Q?=
 =?us-ascii?Q?7yVbrObfWDOJD7t33jTJMKtZOcqcx5teEcxps1zzFYGgHavJyZOdAJhClRXc?=
 =?us-ascii?Q?Dv923Cm3tk8MRJNqELhGOsvUMxtKT81MI9JN0eUUMAHeEzHg+TPu01ny+KK7?=
 =?us-ascii?Q?q2qzxHEaXrfq0Lf4sZHyHWONnXecp6S5DVK4XwO9QAuUpMic1mrEZZFjNS9d?=
 =?us-ascii?Q?dggZMsSqAMcktbRIn5oFIL+AayIN1vJkPEUUsTeoQvPANceMRcxkQWU/83uC?=
 =?us-ascii?Q?IXzJdTCgPcdcguYlD0XGi4Ez+4IJiC9rBAJaNbuCUufGYEg5OOLwvS+xgg/f?=
 =?us-ascii?Q?KWxiuGPWi0sbO1Olt2VtQupKGee31wG44WKj9M3jGdDJ17oPi7pC2QcYdcjU?=
 =?us-ascii?Q?IgubS3hYparzjPUi3WXk6QPrnMQCQbsF4fQ24QU/s1hYqhMK2ClY9mMhbWA2?=
 =?us-ascii?Q?WHraIOKwY6c69c3N9XkgojEvfuSMv6Y79P0C3w8F97xxWRor+Mhi1nZ5An+x?=
 =?us-ascii?Q?+P5KRzDWXHbjAqFj459lVgA6mj82VTbod5SCB4/iBZ2djLtFFZaE7PqUz/7I?=
 =?us-ascii?Q?NYvr+RAFdS/zJA2p2QBUCFx6NnHuQEG7tCKpWnuwAjzFOgUYN2xdexn8OHAV?=
 =?us-ascii?Q?cIRyuyx/tliVjTA48HtwAqUUWPeQ9G1XNzJvy9+e+E6tA8YnQhpBKxWZhcQn?=
 =?us-ascii?Q?+4pafTFbbvIp77rZhwu2Ue1VvvJ9YoOrS2T2crCg9xuvval6DQZiAFB91nux?=
 =?us-ascii?Q?iOxe7C7EcT0pp86iqtGTaOc8IjEz9sq+qSbIChgOy8LWRtjiM4RznFQ/f8YR?=
 =?us-ascii?Q?EORobb1cyxFVimAKcNnzgOfGmvLTLA0d7p51dBgKsLhkLbSIld3Z2M/54KAs?=
 =?us-ascii?Q?WNJ+7hSjBCONyOmj6eTUiIU/P/78WI0J1wPp1wVKz/isNFoHH32Iji1AUmbz?=
 =?us-ascii?Q?1shQRQ4V8tZa8yiOS0LPHBoLHq6+BlYUxuY3F/0tIlN/i06L1EInYZlJ4VIE?=
 =?us-ascii?Q?RkfFzDWqtCtl2Ur3CL/DcUhpfVw69q8LNsKIl/2Uh3p9zE8C9ft7MzHrFF3g?=
 =?us-ascii?Q?99oUgJY8GpjMXYiJ9A6A4vHJ01PG/oMNIOx6parA4/EvABP4LeASpeyT1uqE?=
 =?us-ascii?Q?uldCy8Yv5OZs4IBBv1xGcvS4jOgk4NesZl3wXTtEygnb2bjoDJgnofRzAdX1?=
 =?us-ascii?Q?cnyHp/Cbb1GGvvLU64b0vXo8l5avU1nvHCNysP0fVIbTinoRVvWz0YSCHiGK?=
 =?us-ascii?Q?PW1Zm+PwB45EOxR6oNWiPAvmiWiabgyGAhhqk7DEHfl4HsJBUPtBNyUYJUk7?=
 =?us-ascii?Q?FDLBOfzouHeNheVyNDLeN/tvgtjtFMgLJyeEV0Nr1iD7hUo++5Sg80VZXvFg?=
 =?us-ascii?Q?3ZvgAkSapMgP+7mO6qqu4hVToS4pB4Ce0pfJ?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(36860700013)(376014)(14060799003)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 10:54:20.0795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fa85b9-fdc9-451b-4435-08dd8967b112
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DF.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_035426_832730_56D28CEB 
X-CRM114-Status: GOOD (  12.12  )
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

Gentle ping in case of forgotten.

> when etm csdev's configuration is modified via sysfs while etm is being
> enabled via perf, enabled etm could run with different configuration
> from perf_event.
>
> Also, there are some redeundant usage of drvdata->spinlock in
> etm_starting/dying_cpu() with enable/disable etm device.
>
> This patchset fixes above small problems.
>
> NOTE:
>    This patchset based on:
>      - https://lore.kernel.org/linux-arm-kernel/20241220104521.809071-1-yeoreum.yun@arm.com/
>
> Yeoreum Yun (4):
>   coresight/etm4x: disallow altering config via sysfs while enabled
>   coresight/etm4x: remove redundant usage of drvdata->spinlock
>   coresight/etm3x: disallow altering config via sysfs while enabled
>   coresight/etm3x: remove redundant usage of drvdata->spinlock
>
>  .../coresight/coresight-etm3x-core.c          |  33 ++---
>  .../coresight/coresight-etm3x-sysfs.c         | 120 ++++++++++++++++
>  .../coresight/coresight-etm4x-core.c          |  20 +--
>  .../coresight/coresight-etm4x-sysfs.c         | 132 +++++++++++++++++-
>  4 files changed, 272 insertions(+), 33 deletions(-)
>
> --
> LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>

--
Sincerely,
Yeoreum Yun

