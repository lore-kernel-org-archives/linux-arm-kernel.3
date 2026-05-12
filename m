Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B82CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 07:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BQvqsDPIiLLXee18uinEnscC/Isnx6/C0B1jtawMyw=; b=HrAzQRjDOwETF4Lp5LEK6wKpJr
	AytUO4Ysca7yXFb7NsKCu9cLPm7wEImXum3BbNADvi5mvgSP4LZHKPD6f3Zz0ruT3rPYq8ucBmyfW
	uibQ9u1mGCQtHqqR6YX3Ff0sG/QKpwtXZWtqozl/yJoolCUnbk0yYlF1ToEwzRYzeUvIq4/RVFHKf
	X+BEBAPSQt2hzWrH7Q3mfTbAXBExuoPWfSDdoVEpRdSlicHqZalA0iOhE2od9YBB9/GzlP0Y+N+PN
	WNiZ6XhImFr/mGnvrjfTn5O5i2VTvmTI6WWM/424p3ZEEEqN+vncqPHhN/geoLdbN5DO1pWZE9yQd
	XWLGjfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhS2-0000000FuRL-0fvx;
	Tue, 12 May 2026 07:22:46 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMhRz-0000000FuPu-12uj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 07:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHPXc06QFsAqg5GQpW5DGgjZt6cCqYvVCHda9mM+Vhx+jggBQpNAN8xMP2sDxQ23gdb3K4BIUyRAFEmATj35LtA9SO81Jlf/O1n0FXvCmqJoOwy/+NBH3095NTP3Pf1WLF69eHIJSiDDOa6szw3CpKtRbAXUOtgfB+nh+4Efd/DilVblzoohL7Xdrv5EVl7KBGTGCM+flD05Yzq9A4yyWcEDbHYFdYImVqlK61tKMnqXJHa4vgUiFEoRIixLEimg7oS0xRGrHcBg+RgVSy40Pof/cGJZv5ccPUMVw76MFV++5TOYjT5ZZ2+9F8SaiYh0wjZPAOMlV+B9snSxknBUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BQvqsDPIiLLXee18uinEnscC/Isnx6/C0B1jtawMyw=;
 b=qE6ibZnk6+5wJQLXDPYbVNdueZUDgtprimNzIKarMvPrz55Q3Nb02LsPq3mBINOU4aON7G5KTQcsL+IGEWpawCm6JdxMf3JUIUbJb+gqfVskslLo6d72LoAJs87+Octtl6qR31xtHhC7lFsz9xaAYvi5NxC2ncTmHg0FlxXRzx/qGRMB8Bz8nA2jdoZ7LV8+DdqhF6I5z3c/ZuLW1jQ97z4SiZU02k8eAeYvQz5eAKF7pqVFsFXcnO6jd/fqxNF0tDcFdQA6SWgk2RoH+bSgVb9DRifAJTyBoX1y+w1nq45+r9g9crYcAjen3Mcn1Xr+un5yMfUU0UH2oZE6sW0TqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BQvqsDPIiLLXee18uinEnscC/Isnx6/C0B1jtawMyw=;
 b=P5s05HhINtVO032fIHBmfXGFkMDCM0+6tlGgkD8bGKsMuFY0I+mNWh0Ws61olnvNXA337XU4at45fPSsRhKXQr6e+a8me3OwQaEGP3hORwpvauwRkL+uZNDt4XuVKMXPe5LWqocj9W0Sod9K9MuMiP251m6Bqs/7pyhJoqEP8xkDUx8/3CAyb8qIVGJxOdhgc7debqdB0uABlp3bZqnXPgfh+26q9+bgduLVkMKjmn/KTz+BJCjcx7GiwoP8waxlfObz/99mLHxQb/1Q96c9QIU8UP5F+SKx7YsnlBrWm5yGdbDaiEtw+rzhKYHVyD7yfBBXdOtwg/KmN0tMdFrd4g==
Received: from AM9P193CA0015.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::20)
 by DB9PR10MB7995.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:39e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 07:22:32 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::6a) by AM9P193CA0015.outlook.office365.com
 (2603:10a6:20b:21e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 07:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 07:22:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 09:25:57 +0200
Received: from [10.252.13.51] (10.252.13.51) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 12 May
 2026 09:22:29 +0200
Message-ID: <c0dc5b7a-50be-4b4c-bdd7-ec6f92083070@foss.st.com>
Date: Tue, 12 May 2026 09:22:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>, Mathieu Poirier <mathieu.poirier@linaro.org>
CC: <tanmay.shah@amd.com>, Beleswar Prasad Padhi <b-padhi@ti.com>, "Shenwei
 Wang" <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
References: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com>
 <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com>
 <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com>
 <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com>
 <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com>
 <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.13.51]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DB9PR10MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e71eb21-8021-4d83-8b09-08deaff73b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|82310400026|7416014|376014|11063799003|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: C0J3qLL7sVkaqFzhoNnB2T1tPR5WriMJDYGJp6A6aQQZTX69JzyDQwioKvZKJRUWvZa5UxzOc2asbUYuuy5UDpkryc33Lgiy0Lqg1RZCzuo8wp9do930/1YhUA3VzxptpHjuu5obOOPQBC9y6PnXp2f7PIKchU36dsZx4+VCnijfK5Aw7dxfgDwv6s1xHrqOPqmMHju7plciDQo+RtkoVcgR9CmZnGYzrMtKmFUQCuWRMMwHsiz5soDUit0k66APamhJdrz1VIivokfLUsTtSd1R75QHt9K3crxe5cvfJficQObH4kG/T93wQlVSROniPl+MZ7CXrrMcw2ZXss2K/eJ0qz90X/iA2p1479MtLPbZbmgafvPNxAL78XswIgIqeV4Vq2YQ+FK4nuEDDtweXlIvZKJWUBj1vNIZvz5vRjbVZiABeBiWRtHfbCa+D4NUELNWALOf8pM2y17rc6VbfQ0M4GiiP7lasHu2AJoMPkyT1UJp93aUd1eCQIvPhgXNzk0nEdN+rB/fuydM9o9eBT43I54cm7U2p605Wt3qVtetvcZlEVtGW55jKRd6eHmdjuyR5NA/y5EeAHze3S/EKFssd8itEA8V3X4oFcsPUR6YwFSzlJNlM9tcfwB3V6Qvb/8OsyCS7ucTr/Jg4DfhNejpNDmyWsKg5EKVpslTpzOvRMX9P0Ke779/a6Z8KVTd
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(7416014)(376014)(11063799003)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bVtiIqSoF9pwSyv6C/BmQcI9qYWFUvsnie2aSbcdtFRpdfvmQpSGigNGW3Mqv+5hOczapxA9xlGT2eO5rc9MWh2ratAczCaHwpoESl/J98rOCTnfvdvzJGSFQC/6k8sXIRg8vke9/FpBdBUEnrjTSWuqoKhxNBpkL/o2lPSTijElZYzRe3JriVQJ/TyTYlUa5Q570M6NWbczxOSaco8UsMgBnQaiuo0AQCx2vuUS0j+BDZEFqXeWeShPVaw2F741HUU1fskmaZ4wBb9C68AIujYpNKKD9FNriR/RunPw3jFd4VubmPpetIViC2dDeDulVjNQDr5kMUiTgLdNx8Kc+YBhdJvNIGjKXEtRoFX+mOj+csSac1NoFst0Y+CRGXzsLypqoY2JrrcvlcDFk2q4hn4eZyeryffuUEXZF1gEJrZVxndrO4n7nrP5CyKRR0OT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:22:31.7999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e71eb21-8021-4d83-8b09-08deaff73b3c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7995
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_002243_749896_B1391262 
X-CRM114-Status: GOOD (  10.62  )
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

Hello Andrew,

On 5/11/26 20:18, Andrew Lunn wrote:
>> Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
>> GPIO controller.  The remaining issue it about the best way to work
>> out source and destination addresses between Linux and the remote
>> processor.  I'm running out of time for today but I'll return to this
>> thread with a final analysis by the end of the week.
> 
> How many of the participants here will be in Minneapolis next week for
> the Embedded Linux Conference? There is even a talk about this:
> 
> https://osselcna2026.sched.com/event/2JQpx/building-virtual-drivers-with-rpmsg-key-design-principles-challenges-trade-offs-beleswar-prasad-padhi-texas-instruments?iframe=yes&w=100%&sidebar=yes&bg=no
> 
> Maybe we can get together and decide on the final design after the
> session.

I won’t be there, but I can join remotely if a call is scheduled,

Regards,
Arnaud

> 
> 	Andrew


