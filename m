Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76B7C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlWL7/FPlhBhyW/kyCwg93JZKP6O040Lk6tUoMGH8Q8=; b=PYIydd83y7ybEkY1CGkB2d4ULq
	mToQD6wteI4SqJ7iWqv7w1mIHCLuOofZiIFUul328KBdL+02B4afQw32d/kvuVy9AjJ7VXIDtsuuz
	wXkUXroP0XSkkiArDt+3/5lPFIkAPNvqtHIMX3OiIHvLJJCpI1O56x/dJ5y3KAnpHnjYHCWC/Yc1a
	cTWCuj1H5I/qZ91awIWEZNPpy44zZSQxHUkx4fVo4Jqs19xe+ULRZZlFvySkezs7LvsTtoxGHCng2
	e2+m9z2I1xAirkC2KE/GBqrMRlDJkmFG6P30ydjwV2OFlXvHEF18FowBGrASvYG819a4UgTYZPWF4
	7+SKBQIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9415-000000069vx-40Ib;
	Tue, 22 Sep 2026 17:10:51 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9412-000000069vM-3vfn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:10:51 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rUEYjTb8dyV22GSYMO94K5yey1VPErlntKjR0Gn+tJNuwqneyPsiP3AeqKyU4JXJAjt0r4UmUgiYb/sxHpn0P1xa6AhI8oji56yQLDcZq6WIUxooO909rZ+mc7i2aYTsLjdZ6ry+FFd+EnHEGkjlhXu2LI0FSGuWsW66CZ5+QxOpA+ACGCE5jwmvBntQsQf3pf+07VdC0Ve+ZN9xQXilnXiP5TsB874TlQskB2+QKFsJ5vt2Gcwbcn2k6sP363Xhc4Dstct38vBC3ln8mA6ZRr5BlhZhBbYgJM+NAI7oeyYVtkUDfZRBz7WsvmGweiBsMHFE/21ihMl1+EsUXHAXsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlWL7/FPlhBhyW/kyCwg93JZKP6O040Lk6tUoMGH8Q8=;
 b=DpcTXr28VOIMAz74Lkym77zeBf7ZbeiWsY6T7S9jymKIwyCRx37MmVuGPtTb22OeT2dci1XUime9FCMVV7KcvHBHbCHbDYIov2meVVpF4v7ziQwnsQ5EEgV0mLErJ2lm/QaILLHgHCvgxGEm16h3B9ny7DmTZpeT/Un+ncFwbaPfVU7i7sFo46ZF3bzcoKUd+xq+LDimHwFGRXtt4DwzdbBw/SI4n8jZXpDtcG+1+YJ+xUdh/g+jLJlyFBbsLAopMwQiqFJ8l374NfF7wS80G7RA+QuFM59sTt4k7mz2FAIWyjnfRI72SB+kcK/3vhFom1AdneSKk5QPTlhMdJCDHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlWL7/FPlhBhyW/kyCwg93JZKP6O040Lk6tUoMGH8Q8=;
 b=rSjj3yEns+0xDlwLfaYLMAA+nd+DCy/Ki+q3wZp6sX+/bcomurzsSTBbJ7nGe8nW11TNw+BdmJ/ArEs9U7qqbueTzJTZdNAL4xR+j0954BCd8XGvvRti+n0R3ApQwGyEPPrJfL9VbvMBCOJopRudIFZyO4kIfbI6IrmphtKZ9uo=
Received: from PR1P264CA0082.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:345::7)
 by PAXPR08MB6703.eurprd08.prod.outlook.com (2603:10a6:102:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 17:10:39 +0000
Received: from ZR1PEPF0000E45F.eurprd04.prod.outlook.com
 (2603:10a6:102:345:cafe::70) by PR1P264CA0082.outlook.office365.com
 (2603:10a6:102:345::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 17:10:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E45F.mail.protection.outlook.com (10.167.241.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Tue, 22 Sep 2026 17:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7Ivzv+GCqXIMg56e4xOTH/KwLvd7f7eyMlTHZ/sgbPt1Eq6kk65RkdO4eiEJzYwRWii7ha/Wm7R9ui3eYU9CNP3+c0ZseFwrIOReszbI4rC2DjJd5znlIj2QOb8euvJyXAgE92C5wIQdXQI7jeDQruiEp6iQO9x72xEOJbGxIsFRIkya5wthZfYpT8Ztws7+rtomEe7JqcqnZXNoc8uN/9EmnTi7EjnPl/ydDMfbxcFlAYhYFWuhfBbJDufF5H0nEtaf8WrOkMXF1m1Swg/Q8/8y2aN3nXOpE9QT1vUksM7do+aq44T/CHh35BV+emrTfX8tQSsCzxpy35+fttsNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlWL7/FPlhBhyW/kyCwg93JZKP6O040Lk6tUoMGH8Q8=;
 b=MHkLf/PzZPziGNVRgAm1kqpCIztLVI9ggkWgV6UL36c+ZYA16atsJmXfref6/xY32NIG2aqTUbV1QMyCXzp8IgKcFce1qrZytKQft747P/BAbKBOAJvvDt48GsFtXXRofujO0nF5y2RBCotsxFrx3oXFkYW1XEcZPowBmXykMHRlsXoAFradZ1+MdjTBB4yv0awjHes4qy9V1mR3GKItToyfez1pr/obrO1n6HmdT9o9tuoGp2Kh784593vJnE7ZCeTyqwPZ0OoNi0VKdN/oar88m1GINnGeMJJVMyp+a8kHcq3GdupTFrZJUUaV4oEtIDyZ5mqiOcLMbgFlWNlqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlWL7/FPlhBhyW/kyCwg93JZKP6O040Lk6tUoMGH8Q8=;
 b=rSjj3yEns+0xDlwLfaYLMAA+nd+DCy/Ki+q3wZp6sX+/bcomurzsSTBbJ7nGe8nW11TNw+BdmJ/ArEs9U7qqbueTzJTZdNAL4xR+j0954BCd8XGvvRti+n0R3ApQwGyEPPrJfL9VbvMBCOJopRudIFZyO4kIfbI6IrmphtKZ9uo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by FRZPR08MB10928.eurprd08.prod.outlook.com (2603:10a6:d10:135::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 17:10:05 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 17:10:04 +0000
Message-ID: <01ff3558-e4fc-42a5-bc4d-6a6768eeddca@arm.com>
Date: Tue, 22 Sep 2026 18:10:02 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-arm-kernel@lists.infradead.org,
 shuah@kernel.org, broonie@kernel.org, mark.rutland@arm.com, will@kernel.org,
 catalin.marinas@arm.com
Subject: Re: [PATCH 0/2] kselftest: Make MTE memory access robust
To: Vladimir Murzin <vladimir.murzin@arm.com>, linux-kselftest@vger.kernel.org
References: <20260922105959.129380-1-vladimir.murzin@arm.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260922105959.129380-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0403.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39b::13) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3421:EE_|FRZPR08MB10928:EE_|ZR1PEPF0000E45F:EE_|PAXPR08MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: baede22b-df37-49ce-1526-08df18cc6d14
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: yyBBchMObNqBZMR3h0WFrTnZHfKXnCYduaucueL2ZnSR0zFEHQhMEve4C2/KGIN8yOOQcDsTBeNkupxAa1//Aj4R3IUdAgMvda5TcxRJvwt5HX5mQN268GFvELbju7CPbuwJkSWEFCkbYagQUJXb5IQfRaA2W62WlONiFKsuPHe0f694nZtPSqmLChbMcpbiOhvevwYWQ4Y4btEleakm1+TH1fR2JZagWMbd2If/gQi2LPnSgpwPEMDgVJgm5vKTM2034g2nwWuHTyIqe+r9NDuASRzaXHfwjOW5MZIjguSlsmw9YdQcVHjRjKzA7CBxZtVYQxP6lbB1kiBNCX5KfQQHJj2n65B7nUvzGRHQRxMgBgMKzagLe5xvNaFwaQTguXBk27M87xZPX7OiH6+3cNyRjtR0xUgdcQjDNPoYvn2BfbFhH5EnI5OILCZaVwVjdEVth7xFfMJls4jsA63n1UEIwQfsG5hCEAaAeLyW/564PP2iCRjDNu9kKU8THm9rFXmBL6+J0Fqx0h/O/SQ6h6wE7DaHIDKBZ8OIemdsG4sd0nrqRJscGIq2IBUuhxnKfCyatKEfaCcNSY+a8E2nw5Qfnc+ephQYqswfd5RjEETDhO7UD9dxq0qJREHg0wPkvm1LuzUpR8fih4mvE22Ga26LCrYCFhSe4gY3mTVoFyo=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: GEPBfhwAxMyIpISkPptXw6g7941lmpWPYwx9Eze4ormugGRP36lTUxWe1dfr/OD0AAKUDdbYVArfON+NYD8e8iyQoIoUWCXtxs6qhklWUQkhJRAQAPlulakhnDlL6YVxB9I8OkY6BaqNnFiSqaAgtX5LAf8ecNWxHNo24BjlQDD/D0ORrAxzjzrIsC7p21H7sY41jlfO6BHmoi98jn962Q2yUdxn6UboI8l07BcF9/u+hlXWVC3moTutsSMRsN879TZ1dpGUPm5sdzeHy6T+AhjylTNbr2zgnrrxRx9npxvKFn+5jr0Tt+pIV1kPVfuxLnbdTqhqQfMcUTyfsTH9BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10928
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: ZR1PEPF0000E45F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 91e9fd5b-88fa-4dfe-f9fe-08df18cc5817
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|14060799003|82310400026|36860700016|376014|1800799024|35042699022|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: VYrewKA3OlFL4DpTwcRkyRI1fga3hzZvYKbO/5DugllUVd+ZyaZfjIiuTL+7z6rmvupmsk4n4UyohSmH6/4cRCodDJ0mxRsvKj/vYwJvvysh21rjpAFdfsybL9wD38lnBerlJCaaRxuvtLCZuVZ80VYZ+01AyzafbbNnum4OonYC7OHyGsuR+tA/LeWdrWRuocKTWqQAftkINH6CtiE2m9XRDs9CoT8TyXhEwkN8f57b32UoNFKfk5lnq/bN7MB74dxloZaCZQsG2JHVT5HM1QguG9yc7EZ1wi+YrRT062u8pSX4TXzpKHwrPrVwJdNn/AXYEMcL/qMiNcaQ4ONWYH2Xo1X0TY+iYtOfbj/lcnIpO6R6JNUva4JFj+fbAMSCM0lJY7fm/NQ5XGY9o12RwPytXt7C69rDkHcoIo2qJfa2nBScTWxOqyKIuF7orrkNcsb44hDuwwNcPA9LSWmhoBzExhkVEkt5QEfZQXi4bHNiJgKVws/wdT/WIvdGQI76XSOQe5m/9RRnZUaANDYqjt5gp314Tg5tk7NNb/rErnLfzPbzgDtjNuO/6fmzQyswvz3DeOCUdGAzdnXPAtR2JRa4c45jMelJngneOrG/RI7+2w9lZi0g86Hquuaod8gm9HnYfsFqcRdy1tQGRl4zuZM/prpqNkLp2QFgfL/x1WBV2df7BhQGfMrOeeqOoBaCSzZe2d9pOWTwLwgKzFYp+Q==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(82310400026)(36860700016)(376014)(1800799024)(35042699022)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 090WdlFnVuOA2OWfwJgOrzQAdZ3X6F2svZYADurZVdtshTGCITFk+YXn0iGgnVKLVN5n+aF/7j2VzU49xXNP+0o2qGCEr5mV4g44qqrp8/2H4OgloPv33zdzw70L3oSwfQzKg5PpquBmbtgCXLxvVMcC2kbQqi8cpfokHtpexW12XNiFaOrZY1YXKCZ40DhMoDI8jUenD7B7V/4MQApDJh0b8USPHFkfORrwgc4fXwpFt2cdtPsRY3hE66Cb+gQuqHTRoTcn+0L+D0Eh3ZiNmnXTi9mBRWnj3pUwgZrNeim1X6mzg+7ymsz8sylovrmiUULkIUjpN3x85qZBfeAiQj8kExsBJ2kKuz8D7wFLyYnBpOGqGzJ14HWXJpWXWGE2sysXKWUDLYjrtBXKeH3TKYWE8ti1QZ3AhzC2RfmaKGSu/A8fmyazM71hfy/1hvNX
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 17:10:39.0728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: baede22b-df37-49ce-1526-08df18cc6d14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: ZR1PEPF0000E45F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6703
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_101049_165345_5AD121FF 
X-CRM114-Status: GOOD (  12.52  )
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

On 22/09/2026 11:59 am, Vladimir Murzin wrote:
> Currently MTE selftests assume that they can skip (expected) MTE
> faults by advancing the PC by 4 in mte_default_handler(), but this is
> not generally safe, as the faults are triggered from arbitrary library
> functions (e.g. memset() and memcpy()). For instance, memset() could
> be implemented as simple as:
> 
>       mov   x3, x0       // copy pointer
>       add   x4, x0, x2   // calculate end
>     loop:
>       strb  w1, [x3], #1 // faulting access
>       cmp   x3, x4
>       b.ne  loop
>       ret
> 
> which leads to an infinite loop since X3 could not be updated.
> 
> Or, it could be having advanced implementation (FEAT_MOPS):
> 
>       mov   x3, x0         // copy pointer
>       setp  [x3]!, x2!, x1 // prologue
>       setm  [x3]!, x2!, x1 // main
>       sete  [x3]!, x2!, x1 // epilogue
>       ret
> 
> with faulting access at prologue advancing PC to main could lead to
> infinite loop due to main could be triggering unaligned access fault
> which kernel fixing up by advancing PC back to prologue.
> 
> Address this by introducing memory access helpers with predictable
> behavior, allowing faults to be safely handled, and switch the MTE
> selftests over to them.

Tested on Pixel 8:

Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>

> 
> Vladimir Murzin (2):
>   kselftest/arm64/mte: Introduce MTE safe memory accessors
>   kselftest/arm64/mte: Use MTE safe memory accessors
> 
>  .../selftests/arm64/mte/check_buffer_fill.c   | 10 ++---
>  .../selftests/arm64/mte/check_child_memory.c  |  6 +--
>  .../arm64/mte/check_hugetlb_options.c         |  4 +-
>  .../selftests/arm64/mte/check_mmap_options.c  | 10 ++---
>  .../arm64/mte/check_tags_inclusion.c          |  4 +-
>  .../selftests/arm64/mte/mte_common_util.h     |  4 ++
>  .../testing/selftests/arm64/mte/mte_helper.S  | 44 +++++++++++++++++++
>  7 files changed, 65 insertions(+), 17 deletions(-)
> 


-- 
Thanks,
Usama

