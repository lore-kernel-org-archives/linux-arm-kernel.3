Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A6BCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGQcD+0GBgWfM1F0vfmTbPqDggOwK/x6uBNHXuiWoxE=; b=RNmTBSBQnKF0PmZw2kjNEQwmBd
	MCJlp0tNQ4w0XGB1Q5FazEeOdu2AeNHObrJJ56sHClZfoKMkbKi9/4dNPfgkm4p+SyfjTEDhDrery
	HY3uSsy1WoSonCw0gEVP+M1s45f7DiVF/62dYjSPG46nuJQH8wMbRqOek1V3o6WW1zIo9RLr+wlv4
	K9Dg+qK5LJTaWNtkuLZKWmKl17+mHEsPPKXhxOUiGL24nls/GeNBnRnXFnwXaJxLh4vrc186z2cSX
	iY4AW9DFZi+iTSDoVyW4KT7Mpz88fxPt4FngSVOMvf1yyV76etS4bIbytjhdxSXzFUwg7zS3eP3BZ
	3JKNdmWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ1a-00000000QU6-14jr;
	Wed, 06 May 2026 09:58:38 +0000
Received: from mail-swedencentralazon11013056.outbound.protection.outlook.com ([52.101.83.56] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKZ1Y-00000000QSp-3lbZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:58:37 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MpBEZsBMRij6zvMJUwxdfbFbKttP3Z/J+p0rjFHOiIEDXfZZxnwQJRlhVwVJMgtOklWGnYM/x7kEe6/c63uDLjIXyl4Y8K6iraj1IafJjcxJT3Y5hWks5hG3SEke+Xp8zMf5xbGFk8FvldYsAcqxNOxm4fDhP+SAOnaLjkYwQT6QBL/adFyIQDsfjzo3yERQrTVrPWef1VO3b5aSo9QuBjo1fLY3yHQ+u+4pYco8DX/Th1wWL8nGWzeWvErRAgbw9Ju80y8UZ49TLW/9/Zo5N9Jo9yLXijcoKr9gipMVuvgwbe631oFkmehyHi2DXrLdYFioF1qqEvI41y6FkzjeZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGQcD+0GBgWfM1F0vfmTbPqDggOwK/x6uBNHXuiWoxE=;
 b=Fo5L/niHbwZg0ouzyIk4IWgNNUZEKd/WUo2OZLx3MRlpmtcln20/Wl+vp+1S1CPxkr8y6tdI7nV1vyQbQLZvQdxgueUbly0PeZ4wRCwaklQmoiYCgj9afUSCtwapKmve419jPbqMgCHSYw87S4EO5Q18/R5x73KltJkZitutnjDD1FgFntMwUH8jo0NdXI27+qrvmDhDluLaJKwxCKemg5mhaAw3JkYrr3eYbXadseVdedii6Xh6nqzwTKRcDFdMc1DmOwbeeSYN8ngWt5qr1OGoAQE1F6Yn7BhliQ0ZXNR0vJG8eVstuu3wKrWkLKrmgFlP9qASZPo3wmys8RpTKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGQcD+0GBgWfM1F0vfmTbPqDggOwK/x6uBNHXuiWoxE=;
 b=CDMAmN/LSjRf5xP/vjznaaEfn99Rk0MyXYWy5oGDtytj/mShyu6OEGWbhez3Q924/T9djxvi5RmRCAXglVJsywetZuUxiEZvPs1aWXsnc8NcGbYvP6F70CAw2O3SOFNxfGHE/mnt4Q4QRAc2rNGEnwNqJqPSCpHxjjwN3qZYwmY=
Received: from DU7P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::31)
 by AS8PR08MB9430.eurprd08.prod.outlook.com (2603:10a6:20b:5ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 09:58:30 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::32) by DU7P251CA0016.outlook.office365.com
 (2603:10a6:10:551::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 09:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=trqi1sXt6vsslGlGabmpwRMRYOflrTFPxThAs3AS99TcMs65354BpWldc23bluMXbYs5q5GTl+IDRLNRX2LhZfSuO5uIMhDYfTV9vSo7C8FhmN5rVXpZr6NSmkBy7Wmx2y0rW+sZy2+Ykhy0OJ0RY4cdrC9Y+Alzwamqv4cXPrnMDHumqHx9TKZ6K4no6TsbBlDSeYDnJzb7Ck9+z1VsMG2VJ5LEmjPASqUes4ALrvY0I9064TlfWBGZJQVBTM7JE08iulSnOMjxauURTDY8o5Co9uL1n8EvZuvlV37XUlqDPp8vTU3UIVUQIDlP58hpGlIGgzD3prWJYdZE1js3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGQcD+0GBgWfM1F0vfmTbPqDggOwK/x6uBNHXuiWoxE=;
 b=ZiEonuz7qzUoZel+UI8G05R6lbirm2Gmik5Jpp22t/ojaUlvBNs6QHDm6NT5q4EWeXaOP7S7T8ZnIgCHreJtDSaXDmphqEjUIBCirpAIAWFAGZWcG+RpVraEhPfAjm+yHT99mToZhv8f8uHMSpO8tsvPETflo2YDWMy2/o5jh0h3COj5Iq/K2u7ky0SjC1WRie0uxI/pIOahTxz664UN62I0TFPSJjYyArSkI9IjdFjNxdkN2a93FqiZZKVkOQc3gKwUfxliuE98fSzkbF2Y3hQ1LP195byMyYlFelj++eFHJnY2B9gMnexBI1QQmlHOUeRP/agS4PGOgkP2xh1xeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGQcD+0GBgWfM1F0vfmTbPqDggOwK/x6uBNHXuiWoxE=;
 b=CDMAmN/LSjRf5xP/vjznaaEfn99Rk0MyXYWy5oGDtytj/mShyu6OEGWbhez3Q924/T9djxvi5RmRCAXglVJsywetZuUxiEZvPs1aWXsnc8NcGbYvP6F70CAw2O3SOFNxfGHE/mnt4Q4QRAc2rNGEnwNqJqPSCpHxjjwN3qZYwmY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by GV1PR08MB11002.eurprd08.prod.outlook.com (2603:10a6:150:1f4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:57:22 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:57:22 +0000
Message-ID: <c7e4349a-3c47-4908-b677-15a5360ce7a9@arm.com>
Date: Wed, 6 May 2026 10:57:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 25/27] coresight: sysfs: Increment refcount only for
 system tracers
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
 <20260501-arm_coresight_path_power_management_improvement-v11-25-fc7fb9d5af1c@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-25-fc7fb9d5af1c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0507.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3da::26) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|GV1PR08MB11002:EE_|DB1PEPF000509E5:EE_|AS8PR08MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 4483eb8c-7a2f-474e-9d04-08deab5606ae
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|56012099003|18002099003|921020|22082099003;
X-Microsoft-Antispam-Message-Info-Original: RFw6ut+7F0TaOXLMPjl3frq/85sPth6tra/zVYZiM4hFGJAAYfzhx/j9rmn8bU/C/kOFcNqxyBbll0JaF4tIlzbISVe1U9fXecOcJKEEHAHAcE+kD1evhg8yxhKt/a+5I78r33noZC5ayWOT4eQlWgpiCiQu01m3CcvMVhFBsrjZZ/XfcH3n/X0O7sOKeDicnz3UpspoifDTvsbV2qiHY/tWWzrKbIJX20sZ/YB5HTzVmyj39pb9f/2UbBDCscgNzVxX5jd6Wfzu2aUGwyBRh3cFeIW7iyzS4JPx5TJ6pTDynYK8qFjeoZtxQkbGFM5CquRDk3IBry0ty6vl6crrJ8a2NMDKhn6gQbVJPccG77d1cIhY4UtBdCO8xL/AKMxTYAzQWyNSe2GHp0eX9wW7ofRp4I4NLmMpErtxkUgKHi8F2mzvzY+iWg5M68PSMVvdLhfAWwbo1NfXjHcia/JQcPL21OpQMH4/3CWUaVXmbrr445/aOkhr2wf53GhZbWw5ZnyxIE9YFmxOTwpCPeVfdlbjJSROW8TvcquPD2mx/yMXQhOjneNvVtSW0I8HCerDq47H/iwVe567TkB43EmZDsjRJVaOmES/tyVe9t0qKx6pdnYZlZbRMQLfV4SXb32xMJqPcjLpolryEPtyEIw617rKkCJUFP/8P/qaL2PmQJz4c0z6J9yTwnrl8AogR5rF++kADVGdUbKbOUtIISv+ObexaC6FQmoy3e9hN1diYng=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(56012099003)(18002099003)(921020)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: dNO6qqZ2XA90PSMrOEdteKOXwGPwCPskaxvHDfp6PW1nGObEUpeqAKWRU3fMta2sHoJHasYEAPRUpI9u4PS2xtClJLZgh6rPctqYTgDCLTHgwwLQVs4YNKK5UwF/C5HhgL7P0HuuPHN5+GY/2dkYpw+ZAVxz9zPUsw1aTAJzjjJC3RZiOQ4RW24xbhpHK4R00P+smci5tonXuawaBz7YC+bmhikKvWwANQnkwqF/gR0T93ACc5v1OXauYUeQXsitDXoOT1yTCn+2OEx9MJ8ubQwmevEHN/CozyH3nFomcwKaHfKInLrD0BEhziOfQ9RTrZyROCHg3TYGex2sVRoiTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11002
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d895362d-1b2b-4ce8-c477-08deab55de2d
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|1800799024|7416014|82310400026|36860700016|35042699022|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info: dMKmYIlT8lZn6cxKoYx76wgHVgmgOEu6OiwmmKNf5U3Q7lV+nJszJehnKgJ4+kEitM4hu8WIWdkPiUCPb9u0BnC1/zrT5yLl+4zNFBgopJQjkO833+grF+VDvbsyFYL3QCwB0JksjHh0QaP8YBjOyqLPmdKIu6EBvHrfAAIQNLGUVFD6LSMS1gU+N4TgrrNCRqeT2EeG0ds7OE6YYmUAet6DcG9lbAoJzVXAcKCyKjMmekYwM2wqzfD6agbfUhoeVJiezon5q1H5W92eaoPoCGzjbhDEqwFY3jM/9Y+zE5/672k5QvxedeggqTiTQ88kXmBJ52ezGX0G5XJaGlvNrTfU5RjGlrTPCv9QgSISHRc9YBMrCKid3vin/bM5j1PyB9q36uzXW6dOUQgXeu4oHvyL7pvd+gDzeKeCcuFo9YnRGMhg0KCCREyNQe39qwGPr6Xn6xqvVD9y7L3cv85a6XCWvQ49Sa0H25y2uxnIbcB36NcjjRBmEPsPQDBkGeGQpOnjNmUOoxp7V+nx1pMEzuk2PJph2GnGU9JM9WmuMPCuetrbBt5tSzecw92xlDq7I4y3BXhmdqnCYD0VJAA8Et6VDBbKRN83KjPi7PwzGFnlhRzLUUw+vWIu/r8Nt2cxHZThgKagkWSpcIGqCGNjd+tvXnA3MRe/553gyXDTCb4yuWvPyCmiocEjLYJpNsDJ5Zw2NtNgh+LaidfcqN8XGJvL+dBbd6IK6+LpDJnnm/n40d0Wb0qqTvgmMH/4cvC6r5/bcDyFdiVgS0E1AZxkKQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(7416014)(82310400026)(36860700016)(35042699022)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +qHTZrrQD+UvTy4EdgG3htUwRcvWlaGO3/2SfqJu2pZF9TrrzVcqOpV00I7csfLMKFhgdjKLBVq2z4Sik6VIXS3MaLw2gnPgCi7upxJ4Bko1B5ZCFN/XMfSVekjsLt3QIqzaoW/4nV5Ctuu6TFM97NroiXNXYnD37ek/37SSlpliXG0UTS3tr0cb5y1bMwSQxtD9R23R4Jq+9nhvlwS2pK2oOLPm7WyHeePiuKWBxJYauqSph9G1QOwLk02SOD0mYT3JoxR2GtOeJhwFzbWniDhD766etzpx15YyhHJs6vyb0GQOK+KVY3dc0XUGaosvTQ6nIX5H6RIsXnffhEkJapwd1P0E4jukaScPkI3PFikUDz7Vaz6tvcgtIzjywi1r3+cC+1GUfT9puYAKYNabWEaasK72VFhYUleCndW7+ubVxLgwVAqd61+t9Jc/bej7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:58:29.9810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4483eb8c-7a2f-474e-9d04-08deab5606ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_025837_097842_5F4C0290 
X-CRM114-Status: GOOD (  26.45  )
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

On 01/05/2026 17:48, Leo Yan wrote:
> Except for system tracers (e.g. STM), other sources treat multiple
> enables as equivalent to a single enable. The device mode already
> tracks the binary state, so it is redundant to operate refcount.
> 
> Refactor to maintain the refcount only for system sources. This
> simplifies future CPU PM handling without refcount logic.
> 
> Tested-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Tested-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-sysfs.c | 41 ++++++++++++++++++---------
>   1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
> index 0aebafcb8d0e8e699652244af5202e7c4dc4e9b1..42cf07b8d15a420e963650000dc32bbb38f0aa62 100644
> --- a/drivers/hwtracing/coresight/coresight-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-sysfs.c
> @@ -39,6 +39,28 @@ ssize_t coresight_simple_show32(struct device *_dev,
>   }
>   EXPORT_SYMBOL_GPL(coresight_simple_show32);
>   
> +static void coresight_source_get_refcnt(struct coresight_device *csdev)
> +{
> +	/*
> +	 * There could be multiple applications driving the software
> +	 * source. So keep the refcount for each such user when the
> +	 * source is already enabled.
> +	 *
> +	 * No need to increment the reference counter for other source
> +	 * types, as multiple enables are the same as a single enable.
> +	 */
> +	if (csdev->subtype.source_subtype ==
> +			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)

Minor nit: You must check the csdev->type == DEV_TYPE_SOURCE before
check the subtype.

Rest looks fine to me.

Suzuki


> +		csdev->refcnt++;
> +}
> +
> +static void coresight_source_put_refcnt(struct coresight_device *csdev)
> +{
> +	if (csdev->subtype.source_subtype ==
> +			CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
> +		csdev->refcnt--;
> +}
> +
>   static int coresight_enable_source_sysfs(struct coresight_device *csdev,
>   					 enum cs_mode mode,
>   					 struct coresight_path *path)
> @@ -57,14 +79,14 @@ static int coresight_enable_source_sysfs(struct coresight_device *csdev,
>   			return ret;
>   	}
>   
> -	csdev->refcnt++;
> +	coresight_source_get_refcnt(csdev);
>   
>   	return 0;
>   }
>   
>   /**
> - *  coresight_disable_source_sysfs - Drop the reference count by 1 and disable
> - *  the device if there are no users left.
> + *  coresight_disable_source_sysfs - Drop the reference count by 1 for software
> + *  sources. Disable the device if there are no users left.
>    *
>    *  @csdev: The coresight device to disable
>    *  @data: Opaque data to pass on to the disable function of the source device.
> @@ -79,7 +101,7 @@ static bool coresight_disable_source_sysfs(struct coresight_device *csdev,
>   	if (coresight_get_mode(csdev) != CS_MODE_SYSFS)
>   		return false;
>   
> -	csdev->refcnt--;
> +	coresight_source_put_refcnt(csdev);
>   	if (csdev->refcnt == 0) {
>   		coresight_disable_source(csdev, data);
>   		return true;
> @@ -156,9 +178,6 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   	int ret = 0;
>   	struct coresight_device *sink;
>   	struct coresight_path *path;
> -	enum coresight_dev_subtype_source subtype;
> -
> -	subtype = csdev->subtype.source_subtype;
>   
>   	mutex_lock(&coresight_mutex);
>   
> @@ -173,13 +192,7 @@ int coresight_enable_sysfs(struct coresight_device *csdev)
>   	 * doesn't hold coresight_mutex.
>   	 */
>   	if (coresight_get_mode(csdev) == CS_MODE_SYSFS) {
> -		/*
> -		 * There could be multiple applications driving the software
> -		 * source. So keep the refcount for each such user when the
> -		 * source is already enabled.
> -		 */
> -		if (subtype == CORESIGHT_DEV_SUBTYPE_SOURCE_SOFTWARE)
> -			csdev->refcnt++;
> +		coresight_source_get_refcnt(csdev);
>   		goto out;
>   	}
>   
> 


