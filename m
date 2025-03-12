Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B10FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 06:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZlRxJMTKewKd7Q7QQyvTscaTbHEinhKEX03/TAm3iKU=; b=NhkZnEBXnPa/rd+jYYYmrC13tX
	MB/ev2bt3Mx4nKlzY13xuJ2jjFUo558O3Jtacj8JqZvYa4fiy7aTSqUUB8wL6t5KSBaoFsMwVV0vR
	ePOwJUKY+s/9SFbNs8rW5b87TLqPBBgdfta+NglUJgmM3et8nOIbBEuwYVMLEPqPjppVR/grHNDW4
	pFbrTtjSRPwzF2ZPnAP0O/fhnNk6eALoF7pmBBpsNQjKFg+QR65A8SQHrgR+4JH16nKvpekGtGhuz
	/0kbuWWbi/HwcSxOGx0ZYmIk5vyRtax8+xrxchpjb8/1HNgNQZB/E70QlRNjQgqae0oC/qdEV8AlW
	QR0OwvFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsFsZ-00000007d4Q-1vg6;
	Wed, 12 Mar 2025 06:47:47 +0000
Received: from mail-am0eur02on20612.outbound.protection.outlook.com ([2a01:111:f403:2606::612] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsFqv-00000007coI-0oSq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 06:46:06 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jt4J90BGOmxmyCeedRqmpQVEKVPibVaz9HXJXAknOVqs7rFRQk2sx0epFHLfNBBYvBg/grSgzM73OJKFLlE12l/VlgNuIJsxGhq/Usc3ZFZRq7+2YvPgHv1JMxFyxDXhj/rJb7pyLARIlK55KnmVKOG/GX+WGpd8M8Bz64JY8+ZB0pcdfpcmOsiQSeo4vUA/r5JH2eoypXWK6PpjGFN8qSFJwLIgPf+ww72Wg/UuZnAhN+xrizTFo7l3O/Dm0/kQiE0koeFig8Lo0K7KwyBLiVqws9QqfOmhgLGxwQ2kFBYUPDElVfUrHX96nSKqQsfyqu427+hKIZQ6ygUfloN25g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlRxJMTKewKd7Q7QQyvTscaTbHEinhKEX03/TAm3iKU=;
 b=ZwFx03Jhz/bwjL9gwrIo1ccMfsxw7RlBCmF8vjUIMxzeOXP+ExW9rN2AaoK2lzBysoX57Onj6ihoKx+lWKTXUOdbWC3CQyylw1l8jX4qenk1g9rsRMvr7Zu1cvzwki23UxKmOhHG6jhYLWbhVCej/qsHTm0JQX5+Vh2BwLpocZEwKKQ9Lm6zbhLHSlSyRoBTA7oPyN/R3bqwUKPW8YNo4jicLZScNLeD92s3UNAUr40WP45GAQMOTqYlAlmOuGcKT+stJyILxcTCq6vwWmrfMm2f3tTDSCac8Grl1b6hKYFQu/8ZrhDNme3n90tJ0Jilf6tP/fx4/JtlmZ41wVMe6w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlRxJMTKewKd7Q7QQyvTscaTbHEinhKEX03/TAm3iKU=;
 b=J9MCKL/Ow1IAPW/WNS6pu+zYyukbFd0wNEMEH8ZCrW4pNzsKRtp3ZXcht9J8hMPagM23dmtSRdt/SxMpUhcvvkGWiswcrrRHaYtQ2KEwMyv9SD6sJulFrhqoYEY/Gpw5cnAiEXx11L3AByjEJnX6ESDplKctSZnLESZg29OWPCk=
Received: from AS8PR07CA0039.eurprd07.prod.outlook.com (2603:10a6:20b:459::8)
 by VI1PR08MB5487.eurprd08.prod.outlook.com (2603:10a6:803:13c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 06:45:58 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:20b:459:cafe::fe) by AS8PR07CA0039.outlook.office365.com
 (2603:10a6:20b:459::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Wed,
 12 Mar 2025 06:45:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Wed, 12 Mar 2025 06:45:56 +0000
Received: ("Tessian outbound a5818d08f071:v585"); Wed, 12 Mar 2025 06:45:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d046dbcee661a8fc
X-TessianGatewayMetadata: jhxmrTtoxLNLBJ8gPaS276qo14FEALr6rji4uAyBPnjMokWsw14YiHzql5f7BlrLRxTB56cseWLvdIr90r5HbxolYqFxgHf4bE8OZXWoYaz1U4PKghWAwZsbIBHs/ydoQvzeNnhWqk8zfApZJ0xU5aI1zGqiaPAVfck04Cx6OW8ZIVYh1YoI92vMy4THZLTcIMEpU7M+yWaGjq9MjM3wSw==
X-CR-MTA-TID: 64aa7808
Received: from Lcc4f958e5b3e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 6A10D1C6-3861-49A6-80C1-5F3B64122CF3.1;
	Wed, 12 Mar 2025 06:45:45 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lcc4f958e5b3e.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 12 Mar 2025 06:45:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d10AsIZBKr0rJi+UbO8Oym/x06xo4gfwR72OmtfGo+q6sgMf4rIGEg8N6ZMDLb4+hYIuUszdP2reVAOMBcE8rBkr8KZAiYDlNEw2+F3oFDXa+NXOqAQ90X5HARtfTR2/56VK2Qonng+0dfEvQUHmXoID0Qr+NQChu3LySfMzzOwsQN1HPIZW4SXP5csEq+2dKlJPwGV5/nq22GroaU3J++6QImB3WI9D6d/081ucaxZ2QrsLM4KylF3Z3UueNu5LZvu/nNbLxC2aWbrBRMFznxOOaiIjvbCsqkRFRqpR76ZQR+fXuxnFQtpJvLTcuqwh91wdOF5PSR7CFLEZKyUt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZlRxJMTKewKd7Q7QQyvTscaTbHEinhKEX03/TAm3iKU=;
 b=FBcdOKntLSkZLX1OjpvA0ZYAfPTTIgWfEF3aSRzapjdHulmdogsq72JKOijSfVH/cwg2GBXDqkOjY4tI+8wKqfRK85H9aA4BpeY1SF2GVB2+khDMRr4XHGNcyOGXRtXnoXGEZuFef+Ox7EPyvK4QmbmiaC2V/hb1ZM0aQ3CdLhMX/mQKiZAYxgcVIOdtmBfTOapgPKa9oCWJPlfPwcFQdoPRczuFoC7VfEkysveTqaW99UhFKvfowSdQaIuP2hVOZBdTi3ZsKdE6ENwszn8fhir8ACNTQW4NNs+xyu0SIDGR7oW8UmJZEGbiwgs6//7GzBg1lusIKZduubJ5F2A9Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZlRxJMTKewKd7Q7QQyvTscaTbHEinhKEX03/TAm3iKU=;
 b=J9MCKL/Ow1IAPW/WNS6pu+zYyukbFd0wNEMEH8ZCrW4pNzsKRtp3ZXcht9J8hMPagM23dmtSRdt/SxMpUhcvvkGWiswcrrRHaYtQ2KEwMyv9SD6sJulFrhqoYEY/Gpw5cnAiEXx11L3AByjEJnX6ESDplKctSZnLESZg29OWPCk=
Received: from PA6PR08MB10526.eurprd08.prod.outlook.com
 (2603:10a6:102:3d5::16) by AS2PR08MB8381.eurprd08.prod.outlook.com
 (2603:10a6:20b:558::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 06:45:41 +0000
Received: from PA6PR08MB10526.eurprd08.prod.outlook.com
 ([fe80::b3fc:bdd1:c52c:6d95]) by PA6PR08MB10526.eurprd08.prod.outlook.com
 ([fe80::b3fc:bdd1:c52c:6d95%2]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 06:45:41 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Suzuki Poulose <Suzuki.Poulose@arm.com>
CC: "mike.leach@linaro.org" <mike.leach@linaro.org>, "james.clark@linaro.org"
	<james.clark@linaro.org>, "alexander.shishkin@linux.intel.com"
	<alexander.shishkin@linux.intel.com>, "coresight@lists.linaro.org"
	<coresight@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Thread-Topic: [PATCH 1/4] coresight/etm4x: disallow altering config via sysfs
 while enabled
Thread-Index: AQHbU8m8TEnYl8CikUKII/YDjzuo1bMOcL2AgAAEFQCAAAWKgIAAWPOAgAABdI2AYLhYpg==
Date: Wed, 12 Mar 2025 06:45:41 +0000
Message-ID: <PA6PR08MB105264F47A8399568DA2D3344FBD02@PA6PR08MB10526.eurprd08.prod.outlook.com>
References: <20241221165934.1161856-1-yeoreum.yun@arm.com>
 <20241221165934.1161856-2-yeoreum.yun@arm.com>
 <6bbc9b64-3ecb-46c3-8c4e-55dba6301ef3@arm.com>
 <Z3+6kL7OGDX/pNul@e129823.arm.com>
 <4f9d2bed-7ce0-429e-83cc-ad6cbcc6085e@arm.com>
 <Z4AJ0kc0DxVwhLlu@e129823.arm.com>
 <GV1PR08MB105212E5552EB50968383C6D6FB132@GV1PR08MB10521.eurprd08.prod.outlook.com>
In-Reply-To: <GV1PR08MB105212E5552EB50968383C6D6FB132@GV1PR08MB10521.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PA6PR08MB10526:EE_|AS2PR08MB8381:EE_|AM4PEPF00027A68:EE_|VI1PR08MB5487:EE_
X-MS-Office365-Filtering-Correlation-Id: f41719dd-c88d-4664-f872-08dd61318ad8
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|38070700018|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?KdDRPu7iiVhjHj7yKUvgu1qlIkNhFoRsbAAh01KjwPjq0ovr+l9St2kU2rS2?=
 =?us-ascii?Q?X31LDfCJLpmV6wnkKPbnh/C5cifvR85UumnTZGsyUw4QB+oWLatE0zyfEKqd?=
 =?us-ascii?Q?5iUi4z/yrXYS7HpMx2EJbEowc7OWJ+CmW6N0xFK/4VMePrvxSXsD52IJikpq?=
 =?us-ascii?Q?hKcpm8nirSW4mj5IOtVDU3+v77jN7ICb6rzd/YDLjrPOn8O9lrrahKp3Rjqu?=
 =?us-ascii?Q?V7IReB703ldLBiPvRkVPIfg5RcKSALPundP2AH01UoH2RfSqqcF4Gz31a3md?=
 =?us-ascii?Q?S5NQ9B7/Xoi8jJQnrl4fNwlOCJhFdjYz02/uUOF/iSwXwOQJzzovX4hSjonc?=
 =?us-ascii?Q?BfXbEzxmbj+MVnXu+aUu0KxsVKj9U3vCsG8L+TXFTGJ09qxgXN2BjyomOSbq?=
 =?us-ascii?Q?dS2Iyv+F6akWVfpA5zO1MZGtA0Zdiqa6s1ehNgGJf6w6ZHUUaJUgKy64UtsE?=
 =?us-ascii?Q?v60wDTJXTCd+xWd7KZZkt+1WXXdlPzjPbRHrJbnWsDKcv9hk93t7AW0EgtE7?=
 =?us-ascii?Q?B1DPT3jDfgoU3IHJR/U624vXTrtQe4/jF28S/lnsfNBDTpIRVZi3ALDlCbqv?=
 =?us-ascii?Q?rxVs1rOACu9RMv0Zk++XtDrMe5YalLec8bQy7JYzCUxJnOUPsCBjUw3qWjNi?=
 =?us-ascii?Q?3ZNxI/EOxoAvpYLwzN9ihwuBuJOy+oCoK9vCIBSPyud0Thqdf5R/nDDJ9ztr?=
 =?us-ascii?Q?cxayp86hZQYNhuwKQLPCAuWYbyeINVWyZgmXi0WEfMJdWy5lW9qqI6ofPXkn?=
 =?us-ascii?Q?BDJG+nU3ZBd5LyXYlTwLvFfOnO7YXzod10HKFFgaJP1B7fSCAYPW+e1o0qrU?=
 =?us-ascii?Q?v1MJn296Rk4XIo4YaMSNZ8jtYE8QHxyCEwGGj16Pur3QZlvRyPF6cRuizweM?=
 =?us-ascii?Q?ZAuHC0uAEMCHgTzFXkgRboRUZNJfW3vR9ovcrgYDoiot7wtz5rZkzoNi8YNS?=
 =?us-ascii?Q?1NKIertUM8ZokSTsP1APJrbYiRlpqd4eRvXNG3LxJ6baQ4IwUAuOmBTcfhYX?=
 =?us-ascii?Q?qo77F+nWKb+AmW/KfeMX2FLrFry+WMU8BqSQMNyAIiGQ4Vjn1Sr7g5uHTwx/?=
 =?us-ascii?Q?50NDpWVnt4kPdFXlOtWtJE/ttkRZ90Rw01NnGqBVsq+N4z3De/T28vt8u34+?=
 =?us-ascii?Q?ySzrhAiKUNKjf0NOSyWZKuZz+DvfQeGHIi4MqwMCj24RIqT2oIHzLrkDawI+?=
 =?us-ascii?Q?MDbkmysW3TvAm/0xSkJKU/g4A18RXmQR97Hikl9NAaZc5MciYTEgCZA0+Bx4?=
 =?us-ascii?Q?X1Q2wKo7GbFbKZSJ5Dxt0qhjt0gfxxCZBDM6k2UiVXf1hX0sDVgdLgQGeLWy?=
 =?us-ascii?Q?tac1W3ZF4hPjERd8sbZZll6cENJufFHVKtFhoxPzOrP5nEjryDPGX2gkRoqW?=
 =?us-ascii?Q?BS6W8HcyyEOTp3tBevEcQr3+WedCrWoXS2WLnpFc6Iqaf55n2BI7Nw4iOlTE?=
 =?us-ascii?Q?7ljWmM5HA5HVamn7Q9wz+eUcBLBe0CSq?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR08MB10526.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8381
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:102:3d5::16];domain=PA6PR08MB10526.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c1db43c4-484a-4a5f-d9d3-08dd613181f4
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|35042699022|36860700013|14060799003|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BmvW9MTpvy0DAzfScfS+FWwNZ3nToVBtKwPaLZOknlbDRNRPGQNX+zb2LngE?=
 =?us-ascii?Q?lx6/jRtk3+ksju242PCTXhBrdJuwjd8+dG2fDltI13fYEQuh5cAUs008QRB/?=
 =?us-ascii?Q?FB/9c4g2NnizrDnrXbG0BV0RIKo3BKbfPfxkoOXmtiMfMgXD1/9p9sdsTZ5i?=
 =?us-ascii?Q?VY/q3OHShcjhx6jbZ9X85SivnNpJh7GJhSGhABRApmX0+L4PkEjEcZulY0MP?=
 =?us-ascii?Q?hIOFoPFPO3YIcwmtIsNUnPJOzk3VV4BjxNzFYrKskl4tUYuTcki2cbpYRlZz?=
 =?us-ascii?Q?Qvj1+lCgmmfy69OP5QOo8tUTrvL1tdueGZrisx7OSAcRaL1ZBj7IyRRH278k?=
 =?us-ascii?Q?WOAvShvnXa3s8IUgoLsBH8E1YEz6i1mWgo2bmtTrITFEU2je0FqyH/laCDKv?=
 =?us-ascii?Q?ETPGTMDEKnruOJvruT9RxeHpt1IOp3vER826KqAju4ahdC3qgCZjd3mgI8sX?=
 =?us-ascii?Q?TgzDZGvMfAuk5QDqBsoIdoDQM7pymtgxhsPVxuxLGWJjhgmk/C5/4uY9GOX1?=
 =?us-ascii?Q?li+tN39tqDX5lTU27D1PLy5eX+5pfZeP8YV5TP8CbH3aFQLI6iPoprXq0u7N?=
 =?us-ascii?Q?durqG4uJnsQzeNt3akKLxdqgiyF8x1YU8E3MlljwvQX4N5B+302rjO1YnPg9?=
 =?us-ascii?Q?K2zrKoHdyys23qZuw6bxMYE/bQ0wiwenrI2oVFzj3x5E5tSNPiwSCWDgXwm7?=
 =?us-ascii?Q?DaIRSH5lz6GNApumh8SxgVX5uw1uymMybWWq6hxDBFDRNThls2EJw11+jDwA?=
 =?us-ascii?Q?ihIdg4v7TL5GHZJhwHx332XbIZUiX1BzpVyDim2MDRuYjfoYWsVJITz20flZ?=
 =?us-ascii?Q?bR5QCO4THm+F8PjNxqjr6PGeCDlsk+u3cAOeklnIEerYivUqTwd206R8DGhZ?=
 =?us-ascii?Q?z6Ig294JzW3w+9YgDwFTJ8AHTnxaGQrK0ie4iqEJUdEAQUCmyvZVmgcqfi7P?=
 =?us-ascii?Q?Epc6EMnBowdQ/gVqglNQouRK6S/2WUlbWPATOQtcyqGjS2dmdnIzxPmcC7Iu?=
 =?us-ascii?Q?qR7EUYe1Xy9/k12hkfp6k6qVZ+7hUjS6FhXv8nSp/YzTowoAKrR6qK6I7A0n?=
 =?us-ascii?Q?8+etG/QMvwZFFSuQCnVBkFbWCaBaZIs+pVY1fo/gYj/VLvRNkvixHT7XcB9d?=
 =?us-ascii?Q?yR+CqR1vSneA+TD0prRtSrwIrpJvP467LvCA0xI9tBl9GG9IYDoFJ5x5RtSN?=
 =?us-ascii?Q?7EYICocRotFIcrJ+yrgz4vcA+dQ9Uc7+Os3cZ5h1RCRJim8GcvFFo/tJycj5?=
 =?us-ascii?Q?j6bH3ni5oBjLFOA6EMarUn4VG94PtG9FuQr8RfOh6n1uEiglwzGJ65zp76WJ?=
 =?us-ascii?Q?voMmWy0UD2slBioATXJHiVtNe69r5eGWId2jaa1TR9h3hmoOE8wWyf23fJEt?=
 =?us-ascii?Q?X4QWGtR4Qb60xCg5c6UrSC723LFqzgYiq/lrQp0YJ+xELmr7jffaaIUjzmp3?=
 =?us-ascii?Q?TN+GnGcn/geTyKGNMhnToy5uPSG73l72ptDQmJ68+vE+t1e1IUFd5m56fGn9?=
 =?us-ascii?Q?DxVauahR3i9xYHU=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(14060799003)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 06:45:56.6776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f41719dd-c88d-4664-f872-08dd61318ad8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5487
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_234605_385021_773C2C61 
X-CRM114-Status: GOOD (  19.87  )
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

Gentle ping in case of forgotten.

________________________________________
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
Sent: 09 January 2025 17:48
To: Suzuki Poulose
Cc: mike.leach@linaro.org; james.clark@linaro.org; alexander.shishkin@linux=
.intel.com; coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.or=
g; linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] coresight/etm4x: disallow altering config via sysf=
s while enabled

> > On 09/01/2025 12:01, Yeoreum Yun wrote:
> > > Hi Suzuki,
> > >
> > > > Is it not better to have separate "configs" for perf and sysfs ?
> > > > And etmX driver can populate the "running" config, based on the
> > > > mode specific config. That way, the configs can be updated
> > > > independently without affecting the running config or the perf one.
> > > >
> > >
> > > That was i've tried but I've accepted Mike's opinion that
> > > it's enough to check whether CS_MODE_DISABLED via coresight_get_mode(=
)
> > > in *_store().
> > >
> > > "the .._store functions in sysfs should use coresight_get_mode() to e=
nsure
> > > this is set to CS_MODE_DISABLED before altering the config,
> > > which ensures that the trace system is inactive.
> > > We don't' really care about reading the config if trace is running."
> >
> > There are two issues with that :
> >
> > 1. Sprinkling the get_mode call in each sysfs stor function doesn't loo=
k
> > good to me.
> >
> > 2. Someone preparing for a sysfs session must not be prevented from doi=
ng so
> > just because there is a perf session running.
> >
> >
> > Suzuki
> >
>
> But, when separate the config, it doesn't show anymore the current
> configuration set by perf.
> I'm not sure this is okay.
> IMHO, If perf is enabled, since the configuration show the "perf",
> I think prohabit to modify config via sysfs while PERF_ENABLE seems valid=
.
>
> and about lossing session, I think this is up to user.
> That means to use sysfs, user shouldn't use perf to prevent loss
> its configuration.
>
> Am I missing something?
>
> Thanks

And one more question.
When CS_SYSFS_ENABLE,  Is it valid to allow modification of "config"?
I think It seems valid to show the "current working configration".
If It allows to modificaiton the config value showed via sysfs and current =
applied be different.

So, IMHO, It seems to valid to modify "config" only in CS_DISABLED.

Am I missing something?

Thanks.




