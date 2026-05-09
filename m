Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63179CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 08:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fc03Gu8eMGQDK+oOxQfvqEu92pxqwdYZTtDJA3AdJO0=; b=Ddgdd/iO3EJg7E7xDk5b/cRlzI
	TANo7lYdRhTy7tUziE80/s/rupzWBwlFG+/ElUuS67E3H1H53NDIj8rsLynOK2RT4KPR/tWntIs0L
	uXTS2fjhZvQgAbzlMJJASJVRMU5FCKXu62SZXM+8m0S8OfPSvwqds8foF9ylse5SOo5ki/ciSpJ/6
	CqLWjJ5wJ0UvfHHAicuBzV2X7gexhkc40vBXaVM//6gyBM5NiyWCatkSNxXyWfwoPgsT3y6189I4X
	geSbpEO2s8VzT5lGvxiQn/4LkjKABMT7y/VQN4fqAaVqFkn3jO1265iXfraXrgS74oTukVqEqnm7V
	JuT5/QVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLccy-00000008Xn4-0FQy;
	Sat, 09 May 2026 08:01:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLccP-00000008XjQ-3QvD;
	Sat, 09 May 2026 08:01:34 +0000
X-UUID: 362689684b7d11f19f231fa534c5cac8-20260509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Fc03Gu8eMGQDK+oOxQfvqEu92pxqwdYZTtDJA3AdJO0=;
	b=MIBeWheZqJ2mOei6ueoHtsmEg/ShuwvuXvPfY7SVXdaKiGp/gduEn7FeRXorkMJ9aCgnkh9hLdenuFfTJv5lPudy2E3+Blea7FtiohpxySreXPr4q6SzE2/57rOQlRS6JO7gUSUHNBO6ZLdNxDYNoKGATYwfsfS8QPJ7/k8tnxk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f7bed1f5-3fae-40f2-9dd4-cd4d83aa3f18,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:309d1abf-65a8-4b41-ac18-3671578a914d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:ni
	l,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 362689684b7d11f19f231fa534c5cac8-20260509
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2028074719; Sat, 09 May 2026 01:00:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 9 May 2026 16:00:55 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 9 May 2026 16:00:55 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8p7zqOBx7reeE17Gg6zFEc0U010WIiA27bVViF50vfJ9Q+ZSqS86NsMOZtqgyh26Yrpb5VlApa+RYxc4Gs/qd3VK7GPl7Qhop8E6JPLsMZ2D4DWTYhAVCojL71hI5GoY8hBlkRqoaclAdqNn0QD/gbITlJJNcGUm6ZAAZ9Wl9Vk/DSOZKDByfv0gwwif5+Ml6pUi0GHgtlgx8huDib8TTwE+93NOVE485BSlIWF0Q9wJ41+uLF/92edPWrWU6LWinujfZEe2WX8B42W1ypeQZXKpjMoCNbjtGsPHdFFljo7idyDWvk6aH/jIfMz+Z1WpJc+WC7KV195rLSMbR9t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fc03Gu8eMGQDK+oOxQfvqEu92pxqwdYZTtDJA3AdJO0=;
 b=SfcgGL0hG1IrHlw39UyTice3QmOwn/VgpJFlTcYyldNW0BiGMqZhhty6BoAFZccoI7JzSoIDKfBmZnzc1HI+oMbWcg1KCJLr9cn/jYxc5BqzeNUZu4yNqchzeEIk657eFRe6JJV4nEoSDISQAdrmICQPIVJjSZwPRp5zQi7fLzmKMmo7lQFpqIshdC2YtROvZzJDAC/LhOIT4+v8V54HHAxQ1oEvXZQiiosVcicZcHktLYy1I4VmtdLstZWOuC52t5wDQXByY3y4KxdK/05hMwnfq1mgBkKyzGmVhOykJpmXLeSuC1Nu9RlcLR6j8oU6vKNc60qAA0B+hCADsFEZwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc03Gu8eMGQDK+oOxQfvqEu92pxqwdYZTtDJA3AdJO0=;
 b=m+Wf8i1b2Dz1RJ8Ft56VwP3bpbQyZtzI9RttNSsPQKad6jsiqykgiY/n52MIUl8iS+vzZlrCL+++JDyudVLueOyXf7yEzhAJCUhkSYM0wCE8mIwj7ZnxkpKZgEihvPojz+ruXR9DEcce/XH63MfXtQ9YC/NF+hrERL8KgQQ6xLM=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 TYZPR03MB7412.apcprd03.prod.outlook.com (2603:1096:400:41b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.10; Sat, 9 May 2026
 08:00:52 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dee:7e1:7d2:c310]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dee:7e1:7d2:c310%7]) with mapi id 15.21.0025.012; Sat, 9 May 2026
 08:00:51 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?WmhlbmduYW4gQ2hlbiAo6ZmI5b6B5Y2XKQ==?=
	<Zhengnan.Chen@mediatek.com>, "krzk@kernel.org" <krzk@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [RESEND,v2 2/2] memory: mtk-smi: Add mt8189 support
Thread-Topic: [RESEND,v2 2/2] memory: mtk-smi: Add mt8189 support
Thread-Index: AQHc1hREs93+U0jvT02AKfBVa6OqUrYFZ74A
Date: Sat, 9 May 2026 08:00:51 +0000
Message-ID: <270f6f8845c5009e5bc96f8a4c4b947aaf89131e.camel@mediatek.com>
References: <20260427070444.20247-1-zhengnan.chen@mediatek.com>
	 <20260427070444.20247-3-zhengnan.chen@mediatek.com>
In-Reply-To: <20260427070444.20247-3-zhengnan.chen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|TYZPR03MB7412:EE_
x-ms-office365-filtering-correlation-id: 5e0dc2f0-c914-4bcf-8491-08deada11689
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: P7X85pZzPJwczpPtj52kM5j4NJFCXDazuuesQTFH3O4HB6x/l3bTylQTM9Vd06ul05m+cYF7oqE4ioBBsqBNrWXrcGFoX+9OK2IqMu/D9zF/TKVaEsL6vjY2ZCJZs60+q8VKLoCUWJrU+hwFu3nBXzgsIJ9VF20JD4Kxwyg0QCl8n93qnczdeEfOPyVwnY1YE0+Ah2+GaYd7o4nTppMJ2Mer56dqT1tUS5mezFxJBNUICEu63a6yg/NAm8bLMTUL9vhzx/Qv4fYaQFuG17WwV6DaRrtbucDTnaB292NSPmpUg/vpKop5WY+rRj1lZhUnHPyXjFtZ3fXctr953kZIBuykNRZgazcaAOMZnnkTZgJU57zoMsJ0HyI+dhGrTwy+9Bq3zNFgUOYFoTSzk5TBrpCcJ5Fg+2UxGY4lCLn1dSJi3xzmsNqog4lgriDv8+wEU03QOJmqFcRgrcWiEE+SWGBblisHqd16RKFECBWgLWOoxVdBobWBAsbi5gZGAe2mPBWBwXdYmupBwUb+gGQCQt5MlrQ8HifBs3YSaWUD3iedK/aJThR3PoRxa1R2MbNZO4D+bNnwzmCxHVuv7w6GnM2sr71wdnBKmkGCrAc8ueNHQ+zDvdqfe1u6qE9RpCHN+K/P/Byv1aQcJ1Un+pNY1vJ/Nj7h63PnvSWqhZxG2C8Noq3Ej5FeI1qD7ObYAeIab2hyPf8KxYiIX9mnn/PHHuhYwefS828butBeVFhodJ7yQ7j81D7xvPwbQDhjiHP7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1JYZGNURkhmOGNLS21RWHRKMU5ILzFQYmU1OGNybEJVTTBSRmU0blIvRDVt?=
 =?utf-8?B?Mlh1eGcwRmxaRDVtREdkcjAxWUFFWWpyWXNidGdoVUlwMEhxRzZQT1lrcUJP?=
 =?utf-8?B?RFd2WG5SL05vemN1eWlMYlpvcUo2VnpFKzBMOVJISVZlZWNNUTR1Q2syVVZ2?=
 =?utf-8?B?RFdWcG1OSDNMRnU1VmtDQkpWSEt4OGx6bTlMVTQyL2xGU3IxK2x2UjI5U0Fh?=
 =?utf-8?B?ZUZjbXZNd3BYcithYTAxQzloTnBTRmt6L3E3dVAxdk1HVGVMZzZBSlZ5Tjlp?=
 =?utf-8?B?OVFsUXVjclRTL2Ric281cGRnUWdtT09Sd1FON1ljTnVwR1BKNktvUlZFU094?=
 =?utf-8?B?SkErOFFmOFZUd2FKTnNZTUpJdGp2eVJNR0dwVUtBMG9ua1l1VkhSeFJUbFJF?=
 =?utf-8?B?d0JiR0RIWmZ6VXJQeUdZTE9SWXdVdkM3QjBTNHNTK1ZoOFlHazdEZVdYR0Rq?=
 =?utf-8?B?cEhwNlNoUG9QbnpHQ05pZkM3R1Mrdm9veks2WHpSL09xWHdicXJ1R3lCVytz?=
 =?utf-8?B?YnpYY2wxOUs2SzRvQW1IaDdzbU8vVVBaSWNkcjlMcmk2VjdIWW1PQm9YL0Jj?=
 =?utf-8?B?YzNzWlZsSFQ2cjh1YVcrV2Z3b1NBdWZPZmQwZEcwaG1PQzR5TkgzWTN1VGQ4?=
 =?utf-8?B?WnNJMmNpZWZyMjNoMVZvZndGT2JWeXRHTml3aGlhZUt2RVIwQXF6amllZHdK?=
 =?utf-8?B?UDNNYnU4Sk1ndnNYa1l4SzNQWGljVWVUa1RVRFhDNXFhbGQwU080QW9tazFN?=
 =?utf-8?B?eGwxUUhkV2srYkpWcElMeTE4dzdac1dYNExOV3Ryc0g0U0ozRUNZWDRIanY0?=
 =?utf-8?B?Z2VaUHNsUEprbnlvZTA3UlZaOGFIYkdmcDZIdXYyT3k3Z2F6cDZ5S0owY3o5?=
 =?utf-8?B?VWZyd2cxQmcrVGpSMTJWN040MjgvWHdBMUhUOGE4blNKQTZsSFpTOXA5ZXNu?=
 =?utf-8?B?bnZ1bUJSMjQvS0Z0RENKVFVZMHExeWMrUXVUZlkwUXhmTEpoZTVaVDFOaWdi?=
 =?utf-8?B?M202THJpQ1ZFbTI0Wmtid2hqK0pzKzJFczlaZzdzWXFKbEVvQzZ1K21nK3pu?=
 =?utf-8?B?NlZIT3JrRXNDM0xkR25zSnZqdVJGN3BtdkZBcWpJSGtkbm9lM25oOGZSdG00?=
 =?utf-8?B?U0ZZeFRSdVdOelJiM21oRWVCL0ZYellUYndtOFpHa1BONThZRzl1ZE8wdU9S?=
 =?utf-8?B?R2k5YUJTbElFQW5LdHN3Uk51VytIeHNHb0wySVZKeEFGdm95ZmJzRzVPNDBx?=
 =?utf-8?B?cHVOekxvTnJ5WHRDcEtpNzcyY0NDQXhUMkVpQVNxNlpmY3FKeHEzQ2tJaWFk?=
 =?utf-8?B?bHVVWWIxeGNCUExpNng3YmpJcmFFZXdUdUt0SnBHbjZkQ3AzbS83dHBsZHVX?=
 =?utf-8?B?ZTNuRDR2MGZZeVJreDI0eHl4TSszY3RGdWVpdjZodkdVQnd1SHBSbVBZeVZz?=
 =?utf-8?B?bUJXNzlLK2tGRDR3clh6aWlyK0dtNFFsWXJXck9UaFNsUzJFQURLTEdZQ1Bp?=
 =?utf-8?B?cWMrUUZmSjMxZ2xIRXBjbGplZUxhUGFIeGY3aXg3YnVLdHJkT1pEcHREcmVx?=
 =?utf-8?B?aDhkUkJVb21Fc21vNmwvSGF2SllES0U0NVRodEhWTlU2aFBiWlNWdS9mZ0Jp?=
 =?utf-8?B?OHpIUHRlTXB2K0RQUUlWdFRzcGxsSzRlOUFhSnFQcWliU2hXNlc4dWpuUEJw?=
 =?utf-8?B?TUlKOHRyQkMzckVEWVk0SHFSTU9Wak13OVJ0cW9TbVVSTzI5bFpFeUVkYjMz?=
 =?utf-8?B?eVZBSnphQWxmKzVMU2xjbU1jQVdLc29CZDg0aklabjJ5THJ4dnlxSjl1eUxO?=
 =?utf-8?B?UzJRK3pkOVFFanY4bk83Yk55aUhFY0hKUnVXdjZzbU5zWWJwdGdpL0lIVzUz?=
 =?utf-8?B?VklyZENEUWx1b0NLRXZPTE5xNFlGUzdaUGFqMVZYK2hKRXdSYk9PSUI4K3No?=
 =?utf-8?B?NWR4N1loVXpsQjNwWlRENTFPWnZzTExTNHZkVVFZNmxlUThBQkRsUUhuUXc5?=
 =?utf-8?B?RHlpNDhZMjJkcjFLMFlQUFlnQzBkUDlTR1RFWUFnNldFNVhxTjBKNnFWZzlZ?=
 =?utf-8?B?R0lSSlpqOWMrZk4wUWlLUFVhbW1wbUU2dXRuR2pwc2EzRTk0VG1hcE9scjNO?=
 =?utf-8?B?SGFxK3RoVkNCaFg2NUt2RmhZU2Vpb2FqMUI1RlJ4QXhqMDQyQlFQcWt6WGNQ?=
 =?utf-8?B?N3pzVFZZR3BYNzE3YllBdU5KajhoL05RRC9uak1seVE4NEx6OEQrYzF4ajEw?=
 =?utf-8?B?WUtLTnM4RC9KTlVwZm5wVHhvSkxQZitZWDFCQ1lqRG5jVkNheFZNc0x1RnVa?=
 =?utf-8?B?TTJhV0p0ZzA3UVhmR3NkaFJ5SVpqZnpmUU5pbVhSYk1kT01DTEFEQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B41E2492EF97394C89B3B32B14A066E0@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VWAl0wkv6fdwUZQHgKAYmsJOTtgOGGxjFAYMt8vHoHfB3pwmbQsjfCGC8IJZnFlF3pJupLjt4ELykVCqnD+EDJF5cj9icY5JE52cSEA2xf9vFeHx/M5EpGb87e2ztzPa619N6FnHh+w2o0Q5uY1Kk66nFoCt2WRwLCCDDyDZ+E7b7XpDB+ZYXSFTTRgQT+E/2YKDskM+VHx6kWINzLeqcZrD1vK/id7BGJ2BfkKM0OS2u2DsJ2CB3EFERfEyVZn9eLRoa5TOH4k2LO5VyjTIOXZ6UvukR4an7YvMoeT7t6MjU7ppUxqJ5jrz2GSppI02fDmKNzrMH6XCPYogiXj7yA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0dc2f0-c914-4bcf-8491-08deada11689
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2026 08:00:51.2449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZMrOydq3mkk2Ess4bCPyIQi43A3khKHOp/quL8gXD+2IVC2rgyTPUJK2dwpXa0TAkW5NF3zFSYaluGW9nMcrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7412
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_010101_891894_C86B19D4 
X-CRM114-Status: UNSURE (   9.84  )
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

T24gTW9uLCAyMDI2LTA0LTI3IGF0IDE1OjA0ICswODAwLCBtdGsyMDg5OCB3cm90ZToNCj4gRnJv
bTogWmhlbmduYW4gQ2hlbiA8emhlbmduYW4uY2hlbkBtZWRpYXRlay5jb20+DQo+IA0KPiBBZGQg
dGhlIG5lY2Vzc2FyeSBwbGF0Zm9ybSBkYXRhIGFuZCBvc3RkbCBzZXR0aW5nIHRvIGVuYWJsZSBz
dXBwb3J0DQo+IGZvciBtdDgxODkgc21pLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWmhlbmduYW4g
Q2hlbiA8emhlbmduYW4uY2hlbkBtZWRpYXRlay5jb20+DQo+IFJldmlld2VkLWJ5OiBBbmdlbG9H
aW9hY2NoaW5vIERlbCBSZWdubyA8DQo+IGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFi
b3JhLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL21lbW9yeS9tdGstc21pLmMgfCA0NA0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
NDQgaW5zZXJ0aW9ucygrKQ0KDQoNClJldmlld2VkLWJ5OiBZb25nIFd1IDx5b25nLnd1QG1lZGlh
dGVrLmNvbT4NCg==

