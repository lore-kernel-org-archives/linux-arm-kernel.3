Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE34E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 14:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9owk1GTOVHbcavCZzpfvsFGXnjvvIvFjxQQaht9r80=; b=az9TkSATBk3oXSouf80d5bVAqI
	gYOsGkTqu9eXOJ0K6GnDvOS9FK90OITIITdW+wKddWH8oTpuCvrOjv3YGQji23gZ1sYn38LndhDKB
	rRjmUeO9CtpMBaNQMiC5N0BkiMGMyH1hPSJvkOwm4AwejEZIMRESjZFxdDHYYoea1VfRib9QR1Ai9
	H256WTXPRL3o30M04STsE9l62hRDEZcCU/t5+L0+R9Zqz5qMw0l7X57LhpOgJxTpneOBAe0Q+rvK+
	vM+of5N25nniBJ/vx18ITaivW3FbxnQaH57WzChUrYm4MFIMa6spN+rje2tqGWCPBIZrGiRivAgWO
	6GNG0zJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdRB-00000007Kgn-2T28;
	Tue, 31 Dec 2024 14:41:37 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdPw-00000007Kc2-4BwJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 14:40:22 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pYVYQfu3jdRvanQW1wevK2AIUWLqjiTB2Bw6FILEDZ+nppL+nfIQpDI4t2F7VUsGnT92mu8uv6m60VJngy55lqbNaQ2KI0AFbNSUIN6oUnlodjJLsdgRTUQSAA+pqNUBvmUmiQkr8vp6ZZGXS+V/N62lyWsP0z9fHPV6cHwXZncQ5oSKtsDO927JAcKcB9JJeX4gRQp8R/9Ga27ehtroY76WN7wuXL7pPdJwyyUwFwcfgp/EK9iMdU6rYsDLNnnaP9CSC+sG1/BHz8d4ExRwt+GVCWSS/BsE58MBuFr52GgmoTQQ8YGHLIgrGixZ1zP4PU+n0Ne32X5t2AWFvAMSlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9owk1GTOVHbcavCZzpfvsFGXnjvvIvFjxQQaht9r80=;
 b=I6ZEighgDLeVITP6aY0hx7XV3cyXHVmYwXk103WA/6fL3NxkU7geBte28fTqCR9p/SeYj799r/q3+9wuXUZRQK9RQUQUwLMPjO+bN2RYT7K0ykoEHSpL+4vojK53Zy3SNaVcyQlMm313tfqWElIBUDZ9LlPKvQbsez/tin6FHeckRXhGJahWtR0Oz6I+kIMASbvdyRrjkaWIcC4iK/vQ+lcyBfi+hOFyHsR6f/1wXeCt0pAO5d71J7VMmfmlb7Rhj4qGUenvUJZXEVBRLnTtO6XaJ6smhlMOKNRdAHqSe1Mn54RYgS13cbx+kIZY/Zs4UkGfCIJHyqpu6aTRufVxKQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9owk1GTOVHbcavCZzpfvsFGXnjvvIvFjxQQaht9r80=;
 b=Td1mYKTPrZ262NZiZIxVNQxXI4o1aPwUeyO+xAVr2EuMMKLd5MMSiKN/yRrAsX9O0nzA4C/ZyJLP9U06t4rWQhTimm+z3QYuFwshuSu52v82zWx4ftyv8lEDpJ/evKPwIc9Wr4tqnYGd/hgTmyPrJgOd2CqdcfhkEJqgH5htdR0=
Received: from AM8P191CA0020.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::25)
 by GV2PR08MB8194.eurprd08.prod.outlook.com (2603:10a6:150:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Tue, 31 Dec
 2024 14:40:09 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:20b:21a:cafe::bb) by AM8P191CA0020.outlook.office365.com
 (2603:10a6:20b:21a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.19 via Frontend Transport; Tue,
 31 Dec 2024 14:40:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.11
 via Frontend Transport; Tue, 31 Dec 2024 14:40:08 +0000
Received: ("Tessian outbound 42d62cca2da1:v528"); Tue, 31 Dec 2024 14:40:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a63c728752f544ca
X-TessianGatewayMetadata: +HKjFDxIKQxLRUNYfZMgBhy2oCxwCuwfUxRRqO57fVF1K4UhJPLsBbhmym2fWd/alkufs42k+GiuNE2DmDLDP8tGgIAblIkfuhdLfDy1o1hu5peOLNCQbDPZosGaceYwYwqXFvr6jAU2fspCGGtvYdu2RsJ18NIqZ6Ho6cEWfYfwIke/UCJqqDmqc5MivRV1niYS6Dw8Yv03VGgEZUIbeA==
X-CR-MTA-TID: 64aa7808
Received: from L7bf24f2bee72.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AEACD962-FDC1-4AC1-959F-BE2F337DC31A.1;
	Tue, 31 Dec 2024 14:40:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L7bf24f2bee72.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 31 Dec 2024 14:40:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5RjIeqkTTsbuVEgepb8sS3fwg42VXslDbX9l+aMDFMEtKUORde8d8noegpyN4TxvyQgzYCigKZQV4H49d3UsEJZaUXqTq0vzBmntdCDXZPa7O/ai+XZ4LwpfMuUg7j7bIT0eq1pjNgGUUZHsYYVApFqBYvj5A918WA9diAQO+8gfdvd9wPcEE+x1yQ/ughyY2R0EzYlOCJa0egp/REV54aglUlCQx38o7dmveubbfmrXA3EYkLDL57DLQV5CQj/h2Vxbj2/SJz2aLcIELbKGbIjkeSs7H4CHPVyIf6+4FdtG8XK5lXAVkqcuRBdI36YZZAeRM5oOt8Ky18dRgjyuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9owk1GTOVHbcavCZzpfvsFGXnjvvIvFjxQQaht9r80=;
 b=pikDOMMopw0Kt4DP1o9O7EwP2hrLuN+etNmMX0M8J7dHLvD8SQ3S4IxHs/BQBBI7KTY2ToP0DyeO3QxfXgC4I+TgZRcancRh+eGtBEgxrfnn6m0h4FUZzg7AaJ7T4LZYtYOYT99VCSWAo7JN9m5HmLDtbdKSs3Z8Uw5vXKRm/+/iuTQ/MlRe/k3bjizw/WzqLipERynG8o/3XkFV5T18sH3RaGM0mB7ZHBsxx00sAg6AqsvoQnseK7UvIyJGqknLA5MhoCLC6xFq082hSEqlFxiLwUHM+oXBfqUssa1ZQ6PIJjoPJHE/gW3J4ZUxz6bhcmDf1ZYxZ/HluoqxJ8Xotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F9owk1GTOVHbcavCZzpfvsFGXnjvvIvFjxQQaht9r80=;
 b=Td1mYKTPrZ262NZiZIxVNQxXI4o1aPwUeyO+xAVr2EuMMKLd5MMSiKN/yRrAsX9O0nzA4C/ZyJLP9U06t4rWQhTimm+z3QYuFwshuSu52v82zWx4ftyv8lEDpJ/evKPwIc9Wr4tqnYGd/hgTmyPrJgOd2CqdcfhkEJqgH5htdR0=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AM8PR08MB5714.eurprd08.prod.outlook.com
 (2603:10a6:20b:1dd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Tue, 31 Dec
 2024 14:39:55 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 14:39:55 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] small fix for configuaring etm csdev via sysfs
Thread-Topic: [PATCH 0/4] small fix for configuaring etm csdev via sysfs
Thread-Index: AQHbU8m6d/N7q+bVvUW17lC0asndWbMAfBag
Date: Tue, 31 Dec 2024 14:39:55 +0000
Message-ID: <GV1PR08MB10521628365D8506D95AEAF3DFB0A2@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
In-Reply-To: <20241221165934.1161856-1-yeoreum.yun@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AM8PR08MB5714:EE_|AM2PEPF0001C709:EE_|GV2PR08MB8194:EE_
X-MS-Office365-Filtering-Correlation-Id: 9350044f-7cf5-4bb6-3180-08dd29a9062d
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?9LuXGQu5w9vqg6ufcs/21c9X7ocIozgrCbz4swhJbXAVTD0hwtAfZPIC/8?=
 =?iso-8859-1?Q?Jw6mFHFT6c5zZRO8O/lreIzfvw+IlehXwiC4SzAgmMPES+3h6HmiOXOVtG?=
 =?iso-8859-1?Q?ckk5sniq3CSH2VkXLeBGAu4Zam3JR+r/NtGDoyKbYAA7bJZQI08tudxnxj?=
 =?iso-8859-1?Q?ArIN64WtVSm1YHMROFIt3CUhQ7Y6LJA1MSy67y9e9TnvsE14Lr3Asge2e0?=
 =?iso-8859-1?Q?sYj45/MvkrfOdiZsh5L/fzqDTe9TG5M0UWvyDLMWAkQjLJW2TgkNaT3MDz?=
 =?iso-8859-1?Q?2I3FDR9U06+Rkeri/we36duLmAwKnIwicofybHg9xjhpupRZTdMeNjNHNV?=
 =?iso-8859-1?Q?ncFpWjXUgt1tDLuvNygKsdDkSusm9L6GhyeAak9fSMDBibIEa83hYA9bRl?=
 =?iso-8859-1?Q?IFnojAskRY/ymdf/f9+6o+LsSMvb+s6zPW7IIkYz2QOPDXGqJ05SfwNYYk?=
 =?iso-8859-1?Q?Q8vPKbDLyphZsLskK8E6VqCT9FzDTUdh4sVNJfblmMu2PPcM9RI0FGL5PY?=
 =?iso-8859-1?Q?lmlo8oV8qHysvlPgyAF+BZ8YaBWM2IuCfdjSpkVWXLYXDz5RPt0pDKVvav?=
 =?iso-8859-1?Q?oaHgQZ1/vLi39z2X2CC2CjAy6RxG6LZHzlhXsxqt2LKwJmHOhFMGfXPj9L?=
 =?iso-8859-1?Q?twB7w3wyrqIqQvNLpOlo44j2CgYiWyMr8NjR7EuRcpFzdELQBRgPhKATwc?=
 =?iso-8859-1?Q?0zictpvRv+opn/8ncrAftMS45/Fr6dLyMFDhrfguYzl022Is24zCpkVgHJ?=
 =?iso-8859-1?Q?fJAF/eDXX0RaFL+bb6cldQbd6cKYmL8AjRqC9JWZ5X8iQgf8ETvKQYBbXg?=
 =?iso-8859-1?Q?7sYtsb2hdS6DZbcHWIrHSm5rpw1Sol5iPqtj+Mm9QGSNk8DWlrZ5q7xor7?=
 =?iso-8859-1?Q?GA6mUtIKhg49TbQ4wBYsTben3ZH2442PNPvNfpIB8DhENI6w8tJybGJO1g?=
 =?iso-8859-1?Q?yZKRnj3QxnsU/OnS5JpbRgeEjgfWyNbFKAqB3pNKPKt9EfhGEdnXm2RlxP?=
 =?iso-8859-1?Q?7l+FvYQso8HkRzxM+m1u2YfIYxfvWkS2OD66Hi09/euQbeG32A6Y+pSOAj?=
 =?iso-8859-1?Q?cQ8kfD39RCeS1TqRRhMqbXL/nsVPSwgOZQSQBDiumGctPq3JkdGknpTpbN?=
 =?iso-8859-1?Q?b/4hXoc2RdWfmwrcP+YT1c+Ythfoq1D7DF2xil27cfE60atzOQNyDdpZTz?=
 =?iso-8859-1?Q?0F7DkZ59hsfEknup1UINoZyB+Nfp9rzRj4HhwSxBUWFMFxYB4puNyZNeFa?=
 =?iso-8859-1?Q?IK4c4jlt8E1qWzDEBVRV0tR53aJ70qJXXOoDLWr9Xm8SnMGpSQS5aenWpR?=
 =?iso-8859-1?Q?Fh0ghyRbQTN0TuPOHls9aGEeFx7VVX6nvM4tVi/+eb3QbHrrmtRx5KZHYb?=
 =?iso-8859-1?Q?SCjljPqeN04YuHnPe9VIIdGNfEf4mARJlFjVI//DFCx3GSwmU5DsaaQ98j?=
 =?iso-8859-1?Q?KPii2HfYxOcr0FrLP0IN193/MbfiRJB6+81DyCeGAMcHsjFvLxb3SOashb?=
 =?iso-8859-1?Q?S4mcWng8Paqw950h16h/Tu?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5714
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 411fe5e6-121e-4125-4ec3-08dd29a8fe1e
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?vEWlkI7XHezHN9lyxsue7npDmZoUZvK8Ynz749mQwnt1LR6f1XS9fL4VPn?=
 =?iso-8859-1?Q?lFvw8FY2uaLcroOdwq4EhEp+MxUsPE+HGYs/vQY9Lbprclw30YIlTImNZA?=
 =?iso-8859-1?Q?p3ubQLiwCZOOKLNVB5pEiIcjeiXKa7dgztcNqTF+rWFvQXvd8jaRFIXyhp?=
 =?iso-8859-1?Q?EbjzGx6QIPSmfOp/r0fEksUxIGTzuWt27aNgAEDuz9PvqadBj+T0Cd1FYq?=
 =?iso-8859-1?Q?kVuHqbda14C54uAVnvknNVj+2rV3ruIf1R7rtYr5sQSJAZ+hr94cVCdLSX?=
 =?iso-8859-1?Q?JjAXpLdpgDISqXtyFZxExnFf6Xcs4jqjCkfEBY/ykwW/XUn9N35vPJU+K3?=
 =?iso-8859-1?Q?vyDraPkBK3H3LjSDK7EuUDk8RbYATgVDd6YjxdmTORCRPSNfxK+Ak/kFET?=
 =?iso-8859-1?Q?Bak+/kqLhBflXC3OfS12Fa5pxZwoYJ+lAs25/DGBvEgbJanPd2v4ERw9Bm?=
 =?iso-8859-1?Q?q5etEL4jppQkDwLuJKwYukn8hBRcBVuNnYS4prhxuy//lk+7x2PRMQmog0?=
 =?iso-8859-1?Q?zGp6zPdDJpl9fvqjckK/hkOCcQOlU3WU9qdF2B2Qbgq77CyZ/9XhWThJQk?=
 =?iso-8859-1?Q?5xE8zKN+WWqGkWwqMeqo2sq3wcTqp9XKgMSlAT8XB3K9jKUXSLNsKU0WO5?=
 =?iso-8859-1?Q?EHXhyIzslV/t+EzjA+w3PLkFxa5MJriQYOmuDdXTBd5Rwxjh84ogptBhYQ?=
 =?iso-8859-1?Q?jb5wcZXfZ+A/X5NKeHL7q+sD5xX0aKW9ALtlnKwBmALV7j3lyV36G6Ae4L?=
 =?iso-8859-1?Q?TuPslyGG0Th3nYFt+wNzjC+vZggrHtfer7fcArHxB0ipdfSK85t37ex+SE?=
 =?iso-8859-1?Q?bFQvQ6tqaMuf8/qENbyJl79M8MlH2fckzzGS1irVTWYnQGME3WLoJKlbDR?=
 =?iso-8859-1?Q?hO91fGx+/QtvFKOPU11/Ub1Y0Z++sNMY9aXTPZ3lWSzzO05BEBuZ5iJs4c?=
 =?iso-8859-1?Q?tjryOJeUnGJ4creU3TyKqMdg/iwTxA1Au6iNOntuSaJJaZMHsnZzkdqyDk?=
 =?iso-8859-1?Q?zphXqHMzUnjSK2nR7Ern6Yn4reLfB2QHzQLvE18WLRInmt6AudRz+mYjlG?=
 =?iso-8859-1?Q?OFiqHPyDi60/ExrNN6TvWBCWz5VhtCYErMhYe8E1d2H1SIP1woJrakitLO?=
 =?iso-8859-1?Q?bC1Lt7kRzvQVJ1k+WXEMon51l+1xNTb5vBpKVUFHp2oFcrVr8aaHcSEgg8?=
 =?iso-8859-1?Q?EE2u0EoOCbM8So482uPElBZ36sC4hPUw24RTTEyAkoTj2iUmnxpOFflhRz?=
 =?iso-8859-1?Q?/4YvPjiw9PxvCsAlVEESFJrn7NmTYs9YKR/C0ail/SrGiw8bfOjDKVGA9F?=
 =?iso-8859-1?Q?A7+F4KV6NdpklcuItFGdZSzmNfpTFt+1IMSqpHV8Jv81CgEhGP2zHtWP5q?=
 =?iso-8859-1?Q?HSVLIOBiLBTL9UhbHNh0L8iCTUXqHozMvyjliugm2LGUC+rP9VM4LxhXdV?=
 =?iso-8859-1?Q?MIJPGtey4gEQABgtiiwM2Hwx9U6Gpsx6hFAUm245tzgpjR/3gPvuL/0Bw1?=
 =?iso-8859-1?Q?dIEjjIgcB/7rGRO66dtiHmbVpG45f1wqMc8HB6JwDoRRL10CZPzq7d5TSp?=
 =?iso-8859-1?Q?eCc89RR8SUxbK20sa4oGM/nTyjO2?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 14:40:08.5690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9350044f-7cf5-4bb6-3180-08dd29a9062d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_064021_219032_9D5330D3 
X-CRM114-Status: UNSURE (   7.34  )
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

Gentle ping in case of forgotten.=0A=
=0A=
________________________________________=0A=
From: Yeoreum Yun <yeoreum.yun@arm.com>=0A=
Sent: 21 December 2024 16:59=0A=
To: Suzuki Poulose; mike.leach@linaro.org; james.clark@linaro.org; alexande=
r.shishkin@linux.intel.com=0A=
Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux=
-kernel@vger.kernel.org; Yeo Reum Yun=0A=
Subject: [PATCH 0/4] small fix for configuaring etm csdev via sysfs=0A=
=0A=
when etm csdev's configuration is modified via sysfs while etm is being=0A=
enabled via perf, enabled etm could run with different configuration=0A=
from perf_event.=0A=
=0A=
Also, there are some redeundant usage of drvdata->spinlock in=0A=
etm_starting/dying_cpu() with enable/disable etm device.=0A=
=0A=
This patchset fixes above small problems.=0A=
=0A=
NOTE:=0A=
   This patchset based on:=0A=
     - https://lore.kernel.org/linux-arm-kernel/20241220104521.809071-1-yeo=
reum.yun@arm.com/=0A=
=0A=
Yeoreum Yun (4):=0A=
  coresight/etm4x: disallow altering config via sysfs while enabled=0A=
  coresight/etm4x: remove redundant usage of drvdata->spinlock=0A=
  coresight/etm3x: disallow altering config via sysfs while enabled=0A=
  coresight/etm3x: remove redundant usage of drvdata->spinlock=0A=
=0A=
 .../coresight/coresight-etm3x-core.c          |  33 ++---=0A=
 .../coresight/coresight-etm3x-sysfs.c         | 120 ++++++++++++++++=0A=
 .../coresight/coresight-etm4x-core.c          |  20 +--=0A=
 .../coresight/coresight-etm4x-sysfs.c         | 132 +++++++++++++++++-=0A=
 4 files changed, 272 insertions(+), 33 deletions(-)=0A=
=0A=
--=0A=
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}=0A=
=0A=

