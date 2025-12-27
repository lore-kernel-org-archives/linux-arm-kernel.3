Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F94E8FDCD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 15:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+8C9vSToP+8IWwZ+Sq1hQ3ZZzziPT71ZacggKayfOg=; b=kmEbMal76Wa0ii0EH5dJDGgUSs
	/XI0N+aF+2QUhoVQnCdLxPOCdC1i9w72xtBHwip8IjAAObUZOHHfnrMijl6c9BbOhOCCPHscxtyxG
	eVgMDFHYWktI8Ink3fxcs6TWe/zuMNJaL8VwrShI98v2tV5UZlDtxXZNMkIa9FkmCfyJcdMVeFnmB
	22YxVfemEYnWREMXOe1X6BJpvpbYv5qksfhbLRI65/8gKCw6SmaNj+tavGCJ4cMLRUOp4xtKUNYTW
	OgnJLvOo6ICTDMV11XuaQjFUPK9zCXYbFqrtO0Pw+9yKCc4RjQDvJEtAEGX9DiPCzd5oupTvdWU1j
	TI0udkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZWWd-000000023Ya-1oud;
	Sat, 27 Dec 2025 15:48:15 +0000
Received: from mail-northeuropeazon11012071.outbound.protection.outlook.com ([52.101.66.71] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZWWY-000000023YE-2WwK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 15:48:13 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=R1g/tX0XMoLbs6SC3ltVAYDbdGPZ5cuq97Mm5DPZe70zIWj+w/qEba1Zh4hRgkI7OkoDBvC07jNZ+v00qlo5ZivPkllKwI552KV4CwHZuClxFKgrftbBw8fp1GLBhHtFClL12wxfkCOpr1UP935N3SRsSh207TttNaWGleBJSFonLxwq9z2LEDaFJi3SkH8H8qR2xNDGOp4ITIoeehdq3P/POakqHq6D41dS/5/ZxCyJG9RQTw0sMMw6S+uq1/HS8OZLmT4LgXOifZSHU8RkYk+KbyJveLlLenIJrk3Kw1j1UGkhbwPIR2RCZkSszgFHR3VZVHn9tvZH1aAgXamtYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+8C9vSToP+8IWwZ+Sq1hQ3ZZzziPT71ZacggKayfOg=;
 b=dsSOkvKXF9gy3XdxwlqblUsec4JqLKFOkECHgRFhQx04zrKxQf2ASnbIz6HqR6GGyBvBZO7uXmotM/jjpvkd21zsTc9NVurYvRFwb3JVksc7D4HoM1cckXT7bOrOVzI1HpkQdRmAYKYVns6HMG4bKjUNqSMsWppFvWag9Uf1eDOEN7Z3HkZ7kHFAsfpTBQRMvY8EckEncqhWMJniaEbTSrrNW5W4OJGTKmTbPZ/zpTVPINbUMiFEJbuYFJU3dnnwQdTmkuN2K2innY3xe0e0hD6Oaste1DnTTOwDhyYSH2LbIU4ITjhKZE2IEcirfD6yywRJdmjESJF2qYtZwgez4g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=samsung.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+8C9vSToP+8IWwZ+Sq1hQ3ZZzziPT71ZacggKayfOg=;
 b=OXjvY770XTEb591AM0b2S6OWveMRdi934+IlZwqhn7294uOIJruo8xJmqRRJBxuV0d2DiI51cTTJbRf248hI1HnY/eykq95kFZXZhw0J7uCDaATaNH1KEYPQvpFqrN/+kAAenz9nfPvjqNZ2EJALFq+RofubJ0xqMgU6wUGQhcA=
Received: from AS4P190CA0046.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::29)
 by VE1PR08MB5742.eurprd08.prod.outlook.com (2603:10a6:800:1a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 15:48:02 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::1b) by AS4P190CA0046.outlook.office365.com
 (2603:10a6:20b:656::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.13 via Frontend Transport; Sat,
 27 Dec 2025 15:47:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sat, 27 Dec 2025 15:48:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1VDTmKw6aGH02uS9ukayEe/WNuhiEvDQbrgwalwMIN7u18tNa10HE0LlPsdh/n93uB8JWeLoz34QCNp0vWkW9aZMKEDP/QM35X71NtBBeLHvUBhBKbBVZqQuNw5QoEK1BCEzrHtHi7a6xK184BpeSuhILkONvhFzMkZZyCtZfOmy5qTLlsLH7JXvk8BiAlpgyohSPhRWDlene54C5cB7RX4W8IQgihKBHlhPqNBWGHzKORlBgy5Gq5UgBco15kQlBDx43mGXC95/l3h8k+RSA2lLjOWterfQBwaB0ZgBFQhi12L3K4uNxSDkT3tNk2ZzcRaMyDo1VGV7/FjQnHxkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+8C9vSToP+8IWwZ+Sq1hQ3ZZzziPT71ZacggKayfOg=;
 b=T6KQO9tTGzZx2K70+AJ554fGnXT1bjl2BtmvPnkeTvZFLrE5W/fCLu3tBJ/H6utqf3WpXcQ0FIAU37S7dNUSTskBn3MPReT1UxsTRnGsVzOsrd1PmUhFhAesxMClakUyYvki6xpqd4oAhCwoKBQEz8Wm4MidfvmpaA33L2BhJlI9q8xhjraCuXGl4VshWTx+Cnl+CK5ay4B4dzCT57KCEmS48CyBP+ShU6NzN9+hywEZJ9bIES1r5kZxnqEHdig2cIJ/90Xk24pLYhwZclptamCbZkRuW87S/bsowLyPIOgPtfsL2C4PkYozJcZ8TwpoEurYdpYZxzwMvGI6Z0o3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+8C9vSToP+8IWwZ+Sq1hQ3ZZzziPT71ZacggKayfOg=;
 b=OXjvY770XTEb591AM0b2S6OWveMRdi934+IlZwqhn7294uOIJruo8xJmqRRJBxuV0d2DiI51cTTJbRf248hI1HnY/eykq95kFZXZhw0J7uCDaATaNH1KEYPQvpFqrN/+kAAenz9nfPvjqNZ2EJALFq+RofubJ0xqMgU6wUGQhcA=
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB8434.eurprd08.prod.outlook.com
 (2603:10a6:10:3d6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 15:46:59 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9456.008; Sat, 27 Dec 2025
 15:46:58 +0000
From: Yeo Reum Yun <YeoReum.Yun@arm.com>
To: Seongsu Park <sgsu.park@samsung.com>, Catalin Marinas
	<Catalin.Marinas@arm.com>, "will@kernel.org" <will@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: Fix PIE_E1 mapping for _PAGE_READONLY_EXEC
Thread-Topic: [PATCH] arm64: Fix PIE_E1 mapping for _PAGE_READONLY_EXEC
Thread-Index: AQHcdv9vc1R9dn2rnkG8b2msubKVFbU1oPio
Date: Sat, 27 Dec 2025 15:46:58 +0000
Message-ID: <GV1PR08MB105210D9BD328C2446CA8C551FBB1A@GV1PR08MB10521.eurprd08.prod.outlook.com>
References: <CGME20251227070633epcas1p3a8f7c19c9f5114a46765073fa16ba449@epcas1p3.samsung.com>
 <20251227070625.217349-1-sgsu.park@samsung.com>
In-Reply-To: <20251227070625.217349-1-sgsu.park@samsung.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB10521:EE_|DB9PR08MB8434:EE_|AM3PEPF0000A798:EE_|VE1PR08MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 58a5ebb2-f820-4a2b-507e-08de455f50e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?0ftTNN6E2E0RibKW8L2d4kJcS+S5pVc4CkPc+EW9NmkxBL8Mx0lq674HiF?=
 =?iso-8859-1?Q?6J/vK/eSO775PsPkRiFfTiInExb0dCZz0yIVWAmolGDVP0To2LJ9M6h1XC?=
 =?iso-8859-1?Q?lHSmwLuKKdr6OPR1sOPeIHFHrjiJ+mS7LgaL+Nd4WDg7nhlDqmV1rkkKoJ?=
 =?iso-8859-1?Q?uN84FrznyujRLenOXsdkFa9uDHwlbCYiOn02It16mA6W3MZ+uXV+eoVa7G?=
 =?iso-8859-1?Q?fimsBAgbAvWvtkpyZWapdhtnphX4HGiRI/09x6zopryFeU8ARc3j8PFqss?=
 =?iso-8859-1?Q?853uslMmDRF6GSKBtvoW/g+P72i6by/suzzD9bSSovJoDrmrvpELG1AlPm?=
 =?iso-8859-1?Q?2YCWZ9hcXHuAS1MHCK/yZcdPV12zgwfw7JU0Ji/bmHcEDdO5+969kTCGd1?=
 =?iso-8859-1?Q?9ZeOmDuLZ+1ADCr84VBRr883pjCpqfxuHnZ51B2l4Qwrg+NwMbAM0K51Ox?=
 =?iso-8859-1?Q?IUSOOfnWLCe9jJWgn8Zp0eIgc98cAX0oDENs3RmrTbkwl310IlZ8f9eHM1?=
 =?iso-8859-1?Q?acPhbafcnJp5NoIULEDV44YFax6J8Z2jkANxOvEI1OZX8ofqUBAXHaXMjy?=
 =?iso-8859-1?Q?8GUyhvczNja7b5k0l7iwNRRwPDczwxUE5YghIUi3eHTmoV+63nWOMg9eEB?=
 =?iso-8859-1?Q?FRgZXMZVfqeuwbQS2IWKUBfdRnBAH2Bht4tSXCnX5LqRMugMhivu29ZxQi?=
 =?iso-8859-1?Q?otbC9yNuyp8BqZBUOO5WV4b/uqN4Bcwoe+hNpU2nfcU7zCulmOpkU6fpzm?=
 =?iso-8859-1?Q?paXnJEl63QUlQJjCU8biGHOLuJkLWW6akU/SeUcIRl89/wNwd0qRSNfLzX?=
 =?iso-8859-1?Q?5cRWA44y8zg2JHNuPMZUWf0+Ymh0wc+CgAxDxQ/1LEAihJshGY84hkSqVM?=
 =?iso-8859-1?Q?Uf8MR9iaHqll6t+4G8BiFY5+/lTEWINjP4KGZumyxj8009Oz8vD5wKT6y+?=
 =?iso-8859-1?Q?D9S//QFOlcaNrGKLbQfdI2ATR9iN1ZK9qBWWmsrVWSZMT/qJBdrGUpBNc6?=
 =?iso-8859-1?Q?DzscLW8ghndywp2PKw30OTdWK/CixNVR+COKu/QPjKsWuxGfi9ZaWsI5um?=
 =?iso-8859-1?Q?ACddM0DNkC1y1hdfdTck2QtH3yGCNGM/a/uGTWvAysBUjAC+1DEJND+Y6v?=
 =?iso-8859-1?Q?SR30b6x6vYzYvoyTZTunPqkcprgMcV1XszMwDe1rotXPTFr3AJaJwTLsht?=
 =?iso-8859-1?Q?BgRT5kXtDLKaIzU+NF5FNLBCaRZUQOPHJ+BqXYYxTy0ZdKMmcNYgQjJs52?=
 =?iso-8859-1?Q?cKgTdezrXvQueMzjosxBPuoRUPJLHq2ecai8YDEkQvo1lRgBnM5/sHuOjZ?=
 =?iso-8859-1?Q?ultfaM4fmvssFY2kdsDG1aGaAdJfu53SVDDfck8BoSf2cbDbUPnH6LDMep?=
 =?iso-8859-1?Q?CshcRr+h00wkm8Zyhn6VgSl5m9pgOKZzjXsng1OesFch2/jc2HT+sIHMn6?=
 =?iso-8859-1?Q?0A6xneEYlR5CvO2tE5btoik3Go30MuleWy7Elubi4xYzUSd4n/TT9ZQvwX?=
 =?iso-8859-1?Q?ZaijexM8X1Myuo1xQauWWd25OJZ4q8AB+tlTKue+Du5snG9CplzmD7rzAv?=
 =?iso-8859-1?Q?7XbODjlaV7ppnTiZ58KrLRjPVek3?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8434
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f4ee8271-ee82-4b7b-4c4f-08de455f2b48
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|35042699022|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?2mNWA1xIIGYSPLvjedbEP7cfjrR4FeDSPfPvUsF9Cdjav1gSV96oGn/a1r?=
 =?iso-8859-1?Q?pRspMXNyBAnYUdZIcNXrcSk13v1IA1d07UOr313Z7fA8rGQXI4bpv2/mbq?=
 =?iso-8859-1?Q?WgRvS3qqd/4tJjoeCHosuL73ZOf+J8XqEFUhdFmaVyUwhfd0bC8GI1XY20?=
 =?iso-8859-1?Q?VnyBsT5DMuDJFCyAbca4geUf0XIq6wbrDNWUJYWuEq8rYKC8diOTvGVN5U?=
 =?iso-8859-1?Q?/26Izwl/sbjPjXriOu7GnTjLpfDP5bG8ZimykJ0R4ImUYIgCn2igajy17F?=
 =?iso-8859-1?Q?5UVdLrtiEx+/sgBXJeWSVVFVfODbFDffKFK084c9CSpZZnaz4X7INdEYEw?=
 =?iso-8859-1?Q?bGF/qV/Tf7bbtUMJF9W9vy+DlPr0n4EP4sGz/hi03Dd31aw8pk0xOrnfgO?=
 =?iso-8859-1?Q?+RpRHKAUHLnTZyjam1dVNhrJ76pYsB1ytdY6NXonQeu6wTmRMDlB+YDhZB?=
 =?iso-8859-1?Q?+hkzNqmGeoX2SeUQNyt4Kc1Eo4mlM3D9VTnN7AF3g9uEWrB3Mtniu2bRXQ?=
 =?iso-8859-1?Q?Uj2IgtAX8rI3/DD2G0dubjlOvzaKF2Hx2yOS75c1aqDG5QpYG0LOmgsH93?=
 =?iso-8859-1?Q?ssKY8Sikdtx1krrwqxt00tmdsESnfUNBHhMuTq4l4bXYhJSEQnEakqk+/A?=
 =?iso-8859-1?Q?BsFFpbDgpwAh2Qg9Y/fUxr/iADGOvtkq097TgPmCI+XLGOf2yNSbmTqt7z?=
 =?iso-8859-1?Q?WgNjti6RWtw3NioEhhxl7vNpino2V3Xmt4BxwldhQad74R8MFMRIa2zIEI?=
 =?iso-8859-1?Q?oludMGKaqoeQaqJ/qsn4eWkzq/pYSY9EDIIdIqLpb6rfYxNVW5KlAF/ywH?=
 =?iso-8859-1?Q?qXbMbinHJWLqAMncvZJG8O6FwD38R0rIaUEg4oAQv7MdDpGUaflVyMWevF?=
 =?iso-8859-1?Q?oqX3LlwZ9MksmJtZi8ld6/I0Xux/idleJJU24dkw4aefDpY++/Kmy+FTiO?=
 =?iso-8859-1?Q?30RjeDZU3gkGEFB88yqAdWUk2fwKkldKGDaPxOCriYU3CTrLtbuCRueUkn?=
 =?iso-8859-1?Q?grKvBCCohHefRL1PcTOUOPHXO6CRrROKiyBbpZ3m32gAcn7YXqexd3RoRo?=
 =?iso-8859-1?Q?J64yPs1KKQ8qgbj31sYc+HvJRwk4j/p+tZBGKReBN/mvnKFR8j2j8UESsm?=
 =?iso-8859-1?Q?/gONmKFcfOZw1dhwJnixXCGIs6M0+2Q8VqRyRNj9LS1S3t1WdcHCjMmfQB?=
 =?iso-8859-1?Q?+p00W1z1tNkdh1KvsQgFC8GXvXBsmJsazV444JtjTVZMX7UBHpv53fdRG/?=
 =?iso-8859-1?Q?+frWqi3JPtzwqYUxOhqV1Spwlyn8oN//sg35x2+gf/dpZa/tNSE4Cy3qNk?=
 =?iso-8859-1?Q?j9GHM/+qVp2OQXUM2zxVQlZCnsr7uN6QIiSCjOpqM8/ExagL8pbd0otBiY?=
 =?iso-8859-1?Q?ODGSZMMWHCDF+bMW7BuRX7Aa4jr8gGxe7+hl+uLyluvufxw/lQE4iQEKcv?=
 =?iso-8859-1?Q?5pCrzr3Gm5SoCUNKqJMMc5BK723tvcfkc5vYS0Gk62xEEhbydNVmlwuzEp?=
 =?iso-8859-1?Q?6nPimK7WgZNQW74x0aaNN9Gip0Ug8s6kkwv8W/ljYjraA5mLenoYAUtpzg?=
 =?iso-8859-1?Q?IBv2zamOgvSavT3nvWBundePSC2tzBOXjAJfOzLvAQo2vx8je366PS23zr?=
 =?iso-8859-1?Q?LzBrrfdt7PgYY=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(35042699022)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 15:48:01.3731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58a5ebb2-f820-4a2b-507e-08de455f50e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_074810_872364_FEF5463B 
X-CRM114-Status: UNSURE (   8.92  )
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

Hi Seongsu, =0A=
=0A=
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/a=
sm/pgtable-prot.h=0A=
> index 161e8660eddd..ca14f61dee81 100644=0A=
> --- a/arch/arm64/include/asm/pgtable-prot.h=0A=
> +++ b/arch/arm64/include/asm/pgtable-prot.h=0A=
> @@ -180,7 +180,7 @@ static inline bool __pure lpa2_is_enabled(void)=0A=
> =A0 =A0 =A0 PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS), =A0 =A0 =A0 =A0 =
=A0 PIE_NONE_O) | \=0A=
> =A0 =A0 =A0 PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO), =A0 =A0 =A0 =
=A0PIE_NONE_O) | \=0A=
>=A0 =A0 =A0 =A0 PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_EXECONLY), =A0 =A0 =
=A0PIE_NONE_O) | \=0A=
> - =A0 =A0 =A0 PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R=
) =A0 =A0 =A0| \=0A=
> + =A0 =A0 =A0 PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R=
X) =A0 =A0 | \=0A=
>=A0 =A0 =A0 =A0 PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED_EXEC), =A0 PI=
E_RW) =A0 =A0 | \=0A=
> =A0 =A0 =A0 PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY), =A0 =A0 =A0P=
IE_R) =A0 =A0 =A0| \=0A=
>=A0 =A0 =A0 =A0 PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED), =A0 =A0 =A0=
 =A0PIE_RW) =A0 =A0 | \=0A=
=0A=
=0A=
NIT: This looks like it allows executing user code from the kernel.=0A=
Why is this necessary?=0A=
=0A=
=0A=
-- =A0=0A=
Sincerely,=0A=
Yeoreum Yun=0A=

