Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3ECC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 02:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5U4g11OkSrnmSSzADawYDgAwhfxyf4tZ6Eo/aNcU8w=; b=P0j48WcCisv2kQW4yw3Nms/QjM
	che6w+V63YWGb8E+uX1on2UNyf6wHrdTxiThsFgYqJxYYtTLY//qvs55C5xEq7q9sf7dKKp903sij
	8g+M6uNlIH4P34ngQOlntTUQ8E1bHylIGReojuRYcL4J+GzbFeA2uPOvrSq7xp5L0Xa8Dxc16JxwB
	EAaGLMllYTLYzaOm3zP0dtvvnsrd+kL9yDEhIC75faJyRiLruMZFN0yNlnn6aXY9Z73D6WIt3Ohco
	NZz8ydVqEBGsvsHtzGJWdEAG5Rintr0PxhU2EeKYT+V2gzhK6HtearGZfsb0fpWtD15lM9rirF0P1
	5wWZTexQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u892J-0000000FoGF-0HL9;
	Fri, 25 Apr 2025 02:43:31 +0000
Received: from mail-southcentralusazlp170110000.outbound.protection.outlook.com ([2a01:111:f403:c102::] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u890S-0000000Fo9o-3HVC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 02:41:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn+FsLcK/CJ3l3dMXSDp30OOAwtDbU+lFRNdWk5rrfE/cxipUbeKyDq5AqiOV8ioAQR2ehxOEruXf86XxKJoEjG9NAUN7j2vBkXgy8VnGL10JwT6ZbLSrUtTPJ1INJQFZxFH/L4e3qjGpItTlbFkd3GJwznpLU89YKFf3uxoBVMwLg7ourTKZgOopFpzk98qhjM2gUdhxxSg4MBX0TIGakxwimQA5vi15nVkwVWOQJC6LS0MGbyDa2Dcyr75+SFDDQLY9d7uy0JOC2OYgnWWXlnltYK16m8fIpqUt+TKuy1BOSJgrDQc6jaLEQQbC//JEjeLR0TVjanakY/dpgqlZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5U4g11OkSrnmSSzADawYDgAwhfxyf4tZ6Eo/aNcU8w=;
 b=gcwhFqs0EBnONVtNSU0nrI8bYGjQQhsMo50xJ+crSGSC9w26eYtHN9gcCA9gOQO5ptnPRVQ/zlzvE3k2Oh+tA08Crut/0TvDNQWkSNXt9wrq8ggk1V6eqO99BVSmbf8ceK9rZZa375w4ldplU6iDjJLY7sxnQUFsZeb4g/q9QxO6P0MisxVVhEhyjHMshjG83pgDZZRgXEKTqTau57IjNnOzVgGpICJ1rwxiA0rwfWYLR5klnrckrjJUrwayDxQyFxZ3sT9lCbUZRrSAYnwc05LlY5YPKhnbVbABoCqpVst1AjnQflK8rTMoeD27gvfOZKjQkxG7zpG15+9rsnt7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B5U4g11OkSrnmSSzADawYDgAwhfxyf4tZ6Eo/aNcU8w=;
 b=USga2XnuqDnArg5htJYjaPgh3iWAOp/vkmF+cS5Tys7cZ2YSOhZ55qZd39UORl5+eEHF6U62AY15OMP9wZkTfOsMMNHnt5pRpWNM5DtNxQQecH2b58mscc+DxRpm0jTiXbSCXFUTU42eDNGP9u5cN5Qwn9jynZ5QJAS3tCihpUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from LV2PR01MB7792.prod.exchangelabs.com (2603:10b6:408:14f::10) by
 SN4PR01MB7486.prod.exchangelabs.com (2603:10b6:806:202::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.52; Fri, 25 Apr 2025 02:41:30 +0000
Received: from LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9]) by LV2PR01MB7792.prod.exchangelabs.com
 ([fe80::2349:ebe6:2948:adb9%5]) with mapi id 15.20.8678.025; Fri, 25 Apr 2025
 02:41:29 +0000
From: D Scott Phillips <scott@os.amperecomputing.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, James Clark
 <james.clark@linaro.org>, James Morse <james.morse@arm.com>, Joey Gouly
 <joey.gouly@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Mark Brown
 <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Oliver Upton
 <oliver.upton@linux.dev>, "Rob Herring (Arm)" <robh@kernel.org>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>, Shiqi Liu
 <shiqiliu@hust.edu.cn>, Will Deacon <will@kernel.org>, Yicong Yang
 <yangyicong@hisilicon.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: errata: Work around AmpereOne's erratum
 AC03_CPU_36
In-Reply-To: <86wmbkk1yz.wl-maz@kernel.org>
References: <20250415154711.1698544-1-scott@os.amperecomputing.com>
 <86wmbkk1yz.wl-maz@kernel.org>
Date: Thu, 24 Apr 2025 19:02:29 -0700
Message-ID: <86frhx9ex6.fsf@scott-ph-mail.amperecomputing.com>
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:303:8c::24) To LV2PR01MB7792.prod.exchangelabs.com
 (2603:10b6:408:14f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR01MB7792:EE_|SN4PR01MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: c880223a-6980-48e6-d307-08dd83a2aeac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8fA3QVBwjE3mjWyorxiQvGf2J//j0Qgor1SsDPtXJgATmbtGtFJPQvGXSm53?=
 =?us-ascii?Q?OjxDLiw7qzn4sBIumfBGzQUzyMXMhPfE+TjQ7f/EWXgUKncC+Hva/ZSP81Qn?=
 =?us-ascii?Q?vCDh8nr9SYWZCZptM8wILkfB8B0d+V7YQWxm2dRctaEc2OcvG4FYLa9CXuv2?=
 =?us-ascii?Q?O8Fxcf46dOo4BffqTt99/JRK++WZWycPuz6A+9jlx6L3fjbQwfHOXWd84UkF?=
 =?us-ascii?Q?bjwoMOXhlAdIExfLJ/TB8sKpKXkkPeMsx8EjXbONpmY/FU1JKJLWFlS9tlId?=
 =?us-ascii?Q?TtbGEy8mH5bigmBeDz59jpYEgsACsnJKdzxNeSLmAB65f1fi2ld2Rh9vt7GZ?=
 =?us-ascii?Q?W7hFQlinlqN/yiZj2mBOOjFqY85BqnWhIW3ioq3zUt8E7cjncxf+9w1ORYdU?=
 =?us-ascii?Q?bMSy5e6GEqxeJZL64eeAB8UpiKpVmw7tXqL91UmS1RDiSILd11x6EU/6mbvz?=
 =?us-ascii?Q?Ox0UNSlTyAr0+BYQOkEW4QdLDo4HGODUgKFNy+mg3v+bVeDogF7HEIsYXD8T?=
 =?us-ascii?Q?Kbv3DP5D8h5bUG/eglNOfmzVDQzycMHpP+FktuGjtsAOtjQJh2e7T9DZbm3J?=
 =?us-ascii?Q?uv+8KvPCLHSb4lDpeUQREkLCwCJQY2dSfDlH5UOIqvLebmaM9BOVH33BtsbC?=
 =?us-ascii?Q?/1bPK6sw/CGq3hyzwVD3rvyQV9B2bKGUwLfu17PIPmyOqgyze1Hm3Y1XNOk0?=
 =?us-ascii?Q?I2MQdI1KEXU5eqMURnw7yQKVC2HFYiBsyw8YjkyWRIIfqbGwlZzTfMWYD4qC?=
 =?us-ascii?Q?dadsrhtnvc+NLlgkujR3EfE8iMy1bFlVw8U2ji7swEIdYo3ChxSStXns6SEO?=
 =?us-ascii?Q?1zGe0ELN6e/e002PpcQzmczUgFbq1UjKi44PLHR8gxX1HXhMkSS4dBvh22LW?=
 =?us-ascii?Q?kCso75yTBZ5BxeZ9zjON4s3JO8UKCRAZUFwwC9H66BsYxwkQ5wWr9c/bccnl?=
 =?us-ascii?Q?CUFB7ttM04hP0tsgHrLf+P2Siz8UtCr0r/ZDfh3UEWY8NA21n4wPmrwnXUye?=
 =?us-ascii?Q?LdGw6sJQViBtgMF8DU9ZCTjAhi4WzFQK47OUXrLkMW7Rnjy2YniSfobaWmLW?=
 =?us-ascii?Q?GOSW5BwVjMZNIM7pLffzKuC+Gm1ajaxQniUVX1C8A4O35zungmTJTHgLQ6UI?=
 =?us-ascii?Q?PErusKbbBRyrKigYrvzLqOs3JiLWtESMD9j+Hi6YkjuJ7NiLqv6msZMROPgF?=
 =?us-ascii?Q?a4yuUzTSZxjBP4l0SXNN+AOWPFhLSwoxKXKtNKh/WAcCbJgukPKSJBJpI5uG?=
 =?us-ascii?Q?mWy17PTfMIscvIoxU7JfffAfxWYQ1hLFxStJDXcrsBfgyE79RPeod1WwoR7e?=
 =?us-ascii?Q?gmomxurFKTPt9xHGHTIB4PqjzIFJf96OwMxOa5nbORH5Xk4/W8qNZU5CCL/X?=
 =?us-ascii?Q?wb9UQZRNfJbRQU1Zk481nEkLcNBekrQGRD2lsdUqWy2p27/n5+w222cYJyjR?=
 =?us-ascii?Q?lIqzI7h9USnBVbbTk9At7NTLcmiwM2LmbbhWVN0w93mc6z7QQDgGww=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR01MB7792.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cwF8b4/p4iIcZ6usVP19yK+RzSD8l7nOX1J5BGESzOb16NVEVBUAuSXRfSkU?=
 =?us-ascii?Q?gRtf9Pr58BZFEhcj9JwXqQn2dhufvFzs/2wb8phWYJ3p71pr/KSnXf+JKzX8?=
 =?us-ascii?Q?GgmPDhqhkpk/EGHJAd7o5scntqFLY/ijVdb6GScnXR1Qan5DehgF0YjOqCZV?=
 =?us-ascii?Q?Oz4BPk5fqUp4EkluypLdPWpGR+BD/rj3LqGOxTWILmdPUqaAiZmugxPQYOh7?=
 =?us-ascii?Q?ufQRc336LV7RAurhDHnNMzA07F/ZFJYCCUdnPAFke5oq906avN/dF5r9KIXs?=
 =?us-ascii?Q?nq66kskdtgI23TvHDOs7w/P/ZhrLSU6D1VXsi/pHNp++5cTqSzbdkqpfTL9d?=
 =?us-ascii?Q?0jKNZkAZLECDEK4Jk7BAZZIfBaasGzbU1ti/bY03xZ9zDdJElhBOfQouCq3v?=
 =?us-ascii?Q?WL4mvTHk4ot+kQtZFglK6/I3o9zhIcSmEAY47uWN80EASceuXjwVSk0NY5Y9?=
 =?us-ascii?Q?hKxGkSVxrzirLXC0cCX/bAjTG/WvYVtTL3ZaCKz0wDk2jG+OFcpDehnb8ZLX?=
 =?us-ascii?Q?KKvDmjkhA0hqgAiuWkJc/a+PwTXuyxVGje0wzC7Ys+NZicKm9pdc6niitCh+?=
 =?us-ascii?Q?WA4IV3+Z1Izrqd22lFAJorxzGz5rhp7qmzEOrvld3y/A0CVX2bNh6lyaTkX0?=
 =?us-ascii?Q?Ql0//Cy/qtXxcqdgFLBEtjjeaX4luMVxTgfyOdmSklybaxzSLIFp1r/RCqM4?=
 =?us-ascii?Q?CC9IsNeUvlU3QUnio8LwhvgKG0CtgR8jCxxfMLUPp1ELBVYWQMIu4VEJpxNc?=
 =?us-ascii?Q?DU2vH9EaaC8OIsMJcYY0dRnqPwguX774/8pmjqXuG6avPv7VVgtBb6nlQGBy?=
 =?us-ascii?Q?ox2iy1P3JFIdGLhu6BUeEDd8coAuRsBj5Z//LUtWKkrAuemnKLUQYslYS+Df?=
 =?us-ascii?Q?pdLZe+BlbAUX0EqHuO9bLWrdukjw1xODuNw67FYZB2Wj+u7/HYli2kv7/jdy?=
 =?us-ascii?Q?mVkB/FIkf4HycH3nKGC/fPbfWCmIoUx9tokFc1foYMRjbA+zVG00ezEcTdy8?=
 =?us-ascii?Q?+dEjrFa2y1prdMcsIUAj6Rr4XpnsvemaFNKYHJPKt8rTtVnoiw3EQfD1TP3n?=
 =?us-ascii?Q?mIDbxqenGI4JPM9ImsA342XOcHRKtzwXYyTRrvAG55gwvtcf6JG5oAcw8SeX?=
 =?us-ascii?Q?NhvLjiSVZGBYhRfQSbZd6ge10qk/ht3jOH4uVbVrVvRhFYfAG0DpNjS3IHZN?=
 =?us-ascii?Q?b+GYAKBh6GdhtV8ouADy1/T/a6KGSi7wMQQHLPdRJoP4mGPPY0cibvNwzIde?=
 =?us-ascii?Q?FBC2ztMbfFrYPP3i2Sa2Q6CvSkMBkMvpWAbxEuwEjIPN+SPQ6clUwi5MCQhJ?=
 =?us-ascii?Q?cm1Y6eE3HFjpeInlZP2Z4CTrhTXMU5Q83RfwoRfi7FqqyCiVUXtXL51wCLEG?=
 =?us-ascii?Q?a4TUdxT7oF4MCqIGVBDA+UsmbkZvkeuAF7xaCr5mf8A4gJGSPoWyaemVlt2N?=
 =?us-ascii?Q?YDAGGnRMLn5IDYuFo40MPQ3Kzyk+R1VI30+H2q5IBrvdEUK0IVN53Ve8+D94?=
 =?us-ascii?Q?FMaYrdwnjFTk7fO5yUmkdNivnhRcZVkfg8b+plIwMfpr6v/+ziootcBIkTTZ?=
 =?us-ascii?Q?aBJMjqGqV33Y1bcR4aY9aQKDWZWWBCr50IuSvXp6PFceZuUKaaGvz8TQNqc+?=
 =?us-ascii?Q?eg5JTBFWVAcBYNqIuAxEIM0=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c880223a-6980-48e6-d307-08dd83a2aeac
X-MS-Exchange-CrossTenant-AuthSource: LV2PR01MB7792.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 02:41:29.7965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SeevedyfMN+UDb0Chk2lhujseeb3YQcgcMobTRjQVBeMS0AK1sSSRq/y7KmSsJIXVtHxISX4cPe1qE071dDl8fR1WrA2fGIgBxDW/7b/BObJLEbsNoNC0GtGHIwlAdLw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR01MB7486
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_194136_837359_843BA299 
X-CRM114-Status: GOOD (  17.37  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Tue, 15 Apr 2025 16:47:10 +0100,
> D Scott Phillips <scott@os.amperecomputing.com> wrote:
>> 
>> AC03_CPU_36 can cause asynchronous exceptions to be routed to the wrong
>> exception level if an async exception coincides with an update to the
>> controls for the target exception level in HCR_EL2. On affected
>> machines, always do writes to HCR_EL2 with async exceptions blocked.
>
> From the actual errata document [1]:
>
> <quote>
> If an Asynchronous Exception to EL2 occurs, while EL2 software is
> changing the EL2 exception control bits from a configuration where
> asynchronous exceptions are routed to EL2 to a configuration where
> asynchronous exceptions are routed to EL1, the processor may exhibit
> the incorrect exception behavior of routing an interrupt taken at EL2
> to EL1.  The affected system register is HCR_EL2, which contains
> control bits for routing and enabling of EL2 exceptions.
> </quote>
>
> My reading is that things can go wrong when clearing the xMO bits.
>
> I don't think we need to touch the xMO bits at all when running
> VHE. So my preference would be to:
>
> - simply leave the xMO bits set at all times (nothing bad can happen
>   from that, can it?)
>
> - prevent these systems from using anything but VHE (and fail KVM init
>   otherwise)

Hi Marc, I started writing up this patch and then realized that the
issue can also not happen in nvhe mode. While xMO bits are modified
there, async exceptions are always masked and so the "simultaneously
take an async exception" part of the erratum can't happen.

Does that sound right to you, or are there cases that I'm missing. If
it's right the nvhe is also can't hit the erratum case, then what do you
think is the right thing for me to do here?

Thanks,

Scott

