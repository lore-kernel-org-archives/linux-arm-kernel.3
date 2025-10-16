Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C1ECCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5wfxwSym9BIlN2iOAgSRDT9iY0bTwuht62/LkUbdF0=; b=ZabA7fEMCrWhX29jE5P7SMNjUT
	oY+4z2ie4pEZ6dR63vYPp/cZWSgEfErO79Gos4cqGreUYEvae3fvXIYrsH28VAQGnQQNoSKDweIon
	I++j7n7H3vnMrRMCUsYJP34UkeGEIU27/sfK1HK4ABxt7j5ZNrra1hw6d5Em5EmMvDWGgAkMVFim4
	l10UbwJ2Wq0av298b8+wdRYVquFWCMEGbGVUgejnt/ms/2koUqr/oIMPKL3qHCN8+TssdgVvlY79Q
	WgrHQC8uQ93CQ+g2N7rzoxnQ/zDUChF2aX49rUG0MTsNPmGu5ceKVmG1/vlyGS1oiWnC+m1v/N9X1
	xfnhUq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QPN-00000005KAv-17ZL;
	Thu, 16 Oct 2025 16:00:53 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QPD-00000005Jmb-1J5Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:00:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFCq7gX91E6BSUMiH8/3HS9W24bVebTszWfp7WpFuwOzCHu2vgbuqOr6DtQ0nTKHCUnlTrq8xNNsTs+wLZtcN/X7XqHjq/dsgJEadZ2Ujp/ooIOS4GsH8LmO9eezKvPC8kLbhxeEePdAHxxTkf0LyYnA2vp11qWpj0ZPn/NpVxumEdUBZyAG2xkvmGVNlV6xUYBqLqPHo9yPEeLJy47sSm0xEMaTVJ6azr4vS+qkFhFt06MbUpZj7K+Yieb8jIR4Cf58APF1SA1WtDqfeaLxk/Jbe/p8FTPnP9aZlJUNi2yZ1MTi65xQnZho7hBoLkr+KAXjSxBS8I00WoK9R/SkkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5wfxwSym9BIlN2iOAgSRDT9iY0bTwuht62/LkUbdF0=;
 b=ax4gosUq+eIAwvF2Fo/IriT6eRhkP+nge9L7CPnLNqO/yCpAtYfLIMiaQfXpR/Jp1CKwv/nHI0RbTn3h7Xu1ror+azko9TMhmKnJw1v28LSTwq48QFtGHN7XPc3CyknRdlhfV9VFFJ66XHUntHZsbwsCu4QISWhqa97hLJQc9CDxHjf8bk8WHCyop+09WYWL6QRJSZeEFMscogYU4gYvKPGIT/sTBpHfayir6vEAsvQ6e4i7NqlCoSj+nFznIVJvg6oXn1A12/zSe7tYJSXQ63ybav55Rhvbtd5exFzQSksNzaMvynQ5k3Kef+eopvOYyL+3RB0WoatoJGsePjxnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5wfxwSym9BIlN2iOAgSRDT9iY0bTwuht62/LkUbdF0=;
 b=B0T7ed+wlx0NdU9i+sr5UZ2sEFhQYFvRjnB8dLCNbTa14JqmImHC3l3oFQLbxhRIpIB77gDNrmb8U212CycH4GiGBo4ELmhXJHnczfGZn4vtyg/DiM7N5NZhssRdaU05PGkApvcG7A3idOPbktQgH4IaeQhx3Yp/ehesKJ9n/pxBIXXarW9UsDEQae4X5x5TM1EsCCgelHdwxS21/CqKEWcf1DedieDoFAMoj7cDdPsY2hjMKWQnASrbWsQ4qGqmvSGXeyKcVhW3jOVG7dMYEloJU8/wzBGFa5U36JHSQnvKhHGLD3W8shBoWdlXWrf6D87C3Nw7PXqlTao6d5dP9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by GVXPR04MB10069.eurprd04.prod.outlook.com (2603:10a6:150:121::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 16:00:39 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 16:00:38 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 16 Oct 2025 12:00:10 -0400
Subject: [PATCH v3 06/11] ARM: dts: imx6: change voltage-divider's
 io-channel-cells to 1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-imx6_dts_cleanup-v3-6-baf2814f8a15@nxp.com>
References: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
In-Reply-To: <20251016-imx6_dts_cleanup-v3-0-baf2814f8a15@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760630414; l=2194;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=viq9nA3ofPon+PpRpfguphppP+TdNUaxHYTA6iGn7js=;
 b=R52putPqe0ZDy/VXo3hCRnjLZtpkvoGYKGK/x55C+6hx4x3p89CbLCRqmpRkEi3lc6tcyxIcZ
 3d6Q+fcnyADCln1LA2mQbOOWQgrfnauKeZqBnv41MrWEui8kqCkpgsa
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR13CA0034.namprd13.prod.outlook.com
 (2603:10b6:a03:180::47) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|GVXPR04MB10069:EE_
X-MS-Office365-Filtering-Correlation-Id: a325253d-48ed-40b6-a24c-08de0ccd2673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlZlci9jeTFadE0rcm9ERnBSbEhaWjFieEx3Z0J2NEo1N0ZtRnJLSDh0TmdJ?=
 =?utf-8?B?aklTcG1IYUhFZ2c0aWN2MStsSVJ3TkJuVmRhQmExTmMzVXZ1SEthbFk2VVlq?=
 =?utf-8?B?YTZXWU1VY1hNenh6d0tmZER2RGF3VlhUVm1PdGNDS0ljZ21oLzZqR0dMZ0NN?=
 =?utf-8?B?Tms3Z2xiMUVJcjBOd0p2amxzbzlpV3hDeVMvQ3RHeGRtQ2ZRaVM3YlIzWUta?=
 =?utf-8?B?ZFp0T21wL1lqVDlxK2kxSVVSckd3aFBkcExBNHQ1YmYxOERPdFFIQ0RBNHNh?=
 =?utf-8?B?SFpHVVVlbVdTKzR6eHZtSjh0akRiUlVYZXZWK1hKS0RCV25mQmZ2OWx4bWZt?=
 =?utf-8?B?ME5ZNDlwbm1zYVh1bTBtOTVhQlYrZmRIamZmTUlmWnpmRU40WTJkK09qM213?=
 =?utf-8?B?SDRyWkNuSHdoQWNlWFY3VXovNFE3L0k2bS9Zdm5LUnB6bnFqdjFlOGVOdk93?=
 =?utf-8?B?TWx5RHFzd3VPanpFbUtWT0lINzRxRXp0d1NkbUltcW13ZCtsb0NxcUlFdEx0?=
 =?utf-8?B?MmR6RHVUTHdNZklLV2RDdlN4NHUxWkxubVZZV2xaVmJZTENuTEY5NHVLM09U?=
 =?utf-8?B?a0xtV2ZYYUxqbU1jWTR5SFpUUWhUUnovc0dMWm1EZG5DWTZ2TmVKR2FSK3h0?=
 =?utf-8?B?cTV0enF3ZjV5K1ZnTXFOYlltUDdpRkgzNmJibEtob3lIRFBtMjRpdG50Z2Er?=
 =?utf-8?B?WGN3M05GRlc3VnZPM1F0MXQvYWJWWFlXZWRFOVc5TzJBQmJub2FQS3ZxL0RB?=
 =?utf-8?B?M280bU4zT2hSeGV6WnR4a1MyOTJaVU5LN3ErSTg5OHJnNXNBTkxxeXJlMisy?=
 =?utf-8?B?WkJpR0haNmU4WFRzZlNEeXFWd1JBb2szbFlreGtyTWJQMmwzL0xVa2k2Umxi?=
 =?utf-8?B?SnFWbFNBUnBWNUlxV3RmdFFCK2k1SjEyU25wK1BPRURENkZTTm9zZW9vQjI5?=
 =?utf-8?B?MlJoOGZ2blE4MituNkdkZmR5V2k1OFNpcnhTazJITmNyTG9KbFpOYU4vcjNO?=
 =?utf-8?B?VGV2aGFzTHdvTnpyaGNqcUNKOVlDTnh4Qlc5aEs3aXdvYVJYblJ4dWF0NVlO?=
 =?utf-8?B?RUIvbk8zdjVNN2M5TnpTQmJTM2Rnd3VOeVVUbzBKQnp1VmIvVjF2anp5UDFS?=
 =?utf-8?B?Z282Z2NFOXFTZGFBdENqQ3Y4eVJxdkJpWDNJZXJqMjU3VXJ4eWxnKzhJcHBp?=
 =?utf-8?B?VGNJeDBvbTVqRHd5V1pOekI2dG5SbExHdC9KM085eTJNWjdJR3NMaFk4VzFp?=
 =?utf-8?B?OWJ2S3M2TjY4T3gzVHdGYjJ1S3BuTmJHaGU1ZlF6LzdNb0EwUkJFL3hhdHdp?=
 =?utf-8?B?b3lacEdQSFN4V1lXWHNXYjF6UEVZbjMvdHNVQk9lbWVvUFgraWZuUk16RFNI?=
 =?utf-8?B?UEQxT2lHdE1WRWJTSUEyczJRN3pJN1ZkN2QyT3lwb2NuSjNEVXZEY0htT1JF?=
 =?utf-8?B?OENDQnNOd0I5d25KL0hRM2JCNjRCZmY1SjZiRnRVUDR5VjV0b1Bocmg5cENY?=
 =?utf-8?B?MytaS1FJdCtPQVc2b0VFT0NBNTlTZGF0T3FtdktSbDdSUWNrdGJIUDhnS0tr?=
 =?utf-8?B?N1FhSEdnK1gvSWtHVmFPc2k4SmtTajZ1Z0dqY0p5YllkOXVGbENpTWNBSlRr?=
 =?utf-8?B?RS9nSUZjeWZHNUJwaE9xc0o1MENMRUt0ZHBLcm5ITkhNSWErYi9USjBOaGhU?=
 =?utf-8?B?NjVBZDN3QnVZQW5sVU10ZjRTbUFqYmNRampYNXd2ZHM0K2hUdmlZeUpjMGJW?=
 =?utf-8?B?ODMvdEFtRzUrb3hUUHNBMnNUajNNRzZHV1cybE5NRTFJNE9scmFsaUR0MEVT?=
 =?utf-8?B?cWNnMU1aV2xjL0xtVkRxUWlqaUVJTHVVUnpYbTZzdk0yMGFsQkEyNHIyU0NZ?=
 =?utf-8?B?b3NxSnY5Wmg3bGRUNENRdHNIVXZpUitBdlZsLzZGR041Z29tNy9JMzNVdmVr?=
 =?utf-8?B?OTBscFpuY3J4Tng5TTJNNk9Jb3A3Vk5DTHRiZTNka3JJeGQ5N3NrRTkxWnZm?=
 =?utf-8?B?MTlhMzBqZnhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0tWekFSV3dSQnoxaVNha0VIeTFEZ1FqNG43QThmZ0xrcm1lakFNN2MvNXFY?=
 =?utf-8?B?QS9NbnJrWE83SVArbENabElSZERIK0k3blB6SWdOWm9vUGQ2RUNEeHlkdjBC?=
 =?utf-8?B?VmgwNEdqbGpQRzYzdnBSU0RBWi9PL04rS2xsYnlRWDg5VWxEV2tDTUVDTG9V?=
 =?utf-8?B?M3ViVmxDQjM3Um1kOE1KT1BXRFBibVZtNll2aC9DRXUzVU1SQTVad2Zpengw?=
 =?utf-8?B?OGNmcC8raDFKUTFtRDZTemFVcGx0a0pOV2VuMXprTGhhTzY1QWtxUWNqSXJE?=
 =?utf-8?B?dys2SndQU3dYckFNV3Q2QmxaV1ZKaWl5SjdMNE5CU2ZPUDNtSW1UYTJtNHdj?=
 =?utf-8?B?MGlBczlNWStKSW8rY3dERGhyUmE5Z1RlRWpIY3puUnRCV3krb1lBaytzV3lJ?=
 =?utf-8?B?MDAvaE5FMUFsQWNJVklYVDY1QVlmWGlKQitxZjRjMGkwNUwyS1BnakJiSE9p?=
 =?utf-8?B?Qjl5ZlVEVTBmV2x0SnhtUGErYzh6VkFGTlRtUDBUZ2tDdUpibVJNOVZJYXpj?=
 =?utf-8?B?RUd6K2ZqWStYdElLNUVMSnpJQVR2d2p0Z1d3d0ZFVXpqb2lsWXo0UXhZYmYz?=
 =?utf-8?B?cmo1dHA3MlhGRG96MHI2N3pmc0lNdndXeVBPRzg3Z3dwdXZaWHoxb3l5eVNU?=
 =?utf-8?B?MktGNGprRTVZckFSc0FWaG14dG1sV0hWaWlJRGdkenVEQityVzY0QlExc1ZZ?=
 =?utf-8?B?c1B4bmR0RnFuWUVxelJIOHlvYWJvQ0FxaGozcGFreVdNd1dDUmM3aFhXK2ZK?=
 =?utf-8?B?bWRmaXJ0d1h5WlRnVlZncDYwT2Rnc0JRalRCbnE1Tkorc1pIMGdlK055VHFi?=
 =?utf-8?B?N0JvelVyMFN0TkxFR2RSSjNQMlp0UlBzSEZEVzRJcFNtT29VVm0vcnFuaXd1?=
 =?utf-8?B?eVlQSDhBY2ZpWXR5dGp6cEZ6VjYwQVNTQzdhMHZVQXlaeVRUMktFd1Z2QTVC?=
 =?utf-8?B?TmRKU1MvcHQ3THFSUXlKZ3BlT3R6RUNKVlBOWVIvSXpKWmZBMHllbVM3RzRa?=
 =?utf-8?B?MGpRUkNJZFlzTmdTYTdMQTk3ei9XMVRnVitTZGZFTGZ2Vk9CZVB2MHJsV1ha?=
 =?utf-8?B?RjdmR1YvNDJUK0ZqbjV3Y0NCNkd4WWFJd0lXUFRzWFpSR2FiWndEK1phN3FC?=
 =?utf-8?B?UkMwbjNDWUJoeWVwQWhkbE9FZUoxdytWS3lQb3RnQ2ZyK0pCaWFXcWtuT296?=
 =?utf-8?B?SENaMER5WGFwbkZmckN3ZzFTVkNLY1A1TTMyenptNFJiZWptWDl1SXRhdU9I?=
 =?utf-8?B?NjlTdWoxL3FlVWg0cFRXclBsYkQwUkhqZnZQZW5XTzlqVml6cjQxWDVWTWRU?=
 =?utf-8?B?ZnVReE1FV3lBQzdPRmxhMEk4dmdMaUNyZzg1MDJBSkNGa0hQZ1QxOTdhTklU?=
 =?utf-8?B?Q21vbXZmWWdtUFU5bTJJT051Y3lNVEl0MDI2QlBBelJibkpsbzhqWXJDRUxl?=
 =?utf-8?B?R2l4QnBCKzQwa2U1dHNxT2xWdTFaak9GV0hlUUp3VEhZc3BkQVU0MEQ4QVd2?=
 =?utf-8?B?YWRCRDlJd0s5WjZ6RmpDd0FkRzlxQ3daRDNSUmJ0cUVrVzJITktzdXA2cmRO?=
 =?utf-8?B?bHVCWnVKaWhabVV3cHdKYysyRm5INVBqdWZoUmdrdEo3bFhKSlcraytLNVZq?=
 =?utf-8?B?RCttSjlnN092c053MGxrQ2Q5NldSSkNyKzFORmRBNFAxbjR6NE9CMFRLUUov?=
 =?utf-8?B?dElYNzZpSzA4QW5xd3VzdytkVVJxdDRCbStoRHpRMDdkNUJEcEsvZEYwZ1Nw?=
 =?utf-8?B?RWhpTktWRURMeEk2bmtvQmtDVjJUNDFmbzZ3bE1nNFZMMDRNVmI4UXJYQ1Zn?=
 =?utf-8?B?Q2sxNzdIY0QxYlBMcDZ2dXE3K2FNckwwNVhubzJVdzR0cUIwTE81dmVpR3di?=
 =?utf-8?B?VjFuS09sL0VUeEI5SEhiYmQwK0o5d2t4YTRCYUNtSUQ4NG5YaWwzek4rclBO?=
 =?utf-8?B?aFA3WU9NWXZYbzJ2ZDZ0V0xYL0pRMVE1ZStMQ3Z3K3lCcEx3OWxNSFpGMUdz?=
 =?utf-8?B?VU0zak53SjBsQlAwUjBBMm5FNy9VRmE0SFVLNlZyUHVMNWpoS3lybVRqVnps?=
 =?utf-8?B?YVZpQnJxeEM3RHkxeW1mRFJ4UEhhMG5QQzl1L3JYQWcrQ214UUd0YWFvWWJK?=
 =?utf-8?Q?5xX3EfolfFfY7mqxhhZf71o/A?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a325253d-48ed-40b6-a24c-08de0ccd2673
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:00:38.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FwZR3uMER7djQFbtckGU5pH80XF9AFm5Phb8f6aGlXrvW16CZa0psP8jgNScYBTPTl1MQiRU9yTs/m8Nm+az9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_090043_352846_061471C6 
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

Change voltage-divider's io-channel-cells to 1 to fix below CHECK_DTBS
warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dtb: voltage-divider-vaccu (voltage-divider): #io-channel-cells: 1 was expected
        from schema $id: http://devicetree.org/schemas/iio/afe/voltage-divider.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
index c9dc48c1f9b1c36e33a55c64b9fa64262f011f8e..353f7097cb7e0256c7c89a36cb7568f229370f4b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts
@@ -55,7 +55,7 @@ display_out: endpoint {
 
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&vdiv_vaccu>;
+		io-channels = <&vdiv_vaccu 0>;
 	};
 
 	keys {
@@ -318,7 +318,7 @@ vdiv_vaccu: voltage-divider-vaccu {
 		io-channels = <&adc_ts 2>;
 		output-ohms = <2500>;
 		full-ohms = <64000>;
-		#io-channel-cells = <0>;
+		#io-channel-cells = <1>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
index e258e7b3b3fe792d061002a6b70bef4b22c5e89e..76b0007d20ad22eee738ab40ed126435a8fd17fd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts
@@ -35,7 +35,7 @@ key-enter {
 
 	iio-hwmon {
 		compatible = "iio-hwmon";
-		io-channels = <&vdiv_vaccu>, <&vdiv_hitch_pos>;
+		io-channels = <&vdiv_vaccu 0>, <&vdiv_hitch_pos 0>;
 	};
 
 	panel {
@@ -147,7 +147,7 @@ vdiv_vaccu: voltage-divider-vaccu {
 		io-channels = <&adc_ts 2>;
 		output-ohms = <2500>;
 		full-ohms = <64000>;
-		#io-channel-cells = <0>;
+		#io-channel-cells = <1>;
 	};
 
 	vdiv_hitch_pos: voltage-divider-hitch-pos {
@@ -155,7 +155,7 @@ vdiv_hitch_pos: voltage-divider-hitch-pos {
 		io-channels = <&adc_ts 6>;
 		output-ohms = <3300>;
 		full-ohms = <13300>;
-		#io-channel-cells = <0>;
+		#io-channel-cells = <1>;
 	};
 };
 

-- 
2.34.1


