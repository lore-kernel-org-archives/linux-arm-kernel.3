Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1094CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 06:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldWd7So+ANPy5fQwaV8SARfza3bDqmiGEAQMSmw6FfQ=; b=vlO1+Xmh0cHo92Ov9mm7/4DX2n
	XCB2f8FPXYMHbbRTtmnZfrLr2E/2wqnreA5Z6hfy5G01VYIHOK46K+YNvfLJ9JUMumV5ZMas2+8UM
	Cq0/VBSWcgldDvhJrxjbcykKXSicFbk1KCB7rakZhY/l23HDSbJAMAfs0dEF2iJYv+vl8eVHhh7YE
	UCEMgyMa76+LNhTUPslNS9NpdNaydfs8bmFxrllGH2qr2nyFpgpbBizn9kwLLgNWwG5tKQuc4gwOA
	Ddqkj+dwnN0JgE4OyaPKDQ7UVeoz550YA4P/H78YVvslQElVUht/6bXfGyHJhQqD9AYmB3Ru5Jqdo
	Q+Sd8mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZNu-00000004FFq-3KIs;
	Tue, 15 Jul 2025 06:43:26 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubZKX-00000004EV3-0WBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 06:39:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qn/ojCuIntuz9i3H7U4qZn96J4ZXxpkeuNUt/Ag/R8qYELcfHydq88JDPCd2uEBY+d7repTH7K3rAWMqJdWtq0/wSTOONMjj1YMHA6rxGNNsKOyuGqnLLLBrrTz7nf+vGPK+EcuuVwxM/OndpCCm+s3SNgvn6GemQzpYgbuk7R9Mik4H9/J4Pfu5+hrA31AeZJ8jgGdoPKW1F7TTTwCVT6ERdGKoN5CsjA2d+FNYqfgtvCND3TVyQDG4rpbsp7UwXUEyAsZS+JM3HXld4Olz0k25M9vZ6fmVvMCIOlswPhiuIjN9DGeRmV06N4Ai50AXFfJUtU4YWl5VRXoCWC09rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldWd7So+ANPy5fQwaV8SARfza3bDqmiGEAQMSmw6FfQ=;
 b=FG/4CqnEtFQ6EUbAAGBWDl+w4S2YjDGBfZf8dNN5lfrw8KOw5B/vrezvhv4uqFkQOikx9aYsKU0Kp3gXWviK7XwnFEzprSIYVRJxLxQvbGXe9plPxEfxyCmEjmEy2r6vvi6nI0ma4C5rmyaAGNhSIj2D8/Rq13R6pzGWk/PQ9qCwXte4cwdhuJma4FAKbIs8OZ+ZCB3PPbWAXkUToDu7RaoUh5A4qa2zOPKNdqqghUFnNE9b3Dg1HncwFyGRrrJuyarI9gTcJQMBrXT4wi6neEHcBFNKkqHAZLm1cY8RvXKXpY0gVBNIA54KDKnV4YHRWGp4w6bLlz5QmRB+tW5chA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldWd7So+ANPy5fQwaV8SARfza3bDqmiGEAQMSmw6FfQ=;
 b=FkfpgKB7ym00iACQst/HHdRmngwvGnMKcYcpgLZy84Fwks4bIJvZu1Uzz2UjLc3p6+L1akn+dUqAYnX6Gonnpe+LxW36MUPZNtTMlaFHsicvUEt6dBL4Q53esKbqn0WGA7Yz5kLGDNv+gUsGAgT0nHPSVpWEnKYrc9TJnO4G5Y6rXU7j8mJ+OEaAw/Cj41x8kpVSNHo43AkloQzG4jWi4fS2QiBKr+xjhDka6YWHM2hxY1fCXcQo40rN0WGTz1IcEfH4wlQo6gTLJG0skxc8pIKLvNuqhP0geoXzFxhWj4TCNUqrij1iMh3o1PcsnUeiCMLiRU+3QMLVHg47+wqm0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB8PR10MB3909.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:161::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 06:39:42 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 06:39:42 +0000
Message-ID: <7b2342a6-8f62-4a50-924d-c768ff8b744a@kontron.de>
Date: Tue, 15 Jul 2025 08:39:40 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] arm64: dts: imx8mm-kontron: Add Sitronix touch
 controller in DL devicetree
To: Fabio Estevam <festevam@gmail.com>, Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 Oualid Derouiche <oualid.derouiche@kontron.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20250714141852.116455-1-frieder@fris.de>
 <20250714141852.116455-5-frieder@fris.de>
 <CAOMZO5AR_6wODDES4ojA0KYmN7jcxuWgicuKBN+hy1e0EE=yiw@mail.gmail.com>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAOMZO5AR_6wODDES4ojA0KYmN7jcxuWgicuKBN+hy1e0EE=yiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::15) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB8PR10MB3909:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a77f55-913c-4471-07db-08ddc36a612b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUt0azIxR1FEWG5DWFJQYk54WUg1dTBWakVsS2dkdm5DSUVvZUwyQWo3NmVG?=
 =?utf-8?B?ZFBOd1JnOEJoLzlyejBhbXNCeTZNaEhlZ3JyL3lwQnAwZThzNWtBWFp6ajUz?=
 =?utf-8?B?MEY4ME0vMGtzSTI2K1kwdjd5OURrYitocWxhMnJnVWZKVTMvR2ova2NYWUIx?=
 =?utf-8?B?dWtVS3RmNXo1emxqaTVtTG9wOVl4UnFhYy9uZW8yN3dXWERpdi9lUGMySS9K?=
 =?utf-8?B?UjQyT05ENE52QncyTFMvQnhNeEpjWjkvczVzb3I0RnhLRDRVT0FRbGVLOTNo?=
 =?utf-8?B?R2hLVUlsWVo2c3JHSkltL1BzenpOVHphZ3I0QmNKa0hpVEdIUHMxZ2JxNFhu?=
 =?utf-8?B?aVhicWphUmxndFF3VCtOc1JUUHlhWFhWSG9sUVA3a3V3b1VDdzcreEVla1cw?=
 =?utf-8?B?bDhuVk4zbVVzZ1BkRkNNcWliYzR6alg5b3UvRWJnRTNxSjlmUkdJRE13RUtn?=
 =?utf-8?B?MlR0U2pCNWFWOExMS092OG00eEFYdWpOcG9rSTRRU3JyTUI4MzgyaEtYVTFp?=
 =?utf-8?B?R0s2c2QxRjI5NnhjNU82V2JxK0ZHSmFyNmRLZEhKRFhzY0VYTVlRSVpGU3l5?=
 =?utf-8?B?NnNtQmNVSjJUcUJST3R1WFdUbVV6a1JoZ0JqTnRSRlNoRGRQa2hPMHV1VExz?=
 =?utf-8?B?cUgxcDkvVzFQbjRveElLZVdXTG5TaGNnN2YzNFVKSjJ4UURYL2F0TlN4aVZh?=
 =?utf-8?B?bklKZkVQOFNTM3BvMTBEWG5JQ2FsYncxcnZXKzNtQ1hlOXE1TXYwWmRpeGNs?=
 =?utf-8?B?N2pnVHZEL1JrQ24yRHpwWXVxcWNENlFnRTRqWGVxRVU0S3FUQi91QjhPdUlx?=
 =?utf-8?B?TVdoU29CVFlVcHNycHZiZkcrUDZ3NVVESVZiMHdpeDVzMmdRU1RYSnVwdXdv?=
 =?utf-8?B?OHBJQzAxN05JY01ZZHlhekkyTUFkYllUQVAwbEdLcjdJekMxcktLMHI4TkRw?=
 =?utf-8?B?ck9abGJGMDViT29mVmdtdENXdGlhZExJcStBVFdlbVpiaEF5YnBpbHhsUUJz?=
 =?utf-8?B?M0VIeDlNZEhuZGhIZEMrTm43SVJqaUpZa3dMN1VWQlAzc3NFblhBdkdacnl3?=
 =?utf-8?B?VUJxY1BhMHlrbkFuTW9sZVl0WWIwTGlsR1hKb091QVdqZk15Mk9HR2d1SHdK?=
 =?utf-8?B?akwxUmhiKzJ4YWJxa1BJTkNabG9Yd0NJOWg2V256T2E5RGpvWDJ1QlM3czI2?=
 =?utf-8?B?bHQ1YnhZTXpxS09acEVPUDVqSGVzZytSUUlNMkRGdjFid3EwemhKYXVNN0x5?=
 =?utf-8?B?ZkxGamNoNnNDUHdBRWdlVXdkOTU2UWpZcGRIcFZVcmIrVnN4M0RZK1ljbG80?=
 =?utf-8?B?SUppa1NZVnpZVEtPcHhqbGhwd3F3M2plUlpVZ25mOU5VajdoWHZOU3BTYVlV?=
 =?utf-8?B?VElCNGt1aGFJdVBFK0lKclhKOEVsWHpMdURpRk1BZmN4NEFBa1FTMEZuL093?=
 =?utf-8?B?bzJWRnY4dUlvbjViWldUb0FRVnYyQTU0M3FPZCsxeGVOWkozTTBaaWtKYVpX?=
 =?utf-8?B?V214TWNUNENqTXJuelkwZ0FNdzBiQWdXb01uL0Q4ZVlZQ09ia1FPL3QyWTNK?=
 =?utf-8?B?UktEanZadkZqaTI5SzRpYWp3ckV4MFUvMEljZ3FaWDBZaGJ2aExIWExmT1lP?=
 =?utf-8?B?ZU9iYmVuUWtyVEV0T0tSSTJOaVNRc2NRVnFyS09ZdGZRUEtXTVZjbVN4WmM2?=
 =?utf-8?B?czVJM0dHeDZPdVUxUUVTOW5wOHg0Uk5FN2pKNlgwRzBMMzVkQ3B0SlA1c3dU?=
 =?utf-8?B?dFNNMVcxNTlQdFQyY2xORlF6S1hQd0x2bGtQcHk0UW5EWlpOenZXMitvaEJa?=
 =?utf-8?B?emluYjhpL3FRS2Z5dVBoU2tFdTN6aFFOQmRRakpWMDFtN0xsR055RWxIb29O?=
 =?utf-8?B?alUxT1VTUUVKV0dhMlE1TmxuQ05NWXV0eHBudTNpSTRQWG1wQkl3NVdjMTFh?=
 =?utf-8?Q?/A9XRFyNzAc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnN5Q24zRXQ3WUdwdjhBUmZ2dWJjeGlsNVU3aVdTUGQ0dVVaWkJjZlZiMEhZ?=
 =?utf-8?B?d04vcmg4L25XUHQ5eWVncXBPd3JmZ0V6NytaRHRWQjFCbUVRZ3F0b2k5R2tT?=
 =?utf-8?B?MFdpTFFmeGdzQ1BZR0toSUVMV2hOT09SODVRUmc5SGtSUUVxSE5DTWJhVm5W?=
 =?utf-8?B?NFo0anhqempEcGR0YnVZUWtUVVFuZkpVSTVwc21DeEZ1VEptdjRNYWpGcTNV?=
 =?utf-8?B?VjdLR2pFbUZ1aWhNSDlxN3BWZFM2U1daWkkzOTk3LzlRb05TM3B0MjdIdFhh?=
 =?utf-8?B?dE82VWE4bTBuL0dBbGxmaGljVWtqQS9NUHBxKzVBc3ZkRGZOUU4vNXdZRExB?=
 =?utf-8?B?RDJGVmdWS25sTTBiRHlTd1dXbnZlaE1aZVc2YXB1VGt4bm8vOEtoK3NIQmE1?=
 =?utf-8?B?MEdBZ2ROV1hRdHVBY3BCWHh1MWdFa3J0aTlNZG5GbGVjRTc4TGxsTlhUZUgy?=
 =?utf-8?B?S1ZkK3pPdncyUDhQTDlrTkMwRjExYzFtYUFuMSt3TVh2bk9mR1d4MDF3dWVy?=
 =?utf-8?B?RktiQlZ1c1hOTmdvdWlzWHlPNUJLRzlMdjQzNG02MXY4cTlpd2VsM1ZSRWlt?=
 =?utf-8?B?S3IrMGhVNzBKRUNRT3R0WnJDZGcwTTlic2d0RkcwZ29KbTRzKytwMVZkWXdv?=
 =?utf-8?B?TWNUVGEvNGRTYW5xenZBWTRFaGc2ZVpvcmRlN3o1NFl4V241eUtTQlJRK1k2?=
 =?utf-8?B?NEJqb3hpSUozSm1lSWllVnVVRUFrMUhtWEZOUllQR29MM2JMZktpajcrQkY2?=
 =?utf-8?B?N1ZkdGx3b1NlMldZZkJuamlsR3RmbnZUVWRUSExaWXFkVi9GOTM2U2FmdWFF?=
 =?utf-8?B?U0N3UjIrV2JJRDhLeXp0cUtzWTl3ZXd0ZzlVNnVCbk1FSGhwNzA5L2hEREQy?=
 =?utf-8?B?eXEvSWFDQkp0Mk1jMG1pUEJHRXZ6Z25VU0lUUlJMdDg4c1l5UnNzNGNIQm5m?=
 =?utf-8?B?SlBQT0pxT05yd1pVdEJ5VnhZMVVvVGZMb1MyTWNHQXdEeG5LeFVCdWpVWU9q?=
 =?utf-8?B?blF3UHZmRlMrV09BWU5LY3AvVEI0N2FCRjhRaGdXdjNlZzN5UWhSK0tuR0xN?=
 =?utf-8?B?RUg1bTVqMCtrVWVEUXAyWjZYYjc0ZlBTSUJpRXNPVS9oc0tNL21ybk4rSUw4?=
 =?utf-8?B?ZkZDMVBSUkZ5SHBST0JUQWI5RkQ0UXhqSmYrTTFLQk9CZU5RYUNFUXNhczZL?=
 =?utf-8?B?aDdtODE3OGU3QWlCR3FDb09ETS9IUWl3WXpwWWIvM0xUc2VMNlJOM1YrTmZE?=
 =?utf-8?B?ZTZMVWlKeGc2MU9Kc2ZrRFBCVmZpT2JMa3ZIL2R1dkM0a2VkbnVLUWZGTVZi?=
 =?utf-8?B?alplR0YzRE4yWThoblp1b2lMR3VFZlo0c0c1SkcrTmgxU3BFRlpaU200amZ3?=
 =?utf-8?B?SW14WEJXaFRPRlB1S0RwSWFXUmwxakMxT1FScjZ0M3paQk5oRDlCeXZSMjd2?=
 =?utf-8?B?RFRwZldoZE1QQnRRU0VIVFM3eVFoKzdCYTk1RHZyTDAyQmVVSGhWMm44elBN?=
 =?utf-8?B?N09PYmRucUVsc3ZOWC92Mi9wanJqQXE1akd1U0duWCttQW5PMVpuVUI1QS9i?=
 =?utf-8?B?WWpjL201enFtZlhZODVaYlJjSjdKL1R2aWoxWlBWZzhWTkhQeGx6NURPUTI3?=
 =?utf-8?B?ak1mcmt2UFBsZ2ZHSUgva3BtZlFENDgxTHFhZWhnVnNEVnpWMGJJSFpWRXRW?=
 =?utf-8?B?V3ZVd2ZidmprYW8vV25xeDlhVHVlLzFydU5GMDZPQjQyYlBRejhVT1ZqcUky?=
 =?utf-8?B?TDVWTTQyVVJFY3Bab0lqK2pHQUxpVnByazRpZTQ1Ty82UUM4RG1yUE5Icmg5?=
 =?utf-8?B?Y0JTNG5NeWhFbGh5emtOdkdoYUp4Ym5LN3hpUFpzcVozNS85RllTVXJKYXFn?=
 =?utf-8?B?V3FuQTdHTXp2OW1rMkFqWHV2S0Y2WkRCZnJ0S3FoOC9pUU15ZU1QOEdxNUQ2?=
 =?utf-8?B?SUlMbkFoY3drNENKajVjMG1UYm54eE9QM0FUdktvY05YeUVROHhncHJ5cnUx?=
 =?utf-8?B?bkg2Z2kyVHYwbVNJZnljd0VEOWxocWdiNndiZ1hyUTlPMkRKTWlBbU90V0Fl?=
 =?utf-8?B?LzYycXFYZThQam91MUMrYVA4cnpSV3EyZFh4RjFFZHRjbWxvZTgyZjZudi9X?=
 =?utf-8?B?REVHODZxZU1QdUQranRnY1ZMVnJDQTkwNE8zdW5scm93SldOTFFlL1VOdXdL?=
 =?utf-8?B?c2c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a77f55-913c-4471-07db-08ddc36a612b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 06:39:42.2652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvoqvRr/oORV7z7B7SXr8wMYw7w7J3dTypSGNJdkDh8+vaf0ch68/kSQDq0AO5DdoBSQUZvedpCdZzHicu9TDQ4fsjVFXwXvU++BiwJg1QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_233957_650873_17666A64 
X-CRM114-Status: UNSURE (   6.99  )
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

Am 14.07.25 um 18:21 schrieb Fabio Estevam:
> On Mon, Jul 14, 2025 at 11:20 AM Frieder Schrempf <frieder@fris.de> wrote:
> 
>> +
>> +       st1633@55 {
> 
> Node name should be generic: touchscreen@55

Right, will be fixed in v2.

