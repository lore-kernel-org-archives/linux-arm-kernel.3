Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8EFCD4857
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3xinZW9f7hUB2Ok/BURnV7LGUm2zvkXCa4pvg5bAuM=; b=cDAGYwth5GuprHeoEc5wKzF55X
	bqFZbCUtJSxpG286S8ARlTkeAoO/GNlJuBa7dXeNKYfVMqRgiCYwVfOftsLYXDBqg3F6ez0nKj16Z
	XQIl9glAl32WurEajf3AeVzdEyh8mdCNLuCq+6wgdtTTBEswyt5nHL4XclK1CECKYikvj6d2Ux7nb
	89w4NeiQ1msIUKT2MNLK9H4LwUhqWkeAcrJ6D7RIOL72EkbUqM6ruQsFMYbhYiw2njdWQcF1lzEUl
	Td9wFjeMj384+Wd0zGsJhdBJaLnZSYe5cZziI3v7rtzRylY9MfBWHou29/KcrcwAnLoFvYUBz6+ps
	9xG2RNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgwx-0000000FpaV-1BuZ;
	Tue, 12 May 2026 06:50:39 +0000
Received: from mail-japaneastazon11011030.outbound.protection.outlook.com ([52.101.125.30] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgwu-0000000FpZO-3m6H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:50:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXMxTYD2cl3AwptpnXwKdPdFyPQgh0PcfqAwd92uEJS1lfsGp2BuCBn+Y7p4wbTFoJleRX1MZnCa0gasHoalxfhkUVDdZ2L7L0nrPf54YCXuzPNLC80scVX6Krzb6xS4+8YNW9+9UXc1pE1QGj2h2GzsTHVadiapk7y5vbfK/t9YahjeQ0xuw19f0YkRn6jKe4G9RxrtenKZlmGMjdOynVGu6g5P/Yy5MQ7r34f0sR5jIF6O+EKgFLZ+oW4PutPH4y6YQnMxzujx9NsBw/Lajhe+XaDdqxbFVhcxTsTRvjE+zWzX8tSncMkrhVmcMMB2GBpY7ZG5GfRuiDJlSW5lgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3xinZW9f7hUB2Ok/BURnV7LGUm2zvkXCa4pvg5bAuM=;
 b=ZO0fI8bu5yzF1N927E4XnQjzlsdM+4nrNHekYW4XJtuFwR88cY1cWpJJpCG8DyU/ybpnUMCYNh0mLOZQ7zftUTbsLH2y8IQ46MXvNrVg888WR31WZZLXpOfYgSbVipCSIjYg//t3fgWJMyQezBr0mn9fQqh70MCK5jXq229fvQ6HGSe2aWK1X+1iwcNqC++V0I/zOqr/JxxGsJTlp7nTvpFzgsUIJeXYbEW57eu0hVIYyJHrfJZroFLhSOvyDO1r9GvYFIGvDaeQ3Yh2p/SLKVDJc/P5WAlU7KhinfIC6RUorEPb/qzkXLXYL28Vqk2I/oNlrH+OirehG7JTj9931Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3xinZW9f7hUB2Ok/BURnV7LGUm2zvkXCa4pvg5bAuM=;
 b=DaNcYXpIGfbBYAUY6aDmYhBDmdO7Owh0STqgB4F0UhbFtgsOE60vvIgym31g1t96hxhz1btYs6bzEwC3R4i4SuyqAxJxSva5zGXKKVRecOYhqtv+qZbwl80od7tfVfGBGWxL7qL7aePTwsH4skEkJpcnEXFwD0jiXr0EjYI5rm3ApUNmDVWSxOlNVaiYwo5x9Ttv6FSsx4qXTJwdHK0fR5ZSputJyjBJb9Y/yfvXNcDDhu+9uBUHO5LFt7A5/+mLIs5vahISC46nQ4B28RjfEPhG7+OuX6FkYNYqD3EB2idlLqBAWRFMh6zGxP8995KMp1okcPjLlk4GS51LtD4Yrw==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TYCPR01MB8706.jpnprd01.prod.outlook.com
 (2603:1096:400:188::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:50:32 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 06:50:32 +0000
From: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: "amitsinght@marvell.com" <amitsinght@marvell.com>,
	"baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
	"baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	"carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
	"dave.martin@arm.com" <dave.martin@arm.com>, "david@kernel.org"
	<david@kernel.org>, "dfustini@baylibre.com" <dfustini@baylibre.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "gshan@redhat.com"
	<gshan@redhat.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
	"kobak@nvidia.com" <kobak@nvidia.com>, "lcherian@marvell.com"
	<lcherian@marvell.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "peternewman@google.com"
	<peternewman@google.com>, "punit.agrawal@oss.qualcomm.com"
	<punit.agrawal@oss.qualcomm.com>, "quic_jiles@quicinc.com"
	<quic_jiles@quicinc.com>, "reinette.chatre@intel.com"
	<reinette.chatre@intel.com>, "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
	"scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
	"sdonthineni@nvidia.com" <sdonthineni@nvidia.com>, "xhao@linux.alibaba.com"
	<xhao@linux.alibaba.com>, "zengheng4@huawei.com" <zengheng4@huawei.com>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3 1/5] arm_mpam: resctrl: Pick classes for use as mbm
 counters
Thread-Topic: [PATCH v3 1/5] arm_mpam: resctrl: Pick classes for use as mbm
 counters
Thread-Index: AQHc4Vy4PIIINqX+I0qJGIgGC5yaJ7YJ8Q0r
Date: Tue, 12 May 2026 06:50:32 +0000
Message-ID: <TY4PR01MB1693044EDBBF023317F9059A98B392@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20260511154147.557481-1-ben.horgan@arm.com>
 <20260511154147.557481-2-ben.horgan@arm.com>
In-Reply-To: <20260511154147.557481-2-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-05-12T06:50:31.754Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TYCPR01MB8706:EE_
x-ms-office365-filtering-correlation-id: 1b04209a-a20e-49ef-8491-08deaff2c311
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|1580799027|56012099003|22082099003|18002099003|11063799003;
x-microsoft-antispam-message-info: ECDOz6WJpsAa/NZrIIH6TCnNHz2wKcDSZCX4Vds5UT1IWlUVjJDKz4YWhjuvqBUyhGa4KIjRx77zyYMKwmvnDf4qAWs0V5sRVgz26V7/a9Q+DadicsqUaEQ9yAudpDcDX+LsX3mxXngs8I76np5sTxfruX1gmxQRtqpHKzxv3D9etH7d77huQTTyENBKqQNV3ozpAxIIxTitDwBdUfoHeTwuElYtDgbZkY8LeLamsRJ0CpdlSOt/SfVb5zKJcH3cXKHm1ygwxRd3OiHtWulsWm6gz0JOwqWHgq6glrv+MPu8wxfeceASuDGEmPGShsrD4XnM0oNnwG0zaEvrlzblobSyZUNJ727CrmuGinkHfCjbcex1xcGJYU+8vxQZzhAfHJCHBZnm9tWSoX1ucTlF88xyrXgsrY41xwlVS2xk8b4hhxFRsXoEh0aYnV+IdgVb5rS6/HuNIMn5hYPQJf8Zv31sVEjNsj2BxicttLQwZGSdkKj9H/6xYMNinH/uVIg/j11kXlk8iBA0FlD7Ea41wWi+P+uUweTsoqRRus+OtB9/Sdk08h56/UHpeSz83dc7DLpLCebFNFUBqoOkV3BI4A5oOYN4ulypI6KU78YfhTnQfXbduj96v7QR1KcaF9CiJxmXzVkUEFKgi14XX4rLFg7mXXsu/6M6kFUwNgvk4oV2Ug7lPY27rvQfrU4jfUikL+ZT4IX+bI1vEewoNmN5N8Yi6pXeyMfQdXaiDUJ2YR0KE+agkfjxppGltHklsgKzHqONXHPvj45v3fEP/C7AZs/8bvxTLgGpGuZYJLkWThk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(1580799027)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXl0ZTBlQ0ppMXl5WEZ3NU9aTUxUZldjYmNBeDZqRENlS0ZQOHVRejV5SXNM?=
 =?utf-8?B?TzhkaGlXNTg0aFlTbU15dm1oQXBtWmkzeTJmaCs2dVpPdnJFZndYVkFjZDBI?=
 =?utf-8?B?eGhWU3diSUkxcGptN0NZcExaVmNFdit4S25CeHV0L3B3YTNNZHBoVnI1bkJR?=
 =?utf-8?B?UmtTbVFkcjYrdUpXT1FqeGxTdkw0NUMwd0liYWVSN2RSM0RHcVIrcUsvVUto?=
 =?utf-8?B?bHpZZjUwUkZqNld2RitBdEZHV1p1YmlFeVZONGpuU1Q4NTJRcmdObGpKY0ps?=
 =?utf-8?B?RCsySys0bzhURVg2c0ZSb2UwVi95Qlo3QW5JM3E3RU5yZFRFUkoxazN5eW9P?=
 =?utf-8?B?NTBGVVFMVCtGNlJBOFJ2cCsrN2VXVUM4TXlOU1NBSDdpWHdNNGtZd0NhWld5?=
 =?utf-8?B?RzhNZEtTdEVDL2V3TElMV01SNFBybVo0OHpvN3BkSFd3TkdJL3hKSVl2Y0JG?=
 =?utf-8?B?NjBNR3dVMW5TeDk2UWc3YnY2UmloNk9GYVBkcitoUnNHalNwRVBKdzVJeFJC?=
 =?utf-8?B?Yzhud0RKU1A5alMyamJXeVBhNUlIcjNWV1lvcUZaM3RjcUtjUWpvUjZzbmdk?=
 =?utf-8?B?cXVpcUNkQmgrbk5qcU1FMkgvRXgwbS9EcjBIbDBVUExvaWNsQnhUdW5QTm0z?=
 =?utf-8?B?SDdWWTRxVkg3czFRRUw4V2tJazFodmJHbG9IZXUra0p4N0Q3T0Z2aW5aOE9N?=
 =?utf-8?B?K25BY3lPVWNkcDNMYWlrN2VjeG5HSS9rVUJndjBma2dONUtkcHp4UFVZZzV6?=
 =?utf-8?B?anUzZFBhbXUxaDk3WWc4Ni8rTHdXQWtheXVTV3ZJdXhqNWFLWXl1dGxRRkI5?=
 =?utf-8?B?T1NEM2VTdGpoV3lWdk0rVkczZXc2blV1eVJPYmQzTDBBWDdtVGtzVHFvdWlG?=
 =?utf-8?B?eElvcWgwUFVsMlRMSFVyNzJBcC80RGEwKzBoVXc0QXFDZkk4NFFDbHErTDdz?=
 =?utf-8?B?VlF0aDJNWjV6amdwc1k0YndyNlRWU0hqdEhqeWxTVFRHc1NCUWRZYnUwOFhP?=
 =?utf-8?B?K1pDMkVoY0hXNW5Oc1AyeGVPTEp1Z0FOK0s4MHVmZEE0VnUzOXVLT0R0RmJS?=
 =?utf-8?B?ZW9rUDk5RmlKRVB5M3ptNXV0UUVVc2FUVEtEcjlvNFVBWlMyZ0RpeDJLcTJi?=
 =?utf-8?B?V1FjQkVqczlaTENTNjdmdzJ2Q2F1WmJDZStWTzduZENodGo0OGNnbEZ5SUsv?=
 =?utf-8?B?UFI3emtkYTlWcXdQWm9KejBYQnZtcTVYaEhMNHRxbzFQc3NUZEsxWk9DQUlS?=
 =?utf-8?B?NkxTdlhOaEZSeGN2TXdBUmU5UndFUW5JMWxvbXpBTERmKzF4c0VhMk1hV1Fk?=
 =?utf-8?B?K1RDd2lYT29VTWpWbjJrNytlamx3c05lUHF0ODg1enhneERLV3RjT3FMZmRZ?=
 =?utf-8?B?djBOb3pxaCtwdzQ3SGVtY1pKMm5va2pKNUhISmFDUUtiLzF1Vk45ZmF5STlE?=
 =?utf-8?B?Tkk3ZkZCZkZoakVVT0cxUHVlTVROTXYxenhKZEcvYklEaDBSbHpoOGNsM0Vy?=
 =?utf-8?B?MnlvckltWG4vTytLckZwQ0dxVjRRNFFJM1FoUjB0SGVrMnpqT25wckJscVpu?=
 =?utf-8?B?Y0I0bTdzbDNVZXBLMVVNS0UzNVFiV2UrVS9hTXlJOC9pdjZnMDJJY0tYQkhz?=
 =?utf-8?B?MWJEWlZrelZWVVJSZGtmbDJZTlo2TW9QbjQ1T00zWitUbit5Nm9IUDNudGRI?=
 =?utf-8?B?aGJsd3lFTXpuZk5hOTRqNkl0TUlxdUlDdE9mUk9PdmJJV0tTaHBNWWNqTHFw?=
 =?utf-8?B?aVJWYVFuaHpiSXl3WXAycS9YQ0J3WXM1K0t4ZklrbDluNTROYnk0aGFJWlk0?=
 =?utf-8?B?V05HZjZ0a0pVWnJKS1ZhdDYxUW5RMjR5NWVOVDYyM01OMklyZUpKbjMrMU1p?=
 =?utf-8?B?N0xkQzBJWGh6Y2lvVHFEQzhmaUdjblV3cCtFVGtEWHRld2tCQmt2T0QvaThh?=
 =?utf-8?B?SkV2NmRuWFJSWXhvYTBwRi85TWpVT2dsc2lhMFI5QlJvOXU3VGxmaTZBUHN0?=
 =?utf-8?B?cjVZYzJvNVpUZGlFZVRvbE1JVTFjS3VMdWhxY0d3dnUwSFF0NnpJUkpYczda?=
 =?utf-8?B?UGExMEVhS0ZsOE8zbVBrRUpIYllkRHdYbUkyTDBnQm5aZE5CbEtIZUozRTVm?=
 =?utf-8?B?cmE2WWJKYk5qRmxhZ1VBTjBReVRaU2diWURBUkltVVRYYVhNRFoyK0ovRVYr?=
 =?utf-8?B?RnJWMjJucjUxY0JPZFRRVUFEQ2xtbVhVRllKd3o1MU1oVnV6WXBzL1ZNc2o0?=
 =?utf-8?B?YzM0U2U4MHZaVHVoOXhNUUo4L2ZENDQzQ0t0eXlXSFZxdUozaVJIa0hkeGJC?=
 =?utf-8?B?QXBFQjNaZloxU2pXYW1JVDdVTjdiSU0zcFh4eE5XaDB1cG5IUnd2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: vqMreTqBHz79TzR1iHQeQKyZyY5HSUx69/1kOuuWvlDN2PhLr/vkiojzewXWoFjIYV1Tz3QMfylhN9ohh/ir10hv1LFsc4oIHEdU72ZdfWLchO47FO+JYQwJQz3KBVWG6a91b1uivUk/yUQIZ0DopbFyTEp1IX5X98LceajsqlOCULNmeweDJWo0DUuzrlGdIflrJOz3deA6vDiW/fm0zsxJ3Lp7D07ZNunIhzWOV9JhhCt7jgcoxa+cHt1pOHwXCMbUf7fWf41sJUVEad5Kq+0Sa3WH5dCfsVbeuHkXJUgggCPzFlifvGMm0LwA9xwSUfaU0JasN/9d46m3A8y8Yg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b04209a-a20e-49ef-8491-08deaff2c311
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 06:50:32.2327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z4n3gw9bWXWk1LGKjmV893q4zQAUJxr9Kd2v+fpBBxk+SbW4tDmF2bSEpV5H6KnbuJDtA/+h0GihoawbOhUEn91CRSrNre2By2d4IOwymHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8706
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_235037_061378_6956ABBF 
X-CRM114-Status: GOOD (  24.96  )
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

SGVsbG8gQmVuLAoKPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiAK
PiByZXNjdHJsIGhhcyB0d28gdHlwZXMgb2YgY291bnRlcnMsIE5VTUEtbG9jYWwgYW5kIGdsb2Jh
bC4gTVBBTSBjYW4gb25seQo+IGNvdW50IGdsb2JhbCBlaXRoZXIgdXNpbmcgTVNDIGF0IHRoZSBM
MyBjYWNoZSBvciBpbiB0aGUgbWVtb3J5IGNvbnRyb2xsZXJzLgo+IFdoZW4gZ2xvYmFsIGFuZCBs
b2NhbCBlcXVhdGUgdG8gdGhlIHNhbWUgdGhpbmcgY29udGludWUganVzdCB0byBjYWxsIGl0Cj4g
Z2xvYmFsLgo+IAo+IFRlc3RlZC1ieTogU2hhb3BlbmcgVGFuIDx0YW4uc2hhb3BlbmdAanAuZnVq
aXRzdS5jb20+Cj4gVGVzdGVkLWJ5OiBaZW5nIEhlbmcgPHplbmdoZW5nNEBodWF3ZWkuY29tPgo+
IFJldmlld2VkLWJ5OiBTaGFvcGVuZyBUYW4gPHRhbi5zaGFvcGVuZ0BqcC5mdWppdHN1LmNvbT4K
PiBSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8am9uYXRoYW4uY2FtZXJvbkBodWF3ZWku
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbWVzIE1vcnNlIDxqYW1lcy5tb3JzZUBhcm0uY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEJlbiBIb3JnYW4gPGJlbi5ob3JnYW5AYXJtLmNvbT4KPiAtLS0KPiBD
aGFuZ2VzIHNpbmNlIHJmYyB2MToKPiBNb3ZlIGZpbmRpbmcgYW55X21vbl9jb21wIGludG8gbW9u
aXRvciBib2lsZXJwbGF0ZSBwYXRjaAo+IE1vdmUgbXBhbV9yZXNjdHJsX2dldF9kb21haW5fZnJv
bV9jcHUoKSBpbnRvIG1vbml0b3IgYm9pbGVycGxhdGUKPiBSZW1vdmUgZnJlZSBydW5uaW5nIGNo
ZWNrCj4gVHJpbSBjb21taXQgbWVzc2FnZQo+IC0tLQo+IMKgZHJpdmVycy9yZXNjdHJsL21wYW1f
cmVzY3RybC5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiDCoDEgZmlsZSBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcmVzY3RybC9t
cGFtX3Jlc2N0cmwuYyBiL2RyaXZlcnMvcmVzY3RybC9tcGFtX3Jlc2N0cmwuYwo+IGluZGV4IDIy
NmZmNmY1MzJmYS4uZjcwZmE2NWQzOWU0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcmVzY3RybC9t
cGFtX3Jlc2N0cmwuYwo+ICsrKyBiL2RyaXZlcnMvcmVzY3RybC9tcGFtX3Jlc2N0cmwuYwo+IEBA
IC02MDYsNiArNjA2LDE2IEBAIHN0YXRpYyBib29sIGNhY2hlX2hhc191c2FibGVfY3N1KHN0cnVj
dCBtcGFtX2NsYXNzICpjbGFzcykKPiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+IMKg
fQo+IMKgCj4gK3N0YXRpYyBib29sIGNsYXNzX2hhc191c2FibGVfbWJ3dShzdHJ1Y3QgbXBhbV9j
bGFzcyAqY2xhc3MpCj4gK3sKPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBtcGFtX3Byb3BzICpjcHJv
cHMgPSAmY2xhc3MtPnByb3BzOwo+ICsKPiArwqDCoMKgwqDCoMKgIGlmICghbXBhbV9oYXNfZmVh
dHVyZShtcGFtX2ZlYXRfbXNtb25fbWJ3dSwgY3Byb3BzKSkKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4gKwo+ICvCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7
Cj4gK30KPiArCj4gwqAvKgo+IMKgICogQ2FsY3VsYXRlIHRoZSB3b3JzdC1jYXNlIHBlcmNlbnRh
Z2UgY2hhbmdlIGZyb20gZWFjaCBpbXBsZW1lbnRlZCBzdGVwCj4gwqAgKiBpbiB0aGUgY29udHJv
bC4KPiBAQCAtOTgzLDYgKzk5MywyMiBAQCBzdGF0aWMgdm9pZCBtcGFtX3Jlc2N0cmxfcGlja19j
b3VudGVycyh2b2lkKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChjbGFzc19oYXNf
dXNhYmxlX21id3UoY2xhc3MpICYmCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB0b3BvbG9neV9tYXRjaGVzX2wzKGNsYXNzKSAmJgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdHJhZmZpY19tYXRjaGVzX2wzKGNsYXNzKSkgewo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwcl9kZWJ1ZygiY2xhc3MgJXUg
aGFzIHVzYWJsZSBNQldVLCBhbmQgbWF0Y2hlcyBMMyB0b3BvbG9neSBhbmQgdHJhZmZpY1xuIiwK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgY2xhc3MtPmxldmVsKTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBXZSBjYW4ndCBkaXN0aW5ndWlzaCB0cmFmZmljIGJ5IGRlc3RpbmF0
aW9uIHNvCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiB3ZSBkb24ndCBrbm93IGlmIGl0J3Mgc3RheWluZyBvbiB0aGUgc2FtZSBOVU1BCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBub2RlLiBIZW5jZSwg
d2UgY2FuJ3QgY2FsY3VsYXRlIG1ibV9sb2NhbCBleGNlcHQKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHdoZW4gd2Ugb25seSBoYXZlIG9uZSBMMyBh
bmQgaXQncyBlcXVpdmFsZW50IHRvCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBtYm1fdG90YWwgYW5kIHNvIGFsd2F5cyB1c2UgbWJtX3RvdGFsLgo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvdW50ZXJfdXBkYXRl
X2NsYXNzKFFPU19MM19NQk1fVE9UQUxfRVZFTlRfSUQsIGNsYXNzKTsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqB9Cj4gwqAKPiAtLSAK
PiAyLjQzLjAKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNTk5NjE3YWEtYWFkZS00ZmRl
LTllZmEtNzlkNTkyZjFmZjNmQGFybS5jb20vCgpUaGlzIGNvbmNlcm5zIHRoZSBjb21tZW50IEkg
cmVjZWl2ZWQgbGFzdCB0aW1lLiAKSSBtYXkgbm90IGhhdmUgZnVsbHkgdW5kZXJzdG9vZCBpdCwg
c28gSSdkIGxpa2UgdG8gY2xhcmlmeSBpdCBvbmNlIG1vcmUuCgpFdmVuIGlmIHRoZSBzeXN0ZW0g
YXMgYSB3aG9sZSBoYXMgbXVsdGlwbGUgTDMgY2FjaGVzIGFuZCBtdWx0aXBsZSBOVU1BIG5vZGVz
LApBQk1DIHdpbGwgYmUgZW5hYmxlZCBhcyBsb25nIGFzIHRoZXJlIGlzIGEgc2luZ2xlIEwzIGNh
Y2hlIGFuZCBhIHNpbmdsZSBjb3JyZXNwb25kaW5nIE5VTUEgbm9kZS4KSXMgbXkgdW5kZXJzdGFu
ZGluZyBjb3JyZWN0PwpJZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNvcnJlY3QsIHdpdGhpbiB0aGUg
J3RyYWZmaWNfbWF0Y2hlc19sMygpJyBmdW5jdGlvbiwKQUJNQyBpcyBlbmFibGVkIG9ubHkgd2hl
biB0aGUgZW50aXJlIHN5c3RlbSBoYXMgYSBzaW5nbGUgTlVNQSBub2RlIGFuZCBhIHNpbmdsZSBM
MyBjYWNoZS4KCiA4NzAgc3RhdGljIGJvb2wgdHJhZmZpY19tYXRjaGVzX2wzKHN0cnVjdCBtcGFt
X2NsYXNzICpjbGFzcykKIDg3MSB7Ci4uLgogOTAxCiA5MDIgICAgICAgICBpZiAoIWNwdW1hc2tf
ZXF1YWwodG1wX2NwdW1hc2ssIGNwdV9wb3NzaWJsZV9tYXNrKSkgewogOTAzICAgICAgICAgICAg
ICAgICBwcl9kZWJ1ZygiVGhlcmUgaXMgbW9yZSB0aGFuIG9uZSBMM1xuIik7CiA5MDQgICAgICAg
ICAgICAgICAgIHJldHVybiBmYWxzZTsgKgogOTA1ICAgICAgICAgfQouLi4KIDkxMgogOTEzICAg
ICAgICAgaWYgKG51bV9wb3NzaWJsZV9ub2RlcygpID4gMSkgewogOTE0ICAgICAgICAgICAgICAg
ICBwcl9kZWJ1ZygiVGhlcmUgaXMgbW9yZSB0aGFuIG9uZSBudW1hIG5vZGVcbiIpOwogOTE1ICAg
ICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7ICAqCiA5MTYgICAgICAgICB9CiA5MTcKLi4uCiA5
MjYgfQoKCkFsc28sIEknZCBhbHNvIGxpa2UgdG8gY29uZmlybSBvbmUgbW9yZSB0aGluZy4KVGhl
IG1wYW1fcmVzY3RybF9waWNrX21iYSgpIGZ1bmN0aW9uIGFsc28gY2FsbHMgdHJhZmZpY19tYXRj
aGVzX2wzKCkuIApUaGlzIHN1Z2dlc3RzIHRoYXQsIGV4Y2VwdCBpbiBzY2VuYXJpb3Mgd2hlcmUg
dGhlIGVudGlyZSBzeXN0ZW0gaGFzIGEgc2luZ2xlIEwzIGNhY2hlIGFuZCBhIHNpbmdsZSBOVU1B
IG5vZGUgKEFCTUMgaXMgZGlzYWJsZWQpLAp0aGUgTWVtb3J5IEJhbmR3aWR0aCBhbGxvY2F0aW9u
IHdpbGwgYWxzbyBiZSBkaXNhYmxlZC4KSXMgdGhpcyB0aGUgaW50ZW5kZWQgYmVoYXZpb3I/IElm
IHNvLCBjb3VsZCB5b3UgZXhwbGFpbiB3aHk/CgpCZXN0IHJlZ2FyZHMsClNoYW9wZW5nIFRBTgoK
CgoK

