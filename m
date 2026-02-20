Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3A7C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5ISBxIXl75oKJ0k8bGvIWHKVJYtFwPhgOQvne+g0Mg=; b=WlCkLvyL6EBXIuTSuHddGAZcO+
	hc7M4hHVBSL9DJPFMchbCCV2SqklydiFQ/mDtHov5OBM/dnlBLUUIWT63wdccUzE8F+uUXUJO/mud
	j1jE/lELgX665gxNlT5LVgzOHmPR70BQuj+OYSViBxgbzH48TajVwOYqTYSuZW25bYiQwboWtIP2F
	Z45njV5tgK8WJNBLh634TA4wrmKTRa1PdAFfSZHQzuyWVda2/EuCgEsnF+MGOswMI+BoHBlH0187e
	FPVyC0WFoeZTQoXvzJ55B7ptVe2KgJZSAz768uletig8DmBIbCl0SDYkWFA1EA0LaUj+2UFwM9p/z
	gkVnv3Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHEm-0000000DAs6-1Er0;
	Fri, 20 Feb 2026 03:31:28 +0000
Received: from mail-northcentralusazon11010010.outbound.protection.outlook.com ([52.101.193.10] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHEh-0000000DArj-1kHR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 03:31:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4rRPXmG8+sB8D8CLebKwPODmVNCHADBQwkVS46BF53SrJvxQ7VuUnGMZ+/sPo4X7diTi2gUT4LprYkCPU3yxQoblvkwYaPWqdy1RMVTzYA47BLyUSHfGh4QxMJ7jRI2QEAI/gGBwXNSxguiOxqBFm6aXXSIu8/2dfpo5+san+RudW2VwYww1wsFi4RUxHZAAo0Q18AV/l3i08naIMAvtynjwKSYnt0ECReXBHujA+gOe3QSWA+LB2WCZj9/NUygWqfRWOnJ0TF56H165h2z2ZHTlgBT/qOIN8kBKy5t9nrQoE4TgG/22e6XwRMYnqz9dLz/tULkA0VEAkV9avE6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5ISBxIXl75oKJ0k8bGvIWHKVJYtFwPhgOQvne+g0Mg=;
 b=QEgUhZjPttM0d0FK+EijPVIT/rFnPBDTDi2sudN93RzdedBqjMyXEr6r95rIlGdRu72w777xHSuQBh5KlsQVBLFT8b8a3bUPC6Kmxoxslr7jhh9QSMj0uQ7UYwkWXXTBueGbnb6dlRgd3kwAByDb5hMn2OgjdfBO4e6rPes4ceDez2CGGoVvJHSMwHUlM87KjLqeLGTfFeXFuINAziHZjgfsZWqX1Ud3P22ffspwsd0/J6aCHOF2jdv6gTz22hY0SHQONHnlqSrVhPzuCztZXp6eMVS+ldAps9h4J9lJzjuINyt7Eyci0s2D0LFOTPipbeULdNqjSughj3KbAurxkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5ISBxIXl75oKJ0k8bGvIWHKVJYtFwPhgOQvne+g0Mg=;
 b=omZeDVhyvdyo0Jut1dDyR2mZCEgaN8xBRv36cDgZeoiSLHAbVSDdc/jSAo/QQGcNH/TiwpXXbFaLS2qAEuwxEbBims7U2nRwukhIZzG7vmgsfZ0fu6ucZLLH0QrAEzs61TnJTAr6EJnFaJGIrPPXqga6x8bwBTFtXx4D12emseg=
Received: from MN2PR12MB4031.namprd12.prod.outlook.com (2603:10b6:208:16e::16)
 by SN7PR12MB8817.namprd12.prod.outlook.com (2603:10b6:806:347::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Fri, 20 Feb
 2026 03:31:17 +0000
Received: from MN2PR12MB4031.namprd12.prod.outlook.com
 ([fe80::5a8b:b2ec:74f5:af43]) by MN2PR12MB4031.namprd12.prod.outlook.com
 ([fe80::5a8b:b2ec:74f5:af43%7]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 03:31:16 +0000
From: "Chen, Dirk" <Dirk.Chen@amd.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Chen, Dirk" <Dirk.Chen@amd.com>
Subject: RE: [PATCH v2] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
Thread-Topic: [PATCH v2] ARM: dts: aspeed: anacapa: Add retimer EEPROMs
Thread-Index: AQHcmZn2wsKeK9bWbUiwEv0KRHaN77WJexIAgAC/cZCAAHgHgIAAS6Gw
Date: Fri, 20 Feb 2026 03:31:16 +0000
Message-ID: <MN2PR12MB4031813C8058A8435368EC3EE768A@MN2PR12MB4031.namprd12.prod.outlook.com>
References: <20260209-b4-anacapa-dts-fix-v2-1-fe446a7038bf@amd.com>
	 <6192440acc150d216de5e074299e579e891fc845.camel@codeconstruct.com.au>
	 <MN2PR12MB403103EC90C803E3FA6CE6B9E76BA@MN2PR12MB4031.namprd12.prod.outlook.com>
 <7fb15c01c586fb7d4a3ee506b17d87151d50bfe6.camel@codeconstruct.com.au>
In-Reply-To: <7fb15c01c586fb7d4a3ee506b17d87151d50bfe6.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR12MB4031:EE_|SN7PR12MB8817:EE_
x-ms-office365-filtering-correlation-id: 0624be24-18f4-434e-7a3d-08de703081a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TklhR2ZXRkFrbEUvV0lkaExKQnJRcTc2b0piY1h6MFlFRHowaHR0dHd1YXpu?=
 =?utf-8?B?T05GYjNJdlBVZlZSQ2tZSjhDNm1oT29tZGU2R09IYklQaExuWkIxZXpCb1hD?=
 =?utf-8?B?U0tvV2RPV0ppUnBUNUEyWTNITlp5dVRPS3RYR3hQMGg0ZlBTS2h4b0dSM1B6?=
 =?utf-8?B?YjNjbmhVczJoYUpjK29raGJBMVIyV2p4TXhaN0dsMWtsLzl1Vy9nMDhhVnBN?=
 =?utf-8?B?bUhvWllVWUNCZXBlZTZrWW81NmhhTysrdGg2WlRSb0Rzd3FMWXRQbHQ2WkdH?=
 =?utf-8?B?KzVKc3ZMK2FDQW9IbncyMHVFU0NEdWR1R2RTbWVZa0cvNndUcVZyZ3lZbHlj?=
 =?utf-8?B?NUUyR2NSQXE2Qk12NkJQUWRHM3FuYjE5VmM4WTJkU3BEOGRYVWJpc2haQVlG?=
 =?utf-8?B?cU8xZXZmZXdMQVZCa2hTOC91a0VoMTI0ZFNUMmMvaEZEYnBwRUlmWE5TMTUv?=
 =?utf-8?B?QStXVlRsWlZIZVVQSnJHRlhsSlhpNnFHZGZjYzdLaEx1U1poVk5nMC9hSWdz?=
 =?utf-8?B?SUxpOXg2S09YSERIMHNybFIybm1XcXNteVF6QjcrSXViaG8vSkUvM1JIQjZJ?=
 =?utf-8?B?bGRSVTh1Ynh3Y0NkZG5QaTZRdDZWSzdHZEUzTmRJa0hScklQc1Arai9MNGpC?=
 =?utf-8?B?eEpvUmhRb3dXOFVNOTlpN0RodjVUMHBBUFY2di8rY2FobmhyNlRIWFUraDhj?=
 =?utf-8?B?ZDNyTnBBTzFZcUVsSHgxNFdFT2wvV1Y1cjgybzJYNmdUbnZET3dvbk9DZ3lz?=
 =?utf-8?B?MHBvUldVQTFsV0M5dTY1eDZ2U09iZWNURmlTSlRQSG5Ud1ZWWFhpZjNnK0Ni?=
 =?utf-8?B?VTBwdXcvM1E0S09ZWDg4TjNpcW4xWUxGb2pkN2c1djRDdGZCcFhPNXdUQWxL?=
 =?utf-8?B?Z0VOWVdNQ1ZHRW1BOXhXbGdFdFVnc0dxWTN0TDUycHRySVArMEJUZXpCaWZJ?=
 =?utf-8?B?dm5TeGIrVjNrRzVWVFBiQUJZd1FudUxCQVQ1cEFEVTZpSzhWblFWQjJNR1Ey?=
 =?utf-8?B?c1dDMDFWa24vREpwMklLVmhEVzhsMmk4U0Znb1V0S0JjM2ttb0tpU2wxcHpy?=
 =?utf-8?B?WjN0cDhZM0JOQkVKN082ZmdKQXd3Rzl2d3NiMUZhN2pNTmdRN3ZJTkRQcEI5?=
 =?utf-8?B?aVJzZVdQSWFsaE5MYlNhN25sc2lBV0dWNWJsM1llWFEySmtFZ3g5TU02ZldQ?=
 =?utf-8?B?cXJnb2RSWUdOVWVRdDBvZU53c1RJTE5nUzJTeFQxbEp3ODNucjRxbG8ySmJT?=
 =?utf-8?B?ZnhOb014UTFDWGh2Tkt1ckJnQkMvMkl2VGFlNGp4U3Y5OHVRUmpNb1I2dWlW?=
 =?utf-8?B?ZnBBak9rcFBDS1M1ekJGMHlySTM1bE5Qb1hOT0lFdU5HTFhnYkN1d0twK0Mv?=
 =?utf-8?B?SVJJclI5dUxWOUJrQ1BSOVVDQzRrL2Z0YlFSWmx3NEFybktKTjg5cDFHbTVh?=
 =?utf-8?B?TGo3U0phdk9DWXNWMFc0dytMa1M5SUE5UmdReS85Z2hpc1FhOVF3YmVrL285?=
 =?utf-8?B?cTNMZ1Y5b3FVbzFQdXVFSW1sRkdMNlQ3cllzT2gxQy9iU2REQm9zMCtGVGt6?=
 =?utf-8?B?YThKQTh5ME5jOGZ2M2VYbHFScmhaeVgxemZiYlRLMWZ1TktZanJuVTZDV0VF?=
 =?utf-8?B?ODNxYk9MWmg2d0xGbmkyOU1IaEk3cjBpdndXckVsRE9zcURiUUdxakhtTldp?=
 =?utf-8?B?SGZNK3RRT240TWZTVnFPVXNuaXdKb0JobkE3NXFMUjRUN0pJSmJLVGR5Mm1i?=
 =?utf-8?B?R1lzekVTVmQxZXVKUmljekx3alVsMWJBL1N5WjVGaHdHTVFMQmduYWM0RGFO?=
 =?utf-8?B?TjhpYXJBVzNabldhaFkrWkQ2cmJ5bWJWMS94aklseE96bmoweE5yY1F1VGhq?=
 =?utf-8?B?NUJudmUvU1pWU3ZaQTNSd2VlTWhTMjBQWW5neEFwQjJBK3QrQXYzQ2xQMno2?=
 =?utf-8?B?RC81cmJLa29FOVgxRW1EcGZ1YVBzTlc4VU1LL0l5K29EdWc3U2JkRFE0d0xH?=
 =?utf-8?B?aDJmK2c5ZDdDRTdKMEJVNTN5WnNkTFdyUjF3MnVNcHFiMCtSck9aVU9adTdw?=
 =?utf-8?B?OGI2ZFc4ZWRUdkgrWjdBSWxzblNqMW1LODBZRVVYbSt3M2laTDY5VmlqN3Vz?=
 =?utf-8?B?Uk5sK2RiL2JXaE1iaVFhTzI4bjVJRUhlNU8wVk5CeGdyMHA3R2Zxeml0UGUr?=
 =?utf-8?Q?t4JcWCM2NejQ9O/sjbpvgCM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4031.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OFJQRXR1UEhhUEc4VUNMWG54NHJZOXhPbTJ1KzlTWlRTRmxZaVJBbkNleGJ6?=
 =?utf-8?B?VHhMWXVob0FSV3ZUREZab2dyd0sycTRDdjJrMVhjbG5MT0E0TTFhUW1reTcz?=
 =?utf-8?B?cEplanVPOElnVE5NcDFicjlQQmtwSTZHem94TmZZSmRnY1lJQlgyMWtESmNk?=
 =?utf-8?B?ZFFlOTVkczhMR3NLMTJ6b2JVdTBlOUxMbFlmZGUrcXBUU0FIMjNiQXhyWndI?=
 =?utf-8?B?YTVhdUloMkJuQzdPZG5TNEpHU1VuMTBGZzVPeEI3L0t2VmhkbVplUURWT1VK?=
 =?utf-8?B?NzVBVjI1R1FSdmlvckk2bi9lSGxacG42Q1JsVFpRK1dUYkJNaDZBTGFjMDVr?=
 =?utf-8?B?WEhVSEkydHQ2SWwzY1djTXE2WCsrUlVva0JTQkxNb2daMkJ1Z1JBZmIrbi8v?=
 =?utf-8?B?b1BlYzNqenRwZUV3NnNrQTFiVXBlUmRsYkg4M3V5SGVUS1JLSFY2T1k5Mjd5?=
 =?utf-8?B?Y3NrUEUxNVhyU1JlNGdoUSsvZ3FkVzRqMHN1ajB2YVF5SGxVbExySXdKeTNW?=
 =?utf-8?B?S05RbWYzM283T0JDbkQ3bVNpQ201UHdNUUdOeE1HK0ppM3dWOUJkZEFMRkhR?=
 =?utf-8?B?dS9kQ1NVcVAxVDNFcXBTSzRFRkRRc0RkaCtHVzZBa3VBVVhmdHcwWlFoa2Uy?=
 =?utf-8?B?Q3JReG9wdzB0R3FNVDV4WUJzVDFhM05jNDRnR2NmMDZhL3RIT2NmNTZ3dWVN?=
 =?utf-8?B?VVQ1dG4weXdSMUZuM1hIdDNjQzZjZ3Z2ejU1R3h1K3ZsbHB1ekRQc1ByVVE5?=
 =?utf-8?B?cmttZ2NSdHphSmc5dHV5c3hyUC9LVm94Q2tIY0VWWGVubStNcjd5UHVYb25p?=
 =?utf-8?B?UmcxNU1DbVMwdGNEQ1JWY3gxOGpidDZ2Nis5dENDYzlYWndBdDFNYXB3RVRz?=
 =?utf-8?B?bm5YOTZ6QUR5V0k1cDBaUmlvcFFSSm1rS1lsbTVkT2Q1S1FiSk5xV0ZPbW1K?=
 =?utf-8?B?VVVVazNzMURLaU96YnVoVzFsdzl5OHdSb0hVV1VsY0xGWWZRNUs2b1NaSno3?=
 =?utf-8?B?cUZDYVZ2VGpFVWp0cUFtV3F5YlZaNEpGUWFMYnNab1BCczRTakZVUkp5dW1O?=
 =?utf-8?B?K3JFYXZRUCtNZjR4SnFJd1pWUVZnQlZacGE3c0E1TWhPaUI2cGJPTlplREtX?=
 =?utf-8?B?ZTZHTyt3SFFmb0hQWmo4M2h0eTRSSW10Q1lpYmtjdFJvdU9TTHFnVHU5Q3Rx?=
 =?utf-8?B?dTBTdGx6OEJzSmwzU2VlL0lYUzBickxLSmR2VFFFdzlSYWVyU2NjOG5lV2wx?=
 =?utf-8?B?VlZyUWlyTUVmSWlzM0dPVDFzSjE0bVVqeXNtaVdtYnZEdDlZR0RWTzU1ZW9t?=
 =?utf-8?B?cUZicjdndnhLcEJqam5rNnBIQW9GdGM4NjZ3Mk9ZU0V4YktjU3VKUTRaWTh1?=
 =?utf-8?B?REhSUUJwejhlcWRCTjEzejhzNzZXYTJOcXA4MkxYaitId1JNRWRZdStoaGhW?=
 =?utf-8?B?WWM3VmFvS3I4WDRpMDJTQVpoTzJRUEJRZ1E2Y1FwTHNCK213dmFZMG5ZYWVX?=
 =?utf-8?B?enduajNWTFd5VkVvSVhSZHh2N3Q0SXJnQXFpYjIxM2ZCU25qSndKNFRrVDJt?=
 =?utf-8?B?ZGl2TndDZEU3L1IxSjl3d2lGeXhVSUxUYkh3Y3lrVndOV0UvUGtzWU94R0Zo?=
 =?utf-8?B?Kzc0Ni9tenZNNWc1b0gzNzY5MEQ2WjZSeXVlT0tIRjhLazZaT2tBRWNxVGhL?=
 =?utf-8?B?ODkyQmlWS29CeWpkK3RnaklyZmdMWG8xUUZGdFJ0MUJMd096dlFLeGM3b0Qy?=
 =?utf-8?B?YjVjSjQ4ZnhjdU1UZ1o5Z1duOFVuOEluNEVjMFducnNlSFlEdE1LeVJjR1lx?=
 =?utf-8?B?Tlg1SzZ0RDlFc0tldkdGeXBPSW1WVno5MlpWUDU5d1ZIVXhjYXpremdRWHRI?=
 =?utf-8?B?Z1VhN1htM2lsdG1xKzRRNXlLd0Y0QjBaQjNOOWpGbG5Fblp0S29oV1I5eVhp?=
 =?utf-8?B?UXNEQ1puYlFLdlZJWllacXRRekkvOTU2Q1dIRVo1SzlLcmlrVFhxeGJsV0hR?=
 =?utf-8?B?OWFqSWdZYmRIc1k2U2k5WXViaFZsM0hRUnlOT0tRYTIwdTAyRGttb0djbHVR?=
 =?utf-8?B?Z1VoTmJqd1Q1dldNenZlc1IzV25Ca2ZLV3pWN1kyeklmWGt3VnhaQWEzZ3hl?=
 =?utf-8?B?MFg1LzJTeFBrRzJUUkE2RGp3cytCS3pTVWNoSFZtT0Z3dEwySDFkUkVDbnl0?=
 =?utf-8?B?TGs5RnZ0RGNnOC9pMEhWR2pRZkJUK2lvT2k5bzVjZSt0Uzh4OWlXL1oxR2ZP?=
 =?utf-8?B?djBLUmNtSFJSMnZpZFBBKzY2VG5mOGg2NG5WblV0cmYwa3lDSWUzdmVDVHZx?=
 =?utf-8?Q?gL+4UD8bjdp69TF0ik?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4031.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0624be24-18f4-434e-7a3d-08de703081a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 03:31:16.9015
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kiwHXjZ6NCQyXPHZcC3Us7plXoJWiDOBRveAld/iLMoe+ksuynv5cQ4J/nr1PQRrzYK1gqWUGE9uAa/xkPkAHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8817
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_193125_152842_E2CA2DBC 
X-CRM114-Status: UNSURE (   8.96  )
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

SGkgQW5kcmV3LA0KT24gVGh1LCAyMDI2LTAyLTE5IGF0IDE1OjU0ICswMDAwLCBDaGVuLCBEaXJr
IHdyb3RlOg0KPiBQbGVhc2UgaGF2ZSBhIHJlYWQgdGhyb3VnaCBbMV0sIGluIHBhcnRpY3VsYXI6
DQo+IFsxXTogaHR0cHM6Ly9zdWJzcGFjZS5rZXJuZWwub3JnL2V0aXF1ZXR0ZS5odG1sDQo+ICAg
IERvIG5vdCBpbmNsdWRlIOKAnGNvbmZpZGVudGlhbGl0eSBkaXNjbGFpbWVyc+KAnQ0KDQpNeSBh
cG9sb2dpZXMgZm9yIHRoZSBjb3Jwb3JhdGUgbGFiZWxzIGFuZCBkaXNjbGFpbWVycyBpbiB0aGUg
cHJldmlvdXMgbWFpbC4NCkkgaGF2ZSBhZGp1c3RlZCBteSBtYWlsIGNsaWVudCBzZXR0aW5ncy4N
ClRoYW5rIHlvdSBmb3IgdGhlIHJlbWluZGVyIGFuZCB0aGUgbGluay4NCg0KQmVzdCByZWdhcmRz
LA0KRGlyaw0KDQoNCg==

