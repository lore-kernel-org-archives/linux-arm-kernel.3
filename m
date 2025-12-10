Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89599D3C92C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 16:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS8yM1Ecs0dh8OickKL+/Ocl8N7OePJemyusdkF6r3o=; b=F3eyqzDaFNOzI30LMpHC1lCpzb
	46fZPCo2BuYQZ6t9DviPi4ZxDCXr7GdD9tVijTDl932okRVVTRiCtcqoO4qA3d5VfXcS6lTmtQ3el
	LMtMQefFkAjMQB9e14CIjE2gacqOJHUzxZu4m8C3NDfcn8lX6p/eBa8eVZdiaeVK91OpxIxy75JVQ
	JqfWDRCeOGIYy1yl/281mad+ec/lFH7wuY3EBtcPuASDE9P6kGNgjkRloPZqgR8fUvEpHlfgUJecH
	+MzRytf6bo/lXjqx+ELDN7r0mI+72UZxtjb240+fJewf3EEs6aB/rU/sS5cKAmWSEqXPhK6q0Mjxe
	cbaOVSqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMss-0000000Fd3W-1Cz9;
	Wed, 10 Dec 2025 16:17:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMsq-0000000Fd2o-1eGn;
	Wed, 10 Dec 2025 16:17:45 +0000
X-UUID: be540546d5e311f09f706fa2197c6ceb-20251210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PS8yM1Ecs0dh8OickKL+/Ocl8N7OePJemyusdkF6r3o=;
	b=nefIDEJbKELUja6h0vtmMhLTokcQKQgfHYgBE08GBFOtOxsONSEiiAOr+RlEp8MYBSneZZgAomMbCcOxcs3CiF174Syp1pwjB89tHic3vJAY5Yhl8Dh4Pwkiy7uT4w5z+tAzNVV/G0YpWqilIVXkBHx1PMVuGMCtReKPTgiX6G0=;
X-CID-CACHE: Type:Local,Time:202512100917-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:5fdb1f1e-2de7-42fb-84bc-724009563c1f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:cdb29f02-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: be540546d5e311f09f706fa2197c6ceb-20251210
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 185274646; Wed, 10 Dec 2025 09:17:37 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 11 Dec 2025 00:17:34 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 11 Dec 2025 00:17:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApDapDvgTSM8G6TitQiXs0Gr5fB61OAWDEyjxM2W3Es6OenAnEsNjDWGhSzS66kZ33wyccSyxgtx9l/Cg5HsDHNEbR36b+nMrs2YvBtdQV8ZEBkzNa327N/IGb7h79DvlI6UezV97ueBR6hvLVHIjHkXTLK1gbXkeYfvolXC92iIaduf5uHzxma88KLWJExQIeh/cFb/8FqXiQit4HlI7xsig3Q2wWuyoSuZ4Kode1SCK109VYY7w/3u7JmvgnUhV2GjZhyvtoij42VHxO3wVXkVKsRFkLsHI7Jw/khF7zuJyoUdlGemzjTky0OjhQg6fNj0IJvFyzqB08JDPVYdTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PS8yM1Ecs0dh8OickKL+/Ocl8N7OePJemyusdkF6r3o=;
 b=SvM7Tjht5h0CtLU1T2iY5Ty59W8sXaAJbWSV4X+MI+QKiiW0rKpN9aCQcJGU5n1oEWITfOsL9pMYv09zKsfzFrX8QbP2f3ysxAgOo40492hWy+U5o06v8lar4w9vvJ9C/DiTHk1UgYuyRX1jChDLoqTetIpX1mQU84zVIuWr/NvsYNUoFDCvJAZKNtyUc9uX/5OBE4snRyAJw5R2GAzGeSvLTt+QH3rl4U3/ti1UU6vXpqn6b4zUXa24NhnP9tTPJedEE7KN5pdXrMjlqpo+MtxKzLb/FZly8cMb7J3Dg5386a00QJgL4GXhPnDZ2L9YZi2QhqbwxSyNJyoaGDkGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PS8yM1Ecs0dh8OickKL+/Ocl8N7OePJemyusdkF6r3o=;
 b=BH3YH+D7mSTY9PjdiyWOOaDQ7lItilcQR1xKvT5g1MV0eIJWSHcoyFuKTg63CWQgWHptmHPLfo/qCOaP+H1oOGfKYnfZkMt2rV7RDTFJuCjcx65MF26aBC2qeGroLwhQ8kxzMwto4aTt/RM4jFy8BrSr3HZsMR3OVepksSVrGPQ=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by TYUPR03MB7230.apcprd03.prod.outlook.com (2603:1096:400:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 16:17:30 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 16:17:29 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	"kernel@collabora.com" <kernel@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?=
	<bear.wang@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA
 Genio 720
Thread-Topic: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8391AV/AZA
 Genio 720
Thread-Index: AQHcSNqWJe+QFQ6c+kKd0acOklXd8bUbTz8A
Date: Wed, 10 Dec 2025 16:17:29 +0000
Message-ID: <d631c04f62edac5d5ee131160c3b287534d6b2c6.camel@mediatek.com>
References: <20251029-mtk-socinfo-mt8391-v1-1-61412dcd9938@collabora.com>
In-Reply-To: <20251029-mtk-socinfo-mt8391-v1-1-61412dcd9938@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|TYUPR03MB7230:EE_
x-ms-office365-filtering-correlation-id: b2e96099-d614-44c8-3eb6-08de38079d87
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OGpISkp2eHNld0F0VG4vb2ZWNEhPdWUxVVpiNThDakNxYWNXWUFVUWI3WllP?=
 =?utf-8?B?OTIxN1gySTN1L3BtcnVkZ2srbHFZdWhXV2xpa2dLRmNuVGp4OVlGcURDS3BJ?=
 =?utf-8?B?ZzFkcFM2RnF6aGlncnNGclliTU5GczJRZnhQUE9UUC9RWTd1RVFkcFBGdWt0?=
 =?utf-8?B?aFdyWG4rc1orajMrTjkxOW5xUi9GdUQvM28rNTh0V0swN1NqNUpvYWxiMXdz?=
 =?utf-8?B?MWc5Vm14a2J0bzkrU3hZZGcxazVtNEl3czlybUpSUVRmaUNvMk5rdy91Ui85?=
 =?utf-8?B?OVo5R1dnK1NXUzJFQ0JWZ0hMeXJpZ0RuQnIxbjVjdzRwYVB2U2RNVlMwakMy?=
 =?utf-8?B?NVp2dE82U1lBdU9yckxzdHhaemQ2bFE2ZjFDbjhIMG8zck4rbzNCMmZTN3hI?=
 =?utf-8?B?Zy9Ed2RMMjZpQ3ladCtSZUdYWmZWZ1ltZlZ2RXFad0RsRklERUVSbEhuMTZl?=
 =?utf-8?B?Z3NXdzRMMVFWZ2RqMFExMmYzOUxBbFpTUHlIbUNNaWh0czZWNzYrblB2SUQ5?=
 =?utf-8?B?eFBJdnRoQXNhcytYWXBnQm4xbW5aREEybCt0MU1BQ0ZwODd2RHYyWnhtdXpk?=
 =?utf-8?B?Z3JHK3pIMVBBcHg4ZDhuR0xOVnFXanE1RTVjQU5mWWxIalgwKytRN0tOTWRP?=
 =?utf-8?B?VnJIdEVOMFZmL0I4eVFuN1pGeDFtRkRFclR1TWd0b2NvVW16emVKSmZuYlBu?=
 =?utf-8?B?VmFodEY5MmZxSUUvU3ZYeHdCVXBOMDBOZDAra05NR1JTY1IrTjUvMW1KTWtV?=
 =?utf-8?B?emtENEJFNGNlY1BLdklxTTkzWm9JeDVzNG45VFMzOFpXOEJXai9wRWRna1p4?=
 =?utf-8?B?TEZQVU9mNTlVOHBZbTRCWFdCS0QyMkx3a0g2WkNLSWFobjFhMGhCbklJZS9l?=
 =?utf-8?B?K1BCNTJ1MEFudktQbXB1dUFKWDFwSk0zTm8rSFJ5YzAwT1YxREE3SGxycmJW?=
 =?utf-8?B?M0ozTUtjVEdZTmpwa0VuOTc2WFdaamJVRDBpUXJOeGwvY09QQ3d3bU5LVGhz?=
 =?utf-8?B?eGxlK2pqSUk3c0ZBVWc3dXdiMWJMbTgvSUZWV0RaMmZWRE1SM09BdjNWdkUz?=
 =?utf-8?B?MTJoUnZFWjdHYStDU2dDWFk3c0NMT2tYMGpkRXJ1Q2k1cHJSaThBUzFwVDFG?=
 =?utf-8?B?NTFVakhPcHFMNmFVdHExRWtMak9McHJDRk0ybTNVS1IrRUFXeFZOZE1zYy9I?=
 =?utf-8?B?dXZsQUNyY21hd3g2LzlGaXZubngzZm5lQ0QzNTA0M0p2RjNzTHVDaGNSL0Z0?=
 =?utf-8?B?VE83bUVwclQrQmlNYjhxemZsd2NpeVE1RWtNSXAzTlNmNDZIUHdZMlkza2lF?=
 =?utf-8?B?VEJZb0pOWSt4TnE4VnFmTEhsVlIvWGVJS3V2c1RKYmVHcXlhM094VlgxS0dv?=
 =?utf-8?B?MXZLdFoyT3A1SGFETnhVVWhhWldXcEhxeVVJQnBHSm1MVHFFbS9KTkJXT01z?=
 =?utf-8?B?YVNYZHdsS2dBMWI4TUpxK2VjSmJVQUNpMFpkbkRaTnhrVjJ4MVNucjVjZDB1?=
 =?utf-8?B?VWRHbHJwb2tCK2ZxdE1qb2pSNk44ZFFRakJkZEU1KzJUY3l4SVNlMmdFb1NU?=
 =?utf-8?B?alVhTzk5czBqc0NCM0F5bUJPZnlTYk1FK01YODFEKzZFZXJDYWRwd0k2LzIx?=
 =?utf-8?B?eFZhc3dSYWxwZE1OZDg4N2pPN1dmdmtIcVBCYWwybC9ncDZGQVJySXQ3NWRG?=
 =?utf-8?B?NWxEWlZaZVd0MGFTUmNSTjVlbkNXYzBCdFcwRXB1UDREQlJSa3VvaENSaDRr?=
 =?utf-8?B?WThabEI3UUk4VDJpYXlPWWhGcVlaeFpOR04zZEx1NGJzU3gxR0xxR1VzazlZ?=
 =?utf-8?B?R0hpT2toblNKS1dhRHJKR212ZkZGdUc2WG5RbXNkb3h2Y1NiNWFqdC9QY1JF?=
 =?utf-8?B?MUc3VFdKM1kzQ2VGWElrWm9zUFF1ZVFPUUZ2Y3grdmEwdnRqdUNmcENoLzJT?=
 =?utf-8?B?c2xOR2tXTHpFTmdzTlFIOVRYd0Q2TEdDNG1iVVE0TnJUVkk4bzAxOVNVQWZC?=
 =?utf-8?B?VmcyQWdROHpzZmRNMnA5clFOMVNrMzAzUGhNeHhXNURPUWNOWThqSzFWaXlw?=
 =?utf-8?Q?CGk5V1?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjhROTN3cDFBb25qWUxqUzRCTnJJN3dKbEhkUytiU2tTeFpVc05Ga2NaeWxB?=
 =?utf-8?B?d3hLNDBGTkJxcWZNaXVoVlhvOGdNOS9KSEZxZGhEcHNKVS9oZTFlOXJtYTM3?=
 =?utf-8?B?T3QxM0Q4cEtUcS91YThiS1A0K3RVaDVEKzJlWWFkSFRnYzI2cCtUL3hqMVA4?=
 =?utf-8?B?U3pMcFU1ampLK29KOWp3RUFHZnd1Z3RnL0QzY2M2RTBzSFhtbFdQL1ZXM052?=
 =?utf-8?B?dGdQbzFXU3N1OGZEeEo0WXE2Ymk3ZHp3d3F1ZTNCVm1zY2ZLVGI3MWorY3dT?=
 =?utf-8?B?NHlUdVBqQjdmbi9pUEYwYmNjQWlTVFloQW1uMzMvYWdNTUd0Z2tlOE5rTGRS?=
 =?utf-8?B?dmwrZnV6Y0tDQW5zbjRtZUtjQnhRaFgvUXZ2OFl3TWJEbkRtUEdMQWkxWC9V?=
 =?utf-8?B?S2szdTJ3VnJ0aHBvTDNMdnJSS3dhM0VFMWk3Q3B0Q2VGZDVqSXhzVURicHBI?=
 =?utf-8?B?WS95T05NbTZxekFtMW9xV3V4UVEyMFZLQnRjZWpZVjlZQmsxU2NNSWRsY0pS?=
 =?utf-8?B?MW1jUERZek9GRm9GLzhvcjBPY09kdWR6RktmYkNSMStHUHRkWmlFVXlGcmZZ?=
 =?utf-8?B?R2ZtWmFUSm1qTFFpUEY3dmtWSHVGTVFOdkhpY1c1NDJaSzJtWmlkTlpRUWNi?=
 =?utf-8?B?MklmY3lhY0dFa1h2VkNTVitYdWxLN0pMMEp4U29VeUFpMGk1TTllVTR0QTQy?=
 =?utf-8?B?S2tPTjJIVUowMFQ3ZnFhQWs5NVkrU04wYnZ6QzZieFA4YlFTd2VNOEtGempO?=
 =?utf-8?B?WGd3QVlNQUE3YUtpN1lHSTh3azNHcHoxSnBKamcvcTBCaVFlaDZiUlBLaWhk?=
 =?utf-8?B?OS90QzNrUzBtYWdqZzMrdklpdEFSUXVHbVB5ZFV3Wm03K1F6WmthamRWbGtL?=
 =?utf-8?B?Ty9kZENLOCswL2lLUXFUM3AyTXlSK2lHSkRWL2c4K0FaN3ppSzQ5b090M2V0?=
 =?utf-8?B?RVVxbkZsdTZYZ0JFZkxlZHNTczFCVXN5dCtPb0NqZFZCeGRCcXNBUTFTNnEy?=
 =?utf-8?B?S0FkY2VzNEoyNEpTQk1PeW9sTU1yMVZkVVhPZzNYRFZxQ2IyQzBSWVVXcW9Y?=
 =?utf-8?B?cFZPUlB1dVQrSmZTTzJrTlp3TVNmU3piV2hjTWZ0OVpMSnlCdTdFSTlKS3ll?=
 =?utf-8?B?Z0QzNFpUZE1YN01Va1YwMFdwMXVBU0dxd2tTNGRLTVZuMU85aTYvK1FiN09q?=
 =?utf-8?B?QWs5UndWSHU5cE5uSnlHbkd6UC9OKy9UQmg5b1E5WURieHo4SCtKV0o0RDEv?=
 =?utf-8?B?SmF6VllsRlV5S0taS0szWVpGN24wZExTTDRXb3BETThWZFhFY0lXbHA3NWpm?=
 =?utf-8?B?YzREeVhlOEM2cCtHVkYyNzVPVUxpTUVkRzFLcEhObkN6bk82Mkd1TTJZSEJP?=
 =?utf-8?B?aUtWZm16ay9ULzZ5VmxYS2Q1UlliVTErNmx4cjdTdEFkNFZvTVcycHdMNGdk?=
 =?utf-8?B?Uy9OWlBoV0tOY2FPSHdKUXc2clltb1lmeEpFYU9nR0M3bUNpQ3VpVlI5Z0lW?=
 =?utf-8?B?RTVvdmQwVGVVenlFMlEvUDBsQUo1aEFiRC9LaUkyQUxZZlBYRWlzVnF3d25C?=
 =?utf-8?B?Yi9Ra016MEljOTNCVEFuZmdKL0NRMmk2Wm92OVU3blh2S0I1dVEzR1JmS0F4?=
 =?utf-8?B?cTZtUURZSDF1T1NoSlBqL0w3SFZTQmNJVzczck9kYVpMQkxwdlkxOGI3N1dz?=
 =?utf-8?B?RjFCT2J6Uzg2ekpvVGEySEM2bGFOc3hSQzBCMlFCWTRNWE9jRE5CQzlRb3Fl?=
 =?utf-8?B?STV0dXRqRitpK29EY3ZJNU5pbTBvN2xlaG4wUmttbHdCRGRTTVQ2aTh5K3o5?=
 =?utf-8?B?a1F5NFhrUG5qNnlnVWVUUHVNcjJ5bmZLcUpFdFlUUEtOSW5CekFOUVMra1JU?=
 =?utf-8?B?ZE14L3Vwc3BpT0gxbFVENmdqYjdiclVjOG9pc2VNc1lPOHFtSkp2T0F1VHFV?=
 =?utf-8?B?UXRIL1o0Z2Zvd0JubWVudDNZN1dzTkFrRUhVQmVZcWlhYWV6YUNnSHpXUDRa?=
 =?utf-8?B?aWZ5c21YTW5rQ2xTQy8rVlBVUFFUeDRQcmsveFpTRnNSSVpSMi8yYnFPdFh5?=
 =?utf-8?B?d2pDUzU0UEJ4d3B6QjhFbG15ZWhNN2Jodi9Fa21kZWhiLzBUSHZFUE4yZnZQ?=
 =?utf-8?B?UWtWM05KakpqYXVqK3c1N0IzNXFTLytqOURTaitYYTMwRUh2UUNGUVZFWU9l?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4710F3A933C3944B990EE43AA5C7FBDF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2e96099-d614-44c8-3eb6-08de38079d87
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 16:17:29.1429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5siBgLUWJOZQS1Tar9A5A0lzwi4lgEQ2dqPPZm7NXynoCOYrTiiug9MKRvUcoX+ScqWD2jNayf6mLsXoEcs9RSGUuYk1Da8eclpy3+9iRp8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081744_468753_6EFF244F 
X-CRM114-Status: GOOD (  15.68  )
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

T24gV2VkLCAyMDI1LTEwLTI5IGF0IDE0OjQ2ICswMTAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYW4gZW50cnkgZm9yIHRoZSBNVDgzOTEgU29D
IHdpdGggY29tbWVyY2lhbCBuYW1lIEdlbmlvIDcyMC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExv
dWlzLUFsZXhpcyBFeXJhdWQgPGxvdWlzYWxleGlzLmV5cmF1ZEBjb2xsYWJvcmEuY29tPg0KPiAt
LS0NCj4gwqBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstc29jaW5mby5jIHwgMSArDQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
b2MvbWVkaWF0ZWsvbXRrLXNvY2luZm8uYw0KPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1z
b2NpbmZvLmMNCj4gaW5kZXgNCj4gYzY5N2EwMzk4ZDkxN2MwOTQ0NjYxYTc1NjY3ODI0MzY5Mzcz
YmEyYy4uNDRhMjFlOTFkMTU5YjkzZWQxNTQwYjU3NTRmDQo+IDU1MTJkMmQ5YzNmYzAgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1zb2NpbmZvLmMNCj4gKysrIGIvZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLXNvY2luZm8uYw0KPiBAQCAtNTgsNiArNTgsNyBAQCBzdGF0
aWMgc3RydWN0IHNvY2luZm9fZGF0YSBzb2NpbmZvX2RhdGFfdGFibGVbXSA9IHsNCj4gwqDCoMKg
wqDCoMKgwqAgTVRLX1NPQ0lORk9fRU5UUlkoIk1UODE5NSIsICJNVDgxOTVUVi9FSFpBIiwgIktv
bXBhbmlvIDEzODAiLA0KPiAweDgxOTUwNDA0LCBDRUxMX05PVF9VU0VEKSwNCj4gwqDCoMKgwqDC
oMKgwqAgTVRLX1NPQ0lORk9fRU5UUlkoIk1UODM3MCIsICJNVDgzNzBBVi9BWkEiLCAiR2VuaW8g
NTEwIiwNCj4gMHg4MzcwMDAwMCwgMHgwMDAwMDA4MSksDQo+IMKgwqDCoMKgwqDCoMKgIE1US19T
T0NJTkZPX0VOVFJZKCJNVDgzOTAiLCAiTVQ4MzkwQVYvQVpBIiwgIkdlbmlvIDcwMCIsDQo+IDB4
ODM5MDAwMDAsIDB4MDAwMDAwODApLA0KPiArwqDCoMKgwqDCoMKgIE1US19TT0NJTkZPX0VOVFJZ
KCJNVDgzOTEiLCAiTVQ4MzkxQVYvQVpBIiwgIkdlbmlvIDcyMCIsDQo+IDB4ODM5MTAwMDAsIDB4
MDAwMDAwODApLA0KPiDCoMKgwqDCoMKgwqDCoCBNVEtfU09DSU5GT19FTlRSWSgiTVQ4Mzk1Iiwg
Ik1UODM5NUFWL1pBIiwgIkdlbmlvIDEyMDAiLA0KPiAweDgzOTUwMTAwLCBDRUxMX05PVF9VU0VE
KSwNCj4gwqDCoMKgwqDCoMKgwqAgTVRLX1NPQ0lORk9fRU5UUlkoIk1UODM5NSIsICJNVDgzOTVB
Vi9aQSIsICJHZW5pbyAxMjAwIiwNCj4gMHg4Mzk1MDgwMCwgQ0VMTF9OT1RfVVNFRCksDQo+IMKg
fTsNCj4gDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogYzlhMzg5ZmZhZDI3ZTc4NDdjNjlmNGQyYjY3
YmE1NmI3NzE5MDIwOQ0KPiBjaGFuZ2UtaWQ6IDIwMjUxMDI5LW10ay1zb2NpbmZvLW10ODM5MS0y
NjBhZTljYzZmNjENCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gTG91aXMtQWxleGlzIEV5
cmF1ZCA8bG91aXNhbGV4aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IA0KPiANCg0KUmV2aWV3
ZWQtYnkgTWFjcGF1bCBMaW4gPG1hY3BhdWwubGluQG1lZGlhdGVrLmNvbT4NCg0KQmVzdCByZWdh
cmRzLA0KTWFjcGF1bCBMaW4NCg==

