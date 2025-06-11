Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA394C7113E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDNno9+MVFM0JULjBJRkb2jrhhPTUgNHLTN/G8vKJE4=; b=ok6R3SOTy20bTjc9fVzWzcMr5Z
	Pvj9aknMdVr84vvygBAq0+Kwj3MFWBvunDmPgJXYOF/en0X6BuClxXdo1PAM40vGSY93WLpQoRqwW
	Yg135VoAOB3i2o5OPvMXMoNfkMIkdhBXuSWpKMGuYWSo/qmtNegBUUQQSNrrWlu63iwL5+nBDiJob
	e0wM9HPIHBRqHXZDgp+7j6CjM03Iv3mewqXEgDT/okGvmB5BakB8htcSJVpdp5UYeJiTNZRq/Mcjd
	W7eB3UHPal7EKU/4uLmqXORWtGaTttz4cF61WD3AOOJVh0huxuVdA8yh9v/vhAzfiimmAOPD5rbh2
	4aJQeuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMl0-0000000A9l8-3UN9;
	Wed, 11 Jun 2025 14:48:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHro-00000009UO5-3jPi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 09:35:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sDNno9+MVFM0JULjBJRkb2jrhhPTUgNHLTN/G8vKJE4=; b=PKl9cFFiS3re622q/XYYKtTeIm
	NptBrYRfdl0esTCpbc5MdvT/9CQIgDK9bQ7jxcnPsobsdbmYwrJpZOU6zluA3/DRCF4rGfjItUzDc
	YCC9Y+rmoRdOMCofQovaNKQVCgIR3fODb+8y6/wwQqPxd2EqbJu6Diw48YC5NFvQPyduSg/1rSB4j
	R8sDWap6h+vw+2iYrEOR+h5cHbfeK8dDxgRQa1N8EfNl7JCCR1NjPbz4l1fr+VtTNLk5rnMacdrqG
	bVPXJu0RhED44kFQ++t36kN0FlKv/t6Gff7nEF+Io2tBQgTQNBmsYZSDYWlqLaIIYSoiFEsZQYas0
	PGQTvtRw==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHrm-00000002EiR-0oHT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:35:32 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dQjoB3j7yoNt35M9jQyWGs/9SljZ4dGw42VtuQyTTv/yIGSE7FIFSM0gMZyjd4T4yYNjJ4DgDMBRMjnYa0r66PrVfgf1ieFIrLMudfyEBVlfOPJ0v029mV7obKxpF8H3m7jlGnU6eegt+QkFMXwM7Diyf5z5Qfi8U0aOkXwyeJTqmWs983rRovDgVFWxcTutHQ/21MKHZgVMuhtnoKyVRKsXIEmzWf9GWdCiBeX7CUTHE+KQQuvBLetm8Ui2IYJWMZ0YphVCAjsCN7MgQStWqBAA4dw1sQ1PJf/3EI2VjcxgyunOy+0l7hUd/Dfs0CaaTnMDitw9GsTOzaNfW9/boQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDNno9+MVFM0JULjBJRkb2jrhhPTUgNHLTN/G8vKJE4=;
 b=mxjgbtMdPVBheow0a8+3f0sm7H57VHabAReGC7qUS9H1ikKBQxECScJ0B54p7z3YmodSh+kqGbNi1xTmGDzSOtMA60mqk/Dgm5jfTIcAsBL+UvfVhM6MoGqzYqa5Q3foBSdoU55yPcpu+xvK2krv1dZvoWJpfyycSGSPu6txASIAZ7D2MvX3D81VJHEn8iawLNrXBVfAoZktq8UfbVORIG/ZLgiIz4scF8WTnDq0ghmTAd2pXx0Bf7rSnBtkLiNcuvdYEt0IBGAVTmq5pNLl79GSO3urZJbWeSjLKaDdmXaxZElSxCl2RQ2wInXK74OgKivtkuXAX5odcpS/radLrA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDNno9+MVFM0JULjBJRkb2jrhhPTUgNHLTN/G8vKJE4=;
 b=IaJPI5FdNwRsByxvFv2sD03CyYnhg/Q4YXCknZylJ2kj56oP1dNWJhezNTnD0TP10BvfRtuX/YLcEi11Mgg88R/WTYQj7sxq27dDH8RWNuAdZV4dlN5yRF7sxvzEhthfrZ0XfuztCN1XuhrHXpp5nNBpFtF2eTY0hmS9Hx4qjQM=
Received: from DUZPR01CA0080.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::9) by AM9PR08MB6162.eurprd08.prod.outlook.com
 (2603:10a6:20b:2df::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 09:35:25 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::a1) by DUZPR01CA0080.outlook.office365.com
 (2603:10a6:10:46a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Wed,
 11 Jun 2025 09:35:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 09:35:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZmzU4pNQo7QKsty+ionfg+WlItZpqw+ASgvW5HowF1CUQFAUI/7lsTuwt/8VMlBY+T/Y2b04W0BVJrNAVSJCL4i4A1xnOfrShXNT1Lr0J6cbI6BDIqtb6XKIafgG/PWXsxY5jZoGDcQZ1n2TxPGOI3IwXnBUZZVeupST6NkmHSU9Z4a8TjV6w5RNHbtLQJlhd3gkLjHy9Ode2KdaR1V6MdfL1sYJqQ+M1HdjWPrkhodIO8yvAfhnSQtOUo+kWr/U+x/lXJVmqBQHFfTzxy8SDi5vWEfWMNIv/vaMT9H4gN5WbBrSuE0O/LO2BWyRUgO6Pi/ucE3W7/igoQWBsxOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDNno9+MVFM0JULjBJRkb2jrhhPTUgNHLTN/G8vKJE4=;
 b=KX/63+oFobWtXv/ogQf8HmriyUEK6H/AZoOrVfglWZd/XMGdcMvn/H45ejW+14GQmuxeV5XFoeS/Gxkw5U0wz2dR0f9oVwXc7jREwVF3KX+LciAa4BOQHlZaFr0Yc7fljy8YoYlc40n+9HEaH30t8viYzEzzuRs1SecD0gYaaoWizAexaMiQSrrsokRgPp2EsltY7DpPVnic7DZv4ZhMoVPjz5l8YpHT82Op8P5nXOzoyQjJtFAHRw03fRSFZlMK+M1VDYVgQLpw0+ZfuyVh91+pWz+5NQ54kdk6Ow3GonMJvoJax3DmQ3C6bVSZhjlgpU0QIbEaohD5JE4rpqypvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDNno9+MVFM0JULjBJRkb2jrhhPTUgNHLTN/G8vKJE4=;
 b=IaJPI5FdNwRsByxvFv2sD03CyYnhg/Q4YXCknZylJ2kj56oP1dNWJhezNTnD0TP10BvfRtuX/YLcEi11Mgg88R/WTYQj7sxq27dDH8RWNuAdZV4dlN5yRF7sxvzEhthfrZ0XfuztCN1XuhrHXpp5nNBpFtF2eTY0hmS9Hx4qjQM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB9825.eurprd08.prod.outlook.com
 (2603:10a6:10:462::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Wed, 11 Jun
 2025 09:34:52 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 09:34:52 +0000
Date: Wed, 11 Jun 2025 10:34:49 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, shmeerali.kolothum.thodi@huawei.com,
	akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 5/6] kselftest/arm64/mte: refactor check_mmap_option
 test
Message-ID: <aElNuX+ddy0xcBUj@e129823.arm.com>
References: <20250610150144.2523945-1-yeoreum.yun@arm.com>
 <20250610150144.2523945-6-yeoreum.yun@arm.com>
 <69778d2c-3ace-4fbe-a55f-297e280f8761@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69778d2c-3ace-4fbe-a55f-297e280f8761@sirena.org.uk>
X-ClientProxiedBy: LO4P123CA0279.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::14) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB9PR08MB9825:EE_|DU6PEPF0000B61B:EE_|AM9PR08MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 29309463-fa60-48ab-f455-08dda8cb4b59
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?BUPC+KrGO3LPHDTSt86rBTMB0t4q41bCNk/xe0kTNDexcd06kTg01DM8YlQh?=
 =?us-ascii?Q?1uzOL489iLOy+bSolvRURz2VMcBQQZw82SbXkHjAep108gBZbCe9rN+9vs5o?=
 =?us-ascii?Q?DpilEOWBmi6SaA5Hmb0AeHZW9xWkjz6sAdEpBJU+xnRotvnvyV0oDx2aT8vg?=
 =?us-ascii?Q?bqLgcrvTYrCfrZiRTTL047xNutXHHfFu3l6PVbwYq4vslKXSqNptIrrOxpDt?=
 =?us-ascii?Q?LOOT7RWZ9/Q4KWKZ9rnhljQSyA5tV39HA7RDYJPGvJ0ewRIWidCidh1uYmUf?=
 =?us-ascii?Q?v2bpD+A9tPvkNc/qIYTi+qTMaiVS1FbyIhommnSZ0ybsd0v/OZkMoDpOscNv?=
 =?us-ascii?Q?bQMk3WJVreZIAZlvJ37yhaWa9YYtCNdJT89Dxb4G6VbyAY+sRu1DkvtSx3ae?=
 =?us-ascii?Q?CdnFMTftX7g5w/tZHkgi/aHMP6DtbrKUjQaGgWZjMdYxvgd/HEQorbRa5CI1?=
 =?us-ascii?Q?ZOd0cy4k3Llj7qijBpsjREGv8249UVSE15u+q9RItsZ8ljFZRPSxISsHIUd0?=
 =?us-ascii?Q?D+i2QDvzGJ1o5tGj3Ly9NtDWIm11bMDx6CYulTgnH6chlGc6aarAs7Nk3xfc?=
 =?us-ascii?Q?3nfZEAqJETIa8LyCTP74HzwPikS59lOU5AP+gznJ3yPzmv74EA+YeIQq+iIw?=
 =?us-ascii?Q?mGv4lgkzZQFUrR+vonx09ju4cZynuoEJcPwAj6CVxW8V++hE8JjN3CtrkY4r?=
 =?us-ascii?Q?nF60+HY2U9XNgTb8waj5DeJpyqISN2w1ty7lfkA04AHViCyuTcLavRrnWcvz?=
 =?us-ascii?Q?rMmGo+tpLIBc5NtRtR9Otr+Bpfyh35L9/hnPEGuSpy4GLHYjLHy2k/3zO9kM?=
 =?us-ascii?Q?3tVrMo9NoD9OvIQ1v1rFLaZL3lW6UTXIeRPbsvEKj6NcY2AkSyFCPin9iH3x?=
 =?us-ascii?Q?Q1Rmcs+5C1Ad5YriR0+1N2ojQa4fwq2P53fFRRK/lz6aM83jpSqKSMUW2qBR?=
 =?us-ascii?Q?YiyZ5eF8LifJNZoMj7/pgdVBtvfMnquYU9iEklYGK7Dwjr9g257uTGp5Lxku?=
 =?us-ascii?Q?uYSecAKbUPVr6DYx8GM1PrFLSvVMoSXAgGascflBCRrHuLvC72QzKclCUcsJ?=
 =?us-ascii?Q?rGzjyt4ZIewDUHZrN67UY/v9o+uSpuvk8Gv6iDg5oY5Bcq1e+FWNseidPp17?=
 =?us-ascii?Q?16GpvwSoXNcthKcryWKfrXvbHOiGPVCP5a1jeCpiKE1Z3A5fjYiUL062Lw6U?=
 =?us-ascii?Q?Mxb016UPAjmocto8MwIQOeJwRrtfqLjagT3+dj/Iw85Gec3tTf0nAdAuxKAq?=
 =?us-ascii?Q?1O1JsEECKHCkm0QdtmuBM5wURF6jUY0dLLjVywV6+07R6Mc3PPesULj16cq7?=
 =?us-ascii?Q?dYUBMrdDG94xOhRMJ+mHx72+CrP5VRGxP1e91OyvcEVBOo+Iv/s6mE1rv0M1?=
 =?us-ascii?Q?eYgYJxGYnK5qWCFZmn5dcVDGbMgA2KTA1JaAP6yNelKZMmRLRQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9825
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 18a2cd7e-f317-4f06-d3c5-08dda8cb3796
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|14060799003|376014|7416014|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AvO5NqhfKlDdETcuhRqNraanlLZbCduXeOHKMyyf4oI2t0zUwZyu0Joo1Ip9?=
 =?us-ascii?Q?tO8TL0vS9GWpN54LNJM+S8PCqqsKhRd7/WFBTVs5lP0m3zwdOsWHK7LHYmXi?=
 =?us-ascii?Q?hWVpzj7HI1/cJhygP8ZNwISLtW8uJOwg507lFWIVjXdYPvMpqrZVAnkmVMMI?=
 =?us-ascii?Q?jqe5BxX447+ul4HPArRy+lO35qjeHZ+NUKCfVXT8yzu8KiO9VVDV/v4CYKAa?=
 =?us-ascii?Q?ibSopipKwBEuL2nDUI98EnWPYP7Qf94EIECjO0hOS62FQJ2ertDgcKf5oSda?=
 =?us-ascii?Q?F6rOUR6I4DYgm5RcV1AlrwGi8lYk1iBgDOpB3oSRAMGgNxutIG73MEJKl8kw?=
 =?us-ascii?Q?Di+nn0pJZivmCKUE/F4b7dWSHASXOqySVJ44nL9QmhEoeDOi34PFD2sBu5y6?=
 =?us-ascii?Q?XzsdbCbBDYhpfNVy4Q0G4cI7C1m9UDKgOe6psgxquDbDeigqCitVL7VM40gO?=
 =?us-ascii?Q?4BjMebeDpzEVZKPYmh9o8p2CITUwyqGq60FZPYvBDgtxyS4m6NtmLW3ZCuCG?=
 =?us-ascii?Q?SbkKtOGFbnyDsJ9BLIZ/67Lf0If9CPf4LFiCOitC9wdDduHzrYqHvmWuerZC?=
 =?us-ascii?Q?oZOD2fHR3uKEby6ThSmvVJS/LN4d3+bO/BLh2AD20bLl1fRvHzWjVSi9xxkZ?=
 =?us-ascii?Q?HSjZSZ13Op/GohoiVMPJ/4ko6FNKPMvDrubm5JQbnV+JF8gvyGzihU9S+1gB?=
 =?us-ascii?Q?4r7q4Qd8ltwcoPy6iQlReDQT+HOKnhV0hVyhLMQyzI5jbEkyPUGRprcmNBpB?=
 =?us-ascii?Q?N5H+zTeMsi4THCsYeUtuM3qv03BxEiJWKgz5wf6xRpsBg5LRMBWEG58e114/?=
 =?us-ascii?Q?XXjjyNF6L7OGDno68ly0eRyYwS+k5VkOOeo6+ZxaxEc0fALe2eSh8z3fdhn+?=
 =?us-ascii?Q?4AbaVQnjNMRblH0HXM+r0rpc7JxGlz2yZi5TQQ6pJrRa7sksImRFTJlfEp6J?=
 =?us-ascii?Q?JSNjmvqh/o7tJ8u2KMdpzHOFAa7UleUbOBV66N2EelY952nPzL4VyXrTigbW?=
 =?us-ascii?Q?UGuev2nVQvbJduE6as6XZeUKr28iUgHc1ya3XdAHDs3boxtDKstVRmFNCSYJ?=
 =?us-ascii?Q?z5AFID+Eax/NUKtKJaf7Y3EkiO0PPJAaizqXBCnMEwplb5P6SCUB6/QsZvQx?=
 =?us-ascii?Q?22izW0o50iwnbO7i11+VEMJsg7wJbYCLijTsGYM30bLT7rCT9Y+D2ieoQ4D9?=
 =?us-ascii?Q?Ov+ydUYGe/vzcz/wHZvRmE4uAiY1+yqln+abgh+c0LDM6pGyLTJQSOf4Uh9K?=
 =?us-ascii?Q?1PrwTM7RJxe1hrYzjeEm3MkXyM9xGfU95Pv0Dz+3SYBNGC/3t1S/DHJcw544?=
 =?us-ascii?Q?yMiiKuq8ONUriHAufsZ6mROJvKZbM4Q0a/+9DPA/SB+Ln4anF39SLNer4lTO?=
 =?us-ascii?Q?E8ik8DpC1pRHxJ1hVhTPXV7s2qBlXFEson8XAF4f5yzL2el0QDaitqfwFkom?=
 =?us-ascii?Q?qaod1ckXZSNzUl1y38+Z2Om8/NtKG3y4twE0hUBAVcWkXUSdImp7BmbERQaN?=
 =?us-ascii?Q?fg+xlQgl6KaHbVXp72L6Nqg2xDNEc6IS6sXR?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(14060799003)(376014)(7416014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 09:35:25.1467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29309463-fa60-48ab-f455-08dda8cb4b59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103530_535995_776506E6 
X-CRM114-Status: GOOD (  16.35  )
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

Hi Mark,

>
> > Before add mtefar testcase on check_mmap_option.c,
> > refactor check_mmap_option.
>
> Please describe the intended refactoring here.
>
> > +#define CHECK_ANON_MEM		0
> > +#define CHECK_FILE_MEM		1
> > +#define CHECK_CLEAR_PROT_MTE	2
> > +
>
> Perhaps use enums for this sort of thing?

Thank. I'll changed to enum.

>
> > +{
> > +	static char test_name[TEST_NAME_MAX];
> > +	const char* check_type_str;
>
> Coding style would usually be
>
> 	const char *check_type_str;
>

Sorry for my typo... :(

> > +	snprintf(test_name, TEST_NAME_MAX,
> > +	         "Check %s with %s mapping, %s mode, %s memory and %s\n",
> > +	         check_type_str, mapping_str, sync_str, mem_type_str, tag_check_str);
>
> sizeof(test_name).

Okay.

>
> >  	evaluate_test(check_anonymous_memory_mapping(USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF),
> > -	"Check anonymous memory with private mapping, sync error mode, mmap memory and tag check off\n");
> > +		      format_test_name(CHECK_ANON_MEM, USE_MMAP, MTE_SYNC_ERR, MAP_PRIVATE, TAG_CHECK_OFF));
>
> Looking at this I can't help but think that the more common pattern for
> test programs where we have an array of test parameters that we loop
> through might make sense:
>
> 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
> 		format_test_name(test_cases[i]);
>
> 		switch (test_cases[i].test_type) {
> 		case CHECK_ANON_MEM:
> 			check_anonymous_memory_mapping(USE_MMAP, ...);
>
> That seems a bit more legible and maintainable.
>
> >  	mte_disable_pstate_tco();
>
> The management of this could be added as a parameter in the test struct.

I see, I'll repsin and send it again.

Thanks!

--
Sincerely,
Yeoreum Yun

