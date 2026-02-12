Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14329EEA864
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 22:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgRApiQ7lh2AV88jsmsHe2HJ6OU3kV4ofWQHAdgT8Xk=; b=1KqeqbwFbBvyPV187Ny6uziyKB
	v++mcEHO/u2dWC0cOrJ+vFEajtitYaWy8WuX48alHRTQdAQPlDem0riGYpQZ2iHmiiCPKplTXl0xz
	xZKgHwCt1PRSCe8JOxB/vpHbeJX5r+vT1UKwmif6jiuK7ovmX8DxpXI49jXmFpacwW1DR5Abtwe91
	j9B0fo76E/WCKMlNkDQrycWWCx+IXhDtmdUlabyHI8mDWWRbBDA4+t5RiLC5yfq3Kcjn7XU5+z15/
	ls9wTd5KOciOY+zG3GajNE7odLDpt9A5sJGGOuRpFEK4+Ca0uy3juNxvdNgXzXiSv1rSV2ixO5jJf
	lLjL/iKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqepl-00000002gaq-2ZxK;
	Thu, 12 Feb 2026 22:06:49 +0000
Received: from mail-westus3azon11012029.outbound.protection.outlook.com ([40.107.209.29] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqepi-00000002ga6-34Uz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 22:06:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mw72jNNvm6y/r/SAWiLG9Vfyu1IusEVVCaoatHuJrzBKS92hCDNHb7/e5rNJCcW6Wip/8/w2taqjvHbAJYAvGj8ryP+wuKMc1vq2G6HL10vXHAWYtN7biGIO8ASCkGdrmCbgfezdfX72CcIyj5a4txWQ9b1V1vJaTUYeKN6BUcaMYG5J3kLTlYeQgz5H4ZFxFwKOX6r6jRIRj8oJ4WvqTyEcNq/r3e0p1VJsN2wGoAk8SDsGKHpiiWA5/VhjELm0o1TvbvNC3giMv+VRFez3tcPWCreW8P+FYbN6r9iOZZ5R3jyW9kGZ6mfXOY6A+THEwNTz6y9wENCOWj2fJdVEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgRApiQ7lh2AV88jsmsHe2HJ6OU3kV4ofWQHAdgT8Xk=;
 b=fTrbvEJGWOEG/40qiAqJXdc0VLQpQdIFqEPbjm0dyxPD6YzpDkEgTxSMpfHImH0hC6DKlYmvS2q5PfnsxyvE21cwgTA/5DTQtONkKmKpPEQtOxhehAiws5LLaPjJIuTA/fUrc1o2xBYMQUWRolceiGHn4cABsBTD0oZGnHEsCSME4gDjyC2GKPAZzRb8Dc7EoOpz129y1OHb1p97U2Z0Lmf+ZRi2jzb+7HYBfsSz7aeGZwPJVDkLo93i7RVgWG0qJsjaRxXkr3FHEfrVabAZp6hlq3ZYLjWfd3jQ4NzJddLXisQ9DttFQTkFlYAZFD3nO5rZ1yt546uD4v6DqrhoqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgRApiQ7lh2AV88jsmsHe2HJ6OU3kV4ofWQHAdgT8Xk=;
 b=l6bX6iXg+z2VFTrNTtfx2fMh30Hs4bYFxnTRlltb/FWLYRTGHv24xyMQrQl2e9BMont13Mu8GvGtbgrFOuh7ZEX5Jnn4p5hIwG1CoedYhdRfY41d5mmc9uDNfJCQeGcFYI4e53WaIMQul9RXML2b1pTaqpYFJYiObCEAVpzuppg=
Received: from MW4PR03CA0121.namprd03.prod.outlook.com (2603:10b6:303:8c::6)
 by LV3PR10MB8034.namprd10.prod.outlook.com (2603:10b6:408:28e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 22:06:42 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:303:8c:cafe::e9) by MW4PR03CA0121.outlook.office365.com
 (2603:10b6:303:8c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 22:06:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 22:06:40 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:06:40 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:06:39 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 16:06:39 -0600
Received: from [128.247.81.19] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CM6dXR3816226;
	Thu, 12 Feb 2026 16:06:39 -0600
Message-ID: <e92ec82e-63b4-4ef3-b6ef-4b0c3743a8f7@ti.com>
Date: Thu, 12 Feb 2026 16:06:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: boot: dts: ti: k3-am62l-wakeup: create
 label for target-module
To: Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>, <msp@baylibre.com>,
	<khilman@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20260127-v6-19-wkup-uart-wakeup-v3-0-e7ccac761f3a@ti.com>
 <20260127-v6-19-wkup-uart-wakeup-v3-2-e7ccac761f3a@ti.com>
 <3bac0dc6-6e58-4a04-a0c6-a6646e261f6e@ti.com>
Content-Language: en-US
From: Kendall Willis <k-willis@ti.com>
In-Reply-To: <3bac0dc6-6e58-4a04-a0c6-a6646e261f6e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|LV3PR10MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b865979-b2e6-4f31-f7cd-08de6a83001e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm9wRm4wOXl0QmJxN0JVWDNLeUx3M2locXI1YUIyTFplaEdIa3VmVGlVR1JD?=
 =?utf-8?B?RVR6K2JCTmJxQXNxbmY2d0crd3VZTjRwVVFKUUlZdWpSZy9iQ2pOcW4wN25G?=
 =?utf-8?B?M1pkLzJ2YmM5UnRLMnRKWTBoa0FyZi9IaUJYSnV5SFZQeUlLT1E0WllNa0Mv?=
 =?utf-8?B?YUluSkZHNk9GR2pEYTMzb2lBNk5oaVJ2ODBLVTliMGsyNTVBVHV0VjdlUnVH?=
 =?utf-8?B?UTh1NFk2ZTZ1cEhuSWQrNFh5c3NTSENiR1ZTTFl3UWxFZG80OVl6ZStuOGR1?=
 =?utf-8?B?emNlRnBBR0hvN1J6VnFvZkFudlErb1ZWb09DWXJpeno4aHdYckJZSklIbjRO?=
 =?utf-8?B?SGJBdW5kazBRQk5vNDZSbFQ4WG1ZUDhCYTFINXVKVUtEZVVzRnFNRk1zVnA1?=
 =?utf-8?B?VlNicVRrb0FBdkx5WXh1SWw2YlZZL3pYa3lldGRGTlc0cWNFLzNTeDI0Mnhh?=
 =?utf-8?B?eG9WcjlnOFY4OStwSm90S0lPYTlsNEZCeXdPcGFEKzFiN3JxTjBPWnk0ZDR2?=
 =?utf-8?B?YkRMV1dhM3JTQVNkczVINGhrRHFGWDc4YUpRUTlHYVFaUEVqVnJNRVZGS1Qz?=
 =?utf-8?B?UElVeTF4ZmFKQ3VRQ0p2KzFEMkdBZnNlMjNsMG5zYVlKbDJRc1g5K0tLUnpY?=
 =?utf-8?B?ZVJ6Z09EVnhqNHIzUTVBNjIzODBOMk5Wcng2YzJmSTVaeEZkb3RBVmd3dUZI?=
 =?utf-8?B?RitidDV4NWlRb3dGd2JjNEJ2Z0h2ZnRXYmFvTTBscjBPMUpJNk91aGJFdUQ5?=
 =?utf-8?B?bVU2dkdseUtlRWo2bWdCS0twZGdySi9hOVJvMG8wYVhNYXN0QlFxZUYyMEhO?=
 =?utf-8?B?S0dweVZrWWFpTUg0Vk1BSk1nZjNVQW5QRVJxKzBEOUNZWXUreU1GdDBqanBq?=
 =?utf-8?B?UDFGVVNSWGhsNmgxNGM1L0s3WjV2RUJzdzRRZVRsWWVrcExJMUtVQ0ZBcEZi?=
 =?utf-8?B?SnBEQ3VLaS9DNFFpTDRvcVZ2QWFRTjVmT05UWFNxR1ByWkhxd3BpeEJmS3Zk?=
 =?utf-8?B?TzdBWm9xQmZockJyNS9OeG1LZFkxYkVWb0JicVh3YkcwejBxRFpqeGRtdlZL?=
 =?utf-8?B?K2FkMWVuUmg3Mk9sQXM0OEpDYTVseDEvNDdWakQ4TC90blFZRDFwRlRLNzhw?=
 =?utf-8?B?bExERnlmaEVWTHF3THRyY05aYkdYQ0pHbXY1OUZ1STRxZXV1VUhJYkhqcUtI?=
 =?utf-8?B?MUJVbThzUDB1VDd6WThXS2Yxb2RYekxHdnQrNVhMNWNpVzl1U013L2kzTTRR?=
 =?utf-8?B?UCtMemU1RXE3ZmwrZkp3Znh6RW56dXVQR29MVTVoSFBkYnk4aW0vSGtqcy9j?=
 =?utf-8?B?MDVRSndmVDJLQzNmRHN4M283UmJ4cGtWK3hLOWZwU2JxM3oyUzZBNFg4M25j?=
 =?utf-8?B?bE9zTzdhTlRBYUZBZkxMVnlZdW9XbEpCUHQwY3Zsd0JDcTFRbnFLVnJQR2Fl?=
 =?utf-8?B?T2ErdkdoMU8weldUaTNOMXRkY2kvS1podUh2b0NxbGVGNFE3dkVYMlBGV3Rt?=
 =?utf-8?B?MFFrMjdOOFM3cHVhVDMvbzJ2S2Vqd3I5cnBSL0hXYTFtdFZla1NpdHdxWjJY?=
 =?utf-8?B?a3pkRThBaGdzcUM1RmszbzhTYVpEaS9LcmhXYi9qWXE2dkZVd2djekJOMHg2?=
 =?utf-8?B?aDBTR2hqT2ZMTXppTHlSdzRoTTc2NlRVb2dXQ0l0UHFrNzhUSmRFUVFnS1hP?=
 =?utf-8?B?RHMvcjJBYnVHQVJOUkJ3TEdHcW0zZWp5RHFWQUU4dVRJNy9namNIS1JRWTYz?=
 =?utf-8?B?K3I3RG1wZFNQUXoxeFRvQ3dqeG5BSU5xZTJrN1JPSzh1djBkWndsVHo4TmQ4?=
 =?utf-8?B?REpHakdnQU03NzgwbmhzWStUVE54SnVjdkhmdWZsMHNQQTFMK2JoQzNFNDcz?=
 =?utf-8?B?NkJjM1lwOTd5ZWplczRWUDliODYxTEJNcXg4ZkFTWUtndDF3QURyVmtxR3Iw?=
 =?utf-8?B?UVZEUlhSYzMxZnRFdnJ4STlpZ2oyTUtoYTRURzF2bGx2N0VSNnkrYlZvT0hE?=
 =?utf-8?B?ZGx1ZGpXbzdwUmJhUUdNMy9JWmlTSDRyL0s1NHpjdk1wTkpRZFQxWXBaenNw?=
 =?utf-8?B?MTJqT2E2RnRVY1FIVzkzZXNjb1gxb3A3SjRMQm5naHhJazVwajlVNVlvNVhL?=
 =?utf-8?B?L0tZS25BNWFHcXR2YmQ1SFFvSG1oaDlhZFNBV2ppU3ZjSHJIOEVVSlJuNW9B?=
 =?utf-8?B?TkVETWYzblFSZTY2WHAxTjhHL3ZhNGFCNk9QS2NzR3h6SnRMbWJrNWZyeXd6?=
 =?utf-8?B?VmdaYVZkdjVaQ1IvN2ZuZyszTEVnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wTBmkklNa6G2pOUcNTmzfc2YIpZnR9cMWU8cEgCZX1/ypNUx/TSZ4bamZdiK4YRO1JpRGUh7yQiBrpCI8q3fWM5Xi879hTQNIARkiVqvTdyIdwOiBiiBejJ6Hvzs/pfQjJLbSaOldAGyrgQ6P7JZ+24UtZAh4pvb/yIaEenZdlLZ+Putf7XabJC5UwkQiotey7PPO8V/KzmmkpxJrOjYWihPTd9WFYx1rlSHWlAGTVVurnVpSUUxNJUAe5YPH3YG27TF9yzHx9oTjxqciE+oqj9oTULYyngp+mFmO92e4n653Y40E+jZ2j8t81640ljk5POqvIO8tI54SvTAPRHQzsue0UJQTMwvDBmVBZ5a6/ClZjLyb68FdDQQOl6I6hCNncO25DXEygieQu6cwgBYDtr5GGik21PMR+B00fZdGtD2I/V9tlUP4nQU2cNoDRZ5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 22:06:40.6924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b865979-b2e6-4f31-f7cd-08de6a83001e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_140646_798667_381B325C 
X-CRM114-Status: GOOD (  13.95  )
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

Hi Vignesh,
On 2/5/26 22:41, Vignesh Raghavendra wrote:
> Hi
> 
> On 28/01/26 04:09, Kendall Willis wrote:
>> Add label to the target-module node so that it can easily be referenced.
>> The node specifically configures the SYSCONFIG related registers for WKUP
>> UART.
>>
>> Reviewed-by: Dhruva Gole <d-gole@ti.com>
>> Signed-off-by: Kendall Willis <k-willis@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
>> index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..e9d638d9ffd3a52aa6e0df70f6003879bc292358 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
>> @@ -81,7 +81,7 @@ wkup_i2c0: i2c@2b200000 {
>>   		status = "disabled";
>>   	};
>>   
>> -	target-module@2b300050 {
>> +	wkup_uart0_interconnect: target-module@2b300050 {
> 
> This is not an interconnect node, so the label is a bit misleading, just
> use something like wkup_uart_target or something similar to how these
> are labeled in arch/arm/boot/dts/ti/
> 

Will fix this in v4, thanks for pointing this out.

Best,
Kendall

>>   		compatible = "ti,sysc-omap2", "ti,sysc";
>>   		reg = <0x00 0x2b300050 0x00 0x4>,
>>   		      <0x00 0x2b300054 0x00 0x4>,
>>
> 


