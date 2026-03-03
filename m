Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41916EC145E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4uzlb6+hHaPlr/Yshxvd75jEvsk+bpxsI3ICC2PcsQ=; b=JBR82YLBIx5DaFTlqHHfze/ZoG
	Pa7z43uqGWU40j7tt+bwYdPeosZUXfR8pQUM+OgRbTsJfo+Aade/im+ffAE4TMAGh3+noPVVd7PVZ
	FVE5Njp0HzHmEEPORAqzNBUjA62l1k9l88JgvzwuAHoIUiP/FdBxQoGyzs7OVuCBApu1Yd5fvltkC
	IJ/XEk54C3WqSj+VgrmkIEUOx+35P9T6D1IFswrHBwoCFX+3Q8Wp4zOrrDP8+PCASq9lOrdv/yVyF
	o1pSiS4KLp0i9NrzOTRWwKtva5EBvA1sNdxdUsDCQ5fE4j3MHdxlmEhLwbKfTLaOi8O2qMPUk9KSt
	Jvge1QMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRGe-0000000FNVR-3Hkh;
	Tue, 03 Mar 2026 15:02:36 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRGa-0000000FNUc-3myC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:02:34 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=K5TnNiD8Lg5jEjWrohOar4qJS2DtMmP+jVuggC5xFFwvrt6VqPAunfh43y+DatSds/+gex9vh/dEMfhOMSreCuNKwdv/4VgrnsOWJxVt+4QEo8oif4GcCFEkEn6Cq0XhjpZF6/Yza3yI5Xi7uWhLLX9/9KMdDvG56WLwji1gWwtOdOUGCcw//NbEDpv98/L1cStI+gwqXjkBDc7HELO38Cd5fHLsshhk5i0BZM5nTN5R3Zg9beQGR/vguTR1c6gby2hMqA5aLLodJA4rK5T1dxhN2BcjpFMTOMduBdKW7eJOBX9igyJqqRk/9vx3beGAKViK997pxvZ0ChtbAcuL9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4uzlb6+hHaPlr/Yshxvd75jEvsk+bpxsI3ICC2PcsQ=;
 b=SpT3l+E549MK1xttmFMnOoWRpm6lrWDnNuDr6HRRm2gso3YZcRHtfKpzI+8uQNRf4FNlyh9as4pqyGFYnA6r4Etuv1n0NuSrTZGZ9fHX3LQDq/y/HQaTjnujj5Bmi3vaBicRooUalFLiToY1e87+ibGbmCX10Jv9HnzDRTMjgejZfqGVT+MRHMND9tkvCWjMlaBCov3MWtN64GTZLdTrCXcnu+4R+E/wVBgtAW59GZ7zsuIq94SBczh9AjZjm+EhM+x2WnigiYLGOR+sNJohdrOb48WpEzzclVfek8TZ3TR5388e70J4jX/6zEabFev1igLajgOYLBMPdWCTYHnqpQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4uzlb6+hHaPlr/Yshxvd75jEvsk+bpxsI3ICC2PcsQ=;
 b=YQPrgcqkmoJjKvDLISs9FKh1fIILSfDHdB1fxh0jQ5QZIy7ZRaWiHYpbRUEe5D86yGW3Lkm0kBpFDvR7xdBuQrKq4Q7F4MpkS81LltqkqpJmfp229tYaG80UzGs6RLwZcUiWpXW93nusKdxTViozwJGpbIGTBRux2lOdhJbb9GQ=
Received: from DUZPR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::9) by VI1PR08MB5325.eurprd08.prod.outlook.com
 (2603:10a6:803:13e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:02:22 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::58) by DUZPR01CA0049.outlook.office365.com
 (2603:10a6:10:469::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 15:02:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Tue, 3 Mar 2026 15:02:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InVhnKRWR6EeVegGsPqwC7H36crhozTN1GDDPFCzeGs0xAIuvHxNjZPoZ1SLJjTcqqbtQpi+BezaN3q7KcYU4MAlfRLVLg0fnOUMCe57LZOqEcejzYp9qoz6qiUPEJfgQzmUcHORNw6P2uuuXET1uR5X/O+LzpEHv3/uPIsfcPNNqrZPXJ8mUUiDe3UYF9bDlPqE4C2bmVi8McC6TaRChK07bVD1bZd7co41+TG85LkluRRVWlQtQnXD+WvFJ4lJDqpC7KjTUrX8pMyK3eAbWS2tZzB5kxTErmgIDBH7gyUkEZXmghu/gzSa2E7b4gFi+RgXH9BoXp8dLKXECj/Uaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s4uzlb6+hHaPlr/Yshxvd75jEvsk+bpxsI3ICC2PcsQ=;
 b=XnwRKWldjvJ5VmHdBoTsr+q3ywhTSN7xQRX6yMjXx1DKC6u4hCr+NCh05xJ3urstrGDcFlgjniER1H4yw8o0NLwCiYzEGQUffdAUVePBxFDFkYvnTlH0r3P1QkefnaaRSlF59QdhYUERQvtGKYYM8bkIiPl2otnwBV8grEwtZgnlCRRFUhkt9D+HFz/6lHHl1Y/FcCpLObb6HXM22cFVW1hLxJAplHAtVHwMnreoqVKL4bSJwC7HV/XwzXz/97oB6ZqumGF1pywxxJy02KB1tbrhm1l3m5xI+KGjYI7bUxdOtVdMkReIE/1IFIhB1QDVEdNzqZ74vzZbiwnqiGySxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s4uzlb6+hHaPlr/Yshxvd75jEvsk+bpxsI3ICC2PcsQ=;
 b=YQPrgcqkmoJjKvDLISs9FKh1fIILSfDHdB1fxh0jQ5QZIy7ZRaWiHYpbRUEe5D86yGW3Lkm0kBpFDvR7xdBuQrKq4Q7F4MpkS81LltqkqpJmfp229tYaG80UzGs6RLwZcUiWpXW93nusKdxTViozwJGpbIGTBRux2lOdhJbb9GQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by GV1PR08MB8179.eurprd08.prod.outlook.com (2603:10a6:150:91::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:01:14 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%6]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:01:14 +0000
Message-ID: <b5c6c62e-ce3a-4fd0-8c9d-b51b7cab3802@arm.com>
Date: Tue, 3 Mar 2026 15:01:13 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] KVM: arm64: Disable SPE Profiling Buffer when
 running in guest context
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Fuad Tabba <tabba@google.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, Yabin Cui <yabinc@google.com>
References: <20260227212136.7660-1-will@kernel.org>
 <20260227212136.7660-3-will@kernel.org>
 <b6f0b0c8-c2a6-4b61-a0cc-482450c092f5@arm.com>
 <aabylhEFnTUR0WTy@willie-the-truck>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <aabylhEFnTUR0WTy@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0055.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::11) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|GV1PR08MB8179:EE_|DB1PEPF000509E8:EE_|VI1PR08MB5325:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c77ebb-a51f-4857-e86d-08de7935df94
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: 52KJ4LFJ578NKJ5aynV6UND+adHyCC0rFkxF4Hwnnu4FBOeMEcKJcCbQ5pTr3BpL8SUsPjxwsSJFt3ODKuRSX3Jz3lti8v9ve7nlRh2o0Qf0Y3t6nhig6V1WrM43CmIgW0wCr3+maa2mlEowGPNlYVdI1V7aSlRkE+vjDu2gzDuFUAp45yasVZe9qS4PRRQ4l4U0iFq85NG0RbiLwFrQWE8ch3A7VQsY9WCFNEfTBQp0tiHRI+Poalae+c9jQEm+KkwUOvY/QbRfkbD6NV50urFZYeEMkIe02mqvCILGTibCnzObyFh9WPWmF8DVFs58Oej2R5jTtMjpeeXJo2dZnA2NSDbU8fiFotY1ZcJdtxvQpKCqe/dIm7k7rMaA7kBrzEkgBv28g+V9jAxwKEJn/ye7O9TUuEnPv6UfC+8pu3VkAPlOU5p3yW50XzOm5tkgrZq5wP7bZuFdkArz0Vvu3N3i+ZBPYzMfvV1mjtulJYq0OwpA/dvH4//Tc9AzbYG+Ea7RbeWT/txQWO1KSrpQn8Vra75gZgQNyex4iO2QVO2LT5phRgN7jroUK01cdWcW62DW5VGB5472PXObnfsOYdtzy/8XBiiPc2btxdxaWTCs4gyZW+sd9gY6o/KKBTY2tqcYNhzKVuTQEb6B2pPvjoNmPbaxN/zIu+tqjjEGeymRlK9KNPlX+5f48NZRugT37GsUO2VoaXPnCQHVngvDgbEE1aTCyrD5H2mrlJZdDn4=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: JgdST2qjxI6+B7D/i1NGOo+q0PqZogDQBQ1S0U4HHPiAFWqllNnZvKvWJhCjACfkamF2JZIo4GxnXRzhb5GmiHf2gPLZM1sIbqBjaGxMUd/pnHZsF0lhqQ5iiNp0jmy49jzsxsW20VdpJ6O3zKT2Kl6qmISUQ1Md7tg3cbi+7EmYNk7qosIRd5mRfhCDMNhIxBO+WlhGkt2ogDUd2SrZY5zq/neZsdTfnxwsOQdY82sAl4n1a4S/QSVXzb9qjhkuD7X3r5I5Gw6n75VCwfHb5faHSxKYXwhVY5uI4X9l3xKQWr3G9kzzPFfkFxUbW93vqmOw63YDa54lEslYyEvLFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8179
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: edb1c84c-f7e7-48e6-68cc-08de7935b6ff
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|35042699022|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: fhuNxTcvCHTIoclN88P2q0JaeHBWQRcRMLjlMq+PLHN6hbT4cZ9boDC6GSGi8toBvu2OdwvPBYj1MZlfJ/802lQV0ZtOQALcy6aBBat+O44XTweDkl4va29oQdyCzELAufEOm+T5oJ+KBHD0Ut9y/VPSb8V5F0jcFe5717vtyh32ITq7ylkJBif959rH/uXmEKYiXZLRgLacgnIm8pHuSkeZTqIVb7f1XCDhZ33tsd+r2aSQKoeuf/WYpF1rmkFf5gFz51yJndLEWrlh+UAeXQ2ZHlpxCt1isivyxraEIQjp6RpsBCLEfoVwGfh/kMnN0uEaHgErzvQCLNzdfUf3vDxhQPchOzwkHvxeTjHrio6oVGvGIQG7auNCNWWUQC751SfPlrVPnAzKodOUzqJLPVP6GJ7Cwds0npj5zuAXm4LbKIc6bWg9dxhoHGQvnz101JF10Hbozrf5xRtNZXtQ4Y92aNdHRWNSIETzpqmtV9LPGjQrOy2T6vCucDKLKB1hEO3geJbBsXiDJWWAuezRY+O7WRb+4muI2eK2fBWHOxAtAyakBA/m7dgIopWMzkeEsr6+1VQkFRK1uMkZlkD/0jyB058+Wmkj2la4zrs1f4qvjRImK9KiPJtwq97/FhvOCeoJqPFrOuLSNUVKCJwhbeId18VL+p/x9gjcWFNH016MLWu75ZzsEL2UpuOXm8XN+cJyNDc+Vr3ZKecZEJ5rH6h7gxOUG2UdStUxulJ9I4TEfQXLaaMNMISTgQ6YELjo39eWxQSuqj6NPBLrMPvYcUPqQyWDYWGffKkULakSnHGDBcLFlGSIEFdqYG38foJL9dmKcTvJVJE/7dm2LJuWBA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(35042699022)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xjfbg1Yy/iYYwtvd83QP/Vk6Hocsiv/I1Ary/USeBSBYiNUFps9tcYb291qUvUTFsCKvnYrWwronXu7aM+W+POFvYJM6/8qwZ3vTZcULs4fXFPVIbnYtWJ4nRldGqH1S29BQ70XiT2L5bnGHLOG7giBSbEXSL3e41hYKYwpIqxapCsOswAAxc1ukoMhd4/grxN3J7j5w8O8o7Qrm03q0jVS7JxVzbMFKCkxOgs3BBifMBbMiaAVbsycAXyOojETomiuDQOHNw5FzkUcDxDOeAEU+foMUJEKzQx/qJWDrEG/saOX5/Zo/TtCyqsaA+rRYsp2cjlRlYwJu/UWaSBHwT/OloJjlvenab6nCuIGq0/5BeHIOgUqUFfzsj1ugrrBAFqYUWFS4pTfutXcsI/DWTzduCPJ5QHGOUxCwwz9qQPIKWAzJ1zYaRRnrZOoWAKLS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:02:22.3472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c77ebb-a51f-4857-e86d-08de7935df94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5325
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_070233_116963_2A5E220D 
X-CRM114-Status: GOOD (  22.49  )
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

On 03/03/2026 14:39, Will Deacon wrote:
> On Tue, Mar 03, 2026 at 09:48:06AM +0000, Suzuki K Poulose wrote:
>> On 27/02/2026 21:21, Will Deacon wrote:
>>> diff --git a/arch/arm64/kvm/hyp/nvhe/debug-sr.c b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> index 3dbdee1148d3..75158a9cd06a 100644
>>> --- a/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> +++ b/arch/arm64/kvm/hyp/nvhe/debug-sr.c
>>> @@ -14,20 +14,20 @@
>>>    #include <asm/kvm_hyp.h>
>>>    #include <asm/kvm_mmu.h>
>>> -static void __debug_save_spe(u64 *pmscr_el1)
>>> +static void __debug_save_spe(void)
>>>    {
>>> -	u64 reg;
>>> +	u64 *pmscr_el1, *pmblimitr_el1;
>>> -	/* Clear pmscr in case of early return */
>>> -	*pmscr_el1 = 0;
>>> +	pmscr_el1 = host_data_ptr(host_debug_state.pmscr_el1);
>>> +	pmblimitr_el1 = host_data_ptr(host_debug_state.pmblimitr_el1);
>>>    	/*
>>>    	 * At this point, we know that this CPU implements
>>>    	 * SPE and is available to the host.
>>>    	 * Check if the host is actually using it ?
>>>    	 */
>>> -	reg = read_sysreg_s(SYS_PMBLIMITR_EL1);
>>> -	if (!(reg & BIT(PMBLIMITR_EL1_E_SHIFT)))
>>> +	*pmblimitr_el1 = read_sysreg_s(SYS_PMBLIMITR_EL1);
>>> +	if (!(*pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
>>>    		return;
>>>    	/* Yes; save the control register and disable data generation */
>>> @@ -37,18 +37,29 @@ static void __debug_save_spe(u64 *pmscr_el1)
>>>    	/* Now drain all buffered data to memory */
>>>    	psb_csync();
>>> +	dsb(nsh);
>>> +
>>> +	/* And disable the profiling buffer */
>>> +	write_sysreg_s(0, SYS_PMBLIMITR_EL1);
>>> +	isb();
>>>    }
>>> -static void __debug_restore_spe(u64 pmscr_el1)
>>> +static void __debug_restore_spe(void)
>>>    {
>>> -	if (!pmscr_el1)
>>> +	u64 pmblimitr_el1 = *host_data_ptr(host_debug_state.pmblimitr_el1);
>>> +
>>> +	if (!(pmblimitr_el1 & BIT(PMBLIMITR_EL1_E_SHIFT)))
>>>    		return;
>>>    	/* The host page table is installed, but not yet synchronised */
>>>    	isb();
>>
>> minor nit: This seems buried deep down in a helper (with no context of what
>> else could have happened since the host context has been restored)
>> and for now it looks correct,  but is prone to inadvertent changes
>> causing issues or making this obsolete. With the isb() following LIMITR,
>> wouldn't that be  sufficient ?
> 
> I'm just inherting this from the existing upstream code -- see the isb()
> in the existing implementation of __debug_restore_spe().

Of course, it was. I should have added "not from your change".


Now we have:

__kvm_vcpu_run () {

   ..guest_exit..

//load_host_stage2() if required -> pkvm.

__sysreg_restore_state_nvhe() -> __sysreg_restore_el1_state () #- we 
restore "host MMU context" here

  ...
__debug_restore_host_buffers_nvhe() -> __debug_restore_spe(); #issue isb 
here to sync the  host context

}

and the isb() is placed in the spe restore code. All of this is correct
and I do understand why it is there. My comment was, this is not easily
relatable and prone to errors with inadvertent changes (e.g., moving the
spe around etc). But I agree that we can avoid the unconditional
overhead over the code readability.

Cheers
Suzuki

> 
> The isb() is needed to ensure that SPE can't start making out-of-context
> translation table walks (which can occur once PMBLIMITR_EL1.E is set)
> before the stage-2 MMU is restored back to the host configuration (e.g.
> by clearing HCR_EL2.VM for nVHE or by restoring VTCR and VTTBR for
> pKVM). We want to predicate it on SPE being enabled, otherwise it's
> unconditional overhead, so I don't think we can move it.
> 
> Will


