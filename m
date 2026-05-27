Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DFFCD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 00:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+89ICiJYeatLZfUkkqTjIHggC8cMvQtvsDFN01Md9F0=; b=nCwNSKYTj1FZNZL7MT33FAtWOx
	pZ8RWNWCN0HXNIE6FKg2ov7wxMVrMWwv38R1H8l+sOaehN6GTP7K/7jX16ZCXV718T0rKuKrhAUYT
	gr3JghmAUgC/foYg5zNVbaKYzIHQK/nRv96Db/+7BX9ckUmmYsEYkIP528peEhGBPiNY2Sa1+0DF8
	oYi+Ve1dS91mhQUwDmnn1gh3woLsfHTrrY8x6DE1LRnfPxSM8swa/Pzi+AAoGPG7cVK7wTQCgoXuE
	D03tSM+n/5e8VpFTpw3xyRtPaFtpbx7ShLkt7DMaqSbHsSXVe0GKTuQW9xwzLFeMpm2peVpapwp5d
	lKy6Nl1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS2Lk-000000035sV-2fJI;
	Wed, 27 May 2026 00:42:20 +0000
Received: from mail-japaneastazon11010067.outbound.protection.outlook.com ([52.101.229.67] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS2Li-000000035rq-2vF1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 00:42:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hr/b/xHbiphc8miXpHjjEBnMHMd8Gif1EeetysKoWLpGcUzricExowVe1fuuIeWeffZwRDWskS22rqpWDWTf+/o4jyuLwQ8xTFNHKcTkxp+bpTh1jZPfvJF7YSgOyHVBx/sQCkdRJyw00G1IwXYhFFWZeEKIi5zS7xOIdUJ+3sG+lvp4wWkFy3WIWldIGD33OVIdxl4aWbENB1iLsIveNdRkQUvMet3qEHWs5gKLJ78heB0x6oK6M74d5l09vbkOF4cgSQfkNAkyXFsd9TNgzb5CjxgJG5Vbzz6c8AqdLD+ZrX7gVebzc0vioVC2tR4VKTIULLvwY18qNJEU45S0Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+89ICiJYeatLZfUkkqTjIHggC8cMvQtvsDFN01Md9F0=;
 b=P9TCNTHQrPZlp0heLQINISbyOsB7UuagK3gfC+nhDnqiXes4Nviv+jTpfBfDivG7kiI04VtnSNV6xuTUpjNZLVz2SqYk6LebTHfbzHvd7qbY1LPmwtRw+qdNlFSMFUB3eUXVESp/PCVmTg3Db9kbwPboluJC2HIMWu7Apl4wXMTgRc+l66WIa7l4838XdB6wm/I8Z4T8RTP9cnOagG6NGH1MLIzXZChi224v9oO8qpmcj9T03Qp2wsr/vdSZgMYeVnZDhhZ6XumZmZm48n/ROJCC+oFCC5rhPAvm0fYKpseb/d9RNd/uIrtfFLMFXLVeFok0rbluulQhhduvoEvvUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+89ICiJYeatLZfUkkqTjIHggC8cMvQtvsDFN01Md9F0=;
 b=rjtWiRkUri5OleQAInDRd8Tz0vxYsf9wkxrcSq2PcItfn5bLTPPKksW7TlDhG9bU4tG0WwrcF/IxCHdaXHU37kWfLtMeCugkPkLGMg8+PvsQGuz5vw7HSbTiD0C3uJQYbAN69P6A6Ltdja3/4DnOWAsw3REJl7IoTx6lupeIHjZ8/ZAGGtLu2S1G0HiYOpgkOavicGhVW+0GqEeLsaiHoN7PUeU/cKFT7LP0DCjpWkO9QlOz0Nt1R1FJfpphLf4f2onUrh0aDzSnbWF82CNx8FV/toprq+nzC1GTtQEKXhAsPUWgvdBVyrf26W+LWjn6TvIxTTRxquS53ytuavvLqg==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by OSCPR01MB13615.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 00:42:04 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 00:42:04 +0000
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
	"jic23@kernel.org" <jic23@kernel.org>, "kobak@nvidia.com" <kobak@nvidia.com>,
	"lcherian@marvell.com" <lcherian@marvell.com>,
	"linux-arm-kernel@lists.infradead.org"
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
Subject: Re: [PATCH v4 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
Thread-Topic: [PATCH v4 0/5] arm_mpam: resctrl: Counter Assignment (ABMC)
Thread-Index: AQHc6J8qaadSY0QIiEmIjBolKhtX+LYhEboI
Date: Wed, 27 May 2026 00:42:04 +0000
Message-ID: <TY4PR01MB16930EBC1FFCB5C020D3969AE8B082@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20260520212458.1797221-1-ben.horgan@arm.com>
In-Reply-To: <20260520212458.1797221-1-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-05-27T00:42:04.122Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|OSCPR01MB13615:EE_
x-ms-office365-filtering-correlation-id: 0c7baf2d-d9fe-4612-837c-08debb88c61e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|1580799027|18002099003|22082099003|11063799006|56012099006;
x-microsoft-antispam-message-info: fT/o1fZCWitiTt0vL1wfHZJLg1BUn1NMWnwxQhfi4G/ZBDPTP37E+A2Eg4o0/VJ0iHmOaQifm5ee0TwbDDujCcZ1HxqRMhSlAjK/jIbPvfL8L/Q0INyvmMEZv80PBrBIwBgiLdKCowCdESkbQr5xUJmYTgGN5GGeN08cwhPUVdmdWUwvGt6/VhYXInodqy6NWuQGt9+J0ykKXi5nxw4A7WBcmzE08atAKFKpcqGIpFVpxXXOdiBuRc8H0qv8wnVnGOgbWAVQM3Y4L8k7krwSekSKen+NbctSbDyyba9WgeehiQ39aBn9N6zamqZ8y1R9HalhlUPpwA5rtjnnaearRluIhI5cr91bKtCqNCYva3UeuTOGKQ91L5ecwAfdCXsxqXCe2aqlQtz3/W/ay1mqeA5PvKvCkux8Kg6XhaW90p/8pS5AJQBtTJnUHfhUGx7B0y92+bmWeBXATAjA3Cs1AJM1JfcCmtYfPm0CDFBuzMZWftpOPFnpvSMxDzfXpWovFiUpAHXCWvJkwHRAq06IPJ2B1pl2ID8BjRZVYAu431XGHX5iLGjnPaODO70tBv3FXuayjI+qDFDsY7rwrdaneXBHcy73mYMDabkUfl6q/Lg56f1NtyHo5iN1wTHR6FT7UdbtgzmlYiL/tYztfQdQqZ3r5RC8DyJSdogvz7LqednwE4ciVPAbGtfMhYKnBcztWvakQwNESdBKRlvbh9vFYKSZ95XlQk4hE5q5TAxigDvGfWRxO4VogNfr9UQKMTfUOMj5dZrLBf7i8nyzOJrn2YvZM9V1FzRcQugK3kJkMmI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(1580799027)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?RGN0MlhSNXpYTWRUWnBERXRNeFJ3N0d5N2JFY1dNek1FQVpuSmY5ZFdp?=
 =?iso-2022-jp?B?SExMMlE5N1VWd3V3YklUUHJSamMxakFrRC9RUkY3bXJ2eGJSc3V6dE92?=
 =?iso-2022-jp?B?L0dGTlkyVEs5a1dXSnZwQzVmNzVhMEpXVVlrNUk1bCtQOXEvL1NqNWxN?=
 =?iso-2022-jp?B?T0xYaWxIL1NXY3I1bHpDdFJ4L0dWbVduT1VObGdkdWRBYmlOeVVWeFhG?=
 =?iso-2022-jp?B?U21lL3dJeTJxQzQ5cnBQSDJiVDBmK1FUeWs2VDl5MlltSWJYdU1rbEJF?=
 =?iso-2022-jp?B?WE5VWmtLQ2xqSVg4dDRDTFFjcFFySTVoYnk2a0hYUzJENE16Z3lVT3lF?=
 =?iso-2022-jp?B?MXBENEFRdWZzS1BTRVh6a1VqdGtDUWRtL0NxSFR5QVp2eXMrSno1Nmhn?=
 =?iso-2022-jp?B?cm0zT3V1MWVpS0lsYm5pRHRDREFoL0o4UDdZZFZRdG9velRFZHo3T3Bm?=
 =?iso-2022-jp?B?dVRFU2Z5VmhDWnpVa1l6SUtpNk0rdE9yNUZ2Ni9Ra1BsZEpmRm50bUI4?=
 =?iso-2022-jp?B?R3cvQVBvNTZBYkFGbkZwWEJmeDc5Kzl5YlhibGlCcjBpTmQ0Nk1wQ0di?=
 =?iso-2022-jp?B?cWJ0Qkk3UWJzdC9kNDZzaER2SHBMSU9kWHlSQWZBWURsUU9lTW9oUVl1?=
 =?iso-2022-jp?B?V3BkTG9VVlAvMmZhbUQ2ZnlkMGZ5WWxaei9wNFNEVUY5eUhYejBybU5L?=
 =?iso-2022-jp?B?bVA0OXJPQXZrRGRnY1BxSjZKWU1UaVcxVjdPL2UxZEY0aXVsYlphL1d6?=
 =?iso-2022-jp?B?SW50ZXNTWUZ0K3VuL2ZZVlBpS0VnbFo4ZWZzaDZ6ekJsSkYweFFOMnA4?=
 =?iso-2022-jp?B?b0pEN3hxTXBEWkVockptRlZpcXlPeFNSMFVYYzFJYzFzZUhVNFpSTGgr?=
 =?iso-2022-jp?B?dXd1UUJFU25SaWxKTWtocE1CODNsdHhWckR4SHFmR2FZaUdscEJ4VGwy?=
 =?iso-2022-jp?B?TzdRSVUyekFzZHExNU1ONzN1MFliS2tBN1Z3dHJ2cWpxR2w2QzJid25j?=
 =?iso-2022-jp?B?UmZTMEQxWDltL0RQcnpHUjNqQ2lMcGlMK2xyUEhJdzVPTE1ab3JTcnNK?=
 =?iso-2022-jp?B?Z0l5SGJXVlFvOHNKNXlEc2VUQkFTL3BNRFRpSDI2ZnpvejNvN3V2Y3FF?=
 =?iso-2022-jp?B?d3psUWFXMFNyR2JIQ3lKTzE3ZThGUWNKUFRkd3d2cEZ6cGxySFRic21y?=
 =?iso-2022-jp?B?RDRJQkFJY1NGWFFmc0JvNjlsQmtqdTJYWWs0Q1pGS0dnMEhwTm9zUXdC?=
 =?iso-2022-jp?B?SDhzYURuTDRFOFl4Zm01Y3N0ZDdWUHdJYytVOFNGdXZHZk40YkgzL2Fl?=
 =?iso-2022-jp?B?aUdTZWgyUkR4UDJPV0JOdVA3MURkWi8zVFBXbTNyZ1FoWFpJL2J5V2xN?=
 =?iso-2022-jp?B?RnRzYm0xelF3TDNWNlk2RzhlU0RCbnRXdjZid0dwWGx5NUZ6cUM1UTRm?=
 =?iso-2022-jp?B?bzN0WU13Y05qVGdUVnJjKzBsWmNkbUIrbU9DdDB5V1FXTkJONUJ2NG9n?=
 =?iso-2022-jp?B?UG56ejdlZUxpZFU3OUJQeUtYcFhjZ1pLclAxSWJVMU05WkpXSTl0MXdD?=
 =?iso-2022-jp?B?SWVMT2taSEgvNFhpSVFWZnExSHVuS3I3STVneTNGQy9mWnN6dFh5Y0Jq?=
 =?iso-2022-jp?B?cW9GY2ozbzF2M2doSVRZeUNRV2toVXRadzV3T09oT2tTMGsvTnZEc2ZR?=
 =?iso-2022-jp?B?bllyUkNFYmRaWjg2M2ZnZ0NHZnJtRVk3dGdzQUd1dkxSYVNlTis4OXha?=
 =?iso-2022-jp?B?MTB0WVJ4OElrZ3hMTFdET0hCV1kwSnRLMDRrTnVYNER0ekcralVhaUN4?=
 =?iso-2022-jp?B?VFIwMkNnaGliSGJlNWI4bEZXWVVvZlRLNzdiWVhVNDlXV0dtd0IwamtG?=
 =?iso-2022-jp?B?Wm41ZjhQcVQvS25aTlhWS2xWbDBHZytjRFZrRWdpUGNsOTl3UW91U0dw?=
 =?iso-2022-jp?B?N0V1OFM3UTdhaUhDRDNpSFhna3dUeEZvOXE2MzBEZUxrK2w3QW1iNzBZ?=
 =?iso-2022-jp?B?T1E1NHlqK1dWR1M4MWpHZnRFT2xUdVh5b1JpQ3E4bm00b1lqVFFBazUr?=
 =?iso-2022-jp?B?ZlNxVUNFank2UExlaVlLNmVuMGdwQW8xU0JUbUo2TTRWeTBpUVJYdGxC?=
 =?iso-2022-jp?B?UjlsbTlrN29IK0swbktmSDdSajF6TnA1SkFRWC9KZERJUFRGT1FCZnZz?=
 =?iso-2022-jp?B?Qm80Yk9LaU9jV0NXc3dERnhxN2pJM011SjRURXRnT0oyUmN3UTBmSG9s?=
 =?iso-2022-jp?B?U0hoSUVFZHFGY3pKeTl4ZDkwYTlJWFU5Y1JiWDM0TDFQcVpkczlmUTNn?=
 =?iso-2022-jp?B?VXdNZlBQVGhlSjFPcVluN09qNGNOb0thdTVJTmQ5SXJlemZWRVZHUE5F?=
 =?iso-2022-jp?B?TTJMZ1dzUlBIMVRyam01OTRkYWtmbFp1d3ptRlBkVzk1L2JZNktRRDBW?=
 =?iso-2022-jp?B?Rm9xbFErM0llYko2M0JMa3g1VlJFRU9hSEZqUjcxZGRZcUU4NWh3RnE4?=
 =?iso-2022-jp?B?OVpKQUtBWndYamFGdFRoWkdtdS91SmpMbmtqZz09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eRjKN0hoCFgMCT8Q5RAMnI+tWwuVHAHm8YWaZ0njdLmcsPaBIB3Wx0LgUKWvKtK1fxuEUPFiA+xQfQIxqAgvht0svBIjh9kDukgo9n5YyufnuNua6MUEefXEA/9g4VAbiWvThuaSrElIj2YiDN0L6ug9AuPKuL2JmKQX2Fkj9sRp7gsIwmzEmWsEEq8oUyZq4A52jKn3iy0l/5Aku5LzLXus2R0SOkHlhXubfl9LBW5BHmcgP6CuKgBWuygBT7y3tWMpAHl9rTSIA4e24AnJbrpJ0TLAfT2oP6hDavvYPK1JIDqbSba+BhfXWatRCSsvUekCMw8n1TgSgeXA+zOl2w==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7baf2d-d9fe-4612-837c-08debb88c61e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 00:42:04.6695
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9HphB14lJFRw1rREjcOiWChkXqJsIm1SapYm12MvHfK5wenzODZFTq6zoqFFQWW0GN6qKMEGSN6dQ4hE9gw7sww90O20MuZpDpCdmYygn2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_174218_964988_76AACCA2 
X-CRM114-Status: UNSURE (   5.04  )
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

Hello Ben,=0A=
=0A=
It looks fine to me.=0A=
I retested this patch series and there is no problem.=0A=
=0A=
Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>=0A=
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=

