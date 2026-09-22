Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4937DC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/2LmMwa28+7I4acvlV8SOgZ21twcFfrFqwMyOER5xQ=; b=Xb14wERDOyrDwoxQWlWiQkErix
	wZcJyLPf04L0RUAbP/4RK+A1HoZDD+94zEi+rMXiMEt2vdWBTcOAmIjaBik/klrPHDZKZP8uxN8Ri
	+dMldhtokmgPxJMvRt7VzDsEx25Txf4bgGUS/kSLjZ9/fQ8KRDRk7GSZzZk/8YhDYjW+ZyLgNALwP
	ze4GsdSnfdute8elobkW6i6pZdz5DhgKtlYLfM8yLwAr0ug745f4EQyHlPLrXqdaPkLVKbohr59kN
	GCochHEyXHNuJTZGhrjpZ0mv/tgv8XSM2XrdrZwoU3ANEyFgIo210vxNUE4o7qik4mYlM5xS+vgjw
	brFjSsEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Hm-00000006JGm-0SHN;
	Tue, 22 Sep 2026 18:32:10 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Hj-00000006JEr-1wqm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:32:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrI94e/T5KmwL1TgXKVFc4UDC4QpRk3iuWTFcyK02g0Cn20k1liahpDt+aZ9GRq/NZUr/b8Z4vtg3RAvgMf7aCmmwz3tcVfpmHbfNZQw2qcb6hpytMkNhgnw0uB77v9OS0sJwKHJxb9V0WtkA8C99+z1jSYtEqAxTpD1QUqjkIIq5pjqDAdtIHyz9EB3nRl/VZI3dh/ue57ImWgEXO7DWkANSzIdi+QKMVKo+DuQTYCoIbu6fnbqEuheqc0151Yq9HhYfefH9m5g81786foJDOyNQi5CO4JNINfWs87js9qhAIXiX6SKLlXAqJHmNgcQT/Z4aryTgg/ZQG3+pcHx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/2LmMwa28+7I4acvlV8SOgZ21twcFfrFqwMyOER5xQ=;
 b=pQ2IBmMqGHOzBd0xBidE7BwQRKX8Pg+6dt+IyDyYXSDg6mqNRdDBNQcZNuW+2P0iC7obWtT8FPY3hSYMACpvDSfN8gRhMVa43JL+37xqmxRb8SdUfaoTEdwFO2SEwQmlAKd2ti4MaqiU6Sv+vXRTiPCH1oPces8/VcdV9/csByiC2U8j+sLIU6qWrptE6pFt9m6wOV26B9xSUg6MkJzwk8S+dFYURsRStZJbTOU8mUV3uM8RsMU9nso3FcCIOMqMm758fVs7qMmnPx91vffEm+DVMD7o05siE8b4b4rIGT/0rH3t1akY+7YRp7KL43wog5WoiYQow+y2qNpqAY982Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/2LmMwa28+7I4acvlV8SOgZ21twcFfrFqwMyOER5xQ=;
 b=Okk9kZGJStv8i62Of0zqcI2M6my+kETIAHD4iSafSSiUu/Z0VnLi1SvM27O7rR6QI17Bgi6llywN0/XnL9MZdLYVELdkDlKzTQTdf4DFIvOCwdDqqaTHZV+q0hITdUZMYO4muPHe0YHQWW9eQz0wlCzgcojETr6sr+h/C/JYq5e3yE0XaNfciaNiWBEr7aVDPoifJbwwYRbO0PA/waHlAUMPLunw4zCi9G2OfZif/ARB9d2eEtLsfhsvDul6qq3i8JohkEOs2PLq4BGdklzkiZBkEsUyMP9ZEaKCt3YgPMao1K8y32OsQSDOz1P+USYZrSn5XfwPtif7sst9w0LMuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8532.eurprd04.prod.outlook.com (2603:10a6:20b:423::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 18:32:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 18:32:02 +0000
Date: Tue, 22 Sep 2026 13:31:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Toradex iMX95 overlays
Message-ID: <arLJl3jyyytfS_Qw@SMW015318>
References: <20260922-v1-imx95-overlays-v1-0-694100afb4bc@toradex.com>
 <arKn0LhC5fty7dHN@SMW015318>
 <20260922165846.GA290956@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922165846.GA290956@francesco-nb>
X-ClientProxiedBy: CYZPR14CA0010.namprd14.prod.outlook.com
 (2603:10b6:930:8f::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8532:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c42fcc2-811d-46bf-dc55-08df18d7cb2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|23010399003|366016|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: j+ry/ljHQpFbHyxxpkEe+ixtrlbDhUIQ88TLi8NtUEeF+ir40n6yOz61dLzIgPp0gF83anUJcOaz+OpWeJgAX6bW+VhNyWK9uFFahOZ9R5u1qZE3lBT+IooxAbgOBZ/gaOakPdkAc+DJUhpoGLZTcLTHANUB1TT2L27Ldyp/y/c1PrIOta3+8JrTlnhxWTLtCJRWwzqEKNOLhecVRqJV/eqZRSqDey9EDilRy2hReUG7QiX/cmg/8Ngslz3h29YAaFzngiQiDTwaT//hphu6RwPDmsOvsxA4KLJmKQIyMTk/iQu/yLdJ+WDai7+73O/xJnYf25wTyqfMvLid9Deo1WqzUZI0ViE2XD8rA9lwNsrWqMBlwM/oDnMvBsUbeVLZfrOMCyauRQLKbv7qze3VVHluPcklKo56TGAS1TFS93hokEFos/ZQ+4cBQvT1XvWNRCo474SrNIzzs7AiVdNPUKbBfFuszsN0Fkjymf1qM8IbdyX7iGd3UMrLv6jpezWBKGlQEvSVV2CdPuesMre2jJ1vUKpqSITs2DMRiN604Qe2Wip31hr11JlMYoOYAqz+Tjai+hnbeS7/hsqvAHelWb4Be6iftuXMFZFjlttkN9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HxcimeDGTNdi2jsAetdiWguMNAcsqiDiHMkc9oobaHTUka8wuJLwLdWLESrq?=
 =?us-ascii?Q?Q9Q6U5rvD3HBwxAK9l52k2qwHAHVo8Vkng4Me9oyTSSgw4N6d2T1Pw8yQyFO?=
 =?us-ascii?Q?UbdvIqDLd5/T5zyhi047Etlj4TV8K7haWl2Uem6BIPbmd47IwpGE5wtdh1jJ?=
 =?us-ascii?Q?EUw8/N35X1wZDB9NgKzmCvRiZUQOsOlzUOWzkTGTHORTUh+/LASABSvGYo5Y?=
 =?us-ascii?Q?ePaSeV7sUVXQdtkhESyqr5Blfdise7LqS0ScwgeK2Pfs3aeS1sPMI0JZGwRM?=
 =?us-ascii?Q?2LyIO1pX6vPbDCf/ImOxz0b9aNRynlXLkm6637tNroEzYhgYsVwtiO/umj+f?=
 =?us-ascii?Q?z6h5TIAoMtsI7QgoRip9iZqZ16Wae4awkp/j5f6LOWZkItFCiTVqL/dDuBzL?=
 =?us-ascii?Q?vWl3Ie7SE+Lg7S++Oklt1rx/H9ao0xIGaxb/ivXMdVg1p/ISgRsveBrgtbJF?=
 =?us-ascii?Q?rgjU3JX3lkbGZ+e1Ylm2mf74MEbv2LLcD0sPMayb6WkX6bS65QWPlSMbQ6rU?=
 =?us-ascii?Q?XoHVlOki2ebf8lF+J01SbKDtPJQFyWTggCwHzvDqAZD0SdL+lUwDjGSA82Q2?=
 =?us-ascii?Q?Nyu+CTUT+fvNWb91YB+3A4rkraEfp+esGDfwIC6XwunB5YqHhEqBONEVa8sv?=
 =?us-ascii?Q?GvZUIMhqiFXHojhnWBKs3ATB9wJGXMqdyPPLmHllo77zwUZ5jOvoMjvhsD5c?=
 =?us-ascii?Q?9w0Dd3qfcr8HU+Kr/HhUn+OFHVCw59RwmKhl+bGplFeg0GctiP5qqNvIRqYK?=
 =?us-ascii?Q?yWAYuwZmyqI/q/nY/oopSGcTDzOelzo3wPqIQKDiQpuLHBwk7klk8wck8u3s?=
 =?us-ascii?Q?rmHbNIWkgoeO9BQxO6cgMULThkWP/2Hw35rfrJD8ELw0e8vmdWnmu4dRxZMO?=
 =?us-ascii?Q?1NFtXUzT08btaLt9rlk2abg9J/z7ZEGf2WT6eLQc7a8fBKv3BMqP03jlzXCS?=
 =?us-ascii?Q?v9QEIP73ApWgxWN2ct58GG+T93evV8LgAJ3R1HUTZku7gorwO3SbMUp8UHgG?=
 =?us-ascii?Q?IAy6bDneo2DGLrsbnAtF3a2nN3bHhEp3Y6waoak5AzXEkAFV7h2kfK3FTIPc?=
 =?us-ascii?Q?E53JHsf4MX2aqb+nNB2xIjAxpr2IjzCsK0gi080c5Y69e8d/KBlRuKkbcZDb?=
 =?us-ascii?Q?LIZwFxvMbLyci07V2UhBEQXm1J6xJ+unhiuvDuku+Rh02VR25l/mWH+kMlsq?=
 =?us-ascii?Q?YMCzg1m+R2m4dK6Zf0cbqIcmwOA7ABiPde/ElwyPqFfq5kCWizgBEccwDCUy?=
 =?us-ascii?Q?qQonsAljDaSmHfdb14j2TQRicFcJ2L+bgVXo4XqbKWCLl5IiG4gh7dNUo8i1?=
 =?us-ascii?Q?5c/0yAE/NZV4vaiBhmRLzjYWkbd29V2wVqwxvt036RXM4Y3TRQXkbOCJQrbq?=
 =?us-ascii?Q?DIdZ0noEy9MOyK2hWF5FqWjGFs0nnjdbj5sHEoUvhnho5Cz3/W6LfgYU3gum?=
 =?us-ascii?Q?/o4ivQVhhbqDLOoEVHw9LWxNA+6XJRxiAybdjBpV6aeWY2J2JPQBSh/FfzF7?=
 =?us-ascii?Q?OBBj6UySE+9GczVvZvl4DLFyoMJPvNzXU/37W1XWnKpSO8naHruYZnoaSHfI?=
 =?us-ascii?Q?WffUxr00eglxguDz2N4/WHw2/MZH4SrsnOsoOleP8LzajVX1x0OVqY0Vueq8?=
 =?us-ascii?Q?WTZ0VJT0R+mFb4k831KgMbbfiITkdsenXENgu3HLaLAD30LIjS2GfssQ8IMo?=
 =?us-ascii?Q?OZ0B5IGIxB4MQDhzcK6wrhgi19xQw+V6DPOi6DVpAOnyhJR9C+LWkLWgz13j?=
 =?us-ascii?Q?zP4wQM65gO/Yjck9HEYpqdB72CF7OqJs4rjyK//aqxURzNIjFACd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c42fcc2-811d-46bf-dc55-08df18d7cb2f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 18:32:01.9300
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KHnb01S9NyyI2qVrKoIFU6sc9JBWOP6/4pazhmegS3ENbFOYtJ28vkHIETRa8ASFzc3RHpUmqoJu9kUjaamp2fIHXE88bgO+83nT+pzmLMS1GkXDdevjop5kLqPxH8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8532
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_113207_514466_C67CF69F 
X-CRM114-Status: GOOD (  19.03  )
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

On Tue, Sep 22, 2026 at 06:58:46PM +0200, Francesco Dolcini wrote:
> On Tue, Sep 22, 2026 at 11:07:44AM -0500, Frank Li wrote:
> > On Tue, Sep 22, 2026 at 04:33:45PM +0200, Ernest Van Hoecke wrote:
> > > This series adds device tree overlays for the Toradex Verdin, Aquila,
> > > and SMARC iMX95 SoMs.
> > >
> > > The series adds support for:
> > > - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> > > - UART_4 reservation for Cortex-M7 firmware on Verdin and Aquila
> > > - SER0 reservation for Cortex-M7 firmware on SMARC
> > >
> > > The UART overlays mark the port as reserved so Linux does not claim it.
> > > Firmware remains responsible for configuring the UART and its pads.
> > >
> > > The Makefile entries build standalone DTBOs and ready-to-use composed
> > > DTBs for the corresponding Development Boards.
> > >
> > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > ---
> > > Ernest Van Hoecke (4):
> > >       arm64: dts: freescale: imx95-verdin: Add NAU8822 Bridge Tied Load
> > >       arm64: dts: freescale: imx95-verdin: Add Cortex-M7 UART_4 overlay
> > >       arm64: dts: freescale: imx95-aquila: Add Cortex-M7 UART_4 overlay
> >
> > both reserved lpuart2, can you share one dtso?
>
> The comment in the DT file must be different because it's important to
> reference the actual board it applies to.
>
> So to fulfill this request we would need to add a common dtsi, include
> it from two different dtso files.

No, direct use one dtso. see

https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtso

And makefile to check how apply the same dtso for difference boards

Frank

>
> This to save 2 lines of duplicated code, `&lpuart2 { status = "reserved"; };`.
>
> To me this is just worst than the current proposal.
>
> Francesco
>
>

