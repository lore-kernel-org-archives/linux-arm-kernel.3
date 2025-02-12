Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC2CC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 02:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU+rF/64UMgJZglkNBmahpjFCLtTGlcOgPq08JYiAGU=; b=PcgAoRXYZsQKBogrRE2gAqc/ZX
	NzN1bXzn/GRKYC8SBLCvu5Z5OXRhJ4Xcv8ukRf0Mg+7wVyEPagiHIESlmc3GP1BE542lzzSwc0Qah
	D04Ys+25AaEfj7X+mzwsytPN4aEfdK9Iwl2K3mRXeku9VzRrL7y5zNWT9AD9ivIWeNaMM7HmPZ0OJ
	vRLoVw20INAN3w6EnCerQwMfqatv6LKJsIXS+TNbpz2RsMKGeBSWQ/fMqPeJnBYBwIUFYClDKNZXl
	2bv2/8K01tkJtd0VL4N6XFMGMlGvbn0YQoxYCNpyt7Qymn4YxnedhqZOHsFWC9s+5bJauqe6aCiHx
	gs3ULwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti2Lt-00000005vkf-2Ih3;
	Wed, 12 Feb 2025 02:19:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti2KU-00000005vWG-009B;
	Wed, 12 Feb 2025 02:18:23 +0000
X-UUID: 9d9355dae8e711ef9048ed6ed365623b-20250211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=kU+rF/64UMgJZglkNBmahpjFCLtTGlcOgPq08JYiAGU=;
	b=R4TraI2YhXVZuKusuyBSG4BtPozUzaF2GKEoQFb47pe/q52mDg65es2uVYts0xd4yUX+QIPjXFJCHlLjCwLVnC85CCxatewKQwP7i1le4Oj/+0fKwxDQOK8t/QA/h33cqJruiUn/gXztRrhOKIe5QZesi5J5JY89hs0vqzydMi8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:a0450b6f-b054-4c19-9411-a5c45adfb5d6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:a7ab6d27-6332-4494-ac76-ecdca2a41930,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 9d9355dae8e711ef9048ed6ed365623b-20250211
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1526660060; Tue, 11 Feb 2025 19:18:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Wed, 12 Feb 2025 10:18:12 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Wed, 12 Feb 2025 10:18:12 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGCLZ1XcbzI+xnFE5kkwK3Zv7bRw0atylW/EVPgi4VhRayVn/FQK0EyYqtUMH/0tW4Hf/ZZUIOGm5bal6/AeQaWbDoN0pncOGceb11I1ODWI+YXiNVsq+7ouYjH375aayBmy0oBvjkObc/6dUBxFmMnm9u3SwTuHWDShDzCwW3TA2ESLxGU3BV3Nq+scWxR+ITrw/K9ZN4PoTTO4I6Ujw/9ceogsPaPTE/k+NdSG9JJqWv1cVut3rJ8Fk53szmV4rr9LUmhZMHCjlqZvUJSprBXtIvr+CAq7kfiaAqaN8PpBs3zEY4RXTZy6C8WnfwMQzICpPx7S0N0+3v7/FHevAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU+rF/64UMgJZglkNBmahpjFCLtTGlcOgPq08JYiAGU=;
 b=VGVAk6mp0Iw8vl+dtw5NkKnbbfqi4NLkqY7no3/1BW9wBTFwZH4SXiWkd5iOWaAtvu8R476CrOPhKNO18CJ1iPTQfbAUCrzCOdNHpkBah/3wddzCeKiR2kk+4K5dmGMzJtSieuX9LtmvXQxjCMj/sN8AISjlIaIJBNuBBE8IjeBKbxO0Ge8y0H/2CfCqDx9OR55qzMnKyQS6MpBxxC15I08FtnlYXI9evPvdy6gmFwwH0esgHgqHSpYnIN0dnyyYFBG11bVmAk+HnpMktscJrREYbs+rdvRqytWUnqa4C/1qesSZ4Hj8AB2S6vDrf1Cjlx2K8VOEkCNurfUr05WZnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU+rF/64UMgJZglkNBmahpjFCLtTGlcOgPq08JYiAGU=;
 b=kzeYXkE4Sr/e5wOuSWDFcGFb/vH4G7g01SNpJPWRIAeoteSfayMu6yDc1fg0ZnDMrleIu6YIkFmTTL38TqswaFMx0z3zLjhaXFU5MfTt1n3gBZwitk1Vco2uAhYvO2p3ePRx6YcTAmb5Gn036AGcO7007xf9e/s0l72u9r3Zewc=
Received: from SI2PR03MB5322.apcprd03.prod.outlook.com (2603:1096:4:ef::8) by
 KL1PR03MB6969.apcprd03.prod.outlook.com (2603:1096:820:9d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.18; Wed, 12 Feb 2025 02:18:10 +0000
Received: from SI2PR03MB5322.apcprd03.prod.outlook.com
 ([fe80::4f8e:6e62:b8a5:5741]) by SI2PR03MB5322.apcprd03.prod.outlook.com
 ([fe80::4f8e:6e62:b8a5:5741%3]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:18:06 +0000
From: =?utf-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?=
	<Mingyen.Hsieh@mediatek.com>
To: Slavi Pantaleev <slavi@devture.com>, Felix Fietkau <nbd@nbd.name>,
	"Lorenzo Bianconi" <lorenzo@kernel.org>, Ryder Lee <Ryder.Lee@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: RE: 6 Ghz frequencies always listed as disabled in newer kernels with
 Mediatek MT7921K (RZ608)
Thread-Topic: 6 Ghz frequencies always listed as disabled in newer kernels
 with Mediatek MT7921K (RZ608)
Thread-Index: AQHbe8wNBTbIWpbk0kCRNVEi7yerarNC8Cng
Date: Wed, 12 Feb 2025 02:18:06 +0000
Message-ID: <SI2PR03MB532296077BDB2BEBE79DDB2885FC2@SI2PR03MB5322.apcprd03.prod.outlook.com>
References: <18be5ba2-6dc4-4766-9944-59cb46c8dfaf@devture.com>
In-Reply-To: <18be5ba2-6dc4-4766-9944-59cb46c8dfaf@devture.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IGFpPSIwIiBubT0iYm9keS50eHQiIHA9ImM6XHVzZXJzXG10azI1NjQ3XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOTY1NDA5ZDMtZThlNy0xMWVmLTkxZWMtMzQyOThmNzM5YmU2XGFtZS10ZXN0XDk2NTQwOWQ1LWU4ZTctMTFlZi05MWVjLTM0Mjk4ZjczOWJlNmJvZHkudHh0IiBzej0iNzE5NiIgdD0iMTMzODM4MDAyODQyMjAxODk4IiBoPSI4NmdKRjkxYVlJUHBtSzVnYm41TTNIYzNLbmc9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5322:EE_|KL1PR03MB6969:EE_
x-ms-office365-filtering-correlation-id: a5652a53-c75d-4aac-032a-08dd4b0b7ce6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?S0tWTVN5dEV1SmlLeTZJVXBJSUpQOHBldW1vTkRUNC83Q0ZiNWhSTzc5NXlJ?=
 =?utf-8?B?clAwVE82Vm5ZSk5kbVNycDBOaGlienhwTzZueUpTTFJ3bzNidFZKMGlOaE9l?=
 =?utf-8?B?Zi9hTlkwR3RNQ0hVTW5uNUphWHFsTjNMbFZHNitlVmFCZDFHVnpNTDdMaUw1?=
 =?utf-8?B?WXN3akIrNk54cjQ4TjdCT1Y4SkozQVBxdnRDUFpBeEpPaGV4bWNWZGpGMUJ2?=
 =?utf-8?B?aEFraXhpYXBuMU1GZTg3QTRjQzh5UVhYTitYdWhVRFViaGhVQXkwcUZhb2NK?=
 =?utf-8?B?S1ladCt1MFZ4cTFrRGNOcTdQclpUODl2NU1Ra2cwTnJqQkpvQnpneCs5VEo1?=
 =?utf-8?B?ZmJHTUFJNWtZQ1piTGlHUGpaM1VPNFE3M1FVRmMxa2trY3AreUJ4bENTbnNu?=
 =?utf-8?B?K2VLREJ5cUdUalJ4RXcxdStXSDFrY211RW90OXhjbEgrcVhCcE5GbmJvcmlh?=
 =?utf-8?B?Z1pQSzdoUnBUbHdjK0lOY3NrWnVTMFM0MFZjRmpWOWFueVJoYnVPMS9pbHpm?=
 =?utf-8?B?OURreUxET2JDd0ZXSngrZGhqdWMwS2pRM2xjUndFNTVPWmtOOHdUUFNKVURM?=
 =?utf-8?B?NHdQVWZLeDlockptTTE0UWJsWlU3WXVVREFTRmk3THpFVkdCWjJ0azR3cjlT?=
 =?utf-8?B?WFk3My9DKzFWd1M5YzlsMHhaZDdVSFZVKzVDbHNyOXR5amFBK0Q4U3F6Y1d3?=
 =?utf-8?B?T3k2N3Q5RlhuVmdHeGZkc3ZvL3l1SUVnd0VMbjFNdHFjTHppdHFnamcxQVlT?=
 =?utf-8?B?NTAvMWVvMy9xWUtZUVFMK2lXVGRuQUpmUVg1UTFaZXZJN1hVaE1GV0NBeUJy?=
 =?utf-8?B?SElpdnBVSUtkcXZ6ZmVOOENPZnowQ0VETUo4eG9NaVVrZkZ5OUdDOUhMdWJU?=
 =?utf-8?B?ZElnOTZZcSs4ZmZMM0ZvZWNoOHluOVJzdnF6K0Rrek5ZQ3NUd05CRzlOWUVv?=
 =?utf-8?B?aHdKOXpKTGF3QXphKy8xc25CRG1zTHJTWkF6QTFJWm0yV0crTlBXbWNvZlZW?=
 =?utf-8?B?K0hwRDRWZHQzYWJFdEJiN0xSbGZGejRjMDh3RHh1UEtucmN4N0J2eFRaTHB0?=
 =?utf-8?B?UlJObWRuWm5jQlBFcStIdm00d2xQWjBHaTRuUFZJckJQeWJ1QitBUEtwSnZR?=
 =?utf-8?B?c0RqOFd3KzNRcFVsR2RWdENVS0JQdEJPRzBpZ2pGb21HNTB1VFlIaXRQdEQv?=
 =?utf-8?B?Um9xZnhkdFpjTVpVcC93d2Y4TTJ4WkVSWW1zWExPNEpETTNDWEJLWUNmcHBK?=
 =?utf-8?B?ZG5JbWhaMzV3VEo2R0t0SnNnL3Zad2RySlZEQlhqWTFGUzBjcTZsZmJ2dWRD?=
 =?utf-8?B?ZFdmMFplLzdHS05PVWpsdFphVkx4NUUwcG52SEFkdFlmKzJmZW1DcHYrOUVl?=
 =?utf-8?B?VWN0Tk5STUE3bndUbk9PeEljQVZ4eWZsb3NmVkxGMm9sK3RoZUx0ck8xVXJ3?=
 =?utf-8?B?cUJDM0xGM0tLK1dWNHlMUzhQTzZsUTM2ZWtxYjcrNnBkSXZhYnNmZ2twS3pN?=
 =?utf-8?B?R2NIL2Z4YTZwd2VzYjdFcGRtZDBZZ21mRitsSFJqT00valB5cld6eGNUU3lJ?=
 =?utf-8?B?VTBySzVKb3hUeDRvUEVOUklMQlBQdEtzRFBHL3lhN0pIbmd5ZERsWjRuYjJy?=
 =?utf-8?B?ZjFUTkVRSE41cEM0T241NHFHbEFNNC93dVVWb2M2QWRoeW83TFl5WktMZkRQ?=
 =?utf-8?B?R1JrUTRwM29mYXgvdk9MdTNmRVFCRjJmNUpXY1JsL2t2V1VDM2JRNmxKVFdY?=
 =?utf-8?B?VlF2bWJPeURMclEraHdjUWtCQWJGNTdFMHI1RHFwVUVKMjJHNFEvS0Q5WEpI?=
 =?utf-8?B?a29LUHhtTU9iS3IwRW4wdkhMZm5MOWV4cjhlVzY3bFlZU1VPYjdpOThGU2xw?=
 =?utf-8?B?NUxJZG5CYnhKUUpnVnRyUkthaHV6VlZ6VUhEcVd6MDc4RHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5322.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djhJOUVoeVhrc2U2dHVFd0VyaXJ5TjE4eGUzRkJjTmxCN3J0bEtYa29lSmll?=
 =?utf-8?B?VmNvK0NQUmdaTXROK3FSNXNlK0pTd3FsdkV1THdDcEVVOWR5MjVLMFJIMmNS?=
 =?utf-8?B?allTZ0daYXdwcHppY3UwbWpBbXRieXFsc291UnV3R0ZkcEtEdWZ0M1hsOUlw?=
 =?utf-8?B?eUdZSGhhTnlNY3JvTW5jK095bjkrVHpzRVRKZGNVTHBCeU9kYzYrNlM0dk9y?=
 =?utf-8?B?eFVQelMrYjRKZkRHa3JMUEFHeUFMMnYyTVJSNU5kS3lJMXhDMWhZZmRXR0tR?=
 =?utf-8?B?cEtlT0hwdmJaQTRRNUtHTGNpYmxyM1N6b3RWbllIMTFaNURNL1RSN0VRdVF6?=
 =?utf-8?B?OE5jYS9vNmtDOTRLOXg4Q0F2SUVBay9YSW1pSG41bHovcjF4TjAwS1VtT1JZ?=
 =?utf-8?B?MG0zQ2diZlgvNDhJZDZFZ2U0aVN5cnhJdjgzdXlWK1gvQjZ5MEM1SU8waFF3?=
 =?utf-8?B?SUJCbEROWm5oK0hHd1gzRCtpclNDOVR0TlEvRVBXeXV0TDJJM01rMnRLcHZO?=
 =?utf-8?B?ZWxRN1FwSzBYc0ZtRUloZXUrTDh0SGNlTktWUUppQkc4dFpXRVk0bmFwQi9h?=
 =?utf-8?B?MFJrZ2NhaWMyWGhwSHZhMjlIQ2t6b1FJV2JDWDIzakc1OVIrd20ySHpKRUxG?=
 =?utf-8?B?Qmp5UjV5WExlVlVGQ1IyY1ExUnZrZURLQXRrMXlZbWJ1RUgvRC8xUGk0Ukdi?=
 =?utf-8?B?M2JMYzliSnUvVnVZalU2YzYyS2lPdG1XcXU4bmlGeis5SzF2VWJRa3cxalV2?=
 =?utf-8?B?dEcyTUVRbmF6TmZsMTZrV2NEMjhGZiszcHRMb3BPQ0xYdzhCc1dJTnE0QVI5?=
 =?utf-8?B?MWhldWhyeUNPUG5TdVFpaGtjUW9DeURFUmNGSURQZkFSaTdyV01kMkwyQWZy?=
 =?utf-8?B?d3ExTkZvSVpmbVNlVk0yWkZVTmN3aThWc3AxdkRXSThNZ2c5K1FmbjQ3UFFL?=
 =?utf-8?B?cU5ZQ29hNm95Vk9BVmx3RzhXNXFFSkdHYmgwWDVEeXhjWEUxV1B6bGZnRzhD?=
 =?utf-8?B?NXpTRHBWVE1NbzgxQ0ZmRGNwcC8xbFh5WjgyeUFpcElmcThpVDViSk9KYkZp?=
 =?utf-8?B?cFd4K1dIb0RpSVZzbWZWeTJZZStpeG94cTdUQWVxaS9GR2tJWnVMTjgwL0xF?=
 =?utf-8?B?VWhFZnhjd1VrT3FXUWR4cHUvRUhPb0hvbXBYS205VC9KZVhLWHlkL21ReElt?=
 =?utf-8?B?a3psaFFzQmVSaUFFdFBZSTNqUjdKdXJTUVFCZFhFanB3a0UycjhYYW05aVVz?=
 =?utf-8?B?ZUF2MWFwTkFEZDdLYUVVaWxlQzhSNUpqRm1VTzQ3QkFKOWlwUjh1MUZDREhu?=
 =?utf-8?B?dFFRZm5DNVZmUG5ZVVFLRkNhcEx2bEJ4c1FtVVVyOURnRS9MY0R5QlhJRjA5?=
 =?utf-8?B?MnZWaERYK0VOOGJ1NGRjNndKQ05ZTWx5VGZJRGdidUx1Z1VpZ1RtVlYxaUlh?=
 =?utf-8?B?ZFpzdVZoT1E2VzJMZmpXU2pCcjQrWk5VOXJVTXlLdjE0SzBpRkdrVlc0OStC?=
 =?utf-8?B?TFQva3BIcjBuRkFhMG0vcFk1aHZnQVpPckVuRlRJMWg1b1p1b1FwOUs2UENR?=
 =?utf-8?B?OFI1ajFsSXJKZDFMUUFzOUJoK2RXL3NZUkJwbHFoZ0ZxbGJsMUlXK3krMk5D?=
 =?utf-8?B?L0lwazZ0RTg3NjUxM2JaSG5WZTk2UlVYczU5NFZnTWlpZ1dxM3BrUERZTWpy?=
 =?utf-8?B?cStmSENhTDJYK0dmREZteFNtam9UWjhXWS85alROTHZ2Q0pLOTB3ckxMdmM4?=
 =?utf-8?B?cEtldUVpNExheWZYVnhRSjNvREY2TTcvVzA2a0FhaVM3OEo1aW5idEVZYjN2?=
 =?utf-8?B?Q3BFd01iZmc1SjhNSVA4T2tGUHIvaStqSGtrdkh4QTRpUXp6RGpyalJvWW9L?=
 =?utf-8?B?azdtTTBmZG9JK0VjN0huVms2em9YVTJlR1dTOXpaS21RVkZ5NlBuZDNDQnFC?=
 =?utf-8?B?V21nbVdDNHFjMTEyYWVmZ0tUbzZNTzhSY01aUDdqMnJ5a2ZFRDNHd0hPdVd5?=
 =?utf-8?B?N1VhcnV2OGFZaHdOQ2QwUUpJaFlHSzJoV1ZBYnhsY0NqU3lIMmw0UkpvV3RX?=
 =?utf-8?B?bVdIM2tab0xFazk2dVZXakFrTVlpLzZ2SEdxUzRjLzFNMzhkdmUvbkF4V1Qv?=
 =?utf-8?Q?K0zfH4gZCYhEA9/2LN4FYVr6a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5322.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5652a53-c75d-4aac-032a-08dd4b0b7ce6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 02:18:06.8398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcWhpHbgFOEi7siJmtEIt83avpSgJ9n+2GR5MeaX/Ut9az5jF6vmfQQKmFcEsxB5pRSWNuDQwqyrm7D3a/iVx5HJXs7pjQ5G2FVg00UTDEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB6969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_181822_054973_FC4C3E40 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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

SGkgU2xhdmksDQoNClRoYW5rIHlvdSBmb3IgcmVwb3J0aW5nIHRoaXMgaXNzdWUuDQpJIHdpbGwg
bG9vayBpbnRvIHdoYXQgd2VudCB3cm9uZy4NCg0KQmVzdCBSZWdhcmRzLA0KWWVuLg0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogU2xhdmkgUGFudGFsZWV2IDxzbGF2aUBkZXZ0
dXJlLmNvbT4gDQpTZW50OiBNb25kYXksIEZlYnJ1YXJ5IDEwLCAyMDI1IDEwOjU2IFBNDQpUbzog
RmVsaXggRmlldGthdSA8bmJkQG5iZC5uYW1lPjsgTG9yZW56byBCaWFuY29uaSA8bG9yZW56b0Br
ZXJuZWwub3JnPjsgUnlkZXIgTGVlIDxSeWRlci5MZWVAbWVkaWF0ZWsuY29tPjsgS2FsbGUgVmFs
byA8a3ZhbG9Aa2VybmVsLm9yZz47IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFp
bC5jb20+OyBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxy
ZWdub0Bjb2xsYWJvcmEuY29tPjsgTWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KSA8TWluZ3llbi5I
c2llaEBtZWRpYXRlay5jb20+OyBEZXJlbiBXdSAo5q2m5b635LuBKSA8RGVyZW4uV3VAbWVkaWF0
ZWsuY29tPjsgbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNClN1YmplY3Q6IDYgR2h6IGZyZXF1ZW5jaWVz
IGFsd2F5cyBsaXN0ZWQgYXMgZGlzYWJsZWQgaW4gbmV3ZXIga2VybmVscyB3aXRoIE1lZGlhdGVr
IE1UNzkyMUsgKFJaNjA4KQ0KDQoNCkV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBz
ZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQoNCg0KSGVsbG8hDQoNClRoaXMgaXMgaW4gcmVnYXJkIHRv
IEJ1Z3ppbGxhIEJ1ZyAyMTg3MzEgLSBUcmktYmFuZCBBTUQgUlo2MDggKE1lZGlhVGVrDQpNVDc5
MjFLKSBoYXMgNkdIeiBiYW5kIGRpc2FibGVkIGluIGtlcm5lbCA2LjcrIGRlc3BpdGUgd29ya2lu
ZyBpbiA8PTYuNg0KDQpVUkw6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2J1
Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxODczMV9fOyEhQ1RSTktBOXdNZzBB
UmJ3IWh3Z3lyUEU1RVVtbGh2Mjc2TUxkaGgzaW8tT21YZVl2Tk1WR1VwQVViSjd3Z2M5ejhXSTRm
Wm9EMFplMVdsSWxxZl8xcXJpZUUxdW5hcF9QOF9FJA0KDQpJJ20gaW4gQnVsZ2FyaWEgYW5kIGBp
dyByZWcgZ2V0YCByZXBvcnRzIHRoaXM6DQoNCmBgYA0KZ2xvYmFsDQpjb3VudHJ5IEJHOiBERlMt
RVRTSQ0KICAgICAgICAgKDI0MDAgLSAyNDgzIEAgNDApLCAoTi9BLCAyMCksIChOL0EpDQogICAg
ICAgICAoNTE1MCAtIDUyNTAgQCA4MCksIChOL0EsIDIzKSwgKE4vQSksIE5PLU9VVERPT1IsIEFV
VE8tQlcNCiAgICAgICAgICg1MjUwIC0gNTM1MCBAIDgwKSwgKE4vQSwgMjApLCAoMCBtcyksIE5P
LU9VVERPT1IsIERGUywgQVVUTy1CVw0KICAgICAgICAgKDU0NzAgLSA1NzI1IEAgMTYwKSwgKE4v
QSwgMjYpLCAoMCBtcyksIERGUw0KICAgICAgICAgKDU3MjUgLSA1ODc1IEAgODApLCAoTi9BLCAx
MyksIChOL0EpDQogICAgICAgICAoNTk0NSAtIDY0MjUgQCAxNjApLCAoTi9BLCAyMyksIChOL0Ep
LCBOTy1PVVRET09SDQogICAgICAgICAoNTcwMDAgLSA2NjAwMCBAIDIxNjApLCAoTi9BLCA0MCks
IChOL0EpIGBgYA0KDQpGb3IgdGVzdGluZyBwdXJwb3NlcywgSSd2ZSBhbHNvIHRyaWVkIHN3aXRj
aGluZyB0byBhbm90aGVyIHJlZ3VsYXRvcnkgZG9tYWluIChgVVNgLCBgREVgLCBgU0VgLCBgTkxg
KSB2aWEgYGl3IHJlZyBzZXQgLi5gLg0KDQpSZWdhcmRsZXNzIG9mIHRoZSByZWd1bGF0b3J5IGRv
bWFpbiwgYGl3IGxpc3QgfCBncmVwIC1BIDE1IEZyZXF1ZW5jaWVzYCBhbHdheXMgcmVwb3J0cyB0
aGUgNiBHaHogZnJlcXVlbmNpZXMgYXMgZGlzYWJsZWQgb24gbmV3ZXIga2VybmVscy4NCg0KQXMg
dGhlIG9yaWdpbmFsIGJ1ZyByZXBvcnRlciBoYXMgZGlzY292ZXJlZCwgdGhlIHJlZ3Jlc3Npb24g
YmVnaW5zIHRvIGFwcGVhciBpbiBrZXJuZWwgNi43LjAgd2hpbGUgaXQgaXNuJ3QgcHJlc2VudCBp
biA2LjYuMzAuDQpJJ3ZlIGRvbmUgYSBiaXNlY3Rpb24gYW5kIHRoZSByZXN1bHRzIGFyZSBsaWtl
IHRoaXM6DQoNCjEuIFtiYWRdIG1haW5saW5lICg5NTRhMjA5ZjQzMWMwNmI2MjcxOGE0OWI0MDNi
ZDRjNTQ5ZjBkNmZiKQ0KMi4gW2dvb2RdIHY2LjYuMzANCjMuIFtiYWRdIHY2LjcuMTINCjQuIFtn
b29kXSB2Ni42DQo1LiBbYmFkXSBlZGQ4ZTg0YWU5NTE0ZTkzMzY4ZjU2YzM3MTViMTFhZjUyZGY2
YzNiDQo2LiBbYmFkXSA4OWVkNjdlZjEyNmM0MTYwMzQ5YzFiOTZmZGI3NzVlYTYxNzBhYzkwDQo3
LiBbZ29vZF0gYjgyN2FjNDE5NzIxYTEwNmFlMmZjY2FhNDA1NzZiMDU5NGVkYWQ5Mg0KOC4gW2Jh
ZF0gZDFhMDJlZDY2ZmU2MmFhMmVkZDc3YmQ1NGUyNzBlYmMzM2JkMTJmZg0KOS4gW2dvb2RdIDNh
YmJkMDY5OWI2NzhmYzQ4ZTAxMDA3MDQzMzhjZmY5MTgwZmU0YmINCjEwLiBbZ29vZF0gNWE0MjM1
NTJlMGQ5YmI4ODJmMjJjYjBiZjg1ZjUyMGNhMjY5MjcwNg0KMTEuIFtiYWRdIDU2YTdiYjEyYzc4
ZmZhMWIwMmUxNTRiMWQ3NzllZDJhMTU1NWZhM2MNCjEyLiBbZ29vZF0gYTNjMmRkOTY0ODdmMWRk
NzM0Yzk0NDNhMzQ3MmM4ZGFmYTY4OTgxMw0KMTMuIFtiYWRdIDA4OTQ4MmEwNmI3NGE0MGQ0NTc3
M2IxODcxMTgyZThmMDRiZTAyNmINCjE0LiBbZ29vZF0gZmNlOWM5Njc4MjBhNzJmNjAwYWJiZjA2
MWQ3MDc3ODYxNjg1YTE0ZA0KMTUuIFtnb29kXSBjOTQ4YjVkYTZiYmVjNzQyYjQzMzEzOGUzZTNm
OTUzN2E4NWFmMmU1DQoxNi4gW2dvb2RdIDk1ODUzMTZhMmFhZjc3M2E2Nzg0NmJkYzhiYmRkNGRm
MWU5NjIyZmENCjE3LiBbZ29vZF0gNTFiYTBlM2ExNWViMTY0MzExNmE5MzY3NGUyMzBlMTFiOTQ5
OTU5Mg0KMTguIFtiYWRdIDA5MzgyZDhmODY0MWJjMTJmZmZjNDFhOTNlYjliMzdiZTBlNjUzYzAN
CjE5LiBbZ29vZF0gNGZjOGRmNTBmZDQxYzI3NjJkODkzMjExNDg3YmUwZWNiMjRjNmEwNQ0KDQow
OTM4MmQ4Zjg2NDFiYzEyZmZmYzQxYTkzZWI5YjM3YmUwZTY1M2MwIGlzIHJlcG9ydGVkIGFzIHRo
ZSBmaXJzdCBiYWQgY29tbWl0Lg0KDQpVUkw6DQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
c3RhYmxlL2xpbnV4LyovMDkzODJkOGY4NjQxYmMxMmZmZmM0MWE5M2ViOWIzN2JlMGU2NTNjMF9f
O0t3ISFDVFJOS0E5d01nMEFSYnchaHdneXJQRTVFVW1saHYyNzZNTGRoaDNpby1PbVhlWXZOTVZH
VXBBVWJKN3dnYzl6OFdJNGZab0QwWmUxV2xJbHFmXzFxcmllRTF1blIwTURMQ3MkDQoNClJlZ2Fy
ZHMNCg0K

