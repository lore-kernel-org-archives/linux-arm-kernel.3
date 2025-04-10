Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2BEC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:CC:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgujGKQaZHM5v665+0sEk+GhMWfzRpIGL2Y068mqhkU=; b=FRqn0AR22/6YjgVsNxEe60kpls
	znUpNIz/9zv6djriivyS+ekDBW3sas2lszDWjZLy5ibTbIIFWaPh4AdtbbuMI8JcCTBVC5bHeY+9Z
	Ayg0wKRkfgSuhRKBf5F7xD+RWpSWBUvlg7MWUHNYo8aGCh1E97ukdFDwGYlOGOO8xNTdQ9CEB9jnH
	WKl0dZzBo/oTu8MgLoSlx8KiZbccT4y1dWdaPcO1Bv0Ml3qu1rgviDANKi+wfXBmZzJzeSGfvBQSO
	vyoZ7xgjYsRt8CMpjb9++48/le3wSWe7m4s/LVHoT3HqpdkejtrYRgP9ALvj1hzoJRYZqwQNl4p86
	RyJMXuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2kzT-00000009K5l-05sk;
	Thu, 10 Apr 2025 06:02:19 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2kxd-00000009Jss-3MJF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:00:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5mAMLRt0FwT4SohwSgH9v/ZY1/8LLleP3F+zpWHasS9zkjSfpmfIBT7JBqCy7YAW/0l4pn3grsR/QgGu0SJ4Tix4hOGrr28tZ++RuuNgNGe3DaZdb7C4Kn//HNupQ6dnWsK8qdg3JplrZwEv/Tpo5WXWNK4/CghQ4h5RbslQ1Y+NkpdsWfDq/eSovozYeMlnkuWVIyE1/THv6V9GMB5UYwbzoYpf7i8n+cCw1QesrnQsO7gKANQcm2skYFW9u4nOesmBw95GqBxJCcC1GJkfPNdDALuC2oEbdL8ROynwD9DM5ahFM9hp6IoaBnjM/73kRWbeV8t59k08FsKD7zNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgujGKQaZHM5v665+0sEk+GhMWfzRpIGL2Y068mqhkU=;
 b=ECbkKfBLxMDyCocMV3+830QIIrHh3xWgY3sf/8b/Glc1HgCojTwvugGUH9hqKKtNKBNHlXzMOsJrqL1uRLpvPIElnYkbgtMqoJPLKD9R36WkSghyk64hVvv7b0gLZF4vlTKNSL43s19w90xZgy57wJxHbqTQ+BWUdTrCWA4QgDDejFNPSP7v9vnwyv1l7JtXYlyhY0GubtrXPOhhVtWypW3ywQKemTwk32qwXngR5hqDOA3yjb1mMNibL5XUHAuWjy9uU9LNZzYb8oQOF6ivkzpBoVwjzRPHu/4T23HdhHmkhMPBtgUib/WCp+o6QAgk1MuIxG2UWnUaPsj0oseDsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=topic.nl; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgujGKQaZHM5v665+0sEk+GhMWfzRpIGL2Y068mqhkU=;
 b=luPyqL1v+aoLmv8csno9cQuauN3GKBi7nhoi+Ki1MQK1k4h7sJ+vOo/9S/LQ3uIRhaxQDcj/QOMsTlMD6Z8h7U+I7bVEc8k3ELZtOmzi1Hr7Ui4jRigkEQIMJbveIsbGOQEe3RhDk+UVVzPAIPj4+5Tb3qWwf5WOI6kf1xTQu8edMkLDjphzWtEqA97SCiwt7FwGRWBYomUaAxZE0sPd1WLaNQD0RDKLv0yTDdgm++L4oMGLyyg+ovdCuf7rMdiode23/iPmqNiQ0i+VqEqWpdwNK2xEU1sxi1UZovyQdVyMn+6C8NWeKbs93H2FgXDJo/twZe/vQm4CM/TEqqmcjA==
Received: from DUZP191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::12)
 by PA1PR04MB11010.eurprd04.prod.outlook.com (2603:10a6:102:490::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.37; Thu, 10 Apr
 2025 06:00:17 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::87) by DUZP191CA0002.outlook.office365.com
 (2603:10a6:10:4f9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.23 via Frontend Transport; Thu,
 10 Apr 2025 06:00:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.13 via Frontend Transport; Thu, 10 Apr 2025 06:00:17 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (104.47.51.238) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 10 Apr 2025 06:00:15 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by VI1PR04MB6925.eurprd04.prod.outlook.com (2603:10a6:803:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Thu, 10 Apr
 2025 06:00:13 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 06:00:12 +0000
Message-ID: <3a5535ff-01ef-4b1a-89e6-43b9aee2636c@topic.nl>
Date: Thu, 10 Apr 2025 08:00:12 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v3 1/2] pcie-xilinx: Wait for link-up status during
 initialization
To: Bjorn Helgaas <helgaas@kernel.org>
CC: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250409151754.GA283974@bhelgaas>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.da2da543-dce8-449e-afde-05bbc4daad2a@emailsignatures365.codetwo.com>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <20250409151754.GA283974@bhelgaas>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR04MB8644:EE_|VI1PR04MB6925:EE_|DU6PEPF00009526:EE_|PA1PR04MB11010:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bff1e8a-9e52-43e1-f6e9-08dd77f4f806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?S3BKcEkva1JYUC9SUmZvTVVEZjlIT3pFZ2syb3hFYTdmQ3ZDek9YZ3Vmdk9z?=
 =?utf-8?B?aWthQzlKMDdjbjdyK1JNOGxRVXlCU0RNcnZDMjdpUmJYTFIzTzFOWk5aVWVv?=
 =?utf-8?B?MVJqTGdUd1lIYnVOcnNtTG1pRS9KTmc5VHl6dGU3NTFKU01QV3p5SVp3bDNh?=
 =?utf-8?B?eWEyQnNEcmhUbU5sVUdpYTM4aFR3YmI5L2lCZzZmays2MHUxSGVkWW14QnhE?=
 =?utf-8?B?aUNwanh1WFNUQi9oVHhheWtSZjM0R0tmWHA0ZTZlS2VYd0hScllqWXpRNFNM?=
 =?utf-8?B?Nk81QkdQSzd4bDRUcmVUSUVUWUttYnFmVXlUUS96YVlxMHFFWW1sZW9ZSHhG?=
 =?utf-8?B?UUNuQTl0eW1na0hUS2g5SnlMcDQ5UjhNQnozQXBZR3Vva3BwU210R3kzVk1I?=
 =?utf-8?B?TWt2YnFYd1c0U0Y5aU9lM1N0bGpyV1MxSmVMejk1YnRuSkJ1bFNCeDI1M0Z0?=
 =?utf-8?B?STRRL2lWMUxTcFVzRVpwOGduVXRCODN3bFV6eUNZbU9RNENjblk0b2tqQnJJ?=
 =?utf-8?B?YnN0UWdLRm5EcHh0Z2twZmpzbDloa1RmeUxuR3NqdDI3WlRndGlYTkJJVUEy?=
 =?utf-8?B?RTg1dXdxejRlTnExRWVRaU5zem5xU2lMT3FFQTYxSUYvdkdWeTlSaXZqT2Zv?=
 =?utf-8?B?bGVPcFV5Vk5CR2ozbjNwN3Z1a0lBalMyaEIyT3ZlTTJyTmtVWmdIREtxdy9o?=
 =?utf-8?B?ektTeDdDcC9Xa2kzcGtZZ3V2K3ArWklMY2JneVVPN2tpMG12QmZTSWFsRHkw?=
 =?utf-8?B?cEdEZGtxRUoySloyU0tWMVcyd0grTkpLWHlWeHhxbVRzTmRxOGp0SVA4RERW?=
 =?utf-8?B?MDlYRm14U0QrK05LYllNc3k3WUVldXh3R0NpVEhJZk5BTHBDckR1ZXI4QnFt?=
 =?utf-8?B?UldjUmxzeEUxV1RsNlJNUnpVQW1xc3VMUmxBRjdCbnNsd01ScTNTQmVxRjdx?=
 =?utf-8?B?MkFtZzJTbHhNYSs0ZXJCVGNNNnVzMmttWkVoZk1OQmw4TkZNUVdWR3B3Q1JM?=
 =?utf-8?B?ZTc1UEdOWEtQSVlWUWRoYjAvcEREdEtFTlYwUUxta3IxaGhxK1hScURZcSth?=
 =?utf-8?B?SFNJdHFETUgvUnZpZUYyRTNucHk5SXEyczVuL0xWNWtGZ0JOWlowODE3ZGYz?=
 =?utf-8?B?UUNpenM1Z2FIM3FLZDZKRGVPRVZibW1id09lcjhoSWR3Qy93ZTZwWElOemlu?=
 =?utf-8?B?VE1FN0IzR0R1Nldpb2JnbWVIc2pBMWNXU1U2akZUWXRUUTgxN25OSDhpTW80?=
 =?utf-8?B?d1VMQStaVmxPWUhLRTI1V0hlV1NjRHl5aHNta3Y4cXdGd3hjRXpoanNIcDY4?=
 =?utf-8?B?R0t4c04xS09xa3JFL2VOQnNXOVU5SjN6QnJEQlVVNkhMSXZ3SFl0dldCcWg3?=
 =?utf-8?B?ZGd5ZWp1OUJNMzRta0lWK3kvOTlpaGJ0YjN3NXV2RmVuU1hIT1dUREhFbXEw?=
 =?utf-8?B?UUhod3E1U0VMUjJyWTJoMlpibGEvZU54VTRaTjVCcHFvVXRpZVo4K1JxdDVR?=
 =?utf-8?B?cjJFMEh3UTdiNHlaMGNVL3hKVzArejZtVzJsd1psNHVBQ092Tkc0TWhVNUVl?=
 =?utf-8?B?VnpSTXVoMVZIZEkybkRWcUswUWxNWGc0NHJrNVFucml1bGM5Y2UxeGhyYmZI?=
 =?utf-8?B?WnBTYncxbnpVRGx2VVZxdlJNaFRGUmxnNVZhcVVvcXpYVytNcXFDV1ZsZE9B?=
 =?utf-8?B?WjJ1eHFHZFUrbG4rOGloM2Y2STVpWS9qLzBXMCswczFJTW16TVVrb25xZnMy?=
 =?utf-8?B?QXpkYmMxclpsVk5uaWdvSXA0V1cvbWs3YnlyTzcxWmN0WmZidENHbUY4OFdB?=
 =?utf-8?B?QmNJbUV4TGFYTGd0eWd6d0FTWUs0TVJxR1kvSklRTXpsZElucHhzR3Uxd3Ry?=
 =?utf-8?Q?DVcXukxi/nq5H?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6925
X-CodeTwo-MessageID: aebb71ec-0e98-4828-8993-c5dff1c60d81.20250410060015@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 42a6ba23-3d69-421d-98d3-08dd77f4f52a
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|7416014|376014|36860700013|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWFWSU9tZndaNk9hVnRSZGRKcGM3dTR5LzlYUGF3dnNaRGtwbEc3d0ZoODh0?=
 =?utf-8?B?b0gzWmlhMVpZbnk5dWNsVnk5STNQbFVzRFlQNFdDZkErNExjaklnbXpqdzFR?=
 =?utf-8?B?eWk2anFKR2FPenZ6aThnNWs2NC92dEhSTmFzc1dJSnVzck1RVjVjcHJRc1Zv?=
 =?utf-8?B?azdQMkJ3alBnVmU3Z0pSK0pyK2lwSjU1Nks5ZzNuak95Zk1rQ2dWVFkrQ05n?=
 =?utf-8?B?YXhRMlk5UThjY1FYYmtGOCtMcTByKzJHUHFCMUs3N0VNcEVCSWNIWm1aY3V2?=
 =?utf-8?B?aUxFMDNWM3lJVlB2bHRZSHlFSVQ4bkk4R3YyR3phYnJtNzl2NkVjOUl3VFZE?=
 =?utf-8?B?Z1ozVzNXVW1MKzV1R3pmekdhbmYzdHZueE8vWWFWdTIzVk8yd2lLYnpyS3Zh?=
 =?utf-8?B?RFo5MUo0YXA0MTR4SCtKQXZ3UjJqN1JtOGp3aTRwZW1RK0w4Q0ZLWG9pcGNu?=
 =?utf-8?B?VWdjR1dBcWFLMXd5Nzlxd0psVldwSFE2d2RRQ0FtZkE0UURRQytCbFlVMDlM?=
 =?utf-8?B?V0RpRHRLbHE4Uy9qenRkdTBsR0JXOVFkYm5rRDRyU2NXOWZ5MjJibGxjY0hN?=
 =?utf-8?B?ei9Ga1RFandzWmNxb3FrRFczVkFhUXR3TDFibFpOUFdjN2hoREladlZSMnJR?=
 =?utf-8?B?RFpQRmoyQVpGckVtejRoeUF4UUxmMWRuMVhjK3dVczVZK3h5QUdMVHVwRWFl?=
 =?utf-8?B?OGgvK0dyZUw3ZkJHTHkwQjJ3VGZJZmVOQm5uZ0JEYzNqSGFLdEpnS2dJN1VW?=
 =?utf-8?B?RkJwTVFJelRoOWdTMVgyOUpjOGQwYytSYmo3czRYcHdiaWVvZ2hSY0dJc2Nl?=
 =?utf-8?B?cHlqN095YjBYaTBSS05XWE95K0JjMnRzYytSOUgycWRhcUQ0MWZlWmJBZ1hE?=
 =?utf-8?B?aFN5Q2g4ZDVzeEZuYWU5WWJFbXo5M25OUmlkZTZaVXZpcjhaQW8vMlNoOVJz?=
 =?utf-8?B?K1RhWDk3eGZTVVh0aHp6T1JSUHNrakRFems3Q2hSVitwYS9tdVhUWlBvenJl?=
 =?utf-8?B?ZC9id0Y4ZC9nWGJMR3p3b2ZxMzFWYUJRbmdwTkluUUhkVXkxUDU2QUczd1NN?=
 =?utf-8?B?WVJHS3drdUZyK0UxOXdBUnlqU28zVHhIWlB5RGtDaXVSYmVDQk9lNmZHRDJP?=
 =?utf-8?B?RTRnVGord1BsNkd0dU9tdGxsZDlTL201Y1YxY1BjbDkvODBVdFoweXdsSm5Z?=
 =?utf-8?B?cGk1YVBqV1QzaStCeVpDUWMvQitqVStBTWhWd0Mrd2FuNkhLSnpEYjNsbVpz?=
 =?utf-8?B?Z0JsVWIyanRXd2N4WnNwSld3dndZOE1UR3h5UU1VMVNHelJpSHZuM3l2ZmtL?=
 =?utf-8?B?a01iaEgvcnREOEZsOTBlZ1Jvd3N1cGpkM1dNcllidXNUd3A1TWtPZml3ZlFP?=
 =?utf-8?B?V1JTRW95TVpGdE5YMmxJWlBXOVExQk5sOGpWK1JpcjNQZVNPZjFLZ1lEam5q?=
 =?utf-8?B?SHhwZURucEl2YkdoTldUeFpyT3pSMVkyeG04TVpFaEZ2RmxBVEdKbUxpZHZ5?=
 =?utf-8?B?ZmJJSXJSb2RtTXNiL2w4Vm1sSW5QWkp5eHE2WWpEZi9DQ0M4UnF6NHFicVRn?=
 =?utf-8?B?UVR3aFhXRGZod0ZUN2tuUkpYeXZJSy95VnRiS21iMWptbEMyQkw5VDRhWVJw?=
 =?utf-8?B?OGZpZnJodk9PQmhrWlBScnkyTWxQSjFCS1JmWTVSaWlMUmZoYTNkYW43dm9p?=
 =?utf-8?B?c1VJK2puVTJuRGZ6cWZzQ3RTTnNMZ3hsWXFxME9xOEJiL093YUUxb24yYTdP?=
 =?utf-8?B?R0N5bmpCQ2xUUlhGTS9Vc1ZPbHF1eW5abE9TbVY5OWkyNHNNTjR6cVVMUkVZ?=
 =?utf-8?B?LzRadWo4SjdINnl6THhHaWxieXR0NVVkaC9LRGVLVkNHTWtHQUswSnVUV2Y4?=
 =?utf-8?B?YnlEMFFJUU5PTFVZYlFXUHovVzhtT0dVVFVSNWkrZjZsTzE4djFCdEdmSEpX?=
 =?utf-8?B?aUJ2TDRkVEE4Ni9EUFVlSHFxS212TC82MGY2UG5QNU5sN256Zm4xRFY4K3Rx?=
 =?utf-8?B?SlV0WW05L1RnPT0=?=
X-Forefront-Antispam-Report: CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(7416014)(376014)(36860700013)(35042699022)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 06:00:17.1222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bff1e8a-9e52-43e1-f6e9-08dd77f4f806
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_230026_272629_D5A2570C 
X-CRM114-Status: GOOD (  24.93  )
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


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 09-04-2025 17:17, Bjorn Helgaas wrote:
> Please make the subject line match previous changes to this driver.
> See "git log --oneline drivers/pci/controller/pcie-xilinx.c"
>
> On Wed, Apr 09, 2025 at 04:49:24PM +0200, Mike Looijmans wrote:
>> When the driver loads, the transceiver may still be in the state of
>> setting up a link. Wait for that to complete before continuing. This
>> fixes that the PCIe core does not work when loading the PL bitstream
>> from userspace. There's only milliseconds between the FPGA boot and the
>> core initializing in that case, and the link won't be up yet. The design
>> only worked when the FPGA was programmed in the bootloader, as that will
>> give the system hundreds of milliseconds to boot.
>>
>> As the PCIe spec allows up to 100 ms time to establish a link, we'll
>> allow up to 200ms before giving up.
> This sounds like there's still a race between userspace loading the PL
> bitstream and the driver waiting for link up, but we're just waiting
> longer in the kernel so userspace has more chance of winning the race.
> Is that true?

No, that's not the case here. The PCIe (host) core is what is in the PL=20
bitstream. Devicetree overlay and FPGA support take care of that part, so t=
he=20
PL is programmed and the PCIe core is available when this driver probes.

The issue is with the endpoint on the other side of the PL, most likely an=
=20
NVME drive, WiFi card or PCIe switch (nothing inside the FPGA, the purpose =
of=20
the PCIe core here is to communicate with something external over PCIe).

The endpoint gets reset by what amounts to black magic (external circuit,=20
something in the PL, or just nothing at all). This driver assumes that that=
=20
has already happened, and immediately starts training. This works on Xilinx=
'=20
reference designs that program the PL in their proprietary bootloader. If t=
he=20
PL was programmed from within Linux, this driver will probe within=20
milliseconds after programming the PL, and in that case, the link won't be =
up yet.

The second patch in this series adds a PERST# GPIO support, so that the "bl=
ack=20
magic" can also be replaced with a proper reset.


>
>> @@ -126,6 +127,19 @@ static inline bool xilinx_pcie_link_up(struct xilin=
x_pcie *pcie)
>>   		XILINX_PCIE_REG_PSCR_LNKUP) ? 1 : 0;
>>   }
>>  =20
>> +static int xilinx_pci_wait_link_up(struct xilinx_pcie *pcie)
>> +{
>> +	u32 val;
>> +
>> +	/*
>> +	 * PCIe r6.0, sec 6.6.1 provides 100ms timeout. Since this is FPGA
>> +	 * fabric, we're more lenient and allow 200 ms for link training.
>> +	 */
>> +	return readl_poll_timeout(pcie->reg_base + XILINX_PCIE_REG_PSCR, val,
>> +			(val & XILINX_PCIE_REG_PSCR_LNKUP), 2 * USEC_PER_MSEC,
>> +			200 * USEC_PER_MSEC);
> There should be a #define in drivers/pci/pci.h for this 100ms value
> that you can use here to connect this more closely with the spec.

That'd be "PCIE_T_RRS_READY_MS". Experience learns that adhering too closel=
y=20
to this spec is a good way to make your system fail though, so most host=20
controllers are more lenient, e.g. rockchip uses 500ms.


>
> Maybe there's a way to use read_poll_timeout(), readx_poll_timeout(),
> or something similar so we can use xilinx_pcie_link_up() directly
> instead of reimplementing it here?

Other way around would be easier, just call this again when it wants to kno=
w=20
if the link is up, maybe with a 0 timeout (which allows the compiler to rem=
ove=20
the loop).


>
>> +}
>> +
>>   /**
>>    * xilinx_pcie_clear_err_interrupts - Clear Error Interrupts
>>    * @pcie: PCIe port information
>> @@ -493,7 +507,7 @@ static void xilinx_pcie_init_port(struct xilinx_pcie=
 *pcie)
>>   {
>>   	struct device *dev =3D pcie->dev;
>>  =20
>> -	if (xilinx_pcie_link_up(pcie))
>> +	if (!xilinx_pci_wait_link_up(pcie))
>>   		dev_info(dev, "PCIe Link is UP\n");
>>   	else
>>   		dev_info(dev, "PCIe Link is DOWN\n");



