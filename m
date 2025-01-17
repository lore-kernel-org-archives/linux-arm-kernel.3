Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4040FC02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 10:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9yMuwv/n6ToQlk+ouPvfDDzCe3d/7YQTm/r0EHRbxKA=; b=kG0gtUjWoOiz/Zh3l63OqLCBQt
	cPXWG1dliLa+UM0zjfM4ksdNuetPf1cSMzG+X5vKhed3Yb7J1HgfT3LvZzg9CpO8hirFkd/RCmvW4
	3fT2o6Zy/vx1eP1D5HnUb8zLGEG1iJltWVgiRFJg1KFRhYQiTZClsE6jIPpkJjml8cnaj3GA4HndA
	Qlj3AcsCMOvMEp1V1Seqd1uLfmg3oTh7cwscMhigp1B8paKZvsgKquHg4axzbvh/xqEgnvD6mLFYV
	UdO3ophnaqUtCScmEJHoo5VcI7xaMsCdsz2wXwURphnzLSeAt9YXsc+AA/v6JKZJSr1Il9i8YdmYp
	Ach7VNxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjjN-000000002qF-0bTJ;
	Fri, 17 Jan 2025 10:37:37 +0000
Received: from [216.200.240.185] (helo=mailgw02.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYji5-000000002b8-3U6O;
	Fri, 17 Jan 2025 10:36:19 +0000
X-UUID: dd2a9768d4be11ef9048ed6ed365623b-20250117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=9yMuwv/n6ToQlk+ouPvfDDzCe3d/7YQTm/r0EHRbxKA=;
	b=LecrVGaYKqLygd5sH4DU65rSyQ7x+6hOmpXoI/LswD0eaAt7rY4v1xL0Hp4zTiIPSv51RFHnzbpiQJLsr2yKKtFZl9aNDQu+6qex3JRh4IFZ7zL8K+Y5vUZz2A7VDi7TdOr5EpcrTndA0GGmsoYdeGGzeI0fhMFsdQmZutGWG/U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:fb03aabb-7218-4812-8f35-c2e91c29dd04,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:421c3385-0f10-4f52-bb41-91703793d3e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: dd2a9768d4be11ef9048ed6ed365623b-20250117
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 509552496; Fri, 17 Jan 2025 03:36:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 17 Jan 2025 18:36:06 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 17 Jan 2025 18:36:06 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcavLo+/HN3A6OQb9j27hJJ7jeXn/KDWk67GGR1dh/K4AwhRurUSy6HZu/ldDecNAmMISHhIo9WskwA1HqrB3wdexX4f+EClvYAXaPTBnVqcMOiNPHok57v0RThx+cXf35EvtCnOzPu7vi9laA7wilpqqorzkBb82/ERqSEGbTJfDsIQj7RYZT6FeD/6bezpb6ZDMVZxb0NxTGVMTSDLrn7TsOIEnFUhvIu+qwzE8BlMFMs1F6feqloWgla8NWZiSC6AuCo0T3pqUUVujnoaxhvSdeyCV9RkXtMbEudKjHKEqKv76AjMqRBMejvlRXOxdSpcv/J5udp7BrHNbKDj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yMuwv/n6ToQlk+ouPvfDDzCe3d/7YQTm/r0EHRbxKA=;
 b=L+QCA9DMyBx1JSvkQvdiyvmtFgzzE0zJWK3pkR4uYtxh3Cyv/ePiPzj1RPfyTQmHjUSKMWe4pkweCT/w7inCF1cY8FskfjOnuWfoyiBLpV2F8wLzBKYt/WZzUUX9TsunzpsnW/fknF69zW3TTP1UdTMFfojY2Oxtp/pR0UqUvolnpfXBFOjKLoGO2l49jvclNv2yIc9xfe53Mp0knZUr2cGHMEt26Ib1I8aro1AZUzMwKoMY/qgKT1KbG+Sdh2isCoNKwlSMQQDCspvCKrAGu7QhLfJwAD07cGDltCIqnmpKiEvzwhT4UH2/v0HwoDhC63PRL1JlFTdELmqDMdeZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yMuwv/n6ToQlk+ouPvfDDzCe3d/7YQTm/r0EHRbxKA=;
 b=hPPLKXb5V4rRb7mLnZNVkWdPxKkengz1nGRCH4FrHufGwMiJwu0mB7EWxUTBDzQjeFoDiX6s3Tl28CIqu5fYqHymZ5cx7mhgG3R1qHtWgjsAMUTbwfMB6jjibgniEQj6yt5orI9XkfOejAt1c6C8o8tCe39hVyj/mEf3RUf8dAw=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 OSQPR03MB8574.apcprd03.prod.outlook.com (2603:1096:604:27c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Fri, 17 Jan
 2025 10:36:04 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8335.017; Fri, 17 Jan 2025
 10:36:03 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "krzk@kernel.org"
	<krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrF5tAYKZENUWonbDbyeckJbMP+LiAgArXxYA=
Date: Fri, 17 Jan 2025 10:36:03 +0000
Message-ID: <c1440608060e4b2fabf07ff5ac0a7fe49201ba9d.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
	 <20250110123835.2719824-4-paul-pl.chen@mediatek.com>
	 <abadfae8-56f7-499c-83ff-7d79e3fe1f52@kernel.org>
In-Reply-To: <abadfae8-56f7-499c-83ff-7d79e3fe1f52@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|OSQPR03MB8574:EE_
x-ms-office365-filtering-correlation-id: 89ea34ec-d4b4-45e6-12d9-08dd36e2be44
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YkZiRkdWREd6SkNlNkNSZzREMC85dWxOL2dmWUxBZ1d0bXVtM1pPYXRIM2VD?=
 =?utf-8?B?T1dmL2tHRTAyMjVWWEMzd3REVnVScHhnQjJLcUFqdUVJZVp5S3FuKzFJRzZW?=
 =?utf-8?B?YjJtVDNEdVN0U3FJMDEwOVlUL3J1bkdtM1dkVXN1YjY3cXJ6V2pJVlNRM0gy?=
 =?utf-8?B?azRUK0xyWkZpNWlOZk5yT3RGZThtcUJubTczcEhsNGVHdjVNdm4vQlRjb282?=
 =?utf-8?B?SmM0aXhkdForZldzcThIMStIL0RqK0gwdlQ0Z1A4WkJTSjduazllVE1ZSlND?=
 =?utf-8?B?TjN5MGN6S3RrTHFjZWxUR1ZaSklQb0pGcm5HNzhTTFh6SGRYREYvWk9VYjNv?=
 =?utf-8?B?cm5FSkhrWjE2QUxjUkRSUm9yNUJ2R3lzTWNUTmkzMllUNlVIczE2M0Z5Q0xB?=
 =?utf-8?B?b0JVOS9WNG9FUjlBUEFDMVFLSEt0NnhGZksrWFJrQ1E3YlJtY3AvcXM3VXE4?=
 =?utf-8?B?MTByemhldXRZWFRJN04vamI5blc2cW5KcjJuRUtpK3FQV3ArV2FYdy9WVWto?=
 =?utf-8?B?V0VPU1lzaS8zRjM2M1VIRzJ6L2hoeXZLbkdIcWtEQnpZYVBEaUFoNlR4WjNQ?=
 =?utf-8?B?NGI3MkI1VzFFanhFUFFqQy95MlJCb3RJenphVnJNdmRwSUNLanZWYmxSK2lM?=
 =?utf-8?B?Zms3RWFpMG9UZnNRZmNBd3o4VlQyZnZLMjZ5dXJsb01FOXJuYU0zUVU0U1li?=
 =?utf-8?B?VVhWOFBTWkhFaUhYbWlSSm1GVjJBRXhuMHh4cFNVTXhtemVGaEhUamtWeHRE?=
 =?utf-8?B?cVY1RkZZYlFYUjgrbjdyTGM0Qm9tRElEb3FCNjdIWHpWeUt2MU82SkZkalJV?=
 =?utf-8?B?eDZhMTN5eXUxZUd4Sms2aUt6azlwa3lEcGEreWdNaDZ6OFhUZkI1SFlIS2du?=
 =?utf-8?B?R0lDQlhMcjVzYXBoczBGSDZTaVc4YXpLREtlNndsd2ZiOXNMQlVuNEFWYWxl?=
 =?utf-8?B?VWN3SzdROWlXSlhZcTNGSTFIM04vbnZRek1qMCt2eWRrS1NtR3k3bnEvTlJC?=
 =?utf-8?B?NW9XOFBDUWJ1NjJUNWd3RVBSSTRYejVUSURtb3NtOVA1YjBKd3phZWZ0MDhM?=
 =?utf-8?B?Q0RGNGkySno1bXdobkFjSjJBcUVRTnhJN2wxWWlOcHhuWi9FM3F0Q0Zac1VI?=
 =?utf-8?B?THl5ajB3UnF6T09zNGUzM2tiYkxxRGpEOS81YUZjNTF0SWlmK1kwcnM4T2FF?=
 =?utf-8?B?bEdKRHNCQ0g2OE0ybUQvUlJnMkZuZVI1STFsMzRPeXAzZWVic3ZvYjZ6NDBN?=
 =?utf-8?B?VUpqRGhuakJsblROMjN4STIwc0VFN2t2VG9aSmZoN01seTdQVWN2RkhQRHBz?=
 =?utf-8?B?Y1k2c1VWOWM3cDVYelpEK2RMQVh4bXR3UXF2K3hneDJaZXFNZE11YlhVTjhk?=
 =?utf-8?B?ZkJIZmxhN29YbzEyeDU4V0hlcHpPQWw2cEo4Yk9pdXBudUJzT1ZsZmNxdnBh?=
 =?utf-8?B?elJnNmkvalJwNEVxdWpXVjZobVBVR2ZSMVdhYS9JbmhXaDZzSzJ5SW4wYzZx?=
 =?utf-8?B?R0UzQTlmdWNvT0xZWmhOai9FdjhST0pscU5wNXJNMGhwQUtDQUN2ZnhwMlRy?=
 =?utf-8?B?UmxNVjJQRE9sK0FiQVBiczhpQzFJcFVHKyt5cjFzYWsxby9NY0I2M0J2NGpP?=
 =?utf-8?B?Vm1JV05Tb2VkZ1NCQXBLczVtZ1hwYnppZ0lDYmRncE5IaGNZblczVnpRbzZt?=
 =?utf-8?B?VW9jOWFqKzdIUU9xVHFVYXM5bmVQRTAvMDZiNjhUSHhWTVBhZ2NRc2dOZy91?=
 =?utf-8?B?dGYwRzVWS0xoU1ZUL1pMVkZvcVJCRUdzc01CRXNYTFhucnRaU2Z0MHlzTk1y?=
 =?utf-8?B?bUZiYnFoUDdiVFg1eVBzN2dpWWJua1pJMStHcWJGN2pkTmh3S2Z3dU9hYm1r?=
 =?utf-8?B?TmtQaFZKMGkyK2ZEaFpQUzQ0WTZWQXRidjN3NUpOV3IvMVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUp3MElQUFMzL2E2c1ZUaWs1UnVhMjQxVWkwcTUwMklIVi8wUkNEZFFSRU5M?=
 =?utf-8?B?cFFKZHRXUUlBcWR3NHNMVXhyNEJJNVY3ajVPV1U4dXFLdUd3RGw3eGp5ajQ3?=
 =?utf-8?B?amN5a0FEV0trUjA0K0djcllpQm5hZ3d3YTNUVXBRMytCdUthMllha3N5N0Fm?=
 =?utf-8?B?VlN0MjRrTUg1MEIzOHpQOW1OUTNPOTVJNnlWa1RBTXlHQmNqREpaaVhJamdT?=
 =?utf-8?B?QVZOc09uRlFEQkRoY0VUM1pMOFczRmpyNEhrRnduZzVtQjUvK1NRT0dCTWtJ?=
 =?utf-8?B?blR6SlZXdmg5YnM0UFpHRnpCcDl5M3orb1ZyTjBMOEJON0dLcjhNU0tMUlFi?=
 =?utf-8?B?R2NuVkxIVkFSbWpFMWEwM2pGY0pSQnlKQnFxenZsTFZxZkZBSnNOY0Noa1RZ?=
 =?utf-8?B?MnBDazRaZldka05VYVdReFY3NzRwalFMQVlpMlpneEgwQ2ZYclVrMHFYbWxC?=
 =?utf-8?B?bmlSa1QxRmZLSk1QOUZyWWFka2ovVW81bnhQNXRYZFBUTzVOTHdnaTBwM1Qy?=
 =?utf-8?B?L0N4VW9jN1pmcE1SM3VEM20waW9HQU9ZeE5KZFl6ZytKNzZlajBNNHVGN0lI?=
 =?utf-8?B?VzlUQTNrNitZWUFoZzJ3ci9xc2pUN01QellpWEtZemVZYWtTdFpjOVRiYTJ5?=
 =?utf-8?B?UlZiTUxYWC8wcG5HS0laZnNsUU83c3Rldis0Yld3VVJMeDNSamRlamU5VmJD?=
 =?utf-8?B?dkxsaEdiZWMvOEhSQ2pvaTRPckRPdkR4SXMzTW80cEZMTjd5UHZ5R0o0dmp6?=
 =?utf-8?B?Um1YYUxqYzRQQ3AwWFBzK3c0R1MxZ1JTL0RrNFpBZHpPK1grTzN3aXgwZTZS?=
 =?utf-8?B?UmJYc1FJSHhXNVQ4UnozaE1EUDE0cTdXNEl5V2pMMWREd2w1NjZMbTYyY2hS?=
 =?utf-8?B?Y1NFNnZ2U0hWYmJsL0xmV0NzTC82RWw3SWxDNTVOUmJDcnRxK3huWFA4alhm?=
 =?utf-8?B?bWlsWVhTWE5KYmd1VDdIUDdzTWw4enc5QVNKdGZFd3lJWkN0MHdoVk1TcmtS?=
 =?utf-8?B?THFwN3lQRnY0SFlhSEY0WTNITkdhOHJvVldyb2NhTXd5ZUJmaXBxemlvRUNq?=
 =?utf-8?B?TXF1OHRhQmg5TlB1UHdMNWkvN2d5eWJhM0NuUys4QkNmZ25UWTNtdlpiRzVX?=
 =?utf-8?B?cWVVU0c3YjgvUmFBcHRBdlgzZFJ2VjcyMXBMd2tVWEZEUklhZ1NxVlBqU1Zp?=
 =?utf-8?B?QXhGQUdaQnoxVW5SQ1hNUjAxYllkdm1zd0R1QjY4OXBjVEovdDMvRFVQc21l?=
 =?utf-8?B?dndTcDhUeHNTNHUrSWsyMkE4akxGZlZBbTRpRU4zRlQxeTBaUjMzUGdFZkQ4?=
 =?utf-8?B?RUdwVFA2OTdUSHJJYWFGZHpxYWpKTHI4V1Z4a3pGazFaWm4zWHlCK292UXNQ?=
 =?utf-8?B?TjZucTBXOWp5SndQSG11SDduRUtVZElsdzUzVlBDd3liaTNYanhMYlhYMEhL?=
 =?utf-8?B?YWJ2N2ZYTnJsbDhwWm14OUVDZlRVLzRuZG9sdkEvZXVaNzRKUjFYRERyYmg5?=
 =?utf-8?B?bTdvVnJoSXY0c0pDbVVrZ05IYllLUG5MMEU5KzN1SDV5Tzd0a2J2c2tSZ1p1?=
 =?utf-8?B?S3d5K0dLVDVDWHRDVm9ZSG5HSUNJQnFoZW9KQ3hVek80WmRyeEIxa3I2dEVz?=
 =?utf-8?B?a21EOEszMjZEQjN5djYxS3dqRzdwcTBIMFhqZ3Nob2srMC9WOG1UbzIrbmVr?=
 =?utf-8?B?S050OUdORkh6bXBQZkJrUUFTb3k0Qk1CajZyY0VaU3VXWVR3d1VvYmNlQ2sv?=
 =?utf-8?B?UUV2NDhDdldadnJUaEo4SVYzY0pJdFgyQUZqOFprc1hYcWRTU2d6aTdIQ05R?=
 =?utf-8?B?YkR1K0laQ0NnYS9TbXpURUNiNXAzZjhCa2NTVE1hcGNtb0hteFhXMUxtVmN1?=
 =?utf-8?B?SjFOMTNrYjZkaFhDQ2VsWjlIUGtmVHVScEJ4RDNXSFVMdXhmTlM2K09HdTN0?=
 =?utf-8?B?bXExbG54L3E0ejJnSmVmMHZ1SURFeWRJcUJVaHdDc3Vrd3dOZkpSNWdlMDZh?=
 =?utf-8?B?QlJOT3VodnJLR1lERFg2bVMxRTNqUFlINFFZelprcDNaOTRzNmlWU2MrY3Iy?=
 =?utf-8?B?N0tYSDZuQStpaWk0WktsVnFsUjhXek1wNDZXVGJzUnJ1UmNOamdwMC8yenBX?=
 =?utf-8?B?VTh5NHlpaEVjcy96eThWL1l6WkoyeEUyS3BXOFZ0Wm9vMDJVdUJjNVVsUWQ2?=
 =?utf-8?B?a3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B31D490566F2E24CA147AD06D1B9DE8F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ea34ec-d4b4-45e6-12d9-08dd36e2be44
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 10:36:03.8536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x3CPraMgFYySjU4sUmUm6tmM65izjwh2MEBwAeZ8Ava0b4fJmba5TaEfZaWdjaVYV8BQNERE5cpkIhVSp9AWfnp02D8lUuViHpcq02/1xZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR03MB8574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_023617_867821_0ACADF73 
X-CRM114-Status: GOOD (  22.03  )
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

T24gRnJpLCAyMDI1LTAxLTEwIGF0IDE0OjAxICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiAxMC8wMS8yMDI1IDEzOjMzLCBwYXVsLXBsLmNo
ZW4gd3JvdGU6DQo+ID4gRnJvbTogIlBhdWwtcGwuQ2hlbiIgPHBhdWwtcGwuY2hlbkBtZWRpYXRl
ay5jb20+DQo+ID4gDQo+ID4gQWRkIG1lZGlhdGVrLGV4ZG1hLnlhbWwgdG8gc3VwcG9ydCBFWERN
QSBmb3IgTVQ4MTk2Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwtcGwuQ2hlbiA8cGF1
bC1wbC5jaGVuQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiBUaGUgaGVhZGVyIHVzZWQgaW4g
ZXhhbXBsZXM6DQo+ID4gI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL210ODE5Ni1jbGsuaD4N
Cj4gPiAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvbXQ4MTk2LXBvd2VyLmg+DQo+ID4gYXJl
IG5vdCB1cHN0cmVhbWVkIHlldC4NCj4gDQo+IFdoaWNoIG1ha2VzIHRoaXMgdW50ZXN0YWJsZSBh
bmQgdW5tZXJnZWFibGUuDQo+IA0KPiBUaGlzIGNhbm5vdCBiZSBhY2NlcHRlZC4gRml4IHlvdXIg
ZGVwZW5kZW5jaWVzIG9yIGRlY291cGxlIGZyb20gdGhlbS4NCj4gDQo+ID4gSXQgd2lsbCBiZSBz
ZW50IGJ5IHJlbGF0ZWQgb3duZXIgc29vbi4NCj4gDQo+IFN0aWxsIHRoaXMgd29uJ3QgYnVpbGQg
YW5kIHdvbid0IGJlIHBvc3NpYmxlIHRvIGFwcGx5Lg0KPiANCj4gPiAtLS0NCj4gPiDCoC4uLi9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV4ZG1hLnlhbWzCoMKgwqDCoMKgIHwgNzcNCj4gPiAr
KysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygr
KQ0KPiA+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZXhkbWEueQ0KPiA+IGFtbA0KPiA+
IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV4ZG1hDQo+ID4gLnlhbWwNCj4gPiBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGV4
ZG1hDQo+ID4gLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAw
MDAwMDAwMC4uMzg1ZjU1NDlkZmFhDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKw0KPiA+IGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0
ZWssZXhkbWENCj4gPiAueWFtbA0KPiANCj4gRmlsZW5hbWUgbWF0Y2hpbmcgY29tcGF0aWJsZS4N
Cj4gDQo+IFdoeSBpcyB0aGlzIGluIGRpc3BsYXk/IERNQSBnb2VzIHRvIGRtYS4NCg0KSGkgS3J6
eXN6dG9mICwNCg0KUmVnYXJkaW5nIHRoZSBpc3N1ZSBvZiB0aGUgRVhETUEgZHJpdmVyLCB3ZSBo
YXZlIGNvbmR1Y3RlZCBhbiBpbnRlcm5hbA0Kc3VydmV5IG9mIGRyaXZlcnMgdW5kZXIgdGhlIERN
QSBzdWJzeXN0ZW0uIFdlIGZvdW5kIHRoYXQgRVhETUEgb3BlcmF0ZXMNCmRpZmZlcmVudGx5IGZy
b20gdHlwaWNhbCBETUEgZHJpdmVycywgYW5kIHRoZXJlZm9yZSB3ZSBiZWxpZXZlIHRoYXQgdGhl
DQpFWERNQSBkcml2ZXIgbWF5IG5vdCBiZSBzdWl0YWJsZSB0byBiZSBwbGFjZWQgdW5kZXIgdGhl
DQpkcml2ZXIvbWVkaWF0ZWsvZHJtIGRpcmVjdG9yeS4gVGhlIG1haW4gcmVhc29ucyBhcmUgYXMg
Zm9sbG93czoNCg0KKDEpTm8gTWVtb3J5IEFsbG9jYXRpb24gd2l0aGluIEVYRE1BIEVuZ2luZToN
ClRoZSBFWERNQSBlbmdpbmUgZG9lcyBub3QgcGVyZm9ybSBtZW1vcnkgYWxsb2NhdGlvbiBvcGVy
YXRpb25zIGl0c2VsZi4NCkluc3RlYWQsIGl0IHJlbGllcyBvbiBHRU0gKEdyYXBoaWNzIEV4ZWN1
dGlvbiBNYW5hZ2VyKSB0byBhbGxvY2F0ZQ0KbWVtb3J5LlRyYWRpdGlvbmFsIERNQSBkcml2ZXJz
IG9mdGVuIGhhbmRsZSB0aGVpciBvd24gbWVtb3J5DQphbGxvY2F0aW9ucywgYnV0IGluIHRoZSBj
YXNlIG9mIEVYRE1BLCBtZW1vcnkgbWFuYWdlbWVudCBpcyBkZWxlZ2F0ZWQNCnRvIEdFTS4NCg0K
KDIpUHJpbWFyeSBUYXNrIG9mIEVYRE1BOg0KVGhlIG1haW4gZnVuY3Rpb24gb2YgRVhETUEgaXMg
dG8gdHJhbnNmZXIgYnVmZmVycyBhbGxvY2F0ZWQgYnkgR0VNIHRvDQp0aGUgc3Vic2VxdWVudCBk
aXNwbGF5IHBpcGVsaW5lLg0KRVhETUEgc2VydmVzIGFzIGEgYnJpZGdlIGJldHdlZW4gbWVtb3J5
IGFsbG9jYXRlZCBieSBHRU0gYW5kIHRoZQ0KZGlzcGxheSBjb21wb25lbnRzLCByYXRoZXIgdGhh
biBhY3RpbmcgYXMgYSBnZW5lcmFsLXB1cnBvc2UgRE1BIGVuZ2luZS4NCkJhc2VkIG9uIHRoZSBw
b2ludHMgYWJvdmUsIHdlIGhhdmUgZGVjaWRlZCB0byBwbGFjZSB0aGUgRVhETUEgZHJpdmVyDQp1
bmRlciB0aGUgRFJNIGRpc3BsYXkgc3Vic3lzdGVtIHJhdGhlciB0aGFuIHVuZGVyIHRoZSBETUEg
c3Vic3lzdGVtLg0KDQo+IA0KPiA+IEBAIC0wLDAgKzEsNzcgQEANCj4gPiArIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1M
IDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMv
X19odHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVr
LGV4ZG1hLnlhbWwqX187SXchIUNUUk5LQTl3TWcwQVJidyFsZGxxb2hwQW9NeVR0MjRVS25zc0tP
azVRdm1jX3dsdlFQQ2RqbmVLRENlc2hEUHdJNVV1dXk0QTJzSTJSbGZZTElGREtaeF8tR0dET2xY
NDhRJA0KPiA+ICskc2NoZW1hOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCpfXztJdyEhQ1RSTktBOXdN
ZzBBUmJ3IWxkbHFvaHBBb015VHQyNFVLbnNzS09rNVF2bWNfd2x2UVBDZGpuZUtEQ2VzaERQd0k1
VXV1eTRBMnNJMlJsZllMSUZES1p4Xy1HSHB4TzlERlEkDQo+ID4gKw0KPiA+ICt0aXRsZTogTWVk
aWFUZWsgRVhETUENCj4gPiArDQo+ID4gK21haW50YWluZXJzOg0KPiA+ICvCoCAtIENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPg0KPiA+ICvCoCAtIFBoaWxpcHAgWmFiZWwg
PHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+ID4gKw0KPiA+ICtkZXNjcmlwdGlvbjoNCj4gPiAr
wqAgVGhlIE1lZGlhVGVrIGRpc3BsYXkgb3ZlcmxhcCBleHRlbmRlZCBETUEgZW5naW5lLCBuYW1l
bHkNCj4gPiBPVkxfRVhETUEgb3IgRVhETUEsDQo+ID4gK8KgIHByaW1hcmlseSBmdW5jdGlvbnMg
YXMgYSBETUEgZW5naW5lIGZvciByZWFkaW5nIGRhdGEgZnJvbSBEUkFNDQo+ID4gd2l0aCB2YXJp
b3VzDQo+ID4gK8KgIERSQU0gZm9vdHByaW50cyBhbmQgZGF0YSBmb3JtYXRzLiBGb3IgaW5wdXQg
c291cmNlcyBpbiBjZXJ0YWluDQo+ID4gY29sb3IgZm9ybWF0cw0KPiA+ICvCoCBhbmQgY29sb3Ig
ZG9tYWlucywgT1ZMX0VYRE1BIGFsc28gaW5jbHVkZXMgYSBjb2xvciB0cmFuc2Zlcg0KPiA+IGZ1
bmN0aW9uDQo+ID4gK8KgIHRvIHByb2Nlc3MgcGl4ZWxzIGludG8gYSBjb25zaXN0ZW50IGNvbG9y
IGRvbWFpbi4NCj4gPiArDQo+IA0KPiBNaXNzaW5nIHJlZiB0byBkbWEgc2NoZW1hcy4NCg0KYWxs
T2Y6DQotICRyZWY6IGRtYS1jb250cm9sbGVyLnlhbWwjDQo+IA0KPiA+ICtwcm9wZXJ0aWVzOg0K
PiA+ICvCoCBjb21wYXRpYmxlOg0KPiA+ICvCoMKgwqAgY29uc3Q6IG1lZGlhdGVrLG10ODE5Ni1l
eGRtYQ0KPiA+ICsNCj4gPiArwqAgcmVnOg0KPiA+ICvCoMKgwqAgbWF4SXRlbXM6IDENCj4gPiAr
DQo+ID4gK8KgIGNsb2NrczoNCj4gPiArwqDCoMKgIGl0ZW1zOg0KPiA+ICvCoMKgwqDCoMKgIC0g
ZGVzY3JpcHRpb246IEVYRE1BIENsb2NrDQo+ID4gKw0KPiA+ICvCoCBwb3dlci1kb21haW5zOg0K
PiA+ICvCoMKgwqAgbWF4SXRlbXM6IDENCj4gPiArDQo+ID4gK8KgIG1lZGlhdGVrLGxhcmI6DQo+
ID4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxl
LWFycmF5DQo+IA0KPiBXaHkgYXJyYXk/IEFuZCBpc24ndCB0aGUgcHJvcGVydHkgbmFtZWQgbWVk
aWF0ZWssbGFyYnM/DQo+IA0KVXNpbmcgIm1lZGlhdGVrLGxhcmIiIGhlcmUgaXMgY29ycmVjdCBi
ZWNhdXNlIHRoZSBFWERNQSBoYXJkd2FyZSBJUA0Kd2lsbCBvbmx5IGhhdmUgb25lIG1lZGlhdGVr
LGxhcmIuIEluIHRoZSBuZXh0IHZlcnNpb24sIHdlIHdpbGwgY2hhbmdlDQp0aGUgcGhhbmRsZS1h
cnJheSBkZWZpbml0aW9uIHRvIGEgc2luZ2xlIHBoYW5kbGUuDQpQbGVhc2UgcmVmZXIgdG8gdGhp
cyBsaW5rOg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
bmV4dC9saW51eC1uZXh0LmdpdC9jb21taXQvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzP2lkPTZkMDk5MGU2ZTg0NGNmYTA0NWIxYTczNDhmNTg5NjRjYWNlYjRkZTQNClNpbmNlIE1U
ODE5NiB1c2UgU01NVSwgdGhlIFNNTVUgY2FuIG5vIGxvbmdlciBpbnRlcm5hbGx5IGRldGVybWlu
ZSB0aGUNCmNvbm5lY3Rpb24gcmVsYXRpb25zaGlwIGJldHdlZW4gc21pLWxhcmIgYW5kIHRoZSBj
b25zdW1lcidzDQpwbV9ydW50aW1lX2dldChfc3luYykuIFRoZXJlZm9yZSwgd2UgbmVlZCB0byBh
ZGQgdGhpcyBpbmZvcm1hdGlvbiBiYWNrLg0KPiA+IA0KPiA+IA0KPiA+IEJlc3QsIFBhdWzCoA0K
DQo=

