Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0915DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zl1GwCnXhpVktCV+03l40Zx9sUZprzROGCFyIYd3dvI=; b=Pct549xft18oXrzBAwQPhRaWdW
	aIKdHizToiEvJXb2txd6Ta3ZUzIhTr+jsP/6EGYNJlw3TpRIGOKPPkm/zoFRU544rgQ0akcR8A9B4
	f1jl3VMpgaXPGrlGt2XJqc+wc+vzdtqAVQwhUdixhw4INSeLyfrfctDK8Aw/EBaPdWwqf0/ghYEur
	EXfVeJVArph+0GSOdJXIL6wUHt7xXBBzVA83AHJpaDlmr/IurTSufOcXLel99HlvypvRqJat9UARI
	fe9cdIoSqhSUCyRELhETGC6YFC6NI0UiVQAEHeYg6KumuGHGHuc/sS1zU0ZH0BVAPbvgVIu/w1bij
	7EqZq3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYZX-00000006mcc-1MDi;
	Mon, 09 Dec 2024 07:52:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYYV-00000006mUg-0Q7E;
	Mon, 09 Dec 2024 07:51:48 +0000
X-UUID: 6e3c1a5ab60211ef82ff63e91e7eb18c-20241209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Zl1GwCnXhpVktCV+03l40Zx9sUZprzROGCFyIYd3dvI=;
	b=UmJYd7MMLYOg7gtKrdIw3mjtg9B3FS1wgfs64jOxnu9gkJ+6S873HYlrmLqtVHTXrRvyna0pfj+aM/usKvheFenTFcAGno7KXrTvvUjwyblU/TFKV42bdhX3WspRJvATQgLX52Kd1cEWRSGmA/hbRPS/9Uc2BFaD4CgtIauJxbY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:592fdc15-66d6-42f5-88fe-e60c458dff2d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:b02993a4-c699-437d-b877-50282f19c2c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6e3c1a5ab60211ef82ff63e91e7eb18c-20241209
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 725843943; Mon, 09 Dec 2024 00:51:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 9 Dec 2024 15:51:39 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 9 Dec 2024 15:51:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dt4HSET3hYOpBhtz4cTVJe0DeH2wjKLEbX0D4SkvVRW+f3cgQ2GO6aApjLniqfghv/YexBZXlGEDRcj9skYuMsu388jozgoMPhF9SXnWKW+jMB2Znct77vpEapWqRAbIiMKHFL098ZojuFv8FOFDzpFVlO7D317P9XPsgSQ1DbjgHEKPn/bfah33CXDpC+F/mXmV/D+RmMEoAvzoIhoN9twU4Cl36769v18CFeYT2SACzr7imgmddktjxwLHT7oGgP93ccMqPsiM8QsLGvfTDhrzra6DvtEmGYT3D80Lgrsdd1r+XQYvE/GQ9674gzoAuRfkHh1WOeYcJ30S7dDrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zl1GwCnXhpVktCV+03l40Zx9sUZprzROGCFyIYd3dvI=;
 b=IfP+WLDyZOdcS/AMUSQJNeYtCt62z3QONpfw186QK7mEIanzMYN/Pb8gHM0d+zms9DwmDJQPJg/z5DRWhYlX+MomI4Kbn+g/dxvcjPU4R0+07fOHefl7ffU7Brq1kouVHg/P8SiBXWHybNQeMUARkDWmUmdYYQ5VOKSQXkNz6xPBdKos+OYAk4gSxs081hZYbIfEG07wJpbyWHQcqJdfxHjlk2NGdRWWVVNk3tuePZ5VEQ0XiL+Qvv2jtvl8gDQWz+XH2GsZRmc7mUknPAoANDAYCND77uvCUdoGiRSb0GvqNX935JZ7SQTklogr77Qr9GXVkw7FWGVVZlBXvALLCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zl1GwCnXhpVktCV+03l40Zx9sUZprzROGCFyIYd3dvI=;
 b=rLJ1X563I9jT4ksqnsOgXVw8gqcfLCQE4dvANsnCaiAH2G2AMQ2VoLazQnSOfcPFAEYN/BVACOFnQWR+9th7bTaZGlBsn+ZF9RPQY+OPJxEE/qlxvcbN7lBxTy7gvSQrMU1uG8fWzSlQrypV5WTddboIIUfB+HahHmVkJS8pjNs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB8165.apcprd03.prod.outlook.com (2603:1096:400:45e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Mon, 9 Dec
 2024 07:51:31 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8207.014; Mon, 9 Dec 2024
 07:51:31 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "jie.qiu@mediatek.com"
	<jie.qiu@mediatek.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
	<mripard@kernel.org>, =?utf-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
	<jitao.shi@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
	<maarten.lankhorst@linux.intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "junzhi.zhao@mediatek.com"
	<junzhi.zhao@mediatek.com>
Subject: Re: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Topic: [PATCH v2 12/15] drm/mediatek: mtk_hdmi: Split driver and add
 common probe function
Thread-Index: AQHbRwuDKzLMLP8gmEqSnf1CFqiN77LdkDkA
Date: Mon, 9 Dec 2024 07:51:30 +0000
Message-ID: <df3c37dc2ef4ca9ea920ab9b5b759a1e98c420b5.camel@mediatek.com>
References: <20241205114518.53527-1-angelogioacchino.delregno@collabora.com>
	 <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241205114518.53527-13-angelogioacchino.delregno@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB8165:EE_
x-ms-office365-filtering-correlation-id: 88f70084-11c6-48ec-8e40-08dd18264b70
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OE1OcmZ1Z1R5WTBadEdMNGh5Ui9adkdtL05BdFlRdVlmN0NtaExyZVM4QTl4?=
 =?utf-8?B?M2ZGS2M3UXZLQTBnZWs0VWpzQmNGRkFIRU9rWVEzdTYxMGJRVUcyWjlMS3c1?=
 =?utf-8?B?MFRkMnZGVW9wdEJhTGxCSnFuTGpqNjU2VEd1WjNIcktpYzUvSllNOUJ3R1Vu?=
 =?utf-8?B?Q1E0UWEwazViZTZzTW5YZjl4R0IrbGZHSUdJSjJvRFF3Vmc5ZTZUTGE5UUs5?=
 =?utf-8?B?VDJaMm1uaDlqcVp5S0JNMllSb0tlTGY4bXNGdi8wSkMwajF6WnY5akhadlNx?=
 =?utf-8?B?QlVmUThHdllnaS9yUnRrK2pQMFJpZDNrWEF4MnJqYTM4bXJyOUh3K0ZyaXN1?=
 =?utf-8?B?elFKSyt0VVdmTEtnV1M0bWtXSHhjb0J4UWFXeVdnUjZjaW5nb0NaTG9DREI2?=
 =?utf-8?B?L0NjckRhOHBHYmMzajdUaGJvcms1cDVBNTVSMXg4WVNrQlFxckxJSkI0QVNG?=
 =?utf-8?B?TWRPZ1BCcy9FVmo2ZDg1bjJ1M01nLzMzV1VhT045RTRIUGVGZHB0QXVwS0F4?=
 =?utf-8?B?a1A4SnFvM2pKc3Z6ekRrRy85UU1xcEM3aTkxWDBMcFFCcnJmZFBENFhHY3By?=
 =?utf-8?B?alhYSE4zK0ozVGlmeVJCYi9lUk5iZUJrSWl0QWY5LzhpdWgzMm0zRHVQb0w1?=
 =?utf-8?B?WnRVRzV5MlVmOXJTbWpiSXF0N1JXSS9RZGM2d3M1c09pL1VWeExXK0RnRUpk?=
 =?utf-8?B?aysxRHBuM2tTSHJKeTJvTmtXUVBHemRHMHU5c3QxajZTa1dXZGgwcEVId29O?=
 =?utf-8?B?VzY2elB6WTNrTXl4Q1RTK25OcUFaR0toZzlhTlBhYTF6ZVRGQWtNZ2dJRHpU?=
 =?utf-8?B?SUJ3TzBUa0puNWhrM2xtYXBCWURNWXh3UUxCMWZQM25hRjhFam9RR3ZaNjda?=
 =?utf-8?B?Sy96Q1pOTW9MOHZqZTB1cjhiNTVBY1hnUnpYZFVmdFBlTlhyTWcyS0dyZnFv?=
 =?utf-8?B?Mk8xUXpHaTBaV2N5VkVNQVZNQ0YvcG91RGtWS3ZnZlVpa2JBL3pQM3E1bzJk?=
 =?utf-8?B?OUEveUlkRm40UXUrVkoyOFkyQXJSYkVpNWZ4R0pyTUwzZ3B4V2JvWm1KaDcr?=
 =?utf-8?B?bWtGVzhUU2FMOUtMUjF0SWpRREtkQjZoendSeTVpdXJlTW1PMzU3akxiMGJp?=
 =?utf-8?B?c3htaGNuTmF4OXA3WW9WWCsvNjZtQnQrSzkrdU9JTHh5TGRqZnRDRUgwZmMz?=
 =?utf-8?B?ZGJsNDhHb21WenpDYmlLWkE0c3lGVU9tVVhMNjZZYnBRVm9IQW9NdHo3N3Ry?=
 =?utf-8?B?UTQvTjZXcjQxQUR3TTcxdkNhcFFLSzM3TFlIWC80V2VKbUI4M1FEa3JsZ3E4?=
 =?utf-8?B?M2lEcjJnNVIwMUhWeDAzS2pnSTlHWnNFRlNROUtlV3VxSmhXY1RBaFZtMWRT?=
 =?utf-8?B?NGhQbG5ncG1LRDZRaE1KMUEyYkozNlh4T3F2ZVZLclFlOHlVZCtteGg0U0Za?=
 =?utf-8?B?Vi9QQWZvdFFKUHFhT0NYakN4bjZINXJEY0lkUGhaNytzZWxocUxqcWYxMlJV?=
 =?utf-8?B?azkwNjhIODZ5WG5UZ1dCUUxDdEZWWVJwMldjeFZpaTN1U0tWTzBsOEprT05v?=
 =?utf-8?B?dHdlVUVjUUhseWVJcUVPMUFNMDkyNmxVTTlpcllNZWUwTGZuYmE3YVNjR0pN?=
 =?utf-8?B?U2JkME5NbUwvTm40UjZ6bjhuYUdKNDdRNnVhQkdtUUdpYVpHQnJFdlJEa2ha?=
 =?utf-8?B?VjZJWFVwS3F5aGsycVJsMTA4M0pZRWpJTUVHZi9wZ0crc1dVM0NBOEpaSDJv?=
 =?utf-8?B?S2xuRTlocXEvY3Z3ZGZYdzJFNk5kS3RFUTk4Sm9aY25paytoSGVjbWE4a2pB?=
 =?utf-8?B?ekRvTzBlQnBwdCtub0lPMXJ1d2dOemZUL1lqQm9BV1gxNGsrcC9YV3YwemRq?=
 =?utf-8?B?c3h5OGl5Ukp5Rnl2TGRkK0xVSFE4WnhKK1JCdU9xRC93aUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2R5KzFoek1xUTNnSndGK2xUN0hJL0h4UmdvNFlIWlJ2VjhYaDF2bDNqeG9X?=
 =?utf-8?B?ZHVWTUIyTTZub2cyOFFLQnpZOGxSY1VaWm5DZUY2cmV2eS95TlY4dFM3RUR6?=
 =?utf-8?B?dFVxV040RVV3bm90TTRqcXFYcGIxaVY5bzVrbnFiY1BOS3dydk1CTXozeDlQ?=
 =?utf-8?B?UTl3RXNOR1ZUck1ISUhpWlpWOXNhS2Y4QVpPNHczMWNlUi9lZTMyZ3NNSUF1?=
 =?utf-8?B?c1FOemE5MWRwS0NIWGhJTVorRGNrb1pkQ0ozSVZOWnpqZWV5dzFKMmhxS3pU?=
 =?utf-8?B?Ynl3bUlLUWRhbDFLUThHbE9wbVRQQ3U2Wmg1OXBKd1VKWVFaYURyWE9xUGx3?=
 =?utf-8?B?T01hNWdnRUg2Z1ROcWg5dmhqTXZlMFJFQnNPaGhuODgzYXJUeU1EK2FHYUoy?=
 =?utf-8?B?TlY1MDV3aXQ3ZDhYais2SmJHT0xocGpjWDZwUTFQbDg3OU13ck50ZGQzMmxI?=
 =?utf-8?B?Q0NubkQrV2FnNlpmYzFYejhNd2ZxbHRlc1lHRmdXaGQ4SmpKU1JEclIrM05U?=
 =?utf-8?B?OWRmZHU4bm1XQXR5aUdZUHR0Mml6MTZqbk90M1hRdE1xTnhnS1IrRVJtZDlp?=
 =?utf-8?B?Z2ZYcnNzcVMrMUJRYWNUV0ZKdDVvUjZDUVVMYmJ5blF4MmJiQk01WmNZK0NR?=
 =?utf-8?B?V2lYWGxiSW1McHVPMXIxMkI2WnJyaVg0L2tNeStONy9NbDFubm04eUhsQnhX?=
 =?utf-8?B?WFNhZmJhVnVMUjJJY0hNMC9lTUN4RFQ5N0ZFK3FwN2JBUmNpYzVzQ05ad0hQ?=
 =?utf-8?B?QWNEL2txQkx6cUtlcS9TYlM4clA1NktaN2pHWHh3ZUhNOVRlQTh3NGcvU1JN?=
 =?utf-8?B?U3NBTlNkOXpGcXYzUnNrRUdZVWVQblRxZHJoQTYzdDcrOHlaKzQ5dUhBY2d3?=
 =?utf-8?B?RDE4dTBYbFFUTGpER0JCM1dHV1hiMnMyRFFqQ0lVeUJDMi90NHlGbU03cnAy?=
 =?utf-8?B?T1oycGZVZ2VOaDB2d2lwdXYyOG4yczA1VFBMdEhSSkx4TWRSZGtoYjQ3Q3Zv?=
 =?utf-8?B?TkVrT0NyYysyWXNON2w5WFhjZktKajNjWm45RDhaLzJRUUNSQmtWbzNYcEsr?=
 =?utf-8?B?NWpJeHBDOU1hTFpLU3NSY2RobXphenhoSXlDekczcnhxTWpGVUI3MFVqWGFR?=
 =?utf-8?B?eEYzZWowVDhTQ1AzcXJqd3ZsMVY5eVY5cWVHSmxnQ0Rpd0dxNVB4OENYNWFo?=
 =?utf-8?B?cDJwK1Y4NkN6SmJIRDFBZHR4NkJtTGdCWExXTXlIdHhZdyszRU5Fd0JWek8v?=
 =?utf-8?B?WUtoOXFvNWVXM0pOTllGcGpqZlNOOXNreENwNnRHRWI2OUdURzRjYS80WmNq?=
 =?utf-8?B?aVp3Ums3ZWVoVDhQR1NBamxNWWZ2TUpyc28zNWxCa2xyMHlDckdQZnRWODZZ?=
 =?utf-8?B?aGVlK3QwMC8xZ3NoQWFBZE9CeDdiTXdWSXBSblU4TFFDUEJjWXdmOHZQNUMw?=
 =?utf-8?B?VTFicmRKREJ1SDY3aWZJZTBlN3R4QXlwWEpiVmhtdnlMNmY1TVd6My9lMU0z?=
 =?utf-8?B?MUJQQ0puRWVCUE9DNkVvTUs0Qm1Va1BQMGlMenFWQW9CNC8xbUwzMFNYMUUx?=
 =?utf-8?B?TWVHOWZ2U3hVanMvaXpGc1VHTWtPY2hWcWRkRE5XU1AxRXdPSjNnblZoOEt6?=
 =?utf-8?B?MW5QdUhTSlMzcElSMmtUWVlPV2VJVHM2eitSVEVxMlB0bnBXcVFnTHI0bU9t?=
 =?utf-8?B?Wmd2dDY3RUVEU0NjUmtNdk8zeUF5eTBYakEvQUROa291OVZWUytORHpZdzRo?=
 =?utf-8?B?dUVCVGhxL2F4eDVnN1RwUlpLWU5yR0txUi95YTdteWpZWjhIdXlPM2RtUWxh?=
 =?utf-8?B?RHY3TGhLaEhMNXB3NTIrOFdLMmhDaFBKNWIwVFlSUC9TTjdxVnRVZVhhY05D?=
 =?utf-8?B?WENaSGNmNkhWMEVjWi92a1pLTzkxdlo4d0hGQXNvVXpjY2VQMlR2UzJmVFVj?=
 =?utf-8?B?S2Z2ak9mOGhnbm1NY1ZEZERtb3J0bTUxQTdCN2FPdHovRjNaNjVmd0VKelJ0?=
 =?utf-8?B?N205WjNoUUhpSjl4L1lWSE1lRXJwWXgvNXVXZzRqR1A4MFdWZUFmdVZQeWxk?=
 =?utf-8?B?N0JQVnlkQzMxVzlmZXdQV3JaZ1cvQ0FoUzEvQlRJSW1MNjgzQnNrYVI5dldR?=
 =?utf-8?Q?aHsO+IXm6EG5Z0t1TsqXyk6ha?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3387E578BDA94044B60E5333EF6ACB7B@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f70084-11c6-48ec-8e40-08dd18264b70
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 07:51:30.9762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAejAphsaO4AhtCsIbcTQeuE0o80H8t5YO6IFzRqaJMSAi628DLsmIzfAYHNXd6YLJFFnYzwjtMXRtiEZIf4gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_235147_139957_D95AC42E 
X-CRM114-Status: GOOD (  14.54  )
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

SGksIEFuZ2VsbzoNCg0KT24gVGh1LCAyMDI0LTEyLTA1IGF0IDEyOjQ1ICswMTAwLCBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbiBwcmVwYXJhdGlvbiBm
b3IgYWRkaW5nIGEgbmV3IGRyaXZlciBmb3IgdGhlIEhETUkgVFggdjIgSVAsDQo+IHNwbGl0IG91
dCB0aGUgZnVuY3Rpb25zIHRoYXQgd2lsbCBiZSBjb21tb24gYmV0d2VlbiB0aGUgYWxyZWFkeQ0K
PiBwcmVzZW50IG10a19oZG1pICh2MSkgZHJpdmVyIGFuZCB0aGUgbmV3IG9uZS4NCj4gDQo+IFNp
bmNlIHRoZSBwcm9iZSBmbG93IGZvciBib3RoIGRyaXZlcnMgaXMgOTAlIHNpbWlsYXIsIGFkZCBh
IGNvbW1vbg0KPiBwcm9iZSBmdW5jdGlvbiB0aGF0IHdpbGwgYmUgY2FsbGVkIGZyb20gZWFjaCBk
cml2ZXIncyAucHJvYmUoKQ0KPiBjYWxsYmFjaywgYXZvaWRpbmcgbG90cyBvZiBjb2RlIGR1cGxp
Y2F0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8g
PGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4NCj4gLS0tDQoNCltzbmlw
XQ0KDQo+ICtzdHJ1Y3QgbXRrX2hkbWkgKm10a19oZG1pX2NvbW1vbl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiArew0KPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfaGRt
aV92ZXJfY29uZiAqdmVyX2NvbmY7DQo+ICsgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBk
ZXYtPmRldjsNCj4gKyAgICAgICBzdHJ1Y3QgbXRrX2hkbWkgKmhkbWk7DQo+ICsgICAgICAgaW50
IHJldDsNCj4gKw0KPiArICAgICAgIGhkbWkgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6
ZW9mKCpoZG1pKSwgR0ZQX0tFUk5FTCk7DQo+ICsgICAgICAgaWYgKCFoZG1pKQ0KPiArICAgICAg
ICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+ICsNCj4gKyAgICAgICBoZG1pLT5k
ZXYgPSBkZXY7DQo+ICsgICAgICAgaGRtaS0+Y29uZiA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0
YShkZXYpOw0KPiArICAgICAgIHZlcl9jb25mID0gaGRtaS0+Y29uZi0+dmVyX2NvbmY7DQo+ICsN
Cj4gKyAgICAgICBoZG1pLT5jbGsgPSBkZXZtX2tjYWxsb2MoZGV2LCB2ZXJfY29uZi0+bnVtX2Ns
b2Nrcywgc2l6ZW9mKCpoZG1pLT5jbGspLCBHRlBfS0VSTkVMKTsNCj4gKyAgICAgICBpZiAoIWhk
bWktPmNsaykNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiAr
DQo+ICsgICAgICAgaGRtaS0+cGh5ID0gZGV2bV9waHlfZ2V0KGRldiwgImhkbWkiKTsNCj4gKyAg
ICAgICBpZiAoSVNfRVJSKGhkbWktPnBoeSkpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2
X2Vycl9jYXN0X3Byb2JlKGRldiwgaGRtaS0+cGh5LCAiRmFpbGVkIHRvIGdldCBIRE1JIFBIWVxu
Iik7DQo+ICsNCj4gKyAgICAgICByZXQgPSBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShoZG1pLCBw
ZGV2LCB2ZXJfY29uZi0+bXRrX2hkbWlfY2xvY2tfbmFtZXMsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdmVyX2NvbmYtPm51bV9jbG9ja3MpOw0KPiArICAgICAgIGlm
IChyZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUihyZXQpOw0KPiArDQo+ICsg
ICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaGRtaSk7DQo+ICsNCj4gKyAgICAgICBy
ZXQgPSBtdGtfaGRtaV9yZWdpc3Rlcl9hdWRpb19kcml2ZXIoZGV2KTsNCj4gKyAgICAgICBpZiAo
cmV0KQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHRyX3Byb2JlKGRldiwgcmV0
LCAiQ2Fubm90IHJlZ2lzdGVyIEhETUkgQXVkaW8gZHJpdmVyXG4iKTsNCj4gKw0KPiArICAgICAg
IGhkbWktPmJyaWRnZS5mdW5jcyA9IHZlcl9jb25mLT5icmlkZ2VfZnVuY3M7DQo+ICsgICAgICAg
aGRtaS0+YnJpZGdlLm9wcyA9IERSTV9CUklER0VfT1BfREVURUNUIHwgRFJNX0JSSURHRV9PUF9F
RElEIHwgRFJNX0JSSURHRV9PUF9IUEQ7DQo+ICsgICAgICAgaGRtaS0+YnJpZGdlLnR5cGUgPSBE
Uk1fTU9ERV9DT05ORUNUT1JfSERNSUE7DQo+ICsgICAgICAgaGRtaS0+YnJpZGdlLm9mX25vZGUg
PSBwZGV2LT5kZXYub2Zfbm9kZTsNCj4gKw0KPiArICAgICAgIHJldCA9IGRldm1fZHJtX2JyaWRn
ZV9hZGQoZGV2LCAmaGRtaS0+YnJpZGdlKTsNCg0KWW91IGNoYW5nZSBkcm1fYnJpZGdlX2FkZCgp
IHRvIGRldm1fZHJtX2JyaWRnZV9hZGQoKS4gSWYgdGhpcyBpcyBuZWNlc3NhcnksIHNlcGFyYXRl
IHRoaXMgdG8gYSByZWZpbmVtZW50IHBhdGNoLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArICAgICAg
IGlmIChyZXQpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wdHJfcHJvYmUoZGV2
LCByZXQsICJGYWlsZWQgdG8gYWRkIGJyaWRnZVxuIik7DQo+ICsNCj4gKyAgICAgICByZXR1cm4g
aGRtaTsNCj4gK30NCj4gKw0KDQo=

