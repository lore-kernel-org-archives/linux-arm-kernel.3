Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34141D3B9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBpC65ZqFTpf283+zu7kbAiLmHHqM04DCfsr8dudJpU=; b=ymUgc7vQZjpcT1qjU9uW9MMTP6
	LCG1oLjnLBIs6FvZRcQoERe6soSAOb9kYGGcLVCgZJLdYtaJqWuHtlQSVnisFoDyZNIR5ul3d0URF
	jaqouI5JT65Jb/rqzdVMhfUA3YDdXNEVxGByGdZIAnFI8qze/kAOoF0jHOaoVqgB424V9m+mzDSXP
	V0JBqzxZd0hbHTEymIIV1oMDDFUBKFNdkmJo8PDgxANIw1HFJWEG1ZlAC3xdLgAeID3g3X5dLu3Lu
	yPIDEm5q2bPfSRfKCFti+hV4iTu45lP1AZ9I9b+jnwDs/3DrAPRX9PeMlhar18OIcqI1jKNCol3BN
	zjraxjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTEl2-0000000FCyD-1WqE;
	Wed, 10 Dec 2025 07:37:08 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTEky-0000000FCxn-2Pl4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 07:37:06 +0000
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA5jEPb1894228;
	Tue, 9 Dec 2025 23:31:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lBpC65ZqFTpf283+zu7kbAiLmHHqM04DCfsr8dudJpU=; b=
	M5X+kU3JMk6sHyiWDsXL+3Pnb4F6M14V0ZF/39qotOchNtAFmFyEW3XnwB5rBFI0
	X2QPL/oiuxwvU1wDCzXeWSKK3gkRE3QUqlGeQ/WDrwDOk9mSN31jKaKnRM8h6fv8
	gtZveckrYdR8mxETdLH1AYLp1yI4X7ovR4Tqp1NbXTnYlpG2KllWFghibe/bBpqV
	gbJJOhyLWzziBnmTqlEFAKcM6603HiIf/3Wn+XIPZPUZaE/3SM+M0xcWnCLH2jdo
	WeiKAhWHSnpe9UZHNeQhiN/WKM1Fo5IRsAdO/m2C23LjXfyMaMSQuC4Fz9gJM7LY
	0Xw+Vb/bOzmOH8UWAH/n0w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay022r8dw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Dec 2025 23:31:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZi9gwG2PjcvJIxC2IvJO30x6D941dhR8rZb3RIV/DA6OSSn+aTVjLm1Gdzmy3N317Wv23NrDIlNnWKor0WIFd0FyZKZAK+n0iDvQaOf0aV7Lhy9ec1AgQ4d36SW1A7No3xpUSO7+8/C5EID53h2ZCj5bIi/r3mIb7ql0W6osagqmjvZO206UEOQWAsPhLzyQwucnkbziq5LLWr/1w+AcpC7HZ3M/p4gHqJE/XdOA5TC6uJUf18QYLdi5j5K8SnL5spOvwCO1M15YXZiLTKCzP2TFJ3EGKmtxo9WVmLBbZcq93g32KAzrVhq41qv5TKaEYJJfRUGbDf50wakXwQzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBpC65ZqFTpf283+zu7kbAiLmHHqM04DCfsr8dudJpU=;
 b=cueIUdL4johPMHklMy1tLeF2DPfloDS+lPJxoqnfqkFwiTxtOvIONolWxmsyJBL73XroiJQEO1Pd7yHC5C/cF3Tb1E3YbzVkQgKClCoi4vkSy8BXvBkRTjY1K2XxzuTD5UA9sphNlCC0GgYW6XA9ARefFdSif4l+94z0gogVSgG65Daw07UuY1ysUAJYkAnJo/sC+l0VR/HrQjGftj55KW2GrDZgx53U8diyu0F+ByBAIq0GFMF/F4cUZOOQJd1UfrCpjzMVg8xCQryZnoLGwi0vkdCynttkop/RwGf92MrplkMuHRekpgq2xyJeGi1eh1WMBVHwJBYhy2If39k65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) by
 DS0PR11MB9456.namprd11.prod.outlook.com (2603:10b6:8:290::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.9; Wed, 10 Dec 2025 07:31:52 +0000
Received: from DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e]) by DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 07:31:52 +0000
Message-ID: <fee21b3f-fe4d-480e-9ad6-cac8ba46055f@windriver.com>
Date: Wed, 10 Dec 2025 15:31:24 +0800
User-Agent: Mozilla Thunderbird
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
Subject: Re: [v3 PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
        will@kernel.org, ying.huang@linux.alibaba.com, ardb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251204062722.3367201-1-jianpeng.chang.cn@windriver.com>
 <8248c3fa-5c17-419c-ad8d-7abda988f0aa@arm.com>
 <4050b918-2ff8-4625-b1b6-8bb43e82c906@windriver.com>
Content-Language: en-US
In-Reply-To: <4050b918-2ff8-4625-b1b6-8bb43e82c906@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::8) To DS0PR11MB7736.namprd11.prod.outlook.com
 (2603:10b6:8:f1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7736:EE_|DS0PR11MB9456:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e36337e-5ac7-4349-de24-08de37be3013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0JkWWwzL25xYmdwSDlwREdzZkV4Ujk4WWJYeUNSZlo4MkZQM0FoMHMvU2gr?=
 =?utf-8?B?QzRrTTA4blJMWThFZEQzVU9rZll2M0xCMjFoOEVwL0hVNnArWVV5RzdsVFdo?=
 =?utf-8?B?VlpkcDdQUE1XL2JDcG5HcmRrVy9QQkFuV1BkTXh5UjUvcThaOUk0NDgxT3ZY?=
 =?utf-8?B?TWdRRTkyQzdWRzhrQjFKR0ZUZlBOOVVwQVg0YjQxT0VONFRjOFRhdmZYVlZW?=
 =?utf-8?B?UzNtdjl2akh4dDBnUDVGRzNZSTJhVHpxLzBZNEhnT0RHMjY5bGMvSkV3RGNz?=
 =?utf-8?B?Z05KREZrZllraHdsaUwvVUpVMVVCS0ZrRThqWDBGMm1NQzh0YWJQYS84QmFQ?=
 =?utf-8?B?N09wRzBNY3BZZDZUQ1BUNFdPRVFmZVBuMTREUXJxeXNYVHI0MS85dnVES2Fm?=
 =?utf-8?B?TlBNZ1hVOXJuK2VIM2FQUnhzZ0RkTkVmc1FsY2djL280OUFydEU0VkxKcG1h?=
 =?utf-8?B?U2Nza0lWWEZtMWxvdUhUVzAvbjB1enVOTFFVNGN1UWZUYUI4eThhL0VFdjh2?=
 =?utf-8?B?R0dhSDZtV29KSmJZVEVTRUxaVWhlUkRYSmpreVl4MlR5Y3QrVzhUTHl3U0VD?=
 =?utf-8?B?Q2EyZ0htMUhHYk5uRmgzT092cFlUQjU3QWVQU1M2d2NncldmT1JGTWFXbHMr?=
 =?utf-8?B?TDZiS2k3amZTRWtxVDIzUVRWN25lZjQrQStISDg5YWpiQkNxaGhpYlBDWEYx?=
 =?utf-8?B?cGxvdEl0eDhhZksycm8vVmhDdjY4aHpIWEhac2hOUDQxY1AvdHdVT3QrdUls?=
 =?utf-8?B?Rnkza09sQzZ5Q0FrLzdYUG1leVFPVEVVdjhYU0ovM21PTHYvYXl0ZGJJanR4?=
 =?utf-8?B?NnZzNXhKeHoxRHRGMmYrU3JOZ0EwUE84RVNBbzFONXdMUkF1TkFrcXNaYTZj?=
 =?utf-8?B?eURHNFR2WXU4cjdkSmVONFBIbVY2U04wdjFKM1RuemtnK1U2czEzU09QT1o5?=
 =?utf-8?B?VTBIRXYyM1pDUzRPMzU1V0Zsd2hlY3VEcjdwb3RuemtjZ0llbm0wNGhQdXBp?=
 =?utf-8?B?Q0I1dEVrWTYvbFRMZEc2aFExbExhQ3lrdGNOMmZJb2Y4ZGI4Q0NXVmJ4V0xP?=
 =?utf-8?B?cWdrNFZxeFo5OU5hYVpqa2JRazJKTE1YK1ZrTXp0NXIzd1hLK3BwaDVZSHcr?=
 =?utf-8?B?bk5qQnJJaTE1SWlISzBHY09qRWhoU1hDb3FjVjF1ZStyQlo1MUtYRXQ3ZXM2?=
 =?utf-8?B?aXVHUUtwcTJ2SkY3YnRrVGQyTWY5d3ZKUGhZZmMrbTJOUmlDSHVoMHlaZUhx?=
 =?utf-8?B?aW1yUmJpNzJ6aHg5UGl1UjZSRjNTQ3R5MjN5bm9MWDZkUXd6dEVwMnlYQVlq?=
 =?utf-8?B?Z1pRSkd4UFVTUk5TcXVIOFh6QkFCUWxub216M256RzJwYk9WNjU0U2xLRXFN?=
 =?utf-8?B?TFo1bU1PaWwvUzdLSnVVQ3hQUFA5L2lmNEtFamNIMDhXSmw3aDJjOEVCYm13?=
 =?utf-8?B?UnhKeU9GUkRMWnVINDNqSWdYY2xQb09NWG1xeG9MbXlFSitrT2krYWJwTnZS?=
 =?utf-8?B?b1ZMSmRpRCttQ1orNVk3WlBKUnE0WmljLzBBMUVBQTdNRFdUVGc2dVhBV2RM?=
 =?utf-8?B?UU00MnZaVnM0VWRkM1ExMU8ycmlHU3RRNVZPQis4d25IRzRxaXZHVlU3elpo?=
 =?utf-8?B?Y3k1cHg5SWNYa01JR01KY1loQW1EWXdWR080YW5NaW43dHZSUklwZU1yMFdK?=
 =?utf-8?B?VDVjOFBRU3Jhd1ZFRHIySkQ5S1NCNGxBVjdkMm1sczlaZllLeDNzRU5GeEJp?=
 =?utf-8?B?Zkdrak1NZGV5RWJndXJjeWNmSkV0THo4d0Z1UXdtYnR2bVlQTUlnWmZvNW41?=
 =?utf-8?B?OHFDZVpGcncxRlMwUTdIUjJUZVh3UUFmN3lWYTZnUXEwRUNaRHJXVHkvNkJW?=
 =?utf-8?B?R1M3d01MSGovaUdOR3hvdWJGcWdVby9jbnF0VjNYZ0ViQkV1UWhDZkpmaVM2?=
 =?utf-8?B?UzlScEpiZFdRSURjVnZJbzI5cTNUdWE4ajF0N3MvTEs4eGRyYUprS0VyaUgx?=
 =?utf-8?B?ME8rNE1hcEg2djE3YytBS2pZQjR6cXFSWWM3TjAxZ3pnaDEwZjRXSm9sRnJY?=
 =?utf-8?B?cmNtbUE0YUlCWmVOVnN2cHlTbFJyTElIQW9EZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1ZHQmg0TWYvV2YyYXlvbThwWmxyMnp4S2JGek9nL3ZVQUNSNDFuWVVpdnZS?=
 =?utf-8?B?R2JQT3l2VXpYTnZyU2MvU0Z6K2w0L2xiVG9iTTREOFg4bEI1OERXREFqYWYw?=
 =?utf-8?B?T1lxODVJZ1RDMnhuL1QrOEhXVktxV2kvdXl6ZU5qMDdZM3NCTEhKVWozR203?=
 =?utf-8?B?QndiOXhlS21aV2NpeThkdm5hdFp5NzZzNnNVMnBDY09tNHo1dFYvV2tlSzFm?=
 =?utf-8?B?VjhXQjEvK0plRSthRlhHeno3QTBLV3htQytEMHNEalpTSVJwbzZzcDdNcCs1?=
 =?utf-8?B?aGF2MlVGTVNQNkRQNGVsakQ0Q2NMNVoyajRzK3RwZDBxQXhXdDhpWFBDL2V3?=
 =?utf-8?B?dFdwdklMSEtndGdVVnlaa1FaYVJMUER4NWo2UHc2ZkJEeWVaNTQ3NHZuc25L?=
 =?utf-8?B?Tm0yRkJWS2hDQW1XcE0rNWFITVV2cnNKRG1nYTJyUy9UUjl2T2VhQStmZTJo?=
 =?utf-8?B?VlRmL25tMkFzNTVjbWIzbzVVU2pJbzFrckpmYTV3QVdpSjAyMWZXblJKMm4z?=
 =?utf-8?B?aWNXM2dBVGJUd2FTcjJJY3p2WHFod0VlUGY3UVIzK290dFVYMnVWVUx5TENE?=
 =?utf-8?B?WVlhR3ZmZXZXUGVvUk80OGFjR3dUeUhxNEVhc2kxZW9jMUUwMnZQYXNaNlZJ?=
 =?utf-8?B?dGo2dHM1VzVKNDJrODFwazFCdnRLT0xmN0FvZGR3NDExVC9lUmpveGphbmpa?=
 =?utf-8?B?cVFIclY0ZWIreW9MQzg1aExSUS90MlRybnRHQW4reEttdkgrTlNQTEtwb093?=
 =?utf-8?B?Znl6QzhleVpPR0FSc0c4TDdJRW1SZ2owS2x6VVhYSG00SU9mMG9PWmtmMHR2?=
 =?utf-8?B?ZGhleExmb0h3ZUYwZktEcU4zcDF0VTFrY2h0OWk4RjZmc1UwbHFEU1pjNkgz?=
 =?utf-8?B?K3o4QWljTlpoenRZNnlTODY1ZTNzRWxxR0JqZjdjYzFXL3lFYUFJQTJHZTdK?=
 =?utf-8?B?VndJdkhZSkd3VlNmbE01d1BDcktDMkdPNkRORGhiUXJpQlVzZzVINDc5MTFn?=
 =?utf-8?B?ZkFjRmh6Ukxoc3hoVWxPYnNpTGFoRU5qRUNGU1Q1T2RCdExlS0FSbFZqaGYx?=
 =?utf-8?B?SG9pTkhjWVlJM1doNituNWNJQTB2dDZPdFJ0MUc2empibVBsQW1wMTUydjBC?=
 =?utf-8?B?cktLazlQanJHMW94bEczeThHYkF5S2RkMHNLK1BETFZ4MTVPL1dIc2s2Tkpl?=
 =?utf-8?B?b0RWOXR4bzZCSXpQMUxHU3RkcUVJMlZReUI4TmtZOW1mT29QcHUzVzdyMDMv?=
 =?utf-8?B?UG81eXVrYWo5bDdlK3JWMzFzV1kva1FpZzBFandQWHFYUlpVbjZxRFUzQ2dX?=
 =?utf-8?B?RVRMTEJ3ZkhhaVBQM1UzTnhVZ2NIaDY0bmVhZFlJM3VUSy91K0piYmEvc3Fo?=
 =?utf-8?B?Ly9hdElTdmhYUUNVQmtYS1pWZmhUcmp1Zmw4am1uR3owMXFyVE5BS0RiT1da?=
 =?utf-8?B?eHpMd3RmT2lDeFh4bkdxMEVXKzFmVnZHWTVkTXZxa1dkbDZKR1FsTG5tK3h2?=
 =?utf-8?B?Z0FkT1d5eFptRnVzcnNnN1VFdEQxMHk4RnB3Z0VlMndxckhWQVZONEZrYmVL?=
 =?utf-8?B?NGlqV3ljMGg3dDVBcnBkOUZhcjYyMURZMytIR1lSRE5Sd0Q2YWVxdFJIeGJV?=
 =?utf-8?B?WUxuSGR2UnhxQVZnUm5hWXh1UE1QTXRqVW1EbEVvQnBoTlRHWldOOTZzTFlx?=
 =?utf-8?B?YVYxR1RSNG9NSmRJbjBHTXNUdGNaN2UyOHVwa2FqZGN2SzZJNG1EbjZXbDZn?=
 =?utf-8?B?ZVUyUlZBVTFzVklScGVuN1ZSYm02blhrOElUZlhmd29qZE15SWU4MXhRRFNP?=
 =?utf-8?B?R0I1eHNaU1FJTytrSVRWclhkaWVBSHhNZ0hOZUtFdkdSL0hoRUFqNklPejJt?=
 =?utf-8?B?clJkdUI2SzVuME9sVUxVSFFrdzRLWUtSRGZ0UDV0S05XYVJNMFE4NTlRWlYy?=
 =?utf-8?B?WkI2TUh4a0N6RGg1b2ZGSTVETFVxUUZEYTVkYzNva2huY1E1YUlOaW83N0Zs?=
 =?utf-8?B?Qnh5M2lVS0FEWFNSdmdQWWdxRHBmYkFoZkVxbVlJcUJqcjVFbzR6UXg0R3BL?=
 =?utf-8?B?cHBDMWxMZkptRjdkVDhZTkFxb3RNdmRHWkN0MG5UTzlwczV0NDlISHF6QVNB?=
 =?utf-8?B?ME9DbG16bFl2TlhQVS9PTTFHbitIZXhDYTZ1Zi9LdzA1MGMwR25PMUhMWGhz?=
 =?utf-8?B?cmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e36337e-5ac7-4349-de24-08de37be3013
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 07:31:52.4056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 87hd8wgLfrTIyYo2oKxzQh4s2bZU6hVTiNb1ZrMrtOZpJ/S3NTjdt3/JK/UG0HT5SsRHFE75Ed8FF+cVyvG6ZCBLl66PqdsoGgUxeiHf/7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9456
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=693921ea cx=c_pps
 a=8KrPlQlxEYnZEdstGaGrzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=SRrdq9N9AAAA:8
 a=ek3O8ApYJryaMySIcgAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Ca_rvsET5Wg37c5xblyynFhY3bSHbrUe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA2NCBTYWx0ZWRfX0VAm5VTPbvb0
 MaMEF5EynTMw/3h/tU/eRgJbwpdcLlZi0CiyUcAIMvfTMvyZa9AXdJqkCC4uqDcl2eOf4hNsHpl
 /RpO6UjTzFAbetNwI5XTO/z1KJ09dmYDblp3CJWRY8+Yzb6YgxF2ckbjL9Jnw0u1bRRgqImufHL
 RoSx71e+lmsu++1U28Y5JlvYs4fs60kCGo8BTdwaxN48WudZKU1DkCLHb8fcAneCBgTR2d40z+S
 AmiO1qbWflpnDM6CpRf4+GQ/dcKhKfuSsa9DpRnrnMVOnEAW1u0M5LIEzXNCR0tX4TDnnKUZ5Ly
 doTdGSuXKRIHWNUBYhvjDRSNAvKHhAB3C558gqZrsifNHmZg1eW7Gb4rkQ7X0X/EOzRnvIPHjYC
 iyhBxqrgQbDiXi472McfGXUziOXUZQ==
X-Proofpoint-GUID: Ca_rvsET5Wg37c5xblyynFhY3bSHbrUe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_233704_656105_417DAEE3 
X-CRM114-Status: GOOD (  15.69  )
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



On 12/4/25 4:16 PM, Chang, Jianpeng (CN) wrote:
> 
> 
> On 12/4/2025 4:07 PM, Anshuman Khandual wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender
>> and know the content is safe.
>>
>> On 04/12/25 11:57 AM, Jianpeng Chang wrote:
>>> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>>> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
>>> when the page is already dirty (PTE_DIRTY is set). While this
>>> optimization
>>> prevents unnecessary dirty page marking in normal memory management
>>> paths,
>>> it breaks kexec on some platforms like NXP LS1043.
>>
>> Why is this problem only applicable for NXP LS1043 ? OR is that the only
>> platform you have observed the issue ? although that is problematic else
>> where as well.
> 
> Not only 1043. I found it on the NXP LS1043, and I have both NXP LS1043
> and LS1046 boards available. They both have this issue.
Hi Anshuman,

Just following up on my previous response from a week ago, any updates?

I borrowed an IMX8 board, which differs from the LS1043 as it's based on
Cortex-A72 + Cortex-A53, and conducted the same test. When reproducing
the issue on LS1043, I used the same Image as the first kernel with:
kexec -l /boot/Image --reuse-cmdline.

However, I couldn't reproduce it on IMX8 initially - the second kernel
booted normally. Here are the differences between IMX8 and LS1043:

root@nxp-ls1043:~# cat /proc/iomem | grep Kernel
  81000000-824effff : Kernel code
  82700000-82a8ffff : Kernel data
root@nxp-ls1043:~# kexec -l /boot/Image --reuse-cmdline -d 2>&1 | grep
segment
image_arm64_load: kernel_segment: 0000000080000000
arm64_load_other_segments:730: purgatory sink: 0x0
nr_segments = 3
segment[0].buf   = 0xffff9c5a2010
segment[0].bufsz = 0x194e200
segment[0].mem   = 0x80000000
segment[0].memsz = 0x1a90000
segment[1].buf   = 0xaaaad60cc180
segment[1].bufsz = 0xfa81
segment[1].mem   = 0x81a90000
segment[1].memsz = 0x10000
segment[2].buf   = 0xaaaad60dc1c0
segment[2].bufsz = 0x3660
segment[2].mem   = 0x81aa0000
segment[2].memsz = 0x4000

root@nxp-imx8:~# cat /proc/iomem | grep Kernel
  8a0000000-8a19bffff : Kernel code
  8a1c20000-8a1f7ffff : Kernel data
root@nxp-imx8:~# kexec -l /boot/Image --reuse-cmdline -d 2>&1 | grep segment
image_arm64_load: kernel_segment: 0000000080200000
arm64_load_other_segments:730: purgatory sink: 0x0
nr_segments = 3
segment[0].buf   = 0xffff990da010
segment[0].bufsz = 0x1ea2200
segment[0].mem   = 0x80200000
segment[0].memsz = 0x1f80000
segment[1].buf   = 0xffff99084010
segment[1].bufsz = 0x29839
segment[1].mem   = 0x82180000
segment[1].memsz = 0x2a000
segment[2].buf   = 0xaaaab0cdbc10
segment[2].bufsz = 0x3680
segment[2].mem   = 0x821aa000
segment[2].memsz = 0x4000

From the logs, on LS1043, the second kernel segments happen to overlap
with the kernel code pages, which are read-only. I was able to reproduce
the same issue on IMX8 by forcing the overlap:
kexec -l /boot/Image --reuse-cmdline --mem-min=0x898000000
--mem-max=0x8a1000000

root@nxp-imx8:~# kexec -l /boot/Image --reuse-cmdline
--mem-min=0x898000000 --mem-max=0x8a1000000 -d 2>&1 | grep segment
image_arm64_load: kernel_segment: 0000000898000000
arm64_load_other_segments:730: purgatory sink: 0x0
nr_segments = 3
segment[0].buf   = 0xffff95e0a010
segment[0].bufsz = 0x1ea2200
segment[0].mem   = 0x898000000  overlap
segment[0].memsz = 0x1f80000
segment[1].buf   = 0xffff95db4010
segment[1].bufsz = 0x29839
segment[1].mem   = 0x899f80000
segment[1].memsz = 0x2a000
segment[2].buf   = 0xaaaac05fbc10
segment[2].bufsz = 0x3680
segment[2].mem   = 0x899faa000
segment[2].memsz = 0x4000

This explains why we haven't seen similar reports - the issue is memory
layout dependent. However, I still prefer this fix because it's
universal and works regardless of memory layout or kexec-tools address
selection. We cannot expect kexec-tools to always find the "right"
memory location, and fundamentally, we expect this temporary page table
to be writable.

I'm happy to know if you need any additional information or clarification.

Thanks,
Jianpeng
> 
>>
>>>
>>> The issue occurs in the kexec code path:
>>> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>>>     writable copy of the linear mapping
>>> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>>>     are writable for the new kernel image copying
>>> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
>>> 4. When kexec tries to copy the new kernel image through the linear
>>>     mapping, it fails on read-only pages, causing the system to hang
>>>     after "Bye!"
>>>
>>> The same issue affects hibernation which uses the same trans_pgd code
>>> path.
>>>
>>> Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
>>> ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
>>> hibernation, making all pages in the temporary mapping writable
>>> regardless
>>> of their dirty state. This preserves the original commit's optimization
>>> for normal memory management while fixing the kexec/hibernation
>>> regression.
>>>
>>> Using pte_mkdirty() causes redundant bit operations when the page is
>>> already writable (redundant PTE_RDONLY clearing), but this is acceptable
>>> since it's not a hot path and only affects kexec/hibernation scenarios.
>>>
>>> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>>> pte_mkwrite()")
>>> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
>>> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
>>> ---
>>> v3:
>>>    - Add the description about pte_mkdirty in commit message
>>>    - Note that the redundant bit operations in commit message
>>>    - Fix the comments following the suggestions
>>> v2: https://lore.kernel.org/all/20251202022707.2720933-1-
>>> jianpeng.chang.cn@windriver.com/
>>>    - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit
>>> manipulation
>>>    - Updated comments to clarify pte_mkwrite_novma() alone cannot be
>>> used
>>> v1: https://lore.kernel.org/all/20251127034350.3600454-1-
>>> jianpeng.chang.cn@windriver.com/
>>>
>>>   arch/arm64/mm/trans_pgd.c | 17 +++++++++++++++--
>>>   1 file changed, 15 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
>>> index 18543b603c77..766883780d2a 100644
>>> --- a/arch/arm64/mm/trans_pgd.c
>>> +++ b/arch/arm64/mm/trans_pgd.c
>>> @@ -40,8 +40,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t
>>> *src_ptep, unsigned long addr)
>>>                 * Resume will overwrite areas that may be marked
>>>                 * read only (code, rodata). Clear the RDONLY bit from
>>>                 * the temporary mappings we use during restore.
>>> +              *
>>> +              * For both kexec and hibernation, writable accesses
>>> are required
>>> +              * for all pages in the linear map to copy over new
>>> kernel image.
>>> +              * Hence mark these pages dirty first via pte_mkdirty()
>>> to ensure
>>> +              * pte_mkwrite_novma() subsequently clears PTE_RDONLY -
>>> providing
>>> +              * required write access for the pages.
>>>                 */
>>> -             __set_pte(dst_ptep, pte_mkwrite_novma(pte));
>>> +             __set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
>>>        } else if (!pte_none(pte)) {
>>>                /*
>>>                 * debug_pagealloc will removed the PTE_VALID bit if
>>> @@ -57,7 +63,14 @@ static void _copy_pte(pte_t *dst_ptep, pte_t
>>> *src_ptep, unsigned long addr)
>>>                 */
>>>                BUG_ON(!pfn_valid(pte_pfn(pte)));
>>>
>>> -             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
>>> +             /*
>>> +              * For both kexec and hibernation, writable accesses
>>> are required
>>> +              * for all pages in the linear map to copy over new
>>> kernel image.
>>> +              * Hence mark these pages dirty first via pte_mkdirty()
>>> to ensure
>>> +              * pte_mkwrite_novma() subsequently clears PTE_RDONLY -
>>> providing
>>> +              * required write access for the pages.
>>> +              */
>>> +             __set_pte(dst_ptep,
>>> pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
>>>        }
>>>   }
>>>
>>
> 


