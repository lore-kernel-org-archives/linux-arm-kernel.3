Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90010D58D74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 18:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IX1YRl27HA9TAGWRseSqFk+YAz+W3EWG3+oJXUWwiXo=; b=uKHHhRK2JzPPcD6AQnpPRN2yyI
	r7xWunMJE7n7+3lxpvH5QDiJHS4HXqX9ueGhWNN7euyO1wiIfzr0YQLFATu4JPXwLyIT0GMMXMd/A
	brEThGJifiW9aOTBAXdB/SSduFE1caVIxpxsLjhLsgk5VwoAHQ4CXRqHMOnzQTz4DkFwR3HItF5Va
	APksEFU2H20TbjzIpes/eXUsapSsfUcspjmLa4S9eUMD0pm6Xe5G84dwQf//wxMZ1O4IbbDMgyBtq
	MjiLP+/eTkSLZMryYo7RTINTcCbuTF3qwoqV1Jpvp5tbraYjbXjoQagv5Qfv0qtQZ7Uk0z7bI1/Dt
	FCbYOxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdOG-00000008oop-31ku;
	Mon, 25 Nov 2024 18:00:53 +0000
Received: from mail-db5eur02on20626.outbound.protection.outlook.com ([2a01:111:f403:2608::626] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFdNG-00000008oTm-3fCS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 17:59:53 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rIrtkbgjbu00cd3BMIy1nFMbpkHgizo1iGrEEPMSlmNsE02LgwxljNYpwFPJeHqGj6GmEiHDouf1H3Uz/eA+w1gFrGDskoImPeVzwqNNtoj2gLxQa0ZWkGNPFfZraZ8+bGVR9ma5rEyqg2jlbF8HbblwtNLP9W9mfZT4iUL5OAiRtcno0FKYUKpyhOMiftSlTQGXE8LrmNsZy2SAsIID1jjIvLJciRxeTFvlgwdKByEABQXPWkHWiY9GM8eQSFLiWJC90WMoJFNJKb6dG31+Haweaqc8XLSVbztAh/tdoamnA7JXjmuQrrwfsU4jYerW/kXG7Nz4nzgyeAQ7EA1cPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX1YRl27HA9TAGWRseSqFk+YAz+W3EWG3+oJXUWwiXo=;
 b=gw08o/Bzc9sUi115BkREMKBIM385e//1En/kBrw6CDv6kpip5htAKBzLCxarzJAjis/mo6z9xmWrOjn7+7cCZ7kfVdLWmnAcR9hXqFxL4e4LmbQ//E2XGVkPv3xZIW6P+D/FooiMt2GNURI2y83GQq8EO6uWiaHeFT9Gutcy0O3sdtWve0yVEKJx4j9Wi9ox6FBzzOSmOu4j2r4sCmBFOwitPzpRkHTfJQLt5w+GP36yrK7hSui5TKTDUm6C7xcMOCiSL7d2q26l1wsV04Ri0yg7ZjCro6CbA/aW7DonH4Fk+Xk89cnSbB3eH6LyZjiwu+lh/6s2QGJzjYcn9NkGSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX1YRl27HA9TAGWRseSqFk+YAz+W3EWG3+oJXUWwiXo=;
 b=rYAZmfN0oXTQKqhG8z4F1phwE4sCQCA/uK8o9MeYP4yJCwHrO1CAB0yz27d7aCLh87UpKDCa7cq7ngz6E8JwLpcudUe1SM4zrysIGKmoNfJjD7OHxjawsG/KIZUnb1lhqBCaBqVTvQbNMosJB2piCisezu9Z0h+inrCwBTTYgwM=
Received: from DU2P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::27)
 by AS8PR08MB5991.eurprd08.prod.outlook.com (2603:10a6:20b:29f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 17:59:44 +0000
Received: from DB1PEPF0003922F.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::22) by DU2P251CA0024.outlook.office365.com
 (2603:10a6:10:230::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Mon,
 25 Nov 2024 17:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922F.mail.protection.outlook.com (10.167.8.102) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Mon, 25 Nov 2024 17:59:44 +0000
Received: ("Tessian outbound a09d3701ea63:v490"); Mon, 25 Nov 2024 17:59:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f1a39ea5cc6cdcb2
X-TessianGatewayMetadata: QD21NpZ33VEjVC7ckO4TP+iRUlPtTfLAofaMR4frFdpd3SS+41PDnDzIM+OoRAz1h2ql7PGcO+X6GWx6IqAfIKG+bLzecpGO4M5a23mVQ9JOCcLV6dr+GPk6Ff7jf4WSSeOdPQicjGVz3Rim+uyzoQ==
X-CR-MTA-TID: 64aa7808
Received: from Ld65a3acf902f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 066076E8-058D-4EE1-B4F7-9F7794C4AF39.1;
	Mon, 25 Nov 2024 17:59:37 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld65a3acf902f.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 25 Nov 2024 17:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ui7ZONCW419R4OhHMPWU5t/F1F9gvnWjj6ppuPt5zZFhOeMVoaj9f2MgFZpUsh2XyR46P8JXAjjbCUN6Jk/7IqUk7ieA479lGF/BVKmzGQdHxas4QJpRP0TIuAEJhG5yYuEtBoKWtfEBXtiVr6FAXgTD7JtJ6IrKOaogpGiX5sHXYuAXwsGZkgcyS0qHuJV9FJAFkUg3k9CLnMq4IOIBFoG2DXKVtuYO0Ab2jjpTZ1FZxdn/H+aWvu1kUr+vtBzc/7LTKsxo0hcKIckbM6lfoD0u3s3CAOxtc7Ws4apVxVJJP+16jXQS5EGJiZiNL4scNdBZ67yd/Ch1F1ciYeS4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IX1YRl27HA9TAGWRseSqFk+YAz+W3EWG3+oJXUWwiXo=;
 b=VljsxbYBfi/YK5xg3BP/o10rCX2baPY6Yv4DGIWVp00X//I6UXMJXo+Xo2KIwW9dZC6y/Z9P7/VsGoOXOPCajOp6aYYosBO/PlkyxtFY47Rf8OYSvLwn5mn6HAeu89+HMFBqCCEI+JGmZJXRAqTHbzZ7HT5s05XfzCu+QruuC96VM12dLlnGAXaZp0B0D3V8hO3yPgSQKOE3ZGbKxpoL+UWSwvoq4IvN23JCo3Ni8PVSY+wRBGI/lO8oVYpCgMiU5hX4MxL7VT7TymtLYPRNnn9UJfP07hfr7xkjGaRoZQD8b8sVSpHvDl7Eooz7v7fwAhpgIVTJNYcpEMwIJtEhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IX1YRl27HA9TAGWRseSqFk+YAz+W3EWG3+oJXUWwiXo=;
 b=rYAZmfN0oXTQKqhG8z4F1phwE4sCQCA/uK8o9MeYP4yJCwHrO1CAB0yz27d7aCLh87UpKDCa7cq7ngz6E8JwLpcudUe1SM4zrysIGKmoNfJjD7OHxjawsG/KIZUnb1lhqBCaBqVTvQbNMosJB2piCisezu9Z0h+inrCwBTTYgwM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB3PR08MB10333.eurprd08.prod.outlook.com
 (2603:10a6:10:436::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 17:59:34 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:59:34 +0000
Date: Mon, 25 Nov 2024 17:59:31 +0000
From: Levi Yun <yeoreum.yun@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: broonie@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com,
	pierre.gondois@arm.com, hagarhem@amazon.com,
	catalin.marinas@arm.com, will@kernel.org, guohanjun@huawei.com,
	Jonathan.Cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64/acpi: panic when failed to init acpi table
 with acpi=force option
Message-ID: <Z0S7A6uOHpXZbxfy@e129823.arm.com>
References: <20241125170758.518943-1-yeoreum.yun@arm.com>
 <20241125170758.518943-2-yeoreum.yun@arm.com>
 <CAMj1kXGBnYQi05qh0QZk2hVLjVhS774-nT=HLdL_kW1d7nxMVg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGBnYQi05qh0QZk2hVLjVhS774-nT=HLdL_kW1d7nxMVg@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0437.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::17) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB3PR08MB10333:EE_|DB1PEPF0003922F:EE_|AS8PR08MB5991:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aaacd1c-3f99-4695-15a4-08dd0d7af140
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ZnZs8VdSw/pd1mhDxeY2z3kWZJJe5y5MKIkKDVLq+cecaOnfZIr8naGgDhxu?=
 =?us-ascii?Q?FkWboYRD66kYwaQVacKYHaPC0fuddHPXDDJDjjIUen5qwUIpcewC4J0fCd61?=
 =?us-ascii?Q?bvbSceNNpg3Y6oh95u3VOZyNLk8WshLcz0WKwa4FNj5Ki4d1UoTCmRz/yDdI?=
 =?us-ascii?Q?lK1FlTGOnTU2Et+eK9RnML7nwOQdxZBioYIPx+dJ4vP1FyH4kN4AJbWXLTqw?=
 =?us-ascii?Q?PETwWnZtLJh7G2SQPkh/0nm8hBlw7C1wAoypoqowZTu0hPzk/7qx44xuKZRr?=
 =?us-ascii?Q?Gqsu5sIswMqQWXIxAe5sp4kqo9Pw96SNzDXYjFNDrmi3KU3VxDhlNlemMzNO?=
 =?us-ascii?Q?4Kkr9oulcT6T8k+XYmI0pTJP5/D49oy07HO+JPbP8DMjLPKkcWgeOnOdnNY0?=
 =?us-ascii?Q?vcqgKDQL1yNIEMo++IG/njaVlTMuDGt1bRzxdL0CrxbXAKcn8C1xF1v71Sik?=
 =?us-ascii?Q?l3SIZXXZyZPIEIlSxVzOuIrGveHKSRYEI8w6sjp8SwB0dlQF2w4DSKX2Ha1H?=
 =?us-ascii?Q?BpfdtUniZShxLqNbaoqjKKu8qxVcwwyVs4hzHnYAVkVPRcs1yBujfVLyO3sU?=
 =?us-ascii?Q?uf5Wra8GYy92myLS0sYzY/zkGcbsZSrfdWmngVG71WCWwsiJbHTJMAjNvRbU?=
 =?us-ascii?Q?YBCoYhDuUBpyJqIMe0D++h/376zVMwgjSr16rKuN4gOeQEB0Naf7Jh3lxKwx?=
 =?us-ascii?Q?fiz3QyX5VoAqmxkX2EnM01siTxP75NmgFWKrDw0pajNpK/+PNjYJg8DZxfzf?=
 =?us-ascii?Q?xP9njqfdPXBTHc5qSuknqm1asYtrwADXNwMX0pamR/iFN2pAO+C3BgUPB7+J?=
 =?us-ascii?Q?s4xOU26zTrK+Air9ctJESwY0/gxpOai+7G3ozIwCCCFWK1DI/XUtps7KmYUx?=
 =?us-ascii?Q?7LtLoL73y8U1wW2ugaub3DcJ02IoCnQrnia4iBfW8aYdKSRT9QhcJN5WSUHX?=
 =?us-ascii?Q?g4/hwNe2jHFEmx6hGyFpB0XHFfa+n4gulN4Lp709PUPqNGAPUscwpWO2vcxl?=
 =?us-ascii?Q?VVP1xvGGBW4ni218p0SazAD7850hBpY4BN/jKTh5f2IB+uBAIbzbg3tsre0C?=
 =?us-ascii?Q?SYW5Qx/yVZm0ApsfyDsd0MbESbuHESX4P9me4aUEbLEW8VVJxGngXbwKwL8L?=
 =?us-ascii?Q?szcfaDsMXHxyaqZlhwVz0a+6Ry6pM1+hQQGW3Y0KG99HF+GRB7B97DRR0b4L?=
 =?us-ascii?Q?E6CUIFyJj07QFRm7motO6iAqUnrrRN9rz6QIBi/k4RQFtyIgswG5GeWIu/W+?=
 =?us-ascii?Q?ZrHkGLnv3YDvAEmb6cbhCk05rlbjKSSQmjcfhsmkYNnfNNq/+whIP8LePrur?=
 =?us-ascii?Q?xN1XJpiS40RXDWrPTY3DMd59NHXpHjUbHUSndoSSfUVfrw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB10333
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 056e270d-5e5b-4cc4-0bc5-08dd0d7aeb14
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AUM5lOKtRjMIKD4OuemuBgWvCHQbMxmJnbv5Ap9PRoizzcixwyFU2OzXZELo?=
 =?us-ascii?Q?Dcx1opRY7ZM1evzhsFZ0YeRVpxU/gUXxrMrS6odwuvu4pdqOYmrNQ4RxWPHt?=
 =?us-ascii?Q?Ofdy9t5jlV3Y1keWDiAngNT1ZOQ1DQQjRcg8iabAhJNgFdEWWFGLA1VedFQ/?=
 =?us-ascii?Q?3d2/UpsjJvoNpz3//MAEsjAkVqLdC90Hw3jspOsCQF2u8qsqL/ofYyQxe48p?=
 =?us-ascii?Q?4j68fQjNtsfIAA4q6eprbfwVULz93aQkYr5wLuDFJbgxm0Em1fdDyxnl2/7j?=
 =?us-ascii?Q?4i7xtCngNiUViHOghlkLL1N4ATYtM1O4Ae7MgwLFndO2TXNcM288dYGkDrCu?=
 =?us-ascii?Q?qG0JmDzi6FNRBsMFi6DYWyp6L9SEf+nXAIwqoJdVy6LB9HHcgdW2F+gVeAMn?=
 =?us-ascii?Q?3FzNdFsR6/+p5cicoOBTcdnBGqx6RuvAhbPJqUddCCIg3SA0KaX71xiqeaMp?=
 =?us-ascii?Q?Rhn6Py+id7irN7EKVrljKm834dSEUPEe7KB4T2mhNcriohFca3Nk4nNbqytN?=
 =?us-ascii?Q?0zifcAgmf+H7qcBQx7u7MAQAZyIyuTKi29PwvVQu98I66REv8KdowyulcHMc?=
 =?us-ascii?Q?hkBc/KOmEfzeLfUZbj0hRsJWq4+q/ZWZfHxi0LBSZqoBQSLN4jHnKoXlK6nH?=
 =?us-ascii?Q?iHuvm53Dzr1sTq9xl85eOLNfiVP8xpqM5mFlT0aWgHt6Qdty7hY9lQqYGc/O?=
 =?us-ascii?Q?vg7vv193M3T64kjM+TQP5U9gse0bgnn4QusxTQNU1ammoTltmgTKqCeRynuq?=
 =?us-ascii?Q?9rihVGmBkvL5etGdzUAWAELc08ZJ4lANSxVdH55Izjk47FJwIQbGgIZ+DHqN?=
 =?us-ascii?Q?6Y+rOBQJmvOJSMobsuhpF0R0aN/Bks+SfURnYUQiRh7OOvblHux7Xzjn4v/u?=
 =?us-ascii?Q?85vwYQMM1r/78CljEhlvupuxu9zyKEnPkta7zVEFaY9Zz5zKF5DHceRQY+oo?=
 =?us-ascii?Q?YWHJuWs/HD7hM1wmCvculqZ+P/qV7y6yrH6H2YDWG8fw51aXFvSiaYlbPCTk?=
 =?us-ascii?Q?72QAk1dz1M9f+ASgOHcbP6PNDma/X9V4yQ+ppf+xO8iFzHJlnnHtGheLg6nx?=
 =?us-ascii?Q?z1zPikQmqe6YACklyTTeg4QL0XgpEzikLKWD6z9bX0pz/yMS8v6Dl8ed41/1?=
 =?us-ascii?Q?IXBeNeBM8hqohWKLwOdB7ZapzbZOq9fi+po21YgbREI5tvpGlLGJDxgvUYx5?=
 =?us-ascii?Q?mUP4vxpNrDQKCv2MpKQGO6aRW5I04wNkRjOjymlYDgmQdwHx17B26vqLnM2+?=
 =?us-ascii?Q?vjXavD6pOZm68oJrEh22BD63y9UJu1v7jzGXgr/ddVwYbxRXKF9eGW+Z6KHF?=
 =?us-ascii?Q?VT+EBzWE8ThFOAY9pSEQ4wPaPltDOsK01h3yjGAFqsrouwoBQyXYb/RYPvOY?=
 =?us-ascii?Q?WNB7Hv+rhW54U9re9moqP4JJIWafHObglB4CHAVNu2B2XqDgC8RmXAkiVF40?=
 =?us-ascii?Q?KvzeO7qrSuhvpAkjphUS+GEo6ij3JOXF?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:59:44.0846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aaacd1c-3f99-4695-15a4-08dd0d7af140
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5991
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_095950_909158_FC683C5E 
X-CRM114-Status: GOOD (  10.26  )
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

Hi Ard.

>
> Calling panic() at this point does not achieve anything useful,
> though. Without ACPI tables or a DT, the only way to observe this
> panic message is by using earlycon= with an explicit MMIO address, and
> it might be better to limp on instead. Is there anything bad that
> might happen because of this, other than the user's wishes getting
> violated?

IMHO, the most weird thing is progressing boot with acpi table although
it failed to initailise. in this situation continuing to boot maybe
dead in unexepceted places. I think it would be better to prevent
futher progress by calling the panic() in this situation.


