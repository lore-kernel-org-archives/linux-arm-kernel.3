Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E970C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 20:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8DaUg0EWwcSKMTTwvCanrcDjLZMF4lXvCi8asDeXIE=; b=l5ZMWpaxJ/kEz4+nPQNWS/nH/F
	fm6iRP2+Fsp+W8o1dflPf//MFsQ7WT9XUs1tM4MtI1Cf+ezpqZYfb7oXRoeFVMNZ5gqQyDsXDcNBM
	WXIVwDq+HC61wL2x1mTKmbRG/K9PKDJfnGkVioLBrkomqvu3EyejZwlo0cE6byPsGvTMIkixOGdzI
	AU3wKoTrFtgD3wUuILSTV7zTin8WwdXMGHz59A5zSuV0evMBj3baCltiPpD/jtGvuFEzgWQlShmJN
	MSsZDcubAqllejIEWmavtvrDzMlV/SRmDY9peo3nzjSV3laQntY6zj81gambJumSBDGg5ShgKdXHN
	h/s1a3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqePt-0000000FV6K-0rdR;
	Fri, 07 Mar 2025 20:35:33 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=outbound.mail.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqeJE-0000000FUL7-0zaD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 20:28:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sx0Kq0rB9APdo+eF6YxbGSPOj/At8J2ixhEiZUx8NNNRXqwQk1XPWB2vBriGI1zEUvYOnIR9kLmlCVI7GskSY1W6G1wVeBmKhBQZ2XsdeDPvksuX9ZLuaPJfwlX7TPHbgwJ4JsicabnsvoMGGWGOVuDCe3nJ3x2zG9YoIexBZEGBQzdIpI1zKKKYAei+Ho5uyvl20HPskOM+NsVzP30eGxUZ4AbbUVISltsr029/yriNIjpDwx7Bva7bkLDMY+Cd3XCuatm4myZ7UjD4na/0TskC6uMQOruA/nxclBDHdnMsCaNR6uQrQuU6GqwgU/0KnYOl5GH3fC9YcsCQppDxUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8DaUg0EWwcSKMTTwvCanrcDjLZMF4lXvCi8asDeXIE=;
 b=siA/qLYhtdTkIRz37jXLjMsMLntQW71fScyOYp50WCW221dgr7VX9dGy80qD3r+uvLp00RHkWvjP2GKFFr6r2fiuNATPe6AGF+7z8dwVnAFO64wg0RrEsbq+d31Fu2EX9J9CQbjoF+E3MYB+yV090DCnCwCJpkF8iroY0vkhq4KM/pNyJ0PMU75SHMcsEmeVRs+D40ac+wKhXqRTO/mj0hiTUXYw17WOz7qLVn26jwZKRsBcHxroQeZCYgUGuy8PDPkassgoTWw9Gduvq+vuh+DRjZ2PyYu5BaU2z3mhN8lXtEFGdZHpGIQ0Cf1VNgb0Nz0LDm5ukIdDCEAexW1y+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8DaUg0EWwcSKMTTwvCanrcDjLZMF4lXvCi8asDeXIE=;
 b=a3PmN6BZrsH3Wwv7glvT37h6P/svqIEHt8ZrcoHjJ4QJ0s3hEHi+m93sSHQjCmNYl0u0IFRNn0kftzV8UwhNd+DgcHz9q6d2E80OsTcQeecVA+G0Lj9buZh+/u5e8IQ/S0ELYWMm/+05BH9gXoYt4J3a7VQA02WJjodM8tvgE+E=
Received: from AS4PR09CA0020.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::7)
 by DB9PR08MB6377.eurprd08.prod.outlook.com (2603:10a6:10:259::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.22; Fri, 7 Mar
 2025 20:28:30 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::4e) by AS4PR09CA0020.outlook.office365.com
 (2603:10a6:20b:5d4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.22 via Frontend Transport; Fri,
 7 Mar 2025 20:28:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Fri, 7 Mar 2025 20:28:30 +0000
Received: ("Tessian outbound c3a902884497:v585"); Fri, 07 Mar 2025 20:28:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 71ec563f0a98e457
X-TessianGatewayMetadata: OLLKm3K1NSZGsOKwv1Wf8YDZX0lJw5y31H2qv6C/xuCkQHr0yniwDRUHOiez5xhm7gbT/6iSNRHvbv+xQDBRe5vnJCZtv0jpDnRfdPUfF520Rf6ci/3c4Lsn2288Q0ETSGXCJaBXTHNtTl2smm8kS4LJFCRgRS3ozM0QcA4hRzo=
X-CR-MTA-TID: 64aa7808
Received: from Lf6df87b1f986.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4276B66A-DE5F-4670-95B1-5DA88F4CA3D3.1;
	Fri, 07 Mar 2025 20:28:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf6df87b1f986.3
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 07 Mar 2025 20:28:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNMalycQtMcWyMhMYLxq8/ZhJJ/qTTMvQNhXRdqelB2rW7SNoGiYfJ17qEyPeTaNjHcfz7N2jqoHMb+C8pxTwWfjnDYtH7T3yVsjkEzBfcN64ZsQZinembWskWrLgOOMQ47UjNcfDIVkdNoreRScNH7gz6qxrfA1VyRXFAlRJKiPzCmp+WSXGQK7LgPNGL3AsMXmdR4LfP/VdOqjvpMbJIMariQKQ7dqD7SIIlA2b7+NdXb/7h2eLdZjMRpYJniFZItANA0SmOrvlh03tJ4nHA8Ivx8+KGRrxeXxE9WC9Qcjghq6UsSMwYWKHHfi6Ve/8v6pkCMqsS0vDHZYpvBRsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8DaUg0EWwcSKMTTwvCanrcDjLZMF4lXvCi8asDeXIE=;
 b=uvFqR3bIEKRC0lVFnabMQGCRQz/A1MJDruils1oHZD6Mu6nOmD0lf9BAMaBnjHqBLezXQIqQrKHxMgw9sJU5d9yy0bfMWWZXDZ+2Cq8m1MXiMnSvFnmvtaUWMlqEnMfvF1ziDC+Dzq0+R5rUtZDT11Iaq7T2H8Wyzuu/ZghRjrmbK/iUPiLTLSKaqBZT8ECTwrBpw0LwRYM073A9URZ5Mafvtp+TiRwN8u/lWz923FdDW0/42XX2ticA6M05U3+yxPmpSzJ2+xBiei8msCFnWLkwmK/JC9htAgwSJfPltevWg04QIPFRqgZYCJ+3NSRp7ibWEsvM24dj5PkxlgHD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8DaUg0EWwcSKMTTwvCanrcDjLZMF4lXvCi8asDeXIE=;
 b=a3PmN6BZrsH3Wwv7glvT37h6P/svqIEHt8ZrcoHjJ4QJ0s3hEHi+m93sSHQjCmNYl0u0IFRNn0kftzV8UwhNd+DgcHz9q6d2E80OsTcQeecVA+G0Lj9buZh+/u5e8IQ/S0ELYWMm/+05BH9gXoYt4J3a7VQA02WJjodM8tvgE+E=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com (2603:10a6:10:308::6)
 by DU0PR08MB8161.eurprd08.prod.outlook.com (2603:10a6:10:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 20:28:16 +0000
Received: from DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb]) by DB9PR08MB7584.eurprd08.prod.outlook.com
 ([fe80::5144:343:7017:bacb%5]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 20:28:16 +0000
Message-ID: <c62a9f8a-312d-4f9e-9022-265e53564101@arm.com>
Date: Fri, 7 Mar 2025 20:28:13 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] perf: Allow periodic events to alternate between
 two sample periods
To: Leo Yan <leo.yan@arm.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
 namhyung@kernel.org, irogers@google.com, ben.gainey@arm.com,
 deepak.surti@arm.com, ak@linux.intel.com, will@kernel.org,
 james.clark@arm.com, mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 adrian.hunter@intel.com, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250106120156.227273-1-mark.barnett@arm.com>
 <20250106120156.227273-2-mark.barnett@arm.com>
 <20250121130154.GA416913@e132581.arm.com>
Content-Language: en-US
From: Mark Barnett <mark.barnett@arm.com>
In-Reply-To: <20250121130154.GA416913@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0022.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::7) To DB9PR08MB7584.eurprd08.prod.outlook.com
 (2603:10a6:10:308::6)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DB9PR08MB7584:EE_|DU0PR08MB8161:EE_|AMS0EPF000001AE:EE_|DB9PR08MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: b3efbaf2-7e7d-4f35-7dc1-08dd5db69fac
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?dDBXekxXY25hV0hSS2ZIbCt3aFJXSFlSbCtyY3dBcnlYMGhTVXlJODJKNUJO?=
 =?utf-8?B?TFRzM05rVHUxdXhpWldFeW5ibTBGM0FJcHFWRVB2M1dzdTRQNHMwUXdwV0Nq?=
 =?utf-8?B?b3o3dTRPYWtoNzVqZ1Y1OFhqWTNWWGd2TEVMUFQ4R3hWa2o2ZjNNY1hIcXR3?=
 =?utf-8?B?TENicDF3M3FvekxpQjkzU0doZWxxSzdua08wbXlkSE11eEZOT1lQejdISXZ0?=
 =?utf-8?B?RUc0WENMOTR4dHdSTUFPTHFxRmRCT1c4a2lNWm5CWW11eno5NFcvbERhclBz?=
 =?utf-8?B?M2p4MHJkS1JEcEtmR1p6TkJoTHJVNEJLbURTVWZ4MnhmSzZJSlpUbW4zakc3?=
 =?utf-8?B?a2o5Y1E0WENWZkkwT0h5cm83QUgrMlZYVkdhWjlodHpPNytBRlNQcjlqQ0pZ?=
 =?utf-8?B?dWh5Yjg1YWpaWTg4eStZNUlOKzZXSW9ybEJCRThBMS81YkE0YkdGeEhhVlBZ?=
 =?utf-8?B?NW85dHN4L3Eza2hlbERxVzBvelNtY1FwWDBZZklGM1lJdk1HY2dmZVdjeXdM?=
 =?utf-8?B?cFpvZXNTNjNaampFaFZJYWd1WjUwVXVIY1pVYUJTN2dqTEppeXQ0NVRXZE5q?=
 =?utf-8?B?VUNwcnE5OFhrZ25TbnRUMm9pWkc4K0ZkZzc5L0hYY28rbjVRZEt3KzNzR3BU?=
 =?utf-8?B?Nmg1OGF2bE5xOEJ4cFlDM2VFT1c0YXgxQmlRTngyVWp5dm1TdjFHSkIya2hL?=
 =?utf-8?B?M2xhTk9udVdzU2xnT2ZBanhrNWFhT2Y2U1I5STFtL1g4SThjVGd4WVZka2Y2?=
 =?utf-8?B?ZnIwU0srRFNERVVZWU4zQ2g3blN3eGo1ZHR4K2VNeXpEK3pianFCY1FoMUlz?=
 =?utf-8?B?bzlyaTFrUFJJNWt6S1ZSRmtJcXpENlRYSGg3RVR3dXpxRzVYdWU0VmhFNVhE?=
 =?utf-8?B?cmRiblplS0lHZGk3M1FqV0NqMmZHRUpqams0dWdwckZXMThwZVg0eXdkYjR2?=
 =?utf-8?B?QUpYbTdpVmVyZXRFM09XaEF0UEs5dEtnSGtabDZRenRlZFdCdGNUdmxORXky?=
 =?utf-8?B?RGovL0t3a3AxaUo1QlVzRExCenV4VjcrZHBjTVZIcURRNUpPd2syUUpMb0d2?=
 =?utf-8?B?aHg5ZndPOGJWMDAxUEFnZjRNQzJVY1lOOEFzUEhyYlZ0c1oyZDR2SFRWNFVy?=
 =?utf-8?B?QlhzZzk1VU1SZ3BnU3I2MWU5RzA4VjZwNytBTkg3d2xwd29UZWRGaWVjWHBL?=
 =?utf-8?B?VUZ2Tm1RRjdlQXRJMTRwVFF2dzRmNW1HMWtRSjUzeElmbkhHSkhWZStkNGN6?=
 =?utf-8?B?QkJIT2hMT2l2bWF3L3BXbkhYVHg3MVlLRWFsS1puTE54THNGL2owbm9CWVRU?=
 =?utf-8?B?RkRjQ01pTkdRU2lmZlhYdFo1UzFEYWNrWVJ4S2poL3NGNHVJWXRwTk1HTHNZ?=
 =?utf-8?B?L21UYlI1cm9oUlNvbnU5enB3amt3NUY0bzdWY1Z3MG43bWo5dzJ5Mk9KQk5a?=
 =?utf-8?B?dEdIbkZxSTQzeC9ZOU12VFhwWTlFNVlucW5KUU5MU3lKd3RGazBxdXh1Y2Ev?=
 =?utf-8?B?SXd6b01uUFNoN2tYMG5oMC90enhyS0FKM25uTkg2VUlwdGRHVC9rclF2elVx?=
 =?utf-8?B?UzZmUUpsNmlYQ3RVd0huQ0FWSzE2Yi9FZEV5RjFmRkRFSG1KclV0YTdKaHJZ?=
 =?utf-8?B?WElRanNOR2ZkZFVuRHU0VzlVcVJURGZSYWY4SExqaSs5NUVlNnJlYTkrenRQ?=
 =?utf-8?B?OUJ4dVFvQ2JFNDZHcXY1Y3dOaTVsZGZJeFJTWWxydFlmU2pBcURSeUVaTjla?=
 =?utf-8?B?eHZlY3c2ZlRmb0lhODVUdHBSc1lzcS9zRVQxdTF3bnJLNEZ2OWE2OFBMSDUr?=
 =?utf-8?B?V3RhZEg3N2RybDFXWUV3L2RnS09mVkhFNkpvUjRhaU11bExKZDM0bzRRSnNq?=
 =?utf-8?Q?Zl9B021KE9kJx?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7584.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8161
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:308::6];domain=DB9PR08MB7584.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e9f56739-f817-4b3c-198b-08dd5db69779
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|376014|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVFNSUc3a0lPQjZKdjZ0L2wzekQ0QmR2UW1zbjlkMHJ3eThEVS8vK2lDY2oz?=
 =?utf-8?B?RHd3STE0U0REbU4yQ09FdlAvWmZSeXRFaGo0YXp5RHR0RUNtTDgxWTlWbDB5?=
 =?utf-8?B?R3FGdVF2NlYvRmVqbkxUNS84RkFhaXZWaEx3a1hIUnNlemV3bXB6NHZhZnps?=
 =?utf-8?B?WGIxVU5NbVorQ1FnOWZ1UHFuTWd4eXVRQjRndy9vT0tjVEk0MDNWZHJ2RVZR?=
 =?utf-8?B?ay9keG51ZGgzQUg5aGlRc2NESmk1Y25FanJWd0pTcmR3amQ2M1VSMitCeVJ0?=
 =?utf-8?B?MEU1Qy9yRVRLOWxVdTZRTVpVYnkvd1Y2ODRvRjV3ZkFVc2NFUGZ4cTM3SVVP?=
 =?utf-8?B?YTcweU9uTlZienNUd1htSzFDcHlWd3h4YUNmMkhFeTgra1B0N2E4T0JGeDhJ?=
 =?utf-8?B?aENMVTJadEtzMmEzaUxMOTJmTUVIUWEyKzF4ckM0NFQvMHkveWlaNzJwZHdq?=
 =?utf-8?B?WmpnVjVlYzRFZFhSc2h0WGxxOFphSFJFWFdSQkZKbnNqQzNTdjdwUDV4Nzdv?=
 =?utf-8?B?S1dXdWprZU1kcHRXZ2w0bWdoSGtTOUVOYUgvbzVueTg1dHdlQzJOWTFyMFpH?=
 =?utf-8?B?VGNyU2NyWkV2aXVQd0svT1FzcHJCa3F5b1M1MmhUcTlvTTFtdXhSeUNnSW5P?=
 =?utf-8?B?V0wyOVA3T1ZmTGNxamtFVmZMOUNUWm1OUHcyaTlsRGtuaDA2RUkyWW9XQ0U2?=
 =?utf-8?B?Ym8rU1NJYkpuMUJxZm5DaVhkWHlaN3E2RHI1SGd1WGtCenp4UHR4OVRMTCtY?=
 =?utf-8?B?UkhqTlZPS2NiYTE4ZmticWhCZmhHME8wMFVyRDdlZ1FZUkZuU2hhUDk0S1d2?=
 =?utf-8?B?TjNNN2JUMzd6SGRKdmh3N0VVUCtXNHhzZEt4VG53d3BrQkNISlJCQk5OTUxP?=
 =?utf-8?B?OUI2NmJ1Q3VHMGkxY1ZpVXJoTzNpT1RzcjVKdGFHK2VTNDVBVWxhSmdTdE9N?=
 =?utf-8?B?TkJpTUF1M0NwQXRuR0dhVEgrRlpYZlBBaVNYb211dDJ1cEt3UzhVQ205YUc5?=
 =?utf-8?B?WUx4QW5HMlVyYmZOc05oNWhMS3hmYUFxVUtCamU4emV3ZTRRbFhYU21TU2JN?=
 =?utf-8?B?dU9qR1hYaGY3UHRQakVFVmJxaHhZa0hac1luNVMxUEtWQnRoKzB3WmJFbi9O?=
 =?utf-8?B?a0UwODIzRnZqL1daM1JDbmpXNW5IZGJCTDg4R2JmdWFPL3RlK2hpQlU5OVpp?=
 =?utf-8?B?NE1IWmo3YWw0ZU9sVkpVUEZyOUo3LzRmc2RKcjlWQ3pEenZYaE94b1dIZ3Nr?=
 =?utf-8?B?dDByc3hEOXJybHk0NGtQZ2JCQTdhWVdScUFaUkplbmZzenVNVUlYblI5Ky9O?=
 =?utf-8?B?b2xybmovYVJDR0RpcG9hbnBzV1d4ZTRtdWFUb2l4Y05sN3BKQmQvRHFoQzcr?=
 =?utf-8?B?bnM2RC9SV1BVZFZkUUFtL0FVT2VYZlNEcC8vd1lqaE1uRTh1NWFNcjVkRWxs?=
 =?utf-8?B?MGtNd0hjeENiZ3laMW4wdXZjeTVJQ3E5RThqN0I2QkZWTHg2OElUTGRSK0Zx?=
 =?utf-8?B?SWpFNnhha2hXRVBzZHR3TGhWeEFxcm8rekhwK1g5eTZDbHM2Yjg4MTd2a2pw?=
 =?utf-8?B?TkovWFZnOTlicGEvdjd4eDArTEZ4NVV3SWgzNlhObTdrZW5IWTZJZGY3TTJ4?=
 =?utf-8?B?czhhUVl3Tm1yUnFiUXdGK2lydm5vajIvc1RPcjQycTZZT0Foa3hIK1VCVUhw?=
 =?utf-8?B?R0NLZytINkJMR0J3V0xoaWs0d3JZN0xlaStYYnJ0NElFMHR5QlowNmxJQXRr?=
 =?utf-8?B?akE1SG93RHJ1VU9icjYvTzNucFcyWE9md3B2aVhvdWowcG1mOEFiVGc2Vysv?=
 =?utf-8?B?U2dZR1NPUnRXZ2JrWlYxbldBR2pQVFpiem82enl5ZytLQm9UZ0hxMnNyYTFm?=
 =?utf-8?B?VXNPanhTK2JEcElnVVV6bHF0ZTR2K3BuNHFOV2N5WTZSNDRaMUJpRWVhbThx?=
 =?utf-8?B?YnNxMXN6aTdhUW1mV3NnejU3cnIrRFErNnBzdE9QQld0ZVBFaHp0bmoxYmgr?=
 =?utf-8?Q?INgU8v2JEMfTMFVz+HwGtyuYsboYR8=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(376014)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 20:28:30.0166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3efbaf2-7e7d-4f35-7dc1-08dd5db69fac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_122840_580765_796A1F3D 
X-CRM114-Status: GOOD (  14.30  )
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

On 1/21/25 13:01, Leo Yan wrote:
>>   	local64_set(&hwc->period_left, hwc->sample_period);
>>   
>> +	if (attr->alt_sample_period) {
>> +		hwc->sample_period = attr->alt_sample_period;
>> +		hwc->using_alt_sample_period = true;
>> +	}
> 
> My understanding it sets a short sample window for the first period.
> Would it initialize the `hwc->period_left` with the updated sample
> period?
> 

It sets the long period first: hwc->period_left is used to program the 
PMU when setting up the event, and hwc->sample_period is queued up as 
the next period to switch to.

>> +
>> +	/*
>> +	 * alt_sample_period cannot be used with freq
>> +	 */
>> +	if (attr->freq && attr->alt_sample_period)
>> +		goto err_ns;
>> +
> 
> It is good to validate parameters first. So move the checking before
> the adjustment for the alt sample period.
> 

Ack. Done.

>>   	/*
>>   	 * We do not support PERF_SAMPLE_READ on inherited events unless
>>   	 * PERF_SAMPLE_TID is also selected, which allows inherited events to
>> @@ -12763,9 +12788,19 @@ SYSCALL_DEFINE5(perf_event_open,
>>   	if (attr.freq) {
>>   		if (attr.sample_freq > sysctl_perf_event_sample_rate)
>>   			return -EINVAL;
>> +		if (attr.alt_sample_period)
>> +			return -EINVAL;
>>   	} else {
>>   		if (attr.sample_period & (1ULL << 63))
>>   			return -EINVAL;
>> +		if (attr.alt_sample_period) {
>> +			if (!attr.sample_period)
>> +				return -EINVAL;
>> +			if (attr.alt_sample_period & (1ULL << 63))
>> +				return -EINVAL;
>> +			if (attr.alt_sample_period == attr.sample_period)
>> +				attr.alt_sample_period = 0;
> 
> In theory, the attr.alt_sample_period should be less than
> attr.sample_period, right?
> 

Added some validation for this.


