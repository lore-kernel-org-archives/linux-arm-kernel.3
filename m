Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5609CF34AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osZbyfauyNW0JhWzjZjYqrRB7Bhju0rETPb9RSTkNHQ=; b=c7xYj/ODcwdgtrqQpJxygD2kT7
	Gi3my+3FoYlUicdVQfMA6GVhe5gbhOM5ft70qH2e2YKJl736XYOZkpjitDLex7kGOX/dITl/VzBH6
	JXvQ9Y8wX215Pn8AfkUeAXYmEsRAK5xjdQbGx2waRF0103UjP5IuhS01dgMn4qBaZZkpsqQMa8Acy
	OhCjSUhfEbiNh6wlvLiXLael/ME2iXAAHe/GtpALMlo2+2y3ZB9FoQ1Rj5s81QCZB6nxCLiiZ5ehZ
	txG3LbeW9IimfMzcl9t9DUeXfwRjD30HqMHY7DIOceOT0IjxoapXv8TdMN6tE6QNO7kJ//ZXV+PZp
	8S9ggHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnwS-000000054o3-1455;
	Wed, 19 Nov 2025 19:34:13 +0000
Received: from mail-eastusazon11021141.outbound.protection.outlook.com ([52.101.52.141] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLnwP-000000054jg-0DL3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 19:34:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWBMG6EEKZT5sDI/iH/tAmQi8I01UQCgGi1GceGSblzO+pstS0KIwyIUtvmfXl8V+OlulIcdhhBn93gnjvt8HbEzquVWAmbwL9ChwV54gNsJLutKYuKSL5NAqOZ5G2YDC0s5o27qTInxNhQsbWD/kZSHs3mfdDukJZ35yzgGN/9VfyBwIho8dd9k9hP0Ot0zbTKsMp0QTuBe272t6rZ+Kfhb0SCBfNPMwN8Yc4wdkSn2OFONwTiVOFNx1xhZqqxeyR3xduj+SRKsvuTE7l/CkHtuLwcxAvgA2VX8JJrpg4fiXvlhjJz/1thjzbieOIwQ/hflZfM5Vk/5MZrMn+dUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=osZbyfauyNW0JhWzjZjYqrRB7Bhju0rETPb9RSTkNHQ=;
 b=ruZ60H/n7kL3dYRMqore0H/KOVdItVRRlUqXcQ+M2jDwkXEAVhEjYlEtunQzR8gcr7S1rZiRLlSAQJ+Bu96eFGdxmIHXzO35e4S59BeoAYrWLH/tR31B9NI7jivP82Cwb2l352Tyl3JvQipxLlmU1yX0GQsxuVCkCczE5tpBMpgbNr7jwQnzjj+7SZSOb4Pc3LTxQ57ff/Bsap7WxpBzQnIcfN9mBhzNUPb2u0IMLUaMHIpme3Yv8cNj1PhambYoa/89mAilIIDlefmIrxIQ2x9DrM6A4doM+ReDki7UO7IvJobchZBcX4KPJxDZEbm/XhVKP/4H72f4FXeYT7vrmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=osZbyfauyNW0JhWzjZjYqrRB7Bhju0rETPb9RSTkNHQ=;
 b=DWck5+5b08+wa27EosFZUX7zcKfD+2yVgGQOfXgWrRQfGXsrizwtdi+ZMFAOU3bgaKyejf43zz+/IxTthaNg3gtkJubvS3zzu5k8cXo7f+h5eZJBUHEVYMSIo2yZVv99qlPxoryr6KTAe9XMvnSfgYDFg25uRbt7jIZ18OSD1S8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 CO1PR01MB6551.prod.exchangelabs.com (2603:10b6:303:f4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 19:34:02 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:34:02 +0000
Message-ID: <8242e898-d1dc-46bc-9896-5c7b074d9e53@os.amperecomputing.com>
Date: Wed, 19 Nov 2025 11:33:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64/pageattr: Propagate return value from
 __change_memory_common
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, will@kernel.org, ryan.roberts@arm.com,
 rppt@kernel.org, shijie@os.amperecomputing.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251112062716.64801-1-dev.jain@arm.com>
 <20251112062716.64801-2-dev.jain@arm.com>
 <3aa3558d-cfc6-43a1-8c73-9b01ed1e2b3e@os.amperecomputing.com>
 <aR4HH1WyCzQk8sqJ@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <aR4HH1WyCzQk8sqJ@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|CO1PR01MB6551:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5c01ba-2793-4a84-b0e9-08de27a29820
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2N1cU1Qc3FkaFNLV0toZ3Faa2FWTmNDVmJRd08rZXVOa3JudjcyMVlNWkkw?=
 =?utf-8?B?M3Z5VVpQTFB4aHNUUW03QnJiRkIwVTBYUUFjcEZ3YzZKdnBIaC84K3pldk0y?=
 =?utf-8?B?NXAwV1ZSb2tBcDlWY2orRURyb3prdDByTk52KzdDQUpEYkdTS3d3b3hneURk?=
 =?utf-8?B?dXZVTTdjMmdUYXdjakNLQlRIcy81OXluSGNIa3dZcWJ4SzZMSk1YVUJudFVs?=
 =?utf-8?B?bDdmOHN1eWZYbnp1MVlBTW9nSFRNMGQ4bHhFTlozYzhLRzVoV1VTbVZnZVk2?=
 =?utf-8?B?WXNqemxPeXl4KzlISlVwSDVoZW82QlA4YUdZY3Jyamd2WUhTbDNrYlc4cEd0?=
 =?utf-8?B?WlBld0pWRU5MMXowNlkrMTZOTHNwTDJLS1MyM0ZtSmdyc3pJTUVDbHk3ekNE?=
 =?utf-8?B?bURGM0FxMHdtRUdXZ0twT3ZyelE2NStxOXBzUVFmTDRNTUtqTjB0ZDZVRlpt?=
 =?utf-8?B?WGJoK0I5WXBWNUxwczJETWM3ODJPUnB4cVdnMDkvRkFmSzRuTzJtSmJGZnl6?=
 =?utf-8?B?Y0hON1RHaTNROGt5NFJTd3UvTWYwejF4QURwS2RtbnJtcFdLU25xaUUvdG1E?=
 =?utf-8?B?YVdOSUo3Vjg2cE93am1INE1Kekg2S0FaRlpIbXh1QUYwNE1mdmtVWXZiSkhx?=
 =?utf-8?B?WVBEZktuNUhEL1VlNFZEaERzWXpzRTBUeVovczh2dHF1RTZkQUo1dFJUOHpa?=
 =?utf-8?B?anJTeU1NZkg1clVDQkNaWFB6NWY1ajc4M2NRZnNxUHpBTXpCNVBCWklyTGFr?=
 =?utf-8?B?ZThGY0VoMmtpbWtDbElxYzFPSW9Zd25qMG1zcUl0VDQ4ZzIvOVd2THZseUJm?=
 =?utf-8?B?cFV3UlYwRUE1S3BENFQ0aVBIcC9YclN2VE9XQ0czK2RTeEpJdzhWaGNiVGl5?=
 =?utf-8?B?cVN6Q2pybEwzaW9ZcW9HUXV3K3RlWlFTTjc3eFJvamh2dHltM3F6aVBQQTVn?=
 =?utf-8?B?cklCVXpGTjFMamJ5OENyOFlvQS9PUVQzbmdVUDlEekdKdEt3dnR6K001cWVF?=
 =?utf-8?B?VWZEVndkNWJ3S1N1T05MbWRGaEJpTFF5cFl0TzZrSFRvYUtkZzkvWFQxb1hZ?=
 =?utf-8?B?VGxxWm1KcjZVRUhVMkJJUzNRbElaVjQ1MGd3R2VHK0FFa3ptWTM5ZjRnQzZt?=
 =?utf-8?B?N1pzbkpjQmFIUndETVpTVEk3SkNwVW0xV0krZlVIN3FHQW1FYnRyenE2U1FI?=
 =?utf-8?B?aVFxaDNnN2dGMVRsSmVhb2R6SXk1MnpmTk5TdHlzMUY4T0J6OXhKTSs2aTdo?=
 =?utf-8?B?L0NyQU96RmhMQ1ZtM25yVEl5ZUtMQnJyV0dKNTZIMTJIYkg4ZExxNWtUYTR5?=
 =?utf-8?B?QmtqM3RQNlNhRWZPMDBjWUJzZDdqSzdQY1diTGtPZ2RzMkZFNzgra0NjbEdL?=
 =?utf-8?B?RExsT3VkbkhZVnk4eXUyV25ldk0zdmpTekFUMmsyZFk4MjY3emhrTGlPeE4w?=
 =?utf-8?B?b1ZoR255RkNLQzh0VUhXeWQvcVVOZ3luZStvR2tyWUxYSHRXazNidWx5RFZY?=
 =?utf-8?B?ekNJUGg2ektqSmhPeEhrUFI2WmFaRG80V0gyUEt6RSthYVFNa2tOcXBaR09M?=
 =?utf-8?B?eDZIRlhGVzd3M3hhVXFkWWc4aDViRjlSQUZZcnhVSkIybGVpTTRnQWtNckVQ?=
 =?utf-8?B?VFBJcXlLVWcrQnRCUE9QdXIwMkdaeUJHMTJMLzNaTUtzbHRjTU81cmYrY0tI?=
 =?utf-8?B?TWlJRE5renU1V1I4cDVmYUNPTi9seUNhd2NUNnVuUHJsTzQ0Q3pCOFlMRHlQ?=
 =?utf-8?B?bC96YktiUS9rMExrbFBjcXlMWHlEVDVYTjZYK0c5TUwvSUQxdGRLWVl0Nko3?=
 =?utf-8?B?eFpQdzBnQ2FwaFVHb0RFZ3RVUDlFckNzclFYeW9HTXJQMHVDSGhYaGxIMjQz?=
 =?utf-8?B?Y0x6d3dGdEcrODZrN1NFRlU4dkhNS2ZHRUJPV3o3MzRYbTZvNXBZS0tTZ3cv?=
 =?utf-8?Q?asuIvbiuopmBv5/chwENN/kqtrNYOcIE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzVadDBqblg1aUQ3eWZIdGxzNG85Nk9vNk1SY2F5T3BTQ3B0TDZ5OW1MQnN2?=
 =?utf-8?B?enlkVTJRYnlBSlcwTWVFK2JNRjJUUDdXQnJ6cmIray9Lb0g4cnV0UURVWVRW?=
 =?utf-8?B?V2hGc3ZKZ2l0RTk2cVlRcWFBU0V3SkhaNVEwam1IUm9aRzlvM1hGZUZIT2Mz?=
 =?utf-8?B?ellmdG1JMHZ3aTdqRFlzWCtKZ1YvUFJTSGMxbWhURmRkRFBWaGFrK2R4dldQ?=
 =?utf-8?B?enlDR0FNcVJEODRKdEpaa3NqNzRDeFJXQU95bEVlOExNUkpyanN6cUVxd0xs?=
 =?utf-8?B?dHFkempYOWdaWW1rdHMrSk1IK1BTU3BNOVZydXBBdzNESkowUElnZUFCVHpj?=
 =?utf-8?B?cFlCT1NYN0pZdEJlSXlmNkU5TTMvWEUrY01Tc0hMaHJMVnF4Uk1QcEczRGZM?=
 =?utf-8?B?VDNFYnJCektpN201UDFUc0EzaXhmbStvZDdKNjdodDlGYnVPWUlDWm5XNDlt?=
 =?utf-8?B?TGdLNVhTV04rUC9MTGhoZGdCVndRaDVLNGFmaWwxaGEvbDNlMnA3TStSQkZZ?=
 =?utf-8?B?V3BlM3U3L0U1YVB1Ym1iMG1wUHBxd1Zvd0NvZThXaHdZZzdibzdGeG10YUY5?=
 =?utf-8?B?WmdtOW1UT1Jtd2dyVzhTclV5ME16NlZoY3NQVEpyMmJ1bGJXTXRoQTBGUk5O?=
 =?utf-8?B?M0gyajJmNTBGMFY4YWlpWm9qMGhIUXM1ZFdyRTBJSStmMHZGWUxNQnNabUdx?=
 =?utf-8?B?RHFFazdXOXc4U3VWL3pRL1RsVHJKcjNMK2svVmcwRGZHOCtpd0xTVFJhcXA4?=
 =?utf-8?B?UVZNd1lEaVE0aEtobmt6d3IyUTE2d2IzY0w3UjRFVHhUKzhCeElBS2ZUdERp?=
 =?utf-8?B?R2ZEZjQwMm9JOHlaYzVZOXFPQU9BSk5WSVdKNkQrT0RzK3FRTng0elBUVXNl?=
 =?utf-8?B?REdIWDUyS29LaTEwb1dXWTVMVTd1dEJCZGo4RHNEWlVWQWxWeEdNaGsxdVJ4?=
 =?utf-8?B?TFNhVkIzTGJhUnh4L2kydGJuWktIR21RbzVnWXk1N3hJcllXNlZ2TktRRWJh?=
 =?utf-8?B?NUl6RGJtTEtMZlFvRGo4NTQzOHlqdzdlbDRYTjJpRDlUSDNZd0ppUGZ2bjBx?=
 =?utf-8?B?bzdYbGlBeDI0TjBnWnRCMG9uNmlsWEU3aWxIOW41N1ZkTERxMWp4czNTTUZQ?=
 =?utf-8?B?bWtHV2VuQTZhWVo3bWQ2T3ZETHQyVisvNUVlc2pmTVhvb0tsNDZqREd1VHZP?=
 =?utf-8?B?eFVhUUJrcjF1Y0djTjZ5S3VoVTVTREFhMlZYV3M4OCtWUzUrd3FnQkZOL3Jq?=
 =?utf-8?B?aXNJRVdSZ0Z1YTloVGZ6KzVrS1U1YjhVZ09uRDFvUmNLcGlaSmVxQWJyek8v?=
 =?utf-8?B?ejAzM3dTQSt6M2luQ2pIMjBLb3hBeW93RUdNd2RGMVB0Ym5mT0lwanpVTzRB?=
 =?utf-8?B?UGhyZFBxdkdWQzNVZEtjckkvZ3VPc3pOSlJKeFhnZ1RINlQwT2l3NVdXZXh1?=
 =?utf-8?B?TUc2UWpKVkdvd1d6VTJDWUpOYVkvaCtVRXhramIyRUd1R2JWbVhVRXpVeDBn?=
 =?utf-8?B?aExYZDhhUEVLNkRTZHFBeE50ZFlselNFRTh5NmUyeGZYMWdBWm1aS1ppUlB3?=
 =?utf-8?B?eGR3ekZNMmNFeTVtc3RUalhrWHZBUklLM2FKbnJhMnhCelpKUUlJcGJjYnZ3?=
 =?utf-8?B?SlFDazJDcGcwTS8zcWlJS2laRkMvVlZSOXhMeVhUVmNKOGh2Q1hNeFlFL2hE?=
 =?utf-8?B?aUt4MitBdEFCV1FWSTF6RlcyNW1ET1BEZjFKNG1qRmFVYzQ3bmFuejhweFo0?=
 =?utf-8?B?YzMwWnlFMytSTGhIMDdFQnBUdC9vUGh1RkhhditkM1BydFN3Zk05QU1uN1lG?=
 =?utf-8?B?SytSMDRQWk96YTBzZGVvbWRRU3dSdkRyb2NUa3dmc0xBdTdpU1N4TzBaRHYr?=
 =?utf-8?B?WC81UUpSZ01KNVZUd2QxSGhRYy8zVDk5SWZiMTJWNm1XYmpwSjlLd2FvQ3BS?=
 =?utf-8?B?M1RORUZxWVgzL1Rpb2lMMnhEa3ZUTWRiN1FDckR2YzhaNHJWZHdwVkFLVVFm?=
 =?utf-8?B?UURkVi9yZ041WGVKNXJDNnZyazRPSUhsNm9neUNlNFdFTjczOW5jZHp2SFI1?=
 =?utf-8?B?amJqVDBUeVpTZU9VY2VRWEE3VVFrS2M2WHBHaHZ6SldHUnd3RVdqcUcwcWpw?=
 =?utf-8?B?ZVd0bWMwNFc2VDJzalljdE4vTUFlV1paSnZFRm94M0dGT0JpUDZnL1pHVGtD?=
 =?utf-8?Q?kq7Y+Ijho4NPIigQt0ztytk=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5c01ba-2793-4a84-b0e9-08de27a29820
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 19:34:02.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6By0utQuUXGQFFGHkEolowYYy3sDFUSVXpcsoAXGtaLcqg1ybqcJk+sy15uFe8MGZG8cvTTmlP8NVoCbO0s9G/Kx4C1jv74mlT711/CVNZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_113409_111674_4EF200B5 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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



On 11/19/25 10:06 AM, Catalin Marinas wrote:
> On Wed, Nov 12, 2025 at 02:27:49PM -0800, Yang Shi wrote:
>> The fix looks good to me. Reviewed-by: Yang Shi
>> <yang@os.amperecomputing.com>
> BTW, I think tools like b4 which I use to apply patches will ignored the
> reviewed-by tag as it's not on a separate line (I haven't checked the
> latest b4 version but I've seen it happening in the past).

Thank you for reminding. I will put my tag in a separate line next time.

Yang

>


