Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465A5C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 11:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ra4nKsih27IUnZC/n2YOLCp8y2+C3irwAmeoQjBCdOs=; b=N58+naYMEg1WMMSvBi4L2z9N9+
	GHMHpZY1DoUMLCOlLE88cGiso6cPQYlNsEfq5sqZVFJQMUhW+LHG7/lfeHjn4Et9iokFo8ptCgFCU
	SOs0/ULbFnwwthOGhoVH/7i0kN3Cm8ccWCHX8fIdVmyi48YCWMDAaLkc/IzsAifC5oRwQavGy1a2m
	qFMDeMLtbBnZ/VBOgZ9j3WrAlS3jYKDyk8t6x0Ztvctt2Ks3WYH4rRWUL04tReEftmlATOaaOLDsG
	879i8vQT1oNk5VvxDpeJ+B+zRfCJonaTR9eDiy9aJ3CpG913Cx6ChdeVHow9oFp5sa6+1aEN3rS3z
	TuYKmPvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9Lo-0000000Am5H-0a4e;
	Thu, 06 Mar 2025 11:25:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq97h-0000000Ak3r-3f5W;
	Thu, 06 Mar 2025 11:10:43 +0000
X-UUID: 9eb00af8fa7b11ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Ra4nKsih27IUnZC/n2YOLCp8y2+C3irwAmeoQjBCdOs=;
	b=E9lo1zv3BN8OrUNXt+L30gi8icXNsfg5aaly7Yigul8f6fplWHR4n2d8V4zHSJySQl28RKNDUOgGZXuXstMrV/blmWPVsW0rbud+2YPJ4nH6/CTRyzLIsqmjR9ml4xsFhUux3bu/s6Klb5jS2C21+H6UOfWpzslzE7wKfgS0gYk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:f4834146-3186-4bbf-a1f6-66c6c525bbb1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:268619ce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9eb00af8fa7b11ef83f2a1c9db70dae0-20250306
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 223531626; Thu, 06 Mar 2025 04:10:32 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 6 Mar 2025 19:10:29 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 6 Mar 2025 19:10:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emk750g+ZQZWLDewhjGv1oaQpEWUOBQTd8B+JETxXQTvt2nEdTp69/MI7DvxWbe1fP5MCb+kxMBSe/JK4tiqEKShZ8G/iZmw6YsiVSxoCNeWRFPyIypdrbxjw4upUQRhQz/sa7t9hjm1Eg+KeHgQ+sv8h9masWIXP6iSSxhCNEKkB76IS0c29Ye1rZ89snT4UopqVg8PMOSy07cpgWbTtUTM/FhYZ6Ea1cTbh+nsWsidcIyjEEk0TgtAddJXvaBHYTaVwXKRArNhgfjaXVzepKPTAD3TJ2MYMlgC4EvcR39xQpc+RYHKcfJUou6nu7U2yrWIkraILSRPhdW3eX7VjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ra4nKsih27IUnZC/n2YOLCp8y2+C3irwAmeoQjBCdOs=;
 b=iZarg5OJcHKEidA+pL/RiKCzWcKJIgobWgg5WUyqHKLLBNdj+sIVfyPiMohe71yklP9CA36U5rMiWCHzjtXUKmVD1HKPJlolzZ8hUSVzT6P1pJ67pT+rl5gYepgsF+TAhkDgmZRYpd27dOyiiwmdYz3RH/5vd6qwP0W8KT4ykFAVkno3mGdMZm3g1q4WU5uvvfWb0kTT81/jHqHCiqU8ntakXFmUb3KtOYKUVHx9xGmsTtN1Ttv0G+cnxBpBtvLNCAXHvXWsHTCGa+rfBf+acktwdZ/WFhEWHBBGF8e8jLroOEq4E7qRQt5SG2Uw7aWS22Rg5oilLbALfAEHZtvJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ra4nKsih27IUnZC/n2YOLCp8y2+C3irwAmeoQjBCdOs=;
 b=sjnkADwJfGF0YulFtEcl8ZOtv97cNr9N7VZ+DyzJN3i63kJCQudsKYGT0w6hBzOkr5G8IFi5NEr4puR08BuFFp4xwTy68I6Xv+K/LWJDfaRPqDA9W9NT/e6fyZYrpSwZv9S/tw1QOr+opfqVEfwx8JVDR40bxNXUV6fAzsT4jtM=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by JH0PR03MB7927.apcprd03.prod.outlook.com (2603:1096:990:34::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 11:10:26 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 11:10:26 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WGF2aWVyIENoYW5nICjlvLXnjbvmlocp?= <Xavier.Chang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org"
	<treapking@chromium.org>
Subject: Re: [PATCH v4 7/8] drm/mediatek: Add programming flow for unsupported
 subsys ID hardware
Thread-Topic: [PATCH v4 7/8] drm/mediatek: Add programming flow for
 unsupported subsys ID hardware
Thread-Index: AQHbgchC1LDQOm8+tk6+Bz9oOtAgy7Nl9hGAgAAXFIA=
Date: Thu, 6 Mar 2025 11:10:26 +0000
Message-ID: <5132cd9dd130917d0d08fc8c2e5057e7e5cef040.camel@mediatek.com>
References: <20250218054405.2017918-1-jason-jh.lin@mediatek.com>
	 <20250218054405.2017918-8-jason-jh.lin@mediatek.com>
	 <d1c2dfa8-c7e0-40b2-8b39-c04854e3ee24@collabora.com>
In-Reply-To: <d1c2dfa8-c7e0-40b2-8b39-c04854e3ee24@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|JH0PR03MB7927:EE_
x-ms-office365-filtering-correlation-id: 135bedd8-10fc-45de-68c6-08dd5c9f7f80
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d0wxRXJFOGVDZjdTdllBSG4zbTNtWmxRTmVKVVFtREpTclJlZlpCVHBHS2dw?=
 =?utf-8?B?bjB5RDAzTEFQUE1UYXV2RlNPZmoxU0F3NXUycktRTmZnQXFNQ0NHWXVGNjBn?=
 =?utf-8?B?dHVjWGZ5UEpqOXNvc1dTdk1mYTRrQ0pSRGpUUUtWVHlDb1J0NDZrTEc4TWly?=
 =?utf-8?B?VFRSSkRpUkgxUTlvN2tUbWQ3Qk10cUhLRHlMTkJMWHFnUWlXTFVxalRlNkxH?=
 =?utf-8?B?MWVKeWNQZ2x3eVNNSlcxMFJNdHVLM0VwQWh6Z1lMNjRmT2FDalRJQ0ZTWDdL?=
 =?utf-8?B?VndaWVR2elhXQ21WTjZSVExyNGpEb1RVVUZpNk9BU2NyRkcwd0hPZXB4QjNS?=
 =?utf-8?B?dWh1b0FncjRNbTV3ZVJieXo0ZVFKUGI4N1NzelVydmhKNkVINys2Nyt0bDVj?=
 =?utf-8?B?SXFQVW1mOUY0TFJHaHFIdkZCckxVS3VMUmNoSEhUWTBIdTlTaU1IWVh0bVJ3?=
 =?utf-8?B?Q0pXcmI5amw2a1F4NGpGNkJVeklCYWtvZUgwV2ZWUWJDZzBiVUdTY0Rsdy8w?=
 =?utf-8?B?dTJuSGNIU0RCeXhKZHBPTmxocTFZZmw3QzVKZHp0Q1hVNXhaOFo0UFVYZDNF?=
 =?utf-8?B?Q2lnd01HTC8vWVdFZW5BRVhQL2lBaVdOZkJGelpFS2RyOXlWV1hzTzdJUFlp?=
 =?utf-8?B?dGxRTTFuNjFMV2xpU1ZiOGltd0JnelZLMk8xUjhVN2R0VDNIMC8xVy9oZnUx?=
 =?utf-8?B?NFhFeUFXUENtd0dTcFV4ZkEzUE9FRnNNNFg0MVBRRkJidnplWStJeVZ4aGYz?=
 =?utf-8?B?SzVLUUlZaVczYTcyQ3pCT0VpTmwvcWRId2hHUG5IaHNUclNkeVgxcnUwQkti?=
 =?utf-8?B?WUZidkh1QlhyK0hTRWs2NmVxcDVHM1pUNitHMjRoTjZxbzU2Y0Y3REpYQUlG?=
 =?utf-8?B?UmdPbk0zMi85SGVjVWx6MXBQZzhxY25iK1A1TlhyUG16b3pjalpPdERiS2lS?=
 =?utf-8?B?OVZOK255VXk3OXdhR1ZOcmw4ZENpM1p5SkVPN3pqVjFZNXlaTUtrdWhaOU1X?=
 =?utf-8?B?eUN2QTliMkozZVRyZzE2NUN6am5DdHpIUzRMNnBPOUhsNUdBUm9lVWVpSmNT?=
 =?utf-8?B?QTE1cTdNY0c5SVJOR0lTckhpTVdaYUJDS3NNSFBSZ0t6aFlpR3FoM0xBV3VD?=
 =?utf-8?B?c0pmc3U0ZVVVK2h4a3NFRVZ5N3hxbWc5NCsyVjlsTlRTdkEzSUVObEp3Yzc4?=
 =?utf-8?B?djlFWjZiSGRoaWpqaDZEd1B2MS80MG5BK2JTTEFzejNQRlJIbEpURXlmRkVY?=
 =?utf-8?B?VW1lcDNXZmF4djZpUDdsWFNtV1hscmhXb3BDemhrV1M3RklmZ1pudEl0ZmRV?=
 =?utf-8?B?d0Fxd2NlbDdPZm52OVRnUXdTeFNJMkVlNDJ2ZlhOL0RGdmpjbzdIcGZHVFBT?=
 =?utf-8?B?TllMZnJRaStoeHZUOGNETTgxMnVPMHduRFZHcHo1ZlVGTVZzcUo2eHBROW4r?=
 =?utf-8?B?T1NvT2hHWVpNUmkxdmI1SzdFcHNFd294WTR1WjZ1NkJVcDQySkpEWDFTbVFr?=
 =?utf-8?B?SGd6c3owWjgyMVJnMkIrRHVMV2hMRjQreXl3U0VtZVVTTmFrbWMrNmNqUzVY?=
 =?utf-8?B?eWtpSFlINEovdzB5MTVqYnI3Zmg3eEQxM1QrNzZmeVpEdCs2SEFGVkQ3VC9j?=
 =?utf-8?B?UUpUaklQTWxDVzR4VUpNMTlWMnBYNlZ5NVdZdGk1SnV6a1RDclFPdCtpa1Jl?=
 =?utf-8?B?c1JHZGo3S0Nzcnp3YVVnVlI5UndTWCtiNG1YNWNTY2twTUpPaGNwUHdNanNy?=
 =?utf-8?B?cE15TDFXZHN5T25nNEEvdGlRSTVNZDZTbEw5aDJUOFU5dXRpVGJoT3lXcURL?=
 =?utf-8?B?SHBlalQyWDFpcDhkUjNIbmZoMjlncVV0RThRS2hIRWlGN1dJVEU0VXUzRUI4?=
 =?utf-8?B?a2lIamxLdlRpd29NSWxmWGtFRCt4NmxiYnA1SjMxQ0JmN0tWNkdWTlFESU1E?=
 =?utf-8?Q?m5PeEYcqdSnVWJsCIilUrkjYpXF1UdnF?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WldxUTZDNjRpbFlKZ2pDYk9oRC9rMUMveVZDd3RWSXpWY3o2eU5JVHFpQW5u?=
 =?utf-8?B?U2MrL25Tb0tvTXY5eTV5cS9jalpNMis4QWh1YTdZNG03Vm95SXBZLzlnMVJD?=
 =?utf-8?B?RVlJQ1dCK00wTnZWMDRrMWVvVU1yU01Lc2JEY1VnRHFJa2xCUEh4cmpuZFhG?=
 =?utf-8?B?QnNmR1RNdzkrNTVob2dxeEZqd3QwQzAyM01FQjFqckxodWhSNGhQR1o4eDVu?=
 =?utf-8?B?OHAzSVJIMDdKOWpMWTF4MkFSK0NUazVDYnByZDlNZGRLazh6aE0yNExaZWZw?=
 =?utf-8?B?OHJjVUs5YUJaeEZjZm42aVhWT2x4NkVJNDk0Yy9DSVZTQjdvTy9xWThqUkQ2?=
 =?utf-8?B?Z3U5TWZRUmRRL0JhQ3NZNzJFa25zbWZod05NUndmWVBxb2dqUFhGblZzekZu?=
 =?utf-8?B?Y3hlcmVSRGJWelpZTThxVWllRFdDRFUwMllmNjdPelc3WHEwcDFmRjdUWXpE?=
 =?utf-8?B?dDJLVllqWjEwVS9sK2xtNzBIRkwzTlg2YTNSdnpETUdHYU5hNnVzMFBzVm51?=
 =?utf-8?B?cis3U01IbzMyc09WWDhMV0VITGtkK01jNll5Y3hXNUo3Rm01TXlML2ZYbzNQ?=
 =?utf-8?B?RGdHejJBYTdrcUdMN1BkelRiSThPdnB5TkM3MkhUdXJLaFkyK29IN1U4QjJx?=
 =?utf-8?B?Rk5Vak4xSUJYNDNTNmNtblJxZHVWbFN6QUpTZSsrK1dhVy9aeEVpNzM1STFt?=
 =?utf-8?B?QjFGMUdIUnA4T1JYbkRDMjZNRHcvMEhhRVNvNk5LbUJ1WnNscllQakJ4YWUv?=
 =?utf-8?B?MWdtTmtUaWRrdE43RHpGd05oRmlHcE5KVW51RjVYZC9HZTFTMFhDM0w2Z1pS?=
 =?utf-8?B?NGlvVjN5Y1FuZ2R3VlJCY1liL0lFcENRclQ0WmVOSGhHUUZDL2UwMGhwNWZ6?=
 =?utf-8?B?MWdRb2ZlSHVxZnZ4bmIxWHFOd3hJRmN1a21INkY5NlY2Skg5cHdYc0FxN2dQ?=
 =?utf-8?B?MWtMV05BRVZyQ2ZiMUxpbkFqeUgzcXJRU2ZKeTZKQlBXMGNZUmphdUxUV3dB?=
 =?utf-8?B?L2JIOEhqdCsrdFRQS2hwamtiaUwwV2lORnd5WnFYRGluWHFaT3lOQTF2QWhk?=
 =?utf-8?B?dkM2akloNUdzSENtOHEvd3ZZZUo2eXViNmVCZTVlV3JsazluZ2tOTCtycHFp?=
 =?utf-8?B?WmllSVRXenpkRDVnNTJSRFd2STRGMGtqTFl4b3cvYXEvbUlzdEZ5SnNtUXVa?=
 =?utf-8?B?Y2pFMzYwQkFaS0RzZjBTbGRWZlQxWnY4dDdYYUprYlIzT2lCcHFWKzNueUlJ?=
 =?utf-8?B?TnpvNmF5d0JoaUl3ZDdPV2tYekMyV0t5aFA1dEErelZwa2pzUFp0R2FrSk9D?=
 =?utf-8?B?M0UxQ3VBWitSRk9kWW9rN21Bd1pGY2VlQ3ZxYkxyWTl5M3lhNFZTK3hFZkN3?=
 =?utf-8?B?eTRCQUJpWVFQd2Q3QUJ2d2FaeHB0ZnN6ait4ZTlFbXdmNlk4MTcwbkZVdThJ?=
 =?utf-8?B?cTJBNDJTSERrNUxSVjVvRmpBNjRJSDNFelVlMDh2dUhCVm5lbDVOemhHUlBo?=
 =?utf-8?B?NUZwZURzWnpRanpxaFJ6bFRKcDRJQWtJNUJhMUlvTVlvSGFyd05JNmp0ZkNj?=
 =?utf-8?B?Zy9RS0tkalhnMTZ1Tm1FR0JKQjhWZks0VXBWRUFJQ3VtNGppQWtaNHhEeXlD?=
 =?utf-8?B?VnZSeTNxcVdEZFhiOUxWSUIyWnNHWFJ0RlV1UjhST1hnK2tDTVY0ZHVrZ2RN?=
 =?utf-8?B?YlMwd2pyTjZsK2Fnb05uT1UxOXZaRVZMcFErZ0d1MlBQUjVlSTJoVXdnZkE4?=
 =?utf-8?B?OU4vVHRJYWVYZ2tBUVVQYUJFdTlsR3hHZmpiQytua2NPTldKYlcveGtFMUxu?=
 =?utf-8?B?VWxjSHBvdlZPVy94QWtpR2xodmFYWU1LdGVQU2pVYnc3TDY3eGt4VGdMeXNi?=
 =?utf-8?B?OXlMd3VtNkVrR3dHTkI5Y1lHbzlHRzBhVU04TFZ1SEw3SDZYTmM5L0hDMWVM?=
 =?utf-8?B?SWc5OE1od0ticUl4ZlB4UkdpUGFodGFLSXFnQ0xtZHExQlBVUU9SMkRZWG55?=
 =?utf-8?B?Z1NySWozQzlHWE1mVzM5bWowUWZRbUV0Ly83N0lhOWt4b1JlNnY4d3A0Z1Rm?=
 =?utf-8?B?aFVOTmJYcFpIQXN4N3JUdGxTdXZyajNZWEVsL1ZrdEhodXpJdTVvU0VRbXd1?=
 =?utf-8?B?R2xpMjRBdk84OENKMHJYY2o4VFpoR3pQTjJ4VWZuTURQRUowWmkwOWg0alBE?=
 =?utf-8?B?ekE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF52C0C540273A4AB855362691C7F5AC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135bedd8-10fc-45de-68c6-08dd5c9f7f80
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 11:10:26.4443
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /AZ8YDYTrNL+EwcbRngfohP0hOHTKkT3bSNNnpA+3T+AYcMZCx/urp8y1T5B5hHrKKZTCp37zY3UWuWkOHIhsunGVpREk3sCMdqtwF2exnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_031041_941075_C9C07C1C 
X-CRM114-Status: GOOD (  17.49  )
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

T24gVGh1LCAyMDI1LTAzLTA2IGF0IDEwOjQ3ICswMTAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToKPiAKPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbAo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5k
ZXIgb3IgdGhlIGNvbnRlbnQuCj4gCj4gCj4gSWwgMTgvMDIvMjUgMDY6NDEsIEphc29uLUpIIExp
biBoYSBzY3JpdHRvOgo+ID4gVG8gc3VwcG9ydCBoYXJkd2FyZSB3aXRob3V0IHN1YnN5cyBJRHMg
b24gbmV3IFNvQ3MsIGFkZCBhCj4gPiBwcm9ncmFtbWluZwo+ID4gZmxvdyB0aGF0IGNoZWNrcyB3
aGV0aGVyIHRoZSBzdWJzeXMgSUQgaXMgdmFsaWQuIElmIHRoZSBzdWJzeXMgSUQKPiA+IGlzCj4g
PiBpbnZhbGlkLCB0aGUgZmxvdyB3aWxsIGNhbGwgMiBhbHRlcm5hdGl2ZSBDTURRIEFQSXM6Cj4g
PiBjbWRxX3BrdF9hc3NpZ24oKSBhbmQgY21kcV9wa3Rfd3JpdGVfc192YWx1ZSgpIHRvIGFjaGll
dmUgdGhlIHNhbWUKPiA+IGZ1bmN0aW9uYWxpdHkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEph
c29uLUpIIExpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBD
SyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiDCoCBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RkcF9jb21wLmMgfCAzMwo+ID4gKysrKysrKysrKysrKysrKysrKystLS0t
LQo+ID4gwqAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RkcF9j
b21wLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kZHBfY29tcC5jCj4gPiBp
bmRleCBlZGM2NDE3NjM5ZTYuLjIxOWQ2NzczNWE1NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGRwX2NvbXAuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kZHBfY29tcC5jCj4gPiBAQCAtNjYsMTQgKzY2LDM3IEBAIHN0cnVjdCBt
dGtfZGRwX2NvbXBfZGV2IHsKPiA+IMKgwqDCoMKgwqAgc3RydWN0IGNtZHFfY2xpZW50X3JlZyBj
bWRxX3JlZzsKPiA+IMKgIH07Cj4gPiAKPiA+ICsjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtf
Q01EUSkKPiA+ICtzdGF0aWMgdm9pZCBtdGtfZGRwX3dyaXRlX2NtZHFfcGt0KHN0cnVjdCBjbWRx
X3BrdCAqY21kcV9wa3QsCj4gPiBzdHJ1Y3QgY21kcV9jbGllbnRfcmVnICpjbWRxX3JlZywKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB1bnNpZ25lZCBpbnQKPiA+IHZhbHVlLCB1bnNp
Z25lZCBpbnQgbWFzaykKPiA+ICt7Cj4gPiArwqDCoMKgwqAgb2Zmc2V0ICs9IGNtZHFfcmVnLT5v
ZmZzZXQ7Cj4gPiArCj4gPiArwqDCoMKgwqAgaWYgKGNtZHFfcmVnLT5zdWJzeXMgIT0gQ01EUV9T
VUJTWVNfSU5WQUxJRCkgewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobWFzayA9
PSBHRU5NQVNLKDMxLCAwKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNtZHFfcGt0X3dyaXRlKGNtZHFfcGt0LCBjbWRxX3JlZy0+c3Vic3lzLAo+ID4gb2Zm
c2V0LCB2YWx1ZSk7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZHFfcGt0X3dyaXRlX21hc2so
Y21kcV9wa3QsIGNtZHFfcmVnLQo+ID4gPnN1YnN5cywgb2Zmc2V0LCB2YWx1ZSwgbWFzayk7Cj4g
Cj4gU29ycnkgYnV0IHRoaXMgaXMgcG9pbnRsZXNzLCByZWFsbHkuLi4KPiAKPiBGdW5jdGlvbiBj
bWRxX3BrdF93cml0ZV9tYXNrKCkgaW4gbXRrLWNtZHEtaGVscGVyIGlzIGRvaW5nOgo+IAo+IMKg
wqDCoMKgwqDCoMKgIGlmIChtYXNrICE9IEdFTk1BU0soMzEsIDApKSB7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IGNtZHFfcGt0X21hc2socGt0LCBtYXNrKTsKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVyciA8IDApCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+IAo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZzZXRfbWFzayB8PSBDTURRX1dSSVRFX0VOQUJMRV9N
QVNLOwo+IMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gY21kcV9wa3Rf
d3JpdGUocGt0LCBzdWJzeXMsIG9mZnNldF9tYXNrLCB2YWx1ZSk7Cj4gCj4gaGVyZSB5b3UncmUg
ZG9pbmcgdGhlIGV4YWN0IGludmVyc2UgY2hlY2suCj4gCgpPaCwgSSBkaWRuJ3Qgbm90aWNlIHRo
YXQgaXQgd2FzIHJlZHVuZGFudC4gVGhhbmtzLgoKPiBBdCB0aGlzIHBvaW50IHlvdSBjYW4ganVz
dCBkbzoKPiAKPiBzdGF0aWMgaW50IG10a19kZHBfd3JpdGVfY21kcV9wa3Qoc3RydWN0IGNtZHFf
cGt0ICpjbWRxX3BrdCwgc3RydWN0Cj4gY21kcV9jbGllbnRfcmVnCj4gKmNtZHFfcmVnLAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1MTYgb2Zmc2V0LCB1MzIgdmFsdWUsIHUzMiBtYXNrKQo+IHsKPiDCoMKgwqDCoMKg
wqDCoCB1MTYgZ2NlX29mZnNldCA9IGNtZHFfcmVnLT5vZmZzZXQgKyBvZmZzZXQ7Cj4gCj4gwqDC
oMKgwqDCoMKgwqAgaWYgKGNtZHFfcmVnLT5zdWJzeXMgIT0gQ01EUV9TVUJTWVNfSU5WQUxJRCkK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGNtZHFfcGt0X3dyaXRlX21h
c2socGt0LCBjbWRxX3JlZy0+c3Vic3lzLAo+IGdjZV9vZmZzZXQsIHZhbHVlLCBtYXNrKTsKPiAK
PiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gY21kcV9wa3Rfd3JpdGVfbWFza19wYShjbWRxX3BrdCwg
Y21kcV9yZWctPnBhX2Jhc2UsCj4gZ2NlX29mZnNldCwgdmFsdWUsIG1hc2spOwo+IH0KPiAKCkkn
bGwgY2hhbmdlIGxpa2UgdGhpcywgVGhhbmtzIQoKUmVnYXJkcywKSmFzb24tSkggTGluCgo+IENo
ZWVycywKPiBBbmdlbG8K

