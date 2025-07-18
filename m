Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0202C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guXGiNeqjNhbHz5gDNQIfg698h/9tFQTiMYMw7LxwIw=; b=YqIbNt8yCdRtsNaLoJBYqKV3rU
	Id5ed4UwhEa7tw1Lg7K12stJv0aekPlTnnLS0qRmc1AIICAbzWhJllij5+oQ7YhhGO2N1O52zSU1f
	5Xb3j7IrvPuv1eGrnlKJu8HlXJFpx80lcauPgimy5MhYR2DxbuZmghymOrvZF1b1feD9zqU9NcNcc
	nbhvsxMxXVEDYUGqz9hhff9Ci3/dPMSw/0KEaydlsk3bIvYK/Tx9g54HeUhohmfgYWLFJtnV5hkOc
	7Oa3vZ/gPsmHzu9WRqoVuRib7k9CHrtrhqaH6CaXY/8yzqbjiFD+q0WjuAhHC7NauqLoOe/95c8I6
	jKWJgbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucgw7-0000000C6RH-2iR7;
	Fri, 18 Jul 2025 08:59:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucghZ-0000000C4gV-3S67;
	Fri, 18 Jul 2025 08:44:23 +0000
X-UUID: 6371d2d663b311f09f706fa2197c6ceb-20250718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=guXGiNeqjNhbHz5gDNQIfg698h/9tFQTiMYMw7LxwIw=;
	b=ayC3voCm9jkAEmZRE7j5r2UamUcB9S+67U/bp9uXpKmsrL6vnHB1wWrK7l/LAYrYAdQ6KyPBjXrLAryRLgEKx8sYs4TORDOg3W/tDSHavi0fYA2YGcZk/+H1nlU9BobeYPAigy7ScTFHXd+vc50suHQnNp0nbHXUsps0klQ2LEc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:8dcda4ce-847e-4157-b676-d93ec3a4d8ce,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:3e1cec0e-6968-429c-a74d-a1cce2b698bd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6371d2d663b311f09f706fa2197c6ceb-20250718
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <cyril.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 77442026; Fri, 18 Jul 2025 01:44:16 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 18 Jul 2025 16:44:13 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 18 Jul 2025 16:44:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7QOGQR2bd1GJylFbQxnHvolcGDK4sVW/VDFVQxc31J8MIuTQEnsNSCbzCRQ7ODq7hCSBx2XDLOfyy0uqx4g8c3/HpvH7B2XD9rdmrhnkfIZkSsmgFBm+Rgi710VeDsSuJtFRMGsQ/3P4hIWtY2kDlELDut9S47EJsv22LCfrE9JpHxRwEs9A1+REb/GOlW3hGxdoBkekQhlJBRqjgINj8H6SqM5amyaTZ8xmb8htYF/IY8WnVvQ6ffpIFPbBWHq4bVYYSNOVazX6U7vJ/YnvhNe21HTwdMaJXF+HZ4FvR/dfR9HYdHBlTJ3e/n46OwNXcbed0+Zsgv7dUric5agXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guXGiNeqjNhbHz5gDNQIfg698h/9tFQTiMYMw7LxwIw=;
 b=Otd8fubgequLySLCGbEIatjjXTxTYI6umCAYJX6Kz+8zT/YuwVcXAj3MrKnyxFF0SsCk6XEAXZXnq/DKJaEN+5YNN9X6Dexw/XgqrwxDs2VnYnfpOF1Qf0+hkAzy2VDwI+bsBnMPIzimRcURKXUT5J3meESLIcv7X3x5h9bTeVJf0Pg9hBISvRtfVrgGY0CRSJbyKa6blzu3ZvPE/Bsbf1HtqzLo/DNuHmNYWN+vWAlix+vYu3d8RYUXbJGDRjJ4QDvrQtEN3tMzzEtWCPfnaZW4okV++yUpVp33zJxU+SZLCUqabUe69m8miGW3TbP/OSXq8qNLP0YBUaJvKJjGbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guXGiNeqjNhbHz5gDNQIfg698h/9tFQTiMYMw7LxwIw=;
 b=YRFUE/hSnSO7IVwrzh30QnBRoXFKkmJGigXKJ3xnXIeZCnBdRqKc9tf4jKfBEbrFNVFE4nvF4OfyW3wwjzy//V/VmiamDWcO4tvc7LvHTaS/zw+I96WE4VX4g2f2WvLk0mxGkfGD3O//4cm63Y9RhBoNtam91+Apd5LoB+GHBCo=
Received: from TYZPR03MB5343.apcprd03.prod.outlook.com (2603:1096:400:3c::8)
 by JH0PR03MB8290.apcprd03.prod.outlook.com (2603:1096:990:45::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:44:10 +0000
Received: from TYZPR03MB5343.apcprd03.prod.outlook.com
 ([fe80::6a18:3b51:df4c:efbb]) by TYZPR03MB5343.apcprd03.prod.outlook.com
 ([fe80::6a18:3b51:df4c:efbb%4]) with mapi id 15.20.8922.040; Fri, 18 Jul 2025
 08:44:09 +0000
From: =?utf-8?B?Q3lyaWwgQ2hhbyAo6ZKe5oKmKQ==?= <Cyril.Chao@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "broonie@kernel.org"
	<broonie@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"tiwai@suse.com" <tiwai@suse.com>, "robh@kernel.org" <robh@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 09/10] ASoC: mediatek: mt8189: add machine driver with
 nau8825
Thread-Topic: [PATCH 09/10] ASoC: mediatek: mt8189: add machine driver with
 nau8825
Thread-Index: AQHb5/yDQddEDO8tYEysSkp1EnpGuLQYg0oAgB8s/AA=
Date: Fri, 18 Jul 2025 08:44:09 +0000
Message-ID: <143fb1f0756caeb8287ab02be450ecdb3459c6d8.camel@mediatek.com>
References: <20250628071442.31155-1-Cyril.Chao@mediatek.com>
	 <20250628071442.31155-10-Cyril.Chao@mediatek.com>
	 <a62e0111-e3b7-4772-9467-3a2927972f6f@kernel.org>
In-Reply-To: <a62e0111-e3b7-4772-9467-3a2927972f6f@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5343:EE_|JH0PR03MB8290:EE_
x-ms-office365-filtering-correlation-id: 084a72ce-5d5e-4d0b-4b86-08ddc5d74397
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?S2VtQ2Rrb3dlcmNtMXJ3ZjB3Z0N0enpGTHpFYlpNZ21CVk9qMFROdThXQUt6?=
 =?utf-8?B?SzRxbFdWSkU3SVpZcGM4VnRjNHF2Vm44cTBJTVpXbVkzN3EvbjRuQmRxN1Nr?=
 =?utf-8?B?ekcwcS9zdUFNcWhib3lDUjNMMVY3ckRnZG9NMHphVzJWdkthdlU2THZSS2NR?=
 =?utf-8?B?QTg1UzY0SFZXVkwrZGZvdVIzcnl1ZlBJcmlvSS9iTFVSaEUwYTBJYVM1ZVlh?=
 =?utf-8?B?Mmg4bkJpU3JIVjF6cFFpdUFPek44eGtMelpUWjl0UG1zc0lOYWNEMkZvNDJ0?=
 =?utf-8?B?OGNOcG1nVEZYd1B6OCtLZ2VCVHh5UENFb0UwU01DWWdvMHVTZU1TWmEwTk1B?=
 =?utf-8?B?Qk9NeWxCc24zMkdIUnZCRkI0UEtYVXdvOWhnRjhsekE3TkppdXAyQnhnQ3la?=
 =?utf-8?B?YitUdnRQWHBnWTBESjlhaU5PMTJScnY2Um4xbDYwWnEyN1ZubGtUMmt5eVlz?=
 =?utf-8?B?MHVkT0JNKy9JNklESlhuLzBIVXNPOHJERUtrOVhseUVPZUh1TnMvekNnSEVS?=
 =?utf-8?B?L2tLRUppZ3prQ2I1VnNxNFpJQVNWbFZxL2llL0NFbEZFU0xzMldmQ2tvcFor?=
 =?utf-8?B?ZENXZU9SL2FObnhuM0N5TThVUkc2eVdyRkZQUXVuZStIUS8xWDNPcWZrNlhp?=
 =?utf-8?B?SU90a1o1N0xxeGYzaEdDbUliQkVlazVvNWREVndneE5qOGc0QytINEpGL01o?=
 =?utf-8?B?dXJ2Rm5DbEliOWFseXBIdHN0Yi9MQ1J5OEdiRUxOSC80Y2lsQ1E3Zk41NDZl?=
 =?utf-8?B?SU9tWXhkaktlN1k5K21sY2VZY3pDTUhXTU9UUFd1QjZtZXl1cEF2UGZvUUVy?=
 =?utf-8?B?MWtIODFjL0NHMFh5QmdyQVJlekV4UkhmU1V5NG53SFNnMzhkellFbXRlVU1O?=
 =?utf-8?B?MW9pWWExbmgwNXlmVUxHemdRNjdlTWVENDhJcHFlTTVqSEl1Yjh0WW04OVUz?=
 =?utf-8?B?N0I5ZEgzc2plQ1gycEZhYnFIenRqdHNpSmNJNzkyOTZabFpBd1ptdnp3YzRL?=
 =?utf-8?B?c1QwWVlvM2RqZ0NQVkdLbklxZ2lpdms4MlF6WHVoYUUrMzdKbVJnZnFiTStp?=
 =?utf-8?B?eE5IbmVQSzZlczdlTjJtMkQ1QjU0Q2NIcSs1cW8vcjcwS3ZxbklySmdCYmpn?=
 =?utf-8?B?UGRCRERna0ZTaDZhamc2YWdrYmhKdHdaMzE0YXJMQXBaM0FJNW84Wkd3bkM1?=
 =?utf-8?B?TEV4ZENBcFA4aXIwc1pYQi9ZSEZpT3NvbnEyeVorcjFRdVh4ZmMvODlNeVI3?=
 =?utf-8?B?VzFKZW9KRzR1RmFPWjBDV0w3NHpIbHNBU2oxRjRuTGxzZE5XQUlBYlQzZmkz?=
 =?utf-8?B?Zlc1OUNBQ2htS3lReVlxTVdRTWwzRjVXS3dFSU9weDlBRlNHOXFEcm1TdHhD?=
 =?utf-8?B?M3Qwd1ZFdjhNR2pPc29QQkFoL1NkYWdmL21kVm1jQXcvcHJHNGJPOU9BK2VB?=
 =?utf-8?B?K0QzZ2ZZaFAyOEhyMnYyZUxudHN3dW1ER1VBQWZncjJwRWhaVWMxMU1UZkhS?=
 =?utf-8?B?NlRsN2w3bWVoK1NKUExvK1RnMWMwNXZGS0RrdzQ3cWljZE5sWnZ4ZFAxUGdB?=
 =?utf-8?B?WXVhcE1YRk5XNWdibzF2Q09xbGpGa0ppUmxhUGVjdnlpbWo1Y3MyQ1dzYWhG?=
 =?utf-8?B?bTMxY09kNmVyNnNQaXhEUjh2aHdWNGhFVHNhSHZrK0F6akpnNmVFa0FOMEww?=
 =?utf-8?B?WmNQY1JMM0ZVUWkra0hSWjhCWDJiYjEwR3BxRTI0N2dSNUwyR3JMVEw5OUc4?=
 =?utf-8?B?dGxoQm9aZjRQdlB6RFQ5dFJJYkJaemdSNk52K2oxeEt5UENKVDZwVHkxRU1m?=
 =?utf-8?B?MUhIWkQwZEVRVityMkdZMDRkbkxDMWtqMk1wQ3MzdEQxRDBra1RhWlJDRTZH?=
 =?utf-8?B?Um8zTTJwSFBFTHhxMzFrUExrSzcvZE5EZEdSUG9jSTZRVUlUUVdWMGhSaGxV?=
 =?utf-8?B?Q082T1NrTm42RmpvZHJtTTlNU0gzMUt5QXZGQi9Tai85TnQxWUEyaVFJRk1T?=
 =?utf-8?Q?M8v/pFYedzWBphnZSKQB2jFrssTFZA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5343.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1U2MUlmWEFnYnBNb2p1R0JYRmQ1eFI4MUtsZVZGa1ltOE91NTVMbjJOeG9t?=
 =?utf-8?B?THJUTzZLTUVsSmNsdUkrZStvTWpYTzkxdC96S2kxTGN6VitZTFhJaFNVT1Vj?=
 =?utf-8?B?K3BJem5reUdDa0kyL2tnUHd2RUpjRnNPNUJ0L2NuL3lGdEpXUndOYkw3emFz?=
 =?utf-8?B?V0lMdHcxMUJJeWZSR0JFYkFZZDNNbE5xSkJwWU5WZ21NU2U5WjFtYmRCNWZC?=
 =?utf-8?B?MmtKN3J4SzFmQmZnWDkxUDJHU21PMVZBZHM2WXlzV0UrTjFpaUZDTEpyS0RB?=
 =?utf-8?B?MTFkZjJ6blFqRU5LcE5rSTZWS0JtdUJldE9DYlY1dnEybmkxQzhudCsyMmhE?=
 =?utf-8?B?cnUvK043OTJmTzd5cUx3alA4NHYrQmQrT0U5S1VvYTlNeTB6azFRUWw5eTln?=
 =?utf-8?B?Ti9yd3E2eHltSGRCazJXenFuR1hrMUduZDBEMk0vVVFlUW9FK0NkeEJFcDNx?=
 =?utf-8?B?SklWNTJMTnBiZHYxTTlFTHNIdmRTTXNwak5UNU1yUjk4ZEJ2M0c1WkQweG8z?=
 =?utf-8?B?amtvU2hicWNHMkI5TS8yQVRuZkk0UElESlEvVGFKdEh0ZUUyek5UUWV5ak51?=
 =?utf-8?B?VGpPL0hLSHVNWlQ2Nk9KbGQwc1N3cXZSMGRhRUJUMVM5dnR6czFVbk5nVVVi?=
 =?utf-8?B?M3gvUkN1L0RmeFZENUlwMHg2Mml5YjN0S3pIRjRla0k0cDVrTWlPZ1JFQnJr?=
 =?utf-8?B?Qm1mdGcvTWI0RldxL1d0WUJidDBlN095WGlkL2xZdGRwSzhscllVbERYSld6?=
 =?utf-8?B?KzMvSHdWMkY3K2VKNGRqSlJONXlVOXBVUjFaandoQ0ZsdzVFYURCbzczREcz?=
 =?utf-8?B?SllhaHU4Smg2K2R0ZHZac3dRQ01mL2tDcDhEK2lqWHp2ZGxDa0NCanVKYmwv?=
 =?utf-8?B?SDAra21LWUVmVGhIQVJLOGhJOG5mbHV1TjNOK2xTcE81OHdSZnZYaC94RERS?=
 =?utf-8?B?T0dHRDZ1Q1RGM1NaQUhNRVRNT0ZSVVJ6R3crWDNPNzgyVytmd0hBZmloWG12?=
 =?utf-8?B?dVFFT2pZVU9QTEtPWCtWdFZqcHNBYTc2eERqU0RJL0lrdTZzc1BSZ0l5UWRt?=
 =?utf-8?B?VEh5dEFjaHAyVzJmdGZjZ1ZBQVRQaHZHZE5jc01qcGpheHVBZ2lPNWZWZXI0?=
 =?utf-8?B?SFhTcW43c3lWWUFyelphVEVML0hvd1o0S0lWYTh4cEVkdE9xZWtvVXZQTGpt?=
 =?utf-8?B?THRSVmIxMDdEYUdHMWRKbkJRNHRXZ0szRnRETVpxL2trOEZ4cTN6ZHgvMzdW?=
 =?utf-8?B?UVNhcW80QmY5WENwa2YzcXpCWW9zNjZDWVJlNHJ3WmhJak9NcjBTc1FQTnEz?=
 =?utf-8?B?RHp6cEpFTUxYRzlqN0pncUdpUk55elc0VVVTTkRiTlgwdUJzNkxTNEE3cG1r?=
 =?utf-8?B?N2pHdmpTVDIvNVZNM3d5M2twck8vdzNVQzRob3dwSmp0aVZSem9kYTVHa3E2?=
 =?utf-8?B?VGVXQmNSUW9mR3k1TnZSZ2kzT3ZoUmJlbVhaYmFQbWFWKzZSRFNJdkdsczMz?=
 =?utf-8?B?SEw2SDh3TFRDdHNxRURSVDBlcUY1dmx6aU53Z09FYjJUSzltTWRpdjlndFBy?=
 =?utf-8?B?Z01qcGw4TXgwQXhHQm00eXVNa3F3ZGtpTGJpcnRYR3dPcE5CSGdKZ080S2dF?=
 =?utf-8?B?N3RZWEhzNHZoS3dDdmFsK01IV0hxc0R2Mjh6cHlxSTdzOHJ0QkdIZ2ljWDRy?=
 =?utf-8?B?V1JzSFg4bXVRV3RGa2pBVStvWC9nV3BMOElqQ2xUaHlRZU50eDdTNVRSWE1V?=
 =?utf-8?B?bjducUVMZGJaaHFqeUhjM2d6bExodlNTNnhnVkNmVVNaNnBwcVExd2NCSDhC?=
 =?utf-8?B?SEVkb05VeDNMZFZVWnpHY0l5UUN1dkU2U1V3WDlxNDJWSHBCMWtWcURKdi9l?=
 =?utf-8?B?RjZud05BYmwvMXJPY05MQk9YelAyQVpnOGhNaHoydURTalZnZW9QVGJvNTB3?=
 =?utf-8?B?SFprdHFxa1dmN0hxc2swUjkxb04zejdaZEhWdGNZc3dsME9LVjhBbzhxUERV?=
 =?utf-8?B?RFN4UGVYR01OMnFUeFBIYkJxWFEvaTRaYThvblFKUWdFSWEwWEJXVzJZYWJF?=
 =?utf-8?B?emd0dFNaZWFoVGNZcWtjTXpyZGZ0TlkzQi9UZnVZYmo4VnFiaURTQjI5Q2wr?=
 =?utf-8?B?TjNUYkRqVExSTldDVGJtRDVMeVhjdjVYRGtCSzQrQXVNalFHTmxlei94Y1lY?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E44617202E35E64FBEFCE61C0CD370BB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5343.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084a72ce-5d5e-4d0b-4b86-08ddc5d74397
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 08:44:09.8630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yQzMfYlMr7efWhdYPqdZdRmtIQfNw0T10GvX/jnpi8+lPacuJbTIkL3vDULN4GUGXp83dW1Fuz6fETti9oghQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8290
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_014421_882120_8FDBF4C7 
X-CRM114-Status: GOOD (  10.62  )
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

T24gU2F0LCAyMDI1LTA2LTI4IGF0IDE0OjM5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiA+ICsgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gbXQ4MTg5X25hdTg4MjVf
ZHRfbWF0Y2gsDQo+ID4gKyNlbmRpZg0KPiA+ICsgICAgICAgICAgICAgLnBtID0gJnNuZF9zb2Nf
cG1fb3BzLA0KPiA+ICsgICAgIH0sDQo+ID4gKyAgICAgLnByb2JlID0gbXRrX3NvdW5kY2FyZF9j
b21tb25fcHJvYmUsDQo+ID4gK307DQo+ID4gKw0KPiA+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVy
KG10ODE4OV9uYXU4ODI1X2RyaXZlcik7DQo+ID4gKw0KPiA+ICsvKiBNb2R1bGUgaW5mb3JtYXRp
b24gKi8NCj4gPiArTU9EVUxFX0RFU0NSSVBUSU9OKCJNVDgxODkgTkFVODgyNSBBTFNBIFNvQyBt
YWNoaW5lIGRyaXZlciIpOw0KPiA+ICtNT0RVTEVfQVVUSE9SKCJEYXJyZW4gWWUgPGRhcnJlbi55
ZUBtZWRpYXRlay5jb20+Iik7DQo+ID4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gPiArTU9E
VUxFX0FMSUFTKCJtdDgxODkgbmF1ODgyNSBzb2MgY2FyZCIpOw0KPiANCj4gVGhhdCdzIG5laXRo
ZXIgbmVlZGVkIG5vciBjb3JyZWN0LiBMb29rIGhvdyBhbGlhc2VzIGFyZSBjcmVhdGVkDQo+IGZp
cnN0Lg0KDQpJIHJlZmZlcmVkIHRvIHRoZSBwcmV2aW91cyBwbGF0Zm9ybShtdDgxODgpLiBDb3Vs
ZCB5b3UgaGVscCB0byBnaXZlIGFuDQpleGFtcGxlIGFib3V0IE1PRFVMRV9BTElBUyBvciBzb21l
IGRvYyBmb3IgbWUgdG8gcmVmZmVyPyBNdWNoIHRoYW5rcyB+fg0KDQpCZXN0IFJlZ2FyZHMNCkN5
cmlsIENoYW8NCg==

