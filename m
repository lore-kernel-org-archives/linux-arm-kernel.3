Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B006EC1128
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 20:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wim44b29T6XuJOUHr89upZgIOLt0zVJ4Q6hLVX0ESUk=; b=0nnrqN80FFgS/yZNBw3px90vX3
	M7siWEJV7t9kk1NdsE/WAQbI9anYgr7UrNv/rEhFPs38lG9K0Dnqy5j/84lJJ7R9ExEKg7d35iMuP
	Dx57ywLIjD46MHl/B28zdbzc+Czk/o0P5+c+KDwPhjrWHuh742AI85ylHvvyok34OnVwbqj2dacgN
	HGxO3k4UqkWkk77VFkr+3a3k9YuTctvRLJxTDjd9NZDIv8lgGhevM49mDE+QQxvskfaxBtqLNWC0s
	uVcxuvOAR0HMD32MkoxmP5UlpU+BrzoP4sdj8V4oLHuxjTxC/IgmoNRMo2Yv4CZ7kvppQyXcI9Y1o
	YUmC0zGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucLY-00000000zJV-2Kz0;
	Mon, 23 Feb 2026 20:16:00 +0000
Received: from mail-westus3azon11011004.outbound.protection.outlook.com ([40.107.208.4] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucLV-00000000zIq-292c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 20:15:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5CIhJyYZr30AOlSM3NH6TXEG8Sz2FApTVooBOmuAoaEZX0hVvvf5aI6lZ9DRTXdVT8x7keo1SmxXbDiWGB2Nlq+nMLFXSl7ywJJ2J5GQrC3Woo60ZddNCFJAIsCIAxuzKbcfvxCyc7iDYuIk7tC6yb3cceqj4jMNI6PmbxCr9ZUvQHHypIpwf2/spRLAcXk+Zh6x1dYqq1w6+1I8zWFqQLBZaLEazTsfY+3BMrZhI4izEH/g7I9HPVXR/jj7PkQSB64UnWg5vWPr3D8qRPFqBRx3JRJkRo3aKcZdlxK5cy0GhVIzS1ySHOH1uazJQidQA7Bd9QZ7rEnbjM/iNq6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wim44b29T6XuJOUHr89upZgIOLt0zVJ4Q6hLVX0ESUk=;
 b=sTifZtpGtH6/H4Vd92iROpX/amL0/Kj7PsZqr3VsR0yCASzmNWfB+IzS+zc5M/QfX/J5CDUGeCsofwUesNro9+9qFwCBDMosMHGhLAz/qe9DvMmo47RR1QNZF/7fo3R9HN9LL62gPwJtXVnz31nK1cpJv3n9kEPxP5PT0zWB25m0EN/h8T6Dt8m7oEvLOYU2558LFCTfy8y4KeFyZL+1bQM3yA7fcIVJFPoCWHrULOgu1mP97ejy2OXSkLzrwxKP0skrcGaLPz0Is0bfnuvXr5irRzdWiYYGB+2OB/bYgy464u5JdTHpWdZLs5rIZV8Jmsfs5yhy6JwMV001dZzHRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wim44b29T6XuJOUHr89upZgIOLt0zVJ4Q6hLVX0ESUk=;
 b=Lh/TNaKcMovcQRKlo9HZdHdBVQP5CeknvmsEm41ThhdJYdtjYgfdt5AiN+rAxEkcOfw0+t1IZQ8IoPGUCnmtAJ1ii/tTNkMfG0KYMx5/R7BPApo6o+3P0A5nIfno/vZRlAiWc+Gggx/RxUuxWqmbl6+U3yaJQ8iQTkbR1yo7T2E=
Received: from CH0PR03CA0098.namprd03.prod.outlook.com (2603:10b6:610:cd::13)
 by SA1PR10MB997787.namprd10.prod.outlook.com (2603:10b6:806:4c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:15:53 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::36) by CH0PR03CA0098.outlook.office365.com
 (2603:10b6:610:cd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 20:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 20:15:53 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:15:47 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 14:15:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 14:15:47 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NKFlUI1434678;
	Mon, 23 Feb 2026 14:15:47 -0600
Message-ID: <6a8488d6-d1a0-441a-b7c0-d18c1da36472@ti.com>
Date: Mon, 23 Feb 2026 14:15:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-am62l-evm: Disable MMC0 internal
 pulls
To: Moteen Shah <m-shah@ti.com>, Nishanth Menon <nm@ti.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>
References: <20260212184246.2316659-1-jm@ti.com>
 <20260212184246.2316659-3-jm@ti.com>
 <e651f6a9-5867-4326-bd98-10a37bf26019@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <e651f6a9-5867-4326-bd98-10a37bf26019@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SA1PR10MB997787:EE_
X-MS-Office365-Filtering-Correlation-Id: 860e8d84-2229-4521-b695-08de73185893
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2lLdjBpVjhGNDlGaDBoV2t5UWZQU1lGdVMxV0MrQm5UU0ZsK0xuR0J5bzdu?=
 =?utf-8?B?Q3JRUXRsTzdWSjBDdGhRN3F0N0x6bTVrV04zd3l6NG0xMkFlTmwrSzB6Z0lw?=
 =?utf-8?B?WjRtZ2R0WFczeHRabjU1S0NLTGUvNFZoMUNySHlVWStJWko1VEdGanZBRGR3?=
 =?utf-8?B?WXplZmRPOTYxdHkxandFLzhNRFNrQXVIZlFTc1gyMjA3NkFXNHRkaW5vTG1K?=
 =?utf-8?B?NmtYL3dZaWQyMFgrSUZvODBSUVNrMzd6bGlKbEloTW1ZOVl6MnZQL0Zkb0N5?=
 =?utf-8?B?aGN2eGV6MEhzRkwwOEYvTmFmMzVDZlVSK011Y3o4SFVuNllKMURpSkNkZ0ls?=
 =?utf-8?B?N290U0tHRjRvMEl5MzF6TzNucEk4SGpQcHFMalVVOFZ4YkJ4WWxFV1Q3ZjFU?=
 =?utf-8?B?K2dsT01QemNSdnAwRU5XS2d0QVN1c0pIRVFzanluYVBCQWdYdmM0QjIxcHA0?=
 =?utf-8?B?VkhLWkRRdkRTeXFkVXhkRFZrWFM2Y2VtL1pXaGlNUkdvbUg0UzBEaFRmYUg5?=
 =?utf-8?B?b3Z0ZmFJYjI1cHREQUdNWFZ1Y0NXM2c0aXhTTzJ5M0srWEhhazVuTCtqbktn?=
 =?utf-8?B?WW0ydG5jc0FPODlXZTcrNXA4aFhwWXg1WlhIaGN3VFRxeWtPREljekRjV05x?=
 =?utf-8?B?MVdqUUZPaEhkZk9aNDd1MWo1MVp4dFFhUlFFNGdvR3RsY0R5NEVQVkFTNVdB?=
 =?utf-8?B?MEw5SEtia1dDbEQ2WnpjcjI4UXg2ZXdiaXQrVDg5cWlTb0tnZEppTy9lS3BL?=
 =?utf-8?B?WmFRZ3hLeXdXem0xaEtXRFVSTGRJV202b2tIcXA4UFJjMHFsL3lPQ3hyT2x6?=
 =?utf-8?B?d1hNV2xBL0xSeVIxNUpBRExEbDBQeEdWTnRTb3JjSWtPZW9vZmxzUk84Q0du?=
 =?utf-8?B?dTlUWHpLODk0WEpLRkRmSVF5WngvNy9PaHJaMFRxZEZDeEMvM0pnRkNpd2hS?=
 =?utf-8?B?WmFGQWhWU0hocmlCRFhMUW9FY0c0UlFKRC83ZmlnK01UU3ZkNmczRDNTdUtX?=
 =?utf-8?B?ODZ5N2xmSldwZCt6RnVYUnE4Smx2NjZ6TGVJbHdaQnp6dHVpWE9HSTdvTFA4?=
 =?utf-8?B?MEV1L3FYVkE3RGFEQkpmZWxCK1JzbEtyOExUN2JabnRiVVBTSjVYOWhxL01y?=
 =?utf-8?B?eTR0enY5eWVDeko0OEJQUWt6aHFVYVVpa21rOGlhZU5DaUpVSTh1UlIyWHhw?=
 =?utf-8?B?dm9aaDZ6YVUyajFTN3p4bnZpb2doYi9aZXhMOThBbnMzSmFLU20zTE1FSm5I?=
 =?utf-8?B?bHpUN2IzYk9idTR1V3VicVA4RWZWU1hCditURWhwV21LdDRtaDRaaXkrU21M?=
 =?utf-8?B?RG8yeEJZVTM1Z3IwcGhZZjNFam1ZRTdoTUYyc1VzZzUwcm9QK2ZNc3NyVlZy?=
 =?utf-8?B?T0hqSmdwTXVpclN1ZDhpT25oL2hyaXkyRXNmSTdlQXRjZ1JiZHlnT1dXQ1pw?=
 =?utf-8?B?bzk2dHl4UWltMW9zbGtpU3R4Zm54TEdZamJQMzhGc1o0MS84NllNVU5vUThB?=
 =?utf-8?B?L1FLSWQ3VmdvRWxZSG1QSzF0Vkpuc2NtRkVJNm9BNVMzSnVMUUZpVGQreG52?=
 =?utf-8?B?YTB2WWt0Wm8wd2JRU0dLQUd0UEZvMmdONTJDQ2FHb1RPTVQ5dlkyYzJiZ2tx?=
 =?utf-8?B?YjR6TUtoNmtLS2hOczZUSDhjNllDZDZIS0ZITXBUcUZNUk9aa2dURUNXTzVs?=
 =?utf-8?B?UlBDWnY1bS9HOFV0eXhXd2c2RW9rN3cybjV6N2txRUU5UmxVY1VSNTQvTUlU?=
 =?utf-8?B?YVc4d1ZrNStrcWpqRi9WeDZIdWhpQUZTeHJ4R0RrSDhwcE9BN3ZuR0VsdUF1?=
 =?utf-8?B?T0dBaWs5TWZ1QzJRenpZR0JJYjZIZjBDMUNCKzZjWE1IRE9aRnNjeUxJVk5z?=
 =?utf-8?B?R1l0MXJQMnZKdGttbGRWMXUzWHI3RWFZam1DdkFXWEVuM2ZId1BXdXNwMFJj?=
 =?utf-8?B?dGd3dTlQSldQWTBlNGNzQktuR21ydlc4dElNVWRLWjJEZFBtMjJjUENuZlFp?=
 =?utf-8?B?dThIaU8ySW5ISzRJN2dTZUVOYnFHbDBjQ3ZzQ1JxVkQvQ01yU29zSGdTNHNw?=
 =?utf-8?B?dUNobzRocUk1OVJiWFdEejI5VytmK2gvbVJFUlljT1hGUnF5Mkc3ZkVKLzF5?=
 =?utf-8?B?SEdYdTdqV0ZManZRQWZsMEZSR05kUTRRUjZCTGNBTVgrQTRWdUNGZFMvZXRv?=
 =?utf-8?B?NkFlU1U5YUxmVW50c3dJYnVUa0dNUVFiU3VaWUZSU0Frd0QvaGErL3RWZmdn?=
 =?utf-8?B?SFJWbkkyUnhEOWRockpFcjU0Mi9BPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lkOwbXF0IP3KW7JvgwWE8A+jX1Ap4C3L1QUdtqsWgy30jcc3uEZVFNekiJd8yqCPNBF/j0dw99No45RpoHrkNGbBXmZVVYO+zWqpSwGUC1aqQg5SnRmR2q/PqMJjMVYJCbcLl7s8q09r1UgtuuJsKE7ib+5cpDPKCkSHggaayEwDU6KvvNY9XU8XvYL/z6X/kR+fqarFQKNJWji5Zib7ecDfs3KZMrA0gFyoOwkqLHyxjlkdUEe8mba79U3+T7Tl5QCox3rRAsC10f8LgXFChlIHohnCvUSRrCElMcXoc5GOeGCaxtOyvYLZ4ZaFVLH8KMEBXym/fXyElmzSr1EAwIzWYmsUPraauW2ytcncRJZnbJlMmAzjsbKnro+Xsa7v98iOHMqIOruCl0N0mhZTuzlDEQiRWB8fmG+u5onhNbAiZIW7fxY0VTnjctdB6Wc0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 20:15:53.4778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 860e8d84-2229-4521-b695-08de73185893
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997787
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_121557_671274_F1225037 
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

Hello Moteen,

On 2/20/26 2:57 AM, Moteen Shah wrote:
> Hey Judith,
> 
> On 13/02/26 00:12, Judith Mendez wrote:
>> AM62L EVM has external pullups on MMC0 CMD and D0 pins [0]. Remove
>> internal pullups considering:
>> - having both internal and external pullups reduces the total pull-up
>>    resistance < 47K resulting in a value below the spec recommended 
>> 50K ohms
>> - having both pullups results in unnecessary power consumption
>>
>> Fixes: 00fb4c73b67d ("arm64: dts: ti: k3-am62l: add initial reference 
>> board file")
>> [0] https://www.ti.com/lit/zip/SPRCAL6
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/ 
>> boot/dts/ti/k3-am62l3-evm.dts
>> index cae04cce33736..5085cd255fcd5 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
>> @@ -253,9 +253,9 @@ AM62LX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D8) 
>> I2C2_SDA */
>>       mmc0_pins_default: mmc0-default-pins {
>>           pinctrl-single,pins = <
>> -            AM62LX_IOPAD(0x0214, PIN_INPUT_PULLUP, 0) /* (D2) 
>> MMC0_CMD */
>> +            AM62LX_IOPAD(0x0214, PIN_INPUT, 0) /* (D2) MMC0_CMD */
>>               AM62LX_IOPAD(0x020c, PIN_OUTPUT, 0) /* (B2) MMC0_CLK */
>> -            AM62LX_IOPAD(0x0208, PIN_INPUT_PULLUP, 0) /* (D3) 
>> MMC0_DAT0 */
>> +            AM62LX_IOPAD(0x0208, PIN_INPUT, 0) /* (D3) MMC0_DAT0 */
>>               AM62LX_IOPAD(0x0204, PIN_INPUT_PULLUP, 0) /* (D4) 
>> MMC0_DAT1 */
>>               AM62LX_IOPAD(0x0200, PIN_INPUT_PULLUP, 0) /* (C1) 
>> MMC0_DAT2 */
>>               AM62LX_IOPAD(0x01fc, PIN_INPUT_PULLUP, 0) /* (C2) 
>> MMC0_DAT3 */
> 
> 
> Wont the change result in mismatched pullup resistance and will the 
> mismatch between D0 and D1-D3 won't cause potential timing issues for 
> modes with tighter timing requirements?

If you leave the internal pullup on MMC0_DAT0, then you will have a
greater mismatch actually. But I noticed a wrong detail on the commit
description after reviewing the patches again. So will respin the
series, thanks for reviewing Moteen.
~ Judith

