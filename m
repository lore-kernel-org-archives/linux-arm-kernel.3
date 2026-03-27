Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A26710A62FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 02:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wDE9MWjBADaMQGtwoIaLVnekCADsFP/kV+fSOnaeuM=; b=rJNuSMHCShWe4CKBhTVwjDAnCb
	RH/haee0Fkfa8ALCtwBZN354jHn1TXaAkFvAB0HelWt0K1W0WJU9kAiUMumn2PmYr5x4M91QG8pHm
	LRHzuWyQ9GbvxGK7faVaCZNAOCf1i+Iid6C4ZfvyumA6aNL1UgRh+eFjeJe7mGXQ8qWzGFcZltnPO
	1pcB4RqtyX9WELQaz/Uc2KOA0qo9MJT2pJEmeUJCEjqGJ9kv6u5h+TTK/XhNSoUhLDsudaQqJB57I
	A/7jEfwnSjqu2TrQ2q38hCLV4Kc3sedp1dDESy8FVWONTN0I6F4L4dERGnr1teauueNhzVrc3kTeW
	cx0l/3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xK6-00000006Zyw-2qJ2;
	Fri, 27 Mar 2026 02:53:22 +0000
Received: from mail-japanwestazon11011041.outbound.protection.outlook.com ([40.107.74.41] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5xK4-00000006ZyD-2Jmr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 02:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aox/eEGLDjaJgoOiBmlLGFM6Co69ziK3ct5O7HEup6UGBOJE7DvrjLLOyUlkkGu6jRbf+ID362DV4zN/nYozjavpurd+MJnq4+whf2BTBM1icFpLqkZ9fTvk04ZSio29C5/ToNfsxq5zBAdjJGPunvD4Lz1Tg8ALLCfhvkaTaUASfUPOOFCc7tTymFM09RjhA1QHHR4xeOkaAVOGyLbzkxrmw2Wb1ERRPWV3o4a5BmMYj7ktmppxfn0xWG9KpmH1sAVgny73nj/kkqf8yRS+SGlnjTR6NpCBps0i5yJJZhm+4wcA8rRAyXV/P9wprrA0ricdcUhSnycFO/HWjmSkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wDE9MWjBADaMQGtwoIaLVnekCADsFP/kV+fSOnaeuM=;
 b=x8yJ/K63uOeVtBOTxHfkJoeCqGQr418ZoJ7kmJ9gsW5Q+Z41Am+vjnP0+nhuC0OH4nj9rTLdnBz80oe2Ct32h/dosEFVyIPhch/Xcze2RuPE1L2+Xk52TKUHUfpI6wKKYG40arxp1etRwN8Bs6LEsTkHKP6jblsHbk8rsfXStnb2WHYc7crkdOx6YPAT1RlAcAhU2NUMFWP1kFm8twfq3pfxfV1+5dfN+TvtLJtvOdxF+LZoLWfygHbNylYpbS0DK/24dC2XL+rVlSoTAQPLyqOCXG8ZpvRMhC4O/tkthi0oezPGIkvykow01xm1RGSumnaGEGX0dnTJXQTzbYWSVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wDE9MWjBADaMQGtwoIaLVnekCADsFP/kV+fSOnaeuM=;
 b=NJTxWQ4AsTUloblxGqKops71kgrVRK9cg3nML0paLhv3r6oUnBjp8luqikBehri1YtQbc7BbuG4gHzYlet+Wi6Wh7lWkqcoHvuHq9WofaofiQTxRsR+mEk8L39UbB0HnRTHNYSPdavfZCtEhl0qxX0MmbxNK2Kj85gB+7ebJ4ec7gWvqmTBob8QpPNEWoo1quPqBftEhzvSOCkNMsikaF+o1xh4Xa1P3/jZJYWsPrHNcopwx8C8chZFJeL9APb1McR72sd0LoTljocHs7DGqLCwq5sqQnofPmt2Qtc5YHsyVPquX2V1iQOcuvfa6EdvWACvDSB+Ye19V4eYOTzY+sQ==
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 (2603:1096:405:338::19) by TYVPR01MB10767.jpnprd01.prod.outlook.com
 (2603:1096:400:298::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 02:53:12 +0000
Received: from TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957]) by TY4PR01MB16930.jpnprd01.prod.outlook.com
 ([fe80::38bc:7870:6f23:a957%4]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 02:53:11 +0000
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
Subject: Re: [RFC PATCH v2 1/5] arm_mpam: resctrl: Pick classes for use as mbm
 counters
Thread-Topic: [RFC PATCH v2 1/5] arm_mpam: resctrl: Pick classes for use as
 mbm counters
Thread-Index: AQHct8FDWs29BJzPHEOnyJQZPDb11LXBuFUV
Date: Fri, 27 Mar 2026 02:53:11 +0000
Message-ID: <TY4PR01MB169309AB957008DE0FCA442F18B57A@TY4PR01MB16930.jpnprd01.prod.outlook.com>
References: <20260319165540.381410-1-ben.horgan@arm.com>
 <20260319165540.381410-2-ben.horgan@arm.com>
In-Reply-To: <20260319165540.381410-2-ben.horgan@arm.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-03-27T02:53:10.996Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB16930:EE_|TYVPR01MB10767:EE_
x-ms-office365-filtering-correlation-id: 824e129b-449e-4106-5fff-08de8babfbf8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|1580799027|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: SU38MMbkHaM+isRKVAQ9WwCytaPsof6iXqAtL4UHky4uABrl/V/ziIzlSayLTfFPAUyaMaejvXhusPEoJE/+lp+P37u9yaVeTPXq0QYhVgqkFApszsEtqzaL3akibibFNhTy3qEXwgU/v72R9D+UOPgF8fbMUcYKzxo/X0ThIBC5J2Y86uYwZWIkR0iRp/UaWUeu+/9fOLCPVNFUlqkRdoj+pim88P1i9bVvYGAFIDVkazmadyEizzMMM665wREEiK7eE4hjOhjgIvHGwaCm18ly9n6cZYjehB/EodkMyaBbVedHghnlR/Yp51etUHKcG4HIMzBhMxMjfHiACLm5p2XmzS1GZS+SL/iqKxVjT/pmTD8CTC5X8uBVztOoFqQrZAJCwlIwHwtGR9cxeZci3Enp6gw7kF0JQDsJ3pD1uLkYMpB95zvwe1xufeOhw6ZUpm3/Cb3U0d8ocXDVlVttTV3Uv0iFwmuqG0iC6Qu9mQb01D1Zbu1hW2i7o7FS5YsQzX5ZtfwBUs93kImCB/DSN+PlaigFKN6pa6lEj1XHDGkUdLlTHVj2UQJf1qJtSxJGI35sI3Wy88xxdeBkS04dDP47Bo+uXWAVxRmNjxgWlPJy09h+Zc82Rb9i3Spkg7slcuQxHYWzFKymmZAORe5HARUyCVOk5hp/5k3mY4O/0WDSmGqzeaZcsIJbR0l7vSJoOqegeyFdiZRI94E6ABAifvdODUFKud/S0J1GTUP139i62NT+qEuuxqL9O/KMwGLCJTjLqAzK2UjvnhSym2XnyYnerBjcPay++3PBaUokyX2xVtOWlbfSS2piOB5mT8zc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB16930.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(1580799027)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?b212RUpzM0FlSGVZVGNUcENVbFlTSW9CSWs4M0NPbXdYSkpXNDBGQ0Ri?=
 =?iso-2022-jp?B?RnRwWDBSa2pFd0ZjRWYwb28rRHQ1anpRRDFTY0FNM0ZOOVI0SDVxUjZi?=
 =?iso-2022-jp?B?VUQrTmo1Tlhmd1dhRlJlaE00OE9YVVpUanpyaHh0eUJIZkQxRFRFT0w2?=
 =?iso-2022-jp?B?S3hkSW1jdlRYYjV2cXI0MnhVSVFGelFEckVhdWhySUlVd0xUUWpNcW5F?=
 =?iso-2022-jp?B?ekx0d08xRkJvdEw4TWZKb1psbFRySlpTdWp4YzZaWlNpcDVBQWV6OXhQ?=
 =?iso-2022-jp?B?NHBGQkZPbEdiM0NmQldpV1ZEckxjdEh5NEdVRXA2NDZkTDJ5R21EMml0?=
 =?iso-2022-jp?B?aWdSdjBrTmJMUEFublZ3VDZtTmFNQWhPK2R1SGpnMkZ4bDI2TnUvNXVu?=
 =?iso-2022-jp?B?VXJ1NmcwU3VwWFZYOEl4aVFodDdad3lsMlJIbG9DbHpnck55WFFUQUVo?=
 =?iso-2022-jp?B?c1JkczB0d0dPOVFLUG8ycFdLbU1zWUxxMGZqeXd0OCtrOUhvcnhLYU9m?=
 =?iso-2022-jp?B?SW5SaDcxZ3dmY04rWVNVL1JVbWFiUTB2eiszUmREdndOQktvalpmWUdQ?=
 =?iso-2022-jp?B?LzlTNFRkT1hqUE9VSDVZWHhvNlUzREl1eGNKMDFGNktudnFrZlVPUnhQ?=
 =?iso-2022-jp?B?cUcvVlR4WTNaQmJKdm1ncTRjUzgralVaTE9vdEl5eURlbFB6TE0xNTNJ?=
 =?iso-2022-jp?B?WThoalhVdFVqSzB2b2FzaElaU3d3bDV1VGV3TXNndktFa2t5YjBSTDZp?=
 =?iso-2022-jp?B?ZVdmK0h2bkgyZVBLZFJmaC9GeEE0dlZLNWlZd3hGVStDbWptdmEzc0Fn?=
 =?iso-2022-jp?B?R3huZTNnYlFyMFNMK2NDTEUxSlNLNjNZRmhQNUxFMTlJZU00VE1mMlRI?=
 =?iso-2022-jp?B?bldwb3NmOWdiOVQxSTBQeE8xblIzMTlyWEFaK0djV2N3ZHYwTFd2TWd0?=
 =?iso-2022-jp?B?bXdHbFJEMXExbEVoaFJDT3pDY3NyMHcyVVRjSTg0WnE0VjI2ZmFRM0lN?=
 =?iso-2022-jp?B?WS9KNkh0U2swYVBkNDY3aEV4UDdYN2huMTZJRGdXbitHYll6Y3RKV3JP?=
 =?iso-2022-jp?B?dGs4N1FFZVVSWitUMWtqVGljL3Nxdk1hcTRQb0g4VlFZMm5OdnZOWXVP?=
 =?iso-2022-jp?B?QjRqcDlRaTBQMDVoY2MwNy9xYlhmM2NXT1dsNTdQUHFuTWVETzQxNkNk?=
 =?iso-2022-jp?B?MXg3L3pORFR1RUhEeEV2bzZpckFoSlFBRWtoVlNtZjBjUC9ENXRna09u?=
 =?iso-2022-jp?B?RlhaT1VXUnM0a3RyNVpZdURNakYxVUYxRnB6MDByOEZBcEs1Y0hxYWpo?=
 =?iso-2022-jp?B?bmYxVEdHazV2NVhndWlNV3lCdjdkczdqQ1EvUXdHcVlSOTVkU2Z0TDlT?=
 =?iso-2022-jp?B?WXZiZVk0SGJaSldNYkRwd01kR1cyVGdPUzdERmhIdHdzMWQ3cTdybUhV?=
 =?iso-2022-jp?B?UGV0UkJFZ012dWF6ZHZjamdrMjJ3U3o4eEF6eXlBTlh4aDVTQkNhNWNN?=
 =?iso-2022-jp?B?ZzMwSzhyR2NTZThBSU9hVGlXcEdqRVZQQnhsTVNWc3JISWo5S21ObFps?=
 =?iso-2022-jp?B?K1AwQW9vbXBLZVJMUGxCOFFKdUtaaFc2ODdDSDUzWFAwTnYzVjkyNGdp?=
 =?iso-2022-jp?B?NElqWkV3T1Z4K1JBYU96bFhqM1NmYnFzNG5PNmJ2TndSVG5hUVk5bjRE?=
 =?iso-2022-jp?B?cDVYWXJaMTVNYk91MGxkODZXMXJ0YXplZjQ5N0xpVWtZL0w4eExyVk1x?=
 =?iso-2022-jp?B?bEFNL1NyVElWK1VCY1FJbjV6Wm00Q0dTcTJEeEVsNUpTNEpPN2lBa2xz?=
 =?iso-2022-jp?B?S0pJaTJpdk1iSDlEU05qTVd6dlVQaW5IZEdQYjYvL1pTK3RjM2RTU1l4?=
 =?iso-2022-jp?B?OHdXam5kM21IV1VVRlJUWmM5UU5CK0ZMVktNREpqQnNhV2Q5bmdjblhG?=
 =?iso-2022-jp?B?aFlHVEZyQTAxbGhJWTFGM2J1M2txVXZwc0RlR2VZaXFUL2g2eG5HVVBR?=
 =?iso-2022-jp?B?KzNyZ0ZBSC81VDlHVjlRNFBrMDFkZWVhQTRWKzFjZkdkdFB3aG90V2U1?=
 =?iso-2022-jp?B?NER2UGRGaU1aQ2RGSWlmVG5aMitkbFI0OENtdzNGR0R0YVpJUXc4TWVv?=
 =?iso-2022-jp?B?ei9tYU9ZMG9xRUNOaEhTaFpVS3hnaGxkRStvQlJ5dm1JVUhac05EWEtI?=
 =?iso-2022-jp?B?TWovNmNsR2hpMzRpUEJWZVgxTlVrYUYxRDR2TmFPSWxSS3hTVlcyb1Vn?=
 =?iso-2022-jp?B?dHFGeDF5WUZuMFRPNEZSVTZWYjhOOFVCUXgxbXRuZ3ZDS29qejBLUG1D?=
 =?iso-2022-jp?B?ckN5RVdONGJqNXdjTlRaSmFhOTBXMFRJRnc0WDVwSld3bkRub3FzZGE1?=
 =?iso-2022-jp?B?QUl4TXM4NGsraEtHSUdDSEQzbE1ndFFXUTIrb3VIWGtMeW1aM285dGRu?=
 =?iso-2022-jp?B?WXUzaUFOQzJBdTZTWnZuUUR4VFE1c0puUWFqR0tvVjZZeTZNaHlKK2N0?=
 =?iso-2022-jp?B?cWROQ2VIcUc5dVY2aUNhdWwrSHgyTDBybWJoQT09?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ntUxdHMjv99TVBlyXoR0dEi0XIxnZO924U6O4LBzedrMvcInEfL2V5PhAiRNGd3rZXxoMRcJyPex3li1jXK+lcd8fg4Ek6nFazPpQh18LAZKt+vxzkB/tYYZusuqmLrTSxylxiK2EAl9Cw7Otp3Xkl+mkQpnZ1JccMn6KUZ/WWrKqOwH4yfG4Qk3oR/i+5oWRiijqfHHY182daQUcGiKjd99ZVvq5bRXMcvUPtt3Qj6GsIr2wZUM1nfdoEVJohlOBy+Tk348LPSUkZJZVHuT6YSmtOuzOReaExooau0C2gj+BSiHoHESO4bIv1lU5Fde+2/Ve+mVgfrc0xsvmPjz5w==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB16930.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 824e129b-449e-4106-5fff-08de8babfbf8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 02:53:11.6034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjO21FuILiPceS6edEXLlOrb8FtOa6RuB2fTQqK92ikCEmALfDOE4NAlpkEfMvN/s5LJ+zGk/1M6VDM7kqN+9Z6fTnYntxrs7dRV1OptD0s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10767
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_195320_817510_6A05CFD2 
X-CRM114-Status: GOOD (  14.91  )
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
> resctrl has two types of counters, NUMA-local and global. MPAM can only=
=0A=
> count global either using MSC at the L3 cache or in the memory controller=
s.=0A=
> When global and local equate to the same thing continue just to call it=
=0A=
> global.=0A=
> =0A=
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>=0A=
> Tested-by: Zeng Heng <zengheng4@huawei.com>=0A=
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>=0A=
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>=0A=
> Signed-off-by: James Morse <james.morse@arm.com>=0A=
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>=0A=
> ---=0A=
> Changes since rfc v1:=0A=
> Move finding any_mon_comp into monitor boilerplate patch=0A=
> Move mpam_resctrl_get_domain_from_cpu() into monitor boilerplate=0A=
> Remove free running check=0A=
> Trim commit message=0A=
> ---=0A=
>  drivers/resctrl/mpam_resctrl.c | 26 ++++++++++++++++++++++++++=0A=
>  1 file changed, 26 insertions(+)=0A=
> =0A=
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctr=
l.c=0A=
> index a7691c66553a..c17577e52f58 100644=0A=
> --- a/drivers/resctrl/mpam_resctrl.c=0A=
> +++ b/drivers/resctrl/mpam_resctrl.c=0A=
> @@ -598,6 +598,16 @@ static bool cache_has_usable_csu(struct mpam_class *=
class)=0A=
>          return true;=0A=
>  }=0A=
>  =0A=
> +static bool class_has_usable_mbwu(struct mpam_class *class)=0A=
> +{=0A=
> +       struct mpam_props *cprops =3D &class->props;=0A=
> +=0A=
> +       if (!mpam_has_feature(mpam_feat_msmon_mbwu, cprops))=0A=
> +               return false;=0A=
> +=0A=
> +       return true;=0A=
> +}=0A=
> +=0A=
>  /*=0A=
>   * Calculate the worst-case percentage change from each implemented step=
=0A=
>   * in the control.=0A=
> @@ -981,6 +991,22 @@ static void mpam_resctrl_pick_counters(void)=0A=
>                                  break;=0A=
>                          }=0A=
>                  }=0A=
> +=0A=
> +               if (class_has_usable_mbwu(class) &&=0A=
> +                   topology_matches_l3(class) &&=0A=
> +                   traffic_matches_l3(class)) {=0A=
> +                       pr_debug("class %u has usable MBWU, and matches L=
3 topology and traffic\n",=0A=
> +                                class->level);=0A=
> +=0A=
> +                       /*=0A=
> +                        * We can't distinguish traffic by destination so=
=0A=
> +                        * we don't know if it's staying on the same NUMA=
=0A=
> +                        * node. Hence, we can't calculate mbm_local exce=
pt=0A=
> +                        * when we only have one L3 and it's equivalent t=
o=0A=
> +                        * mbm_total and so always use mbm_total.=0A=
> +                        */=0A=
> +                       counter_update_class(QOS_L3_MBM_TOTAL_EVENT_ID, c=
lass);=0A=
> +               }=0A=
>          }=0A=
>  }=0A=
>  =0A=
> --=0A=
> 2.43.0=0A=
> =0A=
> =0A=
=0A=
There are environments with multiple L3 caches within a single NUMA node.=
=0A=
In this case, mbm_total will be the sum of traffic from all caches within t=
hat NUAM node.=0A=
Is my understanding correct?=0A=
=0A=
=0A=
Best regards,=0A=
Shaopeng TAN=0A=

