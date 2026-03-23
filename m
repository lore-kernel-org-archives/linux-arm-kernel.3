Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E92EC01B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeOyVhFs8c48wmCPR/uJ35gy9GU37yz4FffKYI5yR0M=; b=yUdu+atEj0zs/iI+woqzqe2qSM
	tHfsRMEQsXT9nyHELC3qagP2UBkj8ppVd/4EVWU14Atjp468Ffhzp/w2Sw52DRyu2I6hIXJHRAYz6
	TwE4583zZRWz4kXRlyMSYbCNKBexlpbMaJwVsulk+V4hkYus0XdWrWLZdvt0MLcwWY9WBOJrnHy4O
	aLhLOmTT1kX6KeeWWJqAUH1ppOBKxjWZfjP0nmVf1YX7EzvtyXXmalUhiYXfdglVaGVi0V06mfoHY
	wqYl9/X3CXx+B40odngd75ko8emW6pj2052LYoSYWVWElWgX55jXNjee/YUPsvaE5qYl4atT/3adT
	pwd2avVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bli-0000000GOZc-3FwM;
	Mon, 23 Mar 2026 09:40:18 +0000
Received: from mail-northeuropeazon11010053.outbound.protection.outlook.com ([52.101.84.53] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4blf-0000000GOYV-3uXe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:40:17 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uYJN32jx3LAW9HwyB+9zlstBE1AFflxAE7H1F1Y3b7Sedz83uL2bQpty9Wp6sS6RMcAvvHHtru0xklWwKkRLSUpchFtoe+pFQVKDU2HL5CkVIRuaR/rJr7dJbPkRpBYlUDncabKP+KOQZ1i92ImjlELE8kFeemuBVfjAKRZZmYl78Xhw805LhE2FI2NpXqwLFi6vuu9AvNe6Y9OhzHS/kGgt5CKC3re9ruRZz9fkwRouR9U34QuV0RDepjBdqlz7y+lZFmvxjh2XX4U0nFpwnmXVZ9SkgSgaefXyQk0n7trTnjPz4sxmbDzcvyQvZGjJH7869N15lxLvbEbeM0E6GA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeOyVhFs8c48wmCPR/uJ35gy9GU37yz4FffKYI5yR0M=;
 b=EfZyScuclcMwuZVNxZMT8UtJQ8Bg8jU9E9eeqIdNffykxLbGVyCZwETyCjoK//OZDw1qrIP2rPlpaXCLUP/Pt50D/TNawfr574m0xsEpMvwfbLE7bhXRpgew2ikdDaOJco+JBuOXgt8+QLWT3uX/jkYVMTZ/egw13i88cNdV1vh4SwE4o188xnqXJiuezfCCLqrWnLT+BhcBxy8ZrFpfT7wiZWHzRJTsVgBc7avJEV1WkE0tNayB4FvlfX/w3oOPKfBZ9A5c/dQyUiMgwSyBy5DW2uDbKL5IzFQQgon77Nz0vFphwtX8pdOR9figHw9TbdhABOoc/VvIWJzNZaqyoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeOyVhFs8c48wmCPR/uJ35gy9GU37yz4FffKYI5yR0M=;
 b=QL2Spcddy6N8EMaTMvVgYuFdC8k7upA5Lhc9e5WtqBHfv7nIVhtfcHjkU6GJpFwqUAtzdwx+G75e0PSoRdy0pFkL68szNf42yyZMhlK9rb/jR486hv4PWoVCZKbB7n21Dym5n9Du2EYEpmrINbRiHHUYbjLcTIgkFsttk+V3OwQ=
Received: from DU2PR04CA0165.eurprd04.prod.outlook.com (2603:10a6:10:2b0::20)
 by DB9PR08MB7495.eurprd08.prod.outlook.com (2603:10a6:10:36c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Mon, 23 Mar
 2026 09:40:10 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::12) by DU2PR04CA0165.outlook.office365.com
 (2603:10a6:10:2b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 09:40:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via
 Frontend Transport; Mon, 23 Mar 2026 09:40:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAeC49O+8FMMQxPcHLwCT3QHmnYFhZYqK0IlOd0sm2Vo8HlIuQB6ViporEKiTEiha98SHhwMIxkeAJUf4QUuqRKlpVtjWJCz2niwakuRURwRAwAxzxOvHG8uct1zvw3RF5587XNEuAQEwHUKao8Q6FJbiQ0l7qdKHhVu0CAB0Su5W/MYGkwzeTe9VAqSekxXCgPwdROUFl1Xi8U5sMQacqzRVBEpaoC6atRo4nh5xvJKQOC9k6dt15MuxbYU3WRU5SIzvI2LsWZvzw6eCGUXTe2cuIQtYAlvB3k14pek3Keu3SY26fuBfApObO1i7FUYAcxIgrej6JQbQJMBhmk7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeOyVhFs8c48wmCPR/uJ35gy9GU37yz4FffKYI5yR0M=;
 b=eYnY9GGPD+9p3UY8JHvlR27DewylVUxjm1LjZo3kjAMFT0nhP49PR/o288EKaGTPRh3jVFFlAdcv9HZP9DhHvBWmp0bKoKL7JcSIch2dfNNIJow+GUwxbOWK9UZeU5cS2uTCA5XJS7ifVg5pxkWOUjwRGQuGBKGL/u2JOvBhni7mNNQLH079sUcroCxQBSjeAYw4bhkFmXY/cSTv6fcRgw08cxfW7Um3L1NVnNw7ymx4jVmVVq08kuFrVJK6uGRVS7r3sFSGscjJebzP6StcdelH45A4FBR8nHFEuFjuZUQClB+SaSo/IaJjflnbl95hl5ur9Bo6DGwrBEK+GROgvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeOyVhFs8c48wmCPR/uJ35gy9GU37yz4FffKYI5yR0M=;
 b=QL2Spcddy6N8EMaTMvVgYuFdC8k7upA5Lhc9e5WtqBHfv7nIVhtfcHjkU6GJpFwqUAtzdwx+G75e0PSoRdy0pFkL68szNf42yyZMhlK9rb/jR486hv4PWoVCZKbB7n21Dym5n9Du2EYEpmrINbRiHHUYbjLcTIgkFsttk+V3OwQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by AM8PR08MB6611.eurprd08.prod.outlook.com (2603:10a6:20b:36b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 09:39:06 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%5]) with mapi id 15.20.9723.022; Mon, 23 Mar 2026
 09:39:06 +0000
Message-ID: <ba936584-54f9-4e72-9bf0-94ea98499df5@arm.com>
Date: Mon, 23 Mar 2026 09:39:05 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/20] coresight: Populate CPU ID into coresight_device
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260320-arm_coresight_path_power_management_improvement-v7-0-327ddd36b58b@arm.com>
 <20260320-arm_coresight_path_power_management_improvement-v7-1-327ddd36b58b@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260320-arm_coresight_path_power_management_improvement-v7-1-327ddd36b58b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0278.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::16) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|AM8PR08MB6611:EE_|DU2PEPF0001E9C4:EE_|DB9PR08MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5f8ee7-96b7-47f3-7eb4-08de88c02cac
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: 4Z1zGRna2ToZJUadb2UfjWis1l0cUKN3wW+LwQxROTZRZaWTlkyqhbhAzOihKY7JWp687pUoygmnk0CcXSNkF9+xS7ynImPAfEZQ+92jnhS7fN2AdKStZBGXCAGQ2ZLPBjSXiM+9KkT+O10igHkzdV/dUmC72F+c8/ljBmdOAJyQMG0DyPI0yU60NGttBF4e3Zq4hm6IJy3Vc5iO6nuqw2fo3gAJfUL0+OCwgR/2KfuMXo38gpR80HKbOZNOeb849dbojKBB0Ir9A/PK6pi3vitAUv4L3qxbYDdeF0wRtLQHyN6L4NHiX50IU7/nW2eSh30P2fqDHJ4aaQ+qvLVyn4zOeVtUgnS11dZ6BgyadXVTotUzmN7G83RFrp2TzCh0J5QXPKuqANZtIneNlaVU6Wo16QQwt1pZo41tWTOtxtxVypK7PnU/o1jrvGjB0GK32gUKl0hLfSFNciJ1BPqKS142B7wXiICGJ/B8mpt/+WNVRwZ5fPTUaf1PNBnjPjp3kABUlPR/yF7Ra86FyAeA0NZf7BZy4JDJ3txV/+alV+KXxQO0HjpzMn8KjDRKyXE2gEmGGibbrEomxJFL8Nl9YFJGxNug1NBfqX8IKY6ZJsUdX/bVfGa9tinRU0FGjOWrr/1GdQyaSFupVf/n4nMWlzW0Gt7qqcR+VpfgynSJxZYjF7QcEU1PMgFIHgNvhiSj31inV4/jNPMHaTide4DanirLz1D7oQnAq90ht2WMN2wFkbHwawJobtIn1R8ICs9yGl4p48Dh+sFYNBjJEW1RQg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: HKY7sH6XNiB/YxW4CG+3rURfqsWk/KsI05SM8lVRtYjmQVjH+ek6VSkOTlCERpFKT5zmiyrFvLiAuhtxCAi5zSSeroygRMPTIV5B8e5rih9mXAdCZGNQFZeKIDyPK2Zb+/ShxDQQ4G2dBUE0xi6sLq+k2SPyV/Ggkn0Fn3UENL09+4cTV4+c9/V1rpFUHJMzTrodAZKMZ5zy2KsybwG7DmDOm/58GNqtvo9w3SNHpWhmpeSoXTVGH7DSXB+UmUqrINyfbAtk6L2I75S8sC7Sn8fIctv9WxLpSPEImA7KU1p7ZBIjr/q3MC0ko7yi/5tE8urxaV0+kTn6W5swdoh4Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f2c7bd3-cabd-4c71-a810-08de88c00712
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|35042699022|14060799003|1800799024|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: KVpWrdyYdNFsExXtU3fmw8PnriqUE55OuKndT/ijf/9Y6wAVXCEGD76U5xlUdJtiofEp5pUjRBFKvnrcAonmD4zNhUs1/3mefvWWwcbj2HQMO2gfwEhio2WWVOQ1bt+z6iXNSz83w+vhTsgZE3MGvYpO85jlmGwPAPaqNl4Tk9CrwTUEOzOnv+3HDd6LYCgfMy86MZeJ8zsFt4Anec8PIqwDZm/ZA2oZse3RdgI6GwTS8VqQKcVT5SAKcNuKutsdyJtMsUWPCGPJwN5wjWtWefBa2UiBHQLnnUlRzX/bEvU3VYgnHgP9+LsP868JB2vWygThZ6ijF5BPXzjIVfdkv6ZKPvWsnkwa0TuQFHUDDQqIFqXk8SO5lGA9t1nQZKSfrRU1yZUahWK63afv/bZ93nSNLqGGWO0qemlzXqGNpahMzOC2NFTDH1jU0wopXZQ5HP13sP1ffRoeRD/OVeShw0pi9f7gMnXl94ruWidIPVVu/k8Atl1Hz09KK/cNzB50Rn0qXGZy0I/Uf01oqPCOIJF76eg/FBsrMaRADdxn3FcVlQUHEPdy6Mdev8lX73px+nzHxINcAfC7qtoRoXaj3vVHIT5X8xrM/dboV82ChY92MXVMjWMRaCi3YXmXhQAYpvKpmnK4t8XtykFoG4If+z1kLOm1dLvG6oPFhy5DVEtJpVdygC28AxqxDco/1pg/sHxlo/CGy7mihbTBCAjcTeoNHJeZjvFqfelXnnjQHQQ8j5D5Md/dvw2ZyVg3HHFm8VJ/x4882vFMHc4Qt/LsrS5sQLgO1J6nSVzP93prxXYpgoQT972D2fD8y54vHhaM
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(35042699022)(14060799003)(1800799024)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yii4qfA1YpGPl92A5nWa6ExJihOr3gyyUXIBPVAhUic/AnLUX7EeQI5cK5GFuYioRZiGOO3LinxqdqoiM/qDOQkDY7JjVjVtfxhz0FjtXIZ2gKdNfwmbUd6aqbe0e5wDeiPayx1sYMi0meImAM0SyUV8GZ3mRHyZvcMI25ssB/2nccvTrKzdiVrDSyopxcH/nN+XYnkRYNyUP2KT3EnusPwkomHZsAL5LkBQC0rmNYCUQSvhuEfeCzxQOIRwLX0IJGEAL20HD3oZzS1e8xS7EdyxoIUcx7z/g1KXUtPVA96KI/YYQ47zM3w3+lMW/lq0TTNcVSFqkydOZEvp99Rst9WiU2s4X1gRdTtryRUVfBG5I1j5cICmfF2s1X0LCCQ2EF82By5EP695oCWhsTEOSc34c+bfAjF6VM9Pg/d2yWErY/8GrtmOlEQRZNbNlXBQ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:40:09.6805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5f8ee7-96b7-47f3-7eb4-08de88c02cac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_024015_976933_7D3A1934 
X-CRM114-Status: GOOD (  18.14  )
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

On 20/03/2026 17:42, Leo Yan wrote:
> Add a new flag CORESIGHT_DESC_CPU_BOUND to indicate components that
> are CPU bound.  Populate CPU ID into the coresight_device structure;
> otherwise, set CPU ID to -1 for non CPU bound devices.
> 
> Use the {0} initializer to clear coresight_desc structures to avoid
> uninitialized values.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-catu.c       | 2 +-
>   drivers/hwtracing/coresight/coresight-core.c       | 5 +++++
>   drivers/hwtracing/coresight/coresight-cti-core.c   | 9 ++++++---
>   drivers/hwtracing/coresight/coresight-etm3x-core.c | 2 ++
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 ++
>   drivers/hwtracing/coresight/coresight-trbe.c       | 2 ++
>   include/linux/coresight.h                          | 8 ++++++++
>   7 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
> index ce71dcddfca2558eddd625de58a709b151f2e07e..43abe13995cf3c96e70dcf97856872d70f71345a 100644
> --- a/drivers/hwtracing/coresight/coresight-catu.c
> +++ b/drivers/hwtracing/coresight/coresight-catu.c
> @@ -514,7 +514,7 @@ static int __catu_probe(struct device *dev, struct resource *res)
>   	int ret = 0;
>   	u32 dma_mask;
>   	struct catu_drvdata *drvdata;
> -	struct coresight_desc catu_desc;
> +	struct coresight_desc catu_desc = { 0 };
>   	struct coresight_platform_data *pdata = NULL;
>   	void __iomem *base;
>   
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 46f247f73cf64a97b9353b84ba5b76b991676f5f..4a246fb6bff0a75cf12995bd00a9adefb93839ec 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1342,6 +1342,11 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
>   	csdev->access = desc->access;
>   	csdev->orphan = true;
>   
> +	if (desc->flags & CORESIGHT_DESC_CPU_BOUND)
> +		csdev->cpu = desc->cpu;
> +	else
> +		csdev->cpu = -1;
> +
Additionally it may be a good idea to reject drivers that do not set CPU
for per_cpu_source/per_cpu_sink ? That can be added a separate patch.

Suzuki

