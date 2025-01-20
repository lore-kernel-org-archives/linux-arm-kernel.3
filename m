Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5639EC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIqNSLe4e4fcXyOeXF4no+Yvw8RI4XFtJcJmB8YslyE=; b=2Re1HT6D080AW6s5DxMbElrGYj
	4hc86OhgRYE+51SIQdw0cvw8QL9iq8B1nJjFkryb04+4Z1EH+oNpvJP0J9Qg/SuGYbyXlx/ixkEYX
	SptYbZJ5iXgDTm33p7qF8BmKwLLPfOnSPApTPsPNigSu4pWV6+Q5+pQAzKxBd1iAnhHx52TPOLf/5
	a6t+Px/XaioVIJrR7pZum011hFlD84jGpiPu2kYGYAXdxBGFucnCowJ4eijeLE/57TPt87AXk+LyD
	bTKogkYT+Yu1GTtwfGwr9gkaFDtYwozuuucrVf7xjeEs57kONJ350kxQdtDh4diwOvPNFP92UYLLH
	daQJDzzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnn0-000000056vD-1Khl;
	Mon, 20 Jan 2025 09:09:46 +0000
Received: from mail-db5eur02on2070a.outbound.protection.outlook.com ([2a01:111:f403:2608::70a] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZnjz-000000056OM-2A3E;
	Mon, 20 Jan 2025 09:06:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kI6WU16iBdKc4rGJO8gsNigK2+UZFr1BOOx1ADGPn9C4qhZ+oSWPJJCOSziyQr0Y547K+K/Bn8dESV8wkM9NJZ+EmDkfPXhSEYH0hqhd2HX6MjX9kfJlEf5hRQXA47xGxuozWKHFu7qxn1oLh9jbmcoRYhZ1pY6nWzT9JsYYtPzyhGxMeGuDmwnBH1Cn0Kz4odWAGGXHY/NzoZyq+a+Gp6cIMDspNFvBpjNqpSK2PpjkI47plaTPIfnbxziwio7VOF6L2OXyJxfePZFgjQWajvWibhjTKrUgKUgCLCp+KyCdGY67JoX2Bp2wTw2WW4ilWfHyt8e/+Wl/4ioKDIdVKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIqNSLe4e4fcXyOeXF4no+Yvw8RI4XFtJcJmB8YslyE=;
 b=xMkyVU3/v/cUH/eGNNi+8OHQ5sXndq+edq3Nu8UDMPNSiVSWGBSIZCP1Oi/fx5oSSp+DkjmpkNLOtWAr5+OglM+EwDv6F4+Fnb7vJH7515IUcWzQoftlq8qM5Z7vq+PjWUB25tSHsotq2QNNnjmY5w4aMxOWT38gHhVURuhUg3lU8FtrLzMEDIGyeBOjFnY1o6WbcSFrkGQvK+iuBDB+Cd4kl1MzbKNzpbrMu0BZuiNveLJQrErWyun7TVb+yKQc9fb5vuMrL80PNCvNiLuirP2KJkhGlMElcNMnZ1ZpDIy23CJk6lfIGzxivwvAxOPhVdcNyv8bb66DU+mMJrd6bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIqNSLe4e4fcXyOeXF4no+Yvw8RI4XFtJcJmB8YslyE=;
 b=v1cXk6ZShBpzU+ZS83SK9oMaR7Fz7tgE9EiOmJ7DfYHNCZNlFK84BB8U6xlaCRsbiCmuSWKjkYZa7r+vjrSx5IVsTAkECltG1ySM7KGbtfQ8rIQ3SNmp7DpFQe/EKjYYAyRoKiFvcC6zwcmkQb325EdUT1b/miXXrMUgrmbGAVY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB6614.eurprd08.prod.outlook.com (2603:10a6:20b:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:06:30 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:06:29 +0000
Message-ID: <49bfb4c5-12b5-447b-b08a-af0bb9fc304b@wolfvision.net>
Date: Mon, 20 Jan 2025 10:06:22 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: rockchip: minimal support for Pre-ICT
 tester adapter for RK3588 Jaguar + add overlay tests
To: Quentin Schulz <foss+kernel@0leil.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jagan Teki <jagan@edgeble.ai>, Niklas Cassel <cassel@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20250116-pre-ict-jaguar-v2-0-157d319004fc@cherry.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0170.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::27) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 67e04a0a-ccee-4711-a30e-08dd3931b9d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0d1OXhNdmpSTEtROCtya05xQk5KNVFjUmhreHF6L1lVM0FzMWpLZVFGajlx?=
 =?utf-8?B?MllNai9DaHFkanZ2akwrRU8vWTI3VDFIZmxqK0hBU2VmenVHaEp4QmFpWHJY?=
 =?utf-8?B?ckRvbTRnVWhlcUh5NFVkSVpYUjNhT2FHMjNVcHBoaFRocHBkdVRuc0lwTVBX?=
 =?utf-8?B?bFFmbGgrVkJheUpMMnJPNWVWaDdLWDBjOFB2NDVURzNOUmFzd0VuY0M1TXVD?=
 =?utf-8?B?QzkySWJyWjNSVHIxQXlJWm9nTzZiVG85MWtEQ2pyUmRlVDdPSVZmQkEzZ3d3?=
 =?utf-8?B?dGJCbmdWZW00YkYrQ1VQOStyYmxER1hPc2xBRU5JWis2d2RFaWtubTRuRWpW?=
 =?utf-8?B?NWcrYWtxdERSeDhUcFhia0hjbEc3dGdpZEd6V2EwbVFpK000RFJJMXNuUGZK?=
 =?utf-8?B?c3BqZG1oSVNySTdqU2tHbDFlUHFKT2lydHFpRnZ5alY3WE5uZUVZMVg4RFJH?=
 =?utf-8?B?TDliTlM0aEFXVWhQL2NJUG0rS29iZ0JOZjVCc3BnM0xBOGFVZWF2dGxIUkIz?=
 =?utf-8?B?SWxFbXdzT0Z5blVrazhRS3RPK0F1RWtqeUZFYWJVOCswTkF6YmdoOHlzNG1D?=
 =?utf-8?B?M21nbkFhWWVhWlNPTmMzZjI5REQ0YzYzQzdEOGoxL0xoU1BGNUE1SStldGNz?=
 =?utf-8?B?eDNZY0wyQTdad3p4clhMSXFPdmZGdmJLQnVoanhhVlNMMXZQYlhtNW5JUGpw?=
 =?utf-8?B?c3p4SzJtNXQ4dk9iZ1ZLQVN1T2x5c0FwUThTdk1HYU5KZUxSRCswVCtBZkV6?=
 =?utf-8?B?T3RHbVZxNGQ1WjRwdExYK2N0VmVmUkRwcytFL3g1WlViS2d5KzFiY0l0bHVI?=
 =?utf-8?B?NkZuejAzbTkwNmo2L1hKbEVoV1NXZFZJcXU4bUFOb0NyV3pGeStISUNUSitj?=
 =?utf-8?B?OUErdXQ0N0t6dXRmbEExMlQ1NkRKM3J3ZVBQNGQ4dWpqbHFrUXlyT1lVTGtD?=
 =?utf-8?B?c2h3M3NaS3A4NUo4cG1HZnJZRXdQaHNLNjJEWmFsNDdwbTJaeVVzL3p1eFJz?=
 =?utf-8?B?UzBhS2VidTJLZHNncWNMbFhCQ1VnaVEraEgyQXkxUVlDbExSK25lUzF3SHhZ?=
 =?utf-8?B?cFhBRmgrR0NzNWZVc05ZUktuZ1RXYTZ0eHV3UGU2NGRPRXMxYmpXYjdwNjFZ?=
 =?utf-8?B?TDZab0pvZ005S2ZKK2MzOE8zUXJqYnpXTnhVTFU1WVZEZjFpdk1EKzlKUXo3?=
 =?utf-8?B?NjE4SjFHWWpMWGxubFRmUUpLblpkWk1ndmc1VWVwcFRQVFlzS0dyTmJwcjdI?=
 =?utf-8?B?em5EUUNVbVhVT2ZMajZhbS9NclFIMXJDZEI2ZlQxSXVCUDZFOXozTzdXOERu?=
 =?utf-8?B?Ykxna29BWWx4SVZ5WHlFUUpCNXZJa1NVclZuY3VUSEg1MTFFdzVuR2twWVpz?=
 =?utf-8?B?ZVdocmNpMFl2YlM0TW5pUmRlZm9INEcwT2FOWGdodGo4VVJiN2FtMW1RQnBM?=
 =?utf-8?B?dlVTZHdtcG9XenF6Q1JJd3h3NVN3OUd6TkF5UHBvViszY29QU0Zsa0xzbmFj?=
 =?utf-8?B?MzlVV2FoS3JGMXRtNWd3OHJybDJlbExWVVBLL1ZXTkVCK1RXOEswT09VUy8v?=
 =?utf-8?B?eGVSWVBkdkNxOXp1eWs3VitRaWxsaklaZGpDMkN6aDJkdFpWaFp4Z0Yxai9l?=
 =?utf-8?B?U0Q0TTBEMlhLaHBzN1pROUpsb0UzVmhjQzI0MWMwRXJtZktadEN2Mjdzak9l?=
 =?utf-8?B?dXJGUGFGcldCaGVqdW0ya0grSXd6ajYza2o4cFVBVE5UREdQcm43RzJXNFhW?=
 =?utf-8?B?NGduUGlQYWJ5dFNBVk01ditPWkV1Y3ZBVXkrbUxoSXNPUU81MW93b2NueGlG?=
 =?utf-8?B?Wit6MW1kWlU5RElYa0hXeGFUcjgvTXFuL2Q3Zk5IVFVkdWM1SWdVT2hwcWFX?=
 =?utf-8?Q?V3HP+k77aEGwe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anY2MXBYY1NVaTc4bEl4SXhFcFhUN2s5NnBHNVBEMWFPZy9PVnl5N1RFQmcy?=
 =?utf-8?B?dTJxV2hVQjNxSlBBaWFPbDc1aTU2dll6U0lpYlhXcjZzYytQZ3k4VGp4WnQ2?=
 =?utf-8?B?RWlBVkhHZFlobkpzeUNZMFI2UEgrQ3RHZ2NGMWQxUkNENXRCbFVVTUNmc2JD?=
 =?utf-8?B?WTVTeEk5WmprZFpYS3M3enowOVF0b2EvcjVsOCtIY2UxT2x2UHZOV0NGVTVE?=
 =?utf-8?B?YjV0bXk3NlU4M1ZDZGZ2a0szTWJpSExiN3cxd0NrZEtNYVB5RUd5ZCtrOWds?=
 =?utf-8?B?NzFnUG5NalhsSGFDUWp0YmVqZ0hCRnJHMFhheFRLQkhiMUJGcmplZUVxdlc5?=
 =?utf-8?B?TUhEcWlaOWpLeW5qSXdzeW84cXJ0K1BzMkNjeWpiMHo4VFFIeFJRTE5MVlJL?=
 =?utf-8?B?TlYrRm9kRUk3ZmpKNURNd09pd2tESGlUblNyRThsa2lVTDFlN3BDMHhUcngx?=
 =?utf-8?B?VklaSHRZdEJtTU81eDRQOCt5VmVYT25WSlIrY21oVDRITm1tMC9iZ1QwT0E1?=
 =?utf-8?B?Y2JjbWRKUUp6b0pMUXV3aFZLR0pHem8zd00xcnpWemFiaHRIMnYxd01kT1VQ?=
 =?utf-8?B?YmF5ZElpQmNac2o5bCtmM1FiVnlpUE5ELzNqNWFwa01vaVdia0crUXVwV1FE?=
 =?utf-8?B?akRpSk1vcSt5SU03U0NLbGtaNkNkVWh5RXpFVkIvdFdta0oxWFllVkpleHZX?=
 =?utf-8?B?bGV6VW85dldQSjA2U1lvOWtWUkptUlRkNXQydTdOajRvcDdYYU10U0dmQVJI?=
 =?utf-8?B?MjYyRWVvbm1aN0xGbDN0WXBMR3E2UjRWWm9qaHZNK0RTUm8veHpjb0JnZkVL?=
 =?utf-8?B?Z25sNnFuYVdQRDJsdTN5NHhjOWhQcExnUDhZa3dIS2MzeHFvbE5uQUYrRkhE?=
 =?utf-8?B?bTNPZkhkL1U0VUVrVnVoUXM1UTV6SkdweFRSSjd2bEdVaGgrby9GMi9NYUdY?=
 =?utf-8?B?OXlFZkVPTGpRcjU4bmliQ3NRSWhrbk9qaWFEMUtEdHNtR0tzTWdocnpxZXk0?=
 =?utf-8?B?c29BUzdLZTJkVFAzZ20vTWdZNGZCRHZDSFpaZmhzNHVGYlNZb2hoTSt3aUNq?=
 =?utf-8?B?eXc1RnBpaWhrMEIwZ0V6RitJUXdZWGNUNXp3QW5HNTUvaEJYVXc2WkZ0YVdl?=
 =?utf-8?B?OFNTOE56TFR4RUtOK2I4VlJOeGRxVDZvQXFMcVUxT3R4R1pXbnJOMmM1ZUho?=
 =?utf-8?B?UkVSY3hUSnprZHU5TUJrTXFza1RpMkJGb0lXb3dtWHVRQ3RCQmsrd0UyVGM1?=
 =?utf-8?B?b3U5cjE5OGtzeTBFSmFpTzkrNzlNZTUzYnF2QnpBU002ajFhZi8wZUZzcVc4?=
 =?utf-8?B?ZW9Oc0crTWdLMWdFYjJKM0JVdVVIcERwcXlhTFkxaXRTd2N3ZHN6ajFScGJF?=
 =?utf-8?B?YnhyVmJhazlBUjdrVk5oSXZtS3IraXJ5YktHOTgwcDlkNmtpWXRDRTRqeThs?=
 =?utf-8?B?ZHlXOTh4cjl5eHpCTGdETHRjZkk5VTc4Wm10RXk4OTRjNEZSSEZWR1lhbmxX?=
 =?utf-8?B?SVRYMGI0WStjOGVTYzdteHFPNHdCTG0yMXpkUmVPSE00SHBRdml4QkIvY1B2?=
 =?utf-8?B?VFV6RVFKbGVjU2MrZFM0bi9zclN4Q0dNVyszekJsd1RzaS9qM0c5ZVJsTGFl?=
 =?utf-8?B?RjhBQzl2eWdHNk9TMFNDcnBZNnFpblg2Q04yNnh0dHptRE1tRndjR2RJT1c0?=
 =?utf-8?B?Ni9GRnlCMDRhQW1oQitCVmxIbzJ4Y1ZQaTZUWUE1WXJtS2xnVXRMSzNON3NJ?=
 =?utf-8?B?UklhSDJ0YWhsSzJycFZaTFdETy8xUDl6TFBmRktZV1lMVnBsTFM1Q3A3WUY1?=
 =?utf-8?B?aHlFZVpnT0IwTE5oRTE2L240Yjd5aFFZbHVXMi9RbWpWbSsvWUU1SHZMUGto?=
 =?utf-8?B?USsrUVNvNXRYaEx3NVcyemFoQ0dGN3RMeXl6OG5FdE8vcjlla1FaengvQTNi?=
 =?utf-8?B?RW5SaThxaDVsM0laWlM1Q0ZXZ0s5ZjQ0bjFXM3F0cVBFRkRIRUFKRndjTXFW?=
 =?utf-8?B?emxZWjUzd0NZWWMxamd1SUhlMkoxdHU0TStyOGNRdTFGRDhaOXRML2Z4ZGly?=
 =?utf-8?B?dXlyRU5ucFN2MlRSQlVLcnpRSXh0aWQ1UnRieFBIYVVDZ0hJbERmQmFrRFVX?=
 =?utf-8?B?Z3V1RFcyLzJBNEZ4dmJkMGRMdUsxWDBJUFprSytWdEVzZzE2QnNaSUZ3b0lT?=
 =?utf-8?B?WUE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e04a0a-ccee-4711-a30e-08dd3931b9d8
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 09:06:29.2434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up81CMwZiKJZioj4uDkZEGPBJBLqDPPM51DFz2SUeqiIpTiIuUP9Y8n1FOVSelkjd+dkggbpt+WTa35MOb/0TPB563I7pzF5VJT0n9DSpX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_010639_590792_820E240E 
X-CRM114-Status: GOOD (  26.73  )
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

Hi Quentin,

On 1/16/25 15:47, Quentin Schulz wrote:
> This adds minimal support for the Pre-ICT tester adapter for RK3588
> Jaguar.
> GPIO3A3, GPIO3A4, GPIO3B2 and GPIO3D2 to GPIO3D5 are all routed to power
> rails and can only be used as input and their bias are important to be
> able to properly detect soldering issues.
> 
> Additionally, this adds build-time overlay application tests for (some)
> Rockchip overlays to try to avoid future regressions.
> 
> Notably, the Device Trees from Wolfvision PF5 aren't migrated (but
> should) as I do not own the device and couldn't figure out from the
> introducing commit logs what the possible valid combinations are.
> +Cc Michael Riesch for awareness

Thanks for the heads up!

Just to make sure I understood correctly: By migrated you mean that the
overlay entries are moved to a separate section in the Makefile and
there are explicit combinations of base DTS and overlays for
compile-time testing purposes? If so, I don't consider the PF5 migration
as *that* urgent. I don't think you can break anything on our side. Or
am I missing something?

Maybe you can move the lines

  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-display-vz.dtbo
  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-wolfvision-pf5-io-expander.dtbo

to the overlay section as well? This should not cause any functional
changes.

> I'm wondering if we shouldn't backport patches 1 and 2 to stable? In
> which case, it would make sense to try to have the Wolfvision PF5
> overlay tests merged before the addition of the Pre-ICT tester adapter
> support for RK3588 Jaguar as that one won't be backported to stable and
> backporting the Wolfvision overlay test would incur an unnecessary
> (though not difficult) git conflict to resolve.
> 
> I also do not know what kind of tests we should have when overlay
> combinations are possible (let's say there are A, B and C overlays that
> can all be applied, should we have base + A, base + B, base + C,
> base + A + B, base + A + C, base + B + C and base + A + B + C tests?
> maybe even base + B + A, base + C + B, base A + C + B, base + B + A + C,
> base + B + C + A, base + C + B + A and base + C + A + B tests?).

I have never been good at combinatorics, but I feel this has the
potential to explode :-) My two cents: The overlays *should* be
orthogonal to each other, i.e., no dependencies between them in the
sense that overlay A creates a node that is used by overlay B and that
sort of thing. Then
 - Permutation can be ignored. (base + A + C = base + C + A)
 - Composition (base + A + B + C) may be ignored in favor of individual
   tests.
 - Individual tests may be ignored in favor of (a) composition(s) that
   cover(s) all individual tests.

But of course this is likely to vary from case to case. In our case, in
the composition

  rk3568-wolfvision-pf5-vz-2-uhd := rk3568-wolfvision-pf5.dtb \
    rk3568-wolfvision-pf5-io-expander.dtbo \
    rk3568-wolfvision-pf5-display-vz.dtbo

would do the trick.

Thanks and regards,
Michael

> 
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Changes in v2:
> - add overlay application tests for Edgeble NCM6A WiFi and Rock 5B PCIe
>   Endpoint+SNRS
> - add overlay application test for RK3588 Jaguar + Pre-ICT tester
>   adapter,
> - Link to v1: https://lore.kernel.org/r/20241206-pre-ict-jaguar-v1-1-7f660bd4b70c@cherry.de
> 
> ---
> Quentin Schulz (3):
>       arm64: dts: rockchip: add overlay test for Edgeble NCM6A
>       arm64: dts: rockchip: add overlay tests for Rock 5B PCIe overlays
>       arm64: dts: rockchip: minimal support for Pre-ICT tester adapter for RK3588 Jaguar
> 
>  arch/arm64/boot/dts/rockchip/Makefile              |  14 +-
>  .../dts/rockchip/rk3588-jaguar-pre-ict-tester.dtso | 171 +++++++++++++++++++++
>  2 files changed, 182 insertions(+), 3 deletions(-)
> ---
> base-commit: 619f0b6fad524f08d493a98d55bac9ab8895e3a6
> change-id: 20241206-pre-ict-jaguar-b90fafee8bd8
> 
> Best regards,

