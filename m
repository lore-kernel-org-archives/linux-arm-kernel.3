Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F41F1CA100F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31K25VzM/5j6fyP/CSwyIXJ7gU6X5dQvsiLFQSOhZDk=; b=sqZ9slSg4KS7MFkxuv/vVaDI1K
	fiHRxxPBi/nLdyWiQ//3iE7VI7oI9u25fKvcfhzoMtmTXb3deYmRP7rc8/1/6UV0PjIXU8n6Hw3qA
	xrot9daKr5xrbVUz5O803udSRxXLjbsSqE2wCxAY0hjzZ0LRAEkiGiLttU5Fo4afqR11WYGAf09um
	QxYki/rALPe+ht9xYWHA4ZbcV3T74VTRpxPjbd+dSK1KQ6TlYumblriR6D3hejjh8546hFF+OfzhQ
	pBYkqBQ7+RCdnGCryJVpVYPI0HhKCxDVyeJfSZ4yGQh41u+46V8t0wHy4efi218JDdhNgC88qhHlj
	44QDT4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jTc-0000000Azbc-1UOE;
	Mon, 22 Sep 2025 16:33:20 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jTX-0000000AzZ9-2DPp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 16:33:18 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CRxDiTRacnXqUp0IvU7Ou3Mj844r75nZhGDLEfIgB3f212iRkMnCZcyxzzB8PKRtqQbH39C4CsDqOF3/msJAv7vWq6wyftdIMPlqJesyEFAkmNFj4ZJmOL/LpOMbB9Eoypm+XyL3FtQgBCzyq50zGz7hgp7OPbPUtsNX5QZPZbNeDBgrT30WeN+9cL21icDaUO9s1Wr68N/D7IURsoZzNBHJI4e/xJxtaS/8UeDYtPgFuVHPMZd1LnyHRRFUwX+0KzUETLCiWV4ZHIuKNH/+JYTX5LgQUaWMxzZF4SIYaXanXHNPByElV1pzrnLU4quD3SkFMqDRGNUXvPqiTP3gEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31K25VzM/5j6fyP/CSwyIXJ7gU6X5dQvsiLFQSOhZDk=;
 b=kxjKsWGxkfte+P4u3+CiPZSVZ2z6S2G0o6JJ+kQG+TzOd3clswiyo5/udB3EApRu5XuF2ZJkpjYzuERTY9wn61Qh0C+sTbvn75Pi9pkjCnoG07xPMEM7MRf1/lYW8ZELrxX2dlVTAl9wxxOnC/tEmGT1tvStcWFAgBB5dBNYyManpI2IWiFDyjsY322z8KB0h+RGI2Tdh8q7ndVac+Mh5fNctBVWSGERjBe0ViwAdrNFfw9E0w/xFiCkPqg4ctZmZxH1I6M/MBnenK2fwVIDRL+5zESBWwH1NBlZneA0ne9WbnUwE/nCo0/ugVosHqKuFUdDNiobDHCYWWvxucCIsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31K25VzM/5j6fyP/CSwyIXJ7gU6X5dQvsiLFQSOhZDk=;
 b=T5d35iSO3/1dcOEXFjwTKe5/lmIidTVaQy25elkCqd7ovMRl0zf5xvL32F2TZ9rRZH3K/uutgGdIJ/h57TH9fjv668Vj9GX8P8GO+E8Pb21ke6QbbARJYBBoq2HsNxo27t5/ss9qC+bYtwnkeF5TRjA1r/MTfBzTioeAwx9nBwY=
Received: from CWLP265CA0384.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5e::36)
 by DB5PR08MB10023.eurprd08.prod.outlook.com (2603:10a6:10:4a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 16:33:03 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:401:5e:cafe::b3) by CWLP265CA0384.outlook.office365.com
 (2603:10a6:401:5e::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 16:33:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Mon, 22 Sep 2025 16:33:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnxwnIZom2t3ncyhPGfvgBseYIuceMDfsUnFHLoQ0bx0LIgcpwgTygJLWY8yC8B+uamViWyQ+n6buRh6Da30efmFqyQ23NWtRXy/3n/ixzdqQig3FQGKBTnl2YbOQZi4lUmIU/jM0hZUn2vvm1Ggq9vBFHkIEAiUqYZeA/V5X6C6gL8awksROXuc+e6LDwN1xynjYjTPlI0Z5F9EhkRogsYHbGuZuZ+XdH5hLh0595e9/9NQxINMFrEvSeJZbWesWqFCyHktpGkhPr84Vs98Rhu4Ip9Sb1K2PpIeG79ZmRXj/dhAMDHjPpzSWssWGySCdwPZaNRcDyd4c9wdXyolBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31K25VzM/5j6fyP/CSwyIXJ7gU6X5dQvsiLFQSOhZDk=;
 b=bb7NtoUI6tuOzqj+vOyfhPdmVW6ph3cB04TZY9h2M2letZ7Zu6//B3gQDGbvp3EV5Rc0DcFbK5AZJ+LQIEm+h5Y2haqe63LPpTdkrYQBajegQ/DT6GRHD3qq9ZS8sLmG837XDnQ0sZ2zi3UQrZRiZqu4LikvpWAWDo8OlmCBtnbXhavRTeZxvbR/7pQOYO9Z/U5sH3A07k25swBhiRw9rhp5VPqUVjwSnTq/jKL0kAfkkUdeBEh9jU11EUVEeO1srKaAnZNK6pBnHQwnWVCR02N6t2B1ZiaKq/aFW2tQNnrkaShhAegkEzhnkIfufVu7b9BZ/LXAniNfERCHjsd9ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31K25VzM/5j6fyP/CSwyIXJ7gU6X5dQvsiLFQSOhZDk=;
 b=T5d35iSO3/1dcOEXFjwTKe5/lmIidTVaQy25elkCqd7ovMRl0zf5xvL32F2TZ9rRZH3K/uutgGdIJ/h57TH9fjv668Vj9GX8P8GO+E8Pb21ke6QbbARJYBBoq2HsNxo27t5/ss9qC+bYtwnkeF5TRjA1r/MTfBzTioeAwx9nBwY=
Received: from DU2PR08MB10202.eurprd08.prod.outlook.com (2603:10a6:10:46e::5)
 by AS8PR08MB6661.eurprd08.prod.outlook.com (2603:10a6:20b:38f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 16:32:30 +0000
Received: from DU2PR08MB10202.eurprd08.prod.outlook.com
 ([fe80::871d:8cc1:8a32:2d31]) by DU2PR08MB10202.eurprd08.prod.outlook.com
 ([fe80::871d:8cc1:8a32:2d31%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 16:32:29 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "maz@kernel.org" <maz@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, nd <nd@arm.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Add PCI bus msi-parent property handling
Thread-Topic: [PATCH] irqchip/gic-v5: Add PCI bus msi-parent property handling
Thread-Index: AQHcK8zc0E8DgszWGk+FrqTwtqZfnbSfZV+A
Date: Mon, 22 Sep 2025 16:32:29 +0000
Message-ID: <36b73847e6a9c451242e071dea3089613789f696.camel@arm.com>
References: <20250922142610.80200-1-lpieralisi@kernel.org>
In-Reply-To: <20250922142610.80200-1-lpieralisi@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU2PR08MB10202:EE_|AS8PR08MB6661:EE_|AM4PEPF00027A64:EE_|DB5PR08MB10023:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b9b089-d004-47ab-7dd0-08ddf9f5b3aa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?TG9qNmZtZXUwVXJRREdsRVV6d083T2E4SzhzMDZuc0FVNXN0RjlkaWNpdXZ2?=
 =?utf-8?B?SXFnVzRMN0g0WWF4NEV6MWd6ZzB4ZXFZYU16M21VNGdHS1VIeDZydVMwR1h0?=
 =?utf-8?B?MUVFSjZ1TEwyT2Vjbm15MVpYTU5ZcFNZQm9uV2hHcmQ1eHZFa3hLTDAxcTRS?=
 =?utf-8?B?bGVYc0ZpMlJXRVFUcndlSnhJa1lIZ3c0WEF0bmJwV1g3WWp6ZzRVcE02RGN4?=
 =?utf-8?B?VytXSDFzNy9aaldZenFYWkEwTTlYUkhTMytIbGRIT1lRd1A3T2RZQTFRbjVR?=
 =?utf-8?B?SWVVLzBzNkJnLzlXelFJWW5yaDdNK0Z3Z0NDNWEvZmdHQnhkc1o5RFRhK1V0?=
 =?utf-8?B?ejdCYzEvMEFuNzAyVEd5TmV3TkpZM3cvMSs5M0t2aDJ3amRHeHpKQzhjcC83?=
 =?utf-8?B?d3ZrcWlPR1VHdzkvV213dk9ldzlUSFcxN3lJMFJkUnNZVG8yQUp5cmE1Unhy?=
 =?utf-8?B?REUwR3ZtQzFKaC9yQ0daMFlFRlZCc2o3TXJJVnEwSmM1OThLcUxYb080ckNm?=
 =?utf-8?B?aEcyZThwL3h3d1ZISVdYdytoVnhYazNpRzFISmpJVXNTdXZNNmFXNllsb2tx?=
 =?utf-8?B?NE1tN3pRdXlZM1A4ZDNNOTVJKzFQYjJ2T2xrTWptd0ZuQTBWdUVkK0RrQzhS?=
 =?utf-8?B?RVlxdldvMnAwcndDZkZKS0lFd2lzU0JYOHIvS3VVcmVPbDRSUk1MK3djSmtp?=
 =?utf-8?B?R09OdzMyNjlJTDRTSk5KU3lTVVNDaUF3K2trcE1yM2RkaDY4WFF2NVhwdVdy?=
 =?utf-8?B?OG8raHVCYVZUS2ZpQzgxR3QrQWJVdEZkMHJ6VEdhbUh0VEswT0laVHJrWXBp?=
 =?utf-8?B?MVJzTW1JclhYQ2R6SUMzMGpib3dqajd3cEdJeEw3UVdKMys2S3RwS3ZlTThy?=
 =?utf-8?B?RFpON2tJV3NYUGxWbXVIUVQ3dDArRXpnbFBJamVBMDA1UC9NcVU5M2IrUFZH?=
 =?utf-8?B?ZHM2ZjVqeG1uaFQ4MWVHdStXZk1BNE9jei8vbFVNWEpTVEw4SWpXalBrcE1Y?=
 =?utf-8?B?OHhsWDVMN2FpOFZzd3I1NWhXWklNVnlEcXYrZFBhRUtrSURDcVlTbmFBRUZS?=
 =?utf-8?B?c3FZQjJFZHFzakVrTmkvU0NVV3I3S0hVUEgzNmQzSG5LVFhZMTdLVlNON3ND?=
 =?utf-8?B?WHZySkFzQnRJQnNGN0taRUF0a1R0b1pBcG9RTVppdU12S2gzZXZlaWFlcG5V?=
 =?utf-8?B?VkEvWnhNRGFpbkdpRUhuSUh2YkRKVytzZ0hOcTNjT1VVWWxycGZCUlc2aDJE?=
 =?utf-8?B?aHJVS3lWbGxYSUFOQmdOT0NUUFpQZzQrRElsQSt4SUxxRDdtN2tjVGxJL2pX?=
 =?utf-8?B?bFhnUVNuMS83VzhaVFEvSGZpVlhZV2N0M0RrT2xEK08xU2x1VldvekR4Z1M0?=
 =?utf-8?B?QUI2K3BpMy82clN3bHhuRUk1alk4VzR3RVUvSEpGQXNJeWZsVmc5VnAyK3Mw?=
 =?utf-8?B?djhRczIwcllna2tBeGlpMWxuK2JJSFZKeE5CRzJGUDl6REhUcDltVGxGVzQy?=
 =?utf-8?B?NGpwaGs3emRXRG1qOE5KdGZsTUZEdFFaZGxkVTZzQnNDb2lwZDBJREZqSXlD?=
 =?utf-8?B?MlowaXRZZDVHSTAwUGFwa1BudUxRTkxwSFI5U3Y5QlNzNk9NQlNXQzFybmI1?=
 =?utf-8?B?OUl4d3JrZ09jb05tMG83ckZ1QjVrUjZTZ3Y4bWYyTHlVSmJhOTNkTU4yQ0Jl?=
 =?utf-8?B?RXZMd3Y2NVFCM3hGeDZIOVNxbW5xMlB6T1ZVcjg4eU9vOGdMSmtJdVkvZFRp?=
 =?utf-8?B?N1NvR0haQ2NUUFljYlpOZlBscTdiSFhoOEcveDh2K3JUMDdHOFdwN21wRys3?=
 =?utf-8?B?VEFHMkszYmpuc2M2b3hrL3FkZWhFQ3V2TEFyWjdmTnQ1SXl0cVIyT1JXR0h1?=
 =?utf-8?B?VTNRVk02WGNYcWFyeFoyQmlwUkxFS2tPMWtaNldRK21mUEFGSVMzcFdYVHdn?=
 =?utf-8?Q?wNS+jfSamSg=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10202.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7914F6CE13846A49870CA352239F9AD1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6661
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f99bfbd0-6cd6-4af8-a7ad-08ddf9f59fbf
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|35042699022|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QStETThtb01ueWNtMmo3YmJscHUzZWxrbWVGWE00N2RYS3RZRjdFQjZZMndr?=
 =?utf-8?B?TnBNUmUvOXQxby9PTUxhM2xQSUpRQmpLN2F6WmNwS29rYTRoY1BvL0Z4SXk2?=
 =?utf-8?B?cFVvcG9RaWY1VElFVzJKUEpRVGtJbm9sZjR5U3Z3MzdtZlYyNmJ6bVU5VzJM?=
 =?utf-8?B?M0VUY0hEVFltOWQ1OWxQcHNWVWxpV2I1UngrRnppd3ZPR2w2aDJ0bU1peUtX?=
 =?utf-8?B?eDcxS055S3NHTjJ5Tmx4RlJOaHVSQXhmQUlPeFg5OExLQUhja1R2MFdJajR3?=
 =?utf-8?B?eVBiQ3N3Rkp5WUs3ZThWVHhNbzc3SWJNVWFTUXEyR1RZVCtEblJGVEsvaGty?=
 =?utf-8?B?MWFDSGxaWkVwNGtVM05zdU9nMG1CZVBob2VJeVF2bnFKVUVIMldhcDFXV0hw?=
 =?utf-8?B?UmE5cVQ4K3FvcVdxNWcwRG1UT2VKdjh4bjFuZUgyakIybk80c0tEcjhUZDhX?=
 =?utf-8?B?UC8xQk9ZaStiVjZLcVB2K1FBbVNkVE1FNWdDc29leG9ST3l3c2tWVEdWa3N5?=
 =?utf-8?B?bExvbE1uQTJOOXhScVFkNjB5VWVFU1hobERkc2VuOEM0eVpVU2svd0xjbUxx?=
 =?utf-8?B?citRWkkxa3cxdUpKN2JKSkdiVDcxWndhblBlZC9kMWxhMmw0ajNIWmkvSFB1?=
 =?utf-8?B?eFVNVGdnMVkxalFhTnR3MlRVWnRyNHlnLytubUE4ekp4SFM0eWhJbHgwYlpM?=
 =?utf-8?B?RmprZG1zUjZaODlnbnAxeXFwK0lsTkNDTGpNUTBhK1dpZndPU294Y1p3QW8y?=
 =?utf-8?B?WFd2M09KQnZCbGhNbS9rU3hMeHVLOTVTUlpwU2Q3dnRpNVVTL0IyYUJQc2FM?=
 =?utf-8?B?ODdJZ0E1dkNvZmNmdW9MN2x5TlRCM28xd0pMWDFvWnNXZ3FveUtYZFFxWjFR?=
 =?utf-8?B?cW80YmIrTGhrQTVSdUpvNGZiR09KdUo0ZGcwTGxNNXVWRXQ3cER0dk8wTEl1?=
 =?utf-8?B?RXBBVVVJYzFNNmlrSkFLUWtCWUZ4TDMxQjZ3MlFWUVJIVTI3M0VNVFZONXhM?=
 =?utf-8?B?VlY4OGxvb1dPdUpjQ014Vms4M3NmcVZUeEZ6b0VabVB0cDdvOU1oMlBPaWdH?=
 =?utf-8?B?NTUwNlBORE9SVXJvVHowVkMxd2s1Wlk2dm9NcEdWMDlxNjFRNTFLaGRZdHcy?=
 =?utf-8?B?dGQwWXBRRlJuZ1lra0h6WnJCZ2FmenBjVmVYWm5zRVFKdGFzV2lVbkF1UUcr?=
 =?utf-8?B?bW5DS0RPVW9NZC9HUUJCaXg1Y2VMSXZudEtVamFzd213T1JkTnEwc0dLTWFa?=
 =?utf-8?B?TG5wZGxzc1R5OUJxSFJlRXNIcmwvN0JBenVRYVpJckwwSG9QcHVXZzM0QXRF?=
 =?utf-8?B?ZlF6ZnRmTlpzUEpJdlIyY1U3TS9zODFMUXNkbVdhVitsaW9QR09vOEk3WTR6?=
 =?utf-8?B?Z3hQWmlyRzBicUVXUHpJRDI4ei9IeDlVcW90SFFXNVFWaFhyTFAwcnoxTHNO?=
 =?utf-8?B?MG9aNFJuVjMzVmRGaHo0NXhOS3hjbFpydHdSWWt5SjlIcUJDcThrS0tyM0th?=
 =?utf-8?B?TnQwOEZoVHBiendsaHFZRmJwWkxCQzRPRDFOc29SN2p1NUlmZStuWmZqVW9Q?=
 =?utf-8?B?Vk53ZjhPTXJQTElSVWFLYi92dTdFSlErU1hiVDVRTEF4OXJZQ0ZWUU9vZGVB?=
 =?utf-8?B?U2dHMjQ2NUlkaXYyRjlwUjBqRXZRMjM2UkI0NUo2aUlycHNQN092YUNvT042?=
 =?utf-8?B?NnJJVk9rbmt4ejZJam1jUWE1eS9nN0gvcEZDeXNvMnowZTcrb2lKcGRIQlRk?=
 =?utf-8?B?ZVc4ZElUQnljc0prSnRVRjdFSUVxR241bk5lK25kbTNQVGoyVEJXNUs5VS9r?=
 =?utf-8?B?dEMzT3c1R3pLYmgxb2dMWTBuZFpKaDNPSFNseWVVdFFiVSt2cUp0U3NpZ29S?=
 =?utf-8?B?czA1Rmhwc2FORWg3ZU8yc0xITG1BK2J5Q3NtaWE5MUtSZ3k5Z2FDdERqN3FE?=
 =?utf-8?B?aWVsVDNnbFlEeEhyNU1vb2loZXpaZWZDVVRsM3MxSHJrQlpFRGhQWWdmTGNv?=
 =?utf-8?B?OE1FclA4V2dRPT0=?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(35042699022)(376014)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 16:33:03.2031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b9b089-d004-47ab-7dd0-08ddf9f5b3aa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_093315_851265_4E6CA6B4 
X-CRM114-Status: GOOD (  17.71  )
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

T24gTW9uLCAyMDI1LTA5LTIyIGF0IDE2OjI2ICswMjAwLCBMb3JlbnpvIFBpZXJhbGlzaSB3cm90
ZToNCj4gSW4gc29tZSBsZWdhY3kgcGxhdGZvcm1zIHRoZSBNU0kgY29udHJvbGxlciBmb3IgYSBQ
Q0kgaG9zdCBicmlkZ2UgaXMNCj4gaWRlbnRpZmllZCBieSBhbiBtc2ktcGFyZW50IHByb3BlcnR5
IHdob3NlIHBoYW5kbGUgcG9pbnRzIGF0IGFuIE1TSQ0KPiBjb250cm9sbGVyIG5vZGUgd2l0aCBu
byAjbXNpLWNlbGxzIHByb3BlcnR5LCB0aGF0IGltcGxpY2l0bHkNCj4gbWVhbnMgI21zaS1jZWxs
cyA9PSAwLg0KPiANCj4gRm9yIHN1Y2ggcGxhdGZvcm1zLCBtYXBwaW5nIGEgZGV2aWNlIElEIGFu
ZCByZXRyaWV2aW5nIHRoZSBNU0kNCj4gY29udHJvbGxlcg0KPiBub2RlIGJlY29tZXMgc2ltcGx5
IGEgbWF0dGVyIG9mIGNoZWNraW5nIHdoZXRoZXIgaW4gdGhlIGRldmljZQ0KPiBoaWVyYXJjaHkN
Cj4gdGhlcmUgaXMgYW4gbXNpLXBhcmVudCBwcm9wZXJ0eSBwb2ludGluZyBhdCBhbiBNU0kgY29u
dHJvbGxlciBub2RlDQo+IHdpdGgNCj4gc3VjaCBjaGFyYWN0ZXJpc3RpY3MuDQo+IA0KPiBBZGQg
YSBoZWxwZXIgZnVuY3Rpb24gdG8gaXRzX3Y1X3BjaV9tc2lfcHJlcGFyZSgpIHRvIGNoZWNrIHRo
ZSBtc2ktDQo+IHBhcmVudA0KPiBwcm9wZXJ0eSBpbiBhZGRpdGlvbiB0byBtc2ktbWFwIGFuZCBy
ZXRyaWV2ZSB0aGUgTVNJIGNvbnRyb2xsZXIgbm9kZQ0KPiAod2l0aA0KPiBhIDE6MSBJRCBkZXZp
Y2VJRC1JTjwtPmRldmljZUlELU9VVCBtYXBwaW5nKSB0byBwcm92aWRlIHN1cHBvcnQgZm9yDQo+
IGRldmljZUlEIG1hcHBpbmcgYW5kIE1TSSBjb250cm9sbGVyIG5vZGUgcmV0cmlldmFsIGZvciBz
dWNoDQo+IHBsYXRmb3Jtcy4NCj4gDQo+IEZpeGVzOiA1N2Q3MjE5NmRmYzggKCJpcnFjaGlwL2dp
Yy12NTogQWRkIEdJQ3Y1IElUUyBzdXBwb3J0IikNCj4gU2lnbmVkLW9mZi1ieTogTG9yZW56byBQ
aWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4NCj4gQ2M6IFNhc2NoYSBCaXNjaG9mZiA8
c2FzY2hhLmJpc2Nob2ZmQGFybS5jb20+DQo+IENjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4NCj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+DQo+IENjOiBN
YXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPg0KPiAtLS0NCj4gRm9sbG93LXVwIHRvIFsxXSBp
biB0aGF0IGl0IGlzIGEgZml4IGFuZCB0b28gcmlza3kgdG8gZml4IGdlbmVyaWMgT0YNCj4gY29k
ZSBhdA0KPiB0aGlzIHN0YWdlIG9mIGRldmVsb3BtZW50IHNpbmNlIGl0IG1pZ2h0IGFmZmVjdCBv
dGhlciBwbGF0Zm9ybXMuDQo+IA0KPiBBcHBseSBhIGZpeCB0byBHSUMgSVRTIHY1IE1TSSBwYXJl
bnQgY29kZSAtIGZvbGxvdy11cCB3aWxsIGNsZWFuIHVwDQo+IHRoZSBtc2ktcGFyZW50IHBhcnNp
bmcgaW4gdGhlIGtlcm5lbCB0cmVlLg0KPiANCj4gWzFdDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyNTA5MTYwOTE4NTguMjU3ODY4LTEtbHBpZXJhbGlzaUBrZXJuZWwub3JnLw0K
PiANCj4gwqBkcml2ZXJzL2lycWNoaXAvaXJxLWdpYy1pdHMtbXNpLXBhcmVudC5jIHwgMzQNCj4g
KysrKysrKysrKysrKysrKysrKysrKy0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pcnFjaGlw
L2lycS1naWMtaXRzLW1zaS1wYXJlbnQuYw0KPiBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLWl0
cy1tc2ktcGFyZW50LmMNCj4gaW5kZXggZWIxNDczZjE0NDhhLi4xOThmYjRlOWEyMmQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLWl0cy1tc2ktcGFyZW50LmMNCj4gKysr
IGIvZHJpdmVycy9pcnFjaGlwL2lycS1naWMtaXRzLW1zaS1wYXJlbnQuYw0KPiBAQCAtMTAxLDYg
KzEwMSwzMyBAQCBzdGF0aWMgaW50IGl0c19wY2lfbXNpX3ByZXBhcmUoc3RydWN0IGlycV9kb21h
aW4NCj4gKmRvbWFpbiwgc3RydWN0IGRldmljZSAqZGV2LA0KPiDCoAlyZXR1cm4gbXNpX2luZm8t
Pm9wcy0+bXNpX3ByZXBhcmUoZG9tYWluLT5wYXJlbnQsIGRldiwgbnZlYywNCj4gaW5mbyk7DQo+
IMKgfQ0KPiDCoA0KPiArc3RhdGljIGludCBpdHNfdjVfZ2V0X21zaV9wYXJlbnQoc3RydWN0IGRl
dmljZSAqZGV2LCBzdHJ1Y3QNCj4gZGV2aWNlX25vZGUgKiptc2lfbnApDQo+ICt7DQo+ICsJc3Ry
dWN0IG9mX3BoYW5kbGVfYXJncyBvdXRfbXNpOw0KPiArCXN0cnVjdCBkZXZpY2UgKnBhcmVudF9k
ZXY7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCS8qDQo+ICsJICogV2FsayB1cCB0aGUgZGV2aWNl
IHBhcmVudCBsaW5rcyBsb29raW5nIGZvciBvbmUgd2l0aCBhDQo+ICsJICrCoCAibXNpLXBhcmVu
dCIgcHJvcGVydHkuDQo+ICsJICovDQo+ICsJZm9yIChwYXJlbnRfZGV2ID0gZGV2OyBwYXJlbnRf
ZGV2OyBwYXJlbnRfZGV2ID0gcGFyZW50X2Rldi0NCj4gPnBhcmVudCkgew0KPiArCQlyZXQgPQ0K
PiBvZl9wYXJzZV9waGFuZGxlX3dpdGhfb3B0aW9uYWxfYXJncyhwYXJlbnRfZGV2LT5vZl9ub2Rl
LCAibXNpLQ0KPiBwYXJlbnQiLA0KPiArCQkJCQkJCcKgICIjbXNpLQ0KPiBjZWxscyIsDQo+ICsJ
CQkJCQkJwqAgMCwNCj4gJm91dF9tc2kpOw0KPiArCQlpZiAoIXJldCkgew0KPiArCQkJaWYgKCFv
dXRfbXNpLmFyZ3NfY291bnQpIHsNCj4gKwkJCQkvKiBSZXR1cm4gd2l0aCBhIG5vZGUgcmVmZXJl
bmNlIGhlbGQNCj4gKi8NCj4gKwkJCQkqbXNpX25wID0gb3V0X21zaS5ucDsNCj4gKwkJCQlyZXR1
cm4gMDsNCj4gKwkJCX0NCj4gKwkJCW9mX25vZGVfcHV0KG91dF9tc2kubnApOw0KPiArCQl9DQo+
ICsJfQ0KPiArDQo+ICsJcmV0dXJuIC1FTk9ERVY7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgaW50
IGl0c192NV9wY2lfbXNpX3ByZXBhcmUoc3RydWN0IGlycV9kb21haW4gKmRvbWFpbiwgc3RydWN0
DQo+IGRldmljZSAqZGV2LA0KPiDCoAkJCQnCoCBpbnQgbnZlYywgbXNpX2FsbG9jX2luZm9fdCAq
aW5mbykNCj4gwqB7DQo+IEBAIC0xMTcsOCArMTQ0LDExIEBAIHN0YXRpYyBpbnQgaXRzX3Y1X3Bj
aV9tc2lfcHJlcGFyZShzdHJ1Y3QNCj4gaXJxX2RvbWFpbiAqZG9tYWluLCBzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQo+IMKgCXBkZXYgPSB0b19wY2lfZGV2KGRldik7DQo+IMKgDQo+IMKgCXJpZCA9IHBj
aV9tc2lfbWFwX3JpZF9jdGxyX25vZGUocGRldiwgJm1zaV9ub2RlKTsNCj4gLQlpZiAoIW1zaV9u
b2RlKQ0KPiAtCQlyZXR1cm4gLUVOT0RFVjsNCj4gKwlpZiAoIW1zaV9ub2RlKSB7DQo+ICsJCXJl
dCA9IGl0c192NV9nZXRfbXNpX3BhcmVudCgmcGRldi0+ZGV2LCAmbXNpX25vZGUpOw0KPiArCQlp
ZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKwl9DQo+IMKgDQo+IMKgCXJldCA9IGl0c190
cmFuc2xhdGVfZnJhbWVfYWRkcmVzcyhtc2lfbm9kZSwgJnBhKTsNCj4gwqAJaWYgKHJldCkNCg0K
VGVzdGVkLWJ5OiBTYXNjaGEgQmlzY2hvZmYgPHNhc2NoYS5iaXNjaG9mZkBhcm0uY29tPg0KDQpU
aGFua3MsDQpTYXNjaGENCg==

