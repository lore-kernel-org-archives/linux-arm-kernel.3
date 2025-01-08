Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344C4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 06:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6n/aBNf5a4+ZBeoxacw0S8Nc5Tt5WavvxZJccO4jxU=; b=DB6Lx8AHvKxWX2mZ5rz/267hlI
	c3liK0mx9Dl4kGhg8aTS5TguQNsdgW4+GEgrJi12xqx1uUwXIjWbErnCdmSl5rN2hAkJ2AGyAxysc
	p9tDMhLjZ0sgoeJEv5HqvYPiqJz2AhqoPO7yzxfz9HQzdEDGGRyRhZn89KlU1OGD7qXPLb1NeCwXz
	Q9FknLKq51BF8FiV5ijesxYtP43VIUsr8cvU05QGM4nCImcWcOvypEDtn7d7/FK5uEC9dUNhfhoAy
	ukxDrBjg5rHAmx/BsM+5lsF4hV06JTg/S+TEREacXMwttMTTQmaXb5q45XeafmUqnd93SdLWI9PL9
	xH+lbYKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPpj-00000007Iu8-0CAV;
	Wed, 08 Jan 2025 06:46:27 +0000
Received: from esa6.fujitsucc.c3s2.iphmx.com ([68.232.159.83])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVPoU-00000007IqI-3NVT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 06:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1736318711; x=1767854711;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=n6n/aBNf5a4+ZBeoxacw0S8Nc5Tt5WavvxZJccO4jxU=;
  b=imUJAFeRnqA+vdaFRREc0IXtct4ydjGaynYUlL5oPUOLQ6Mw91c4dPDN
   diPKVzQ+QFrip1l/FGAe52vGnfGJ7+BY/oKCH+utlVYR9L6VK27J/DLq4
   GrW75Iti4C52XiXrpon8ovFIAZ6rCrqrya+aIxku+AMeA5Qv+00WldK4X
   fuVlKlXWio0O/80r0tY6UdpUlgf3X0Uyu3Yqm/H8E2QIHL4MHjBGnBV65
   O9PE6rEGg866GsnFiVDGnaZRZOmXurmVlX1CkD4SnR6nKHy4PpySME4e8
   3n8SeJ3/+PPAzmc+bewbJ5e1MOIA4xrTHdulv/yY3K7WGesuxCx1xn70u
   w==;
X-CSE-ConnectionGUID: tRCQc85YQdW3o4BBjZgiag==
X-CSE-MsgGUID: K+nLEe6TRXWKyTguOJZUsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="142217285"
X-IronPort-AV: E=Sophos;i="6.12,297,1728918000"; 
   d="scan'208";a="142217285"
Received: from mail-japanwestazlp17010000.outbound.protection.outlook.com (HELO OS0P286CU011.outbound.protection.outlook.com) ([40.93.130.0])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 15:45:05 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDt2PwZdWs4NSPn7NYHJWlh+jUr94jj4gImMR4vimLZa+aC5BF0a+ENzO5t8qCg+T0uWFVhARO3gJNOwstli3rRRGGhBZpNWO6Y7EY3F+fU2E2XKLCFF04ztVQjWEChSt5UetYN9nUG+QvaNQETdbFnaX+Og9FEqoL9T7q3/DG3+PUCvFDn4v/qq+u41CVY6iGHYcqifU6MP7hECVnodC6y8y+oipA7+RlkZD5iC3yHb/9gLex52iOc3VCgTks8QEP7oIKvXI2n45H3futLkJk93+sr9YuewVSMrmWmv0Ay8q5ExZAOUDO7MCtTpe/ETbFgdgkkxnJvuL7Luru091g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6n/aBNf5a4+ZBeoxacw0S8Nc5Tt5WavvxZJccO4jxU=;
 b=yTSQPiPRcNEAyWkSiDpkTOjJk6fpIegeDmu6HgHJFQXelIyBZkNiXnbXBuscgnCEakI3i1kVpqCifIRSB/m4NvhwJyky2udMhWoj0+w5sM2bxOrKpVLL9Co8KxpBFddaXwRkurXdYe0borbxF27cf3Bz3E9VmFJB3DvreFTR6YynqlqdYINOWx1fWa+jGuZk8tF52p6vUgc69nScQ9hdhQSoSuq8P+lkatCTAIE+3bXdtiWcMKWuaJg82wpet96YciXzKp21Cd+n0TScBQoSpB+NSKvPn/ucELY4MDNDa7i2z4+2MEOkDeaw/1DPKNROcO5uM7aUmlG306Tu2nJCfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com (2603:1096:604:15f::6)
 by TYCPR01MB6996.jpnprd01.prod.outlook.com (2603:1096:400:bf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 06:45:02 +0000
Received: from OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672]) by OSZPR01MB8798.jpnprd01.prod.outlook.com
 ([fe80::4344:1f7b:e34d:c672%4]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 06:45:02 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: 'Dave Martin' <Dave.Martin@arm.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Zeng Heng <zengheng4@huawei.com>,
	James Morse <james.morse@arm.com>
Subject: RE: [RFC PATCH 4/6] arm_mpam: Introduce flexible CLOSID/RMID
 translation
Thread-Topic: [RFC PATCH 4/6] arm_mpam: Introduce flexible CLOSID/RMID
 translation
Thread-Index: AQHbTKwzeImtHJMxT0inbbVr2alWh7Lum/mwgBUtYYCACM4PQA==
Date: Wed, 8 Jan 2025 06:45:02 +0000
Message-ID: <OSZPR01MB87985DC21589F6ABA9C11BE68B122@OSZPR01MB8798.jpnprd01.prod.outlook.com>
References: <20241212154000.330467-1-Dave.Martin@arm.com>
 <20241212154000.330467-5-Dave.Martin@arm.com>
 <OSZPR01MB8798833576F5FD4868E804FE8B072@OSZPR01MB8798.jpnprd01.prod.outlook.com>
 <Z3a7T8L6NpFprbcy@e133380.arm.com>
In-Reply-To: <Z3a7T8L6NpFprbcy@e133380.arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9MzI3MTZlMDYtMWMyNi00OGE5LWI4NjAtODg1N2I5NWY5?=
 =?utf-8?B?MTk2O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjUtMDEtMDhUMDY6NDE6NDJaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
x-shieldmailcheckerpolicyversion: FJ-ISEC-20181130-VDI-enc
x-shieldmailcheckermailid: 923022d119f0483c98f02ebfb2fe1c71
x-securitypolicycheck: OK by SHieldMailChecker v2.6.2
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8798:EE_|TYCPR01MB6996:EE_
x-ms-office365-filtering-correlation-id: 2042f610-078f-4347-1d9b-08dd2faffa5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aytBc0RCblJRMm1QOXJWM2VsK25yQ05vekFnS0trc0E4dC9aTGd0QVo1dmZn?=
 =?utf-8?B?N1NDQThqTnBpSHlmNG1FbTBTV0hmL1hVaHduVFAzcTNjUndPa3dBRnFCN1JO?=
 =?utf-8?B?MG50dnRHdEVoSktHUTBCc25jUXFybjhWWldpL3gyMFZneGVYNHYrUXZ6NXU5?=
 =?utf-8?B?Mnp0ZjArYXFidEk2M3k1QjF2a0NKZUVZdGMyekJzTEprcE9DQ0xJNWFQVUlF?=
 =?utf-8?B?eVZMdEFKM0ZHMVN2MUx0aVUzY1FyWWNmZTNQSk14dVdMOU1BS3RFMnlFWTlT?=
 =?utf-8?B?WGJGMWErdUlyTG1pZENkM3pRbFlqUEg0L2o3bmpMZEpsMzFUWmJWdy81a0Zq?=
 =?utf-8?B?U3JwRkh3MldENjkzVXFLUEhxOXVDL25FK1RZbkFZU1B6N3psRTU0WGpzOXcr?=
 =?utf-8?B?OXVaVVdUdDNwOEVHOTdRNUp6OG9xNVNRNjBLdUpvQk9qMmhWbFY5a1lqY3Zx?=
 =?utf-8?B?U0pmMm1qZHZSVUpMU0MxUXhqWFlpSHU3S2pvUXVSdXNYUzBQc3JtWTFSaFVI?=
 =?utf-8?B?MWpXeWRkZmRzUU9ZcExJVFlxNnp5WXBOWDEyQUhFMHp0cGJMZ1pDYjYwckFG?=
 =?utf-8?B?S0FDZUdVOGxvSVg2NkloNXp1NWlXT2pqVXZYalNzclRSZTBUWlhmZGZDbVBa?=
 =?utf-8?B?bnpzaFRWa0JDUmVuU25BWUN4Y0UyUWx1UGtQRC83WHorck5kbmFBRVE1TlFQ?=
 =?utf-8?B?VzZKZ0RTeUlxd2VBWnZjSWppSU0weHBEb3o5cERESCtEQmhjOUF5QWVRUDM0?=
 =?utf-8?B?OTVOMHNpVXFyb2pYdVNaSGZMMWZIZ0tpNjlORzQxdm40RE9uSk1ZWkRlRVA4?=
 =?utf-8?B?RlVrSFV0WU1ENXVXME1Vb21CQjE3SnpJN0V5SjQ5VVN2c1hRb0VMamJOR2xh?=
 =?utf-8?B?SWEydnlMMnI1V0hEZzRrV1RUVm02dVM3UERaaktrMlFQcW5JaEZTWHlEdmhz?=
 =?utf-8?B?RmdjTVY5MjhzdlY5S0pwWTlrdS80TmJlSXRGdWV0cy9abWhseWpxNGxDTDFp?=
 =?utf-8?B?TUlEWVFwa0VDdml3ek9PNTcrdnRhWGZtNEt3RVM4cmc0b1pjQU9WeThwcGxS?=
 =?utf-8?B?c01BQkdmanV5eTZ0WVlQVVI5RUJrNzJ1dmU2TWJ4U0ZtLzZhbFNhZUhBM2l6?=
 =?utf-8?B?dTVyMnRjaFRuREkyZ21pUW52bFNOajUxcnIraWxURDFhNHF6ODkzRGE4K0lW?=
 =?utf-8?B?WEhWWWtxRjR1RmlqTmdYSzF4OXNvVEw1YkxmOWRJQ2o0WmR0a1l5aE1HcDMv?=
 =?utf-8?B?OUx5TkZQOE96VmVGTVNnaUtIYVoyOHVaMkw0OExaUHBybGFwQzNZczNYcW96?=
 =?utf-8?B?UUw1U0V2emxyUkVIL2xvQXp2MU4zb1hVZWV0SHBsQWVDK0pwTXk4OFJwa0tz?=
 =?utf-8?B?VlhINmRyVXd6YlpicU1CUnpCd0hmNGh2SHV5UlF5YXlFb004emZDZHhJR3c3?=
 =?utf-8?B?ekkvaFZzVG5sc2IwT3BJY3I5S2duczd1UUxLdWp3dEI4cEszZ3owU2NyeDdL?=
 =?utf-8?B?WkhWL1FWNEFqRzlBU1dQUUt2R1FXTWwrWVpjNUxoTzRtS3JhU1Q1NnEzSVlu?=
 =?utf-8?B?d2FRTWJDMFhnTzdmc1NWOGV3MDF1YzU3YUZmSFFhejFOYlE1VkdQdUdEeENw?=
 =?utf-8?B?ZVNabnk5clIySlluODMvRS9iMmtkUlkvQW1VZTNIbEREeFZZYWtFNTBTVjZr?=
 =?utf-8?B?RjhzWDBpV3hEN0JScG9OK1VPWnc0NW5nNHRpRVlxU0JHbytnbjM2aCtLYzJ1?=
 =?utf-8?B?WTRsbm5haDFUVjNIVlREc0lnZVZCZTJ3dG5VekVSNDFKME43U1dBWWJpRWRY?=
 =?utf-8?B?TnBMTjdFVWxMRWFtdDFTb2NyWmdiaUYyTzNyVTdhNTZ5R3AzU3JLdjhsQUhj?=
 =?utf-8?B?WGtJM1dlRVUyZkwvVjBNTkRuRStXVmhheUttc1E5YkMwOGNnRGJZVStwT1hB?=
 =?utf-8?B?K0FQNUROVDB1SjB0ejRlcWdYbEt1cVVDaFczYmlqZTNoUFh1VXlNek03Uy9J?=
 =?utf-8?B?OG5Zd3B3b0tBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8798.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEpSNC9UUFZsbzl6U1NHNHl0QVVXcTZ0clNrZ0NZa3hRN0grWXR4dStMdy9F?=
 =?utf-8?B?NE1vQWpBMnhnSmRwb2c1cysvMFAyY0ZQTms3azdsUDFzd3VxL0k3MDh0M1Ew?=
 =?utf-8?B?NXlhcVd2OHZqTzU5UE1KMXpnbTNJKzRUTFBGbXZkRkxuVG9xTUdNd0dBN2hz?=
 =?utf-8?B?UDB3c2RjK1B4MVdDdHNIbUFsMmthZytCNHhCVHRJV3kwQkpDcS9yem91M1Z5?=
 =?utf-8?B?b0l2anFoRDlVdHJ4T1F3K1h6cnFDVTUvZytNR2hGRFJPTjBhNlZhM1pOUFY4?=
 =?utf-8?B?cWQreHptL1R4SVVjT0VqaVdJRTZuL0VPMDhNL3lEN21mTjhtL1kzWmhER3FC?=
 =?utf-8?B?OXJjeEVkNkRUdUZtVmo4TUJCUnA4TTduakVFdGtIeDZNLy9SUjNYZE9DQWQx?=
 =?utf-8?B?cDZBZC9ybk56S2Q2YjArb2pTOTRjdmphMyt2VUdLME1mY2VYUTBKNnFsSmFB?=
 =?utf-8?B?MWJhRk9lNExlSTlXNjhZVnFGMERBaVFnR2lCa2JGelFOS0pjczB3bEowdC9L?=
 =?utf-8?B?UUxEL3k3aTNadnpBWURvNnV4Mk1QVFliSGtURVAxaWIyM05UQ2MxN0ZaS1lv?=
 =?utf-8?B?cGZxbEd3dlgzRi9FbXlWR2g1dXRhM1ZPZys0MkppUjZ6RGhtNmI2R3NycFVs?=
 =?utf-8?B?UGs0YXlBQ1hXSTh4ZHp3TGxONFA1SWlyOFV6RDZpK0QyelJBbkNoZ3dIL2lw?=
 =?utf-8?B?czVDQlc1SUNjeTZXbUJhUlRYQ21Cdk5pbWwxS1hwR1MxMXVva1N1TTMzTGNt?=
 =?utf-8?B?NzJ0R2R1NnBNN1cvTlpWamxadEkra3I3VSs3RVQ0dmY5d1czQ2ZJa1FZVVdk?=
 =?utf-8?B?UmM2UnEwaXpsYUhtL052SlpCNDd5QkVsSFNjeHpKT2pqVko2ZVMwN3V6UUd4?=
 =?utf-8?B?Ry9FVlNSa2VXMUx1ZEVzK0VDdkxvUDZ6L0p6bEdmbGdhRkh2bDJPZ0l1UnMr?=
 =?utf-8?B?VmxSanlhcnlNMmRaUGhzZ2QwZUhhQWNuaU1IWDF0NDExRSt0aVo4WnN5ZEM3?=
 =?utf-8?B?U3J0b1FuNmEraDlLMUh4d3A1ajJvaE5QWEIyUUs4bUVLZWxvUnlGSUJKc29y?=
 =?utf-8?B?cE1lUkI5TGZLVnZJNHFXYnBvcFh4dEFNS2N2RS9WZmZIcU5aaWRGYkNiL2hy?=
 =?utf-8?B?em1WTjFTdWpubkZUY1RvS2ZXTFY5V29uYmh1SzVWbkUzRWV5NE5rTzAyWHlB?=
 =?utf-8?B?L0lBSGp1d0kyTFVySW1vQklpck9Kb3QzdTdENWthSFljc1A2eGZpaktiOHUv?=
 =?utf-8?B?MVlabWNuc1V3N0pMNGVkTVFZOWlPSG9xdmRIZ2htSHlYVGpjK1NBYktwdE9x?=
 =?utf-8?B?dUtKS0kxenMranFIYjhieVhPc3NmMmJRNHZnZUgyLzZPR0xWaUpvQUZNZ2JP?=
 =?utf-8?B?MDZkR1Y1b25hOUhEeDJEVnA5Vnl2TUswUEl5cTVoQklsbG1zZms5aWpnQjQ5?=
 =?utf-8?B?eThMOFdDUG41cGxwajUzQkZVT0lidXFtcWZ6UXc0NlNyUDFla2Y0NnN3OEJG?=
 =?utf-8?B?Q29yaTFTUHU0czh2cWhIditmSjcvSy93UVh5TG10MkEyZUV2OGZ5dE55cEJU?=
 =?utf-8?B?cithVzQ3WncwVFowVFExbmdaUDl3QzdacXg5VmZtR0RDMWdpYmpEUTZzVzFN?=
 =?utf-8?B?K2I4OFphQzdidThzN3UzV0JyS3gxdHRNYTNUL1BncnhXc0Y0cmJybHVac1FJ?=
 =?utf-8?B?b0FQY0tTZjZyWm94OTVBclUwUitieERMeEc5dWI1d3E3Q1pXOXpUMGlJdzFp?=
 =?utf-8?B?Rk5rZStrb1NDZ1lXcDRVd0FtL093V21hMnhCZlhtSUlWV0JNeW5wWndONG5J?=
 =?utf-8?B?NkhmRXdxRUYwdjlWZkM3S2plUnUrcHhLNVQ0WkprSW5QY0VxelJDMUhkZ0kr?=
 =?utf-8?B?ejZrNllDVDdMcXBNeFI5eE53R3lnKzRpVHh4WEordUpkUUNYbWxrUmx5RHJE?=
 =?utf-8?B?ZklzUzVTeU13Ymt0MnFxQ01qVWRSV3UyS1VPb3BoenlpQS9jMnAzWVhwOGF3?=
 =?utf-8?B?MEJzOEdxOTNjbktHb0R6VGdwZ2VoLy96eWJNRFJRTUxUcXhCeXNnQzd4REdw?=
 =?utf-8?B?bUQwVEZCKzBGSlJ0L2FsaUcvQWtsdUV1a3haUDAwNlErNmFwN3o0MVAxa1Ju?=
 =?utf-8?B?SmZxcjRQNlhtcU04N2lXTm80Z0ZUYkp0aUZsTk83eGsxNUFLeGhlY1o0RTZ5?=
 =?utf-8?B?b3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +t0bC3OTK5TkGmfbAjWou9Du70Yyzzdnr8x3gxZh6AGGJt77pakclD2q7Eg41QSFBPHvntOY9CrtT9pPvmrFHekRJqyWClpUwyeWRJQN1EX/rq+Ajl5s8VM80hDzd+quyrXbyaIuJ0aPvicm/ehz8mx9JfCDKv54CcQ1/tayfUbXUBj3J24c0t+ZbQ71VQvqUU0JwnEXjoXzFhZPk18nfYK1ZNgSJW5147NnP+KNzNQWeXw3ILYi3xCO+ecxxgQDZ8dFlQKjcUFf6MJFnCjPl639MrG6ZcpPJt+e6RCZr08CnSI7mTX+sP+ENvYTacBRBHgKzpb2B7Le7YmW7j4ZkJvPBGDzSZLTteAzvyWUjX9vuBxY8lgVcIhAwp9oggDdfrjUGidQ8Pvcc3z2cWLhEgovQtdw/iOcGsX4eX39FPie4WzyYCwI0C3A9M8u/hfTyA0YpEkomlMBhNV6xAdonUPcM9hntrX/gzgsetZJaltEKQSo/tC1HIPgAc7NXona58oRrivbnyqu1ukrw4HMW4344WD2yXctrlMz+tro4cPvTUBFUFLmQB5+Ly8yzRBnmG8jRXLPidzNxgRp32/VNgMwX0Z45Bs5G7ItWhFsaOc9f4142jd2cl9U8llypOBd
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8798.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2042f610-078f-4347-1d9b-08dd2faffa5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 06:45:02.2251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HRS4usne/JLx+bW2Nbj0NYZ+2LHYaKcY/URueo5vrlIO0v/GwlzB6eK5+AQgt+h0FkYUYHUrfONBGfQi7hIyTO/6elIN953rK1awOh929CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_224511_388417_58CB1EEF 
X-CRM114-Status: GOOD (  30.82  )
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

SGVsbG8gRGF2ZSwNCg0KPiBIaSwNCj4gDQo+IE9uIEZyaSwgRGVjIDIwLCAyMDI0IGF0IDA1OjAx
OjMwQU0gKzAwMDAsIFNoYW9wZW5nIFRhbiAoRnVqaXRzdSkgd3JvdGU6DQo+ID4gSGVsbG8gRGF2
ZSwNCj4gDQo+IFsuLi5dDQo+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0v
YXJtNjQvbXBhbS9tcGFtX3Jlc2N0cmwuYw0KPiA+ID4gYi9kcml2ZXJzL3BsYXRmb3JtL2FybTY0
L21wYW0vbXBhbV9yZXNjdHJsLmMNCj4gPiA+IGluZGV4IDMwZjJjYWVjMTFkNy4uMDQ3MzI4NmVj
NjVhIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS9hcm02NC9tcGFtL21wYW1f
cmVzY3RybC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3BsYXRmb3JtL2FybTY0L21wYW0vbXBhbV9y
ZXNjdHJsLmMNCj4gDQo+IFsuLi5dDQo+IA0KPiA+ID4gQEAgLTE2MywzNSArMTc1LDcxIEBAIHN0
YXRpYyBib29sIG1wYW1fcmVzY3RybF9oaWRlX2NkcChlbnVtDQo+ID4gPiByZXNjdHJsX3Jlc19s
ZXZlbCByaWQpDQo+ID4gPiAgICovDQo+ID4gPiAgdTMyIHJlc2N0cmxfYXJjaF9nZXRfbnVtX2Ns
b3NpZChzdHJ1Y3QgcmR0X3Jlc291cmNlICppZ25vcmVkKSAgew0KPiA+ID4gLQlyZXR1cm4gbXBh
bV9wYXJ0aWRfbWF4ICsgMTsNCj4gPiA+ICsJdTMyIHJlcyA9IChtcGFtX3BhcnRpZF9tYXggKyAx
KSAvIHBhcnRpZF9wZXJfY2xvc2lkOw0KPiA+DQo+ID4gSWYgdGhlcmUgaXMgYSByZW1haW5kZXIs
IGFyZSB5b3UgZ29pbmcgdG8gaWdub3JlIHRoZSByZW1haW5kZXIgUEFSVElEcz8NCj4gPiBJdCBt
aWdodCBiZSBiZXR0ZXIgdG8gbm90aWZ5IHRoZSB1c2VyIHdpdGggYSB3YXJuaW5nIG1lc3NhZ2Uu
DQo+IA0KPiBZb3UgYXJlIHJpZ2h0OiB0aGUgcmVtYWluZGVyIGlzIGp1c3QgdGhyb3duIGF3YXks
IGJlY2F1c2UgdGhlIHJlbWFpbmluZw0KPiBQQVJUSURzIHdvdWxkIG5vdCBiZSBzdWZmaWNpZW50
IGZvciBhIHdob2xlIHJlc2N0cmwgY29udHJvbCBncm91cC4NCj4gDQo+IEl0IHdvdWxkIGJlIGEg
Z29vZCBpZGVhIHRvIHByaW50IGEgd2FybmluZyBzb21ld2hlcmUgdGhvdWdoOyBJIHdpbGwgdHJ5
IHRvIGFkZA0KPiB0aGF0Lg0KPiANCj4gWy4uLl0NCj4gDQo+ID4gSSB0aGluayBpdCBpcyBiZXR0
ZXIgdG8gY2hlY2sgd2hldGhlciBQQVJUSUQgbmFycm93aW5nIGZlYXR1cmUgaXMNCj4gPiBzdXBw
b3J0ZWQgb3Igbm90IGJlZm9yZSB1c2luZyB0aGlzIGZ1bmN0aW9uLg0KPiA+IElmIGl0IGlzIGNo
ZWNrZWQgaGVyZSwgc2luY2UgdGhpcyBmdW5jdGlvbiBpcyBjYWxsZWQgbXVsdGlwbGUgdGltZXMs
DQo+ID4gdGhlIG1lc3NhZ2Ugc2hvdWxkIGJlIHByaW50ZWQgb25seSBvbmNlIGJ5IFdBUk5fT05f
T05DRSgpLg0KPiA+DQo+ID4gQWxzbywgaWYgdGhlIHBhcnRpZF9wZXJfY2xvc2lkIGlzIGdyZWF0
ZXIgdGhhbiAobXBhbV9wYXJ0aWRfbWF4ICsgMSksDQo+ID4gcmV0dXJuaW5nICIwIiB3aWxsIG5v
dCB3b3JrIHByb3Blcmx5Lg0KPiA+IFRvIHN3aXRjaCB0byBkZWZhdWx0IGJlaGF2aW9yIChQQVJU
SUQgbmFycm93aW5nIGRpc2FibGVkKSwgc2hvdWxkIGl0DQo+ID4gcmV0dXJuIG1hcG1fcGF0aWRf
bWF4KyAxKT8NCj4gDQo+IFRoZSBpZGVhIGlzIHRoYXQgcGFydGlkX3Blcl9jbG9zaWQgaXMgc2V0
IGJ5IHNvbWUgY29uZmlndXJhdGlvbiBsb2dpYyB0aGF0IGlzIG5vdA0KPiBpbXBsZW1lbnRlZCB5
ZXQuICBUaGlzIHdpbGwgYmUgYSBiaXQgbW9yZSBjb21wbGljYXRlZCB0aGFuIGp1c3QgZXhwb3Np
bmcgdGhpcw0KPiB2YXJpYWJsZSBkaXJlY3RseSBhcyBhIGtlcm5lbCBwYXJhbWV0ZXIuDQo+IA0K
PiBDdXJyZW50bHkgSSBqdXN0IGltcGxlbWVudGVkIGEgYmFzaWMgcmFuZ2UgY2hlY2sgdG8gcHJl
dmVudCB0aGUga2VybmVsDQo+IHBhcmFtZXRlciBiZWluZyBzZXQgdG8gc3R1cGlkIHZhbHVlcywg
YnV0IEkgZGlkbid0IHRyeSB0byBtYWtlIGl0IGNvbXBsZXRlbHkNCj4gcm9idXN0Lg0KPiANCj4g
DQo+IEluIGFueSBjYXNlLCBzaW5jZSBwYXJ0aWRfcGVyX2Nsb3NpZCBkZWZhdWx0cyB0byAxLCB0
aGUgYmVoYXZpb3Igb2YgdGhpcyBmdW5jdGlvbg0KPiBzaG91bGQganVzdCBtYXRjaCB0aGUgbm9u
LVBBUlRJRC1OYXJyb3dpbmcgYmVoYXZpb3VyIHVubGVzcyB0aGUgdXNlcg0KPiByZXF1ZXN0ZWQg
YSBkaWZmZXJlbnQgdmFsdWUuDQo+IA0KPiBCZWFyaW5nIHRoYXQgaW4gbWluZCwgSSB0aGluayB0
aGF0IGEgImJhZCIgdmFsdWUgb2YgcGFydGlkX3Blcl9jbG9zaWQgc2hvdWxkIG5vdA0KPiBiZSBz
ZWVuIGhlcmUsIHdoZW4gdGhlIHJlc3Qgb2YgdGhlIGltcGxlbWVudGF0aW9uIGlzIGNvbXBsZXRl
Lg0KPiANCj4gRG9lcyB0aGlzIHNvdW5kIHNlbnNpYmxlPw0KPiANCj4gSXQgY291bGQgbWFrZSBz
ZW5zZSB0byBoYXZlIGEgV0FSTl9PTl9PTkNFKCkgaGVyZSBhbnl3YXksIHRob3VnaCwgc2luY2UN
Cj4gdGhpcyBjb2RlIGlzIG5vdCBvbiBhIGZhc3QgcGF0aC4NCg0KSXQgc291bmRzIHNlbnNpYmxl
Lg0KDQo+ID4gPiAtdTMyIHJlc2N0cmxfYXJjaF9zeXN0ZW1fbnVtX3JtaWRfaWR4KHZvaWQpDQo+
ID4gPiArc3RhdGljIHZvaWQgbXBhbV9yZXNjdHJsX3BhcnRpZF9yYW5nZSh1MzIgY2xvc2lkLCBl
bnVtDQo+ID4gPiArcmVzY3RybF9jb25mX3R5cGUNCj4gPiA+IHR5cGUsDQo+ID4gPiArCQkJCSAg
ICAgIGNvbnN0IHN0cnVjdCByZHRfcmVzb3VyY2UgKnIsDQo+ID4gPiArCQkJCSAgICAgIHUxNiAq
bWluX3BhcnRpZCwgdTE2ICptYXhfcGFydGlkKQ0KPiA+ID4gIHsNCj4gPiA+IC0JdTggY2xvc2lk
X3NoaWZ0ID0gZmxzKG1wYW1fcG1nX21heCk7DQo+ID4gPiAtCXUzMiBudW1fcGFydGlkID0gcmVz
Y3RybF9hcmNoX2dldF9udW1fY2xvc2lkKE5VTEwpOw0KPiA+ID4gKwl1MTYgYmFzZV9wYXJ0aWQg
PSBjbG9zaWQ7DQo+ID4gPiArCXUxNiBzcGFuID0gMTsNCj4gPiA+ICsNCj4gPiA+ICsJaWYgKGNk
cF9lbmFibGVkKSB7DQo+ID4gPiArCQliYXNlX3BhcnRpZCAqPSAyOw0KPiA+ID4gKwkJaWYgKG1w
YW1fcmVzY3RybF9oaWRlX2NkcChyLT5yaWQpIHx8DQo+ID4gPiArCQkgICAgdHlwZSA9PSBDRFBf
Tk9ORSkNCj4gPiA+ICsJCQlzcGFuICo9IDI7DQo+ID4gPiArCX0NCj4gPiA+DQo+ID4gPiAtCXJl
dHVybiBudW1fcGFydGlkIDw8IGNsb3NpZF9zaGlmdDsNCj4gPiA+ICsJKm1pbl9wYXJ0aWQgPSBi
YXNlX3BhcnRpZCAqIHBhcnRpZF9wZXJfY2xvc2lkOw0KPiA+ID4gKwlpZiAobWF4X3BhcnRpZCkN
Cj4gPiA+ICsJCSptYXhfcGFydGlkID0gKm1pbl9wYXJ0aWQgKyAoc3BhbiAqIHBhcnRpZF9wZXJf
Y2xvc2lkIC0gMSk7DQo+ID4gPiAgfQ0KPiA+DQo+ID4gSSB0aGluayB0aGUgbWluX3BhcnRpZC9t
YXhfcGFydGlkIGlzIGRpZmZlcmVudCBkZXBlbmRpbmcgb24gdGhlIHR5cGUNCj4gPiAoQ0RQX0RB
VEEgb3IgQ0RQX0NPREUpLg0KPiANCj4gWW91J3JlIHJpZ2h0ISAgTG9va2luZyBhdCBteSBmaXh1
cCBwYXRjaGVzIGZyb20gdGhlIGVuZCBvZiBEZWNlbWJlciwgaXQgbG9va3MNCj4gbGlrZSBJIGFs
cmVhZHkgZW5jb3VudGVyZWQgdGhpcyBwcm9ibGVtIGFuZCB3cm90ZSBhIHdvcmthcm91bmQsIGJ1
dCBJIGRpZG4ndA0KPiBwb3N0IGl0IGF0IHRoZSB0aW1lLg0KPiANCj4gWy4uLl0NCj4gDQo+ID4g
PiBAQCAtMTE5MCwyMiArMTIxOSwxMyBAQCBpbnQgcmVzY3RybF9hcmNoX3VwZGF0ZV9vbmUoc3Ry
dWN0DQo+ID4gPiByZHRfcmVzb3VyY2UgKnIsIHN0cnVjdCByZHRfY3RybF9kb21haW4gKmQsDQo+
ID4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiA+ICAJfQ0KPiA+ID4NCj4gPiA+IC0JLyoNCj4g
PiA+IC0JICogV2hlbiBDRFAgaXMgZW5hYmxlZCwgYnV0IHRoZSByZXNvdXJjZSBkb2Vzbid0IHN1
cHBvcnQgaXQsIHdlIG5lZWQNCj4gPiA+IHRvDQo+ID4gPiAtCSAqIGFwcGx5IHRoZSBzYW1lIGNv
bmZpZ3VyYXRpb24gdG8gdGhlIG90aGVyIHBhcnRpZC4NCj4gPiA+IC0JICovDQo+ID4gPiAtCWlm
IChtcGFtX3Jlc2N0cmxfaGlkZV9jZHAoci0+cmlkKSkgew0KPiA+ID4gLQkJcGFydGlkID0gcmVz
Y3RybF9nZXRfY29uZmlnX2luZGV4KGNsb3NpZCwgQ0RQX0NPREUpOw0KPiA+ID4gKwlmb3IgKHBh
cnRpZCA9IG1pbl9wYXJ0aWQ7IHBhcnRpZCA8PSBtYXhfcGFydGlkOyBwYXJ0aWQrKykgew0KPiA+
ID4gIAkJZXJyID0gbXBhbV9hcHBseV9jb25maWcoZG9tLT5jb21wLCBwYXJ0aWQsICZjZmcpOw0K
PiA+ID4gIAkJaWYgKGVycikNCj4gPiA+IC0JCQlyZXR1cm4gZXJyOw0KPiA+ID4gLQ0KPiA+ID4g
LQkJcGFydGlkID0gcmVzY3RybF9nZXRfY29uZmlnX2luZGV4KGNsb3NpZCwgQ0RQX0RBVEEpOw0K
PiA+ID4gLQkJcmV0dXJuIG1wYW1fYXBwbHlfY29uZmlnKGRvbS0+Y29tcCwgcGFydGlkLCAmY2Zn
KTsNCj4gPiA+IC0NCj4gPiA+IC0JfSBlbHNlIHsNCj4gPiA+IC0JCXJldHVybiBtcGFtX2FwcGx5
X2NvbmZpZyhkb20tPmNvbXAsIHBhcnRpZCwgJmNmZyk7DQo+ID4gPiArCQkJYnJlYWs7DQo+ID4g
PiAgCX0NCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIGVycjsNCj4gPiA+ICB9DQo+ID4NCj4gPiBG
b3IgYSBtaXh0dXJlIG9mIE1TQ3Mgc3lzdGVtLCBNU0NzIHRoYXQgZG8gbm90IHN1cHBvcnQgUEFS
VElEDQo+ID4gbmFycm93aW5nIGFuZCBzdXBwb3J0IE1heGltdW0gUGFydGl0aW9uIGZlYXR1cmUg
bWF5IG5vdCB3b3JrIHByb3Blcmx5Lg0KPiANCj4gVGhpcyBpcyB0cnVlLg0KPiANCj4gRm9yIHRo
aXMgc2VyaWVzLCB3ZSBqdXN0IHRydXN0IHRoYXQgdGhlIHVzZXIgdW5kZXJzdGFuZHMgd2hhdCB0
aGV5IGFyZSBkb2luZywgYnV0DQo+IHRoZSBjb21wbGV0ZSBpbXBsZW1lbnRhdGlvbiB3aWxsIG5l
ZWQgYWRkaXRpb25hbCBjaGVja3MuDQo+IA0KPiBNeSBwbGFuIHdhcyB0byBkbyB0aGUgYXBwcm9w
cmlhdGUgY2hlY2tzIHdoZW4gdGhlIGRyaXZlciBzdGFydHMgdXAsIHRvIGRlY2lkZQ0KPiB3aGV0
aGVyIGl0IGlzIHNhZmUgdG8gc2V0IHBhcnRpZF9wZXJfY2xvc2lkIHRvIGEgdmFsdWUgZGlmZmVy
ZW50IGZyb20gMS4NCj4gDQo+IE9uY2Ugd2UgZ2V0IHRvIHRoaXMgY29kZSwgdGhlIGRlY2lzaW9u
IGhhcyBhbHJlYWR5IGJlZW4gdGFrZW4gYW5kIHNvIHRoZSB2YWx1ZQ0KPiBvZiBwYXJ0aWRfcGVy
X2Nsb3NpZCAoYW5kIHRoZSByZXN1bHRpbmcgbWFwcGluZyBvZiByZXNjdHJsIGdyb3VwcyBvbnRv
IFBBUlRJRHMpDQo+IGNhbiBiZSB0cnVzdGVkIGFzIGJlaW5nIGFwcHJvcHJpYXRlIGZvciB0aGUg
aGFyZHdhcmUuDQo+IA0KPiBDYW4geW91IHNlZSBhbnkgcHJvYmxlbXMgd2l0aCB0aGlzIGFwcHJv
YWNoPw0KDQpUaGlzIGFwcHJvYWNoIHNvdW5kcyBzZW5zaWJsZS4NCg0KPiANCj4gWy4uLl0NCj4g
DQo+ID4gSSBrbm93IHRoaXMgaXMgbm90IGEgY29tcGxldGUgaW1wbGVtZW50YXRpb24uDQo+ID4g
TWFwcGluZyByZWxhdGlvbnNoaXAgYmV0d2VlbiBpbnRQQVJUSURzIGFuZCByZXFQQVJUSURzIG5l
ZWQgdG8gYmUNCj4gPiB3cml0dGVuIHRvIHJlZ2lzdGVyIE1QQU1DRkdfSU5UUEFSVElEL01QQU1D
RkdfUEFSVF9TRUwuDQo+ID4NCj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gU2hhb3BlbmcgVEFODQo+
IA0KPiBBZ3JlZWQuICBJIGhhdmUgc29tZSBwcm90b3R5cGUgY29kZSBmb3IgdGhhdCwgYnV0IEkg
bmVlZCB0byBzcGxpdCB1cCB0aGUgcGF0Y2hlcw0KPiBhbmQgY2xlYW4gaXQgdXAgYmVmb3JlIHBv
c3RpbmcgaXQuDQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCkkgd2lsbCByZXZpZXcg
dGhlIHJlc3Qgb2YgdGhlIHByb3RvdHlwZSBjb2RlIHdoZW4gaXQgaXMgcG9zdGVkLg0KIA0KQmVz
dCByZWdhcmRzLA0KU2hhb3BlbmcgVEFODQo=

