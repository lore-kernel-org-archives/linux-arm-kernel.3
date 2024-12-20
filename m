Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4727E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGEg0DHmPAaOkT2r9tTsw9TgZ82FrQRzJ4lSzrF/7nI=; b=qIuywgCUn48HJQt90jcq9qVoBO
	BrXEy2RfTxFhslIFRXMRc/ZfJx6CLviorF1bwWFm5trEd/tTpgFOHwCa1MguWMenkcQxQNG7aHPQi
	P2V1esqgrDvid0Q/iPjkORj8JuvNybqhRC4HtSLKRHRtzUPrDKxT6KpHSdc+INmtO7ELeQr42zwZG
	YcbtxgVGbOuQwRUr2jfdp2iA4dcRYXriHVAUpSmh2mBr4WYKFwee9WCtDaEtBDfxuvQdobNJ3+oM8
	HWhTx6+ZdCtJx/6cfh6yHKpUjaeXDrko/WnYwlNKr3pRFAz2R1qLUYEae0aEXJ4KDe9JZPRkeKNEN
	mjY1yhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOawK-00000004h0q-0LcW;
	Fri, 20 Dec 2024 11:13:04 +0000
Received: from mail-am6eur05on20630.outbound.protection.outlook.com ([2a01:111:f403:2612::630] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaP7-00000004c1w-0qbV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:38:46 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tCuDWjzz2cmUDPa4ywlB/VA0B9dO0xdddmSHKqb28K6nygEmjg4hu0//O18XwpKdl6Sq26LtbrATHPjLBTtp6KGQyKzGrpCoDjWoCDqnFBIxvpfwj8hnKMR40oZKsPlVG7F9OA/2McuLPM4DH3HeHd2XQJH0bdpclrIv7ipyyithWZpMjnGL2z9TOtOzEVIWkuAdFVVFheNgsiPeEzwy1QkVDOh7xt4DqrjW3fgTKjVej7V6nfm8Tv9XNKTTW7OJfipX8h2xjitDE6D1LnbLk7oK85Cu/YZ1apfRodqy5P0Ki1LcL4XhLjXIExsaghcMos7qBcNCeDMmQMexyRS0xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGEg0DHmPAaOkT2r9tTsw9TgZ82FrQRzJ4lSzrF/7nI=;
 b=Vn+UO8toyJLU+hBydUDm3rZtm2N+3/pWgwfJeA4WZVvI1wvFd16HvEmJV3lPAttQSr48wfUUtQzX+fSv+n6hi51FU8gMQzJSMg2CPAptUA9al8Eh+AroxbAZG6NR4xo7g4GQ3sWkRuWhV2O2UUx2aTd+bb+RdbVJtsJt6/yKFZFirLdZ1N8RyxVunPRQzaNliH6fgFRXQoNXvbrXwHGe3v/YKRKjJ9Gt0sis735PG0/GVOUM1SKd8idIOCcWSfLI6Pg14i/guF3fVqcgVBSesgzK5gpb/tBl+4VQZHd2UOGlf4o/zbKrHINe4KeWh4Cpk0TjyA+Z+H37Burln6MaNQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGEg0DHmPAaOkT2r9tTsw9TgZ82FrQRzJ4lSzrF/7nI=;
 b=ZaLWaSVXmppulisEcxxZfM5mnzzQ0jRvsPB7JotL16kWvxZqYwCyjn9LjG3mWKlZLpllbRFsdUsknroJtNSbdF30OH2sD+1SBozr6fa3lBdXxab9QHXN4XvEIP3Z3f5dR2yqdE4RcQx+MJjaZkD8RBtpfxxhVlzKF7nUTMUNP8I=
Received: from AM7PR03CA0009.eurprd03.prod.outlook.com (2603:10a6:20b:130::19)
 by AS2PR08MB8925.eurprd08.prod.outlook.com (2603:10a6:20b:5f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 10:38:38 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:130:cafe::d2) by AM7PR03CA0009.outlook.office365.com
 (2603:10a6:20b:130::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8272.16 via Frontend Transport; Fri,
 20 Dec 2024 10:38:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Fri, 20 Dec 2024 10:38:38 +0000
Received: ("Tessian outbound 8c86f99b1b13:v528"); Fri, 20 Dec 2024 10:38:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 293dd6c4f1467221
X-TessianGatewayMetadata: 3fk0UJQ9BpOOLy2C5BNCmsZcQSqZ83/RI9Zx79RxREsjHXMiF5PSohBr3duGY51SyMler9p+QlcCNJmwUEE7pQ9Sr2I5c94V6SZJl4s2kKJIPl0wptdLTlXw6Q/rkHGVQtM1ROuTQu9GZftozJQg6g==
X-CR-MTA-TID: 64aa7808
Received: from L238d6f546fb2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2BD85428-0954-42D9-B560-CCA40A59207E.1;
	Fri, 20 Dec 2024 10:38:30 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L238d6f546fb2.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 20 Dec 2024 10:38:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNcDl7/E44JyN7CmGWzx/oFgrIc+pD2Ko3/VsaDiORnlteDckGE+Yg1y6vaOTT4wUOvhykphpRVE4z7FMliYIMNKvWYKSqxdAOqmlhwYZz8rqhrFw3RjYIMxmemnGaBpoK5IrUsvZD1AOK6OnG8UL9EO1ckjtc+7uMeQ115q5OPeBNx4vl+cdpAOXUCycHz2oyVN2hugyRSXBSRH6VLABSQRtlMRyMge1rgI4g/3haTJ/lYkie4QLPv8r54jVqtTZ2lQiK0RgOWGMVq8EtxalQyKlh83MYxLzJ7medsJyygAWFPGofoRvgL1cHLatUfgoSLRkmnbtuy1ZdkylLNIPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGEg0DHmPAaOkT2r9tTsw9TgZ82FrQRzJ4lSzrF/7nI=;
 b=ZPNjWorxKSIRZ3sCZo0AVIbzyNsLtzkgU5qzx/0KRjc/UqgBWmCAsiU+qilj6nAD2tJW4KCrkagstBzq/Y9gS5yLE6fR6EwfcUVoXDxztD2VDmUCPNTwzC83uuchYJ+7bILTXV8LAvgd9rOal3aGk8lIH0f6r5CxhI5b1CX/tx2xK1fXNLNpd+wPCvvXRf0c19dsb3aC8U25fofphY1jN7VpWkuy84nClVPuQCVgIPcVxYNmyLDaCU75fc5YvqYP6NhBKTaRDNpzXbYLr4+iwoopEMILOpy4fvNb+SVBSe2bYE6m9LWIjIfH9HnsfBSHbckncnbdtJp+sO5JqwUevg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGEg0DHmPAaOkT2r9tTsw9TgZ82FrQRzJ4lSzrF/7nI=;
 b=ZaLWaSVXmppulisEcxxZfM5mnzzQ0jRvsPB7JotL16kWvxZqYwCyjn9LjG3mWKlZLpllbRFsdUsknroJtNSbdF30OH2sD+1SBozr6fa3lBdXxab9QHXN4XvEIP3Z3f5dR2yqdE4RcQx+MJjaZkD8RBtpfxxhVlzKF7nUTMUNP8I=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB9670.eurprd08.prod.outlook.com
 (2603:10a6:20b:616::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 10:38:29 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 10:38:29 +0000
Date: Fri, 20 Dec 2024 10:38:26 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: suzuki.poulose@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
	clrkwllms@kernel.org, rostedt@goodmis.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 0/9] coresight: change some driver' spinlock type to
 raw_spinlock_t
Message-ID: <Z2VJIh2+Z40bZi1e@e129823.arm.com>
References: <20241216115006.415861-1-yeoreum.yun@arm.com>
 <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VhxG_8R6j5uRCzOhLpy4ZmzyVvyW0+ryCcd4w7wqpZ2ew@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0084.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::17) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS8PR08MB9670:EE_|AMS0EPF000001B3:EE_|AS2PR08MB8925:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b86715a-3af4-41bb-92e0-08dd20e276ad
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Ilw3sHwLzit/55BN1iBINibWpm7QSUDVsyT2x0fOnk9K/2Gb+g+zKb6268jP?=
 =?us-ascii?Q?DssO2hfDRqd6HWDMwCcwIMzPpJr84qYPlhBWBzlYuY49M1hS5uvywTwYixcK?=
 =?us-ascii?Q?g7Rg4nmYQcK1j3bxO0BnBcYTnS2JRdomW3OeIzL5t+zi15+9i3UcgXF8urAm?=
 =?us-ascii?Q?9QYoOowC+JYJ7nyFdNsapvJk2ZhuIA3LdfIWhzd5llQ/ghkr4dV4NvZCk/xb?=
 =?us-ascii?Q?eAzlv1D1cc3AmtJF/b2bjQQGkzTVIhopsijaFQnB4ScJcBcH2h8t3yQeJVvk?=
 =?us-ascii?Q?SImiPIQSL2//wbioJh/zcu5Bxqizx0+iUW8jjuDh9I5O1DwWMAx5hXY/p191?=
 =?us-ascii?Q?di+f39XBlbE5Ezawr+wam9k+F8ffaM4SeylLdc0+MvzaH6zTlEyTIFNcrprN?=
 =?us-ascii?Q?hgP+n7m8xS8SF5lUEvYpwJ5w9Wb3yFW7iM1Vh7HBBhYjomABcBJvRclWGOVV?=
 =?us-ascii?Q?BniMCc4YaT0nhOl8OqgxULXwRKXjg597eGJlewqH5sjc0S6KhGvXM47chzXE?=
 =?us-ascii?Q?hwsL/DT3f5XrRe4Q99vjyTqg7DDU1fxz6EfL/TsbrGJo7LQ0ylFZVqn8x86u?=
 =?us-ascii?Q?UJXhRqu/Tq21Kfe8fkdvByP94T39YFjOgDXpg+DOWcA+4CEx6WkN6IOC8ux2?=
 =?us-ascii?Q?Qj4wpvfWn+hgO58faySeD3xHyD2gYKfp0ox6UosT9bX69MTP0g8otkmkHUX2?=
 =?us-ascii?Q?nz6mJNynoTbuadQUaOj15/IPD5xFJgpeRMtpRil7O5arEFj8L4eReokjl6u0?=
 =?us-ascii?Q?i46L2e+1pEtPHnaB6kN0OVSZFiW5QirZM1gIZLfiPXSZBOzAgIyczBcJVsXD?=
 =?us-ascii?Q?p8ePTNaKeXFO04Vdlj/0MsAf9I6UbFGlpDnzmsnc7c9CPLT7WimGWewTmU2M?=
 =?us-ascii?Q?jSzo3RNMbRhW6Di78bESo18UoY1RBdUtjm95bL3KBRNaC0H6O9EG8nu5ae5p?=
 =?us-ascii?Q?6TAE6Z29luHFasWPb2SjBqKDRMxCniXhCv7HRmXZbAfSz5RQ3snbJNhrzheC?=
 =?us-ascii?Q?/EETxJaBdVGyHtVVVktYKLkA2Y+WP9hBPnQcbPAcCth2lPEe/1SqkTVoELSr?=
 =?us-ascii?Q?nZ2j9SZglmFDlKgSb0EF796P+nKAQAZbFHq6bLMdC7nzxB0Ic8vt7VPImkef?=
 =?us-ascii?Q?EgJJXTHbOpuncFMS6PG7R9va5k8SevsBlk+snutUMZtl6/WSt9O5elLj7YwO?=
 =?us-ascii?Q?mfSjcfURI6RxxtBaEWdu9K4i3Zm3kkcLzqqQawbZ40x6D8rjEPqsUdIfmTCP?=
 =?us-ascii?Q?7ZSRI2YqN08Rvaw7rF53PZwf6kTF0JruCv2rruByq6/DWO7cRuGqJxbuw/F5?=
 =?us-ascii?Q?lW07FEZS1IEff6Lpx1+6CbG7O4YEjHlCuGd/unO+b0I64BjAw5/+IwQ9A4SH?=
 =?us-ascii?Q?gPleG3GIAhsvuGhhcVQj5CffWlHW?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bf5bc016-cbb6-4836-d73a-08dd20e27136
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AvHDuStkJAZD771/0JYtjlBfbb4qa4ELI3XhhAAG0113hUUJV4aejEvDGF7l?=
 =?us-ascii?Q?9CwdyLtEEOFGYaEVA8sYLkjQo/59dDSWioWNEWRkUuw0Nx/VMix/3VhRxtPn?=
 =?us-ascii?Q?6FF4lKD2Xe5A3gIrjYyhovdKS6aTQOYm8wu0tiGVMNjIz2+nsko/zeMCcXAB?=
 =?us-ascii?Q?Hvw7IGuayVaHqhDcftdTJdZs2qVtBUjpaqpgvG8S69jsJlxc97N/NgdDDa+J?=
 =?us-ascii?Q?hB2gsF5CfLWXIonGthuOqwzVlouPkWbKX6Q4yccJ9rd8b1nIJwPcjli7hJQV?=
 =?us-ascii?Q?Jxmz7sq2bgoww7a2oq0rAXV35pq9FQ7NZfJAc+KQFRiv6Z/2nuGT6sa9FtAm?=
 =?us-ascii?Q?CGaBVsY9EZQUcKmIhQuNtc7TJ/WpsO+ZqK2oRpUU74vOKSEPn3uW4r/JP+bZ?=
 =?us-ascii?Q?dFvqV+mKeCdlMcGLbsYjfjZQHE2BXny6PkYpVs1ntFBPmtNInOMoYI/oR4rD?=
 =?us-ascii?Q?RFr4pNjfH4L71HeOT+owWwqYu8MgUdQGwEiLUibBeSTDtcEq+aCQgir3Jhta?=
 =?us-ascii?Q?QhBvAE1Fg8ODkdy73W22xFDS4NnvFePp1qcXDItriGj8NFNnRwpOFAQsXzaR?=
 =?us-ascii?Q?N62+Dj0h3fVs1QPjeVNB96IwGZ2JD8z1sGtO0Z8OQq9tlg/Ub26EV/EUKG7k?=
 =?us-ascii?Q?/xwEa04Esf64oKw1rIYpGplHjS5+zq7KGXSNhJCNYeE7/cEC7ZPUCXMakXB+?=
 =?us-ascii?Q?4yAas9633Rl8dbfxaGrEqG7zx7fCHg9GjiMj5qKMZ04GlK0/EOrsv/UIhPse?=
 =?us-ascii?Q?V21OWnh5B3Inwl2h80xt8N28WhDQkR7X1t5Zp/E0xhKdyTCOLzvyEfSqmE4f?=
 =?us-ascii?Q?mxiCnzrOYCStARBs8MZM1zWzfXSBHUu6Dopbn7MC8OmUdlA92U+K+76rFOWY?=
 =?us-ascii?Q?qR+Q+YIi36HEnQTUXAZTph1biRU/0fRBcVTRYRhuhWUmAhWpLE7mZ32U5miF?=
 =?us-ascii?Q?AZkMb/qjfjzjrPtdK+Vb7IY9JIuzMld80BKvVi/E2wlJPyDE/CFT9pSU7NiM?=
 =?us-ascii?Q?IkFvi1A7zG7XeXATndinlJva9wbxv+Wo9CG97mgqj4XdA2sAfBlSbuzaO+OD?=
 =?us-ascii?Q?k4eBTQDjDRXNL9urfssFHXfChJRJ5Yn8KuEtxb3Y3QXxZ306LW8x8oPXC02T?=
 =?us-ascii?Q?5aMBePBSLjbRxPDg4JB5MUhk3cOfZyLgChCDfrGaaYe7BhXXI4XsbuwmE6pG?=
 =?us-ascii?Q?SBciqvNwZYczJW5cYvhZwO0GvshYf7GkGqCAdUIxW50jaZvl7ryffnniWiq+?=
 =?us-ascii?Q?rWwVHzoVJGGP0Nu/JeEqNf9A7EOM1vzEpiQMhLOhw8eHoFUl887S5Rl8FwME?=
 =?us-ascii?Q?Cm77aPYprB+0UHFG7EQfUzrlUPZZCLdosN/adFFtO4BA2mqameI6y8JEfen+?=
 =?us-ascii?Q?tOXP7KuWvVQG2WrhrDGSfvEMqn8qFKNVhORHsEOUaNbfisSdn3vOPkz1hGkv?=
 =?us-ascii?Q?+7sHiiR2519/C9dYG3odAiK+lFp2sUqhaDE+B74/2y1FU9EoN1UznjP3eifB?=
 =?us-ascii?Q?rFfEeqND9MnW3oA=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 10:38:38.1794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b86715a-3af4-41bb-92e0-08dd20e276ad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_023845_243303_372562DD 
X-CRM114-Status: GOOD (  11.00  )
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

Hi Mike.

> Notably missing is the same changes for the etm3x driver. The ETMv3.x
> and PTM1.x are supported by this driver, and these trace source
> variants are also supported in perf in the cs_etm.c code.

But I wonder etmv3 needs to change. Because its spinlock is used only
via sysfs enable/disable path.
So, I think it doesn't need to change the lock type.

> STM is also missing, though this is not directly enabled via perf -
> but could perhaps run concurrently as it can be a target output for
> ftrace.

Actually, I couldn't find out the path where
the STM's lock could be grabbed under other raw_spin_lock (including csdev)
If you don't mind would you let me the code path please?

Thanks
> --
> Mike Leach
> Principal Engineer, ARM Ltd.
> Manchester Design Centre. UK

