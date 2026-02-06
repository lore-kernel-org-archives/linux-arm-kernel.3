Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B45EB28E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 08:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dHI+gNOsesKOQ69vQgGbiNsBbG+4pZgsSKrzZfnrotw=; b=1WMaOW/B/5anSSHcH+jIDfm+HI
	qQHhKipVyBWf42s/KRKtL2tZX/vObhB/dmvrqmKt8CeAOITpjQc1AkKdVuYgytRq4YBJ0sOb6ACX4
	oN3Iuq4OHcs5jqztz22FUD8FVbBCaeMs50ZoiXfxM0eS+jb3q3MTq5LCZv0aiw0PRjoE+G2NRmxt7
	uGFQUpnArTfeHTfsIDCYBBkkxLNopiESlPJs03YHZUI9zgJZPjxZa3Jgm+l7FuqIGCi+TJZzNoPzy
	OSR/zEKYBg9rVZTU3z7NZQFsH8/gXJ1kWpqNpJ9FxrOOXQdL0MclMFnYKxYBhFYLqdDcf9sSuyeaT
	6VnNzkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voH6f-0000000B1ou-471N;
	Fri, 06 Feb 2026 08:22:25 +0000
Received: from mail-westusazon11020080.outbound.protection.outlook.com ([52.101.85.80] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voH6d-0000000B1oF-2kC8;
	Fri, 06 Feb 2026 08:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oljo2csfMYKE36XdRcRRTXAAMp/iCuiV25dcgwKdyRWFxfcZSwY9wApzysURFWI5ZQpsZJKGrHr/9gAtRp5FwLOwDRRomvkoz04VKlQsT83ZH5RoVRkRMQElvjBChgvlordrnwIl72cf9nulzlOwv+oBuQZRonNDrdPP0F2FQ4slWKEtj4MEUUJRmIX1NBwZJ4R28/yJsgi/4gBn/tjon/QwdiBUCOTEEj8fy8mxA2Md5XZa2ifj4NV3s+iDFJodTj5ep05bXn4NMx9htwCZgv941UP428YCGRmxy9fLFZ5ChMsFUeqa6ICum/cj3QdIKDIZs9QWy3EkuNYFRZqqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dHI+gNOsesKOQ69vQgGbiNsBbG+4pZgsSKrzZfnrotw=;
 b=AGcXmxKRVzOkh/VKTelsqvath4Jvk7uMgelV4v1fpLpmpIZmolIQHBmAubOdNNUELfcM2K8A1q++dY7MV0L39DIT1Xh1QRd/+sT1tOEXuAWu0eK2EnZ+pjks1bLxc9TN1SkjJivELLls7hLM/fFrvl8hWlTcopvS5tansrZxmlDFm6jc4r5Du2MjQGV55lr2OyVc3hvZozpz3RxaI/mVSfSKMAwANGNIYGjl/LYzzF6I4uPLnp6M0W2eZ4AU/TI/Bq/Wyh2ZZ4LhPPGpV9yOj4UDsXqt8cDT8OSdvJ/inrnyAki/lHB46pRfxxgXk9uVxreiMTmJpyxHEsIt0gUxZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dHI+gNOsesKOQ69vQgGbiNsBbG+4pZgsSKrzZfnrotw=;
 b=MaD73iQ0HeVbDbHSjhLPHpt6+VWzJE4QT10rtUKip9ODK1xSEQDeKDEOAmhiH9DP1brjIQbr4bwp2vhHoHAlrvKXFAI+4vAYEOYGbq1zPklbf2VEvTlbkIBVujc8hAa3re9RP3nl42wAMp9uvH33qjr4oTXkAUwQXuQDOzst58x0Z5S3cI7+n8pEF/jj4NW0V8QHbidt5WynI7dDxsX1WIFaT2h1ndl5WV62gWfz9yOP5hI7pXnJPFBjomEG8jr5z71auE/0W3L4+iRQONzXtjXSXoojFAumVh4cdt/lJBkWmcFOhOKpmTfGuF07Ujs5IAO80RYldbOxVq5f4v94ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM6PR18MB3667.namprd18.prod.outlook.com (2603:10b6:5:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 08:22:19 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:22:18 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Subject: [PATCH v2 0/4] Add eMMC PHY support for Axiado AX3000 SoC
Date: Fri, 06 Feb 2026 16:22:07 +0800
Message-Id: <20260206-axiado-ax3000-add-emmc-phy-driver-support-v2-0-a2f59e97a92d@axiado.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK+khWkC/5WNQQ6CMBBFr0K6dkxbkIAr72FY1M4gs4A2LTYQw
 t2tGA/g6uf95P+3iUiBKYprsYlAiSO7KYM+FcIOZnoSMGYWWupaKtmAWdigy1FKKcEgAo2jBT+
 sgIETBYgv712YAWtlyGDT11qL/OcD9bwcrnuXeeA4u7Ae6qQ+7c/S/mFJCiQgVmV1afHRk7l9t
 2frRtHt+/4GqY52UOMAAAA=
X-Change-ID: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2334; i=twei@axiado.com;
 h=from:subject:message-id; bh=tKbmqwOvoiDSUEhXC7ZjexMYVAHlY20HHrOoCL/idto=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBphaS5JNRUsP6X91GqA84ZAwhgmKm8joBQXfLOA
 u/jpLI6BpWJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaYWkuQAKCRB4EDBdxFrx
 1+y8C/0dojAx17+af8HLXzN74ED67ObSw9CNeEVSjoN0J20a7WM/QUYNTirQkKk6P3pwPb97dXI
 p6TLB5YKDN5PKKe+/o6qn658Ech4Fb5EVQAF/UVy7rJvq/CAj10DS1pwtvAxDYLR/99IojZNvXp
 6nSKJr79CPvU9Ncaz6MERreBh8+SgVw9Rvb8cystXBex47pADOfGKn649mGQodoebAavU5qL71H
 7f8t9K3DV7wQtArjUYXPNgcZCbrSgOsGYcKf+E1CCU+R3P7YZzIUvb/U1OzPWUWE3fud5gIZIzd
 GkXxlUwRUt8qys2lBeGDqzenVWUnFkcYQqEA8GtxRn+qN97QnZVAbEb9MvwfypAP+ubxIsfrE09
 thmPfwBdxR2aBRtBZLE6ubXj64sMORtjV6TNaBGzxJBIOygn5M3G8AoMk6/u38n/cSYeDEMZyBb
 wOgxy/R1QlqqAa70dBi58RiPKgoFCNItoGsEOivKLgUAL+wvkUOxNC9bhDxEdQA7CnY1s=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH7PR17CA0044.namprd17.prod.outlook.com
 (2603:10b6:510:323::15) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DM6PR18MB3667:EE_
X-MS-Office365-Filtering-Correlation-Id: 874fdc86-db76-4d7b-f9f0-08de6558d7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|42112799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THRIVWFOajJEYkgvamx2aXBJT0ZiSVkxMzAwTlNEV0pMOWt1M1pXT2RCWmty?=
 =?utf-8?B?YUF2UmRFUEhlSmZ2YmNNQm96dG9aMUtWcFRMREhIMlJJZ1BUek16aUZ5NE5C?=
 =?utf-8?B?NVYwaThQVC9VZmNvMTkwRHBTU21ocE1OeGc0WjVzeHlreFkyUytZRmVzckFp?=
 =?utf-8?B?TU03dHh2WWRKd05rQTVuY1QzWUo3ZTMzUG1aeHpNSzRTLzdLZ0hDcFF5Y3ht?=
 =?utf-8?B?UGNmL21MYi9OVEVRdGljVDRWWUpoazROaTk5T1pFMGRwMTNDSnJaQktHODAy?=
 =?utf-8?B?Tkd1cU9ibmc3eGtlNWYvSWFmZnd5UkRvMEx2RmtORWZENXBlWnV6dzR2MkN2?=
 =?utf-8?B?dldCZGRYZVBYWnZHNjlKK3FNdDNFSnhpRW5XUlAxS2d2MGlqRm1JbDd2NjRJ?=
 =?utf-8?B?L1FidEFSdWo5SGhDekRCV3FXTjh3N1JUd2VrNjlzT3NqY21HTk5PQTdoQ2cw?=
 =?utf-8?B?WmxEaHlZMnhaRnVzbjM1T0Q0M05kTGRMcjdScGhjS0VVZVlrdXhzMXBRYUdt?=
 =?utf-8?B?U0VDZHFVaWhwVkR3b2FIYlpSc1pNaWZudmlrckQwOUtiZXNxcXl4YU45elp2?=
 =?utf-8?B?YXZrSDFySlBvSHJBTjdHeUU0RXZqTHRrMVV3UlowaWVyMG03cTZXcS9pSGxl?=
 =?utf-8?B?Z2pualI3bDgrOFVoVUtjOWVweW5mU2xNbzZJcDZFM0t3UjhkdnRNVWdndTds?=
 =?utf-8?B?d3R5NCs1KzZIR2RSbHVSalhWWmFqSDloVHdYR0FENE1MZEc2aG4yY2VCMEN3?=
 =?utf-8?B?TDQ5T1pGcXlaVm50WlZ2UDloNTVlSDFVbUdraC9tSmRNTGdpRjZZVnZoeUtV?=
 =?utf-8?B?bGtjV3lyejZ0N1NOeFlTL3VrWVZwSHRxUEV0NWEyZGRkcUNBZGwwZ3lpTHVW?=
 =?utf-8?B?K2pNemJOUEFxSDhKMU9TNWh3M1g0VVl4Q1pLWnNqVGpDZ01WT3dQZG4wTCsx?=
 =?utf-8?B?cGc5MjFxWTVIKzVYUUVlV29qNXhldEFOVWRZQ2RkaUpnRTBkWXA1dmVldlQx?=
 =?utf-8?B?amJ6QUM2NkkyWTdPdjdURVNZNTV4UTRaUGFmL1JRWHhxSzFRa205NHk4OStx?=
 =?utf-8?B?bmVTbnpyRS9nWjFqUWxISFFFN1lsYkdVUlZmZFE5b3V4QVlGUmtpcDFzVVVj?=
 =?utf-8?B?WkdxcnhWNFB6RWx3c1ppcUNXNTMybllMb1dKMG4yekRLUGpTVk15K20vVUJZ?=
 =?utf-8?B?MGozRExudWJsRVR3YXNaNmRKWGEwSjRLUmMrUFFCcGdzcTdHekRPR01Ed3JN?=
 =?utf-8?B?RWo2NFZJTXJmSVBSRzNpbU0vWEhaOFFUbHlLaHVFc1pmUm9MTEVvcHFENmxZ?=
 =?utf-8?B?Z1JoTVZvZHhuc3U4ZnV0N205Z1pmWThaQjBjOWFhcEZyaFZSalZMRFVvTDBk?=
 =?utf-8?B?TjFMT2ZOM3duclp5dkVuaUkxMisya1JTRGY4S2V6STB0eUxJUjNCeFdSaVlJ?=
 =?utf-8?B?TktKMmtjNHZlYVhzbHNwWndCeWZlRFJTTGdvcG9mSldNQ3BmTllyWmRBazFx?=
 =?utf-8?B?aDF1NERuSEtobE5pVlNzVk9iVDgxTlNna2w2SWVuV0x5QTFQNEd1djhmTUNt?=
 =?utf-8?B?eStsOS9vTldFK0JjNUZIRnY5eWFYb3pLMWg0T0tBTVdmZ3FCQVg4Z0duL1lT?=
 =?utf-8?B?MTBvOC9MV0NEaHp0OXFyMVFZRDdzNHRiZi90OXpYVnRqdlY2eUMxemhCanJZ?=
 =?utf-8?B?Z2JmeXpJdEV6OXFaVWNpVXl2ZU0xQmtYK0JUeWNkRTNHVnhia1BIOS9Udkdl?=
 =?utf-8?B?Z21zUFVpSnNLdlFVMFg5cnYzVGZLNzdjM3FiNEJxYmQ2VHFVbVFFS3BLeExz?=
 =?utf-8?B?WDFWa2xQQW9qWGFDTWw3NEtOMzc3amNHNEw3QlJUUTd6bUdtSzczclpxNDhh?=
 =?utf-8?B?c0daTW1leUk0bkJ3Tmp4bVlCVSsyakFGTkY3NjYyOUR3M1dBRlgvRjNRZXlX?=
 =?utf-8?B?aGhyRHdieUZaSnA3dGpGT0dUeS9TZnBTRndMVzV6blBTakZJc1NMM2Fjc3lx?=
 =?utf-8?B?ZXBtMGVxa2h5elpONk81ZGVhaW9oZEY5azAzdlNTWkdzYkRRdFVRdHhqeVVx?=
 =?utf-8?B?am9YRHh5d1dZSk5SRnFjRWJNMEZNdjFFOFplb2NXcTZJdUhQQ2poVVI1NUI5?=
 =?utf-8?B?OTNrVFB5RTNMMGF1dXlEU2hzSEZ5bzBMTHR6cjJCSEs5OHlycjFZNEZVOGhp?=
 =?utf-8?Q?fDzzppsOjqylwmfjG0Il2cygVpPHSbJab4V4YeSIeFrs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(42112799006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXlTbnZGNGxJTE5RMnIzbTVEWG5MUFIzWFVBWDhHZEx6aW1yVENFTWxhTnM4?=
 =?utf-8?B?N3Z6NENTcDkvUDRDV3BQdWZhRE5rNkg1blpEVW83bkR2dmpSWFB4V29NQzd5?=
 =?utf-8?B?OFptcWpHSkZNVFU2cExqbnJZaW9URlorRmxBL21SSHZaZllSRWVFVGZyUk9T?=
 =?utf-8?B?WTBBZXZqdjNZWjg2eXYzaGE2b3NNKzBNdVJKSGtYSGk5Q1pSVFZEQm00dWFE?=
 =?utf-8?B?Z3Q2dWNDU1FpTmUxR2w3SkwvVGxWbndtS0VNVUZkc0RvMFZXeWUralRQSGE4?=
 =?utf-8?B?MkhFZHhxYVhwNWI4cDZYdUJoQWYxU3Q0dUFCMkd5NWVOMFIxSDRGQWhyVHlC?=
 =?utf-8?B?MGVUeE54NUVna1JzL015dGw4blVaK1pSbnZJblZZVGNYZEt0RGwzTHFnNDJ6?=
 =?utf-8?B?cXBaNE1BZFpySGFqM2NVVEs4QkFEU0VSUnZxK3p1VFZ1aWtNZ1BPMU90cVRz?=
 =?utf-8?B?ZjN0QndwZjdRV1NydEFUSmZqS0dWSXZsUnlGZUVENDNBbmlkRWUzbVZneU1K?=
 =?utf-8?B?eWxvQk1nTDVmdVlHM1hQY1YwT0VvbWxUelY3S1hhQ1U1UmtpWlpESStGa0dB?=
 =?utf-8?B?ZlpSSFNBRzFrMi9aQmtnWXduMWF1VXI0NE8waGpyRGFpNlBuYUQ5aTlZZ3Vh?=
 =?utf-8?B?M0R5L2NGVm5RQmx3c1o4OHpJUjZVemtVMFgxSndnalNndGdXM0g2Um8rK1ZP?=
 =?utf-8?B?TTYvVFNiVW91RTdwZnVpTnVONGZ0a2U2b3V4dDM3Z0pBY0lzcWZOUmswSVd3?=
 =?utf-8?B?VzduRmNyb3ZtR2taYVlGNVA5c2Z6S3BiOUlvVUNlN0M0b2UwZVFURmt4VW1z?=
 =?utf-8?B?OFNSYUg1ZXVkcVZhY2pnODlDTU1seTM3SisrUlJPVDVrRVFqRjRxeml5WDFW?=
 =?utf-8?B?eCt3UkJaS0Eyb3R3TWNtMWtmWURxZGUzZkdVSFp4a0duN3ArejdhVUJOaVd6?=
 =?utf-8?B?UEZkdDc2SnhoSm5GaXRsNmFiRW13ZlNVSytQV0s4ZEZEWW43dktVLzZ5bXBx?=
 =?utf-8?B?ZzZEVEtSVStvM3FHMUZJYVkxZXY3c2wrR0tCTDdObHMxTStMU3JLLzNHL2Vh?=
 =?utf-8?B?SUh5S3FsRGJ2STNWN2RIZzUwMG9xVjBKaUlNa3A2UW80Zm5OZHBzSVlCL2Nk?=
 =?utf-8?B?RXltVFB2QTBSclJRbEh0SEZybFF5R09KL1BjVkZoM3lBSWovL3RwL05YeXZu?=
 =?utf-8?B?Q1Jza3hGY25xZ2dZdVdmd3J4clE5VHRya0d5QmsrSE1odHRjaXNUQ2RXdW4y?=
 =?utf-8?B?b1FTUXhIZnM2RmtDYjE4M1ltanA3LzlDUjlVbUY2bkYzMmszbkhhUDJrNkVL?=
 =?utf-8?B?WmhrTTgweWFkYVlOTU9vOWxuNzd5eUVTdWo4VmRqaHhHTVMyRmtxVnhaRDRl?=
 =?utf-8?B?TFpJRFhUT3FsNGpzMk8rSi83R2gxeHB2bWtZbXhjL0hwcDVnbFZDWUYraWtR?=
 =?utf-8?B?bjVQSnZOYU5xMzU3Q3E2L1JtcDlZcERweWZMYWRiV0NwQ01WNjJhaXlLUVI0?=
 =?utf-8?B?dm9aaUZWK3J0UkhzUnlWZzN4WnYwV24yRDNSVWNGazVadnZVVVRtSWx0aS9E?=
 =?utf-8?B?ckt0VGZwQ3V2aWkvT3NGUEM5Z1B0M1ZJU0RVWE1jN0RaUmMzbjNJMm1GNFBJ?=
 =?utf-8?B?QmNHM3dHSHdVZXNNYlhMS2hwSXJNMkhmODBJSmlSRGNTOHdRZU41Y1k0TGxJ?=
 =?utf-8?B?eXdlVTdaa3dmVDBrUEUzamtZRDNyWDVPcm5YSm4vaTR0YlowbkFKenBqWTEx?=
 =?utf-8?B?T2NzenNtaVVjQW1YMzlIRm5oS3ZWUlR2Y21wbHdiQk9nWTdtSy9yVUxqWkpP?=
 =?utf-8?B?dUk5ZEhXcFFRU2JFQ1Z6ckF3c25QRmQ2ZHIxQzhoODlOU1FOOC9LMGZqaG52?=
 =?utf-8?B?VG9GNHUrUWxwVzRqcjBvdXd0eWZadjBRbDhka25ub25yd1FvSS9CWWh4K0p5?=
 =?utf-8?B?ZjltOGgvVGNHNmtTeUdBd3FUWWJsc3lCWnJDQ011SWZLVXJDcThuSmVZU0FQ?=
 =?utf-8?B?NHFYampoTFppRHlDUndBZ25WQ3JrMDV5ekdCRmFkdDl6dWlTa2pOa2MvYkVB?=
 =?utf-8?B?dHdLOHp5dG01dmE2bEFZZk1qVVpyVERIRVZqb0xtek1KSTlLS1ZPaG1OYk5D?=
 =?utf-8?B?SmFWRCtyK1RMenU0T29KNGdaL01DWFNRc2I3aDVvc0FXdzZ1Zk83S1JoVHJL?=
 =?utf-8?B?M3R1T2p5WTE1ZnJlTi92SHRnOXNWUytOclNtdjV6cE5xTE95clZrcjBDTE5i?=
 =?utf-8?B?ZW5IejBXKzdlRlZKSXFZWUQwS2dqeEhXNllVZGlVWW5HM2htVGtVZE82RXAv?=
 =?utf-8?Q?zPv6Gg72OHoaKK6d28?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874fdc86-db76-4d7b-f9f0-08de6558d7cf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 08:22:18.6400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOcKeQhHraQ/PBPO6flXudqqBWd1CSi2QSXBhRuueJX4aH/4vbAFjvJDoLn/73tF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_002223_711785_A40A01A4 
X-CRM114-Status: GOOD (  10.03  )
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

Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
HS200 eMMC controller.

This series includes:
1. Add bindings for Axiado AX3000 eMMC PHY
2. Add Axiado AX3000 eMMC phy driver
3. Update MAINTAINERS for the new driver
4. Update Axiado AX3000 device tree

Changes in v2:
- Fix dt-binding format
- Fix compilation error in m68k
- Use readl_poll_timeout instead of read_poll_timeout
- Link to v1: https://lore.kernel.org/r/20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com

Changes: (The previous version was mixed with Host driver, so I separate
the PHY driver as a new thread)
- Fix property order in required section to match properties section
- Fixed example to use lowercase hex and proper node naming
- Removed wrapper functions, use readl/writel directly
- Replaced manual polling loops with read_poll_timeout macro
- Used devm_platform_ioremap_resource instead of separate calls
- Removed unnecessary of_match_node check
- Used dev_err_probe for error reporting
- Added proper Kconfig dependencies (ARCH_AXIADO || COMPILE_TEST)
- Fixed various coding style issues
- Link to previous patches: https://lore.kernel.org/all/20251222-axiado-ax3000-add-emmc-host-driver-support-v1-0-5457d0ebcdb4@axiado.com/

Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
SriNavmani A (3):
      dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado eMMC PHY
      phy: axiado: add Axiado eMMC PHY driver
      arm64: dts: axiado: Add eMMC PHY node

Tzu-Hao Wei (1):
      MAINTAINERS: Add Axiado AX3000 eMMC PHY driver

 .../bindings/phy/axiado,ax3000-emmc-phy.yaml       |  37 ++++
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/axiado/ax3000.dtsi             |   7 +
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/axiado/Kconfig                         |  11 +
 drivers/phy/axiado/Makefile                        |   1 +
 drivers/phy/axiado/phy-axiado-emmc.c               | 221 +++++++++++++++++++++
 8 files changed, 289 insertions(+)
---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260108-axiado-ax3000-add-emmc-phy-driver-support-d61aead8f622

Best regards,
-- 
Tzu-Hao Wei <twei@axiado.com>


