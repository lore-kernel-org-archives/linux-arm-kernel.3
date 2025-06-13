Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BCBC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 03:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3DWMmmARDnfDOvtL7GxjYuq1hLPDObsbuInHstc82MQ=; b=EN2p1emPfgfRnCtMi0Th7tUUZm
	NgxEH9oe7fZO/FPQwdK/dnIGdfqpnub7+QYqdrBsescClI81q5sV/uEywcLQi71gettpXK/z4dzmk
	ks3yDfMIzku7OPPENU01vMERpiGNV8T0BgoAHzroNTxIs/EC5roGUHosNmqFl7ORD7PcPqEpSalU3
	2J5B6zmn3LBwWH3X5ybzgHJZLh1nMkrSXEeIDrG1XlYy8JEbFwYUlWbtLRfIF1L3rh/5Y/42RSvU8
	+QxoOt9C306Vgs31Ba6A3PpRbLpZFafN/DQEPE46frYg4HXzOx27OACietAaGEay2EXZPLf3LX96Q
	EifOk/9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPunK-0000000FCo5-0Q9i;
	Fri, 13 Jun 2025 03:09:30 +0000
Received: from mail-koreacentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c40f::7] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPtih-0000000F6pL-3g1y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 02:00:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2hIj/OEBxvTB7EyFk4KX/lUTm7k/NMpdrQ0T1TBXHOO1697OMX9yZETj4Mq7YQQOQGhJkbok0xJKURtjaNJzmDFQQ1r5si0ljvGX47YIVYe5A+92p2xSFDXQO0+c3LiNdieHf/YwHUJJVDzTFHUCIIL6NQ/JdmkXLLZseZzYmxbhYr7pTF4Adpqtnq/TfeOvrV90eAWCV/2SosK9qDm1KuAxh8i1yfnqdxaeh7zOBnQswpIgSg++bhZm5/NVBiNev5A6G7jjdlDX0DS+uJVgCjUhXeiov7v76gQlkcnC/YnUcbG/d79rs7ZkS/woRJD2WXCsJIf4cIbkglmEK5TRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DWMmmARDnfDOvtL7GxjYuq1hLPDObsbuInHstc82MQ=;
 b=S1uWCqsP3bfvfL1x7K/H3uyFqPIHAt2xw35rTnYGgV97Fl1rd2uQ3uQquzSoqFuz3WAF+r/Ptmq4IexOCiYnY9sj/fX/7r4MOvhZc2ffHUBaXdcBONB88BzodE0m69rG248ytXzJ/5U0AGcE6bMx3gyCix1LEszWkcYMs2C6CVLxlxXk4D/B+qHJS6ldsEAX7jwKEkJy2RBGgoZAEiST42uH/Zy3ZmdwdnEdMcCsGsjRu6W6ZUp8z9PQ5iJebz5crdYNjS6RPp0IrGW7iqTT6Nel33ffyKJNHP2b2MviMw8n0KD0hBGYtoLahjYZtH7h8/RiQZz7Jv7beDVdwyQzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DWMmmARDnfDOvtL7GxjYuq1hLPDObsbuInHstc82MQ=;
 b=VZJYriro7iX6PRcxXXOTzSBKS6aKqC8omu6hisLtloREwt3U/nWQzPBVHA1/A3kcjolTzk93V8QvP9BR0XHlYM0cTKvxRdCA2dymanZrx2uASMqanx7CYwFGBE7yUKmXzTsaIBqQ7wEbRwKZFgiOTyUCilQGSdvlQH2HNSaYlMndZ4rv6sknwYVF3muq21r/So1o9OTbAjA98LV/VTjCz7adPxarFJBygUlNI24PrDkjJmlTEL2Y9n+u+9vWAQ38F94nsdUglwxlBzWTslaz33B70chctD0ftw+rVts+TGL48zQdOVcYnKJNcYPKvEfjFbQicy3WCbfrZOiVoqe4FA==
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com (2603:1096:604:2b1::11)
 by SEZPR06MB5480.apcprd06.prod.outlook.com (2603:1096:101:a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Fri, 13 Jun
 2025 02:00:18 +0000
Received: from OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11]) by OS8PR06MB7541.apcprd06.prod.outlook.com
 ([fe80::9f51:f68d:b2db:da11%3]) with mapi id 15.20.8813.021; Fri, 13 Jun 2025
 02:00:18 +0000
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Nishanth Menon <nm@ti.com>, "nfraprado@collabora.com"
	<nfraprado@collabora.com>, Taniya Das <quic_tdas@quicinc.com>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Eric Biggers <ebiggers@google.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "soc@lists.linux.dev" <soc@lists.linux.dev>,
	Mo Elbadry <elbadrym@google.com>, Rom Lemarchand <romlem@google.com>, William
 Kennington <wak@google.com>, Yuxiao Zhang <yuxiaozhang@google.com>,
	"wthai@nvidia.com" <wthai@nvidia.com>, "leohu@nvidia.com" <leohu@nvidia.com>,
	"dkodihalli@nvidia.com" <dkodihalli@nvidia.com>, "spuranik@nvidia.com"
	<spuranik@nvidia.com>
Subject: RE: [PATCH v0 1/5] dt-bindings: arm: aspeed: Add AST2700 board
 compatible
Thread-Topic: [PATCH v0 1/5] dt-bindings: arm: aspeed: Add AST2700 board
 compatible
Thread-Index: AQHb24IdOCKn20r1VE+Du2gnGQSf77P/TvKAgAEHp2A=
Date: Fri, 13 Jun 2025 02:00:18 +0000
Message-ID: <OS8PR06MB75417E28FB28DEBF9568531FF277A@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20250612100933.3007673-1-ryan_chen@aspeedtech.com>
 <20250612100933.3007673-2-ryan_chen@aspeedtech.com>
 <278193c2-7061-4cd3-88e3-402ac85eddf7@kernel.org>
In-Reply-To: <278193c2-7061-4cd3-88e3-402ac85eddf7@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS8PR06MB7541:EE_|SEZPR06MB5480:EE_
x-ms-office365-filtering-correlation-id: f88c4988-0ac1-4a29-ac12-08ddaa1e0bf5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?SjlCY2FGZkZLV0RlS2dqSG8xTWMwTVMvQ2FLT0ZscExvTUIxUlVFbU1XbU12?=
 =?utf-8?B?ejlTVDdlaXJILzBJRWNsRmNXSGJQcmNzMmtRYWJWZDRwcXdBKy9rSVVBUGhK?=
 =?utf-8?B?c3BDcVpaRjZhN0R0VzhGMVFEcU9Gci9QaEFWSlFaMUQ4akpMTUJhUyt2UWM0?=
 =?utf-8?B?RTVvbkFIQkYvMS9jR2JjVEFZd3JCNjQ1alh3UENwOExMbEhQanY5N3gyUm9O?=
 =?utf-8?B?RVk1eUF2Mzl6U3VSODNCeVFSLzQ4cDkvL08vVVhLeVFsUXpTKzIxaFh2WnZO?=
 =?utf-8?B?TU9mRVluLy9LNUo5ekxpQnVzbXdyNHE5c1p5Zmw3MUkxZG9QeG43cldCU092?=
 =?utf-8?B?V1JvcDFBdXprZWZaZVJNcHJORG5VS3RxQlhQeW5kYTNOVW5sMndtM09xUWRI?=
 =?utf-8?B?a3BEVGlkTE5UZjFEN25TRnZiUUJKTWErSUU5Z1RIRGNaY0hmanVFYUhTNGNp?=
 =?utf-8?B?WUNuaGpjTlRmanJacE5BREpnQkpicHlWODhKbVpmbDBsWmJnV0M4M1ZXTjlt?=
 =?utf-8?B?V0l4cTlFNkx2K0hwTU02QnFVUlBxTWtiNCtoeThNNERIaFhGNW1ERWtIOHFj?=
 =?utf-8?B?YnljM3N1SzlVT01lUjk1YUFDUmM2aXFrTGkxSitmaHo2Q0VsZ1JlUG4vellW?=
 =?utf-8?B?UnFac3ExbHlQbmFRTFNac0ZBZUk4a3Jjc3hhNnZ0aG5zZkN4amgwSGlGMEdF?=
 =?utf-8?B?OGFuTHFHbnJrVXhRM2hVWlZ4YWoweGxlY3MxeW5ZNXpoQlR6U1AwejZGanBY?=
 =?utf-8?B?MnIyUkZpTXM4STdtRHk2OWw3TlU1QmEwbjFpRmlscDRkQk8zRnh1OS9sajV0?=
 =?utf-8?B?SFQwdFBQQ2lUOEt3ZTFNUzZMMERvK3AyeDBEUXEyUFFkTnQxdGxmeGVrSjl1?=
 =?utf-8?B?eU1NZGJWUjZRamlaZDNmUUZpVWEvampHZ2hoQUc2VXVrWklRTjJ6QjB2MExh?=
 =?utf-8?B?c3JkZ2ZuTi9vUGN0N2Rnc0hvV2hkeXc5RDZuclNpWTZQc0ZmYlpDWUJFeW40?=
 =?utf-8?B?ZUJad2hGS3pMMFROdGpCVHBaYU9wZkY1YXdTYWhndUw2NVZWRzFYKzQ2c1M4?=
 =?utf-8?B?NSs3Snh4cC9sdDBrd21scWNiWVNlQ0hDS2ZyZldRcGRGVWdNMWk0T05EZXhC?=
 =?utf-8?B?UnVRZ29BZmVYUENsZThGVm81RFF1bnZ6b3FHdkVpakZROHRhb3pqT0Z3eFlL?=
 =?utf-8?B?VnRUa3lKM29vZEJiSUYxSXU1dnJTZmxRdm1iT0hjT2VkSG9qbE9IWVJvU0M5?=
 =?utf-8?B?VVozL3VBTUQ1cTlZVDBjd3pmbkhxUGZnU3dFYTZhdVVCVTZUQVhGUEV5OWN6?=
 =?utf-8?B?SHQ0TFlBbm54ei91U0djbjFZWm5wa0dzeG0vVFpEODlWV00yL1pDeHVxLzlG?=
 =?utf-8?B?Y2NPTzZ5Q2RNc3JIT1ZWalBhMlp4R2hRNFYvY3g0RVFkamxqM0lxOGhpV1l1?=
 =?utf-8?B?TDVFbVVHNGdBWCtmM0FieGUxMlUwN0NJdzIxbHZJMlVjaHFXWTJFRnBJdnF3?=
 =?utf-8?B?L3IyOWlhbklzZ0VrS2dSSDRnbFI1NlFJZVNDYTIyZ3lJNlVRc25yQUFQVlNr?=
 =?utf-8?B?L3g5S1NNVlVQd0RnYm9yTVNURUdYZ0p5Um1vWFpXRUhsaVdsUExiM0lIYzZm?=
 =?utf-8?B?RzZ6UHMxTk4ybklxWlZCWjVzdXc1ajdTUW1oVG5VRW8vTE5ubC9OM0hKRlZU?=
 =?utf-8?B?RmhBb0c0Tkd6U3NMWkZEc2ZXc2tFL0pnVmhIU21TNmttUmRTRXFsNHFoZkFH?=
 =?utf-8?B?eFhpU3FtODAwMjVZejVrTEsrWk1VaVE4Slo5clhFU3VNR0ZkRlBSMlBDc0pp?=
 =?utf-8?B?WGJZV3lTWk9CTTBVZ2Z3NkQwK01LdlpIeC95d1QrcW5HVDA5TG5HVkY0c1dQ?=
 =?utf-8?B?cUNWM1BPZHhadnE5WHBzV3Bza3NrRW5LbVJ6dk9WanVpR2dzZ0hxVzRHbUxx?=
 =?utf-8?B?Y3QzdUFtWmpUcG80Uytqd1pZc0ZvSTNtYlZFdFF1bFh0VVE4Um52ZFpoZXNJ?=
 =?utf-8?Q?fAJT15sFZmlRjr/VI4ppBJjJEM3dFk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7541.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ald1R2ZkOFpUaG5XTXR1ZE9KaGtBWFllUml5dk5ManpiamdLMDgzWS9rcW5Q?=
 =?utf-8?B?MHFJSC80UW9QS2psZXhSU3loZkIwVGRPcWhycmhqZ3B0b2xhL2xIUjJ4VW1T?=
 =?utf-8?B?NmlRaWZUSk5TS2hlOFgzQ1I5NlIrTjl3QTFTaFd1NDZnOHhYV0M5YitRcWNI?=
 =?utf-8?B?WW8rdnRpU2x6aGp4TmlieUdscHBFSlVYY09HZi9RZS95MkdBRnZZWGQ4M3NU?=
 =?utf-8?B?ZFBPM0h3dGJib3RkT1hPUElIRTBGMEhQYWtoWkVNR1JHVi8ydlR4aisrRElv?=
 =?utf-8?B?eUpzbitOcTFWdStxd1RFVElIbHQ3eXRtM0U2L20zNjEwWDlVbzBncUVGN3Jk?=
 =?utf-8?B?TTIybDc3S0ZtSFZOcndnZlEvQkJFaGNZSTRod0VINmErRGtqdWRwdktjQmdv?=
 =?utf-8?B?d2RjaDVBSFVJUWRMbzQ5YTBjdFd2bUFQUGlYQ1dxK3kzMWxqZFRFOWVSTGtS?=
 =?utf-8?B?d2NPdDRLSUt5bDM4M3VrRzFyVmMxZHVLd01wWklsRzcxMzZlQ0thY0srdUxK?=
 =?utf-8?B?WXY2MXRBOTVNcVBZcTMxWC9CSXBTOXQzTjhSOHJsUm9NTUlQV0IzeXdOeXdi?=
 =?utf-8?B?bnhrTnRQSmlvMk8wVWZwaS9heU9VTjRBM0FIVXhnWGZQUHY5dXdnM0gyVUNY?=
 =?utf-8?B?dDBQczMyNk5tTHZzbWk0Zi9LQ3FCNkFlQlJaS09MZUg4Q25vcDRBVW55VHpE?=
 =?utf-8?B?V3RiSFRYaTBLbTQ5bDEyVmYydUVIb1VGdG1Pd0VxNEFFNDM0NVdFTENTRmVF?=
 =?utf-8?B?U2xHMWNMYnJYZHVBdXUxY3czV3hPVkFKbFZ3UFhTd3BmUWlLd1M4cXlKcnhP?=
 =?utf-8?B?T3NwcEdXWTl4Wm1OV2pTc1ZEOWNYQVo0TkpTZFZQblpxKzhBVUliczBpYUVK?=
 =?utf-8?B?WW5kTWhBZ0g5OGZ5MXMwMHFKWFI1ZjVYenIzYWthNEx1SU9yTEVEaXJsUFly?=
 =?utf-8?B?dmVCbjdMdlR0c3YrTkF0UXRhRGFDOEFkaEI3OUluMllEQ0VoQldtQzJQMGI4?=
 =?utf-8?B?YkcyVEh6VjRWeHlENUpuOEswR3VCcmFEMlUvT3dZbkZHU0FseFlBNmpNUlFT?=
 =?utf-8?B?b250QThNT2NqZklza3h3Z2lhY1Rxdjh3OFJmaEw4T2FLNVMxb0gzZk5OOHpI?=
 =?utf-8?B?REhSRWZWaXdsYmZlQkhHZ05qUVNYWDJsbTNXaVdOT3BJMW94ckZpMGhNMVYx?=
 =?utf-8?B?elRtQnUvSjdOZEFDUVJvUE9zQXFQSlNJRUNVeEFJQ0VmbkI1S3F2dXJrNlQx?=
 =?utf-8?B?SWpITm83VEo1WFYyK2ZxQkd0enVyR25mL0o0RThsdURkeXZIOUlPekxpQ0xk?=
 =?utf-8?B?aFExV2hleXp4dHh4ME5yQURJNnY3amRuT3VoWldUbVFWTGJjNUVtcGpHZG5i?=
 =?utf-8?B?dFZrbHpKRDA4M1pGTkJmWE44NHV2S2VKaTVndTJYUzhSbDBGRDJybnpPdmha?=
 =?utf-8?B?UXowaUw1MVU2d0N3UFc1MDNRY3YwbjkxNHRnR2NEdlA4L0orVkVlRVl4ME9i?=
 =?utf-8?B?VTdOUWFyRTFEZzdnRHJnTFJtZkVCS3pub09qNVJGL0lVOHFWN1pwd0RSeFJL?=
 =?utf-8?B?a2FGUkZyS1YySUxCU3d4TjFIWGtsK09oR0g3cVJVaWNKdmFCYjVuSzkvWTdy?=
 =?utf-8?B?dGQ2QTBsQzZqeVNDa3kyM1VNYTl4cng5RFhJN1ZVcmgyeXh5TDhNVjBaeTR2?=
 =?utf-8?B?aU11OXNSUU02OUpGL0E3c2k2djZjVngzaHpTampSbkNESzRxVEdKL3gxbjBG?=
 =?utf-8?B?OVl1dHNnSFdTczNsTkZML01DVkVyVXJCanIrdXFIeWRFRnVvalFYU2swak5H?=
 =?utf-8?B?a0w1T1JVVWxTTGNxSmdxVXpiVlJIKzIxdjJycS9MK1hqMWtYQnNUb3FnVnRN?=
 =?utf-8?B?K1M5cVFWRjkwOHhNWFNSUUNZWnF1UldmUTJXWHJ6bHVyRW9vV1ZIcFAxSHQr?=
 =?utf-8?B?ZTRRQjVvU2IvbXczSjJnUkdVUm96czZJK3E3WXQvTWt3ZlB1Y3RZeWRkSGVE?=
 =?utf-8?B?Z3FmR1YzSXNjQVp4YndYTWJmYnJLY2d3cENYd2thVjNJSTRYUEZnNzN6Znpq?=
 =?utf-8?B?ZDlIMnQvNmgwMU5QTHBscm1sL0tPTUI2ZEJIMHRqY2t3VG15Z0R5czcyMk9H?=
 =?utf-8?Q?thrUrMHWmQrr1cA/VjtIpp8zD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7541.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f88c4988-0ac1-4a29-ac12-08ddaa1e0bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 02:00:18.2284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fzbzwdlm0aFOvoU2AIMeiaqDWbWzGF1QUS5rTe55TNiXNxLsZBfNsEuWprJXyDpNG3mtyrlS0QxyxJ8UXYvpambHKAYdlba/mBC/XuvgDiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5480
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_190041_045902_FCBECD84 
X-CRM114-Status: GOOD (  11.93  )
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYwIDEvNV0gZHQtYmluZGluZ3M6IGFybTogYXNwZWVkOiBB
ZGQgQVNUMjcwMCBib2FyZA0KPiBjb21wYXRpYmxlDQo+IA0KPiBPbiAxMi8wNi8yMDI1IDEyOjA5
LCBSeWFuIENoZW4gd3JvdGU6DQo+ID4gQWRkIGRldmljZSB0cmVlIGNvbXBhdGlibGUgc3RyaW5n
IGZvciBBU1QyNzAwIGJhc2VkIGJvYXJkcw0KPiA+ICgiYXNwZWVkLGFzdDI3MDAtZXZiIiBhbmQg
ImFzcGVlZCxhc3QyNzAwIikgdG8gdGhlIEFzcGVlZCBTb0MgYm9hcmQNCj4gPiBiaW5kaW5ncy4g
VGhpcyBhbGxvd3MgcHJvcGVyIHNjaGVtYSB2YWxpZGF0aW9uIGFuZCBlbmFibGVzIHN1cHBvcnQg
Zm9yDQo+ID4gQVNUMjcwMCBwbGF0Zm9ybXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBSeWFu
IENoZW4gPHJ5YW5fY2hlbkBhc3BlZWR0ZWNoLmNvbT4NCj4gPiAtLS0NCj4gQWxpZ24gd2l0aCB5
b3VyIGNvbGxlYWd1ZXMuIFRoaXMgaXMgbm90IHYwLCBidXQgdlgrMS4gQW5kIFggd2FzIGFscmVh
ZHkNCj4gMyBzaW5jZSB5b3Ugc2VudCBpdCENCj4gDQpHb3QgaXQsIHdpbGwgZ28gZm9yIHY0LCB0
aGFua3MgdGhlIGluc3RydWN0aW9uLg0KDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI0MTIxMjE1NTIzNy44NDgzMzYtNC1rZXZpbl9jaGVuQGFzcGVlZHRlYw0KPiBoLmNvbS8NCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

