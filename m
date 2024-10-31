Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C1D5E6895D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jodImk9bZdd1uS46rPT0HskxuCQQy37qKL5c8r4OT/c=; b=gnE16HFSV+kiYZv7UlxCe1ZYUZ
	U+7TxGIuYB6+55yW+D/UmMzigRkfwHGgTZxEqOUS2re06CU028DRRRanT9jNvn3ersgF0rrzngI80
	Bpr+2uOm7Wlog101YNHcVQDnUGOqckpnBK7mv72fPBRaC1JjftumhC0WL3+ctwPMoQ+wLJK1X1FZD
	jvehX2LjD8vAjc/uZQLae+qOKvxmnVs6/1xk4BqeKbMqUs2IrHHU7pppnTLhGNYZBs/QJpjvqR+QN
	OUpDgdlHdROH1kCd03oY09zGMuUJP2qulnt8o3Ybmqym6c6Jg77t4S/34ADQh9L2BPrf0xCrU8Jmr
	9UHlwCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QiN-00000002y7T-0WFb;
	Thu, 31 Oct 2024 08:39:35 +0000
Received: from mail-am0eur02on20601.outbound.protection.outlook.com ([2a01:111:f403:2606::601] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Qf5-00000002xUe-2X1z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 08:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWzVBmadH4XFgLtS+DBLD+LWgkUgJZmBJhx0IPMqhUeCYx688Hk8taHthfJVjb36+VVGhjHlAKciLhfAVcTQbV8BAgPXHuNZtW8Ef7+JJJKNQFoyYUqkc/lYwObCEc0orUmWnKZPnmaZB4MhpZolsUrK79/8RdkXLyZt8p0Qb9WckccZADBjyxC6WeYddh7Gcb+KQP4kJ4cDVNhFRKgVswd0TyFy3RmsIps8Syg/v8AXtMGMndDLdUlkuD6XRrFA8XBI4zLHn7zPGC76IMJf8bNouu5galP/OjOA4TTrPVAJW/PbGu7tMNmzuolzqzRk+woff/aNqbVmsNqnGzLODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jodImk9bZdd1uS46rPT0HskxuCQQy37qKL5c8r4OT/c=;
 b=VgYdyVWlAG235DnQov50Hyxg8zexcQ+YtY22c2hmLKFOsaP/+qlEkLwQj/j1/e5DSgSssU2DAtWvY6z/T4oWU0rXrBmyaDT+vbJORzSmFkKOpB/gC/YIg3RzVVq9q9QycxsX0cOCez2kUFp8+ePoN/DxIS25zuYks7DiDCiKM2hEK8tVvuRanJTT0NUpRJAx6DZieqtBZk5frFqeynyxIEvs3edWqt/ObLzZ+SypxxEqX1l/PSsUUt2iWcoL0bftJjN8sCWCAkNa0O9cDuD/WdrkcbJUiHDRi2Z9P7RcJsOk8Cf+wB2uhJRr3cyoOPHFFr1eorRs1NqodLAS4sj3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jodImk9bZdd1uS46rPT0HskxuCQQy37qKL5c8r4OT/c=;
 b=voREhIsDIDGPU8oiRUbssg0IPQCrJUbeqHYTHFm1OCArH7tpiwV8+nOit0xa98lq/ZT27nbdkgRquY7UwEkSwQBkyVDYpyFpHrH5hZMBw1ViapcqeSHaWX/5CKAmG2EWmM6v8iPdgt6e4E3YlHQZ+ob+mVEEMUb2wkWaNpCuC98oVmKGrZllpTkNBf7HOdUBVfjLSZK/9UsxZIjyL6B6R9v52Ywf9UZ6o/KmqWWU0CxShmHfEteEgBiheu2ny+Q79uhxQQUs70hw6oa7/dR5uJpIKga5EtvyYxikgFGi7C1lyLnAEqsJ9EGq1OxekME0HHoW+qel12riFBeSyofOQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by VI1PR04MB7199.eurprd04.prod.outlook.com (2603:10a6:800:11d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:36:03 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8093.025; Thu, 31 Oct 2024
 08:36:03 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 1/4] dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
Date: Thu, 31 Oct 2024 10:35:54 +0200
Message-ID: <20241031083557.2156751-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
References: <20241031083557.2156751-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0109.eurprd04.prod.outlook.com
 (2603:10a6:208:55::14) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|VI1PR04MB7199:EE_
X-MS-Office365-Filtering-Correlation-Id: dd22899a-bb82-4732-c950-08dcf9870de1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0ltZnN2dDZQVmRLNDU0dVFvUXFmbFBSL3lqU0I2LzluN2wxMHhLVk1DZXIv?=
 =?utf-8?B?WVFZcjhCNm9uZWlOWklxRkJvZ2YwZjhYTlpZM3ZmaDUwT05oajROVkZtQTFm?=
 =?utf-8?B?MHJDQ2xkSTM1N0pBQmpSendFeDZsVnlBcnVyQUdqSGdyNkwyV2VxNkFvWDJn?=
 =?utf-8?B?SWZJWDlWclNvcHpLd0gzSCtiZzFYMUhXNWZNTWdYeHBaQ1hCM1BhWmVSZ0Zx?=
 =?utf-8?B?bTVZNmpIODArOU1ZSWQyMGRQSEkwdmlhQUhiM3JmL2xXYnJFa3pUTFBxV09C?=
 =?utf-8?B?R3dkUEY2Q0xRRXpMVnhtMG8xQitqOU5YZytCNTdmUUVJUG5NNW40V0IwaXEx?=
 =?utf-8?B?K3p2aW1HRHpCNnIyN3RKV3FTOHRWNnNxanVLeUxKYXRmNWp1VldNQzVOZkVq?=
 =?utf-8?B?dklpa0lCSVhpM2Y0anNJb29iNkxodHEyT01hNERzMnJSRC9xNmUvZjFxVm5H?=
 =?utf-8?B?UmhJcmlKR2NqUkpsYW9vb09XRmtTVmo2N3czR1lEb3NJbkUvK243blM3cGJn?=
 =?utf-8?B?b0ZkSDhIMUxtcXd1RkVLZmFQYXc3RHY0Uk90RWwwUXNBTmNOOW9FUmdoc3Mr?=
 =?utf-8?B?MjZkR3d0MnZmbE8wSmlHWFZLVmUzVGs4NzFzd1NGSkdxVm5tbmQ4NGp5K2Qz?=
 =?utf-8?B?WlFuRTRtT1ZjcmRCdEpwRlRQMGx2VHNkeEVlbDlnVjVqMUFzTVhkcWlBK2pK?=
 =?utf-8?B?YTNpeEw4MkFlZks4LzVYcHZ5a29oM1I2WUMydy9EbExUZEhSbHZpbk9kb1ZJ?=
 =?utf-8?B?eFB5REtGOVdoWnk0bjg5R01nZFNJcU1pcitpOFQxbkRXTE4wOGt2R2FhSk1h?=
 =?utf-8?B?bloyUTRPUSs0aDNTV1YzVXVFOUxvU3hqenY0ampPVVM0NExmdS82dC9aclJC?=
 =?utf-8?B?NkJHYlZ6YWswdEZISGgrM1BjOHpnWlE5YkVoakR3djA5OXc4VXRYalRFS21t?=
 =?utf-8?B?UzFKd2pjQlVsbU5PcW5xNG1yV3llS2VQMkF5eVdCVWFUU2dIZXIyZDZMU05j?=
 =?utf-8?B?U04yNGxyYmNERGFPdE9idW1qcVBKTWMwV2N1K28yN2h0NHd2ZXpqVjZlNFNh?=
 =?utf-8?B?emJOQzI5cjVnZ0EweVdoM3hIT1AvVUxpUUVVK2x4Q3d4dEVhRXJheUJHcVV5?=
 =?utf-8?B?dEwwNUVXcXlBUGtIVER2S1VUVGMwTDlNa0JiUVA2bmFtM01KRjJWWUtZbVdE?=
 =?utf-8?B?eGM2OUhhWVF5Z3QxRXA4NGU4QTQ4dmwrbnZlMUhkejgxcUVkdzZ3UkRBeE9B?=
 =?utf-8?B?MHkwdG4zd3JDVGJ6OWR6ZGtUN1lIZUNqZHN1MmdNRTQ0bFRyWXRFckpPaEYv?=
 =?utf-8?B?anpVZzZSTzdRcDFBQjFGcmVyb3VSd2M1ZWQ2UUFDZXB1ZlRvdlpDZHU0alJo?=
 =?utf-8?B?bjFCRzJLUmluemNwZE9CMDd3UThrbmpKVUZzdGtvRDJvVDU4Z3JlalNKSmFp?=
 =?utf-8?B?U2RQWXpvdlJJdkhpc1hhc2hKQ1VWRk9SNG1ZTll4cU1wK1dwVmpJNFFXT3hY?=
 =?utf-8?B?VzZXaHB6djJVSzJDKzVrV25URHVKYzNnRjdjYTA0aUN3bmoxbTQwNklTcVRI?=
 =?utf-8?B?anFvT2kzNzVidGpQcG12MHArQU94ZXVTeEpHaFZUVU1WVUZtUnZHcWdYV1or?=
 =?utf-8?B?WE9qN2d6ZWJ0QmFiUzJlSGcrdi9WWnB2dFg5ODNLckt6Z1ZYUE1NY0JyU25t?=
 =?utf-8?B?ajVNRFFXZTRRc04rWWVtUDNQMFNJK2JKQmZtUldWS3RKdmtqTDA2NzJBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SW5Rci91Qk1CK1VMenpHK1pBUERUcEFQNkNoMTRDUGtQYjlXaVIrUkJKNmdT?=
 =?utf-8?B?M0tyV3hJYS94eURwai9OWmZDMUZJT1VmSmZBMjF3ci9jdSsyUDNnVm1obVF4?=
 =?utf-8?B?bkpSckJLUUYySlhBMDdwN1B6RFVqN0JrcXViYXNCaVZDMFByMU1PTWtWVFB6?=
 =?utf-8?B?Wno3S0R5YUZVSmtPQTRBaGpUQlI3cm5veEwvUmRTSDcrTzBOeVVpUGJ5bzdT?=
 =?utf-8?B?bWFkZVRNQVRoaE1zZkJuTnRNc3lBeXh1eUZTNEZyYlRqWm5RR1Y5SHZlWXR6?=
 =?utf-8?B?TXlCUUEwNWJTekt5RGpEdmxDVWREM0lmRlcwV3VqdmlSWVNQNW52ZmkyY3RL?=
 =?utf-8?B?S2hYRStSakNuYVNNTElKUTZaQXNHbk4rTHZ0eDllTzYvd3RFRkhFUmxXaERP?=
 =?utf-8?B?WWthNVpPUmlGNE9vS3R0UCtCMFNaSVNnUzZnTHRKWHVqQUVmNTlKb0ExYU5S?=
 =?utf-8?B?RVhvM0pGeHZXaTg5YmpqOXdXVzlUYnlJbG1JenRhRzVFWm9sREhVNUZSOEwz?=
 =?utf-8?B?R1djWWM4S2tSK1NhUCtKRDN6WTNYUFNtZHBUdjRCMDVPV2t1NS9HWWVzN2xU?=
 =?utf-8?B?OUVhZlcyQitndWpwZGpSL2lIY04yOTlXOHdTOE5KYnJRbDZpTEV6WDhXT0xQ?=
 =?utf-8?B?UnNRUldOQ1RBWHpQN3BCSWwwYTZ1YnRKR2JwR3ZVbDFQdzVDK2Z4dlBHZFB5?=
 =?utf-8?B?bDMxVXQwb3RzVTdtTU43U3dMNmpSZzMzbTNJaEQvTEZ3ekhyQk9DSmtFYlhl?=
 =?utf-8?B?Q0M4V2hpWnRSRDRzMXB4MnpJemJwSU1US3lveFE3bzJLL0Z3STkzYU8wbzJB?=
 =?utf-8?B?UDF5VU96M1htL1puYnZWZDg3dTN4ellyb1UzS2JvOGJyVUJ5ZWRrUE4yUU16?=
 =?utf-8?B?WU1GN2dQZkh1Y2k5eFNPa3p2MU5LTDNUVktXbE53M1NDdm5nMWZ0bG9oQ2RD?=
 =?utf-8?B?ZnlhOGRrSC9NdExmZi8xTmxOeGdWQk1aS2I2UDlaS0kvR1J2SVFXeThpRnZt?=
 =?utf-8?B?aXJ6VHdzNnlNRzlwdkt1VU9SamFFOTJiQkpqUWMveVZ6RHg2YmVqa0w5emZ5?=
 =?utf-8?B?emVwWTZTWDhUbmtwNmh0cDRvTVRhcWU5K2t1TWoyRUkvY3l3eU1aRUZma2d5?=
 =?utf-8?B?WnFPcHRnYzZpamkwR0kzSE5lVWtkWW9IeDQwSUozbWcvY1BWUDEzczZoQksy?=
 =?utf-8?B?cEFGRFZwOVFtb21DZWNmenB0ZU5oTlk1L2owWUJKS2xHTjRMUWpPWnpraTNH?=
 =?utf-8?B?cDVCNWxzM3B3V25sZzZjV3hJVTZ0cXFRL042M2dMeEpidHRKUmxoRnRwRUhO?=
 =?utf-8?B?QW5rZmxScjBGaTlZc0tyOXFxQ056enQ1c0tLV3U4dUlXZWFLVW1Cd2tSYjBz?=
 =?utf-8?B?VW1Uc3hwT1M4RlBlRXZ0cU9DUHdVUDhRV3BmL3hYTlh3N3NSNjFwK1hPdGNt?=
 =?utf-8?B?OWwvcFBHV2NiR2RncFBXdlEydDFlY1ZmMDczSk9pSnZYNnpUNWlFcE8xS0NY?=
 =?utf-8?B?SGwwS256VXpiRG5Eb0ZXSmZpc1RReHZpZjA5d1BqZWdTZmM2ZEk2bm5vRk8z?=
 =?utf-8?B?dERwd1FIWWdwa2xYdURMdkVZVDV1VDB1Y25oY2thRGNpVkFpZEJRdlh6WDQw?=
 =?utf-8?B?eVlaOXdTYmVKZHNjTmRrMVF0K1JuOEtESlJWc0ttSEk3OXl4WE5BMWdPZzBy?=
 =?utf-8?B?c3l3TFZmakRoWGVrb0I2WkZHVkRPNlBWQjc5RlFBTmlFTERBdlk0cnRpYzZS?=
 =?utf-8?B?SlIwUURIZjQ3NC9LTVI3UlF4STlSYlZwWkMwR3o1b2FzTmxYREJRdkd0N3c2?=
 =?utf-8?B?b3pLQldWVXR2SDZSSzNxV2lZQ0Rqb3JTeUF3QjVRK1pxQnM3c1VnTFNsbU5C?=
 =?utf-8?B?NHY5cFliVnVMOFY5dUZ5ZmxEeXhyNW5jdy9meUlJaXpOU3ZmYnNseGt2d0RR?=
 =?utf-8?B?NDRQaXMvSGpBNDYvQmdSTGVCOWNManIyTWREVTg0NDRXUU5JTkhvNVFZY1o3?=
 =?utf-8?B?TXIvOXFOMkUvblFRUU1rNGdDc085QkJFQ1V6MkhxTDNvaXozMGhFdWdFL1Ny?=
 =?utf-8?B?TkVHTktReFgvM3FLU2FXTS9hR1EzK1d5Y3c2cVFMMisxY3d0N3RSQ253OTdL?=
 =?utf-8?B?ejJnSHZJOEdWcll4c0tuMW5uTXUwQjdPaGFwNGUyOGZZaHR2NWUyalduQy83?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd22899a-bb82-4732-c950-08dcf9870de1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:36:03.0258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dwfkyz0AwA6fFCCKkwjGE/h3v/PGefPIS0Fz1vSvaR8PpoC5FkkLqj3BuV0272BNnTGES4yXfX9Xi7QzHBGfcaeemMLnKMVOuYlJirtxLTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_013611_678955_9B5E9E13 
X-CRM114-Status: GOOD (  16.32  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch adds the dt-bindings for NXP S32G2/S32G3 SoCs RTC driver.

Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
new file mode 100644
index 000000000000..3694af883dc7
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/nxp,s32g-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2/S32G3 Real Time Clock (RTC)
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-rtc
+      - items:
+          - const: nxp,s32g3-rtc
+          - const: nxp,s32g2-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    items:
+      - description: ipg clock drives the access to the
+          RTC iomapped registers
+
+  clock-names:
+    items:
+      - const: ipg
+
+  assigned-clocks:
+    minItems: 1
+    items:
+      - description: Runtime clock source. It must be a clock
+            source for the RTC module. It will be disabled by hardware
+            during Standby/Suspend.
+      - description: Standby/Suspend clock source. It is optional
+            and can be used in case the RTC will continue ticking during
+            platform/system suspend. RTC hardware module contains a
+            hardware mux for clock source selection.
+
+  assigned-clock-parents:
+    description: List of phandles to each parent clock.
+
+  assigned-clock-rates:
+    description: List of frequencies for RTC clock sources.
+            RTC module contains 2 hardware divisors which can be
+            enabled or not. Hence, available frequencies are the following
+            parent_freq, parent_freq / 512, parent_freq / 32 or
+            parent_freq / (512 * 32)
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc0: rtc@40060000 {
+        compatible = "nxp,s32g3-rtc",
+                   "nxp,s32g2-rtc";
+        reg = <0x40060000 0x1000>;
+        interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+        #clock-cells = <1>;
+        clocks = <&clks 54>;
+        clock-names = "ipg";
+        /*
+         * Configuration of default parent clocks.
+         * 'assigned-clocks' 0-3 IDs are Runtime clock sources
+         * 4-7 IDs are Suspend/Standby clock sources.
+         */
+        assigned-clocks = <&rtc0 2>, <&rtc0 4>;
+        assigned-clock-parents = <&clks 56>, <&clks 55>;
+        /*
+         * Clock frequency can be divided by value
+         * 512 or 32 (or both) via hardware divisors.
+         * Below configuration:
+         * Runtime clock source: FIRC (51 MHz) / 512 (DIV512)
+         * Suspend/Standby clock source: SIRC (32 KHz)
+         */
+        assigned-clock-rates = <99609>, <32000>;
+    };
-- 
2.45.2


