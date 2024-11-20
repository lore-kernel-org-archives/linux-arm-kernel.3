Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19740D6E2C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxVSPqbpGHcUKf6jqF/EGjf+BdbkySKgh8FWhNp75Og=; b=13qRcj8Ue7ZwXv4fzm/gbqx9f9
	tEVpqyNCbkkEfil2fFf6x2FJcoOy+ZtgVQ96HFz8p4AqE+hroafy7Bo8vo976Zv3w0mysMenU24hl
	na0RiqRAx9INGrUL16vh4ql/YVba1R2eMfE7EaVjsTnj1ErqX3TzJpsLSII9+2NrkyY1n/Ciy7AMN
	/2e67oAhH7SqxiifavZH/Q4eCBQKtNXsZagLMHUFzXmhLK4aUHgPzE3Sty1zN9JT8Kj0NV0bCwvNT
	7ohpdKnY6FSWq1rwDXTy2HjKdMIRvC2AmkYm4hhaKXsu8uJamDZPzbw5A4kM1+Pq+ScGcZ5CtKCWK
	0UFRm/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDdwe-0000000ETtn-2fm4;
	Wed, 20 Nov 2024 06:12:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDdvi-0000000ETnT-03sL;
	Wed, 20 Nov 2024 06:11:11 +0000
X-UUID: 3ac47006a70611ef82ff63e91e7eb18c-20241119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=dxVSPqbpGHcUKf6jqF/EGjf+BdbkySKgh8FWhNp75Og=;
	b=h5hJufNwUJEehtw+iU+4jwme/c9f9gmAD9UmR1MhGtR/Sq1OJ5t150si2fthzWlMS6h51oJZBRl78qcuRVlRTXgweETsNSTSpCILN4gnfBep9UWziodbjPcVWLvLkDyQGwLqens9ZrGts+LhYx3cvkhJ6Q0FwCSDitFHlQ2Tptg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:ff07ec7c-7e75-4c7e-83f4-13d8e498094c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:b78618b9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3ac47006a70611ef82ff63e91e7eb18c-20241119
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 405847082; Tue, 19 Nov 2024 23:11:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Nov 2024 14:11:02 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Nov 2024 14:11:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKig0u9pn3YVBWANZUk+kRZuOHvtil1QyjmjbTT/SD6W3dWEsTkz4RyBcdlsI8ySQiJ4fZd/ysoUozsHPqrtDd4PMxZ0Rdendc1h/h8F5RNbooGZeDlddMeB2ef348jt6J8FLiKGy7Uc8X4cucuhKvXeQvA5ESWxE802vlIFdTLwivLspwAzng4DMS7/2DMePfLgpcCtA3LdhMQpNRl7BhtHSpdSHQIyTTfuaReMsC2OmxC1FGzp5w4l53WjcvIRnqD43dBZRqZI675vIRQUDHXOAoas1OpOOnv7b7vmd1R3wX+l/23kpneApbTgcT5tAnH/sCZ4oV8gv1A6QzWu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxVSPqbpGHcUKf6jqF/EGjf+BdbkySKgh8FWhNp75Og=;
 b=VIdBvi3Cmt4af/OO2HU6kzceKXyRpB94Nj1Sutqj1VVNXqemumd+GdoAkB3JMhyEiO2mXOZJKAQ8h5RGBBzAdYNvlVXkGhx7WrvXXjtWGDcQezwIpWMqpyA8WT9Xs5x68CXZK3ZVwMeGjgBK+zjDIkU3C8ukZ4sBOM8f5AecpZrw0+D9VgX7wEA1XVQgWPuutv2MkwZYOOMgcD1YZOhg29oF0vcPpY/Ykpd6DtgGuYAkTTVadyL3S/0Z1plvuWwW+f7+j9LjaOpEVTJmZQ8Nilwwd1ucqYJoaokZdWXzPoS7T+hlI2hbgX277Ufn5fypnSPfAhr8o9gpYDzCHadEQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxVSPqbpGHcUKf6jqF/EGjf+BdbkySKgh8FWhNp75Og=;
 b=KsgqYevehYnnfXGS7FoyxEfOC1BHjGB3MVgPYynQtrZdpn/zZIWcoTAe5dsJM0Mmo6vLMJqINO0VsoopelkmrEptSCNXNOIEcfTezcDqFKPgnq5eDM3H843W4bAImL1hrBCojxU7GHY2Zl0J9IWDW3yAF8iiugufLT2sYuWl/ZY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB8396.apcprd03.prod.outlook.com (2603:1096:405:56::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Wed, 20 Nov
 2024 06:10:59 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 06:10:58 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Topic: [PATCH v1 05/10] media: platform: mediatek: add isp_7x camsys
 unit
Thread-Index: AQHbGj3MGEEcsT7oNkOiiJNQG6iUarK/8XGA
Date: Wed, 20 Nov 2024 06:10:58 +0000
Message-ID: <ada9ebdd87ef12fa0d36bd0f15df9946ed650e02.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-6-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB8396:EE_
x-ms-office365-filtering-correlation-id: 14c1e2af-8827-49ab-495c-08dd092a1a09
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b3pybVlyUGNtS1JseFhnRTBEbjhkMGkwN0s2MGpmUUd6Mk5zMXBFb1FtWEdB?=
 =?utf-8?B?c01pRWNYaEluVWpWVFowNVZMWEw4U29EKyt5NDYrZVRLSTNYcjNva01JdUth?=
 =?utf-8?B?NmhyRU9kVmZoNTVydk9aaXlBQTA4UFF5dmxTbkwydEswRlVRbW8vSkwyVW01?=
 =?utf-8?B?U0lITUY4TjEvbXE3Z3VORzlNOEJLKzZqR1NZR2ZORHhmRzlJZlBGaGhWbHRS?=
 =?utf-8?B?NmN6TVNDN2thTDJkRVJqMUFLWEpvcmdNVjBlS0w5c2hzeGVvNlc0WVlwUUg1?=
 =?utf-8?B?aDZwQmtxTmpDNEFpazJpZmxIa1VDQk5CbDJON2NYMnprWWxsamh3Y25hN3lG?=
 =?utf-8?B?Zys0dFhUZ3Fab1JsYnppQmsvYytWczVmb2lhNzRoODlGbU9Xd1E0eDJSSEt4?=
 =?utf-8?B?emI4dEVib3dsMkcvN3FvMTdYenFpR21SenNFNU42UW5kWEpTS1Q1c3FpZ1BJ?=
 =?utf-8?B?dndURjdjWjJqTzdVYzE0YWhBSTExMUYxaVp5K1RIMWlmT0EvQndDR3pRZUtv?=
 =?utf-8?B?Z21PV2JtZHNaQVdJMWpoZFdTRnI4UkpZNmt2WDBZMDRDbmNaU1hLTzd1anhC?=
 =?utf-8?B?aDVFZytvTUErQlk5dndhL0dXVC9QV2ppUm40Q1VtN3BrZDRFZURyTkU5b1cw?=
 =?utf-8?B?YmtpRXc5UTFMNDdCSlJIZWhZZFVYNExoQlE3U0hiYkRJaC9xRmZScEFiTm1h?=
 =?utf-8?B?Zk5SRFczTTZyb2lRMURrc2hURmQrMk1WbWo5dWYwMUlNT2o2eDNzNHp1bDFX?=
 =?utf-8?B?QXBrcGY4N2c5OE9iM1lqK2xwMmJYNnhzaUF3cjF2QkoyNm5IcDFVRTNVa2Vz?=
 =?utf-8?B?ZnA5Uk9MeFBTblovWUxZSDlpYzZBeGpFS2NWZEFaaDMyTDdaeGQ2STFlZG03?=
 =?utf-8?B?RnB3eXZZZDNiQUFTRitLMWxYdGJoR3ZnRkpXU2lROFh3b1pIbjV0a2VyUUd4?=
 =?utf-8?B?VFRQZGlrYjkxY3dqbXQ3UDYrdVJUdDU3Rno1RXYzV2d0eWkrWk81TitDOVlh?=
 =?utf-8?B?clFWNVdJMm91eUxQLzFhMzRpSHI1UkwvNVZtVkVwcEZmUTVrK2FlNlRNSVpS?=
 =?utf-8?B?bnFTR09lY2pCUCs1MjVuTEY2TVhpWjA1OE5IYmdZWmQza0JmeVpNdzc4Umhm?=
 =?utf-8?B?VkhkcTNHbGJGRHgxZ1dSN1FQRkNKVjFPTm1pMlN3aWM1cTRXQ1gwSWJMODNP?=
 =?utf-8?B?SngvZnp5K0tqWXArTXdCejVaTEJrMnVxZ3NjRmd0QjF0UU9vN2k0QmtLYlY4?=
 =?utf-8?B?a3FKeWVIME1adnNYMC9XT1I5amFleFdPYnFQVU5pMHEvZzArMWwzOEhTaHMr?=
 =?utf-8?B?UTFHYjVsYk5pTTYzK2NTU1RKWExNS1FBdWk5cmkzZlNsNnJSYldWNVJEbE5N?=
 =?utf-8?B?QzBJU3A3MXVGTjN0MGZLUkdoR2s2ZEZIRUczZGxXbUlWcUh2L0JRaW1XQkVh?=
 =?utf-8?B?aUJUUTZqdlRib3FMaE0xQUNLUFFrUzkwcURQOWJuMS9KQnhzRG5pdWJXQkha?=
 =?utf-8?B?dEU0am91Y01NMEZEZ3poaG5IYjJGaE9HK3pOcmI1UW4zM0xUQ1NPOGU4V1ZF?=
 =?utf-8?B?amxpdlhoYlZCRkk2QmRSMStIYnM5RHVUY21ibTVWSzNCakdiT2xvUFZHdnZ1?=
 =?utf-8?B?NUxNdW1BVHhNZTlxY2JranJLM2N1Vm14MFZ3SG53bkpUdit5b1RvbVVoMDdS?=
 =?utf-8?B?RTBjeFdWUnFkMHl2bmdDOW9GcGE4SGozUXVMd3IrR0JxSEZ5bFByTVphU2Na?=
 =?utf-8?B?MGFla0I1YXd6dC9YSStLYTg1SGlXRDVGUWorMnZLR1MzNjUzbVIvUks3RVk5?=
 =?utf-8?Q?JgM5vVWH8AJvPLq1Ypm8DNewG70KM1tjJcFuU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UStUNjlXUGZjMnpwMWRSeVh3eGpyOHZ6OFJGRFR5MU9UMU4wNlZJcnVscUgr?=
 =?utf-8?B?aVpFUVVwUG55OVE4dzFuMWpBeE8vYlFlMXNtTkRWL3FsN3ZmZVFaMUM0a1l6?=
 =?utf-8?B?Rm90NWFZQ2hsalRLa3BJYWIyaStEaWFOTXEvN2tXTGNaUmtRSTN2UitIdTdS?=
 =?utf-8?B?Yjc0amlEbDRQZWhReDBMMGFMaWpTWVIvcUsyZkc1T1Z2bHljSDBzZXNLT01v?=
 =?utf-8?B?NXN6WFVSSFlDZkJiZGcyd2s4bG1mTGR3ZGdtS2ZaNVVhVUQvWjNVNjdnR2k5?=
 =?utf-8?B?NXdhSUI1VERSZ2JOVWVub0pWbG9LTGJVL3M0NkNXZTJ2WFR6dHU3MVYzcHU0?=
 =?utf-8?B?enNSTTVqUzd6emxzdWpwUU1XbkNDNnY5aEw2NFIvUzJNd21GZU1TYmdoeWQ1?=
 =?utf-8?B?L25KRXdMNGRIRjZvRXRqNjBpdDhjRklwWkRzbFBSZDVqMTk1am16Tm9nQWJ5?=
 =?utf-8?B?Sms2bi9YdWNFZlB3eTdYa01mYkFPQmRrYVJoTkhiMUVEQ0J5RDhUbmNhczZQ?=
 =?utf-8?B?bkFhM2RyTXRlOWJDTlVXOGlzTTg5UlBranpZZm1VdStYSHB5YmZpVHdvL1dY?=
 =?utf-8?B?NzNiQnNPaDZMSXA3MVZCRVlNQ1hha2kralNiVUhTQUhjTHFNZXhhNGJLaStW?=
 =?utf-8?B?L1d4TTNVdmtNMnUwcFEzbXZZa1lPT1pXWHBIdy82ZExzVXNwdGlGazg2QzNm?=
 =?utf-8?B?dGJMVC9ZOEE2NU1Za1I2MkljU3J1STVDam4yVVY4ZEVoTnd3VzFZTUZFa0xV?=
 =?utf-8?B?djEzaGFITG4zN3AvRTVZeVF2cGFwTzdJRXUyMUoxQTk0MnpEZjFNNlVpUk9O?=
 =?utf-8?B?OTdtV3QreDlOQWRuOFc3alZ0WmtsWExkT1hKa2c1OXRXYWtDakw4SStQUXBM?=
 =?utf-8?B?eE5JdG5UY0JiK3lFenNjMUdqbVJpRjFBZHliWUZoaUdOSVZESWdsMWtZalgr?=
 =?utf-8?B?VXJndU9wVnFKYjVrSUNpbHVQY2pYTGMwaTJ1R2l0NnhVcVJSQkVveS95Und4?=
 =?utf-8?B?d3NmanJ0eGxNQUJzWHU2UzcySFZnOGpybVpTRkFHbHJBYVhTUTM4T3J6ZXRr?=
 =?utf-8?B?K2RiNE54SW1iUmxzcVJrZ3lMYkF2cmhrSk9MaTRhWWVOYWU4WFFwa3Q0dis0?=
 =?utf-8?B?TkphUlpSOE9tdmxtUFJrWkdFVkVnRS8xMHcrbEJrOG5OYmFkWTNDYnFKT1Z6?=
 =?utf-8?B?MDZvUWR4cFp4YnlZTmdQby9jS1pkUTlyR095MHlyNWw5Ly96NFlkVHZHMUNH?=
 =?utf-8?B?QnFGVlQySDBway9zcG1QNUxTMlRsckhLTG9lOGNLVWdWMzlsYTlLRTlKaHpq?=
 =?utf-8?B?YkRybktScE5iZllaWUYyQ1pra3htSXZiK3JGSGZ5ZHJWcExoT3Q4MWRGUHZY?=
 =?utf-8?B?T1ordmRKbGVZbHlpSUdYbmR3SjdxM2NTd1EvTVhFd0ZsanJ1b3ViaWRLYytz?=
 =?utf-8?B?ZWE4Y2ZValVQeGE3T3NOeERIWS8yVGloQndvOFAxOXc4b3dQeHFhdkVkSlJz?=
 =?utf-8?B?UThNZkh3OTVOM2R3TCs4Rkc5VVc5ZEZrUll2T1BmVDZTL0VCblc3VVd6emZH?=
 =?utf-8?B?RmNQR3NzZmxtNUFTclVsNEZOQi93MlZFUlVGbS9vWGtNbGdrNmNuRG5qZGMx?=
 =?utf-8?B?eHRlNW5ObVF0VnVUUXNWWHhFcjd5am44QTVOY1EwL0poeHFML2RWSTlrQkt5?=
 =?utf-8?B?a1VTR2Y5QnZvSjMxL3Nic3ZSVWxiNEtscE5VU05OTjIyRzI5MGtkUzFIYWM4?=
 =?utf-8?B?dmhNOTF3bGZTNmt5MFBnOHA5ZE5pQXhOWWxEV200TGFrc2dWM2xEc0ZyRHFG?=
 =?utf-8?B?QlZMeXpCZ2JlY1NlOFZpdWlVdDhtU2hGZ09kOFVGa2ZyL2w5OTlMeHFRMFp6?=
 =?utf-8?B?Mm1UK0sxNUo1UG9jMjFpNXhnSXF4L0hJZEV6eU0zUVJhNGRzdmZhQU9hMVlH?=
 =?utf-8?B?d215ZUtBWnVVSTVpZ0ozOEZKa0owVjFZNXZvNWJzRmlKL2RQZnBYWENPRkwv?=
 =?utf-8?B?Yzl6ZlNQRFdqMlhCaUNSVGMxa2YwcmtYaEI1Nnh3djZySldQTVplMWhYNm4w?=
 =?utf-8?B?WnJ4QldjOUVxZnVzVnp3Zzd4UEkxRUd3NUlRRHV3TkR2cTRmTGZNMDdoTnE1?=
 =?utf-8?Q?NV9g8HiB/5nrxRwGqAJUeWDVv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <153F0B86A663F74482B776850BDD3D28@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c1e2af-8827-49ab-495c-08dd092a1a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 06:10:58.6535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZIhNDoUwnGVSWSrop8JNly2qAz3CttsbU1jng5MzQtjP3IwHlCyeI0iGaGY3YYAdzszNKKcm4F1M/NIyo5BWZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8396
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--14.409000-8.000000
X-TMASE-MatchedRID: O/y65JfDwwtm6oeM5+OJFCaix8JZpk78jLOy13Cgb4+qvcIF1TcLYHB1
	e9+YlER9xxL5hQ2RIPjz6iVSaWDoXX45uBZmw209z5rIW0RbS5jXAvRa0tfJGgqiCYa6w8tv7vf
	jHqfMw2L20QuaA1ACTtb0cMVDXqkVX45573JlOaCeAiCmPx4NwMFrpUbb72MU1B0Hk1Q1KyLUZx
	EAlFPo846HM5rqDwqtH/Ur7hjyedK7zXtV0iAXShkFr+08pCvsXk/Kno2/3GQrWWgivZcMsQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--14.409000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 345688174BFC6B628DC1060872919099FB83A2E3B3575A0E4FC60CBDD92A46FB2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_221110_059223_E982A39D 
X-CRM114-Status: GOOD (  14.02  )
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

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSB0b3AgbWVkaWEgZGV2aWNlIGRy
aXZlciBmb3IgdGhlIE1lZGlhVGVrIElTUDdYIENBTVNZUy4NCj4gVGhlIGRyaXZlciBtYWludGFp
bnMgdGhlIGNhbWVyYSBzeXN0ZW0sIGluY2x1ZGluZyBzdWItZGV2aWNlIG1hbmFnZW1lbnQsDQo+
IERNQSBvcGVyYXRpb25zLCBhbmQgaW50ZWdyYXRpb24gd2l0aCB0aGUgVjRMMiBmcmFtZXdvcmsu
IEl0IGhhbmRsZXMNCj4gcmVxdWVzdCBzdHJlYW0gZGF0YSwgYnVmZmVyIG1hbmFnZW1lbnQsIGFu
ZCBNZWRpYVRlay1zcGVjaWZpYyBmZWF0dXJlcywNCj4gYW5kIHBpcGVsaW5lIG1hbmFnZW1lbnQs
IHN0cmVhbWluZyBjb250cm9sLCBlcnJvciBoYW5kbGluZyBtZWNoYW5pc20uDQo+IEFkZGl0aW9u
YWxseSwgaXQgYWdncmVnYXRlcyBzdWItZHJpdmVycyBmb3IgdGhlIGNhbWVyYSBpbnRlcmZhY2Us
IHJhdw0KPiBhbmQgeXV2IHBpcGVsaW5lcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lh
bmcgWWFuZyA8U2h1LWhzaWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0K
DQo+ICtzdGF0aWMgaW50IGlzcF9jb21wb3Nlcl9pbml0KHN0cnVjdCBtdGtfY2FtX2RldmljZSAq
Y2FtKQ0KPiArew0KPiArCXN0cnVjdCBkZXZpY2UgKmRldiA9IGNhbS0+ZGV2Ow0KPiArCWludCBy
ZXQ7DQo+ICsNCj4gKwlyZXQgPSBycHJvY19ib290KGNhbS0+cnByb2NfaGFuZGxlKTsNCj4gKwlp
ZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJwcm9jX2Jvb3RcbiIpOw0K
PiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiArCXJldCA9IHNjcF9pcGlfcmVnaXN0ZXIo
Y2FtLT5zY3AsIFNDUF9JUElfSVNQX0NNRCwNCj4gKwkJCSAgICAgICBpc3BfY29tcG9zZXJfaGFu
ZGxlciwgY2FtKTsNCj4gKwlpZiAocmV0KSB7DQo+ICsJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRv
IHJlZ2lzdGVyIElQSSBjbWRcbiIpOw0KPiArCQlyZXR1cm4gcmV0Ow0KPiArCX0NCj4gKw0KPiAr
CXJldCA9IHNjcF9pcGlfcmVnaXN0ZXIoY2FtLT5zY3AsIFNDUF9JUElfSVNQX0ZSQU1FLA0KPiAr
CQkJICAgICAgIGlzcF9jb21wb3Nlcl9oYW5kbGVyLCBjYW0pOw0KDQpTQ1BfSVBJX0lTUF9DTUQg
YW5kIFNDUF9JUElfSVNQX0ZSQU1FIHVzZSBkaWZmZXJlbnQgd2F5IHRvIGhhbmRsZXIgYWNrLg0K
U28gZG8gbm90IHVzZSB0aGUgY29tbW9uIGZ1bmN0aW9uIGlzcF9jb21wb3Nlcl9oYW5kbGVyIHRv
IGhhbmRsZXIgZGlmZmVyZW50IGNvbW1hbmQuDQpVc2UgZGlmZmVyZW50IGhhbmRsZXIgZnVuY3Rp
b24uDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJaWYgKHJldCkgew0KPiArCQlkZXZfZXJyKGRldiwg
ImZhaWxlZCB0byByZWdpc3RlciBJUEkgZnJhbWVcbiIpOw0KPiArCQlnb3RvIHVucmVnX2lwaV9j
bWQ7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICsNCj4gK3VucmVnX2lwaV9jbWQ6DQo+
ICsJc2NwX2lwaV91bnJlZ2lzdGVyKGNhbS0+c2NwLCBTQ1BfSVBJX0lTUF9DTUQpOw0KPiArDQo+
ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KDQo=

