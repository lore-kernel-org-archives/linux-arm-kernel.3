Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668E3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvR2l0im47dH3xfAJ3k+anTAGIEx2kigThy8ykXsfsU=; b=2sshO12QtB27AOSJB9xOlzX9TR
	9K+3XNesDRsC5UmFa438XvhxXXFQigk9TtpRaPuhSTOMDXHL9OCS1znW6+du/WXBExi08nILqg9W+
	8wOxxk8b9QM+xN37msNx3b/TMnSt8se9RKF01Jf4yBVd7thL146apKXBAwrcviyGuNhh/fyaLLMY1
	8vZgTu1nS1KaCfLWMGCuZs2+GsOBFUaX8hHqoXixBKN1SgtnxXyGWokZsFRAs0nQ8p0Bu3ZpGLV6d
	CMwvXCa2/szhujwj1ZTCFvpqha8WfZvXViffzkuiNT1iovzpbYlyPVxqNyfmLmQkEW73HtZBbhboc
	hSBp4mMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdV4-00000007L0m-0iqj;
	Tue, 31 Dec 2024 14:45:38 +0000
Received: from mail-vi1eur02on20609.outbound.protection.outlook.com ([2a01:111:f403:2607::609] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdTr-00000007Kun-0hFA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 14:44:24 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qF8274jjlukYpSRXU98iaot5M0owg7P/f6oEVvwEb7zTls75bRgcn3NNzdj5TJ4T8NBh6nv7qWxx4RYE9zlPiWMArTCcC0gQAFfD+6Kx/QW5Rv/MWrVXwNwxewG/Jyw2fhhmWmp6Qu+xm8CdPET28s3wsGsIzw9sAXHBd7dt0CtHDJ9ZB3Muhr0G6dNQBRd9Z0Z/myaLrF81xp9tFOTPORQr4Eb193yZxTACjBErD38mF56kuce+zIRjsFiUAwWFiBrcJ9z3pRV+jyyHsuGlDuyU97UpwyozGm2xz1/IVm40O7ewuT3/uGQjwnEg91TY/MlVFM1nifh9CSiC1+21Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvR2l0im47dH3xfAJ3k+anTAGIEx2kigThy8ykXsfsU=;
 b=V2ArcErc6aGYw/66N0V182GmFOpkhW37LMRslA9hoFJd7lTW9BpKS1NQ3gOkhrjcOxS7h1kvtMyD6Bbr5Nutra6+WwRnBEnW//K6bhMmcpu5k5uQv4Rp/xLRNULCY9FIXl4HWClvaXuSAwXb1okU2CUHIR+kWXA7r+64nqk0AgratbJFxnqZTHUNnGOQHxiRWJ2YxfLZOW3ggdm2ELDAAfMknwpPPBmN4i+Ag5vNcYaJ26fpoxkpHhphnEdjrGNnNdxQI902EPgCBE+l/WvqikEEwCdtH8kovMAFEcG1+BLgMO+zP+ugQ5y0PIw/X4o2eeMsZ0cfPHkyYjBTnnn/Dw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvR2l0im47dH3xfAJ3k+anTAGIEx2kigThy8ykXsfsU=;
 b=GDmaRXWPcK2OIiPbTHPTUTpLUW5Rp0Dw8/Z1r58j3oJub5NCLFWrWCvpJQV7MlZPuTMP9JRBL5609RMoZ4AQ76bhGBlAAe25vf948xKK9GS2D5P4Q+iwf2ZknpMq7WkcS4pTIYNJT6oMHrgbFmnm79wHJtjPwyLmEfOV//2rnSU=
Received: from PR1P264CA0165.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:347::15)
 by AS8PR08MB6469.eurprd08.prod.outlook.com (2603:10a6:20b:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 14:44:13 +0000
Received: from AMS0EPF000001A8.eurprd05.prod.outlook.com
 (2603:10a6:102:347:cafe::20) by PR1P264CA0165.outlook.office365.com
 (2603:10a6:102:347::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.20 via Frontend Transport; Tue,
 31 Dec 2024 14:44:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A8.mail.protection.outlook.com (10.167.16.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.11
 via Frontend Transport; Tue, 31 Dec 2024 14:44:13 +0000
Received: ("Tessian outbound 7762b28e8285:v528"); Tue, 31 Dec 2024 14:44:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f06d7c9d295b3565
X-TessianGatewayMetadata: n4K7g9TJysWBe04y2D2quzCL3jxe2CD3IQn33ZST3MCRLzO77vkjjG0SWqjQFWNuVjU3KE13WCrUzuvX5U+e/bJz+9xRLYc/Ib1pjeNVzN6Ax7q6HFVfu+UP7AGUBSarnpFNrrwDQjsP3uQZqbN0krFZo9knLiDn5OnLZol6irk6x+OGVP94Ib8f9Tcso9N4UlgvNfugBenSa9vcdyHUUQ==
X-CR-MTA-TID: 64aa7808
Received: from L74ab86e0d9c4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2112BD63-8C81-47CB-A970-5D5209032BC7.1;
	Tue, 31 Dec 2024 14:44:06 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L74ab86e0d9c4.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 31 Dec 2024 14:44:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFnl4v69GR2hHbFDwvQ4ZHJiPj6uuegwWM0HgWszr7XGPocUB0Bd3ZAyR5MLIrePYlNTKPHSFd8tFi71nUH4zZBbB+wYS1JylWbnvCPu4a9Fzen6AYP9TOVsKvl+R49DoN2brkOAsAWOFnDU5BrDSe9NSzHI30/aayAS03l/ktGlOkQugt5R34TCf1BPWfRWJt/X4g3kn5b+VLZy2LIIQB8k/9kKJwCrBg2ZS+4B//dvc55rtPb5LvELDDBaejIedb4lcropN1rk9dL5udyT6FM0CTo93BOE65gfA658rByjPwC/k53G6bhy0oTGv2YdTy89vlVkyt5uUM8lns0u8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvR2l0im47dH3xfAJ3k+anTAGIEx2kigThy8ykXsfsU=;
 b=ypwBj7t1ghbJXqeFOJc9BBdj+s8uqWjkbIpGJ9/3rbAMyDRIgPFzt6VoLCeo1hBRRdyoFrz/RfpEapIfWPHBsdJyYSCFSdfMzR2BrI5Ng8v3Uq1irDUB9LvW99Io+nXJz5JJUmX324fwnhSEjPdidUJ7PBoByICizeGXqw7glvK4aB1lXQRe0ZGAG9k3xCZ27FoM3mgbmD3C50g3jqsX50/tK8WLPoxVGMTK8kkgP3Xe55LFCdfOi/1sBeOxBqEg3NxN15sv17QKot72/ElF0FvN+2h4/vmDYqJlv9oW3nMdY9pbw9RmI+NOCkJp7r1OLfdiOdZmzmt886HlxVnO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvR2l0im47dH3xfAJ3k+anTAGIEx2kigThy8ykXsfsU=;
 b=GDmaRXWPcK2OIiPbTHPTUTpLUW5Rp0Dw8/Z1r58j3oJub5NCLFWrWCvpJQV7MlZPuTMP9JRBL5609RMoZ4AQ76bhGBlAAe25vf948xKK9GS2D5P4Q+iwf2ZknpMq7WkcS4pTIYNJT6oMHrgbFmnm79wHJtjPwyLmEfOV//2rnSU=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB5714.eurprd08.prod.outlook.com
 (2603:10a6:20b:1dd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Tue, 31 Dec
 2024 14:44:00 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 14:44:00 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>, "james.clark@linaro.org"
	<james.clark@linaro.org>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>, "bigeasy@linutronix.de"
	<bigeasy@linutronix.de>, "clrkwllms@kernel.org" <clrkwllms@kernel.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rt-devel@lists.linux.dev"
	<linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v4 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Topic: [PATCH v4 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Thread-Index: AQHbUsxKiei+YMVvyEi0xBNF5qncLbMAfzbU
Date: Tue, 31 Dec 2024 14:44:00 +0000
Message-ID: <GV1PR08MB10521C7324CAC9BDEF8DBC05CFB0A2@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241220104521.809071-1-yeoreum.yun@arm.com>
In-Reply-To: <20241220104521.809071-1-yeoreum.yun@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AM8PR08MB5714:EE_|AMS0EPF000001A8:EE_|AS8PR08MB6469:EE_
X-MS-Office365-Filtering-Correlation-Id: 651d26a6-9883-4b21-3c15-08dd29a9983b
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?hCF5jjj5fqk3lzNwoQLp4sYTvf12/RqDYYnoEY96wx/8GMft66FWmkstWUW7?=
 =?us-ascii?Q?s2oadWp5UzORWY+n4JVHO0ci0OFwGiv4D/GAoFkpJn0CQCEJ3UMWXAYLq4KD?=
 =?us-ascii?Q?M8DsNrakUPf/5DJAODKywhxYJwjODUihDcNe2SKgkMgzO7MhkCXbsiANKTof?=
 =?us-ascii?Q?rFK7DhPDkCHXljMH/g+5uaQyblWkGowOqARF66vC40YerWW/XlqtcFPdm7bX?=
 =?us-ascii?Q?hhomsVPwJyIjeThcPXRcgKUdMb49WrhNUfe5J97OvRir/VZVyOZZdBZOHWPv?=
 =?us-ascii?Q?H4PqG36yWDPaLb2sg4sNt0qBkGSJjkDN9aq3GmPw5MVZUvHJ2fORD7FNKamy?=
 =?us-ascii?Q?9b1YGdxykJwIlBlstsH+vdz2NHY2fMDLQEaLmt5XflSMd0uudSuFJB1rdP5H?=
 =?us-ascii?Q?53nEODqr5NT4iZ9Z1osv3T9EYeqUtsviqjrwV2bLdFAR68jTtBA+f4cAqfta?=
 =?us-ascii?Q?8sTugF80uMJ2IP/AIUb1LFrmm7GUcThAaLJAK6LdZpdXV+lzv7vqnH+OcX11?=
 =?us-ascii?Q?N9Jsd/IVaJSJf2GSQq/V262GZ2P6JDo0IkPaOU9E03hhSp3oj+g+R7kLRuhG?=
 =?us-ascii?Q?PJUatwPXr9G2vz0ZdUYPckwAbcbEQeIB4ew6GaBd0tk03T1VfJpV6mmuiKXj?=
 =?us-ascii?Q?QB5GiVAR5gBp6D6Js1HsYTKZ75C5EAO0sBALfshSgWSeOAubh3GLPsnjMTce?=
 =?us-ascii?Q?EHRvfLeSkpDtj1A7pj1HOhibIMCkMsnW/n+ABcKbzkai2Hj3+yKSKXPP1iS6?=
 =?us-ascii?Q?h8rcc/dNyih7DB7CljYv2EG4y1kEOh9R6hOXV+zqHpSaod0dY7yFLpqHANzX?=
 =?us-ascii?Q?O23NJaaFANLWRKaM95emUvAHk7sKPHhXEPI+FvN9dMIlseP1j+DKHzJ3Dtyg?=
 =?us-ascii?Q?q04EeAZenwufcXz88oTnDPBkDCybCSrFHEgK+44bfQV0fcJe0ScsaWPKj9AA?=
 =?us-ascii?Q?Iw5thPXEEaBBVR/p/qj0HdHGZyKkk2LY2qqoGqEp4k6oTgGxQJkU5xFF7LJn?=
 =?us-ascii?Q?tiKgBhdU2+SkQVfZsjAipfmU1nV3044TEKfAQS/FCv9m3OQDhFsLkAyXLi3p?=
 =?us-ascii?Q?aNmc6Q78TUhQmen49/u1dUdxhV7inwbBwTaZUU9pSCdfoFDN9wj2yhf8/Jks?=
 =?us-ascii?Q?WD3TK79U8J8BqC7sppnyfCyopAesf3/ghnmurZSYetBEnYbc2WTAfUGyiuyW?=
 =?us-ascii?Q?4OzUhdoUmF5Ty5NYW8CIbJQohj+ZuLl18Cwx8xVHMCbaHuuKvraRVFaOjlvG?=
 =?us-ascii?Q?M7Rw2aXwq0pzYrf0Db1tQG8ofE6Eei/k/URELhM8MUIZQaKWqL3jysnMR2O2?=
 =?us-ascii?Q?lb4Xr8GY7gYsE1IUy2yjOqRLZAMkwuO04eHkZjNwJm2izTlb0umalJn5wrhe?=
 =?us-ascii?Q?HYq2QtQlm9QB8w1coCgl8xoGiPHel10T8meBH0azA4OwzziM6xwUytvfp6Ee?=
 =?us-ascii?Q?MI+OyPDRqTGVdIJHRlsyma+399ASgcP/?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5714
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 26f9cd64-882d-4f40-082a-08dd29a99037
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|1800799024|376014|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PRWSwGAqxKcne2uMLu1SGlRnoxuFqmwfEu6mQDZRu80xf2QAn6NCJtvnMV1+?=
 =?us-ascii?Q?8S/NKvOfKg/7eNVy2yuBkGVR8VKsTx1N0kZZQ+1Q7iUxDqXcF5t8nS53ywg0?=
 =?us-ascii?Q?e2QzO2Qt6AASlrImaeAqansqBzNBDoeR1YIRpwWtZ11sQCUa7cLGHtJZfPQK?=
 =?us-ascii?Q?1qbWImsLJF92ILts8wT41iIcDmAgqhQ/+pQVCs07Uoeh8z6uq/8S3/HdOsUa?=
 =?us-ascii?Q?cZCzAzdKLid/mYwXsyUWF/t7BKjeWOZIzfKUw04UvJc039e1jNOtqCFvWj5P?=
 =?us-ascii?Q?thakg18/+6vUWr45y49Lr6Shvd2YzFafxvSPZkIYNmO6UfC0wYvmjvG3ZZRk?=
 =?us-ascii?Q?jBr0OmfhScAtO86lvM7XkVMdw6U62gOZ1WsdiMUVeUFcFC3Jj44fzon53Lpv?=
 =?us-ascii?Q?YUMPy9sy/HePUzgMtd5br24RK6e9oDFwJYWYx/H6+KhkolccBwZZStuQ8a98?=
 =?us-ascii?Q?4zmjsobyzQlrKRz/LWXf6j6G8OLVZTVN3w7gLeNOL401kasGZk6kjV1paMH4?=
 =?us-ascii?Q?pN+yuktd+MiVxVKMNgxRlXg7guV1NU2xW+67MvfyAbl+z+oEIXyAQixomEoy?=
 =?us-ascii?Q?MglDpIXI5xgW8mWE6eGtS4Q84OKn+wMZU3JMgT+IuQ/XdGXbPe086Op4ZVd0?=
 =?us-ascii?Q?PpkVbReDbfmwd+tghMDmJWExTTZnf8zGHI4wD88oQ4s6baEHuaOE4LAKVWKJ?=
 =?us-ascii?Q?hv3ZLyih3vzPtRLjE1vp90XTHls1SP2kCQ12j1W93sAUqYCSk3KlYf+ZFPkZ?=
 =?us-ascii?Q?eeEbCp/CAeERy8GH0GRp2jHt5i5yrUKsYDk9ZLTUhwQMcNhQzxBmBq4WAvUq?=
 =?us-ascii?Q?iVUxHiANyaEJA3GEKh6WzSo2ucZC/lPP6TZ5xAN5xyrX9he4WdxK84tmfGrr?=
 =?us-ascii?Q?xlozKJ4oVbPI3XD7zDjDU/NFVVPXCqWqThRe11kVe/Mi/sIM/nViHVYvm3MJ?=
 =?us-ascii?Q?7SkGSIsXO2+ZiE4pnpWRUZfFPu0eHp61cJqGRrtiYiSTuFbEbE/ZbiU9YkjE?=
 =?us-ascii?Q?HihF/EAVe2Fcqi7EAe0BYTx49mzJvhh49KGcaQJ3Kw0cWuo1bZlpgqz+oRiS?=
 =?us-ascii?Q?h41cUSvoqY/MF6GO2/Vko8rH8n1FVdohM4PBGhSZl5Po/oIhxGKV/rn8YfQd?=
 =?us-ascii?Q?VqpmkLsL8BxeM2jvjzNJTVl8WNnxmLrkRPuVqsBfPmtnWkgLyzEKXzwrUClA?=
 =?us-ascii?Q?en3P94hKO32x9+1k+/8Iq4OWCZdpQUoDqwyZQsPo3U1U5WBAyIv6RYXU9cZK?=
 =?us-ascii?Q?D38hBhMBmmXvU7VIZt1tMgrjYCROgtkKlAbE0tn4cWYi+qgw2/NAsvuhDSqM?=
 =?us-ascii?Q?7C1ib3JZHUNzcFedmErSyetoBeMkFfCQqgQwzUfwlM/SPFC4V8OcNzYlTeC4?=
 =?us-ascii?Q?0IWScEjurZEhbQW7BiSkzWyoZ2NceOOO0VXeoayPBqJ1Y/JHBapcwt/t1Y9Q?=
 =?us-ascii?Q?Hf08fXf3a+m0MqAzxN0blBkv3ulV7249HdB+VhKo4UkADPbsmDeJmIvLLK+s?=
 =?us-ascii?Q?pVIeT6ffjI34POU=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(376014)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 14:44:13.6084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 651d26a6-9883-4b21-3c15-08dd29a9983b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A8.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_064423_399741_94B40BAE 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
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

________________________________________
From: Yeoreum Yun <yeoreum.yun@arm.com>
Sent: 20 December 2024 10:45
To: Suzuki Poulose; james.clark@linaro.org; alexander.shishkin@linux.intel.=
com; bigeasy@linutronix.de; clrkwllms@kernel.org; rostedt@goodmis.org; mike=
.leach@linaro.org
Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux=
-kernel@vger.kernel.org; linux-rt-devel@lists.linux.dev; Yeo Reum Yun
Subject: [PATCH v4 0/9] coresight: change some driver' spinlock type to raw=
_spinlock_t

In some coresight drivers, drvdata->spinlock can be held during __schedule(=
)
by perf_event_task_sched_out()/in().

Since drvdata->spinlock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this,change type drvdata->spinlock in some coresight drivers,
which can be called by perf_event_task_sched_out()/in(),
from spinlock_t to raw_spinlock_t.

Reviewed-by: James Clark <james.clark@linaro.org>

Yeoreum Yun (9):
  coresight: change coresight_device lock type to  raw_spinlock_t
  coresight-etm4x: change etmv4_drvdata spinlock type to  raw_spinlock_t
  coresight: change coresight_trace_id_map's lock type to
    raw_spinlock_t
  coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
  coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
  coresight-funnel: change funnel_drvdata spinlock's type to
    raw_spinlock_t
  coresight-replicator: change replicator_drvdata spinlock's type to
    raw_spinlock_t
  coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
  coresight/ultrasoc: change smb_drv_data spinlock's type to
    raw_spinlock_t

 .../hwtracing/coresight/coresight-config.c    |   8 +-
 .../hwtracing/coresight/coresight-config.h    |   2 +-
 drivers/hwtracing/coresight/coresight-core.c  |   2 +-
 .../hwtracing/coresight/coresight-cti-core.c  |  44 +--
 .../hwtracing/coresight/coresight-cti-sysfs.c |  76 +++---
 drivers/hwtracing/coresight/coresight-cti.h   |   2 +-
 drivers/hwtracing/coresight/coresight-etb10.c |  26 +-
 .../coresight/coresight-etm4x-core.c          |  18 +-
 .../coresight/coresight-etm4x-sysfs.c         | 250 +++++++++---------
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
 .../hwtracing/coresight/coresight-funnel.c    |  12 +-
 .../coresight/coresight-replicator.c          |  12 +-
 .../hwtracing/coresight/coresight-syscfg.c    |  26 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   6 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |  48 ++--
 .../hwtracing/coresight/coresight-tmc-etr.c   |  40 +--
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
 .../hwtracing/coresight/coresight-trace-id.c  |  22 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |  12 +-
 drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
 include/linux/coresight.h                     |   4 +-
 21 files changed, 308 insertions(+), 308 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


