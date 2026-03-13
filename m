Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBE0105F799
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r2XBGxehIqt23NwKqCQBTjEkqfA6xVuwk8F5FLq1C4=; b=fw14BHdYjO54XklMxUbKGkOeNO
	wf0B4GcH2caSNScM8JjrgbMAbGFggZAO7/fCfoA8cAExrJIN8jzt1RmYB/zVZooNYqIhh0hWU5dVd
	DHmWRaJ3pO6d+kCIhUOannRoy0dbBy7vppR2YqvQ+34qzKHbYGhiG4d8FoHpg0u1dW41JN68GkZKw
	peK9adp3/iUGl2HkzTcv/7GSRkJtwKW+TeTge/XfhVpRgQNUawhJ/Ws+f0uGJSm4C9jNzIZ8xmIAu
	sEQDp0cNqZuWxQOxYodWFgtoqnLExc8THAalLGeA253nxc1DWYBwrI6AGO5IBvZWY7XDAUSCB1Fu4
	TDqu/4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10YK-000000000x0-3lX3;
	Fri, 13 Mar 2026 11:19:36 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10YI-000000000wF-1KkJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:19:35 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gQvumBD3eknbQCZdmUs7gM5ZB/ED1+tJzQfmO8tSsF5sOQRfG7c36JfUrPoUVm5u68GtvsY0oBMV9B2yJlJ9ZLGlpdJ6kEQma6XkQpJqzRzmaBNFtB9wQsUOrVfUU0qZ7zrsABArd4U7LVZSI4aH5pYNV+ZYm3tKYZDrcFNrdmRTX+TGqq/yK0Rh1/tphR/Z8zTqHWZ14i1V+8S56+BgteQ2fmXsrl2zjyLePbFirOPaxkUZZtuy41ILFnJ3Pue19lznOuO7eqYPpE/PdVkKdc27h9Qydjjif9P4T4dXTiCcj/ObZoeXXLsXC0WfTRO7LqCwiQivJNEqiiHLEuiyZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r2XBGxehIqt23NwKqCQBTjEkqfA6xVuwk8F5FLq1C4=;
 b=gCp4veM+cBSWUelFG3/ES5rF3zadm8bjkRam1wmjGX87fzC9Kgcb9xWTBrUNiVu3CxXk/6zFz2+ypG7hYoxFNE5gCXW7jtmEudvjBg/LpNmMt/gkMXpBBPg8go3VLR3raAEry2uJtwKAh/8AOxvBl0pUletPx3ZDwIpeW7a5VR/OTAenC+vGH0acNK2AdfuPQYDkRPnMEYcQDLhzcqnLXw3AYYzV+HiNmRdIsodS1qS9mFEh5IA02L73Z51f7u4F4W5xVSP2hpk/0DrDbeFpkf4yw/6AZMkd59gGBpJQ3dNe3fsRyx6hAy1ohJhONgsV1s4fZFpiJfbqZQPXKEl3qw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2XBGxehIqt23NwKqCQBTjEkqfA6xVuwk8F5FLq1C4=;
 b=e5+S0/0Yyltuz1BrhUwuvhSOkILCdezmPZ/cDeuDup4ToSD5u9t1a89gFO528wMVdNU9HvcSkP/CtaFjCpdwOxMUDro5818M5fU1j49UAiLepIUkckvYkL2M97N2FQp1bfkS6dvojkRWsEVhvKSorRYT1P8kx10hrMJjPlDkX2Q=
Received: from DUZPR01CA0298.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::15) by AS2PR08MB9366.eurprd08.prod.outlook.com
 (2603:10a6:20b:596::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 11:19:28 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::9d) by DUZPR01CA0298.outlook.office365.com
 (2603:10a6:10:4b7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 11:19:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 11:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svFLkZJGnnsljEhCnh+ZWrH9xS5o6KLXfzOGq0oXSpbAajYDXabkJjqtpqrUyupJ/xuzKbSdPC5dgs1XtIRLFSCd+CeSlWdV8rJC3T1+7smDsjiu7ayX4K7hJeCAg2JbRNF/91AY9U5gb4n6kC6Y3E4+pam9PHAQ04bz/nFc0pYfD4NWnZEyvAXo78EqkeFJ3D81dUlSyBsI4D1X+ehg0a125pPo0pYrPEjtYZSPvp+RPtOGpGaq7AVYDShV8Mejb90lsV3exLlYjk95PQ/pVjHm/QuPVgYLgGghz2fO7LXVPPBK3YpuOZ9h9JvA+Mr1X2g9VO2RC+XlSNqO/xNCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5r2XBGxehIqt23NwKqCQBTjEkqfA6xVuwk8F5FLq1C4=;
 b=ucsYwdjnMgYCE/iJ4dkCLA6bdl/T3mHtLlNADjzMzylII9n0MepNiiZ7S9NseLRF0/NmYmy1UUSWokNnQA22v10Vl+5UyjpSaGmu/F4hHN9dZo3LxmHe++lL1s/Q6SOZB2+XF0jRcPvgWl5+DhveOhLa6Xxd5e7AoePk/VWS21yO5MA3lhAUck4cYfRfifFwbX3jTU51q9uxcjcFA4yBaCaodXloUF21jnntsxH9KcPmGGq3kQ2IwfJakaPYpEyIcdjI1Ozgict5OzxZx8ZL4OJzN2OM7TPmNlk8ubUiLtHdU1mhfYMPgL6H262BoRJRy0UcqtXZvGVbmvTyvLRbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2XBGxehIqt23NwKqCQBTjEkqfA6xVuwk8F5FLq1C4=;
 b=e5+S0/0Yyltuz1BrhUwuvhSOkILCdezmPZ/cDeuDup4ToSD5u9t1a89gFO528wMVdNU9HvcSkP/CtaFjCpdwOxMUDro5818M5fU1j49UAiLepIUkckvYkL2M97N2FQp1bfkS6dvojkRWsEVhvKSorRYT1P8kx10hrMJjPlDkX2Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by PAWPR08MB9589.eurprd08.prod.outlook.com (2603:10a6:102:2e4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 11:18:21 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 11:18:21 +0000
Message-ID: <4dd1e996-5098-4b03-af0f-98294fdca908@arm.com>
Date: Fri, 13 Mar 2026 11:18:20 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/19] coresight: Set per-CPU source pointer
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260305-arm_coresight_path_power_management_improvement-v6-0-eff765d211a9@arm.com>
 <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260305-arm_coresight_path_power_management_improvement-v6-2-eff765d211a9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0226.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::16) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|PAWPR08MB9589:EE_|DB1PEPF000509F6:EE_|AS2PR08MB9366:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da1bf3b-ff80-47e8-c1c2-08de80f263d7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: jnUu2HE++OA/OjZxNu5152HcCGANFDgYVrS/lCPRtrbCaWoFliTaCmuC7SChuFTVnHzsNm93JLj0oHLSQVzcPYTVtqmhphU91YqKuGLTmNE/C/ZsjvAhjQ6SzDVqsOYTlGlvj0vbco6lL9vXJg2P/kVloQiQUtk1PvFvTKXhAn7pRx2r4pZAkxxnfNjF4QQ3ZaAUMMIfdzrINnuDrTkVgtJK/OTw+FsS6mIua4bCrRygeMrQ7Z47tFDkSTSIm7MGi02SAublx7ILB3Lk+xsMgCG7sCf3odz6UaYrtv0FlGBGVSnEkNQANgijKkGzQNIScNLvfJFkrxmpbUC+ihYhiuKgcE0ps7rlm8uy9XMjHJanKCibefrj1u5gJnQRDbSjiASfVQnHKLNDLQzdIfqzX0+VEyYdwJgzRpjCBX6tNmx8FZNhgXWxjT29D2k/cnzUJwkHiXogvdkjNMXtdxZzm/AGA5SMYSOQWuQJ86ig6zKPjgZqPSXsCNg/G16CG18GaM/JfyFnGquwNWHJtTaNzanTtCFLBp7l8bP4+Fm8j0iFGHMa1ZgQFCoYMgBQp50FkhAxozAs5xhiMzGNXJf+Nto74hxyBWbuDftjWU9aXh7mal6Ox1BOwLnk6SPvChCyE/ynJo00hLL4Fed7o5KKpT67UYKNcUZqFBkZasQbPVWOBEb3ezKyWAO8mu/C3zK5kjZPcaW0lnrjH+zDkIQzuAVamqeDEunSTVN/GqQk62DhyJ031I/RW6ip1wsCHfeZFx2essMJgpAUzw0YKxZv/w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: SG5NdwyoKkqpfByEyFq5mEnv+9alMIyLKX2qb6Mi4m3+3P7fuBVEAx+wn5P0OEYCNerCofFAhhbp6Fa/s8QKgEvokaF7xV5iJe0m7/xsLThnoUMzZaTtffdFU9FL0TNrv7dgYYW1hXGc9KJy+pbvyzFQpIAwuLbnJudbra8luSe9hiG5HAcVCes2+jeZnIAv6yn9TxQFxAaI49zBR+N4/JKyAoi8YzrXk5P7QTJkav7gvhy02KpSHyRcl35ezXV1rg5l/4MJuQ6E+gEXu+v7fckqPU1sSZxyzODXcitepAgr8Eai1Ccnl6h4e5bUsw762tyPqZ1tCZEpvUAayS6qBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9589
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5120ab98-694a-4d3c-b312-08de80f23c07
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700016|14060799003|1800799024|35042699022|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: IED9yzlG1vXnpC7mWcylHiZ1V4hErL59vzGhBJs7PtjBhZKmmxkJs//HLHN62c+lymCEpU/uG9BBCCqtuiO5rujAkhH9HHABIC9Hdff2aGIqCo3CLL6IxMacDGun189OVSCu7LNx/gTV59Ji4cY9VDsKPp+iCRiGcnoU6eRZWoslqtg2dWxLuYZY+eHTq8p3Pilw+yX2h2xVTdXn6+BEdMFpIHb3DJu6FtkLYCOVGTFsEUkj6Ra2iyAHb4ptoYyaHkhf7u3tUS4nYbjnj6p/nbmmMLsr0FWa4uUZjcMQRpb5g+XLMmh0nUSUTtv90dkNYG+/yijZgVQuLuGS9rsj8Sz88GJ2NIKSHqcXrfodgWXyHXnSXLyHypNDyMPpI5ZUdGiiFbnzdo5XQ8hu/xiZPJqB+MHH/4v6nUGEMysoIsSI2MxSmyXrhdjwne7XgTVCisxz+qeGo2LrSD3y04FPN3RCGR3WcDoKkOUqpM47dNEf387bURi4zASNSC0A9qzHrz9U4j3geg4xu47Nu3WEjEA91WpIPwjkjyQqzTi0MLeKOUSU0Va4Ygzn9oOq/YDDtYwCTbUgwqYqUk36CJPxueBDWmhuEDxGvcYPCcqWN9B2w+Uu7epO7c1YhokSqRU2yugkxpkppJY5UevbBGl+PhAWSZyn+sH7D4VG77LjD4a83dt1HPDvdmdDGpvI5jAqZVZnp0846iIKaLX+Nc8hW5Hh58TYWpci/hK4TqZBSPMKI7kOViWDltgZLaC5B9lUENCzErPNIlgmCDKSToQihljKoplNktUCBmrYU+Etp2A7gkrzI74IVb9Kmj8bpDLd
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(14060799003)(1800799024)(35042699022)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Nn7i7Uxz42lpsa9VDhrSb9JU1sKtqOgIgEZWXRtaqoH1zBxC86R1KFfC/htzGAF7aJzMy93bSp70h1EsOF0sGW1Vf+obskOxUPekjIfhGt3bKilpA5cJ6Hf0yDxlUTKIi1gNQfqtH/NsVzeeuYLLMWXHk2yMdjweowqsG2JEGSdJ14YJode23dbpyl8wZi4IQlngPIU+x0TPgndzkvJkh/+CQ6OfdJVgMcHSGR+mBkjKcMRspsFOdQaSAbOIIz7q0WdHR1d1zGMa1I8Y+9zIEKFEy3qnAS/0sppSUtjsk5dRMERW+7tOKWsszJ+sf1wwCTjWBJ3pYcFRvjIKm07oRqPJn37iVdTeSefBMSd81YK77+tBRywt9TaQ4Yu7zik5A9K3LvoACXwdN+6Va7rbx7NeQpptEeyQ19gUVC7lQSFERsQABnodx0H1/fUOt+Uz
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 11:19:27.7729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da1bf3b-ff80-47e8-c1c2-08de80f263d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9366
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_041934_555614_33D2E212 
X-CRM114-Status: GOOD (  22.63  )
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

On 05/03/2026 10:17, Leo Yan wrote:
> Add coresight_{set|clear}_percpu_source() helpers to set and clear the
> per-CPU source device.  These helpers are called during device
> registration and unregistration.
> 
> If the helper is called from a CPU hotplug notifier (see
> etm4_probe_cpu()), it sets the pointer directly since it is already
> running on the local CPU.
> 
> Otherwise, to avoid races with CPU hotplug and CPU idle, it acquires the
> CPU lock and issues an SMP call to update the per-CPU pointer on the
> target CPU.  If that fails, it sets the pointer as a last resort.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c | 54 ++++++++++++++++++++++++++++
>   1 file changed, 54 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index f191a0fe802ac6ae1342872e01fff463775c8a20..cda1e9b065a056e57030e52e07502554c71014ca 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -34,6 +34,7 @@
>    */
>   DEFINE_MUTEX(coresight_mutex);
>   static DEFINE_PER_CPU(struct coresight_device *, csdev_sink);
> +static DEFINE_PER_CPU(struct coresight_device *, csdev_source);
>   
>   /**
>    * struct coresight_node - elements of a path, from source to sink
> @@ -82,6 +83,56 @@ struct coresight_device *coresight_get_percpu_sink(int cpu)
>   }
>   EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
>   
> +static void coresight_set_percpu_source_local(void *csdev)
> +{
> +	this_cpu_write(csdev_source, csdev);
> +}
> +
> +static void _coresight_set_percpu_source(int cpu, struct coresight_device *csdev)
> +{
> +	/*
> +	 * Directly set per CPU pointer if running on the local CPU.  This
> +	 * avoids to acquire CPU lock duplicately if it is called from CPU
> +	 * hotplug notifier, see etm4_probe_cpu().
> +	 */
> +	if (get_cpu() == cpu) {
> +		this_cpu_write(csdev_source, csdev);
> +		put_cpu();
> +		return;
> +	}
> +
> +	put_cpu();
> +
> +	/* Avoid race condition with CPU hotplug */
> +	guard(cpus_read_lock)();
> +
> +	if (!smp_call_function_single(cpu, coresight_set_percpu_source_local,
> +				      csdev, 1))
> +		return;
> +
> +	/*
> +	 * If SMP call fails (e.g., the CPU is offline), directly update the
> +	 * per CPU pointer as last resort.
> +	 */
> +	per_cpu(csdev_source, cpu) = csdev;
> +}
> +
> +static void coresight_set_percpu_source(struct coresight_device *csdev)
> +{
> +	if (!coresight_is_percpu_source(csdev))
> +		return;
> +
> +	_coresight_set_percpu_source(csdev->cpu, csdev);
> +}
> +
> +static void coresight_clear_percpu_source(struct coresight_device *csdev)
> +{
> +	if (!coresight_is_percpu_source(csdev))
> +		return;
> +
> +	_coresight_set_percpu_source(csdev->cpu, NULL);
> +}
> +



---8>---
>   static struct coresight_device *coresight_get_source(struct coresight_path *path)
>   {
>   	struct coresight_device *csdev;
> @@ -1401,6 +1452,8 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   
>   	mutex_unlock(&coresight_mutex);
>   
> +	coresight_set_percpu_source(csdev);
> +
>   	if (cti_assoc_ops && cti_assoc_ops->add)
>   		cti_assoc_ops->add(csdev);
>   
> @@ -1427,6 +1480,7 @@ void coresight_unregister(struct coresight_device *csdev)
>   	if (cti_assoc_ops && cti_assoc_ops->remove)
>   		cti_assoc_ops->remove(csdev);
>   
> +	coresight_clear_percpu_source(csdev);

Should these be done with the mutex lock held ?

>   	mutex_lock(&coresight_mutex);
>   	etm_perf_del_symlink_sink(csdev);
>   	coresight_remove_conns(csdev);
> 


