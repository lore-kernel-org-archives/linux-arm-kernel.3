Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 557F3F4BB93
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 22:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZxEcAFoFmpvBlOM6M4lSrvoE43NoT2/4drQwDl2iw4=; b=KPdjfp3hsfhbO02QqMY31LX4yn
	CErti6VgkpNEndWkSis3wPZIfGCN2pP3hWDXowWpTizjAuVgV5m4iRHrYo2f03f5DJ/TKm8rTQANp
	m8VFolxt8tmoo+yaAbLxuJdxejxpLxlcAJXVgfqQhfej5p8IQG+JmUxuoDbchl9ZGlD+y4OQ1aMvR
	bD033ALC51oBi79l4As+D02UBW5U9vBquNhbdxZO+CgHtbE9CWSLAjZmucU/cpf+3bS18oLWJ8oXZ
	oGxz384GcKakZRT59/psILwdSK8DiK+u+NkjwyYdHLJIVObCyWgw1cxVPeu1FeLRdSihzW6bRncC7
	byu2giZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0u0-00000002sAn-3TTI;
	Tue, 24 Feb 2026 22:29:12 +0000
Received: from mail-francecentralazon11013027.outbound.protection.outlook.com ([40.107.162.27] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0tw-00000002sA5-3S8R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 22:29:10 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vosrVfkjW7Kod4YF8oB5FCXREP870OKNR+v1GKxPB45X2cdOgIl4tmoOhOmas5lI/lUu+jh56D2GQGa5QIeK/eR67td0m34j/z3cB69pf2RTyglkZrluWMm6GEbgI7zuj9cvTwWCbX2Y3Dz07hxN9gE7c0IuP72qDrqUvRkbJLoDS0DqrnTrz3oYy2ivPudeGZg5boRv1+7fFjhvgi4q2lXz+xoC8Gc+SLTKTcELF9sZPuK0AiQF6H1p2eG9ac89p75a5SO8zBcQCyINlZHxyk1Cy/jCAEZWE4TIi/XZ2XTnEYTtzOCtPRz85WLxRoPfltjJjgkTECDJL8tXIhIUrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZxEcAFoFmpvBlOM6M4lSrvoE43NoT2/4drQwDl2iw4=;
 b=xh/prd4leeLoUlr3gDjEm4vO9RUMxiPwVWHmmsPx6txe4O1SxaXN6goApdXkdq1kdxvgu/+efCp466+K0i0wNUHMQ9D5kbdsRNorTXgFpupOYq9AxJm08jj+S6DD6EZt0WRNr2uWaObHjPtdj3qe4YUunhSuhihmgMs5+KU4non1NfYGDRfP6pGgrGnx17Owz3GVMEzZI4zHYvgFzOa824rr/nJ39dZheIViATa5o7hg6Tso+fjhhvUqcwPdoMJBFdJagaELzjmEFDRHLVy0JUxRBn60cZxberLd280AqyBWaUNtHU729vzJTQi8oWADrl93UahE3XlfZu7sPqGbyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZxEcAFoFmpvBlOM6M4lSrvoE43NoT2/4drQwDl2iw4=;
 b=pdRdnHiffIX8/aqF7QAmpdH3iVrvW/QSpm0001hxOiqTUuQb4wRN5lm9X1pf7wHGZhk/mgu+4fm7Zdxz9YhZlbhT4wMVgmalHagU+sr5C7tNIomTAp+t+FqmdEkGXjBUDHbr83LU7vf5AnAC0mdEE5nntd+y6v5kgOKVDMBUMW8=
Received: from DU2PR04CA0239.eurprd04.prod.outlook.com (2603:10a6:10:2b1::34)
 by PAWPR08MB11559.eurprd08.prod.outlook.com (2603:10a6:102:50c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:29:01 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::dd) by DU2PR04CA0239.outlook.office365.com
 (2603:10a6:10:2b1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 22:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 24 Feb 2026 22:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuYm5LTDLNPdT/aVHZ0gyCz6ki7BX+Sa2JYlIkLS5XKkv49OTimfV1Q1aFSVkNkLb2epsZmHoRi7fFAlm/tMvlmpT2j78vcrLomAMptg0Tv61c1JEXNXrOstg3fOu3O+W2rz/MZWWULIVhPLVlMz0FLbod88ySuhm7yL2lw3h1FyZlU/oL8+I67lalMFTODNLybMoY00TiQjXA+6lX0+SCde1nFiitECZzuskpnUsD8OhomXBhGKvFHlYwsDaLUv6YILeW/4fEA8k1URaaLqNMAhLamBQh994RSgtSE65N6VbUEcdjWXITPfWChKlzRLsqELjYz17fZ5EbC7Oqoncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZxEcAFoFmpvBlOM6M4lSrvoE43NoT2/4drQwDl2iw4=;
 b=PQ4Sd0zLN407KQU6BvYAWLKC3R6Lbeael6GwSdbESYA0Qwle94n3dbtfciBy+8eNFjEYW9DXqngj13ZViAC7nXIF5MMKxY+urJFd/Iq8WcNuDSsC0d8HYhZ+B+gZNIQ+J2KEMEsSS4AQtRkw3uR4VXhpmuFWcBxtrTc9aoPPrTOEvF/qmIRb237iwd5lVh835+Lw/2gvhZKBTX4yBv4qB8RrQVFmkj4mpjs+/ue+zQw4SAK9RR3BvNvA1Soyt7+kg314Y+V31Vtktg9PGVnR05IJVe+E6CtcOjpZWJBGuhMNIOrdO1XkfGIaRkWJLV0TCYop3Wt1PR9WwPve30Y6TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZxEcAFoFmpvBlOM6M4lSrvoE43NoT2/4drQwDl2iw4=;
 b=pdRdnHiffIX8/aqF7QAmpdH3iVrvW/QSpm0001hxOiqTUuQb4wRN5lm9X1pf7wHGZhk/mgu+4fm7Zdxz9YhZlbhT4wMVgmalHagU+sr5C7tNIomTAp+t+FqmdEkGXjBUDHbr83LU7vf5AnAC0mdEE5nntd+y6v5kgOKVDMBUMW8=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by AS2PR08MB10249.eurprd08.prod.outlook.com (2603:10a6:20b:62f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:27:55 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:27:54 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>, James
 Clark <james.clark@linaro.org>, Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leo Yan <Leo.Yan@arm.com>, nd <nd@arm.com>
Subject: RE: [PATCH] coresight: cti: Move resource release to cti_remove()
Thread-Topic: [PATCH] coresight: cti: Move resource release to cti_remove()
Thread-Index: AQHcpXw8oFfc7JAbx0iRhWHiBARenrWSbnfg
Date: Tue, 24 Feb 2026 22:27:54 +0000
Message-ID: <PAVPR08MB9674B6CB244C6F3788A191C98C74A@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260224-arm_coresight_refactor_cti_resource_release-v1-1-ff1b2bca9176@arm.com>
In-Reply-To: <20260224-arm_coresight_refactor_cti_resource_release-v1-1-ff1b2bca9176@arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|AS2PR08MB10249:EE_|DB3PEPF00008859:EE_|PAWPR08MB11559:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d83b27-eae0-4eae-2af9-08de73f41c19
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?RVkxOW1obTlXOHQ1SUhVeDZkRjN4eFE5S1FYaExlYStzcE8zSlFyd0p4TnRC?=
 =?utf-8?B?V052RUpSWk5CWFJBSWRzd1BGZzVpMk1xeGhMRzlheUpCa3JlNXVQWVArUndV?=
 =?utf-8?B?a2JUOUt1YWlPMlhjTlhsbTZoYmhSSy9XdU5ycVRHY2FGRDNscFRVbGJCZWh1?=
 =?utf-8?B?TStwL1cxenFIMWZiVExpUDZvdk1YRkE5UEtDVG8raytzenhxTGlkZ0lYNW1L?=
 =?utf-8?B?a3hDRlVaaEZFU1Z3OU0ybDlLQ1RBRG5LelVxcnFhbi85UHovSjhmZmcxYzll?=
 =?utf-8?B?TldMWVovU1VHWnpkTkNIT083ZzFla0s3MHU4MXNEV0YraE9pOEI1eEZNZFk2?=
 =?utf-8?B?RHkwRFRieERXTTZ0ZEdLbGlGQ0lKc09wL0dhQWtEejBTVFUzeWpYNWVZeHpL?=
 =?utf-8?B?V0VGQTFhV2JOaE13UHpidmhmVEhaL0JKY1lpaFJDTEpJWmx4emcveWM0SzFj?=
 =?utf-8?B?cURRZk16Nnhob1dlUFA2eE1rQ1RuNWU2YU9PZGlyak5wRUh3b0tPL3hVc1I2?=
 =?utf-8?B?K3kzS3NxTENaNXNnNnhDRk9xQkgwMCs5NzVIKzhHTW5odGtIUDlkUHFFUHJG?=
 =?utf-8?B?cGUzUUplYlF2alkrdkY2N1RlUitjMXVFelRzUEJDSGJDRldzc1dDM2kyUWk3?=
 =?utf-8?B?czBsNGh2OXArSm1IcG1mVk1aR2tIQjFwWTU4T0d0bnYzcXp2RVdxa2tBSE9Z?=
 =?utf-8?B?SHBqNVJkVExSQjZGOFg0TE8zSUwycGY4VERKenJuT2hVeVBEYlQvd3Q5a1Iv?=
 =?utf-8?B?djlrWnJ3SWFTcno3T0pIN3JnOTR6UFFrQjZqUDFza0R6M3FiOW1wb0t1Vytu?=
 =?utf-8?B?QXh4Z2oxMDREQnhQbGJQa3JBTllST0FwRWtZcVdXaUQyUmFjZDdrcE0ySkNZ?=
 =?utf-8?B?YkZUbGVJQWxSNzFJWXFqanVmKzJFM1ZXTktoME9nOVg2cFljR2RvWDlrYmV4?=
 =?utf-8?B?UWQreUxGQUNzVnI2d0lVTnFHZmRaTUk5UkRpRDBwWElkam40ZUtXL2V0aUV3?=
 =?utf-8?B?K3FxVWZxOGZQdkU0U0FDSjQraUt5c1pKbTZ0RUtQTXN4MUFYb2NDYVd0Y053?=
 =?utf-8?B?ajhDam1NQWFmaFdBeEpsUm9mVThTOHFYbXAvL09yemE5VVozTVpRcjNvellu?=
 =?utf-8?B?UG1KRW5tbmpFNUJZdFNTQkZ6QlNGZURSdGJ0YTlUc2NoZDFqcTd5NnlzN2U3?=
 =?utf-8?B?aDdmZjhiUlkwS3lHT3JPWlVmeFFHRVJiM0tCQy9McGJWOVJWTGE2TnhET3lw?=
 =?utf-8?B?akxJelVzYksrZDFzajRFMzg3U0F2N0hQRXRQeFRBVjR2dVYycG5YY2MwZ1Fq?=
 =?utf-8?B?ZlFTdkM4SnNKNzZCeHRvRnIxSzNDZDRka2hBMmhYYy9zS2svV0k2ckYxc2VW?=
 =?utf-8?B?SGljTG4vY2U0b3NPK1BJeEpOWjBwcFBIUW1rVzh2SjY4d0lxdXhnbnRWS1ZE?=
 =?utf-8?B?Mk8xZGNZUXZkbVF0dDVsT0NuSThLbTRzRTJkb255azZzQUNUWnNrbmNmbW1C?=
 =?utf-8?B?YUVlZ2JseHU0R1c0SjN0R0xheXIzQzF0S0kxM0J6anMyWk4wT3dFQ1RHRUdI?=
 =?utf-8?B?dEJHc09LSVNtV0Y3WVRyMFhNcXk1ckFyUDViZjA3bS83Vk40ZFN4TGRtdmRm?=
 =?utf-8?B?K3JjKzZXUWY2NWJQSWpReUZQMkszZHJrZVcwKzRtM2lBL2dDK1ZGcTVqV3N5?=
 =?utf-8?B?WVJIeGFlbVJISExDSm8wU2NVZXB0dzdHQjczbmwvWmxDdmpPQjNmWitVTVg2?=
 =?utf-8?B?cU1FRVhUUEV1bXlqSUpFY2NFUUZZVXFGWUJNTHVJZUVMOGpUNTJ1MnBjbzVJ?=
 =?utf-8?B?ek0vSGhnL0JrdmJEUFJ6TlVIWElVSE1ZTVRiN1YzZ0g3dHY4VXV0ZGNzbEFm?=
 =?utf-8?B?ZzF2L3VZd1Q1WlBudVdraytZRjBHdGNqOVJrWFdLQmY0ZitGb2ozc0ZVS0x3?=
 =?utf-8?B?Wis1Y0VPdFkxdUU5TExvaDY4N2VDaWdBRnRHTkg5WStaUGFBNlBXdW0wV0ZC?=
 =?utf-8?B?WTdhZE40azN1MTNKMTNLZEoyeDhkbGJtRWFhK2xETXNvNUU3enlKdVVxalYw?=
 =?utf-8?B?a2hZckVYSkpUY0NDZDlOUkkrcXlFUVFjbzRRaHFWTmFzVmM1ZWZvU1lnVEd2?=
 =?utf-8?B?ZTUyL3VGWXNXaWxMdVFzREt2Ui9OYXdHZStsSGRmSjlRMzRmSTB0SWtyTnZQ?=
 =?utf-8?Q?DSnHTy3DpfowWnm5I+fS68s=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10249
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 499551fe-9067-4190-202e-08de73f3f461
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|14060799003|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlpDOWtYdkgvV2JzRzA3YTZWYzJFZmFmL2NQL3RhOUlaL3RycHNLbWVjOThN?=
 =?utf-8?B?V2J4TmhQbEV6VFd3VUZTUUNGS0JGMnRFSDVDQjM1QmVzYmJ3MUdoZjhTWHNY?=
 =?utf-8?B?aXBRQlE4ZU5ha3ZGem8vRVc3TXd0b3ArME5WeDA5ZURGU2hiZEsrRzVMWTh0?=
 =?utf-8?B?enJ0aTI3Z0dNUDhkTmZDbE9yWjY5Tk0ya2lvVGRKQ0xuTUp6UjRrNTNoWG1U?=
 =?utf-8?B?d1lrQm16NmJJNzl5ZEs3VzIrRFNUMTMzMWI4Q1NtcWJVNGloZllCQjBTNGdL?=
 =?utf-8?B?SnZPaWhlZGRhQ2FmdElldWFuQXhvcXFkM3VxbjJFQlB3YVBjSVdybHozbUxV?=
 =?utf-8?B?RUliRzE1T2hyY1c5R0tiN1N6dUFwL3NEQXBZYTErNzJ1bkU5L3g3RXd5N0dF?=
 =?utf-8?B?d1ptQmdXZmpLYzRKdi92Zkk5OUh3SHhENnh4NlZkNmVEUCtFUW9NWmdrZDJD?=
 =?utf-8?B?amFxVHIwMWpQeVlOTjNId0ZFRDRsYkNXYi8xN1M4SUJJOU5UcTl3LzhoSFVW?=
 =?utf-8?B?YmNia1MvVzlzM3JXU0ZvckxiczdZVHI0Q3E2bUFNK0lzeGN2Y1hxckMwMm1E?=
 =?utf-8?B?cytGdnlVU3lac3F3cDR0dU1KbjJtKzlxZ3NxSStMSnA4VitHbHFTWGpPOFdn?=
 =?utf-8?B?SjFTaGwzcXE5cXRNMy84VzNyVTNSMDFzZmd5YjlINU5zMllHd0ltNXNYSktT?=
 =?utf-8?B?N0F6VHpBUDZkalZsWHJYWnI3WkRTNFI4N1R5WE04Ymd2Mmtyay81S1hsTFJJ?=
 =?utf-8?B?dWZMc1FLV2RsUnRxVTdxb2FxcXJzS0xPdmh2VXQ2NG41S0tQTjZJamFqaitm?=
 =?utf-8?B?ZzdncC9vTEpJVk1xUHl3clIwVTBUaHFqVUtUV3RrMnk3NFE3Y29IMG52Tk9O?=
 =?utf-8?B?b2JhMHFha0VLUXVnV3BZSmN5Zlp4K3NMK2FNelhNbEUrU0VYaWtpSGhHOWg3?=
 =?utf-8?B?Z0N4MzkrdnZGU01MUUtOdDlicVplN2tjMlozaWN5ZDVMRXhYd285czFsQzVk?=
 =?utf-8?B?UlNKY0FIUXBPUHlydkJ0cHRiRVAzQ011NnBHWGhGeXlLM2pvMDlBOXE2bUFT?=
 =?utf-8?B?Lzh6RTdjT0dRTk5LL25kWkVqaXJFYUpoL3ZESlJaMWJTT2hrcWMvd0YzM2Zq?=
 =?utf-8?B?WEdEdzZEeVFHVUY5cnlyU1NVajl0R3c3MHVsNlFYekhpdnE4VWxMbzlSdFNy?=
 =?utf-8?B?SDlhRXhzMWhMS08rNGtjK1FyZFVqV2VZMG41ZUZ3WlBIYmVOV05HZjcxekpC?=
 =?utf-8?B?MFJ0NWhMbVBWM295MkZyTlJJVTU4bS9mVFAxb3FLa1Z1dFYrRzd2cWN3ZXI1?=
 =?utf-8?B?M1ZJc01EeXhXSVlNUWQyaXNtazh6NE1oMGkyc2ZTZkpYRGkwN2NGR1dBM3o4?=
 =?utf-8?B?OWk1RHZtN3M3TzhLRWNZampIVy96M2d3ZmtUVnptMTFzOGhTS1VjY3dYODYw?=
 =?utf-8?B?SGxBamVqWDFlV3Fkb2V0Rkhld29mbjRhYTZlaUl5ZkZsS2FzV2JsWnJJWVlY?=
 =?utf-8?B?SGp2dUs3R2R0R1I1QjZBT1JIM2djZnRUV1hKS01TRkJTWWNyVDlIMllLZ2Fi?=
 =?utf-8?B?K1lNMTQrTUpRYzU3OE1raGExQm0zUHA4K1grbks0UUxnb3FQMlhPRUdkMVp1?=
 =?utf-8?B?OVE2QnpaWGJIZGZQWENRa0wxSlprSGViRWoyZldVbTY1NnN6U1JpeWg3UmpK?=
 =?utf-8?B?QzhycXFWc0I5cW1UNHlBSlNoSGJhTk1lcjJ4VnNteFpGVTZiVjZLWnQwQjZH?=
 =?utf-8?B?OGNjdWhGRjlGRURuZ0hXNWZvSUkzajFFa2sxYm9vWkpKWk9lcjVKWWtjNHhH?=
 =?utf-8?B?d2JENnF3TktmSGhkdllGbjFLaTdoVnVtZG1SZVRYNGtEbzU5ZDdBNkQzNzhu?=
 =?utf-8?B?L012dDdEMXo4Zi9TNFdRTWVmeHUza3R1Y0hqbEMwYTNxRE03QXpPTlFLbnJv?=
 =?utf-8?B?M1hoZG9acEtRWUZzTks0ZEJsWllqREswdEdMNlQwVkx0MzNmYW1HcmgxWE84?=
 =?utf-8?B?UFMwd0t3ekV6VHh6WkxoVE9ENUNwOGhiRHFrb2c2bzFSdGR2eEZKL0taR1ox?=
 =?utf-8?B?WTlab3AwZ3JXWUdtWDFseFE2cGRYZzhyc285cjlXbFBMZTZ0M2FadWI1RTNi?=
 =?utf-8?B?R21KNUQ0WWRKWHFsTVRncXFZazliOXNaZXlxU0Z2a2Q3NUc1NFgrNmNPNER0?=
 =?utf-8?B?U2hlemNGejdOZ2htZ1pLakFRWjhDNERtMXV2enN5R2dRK2FMaWxKOFUwS0NI?=
 =?utf-8?B?YjFNMVQ4RytZSm4rVERLZytzM3V3PT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(14060799003)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BdYARVzZAh4Rt9wISnxCBZI/JFV9lJcqnYUzB5kEjU696JQZdM9hRqLX0XX+H12yNBHPKq140s6M0/RU2205XsUBp0VAb5gPg7miT4dsN/Un/CCrLEpYVyI9ItCEZYFTB5ESQz1w7EWTAmDsd+G+6xixc4IPgHDsgRSnRRNuSdkDOKwhUpxAJ1UC+Fo0jWvAFx57858ZGR+QsjIV2fK9rXnDGaOIEcTIoDnlP3b4lf29/5zv+s/Kt5y7ILU9WgjF3aopQgtg2i4+ukzP8lz2IYnznKToVzszPBvTNaCekw56cVnEmKKt/VKucgT3sLWrrASVJAaQ3wonatxruTExrENM3SUed4/AyuGjGTbNGmxE78fNUOkjrp9mTu1pjmXXOEixc18ixUCD7nfFHaBYKL2NnmMLh7fHWdGfJZsxRGm+zoyYueoVw+hGIw5jjKYL
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:29:01.2737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d83b27-eae0-4eae-2af9-08de73f41c19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_142909_112642_9EEAC68F 
X-CRM114-Status: UNSURE (   6.91  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVvIFlhbiA8bGVvLnlh
bkBhcm0uY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAyNCwgMjAyNiAxMDo1NiBBTQ0K
PiBUbzogU3V6dWtpIFBvdWxvc2UgPFN1enVraS5Qb3Vsb3NlQGFybS5jb20+OyBNaWtlIExlYWNo
DQo+IDxNaWtlLkxlYWNoQGFybS5jb20+OyBKYW1lcyBDbGFyayA8amFtZXMuY2xhcmtAbGluYXJv
Lm9yZz47IEFsZXhhbmRlcg0KPiBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gQ2M6IGNvcmVzaWdodEBsaXN0cy5saW5hcm8ub3JnOyBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBMZW8gWWFuIDxMZW8uWWFuQGFybS5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gY29yZXNpZ2h0
OiBjdGk6IE1vdmUgcmVzb3VyY2UgcmVsZWFzZSB0byBjdGlfcmVtb3ZlKCkNCj4gDQo+IEN1cnJl
bnRseSwgQ1RJIGRyaXZlciByZWxlYXNlcyByZXNvdXJjZSBieSBkZWZlcnJpbmcNCj4gY3RpX2Rl
dmljZV9yZWxlYXNlKCkgdG8gdGhlIGRldmljZSB1bnJlZ2lzdHJhdGlvbjoNCj4gDQo+ICAgY3Rp
X3JlbW92ZSgpDQo+ICAgIGA+IGNvcmVzaWdodF91bnJlZ2lzdGVyKCkNCj4gICAgICAgIGA+IGN0
aV9yZW1vdmVfYXNzb2NfZnJvbV9jc2RldigpDQo+ICAgICAgICBgPiBkZXZpY2VfdW5yZWdpc3Rl
cigpDQo+ICAgICAgICAgICAgYD4gY3RpX2RldmljZV9yZWxlYXNlKCkNCj4gICAgICAgICAgICAg
ICAgYD4gbXV0ZXhfbG9jaygmZWN0X211dGV4KQ0KPiAgICAgICAgICAgICAgICBgPiByZWxlYXNl
IENUSSByZXNvdXJjZQ0KPiAgICAgICAgICAgICAgICBgPiBtdXRleF91bmxvY2soJmVjdF9tdXRl
eCkNCj4gDQo+IEluIHRoZSBhYm92ZSBmbG93LCB0d28gZGlmZmVyZW50IENUSSByZWxlYXNlIGNh
bGxiYWNrcyBhcmUgaW52b2x2ZWQ6DQo+IGN0aV9yZW1vdmVfYXNzb2NfZnJvbV9jc2RldigpIGFu
ZCBjdGlfZGV2aWNlX3JlbGVhc2UoKS4gIFRoZSBmb3JtZXIgaXMNCj4gdXNlZCBieSBhIENvcmVT
aWdodCBkZXZpY2UgdG8gdW5iaW5kIGl0cyBhc3NvY2lhdGVkIENUSSBoZWxwZXIgZGV2aWNlLA0K
PiB3aGlsZSB0aGUgbGF0dGVyIHJlbGVhc2VzIHJlc291cmNlcyBmb3IgdGhlIENUSSBkZXZpY2Ug
aXRzZWxmLiAgU2luY2UNCj4gdGhlcmUgaXMgbm8gZGVwZW5kZW5jeSBiZXR3ZWVuIHRoZW0sIGl0
IGlzIHVubmVjZXNzYXJ5IHRvIGRlZmVyIHRoZSBDVEkNCj4gcmVzb3VyY2UgcmVsZWFzZSB1bnRp
bCBkZXZpY2UgdW5yZWdpc3RyYXRpb24uDQo+IA0KPiBUaGlzIGNvbW1pdCByZWxlYXNlcyB0aGUg
cmVzb3VyY2VzIGRpcmVjdGx5IGluIGN0aV9yZW1vdmUoKSBhbmQgcmVtb3ZlDQo+IHRoZSBpbmpl
Y3RlZCByZWxlYXNlIGNhbGxiYWNrLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVvIFlhbiA8bGVv
LnlhbkBhcm0uY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jl
c2lnaHQtY3RpLWNvcmUuYyB8IDI0ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgZHJpdmVy
cy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1jdGkuaCAgICAgIHwgIDIgLS0NCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1jb3Jl
LmMNCj4gYi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1jb3JlLmMN
Cj4gaW5kZXgNCj4gYmZiYzM2NWJiMmVmMjc0NGVmYWIxMWMwNTZiODQ1MDQ3Mjk1NzAwNS4uN2E4
ZjFlZjZiOTRlOGFiMzM2M2VhDQo+IDYyZGI5NWIwYmMzMDIyOTJjZDcgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLWNvcmUuYw0KPiArKysg
Yi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS1jb3JlLmMNCj4gQEAg
LTgyMywxNiArODIzLDEzIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29yZXNpZ2h0X29wcyBjdGlf
b3BzID0gew0KPiAgCS5oZWxwZXJfb3BzID0gJmN0aV9vcHNfZWN0LA0KPiAgfTsNCj4gDQo+IC0v
Kg0KPiAtICogRnJlZSB1cCBDVEkgc3BlY2lmaWMgcmVzb3VyY2VzDQo+IC0gKiBjYWxsZWQgYnkg
ZGV2LT5yZWxlYXNlLCBuZWVkIHRvIGNhbGwgZG93biB0byB1bmRlcmx5aW5nIGNzZGV2IHJlbGVh
c2UuDQo+IC0gKi8NCj4gLXN0YXRpYyB2b2lkIGN0aV9kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ICtzdGF0aWMgdm9pZCBjdGlfcmVtb3ZlKHN0cnVjdCBhbWJhX2RldmljZSAq
YWRldikNCj4gIHsNCj4gLQlzdHJ1Y3QgY3RpX2RydmRhdGEgKmRydmRhdGEgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2LT5wYXJlbnQpOw0KPiArCXN0cnVjdCBjdGlfZHJ2ZGF0YSAqZHJ2ZGF0YSA9IGRl
dl9nZXRfZHJ2ZGF0YSgmYWRldi0+ZGV2KTsNCj4gIAlzdHJ1Y3QgY3RpX2RydmRhdGEgKmVjdF9p
dGVtLCAqZWN0X3RtcDsNCj4gDQo+ICAJbXV0ZXhfbG9jaygmZWN0X211dGV4KTsNCj4gKwljdGlf
cmVtb3ZlX2Nvbm5feHJlZnMoZHJ2ZGF0YSk7DQo+ICAJY3RpX3BtX3JlbGVhc2UoZHJ2ZGF0YSk7
DQo+IA0KPiAgCS8qIHJlbW92ZSBmcm9tIHRoZSBsaXN0ICovDQo+IEBAIC04NDQsMTcgKzg0MSw2
IEBAIHN0YXRpYyB2b2lkIGN0aV9kZXZpY2VfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+
ICAJfQ0KPiAgCW11dGV4X3VubG9jaygmZWN0X211dGV4KTsNCj4gDQo+IC0JaWYgKGRydmRhdGEt
PmNzZGV2X3JlbGVhc2UpDQo+IC0JCWRydmRhdGEtPmNzZGV2X3JlbGVhc2UoZGV2KTsNCj4gLX0N
Cj4gLXN0YXRpYyB2b2lkIGN0aV9yZW1vdmUoc3RydWN0IGFtYmFfZGV2aWNlICphZGV2KQ0KPiAt
ew0KPiAtCXN0cnVjdCBjdGlfZHJ2ZGF0YSAqZHJ2ZGF0YSA9IGRldl9nZXRfZHJ2ZGF0YSgmYWRl
di0+ZGV2KTsNCj4gLQ0KPiAtCW11dGV4X2xvY2soJmVjdF9tdXRleCk7DQo+IC0JY3RpX3JlbW92
ZV9jb25uX3hyZWZzKGRydmRhdGEpOw0KPiAtCW11dGV4X3VubG9jaygmZWN0X211dGV4KTsNCj4g
LQ0KPiAgCWNvcmVzaWdodF91bnJlZ2lzdGVyKGRydmRhdGEtPmNzZGV2KTsNCj4gIH0NCj4gDQo+
IEBAIC05NDcsMTAgKzkzMyw2IEBAIHN0YXRpYyBpbnQgY3RpX3Byb2JlKHN0cnVjdCBhbWJhX2Rl
dmljZSAqYWRldiwgY29uc3QNCj4gc3RydWN0IGFtYmFfaWQgKmlkKQ0KPiAgCWN0aV91cGRhdGVf
Y29ubl94cmVmcyhkcnZkYXRhKTsNCj4gIAltdXRleF91bmxvY2soJmVjdF9tdXRleCk7DQo+IA0K
PiAtCS8qIHNldCB1cCByZWxlYXNlIGNoYWluICovDQo+IC0JZHJ2ZGF0YS0+Y3NkZXZfcmVsZWFz
ZSA9IGRydmRhdGEtPmNzZGV2LT5kZXYucmVsZWFzZTsNCj4gLQlkcnZkYXRhLT5jc2Rldi0+ZGV2
LnJlbGVhc2UgPSBjdGlfZGV2aWNlX3JlbGVhc2U7DQo+IC0NCj4gIAkvKiBhbGwgZG9uZSAtIGRl
YyBwbSByZWZjb3VudCAqLw0KPiAgCXBtX3J1bnRpbWVfcHV0KCZhZGV2LT5kZXYpOw0KPiAgCWRl
dl9pbmZvKCZkcnZkYXRhLT5jc2Rldi0+ZGV2LCAiQ1RJIGluaXRpYWxpemVkXG4iKTsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLmgNCj4g
Yi9kcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS5oDQo+IGluZGV4DQo+
IDRmODkwOTFlZTkzZjVmYjA0NmQ5M2I5N2E0MDg1MDUxZmNhNmIzOWQuLmRhZmY5ZTMyYTZkYWNh
OTBmNGQ1ZjQNCj4gNzI2ZjE2M2ZkZDkxMDYxOTFjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2h3
dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0aS5oDQo+ICsrKyBiL2RyaXZlcnMvaHd0cmFj
aW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3RpLmgNCj4gQEAgLTE3MCw3ICsxNzAsNiBAQCBzdHJ1
Y3QgY3RpX2NvbmZpZyB7DQo+ICAgKiBAc3BpbmxvY2s6CUNvbnRyb2wgZGF0YSBhY2Nlc3MgdG8g
b25lIGF0IGEgdGltZS4NCj4gICAqIEBjb25maWc6CUNvbmZpZ3VyYXRpb24gZGF0YSBmb3IgdGhp
cyBDVEkgZGV2aWNlLg0KPiAgICogQG5vZGU6CUxpc3QgZW50cnkgb2YgdGhpcyBkZXZpY2UgaW4g
dGhlIGxpc3Qgb2YgQ1RJIGRldmljZXMuDQo+IC0gKiBAY3NkZXZfcmVsZWFzZTogcmVsZWFzZSBm
dW5jdGlvbiBmb3IgdW5kZXJseWluZyBjb3Jlc2lnaHRfZGV2aWNlLg0KPiAgICovDQo+ICBzdHJ1
Y3QgY3RpX2RydmRhdGEgew0KPiAgCXZvaWQgX19pb21lbSAqYmFzZTsNCj4gQEAgLTE3OSw3ICsx
NzgsNiBAQCBzdHJ1Y3QgY3RpX2RydmRhdGEgew0KPiAgCXJhd19zcGlubG9ja190IHNwaW5sb2Nr
Ow0KPiAgCXN0cnVjdCBjdGlfY29uZmlnIGNvbmZpZzsNCj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIG5v
ZGU7DQo+IC0Jdm9pZCAoKmNzZGV2X3JlbGVhc2UpKHN0cnVjdCBkZXZpY2UgKmRldik7DQo+ICB9
Ow0KPiANCj4gIC8qDQo+IA0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDZkZTIzZjgxYTVlMDhiZThm
YmY1ZThkN2U5ZmViYzcyYTViNWYyN2YNCj4gY2hhbmdlLWlkOiAyMDI2MDIyNC1hcm1fY29yZXNp
Z2h0X3JlZmFjdG9yX2N0aV9yZXNvdXJjZV9yZWxlYXNlLQ0KPiAyNGQ5YmRlNGYxM2MNCj4gDQo+
IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gTGVvIFlhbiA8bGVvLnlhbkBhcm0uY29tPg0KDQpSZXZp
ZXdlZC1ieTogTWlrZSBMZWFjaCA8bWlrZS5sZWFjaEBhcm0uY29tPg0K

