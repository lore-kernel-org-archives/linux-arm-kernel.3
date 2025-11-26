Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1000DD10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDy/w22G0UiQSjwYIcDT/Jx4B+S6hD1iON4TsSShZYk=; b=DrTwWJqB4kNrS9pi9jRVK/OcDz
	rVoYhCJA2OujlSSAS/ehm6cfpyxfSmzDxZTZKAXOQ+wB9SxJOxUioBV0xdOT8PHDq+LPz/H4cTfYB
	XCLoB9Hnw8RmUA4HAGh352okMnIEo4zMAgn48IQ8x1qv5soKGLd8nUAwHvT1GMhynr2araRQ1GcT3
	+NcOhh1rRhm18jT1kHrW7YIS4b4J/ZfLJ7+nb2/pES+vj4na6f0Er4RGc2dqq2ANkVRODDvncf2mQ
	mWL0BwO9cyyjkPOMGdg4Uq+Agv9dWZ/3r62HlLwTVxm1ATnbn/2kCKHyfqbgV1RIOqBC75jd3Mf3h
	nkoRyCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHaW-0000000FCB6-3AUg;
	Wed, 26 Nov 2025 15:37:48 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHaS-0000000FC9i-3RaU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:37:47 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cELkg2F3DoW7LHHDmdjAH2jfLMjnBRpwo6GBrmfkeUhBx0F0DzWme6+7xFFQr4AWAmlnhw9T1/l9aKxy1s7gegFBBKDoVQq1zv35WlWQety3ZT9gCrRA2ZUKfVfykwOYGa8f+o6yLTORr0bRtn6yKOPKWV0I8C9Uvfu/dHzm4APyPYiP1DosiD2UJ/k+c8eYEL3/FJJX77BkaVHOh3rNoDDpbwcjCyFiFYJgoP2DeMHoCmXm0xK8VNFd3xUwIFjaZ4D3/r/YGZ5lmZUgXfKW3M8S5G4IpLnx2tyQ5nCZIJPoPr6E/H2t+JD4LNlCdYDEmCUUOXi7d47qMTy6aFa6pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDy/w22G0UiQSjwYIcDT/Jx4B+S6hD1iON4TsSShZYk=;
 b=WlAvbe6D3L6qywzVdBw5qZbimq70N2UChyX0bJrqfvX6Nv5TarNPVj7he/vMId5Zqtf/E+yNdyDwfYjCnGK0teG/+Pay8wAtmhUqSN1l0ciwenOn3qe9IMeQENc0lKBqawuN4QRwM0oZn8n0ay5XoXnHeSFgURAHyn/j6z6KHfPvJKtXsmojQi5mHdZzmEkdEOwTpYaRBZsn2wmZa6NkKMnNAfikpOEZZcxe8PGy0/3xb7XkFkV9Hg5DlPwNECmpg72bfBzLTBe4Kkg5Q0q0SSiDgrpkH8Ne+RuGKdqvJ+Z4oHjRmQCP0RB6DA9/1V79Sx0i1VA6iH7D/P87immpNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDy/w22G0UiQSjwYIcDT/Jx4B+S6hD1iON4TsSShZYk=;
 b=YVhMhshLI8ug1LNoQOl0HbMftOvSJ9oAObVBwSXzcOqg70YMlTeXDT2avgLtMDrXFX7KTxobem5G9nvcf56yuyczTZMg7Dbz4Re/0PQwJJO5kf/MHNwLHxGOsQKxYfnUPt8PHoZO1MnckZBJUyCOQCBuwyS+yOTRBBNV6gCiXqI=
Received: from AM0PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::25)
 by DBBPR08MB5915.eurprd08.prod.outlook.com (2603:10a6:10:20d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 15:37:34 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::6) by AM0PR10CA0015.outlook.office365.com
 (2603:10a6:208:17c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Wed,
 26 Nov 2025 15:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Wed, 26 Nov 2025 15:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV5BmoxT0XclzrKtOrBJSrO8RU2mB2h7WTboaUJlmlNKVS+qV77vET+b7qoBF1pgyyjNiHgPO42wTWG0y1I+CeUjF0hdgGVR7WK+RrxUZuYs6nwJfhKoGgeYKHcTwo4u1nTPgPfJ/8c8FK/m+Pa9tVIVJ3ionYZTVMZuhhGvIqK2bCz3KdYh4DgF0hUo1mNCGnN98QcK3KI59vqMhbE/xUPWuGlA0wXkpYF7nEka593fWxiiQivdYVysPboXMVcXDVR/NxpQOaiD/FQrgbUB7wxL3gozHTTohkimE0743QDUHFDewyHF4pvLMbnmnFpVae1CNFKXyPbM4bnwS+rU3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDy/w22G0UiQSjwYIcDT/Jx4B+S6hD1iON4TsSShZYk=;
 b=rHVQB76GkQXflT4MJsx2HX42pgU9uAFS9jXvmfCSqZylZPZ/STL7ZTFoZLdoKbmuzFT0QHkfPFxP3H8EBKUFjVqEXCoNCAmoxDrwRdh5en2mF6NCGzCsQAHCLdO6t0Yxr/MMy2m2FNFlYRl2N2ojdpxYo+VXJeg8s6JZiDdXSj6/eq1VBI8kQoifU3Z9Jv9Y4SSQUM4+Y54nkNMBPI+UB3Tk2vum6xxrQ2w4zyjYvih8TVK2UADM8y1it7L8yo28Uxo4LANlYZRIQdvcYYd4tnisVgrQ4jFhHCxk3Vqgiqi7RGQeBaZN5IxWwcqKVIsfYYk4rmgHhuPNU4SW6ABKOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDy/w22G0UiQSjwYIcDT/Jx4B+S6hD1iON4TsSShZYk=;
 b=YVhMhshLI8ug1LNoQOl0HbMftOvSJ9oAObVBwSXzcOqg70YMlTeXDT2avgLtMDrXFX7KTxobem5G9nvcf56yuyczTZMg7Dbz4Re/0PQwJJO5kf/MHNwLHxGOsQKxYfnUPt8PHoZO1MnckZBJUyCOQCBuwyS+yOTRBBNV6gCiXqI=
Received: from GV1PR08MB10932.eurprd08.prod.outlook.com (2603:10a6:150:1ee::6)
 by VE1PR08MB5631.eurprd08.prod.outlook.com (2603:10a6:800:1ab::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 15:36:59 +0000
Received: from GV1PR08MB10932.eurprd08.prod.outlook.com
 ([fe80::7b08:8b90:6e48:c4db]) by GV1PR08MB10932.eurprd08.prod.outlook.com
 ([fe80::7b08:8b90:6e48:c4db%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 15:36:59 +0000
From: Al Grant <Al.Grant@arm.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <Leo.Yan@arm.com>, Mike
 Leach <mike.leach@linaro.org>
CC: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet
	<corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Thread-Topic: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Thread-Index: AQHcXsPMSEvtqVZk5kO2orBMmNKY/7UE/OkAgAAFHwCAAAbQgIAABpIAgAADbtA=
Date: Wed, 26 Nov 2025 15:36:58 +0000
Message-ID: <GV1PR08MB1093237396B35459656FF82CA86DEA@GV1PR08MB10932.eurprd08.prod.outlook.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
 <20251126144437.GL724103@e132581.arm.com>
 <5096f4ba-913a-477f-bfe7-f2a6bb563d30@linaro.org>
In-Reply-To: <5096f4ba-913a-477f-bfe7-f2a6bb563d30@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10932:EE_|VE1PR08MB5631:EE_|AM4PEPF00027A67:EE_|DBBPR08MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: dd22cd3c-d706-40e6-4350-08de2d01b7d8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?OJDbUqZhL7Q2VeQuBx1ktzkitXCxs2Z5dMup5OE2KJwdhI41ZMZL1mJjBZbf?=
 =?us-ascii?Q?bIiJOb9w7q0op5cfPyLqAirt4smECZRpGhR4g/t4cW6LJvuWU8EH4uF6UMZg?=
 =?us-ascii?Q?S874GrT84Xq9zjAj5qKGVyfZrCLe0CiPG6yvzHHqu2yUwo07NxZgxX8nc10z?=
 =?us-ascii?Q?ykeRVe69qsERbykpLszz4BTZQzmV8LsjdMrZzBAP8tRlfzbdCoXG4RYxbvcn?=
 =?us-ascii?Q?jvyj0uzUR6AbVCX+9U5BixTasRYADLGpCDmtzI4TVIjokm2byUBnnQlZ1daS?=
 =?us-ascii?Q?mQBjhNkansQnoYnyaRWVNarkkzLxzjYghS6fsqgFuPetCo4KuNr6aUG673BS?=
 =?us-ascii?Q?cx+ZcSuXuuBJzyImK0EzWYBSENgaqvZMpIMkhU40XWcdC0scCZ7ammuF5Xvr?=
 =?us-ascii?Q?ovhCAN6iZt8/VIu/HSAvDaaZj/x7ZhhFZdaaqQWafFs6V4MllQG5uW8wEhFk?=
 =?us-ascii?Q?V+c8kiY+UXzl3tg9gQSqRHj86Buf2LBGUiTK2ow84N2ZuXAce0RdGirV6Gig?=
 =?us-ascii?Q?xP2paI8rC1I8eOA4su4N9wQnqMnTehrEpxQmNCxIX4cTfVEZab4tgAsPBP7E?=
 =?us-ascii?Q?sn6XwBCKn9UBu2IN0K+MxwKVcSacYQlCNrh62fxXebv37Hoe+LvtnEj1feay?=
 =?us-ascii?Q?MfIxAG6UfXIEdNDmyd7r8HO0OLnJowNsesgmPpS3wLR6EC07wa3W3h25oCgy?=
 =?us-ascii?Q?qSIhBK6tkmeways0aGNlgZQUh7qrGsN96YkED/pSxl7IAHMZW3olt7ElbIgi?=
 =?us-ascii?Q?/x8guyE4xQfrE3zHXMCmZybyVM7e4/6qfT/KTQfA/aRRgNQC5N1VcnjthDr/?=
 =?us-ascii?Q?DoOLh/dAC3L7Jtd0FWq8jYWlGAguyWtB/q3Fxf8K3Dg0IuVrgjafmbEGSQ9J?=
 =?us-ascii?Q?/JqNW8TNsOSfJ5NHutKKRJxdcE4KBW69d+ei6UKD2T5/m50jiIk7lUinB7IP?=
 =?us-ascii?Q?xtijxMbolnPzeQPBJismCicuJJ+/2tH10c6iuOgECUFG1oVmXefXG420sXDq?=
 =?us-ascii?Q?usM6pQpprBldziWu33NMsM2bhJoULd5o/rAzHaCQs3V1kZ6Uahxb291oueSx?=
 =?us-ascii?Q?75bJzGhFEuyiLJRDj4AAUw9obAo/NY37ANt7Rzt1sEaz+SkV4MzmtiQJvlpF?=
 =?us-ascii?Q?GvoVYvOlGZGgRckMN7sXmRh9Tx4r5RtPK10XY0LExtKCcF6g4L++kWx0m+p2?=
 =?us-ascii?Q?XJ+dMa5tHsWjAsvzVJxONZYNZgZcGiE5iteWhWNTdsS0VF2jwuarHXsI51dO?=
 =?us-ascii?Q?kJKV566sCTzixPFtamlS9K1dJqf2d3snZdxDFmg/Lj2ZgEL4U2kuSnHM2/AI?=
 =?us-ascii?Q?gWz+jWsU4Bi0yjy5GGIZ0tDOvdDyAATDvy/+1/+aA8Mf+LqHAg9q5K9r+s52?=
 =?us-ascii?Q?axpLA34J8lt21ii9zS3qIxze63VPXwB566Xvy4jJ5C/6JkIQPlth8P1RlDuO?=
 =?us-ascii?Q?ussdJgAyPaPcjjan+XADj2tc2TRAtej6xvyve4bVoVMXd+N3amRfRULGtHiC?=
 =?us-ascii?Q?s9WUhw+hU5OJRyh0+SVEEfQBVjjuU8JWDV6O?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10932.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5631
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: dd8fcdb7-599e-4bd4-ddca-08de2d01a339
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|14060799003|4022899009|35042699022|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qkBjJMAssJDRS++3lvlX8iU1soZZcn4SD+Ud+rUh2NXK4O5f5xlXa4Srht/N?=
 =?us-ascii?Q?3OnOnZaLley1IsNYgT9ZA0smvXYa6O6KyGAUoYPliftxD3/9YDzZPRD6CIHy?=
 =?us-ascii?Q?PiLVQiFIedNYcVbBgxCTNCJmScyO1UKgue069o75G1acsaq3Pv+vi8aImFXU?=
 =?us-ascii?Q?WG5GgAnr7y5+HfBmkMQ7WhvLwhcLd5cW/i1oF4+q079s7YlHAgjYVW7cku0y?=
 =?us-ascii?Q?dKUnCEo6JFf8cTktfdHQXaUCooepVWPJh2Miwe0e9QQ9rMpooCWalAyGezod?=
 =?us-ascii?Q?nIBUyox9xKqzcb6TTzOXKH6fYe/Exe1I5gI4Kq8kAKSXsdfRHZW17+h+Ge3X?=
 =?us-ascii?Q?Pg4FN1gSeadQ/gvuZ+OKI0pSo+51GjCIrYs1nOk98spfHEdxVaSsM8LZBsjC?=
 =?us-ascii?Q?RyDTMcCE86Jx2P8aMOnN4AaLKbYwsudnbXUnok+He+U6Nzj1mEk1068u8XkU?=
 =?us-ascii?Q?K5gbHYs6BWjcp35CaXv6LBPIpa8TVtasnFxlKcJqjHwU8zLv4SRIVZ2owgyA?=
 =?us-ascii?Q?YrOIVIAqKZzxs7nVTZDtv/7YN5kj+1K/rvWYP/knJ/JsOHr2NWcbm9L17Vi7?=
 =?us-ascii?Q?L4XoKZpqpZwvsTfg8BLw29ohAXwbpeRXZ/xxwc/oUWxRv/Uetv2VnqCMKRbp?=
 =?us-ascii?Q?jhtg0fUy2OqSg5/8Cu+gBDQ4qC9ZgIkn3ar4vhsqCoYOYtO2mon4LSWSmIwA?=
 =?us-ascii?Q?UjqveBdqvmsO6+SU0exkEgd1dC3Cm6EB8FdnKuFO2cl1i5k4GOcl+RyPY7Lg?=
 =?us-ascii?Q?xuoyo/rSxJdwM0OQ18HFqYiqPoobF96fhjwj+Jh6LQ1q5OO+ejUCqCbW2y6v?=
 =?us-ascii?Q?wDQHLSqZLIxLIl0hNy05TpJwTKMQRBocpYDUeJ4J1pzwb1O8uB1O8ODhI6/T?=
 =?us-ascii?Q?SXG3NCvCZ0DF50U0uLVRP5eKE0DN0eeB29al++1PAVqp2k/TK6p9lo+wWh+K?=
 =?us-ascii?Q?BUv8/AkfdJ8Hg3towV4qJbA8BtgmK1Azrqc1UyJN8vj6FxBzFYh31xDcHM1D?=
 =?us-ascii?Q?CwE0BVkLaqRZNBOMFoluRRLS/CYJFPayDflhZUmOGERE/AAp+hE+thN1W5zM?=
 =?us-ascii?Q?FexKQsPGUcUNz+aIQ2umvs3vbS6mA+d+F9r0Qj1r9wJtnnVasMS99FH5HYNj?=
 =?us-ascii?Q?rgQgGZutag/cg03niygItabL7TSLrc2WTQ1SaoEjjG/gj2I+AYvlbzs1SWs0?=
 =?us-ascii?Q?ZxIEoQhrVJbKGh/vWWAuSSQJTTil+461kSi6f4DvgDK2MheVLY0LCx1X1mKC?=
 =?us-ascii?Q?UZl1rYnjn/yn2mW+KN3rcin6HHAhBSwxJEbsZFR2D4poJTjEiNw6zf5YlmiR?=
 =?us-ascii?Q?mOshf4D19qC0zSopmEztTDAiiZ0g0tyWRZHjOvCmO12UPNgaAgkubsLyw6wT?=
 =?us-ascii?Q?Q4FD8mpW2BxN/ITX93AINpYKCzqwtDDaluLq0n8D+eE4x4Fg0kLYGmnO1ZHs?=
 =?us-ascii?Q?uhmH9ibaYtoo8kuLUO0Q8Ty6bAN3CGJtq8oH14voa+uM35kAW5QBT4ITv+KI?=
 =?us-ascii?Q?qq8lGZy0g7ff+jkTkYdCANPUerJD368xKL9uQP4xGggDNNbR0DjKICG8yTCR?=
 =?us-ascii?Q?J/vxibosiUyi9nAL4YQ=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(14060799003)(4022899009)(35042699022)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 15:37:33.4773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd22cd3c-d706-40e6-4350-08de2d01b7d8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_073745_095973_15E76BF7 
X-CRM114-Status: GOOD (  25.11  )
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

> On 26/11/2025 2:44 pm, Leo Yan wrote:
> > On Wed, Nov 26, 2025 at 02:20:14PM +0000, Mike Leach wrote:
> >
> > [...]
> >
> >>>>      * - timestamp
> >>>> -     - Session local version of the system wide setting:
> :ref:`ETMv4_MODE_TIMESTAMP
> >>>> -       <coresight-timestamp>`
> >>>> +     - Controls generation and interval of timestamps.
> >>>> +
> >>>> +       0 =3D off, 1 =3D minimum interval .. 15 =3D maximum interval=
.
> >>>> +
> >>>> +       Values 1 - 14 use a counter that decrements every cycle to g=
enerate a
> >>>> +       timestamp on underflow. The reload value for the counter is =
2 ^
> (interval
> >>>> +       - 1). If the value is 1 then the reload value is 1, if the v=
alue is 11
> >>>> +       then the reload value is 1024 etc.
> >>>> +
> >>>> +       Setting the maximum interval (15) will disable the counter g=
enerated
> >>>> +       timestamps, freeing the counter resource, leaving only ones =
emitted
> when
> >>>> +       a SYNC packet is generated. The sync interval is controlled =
with
> >>>> +       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by defau=
lt.
> >>>> +
> >>
> >> What is the default value?
> >
> >  From driver's pespective, the default value is 0 (disabled).  We do
> > set default values in perf:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre
> > e/tools/perf/arch/arm/util/cs-etm.c#n444
> >
> > IIUC, the default value would be the same with or without this series.
> >
> >> As far as I recall when this command line parameter was a bool then:
> >> perf -e cs_etm/timestamp/ <program>
> >> is sufficient to turn on timestamping.
> >
> > Hmm... with the latest perf, we must assign value to `timestamp`,
> > otherwise perf will report error:
> >
> >    # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 l=
s
> >    event syntax error: 'cs_etm/timestamp/'
> >                         \___ Bad event or PMU
> >
> >    Unable to find PMU or event on a PMU of 'cs_etm'
> >
> >    event syntax error: 'cs_etm/timestamp/'
> >                         \___ no value assigned for term
> >
> >    event syntax error: 'cs_etm/timestamp/'
> >                         \___ no value assigned for term
> >    Run 'perf list' for a list of valid events
> >
> >
>=20
> That's unfortunate and not what I expected. And I don't think it makes se=
nse to
> remove that validation from Perf. The test uses "timestamp=3D1"
> so I didn't notice.
>=20
> Can we accept that people are most likely using the defaults so timestamp=
s are
> already on and they wouldn't be using it? The only real use case of that =
at the
> moment is to do timestamp=3D0 and that doesn't fail.
>=20
> Although it's not the default for per-thread mode and I did find the Open=
CSD
> HOWTO.md uses it as an example. timestamps make less sense in per-thread
> mode as you don't need to correlate between CPUs or watch for context
> switches.

Timestamps have a more specialised use in per-thread mode, they are
as you say less essential for switching in the right context to decode
the trace, and less relevant to BOLT/AutoFDO style usage where the
trace is collapsed into a heat-map profile.

But trace can also be used to get a detailed timeline of CPU activity -
a non-invasive timeline that can trace even through interrupt-disabled
kernel code. And for that, having a global constant-frequency timebase
becomes more useful, both in its own right, and to line up traces
from each CPU with other CPUs and system-level traces.
It's also the only way we have to indirectly observe CPU frequency
adjustments. (Intel's Processor Trace, which is generally similar to
ETM/ETE, has specific packets that trace CPU frequency changes.)

Al


> I suppose we need to choose what's worse, breaking some subset of Perf
> commands in a slightly annoying way or having two separate options to con=
trol
> timestamps that you have to use together. I think it's 50/50, maybe with =
the
> breakage being the slightly better option.
>=20
>=20
> >> This is worth mentioning so users can correctly assess what happens
> >> for any existing scripts they might have.
> >>
> >> Based on this then the same command must set the timestamp to 1 -
> >> which will have the same effect as before as we do not want to break
> >> existing behaviour.
> >>
> >> Mike
> >>
> >>
> >>>>      * - cc_threshold
> >>>>        - Cycle count threshold value. If nothing is provided here or=
 the provided
> value is 0, then the
> >>>>          default value i.e 0x100 will be used. If provided value is
> >>>> less than minimum cycles threshold
> >>>>
> >>>> --
> >>>> 2.34.1
> >>>>
> >>
> >>
> >>
> >> --
> >> Mike Leach
> >> Principal Engineer, ARM Ltd.
> >> Manchester Design Centre. UK
>=20
> _______________________________________________
> CoreSight mailing list -- coresight@lists.linaro.org To unsubscribe send =
an email to
> coresight-leave@lists.linaro.org

