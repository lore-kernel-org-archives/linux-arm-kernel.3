Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE76DFC9ED3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfg1QlczRT6CzLbZKyarivIv9z64Dz9cZDzgA/fM4io=; b=KUc9VR3xhHNqVRliyPQPXR7klO
	OTWeN22zM36pOnGtl19nAnMnIKfQl26jGG8FHKFEk8G24BzsCojaiq4gz7AqZwUQtSP3M9aWo1nyu
	4Yo7qvSfY3pzHMVHceH9sdBGk7xqYLF7hQV9jGFwm9AUAdSJdcV8jfH4Qb4O06fuQ7sKL0Zl9GB3i
	hdO5NoXParaY/q7zkW84aSXvzH9+0XZjSJypMkwAi6LzwOHeImRtCjlrlWew1HxWEhm6a0OkBBkfk
	hrB8I0k/O8qH2sWcS5FstvPPvNDzyubCYO3Ix3kEJEJ+9KXC/benSmpn/Lv7wPCXvi/0SZ6oMwrhv
	xPikDqWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymbD-00000004zl5-1eRS;
	Sat, 07 Mar 2026 08:01:23 +0000
Received: from mail-norwayeastazon11013040.outbound.protection.outlook.com ([40.107.159.40] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymbA-00000004zkO-42FL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 08:01:22 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WIkEquUkhjPzFK8L8j0+qQI2p1bV3KLWjrgKyDsjWPWlRLRfLyRccVYVmr1hK8gXEMeL0WsE2+vkYnVCJsOOkU6gU66Xgj0XbGUINBdHO3gUNkY7tv30qwhjrOi2wQ9Tl3FcSbJ/nr61kH5CleqoLFZ9NMD0xLRLqF9kMjGV2SR/2JFDkbtcjCEfALc1YeFldWZsOAizOFIHhy2A/iKsLYk1TBZtLgwNG8hGd+wjrI3IzCWv9vYflKfQT8pLXdgqoh8uGZ0V34r/pLqGXCuBl8VP5CDj0E+X9xlLpfmts3pywKITzPh31qIgwBZZ2e4t7NobIisPq9M7ueMsbT5h1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfg1QlczRT6CzLbZKyarivIv9z64Dz9cZDzgA/fM4io=;
 b=N7XXNllQJPbP/4jDgSLi+/oJb7T1KaAWf//ZdHE11ncCTcampwq/5ZRhIyeA6Mp+3froTk2eNniPvuzGCkZCYWlWn76g7ywr0SnmNTFrgs/gkwhwzb9Ofc942Ve1tjRRokQ8uA1R9M9dFyTecRRqOYzbZ+fplm4RSkbFXJVD/ktD1NfhqFSaSoC7BA3DzmGkTNGCrg2luUHG59V3nWutCrtfORiLBypW+TWw2SD2EF5joMBCHbuUpcUPm7VWtj/FcKWtSoPoxa7Xi/6umtvJm7o/Svdh7EtWe5+6PawF7x2TFS+7jq8LQhg+FbAwQ0k1nW2rbw0OKKl/uR/OMJKspQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=huaweicloud.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfg1QlczRT6CzLbZKyarivIv9z64Dz9cZDzgA/fM4io=;
 b=bdVvrpSUVfSwAK2GnpULHc8y1v/YvjbSiIJXLjroLFC3qyg+Em8AblqVhhtDY1LC7Q0fMtyF9LT72mLgmu1bbyZBoDfU0Hm7Liz9xknFSGDueB/ga6znmLU82R+1LZN6e4zg2zqjoUZyWPrlyZ9Vsusj5XBWWZjdIvyrR+o9dUg=
Received: from AM9P193CA0025.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::30)
 by AMDPR08MB11433.eurprd08.prod.outlook.com (2603:10a6:20b:718::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Sat, 7 Mar
 2026 08:01:12 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:21e:cafe::df) by AM9P193CA0025.outlook.office365.com
 (2603:10a6:20b:21e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Sat,
 7 Mar 2026 08:01:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18
 via Frontend Transport; Sat, 7 Mar 2026 08:01:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyoVzrkrxDO1pNh0ICOZBO0totj8O17DH60YHDbY8g7EMly7DHH95uKWLqIioA5opa1ZTVonq/FrnZNn0Xw0V3ooDIegmJjkAaFtOHeeecd7l2ggERVxaytGXPdqFl+NoRa/59zRg249UmSeX9Xjpcx0YqveE5nZkVOAmsYLE8akVZ6RKa6fCcd3i7nkJF54Dq418lH9DCll0GGTRVv5V/iS0TQexHVnEDkcRBagLNixd5wR5Vm4ypQgyHC6DeN0qozM16PE5j0aSoL6+It79nHXC8olX9/LByhuHTYZGOdyIDWrdWgnubWqGf9dPgsKYBA1T104t0xGsvX22Krmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfg1QlczRT6CzLbZKyarivIv9z64Dz9cZDzgA/fM4io=;
 b=gbNMGJNi6uxOPpcBkSZgtzQmqf9RfFL4Gsx6pEEK/47lGbDpHuK/NqHpgUDskr7uYTZ3YDIiSyYZLPXO0KCCuWCcgqiG+eO5vj5WXQgdk+bqODNfEK2MVhdGcSNzmhys/iJjUu1h2mP+iTlavdfkVspZZBV4wvBmrggs5i+hAo4U4bH/fI7dN5O4sqG779RBxygThLJZRdDPvXZhSOQ1XW65aodSROKeKZ72EiEJFu/Jo6uWdE/z0LAnrhwACyLrxTjA+GLz/db1InU8ZQh0nUrKuHP4HOcgZ2S/h+Noz8GMjcTZXXkC6+t6DWCFjeijIxZqz33fXuqn2x86yH3n7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nfg1QlczRT6CzLbZKyarivIv9z64Dz9cZDzgA/fM4io=;
 b=bdVvrpSUVfSwAK2GnpULHc8y1v/YvjbSiIJXLjroLFC3qyg+Em8AblqVhhtDY1LC7Q0fMtyF9LT72mLgmu1bbyZBoDfU0Hm7Liz9xknFSGDueB/ga6znmLU82R+1LZN6e4zg2zqjoUZyWPrlyZ9Vsusj5XBWWZjdIvyrR+o9dUg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DB9PR08MB10379.eurprd08.prod.outlook.com
 (2603:10a6:10:3d9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Sat, 7 Mar
 2026 08:00:03 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98%3]) with mapi id 15.20.9654.022; Sat, 7 Mar 2026
 08:00:03 +0000
Date: Sat, 7 Mar 2026 08:00:00 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Anton Protopopov <a.s.protopopov@gmail.com>,
	Shahab Vahedi <list+bpf@vahedi.org>,
	Russell King <linux@armlinux.org.uk>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Johan Almbladh <johan.almbladh@anyfinetworks.com>,
	Paul Burton <paulburton@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Naveen N Rao <naveen@kernel.org>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Wang YanQing <udknight@gmail.com>
Subject: Re: [bpf-next v6 2/5] bpf: Pass bpf_verifier_env to jit
Message-ID: <aavbAO68+NvXzFAf@e129823.arm.com>
References: <20260306102329.2056216-1-xukuohai@huaweicloud.com>
 <20260306102329.2056216-3-xukuohai@huaweicloud.com>
 <aavIVDaVYy/tr7/s@e129823.arm.com>
 <1ca67134-011b-416e-b632-4ad061b76c28@huaweicloud.com>
 <aavSNxiY3PlGNeWV@e129823.arm.com>
 <e11c9a77-42f7-4610-88d9-58d9c068ac65@huaweicloud.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e11c9a77-42f7-4610-88d9-58d9c068ac65@huaweicloud.com>
X-ClientProxiedBy: LO4P265CA0165.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::8) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DB9PR08MB10379:EE_|AMS0EPF0000019E:EE_|AMDPR08MB11433:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd25fbb-c270-431e-c4a9-08de7c1fb298
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: o0Slt7HSULn4b5+IXk98+4dcxCQ5WiCesPbyIAQ36wgtHpDa92T+NCp83QLkiEGEpIwQILpFe/DMtcZ03TLJ3HyFOmmeVvcHCGSdUc24fWPzvP4VYdBN019C/3bFXe+4cbgRll5OVTJy4oq4d17DaGtk5+wjYiSfMgzYO4nUWuykoaa8Sv3t7TE4o9ejH2MStd8iN69KJAZtOVv6tAcXIfDrqOUQhyAmW+1nnq03l+Kh/AVCgGWvERzeNtWw/FETm80CPwGVgbA6eGIxwjw2Ev543SbSHU1SlMvFfyZ0X8mqwJcH8AjKm1lpJaldJsFRjEYUK7T1KW196KFhcDGJl94chVG3eE8aHLIusC/gqU42wyRTIe7Ru4OG0qo2SSZMrXnY7leQ//frSSLiCzUyb8YvpvvazQ6MhqGeB60x/IpFrD+rqsw0W+GDdFTIr4FoCx5ifDhE3WhGsNAOuTao40ZByAY0qR5JYZMIRSXsO9/xyZmLBsviytbFb2y4oabzVjqEnBM5xb9lvpKUAxys6cbiBvl09EcrdED4bZIVnBQTlKjkLqUxJL0SYtzY1V8WhmdtD371/k6M/UElpQWqLz2m4/o68D6VG6X7ECGJ0Clj1o+cJGFKPCS6b4l0DFRUN/V7AsiUt1442ZCJ9JplQ/J4RbfG4Ca2x+9tNJqIheRiw8pJQ0ZqHT6eJyPF5OERqDMD0iLr5M6TDUUybtFx5U5rr8O4F/9L/vufxak5abE=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB10379
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5cb7d7fc-3cd9-491a-5305-08de7c1f89c4
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|7416014|1800799024|376014|36860700016|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: PAfLkZhTYmkuYotN7GZSaZ+9oYLirn7Fy6I6YpP9Zig3klHD/dZvAK9xffCQPUwQh07MPRc1NwlkzVVEC7lIysAU0HZks9i6nizHvgCQ6llwVXLFP057GD0CmaAyu2ho2awPM81X6bIjIFE5wpSEYM0p2Bv2FXBpruRqREjgTK8NWbxfz+21dN7cY4x+HCA2vtyf9GAGjQ2SpNoTMBWiAMIMVyToVvxtrk5s3ut0xxMRQ1NnuTXN9PX4eL3i8DjdYL+Pjven0t+j1EPWate9EiCKWK+Zti3ywaMSssGARJuMwnwkpK/+IgKnjdklGC4pL5mmp+7Mz8wnI6CYBleo0QXhil336amVIOFipKDR9e/w5TnaTqHcQ7OtP9y95I5Tu7LrRlD6ACha0XB1taLymoqDMwvqLD9NhUD7VkjRi8ACTq7m7e5mtr00pMyAFHMPyQCjfyhequwv5TLIMvH3r9dknhSCFDWXR1psWR95SxboyEq9tzWuRF4qwv6sSsj2gDEbmYzPVtrDqH12lvyszSyW0PQJAZyte4JMgKwyT3XwEJSb5dQ8bXo9hjCHkW+KLXwMexxssMrsEU2XWtQMDhTkpJ5Ec+prKrvAV/sWAempe8GA/uaidzcKathhuyWT3qWLsA8KMMDxSWK10hhZRync9zy93+mJZPriXZvYBw6fyeyqD45MS64hTxaf8Z1w3aci+Rhs33qCu1jU+J2w2pwbidDFIUMPRqIUNppyuhVHogwUrEzLZpUnEyayEhkPFo23ToHJSi8oHQhVEeKtZA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(7416014)(1800799024)(376014)(36860700016)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RE3E4QWY3dohXfPzdIvziPSrgxjf0y8OVSAe2KmFPDSxFV47EMcDSHhAfhEBgojjf0kUtuAbE46jIQw8ZISsrEj9OgT+X9He54Az9YaqxZVaHUdSWBiUtoETyjSgfGa1+r5iL25BYm3WM4oqK0mSChGkAWT+tyQ0fvpuwxv6QAT8ksAhQ44WcPfJVvzLanjfGzkadIncnjJYu7nBYo2hWHepPTzoD467iWdafD4lhFdg3liecdcOZs9H2ayBm0jWXa0heut6spPZf1wzDbDGWxFW5OjmktF8oNT/5Sb03aW1Jhm145xuwv2dFdrzBobDL8d8Gk0XYkF6fB/GIK2zR3Ccwq2VB5TIe4qD7srOJsQOlxCLLCat7DiGLN4SUGbUwfF4x3DvHIKm0XhkxMnNvzZah4MmCV5USD3eLlDeNDO975Y66XKXvA0mnHFocxKh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 08:01:11.4376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd25fbb-c270-431e-c4a9-08de7c1fb298
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11433
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_000121_002089_DF793D95 
X-CRM114-Status: UNSURE (   8.06  )
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

> > Yes, I agree it work with the NULL when I see you patch but
> > I mean I couldn't find out modification in bpf_prepare_filter()
> > -- bpf_jit_compile(fp) -> bpf_jit_compile(NULL, fp)
> >
>
> bpf_jit_compile() is the old cbpf jit, no modification is required.

Ah. Thanks. It was not bpf_init_jit_comiple(). Sorry to make noise!

--
Sincerely,
Yeoreum Yun

