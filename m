Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63B8C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 06:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26tnPl0vkobzw2sdqh91hUjWCxIBcKCcCx9ZSwo+VmU=; b=YIaSArq6mb9xmEtWrIGAC80Y+h
	2ecrt4Kji7qN4ewqjj7hZE3T6OXnuofUmBlL9PRJjdkHXeKE8Ql9l0dQyfIn33UDoFNWFntx3oSc2
	YgnTnQQRzP1eDZUjZy6VhQ7Wl+h4V5TDC57plHstyhUqjDER5lxl4Uk3RXHSBcQWZaTorsZJnrlI6
	RryNxnGTNQvUnDL5WnG60VHyo5kIy481Cada+1QnBoNDjZnneH50pKpVXPCrX/Bb4SVaEDvJ4btCR
	TsTlWmNzZBwWoW+lW3AxEzc03a+lqcrwlPtv6Ow1brTunMZVTneEiaH22eopL2PhJPFux0ELuZKRt
	HUsZeIaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taqSq-0000000Bluk-0vbh;
	Thu, 23 Jan 2025 06:13:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taqRM-0000000Bll5-0Piu;
	Thu, 23 Jan 2025 06:11:56 +0000
X-UUID: e6e4b554d95011ef9048ed6ed365623b-20250122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=26tnPl0vkobzw2sdqh91hUjWCxIBcKCcCx9ZSwo+VmU=;
	b=j+vn9zON1dwQLH3IGIL4XTyuShSjQx4EBA6dTvF482rpaeyLIwBGzTyZpktB9MinWWceHq2jQKlXH8UiS8wxTMKFsq8NTSAk2knNL5XeduA1h8s/YXj4kWbrQXmLbNnfwjZimvlwHqqecbuC7Bn2NtYjmoPhPZiClazbtZsVnx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:9fb34531-7205-4846-a769-992e605d66b7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:2426987e-427a-4311-9df4-bfaeeacd8532,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e6e4b554d95011ef9048ed6ed365623b-20250122
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 129530090; Wed, 22 Jan 2025 23:11:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Thu, 23 Jan 2025 14:11:33 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Thu, 23 Jan 2025 14:11:33 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qaATT6CtvfcJiFofJn9ZiEx42+aWicBYDDM5MSCzpROMIlCE/40SC4ii67GSPtpTysLJ5JJCfffD8e+NDn1cRQaTOlc/Rwnwe5mX9jy435wV2rWNIfPJCvnw9LUXXt9WSY1F0njCh4hY8Pd9mTsuUbxsz5cRh8x/Q8cRDqKL04k6hOFlBbT4wUdbCIwTPheOf+sQ9dNgh5Ri+HxbjkbGhhk8AUcs74W9hy4WOFUHp0xz80lOhFZGDdEjz0hjwgUvckjMdJuhThFtTnj/LYTZj2cwSLBMRD9NqqgksGpk2pfXdtPuIz1qFSSmiJwI89V7xq1e5q7TdGL6DKt5cxNHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26tnPl0vkobzw2sdqh91hUjWCxIBcKCcCx9ZSwo+VmU=;
 b=LXRKrbMeDOyKFtKAx3Qbo2MT9/S8v+X6dmjg3MZdqLBPnVQ6VCRAftE4xd5RoH13jjvcU6RucvX6UIWarNsSObJSzW+DDWGTz+q129artQjsQRr5zhpDba+Rt65Bm01zE3ElZ2X60304Rn0OKwfdhMDxZZcOIDGjPg7NXBec8DPTDRCpjoQCmMNkfEcd+F/SU6ssAz+QO6DhWGKFRj1Hn4YY7W+QYPRViltCsMh8nK5hBHLcJeFZO8KDv7NvmyZh+MlIWrR4F1wE9NcQR50bRiINBccx1TfG9gr3eVMPuibkvKO/uViTzpWWCP9KHsjp5CpGCXlMtTu0q8Z/bE09UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26tnPl0vkobzw2sdqh91hUjWCxIBcKCcCx9ZSwo+VmU=;
 b=TlStsDmq7bc/smGOpzeslu6qOTNtwSgadf8ZKvIscMDhXC8uqNfT2vm9yz12GI5Gavl8F/K1ok++pc4YIQYVwla+nVvuxLNAUIl6Xf+iAuAoj4IbDGPUCZUTQYXMnVDMsc4c4NqF03fP8gy9CkUacH7FvSkVMNxHIfwQwWNoChY=
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com (2603:1096:4:1b8::6) by
 KL1PR03MB8373.apcprd03.prod.outlook.com (2603:1096:820:13b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 06:11:31 +0000
Received: from SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052]) by SG2PR03MB6636.apcprd03.prod.outlook.com
 ([fe80::98e8:d61:f404:4052%3]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 06:11:31 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Topic: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for
 MT8196
Thread-Index: AQHbY1yrDUiFOy83+0KImka1ZzUdabMQB4wAgAXBksCABoVHgIAHpisA
Date: Thu, 23 Jan 2025 06:11:31 +0000
Message-ID: <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
	 <20250110123835.2719824-5-paul-pl.chen@mediatek.com>
	 <173651725269.2671643.2891127782637834272.robh@kernel.org>
	 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
	 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
In-Reply-To: <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SG2PR03MB6636:EE_|KL1PR03MB8373:EE_
x-ms-office365-filtering-correlation-id: aa621421-e0ab-4183-7c0c-08dd3b74c7db
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?emRQRGo0REU5U3NUQklJejN6TmRUa2VLVENHNlZRdHpocEwxdzV3eWtxRERO?=
 =?utf-8?B?eHcrdm40bktraDI5ZnhrMWI1Z0hnamJVVXZ0Y1liOThTUzJiZXpkNHpRWHll?=
 =?utf-8?B?b3M2ZW1NS3RWWUYyTmZBOFRLaXZXSVU3emNvOVJzWlhrNVhmVUE0cnArT3V3?=
 =?utf-8?B?NzV2VWZPU3liQUpMQkYrTjdmMGdrQjZLOEZDM25XMVdhWWhSb0MzY2g0cWFQ?=
 =?utf-8?B?Y3p1NFFJV05vN1RnYWZtQ1JxM0dpUENBbHhtNElhOG11UzAvWVpZNXR2Z3c4?=
 =?utf-8?B?KzNpSUlhbWMvcCs5Y3BFN1VxWEhTcFU4WVdzendIaHFpakN1NVptZ1ZRK25L?=
 =?utf-8?B?RE80YWtGN2lOamRKYTh6TWh5TDJkekxVUDVHczRxV0Z5RFowWkRIWUlDZEwr?=
 =?utf-8?B?UGF6TkU5b0krL3BtZzBPSFJVZEdiQWhPeG4vOGJxTkQyaW5pazZwKzNnTjRr?=
 =?utf-8?B?VFVsMDRWMjQxQVBZRDJwOHBvWncxL0hzT3FmT01kYlplVmNZcHlaZHVaaFlR?=
 =?utf-8?B?TFltaVhTazNDbEl1SkFDNFRxd3ZnUHI3emZZa1JQSmtCQ3JSWTZXNWdPWm1u?=
 =?utf-8?B?VHBIRVJwV3o0V2dyNlVBdU0raW5vMEpQd1NzZzI1YU1KNXBad1dlU3huRld5?=
 =?utf-8?B?WU9TWkkvVDB0bktkZXBhZ2prUFBCL1Rpd2ZhN2VWYitNeDJyR211Y2NIclY0?=
 =?utf-8?B?VVZhQ003THpZV2taT3hSVGlRTGQyampjcjVkeHpBTmVnMVQzQ0pUYjN3T2hm?=
 =?utf-8?B?dFJsM2ZQMUs4NFQwQUhTd0ZvWE4xYVg1YW00eHd4bnRPNlAxdWFKSlBpVjFZ?=
 =?utf-8?B?WTIyTlhCbW9UU0E3YVo4czJNVGt5ZkZMdkpBa1ZyK0dadlpONFdDS1FYcXBW?=
 =?utf-8?B?TDZBOUVVMFdtak5rRXpDb2FYa2hIRWR6RUJ1akd2dVZLaDZTMGV0djRaanhT?=
 =?utf-8?B?WnlzRDdpU3h1QjNRSlMrN1M5L0tCaVNhQThKeWs5dEtrcENSaE9jRG4vV3hz?=
 =?utf-8?B?SnJkbTVrdmVxODZqdWY1U1NRNm9tREQyMXZOYzBudGN6d1Z5Zk1ZUkd6dkdh?=
 =?utf-8?B?Ujh5MkFKTSt0c1p1NG5sZ2htenIrSnZqMDh0VEZuZkRoZkRudTFzNG1Pblh1?=
 =?utf-8?B?YkNwOGsyMkdDRVVVMFgreFBWWjIrejdBVDI5RGViUU5md2VuOGdxMHJuOWdi?=
 =?utf-8?B?NGc1cmxYQm1GaXlubi8wVEFMSVZmeng1cy9uQWR2eW5WTDRBOXNQc0NXb09D?=
 =?utf-8?B?RjRjR3lweko4SGtlVE51alVMaWJPVzV4eHUzMUtaYWYzcHJKSWxvSnJLQjNK?=
 =?utf-8?B?VWcyaDlaOFpza0NqdzJHcE02UDFITmd5dUkrRnJINndSWWN3VXVyL0hHK3k2?=
 =?utf-8?B?R3E2OVE2b1JSVmM1UWd1dnl2eE5rRHFjQlhuUkdZUGFGTmwvVElKQ0l3USt6?=
 =?utf-8?B?ZEY5VGxGa3I1UFJ4ZjNvVXlJdXcxMU04Uk5NSU5VRWpUWG11UU9RaFRNbDZV?=
 =?utf-8?B?OHFQNWJVM2VnWnErOE9UeVluVXpTOW5qNkRFTWkyMlJMMnBaK0ZhSy9GOW5G?=
 =?utf-8?B?aHIxZzdtYnJKWTVhUm4wdC9yVU5KeGQ1TUxwdjMwa2Rnd2xzeDI0cjV2VXJ6?=
 =?utf-8?B?TWU4NS9uak9lQ3VybFNmRUxacnV2QWVMSE9kTTV4NVZLa0diZmF2ZjJHK2Zn?=
 =?utf-8?B?Rk8zT3Z4NjJScytTaFUwMkdGNWVZRVhraUtRMWRGWWdPakZUdXZCeTlSamRx?=
 =?utf-8?B?MW5pNEFNa2hrbUhnZzFCSDIyUFdCQVNzbklJSEZCNUV2WUFiYXFvRHpyZXRO?=
 =?utf-8?B?UnBiaHcxdmFZT0NhVTIya0tjMm9QRWw5ZlRxRzFYdi9KbVY2R25wc1VNaXEx?=
 =?utf-8?B?cHJOT2hyOUl5M0tEVWdKS1ovNjNEM0xXcXZScjJIZnZlN295VUpHT2EwSXBM?=
 =?utf-8?Q?unjuqT7NvhGcTpIN0xr/1pajuPTjvp5+?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB6636.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TERQeHVUYTBxOFRBMzdyRUpDL3RybWlBL3d2SmVSNkl3d2IwZTlMemNiZW5M?=
 =?utf-8?B?YjVBMU9Ra3hvUEQxdmlEb3J2SnBuQlVjTE5zcjE2RksvdzA3d2ZTNnVnTUQy?=
 =?utf-8?B?S0VDVmhVa3JxOG1YZWdpRHJBT0JqYSt4bTNyZE5LdlFoeG5CeGo1S3o2bk92?=
 =?utf-8?B?ZUZQVXRVMDJXNGZZZEtUZURKWUVKeVNQQzV0L3dBSXM5TXhpc3hrWW5wNUFi?=
 =?utf-8?B?YTdNcHZzSWNhWE1WdmFtVVRvOHBpZ0hBR0h1eDk5M04vcE03THhTQ0EvSGg2?=
 =?utf-8?B?aHBsTEtFUFBnR2JseWpPcFNYU1JqbUhJS20xbU1lQmpLc1hvS2lSUTNzRG81?=
 =?utf-8?B?bFVuaENzaTVGVjE5QkI2WXduUlhjOFNHb2REL2owa09kME9TQm1maTNVcmYr?=
 =?utf-8?B?SVU3ZU5XWS8wTWdzVEFjQlJmUGpydTZxOFdJOFJPdDRVVnhPQ250b2FGWkMx?=
 =?utf-8?B?bVlUem9aWnNnMGRYT2YxWGxxTUwvVGs4NnhSZDNFNUhWOThZYU0xamswc3VG?=
 =?utf-8?B?TzNicnZuRUdSRHZ5NVl5K2NNZEhzSGVaenVIRW1nUnZkV2ZXNzN5V0F2Tnl0?=
 =?utf-8?B?QzJKeGdsQ2d5cWY0YUZjR3k4N2RTMUhZVTN6SFFiODY5cVBnVmpPUXpSOU9C?=
 =?utf-8?B?WVdQeXJDa3EvRjNBa0dvTzBxRWk2VUJ4QmFmZk1ndFhGMEs4aXNuQzRTeUNH?=
 =?utf-8?B?YTB2eWFuczR5eUZYZmk3bWtxcUNUK1VuRUIreVVrWDV0KzdWN1NrZFNoNWJ0?=
 =?utf-8?B?aEo1endnM2RNRjhwenpXZ3VCZ29pVmRkVEhaRHVnTm10N04xOE5HQXc0cDU0?=
 =?utf-8?B?VjgxNzQxaFp5b21vckh5dDJxNTgybEQ1NCt3SEtxVXpvcnBha1FneVd3a1Fv?=
 =?utf-8?B?SEx6emhyZTlvRHpTb2dDRUZ0Z1VaSTVvR1ZQU3BzY2xoQkdCa1FXVkJqYW10?=
 =?utf-8?B?Q1NpelNGQWhpSkRrMlFsOXVDbkZTak9GMjJIVm9DSWRFU1FZYURuV3hpN1JC?=
 =?utf-8?B?RjJyUkpyU3ByVXB2YStocFBrS2NYRWtKY2VpK1AxQ2hMNHhnOC9tOUoyWXl5?=
 =?utf-8?B?czlUQldzVStlK2xGMlFndFd3aHlLcXhyYzhCeHBxOVBNRlk2R2daNXBqZnRv?=
 =?utf-8?B?RVNSZHZWcVRnbnpVNVFHMjFNV1NLWDJyWVk2cDFackVwMEQycDR4emMvSDJv?=
 =?utf-8?B?T3FIUForV1AzRDFQd0kvbmJNQU41ZWplbE13cTFUbWcxZG1zekQ2WFRUQ1VG?=
 =?utf-8?B?ak1HUVVnU1V3aVdIT1EwS3hSelFma1FVOGhORmd0YVhidUxXNnJsK0ZJMUNJ?=
 =?utf-8?B?c0FleEVSWm90WVAwb0pqTDBmYzk1QjJCT3hnMEY3ZktFdm1hT1Z2QjZvUEFs?=
 =?utf-8?B?Zm9LMERFVVlqcWs2aDN4b2JsRCszME1haGRUYU1sckROc0ZueG53b0ZLK0Fy?=
 =?utf-8?B?czgyYjAzVDBraXBEcDJadzNML000Zk5UM2RDSWZGWGx4dW5JU3pkSUVjK2dh?=
 =?utf-8?B?ZWcwSU1qNkVxY2xIZE5seUdBWld1WmlIeXYxUnFGYWpKMFhocHliUVVHc3gx?=
 =?utf-8?B?emg1S01IakcrYmR6SllvUUpFb0NQdjhpUXp2MkpTNmNSR0VNeWZDU0hXOFZi?=
 =?utf-8?B?bWNPWVNqa3lDK1dLRHpjdkdtbjBPWDhibGxFZFhSb0lFdVJXVS9hck1tcnZz?=
 =?utf-8?B?Ym8raVJadE1mNTZqaWd5NXpJUTNxejg5OHNCUG9FTzlicXJ4ekszcCtPWDg4?=
 =?utf-8?B?M0I0bHVZQzJ0c1Q2aVl1SUFhZkpHUEhiQzBqa1ZjRHN2ekZwekZZUmUyZEwy?=
 =?utf-8?B?R1F4WTNpQk85S1dQUFhQVXV6UldEK2pma3dXa1hkU20zQzNMSHZqcXhZM0RK?=
 =?utf-8?B?UGE4QnlRN2FQVFozcWlmQ0pzL0locXFWTTZPMGJlejYwd0xZWXNCbnc0S2hY?=
 =?utf-8?B?bUFWZE9FbE9YNzQrRXNBR0U0NzAzaE1JekVYaDdBU0pwUE9haytLR3h3THFy?=
 =?utf-8?B?bnhaMEhyNlVLemFEcmxvM3pHSmtBb0VYMWQ5Tm9zMUxZY1VPTnQvaVR3Qm8w?=
 =?utf-8?B?RFJEMTBLU2VKUDJ4NFdWd2tpSHF3UGNRTnlFZ2F4S0VRdnNITVdxZ2ZOSks1?=
 =?utf-8?B?eHhIYzVBakl0UENodDNVMzVuekdveEo5RUFwc2tIU2tNTVdsRzF6eWpmWFlR?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D0B7E95203C4547AA15AED762F527B1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB6636.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa621421-e0ab-4183-7c0c-08dd3b74c7db
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 06:11:31.1709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rqG5bU8Lo5esLLHWkYPZKniOrl4cxfe+yetZYqdRPgRiSRWRoIYT1mEqEcHIfm74KFqPUtqykvJF+CQs3biu25QzqAa9nbtlciX0hp3Tmik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8373
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_221144_161751_4716F7FE 
X-CRM114-Status: GOOD (  16.70  )
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

T24gU2F0LCAyMDI1LTAxLTE4IGF0IDEwOjIyICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBPbiAxNC8wMS8yMDI1IDA2OjQ5LCBQYXVsLXBsIENo
ZW4gKOmZs+afj+mclikgd3JvdGU6DQo+ID4gSGkgUm9iDQo+ID4gVGhhbmtzIGZvciB0aGUgYWR2
aWNlLg0KPiA+IFRoZSByb290IGNhdXNlIG9mIHRoZSBlcnJvbmVvdXMgbG9nIG1lc3NhZ2UgaXMg
ZHVlIHRvIG1pc3NpbmcNCj4gPiBwb3dlci9jbG9jayBkZXBlbmRlbmNpZXMuDQo+ID4gT25jZSB0
aGUgTVRLIGNsb2NrL3Bvd2VyIGhlYWRlciBmaWxlIGlzIHVwc3RyZWFtZWQsDQo+IFNvIHRoaXMg
Y2Fubm90IGJlIG1lcmdlZC4NCj4gDQo+IERlY291cGxlIGRlcGVuZGVuY2llcyBvciB3YWl0IHdp
dGggeW91ciBzdWJtaXNzaW9uIHRpbGwgZGVwZW5lZG5jeSBpcw0KPiBhcHBsaWVkIHRvICpMSU5V
UyogdHJlZSwgbm90IGV2ZW4gbWFpbnRhaW5lci4gT3RoZXJ3aXNlIHRoaXMgYnJlYWtzDQo+IG1h
aW50YWluZXIncyB0cmVlLiBJIHJlYWxseSBzdWdnZXN0IGRlY291cGxpbmcuDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg0KSGkgS3J6eXN6dG9mIA0KDQpJIGhvcGUgdGhp
cyBlbWFpbCBmaW5kcyB5b3Ugd2VsbC4gSSBoYXZlIGEgY291cGxlIG9mIHF1ZXN0aW9ucw0KcmVn
YXJkaW5nIHRoZSBFWERNQSBjb21taXQgcGF0Y2ggYW5kIGRlY291cGxpbmc6DQoNCjEuIFdvdWxk
IHJlbW92aW5nIHRoZSBleGFtcGxlIGZyb20gdGhlIEVYRE1BIGNvbW1pdCBwYXRjaCBiZSBzdWZm
aWNpZW50DQp0byBhY2hpZXZlIGRlY291cGxpbmcgZm9yIEVYRE1BIFlBTUwgYW5kIE1USyBjbG9j
ay9wb3dlciBoZWFkZXI/DQoNCjIuIElmIHJlbW92aW5nIHRoZSBleGFtcGxlIGZyb20gdGhlIEVY
RE1BIFlBTUwgaXMgbm90IGFsbG93ZWQsIHdoYXQNCmFsdGVybmF0aXZlIGNoYW5nZXMgY291bGQg
d2UgaW1wbGVtZW50IHRvIGFjaGlldmUgZGVjb3VwbGluZz8NCg0KVGhhbmsgeW91IGZvciB5b3Vy
IHRpbWUgYW5kIGV4cGVydGlzZS4gSSBhcHByZWNpYXRlIGFueSBpbnNpZ2h0cyB5b3UNCmNhbiBw
cm92aWRlLg0KDQpCZXN0IHJlZ2FyZHMsDQoNClBhdWwNCg==

