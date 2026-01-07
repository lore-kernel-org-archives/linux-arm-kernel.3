Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894C1CF6C18
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 09:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=; b=VxcNrXWRK46YV3b87BiVbSByJG
	2D9458t7CP12cs494qD1JTWMM0wtf7b+P08JkkuR3zmspao/Uy3/bXlfn/KWqTQBuiYmpdAB9aWMr
	V/MqFu9LaSsyz+rmMbV6E+1Q+uNvTMnXAB71xQJyxy9UpOpwPPFwDs5iikjracmJ++6Tcld4cbvRn
	nRr5LB9iqWxQjGFSWmpz954I2+eRGNwjmMq7dob81lzDrrFudfxeexYmQTwf4X/FKPi/mKSjwHw4+
	rMRh2r49qEsSwWCzeM6UWeFMZbKG15PoqTB0N/hUm69TkxrFfDOn5+VVk0Hmj5/QBOFPRg4S+k1CW
	wvRjyAOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPbE-0000000EUkx-3AlN;
	Wed, 07 Jan 2026 09:13:04 +0000
Received: from mail-eastusazon11011010.outbound.protection.outlook.com ([52.101.52.10] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPbB-0000000EUk2-1VjI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 09:13:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd3P2ySUsUK+NczDtt0EsgMsSh6yWekmQlUVjCnKaXRl7RKwGkQBZwb66rLK3buYM4VrlmHmMxfRU2/8jgglbvqhCBbX38a2dytXU4M0/qfl0cXXZzVI5kMIf0ilR9sJvGc38tTOXJ2OJQxxjvDbNHKxW5ZvQVt4Rca8fJravzZJgER7bh6SDTfvZa6qmDy3qWXzH8tCXjH3Vlh0IjmNq4n7hxFlOC5Q7LFQVp4m0MdWUEf/04H+MgzIcWOMKovPquGwjIX3bZGFOGL2IQ8r72rDQ+44/9ZQuE7yHUhOo8ZYeQZeRtrKuJBlDT5O8Lq+BZt29cUEwyQAJXzYN4xEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=;
 b=mON+jmYNKphefBhObvrvYRt1mFT4V8iS8sTi5nwJyO2GpkO2LyuNjUvMPw49ysz/N+U73oBh0pqctEHof1lCZY2AmVcEme5tBznalfE1Ij1ZKXrVr2r3BJMEtooQaND98HJkaKIGkuuxyT/PPmKocoU+VC6cN0ua6o7eLfG/49Xu2vlwEpJ2U9x8doYWHM1InJpu0QfdusDUNjk+CoV4DCqVWFdL0CYQetUeiAzDFMWOBYYmWgfn00OZYweNonjP8dmTC09gi7FDnMBiuzK6Cx7a5oKFpx8M6dyL8oBD3MOXiPl4Xx0Wc3S1vHWjHWBqOMinlN5JI3Dcx80ja2dgpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bKuxCdi4DAF2JtNHqMN4ZpZ+JKUPdciQlF+6eEoFEug=;
 b=bSGxBXrmRJelGM9rtDu192lGytEquHD4+mr0oAJIeg2v0/gJCwb5ihxgiSJyZ52oEKxInfHn1aFI4+PPczhQQ2dl4dPxgYWHgmmMeRA5G2A5nhwQZJDIQ5Zjxxu6DVlbPSOyVMsDJRPy6uzqsVo3kz75z+DARKtdDQOr5z4BzPSRb/q6pxEq48fsGk640q6pZHV6Xl8sSij0xWG/IGgtfxg8dkVFYldK0b/fBM44HjF42V5NURvssoBxTVgXJ8I/wJB/283xVUOe68TF9cHbyyc7sw5xLZafiZSYo8EBDUnB6MGGmwUPLpSrhsa6FMA5yANFy1O4sz7vFDb08JZzhg==
Received: from BN9PR03CA0491.namprd03.prod.outlook.com (2603:10b6:408:130::16)
 by LV8PR22MB5946.namprd22.prod.outlook.com (2603:10b6:408:267::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:12:55 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:130:cafe::6) by BN9PR03CA0491.outlook.office365.com
 (2603:10b6:408:130::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Wed, 7
 Jan 2026 09:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 09:12:54 +0000
Received: from [127.0.0.1] (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id A8EA9E57C8;
	Wed,  7 Jan 2026 11:12:51 +0200 (EET)
Message-ID: <e24ec822-4d13-4136-8fb6-1bc6cbaf8e20@gehealthcare.com>
Date: Wed, 7 Jan 2026 11:12:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dt-bindings: watchdog: fsl-imx: document continue in
 low power mode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-3-nandor.han@gehealthcare.com>
 <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
Content-Language: en-US
From: Nandor Han <nandor.han@gehealthcare.com>
In-Reply-To: <20251230-hidden-okapi-of-reputation-6ef8be@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|LV8PR22MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d73be91-8585-4f3c-2622-08de4dccf13f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmRrRW5CMnlBQkRIcldyeUtnQ2JqMHJYQmJSOFlMZUFrR3U2K2xRZytaTGkz?=
 =?utf-8?B?azBDWkZEZytrZW02dHd1TUR6aThOVE8rd3N0ZTBma2UyTlc0SlBKNE41Z1Jn?=
 =?utf-8?B?MWZ5NmZGdU5SSFo2Y0VkNzg2b2JCSEVpZ3ZIZnF2Q2xJclF0cktlZ2puUDNR?=
 =?utf-8?B?RkgwR2UxZDR6em9jNWNWamJ6Z0w1VzJ2dkYwaE5OU29FeXFJYU9KeTlaRG5G?=
 =?utf-8?B?bVhQdFc4MkhLY3FYTU1PYzUrY2ppanRhZHdMK0twT0RMT1owVUZUb1gwY3hj?=
 =?utf-8?B?aGZoQlJDVnJOUXRqZ3h4MWM4ME9iNXBvc2pFTUhQbE4xVFRhazY5ellkMEtp?=
 =?utf-8?B?VXRIYkV5Y2FJOXphTmErc3gvRzcvMkRVK3ZkaFcwVWplR2xwQ1MwVHo5a0RP?=
 =?utf-8?B?SXZqblArZ0ZGVE1Cd0VBaUx5enNZb1VibG5QSWRBZU40VndnRkNXVHlZczBZ?=
 =?utf-8?B?RHA5Z1Y5bzhsMTIyUVZldS9Scmt6TTdBdW4reGw2WFg1Njd4WVFoSXZqSEpW?=
 =?utf-8?B?VkZDV0dTSDd3SXVITFpXaHFUK3RyenFCenN4QUFpY2hTd2VrYzFvckxXdkI3?=
 =?utf-8?B?cGhhY2tkRERhTGkxR1FoUlkzNElwSERnQVpya3VSb3FTdGEzY3Q2K0JRNDh4?=
 =?utf-8?B?MlNJUnlxWFptM1IvUUhnbGgza2FMblM5a3BNbXFQNkxjZFVUcUUxeFI4Mlk3?=
 =?utf-8?B?WDExbUVvSk5ESFpPeG5OcmdGWHJHMFNDdEF4K2ZsZ2pBTXRzMlFPb1hjUStB?=
 =?utf-8?B?L1g3NnFERVdDV1Fta2Ixckl4VFo2cTh6cjVFOFNBZ3dDdVdMU0JzbGF0S3ZZ?=
 =?utf-8?B?UWxaMUJvOHVPRzlwcDFQb1pyaXhrUnhrNWsxUzZqejFUTmlPazdrVWx4UlpL?=
 =?utf-8?B?NElOOUo0SjZSWG82VU9pVFVkRWhJSERCVWt3K3REYmFLRzFFL2lmczEvcm9p?=
 =?utf-8?B?UGFSYkIvYU9HYVZLSG1meWMvT0p2b1hsR3JmTHh4aUROQ28ydk5RbWMyWXkz?=
 =?utf-8?B?SUZ4K0xtWGNnQlhPaG5mSzFjazJwM2JpdkZacjZqSEFFUEo1SzV6ZkFhWmdC?=
 =?utf-8?B?WHcycEhTMDhEMTNzeWhPU0ZBb09CeTZuVEg5OStYaitUbjVTb0NPWGx3Q0Ir?=
 =?utf-8?B?QUJPRE5iMmN4WDBJOGJROEJWa2FCWUh5bkVRMFNSQkRjSlBvRWhIWHRkdFQz?=
 =?utf-8?B?bFNmbzYzYXUzdnZIQlVXYXFsdHhOalRTRnorMGJjN2MyY2pnNWFYR0ttQWpx?=
 =?utf-8?B?MWxqVFVHNVRjblBqZjcyMGRZOWdKemxCY09oTVl0WGFaTSt5YXBORFd1eE0w?=
 =?utf-8?B?NG1WYVo3L3RDNnp5V3M0ODVUbjIwOVhMOWZJNDBHcjN6WWZWK1FRV2RlYWFN?=
 =?utf-8?B?cnlGaDQrSUhzang4dnVyYlVDZm5oYVVmTG40bVJ6Zk9YOXd2QUxpdkYwRzRS?=
 =?utf-8?B?Y09zeDZWRnBEQ1FCT1g0SUh1Q3dTQzRyQnRlUDV6M3cvNG8wdEZoYmlsZ1FR?=
 =?utf-8?B?Wm9DU2kxdW1qY1h2T1YzOVgwR0w2S3RSVk9vVmxGMTJpK1JEMUIxQndDSG9u?=
 =?utf-8?B?Z1o5NXlJanpHbkpqc3pDNG1SbVVtRUFlUzhKUUxGZGNIR1dYUTQvaVlIN01l?=
 =?utf-8?B?VnE5VXNjT3NPVzVjU21GRUx4YUw1alE0RkhzakpHcE1XSWoyZHFmSG9tTmhF?=
 =?utf-8?B?UkVGWFlIdk44UDRwRE4vNkpLR3lHTmhsZ1BSZS9VTVlvRUtpeTMvT08wRnh4?=
 =?utf-8?B?NXVwSmdHQTlvRTNTRE9iWnpDYXFuODI0NjcyQm9qZGJLNWxYcjNrV05KQTRY?=
 =?utf-8?B?VldZNFlEVmozS21zdUw5eWs4aVJnYnVZTWFXckprT3FGTDdtTk1McXpGVFd5?=
 =?utf-8?B?UlpnNHZ5OHgrbWlQc3g1TzhyVExZM0VLbnZNYXFGcllaQm15TzZ6eXBESG00?=
 =?utf-8?B?OG1YQkhZb0V4czlScHlUZGVPTEN2VkRuL3l3K0NvcVRTUHExeFlTalVEOTBM?=
 =?utf-8?B?Y3h0a1RWTGFFL0tKS0pCVklkNzBYTDlRcWRFMkdtZElUaStBMW5UMldHYTRI?=
 =?utf-8?B?Nk9NS3h5VGdYL0hWTklqcU1lNlpaeGZ4aGhWbmVtZ05pVG9Sb016MmFmZmpD?=
 =?utf-8?Q?lEhc=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:12:54.7612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d73be91-8585-4f3c-2622-08de4dccf13f
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_011301_431122_5C4EA7C5 
X-CRM114-Status: GOOD (  12.95  )
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


On 12/30/25 14:34, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
>
> On Mon, Dec 29, 2025 at 04:50:00PM +0200, Nandor Han wrote:
>> Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
>> running in low power modes (STOP and DOZE). By default, the watchdog is
>> suspended in these modes. This property provides the option to keep the
>> watchdog active during low power states when needed.
> And why exactly would that be a DT property? If system is sleeping
> (assuming this is what you meant by low power), no one will pet the dog,
> thus watchdog makes no sense.

Thanks for the feedback Krzysztof and Guenter.

In our case, low-power mode is disabled. However, we have identified that under certain conditions,
specifically during simulated high-load scenarios, the device becomes unresponsive because it enters
one of these power states.

> Otherwise I fail to see how this is a hardware property and we do not
> accept SW properties (see writing bindings, numerous presentations).

Our system is based on the i.MX7D CPU and the watchdog peripheral supports the configuration:

(From i.MX 7Dual Applications Processor Reference Manual, Rev. 1, 01/2018, page: 1174)
---
WDZST
Watchdog Low Power. Determines the operation of the WDOG during low-power modes. This bit is write
once-only.
---
Given that our system does not support low-power modes, we intend to enable the watchdog across all power
states to ensure the device can recover properly under these conditions.

Regards,
Nandor


