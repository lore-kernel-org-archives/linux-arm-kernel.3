Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5595ECFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdB3So/Z93v2rnkdGOeIt0+Gu+3OJglkTqY7ww4xKAs=; b=eLQiLVsv4c13pqbU97zIlHAYVL
	/MImek6LN+t7gTIVnis15DOlEjRFaJnON5IPdOE+arx4qJk7rMR/VIPofm79agbiZE/a1TgbPW9HH
	dTmUHo++gmKrAlarbhlaRRxWSxVNlxIK8x8vXHwysdKj4DpS5zsZhZ66VDm/2tUF/Llf2pBbd91ST
	a5Mzelklj+HPXJWXLHBE1DNO74MlfgGFlvg6xQiL4jx2pIs1rNQFO6aX21R3HL8pxqR03jAwHKiw+
	WDNmSLPhX2AarExdOK3Vaapb4u2Ner7bOb3JFc2Lzc2OOXNu+ox1cxjq4y2Sux2wtdSofi2QNoOib
	rJe/6Q6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZB4-0000000GN4z-0UeT;
	Thu, 27 Nov 2025 10:24:42 +0000
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZB0-0000000GN4b-3o5c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:24:40 +0000
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR5x9nd1882764;
	Thu, 27 Nov 2025 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=gdB3So/Z93v2rnkdGOeIt0+Gu+3OJglkTqY7ww4xKAs=; b=
	r7TO32the7GrOuf7gga4b04n8TjFevIlBqvYXh6/+XGWw+o2zWq5bTt/RjbvjZRj
	UBoORwK9CVTDwkzRmprF1p5xYp5YgeUGH+tFRTJeRxVplXXes3KYRxlftCJpr9rn
	75WntfixBbYRZxS7Gtv/3Oo+Os4xZMdxe7roR0BUsp2VZsDKjRKQKl7FYWnYRIPM
	dMQym2K1qw3O+q3nGLxvRKiXDKYhtam/Q9cAfyTsoMSW5tRKzKhFE3xUrh1eH9KJ
	unpgzKmAFOUqIR1/fu3YJ1Q3dIWDXyNgRhsGmAhvciJDP99+lT1O2kCNKThZ1jNU
	99vbA/DNZPcSdF7O4y4SOA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ak2d0wr3y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 27 Nov 2025 10:24:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jB8BgvbYz4kgpsNpCcrkcDNoMv0xJybL1zYOKaPs8bnyJC9WGyp25TPmzw5fg3z78aTkDNt/+E+QloPhtaY2aQua4WV6Yi/sbyajB3c9w7UYL3GG77EAM2lQpyFJm8hFI93+2g2jydO/POfp3T/mZDmNIbNHGh7oCez+aftx/d3QabAv40WYKqqQ8pMadt1JkTEB1Gwrh35424Sat5n4MMhPWdj9r+G0snWiGm+8o7wYAVlYU5BKBnxTlow/GbJ6sGo4ZQa3raYcNcMP+BBhyxN/zmKIqD0Rk/Lw+TKKiAtYh3k8ygXcMN4u2o6t9JrMP0PNHQh+0a0jNdnbLsIAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdB3So/Z93v2rnkdGOeIt0+Gu+3OJglkTqY7ww4xKAs=;
 b=DhyadLNiLpaKqE6Qz0eWUgYXqf0yqctpxI3Utg00OYdnKg+w/tZPHZFihW/wjsne4kLq6ZgbKBhah7E/AmicUbudYU2NxJ+0epdwqr09OIbbB0AYBUsdXOc+cLh9nyVT4cGvvRCYHy+PkL5w7+EdW1U6nYCiRF9HxeBmpXLxasp0radmQlarfbbmDevNSno8MwGJvICFnSPlyGPiZzqf17B4U21E1zMoBMLJX/zPLhv8IU10wDKzxG7zUQtduQd93pd5w0rQg2Egs4+9FtcGX+HbMBtrjju95qhZB3UGJ+yIGmkl3+eoeHL4g6bGlzksAVijPzYNvfR/ev6OXIyEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) by
 DS0PR11MB6325.namprd11.prod.outlook.com (2603:10b6:8:cf::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.14; Thu, 27 Nov 2025 10:24:15 +0000
Received: from DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e]) by DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e%6]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 10:24:15 +0000
Message-ID: <95c6e425-2436-42da-b408-4ec48752a2aa@windriver.com>
Date: Thu, 27 Nov 2025 18:24:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
        will@kernel.org, ardb@kernel.org, ying.huang@linux.alibaba.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251127034350.3600454-1-jianpeng.chang.cn@windriver.com>
 <efb12f46-37e1-44b7-b73f-48dead4e4da8@arm.com>
Content-Language: en-US
From: "Chang, Jianpeng (CN)" <Jianpeng.Chang.CN@windriver.com>
In-Reply-To: <efb12f46-37e1-44b7-b73f-48dead4e4da8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0150.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::16) To DS0PR11MB7736.namprd11.prod.outlook.com
 (2603:10b6:8:f1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7736:EE_|DS0PR11MB6325:EE_
X-MS-Office365-Filtering-Correlation-Id: 89b48203-5b28-458d-9a7c-08de2d9f1d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU5Bc2hWK1N5L1JzOW5DUmtkWm5KNE4rMkZLWDBEL1RrQllBcGtIbG9uSmxa?=
 =?utf-8?B?RUFiMzhCeldpMVRnMXhRTjh5dXhwNGhBUFlRTFVoN292NWs5c1RtSnpCVmVF?=
 =?utf-8?B?SzF0cE1ESUZRUHkzdmdJbEpwejNKWnVHZTFMMzNHSEkwRWkzMStmblc1QXND?=
 =?utf-8?B?VzBwYWRleHNjWlpqTit0di9HZzhZd1FhYmRQMHdybGR4djRLWEtCcHNIazdG?=
 =?utf-8?B?VlNuUGVuOUIyZW9DK3ZDRVVpZDlKeXhjNzE1Wm12eGVyZlUxYmRZeGRqVUx3?=
 =?utf-8?B?Rndsd2pEdXFYRklqMmgySVVrWUM2M1pSVFhSTXR4Tm5Dc21Tcmc1T1hpQ0VZ?=
 =?utf-8?B?dEcrZ1JtUjJSSHgxZzNEVmlCRExJbXFkdnlaSFlJVElRQ0JDNmhwZS9NUkVV?=
 =?utf-8?B?cDhmQ0NhdU5kb3BaWjBVUkhRc2FQMXZ1ZlFWcUhNazAySmd1SEJ0UlR6Um0w?=
 =?utf-8?B?VklMSnZDRENvS2IrNVV4VnFlY3o0YnlrTkZISWp0YmZ0YzVtblF6aStINmxQ?=
 =?utf-8?B?VDRUaXVHN3ZQUmtnRVBiUHNUcGZ5TmxSNnVodm41UTE4dWYrNkV3WHNKbVhD?=
 =?utf-8?B?Y1dIWnNzYnNKbGYzNEtJOXk3bWtkc1MwMU5sVDNydGRsMmRpeUhpUld5cDRG?=
 =?utf-8?B?SlJWKzRUdTZISDlGODYyUk1WcnM4K2Rmc08yKzNPWmJ4aWNnOTJkb2plenJP?=
 =?utf-8?B?NjVMTjlaWmxua09BVWJSRFFSOUpLb0RJWi9nK2trb3ZSRjhrMkQ1SlMxeGhJ?=
 =?utf-8?B?SXJLOG9EejVLWFMxeDlMSjNYWkNhN2s3eVhDS0JrY0xrbFpyby9INEFLelVZ?=
 =?utf-8?B?RVZtYXhCQ2FLVkwyUXRjajZzL285SGRIdEtrZmllQ3NFNENlRTh4VlFCejR4?=
 =?utf-8?B?NUtlTmVHMGRZZXA3ZXFWS08yQ2p0K2ROaWsydk1BR1psNzZwaXZNemhMaWt3?=
 =?utf-8?B?ZFM2YkNCSnN4WDFZNU8rdTRrNndtbmQvRFhlbUdkT1FxaGtjNkRIeHhxdGNM?=
 =?utf-8?B?VFlmaHdaMlJ0Z1AzaXVZZzhUbkkxSElPc3VvbWR0NU9aN0RESEk0dyt6cjl3?=
 =?utf-8?B?SVpQMWt2MkRTRnJjMXZTQW5sVmd5K2h4aU4rTlVHdW1CT3VpOG4vekNmVlFx?=
 =?utf-8?B?SnFmaWJOSUxuTXBzWEl0ZXA3ZC9NekJIMGl3T1ZwL0lOTHg4L0lld1pZckhY?=
 =?utf-8?B?Q2c2SEhzTkp3ZURENVQxVkF5MU1mbE9MMWM4U3JPWmVKNmNwMW5KVkZkdXcx?=
 =?utf-8?B?RHJkRWhiSzFJRnNIUUtWU1l1eDhHbU5Mb2w4US84bEhDUnpiTUFZc0hHVzdh?=
 =?utf-8?B?dExiQmJOcU5yZ1QyT3l0WWtmV2h3cW5sVXd0MTQ1MzNQc1QwNldhYXVRMi92?=
 =?utf-8?B?dmg1YUJvaHNJcU0xR1ppY2FtOHJKQk0wYWtJOStvazM0Ukw5UWxOTlRRRCtL?=
 =?utf-8?B?RUowL3BickkyVHljNFdEa1ZxOGlFT3owQmdYOG0ySllidUZPYTkwWVBueHkr?=
 =?utf-8?B?UDBTM29MQWFUQ2pCaGJhVHljQnJhcGYrTFNpam1lYmd1VURJa29nOHA2UmJl?=
 =?utf-8?B?MktweFp2a29zVDQzaGhoT1JaZWwyUm1sRGE0QmdZbStNYmtJelZwa1BPUEdk?=
 =?utf-8?B?b0N4d09qanB6VE00WXFtVGE4bzJ3aHNudkYrTGhiNmZseVMxRFVTbkJGNFk1?=
 =?utf-8?B?OW5xelBWSlhSUEFRQ2dqa3lmcHJyNFQzak9oelpXcit0NWxmRy8vZWdtN0Y1?=
 =?utf-8?B?cVpaajJuYzl2SzRBM3ZLSjAxL0Z6b3Q5aS9xb2wwT3BHek9Tdm45MllESzBo?=
 =?utf-8?B?RXQvK0I0enhiTUdBZHA3bVUzU0FkQStvVTRoS1RCZE4yZEZIc3FEQ0ZVTUFz?=
 =?utf-8?B?N3J6aEtJSHkyZWtuUkdaajFUaWdTK05IaVdhS1g3M1hRVTNlM2F6d3R0THNZ?=
 =?utf-8?B?MDhoVTdpemZhMng0UlgrUHFYbHZnVVlVL0tSYjJ3SW9KR3NRQzNJNEhObDBS?=
 =?utf-8?B?ZzVPWnloYWoxNG04cUlRbEVtODVWTTJ5a2lUZ1YrMmtIdUNUVm9Qb3dVYXF1?=
 =?utf-8?Q?xA3D1M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUlQT05ubEJtZ1QxOEZrcUhyWFljZ09CVXpCeXZVVEtRZGNhcXhGVC9ITk5z?=
 =?utf-8?B?c1FFQ2hYY1h6TjQrb1lHV0xOdEZmaWF5dkpaaU5zZGxKU25Qd2grNDcxZmZV?=
 =?utf-8?B?Nkk1UHhwU3NxZzAzM21vcFlMRVVUVk13c2RRWmpZREJFR1BRL2twQjAwZGNx?=
 =?utf-8?B?K3FSTWR4V296MkpSckZPOGZzS0NFZm9UM0VVUjA4cWRKbDBZMXJScjFDQ0ky?=
 =?utf-8?B?Vm9VWkxEKzJZbU15RXlZVVFrQWdWM1FkcFdqRUFuVWJ1TnRBcENaMnF5ZSta?=
 =?utf-8?B?czFqVWJxOW01NnF4UTFGZk41VEVqendpSFJXR0huR0Z1WUtZVFV5SE1CbERr?=
 =?utf-8?B?TEM5TmZWNlhzajFTcTRwSTUrRUwwSnRXR0RzQm4vUTZRWFIwWEt4VjBMVGxY?=
 =?utf-8?B?d1Q0NmpUODZLV3hYT3hJZE10UjhGSytoQ3pNNGVFbklsWVNnNVVLUGJzZTk1?=
 =?utf-8?B?amF1VlF4aHFNY1lmZ3BhQmFiRXdaVnZIT2hEVFVWN0Frb3VuOXlnVmF1djlz?=
 =?utf-8?B?bnpCaitibm5sQU5jcmhnWmFtYjZibWJkNFV2clhxdDJHeFFFVTdYRkx1Ump6?=
 =?utf-8?B?VVJQYXNvTkYwZ3Njb0xia05nQWk5K2VsSjRMbDdYRms3YTIyaHFQR0JHWnNX?=
 =?utf-8?B?VHg2dy9kbXZoK0E3ZGVTUi9XY3Q0SGhTeG5oVUNFY05aSWVuMkVlZ1JVR29H?=
 =?utf-8?B?VzJ3anRFWVVKbC95ZnZDY2REZ01zRUNEVFhhK3hZakxWNHlvVHA2eklqQ1hz?=
 =?utf-8?B?MVd2RDkyRzVEcGRLRUtoZ3NCQ0REcHBneXpaZU9PWFlKSkduNG5jeXEybHQ4?=
 =?utf-8?B?RXp3RjRJM2xaSFlMbFc3SzVnSWwzN0t0aFpjMDlJMlBKQW5MZU9PM0xWd3RH?=
 =?utf-8?B?amZGckJZQXoyWmI2UzN6UEc2djl0YkZib1JUUFlpMlh6cDB0TFRadXRVd0ZP?=
 =?utf-8?B?MnViRFNHQmUwLzRqS0w2Umd5K242YzkyKzNYTWQ3TFUwL1N0WWRNN3BlMWVJ?=
 =?utf-8?B?TlczcmJjeUErdDJWTkxteDdjMVV2RlNCdkdBcUJwWGlBWUVSSXRwRE1QNy9z?=
 =?utf-8?B?aSt4NmtaUUFCL0JzNTQ2N2FSdmVFaG5ibVFwalY2MDV2YWtxTkRWMGZHNy96?=
 =?utf-8?B?dnRLWUFkbWNFazFmMWkyRW45S1JUaE1LTnpkSFhNU0JCelBkalEwaUpwaUFm?=
 =?utf-8?B?bHdsaG4xQXhCSlR5VWwzQ3J1bWpKL0NJVnFlU2FDUkJQZjF1TENGZmVSb2kr?=
 =?utf-8?B?Z0gzcXlDanZSUDdVVmpXTENPaHdMV0ZaOXM0MHF1dW5KaWdQZ0RpTmNiKzBw?=
 =?utf-8?B?QzdsT1RmTDZZQS85YVhzZnF2NDFOcnVqVWtmQURTUWVkYXp4ak55bUlDYVg3?=
 =?utf-8?B?RkxrUW1kMkdEVk1HYk84cUxlY1ZJRjNnNWJBaW9rMFAycnV3OW5XMzlpd096?=
 =?utf-8?B?bEs1ejNSb2hzQkFOcHJHN3dGd0c2dWl4Z0JET0ljOWljZGlQemI3YjZaR3R0?=
 =?utf-8?B?bG1oNUptMDJOSVBsdk93bzl1V0ZLUUorSHp0d2F0Y0hqYlIrS1JCUmQvdDBu?=
 =?utf-8?B?TDMwVTdQQVZ3QTJkSmF6ZlIrLytHampiNlRCeSt0SjE5cHh2QXgrWjVML21R?=
 =?utf-8?B?QVRneE55ZGlRVkhhZ3lhK0piVGpvNnQ0MEl6SThvMFNnd0dhaWxBcUo0dHdw?=
 =?utf-8?B?YVpsT3ZHUVE3enluUDIrcTZPVk1BZmt3bm5Sbk1EU2c1d1ZWZ3BmWHp3WUpM?=
 =?utf-8?B?a3g0RlRFOFFpRE1wR1ovcnFLakJJWEp0a1lEdjhFKzBYVk9sNWJrRnMwZVdm?=
 =?utf-8?B?M0RDTzhmb1puNUtkU2ZscGtKdWkvOWxjbTZNUVBOS3ZLOVcxc1ZmdkRwT2wz?=
 =?utf-8?B?SEhUd2wzdDgvMGZkUkdVRGlubHgxUVRQMU51dWJ5NDNacGRuOUl6L3JmVVU4?=
 =?utf-8?B?WGZXRFV6M2dITUxYbEM1bXpXM3J4TEx4WXFoclpnTFM4ekNwTjVhaGhSTE1Z?=
 =?utf-8?B?aUZiV0pNN0h1M3VHM0dCZExLNjd4L1VLakJTa0VLajJSUitLZzJhWkRjaGJC?=
 =?utf-8?B?K2hWbVJnVURkNlBPb0JmZEV0cWxlYnBFbzR1SGE2enBOaDhvVXVQV2grQkQ3?=
 =?utf-8?B?NzRueWhDWUR6MFFzTENCRCtDM3M2MEs0bmFtd2l6UmUrK1RsNFZqU2FsYnRW?=
 =?utf-8?Q?7T3odAk6xeqXQzvMvBL4Hio=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89b48203-5b28-458d-9a7c-08de2d9f1d70
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 10:24:15.2163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTPy66UPBbxwXeoXjMBT/hz2KkwOcAHyUCtuMDFo8PWDtlOH0rGfCNczR3q2snAOJ6MhHjuDTQ4PZUWMOe23wXySeO4hQs6btQwQPKtUI5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6325
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA3NiBTYWx0ZWRfX01PMgPXZpz1/
 mOhsryCfsXg1ZyKRpA641yrXmzCMG6uoIqL/UCsMztlYtPt3qkzuiHcrwv0JfROMCwpvmU1ENQd
 ZjyR87mQlhwLE2b//lBPExKbx2Vo407EoLKfchWsGSIcMmFRvDND4uFxJNGbwr3OunnD16zt0Mz
 wwP+Y+GvnplmpZ6gx4Yle9qj2PkWIGnG15AypBsvO18Ya1G0j7htV5cWPRJAklvQU3UFzOeXneo
 dVsMWQwjsGyZTNf3jdBuRryOOOEj9UkNu8GWHYju5zsFF0H7tavO0UmHqFqqW+n0ZvbXUWUwKfL
 QUWBB6GfCVwxVIhXRTj0jC6B9cTk1qp+wJbvQEnirtoA5wsqWTY56T/ApP/0k4Q3UA0175VgMMd
 o3jn4M3zoK1yAhZpbL/fxKO9snVtdw==
X-Authority-Analysis: v=2.4 cv=JcCxbEKV c=1 sm=1 tr=0 ts=692826d2 cx=c_pps
 a=iUWcX4Zb67NrYBHNvjZ/UQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=is8BzlB-PNdUrDiXX4QA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EgFpviRKBscBq5lSfitmxrdewrrv5vTt
X-Proofpoint-ORIG-GUID: EgFpviRKBscBq5lSfitmxrdewrrv5vTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_022439_174739_9C01B52F 
X-CRM114-Status: GOOD (  24.44  )
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


On 11/27/2025 1:41 PM, Anshuman Khandual wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 27/11/25 9:13 AM, Jianpeng Chang wrote:
>> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
>> when the page is already dirty (PTE_DIRTY is set). While this optimization
>> prevents unnecessary dirty page marking in normal memory management paths,
>> it breaks kexec on some platforms like NXP LS1043.
>>
>> The issue occurs in the kexec code path:
>> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>>     writable copy of the linear mapping
>> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>>     are writable for the new kernel image copying
>> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
>> 4. When kexec tries to copy the new kernel image through the linear
>>     mapping, it fails on read-only pages, causing the system to hang
>>     after "Bye!"
>>
>> The same issue affects hibernation which uses the same trans_pgd code path.
>>
>> Fix this by explicitly clearing PTE_RDONLY in _copy_pte() for both
>> kexec and hibernation, ensuring all pages in the temporary mapping are
>> writable regardless of their dirty state. This preserves the original
>> commit's optimization for normal memory management while fixing the
>> kexec/hibernation regression.
>>
>> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
>> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
>> ---
>>   arch/arm64/mm/trans_pgd.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
>> index 18543b603c77..ad4e5e4fcc91 100644
>> --- a/arch/arm64/mm/trans_pgd.c
>> +++ b/arch/arm64/mm/trans_pgd.c
>> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>                 * Resume will overwrite areas that may be marked
>>                 * read only (code, rodata). Clear the RDONLY bit from
>>                 * the temporary mappings we use during restore.
>> +              *
>> +              * For kexec/hibernation, we need writable access regardless
>> +              * of the page's dirty state, so force clear PTE_RDONLY.
>>                 */
> Hence pte_mkwrite_novma() helper cannot be used here as would have
> normally expected. Might be good idea to add to the above comment.
I'll add this to make it clear that we can't use pte_mkwrite_novma().
>
>> -             __set_pte(dst_ptep, pte_mkwrite_novma(pte));
>> +             pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>> +             pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>> +             __set_pte(dst_ptep, pte);
>>        } else if (!pte_none(pte)) {
>>                /*
>>                 * debug_pagealloc will removed the PTE_VALID bit if
>> @@ -57,7 +62,10 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>                 */
>>                BUG_ON(!pfn_valid(pte_pfn(pte)));
>>
>> -             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
>> +             pte = pte_mkvalid(pte);
> Probably better to move pte_mkvalid() just after clearing PTE_RDONLY.
I'll make this change.
>
>> +             pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>> +             pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>> +             __set_pte(dst_ptep, pte);
>>        }
>>   }
>>
> Just wondering if it would be worth adding a local helper for the set
> PTE_WRITE --> clear PTR_RDONLY sequence describing its difference with
> now updated pte_mkwrite_novma() helper with the earlier comment.

Thank you for the review! I appreciate your suggestions.

You're right that a local helper would make the code more readable and 
clearly

document the difference from pte_mkwrite_novma().

I have a small concern about placing PTE manipulation functions outside of

pgtable.h - is this a good way? Or would you prefer this as a local 
static inline

helper within trans_pgd.c given its specific use case for kexec/hibernation?


I'll implement whichever approach you think is more appropriate in v2.


Best regards,

Jianpeng


