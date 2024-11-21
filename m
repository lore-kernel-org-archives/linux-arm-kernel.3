Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ED2D6ED01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 10:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH3OefbcRv4Pzg9UBRTH1h99dGJNLVeeswC6yD1i63o=; b=jSS7i6PfktGJcVC6h8LopTT7+c
	dgxaaEb+XE3sPc54YpxjWAR5m3VAAXnPInAq9SvtKNABohKqMQLr3uiJ4yrP1hALBCuR5V/GCpMzG
	yVOOU9fXqMLbEWI//Dm8qy2cuNCLsS117goFFH8OTKMgu4iVc3y6eNFFsK5/hcaLujh3PRPuV2BZ/
	7IrYOD7ryx7j175zHDouYrOw9WGltrebHBoO01+PvFJdlpESDDg7RbL132qG9T9kM/N5SX4+tEDR3
	Gc6hLNjgnpVHLtK+fzah/dF2VIHyLi8ZshP4PCD5CQrbKGVeGfD89m1cdnXlfIv6ZMvdyLlyGNqNI
	jWyAhAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4nT-0000000HP0O-4BQ1;
	Thu, 21 Nov 2024 10:52:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4mX-0000000HOuD-2AZn;
	Thu, 21 Nov 2024 10:51:30 +0000
X-UUID: 8e677168a7f611ef82ff63e91e7eb18c-20241121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=BH3OefbcRv4Pzg9UBRTH1h99dGJNLVeeswC6yD1i63o=;
	b=n9/5AtFrmVZh1zEC3almBKWtUw+cGl85bD1zy7an6vDqRB8XNEmuakFgay+52SK0KrtnNa2i2ePQ0Yyj1EtoHE4YUE87SvLyuC7/ADpXa/E7a1LZz8lbcP9RBw6XhySxGfJpMvhYjNPFJ1s3P1XzIEN6+iEv+H81OP8/PTtq02o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:d5c54684-5bd9-43b1-8e36-0e11363dcd18,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:72c62cb9-596a-4e31-81f2-cae532fa1b81,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8e677168a7f611ef82ff63e91e7eb18c-20241121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1524831192; Thu, 21 Nov 2024 03:51:26 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 18:51:23 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 18:51:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5PMsWlbGWdC82cHsDb+HxNQ9/TD76osEj5ZNtxpDijuWUid+T5JbYxzB3cWbYLWeX+cweO8eiCpcqLuOvTNuqzzsrQW14QfdpOuaNyoJknTRBqpRbZF/6PP/DI5nNPTMAv5NgJjBJ2s9PFIwUFBJlzu0iYeGJxLFOvSuMe/MB7XgSpx8fBXTu9TDShntXp4ZM0/YyLSbsLLKEY/D3PpXaScTJY7LRq4flst2uHAqzw7NzExATdZb14imP6Ca9ddob/MNWGPG+c/WQhHIHFgjfPu/BPkmegepkIYb+TxegIzBsq3Sw5JmaSG68EKl3ROu8QowGQ89WEnMDSgNy4n4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH3OefbcRv4Pzg9UBRTH1h99dGJNLVeeswC6yD1i63o=;
 b=k6VnmVf4mTM1mp7ZvL8a78fIo5DVCeKE1eWzkLZLjxKTxhUeszdGfGpd5gFX0P6K71XTB8S6u0wNWY1RGSX4D2V/AReKVS+vpXO4ooVQunftyeojrszF3BsyFYlLKbTehPV9jGMeQCHwIwiEWrvzukOPGlZqbdXgL/ZXJyfK375VlF/bWMH/AZONE46HPdBGrmFnyI+fYCVmNlOaioDtB789cp7LXStLckSNkgmi5lb61bHf7x/ohxBDqlSi19DcR25YALw2m7h0m+4OmDoYOGJ7qGSnUq94QBIus1HIgWpE1TUmRLInpibJdwaiTm1zcsxuFc9ueYtzNOCXUobSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH3OefbcRv4Pzg9UBRTH1h99dGJNLVeeswC6yD1i63o=;
 b=S0Rqlrf/4LHtmT6Eyg7zgsRWHtMJn+YPFjJMBHc/yi8AEXWpR0xBtiGwvs+NTRv9klzsUPuLAjq+2dchNXouvs71OxXcT4qhz32pPt1O2JJbLLKbuxK3WgwRHyTiSo0ALZOP6RqCy8LLsxJ7V/Qhi6M6u+7f+E6CCwk+Xl83Aqw=
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com (2603:1096:101:149::11)
 by TYSPR03MB8632.apcprd03.prod.outlook.com (2603:1096:405:90::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 10:51:21 +0000
Received: from SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6]) by SEYPR03MB7682.apcprd03.prod.outlook.com
 ([fe80::c6cc:cbf7:59cf:62b6%4]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 10:51:20 +0000
From: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "simona@ffwll.ch"
	<simona@ffwll.ch>, "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"robh@kernel.org" <robh@kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "jassisinghbrar@gmail.com"
	<jassisinghbrar@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/8] dt-bindings: mailbox: mediatek: Add GCE header file
 for MT8196
Thread-Topic: [PATCH 1/8] dt-bindings: mailbox: mediatek: Add GCE header file
 for MT8196
Thread-Index: AQHbO82lXfQ9WGC6IkSEu7UkQxO3QLLBaw8AgAAj7YA=
Date: Thu, 21 Nov 2024 10:51:20 +0000
Message-ID: <40971559285bb60cbab476135ba81d364505113c.camel@mediatek.com>
References: <20241121042602.32730-1-jason-jh.lin@mediatek.com>
	 <20241121042602.32730-2-jason-jh.lin@mediatek.com>
	 <57kqls2wa67nh4a5yyr4amthmro3bjvrhnrdbdolrhr2lnmf6u@2h3cbl4jip4y>
In-Reply-To: <57kqls2wa67nh4a5yyr4amthmro3bjvrhnrdbdolrhr2lnmf6u@2h3cbl4jip4y>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7682:EE_|TYSPR03MB8632:EE_
x-ms-office365-filtering-correlation-id: 183d366d-78fb-41bb-91b9-08dd0a1a6f28
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RnlsS2lObEVuaHVqbFpNL3VkRkxKQlVZWU0zTE9FaWtVT3B4RHJlWnBUL043?=
 =?utf-8?B?SkRIeXRBMmFkcmtObVhFVUFVdXh4ZHZHclNaTkw3SlhSZktDcEZCVDRUeHkz?=
 =?utf-8?B?ekRIa0p1akRKV1kyOWxRRXZZRUtNcjZkQkRYZndDazVmZ3dMMm1PcXBrWEJ3?=
 =?utf-8?B?dUVLb3kxaEw3VS9vYTgrRmVlNWRTOEZSVWh3UEl1QkNDMjJNbXppZVhsVmlZ?=
 =?utf-8?B?RjhvRS9MTTVsa1FFTlF1akxBWUMyZktEakVnaUJZWlNGUjBjU2gwemsxZVlQ?=
 =?utf-8?B?cFprRytrU3JJdnoxd09hSmYxS0Q5L3RlZytKTEdxd0tMWVZLUUs2S2dBakt2?=
 =?utf-8?B?bUhaMjJQeHcxYXpGR0swMnZrOVhZbXVPWDVCT3lLa0VGY21PblZ6L2ZUakRj?=
 =?utf-8?B?QXA0bWZYV3hqTExSRkEvSGVBSEZBbGlCVlpKUkRrRzM5UzV0S1cwLzBHZ2FK?=
 =?utf-8?B?Y2oyTzEwNEVzbkNPTGcxTGVlYWlSNW1vR2dKSWZTQjNvVUt6QnBndGhXSDVN?=
 =?utf-8?B?eUtNR01MTzdFZWYvWmtOTVZJRk9rbnA1QWQvZ3JNbTJjencxdmw5UnFDempK?=
 =?utf-8?B?dmxqbTA5VmYxdXNSZlFhTGN0NnNvVFU4ZVUwanNKbnJ5TXRDcENzQTFZc2Uy?=
 =?utf-8?B?dU9va3VlQVVaTkdVQ3FmOXl3RnZOMEwvN3EvNm85cS9yRm9vcXFsbnNVZ1Q4?=
 =?utf-8?B?SFZXQjdoU1V2bUZocEZhd3doTUdxWFdNRkZCZ0VSMFpodmxkRlNwOThiaHZX?=
 =?utf-8?B?SE1MVW5XUk1LYnUvQWtwZStSYnMxMGNNRmN2RjZ0b09kWVFGL3E4OHNNMUEy?=
 =?utf-8?B?UVFFODRvaHE3aCttTkYzdTFkejZHZEkvMlFTelcrYkxUUk95Mmx5b1ltcWpO?=
 =?utf-8?B?YnBEbXR5QjBmb2pha0lWM21EbGxxRFhxZ3hOSmFOK3ZmZGUwaW5hUjRpZkt5?=
 =?utf-8?B?SGRWejRMMWx2UkxEbjhheDllbzFjamJaUk0vVVMrSXVvdlVvV3daTTgyTnA3?=
 =?utf-8?B?OXBaanFsTmFtMlJZcWFra2E5NkZicEd2Y3ZaSlVQcEZ6QVpadHhDN3Q2bHdu?=
 =?utf-8?B?YVBlR1BJUGJrZ0szNzZnTHQ2ZzNWSndwRjRlOSs2VzZiREJFT1RlaHZZMjBT?=
 =?utf-8?B?ejcxdkJMQjZXMTdkaVN0a09LNTNCa05RR2Z6UGtnenVhRldUdGdCL1BhaFg3?=
 =?utf-8?B?WitER0N0eEROblJLMXFydXhMUXA1SzMzdzM0QWF2MzBiRkNVZTdUeHUvcnIv?=
 =?utf-8?B?ZHJMNTlMdWlRb3lPNDMwbWNVdUd1RmlnY255Zy9kRENPYnA5bDE3VzdtTk5n?=
 =?utf-8?B?YUQyYlVsWm13MDBzb3lUd3lYZDdORkdVbmYrRDY0NVp6MTFZS1NRZjdVNWNI?=
 =?utf-8?B?UFRZVlhrdkhqQXp6Vm03RS9NeGFCaUJkcFB2eVJMNkthS3FWRjBzbmwrVXZZ?=
 =?utf-8?B?S2NGT2crNXZ0NzJtK2Y0bG5yK1locEF0cHkwcy80Z2hOcWxPZDc0ZVJ2YWJG?=
 =?utf-8?B?Q2VTSjFrR1ZuQitmeHJQbnNMTnJxamE2ZlBlalBISW9zbmFqc003eVNVRm9Q?=
 =?utf-8?B?Y0hBNDhLZnQ1OGpMNG1qdG4zTlRQUXlsM0xodEk2d2VBbXFlMk5oRlJoWnp0?=
 =?utf-8?B?UG1sb2E1U01QSGxiZE9sVEsySlI0RTl3NmpTZ1ZuTEIxTFhlSWM4NU5oT21k?=
 =?utf-8?B?QzJaWk1PcGFzRkhvNGpCMnJHL1h3bkFDa1pEQUl4YUNzNDB4MzZTYUNpUHNG?=
 =?utf-8?B?QitVeURmcUJ1enhBS0dyNFZBYkphUHlvemU1NXdYLzErb0tnTGo4THpkMWM5?=
 =?utf-8?Q?H2UyGEfwG1VmhXixW0RLrNdYBcg/asAWn68Gw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7682.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UjUyTFZEaTB1dXl2NThwZE1DQ3I3SjFxVmIzbklZcXlIbkhwdHpjTmlCWTJE?=
 =?utf-8?B?aTlOS3FiQzhmRC9pVGJIMFNvMEZXekpQbldWNGs2M1A1WnJINTBmZjR6UGNI?=
 =?utf-8?B?a3pxR2ZvbHI3bk03aWpTYkhxMVJaZFNoU1l2L0QrYTdaZDNtWEh5bXBxalpF?=
 =?utf-8?B?Vy9YTDVXbnkrTjdhS2ZVOW04VmNFV0ljRit2SWVJdHR2UWtJRStvVE1uSWJP?=
 =?utf-8?B?UGgxeFpqRHNvNkZYMk10dFF6UG8wTmdrcHVUNENiaUFzZkdPU0lNdExudXhz?=
 =?utf-8?B?c25Za1hUUnpVRjh0UkNZdXVjT3BNQ3FRdFFHUWFKeVcydzcrbmd4T3ZLN3RX?=
 =?utf-8?B?NUtJM2pmWGYvTDNQQWFmNDE1VldINWFSR2VZRlUzdjk0Y0pKdkVPeXNaWEhG?=
 =?utf-8?B?MGMxWnhuSUpZU0hpc1Q5T2RuUzhtWjNQeWN5WXcwUTd5aWRlYWFrZExZaE1k?=
 =?utf-8?B?OERJclBZSHMvRm8raTdMbSs5Wkx6VjB5b3habEtBSVhHVFdrU2RWNDVyYWFB?=
 =?utf-8?B?Y0g0OU9mSFhVbzBWaUU5S01JOURvT3VSalMyM2pNY0V5Qm0vZWVqSk5mWGlO?=
 =?utf-8?B?RWNKbEJtQnVXRXNFbmZOMGdGcTBvdmVUWmI5VWIrM0FWT1dBNkNKVmRvMXc4?=
 =?utf-8?B?Mk9wZlFDcGg2VUptdy9NMFRwcFBXc3dPVGpGTUpvM2hpUW4zV05oQXF0THpt?=
 =?utf-8?B?SzJxV3k5bURMUzdRbUlVY1lvRE4yS2I0dUE2QklEWVhXTW1KU1h5ampmNUZm?=
 =?utf-8?B?SUJOaXJHb1hkc2lpem92am5aSE5tQzZBbTZvZ2daODV1ZnBCNlY1MTVkKzYy?=
 =?utf-8?B?ZkVYYmJMS0hYbHh6a1JRWTRuRDU1elpJQWc0dkpsYWVFc0N5a3BHMUdEcm1r?=
 =?utf-8?B?VkthZlVsRGZab2JreUF6b2ZuVGVlOWFjZ2lFZllYYjA2emNId2N1N2l1WkJn?=
 =?utf-8?B?alpqNTB4aCtQbmFEKytRNklGNjB5T0MyY3kyRlc5eE81Q0MyNklQL2VhRkdr?=
 =?utf-8?B?MnlrNndpZ1h5VlI1Q0VIVGpub2t0ZjZudUErY3VFR04zQXMyTzB3S0p0bzdN?=
 =?utf-8?B?d1paU2RQd3NSL3JFOUlta1VkQmh1bTZYSzNtNE95M3BEZmNBL0JyOS9jaFNN?=
 =?utf-8?B?MnA0WGxNSXRhVmN5R0czRXRBYXZhTGR4REhqZC91SitpbnV0a2pRUVE4TU55?=
 =?utf-8?B?THdTYkROWHFVbXg4cElwN3hZRkpkTnQ5WTF5dzB2SW1PQVMvRTFGUmpBZ1FR?=
 =?utf-8?B?LzFCVTFGenhJMGMrU1UwUkhPRmd2bmptYk9jUUJJdnN2NGxONzlXSFMxZndw?=
 =?utf-8?B?ZmRwSGltb2hqMkMxSTVPVXRYcDRVR2d6ZGNGM1FSVU5UOW56TmVSNXRDVDRZ?=
 =?utf-8?B?QkUwMVJkcVo0R2tIb0NLancrRmtXaWxaekl1elBabEdmYTJaelFBSHMyL1ky?=
 =?utf-8?B?YXlFUEY0elNnZ3paUjdoZDRKcUNneXpiK1RwdzhQUFdXM292bWdpRjJQZWJu?=
 =?utf-8?B?UmNaTHRLa0U3ZE9oVEVHYk9oYzRwQ2JwN2dtd25hRjV1UWNGb2xxaUZMdldv?=
 =?utf-8?B?ZnZmNTVNNDVUYUU4QXZlVVpaVVkvdGFOeURha1pMRzA3bDZwQnVpYW03Ym1w?=
 =?utf-8?B?ZFBoazd3K0UwVXl3ZEJFcGFyWEF5MnFKdlpmS1MzZnJWUXMxL3Rpd3U0SmFS?=
 =?utf-8?B?WStZY2xwN0xpcXRrdmQ4ZlkxNVhMemZPTTZQcDBROGtZTUxzVjloZUVCRm9i?=
 =?utf-8?B?eklsRTZ5cHFkMWhuNXA0MEFORVowSWxyNytQcXFaUmFodnRVRHNxbUpBaTV3?=
 =?utf-8?B?RWFBMnEvRy9PTkp6bERodUVscFpzVHhNeTRIUEMwTk5GYWh2UFg2YVVYUEdL?=
 =?utf-8?B?Z0YrN3lhdUVEUGlUVnV5eTRLNVZpU3BYUGRYRzIvR3JLOFZBQmdMem56NG54?=
 =?utf-8?B?T0pNVkQ1eFdBVEpPYkhKaU5ZZ0w3dXhvWStKdCtUTUVieTBHYzBLQ2UzRkx4?=
 =?utf-8?B?QXFQTUNNWVVQbHgxQ1RUVC9KNWJVcGRGSXdJajNDMG5xaTZXODcyYXlPMHdY?=
 =?utf-8?B?MEo2VUpuRFBoZXF3SURRL2QxT3VaSVBLTVFXYmwvcmFsdlBFZm1Tc25QeVZT?=
 =?utf-8?B?cW1yMEdCelM1L2hWQlJETEF2R2ZZc1JtUC83VGRqZVJoUldyV05LSVFVZzFL?=
 =?utf-8?B?Y0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <184969E7CF780A43905EE63A907617D0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7682.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183d366d-78fb-41bb-91b9-08dd0a1a6f28
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 10:51:20.6757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 83YOyjNi9apQXs0YUUsti4HwbCpE2/51EPdAbgwpcAqdWh0ZShFHipbFXwhjZtFAx7eJRe3vCq5EF0S2CYfWYdAVKXRlS1sW6mmSCe8Kgas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB8632
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_025129_567073_CCE07125 
X-CRM114-Status: GOOD (  20.69  )
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

SGkgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXdzLg0KDQpPbiBUaHUsIDIwMjQt
MTEtMjEgYXQgMDk6NDIgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IEV4dGVy
bmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVudGlsDQo+IHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+
IA0KPiANCj4gT24gVGh1LCBOb3YgMjEsIDIwMjQgYXQgMTI6MjU6NTVQTSArMDgwMCwgSmFzb24t
SkguTGluIHdyb3RlOg0KPiA+IEFkZCB0aGUgR2xvYmFsIENvbW1hbmQgRW5naW5lIChHQ0UpIGhl
YWRlciBmaWxlIHRvIGRlZmluZSB0aGUgR0NFDQo+ID4gdGhyZWFkIHByaW9yaXR5LCBHQ0Ugc3Vi
c3lzIElELCBHQ0UgZXZlbnRzLCBhbmQgdmFyaW91cyBjb25zdGFudHMNCj4gPiBmb3IgTVQ4MTk2
Lg0KPiANCj4gTkFLLCB2YXJpb3VzIGNvbnN0YW50cyBhcmUgbm90IGJpbmRpbmdzLg0KPiANCg0K
T0ssIEknbGwgZHJvcCB0aGUgY29uc3RhbnRzLg0KDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
SmFzb24tSkguTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAu
Li4vZHQtYmluZGluZ3MvbWFpbGJveC9tZWRpYXRlayxtdDgxOTYtZ2NlLmggfCAxNDQ5DQo+ID4g
KysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE0NDkgaW5zZXJ0aW9ucygr
KQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA3NTUgaW5jbHVkZS9kdC1iaW5kaW5ncy9tYWlsYm94L21l
ZGlhdGVrLG10ODE5Ni0NCj4gPiBnY2UuaA0KPiANCj4gUGxlYXNlIHJ1biBzY3JpcHRzL2NoZWNr
cGF0Y2gucGwgYW5kIGZpeCByZXBvcnRlZCB3YXJuaW5ncy4gVGhlbg0KPiBwbGVhc2UNCj4gcnVu
ICdzY3JpcHRzL2NoZWNrcGF0Y2gucGwgLS1zdHJpY3QnIGFuZCAocHJvYmFibHkpIGZpeCBtb3Jl
DQo+IHdhcm5pbmdzLg0KPiBTb21lIHdhcm5pbmdzIGNhbiBiZSBpZ25vcmVkLCBlc3BlY2lhbGx5
IGZyb20gLS1zdHJpY3QgcnVuLCBidXQgdGhlDQo+IGNvZGUNCj4gaGVyZSBsb29rcyBsaWtlIGl0
IG5lZWRzIGEgZml4LiBGZWVsIGZyZWUgdG8gZ2V0IGluIHRvdWNoIGlmIHRoZQ0KPiB3YXJuaW5n
DQo+IGlzIG5vdCBjbGVhci4NCj4gDQo+IFRoaXMgZ29lcyB3aXRoIHRoZSBiaW5kaW5nLg0KPiAN
Cg0KSSB0aG91Z2h0IEkgaGF2ZSBkb25lIHRoYXQsIGJ1dCBJIGZvdW5kIGEgd2hpdGVzcGFjZSB3
YXJuaW5nIGF0ICMxMzI4DQpub3cuIEknbGwgZml4IHRoYXQgYXQgdGhlIG5leHQgdmVyc2lvbi4N
ClRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLg0KDQpSZWdhcmRzLA0KSmFzb24tSkguTGluDQoNCg0K
PiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCg==

