Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C929CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 01:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJnovYm3hxynsAt0nqLyi6TIkbwbCDQgJYPlkQKn9DE=; b=crc7YBeUemdUuO3zbR/ls3VwqJ
	fPVIXSK+1gSsvpMFgbJg7+Q84SbMRbF7Voh8keJpsceVybiAsfnED1VN/vUWAl2WPqcsuqwrB5zPP
	q/0FyNoOCJCBbynXt9P7Z7eUOtf/M7Q/e5eXnLePzs9uBwJyFMvlEUn2U0FUNqfszaVEGsARgag3J
	4V06uWuQi2DvkVWcwwwLgVPHZiS5gZOxdGmTyFH13Jsjs2MKxnJYH7IBMpyVnxlG5A1fpWrqwymhA
	S4XsvlKt64PSiOKujfB59LDwPdx00fiDykCeJdwuwFtDdQ70S3dv1b145OelIiCYPDqEuT+UdDk0B
	tk7etc3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un64I-00000003t3E-3jEi;
	Sat, 16 Aug 2025 01:50:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un61f-00000003stF-3e5b;
	Sat, 16 Aug 2025 01:48:09 +0000
X-UUID: 0a5096aa7a4311f09f706fa2197c6ceb-20250815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=iJnovYm3hxynsAt0nqLyi6TIkbwbCDQgJYPlkQKn9DE=;
	b=UX0gcuYUfsUX+NExI4mZi1icFdXcCfgNzJl8s+qzX/3jIDbUE9lDvLh6teBp5r/6SAJ7Nh1rWQEC5JlF6qK5UXIZDTkvZpJKNQ6a8esML/7zpj4fYC68xaBdMlKjUUaWI1iqGO01dk6EHds58jVBQ8JhwYvyqmJ0BFtFehP9uJQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:0aa52db0-2753-460d-ba4c-80a8d5ae0a56,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:53b28744-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0a5096aa7a4311f09f706fa2197c6ceb-20250815
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 834220485; Fri, 15 Aug 2025 18:48:00 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Sat, 16 Aug 2025 09:47:57 +0800
Received: from TYPPR03CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Sat, 16 Aug 2025 09:47:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQ37QU5KjfXr+iNvpNlCdCH5d/ZDvGtTJchRncHrdd4GO40L/z2em0IOHcskz44UIfuNcJeABQf/qDz52kxbNe2aqF1n9PusrhIVnmEOzrzB6KoXU+Selca+13/ucrMFvLtlzQhFgEZT7Q8sRqX5e8bGTfcTjTTbmwIFNtnQGNNxw3Wx8ipac0a7RUVWqr4ZOSj2f5yHwGE7uhS974WNbeQWnii7dDRzc7Nzoy9bReYuQkrZJMIUev750Bp3y+vy90A8qx81KqbmHWyCQvnxKd39q+bjuOCm5qB9v0Gb9tVFYo7WNj2rnaPlowbJGNEjPcBRCl1VLwAWYelaCG7y0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJnovYm3hxynsAt0nqLyi6TIkbwbCDQgJYPlkQKn9DE=;
 b=Ztljsf7HGSqk52TmbaROlSfJsHYQDUSaZGC8OP6pZlJWDY6lCp//fR81LcD7cgbw0rOw88pYou3CZrooH8eqAqLBxixvbJkcGgu4uFANURwMTWEA6szWJUnQrFW88G90A5ri9DjFSn8x/Bj+l3h3rd53kXYQvAU6C7JLAEt1xDs1FGJW7k1WXGQ9mcL1Lmm61W0vJ+ZPqrAX9sHdVtqGdTPS0AMCRXVvYt5E6SQlKC9FCq7hWlwayUlgTgXjk7p8fWF/TrOuSU72zkqNz7kRqew6Lq3DqV60EClEmedbCO14PPRGakF5Nmz8MTlqI/X9H0p88GvhwpTa4UNKmazKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJnovYm3hxynsAt0nqLyi6TIkbwbCDQgJYPlkQKn9DE=;
 b=LfbEP6OOQb+Q8uarNa1u7MUjWuRtxSWvvjQNddetf2pTsIlGfgHyIn7d+c6O3YjRNlLPLTIbkT0Lg41bHteyYlQHqGRdRQMD/YLXJTqwEleLerYMqfzNgCkOs4bdrqXxp1AVggGnHLM2J+Ube/gfYE3CbAIBje9UT0Ua0KUMBqw=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TY2PPFF343E9D84.apcprd03.prod.outlook.com (2603:1096:408::9f1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Sat, 16 Aug
 2025 01:47:54 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9031.014; Sat, 16 Aug 2025
 01:47:54 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>, "nhebert@chromium.org"
	<nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?=
	<Kyrie.Wu@mediatek.com>, =?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?=
	<Yunfei.Dong@mediatek.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "sebastian.fricke@collabora.com"
	<sebastian.fricke@collabora.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "christophe.jaillet@wanadoo.fr"
	<christophe.jaillet@wanadoo.fr>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Thread-Topic: [PATCH v2 1/8] dt-bindings: media: mediatek: decoder: Add MT8189
 mediatek,vcodec-decoder
Thread-Index: AQHcCm/jJn2k0UklsE+hGxUHFnTQprRdGRUAgAdxmQA=
Date: Sat, 16 Aug 2025 01:47:54 +0000
Message-ID: <9ffc68415c3b8323610ea2b17410e568cb1f21d8.camel@mediatek.com>
References: <20250811032616.1385-1-kyrie.wu@mediatek.com>
	 <20250811032616.1385-2-kyrie.wu@mediatek.com>
	 <20250811-archetypal-olive-doberman-ff0a31@kuoka>
In-Reply-To: <20250811-archetypal-olive-doberman-ff0a31@kuoka>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TY2PPFF343E9D84:EE_
x-ms-office365-filtering-correlation-id: fd2073b6-51d3-4d3f-8f43-08dddc66eae6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?d002U05NNEx0Q2tnL1l5bFNiZkFQemRZRTZvQ3FuM3FNZmgvZGxsdlNZZTBI?=
 =?utf-8?B?NUJmamJWYXFQc0wyVUwxN1h1c3U1NVEvb2E4S2NuV0hzOVg3c1V3MzJLMnNM?=
 =?utf-8?B?K20rdG5TZzRJUER0alJuVHBZV0U0bUFBbFdVNmhJdGVIYzdpQkdKRExVamt2?=
 =?utf-8?B?UmtIaDRIYVVnNFB2THdrOVNnc1IzSjc5eVVpd1hZVnFoUGg0TXp6YWFqZzYw?=
 =?utf-8?B?eE5sTFRaaFJoSjZycHEvWldKd0lHcHVGVEhTbGJPS0psUWpGRUlDWHNNWkhM?=
 =?utf-8?B?VStzQUlrU2daT2xWMkU5Z0toNER6MFVETXR0d2I1MnJGTmlwNHNENGlRdFg4?=
 =?utf-8?B?WGExWTczRVpzSFRUNCs4UUIwb2E2blRQZnNxeVdYOTBTN2tSQWQxcnBBUnZV?=
 =?utf-8?B?SDN5cUQ4WERiL1BHT0Z0R1J2bmc4aFVQcG9RbG5wRnhGV2RkQWN1VktIZW9s?=
 =?utf-8?B?QVk2RmF1UDNTQ3BmME5WamdLeDB6blIzZzhNdm14ZisvWml3SjBDMHlJZ2ZN?=
 =?utf-8?B?aW1DeDJxUmhpV05jZnJoNjY0TGJ2UEtoNkRqOGxkeVdoUStSSkNkaStqVlpN?=
 =?utf-8?B?TFJpaDQ2TU8yZzgydERWb21iTTlqa1Z6dXpwSW1BYjZVbHJSK3VPREpUS28w?=
 =?utf-8?B?aWhSUzJtdFc2S2lPMUtkZmIxRkp3bk56OEkzUUtoMUJLWExUa2I4MEg2SG9w?=
 =?utf-8?B?K01mM1VsNUZsSmV5YjZxQVhHeDU3M3YvRjRQdWt1M3RGcEFKQW40SU5CMDYv?=
 =?utf-8?B?cGhabHZoM3lVUysvVnc4cEY5RW1OV050ZE9VV0JreWtiTmRnQUdGTGZnZmdm?=
 =?utf-8?B?Q0VNdXN0ajhnZUZkS3Q3V1VDc0dGTXcyQXBjZFFMbUFUU0dKalQxczRyMStP?=
 =?utf-8?B?MjV2WnRUU21sMWNSc2JEY0VGQ05sdVhtL1h3a0dFTit2ZjdRcmNYMUcxbkds?=
 =?utf-8?B?VGtPNEY3cDVkTUxJSVYzclhaMldHT0UvbG1IRmxmRER0MDhhNWZ5UnZJb2ZH?=
 =?utf-8?B?cmRaTGRHdkpwTEdXNGFJN29nZzdEbWtNRUtkWko4eHlCNnE4YjY1T0pLMjZq?=
 =?utf-8?B?WXQzeFppVTBQUTVkdGhoSmN4QjdPUDBkVzIrbTNCQyt2MWhoNkRaRWg2MTFm?=
 =?utf-8?B?akRXNFVZRlZlREdmbzVSK2hMYVJTcEFLNkhnOHIydGk5M0ZGbC92RUl2ZCtZ?=
 =?utf-8?B?dUpLTFFwL0JneHUzVU80d1dnSmpYM1Y0Y1dVTlpobnBUcXQ0aWxSR1hRVHho?=
 =?utf-8?B?TVVCZXZhaW10MzN1UEtJbHBOQ21ZQTJESlhLNXBOSCt1NGJRSzQvT251QTNC?=
 =?utf-8?B?N2c4R1lNQ3l2RGFWOGZEcHZFaUR2am9nak0xWnVsckNoZzZySW1UeVNNSzlG?=
 =?utf-8?B?alVJTjBLYXFseDBybDkybm5ZZDA1RkNvU1MyVzY3aHlyK0MyYU5sSWxkeHA2?=
 =?utf-8?B?TzlIckkzTEdMREx3ME4vYnl1QlJyZFhGQ2ZldHNhaDFMNURCUXRYZVJKNk96?=
 =?utf-8?B?dlZCOGRRL1Fla1VhdWNzZnRVUEpTQk9tSDVvdVRxdDhucHlJbnB5UndySld3?=
 =?utf-8?B?bjlDZWNrd3kxWDFmTEdqbVhuZ0NqYlo1Zk5BTDNPOFpFODFYaHo5aml0aDBT?=
 =?utf-8?B?YXFLcWo4SEw4eER0VnEvSUVpWnFzSHhtQzZvaU5iZytSV2JJRGdlUG4vQ2lX?=
 =?utf-8?B?aUJveXhmNlR5QW9jVTd3Z2ZCdXpSRCtXRzk1bzU0aDllcGZnYUI2c1dRemNz?=
 =?utf-8?B?UFFoVXNoRG1YNXU2VG5xR3dTS09kblZURC9GemNROUErNDh6UGxGb05SODUx?=
 =?utf-8?B?TDhQcDRUZHhmSklGV0N6NGQyVW1yL0wzMVZFT2RmcHdoUlhSQ0prZ2JtUUt0?=
 =?utf-8?B?NnZKTDZHdnQ4YXZzV3V2UFhpUTM5OEVoRis1WU12SjRSeHJyVWUzN2ZWSkV5?=
 =?utf-8?B?NEhwVDhWY2hvenRubU5wTFJjbGV0dEJyUlZtNUlDT3FoREtoMTJ6ak9TZmkw?=
 =?utf-8?B?aE80c1JPSDVnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U1pIZXVqUm5BK3I0S0NhUDFjN3NNSFlrVit4YXEwbEMzS29SZXVIbzEycVA1?=
 =?utf-8?B?RHRWbWt5VDMvSEhibUFGdWRSQnhsSEc4dy92R2tha2VVeW4xajJXcTQweURV?=
 =?utf-8?B?dStBMk9STFR0U0VxZHlRS2dHQ00zNFJ2SjR1WnJKdVNPQnV6TXNOSGQ1YzJh?=
 =?utf-8?B?NnZaNXlDUkxmY29hOEFvc3RIejdvYTcxemFZdzAxeDNxNWJmVVZveFcyMlZ3?=
 =?utf-8?B?SlFiQVl6M2lFeHhJdEp3MUVmYVRDYmprbFpoYjFJSjNvTVdnRCtvL3AyeWNy?=
 =?utf-8?B?d3cxK2VxaGxCbGp3NjZ3SkZ0UTJ5SUx2LzhXc0lEOUJ4am90emFqTkVPUnhy?=
 =?utf-8?B?VWlURzNDalR3SFdiUVNKdHByUG9lY3k4WWZLN2QrSUxXOXVhRkh0dHdVaUVZ?=
 =?utf-8?B?bTYzeGhGNXo4WWxiWE1QTW5zS3ZLczV6ODN4d3l5UXp4L1NSZEVscjNWcHFh?=
 =?utf-8?B?aklkWXdXNkdtM1VteGpXalZ0OXI1VnA0bnNySVNUZXhWa1ZIcW05aHJLNVdU?=
 =?utf-8?B?eXRHUVB1bVRZb3lqaGppWXR5MFJvZWZTVXl1ZEdpL2M0TmoxNDNsUG1tMDJ0?=
 =?utf-8?B?NzFha054cDdRb0VsSUxKdytNYjdQMnczTS9QUnRaOWdQUjVYQ3cvNENxN2hO?=
 =?utf-8?B?ZWsrMzk1eElqRHlWaXp0eG45bjZqZllobUZ4RnR1RXE2R2dLSk1DUTdlczVs?=
 =?utf-8?B?WkhoQzd4ZFYrMllrbXU2YjlSTDNvcDRLVDdVRGFmWEVMR0lzTzVNNEo5NFdN?=
 =?utf-8?B?cFFMRkFiWHpDMnI2Y1lJS1lWd3hQQmZwWU5rMytMeTFkTlpLYTBRWWRmYnNi?=
 =?utf-8?B?ZkhwZytaWjJkK1YwMFp0REFNQldMN096dmQxU3V5ZU1pejBMbWZuOVE5eTFt?=
 =?utf-8?B?d1p2Ti9YckxuRjNmSk1qTFZ3ampNTUdwTDVuTVl5SzJmNWJlMmlZUko2MEkw?=
 =?utf-8?B?Zy9VdGJJQi9QQUFoZTRmZWphNHJBaWluSjR1ZU9CbTdtNm5qSGhTOENTSzVH?=
 =?utf-8?B?TFM3bzk4dWprSEpUSHJ2RjcyaHFXajMxZTRDeTloaVU2SUpsYWxKaVcwZVFT?=
 =?utf-8?B?dkIxZThRNk1VUVJaYm13YjU0MVp6ZW84TzU3dWU0T0lWcTN3cEtjeXlySjdn?=
 =?utf-8?B?MVlvTzE0Yy9ETG9NMk4xdGl6UGdKUCt6TmtHYmtDS1ZFc0JEUFhiL0UvUk9O?=
 =?utf-8?B?S2ZkWldHckFwWkpaNU1ORFBtOGkzREFYOXFnaitFRGFzalNrNElEbHdRQ093?=
 =?utf-8?B?dnpKU0dHQ2xvRnozSXU2VU1ITlpPVjBoY1RYaEN1ZzBodlVmdDdUeTVQbHRJ?=
 =?utf-8?B?c2k0czBxMnpBbUw4cmI0N0pOTzRabEIxeHM1YisxNWlIWnVLZ05LN3lkR0xn?=
 =?utf-8?B?akdCTlhaWHdrZG1HdDRhWXBRUmp6ckZVU3dpQzg3ZnJkN255MjB3Z2taeGdX?=
 =?utf-8?B?cFNGVXl2VmRKWjRSQXd0blc0Yi8xbEEzdHA0TEo5ZFB4Rm9mMEY3bkZiMkk1?=
 =?utf-8?B?ZVpyRnIvOXg0YWFwN2ZkcVI2R2pXMWZpcGJFc2Zrb3F3emVXV05OclpqSm5J?=
 =?utf-8?B?S2FlTFI3cXczMURZdWI3Z3FXR2lFWXIyMnNvOXdZVENRUjNCOWlkY3RDaCtq?=
 =?utf-8?B?WG42SFJpdDh0Y0lLa1JRWUFaZ0ozdnZXZVN3MjlqVTQ3TGdtY1Rya2h2TXNr?=
 =?utf-8?B?S2pvYzcwWHZqYnZ6SE95RlJtOWFpbkIvVjV1TWZhNmpmSTcxb0tLQWtNQnVp?=
 =?utf-8?B?Q0o3OXExdjdxN1hhRG5XOGRUSVlzQkhMRjlaRjZlQ0lZeXRtUUczdDhybVI3?=
 =?utf-8?B?SGFhQWJPUmVjd3BXYXk4MTRodDVQL1gyaHl6bDN4MGV5dEZ6a1dGQzI2TTdu?=
 =?utf-8?B?UFVrUUVQdGF1aEZ5aXpNOFByZ0duNTkxUVFuMjRkZURKdWdhQjN6ekJrTWdW?=
 =?utf-8?B?MFdSY0k2ZGVhYUNFTm5helJITTBJbTJZMWRSbURnN3hNRG9yVWc1ZFFLeDJ1?=
 =?utf-8?B?bXJwakRyUE1acWtWdUpoLzFRT3MzcUhTbHIvTE5wS09tWG1VZ2hBNnR1ZW1r?=
 =?utf-8?B?bjhlVHllOGJKVVM4Y2RYRnVISDZDc0hyTzNSdUJ0M2JWTTBTZWZlM3RFRTB0?=
 =?utf-8?Q?CvUPqNasdbhryiwu+RDb8jPrW?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5B4617989DF753499C891F74821C61D7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd2073b6-51d3-4d3f-8f43-08dddc66eae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2025 01:47:54.1273
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCy588nwDixa4jUORWDEMRQ/wa+URU1V9SzHH1ThKou6xmtT1My+XFp2s1ofc0SZgyaSjewuLBx5nKH1h38q+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFF343E9D84
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_184807_928676_3F622BFE 
X-CRM114-Status: GOOD (  18.69  )
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

T24gTW9uLCAyMDI1LTA4LTExIGF0IDEwOjA3ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIE1vbiwgQXVnIDExLCAyMDI1IGF0IDExOjI2OjA4QU0g
KzA4MDAsIEt5cmllIFd1IHdyb3RlOg0KPiA+IEFkZCBjb21wYXRpYmxlIGZvciB2aWRlbyBkZWNv
ZGVyIG9uIE1UODE4OSBwbGF0Zm9ybS4gQ29tcGFyZWQgd2l0aA0KPiA+IGZvcm1lciBJQ3MsIHRo
ZSBNVDgxODkgZGVjb2RlciB1c2UgaW9tbXUgdG8gaW5zdGVhZCBvZiBzbW11LCBhbmQNCj4gPiB1
c2Ugc2NwIGFyY2hpdGVjdHVyZSwgdGhlIGZyZXF1ZW5jeSBpcyBvbmx5IDQwNk1IWiwgYW5kIGNh
bm5vdA0KPiA+IHJlYWNoDQo+ID4gbW9yZSB0aGFuIDcwME1IWi4gQXQgdGhlIHNhbWUgdGltZSwg
dGhlIGRlY29kZXIgc3VwcG9ydHMgdGhlIHZwOQ0KPiA+IGRlY29kaW5nIHByb3RvY29sIGZvciB0
aGUgZmlyc3QgdGltZSBpbiBzaW5nbGUgSUMuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS3ly
aWUgV3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdz
L21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtZGVjb2Rlci55YW1sICAgICAgICAgICB8IA0K
PiA+IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEv
bWVkaWF0ZWssdmNvZGVjLXN1YmRldi0NCj4gPiBkZWNvZGVyLnlhbWwNCj4gPiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtc3ViZGV2LQ0K
PiA+IGRlY29kZXIueWFtbA0KPiA+IGluZGV4IDc0ZTFkODhkMzA1Ni4uMWJiNWEyNDg1ZTRjIDEw
MDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9t
ZWRpYXRlayx2Y29kZWMtDQo+ID4gc3ViZGV2LWRlY29kZXIueWFtbA0KPiA+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayx2Y29kZWMtDQo+ID4g
c3ViZGV2LWRlY29kZXIueWFtbA0KPiA+IEBAIC03Nyw2ICs3Nyw3IEBAIHByb3BlcnRpZXM6DQo+
ID4gICAgICAgIC0gbWVkaWF0ZWssbXQ4MTg4LXZjb2RlYy1kZWMNCj4gPiAgICAgICAgLSBtZWRp
YXRlayxtdDgxOTUtdmNvZGVjLWRlYw0KPiA+ICAgICAgICAtIG1lZGlhdGVrLG10ODE5Ni12Y29k
ZWMtZGVjDQo+ID4gKyAgICAgIC0gbWVkaWF0ZWssbXQ4MTg5LXZjb2RlYy1kZWMNCj4gDQo+IE1p
c3BsYWNlZC4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KRGVhciBLcnp5
c3p0b2YsDQoNClRoYW5rcyBmb3IgeW91ciByZW1pbmRpbmcsIEkgd2lsbCByZW9yZGVyIGl0IGlu
IHRoZSBjb21pbmcgdmVyc2lvbi4NCg0KUmVnYXJkcywNCkt5cmllLg0K

