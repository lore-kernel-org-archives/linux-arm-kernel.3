Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9887E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORCdTPwBjwWs6g5ugJyqxoJ+/mBzp4HVWjIHqATcpDQ=; b=e90N4xS5jNduJPEM+y6etXkhuo
	fKJQY+50ezOYBOVUD+xETX6ZnJBrlM2iGA0lxCva07qqEdsk3+0TcP5t8LR4OnmsjWtiZkMnp1NN+
	2sRELj7nZu3sgl7XZod63x8GD2q60B3xTaePYW+as/I/Kz8iHbmyoYoE87lPDmJlFvko0o65ndeTh
	inxHYqxsIFgpPc2VfwGs/YXcquxnIide2CCVcXjocf2x9UKZGyJ1hG5tEQlmEtRpjClCXVVTX/cRX
	2c6ux9c1S+e/561Uvll+YK+oW8ZaAFvyps4xBgqFJcqI5xEL7uotrqH5lSPfGvDA2fiuh91+LS5Wf
	Yzxb9aoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdPI-00000007KXE-3ckc;
	Tue, 31 Dec 2024 14:39:40 +0000
Received: from mail-vi1eur02on20608.outbound.protection.outlook.com ([2a01:111:f403:2607::608] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSdO8-00000007KT5-4Bmf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 14:38:30 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PlclR8ox0nu32jYb6SfUlD/LoMIf4V1PPFw4fJMdkLNAOViGVCET7veV/CZjeoHI+ZuZSXN5Wfnd5DIS2FrRy9zMQjJyWyQuBsliGYv/Kt2fsK3twbksrovQEhmbLlt5RPp6q8DDbURHZ5GakIE2zzS9OYo56SNnA4qt+StZ88YnqWWjFIRSWQmw0IAVAenTEzbb7uZQb5g0UJtijLwK0WMDhsQq0a/f5MCqEBKBLctxjIMfRUHLiUYLfFzuf5QlxKYIb/RilNeQJPFfsl65gS0DH3Rzaj+NQrD9g89mUDRkE5tNvnXycNyb64QoXOjg1unN/vJVGQFJc/0yweF39g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORCdTPwBjwWs6g5ugJyqxoJ+/mBzp4HVWjIHqATcpDQ=;
 b=rD3Rnbfb79SNqR9WJ0x9Qv7Y9GwLPGQY/bRhe21w4lUqonfua13zV7K2xxMqRLL1Y77hP645uhz/klaF3LFA2N82g9niZepUfts4ZWHmA0qYSiibnWGK+a7C7Ezw32oGs6IWD/sFAVe71IZvivih3/iXiWp0NnOtwYMSu4JvUSeXYTZ06yxy+sZ12inRA/NQdQJ0UMRYLFF3lPZmBt6MPyrxoSTkkvGTwOvqPg6oan9OiHAUXl4Pz+JxJER07lKi4pFFqOGufRN9pTMdhqIhZC/kAcf0HDwt+TxRAp/xvE+s/Q2scBxTd7gJitdgbhEw8JVFgKtbcTO/wkoZD4HxiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORCdTPwBjwWs6g5ugJyqxoJ+/mBzp4HVWjIHqATcpDQ=;
 b=HNPRf1zdd0DE7VFTK9AFVBpBmzlgx/3l0qTFvefPc+b2kQwQujwagVVScFXyPa8yL09dUB1mHz+FThfofsM09ByqPkmjlu0H8a/txVXTi/zr1J4lm5WEx+7M8Z4iEyJQECO0d2IcZQDv7hk62CxlGZccui6tG7x07Bs5k+wlCsc=
Received: from AM4PR05CA0024.eurprd05.prod.outlook.com (2603:10a6:205::37) by
 AS2PR08MB8829.eurprd08.prod.outlook.com (2603:10a6:20b:5f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Tue, 31 Dec
 2024 14:38:15 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:205:0:cafe::4c) by AM4PR05CA0024.outlook.office365.com
 (2603:10a6:205::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.11 via Frontend Transport; Tue,
 31 Dec 2024 14:38:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.0 via
 Frontend Transport; Tue, 31 Dec 2024 14:38:15 +0000
Received: ("Tessian outbound b519d6c64997:v528"); Tue, 31 Dec 2024 14:38:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c9a62181e3d1aeb9
X-TessianGatewayMetadata: oUiG7GK7McsyLRpZL75Dv0K09LqAXX7rZBEdXDjFXA6c6hrUTL4a7GY5sBb7miqoTF20sMmDSI6IaY5hv8Kn40WW6VhfoNXm3D7+aNK3kh1FAPgveVY7sMFYf2CWUb+XvQI1eqtaBJmvfZMcyYGju0h5/e46ohZSR71G6Yw7jWEdLs5T3l5LhW0o14nX9yOf+bcr3BhiLSgyoek4jMwIIw==
X-CR-MTA-TID: 64aa7808
Received: from Lf0e7cef2f761.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8C4D274C-FD3C-44CD-82AD-591885E6D7F3.1;
	Tue, 31 Dec 2024 14:38:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lf0e7cef2f761.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Tue, 31 Dec 2024 14:38:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyI4al2J+FmsVpyKWTwmh60MG9FnxxNd91geXFKXy/cgI4jDrJVJjmadCBDfnSC4CGaIXtL0zOrXhUvRjlrf0+9JMieAjT3PNqj+6QsbMGbtAsiQOF0ejH/layqANQrSSOl715/5ykIzGeE9sBGSCG2bEtuOnmY0hKrNm4KGAeI9iQ1wZmcJnhmOI58NAq99Mtwa07r/O2hAe3LPYiHwSvovbGwPjfergNKZ/GTPOgql5sp0lkRR7/j4qSUTpOH/t6fcgKvmmHeFjXrj3I20B3HeYaUzK3anJVnzdC9jrk1KnLqBI3u6AgIl3fwzot8olS39ALSMvrl/mQm7JGy1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORCdTPwBjwWs6g5ugJyqxoJ+/mBzp4HVWjIHqATcpDQ=;
 b=GtPVL3b1K4FBfXk9NijjRcUD6JNWVUh384C0WQw4ucKbV4iIMzrsQRa/EtfBIrBytMjbdgHYDF/V2pE5tKnX2f3UnMQf6kEishwbiEFZgBecL5BP0DDmNWdtHxL0mzAEN1AUA0o5Gjj7ZrFfRlMPRJcVa7bCAHqsUDHSY8GKJoswI6qznxop6YVzJoKclp//kikkGDF/iNqhASjk2uQNQvuZIsas4biMyX1tXRavh/ntM3/XF3lyTGK4EYo5HVVJgT/qnsmXzVdkEQSDD6yiZEamjdd77uw7nOISnO5qXri93Zf4AlubKwBFybujV5Bgbwb+bUkJ70NowDwtnMkNKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORCdTPwBjwWs6g5ugJyqxoJ+/mBzp4HVWjIHqATcpDQ=;
 b=HNPRf1zdd0DE7VFTK9AFVBpBmzlgx/3l0qTFvefPc+b2kQwQujwagVVScFXyPa8yL09dUB1mHz+FThfofsM09ByqPkmjlu0H8a/txVXTi/zr1J4lm5WEx+7M8Z4iEyJQECO0d2IcZQDv7hk62CxlGZccui6tG7x07Bs5k+wlCsc=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS8PR08MB6552.eurprd08.prod.outlook.com
 (2603:10a6:20b:31c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Tue, 31 Dec
 2024 14:38:00 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%5]) with mapi id 15.20.8293.000; Tue, 31 Dec 2024
 14:38:00 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>, "mike.leach@linaro.org"
	<mike.leach@linaro.org>, "james.clark@linaro.org" <james.clark@linaro.org>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, nd <nd@arm.com>
Subject: Re: [PATCH 1/1] coresight: prevent deactivate active config while
 enable the config
Thread-Topic: [PATCH 1/1] coresight: prevent deactivate active config while
 enable the config
Thread-Index: AQHbUSmiuaIWKMETf02zB1rXCXf0ALMAgM4a
Date: Tue, 31 Dec 2024 14:37:59 +0000
Message-ID: <GV1PR08MB1052128A5BBEC4E0A9090387FFB0A2@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <20241218084833.609876-1-yeoreum.yun@arm.com>
In-Reply-To: <20241218084833.609876-1-yeoreum.yun@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|AS8PR08MB6552:EE_|AM4PEPF00025F98:EE_|AS2PR08MB8829:EE_
X-MS-Office365-Filtering-Correlation-Id: a8248bbd-d8b2-4f31-1149-08dd29a8c29d
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?ygVgDwdJoSCy5bHLCeWjQVGX850nWeNXD11F0o3gNtDNuVJNqY2wpf3mW8?=
 =?iso-8859-1?Q?Ruf/86EQcpZnYPFCf6xFERDaa/k1hY705E4zS7944nfjDTtlktTKZY5NYq?=
 =?iso-8859-1?Q?5Q90HwO1e2jom69k5n12CI/ClRyQRkDp2VubN5eP9ypcllDIMVfpY+Vl+a?=
 =?iso-8859-1?Q?00LYJDwK3Hb0ancRxaaCbknyt5wG1jt8zUFNKsg3Hj8I4JPlurMm/S9ZSS?=
 =?iso-8859-1?Q?wFGhcPTtKtfqS3fKyiv5+OWEkCfZcUR7ij2vyZhPEfKt/OT3xY/V/yYd5S?=
 =?iso-8859-1?Q?RnOr+3dotLaCAqw5k8OQis8TO5hznJFmhT/F5sEna2Fxi5nyoqPYrFMwfC?=
 =?iso-8859-1?Q?YgeZs2VWTj0L069IAqSqQEsK09vo0i+TBR+2q9ypRc+W0UC2+9S4EoBnvZ?=
 =?iso-8859-1?Q?OFXyjW0eZfSJ2b+cGen+0LTewmHxcjzFPBs2v+KMBm2KlJVZGM5KoI+no6?=
 =?iso-8859-1?Q?5ZlRzfmgaJGW5QoNmNRWu5iHP0yMy0pZLmw+NhDBQ//2gl0j0crdnoDoaZ?=
 =?iso-8859-1?Q?eWh7TvQFMJgk8gFy4DzYknlGuObngrNQKuVHmUY4xfqkAxKOFNtabPAz4A?=
 =?iso-8859-1?Q?aKo1mbBEXXagFyzczXRSwOEJISWSh2tKGKJmTTYbsnXuzIxxhuaAre+LoT?=
 =?iso-8859-1?Q?/kafgzx6lu0WbUNXWekJhWzumi7R4Y/+T34sdPgMU3GU7+7jV7D+ayBSkV?=
 =?iso-8859-1?Q?KsDR1/Q1gleyf7phAbvK//w9nrPstp+GjF4psPAWftMahUcd3KIT1HvcMh?=
 =?iso-8859-1?Q?YGRkYg5x46jcGFRr5ZEXDxyK/tEM8NmWcSShhw9vh6mUHi7QI7EQbmdUAV?=
 =?iso-8859-1?Q?/kIEQIc+wzv/uO6+GJ7U+4tp5i+fRtw+P8PUikSsA/uN838//4O2ULZgcI?=
 =?iso-8859-1?Q?WWOI2JWCCOsOcE7N1amu4DNfbxRHbVykqR4l2TLr8Xu+JkqrzYkTvoB+2q?=
 =?iso-8859-1?Q?Z8QMCqNGx2yh8ziP9L7rQ33asiG9FCZXg7qXbN484QG1EHqhwmuO7XP+5K?=
 =?iso-8859-1?Q?BmqVNE3oh6r2D6E5hx/LCskJN2V+Tct+vdQ9LUsyYiToToloLaYJthlj6S?=
 =?iso-8859-1?Q?BEtTt9CEfLbk/5EfEGSbNjmJtvzSmW8dSojcO6Stu1u3kQX52sGECrC6e8?=
 =?iso-8859-1?Q?TX86HYdIlKF7JTe7Dlhh8cIcazYFkAuZutdyFbfXVYjOKFgABu238rTtuv?=
 =?iso-8859-1?Q?9Cub4ih5cm7RR9ntjk6i9dC0l4cpfpqEcZZ7VBQUCHU2bzm68O43BEkUQt?=
 =?iso-8859-1?Q?ADfapK3g37kIg7VSAvDmk7z6r2NZyunlmZiR2C8cEZNdMTJNnQtUyCYi1q?=
 =?iso-8859-1?Q?qHf+m9X47knEwRfRp62LD+A+4oSMU++e3wZYW937UMIS8Ziccq+cr7ERsU?=
 =?iso-8859-1?Q?LxAaHe8IBxMcrXgmL4+XK6lMU+wzb8zYL1V2pRmOhtJCLYCHvnqgkxAEJZ?=
 =?iso-8859-1?Q?jM4jpMLY0MntansXvo55bFNzdc3hFNHatQkv/47Jmfxm1+iLcpALOHgJdn?=
 =?iso-8859-1?Q?8fZKyXijzenDeU33nBzjzb?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6552
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8f5b6521-c938-481b-312e-08dd29a8b97c
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|35042699022|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8E2S3F3JM4071XT1t3GYvGbhpmB70C5chY+tVC3HHCJ5hKeQcmYeO2OhKC?=
 =?iso-8859-1?Q?KrqxmD25cz1j+WhyPRMJE/P3lk7bNzV3tKYyz21Ahxw2+WRrowd/ayb4A/?=
 =?iso-8859-1?Q?OPQEYbXgbOb3UKVJKqhEa4JT7q1dtxgO1jb5Xk8utt+R/TVTpqNBfOxEqM?=
 =?iso-8859-1?Q?Iuz7YPuqqNlbhQo8rQiSDxOtMdh0lk2yP4I5SzKuowzET8odaqRp7VcRb9?=
 =?iso-8859-1?Q?isWKeFuXamesqoRoy7BTDW380OHGwhXeHSyAhUytBsOqaW5tOfm8P1yZDP?=
 =?iso-8859-1?Q?PJz5s5LoJKFBYpikeZ2ibJFsbtAikJ0cWgK3scdMCZHo4QHuuQBJTp1TpT?=
 =?iso-8859-1?Q?Ko7lzVIMu2iOMpDQVMIeGf3MsEhLJ0uhj53HkEt2laZZhb6OEEErVeE+is?=
 =?iso-8859-1?Q?UTRIqhBh8UoPA69VzrR6C9855o+4QGzZpkfF6Lo6bCJq/jAsb1wMJHDZ+5?=
 =?iso-8859-1?Q?h3WbcVgZxWz47Q3czxlZMFUEcWHC/3XWqhIS02+gEPMACtQFLtMdDnUV5f?=
 =?iso-8859-1?Q?RP0Z80C/uQXsnjgvZPjAlyTgELMaG87+woX7MTjG3HhyDDLRj6U9fvzwUH?=
 =?iso-8859-1?Q?tjDc6yspbNbaInlDPSuP5AGEKBTLzEsoFUEqa06RnMjyEMBYLU8WsJn9Ae?=
 =?iso-8859-1?Q?jIQcQ6mv53mh+9hYifK1vsNSvtInSZVusHlkzQWMFaRSgBSu/C/Tcp2/ts?=
 =?iso-8859-1?Q?q4RfgXg0KOxbpJqm5bMqzLDeWFg1EIObCq5HRXrIysVflhEJcqKQ0ow0B+?=
 =?iso-8859-1?Q?QlPvMLoL0SjxAIH4WXInKPemjH1k+3uJPg6VsxMboC9+YLiqAcpOImFHWI?=
 =?iso-8859-1?Q?GKyvYIna6UJopQoD1kJ9WH5vzMRvR+iXPu11lXfuSb7lYWJQH8YfhAm5ht?=
 =?iso-8859-1?Q?ljE9iYT3IUeOiW3ZtHTHEtHJBA7ifF/jVmHh0Fw1YPfIf74TXwv2Ht2VIK?=
 =?iso-8859-1?Q?kqcCeDix4CMjVWx3iDdYtNaIfdox11ed+s1revS7QzBLGN00BJ2l7S9k7U?=
 =?iso-8859-1?Q?u4ODMN8oozVNqq+5RI7zFDGKUf1EXFyPVaG/eC4TD0txfvptOMRoc3ADtF?=
 =?iso-8859-1?Q?opgD+lL9LRhbzFvU0YQ+clCOBHFYfh2taypkoOgHofSzWoEqBg66wXeifT?=
 =?iso-8859-1?Q?7HLXlbrHVHvXsPqKj2ti4P4+tF853Aulw4yOl/ADA9IOjjd9dlDfqQXGD8?=
 =?iso-8859-1?Q?9GjEyvIv0IFnVCI+t5c5uk5HOyDu6OVmzcIKX/oPm1VqVPG2LLYntBMiWl?=
 =?iso-8859-1?Q?XQYpNhPPgbCnRoscFzQWh461ZQKTBTq1LcxoCWuTbuJLo/WCLZ7+zKzJiP?=
 =?iso-8859-1?Q?BuUrug1LNty6tptAyViSEy7JywGkm21cfczqEaX7MEx3GiBrhYJmDwTqF7?=
 =?iso-8859-1?Q?hj5uZzdkNQhEYBSRz+5Dai3YCkX+t9A3mYsUl6/C7p2Q20Ia3xjQjyrSuq?=
 =?iso-8859-1?Q?X/oSgWFdKjM5DRSWKj/ajdLZdlI34+Nkzvp1s9TgAsQUxwyxe9IBbEwRxA?=
 =?iso-8859-1?Q?gAOfO7+D7bHP4sFSuTgD9Up+/uBxdWb8vbAeOdnauSP4Z/OVNpxlBJ7/ik?=
 =?iso-8859-1?Q?YSfl7X8=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(35042699022)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2024 14:38:15.2171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8248bbd-d8b2-4f31-1149-08dd29a8c29d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8829
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_063829_496206_3DC79EF4 
X-CRM114-Status: UNSURE (   5.65  )
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
Sent: 18 December 2024 08:48=0A=
To: Suzuki Poulose; mike.leach@linaro.org; james.clark@linaro.org; alexande=
r.shishkin@linux.intel.com=0A=
Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; linux=
-kernel@vger.kernel.org; nd; Yeo Reum Yun=0A=
Subject: [PATCH 1/1] coresight: prevent deactivate active config while enab=
le the config=0A=
=0A=
While enable active config via cscfg_csdev_enable_active_config(),=0A=
active config could be deactivated via configfs' sysfs interface.=0A=
This could make UAF issue in below scenario:=0A=
=0A=
CPU0                                          CPU1=0A=
(perf or sysfs enable)                        load module=0A=
                                              cscfg_load_config_sets()=0A=
                                              activate config. // sysfs=0A=
                                              (sys_active_cnt =3D=3D 1)=0A=
...=0A=
cscfg_csdev_enable_active_config()=0A=
  lock(csdev->cscfg_csdev_lock)=0A=
  // here load config activate by CPU1=0A=
  unlock(csdev->cscfg_csdev_lock)=0A=
=0A=
                                              deactivate config // sysfs=0A=
                                              (sys_activec_cnt =3D=3D 0)=0A=
                                              cscfg_unload_config_sets()=0A=
                                              unload module=0A=
=0A=
  // access to config_desc which freed=0A=
  // while unloading module.=0A=
  cfs_csdev_enable_config=0A=
=0A=
To address this, introduce sys_enable_cnt in cscfg_mgr to prevent=0A=
deactivate while there is enabled configuration.=0A=
=0A=
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>=0A=
---=0A=
 .../hwtracing/coresight/coresight-etm4x-core.c |  3 +++=0A=
 drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++++++++++++--=0A=
 drivers/hwtracing/coresight/coresight-syscfg.h |  2 ++=0A=
 3 files changed, 21 insertions(+), 2 deletions(-)=0A=
=0A=
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/h=
wtracing/coresight/coresight-etm4x-core.c=0A=
index 86893115df17..6218ef40acbc 100644=0A=
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c=0A=
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c=0A=
@@ -986,6 +986,9 @@ static void etm4_disable_sysfs(struct coresight_device =
*csdev)=0A=
        smp_call_function_single(drvdata->cpu, etm4_disable_hw, drvdata, 1)=
;=0A=
=0A=
        raw_spin_unlock(&drvdata->spinlock);=0A=
+=0A=
+       cscfg_csdev_disable_active_config(csdev);=0A=
+=0A=
        cpus_read_unlock();=0A=
=0A=
        /*=0A=
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtra=
cing/coresight/coresight-syscfg.c=0A=
index a70c1454b410..dfa7dcbaf25d 100644=0A=
--- a/drivers/hwtracing/coresight/coresight-syscfg.c=0A=
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c=0A=
@@ -953,7 +953,8 @@ int cscfg_config_sysfs_activate(struct cscfg_config_des=
c *config_desc, bool acti=0A=
                        cscfg_mgr->sysfs_active_config =3D cfg_hash;=0A=
        } else {=0A=
                /* disable if matching current value */=0A=
-               if (cscfg_mgr->sysfs_active_config =3D=3D cfg_hash) {=0A=
+               if (cscfg_mgr->sysfs_active_config =3D=3D cfg_hash &&=0A=
+                   !atomic_read(&cscfg_mgr->sys_enable_cnt)) {=0A=
                        _cscfg_deactivate_config(cfg_hash);=0A=
                        cscfg_mgr->sysfs_active_config =3D 0;=0A=
                } else=0A=
@@ -1055,6 +1056,12 @@ int cscfg_csdev_enable_active_config(struct coresigh=
t_device *csdev,=0A=
        if (!atomic_read(&cscfg_mgr->sys_active_cnt))=0A=
                return 0;=0A=
=0A=
+       /*=0A=
+        * increment sys_enable_cnt first to prevent deactivate the config=
=0A=
+        * while enable active config.=0A=
+        */=0A=
+       atomic_inc(&cscfg_mgr->sys_enable_cnt);=0A=
+=0A=
        /*=0A=
         * Look for matching configuration - set the active configuration=
=0A=
         * context if found.=0A=
@@ -1098,6 +1105,10 @@ int cscfg_csdev_enable_active_config(struct coresigh=
t_device *csdev,=0A=
                        raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock=
, flags);=0A=
                }=0A=
        }=0A=
+=0A=
+       if (!config_csdev_active || err)=0A=
+               atomic_dec(&cscfg_mgr->sys_enable_cnt);=0A=
+=0A=
        return err;=0A=
 }=0A=
 EXPORT_SYMBOL_GPL(cscfg_csdev_enable_active_config);=0A=
@@ -1129,8 +1140,10 @@ void cscfg_csdev_disable_active_config(struct coresi=
ght_device *csdev)=0A=
        if (config_csdev) {=0A=
                if (!config_csdev->enabled)=0A=
                        config_csdev =3D NULL;=0A=
-               else=0A=
+               else {=0A=
                        config_csdev->enabled =3D false;=0A=
+                       atomic_dec(&cscfg_mgr->sys_enable_cnt);=0A=
+               }=0A=
        }=0A=
        csdev->active_cscfg_ctxt =3D NULL;=0A=
        raw_spin_unlock_irqrestore(&csdev->cscfg_csdev_lock, flags);=0A=
@@ -1179,6 +1192,7 @@ static int cscfg_create_device(void)=0A=
        INIT_LIST_HEAD(&cscfg_mgr->config_desc_list);=0A=
        INIT_LIST_HEAD(&cscfg_mgr->load_order_list);=0A=
        atomic_set(&cscfg_mgr->sys_active_cnt, 0);=0A=
+       atomic_set(&cscfg_mgr->sys_enable_cnt, 0);=0A=
        cscfg_mgr->load_state =3D CSCFG_NONE;=0A=
=0A=
        /* setup the device */=0A=
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.h b/drivers/hwtra=
cing/coresight/coresight-syscfg.h=0A=
index 66e2db890d82..2fc397919985 100644=0A=
--- a/drivers/hwtracing/coresight/coresight-syscfg.h=0A=
+++ b/drivers/hwtracing/coresight/coresight-syscfg.h=0A=
@@ -38,6 +38,7 @@ enum cscfg_load_ops {=0A=
  * @config_desc_list:  List of system configuration descriptors to load in=
to registered devices.=0A=
  * @load_order_list:    Ordered list of owners for dynamically loaded conf=
igurations.=0A=
  * @sys_active_cnt:    Total number of active config descriptor references=
.=0A=
+ * @sys_enable_cnt:    Total number of enable of active config descriptor =
references.=0A=
  * @cfgfs_subsys:      configfs subsystem used to manage configurations.=
=0A=
  * @sysfs_active_config:Active config hash used if CoreSight controlled fr=
om sysfs.=0A=
  * @sysfs_active_preset:Active preset index used if CoreSight controlled f=
rom sysfs.=0A=
@@ -50,6 +51,7 @@ struct cscfg_manager {=0A=
        struct list_head config_desc_list;=0A=
        struct list_head load_order_list;=0A=
        atomic_t sys_active_cnt;=0A=
+       atomic_t sys_enable_cnt;=0A=
        struct configfs_subsystem cfgfs_subsys;=0A=
        u32 sysfs_active_config;=0A=
        int sysfs_active_preset;=0A=
--=0A=
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}=0A=
=0A=

