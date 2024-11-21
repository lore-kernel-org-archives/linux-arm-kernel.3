Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D9BD743FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 00:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SLm3tE2UmVL0ClsCRE2mDib7eck3R/7T3lV3hP4TCyE=; b=CelKLjvd5b3tZzFUTY7Pqw+EOe
	N3w3TL1D7lLv7dL/7+4wkZqL3muflCBUPjJnlCYur5zNmxKxv8UBGKdUI5HXc9mGPR1vnslv1zqb6
	6+4SQzj7M2LRXQsZv1fbfXljUv1jqGenEpIckrUOmf2iGJtXUFUdvdFaEOH+OaEhfgnR/pkP03gcB
	D15dsebvZqUcTU5RULJyXquTAikOJu+wBB4LFSDKx/aXg3dK4a+RiXY3KfcrJxeZ7Qpm9Ul+hpHz4
	RDtfFEf7Quwqu1yPpCgdwxvaj6gVCNFpGEg70BXVac3y5ZpOM6Mybn6NZN4f/IHn6gJyubeuDHKUA
	6oCG6vTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDvWU-0000000GVe0-2cr2;
	Thu, 21 Nov 2024 00:58:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDvVY-0000000GVVa-0IdR;
	Thu, 21 Nov 2024 00:57:21 +0000
X-UUID: 8b0f4908a7a311ef9048ed6ed365623b-20241120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SLm3tE2UmVL0ClsCRE2mDib7eck3R/7T3lV3hP4TCyE=;
	b=Mr+ON5bhI6KDbuRWkekvcf1J2B8v/oyGPwvZNnOb3CFpZutwGOpRzJjTudKxFJHuGtXdxXts2tsLDRxPeBVmUnvBZI2RQtKtM+jk4Pt66kKSsaMyEfisrJZNg9lnSHngmBY2X216QIA1fLFbY3f9zSBluArvgUFm2enqRa/4k/s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.44,REQID:335fa4a5-790d-48e1-a345-8a9c3feb9676,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:464815b,CLOUDID:f56e8ba0-f395-4dfc-8188-ce2682df7fd8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8b0f4908a7a311ef9048ed6ed365623b-20241120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1016001166; Wed, 20 Nov 2024 17:57:12 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 21 Nov 2024 08:57:09 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 21 Nov 2024 08:57:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=keIolpMz0Tx/bQ4deJMoA+AAqwkOX5Zsuc5V03wfvMHo+l+XjggRgf9hA8zAU5cTtdkzAH6h6wjNK2lzbHPKI5Huyy/cCa8+nCco+hZOT39kOmiYm2iiSH2v0TdRpZ7bB6gS0dos8j8EIl5lL7IkiK2yX3lLXvQRznsw0E6J6b3FNLf4h57ZCI9INHYh4wm+IFkM2CfM45cacUq/oUnbqpYpHeN1SctzmB1XJ5HilPALMs8S48wnyhMv+YXxd52Aw3Ea4w9C8aYECf4iTr6BYYk/8F67D/egi4L9mFEcl3JSQUCCznUi4A+AoN8MNXtAxqHGaRHnp6qySmHt3HroHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLm3tE2UmVL0ClsCRE2mDib7eck3R/7T3lV3hP4TCyE=;
 b=dql3ykrfQewTIQvl+9Sg8HKxHFoEt1Ih5aBq18LvHG3lvDvioLU5jueC9/eiecckYGWPNfFQruw05Y2aFKd330zmqaWncTx/iGwIMnmgtDZRovanwQotfA7tc5ppJbuq0H7vo/Gw317fLpPx2eEeuMCOMiokGFinR/LO/dquL28zyUMS65m/E6c3Uzo9rNLzI7TOOArG9mvwTx/RzmIbV8s2VBqPKSMT6oz+XALR/Hl1E+10LhVHXw07yz6lEtt0lAiOjLs72VW16Nj3ClUM32KVJP674RWaHM+AIpApkWsNjb+wPZe+Qg4WoJ/nFLMT/gUAIMCsHLzwLxjLKVOhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLm3tE2UmVL0ClsCRE2mDib7eck3R/7T3lV3hP4TCyE=;
 b=Ml5GEmHETH2jcSH1fUGKoAk0F6CiTwCjW8u8PIN4z/kJc2TztlNrrnNAxpB95oF89aru4yKXQHDFP/R7EuKGwdEe5BZXaAIxRYhvp/Xggtxbhvd6ntgElKPXm4skfmZfs9h9mVKJl7jJhwz0fjnWQ20H7TkpLhM+8wCnwumCFt0=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB8200.apcprd03.prod.outlook.com (2603:1096:405:d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Thu, 21 Nov
 2024 00:57:06 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8158.017; Thu, 21 Nov 2024
 00:57:06 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?RnJpZGF5IFlhbmcgKOadqOmYsyk=?= <Friday.Yang@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: mediatek: Add mt8188 SMI reset
 control binding
Thread-Topic: [PATCH v2 1/2] dt-bindings: reset: mediatek: Add mt8188 SMI
 reset control binding
Thread-Index: AQHbOxZECp3+ihxwOEi26QWmvoJ+5LLA6mOA
Date: Thu, 21 Nov 2024 00:57:06 +0000
Message-ID: <e622769a10f5c443066382d9fadb9cd5d8522437.camel@mediatek.com>
References: <20241120063305.8135-1-friday.yang@mediatek.com>
	 <20241120063305.8135-2-friday.yang@mediatek.com>
In-Reply-To: <20241120063305.8135-2-friday.yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB8200:EE_
x-ms-office365-filtering-correlation-id: 99c50db7-cbb3-44f5-21c8-08dd09c76bbd
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ME9iWVBoT2Z2amdpbkVSTlE2c01kcUsyd294WDFXc3Z1NW9KYUhrSUREVHNh?=
 =?utf-8?B?QTcySlIrdmNRU0JGZVNkZ0Q5MHJWVlVPTlpSSVI3UzZONzJzOFpJTDhKUk1J?=
 =?utf-8?B?OFJtUmZSTVkrS1VMWWpGSklDRmZVbGUvM1pOMUZsREl3U0dXRFVhQzhHSC9o?=
 =?utf-8?B?RWVVTzZIT3kzSSt6WXBlbHl3R2pIbm5OM3Y5YzhHWEJFOERCTlE2YWRUQkw5?=
 =?utf-8?B?a2VTKzlUbEFHcWVTU3RnWGRLd085czlXcEw5Z0hwVEVBaWVkYXdiOTN4Ni9n?=
 =?utf-8?B?QUcxSEExM3lBdUxlUVI5RHE2dmtyS2FySkF2QmhNakRkdUcvK0Jlc3B5bHp4?=
 =?utf-8?B?dHBUMHhJYUtSdGNobmRTYmQ1cm1IcHpTeEdrMUV1VDFFRlAvLzJ2YUQvb3cr?=
 =?utf-8?B?QURMUjRxWjJCYk5tWTlSRWZKTERGL0xUNWFnMStIRlJHRDh1aFNsL2plQjRz?=
 =?utf-8?B?ZVZ4U0hoczRtTWplUFFIRTA2OEJuOHNoVy90Y3hUTFFzM1EvTktnREtva0k3?=
 =?utf-8?B?OUZFclh5S1hXRmNkYjF6bzhneVQzdjRlR2t3UFI1QXJWYXMyN05FZnVvbFRl?=
 =?utf-8?B?Mml4Z2svTDZGU3BWUmI3MTlhUjJZTDFoK3R4ZjhLak1URlBqeEFmNUNjcHBX?=
 =?utf-8?B?ejY2UWppSXZrWm9oNWdwRkdldzVNaU8wMGV1bUNEQTlCRmpEelp4ekRMYlNQ?=
 =?utf-8?B?R2dncGFoR1A5YkluTE5uTnZVaCtKU0ZodVMwVDd3M25ORUZBdldXL1pnTXlC?=
 =?utf-8?B?SDhPbjBRVXJ0UUFKUjNZd1NwK2orV1FUNmE2c2M0SmJsOElFek5vaTcrZDJ3?=
 =?utf-8?B?SHpRM2lqNkpoeHNGaTZjRTl1RDk5d1lHNS90ek1HZFJ5NjNXRFcweWl6d2gx?=
 =?utf-8?B?L2lBc3c1RzNZMzRMZHJrNHNtbUZYcjB1NzQ1VGhuaHFkWEVMdTBVbXg3bUtP?=
 =?utf-8?B?bHJqM0NTVHNxbUxzeVNnMCtGeWNwczZvNWYyQy9tM1VSL085MXlOcndUOG8y?=
 =?utf-8?B?cTY3YWNWVXpGSitKRENWeUtmREFhWE4rNjhnWnhGU2lnbjlwYjlFdmpyMm0v?=
 =?utf-8?B?RzkvWVBaY2tYd08yMnNxZnlwSm8waGZpendoTVlSbFdqU094bDBieFNYYlB1?=
 =?utf-8?B?dndzUzlYQ09YSDdTVTF5R2RESUNsODVNQmpvZDQ0UXpKbnNpbGw1VTlHbmZ4?=
 =?utf-8?B?aEJrWWlpQlVzWkx4MU5SMHpSNUlIZjV1YXZocW1IbjAwWFR3TTI4OElRSGJH?=
 =?utf-8?B?NnkvTnV1TmhXUWFERXM5a0Fyai9XOXRnQWtYUU53WER1alFkbTFGbTE5WDZL?=
 =?utf-8?B?dkFaTVVkMldWYnV3NGJ3S1A4ZmVVdzJ2VC9PakNjd3hmbEVIeCszL2cxYTRa?=
 =?utf-8?B?V1Q1MC9ta3dwZ1RCNjJhOG0xOExsa1pLQ0w5cnMxMnJld2JJeWhXcEVrNkZO?=
 =?utf-8?B?b3BJUGJtbkFSU1c2RGVaQ0VoZENCdkliTGl4MFhnYko1eG5FaDNsV1dRSlha?=
 =?utf-8?B?WnRPekRGOFJ3cklqZXVYTW9ocFAzK1V4QmxwL0VkQU5POVZsc2FOcUpSWXpz?=
 =?utf-8?B?MFFoN3JHSk5PbHQ3cDA4UXU5d2JEMGNYcDFLZnlQbXpuYm9wYmUwdWliTGlQ?=
 =?utf-8?B?QlFtcFhPWjVRRVYxaUUrRzdscDdiYmZ6NTBwODVBY21ES25yWVVUUkcyZSto?=
 =?utf-8?B?eFFPR3VPR1QrUjNSeEo2dUJjaUltUWZUNjBDYWM5U2NyZTZ2SmlZdkFvL0h3?=
 =?utf-8?Q?sJUkOroQos8Sr2Xg5jXRK3TsOf018Ab84//ky6n?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TEQ3cWgyZU04eEdMckNMcVRRei93NnZZV0I5QytYTVdDamNma3RCcGp5cTlk?=
 =?utf-8?B?TWIxQ1ZROUZZMmFNcE5sU3I2S08yYWg0UkdMVVlCRWFtR3AzWVFXZjNGeTY3?=
 =?utf-8?B?K05Tdyt6a2h0NmxCSkt4QTR0enQ1RS9CK2NzdE1GeFNDcEhzcmdLc08weXlq?=
 =?utf-8?B?NEUxZm5FaEw3dU1KelE4VjhxNDU1MmQ1YThxVWtFZzI2VHVWMksvalVuVGpK?=
 =?utf-8?B?a0dueVR1bVNsaXNlQVhsbzB3NkFTZHNvSUxUNE9wMHNVNkNBOG1MS2haV0xQ?=
 =?utf-8?B?WWl6OURKd0l2R2E5ajJsOVBod0NXdHN1QnpVSDAxcVM4bWVwbEsrcm5YU1VB?=
 =?utf-8?B?WTV2bDZZR05zSXBTNUt1ZWc3Q2tpZHJ3VVlqdHl0SGMwZVU5b3l5bGlaNmox?=
 =?utf-8?B?ZkRkVHpyQlM2VldjWW14TS94bGJGdjN3K3BMVWhpeVNzeHRia1hRb05jVGN6?=
 =?utf-8?B?b01FQmNHc05FTkRpN2lOR2d5SlByRFRuMlB1d1FtbWN0YnBBcWJITSs4eGNk?=
 =?utf-8?B?Y1o3dWJjT09xT2ZtYkdjZDhQamlVWnR6NjNUTjdJbHFsVzdpaTNOMWhFQ09O?=
 =?utf-8?B?bi9kN0Y4UVJpU0Rsam0yVkU4RDF6MXdQcjRtY3ZGaG1wNGZMVjRSOGE5YnlM?=
 =?utf-8?B?NkZnVDNzc1VEbElpanFzbVg5L2dQZGxsSVNvejNqNkIxQkhoNCsyZ09TeXNX?=
 =?utf-8?B?MUN3d2sxN0JPRGJ5N1B2N2F4ZTI3cTlyeXRrRXhGVTg3NnM3VXpiOUpmV0NY?=
 =?utf-8?B?Yjd2Y090NXpRTXhNNElCQTZLSU5mSnJIc1pXVU5kWnJVSk8yZENjbE5OVlhv?=
 =?utf-8?B?Ui9BL2phVnhmVXhyR0s2VXk5WUpXS0dtZ1VqMzJ1cnFUcW0wMzVLMllOcVB2?=
 =?utf-8?B?TEFuY3l0MFZzQnR4UlBhQWgyZWpvb1hybDdxZkR3eFl5eDlIQWdpa0FkeXdj?=
 =?utf-8?B?MmJYSG1ub1hKdis5SmlRVE5iSmdJTmJBdzl5S2VtankxaWR4OVJKZEw0Rk9o?=
 =?utf-8?B?RExzY2hDTnRWY0NpczJ2dHlNbDZXYUJLc3Bnd3E0VWFxb0pKeGh2QVZyTjR0?=
 =?utf-8?B?Q0M1VVh2SEV0cGNNSjFBNGx3TnlFaFdkMjBPOGNteWVsbFBudXhodzB4Zmc1?=
 =?utf-8?B?SGVHZyt4T0xjNVhuY2hTZThaYldIVnQ4NWNSaDRKc1Vhc1puNU5DUVdPclox?=
 =?utf-8?B?T3FRS1NIVkUzZWMrV1lVUWp6TXRPTkVZWGNnMFdBSHZLa3V1UTdpOVYrV0Fl?=
 =?utf-8?B?bjNQUmxUNkpHOWZjTDU3ZW05dktKcDZhSmVBZ29VNVRoSVFkRERTbmx2NjJE?=
 =?utf-8?B?T2M2cWx1OU4zVEhPWFpHazBtNkxlYXhUZFhVS3FQeDRNWTRVcVJSRkVIdEt0?=
 =?utf-8?B?K09hNWRrblJxNGVuQ3drSm9tNkI3ZExTS1EzaHMxMUFuMU1xOElrNUYwK2sz?=
 =?utf-8?B?MGF5Z1BqRXY4RUJzV0tWTmwwaWZ2OU91QkxEeWwwTytLY1lHOW52Nk92NDZI?=
 =?utf-8?B?LzhaNDhPZytWWHUzTFVBOGFuQ2xqbjg5cHFUQ296aWJWQ1AvYmxheHNySWpG?=
 =?utf-8?B?dnBiUmRsUDJvZDhaYUs0RlBHZnpoVG9xMXRPc2hHZWhpOFpyTGJZUUN6bVJE?=
 =?utf-8?B?d3lkZzRnenQ2ajdadHdFajlac1N1TzdGdTZaZVhJZ29WNWJicXgydWpLSGtD?=
 =?utf-8?B?Q0FJUGk4cXJmY1c4a2ZVeFEzMC93aE9GeUhoMEl0Z1dZWldQN2pwQzhVWmlw?=
 =?utf-8?B?UDBJa2pLSmw3ZWt0Z3dqYjE5UDRYWmpMSVIrcUZjeVpKRStobk5NalFKWnpu?=
 =?utf-8?B?MERqYmpMODNyOWJycm1HYWpCQWRqb2xqRGdGYWpVNmwrelFKWENaa0NVcFlV?=
 =?utf-8?B?dkNJaUdNZmdNQXBPQlZmUFNlcC9LNExWcmtYUVdWbmdRMk1mVFBoSENNc1o0?=
 =?utf-8?B?VVU5ejNLMkhGZVNpYUlIQ0hkbkdyRmpEVWE0RVNwWXB1WVhlT20vSGY3TlND?=
 =?utf-8?B?L3p1UG1DNU1HbFdJN3NFT2ROUkFweVY5Ti9CbVF4ZkF5eTUwcjIvZFZ0ZzFK?=
 =?utf-8?B?NU5lZ0RXYU5mMHMwN0FZbXMzam9IN0o4enRrcURsSzV6TFZNbEp2N0owckZq?=
 =?utf-8?Q?Oyy6H5LKxTKd/epg6PVmPlZY0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C91F5A77903274CAB12C272F181B956@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99c50db7-cbb3-44f5-21c8-08dd09c76bbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 00:57:06.6623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CcXO66cg5qw4BTWwYy6VzfGtSa25Vwk6yKzsE8PfJ7ue1i5fIohmA7ZinSV51alK9yj3dAj3cIWFpiHmJQC9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_165720_128841_C81AC836 
X-CRM114-Status: GOOD (  20.68  )
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

SGksIEZyaWRheToNCg0KT24gV2VkLCAyMDI0LTExLTIwIGF0IDE0OjMyICswODAwLCBGcmlkYXkg
WWFuZyB3cm90ZToNCj4gRnJvbTogIkZyaWRheSBZYW5nIiA8ZnJpZGF5LnlhbmdAbWVkaWF0ZWsu
Y29tPg0KPiANCj4gVG8gc3VwcG9ydCBTTUkgY2xhbXAgYW5kIHJlc2V0IG9wZXJhdGlvbiBpbiBn
ZW5wZCBjYWxsYmFjaywgYWRkDQo+IFNNSSBMQVJCIHJlc2V0IGNvbnRyb2xsZXIgaW4gdGhlIGJp
bmRpbmdzLiBBZGQgaW5kZXggaW4NCj4gbXQ4MTg4LXJlc2V0cy5oIHRvIHF1ZXJ5IHRoZSByZXNl
dCBzaWduYWwgaW4gdGhlIFNNSSByZXNldA0KPiBjb250cm9sIGRyaXZlci4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEZyaWRheSBZYW5nIDxmcmlkYXkueWFuZ0BtZWRpYXRlay5jb20+DQo+IC0tLQ0K
PiAgLi4uL2JpbmRpbmdzL3Jlc2V0L21lZGlhdGVrLHNtaS1yZXNldC55YW1sICAgIHwgNTMgKysr
KysrKysrKysrKysrKysrKw0KPiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxODgtcmVz
ZXRzLmggICAgIHwgMTEgKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCsp
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3Jlc2V0L21lZGlhdGVrLHNtaS1yZXNldC55YW1sDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L21lZGlhdGVrLHNtaS1yZXNldC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2V0L21lZGlhdGVrLHNtaS1y
ZXNldC55YW1sDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NzdhNjE5N2E5ODQ2DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jlc2V0L21lZGlhdGVrLHNtaS1yZXNldC55YW1sDQo+IEBAIC0wLDAg
KzEsNTMgQEANCj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1Ig
QlNELTItQ2xhdXNlKQ0KPiArIyBDb3B5cmlnaHQgKGMpIDIwMjQgTWVkaWFUZWsgSW5jLg0KPiAr
JVlBTUwgMS4yDQo+ICstLS0NCj4gKyRpZDogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Jlc2V0L21lZGlhdGVrLHNtaS1yZXNldC55YW1s
Kl9fO0l3ISFDVFJOS0E5d01nMEFSYnchZ2RYZ2xRSmgwLUZERmliU1VhaDJhTldCY2R4cDcwQk8y
T1FnZU8waXE2NjBTMy1uaXhCN0wyeEpuS0RzTWxpbFVuY3RiU2JQOUtOdl9PdDhlMmFEb3ckIA0K
PiArJHNjaGVtYTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9kZXZpY2V0cmVl
Lm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sKl9fO0l3ISFDVFJOS0E5d01nMEFSYnchZ2RYZ2xR
SmgwLUZERmliU1VhaDJhTldCY2R4cDcwQk8yT1FnZU8waXE2NjBTMy1uaXhCN0wyeEpuS0RzTWxp
bFVuY3RiU2JQOUtOdl9PdlEtNnZOU0EkIA0KPiArDQo+ICt0aXRsZTogTWVkaWFUZWsgU01JIFJl
c2V0IENvbnRyb2xsZXINCj4gKw0KPiArbWFpbnRhaW5lcnM6DQo+ICsgIC0gRnJpZGF5IFlhbmcg
PGZyaWRheS55YW5nQG1lZGlhdGVrLmNvbT4NCj4gKw0KPiArZGVzY3JpcHRpb246IHwNCj4gKyAg
VGhpcyByZXNldCBjb250cm9sbGVyIG5vZGUgaXMgdXNlZCB0byBwZXJmb3JtIHJlc2V0IG1hbmFn
ZW1lbnQNCj4gKyAgb2YgU01JIGxhcmJzIG9uIE1lZGlhVGVrIHBsYXRmb3JtLiBJdCBpcyB1c2Vk
IHRvIGltcGxlbWVudCB2YXJpb3VzDQo+ICsgIHJlc2V0IGZ1bmN0aW9ucyByZXF1aXJlZCB3aGVu
IFNNSSBsYXJicyBhcHBseSBjbGFtcCBvcGVyYXRpb24uDQo+ICsNCj4gKyAgRm9yIGxpc3Qgb2Yg
YWxsIHZhbGlkIHJlc2V0IGluZGljZXMgc2VlDQo+ICsgICAgPGR0LWJpbmRpbmdzL3Jlc2V0L210
ODE4OC1yZXNldHMuaD4gZm9yIE1UODE4OC4NCj4gKw0KPiArcHJvcGVydGllczoNCj4gKyAgY29t
cGF0aWJsZToNCj4gKyAgICBlbnVtOg0KPiArICAgICAgLSBtZWRpYXRlayxtdDgxODgtc21pLXJl
c2V0DQo+ICsNCj4gKyAgIiNyZXNldC1jZWxscyI6DQo+ICsgICAgY29uc3Q6IDENCj4gKyAgICBk
ZXNjcmlwdGlvbjoNCj4gKyAgICAgIFRoZSBjZWxsIHNob3VsZCBiZSB0aGUgZGV2aWNlIElELiBT
TUkgcmVzZXQgY29udHJvbGxlciBkcml2ZXIgY291bGQNCj4gKyAgICAgIHF1ZXJ5IHRoZSByZXNl
dCBzaWduYWwgb2YgZWFjaCBTTUkgbGFyYiBieSBkZXZpY2UgSUQuDQo+ICsNCj4gKyAgbWVkaWF0
ZWssbGFyYi1yc3Q6DQo+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlv
bnMvcGhhbmRsZQ0KPiArICAgIGRlc2NyaXB0aW9uOg0KPiArICAgICAgUGhhbmRsZSBvZiBlYWNo
IHN1YnN5cyBjbG9jayBjb250cm9sbGVyLiBTTUkgbGFyYnMgYXJlIGxvY2F0ZWQgaW4NCj4gKyAg
ICAgIHRoZXNlIHN1YnN5cy4gU01JIG5lZWRzIHRvIHBhcnNlIHRoZSBub2RlIG9mIGVhY2ggc3Vi
c3lzIGNsb2NrDQo+ICsgICAgICBjb250cm9sbGVyIHRvIGdldCB0aGUgcmVnaXN0ZXIgYWRkcmVz
cywgYW5kIHRoZW4gYXBwbHkgdGhlIHJlc2V0DQo+ICsgICAgICBvcGVyYXRpb24uDQo+ICsNCj4g
K3JlcXVpcmVkOg0KPiArICAtIGNvbXBhdGlibGUNCj4gKyAgLSAiI3Jlc2V0LWNlbGxzIg0KPiAr
ICAtIG1lZGlhdGVrLGxhcmItcnN0DQo+ICsNCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxz
ZQ0KPiArDQo+ICtleGFtcGxlczoNCj4gKyAgLSB8DQo+ICsgICAgcmVzZXQtY29udHJvbGxlciB7
DQo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTg4LXNtaS1yZXNldCI7DQo+
ICsgICAgICAgICNyZXNldC1jZWxscyA9IDwxPjsNCj4gKyAgICAgICAgbWVkaWF0ZWssbGFyYi1y
c3QgPSA8JmltZ3N5czFfZGlwX3RvcD47DQoNCkl0IHNlZW1zIHRoYXQgaW1nc3lzMS1kaXAtdG9w
IGRldmljZSBbMV0gaXMgYSBzeXNjb24gKHN5c3RlbSBjb250cm9sbGVyKSBkZXZpY2Ugbm90IGEg
cHVyZSBjbG9jayBjb250cm9sbGVyLg0KSXQgaXMgc2ltaWxhciB0byBtbXN5cyBkZXZpY2UgWzJd
Lg0KbW1zeXMgZHJpdmVyIGlzIGluIFszXS4NCkJlY2F1c2UgY2xvY2sgbWFpbnRhaW5lciBpbnNp
c3Qgb24gcGxhY2luZyBjbG9jayBjb250cm9sIHBhcnQgaW4gY2xvY2sgZHJpdmVyIGZvbGRlciwN
CnNvIHRoZSBjbG9jayBjb250cm9sIHN1YiBkcml2ZXIgaXMgaW4gWzRdLg0KVGhlIHJlc2V0IGNv
bnRyb2wgaXMgaW4gbW1zeXMgbWFpbiBkcml2ZXIsIGFuZCBtYWluIGRyaXZlciB3b3VsZCBwcm9i
ZSB0aGUgY2xvY2sgc3ViIGRyaXZlci4NClJlZmVyIHRvIG1tc3lzIGRldmljZSB0byByZWZpbmUg
aW1nc3lzMS1kaXAtdG9wIGRldmljZS4NCg0KWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9tZWRpYXRlayxtdDgxODgtY2xvY2sueWFtbD9o
PXY2LjEyI24zNw0KWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtbD9oPXY2LjEyDQpbM10gaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGlu
dXguZ2l0L3RyZWUvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmM/aD12Ni4xMg0KWzRd
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvY2xrL21lZGlhdGVrL2Nsay1tdDgxODgtdmRvMC5jP2g9
djYuMTINCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAgICB9Ow0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxODgtcmVzZXRzLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdz
L3Jlc2V0L210ODE4OC1yZXNldHMuaA0KPiBpbmRleCA1YTU4YzU0ZTdkMjAuLjM4N2E0YmVhYzY4
OCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxODgtcmVzZXRz
LmgNCj4gKysrIGIvaW5jbHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxODgtcmVzZXRzLmgNCj4g
QEAgLTExMyw0ICsxMTMsMTUgQEANCj4gICNkZWZpbmUgTVQ4MTg4X1ZETzFfUlNUX0hEUl9HRlhf
RkUxX0RMX0FTWU5DCTUyDQo+ICAjZGVmaW5lIE1UODE4OF9WRE8xX1JTVF9IRFJfVkRPX0JFX0RM
X0FTWU5DCTUzDQo+IA0KPiArI2RlZmluZSBNVDgxODhfU01JX1JTVF9MQVJCMTAJCQkwDQo+ICsj
ZGVmaW5lIE1UODE4OF9TTUlfUlNUX0xBUkIxMUEJCQkxDQo+ICsjZGVmaW5lIE1UODE4OF9TTUlf
UlNUX0xBUkIxMUMJCQkyDQo+ICsjZGVmaW5lIE1UODE4OF9TTUlfUlNUX0xBUkIxMgkJCTMNCj4g
KyNkZWZpbmUgTVQ4MTg4X1NNSV9SU1RfTEFSQjExQgkJCTQNCj4gKyNkZWZpbmUgTVQ4MTg4X1NN
SV9SU1RfTEFSQjE1CQkJNQ0KPiArI2RlZmluZSBNVDgxODhfU01JX1JTVF9MQVJCMTZCCQkJNg0K
PiArI2RlZmluZSBNVDgxODhfU01JX1JTVF9MQVJCMTdCCQkJNw0KPiArI2RlZmluZSBNVDgxODhf
U01JX1JTVF9MQVJCMTZBCQkJOA0KPiArI2RlZmluZSBNVDgxODhfU01JX1JTVF9MQVJCMTdBCQkJ
OQ0KPiArDQo+ICAjZW5kaWYgIC8qIF9EVF9CSU5ESU5HU19SRVNFVF9DT05UUk9MTEVSX01UODE4
OCAqLw0KPiAtLQ0KPiAyLjQ2LjANCj4gDQo+IA0K

