Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF9BC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 18:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phkEPNm95bzYNOZgAgMUx5XENpoN+CmJBdRK2AvZ+NE=; b=oYYynXAzycfrE2i3/44BxoSwVD
	B7dCfYMyTP9kkYAy3peUywm4f6rXh8QL0tAtaPuML7ddeOggaySKskWdLsud6MXOhyZu5rh6XTDwq
	q8P/nRE4NDrJXdcRZABFnzAsJRe37gZc4UsGIv8at9+FtJd7hmm1DxqA3pBst0s0ZFKvRJT3VZ5RU
	Yayi6g+Zz4/P8Np5OKd0qFdmCK+XLCeH21aLreIZeRibjADjm17e+lwazUn6rZ9A7Jgp/BiKZ2fJK
	pIZPGA4oeRB8Q+rt0B60G8YmRxITDNqwlUCZia19xrrKdSOTMQn5bNf+waDAbHKpOvECUDkJh63pT
	i9AEYAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaQp-00000001OxE-2dJz;
	Thu, 13 Aug 2026 18:45:35 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaQm-00000001Owp-1Zb9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 18:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhofyKQkrqc39yV28paaNDbVVVHQuO32jBZlOdMSXZ3SZKRz+7ERznW6YnAdIuh0trRY3b/fD8D/NVm0PhcSYg6Rf51chvMfeKo6kKm2fMcVs52QS1/IEcxaMJvsxDCqr81VPjv7DhtGfj28RiLztXJ8QSAIuom4pCe/9wLSuT2OGGNgmMAhvJWBLGhCe+lbH9zpjfNVr/TLVt+MSR5TWRjVjGlHHXkpA1zg4/wFsM9TVK7NwiMhG6KJ5Y9QRQsMP+aAoAcdtjPADShqe8MlrFm3te7DGwkbp+wqfShqS/lvEmq9/QgT17Idec1QvEMJ8PSHUTaEGNasQxMIBt/PsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phkEPNm95bzYNOZgAgMUx5XENpoN+CmJBdRK2AvZ+NE=;
 b=Fm231QRFda04K350x77UfTIOCTiJR+7+2ZcQFPH+Fvs1gUI+8kXXX5UQ6POYzEuvdH2RQyz6kiATJ7lNFwEe5jps7POuf+P4YWrUxP1fu4n9B3r2PsRvxCpO6ea9PbZKPIu2tRGPCVwP6s/KDOYo/LOscMh5wvE5Nm92uWCEykPi9fEivlWotk1wZxX9ycUi+hk382Uc1tCN/L8Y9/f6RXeoZtw3lkBJX42iFQHhYSsHImq2jeQRxByUNQlDw3rolfuCwhkGl2wnG/HoER4grNQgKDJIXQf01bDKjx/jl45DyEkhuld2jCreyeL/EzWpPHyfzAW5mA7nR/tggZdcsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phkEPNm95bzYNOZgAgMUx5XENpoN+CmJBdRK2AvZ+NE=;
 b=qOHRKSNN05sgPTN6fYFKuhUwjU7318u1L94w49HnpQLRD0XFos+oNhaApX5+a8AFjbF1/7Y2UNg/6QzUY86Lxil+gHMlvY45rTyTS0dlRVirqakFidUmmAGMXD3mPBVBlB0mnYhuoZRi6Uo1p4vfau0SfexPWggZWOXXqcc1P+XwsiSlozpEc3ekyhJRhMvl1uUTIlDHl/Eb6pPMhXw+SjDa9xJuCXaISvWS2k3y/NsERZusdm7bBIDu57rt2w2CrhpT0YP+lzVwdplgHYUsswVuXnOG7eT8wZbvRrlBaoq+5J0/AXUBxujZ8uHpl00GOpw4A1JwUiDNVGA30Hda+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS5PR04MB10060.eurprd04.prod.outlook.com (2603:10a6:20b:676::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Thu, 13 Aug
 2026 18:45:26 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:45:26 +0000
Date: Thu, 13 Aug 2026 13:45:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: imx: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header file
Message-ID: <an4Qv6kA-hnbUYaA@SMW015318>
References: <20260619122448.188046-1-thuth@redhat.com>
 <b82da069-b76c-47f6-bf8e-f47701cb318e@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b82da069-b76c-47f6-bf8e-f47701cb318e@redhat.com>
X-ClientProxiedBy: SA9PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:806:20::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS5PR04MB10060:EE_
X-MS-Office365-Filtering-Correlation-Id: edd360f5-f3c9-406d-6d1b-08def96b0a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|19092799006|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HylSyw5GKzhsfaEII455LXXk/mgYbfiyJbQVabi9o+Narvzu+yUWHcrfV3SHVQI1tjiN1BH7XIA/yHxvTHAK6xbalcedd1A8hoGxk6DJTpNqUCBF/AwwfxCLoQ7dHl3dlkcG7pVstoEHfNkjgNFh+YDgRDkzxqRHyVv0I2i9JH7Ih1U8n0SRnrEyFMZL5itY7xVfoI3zCm8H5GtUFXtrb8dKAqgbMTyjpIOehSsLj3b3JH587HbuOBw0wNW//uxrt1t6yqqmqEPni23K89PYp2v1UpNUrvw6i8r9t4v2uOdU54YT8edp7akrxD3HyWZY6fm7zJZ5GWf5ouRokDht74+JDac0U7nxMBT7CZJE9EsvtcAIXy1g1SMCOD9p/CkiYif6yjMaxLhIFCRv3YOwSXw2tzH4TGbi4VFse8Tv6r9k7uNsgyEkKEt0qvfDs3FYEjIHlZPZCV5IceJOB6/Job2ADwa0umiK7I6cZ+eMYvysvKadb5mwx2ns8VnM3iOl/sjDMNlVlrZTGCyNvRTn2wxiSXKQ7NU9T+V6fJ3xZ0pv/l5BriFTU23D5/roUioXU2/0egYl5l7gAXNWkXwddhrrxsr9QDdTuRHIckq61AM4Rrp8C1M0n1XNGKLQETgWO1lCukVVoaqJgKCxGDxx8ZQTg097TaFR0fknKTDiMs8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(19092799006)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I6b8b58A6ll0rt0xP2bYiQjVe0wrORxHbHyXVATgZn+lm7A5fAflOC9/CoZS?=
 =?us-ascii?Q?KLGJJ65+kTiEClRkaAxgnYdt177KC8DJBo/6sytXZKYWMZp8iKcb4CYH8NYb?=
 =?us-ascii?Q?siuI/kCJMLwItOvvTnOtYwwHidfIZcyluB4nJxs5IRZWlj6BS9b+ADe1IwAV?=
 =?us-ascii?Q?WN156FMXEBK4f7k13tR8piGSLviExEqrK1Mup4tK00b87ma3GcHG27M0o/mp?=
 =?us-ascii?Q?8DGmne/XYeljC7Gx4EHOyPFa2kP/IpVRruR/63wYINMFiICyHq0OBbkFpKQd?=
 =?us-ascii?Q?Op76iDDavqTpdSFLHGfvAPYVzTQFf6nFMevC1bCuUX+8R869CQjZALb0t/s7?=
 =?us-ascii?Q?6MKuBWWMXuo9/GxAkn6DaFeXCmUp5qByHChc+6qm8l/+pqU5TbwUcIte4qG/?=
 =?us-ascii?Q?7fjDTKveSN5KrgVCBANvQxMAqf+VkUMxOWml+aZTsCDg2s0PnqTNSZgrRrbl?=
 =?us-ascii?Q?tp0nRLk2RBMbt2+r5PW6fFC7FJaHgivAAb0AJ3R8JqSnXSk+DisfRAJXxNmc?=
 =?us-ascii?Q?OjhwTefvvjCYDmOXKOcAWFAWT9m9kEH4+MNzeE5kk8tFNadFjjr7m5sYWBG1?=
 =?us-ascii?Q?DXod1qiMHxoVxhr+NeH623Ry/Yuw3o3I2oloUgey8souxeYIndiZYzbDOARV?=
 =?us-ascii?Q?i2FTK9PnCw43MSFjfBsaZuVAHNxXIh0LF61FUuDeILRYkFxaXBsnYMTI+YvV?=
 =?us-ascii?Q?8JDuY4CaF5VEigp+f28Ssm85LHwkyAUvDi/WTiEgJ0uQtwxovh0zM0UDqIhA?=
 =?us-ascii?Q?50N1gQv11+lck3FnWdWmMW2J3llzMxLYA0Lwu5tVNm+t500obGojZc+EactV?=
 =?us-ascii?Q?X+1ACaXUfzX4Bdpolj9EU4r+rfwP7xduCAOwJQXEh/8ZH3CKF3CF09RjwrO+?=
 =?us-ascii?Q?THNNwSk8jh0W4lxCq6N1LBYE+58K6v4dBwoum388nUM+1VH5q7ArnJ7v6eWw?=
 =?us-ascii?Q?z7J/yTZ2JCS9UD04TXAHNTiZO14+LwgwlLOYRHYMSXMZlPGZgIb1h4Tuc7I4?=
 =?us-ascii?Q?mJg+31Hltcl74Zb+mxxLRqo/U3K8sjaWs70IU6EwtP/HNXsMmZmHNsr6jrj7?=
 =?us-ascii?Q?xV4N/yEBNs8+z69XkLs7TmwEq7kFxiomTKYceADaJqySShBskiARa0+yfzQB?=
 =?us-ascii?Q?YTzr0e9mY9WUktnAJdM7OnC3YEI3fLmD7X8vev6pjodw3HZ9R3znhQbXiPNJ?=
 =?us-ascii?Q?zzbIvbGDwcGBNU+rUAUQESuA7hCWDoYvCY8xJZ2rN4NUi/1jj/vl6vSYOMsc?=
 =?us-ascii?Q?HywsHyt9eoPCYnZ68CbJioPhfBcLnxwMoUDggTdKDSZ+IQgKtU4Kz/eYlvUf?=
 =?us-ascii?Q?dta3UxNDAxd5bkMMyv6nRKkzejGycgOZiN0WwOwYjiZsG74uCOdOfvwoZX2v?=
 =?us-ascii?Q?XWCs3K8QX7BHYZrHq4uEPF71SYg84P2oB145pbZW62bN09GZEKw/G0wr/947?=
 =?us-ascii?Q?5PfLgORlj5OhSVtSfIUozteJD6R155MCODUEt18gblIXmePaqN4fn139IV9P?=
 =?us-ascii?Q?FfV1UmsjxtmJUnRZ9AbcrVQaVyOkGVQ5bRLexxYFkqX3uWT50mkSWCN4r3vz?=
 =?us-ascii?Q?C0l0pkqiVxdFOK4WsdSxf8TjNREMIsl2auO4A++N4D6vfrQ0lSW/RvCyMmav?=
 =?us-ascii?Q?yMlcv07u26L06ylnybq0gUiNw3J30FybO87SE6/HhBs+Zfn/gHvoOJ9UuKn8?=
 =?us-ascii?Q?JfC1XlODiO546Kks1IkACo9ugcUoAOVYeHx7+3BHeM8rnnYqAXgctablh1qy?=
 =?us-ascii?Q?wlXBMjDlo0/egSENzsuzTrAz544xIIjrCEwbEtGRstwxM1w3L3EN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd360f5-f3c9-406d-6d1b-08def96b0a17
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:45:26.2449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnwzahszJ5O0y0SaFHV3lOp3cH9E7ymnYJLMrmHyhRnCCoF4kmBHgm+a4pNps7apGPqPbkoWz3bDoHf62eUUEwylwEuY3pdqZJNDyBFJHcPvek+GrQFK0yaNw487yKnS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_114532_426626_EDC81744 
X-CRM114-Status: GOOD (  23.63  )
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

On Thu, Aug 13, 2026 at 09:35:38AM +0200, Thomas Huth wrote:
>
> On 19/06/2026 14.24, Thomas Huth wrote:
> > From: Thomas Huth <thuth@redhat.com>
> >
> > While the GCC and Clang compilers already define __ASSEMBLER__
> > automatically when compiling assembly code, __ASSEMBLY__ is a
> > macro that only gets defined by the Makefiles in the kernel.
> > This can be very confusing when switching between userspace
> > and kernelspace coding, or when dealing with uapi headers that
> > rather should use __ASSEMBLER__ instead. So let's standardize now
> > on the __ASSEMBLER__ macro that is provided by the compilers.
> >
> > This is a completely mechanical patch (done with a simple "sed -i"
> > statement).
> >
> > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > ---
> >   Note: This patch has been split from an earlier bigger patch of
> >   mine to ease reviewing.
> >
> >   include/soc/imx/cpu.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/soc/imx/cpu.h b/include/soc/imx/cpu.h
> > index 0bf610acafd06..8c53150acd76e 100644
> > --- a/include/soc/imx/cpu.h
> > +++ b/include/soc/imx/cpu.h
> > @@ -30,7 +30,7 @@
> >   #define MXC_CPU_VF600               0x600
> >   #define MXC_CPU_VF610               (MXC_CPU_VF600 | MXC_CPU_VFx10)
> >
> > -#ifndef __ASSEMBLY__
> > +#ifndef __ASSEMBLER__
> >   extern unsigned int __mxc_cpu_type;
> >   #endif
> >
>
> Friendly ping!
>
> Could anybody please pick this up? Thanks!

Sorry, I missed it. It is too late for 7.3.

Frank

>
>  Thomas
>
>

