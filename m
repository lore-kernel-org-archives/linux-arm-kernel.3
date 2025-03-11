Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E2CC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDTTlYNrjaWRtIcc7OuAvs1iJlRlqqZnx5AzpPkRsV8=; b=Tmivm99P9d7Iv+c1Pous9zm9yL
	wwxRR+wlrJasRCeuSfaz6wtntI9RqR4SqCpPnsotQ5l0Drorn8RSeaWTY8CYx9Uy5D/bKmFZI+E+t
	dmALK+UY5Rh4lyLzCvXqKrqbQjei6S5uYzeQMvVnEaUqZ898yPkezui4Uk03b5gbt0kyecMbVei3/
	hquXgTuT+01uNCMO2BIlx6l3T00VO3dOIzbQsuVWd2uV0js3qzRfzXH+QX1DLIfMxGdeYFyVofrHM
	Y/h1MUDslT7OkfOHm834WI+qOFQQ0OB2BFjfI63A5LDDl8twCX5N02cBoEBPjNTPKGPcy4s1JvdtX
	AoJ0oEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trnLj-00000004FiE-2tH2;
	Tue, 11 Mar 2025 00:19:59 +0000
Received: from mail-psaapc01on2072e.outbound.protection.outlook.com ([2a01:111:f403:200e::72e] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trnK3-00000004Fad-20h9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 00:18:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i0d6wcQSCK2mv7idb5oDz92pYvCT0u/rqSIy46SkfVra49VYsIghsOLIf8q5PV4b/ZC6IaIXJSmejJS/h0G/dDzZLjTSSuYNEAzi2HiKjJDOp7beRfLt56ovxB0CxdyQZ4l8RhI9DG0UcddEMgInjJ5aazbpMoUnjET0zmSO0yj20LD4R7gUOfzMCF5wfa2UMhY5PtlLcj4UuSztf+8QTDHFtTsFZctD+DHncaQDj60Friskp5EK1lptS68DVIcJ2PAL454DB4v/wOkKTrVBk/PhNwgpF2Qyp3o2S+4EhjOotQBH8TD0REHWwFbg6agmdaTBAfH1ddQ3hlurgkZSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDTTlYNrjaWRtIcc7OuAvs1iJlRlqqZnx5AzpPkRsV8=;
 b=a9HICgMOvYTrWgB0VQd70y5tCoHsCyf+2yhmS0U6RNHh7r0dWOfYWRnn6XDSWWKr24/e7G0S8ILQP5YtQMFu5E0qp/4JXkwHmtRxuqBMu3B2Chy0c/Hukr+7kGVOGOwS59AcWa66/zh9OqiS4CmDV7GDqT/U8e/Fbjgcfw1cnlhu787MBKgtEPmHmTHGp0iwNGfSZEFhbnQk6M3lu2KBzoO6drvV5P07kxXPBj32mmqvXLcK1vE+le7YRk1d0k1Vvuax56qcASPGRsR3ciu+LC+v7w/1vL418TrtxQTOtKdbVD9ler92KjT7zN3hf6f8Q15D31VzgA1aVvtGHZV2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDTTlYNrjaWRtIcc7OuAvs1iJlRlqqZnx5AzpPkRsV8=;
 b=R6Gc5l9WYBswS3dXtd1pzj5kAzxi6OSfp62oTX1a0wJHoG7aFAFxkCDxgZQBkm4t4vglasWg/r56+03++RnpzGI40AWJetyrVRu5UlUTO1NHkAJfnPVfH2kEVN6Hq3KhEWhEC3g6yNEvH9hkbZxeZMY5qBvjH4DSgrXHwPUUIq3sT1Qj2i9EyozudeuXtcq1Kd17vcXt/ysKqVEZSbV2dKwItmsDATt7SE1P5YJBvQnyd2aFu7VpfqxotGFJLe0+un9cfh1b+bv9hOGYRjKwERACuA+sI9OQ3F3/2wuBWWWAtmLpcBACoB9yvFdNUH98G4CWKljfMGOR51NgYDITTw==
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com (2603:1096:301:ad::9)
 by TY2PPF7174D7211.apcprd06.prod.outlook.com (2603:1096:408::796) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Tue, 11 Mar
 2025 00:17:47 +0000
Received: from PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf]) by PSAPR06MB4949.apcprd06.prod.outlook.com
 ([fe80::7bdd:639a:6b94:37bf%4]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 00:17:47 +0000
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@codeconstruct.com.au"
	<andrew@codeconstruct.com.au>, "derek.kiernan@amd.com"
	<derek.kiernan@amd.com>, "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
	"arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
Thread-Topic: [PATCH v2 3/3] soc: aspeed: lpc-pcc: Add PCC controller support
Thread-Index: AQHbjPJ07+dHDPFFS0aC2kKgLnBNFLNizwIAgAlcIwCAAB4+gIAA0gng
Date: Tue, 11 Mar 2025 00:17:46 +0000
Message-ID: <PSAPR06MB494913DA3070724B76606F6C89D12@PSAPR06MB4949.apcprd06.prod.outlook.com>
References: <20250304104434.481429-1-kevin_chen@aspeedtech.com>
 <20250304104434.481429-4-kevin_chen@aspeedtech.com>
 <2fd83d68-7104-4755-a0f0-8ce4a2601e09@kernel.org>
 <TY0PR06MB496072786197162F19ED7DDD89D62@TY0PR06MB4960.apcprd06.prod.outlook.com>
 <58466532-3e17-4968-bade-210f478ccc76@kernel.org>
In-Reply-To: <58466532-3e17-4968-bade-210f478ccc76@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4949:EE_|TY2PPF7174D7211:EE_
x-ms-office365-filtering-correlation-id: 6fcf7968-13b1-48b6-9051-08dd603226a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y3AvSzk0N3FpcDFtYXNLUGgyUGphcnF6ZTNYZlI4bjlFeHJ1UndnWE9jUi9I?=
 =?utf-8?B?dG45V2hFUHVPTWxVcGZGSXFhVzQ3dk5jU1BDSFVmRCtWeDV0R1VPZE56OC9V?=
 =?utf-8?B?ZC9jbEREOU01OVpqV2ZsWW9iYzZYOWtTcXZkVUdGTmxjWGdKeGRXWFkzRG00?=
 =?utf-8?B?MWw5SzRxZ0EvS3BTc2VjYWNXRnhhdXF0ZU9UMnA2QjNqSzU3WnVEcmxuV0lq?=
 =?utf-8?B?ekRjdzk2VHVCb2QrQ3hnajR2QTVTbE5jTmpvTUk0aDdqQUJCYTFYQUc2YUVE?=
 =?utf-8?B?T1VSRHgyRHl1dTBndmtWamk1TmpBWnN4TWxsMzR1QVltbnZVNTZzLy9Hcnlo?=
 =?utf-8?B?T1ordVZWeXZ4MzMvVStvVFlDZmI0U1FhOTBQWVM4TUJYU1BNaEtjcWY1U09o?=
 =?utf-8?B?QWhENGVDTnhoMDhpdHNPeUdneUpwdnJkNDNFdnlqaStwMUJGaGVNbk4xM2N0?=
 =?utf-8?B?ajZkNmUrZXFWSkdRYUFkbi91T0ZMd1FxTHQzUkkwNE1iWXVEd2JBYTRYcjhz?=
 =?utf-8?B?S3kzR1dxcU9xQXZ6QzQ4ZStNRVVWRXBWRzdKdnhzOTVpR2VTVFJsZ1pudW1k?=
 =?utf-8?B?aGxvYmR2QzlmMHpkdjRUd1VvSUl5YzQwR1ZTcCtJdzB1V0NBSVVTT214ZFpt?=
 =?utf-8?B?MmxGNUs4cFNSS1BvWVY5dlJ0cDlMeFNBc0JQVk9CSUFuVjczdk1LVmdtWFFK?=
 =?utf-8?B?ZXltQXhGNlhZVGZETUcrSE1GTjdqcU8vNzd1RllRSW5ER2hIcVBmV0lrS3Y2?=
 =?utf-8?B?cnBIaWtMZ3FKY1M0QTgxVk1MOXVFWXc5VVNUeklkdnBkM0loU0JSNHdvbzVS?=
 =?utf-8?B?a0EwVWdzQ0FzNzhqRFMyZHJRMHNTRldUQXF4MHpLeXRSOEV4OGxQNHlWVjhl?=
 =?utf-8?B?dmpyVmtYb3ZObXY0NE16b3ptYVRHbHVFWWRFK2VETnRiWm5DNlR6WlgrMTlR?=
 =?utf-8?B?a1JGamxmMDY5OFhtM1lER3IwVEtsSWszOWxOK2NzbDRteXVoTlltdnNMOS80?=
 =?utf-8?B?K0VheE5ZSDNndThhYkt3aDA0WE52K0hyVHQ0SWdPdmNobXJZK0tqNUtESGNz?=
 =?utf-8?B?NExBTGNYSkhoMkdlZzllYnZVV3NleGY0a3FzbUQ2V0tnOU5MUHhTQnVDOFhI?=
 =?utf-8?B?bjh4OW1TTXFaU294U3BZSXV1WUJqeUFyL05mcENVNG5jU0VMSnZLOFkxcmtP?=
 =?utf-8?B?VWt0eE56cTdoZFdubG85SlZNYXF1UlphSEIxS3ViT0o4aTR1RG5rTlIvR3NY?=
 =?utf-8?B?VENpSWx0TDFzNlhkelhVa3VMT2xBNndPdmZFSUpLSU40NzJGdWUrakxCZVB6?=
 =?utf-8?B?dmgyZWN2YlZwdThrcE9hT01pUXpMSkV1bXdZYmNUWG5ua01Vd0dCNy93eHlZ?=
 =?utf-8?B?Y2EvcDdORGdvMlNkVEZSSDlYZWZSanljdjd1MHdpSzFxNUhJTkRqS1YyRlY5?=
 =?utf-8?B?cTdOSGpYK0Nab0QrUHlIK0NndUczTjRvWmtLNkZ6WEM0ZlZYcGZBbWFKTUtr?=
 =?utf-8?B?a3NaZmorb3hlQUxEZjNsKzdoc2kxRTFzOVJHaDJwNDFzMDFTOXM0dUUraVRm?=
 =?utf-8?B?RGYxU2FneGUvdjREMzBPaG1iVjlLQUNNM08vcTRWMEUvWWZyMmtZRXd0cG5U?=
 =?utf-8?B?YUp1N0NVZGVjT0dvMGdRaVgwUXo2OEtTSXNjVFE0aE5hbXI5dGN2N1dweU8r?=
 =?utf-8?B?c29tSHd2SnZEanJHVit1c29KODR2M25kLzhXTkszdVBjSW5uNTUrNlZRQmhI?=
 =?utf-8?B?MThmRVBNQXFsUDh4eW1BTThTN0wyQmN0OFZ0cmJESklpN2IzVlhuckFLdFJY?=
 =?utf-8?B?NWlBcS9yb2JwTTJzTEUxQWJmRWJNcUZscEpXQ0lqcTVqWUFnRDczRklpT0Zn?=
 =?utf-8?B?QlBKa1RmQnFKZnZEQk9iU2o3Vm04SHJzZE1RQmhSUEpLNzlpOHdnZDJRQXc4?=
 =?utf-8?B?MzhSdTlZRVcrSXllTWNtWkF3d3JGUU5HczFKNDJiY3hMWno1aW9heXlkeHJ1?=
 =?utf-8?B?NEhqbDBKM3NBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4949.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEhYdlJvUXRkYnBhYmhsRWZYZVUzbTFnNHd1VkRVenVub3NEVmIrSlJMWWt1?=
 =?utf-8?B?cHBDcWRhZy9JK3p6bWpIeEM2V2xJWS90VjFMSk1JNEpZY2FLRlRNTER5aWtU?=
 =?utf-8?B?WDJQaVIxNmtyOUQwako2VkRhb2NDNU1ldXE2cTlHT0xPLy9lOEhvdU9NY2h4?=
 =?utf-8?B?c3BDRFUrMlBCVFJTcGREYlNZeHpKM2MxTTZFcHZCcmVlbE5Ga0d1QnNYRGNN?=
 =?utf-8?B?MmxuSlJ5eWhsSW1MMzFnYlVxS1E4NHhBMWlZaFdVc1VLc0o5aTFtZEVDMEtR?=
 =?utf-8?B?L0RleGtnaWlNZk1LM1BCSXo3K0UzU2VqSUVlRm1sbEJYN3Y3R25ONnFTcDBo?=
 =?utf-8?B?VENjTlFieFlGYWpYNWN5cjluMWtZY25zRWRpNzRMczVmdjdZZ29kUkhiTEJq?=
 =?utf-8?B?QjN5Ymh2R2JIdDJDZXlvUlFjMWp0eHk4VzRYZmVMOEVCK0R2b3VieUUyQWNS?=
 =?utf-8?B?M29HQ0R4K2Q3ZTBUZlgyOGJuc3lKdm01SWR1Y3ZYOC9MOTZZQW9SdUFqS3RY?=
 =?utf-8?B?RTFZaWFTWUhYUHROWEpaZTFzSTFhajJnK3Yrc3Rlc3R1OFROSXB1eVViNkN1?=
 =?utf-8?B?SEVrL21vS2drakhxLzl6cXRlMnBBMWxiUGduOEVUb2Rjd1UvdUk1OXBqNW13?=
 =?utf-8?B?SFg4aUFTaXY1MEY0RzlYMUNhNUpXSkRYU3hGcGcrSXJqc3dvcXdwTDc2K2pD?=
 =?utf-8?B?MzVCNktPNHovMzg5b0RLTWlxYkRtUFBLQlpGSXlFZ0xWUG0rRHNid01hTlRI?=
 =?utf-8?B?YjlYYVR1bGVRdnFoVHBMNzM0Tml4cGx3RTl4blp0c2pRS2ZCelFLRU1OSGZE?=
 =?utf-8?B?MjlBRFdtNzg1Q1ZWS0ZiWUUrTXMrNHBhMDdicEhEYmJsVXNGOXJQOGNpaE1R?=
 =?utf-8?B?bnVRcmVTenBrRlRBaCtBbWZTbUJ4Z0JaR1AwOTBENTFQM0pWVm1EL1RGdnI2?=
 =?utf-8?B?cTlXMnZkNUUyVGlnT21VdGxvS3hidlRkOFZoVk95RUlIMEtGMyt3clROUDlB?=
 =?utf-8?B?a3FIT2Vod2Y2clZ3REVudHh3NHNJTGlRVXNNUkJ3Q3gwVUdOL0czZzVFVlAw?=
 =?utf-8?B?aUU3UlNWRkh6Q1pKY01ySUJlNGM5RGY4SGs3ZzJhS1l2aTZDVklQSVQ5blJo?=
 =?utf-8?B?dGZESERpOTdiZnRvYklubWd3ZWEzbjBWMERPWUZOOWxZWFdZN1JLaTVJd3hr?=
 =?utf-8?B?NFNCL1JjaGkvQzhlMCtXQjQ3dkdlaURHdUVaSDh3WWJpeVNDOUhhRGpMaWth?=
 =?utf-8?B?V2FROUtGWHJ1OFlWaVpBeEgxS1RCdEZoSGJieTlNbENqOXRwb0g3OUVTc2pz?=
 =?utf-8?B?WU5BN29lUzl5S0hmUkhxTjFZUXd6Y0J5b2VoOUFxTzgreFRCSndMK2pacUpY?=
 =?utf-8?B?SHROOEIrakFaL0RJS0lqTHNyaXBselVDRFhNN2lENFRnaGxZeEVtRk1FTlBn?=
 =?utf-8?B?OFBQTXZiVmFuRytTQzJldjMwcUlHVTRCNDkxdnZOaXYwTHBja3JVVDd3K3Z0?=
 =?utf-8?B?SjN1YWM2MlIvQU53dXFMM0VteVBRK1l2V2RPbGVHTkYrWGt0clVGLzRsWGV5?=
 =?utf-8?B?NytvcEFyUmRVN1NmeWxQVnRpNFNJK2NtWXlnU0kzS25oWHlzQktkZWU2ZHpo?=
 =?utf-8?B?bENFa1hjN0p5eEZZSVNhS1Y4OGJzYm1GaUxFbWczT1lHYithODNqVXpOSmd3?=
 =?utf-8?B?VS9Nbm4vVGIranRuK05vY1dFZ2hwR3pveGFGMkN5M1VaYjhqekhqOFI1VHBW?=
 =?utf-8?B?dytiZC82WTY1ZzJqNU51ZDhoTnZnM0NZdWJROHZsVG5HNExmaUhRVzdRbFRo?=
 =?utf-8?B?L2QxcWF1TlJTeEJHbzNmczlINVdXWURUNmlrUHBNaTZJYXZGd1JzN09kZUJU?=
 =?utf-8?B?T29QL3Q0M1VlbmdjRWduVkd1SFFYQ1FDV2NxL0JieTBFbG4xcko3RmF3Nzh0?=
 =?utf-8?B?NzU0OHRJV3laSW9SaVVBU3A3aW5QTngzbytmTENmRkFvVm5hcm5sZUlscFBv?=
 =?utf-8?B?KzRGWDQ1T1FFWGV1aDNjK2d3REtVM214Zm5hWG12L1g0b2tDTUc3K05xbmVs?=
 =?utf-8?B?OW00RFUvSVc3WWtSSlRyT0NNYWVaeTByTG1lbHRNby8wcmJua05QR1lRWi8r?=
 =?utf-8?Q?1OdJb+nx+tidLvTCc9Z6yI3uU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4949.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcf7968-13b1-48b6-9051-08dd603226a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2025 00:17:46.9217
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FS2nKOMWpmlHmM9CPfDDeG8vviLIug0fCauF0/2Y2S0tBjIhozpe8vNfpZhIXrkhLPKySNBlBypQTXPxls3YElHb1ftpcbz2yHfL0MMURT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF7174D7211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_171815_517291_642AB802 
X-CRM114-Status: GOOD (  20.09  )
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

PiA+PiBPbiAwNC8wMy8yMDI1IDExOjQ0LCBLZXZpbiBDaGVuIHdyb3RlOg0KPiA+Pj4gKw0KPiA+
Pj4gK3N0YXRpYyBpbnQgYXNwZWVkX3BjY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KSB7DQo+ID4+PiArCWludCByYzsNCj4gPj4+ICsJc3RydWN0IGFzcGVlZF9wY2NfY3RybCAq
cGNjOw0KPiA+Pj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ID4+PiArCXVpbnQzMl90IGZpZm9f
c2l6ZSA9IFBBR0VfU0laRTsNCj4gPj4+ICsNCj4gPj4+ICsJZGV2ID0gJnBkZXYtPmRldjsNCj4g
Pj4NCj4gPj4gVGhpcyBnb2VzIHRvIGRlY2xhcmF0aW9uLg0KPiA+IE9LLiBJIHdpbGwgbW92ZSBp
dCB0byBkZWNsYXJhdGlvbi4NCj4gPg0KPiA+Pg0KPiA+Pj4gKw0KPiA+Pj4gKwlwY2MgPSBkZXZt
X2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpwY2MpLCBHRlBfS0VSTkVMKTsNCj4gPj4NCj4g
Pj4gTWF5YmUgbXkgcHJldmlvdXMgY29tbWVudCB3YXMgbm90IGNsZWFyLCBidXQgeW91IGFncmVl
ZCB3aXRoIGl0Lg0KPiA+PiBBbnl3YXkgbm90aGluZyBpbXByb3ZlZCBoZXJlLg0KPiA+IENvdWxk
IEkgcmVzZXJ2ZSB0aGUgcGNjIHZhcmlhYmxlIHVzaW5nIGZvciB0aGUgcGNjX2N0cmwgZGF0YSBz
dHJ1Y3R1cmU/DQo+ID4gUGNjX2N0cmwgZGF0YSBpbmNsdWRlIHRoZSByZWdtYXAvaXJxL2lvX3Bv
cnQvZG1hL2tmaWZvLg0KPiA+IElmIEkgY2hhbmdlIHRoZSBuYW1lIHRvIGRldiwgaXQgZG9lcyBu
b3QgbWFrZSBzZW5zZSBmb3IgdGhlc2UgZGF0YSB0byBiZS4NCj4gPg0KPiA+Pg0KPiA+PiBJZiB5
b3UgaGF2ZSAnZGV2JyB2YXJpYWJsZSwgdXNlIGl0Lg0KPiA+IERvIHlvdSBtZWFuIGp1c3QgdXNl
IHRoZSBwZGV2LT5kZXYgbm90IGxvY2FsIGRldiB2YXJpYWJsZT8NCj4gV2hhdCBpcyB0aGUgcG9p
bnQgb2YgdGhpczoNCj4gZGV2ID0gJnBkZXYtPmRldjsNCj4gDQo+IGlmIHlvdSBkbyBub3QgdXNl
ICdkZXYnPyBJZiB5b3UgY29tZSB3aXRoIGEgcmVhc29uLCBzdXJlLiBJZiB5b3UgZG8gbm90IGhh
dmUgc3VjaCwNCj4gdGhlbiBldmVyeXRoaW5nIHNob3VsZCB1c2UgJ2RldicsIG5vdCBwZGV2LT5k
ZXYuDQpBZ3JlZSwgSSBmaXhlZCBpdCBpbiBteSB2MyBwYXRjaCwgYW5kIEkgYWxyZWFkeSBzdWJt
aXR0ZWQuDQpUaGFua3MgZm9yIHlvdXIgZGV0YWlsZWQgZXhwbGFuYXRpb24uDQpTb3JyeSBmb3Ig
bXkgbWlzdW5kZXJzdGFuZGluZy4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YN
Cg==

