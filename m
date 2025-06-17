Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DFBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 02:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Type:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsJ72vX07X0sHzJlHQTlDcojSakv1cuDiQwEy/OUOUc=; b=qxxF243DCTdtcHNRLB4sZ68dLZ
	egFNSiL6Ia0zXd/qol2q5WALuOMtsyg/k4sXtbDaCTnywdirZzVcjpp99bUOKj55F+gQRITb1I2NU
	fsQWK3kVKWoYB1r2HPQmtv7s8VLGeIm+XETdshNRwfRRDHHDB3uxfnk+Cn8agIHZivREn1HHUhsQt
	bg+taf6rV8pnCA+LS9BfzC1Tid1/+hySzU4yLYE+AspoMuO86Gi2hxLNXI06p7rYKk2cfFRA4uaOJ
	v195pC94RwoJ3eYp2Zt7SfJ2Q8SuXEALX39QZIcqEDFBqVFCXFapH0HaO6sSrh47wcm7JvRIhbS90
	gz5WDPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLsA-000000060Pd-2D0U;
	Tue, 17 Jun 2025 02:16:26 +0000
Received: from mail-japaneastazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c405::1] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRLpn-000000060CE-2igY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 02:14:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POA24CJleERJLhtivn5+/NYYQOVAI6sH35AdT78ERZmsS4F3qdZ1xqarDzQiswh2/oBaViI4tCSXsQ37m40oxM64X03FqpcraTSHOLUzePo6jTgpeRBLCiYpZXs+53aE6QlTgqDAxjE3ufYmvjDNphn/pRg8UmE0Usz61k5HVXPAWSpuqmsCBi+L5OtZswJkmSHnHFx95p2f3A37wq9g4eW+sLyrQFGXFZynQQPoI/x7vwUgq9m/lKDNn3vAijaI46oxUwz/DwFdwCwszE6U5jwrApevuAauHp63X0l0XHXytgUfkBFRHWOISKR5NmTffWzop2pvpuWSWzpI3JhWNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsJ72vX07X0sHzJlHQTlDcojSakv1cuDiQwEy/OUOUc=;
 b=ZT176ypU8rmsBSe8MNEX2ljn79LPfVAJFogcu7nyd9M/58Gu1Y7czXyQaaAXJ3syXk62ApjgaRn+beEdbYzNKgRbqQmNZzZ8g5aTW1i41W4AKq0M7Y/gumPHN774srB90VWB71f1qSrkd8byQ2SKbTbS4B97l8ONgroRvcPAK0OZ0KJf9nOBF+WEGXXTz3I18Qbpq3a1pwYCtkeTPxbZtHRwAiBXwYmab3NsRYsi/S0I+6imI74uxYAW6fuySj9xwdH0tVmzxWYswtVKfAaaLEFN+2XJYaHFeeSodEA5g2x5BiedvaPwacqZyRb5jag3er/ngD2nLzQDBiqhWUeRHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsJ72vX07X0sHzJlHQTlDcojSakv1cuDiQwEy/OUOUc=;
 b=k84jFRo9hVi1TUxHXGLwEGFXT3xVox7uUQWVYur5EWg5ZRjm3fRH1F/ueFh6g4qnCRYkEcLAhlho38P9FYyHePlfUprYWeKeG78tht4kicBh/R8rE6xBpOKtBELwFNnr7d4tVuKzu3Z/uscarKp+YDiClhwvSZ8IShQbD0QDiSw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7063.jpnprd01.prod.outlook.com
 (2603:1096:604:127::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 02:13:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 02:13:37 +0000
Message-ID: <87ecvjnmi6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexander Clouter <alex@digriz.org.uk>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: orion5x: use string choices helper
In-Reply-To: <520f1391-a107-4705-bb11-02912cbc3b98@lunn.ch>
References: <87ldprnsc2.wl-kuninori.morimoto.gx@renesas.com>
	<eaa1038b-9a3e-4f42-abaf-8bb8b92aa482@lunn.ch>
	<87h60fnoct.wl-kuninori.morimoto.gx@renesas.com>
	<520f1391-a107-4705-bb11-02912cbc3b98@lunn.ch>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 17 Jun 2025 02:13:37 +0000
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: eb98549f-faa2-464a-25ad-08ddad449214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tEGckSgEJacW8gJX9SYqR2HPsELo7Qe5hbwMlTjqRamaF74KQjl91R3V03l8?=
 =?us-ascii?Q?GMQ9ntcHakK2dEJD4yhgH0EIBCgMg4jlmv0ye4KzVeZ+eMd+YDfGN0sBZYdx?=
 =?us-ascii?Q?1km5OWM/YtqI7xEEx1IPQeN2/0zCFn6aenuNNWhdOpcBcEO5KHD2qmbBpQ0d?=
 =?us-ascii?Q?+F1XYiIFQESsoAtceMkhJaXdO34Ev7wJB74tK8puWL0BQdZtmqWDkYFZl9mc?=
 =?us-ascii?Q?ipzrltBFpIbB39pW06aTcC31DXVhnurRJQQ7XIb9eiMMnuK2bhvlBav3VUn+?=
 =?us-ascii?Q?22+TXQgRCbnN9VtWaDfhu/R7CmLbW35Vxc4hUmmtQ4sXMdbzFIm4hEUVwVh9?=
 =?us-ascii?Q?wICsq8sLhNjuHyiH17YVt9+iMpVESxgkkkhzozl/yt0ZqqqjCCMoxho3fazq?=
 =?us-ascii?Q?IqHEOp1qgbDW9/RWYynUnycTpvsYYu6l1bfCEQ6doxNtxs6ERCTrCEQyH7XE?=
 =?us-ascii?Q?XlV+mSw/D1gwEnYjvHzLlqmiqNKs3SmjQwW0y++T5BRbs10dbelbMJodgOpA?=
 =?us-ascii?Q?Ypq5HH8Zp/vga3sry1jDThooxApIF8rc4ViXTYvd+GF3F/XfMe+9Akizg+HB?=
 =?us-ascii?Q?gJ9iklTq7l0rosVOA+bIH4PayItZlW5CXKno5cASR3nLchoWWibNTgApRVqh?=
 =?us-ascii?Q?k2cZXVXUgW64xWdIO4GLKxcIT+tpftPx/p+zKZj/V+Z6MnIEHREJZCsaar8I?=
 =?us-ascii?Q?X3whp9I3mrcl/BkC/YltLMBL3ej8/PsudfVcA8yj/NpdJInEmrQpvL5XdrTr?=
 =?us-ascii?Q?NPhnuTrbnCjAA0GLvjp+V26nOJVeKaOQK+oeCWJDJrBYNVVCTZ2comm06+Be?=
 =?us-ascii?Q?1urYGlrWNiLw1ZO23vjTDwsbD/8EXng5psP1MKpXKiEVOesGGWjnXbgPTOpc?=
 =?us-ascii?Q?Z4z2mPDj7H7hUHyuhQtFAc2mjKrZ8f0auzSPeRo9Nv8vchKy6xqN6upQDndt?=
 =?us-ascii?Q?8hvUQibwtjXQhMUo9eiKE0/VrzcGoeiy71IJMsHqlq6KR3EfUyUOF2lEqAdu?=
 =?us-ascii?Q?2cKI2vkqSGMq+GYnhQlvi/oJ8Z1SGfIs22KtfWmQrTy7SyLRPIq+gL/KaFbq?=
 =?us-ascii?Q?1kDY7/OP0CGyCQETP6Y2VTMDVb6+WpInziFFby5XSloQ5sd+anSCjdWx0mZi?=
 =?us-ascii?Q?+JTRbKhbeLHqm9/MnHumY0aY1UGafnQ0GLJAxm/euAY9MmPZYLSKdGpjDYCJ?=
 =?us-ascii?Q?fXcKV0e11r4nw37ZgwtxIZtC94Uq0Rf2iupAcPCyiypiw18NBdiSsGz03jn3?=
 =?us-ascii?Q?McgRMduckSR9kPyKJt/sM78qKEPmUcL8P9xrItljjOXYEWLXeeiqSO8mEsb7?=
 =?us-ascii?Q?9a0uY0jnoIFadjCRYA9hm8oz0FDU6kJ23feJs+qYCwzNU4bYPASjNm9WLBFB?=
 =?us-ascii?Q?ZTJW+s8hTAp+b3009ZOEeldSoRSLrhP9qUPVRsRVnmng9bD6lVa0yLTisn+z?=
 =?us-ascii?Q?q3EEGMcXkkKCVVMJpr0wHXKbWcjbUVf8CUhVrwljePQHrMKHDv9TXg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5LsknCJoCtnY0MBYf85NXPygRrkO2Qc0QcxJFmLSlreGZq45aBfFgD+ga3c2?=
 =?us-ascii?Q?4/c2aYRP0xmwguWCNhNCe7IJpeW5Q8CCrqtkEO0iCyjefJ0XOQvM7bgGDgEh?=
 =?us-ascii?Q?3XQNGE7+86Bm70FJ/kOqUoYOUjHOnsa2mlPiimT8ghByoGLczTV6e5lWAMMv?=
 =?us-ascii?Q?KC2R8DA/fp205GkLOp/N8TqmTFkftIrt74oe7Xnv+uAAHFjbYI5ZgGpIdxbs?=
 =?us-ascii?Q?kFBID/hhYCJ3oxMH7FtHPPonWwYDKwlscutlPr1NkGwr4i+DGPND1SaFR02Y?=
 =?us-ascii?Q?bsCscxg6BtoG4bWT52e/SRN8VT2d1F7FEXeWvCCTaJtoaBDQEHTX5zFpw4R9?=
 =?us-ascii?Q?n/DuY8yQXaCda1AIl3jZDLgrUfFl3tWthHHwJaNWBYsTNeg8XNKHQytlg+Cl?=
 =?us-ascii?Q?6rgeuTMqJrcxf8LbmcaLvbI2JByrxdZLzRztDeVKI39LcF6huP4tlPNIMSD+?=
 =?us-ascii?Q?hzRBWvl3fpL6Gy6AUMTeL3hiUwxc+LgwszGo/ep8BCTj7DtzZv52ng20iqIa?=
 =?us-ascii?Q?kXwnSCFz/ppnAda3RyR8Eyl8qJnmZLRw3KPkgbVCVSXRSPR1q7zrYilAzFVx?=
 =?us-ascii?Q?70EY9Aixo93D+fjz4VdmfK7AJvHUYgLKfOMVHUTbCX9wkvtcfUYJTx+ss/WB?=
 =?us-ascii?Q?G/V7ichHzBCznggDmvQSJFP+eATi+M4tcGgFQzZzfPPkfdzMVubzvsqauJd2?=
 =?us-ascii?Q?S0RMgZnYth6XB7BC/fSH4rQ8YF6mUmm0mYeIda9lL8vcgSwfS3yGU40Uak1U?=
 =?us-ascii?Q?Tr1C097ErBVoUYlcde0q2Hkyt3nOQbd9iNgDwHettBQCvHBpk1RYxap71gUq?=
 =?us-ascii?Q?7sYnGfj7nvsH2d1RLvy3k3QAVau6fu11CP6sDMjBIVObpPn1LZ6SaLG3BZTN?=
 =?us-ascii?Q?Y20wglP774Q6y7Y95K0fT3OgDjVK8S3F4tMznW60T8X52V8rf3EuaSzpGY74?=
 =?us-ascii?Q?xaxT622aqoOmj463FjNVbTwHSTYG+gVeuso5tO3Xmkd8iN/0ODxgisNc2Xdd?=
 =?us-ascii?Q?q9+swip5djkCg6qst+PX9I3uMpUtMk426OqIkFAoofbF3/lAPQGxsv88EGLC?=
 =?us-ascii?Q?aCH4uIdApIvJVMFil5MFtMrXk6lv86cLky3r7iuo9Jc2kDiUFB8druybvKap?=
 =?us-ascii?Q?V1pfzg5/Luc5tlsX0wdFcqf/hY3TVqvYZ1kLPnNgipeSxnYLXBiYmrANI8fT?=
 =?us-ascii?Q?podMMR2UfWu3ANLxGQjwhK8aT8uUqhICWXAmpM8pIrLbj+M+U9TZOpl3AkzN?=
 =?us-ascii?Q?/sB58KdSnryu82LLxaj3tE3kDaz9ouCKhqJYinkp9lueX4M97a9i6vxTU6xR?=
 =?us-ascii?Q?vhJseP4uRTVamqT6h2CHjevfhloSpnxmYS84lbXOS7IUQfU0qLaGW1OSbSPM?=
 =?us-ascii?Q?6yGQqpPopBOy8D/ZiJejVxL1KaZDTMZYLIenErOYM8xXhoNoWTLcZliH1Uft?=
 =?us-ascii?Q?/+r0FqUrhaeKghw/ePqKjLF3NpcPdOL35vhIBtC7X2TsvbEKIBIwvIoUezTP?=
 =?us-ascii?Q?JoRNJ5P30z+WXXiQJuWjPxpMGr0o5IDvnReylR7sSi8pX8ImcDfqTcGA9Ela?=
 =?us-ascii?Q?rSeIvXCwRiaDSdpGBvrmtVoLEVhwTH5uEFOUFETPRDwUlNJhetoe8xPGj+K0?=
 =?us-ascii?Q?QDD3bfTjqh0UeXH2bXl3CpI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb98549f-faa2-464a-25ad-08ddad449214
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 02:13:37.8167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0M1tQJOHN9vuPPT4IBMfix9WSpCffSKXjWwIsy8inQ4pd6ZwbIi/L8VhVRaTi6i6FEhjcayV+11Ot8KaAzWG+0Vz7DQ/9xafknNWk81uJtLf9Hi1vEVmtYAce+Hn0Tw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_191359_807879_6E7AF04A 
X-CRM114-Status: UNSURE (   7.64  )
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


Hi Andrew

> > > That is an ABI change. Sorry, but NACK.
(snip)
> > It updates format too, I guess it keeps "online/offline" ?
(snip)
> Ah, missed that, but you should of also mentioned it in the commit
> message....

Yes, indeed.
I will post v2 patch which mention about it, and has your Reviewed-by

Thank you for your help !!

Best regards
---
Kuninori Morimoto

