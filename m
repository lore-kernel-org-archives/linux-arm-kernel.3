Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75AA10BA421
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 03:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqH3zYjAT2jE3AU0Ev2HWYxEr0bY5I0vDhSM47U5JRI=; b=kSfFrf1RqDieHT75kyVfypzgV6
	jxGtm19h6shNREzCP7nOyRfsK06sBrv+aWrJX4mZmZzk0I1+U/pEG8QkL+sm5H0yWfqr9yTaBumPr
	UCnpHajy5Mm7TMS0R02ZAuFW6VrFBT7EZjlv+F0TwYhyvk/EmAzwU7PLWcdmuvKkPiCUY9tNMRKIz
	f1JVByA6wFtLjBJrJFtB32Zn6mtNF51m4DFCYf5vso/vVkGkYLOqv4E+3zqXP4ZaFlISCVCwr3CXE
	x2gxrSVKpc9Y/7bRjWUxb8D48G4jq7H84y8bi9DybJ1kEsoOskR9crra7O/ad6WxHnegXIUJtXnFw
	GH10ZsNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xRJ-00000006aff-1BYV;
	Fri, 27 Mar 2026 03:00:49 +0000
Received: from mail-japaneastazon11011015.outbound.protection.outlook.com ([52.101.125.15] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xRH-00000006aex-0YUc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 03:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtuG72zrAX0jIklixB2fEi38FZaXP8m63k/urDISjcJaXRbis0ztxU80khVFyuwboycz1NLqfQXkOwxhPfwIm5gBCoS11RoukLZBO02JHE1wTrf1DaQGnwcmtc4dT2nqNvfm9qEKIKHENZ5U197xntBVFzaccPKLrfeQdiBrlq481J2dlg5wxiRTpKQUA2zgLQiT8S97//2ALePYX5jWu/O8fsfcXxKy019DtQNt9qgCXqbBonQ7ofsaQKeolpPnEas2ZaDfqVSK1dZpTfLn4eJzCYduCfVtba4MkZde1bt+OKB8We/5ZDvj9C8pbr6Pbc4YJ+WhGM3CmR1Hj9JSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqH3zYjAT2jE3AU0Ev2HWYxEr0bY5I0vDhSM47U5JRI=;
 b=aIhRGOcjgCaydsV9YT2f7tzw5XzjjgB3+A2N9v8Z2IEFnpTNPk7LyXRIS9+LgpRNTC8+Fn5o7io08gHfaJFeb7WRDZTUtNZng3W6IP2tjlvrRUpW4iH+uukRw9wuc9a9oGQQqBml7Ef04NLVMlSgGQRFJ08Hu0zzKeBusC067flxzctUZiboenMEwkyd0wGQYxjSUQEY5TR2xSnajT8B5RwjY104fQJ0zUpJhtoPdoseboadAY7XmI2foBB8VCDKm9SbGs5t06v/Enoug37sA5q4zN/a6COYVi2OPow+7lK13BBtEYw5U0Ykd1HKbbriij44M87dgNtWr3poHuWrVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqH3zYjAT2jE3AU0Ev2HWYxEr0bY5I0vDhSM47U5JRI=;
 b=OA/WEBxv08bglAYbslW0fJMCmhM7rfp3s3f0Q4LTLMeOtqLzWZpcUDcvgqzBmcYIXZqVui5uT9tKY2l1wpDhpEe3Y19HdCCG+Hz6AujizhP3goWHv7IXnScXZbF0h6bW2NHYkZtOQffnW036e7Og1jJ4O1QRg4sR/W5Ka/O76icZR+nOEVH44ALl4zjwEpltilSoJGWB0jebJ4JNVknZ31lISVma9pdoNhkjFyQh7PXpjb2kmFmokdV9IPhXRoAnnaGwtLk5Jg6LFpw7tr9RlKBb+0iOOgbxH2AosvWQhl8ezBzm1OkAzUN13pA9lKNO9FYsLKzQmwIS/sbIPdp/4Q==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TY4PR01MB12592.jpnprd01.prod.outlook.com
 (2603:1096:405:1e7::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 03:00:41 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 03:00:41 +0000
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
	<xhao@linux.alibaba.com>, "zengheng4@huawei.com" <zengheng4@huawei.com>
Subject: Re: [RFC PATCH v2 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
Thread-Topic: [RFC PATCH v2 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
Thread-Index: AQHct8FGRjtF+TbVTUC/VCTIh5XbQ7XBu755
Date: Fri, 27 Mar 2026 03:00:41 +0000
Message-ID: <TY4PR01MB16930BFFB7CE7FEB56CA693098B57A@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20260319165540.381410-1-ben.horgan@arm.com>
 <20260319165540.381410-3-ben.horgan@arm.com>
In-Reply-To: <20260319165540.381410-3-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-27T03:00:41.072Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TY4PR01MB12592:EE_
x-ms-office365-filtering-correlation-id: 6de2f3b3-165e-4942-bbdf-08de8bad082f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|1580799027|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: B49vzV7jgaqT+4AHOjNqTaYPAtOfpe0z0wnX/2g/8svJ94klhykvrG3rBFL5u6OryhHo5GBS7gIgle0HsqCK50JGR25oXiNy0WBv1iZm9PX1aD5l6Yknh7OaSp0uRnmqRdMvwNAMptuDxZMlQjAPMnAcwlKxigDjG3NYV6JJciFO9qIQjRcjNGF+++g9ngZbU9Dg4yyg4INoavl104at61ycM8x8/DZKOfDjAnjLp6DbSeEv3LwcTGFk8qel/fu7uxH7UF4JT5+mK+MnYiRNIJeDkJ2YbhfQLHSj73U05stejBBUL2tUqCqBQN1AN41LOrbIGf+N5xUqfeaTP4KFrQ/vCPxaruOcjtFlUxXC/c+ZHYRtDkyrffESb+oIkVXRL3P4BS1MnZJXeJnrmkHbk36zGby8fcnjn+I99MyJMyj9+FRVsAS0PlLHYXvDQKhnWZkwtm5UkxTgXozBngxYw4GqsyLyDeH2snIjKgw8IewRYvQ8kiHyYgqyAIILEd0BBECixsbM2g4XruJqb2T9WGcU3+h9xxCCgEoyjyNnl6Un8s7Kn/cPmJ/opSwNEhuFl2f/wy86xhObD616RBbedF/hHAq5XZYl5a1iOjGLWRVO+XkOviX8HOvCjeU0Osz1XPunnWRaJRrhu4OF+lnn2RcwtqvZ5LkDIQhJ1YE28FzlNSjAczNwizRNlegq6R/JwkOv1X43iOtWJSsAXYKRDHyI8hFHgF55wsIG36WiwTHu7ElxRL7WPiAtvBP69OxLWCV4g7RielC0/nS5YNaG+WsoowT699tHG7X/3Yoj29ZqgUbmuAw5BxowffX97oew
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(1580799027)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?a1pNTXhTbGtzSVQ0UkJCbWtPVFBTcXZQTkRDeU9ZRmJVdkpORUhoSFVR?=
 =?iso-2022-jp?B?MjQ3Ylk3N3RjRHRVbFp2TnlSZy9GbHd5RXBveDkvbTZNVm5wRjFXSnJJ?=
 =?iso-2022-jp?B?MnFET1J2ZmRuZnRJME9jdUhWMzlVODg1SGZyNFVzVW5RZnAzQ1hzcWJU?=
 =?iso-2022-jp?B?c3FQcXpiZ25SSUJ2MHFXRE9hdVlONlYwbGJnMk1PSmtZanZ1Z3ZKK1Ux?=
 =?iso-2022-jp?B?bVFOVkp1VGZhV3JnQW15SE5RWmRBVTE0clBHT3J4M01JUVdoOU1PQ1VT?=
 =?iso-2022-jp?B?TzhRVkhSUVM0b2J5Z2xSNVNEQzVTNExjY2dFblVHR2t3QnVPNXNBVmwy?=
 =?iso-2022-jp?B?RXV0WWpqNXcyOWxtajlCeVdEZlIwOEpudldDZk9VVTZrN3dDWnI3b3I4?=
 =?iso-2022-jp?B?MDVwb2lmazl0SjR0NTVmU21yUkUrdVJrUHBSZVFoWDBUTmtHN2hDbDJm?=
 =?iso-2022-jp?B?RE5yUG9xRkd1SHlTSVF5VGNZLzR2bllGWjBDeFlhNkV6akgvUFgxeHNO?=
 =?iso-2022-jp?B?ZWpMWU0xMlBQUjZyc3VkZk5wNHF3NTBLTzE2c0dDc1N2aEt4YjZpblk0?=
 =?iso-2022-jp?B?aUwzWmhTdWlnc1Jrb3ArZlM5RDNIYUhSaWNlVXhIb05uR2l1VGtEdDZp?=
 =?iso-2022-jp?B?NGJFbWtUeEZXOXFlcWpJeWRSTTdNU0RkZ0JONExYTVJ0RjFSOVdaQ0Nl?=
 =?iso-2022-jp?B?VDRqQlVDRGQzU3pxVS9hN1NZbnhKUVlVOUdLUXB4azRLNTN4bHJVSUhP?=
 =?iso-2022-jp?B?RndsTElIaXpwSTExNDBMZmJLVEVoSnJBQ2JXS1lwM1U2Qnhkd0JtU0RN?=
 =?iso-2022-jp?B?L1BoZkJRMUM4VzVzK0xkazlRM1RuaExhZ09XRm9GSnU1SDdGSXpjNGFQ?=
 =?iso-2022-jp?B?a3ppaE0yYzVkd0w0N0dxRDFkZ3h2SGYvYXU5c0xtOVZBcTNqNy9YK213?=
 =?iso-2022-jp?B?aDZ3Q2l3bHR6RExWS0o0NHN3Mm10Y3grRTVEVW5CZDcvUi96SmtiU2x6?=
 =?iso-2022-jp?B?czVGdTV6SzQzSWxQQytQcXh3cURZREFmSG5sU2FteGNwbHN5T2djOFZs?=
 =?iso-2022-jp?B?MFZ6TnNQemtseTlLbUVHeCtkNW42Q2lIODQ3ZWR2R0xWTkhQYWpGZUs4?=
 =?iso-2022-jp?B?QWF5a0F4N213NTdaUStENEhaYlp5UXgrZkx1VUU1eDlpUDBNdHd0clFG?=
 =?iso-2022-jp?B?N1BKNDRaZU00ajBqRnpNMDBTWkJoTnB6R2dGbjE0SldneXdaRUZtR3Vj?=
 =?iso-2022-jp?B?eHJmZWVET0FuK0lTeGM3UHJudzg0R3dCYWxEVmJUM1NlVlBGRlZucTE4?=
 =?iso-2022-jp?B?OFNWcmtLTlhkRXRsQjBwMTNMR2RwQ0dGQVU0cTFWbjFCTlhnV2RIRlpH?=
 =?iso-2022-jp?B?bFJFZlFlYkY0QUJVaG5ERGFQd0pKSFo5Qm9aclZpTWl0Y2lBaEF2dm5L?=
 =?iso-2022-jp?B?NHkzUHpCZFJhQVdWY0Q5VWlXTjhzS1dmWXZNeVJYTitnNXJZck1IZWlX?=
 =?iso-2022-jp?B?N0tSMXRVbjdaZzVIa1RvWUkyV3NFQkdBdmVlaGc2SUwvOHJBczFCSnVU?=
 =?iso-2022-jp?B?d3dZUExBanBCUTU5UzExY3pBS05kb0lQblU2eFMvRUJVcWpIUExNVGZz?=
 =?iso-2022-jp?B?d3Nzay9ZUkRpTUgzRUI3QXU1dzFVU3JzNldFcjlBbGFzaGhnaWc1OWFM?=
 =?iso-2022-jp?B?Q2RRL0QwZTRjKzJ5UE90OTdvN2lsMGZMVE0xRGlXc0p5UkgzSXI4UGtm?=
 =?iso-2022-jp?B?cUFtdWJNeGJUN0RXQmZZZEdzM3RQQm44WEJqb2FVdzl2VXczb2hDaTVm?=
 =?iso-2022-jp?B?eCsxcDJabUg4TUdNc255TDJlY0pEZHJKS3ErQ1hUMWtTeXBjUkM5Nmc5?=
 =?iso-2022-jp?B?aW1meGZHWDVaVEhyanQ0d29yUW91TUNYaDRVd0JXd29rZGdzRU9HZ2FX?=
 =?iso-2022-jp?B?R3FmeWtGemY0cWxVbVlqc2I4MjFSN1ZEaCtxdUdaVkNLdDZ6TjFUaTlF?=
 =?iso-2022-jp?B?QVJ2MDNYY28yNjhXbzFqVjRoUXU3emtMTFFhaWY2bWZvWUJ3SGdLTlVv?=
 =?iso-2022-jp?B?bFNqTlhIWnk5YnpkeU9NdVhDL2JEd3NNbzE4NEsxNnNZVTIwWFlhSnp4?=
 =?iso-2022-jp?B?dktFbEJOdG82Y3c3c1doemx2ZDA5V1Nrd0I5STA1eTZTRHlWRUc4M1hZ?=
 =?iso-2022-jp?B?WHVhOUhVclA2cklBc1N2a09XUWkySm5MNUF0ZmN2SXlOWHo2UGkyVDBu?=
 =?iso-2022-jp?B?WU5GQjRPSFljNGx1T0NnbTY5VFpGeUM3WUJ2akN3eVlMOGpSTDFIZFBD?=
 =?iso-2022-jp?B?bzdLZ2pPS0FJMnJLNWs2SCtHTVpTRGZsZEQvNTRwS2NIUmFnSTFoYXBy?=
 =?iso-2022-jp?B?TndWbkZXdmxwdWZzdlgrSC9UbTA5V2xPSk90WmM0WE5ZRmVvZVZuUkhr?=
 =?iso-2022-jp?B?NXZkY1BTV1c4ZzV2K0RwL0FrMEgwdThtNnZiQXN0ckZzOUY4aUZDTEtJ?=
 =?iso-2022-jp?B?a3dOTy9Mb2llRThlSDI3M21HVDgvVXVXNWZGZz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Kbk2f35l8T5e2nskdY0ZVGz91pUvlELEY/otO4lqegZfhrSWe9UzCO923wuOfn71yxgMWmjvZFfBSTtqh24vyZNI4Ns8+jI9yDoQIMg0lQCWpXFj9SK/zjJfxuGbYF6l9GMjRV2wO+4jU9SETsSsFadaemfdxuz4YpRBeYPBlNBjR98w4hJgdh324co8s4EzwonRWIvuo13VUCQLmRu8sWQ7gPBHKdaMlcNCNU/NhEZkjSgaQOd5/cSwEpNTHvLzzn2Mv0M6emlqMnNmZmwS8ATZgIAQy/RFWc4qTOmnm5/UCvkGty3pipgGDnar6PrwucQriAkfF6NSB/37hxe0lQ==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de2f3b3-165e-4942-bbdf-08de8bad082f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 03:00:41.6075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kh/Cgx8xLOjD3/3CnIBaJZ451XxcIIvFjwRF5FmZekB0RIh74l92Nj2bO3hnVxFNhJSsKy7W4DheYn6V0WLz+lvkwNtcWVCm3NrhbgLEHDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12592
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_200047_176862_4F97425F 
X-CRM114-Status: GOOD (  19.22  )
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

Hello Ben,=0A=
=0A=
> MPAM is able to emulate ABMC, i.e. mbm_event mode, by making memory=0A=
> bandwidth monitors assignable. Rather than supporting the 'default'=0A=
> mbm_assign_mode always use 'mbm_event'mode even if there are sufficient=
=0A=
> memory bandwidth monitors. The per monitor event configuration is only=0A=
> provided by resctrl when in 'mbm_event' mode and so only allowing=0A=
> 'mbm_event' mode will make it easier to support per-monitor event=0A=
> configuration for MPAM. For the moment, the only event supported is=0A=
> mbm_total_event with no bandwidth type configuration. The 'mbm_assign_mod=
e'=0A=
> file will still show 'default' when there is no support for memory=0A=
> bandwidth monitoring.=0A=
> =0A=
> The monitors need to be allocated from the driver, and mapped to whicheve=
r=0A=
> control/monitor group resctrl wants to use them with.=0A=
> =0A=
> Add a second array to hold the monitor values indexed by resctrl's cntr_i=
d.=0A=
> =0A=
> When CDP is in use, two monitors are needed so the available number of=0A=
> counters halves. Platforms with one monitor will have zero monitors when=
=0A=
> CDP is in use.=0A=
> =0A=
> Co-developed-by: James Morse <james.morse@arm.com>=0A=
> Signed-off-by: James Morse <james.morse@arm.com>=0A=
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>=0A=
> ---=0A=
> Changes since rfc v1:=0A=
> abmc enabled even if enough counters=0A=
> Helpers from dropped free running commits=0A=
> carry on with zero counters if using cdp=0A=
> set config bits=0A=
> use kmalloc_objs=0A=
> drop tags for rework=0A=
> Configure mbm_cntr_configurable, mbm_cntr_assign_fixed=0A=
> ---=0A=
>  drivers/resctrl/mpam_internal.h |   6 +-=0A=
>  drivers/resctrl/mpam_resctrl.c  | 135 +++++++++++++++++++++++++++++++-=
=0A=
>  2 files changed, 137 insertions(+), 4 deletions(-)=0A=
> =0A=
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_inter=
nal.h=0A=
> index dbb99d9b0795..02807531bd1b 100644=0A=
> --- a/drivers/resctrl/mpam_internal.h=0A=
> +++ b/drivers/resctrl/mpam_internal.h=0A=
> @@ -415,7 +415,11 @@ struct mpam_resctrl_res {=0A=
>  struct mpam_resctrl_mon {=0A=
>          struct mpam_class       *class;=0A=
>  =0A=
> -       /* per-class data that resctrl needs will live here */=0A=
> +       /* Array of allocated MBWU monitors, indexed by (closid, rmid). *=
/=0A=
> +       int                     *mbwu_idx_to_mon;=0A=
> +=0A=
> +       /* Array of assigned MBWU monitors, indexed by idx argument. */=
=0A=
> +       int                     *assigned_counters;=0A=
>  };=0A=
>  =0A=
>  static inline int mpam_alloc_csu_mon(struct mpam_class *class)=0A=
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctr=
l.c=0A=
> index c17577e52f58..74b6ca59ce4a 100644=0A=
> --- a/drivers/resctrl/mpam_resctrl.c=0A=
> +++ b/drivers/resctrl/mpam_resctrl.c=0A=
> @@ -75,6 +75,8 @@ static DECLARE_WAIT_QUEUE_HEAD(wait_cacheinfo_ready);=
=0A=
>   */=0A=
>  static bool resctrl_enabled;=0A=
>  =0A=
> +static unsigned int l3_num_allocated_mbwu =3D ~0;=0A=
> +=0A=
>  bool resctrl_arch_alloc_capable(void)=0A=
>  {=0A=
>          struct mpam_resctrl_res *res;=0A=
> @@ -140,7 +142,7 @@ int resctrl_arch_cntr_read(struct rdt_resource *r, st=
ruct rdt_l3_mon_domain *d,=0A=
>  =0A=
>  bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)=0A=
>  {=0A=
> -       return false;=0A=
> +       return (r =3D=3D &mpam_resctrl_controls[RDT_RESOURCE_L3].resctrl_=
res);=0A=
>  }=0A=
>  =0A=
>  int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable=
)=0A=
> @@ -185,6 +187,22 @@ static void resctrl_reset_task_closids(void)=0A=
>          read_unlock(&tasklist_lock);=0A=
>  }=0A=
>  =0A=
> +static void mpam_resctrl_monitor_sync_abmc_vals(struct rdt_resource *l3)=
=0A=
> +{=0A=
> +       l3->mon.num_mbm_cntrs =3D l3_num_allocated_mbwu;=0A=
> +       if (cdp_enabled)=0A=
> +               l3->mon.num_mbm_cntrs /=3D 2;=0A=
> +=0A=
> +       /*=0A=
> +        * Continue as normal even if there are zero counters to avoid gi=
ving=0A=
> +        * resctrl mixed messages.=0A=
> +        */=0A=
> +       l3->mon.mbm_cntr_assignable =3D true;=0A=
> +       l3->mon.mbm_assign_on_mkdir =3D true;=0A=
> +       l3->mon.mbm_cntr_configurable =3D false;=0A=
> +       l3->mon.mbm_cntr_assign_fixed =3D true;=0A=
> +}=0A=
> +=0A=
>  int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable=
)=0A=
>  {=0A=
>          u32 partid_i =3D RESCTRL_RESERVED_CLOSID, partid_d =3D RESCTRL_R=
ESERVED_CLOSID;=0A=
> @@ -236,6 +254,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_lev=
el rid, bool enable)=0A=
>          WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));=
=0A=
>  =0A=
>          resctrl_reset_task_closids();=0A=
> +       mpam_resctrl_monitor_sync_abmc_vals(l3);=0A=
=0A=
Why is ABMC supported by default when CDP is enabled?=0A=
=0A=
>          for_each_possible_cpu(cpu)=0A=
>                  mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);=0A=
> @@ -605,6 +624,9 @@ static bool class_has_usable_mbwu(struct mpam_class *=
class)=0A=
>          if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))=0A=
>                  return false;=0A=
>  =0A=
> +       if (!cprops->num_mbwu_mon)=0A=
> +               return false;=0A=
> +=0A=
>          return true;=0A=
>  }=0A=
>  =0A=
> @@ -933,6 +955,52 @@ static void mpam_resctrl_pick_mba(void)=0A=
>          }=0A=
>  }=0A=
>  =0A=
> +static void __free_mbwu_mon(struct mpam_class *class, int *array,=0A=
> +                           u16 num_mbwu_mon)=0A=
> +{=0A=
> +       for (int i =3D 0; i < num_mbwu_mon; i++) {=0A=
> +               if (array[i] < 0)=0A=
> +                       continue;=0A=
> +=0A=
> +               mpam_free_mbwu_mon(class, array[i]);=0A=
> +               array[i] =3D ~0;=0A=
> +       }=0A=
> +}=0A=
> +=0A=
> +static int __alloc_mbwu_mon(struct mpam_class *class, int *array,=0A=
> +                           u16 num_mbwu_mon)=0A=
> +{=0A=
> +       for (int i =3D 0; i < num_mbwu_mon; i++) {=0A=
> +               int mbwu_mon =3D mpam_alloc_mbwu_mon(class);=0A=
> +=0A=
> +               if (mbwu_mon < 0) {=0A=
> +                       __free_mbwu_mon(class, array, num_mbwu_mon);=0A=
> +                       return mbwu_mon;=0A=
> +               }=0A=
> +               array[i] =3D mbwu_mon;=0A=
> +       }=0A=
> +=0A=
> +       l3_num_allocated_mbwu =3D min(l3_num_allocated_mbwu, num_mbwu_mon=
);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
> +static int *__alloc_mbwu_array(struct mpam_class *class, u16 num_mbwu_mo=
n)=0A=
> +{=0A=
> +       int err;=0A=
> +       int *array __free(kfree) =3D kmalloc_objs(*array, num_mbwu_mon);=
=0A=
> +=0A=
> +       if (!array)=0A=
> +               return ERR_PTR(-ENOMEM);=0A=
> +=0A=
> +       memset(array, -1, num_mbwu_mon * sizeof(*array));=0A=
> +=0A=
> +       err =3D __alloc_mbwu_mon(class, array, num_mbwu_mon);=0A=
> +       if (err)=0A=
> +               return ERR_PTR(err);=0A=
> +       return_ptr(array);=0A=
> +}=0A=
> +=0A=
>  static void counter_update_class(enum resctrl_event_id evt_id,=0A=
>                                   struct mpam_class *class)=0A=
>  {=0A=
> @@ -1087,9 +1155,46 @@ static int mpam_resctrl_pick_domain_id(int cpu, st=
ruct mpam_component *comp)=0A=
>          return comp->comp_id;=0A=
>  }=0A=
>  =0A=
> +/*=0A=
> + * This must run after all event counters have been picked so that any f=
ree=0A=
> + * running counters have already been allocated.=0A=
> + */=0A=
> +static int mpam_resctrl_monitor_init_abmc(struct mpam_resctrl_mon *mon)=
=0A=
> +{=0A=
> +       struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESOU=
RCE_L3];=0A=
> +       struct rdt_resource *l3 =3D &res->resctrl_res;=0A=
> +       struct mpam_class *class =3D mon->class;=0A=
> +       u16 num_mbwu_mon;=0A=
> +       size_t num_rmid =3D resctrl_arch_system_num_rmid_idx();=0A=
> +=0A=
> +       if (mon->mbwu_idx_to_mon) {=0A=
> +               pr_debug("monitors free running\n");=0A=
> +               return 0;=0A=
> +       }=0A=
=0A=
ABMC is not supported under this condition. =0A=
Why does this condition conclude that there are enough monitors(monitors fr=
eee running)?=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=
=0A=
> +       int *rmid_array __free(kfree) =3D kmalloc_objs(*rmid_array, num_r=
mid);=0A=
> +=0A=
> +       if (!rmid_array) {=0A=
> +               pr_debug("Failed to allocate RMID array\n");=0A=
> +               return -ENOMEM;=0A=
> +       }=0A=
> +       memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));=0A=
> +=0A=
> +       num_mbwu_mon =3D class->props.num_mbwu_mon;=0A=
> +       mon->assigned_counters =3D __alloc_mbwu_array(mon->class, num_mbw=
u_mon);=0A=
> +       if (IS_ERR(mon->assigned_counters))=0A=
> +               return PTR_ERR(mon->assigned_counters);=0A=
> +       mon->mbwu_idx_to_mon =3D no_free_ptr(rmid_array);=0A=
> +=0A=
> +       mpam_resctrl_monitor_sync_abmc_vals(l3);=0A=
> +=0A=
> +       return 0;=0A=
> +}=0A=
> +=0A=
>  static int mpam_resctrl_monitor_init(struct mpam_resctrl_mon *mon,=0A=
>                                       enum resctrl_event_id type)=0A=
>  {=0A=
> +       int err =3D 0;=0A=
>          struct mpam_resctrl_res *res =3D &mpam_resctrl_controls[RDT_RESO=
URCE_L3];=0A=
>          struct rdt_resource *l3 =3D &res->resctrl_res;=0A=
>  =0A=
> @@ -1131,8 +1236,19 @@ static int mpam_resctrl_monitor_init(struct mpam_r=
esctrl_mon *mon,=0A=
>           */=0A=
>          l3->mon.num_rmid =3D resctrl_arch_system_num_rmid_idx();=0A=
>  =0A=
> -       if (resctrl_enable_mon_event(type, false, 0, NULL))=0A=
> -               l3->mon_capable =3D true;=0A=
> +       if (type =3D=3D QOS_L3_MBM_TOTAL_EVENT_ID) {=0A=
> +               err =3D mpam_resctrl_monitor_init_abmc(mon);=0A=
> +               if (err)=0A=
> +                       return err;=0A=
> +=0A=
> +               static_assert(MAX_EVT_CONFIG_BITS =3D=3D 0x7f);=0A=
> +               l3->mon.mbm_cfg_mask =3D MAX_EVT_CONFIG_BITS;=0A=
> +       }=0A=
> +=0A=
> +       if (!resctrl_enable_mon_event(type, false, 0, NULL))=0A=
> +               return -EINVAL;=0A=
> +=0A=
> +       l3->mon_capable =3D true;=0A=
>  =0A=
>          return 0;=0A=
>  }=0A=
> @@ -1695,6 +1811,17 @@ void mpam_resctrl_exit(void)=0A=
>          resctrl_exit();=0A=
>  }=0A=
>  =0A=
> +static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, stru=
ct mpam_class *class)=0A=
> +{=0A=
> +       u32 num_mbwu_mon =3D resctrl_arch_system_num_rmid_idx();=0A=
> +=0A=
> +       if (!mon->mbwu_idx_to_mon)=0A=
> +               return;=0A=
> +=0A=
> +       __free_mbwu_mon(class, mon->mbwu_idx_to_mon, num_mbwu_mon);=0A=
> +       mon->mbwu_idx_to_mon =3D NULL;=0A=
> +}=0A=
> +=0A=
>  /*=0A=
>   * The driver is detaching an MSC from this class, if resctrl was using =
it,=0A=
>   * pull on resctrl_exit().=0A=
> @@ -1717,6 +1844,8 @@ void mpam_resctrl_teardown_class(struct mpam_class =
*class)=0A=
>          for_each_mpam_resctrl_mon(mon, eventid) {=0A=
>                  if (mon->class =3D=3D class) {=0A=
>                          mon->class =3D NULL;=0A=
> +=0A=
> +                       mpam_resctrl_teardown_mon(mon, class);=0A=
>                          break;=0A=
>                  }=0A=
>          }=0A=
> --=0A=
> 2.43.0=0A=

