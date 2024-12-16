Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0559CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 04:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFOI0NAdf7N2W2C3C9E7vewiBQ1+TBkEG1LT0kHV+2w=; b=C3OeXeiVZSu6Kf0A8xryJqNGvF
	rKtGZsX/aqDshSwnJShsx1UtUQ+WVf2H/Bk86IKkvudMTDCDnSHYxUn0ydMaOdYJ6S5rQLCLd0XAN
	xVXI8ohWOyoNuhGec/haJnLtfEzhialqE5wcuDDYST0ysX8A/ReejpSWKLjbDDOxw4UjH5KIkoEVr
	YPE/ObAHt9rlcqQ7pr1ie4z9Qlh1sqzGXoZKlHAe9Qfrqbp49heaAwMciVSpQRoJr6Bk8BHO3YTXF
	b4Tsx+jabiJxG8SXCbXF7clfc1P3xDMKvapKkgziclufHKOo0iZoxFH2F+SZ7ZXMMF5hbS1n3ZjFA
	1r2Ygx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2Gq-00000008y4D-4C4d;
	Mon, 16 Dec 2024 03:59:49 +0000
Received: from mail-eastasiaazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c400::2] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN2Fl-00000008xz2-2Xpa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 03:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhJRInG+5JLvutTdjiclr8S4nhEGHlPLp3ws55M3NN/2GG9D14V2/tvwPQeyHufH+d/qncCUe2/1n9PGGLDr3IKMvlZycd9+oWwOO6JMM+c0SXDCV+ST1x67jaI6FI1EsGkjLzXC+VzRk0dlcmY34UGa9wjwS8n9EHdLIyrdNyHeTtbvnGpoMphnXUVRXYomwkPI8Wyosr/ZomcZuFdo6TFeRIfsXjAhKivhh6TGQrQgK+txM982/cT88z3GgWUK/6nZdNlkkWybXD3JtNtJSuoG6Lbxon62PkUuRfj/qNfsL+BuFfSUO1KvKDDAiXeWJ7Ncumk6drTXvE303f1gEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFOI0NAdf7N2W2C3C9E7vewiBQ1+TBkEG1LT0kHV+2w=;
 b=S1v5+Ky70B6hcU4SbuYL1IqOpfSfxFI4rHlOVaG/E8oR3hXN71Y1lV1U5E9dfhVWW7KFJ0Oc0Mh4/yOjVqtzgPiLJw2N1mvnxMknLDzbR5i8EIu0/07saPKp8k4ZnlcGj8IXALO+1ciaoDUNUU2P/RD1Yyzg9JcuBjjG9V4k+hu++rFmH9bf3UOIhTgZi5JIE+bwQn2OfPFU8yID1r9JXxm4X3uilJDXW6qC/Ijv48jDesh+sLY2RCRGeRvMQjS8TTFfIYWgllWAGINYPTG7fjuPrq2ze1lXE7kW3puacj//V4b8Jk/zhu785ocdZNoATXj+7VNZW3ERbYqSgfjckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFOI0NAdf7N2W2C3C9E7vewiBQ1+TBkEG1LT0kHV+2w=;
 b=iUqo+9u9qXLtXxZ5HqxXIzgu6bb45/YMc+9JdNWciYlQZYNsO1cssKa8nhmglTWHqbY7Rg9DjPvY7QAXM4k35B8pi+PbKA7WND5LmU9i9sjM81vOcQfVZ/KhWU4wBVH2CHQH5o8Pg9CU3qi8BEDhMkuZb1xhpZClHwaCOItmHPaGj+SG4vGc3KkZ+M/D30HNXA8GSa3EziYpznMb925N45e+uhQIndq5GWI/jCr8f9QkQLjgmxav0QVJ/+aURpus6chwhqLKgANmE9aNO/khBSK4eCDMiAwBuxXdquUcIayJ5Mht73I+mD2F5nqRbe/FxFn+2h60hLJ4/njvJrPE6Q==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by KL1PR06MB6018.apcprd06.prod.outlook.com (2603:1096:820:d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.9; Mon, 16 Dec
 2024 03:58:22 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%4]) with mapi id 15.20.8272.005; Mon, 16 Dec 2024
 03:58:22 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "joel@jms.id.au"
	<joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net"
	<olof@lixom.net>, "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"konradybcio@kernel.org" <konradybcio@kernel.org>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"johan+linaro@kernel.org" <johan+linaro@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>
Subject: RE: [PATCH v3 5/6] arm64: dts: aspeed: Add initial AST2700 EVB device
 tree
Thread-Topic: [PATCH v3 5/6] arm64: dts: aspeed: Add initial AST2700 EVB
 device tree
Thread-Index: AQHbTK3o1AJQUGaHkECL42nedr1nj7Lj0YMAgARxQMA=
Date: Mon, 16 Dec 2024 03:58:21 +0000
Message-ID: <PSAPR06MB4949384985104E0CFFB5234B893B2@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20241212155237.848336-1-kevin_chen@aspeedtech.com>
 <20241212155237.848336-8-kevin_chen@aspeedtech.com>
 <3e5346a3-ad00-46e2-8af5-1ac5d60c27c8@kernel.org>
In-Reply-To: <3e5346a3-ad00-46e2-8af5-1ac5d60c27c8@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|KL1PR06MB6018:EE_
x-ms-office365-filtering-correlation-id: 23d8904d-2aaf-4411-3d17-08dd1d85e239
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QW5WT1ZLb0I5aG5ESzRRd3JHcU1VTWR5MlM0QlZsMUFLOXRFKzNweCtUa0Zn?=
 =?utf-8?B?dFg5L3AyU3JtaHJjR09XUXJQU1gvMmVCTUFXNmRSdGtPMkZwckNUZkwyeWFw?=
 =?utf-8?B?S0lTZHo1YnhLL1hveVJtbXRubHBmUUxxcTdubFIxTlVYSThDL2p5SXdoQ0M4?=
 =?utf-8?B?c3RYOFdGMEE2L2pZai9jczhoQ3pmSHY4M1pWRUIxWGIxOXFDeFVKb2VvQ3NC?=
 =?utf-8?B?b3QyUFZlTjNGQnVDWXNOdHRkYnRUazkxaWVTYzEyN1dsQ21wZVFac3A2Vjhp?=
 =?utf-8?B?NHNhTGM1REJQNXBYci9UZUxhNnVsbFIzN1FHWVk2UGFkbSsvVDM2VFdQR3ly?=
 =?utf-8?B?bTZYYXdyeW5veUdqVTN2WmFPQWZWOExlNDdRVUVoZmFGZ081NmZwQ21yVDdB?=
 =?utf-8?B?d2IwVHNEbmZGU1lrWkJ5VFpFTitXdFRiQWJMU0F0em41NExQYXBzOENGTTZJ?=
 =?utf-8?B?WTlKV21mRk5UdGt2ZFg0MktRWEFHZW1uMDBwNXhtRlQwOTJyVSttSmw0VkVD?=
 =?utf-8?B?TUFwZHFJc0dXUGtacTRhaDlqNlJhNUR2WGZlaGd0TmMwYWJwZkFOSEJwTjU0?=
 =?utf-8?B?cnRTM2ZxWno1NUxDTmZ3NlBzSG9tT1QydzRtQXg2MnlVYXB1WXdCd1h4US9m?=
 =?utf-8?B?WkwvelNQR3hSQzZLMFc1bXZFSk8zOHR3Vmw3SWJPaUJxNDBLWld0SVpvWFRp?=
 =?utf-8?B?aGpiaDM2YjNsalBJblIwZEx4MG9FOUU2NWJzcHhjc21ZeGtPYlFITk9Oditz?=
 =?utf-8?B?MVFteHV5cEFSNlRCQXVHU3lmaEVJQ2taUDZoLy9UNmk1VlhBclNkaW80anhY?=
 =?utf-8?B?Ky9mNDRoU2tqV2pGQlM2a1hHVmgydWN2OGs5L2oxRU1UWFp1MVN5RzlpRGw0?=
 =?utf-8?B?aHM1WmxpQ2QwQ25HTEFkRnVCNUR2bUNDdkd4US9CdVB4TzV0eXloSEhQWlVS?=
 =?utf-8?B?T1lhdmlqUXk2T2wyZnV3QzVuajN5YWtrYkFmRlN0UG9yaGlic1pkbVlKaE1Q?=
 =?utf-8?B?Vk5weUJwMW9iWFlmaWxuU2tTTnE3TE1Bd1RPRVk2TmFGYUtsL3QxeGV5L1hU?=
 =?utf-8?B?d1NoL3Z6THpHREpVbm5lT0hYZmpGZXBwdzY5Uy92LzhwM28wbHdLbjF2YzU1?=
 =?utf-8?B?T0NXTm13cmhPREdwYVZTb1BVZXVNeVBDWndjZlMrVDROallLb0I5N1FhdG1p?=
 =?utf-8?B?ZWY4SVd5RFZkOWtIdVBkVUpNZWpMQ3RiSWtoTSs2U3NQYmh5Sjd1MzBYaFFS?=
 =?utf-8?B?Z3Z3eVVyaUdxWjZmUHVwdUxweENyOXp3LzdHUERwMTJVdm5hR0FFU3YvamJO?=
 =?utf-8?B?RlpadWlINW1sOHNoamRTTnpGeTFqTzhDNzdoVGFKQ1JiQU90VTBnNlA4c3h6?=
 =?utf-8?B?T1h6d0xPTU1JZVlwSlcvNUlPYlZlenVOdjBrdGhHeVlmQTZUZzBYY2drdjZ0?=
 =?utf-8?B?b1lJVTBQRnV3L2pHVWxTbVdDRjVKdEdlNlFyUWpNYmtmd2FvR2dMVUluL2d0?=
 =?utf-8?B?dnd6NU1uKzQwTjNDM1dNVFRCbHhURmZOTlNsWmxsbldhNGlRRVE2RlQvZEtk?=
 =?utf-8?B?QnNoOGVwRzh5MUtLenh4QU04UisxSU4xSk54T0dyVkJyQ1dGa2d0eFAxWUMz?=
 =?utf-8?B?cnFkQytMMzV1YzRmWlpqY3RMKzRqaEJmSlcyR2owUlU5K3ZyWW5CME9jMDhj?=
 =?utf-8?B?Vm5ETWxmMVJQQnAzWHRnckUyY2RRNUhoSEVNODNBeGZaNFhBci9uc2xad29N?=
 =?utf-8?B?Y2RiL1lCeU05WmtleVAzSC9zRk5kbTRtQm9WQWhNQlg4MW00YXVPdG1CRGZR?=
 =?utf-8?B?Q1J6VkxBK29kQUs5dTRGbUM2dW5mN1NGK0p3dmhramF1c1hlYm9LM1hKNnkw?=
 =?utf-8?B?UTY5bjdkTjBZOFN1QnNnQ0t0N2dVL3crS0x6NG5aZEdEaFRIaVRScGxPaXdY?=
 =?utf-8?B?aFpzd0VKYzg0V0gxbVVId0l3Smk2ay9ONTFjWHI4eHhKTTVieXRvQmxTTTZI?=
 =?utf-8?B?ampxZ3RqMi9RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFUycmI5cU53YnJhR2I1K3ROenZoSVQ1RVZlWi9DSHZQTFZDdDJqTW0yRHdu?=
 =?utf-8?B?WG1CbEVJMmZIOUJsMXBNNit4OTgxWmdkOWlEUWtqdm1aV2lrUWJsUFpFazc3?=
 =?utf-8?B?UkJpOEZJNW9hejROQ0ZSWXRaaHBOSGY4R1lOZTlRdFRScEtWZjZCeDU4UnJB?=
 =?utf-8?B?LytINzZZUnJseU4zdEhkVEtsYVpuaUxTU1FRaVJXaHkvOGo1bnNwMlRoWmZB?=
 =?utf-8?B?dlZpYU90NFc0MG1SVWwrNyt5dXEyangwa3Z2YlZVRWRoUndrWEZzSDBuclVS?=
 =?utf-8?B?RFNxeU9YMHViMzRnWkhsV1g4TkUxZWU0ZXJPang0ZjhMUEVQeFB4ZW1CMHNP?=
 =?utf-8?B?Z2dXZWl2N3dwQ2dETjQrMkpOMU56ZFFZOW9NYWxpbWRZb2NjUUl0OEpQT0ZW?=
 =?utf-8?B?SnZPdzVIWjZ1RkNJUTlBUmZwLzFGNDRPOUxES0ZGREpSUVJXL2g4TzlYMEtM?=
 =?utf-8?B?Q1luV3V1dCtFbnJLQ1lsZDk3MTBZMnpoN0ZFV2NHZEpZS0tLdmxlOWx3c0p1?=
 =?utf-8?B?eHJJb1hITytUb0JGeUJ2MVc4MkNOMnpBK2FpYStGVFpwZXpTV1IvalM3blhG?=
 =?utf-8?B?bTl1MGxGODZUQ0h0NDFpUE1DNk1TdFRENHNrSkt3dW9SRHE1SlhReEVacTkz?=
 =?utf-8?B?T01LTWJ1S0JibFJMWlZKVzJKRzl5dkxCVjdlS2UxQ1NBYW03SU4yYllHSW13?=
 =?utf-8?B?U2x4RGN0N2NmTEVGOTNCbEtGVG5zeDhLWEhPUS9La284L2l4RkZMSThmTmxN?=
 =?utf-8?B?d3VxZnozank3UzB2QkxpT3dPbUpyNTZWQVhmNmxPOGxJZFVCdWlNVTNTR2ZQ?=
 =?utf-8?B?VFVWeEROK09OZ3VTWHBKcUhGT2owSjFVT3BkdTdJSVo3QWJCUWVLSmVhRGZO?=
 =?utf-8?B?ZGZHVDVQOEI5L3UyVnNiVmhIeUFyQy9HdVFtcGRUa04xU1NMRUlOL2JHcnFq?=
 =?utf-8?B?OWJIMVYrY0wxZFJ4d1hCUlJSZjh3UWNTMXZIQldaK0ozVFQ3dmhhdUNNUFpu?=
 =?utf-8?B?ZXhVb1RyWGlJei9aK2JkZld4ZTIwYi9FSHF4Y2RjUE13eDQrY3BPNk5jK0I1?=
 =?utf-8?B?WnNRblFpQ2hIaVg2UzVKZ3ZKS0NWWVBPRTAyUXd1T3lOekYvWjFFQ1Y1QTlq?=
 =?utf-8?B?SXZINU0vcnZMbU0zVTJCNDVmUHRGSlpsQVVBTThDWmdYQ1l3V1p3bGN4MjEz?=
 =?utf-8?B?Z1E3TkhTWngxTGFOb2pTMDNRa1dGWG8vcHlaeHRvMUxkWW1ja3BRNURhdGpG?=
 =?utf-8?B?VDdyaXovbEVNc21vY3IxSnV5d0g3d1lvMTQ2T1lvNFpiYzJ2emduMGxTWDlS?=
 =?utf-8?B?RVdmK1BUYWNJM0t2NTlUZHp6aE9wU0I0cGpCUVJzN3VNcGVmaFpMSGVzOFFI?=
 =?utf-8?B?c1ZSbU8vN3NxSTJ3NU9oR1g5SDNOU3RBcVhqeXJFY2lBcHBGMlNSNDlVOUNn?=
 =?utf-8?B?MjEzNG9wU1NSb0NtckQrazBDVGtVYUNjTmhKeExhcUtlOEZzOUZDRC9oSUQ5?=
 =?utf-8?B?UFFuZU5XaFlycS9XQ084dzhyeEJUUTYvL3N3RkIwTW12cXIwYy82NzZOR0lL?=
 =?utf-8?B?NHFwbjZFRDdZTXdnd1Q3K3kyL2JtVmFNVzNuSUc3dElEY3Q0cjhtRlRBYUxj?=
 =?utf-8?B?ZDZQclYvTUxzTWp2MHZla2dCbkc4SnVsbExmSVpaREJRRExUSjZnMTI2U0tU?=
 =?utf-8?B?bGtGUThQUXFxejRtZlFvQzBMYkt4cGlkOUNjMHRzeHQyczFCUVo3NnJMd3M4?=
 =?utf-8?B?RVBtUEVWWG1XbkZzbGdZUTE3dE1sQWYrSjVFY0xJUWxjWHFDRFZGUk0yeC9R?=
 =?utf-8?B?cHloTjRoRU1Yc2R1NHN0WktOdjg2NlhNTWFBV25SaDkwRTJQWDcrLzYxRGRK?=
 =?utf-8?B?UWp2bzg4VXVDTy9NK3hzZGtoSnM2Z0VjaG5uN0xXNnR3ai9tQmRvSUFmRHpw?=
 =?utf-8?B?VDRua0JmTm9mazRKR2hQZGU3NXhYM1hCd2dycEovSkZydHVLK05QS002bVBU?=
 =?utf-8?B?Rng1dm0xdDkyWndOSXFhK0Nob0xocUd1RlZ2WThNZ0dkOW9WS2FML2wrRGNt?=
 =?utf-8?B?ZDVSUmZLQ253QkIxd1ZwSXVlbmR5bDlYWlZaMjRBcUFSMlRFVU1FY3NsemE3?=
 =?utf-8?Q?sIp5H5LhJn9dnrhWgvgpAtF5K?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d8904d-2aaf-4411-3d17-08dd1d85e239
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2024 03:58:21.9023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v1uhvPuG/W2Y8en/Cy5aocHveLOpIw2/8cXB9Xy8UBZ3tI3Yld2Mee9w/74U2Unrj92HyOmgPzVveGWAONVsqdOanmvp9t0h4BTuM2au6u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_195841_858835_58E40287 
X-CRM114-Status: GOOD (  16.55  )
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

SGkgS3J6aywNCg0KPiA+IEFkZCBFVkIgYm9hcmQgb2YgQVNUMjcwMCBpbiBBU1BFRUQgQXJjaGl0
ZWN0dXJlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogS2V2aW4gQ2hlbiA8a2V2aW5fY2hlbkBh
c3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQv
TWFrZWZpbGUgICAgICAgIHwgIDQgKysNCj4gPiAgYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQv
YXN0MjcwMC1ldmIuZHRzIHwgNTcNCj4gPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIg
ZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
YXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvTWFrZWZpbGUNCj4gPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL2FzdDI3MDAtZXZiLmR0cw0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYXNwZWVkL01ha2VmaWxlDQo+ID4gYi9h
cmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9NYWtlZmlsZQ0KPiA+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5mZmU3ZTE1MDE3Y2MNCj4gPiAtLS0gL2Rldi9u
dWxsDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvTWFrZWZpbGUNCj4gPiBA
QCAtMCwwICsxLDQgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0K
PiA+ICsNCj4gPiArZHRiLSQoQ09ORklHX0FSQ0hfQVNQRUVEKSArPSBcDQo+ID4gKwlhc3QyNzAw
LWV2Yi5kdGINCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hc3BlZWQvYXN0
MjcwMC1ldmIuZHRzDQo+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FzcGVlZC9hc3QyNzAwLWV2
Yi5kdHMNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4u
NmRhZDg4Yzk4Y2UwDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9v
dC9kdHMvYXNwZWVkL2FzdDI3MDAtZXZiLmR0cw0KPiA+IEBAIC0wLDAgKzEsNTcgQEANCj4gPiAr
Ly8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXINCj4gPiArDQo+ID4g
Ky9kdHMtdjEvOw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgImFzcGVlZC1nNy5kdHNpIg0KPiA+ICsj
aW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9hc3BlZWQtZ3Bpby5oPg0KPiA+ICsNCj4gPiArLyB7
DQo+ID4gKwltb2RlbCA9ICJBU1QyNzAwQTEtRVZCIjsNCj4gPiArCWNvbXBhdGlibGUgPSAiYXNw
ZWVkLGFzdDI3MDAtZXZiIiwgImFzcGVlZCxhc3QyNzAwIjsNCj4gPiArDQo+ID4gKwlhbGlhc2Vz
IHsNCj4gPiArCQlzZXJpYWwxMiA9ICZ1YXJ0MTI7DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiArCWNo
b3NlbiB7DQo+ID4gKwkJYm9vdGFyZ3MgPSAiY29uc29sZT10dHlTMTIsMTE1MjAwbjgiOw0KPiA+
ICsJCXN0ZG91dC1wYXRoID0gJnVhcnQxMjsNCj4gDQo+IE5vdGhpbmcgaW1wcm92ZWQuIFlvdSBr
ZWVwIGlnbm9yaW5nIG15IGNvbW1lbnRzOiBub3QgcmVzcG9uZGluZywgbm90DQo+IGFkZHJlc3Np
bmcsIG5vdCBmaXhpbmcgdGhlIGNvZGUuDQpPSy4gSSB3aWxsIHJlbW92ZSB0aGUgYm9vdGFyZ3Mu
DQoNCj4gDQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiArCWZpcm13YXJlIHsNCj4gPiArCQlvcHRlZTog
b3B0ZWUgew0KPiA+ICsJCQljb21wYXRpYmxlID0gImxpbmFybyxvcHRlZS10eiI7DQo+ID4gKwkJ
CW1ldGhvZCA9ICJzbWMiOw0KPiA+ICsJCX07DQo+ID4gKwl9Ow0KPiA+ICsNCj4gPiArCW1lbW9y
eUA0MDAwMDAwMDAgew0KPiA+ICsJCWRldmljZV90eXBlID0gIm1lbW9yeSI7DQo+ID4gKwkJcmVn
ID0gPDB4NCAweDAwMDAwMDAwIDB4NDAwMDAwMDA+Ow0KPiA+ICsJfTsNCj4gPiArDQo+ID4gKwly
ZXNlcnZlZC1tZW1vcnkgew0KPiA+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDI+Ow0KPiA+ICsJCSNz
aXplLWNlbGxzID0gPDE+Ow0KPiA+ICsJCXJhbmdlczsNCj4gPiArDQo+ID4gKwkJbWN1X2Z3OiBt
Y3UtZmlybXdhcmVANDJmZTAwMDAwIHsNCj4gPiArCQkJcmVnID0gPDB4NCAweDJmZTAwMDAwIDB4
MjAwMDAwPjsNCj4gPiArCQkJbm8tbWFwOw0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJCWF0Zjog
dHJ1c3RlZC1maXJtd2FyZS1hQDQzMDAwMDAwMCB7DQo+ID4gKwkJCXJlZyA9IDwweDQgMHgzMDAw
MDAwMCAweDgwMDAwPjsNCj4gPiArCQkJbm8tbWFwOw0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICsJ
CW9wdGVlX2NvcmU6IG9wdGVlX2NvcmVANDMwMDgwMDAwIHsNCj4gDQo+IEZvbGxvdyBEVFMgQ29k
aW5nIHN0eWxlIGRvY3VtZW50LiBUaGF0J3MgdGhlIHNhbWUgY29tbWVudCBhcyBiZWZvcmUuDQpP
Sy4gSSB3aWxsIGZpeCB0byBvcHRlZS1jb3JlOm9wdGVlLWNvcmVANDMwMDgwMDAwIHsNCg0KPiAN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

