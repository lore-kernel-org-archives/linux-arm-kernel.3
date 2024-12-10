Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70813E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zbVHDIi4qCeQoDKJ+C7zxQDADJuTho+uuerXAaDhYM=; b=uWjLf8IWNH5LFzEgIwvw2YjKK5
	uJ2fjDG8ku/+YvfpJky4LJWP/Q9pjxp8I6eda7nU8tZaINTW0LThSHl02bIMr1fXKw2cRVsH2xmY0
	iQrGjmACAkplLFZ62Z8BNaKj9sHyazCTgv6g8WmebOsMlGFkh3yCdcJprcIj16ycF6L3vzlsUMc9D
	0ZiTx1XyJboSwUOWS9ARpkLf5vVPfirMogGOJeToWrjTZc5EKNyRyPQ/osOKbULZxkHTIKUtVuGjx
	O1gyLXDSuZK1MxsFUe7eRZdSGw/CwAsD6PuVTmaBZMr4pXawIjXO6S3ItrAe6+NNk6QbJRrprRAx8
	HqbtozcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKuoz-0000000Aa5o-1ldK;
	Tue, 10 Dec 2024 07:38:17 +0000
Received: from mail-northeuropeazlp170130004.outbound.protection.outlook.com ([2a01:111:f403:c200::4] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKunv-0000000Aa1B-2oKh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 07:37:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OQwszzlzrtq650+NSBcm9bf8g4i0HLvXCrHpfU2DMO0MmacqU7TtJtwCnRxX/Ldb8vD2CFlJbgBmfhUyEVC3WrZYBC9q7Ruzk6mrqQG6gIllWjpMJdAE04qcGd4rn04FdhFVvKKd8Rog3nbNbRIMfL1/XGWnfW5kQi0twdpkhkyQKoJobkH1yiRk7fcr04XgBYeuST0PPcoAR0tShGBrIivwmnbN1u+YBJs/CV1+rdyJ7m0+/LpWYD+8rwwhVH70jWuFX0IqnL7b2l9lswtHGCHdApKyjMkFpH1cPQJJIz6gjsb3BDNLNyupKeWrDy+R+Z8I8++kB/VUh8gg7AiMuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zbVHDIi4qCeQoDKJ+C7zxQDADJuTho+uuerXAaDhYM=;
 b=ojpoAdWggaTUiDXAr8hHs2uxQxSu4VIB7REI6MutGSfROJg4V9jssE+MCPvMwD3S8Lk6sIpec87PMgILssUzQKUn5J0jF5hbGt7OcRFRlg3W9K5c3Bd7NShbgnJIO5yCznJNTsmAHDIJ19+I0PdkFu23jVX6HrV0UyWYm3YXnAkGWfRrA/g3L0+tr/8sA1rymoXB2okv+10v9eVedUlUTac6ZQ4VNPHD71YhZeNK0EO2WGQO40AYjzWIO32KQoIX8T1bHlRXokrYNcTxHsFwKwmWORGxvIPHskmb6z5lZpLJvlW7IaReqIpXHEGngmEVU3c9ugOI6SadN++aBkWPbw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zbVHDIi4qCeQoDKJ+C7zxQDADJuTho+uuerXAaDhYM=;
 b=WcaJOCbqwH5k3gllbEWLMCSUqy1MEvBtr5ooEdMOip4SPTASa/rnYwoJXMUPKSBl7jL7b5xvkbX9fTFROXrvKx9FPpHNixlnfjVARq/aPGf8z10KUPOvm0W+TNDWNqfzNbESppC/pEGyuCei4nd22jbYTTuA1PqvzaO3Ke8b+3c=
Received: from AM6PR08CA0022.eurprd08.prod.outlook.com (2603:10a6:20b:b2::34)
 by DBAPR08MB5829.eurprd08.prod.outlook.com (2603:10a6:10:1a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 07:37:02 +0000
Received: from AM3PEPF00009BA1.eurprd04.prod.outlook.com
 (2603:10a6:20b:b2:cafe::12) by AM6PR08CA0022.outlook.office365.com
 (2603:10a6:20b:b2::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.13 via Frontend Transport; Tue,
 10 Dec 2024 07:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009BA1.mail.protection.outlook.com (10.167.16.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 10 Dec 2024 07:37:02 +0000
Received: ("Tessian outbound b1586bb311c4:v524"); Tue, 10 Dec 2024 07:37:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9e3768eaa3fe9e0c
X-TessianGatewayMetadata: aS8xIqGSi0mxSx/VkIcW5PBFyuxW2EozCre7xWwr2hodHxqR/f9nyQEwFpoEPuOJwAY1+xRlTT3EtYjjM0CAboEQh0R94k/hqfH++YtoNyprUxzMvvmIw99ymrXpHuzSqoMNk6HKTmjQjyNLN5asXA==
X-CR-MTA-TID: 64aa7808
Received: from Lf039df57b294.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A65BD58F-634A-4C08-919D-6E90A98A9EFB.1;
	Tue, 10 Dec 2024 07:36:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf039df57b294.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 10 Dec 2024 07:36:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e27/26VA2t05renLE0MXMYD0ML1V2IJHxdYo6uPkJJ6doFUw+CWUTgEDqIM4TwjGh8NrHM2aC7r+i5lV7OfFGnVmrVAfDkADXatXj4Y8okG/j0JcqwycNojwKDt5rpYYCVAGgKzvVtfaHsLaMsJgItRMy66UwLFhJhL1b+OyLSG1ddCO+EZaFxu4CQ+fZjX/wvqyHwiBq7WYK0OQymmGw4K2TsdSwkCCizrF3JOxJuEIw7vMm3Q5v0XJo4FtHKEqzNDSgPKOGT5L50NQ9E1p2DDdGM69is0JI2/w9NUOtuaM9zxdP/m9emh3YpZxJlCmx59W8Tomdieb/zvBLU7RrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zbVHDIi4qCeQoDKJ+C7zxQDADJuTho+uuerXAaDhYM=;
 b=OMYmuX10UemBKIeKRYvxmxtXysChwQK84uMSsp2tAARh5k2kl3+JyGnDbMUThtDo/ObcPmvxOErRQY0AAxhaIE5RcDv1Yx0Yj3ctUCdAkqoDMTyP/1E45yheDC4VKC9wiHbugV+EHDOcWu/0Fy4FCTUxNSN7tEfY5uOmu32Yv6yB7evAm28KJBze8EORysV+3QW5hIl7GfzV/8e9kSGLv7IX2LafBFj4OjhYMGsu9zbuuci9ECcoK3XTFnXPfEWRNddX/dsyQRAeIUg2EAVKtKPin5fUips0IhB2hMkN76rJrHs3FnYzmpo0z3mJSzwrd65aASwkw34Z7aYg39Nr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zbVHDIi4qCeQoDKJ+C7zxQDADJuTho+uuerXAaDhYM=;
 b=WcaJOCbqwH5k3gllbEWLMCSUqy1MEvBtr5ooEdMOip4SPTASa/rnYwoJXMUPKSBl7jL7b5xvkbX9fTFROXrvKx9FPpHNixlnfjVARq/aPGf8z10KUPOvm0W+TNDWNqfzNbESppC/pEGyuCei4nd22jbYTTuA1PqvzaO3Ke8b+3c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU4PR08MB11175.eurprd08.prod.outlook.com
 (2603:10a6:10:574::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 07:36:53 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%6]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 07:36:52 +0000
Date: Tue, 10 Dec 2024 07:36:50 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nd@arm.com
Subject: Re: [PATCH v2 2/2] firmware/arm_ffa: remove __le64_to_cpu() when set
 uuid for direct msg v2
Message-ID: <Z1fvkpYvqpnjPZA8@e129823.arm.com>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
 <20241203143109.1030514-3-yeoreum.yun@arm.com>
 <9e60e996-070e-43a7-80e9-efdfda9f6223@app.fastmail.com>
 <Z1ch52AthTYVhtH4@bogus>
 <0cb655ee-9401-41bb-b9cd-580e0aeef2be@app.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cb655ee-9401-41bb-b9cd-580e0aeef2be@app.fastmail.com>
X-ClientProxiedBy: LO4P265CA0238.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::11) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU4PR08MB11175:EE_|AM3PEPF00009BA1:EE_|DBAPR08MB5829:EE_
X-MS-Office365-Filtering-Correlation-Id: e2ec1a89-0843-47a6-c87a-08dd18ed702a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?B2DKScDjcQNrS1Ie4Fl5m2ukkJ2v6+i346qd3XMZ/uPBdieaZ68Z3va0pMoC?=
 =?us-ascii?Q?pdOnR0GhrumDT1XrrLHndy8YOKiJGiagT/03gJoAZqAMAOF6FsuAJZu9FNr0?=
 =?us-ascii?Q?t12HL3Th8j1+RRrM/6VTrtOoEcaCITB7iqqgmlDXYrHgfqGE0Tyg/baO5xHN?=
 =?us-ascii?Q?RCzqXqHKzyCZz1rN7i1amz5iPt9fo1uGGBA+V61oqsuXN9EEqnp0PIaqychv?=
 =?us-ascii?Q?U1ZjmQSWHDRY9O1OslgMB9yN7ZK0QIMOtp6HKdbozk70QLylOcG7MPYD/d4S?=
 =?us-ascii?Q?kHMB2QiombXjsgwuaTy8EHK/vXNgxYQADR1dr3LKrqM3/tl5i8Xu6ZhZni4Q?=
 =?us-ascii?Q?X0FDTJd9GLxEATE+hasl6YkmMhZemBwFI/qtGRPcV+ZVOcIjtrBXO+OmcWI5?=
 =?us-ascii?Q?PO9Ml3f/9WjKGKJRY8utoF0QYFnXcL6KawAkcVc5/pM/Ck+xoJDMvn/k2Fk+?=
 =?us-ascii?Q?0PF+VQhi0gGbi786363JCzdwskXA5XDjh6tchY3nUIgvCxDom4v3y1Nj9gcv?=
 =?us-ascii?Q?r3fcM3v9+12XCo+W2Gf0AxrgUObwJkjF/+fg2nn4WWGBEqnR5awazsG1+ZmA?=
 =?us-ascii?Q?jYByzpOPxnQGaW9efTRnNerEMNUrq+S0V1fn0XnOqx9pY6J5HuIG5QgU5h2b?=
 =?us-ascii?Q?5Ld9u9hfeYHYQjaFnbrgMt+8B83kW7qe59XAgdMjgO335gB1cCJTzN+sO2za?=
 =?us-ascii?Q?p+lcOXw6LuwQR27TP175dfqght/eHJwyHJvsEaYq5DihfpoL9K1qYk6Bakp+?=
 =?us-ascii?Q?cd4x6QHRZ2L0JLY0EuVXr06zpMyjKb6CSFjWXZ7dueYRXPsumMYHiQgfmBoJ?=
 =?us-ascii?Q?Ses2DM52vEhG7Y8gofSA5oSXNKdM9CA8nM8JTYa5ICgkcFJDD34FII3EZlBA?=
 =?us-ascii?Q?WscE6iz2CmVhJY3PsX39cgSNzkNyyNa43uWN50cQ6nQFYrdcq++zLKXJCQPu?=
 =?us-ascii?Q?U9DGtC2K/TkRdj+5oAsnxBwVaL3nIBM4Jn9vSVRQ89haDCtE8t3IrY9B2sR6?=
 =?us-ascii?Q?ZDjBS4W4yQwojNOj2i82usX7dVolP0vhs+qWgDmBiC0JFPAo4z3I5c3ikjgT?=
 =?us-ascii?Q?Cg70JwFBP5vyx3I5QUIEy+oX4anGldsJHG1n4BpsGX5RoowkYuZ4PTzHhF5o?=
 =?us-ascii?Q?N0WAOdJVUXR00KZgdtRAzz3peGPmTltD4aMCSd80qr3lJrT0yzSyveBldxhf?=
 =?us-ascii?Q?WdCBLUgDwBpPWMyKgCE4FtRYXkxuDYwYccIViI2vcR9wmzMicvFZFNvN0lcb?=
 =?us-ascii?Q?9ioloNhfy7oC10x3PH1dxcY89pZnJ551oN7jK5vQVCIs/YojVEYm/qLtrMLr?=
 =?us-ascii?Q?Gpt6F18NAhCoZFS3RcBiNIfBAHeBBmIy8WNnx9RxVCGVDw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11175
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6118762f-3ff5-411f-b372-08dd18ed6a1a
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|35042699022|14060799003|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x1lnUxWvAhF3IypzFl1yk/UTvZWd2KYSZTKSUDn/EWM4VIiQo8O06pq13A1D?=
 =?us-ascii?Q?8Qx+D3NzNVKURY2zJ3NJewmbRXEYYlEdH5AYU6evECxH4iUoD9DisSA7WmZp?=
 =?us-ascii?Q?rMKCpulXf4E7iktfr+xtftIwsCA2/v3PHEcX77w3u3Bp+IyHqRmSP+YNN2Om?=
 =?us-ascii?Q?tHAknmaO4PTG2uK8VDP4u9HV08fQFuyxisvVLnO2/c50bhlowktq269Ctnaj?=
 =?us-ascii?Q?Vzjgy9xOxHh7Wc+4aI/8LCx72iluGQ9wgTteRCJRQrQUynOQlp+NQEo2axTS?=
 =?us-ascii?Q?hlVJqXHAVrfYSenl9b02pWIYG/xPlvFNIp2l3RPWGUYToHX5NWsX6K39BvGE?=
 =?us-ascii?Q?07U9Y7D1FzTTZhdjz6vzePc0ew+0YMkD1yiuTgOrf0o1TvHFk4apiVpEolFt?=
 =?us-ascii?Q?qPyrfIgObKpeF2hVZAvuh0KJwzuW7xhPsS+Me+7HKnmo1mtO+eT2WOudMU3Y?=
 =?us-ascii?Q?nclHIXBfH624MgUOGgZhbKKrUse7CzGDPZpbsMIt6EZvIO3+zEQ4M3/SRwYQ?=
 =?us-ascii?Q?k3+5m27hmNiyRYh1koI1SJHr4cj/PlE8lBhHKooR1QxvUj3hHjJ/bguP97Py?=
 =?us-ascii?Q?Nmvep+81bZpxkyrw5eXYH9zqsATjr9fKtzfyBN9EsrApc5yyCVy3XPRiDaxM?=
 =?us-ascii?Q?5xGXE1VHh+6WhBGQZEh7p3v4E2HsaEiAQFcQ/8q8GGo5SDPSl1mDU5Dqz4JP?=
 =?us-ascii?Q?mQbpsXiR5EuHp4LXX7gRZPMe2EIjfeiqspNB+WliVlLisA37cZdUIMDNcO75?=
 =?us-ascii?Q?d/xC4+Qy9nWjdd/ScaNNQ5rFvbhrPbwMoGOwW+qoZ2SyrmvJiENg4sOi/dFy?=
 =?us-ascii?Q?dpXQfG2OUTlreBY9iPWWDEPgaGZSzqvMeqgVT2PRcx1livKD0R/rIYPn1Xco?=
 =?us-ascii?Q?pPc3uUOzZ/GBqW5YzRyrtGb+wCmBhuqL+gzJAmrDeRsYniT7eZyI3WbQKjG4?=
 =?us-ascii?Q?0Vkg0BbRw89lQYruMlpjPBtZxIEKv5xzKhkMbuP2Xytp0unV4+h6qAi5vslY?=
 =?us-ascii?Q?P6kBXhfl1P/Oma35pfzlOs4WZnBX3KN7mtYItz/10lYqm2qn1ckone/jwwbb?=
 =?us-ascii?Q?tReuu8qb2DcnxNXUcACeVHRW7U5DIoigQfWrpon5Tz6sDvXZ5NzHh8tlA17p?=
 =?us-ascii?Q?KqXszFVS2VZ6QigaziyJDS6FYrHBYWwndLFN925f3dGiISDs4JQXsIe8QCqT?=
 =?us-ascii?Q?t1uBKP/MTbG9oTr35K3EBofJhBzjWVzDJzBHmZMnZaX/H1DSbJqrm3vAYC7W?=
 =?us-ascii?Q?NeFxZRzn3qdndSecm2R2Q5IvkBjX3pyGKlqsbBH9ghtSPYWqcF0r9n6PdXGP?=
 =?us-ascii?Q?ErVf1ilsM6a86ThxvKh61APfRXG/eLYE719iLXx3f5wx6Lq1d9JIi0fFRIbb?=
 =?us-ascii?Q?KVY1nBtVODgbGV0OxTmDm2B/zqbb70/6n6vdeAwYR6E3uw/MB7F/8sFKqClG?=
 =?us-ascii?Q?crUx+wrrm7o4tkNUn893pm5OrEvxA7DGC7RtCm1h94bHW/T98o9KtQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(14060799003)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 07:37:02.3864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2ec1a89-0843-47a6-c87a-08dd18ed702a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_233712_058141_71B615C0 
X-CRM114-Status: GOOD (  34.58  )
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

Hi Arnd,

> On Mon, Dec 9, 2024, at 17:59, Sudeep Holla wrote:
> > On Mon, Dec 09, 2024 at 04:27:14PM +0100, Arnd Bergmann wrote:
> >
> >> > That means, we don't need to swap the uuid when it send via direct
> >> > message request version 2, just send it as saved in memory.
> >>
> >> "As saved in memory" does not sound like a useful description
> >> when passing arguments through registers, as the register
> >> contents are not defined in terms of byte offsets.
> >>
> >
> > Well I didn't know how to term it. The structure UUID is a raw buffer
> > and it provide helpers to import/export the data in/out of it. So in LE
> > kernel IIUC, it is stored in LE format itself which was my initial
> > confusion and hence though what you fixed was correct previously.
>
> The way I would phrase it, the UUID is never "stored" in
> big-endian or little-endian format, it's just remains a string
> of bytes. The endianess becomes a choice only when loading it
> into registers for passing the argument to firmware, and it's
> the firmware that mandates little-endian in the specification.

> >> Can you describe what bug you found? If the byteorder on
> >> big-endian kernels is wrong in the current version and your
> >> patch fixes it, it sounds like the specification needs to
> >> be updated describe both big-endian and little-endian
> >> byte-order, and how the firmware detects which one is used.
> >>
> >
> > The firmware interface understands only LE format. And by default UUID
> > is stored in LE format itself in the structure which I got confused
> > initially. We may need endian conversion at places(found few when trying
> > to get it working with BE kernel).
> >
> > I wanted to check with you about this. The current driver doesn't
> > work with BE. I tried to cook up patches but then the upstream user
> > of this driver OPTEE doesn't work in BE, so I hit a roadblock to fully
> > validate my changes. I don't see any driver adding endianness dependency
> > in the Kconfig if they can't work with BE, not sure if that
> > is intentional or just don't care. I was thinking if we can disable
> > it to build in BE kernel until the actual support was added.
>
> I think as long big-endian kernels remain an option on arm64, we
> should try to to write portable code and implement the specification
> The reality of course is that very few people care these days, and
> it's getting harder to test over time.
>
> > So the current FF-A driver just supports LE and the bug was found just
> > in LE kernel itself.
>
> What is the bug and how was it found? The only thing I see in
> the patch here is to change the code from portable to nonportable,
> but not actually change behavior on little-endian 64-bit.
>
> Looking through the other functions in drivers/firmware/arm_ffa/driver.c,
> I see that most of them just match the specification. One exception
> is ffa_notification_info_get(), which incorrectly casts the
> argument response arguments to an array of 'u16' values. Using
> the correct bit shifts according to the specification would
> make that work on big-endian and also more readable and
> robust. Another one is __ffa_partition_info_get_regs(), which
> does an incorrect memcpy() instead of decoding the values.
>
Conclusionly, Yes. But the RFC 4122 said with network byte order.
to describe how uuid is saved.

but I think the endianess to load the register is not a choice.
because the spec says:

    UUID Lo  x2  Bytes[0...7] of UUID with byte 0 in the low-order bits.
    UUID Hi  x3  Bytes[8...15] of UUID with byte 8 in the low-order bits.

this means UUID.bytes[0] should be loaded to x2.bytes[0].
           UUID.bytes[1] should be loaded to x2,bytes[1]
           ...

That's why other software spec (i.e tf-a) doesn't loads UUID from register
wihtout swapping byte with endianess but just copy it.

The bug is "not send UUID according to spec" in kernel side
That's why it fails when I send message  with direct message version 2.
So, it''s not change code unportable to portable but it fixes according
to spec (load UUID as it is in register wihtout endianess).

> > > 'unsigned long' makes the code unnecessarily incompatible
> > > with 32-bit builds.

I don't think it should care about 32-bit for direct message 2,
Since direct message v2 is  64-bit ABI only.
that means ffa_msg_send_direct_req2() should return error before it calls smc.

Thanks.

