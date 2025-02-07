Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9432AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=; b=YukOV1R2tXNqqWhIGi1S9BT6t4
	gflQmL0k4edXBR/JYwTrIzT00dSpvHaGP0qU/QpC7LcaO992v8TPO135orccDMKFy3OKlorgcyr5u
	VmeEg6JIs+JgN/zzxr8kt+E/HuhJXfVor/6Sh7jBawZySJrS5sHa6Y8f+QF3WzIb26fglZGhIpwFJ
	z08/ObIqpSTwbENEumfV1SyKABjWn24Bs6TAM30VDnFAyuIt1DIwNqDAzb2haaKM0uGKXN4vN4Cba
	3FdJp0A1UPN8kx25GKotGgeC6HQM59KoetuutmhjXakPhdQBHVXiBM+Eunlw1BC9wTWwp7ufikr7i
	lo8wgONA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRkF-0000000AP7G-3hwu;
	Fri, 07 Feb 2025 17:02:23 +0000
Received: from mail-am7eur03on20618.outbound.protection.outlook.com ([2a01:111:f403:260e::618] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgRNI-0000000AJwX-1Qmv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 16:38:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8EcVZW0oVtYFj9jtUpQMYt8MAsEMV+/s8mWDewBQnulCT973VMr3t2hA3ni2LvvPE8o7lIEgdCvqJPO6em43ipOWAfTrTFTghlCkdSSEdqCwUGwk+g+YtvuSSfxB3J2HmG6KVcMstPZx4C7skatnjy2nY6qz2PdRwUK1sjlpOlac+Cp1V/oEkqKWiz5c2L0gKTgg5aIOrAW/VCLFO7G9sTPLg2+rTnqJ3RlYfHP0HUsAekOETWnQYY40Gp8EJyHWdoqDzlPvZQAVcrI1bWoIIzZ+HV80qHCnfMlO/jScEEv9NXh3whX+0goPm3MmqG+TuS0v4qANxFtTMd4JTOVpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=;
 b=wkUVtBn2rcugcZIxC6g2e3F4G6+dVSQ7IyoayRc9jQ0FUWZK0R9Wqa9jICJtGD6WwKnaCW73dunanWXIREYHA6+9HpWVPuUVAuLgeYlTf+7gCiNievyGjdWJpOizpc8OedCmXBA1A174zpQfKZaSI/NlqRP8WLOKJRMG5yCU5qL2gG11UpPfxdEWq+aZXQKalchhGEVMD4bFuKBzhZNH0w5T4kGjE+I1u2ZmZl2GQOfB4TdG0UfUAxo4oZeckozrFitj1HvFoJhtcQthopIvkqOw05IHpG6oMuaOsnE2c+f7lyv6nZ/zQdOEQ1lLmBZcMASo3CsC9JN7u9cd8u93Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrvbbjDEfYI7M4Aepm5H409LTkOnMYEJPjIxD3CWMWo=;
 b=L9l8fsmGAj+aTCNAFt0E8lXfDHQXk7+Txw/CogTCGB6wNbiuSzh9Sg+u+hrCBTptYFw5sL5jzV4p9uQ5lcHF0bieAKT0mAR6ebNMLatgVp/5z6oG5o5c4sW2eVo7feUuWye2EQvPAdr6wNGEIQMSuexh/93tmQmg2eryOw88h2dty6XTTPeaolnZ0MXJLiM63wGWZsVEwrkjZ05dXex8sq1kcZRfgm0/czuLUi8YOeWfYOuWgGW7l+rKYEHDgHJ+vmpnuXrSot8NOqbglh8aZC7I1u3bnjP/I38sUjCxp2qkllQVznn9zcYpKfFCr9ac/iX7ULWNjJMrtOrj7135AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by DU4PR04MB10840.eurprd04.prod.outlook.com (2603:10a6:10:58a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 16:38:37 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 16:38:37 +0000
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
	NXP S32 Linux <s32@nxp.com>,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v7 4/4] MAINTAINERS: add NXP S32G RTC driver
Date: Fri,  7 Feb 2025 18:38:08 +0200
Message-ID: <20250207163808.1208552-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
References: <20250207163808.1208552-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0060.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::40) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|DU4PR04MB10840:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e02a09-661b-4348-64e3-08dd4795df17
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUJ5d1ZWOVRjMEwxeE5ndUdicXphbzNGdUphei9hSVUycEhHcysvczdGaDlm?=
 =?utf-8?B?dDdRbmpocmwySmYzdHp3b1gvRWo3dzNlc04rQnVEd2tuYUNxSFlZRHlFYjE5?=
 =?utf-8?B?VVpmZVpOOTNZemdTSjZwYld2MzhGNEpURDA4ZVlteGNZNUgyN1NrT2ZmamJw?=
 =?utf-8?B?QmQ3QTkxc3I1TTRINFNQYUtRNFAxQlVkL3JydmVTaldRaStuNWwwdXZ2UC9N?=
 =?utf-8?B?VXVMemdnZWx5K3Y5MGk5bWl5dVBJVFlzdTkvUzZkdmVRVnBPUTQzN0pJcUwv?=
 =?utf-8?B?WlFaenBpalpLRXJOVDhPb1BzNWhFcDFsTVBmbGpCU2hhQkpSSWd3bGFuNzAw?=
 =?utf-8?B?SzFXMFhXLzJsY2UyYkR3Nk1jcVprQU9Sd042bGcyZ0NaWjEwbUJNai9HNFpS?=
 =?utf-8?B?blRjY0JMSkNBc3BhRG1vTjRCdGJqMXhjdXNOclZ6TnJPVkxrYkZFUkRsRmcr?=
 =?utf-8?B?MitqbUlyMnREWjRQZzRPRnRGcmV4cktnRG5JYzZJUjFtSUtyZVdvWnpHKzRs?=
 =?utf-8?B?VG1lSDhEdkNJVGV4Ynh2cVB5Q2xTaDlHak9yRGJ2NHYyeUtYbk15RnlyTVIv?=
 =?utf-8?B?NXA3ZDl5SGg0V2diMG4va2V5cWkvRkpZNTQrK0Q5SUlXS1NjMENWc1ZtNTY2?=
 =?utf-8?B?NkhuQStIYVVLRzBMWC9ldTZTdFVnQUNOalBHeWprVnltclVXL2lIcndUeUpK?=
 =?utf-8?B?NER3VER4alYwanlVVUpGZXRRbmxNbHo3Q2NteUVlSFdycDYzekZReVlUeXhD?=
 =?utf-8?B?cmYxY0VVN2dTNTlhT3RZQnMzYk1wNWJRRlROTjJhaEI3RVF3VWV2WDFiYW03?=
 =?utf-8?B?OUVoWExTUVoyYS8wZnVoQ1RqOFVMSkdmRVlwejlrZ3duTklKZVFDSHRJS2VC?=
 =?utf-8?B?NlI4Z05tTTR5S1IzQU5sN2g1Q3ExUlRjMUdoK0NoRDdtNUVUc2l4R2U4R29R?=
 =?utf-8?B?NWlqZVd0aHY0SEZaRU5IU0hmeUVEeDRlbE5pbGVRL20weHFoUlo5elhqdE9n?=
 =?utf-8?B?Vk1PYWJzLzM3SUNOVEt1K0NJdTduUUZWS0dURHJwelZZWXFGeFdlQXAxK0xK?=
 =?utf-8?B?TGR0bUtHcHpjYVhnTUFYK2IvcVBmc0NwRUZxbkcvQlc3Zy94M0dRREwxb1pu?=
 =?utf-8?B?RVViTVl3SGl5NHh1YXRjaVFFb1Y3MncxZmRuNGZCM1RLaVpHNkVrT3orTzBH?=
 =?utf-8?B?M29ZWWxFNStnUDR5RUh5WDFxcDE2T0hySFRDWE9GeHFxYzJ1L2t6MFgwZG1x?=
 =?utf-8?B?MHpQZ3hTWU01aDBlSlFKRExDTVBmcW9XSzlnMHlYSzlMblpUWDBESU50SmNz?=
 =?utf-8?B?dHEwdmlUTzJDaUFmUGpQK2tUcHVvS0NyQVpKaHExRWFBSlRMQ09rb3JDTlN6?=
 =?utf-8?B?dGh1T0JaaCtpWGU4M0lIMnR1WUJZS0JVRHNWSWZCei9EWEZsTzNVeXNKN0Vj?=
 =?utf-8?B?eFBtUHFoRHpHRHFZZEk5YzU0dEhaVTZwejJzQklnZ2pXbGlPbUwzVUtlcWtu?=
 =?utf-8?B?UWt2RjN5cGNLYzRWR3QrbFZkOE00OXBlUTNUdXR4QWZkbjdRY2tkMW82Vkhw?=
 =?utf-8?B?SjAzN212OFR1NDRjQzZHNzVyWjRkVjFUYkRPM0hVQktqYXFmTWpaelpoVUJW?=
 =?utf-8?B?Ti9qcTVIcG45bEZkWTdxVkNSVlViK3RSY3lpTWgwZUYrc2RJcUZOdkwvUGdZ?=
 =?utf-8?B?cTNleGJGb2NIUVFRRUdmb1Rna1l6Y1BmWERTRHp2RmZNQ3FlSEFDTnZmeGJ3?=
 =?utf-8?B?OHJROElwZXZNNVdLanU3bnFianNWZE5OM0pCRzJRdG5GTzY2anA2OTIrcldR?=
 =?utf-8?B?My9UQXVmSytyL01XMnRIWGxEZXZBd2NjNE00Q2pyc0FQMzAyRUNDMU4wbi9G?=
 =?utf-8?Q?bcztz/XjOIF7P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N08ycisyekVmSlpHMmJBWDJ0NFJKZDRHVGJ3SkNnRFNXWndBTTcwQTNTSmMz?=
 =?utf-8?B?MTZlZWNTTm9oQnRxY0xEUk8vWTFaMjUyMEtyVy9kODNHdHNGL3U1RVpXZkpB?=
 =?utf-8?B?QklZUk1KSzZKTFJNV1BmS2xOUzdjWE5DU0xQeERVa0NWaW5ObzZGTGxieTRF?=
 =?utf-8?B?ZzZVV3VZbGZaYjIvcE5IWmRXZjhDbW9Td0RRZ2VZckt5eFFieGhTNUh6ODVV?=
 =?utf-8?B?WVBCR2UyN095NVdZR01QWkZkZGU5cW0xSkt2WkNhT2lZa0kzMHNZa3BUTkNX?=
 =?utf-8?B?L200TnpPanhqK0hOakJlQkZDbzZnSmVDbjkwd055c2VQZzRBMFRwaGxBK1Vt?=
 =?utf-8?B?SnE3OThIMXYxR2V6dEgwbUdjcUdHM3BmWmxSNFVGS245alFUUlhLc09NWTZw?=
 =?utf-8?B?VzVyNjhoeHdnOXRLS0ljZXlBNXpXamFWRUk1QVdSZG9uTGNub1k1bGtEUExJ?=
 =?utf-8?B?blFoTlBiMWk0WTZ6cy82cG5GTUgrb3RCU2MzUEJ3MmM0amQvY3B6Y2FKMzBE?=
 =?utf-8?B?WjhQWUgwaHI5dTRoV0szakluV2lqTFMyNGViZUZoVW5ReWR0MmxBOEwxT3k4?=
 =?utf-8?B?czJkUXhocUtkVXFUeVRqNytqZmN2akp5VUlZN3B6OWlGcitBMnhwOE8xMGhv?=
 =?utf-8?B?WXVxY3FsVzJsNkR6bHd0TURkMmRLVnF4Qm16dGk2d1hNK21Ia1R5bWM4OFNL?=
 =?utf-8?B?Q0M2RXp0MjdTVGNaMXhWc24wUVZTWnFQRWQ5Ymk1dzBUVm1LaDk2YlRoOHc3?=
 =?utf-8?B?NTZPSjhLWVg1N1NRaDRYWlRtOUpVUkRMQnlyU05Tbk9sS0t1NTRkWFZlSDhH?=
 =?utf-8?B?cnFHTjBYRzJmVTlBQTJzdXRhSHhURU9PUmxGMlNlYmVzYlFwRUZLNXFROHhU?=
 =?utf-8?B?UHhSVVc3cy9jVjN0UXFYRm1BMmg2QjMvUVc5UWJNWGpINWhidmQySmh6TUFv?=
 =?utf-8?B?T0NXVGFSZmNCZVJFNUNvNS8zeWpCaU9aYW85Y0dxQjFCL0FwUllWSWh0cUtE?=
 =?utf-8?B?dEl5YjNSSFFQK09yMWVsc3M0WVlSU1A3VkhraGtrWlRHU2U1c0czNFBLbXB1?=
 =?utf-8?B?aUQ2UFJtSTl1ZFZYQVE3aG1qbms3eHAxMmVLL3VHRlZMR2FsT1N4TUJwRnJv?=
 =?utf-8?B?K3JIcGd2ZjRxc05RMjdYZzVMRk5wZDF5ZVRVazFuWGxrdjljNSt1UzZFZnFQ?=
 =?utf-8?B?bjZUSzFUbDUxTmIxelluUVhoUGZEVHkzVUY3R2k3WUpvR3BVTyt0aHFGVkZ4?=
 =?utf-8?B?VVNSVDV6YmNVcDl4SmhJM2dpc3ZLMkpyb3hUVEhGTTE5WE5Kb3A2ejdhbXNW?=
 =?utf-8?B?UUU0a3VpeTllSnhhRnNGell5VHI1anJtWUdkTXJJdHV4VUkwK3ZmVWkxdDJE?=
 =?utf-8?B?MTVUM2EzT2cwWVF4OUdYNEJaSCtGOWZSa0VOaWw5SURJN25TdUFKaVFCQ1Mx?=
 =?utf-8?B?TmFtZ2ZWaUsrb2hOM3ZhbGw5b1Z5Q1F1cFZqenNFVjZRNDltdnNaNjhNQ0Vr?=
 =?utf-8?B?NitaWXZIZWdkSS9IZ0p6UXplK2pBRElQMHhLSjM2aXZFMlBMaFRhNWxWSlVT?=
 =?utf-8?B?RUNla2xFcG1oOTJCRms3cEUyeEVIV0lPWmw1dHRCamdqVDgwR0Z5RXRoaXNI?=
 =?utf-8?B?RWlOaXR5RU1jS1hmUmRCWXhYYVMxV0x5TGkwa2Fxdnd2YUZDK0d4VlpjY2Fa?=
 =?utf-8?B?c2ZhVklsSWdXNS95d1NsNVh4SCtOaDB1V1lsNXI1MzF4WExuVUp4Y2Y1NUI5?=
 =?utf-8?B?N1lUZ3hUd3Z1eWppRXlvYS83NEVzUFdyeWozQTFoOWM0ZVRORDViSUlWbmFl?=
 =?utf-8?B?MytaZHhFcWdwN3dYUi9XWW03cEtqcXlWYXd3ejM2QjR2Vmp6QXN1SnorekRw?=
 =?utf-8?B?QlpVSDMxTmo2UHJiQ3BsZ3QvNVZORTV4WmxIaTlTcmlBaVpHc3JCK0d1bW1s?=
 =?utf-8?B?QXREdFMvU216SDI3VDlQdk1uZ1ZuKzRjU2x1UkExYkhvMXNIdlVWRE85RzQv?=
 =?utf-8?B?T0RacGtrNEZCb3hXYmZ4eTN4eUJLbmx0YjByckxuTERpekFjM1lNK3Q1dzFK?=
 =?utf-8?B?OGNmNjJuOTVXajE4eUVkN2U1Rm1PeEJ6OXlTVEEzS0NiOTZZYWpVY0xEeXVY?=
 =?utf-8?B?L2x0MU4vUDZyK3RlNzN1blhHSm1PUFBLYlNRcHpLbzJ5MHkrVWV5b0E4NE9O?=
 =?utf-8?B?WGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e02a09-661b-4348-64e3-08dd4795df17
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 16:38:37.6400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akCa0lUD3jrN2uGwNIxJwKv9dc/2VVAeVS7vKIWbOf/le11D1fPhPl3BIM5qMrZzm9ZTHYkiHQVRPLMNMgrQXQu7mtxq01wcJ+Q5kz9NDUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10840
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_083840_385813_FB8BC6D9 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add the NXP S32G RTC driver as maintained so further patches on this
driver can be reviewed under this architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 873aa2cce4d7..515ed8115922 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2873,8 +2873,10 @@ R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
 R:	NXP S32 Linux Team <s32@nxp.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 F:	arch/arm64/boot/dts/freescale/s32g*.dts*
 F:	drivers/pinctrl/nxp/
+F:	drivers/rtc/rtc-s32g.c
 
 ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
 M:	Jan Petrous <jan.petrous@oss.nxp.com>
-- 
2.45.2


