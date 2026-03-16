Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B90F506D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYhaY6Tq4RzDU7ZCb0oDKuTXwEuFPv6u1Yl+P4QJ8lc=; b=oS0og2fBMslbbjbfViVwGy/HyX
	/fmOgZ6b+UCiZ/jhbOoJ4tUn0RIY0aT0f+qOH0z80t02/hMmbRt8gz1qe0wk2mTY5rL/9ntS8hQg7
	VM1+N3gqQ42DxSClmoHg/ZXNkllcUsMR2lcm8F/CYLp/YCv+L7MNCC84mt8XnVepYmh07s4tnZjJy
	QVwaR8TMsWWOvTwu7zdXXDhttcx/TDIPAoQUItUdfLLiUy3MbErHIX5Tzyn5kyPu/7O17Q32BpZwO
	TQ2TAgTcXqLqg6qvMrzACfWw9D1+5IMzCeMOB80/EmWYe/uDqd/SNbpmfUVNB9ciIus0NzblmztYB
	ywEgBHyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28xA-00000004BQH-0yKG;
	Mon, 16 Mar 2026 14:29:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28x5-00000004BPX-3tjt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jYhaY6Tq4RzDU7ZCb0oDKuTXwEuFPv6u1Yl+P4QJ8lc=; b=TOZsdgHI6Rja7tJShyVeGmU/wg
	/qj7sbovpYrODwCCxeLuCzAndJcg1dL7iT+18o2rRLFl/69HsRD7dqc2Ez5KEpcvVNnSXpDXDO0nE
	TBr5LQAHwApkWBhtQJzkq9bvRbzJXKDB/TpxRXQZkf6BC2FGepjUFRNna6dile+q54UkWOmqrR482
	CsGetC3H7RNdhMCA+h0VcO6Ll3Saf/Sbj7DFps0N2IvUhYLyyRhgVGmV6x/sV9qFc6Vfg/JNx9Tit
	uBkNSM0RzNrSTbZYXZy53QEU+Z5KhFxURC/lzwFQ9ahAod5iOagqmJDuHC/lRvbiOyIfsFbDGNqYI
	E6znSYwA==;
Received: from mail-northeuropeazon11011011.outbound.protection.outlook.com ([52.101.65.11] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28x2-00000006x9o-1h6b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:29:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=c1wqPlE97jUV2J4LybH5z74BTJ2rkBAVhv3flF/W0CppJ7hWvB/yG1qn1mk6eYxXCs8dMGeAfdxQkCuEDMIgSzjqCIoSD9RtO+xM0FmR635K8OSY7NjmyVDmXwFxaktIUS9zB84IPOKc9xPX+6vjBHIPhwOSgsklEo2Bx5BhK/x3M0ipsqdmeUlbnEK5Z9f73s9F7owMi1JaGt0EViXMV27F5efD3ZWzoIDQnjdYsuDk2XgRDshKrkT0GDfqzz7mj8VJ/5ujBfQR+YmPa3ZlTxqoDup6hM+4zra3wuTNeIwie7jakbnT1EwbNSF/qpB3KsYZkH59bi18D7VAffQU3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYhaY6Tq4RzDU7ZCb0oDKuTXwEuFPv6u1Yl+P4QJ8lc=;
 b=HoJE9C2gJ3/RBMgoEAw8QzV/JaH81OPZUT5op7+DB1zCJClqxU1KVumAZnRvytPjVRbVzyLuf+HM1BHVwFqz/hCxfZdQpif/IMDaZE6i8Kyw+d65iwwscwbvdbZN03YsFwIxWDvIuW/7FNp/VN3dFFdkQ8eHBV0XbAQyfmrYQsJyJvOMOsxNyymi1iajdLmZp+BZwoXrC3608bv0GTDX9mG+pI9hFHTMjuF3CrgeDxx9Fg/7+yMCA8AXR07CNqw6cjkcE7c+pK5c/fQTmF5RX4k+K8xSJQVIsFWjAKX+mrrOJZESWktmRQEEQ54ENwISH9bmJ5tBCrcvMGiwxBLvQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYhaY6Tq4RzDU7ZCb0oDKuTXwEuFPv6u1Yl+P4QJ8lc=;
 b=NvmVzA8Jjeig+Tf8Fe96znlfiq3i+w2mWEZZLtIydVuToEa7s/py7SiNIn/hX7bZqQfOBjDkNkZFjOI2fO7F/kfWEk5+6o1R+bGVPswRVHCGOPqvDUPh3PpmEVADwmTDcQAzkPEpv1tjoTxXUNSAgvtDGx2p+2tq8h8ELPmSs6M=
Received: from AS9PR06CA0393.eurprd06.prod.outlook.com (2603:10a6:20b:461::34)
 by PR3PR08MB5562.eurprd08.prod.outlook.com (2603:10a6:102:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Mon, 16 Mar
 2026 14:29:41 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:20b:461:cafe::2) by AS9PR06CA0393.outlook.office365.com
 (2603:10a6:20b:461::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Mon,
 16 Mar 2026 14:29:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Mon, 16 Mar 2026 14:29:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOkNpAEBe61HM5Fye8u9UNwnyogOBVoUyChtcK1PNOFoqqWBwDAhTAmFXhLbxqVZ3tBHSrz4YcbdYN1Cbm2J5aBKEJkdHDbxNhgiuqBKFVXElY55YZS74w+k0WElpirL7/mOzHTytmcPmzx33w971Fef9lpa1NbJylQ7Y28Xai7QTXumIXi8Wf0JayY4akbsptT8ajwTwLCt9WNogXXASy4Z101U3fHLwwAC0SAktQFYMpFqvlGblLWkb2R0X4xAenMIdEKpCxTZPHhXcvUnXffrzv45QFES4wBEbMA71m9wZxGIiFaHn+2iSf+iAhoFadCA/gjwPgRDK+PTCA7b/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYhaY6Tq4RzDU7ZCb0oDKuTXwEuFPv6u1Yl+P4QJ8lc=;
 b=yFkrwNoCAi0POZIlg3ndNtPwEiudV0twPvcYQfjzTJk+YzTk5UzqVSZlCZqkEn9gSjo1Q4V5V9o7DxJiQwcuWp5qdvGXWD7RRm22GRlbl4usspV9B74xemj1rm0gY7as+wYa7VKtfJdg6lsZCS2Uq8Gao9J/wk5ky3tQbOfq/ZV3+ZPMGpFMqTEkBWZwwJ6CncE3tLA/FBQQT2yk2DEe0quGNgZlWgwWcHl/mUGWlWpEgv7CIO/bVGj1Squ8OQ21IhfzzD8q4pdJ7ttxb3TJR6xSe7kGU+wyKwP9729Zrdc4UROU1tECe8fqUKI5/qstcwjvD2qMu8tpFAzw/vLBEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYhaY6Tq4RzDU7ZCb0oDKuTXwEuFPv6u1Yl+P4QJ8lc=;
 b=NvmVzA8Jjeig+Tf8Fe96znlfiq3i+w2mWEZZLtIydVuToEa7s/py7SiNIn/hX7bZqQfOBjDkNkZFjOI2fO7F/kfWEk5+6o1R+bGVPswRVHCGOPqvDUPh3PpmEVADwmTDcQAzkPEpv1tjoTxXUNSAgvtDGx2p+2tq8h8ELPmSs6M=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by DU0PR08MB8253.eurprd08.prod.outlook.com (2603:10a6:10:413::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 14:28:36 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9700.020; Mon, 16 Mar 2026
 14:28:36 +0000
Message-ID: <888e6c0e-f09d-43d3-a29e-ade9616690f9@arm.com>
Date: Mon, 16 Mar 2026 14:28:35 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/19] coresight: sysfs: Validate CPU online status for
 per-CPU sources
To: Leo Yan <leo.yan@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang
 <quic_yuanfang@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-1-eff765d211a9@arm.com>
 <13fbfe69-2d7f-49fa-a191-98aea3fb1f21@arm.com>
 <20260316140242.GD8048@e132581.arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260316140242.GD8048@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0324.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::24) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|DU0PR08MB8253:EE_|AMS1EPF00000047:EE_|PR3PR08MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ef63432-4e56-46ac-810c-08de8368754d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: 2AMKoXpFKdlHU6d+dMxd+uFPmyT31LMJ1PWZ3ZNRQlpWu3Zvk0YRh1zEcxdkWuKNXYReQ6QqEoQXpA3UKMvBozZPSsyI5Dej2wdYKZWfBxv+gT57bIylgLS1SBqqs4q67aut6aBx43kAGuor8yTjlA7wtVYUa5Ru/+2+txSYLWum3eYBCi+DN09bQ/vdKxJK76BNUd7HUPn+inkRnQKoKmsVa7mMakrafiEzFqIARUhVIgr1plM70fKJcUVMXUKVBNe0XGLTJi2D6N7NzOBo97QRxfjMqS9qTLTs4h9+kZ2GZziwNcU/vBtPyYHMMkYjv18WhUgRJOcBlhWXirEAH9xavh5zAcj7i74EoZAF7KPk65KIHhGzRMfDeI4LtUlcCg5z1royaAu921Q7F8zPta1UGwVgPca4BEuX8bR1Vj7oyhG27AmVXEp4QdkWNOBnYJQXVOMGXRLMJoAI9fcFs0MXPsvK9hv8tSP5YcD85ijGtPn914QpJpBc2CNpvRKQyHZqyomX/pcIOw9CgAUbYZlVf2ueqd6DUYcU7lvvrCXCBPFz+TY3q0KwYDP2bzxvxg8yMa8jQESiL5k5TYpzWWDLwFM3ONxkU1NV4NVL8gfyl6TYJ53YkQvKpcobR6CaQShrPHLNK5NvqTT7FUr3rdpx07QBYSox7thO8O7aj8SfmdKrJjJ+DA3thEXKYpWBDnvWq3OWKHfMvPJWsYBhhHbF+3fgodTE2/k0UTCMRHk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: WYtPKIunLMaEzZ8MAoO5u+8gmVihhj+hSawSwrHPXmKunOeShwH1xf3oJ5GWK5+HhQ6qOHamCF8gjngXihfGg21eqVD45YgXjiCnRuZrYqSbVVNQk2QFluU8EsI8NJaRNUbn9No1QU9OFSTlM9L6hA1YzQVInHsznhd8GjjuoFXSyOtyrwIOBToPC1nP7hubndwzeJ5VbtWKnNM3mKBsYv+pWT3EtU0IML+/dSKu9Ue/fQRsnR9CjTiNxNBuklGKaJ9AVe+LlU/TYou96qnm5v60PaG0phiZVeizVeA5m9SvzmYrorkAhu4gWQKzI+ftYzRr48n2knYzRkrNTLTrqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8253
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a82d590e-0a44-4df2-b75f-08de83684f60
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700016|14060799003|82310400026|1800799024|376014|18002099003|56012099003|22082099003|7053199007;
X-Microsoft-Antispam-Message-Info: +nGwQJozMSRWufI6Vct3ic5AmUkzTekFaQfA54Ar7uPF5m1UsuqWvtK39IMkPHcoQEDtk6dCU0YdGqi+NKfyoQCd1MJOnMQCutRflil0npGoEwznKC9KZPNk/eyCFqdSEC9KkKoQ/CUiIHiRuy2VuMCpsHBWEPB9LQWMQLDBJfeaLI4HYXKz8KExOfgI2NVk/laM1wcEMOIHK8yGvGGzu5hkUaJwO2eb6eoTIYsFBRI08doHvYjjy8rP6xWjVZU0/H11a5aiuUjCbF6/eFSDTUPeff0dKKrWs5LvsuBgUnQV3cxu93mKkGggMvvKvxTjpimDaRyFgbfxutQqlGhE8438vFAyvqZJ9sWeoyK05ghqDTYVT10abfQAVs3kgev2l+NXi95I1SrKRcC/wPD8gx8LgwpN730Bb1qyldsCImxz59yerCFxNjEILk5nbeUwEDLsRCknVETujhKNJYeSOqF+Z2z1EuheSp9CbqcyqivRLCHbydN8f0E+IPnyaOZYciRGiQD42YzxZUfqnu5ZMDa4oEYDNstwTU9/GgGqt+DqETHdOMv+cehZ3U/mSOQ7gucFRW5EORfnN4QQkRGTE7r3seoUjpnLJ+/Qrk19f4ykDkkY95n22kcOKZeKuW7vqhKWoXQ1xwUmN++QtF3CzZmxPn5l2UUw8rR47Ee9s8Eia6Q0XrLdJLWPfoW5Cb4hO3g56ZSoyYvPMeVZWZ6n6QApz9j1fdekvL8VgiaTzHHRVObT+mvbJq/8+ETppoz/EhAj9MV2qcSCTIiHM6gRjQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(14060799003)(82310400026)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wF1p7fjxPRYuTwPDliyk5I4wZQRw24sEBkaH0CfGaygUWa2S46/1f0TNwCHeQTQ+mYseXbtOTPKV3Qh3PU92MjdEg2vGW4c6WqbyNjTLUCgZ6nvSAxK9T6K5itO4vx7zulFWXVMbLWNa5PP9x4OBeR5wjis+C2VQMh1nw8svIhkWB3YjSLDQRi3XQpcSiCPh310yO67RGQ0VGbFzTB1rxs3DUxEWgpphIhaa3h0cFasN4cKN+yPP/K1yB1p91O7T5VEesPXaYaEZN4ztIpWI5YUegKDiv7UmA58b1VsTXBL7XEdFACVmuXgjwofFzfZDbpyUN1QrZ/EcQJ5WNmf3s4SqtIdZ9S4DRX0bDYd2gFL3j3wEcNlS0rQpTIy7T4w0N/sggv0HVYRJJ7z3rERqVk60jx1k/MBC09DbuZi3WjZ8X/lDhkXHbcb0sBeq/yyG
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 14:29:40.0065
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef63432-4e56-46ac-810c-08de8368754d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5562
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_142948_620223_2AF826BF 
X-CRM114-Status: GOOD (  16.05  )
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

On 16/03/2026 14:02, Leo Yan wrote:
> On Fri, Mar 13, 2026 at 11:03:02AM +0000, Suzuki K Poulose wrote:
>> On 05/03/2026 10:17, Leo Yan wrote:
>>> The current SysFS flow first enables the links and sink, then rolls back
>>> to disable them if the source fails to enable. This failure can occur if
>>> the associated CPU is offline, which causes the SMP call to fail.
>>>
>>> Populate CPU ID into the coresight_device structure, for components that
>>> are not CPU bound, set this field to -1.
>>>
>>> Validate whether the associated CPU is online for a per-CPU tracer. If
>>> the CPU is offline, return -ENODEV and bail out.
>>>
>>> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
>>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>>> Tested-by: James Clark <james.clark@linaro.org>
>>> Signed-off-by: Leo Yan <leo.yan@arm.com>
>>
>> While this works, how about we make it an explicit buy in from the driver
>> for CPU bound ?
>>
>> e.g., add a flag in the coresight_desc.flags = CORESIGHT_DESC_CPU_BOUND
>>
>> and then desc.cpu describes the associated CPU. Otherwise, defaults to -1.
>> That way you could restrict the changes to only those that need the
>> CPU (ETMx and CTIs ?) Also makes any new driver safe.
> 
> Instead of adding a flag, I'd use a helper to check existed flags:
> 
>    static inline bool coresight_is_cpu_bound(struct coresight_device *csdev)
>    {
>           if (!csdev)
>                   return false;
> 
>           if (coresight_is_percpu_source(csdev))
>                   return true;
> 
>           if (csdev->type == CORESIGHT_DEV_TYPE_HELPER &&
>               csdev->subtype.helper_subtype == CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI)

That works, but if a new device type comes in, we may have to expand the
list. Having a flag makes much more sense and the core driver only does
what has been asked for. I prefer the flags.

Cheers
Suzuki



>                   return true;
> 
>           return false;
>    }
> 
> Only CPU bound device will assign CPU ID, otherwise will set -1.
> 
> Thanks,
> Leo


