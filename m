Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CB2CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwRE91NzS0pK0URblOmCuuOkVf89gQztC8mPfY5JdDk=; b=JUDxyOZ+v2T5iWeH/w6VzNQqrG
	1pQBoQFBwb9sngm0AxbHGb92wTLB0xMJh1QPGAy5QbYNlo7N0GIFc6edCb4fEcn8KKUXip+OCw50W
	jX2wj0L4LpIjbdzOOwqyO5aYA82OOxM7ACD4OG1QdmRHJ8DBmzuVqRs07p+aljSRnKQjr6sUCfosG
	hP0cfN8QjNW0Wm1jso4V0s2vv2zVWC9yYDOh1soEKVPEAUP9S5gcDFOKmBj/0nop+say+D20Ctd7S
	I3IFzo8ZQ4J4acx4rnXBMCqeytnrRTdUGL1AgZKVWmcXT92zezhYE9MweuxFmTs2ajgIT3taTyT7X
	hOz/LA9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLGI-00000005127-2aRf;
	Tue, 02 Dec 2025 07:57:26 +0000
Received: from mx0b-0064b401.pphosted.com ([205.220.178.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLGG-0000000511O-0FHs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 07:57:25 +0000
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B25vUO91573749;
	Tue, 2 Dec 2025 07:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QwRE91NzS0pK0URblOmCuuOkVf89gQztC8mPfY5JdDk=; b=
	TizIfaJsve0IYwxIQXGHhOr+N4coc7qfzjjdY7g/zmfx7HsODQ+G4RaFj90oz0xL
	dlTTHWZfYSNvjMXp+8Qnn/J2oprfAc1B+TsaekO9yzfj7gQJ69xHbp4WHQylYd2F
	1rvUiT1dukz4eNVeX3p0BsAWZjniuk3CBeX/EAXfzC5UCuAAizRY5mZ1hagalTeb
	AKgdHJ3AfEzgh1lB9D1JWhPORjsTr/e86jEHUiD9r8YkAqjWzIq2sbtjbA8pfsTJ
	edSJMfJJmnd+3Hn9Ma6MJvv3xt9f2jqG6yNEfmM6MbmXHl51ORNu37t4ZRCm6Et1
	OyU5QJvsiFeY6P088m4qxQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012023.outbound.protection.outlook.com [52.101.48.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21tvjt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Dec 2025 07:57:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjN46Ci35huor2eus42VAcBBQ1KZlWnDcxxkqRtDyCNk/zvKP5ovBBNko8JtHYvGwJeL2QKhYi9QBwAmS18Akz8D/9dafzRNtE02YZkMEnJ6OdTq9HG7VFkGit9IfsUlY3PwmgDg9ZpQ64lGEe8S72JcoM5VCOfeBePJPh4EUegjigzwHCoHle/OEn6tiPB3qKk+kXU1xdi/Y/zARKpc4K5WNO15Gs9qSiFyIQAsVMNS/P9+SWdHDEq3t7QNcvJIECDx9vJSNlwhnUc9ti0xd/rCC3b2vc77RzNg6ehozzuNjaja9OuUTQObQCsU8Cme4zkdLMxQUhXP6L7qRwx8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwRE91NzS0pK0URblOmCuuOkVf89gQztC8mPfY5JdDk=;
 b=apspuonD/6X3y+8ilD2EeAmYge67DKyRlyt6HSlOOoS/hFhlyUYRpEK+UMFK4YZdLOsGtLq0W+mP1mCal124eEOgFT/yuWZFsOF0pqKJ6tzbabuqSVSeOsl/0AXkI6CavGCn3Ycrw+MrYtdv0/qPRWYSBDfQZC5CRL4bRks/TMH7beO5z+IFc+bY+vALtFQepNO2TqerJzuVHC0LPvd8NIlNJI5jxrAMJP/TwYqynZYNnY95TCzsslVrTvi/vB0dIDw3cnxhGna2PlEaowXoryJ8p25tn1K5kB+RXC7rxjJWR4WQIHodP1NjVb+ZbaJm+t/R2vyzxKqBig1TdjzRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) by
 SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 07:57:06 +0000
Received: from DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e]) by DS0PR11MB7736.namprd11.prod.outlook.com
 ([fe80::43bf:415d:7d0b:450e%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 07:57:06 +0000
Message-ID: <58d796ec-b430-4fc0-9a1c-8f1a6150f051@windriver.com>
Date: Tue, 2 Dec 2025 15:55:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: Fix kexec failure after pte_mkwrite_novma()
 change
To: Anshuman Khandual <anshuman.khandual@arm.com>, catalin.marinas@arm.com,
        will@kernel.org, ardb@kernel.org, ying.huang@linux.alibaba.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251202022707.2720933-1-jianpeng.chang.cn@windriver.com>
 <381a3974-aafa-419f-a7ad-ed6e4c1671f0@arm.com>
Content-Language: en-US
From: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
In-Reply-To: <381a3974-aafa-419f-a7ad-ed6e4c1671f0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7736:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: ba169633-0ac3-404f-6e32-08de317862f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YStKMVlmRHdBMk9vb3F1WGdEWEhBdUdtU3BYeTNiTWNTcnplTUUwaFdLWUly?=
 =?utf-8?B?ZkU1ZVNhVWpxeUs0K3VLOEVCTEpnTHI2M3RXZHZVMXBPQ0dsYXhWSXBpYXRh?=
 =?utf-8?B?N256dnFNVEdsQVFwdXZWRmpFenBaNDd6OWRuTlQwL1k5anVGZXpHRjg2U3RE?=
 =?utf-8?B?M3R4eEgwdXBsSVRqRmU4algzUW1UYnl0SDhQMzhhbDYrUVpIMTlaa3Avd0t0?=
 =?utf-8?B?ZHZoUjJKOEdsZWZUb1huTnljZ2JzemkycWc1MTlhTXJCWlpJZ1Z0VW1xSXhB?=
 =?utf-8?B?SUJFWHIvVG9jMjROTkhMOWZBdm1ndjhlMFBQcE1ESUd5ZjJLWnJCOHdEWW9S?=
 =?utf-8?B?amVodEQ1RjVveVR2LzJOUXovUjR2emVsL2kyMXB3bERDc2lyZy9vclhiTHBW?=
 =?utf-8?B?YVdBRTMwanZaRnNIWVhlbkY0TVp3RSsvMVhhTWtlWGxsc3N2Mm5NenJMVHJ4?=
 =?utf-8?B?YWUyUk9iVVdhVkRwK05JamtvRC8yV3FIaFIxVnl4Y1hTck9LNkFCVXh5bGpF?=
 =?utf-8?B?cm9xaGZpcXY5ZkhqVGtXWUZPaVBRYlZBTXhuVjJzQzRXcitOU1JuRVRoWWVl?=
 =?utf-8?B?VG5NRXBGbFRNUEluVjluMks1RVR2ejdzWlZ0MlhaTUtXSDlXakRLaS9GS0RY?=
 =?utf-8?B?dnRYTFlTV3paK2RkZ0loNitNRmxpbGJGSGRPazVqMi94MGlvZ0VldGEwWnJ1?=
 =?utf-8?B?MXhMbW54aHJEUnJsSnFLT2Z3NjllVExGOWcwdldJMFFibHpHVVRyNTUrZ215?=
 =?utf-8?B?Z21oeUhBbWYrNDVYWk5DbDNFRTZEbXpSSlNBMGd4L0p1NThVelVueTFVWTh3?=
 =?utf-8?B?SUVYbXRHZFJxZ09uU1RaKzFrTjZDQytFcUI5UE1YNExlTDNNdytVRXlneE5o?=
 =?utf-8?B?Q3ZKMFprMUx2eUs4aHVOaUpMUmhCM2EvQlllM2JYbTZZaTFiTURlVm0wcDBV?=
 =?utf-8?B?bmpyV2pERi8xMUFQMlI2Z1MzekhrMFlOOWkya1Z3eWZodC80b2FoUG5xUmZJ?=
 =?utf-8?B?bG9PODNIWWF0RUpxbmVMV053bXNvQTNubnoweWtRam01Rm12VGV0ajhqOUhv?=
 =?utf-8?B?ZVRzbEYwMytNU0ovbTJmK3dKRjcrV1pQUUVBSVNvNWNnd1JoWndLdDh4RWsv?=
 =?utf-8?B?ejZOYmNCY1ZJODYwZFhzSm9kbEpCMjVWcmI0YTVxY0VIcEZWS1E2aHdLZHh6?=
 =?utf-8?B?WFVjTlhmVVg5b1NXMkZjSXVIRVJ5MFk3bDZNSTVFcFh2WFUwTXlhcEttMk9t?=
 =?utf-8?B?b0FIM1NMU0w0eEM4K3VTZ1pDZVFQajV5ODBNOGppS0g4L1hkd1JtMlVWQng0?=
 =?utf-8?B?UENTSEcvYU1NTGJUZTBydWtZMWt0L1ZPSVRLZ2hzN0VqNDUxNVNvOG41VzAx?=
 =?utf-8?B?SzlqeEw1QUh5U0J1OVA2REpGYzhtWExwT1FNWVl0b1dLRHBrdlNaRnYyWnNV?=
 =?utf-8?B?YUcyd0UvejB4UHhtN0ZFbVFvYUd6bU96R3NETUhpYXoxN2RRWjVwVGFld2hx?=
 =?utf-8?B?UUp2VjVWKzJYRnd6bk8xeDVJK2dORENLTFlicmJLa1ZKU2hNRnRZTGNxZXRW?=
 =?utf-8?B?TDFwYTNVOGw1Z0lPK1B2d29xZ2JOZVNtVks5dlNPZ255VzZPaENDd2Q3dk5x?=
 =?utf-8?B?NnNqMW9mQk85c0k0VVd5em80V3BrcVdhVHEyVEozQ2NhRGlWbXpmalB0U0ox?=
 =?utf-8?B?NFphRUJDVXZPWjA1RFhLcDRsN1VWajdmSkd3VTdPZVVwakd5UVhXaU9JMkhI?=
 =?utf-8?B?NElMcE9LbFVSbEhCcVJiVjlodjJGNnVIdmp1V3hGVXhiZXVCZ2ErWCtwR3Ju?=
 =?utf-8?B?aEpOQ3hxVy9NbTdNSVdhazlPbzd6Tks1SnVIaWZyZFU0U2pReGdWdjlGZHJr?=
 =?utf-8?B?SzIxRlY2ZVJvNXN1Y1VpWXM2S0VHTFNhUTM3ejlNeklIL3M3ZjE2ei9sTDls?=
 =?utf-8?B?VE9RWkFTTVFJbDZNSG16M3ZYQXpScVR3RDZIL3BCeVROc3BNcytmQ1Y2M0c4?=
 =?utf-8?B?Y2hudWFnT1R4YnBkS2k4MGE4elVHQW40TnRjcmZsMFZIVFVvc2h5alBPTXNZ?=
 =?utf-8?Q?izNhxT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEhENUlvbU05VGpUZytwUjZNYVBqUlo0TE9Hc1ZSemxRQmJrMysxdVRZUXVS?=
 =?utf-8?B?ZzJQSjYzcXp1aVlCNjY2WHJ6bm5aSkVhSWpIQmhpOEFBQjMza3dxeFk1b2pa?=
 =?utf-8?B?cjNHRmM5SnJNanZkTlpGemtiTFFrN2JCT3h4Kzd6Ry9rR01EWmxJMk4yd3Bs?=
 =?utf-8?B?dXFmb0xQL09sN2pyRmVjZ2VHcGo1bWdYc1hXVlZWQjg5Y0FINzU0Zm5xaWpl?=
 =?utf-8?B?VmtRTW5DZnVwRlJVUDk4OGtjUktLSEYyUGM3VHczN3RPRFc4dkVlQm9aVmRD?=
 =?utf-8?B?cW5XdWhwOHU2bERWeUwyOEFjWHFGNFNLRDkwN2YwYnI4VXlRbHZqQnVHb3o5?=
 =?utf-8?B?aXRNK1RVdHB4YVl0YnZTb25GSmE3dUdHL2FFZzdXTGlHRElHTzRMZWR1TkVv?=
 =?utf-8?B?aTFLaVRLQkF0KzhmaUhzSWVwZTdQdTdFWDV1bTRyemNKMzZMYlJseGdCTDRM?=
 =?utf-8?B?SG9SMXJyOGJHRUdRRlJ4azlpQkFjUkFXR0pmSVQ0NU1yak1VZHY0WDQ5VHBE?=
 =?utf-8?B?bWpyZlZpZGNZRXhQN2JoVk8zUHFvOVVERTh2U05wdEFhdnpZT1NZYURHZFRH?=
 =?utf-8?B?UFpnVDNhdzA3dWc4WnI4R2UzcTBQWDI5RVloVmNGTXFRdXpyQjczYjl6Rlh1?=
 =?utf-8?B?SkFUZGtmZkdBdWF5YTFSd1FCeE8zbzYrU1U1SHQyYTErM3VUQ1R1ZFlqYkU5?=
 =?utf-8?B?SVp6YVJDdHNSdndIM2ZkcEtkZzFtWlI1SkRIbC8xK3laMEFNRHkyZHU1NmpG?=
 =?utf-8?B?cFVlVHJBSlUvb3o5NFBCdlBDUWNVZVNma3A1amxpNFJ2SDdQTCtYQTNMMkxI?=
 =?utf-8?B?K1JvT2hIc3JpMTRDTUw2dU5tNUFSa1g1ME5BZEgxUXlwVThuemJmVzBwa1cx?=
 =?utf-8?B?b3pHVjUxTkU3c05lK084emZUME5xT1gwQkI2ZXJRdXU4SUVIWk5sVVd5UW5O?=
 =?utf-8?B?MDM3UFdGNG9MWCt4YUhLQlBjYUxaL1I2cXgyS3FJMnFaZXA5Ri9wZ0swR3lx?=
 =?utf-8?B?WjdSM3I5SlcrbWFuejBRZ3RQNzc0ZHJaL0lUQzc0SkdsUnlFYjF6SWxjNHdZ?=
 =?utf-8?B?ejM0Mlpjay8wS240dWsvcE5qb1pNUEJWV01pY1dDcWNXcnFXVHlaamxYalRl?=
 =?utf-8?B?STJBM2Vxd0EvMWJHSDVDUEZkNDlVN042VXVhdStoSVgxUU92NHBsWDZkK244?=
 =?utf-8?B?NWp4dGRGR25xV3hNZG1KNnNWWmx5SkpEUzR0UXRaaDd1aUpZYW1icEcvQk1M?=
 =?utf-8?B?ejAxYmwxazNYUTBkV3k4UVc4V0hGb29PcXBWWkQ1emNaWEdaL09uU1BjVHFv?=
 =?utf-8?B?d2pnZDBwbXFvOFJPNTROcVVXWjFmRzlJNmlMY1d1MHBHQXMvS1JadmozYjJT?=
 =?utf-8?B?bVhGQjBta2xRTERiam5NWlJoZjh0TjVSM0NDOXBKVHVLbVkxbFRLblpaNjFE?=
 =?utf-8?B?eDVXOW5PNG5FU2lmQ1VQR0kzMG5HYzJjdThlQmEzaVFsZzF3cGlySjdnVnl0?=
 =?utf-8?B?RitVbG4wV0JhUTQ2ME12UXRMc2IxUjdkNG55MjJhUnRESXdrTmc3WkJQcCtF?=
 =?utf-8?B?WnRXQ09RdWpRb2tXek5VeXI0V3N5RUNBNVc5MkI1dDI4SzlmMzMyWWRRRmZa?=
 =?utf-8?B?N2FGRzlsb2tQcXFDaXNGVHJ0RHpnQi9BeHZrN05WWWc2dXBEVUhRVkk3N0Vr?=
 =?utf-8?B?dFA4UG1Ick1VV2d3WTMvSnpDUER3R2xEcHZJbXJSMFRkN2RUOFJiU2xCNGg0?=
 =?utf-8?B?S1dONUtXQmc4dk9aaEdFUHNidmJhT0ZNVnl3OWc4NmY0blRaN1hPaXFMVmti?=
 =?utf-8?B?dWdNMEltMWVKRFlBekZqTWhZT2d5OXVpV3BxeG96ckl1VWpwam1oRXNvdWsy?=
 =?utf-8?B?QWgvVExRK1o0YVJ6MFFNQ1R4ZktlWWpDTjh6QTNwWVNRUEoyRkc3c1FPVlVX?=
 =?utf-8?B?MTVxUUlEQkFNRjF2bE94Sk90NzJodS9QRXNQWGRBb1B4LzhzM1k3YkRLelhB?=
 =?utf-8?B?UjE0UU1USDlVbU1vdzMxM0s4MTFUdW1QQm53VVVBYlREa0lTZ3NZSFk3Qmk5?=
 =?utf-8?B?VDZENnp6ZWZQQVBFT3NVcm9FTmVFVzRUVjd5UTd6aU9xdThmVFYxN1NuZEcy?=
 =?utf-8?B?WG9LZTRiUjM0WEpURHI5U3hVMlJkMjhkRXdub0RLbnhaL0VHWlZzVTRCUWF3?=
 =?utf-8?Q?UjGQ3fEtoILJwYDwxAEMrfs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba169633-0ac3-404f-6e32-08de317862f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 07:57:06.2012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +WW5sYvTdXRaLM05LkGqePVbdax1RdpOSXEutyKs6EkqDpo2UkUKWrYisS4gSxubyKUTffKKKIy/PRyZ99/Ak1g5Hye253YcgQ9LFLqLx/s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
X-Proofpoint-GUID: ejZ0dtBqBEJvG2dxEdXVfr19G2wRmLZX
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692e9bd4 cx=c_pps
 a=WV97qI32orZZISq0e28SMA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8
 a=psmtr31kSWVZ3rKvTGIA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA2MiBTYWx0ZWRfX7PhjP7uBN5S3
 y+Q25j3w6rFdV/vPcyUUYsfK0R2GZE9aoZ/71lon+ryjIaZ13OS5bUyz+jTAO/kMuRcrOwjOlfT
 EygZfyIbvsi/HnzliZR3/nPgjALmWplHrWSstPI+/mOT9EFGNrlZE3SXtzh+HNoeqo5s2+218Ii
 lHpTEHyFaaLcYVAaTpOgpZMn5DuCIo/c/bihPK52MIvL1VzLBEBZpNrKgNmJ6qQHLkVCQIWjBAc
 kgsnM1lslvukm4r6cjVDNZGtjpQRr8qRWUNOFwxLyfu7ELR4Dca/IY18CG6WxSxUnzlHbTRNusE
 Pt655hloPesKqbImBGbJdqG+PlZamKZBfZdfg5J70jfnC0oI+rXFuiIh3FhK8Jzxg/uOeCh1sOk
 R+lPWOmHoLjWDk2KO53L7VB47QeRUQ==
X-Proofpoint-ORIG-GUID: ejZ0dtBqBEJvG2dxEdXVfr19G2wRmLZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_235724_306654_9EA54DAD 
X-CRM114-Status: GOOD (  24.66  )
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


On 12/2/25 2:57 PM, Anshuman Khandual wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 02/12/25 7:57 AM, Jianpeng Chang wrote:
>> Commit 143937ca51cc ("arm64, mm: avoid always making PTE dirty in
>> pte_mkwrite()") modified pte_mkwrite_novma() to only clear PTE_RDONLY
>> when the page is already dirty (PTE_DIRTY is set). While this optimization
>> prevents unnecessary dirty page marking in normal memory management paths,
>> it breaks kexec on some platforms like NXP LS1043.
>>
>> The issue occurs in the kexec code path:
>> 1. machine_kexec_post_load() calls trans_pgd_create_copy() to create a
>>    writable copy of the linear mapping
>> 2. _copy_pte() calls pte_mkwrite_novma() to ensure all pages in the copy
>>    are writable for the new kernel image copying
>> 3. With the new logic, clean pages (without PTE_DIRTY) remain read-only
>> 4. When kexec tries to copy the new kernel image through the linear
>>    mapping, it fails on read-only pages, causing the system to hang
>>    after "Bye!"
>>
>> The same issue affects hibernation which uses the same trans_pgd code path.
>>
>> Fix this by explicitly clearing PTE_RDONLY in _copy_pte() for both
> via pte_mkdirty() ?
Sorry, for this.

Fix this by marking pages dirty with pte_mkdirty() in _copy_pte(), which
ensures pte_mkwrite_novma() clears PTE_RDONLY for both kexec and
hibernation, making all pages in the temporary mapping writable
regardless of their dirty state.
>
>> kexec and hibernation, ensuring all pages in the temporary mapping are
>> writable regardless of their dirty state. This preserves the original
>> commit's optimization for normal memory management while fixing the
>> kexec/hibernation regression.
>>
>> Fixes: 143937ca51cc ("arm64, mm: avoid always making PTE dirty in pte_mkwrite()")
>> Signed-off-by: Jianpeng Chang <jianpeng.chang.cn@windriver.com>
>> ---
>> v2:
>>   - Use pte_mkwrite_novma(pte_mkdirty(pte)) instead of manual bit manipulation
>>   - Updated comments to clarify pte_mkwrite_novma() alone cannot be used
>> v1: https://lore.kernel.org/all/20251127034350.3600454-1-jianpeng.chang.cn@windriver.com/
>>
>>  arch/arm64/mm/trans_pgd.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
>> index 18543b603c77..08f5ee6643e1 100644
>> --- a/arch/arm64/mm/trans_pgd.c
>> +++ b/arch/arm64/mm/trans_pgd.c
>> @@ -40,8 +40,13 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>                * Resume will overwrite areas that may be marked
>>                * read only (code, rodata). Clear the RDONLY bit from
>>                * the temporary mappings we use during restore.
>> +              *
>> +              * For kexec/hibernation, we need writable access to all
>> +              * pages in the linear mapping to copy the new kernel image.
>> +              * Mark pages dirty first to ensure pte_mkwrite_novma()
>> +              * clears PTE_RDONLY.
>>                */
>                /*
>                 * For both kexec and hibernation, writable accesses are required
>                 * for all pages in the linear map to copy over new kernel image.
>                 * Hence mark these pages dirty first via pte_mkdirty() to ensure
>                 * pte_mkwrite_novma() subsequently clears PTE_RDONLY - providing
>                 * required write access for the pages.
>                 */
I will change it.
>
>> -             __set_pte(dst_ptep, pte_mkwrite_novma(pte));
>> +             __set_pte(dst_ptep, pte_mkwrite_novma(pte_mkdirty(pte)));
>>       } else if (!pte_none(pte)) {
>>               /*
>>                * debug_pagealloc will removed the PTE_VALID bit if
>> @@ -57,7 +62,7 @@ static void _copy_pte(pte_t *dst_ptep, pte_t *src_ptep, unsigned long addr)
>>                */
>>               BUG_ON(!pfn_valid(pte_pfn(pte)));
>>
> The comments should be replicated here as well given the same special situation.
I will change it.
>
>> -             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte)));
>> +             __set_pte(dst_ptep, pte_mkvalid(pte_mkwrite_novma(pte_mkdirty(pte))));
>>       }
>>  }
>>
> static inline pte_t pte_mkwrite_novma(pte_t pte)
> {
>         pte = set_pte_bit(pte, __pgprot(PTE_WRITE));
>         if (pte_sw_dirty(pte))
>                 pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>         return pte;
> }
>
> static inline pte_t pte_mkdirty(pte_t pte)
> {
>         pte = set_pte_bit(pte, __pgprot(PTE_DIRTY));
>
>         if (pte_write(pte))
>                 pte = clear_pte_bit(pte, __pgprot(PTE_RDONLY));
>
>         return pte;
> }
>
> So if pte_write() is true, there will be a redundant PTE_RDONLY clearing which is OK.
> Should this be mentioned in the commit message ?
TBH, I don't have a better idea - any suggestions?

Or, let's add some lines:

Using pte_mkdirty() causes redundant bit operations, but this is
acceptable since it's not a hot path.

