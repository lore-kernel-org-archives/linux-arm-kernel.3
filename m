Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF62FD6CFA6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 21:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6hrXrC2weCSJVsSNGyEN4oY/7kd2W0EtsvP0IFDu6Q=; b=pMUQDFWYmkNx5vhmg2V5g+lndZ
	rm3XYaIWMbWyZ3zUkyuNJUfJ18soM6Nd+hy/3dmZg9G8gJyxVuyBTSdYZecO+9BUoVQ2Kf1JvpNEo
	kxmY20+aB6HS9+MuX3df9TZd+LaOpXIlQ2VqBEtMhQduFjwXb19b1UT51iJnRavLYsux1UoM6UyhC
	A/w07XFf6lVkgcFRYzzbyIvuY+LiCHVeDVNd3pBj3I34eBqq5W9ePuJVpFX9AdvQt4J/CLRjDCWUr
	rmEEUew2/t2JT8K/GZOFj1avO2ob3yT2iWjtddDfyUy9n/4uPiYT6cDet0XbXFNhmz5KESNJq6HtX
	G9awuL1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2Qu-00000007oK3-2foF;
	Thu, 22 Jan 2026 21:41:40 +0000
Received: from mail-westcentralusazon11020132.outbound.protection.outlook.com ([40.93.198.132] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2Qr-00000007oJe-26Ps
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 21:41:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InJK8Ls01kZmBgIOtU+q8+IJac3sxe8AklfGxVtHHIg0D8YXKchF/yul1TabwH2f6hBYOYeNznx0/3RO/DWKUwVcVDM3dQGZgNegN112LfNkbhzBMRoQSwJTy2nLxOqYEfH8PEX/hGxAm9E8QRZLJL2mdvg406QFNsXuol36WTmmEfozCrpObVNVpGn+C7T6Ij9Z2iQ3+mxq+eimxXKTfqMCPOb7cAM6idGTkKYslrDPM7rknYyU4KJ9a8WFCGst0RlBjOb79X7JupWNR7Pr18VcmmySbzR0nXluWFSwU3kiDaRPRgOudQRUwLfMTvpslkiYxp+Uk6gFH3xkNG/7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w6hrXrC2weCSJVsSNGyEN4oY/7kd2W0EtsvP0IFDu6Q=;
 b=npUFQs7tKOKWB/eAxStQ8sItqjYoW8sCY8G9OokcPkv+h/z5h4XU1bvY6xyTPa9+UXPyRVPFP1IecAajUzI0yMJFlriMBA0oSre9AU3GlZ/+sGoDSn34uI1XUomw4J+FdcqaLdw3PSdUubHxNceUES8bZUZliqra+XyCodRuY9HxIfRlZa4yJPhHDsqgOqzvxZmGyjo1+8oehMy1EmknTm5mkW3LOrevzCMAPi0d3m3yb6bSGS08EcvYn+qyAmsHKlyDY+Yo3JMHZHgDe3DMX54JP5uBytAzbx8nSxZezZiqTrmMZTIFrxwisY3bNQrmVWDT4X6evaIHwqFHnerzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w6hrXrC2weCSJVsSNGyEN4oY/7kd2W0EtsvP0IFDu6Q=;
 b=cB9mW8ji4ZKGHQIDojC+M7SH6Rwc6MzMI6OkZbk71si/8KDdQqIPgQM/pTmmZASlUV6AP3XBn0bvmzNtUZxPk2D1RyYGteHWxL7Qsvg2xAQz6KlQfovBvv4CMN9m2fGhVGe7dvNRTRq86zb0rG/5aMVSuh2oOd6XNvcSaLM86Zw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 PH0PR01MB6571.prod.exchangelabs.com (2603:10b6:510:95::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Thu, 22 Jan 2026 21:41:32 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%4]) with mapi id 15.20.9542.010; Thu, 22 Jan 2026
 21:41:31 +0000
Message-ID: <fb5dff48-3181-4f5b-9be2-623785fc2da9@os.amperecomputing.com>
Date: Thu, 22 Jan 2026 13:41:28 -0800
User-Agent: Mozilla Thunderbird
From: Yang Shi <yang@os.amperecomputing.com>
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
Content-Language: en-US
In-Reply-To: <965a0b46-f32e-40e6-ab71-211f84d6c3cf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY8PR10CA0042.namprd10.prod.outlook.com
 (2603:10b6:930:4b::15) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|PH0PR01MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf7d5cb-9de8-409a-00f3-08de59ff01fc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2I4dytnK1NybW5pb3lRdlNTZG51ZnhjbzRDbXJraVBtU1hEMjNMWFVDMjFu?=
 =?utf-8?B?MkVUREpNeUlZTmtIQXhSSjRLbFJKbHdFMmQwNElKbXo5c1ExOEt1MXVGV2tz?=
 =?utf-8?B?SUtwZ0R0YUMxRkRDOGtkWlN4anJBRFg0Y3o2SHhjc002ZFRvcWhDcjhhQWFt?=
 =?utf-8?B?cHZoUWFKcEQ1R2w0OHE0Wk9OUCtnUzZYYTVrTGlRZFZxem1Dc3ZYOWZHdFJT?=
 =?utf-8?B?Y0hiMjYwcTEyckYyb3NvOHo5SU5aVnVNcWgvYmpWbkRpakNMeGFYbkUxTkth?=
 =?utf-8?B?MlN3U3B1T2R0TUZOTWFBRFN3RTBsZ051Q3N0T2xwRHJ1VEs1MUN4eTNlKzdT?=
 =?utf-8?B?VjZWQU5jZ2dkaVhNd3JRZk1lcENzTnl2YXZSY0lYa21STVJ3SGVnQ3FWTTlL?=
 =?utf-8?B?cm1hdWZyNnl0U1Z2YUdyQjZuZHZmQ0JEU1JGeFVkRWU4UFIzQU5uWXRXTmk3?=
 =?utf-8?B?Y1Z6WDNLVUNvM1grS0g1V0xTU0NXTU9CMURwRWxQMSthdHc5UmpTbC8wRVFZ?=
 =?utf-8?B?b1JjdVk4TzVtVFZpV1VxLzdta2k3a2E0QjRDakg4bm8ybUZVTUZsS014WSs1?=
 =?utf-8?B?cjM2SFJwVTg0RmdpUFp4K0kxM2svcURyVVFIc2tqK29VMks5N3FJdG50VThs?=
 =?utf-8?B?WUxITjN2Mk5udTlqL0FuckQvdU1pUjhwQkx0Q2JUb2ltQjNLZ3krNFd2RzhK?=
 =?utf-8?B?ek9mbjNCb2hKd2tyb0lCT0FCWXlVVjJYMHdLb1VJMUloUEF2cnBGN1Y2eG5w?=
 =?utf-8?B?YlFRNUFuV1B2TmtzZ3piSms5RjZmRzRnTmI3TW1SUkpBZkJqWWdWb2JQTmlp?=
 =?utf-8?B?S3poQWUrQVFETy8yMFc0NW5sQ3hpckVjM3h0S3V3QW5hR2RHSThNcFIrRWZ5?=
 =?utf-8?B?T0ZsY0k0czBEUUhLZVA3YnhodDJDMEw0WCtCNTBSWWdGM082YmZGaEp1WEJ2?=
 =?utf-8?B?Sld4VDdVOThXRXlScmhzcTQ0Z3Flai9MZVRjeDh5dHN1bGdUUW4wbzZJN1FX?=
 =?utf-8?B?YmRLQ09NOG04c3RhTjFJZ2ZPeEg2M3BpNllyaDkyY3JHRGYvQXBuck90QWZO?=
 =?utf-8?B?RnU1VzNoY0lxL0tZd2dNakhiSXYySEJURmpaMmova01IUlp2SW1WNEFVbzdV?=
 =?utf-8?B?eVpiNWFBRkdUYWFVczJXSFo4dURwaGtlNVlNWEplTTJ4Qis3b20ydERNV0JB?=
 =?utf-8?B?d25nQnhVNHl3c3ZiS2kzbktPQnNPR01IVzd4V2F6Mkw2NEIwaTRTNTdJS0lw?=
 =?utf-8?B?VnZ6WCthU3ZaTXBlWEs0eUJQcDFtdGRGcWNmMzdCdzkrcDFmUTJVUUYzeGo2?=
 =?utf-8?B?ejAwaGZRV09MVkhqdjZGK3J3c3pmdHRuQTUwaTZUOTJBQ3pkUThpRnR5dlll?=
 =?utf-8?B?WDZlU2I3N3J2VlVJOU5mMXBFd204VHFnYloyZzN6MXZzekNUb092Y3V3QlM3?=
 =?utf-8?B?SUdRV3E2RElIb0Y3U3ZiajNHM3BXdkZaeVo5Y1ROSWtOcGJNQ0VaL2wwcmt0?=
 =?utf-8?B?a3JBc2J5TDZ5ZmVDeUllMTZtdTBPQm5HWTRPdUpsVmFjS0phSHhJbDYzbmdi?=
 =?utf-8?B?TXNFOVlPRkQ1RExmMEZEd1ZqZDh5V0dWczVHaDk1bkFkK2I5ODRJRlRYeE5K?=
 =?utf-8?B?SGt3QnhuTlFDZC9Kdm1hMVpocHhYd1BMdG5sRSs3V0pRSmlZRms0cUFGY2ph?=
 =?utf-8?B?V3p6aGRnN3Y1Mzl4ckdwVUtTM1ZYcklTcm1hZUFhUnR3emUydXFMWEIycWVD?=
 =?utf-8?B?cjdJTTh3SFZNVFNsNUkwN3k1TVJRMzh1dTFrZkI5TURiOEJyYXpUeXVvTEZh?=
 =?utf-8?B?OGRYMm5pbkFCZ09ndkxVZ2JRYlZxQll2NzNWUU1NRzhYa2R4NVNyVzFSWW1L?=
 =?utf-8?B?eFYyc2N3WlhJS0xlRThnUGpCQUwyQUJpekZycHg5VEtvajhRTkNPOTBqQ0Q5?=
 =?utf-8?B?RjE2VDRJNHZ4NkJ6UmNKRUg2Z2R2dFJkRnhBNXUvd0Fua3VmTzlHS3ZSTURi?=
 =?utf-8?B?TWE4NWtVbldaKzRLY2xoSVpNLzh0VkJ4MVVscEFDLy9IUEJOZVZmZXFtNGt1?=
 =?utf-8?B?WkpEamhBTFVsSU9mSDlJb21ybDFsbHltRXRUN0taQXh3aU9IOGQ1K3l6QjNQ?=
 =?utf-8?Q?Sb9M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHk4Y09zWmxDZFA4bm1NNi9xTmJNM3pTNHVNTWFQMnZwcTBacnpqTHgzTWFi?=
 =?utf-8?B?R1QvK2dEQ3hFMk9jNFdNaW92TjFhZ0xJcUtES1ZFRTc5OWtYOUNsTWZsSlJG?=
 =?utf-8?B?dEJiS0M0emJxS3kxckoyWkFCWFVrRFdYeU1ucWYxcnd1NG5PYzBrZU1vOHVY?=
 =?utf-8?B?Q3k0N043L1BENnFEYXYvN1VlVjdlTzhacmN4NUgzeEI2NDhPbFJWeTA5WUJx?=
 =?utf-8?B?Tzh1YXRIRUw5ZVJ2QTdadDQ4N0dCenVEZlBnRm02NGo2T2hrSHU5djlHNFVa?=
 =?utf-8?B?c2tmSUQwdlM2Qy81UEtEYVIvZmVsK21ZVWQ2Y1VxRjF3WndFSW9meUZod09s?=
 =?utf-8?B?SjhPaTI5Wld1d2pKZTY3OG5kdE1OcWxRVWVodnpEc29YbjcvaS9rb1lTNjBV?=
 =?utf-8?B?OXIzZ3QvUi83bW9ZaVRwY3JZZWw3N0JCMCtscFVnbmRvT0Z5cUpIZExQdE9Q?=
 =?utf-8?B?WldRTGxnM0Q2UGlPem1hTUZmQjlJTm5xd3dsNzNpL21Ja0daeEhHeFJCVHhu?=
 =?utf-8?B?M3NxcWVEbE9Ha1dxYWtuTDk2amliYVNxa2VCVmVZV2hTejhJUktPTjY1L1Jo?=
 =?utf-8?B?aXM4cHhob2VlZlkxTkpJUDlxU0VpZjdoYVNVZkJmeVpnY1dUTkN6a0NteHgx?=
 =?utf-8?B?SWJMMjJJY0cwNm51WmlpTFE3UURsSDJTYTBnSEplK0xIMU13bTdZQ1p6eVhl?=
 =?utf-8?B?MHpRS2FwaWkwanQxdTR3eEQwbXBtUGt0OG1ZUXBqb1QyK1ZiU1VBY2dRa0lN?=
 =?utf-8?B?K0o4dDJHYlN0UTdCbmVhZmxkVXdiR1QzUjVyQXhoL1V3Y09ZaEQrTUM1VXVp?=
 =?utf-8?B?bDVNeWQ4akgySDFqaDVOcUpEekFLSzBEQ1UwOUxvYUl0Q0prYWk0Wko3dTAx?=
 =?utf-8?B?SE55ZkZBWFJOT2hUWGVoQ29tWE12Nlc4emsvRWdURTVQQTBvQ1FWTHh5czJ4?=
 =?utf-8?B?Y1YwRnRTaG5kOUtMNnU0N2p4aDlaWWlqNVQ2TTE5dmhkR2NkWHRyZmFBS3NT?=
 =?utf-8?B?b2dLTWl4VzFVZVcwT0Y5TDNMWGc2UFRJcTJyVVJUZU5Geit5bVpJcktscmtr?=
 =?utf-8?B?dlJXU0NBaGQxOTE2T0dsN0U2aVZhRTB5RDdtcWVOSzlqWVVTcXNMYmVYcVBS?=
 =?utf-8?B?dVhLOWMvM3NpSWFaM2s2YWc5bmtXc2JRSC9JazRQckVHeGU5Tnp1ek83MGll?=
 =?utf-8?B?QjQwdGkzVEI4U29FcjNBMW5aY0Nmc0R1Slorc0VIRi9NL3dqdWtiK0VnYTAy?=
 =?utf-8?B?QTJoclhJMGhUd05rVGVUWVB2dkdBRlhlMGJKeEkzVkFwS2xHUENzbHJsS3h6?=
 =?utf-8?B?Ym9McXVLbVlXYW8xbCszOUttcDhVeUdlc1Y1dUhDcjlKYUVsQkpFdWdTRFBD?=
 =?utf-8?B?RDVaQXRCWi96TUVUc0JRVC9UWTFHMUwxb3lnZGQ2bVpBN3d1LzJIZWQ4Lzhr?=
 =?utf-8?B?WU1iY1dPVXNTOEV0QmtoMjB5c21xRWNZa3l5cE9DaWREK2xhNlJvRkZ5ZFc1?=
 =?utf-8?B?eHg3SG1LcUNKY1E2ZjFlZkJ2T3p1TDJJRklHODllZ0dXZkM5YmJwSERha3N5?=
 =?utf-8?B?WElXeFlMOVUwNndDRitYOG5ocHpKWVFjMVBxWm5SQ0FSblpSQlBEMytzbTdO?=
 =?utf-8?B?R1pUS2c3TlNyU1hwNzNhLzJ4VVA2d0xSa0FwcDc0UUxqekFPSVoxZ2xORnpr?=
 =?utf-8?B?clVZeU51RGYvdldJeElhWGxBNGptYksyVG5vNHY3bUNLVnYxSm1IenpuejUy?=
 =?utf-8?B?ajczTklrTW02Q0ZSMGh1RGFaTThoSFlucWVaQ3g5aWFXRGZucjZoYXhJek82?=
 =?utf-8?B?VXdpSW1uQm5TTFI0ZXJQQ2o4cXJCYlA4UXIxUEF4aUk0OHV0akNNdUx2K3JJ?=
 =?utf-8?B?aU5EK2FEV0NJQ0huVkJEL3hvNFZmSUQwOWdlWDBKQUJ2M0wrbWYybmMzK3Rr?=
 =?utf-8?B?aUxqVTJKZHV3V2pvYk9TR1NyRkNSNWRIdEtzdkphTXJWZWsrYkVZbG5rcCtD?=
 =?utf-8?B?VSt5eFdnc3ZEQ3p0S0VYMVB3Z2xwSDY2L05WK01EcktrcjlQNVk1ZlMwY2NV?=
 =?utf-8?B?c0lrc0pLUkZ3ZW5KeUdKekp1RTFpVXlXZEd0VEpPVmNlVVdxVE8weVBlZVlp?=
 =?utf-8?B?YnlTRWlybEZBRUp3L2QvRTVoZTRIZkhpYnUrNk5HUnE4TzRwdml5YjR3L2Fi?=
 =?utf-8?B?SUljak04UlZDbnE1VytSREdCRVhWamFuL2EvdnFKTDdjcURnMlh5SGlHQU5L?=
 =?utf-8?B?QXFJak9ZTUgrbXZwbVdjRHdjWmk0QTc3b2taV0MySThCL2huWFB3dHNZMVRH?=
 =?utf-8?B?ZEsyN0htQ3RRM2lOWkZra3hLWlNYeDRFbVlCbGdYbWNXWHhPcHRNeGxHenVC?=
 =?utf-8?Q?vF9WJgcjuqxfnutA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf7d5cb-9de8-409a-00f3-08de59ff01fc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 21:41:31.9137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7nMBtGlJq/3s0TB2LIhwM2S6EUpf/c9idaUut5eIUH6XJMpGiDR61avROvMX4nOsz3ZJMSMgcotXcLUnzjRpg4X+qut7aCr0gW/Q8zTBJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR01MB6571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_134137_604820_B028D741 
X-CRM114-Status: GOOD (  27.60  )
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



On 1/21/26 9:09 PM, Anshuman Khandual wrote:
> Hello Yang,
>
> On 07/01/26 5:59 AM, Yang Shi wrote:
>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>> rodata=full"), the direct mapping may be split on some machines instead
>> keeping static since boot. It makes more sense to show the direct mapping
>> use in /proc/meminfo than before.
> I guess the direct mapping here refers to linear map ? IIUC it is called
> direct map on x86 and linear map on arm64 platforms. Then should not it
> be renamed as s/DirectMap/LinearMap instead ? This will align with names
> from ptdump as well.

Yes, linear map refers to direct map. They are interchangeable in this 
patch. Using "DirectMap" keeps the compatibility with x86.

>
> Before the above mentioned commit, linear could get altered with memory
> hotplug and remove events as well.
>
>> This patch will make /proc/meminfo show the direct mapping use like the
>> below (4K base page size):
>> DirectMap4K:	   94792 kB
>> DirectMap64K:	  134208 kB
>> DirectMap2M:	 1173504 kB
>> DirectMap32M:	 5636096 kB
>> DirectMap1G:	529530880 kB
> If /proc/meminfo interface is getting updated via  arch_report_meminfo()
> why not add stats for all kernel virtual address space ranges including
> vmemmap, vmalloc etc aka all address range headers in ptdump as many of
> those could change during system runtime. What makes linear mapping any
> special ?

Other than what Will suggested, /proc/meminfo does show vmalloc info:

VmallocTotal:   135288315904 kB
VmallocUsed:      114200 kB
VmallocChunk:          0 kB

AFAICT, large block mapping for vmalloc has not been widely used by 
arm64 yet.
"cat /sys/kernel/debug/kernel_page_tables | grep -e BLK" doesn't show 
any large block mapping on my AmpereOne machine with v6.19-rc4 kernel. 
If we get more large block mappings for vmalloc, we can add the mapping 
size info in the future.

Thanks,
Yang

>
>> Although just the machines which support BBML2_NOABORT can split the
>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>> that the users have consistent view in order to avoid confusion.
>>
>> Although ptdump also can tell the direct map use, but it needs to dump
>> the whole kernel page table. It is costly and overkilling. It is also
>> in debugfs which may not be enabled by all distros. So showing direct
>> map use in /proc/meminfo seems more convenient and has less overhead.
> Agreed a /proc/meminfo based broader kernel virtual address space stats
> display will complement ptdump which provides more granular information
> about their mapping (with additional cost and setup) but it should cover
> all the regions in kernel virtual space.
>
>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>> ---
>> v5: * Rebased to v6.19-rc4
>>      * Fixed the build error for !CONFIG_PROC_FS
>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>      * Used shorter name for the helpers and variables per Ryan
>>      * Fixed accounting for memory hotunplug
>> v3: * Fixed the over-accounting problems per Ryan
>>      * Introduced helpers for add/sub direct map use and #ifdef them with
>>        CONFIG_PROC_FS per Ryan
>>      * v3 is a fix patch on top of v2
>> v2: * Counted in size instead of the number of entries per Ryan
>>      * Removed shift array per Ryan
>>      * Use lower case "k" per Ryan
>>      * Fixed a couple of build warnings reported by kernel test robot
>>      * Fixed a couple of poential miscounts
>>
>>   arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
>>   1 file changed, 181 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8e1d80a7033e..422441c9a992 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/mm_inline.h>
>>   #include <linux/pagewalk.h>
>>   #include <linux/stop_machine.h>
>> +#include <linux/proc_fs.h>
>>   
>>   #include <asm/barrier.h>
>>   #include <asm/cputype.h>
>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>   	dsb(ishst);
>>   }
>>   
>> +enum dm_type {
>> +	PTE,
>> +	CONT_PTE,
>> +	PMD,
>> +	CONT_PMD,
>> +	PUD,
>> +	NR_DM_TYPE,
>> +};
>> +
>> +#ifdef CONFIG_PROC_FS
>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>> +
>> +void arch_report_meminfo(struct seq_file *m)
>> +{
>> +	char *size[NR_DM_TYPE];
>> +
>> +#if defined(CONFIG_ARM64_4K_PAGES)
>> +	size[PTE] = "4k";
>> +	size[CONT_PTE] = "64k";
>> +	size[PMD] = "2M";
>> +	size[CONT_PMD] = "32M";
>> +	size[PUD] = "1G";
>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>> +	size[PTE] = "16k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "32M";
>> +	size[CONT_PMD] = "1G";
>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>> +	size[PTE] = "64k";
>> +	size[CONT_PTE] = "2M";
>> +	size[PMD] = "512M";
>> +	size[CONT_PMD] = "16G";
>> +#endif
>> +
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PTE], dm_meminfo[PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PTE],
>> +			dm_meminfo[CONT_PTE] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PMD], dm_meminfo[PMD] >> 10);
>> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[CONT_PMD],
>> +			dm_meminfo[CONT_PMD] >> 10);
>> +	if (pud_sect_supported())
>> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
>> +			size[PUD], dm_meminfo[PUD] >> 10);
>> +}
>> +
>> +static inline bool is_dm_addr(unsigned long addr)
>> +{
>> +	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>> +}
>> +
>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +	if (is_dm_addr(addr))
>> +		dm_meminfo[type] += size;
>> +}
>> +
>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +	if (is_dm_addr(addr))
>> +		dm_meminfo[type] -= size;
>> +}
>> +#else
>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +}
>> +
>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>> +				  enum dm_type type)
>> +{
>> +}
>> +#endif
>> +
>>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>   		     phys_addr_t phys, pgprot_t prot)
>>   {
>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>>   
>>   		init_pte(ptep, addr, next, phys, __prot);
>>   
>> +		if (pgprot_val(__prot) & PTE_CONT)
>> +			dm_meminfo_add(addr, (next - addr), CONT_PTE);
>> +		else
>> +			dm_meminfo_add(addr, (next - addr), PTE);
>> +
>>   		ptep += pte_index(next) - pte_index(addr);
>>   		phys += next - addr;
>>   	} while (addr = next, addr != end);
>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>   			pmd_set_huge(pmdp, phys, prot);
>>   
>> +			/*
>> +			 * It is possible to have mappings allow cont mapping
>> +			 * but disallow block mapping. For example,
>> +			 * map_entry_trampoline().
>> +			 * So we have to increase CONT_PMD and PMD size here
>> +			 * to avoid double counting.
>> +			 */
>> +			if (pgprot_val(prot) & PTE_CONT)
>> +				dm_meminfo_add(addr, (next - addr), CONT_PMD);
>> +			else
>> +				dm_meminfo_add(addr, (next - addr), PMD);
>>   			/*
>>   			 * After the PMD entry has been populated once, we
>>   			 * only allow updates to the permission attributes.
>> @@ -389,6 +485,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>>   		    (flags & NO_BLOCK_MAPPINGS) == 0) {
>>   			pud_set_huge(pudp, phys, prot);
>>   
>> +			dm_meminfo_add(addr, (next - addr), PUD);
>>   			/*
>>   			 * After the PUD entry has been populated once, we
>>   			 * only allow updates to the permission attributes.
>> @@ -575,16 +672,21 @@ pgd_pgtable_alloc_special_mm(enum pgtable_type pgtable_type)
>>   	return  __pgd_pgtable_alloc(NULL, GFP_PGTABLE_KERNEL, pgtable_type);
>>   }
>>   
>> -static void split_contpte(pte_t *ptep)
>> +static void split_contpte(unsigned long addr, pte_t *ptep)
>>   {
>>   	int i;
>>   
>> +	dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
>> +
>>   	ptep = PTR_ALIGN_DOWN(ptep, sizeof(*ptep) * CONT_PTES);
>>   	for (i = 0; i < CONT_PTES; i++, ptep++)
>>   		__set_pte(ptep, pte_mknoncont(__ptep_get(ptep)));
>> +
>> +	dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
>>   }
>>   
>> -static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>> +static int split_pmd(unsigned long addr, pmd_t *pmdp, pmd_t pmd, gfp_t gfp,
>> +		     bool to_cont)
>>   {
>>   	pmdval_t tableprot = PMD_TYPE_TABLE | PMD_TABLE_UXN | PMD_TABLE_AF;
>>   	unsigned long pfn = pmd_pfn(pmd);
>> @@ -606,8 +708,13 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>>   	if (to_cont)
>>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>   
>> +	dm_meminfo_sub(addr, PMD_SIZE, PMD);
>>   	for (i = 0; i < PTRS_PER_PTE; i++, ptep++, pfn++)
>>   		__set_pte(ptep, pfn_pte(pfn, prot));
>> +	if (to_cont)
>> +		dm_meminfo_add(addr, PMD_SIZE, CONT_PTE);
>> +	else
>> +		dm_meminfo_add(addr, PMD_SIZE, PTE);
>>   
>>   	/*
>>   	 * Ensure the pte entries are visible to the table walker by the time
>> @@ -619,16 +726,21 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>>   	return 0;
>>   }
>>   
>> -static void split_contpmd(pmd_t *pmdp)
>> +static void split_contpmd(unsigned long addr, pmd_t *pmdp)
>>   {
>>   	int i;
>>   
>> +	dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
>> +
>>   	pmdp = PTR_ALIGN_DOWN(pmdp, sizeof(*pmdp) * CONT_PMDS);
>>   	for (i = 0; i < CONT_PMDS; i++, pmdp++)
>>   		set_pmd(pmdp, pmd_mknoncont(pmdp_get(pmdp)));
>> +
>> +	dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>>   }
>>   
>> -static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>> +static int split_pud(unsigned long addr, pud_t *pudp, pud_t pud, gfp_t gfp,
>> +		     bool to_cont)
>>   {
>>   	pudval_t tableprot = PUD_TYPE_TABLE | PUD_TABLE_UXN | PUD_TABLE_AF;
>>   	unsigned int step = PMD_SIZE >> PAGE_SHIFT;
>> @@ -651,8 +763,13 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>>   	if (to_cont)
>>   		prot = __pgprot(pgprot_val(prot) | PTE_CONT);
>>   
>> +	dm_meminfo_sub(addr, PUD_SIZE, PUD);
>>   	for (i = 0; i < PTRS_PER_PMD; i++, pmdp++, pfn += step)
>>   		set_pmd(pmdp, pfn_pmd(pfn, prot));
>> +	if (to_cont)
>> +		dm_meminfo_add(addr, PUD_SIZE, CONT_PMD);
>> +	else
>> +		dm_meminfo_add(addr, PUD_SIZE, PMD);
>>   
>>   	/*
>>   	 * Ensure the pmd entries are visible to the table walker by the time
>> @@ -707,7 +824,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   	if (!pud_present(pud))
>>   		goto out;
>>   	if (pud_leaf(pud)) {
>> -		ret = split_pud(pudp, pud, GFP_PGTABLE_KERNEL, true);
>> +		ret = split_pud(addr, pudp, pud, GFP_PGTABLE_KERNEL, true);
>>   		if (ret)
>>   			goto out;
>>   	}
>> @@ -725,14 +842,14 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   		goto out;
>>   	if (pmd_leaf(pmd)) {
>>   		if (pmd_cont(pmd))
>> -			split_contpmd(pmdp);
>> +			split_contpmd(addr, pmdp);
>>   		/*
>>   		 * PMD: If addr is PMD aligned then addr already describes a
>>   		 * leaf boundary. Otherwise, split to contpte.
>>   		 */
>>   		if (ALIGN_DOWN(addr, PMD_SIZE) == addr)
>>   			goto out;
>> -		ret = split_pmd(pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>> +		ret = split_pmd(addr, pmdp, pmd, GFP_PGTABLE_KERNEL, true);
>>   		if (ret)
>>   			goto out;
>>   	}
>> @@ -749,7 +866,7 @@ static int split_kernel_leaf_mapping_locked(unsigned long addr)
>>   	if (!pte_present(pte))
>>   		goto out;
>>   	if (pte_cont(pte))
>> -		split_contpte(ptep);
>> +		split_contpte(addr, ptep);
>>   
>>   out:
>>   	return ret;
>> @@ -835,7 +952,7 @@ static int split_to_ptes_pud_entry(pud_t *pudp, unsigned long addr,
>>   	int ret = 0;
>>   
>>   	if (pud_leaf(pud))
>> -		ret = split_pud(pudp, pud, gfp, false);
>> +		ret = split_pud(addr, pudp, pud, gfp, false);
>>   
>>   	return ret;
>>   }
>> @@ -849,8 +966,8 @@ static int split_to_ptes_pmd_entry(pmd_t *pmdp, unsigned long addr,
>>   
>>   	if (pmd_leaf(pmd)) {
>>   		if (pmd_cont(pmd))
>> -			split_contpmd(pmdp);
>> -		ret = split_pmd(pmdp, pmd, gfp, false);
>> +			split_contpmd(addr, pmdp);
>> +		ret = split_pmd(addr, pmdp, pmd, gfp, false);
>>   
>>   		/*
>>   		 * We have split the pmd directly to ptes so there is no need to
>> @@ -868,7 +985,7 @@ static int split_to_ptes_pte_entry(pte_t *ptep, unsigned long addr,
>>   	pte_t pte = __ptep_get(ptep);
>>   
>>   	if (pte_cont(pte))
>> -		split_contpte(ptep);
>> +		split_contpte(addr, ptep);
>>   
>>   	return 0;
>>   }
>> @@ -1444,37 +1561,57 @@ static bool pgtable_range_aligned(unsigned long start, unsigned long end,
>>   	return true;
>>   }
>>   
>> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>   				    unsigned long end, bool free_mapped,
>>   				    struct vmem_altmap *altmap)
>>   {
>> -	pte_t *ptep, pte;
>> +	pte_t pte;
>>   
>>   	do {
>> -		ptep = pte_offset_kernel(pmdp, addr);
>>   		pte = __ptep_get(ptep);
>>   		if (pte_none(pte))
>>   			continue;
>>   
>>   		WARN_ON(!pte_present(pte));
>>   		__pte_clear(&init_mm, addr, ptep);
>> +		dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>   		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>   		if (free_mapped)
>>   			free_hotplug_page_range(pte_page(pte),
>>   						PAGE_SIZE, altmap);
>> -	} while (addr += PAGE_SIZE, addr < end);
>> +	} while (ptep++, addr += PAGE_SIZE, addr < end);
>> +}
>> +
>> +static void unmap_hotplug_cont_pte_range(pmd_t *pmdp, unsigned long addr,
>> +					 unsigned long end, bool free_mapped,
>> +					 struct vmem_altmap *altmap)
>> +{
>> +	unsigned long next;
>> +	pte_t *ptep, pte;
>> +
>> +	do {
>> +		next = pte_cont_addr_end(addr, end);
>> +		ptep = pte_offset_kernel(pmdp, addr);
>> +		pte = __ptep_get(ptep);
>> +
>> +		if (pte_present(pte) && pte_cont(pte)) {
>> +			dm_meminfo_sub(addr, CONT_PTE_SIZE, CONT_PTE);
>> +			dm_meminfo_add(addr, CONT_PTE_SIZE, PTE);
>> +		}
>> +
>> +		unmap_hotplug_pte_range(ptep, addr, next, free_mapped, altmap);
>> +	} while (addr = next, addr < end);
>>   }
>>   
>> -static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>> +static void unmap_hotplug_pmd_range(pmd_t *pmdp, unsigned long addr,
>>   				    unsigned long end, bool free_mapped,
>>   				    struct vmem_altmap *altmap)
>>   {
>>   	unsigned long next;
>> -	pmd_t *pmdp, pmd;
>> +	pmd_t pmd;
>>   
>>   	do {
>>   		next = pmd_addr_end(addr, end);
>> -		pmdp = pmd_offset(pudp, addr);
>>   		pmd = READ_ONCE(*pmdp);
>>   		if (pmd_none(pmd))
>>   			continue;
>> @@ -1482,6 +1619,7 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>>   		WARN_ON(!pmd_present(pmd));
>>   		if (pmd_sect(pmd)) {
>>   			pmd_clear(pmdp);
>> +			dm_meminfo_sub(addr, PMD_SIZE, PMD);
>>   
>>   			/*
>>   			 * One TLBI should be sufficient here as the PMD_SIZE
>> @@ -1494,7 +1632,28 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
>>   			continue;
>>   		}
>>   		WARN_ON(!pmd_table(pmd));
>> -		unmap_hotplug_pte_range(pmdp, addr, next, free_mapped, altmap);
>> +		unmap_hotplug_cont_pte_range(pmdp, addr, next, free_mapped, altmap);
>> +	} while (pmdp++, addr = next, addr < end);
>> +}
>> +
>> +static void unmap_hotplug_cont_pmd_range(pud_t *pudp, unsigned long addr,
>> +					 unsigned long end, bool free_mapped,
>> +					 struct vmem_altmap *altmap)
>> +{
>> +	unsigned long next;
>> +	pmd_t *pmdp, pmd;
>> +
>> +	do {
>> +		next = pmd_cont_addr_end(addr, end);
>> +		pmdp = pmd_offset(pudp, addr);
>> +		pmd = READ_ONCE(*pmdp);
>> +
>> +		if (pmd_leaf(pmd) && pmd_cont(pmd)) {
>> +			dm_meminfo_sub(addr, CONT_PMD_SIZE, CONT_PMD);
>> +			dm_meminfo_add(addr, CONT_PMD_SIZE, PMD);
>> +		}
>> +
>> +		unmap_hotplug_pmd_range(pmdp, addr, next, free_mapped, altmap);
>>   	} while (addr = next, addr < end);
>>   }
>>   
>> @@ -1515,6 +1674,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>>   		WARN_ON(!pud_present(pud));
>>   		if (pud_sect(pud)) {
>>   			pud_clear(pudp);
>> +			dm_meminfo_sub(addr, PUD_SIZE, PUD);
>>   
>>   			/*
>>   			 * One TLBI should be sufficient here as the PUD_SIZE
>> @@ -1527,7 +1687,7 @@ static void unmap_hotplug_pud_range(p4d_t *p4dp, unsigned long addr,
>>   			continue;
>>   		}
>>   		WARN_ON(!pud_table(pud));
>> -		unmap_hotplug_pmd_range(pudp, addr, next, free_mapped, altmap);
>> +		unmap_hotplug_cont_pmd_range(pudp, addr, next, free_mapped, altmap);
>>   	} while (addr = next, addr < end);
>>   }
>>   


