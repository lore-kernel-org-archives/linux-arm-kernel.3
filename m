Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0DDD7879C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVuhF6lGp84tVTJZCL+QDfDP6haVKUY17yN4YRLiQJA=; b=IXA0K/IlQ5joPNxsDiTq/lChcw
	dhCqMlYcYqNeF2MMXrS7J0lEm1gp7BjmrnS14VcWSdpOlyYLue5ILEgs4m4lfmq8f0wcF/cA4GqOh
	97BW/8RAqz/1WP4ej3pw/ZQhojRX9l6lbt0WYYzadJIdM0iJnDtd4ALIUGr56LTDsLACbW/RbDYRG
	429hR5NoKh1N7KxGlkbKlR01DSoaLqE5/qMb3ejvbJGbQbtpMt3VbKU+n7enFDG99aqwG9jyLZmXT
	yRvhJSOX6OAbT9A3ppBcvh5b5iUaxGX/UoxM+tdXuiBdR9H8zqy8AVvvqLEgTgx+JmCdZ4fcbTPe4
	t1XFQwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdqK-0000000AgBY-0Rhj;
	Fri, 19 Dec 2025 17:00:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWdqH-0000000AgB0-0D4q;
	Fri, 19 Dec 2025 17:00:38 +0000
X-UUID: 39db7d9cdcfc11f08b17dd397dc63300-20251219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=UVuhF6lGp84tVTJZCL+QDfDP6haVKUY17yN4YRLiQJA=;
	b=rQxX6MvUJkJpYTT7xjfR/McVMPyn9nu2cDPUSvB3QhPBlHCuU2EPv1KRVGcg4RXdH5qNPbbZbhz9gLyUQGlZ5FXc133e+HA2+Cnik573Orj2PFQPPV64bhvw9F8wpykEdjyoAQ6KUOUp8QsMeNmoNim6UI8TfxEMST3j425lFak=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:b653d990-b933-4ae8-af8b-c7cf697b80b7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:400e63aa-6421-45b1-b8b8-e73e3dc9a90f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|51,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 39db7d9cdcfc11f08b17dd397dc63300-20251219
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <paul-pl.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 742816939; Fri, 19 Dec 2025 10:00:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 20 Dec 2025 01:00:28 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 20 Dec 2025 01:00:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZM3CwAQCcJvE2YsYZ/NVFpgIeCDaMjQvRbagAruPfnfroadl6OaAO7bEZYhMFfW2m76qNQCJ7unc5imjBdgexCb9YKKEdBJ7tZ0RPE0EHTO70IL/y/f+wFhXTVhfj/PMj2NtNE658anko9MP1PQCuYXWJL2aQBC3jx+RBsgAWx5I3rlss9r2dfMCN0udsUhCQO35VZfoCbZRYHz6xyare7th89TW3CvqIt6KRgUcEkmH2CMsL/xsHDRfyuhXTLvxWyHu5iEH7U9oCO1X/W38TwSMA12H2kKG8x/w1iMbwdkE/UBjZm8Yp9pVn9fgyZwZsV79u6Iioj2qvWD0aBaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVuhF6lGp84tVTJZCL+QDfDP6haVKUY17yN4YRLiQJA=;
 b=f0eLiRGrrbEp3SeRNgw3UN7T1uY7P3290kpZi7HxqgTEH++1lk0ofCd0UoYOFU2HanRTJ23QBapxgXFbTuyodU7mkdzduaad57/xGxPEsZYZlf6Bxo2Enrhg2vlPt13Rh22hBd6lVogGQfO1yh2MEV0kt9Wp2YXiDTWe+UvBGHm8A4O/MFb5fHJwR9VecsMZd5E46QkcvFBDXaYviDZgHH/Dc7CKItTEPFNDCSyN5ZtXZSI5FFu9u8VHUpNLkFQRDpgaSC/xs/aj6N79/HvGTWxwBgh9Pdeo89TFVl0yanI7jkif3pLXC8dIs8KzN/DeG8M/sxNYbizDeqMDPmI1OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVuhF6lGp84tVTJZCL+QDfDP6haVKUY17yN4YRLiQJA=;
 b=qRpMxyl47JVJDJDs0cFIgJ6ErzjD+JBrD4S6tc5GmOaMJkVLLbb89sRGKMHzYYQOJtLoOfSgzrAuse0g8XTunx6U3EjiuPuzsGcUOjLaQjZxUEW8ViDCUldFXUsGrfaMBSEyy6f9CEu0SiA12zT5fGEPRVIK8TWTwWrRluyPleE=
Received: from SEYPR03MB7759.apcprd03.prod.outlook.com (2603:1096:101:142::9)
 by KL1PR03MB8164.apcprd03.prod.outlook.com (2603:1096:820:ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 17:00:25 +0000
Received: from SEYPR03MB7759.apcprd03.prod.outlook.com
 ([fe80::cfde:8bcf:25af:873f]) by SEYPR03MB7759.apcprd03.prod.outlook.com
 ([fe80::cfde:8bcf:25af:873f%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 17:00:24 +0000
From: =?utf-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
To: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: =?utf-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
	=?utf-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
	=?utf-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
	=?utf-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
	<Xiandong.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, =?utf-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
	<Singo.Chang@mediatek.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH v4 13/19] drm/mediatek: Export OVL Blend function
Thread-Topic: [PATCH v4 13/19] drm/mediatek: Export OVL Blend function
Thread-Index: AQHcF/M2xPUL1czaaEi2QK4OcEP7IbSMN74AgJ2qSYA=
Date: Fri, 19 Dec 2025 17:00:24 +0000
Message-ID: <7d5a8d4e8648540b7d644c1614b169ddd7ceaab5.camel@mediatek.com>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
	 <20250828080855.3502514-14-paul-pl.chen@mediatek.com>
	 <a13a968227214194b7033795a07ad554bfacfc8a.camel@mediatek.com>
In-Reply-To: <a13a968227214194b7033795a07ad554bfacfc8a.camel@mediatek.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB7759:EE_|KL1PR03MB8164:EE_
x-ms-office365-filtering-correlation-id: 2652a04c-2887-40bf-4888-08de3f201a22
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?RVZqajRQYkVzbWVCWjdyZitrRGo0SDVNR0ZEQ3JSWWtsVnpYQzZPZTlaMU9H?=
 =?utf-8?B?TnRFazE0WllhdVplWHluaVFDQ1lsZDZCcUNDNkZoTHdQdGZrRk8yRlg0V2d6?=
 =?utf-8?B?VkYvNUdEL2tGMHhaTTZtL2l3WXNjYW1TVUpPMG5ENTJKZThmcGV5bGsyV1Za?=
 =?utf-8?B?OEpnZ1QycUlwelU2RzYreG9GN0dPWU5vZDVUVTFLci8wZWc4dXB3cjZURmk5?=
 =?utf-8?B?L25zckVpdjJzU0hLWWpITHF2ZnRXdERpaHdPZ0JuUzNubVMzUjYwMGpCckJ6?=
 =?utf-8?B?eDRaVVZXYUVjeHhnZ05xdVNvOXgzdGtObUVQY0ttQVNIUUI2eEd1dytMMG5Z?=
 =?utf-8?B?cnVMTXZCbEhZemdMWWdSRTIvd1BaWU01TWFra29ZekJIMGJZaFFmMzE2T2Mx?=
 =?utf-8?B?T1N1UzA1RnhCU3NxUm5KNEU2VlIwZUFhaDJVVUFsMTFjQ2ppTGE4ekNLRlJ2?=
 =?utf-8?B?bDVyS0dXSjBXRk5obFNQc25tdDU0Zmw4bFY0L0lMOVdaNVZxV0I3Z1NYQ0Iw?=
 =?utf-8?B?K3BDd0w3N1dQUFZpc1JxUkZ5YmpYZTBZd2wrTGFyOTdSUnlTclZ0bWxCcWtv?=
 =?utf-8?B?dUMzWUo1Qkc1MXFiRVBVSzZoc3VVSCtSKzdETjNZM2xxVTVrd1NWU1JCc3R0?=
 =?utf-8?B?MHZtY291Z216Yk1UcEZtdXZidzdhVmk4WjBoZ0dJTGRlcGlQWm55ZVpTMXc3?=
 =?utf-8?B?YWpQcW5DRUhrcmF5UjZOK2V5Vk5HMmVVYmhBclZiQ29QTFZjbHBhQTV0UG8w?=
 =?utf-8?B?Q2d6ZVFwTWdmVTkwbUYyWm5NYkxQUFNWeXFkcXZKbSsrS0t4NStvSW1ORk8y?=
 =?utf-8?B?VktKelozUEQ5Q2NWYUpPRmJkMkJPUGErVlU3eStYc1liS1dsV3RkcGt5SFVu?=
 =?utf-8?B?ZzBkSjBZdUxmOFJ0c2E3MXFVVjByZU1pUU11aDA0UVJVa1FqNGFKYjh6QnA4?=
 =?utf-8?B?QVMvYVl2SVdXM3habTdKUTJ2aTVYNlVqdjIzNUIwZlRyeWZFSjJMUEo0MDZY?=
 =?utf-8?B?VjA4WjlDbkFiakVORWNWQVVkK1dYejhIMVZIR0F3QzNvby93bmovdGpselVx?=
 =?utf-8?B?NHgxOVk0ZFd5S0d1Ly9qNzhySFQzamttanhBMU1ya0N2MG5NL2s0V005aVBI?=
 =?utf-8?B?aXlaeHFOdmVGbGFjY0pZZzJYaTlJL0xoYXh0SWV2Nkh0aDMrYXdad0h6ZHIw?=
 =?utf-8?B?em81Q1Y0ajlCTExqdk5adzU3a0VrMEdldERHRHg3Z1VQZHh0cjd0RksrUXFE?=
 =?utf-8?B?ODRPRU1KR01HU1Nzb2JybXJQRjBzVFJ0WDJiUWJ2ZGtCeE9TbktzYnRNV1lV?=
 =?utf-8?B?NHlhYU1PMGNFSmUrcjdGb0c2d0Q0dDFTcitVV1lDa2lXNmw4Z3JmZEhlNUNn?=
 =?utf-8?B?WCtWQmFnMFEvRFFtc2kyeXZDOXNPd1VoV0g4VzlOdW8wblljTDNpdnFSOUIx?=
 =?utf-8?B?ZGxHYVZWN2I0RHo1ZzNCdHZXeXRDUHMrTGRxUFBRbXRXV3cvUXJQb2wvTzl5?=
 =?utf-8?B?a0kzWkhvd0MvVzdNcjFJYitRMm8wN1J6b3hBS2VQRDQvcWpRamJtZFAzL1o2?=
 =?utf-8?B?aWNIMGs3cElpL2VaaWxuK3djcU5UVHFjaHlGS2o4ZG95VVFWdCt6dllGbFpO?=
 =?utf-8?B?WXhSVnpTbmFXL25JMDcrQ1NLMzYyaWtkWFlHM2VoRnNhWnY1RVBuemhGSDVF?=
 =?utf-8?B?eElKSjEwYzNvemFDYXRMRlI4Tno5SUFncUNQV2g2NHBMRDhVMEUwdEdPUUls?=
 =?utf-8?B?c1J1SGJhK3VSSis3NGp4bVhsVjBPOUU4MFlwZHdlaUh6dElzdHNoZEtxM29k?=
 =?utf-8?B?cGhtM0R1dFB6aXhjSE1VeU1RMUg4Z1JFNDNJbzJtdjE4TUNxSE5XOEVXRFpi?=
 =?utf-8?B?OXJpWFVPbXFNMTA3SHVTaUhQVDFVUVkyUDgvbDd0RDNDMkJLV0pGeFpzc1VC?=
 =?utf-8?B?Ry81RWpxRVdtSnV2d3NxekxyeTZqMzg5SDdTMXlEZTNweDlzZkNoOGYrdU5Y?=
 =?utf-8?B?NFRYVmlxSExpd0RXWXJNNVJhU1ovOSt4Y3FzaG5WVGlrZWpqZVpVNUgwUWpI?=
 =?utf-8?Q?9ZY+fr?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB7759.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aExuajdRM3loa0hxanlreGh5bEtFbVdaZFFzM1NpSEZEc0lPS1BJY3o1R0VR?=
 =?utf-8?B?d2ZFWWhrTG05RVM5clRURnVTK0JDczBkRjVTamtPYTU1ZE8xaFRnekMyTWRL?=
 =?utf-8?B?SEJta2l2aDEvUU00RWkwNW90UzVER1I4NlRhZFBTQUFpMHhpaFkvUmhXMlo1?=
 =?utf-8?B?ampONjBSR3d1YTNsYXIraDFDbU52MkZLckdrVnJRSUkzU29SVytibXFiNVNj?=
 =?utf-8?B?L3JHdmQvR0dHOWVhaUw5M2NjSldnUi8vU2lGVTdyZ0NtTmQ1Yk9yM2pNTkJM?=
 =?utf-8?B?T0dhaEtpN1R3YVpNK2Rjc3BBVXp2QStYUUt6VUxZOCsxNXBxTUdvVXFkZDlD?=
 =?utf-8?B?TStzNUU0Sjk0eGhhZ29nSDhoMXY2bFdJRWdveWc5andvSjZJWGxBMHF5Zndq?=
 =?utf-8?B?eEVoSVlzcWpKeUpvV2I4QjJTaWlNR1ZRNEVWWHhQMEcwR2xJME1xblE5bkhP?=
 =?utf-8?B?RTc0VTZOcHlOL3ZNV1EyMC9BMEJYbG5PQXIvcUFtZXZqcWR2K2NSR1FqZ3FW?=
 =?utf-8?B?dm0rTzdoRi84SHB2Y254MzcwWUhmdFBXanlGRFRwalBreDBQMTMwWmVvS1E5?=
 =?utf-8?B?c0x0YldrWHN2N3lweW1sbXRjTFBHSEJtd0xhNkQ5UlZRanN1Uy9INjF3NE40?=
 =?utf-8?B?QzMyL2dpU0hPQmY0ZmtTWUo5dm53TVdmd1hkTGMrNSt0VytmQS9XWnRqV1BM?=
 =?utf-8?B?bnpWWUMvcTg3TENENytKWFZEb3ZZcGtTVTNoa0FXMWIvbDBoT2phZkZyR2or?=
 =?utf-8?B?bjBmRlJ0cDlpcVl5RU1OODJTelBMb2JjVjluOUZnYk5ibUUwbHhJQnZnaURG?=
 =?utf-8?B?TWVuenhrVTF2WUdJN0VnTnlQL0lsRlNxVkp1SzNzRDFvbE1MMkNCa3EyNFdk?=
 =?utf-8?B?djNUcUlNRHg5eEQ4M1I2bkE0cE1DUm9FS0k5Q1J4d0syT040L3BaQURJQWtD?=
 =?utf-8?B?L1FWb3VOVStGQmowdWFrdTV2ZmZPQ2o4WTVtOEFoNi9wOVptek5IMkVNbC9V?=
 =?utf-8?B?dzNrUEZNczhsSzJRRHpSeTd2blVHOHE1aU8vZ1FVMjZPaENhM2Z4QXpMYTk4?=
 =?utf-8?B?ajY1czIwdFNFbm5USlBxY2VtdVpQQVNUZll3K1haRWdzbTc5UVpFcTVtNkNS?=
 =?utf-8?B?OVJxWk1YY3Y2bE43VjBORnJUNkNEUGFGemFkek5pdHZSSG1PbzR2bndnY2hC?=
 =?utf-8?B?WE9zakRYenUvRnRsRm9QRFc0T3g1d3RFbmxBYzVGTUh3OHpMTjh1YjR2dU5Z?=
 =?utf-8?B?WlRlYnJFSXJKazVRS2pDVndLbGkwczd2M2hJS3NrSzgwUW5GcjFmZUU5aGpE?=
 =?utf-8?B?SzIxbHJqcWlDdWFzMFRBMTdReHdCR2JwYkh1dGNsRmt3TzNyUkRpUU5GVEJu?=
 =?utf-8?B?M3FTQ0JHQ2RsTkRRZVlnZmI5SHRtQTJQeHA2cE5ocXhjVFVFb1crWndSMFY5?=
 =?utf-8?B?ZVJMVkZyWFpBQVRISEFJRHFNalN1bFpKd3YzUVZvOENJMUh4V1VDOWxMRzJs?=
 =?utf-8?B?UjBUS1lSa21Sd3ZTUnVPZmZPY2FMaTVSS1lFSTI0UWJWOTl5ZzFoL3lIcjhZ?=
 =?utf-8?B?M1kxSUttUnJUVE9OY3lMSmVNVEMyQXFWSk5KL2ZUcTBUVnp6QU80eGorS2hZ?=
 =?utf-8?B?RE9jQVgvQVNMMUJ5QVlQNGh3YjdReEZuY2FBZFAzdFhCUEM4dzY0MXlTaHI5?=
 =?utf-8?B?ZGMrQW83TlJXYzd3TnVaSTVKL2xPclVNZGhJOFV3ckl1bnF1Sjd0YThiZ2lh?=
 =?utf-8?B?K1JLbUMrc3F6K2V5aUk1SDM1Yk92VkplYXlrWmxuSk95Vm5qQk1IK1Vpd2s1?=
 =?utf-8?B?VlF3NXRtMlJWRWlxYitTbzhaaWc5TU51eWllQkp0eG5ZYmJZMzlGZjBHZm5u?=
 =?utf-8?B?NFJhdVhsYXZNQ1p2ZGsxTHZMTEgxZ0Q5NXpEZndWYjQzcG1kWDFlOG42SXlh?=
 =?utf-8?B?U0RDaVJlYUFTRHVKYlBncHl2bDZSaVNjR1QrblZ5RUtEb2wvQXNTc2tqb2FR?=
 =?utf-8?B?NmRUdTlXQjJVUDJCdUNJNWZzU3hES3pYL0hielRCVVY2L1IvUzVSZURXdnVV?=
 =?utf-8?B?MVFzTkdGOWU2L1dPQzdSS0NrKzh1YndoNEQrZklhV0xzZkh4dkFhVm1RUXlE?=
 =?utf-8?B?aXB6SmNibTM4T1B4SkpTQ09tOWRtWlk2RzVwY0hwUW1tY0FaVUNENjREeDFX?=
 =?utf-8?B?R3RKWDRHNXlTUVdpY01CRFc5YS9HdHVwZmRVaHpaUGFPUjAzK1pHMnM3QU91?=
 =?utf-8?B?VWJaT2pwVUROQnBPNGtlSTR3eXBRWUhBZWhseDBlck5JNklCeGU3VWdTODgx?=
 =?utf-8?B?N1lMRXJsejN1SlluejJSY2ZxUk4raHdlbXJXM0NZUmlRUU1nT2VWWEIzTWFv?=
 =?utf-8?Q?Pl0DupPyxC8OxtPQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <27660CD879F0A440A9951DBF98413321@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB7759.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2652a04c-2887-40bf-4888-08de3f201a22
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 17:00:24.3049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8VrkISpQpsG1oRLanSkiSjagzpmC6SzK4VyLXQ2HaVd9YO+V2lQxK0eP/hTrYxhAZpG4jDwW6okBwTJ/xyD08pbhGIERYnBfYk6r2qP2BdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_090037_109737_8CCEAB2F 
X-CRM114-Status: GOOD (  20.60  )
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

T24gV2VkLCAyMDI1LTA5LTEwIGF0IDA5OjE4ICswMDAwLCBDSyBIdSAo6IOh5L+K5YWJKSB3cm90
ZToNCj4gT24gVGh1LCAyMDI1LTA4LTI4IGF0IDE2OjA3ICswODAwLCBQYXVsIENoZW4gd3JvdGU6
DQo+ID4gRnJvbTogUGF1bC1wbCBDaGVuIDxwYXVsLXBsLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiA+
IA0KPiA+IEZvciB0aGUgbmV3IEJMRU5ERVIgY29tcG9uZW50LCB0aGUgT1ZMIGlnbm9yZSBwaXhl
bCBhbHBoYSBsb2dpYw0KPiA+IHNob3VsZCBiZSBleHBvcnRlZCBhcyBhIGZ1bmN0aW9uIGFuZCBy
ZXVzZWQgaXQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogTmFuY3kgTGluIDxuYW5jeS5saW5A
bWVkaWF0ZWsuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwtcGwgQ2hlbiA8cGF1bC1wbC5j
aGVuQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZGlzcF9vdmwuYyB8IDY4ICsrKysrKysrKysrKysrKysrLS0tLQ0KPiA+IC0tLS0NCj4g
PiDCoGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuaCB8wqAgOCArKysNCj4g
PiDCoDIgZmlsZXMgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+
ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dmwuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ID4g
aW5kZXggZTNlZTNmNjBmNGJhLi43Y2QzOTc4YmViOTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jDQo+ID4gQEAgLTIyOCw2ICsyMjgsMjMgQEAgdm9p
ZCBtdGtfb3ZsX2Rpc2FibGVfdmJsYW5rKHN0cnVjdCBkZXZpY2UNCj4gPiAqZGV2KQ0KPiA+IMKg
CXdyaXRlbF9yZWxheGVkKDB4MCwgb3ZsLT5yZWdzICsgRElTUF9SRUdfT1ZMX0lOVEVOKTsNCj4g
PiDCoH0NCj4gPiDCoA0KPiA+ICtib29sIG10a19vdmxfaXNfaWdub3JlX3BpeGVsX2FscGhhKHN0
cnVjdCBtdGtfcGxhbmVfc3RhdGUgKnN0YXRlLA0KPiA+IHVuc2lnbmVkIGludCBibGVuZF9tb2Rl
KQ0KPiA+ICt7DQo+ID4gKwlpZiAoIXN0YXRlLT5iYXNlLmZiKQ0KPiA+ICsJCXJldHVybiBmYWxz
ZTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICogQWx0aG91Z2ggdGhlIGFscGhhIGNoYW5uZWwg
Y2FuIGJlIGlnbm9yZWQsIENPTlNUX0JMRA0KPiA+IG11c3QgYmUgZW5hYmxlZA0KPiA+ICsJICog
Zm9yIFhSR0IgZm9ybWF0LCBvdGhlcndpc2UgT1ZMIHdpbGwgc3RpbGwgcmVhZCB0aGUNCj4gPiB2
YWx1ZSBmcm9tIG1lbW9yeS4NCj4gPiArCSAqIEZvciBSR0I4ODggcmVsYXRlZCBmb3JtYXRzLCB3
aGV0aGVyIENPTlNUX0JMRCBpcw0KPiA+IGVuYWJsZWQgb3Igbm90IHdvbid0DQo+ID4gKwkgKiBh
ZmZlY3QgdGhlIHJlc3VsdC4gVGhlcmVmb3JlIHdlIHVzZSAhaGFzX2FscGhhIGFzIHRoZQ0KPiA+
IGNvbmRpdGlvbi4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKGJsZW5kX21vZGUgPT0gRFJNX01PREVf
QkxFTkRfUElYRUxfTk9ORSB8fCAhc3RhdGUtDQo+ID4gPmJhc2UuZmItPmZvcm1hdC0+aGFzX2Fs
cGhhKQ0KPiA+ICsJCXJldHVybiB0cnVlOw0KPiA+ICsNCj4gPiArCXJldHVybiBmYWxzZTsNCj4g
PiArfQ0KPiA+ICsNCj4gPiDCoHUzMiBtdGtfb3ZsX2dldF9ibGVuZF9tb2RlcyhzdHJ1Y3QgZGV2
aWNlICpkZXYpDQo+ID4gwqB7DQo+ID4gwqAJc3RydWN0IG10a19kaXNwX292bCAqb3ZsID0gZGV2
X2dldF9kcnZkYXRhKGRldik7DQo+ID4gQEAgLTQxNCw2ICs0MzEsMjkgQEAgdm9pZCBtdGtfb3Zs
X2xheWVyX29mZihzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gdW5zaWduZWQgaW50IGlkeCwNCj4g
PiDCoAkJwqDCoMKgwqDCoCBESVNQX1JFR19PVkxfUkRNQV9DVFJMKGlkeCkpOw0KPiA+IMKgfQ0K
PiA+IMKgDQo+ID4gK3Vuc2lnbmVkIGludCBtdGtfb3ZsX2dldF9ibGVuZF9tb2RlKHN0cnVjdCBt
dGtfcGxhbmVfc3RhdGUgKnN0YXRlLA0KPiA+IHVuc2lnbmVkIGludCBibGVuZF9tb2RlcykNCj4g
PiArew0KPiA+ICsJdW5zaWduZWQgaW50IGJsZW5kX21vZGUgPSBEUk1fTU9ERV9CTEVORF9DT1ZF
UkFHRTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICogRm9yIHRoZSBwbGF0Zm9ybXMgd2hlcmUg
T1ZMX0NPTl9DTFJGTVRfTUFOIGlzIGRlZmluZWQNCj4gPiBpbiB0aGUgaGFyZHdhcmUgZGF0YSBz
aGVldA0KPiA+ICsJICogYW5kIHN1cHBvcnRzIHByZW11bHRpcGxpZWQgY29sb3IgZm9ybWF0cywg
c3VjaCBhcw0KPiA+IE9WTF9DT05fQ0xSRk1UX1BBUkdCODg4DQo+ID4gKwkgKiBhbmQgc3VwcG9y
dHMgcHJlbXVsdGlwbGllZCBjb2xvciBmb3JtYXRzLCBzdWNoIGFzDQo+ID4gT1ZMX0NPTl9DTFJG
TVRfUEFSR0I4ODg4Lg0KPiA+ICsJICoNCj4gPiArCSAqIENoZWNrIGJsZW5kX21vZGVzIGluIHRo
ZSBkcml2ZXIgZGF0YSB0byBzZWUgaWYNCj4gPiBwcmVtdWx0aXBsaWVkIG1vZGUgaXMgc3VwcG9y
dGVkLg0KPiA+ICsJICogSWYgbm90LCB1c2UgY292ZXJhZ2UgbW9kZSBpbnN0ZWFkIHRvIHNldCBp
dCB0byB0aGUNCj4gPiBzdXBwb3J0ZWQgY29sb3IgZm9ybWF0cy4NCj4gPiArCSAqDQo+ID4gKwkg
KiBDdXJyZW50IERSTSBhc3N1bXB0aW9uIGlzIHRoYXQgYWxwaGEgaXMgZGVmYXVsdA0KPiA+IHBy
ZW11bHRpcGxpZWQsIHNvIHRoZSBiaXRtYXNrIG9mDQo+ID4gKwkgKiBibGVuZF9tb2RlcyBtdXN0
IGluY2x1ZGUgQklUKERSTV9NT0RFX0JMRU5EX1BSRU1VTFRJKS4NCj4gPiBPdGhlcndpc2UsIG10
a19wbGFuZV9pbml0KCkNCj4gPiArCSAqIHdpbGwgZ2V0IGFuIGVycm9yIHJldHVybiBmcm9tDQo+
ID4gZHJtX3BsYW5lX2NyZWF0ZV9ibGVuZF9tb2RlX3Byb3BlcnR5KCkgYW5kDQo+ID4gKwkgKiBz
dGF0ZS0+YmFzZS5waXhlbF9ibGVuZF9tb2RlIHNob3VsZCBub3QgYmUgdXNlZC4NCj4gPiArCSAq
Lw0KPiA+ICsJaWYgKGJsZW5kX21vZGVzICYgQklUKERSTV9NT0RFX0JMRU5EX1BSRU1VTFRJKSkN
Cj4gPiArCQlibGVuZF9tb2RlID0gc3RhdGUtPmJhc2UucGl4ZWxfYmxlbmRfbW9kZTsNCj4gPiAr
DQo+ID4gKwlyZXR1cm4gYmxlbmRfbW9kZTsNCj4gPiArfQ0KPiA+ICsNCj4gPiDCoHVuc2lnbmVk
IGludCBtdGtfb3ZsX2ZtdF9jb252ZXJ0KHVuc2lnbmVkIGludCBmbXQsIHVuc2lnbmVkIGludA0K
PiA+IGJsZW5kX21vZGUsDQo+ID4gwqAJCQkJIGJvb2wgZm10X3JnYjU2NV9pc18wLCBib29sDQo+
ID4gY29sb3JfY29udmVydCwNCj4gPiDCoAkJCQkgdTggY2xyZm10X3NoaWZ0LCB1MzIgY2xyZm10
X21hbiwNCj4gPiB1MzIgYnl0ZV9zd2FwLCB1MzIgcmdiX3N3YXApDQo+ID4gQEAgLTU0MSw3ICs1
ODEsNyBAQCB2b2lkIG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4g
PiB1bnNpZ25lZCBpbnQgaWR4LA0KPiA+IMKgCXVuc2lnbmVkIGludCByb3RhdGlvbiA9IHBlbmRp
bmctPnJvdGF0aW9uOw0KPiA+IMKgCXVuc2lnbmVkIGludCBvZmZzZXQgPSAocGVuZGluZy0+eSA8
PCAxNikgfCBwZW5kaW5nLT54Ow0KPiA+IMKgCXVuc2lnbmVkIGludCBzcmNfc2l6ZSA9IChwZW5k
aW5nLT5oZWlnaHQgPDwgMTYpIHwgcGVuZGluZy0NCj4gPiA+d2lkdGg7DQo+ID4gLQl1bnNpZ25l
ZCBpbnQgYmxlbmRfbW9kZSA9IHN0YXRlLT5iYXNlLnBpeGVsX2JsZW5kX21vZGU7DQo+ID4gKwl1
bnNpZ25lZCBpbnQgYmxlbmRfbW9kZSA9IG10a19vdmxfZ2V0X2JsZW5kX21vZGUoc3RhdGUsDQo+
ID4gb3ZsLT5kYXRhLT5ibGVuZF9tb2Rlcyk7DQo+IA0KPiBXaHkgeW91IGNoYW5nZSBiZWhhdmlv
ciBoZXJlPw0KPiBPcmlnaW5hbGx5LCAnYmxlbmRfbW9kZSA9IHN0YXRlLT5iYXNlLnBpeGVsX2Js
ZW5kX21vZGUnIGRpcmVjdGx5Lg0KPiBCdXQgdGhpcyBwYXRjaCBhZGQgYSBjaGVjayBhbmQgYmxl
bmRfbW9kZSBtYXkgYmUNCj4gRFJNX01PREVfQkxFTkRfQ09WRVJBR0UuDQo+IFRoZSBiZWhhdmlv
ciBjaGFuZ2VzLiBXaHkgY2hhbmdlIHRoaXMgYmVoYXZpb3I/DQo+IA0KSXQncyBmb3IgY29udmVu
aWVudCB0byBvcHRpbWl6ZSB0aGUgbG9naWMgZGVzaWduLiANCj4gPiDCoAl1bnNpZ25lZCBpbnQg
aWdub3JlX3BpeGVsX2FscGhhID0gMDsNCj4gPiDCoAl1bnNpZ25lZCBpbnQgY29uOw0KPiA+IMKg
DQo+ID4gQEAgLTU2NiwxNyArNjA2LDggQEAgdm9pZCBtdGtfb3ZsX2xheWVyX2NvbmZpZyhzdHJ1
Y3QgZGV2aWNlICpkZXYsDQo+ID4gdW5zaWduZWQgaW50IGlkeCwNCj4gPiDCoAkJICogRm9yIGJs
ZW5kX21vZGVzIHN1cHBvcnRlZCBTb0NzLCBhbHdheXMgZW5hYmxlDQo+ID4gYWxwaGEgYmxlbmRp
bmcuDQo+ID4gwqAJCSAqIEZvciBibGVuZF9tb2RlcyB1bnN1cHBvcnRlZCBTb0NzLCBlbmFibGUg
YWxwaGENCj4gPiBibGVuZGluZyB3aGVuIGhhc19hbHBoYSBpcyBzZXQuDQo+ID4gwqAJCSAqLw0K
PiA+IC0JCWlmIChibGVuZF9tb2RlIHx8IHN0YXRlLT5iYXNlLmZiLT5mb3JtYXQtDQo+ID4gPmhh
c19hbHBoYSkNCj4gPiArCQlpZiAoc3RhdGUtPmJhc2UucGl4ZWxfYmxlbmRfbW9kZSB8fCBzdGF0
ZS0NCj4gPiA+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpDQo+ID4gwqAJCQljb24gfD0gT1ZM
X0NPTl9BRU47DQo+ID4gLQ0KPiA+IC0JCS8qDQo+ID4gLQkJICogQWx0aG91Z2ggdGhlIGFscGhh
IGNoYW5uZWwgY2FuIGJlIGlnbm9yZWQsDQo+ID4gQ09OU1RfQkxEIG11c3QgYmUgZW5hYmxlZA0K
PiA+IC0JCSAqIGZvciBYUkdCIGZvcm1hdCwgb3RoZXJ3aXNlIE9WTCB3aWxsIHN0aWxsIHJlYWQN
Cj4gPiB0aGUgdmFsdWUgZnJvbSBtZW1vcnkuDQo+ID4gLQkJICogRm9yIFJHQjg4OCByZWxhdGVk
IGZvcm1hdHMsIHdoZXRoZXIgQ09OU1RfQkxEDQo+ID4gaXMgZW5hYmxlZCBvciBub3Qgd29uJ3QN
Cj4gPiAtCQkgKiBhZmZlY3QgdGhlIHJlc3VsdC4gVGhlcmVmb3JlIHdlIHVzZSAhaGFzX2FscGhh
DQo+ID4gYXMgdGhlIGNvbmRpdGlvbi4NCj4gPiAtCQkgKi8NCj4gPiAtCQlpZiAoYmxlbmRfbW9k
ZSA9PSBEUk1fTU9ERV9CTEVORF9QSVhFTF9OT05FIHx8DQo+ID4gIXN0YXRlLT5iYXNlLmZiLT5m
b3JtYXQtPmhhc19hbHBoYSkNCj4gPiAtCQkJaWdub3JlX3BpeGVsX2FscGhhID0gT1ZMX0NPTlNU
X0JMRU5EOw0KPiA+IMKgCX0NCj4gPiDCoA0KPiA+IMKgCS8qDQo+ID4gQEAgLTYwMiw2ICs2MzMs
OSBAQCB2b2lkIG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiB1
bnNpZ25lZCBpbnQgaWR4LA0KPiA+IMKgDQo+ID4gwqAJbXRrX2RkcF93cml0ZV9yZWxheGVkKGNt
ZHFfcGt0LCBjb24sICZvdmwtPmNtZHFfcmVnLCBvdmwtDQo+ID4gPnJlZ3MsDQo+ID4gwqAJCQnC
oMKgwqDCoMKgIERJU1BfUkVHX09WTF9DT04oaWR4KSk7DQo+ID4gKw0KPiA+ICsJaWYgKG10a19v
dmxfaXNfaWdub3JlX3BpeGVsX2FscGhhKHN0YXRlLCBibGVuZF9tb2RlKSkNCj4gPiArCQlpZ25v
cmVfcGl4ZWxfYWxwaGEgPSBPVkxfQ09OU1RfQkxFTkQ7DQo+ID4gwqAJbXRrX2RkcF93cml0ZV9y
ZWxheGVkKGNtZHFfcGt0LCBwaXRjaF9sc2IgfA0KPiA+IGlnbm9yZV9waXhlbF9hbHBoYSwNCj4g
PiDCoAkJCcKgwqDCoMKgwqAgJm92bC0+Y21kcV9yZWcsIG92bC0+cmVncywNCj4gPiBESVNQX1JF
R19PVkxfUElUQ0goaWR4KSk7DQo+ID4gwqAJbXRrX2RkcF93cml0ZV9yZWxheGVkKGNtZHFfcGt0
LCBzcmNfc2l6ZSwgJm92bC0+Y21kcV9yZWcsDQo+ID4gb3ZsLT5yZWdzLA0KPiANCg0K

