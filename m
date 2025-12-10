Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F99D3C92B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5r68ceRkuvQiKUWfY9cle14DQBCzw9yQLlCfGh2BOI=; b=FNTOJ9NvlQhrRPMuSTZCAbYao6
	ZiRDOpv67o6fPLqCyStDwnZjM/3ARRAs6Zro6lhrxh7SevMPvY6it80Sx1d/+zQbuJZAcJFTThSln
	3ndG2oOy+MlcUJTxOfcpcsEg5eQeVkmWEFBoan0QopKX1N7RXdDLfOaO4acBsll8JxY8090Sz5HkD
	SL09Q2Yqx5e6v3mFb5i1npQ30i3a2IHQgx55gUnoVlAWWwGpEIJ1scnHRZ+1GNvwvj1cXwv8hflts
	nE7pLaI/VLrZKJTYDmHJwiyqAaLIQU/Fucv7YtRTJapDUeypbyU7Fy3vJXPPCUGdZSG0mADKMiZZE
	8+S7kR4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTN2N-0000000Fdtl-0cqy;
	Wed, 10 Dec 2025 16:27:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTN2K-0000000Fdt9-25fW;
	Wed, 10 Dec 2025 16:27:33 +0000
X-UUID: 1dc5e89ad5e511f09f706fa2197c6ceb-20251210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=u5r68ceRkuvQiKUWfY9cle14DQBCzw9yQLlCfGh2BOI=;
	b=UD9t+oea7v/qeAyATuRLZIBqHaMAP+4zWB9nM1aji4Tyviq6jzjyAIJNT+wq+tstC2Iwi0Dr8N/W1sswSIP3CR5bfnoeffNleK2xDoOYhrPMc3X+4XA78D11LKGMdNk3PcYcE1m7UC7a2NYRKMCb09W3Lzl8+6IwGgLxHTWoEE8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c59c0fd8-6487-4154-9aab-b65614008871,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:97bf9f02-1fa9-44eb-b231-4afc61466396,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1dc5e89ad5e511f09f706fa2197c6ceb-20251210
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1616636626; Wed, 10 Dec 2025 09:27:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 11 Dec 2025 00:27:24 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Thu, 11 Dec 2025 00:27:23 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzKUmfKU7uQawqSABh56yq4ajpOj3pNLlP5Q/Md+U1gSpvnWtfxmVYXkTotqpsP/f+9jisHlRq+FCtyx+gU/hpFozHM/0QPS9OqhC6Osv1QE9kyyNY7E7BEkzpCPaeKol7zPFpLq7H3pR3Pkk7BbdYxe+iNv4GammIbrnsWEqBE2EYx8jfGv/R4f//8JmDc+K6z9TSipVaJPsmf31q7AMs28vpBoJAiVJEycPiHm7Y3V7tDlRbBgrpqpPCU+qzXp+ZVRDTLerPwvf30q7RmVcw/p1nY7OHrhnazJucNUVcDY18S7QwQyS0SzFWztnrKv8+QDTnveEOAx8c7H26PMwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5r68ceRkuvQiKUWfY9cle14DQBCzw9yQLlCfGh2BOI=;
 b=Jx6o5rT1GZA/FIfh2DXkSBXMJ9zdcS59eqXHYOqRUtMthVf9sUpV3rdjcgzGVO80O5fX0QH6e5Vev0yxIzHwaBVdogdfDxv3e+FEczND7+XvXF/T6aFccfIJ9wsVV6lK3eEJuqlsjoR2CnkWp2idCLRuQO0FosoA1lCvzD0KiBcu3UOSqx781zZNrLPyusGwJXcWECdIibEf/JYhuuDjfuls9HiSKs2whys9HzQvA8s2qUT8ss1QG4aUoAA58AGZNRONAbpEY4oCZg9JRngeNg3sHh60IsU7iXVsmPs/pfH9M5txf9FwWD+Ycw/CYV2fEES5E4HR/NBV0kWTUuqMfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u5r68ceRkuvQiKUWfY9cle14DQBCzw9yQLlCfGh2BOI=;
 b=FSG1kxW7jFuvTV3Qdo2odwAyVFENHSTF3mgNYT2MQPBCP3w73Ly3LCLClTC6ofGLZAiiGSVjcRthkiUYxSnYFVHbSGuDxdLxe6YLx/NwKTRokgqhH76FJ8e2kr5x7lwTvsnmYkvRlygXpWn5UpSMCtxF6MlMCdEpjXZwbkMb85A=
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com (2603:1096:101:184::13)
 by TYUPR03MB7230.apcprd03.prod.outlook.com (2603:1096:400:356::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 16:27:20 +0000
Received: from SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8]) by SEZPR03MB7810.apcprd03.prod.outlook.com
 ([fe80::2557:de4d:a3c7:41e8%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 16:27:07 +0000
From: =?utf-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, Louis-Alexis Eyraud
	<louisalexis.eyraud@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
	"kernel@collabora.com" <kernel@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?=
	<bear.wang@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8371AV/AZA
 Genio 520
Thread-Topic: [PATCH] soc: mediatek: mtk-socinfo: Add entry for MT8371AV/AZA
 Genio 520
Thread-Index: AQHcaO8Etr4CqnFvvUeA+7rh9XlJ07UbEciA
Date: Wed, 10 Dec 2025 16:27:07 +0000
Message-ID: <7cff00aab8c4c9b3cc5f5cebf54eca793fb26bd1.camel@mediatek.com>
References: <20251209-mtk-socinfo-mt8371-v1-1-155a9df851d0@collabora.com>
In-Reply-To: <20251209-mtk-socinfo-mt8371-v1-1-155a9df851d0@collabora.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7810:EE_|TYUPR03MB7230:EE_
x-ms-office365-filtering-correlation-id: bed40370-b3a2-4a05-acbe-08de3808f668
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WnRIL1R3a2ZvZ0llNU1MeE1aK0JhMVQ2Z0NRU2o2bjMza0dPRG1lMmh3eFZZ?=
 =?utf-8?B?VDVENTg5TlYxMERva1VrdkM5N082VFdONzh1NkR5aFFUZnVzdyswcUcxQXF1?=
 =?utf-8?B?U0xUWUhNT0RnU2Q0KzdOUU5KOHpDdjY0MmJpRkorLzRDVjlQZmxJYkx2WG5k?=
 =?utf-8?B?em5ZSnlOYXpHMEVra2dwRmNYM3RHemk1b0ZYbGlobDdJc3dtZSttTEtiazMv?=
 =?utf-8?B?dXB0MmV3WTM2QnVaM0lWUnNsOFVlVklPOHBhZnpNNmcvanZxcHJFUmdiSkQv?=
 =?utf-8?B?cnAzMHBwd0QyMWpWTmV2V25yNFRycXdnWjlZV3BwWFR5VnQ5T2oyZUcxeUto?=
 =?utf-8?B?Z2hvK3RwNEJPMm5vbHRQZS9ucjJFeCtXRm1jTnpMUFFJOFdzOWh6NHFSTlJ0?=
 =?utf-8?B?SWxWN0ZIMStueFk4MnVDTmZRRWc4MVRzblp0VGtWZkE5bng1MVFxRmwyYi82?=
 =?utf-8?B?dlpQNW5lZ2hYb0Zjbkg1aUNCQ0xMWnVDMytOT0cva2l2djdXWDVnQUpTamhw?=
 =?utf-8?B?SW5nR3I2WTFlelRYVnprUlJkeTVHZmNBLzN3OU8zTVhGb1JyalNJenBWM0ZL?=
 =?utf-8?B?V0pSaUZKM3Rya2dJWjdZa0V5WTBwemhndlBQVjV6ZzZlbk95c0NKV0tqNFY4?=
 =?utf-8?B?eUwwWlNWZFIvTHo5dTc1dWd5cHN2M1FEQ2RqSG9hYU9nZGRBYVFKcjZKdWJF?=
 =?utf-8?B?ZVZjMnVERGJxVTBuZ1VDMXNrS2JrNXEvUTZmeVpsT2poa3l1QUdlemF6Wjl2?=
 =?utf-8?B?b1NKMEd6bHBodmxhcFN1TEdQbVBESTN4VmVXWVkrMmRzU0cxS0NRc0hLejFN?=
 =?utf-8?B?OHlSdVV2UlMvekk3SG83aWJPOUNsYkZwM0hkaTVqSElBQmNLUjkwdWpYcDNa?=
 =?utf-8?B?TEpMV0gwUWFWVkgzL3JKVVdQdnBKMVFyVFhOS0xTMC9aQ0F6aUhwOFpnZExL?=
 =?utf-8?B?WEhHWVpzclNYaXlxNU5VeEQ3TzVueVl0OGl2bTV5L09rRllaSlBkK1kzQzVN?=
 =?utf-8?B?SFgzOXQxYWxjbE91aUVlaWl2NTZsSjNqazEydmdwMmgvSk1sY1ZkcFRkWjJG?=
 =?utf-8?B?YUpkWU1lNlRwemVFVDcrbXlSTkZMSTEyVHJNSHVLVmJOUmVDUCtVQ3h2QWRz?=
 =?utf-8?B?aTkvOXZseU9mZDJlM2VLeHlYaWJSeWV5ZzArektYSnBHM0VxazlnZVl6bUxR?=
 =?utf-8?B?NWRYYVJqWTZJV1hJQlptL3plR2N1K3lnNjJBZDdpcWlYM0ZpME5nWlNsWVFp?=
 =?utf-8?B?TnZEdEF5c0tCNlBBWXY5YlN4ZC8zcnJnMTFCaFdFdEwveHg3U1Evc0lIQUl6?=
 =?utf-8?B?ZlUydllrd3hUYmI1eEpjMWxvZzVSdWFPN0lNNHYyVjNjVGthQVZJTXFMQWpi?=
 =?utf-8?B?SEdhS3k4REpyTEplVGhidVBaSUZ3Vm9jT0RzRHQ4UFd0aW1YT0ZIZGFZWDhl?=
 =?utf-8?B?OUEwOWdBU1V2ZXJBS2xCaFFpOUU0RktpV1BhaVQ3WkpUSmVBaXhJalpVMnVp?=
 =?utf-8?B?ZzJJREZ4bjJCZlJ6SjNXWE9WSS9LcTJwRWI2SmQvMzFJNFN2VjVoVWM3OHMz?=
 =?utf-8?B?ZmJiMnFHNEh0dS9ueTFTLzBhNnMrUitMNWJKOEdBSG5IdHI2Mjh2OWcwQVlJ?=
 =?utf-8?B?Y0Nlc2tjbTNWZ3ZMOUVFMWkxU3ZYeW9qYlhydTVZanRVZm5oMEhkWmpkUTB1?=
 =?utf-8?B?VTJvSTVoUktrQ2JiNjI2SVNRRzdmQUxlTFJLOWpBL1JzYXorMkRub3FpTFhj?=
 =?utf-8?B?U2Z2UVVxSGFXZThCWmk5OFBpRFJGMXplN2FlMzNCTmZGK0RNR3JCRlc2Zy9I?=
 =?utf-8?B?b2FxTExta1JyZFREZFk4OGQ4VFovWE5ZNVVRUjd3YnVjdTQzTjJ3ZlFmZzli?=
 =?utf-8?B?Wi9KVkF2aExoYU43c1g5VXp5ZWRzSjYrdmY1cE1SRXpvWElsYnF4QW90aDRU?=
 =?utf-8?B?ZUJ1eWlYWEt4VFNSdFZTQjVCZ2xlRFVtRlE5U0lpYkZRVVpkTVRYRmNOREQy?=
 =?utf-8?B?OUNDaHRXT0dXMlg4VHJ6UlRFZ2RlUyszRFVWM0tyQmtURVVYUitPTDFwQkF5?=
 =?utf-8?Q?JX5tYq?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7810.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VHltNFI1dURPZkd5eEM4ZURvbGRQQ2pybk1Nb3N1ZU0raWZ3L2pIY2lrbnVP?=
 =?utf-8?B?SzYvR0RZcW1yMU1ndHNCanVWUWh0Y0FCb2VqelRrREFRWGRpRGdKVHI5RG5u?=
 =?utf-8?B?ZlNuVmdsaUxWZFg4ZUlEQldDWlh4N1NKalJyL0w0SE81ZnNGTmNwSFhyQnd5?=
 =?utf-8?B?TTJwTHlqTms4MnBiWmt6K3B0bDBlemdsSFB1OTVqUWxjRHJsZ1B6V3d0Lzlu?=
 =?utf-8?B?S3NwNkJ4Y2tta0tYS3NCUnE3Sy9Hb0JRK1N6Q1d6bWhhQ0s2SHlXK3R0OVdB?=
 =?utf-8?B?ZDFLenJLdWQvOHNaYVZmZkVNTWQzajM4bGZoTERONlZNd3BOVXAyTlVFemtE?=
 =?utf-8?B?VGJ1YzdOTkpTT2RweUdYR2EzNExqbU8xU2V4L2d2RnE2R2ttL0tETlF3L2Q1?=
 =?utf-8?B?YWtlZ0dzNldHdlFCNTVCVFo5aFhRV1ZZRXJuUS9OT0lPaWcyTzcyU1FNdld3?=
 =?utf-8?B?VjB3VldrVERqemxUQmxxRVh2UUM0NVJQL2l1U2VtYXpOSWRSbU1mS3UzT2dW?=
 =?utf-8?B?d3lvN3l5NU1JZFlMR1NndGtZdXl6d1g4TUhiMFdsLzcvTGR1bFZtTFNZOVV0?=
 =?utf-8?B?U2VpYmhWUDBiakFMTElkcDFSdThPMTRnODBoNHFld1creGtiY3l2MzJLQStE?=
 =?utf-8?B?cVNBcUhMdEwyLzMzc3lodlQ4MDM4ekc5QnF4UEZWRmh3dmtFRjM4dzVJZHFS?=
 =?utf-8?B?MUxCdU5SVmhaeFZDaFY4R1A2cDBJWW5QaE4vZ20xR2xEb2JQY2NzZ2xobDho?=
 =?utf-8?B?dk9od3Q5MlprdVpDOFZ3V25KWkk2K3JtYm1JYnV2ZzJrL0FFTkZPZHBYaHBZ?=
 =?utf-8?B?cEdwTHlnRmNiRXNRMG9sdEpMTFYwbGxTU1ZwSjJLMkZhbi9yV1Vrd1lrVWJx?=
 =?utf-8?B?YS9CZ3RjZ2NsV2tDUnN0T095dkp4OGNhWFlhRGdUaGlrZENGUE13cmhpNzZG?=
 =?utf-8?B?Mkt5STNFRVJzWENzRVBLSUdqZm5XRDRBOXh6ZVdUOFdqR3hjUFNpZ2M1WUpC?=
 =?utf-8?B?SWZjZUUwVUxDbWVqSWFsbGU0SFNwa1M1MDdEaHFPejJISGlqU25JRkU0LzNu?=
 =?utf-8?B?UHJVaXZldUpwb0tuVWdMY2dsU3dXa1V2bzFYUEpDWmt3b0ZoRllUOUM5WjVG?=
 =?utf-8?B?dUNTeDBsU21CUTJ2WjIyL2Qxc01oaXBxNlc4VUpvM0d6SkU1aG5ZMUNITVB4?=
 =?utf-8?B?SGRtc0xXcm9kSTdoUjJpWXRhVXhlSTUxSmhPRHQ4V2NEcXg1SzRHQ3hNd0xM?=
 =?utf-8?B?ankvVkc4WFFRUEFVN1lyM1kzeGt2MHNvSUpxZ3FPeTRSNi9sbFNaU25HZ3h4?=
 =?utf-8?B?eW1SQlJzaGowUG9SS2dBYjhkOExrZmZrczJzb1dxblpDY1ZjKzFWVTVFaEZW?=
 =?utf-8?B?MU1iNExReEV2ckZUb0xNMHpDQjE4QldDWWlQcE93dnpMcGg2MjhVUWpORmZN?=
 =?utf-8?B?RjlzNUVlSTRPMGRic3RFYXpNajl2QVJBK25mYjdqeW1SZ0xPZ0FnbmdVYThC?=
 =?utf-8?B?RDFvTlVPTVM2NU05cTlhbUpHU3BUdTV2TEYvOVFHWmpVRVhXZ2x1eENPamsv?=
 =?utf-8?B?RlpLUVVzVU9kWWgvZGpLWWNnTlNkY09MSFFVTVNDNTlaNGNPSWh3NUt0eVl4?=
 =?utf-8?B?VitKZzJtNUM1YkJQY3JiTXRLUzk4RVlQamtMV0dYRjR3ejNkYUs5eXdWdzNU?=
 =?utf-8?B?Q082elBmQjUyQUFYVW1yMkhsTEhFSEVvNTZtREUrS0VvVWFRWkRwdjUxdDh6?=
 =?utf-8?B?M0ZzNFE1Nnd5K0t0WnR5bzJtUEtRWDYrYldFaEF0N2w0dFlYNWZWZ1ZyYnQ2?=
 =?utf-8?B?ZlV4MXhreFBSZENHYnBKWmVESGpiK1VVbWNqWnhodHdZSTBFNE96ZDVnS0NC?=
 =?utf-8?B?VFBwMmZVRXh4UjVSV2ZweEdua3Jock1kbDF1Q3RWSy9tdDFrY1Z0WDExM29T?=
 =?utf-8?B?TU1QemZHSGNWTlhsSGhvOTBPYzlyK2NKOHZmVHNmYUJFMUt1M0xXZUNEZGg3?=
 =?utf-8?B?aVpmUDV3KzB3QzZMR2NkRTRWYmx0OVQzL3dJVDRsandkREMySTgzbGdObmVE?=
 =?utf-8?B?T1h4MmFXUVVyUElDb2VXTzA3SHdCTVZsZ0NvTnRJczNKbU80VkMwSldkZWNu?=
 =?utf-8?B?bWdic2ZRQ2llRmFUeWtrTHJ0QWpiSG43eTNkSWswSGVWSU1WemRRRy8rQVFz?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <879F1DDEB98EDE4282895B993DB21F79@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7810.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bed40370-b3a2-4a05-acbe-08de3808f668
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 16:27:07.8005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SNIhqwejlYHg4xE3DQfMe09bWe+B0r5hn9O0swY48DKB3ToxAKbm0KnbDTDAXWEPOMwLdKATfGJAto229Th1bhq0zfUyb5cpOZ4HAgnDoP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR03MB7230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_082732_566796_E8FFA0CF 
X-CRM114-Status: GOOD (  16.16  )
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

T24gVHVlLCAyMDI1LTEyLTA5IGF0IDEwOjMzICswMTAwLCBMb3Vpcy1BbGV4aXMgRXlyYXVkIHdy
b3RlOg0KPiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBv
ciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBBZGQgYW4gZW50cnkgZm9yIHRoZSBNVDgzNzEgU29D
IHdpdGggY29tbWVyY2lhbCBuYW1lIEdlbmlvIDUyMC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IExv
dWlzLUFsZXhpcyBFeXJhdWQgPGxvdWlzYWxleGlzLmV5cmF1ZEBjb2xsYWJvcmEuY29tPg0KPiAt
LS0NCj4gwqBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstc29jaW5mby5jIHwgMSArDQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
b2MvbWVkaWF0ZWsvbXRrLXNvY2luZm8uYw0KPiBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1z
b2NpbmZvLmMNCj4gaW5kZXgNCj4gOTc4YzQzZTkxMTVhYjI5YjIwNzAzNjIxYzYwZjFiOGVmNGQ2
Zjg1MS4uNDI0YTFlYjgyYzIwZmE1MjI2YmQ3MGVjMDE0DQo+IDVmNDM3NTYwYjQwY2YgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1zb2NpbmZvLmMNCj4gKysrIGIvZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLXNvY2luZm8uYw0KPiBAQCAtNTksNiArNTksNyBAQCBzdGF0
aWMgc3RydWN0IHNvY2luZm9fZGF0YSBzb2NpbmZvX2RhdGFfdGFibGVbXSA9IHsNCj4gwqDCoMKg
wqDCoMKgwqAgTVRLX1NPQ0lORk9fRU5UUlkoIk1UODE5NSIsICJNVDgxOTVUVi9FWkEiLCAiS29t
cGFuaW8gMTM4MCIsDQo+IDB4ODE5NTA0MDAsIENFTExfTk9UX1VTRUQpLA0KPiDCoMKgwqDCoMKg
wqDCoCBNVEtfU09DSU5GT19FTlRSWSgiTVQ4MTk1IiwgIk1UODE5NVRWL0VIWkEiLCAiS29tcGFu
aW8gMTM4MCIsDQo+IDB4ODE5NTA0MDQsIENFTExfTk9UX1VTRUQpLA0KPiDCoMKgwqDCoMKgwqDC
oCBNVEtfU09DSU5GT19FTlRSWSgiTVQ4MzcwIiwgIk1UODM3MEFWL0FaQSIsICJHZW5pbyA1MTAi
LA0KPiAweDgzNzAwMDAwLCAweDAwMDAwMDgxKSwNCj4gK8KgwqDCoMKgwqDCoCBNVEtfU09DSU5G
T19FTlRSWSgiTVQ4MzcxIiwgIk1UODM3MUFWL0FaQSIsICJHZW5pbyA1MjAiLA0KPiAweDgzNzEw
MDAwLCAweDAwMDAwMDgxKSwNCj4gwqDCoMKgwqDCoMKgwqAgTVRLX1NPQ0lORk9fRU5UUlkoIk1U
ODM5MCIsICJNVDgzOTBBVi9BWkEiLCAiR2VuaW8gNzAwIiwNCj4gMHg4MzkwMDAwMCwgMHgwMDAw
MDA4MCksDQo+IMKgwqDCoMKgwqDCoMKgIE1US19TT0NJTkZPX0VOVFJZKCJNVDgzOTEiLCAiTVQ4
MzkxQVYvQVpBIiwgIkdlbmlvIDcyMCIsDQo+IDB4ODM5MTAwMDAsIDB4MDAwMDAwODApLA0KPiDC
oMKgwqDCoMKgwqDCoCBNVEtfU09DSU5GT19FTlRSWSgiTVQ4Mzk1IiwgIk1UODM5NUFWL1pBIiwg
IkdlbmlvIDEyMDAiLA0KPiAweDgzOTUwMTAwLCBDRUxMX05PVF9VU0VEKSwNCj4gDQo+IC0tLQ0K
PiBiYXNlLWNvbW1pdDogOGViZmQ1MjkwYzYxNjJkNjVmODNmOWE4YWNkYmJmMjQzYjQ5YTU4Ng0K
PiBjaGFuZ2UtaWQ6IDIwMjUxMjA5LW10ay1zb2NpbmZvLW10ODM3MS1lZjllZjIwZTY2ZTUNCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gTG91aXMtQWxleGlzIEV5cmF1ZCA8bG91aXNhbGV4
aXMuZXlyYXVkQGNvbGxhYm9yYS5jb20+DQo+IA0KPiANCg0KUmV2aWV3ZWQtYnk6IE1hY3BhdWwg
TGluIDxtYWNwYXVsLmxpbkBtZWRpYXRlay5jb20+DQoNCkJlc3QgcmVnYXJkcywNCk1hY3BhdWwg
TGluDQo=

