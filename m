Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C47CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYt/z6ZOWgDKF9v5qqHxp0mC2k4lmmDIlV2fSFh4AdI=; b=2q95S8Z2lQizd6ByxcbTEAhgvi
	yIqTvmu44GOmGjKZ1ONK8PO9xrwk9nRiP4h9eU0FVM9+IfyLYFIZ8pTad87Ptko8JRUIYqbHsH9db
	9Eqq+ZJqBr4xboNBcNTKENGHbUWVefzRM3Y89XBH31W6grM+BVhpzZjAc6yeSbzROAEjR0rIEYRCr
	UZdWzlDO30VJOkiGOMxWpx0fr0skeEnzM+9f9fnfGVVzp2E5bE1XEB8lHnV+GhEE9GjsnQvTt1NZV
	4SKoj8pWWklpcatz/3NwPnOsjZftU93apqka9+113OxJxNUksuSJ5Jbp9kvJDJ3rAuPGVqNDQ8tPL
	O0e/yPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvn6-00000000IQN-0Kxh;
	Fri, 28 Nov 2025 10:33:28 +0000
Received: from mail-francesouthazon11011045.outbound.protection.outlook.com ([40.107.130.45] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvn1-00000000IPG-0wHk;
	Fri, 28 Nov 2025 10:33:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAToOXiHf3ZJBCqAC4VmFr+BZFMc9HG+3LMQT6Uh6aDljK7OAtlmAyVRogOIdnkF7Gh+nItRIWBtCTaStoWdm4wqZPEykLLsscHwUv+u2Wm1ymI+Bkzbu56Hv0EUuOLi+VA6PSrd2pwdo7JTkbpHp2O9ZyNBsEjL6fh32lV1eX2iiJXKOhgKQIr71jFobGIw9lAROwOv+FObhExK8mtPnJCunEBk0G2IPun6LCk+tadJo2LBw0X02aOfAAWiYFKLkwZ6jZvqom9hQ0HiMSqWvETxb70keXnC7+U8zFUVElWWQLFvxqO5KwyHNYBWcTuw2KmDa/A7XvjegbbQC6+Ajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYt/z6ZOWgDKF9v5qqHxp0mC2k4lmmDIlV2fSFh4AdI=;
 b=pwX9njfdn257EKx+w84gcOJ+jutPBOTEKBZBH6seh06aPNr8ISPpL1loPBWBy+d3xH7I0jJU2emMvTdw/vuHE+Icqcz4aQwlJb9yXKbRfjnuHfta2j9wLgZ2/hKMy0Wxsa8PV1Yov/A1w9W4NotDz+55K86fOtCcLZUwNcFi9i6IE0srEaHq1WPnYLhR3GYtEM8zXG8cPxCxbGMY6w2W5Rz0X8STvVaGQeFLao8tIbEXi2Q/6SLdyCJl/dS50e8yrT6JBiCOQR4sFyuWesh7jDX579Qk5ch8T3UwiI14NV3th+OodgWDdYh9MFoY7NpCD02DTq/psqdiuPodjvQOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dYt/z6ZOWgDKF9v5qqHxp0mC2k4lmmDIlV2fSFh4AdI=;
 b=iAMe+Xu+9pKrJwr0YcYDELKUA6gw5J2SSuGUbdiUw9PefkPjWT5WT/VAZ6xlfBQ8/tdJrp7qE/WgVuWR19w/Mg7nCReAo7BrEVHwI3+lkYdtDcnz18IL2nOlsMe0k5BlPAwu9XuyWTczvMvEtBMFkWPYAHqPdSDdH0m5vuLJG1c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10319.eurprd04.prod.outlook.com (2603:10a6:800:231::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 10:33:15 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 10:33:15 +0000
Message-ID: <de401340-be1c-4354-b6c8-c86d6f724c73@cherry.de>
Date: Fri, 28 Nov 2025 11:32:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: enable NPU on rk3588-tiger
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250812085213.1071106-1-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250812085213.1071106-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: 169445e7-7e1c-495c-1c59-08de2e6989ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1QvRnlHVE9zUENmMGNNelJQMElLVlczWmNXcDhxellJWFpjU2VWclBoVVpY?=
 =?utf-8?B?NFZHV0xKbVErLzhRYjBzWTd0Vms3UVIvdzVzUVc5N1Ezb3NYNzdIWGtOTTZ2?=
 =?utf-8?B?bTd1WDl1TFNSbTBwcC9jTk5PZWZDQUtBSC9UN1RqR0xlY3pQUWtSbWUyeE9h?=
 =?utf-8?B?WDFFUVNCSGZ0SFFYcjRyN3lmRUNFZ0JObTBZeEJ0M1oyRFFvcTN2VU9ubko4?=
 =?utf-8?B?ejFITHZHcHFPQ3NMTVB1aGxEZ0NrT3A5V3E5OWp2aGl2S014NW10SklTdE1q?=
 =?utf-8?B?ZFBhdGFLbEpaNlpyenh3eDdrVEFqQUtFREdGcjFRRUp5RnJxeFhVN1FkZU5M?=
 =?utf-8?B?VmdvTW1qcEQ0L1BXMkROaVlGWHZrZk5xVU1ENGdHYmUxajUwMmt1OFJnZUhl?=
 =?utf-8?B?QXpGQ1V4M24yWDFhc0FFREJkTzRISkFWeHNuNGhqdDJRdTV5eVVnK1ZIdVFm?=
 =?utf-8?B?cVRpZDgrcnBkZEM4ZWszYlBaOHhCd1hGTmRPREZFZ0F2d2Q0Y3h5WkoxRkxU?=
 =?utf-8?B?L3RQYkVHMWVhQnpONnNxRUtmVjZVbnhieW04NU9qZEo1UHZwRE15R2cwdzRE?=
 =?utf-8?B?VnAvanJPRDdWbW9YcEZVK0VmS3pOZXh4a3BLWjJQWHgvMXhaSXRaYTZNM3pa?=
 =?utf-8?B?MGRZcVR3WUJNK2NuaGZzdWZwZW8xVFhTVTRrWjdtTFdvV3czYVFiMCtUaW1z?=
 =?utf-8?B?NWxlQ1VPTlc1SmZnd09EYjgxd2RxNmlUZE9rYlVoREpiK3kvWHpsNDdxMjk1?=
 =?utf-8?B?cndZRmROZGNXN0ZIcUdQUDR0Y2VNOTFVNlRVcnV3cWU3OHBDOWNQOHlJZ2tz?=
 =?utf-8?B?S2N5Z1Fxd2xHTHdHZ0U0NEVqZWlOSGxiaEZkQ3VkSldKOVZINitjalNtYmhC?=
 =?utf-8?B?QWRSelE3cVpSemcyUnBpeFlOTU9zZ2l6RCtrVjJZZ01oL05qQVQxUWloQVRQ?=
 =?utf-8?B?N1BLVmcvMGRId3VYUDAyNGoyRnBFYXFWTHhYbklDUGhJN2g5OWg3QjI2ZlNI?=
 =?utf-8?B?a2d5VDYySFdUUkV0TnFnZU9OOTFlMC9aNFgzdmxETmtMQ2ltd3dxRmpWTkpp?=
 =?utf-8?B?RnM3Mk1IbnJOQ0V5M1pzNHphcVNpU01BTkwvWW1pNWVLNTQ4clBwQ3REdWY4?=
 =?utf-8?B?Q2JGTEVxMitDUTUwV2FHUmJRM3dkWEpvOG9hTFByKzIzdTNyQnRRWnp6K3lB?=
 =?utf-8?B?aVIwUEs2M2NRYm1uUnFENmlDZW9GeE1LdGVqR2U3QlAySldoeWdQbU1TVFpi?=
 =?utf-8?B?VnliNEtVcVZpTHVlMVF5dEpvdjNoaWdBSWZCODVkRFd6RnprQU8yYnQrSGYv?=
 =?utf-8?B?OGhWWUsxUFVTYU4xRDFFYWJPcVh2Q21yVnZWUUkzbDcvYm10T1k5Rlp0K0hY?=
 =?utf-8?B?cnU5VDM3Y3IxRFZ3U21WMXB4NlkwckQrbjhNbnowZ1NwQzhOaDFreGNBdERK?=
 =?utf-8?B?S3lVaGZ4QXFuUnJLNkh6TDVxdy80aFhOdktPUXV4VXpmOVZXUGc5QUdnTTNQ?=
 =?utf-8?B?WWVnaTQ3ZmNVTUljcCtoZHdEcnU4NDI5WUh4ZGZHWjZDaG1EMnJxUld5T0FP?=
 =?utf-8?B?RHEzQVNDTUdadDJNYmF3SzYxdDRuSitJTGVud3M0NG04V2NsYVBCNTRQb0hH?=
 =?utf-8?B?cHk3ZmdKSG9zQ21jZGY2RDQ2T0lOa0JsZU1sZVlzTThrMlJoeS9oVk1NK21B?=
 =?utf-8?B?bW9ISTJkUXJpVEYzaC84OFJsbUlrdUwzWWVPTzFYeGVjQkFGNlpqNGVsSWdK?=
 =?utf-8?B?aEwwNm9uNjRJNWF4ZUZ1TWpFbWo4eWZqT1dnN2F4eTFNMW5iUks4NW1wd1BE?=
 =?utf-8?B?UVFQVEFOaC84TDRCS2o2SjdyWEh1RnpvZ2xnMExHckVIbDZQbXltZy9JRkNF?=
 =?utf-8?B?L0NVbjBxNWtTSVlUd1NiTFpPaFFTTmIzbjJnUm5MV000SlVndG5zVEkrL1hJ?=
 =?utf-8?Q?/FxzE1ir82kj1y10iwRCXFeCkKVS5H9x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXEvTWNnUlNhYU1OeXUvQmpYbzE2R2V6RW5lVHh2YWliZEJlQzM1TC95REhj?=
 =?utf-8?B?cDZnejdwM0FvS2hEZVRzbXkxbjNqcENOZDQ0ZHk1bTRxaERGUTl3eGNRaHNE?=
 =?utf-8?B?Y3JCUG1hZE1JNXpMWjgxU2pESjhOWStvZWRWZVZEMzAxMkJIZkRPSXVDRWVw?=
 =?utf-8?B?NTFJUlJjcTVFQ0ZrRnhyYXJLUllIYUk3SDVDUEppM3p5Z0pOUk1Qa3BkYnM5?=
 =?utf-8?B?OWNXVDViWGdDZHgzdmlpZTl2Vnh0bzhoMjE0WmI3ekJYMDNCMElDdmI2aHZF?=
 =?utf-8?B?TzBwVjlNME5OZ3lSUW9JYUZ2aldVQ2JaKytseXZ1aDVnTzV0MFFUQXRmUVBE?=
 =?utf-8?B?V1JyN3ZpOGp6L1J5c25YMkJEb1BDcDFFV1JVOG5GZzlOZHlnTGNqLzBnNHBI?=
 =?utf-8?B?cDlXUHc1alVuZml0ZENvdU9nYzlXSUpXTFJ1SWQ5SDV0UElXckJmR3FtUlIx?=
 =?utf-8?B?dSswOXNCVTF0bU8vVEZ3dEZlOVZvcks2eCtRTjk0dEhaSGJ2T2h3TmhMa2ly?=
 =?utf-8?B?TVZiTjZNRmNXTjRpaE5ZaW9CWTBtejFWZjBReHpZL3ZIcTIvWTV0MlNWUzBt?=
 =?utf-8?B?WTkwK2N6Q2lqUE1GVjJ6MnFNcCtoV1BlVDlwd1B0ZEtLWitmVGVxU2drMEM2?=
 =?utf-8?B?TzRFOTZRMk9hT1gzOEJ2NlV1MTJZQ3l3SUZtMWhhWCtNYVpaR3Q2b0VHR1dP?=
 =?utf-8?B?empKS0p0RzZwUE5HcGc3Zk9QWXEzR1pBdytwZlZCRVVHeWFPYTgydE16TG1M?=
 =?utf-8?B?aGZzWk1ZZUlwc0oxcWFTeVlGNVNycXE2Y2tacXlFdWdKQzE4OWwzbVl4SFcy?=
 =?utf-8?B?b3BwdlFuZW05RjdVcHE3NDlhZy9GV0RRRnZoRzd3d3FLdnRUUExvMXhUZHlM?=
 =?utf-8?B?bEJ3QkdjR2cvbWxUekMrZTk2QnpPczd6akEvVENjcGcvcHBVc3JRRkd5TmFK?=
 =?utf-8?B?dXRSQnh0aFhJYkMyenhZdWphRm1Vc01NbmZVekd5T1I2aHVQM28xWDZXMzVn?=
 =?utf-8?B?anhRWS9pUXBKZ0FhYXlkQmlKeFQxaTBUczdieTUyaExBWmQvZFFmbkg3ak12?=
 =?utf-8?B?ZU9SZ3NGekdHNzQ5OUJMUmYxK2VablY5ajVZV1A4M3dkVHlWNXpwTGZQR3pF?=
 =?utf-8?B?YUFmbUVLVG5JY3hMdTJiV0Ivb2krWk9GdGtqUEoyMTMzUHU3cUp1d3dCL0NL?=
 =?utf-8?B?ZHJtYk5WOWhpRnd6TkltVk1DM1VYNTVjVFBLOE5pK3lHL1dXRGxoeTJjamVW?=
 =?utf-8?B?NDZsL2NQUUZHNHQyK1pCRU1pdGxUSHVhU2VSTDIxVnpVMlZXNFBXanJWakJS?=
 =?utf-8?B?a2VxS09aUXNYdGovUUNmN0hjWi9maGc3bE9rQ3R4aUw4S3hWUmlpdG9hTWRy?=
 =?utf-8?B?RUtKeUpmQ2EwYTFldis0Yms5VjJvNFZxT2JHNHZaKzNHdk1veDlWdjRHNUhV?=
 =?utf-8?B?TXlodTVVZkR1OEw2OWx4Vm9PLzVjbWZpNTVZT2ptZFIvelhpcEVsaExvYzFz?=
 =?utf-8?B?MUNzeVZIRFA0YnJiUVFRQjQ4d0ozODV3TXVPME9sSVZMRzc0ai9mYzl0eTBU?=
 =?utf-8?B?MWRBbzVaTVNnRTBjcUFSQ3VlNTI0SENMcDg3aDNtWVJIam9oVnVab3AzWFRM?=
 =?utf-8?B?cEhlYUd1SnFhUGRrN3R3bUVIanVTeG9yNnlvVWZUWnU0WG5GMUJmalp3TTFy?=
 =?utf-8?B?YUd1TjEwallzRXVWMHhtR3E5ZlFqZ1huQk90RnRjV0p6bndyQXJvRmQybmdR?=
 =?utf-8?B?YWU4NVprWC9hbFJqUW5BV3RjZWxxdDlxWU5lcndaVk9IYytsUUEwNnVxY0VT?=
 =?utf-8?B?TzlpejdEVU5UUEhsZENRNVI0blN6ZVBsNUNmWXdmR3JPL0JIY3JIMHdKT0Fj?=
 =?utf-8?B?T1NFMXNHSVF6T0lKdHpHNWwrMTh5dlViY3F6Qi9sTkpVRGMzZDNZSGwwd2tS?=
 =?utf-8?B?dnZuVU9KLzVpWVFJUUtMN3QrbGRhM1d5aDVqY0d0NkJoREM1ZVlXd3JtT3dK?=
 =?utf-8?B?MGczNTV6aDBEdEJaMzVodjFsUy9jSVBLeXByTU1lU0hoNjZhTTYvZEM3VUR2?=
 =?utf-8?B?QnFKS0dKRnZ2eUZiYXY4b3ErZUNDcDNWb3hEcnRGdXAyQ09sWEdvenFhM1Yv?=
 =?utf-8?B?SGFWdk5hcE5laXgyUFNYK3pRL1hGVmM1UStjRnRIc1dCdWxWUXJxdE9iNlZJ?=
 =?utf-8?Q?L52at2kHJnWJ5vPiy8atYpQ=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 169445e7-7e1c-495c-1c59-08de2e6989ce
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:33:15.3647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15CvIjbOwK0RHqxeU5NtT24/sWPATtuoduTVcb9R30pkcZGWWm1qcG4e0trR18d1PfvryCBE8BPG5eGZn+xnYeIuZcqoXsnYypIy+DgcSHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10319
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_023323_268275_4553C857 
X-CRM114-Status: GOOD (  12.51  )
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

On 8/12/25 10:52 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Enable the NPU cores and their mmus and wire up the supply-regulator.
> The regulator itself was already defined, but it does not need to be
> always on - the npu can control it.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de>

I still have the same remark about regulator-boot-on but this isn't a 
blocker per-se.

The Oops I alluded to in my answer to the Jaguar patch is triggered by 
making DRM_ACCEL_ROCKET driver built-in instead of as a module. I'm not 
sure how much I will debug this on my side, I'll prolly just report this 
on the ML in a few hours.

Thanks!
Quentin

