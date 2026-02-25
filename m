Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A974EEFB7F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4RXHbJsadj5CxfjV7jzITmEg0hm/BQ0ENVGi2FpAyjo=; b=Wv0OGYknQO/jR2ovptoscBjrMk
	zD0LJkKp6Q5tCzwK7r6PfEK7ohpuL3iaGCnblaS+fML/WcVNZf/IT5Aj0cKkJGakxECqJngDDMhbt
	cE06B+K/95PKNL6qqVWeLJSQboR70DcNtlOwqYXDH+Bi4sf33Fuz9FGgSlDf8dYXY4Avbg4TlPrHv
	9RuFBQtzf9FT/xK7EQahFmlgZWDFCexc1U2te5jUojanZ4vqeLlPdLtds1DXo8rktqLB97xYhrqLX
	pp76LbI0e3MWHHvaCN3sWOOVFb5PXJcLJOq2q/7tdnRs4M9rbIUqo0yv3dBBPXZn/JtE1Hucar6qd
	AAF8EMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8ex-00000003MPe-0lko;
	Wed, 25 Feb 2026 06:46:11 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv8eu-00000003MOE-22NM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 06:46:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb+Qf/e15sdzU24705SNMgPCAmvXpJhs6RvuqhUkBpZAXoj/M8j91MXU/Bh+caExV5nE3Nd34Pf5n/bCXKQhUwZGQcoAaWApI1tRFbV/aXdqSVWDLMqJeoztF132Q4ck2gie27vkK3/kVHUZRwsiy/ayqXKMyVB2dBFdCRZAmzL8P+rVD01m8HlPt0p7zYMClXYveQaeHumzitXgrQ4ujDjZYHJhEIAZHpJ07BC2kLvmIjTn0wXZXpw0zkC7fIKU1yToRd1B4FFPh2xslplIb92hAmyJ7qTTFZNjtsqM1XxNWVS66gbyQYgSjELhSfEypd3Wi47I1PlJ91ygOB7fWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4RXHbJsadj5CxfjV7jzITmEg0hm/BQ0ENVGi2FpAyjo=;
 b=M1DsURma9qW3w7zzE8ocu2l8fmufmxsqEACK/r3+U8lEKiQ09KPURWKNcurwvf2Li4rnEd1pIiA7EM+XSU7pAp7uLa4xcu/fJcuRpG8RtI7VOfYX8bLU4G8Lr/6fsy2w1j8DFTUGXrn7zHGwrl5lAjEoOyWSAri9QI9//8gfSfXs22POxiBuLHdJgNea5K6/IP3jw58XhfoitaZbqpUgFgOQPxGZ8wtLLZTecBIsmDmKfYrhrksEIsACBed3+ueC87QeiOXPQQXjuxZe4aFuuD0gnGaM5+Ry92n9KeZHxAj6P9gHq8NVjOyED/TON7DA4tVtd/AKw1SAlPMLpLHRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RXHbJsadj5CxfjV7jzITmEg0hm/BQ0ENVGi2FpAyjo=;
 b=Kaf3mt7WHLxQ3pVWs3svXjukJMkK7rt7HgNqvyjH8nP+JMED5Otxpehh3DhNWjMGnTQ6Em8Aa1083aLdsriPtbbvkJd6D+6ploAmHJfF1Z/GOFnjLf/74MchSPDN9uPDcxif7efIIGegueVbCL7+PWk5YGnJnkbAui/YCeoV80gBD8rmLHsSevZ4LILZUqmzF6PDSiOaQeaMpi+owij4RgRihs+xTraN4OkuRqgTtGlbhLEt6yaPO8InwhXN6VtOb0vE0zpx3O2Jw2pflc/MsuZaYyhbs8ShuTZrC8D8LXCmlYAuxE3mmEMZz5A31/mQUddzftayoGteFEOZmpzs3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV2PR04MB12272.eurprd04.prod.outlook.com
 (2603:10a6:150:328::18) by PA4PR04MB8063.eurprd04.prod.outlook.com
 (2603:10a6:102:ba::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 06:46:02 +0000
Received: from GV2PR04MB12272.eurprd04.prod.outlook.com
 ([fe80::3c9e:6f28:93b5:b908]) by GV2PR04MB12272.eurprd04.prod.outlook.com
 ([fe80::3c9e:6f28:93b5:b908%7]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 06:46:02 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v2 0/2] Add MT35XU01G SPI NOR flash on i.MX952-EVK board
Date: Wed, 25 Feb 2026 14:47:24 +0800
Message-Id: <20260225-dts-imx952-xspi-v2-0-c9ca27de356a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPyanmkC/x3MPQqAMAxA4atIZgM1WlGvIg5Wo2bwh0akULy7x
 fEb3oug7IUVuiyC50dUziOB8gymbTxWRpmTgQzVhsjifCvKHlpLGPQSHFvTFFxZ40oHqbo8LxL
 +Yz+87wcQbboVYQAAAA==
X-Change-ID: 20260225-dts-imx952-xspi-a9081e450b3b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772002081; l=976;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=WW4xkwD+BVlgs3eqiXHYN8YD4ASoa6i2/0EPkhnMJp4=;
 b=fqT2xBa57WJK1vDM8/zePtGRY5JhOWcf2P0qOiEMdN/iLcVgRDq+20IvslF69RfcPL5IMqV5R
 SJjYxMHJWbTDzILXJ6vVlKtCcb5hcC+e6ahgq/FX8UxQW7dWInoj36h
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SI2PR01CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::23) To GV2PR04MB12272.eurprd04.prod.outlook.com
 (2603:10a6:150:328::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12272:EE_|PA4PR04MB8063:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ddab2b-2cc7-46a3-1478-08de74398a9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEo4TlVBZUdtVm9GVk1tK3pvcjNSWllLSnVxd2RuREVMbzY5dHNIWDRnc2wv?=
 =?utf-8?B?RXU5YUF6SmhZMTUrSllmZ0cyYW1BYXFrWFZ0MGh3aE1RSXZEMFZPeHhjbjJp?=
 =?utf-8?B?azVsSTJvNTczdGI0Z3pkZjBKV1BYeHJ0K0M0KzZ0N2Y5ekcrMFFVbFQ3cVlR?=
 =?utf-8?B?S1VlN1NnWTVaRmNGRVRPb2g5VDN3Q3kwWU1kSVhWcW9FSmlCTDA4aWQzQURD?=
 =?utf-8?B?Z2RsbHhicEJ3dWRGU3MveUpLYjlJSjVROU8vUSs4NTk5d2xBa2R4UTQyUVdL?=
 =?utf-8?B?MlAwZG5UTERXeit3V2tZRDB1L2tBaTlvNGhGV2w2N0lxNnd0TUMvbksyNk9m?=
 =?utf-8?B?aUVTTWdEVzUwNmJQakduZmdWcy9ZSGpYYnF3ODNvMHVjeko5MTBYZnpCRXo3?=
 =?utf-8?B?RUxLTHU2cXRSSGhuRzBtSmo4Z2VFbDhtd0pNVEo4cEV0VjJiSzJKdlRoa3VC?=
 =?utf-8?B?WHVVWDUxY2h6MzJmQXBobzZWZ01QazhKeHZGRkxxUzRLSUpSNFpPK1A1SDhH?=
 =?utf-8?B?S2dVc01EdWRySzZNV0VVWFBxdDFkWHFqcG5Tb3ZlQlhiQ240Wm9PaXB3MFZy?=
 =?utf-8?B?NHYzbTAvb1lZM3QvUG1iL09oaDJjVjBSNEdXSFJ3OGVtZVZaNkZoVThDdFFp?=
 =?utf-8?B?S3lqMnA3dDZOSHAyUjFNa2lyTDZ3OVZLWWZVNE5VdEc4Vk9vYWJleFhvN2hw?=
 =?utf-8?B?WWhRb1ozaW54cHRMR3FjMi9nMFJqM2ViR2hHVWtCWmlYbDRTd0pDS1pTZXcr?=
 =?utf-8?B?YVBvak1aRVVDajFQcFNnMU1yek5VYWQxU1U1U2JRa3UzVDJkNHlWTS9SbkdV?=
 =?utf-8?B?UExiaUt5d1QwUGN0N29iMUxNekVxYWZvTm0zYTVvbnFpakpSYVMxbWlXa00v?=
 =?utf-8?B?V2pub0txVlVuS0h4RGJLR2VORDR2NG5waVJvOEsxa3JFdnlCSFdPeDBoU0FO?=
 =?utf-8?B?S1JkSjhjbDRJb3hZdWtzRnk5OVFYTlRzY2t6YTk0WEZjK0tsbTJYQ1pyckQ5?=
 =?utf-8?B?c0duUmtleEpHVUt2c282QlBJaXNjUnA5dkJlZkc0cnM3UWV3dTJ4dmRnd0l2?=
 =?utf-8?B?RDlMWUNuNVdGVTd1VFNTRFpQWWNtSmFmcEFia3l5SXZwT2JTK0Nac21DcW83?=
 =?utf-8?B?WDN3YytuQ3FNNy9mY2FlZjJEeEdGSzNScDZZU1JqMlRtOFZvclZCcmtGL0Rr?=
 =?utf-8?B?VmcxSnU1akp3M2N3aGxsdXJHcmY5NGxTSkZER3RIZ3V1VnpiaVBKQkRIOCtW?=
 =?utf-8?B?Z1hWMHVLeDJsazE5RllVUWovc0R4YWxlOVJ4TFpaWnhMaVYrTXlCN25hY2Y0?=
 =?utf-8?B?dkhXV0NwT3VrTVBJaHd6K01sLzRRemtWS0I2MEt1K1Y0T3FHakptMGlteVh4?=
 =?utf-8?B?bHp4UDBFMWpZR3k5enZFM284K1BPMm1mb0EyN2pERnhyYmRVVUY3dDVHUWVH?=
 =?utf-8?B?RkNvL2d2b1VXQ2xVY3dOL2pMZ0c2TVRGSmRub0hXbk8wUGErQWIyODdPUVVB?=
 =?utf-8?B?QUJlQ0Z5aTk1MlE4TDFoaG9hb3h5S29Yc01PR2ovaDQ0VmE5Y3lHSDFlbmFH?=
 =?utf-8?B?WDFZNzhVWER6dEVZRUNMMllzZ3IydlNNelZmQ0ZEMjN3WDYvYnNNY21Mdjly?=
 =?utf-8?B?Zm13R2RXR09LdWg0S2h2bVpzamcyN2tkaUJTbHh5OEMzUzFEWGNjQ1JXZXg2?=
 =?utf-8?B?bzFBLzFscXNma2ZPRE1GZ2xBbVRUVkZCOUZFc1JTU0dTRFhRKzYxbVB3eDdh?=
 =?utf-8?B?dnlSQkI0bnZXMHd1bGJZa3dMbTVYQi8zeGRMdSt0UW9sRWMvM0h5ZWtOTkpl?=
 =?utf-8?B?WGtUQUdvYkIyVlExZHQ4bmNlM21JcmE4Y3hjaHdUZ3kzRVgvQ1FGUW52V1l6?=
 =?utf-8?B?azRQVUJXVHQxeVpiQ3VYSFI0SmR6ZmpQK3dQRjk3bno2MzVjQUxYb1Q1aGpO?=
 =?utf-8?B?YVRCVkVaZ1VjY0lJdkRWM1Z0N3JSTEMyTytqa2RQaGhEUDZ0a000YllTQWlB?=
 =?utf-8?B?MFRIdHZqelpKREM3MHJQNUQvWlgvbDFpeW8xRjU5N1h6ampxb2h5R1BtVkVz?=
 =?utf-8?B?NDdDY2R1MERPTmMrL0V6UGZ6d3hsUXIrcFRTUTRNazR4aWkwa0Z4U1F4ZGpM?=
 =?utf-8?B?WjR6b3RMNjkwSmdHMG5KNmtoWkdrNHpPcGZwL1BVZXh0aWlrMmJjaGNsS1pB?=
 =?utf-8?Q?wz+2mc0Dyr+lul45Sz9aWJ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12272.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlhST0JvMFdlaDZNUFRhQ1dCUmxydzdXLzBvRGR5Rmhad29XSVk0enNlTU1U?=
 =?utf-8?B?eWxneE15WDRwL04yU1JNSitzdVV3aENZcDNuMGVoWE43SHpGVStsc1VMTUZQ?=
 =?utf-8?B?dkdROFFFK0JjUzNlZUMxWFpGVHBEMzBUYkdUZm43VnRvNFoyMEh6dzR0QUtF?=
 =?utf-8?B?dkNyMnRyOWJHRnpUQTdTSWI1cVI1aFl3aWg5dExEMkdZcEN3ZjdPV2I0UU1N?=
 =?utf-8?B?M2JzMUVNbDdyK3ZPdnhneUVuZVJFOURrUjFqYUE1Yk8xalJkUkRiM21iTGJh?=
 =?utf-8?B?VHNuWHptS2VSSU50bkhOcnVUdVN3MU1ia09pUytZWUVjb1ZaK0VUaVUxeEdO?=
 =?utf-8?B?SVBvOGx6Tjg1YkZrbUkwQUVtZWJUaFAva3JtQ0x0akdZaS95Y2ZXMmdyQ2M2?=
 =?utf-8?B?WU5JYnhSWVErYXdLV3pqbDhGM1RBS1pZdFhTdU1zVDVhVkhOZGE5Wk1PVlE4?=
 =?utf-8?B?Z3ZwRWdUanlYOVJyWnIxSTYrUnREbGhrdTNscTA4dmpFTmtRRWRWRnlMOE85?=
 =?utf-8?B?ZUZadEZEcTdEZ0ZJQ045TUdBenhaYVlaUVd0RnNMR2Z3aDgwSTBaVVBmazgz?=
 =?utf-8?B?WlExWmkvb0NubzVHMXlISzNmTTB2bVZTNHpGRHNOeEthRG52azJ1MmZsY013?=
 =?utf-8?B?QzRnNVd2NjFUaGY5OEpHbURWVUtHaHV5eSsrY0xvRzBMaFB1VjVCV2Uza1l1?=
 =?utf-8?B?WFBZQ1RNMVJTL2t0cm1mZW5vS0tQSnhVdjV1ZnZOY2NYd0VydzRmbXBCaDFV?=
 =?utf-8?B?bjg0enE4WVN2WktlRTlib3dHeTkxYnBpWkFwV0xrSXMrNVhZdXRrbXBQSXJa?=
 =?utf-8?B?MmIzM0ZoQ1hWRFplTCtJckRVT1NOOStDdHg4czgyOUJJOHIzbW45cFl1dHg3?=
 =?utf-8?B?WUlhYlpBWEZTcVVOT3oycDJ1WnhmMTJGT21ZMnFDWlUybFIyZUFocUp5a2w2?=
 =?utf-8?B?c0Q5WGFlMEJ4N3VsNHlqdms0bXJzdzFibTdRZm5oSHBJb3pBMStuQmRTVlVm?=
 =?utf-8?B?WnVhRXR3N1hwZWtremg5NjRxWmlHNnh6bVBGUktYYnZ0V3A3RGFNRU80OTFY?=
 =?utf-8?B?Q3pjMkdEdEZWa3ByR091NndpTDJvV1JnWDJxRjhZd1YrbGpkUndiVDFYZk9B?=
 =?utf-8?B?YU9vYitDVTd4YXY1K2RMZ3RLbDVxeE1UZXRpUWFTWmd4MXc4TVJZcTB4cWlx?=
 =?utf-8?B?dFdrSG84NWZPaTgwL3p2Zjloa3FGUjdmc3UycURjZGpDUVNiNEJmWGFCOFBz?=
 =?utf-8?B?bVk1c0RuWk9Ralh1eFlUTVJYL1RuZVI3ck11TG1rQ3A0YU85Z0tHMlI3VmVm?=
 =?utf-8?B?dG1VNnFibFBmK1ZsOXU3dGRTZWpYNVViYWVvL2E5cVdlTGFEWEY4d2gzWWhx?=
 =?utf-8?B?aWJrenZjYXdqbUo1YkZjYUJFNVRjS1dDeXhqRUxZdDJyS3dtODl6ZHNKWUdU?=
 =?utf-8?B?MUFIOGJ1cTFnN3BnRHRHOG8rUGdSaW8wdXlQamcrUjJOVG4yOHEwb1lMdU1E?=
 =?utf-8?B?NkxwZHIxa2E2TlR2THdmZ0lYcVVSVnN5UkljUjNCM0gwb3VINjJLMDl3K2o1?=
 =?utf-8?B?TnU5TkdyeG5JT0h0SmlWV3dPc3hYT3NGR3FxYXZPbVgrZEFUQkFhN0lUZ1hR?=
 =?utf-8?B?T01PTnoxaWtzdDVKQkZkSU5rWGU1Y1RBME55TGp3RVdhVGl0TWN5VzBOWFJt?=
 =?utf-8?B?cERELzZ4a2QrVllzZ25uMGR2QXlpcHErQnVWSGxua0xIbzJ0alJKVHQrV3BO?=
 =?utf-8?B?aWtObGxtOTN4L3N2YWRrM2Mxc2d2OXc1elJCcVc3Z0l3VTBrM1o5dUpDakpp?=
 =?utf-8?B?ZnMwUWZ2bzdTcXRiK05Dem02R0N5bzNKWDM3blU3aXFiRHBFdDVZTkJya01R?=
 =?utf-8?B?RG5rRGdkdnYwWWZhSENMV2ZQU1RLNXVRUnNYeEVVTXUzcCtDMHlrTFl6VjNw?=
 =?utf-8?B?OG5nVUYwSFlHbDVnVmxYTW1vbllHZ000Tk0wY0U0ZWVnZmJIQkZhenhSVWpa?=
 =?utf-8?B?YXJQTUdHbk9CS3BFYVBKaklmbnl1RmRRcjZITWIwTlNkUmxiNFV1Q3JsNlNm?=
 =?utf-8?B?RzRVbFhVdG9xdkczU3ltUmhhdlF4SnRsc3dhdDAzUlpOd3pZcVQxT0VWTlRm?=
 =?utf-8?B?WW1EV2FUNGRNTWRLdlNLTHVGR1o4TzZQU0dleWVURDdsdnpuTC9KZE1UNllk?=
 =?utf-8?B?K3ozOTVMekRTdTBHeEFsd0RnVEI5cDJWNWdVR0R3Z3BCZnErNTUwY1YxYzd4?=
 =?utf-8?B?TmVUZXlPOEVQLzB4dHFZNkQ4V0RVUDRraWl4VDRTK3prSDJ0ZFVOMjlPSnh2?=
 =?utf-8?B?OWlVeEdNcXRTM1hxaW1TTTB0K2o3ZjFvQ05TQ2srY0FaZHAvaUxqZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ddab2b-2cc7-46a3-1478-08de74398a9a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 06:46:02.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGiVCU81/ib3GHKb3x79nt37yq5f1KZmVaxZLOyM0KQRJiTBqSPq7/hoXBHQ1qI3Myv0+8G9eHDEfEnho/mn+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_224608_542705_F4224919 
X-CRM114-Status: UNSURE (   8.30  )
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

on i.MX952 EVK board, there is MT35XU01G SPI NOR, i.MX952 control
this nor device through XSPI controller.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v2:
- v1 contain three patches, first patch already accepted, so v2 only contain two patches.
- PATCH 2: re-do this patch on the rebased branch(Frank's imx/dt64), and move xspi node
           after scmi_iomuxc to keep alphabet order.
- Link to v1: https://lore.kernel.org/r/20260114-xspi-imx952-v1-0-acc60a5a2a9d@nxp.com

---
Haibo Chen (2):
      arm64: dts: imx952: Add xspi node
      arm64: dts: imx952-evk: add MT35XU01G spi nor flash

 arch/arm64/boot/dts/freescale/imx952-evk.dts | 41 ++++++++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx952.dtsi    | 19 +++++++++++++
 2 files changed, 60 insertions(+)
---
base-commit: 399c6e3385a79e0e93837b504ad58477c22db841
change-id: 20260225-dts-imx952-xspi-a9081e450b3b

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


