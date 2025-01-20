Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DB5C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=72I/ler5yB2S0IVcIOUZ6SuDImN6x3a8hRwpExfhXRE=; b=xnG4OwV6myHBTsOwwetxCl2I1K
	stQqb6vioZGklJO2thbr63Ms0R+iR4WJFDBzpCgO5FfVMmQXvMKyyIJIWzsE4DUR1Ku9YqQZbXL0b
	7EKhrMfDeVH7FgA4wTtSl6oxHnAdVqCqK4gMzLLRFnxVaCfNhjb7w/NY3N+dYxE3ICB783euVb3I7
	FEgiG72VWNWIGuZk/SMz9iCo5EXg3tlRktsChKmeRco/QcZaCGw47rIDKfZcqiKuXjwUl/7NSZIb2
	3WaL/K7icbl/cZcASSx4ruO93agJ3aFMwrl3I3jUcEckpGDRN5V20DUaiSlDJBRPn87XdXHNX1jVA
	8AtOknSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoSY-00000005FKX-2FsH;
	Mon, 20 Jan 2025 09:52:42 +0000
Received: from mail-vi1eur05on2060e.outbound.protection.outlook.com ([2a01:111:f403:2613::60e] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo3Y-00000005Aiv-3NzB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:26:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWPTX4xTwQ6qe4htE3q+SdKfhOukaHjI9KjNkqNRh0y7ZX1rANdQByfegsE+Zp8ItwuHjd8G3cUEseFLTR3rWOCaxZNyYTLCeCW/AOII7fHTQbs99DyPrDGNGjmeaqcM2iYe84fvIFkrPa3UQhCIx4rYr4h/r5YsSHnIGR8zXmLNt3nnYkiC4HOQazkBzaVAxuNqKGZpKyETZiDBSjUmUsCuRyw5qTXnTm5/yVyIOOrv/uB2Pya1DDI84oRc1sGLbxMkkS8RqJif+lkabrjO4s5VkmzfVUn06jXX1x8peU5Xc4iUB++PVACTGBie0MFt9/qjVsPS0abZBmD4V3tcDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72I/ler5yB2S0IVcIOUZ6SuDImN6x3a8hRwpExfhXRE=;
 b=fuO+ieDHdVv/bEhPl86WhCxZCs05SI5r/qWLTrrdoivReJ7vQkso1Djr29+3y854WLOig9a0qOOUUbRvgxUNNalnLPFSHRjJxwTEx0+Gjz7UQP+EKZ0ZXlZQBIBa4zezqAW3RH3U3sV68pyzUnULBN/jl0djQB2pBm0Ih0JIqKYVTqsTvoVvINqT4nM0d6MZoi6I5BIwAVi7kN4DLto7TrCodqrc0ehJaYg32L4BVaCSC6EfT9GB8f0eDBNOrWgozex/OoSmBq8D+wtQffQh8Ky/yePwm2/PP5SEyGSiJWvdkD41ojlkPnffZLpWqmHwKQouXwIQ4XS0Z8NQVEhiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=72I/ler5yB2S0IVcIOUZ6SuDImN6x3a8hRwpExfhXRE=;
 b=QxYG+kyabGROFEVaZmY40DHawpz+YWqfszMoo28ilFjHGGOgCnyxhK7EUvAJEWVmaJjSPQNxqS4jb7c2NIhvSsZ7EMsI1DspQbixN4J+2zQWlH713Xv4AKhAiNd9oa43d/lA5rYa4wmgHqmATrSa5dZgieMJnpSVTuhjiIu3uueNUh4pzIBC7C9QUInPvLCWxnzE8Yx7mLxxQhL/zw2d8HFByysL9FmWJp7ibgEWJvHNWhp1VEJveTaZ33er9B2P9wLITcthcGklBALOJ/u0lr1YTxWUkxBw0tx/YFLGNnWgrrSCenXX7VjB+COwGj3fTe7JAcxWtmjJ6sFnIvzNOw==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 09:26:48 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:26:48 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: Recall: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
 secure-enclave
Thread-Topic: [PATCH v11 0/7] v12: firmware: imx: driver for NXP
 secure-enclave
Thread-Index: AQHbax1uLhT1BEW9r028+mMbQsO88g==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 2
Date: Mon, 20 Jan 2025 09:26:48 +0000
Message-ID: <AM9PR04MB86041F11E6744FB41C40CECA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|DB8PR04MB7131:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aca425a7-2bec-425f-feff-08dd393490e6
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DkiVDThMpGvzbe2841JIpCuG2LRWyji9ZPDwJT036MTri94eqz+VvjJWkzgh?=
 =?us-ascii?Q?zzUJ2AGuMvqMCxwNuxNQIwVnmhN+hSo/wU/fgt/Q6pS8EGj5YqTWXoIkKVCQ?=
 =?us-ascii?Q?blL9GN/ZyIkPhsIFEMoHmUu1Y5Xr0C9TfYjbMiBT5r2eYPKZVy0231ohVe3C?=
 =?us-ascii?Q?HMHVM63559bvb+B1VgHozoNWnHakChZLvYYV8JT9CvF5reoyQlSpFxSSn1nA?=
 =?us-ascii?Q?Llj6GNxKfMsj6NXYp31juQi5ceM4Rzy+6W1/WQ3F/7ZM+7N0AUVapQLTbulB?=
 =?us-ascii?Q?nHqeNl+qeA1q2CgF5qcTRK9Bl5OnzKBaL5byq8r5/W/QeUCiAAEm2r3W9eZb?=
 =?us-ascii?Q?KD3md8/T9PYAj9F3hYpp2of6PdstKEDCCBaKTGd9ZGlnMaS/3Pn4q6r69jrl?=
 =?us-ascii?Q?fYs0mdunLAUvTaJk6Qv9/lGBRplxeqU6Wlmjac3CYrT3lKmfavk7hjVPAktE?=
 =?us-ascii?Q?XhVc/UQ4RaD1kzcEUBsJt9gJpCnNLvfRAVeCvOPW3RCtkXI6C9sdvRQpaV8h?=
 =?us-ascii?Q?JfPPsQNWZsLxaSDLMe0ih7WAIUf48F1EmRYTQ5K8OLFjukc5Qhy6kQeiFKKZ?=
 =?us-ascii?Q?x+ebxmI6rSgvw5bjAiX6XS3r+Js0HcZN/KsRnW3ur8Qid1xj3eKLHJT09wp8?=
 =?us-ascii?Q?w6Gp2Oby/vNQyc6Oyfg/+mskIWdHjdqG9i+hZVNVODJ4WABX+czdiYZ6pkBP?=
 =?us-ascii?Q?j5PGNzAFiZGCXb6s15TKqmApyK60H2qxzaLA4wFPNdnkXMxaKuUxmjHx/9W1?=
 =?us-ascii?Q?Bk0VYe8i2jK90uBvTnEo741bjkcYrpqb9+gRJmbJMIOEpj45VE967U7icT9T?=
 =?us-ascii?Q?ISVZq//NL4VKzdyDtSepOY0TSyKydDVsa+TVekrsttF7xssm/WAyPzTANMcv?=
 =?us-ascii?Q?B+G4G4txPEuoQZi2l3n+PA69JuZSzvHiX7ke5PTN72vV4YBZTWIF9v+yg6NJ?=
 =?us-ascii?Q?btDBdhrZt5+AEZXtriWuvd0EB0VGhiT3dXjnaFcqSLAw0/oAUH3XgEgMgOy7?=
 =?us-ascii?Q?TLfrxL1hs3F3nc++UeclHt7Pr9MiVdZp9bbKUt4QosqScbJVQONqvoO4dGsC?=
 =?us-ascii?Q?aHBBWgMUzL7b4s7dMduZQ7Yk2KHPO7FgXUMwCDRHF4BlBftksfl/QP5wyXyA?=
 =?us-ascii?Q?Mc9VvoTFDZFYs9t0OrL5b1FnUCmWqU99IHPMqgm2z64U+eu/D6/TvGvMMldt?=
 =?us-ascii?Q?iFSbcMwC+rodxK7ZsIlrvxtCZUVmjGj5phgCntZfDqpffKQXxHs054hDCYAl?=
 =?us-ascii?Q?EDNu76mevZlRy3rEH4uRb2x3ofn9yDZc5aWDRAUTKUqJ5Pxi25pcY2eXniDI?=
 =?us-ascii?Q?BSTEslnaw8b7MFoeUeKiL184hLH7/U+fg8xVtO7dnuKVzh5R9A74fWghvKAp?=
 =?us-ascii?Q?gOA71BD/19gSLf993vbLL6Hpog0RwiQdvKc/UnBtbTL67xezNY8y+jwTH3Ew?=
 =?us-ascii?Q?vgcGDV1lHDC476HLRkZEm+OCkvtx6h9Z?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CkdG8E7DjHvh/smm+rPyQC6G8NangpewNhW4mYPpclnNKIuQey997omq9RiH?=
 =?us-ascii?Q?6ZQ0cc31sgwHgpVHbXHvz5QRNKyz13t0LIatOCz2fR7FJM4zHE53voN56P3W?=
 =?us-ascii?Q?9ghMh23lr3HD8q9PvZ+D6kiaGrsb316CUbHY8v/6h7Yw9eeR6mU3jF6J2+pe?=
 =?us-ascii?Q?e+y/DP/5+WSw0i2BUQPYzzmcw4fwKWklRkztme+XGqwgHxDVnLXHp/kcveZ7?=
 =?us-ascii?Q?s71zzzSERd4CI3TlfOln8+zSWmVqFcL+0ZDwDAO82uk2cDuaBQhJwG8x6Typ?=
 =?us-ascii?Q?YGkcFE4zACET1lrayrj++R1xi/phWjL7pX/lHalXBlQVn4SxP/PydPh2UUHn?=
 =?us-ascii?Q?w27BVgtcuDuzs1PQjjxX7HAUxRXAzDoKTDJlOkdS9qvKry2QdkBBCljIcSWa?=
 =?us-ascii?Q?QGNX0GH4zBmXhHJg/rXYYKxEsz1HkW0sSOqS+GQRl507dz5xZgMyw4c9j/Qn?=
 =?us-ascii?Q?9MdeJesmlwYstH3muDP45hG/hud5f1yvTIqfq15r/V1whePA5PHB8yippKND?=
 =?us-ascii?Q?H352ODTUe4qXLzMegDizxu3ORR0LiM1LLrDHlXrD51d0Gmwti+aGVVasMJws?=
 =?us-ascii?Q?6QEPw2r5I26LpagtdYgsWS2o8xNefgWosdjrmKyH0xWNQKL5Ulu6YSiTpq/V?=
 =?us-ascii?Q?/n0oRkl/ZTeWgDGI2ql9sj8gzotuveoeT29ONtTsFS6UMBg9wY4CJ4dGG2KL?=
 =?us-ascii?Q?Yoe/tlnf7WW4XT/6iZS8g/iYAnMFyIyxKhGmzMatPoFiyMtcDeRGrVV6lGVL?=
 =?us-ascii?Q?ou6e8vQMrwsPTyDlZdia+/e2eW42OAi6+QnOt6L0T/1MmblFqn/tdn+ktw2g?=
 =?us-ascii?Q?3BNoIHlb0zTLlzFBxUFygv6UlYNGh/AIEMKaPDEEA9bdpo2zQ0b4q8r9uFvS?=
 =?us-ascii?Q?VipQaPUZr8VQAkHwyt1XOmqK5b96QQDAXWLw8Yk+odYslZzd2m8X26sEnxHT?=
 =?us-ascii?Q?iN5kzPSm8SIF2p/h/j79VxaSTsm+L8/9e1tEpxZ/SLspGa7xhqhwBYtFDrrA?=
 =?us-ascii?Q?dKSa042S2kjMhV3FO7XEEwVCH/YKRM0TExnvdC78bwNBZWnIbZEJJlN6fenv?=
 =?us-ascii?Q?8l7UIvSpfpS35nG0LzTE4yxTWZ6aujaogg0LeMIeEyGh1+ydlR/e36Azeikx?=
 =?us-ascii?Q?BI5UfyKDCy4wdOEskM49iTDk5Wd8A0CY6IH/pl+XRp7UAIFQMv88+bsmafcK?=
 =?us-ascii?Q?UL3lYOfxtEl34+4OaUIiLw1VpRX8Xm789hL6BTwd1/i0YKGPGivjlYqGFCT5?=
 =?us-ascii?Q?muWrljz+1fweTUuiLqLGGdOnsjVXDYyfYkOg+uNarB75SazQXzNMu8y9o2nC?=
 =?us-ascii?Q?1VxKJCL9+SEKiqMl5zJ1xTrWXfZW9ThCG+e+79obNGLoLqD+6JSjGWgB+uf4?=
 =?us-ascii?Q?DVKbCKJTXdedtvcDZSu0fFQSHlYbD82NpB8LD0tozNIkA1XsH+3zYXXSgN74?=
 =?us-ascii?Q?ks+VyGSWa0IDfhJKwlPAUW7i0tqvLFFPh/2Zh9CxAakpoh9Boh4touPSeJhF?=
 =?us-ascii?Q?7XOF7n2GBpzCHu8Jzo3uLKoCIBXnxubsoKF0md1LUq4ejsyCxliT4GoEe4YQ?=
 =?us-ascii?Q?KbkIWM/gcnWVHzXHFGR2OC65IrpM6j4H8VQETHCO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aca425a7-2bec-425f-feff-08dd393490e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:26:48.8409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PJn9sohHV+QWOpvceI3G7pyHFHx+EW+q2xwZDoWWA4RvIcboZlIgBEbBjUYs2o/stWZG9/DyeOTtPu4xtxxh4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012652_980901_DBD849A5 
X-CRM114-Status: UNSURE (   6.69  )
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

Pankaj Gupta would like to recall the message, "[PATCH v11 0/7] v12: firmwa=
re: imx: driver for NXP secure-enclave".=

