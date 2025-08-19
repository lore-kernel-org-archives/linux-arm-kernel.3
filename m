Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96BFFCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 10:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWkzC+CDePw+HI0GeTpgYfYp7zByVNyP3NWEjhOs64Q=; b=i3Lp/2siY4FgvMQDVN4L6livcy
	pphLcfgIFPxAw4JJr4cOzQJG8hJi+rP9aAjMH1f+uSfzY4khs+JhawgVwT/ZkRsmGfXT3N808xljp
	Q8lSX+YPOTo3bvYoltlqfVeFiDEiHaQGkZMMNBQmg0VB53/Bpr4wUw4Eg/VxG9mFzYaaGzadzfb+f
	0c02LQkExS5fGCUUGZEZkQU+TqoG+QJ+S3ivgHFV/qP9AQhlTw4JIG0dIQWe2mP8UgkPB/mEHc7pB
	aFJQFfiVJov/Xz6L+J6NSrkM9jDeJzhW9sH0XF9H1PgkpAPhZ4V5FxViV2ZJaA4/iAjdjEkcB9wxo
	J9VtuQ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJ9S-0000000A3lY-0Xrx;
	Tue, 19 Aug 2025 10:01:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoHBp-00000009jri-3Bt6;
	Tue, 19 Aug 2025 07:55:30 +0000
X-UUID: dbf1c5d67cd111f09eb0dd999d3936bf-20250819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=TWkzC+CDePw+HI0GeTpgYfYp7zByVNyP3NWEjhOs64Q=;
	b=PHjQvTA+sVT6jvwO58Pj4+dAAFuc6hB7gCZw6dQGiwoorjQ+0+oN+RHdIFYPG32ld8VSFeU40rRhITmLPk57xHqqZ2Ss2saJnjeiGy/XHnvpjiu20s8V/xboRPUHm8FdA+wDaPtaD8CDDBEoqQxA5YH/6+nFcv3w5yNt38IndXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:15993987-9080-44e9-875e-bf2079e90d3c,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:cfc6a044-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dbf1c5d67cd111f09eb0dd999d3936bf-20250819
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2107993172; Tue, 19 Aug 2025 00:55:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 19 Aug 2025 15:54:51 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 19 Aug 2025 15:54:52 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3bkxIln4II159sZYwG1HfwLA894+mSZWC5cmkkaFenCBBgvttZj8WO1QoQj00M83M31E6oexyR/SwELUIX0kM/oPz1mumZcCAcSj37y0sSCTivMW9Letp26kdr3J+Pi0PLInnDyLQrnprwoGRnXUeRpR3jZWZxur8SiRFN9rLFrfXfVGam71UtcaTpsguRQPQTWylrcxvDH6psUqYwxiJpymp9lUvu0ZjxhHLNM793zYpNQxX1ZK2PukZGcshgM4Okv4G7BUxHAHu3ZSy767P7Wo/3MBni4oSk6P8idyNQHjcAyB1UHFk5yUFqMJB2bcsOGrmuK+HbmDmCuRlLCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWkzC+CDePw+HI0GeTpgYfYp7zByVNyP3NWEjhOs64Q=;
 b=SBBNGzOexWARJw8k/R7whWQZRdNdnivW7tjIfUZWqP2ENSmZ7M9JaLigPXsXwZKJXYVWjyOmb4FLcMXIc1Gx88F5paCmlMKSggy12q7WjgghVU7423HMvhWd9e8Bf+Jjyb8XaSFrsOzbLRWP/ocFoZ/l7rb6GkILgoeQv12TU6UEXMUOleACcGq2MxO7YOvqyER3hN+nPGRldbvFRuX6E0fBImJ8AolpVvsaJqUbWeyTad0JZeLD58eerVZxvysJwpsuytBdfYmX7nl3505JFOL10IMHT2/kII3t1+7cxKIQ0rPrudV3gYuwMOS/LsBC/657IHTS29nWFEHa+9dqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWkzC+CDePw+HI0GeTpgYfYp7zByVNyP3NWEjhOs64Q=;
 b=BfuxPrVcEBVDXHFJKzbP83Wmub8p/QMPm7ikAVIoUrbJK92XIymdmCIPuYd1YWudhYrYhl/4gNKVjQb/dRJQvzMSe/iupHi8t0m1MIgVltFAkiPRc4DMDmMqnUXJtntbEzwlV6Cwa8+79Dgwb+uvSHAurTj51yFxIz7DlZ2nL3U=
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com (2603:1096:820:88::11)
 by TY0PR03MB8222.apcprd03.prod.outlook.com (2603:1096:405:16::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 07:54:49 +0000
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc]) by KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 07:54:49 +0000
From: =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>
To: Sean Wang <Sean.Wang@mediatek.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "lee@kernel.org" <lee@kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk@kernel.org" <krzk@kernel.org>,
	=?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rtc@vger.kernel.org"
	<linux-rtc@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?= <Jh.Hsu@mediatek.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>
Subject: Re: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU
 register
Thread-Topic: [PATCH v1 1/2] mfd: mt6397: Add new bit definitions for RTC_BBPU
 register
Thread-Index: AQHcCpgvW6hQmxxYeUeBT2HNIAh14LRdScKAgAxeHwA=
Date: Tue, 19 Aug 2025 07:54:49 +0000
Message-ID: <40342432bf4638b54615b70320f72095f18c0490.camel@mediatek.com>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
	 <20250811081543.4377-2-ot_shunxi.zhang@mediatek.com>
	 <b41749ae-640b-4911-976f-8aa36d40ed6b@kernel.org>
In-Reply-To: <b41749ae-640b-4911-976f-8aa36d40ed6b@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5974:EE_|TY0PR03MB8222:EE_
x-ms-office365-filtering-correlation-id: 61fab861-563f-42a0-b3c8-08dddef5ac06
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bThIZnZzbmhZd2xhZytRRFdURDg0amhuVk0reUhXRHR3bUt5NXVLbVdPeGRu?=
 =?utf-8?B?alk3T2h2VWFaY25oWi9XWWFwbWRUV3hjczQwR0xycTlIckQxYzdnbnp3cUVG?=
 =?utf-8?B?ZW9TRjVua293bjgva1BXWVVQV1g5bHprNFdVOHd1Mk04d3JUS0pCR0pRMlpJ?=
 =?utf-8?B?MGlHcVNsNG5JSHBZZ3p0VFBkN2QzK3pnNUVTK3dMZDg0OVpaUFY5Wnl5OHov?=
 =?utf-8?B?OTRZRW91amZ4RWhCaHg2enpuMXRjSkVEVEllMGd1aFl1UU96a3pkcVpVcGt5?=
 =?utf-8?B?NzlvMzFWaU95RG55eXlJYkdLSkpYdHVLSFdiS0FObEVGY0J4c3NQdnFRekh6?=
 =?utf-8?B?b1M3UDZYdHlMZDNhMlRhc0dFNk8wU0Z1ZWZtaFR1VjBqVE5TOVZkVUxJM0Vk?=
 =?utf-8?B?VFYzYS9FOU96YzEza3QwOHhXTEp4Z1oxcS9JcitxU0ZoOCtKcjFwN00xOHYz?=
 =?utf-8?B?Z3FYdlpyeGZDQUREZ1ZOTklEemE0SFFISXNTWE5oVjBucUZrL3FDYnRwSXds?=
 =?utf-8?B?SDlzYVF1bFU5aG5FUlAxaUJ4SHhYT1lYMG9mNm5kalJnTXNyMlhsSlFnNGJM?=
 =?utf-8?B?emw2K0hnT3p1V0lDVW5qemxRSVk4UlEzTXVIamExZTNBOXk1R0NMSzJHeW04?=
 =?utf-8?B?Z1BEdVRhaFBYUFZvL0NmM3Q3ckh0bVMyZUE5ZGtmMWRVS2szNmhtaFYwV0c0?=
 =?utf-8?B?RmR3UDRaTHhYVUFza1JvN09GSE05dlEySkZZTWVLcGRERlNScEJhWjZMWFRZ?=
 =?utf-8?B?NzF2VEZKRGxoREFVcDFDWU9NQXJqM0g3ZlNMbkNya290dmRJOXRJMlYxU1d3?=
 =?utf-8?B?T3VpeHB2WkMzUVFaMUpIOXczSG1jbVJVNkNwUWFqNTAxWEZONXRienRCZ1RH?=
 =?utf-8?B?Y0J3SVA5UnlhVlU4Vm94eThTejhVQ2dKYmNNdy8rZU1aUzZWQXNIeTZjOWgy?=
 =?utf-8?B?aXllWDVzb2ttMmZZeXFIVEQ1aFp3cnhMbHVEU3NzLzVoMG9FKytscjl4YUtS?=
 =?utf-8?B?ZUJRSVdkQ0J2Vng5NXJLekhKSlNNODZ6TElHSlVtWEpURVNUTjJXSjFHNjF3?=
 =?utf-8?B?bmVvL3Q3VU9uL0ZYeTlrcWZTOWFXUnVPUWJERVJxV1QraGdWNzBsSHEvVnFj?=
 =?utf-8?B?bDVTWkI0aDlyVUlBeEZzYWxBWUNkL0dpcVY2blc5bVNEbGg3RlI5bGxla1Ru?=
 =?utf-8?B?Ujl5MVBPeXUrQTFUQ3Fld1JoTFNqSXJqQkJER1h6TzNFakdnMnFHcjVaK21r?=
 =?utf-8?B?QTBXZnBoWGFxSnY1MlJWNUxVWHRDWXB1VzRQYTRBRGtYZXNFNzFwZTZteUpD?=
 =?utf-8?B?cWNpdjYyNWc3bjROdjdxcWIvSFVUV3BuNVExQmhMMnVUSG50VkJJaDloYUY1?=
 =?utf-8?B?R0kyR1FtVk96WE05VkJ1RVlrMURNc3kxT2FDTWhxNXhZekJILy85Z2xRdkV5?=
 =?utf-8?B?VTVGSmVLbjFNc0tsRUZSdzFHZVc0UGU0SUN0RTZxUTZlbTBHWXAzeUQvNjJu?=
 =?utf-8?B?VlZ1ZVU0ZC85RVlXamU1Y1FrT1pUdGVKRzFjQzdEdk1CcHNicHlrZ2tXa21B?=
 =?utf-8?B?cHdmaTFyVk1DWVlrajVtUXVaTmc3OUtreHZiTlVxbU16cHFITXVsVmpIRjV4?=
 =?utf-8?B?dWhmM2dhb211MmxoeGFjNERkMUJ0R2t0ak1lemJBRkh5ZzdZODEwekR4VmVW?=
 =?utf-8?B?dWVBZVpKRTZoUjNoN3BCcVZ4cGdPQXVRelNoa0VFcXpyN3RsZUIwMSs2amFh?=
 =?utf-8?B?U3JpVkN6UDBxa1FyUEVVdG5jbnJzVVFINE0xZzhuOXFwRkRmZ0pGV0grcHBR?=
 =?utf-8?B?d1BWVEJMdVhRdjBtWnNsTksvTVFXdXhnVVFieW1CQUx0L0xyZ3RpYi9yTGdm?=
 =?utf-8?B?d2k1cFA3OW9QNGV6dFJUT2JkZzEzNW5mYzNIVkFLVkVmd29UT3V5Z3lDOFQx?=
 =?utf-8?B?bUNyZFM4T1ppaWU5Vm43RnNVakJORGUvOENuY1d3MC9PUmJJUXFlaFFyOHlD?=
 =?utf-8?Q?zgRAhOxFExY+4Wv2wTZid1yt5DagW4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5974.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjNDeGNGa0lMejhxaTZQT3lpRVZhYzE0QXJaM1pPdGw5ZnBZV3llV1VQY3Mr?=
 =?utf-8?B?ZTVmZTBVZkFGMXlJTzhzZitFRFJqQXRlNHhMLzU5OFJNczJwZEZReGNRcnRX?=
 =?utf-8?B?elJud3YxMFBvQStKNW5yTll2NDRhWGhPQkQ5Z0JJL1hSWnB1UDc1NjRBMjM3?=
 =?utf-8?B?RmNQM25uWHUrb2xxSUYrSkdOYlpzZC9kU3Ezd0ZpZWZlWjN0emc0TEhHMVM0?=
 =?utf-8?B?Qk90UUpaN3d1bzhaWVJRZ09HUVptSm1iZGVpYWZLd3ZsM0FJMFd4Nk1PTXhR?=
 =?utf-8?B?WFhBWU9mdkxHMlRVT1ViRWQzWGZYL1BuS2dydVZ5WEFTQmlJczMwZWQ2VVVs?=
 =?utf-8?B?Si9XZTIyTjNWV1A2WEVWVDBrTlJQb3o3MWw5UGNCYmJEQmRqeGRlbTdnOFhS?=
 =?utf-8?B?ZGg0cVREUVRRTEh3d2svUnR5VnI1MWpXbTEvT3A2UXNBS25TSWJYYW1aWlI4?=
 =?utf-8?B?STRtRkg4Ri9lYzd0S2RJLzJpNjd0Umw5SCtMMlB2aCtMdERYK1d1UXVpNks0?=
 =?utf-8?B?SUhnaUZrTmcwckw1ZFRGRVNTeVJuV2o0TWtMbjVKMDExL1hJdi82blJxRjUz?=
 =?utf-8?B?WnJHUWs5Y1g0RXQ5cGFQNmE4ZktRakZwWGhuSWVoVFNha0srSEF5TEVRMWZj?=
 =?utf-8?B?S2h2OElqL3V6bmk2N244YzFmZUFSSVNnbWYyalNadXM1ZTU4ckZGckd2MnFL?=
 =?utf-8?B?dnBaWENVVDVwdWRkRFZUelF2N1pXMk92eDF6bGZnRlN0QWdsamQ4UEs1bUM3?=
 =?utf-8?B?ZDlVdWFuamJYTXZDbkpjZ05EVGZSMUw4c2J4YXRjdmtseUZMdXVlbmdtQUti?=
 =?utf-8?B?dDAxZldKQStrbVBnaEdtRUdaMU0xK2NNMXk4YmlPcDRmUnd2Mk10M3dtVDQ4?=
 =?utf-8?B?a2s0bjYxLy8yUUxBYXkrNk8rV1VyMUJmVnNucC9pNTdsMDVMdUhmY1ZBcEFx?=
 =?utf-8?B?aGZXTGtuRFc4RUduUEpiM0M1RmI5SXVuRndWSzB1aGJ0QzhCYm10dlpHUHFo?=
 =?utf-8?B?RXM0ZFNDNU4xNE5PVTVMVUI3ZU96L05MSmFRUXJUa1p2T2VqdUZMY2IrQmEx?=
 =?utf-8?B?UjhQTWZKbk1wSlREMFQvVHBBRU1maWdRdFI3bDhnaC9VakxOQjZzK3ZROWFD?=
 =?utf-8?B?Z1BYdlh5RWJNZnNqRVNYRDl0RmlrOXBwVjI4ZUVlT3prSGwwKzd2SmsyUVYy?=
 =?utf-8?B?d0E3RkFqcEJ3cE56M1VKQUFxN1k5bzFDM0ZzMlJVUGkrckVYNGdhUk91WTdL?=
 =?utf-8?B?bXFMTGpHSU1TSHFzOWI5akQ2SFhTdE11SU1MOHdCZUlSS0piNWh2bGd3R2ty?=
 =?utf-8?B?ZW52RXFPbDA1TklpNXdyZndJU2Fmbm9ZVjdTNC9Rdk9qdzdoQjQ1SWdzZlBz?=
 =?utf-8?B?eE5RQjVhR3NFTmJTZys5UU5FTjQ1NjV5eWNWcGhuaHZYNGdoYkNJZHpuRDNN?=
 =?utf-8?B?MFdETnB2WXZtMFVBUmk4N1FlM1ZvU0F1VVU0dFg2NHZGb1VMMzVnNEJxamZQ?=
 =?utf-8?B?cm1wUDRHbFkxN1R3SVQ4dXNGSDBkU0pHdjhuZ3hUbnp1Vk1pL3pyR0preEsy?=
 =?utf-8?B?aUlVYzVVdEUrOTJDeno4aXUwaCtYSFpDS1Z4Syt3elRHelBzWkJQU2xEMWYx?=
 =?utf-8?B?eU1MOG80Mmlpc1VMY1dYNEJ0RUhFcC8zVHFNZGwwM29CeVBud3ZvdW5sak9t?=
 =?utf-8?B?cHAyZXh4dUM5dGRZZUVhdU0rNEFnblVNZDAzYk5YY2syNk43bHdHOXpiNmQv?=
 =?utf-8?B?Vm54VTl5azJvMVJMVnBEMUVLRktHeTBJU2RDUXFDYW5ySEVTUWdsbDVaK2JX?=
 =?utf-8?B?c2RwVDF3UTQvV0VMNHhqNFRCTFFGQkF3Tk1QbHdSY3YwNDhFZEE4U2pGZlMx?=
 =?utf-8?B?UkZqMmVWUzdWdEdWZDFpN3kxZUVxTDd4NW83cnFsSTNLS09YVnF3N3pHak1O?=
 =?utf-8?B?Z3J3Nkx3azRMTEVJV3QxRkNDVVJ6SjNYenB2UGNJOXlCa3lkR1k2SXRjOHhR?=
 =?utf-8?B?ZFZxSzdYSTlYaFVNQzhUSXkzV1g1emdrT05PQjJlTFc2TzMwZWtXc2dvS3k2?=
 =?utf-8?B?Q0VwajJ1Wkxrbk5rVmxmWU8zTHlUYlkrQ1NwLzdFTXlDOENBMHowL1UrSFRF?=
 =?utf-8?B?ZWdLUncvZzJ0c1Q0eXo1OEEzTmtYaklzU3docUM5RWVxQmtiUVBaTk04N0ly?=
 =?utf-8?B?NkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC62CEFC6B3EB840BA020F84CB2AF3BB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5974.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fab861-563f-42a0-b3c8-08dddef5ac06
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 07:54:49.0800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wVl71gg3O4ujD2elfWntMn0tdS64JfknRqOEyh4XWQOmygyEdaN7izv7Q1z1SFZsY/CHC2cSupjuur7PM2kWoUkfrh6j5Mhn0QSP+QjpWb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_005529_803331_46FE0FDD 
X-CRM114-Status: GOOD (  21.00  )
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDEzOjAyICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDExLzA4LzIwMjUgMTA6MTUsIG90X3NodW54aS56aGFu
Z0BtZWRpYXRlay5jb20gd3JvdGU6DQo+ID4gRnJvbTogU2h1bnhpIFpoYW5nIDxvdF9zaHVueGku
emhhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBuZXcgYml0IGRl
ZmluaXRpb25zIGZvciB0aGUgUlRDX0JCUFUgcmVnaXN0ZXIgaW4NCj4gPiB0aGUNCj4gDQo+IFdo
eT8gVGhlcmUgaXMgbm8gdXNlciBvZiB0aGVzZS4gRG9uJ3QgYWRkIHVzZWxlc3MgZGVmaW5lcy4N
Cj4gDQo+ID4gbXQ2Mzk3IFJUQyBoZWFkZXIgZmlsZS4gVGhlIGZvbGxvd2luZyBiaXQgZGVmaW5p
dGlvbnMgYXJlDQo+ID4gaW50cm9kdWNlZDoNCj4gDQo+IEhtPw0KPiANCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBTaHVueGkgWmhhbmcgPG90X3NodW54aS56aGFuZ0BtZWRpYXRlay5jb20+DQo+
ID4gLS0tDQo+ID4gIGluY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaCB8IDUgKysrKy0NCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0K
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21mZC9tdDYzOTcvcnRjLmgNCj4gPiBiL2lu
Y2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaA0KPiA+IGluZGV4IDI3ODgzYWY0NGY4Ny4uMDAx
Y2VmNmI3MzAyIDEwMDY0NA0KPiA+IC0tLSBhL2luY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMu
aA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvbWZkL210NjM5Ny9ydGMuaA0KPiA+IEBAIC0xNSw4
ICsxNSwxMSBAQA0KPiA+ICAjaW5jbHVkZSA8bGludXgvcnRjLmg+DQo+ID4gDQo+ID4gICNkZWZp
bmUgUlRDX0JCUFUgICAgICAgICAgICAgICAweDAwMDANCj4gPiArI2RlZmluZSBSVENfQkJQVV9Q
V1JFTiAgICAgICAgIEJJVCgwKQ0KPiA+ICsjZGVmaW5lIFJUQ19CQlBVX0NMUiAgICAgICAgICAg
QklUKDEpDQo+ID4gKyNkZWZpbmUgUlRDX0JCUFVfUkVTRVRfQUwgICAgICBCSVQoMykNCj4gPiAg
I2RlZmluZSBSVENfQkJQVV9DQlVTWSAgICAgICAgIEJJVCg2KQ0KPiA+IC0jZGVmaW5lIFJUQ19C
QlBVX0tFWSAgICAgICAgICAgICgweDQzIDw8IDgpDQo+ID4gKyNkZWZpbmUgUlRDX0JCUFVfS0VZ
ICAgICAgICAgICAoMHg0MyA8PCA4KQ0KPiANCj4gDQo+IFdoeT8NCj4gDQo+IA0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KRGVhciBzaXIsDQpUaGUgTVQ2Mzk3IGlzIGFuIGlu
dGVncmF0aW9uIG9mIHNldmVyYWwgSUNzIGFuZCBkb2VzIG5vdCBoYXZlIGENCnNlcGFyYXRlIElD
IHNwZWNpZmljYXRpb24uIEkgd2lsbCBjaGVjayB0aGUgcmVsZXZhbnQgSUMgZGF0YXNoZWV0cw0K
YWdhaW4uIEkgd2lsbCByZW1vdmUgdGhlIHVzZWxlc3MgZGVmaW5lIGluIG5leHQgdmVyc2lvbi4N
Cg0KVGhhbmtzIGZvciB5b3VyIGNvbW1uZXRzLg0KDQpCZXN0IHJlZ2FyZHMNClNodW54aSBaaGFu
Z3VzDQoNCg==

