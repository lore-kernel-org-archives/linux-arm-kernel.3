Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9F3CFA466
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 02:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVrXOyXGjhDMe71uLj7j8/80tj9L7FiRd6j/xCYHFsM=; b=jQitv2ykyWnQoH2apmUi5BTpOC
	rAZO+zbtVdUkePg8hh90e6EniMAUYttU78VNPyXSh+CY5I4xwVe4oPkm5mauXYPtZUesp1/eoYHP7
	gKnKvcCu5qDCb0OoXe3QMuBlS9EgOCcWC4q0ialUQGtx64BjBf5ss0fd3Q37kQ8xTuUjnNvBlIc5D
	jCFYZ2dc8TdWJT8/rw2afYqfX/hTd3nj1TfO4hWgJO4z7puBGQ4V+dj6kcLMJDd1voCZXFg/Lf89d
	WqJYKfXaJhA1wdXP0bazbEW/mvtCJRhTB2QXRLWsdDTS2bcVu7JOOwj8ZFGXG/UTbS4iQxxAJwsFt
	iy8dJ3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGw8-00000007hQ8-3U8Z;
	Fri, 21 Nov 2025 02:31:48 +0000
Received: from mail-japanwestazon11010048.outbound.protection.outlook.com ([52.101.228.48] helo=OS0P286CU011.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMGw5-00000007hPP-1uI2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 02:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQn19TzPPJ2Y2rzVJrNF+2ShpSBX4AWafiRaBhiAz2gOKVTDr3JPk9+w9/lMDwp4yxk+4ya7csRd3wAI3rWS4b/hTPACC8Yu2bA70/ZDamvt8asKS8hkOoAloCdwE70NPEgEqsf9dTIxJAWSNb43HDU7zZK6WgGNigdAw3XKz1tKqbHsZJzYAL0TPDIbvFdnxC/VMT1XufNPL9by5osYLVlI+J9OXpHojpo4jTXhI25KJPbjInJBYWOXw3XwXSROtgvrzFYfgbjlhBpjqtdRubvY3NFmhUhcyRYP3NSuBQCmKkSEjM+mUDxhXEefCtejl1nByHlulvGQjnB8+O3aZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVrXOyXGjhDMe71uLj7j8/80tj9L7FiRd6j/xCYHFsM=;
 b=JH+TosfeKa6U8/0AlK1VyN8IOzbMrmVy2pG3IXbZ5uKzF8l120quAh8MnC9ejuadXvRORNWoved9JpsaVg1x9UEfoejuEaCjrgN33AkjdGaflBYx2W/K1YHBVRfDDbsipmiXTLvCgW84uFLEQLG/ZvpxD5/SctOAxpgBfVYrlsfTXSQpxBzdcBbSTo5KiAAxyWUzyKv7Sb+v3IeZ7BPE+mDsrR9yelyB0mQIcmZVpnD94YZdzLS9czvskG7xb1drqGu+4P1Cl/pkQSrZ07SZvF78XWtcb7J3DL7jG/wjnXvsOoWxH+VWXQajh7SzFBLrhcKAYxMpzemhzD2ghD5/kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVrXOyXGjhDMe71uLj7j8/80tj9L7FiRd6j/xCYHFsM=;
 b=kD7w+6iQmw/1uDYFY4znTib7O1r3BuvCacG1lxSXIvgo4L/vhQMV3CyhUdvHOkmeHJ3Y+3y5n5qUknpQXkhJvj5UhkyJv2Qk1LyZKI2FusyMYbvWL1gZQGP0HJluBBeQF0EkE5uBJeuTpoOgzqsadY3mN4yejzq5WK4r3fR/Z6CaiHmqo/yY2hgYHDen+8Cpr4Kjt74sZmQ10EpBFWC+WU1H4R8ykOdrVEMpvbxpasom/BKn4fOPYHbB+haTdJlGpPPRDrRfUXsoEfb3qODd3GK9Ivx29G2dSZ95BqHI9fAcEzYK1wjpMdmShNz1NzzaDixzE0/GtabOuJhZGrwJgA==
Received: from OSCPR01MB16310.jpnprd01.prod.outlook.com (2603:1096:604:3f2::7)
 by TYCPR01MB10824.jpnprd01.prod.outlook.com (2603:1096:400:295::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 02:31:35 +0000
Received: from OSCPR01MB16310.jpnprd01.prod.outlook.com
 ([fe80::5ef2:a4fe:1144:da9a]) by OSCPR01MB16310.jpnprd01.prod.outlook.com
 ([fe80::5ef2:a4fe:1144:da9a%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 02:31:35 +0000
From: "Kazuhiro Abe (Fujitsu)" <fj1078ii@fujitsu.com>
To: 'Hanjun Guo' <guohanjun@huawei.com>, Will Deacon <will@kernel.org>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ilkka Koskinen
	<ilkka@os.amperecomputing.com>, Catalin Marinas <catalin.marinas@arm.com>,
	"Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>
Subject: RE: [PATCH v4] ACPI: AGDI: Add interrupt signaling mode support
Thread-Topic: [PATCH v4] ACPI: AGDI: Add interrupt signaling mode support
Thread-Index: AQHcPzk5+UU2j3z+uUO7itsPcFLu87TLCuOAgBfAiwCAFXA4AIAAH3ZQgANpQwCAANks8A==
Date: Fri, 21 Nov 2025 02:31:34 +0000
Message-ID: <OSCPR01MB163106E2269F8EB49E507A1F3D5D5A@OSCPR01MB16310.jpnprd01.prod.outlook.com>
References: <20251017073935.1746365-1-fj1078ii@aa.jp.fujitsu.com>
 <a93e845a-b084-a680-7158-68363c492b75@huawei.com>
 <aQokdBkjFqw9ZGRt@willie-the-truck>
 <6b14156b-9734-f0e0-5954-57cc76576a37@huawei.com>
 <OSCPR01MB163100DEFA746D8A44FA0A1E3D5D6A@OSCPR01MB16310.jpnprd01.prod.outlook.com>
 <6d110b4f-a1e6-2092-f529-bd527fc00f6d@huawei.com>
In-Reply-To: <6d110b4f-a1e6-2092-f529-bd527fc00f6d@huawei.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NjEwZTZkMzEtNWYyNi00OWM0LTljYWYtNzY5MGRlMWQ2?=
 =?utf-8?B?YjQ0O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTExLTIxVDAyOjI0OjUzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB16310:EE_|TYCPR01MB10824:EE_
x-ms-office365-filtering-correlation-id: 0320e7bf-6177-495b-ed50-08de28a6170e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|1580799027|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NUxsWkV6OFpYaG5wOWc4RVFLczJ6T3ltTEdMMUZUOVNVL2NGMzRROWVxT3Jt?=
 =?utf-8?B?cFZzVVNyRmowd0xjNVp0akkyc2dOYnRjdE9RYStrNHFqL2pSa05WT0lhY29h?=
 =?utf-8?B?anhqb01VQzJwanhiVm9XakdTS2JnbU1uaFNHQ1dIRnM1Z0EvcHM0cWRYT1Va?=
 =?utf-8?B?MW10dHA4NXNYbGNGVjdEZUo3R0x1c0FuS0htdjZjNTA5aGFGRmRicGJEMElY?=
 =?utf-8?B?MW12d3poOUI3NWpndzI4K2U0VVpSZVpYU1A1SE50WGZDREh1bDlCc3YxRWNP?=
 =?utf-8?B?ODVaVlV6QVJlWVJ6U3dGSmRKU2pHejZCbE52Z1I0T2ZJUzhJVW9HV1dDTm5p?=
 =?utf-8?B?cEhzS2UySlNQOGg0cGQ0c04xS2pZWC82MmRRa0ROQ2xrbDk5MXRWcDJBVExE?=
 =?utf-8?B?NGIvb1VOZmZ6cmhPZWVFYStta1BSK1YveExuUlFhQ0k5REkyVnlZMlVaTkZ2?=
 =?utf-8?B?Q0FUSUgrMkZWNFVkeTh3RmJIYlkxdFVUUWEzRkdkU1YyYll3dFU3cVFveDNl?=
 =?utf-8?B?eFVNTWpLS2dDQXh1MlRwU0RkVTBSTU5jUEJybjJCeDVTR3ZMdWhJY3lzRjho?=
 =?utf-8?B?WDJVeGZ0dVNjVnVsbC9jSmlra3NxL3BzZXNxd0ZPWmZ0c0xLWkdLdGhNSS9G?=
 =?utf-8?B?SCs1ZWMwRWpwWUdaQXRZVnZjYXc3b0QxaUxKRVVJN2pBUkhHSU5ZSVlrVW1U?=
 =?utf-8?B?RitndUE4RnNxMit3aDdEVXZFUFQrdGxqOEtBQU9USzNUSTJYK29vQm1nVmd0?=
 =?utf-8?B?SitneVNkWlUyS2tKY3B5L0VES3AzWVVOTGlXUjcyWWJyWGRjbnAvMmJsaEJC?=
 =?utf-8?B?NE5RSWpuSzgrWExsODdyOXhrNVMydGEzdDdLa2FyeCtnNnpmMFpmdXg0TklE?=
 =?utf-8?B?TVh6bE5pb01zZHJVWFJlMkFmaXBnNHlwQlA3SGozc2ZaU3llZVdpVWxqekVp?=
 =?utf-8?B?U2EyZk5IN0x1cC9yb1RodjB0VHlFTWgyZi9MazVnNm1Gb3lxaUlSRFRCL09t?=
 =?utf-8?B?MkJITUVzL0N3QkFMQXArZHpndVJqUG41V2JDamdKTWVZYU8wUWhnd2pYOUJx?=
 =?utf-8?B?L2M3ZTQ4QUFpSW82YTQ5VmM5Q2NEWWV4Y2UrSE1zdnpwTHVMSGNZU2JiWS8v?=
 =?utf-8?B?aVBleUREZXA4Skk3dHMzdU5PdThJbmxkT1NmSzRTcEJaRE01ZDJwZzhlc3By?=
 =?utf-8?B?ZGFVcWQrWDNpSmpKT2NSNThCT1pjWFlMb09ZMVJJMEpPRzhYeVdKTFpUYlU4?=
 =?utf-8?B?K0NXZmZhK2tIQUVwWWJTRlNjdERxaFpCSktWNFNoT3A4YzhnY3doa3FoM0tk?=
 =?utf-8?B?WlNUOTA0SFZrZENnTTAremUyQndCZzdVblVyTmM2ZjBGNEJvQU1CRmtuUmFt?=
 =?utf-8?B?bmpiKzdScFI2VTNzV0NUSUZtc01ZMDVUVm13R3Zaa3lBVHdENUhzOTlSdmRQ?=
 =?utf-8?B?S2JVZlU3UFF3UU1IZHp6M05wNlh0NnNNNnNFMG9VN1RaVEhjUFN1T0NsSDcy?=
 =?utf-8?B?a1NsT3piNmlOZzRSR2R6cFkzUTBGYm5aOXFOeHZQSklOYUlHZjBFS3dqeXJu?=
 =?utf-8?B?NjQ1cm1MSm9aWklTUUp5b1llQVAzbEdHK1N6c1NacnJIRjJUV1Uwa3ZSZndI?=
 =?utf-8?B?RzhaNXlFMFZhSThlVFNNNkc1TE52ZUdadG0vbWxvOElBd215ajhKSnBHdnYy?=
 =?utf-8?B?eFdaaGpJcDJldHlEbk1SaFl6cGhsUHFHVmdwWk5SQkx1N3VkaWtBYTBHM0ds?=
 =?utf-8?B?cXlYSnZBTjRmM3hhVy9NZ05DU2Z1d0FSczc4T0lkb01nVGJxK2ZnZDlVZHhl?=
 =?utf-8?B?V1JOeG0ySWdYR09NWC9pU1hsRjZYeC92d1JrbEs2Yk5Gcy9zYlp3S092bXB3?=
 =?utf-8?B?RVRrQjJNVVhFaHBRZkp0K0N1dkFEenF2RFBHU0ZmNDdONU5abm5xMGsyTlNK?=
 =?utf-8?B?L2o4VEhYdk5RUzhXcVA0SDFUd3BVMDJMWGt0VTBhYWw5OXVLT3NodFllWDNP?=
 =?utf-8?B?eFdtQ0RNS3pRTjFBYTRWZXFOcm1lTDczNDVKRDZoVXk3SzNTWUNTS01iQm5C?=
 =?utf-8?B?c3dJU3AvRHBEK093QVBFQzM5aUZISVdYTElzUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB16310.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzlMMStCdE96V2RxWTJ0ZkdrT253ejdJenFSbVNtRzl2ZDVPWU11WEFWbHIw?=
 =?utf-8?B?QWVHSG9QYkJmbzM2anpOK2ZxTHl4dmFTc0EvNHM0YTducGdPN2xwM2IvQnVO?=
 =?utf-8?B?VGIwdTdNVkdrdDdSYVY4YzNHQ2w3RUI3MXRtUFlLUWtnTUwwK0s1bld5UjlD?=
 =?utf-8?B?TGZRZnFTY09KQW1QZytlZEpTUzh0V3hXUVo0czBQcUdVV1c2cW8xdUt3bExF?=
 =?utf-8?B?cWJaY0ZIVjI3K2NIU3dzZWpnZFBYYzVBM0ZQSFZ3WE5QNi9BWGZXbFV1QlFF?=
 =?utf-8?B?V1YyTmYxTmhHWEYxbjBWODJjWjZrTjhWZUMwWnBtNitmcWxZSmNKRk04MDND?=
 =?utf-8?B?K1o5L3hac2hlVGR4WXJVWHhiZFZQTktWUkRic0hpOE52SWxkblhtZlA2OUg2?=
 =?utf-8?B?cWFXTkNVODBKTTlBRlNCdTJiTGZocW90RlFzd0FRQUN1MjJTa1JKaFI3UHk2?=
 =?utf-8?B?VDc5V1grVXlidkRpbW5tWEh1UE1rRkxrZkRrQXU0cmtMa3o5c3VLU0dreElS?=
 =?utf-8?B?OWJRdllIbURVN2hlVHowdnQ5RHlZVzRFTHBSQkxWZnk3U3pFYjh6dEdaRy83?=
 =?utf-8?B?d3kydThtZ3JNcElqWWNJQUhmbnk3OWtneC80SS8wcnRZTE5lVGtlb1hOVFRt?=
 =?utf-8?B?SVRNTzhrRy9MN2d2UGY4c2MxRGJieXR3YTN0NW8zdElCVHBVa25SVnhObFVF?=
 =?utf-8?B?eDR4SmJqKzJWV2ozUlIrTWxENXNIbHY3Z0gybTdIUE14WDhEbEt3SnVQL0RG?=
 =?utf-8?B?OGlOVjkyRmU4U2pEN3NlVnFYWk15MTBLRGVlRDVJN1MzeExJZXV0MlFYalpZ?=
 =?utf-8?B?WmxCZXdmcklESUpvZE4xY1VkWTJsT0dwN1FIZitsQ2xzTTFVNkhlNzljZHEw?=
 =?utf-8?B?amRIWFpHS3libWNEYUlmZ2wwWTJWOWxsbmR4aUdJaEh0TnI3RjVwbzNvZHUw?=
 =?utf-8?B?cEtYQzlQdGh3MG05TG91VTlMU2w0eXRQV1lTOTUxcDIwUmh0YXUrRFBXK1pO?=
 =?utf-8?B?bTNoZ01yNTRKQzZ6b2hvZGVTaldEZzNodEFWOVhVcGdiMDVEcEZpc1UwNU43?=
 =?utf-8?B?RkRVMGx1YWNrSGYvcDhFOVJRSk9NYzdOZXJSWWpqekhGbWhXTm82b0d3M0Zy?=
 =?utf-8?B?QTBCZGdpOC9JWmZqRzR6RDJEZkNOU3hRYStGWXdPbEw5OHd4U0tjME4xQ0pZ?=
 =?utf-8?B?bHlkSEJGVVFsMWZEczY2bXVNV0d6Y2JpU2hFZzRYZmE3MGlGZXFTTkh6VjVy?=
 =?utf-8?B?UUJTdmoxR0NZR3ltdXRlY3ZnYmMvT3FlcnRMcGwxcjRqeHBZS1ROV3JhNlNz?=
 =?utf-8?B?eG51dElvK01ua3VCTjFkZklRUld4SkZMUTNMVzcxYi9ENHdxKzZqZnMxenZD?=
 =?utf-8?B?K2QyODAwM2hoWEt5azJZa1BENC9kN0NlcnVUOHVtejBhRHdDMEJudy9Td0RQ?=
 =?utf-8?B?ODVGOXpQL3pqWGZ6N0JkcHVQclBOMkcvSlYxZk44dmpxTDcvZmdCNjYzUDRk?=
 =?utf-8?B?UkdqR0VoYUV5S3IzUEhoMXg2QnhiSEJjS2p4UGNkQjVUVkFQbVdsWFVIWnFY?=
 =?utf-8?B?ckNRVTBYYXBLWk9hQm40bmFzRndTSW5RZEJKcUdLbUxrS3V3YzE4cHl5L0FO?=
 =?utf-8?B?aVdqY3FKRHlYc2o2WkEwNEFnZzBiak1ZeDNmbWtBQWFhVE9SVlkxUk12WG1X?=
 =?utf-8?B?MWpvb1I4QVZCMlROM2xjZW9PRmkzeWk0NUJxUTM2bUlwMG80dW5hOXFyRHJT?=
 =?utf-8?B?MjlDVndGd3k1QVNwbXFUclFtYjd3d0lLUkd1K3BrMjZ1QUF3U1lCYXVEeUpk?=
 =?utf-8?B?dDdhcDlSWWJ1WFZTOTJZaE15QXkzZFJLa0xqUCtGWlV1UXF1SnM2LzQwK3R0?=
 =?utf-8?B?YzFTc2wyN21wRkk1WnJxRHAydVZGL29CWHhXVGVpWngway9qdnNHUmtuSXMr?=
 =?utf-8?B?WW9LN1lMUDB6STZHNzFRNDUveWRPZ3llZXFMMWYwNmtBVGU5bHdXNFBocXpp?=
 =?utf-8?B?VTl2VjR5TzNlNTlQRE0rVFpVOHlyVzA3OTFSVExtRnZISTlPdDZDQ1g4RVc5?=
 =?utf-8?B?SjV6KzFYZ0V1RWFUTUV4NHk0a1g1ZktyUUh1d0dHdWs0VlZkekFYSklrVXM1?=
 =?utf-8?B?Tm0vRmF3NTZxS084OXAzczVLd1NteTdSZTVXUkpsWVhRYU5EdG9CSmE1dXJi?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB16310.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0320e7bf-6177-495b-ed50-08de28a6170e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 02:31:34.9096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x4lpZ0hwUeYA/TQJMtMudkREym4sIpG1T2Rp2Uu/iW/X9+NVbaU33c9blAZXj21HBNms+9CZRAvsOoaoYnGCfvPZ81rdfNvwqPA9U6isHxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_183145_841660_B8CD50F8 
X-CRM114-Status: GOOD (  33.61  )
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

SGkgSGFuanVuIGFuZCBXaWxsLA0KDQo+IE9uIDIwMjUvMTEvMTggMTg6MDksIEthenVoaXJvIEFi
ZSAoRnVqaXRzdSkgd3JvdGU6DQo+ID4gSGkgSGFuanVuLA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5
b3VyIGNvbW1lbnRzLg0KPiA+DQo+ID4+Pj4+IEFHREkgaGFzIHR3byB0eXBlcyBvZiBzaWduYWxp
bmcgbW9kZXM6IFNERUkgYW5kIGludGVycnVwdC4NCj4gPj4+Pj4gQ3VycmVudGx5LCB0aGUgQUdE
SSBkcml2ZXIgb25seSBzdXBwb3J0cyBTREVJLg0KPiA+Pj4+PiBUaGVyZWZvcmUsIGFkZCBzdXBw
b3J0IGZvciBpbnRlcnJ1cHQgc2lnbmFsaW5nIG1vZGUgVGhlIGludGVycnVwdA0KPiA+Pj4+PiB2
ZWN0b3IgaXMgcmV0cmlldmVkIGZyb20gdGhlIEFHREkgdGFibGUsIGFuZCBjYWxsIHBhbmljIGZ1
bmN0aW9uDQo+ID4+Pj4+IHdoZW4gYW4gaW50ZXJydXB0IG9jY3Vycy4NCj4gPj4+Pj4NCj4gPj4+
Pj4gUmV2aWV3ZWQtYnk6IElsa2thIEtvc2tpbmVuPGlsa2thQG9zLmFtcGVyZWNvbXB1dGluZy5j
b20+DQo+ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEthenVoaXJvIEFiZTxmajEwNzhpaUBhYS5qcC5m
dWppdHN1LmNvbT4NCj4gPj4+Pj4gLS0tDQo+ID4+Pj4+IEhhbmp1biwgSSBoYXZlIGFkZHJlc3Nl
ZCBhbGwgeW91ciBjb21tZW50cy4NCj4gPj4+Pj4gUGxlYXNlIHJldmlldyB0aGVtLg0KPiA+Pj4+
Pg0KPiA+Pj4+PiB2My0+djQNCj4gPj4+Pj4gICAgIC0gQWRkIGEgY29tbWVudCB0byB0aGUgZmxh
Z3MgbWVtYmVyLg0KPiA+Pj4+PiAgICAgLSBGaXggYWdkaV9pbnRlcnJ1cHRfcHJvYmUuDQo+ID4+
Pj4+ICAgICAtIEZpeCBhZ2RpX2ludGVycnVwdF9yZW1vdmUuDQo+ID4+Pj4+ICAgICAtIEFkZCBz
cGFjZSBpbiBzdHJ1Y3QgaW5pdGlhbGl6c2F0aW9uLg0KPiA+Pj4+PiAgICAgLSBEZWxldGUgY3Vy
bHkgYnJhY2VzLg0KPiA+Pj4+IExvb2tzIGdvb2QgdG8gbWUsDQo+ID4+Pj4NCj4gPj4+PiBBY2tl
ZC1ieTogSGFuanVuIEd1bzxndW9oYW5qdW5AaHVhd2VpLmNvbT4NCj4gPj4+IEkgd2Fzbid0IGNj
J2Qgb24gdGhlIG9yaWdpbmFsIHBhdGNoIGJ1dCBJIGNvdWxkbid0IGZpZ3VyZSBvdXQgd2h5IGl0
DQo+ID4+PiB1c2VzIElSUUZfTk9fQVVUT0VOIHdoZW4gcmVxdWVzdGluZyB0aGUgaXJxIGdpdmVu
IHRoYXQgdGhlIGZpcnN0DQo+ID4+PiB0aGluZyBpdCBkb2VzIGlzIGVuYWJsZSBpdC4NCj4gPj4g
U29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LCBzZWVtcyB0aGlzIGNvbW1lbnQgd2FzIGFkZHJlc3Nl
ZC4NCj4gPj4NCj4gPj4gQnV0IHdoZW4gSSBnbyBiYWNrIHRvIHJlYWQgdGhlIGxhdGVzdCBBR0RJ
IHNwZWMgWzBdLCBJIHNlZSB0aGUNCj4gPj4gc2lnbmFsaW5nIG1vZGUgY2FuIGJlIFNERUkqYW5k
KiAgaW50ZXJydXB0Og0KPiA+Pg0KPiA+PiBGbGFncyBub2RlIHN0cnVjdHVyZXMgMSAzNiBCaXRz
IFsxOjBdOiBTaWduYWxpbmcgbW9kZToNCj4gPj4NCj4gPj4gMjogQm90aCBTREVJIGFuZCBJbnRl
cnJ1cHQtYmFzZWQgc2lnbmFsaW5nIGlzIHN1cHBvcnRlZC4gV2hpbGUgYW4NCj4gPj4gU0RFSSBl
dmVudCBoYW5kbGVyIGlzIHJlZ2lzdGVyZWQsIHRoZSBwbGF0Zm9ybSBpcyBhbGxvd2VkIHRvIG5v
dA0KPiA+PiBnZW5lcmF0ZSB0aGUgd2lyZWQgaW50ZXJydXB0DQo+ID4+DQo+ID4+IFNvIHdoaWNo
IG1lYW5zIHdlIG5lZWQgdG8gc3VwcG9ydCBib3RoIFNERUkgYW5kIGludGVycnVwdCB3aGVuIHRo
ZQ0KPiA+PiBzaWduYWxpbmcgbW9kZSBpcyAyLCBidXQgZm9yIG5vdywgdGhlIGNvZGUgaXMNCj4g
Pj4NCj4gPj4gKwlpZiAoYWdkaV90YWJsZS0+ZmxhZ3MgJiBBQ1BJX0FHRElfU0lHTkFMSU5HX01P
REUpDQo+ID4+ICsJCXBkYXRhLmdzaXYgPSBhZ2RpX3RhYmxlLT5nc2l2Ow0KPiA+PiArCWVsc2UN
Cj4gPj4gKwkJcGRhdGEuc2RlaV9ldmVudCA9IGFnZGlfdGFibGUtPnNkZWlfZXZlbnQ7DQo+ID4+
DQo+ID4+IEthenVoaXJvLCBjb3VsZCB5b3UgdGFrZSBhIGxvb2sgYWdhaW4/DQo+ID4gSSBkb24n
dCB0aGluayBlbmFibGluZyBib3RoIGludGVycnVwdCBhbmQgU0RFSSBtYWtlcyBzZW5zZS4NCj4g
PiBUaGVyZWZvcmUsIHdlIG5lZWQgdG8gY2hvb3NlIG9uZSBidXQgd2UgY2FuJ3Qga25vdyB3aGlj
aCBvbmUgaXMgcHJlZmVycmVkDQo+IGZvciBlYWNoIHBsYXRmb3JtLg0KPiA+IE9uIHRoZSBvdGhl
ciBoYW5kLCBiZWZvcmUgdGhpcyBwYXRjaCB0aGUgY29kZSBpczoNCj4gPg0KPiA+ICAgICAgICAg
aWYgKGFnZGlfdGFibGUtPmZsYWdzICYgQUNQSV9BR0RJX1NJR05BTElOR19NT0RFKSB7DQo+ID4g
ICAgICAgICAgICAgICAgIHByX3dhcm4oIkludGVycnVwdCBzaWduYWxpbmcgaXMgbm90IHN1cHBv
cnRlZCIpOw0KPiA+ICAgICAgICAgICAgICAgICBnb3RvIGVycl9wdXRfdGFibGU7DQo+ID4gICAg
ICAgICB9DQo+ID4NCj4gPiAuLi5hbmQgU0RFSSBpcyB1c2VkIHdoZW4gbW9kZSBpcyAyLiBUaGlz
IGJlaGF2aW9yIHdpbGwgbm90IGJlIGNoYW5nZWQgYnkgdGhpcw0KPiBwYXRjaC4NCj4gPiBUaGVy
ZWZvcmUsIEl0IHNlZW1zIGZvciBtZSB0aGlzIHBhdGNoIGlzIHJlYXNvbmFibGUgZm9yIG5vdy4N
Cj4gPiBJIHdvdWxkIGFwcHJlY2lhdGUgeW91ciB0aG91Z2h0cyBvbiB0aGlzLg0KPiANCj4gSSBo
YWQgYSB0YWxrIHRvIGZpcm13YXJlIGd1eSBhYm91dCB0aGlzLCB0aGV5IHNheSBldmVuIHdpdGgg
Ym90aCBzdXBwb3J0ZWQsIHRoZQ0KPiBwbGF0Zm9ybSB3aWxsIHVzZSB0aGUgc2FtZSBpbnRlcnJ1
cHQgbnVtYmVyIHRvIHRyaWdnZXIsIGFuZCB0aGUgc3BlYyBzYXlzOg0KPiANCj4gV2hpbGUgYW4g
U0RFSSBldmVudCBoYW5kbGVyIGlzIHJlZ2lzdGVyZWQsIHRoZSBwbGF0Zm9ybSBpcyBhbGxvd2Vk
IHRvIG5vdA0KPiBnZW5lcmF0ZSB0aGUgd2lyZWQgaW50ZXJydXB0DQo+IA0KPiBJIHRoaW5rIHRo
aXMgcGF0Y2ggaXMgcmVhZHkgdG8gZ28uDQoNCkhhbmp1biwgVGhhbmsgeW91IGZvciB5b3VyIHJl
dmlldy4NCg0KV2lsbCwgYXMgYWxsIGNvbW1lbnRzIGhhdmUgYmVlbiBhZGRyZXNzZWQsIHBsZWFz
ZSBjb25zaWRlciBhcHBseWluZyB0aGlzIHBhdGNoLg0KDQpCZXN0IFJlZ2FyZHMsDQpLYXp1aGly
byBBYmUNCg0KPiANCj4gVGhhbmtzDQo+IEhhbmp1bg0K

