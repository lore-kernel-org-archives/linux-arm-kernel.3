Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E942ACCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwouJto+YYIBvYAnaXluBWKm1OJ8cLIoTk195ZIbn+k=; b=0jwlF3KLQA3rrPilfN1rBgaC1Q
	jG62YvxMC11z3Fq/8hMWJCC3cHyRWI7QhUgm6C3wirJ78eNANTEseb621uQRLGgDz+LumCUux8OLg
	2XzLU02EAZEKmMzKEqgJ7oXAgh/w7mIHsyma+sdMws3kUEJdLS5q6OuSAc3kNWsHvxBvvX+1JsZ85
	leh6uWb38AEBT41WgoqcD1qUmkQ/QcmKY5do6xZ0r8m+qJqAEPVyX8x35cv9DikP/tJgMhUL1EvaD
	huSFR2cUnaTJpALbszzBirLh8dq2nh40eSk/nTOVOxz+HcWX6JHf3X6MTguD0qFpVzb21D+YcsLVa
	nILKN0Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FQ1-00000008vrx-0oLC;
	Fri, 10 Oct 2025 15:52:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FPy-00000008vr1-3qhz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VwouJto+YYIBvYAnaXluBWKm1OJ8cLIoTk195ZIbn+k=; b=ALYr3xI9h5L28V3/TKra8ZbQiu
	SXOKcb/R75P0MamyRSHZdZD/L9JOYpEFf+Th+fJVhjtT/MSt73CPLx4icK6L4hR011G021vYHNTUp
	oGIECdWOrxY+jePUEaOWPMNcmueMK178YWo6tyBT8YVKsiu7fPhukFYV3HtfrEhGPpsa3UWtJYnBc
	A/ZDbNjaPd3N0wqQI25D7MD3dkVPl8aafVORdrSjD7mBvQCYfVjXBIglTpN+4Mu/wN36skIdVVTkO
	nDK4CrwJvATcRQRTy60LGScl3/lAfk5PUDtYF++nzVI7VkQr9RUgs4teV0F/6cnyUHpWFvSJqr3Sf
	qBuRXJvA==;
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FPv-00000002GND-38eV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:52:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WvMVMU1J9IbjGE6FIv98gjjmKm/hM3HDJumbNXooCBmbdJRr4SpyC8bQr93hCy5IfBZogF/GJ37ZMGz4vTG8LIFdYVV6tUP9SefNguHWOWxLHXEWpK+ZsmJ8OqJ85mLpfXZF9qCSyoPLum8/hb0eov+8WGCk2R1nqD4sNinTDHo6h1e8fIZKdYC5FVEV7MTjqOoTk5w9S9k0PkRQojPCzd4SfikBGV6x7Buoc1YS1f6BvpK3MiUTwrK6BDVwSXjY3Wrp1fGwgy/z3Wy7CeFeT73d38jAOk+q+ixfTAqYqnmQIDCAt/BRQ25DjSGszy8SN/4R+isrK3SRd9jwP2YYNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VwouJto+YYIBvYAnaXluBWKm1OJ8cLIoTk195ZIbn+k=;
 b=V3xevQPJfIP7VL2JeyX3A1c6ZOnjCAxUX51+hXIVvh+2doefmy984Be7fkKHLnmVDmLh/FOn1GmlqEUu2d1zSM6hIsXRn4iB9312md6/z2PQAx5koJFxoLlzjhGyKcjtyfEL2lp0NuRDYAVvQqiMwBkS8yVa0+sc9dkLLyqVQ8YeCsFYGtSDLGGycOHSxehpfmzor7XK06OCj1j8j/0m+vsIjpkynEZYqNXZWweRMBQMXu0zF9IKr4chc+es9NSLC4iSUKo3Dol7PIoVkcDKvDRUaNT03yqavpgqQbA9bq3QreIe9EanL4tNjpW58hMjAm1IonuwyD7aUGtTuCI+0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VwouJto+YYIBvYAnaXluBWKm1OJ8cLIoTk195ZIbn+k=;
 b=KfqdaD9sq/rBrM+oG05kExTYfJ5rPiPnw0vtOVV+fSfW11hnTOgvvT/MzoH7EKqg0+aY5b+nkpVapHbs0m+w8uVCnFqWn0M7zvbeRGdDPb4X+PJDUVmD96/JYnYUykAZAzBgwHFaW2aVL+p7TIO4hkU9HVLO6J2aulMFxQSAyIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB8190.prod.exchangelabs.com (2603:10b6:510:291::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.10; Fri, 10 Oct 2025 15:52:18 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 15:52:18 +0000
Message-ID: <c1afa431-ef27-40da-a15b-06674a72f7d3@os.amperecomputing.com>
Date: Fri, 10 Oct 2025 08:52:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
To: Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 david@redhat.com, urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
 <831e9e0c-a61b-40d8-a8d2-747b760ba6b3@os.amperecomputing.com>
 <6f40ee64-6ef6-4741-8319-ae330df881a9@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <6f40ee64-6ef6-4741-8319-ae330df881a9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:930:1e::7) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 766f21cc-90ea-4d36-720c-08de0814fda5
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3dhWUFtNmdOT3NHMWplSG9tQnNZZDVwUzdYeFN3bVlsMEZ5bko0YnhUODdm?=
 =?utf-8?B?WEU3WnBjcitKck5ySWZuMGpMZitTRW0yU2orcklOMkFkVjExWEtmS0gxNnlD?=
 =?utf-8?B?RXNqQUNWS1VMcXErQmVDcE9Fa1JxYS9uTWM0YXFFdzc1QS9janFlRDUwaFg5?=
 =?utf-8?B?a3dEVmdPSWdWVFRFNTN6MS9qaEhxYjlqenFJVk1JcUpYRWozVG9UNUJPQjlh?=
 =?utf-8?B?NERWLzVoWGptMlNxNjNMdHJTYzdjNGhQVkhWNXkwbnNiSmp4M3lVRlRhUE5n?=
 =?utf-8?B?Vm5LMm5RS1YxVmlPTGoxWTROOUFMd3pXSU9hV3BTMklaUjgrT1k0Zm1BTk9K?=
 =?utf-8?B?VXFBZkFPSnAyMVIweVZXZ2hhQk4wMkpLVnpWclhzVUFWNndBa3ZSVUtYRisz?=
 =?utf-8?B?UlZER3RzbEVEYzd1dkRuckZxZW9vTVZwNENSMU8xN2dwdzJ6a0NTa3ROOG54?=
 =?utf-8?B?ZXpuNlYrRmJ2aXg1VTJ4VlFaMmFrRUpmcGh3VGo5Z3l5R2RZUU9LVHlrVXVX?=
 =?utf-8?B?aENVQVpPcUw2bXBLb25jcDh6aGVPVDVwVHp6clBKbGZYb3ZCOER3ZDhKSEsx?=
 =?utf-8?B?TnlmbTh2anNSQ2lRazZ2MHlWWGIzZU92QU5TNGlrQWxpT21TaXE0NWF1b08w?=
 =?utf-8?B?UnNkVkl4MU03L3Y5ek5Dbi9BQWNGeVhiTytBWmk0VW9nb0lueGcxQ0pzTzc5?=
 =?utf-8?B?K2hKdEtjTVhFbUlHNGYzLzRKb2hDUjhZYXNTc2ltblRlWVRqVXBuUkZKcmF6?=
 =?utf-8?B?Mk93eHM2R0RudVlOa1ZkbEh3UnhnZEZnMDF4QUc2a2xxVG1DS2lhYjU4blVY?=
 =?utf-8?B?Y3ZHeld0L0lQeGdrSE5qdDl1SE5NdVkxU2UwTTBSSFlFREpITzlYNnRBa2lz?=
 =?utf-8?B?Q0wxdWZXV2RqclZtMHJKNklNMEU0YzJYY2dTeW5HYnVZUkl4K3hYSFhkZ0pq?=
 =?utf-8?B?ZXNVcU82NzVVN2RVNDh4U0dNSThiUVlOZEhmcXVDMkxLK1czNVVuYTcvZ29M?=
 =?utf-8?B?TmlWWDdKQ2RxaTJ1bkx2RUVzQ1gycmhyK1RzU202VXNkTk9GeTVBRlF5STJL?=
 =?utf-8?B?R0Z4NHQ0RUVXK3NIeklFT2Q4dlVYbVcxVVYrMTRrdHgvYkZyL2NUT3hsU3o0?=
 =?utf-8?B?Zlk0TjNVY2J6amhZYW01TnVvTDNvNHA3UTV3RlIwSUZiV0JET09XdTZzNk1H?=
 =?utf-8?B?L3ZQWWEyM0p1M1NzTTI4STZsUjltYTY0Qk9vSlNLdVB6dGJnVWRpam50MXNT?=
 =?utf-8?B?VGE2YXAzMnNud3VRd21oVDM5eWVjWldIVUIzd1o1cW5WVUVCb09RdXp1akRF?=
 =?utf-8?B?MTY2bUw4Q3NENkdvZk5sNEVhL2xZUjBoZSsvcGoycG15eVQxTDJSUjVRSHlK?=
 =?utf-8?B?Z1RPUUEvMzl6MlFyUC9MV1ZJN2FsZzN0cnRTdnhnYnNaMzVZbFFLU21rUVZW?=
 =?utf-8?B?WTlUYXBrU1RKRVI0YVdwTDFvRWdFdHE0ZmUyRXZPTDRHVGtPQ1NtQW9IMFh0?=
 =?utf-8?B?MVFHRmZZcEQzQ3EvZ2sxQXVyenZyZzB5bUE2bGRGWml2WVhQcWN6VFpaUXJ6?=
 =?utf-8?B?L2dTd3VpRFlOUnpSMStCbmM5VlNRNnYwTzMyYWNzeDI5cjUvWTdDUGY4dFRu?=
 =?utf-8?B?OFM0OWdwMlNNRVVIdVJRT0ZIaksxRmpjbUZSaEFDRzA1VlFEemJxNnlIY04x?=
 =?utf-8?B?NnhydEtDbkhpbFJFUkd2TjRRY3NlU0x4aHV2aXcvS3d5eUR4YzFzbUR4bER3?=
 =?utf-8?B?YytNTFJVK1FGTUthTXRCeFdNZGxMenkrOGh4SHp5Rk1pK2V1NndUT0ZhQTRr?=
 =?utf-8?B?TkR5SkJVVFlxbEFPQzk3YUhTMDlDVGN4emJPK1E0NSs5c013ZkV3YlREeGZL?=
 =?utf-8?B?ZVpIZTAwNGhPYmNid2wxR0hUd0hKSzI2ZW1xUTFPbFBmeTNuZnJqekFkcVlu?=
 =?utf-8?Q?b9/5pVXgow13OCGtCymqHDzJIFNrMPg2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ei9YaUJJdmJTb2JhSlFoODRLeEtlbVR3YlJpaFVXVnZhRGtwWDFxYTVtckNr?=
 =?utf-8?B?aDI0UzJCeHUrdHZBRlFvaHpuR3VjWThEOEV6VEYrQSt5Tk8zQkQ3eDhyelZr?=
 =?utf-8?B?UkQ3N3E0K05rbHYwWEJBSVRDdEgvUC9SbC9PeTA2UlN3WFlRRlIzZ1ZZMGJn?=
 =?utf-8?B?Y3ZKREMrQU4rQmpjaTh2bHJMdFk5bzJTM2FLWkE0Ym84NFJNZWo3bEx6UURH?=
 =?utf-8?B?ZWxsS1MxdFU0R25FVUNKaWpzQVpnVGhXc1h3UlZhNTRKOFRqQk9tRVdQNC9j?=
 =?utf-8?B?VWQrTU15S1RXS1JNcXlsa29RR2h0b3k2K0tkUkFLMUlvOHU3NVk4djNzRVQw?=
 =?utf-8?B?V2w2WVVnMUtDRUJKaDBKejJKWWY4U0ZYN2xsVXJOcEJDZEpxK0Njd2l2bzRm?=
 =?utf-8?B?ZzduZlc1cGl4NmFZTXdseUZNUHJLdm1KczNuMGhJNk5mSzVEdy96TEN6V3da?=
 =?utf-8?B?S2VHTE9QL0dySmNyUzRHb2U0dExIVWZFajczcE93VlJMUGdQRk94UnExMGwz?=
 =?utf-8?B?Z3BjdkEyekdFUHhaOUhheFRoNjRCMFVFUzlUSDVEVzJKK0gySjEwa0ZJWHJi?=
 =?utf-8?B?M21raG56cWhYZER2am1BZWt1cDJLVmVZQUJnN1VpTVdKMDRiMW5HZE44RHR3?=
 =?utf-8?B?NGFqQVdMVUJrYWlMYXg4UFFOdEhVZFRsNGR0RTZqZ1lGMmpHZWJOUHNRbFFJ?=
 =?utf-8?B?M3dMT2l1dHZLcXVLSHdiK1Y5T2tLM2lDVThDNDZQMURFTE43Ni9hZDhqOFhP?=
 =?utf-8?B?eWFQU2JOMllzWDhDSmg1OW1KS3J3cFNrU1VvYXBaNUNPUTdlcThmcGFpendE?=
 =?utf-8?B?MEpWQ1kzWW5kQlFkbEVqSVAvZWIzZDNxcThoQXZFdGlKcGw5bHZSU1U1TytN?=
 =?utf-8?B?OFgzZDJFczg3aDkzY3laOXBQUUM2WFFMVTdFeWhXcHFJdE5wUVgwU3g3TnFJ?=
 =?utf-8?B?WGF6Rld5NmdrbUhRemljSlFmT0VyeDh0NGdMWGZsRDY2aGd5d1E5d1RhNlJW?=
 =?utf-8?B?OUs4OCtncGRRdGc4THliQzVpdkd2VU5tTzJwRFhIYzg4emxkNUJZaUk1aDVU?=
 =?utf-8?B?dkNmNXZuaTZBU2UvcFdPSGNlSTRNU3FrVHZaY3hPWXBMVTA2OHBBa1hwMXpS?=
 =?utf-8?B?eVVYc0JuSldvVmlyWGhCeE5xS1A0Z3plQXMycE9uQ21CSkpFWkM5anR0SHNB?=
 =?utf-8?B?N3FwTklBT0ZqVmJ6MFZkY1pFV3RtcU1kRkZSSGpmVjI4RVdQTWZQRk4wcmQ4?=
 =?utf-8?B?OFNpTjllZmVIcXFyTzRtN0x6MkVSTXdFV1hkbW1LSFpCWExZZkVGZXRGTUdO?=
 =?utf-8?B?MXJ1ZndITlpFc3pGRjJqMlNDbThDY0tlV0dhazJhc3ZrKzhrRjZUVDF2Z0cy?=
 =?utf-8?B?dmRvSkJnTDVSWFFXV3E0K3Q0eWZ0bHZxajZZV2Vad3hsU3VnMVRDQ1ZGZEdO?=
 =?utf-8?B?eVZXdG9mZlk4T3d6cW9iR1JCYjZqaTZ5MVBCelJPMTB4TlZmQklWY1ByeXB0?=
 =?utf-8?B?eElCVVo1L1JFK1c2cGdnTzhkS1NzbzJnQVNsWEhEM2h5MUdDWFpKdElhZWVp?=
 =?utf-8?B?NEtXaU1pY1dPVUxkdGpsMzVLSW8rd2l1MnVWdmJkS3E3bmNZeEtBSUJCYjg5?=
 =?utf-8?B?UFRjSUZIemljWXNkSkd5eXY4Qm01QzNjbThkMStrM1JZcy8yWUFtVnhXcXRt?=
 =?utf-8?B?UXRiVkxySFdjbFJtQmZPaXdPbXF0WmVETGFPMURHM0d4eEExam90ZU9TcVVC?=
 =?utf-8?B?VEtxNWhRWWpsUzFYTC9wZWp1R01Vd2w0ZnZ3S0ptajYxQXRSNkZyYUdHekZ1?=
 =?utf-8?B?OS9QUjljUmY0Rmx4RUZQQmNvZ2hTc2orT1NnTUVaMXFzZmZzSS9SK2YvbHk0?=
 =?utf-8?B?WXhlOHlBTTBKMWg2WE52cFpmS3VVRTFlT1VLbnNjT29GMWsvT1NlNXAzdEp4?=
 =?utf-8?B?U0pMbHVYaUhVTC93WDZzb3hIeEQ2QStTSGpjYThaYkt5WXEyMC9TLzM1OWdr?=
 =?utf-8?B?V0pFU1hrZ0dYeEdWaElpN2lHNW9uV2U5N2Y4QnNvVXBXbkJvWFFjVkF1Q1FH?=
 =?utf-8?B?R0NaOHlGMDdVYmhJTUZYdlJFOWU4aForeFNrTW9oWmJ0OHpJZUVMaWM3dk96?=
 =?utf-8?B?NUcrS1lDVVM1SXJHRTJEMWhOVzZ4UHRqZ1hpdm5td3ljNzNYMTZuRUdLRnky?=
 =?utf-8?Q?aL1tcx0zljjSyJHGl7jRiFk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766f21cc-90ea-4d36-720c-08de0814fda5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 15:52:18.2555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PrX6PuMN83QE2g/HvO/kUheeH0JZClV8rrQPXSQMzXZkP+minDq3lzFF9MMqnUxYznOjgDROqL7+wuoThkGCDPA0R7Jv3mmtUAAN2DN/SU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB8190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_165228_007026_8A966C5B 
X-CRM114-Status: GOOD (  26.93  )
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



On 10/10/25 2:52 AM, Ryan Roberts wrote:
> Hi Yang,
>
>
> On 09/10/2025 21:26, Yang Shi wrote:
>>
>> On 3/27/25 11:21 PM, Dev Jain wrote:
>>> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
>>> which does not support changing permissions for leaf mappings. This function
>>> will change permissions until it encounters a leaf mapping, and will bail
>>> out. To avoid this partial change, explicitly disallow changing permissions
>>> for VM_ALLOW_HUGE_VMAP mappings.
>>>
>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>>> ---
>>>    arch/arm64/mm/pageattr.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>> index 39fd1f7ff02a..8337c88eec69 100644
>>> --- a/arch/arm64/mm/pageattr.c
>>> +++ b/arch/arm64/mm/pageattr.c
>>> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int
>>> numpages,
>>>         * we are operating on does not result in such splitting.
>>>         *
>>>         * Let's restrict ourselves to mappings created by vmalloc (or vmap).
>>> -     * Those are guaranteed to consist entirely of page mappings, and
>>> +     * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
>>>         * splitting is never needed.
>>>         *
>>>         * So check whether the [addr, addr + size) interval is entirely
>>> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int
>>> numpages,
>>>        area = find_vm_area((void *)addr);
>>>        if (!area ||
>>>            end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
>>> -        !(area->flags & VM_ALLOC))
>>> +        ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>>>            return -EINVAL;
>> I happened to find this patch when I was looking into fixing "splitting is never
>> needed" comment to reflect the latest change with BBML2_NOABORT and tried to
>> relax this restriction. I agree with the justification for this patch to make
>> the code more robust for permission update on partial range. But the following
>> linear mapping permission update code seems still assume partial range update
>> never happens:
>>
>> for (i = 0; i < area->nr_pages; i++) {
>>
>> It iterates all pages for this vm area from the first page then update their
>> permissions. So I think we should do the below to make it more robust to partial
>> range update like this patch did:
> Ahh so the issue is that [addr, addr + numpages * PAGE_SIZE) may only cover a
> portion of the vm area? But the current code updates the permissions for the
> whole vm area? Ouch...

Yes. I didn't see anyone actually does partial range update as the 
earlier discussion said, but this is another "footgun waiting to go off" 
too. We'd better to get aligned with this patch.

>
>> --- a/arch/arm64/mm/pageattr.c
>> +++ b/arch/arm64/mm/pageattr.c
>> @@ -185,8 +185,9 @@ static int change_memory_common(unsigned long addr, int
>> numpages,
>>           */
>>          if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>>                              pgprot_val(clear_mask) == PTE_RDONLY)) {
>> -               for (i = 0; i < area->nr_pages; i++) {
>> -  __change_memory_common((u64)page_address(area->pages[i]),
>> +               unsigned long idx = (start - (unsigned long)area->addr) >>
>> PAGE_SHIFT;
>> +               for (i = 0; i < numpages; i++) {
>> +  __change_memory_common((u64)page_address(area->pages[idx++]),
>>                                                 PAGE_SIZE, set_mask, clear_mask);
>>                  }
>>          }
>>
>> Just build tested. Does it look reasonable?
> Yes that looks correct to me! Will you submit a patch?

Yes. I will prepare the patches once -rc1 is available.

Thanks,
Yang

>
> Thanks,
> Ryan
>
>> Thanks,
>> Yang
>>
>>
>>>          if (!numpages)


