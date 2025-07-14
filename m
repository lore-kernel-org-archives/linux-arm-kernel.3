Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138B4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o62DDNdYxMIbBtvyS0/3ZQkZjogWftMa4zIh6av4yLY=; b=fDbK+jdxkwQp5zFGS2AQY0CVrY
	YGJp78b/PnVDSZijKuH5+BdbQ2z6x1i62efBUeg1h5XmuJYrfktP4ZJP/3EXNIwgg7XVhbXq2egzB
	6cPvRrR/8qZ1I6vbhMX1X0GBH8K+ZnfiwJsSp8VGoWVbvt83WbHMttq7OmKmmsskJ8Y1xCrrpvUkF
	MYZTMCQpKt78IXgiBCrrODtUHk3l4VvBQm2m0JLaxt03oi6jky73G52l20ef1I0N7/55RQXcQJ75z
	eq1JFchh0+86tF0QXOhTHulfTQiWaQmOWeWVZjrERKVkPQchDSl3s75mzaLvgTZZPaOMFk5JAEZEz
	SqXdkpsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFVH-00000001msE-2TCV;
	Mon, 14 Jul 2025 09:29:43 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFSp-00000001mW0-0mvQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 09:27:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UC5/LP9Qq9l/pv+iwaHjNVL3+xmuMV/AudjYUDuVMgkMMHbBfSfxBkFiOJ8+VjgXVf0U9w86M1gpHHYvHJh/lSWIWRnDucgbs8x/qZtpsaJQ6EdbMQay9ZFCMApNVmtFPPt6AS8jXzfnw57X9Kud5HpDXYId4bdfKuEn4HNYy+C5scoEoEV2YgObNhw3z2J2UsnXfQzB3BbMFORbZjKLCBNd6q2zvKWzts1tUhxQngZB1gegHqfr5eP2oMblZUKFiQr2/yvjgrDggnxh9GPzlu3JHWTOJbVdXv0YqTzSPINnutg3Q724R9srGp0JsOfK8OH5Mj1mPPO98nAK241fvg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o62DDNdYxMIbBtvyS0/3ZQkZjogWftMa4zIh6av4yLY=;
 b=FucQ1fIMtNynHmqi7dRaisIiCChy0P/FLsQIjmJmIFJpx1+KL+U3W92mHgme/7Dgyyv6wcHNKHXaCj0Bggab36rR3dgGfMfsXl86pE1N2oBVOVyHFpXE0DLr0GW+XiJp0uVDVwYJ0IxaRgVx6hE+miRBKB1XqNOeA0mIcAsVLwc3lJmV01m+u2y/nknG/XFCr5Mn02EPQZXRLVaPjYrZbLLwZ/TDAH+IX+7MS10aBVGaPXvYhnX0aRPLvEWPkScHQ8xqetE5OmB3hKwjyC3GN8WjNk6DUG713ACGtI1nCdSkcx3Vbj7kIEH+4L9zIoc1FrgV91vhIRPcO3S2BS8fHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o62DDNdYxMIbBtvyS0/3ZQkZjogWftMa4zIh6av4yLY=;
 b=k91v78atHpd+FJyZCwwR8ZM+DiVt7islyEPa4QZdc6P9BluLXUlYe5U/PT2Kiq8/w0JCqiWDlniHPUs/1jG8y3ru88t1zf7vxgz3vflKCoppXZ/nJ+6HvBW49t7DRLF6jXejVdf6Z/QcvWCbylFrEqyt3teowYpIUcV54EEIi9E=
Received: from DUZP191CA0037.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::9) by
 DU0PR08MB9049.eurprd08.prod.outlook.com (2603:10a6:10:471::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Mon, 14 Jul 2025 09:27:02 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::1e) by DUZP191CA0037.outlook.office365.com
 (2603:10a6:10:4f8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 09:27:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Mon, 14 Jul 2025 09:27:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jp/G4hYVucU2PRXcSl3DwAWng6scfJR2vOkvDyf6/hh7neqc57BuxeYG7J6gdFd5t1Uxz1waT5m1Zubm0AkkgX00LWUXG7/pflQNlr2CvwA89F0PeBf8Ik3DIjSe84YJlXvq3zIh4KoKfvGxCb55CEbwPQgOVTcEQlosUesaXM2M+AAiPvvN/kNmM+SDX2WBf6qtUZe6h22L/AQa9PKpJcCeDacJtupZPDwaY6e6kCtSA1Gj+uS6GyjG0K5gu1T5BVtJSBMzhRyRdjRE0OkPqLE02jBqabYMbOQws3BXzYQc4TOidzpko5Q3hLSVz2PyEGTTU7Ww9v0i40DoAN5PKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o62DDNdYxMIbBtvyS0/3ZQkZjogWftMa4zIh6av4yLY=;
 b=c530vh4LWZ7ZSIdemVGIE2Uj1BNsF9NXCvrZFrhK70mH8tBa8D/d5DXIpq2b81p94hRKA578zxBMBhwZUn0z5gxLS85lWJCAJ2lyzU16aQE4WYfsXywvHCMJJxc3ae4jqMd6pXU/bZI4jREuGyzNHI7d2wxpm6oS1E/M8bmBx1n+f+0G+pJ4k2EfJFFDjZQ9RB7Mm95nauDbFyqx1X09g9oFlPhqFtDiJpy9+KeOM75E3G+xYJECs2rhSNCNPgIr8LwYgygHHAlWufuJfamIRpyhmVHW2TTAQ/6yF9NEG0DTpdkUqUKuGfa+yuHkErLhjAkm1E0xaRO0doVCuHva9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o62DDNdYxMIbBtvyS0/3ZQkZjogWftMa4zIh6av4yLY=;
 b=k91v78atHpd+FJyZCwwR8ZM+DiVt7islyEPa4QZdc6P9BluLXUlYe5U/PT2Kiq8/w0JCqiWDlniHPUs/1jG8y3ru88t1zf7vxgz3vflKCoppXZ/nJ+6HvBW49t7DRLF6jXejVdf6Z/QcvWCbylFrEqyt3teowYpIUcV54EEIi9E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PR3PR08MB5626.eurprd08.prod.outlook.com (2603:10a6:102:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 09:26:28 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%5]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 09:26:28 +0000
Message-ID: <e1e87f16-1c48-481b-8f7c-9333ac5d13e7@arm.com>
Date: Mon, 14 Jul 2025 14:56:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arm64: Enable vmalloc-huge with ptdump
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 ryan.roberts@arm.com, kevin.brodsky@arm.com, yangyicong@hisilicon.com,
 joey.gouly@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david@redhat.com
References: <20250626052524.332-1-dev.jain@arm.com> <aGe5XjWKhgjzcw7L@arm.com>
 <bc201f93-7743-4d9d-a62e-3c8ea22e2cfd@arm.com> <aGsYZ7W0yunbeqQV@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aGsYZ7W0yunbeqQV@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ba::8) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB7120:EE_|PR3PR08MB5626:EE_|DU6PEPF0000B61D:EE_|DU0PR08MB9049:EE_
X-MS-Office365-Filtering-Correlation-Id: df2c728b-2a39-4799-a804-08ddc2b8971c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aU96WkFLUnljMFNMK2NJckU5YXJ2bTRzNHVkZWMveURHYkdJdk5vdU4rNW0x?=
 =?utf-8?B?NzhPTllGZGtLdndvMGxGanRGZU0zU2pod2JSYUt6YnZYb04wTEQ3UmpsVEdn?=
 =?utf-8?B?NUM5QmFLL29DVG9yMEU4RGx1WThNcGFHMTd5WU4xUSthV2RaNmwwaFhpYkVl?=
 =?utf-8?B?WUtPV0tGRVkraVNXQk9EMEV3a0o2aExWbFRDVDVBajZxZ3RZSitIRzZ2QkZR?=
 =?utf-8?B?ZGNsVTcvWDNNK09xRWhFdEd0SktvakRnSHdiWWtQVUxsQnlGWmxiOTZCazFw?=
 =?utf-8?B?QjZTZGdySE1ZM1VLaGs3RnJTei9KWGhYT0FkYTlXbG1qNWdMc216UDJMSWFr?=
 =?utf-8?B?YVV4R2tPNVo3QkdUZ09VZWNrcXV3N0tjOEoyZUJvMk9wRk1QTkZzeTBRajh5?=
 =?utf-8?B?NTdnYkl6TWpPMm1Hclo5Y21iT1I5eDR0aDN6Sml6QS9oejRxRDZ3TENsQXcz?=
 =?utf-8?B?UkdoNW85a2QwM09CclVJKy9iL1RSZmZiK2NsTHRsZEFwMkVnRjBJL0l1ak5z?=
 =?utf-8?B?R0RSSzF3YTV3WFFYbkV6akdmYk4vbTc2ZXpTa1BoN1EwcHRKYjZ4VVdreHlB?=
 =?utf-8?B?RUdDbzVCT0xnM1o3djJ0T3dyb0I2bzlvcnMzTUMxMGREa3JTODkwZlZCMVlN?=
 =?utf-8?B?Q2ZiR0pucGFvQm9XQUliZE5lZlJ0ZUxTNG1XQzg2UFY3ZDdIaEExTCtrK1di?=
 =?utf-8?B?QnVCSWZteFJGRktDc3pDR1R2TTdrQU05Nkw3OWRjdjA5TFJRY2d0WG13Q2pY?=
 =?utf-8?B?cGNFMDNMblMvVXRIT2hFVFlwQjNhcG1Yb3ZrWmZML3ptMk1hY1RhZEhUY1RT?=
 =?utf-8?B?cGR0eXc4S29XMFVIeVpKR3RITVFoZGdzdlRIN2FRQkNKd2VmRTRpc3JjamZP?=
 =?utf-8?B?L3pSMmVUZWdFYzFzeE1JTTU2Rlk5OTV5M3dldlhYRTJ3N0NkbktFM1ZVeGJ4?=
 =?utf-8?B?L0ZIcmxwaUN1Uy9DS3B4MWx3cXhTV1FuTzUyNHdVSGtpdHZLYVh2eWRISGFM?=
 =?utf-8?B?ZUovNmY3Yzhnek1NS2tlM2RmS2krNXhLSlJEdEZVY283MXlJRmFVc0tqcGpE?=
 =?utf-8?B?eEthNmdlelVVOXJuVXUxUVY1TysrREhvMGtuSGhZdFBHQTJpWTNRY3M3NE9E?=
 =?utf-8?B?T2FEQTRna013N2UvR3QvNitXNnZON0ttNFVxZDArbmNPeWQ2RUlVcWswd05j?=
 =?utf-8?B?TFhiOXI4YVN0OGxtRmVNajZsZ1U0Z2l3d2x0N3lIUnkxQ0k0UjM0ZmV3djN6?=
 =?utf-8?B?cFo0RUhvTnhGRENncE52L1Zuc0IxWkxvdEFLdExyRXFQak5zOXU5V09wY2hz?=
 =?utf-8?B?aTBIdXZXeFNjZVhVTmJXR3BHUm1BaUNCRHQzQVVDbDFsWll4SHhHRFFIUjV1?=
 =?utf-8?B?TWJ0NGlPajZ0R2o4YzduTm43NkVveUZuOXgvQU9PVlVJOGtPcGFWU0orRUZW?=
 =?utf-8?B?ZGRjaXhJTVVFdk1udER0Qzh1d0VTcnNXMnRPRlFyd3RoeGw5VisrdEg5WXFF?=
 =?utf-8?B?clc1S1pyZEVRKzYzVnY2MS83UVpET0FNVk1aNW5YRy9iVHR0bjZNSk9NbjFJ?=
 =?utf-8?B?aHo4eTEvcXFyRHVDY3pmQU5yWjVCVXVGUHNZS3F6RjgxRGYvcFZGMVNvY1ZB?=
 =?utf-8?B?SnUyNTFFSld6eGJLalFyRlYzbzdBZ1IxQm5QSjh6ZVd3RHAwb2tmQ1RnSXFs?=
 =?utf-8?B?NGtIRmFxc2JDRkFnaWxQT0RVZWFPek1lS1RYZm9lN0t6cEltSmdST1NXclY3?=
 =?utf-8?B?VEdrRlhIOWI4RFVmZUFaT3Q3eU5BNzlWQVpvNFhEeGNxbTFJU0tOSUNYbzMz?=
 =?utf-8?B?aWtNbG9jZ0dhd1ZUZHV5aEoxaEI2Q21BNzRYY2RzWmlvSjBZbm1WdUQ5ejZK?=
 =?utf-8?B?UEMwbWhqeDRQNTg2Z1ljSlRhalRrRElZNTVoZ21RQkM3RWFGNVAzNnNzajB6?=
 =?utf-8?Q?fOi2f8jkNJE=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5626
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f736668c-ffcd-42cd-1a0e-08ddc2b882f1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|35042699022|376014|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2VFNkZBQ2F5MjFQbVA3bkxwdzIyRjVsYkhyVmRTUkFMbGhmV1gva1RjVTVC?=
 =?utf-8?B?UkJCM0JhR2lPdHNHenc5Y2RKWUtWUk81aXNXMVJpT1hIUTZzZm1WTkdZOGZG?=
 =?utf-8?B?aEptMmtCRCtHMTNJUk5JcjZrdzcvN1JTczBwNUF6THptQ1QwSnBGVy94RFV5?=
 =?utf-8?B?WEM0NU5lVlRGMjBGeHZnM3cxY1F1dFNBOE5JVWxYQmp2c3pyNmcyN0lLdFQ5?=
 =?utf-8?B?K2NudUE4OFN6S2FPazBwZlJ4Q3FCTFNzKzZIeFZRVzRXOER4eFFwVDB0cm1z?=
 =?utf-8?B?UXI5ZUlMR2hoWGZMU3VCWU03c3dBamVsczFITEFObHJ5QW5Dd2hpWTZkRzQ4?=
 =?utf-8?B?eTNvWlRGeEczdDdBakpKNlN3YkVSMFIwSVp5Yy9SaUp3RWM1dDJLdWRWd0I3?=
 =?utf-8?B?TUJHUlhUTFF1bkdxeEZTV0l1OG5nMlRUc3pxR3NoOFZ0c1gyU0ZYVFJQbkFQ?=
 =?utf-8?B?YTlOSi9YaWFZUElKd24vT3Z5U1lJWWtZN3Z3VlBYSU50VFYxdDhoSzkreUlp?=
 =?utf-8?B?dmNRQlVpNDkwWXdMM3J6MEFYNi9QQm44UkFCRmFZbFY1d1crOVdLc0RaY0tR?=
 =?utf-8?B?VkhrUnVvcnNDNjhPSmVSZ1hvbVE3VnlSc1JYMENtT2Z2M1ZIZWREYUJaYnpF?=
 =?utf-8?B?V0hEOFUyQ3VWem8rb21OSmxYcURENkJ6TjNVdCt2bUpQT1hvdXlWNy9VOUtL?=
 =?utf-8?B?SnpTMWc2Y1RJK1FMTUtMcEdwQkRuQWVLV3NFRnpnd0Rja0dsSzAvRTQ2TThz?=
 =?utf-8?B?UFYzajNzclY0RmhoVHptUXNkQi9aSkZWRGF5bWtTdVkrS2NYc00vdGV3dm5I?=
 =?utf-8?B?Zk4zTmpZZGF1UThQckFTemRtNk5KUHF4L0FKejRqYkQvbStySlU0blp3ZnFX?=
 =?utf-8?B?THQxYnVrNmZXdzJuMEdEUEI0aGFPNlFjeG5vK0oxa3FPQk1VUGlnRVhEV21a?=
 =?utf-8?B?WUxWZi9pVkNrK0xlNFdrRkM5WUpHcFNHcE9DOW9xcWZTOGZVTVFJQnlEd21D?=
 =?utf-8?B?a3pLbHBEV2wyUE1vb0txSFFMRThhQStqeHBNZWlSeDdaTkpic29NVXFmcVRB?=
 =?utf-8?B?NFpHWVd3cW84U3h4N3VLcVNwQ05TcVFSWWhJQmkzUWFuaGN4Yk1LRUFqeSt4?=
 =?utf-8?B?eFYzYmRHRmlzNFhaNXRFZzBwNWRFTGZDU1grOVd5MXowdHBta1JzZ1E3blpZ?=
 =?utf-8?B?MnlaUE01VjJIVEZmZE1JV1J4TUY2RDhuYUNqNEEzN1VBc3FERU9nSGlHR2RN?=
 =?utf-8?B?ZzdyRzBaMml0SENUUGxBNnl5M2NNS204NlVyVGlCYWg4MUxENVptR3BzM2N5?=
 =?utf-8?B?em5vWkdBeFpsdTFabXgxMnBEK1Rya1JrZEs0bnpka2QyQy9wVCtNc3BSbFRo?=
 =?utf-8?B?Q3ZkNmtQbjlyUlN2OUptYjNqb0F3Y0I1RjB1UFJaWXlOdmVtMlFJYndrNXNq?=
 =?utf-8?B?NnprdkZUSkl1NUZJZ2RCTkZTdDNnNU5aOHJKb2liSkJFT2xvREEwNGc3ZTQ3?=
 =?utf-8?B?eHRMTk1EbHJWME5oMXdLM2JzSEowKzV5NzczZFdwampsSjhQTlZRSStMVVZz?=
 =?utf-8?B?WC8zYzFYd28vQ2w1WVFpVXNPRFdKM2dUditKeG53YkNscEJiMlBpOWhrc3NB?=
 =?utf-8?B?SytKdlVFY3poL3hDMGt2WHFWYXlhSGxzampiRzFmTkRGdmpmeUJSWC9SZExI?=
 =?utf-8?B?MEl0QWtFMGtJS1BOQWt5QWlFbEkvMjRFU1Q5eDBzRXdTTVYwOG1ZWlJkbXk3?=
 =?utf-8?B?Qjc1aDV6UnNReWZIRHFNMjJmOGg4eU0rb1RuNW1LTXo0Qk9mYjdjMUk2OVV1?=
 =?utf-8?B?VTJ2eTdRZVo1bXFHUFJFdlRaczR3T01NUy95b0I3M1BRQ0dVZVNhU1pSN0pR?=
 =?utf-8?B?Q2h5bzNGUlovTVBhemRGTnZCdTd4Q1VRSXJjajNLUUJnd09Pbk9laytackhw?=
 =?utf-8?B?akN0djFzOElyclhwSUE0cW10VDZpejZwbVdaUnZxaG1GZmpQbGxmZVAzRkk3?=
 =?utf-8?B?eG9UTXlTOC9uSU4zWjZ6NkRNUkEyZEE3djhoWi9OU2lLQ1dCZzMyeU0yaUlx?=
 =?utf-8?Q?aNgWxO?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(36860700013)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 09:27:02.0400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df2c728b-2a39-4799-a804-08ddc2b8971c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_022711_542570_DAC082B9 
X-CRM114-Status: GOOD (  13.37  )
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


On 07/07/25 6:14 am, Catalin Marinas wrote:
> On Fri, Jul 04, 2025 at 05:12:13PM +0530, Dev Jain wrote:
>> On 04/07/25 4:52 pm, Catalin Marinas wrote:
>>> On Thu, Jun 26, 2025 at 10:55:24AM +0530, Dev Jain wrote:
>>>> @@ -1301,16 +1314,39 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>>>    	}
>>>>    	table = pmd_offset(pudp, addr);
>>>> +	/*
>>>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
>>>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
>>>> +	 *
>>>> +	 * Static key logic:
>>>> +	 *
>>>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
>>>> +	 * execute the if block, then this patches in the read lock, ptdump has
>>>> +	 * the write lock patched in, therefore ptdump will never read from
>>>> +	 * a potentially freed PMD table.
>>>> +	 *
>>>> +	 * Case 2: If the if block starts executing before ptdump's
>>>> +	 * static_branch_enable(), then no locking synchronization
>>>> +	 * will be done. However, pud_clear() + the dsb() in
>>>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
> [...]
>>> I don't get case 2. You want to ensure pud_clear() is observed by the
>>> ptdump code before the pmd_free(). The DSB in the TLB flushing code
>>> ensures some ordering between the pud_clear() and presumably something
>>> that the ptdump code can observe as well. Would that be the mmap
>>> semaphore? However, the read_lock would only be attempted if this code
>>> is seeing the static branch update, which is not guaranteed. I don't
>>> think it even matters since the lock may be released anyway before the
>>> write_lock in ptdump.
>>>
>>> For example, you do a pud_clear() above, skip the whole static branch.
>>> The ptdump comes along on another CPU but does not observe the
>>> pud_clear() since there's no synchronisation. It goes ahead and
>>> dereferences it while this CPU does a pmd_free().
>> The objective is: ptdump must not dereference a freed pagetable.
>> So for your example, if the static branch is not observed by
>> pud_free_pmd_page, this means that ptdump will take the write lock
>> after the execution of flush_tlb_kernel_pagetable completes (for if ptdump takes
>> the write lock before execution of flush_tlb_kernel_pagetable completes, we have
>> executed static_branch_enable(), contradiction).
> I don't see why the write lock matters since pud_free_pmd_page() doesn't

True.

> take the read lock in the second scenario. What we need is acquire
> semantics after the static branch update on the ptdump path but we get
> it before we even attempt the write lock.
>
> For simplicity, ignoring the observability of instruction writes and
> considering the static branch a variable, if pud_free_pmd_page() did not
> observe the static branch update, is the ptdump guaranteed to see the
> cleared pud subsequently?
>
> With initial state pud=1 (non-zero), stb=0 (static branch):
>
> P0 (pud_free_pmd_page)		P1 (ptdump)
>
>      W_pud=0			   W_stb=1
>      DSB				   barrier/acq
>      R_stb=0			   R_pud=?
>
> The write to the static branch on P1 will be ordered after the read of
> the branch on P0, so the pud will be seen as 0. It's not even worth
> mentioning the semaphore here as the static branch update has enough
> barriers for cache flushing and kick_all_cpus_sync().
>
>
> The other scenario is P0 (pud_free_pmd_page) observing the write to the
> static branch (that's case 1 in your comment). This doesn't say anything
> about whether P1 (ptdump) sees a clear or valid pud. What we do know is
> that P0 will try to acquire (and release) the lock. If P1 already
> acquired the write lock, P0 will wait and the state of the pud is
> irrelevant (no freeing). Similarly if P1 already completed by the time
> P0 takes the lock.
>
> If P0 takes the lock first, the lock release guarantees that the
> pud_clear() is seen by the ptdump code _after_ it acquired the lock.
>
>
> W.r.t. the visibility of the branch update vs pud access, the
> combinations of DSB+ISB (part of the TLB flushing) on P0 and cache
> maintenance to PoU together with kick_all_cpus_sync() on P1 should
> suffice.
>
> I think the logic works (though I'm heavily jetlagged and writing from a
> plane) but the comments need to be improved. As described above, case 1
> has two sub-cases depending on when P0 runs in relation to the write
> lock (before or during/after). And the write lock doesn't matter for
> case 2.
>
>>> And I can't get my head around memory ordering, it doesn't look sound.
>>> static_branch_enable() I don't think has acquire semantics, at least not
>>> in relation to the actual branch update. The static_branch_unlikely()
>>> test, again, not sure what guarantees it has (I don't think it has any
>>> in relation to memory loads). Maybe you have worked it all out and is
>>> fine but it needs a better explanation and ideally some simple formal
>>> model. Show it's correct with a global variable first and then we can
>>> optimise with static branches.
>> What do you suggest? As in what do you mean by showing its correct with
>> a global variable first...and, for the formal model thingy, do you
>> want mathematical rigor similar to what you explain in [1] :P, because unfortunately
>> (and quite embarrassingly) I didn't have formal methods in college : )
> Neither did I ;) (mostly analogue electronics). I was thinking something
> like our cat/herd tools where you can write some simple assembly. It's a
> good investment if you want to give it a try.


Will the following proof work -

Proof of correctness: The below diagram represents pud_free_pmd_page
executing on P0 and ptdump executing on P1. Note that, we can ignore
the situation when processes migrate to another CPU, since we will
have extra barriers because of switch_to(), and all of the embedded
barriers that are used in the reasoning of the proof below apply
to the inner shareable domain, and therefore will be observed by
all CPUs, therefore it suffices to prove for the case where
pud_free_pmd_page executes completely on P0 and ptdump
executes completely on P1.

Let t_i, 0 <= i <= 8 denote the *global* timestamp taken for the corresponding
instruction to complete. Therefore from here on we do not need to use the term
"observe" in a relative context. Let t_i' (t_i dash) denote the global timestamp
for the corresponding instruction to start. That is, an instruction labelled
with t_i implies that it started at t_i' and finished at t_i.


P0				P1:

W_PUD = 0: t0			x = 1: t2

if (x == 1) {: t7			write lock: t3
	read lock: t6		R_PUD = 1: t4
	read unlock: t8		write unlock: t5
}

Free PUD: t1

We need to prove that ptdump completely finishes before
we free the PUD. Since write unlock has release semantics,
if the write unlock finishes, it is guaranteed that ptdump
has finished => it suffices to prove that t5 < t1'.


R_PUD = 1 => t4 < t0 .... (i)

Because of acquire semantics of down_write(rw_semaphore lock),
t3 < t4' .... (ii)

(i) and (ii) (and t4' < t4) => t3 < t0 ... (iii)

ptdump is executed on a single kernel thread, which implies
that the transition x = 1 -> x = 1 will never happen; that is,
when static_branch_enable() is executed, then x was 0, which
means that the call chain static_key_enable -> static_key_enable_cpuslocked
-> jump_label_update -> jump_label_can_update/ arch_jump_label_transform_apply
-> kick_all_cpus_sync -> smp_mb -> __smp_mb -> dmb(ish) will always be followed.
The emission of dmb(ish) => t2 < t3 ... (iv)

(iii) and (iv) => t2 < t0, also, flush_tlb_kernel_pgtable -> dsb(ish) ensures that t0 < t7'
=> t2 < t7' => the static branch is observed by P0 always => t6 and t8 exist.

Now, t0 < t6' because of flush_tlb_kernel_pgtable; combining with (iii), this gives
us t3 < t6' => the write lock is observed first => t5 < t6 (the read lock cannot
be taken before the write unlock finishes) ...(v)

Release semantics of read unlock => t8 < t1' ...(vi)
Also, trivially t6 < t8...(vii)

Combining v, vi and vii, t5 < t1'. Q.E.D


>

