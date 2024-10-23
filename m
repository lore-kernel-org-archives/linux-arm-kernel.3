Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E8ECFA474
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 21:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8/TsMfnimcOTnXE9Hv/frtiKX7kzGgNj68na4iCkwg=; b=iaF0f7HIsE8aodBsOgqQ/cOV4I
	icAmcw2GsE4RZEuhvYHg+pM26vE/YwbUAHKwb6M34jPlMjejSVxLHebSzAq+lpudUKlkCV9OXjHlB
	IrR5j7jdVX9Ef/FX/ghWfQ6Uqu4+XEbodA889ezB0MWoMyTD3ldyiOmUoz43GQd1WI44ncyJWW9HK
	WTxj+XQSDOq6LkgOFJFig/leWhco/0Brq74NKoWUt1i8Rf/BcKFHVRbXtIdx8N4jFIVI8iEt5Ao/A
	0cpmQ7vXvgXMSeZCKv6Qz0sAou6uXXcXZcTA330qCeqRk0nhAfjrvKVbZNpX/57pyEnYuqNKmAPE3
	sGzbVQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iVo-0000000Fv4k-0lXh;
	Wed, 23 Oct 2024 21:03:24 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iUE-0000000FugA-3oDt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 21:01:49 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NKcbGN010773;
	Wed, 23 Oct 2024 21:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=b8/TsMfnimcOTnXE9Hv/frtiKX7kzGgNj68na4iCkwg=; b=
	Mst8oX17pYuC+RstFRVSqvxVZpbgff9PoQ7dDW9uv9uXl9HSURrcUEF7SUqMy5O5
	3KOOcWyv4A42XYC3kMFCDYPQ4cCXZIW2NTJts3Nt+iiHfquhw79GISbHpM9sG4FW
	ntCIq9C/Wd4ywOnGLc1/vl76WSN4VPyVbtrJWZMX697fkJ3OfEGX4j0vUALykj7+
	FPoZJimfw8U3o+8uB0puwC1xqms6dQ3sZK/AVh5R9+LV+5RIjcuNzrfGCTcE5h5U
	+JJ+FJj+g0vPWsmU/oZ47MH4QqOAfji2B0E9kMZAMg/MZmCQuG6/sywN6Q3f330n
	VqwUkML9QW2CNGfzlGg2Bg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c5ash6ah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Oct 2024 21:00:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49NJAPWg027452;
	Wed, 23 Oct 2024 21:00:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emh3cd57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Oct 2024 21:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UckxlzepGo4dVNhxyZw9nbEvtqcIDzk60Cz53s4+qcSVca5jlIV5Ial7U8QI0ZF3cnzepkYsKKMVU4lEijjJu6/X29LcADumbGPUSM+GD0CbgxlgqkqC1yYpgInE5BMpiWkM2xxLaUQQxYtVHOdU+10jTekao0RJnxWH8SrU0bkjorC++pI+6T2XGnsA9KXclozdQeOPgiGqDkswzlocBI1E//I8l8sd7P3wbqEs/tZHs+xZTgrKmXu5u3gxVV3fOsPm9ZYEYQirXHItuIIIPTqJC3dLL6EURglY7OrGd8HVhedqbdPQUxVYZ6pe1nkbQMWMWQIibcgj7RclwA9yIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8/TsMfnimcOTnXE9Hv/frtiKX7kzGgNj68na4iCkwg=;
 b=TrO+wNA646XwaEWggVP1SjLWrxuZKaPcNP3Og35ZS9ez8bMzsbP/311mheYYj3+kT3u75aXTOA0ssK1PyXiORCMF6MWMke1mPsyBslg2JEwu+kayE4navLAdlejdsoDkQtQdJtB3NNVhomMqcVIBiBnN/F5MFG8lOf1b8kLEmR6TcTGrDvtIfMZoxWSRcXTe7vPdI8Ndyqo8czIOP5ZGAg4v/sqQF93kUGsGvnCgJRi4nzWFSRBTezBEdNLjWlivKn0ltrWBhGejPBnY4p/W5qdw1sc2v8DAP0/7EjbsTLLh+75TytKuLuG+17cUuxv/gn+Rd5QeGtfqY4epHF9K0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8/TsMfnimcOTnXE9Hv/frtiKX7kzGgNj68na4iCkwg=;
 b=Lfgit2x4mnYT6hvTbeNA2ZuzkJj8wTBR0hAZ3a4uB6Jem8Tn2xLMBk3z10LS/O4KpHeBBb4SszsG4gqUmXIPxw5YuxTndGZwVEJsOrjrUFF8+SCE6vwspMngZUDZTzwuQSJzSTfAhxo78UPV9ZlJ0tSpY8qkJOHVNEnsAqzRHqM=
Received: from BLAPR10MB5217.namprd10.prod.outlook.com (2603:10b6:208:327::10)
 by SN4PR10MB5590.namprd10.prod.outlook.com (2603:10b6:806:205::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 23 Oct
 2024 21:00:52 +0000
Received: from BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be]) by BLAPR10MB5217.namprd10.prod.outlook.com
 ([fe80::68fa:11c9:9f82:f7be%5]) with mapi id 15.20.8093.018; Wed, 23 Oct 2024
 21:00:52 +0000
Message-ID: <fed3b427-a600-4ce5-afef-4ccbfff64931@oracle.com>
Date: Wed, 23 Oct 2024 17:00:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 00/57] Boot-time page size selection for arm64
To: Ryan Roberts <ryan.roberts@arm.com>, Petr Tesarik <ptesarik@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        David Hildenbrand <david@redhat.com>,
        Greg Marsden
 <greg.marsden@oracle.com>,
        Ivan Ivanov <ivan.ivanov@suse.com>,
        Kalesh Singh <kaleshsingh@google.com>, Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <mbrugger@suse.com>, Miroslav Benes <mbenes@suse.cz>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241017142752.17f2c816@mordecai.tesarici.cz>
 <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
Content-Language: en-US
From: Thomas Tai <thomas.tai@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <aa9a7118-3067-448e-aa34-bbc148c921a2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To BLAPR10MB5217.namprd10.prod.outlook.com
 (2603:10b6:208:327::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB5217:EE_|SN4PR10MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bdbc374-98e8-4a5e-b5b3-08dcf3a5c777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEl4M0E1Ly95YktxZHlhY1A3VU04Q3pSdFJaZ2hCcmdVbjdsMHZPTWpQZzBN?=
 =?utf-8?B?ZTVkd2l0QmRJbkllK3NPSW1pekliNjBnL1lSbDdxSytLZXhncXVjVzQxS0JQ?=
 =?utf-8?B?am9XM0xSdnBPSnVLdFgvcHdnUXd6c0NnTzlINFhIZnUrWEJDSUtaQVliYm9D?=
 =?utf-8?B?cXBXZW44ekRuVGhuaWVjYVRKNXN3R1F4QmZROHIwcnV2T0xjMG1IMUs4S1R4?=
 =?utf-8?B?cFoyRUhreUpoTVRHVUVUc29LSEJiL3RhSk95WU1wRnRzT0kxTEQ2dlpPeEIx?=
 =?utf-8?B?UUo3REh4cE8xdkg5SWk1ZWtXbFM4VjRSN3lyZVRVamRuZU1WOCs0RzdFaUMv?=
 =?utf-8?B?aFl1bHRrRFRXc05NMDB3QnpaQlF1Z1Z5ZDVMYTV2dkZpRlFUUU9BbGtYczF1?=
 =?utf-8?B?ZGVGcFA4Wk1rRDR3R0NXamZxVkJxNVdTZlJpOGNlMmxwZmM3emlNQzNxaldI?=
 =?utf-8?B?VG5mZS9KOUVsb1EvY1FZVFVUOUk4Lzd6cWNZWnNWZjJCYVdONldmZUF2NjI1?=
 =?utf-8?B?cmkwVVhYeFNFNEYrR21IemFUbmozR2xFSVlIeURsay9zUlMrb1AwNEhwWUVI?=
 =?utf-8?B?b2hqcS9aSjlPQk8rOG5YWUoreXMzNlMydEZVbnZRWWxSTzZpb3p1NWwvaGZz?=
 =?utf-8?B?dDFJUkZzWXpXbTlIK2RTczFEVmordzMwNFUrVDFJMzJDNlFEc1pLdWVoZnpn?=
 =?utf-8?B?T3hadGNiSXRRN0VmbkJvK1dEajJPeTFRNjNxam00TittYkozMnhzWEp2Z29V?=
 =?utf-8?B?TTBJNFYvYXA1dXBTVml1YS9JM29aZkRRVHBxb1hQWDJVLzU3YUE2UE1uSGxj?=
 =?utf-8?B?S1VTdGIwMDNmOXdIWnA2SG0xRitMWjJrSUg3K1Z2eGQwcWtTSjVtQUcxRldI?=
 =?utf-8?B?ei9YdHE5dDJpM01UZVJrK3I1T2o0elF0TGdPdVA5QlFtTjhlcnVtYVdHZGI2?=
 =?utf-8?B?d3BlUVpmbExWMkZkbllCK3JIdFhscjhqSEpOVDk0QnV4dXB4ekxsV2hDRmFh?=
 =?utf-8?B?SXJGTlRGNlNFeXY5RlFTdWZsMW9iZmt4RkVNbXBYeWU1b01HWkdVMUJjL1JY?=
 =?utf-8?B?NS9RZkhQdnVYaEx1eHBrcDdJdVlOdG52ODlneU82cS85WWtpZERsUjZjcWpa?=
 =?utf-8?B?bmxsL2NtU0VVLzVUOURMQTNFSUhJYnpGWFRpRVFaMGhsUTFTUitoMFBGdWZ4?=
 =?utf-8?B?Mk5TR0o5N1A1VmhLbFFWbFlySWtmTEJRUFV4QitybHlMWFo5OXpvUS93VXFN?=
 =?utf-8?B?UzVZaHJyNFZtd2EyRE5IcGFBTlBxSnoxZkV3VHVtWGR6N3l4czcwUWZtM29v?=
 =?utf-8?B?VStvY2ZvTDg2elVlSFQ1dVE5WEljVVc0MCtScmt0eGNDaFNnUTVlRDIxZTli?=
 =?utf-8?B?ZjdZSWI3VStjWnViZG9lclhrdWlmZ09PdloxaGI5V0xvNjExT1B1N0l3STJ5?=
 =?utf-8?B?bFphamhDR05wTC9RSFN1TE0rb0c5ZUdaNjdwRVZieWxWcTJ2QkxhOWVsN1Ey?=
 =?utf-8?B?RzlkTTVNK0h4dktPbmx0dXpMdXlmRFdjT0haTWFuY1FKQzBlaU8zR1ZUeG9C?=
 =?utf-8?B?bzBheXNESTd2UHVBNmhsME5EaHBlSU12Q28vSGF6MDIyY2tYNEdQaUZUN1BI?=
 =?utf-8?B?bURRb0tPeDRRZXlqR0o3aUtRZkxuU0ZuUVlmaDU5bFZNU3NpWE5SZm1UenM5?=
 =?utf-8?B?VnprNlQyOXh2VWtqTkp4b09vOHpLeVAwU1d6YklFN1FFYW5pa3ZsYlQydDlU?=
 =?utf-8?Q?nqVWPFB8zedGbdrTGc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5217.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUNpMXEwcHFOQjlacm9HbWFIS3Q1ZWsyT0RxZ2FCN3Yyb1oweXp2QkY5NHY5?=
 =?utf-8?B?ZEp2Vy8yOVllcVpjOFd6VjFCSm9WLzFlYTRPeGNkaGh4SmkyNmRRMFZsYW10?=
 =?utf-8?B?UDhuWUlyU25rbmlGMGs1YU1Nd1lNSUI1WXp2anJjYVEwemZmN1NobUZOTEZQ?=
 =?utf-8?B?VEtzVVlNbkE1WW5IWG9pb2hubVBLdndGam9ua0gwTlBZZDZINkRTWnZzRkp3?=
 =?utf-8?B?S285TXJkVStxV0V4cWt1ZWZuVTJEbnQ2UC81cURmWXJpZm9qczM2YTczUEU3?=
 =?utf-8?B?b1BPTmlXY3RmYnVSSXcrT0xkSTYzeHVXY1BMNWV6eEV1ZEY0M1hNRUF5THlR?=
 =?utf-8?B?R1VaU3YzUjlOdkNWUEQvaEMwQmRzUDZoMi9NeE9YMVdubHUwYkNNa284OXRw?=
 =?utf-8?B?cm82dWV6NjFOV0pUUEtJTHp5RUo4NTkzbFpnVjZyRmhDdG9zWVlBOEU4aTZH?=
 =?utf-8?B?c2lsbzUwWWpFSVQxODY4UXVsZFBTcitMWmZheElld1FTd0orS3piSUxOZVlw?=
 =?utf-8?B?Yy9IakVzQ040Mnp3T3B3d3hldDVaclE4T1U0RWM0Z3I1MHYyOUthWTBscDhB?=
 =?utf-8?B?Wm5UTFdHSnZEWlh1ZFp2QUJSTTFOdDgzdW9odE10Q0h6UDdxZlNjU0dSdTlX?=
 =?utf-8?B?dzBZZFRLVi85WlU5M2xzemgwcG5EMnFrL1FaVWtSNGZJeFBiWDg1MUgzangy?=
 =?utf-8?B?UFpLZExSLzNxWlZIOFhzbSsrcWdyUzdQK3VUd3A0VkhVWU5ZOVNmYkMvRVhX?=
 =?utf-8?B?WHpGUHpsRGZ0Vkd0S0FiYVVTNXZ1cDU5NzhOWjBwMlU1T0IyMUpPMTlIWlcr?=
 =?utf-8?B?am9ScDY3d3RmTG44MUc2ZEdDNlVLUmpnQS9OclZTUDZsMlFSbStxTGtpNm1X?=
 =?utf-8?B?aU55bVVqUkFHS0JzQUNpdUZhVnlPeEZSNExqOHh3bEoxeStjYzVsWlFna3BD?=
 =?utf-8?B?YzNPU3NZOTVHcmNIMFAxaXl4Ty9BM25nV1NEOXllaTRpb1A1UmYwbU5hSkxX?=
 =?utf-8?B?aXl3VjRTSVBUdDNwYzM2ZDJlZW8vdEs2aE40NFZVVmd6ZlVwdHNlbk4yRjdq?=
 =?utf-8?B?cUdNRVN0QmxIZ0twemthMW1FMFlLeldpVTB0bXloc09MSi9ReVIrN3ZocUFC?=
 =?utf-8?B?OWo1d1d6RkJHWkQ5ZFgxM0M4YlUwYVQrOHJKTnp2MDlMelB6Szl0clBOMU81?=
 =?utf-8?B?bWhSeDhkUDNlWE1xQUx0L3RRVlNzbUl4eXd1REN4L09BYmxheUtsYlBqSjdm?=
 =?utf-8?B?aWc0M044aXRsSHhuWkZmdWc3ZWdnRk9xZFlQNk9vU2VuQVdYdGJpRFpoYy9F?=
 =?utf-8?B?aTFPYWdRMVgzVFZKZGdqNVo3amloV3ZBa0dPY1MzelY3bmQxb3pYL3Z6d0FD?=
 =?utf-8?B?T3hMRU1sYkdweFhHd2xQSUQ3Q25vZGJxRUt5dytzdFFxQkdmWi84QVR1N1dL?=
 =?utf-8?B?Z3dTUnhWUW5RNEpnVXdReHlrLzMyUmpBYm0rZHd2STJHU29BV1dyeFN3Sm91?=
 =?utf-8?B?WTNramZJalFiNFl5TkVuOExWVHUyUWdQcmE5THpFVmM0N2FZS2c3UlkwU01D?=
 =?utf-8?B?U0NrMm9qRXM5Rk1hQjN2Q1hkNnhYNUJENVpkdk5udWRQOEZWblpYKzhWZFMx?=
 =?utf-8?B?NWxDVHk0ZnVEdm4vM1BmVTE3a2hrVEZnTHhqdEx1eDRHVE5ocWRWK3lhV29l?=
 =?utf-8?B?NU5hSzh5MExuamk1RjNaUEg4RFRULzR4cGozRjhMdUFrWTFtSzB4YTR2VHo5?=
 =?utf-8?B?L0VhUTRLR2diSUt2L0FxZ3hXaEgvSHhhZmFzanQybEtxS2tmYWdMcXhaTHpE?=
 =?utf-8?B?elRUM1AxNHJKanNMRWpwM3RNUW5ISXFaQVZYdW4xeVRBZDBGVDNpN2hTSVdR?=
 =?utf-8?B?Q01BMlFjRzU2WHlySzc1cTJqZ3BCUkljSnMvZlpKTXlhNlZxbXdOaC9vTUdM?=
 =?utf-8?B?ZUxDN09ZMXNidm1CcGNjVkhmZUV6ZUE4S2pCdmtxcW9idWxXSUdhc3hGLzZ5?=
 =?utf-8?B?ZHlMTUZZQW5XTVh1aUlUSWFydEtxTERxK01FNjQ5djdHRWdpeTNBYk5ONm92?=
 =?utf-8?B?SG0ybmVVZlBRaUdrYisrbUZnY0pRVlBFR0ZXNVhZUG5HK2RYZmd1MlBhWHlW?=
 =?utf-8?Q?PDBJZiofp0G+uWXRw6AtvIBdR?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: radnYXZun8YQ1h4DPJQTXtIIMCMeaoiczAxywLx5HD1K9Ljfy9Ah5UWlS2CL3/epHNDEIMB3W1P4yDAcUff362XTfmXVPohayX8g93SnrV/bV20ZbVN5mSMN5+WQBaw1pBnHtXWrY+xrZugaeJ8CzHRMfxyUyrcxDgI0XQjMiW8XVHawyGHqACDFaV/bAfTp+kJdzb74PvfCh3GjBWO+pDJhhTcUP6GcxkdeVc0sidfjT/IyFB3+LNJkta/gTAreqIwwPYZDshTASR1wqqIoX5uZsTVm0NpEE1k4aPJU3yHA7oKbE2AHFBpGp6uxOIJ37R3EBIJ+8L4EbyRKNBvNTcthqD3xl5F+5S5z9hXG/j9KJguWVbdIV1bFSXEMB2PrYO49ZSUHoNJttCU2zZYLLzYTCy3AwlLv7GPGdqGMEO9VDd5O46J/xUoB9P6bXMJYvutQF1chOkRUJKrL92Vo1/BLyct9bhHaGagltZthkJCgkVCMAuFxep1fK5n9f9ViRSj/DkhGVhs/Uss2DON9nEVUcSspGqVccWKAf/RNTHYupJ++hDJLUd0cDOjOSN5tTSx6i5GBnzcSIchz0KWuiS9EWbkCrqoHMUkE482toFo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bdbc374-98e8-4a5e-b5b3-08dcf3a5c777
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5217.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 21:00:52.3247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIa3+FjxIE0fgFcNmX58mFstTPkHtEf3DAFKoejjoO5/1iFuCczBuz538Q3DZFu4U8M83U4ufv48oxC3AA2+Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5590
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-23_17,2024-10-23_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410230134
X-Proofpoint-GUID: r8m4XH7Vxm3rVkXWt6AwWYHDvXPXt-Rc
X-Proofpoint-ORIG-GUID: r8m4XH7Vxm3rVkXWt6AwWYHDvXPXt-Rc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_140146_979260_A55F6E8F 
X-CRM114-Status: GOOD (  24.23  )
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


On 10/17/2024 8:32 AM, Ryan Roberts wrote:
> On 17/10/2024 13:27, Petr Tesarik wrote:
>> On Mon, 14 Oct 2024 11:55:11 +0100
>> Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>>> [...]
>>> The series is arranged as follows:
>>>
>>>    - patch 1:	   Add macros required for converting non-arch code to support
>>>    		   boot-time page size selection
>>>    - patches 2-36:  Remove PAGE_SIZE compile-time constant assumption from all
>>>    		   non-arch code
>> I have just tried to recompile the openSUSE kernel with these patches
>> applied, and I'm running into this:
>>
>>    CC      arch/arm64/hyperv/hv_core.o
>> In file included from ../arch/arm64/hyperv/hv_core.c:14:0:
>> ../include/linux/hyperv.h:158:5: error: variably modified ‘reserved2’ at file scope
>>    u8 reserved2[PAGE_SIZE - 68];
>>       ^~~~~~~~~
>>
>> It looks like one more place which needs a patch, right?
> As mentioned in the cover letter, so far I've only converted enough to get the
> defconfig *image* building (i.e. no modules). If you are compiling a different
> config or compiling the modules for defconfig, you will likely run into these
> types of issues.

It would be nice if you could provide the defconfig you are using; I also ran
into build issues when using the arch/arm64/configs/defconfig.
  
Thank you,
Thomas

>
> That said, I do have some patches to fix Hyper-V, which Michael Kelley was kind
> enough to send me.
>
> I understand that Suse might be able to help with wider performance testing - if
> that's the reason you are trying to compile, you could send me your config and
> I'll start working on fixing up other drivers?
>
> Thanks,
> Ryan
>
>> Petr T
>

