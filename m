Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3B0E95385
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TQ+kpVLySZWsX7+bWAYNEFR62wP3qIKCAJKCgCssiI=; b=F4DWv8ZqpLWoEn4Cx6J6JmAwoS
	BChTR0ZmJgHHKyo2I2rHaHu2v50a4yASK7mx14DluVp+t0ZU+zkgapNM5J3v+k1t7Uq1GeOtyBIrZ
	boP+Yas39h118nKssbsQmcbVY9NpL9HaUWVnrD4ID/FyszftxXw7DM/qBHOLuJAYtvwaGVP7guHvQ
	dinJ6XVpA6y7lydDkMumfqBkXhqwQtSkINNLfU1w9Yf3ku4ywnni/nCex0jAQo6654qONfyhyov5R
	qQTmVbKHAypK7FeIonZRyHiUpXepymOM+9+h2hznLOi8DW+QUiCnXEjvfJ3pFxyQG+Rp85VEocuRP
	nuErFCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnatn-00000008La0-19Ih;
	Wed, 04 Feb 2026 11:18:19 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnatk-00000008LZd-1YyK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 11:18:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3tKK3vYz5mifSTQlktZn8kjgSGYmCvlaepRvN/ItfLW0yQKHILd0rf5jQcbVOhVpI4T1cBryhgrN1W058Y0rp0aVUP2pfWhoQ6JNbmQfvO/HWNTHEkAMhD2YHT3PDqFyLo9fgCliuspwnp9JIK6w2L39p5G+LUMtXa0kxcXcGX9uIGwWe9l8v4YpniENnukNLhAlQ6HeY4iOX7HORO06CaH02p7pum12Kebuu/jv6u2nZbVFC5cZLbhu2HJnC8LWXpM2OEjrIMRsLvRux2ZvlowaKRPrQkE4DIfSLXs85vv6vAc8OVzX14nF/+XsV7E8vNsZar3F0rg5o+wpAnA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TQ+kpVLySZWsX7+bWAYNEFR62wP3qIKCAJKCgCssiI=;
 b=XeSbiw3zlCL8IJ8Uus9ETftaVI2sqvIAiv39HcAGADhgPbMRbd3/dagA81VCS14barEqFvGQNuOKvcEmWdbBRI60PnfIlC+kIPUyYZQQTkTqn/tIxc+mZ4r2Fci3oFSnCZaysvzy9bzwYph7qMlkP1fiuvvmiQZIQLQzkm/iKVykMTwRyogHci5cAXf+WfQR5tc84+8emVtPOGX2NDBtdGdHn9pmiEBdgVwErYbmgH+h96ldM5ubkMe4vpPfEJRmySw1D2ff3hKnT26RKzn0KiQX759M3QpInKHeLyAoCngQWGnvS19i5CtNZjdJiuSqmIExHZbT5DFv7c1cPwQ3pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TQ+kpVLySZWsX7+bWAYNEFR62wP3qIKCAJKCgCssiI=;
 b=i5FlG6HfcaULIyrmB5wwurqu+K/kmlgeb0mqSaL196nz9zq2byt1Vqvj5JvKn6bN27hUqBUfjb7ouI6rloKag0dvwQJg47ibPSJ//ezQVmjFtC+YsMYywZrL6O/VdazywojTcXCwO/by/HSk1vNUCYXq7A3UA2tC8Ck1P1NZLFA=
Received: from BLAPR03CA0024.namprd03.prod.outlook.com (2603:10b6:208:32b::29)
 by PH3PPF8C8C3D129.namprd10.prod.outlook.com (2603:10b6:518:1::7b6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 11:18:10 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::fb) by BLAPR03CA0024.outlook.office365.com
 (2603:10b6:208:32b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 11:18:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 11:18:08 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 05:18:07 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 05:18:07 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 05:18:07 -0600
Received: from [172.24.235.46] (moteen-ubuntu-desk.dhcp.ti.com [172.24.235.46])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614BI3g31445184;
	Wed, 4 Feb 2026 05:18:04 -0600
Message-ID: <9a443016-49a9-4e23-b93c-59192a1b5a4c@ti.com>
Date: Wed, 4 Feb 2026 16:48:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: ti: k3-j721s2-common-proc-board: Enable
 analog audio support
To: Nishanth Menon <nm@ti.com>
CC: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<vigneshr@ti.com>, <kristo@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<u-kumar1@ti.com>, <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>
References: <20260112104536.83309-1-m-shah@ti.com>
 <20260112104536.83309-4-m-shah@ti.com>
 <20260116130417.kir4agaxqukaxr57@series>
Content-Language: en-US
From: Moteen Shah <m-shah@ti.com>
In-Reply-To: <20260116130417.kir4agaxqukaxr57@series>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|PH3PPF8C8C3D129:EE_
X-MS-Office365-Filtering-Correlation-Id: 26eaa221-e6bb-4eb8-9a37-08de63df133e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clI2OWJFMS90TlZCdkV5M0ZSRlorUTAxNmtZalZrMmc4Q2ZjM2pQV2psZ05q?=
 =?utf-8?B?R0Uzb0lWQnJJc0Q3eTZpcS8vaGpXSWdaNW8zV1hkVGJkMVBQTUUzbmlNZ1h1?=
 =?utf-8?B?aEswQ2dDN2xKZnV2ZEMrTE53ZDNibG01cGg4TVQ4UC8wcWpDQnAxZHM0RzE3?=
 =?utf-8?B?WWN3WlRXYzNZTjZQclpjRWp4Z2M0aGh4aEVhbERYSDdNVmVHbkV2UkY0YTlB?=
 =?utf-8?B?d0VtVTNwa3crUWp0Yjc4ZDQ0TEhvRGoyaDdmUWdiaXpLU1hBNU1CNkR3dW9a?=
 =?utf-8?B?WVJnZXBIR05DZjdGUlVVLy9mZGJQY1R1WkNuam1QTm13d1poOHQ0aHA3ZUtj?=
 =?utf-8?B?ci9yMEZha1hjL2hxRU52bk43MnJZT3N0V2Z2VUo3b1JMd016aEtxR0lja2lq?=
 =?utf-8?B?bno4ZDJNaE9pRzFPK25sc1pIbHJkWlk3LzdpUitvbjdCd0lwK0hXaE1VRk5I?=
 =?utf-8?B?dHZFdWFQSWtzN0hLZ1A1Q0V5SFgrai84cHBITk1zTHVjc1dSTk9SbUxTWVBa?=
 =?utf-8?B?UTVRK01Qc1IzbGpsdkUwUThNU2psSC9CVk81Vjg0cVU4Q2hQL1VUR1AreFNW?=
 =?utf-8?B?R0k2ZVF0R3dBemZyekdJaWhqTGg4RlZ4bjQ2eWx1ek9SbUdpMTF4aUNiRUYz?=
 =?utf-8?B?YWdRU0hwQXk0OGFqSGdRazRxVnZwNzQ1NnJxVm5SZ2kvMjdiR2hLbDVjQ3Fs?=
 =?utf-8?B?SGpFSExQUllCMjhyN0oyZmNSeWVyc3RsV3dRVmhGUWJva0lRa043ZEZ2RWpz?=
 =?utf-8?B?N3BYZ0RPbWVTUDNPRGRENm9KZURvcjAvNVRaZHJvREZhYWlqaEpqcmMyNGFt?=
 =?utf-8?B?Y3BrQWNIMjZ1a2tLZzE3dWRmMkNNaVZhNUxWVis2Y2VUZkI1b2liTURCV0ZD?=
 =?utf-8?B?OTBHTDJGaGdSMjNlVHlMTWdzbFBocDF3d1JPRVYzZ2VKaFFkam00VmZ6dXBo?=
 =?utf-8?B?aDBEWjJSbTY2a2hrSEpwVGlLUCtuc2U3Y3pBVlNLSkM1VjJhdDBGQ3hDL1dL?=
 =?utf-8?B?ZEx2VnFKc0NCZ0lLNmMzdGE1c04xc3JUeFozbUdnQUttSGdReEw2em9oTlFJ?=
 =?utf-8?B?U1NNUHp2NVYvWnBJMXRoak9DTWF0bnJRZzdNQVNUOXUwNU5MOStKU1kweWdE?=
 =?utf-8?B?Sk5DUEZmQkswT21uQ2FUQnZHNjBqOUs0R2JEL2hLaGpZRDA4TWhpOHNoRjFh?=
 =?utf-8?B?RmZLamVGSmdmcFRXTGk3Y0FSUjQrSU5TTEFWQ2pQVW5PdDdENDhCMkNoMjUy?=
 =?utf-8?B?aDRtNURlSTZteGpudlowUTdxT3JVSi83MFgzODZBRzVReTBQZXUzVGp4MG05?=
 =?utf-8?B?VDcwendwejlCNk84TGdkQWxMRk9ka0t2cXhjMzZuam5ac2hFU0ZEajZibVZU?=
 =?utf-8?B?TGQ5Y0dYWHgvUUhjQlBkWHpZZTZPVGlUWVR3eitEaU9kRGxSNi9weTkrells?=
 =?utf-8?B?Q2NVdVI2dUJ5TS8zMjlNMXVacDdhMENpM2F4aHZILzVNM3VXKzRnQ2V4RWZs?=
 =?utf-8?B?a2p3TzRnazNBTnJpaWFBTmpqTXg5enkrWmhkME1WeU45Y1gzeC9USjFlK1Vi?=
 =?utf-8?B?Ty95cUVGU0VuMEJtUEJPU3hSeGZwRGUvZERBWGNVNGFTTkhxU1d4M0Q4ME5K?=
 =?utf-8?B?ZnlRaVdmRTR1NVdHT0IwZGYrdHE5aUNXZGJpMEVNV2o1dVpMWm5xeTNFVzBj?=
 =?utf-8?B?cWtlZ3lwN3ZNL0dzVG5ST3dYamtXREFXSUxzK0NocVFXU1E1WGRrUkYzbTAr?=
 =?utf-8?B?Z0JBYUtweE5JTXZLNEZwQ0o2Vk13Zktxd1VsUWNqT05nVGE4UG1nQWdxaTVq?=
 =?utf-8?B?Sm8wZmYxNm9Xc3VZZUZiUXBFTENYNUFQTDBxaDd3azg0aWloMGFPdi9rWUha?=
 =?utf-8?B?UWRRV3hxSUl3WHVoQnZ1dHlVdTYrcHhtZDNTaVpySklrZ3FFZ0pMZk02amZv?=
 =?utf-8?B?cGdUMDZkdy9sUUQ4TU1IMzJQQS9FVDQ5bmErYWUxc29Pdjk0MGRhNDhLY0xT?=
 =?utf-8?B?dWZLWVF1emtiR0FqTlRmYUxjTHk2QjFtZE11Rnh5b1BqKzFDM1ZrT2JBOENG?=
 =?utf-8?B?anBHb1JLdVZtRW1EQTJXZUFIQXFhVXdLenhtTVFVemtYQ2tiYXFpSG9iY0Jz?=
 =?utf-8?B?WHJpSjNpT2piZ1NNK3QwR1AzUVNqTGJCZDNUcFM0OGxwVWxtZElZeVJ5b0Iv?=
 =?utf-8?B?QnNjeDQvZ3dSNVU4M20vQmZGRmFDdkNaZmRSVmZ5QThLWkdySlFWM3drZGRJ?=
 =?utf-8?B?ZnlHQ3p5dzRXcFdtdVUyTmkrZXh3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3YHywCoG499p/zO2+OZ9nq4PgJy3nkqoMipJ4zz0qwBFAnfRcodT9oVlts4t76JQCaVkGq5Esr9qZz1udOct8AZEBUyssb67b0q+KP2DNQXrq/ZaFFWqGLlRr0wgmKQkQ3o88IO4ydNE1wlYOeTijBY6XdalIrbfLxDnQTt3R6YBYl2AEgHpT7BPpro5L0tk3cnoB73W3zH4u3PE6Azpy7ScFAJBnOogDn/3VhmVOQGueiu5M3UWyoZxEDAU5oFv7y0p1UqbK8Q1/fCAOXN2GcCw9kmynj5dEQVZ/FrKYVOlJAUtD9MWNxNXw5pFk95Om9c+Et6rDsTOntVjebnGaiU1Z5YlUtTlJVP1xpiByvdhBMS54T7pvW+S1f0LbvcSHEXwXkedgrPYrBDGArcZWKAP48DQUl1OvxT+vKivyYfjlE0wTHQkqLn8b2r5CrW0
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:18:08.3746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26eaa221-e6bb-4eb8-9a37-08de63df133e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8C8C3D129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_031816_461161_69DBBEAC 
X-CRM114-Status: GOOD (  23.98  )
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

Hey Nishanth,

Thanks for the reviews.

On 16/01/26 18:34, Nishanth Menon wrote:
> On 16:15-20260112, Moteen Shah wrote:
>> From: Jayesh Choudhary <j-choudhary@ti.com>
>>
>> The audio support on J721S2-EVM is using PCM3168A codec
>> connected to McASP4 serializers.
>>
>> - Add the nodes for sound-card, audio codec, MAIN_I2C3 and
>>    McASP4.
>> - Add pinmux for I2C3, McASP4, AUDIO_EXT_REFCLK1 and
>>    WKUP_GPIO_0.
>> - Add necessary GPIO hogs to route the MAIN_I2C3 lines and
>>    McASP serializer.
>> - Add idle-state as 1 in mux0 and mux1 to route McASP signals
>>
>> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
>> Signed-off-by: Moteen Shah <m-shah@ti.com>
>> ---
>>   .../dts/ti/k3-j721s2-common-proc-board.dts    | 131 ++++++++++++++++++
>>   1 file changed, 131 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> index 4fea99519113..d9269a16956c 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-common-proc-board.dts
>> @@ -150,6 +150,28 @@ transceiver4: can-phy4 {
>>   		standby-gpios = <&exp_som 7 GPIO_ACTIVE_HIGH>;
>>   		mux-states = <&mux1 1>;
>>   	};
>> +
>> +	codec_audio: sound {
>> +		compatible = "ti,j7200-cpb-audio";
>> +		model = "j721e-cpb";
>> +
>> +		ti,cpb-mcasp = <&mcasp4>;
>> +		ti,cpb-codec = <&pcm3168a_1>;
>> +
>> +		clocks = <&k3_clks 213 0>, <&k3_clks 213 1>,
>> +			 <&k3_clks 157 299>, <&k3_clks 157 328>;
>> +		clock-names = "cpb-mcasp-auxclk", "cpb-mcasp-auxclk-48000",
>> +			      "cpb-codec-scki", "cpb-codec-scki-48000";
>> +	};
>> +
>> +	i2c_mux: mux-controller-2 {
> There is just a single i2c_mux on processor board/evm? if not, might
> be good to set this as i2c_mux0 or appropriate naming?

There are others as well, will rename this to i2c_mux0

>
>> +		compatible = "gpio-mux";
>> +		#mux-state-cells = <1>;
>> +		mux-gpios = <&wkup_gpio0 54 GPIO_ACTIVE_HIGH>;
>> +		idle-state = <1>;
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&main_i2c3_mux_pins_default>;
>> +	};
>>   };
>>   
>>   &main_pmx0 {
>> @@ -224,6 +246,22 @@ J721S2_IOPAD(0x03c, PIN_INPUT, 0) /* (U27) MCASP0_AFSX.MCAN5_RX */
>>   			J721S2_IOPAD(0x038, PIN_OUTPUT, 0) /* (AB28) MCASP0_ACLKX.MCAN5_TX */
>>   		>;
>>   	};
>> +
>> +	mcasp4_pins_default: mcasp4-default-pins {
>> +		pinctrl-single,pins = <
>> +			J721S2_IOPAD(0x0c8, PIN_OUTPUT_PULLDOWN, 1) /* (AD28) MCASP4_ACLKX */
>> +			J721S2_IOPAD(0x06c, PIN_OUTPUT_PULLDOWN, 1) /* (V26) MCASP4_AFSX */
>> +			J721S2_IOPAD(0x068, PIN_INPUT_PULLDOWN, 1) /* (U28) MCASP4_AXR1 */
>> +			J721S2_IOPAD(0x0c4, PIN_OUTPUT_PULLDOWN, 1) /* (AB26) MCASP4_AXR2 */
>> +			J721S2_IOPAD(0x070, PIN_OUTPUT_PULLDOWN, 1) /* (R27) MCASP4_AXR3 */
>> +		>;
>> +	};
>> +
>> +	audio_ext_refclk1_pins_default: audio-ext-refclk1-default-pins {
>> +		pinctrl-single,pins = <
>> +			J721S2_IOPAD(0x078, PIN_OUTPUT, 1) /* (Y25) MCAN2_RX.AUDIO_EXT_REFCLK1 */
>> +		>;
>> +	};
>>   };
>>   
>>   &wkup_pmx2 {
>> @@ -321,6 +359,12 @@ J721S2_WKUP_IOPAD(0x104, PIN_INPUT, 0) /* (N26) MCU_ADC1_AIN6 */
>>   			J721S2_WKUP_IOPAD(0x108, PIN_INPUT, 0) /* (N27) MCU_ADC1_AIN7 */
>>   		>;
>>   	};
>> +
>> +	main_i2c3_mux_pins_default: main-i2c3-mux-default-pins {
>> +		pinctrl-single,pins = <
>> +			J721S2_WKUP_IOPAD(0x038, PIN_OUTPUT, 7) /* (B27) WKUP_GPIO0_54 */
>> +		>;
>> +	};
>>   };
>>   
>>   &wkup_pmx1 {
>> @@ -396,6 +440,22 @@ exp2: gpio@22 {
>>   				  "MLB_MUX_SEL", "MCAN_MUX_SEL", "MCASP2/SPI3_MUX_SEL", "PCIe_CLKREQn_MUX_SEL",
>>   				  "CDCI2_RSTZ", "ENET_EXP_PWRDN", "ENET_EXP_RESETZ", "ENET_I2CMUX_SEL",
>>   				  "ENET_EXP_SPARE2", "M2PCIE_RTSZ", "USER_INPUT1", "USER_LED1", "USER_LED2";
>> +
>> +		p09-hog {
>> +			/* P09 - MCASP/TRACE_MUX_S0 */
>> +			gpio-hog;
>> +			gpios = <9 GPIO_ACTIVE_HIGH>;
>> +			output-low;
>> +			line-name = "MCASP/TRACE_MUX_S0";
>> +		};
>> +
>> +		p10-hog {
>> +			/* P10 - MCASP/TRACE_MUX_S1 */
>> +			gpio-hog;
>> +			gpios = <10 GPIO_ACTIVE_HIGH>;
>> +			output-high;
>> +			line-name = "MCASP/TRACE_MUX_S1";
>> +		};
> We loose JTAG Trace?

That is true, will pivot to using the dtbo method instead, out of box we 
still want the JTAG trace to be active

>
>>   	};
>>   };
>>   
>> @@ -657,3 +717,74 @@ &dphy_tx0 {
>>   &dsi0 {
>>   	status = "okay";
>>   };
>> +
>> +&mux0 {
>> +	idle-state = <0>;
>> +};
>> +
>> +&mux1 {
>> +	idle-state = <0>;
> Commit says:
> - Add idle-state as 1 in mux0 and mux1 to route McASP signals
>
> you are adding idle-state = <0> here - which is correct? why?

I will fix the commit msg in the revision, the state should be 0 for the 
sound card to get registered.

>
>> +};
>> +
>> +&exp_som {
>> +	p03-hog {
>> +		/* P03 - CANUART_MUX_SEL1 */
> and we loose CAN? or UART -> not sure I understand this change and why
> is it related to audio?

I checked the schematics[0] of the SoM and seems like it is irrelevant, 
I'll drop this in the revision.


>
>> +		gpio-hog;
>> +		gpios = <3 GPIO_ACTIVE_HIGH>;
>> +		output-high;
>> +		line-name = "CANUART_MUX_SEL1";
>> +	};
>> +};
>> +
>> +&k3_clks {
>> +	/* Confiure AUDIO_EXT_REFCLK1 pin as output */
> I bet you did'nt run checkpatch --strict --codespell.. :)
> s/Confiure/Configure

Didn't run it with codespell, will rectify in the revision, apologies.

>
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&audio_ext_refclk1_pins_default>;
>> +};
>> +
>> +&main_i2c3 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&main_i2c3_pins_default>;
>> +	clock-frequency = <400000>;
>> +	mux-states = <&i2c_mux 1>;
>> +
>> +	exp3: gpio@20 {
>> +		compatible = "ti,tca6408";
>> +		reg = <0x20>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
> gpio-line-names please

Noted

[0] https://www.ti.com/lit/zip/SPRR439

Regards,
Moteen


>
>> +	};
>> +
>> +	pcm3168a_1: audio-codec@44 {
>> +		compatible = "ti,pcm3168a";
>> +		reg = <0x44>;
>> +		#sound-dai-cells = <1>;
>> +		reset-gpios = <&exp3 0 GPIO_ACTIVE_LOW>;
>> +		/* C_AUDIO_REFCLK1 -> MCAN2_RX (Y25) */
> What is this comment pertinent to?
>
>> +		clocks = <&audio_refclk1>;
>> +		clock-names = "scki";
>> +		VDD1-supply = <&vsys_3v3>;
>> +		VDD2-supply = <&vsys_3v3>;
>> +		VCCAD1-supply = <&vsys_5v0>;
>> +		VCCAD2-supply = <&vsys_5v0>;
>> +		VCCDA1-supply = <&vsys_5v0>;
>> +		VCCDA2-supply = <&vsys_5v0>;
>> +	};
>> +};
>> +
>> +&mcasp4 {
>> +	status = "okay";
>> +	#sound-dai-cells = <0>;
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mcasp4_pins_default>;
>> +	op-mode = <0>;          /* MCASP_IIS_MODE */
>> +	tdm-slots = <2>;
>> +	auxclk-fs-ratio = <256>;
>> +	serial-dir = <	/* 0: INACTIVE, 1: TX, 2: RX */
>> +		0 2 1 1
>> +		0 0 0 0
>> +		0 0 0 0
>> +		0 0 0 0
>> +	>;
>> +};
>> -- 
>> 2.34.1
>>
>>

