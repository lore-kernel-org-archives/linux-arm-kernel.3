Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7A5CF64AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 03:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bDW1wHHM2KQAYkuoFk3g5C4dUqj59ppmEnHbfr7IZU=; b=czXQhhy/BvSoxnd1lfSO0k4Oj9
	g9M9UmxVcSFc0Z8F2LIdaSzAzDyB+79oUXxsYdB6oKDLdOyTJJXIWl0Cxl96mJ5HZBcbZaVNY1Xwn
	8ZfNeDHlPKmEhjW2Zkbj2mJ5TiTezfZlUl2LT8IFQzj4aAuTz4hoakTY8kjaZFf+pgsOi8D0BqXyH
	cNR8Uu15b0lQUok2JK8ODbpQ/T3ZkeSkr0lny1ta+3quO5p4ZT96pHPKP6lC1pz0/4LbgDOE+3Ay9
	vE1Zto/iokysF4+LmmtOrg8bcUYVyDTXFYSubdM8W3CtqXQ3Utll5CcHSpwSTK5UlPniV8TbkmjUh
	xkaEStiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHmi-00000007lQD-1yVf;
	Fri, 21 Nov 2025 03:26:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHmc-00000007lPR-2RdF;
	Fri, 21 Nov 2025 03:26:06 +0000
X-UUID: cc837e94c68911f0a52f393f94899d25-20251120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=5bDW1wHHM2KQAYkuoFk3g5C4dUqj59ppmEnHbfr7IZU=;
	b=nQCCCMXmYDlzKZCLg+tGlt7DTlzE673jmyro5fSBYLdQDcM7cjYiPhLiqKL3xy9taJQAprZSueTIELdJTfYvCfghFM9oFLpDPqIKnro2A133EPU0RkmFw0NuoORCESTZJ1QFQ84Z3b5zAMjAUE8c8uFr5S9QP4bc/9SuO+DaNAk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f0993f2f-a052-4770-83c6-232771be5f3b,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:60260abb-0c02-41a0-92a3-94dc7dc7eeca,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|80|1,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,AR
	C:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cc837e94c68911f0a52f393f94899d25-20251120
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 607121303; Thu, 20 Nov 2025 20:25:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 21 Nov 2025 11:25:56 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Fri, 21 Nov 2025 11:25:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbkylKr0c6sXrNC3EKCyWfeoTPT79kTUZeKdVYGdVaTG8WOzS49z+5NSzg4+oSrice/ZhSVmOoycpYOdt4fYlMIPv3CJkI055yZzRDP0gQa66w+ouU3DnWQv/FHPHLCJt46vVqBySgpOwMIGID0N1l7vj1FVGjG22ZDmkfJvqFhMhw1mrrOg6qgvYFb1n0ZLodJtwiW8gm5gHYg8k6zBGPuVQR7DASUswYKvbpeXjU9FFudu6/RwwAuYwhkKQAQbPzM086CoKhWyPVUABIK8DcHqLcBe7HepDtBFYm4hXIsUk2yhg4MW9jLbBnon2rtNNHMlna/UsnRE5y1ASXlnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bDW1wHHM2KQAYkuoFk3g5C4dUqj59ppmEnHbfr7IZU=;
 b=j+SozUAs7vkO7mc7YAsR2sj0dTjzBGnZFdHTCUwOux2kOJbLAUoZHCxyUFzXIHwRSTmQd2DDAvxrS1euvjkmmaIuL8FiGtbLZqANN5lqpWaUOpSyVkjOvtqaRJa0peyszWy2SW8ejB/uweSsZCOdnwKZ5Anuv25Ev+Cmo3Fx80y7vt72I78qNeMybLZsIUfH5l1EcSJ/xGjP10ZXJnNflh1FeMFzutoZQd5KqaRgNpXNt01SmyVWGyabViRtD0vOwQSDha0CzfW0Dj03PmDGGtdL+camqIFA/AtKVz6VPdXoDlDD6XPJAUDslLkKyXiB0etwUvumQzKKyk7/TzELwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bDW1wHHM2KQAYkuoFk3g5C4dUqj59ppmEnHbfr7IZU=;
 b=p164k4DWGtKJsFbrO+eftkddpMt8EWZZQDJke2cTjphAq+nxCAgQdUZ3fFzhBE0QH2UdZ/6GZXjWEv2Eqtip6apgNvrMFyxZkb5kZ3QdfljdDD0CjT+1OI6FXSunaOqSxNx0//MeAw3pU0Vb3lmfOE13Gnb57lOPzoGAPbGiTqU=
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com (2603:1096:820:88::11)
 by PS1PPF948F3CF10.apcprd03.prod.outlook.com (2603:1096:308::2e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 03:25:53 +0000
Received: from KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc]) by KL1PR03MB5974.apcprd03.prod.outlook.com
 ([fe80::35d:48c9:580e:b5fc%2]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:25:53 +0000
From: =?utf-8?B?U2h1bnhpIFpoYW5nICjnq6Dpobrllpwp?=
	<ot_shunxi.zhang@mediatek.com>
To: =?utf-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	=?utf-8?B?VmluY2UtV0wgTGl1ICjlionmlofpvo0p?= <Vince-WL.Liu@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>, =?utf-8?B?SmggSHN1ICjoqLHluIzlrZwp?=
	<Jh.Hsu@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: mediatek: mt6359: Add
 alarm-sta-supported property to RTC node
Thread-Topic: [PATCH v2 5/5] arm64: dts: mediatek: mt6359: Add
 alarm-sta-supported property to RTC node
Thread-Index: AQHcWhfht79uoY3wQEOoICjNRvnL27T7khiAgADmyoA=
Date: Fri, 21 Nov 2025 03:25:52 +0000
Message-ID: <5409636fbc6cbbca6158da5ec2b8920653e9b396.camel@mediatek.com>
References: <20251120121805.6775-1-ot_shunxi.zhang@mediatek.com>
	 <20251120121805.6775-6-ot_shunxi.zhang@mediatek.com>
	 <14caa2fe-e1fa-471a-8c6c-aafd4aaff4be@kernel.org>
In-Reply-To: <14caa2fe-e1fa-471a-8c6c-aafd4aaff4be@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5974:EE_|PS1PPF948F3CF10:EE_
x-ms-office365-filtering-correlation-id: f67b3187-2bd9-41e7-f32c-08de28adad00
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700021|921020;
x-microsoft-antispam-message-info: =?utf-8?B?OUdHWmpleDA2WjhlQjNRdTBYUFJTMFlwTDBwempYYlBUajdUZXI0M3FMWjZS?=
 =?utf-8?B?QUNOZ1RJSXlvWDRvQTQvRUprSkxaYUh1cU4yNkVhME9PakhHeXRBaDh1MExn?=
 =?utf-8?B?NVAvNXEvcW9KTHFTb2FWam1sVndocXBhQkhrMTFZaE1DTGhsZTlDQjl4Rkla?=
 =?utf-8?B?eUoxellicm9Vd1F3N3JYenIrb2dxL21rVXRGeW9tQk1WY3cwZFlibkR1ZW0v?=
 =?utf-8?B?MmpxREppNXRLQnlrOGVPNm9rS1hoaHl5MlR0dHBJM0JhVmxkZ2o1ZUhxbUpw?=
 =?utf-8?B?dG96V2UzR0psU3JEYkt3aFFHbkl2WWN6UGV4ckNrcHl5V25BRExna0Iza052?=
 =?utf-8?B?b0tjcnJUaHBiL0pWQ0N4cEtsb1dwenU0TnU2UmJQWVY0Nm5KT0FobGdGczQw?=
 =?utf-8?B?YUs5OXplam8vU201RGpjZ0N1VHRGUmo2c2FMZVdVSldFaU54Y1IrWDNGS2Fw?=
 =?utf-8?B?cVVvY1ZFd3RlSElvWFJSRGN6S2ZkQkRUUkRWUnJNZXFDNDZIVkRzM0NKWkNt?=
 =?utf-8?B?SlI5UWZncnNxNmNsbksyWkhBYkZDR05OYVZLR1VtT2tQWmVRaWlDcllnWmRP?=
 =?utf-8?B?aWV3Mll6ZnhUK1M2dDlPVUJzV0szR0JwMUp3U1AzTEh2Ri8yNmpkU1pQbWlZ?=
 =?utf-8?B?US9YRVNON3ljM0NJQTR0VEpkdHdUY2RoNCtEQUE3ZmMzcG1FSGdUTDNQRElC?=
 =?utf-8?B?YjYzMzhpRmlOV3ZOZ1JIZWxXY0x6NkRleDdBdXlpcHVINmg1ejc5cVh6aFQr?=
 =?utf-8?B?eThSL0pVNVNJdlFZTTdBVVFPWWJFbnpSblNaU3JpMXhwcUNxa3FJK2ovRGFn?=
 =?utf-8?B?YlNEeExIeG9jbXhJVEhwU0tmenBLM2xyQWNmcC9pOThyNXhxMno0eTh6NEZw?=
 =?utf-8?B?c09uNUsvWWhCaWxVWWNrOVJlSWxFR3NMMDRoaXpJMzh6RG5xUldjQzlNZUNL?=
 =?utf-8?B?alNXbWF3WHRyU0c0cHhJYmI0SlU5OFFJakZPaEc5WDNzQ1VjUWE0ZkFvejVS?=
 =?utf-8?B?bVR0UVZZd2l6Sm10dVJWenJCbDZieTlHSXhxanl2bHRtK09LRGFjL2pyTEJR?=
 =?utf-8?B?eVI1Q3hadHJPT3FONzFxV05Lb0dMcVA3cTZDd0lvUzZ3ZFZIckIvVm1QSGNE?=
 =?utf-8?B?d2I1dEd6SHIwcEpTbWZWRUp1OGp3VkpLUjdJZHFwckxLdzRYMkhMWHZIWnVE?=
 =?utf-8?B?YTZ3clNsRU5kZHp3cHFXVmk0em0xcEJnQ2pUeTg2TXByK2tsUk9VRlZmRkd0?=
 =?utf-8?B?dU5wVjA0WE9OckIwNnUweU5MRjVMYUtITnM4MXhobkwxUG9QNkhRVlgzck16?=
 =?utf-8?B?Wm1yTTZSWVhKSGszU1FSTmUzOW41czF3REMrelpNampMSmE2ZGU3ajdEQkZZ?=
 =?utf-8?B?dmNUaFh6SXptVE5NNlllS0lMR0hocWJRUzZhcHl2MzM2ZlBCc2Q1VGh0MzZH?=
 =?utf-8?B?aERCNklQbW5IenFRaTlLYUZQK1c0UjJJUCtQcWc1cUVWSE0xL1hMSi9hVlZt?=
 =?utf-8?B?TE5vay9Xa25TOWxUaW5nYzJrNjd5YnNuT2NSTXJGa2hFcW5aSFUvdzc2NEhn?=
 =?utf-8?B?dnB4cFNzZXl3YlJ6bGpNU1VPdWJzdU9LdkJkUC9pczBSQ1l2a3BuSlBmMHRV?=
 =?utf-8?B?T1JkSVpldzBndzhzUUlkSVl4N2dGMjl3dzh0TGJEUVZTOTZaQ0xvNUlmdWFm?=
 =?utf-8?B?Tk83WVRMbjJXQjcvQ1NSUXdxb1RNV0UwaU1KV0pmTjk2b0FQeWx1c2hKSGZV?=
 =?utf-8?B?TW9sdHFsanVqT3g0WGdGV0UvWW9yeld6MmFNNDJuQlVBVTJScWhENU1CMDg3?=
 =?utf-8?B?NFlvRzBBNHc5Y0xVRUMvZ2Z3ZlRLQWZuYlVDK3A0dEV4UXBaTVNoVjhiVS9k?=
 =?utf-8?B?MlRoeERjMmJqeVYvdFZWdnczdFAyN0ZuMGNUVkNwWGJHS2lMdUZ4cFc3RmN4?=
 =?utf-8?B?TFBRL2xjTXgzOU1zLzArOXFHRElKWjJwU0dST3ZGWFEzejE4Z2p3WVo3cHBs?=
 =?utf-8?Q?SJ4KTplJ0w+a+BtcNo5QWoTX6phhwM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5974.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHhPYVY5WWpnRmVMSSticEZGZ09melZ2UllkMGhGeVlrZDBYc24zQzVoK0x4?=
 =?utf-8?B?OEwyRUZ3YWY1QXZpQlRmZXVzWnhEZWlydVpmU1BlalJtK29JTTFseUZBYnZz?=
 =?utf-8?B?blpqN0tmaVJ0NjkwVXNTblNCYW5EMGVkeFBBdkd0ZngyR2JwSVh4aTFBKzFj?=
 =?utf-8?B?cmd4Nlg3TWV1OGRpQ1dtSVBOaTJnWEE2RjB5dExpRitFMndxd1FPUWNnSnNE?=
 =?utf-8?B?R2toMG9vWnJUSzR1Z29uWmJZdERRaGdjTjNxODEwUzEyVGpSVkhKY211WkVt?=
 =?utf-8?B?dHdIejRxNHRnZTlmbUQ4QzhMTjk5VTNyNkovclN3R0ZVSjN4SWhCbXRQOUw0?=
 =?utf-8?B?TEY4UHpqbHRKZUQ2bzNMZXBjaXQ1OXlvTG5CQTNJRENyb1VMTVVpTWdHRktz?=
 =?utf-8?B?bE1NdWIzY2k5aTdrODFwL1ZoVzh5UElWQmwyRkV2ajA3NjlNUXpuQXhybCt4?=
 =?utf-8?B?WGFkM0k0NS8zK3VKM25RNnU5NDQ5bnRIZmlyUGhWY0xZbTJTRUZUYk52RFNV?=
 =?utf-8?B?elllOW12QWczZGJHdVQ1L0FqMkRGQVlZeXNyU25DblFNNUVJSmVXSGRMRlpT?=
 =?utf-8?B?WS9kdFhnNUZsSVNwMFhQcVUyZURCYVdMRkRpRG1hQ3RjT3NrZmJYNjA3bEhr?=
 =?utf-8?B?SlhJaUlMNjBzQVN0NDl0cXJwN2o4QzlFbnFlRmFhR1hBYkNSaGlJbTMrWkY5?=
 =?utf-8?B?NFMwMUdRY2pkV3V1NFBkRldtZHM1U254by9SSEhGeUtlTEdFRFZlZU50WjUx?=
 =?utf-8?B?NkpaU1hJWnE3eFNwdzJBZ09kYjR6b1hsMmVITktqV1BZaklGSjZjWEZWSFJN?=
 =?utf-8?B?aUtTdWY5MGYrZW4zVUM5WlY3NForekVPTUVlcXlFSU13K01PNzA0MTc1MmtN?=
 =?utf-8?B?SnpMMUh1Y3duaHZsUWdnYUZvUXVTOXdtY2daV21CajJhUzFEYWYyRHB0RVA3?=
 =?utf-8?B?aW9sOG0xTklUTFlQUVRGSENTUSt2TGMrU05NUTZRQmlobXF6bXQ1UjJNMmlL?=
 =?utf-8?B?TXgxL1UyTUpCSUY1VHl2NGV0NG1td0ZPeWdnUmZ1c21QMnpjNzRwVGxLbVlh?=
 =?utf-8?B?TkVHTHIxV3pZWTVjTkJYemFJc2RjYVVPbVg4anQrb1djZ296U2Z0S1JvZEx6?=
 =?utf-8?B?SmhJd1pQYkpFamI2em11djgxYzc5QjFReHh6blJ5Q1Z6RHVMaWNJOE5MMGFs?=
 =?utf-8?B?Wm92ZDY4K3FZOXFJaDBEVDFsS2w3eFh4cTAvL0NVdDlTN1JNY0NtYjdtQWRD?=
 =?utf-8?B?VUxQU1JQaEdYeWNocTlsTFoxUUhHSnUwVFI4UW8yNWJnOFp1c254RGx3NTc5?=
 =?utf-8?B?b3NKUUh1RTdGRmJFRDNpZnpLajRUd0o3QVhNNDhTTHRoMEp5akhaYm1idXB6?=
 =?utf-8?B?NmdxM0tCdk1HVEZnb09TM0FtS3ZxeFprbU5YREdTd1pFdE8yU1pLMmhDcGhL?=
 =?utf-8?B?eFlHTHdRdDU3eUdXd2RRZ0l4ZHJNc0treUhzYmpYNGJQZVZKZTNuamk3d050?=
 =?utf-8?B?bXl3TU5mRlJxQzIyeVg2WUxkR0wzVTJiZDhPSzlzVklWaklrTGxXVTRkcXpp?=
 =?utf-8?B?Zk15K2VESXVMWnBXbGk3MzJIZ3A1VENuTk01SHFXL0R0L1pYSWZNUllVdE1m?=
 =?utf-8?B?SzZhSHEzc3JSMHVKWkswSlA5TzJQMEdzTWh5Mko3dnBmTlFWZFM2d2x2VFVi?=
 =?utf-8?B?M2JycW1yck4wNmJOWmJoTTRPS1AvV3VhMGtvM3VNakFaOGNxQXB0YURmTUxH?=
 =?utf-8?B?aXgrUzRjR2c5cXdBMXB3OXd6U2lkbi93ayt6RFk1MnQxTHZJaUE3QUpoNDRM?=
 =?utf-8?B?OWtSYWVEUFpkYlo3Y1V2d1RRSmZORDYyVnZUbHZFQ0lpa0FHU25pcHN1UU5p?=
 =?utf-8?B?U2VHK2dQTVpzdk9IUnVnektIOXgrM2dBbjJlQ2JnN0dSVU5TVlB1Nk42cnFy?=
 =?utf-8?B?bHRlY0s1ZERQenhycUJoajNNTktQVXBDWkRCczV5d3ZTd3FlbytMZWRqcVFY?=
 =?utf-8?B?RmY5RHV1YnhIY3l6cWpQdThGUSszZW1uSlYwMFFURmFQTitwbDF4NHZ0bGhw?=
 =?utf-8?B?N1h3WUFoU0pONjYrdHpqMElQWXRJSDQxZ1NqU2lCKzNFVU5QNTdncVhmc3dr?=
 =?utf-8?B?ZGtpYWM1MU4yVEFJYzlqa1pzalduUVE0a0FoeldxRDEyM1ZWRG8rKzhkSzBy?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9C921D0AE1D68469CACB2778A8E1B24@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5974.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67b3187-2bd9-41e7-f32c-08de28adad00
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 03:25:52.9873
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PQ4fg7H3Yrw3tnn8J0qUWxg5X5Nd0DnRyUQHN6LTHGI4d86k1I7pboWOK1AxHpJrEaKTi36BPTklHfmP4oBcVBzy4yYaefdgs2p/JsHGIi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF948F3CF10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_192602_663145_EDB69417 
X-CRM114-Status: GOOD (  22.97  )
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE0OjM5ICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDIwLzExLzIwMjUgMTM6MTgsIG90X3NodW54aS56aGFu
Z0BtZWRpYXRlay5jb20gd3JvdGU6DQo+ID4gRnJvbTogU2h1bnhpIFpoYW5nIDxvdF9zaHVueGku
emhhbmdAbWVkaWF0ZWsuY29tPg0KPiA+IA0KPiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUgJ21lZGlh
dGVrLGFsYXJtLXN0YS1zdXBwb3J0ZWQnIHByb3BlcnR5IHRvIHRoZQ0KPiA+IFJUQw0KPiANCj4g
DQo+IFBsZWFzZSBkbyBub3QgdXNlICJUaGlzIGNvbW1pdC9wYXRjaC9jaGFuZ2UiLCBidXQgaW1w
ZXJhdGl2ZSBtb29kLg0KPiBTZWUNCj4gbG9uZ2VyIGV4cGxhbmF0aW9uIGhlcmU6DQo+IA0KaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y2LjE2L3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJz
dCpMOTRfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IWxHNjBRN0ZvQ2xMWktwbE5GNkJaTW0yRl9LNDQ1
QXRwMWZObkZlQUJBMjR6eEdiRXNCMllwYkdTNG1qZUE5OUlyNTNJVWxNM0dRVGJIUVlXZzFpSiQN
Cj4gDQo+ID4gbm9kZSBpbiB0aGUgTWVkaWFUZWsgTVQ2MzU5IGRldmljZSB0cmVlIHNvdXJjZSBm
aWxlLiBUaGlzIHByb3BlcnR5DQo+ID4gaW5kaWNhdGVzIHRoYXQgdGhlIFJUQyBzdXBwb3J0cyBh
bGFybSBzdGF0dXMgZnVuY3Rpb25hbGl0eSwgd2hpY2gNCj4gPiBpcw0KPiA+IGVzc2VudGlhbCBm
b3IgcHJvcGVyIHBvd2VyIG1hbmFnZW1lbnQgYW5kIHdha2UtdXAgZXZlbnRzLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IFNodW54aSBaaGFuZyA8b3Rfc2h1bnhpLnpoYW5nQG1lZGlhdGVrLmNv
bT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDYzNTkuZHRz
aSB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDYzNTkuZHRzaQ0KPiA+
IGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDYzNTkuZHRzaQ0KPiA+IGluZGV4IDQ2
N2Q4YTRjMmFhNy4uNjJhMmQ3NDVjOGQyIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9v
dC9kdHMvbWVkaWF0ZWsvbXQ2MzU5LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L21lZGlhdGVrL210NjM1OS5kdHNpDQo+ID4gQEAgLTMwMiw2ICszMDIsNyBAQCBtdDYzNTlfdnNy
YW1fb3RoZXJzX3NzaHViX2xkbzoNCj4gPiBsZG9fdnNyYW1fb3RoZXJzX3NzaHViIHsNCj4gPiAN
Cj4gPiAgICAgICAgICAgICAgIG10NjM1OXJ0YzogcnRjIHsNCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDYzNTgtcnRjIjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgbWVkaWF0ZWssYWxhcm0tc3RhLXN1cHBvcnRlZDsNCj4gDQo+IE5BSywgdGhl
cmUgaXMgbm8gc3VjaCBBQkkuDQo+IA0KPiBUZXN0IHlvdXIgY29kZSBCRUZPUkUgeW91IHNlbmQg
aXQuDQo+IA0KPiBJdCBkb2VzIG5vdCBsb29rIGxpa2UgeW91IHRlc3RlZCB0aGUgRFRTIGFnYWlu
c3QgYmluZGluZ3MuIFBsZWFzZSBydW4NCj4gYG1ha2UgZHRic19jaGVjayBXPTFgIChzZWUNCj4g
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3dyaXRpbmctc2NoZW1hLnJzdCBvcg0K
PiANCmh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3d3dy5saW5hcm8ub3JnL2Js
b2cvdGlwcy1hbmQtdHJpY2tzLWZvci12YWxpZGF0aW5nLWRldmljZXRyZWUtc291cmNlcy13aXRo
LXRoZS1kZXZpY2V0cmVlLXNjaGVtYS9fXzshIUNUUk5LQTl3TWcwQVJidyFsRzYwUTdGb0NsTFpL
cGxORjZCWk1tMkZfSzQ0NUF0cDFmTm5GZUFCQTI0enhHYkVzQjJZcGJHUzRtamVBOTlJcjUzSVVs
TTNHUVRiSFIyVUVFQ3okDQo+IGZvciBpbnN0cnVjdGlvbnMpLg0KPiBNYXliZSB5b3UgbmVlZCB0
byB1cGRhdGUgeW91ciBkdHNjaGVtYSBhbmQgeWFtbGxpbnQuIERvbid0IHJlbHkgb24NCj4gZGlz
dHJvIHBhY2thZ2VzIGZvciBkdHNjaGVtYSBhbmQgYmUgc3VyZSB5b3UgYXJlIHVzaW5nIHRoZSBs
YXRlc3QNCj4gcmVsZWFzZWQgZHRzY2hlbWEuDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBL
cnp5c3p0b2YNCg0KRGlyIHNpciwNCiAgVGhhbmtzIGZvciBjb21tZW50czsgSSB3aWxsIGNoZWNr
IHRoZSBEVFMgZmlsZSBhZ2FpbiBhY2NvcmRpbmcgdG8gdGhlDQptZXRob2QgeW91IHBvc3RlZC4g
SXQgd2lsbCBiZSByZXZpc2VkIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCkJlc3QgUmVnYXJkcw0K
U2h1bnhpIFpoYW5nDQo=

