Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC928CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 19:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqZWQ+mvmiwxuya8uW+eAqdurY0u56027FD+jZUUD/8=; b=2EZV7ToN1fNYYG5Wd+omhh5PQw
	FQTUoNJWaDg4PFsYeM60c3T1ZTqbUWga3rDlF6nhtCzsTVcETqlCabBWqT9rZXwWb5oO9vjVA/uhq
	lkakdOnT7X9fHQ0FczKUL2dv/zFKW5Mg0NpOSva4jax2WETN3yprQwO0/NA3FbRqk8fJ7RJ6O3AWY
	1ThKWeh/LDEBm7w+MfmHcoi/U3lZIC3USPBIvitT6InBBe2XWsv8JKZ9rZeUOQs2UGYtudHQvje11
	Ei5kS6k5H9ksonRWgh2psbP9sJGuoguQtgJNS2ZgjGLjjB8XkpbL77ueQmy71y51cz2o3rPolPxWz
	spLYbwJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFZ5-00000003cuX-2Chq;
	Wed, 13 May 2026 19:48:19 +0000
Received: from mail-centralusazon11010049.outbound.protection.outlook.com ([52.101.61.49] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNFZ1-00000003csn-45m3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 19:48:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlcwSe121jaqlMtF6IPj7Mvl6wteGwAvl7GIVfyUv5hA6HMzGYoJvumtcNhiLnGgt6N6tG2VOXngEUHlpxJyBqjKwLneTHkDOPiwfdI0I/1ARkITzfLu8tnH3itAI1P7VIQPC8zJsTgL9ZyWrofDKdYlQwKuxhGpEQkcU34FvI5HJRLS9CH4x6s3EYbDSZG2WN6Ty/FDFQEr9rm5EGz8oumR6YBGQi62kZcCVjFVWPuLtJsb+LCt5/oDV+EbHVUZplnzd/Kjkev0i47xRpC7Z/NlbEt75tr9eM0uJ59uD5QlJeiSRYGZ7AYqJ8cZ54OawGibTKm++0ZIM1voXCymzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqZWQ+mvmiwxuya8uW+eAqdurY0u56027FD+jZUUD/8=;
 b=FeRRitq6gIlp9W1jy+pvgR92jAvl6j8mOo1EPzOc2AaJu+eCp6a8numcpVtOp3sHept5xtae/Rf4UZsx3ZtkkYcY7ymkHV99tS8XzB7YTaDuYIWDx6Gch6BWr0J8U9kj1lhKhVIcJAqH1KUaVofv0w3JtK1d54DmGvPb+2axsjUlxL4H1PtedS10/yhf0Az6KmcRx+b+2AtBlQxhgoR3qOhFrCmHh4psCWilmLt0BLLLj+EsSbeW9As4SMcCrcA6UdZA0rrf7BnUynuG+UT4C5jH3sv7GvgeQSnkkXMIkbbbcrbdZEL8j3v0nuSpLC7rQwA7brDrR7pJf4T2N7BqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqZWQ+mvmiwxuya8uW+eAqdurY0u56027FD+jZUUD/8=;
 b=trLn8/x8KSJqCchm5FOLDzoNfz8Z0erXiFf/oDhfRzcdXOwPhkdMm20ks+ncnyqYQDx/bVjp0nsPSjMcBJeFSXlSnH8JQQ3TUOZkT2RLhCsPBedhL3QZlF+J6U5BdBJ2d3BFo3EDCkpGOdJZkBcL1vSdHLe0ut4KN4oipz76UKLJ89qnoXdO3EKX4zCjvepABZlW+qtWaLxZJjwSnDczYnW380QKyWeFsxro9a+dTF2ja9GE6kozGBXQ3nDtw0TKzRbZNP0Ir9Uf4ROraJkf7FLHDrkoLrkZB7cT5s9Nb7Ef+DCtuBt2wCT6tNZua7M1hDrFauzu6t33A36ssn8zzQ==
Received: from PH8PR12MB7183.namprd12.prod.outlook.com (2603:10b6:510:228::20)
 by DS0PR12MB7828.namprd12.prod.outlook.com (2603:10b6:8:14b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 19:48:06 +0000
Received: from PH8PR12MB7183.namprd12.prod.outlook.com
 ([fe80::d54c:d13c:6346:4009]) by PH8PR12MB7183.namprd12.prod.outlook.com
 ([fe80::d54c:d13c:6346:4009%4]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 19:48:05 +0000
From: Jamie Nguyen <jamien@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Thread-Topic: [PATCH] firmware: arm_ffa: honor descriptor size in
 PARTITION_INFO_GET_REGS
Thread-Index: AQHc4oidjgTu+I+rK0a55/7Ex9LQK7YMM0IAgAApeIA=
Date: Wed, 13 May 2026 19:48:05 +0000
Message-ID: <5325A2E7-4987-400A-A1B2-A5C3122D88D1@nvidia.com>
References: <20260513032800.68807-1-jamien@nvidia.com>
 <20260513-tremendous-conscious-sunfish-06eecb@sudeepholla>
In-Reply-To: <20260513-tremendous-conscious-sunfish-06eecb@sudeepholla>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3864.500.181)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7183:EE_|DS0PR12MB7828:EE_
x-ms-office365-filtering-correlation-id: 34535410-55db-4528-c727-08deb1288cee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|4143699003|56012099003|22082099003|18002099003|3023799003|11063799003;
x-microsoft-antispam-message-info: 6VrXuRY51aC3Wl7WLqXIjSpSI38u9yu9ucGeYZ7XseNNjm0s17QhNrMELCDK/u9bMHtfd1mpX+0hjlhUOIqhdlgdFdJ4cCbwcBLDboVzKgnMgju2tjtYVVJDA1d8KEVset87RY3FOqOaiHR+oTERAVBIqS/V4E0/IgHPHx0Rt5u1yYsGaPYXbfnlr2ikAFGcGkslpfFIT0zHPyo5c5jMYzCBJ5D9qmrdHrYq1e6bBUWSuHyIE6w3wkhyGVVztzE/NfHjlL8QzJxhy39K5DaS1xb4JqcVWzuclgOtyNfQWyQbyCh/uDwCh6fbZBVQEuHBMha6IzTkhdy4mwkwzj3+ObhdBOrfAKbnq/76haP5nMY+gvF51Yvm1v0Rb79n1QzCdlwJzcCjp0OvIzbXHsTS1VXnlF6QuF94aib463RHHkrbkUgDeuwrHhya0S96jw8NwSADz859ANyuqA/AcMxnz5BOUpBQgQbEtc37aoj6I9cVXu0sMN9l9HWdtaD2LU4s8drl9lQ6RQf59wMOIArE4XD07P+Pq++NZpr+6JaiIfe+j8X7O92AyjdiCGFEnA/63KoGt2gtzGxL9tmEu4bvI+5wzieThWLK1hFfg2ngmKwd8qXKlqvQLZ/6eUGzreJlB28t/BREo78lvKbfwimPZhf+6nh25DJsa8dcXUBeLvPkmlu6TaY5IjYKbKHCHb3ytDxt8pngbge0HlFkt3pbKeLu0Qm0GR3eki6yK0Fk/3aDEUOeRuXuDn6TDsgL6vku
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7183.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(4143699003)(56012099003)(22082099003)(18002099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0VuZHVuSm1jWmRQOHl2cW9kdk9sYkZabEFyL1A4VG8vcjJrMnpTYlJ2dElE?=
 =?utf-8?B?a1RKVlU5cTYyazU0WTZHQm93OUszRExXeWRkUXpnSnRRVlhITVd4d0ZkbGtm?=
 =?utf-8?B?VTU0UlMyVnVFc0laQWY5VGdVaEtINGpsdzlUc1ptaWF4dDRuT2M5OUp2WkZ1?=
 =?utf-8?B?SGg4aHFjQ2tPMDFoNFBIQWZxQk1YQi9aYjNyT0RoSzEvc25oYjU0SGVwcjRo?=
 =?utf-8?B?dzF3ME93NXVWclZWc0lESDVOYWVaemR0cXFJa3lsUmIrMWxPdzhQWFRYWXpW?=
 =?utf-8?B?eG9vT2ZJVkdJTDZXcngxREJpYThLa1V1VGliVzRvQnNWY1hyZ3J4V3BHOHlT?=
 =?utf-8?B?dHZVejZGR1dqb3BwbEIxdzl0TGpwVHVIVTllekRFNzRLMG1Nb21xOS9FS2Rt?=
 =?utf-8?B?LzcvZS9lb2RvR25VUjd5UTVwekdqZUJRczZIMHRocGYvdmVKOHIvcUVBdDZK?=
 =?utf-8?B?Z2lMaW50SFpzR0N1T1F0aG1YNDROcFVIWWFYN2JMZEw2R3pwSGJqd1dXQ0U2?=
 =?utf-8?B?TWFrbWVhZWJENGhxdll4ZnFMSUM1NXRmQmk5SXNJaFZ5QWlHZUZCRlZOdENp?=
 =?utf-8?B?Y21MS20raS96ejJUVWlvYm9kVmhjdTdkaTlGeUxHaWtWeDhGUzlEL2h0WFUx?=
 =?utf-8?B?dzZQTGdSU1R3SFlTbEF0ZG53ZUJGcUxpeVY5WGZnNGhMQkl1NVp5OTFjeHV0?=
 =?utf-8?B?UjQxT29PL0luR0d3UGltVkg5MlRXeDIvc3diblY1anpxUXA2SkpwdUg1L3pZ?=
 =?utf-8?B?aWtCVVdYTEorWVVUbnlQbXl1NG9PaitpdkhwYVR0M2Q3aHpVQmNpWDdKYjEw?=
 =?utf-8?B?VnZ0QTVsVTB3VHJ6N2hWRitPMGdQbHFhZGtNZUpEaXZ3c2JDeUVtN1E5WmIw?=
 =?utf-8?B?aGVIc1RGbnB0RlZyMHZYdyt6UmV6RWM0SzhvTWlnMVlQbHlSM0N5Vlhva01V?=
 =?utf-8?B?MXcxUE1ja2pGcmllMndsL3Z6RzZKaTJ5Z0gyM1o1U2Q1TDZzNFFhMzNzTnZI?=
 =?utf-8?B?cEd6ck5EZFJ3ekdKR0xlWU1YeXNRVERJOE5BSy9XQkJvZlZEaEROcVJHdnRu?=
 =?utf-8?B?UXMwSzY3MmI1Wk84STVPaGRDL0xhY2twS0MyOVB6dnhtbEo2bmVxTm5zTFNW?=
 =?utf-8?B?dEJySUNDMGUxVUU5bEh0SytQNXcxYUI5ZytXZncwTmR0dzJFcHErbkhNNmtX?=
 =?utf-8?B?a3QrVklFa21BVVJYSklMcTQ4aEQzMjRkZDVnNXFJUi9jRElqY0lIbmo3NER4?=
 =?utf-8?B?eUVpY1VBMFNWVnExVTBidEoxL0NGYXFCUDJjTlB6cC8zVHhMYzl5Ty9hVHJM?=
 =?utf-8?B?T1J1WlJtdnQ4eG52MlRJQVRQajZHS21oc1I3amNCV3hlSDgzakF4anMyK1Ux?=
 =?utf-8?B?ZUdVTE9ENFBuRGVxd2c0TzhiT3BvM1RxM1BIc0wxWlJmMjRsWmhYaUdUM3Zv?=
 =?utf-8?B?ZUtSVzhzRTBRTUVtY3lFWmdjYXVpS1RPVUhMUE1iNmhBR0xBdXcvTUtNMEZG?=
 =?utf-8?B?NUx1SlAwTWJLaW5qVWJ1bXlMalQ5WG5weWlQNVB5cm53Zkt6MWdiTzZqSjdh?=
 =?utf-8?B?aVZUczFqZlQ2NW94MGtvbjlpd1VvK0l0bkxTU1l0bXJ3OGFDU2xGQTZOQkJh?=
 =?utf-8?B?WkFxRVY0dlNXN2lkSzdrWVZZTWlNQnV2QW96Q3VZUW5ScXhiVlRXMUZvMGw1?=
 =?utf-8?B?SFFFMUtJeUpzRmFLeFU3SWZleHR2YkdGRWRHeG1CMWlDWFQ0M0Y5QmtHSXdp?=
 =?utf-8?B?Ty9aMW9JRXpYM2MrVnZEb3FRUVA0eVVBcGVISGZGL2JndG5HcDE0bEM3cGNP?=
 =?utf-8?B?T1ArSFEyeUEveE5yb2U5VnorK1YzbjFIWUlDdjIvTmhlejh1bnB5Q3NTSFJM?=
 =?utf-8?B?cEdMS3Q1UFdHWTJUczdiZWIzMi9TZW1KejJYcHRZeDF5Nlh2NWJqZXJGL2VL?=
 =?utf-8?B?RXkva3AyVDdJRURUTDFHRHJrYk8vS2M3TWVmRHZyWjU0N2gzTEtjTjRGYjJh?=
 =?utf-8?B?YW40aWs1NTRRR2YxNFppdFBGNDNhbVpvT01GcFlPZUFpa3ozQ0puWXFUWXpZ?=
 =?utf-8?B?MzVKemtIaGRrNWtxL1p4c0psYmM0TVM0MnlmSVpicUlIdndjTHRUZSs1SnlK?=
 =?utf-8?B?Z1lDTCtXK0pXNXdDaEhlSkRuWFFQVm5LUE5wR3U5ek4xR1dGSXA5azhyYTRL?=
 =?utf-8?B?WTRYNUk4cEZEQUtnU3Z1SElVMFVwTTRSV3ptT0dtWDI3b21nQVZEeWJFbGk4?=
 =?utf-8?B?V3BFc3F6aW8rN2ZoWm1JL21URldNU2Y1eEozaHBEYlJENndrMWVjWGpTN0pK?=
 =?utf-8?B?clZUOUdVK3ZDb2xQek5iZ0hNdkVOaGtySXBQbjgyVFROb0FORTNidz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4D802F0C1FA494ABEEF82896642C696@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7183.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34535410-55db-4528-c727-08deb1288cee
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 19:48:05.3843
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGD29I5EGm76Z4O29mO+35frHVwRR4kSwCt1kpH5TSRZhUJAjrdVzETa71NqgibVv24ZC3v22uUEuCCYVqBOVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7828
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_124816_018689_0CDB7E1D 
X-CRM114-Status: GOOD (  17.55  )
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

DQoNCj4gT24gTWF5IDEzLCAyMDI2LCBhdCAxMDoxNeKAr0FNLCBTdWRlZXAgSG9sbGEgPHN1ZGVl
cC5ob2xsYUBrZXJuZWwub3JnPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgTWF5IDEyLCAyMDI2IGF0
IDA4OjI4OjAwUE0gLTA3MDAsIEphbWllIE5ndXllbiB3cm90ZToNCj4+IF9fZmZhX3BhcnRpdGlv
bl9pbmZvX2dldF9yZWdzKCkgd2Fsa3MgdGhlIHJlc3BvbnNlIHdpdGggYSBoYXJkY29kZWQNCj4+
IDI0LWJ5dGUgc3RyaWRlIChyZWdzICs9IDMpIGV2ZW4gdGhvdWdoIHRoZSBTUE1DIHRlbGxzIHVz
IHRoZSBhY3R1YWwNCj4+IHBlci1kZXNjcmlwdG9yIHNpemUgdmlhIFBBUlRJVElPTl9JTkZPX1Na
IGluIHgyWzYzOjQ4XS4gVGhlIHNpemUgaXMNCj4+IHJlYWQgaW50byBidWZfc3ogYW5kIHRoZW4g
dGhyb3duIGF3YXkuDQo+PiANCj4+IFRoYXQgd29ya3Mgd2hpbGUgZXZlcnkgU1BNQyByZXR1cm5z
IHRoZSBGRi1BIHYxLjEgbGF5b3V0LCBidXQgaXQgZmFsbHMNCj4+IGFwYXJ0IGFnYWluc3QgYSB2
MS4zIFNQTUMgcmV0dXJuaW5nIHRoZSA0OC1ieXRlIGRlc2NyaXB0b3IuIFRoZSBsb29wDQo+PiBz
dHJpZGVzIG92ZXIgaGFsZiBhIGRlc2NyaXB0b3IgYXQgYSB0aW1lIGFuZCBlbmRzIHVwIHBhcnNp
bmcgZXZlcnkNCj4+IG90aGVyIGVudHJ5IGZyb20gYSBzbGljZSBvZiB0d28gYWRqYWNlbnQgb25l
cy4NCj4+IA0KPj4gVGhlIEZGLUEgc3BlYyAodjEuMiwgc2VjdGlvbiAxOC41KSBzYXlzIHRoYXQg
dGhlIHByb2R1Y2VyIHNob3VsZA0KPj4gcmVwb3J0IHRoZSBkZXNjcmlwdG9yIHNpemUsIGFuZCB0
aGUgY29uc3VtZXIgaXMgc3VwcG9zZWQgdG8gc3RyaWRlIGJ5DQo+PiB0aGF0IHNpemUgYW5kIGln
bm9yZSBhbnkgdHJhaWxpbmcgZmllbGRzIGl0IGRvZXNuJ3QgdW5kZXJzdGFuZC4gVGhlDQo+PiBu
b24tUkVHUyBwYXRoIChfX2ZmYV9wYXJ0aXRpb25faW5mb19nZXQpIGRvZXMgdGhpcyBhbHJlYWR5
LCBhbmQgdGhlDQo+PiBSRUdTIHBhdGggc2hvdWxkIG1hdGNoLg0KPj4gDQo+PiBVc2UgYnVmX3N6
IGZvciB0aGUgc3RyaWRlLCBhbmQgYmFpbCBvdXQgd2l0aCAtRVBST1RPIGlmIHRoZSBTUE1DDQo+
PiByZXBvcnRzIHNvbWV0aGluZyB3ZSBjYW4ndCBzYWZlbHkgd2Fsay4NCj4+IA0KPiANCj4gQ2Fu
IHlvdSBjaGVjayBpZiB0aGUgaXNzdWUgaXMgYWRkcmVzc2VkIGluIC1uZXh0IGJ5Og0KPiBDb21t
aXQgMzk3NGVhMTkzODQwICgiZmlybXdhcmU6IGFybV9mZmE6IEJvdW5kIFBBUlRJVElPTl9JTkZP
X0dFVF9SRUdTIGNvcGllcyIpDQoNClRoYW5rcyBmb3IgdGhlIHBvaW50ZXIuICBJIHRlc3RlZCAz
OTc0ZWExOTM4NDAgb24gdGhlIHNhbWUgaGFyZHdhcmUNCnRoYXQgcmVwcm9kdWNlcyB0aGUgYnVn
LCBidXQgdGhlIGRlc2NyaXB0b3Itc3RyaWRlIGlzc3VlIGlzIHN0aWxsDQpwcmVzZW50Lg0KDQpU
aGUgcmVsZXZhbnQgbG9vcCBhdCB0aGUgZW5kIG9mIF9fZmZhX3BhcnRpdGlvbl9pbmZvX2dldF9y
ZWdzKCkNCnN0aWxsIGhhczoNCg0KCWJ1Zl9zeiA9IFBBUlRJVElPTl9JTkZPX1NaKHBhcnRpdGlv
bl9pbmZvLmEyKTsNCglpZiAoYnVmX3N6ID4gc2l6ZW9mKCpidWZmZXIpKQ0KCQlidWZfc3ogPSBz
aXplb2YoKmJ1ZmZlcik7DQoJLi4uDQoJZm9yIChpZHggPSAwOyBpZHggPCBucl9kZXNjOyBpZHgr
KywgYnVmKyspIHsNCgkJLi4uDQoJCXJlZ3MgKz0gMzsgIC8qIGJ1ZyBpcyBoZXJlICovDQoJfQ0K
DQpXaXRoIDQ4LWJ5dGUgZGVzY3JpcHRvcnMgdGhlIFNQTUMgcmV0dXJucyBucl9kZXNjID0gMiBw
ZXIgY2FsbCwNCndoaWNoIHBhc3NlcyB0aGUgbmV3IE1BWF9ERVNDID0gNSBib3VuZCwgYW5kIHRo
ZSBsb29wIHRoZW4gcnVucw0KdGhlIDI0LWJ5dGUgc3RyaWRlIG92ZXIgNDgtYnl0ZSBlbnRyaWVz
Lg0KDQpIZXJlIGFyZSB0aGUgdGVzdCByZXN1bHRzIG9uIHRoZSBzYW1lIFNCSU9TIC8gc2FtZSBo
YXJkd2FyZToNCg0KICB1bnBhdGNoZWQ6ICAgICAgICAgICAgICAgNSBwYXJ0aXRpb25zIGVudW1l
cmF0ZWQsIHR3byB3aXRoDQogICAgICAgICAgICAgICAgICAgICAgICAgICBnYXJibGVkIFVVSURz
IGFuZCBwYXJ0aXRpb25faWRzDQogIDM5NzRlYTE5Mzg0MCBhbG9uZTogICAgICBzYW1lIG1pc3Bh
cnNlZCBlbnVtZXJhdGlvbg0KICAzOTc0ZWExOTM4NDAgKyBteSBwYXRjaDogNiBwYXJ0aXRpb25z
LCBhbGwgZW50cmllcyBjb3JyZWN0DQoNClNvIHRoZSB0d28gZml4ZXMgbG9vayBjb21wbGVtZW50
YXJ5IHJhdGhlciB0aGFuIG92ZXJsYXBwaW5nLg0KDQo+IC0tIA0KPiBSZWdhcmRzLA0KPiBTdWRl
ZXANCg0KDQo=

