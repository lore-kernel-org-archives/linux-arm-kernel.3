Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA164C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 03:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ec88dCuvFG82q9p8wDDd+vCbJFdZlkZED1C8U/f7qog=; b=X+ZJVS9BsS8VNrpC8EdcYH2z3A
	+mzjAoJjrfV/4WAl4oBX159ltVT9kfKXmVhu3U8oTT5Sd+J7xI1yTZkh/PQwBrHndSvqM283IlwXV
	26j1Ha0xO20dkhXs1pPX5+cX4HNiNvaRehRB6BbWtV6oUwS+9/tkIL9zTtfj7TuUikC6pUVrn4ty9
	zSnituXq/hHo4GHALr7q5xdabKvfEB9VsfFlyPlAJsgfXHWWyNI6vXmZLPCsCEVY2h7H330xEc1Y/
	WngfM5tdhB3w+CiNMLeRuMKIJpHeLcKaLhvg49OVahZIuTRuYwA7IMmpPAKO4QVhvuf7erTy09jT5
	m5FiZBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1F1B-0000000Aw0S-3Vc2;
	Tue, 01 Sep 2026 03:18:37 +0000
Received: from mail-westus2azon11012013.outbound.protection.outlook.com ([52.101.48.13] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1F18-0000000Avzr-0uhY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 03:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH4J04tu7J+6hAVVyKYzFdogC6JzVlI3wDYKwkgWIQoheDptoFPyBBT5Tf0D6izOjGqkO/C3Jz9dTOYe3rULlwZoAeV7pqqv4EYM57zqIAcPPEo3iIxQK3gYrb5vh2QFbQPiLK6o9yx0++dSDiKZddLl1+geZS8RECX1UHP7OL6Top47NEA0A2lUo/mP4bCQ8opfD6kcJS3VNiJGXyGbtL/d0OO0G4o+sBoalgAV/H/Mr1ISLokziGF82Mwmb1UhisgfhLvOWa3mJFNJEPDWj5R0izSG2KIdu6BcI39xPCJZfU2zDPbFmDvsEqRB9993h+HSU5lAqlU7YOJTtzBOEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ec88dCuvFG82q9p8wDDd+vCbJFdZlkZED1C8U/f7qog=;
 b=VXXhUxJHvcNzQ/LiSTH3jPrqK9uVs2KxnMTrMzgafRt1OrMwBAwhqBCr9U4Rptjb93XUIWLBk99JlRnppEzW+8BEllz1d6VuETOhTw8fB1lf6gRwvaN1HHqIi4QgK/WbIlV+cPrsKL0pq7YjhBWvnbMdkUQ/+a2EGlHyd+u/HzA0PSRvVcdUHrWMm/HYAGAS9aNwFpoiZ16GeHyRP92dWTlTvoseG6M3X1WIwjeVW2A00I073lstWnnfWaHB3Lvjzc606GLgS2shoeMH0gwx20ltJJqYaRVJyNF4ifZByVdKJd+d/m4Bk5aLbtsMUyi/OkbCjqWPlujGFHxMvqujuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ec88dCuvFG82q9p8wDDd+vCbJFdZlkZED1C8U/f7qog=;
 b=HsbZBlqViHGyKJeHVMvSu9RRbmenyngjHGzX45WRXX48Htqpg0C6zudtSnk9T/nSsAyEMsV0rp+ldJCNdb0j7T6sq1ZC+Rq/YROq5GBtChpq/t+2Urvou+TcbmSoO+JzaoqOCCVvsb0UtFDKkMxzF+//SxlkNcbPpNk7FgsvuJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by SN7PR12MB7274.namprd12.prod.outlook.com (2603:10b6:806:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 03:18:27 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%2]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 03:18:26 +0000
Message-ID: <9717ad8d-0117-4320-9d6c-dda6b712ecee@amd.com>
Date: Tue, 1 Sep 2026 08:48:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/6] dt-bindings: net: xlnx,xxv-ethernet: Add
 Xilinx XXV 10G/25G Ethernet
To: Andrew Lunn <andrew@lunn.ch>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260831150816.1020883-1-suraj.gupta2@amd.com>
 <20260831150816.1020883-3-suraj.gupta2@amd.com>
 <bb36094f-07d1-49fb-be2a-ffe126e1b919@lunn.ch>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <bb36094f-07d1-49fb-be2a-ffe126e1b919@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:277::11) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|SN7PR12MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d7684e-0ef4-47bd-00b4-08df07d7b045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: KFUZGk8+XEZViWe+IhQFCnRzmvkPv8GsOzoRERZd+VB8hRcrUmyYGRf2aD9i3sXRkyFOc+PaI4nmErQRUIEy8h+X+8EM7BEqiRBXMKp/5TLrwP76ixvjUKHUcDGU21Z7ZQOtB1osfM7+0O/yBs6nKz56O0L71uq4mZfzWbsJtLNtI7TMW6IWMor/44ZbbFHFUX+u2T4HaUE7baRA0JwnCAcEL2/1rXwg8zWwE1a4mGBYPNy7kPBpd7zKwmKWyBValooI/6dBtUc5rav+yl9yV43SxDh/9DSz3SVEVlSEvorPH3D0B1nVNMWjQ4u7AsnLi2lt6m/wZYCN3qWsegY3ENWEpQPd7C891tr+CUvUPEHaiZzrI0hnz8u9woRAnVEWLp6K5G597XOr20UDihirtwLm0u6sfFK07B7G3d3MEsoxk3qDdIi+RJahvX61g/fLMTa6VPhhXAd9i6l6KQSUa53tXkRavYnsCAyyuiEQMsFa5qYS/+M9gbnhdrvzyq6sGKLc19oUXjhbLLt0REmjNmgMSEKjg1n2aE9VU6l1s/Z5nT/cr+5Ukdn92aTOYJ1P/wQ2TnMnruepT1EApJYhoMfEv9lXSahHvtG24eiO92jOBOinrIA8GXWZNovpSejEdswu7IpghXp8QcA3qp5TZ/c89uRh0nTybGxL1B/NvXU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFNYTjV1aDB3MXg5MTNtSDM5WThGb2ErU0psRWd3NGR4S0ZReTFhdGMxT3Ru?=
 =?utf-8?B?d2gwQXc0T2NVcWpDQjhuMEdqMDlNdTJ4UjJxU3ZqaHltU3NSZWFtSnczdy9y?=
 =?utf-8?B?Q1hXS21qWlZ5c1FuenZPTTN0ZVo2dktsQ2lzMkt0NUlGZmhEYWRnTFNybHRS?=
 =?utf-8?B?ZUUrbDlMb2hjS1B6aURRSkVidW1yK2VSbXVtVkZmZURTRk5FWEpCejNnWlN4?=
 =?utf-8?B?aHRZWVR1R0F6amU0bDB2TXU1QWNZNVZvd0luWVhQeG9neUx4WTFYWkVVckFr?=
 =?utf-8?B?NE5OMGhPeTVaZzBTTWdIWXNLOVlQOGZ4Mi9NY1pWeFlOOEdYeWRvSFNMaVEw?=
 =?utf-8?B?eVB4VDA2RllSR2lRRy9rVEJBSmtDbDZ6QXptbkNGSGVpS2RhQjdsZkpYNzNl?=
 =?utf-8?B?YWtmL3R1WjhjSXBHUldOVlptQUJaeFIreFhJaS9ZTDNkcHowZHZrQ0g1Nyth?=
 =?utf-8?B?eEEvM0NiWWw0Y0ZveTF2UFNBcEZ3RGVNbThvb2dYOGdCK0tNdk5IeVhYc2pV?=
 =?utf-8?B?ZkhKU2xUVUlmKzJEdTBFZzVKOEdjWDBDY3JhZmVmbFMvU3F2UzNtcytXSkU3?=
 =?utf-8?B?ZzV5cVFBSklTUGxESU9qWnYvei93aGYzd2lTTjZzRjNhZlo3UGxvWHZnbERt?=
 =?utf-8?B?YUE1d3JMMEVsa0tQRlUrMHpOWVVYYmxJdUFoOXdyMUNHUkNub0tqRlM3dllJ?=
 =?utf-8?B?Z0JVWjF6SDVvUUhDdUkrU0lCZEI3MVFkQytjMGRhSjI0b1kycVloZEtQME1h?=
 =?utf-8?B?NzVxUUg0ZGpUVmZjaFkzeitWYWlNRUxTUU9OdmwvYk1sYkIzT1JCMWdiNzhh?=
 =?utf-8?B?QWVkTFh6dU05QnJTODRpT2xkVnluRTZISVVDQW5keC9vL1RNa3NUdnhmRTFv?=
 =?utf-8?B?ZjRvOFNjeXV3MUZYa2kzTjE1eHdLYUE4ZFlMckRRUzdncGNpNW53cTJHcExV?=
 =?utf-8?B?MENBcmdvc2JPTCtWdFpQTE9HckRBcUc5UmZlSW1aaU1QNDJjc2RnRUQ0NzdZ?=
 =?utf-8?B?THBIczJidkFPZDdXQkpjQTFaald4bjlzTzNIQ1M5MlhBVlF4RUhMa3BBekk4?=
 =?utf-8?B?YXh4Mzl5S2lRMU9PSC9KQXBvakZPTXlTQUl4QWJPWitpczhTU3dKbDF1c0l0?=
 =?utf-8?B?NXdpaEc3Zmh5SnRWQVpGVURUTURzQXZQa2ZTMFpkdTNoSi91TFU2UXpmSlpi?=
 =?utf-8?B?WTlQbnB5WDFMT2xSaGlDZmk2dk9nNjJac2NOZWl3N2F1enNobVpwN1lxWGFw?=
 =?utf-8?B?dmwySjk4bUZTTWdZc21lV2NyZUlYdlpwc0hxWEtRN1lFczVzU0hxei9jaVhO?=
 =?utf-8?B?eGpUL1JheG5VMGhoUjZFVWRxQkpndDcyRDUwbUVtZVNuYmxkay9jZnBmOXQ2?=
 =?utf-8?B?K29RS1lqM1JqeURXMS9ybVhTRUZ2cTJtNFhwaWY4U29DNEJOd1loKy9nb3p2?=
 =?utf-8?B?ZGtRU2pVVWZDWlFHckN2N2VhV0g3UFovMitHSFJJblVFRyt4T0FYRXljVy9w?=
 =?utf-8?B?dFU0MDZWVS9IVzg1cGhRaXZYV0FTalUyTXBzYU5HSE5wdUZIaDVYTGMycVFP?=
 =?utf-8?B?T1ZTRFpXcjZHT2FuNnQ2V3E5eDM3Zy9PWHloM3RhNHpmWC9HQWltTVBQKzAx?=
 =?utf-8?B?SXY3MWYvUEpJUXBlRnZCVEt2OVVCNU1xUS81dk5qR1B2eEJlSFVlbnRuWFlM?=
 =?utf-8?B?VkRNa09tMmFUaUpCc1pWdEZQbmZSRVg5V1dOdHNFTEVWUFB2MW9zaUNPOGpZ?=
 =?utf-8?B?UEhKMjVyOXdvcUJCZDFrTTJqYndUYkdYNWpFWUJ0dTJSNUU4UlBCNjVzZDhS?=
 =?utf-8?B?QktjOGF2T0puTlhjbGU2dU5EYUVSbjNnallaMWp5MUlBOXIzTUtGYWNBcGly?=
 =?utf-8?B?ajBXempxbUFSbzdQQ2F4NTB4NnhUQXMvTSsrSDlFTC90YmJsSTd6YW9SZkpZ?=
 =?utf-8?B?RWlTell4dnZKR0pTcXJSb3pHODU0eTg5SnpIaWRiRHVXaCtGSWRVVy9PRytk?=
 =?utf-8?B?aWxZZE5uOHNpaXovb0drb2w3SEtJaVpPREM5Z1dhSTNTU2JwT1Q4UGpXUnU3?=
 =?utf-8?B?anFpVDFUdlNIMExnNVdVNXdVS3NhbU0va0k0cC9JWkdDc1h5RFI2WVhXdS84?=
 =?utf-8?B?M2hQeWpIODFqcWh4cnBoL0RFWFQxeXFjL0JGcExoVXdocEo1V2VzSXVKSDJj?=
 =?utf-8?B?bWxndklkY2dCLzhJWWJGL0lSN3dnMmt6SXNjdGRreGVwR2tONGF1UTlkY2dG?=
 =?utf-8?B?amZXNWM3KzRPQWF5ZUZKZGNlVmVzTDlpdnVtSjNmNk53ZlQ1VUdVK1hNeVRU?=
 =?utf-8?B?VlhrS1NMV1NCTlk0OGpINm5OZnJETHNkTzJQU1N1SjdSb1YxaGdZdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d7684e-0ef4-47bd-00b4-08df07d7b045
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 03:18:26.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9fkxzkDP0r8uFwBrNpXA9oEO8w8uryAq29wYHqcJPHA+cjfIkkT3N41nXo6dVCK24RzajChr8rkIvdwvoRY3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7274
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_201834_299964_707C200C 
X-CRM114-Status: UNSURE (   9.70  )
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



On 9/1/2026 7:57 AM, Andrew Lunn wrote:
>> +  The Xilinx XXV Ethernet Subsystem implements a 10G/25G Ethernet MAC with an
>> +  in-core PCS/PMA driving a high-speed serial transceiver. It supports the
>> +  10GBASE-R and 25GBASE-R line rates, with 25G operation following the 25G
>> +  Ethernet Consortium specification. It has no external MDIO PHY
> 
> What about MDIO bus?
> 
> 	Andrew

The 10G/25G (XXV) Ethernet Subsystem IP does not provide an MDIO master. 
The contents of the appropriate MDIO registers are available in the IP 
control & status registers.

Regards,
Suraj

