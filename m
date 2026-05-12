Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BA1CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12E/nEK+7mbXhsjCxsXyyHjKwkcXcTuczAkvJhNNoA8=; b=jHY9XKpv+SYhZJkxFRY+xYTXie
	7f+udvbw+QW6153TbQ5d8kIJ/DdRwhpAJvrfqRHN8bODHnpU0oqLBWhqQd3NHYS8flrB0mVfw7OrR
	E/voZqg4ixEjZvatO+hTLKe/E1eJWoSbsZXHGGbEUVKnL8nFeYd9DARP7xQvAGlZ+kxS4Vcw7lUf1
	bOxFJ727G0/Na2fXD9VbxnurxTt7ze3KQkZMQRcvWnblTjObP4hWDaHkNIaV/iYHw1IIIq5lCgQ0m
	tvtbXV/J3X+UgIoHXlmclWjSeQL96ilb00NY2Yw8JwUEFzpl1r+soHIygeBsFefCnkOluwCHLfEWR
	zK0Y8uBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhM9-0000000FtSo-1eC9;
	Tue, 12 May 2026 07:16:41 +0000
Received: from mail-japaneastazon11010011.outbound.protection.outlook.com ([52.101.229.11] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhM7-0000000FtSO-2LZp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:16:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yNO1aEWC3dNAvQBeKcLbzizo8a9EB+Why+AU+ZR/Zx5PRdIdBd8Y29MIP/p5gmj420C/ofuoG5mcJ6/5movWIrJwAn1NR8BPY1n9iD3iPFeydqZYCbazok5tTzDbxWNFHguPG/nj4u/LGLUVWU7mituBaC5bbIq/4+BI1OZd6V+OZ+cMBPbFwOtRxOB8WlIbidBIueyZ0O7923zrJq/6x5fMOAIKX8XUPUfXtbF/LiBi/r9YGc5u+j4rI6jfP5h9gmh/vawvrICnzwCf3VcYZCPNu8mDE8B2dbstVLmkOGbqxlvLjwjuAhOWAS8Fw4zfkbM966aTLVEp3DGRi+i2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12E/nEK+7mbXhsjCxsXyyHjKwkcXcTuczAkvJhNNoA8=;
 b=GAhPoOw8QxW8v4nZ7d6a2Bf6Nx+aVrk2NATdxttnIN6mf0WC0kKmf3L5klVe52eqGfz0XhY2raFblJMQkCEPNsxbs8OjQL95MKylif3PI+MOJhSwLxyN21oklQzoN/U59TmK3xZzohEA3YDA4lyhPKF/VvMAtZXE4YlgnN1AvBRRgoZcPUJXVNkkErstHkI3OKCLgN00dDJ/V8WBDcxJB9DN9frfryBfcHCGVS7eAglxko8u8bXE0GzF9T5sigXM+7K0qIAsPQ8BFjyMHkaziOb4+E9ryMu55epmhcyfvETbnVx+B0Afsuudum0cBtltLRh1IRZRseUFY1tlUPfxkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12E/nEK+7mbXhsjCxsXyyHjKwkcXcTuczAkvJhNNoA8=;
 b=TGxI36MFryPggJhw9dO+Ld57D3bkzWHHbO02SPr9xaYFYCjVmmRas2g27vtGjRLRhRRvRbFHtmklDiChMB01Ji62opGrzghAkTqR0leQjGSJQxzGKZyZ5ALDwmprZY7V5KXeU8zt/aDGBMo8Yzbw95UGgF2oTlX3OqiNj/gvEnN3Bzbe9AEWymx2FxDneth34zQhwB4hmX8tab+xBvX+bo3EHLkLgNPpN6T6RXLYgt8hxoEMtImqGkGQOzYML0/MtF1Wv/nmVounb/cVmVwPrMt5Dh+FgyYUhN6/0fGRRT+k5lmg5zG7e8vBVpbnumr1JrFgcONzbR2ok6FNabyc9g==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by OS3PR01MB8811.jpnprd01.prod.outlook.com
 (2603:1096:604:155::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 07:16:32 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 07:16:31 +0000
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
Subject: Re: [PATCH v3 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
Thread-Topic: [PATCH v3 2/5] arm_mpam: resctrl: Pre-allocate assignable
 monitors
Thread-Index: AQHc4Vy7yTuhcgmBr06+mbvvjgLOl7YJ+1kH
Date: Tue, 12 May 2026 07:16:31 +0000
Message-ID: <TY4PR01MB1693081CFF2DCB47DA4C2F9C38B392@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20260511154147.557481-1-ben.horgan@arm.com>
 <20260511154147.557481-3-ben.horgan@arm.com>
In-Reply-To: <20260511154147.557481-3-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-05-12T07:16:31.473Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|OS3PR01MB8811:EE_
x-ms-office365-filtering-correlation-id: 719eec89-3721-4953-6cd0-08deaff664b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|18002099003|22082099003|38070700021|1580799027|56012099003|11063799003;
x-microsoft-antispam-message-info: 9y06NsTwxXyaRqWPdOTc0d7qrwnBqWBsJEN5Jtto/c0rze61SW5huk+z63LDDkXZPwEptVq+DpM8aQTO3KvXzTp5b+oTrof+zvza7m4Hugon44OGy/Mvgb1o1NFLuJH8+iRmIQKAWOb1eJYrHgIqeH+oCx1C/GZMGxW/Qyg9s4FRHyb3T56FnmztuYaftpbOlcpyt55cOw9IKCPwHzNO9ZxTf3aoyx3pUi+YSiLE+PvOWo3eGhIQk1TkJ8dtVYFrWqfUhNWp6JLMeNvcWWSwBOZs7Ofk6wA06s6zr3t1QCwH9RmGmT4PF+Olhy0sXAoMFiePsn6/B5TWpCLL28hmEXg6a4acmOwpFMuWNBwCN/QWm2+qFdmvjlQytRmtjAVslumqrXIlZ46KSTYyoK8kXdpY1HWm6aNjcCl6poWomceMJu/HC6+WgmA1wKO3tZr3NaYgCvYM/alUmLF87FUO63hobfPprYhuJMPdH8xoG9+NmW01GlD4qox1kM/Iuj5Rtl8yWu6DwBf18RQdNGijrXofg4KEC7ICAFTzJXhOREC9Fci+Em6IhbhTufap+sMNpttkA9c9k2mk/9u8DLIt27Xbo6JIgKn+D3LrivwXcLsaM77jY6P0faBxmver/2NRUw6dPvtsSkdg24Y+oVsc3YQLrrwgU/Jx/F4QmVdNSuYoFMRig9BVJOifMbMvhTbigKcciJAwxqUx+wxL1ptjqWSP0XfHxef/BnjwzajiYZZbd8r1N9IuN0ppqnAhQu34ltprLhIzQ3iZc6Xh0D6DIA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(1580799027)(56012099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?eHdxaEh4cDl6bHBKUzdPdGs4VlhwR2xvTnJheDUxQ2l5VnRLR0FyNW15?=
 =?iso-2022-jp?B?Q1MzUEhpQ2hEcHc5OUtPNDlxL085bUdiS2xXbElTNUVqUDl5ZDljSFRU?=
 =?iso-2022-jp?B?QktKL1NwaGNvQXcydVlmNEJUcUdJbDJOVnJJVWRuQkVtYklmUjZ3NjZ3?=
 =?iso-2022-jp?B?cjdXWTZEMkFUcnZvM1VLR1BaQlpVOHlrN1hLMEE4VWpZeHBRRjR2OENx?=
 =?iso-2022-jp?B?eHl1NkJ4Y05TWkQ2R1pkbGU0dXNydk83bzRuN2g3UDNwbWVrSVNCUnps?=
 =?iso-2022-jp?B?VmRiZi95WjNyeG5aRmVzc0ZMT3A0YzZlL0dORDNqSkVlTkltTzBkdUFC?=
 =?iso-2022-jp?B?dElpWHdyc1JRNnB2YldaTWJNWFJ4RFVENlBFVXppdVhkeGdEV0R1ZmNM?=
 =?iso-2022-jp?B?dXN1RWY1cElPWDk0aFFLK3haRjZyZ2JMUklwMmpuaTZVNVA2L25xSFBO?=
 =?iso-2022-jp?B?ZFhzTEU4TWE3TXpaOXFacEJ6RGl0aUpZMzhYdDhQL0pMbVlpZ0dPdHdC?=
 =?iso-2022-jp?B?NTJCTjExYzFwQytxY2szc2JtVmpqVzVzd242WFVFbWlZY0EvN1hkd3F2?=
 =?iso-2022-jp?B?Y2RkTTNWQXExNW5HeFVHV2o2ekI0WTN6TDFQbGRqRExEQWR5eFhXeHVY?=
 =?iso-2022-jp?B?T3BESE8rbDNLdzBmSGJvVmlYa3dOU2hJZzEyR0M1dzJqdWQ3ZHdhNEs5?=
 =?iso-2022-jp?B?aEYySGRrRk9JRW5SdGRnWElEUndTdGZPZHJJekY3RzdjK0I0bDQvaHB4?=
 =?iso-2022-jp?B?UUQybFhpLy9VbGdxOXc3eFJFZ3BadndPcmY2VW5Jb3lJaCtUMVQzS3lM?=
 =?iso-2022-jp?B?ZlNHeFRGQThRK25aaWxJZXpOemJDZFdhV3NDSXRHR0JvRWx1dDdqdEVX?=
 =?iso-2022-jp?B?N1ZCWDFtcTBJd3RoYVl4N2FRRk42RXRRT3RTOVRZZlZZV1N6bk9CTk9Y?=
 =?iso-2022-jp?B?QUVYaXIrb0l4Z1lNRjVweTRmb21Qd2xLbjJLT1BBMUVtaTFDR1hPT0Nx?=
 =?iso-2022-jp?B?Z1lDQk1UeHRDTFk1VDF2ZTZoL3lsVXMwSnNsQkxhSGhoTU1kTjZ6TGw2?=
 =?iso-2022-jp?B?Y1lGUFJnVU5ObEpLVlVzcUJ2cVJPeHJSMEtkYThTK0VqYWM0Q1JuYzBG?=
 =?iso-2022-jp?B?NDE0Zi9GcThSRnZncVFVNkFPUVdkOUZZTHovaU9tODZBOTZJQ3M4endG?=
 =?iso-2022-jp?B?OVFMK1p4dHk4eDhOYmR6a0Z6SFhsbStpRG96SW01MzVobmtaczZhQysv?=
 =?iso-2022-jp?B?cGhxWi9OL00xdmZ3ZG04WUUyRitrU0ozbTJoK2YySWdXSHhpSXZPNUU1?=
 =?iso-2022-jp?B?cDJlMSsyVzUvUFMvcStSdzhveWh0cENSdm9nMFRUM0pteTIwYlhoQlN6?=
 =?iso-2022-jp?B?MmExRW9KTjFPQ1pmZzhpRVJyRUcyVUo2MmZlU1R3WC96MXRvdVpsYzRx?=
 =?iso-2022-jp?B?bmNINUwzSXZTOU9UczRHWjg2emRyMHFVUHJ2RnhReVkrSitnMTJSSitL?=
 =?iso-2022-jp?B?UUZ4TjlnZ3Q3UEM5aHVteUVyR0xIYTFrRE9TaUZpR0RheHU0V2JCOFlQ?=
 =?iso-2022-jp?B?d2ZpTUc0dmZvSnREdE15QlA2bVhDQTRHTTJPd2lvaWd0OTdNNCtacU0r?=
 =?iso-2022-jp?B?TmIxdXFlOTUrdDE4T3JKYWF4RjFHV2s3emdCWGZkNko5NjBwb1lEWlh2?=
 =?iso-2022-jp?B?VHFXYWthS2NuMUxBdW5sNjBobzV5dTNBVmxYcDZ6ZytSRW9sOXlQOGln?=
 =?iso-2022-jp?B?UXRiS0JqUU9UU08zRVlQUUFKQmx3a3o4UzhrUUh3eUpqeVE5aTRaalg3?=
 =?iso-2022-jp?B?Y1ZHaWVpL1JaaFJZbTFpTWcveHBPcEhPbzYzeE1SbnVtUys2aUhaRXc4?=
 =?iso-2022-jp?B?b3czMnVPQmZ0WVEyZ0Z2VHdGd2Q2SHJrZ0YranFaN0c5NmRUd2U3UTA2?=
 =?iso-2022-jp?B?MVdZZGRob3RJWTlVcVk5QWE3aUQ3K3ZRcWVFOXMzVmNXMGdFMUZCdUN4?=
 =?iso-2022-jp?B?STFua0Q5bXgwOHZWSzVJUDNRTXgySjZYZjQxMmFuajNvbkJYWGM1S3B5?=
 =?iso-2022-jp?B?LzBET0hBUnZHWHh1eDdLYkQvSFpWOFlPRmpZbm03RG13VGYxb2lORjlC?=
 =?iso-2022-jp?B?eEZoMXIyaVZaTkIrK09GRW1FSk9Idlh1S0JRYWpZZmlMUDFnMElMS0Jq?=
 =?iso-2022-jp?B?RFJidzI5MUd0VWg5VzZJQUlxWDhEd3FJL1N2K2NiMXVUUkN2L3IxQWla?=
 =?iso-2022-jp?B?MkdkNHBLYzVGWlN1ODRpRlIzckVBUjJXMVBZS2poU0tFTTdhM3Y0MHZs?=
 =?iso-2022-jp?B?eG9LVlpQeDU0MVlKeWJ5dXZBU2pkd1pOSkJpZWNiK2ZSS2E5dVZxNlYw?=
 =?iso-2022-jp?B?N05KSmtOaTRnSVhBTjZRZ3c1V293a0dnOVpjbHF5TkFWTmZyU21HS1NQ?=
 =?iso-2022-jp?B?RnB4QWhIUEVzdlc5MEcrdTJ3S3RZR1huNzh6OFAxWjBCZ3drWCtIcWhs?=
 =?iso-2022-jp?B?TzVhcWtYVlArRkRKV3duUDhtVzVpR1NMNTRudz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dJcJm5Wdk/eDrloCpEtG9kJkY81fj8D0sYRzPlhPxXZtwac5GbvwA8K407cXF09vPVz87Ea52cWH8mhiLnlqApyte2SVNezwftNiW51gjMXTntrH5PxPtAmiR3U66H2n2MySVOVVxC4wUZ2es1RvJheeLM/p0fksesh6e6YHtOqzgWhhWHuSfKmKdGg3SleM+/C1PFMWdd6q/u0whvAnw9hCWrlj0nTeuJyXmwRCzEowZiRyDMtSRlHnOrw+eBLrA9EP5wPmH/KuogtxUOtfx9nhgqa3bgojbswI9VjbZlj+dnbAxZ2QMJCXg3Dq5tLtkkEVn3DXwOGJ0NPjcWbtKg==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719eec89-3721-4953-6cd0-08deaff664b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2026 07:16:31.9234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NeTKyrH4JgbQbO4Zit0fBL1ggS/LXigp1l9sVc8vV9lsngNNiD6aBAu8J1OVddYWw26MS+dq8AjwNX/h1CJAPOcF9MPXKB3hfqXV1cui4JA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_001639_715248_5B87E199 
X-CRM114-Status: GOOD (  20.56  )
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
=0A=
> MPAM is able to emulate ABMC, i.e. mbm_event mode, by making memory=0A=
> bandwidth monitors assignable. Rather than supporting the 'default'=0A=
> mbm_assign_mode always use 'mbm_event' mode even if there are sufficient=
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
> =0A=
> Changes since rfc v2:=0A=
> Don't set mon->assigned_counters to an error pointer=0A=
> Fix mpam_resctrl_teardown_mon()=0A=
> Remove free running check=0A=
> Separate cleanup allocations, e.g. __free(), from the rest=0A=
> Restrict scope on err in mpam_resctrl_monitor_init()=0A=
> ---=0A=
>  drivers/resctrl/mpam_internal.h |   6 +-=0A=
>  drivers/resctrl/mpam_resctrl.c  | 138 +++++++++++++++++++++++++++++++-=
=0A=
>  2 files changed, 140 insertions(+), 4 deletions(-)=0A=
> =0A=
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_inter=
nal.h=0A=
> index 1914aefdcba9..7a166b395b5a 100644=0A=
> --- a/drivers/resctrl/mpam_internal.h=0A=
> +++ b/drivers/resctrl/mpam_internal.h=0A=
> @@ -411,7 +411,11 @@ struct mpam_resctrl_res {=0A=
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
> index f70fa65d39e4..cba295621f56 100644=0A=
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
> @@ -244,6 +262,7 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_lev=
el rid, bool enable)=0A=
>          WRITE_ONCE(arm64_mpam_global_default, mpam_get_regval(current));=
=0A=
>  =0A=
>          resctrl_reset_task_closids();=0A=
> +       mpam_resctrl_monitor_sync_abmc_vals(l3);=0A=
>  =0A=
>          for_each_possible_cpu(cpu)=0A=
>                  mpam_set_cpu_defaults(cpu, partid_d, partid_i, 0, 0);=0A=
> @@ -613,6 +632,9 @@ static bool class_has_usable_mbwu(struct mpam_class *=
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
> @@ -935,6 +957,52 @@ static void mpam_resctrl_pick_mba(void)=0A=
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
> +=0A=
> +       int *array __free(kfree) =3D kmalloc_objs(*array, num_mbwu_mon);=
=0A=
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
> @@ -1089,6 +1157,38 @@ static int mpam_resctrl_pick_domain_id(int cpu, st=
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
> +       int *cntrs;=0A=
=0A=
Wouldn't a reverse tree format be better?=0A=
=0A=
> +       int *rmid_array __free(kfree) =3D kmalloc_objs(*rmid_array, num_r=
mid);=0A=
> +       if (!rmid_array) {=0A=
> +               pr_debug("Failed to allocate RMID array\n");=0A=
> +               return -ENOMEM;=0A=
> +       }=0A=
> +       memset(rmid_array, -1, num_rmid * sizeof(*rmid_array));=0A=
> +=0A=
> +       num_mbwu_mon =3D class->props.num_mbwu_mon;=0A=
> +       cntrs =3D __alloc_mbwu_array(mon->class, num_mbwu_mon);=0A=
> +       if (IS_ERR(cntrs))=0A=
> +               return PTR_ERR(cntrs);=0A=
> +       mon->assigned_counters =3D cntrs;=0A=
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
> @@ -1133,8 +1233,21 @@ static int mpam_resctrl_monitor_init(struct mpam_r=
esctrl_mon *mon,=0A=
>           */=0A=
>          l3->mon.num_rmid =3D resctrl_arch_system_num_rmid_idx();=0A=
>  =0A=
> -       if (resctrl_enable_mon_event(type, false, 0, NULL))=0A=
> -               l3->mon_capable =3D true;=0A=
> +       if (type =3D=3D QOS_L3_MBM_TOTAL_EVENT_ID) {=0A=
> +               int err;=0A=
> +=0A=
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
> @@ -1697,6 +1810,23 @@ void mpam_resctrl_exit(void)=0A=
>          resctrl_exit();=0A=
>  }=0A=
>  =0A=
> +static void mpam_resctrl_teardown_mon(struct mpam_resctrl_mon *mon, stru=
ct mpam_class *class)=0A=
> +{=0A=
> +       u32 num_mbwu_mon =3D l3_num_allocated_mbwu;=0A=
> +=0A=
> +       if (mon->mbwu_idx_to_mon)=0A=
> +               return;=0A=
=0A=
 Isn't it 'if (mon->mbwu_idx_to_mon =3D=3D NULL)' ?=0A=
 =0A=
 =0A=
 Best regards,=0A=
 Shaopeng TAN=0A=
=0A=
> +       if (mon->assigned_counters) {=0A=
> +               __free_mbwu_mon(class, mon->assigned_counters, num_mbwu_m=
on);=0A=
> +               kfree(mon->assigned_counters);=0A=
> +               mon->assigned_counters =3D NULL;=0A=
> +       }=0A=
> +=0A=
> +       kfree(mon->mbwu_idx_to_mon);=0A=
> +       mon->mbwu_idx_to_mon =3D NULL;=0A=
> +}=0A=
> +=0A=
>  /*=0A=
>   * The driver is detaching an MSC from this class, if resctrl was using =
it,=0A=
>   * pull on resctrl_exit().=0A=
> @@ -1719,6 +1849,8 @@ void mpam_resctrl_teardown_class(struct mpam_class =
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

