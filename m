Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91ACBCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 06:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sC1QU0KNWf7SJ3Z+JWpO5Q9pbVL4JNbALTKscLwpqa8=; b=oc4vlZBxaws0PIVXt6q8P9/n36
	dUdkqewi/uWHj2nm1JNzNE8p9pJvqWGzqgJI2Gy7FbQ/3xVF2aH6ZozR0050x6a7YuxSea95YlYi6
	oNPO5qxeMnhtqbyBJfBrsmLSpU04iDTYHR+J/mf0v5Xbz3OqVc93dKM6TxZtmruRm45+JEtCwjJBE
	IP/T879WAtcwLbGmf2uocjMlkkNjJKHw3owiRye+3WnBl5uuqf1J/GR8Hz4Rm6p5oJXiwm5oITIBK
	MIqc1xz4HtJ0LtKUVGbZoc4vdJrQvO9pQ8sf4BM21494drO8rVQE9jpJaKVl6Kgmg19WqXXau9vcO
	sLrIQtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wnj-0000000CbNA-1tHo;
	Tue, 23 Sep 2025 06:46:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0wng-0000000CbLF-3PzL;
	Tue, 23 Sep 2025 06:46:58 +0000
X-UUID: 15ce1fa6984911f0a52f393f94899d25-20250922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sC1QU0KNWf7SJ3Z+JWpO5Q9pbVL4JNbALTKscLwpqa8=;
	b=sqIyEaY3q9KHA9vxYKuMdSt6OnD/io51huatAdKTdcGYTq9pKCycZ30o4+0NDFgXtTPO1odYIXGhrT6tJ8klJXjPCUc7Xxl7VNJUfaTswHPjlm5k9JOtlfUur1cfs98RW6ZU9ZGuvuK9d20EztHt1Gsvdj7GKTGHfCZR86EhWFE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.4,REQID:f1e5ba4b-e5bd-4383-92b9-017582c21a68,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:1ca6b93,CLOUDID:53bb97f8-ebfe-43c9-88c9-80cb93f22ca4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:n
	il,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 15ce1fa6984911f0a52f393f94899d25-20250922
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <jjian.zhou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2106776276; Mon, 22 Sep 2025 23:46:51 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 23 Sep 2025 14:46:48 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 23 Sep 2025 14:46:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emrTZ16ehnsnFtcqRDDQiRS3BtWMBINpEnX7FfYukJzD6sr4gb6iXCC3m+51hBRMv+7CsUcbKIl5yHQPcmvp1d23kZwql0vyyCURZRUJAp7ggbC/CKjmFIukn0WQa2Ki4/SXCfzu3ceNxcR7dg2mCiEJVnzYXcsHGjsP70qonlclovLULFbJVagmUixeXM8cRI8t7dmwakoJDwFTVfa5aQtEHnmlXCQwKKGHr5eYaX9QSn1qzzczmo9Hjjey/MNKMHwGlCtdk7SHp+jyLmarbMFpHAEGvQk/u00XadS5LLrn59e15eGn3VZ4ee3mj6nRZ996Ww/sGaegqgYhCfHxIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sC1QU0KNWf7SJ3Z+JWpO5Q9pbVL4JNbALTKscLwpqa8=;
 b=jd3iZy9+9gH1KGci8irCuWAczJt5gU4NUWXzcICMuwFQuYeE+ytXVrTrg4hAQegn38Px56O47HlW9ZEqFVz5MQ2FifmTpnIjukArmv03eaJ9fcqbMf5GH6Yy8SQ6gmOct8QnPjXCm+pNFAkiSKKQEs3qSm/mYGjX/7gs3gtnL0xz5bI3dDVnnEc5+A3gJ/yCnclSGf716hEIC3UUOA+9drJfg3xpmu5ACTNOP1fle5qbwTXDexEXTvVzMG8vP1mX3JecFDBvSgqt0+tfeyljjO3e2G19UGUnANqZxqA/kmR3SxQqn3m+K5gRcw1JxOrMLU8r1uXSFOEPD8BInMECWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC1QU0KNWf7SJ3Z+JWpO5Q9pbVL4JNbALTKscLwpqa8=;
 b=NFkn7nxRI3r9gol7ZpKBoyjX1RxroVn1x9DAvmfboWjQqnAijppnznj00ewAtLnXEMtjjUbYqsMusK+cVPV+59po+1LEIe7NzQa5vm+erixsUHJTuiovpNFWh3Ilgi4/RvwCrB3uWvMRe+vcH/nZf4+r3B5qeXO+D9mj3okoCLg=
Received: from PSAPR03MB6363.apcprd03.prod.outlook.com (2603:1096:301:5f::10)
 by SEZPR03MB7121.apcprd03.prod.outlook.com (2603:1096:101:e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 06:46:42 +0000
Received: from PSAPR03MB6363.apcprd03.prod.outlook.com
 ([fe80::eb73:91b9:5905:e89f]) by PSAPR03MB6363.apcprd03.prod.outlook.com
 ([fe80::eb73:91b9:5905:e89f%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 06:46:41 +0000
From: =?utf-8?B?SmppYW4gWmhvdSAo5ZGo5bu6KQ==?= <Jjian.Zhou@mediatek.com>
To: "jassisinghbrar@gmail.com" <jassisinghbrar@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"wenst@chromium.org" <wenst@chromium.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
Thread-Topic: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
Thread-Index: AQHcEwpW87Sc9bspPUqF1pf91CjDQbSZyAEAgAa9iwA=
Date: Tue, 23 Sep 2025 06:46:41 +0000
Message-ID: <24a916ece6971d3ab9156dd8277eb23935e9cb13.camel@mediatek.com>
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
	 <20250822021217.1598-3-jjian.zhou@mediatek.com>
	 <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
In-Reply-To: <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6363:EE_|SEZPR03MB7121:EE_
x-ms-office365-filtering-correlation-id: 13267847-2f94-4cdd-975b-08ddfa6cf42b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?U0ZIV2hNVEdYRjhHclVvYWNDQmJQMk1MZDJ1S09LWDViUEoyeldZRnh6UjBk?=
 =?utf-8?B?NUxVcWZOUFVzcTJEQkJ1L2w0VkVCVmJqenZxeEcybVAyOVJTM2FFVmFvVEwr?=
 =?utf-8?B?TE1PMklhL2dXMHR5bkFUTllySXVGeWp6TDBSMFRTeW1TKzNpd0Z1N1laaG9X?=
 =?utf-8?B?K1dwdlFTRE1wUVdvaC9FSHNuTXdFTCtzTU5zd2ZrRDl4YXhET09ONkhaL09S?=
 =?utf-8?B?WGZ3VkVlSlE2QVNka09Pblh4RzJpa2Y1aE1reWdSUXdkZllhSzZKMHA5L09M?=
 =?utf-8?B?d0tRVW00KzdQRGhWSUdkRXNRUmMzQmp3T2ZBeEY2d3E0Zm1IdlN2VUpBb1Ur?=
 =?utf-8?B?bDI2NHhJTGVtcjlUWXY1a21MaUhFbU9SckM4Qm40VitURnJ1cmRWYnNtODlZ?=
 =?utf-8?B?QnA5U1JXQjVWRXpySWtIcTBFNmhRSWpaQ3Fya0I3SjlpTWNPRjVBMDlJWUNp?=
 =?utf-8?B?RHFxcEpING9KampPWmhNRE5HTWMwOGpyS1VZMTlra0lhOTkwNllTb0tCWXI1?=
 =?utf-8?B?K29pdnpiaENScVhQV0dlRnlXLzFuS1NUaHRoM2doNVc0NTBtemxlajcyRmU1?=
 =?utf-8?B?TzBHWWhuYUdwdnRoR05nSWNEdU9CaW1NT2RDdUY3VUpqUndyRkVSQ2RPb1hx?=
 =?utf-8?B?WXh6WFJ0Q3hzVy9mVlNuYTllVmVoUnJVSzluc3B3Qmg3VHQ2bUxmd0pxOEtt?=
 =?utf-8?B?ckltQjViNXVFdVBya1R5VkdqUmNYNDBUWDgxdmc4dElZS3NqeHRNQ2dLUzJz?=
 =?utf-8?B?RFVHTFpNMzNTTm13MkFTcG04S2VEODhUbHZIRUJVbmE5QU9LUUh4WUJadXd6?=
 =?utf-8?B?dEh5UkE5bG1XcHZtZmwySmMxYlhwSEQ4dkxUcWVnTGxRMm9qMW9BeVYzKzhK?=
 =?utf-8?B?UlBIZTI2QSt3TUdJemJQeDlmc09peStpcnBZandUWkpRNy9HOHd1ekVSNFpk?=
 =?utf-8?B?WDJ3MnMwWWNIS1RUTVRMN1doM2RFSkxSN1R4dHMvZ1pvc25IZlNOdmYxWWF1?=
 =?utf-8?B?cStOU2FOcGRubXhuUFN0WnM0Sk10UXI0NXVoMHdEVGFlelprT1pvWHZUSjZS?=
 =?utf-8?B?UkxkTVBzekZpbE1pcWJQdy9na2lXckQ0WURMWTBINkt6aEhndG83OWZmcUhs?=
 =?utf-8?B?VWhscVdMNmZTTVFCNFRYeWptb2dNVWl4am9NVzJEclJWbUc3dnpJeWxaL1dO?=
 =?utf-8?B?TjA5ajZxRXp4M0dVeWR0a0Erc1lhSlJnWkVIREVPN3dSYlBqM2FJYUdLY29o?=
 =?utf-8?B?djdjam1BU1JGajBJSUlkMTVPaCs4VEc2dXNhRkFkRnc4eDlpSDZ3UzBnOGNn?=
 =?utf-8?B?TkM0cmdBWVh3akJsclhlVTA2NjQ4ZlVPbmxISWVtYU45QmZMZ3JtaUdiL2l6?=
 =?utf-8?B?bHAwNjFoTlEwSVhBQnFnQ0J4eWRpTjM3UEl6eEQxeFRBMjBVSjM5bDVQcGdj?=
 =?utf-8?B?OVRyMlQ5OCtkeEdNeWp0dzRPZzl5T3RDdW5PS2ROOUdDL3o5T0NjVVkrTnAr?=
 =?utf-8?B?dnUyVGQrUCt0WTkxbVVObHJyUVpzOW93NDJ4VHI1Tm4vaEtxcnhhODN6VS9S?=
 =?utf-8?B?THBvUTdyLzFMeFZidzhBakF4cVZFSytPZzNQNk9iNkFMdXU2TEpWSFVuRjZz?=
 =?utf-8?B?SVV3UXEyZzVKQXRsVmI5RjJTbmY2MmVLU1QwUVBhb2RYYXpZdlNNNmdWZlZX?=
 =?utf-8?B?OEZwY1hLVjl6a0VrVWR2REVpcExuTi9KbEVJQlgrSnJOVkNSTWpDbkVnajQ0?=
 =?utf-8?B?bHJtVVFLcE5ENVQwZHpNdmRsTklSeHNqYzhxWGVpQXVTcmdUNDMvclZxZHAr?=
 =?utf-8?B?ZisyZGozRE5jdDNUZjJOVDdtNEdMTjhHRXNyV2Rma1lpS090OHNyR2wwWFpv?=
 =?utf-8?B?L2JuS05FdVo3b0pDTUJGSkxnUlpiODVndGcxdDZqcnpacXYzcTc3eTJhM3B3?=
 =?utf-8?Q?0wRjKSha5wc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6363.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU5PWjVGWW9ON2dwYld3UDYyN0JxVitoYkUyWlF6M0hoU0Jtcm8veVhrbmoz?=
 =?utf-8?B?YlZTaWxHTW1SZUFDTEdHcWk1YjBhZTMvQ0dPTVRaSnEwbjNybXF3a2hkdjFH?=
 =?utf-8?B?Uy9CdldLa2ltSW1CcUwzN1ozOUdMazVkeXNhT0czajFINjdIaG9WWjE2TTk0?=
 =?utf-8?B?aFMvMkh6VCtlamlKd1Mra0tqUXhGTlZ3b2hCTFVxUmx3TDhvcmJaWXdOYUZy?=
 =?utf-8?B?MTdDODNmWDBTN2VHWURNSzVJaHhJUTRWMjh4b1JHNFNvTWZNcnYvOVR6SW9I?=
 =?utf-8?B?YlV5a0lXRDRjcXgrNW9jWWdaL0FONXZZT2psNjU4blhKL1dMRTBTemR4Y0Qr?=
 =?utf-8?B?Q1c4a3hjT3JINmIreVVGZWZzWHJOdDB3REViS3NIU1JHRGU1S05qZnE4UFd1?=
 =?utf-8?B?TGlyNVQvQUFBM0VoK2tOTGJrdkJrRDZhUUliZUE5NWJQRDJMcnBrZDdrdkIv?=
 =?utf-8?B?V2daZHJPQXNqajk0TjVydi9HbWlKazdETUY3Vm5wZzl1OHUvZG4yajh4N1hN?=
 =?utf-8?B?cnJUM0hFRldhOWhpdnFXWFoxR2l0cC9HNnljSEhZWGZCa0xqUVpLTjd1Qkht?=
 =?utf-8?B?WVNvT2hEN0VvRTdQWDFYQmg4SUZSNVNwZUI5b0dpVG02VEl5eHFSb3JpQzEw?=
 =?utf-8?B?eDJBTEFTWEgrdVRhZEJDNmFQUElCZjIzSGUvejJxT2RYS0JhZXkzSERNSHVO?=
 =?utf-8?B?VzdsVnVzMVlSMnpLaWdWdSsvMEFTdGV3VkIrOE1DMFRFU2F1dU5ncGxiQzE1?=
 =?utf-8?B?S1BxMnFwckdITGVhL2ppWnRzZ21kQkVFblYrMTRoTDQxRkg4YWpibWRPM1M1?=
 =?utf-8?B?NHErZHNkQjNPYlJrRUpEdGp3VWpaeWpTU2RwSGFpYVhjSFI2Uk5maWZad1FH?=
 =?utf-8?B?Y0huVFJPOG1tK2ZyL084QVF1UDd4M2FIMk4rZzFZL0hXaVdsdkhRT2wrL3N5?=
 =?utf-8?B?dkJkZ0owMFQ1bGhsQ3NONEdTK1IyTENsMjhVOTF4MnV6ekNub1JUMmdLN3N5?=
 =?utf-8?B?QzdkNkoyTHY0K0NObVVUK3JHSjVJZEszL2NFRG95NkowMSszTndKM3FiSndQ?=
 =?utf-8?B?Z1NmTGNJcHo4RFI1UE9aNEtMbTZMK0J4VGttRHZJM1lDcUlWa3dSTCtSR05N?=
 =?utf-8?B?UEhMU3o1SG0wT1lJM2dVY3hXeGljak5jQ1loMy94cHpTbHA5QnpmMVNDUlQ1?=
 =?utf-8?B?VTgzV0xuSmd1MGpJSEp4ZVYrTXBuVDBSYWJjOTdsVXFKajNLRmR6MFV6UzN6?=
 =?utf-8?B?NnB3K0JpZzdHNHVjQUpvOTJEeGE1L1c4VHc5STdpYWNCbTZhVExPNHRKL2Vz?=
 =?utf-8?B?WW8vZTcxT1N1dGd0S0dqWmQveGZlelBXNndaSGRJSkl2YXNhcGRmMHNrYitP?=
 =?utf-8?B?RURZV1pNSFJRSnU4Qk1weWdrdDZHamlWTHYzZzBSdUo3djJuVGc0dGRQY05T?=
 =?utf-8?B?eXBaSEIyUWdVVy8zNkk5YWcrODBnSWdtQWRnWFNQc2V1ejRNeUxwTXVhNm9h?=
 =?utf-8?B?OFRQSnd2UkNWYjFxeVlabGlCeVpEQjVENVhMNXdnMlArZ1Q5dk5HRHdxMWdo?=
 =?utf-8?B?dUJ2TThWdG1RQmtSVG5wbEFyZUJSeVV5c0dLSGkyRnJDMHFSY29Mdjc2Sjg5?=
 =?utf-8?B?c3NHL2ZoZkYvK0NzM3NUNWttclNCY1NQVFFHT05wQ0k2ajdRaTFtcnFZMzZt?=
 =?utf-8?B?WEE3d0JKcnJvbGNRUEVXU1dnZnQzaW54L3Qxb1pNU0NKL2djNU82UlVIVnZi?=
 =?utf-8?B?aVhFZmhEUkEyVzg1ZlNJUkFubGJJR3VrYncwTGhRbHRHbkRCY1FPcERzdXov?=
 =?utf-8?B?R2hXbFJMYmtsR3hycG0ycHo0MzNKTm1MM3BHK21EZ2szV1UwQkVJSGMxY21y?=
 =?utf-8?B?UjhZbC9wbG9neDZncmp4UDdvVEZDUUFxRXdNeGhZRlloaHlpV0xybENTTFhO?=
 =?utf-8?B?R05UUHplTy9aOENmZk1xdzZKYkFLRzIzTzM5a290R2JyM3F3TGpjYzlYWWla?=
 =?utf-8?B?bnhlOGhRaUVMZ0NKTEU1bys0bENNYlY2QXBaNVowR3Nrcnk5TmY1dUpEZ1RE?=
 =?utf-8?B?eGYrSFFoVHZINytHUUViM3c1ZzNTYUFlRktDUi9Gb1kxUnN2a1gyYnNjZ0pL?=
 =?utf-8?B?MFFVNm5ueW5SdFZacmtkamVVWkp1UVB0Zmx6eTJoNTU5THZmZ3NVQllTTUFS?=
 =?utf-8?B?UXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <756A0D0C55583949AD5D757374C09FB4@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6363.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13267847-2f94-4cdd-975b-08ddfa6cf42b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2025 06:46:41.5998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y51Xs5tr3ksPBeq1U/fbF9aOwFZXK2Fc+7NKznHkMoPTEANEMhUcuHvaxNVNeLMzy9LvXCsMyvPaoPw2ChiuyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_234656_885068_471E00C7 
X-CRM114-Status: GOOD (  16.82  )
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

T24gVGh1LCAyMDI1LTA5LTE4IGF0IDE4OjUwIC0wNTAwLCBKYXNzaSBCcmFyIHdyb3RlOg0KPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IE9uIFRodSwgQXVnIDIxLCAyMDI1IGF0IDk6MTLigK9QTSBKamlhbiBaaG91
IDxqamlhbi56aG91QG1lZGlhdGVrLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiAuLi4uLg0KPiANCj4g
PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4N
Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8
bGludXgvc2xhYi5oPg0KPiA+ICsNCj4gPiArc3RydWN0IG10a192Y3BfbWJveF9wcml2IHsNCj4g
DQo+IE1heWJlICdtdGtfdmNwX21ib3gnIGlzIGEgbW9yZSBhcHByb3ByaWF0ZSBuYW1lID8NCj4g
DQo+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKmJhc2U7DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXY7DQo+ID4gKyAgICAgICBzdHJ1Y3QgbWJveF9jb250cm9sbGVyIG1ib3g7DQo+ID4g
KyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX3ZjcF9tYm94X2NmZyAqY2ZnOw0KPiA+ICsgICAgICAg
c3RydWN0IG10a19pcGlfaW5mbyBpcGlfcmVjdjsNCj4gDQo+IE1heWJlIGFsc28gaGF2ZSAic3Ry
dWN0IG1ib3hfY2hhbiBjaGFuWzFdOyAiIHNvIHRoYXQgeW91IGRvbid0IGhhdmUNCj4gdG8NCj4g
YWxsb2NhdGUgb25lIGR1cmluZyB0aGUgcHJvYmUuDQo+IEFsc28gaWYgeW91IGhhdmUgICJzdHJ1
Y3QgbWJveF9jb250cm9sbGVyIG1ib3g7IiBhcyB0aGUgZmlyc3QgbWVtYmVyLA0KPiB5b3UgY291
bGQgc2ltcGx5IHR5cGVjYXN0IHRoYXQgdG8gZ2V0IHRoaXMgc3RydWN0dXJlLg0KPiBTb21ldGhp
bmcgbGlrZSAic3RydWN0IG1wZnNfbWJveCIgaW4gbWFpbGJveC1tcGZzLmMNCj4gDQoNCg0KRVJS
T1I6RkxFWElCTEVfQVJSQVk6IFVzZSBDOTkgZmxleGlibGUgYXJyYXlzIC0gc2VlIA0KaHR0cHM6
Ly9kb2NzLmtlcm5lbC5vcmcvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5k
LW9uZS1lbGVtZW50LWFycmF5cw0KIzgxOiBGSUxFOiBkcml2ZXJzL21haWxib3gvbXRrLXZjcC1t
YWlsYm94LmM6MjQ6DQorICAgICAgIHN0cnVjdCBtYm94X2NoYW4gY2hhbnNbMV07DQorfTsNCg0K
Q2FuIHdlIGlnbm9yZSB0aGlzIGVycm9yPw0KDQo+IC4uLi4NCj4gPiArDQo+ID4gK3N0YXRpYyBz
dHJ1Y3QgbWJveF9jaGFuICptdGtfdmNwX21ib3hfeGxhdGUoc3RydWN0IG1ib3hfY29udHJvbGxl
cg0KPiA+ICptYm94LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29uc3Qgc3RydWN0DQo+ID4gb2ZfcGhhbmRsZV9hcmdzICpzcCkNCj4gPiArew0KPiA+
ICsgICAgICAgaWYgKHNwLT5hcmdzX2NvdW50KQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4g
TlVMTDsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gbWJveC0+Y2hhbnM7DQo+IA0KPiByZXR1
cm4gJm1ib3gtPmNoYW5zWzBdICAgc2VlbXMgYmV0dGVyLg0KPiANCj4gdGhueA0K

