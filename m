Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16124106703C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ii3cwo7erZ0oC7BhOtlfDcoKFdlCLwmvj1kvAuHYhfs=; b=b8OalgvIHTTyyuVlF17oJtRSS8
	T04rbvu57WPo/TAGCMy46T2lk45aElllcz1FeN6LT/7Qeymn6atyPR/Ujzscp6jDTvTv0/g9fX/NY
	7pHLokMPvcZ3MN2Z40+lzPOgR5v6gfxJ4UxQ2hYiLdNl1Hdh9lVZeF+D9F14FnsbG2hEFfwdQVAGl
	/X9dcrBc6myHeVkq04Fwq53EaQi1e9akY2uxujLtP5puScIieeGLaKKaMJ2txxZCPwRBLuWPgeZg4
	YPSUa3rkYG2cybaisppgZAkUjrRcnra6DTFotQCLZTx+B0dceWCtTJWc1mD7AtV2rWnrf8JA3K42C
	cKfeMufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hUz-0000000EGyl-3VVy;
	Thu, 12 Mar 2026 14:58:53 +0000
Received: from mail-northeuropeazon11012060.outbound.protection.outlook.com ([52.101.66.60] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hUu-0000000EGvs-3CPl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:58:49 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZsYF/FdnrvHw6lnpWYNWxBWS1FEvEfj84ZhlhmFSGK/j1Q3woXx/XfVnuwBEJPozBASGm9+Nxo3h/Mv0jBA1w24iab9FMIoSU34llYvRuGHjVKf/fJLFzHOFjTVqUlFS03B+/AvSAbiVLrKKbkiRMYZdfsulTpTTcpoUSCid+a7uTlmZ0AiepFX8wEDgJy2ppAmL+6Y8BIg79OUXmhSPNVJXBxVn6JZhCkCGaOfiLE/6rZwJBxi+qXyVHe5VrHmdCSCVD0F8rVMMOCmEN/PZOC0G+oayNuC3+hBAoYv/MBcqcqKXSGoJgdCKNdZwfyNmfdBVmxgMnLOsDUduyU4Dkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii3cwo7erZ0oC7BhOtlfDcoKFdlCLwmvj1kvAuHYhfs=;
 b=fLu90xRQaBsbpE1PDQeRibKIYPVL/jlNvJplDEDg2q0zrTFSqiX5hlghhmeHfXzfbFF0rLVOFxt3yPUznPLjj0RujHnqoUT0QBWAjh3tfHJTxe6+RHjD5DQb+KIwrVGAzqHqOmOac8MrLYEFvJ5FldRgkKUMqaLdNaF6+IzQVsXMWGVTt8EhGVFX5NcANRLuzHgGzi9nIQcUxzpVWT81K6NYOOlcvyvnISPBYPOZ5ez2Qpeju80Z5bFtP3Xq3JPL3xg/43o3dasbNmJ03t3O+2h5VrKlBpFkiTqF7t88rkh5r3mg855l2ZTihg3Bt+B6++4mLlBkoaLkXZ+EqUjmCw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii3cwo7erZ0oC7BhOtlfDcoKFdlCLwmvj1kvAuHYhfs=;
 b=kv1kd/fqvdlJNGgJUOevgYsfbVP8q/ztRJrkvIpVI/+NJynl3sF/j91Q6tWt6QPyxvBivYKCNJs/0WfSK1TYy3JVM/UAcXXfm9PBL2ajGHCfATM2pae7SZJXc4m05qLkOyFh9IAom/to6KMcGO+ipesG7cpoN+JzP60oHfRUlR8=
Received: from AS4P189CA0045.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::17)
 by DB3PR08MB8963.eurprd08.prod.outlook.com (2603:10a6:10:42b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 14:58:41 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::8e) by AS4P189CA0045.outlook.office365.com
 (2603:10a6:20b:5dd::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 14:58:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Thu, 12 Mar 2026 14:58:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHDbgalq+Nuej2vyIp54rQQh6HL+j6Ng8ZY0Y+KBavstQFetbCzvHtCIROxvvrBfSmXIzv1sAdH0xGiWx3Fhto25ALqxwVH9YM/RIfdE/muxq3G4dV419p4JEmvyw/YldYflQQsaHUdX2Bt6REkHy/hP+Y7nZbTziqKpa7VfVFncrE01m+M27KfXoBZPAfA85YQ0CCPTN9WixurwHxZCwqimgb3DqxffL6JdQCj4rrS5RuEScg2aRjz9ToLznBj1dNKxcy0+4ByBnz6Hwfzab28yHirloGx4pbFhOEqHgtrDf23wwvJ5VJrFZZOvlXBy+4XNvPCH+WsOhN7x5td+1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ii3cwo7erZ0oC7BhOtlfDcoKFdlCLwmvj1kvAuHYhfs=;
 b=vxfZH0eTzL86p0uSZMyoQ9r4MxTJlgQ2COevzdmLnHnqqrawqxPOMjffZ2Em1Iza5zFAKcgjfb3VHwD4ToFejswvRepLd3YLr1FNaKLSyjJwKEX8lhGRVHdByzxG+qc3GmxOvBOHozcXQfPYDtHlHpokXb7z49deCO4lEdtxEUMdT/jqYAH7xZk8AjXo/fvFihQXD49UjKYiq+FnRTwVyfdNSTH6HrUhpclBSlLIRjGT9eOGEzhBHDmeHq+t6ij5C/rGH0bBJdql9deuPriSbfN8+N2U6DkMa3ADVWHj2GJpZVUw/fhlN5mDqHwVvkhAxrCOWKZdm1J5yTi+nMHfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ii3cwo7erZ0oC7BhOtlfDcoKFdlCLwmvj1kvAuHYhfs=;
 b=kv1kd/fqvdlJNGgJUOevgYsfbVP8q/ztRJrkvIpVI/+NJynl3sF/j91Q6tWt6QPyxvBivYKCNJs/0WfSK1TYy3JVM/UAcXXfm9PBL2ajGHCfATM2pae7SZJXc4m05qLkOyFh9IAom/to6KMcGO+ipesG7cpoN+JzP60oHfRUlR8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GV2PR08MB11722.eurprd08.prod.outlook.com
 (2603:10a6:150:305::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 14:57:39 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98%4]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 14:57:38 +0000
Date: Thu, 12 Mar 2026 14:57:35 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
	broonie@kernel.org, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v15 4/8] arm64: futex: refactor futex atomic operation
Message-ID: <abLUX961YjcsNaWm@e129823.arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
 <20260227151705.1275328-5-yeoreum.yun@arm.com>
 <abLTji8bbO3b3i3r@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abLTji8bbO3b3i3r@arm.com>
X-ClientProxiedBy: LO4P123CA0309.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::8) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GV2PR08MB11722:EE_|AMS1EPF00000045:EE_|DB3PR08MB8963:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8bcbef-1d3f-45e2-fcf5-08de8047d98d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: lr9L8MZoAwWftLVW2tw1b5KtMkTw1bQS0m4WsJl9N4TWq5MAuCBR8Gcflj9r+wC8PJ83qEkTdix3IkOGIwbnwKUjDfq5aAFtPOYHO0LKccEpIw1mqG22sKoSXd3qnrJVzkS82I9Ijbh11njxbIEUla8bXuyCx9rJOJP5Huw07zD8kh8eElhV/t7s64s2aDd4yaIyB6E2RH07DiWHErDBa0L/ZKiPWwmq6JT6UjahmtHqEZFodUvuldlAuTEsLNRKf3RaSjU8515q9yjtLUmZLLhGFphYMmzQ4GmFWWvA9G9NsmF/G9sG5RYWWPHniEc0xwm4QOz2FPoyBHopoWIo8lB9LjtQQe0zmyMc0PuB9ZUhorYMK4cX0P02ACGHlMCGm0S1MoqrwwACGUnRwodC7w84TrqRE6PD1v9lIkU6V4J4vZc8rcHRPt6YVpgMR31fidGj5UlhbnptOMRazLU1CGmKMGjU8oaZtvsZmFwjTeqBCWkgOSUx2AqFXMyQhyGv/jV2hCY71P9WbNdr/g5kZAl9m7gm//bxBIl/UmnAatFrWj/z4PrjjDIAKkVvJJqPypd+W3RHPxdeSE7NsqmSrwQ6mvjd4ML02ynrwURaAGuGsIpOReaNI+G/bi9y9fZY1uSLwlssk3POP2wZsvMre1zeHur8C2v3toPDeyKvOYmLPWtA4hBbO7achT9VP4F4hSF3VONid1LPOoe0PrfEAPvF+SL0PphYQe1c2TQEPTc=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: A9LjHqS2ZDqfU3ryQGHJwo3vUKPL5aW2Eoy5hi1QJqjkfQrlypAbSJ+8npEBoq5PGYy3QCAr6yiBx+43h9MRsHVDuRWMjHLCrEtYjBkR3s97tzIKcYe3853Gb1OXCcdVlziPw4PIZ3BvuNNd7kC5W1u7iCT4NiwSVSqq06MA8CF1zP+LyVDzHR2d7IqphlgOj+ximM0dd+hiriSZRNEh5T4F8TGdoDOPuHfwrhc4QRoEnN7hh+iGEw3Yq3agJ7HNg9S8D0FjnyDWYGSoe+P2AV73tYs17cpUr4c8iNlQ722/pu2hK7/akKVDNUOgLNy5ZC3BcCXljbMyYUEggxadNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11722
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 30fafdc3-b1b6-478c-4cdc-08de8047b432
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|35042699022|36860700016|82310400026|1800799024|7416014|14060799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: GjwNEMo5IOqcwO7OwXEBsYP26i8ymoPKCqpViB9bwvrFQGLaWVYf7Hg876PUfD5Ok1pIL/tPM0yQkrmXjjgFX2mTG3bnjifAvWRHVIvK8VSRIudr0bFxYDnxhvj/hP/kzu/mbV1gCA3M7sE3JbdSowhANSJS+k61cAat4kKX/SfDio8ALH4SwOnwOUH9xwegEgV/sikWy87ZILtiRezwLwDcZ5vi0GLl5HdDDym4Ij61Q++WNFO+a0rWXVm6EORKKsHNTVSF7VAr6tfudDQqd/e9ENxjYXCDEngv8WJrbvT0eEs75f+i+9HfTWdD4PBNcMlja8Qfr7IzmUayg/eHdU0qb3Rdrs4xVbToAaalccG5u3yfiK1f4Lvo6xjqAXrDRXvBwKmYyJHjAmDF8405VaTRNHjjxYy/cKEqPAxnDLxVbmDvCf5CaMYabgiUxLulqPMjrurBkye3V9lVrv+OVR/gHapZ2hM+xd6KKDdac6zQ+NaBxD0/ybT1BNdz67VSpY7GStGDOUR5xZO27ooK0viildmWG81XKvEzFygl14Bx4YUHzFfVq3XdlhWBPx+nJDKeEsqXdjhsFlNyLL+qIXLc8vZthsM55x7GbmER0lA1RoDfU3rYBfjN8TvTIbB4+rROdyoOdKwKaa0B7niCo6YL/+6EFLs34QeROTm8yw0aBtyDfBfw0/DKvVT2YAVzuJ/RLXHa90Lydo4F/yQUyIiq6Co2w72p3rcsaZhhA7ehKgC2ZsSDMlSNqYltA0ZzmuPcwCezcPibFw/QYxXkDQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700016)(82310400026)(1800799024)(7416014)(14060799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P7D8MJ4toFZtxOX3dSjyCEMw1KbLBXZcoC1MMJWshjk/md6PdEbeqSv7WR/6eyUZKZzfUL3T5uG9isLM08Ht/g8fP5o8dXvgibfY0Si7kxe9YthSCzxTIgi94xphyluR2g05T4h+IhCBRI54nlhdSDKrf0IXgefF6F7usna9VGOgNzxaIpKCwIXEe+oyqXsd4OprI8tdA8z1VxRn3mnBbbbDse8KFIUdMNOwT0kz53OkTGic1YBRMJGXbj1Ks+OjYGbIoa6Rj7HRc0ewI/WMaYsUmFNZCqWD59e8vxu1uwvm7QhScuYNw642Q/yMoxZfMgH7mqgpNEut8UeRgdAD7KLTSzfKSwSRqurk7RJk+A9gd5CRBS0l4+56HKvQ9ihCRMjYgL/05gjUtKToWene8ZB84NTQ4BPRdNFpApAZhqTuSyyL0DB4y2ZExkN/tdun
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 14:58:41.3217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8bcbef-1d3f-45e2-fcf5-08de8047d98d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8963
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_075848_816720_49D120B9 
X-CRM114-Status: GOOD (  10.17  )
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

> On Fri, Feb 27, 2026 at 03:17:01PM +0000, Yeoreum Yun wrote:
> > -#define __futex_atomic_op(insn, ret, oldval, uaddr, tmp, oparg)		\
> > -do {									\
> > +#define LLSC_FUTEX_ATOMIC_OP(op, insn)					\
> > +static __always_inline int						\
> > +__llsc_futex_atomic_##op(int oparg, u32 __user *uaddr, int *oval)	\
> > +{									\
> >  	unsigned int loops = FUTEX_MAX_LOOPS;				\
> > +	int ret, oldval, newval;					\
> >  									\
> >  	uaccess_enable_privileged();					\
> > -	asm volatile(							\
> > +	asm volatile("// __llsc_futex_atomic_" #op "\n"			\
> >  "	prfm	pstl1strm, %2\n"					\
> > -"1:	ldxr	%w1, %2\n"						\
> > +"1:	ldxr	%w[oldval], %2\n"					\
> >  	insn "\n"							\
> > -"2:	stlxr	%w0, %w3, %2\n"						\
> > +"2:	stlxr	%w0, %w[newval], %2\n"					\
>
> Looking again at this as I originally reviewed the series without the
> positional operands.
>
> Can you not use only named operands instead of mixing them? The same
> comment for all other asm changes in this file.

Okay. I'll change to use name operands only.
Thanks.

--
Sincerely,
Yeoreum Yun

