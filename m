Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC586CF258E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpuQvpW55VPBgMG1orMFjsmUFX0otIVEr+RS+Vu7ZnA=; b=0Gam9Iug73K96TAcOE1aCj6SrM
	khSQqyJn0jK0fMISfIdzyetbEWXzaRsDEBSuR8yoxXDe/sMKBIcQtEDj5S+AoYO4I7pd3B1ieMVzB
	yGliDbt9lKOjA6czUggTAZC1mzoBXstACaIEaPOL1YGFD5ZJVzHZ9eo+Z4aIaZe/UrG4WdGcHiJ3i
	Amms95EvOgiulBtXCLVYor8MGmzzthh7NRXgiW1tcJSX59rJ+XAQfSLJ4zs9eNoeFW/w1fG5oi+lR
	UsL+9/8Awb3k++4ZTBo6rMoLkJixQs9QprTgM32pXi9/g4tjkw6uroL8z09PEsEGaSmT3MkUclo2T
	fV/fz2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcYy-00000002h7A-0MII;
	Wed, 19 Nov 2025 07:25:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcYu-00000002h5y-2x0W;
	Wed, 19 Nov 2025 07:25:09 +0000
X-UUID: dd54f422c51811f0a52f393f94899d25-20251119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=hpuQvpW55VPBgMG1orMFjsmUFX0otIVEr+RS+Vu7ZnA=;
	b=HVVhuMLDLHt/Z8MrEyGe0BY1STkXjr9AOZQOx4fKld04BkRG4yiAfkq+iO0FBRzj8/hji8L70LwHqA2T8NJgPogDWNxb5r1BPYYUss9+j7XR7WguvCIfz5qSiON4wO6y3REHwa5USXAq+pJrjtvn0hTv4dSM2Q5WA/IcYYq1DfE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:727946d3-78a0-477b-8871-8d013f07dee8,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:4517d082-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: dd54f422c51811f0a52f393f94899d25-20251119
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 193663825; Wed, 19 Nov 2025 00:25:03 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 19 Nov 2025 15:24:59 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 19 Nov 2025 15:24:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJw47eFLnPxc30KOlA1pgwknUNuGbkumRHX1jsO3EGiN+IpjmN59WxaeJl0c6Y7OoIuxyC2aZmvuhLwi0L8NJtTkT0QNpCzB3QKoqjseO+B3NC36LCMuFVDrgAd8zcrBiw3KFt+RlnrIM/b0giRLUFgJisttznIWKjinklRrLkMxLU0GUvzaw7BouARaix8DzFNEfCTC2KkEF6qEpqYRd8Uqm0DdcIVSGq8ozMSjHvjKm8/zetd3uGq4XbUnw1y+myTdenf7XzfT6oufVT4eI7ExQNVpHr7/D3Hkmwxfdcyo33/aUbPmkDP7orowjVpC+TLyUua/w8mltdi0fAjspw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpuQvpW55VPBgMG1orMFjsmUFX0otIVEr+RS+Vu7ZnA=;
 b=XCgKdhQI0TJnYrk5ZSxjJWeEnNRruqGs0iu3NRT5ycG/HNTGR4hVlZmh50fbwj38ZdH2vrDnGu0cNPfVzZJ4f9Q5Tsl4hxMAaV6hA6MNncY/c1kvwfb17J8W2Nt5/ANVI8f1eg9PsH/rzw50+z1eu5fVxsNA7v+HtBKEA38E7snhhMjWtmTParpsmyUrZeca3gHC8eQoZxB/x23mefBypMLUfSllpNkMHmoTbCUjk4KI9BI6vBmH3ymLM6ffBWewdA80YQsGnJnCCyHDhmECJCEOrf2hSiKKuN/gDEzubsf3nJPEBCEevoHqNUAe8Dhv1pGBVC9LA8YGfIJHxImpbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpuQvpW55VPBgMG1orMFjsmUFX0otIVEr+RS+Vu7ZnA=;
 b=gUlT2TomtjuZgecEOe3BOIbDNm6Wcxnt7dlPYtLigyvZC0q0cPwXLiT+ClSnPT0wAKGsr6CW8SIPXU+UAEWpNsyTNOdPV0rlSXtn4QeuWC/VkylRmgdqMNX/bSOJ4EsqWU72jFjye9hGEbixHY8MuOx0LLFu4TcQnOikPBb+AN8=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7799.apcprd03.prod.outlook.com (2603:1096:820:f6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 19 Nov
 2025 07:24:56 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:24:56 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	=?utf-8?B?UGF5bmUgTGluICjmnpfkuo7lubMp?= <Payne.Lin@mediatek.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "airlied@gmail.com"
	<airlied@gmail.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?QmluY2FpIExpdSAo5YiY5b2s5omNKQ==?= <Bincai.Liu@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: drm: mediatek: correct clk setting
 AUX_RX_UI_CNT_THR_AUX_FOR_26M
Thread-Topic: [PATCH] gpu: drm: mediatek: correct clk setting
 AUX_RX_UI_CNT_THR_AUX_FOR_26M
Thread-Index: AQHcEEViOXkYGLswTE2923qmGPlwnbT6KqoA
Date: Wed, 19 Nov 2025 07:24:56 +0000
Message-ID: <e09fa5889c63b9e98215869790b3f4a37065e271.camel@mediatek.com>
References: <20250818083415.1041187-1-payne.lin@mediatek.com>
In-Reply-To: <20250818083415.1041187-1-payne.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7799:EE_
x-ms-office365-filtering-correlation-id: 9362b46b-2a44-40e0-ef78-08de273cbdae
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|42112799006|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MUlYaDA2TWdmK1pzQ0FMUDZuN3A2WHJjeHRkdlFxbjNlM2xMTVdGdFhSeFQv?=
 =?utf-8?B?OHFqUStnRXdXMkxIWHd2SUJrZjcyUVYrSTNaM3p5Sy9QUzlLRlJQT2Nwcmpj?=
 =?utf-8?B?aEF6dmFSbG5KdVVWNk1HNTh4bC94TWRtVlJIL3hVSnlpK09NTEsvWTg5Qk9O?=
 =?utf-8?B?YTBSQlZIYUJZYnJDQlI5Z295empHaVpoMzlLNFkwTjh1YzRnL2xoQ3IyMHNU?=
 =?utf-8?B?dzdZZUVCQ21jNEIxOENnVHFLVDFpQTJTVkNCeWxDcEd1dUo3Tzd3bVVRK2Rm?=
 =?utf-8?B?dHBPcHFyMm9IK2JhOVROenpEeFQ1ckhDbWEzVjF2VEJLUmVDRXc5RlhZK3hx?=
 =?utf-8?B?a1lqNkpkZzhhWlpHdXQ5dTZVOG9LaTNhSS9hZmZzRFRiTFdlcTBxWDczZzR2?=
 =?utf-8?B?RFlUNVhRcTVjc0pmZm9JKzR1RkZOWmJlRW12NjluQnhIczh2Z2JqWFFwL3Br?=
 =?utf-8?B?eVVFNS9qNkJ0UVAwVG94WXpveTRWcnRWWFV4SXJIRDdhUlAweitLZm5HcGor?=
 =?utf-8?B?NHkycEMxaGFyQUliTnB2WlVCdUVyNVJDOFlubXVyZUV5b0xkcERhTjlnMWZQ?=
 =?utf-8?B?bnRTeXdpUEVwTksxd3FCdGljbFZYeHBCQVJMV0NxZHdYT3Y4QTJQSHNONlN2?=
 =?utf-8?B?NFp2YVN3MWViVHE2dCs2MlZvWFZUV3N4Smk5Z1lFMjNoM2dXZVpWMjF4aU0y?=
 =?utf-8?B?SnEwZU9UeGw0ZVZmZElSTnltQXR0THV2cC85Z3FZOUZpbVdqM2s4ZXFaeWcv?=
 =?utf-8?B?ME1tZW1PdTBDVlBNekdIZUFFTjVnQ3k2RDBuODdWMGpEbFJhZXZtczlqdU1S?=
 =?utf-8?B?M0JFTHB0UnFyNnFYRk51VWc2dmNmLzJVMXBvc3lxK2VEWHR6MU9FVXF1YlE0?=
 =?utf-8?B?dWtmSWVxL0xDUWQ0WUxJNmZoUkVPcXh5N2VkZXhqayttNWVGS2Z0TTROaWU0?=
 =?utf-8?B?VjVlZ3RhVVNmcTFQTk10SkJGY2VQLzVhYTV1OHQvaFQ1ODhSY3l0VThGemJ5?=
 =?utf-8?B?NXJwL00rS25nbUJZY2t3cnVuN0hpWkROcFFyWnY4bzFoM2NoRzRJZG5Lb3Nt?=
 =?utf-8?B?ejBPSDhFZytVSjVibEcxanpDN0sweVVwUklQZytHampaOU9kKzNnendHWGJH?=
 =?utf-8?B?UktqSUo3ODc0ZTV3VjhBZFJ2SlQ2Qk1HUWJmeCtBYU1nSW9SZjVZUjZ0eGxj?=
 =?utf-8?B?b0M4VmV4bFEzaGNGVUZVSjU2Y0Ftczg0ZGdQdHdPRGVBem5Tc1MwZTFTOWxo?=
 =?utf-8?B?ODdtVFRnV0JYbTVJbmJreXVFRzZ4R1FZSWVudk9hMkVoVEFrbmNzYWE3YXI3?=
 =?utf-8?B?Ni92cGR6STRMY0s1RStRaHRYcWxZSkxoWkRJay9IQlBBakhaQllVak93YTVw?=
 =?utf-8?B?UzZ2UzVpSUp3eTc1YWVYSzFuTWk3UmE4aHdRMlFCaTAxQ3MzMisyeTRiTnl5?=
 =?utf-8?B?V0UwT1ZpcS8vbzdKaWpnZ3RmZXBNcEZCdXdwYXdYZkJwTmNKcjNMc05oOWRH?=
 =?utf-8?B?K2o1UjdGMmJFenZqV2RZVk5CWEl4ZjB2WW0xZ1BibFBRUDQzWk0yMTZXTmc3?=
 =?utf-8?B?bGRYSDlaK3FiTTdjQ3FpSlpINVNMc1FpVlpoN21HSVFHTlp3K1dwWG1vZWtD?=
 =?utf-8?B?ajRWbTRjQVNySHMrSFpsSVdOc3QwYVVYa2Z4UCthYlB2QThlS1E3MVVLUHgy?=
 =?utf-8?B?UnNielFQcVlvd0huM2JkOXpHK1d1WU1hbE1JOXYwMFh0WGFRc0ExKzFzcHVp?=
 =?utf-8?B?bGtvUzBURS9vME5VWVczSnJoSk5YWjlrWlh3SjR2OWFhakRPMjJQZStGNWZh?=
 =?utf-8?B?aW1NNzVZTnZGNFp1Ym9yY3lwbFY5SEtEazlQakFVU1JSQkQwa3BMTGI5R3VB?=
 =?utf-8?B?OGcrK0tOZFN1bnowT0NXbE9jZVFLNlh1Z3ZVTmsxclcyN1o0UWhrZG9NNjF4?=
 =?utf-8?B?YzFhRjlsOG4xRFlXcEpiMUJzLzNqMVJIRjlPV2RCMVYvMnJIREkyZkpCUVMv?=
 =?utf-8?B?YlZTSm1LQVJZeFo2ZnluZU8zQ08xZ3FVTWMvdCtaK2NTSngwQ0k4b01rNEtB?=
 =?utf-8?Q?8mA07v?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(42112799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGcxMW44YnlDNlphejdMemlkRkZwTFNRbThuVDU2Y0FBNVUzenRHWjE5clFG?=
 =?utf-8?B?cnRjN1BLekVZWThiUmROS25RdWl6bTlrZkhrSXVXaFNjdmNVQVNEN09pb3I4?=
 =?utf-8?B?WVVCSHN3Tkg4b1RjR2t0NWt0NU12eWplak5tYkNNbkVWVFNpdjBnaDFGcHEw?=
 =?utf-8?B?RWxNL2NsNGpnVVJ0bzlCNWI1THk0RVkrU2xYeG9HTWpCV3ViRGtEOGxyTzFH?=
 =?utf-8?B?L3JGMlZoM3JDQlZ5K0V0UFpobk4yb0YyWXpSOXBYQ2tRdnBqUFVJbHprcXVy?=
 =?utf-8?B?YjU1WTJ4OVAzNm5OaW5YMTRvYkJObmczYTBBb1BHYkF5RFE3Y2VzS1pBVHEx?=
 =?utf-8?B?QTd1czE5UGtHa000NXg1ZDhMbktrTEI0a0NTbUpmMnB1MTJmdDNkUTBva2J1?=
 =?utf-8?B?M1JGNVkwTnR3OGpkeXVZb3JDaHlMMzZTUmYzMU15MGJ6Y0t3Z2tpcVJQajBo?=
 =?utf-8?B?TWRUT2c5Y0pJU3pwZGVBSUI0QlRrVVFUYnlzNnF6YXRTTC9SQ3E3M0E0VlY3?=
 =?utf-8?B?bW1SQTEvbEtrbGo1ZHIzVUFQTElTR24rWEE3ZGlTa2ZNYmxQK3AveWZoVnE4?=
 =?utf-8?B?R04wR2orSnRmYzVyYVEweUVpNVdkZ08zQ3BlK0ZJUXZuYlBQNnFkdWFIMXlI?=
 =?utf-8?B?L2tlRGV5RGNYZzJ6VXVkd3VDWTJtcUpSdXJLVktnSzlGclN3OE1Ya0pNR2ln?=
 =?utf-8?B?b3lqYmFkMFpDWU84WmxqUWJLa1NFOHpObEJJWXZVUTB0N3RoU1VkNitHaTA5?=
 =?utf-8?B?K2R5aCtDY0g0ZnBBUmt4VytHckZxZUFmTmJQY3pLcHdLM3A5cFhiSHgxYVpB?=
 =?utf-8?B?ZjlvWjRNQ2pzdmxlckZ3SlR0TjVNSWdLT0cyUkMrd21IdjEvb1lQM0VVOGxn?=
 =?utf-8?B?WU14eTVoOFBqcHVFRW9HS3p4VU91dmhwQTVpNUp5a3pCaHU5NDFLZmR2R0tJ?=
 =?utf-8?B?U3dCNDkvaGxKRi9mVnloeUY0bWpmbHRaTU1zUUU5YTg1QkVoUnRKVDZaZW1V?=
 =?utf-8?B?cEd5RDdIKzZkOVd0VmZCSFA2ekhHRUszaFBTb1NUNHZFeFBmbktVMWo3MHpD?=
 =?utf-8?B?Yk5ZSlo2bXBOTFhVMzdWZ1BWS3dzRkwyTWZQNEZCRG5MNGYzeGtuZ2lFbWtC?=
 =?utf-8?B?NURwSmdhenJVKzQyUGFaQWZSNTVUdHZ0STA5ZEp2ZXpYbHpicmpETkhzVEkx?=
 =?utf-8?B?RVhQZjhZTzFPU1Qyem9hall5dFdVRllReVU2cytwRzBSYWhSRC9xWXBQbFQ2?=
 =?utf-8?B?NVdQaWhXOUJlUUN6bW9ORWtQaGtpMm9XQVgzelpjeDBIcU5uMGFib2RPeVQ0?=
 =?utf-8?B?OVlIczJTTURPdnEyL3kvWGtENG94OFRjY0E2eDhrcXcxdEpZVXg5cytsc0px?=
 =?utf-8?B?L0JGUWluVTcyNzA2aVFaNWtHbVZSak40b3F6TWNQNFc4T041dTkwd2NYN0Nr?=
 =?utf-8?B?a2hFRmpmUnBheGVZc3NXeGJPdzZZU3V5cVI1MlVWaTNjaFI1NVZ6RlNJMEFv?=
 =?utf-8?B?dmVyendXaFF2dk91WUwwVTFkbzd3UmVPYytCVStoWjRNcWplQmk0VXVJN1hy?=
 =?utf-8?B?UXFEWjZtVTMwRGRFZ0Z5UjZFNWk4SkJudWVWV1pKU3JHMHk1THlmNTloUXVy?=
 =?utf-8?B?V1FoTlJOanFTSTRmU2JkMDA0RVRvRkhjTG1mK0dLUWdSSGIyWHRFNEtuOXIw?=
 =?utf-8?B?RUhZNkd0akJlVVVNdmk0cFFzRWFGdVNaSTNJeDlmUU1lbVFWcTBCaDFWOFQ5?=
 =?utf-8?B?QVdKcldTUTlNK2o4VXR2allyVmZPU3JhUGpKdytiZ2FWelhqY2llaFBOQlhB?=
 =?utf-8?B?dmM2enFBNEtXZkw1dTRqRW5ZLzd5RjJ4U2hVRkpLQVhGVWRob0pSdGFzTVRN?=
 =?utf-8?B?UVN4M3djSXRmeFl0dEhtd0lRcjQxYUlCNW1BdlBZTnNJNDlzREV1L21EZ1Fa?=
 =?utf-8?B?SjQrWSs3dFdPRzFWR3FuZkZ0blhzMzQ1TklhNWZSNXl2NncwOFQ3Sld6ZzZ0?=
 =?utf-8?B?R3RUYURsb3BhZ3kxcytxaWlOM2ErVm5MUDFiaGFvaGZmQjJoRFlpbjd1aU1Z?=
 =?utf-8?B?V3FTN2QvRUc3aUlQTk5UaVVmcXlLZGtSOWJOeVlsOWZ1MVc4VzV2eHI2OUhK?=
 =?utf-8?Q?Gt9Uuwb4vPyqghtvxedhBadwM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E20610710C83814A8FA2E3B24D57571E@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9362b46b-2a44-40e0-ef78-08de273cbdae
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 07:24:56.6470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K7wVTL+yL0GubN5c2+MpR+mF4GEOizq+exjK+s45dBaja693bNpgzGgn8awmWWY6lFVc9ih7SqWeIHpC5ERxmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7799
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_232508_764306_231C82CC 
X-CRM114-Status: GOOD (  18.84  )
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

T24gTW9uLCAyMDI1LTA4LTE4IGF0IDE2OjM0ICswODAwLCBwYXluZS5saW4gd3JvdGU6DQo+IEZy
b206IEJpbmNhaSBMaXUgPGJpbmNhaS5saXVAbWVkaWF0ZWsuY29tPg0KPiANCj4gVXBkYXRlZCB0
aGUgZGVmaW5pdGlvbiBvZiBBVVhfUlhfVUlfQ05UX1RIUl9BVVhfRk9SXzI2TSBmcm9tIDEzIHRv
IDE0Lg0KPiBObyBvdGhlciBjb2RlIG9yIGxvZ2ljIGNoYW5nZXMgd2VyZSBtYWRlOyBvbmx5IHRo
ZSBtYWNybyB2YWx1ZSB3YXMgbW9kaWZpZWQuDQo+IFRoaXMgY2hhbmdlIGFmZmVjdHMgdGhlIHRp
bWluZyBjb25maWd1cmF0aW9uIGZvciBBVVggUlggYXQgMjZNSHouDQo+IFRoZSBmb3JtdWxhIGlz
IHh0YWxfY2xrIC8gMiArIDEuDQoNCkkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgbmVlZCB0
aGlzIHBhdGNoLg0KSWYgaXQgZml4IGEgYnVnLCBkZXNjcmliZSB3aGF0IHRoZSBidWcgaXMuDQpJ
ZiBpdCBwcm92aWRlIG1vcmUgc3RhYmlsaXR5LCBkZXNjcmliZSB3aGF0J3MgdGhlIGRpZmZlcmVu
Y2Ugb2YgMTMgYW5kIDE0Lg0KWW91IGp1c3Qgc2hvdyBhIGZvcm11bGEgeHRhbF9jbGsgLyAyICsg
MSwgYnV0IHdoYXQncyB0aGUgcmVsYXRpb24gd2l0aCB0aGUgdmFsdWUgMTMgYW5kIDE0Pw0KDQpS
ZWdhcmRzLA0KQ0sNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmluY2FpIExpdSA8YmluY2FpLmxp
dUBtZWRpYXRlay5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFBheW5lIExpbiA8cGF5bmUubGluQG1l
ZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwX3Jl
Zy5oIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcF9y
ZWcuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBfcmVnLmgNCj4gaW5kZXggOGFk
N2E5Y2MyNTllLi5mOGM3YjNjMDkzNWYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBfcmVnLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcF9yZWcuaA0KPiBAQCAtMzAxLDcgKzMwMSw3IEBADQo+ICAjZGVmaW5lIEFVWF9USU1FT1VU
X1RIUl9BVVhfVFhfUDBfVkFMCQkJMHgxNTk1DQo+ICAjZGVmaW5lIE1US19EUF9BVVhfUDBfMzYx
NAkJCTB4MzYxNA0KPiAgI2RlZmluZSBBVVhfUlhfVUlfQ05UX1RIUl9BVVhfVFhfUDBfTUFTSwkJ
R0VOTUFTSyg2LCAwKQ0KPiAtI2RlZmluZSBBVVhfUlhfVUlfQ05UX1RIUl9BVVhfRk9SXzI2TQkJ
CTEzDQo+ICsjZGVmaW5lIEFVWF9SWF9VSV9DTlRfVEhSX0FVWF9GT1JfMjZNCQkJMTQNCj4gICNk
ZWZpbmUgTVRLX0RQX0FVWF9QMF8zNjE4CQkJMHgzNjE4DQo+ICAjZGVmaW5lIEFVWF9SWF9GSUZP
X0ZVTExfQVVYX1RYX1AwX01BU0sJCQlCSVQoOSkNCj4gICNkZWZpbmUgQVVYX1JYX0ZJRk9fV1JJ
VEVfUE9JTlRFUl9BVVhfVFhfUDBfTUFTSwlHRU5NQVNLKDMsIDApDQoNCg==

