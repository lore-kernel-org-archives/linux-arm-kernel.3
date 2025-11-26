Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2BB6D10377
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 03:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH6TIcF+lah0uRdeKvyZ1eTrv0bniXrgKrp/0mWNVRw=; b=CkDt9hbnnJWkpP+vlO2B4rUNiJ
	jsmXA00P3YJ9pvjVN0x4g7CnHdKHBc1hybvJUv9S3Rzd4S0OjFqfGlnnK6TfPHBWHjUax90iKlpam
	RhJCB3P7LACvx0vdIPjnMHYYg5+/zOovU/cq3Mqird41QbFYt+o0UzFFPD6ihhCxp4+rJeTwe5Syn
	Eur8Z6FIyciVGFonbT12s6cqrCzPETWSOWuSeZWLfQiQA5zn3gDGByOZ/5FX7Qvo3KklO6p0xzATH
	hzTZMfvP0aMBw4LlWWi8EnrZars1ukBoIu+OSsFyIRJg0ysmoqxDo4kQT9aFGW54fpH8nUIEUnvKC
	tDOjc5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO5wc-0000000EHjW-2Tzn;
	Wed, 26 Nov 2025 03:11:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO5wa-0000000EHik-04RB;
	Wed, 26 Nov 2025 03:11:49 +0000
X-UUID: a1febd60ca7511f09f706fa2197c6ceb-20251125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=zH6TIcF+lah0uRdeKvyZ1eTrv0bniXrgKrp/0mWNVRw=;
	b=oS6R2bsmuZB6e2UfkyhHjalnHHA/NF9EGmhfTYG8sTHC+yDZlZHMeWz8F3uA9BvLBYLa1vRcBOIISIrDlHz8MYfjwA4fxzO5CiqX0/U21v81xduLIOBzyyuFNfBsf9YhbBrFc21MAwLVUjuBCekV0iy7D1Xsg+dbvuSpW6AHOGw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:1ccb2c24-4a5c-40de-aef4-f85e48f7751f,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:34bb0d83-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|52,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a1febd60ca7511f09f706fa2197c6ceb-20251125
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 165871528; Tue, 25 Nov 2025 20:11:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 26 Nov 2025 11:11:39 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 26 Nov 2025 11:11:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYN/gmuLXFONgkJurePHD77pXDtJd0CSO6iUqbOID0ZKLyBdcUnl8Dk1LS/inPHGpG1YuVU+V4jJUjgCybuYrWFwJHzV0HNvrW88gSDuS/i5UfVhGFWZWgmn4pmqgYkacVUa4L0YpLtCtxJPAImYuEti3KOVm9TZem4rbiwjAHfdeDNNCwxLXtrJcBsjxYlg2b2OD1m4PD59rsDAEDM1bZLji5UUMiJ9bpYlFuSC0KFq1Kb/XQSeVTD12DedPLe7QHzmYkRyKZEB/KQyapaNaYLyzTGBhfZUbuRMyOO1icQEwhk7Qr+RN4bELlSHFdVHZawxYE5UBZFQuxl0RrfBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH6TIcF+lah0uRdeKvyZ1eTrv0bniXrgKrp/0mWNVRw=;
 b=AmGuueaK31QNe0bwNChak9x51+azkAe36Mjb7yVflBenLsmIeO2SwUom8DjPYXizLdlilAWDmfUb73HkpftFX1vluRDDeBzJ+aZTZeOmGf6wqEgVlN9diKErQ8VieDrsqKlhAQiyn02b5vfURbSZ/9lp6OsP7HHG79SC5pm0bWQM2YpvldMP6AmnV0M/c6+6Hz9hMRwGpkZ4m6F5Ebv6UpviUaxHtppTVHQjYGT5IY2oImeptLQhmBq+SE2BtglnRJLH5DbSezCXRBIaEAJv7Tt0FFVWfUmga7PkoT5To2udIhnGeag70ZHIMaoQbVIP78bJ9+daon3+jhEoA86vog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH6TIcF+lah0uRdeKvyZ1eTrv0bniXrgKrp/0mWNVRw=;
 b=tuT91SGDc6yF7To1yRTRpe1m6mMjlLGmY6PwYQe6iVjHT08bTWO3HavjzZvU7meYPBDdNcqC+dWuyJlLNyzI7jYHuEPCE9SqfbTv9lnlMHMjiNeH9GR6W3seX8G1EoDTszJxJjJkhznGr+WCzQe8f8qRgik9JrtbWvr8C2B4BRA=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8126.apcprd03.prod.outlook.com (2603:1096:101:16c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 03:11:36 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 03:11:35 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "simona@ffwll.ch" <simona@ffwll.ch>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	=?utf-8?B?TWFjIFNoZW4gKOayiOS/iik=?= <Mac.Shen@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?UGVuZyBMaXUgKOWImOm5jyk=?=
	<Peng.Liu@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	=?utf-8?B?TElBTktVTiBZQU5HICjmnajov57lnaQp?= <Liankun.Yang@mediatek.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Topic: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Thread-Index: AQHcTWmCip4eLqWqN0GPcdLj8ezueLT5z/4AgAfanoCAAr9PgA==
Date: Wed, 26 Nov 2025 03:11:35 +0000
Message-ID: <54b075b4ff6b9aa7cd916bb65e34e5edae3642dc.camel@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
	 <20251104085957.1175-2-liankun.yang@mediatek.com>
	 <18cd9c74699b5afe4d0bff9a6c325389d2881e29.camel@mediatek.com>
	 <dfd8767809d52efee2e7592e4b45cfd2425334b8.camel@mediatek.com>
In-Reply-To: <dfd8767809d52efee2e7592e4b45cfd2425334b8.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8126:EE_
x-ms-office365-filtering-correlation-id: bc119f1b-f4e5-4f37-17e5-08de2c998226
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|42112799006|376014|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MWNUR3U3TGNVSDY2YVlZTkYyTFlVYWl5QmlWZDVLbHFKSzhzUnp2R0pZK3Qr?=
 =?utf-8?B?dTNEWUVtZnZEUFpyTWE4SjkzMHB0Wk1XUi9QaUtVaHo2R3pGNWtGSW1tVTJ0?=
 =?utf-8?B?N2p4WWJteDh1U2tpMW9CVWYwWGRZRjkzeFFxTU1WUUFwTTdjbkVvaDM3Snds?=
 =?utf-8?B?TmcwQ2xiSWxxc21XaEwveHRUMjJuaXNveDQvT3RvZWxZajVRL0NpRm1leTND?=
 =?utf-8?B?Lzh5RWh1ZmNPUFA0MUwzVllzNk9SU0xSNm1zeE1ndkJwQjV5L05MRTdZN1JE?=
 =?utf-8?B?NHpPTDk3WDVHenVJbDBRQjB6MEljWUsvK1A2QlU5VmY2UUVnY2laNkt3VU5F?=
 =?utf-8?B?WlBOZjJQZFh1N2JZMlNxVUtESng2NWtMcnFRYS9wOC92TGhMSjljcXRUTldv?=
 =?utf-8?B?M1o1WGJXVjEzdVhBdEpIcDJHYWtmR0d4RFdpNjNqbGxRU2djYmFCYVcyMm5R?=
 =?utf-8?B?ZFVsM2k2YnJybldtdVd1cVBxTk90QVRjcmNpZEk4YS9RaW9jRTdqS1J5VTJG?=
 =?utf-8?B?SEtTNkxRQjc2WUdmSnJIaGRVUnU5aXliNlo2SFV4cExwQ045YlQ4QW8raGdB?=
 =?utf-8?B?dGFpWmxBWVRETS91NWVvZU5MMlJRZWhHY0FLSUNzSnA5bTBJL2J5L0tpYm5l?=
 =?utf-8?B?eWdxNDJBVGtXMmxTOW82YTJkZUprUW1XNDNReVJhWnBhNDY4Y2pIUWhlTmF0?=
 =?utf-8?B?WHZtWWFEUEluWkxVc2l2OTBKakVlTCsrbVJCRUJlc0dSd3RyeXhZaExaUGd3?=
 =?utf-8?B?T3lKMElrZExFWFVVZVB6d1pXUVdWN1JYSnl6MjE1Tms0UWhBMWU4WThyTGt6?=
 =?utf-8?B?YjJlaFVYK0JLTEE0Z1lvc2JRbll0OUsrRlZpQ2hyN1dnOTZ0QlBCcHFVbEl2?=
 =?utf-8?B?dUlOQlVIVG11dTRaSHNuRFE1K2dSdzNFYzRtaGJBZmxYTFdLL1haWEdWM1BR?=
 =?utf-8?B?NUZBdUJZajdlVUIyTDJRbEIzWjJkdmRzUUxIQjR3ZWFTeldtVU9iTWFFVmp6?=
 =?utf-8?B?WmlkT2JmTlk0TEgrdkZzVCs5bnZna0NlNkVUdEZHUUVLUkFyRUFIMURZc1Br?=
 =?utf-8?B?UlFqNkNNMFcxNTF0djRjNFpVUnhycVZFcmtMbnhETEtPOWVOQXd6Z1Z2RDIz?=
 =?utf-8?B?anhMd0E4YnhNQUEwTENKZXlZQ3U1U1AweTlTR3I3RTZnUUVrckgyY0VNamFi?=
 =?utf-8?B?enFQR0JkKzJoZmE0MlJrT1ozeXhDL1N5Y3NCYm5MbnNtUHJ3TkVwaHpNQmd3?=
 =?utf-8?B?NkpqSTNxT3N2eEs1Tk9OYnNzNVFvbDdZY1N2QUtmZHRsZTcvdFRYeXVVRU9L?=
 =?utf-8?B?Q0t5aVBGQXdmMXJFemNQUVZJRzVuOVA0SUtocE9ydGhCcHBMK3g5bWZzMVE2?=
 =?utf-8?B?M0NJOFpPQS81Vi82cWFTS3l2Qjh2ZmtpdjdaeTdZSDV3bXpNNkpHcnJ1SlIx?=
 =?utf-8?B?TGpxS214bnVnMzdsNEJaNlVjMEM1SXN3TXJXVlphNTQzMG5RclZwYmQ4ckhy?=
 =?utf-8?B?WlpKWER6RDMzNkIreHArRU5PRzh4OFR1MzVzN2VxK0ZNTm5IdjJRSlNud0Ni?=
 =?utf-8?B?VGNNcHo5UkhmRmViU2RXY2xwNGJNVCtPM0dIWUpxczdPd2lXeUszR0xWdmIz?=
 =?utf-8?B?MXJBdTRvZkk1V0RubTFYYU1GMmttQWJHTDk0R0tDWFRIaU9lNGNjdXIydDVM?=
 =?utf-8?B?dnY3VzZOREJ2WTQ1bWwvcUgybDVqR3E5dTlBcUZybC8vV3dIc1JmQVRKK3J3?=
 =?utf-8?B?d2I2WXhkdHo3Z0xON3Q2cElMQjd6SUlXTU5EbjZ3VmtYNXZDN0VTRWRSL0pm?=
 =?utf-8?B?SVRZM0R0a2kzbDdYcmJnUlFkU1A5cEJPT0t3UmZBWmFJSUl5SE5yWDkwVitu?=
 =?utf-8?B?WTM5cnZjQVBXNWRqRHIxMlNzUFlPWVQrUXNYRXRmRkZRVnBWc04wNzUxTFJa?=
 =?utf-8?B?amd5eUlKOXg3Q1VvVUdDbW9RSWFleFlZN2tKL0NqYnkrVnF0RWY3UFVaK1RF?=
 =?utf-8?B?VGhDY1dWSm81NE9vd1R4RGROOStjS2FqM3dEZlpLTWlCUzcxTmFCcXMyYUQr?=
 =?utf-8?B?TExNbjBOREFrOUxYWTNwUHZ5NmlhK0tPOEZ1dz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(42112799006)(376014)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anBqUEhUQTNoUjBNbXI4ZDZtR2xXN3Jrcis1NXpUMnZYTHRFWkFpUjNKaTZx?=
 =?utf-8?B?UUlFZFFtQU01aVJXbCtQeUp6NTRWNng1aVVNeXpCNyswL09EQktZSGt3T0lJ?=
 =?utf-8?B?OG5COXlvNzg1dFVrY05rMk1UWVovVXNEZWIrUWNvUHBORGh5QUJoYVkySVVL?=
 =?utf-8?B?OWRQdm1Gdk91eEI1eE9oMHlUenFZODJIaE9NQ0tQaWxnMDU5czgxWDE4R2xz?=
 =?utf-8?B?Y2VER3VVQlNYSGsyMyt5TkI3aStjQWR2elJBd3ZYejRHRWEyZ3NkRzFpV0s4?=
 =?utf-8?B?WWNFS2F0dmtOSDJ2MVVnelBXVjd3WUhKNlRLVUtERm1LYkJONWNzYXF5bDZr?=
 =?utf-8?B?QkQrQ05uZ3Npb3ptRjB0cG1KR3lvZ2JBUHFGa3k3RzZzMktBOWZ0amJVeVZ2?=
 =?utf-8?B?bEY0R2VFTTZXa25oUHNQd2ltT2JZUWk0M3d3dFphUkpiOW9YN3BFeHN3ZnR1?=
 =?utf-8?B?YS9PVTkzakRCQ3A3aS82bFQ3SDFEZHpuT1NyRTdKTjd5MDV0eVkxd2k5ZmNp?=
 =?utf-8?B?bTV4eXpIb3VTK0hmempVVEI2VU5aTW1qUHB5dW5ZQ2ZrK2VrVngvdUszWjRE?=
 =?utf-8?B?L2ZmRzdiWGJzNld6MFByUFhGUFAyV1VQbTk4UkRaam0wNnd4RVVVdVlpRXlk?=
 =?utf-8?B?dGNxb0NFbThYUjhySTVxaDg2MGQxNE5vd3NzdE9WeE1iVVFRdU1KZURJK1VK?=
 =?utf-8?B?QlIwbFVjd3h5MjR0c20vdndEM3YrakkwMC9iNFlxd1BGYXJ6NXpYdUkrb3Zl?=
 =?utf-8?B?Wjc1c2dVQnhpRW5GRTVJN0NlaTYxbXpQZGZwd282NFNBeXJHc0NHRlBKeENp?=
 =?utf-8?B?TnZVQjZTK0FzcDcrT1NtWXd0Vk9SbmFVM2tFQXdUamFoSnVKTmMzYTFPdUlw?=
 =?utf-8?B?TmdwdTBzc2hoYVJsSCtkUUY3dTd3djB6MmpjV0VOY2trcXY1amtyZUl4amR2?=
 =?utf-8?B?ZTlENnMzWld4MC9NTmlEVFFmcGlwS01wTGpuWkYrWTN5ZnAyNlBXZDIyYUlR?=
 =?utf-8?B?cXhZSkw2eGpNOHZYSjJmRHk4elF3SDhNK1VCRGFGelY5RlVYNlNoZm9HQWdK?=
 =?utf-8?B?eEJSRjFCLzdCVWVYdHU5d2t6MDBsTnpMYkVSb0w5eTNaSERLZ0tDYXIva1FV?=
 =?utf-8?B?MWdVcWZtSitNQzNwRWJXbDdjLzhYVUVvMU0zV2Z4S0w1akk4QVcwZm9WNWRn?=
 =?utf-8?B?QytGaXVrc3FwTUNmWjBmTzAydmZXSnZnUVFXYXlabTlXTXV2VUcreldud0pY?=
 =?utf-8?B?TFJnL0Q5YUZ5N2RrSUdkL3dCd1ZnRnBkaFhIeUZpYk53dmdjS0FaM08xWlFG?=
 =?utf-8?B?VHpTQkRMS09HRU1FMHEycXl3WThQZm16VEkwOWlUamRML0MxcnEvSTJxR1hT?=
 =?utf-8?B?ZHhIdGpQQmtFR3RlMHdTTC8yeVpEYitiMkl4VVRiVjMxN3VCa1o2QmN4bmpi?=
 =?utf-8?B?TW12WDhqQllDUEhNWXlLd25jTm1ISXloZUUraTN3bHloNzJPZllqc3IvU1Uv?=
 =?utf-8?B?dGhETk5odzIrazVMOXl1ZVdFMEd3ek8rLzFGbG9WTm0xRTZYMlZjMFlnUlNF?=
 =?utf-8?B?UERNREdnbWpFeERqQURZNFJZNyt6VXU2NWlwR0pwVlFBQU5NMEFBREFkNnhm?=
 =?utf-8?B?c0kyRStWYUtmMXo5dGFWRW9tZFY4UDl5UjB1ZmNkYUppNW1KcDRNN1pJdTgx?=
 =?utf-8?B?WG52QmJ5TSszV2dPSFlWMi83Tjk1d0lOQjA4dlZXUGtDa0h3akN2eGEwRExU?=
 =?utf-8?B?RkN0eVpiMGd2ck5jTEg3OFhMUDBQUDhrZ1NMQ2tGdmxLVTc3ZTRNb3hLaHFY?=
 =?utf-8?B?c1hOa0ZSVFJPT0loVlpBd0VZSW1iQUJpdWtLVHNPNkVCUTg2Si9VWVY5bTJM?=
 =?utf-8?B?T3RFa1NRK3FPdHNjL3dpbi9TbjE5b0t3UDZ3di9xUEdHVGRWRURvd3NLZldU?=
 =?utf-8?B?OEc5bUJVOWtNdGVmZGQrM3R2UXVOVCtLeHpvVCtJYVFvempQYm11OHlyekVZ?=
 =?utf-8?B?U2U0cWY5NDdleHNiSEpLa050c1ErbFhlWXRtZlMvaEpsbk1laVZMWEdWOGZE?=
 =?utf-8?B?aHRUdTFEazczQjhhelF0akhCQk5CdEUvT3E1WHZBQXVoVlM0UzdDc3lUR2RM?=
 =?utf-8?Q?7RNQ0eqYTsQC3XlKUMixmaP9C?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4881AE9A8CCD8841AE2F9642C75D17D5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc119f1b-f4e5-4f37-17e5-08de2c998226
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 03:11:35.7737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+zs+KpPYGlPuTc4tJ7FUbYE/byp2tkRx1pd9tHSmV0uy5M7J0Upka/59D9OWob003duzkVKmjLz4HmnWOSCww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_191148_107668_2875A8F9 
X-CRM114-Status: GOOD (  25.49  )
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

T24gTW9uLCAyMDI1LTExLTI0IGF0IDA5OjE0ICswMDAwLCBMSUFOS1VOIFlBTkcgKOadqOi/nuWd
pCkgd3JvdGU6DQo+IE9uIFdlZCwgMjAyNS0xMS0xOSBhdCAwOToxOCArMDAwMCwgQ0sgSHUgKOiD
oeS/iuWFiSkgd3JvdGU6DQo+ID4gT24gVHVlLCAyMDI1LTExLTA0IGF0IDE2OjU1ICswODAwLCBM
aWFua3VuIFlhbmcgd3JvdGU6DQo+ID4gPiBCeSBhZGp1c3RpbmcgdGhlIG9yZGVyIG9mIGxpbmsg
dHJhaW5pbmcgYW5kIHJlbG9jYXRpbmcgaXQgdG8gSFBELA0KPiA+ID4gbGluayB0cmFpbmluZyBj
YW4gaWRlbnRpZnkgdGhlIHVzYWJpbGl0eSBvZiBlYWNoIGxhbmUgaW4gdGhlDQo+ID4gPiBjdXJy
ZW50IGxpbmsuDQo+ID4gPiANCj4gPiA+IEl0IGFsc28gc3VwcG9ydHMgaGFuZGxpbmcgc2lnbmFs
IGluc3RhYmlsaXR5IGFuZCB3ZWFrbmVzcyBkdWUgdG8NCj4gPiA+IGVudmlyb25tZW50YWwgaXNz
dWVzLCBlbmFibGluZyB0aGUgYWNxdWlzaXRpb24gb2YgYSBzdGFibGUNCj4gPiA+IGJhbmR3aWR0
aA0KPiA+ID4gZm9yIHRoZSBjdXJyZW50IGxpbmsuIFN1YnNlcXVlbnRseSwgRFAgd29yayBjYW4g
cHJvY2VlZCBiYXNlZCBvbg0KPiA+ID4gdGhlIGFjdHVhbCBtYXhpbXVtIGJhbmR3aWR0aC4NCj4g
PiA+IA0KPiA+ID4gSXQgc2hvdWxkIHRyYWluaW5nIGluIHRoZSBocGQgZXZlbnQgdGhyZWFkLg0K
PiA+ID4gQ2hlY2sgdGhlIG1vZGUgd2l0aCBsYW5lIGNvdW50IGFuZCBsaW5rIHJhdGUgb2YgdHJh
aW5pbmcuDQo+ID4gPiANCj4gPiA+IElmIHdlJ3JlIGVEUCBhbmQgY2FwYWJpbGl0aWVzIHdlcmUg
YWxyZWFkeSBwYXJzZWQgd2UgY2FuIHNraXANCj4gPiA+IHJlYWRpbmcgYWdhaW4gYmVjYXVzZSBl
RFAgcGFuZWxzIGFyZW4ndCBob3RwbHVnZ2FibGUgaGVuY2UgdGhlDQo+ID4gPiBjYXBzIGFuZCB0
cmFpbmluZyBpbmZvcm1hdGlvbiB3b24ndCBldmVyIGNoYW5nZSBpbiBhIGJvb3QgbGlmZQ0KPiA+
ID4gDQo+ID4gPiBUaGVyZWZvcmUsIGJyaWRnZSB0eXBlYyBqdWRnbWVudCBpcyByZXF1aXJlZCBm
b3IgZWRwIHRyYWluaW5nIGluDQo+ID4gPiBhdG9taWNfZW5hYmxlIGZ1bmN0aW9uLg0KPiA+ID4g
DQo+ID4gPiBUaGUgYG10a19kcF9hdXhfcGFuZWxfcG93ZXJvbmAgZnVuY3Rpb24gZmFpbHMgdG8g
YWxpZ24uDQo+ID4gPiBXaXRoaW4gdGhlIGBtdGtfZHBfaHBkX2V2ZW50X3RocmVhZGAsIGlmIERQ
IGlzIGRpc2Nvbm5lY3RlZCwNCj4gPiA+IHRoZSBgbXRrX2RwX2F1eF9wYW5lbF9wb3dlcm9uYCBm
dW5jdGlvbiB3aWxsIHdyaXRlIGZyb20gYGF1eGAgdG8NCj4gPiA+IGBEUFJYYCwNCj4gPiA+IGNh
dXNpbmcgYSBmYWlsdXJlIGFuZCB0aHVzIHByZXZlbnRpbmcgc3ltbWV0cnkuDQo+ID4gDQo+ID4g
SSdtIGN1cmlvdXMgYWJvdXQgYW5vdGhlciBjYXNlLg0KPiA+IEluIHlvdXIgZGVzY3JpcHRpb24s
IHdoZW4gRFAgcGx1ZyBvdXQgYW5kIHBsdWcgaW4sIERSTSBjb3JlIHdvdWxkIG5vdA0KPiA+IGNh
bGwgbXRrX2RwX2JyaWRnZV9hdG9taWNfZW5hYmxlKCksIHJpZ2h0Pw0KPiA+IElmIHNvLCB3aGVu
IEkgcGx1ZyBvdXQgRFAsIGFuZCBwbHVnIGluIGFub3RoZXIgRFAgcGFuZWwgd2hpY2ggc3VwcG9y
dA0KPiA+IHNtYWxsZXIgcmVzb2x1dGlvbiwNCj4gPiB0aGVuIG10a19kcF9icmlkZ2VfYXRvbWlj
X2VuYWJsZSgpIGlzIG5vdCBjYWxsZWQgYW5kIGJlbG93IGNhbGwNCj4gPiBzZXF1ZW5jZSB3b3Vs
ZCBub3QgaGFwcGVuOg0KPiA+IA0KPiA+IG10a19kcF9icmlkZ2VfYXRvbWljX2VuYWJsZSgpIC0+
IG10a19kcF92aWRlb19lbmFibGUoKSAtPg0KPiA+IG10a19kcF9zZXRfdHhfb3V0KCkgLT4gbXRr
X2RwX3NldHVwX3R1KCkNCj4gPiANCj4gPiBJbiBtdGtfZHBfc2V0dXBfdHUsIGl0IHdvdWxkIHNl
dCBzcmFtX3JlYWRfc3RhcnQgYWNjb3JkaW5nIHRvDQo+ID4gbGFuZV9jb3VudC4NCj4gPiBCdXQg
dGhlIGNhbGwgc2VxdWVuY2Ugd291bGQgbm90IGhhcHBlbiB3aGVuIG5ldyBwbHVnIGluLCB0aGUN
Cj4gPiBzcmFtX3JlYWRfc3RhcnQgd291bGQgYmUgb2xkIHZhbHVlIHdoaWNoIG1heSBpbmNvcnJl
Y3QuDQo+ID4gSWYgdGhpbmsgdGhhdCB3aGVuIHBsdWcgaW4gYW5kIHBsdWcgb3V0LCBpdCBzaG91
bGQgZGlzYWJsZSBEUCBhbmQNCj4gPiB0aGVuIGVuYWJsZSBEUCBhZ2Fpbi4NCj4gPiBJZiBEUk0g
Y29yZSBkb2VzIG5vdCBkbyB0aGlzLCBJIHRoaW5rIHdlIHNob3VsZCBtb2RpZnkgRFJNIGNvcmUg
b3INCj4gPiB5b3Ugc2hvdWxkIHJlY29uZmlnIHRoZSB3aG9sZSBEUCB3aGVuIHBsdWcgaW4sIG5v
dCBvbmx5IHRyYWluaW5nLg0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gQ0sNCj4gPiANCj4gDQo+
IEhpIENLDQo+IA0KPiBXaGVuIERQIHBsdWcgb3V0LCBEUk0gY29yZSB3aWxsIGNhbGwgbXRrX2Rw
X2JyaWRnZV9hdG9taWNfZGlzYWJsZSgpLg0KPiBXaGVuIERQIHBsdWcgaW4sIERSTSBjb3JlIHdp
bGwgY2FsbCBtdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoKS4NCg0KDQpXaGVuIERQIHBsdWcg
aW4sIERSTSBjb3JlIHdpbGwgY2FsbCBtdGtfZHBfYnJpZGdlX2F0b21pY19lbmFibGUoKSwgYW5k
IG10a19kcF9icmlkZ2VfYXRvbWljX2VuYWJsZSB3b3VsZCBjYWxsIG10a19kcF90cmFpbmluZygp
Lg0KU28gaXQncyBub3QgbmVjZXNzYXJ5IHRvIGNhbGwgbXRrX2RwX3RyYWluaW5nKCkgaW4gbXRr
X2RwX2hwZF9ldmVudF90aHJlYWQoKS4NCg0KUmVnYXJkcywNCkNLDQoNCj4gDQo+IElmIERQIHBs
dWcgaW4sIHNyYW1fcmVhZF9zdGFydCB3aWxsIGJlIHJlY2FsY3VsYXRlIGJhc2VkIG9uIHRoZSBs
YW5lDQo+IGNvdW50Lg0KPiANCj4gUmVnYXJkcw0KPiBMaWFua3VuLg0KPiANCj4gPiANCj4gPiA+
IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTGlhbmt1biBZYW5nIDxsaWFua3VuLnlhbmdAbWVkaWF0
ZWsuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwLmMgfCAyMCArKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcC5jDQo+ID4gPiBpbmRleCBiZWY2ZWViMzBkM2UuLjBiYTJjMjA4ODExYyAx
MDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHAuYw0KPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcC5jDQo+ID4gPiBAQCAtMTk3
Niw2ICsxOTc2LDcgQEAgc3RhdGljIGlycXJldHVybl90DQo+ID4gPiBtdGtfZHBfaHBkX2V2ZW50
X3RocmVhZChpbnQgaHBkLCB2b2lkICpkZXYpDQo+ID4gPiAgCXN0cnVjdCBtdGtfZHAgKm10a19k
cCA9IGRldjsNCj4gPiA+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gPiA+ICAJdTMyIHN0YXR1
czsNCj4gPiA+ICsJaW50IHJldDsNCj4gPiA+ICANCj4gPiA+ICAJaWYgKG10a19kcC0+bmVlZF9k
ZWJvdW5jZSAmJiBtdGtfZHAtDQo+ID4gPiA+IHRyYWluX2luZm8uY2FibGVfcGx1Z2dlZF9pbikN
Cj4gPiA+ICAJCW1zbGVlcCgxMDApOw0KPiA+ID4gQEAgLTE5OTQsOSArMTk5NSwyOCBAQCBzdGF0
aWMgaXJxcmV0dXJuX3QNCj4gPiA+IG10a19kcF9ocGRfZXZlbnRfdGhyZWFkKGludCBocGQsIHZv
aWQgKmRldikNCj4gPiA+ICAJCQltZW1zZXQoJm10a19kcC0+aW5mby5hdWRpb19jdXJfY2ZnLCAw
LA0KPiA+ID4gIAkJCSAgICAgICBzaXplb2YobXRrX2RwLT5pbmZvLmF1ZGlvX2N1cl9jZmcpKTsN
Cj4gPiA+ICANCj4gPiA+ICsJCQltdGtfZHAtPmVuYWJsZWQgPSBmYWxzZTsNCj4gPiA+ICsJCQkv
KiBwb3dlciBvZmYgYXV4ICovDQo+ID4gPiArCQkJbXRrX2RwX3VwZGF0ZV9iaXRzKG10a19kcCwN
Cj4gPiA+IE1US19EUF9UT1BfUFdSX1NUQVRFLA0KPiA+ID4gKwkJCQkJICAgRFBfUFdSX1NUQVRF
X0JBTkRHQVBfVFBMTCwNCj4gPiA+ICsJCQkJCSAgIERQX1BXUl9TVEFURV9NQVNLKTsNCj4gPiA+
ICsNCj4gPiA+ICAJCQltdGtfZHAtPm5lZWRfZGVib3VuY2UgPSBmYWxzZTsNCj4gPiA+ICAJCQlt
b2RfdGltZXIoJm10a19kcC0+ZGVib3VuY2VfdGltZXIsDQo+ID4gPiAgCQkJCSAgamlmZmllcyAr
IG1zZWNzX3RvX2ppZmZpZXMoMTAwKSAtIDEpOw0KPiA+ID4gKwkJfSBlbHNlIHsNCj4gPiA+ICsJ
CQltdGtfZHBfYXV4X3BhbmVsX3Bvd2Vyb24obXRrX2RwLCB0cnVlKTsNCj4gPiA+ICsNCj4gPiA+
ICsJCQlyZXQgPSBtdGtfZHBfcGFyc2VfY2FwYWJpbGl0aWVzKG10a19kcCk7DQo+ID4gPiArCQkJ
aWYgKHJldCkNCj4gPiA+ICsJCQkJZHJtX2VycihtdGtfZHAtPmRybV9kZXYsICJDYW4ndCBwYXJz
ZQ0KPiA+ID4gY2FwYWJpbGl0aWVzXG4iKTsNCj4gPiA+ICsNCj4gPiA+ICsJCQkvKiBUcmFpbmlu
ZyAqLw0KPiA+ID4gKwkJCXJldCA9IG10a19kcF90cmFpbmluZyhtdGtfZHApOw0KPiA+ID4gKwkJ
CWlmIChyZXQpDQo+ID4gPiArCQkJCWRybV9lcnIobXRrX2RwLT5kcm1fZGV2LCAiVHJhaW5pbmcN
Cj4gPiA+IGZhaWxlZCwgJWRcbiIsIHJldCk7DQo+ID4gPiArDQo+ID4gPiArCQkJbXRrX2RwLT5l
bmFibGVkID0gdHJ1ZTsNCj4gPiA+ICAJCX0NCj4gPiA+ICAJfQ0KPiA+ID4gIA0KPiA+IA0KPiA+
IA0KDQo=

