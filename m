Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10B4CD4F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 07:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HyMqA0xtjftnJ8NAQOQ8JXn3JMd+9Ej8sF9X2axJRho=; b=UllcYOB7sShbujA6c1DsTUVPPv
	yO9ZwgzgNrK++XDiOOaPsZIKlxajJ9x1l8l96vEGH5RUL47zvkFfz8Wun9mDVUQyBwzYPbl+cchOL
	R3LiVhXj40RAdGbkhgq2sTZCJKn5D2Mu2grgOEu+ZXgLl4QMYMsbaeQMcqlyGL5gvvb1FR9QhbHjF
	kuWOn2vsOzWxICPUSDHknnw3Z4sIGDqmqLTMeWWYYWr5QtJ5R+GlAKb0odkuFZXyojwWY/L7FhlOJ
	fQUGeU+XSSa275fZvRoMXY9abPP53iHfswi2Wv7rk2gYsHz7wdXxlFLBrZa6/CruVsFQc20tQYjVY
	crE1Mexw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJRxa-0000000A12w-0lPN;
	Thu, 13 Nov 2025 07:41:38 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJRxW-0000000A12J-2NGf;
	Thu, 13 Nov 2025 07:41:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2uAj+KdE13clk4nb3Jm4dCCpBJjoax4fznF7iwdZpa2mHaNefAye66vNbXGaAbZ0uYtnzDQdo4M2Pmo8kkG6FjbPuP8L5cgYHi1AAa99uDVKBrJOMGLANYWQRsPw+zcfTpUvXhi1NjsNgtdpXT5qB2gnsyThldaRw+UY4s2tRTS7L8kACtfgh6bIUI1Y9U2/EcrqLs3JSEDfBqKLBXUCp5Bb+6ruLgE2QK+95HMiqdlckIuOhnRQbw73OHAACAtWlDtXRDIOu6fSA5W/U2nMw8xL6H1HfP5Ov8jkq8YVAc5lCdCklQCqiDTlu3r03fy4Ztv+zJsDuZGOCy0CnqKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyMqA0xtjftnJ8NAQOQ8JXn3JMd+9Ej8sF9X2axJRho=;
 b=r+fGzPXTrc3NPHKD24oKFbG/aOGQnbwebfOWile+USpZGMcq90mTQMn4qB9xn5zqKCDDlnGtKGx/qWUkOsWrKKKAAVYIlz7fHyXYMJDEzSSjamyfAtVOYJSfXDIFc0QxBIVZPF6KqdS5ttCVZvvFtSSW4O+j7LDHC1b8HASkrc67C9IGMQcj+q+13DClJyUylFrrCAWpOpxm5it0bDtGNDVuEzi8TZ6CqnRCpZDQitCJnro9qb2HWVgQQOxaoZIMd+fbb0SXsSRm+8uanNIFt1AO8d785F+nX/6ojQlLAqNgaF2UlcwPpZrvbDBcHE9WTyeTEhc4/S+1Fn2B/LN3Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyMqA0xtjftnJ8NAQOQ8JXn3JMd+9Ej8sF9X2axJRho=;
 b=WjwT1yLdvBuAv0ljiXZe/cpqpRskPAU3mo3UtXhjgKQfI1Wpx7e8WHQAg+7bKm3VFeymw11mXuKkae7K5qY2AXGaarHqRakY7ZiA6P02hyISkYi0wicqbBSKO1zSPBwxMw9TOH1k+9gLdiobGpkQj9ha1E/z9aRyoLEM190ezD+N7+KJszSyUDfs1MB4OWcMndzrWURc8bnXGYciQmOC05tpaMcK/llUtDlFCnnSi0s+Re5T8NX9k6I/oP3mMw+ubxskqCS/0bL9hUIWsikST6/GQcQAV8Y0ih3bypY2ynWqwDLy30kBvNLr08q/4JsC0/TCPZsi1hOsoc6Do4QZ+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by JH0PR03MB7495.apcprd03.prod.outlook.com (2603:1096:990:9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 07:41:23 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 07:41:23 +0000
Message-ID: <f844390c-be5c-4dd3-b42a-416432832a54@amlogic.com>
Date: Thu, 13 Nov 2025 15:41:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] clk: meson: t7: add t7 clock peripherals
 controller driver
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20251030094345.2571222-1-jian.hu@amlogic.com>
 <20251030094345.2571222-6-jian.hu@amlogic.com>
 <1jbjlnxuug.fsf@starbuckisacylon.baylibre.com>
 <3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com>
 <1j1pmew1cu.fsf@starbuckisacylon.baylibre.com>
 <236a568d-c809-4dc7-be2f-e813d0d85368@amlogic.com>
 <1jv7jlvke8.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jv7jlvke8.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|JH0PR03MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a4a269-1a8c-4fb3-14bb-08de22880b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2dQdjRyeTF3TzkveUUvcWNhTEtraTl3TVVaQ1kyd3ZJNjFzT1Q0bXY5V2V5?=
 =?utf-8?B?TjZpTWtJUHBTL3NvbE43K3AvMG5ua1ZRMlI4aGFJSFR2ZTRRa2Fyd2FlOVZU?=
 =?utf-8?B?QjYwOFR5TEtKd1lUMUVaNGdoVTdwMjdIdzNSZHpwcjR1Nm03c1lidTg2bDRp?=
 =?utf-8?B?QUs5UWJxTjZzMHNkRjlUalluVmthWmZGSkZrQ05yVjJxMFJCVkdkR2ZnOGVI?=
 =?utf-8?B?aWsrY1VtdzNUeWZzdXlMcGt6YWNYUzJJREJWSU1jQ252bU9YK3hLM1VkTUhp?=
 =?utf-8?B?QzVXOXlLa1VxcUxWdzZkRGZONERNcTJ6WVoybWd1a1hRMGNwdnlzWk1CSzc4?=
 =?utf-8?B?d0ZDWnNTTEtBTHZhNXR3R3h5UXZadlkzNjE5U3k4R20xdThPQW90aVozTWM5?=
 =?utf-8?B?S29tdUh1OTJQVkFrdit2NkpMK013dWM4N251TW9pTm1EQ01DQnpMUXVQTkxX?=
 =?utf-8?B?R0tzbUlSTzRjem1RSnlIeTlEcGZWSjRqTG5YUld2VHdRQ1EvaXhjTHNCOVA3?=
 =?utf-8?B?TUt5YzBqTGQrc2UyMjJ0SnF1bWhlOHkya2tWdGpXVm10NmU0VmYxa1V5ZU1w?=
 =?utf-8?B?UjJaS0hPdXVVMWlzMXo1Nng3ZkNyVnBXVmV6amtUN1V2TFNuYy8wci9mYURR?=
 =?utf-8?B?K3EybWM1S0tTQU9od25iZThlSGorYkZ5VWxDUmhIZWkxUDY3NUpmNENEdStZ?=
 =?utf-8?B?WUlZMW1iMW5LVkkxMWtOM2dTcTc2Y09FUFUxNE4ydFZWam9TZDhPcXhjQ2R2?=
 =?utf-8?B?T3hyeG51RFNoT1plWG0yY0dFai9wcnkyTFZKS3BlTFA1WGtzY2FpNEdPRU52?=
 =?utf-8?B?MDd0VFI3eUFKeHR4SVNEV254SmQrcDJGTXVzWVdNV2hVY0FTbnhzenh4Mm9B?=
 =?utf-8?B?WWtoLzNvVEhsK1N4c1gzUEk5c2RpdE1WRVB5alRpU05UWkRzNDM0dGR2UEJI?=
 =?utf-8?B?bDllODNYQk1RZ3pGVEtLTVVtNE40WkRlaVowZnE0UjhyN29LSTB3eHhTcGsv?=
 =?utf-8?B?RmF6dmduRWp6NXJyVlA0dmpVcCsvOXkxTC94VW9YSkhQdkRTd0lGeWNCMFIr?=
 =?utf-8?B?RDRxOGphU0Z6V3MwRGgvYUlFZkdsd0xneTZseGw2cEQyaXlWMTBSaFkxREZB?=
 =?utf-8?B?a2E2WXlVT1BIaXBDaktpdFRTTXgzV1RVcURXNHZqd1BRZS9wZ1lldGNPdlRM?=
 =?utf-8?B?MkhvbnpGamVFdTNnT1A4K1BkNWJRZ1FFZFZVaXNRU3ZielZySVJZbjlXbmxl?=
 =?utf-8?B?UnpLQ3FJNmRBUmtTdGNneG81Q3g2cHZSbGQvSnhoMUNqVkRNTFp5Z0ZKWjBr?=
 =?utf-8?B?TERlWE9uMlBJWTl3SUJIR2Ixd3hvRzU4TjlEMk44SzZpYUw1MzRpK1BEV0Z5?=
 =?utf-8?B?aXJrTGVvbEJwR1ZFSVMwazQxOFcvUE14L2p2L253YTVyQU95Ym9qUEFYd3Zz?=
 =?utf-8?B?bVZ1MDcwemZOaXJyWFk3cFpTMVRNOFFyVnFNTndwaXpuTUZvbjJjSGhHZElh?=
 =?utf-8?B?YUJkRzNxM2dWNHhRbXRJVmQxNGZ2SVhoNElnaEs3TzU5MjRXSGZuWjdxRnhz?=
 =?utf-8?B?Z0hSTWcvZDBJQ09nSHlCZDlxaWxiKzVXNmZSVWRnZTNPTW0veElxT0c0MnBF?=
 =?utf-8?B?ZkZRYWFmZmtDN1dicXB3cnB1ZUt5NEpGUzdJNnByWC9YVDlFaVBhLzBrcmZ5?=
 =?utf-8?B?TE1IUS96Ykx3ZHNUekpzdUZwLzQ2TXBJQk5PV0lSWDZKcGhvS0IrdmljVDAz?=
 =?utf-8?B?UlFHckpidXRnd1RIOHRjdkJmcTB3Y29NM0JrK0ozNnZlVU5mOEpjci90SUdx?=
 =?utf-8?B?Z21oTUZGRE51RC9XNld0bytMZVN6cjZDMjluN3ZmTFdZNitJdXdKbllEM1RZ?=
 =?utf-8?B?K2VkdVUyUzh0ckNBLzUzMCtiYUJvNGhqN1M4bGxEdlZTR3NYSFl0NExDVHpj?=
 =?utf-8?Q?NWMNHADu4n4/TRmIsJV/fBz1tEU/AQTi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFN4WitlWng1U1lMcmlJRkZqT1h4M2pmejVpT2JJMmJWd3huRi9aVXdUcWJE?=
 =?utf-8?B?SFVvUVh3VkNPOXY4VnBrRDlNcUxFVVIraENydkVWNHpVUFBUajU2S2R6ditO?=
 =?utf-8?B?MERZU2hQckYvNy9Ec3RVL2xZZmZqdTJZN1d6YSt5aGFIaHoyUTFsVDFJeTgy?=
 =?utf-8?B?MU44Y0VtUitOcUVTNUdiUUFVVllRV05oVkc4anVLL21hNlpKZm9iY2t0WHlz?=
 =?utf-8?B?c0tyd3ZBaUVSUXlWK0tpdVd4V2FFNW9pRjFqQ3NxNFdtYi9WSUJ6bWFPeU9n?=
 =?utf-8?B?ZFEySmhEaVAwdmlTVkxGelZrbzVvNXFNciswNjJCWTFZa0RhdFFtMzlVQlFv?=
 =?utf-8?B?Sm1TelpHUndaSVVEU3g5b3FWY1R5TWR3TlVRd0NucXdIYWVaQll6V21YdWFr?=
 =?utf-8?B?YXZ3Y2dkTEZuOWZ5OFlVUUIwRnRKZFc3UHNjNkJ6WTFGY25wVU8rZVVoVXJn?=
 =?utf-8?B?T3Y1MDZkS3l6eHpraUFCVFJqeTZPc2N0Rkp3ZkYyMEtnQTdVYlZXTVM0MVpJ?=
 =?utf-8?B?VkVTUEFFM1luakFQRXFZdkw3OFFkN0dvWmRmSWZNOWlKYytlMWlUaW1yU2E4?=
 =?utf-8?B?emR1MFNVRTZQb2k2WHhtMXpJZHllRjZRdXNUc0Q3L1RBSDJMUWhDQU1rayth?=
 =?utf-8?B?SVprNmpDLzlHcnZVL2xLVWZaRG1tK0s0bUtRU2QyTm9ZOUZDaUtwWGFXOEV4?=
 =?utf-8?B?VkFNNkpac0VZSWR1YTlGcjNkTFNSalFMekJQcVlRZ1NOSm1ucCsyNGFUL3kw?=
 =?utf-8?B?UCt6Y0hWREZqTldaWmQ3N1hLTnA5cU9yRVNWM3VNVFJodEFSQVZFSEIzM2lS?=
 =?utf-8?B?UEt4R1VFV1A4ZDRKNzBZNmIxdnpnRDN5WWZQYzRZNUJyanVQUG15cVNiWlZv?=
 =?utf-8?B?VWRsQWNjVHh6bTZLblNMTFJqc1JMVlBtZU9FVGNQMnpxMFV0di9Xc09XeXht?=
 =?utf-8?B?VExCc3pONitOK2JSWEVoT28rSkZMclRGUWJmTDZ0WGtUMjkzZUVielpTN3BM?=
 =?utf-8?B?NlVXU2VTNUp2TW8zeUJST25YdFZYaDJ1RHBjbTlsTnQxUTZLVjlBVzE1R3pt?=
 =?utf-8?B?RlVTdmFJdUJrRFBlV3ptSmlyaS9XQzR0aEdaRlJlVExsOERSRk1adjZFcXVq?=
 =?utf-8?B?bGMreGdxeWd4aTlEc1BpMGFRSnhzMXN6ZUhaVG1KaEVVa29zS0U5U0xnRU1u?=
 =?utf-8?B?QjdPMC8xOFd5U1Y4QTBySXdJVWx6Zng2SkRmMXJ1Wm9MZUdpMmVPRlFuVDRw?=
 =?utf-8?B?YjBZVmlyWmxNbGNhTlRnZGhCMTdWd014RUFrUmthZlVEenl0QTM2WUt5L29l?=
 =?utf-8?B?bXFpWGw2aENMR1ZvNkJ4MFE1aTFTR3RCQStuSjdka0JkRkovbGhWWk1XTE1O?=
 =?utf-8?B?ZTkrVHc0VXRrdEJpa2xqQk1Ba1JnOTJlMDFKcjd4SGo1OGxaeC9qeVFWUnlr?=
 =?utf-8?B?SGs4Q0ZhOWZQOGlKZy9qZTZmWHllVCtweEFnVzR0UkNobFhkVlBIQnJqdjNo?=
 =?utf-8?B?SkFHTkh5UkxiMkRxQUh2LzkzMFJINExyS0RIZkxPMUdZSlFRYXVDMDkzNVBT?=
 =?utf-8?B?Q3dUWEI3WW8rNEVRMlVKUnBNOEE2Z1poR2dyOHFvRjRVYjZSclVnOFRycG10?=
 =?utf-8?B?NFVvS0E4ZHZXRWw3U1dWanV3NGh6NXZ6NjV5TGZ5UnErdjc4WDgxUXgvL2Jq?=
 =?utf-8?B?Sm1kbUZzbzloRHdvYWFQaXcwNklNemFMZmZ5dnNocVhlczhNa2JRSmd4UnFw?=
 =?utf-8?B?cC8rYUJKQkZuQldBMVhGb1NERTlkUGZVT3p1ZTFKVHJidlZrbWxXTUsxQWtp?=
 =?utf-8?B?S2dPazVoL2cyVndWUERjdTY1Yk1lZkozaHBBMW9NYWt4L09jdFFzSllkYU5C?=
 =?utf-8?B?U2pQYVA1eEw4MGlCOXpmREQxK0o0VnNwcENTd0RNMlZlOVZPM0dQRjNCWEpw?=
 =?utf-8?B?bzZ6QXJMVmc3L3pFWG1nWFRkNVNpbS9TQUxVNjR5T1p4cERrMTdoeXhLK2xR?=
 =?utf-8?B?cm1Oa0R0TWZiSWd5TXMxUHkvZFRmaGtTS2lkcnR3eWZVRURCbUlHNTBKK05q?=
 =?utf-8?B?SGNZUjZsNkpiL3BVanJTb2ZkcTBKa1NRb3JIOFlGNm02SnNsWFVINDV0ZjU4?=
 =?utf-8?B?cGNibGJJUURRSjRhV3oxZ1o5dDlOb3g2LzhyOEFCaENpNkRYZ0YyS052V1hU?=
 =?utf-8?Q?9c1EE6XgFRAGIK20Wg+fa9vl39oVvyH0um/Bh+70dlhd?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a4a269-1a8c-4fb3-14bb-08de22880b36
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 07:41:23.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8U4TaD9kFENvsZ1bzPDP1oAQ94EZ9Dpw027GloMbKY7DBq+SK9eOWdsvK1vYk9ON1dbPQx3SqhfJUcsaIyoTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_234134_811093_7F1E5023 
X-CRM114-Status: GOOD (  18.70  )
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


On 11/8/2025 1:10 AM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Sat 08 Nov 2025 at 00:20, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> On 11/4/2025 6:14 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Tue 04 Nov 2025 at 17:17, Jian Hu <jian.hu@amlogic.com> wrote:
>>>
>>>>>> +
>>>>>> +static struct clk_regmap t7_dspa = {
>>>>>> +     .data = &(struct clk_regmap_mux_data){
>>>>>> +             .offset = DSPA_CLK_CTRL0,
>>>>>> +             .mask = 0x1,
>>>>>> +             .shift = 15,
>>>>>> +     },
>>>>>> +     .hw.init = &(struct clk_init_data){
>>>>>> +             .name = "dspa",
>>>>>> +             .ops = &clk_regmap_mux_ops,
>>>>>> +             .parent_hws = (const struct clk_hw *[]) {
>>>>>> +                     &t7_dspa_a.hw,
>>>>>> +                     &t7_dspa_b.hw,
>>>>>> +             },
>>>>>> +             .num_parents = 2,
>>>>>> +             .flags = CLK_SET_RATE_PARENT,
>>>>>> +     },
>>>>>> +};
>>>>>> +
>>>>>> ......
>>>>>> +
>>>>>> +static struct clk_regmap t7_anakin_0 = {
>>>>> Nitpick: for the DSP it was a/b, here it is 0/1
>>>>> Could you pick one way or the other and stick to it ?
>>>> ok , I will use 0/1 for DSP.
>>> I think I prefer a/b if you don't mind. see below for why ...
>>
>> Mali is named as mali_0, mali_1 in this driver.   And G12A/S4/GXBB series
>> do the same.
> ... A1 use dspa_a dspa_b (etc ...)
>
>> If they are named as anakin_a and anakin_b here, there will be two naming
>> methods.
>>
> Already have that unfortunately
>
>> Shall we keep consistent ?
>>
> Please try yes


okay,  I will use 0/1 to name them.

>> If use 0/1 to name them.
>>
>> dsp clocks are:
>>
>>      dspa_0_sel
>>
>>      dspa_0_div
>>
>>      dspa_0
>>
>>      dspa_1_sel
>>
>>      dspa_1_div
>>
>>      dspa_1
>>
>>      dspb_0_sel
>>
>>      dspb_0_div
>>
>>      dspb_0
>>
>>      dspb_1_sel
>>
>>      dspb_1_div
>>
>>      dspb_1
>>
>>
>> anakin clocks are:
>>
>>      anakin_0_sel
>>
>>      anakin_0_div
>>
>>      anakin_0
>>
>>      anakin_1_sel
>>
>>      anakin_1_div
>>
>>      anakin_1
>>
>>      anakin_01_sel
>>
>>      anakin
>>
>>
>> If use a/b to name them.
>>
>> dsp clocks are:
>>
>>      dspa_a_sel
>>
>>      dspa_a_div
>>
>>      dspa_a
>>
>>      dspa_b_sel
>>
>>      dspa_b_div
>>
>>      dspa_b
>>
>>      dspb_a_sel
>>
>>      dspb_a_div
>>
>>      dspb_a
>>
>>      dspb_b_sel
>>
>>      dspb_b_div
>>
>>      dspb_b
>>
>>
>> anakin clocks are:
>>
>>      anakin_a_sel
>>
>>      anakin_a_div
>>
>>      anakin_a
>>
>>      anakin_b_sel
>>
>>      anakin_b_div
>>
>>      anakin_b
>>
>>      anakin_ab_sel
>>
>>      anakin
>>
>>
>> Which one is better?
> a/b or 0/1, we already have both
>
> Pick which ever scheme you prefer, just stick to it from now on.


okay,  0/1 are more commonly used in Amlogic clock drivers. I will use 
this approach for T7 and later SoCs.


Thanks for your reply.

>>>>>> +     .data = &(struct clk_regmap_gate_data){
>>>>>> +             .offset = ANAKIN_CLK_CTRL,
>>>>>> +             .bit_idx = 8,
>>>>>> +     },
>>>>>> +     .hw.init = &(struct clk_init_data) {
>>>>>> +             .name = "anakin_0",
>>>>>> +             .ops = &clk_regmap_gate_ops,
>>>>>> +             .parent_hws = (const struct clk_hw *[]) { &t7_anakin_0_div.hw },
>>>>>> +             .num_parents = 1,
>>>>>> +             .flags = CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
>>>>>> +     },
>>>>>> +};
>>> [...]
>>>
>>>>>> +
>>>>>> +static struct clk_regmap t7_anakin_clk = {
>>>>>> +     .data = &(struct clk_regmap_gate_data){
>>>>>> +             .offset = ANAKIN_CLK_CTRL,
>>>>>> +             .bit_idx = 30,
>>>>>> +     },
>>>>>> +     .hw.init = &(struct clk_init_data) {
>>>>>> +             .name = "anakin_clk",
>>>>> Again, not a great name, especially considering the one above.
>>>>> Is this really really how the doc refers to these 2 clocks ?
>>>> bit30 gate clock is after bit31 mux clock,  and the gate clock is the final
>>>> output clock, it is used to gate anakin clock.
>>>>
>>>> I will rename bit31 as anakin_pre, rename bit30 as anakin.
>>> Ok for the last element
>>>
>>> ... but I don't  like "_pre" for a mux selecting one the 2 glitch free
>>> path. It does not help understanding the tree.
>>>
>>> For such mux, when it is not the last element, I would suggest
>>> "_ab_sel" ... at least it is clear what it does so, "anakin_ab_sel" ?
>>>
>> ok, anakin_ab_sel and anakin for these two clocks.
>>
>>
>> Maybe anakin_01_sel and anakin for these two clocks, if you agree to 0/1
>> naming convention.
>>
>>>>>> +             .ops = &clk_regmap_gate_ops,
>>>>>> +             .parent_hws = (const struct clk_hw *[]) {
>>>>>> +                     &t7_anakin.hw
>>>>>> +             },
>>>>>> +             .num_parents = 1,
>>>>>> +             .flags = CLK_SET_RATE_PARENT
>>>>>> +     },
>>>>>> +};
>>>>>> +
> --
> Jerome

