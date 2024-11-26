Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC61D3B997
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H4uStQZEEj3aGYZNTjspyIRkGIR1wzDZsBcig0GvH4=; b=e7t3aLKy3bATM+lOZzHvZD/pNX
	6Ig6k5Tz1Zh+1Fhu8K8oF/gWjucWTJKIDCckxdc6EJCe6M8S7bi3YoyfcVJZnCrtOzEq94rSpDTWO
	bnNKVk/MokDDT9R8FE4tzRvLWJZSe61T4dLJrtkAFdTthOodjiRaZStM3iMJgyP75Diq4XVZAGDSz
	kWZLygbxFHaBSe1Y0FF3BrBQ0wvRkE6GaSCEUCLn1oqGtR+taRvVy8kAoPEzspPSCKTPT3Fbb6k/4
	su84/1D1CadabbwhsOeQs6l+/8C7YuT0RHgxzt25MfbGjSF3h/dyVvkv2DaUWmG9q8gKwR8NzwGJp
	1AbgDkgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwkv-0000000AteY-3LZ7;
	Tue, 26 Nov 2024 14:41:33 +0000
Received: from mail-vi1eur05on2060a.outbound.protection.outlook.com ([2a01:111:f403:2613::60a] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwjx-0000000AtTe-0A5k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 14:40:34 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wYdLmeHhX7vcF/3yxViCI8hC1HI1/mRaPxOYXQFwIOFjgG4qRKqygWtLNcxd8U7+NfzDnq8oWMg79lcyKFZCWhLmW5iIO+DmSuN5TegKNU1pGgf9zAcOYWiUYjQMWcwRKeWvLpZAZlbddbWKFXnJm1io9znfQpsR0dzNlJqMUUNSO7w9Q8O5ufRdwWvjX60ADgoIJ+FO1NEzxjYt9fjOPBGydkCNGWMFSXTcM5C7q2oQKYs2CHU0gE4emSCHC1AAz8Y6T58rq478VYlcHcNFZ3zmjJWH9fHOR7uPHK5/nF6sZpCG5Rwf9vbLBsAJGmd3OOdlDNR3Cya0PUeehN0Smg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H4uStQZEEj3aGYZNTjspyIRkGIR1wzDZsBcig0GvH4=;
 b=chHB8toV2SnHJF+GgaVYJH51GxqJ6iBrRSvzkO5VioNy7aEoo43h7ob2nrTM0g99qmw/BitTxveq30YlynH7DjCBWTkA+YDuP9+bAP9BfbzA6njxdCw3AOG283iXukxurGOBonvQ4dj/LqJO2SCcIpYeQw0bNlZ2yw9jL++yfwRcDOKh1b+WTL1eu7IYAbLaE/t++uSawLJfV+7MHCIxIfu6IwCg8OFHnkWgFnTieUtjvCGuq88qujCYx7nCs/Zn9I/QcPH+RX/cZhCvUOAIyTzoiXIxAnbYHecYaZPjJfI8svwj6B+mlQqz4rv3iGGU+Gwb11afx6H/4iDwZ2b4Bw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H4uStQZEEj3aGYZNTjspyIRkGIR1wzDZsBcig0GvH4=;
 b=D/tKMqCJkwMYZ4EV/amVmvnDIg4/vSqNTZI4zeUff86iJJELW3j3aKK/qJBZTrmmd77MNuCUu9SZuwQPm+2UV6Euq/si62pHZ+ydCv/wZpEEDJUoeHfxADIT7UhiGUyvWYTw3lxDsrV9QLpv544pVqIpHl+QpVSiLDRv7ogVexc=
Received: from AS9PR06CA0148.eurprd06.prod.outlook.com (2603:10a6:20b:467::11)
 by DB9PR08MB6715.eurprd08.prod.outlook.com (2603:10a6:10:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.12; Tue, 26 Nov
 2024 14:40:25 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:467:cafe::4) by AS9PR06CA0148.outlook.office365.com
 (2603:10a6:20b:467::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 14:40:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Tue, 26 Nov 2024 14:40:25 +0000
Received: ("Tessian outbound 75f654e2c9bc:v514"); Tue, 26 Nov 2024 14:40:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b7b7430d2cfe8150
X-TessianGatewayMetadata: QkqKlP/6h+MxWyIk5Fiy9fMEWPkCVm23fcvCn98eRGgfWL1NT4yL/VkIyitWhy6/DEcFfhBI0f9cBzvoa+f0gvCIJTf3R9m5NkoHzRHbg2duAhKQDX0H28Bh4aAQYif/wqsWIpv52Oje/wTfW1/TfIIIf2ekDlAOEnOEY0kg55o=
X-CR-MTA-TID: 64aa7808
Received: from L8f92c8bca1c5.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4FED5748-31FD-4CE7-A4D4-3E5A9EFD5714.1;
	Tue, 26 Nov 2024 14:40:14 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L8f92c8bca1c5.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 26 Nov 2024 14:40:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBd6O/HxRhgGSs5rpJbhWu1yv75b9HPLH4JaE3j699Wfaz0breQWWvIIKj07XpwAq1tljxXxUngpNRJDA6+a+EAlktWB7IFFBPbWY6DPpxtwVAaRSEDICQwQ9QCN3Z6AX9t92oxbx9t/cEhFOENXTch4wBhgLk6AcH8TjvPvpJtdH1S3bJy3IOMiNTyOv6oxzrVhX50g14y+g94W65YzRfK+V8OzbSPrhkNXjUi4vjWNM8vxfLCvoIOFZOs8Qjg2CIXWAooPcMM1jlP7qK+rWnSzWvXEK436NH3S554OqnIKNKjo4uo36b00x0CTtZf6kfWNLnugo6VDUK8h4G42yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7H4uStQZEEj3aGYZNTjspyIRkGIR1wzDZsBcig0GvH4=;
 b=vXCd8yOmcmDFzqNkyuGIlGMMtb4d1QXvoTox3Jzm96pXfpFcy17tP5GlPosGakzNVfZKWawLbLswhvbb8vemNAINTysSPdT7wcxAvDi5uxJjYVDIew9J6Yg0m98ZHY5a554xvRxqHezUtIiSt93YO7PsUuxhw4WStS8+4M2jXb9h+aDV41I9vXHuXNJDM90ArBsQXRn0RVmtIBhzD/GDC8LUmx4SPVcn+HeoxekES5QJs7zU4tf1EclRiZWJHJGl7ay//JN/qOfnB2ZFp9cQQDabA9Dq6ahwmlF1m+BSAGeEmAMSLIkfxCJFkKU4TcPCUXsrLJGExSU7aWE2avCMQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7H4uStQZEEj3aGYZNTjspyIRkGIR1wzDZsBcig0GvH4=;
 b=D/tKMqCJkwMYZ4EV/amVmvnDIg4/vSqNTZI4zeUff86iJJELW3j3aKK/qJBZTrmmd77MNuCUu9SZuwQPm+2UV6Euq/si62pHZ+ydCv/wZpEEDJUoeHfxADIT7UhiGUyvWYTw3lxDsrV9QLpv544pVqIpHl+QpVSiLDRv7ogVexc=
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by GV2PR08MB8169.eurprd08.prod.outlook.com (2603:10a6:150:78::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 14:40:09 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 14:40:08 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mark Rutland <Mark.Rutland@arm.com>
CC: Andre Przywara <Andre.Przywara@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [boot-wrapper v4 4/4] aarch64: Start Xen on Armv8-R at EL2
Thread-Topic: [boot-wrapper v4 4/4] aarch64: Start Xen on Armv8-R at EL2
Thread-Index: AQHbP/qHvjU3U7EkyUGfH+vj3m0O8bLJohQA
Date: Tue, 26 Nov 2024 14:40:08 +0000
Message-ID: <3C2D75A2-1765-4353-95E3-E8AF21EF66A1@arm.com>
References: <20241017095520.939464-1-luca.fancellu@arm.com>
 <20241017095520.939464-5-luca.fancellu@arm.com> <Z0W35oFzkdOaahsv@J2N7QTR9R3>
In-Reply-To: <Z0W35oFzkdOaahsv@J2N7QTR9R3>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DBAPR08MB5798:EE_|GV2PR08MB8169:EE_|AM3PEPF0000A795:EE_|DB9PR08MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: d11e3fb2-13be-4e78-85eb-08dd0e2843d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?O4kLLiOR+2Gdz0cS9XJFnsP0X66QjeU4fQqGSyzXJzGFekghs7ciFTH5qkiw?=
 =?us-ascii?Q?W7UwwdUaELEJhJDdUEVS+zYJ7mPdU2k85qoYcGkrqnioi0QRzLqzEQezBY/N?=
 =?us-ascii?Q?SM6w/QKC07sTSXGy3pNhldkuf16MQ50Z2vvNx9coxlHJII7bZ7NQAZj6m7D3?=
 =?us-ascii?Q?mHuFaV+e/VRErF/KPAP9lLIKbE41TEGlxprs06r/DPonNs3bm+FKd0jJC19a?=
 =?us-ascii?Q?dTGsIWfCDpf7xmv4meq+2pRjXBtSGej+a4tb3KPTHooNovCCvpIk66sOANWV?=
 =?us-ascii?Q?VVQ7rq1pJLApd7NdPx9o/3kGYdRrjXadVQTpj0Jt4eNqJT3DCs5fhC+zCUvs?=
 =?us-ascii?Q?+jYzN+jqc68Eiu6lK+ycJCNnPcdJuOCGaywgDv5XFueEYYOqHGsjGeDONSg4?=
 =?us-ascii?Q?aa+EZJZ6y/KS1JBs1hwKCH/p6SEX+zLPNTmfkt2tQ8yzltMeeg9U8NQWimtC?=
 =?us-ascii?Q?Rv1lProbdBTD9l7pRtam46dy4DwqkFN+ckF0ulaODSDPr15FPNDGsGFQNRpx?=
 =?us-ascii?Q?mRioqoVD7HHoNAKOEqAXyWA8gTIWO4EqovNowroqqpGtzqng19g/IPz4MaNh?=
 =?us-ascii?Q?IyCTg6ewsmm/4fVcRl61KI/EmIBT2sJ9O4emXAbDLmkm3LcmPPQSSn+aX3in?=
 =?us-ascii?Q?Q9jR5Y8GmVbJMZnhLhWRNz6mQO2DlK3XYqBEIMRNUbaxkH2MMpBPZZ2Vd/nE?=
 =?us-ascii?Q?Om0dtN9a9zbo35aJdfKTUD/nJZKsjUkvzoAB5f8K990c+0yEuhDHYyCQxdZ+?=
 =?us-ascii?Q?It9whGkK93HNj6xI++z9LzjJdJqxnFKxr7u+frDZw+46zoAmNy81CClznWg3?=
 =?us-ascii?Q?Jxu4/EkUU1E7pD3NWQghxUZQcGy3YqomrCFhoRsiRQDeJc5mr/treOkwFrRV?=
 =?us-ascii?Q?JcsfJbj0KuHcXZNQErqaMCnS6+zTmVE6m9onwcQgT8wXcWpDpyKgP2dyk2Yp?=
 =?us-ascii?Q?UwxcO8qTt5J1aboaXvrTYGwy5OF83TI7QHjlvFVh6OldNHCpm8zqFHpGZM6y?=
 =?us-ascii?Q?XScehajbUadsc0xo9RUD6MIuyMk9iw/0GMuqOHZqecgwFRIX97QsKA4BUJ6j?=
 =?us-ascii?Q?5xeFSIVLZRPjICN077PFXotVAiRGcEDWlOEbOSkXfoVzfkelj1l56P23lPyZ?=
 =?us-ascii?Q?xhOQgxk27fNkD06hnYmrKXGjy7w4P4OmIEIZeoN2LsyVmRtbhqfvrjLmqKR/?=
 =?us-ascii?Q?DyEMPKfGFXkFt0C6AiYQgDjoF6m+ykCUjYcpK620g6OIChTG0XJPhWGgUe+B?=
 =?us-ascii?Q?v0F9Rd7RNnLwT8bXa2anVUUnzOAlnqMWhBaOruXpvYC9GY/J9pdXBo8buhgD?=
 =?us-ascii?Q?dfoZMRf71APIwuPrIJvwNhGFZ6FgzZprEixFjLTcxzihnRDuS/RccjetIKmJ?=
 =?us-ascii?Q?XUePaMGlmp5jOHdoAwnUGd+fihe2htxZqeApZUaAv/InG0kBDA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5B592854D43C6C4D9C281D7EB209BBEE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8169
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 75e6ee46-6c7c-408e-f92a-08dd0e2839d8
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|35042699022|376014|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hIJuiGzndfLhsLnZwJu8+orp7qB3te2DiEf7HhfWn100rQMmPSFF0xOinVVl?=
 =?us-ascii?Q?Q7FNfxLvZ12QxmfC2aDi6GL0KUCrtpNz2fdcT5NfCBtBa2WjZIVgj1VP9q1w?=
 =?us-ascii?Q?cKh/+oU97GPQth11WG0f+1L78cJIDZJgulvINt8J6CQPmVTlhwtZmPDDqAGx?=
 =?us-ascii?Q?XHIMUNTsIPFzaTj2YYQF9XM9cjlK+QSs911kQ5OGwznpRrZ4zZRJznDIYZf5?=
 =?us-ascii?Q?+Po9V967oxsTVx+JUDXQ419ShHkc4VYJk1ybpFPp2TOj6CFDv15QTD/lMnvF?=
 =?us-ascii?Q?lmSS2kN8BWx286y4/SkigpG2cmhPkcuekRWw7PxXoS22uyNoFmzCX4/9oA0w?=
 =?us-ascii?Q?DzhXJfJvsEurwwd8vXfQw8cHZwGSgyRXbLbNrmKWtP+MMce0RpxDJFarqj9G?=
 =?us-ascii?Q?M9CMBK5eHPaqz43tjjH5Xeqq/ZUC4JJA4rWjA1Ei69KS13VONJhcmDRCR97S?=
 =?us-ascii?Q?mCHcrvT+OZZA/98fcKYzrFyP2wSJ3vUjzVdUqXrEWUdPyMa8iQw7m3L8eioL?=
 =?us-ascii?Q?5JrDl8JHkXUAQ+y5QRpUokQNKNgETIDfcsUN9iy6UmWcmKAY8nWSC1bE0ipQ?=
 =?us-ascii?Q?AxFs4iYUTjsoca7xARpmcBhokQIF6TAp5+THvRe6kq0Xv4DfPngSjXkhJ9VP?=
 =?us-ascii?Q?4aEVC1XQmVUjp/NMOJyiodbpSmF57cpg7Q14BRe1YJH/TTbFlX7XoalOFbdF?=
 =?us-ascii?Q?RPWx1M0LrznUd35exKK67VrYrmBw0Gsr3jfM2KeivL/eQEfvDhC1EzaCCik+?=
 =?us-ascii?Q?1latSY6LHSWv8H/vFwFq3SZfbbQXKxqFfDKsXV1OXgcOON/xD6jIBm//ykx7?=
 =?us-ascii?Q?H2CPREA6ZZ1f3OfJn62yBmtAhJwcesqCbs0VtnIqiGWg0XESSOKm63AAmnNK?=
 =?us-ascii?Q?D5uw7tzNqaDgmTd2fBSe95ngfS8Khn8lBxdq5U4+pAoxO/AVUqXwHkE0F8nI?=
 =?us-ascii?Q?3NWmzwYwiGIhQlH6Xvnwdt9P+DUHpzS3WcJKtC4H3fcnxwddl/+27+3+q41o?=
 =?us-ascii?Q?FLIjsIC5a3iKaDPSQdP8ODCqYcISHKZPdBDxML4jaxZWCaTEfo8h2BEN/V5T?=
 =?us-ascii?Q?88HsP6uRjRoqUmvOdRUTFdxhLMa7awRPvCPKlA2b05Lc9a4HaK1nDWp4/31B?=
 =?us-ascii?Q?WLtYJU0uIv95DqhdbqOHaOycgKZ/wKqPLsCY9bOnAcPWEkoCOhkZpcucwneR?=
 =?us-ascii?Q?h27un41FsLMRKJXpliXa44BqVAAFHNQRWHNAlgMgtafWT6hAliAvoR1FAMqA?=
 =?us-ascii?Q?O9ydrVgRvyONM8Mb12mrLwT84dZ3kPGLIKgMaZpyiO9MDLSYip+rIeOhIPFX?=
 =?us-ascii?Q?8qHfGUDuNDaov/qRxL01juPTWB5aIuFWPgtvOL96HXF6E1I3n86S+tQ8L0+O?=
 =?us-ascii?Q?RBpDgZ3GMIY6fjQcH5RIpTO/ExOb/SC6wm0FtfP0dUmu0WLB/0GGsDZN4QaR?=
 =?us-ascii?Q?D1LJqzez1zTeQK+iRxGBLCD0ViZNtBqR?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 14:40:25.5557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d11e3fb2-13be-4e78-85eb-08dd0e2843d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_064033_241080_3CF1CEB8 
X-CRM114-Status: GOOD (  17.81  )
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

Hi Mark,

> On 26 Nov 2024, at 11:58, Mark Rutland <mark.rutland@arm.com> wrote:
>=20
> On Thu, Oct 17, 2024 at 10:55:20AM +0100, Luca Fancellu wrote:
>> When bootwrapper is compiled with Xen support and it is started
>> at EL2 on Armv8-R AArch64, keep the current EL and jump to the
>> Xen image using the SPSR_KERNEL as spsr_el2 value.
>=20
> What's the plan for booting Xen? i.e. is that using spin-table or PSCI?
>=20
> I'm hesitant to expose PSCI booting to EL2 on ARMv8-R, because PSCI
> doesn't really support ARMv8-R (the spec says nothing about it, and all
> we're doing is providing the illusion of ARMv8-A to Linux), and Xen
> would have to override the vectors anyway, so it doesn't really make
> sense.
>=20
> Given the latter part I'm assuming you only care about spin-table for
> Xen, which is less concerning. I think we should make that more explicit
> in the config options and forbid the combination of ARMv8-R + PSCI +
> Xen.

Yes, I only care about spin-table at the moment, would this diff on top of =
this
patch be ok for you in order to enforce that?

diff --git a/configure.ac b/configure.ac
index a433c89bd2ae..a16bc25508f3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -115,6 +115,11 @@ AS_IF([test "x$USE_PSCI" !=3D "xyes" -a "x$KERNEL_ES" =
=3D "x32"],
        [AC_MSG_ERROR([With an AArch32 kernel, boot method must be PSCI.])]
 )
=20
+# Don't allow PSCI + Xen + aarch64-r
+AS_IF([test "x$USE_PSCI" =3D "xyes" -a "x$USE_ARCH" =3D "xaarch64-r" -a "x=
$X_IMAGE" !=3D "x"],
+       [AC_MSG_ERROR([With aarch64-r and Xen, PSCI must be disabled.])]
+)
+
 # Allow a user to pass --with-initrd
 AC_ARG_WITH([initrd],
        AS_HELP_STRING([--with-initrd], [embed an initrd in the kernel imag=
e]),

Cheers,
Luca=

