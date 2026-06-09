Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B51CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeOl1K9aLGxMkqBbHBQ+EOEUQbjUxNZXFTMgAkQlC4w=; b=SEP10b+n0qI+gfr4IDaZO725w1
	ZRHoi9Npjs/aAliVNs6z0s/pwdFxjiDR3nXiUv9NK4mwsIlN9oyQXIn3b4wnKPQAwwzwbiI9ie5zy
	yf0CHBWCTgdU8UbTVxrUJUckSonDmGD918JXCPih1hGL+WvJ4kwKr/zuxf72l47ti5wgJibSHhjDD
	KzrmGzjmxWuQ99YCwtoObI6jpAij4q0N011GnNnufibdnI48h+V+zcXkvLl2JWOQBILnCxPnw+xJ4
	ch1oj6FxKy97adnspX3WudoVdH52/RKXT3AXhjs2ZIhxKbBFRbFdYmoJ5Izj1NNEXWAK0cglRoOR1
	tCwa/v4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwm1-00000005hCC-3WhM;
	Tue, 09 Jun 2026 13:45:45 +0000
Received: from mail-francesouthazon11011019.outbound.protection.outlook.com ([40.107.130.19] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWwlx-00000005hAS-27TC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 13:45:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sp4DPFmB8pFHRl+aabEBW0CkW7fFQE0loyi4SP6Lw+GEeALyKHwmvfMEpHgEfjpcuq4qBzD2JwtG3LoZ8bX4yoGiC/3yxMO7R0U0+L+2aEbgN5GLRCSlIut2KWmCSmMM5tFc94JjWo36nw6eZjWyUY2mdy8MutoDibJyDDvyd6PwTL1IbZrHJB5GhAKaUYkDCst0CyCpxMdFujg7slcNZl35ucXM2sa9rqsJ4i4nYvgoNY7DQBBVB8NfzmnoN6a5BXVYaFDV2+8VKFOv7fZQ33Gk2EDXuTVBQN+6ASs5L2DFwwXgDO6Z3AyxS+4onKKu9H1yKhIpi0WCxCWFhfhhTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeOl1K9aLGxMkqBbHBQ+EOEUQbjUxNZXFTMgAkQlC4w=;
 b=Y6mhNp5baRLozMD8PZ/PrmqFKmWBVwwLQKZQtlT9R/FocjOHQSw3/yDnN3dZU3FvksGIlCII7cIau6l1uTTnLk0K/0dA1ChsArv9pLOLMrK39DQdnIA3afW/MOEXwISeEC2d/3KmHmkdt4fz3DqBnklpKhT5qTW3XsKYyAQKfI/+Gh2NfKyfSuFuuiFSmD9zunDgCQypigU8GHxl9VwvIJlc/qKmaz0AABoP9FokLocQkKaYgXRpD5FQMFc8bxt3dBnEJdjlfhfic7Su4XQl24GCG5ZRDW27jK/+XGkTp4kn2gNADaz9jlT32hICDmBakKdG6iJuhLl57Ic25wsRUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeOl1K9aLGxMkqBbHBQ+EOEUQbjUxNZXFTMgAkQlC4w=;
 b=mFsTHY1ss4aPHJfNdF95GJY85HuN6kywy+92+UucuXFugdCYBX36/p8trfHQvN/vusUyMG90/ECiK4jb0ZcMp9ydu+F3hYTu5ODvaLMP2b0UMY4a0aFQCIwHYxpTlB5YSnomIRLNkA2XKRWWs8rw1Xy+k5dt5bK4GXPlzFtzB5Q=
Received: from CWLP123CA0173.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::8)
 by AM8PR08MB6370.eurprd08.prod.outlook.com (2603:10a6:20b:361::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.15; Tue, 9 Jun 2026
 13:45:36 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:400:19b:cafe::e6) by CWLP123CA0173.outlook.office365.com
 (2603:10a6:400:19b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.14 via Frontend Transport; Tue, 9
 Jun 2026 13:45:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Tue, 9 Jun 2026 13:45:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygbl68flIMY+mFH3hA/hfmyoby6SG0vFYVgnxVarB6ighvDbbfUsUSgTSQqz3gNCl4PAB1kE99e1Ah28TehxwiIeip/OMtO6ITzPdQWNW1UtNOiyoDI6ZEhj6cQ10LdHjJQykx6fRfB1xUecKXl9sANbYzNwfgpQFeNzBHU4CfMEWlKocr5u6nLSCok/EsDNX7f9l+a4HyJBlbHmMK+4Umw4clgyVv6rSOtpicsgCB+5D+Z43V/wFsCGd2yy6QDld3tPsl5mF8MH6eZnaF/k95vKR7q6iz3yrj+IHdBjVvazpxQent2cG4zMgSCZrigiPU56nmJBanGEqUBI5Dyf/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeOl1K9aLGxMkqBbHBQ+EOEUQbjUxNZXFTMgAkQlC4w=;
 b=rmhpU7pPUDH8x8btsE5cF7t6ScXHroiKQOzb9VNE0GH80b7mEZZDGzucuPeVnIfmyi1EZZm76lqSXKHmu/3ONbebt5Mdi5E/qeN7NeS9PMTfMHPzOK0OxSPVJlllBjur0Ev3N7+cfZNBwhGwd26I+J8dB8MYmjW2+hgDURebkMCOgroBcrbsDtcjhEMvxnNS46OI7BxfxU2EqTAJGQ5AF68FUz6lR92+81fnEbe/pcDGb+phPjm1af84fFGEybLx6NGc/YWDmYqJsH0EotqBA+DKc3Gy3ukypEsB9KuolxYCHBWwuqsahzqMbdfEKVt26wgEFvfMMrJkFBWlFKXKrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeOl1K9aLGxMkqBbHBQ+EOEUQbjUxNZXFTMgAkQlC4w=;
 b=mFsTHY1ss4aPHJfNdF95GJY85HuN6kywy+92+UucuXFugdCYBX36/p8trfHQvN/vusUyMG90/ECiK4jb0ZcMp9ydu+F3hYTu5ODvaLMP2b0UMY4a0aFQCIwHYxpTlB5YSnomIRLNkA2XKRWWs8rw1Xy+k5dt5bK4GXPlzFtzB5Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com (2603:10a6:102:46e::7)
 by DU0PR08MB8232.eurprd08.prod.outlook.com (2603:10a6:10:3b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 13:44:29 +0000
Received: from PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15]) by PAWPR08MB10975.eurprd08.prod.outlook.com
 ([fe80::3c7a:9a64:14bc:ce15%7]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 13:44:29 +0000
Message-ID: <51a76d18-6db9-41f3-a1d4-60360088c442@arm.com>
Date: Tue, 9 Jun 2026 14:44:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virt: arm-cca-guest: use raw variant of
 smp_processor_id() in arm_cca_report_new()
To: Kohei Enju <enju.kohei@fujitsu.com>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Sami Mujawar <sami.mujawar@arm.com>, Gavin Shan <gshan@redhat.com>,
 Steven Price <steven.price@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260519101217.155740-1-enju.kohei@fujitsu.com>
 <ah638FZAyCSqtzMi@willie-the-truck>
 <41ab4dfb-b91c-46df-99a0-de36686c8fea@arm.com>
 <aiAUceqBREjwXk_V@willie-the-truck>
 <aigNbs89G4bCQdjY@FCCLS0092175.localdomain>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aigNbs89G4bCQdjY@FCCLS0092175.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0217.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:374::18) To PAWPR08MB10975.eurprd08.prod.outlook.com
 (2603:10a6:102:46e::7)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB10975:EE_|DU0PR08MB8232:EE_|AMS1EPF00000040:EE_|AM8PR08MB6370:EE_
X-MS-Office365-Filtering-Correlation-Id: c2990695-bac4-473f-a013-08dec62d6217
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original: 8m88y9cB9ZVo4D4PlakY9s0ia/kWoVytYIvIdAwIIbFq8e7e3WjpYUcIjAet6vYQJFDoXN/sRtGeL67+lABRIi3b2mIA5gMExPwkW5hHLuar9nrOyQ7kulVOt9AC40gUCC43Ef5RWLJVJ/o72/Ea94FbmpKaE1rQtq9acso/dJyymePbhQ8bahaJ0Wba8N2+wndbS2QmAg/qwurYeVzQrflVs/TJhylgfw4E0erTNz/82vBUqDx092Tlt1otOKjgyqNd8JBgqxgscLUD81nyyHOUlRruuu+RjZnzvWMlHuHNabhoGkDz847Q4F276MLRa90e6RPhgiPJ6H4SkrpS5zz41EB0vF8lIn8TmfYJRIQiqRI42gmuUCP6C8sxl/FdcOS13miKI7T6Gzzy/hMaEEEo/ruj483zdrepik/47vgHW+NxhlAYhfjvLofT3r0TU2JjdOPqy7jlv6dtVQiY3PDFbaxGOJOwpLaNBv6qIrDkB1d2RoOTjnJH4YlijD/Do1CAU41laj70YIkmnkhOzQq7eup9z0URb+onJrIAoD3hWJVh3k9tEHTMGXjK5CDogcUO8OFgrsRdwMio5Xk9lSOpDS+IQX4A1EGoh9Vv5fekP/aZWWWQYRE57FwpwFEja5Pc361ykxUdFJlnsVeGM+fA334fO1vKxx53unOxfwea9uesmT3ZDbv/LDyP3a89ls8bkrd8dRwFdULbSJJYcA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB10975.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: rGeAQ3hJG0vUIhJTeiIuUWtX5p3Qs9eUkyDkLzanEqfoStgo6XwBFM4x8IedKwXXAlnubFj7r70tKt3vn7wbvnE9gWoXlNcBehvnX/oX/C/h6NE17gyMB89wJKPeK/AGzuM2M9T+PeejAEFXPz6KzFYeg2EJ7WL6C5qi6AxPIvHldP9CIO7g6It8T/wFa+phcfJsUUQCmw3vbpajYC0mbqN7OITC3/1fD15J7vKd+WOGvAT3KI71K8zyrU2XMqdWTHwxXB/wUfHAmYr6hEpSZSRi5zrZHt64OdB6irdaqLkK6dPiAR3ZTl+wHDSw1at7M4ET5eX9eSY6NA6CzILFAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8232
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4741e6a0-0b12-48f6-6372-08dec62d3a62
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|1800799024|82310400026|35042699022|36860700016|376014|18002099003|22082099003|6133799003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: Tvw+f53z495Wn9Kuz2v6W27wsjW4Citu6YyKt1ul/yjvJzTi6TL/W5hyctr445SaVWfkePdjgMZN5RgiDKkwcVLPURGGGpR4zRiwOR3EPAGqfwUaPhk3iT849AYAm8qZ9ZjWnz3K6fsFdJmqCb1sqwXwaIe8pn35RVaUt+11mlKUpnj0nKYeSLJLEtvg3zG6AiKkhOVv0rgNi4EgHKn10Uol1kKvzW7GrGhQfY1vDGGMCqFr0JtzeL+VVew/f/nRusI/XgY34BpyJ1T+5JlYhQYS9BkE/xoqmKhIh54sz1YUri8BHpxj2eDitfjOTnA8adsIPUv9AxH3mzFGRNqHrvWsZjfuBJK9voMIsQlLT85fTu7biyO8XbmEEOkznKMF5hRC6O0hoJM20hJK4+gY1bs2vA1R8saQ+VselZFyYTos4jiAiWXOEfCjQu0eVt24JryyikXMlTgdAxfiy+1nTSX/m0eH9WgqZ95TOanrgXDQvq3VTJkj9NOYKyAcpMJ53p7U5ov1uB0rPWZhgDfIxayROZH3Rg+oPdFlzRGbs3Sdrwd0V9gRLueDra5WFXzUErsZCYpdrHQZVMgkUtlEg//2qPn08Gs6Y9PcN6oQg1cbIQ0bZ4+Ixa2AAcvQj5KOeej1sNozAT6kiA2LpmOr5uwoX6T4Lamxa2rkqH1VRH1UA38Qn3kOsiKa+f/YVoJQ465740vMMUgPM9OLPFeVX+cdQvCR4v5epVJYD653wtY=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(82310400026)(35042699022)(36860700016)(376014)(18002099003)(22082099003)(6133799003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WpOUgmaHTKmJgSahNRt/0gJfkqhGIhN/VA5yjNN6qbOKWU8WYJm+kVqhGD+QzkapG3vc9uggP+xNZE8l1bZZTqonWvssyIB0OUbakdM4rgubisoV+y75Apl7Vi2wiM5NRF8JF73cgaQ6aE0i7YkrqE6vLXmYSmaDBKvTp+/ZEpz3ZXx09a9ByF/D+Pat18nNyN6twem/nHKCyWWGJw96iVLh4H/2mSZ+hHNf8VJvM1O8JvWKQYt4G5q8axVC/Pu6o+8Kp5HtkfhIE5GGTipz5myX8upj7KKWTlxMMm9SJ8gNt34uUJo9tmc+qomg7gcDABPuAraA2XXBlSOdqPaOMy7Lgq4M1LmlTEEn7XDCyTMPyDjNbqySYY05fXU8Eub1dnffZcu8TGB2UxajHBw9KgGRjoanm0MqblD22QXoaC2skVkVbOLqLMhcq9Qj8ztv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 13:45:35.3836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2990695-bac4-473f-a013-08dec62d6217
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_064542_097083_C615269D 
X-CRM114-Status: GOOD (  26.07  )
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

On 09/06/2026 14:16, Kohei Enju wrote:
> On 06/03 12:48, Will Deacon wrote:
>> On Tue, Jun 02, 2026 at 04:48:43PM +0100, Suzuki K Poulose wrote:
>>> On 02/06/2026 12:01, Will Deacon wrote:
>>>> On Tue, May 19, 2026 at 07:12:08PM +0900, Kohei Enju wrote:
>>>>> With CONFIG_DEBUG_PREEMPT=y, smp_processor_id() becomes an alias of
>>>>> debug_smp_processor_id(). This debug function complains when certain
>>>>> conditions that ensure CPU ID stability are not met, specifically when
>>>>> it's called from a preemptible context.
>>>>>
>>>>> In arm_cca_report_new(), which runs in a preemptible context,
>>>>> smp_processor_id() triggers a splat [0] due to this.
>>>>>
>>>>> However, the CPU ID obtained here is used as the target CPU for
>>>>> smp_call_function_single() to designate a specific CPU for subsequent
>>>>> operations, not to assert that the current thread will continue to
>>>>> execute on the same CPU. Therefore, snapshotting the CPU ID itself is
>>>>> correct, and thus there's no actual harm except for the splat.
>>>>>
>>>>> Use raw_smp_processor_id() instead, to directly retrieve the current CPU
>>>>> ID without the debug checks, avoiding the unnecessary warning message
>>>>> while preserving the correct functional behavior.
>>>>
>>>> That's pretty disgusting imo so I'd like to see some more justification
>>>> for this approach.
>>>>
>>>>> Note that while migrate_disable() would pin the task to the current CPU,
>>>>> this path should not block CPU hotplug events. Therefore, we snapshot
>>>>> the current CPU ID and accept that smp_call_function_single() may fail
>>>>> if the CPU goes offline.
>>>>
>>>> Why shouldn't it block CPU hotplug events? What happens if the CPU goes
>>>> offline and comes back online again during the loop of continue calls?
>>>
>>> It need not. It can continue the calls. The RMM keeps track of the internal
>>> progress in the "REC" object for this "VCPU". Hotplug ON/OFF
>>> doesn't change the REC object in CCA Guest. So, a REC can come back and
>>> execute it. But the Linux could fail the operation if the CPU isn't
>>> available for fetching the report, after we do a RSI_ATTEST_TOKEN_INIT.
>>
>> I couldn't really shake that out of the RMM spec tbh:
>> RSI_ATTESTATION_TOKEN_CONTINUE is allowed to return RSI_ERROR_UNKNOWN
>> and I couldn't find anything about hotplug.

Like I said, we are dealing with Virtual CPUs (RECs here) and the only 
condition that the RMM enforces is the _CONTINUE calls are issued on the
same VCPU (REC). Hotplug doesn't change the REC (as a REC cannot be
modified or added once the Realm is ACTIVE).

>>
>> But my main point, really, is why are we not using migrate_disable()
>> here? I can't see the justification.

There is no reason, why we couldn't use this. TBH, I wasn't aware of the
helper ;-) at the time this was initially designed and we didn't want to
block CPU hotplug. We could always request a new report, it is not like
aborting a report generation has any side effects.

> 
> Hi Will,
> Sorry for the late reply.
> 
> I agree that using migrate_disable() makes this path simpler and
> clearer.
> 
> I've reviewed the discussion where the original commit was introduced:
>      https://lore.kernel.org/linux-arm-kernel/7a83461d-40fd-4e61-8833-5dae2abaf82b@arm.com/
> but I couldn't find a strong reason why we shouldn't block CPU hotplug
> or use migrate_disable(), even though I can see the current design was
> intentional.
> 
> So I'm happy to rework the patch to use migrate_disable() and remove
> the smp_call_function_single() calls if there are no objections.

I am fine with removing with migrate_disable() approach.

Cheers
Suzuki

> 
>>
>> Will
>>


