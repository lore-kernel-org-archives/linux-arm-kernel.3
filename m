Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002BBE74905
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 02:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YosbWqvDh8i/20zUCjkr5bBNbYCL4t7xW/0f8zy7b9M=; b=1S9HBL4OW88JZcTKyMovgghfXN
	hMAwIjXXH4K2k0xOsTYeicD64jtvR42dOjVT9alPNm7iaB8znHOFRMEZ/sRQ5s3OFhV7rIbzte5r2
	mUje3dA3vWki9ZBbYLMFD7A7MiuMl87XZjxVR1Ayqi4ZN2X8s+NT+3zg8tAsI5n/ieI4KV0Nu1Ou0
	L9gf+GPdkYqj/kjRUPdZQOghcpgO8PTjMMzP4duNC3USyfsk+8AS0TO8fzaDdnh1HPZxjaplxwWLB
	BUCmdoApgfmqyIweBnW/+jXtKLBfJJYtSLuJPn2fZVhwOw73aiSZq6kAf24YipIROjoRw6rgH/ywT
	JKgTHdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYERw-0000000GImM-3COa;
	Wed, 24 Dec 2025 02:18:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYERu-0000000GIlp-1CxF;
	Wed, 24 Dec 2025 02:18:03 +0000
X-UUID: c1c2af12e06e11f08b17dd397dc63300-20251223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=YosbWqvDh8i/20zUCjkr5bBNbYCL4t7xW/0f8zy7b9M=;
	b=JGO6+/pgojoACQJg6TBvCzALE/sFgGfzyAyal8Ts8y892ySY5WbavHNdTCNh3yHRvnZqRmmVH1HiIMDRyVJWmZoT1TWkI8FjSYysK6EBJqDIbOYbX+fn4dJ4oguIdVplCG8LKp5sZgdOf6iAYdh29uUZdz/JoPvuY30PDT2Khf8=;
X-CID-CACHE: Type:Local,Time:202512231917-07,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.9,REQID:370b669b-d6df-47c2-ac02-96f81d55e021,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:5047765,CLOUDID:802887aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: c1c2af12e06e11f08b17dd397dc63300-20251223
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 8154142; Tue, 23 Dec 2025 19:17:55 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 24 Dec 2025 10:17:51 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 24 Dec 2025 10:17:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mraEzrvk3VMkaqha+SvEVfc0kuK3YzCCY8+cPNIi6TQ50/uo15Y3qy4nq83VJ9m6fXjhs4qkK4sZAuj0pY+MsqQU+kbmxeDiQNP7Jloucl4/b4lnEJMmfCwDTHLICaUmmr5qgbdv9VUrs0h6X3xt2r+8kTRQrIE6aIhRog8CsapzYzuUqhnsPo30mKXs8TtnKhJRn5POxyKmYHMhhpfCPvOYrO0gSg5EYUUd6dyK8m0qF3FeCpZVvFDEnQKLKQG6tKzFikM4ved+ADnYlCC/9J7RNFI6jEV1Meswr6WoOG7MTL4Rxaqss+lyIUm5x4vHJrKRoYav6KIg+np+epZZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YosbWqvDh8i/20zUCjkr5bBNbYCL4t7xW/0f8zy7b9M=;
 b=u/EWASV4sVAv6wD8GyjHxRbjIDVqMHYcn1hTVdm45ygqAC9KdTW78GULZK8uvPNR5gLfGfnqQsO1hxy1mQc0PNGRy4pNgWhOJX0ZGSCc1+UmlsEdE3ywKM1d8qW0PjFG62i9ZgZZDit4U6uzkv3k5bUUhXUBgtwJfpSeoumk9qqDOHNSqDRkpZlkRS+GqaCE+yU91O+V43NqpgqoSTI6NiB8weUrR9ZvQ1ad53mGbqM2InTniPcXsUY6TRWoW7HklGtuHGtWKywXVcgXov/4jGipU0Ue/e/Yclp9NgJEvvJB3heD6g3K5ISiE1yeLxXshwH05v9QNfLo9Avwa/JCmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YosbWqvDh8i/20zUCjkr5bBNbYCL4t7xW/0f8zy7b9M=;
 b=Al2927qm2EH/6BJ01q7HHWjrS9fuq1WrWrHKYxR0Fg8RaUyYGKxzr7gS6JoQJ9sZcj221DnsnwgR5V/Jo0z1+GD9eAJnV1QwzaqsITO2ZsnSlZ1Ow9dn7BUBa2KBkq89Cs4Blq5e1bu+yuh3ECveTMKKsmfAj8Fq+pEcTPVrdYA=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by KL1PR03MB6899.apcprd03.prod.outlook.com (2603:1096:820:9e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 02:17:49 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9456.008; Wed, 24 Dec 2025
 02:17:49 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>, "chunkuang.hu@kernel.org"
	<chunkuang.hu@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
	<mripard@kernel.org>, Nicolas Prado <nfraprado@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	Daniel Stone <daniels@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ariel D'Alessandro
	<ariel.dalessandro@collabora.com>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: Re: [PATCH 03/11] drm/mediatek: ovl: Add supports_plane_colorops flag
Thread-Topic: [PATCH 03/11] drm/mediatek: ovl: Add supports_plane_colorops
 flag
Thread-Index: AQHcdET2ms9rZ3WHy0eDQyEK6bFiKbUwDnQA
Date: Wed, 24 Dec 2025 02:17:48 +0000
Message-ID: <4d639355fb6071d568e079778eee50b89ffbb0da.camel@mediatek.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|KL1PR03MB6899:EE_
x-ms-office365-filtering-correlation-id: f14af3e4-7f50-4bac-fd7b-08de4292a259
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N3YxeXpycDJqakJCb1NnUDlRd1AxenJJaU5STnlBTitCTUtEeE93WlZEUmJ0?=
 =?utf-8?B?ZEVza2dtOUZJdkZWZ3loT2FLN1ZFZHN2ZUVnbTlHeHNCTFFvYXZ4NFNtOWd4?=
 =?utf-8?B?eUVUb1hTSlhlV2N1di9aNnVKNWg0bEFuL0tBL3V5TnFGVkJ0aEhnRjJLRWZ4?=
 =?utf-8?B?UGFCSHNNZnNSK2VCbmhZcTduTE9iWGtlNlFmS1U4aTNGK3JuSmtGMS9ncmpP?=
 =?utf-8?B?SURtbnhDNjZLbzBQeUZFT1JpODUra09WeVY1dm9kSXpMYW5TSjQzdFFrT2FQ?=
 =?utf-8?B?UXlBWDdxcFFKSlg1OFduM2hRemlpNzZVMDVualN2alJWZzVjRnlxWStXaFBJ?=
 =?utf-8?B?Y2IvTGNEUzZzdTF3RUhWTkYrSmJpNklsMzVoUVJyOVBValU4TlJqcGo3aXl0?=
 =?utf-8?B?OGdSbXlmb0hJY0hiR0JDeFlDUU5nNlJaTkpJMzV0N1NBQWRZa1lUTDkxL0hO?=
 =?utf-8?B?TWlTTFFEd1ZTVVh1K1lZSzh4cUtuWG1wUkF6NEFkbmFBYjFLeUFlMjJwMnNL?=
 =?utf-8?B?ZENyQmUxNTZvdXZ5MEQrTVA0UlFvNGllQng4M0tpa0NMWjB3a3JLNGh5a3ZH?=
 =?utf-8?B?b3dIUk9LcFVidTF6d3JyVzIvRlJsUnpSRko2S1hBTktEdWxTaU5ORlhOYjlo?=
 =?utf-8?B?NnU2MGtDNEQwamFnSUlzRmlMRlVDV3ZwTThlRGZ3enYwNjRuQmdvdGpVVEJt?=
 =?utf-8?B?TW9KMGFKNXltUGd1d0pwaTYzSnd2SUVjRDRiNTVPcXNrNVIzTG5wcStlNkl3?=
 =?utf-8?B?RnpNOEhWQktCM1l2Qi9uMHJCWVNGSGVoOUgzOUdxMUFLR3VWcVZvbEV2V2pR?=
 =?utf-8?B?QVV6ZW80SmM5MjFZRldjbkhGbWNBOVFtcitocUpsVHNVMEExVWUzRnk2eHBO?=
 =?utf-8?B?YkxhZjVoMlh2ZnFTTnpMOG1tM3FTZEpLWlFOQ0MrYlN0c3lsSkhKNkNKZ2JW?=
 =?utf-8?B?QVk0cEh2SktGNGRXc2hhTjJLN045YTJxMVgzbk9BZkJJbTcydk9PamlQbjJN?=
 =?utf-8?B?bUZ4UllPMk5Ec3hza1pSdUwwZ3NVKzBaMjVIa1pKbGppcEhoTlRPZklQcFVE?=
 =?utf-8?B?ak1GbEFTUnpzS2VJSlZML3FnRUdFY2Y1Q2tzUEo5VXpwbzNKeEdpU3JvZ0dm?=
 =?utf-8?B?MFkvVndUTndOaDBWcXNiRjgvdFMwWmNqcUUwOU1HeENIZkJuQnB1Nm11MXAy?=
 =?utf-8?B?NFlJTTVCWmw5ZHF3N3hxbXA2QjliNDJtenJKVGVsRUpyL0crV1VneEJtMzhr?=
 =?utf-8?B?bnlUcFlMMHRJYUdpamIzYXUzY3RCMWpCUkM2cGlkbmo4cE5XcjhndDZqczFj?=
 =?utf-8?B?eFYxbG00aDhHQ0FLTGdpTEVQTnBDSnhkTDJhcy9hMUxLK1VNRDI3ci82VDFS?=
 =?utf-8?B?RXFOWDZLYUpGNVpTcnYzckJUWWduMGZmKzluRnRwU2tUZXZ2VTJwUVdEUTFK?=
 =?utf-8?B?bkVMZXhqZXE3MmxsYnlSOUtmR01YSXF4MUpkZHB2NGhac2haS0VPNXlVdTI0?=
 =?utf-8?B?cm5raG8zNXhtN1gwWFZUWFFQOGNHalFPd0pkeWRxOURkcXM1MHVWdjNaT2kx?=
 =?utf-8?B?dUlqcmt6RCtOdEhpQ2lYUjJpbEs2OFN3L2tuVkJxK1JNZ3l6bVFDMkE2cC9a?=
 =?utf-8?B?K3F1VlRJb1pNbFdJQURGQ01DV2Q4eHJleEdGZkdnNlZadWZTTEN3Y3c5dUV3?=
 =?utf-8?B?eFU5MTZQQU94UEMzOERPYmVxbEg4ZUlSbldZQmhFbHZvaVZTTVdYQStSR3Z4?=
 =?utf-8?B?dnoxZHUvOUQxYk8rV2ZpYlFtWmd1bjZ1cnlBdFNpS0xETEJoSlRHaXRJN3pt?=
 =?utf-8?B?N1RyVGtQQnZSRDBxeXpvNkFaRHU2U2E1K0t1cU9PYm45bTZBSlgxeTdtMU9q?=
 =?utf-8?B?VmFSNFZ2bmd3akhaL1ZESkw0Z0lSSFJqNURROFBhOHhtanZzVGk2TitlUi9o?=
 =?utf-8?B?elVQNDBnaVpqZzduZzZxN3N3ZHVzMDNSMUlpei9QSjNrMXVyR1ZYTENtcmtU?=
 =?utf-8?B?RWtDeFAzWXc2RklVS3d6Rm80L0pkUm1JUmIrb3o2dnp3bnlscHFhTmVNa1kv?=
 =?utf-8?B?WmJ3TkpYSHdmNHFsSVpnUVgxcFZuL1ZSMDhYUT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjAzV0tBZk1POFZEbHNhWUZLbTNlUEM0ZVptN05QUHVsejIzYSs5SWpaTFhU?=
 =?utf-8?B?cXFWS0lBTEFRTzdvNjhrMnlXUDl5QmMzRkZ0UmhTd1BUdEEwbzNJSGxmQ2Z5?=
 =?utf-8?B?T0Q3eURmN0VzQnlJUWlIV0NwOUtOSGxxZWpIMTNBQWEwa2h6K1ROMzRWc3FR?=
 =?utf-8?B?KzYzMVAxWEVsb3Z3amJGRzBiSlRha2xaZnlpVUNobjMybGkyTkNWYTcvWFJM?=
 =?utf-8?B?M1Q1dmFPK21Cb1dNTzZGK0w3d0VaNDlEV2pUMkZhbVBpeDlrcVIzbUk5RFVQ?=
 =?utf-8?B?eW1DZjlrV1VYUWRKS2tFcFVKNmtRYzFvMEVBWFJ3WkE4R3hUQlRjT3R3S2lF?=
 =?utf-8?B?TWxHQ0FnK0k4T3IxUjR0WkduTTQyNDZaUUxpVDBtdExWNE9SbnJwOXpwK3lH?=
 =?utf-8?B?c0lSdDNWdDY0QTRvUWxmVUk4RUxKWGN1aEhFMFVWMFVRalZYRlU3OTVhVUFS?=
 =?utf-8?B?MXc0TVJicDNpLzhoUGdpcXFPTHFYL3JMckNTTTVxL0pWMEJuYU1MaEtoL1NM?=
 =?utf-8?B?SjRsZkkvejFPMk53cmRjdlVnNjFZM3h3QmM2dUlMaHpYcG1tcmluMFU2RStk?=
 =?utf-8?B?ajZUQmd0VTVsT25BamNtN1lBMkZRdHkyb2VoK0NRTjYwMG5ZbUg4K01UL3dV?=
 =?utf-8?B?S0J5WWdTeHlnSkVnOW95U2lGcWp3a05EL3FsU2toS1c2eUpwaThVbHFiYXg5?=
 =?utf-8?B?OXZneCtwUHFCL3RHWTZRUjR0L2pUN0VxS1FNcVF1djFHdmNHNldaZDE2OEZD?=
 =?utf-8?B?cFFOSi9hcmhFSkwrVnBYUEF0M3BncEdkUU15cC94ZmYzVWpQbVdPR3Q5MGVL?=
 =?utf-8?B?UDFlTDUyVmxJL3NJWUZiK0ZBZXZ5WW5mcjFOUjhJUnNKZ3F5QmZYRS91YjBN?=
 =?utf-8?B?bWlJbWFqZytNWTJ4T1Jpb1FwZ0VBemNyMnRZZ1NtZG95QXkrSjhFZTY3dmY5?=
 =?utf-8?B?eGF0VEFha25ZZnBNd2dMTFJjc3UrWFE3S2JEMmZ1K0RkVitiMUNFNFl5UFMv?=
 =?utf-8?B?Qm5ZVStLOUJpSHg2aDhZMGZuaHhZeUNXdjFSbHh1KytaMWhvUnJzcmFicitJ?=
 =?utf-8?B?OEoxNE80LzN5MDErWDhSL0xSaHJJUU56UytMNDlObURrQzFXUkZMcjFkdm03?=
 =?utf-8?B?dzd2TTNHZlY2ZkF2bjI5RUJRbFZlRVYwSVNqL2xrdHZwLzMyM3pzL1VGZlZR?=
 =?utf-8?B?VVpqdmxIVmNMOVFjeHdZQWtVbnZDOTZMUVNaa3FOdktNZUdoNlVtYzY1VVgr?=
 =?utf-8?B?MDRpSEExQ1JLYnFFZFVaRytTZ1luOHdJc1dnaDcvTkJCZXJlbHdoajRZaHF5?=
 =?utf-8?B?L2ZjVmhlSWVadUg3THdMZlZINGhOZWo3RzBMNXFCRm5yQmgxZUw4WVB5YmNl?=
 =?utf-8?B?c3d0a3dES0g3VkpzQlgrWWhIN29QSjBpK1VCV2Q4NUNQNVN3c09RcWx5bFow?=
 =?utf-8?B?eVlZUkhXQVBGeHZDbjRFN2NkL2szakhPNnJpV3Y0V2hXZVh3NDVBRWthYzJi?=
 =?utf-8?B?c0NxYjB1amY1alF6VVpES3g2dkJUemFKTnYxL2prdkpzdGF3cmkvU0JxWm9I?=
 =?utf-8?B?ZXRIb2tNc1JxbytKeUErRzFRSENFandBZ1hTOUEyYysrNVRzd29lQnlCTVUw?=
 =?utf-8?B?OE13cnk1U05DSlZIKzJJTWkvR2JNalVsZEdnSllab1JhK0pqUWQ4WUlsZHBi?=
 =?utf-8?B?Syt2Um1yOW5uWmQ3TU5aRGFQd0pjNVgvaU9xNG9nTWtjaTArQ1hPbGpwSXNM?=
 =?utf-8?B?ekVoMitYOE1jUVJjcUNoSFNrZ0Q3Wm9XT09JV3hBZDUvVHpqSU9aU0tpaVN4?=
 =?utf-8?B?SENCMERpeE5ya2lPYXQ0U1lOeGwxYUhQeWx2U1pVQVE5azVWREtPT29XYXhj?=
 =?utf-8?B?Z3JDTDNSUXBCZkVBT0RIRTErSnNLcnhBa01jcEIwQVZtMXhBNnRISFJ5TGo5?=
 =?utf-8?B?OU1qQUxaNVhWeUxYRnFoQjVUbm5DRnhqMWlqUW9mbEs4K0pEbnl1UlcvUGpw?=
 =?utf-8?B?bUpPOXY5b01KNCtvTCsxOVFHb28rWHhaUi9NdVRsZ2o1K1U2d2FxZDZYc2JR?=
 =?utf-8?B?NjBBNWNHZlBXNGowdTkxZ2pzSXVRVzNsLy8xOCtsUXk1QTIzblUwTWU5T0tR?=
 =?utf-8?B?WjcwMnViK3FkU3kvQVVVTTdWeU5ncHFJdUtKVnNXNys1bXRmLzhqK0tQZW5o?=
 =?utf-8?B?V1lWbFlFdjNXZUpvblYvaGRoMEQ2eEdpNHBtSkJiYmFZYlJCNEY3RkVwSkVQ?=
 =?utf-8?B?dG5EV3pDMzcxTjFZcFY2WngwZnVTaW82WVc5MG9hRis1WnJFcFI5MUJvckly?=
 =?utf-8?B?Tm15TjlPYWtKWEx2dStNcHlxVkZJdGtLYTdtZThxaFN5QUx4ZTFBVWZNMGVG?=
 =?utf-8?Q?x9gfoJJT6B4PMWiA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C9CA8707BAF62045BF51162DEF387854@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14af3e4-7f50-4bac-fd7b-08de4292a259
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2025 02:17:48.9386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yG6dmn36iN49wpWPU4g85cUdqj9H2Ooe+phg3dBvTos/NEHsEZP1p7gdLd/NoRe4Qj7Y16UNxJi3f6bsTi7ZEs+c0m+F6EKDwWJnxcHAKmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6899
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_181802_344795_8E629A27 
X-CRM114-Status: GOOD (  16.72  )
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

T24gVHVlLCAyMDI1LTEyLTIzIGF0IDE2OjQ0IC0wMzAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToNCj4gQWRkIGEgc3VwcG9ydHNfcGxhbmVfY29sb3JvcHMgZmxhZyB0byB0aGUgZHJp
dmVyIGRhdGEgdG8gYWxsb3cgU29Dcw0KPiB0aGF0DQo+IHN1cHBvcnQgcGVyLXBsYW5lIGNvbG9y
IG9wZXJhdGlvbnMgdG8gZW5hYmxlIHN1cHBvcnQgZm9yIGl0IGluIHRoZQ0KPiBkcml2ZXIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNv
bGxhYm9yYS5jb20+DQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9vdmwuYyB8IDEgKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiBpbmRleCA4ZTIwYjQ1
NDExZmMuLjQ2MjM4YzIxYjBhYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX292bC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYw0KPiBAQCAtMTUwLDYgKzE1MCw3IEBAIHN0cnVjdCBtdGtfZGlzcF9vdmxfZGF0
YSB7DQo+IMKgwqDCoMKgwqDCoMKgIGNvbnN0IHUzMiAqZm9ybWF0czsNCj4gwqDCoMKgwqDCoMKg
wqAgc2l6ZV90IG51bV9mb3JtYXRzOw0KPiDCoMKgwqDCoMKgwqDCoCBib29sIHN1cHBvcnRzX2Ns
cmZtdF9leHQ7DQo+ICvCoMKgwqDCoMKgwqAgYm9vbCBzdXBwb3J0c19wbGFuZV9jb2xvcm9wczsN
Cj4gwqB9Ow0KPiANCj4gwqAvKg0KPiANCj4gLS0NCj4gMi41MS4wDQo+IA0KPiANCg0KUmV2aWV3
ZWQtYnk6IE1hY3BhdWwgTGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQoNCkJSLA0KTWFj
cGF1bCBMaW4NCg==

