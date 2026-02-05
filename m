Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F6FEC1E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1luv7R/V9TzNsWEOAXKxuFIK5mK+yi1MzGUcmi1XSM=; b=GbnnT4+DpqxHY84v7mmEBetpYi
	VBq1TRZHMzmW/+AlAfGUPTnH7UPwzsMXU+blaqWT+c6vPfQLNMwHg1Ewib58tGVoVIsqBnYvTPyfd
	ZEdvDoDVyMqTRkw22kXHTSY87PWOk9SOql7JbcuLWcOYbPTUgLudoYDrM67Al1WNJTUx95kwCV7uo
	oujv/8yOSv+dSLSuWlc4dgYcoyATEosZriAx77ipsTQZhuXfewbD//u/yoL/eUdlLB5YDzPSk1FID
	jQHA6I4BPECpRaiaUROyc2aHK1+TBd0YNF6bVGCaSLiM4OkSzOrm4hZvEHNw0PWBtCCKm417e8Ij+
	DxmYbvDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwuy-00000009njU-2N45;
	Thu, 05 Feb 2026 10:49:00 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwuv-00000009nid-0iLC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 10:48:59 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=kvCcBlq55B4C+yzKdCysKUoEOGRAUv1unHnlvpaxl/dB0YwNzTaN562kpvolFGx6uifqjV+pCSUDs8V8oVRO5IBqPltB4HQm/StruReOEku5G0HzY+iO74Ia6ecbOTs/lNHAiTZ0em67isNaxv1GAG4jb0Re9YKWckqmpFJiY+FgxhF/L1tjx9inpEZgaRD+6MmeA0o/2c6e5rD7AKIwYqasmEZPgIxNI5McIayoZQjzWfhcQxsvyrSqesdbMljNZdlLCY2Jz+YGlKS4xTLdW3I0w1kHp9xZ9M0jGzmEu5UC2yqKPlSNIc14ya7w0de9nTXYHaWfDgwRGyhaTnJZ5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1luv7R/V9TzNsWEOAXKxuFIK5mK+yi1MzGUcmi1XSM=;
 b=GPK6imyodWrFdN2ZeNMeb6gqJ+W4EzjuusillOMAy+pMM4xaR0owa/2zNOGCbeEZoYpSqTRQR3PsuGyWq7uOIpXiCzZZRTvlb7rOLuX+aXzWHlVfZhCh04m9uirKIjy3vmjjKN2V4UEh0teFrsYk4VrWYanrWAWbu56e1wu3syIlwizbZw+LeY77+mzL6M6FLQoKmUjk4DvQhZUEthAee5ffEMBD299cvAGjY7EcTAGkIka4NyvXnoRL3pGh6Dy5Prqxbo6IKX9b1LarXRfLh9IqWlXCB8jnnIvcMfI0qemglFe0A1xhTX+cUp6AQmLpqKaAmg1IE+8saCzfmxG/yg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1luv7R/V9TzNsWEOAXKxuFIK5mK+yi1MzGUcmi1XSM=;
 b=oEQcqgpL7FVwDy3yxstg3u6JHQaMPP5XmzcUa1uqawM14FNriglqEuN9EswqZqAnl/tGAbmOnd+fGDKEO92WtaiP1u16QhQkWocbz8pnlvXxdPl5EP56cS97dt5iLE5tSZTPf4CtPYEs3wzVGPr0apY5gUhLbY0a9yVpxhTq51g=
Received: from DU2PR04CA0226.eurprd04.prod.outlook.com (2603:10a6:10:2b1::21)
 by AS8PR08MB8443.eurprd08.prod.outlook.com (2603:10a6:20b:567::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 10:48:48 +0000
Received: from DB1PEPF000509EC.eurprd03.prod.outlook.com
 (2603:10a6:10:2b1:cafe::52) by DU2PR04CA0226.outlook.office365.com
 (2603:10a6:10:2b1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Thu,
 5 Feb 2026 10:48:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EC.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 10:48:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyEZKLixabwnf0ePQspJCePaVSHS2WXjm94tWpgVe6+5hRBK1MHEKdcMGQAasemUm41lAvFWevDURkGsan5aG7Vqg1VPDrhUX6/FhUGxrIELbKSc0N7AzuZuuoxaYrQAjJjqLsvWBLfrQZRZ8vXWw9Ck7ELcr9fvXXy0DqEBljRFfI3Dvbpgw8tPVNru0YTTZ89nxNrfS7iWTdCp9SMjnIyv4lrxja2OfQacQvAqhvxtYp6/F+WHWJYU5NIu1G6P7K2JmK5KHd/sggn81s5NhETq84Wc2XRWfFSS4MVHXcfraA8K0uNDyba9G4n4nA1tXAD633sN2WchikTExbj5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1luv7R/V9TzNsWEOAXKxuFIK5mK+yi1MzGUcmi1XSM=;
 b=jILz1BZumjJjy4ETippd3xE3d/Jj6Nb3NFPv9DvAeTpG936CQgJAcG+nq0ajlnJm2EHvHk6DoUmbdgc0qN2KZ7qoUKb02GgnLejSxPCUzb9z02KwXuDLt+9jF8EjJnTIb1F+s/1/B9bKbvn53JEye4bxTIj33YuTA3vfMLKi9rjeAkrwGC52fGQ/FwjrgPaJLSgoWNu15hZ7886ZrZ/Gk6CucvPutEDbYP+eqpBQ/92G9goXi4AgttBREadlSE5BLxXPvlZPEyEipabqtTP3nMwD554BNxSWAERKXk2Qno6ljMnwsC0gkA7SykWv+GABu4RGPnpLEUyplKaTBe9BKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1luv7R/V9TzNsWEOAXKxuFIK5mK+yi1MzGUcmi1XSM=;
 b=oEQcqgpL7FVwDy3yxstg3u6JHQaMPP5XmzcUa1uqawM14FNriglqEuN9EswqZqAnl/tGAbmOnd+fGDKEO92WtaiP1u16QhQkWocbz8pnlvXxdPl5EP56cS97dt5iLE5tSZTPf4CtPYEs3wzVGPr0apY5gUhLbY0a9yVpxhTq51g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB6502.eurprd08.prod.outlook.com (2603:10a6:20b:335::24)
 by MRWPR08MB11808.eurprd08.prod.outlook.com (2603:10a6:501:9a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Thu, 5 Feb
 2026 10:47:45 +0000
Received: from AS8PR08MB6502.eurprd08.prod.outlook.com
 ([fe80::b605:86d8:45bc:37c5]) by AS8PR08MB6502.eurprd08.prod.outlook.com
 ([fe80::b605:86d8:45bc:37c5%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 10:47:45 +0000
Message-ID: <8501be99-e774-4799-ae6a-01ab31020864@arm.com>
Date: Thu, 5 Feb 2026 10:47:28 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
Content-Language: en-GB
To: Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
 <20260127132206.036892e4@donnerap.manchester.arm.com>
 <c1259bad-be4d-4489-840d-4ab2f4e466f2@arm.com>
 <8c343e6d-14f8-4f55-8218-bc3f0813e8cf@arm.com>
 <20260130-light-piquant-termite-fcbec4@sudeepholla> <aYHmDTboOtkgac00@pluto>
From: Debbie Horsfall <debbie.horsfall@arm.com>
In-Reply-To: <aYHmDTboOtkgac00@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0099.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::14) To AS8PR08MB6502.eurprd08.prod.outlook.com
 (2603:10a6:20b:335::24)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AS8PR08MB6502:EE_|MRWPR08MB11808:EE_|DB1PEPF000509EC:EE_|AS8PR08MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c4aa41-936c-4c04-4601-08de64a4247b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TGJRb1hDYk5pUEtOVEVBVGZhbXlwZDZrNktCWDBBV1ltNWp0RU1VQWF3RVh2?=
 =?utf-8?B?VGc4VE5vZ0hXNnpmenNJWmljRmRwL0orMzMyNUVYaGZCbk4vWnh4SnpkbktY?=
 =?utf-8?B?VVhlYjV2Y2ExTERBRzVtUFhPbTBRQTRuVXR2Vm4vblYxckl5bG42Y2t5Y25C?=
 =?utf-8?B?cGNXY0ZSRUJjaENOV24vTXk3MHQ4YzRyOW9GKzJLeEZQekNEZmlKMitDaDZN?=
 =?utf-8?B?ZjY3MjUrcndCNURMZVAvUXY4MGNHTGg2NllNaHRDcDZHc3BvL085SHlVYi8z?=
 =?utf-8?B?OFhQNnBDQS9ZS1BZQXU0QzRKSWc4ME1YekUxZERDeEVrNzYyOVhoMzN3dk41?=
 =?utf-8?B?Q05JTGFZeVd5WUdhalBsY0V0NURBL3ovZ0x1TThBN2JzSkVuVTcyR3RJVjd2?=
 =?utf-8?B?cnp5YVVmQVBOcUp6M3h2NnZGcmVkbUFkbUJZdFplT1B6RGR3d25XU0czZW5v?=
 =?utf-8?B?Vk1lZnF6UDZWSzNrQ1I5NkJEMEFqeXl5Y1FWRTJQeUJyMlJBMjJ0NlBna2t2?=
 =?utf-8?B?dVBsVXNrSlFIYmFLQWRVc0twbHBDb3lSOGg1NU4zd2NPdERoUHhTV0tWbTFh?=
 =?utf-8?B?UE1RZ0xoaWZKRHlYWFE3SzRtUXkzaFFtanY5dXU3bnpHZzhHMkpvZlVVZkNj?=
 =?utf-8?B?L0Q4b0tBNlF0M2pnWlRIT1NGUFRmT1d5NFAva2xGK0x3MkxUcis0aU1kdmdr?=
 =?utf-8?B?Mi90YzZFYTdwcGQ4eWhHNk5yM2tCZG5UNExmSkgxY2xPRTFCMW4zMnl5N0Zy?=
 =?utf-8?B?N08xY3FrQjZibDZYMTJzK0x4L3duNGNmNnYxMGlTQ3g1QURraDN2ZVJ1cXR1?=
 =?utf-8?B?MDUyQmhRcWczaG9mTXVWOWEwRi8rOVZnOXFpOG5HeGpta0toRy9OdEdqMmdv?=
 =?utf-8?B?bkJJTWVjVGVEVlZndHVJNVRKN2M0VkFvMDVXeHNwZzhTSER6ZTE3cFJReFBZ?=
 =?utf-8?B?endzQXh1dHJsa2lVZklZMnJENzIyK29SamxHc1B1OG4yWGRRTlhDRjJ1bitu?=
 =?utf-8?B?M1UxYXNGRlNPT1hqMDVFTTByblAzQlZFQ3RISkRIb0p2SDQxSkFCWmk1MHUv?=
 =?utf-8?B?UlZCTFIybEdMTkduY3ZLZ2tjd2lVYWVFUXdXUVRuVjhCcitRSllzUzVSaXdF?=
 =?utf-8?B?b241emxKUHFNWSt0T09WUUhUbE02bTh3VTNqQ05jTnU2YTFGaDd5MDVFWENa?=
 =?utf-8?B?UFp0SHg1K1lDSCs2eHliZmZ4ZjByZU5qWUdpMkRCV0JCRDR5V3krZ2JUUCto?=
 =?utf-8?B?YUh6YWtQTHQ2emI5RXV1RDJFUkRqNFY5RmllKzU2Tk0zSHF0NGJUUTdzSGZ0?=
 =?utf-8?B?MTRXMlJYTXNCTnZJKzRVb0xyS0NTRmM4T3h2YXNoa01sRmdyTTh6akFrbEZu?=
 =?utf-8?B?TVUxSC95UXNjUFkwN2xmQkJxLzR5bi9lcTBSaDI4Qytvd2QwdG9hWDRDb0Fn?=
 =?utf-8?B?L3NTWmd4WnBxUGV0MzNjR3kyYkhkVGdSb3RlSXU4R3FZWExVVVFXVk15SWtu?=
 =?utf-8?B?dVB4WmJDTC9PQ0Q2aTJCNG40bFQxN1hpNFhuUmZlbFFSajRVRGF1WEdNQXBZ?=
 =?utf-8?B?TE5va0pMZkE3ODBya3pzOVh3Z2RwdTl5NzQ3azh3aGMwQm02Z0hNSUExK2Zx?=
 =?utf-8?B?Um04anIydUk2T2dhV0FlQ25yNmtBZzFtdSt1bjhLei9Yc2tXN1ZXaHdmZEZM?=
 =?utf-8?B?Y1JWM2JXR1I3dE14L0RZR3hCMEJGM1AwT2c0ZnlDZXZ4VVl4VzhVRzU1RllJ?=
 =?utf-8?B?SHF3dGoyekVtOGlXbUJSNnkvVWMxZUxPVG45NlVBZU5zQm00K3V5SjVhaGJG?=
 =?utf-8?B?a0dpTmtBQUNMZDdJS096WmpxdVY4THp6OCsxWVdHalJ0YlQ5Wkd4c2FZK0tR?=
 =?utf-8?B?bXpsTTRCZk1iVldkQ3VpUXlqYldQQjdHT2oxZFpuSUJVNkJ5RStTMHNUWVBa?=
 =?utf-8?B?MEdqeEtIamZmc25lVllxczRqbEcwTlA2REc3SnJiSk94b0tJQkovWldGVkhG?=
 =?utf-8?B?MUpGQm4yTlA4dmFFVmRCV2l6Y3VNaFpJbC83d1hqcjVBSW1CNStVOXl6SnFV?=
 =?utf-8?B?R0lLUWxrYXljdTZHTUcxZGIzTjdXMkg1L3FGUmF2eFlTK1BzK0xXWnVEck5X?=
 =?utf-8?Q?QhXc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6502.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR08MB11808
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4bae4842-98d6-46b8-166e-08de64a3feff
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|35042699022|82310400026|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVhLc1JRY1RSa2E4YUtMcFcxWmVHY3FIWVBIU0UxSExhN1pYQ1Y1b3FnZzRP?=
 =?utf-8?B?WUxuNkhuT3NzNXVrdW84MXpOa1RmRU5haHlVMThER0VRZkFmR3dBVUtJVm02?=
 =?utf-8?B?WTc1OHZESUs5ZmYxNmpSbnBmb1ZUR0U1TFJIUkkxdkdPVGQvNWJhZEJjWU1S?=
 =?utf-8?B?OUhLZFowMENRVTZKTHlOa3hYNXlKNDNkNlpPdVNLelFjdTdMV0lvYnFCYnhO?=
 =?utf-8?B?MFpDdlhHdDRKTmJHTVBTQWtZZkdJWkt1alJKb0hyVGl0R0dsQkNKUXZkQklB?=
 =?utf-8?B?bFBYbVZhbFdnMTJaVE5UNktwWUlNc250dFVJUGtKSDl2NEp0K3U3dXpsTW9N?=
 =?utf-8?B?NHYxaFRyRnk0VHFNYzZLdWxocGlJdlRhVkdRYkZuYjIzVTZWVi9tdnN6WDN5?=
 =?utf-8?B?cUxMOHVyaXpicTlBeVdzWHQ0ekpicGt2MHdRYUpFQ0psMTYrakFDWkxTUDRm?=
 =?utf-8?B?TGZRNmtPUXJVclUwZWNtWDNGTGhCOGhydDhuQm5JSDFKemVmU3FjQnptZi8v?=
 =?utf-8?B?M3NRMWxBZVpqVEtSTlNINzNFMDV0aFJ4MG1DTWNQbUt1Q1BmRFNIMjNicGli?=
 =?utf-8?B?WVhPUDZ6bS9LTXo1d0Z3M1c3d2R4WU1QZmdqVUpGMStFMHJqRTRnRXFNMTZF?=
 =?utf-8?B?K04xYmdvSnhmQyt6UktpMFk2NzVPU0pCWDN0UUJ6OGNLMEp2OEJLZG5SQU5D?=
 =?utf-8?B?S2JzRGR4cWpKeGpjeXdpUlVSc2lMVis5NW9CeVN5dHJJa1VyOEhRb3l1Zmxn?=
 =?utf-8?B?aUhvVXRac1ExVFVjRG8rRTVkR1BPQWYvV1pLdDk1NldiV3lhd0VPbGhxK0NH?=
 =?utf-8?B?a0QzbWx5VGtsOTJmNEdPMU1STkZJYjg1WlB3eHVaa2NqNFdNTHpPc25YTXda?=
 =?utf-8?B?TEtRWGJyQmNNRUo5LzJiL1NwRGlneUZ2OVV2QlQ1MlA5QVo3NGlkODRmU3JY?=
 =?utf-8?B?M2FOWU5DcjZtbW1QM2Jod1BIaDA3OVBYRlJoMnhDMldNeE80blY2RUhKMDhH?=
 =?utf-8?B?Q2JseU05RGI3MG9FaWdET0ROWmoxN0drQUNCdG5NRTRibFpkTUdjcWZoOE1V?=
 =?utf-8?B?dG1saUE1NHArV3dFSXNCVzhBVGRrczZOYUNhNHBCbUwzYXRaak5LM3hEVTZ1?=
 =?utf-8?B?YTNzL3BySzYrZDhxSzFVMnZZeFFLemdlL0RoKzMrUkNFeDZvd0xSQ2xZaXZs?=
 =?utf-8?B?T3pjTmVtK0hYaDZ4L0VHL0pxeDdaMTI0MldrOUdFU0djaXBwYTNTS2xVVXIz?=
 =?utf-8?B?S1V2dnZ4UXFvanFxOVVjaUlzNnZwVzdReDNKYUNDc0J2N05EL3VxY0xVYjR5?=
 =?utf-8?B?VlFhZ1A5QVU5YVZkcC9rTnM0ekswa20rZ3RON1k0MitPNXZYMHF5TnAveHlF?=
 =?utf-8?B?a3QyNXJDZ3VwcS9vTnhWWnlOQUJzdEJhaVFHaDBBUTF6UlJJTW9McnBCOTQw?=
 =?utf-8?B?SHpjVVpkUHpoa1JUaEVubEtmRDdiTW5qVURFQ3Nzc2ZkbEZ3ek9qUFFxdkhG?=
 =?utf-8?B?bmt1S3RRL25SdTA3bUV5eFVnS29BekhxdWhyamtOTVR5YWFqb3Zab0YxcnBQ?=
 =?utf-8?B?MXNJV1VpZTRtRDZrTzViVW40d0E3V2xVcFVtcjBEaHNMam9tV1pJZStDU0NW?=
 =?utf-8?B?OW9yOGMwNm1INnFoZC9zSmtINGxxUmtESXh4c1h0TDkyUXpPSkwwMUk5QVZH?=
 =?utf-8?B?ZTdxYnErUXhWY1JodVNrSWpnQjJLSFluV3hEWTUrS2Z2QVVHUXg5b3VYbHlr?=
 =?utf-8?B?RExNY0RMM2FhbEVsTktFQjduQjlBQzMvdXJRcGYxanJwZi9PaGJpTmFtT1dr?=
 =?utf-8?B?REJVYU9SRVk3bitxQVMzaCsxSzJNSzFnUCszT3NrMEIyV2ZyUnMyMjRtdlRr?=
 =?utf-8?B?YTFQS1dMR1J1UjlZQkVRbXZKR1RkQTMwcUxwcDJIY0NsQW1Iems1RnBrVHhW?=
 =?utf-8?B?Wk8wekJ4MHdJMmE5ckNWZzFzRUVNMXNhaGdQV09Xd0lvWmRjUCtzV1dBOHA2?=
 =?utf-8?B?ZzZYVWljbUJNRFBBMXFQRWgwRmVYRStFY3NXUit1UU1WLzZsd01JRE9CeFdq?=
 =?utf-8?B?UDh2U2V4QlRDQ3h2NXM2cEJCbWRCZnRzQk0xSjRic1RtVllEaS9YNVowMzZK?=
 =?utf-8?B?ek5SaENtd1FuQWZmeE9RTXdsTlhqV1lOZjB0SkNGKzJLSk5iY0FidnppNC92?=
 =?utf-8?B?ZzAzZHlTaVFwRVQybWNFT0liQTN6N3lPRUFFUWNZT0NFZE1mUEltRlVRenly?=
 =?utf-8?B?VG12cFg5MUNWYVlybG9pOVJBOGtRPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r0gTRDJwz09hPAHFfIM5oREscnWKRPNo1UIDiBfXjv1Al+hIJWDPZnlxmeqL8FD1S9Epnj6981koA6rslQ1gGud41jYwNLJveRxV0ONTALrn1pfPuDZJSW7afy5oJnuztYhXLkuo5W17yK7lPqHC5J6k1GtY/Pr7VaGGh1cPpFcgHg2hzVDfJCSnX4Bqzg3mX3JXZ42YfRqZbPhXxRrhdKuTKnqWo7fwSdxxLHywgpPBV2A/Pq9MitAfbhXYbN2K2BuHylvIibagLuXnyW0zaOyV/SWxBnGozWIe6VfP9QpgviWJsUByKfL9vX1vXCSAmzagah7IA5wudVxiTuiesOgahgEnRlvovhjx2VAjHXUQHmz6kfqWgBYDmXfXcxd9enYnJH/PyW5VAtDJOdkpirAQV5ii66FD6BlFMoIETtAGiC48eUNlAoBwreQTLI+I
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 10:48:48.1471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c4aa41-936c-4c04-4601-08de64a4247b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_024857_330009_6BC43137 
X-CRM114-Status: GOOD (  12.21  )
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

On 03/02/2026 12:11, Cristian Marussi wrote:
> On Fri, Jan 30, 2026 at 12:34:31PM +0000, Sudeep Holla wrote:
>>
>> +Cristian(in case I am talking no sense)
>>
>> On Fri, Jan 30, 2026 at 11:31:25AM +0100, Andre Przywara wrote:
>>>
>>> So do you need just one "tx", but "rx" plus "rx_reply"? Which isn't valid in
>>> the current binding?
>>> If that's the case, then we would need a patch to relax the binding and
>>> allowing this combination as well.
>>> Looking into the kernel code it looks like the SCMI driver doesn't use
>>> mbox-names, but explicitly expects assignments depending on the number of
>>> mboxes? Somewhat confusing ...
> 
> Hi,
> 
> so the mbox-names are NOT mandatory, since the SCMI stack initially did
> NOT identify mboxes by names and such decision pre-dates me so I am not
> sure about the why...
> 
> ...anyway, when unidirectional mailboxes hw came along, in order to add
> clarity, WHILE maintaining backward compatibility, mbox-names were added
> only as optional and the stack really does NOT use them; the only thing
> that matters is the number and order of mboxes AND shmem areas: only the
> combination described in the mboxes binding description are allowed and
> accepted in order to manage both the case of unidirectional and
> bidirectional mailboxes while surviving backward compatibility.
> 
>>>
>>
>> It is generally transmitted via tx, and tx_reply is necessary when the
>> platform has unidirectional channels. tx_reply is used to determine when the
>> synchronization commands have completed, without requiring polling of the
>> shared memory. rx_reply is necessary only if the platform firmware expects
>> it and doesn't poll the shared memory for OSPM/agent acknowledgement.
> 
> In SCMI you have generally A2P (Agent-to-Platform) bidirectional channels
> to send commands and receive related replies using one dedicated shmem and,
> optionally, a distinct dedicated unidirectional channel P2A, with a
> distinct dedicated shmem, for receiving notifications and/or delayed
> responses sent asynchronously by the platform.
> 
> These two channels, A2P and P2A, maps in the SCMI stack (for historical
> reasons) respectively to TX and RX naming.
> 
> If the underlying transport is based on birectional mailboxes you can
> happily have 2 mboxes "tx", "rx" with 2 dedicated mbox areas.
> 
> Instead if your mailboxes are unidirectional like MHUv3, you will need
> effectively 2 mboxes to represent the 2 parts of the A2P birectional
> channel AND one mailbox to represent the P2A unidirectional channel,
> exactly like you do.
> 
> So, if you want to add the optional mbox-names would be:
> 
> 	firmware {
> 	    scmi {
> 	         compatible = "arm,scmi";
> 		 mbox-names = "tx", "tx_reply", "rx";
> 		 mboxes = <&mbox_db_tx 0 0 0 &mbox_db_rx 0 0 0 &mbox_db_rx 0 0 2>
>                   shmem = <&scmi_shmem_tx &scmi_shmem_rx>;
> 
> 
> ...since the first 2 mboxes effectively represents the 2 unidirectional
> sides of the A2P channel, with first being the cmd-request direction and
> the second being the cmd-reply direction, while the third mbox is just the
> P2A unidrectional channel...
> 
> ....so it is fine, even though admittedly fuorviating, that the tx_reply
> is attached to a db_rx block, since it is exactly what represents: the
> reply to a previously sent command.
> 
> Anyway, being the names optional, the only thing that really matters in all
> of the above is that the numbers of mboxes and shmems matches:
> 
> 	 3 mbox / 2 shmem => SCMI TX and RX over 3 mailbox unidirectional channels
> 
> The additional optional rx_reply mboxes was added to represent P2A
> channels that have an completion interrupt.
> 
> All of this madness was the best way I could find to address the problem
> of supporting such new unidirectional mailboxes in the SCMI while NOT
> breaking backward compatibility in the absence of mandatory naming from
> the start.
> 
> Hope to have shed a light, beside having annoyed you all with all of the
> above flood of words :P
> 
> Thanks,
> Cristian
> 

Hi Cristian,

Thanks very much for the detailed explanation, all makes sense. I will 
add those mbox-names in accordance.

-- 

Kind regards,
Debbie

