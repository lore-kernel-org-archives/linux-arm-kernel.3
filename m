Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CC4F30928
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9NuvFl8w4+T7I3LJhji+S5utX7wNMhtC/ilqiyZQv4=; b=lbe9dCbAW0thUjXTFvoDRb77Jh
	fR+eIw9/wKl+FQWar7x1OyTnoiZxZXKNCRUPBo0bZPYC4Njpg9EwF1XO2wTAdF/9mWiegj6wRgLSO
	ANxLNlAwsQPGrvY8lN1Lf3/jx9OzikfA+9xPZCHSJJBrY2WEGT3Z7v0JUexfVdCPapUr8UmZj5flo
	kbbW0niODLBUqQh4F+/pSIn8ts9WsaINhS1d5pf/eZ4qXKUoox5oovRSN32Vp4A7pj6eRDrdErBLy
	ZPjPV1tVpVFBFhICvmJSW4K3gsLSaamzeUqM+6jMQxAzMC9DK+v8MNqbF+NR6oKID9WRAbfEoJtEd
	T1DXM09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5AD-00000001Q9m-0qn0;
	Thu, 05 Mar 2026 09:38:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5AA-00000001Q8z-38bQ;
	Thu, 05 Mar 2026 09:38:35 +0000
X-UUID: 1221e168187711f1ad39f32c34db0b1c-20260305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=U9NuvFl8w4+T7I3LJhji+S5utX7wNMhtC/ilqiyZQv4=;
	b=NHbA3Lz0aODSJI5eXzVXa9fEMqN+Qv29IVjE1XGemstKTWrC2dgp8nlqiJ45ZCmv6pzncOdxAB2DhSKPybh+l8c/+Z3LB9LhqBbUNDioE87k2leBUqjAq0EW0R2ctRkdb3BvYvF7+Xl4IkJtoztsTlJzj6yMgMLhLxQLgk+01FA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:94268a4c-3a80-4257-a7e8-8f703240c65a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:28c846ea-ef90-4382-9c6f-55f2a0689a6b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1221e168187711f1ad39f32c34db0b1c-20260305
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1309985433; Thu, 05 Mar 2026 02:38:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 5 Mar 2026 17:38:28 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 5 Mar 2026 17:38:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q3JsXrCP9rF7QI4SykjripsJ+DbAtU103EbUhsTYZ6xv4M4Xqug+8gUeo3a3MsDvHZ5ZWVBCPhCw8Pz9DCVZT/R7EZsjl8AOqKP/EMluzxCfqXycQlf45FjoYfjCz84u4ErD507jcS/nBuOGzN40Ivyr7Tzvv0xXow6+ak90UmlDregh2q4/AfjvcPWiOlaQlcH7P5vlNJzSs3YGbIYIOuGcDHJ58TzgOx0sS3RKDZuSMUoekuhoMw+Rs293rnxsKb7/kYCEeEIRoGUGddst4FHm0iuTM+vkQ2pnYf51KGqmiJb+n6jhcyF71seXw/F55T4nYGPib4oVCmYOditayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9NuvFl8w4+T7I3LJhji+S5utX7wNMhtC/ilqiyZQv4=;
 b=HGBkLOBGKhKhnflihinSwtQ8M2otee9iBdqyaX8u5Q52KsFBGxLXRtCev3pTMvou6OkI/8ZDNJeKR62CHaoIJCPKJ3UDWJ9ZFewuQXq7LiuD0Xku41j95RNHUXwzvwXMugOC9cg5n8EcvB9bfKAEXDQ1eLFmAaZ8JQk+1R6X7RjNOFV3xaDfQx6Y2QBkhTrTuRordDCTeuN+JxB/BkFjovMZc8rBbsMNOK+dp4Ym8LpNwZjxbWLe3CP0VWLhHG8hOJmSe+ZEpHeg9reBwMPaJ5YdT4PHcDv9ok+NWW24nWOeY9aADPoSmGilVsNpxbvOdvOamW8e7nYcQL/o90OMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9NuvFl8w4+T7I3LJhji+S5utX7wNMhtC/ilqiyZQv4=;
 b=iMi6MFjw+40P+YmXp80w3lCwFcVBhOKGTbsJIZF9kECk/V/gysPCjUrftnZbK6vLzyvRACIloTvp4L1zUb1GSe/nY/Og6+Fubq/iErjB+3ucrE40ldzM2Fp3eRN9qLFD6XW2N3o3Te2ZIWtYWDHo60S+DeXOuC1BRZNYEljHQeQ=
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com (2603:1096:301:66::6)
 by KL1PR03MB8822.apcprd03.prod.outlook.com (2603:1096:820:144::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 09:38:24 +0000
Received: from PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925]) by PSAPR03MB5605.apcprd03.prod.outlook.com
 ([fe80::165:d36a:3f76:2925%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 09:38:24 +0000
From: =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
To: "chu.stanley@gmail.com" <chu.stanley@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?=
	<Chunfeng.Yun@mediatek.com>, "kishon@kernel.org" <kishon@kernel.org>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "bvanassche@acm.org"
	<bvanassche@acm.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
	<Chaotian.Jing@mediatek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
	"vkoul@kernel.org" <vkoul@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"broonie@kernel.org" <broonie@kernel.org>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>, "kernel@collabora.com"
	<kernel@collabora.com>
Subject: Re: [PATCH v8 18/23] scsi: ufs: mediatek: Don't acquire dvfsrc-vcore
 twice
Thread-Topic: [PATCH v8 18/23] scsi: ufs: mediatek: Don't acquire dvfsrc-vcore
 twice
Thread-Index: AQHcq+cRL3JpEFReq0mUFvNWidW6G7Wfr9CA
Date: Thu, 5 Mar 2026 09:38:24 +0000
Message-ID: <3f4ecba271089f6c6e4d8dadf5cc8c66661b580d.camel@mediatek.com>
References: <20260304-mt8196-ufs-v8-0-5b0eac23314f@collabora.com>
	 <20260304-mt8196-ufs-v8-18-5b0eac23314f@collabora.com>
In-Reply-To: <20260304-mt8196-ufs-v8-18-5b0eac23314f@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB5605:EE_|KL1PR03MB8822:EE_
x-ms-office365-filtering-correlation-id: 856e7318-6506-4667-3e9b-08de7a9af2a1
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info: TfQauJ6ZnzH6VzYUzD0CueDB+2gRBZux/77sohYPqOXHSOGviWgOgeFOMjpQRqJGs/m3h7ZCQdT5Q57qg37bALO9W0skcwDSPcHlmN4Ri7YwE/DF0JIiO0dgZaMOtbg+6q0+bvZw1H6LXwftJuoBfKaeAFd3jz9k3H5rKELcthsWrUkr+M61qOvgaWdoOc5bCMX4PHAqOwBnbbQkak1WsXYAZrh0xxNREO+huljuFjL8OrOpeNQQgGNuzGhe11OiuX7YjsAkqeELzZdl7B2odFA/2VpvGDenbKxYWrvi0BW6nq9H4n/9uMf1Gh/vlpkMPkZ5JRCU8fdpYWLadxUhBRJIRWx4ikU/9/kuS05SzJOQWAJhuCe+aSS8keKvdICvTtNrZZ3iMin/zpjgAeGraI3N2QR8FFeMwf0ve1T2w3djqjZfTYStHj7+Wtq6lqkBiU/JTqXj8jrvAAlEnPxCS++999xqjfT54lV7CV4Sk0bJJrBX5zcnF5QSzQdj40Ap7i52Y4gtrFGe7i6up+VLWVooRddnHz8xN5QXwv4nc6wxhAZ6zl+AuRyete+cocWtK+gdxGKiAaSgnd5GBR4VlS3BDRag2OYOSA2xXfaEXjp8XGV2u+Woy4lBegHTHYX1/Jl+a5T4OGQXe4j5DYrYscIm2DEC5PrzDZ7zsccF5Ctg33imUKKMG128DmcxSCTOZUjRePj870OiMNAU1orQYjccHvlEXgGl/x9CgH13x5Bo23xlh/fUG8hNiOxIgioW+GTFpTvdDXf9yZXM7aLM0BTWUnunuB9zVAT3HUTYXLsyF7FyciDdkEXyXthEuC0L
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB5605.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGtITE1VVnZXTDRFcUhQZ0pTbkRkenNVNHFxYmo2WUlPdlNoaVhyMXhXYklN?=
 =?utf-8?B?MlVrV1JpUjUwMTNpYXEvKzFSMmxaMG9EVUR0cGpCN3VKeWt1cnBMeWdEQUNU?=
 =?utf-8?B?bWRpQUswQVgrdS9yTFk0cFlBMVE3d2owdXNQM1NSd2R0VlBobFlyMW1OdlBE?=
 =?utf-8?B?dTc4bE9lWDRQR0VCRVV0T05zOVQ3WjZGUEtiVnBGek5Qbnd5Wmtnek5sMTZZ?=
 =?utf-8?B?VXl6dGtabDZDVVppMk1RcGI4M2kvbm5UWElWck5KbklwZDFlZ3JCMldpOG9T?=
 =?utf-8?B?cExjeEVRTXZXa01iNnM4bm9Fc1l0NWlhY2ttUFFJL1RZcEVXdXN0ZFJXR01V?=
 =?utf-8?B?c3R0SEJ6N2lXb3FVQlhxUXJiTE1Zem94UDE3TEpNd3dOSExnR3J3QURLNHJN?=
 =?utf-8?B?NGp5MzRjRk5qdzZmVGZUWnNOYlR3YStOUldFY05QamoxSXY1K2FMWWtweFRC?=
 =?utf-8?B?Y0o2RjJ5bFhkUG9HR2N0dVEwM3NqWHJqaWx1MjhpQTEwV2ZlNnJLTXB2eUd2?=
 =?utf-8?B?cEg4bndWenVKRmsvem0yb0llWmJwd21LMDV3aDBYNjVIcDVWMWMyM2VoMW14?=
 =?utf-8?B?T0l1U3VzMVU2RU9RNVBNTVE4K1plY2JXQ1E5aGdSTEo2dnY1Q2hTZld0OUkz?=
 =?utf-8?B?akJIa1Rtei9IeGdzZXBNRnQ4ZnlISWExUjNlK0ZjeHEwMlJYV0hkakJja1c2?=
 =?utf-8?B?N1FaWjVncDVIU1duSmcvdlFUM3lVd3ZJWHlWYWwrVjVGQ2FvUUZTZ0Y1ZEd6?=
 =?utf-8?B?TnJqUTNIdzR3NU16aVQ0SkJpR2wyUmR2aFBpUTF5SUNRWGg3RWFVczhSbXdx?=
 =?utf-8?B?Nko5cXd5Sks3dlZTaWowRnEwOWtRYWVlV0h4WmlPcXpxdkpVa0h5UTVHL0hH?=
 =?utf-8?B?d3hKL0U5NGdwWit5Z3pRRENaSVBJZ21zeWNVUjFMb1oxekNYbU1WcDZyMVBK?=
 =?utf-8?B?cSt2NjkzTS9iWnpHTm5ScFRIV3BSQjBFYzYrKzNTTmgrYXpNOUowWFk0akps?=
 =?utf-8?B?STVJYmJacys4UHh3OERGWWRJSFlIaVBwRmpic2J6MDBvSkpNVUxWdElRQWt0?=
 =?utf-8?B?U0ZzVklncXI1a3FSS2YxamdZeEY5TVJpRWRML1FSOURxWlFmY1NzREpjZnR3?=
 =?utf-8?B?VHBXY3I5QWNLUVNEVFdVVXI5azRrbkkrOUdEcWE2R1FEL3lPYTN4dXFRWTRB?=
 =?utf-8?B?c3Q0V0dRQUtqWEp5RW9ydkR6L1d3N3BWTTQ4blBNaEt1S3F5MGNKakRvMmVY?=
 =?utf-8?B?anN5amNadWY1aXdWeHprSzNqWkhJeEJDSXl2VU1PSm9DeGFwa1V6T3lCeEc4?=
 =?utf-8?B?N2dDaTd5ckpVUHFNYk1wQ3V4K0lPQ0hIV3oweXNNcE5QcHp1ZEJ4aElKZkcz?=
 =?utf-8?B?U0UxcWhOdVN6d2VycVVRYllyL2UvcEFQVXA0YTZtMzdldVpiRGMwNThZRTh5?=
 =?utf-8?B?bm9zL3cwYUt2Z0N2RVRRUVZKUDVqT0FXendHWmR4MXdJNG16TU5HNTVscDhM?=
 =?utf-8?B?YXU4aHNvVzlWU3k2S0YxMVJHbkNVaGsrN1ZSQzdLMFYycGQyYTBFVXQycjRE?=
 =?utf-8?B?dEc2MG5sZDVKaTJIbUt0eWFkdUVNQXlEVXBIY2EyblFwQ3lPL2pOdzRORkVj?=
 =?utf-8?B?SldOQVEwVllKREJ5dGpJRVVDRnBVemQwb0JSMG9jU2lIaFlHZmNrRmcvOTVp?=
 =?utf-8?B?NGNwRVpxcUNxRC9nM28vMnFMVHVNMlRMdnhVTkZRc3hmVHBDanY0N0tCQURa?=
 =?utf-8?B?dDQzUTk4bXJ0cmdEVUhjSTBvUko2NC9rWmtvM08rcTI3V2lYeEJmN251MHdE?=
 =?utf-8?B?ZVZoQ3hRZTVxa3g5ekdOaXhtR01TVGR2aUhtckdTSXhEcFZPMkM1WFRRUzFE?=
 =?utf-8?B?c3ZmUExsemZXMDRNd3dKMjVsNjAyK1A0VlhBNE9qcXR5U3I5dEVoblVZSmxH?=
 =?utf-8?B?NUNvZmlzL1Zhc2VFdmltaEx2TGtBK0dOZFdjN01jU2p4MmdqU1VTc1Q4T1RN?=
 =?utf-8?B?TVZ1MjAvQUZ1aW5CTGtEYjJmdjdjaDNZUk9GYVdtemxrbEVxazZmVVhFWThm?=
 =?utf-8?B?NlVOc2RDTlN2WXovcUI3engyNjJJQ3pYMXJoSForYVF5Y2s1NUNuQjY0RFdw?=
 =?utf-8?B?SnFEaE1xcHptdUozcjR1M3hBTkhqcDFKbHNXa1RuQVBORkFiN1hKK1hlV3hG?=
 =?utf-8?B?TGQ2Z05DZi95YnA0STNCSStyeU1TUVhyZDMvVmFNZEtHNi9waWxaZWtDd2Na?=
 =?utf-8?B?V1E0NW1mTUs4aWVvTFRpMUFENkJrUktDTFIyMUxOQ0Qwdy95aXlCblFZcjIz?=
 =?utf-8?B?QlRYSGFzUXoyT1Y5SHc0UHJjeUVPOGdPR0FYcExiMENCZTZkRFptUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1966925811C3FD4E9FFD03958B04EED3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bc5VdLiNbwHnrkXejTGytlB017GYLIGxwH2aAdPusHK7uPOsuX7FqrTRyBHU642Em4y6lQLIqz0v6t9VfEOtrNH0VeLJ5bLx68t8c9OTKSTnKBfu06s/EjVcn9QXFVQX54u3oDj2279UQXKcRS5blWu7Aqsb0qWMo+WZP44QUCxin88/AEe4O4jrlJgM8ZyFK0bopASXkYyklZB5RJHiU6s3AnIPqWa3hWOVXoT3a6myh9/6WKv2FvQqXQ4noEKX8Z7VQMFSxNoVSBKmPa2eCQ52mNykOR1eb8uCUntdoLWcKRjT/C3GA7Ivz2yl3EjVBtzwSi6wl4rStfN1QJAp5w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB5605.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856e7318-6506-4667-3e9b-08de7a9af2a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 09:38:24.7080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +ixth0tUrTneVfE13M29YgSe28U0XLIcrsavVDXxGmIS6+gwOhImvj89xlSofHsS7DT+cF3lAK2UE7wRKQ0JYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8822
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_013834_791261_EFEAB7A9 
X-CRM114-Status: GOOD (  11.02  )
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

T24gV2VkLCAyMDI2LTAzLTA0IGF0IDE1OjUzICswMTAwLCBOaWNvbGFzIEZyYXR0YXJvbGkgd3Jv
dGU6DQo+IEFzIHBhcnQgb2YgaXRzIGZlYXR1cmVzZXQsIHRoZSB1ZnMtbWVkaWF0ZWsgZHJpdmVy
IG5lZWRzIHRvIHBsYXkgd2l0aA0KPiBhbg0KPiBvcHRpb25hbCBkdmZzcmMtdmNvcmUgcmVndWxh
dG9yIGZvciBzb21lIG9mIHRoZW0uDQo+IA0KPiBIb3dldmVyLCBpdCBjdXJyZW50bHkgZG9lcyB0
aGlzIGJ5IGFjcXVpcmluZyB0d28gZGlmZmVyZW50IHJlZmVyZW5jZXMNCj4gdG8NCj4gaXQgaW4g
dHdvIGRpZmZlcmVudCBwbGFjZXMsIG5lZWRsZXNzbHkgZHVwbGljYXRpbmcgbG9naWMuDQo+IA0K
PiBNb3ZlIHJlZ192Y29yZSB0byB0aGUgaG9zdCBzdHJ1Y3QsIGFjcXVpcmUgaXQgaW4gdGhlIHNh
bWUgZnVuY3Rpb24gYXMNCj4gYXZkZDA5IGlzIGFjcXVpcmVkLCBhbmQgcmV3b3JrIHRoZSB1c2Vy
cyBvZiByZWdfdmNvcmUuDQo+IA0KPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwg
UmVnbm8NCj4gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTmljb2xhcyBGcmF0dGFyb2xpIDxuaWNvbGFzLmZyYXR0YXJvbGlAY29sbGFi
b3JhLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFBldGVyIFdhbmcgPHBldGVyLndhbmdAbWVkaWF0ZWsu
Y29tPg0KDQo=

