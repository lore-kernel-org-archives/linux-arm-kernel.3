Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A66FCA6C92
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 08:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AhidDH5PKiAARpr9fbyS2bJ3BpYOVnQK75tJY+nRefE=; b=AEN/E9NJpXc/Byv6hQgKVgqtyU
	2c60c7SCXjgs9H8/MpvMfYIzYV0tw9Di5C79/BhQwnJj0g/rnRy+2jxBn8ZUgZYXRMCsxVc6Ye603
	bFlvnQQ/Nwy3QO7Q2eR0Ffy9xesFIlUSR1Z4QB2tykf0tXChwbntu2H0pOs8EkOLGov5Un5MW2BfX
	78tRx3spUVd26tt9Jtcjd8HKeicDPW7x0cS/gI5DKCHTv7bGDLp4d4T+35GiQQUH5151nAwnBkNmU
	R+P5hxZ4sMqKLe9SYS3yw7B9I3WvmnwwRWDeMjTwJ+4JHTxHw6QDWzdeaWzXZ2MgdsGfTsZLgYLMk
	BJKR4vAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeKv-0000000DpRO-1Om4;
	Tue, 27 Jan 2026 08:22:09 +0000
Received: from mx08-0057a101.pphosted.com ([185.183.31.45])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeKn-0000000DpQz-3ZGy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 08:22:04 +0000
Received: from pps.filterd (m0214196.ppops.net [127.0.0.1])
	by mx07-0057a101.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4xQFb2781343;
	Tue, 27 Jan 2026 09:21:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=westermo.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=270620241; bh=AhidDH5PKiAARpr9fbyS2b
	J3BpYOVnQK75tJY+nRefE=; b=SNrbkGzAkEDKXvlqV3UYGS63Bp4eprX7b3x1Rd
	BKvxhvfet1vUHSI8jlwuLKwzaelQ9qJd+h+lokIO4iWsc9zJl/qqM9B1IniNF8pJ
	jYDIWoyEb2dKXgmLNftTWl0bqXPZIBbwNiD1kviWPUTpcW9InDdTtNgYv+Mz3+Rz
	SkZpsiEybAnvR4DlFT9bN9IUw4x90FGpaAKJZrYHh9YG7KJRO1bIWIR3l7nZoc3G
	YLoN2EI7O0t+AQKYxqFrNr/3iYqX5cMf9W2ZLaixC/kLJBQu39RCzKgRFU5le6z+
	n8TPJtje1AoandePEHCSvYZBIAeqA2VCdnl6L3Uol3kO7tdA==
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11023136.outbound.protection.outlook.com [52.101.83.136])
	by mx07-0057a101.pphosted.com (PPS) with ESMTPS id 4bvjy52eh5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 09:21:46 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFX4P36KtC531nNYxq/m7JpKO71UEM7Usi4P8UBb5ag13TfYhh8sKXDjFBtHpaKxcJ6fbHZWhWKh5PTUbshaiVPpTmTVj0freMR0KJWnz8VfA/kxzkAAnkAk2K7CbAXNEP5iXu+CKPZ+FEbhEacDLcyD98bLAsd4eUqF4Cv6qhLdYoL6M5nwY+NJxnpv8D76KUfqObzCT/vBNNGXwgy5byAllJiuR2nrELzL5FPhi33p6wI90T7zf5VXg8uiywGKGIS/KkacWAmZPVLMAH/fhNZu2cTDikyHUbduWwITIOkrURjJYAsWt/D9Di2xf7IZNjHG7XseoGeABpHdNi9W/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhidDH5PKiAARpr9fbyS2bJ3BpYOVnQK75tJY+nRefE=;
 b=EbTfVw1nP6+eNrcIDrfVPVTfmzsdlZS3CtMuyoOhkjGgduO6A1F1uaXkOxjp0A3zlh/eYoVoIryskxNft8G8oK2PuGFXqOE1DmuIYRjx5dQ6QngufDBA0yXBN9PUFdaUdmHg5dpI+sRyUPm5u5F6JkE62DlyGzXIxsIdOLhODXxgxW8PrPtbIkz8kpl0pnBArlcqWeQZkCbb+JyRitvATrFxtZTNBq2tQmgTJMZ5/IiG79RE5xWgagByHnytvpjAKqg0iz5XOwHiDLDR/FdwDpuXccUsX05dbdngBICmj6/+zrjV65AEaFL3gLRMPw2ThMUlUKz/IkYmtRjJJfAZHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=westermo.com; dmarc=pass action=none header.from=westermo.com;
 dkim=pass header.d=westermo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beijerelectronicsab.onmicrosoft.com;
 s=selector1-beijerelectronicsab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhidDH5PKiAARpr9fbyS2bJ3BpYOVnQK75tJY+nRefE=;
 b=X0xQGpT+ZxZ7JFDSHXSgJjo/tnd4Dmzwz9YT0s4BTh05M6Y+9cZ1FbWc1H6c7pacp7UcdrInEWvdXpcXIzTfktKk8GAYn6iZOoX4It6mDXUTNGUXhFha0HbqIPVt+NPa5S3hRKzw3nY4n9GjoBhuZGYr20fHvqgCPvXxzDHo+LE=
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM (2603:10a6:d10:17c::10)
 by AS2P192MB2224.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:642::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Tue, 27 Jan
 2026 08:21:44 +0000
Received: from FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0]) by FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 ([fe80::8e66:c97e:57a6:c2b0%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 08:21:44 +0000
Date: Tue, 27 Jan 2026 09:21:38 +0100
From: Alexander Wilhelm <alexander.wilhelm@westermo.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: USB error on LS1046 platform
Message-ID: <aXh1kjRoGrj0SAyU@FUE-ALEWI-WINX>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: GV3PEPF00003677.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::393) To FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:d10:17c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP192MB2997:EE_|AS2P192MB2224:EE_
X-MS-Office365-Filtering-Correlation-Id: 100140b8-0ec7-4677-84c4-08de5d7d1b3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjFMOGFkS3BpUDNCc04zcHNHeEhtemZwVzhaQ21JNFZQUis5WWVaVU9DeVgv?=
 =?utf-8?B?bWo4ZEYxMTN0NFB4V2txQmF5U2o5UUMyeWpUSHkyVHo3dzNEZjIrUXJHaWJ0?=
 =?utf-8?B?WENlQ2RlUzNvVEhVbUdRcUpQeDkrSjd0TUFyYWRaemVFUVBJS1NlVXBuT1h6?=
 =?utf-8?B?VVRjWEdSbUxBQ3pBUVBxWXBHMCtTT0diTGpEUUt6S0oyVGlRY0RjZFo3KzN3?=
 =?utf-8?B?a0lhRzBQTExuZ1ZvWXBUWjFSNTcrUFhPOG5ZQWZNQmEySDNpVXdHSElTUFdt?=
 =?utf-8?B?V2orTGk5MmtBbVp3K1VkRldoWk5tMnpzTERmVi8zSTZNYkJ4MVU5Qlo3VGhh?=
 =?utf-8?B?cTRWM0J0L0RscFNGTEJVRVF2QlJFYVI2WGZvTmtyVkQ3emFhR2duUExBVHEw?=
 =?utf-8?B?L0p0a0l5bmtGaXhpQWhpb3JzS0JmOU44OWtFVktuMkEwWnZBclNoYllabENs?=
 =?utf-8?B?VTQ3OEFaQzRBeFh1UjlEYWo4cEJ1bzlSNlJMMDl5MEhjTFpaQ0xEYURCZ2xE?=
 =?utf-8?B?NEhoL08zVEZyeHBJbWExeUJDS0x5Zm9rMVJmQWZjVzN2NVlhTklTSFBXdXcv?=
 =?utf-8?B?UnBJRW11cFhoTk8vYlNHU3ZIaUQrVlBHbVEwUlV3ZVQyVVA3Z3l2K2RWSWFR?=
 =?utf-8?B?VVBFSUpYWGVCallHMDVpeVVueWg5K3JrOG93amo2WU5rVCtRbDdQV3FsQ3JV?=
 =?utf-8?B?L2FOQ1AwV2J6Q0U1ajdSaFRJZ3V1cURqalZLRmhEb1Q3SHhpRlBZQ09jdkM2?=
 =?utf-8?B?WEE2QlpqOEhWNXd0cVd5TnZkYWs2cnQyRnhBa21SUEcxTUcvL3htUjl0dnIx?=
 =?utf-8?B?K0FNMGgvT3BFWTN0SFlKMzhmMkg5K3VhZzhwand4T3MyejkxcjVCZ0NNYnRS?=
 =?utf-8?B?bXRIcGt4c3BHNXAzcWI4bnlpeStKK204SnI1dmVEMTVLSlJKdC9NSUxRUHVI?=
 =?utf-8?B?dFJ2VjdGSGFpMmZURCtHR01IUkdaYURydW9vbHNvRUl3K3JnMzFubk1IVm1X?=
 =?utf-8?B?bzZ5Tmo4WGt2ZXJkSHVXT1BLbGV2NTdydElCSEhZWHUvWWltQWRheUNzd1F6?=
 =?utf-8?B?Z2h4V2YvVzRtOEc2OWVXS3J1Mng1TVY5N0gvenhLZUpZR1BzUFdqcThsR1dL?=
 =?utf-8?B?WTJ4L2I1RFRCTDA1RXFHcWErWTJHWUlYaHBpOUZaOTNWSnhZZU04aDNSVE81?=
 =?utf-8?B?QmNIS0NYOHl5MDBuK2VlLzZxU1dUeFo5SU5RZm0vdTZSdTZRYWppdStSeTNB?=
 =?utf-8?B?dFljZUhnNHREVzAwbkdRUXludDZPaHJyeVd6d21aSGFraFF6NGx4VG9sTTM1?=
 =?utf-8?B?ODYxNmFCb0dyeDZrNlJ0OGV1VHJZUFhVREVqcUdTZ3crUHNIbE8yYUVFNGhL?=
 =?utf-8?B?aXFEZEY2eHBpVVFTVTlMQ2Z0Tk9IY3NoalB0WjlwNHBJMnpzSXdRUHlvUzhi?=
 =?utf-8?B?QUo5eitBbk9Tck0yQlBRM2RyZU9KYUVScFpabTRrcHp1N1RWY0JDNEJpV0tq?=
 =?utf-8?B?eS9qaUFkVmZIb3FpS0JjU3dHSWFXWGlkRlRKSWtWbTdxTElNZzJPbzRZb0VQ?=
 =?utf-8?B?SVQ5UDZFcHBubmNmKy9BSFYyUkdLQjk0YjkwZ1Z3SkNWZ29jODBEeHBBd3Zi?=
 =?utf-8?B?S3VkejQ1M21IU0Q3S1o0ZmRLcU1ZajBTeFVtc0ZJQlc2Yit3emdWclZwUjJ2?=
 =?utf-8?B?TkFjSWNMRTNIaytnK2lIN0V2RGU0VVZrRWhHNnZEUlJHNEI0d0cvZUlqMWxR?=
 =?utf-8?B?UXZ5Ni9MV2YrVzR0UHJRT3VvYXBMb1I4Nm5hZFJvVGY4Q2FYZWNXZlltL0ZQ?=
 =?utf-8?B?WitMR2JSSnBPd0hFNlRZTG1yZ21zb0tiM1pKRUFUdjRxWEFFY2F0SFgrVTJR?=
 =?utf-8?B?Vk95aEdGNmlKNXNPdzNkNG5Eei9hN3ZJU3NWUlZYWXRZRVg3SmNuNit3RHMv?=
 =?utf-8?B?cUs2MmlScXFmQUxOSUVDNUprK3VwVGgvRm9tcFBRZUo4MjR4UXVTQ0J2U1dk?=
 =?utf-8?B?R3BJRWRVUVhtNFZ0bmorUERjVVVObHArVGtSNVBzL0g4NC9jTVNrdTI0czRm?=
 =?utf-8?B?ZUZEaEpYaDBSOFM5aThKaDV4UFhiZzBvZW9MamdldWdsR1pIYXErcnphNVJB?=
 =?utf-8?Q?+BcIGSINhcXj9tjtZH7dwRcLl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP192MB2997.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1g2akN2R1BwMStxS011UDZGUDA3YjZObWhQbzFmY2NtVjlvR2U5RlorOVdq?=
 =?utf-8?B?TGxwRWxBU3ZLajRaVERjUnJNMkdDMVpFczIrc29oclhsQnNFSG5namVNclNK?=
 =?utf-8?B?TFVTRzk2M0ZTQ1dZVldJRmJIdStQbWo3SWJLM29JNi9JeWdNOWFRK1M3Y0xF?=
 =?utf-8?B?UktzUTQzdmFQUGdQdHFNWjBhSFVKTXFHU3ppR1dBSEdJb25jNTU0SnRVOUZF?=
 =?utf-8?B?V3BvYzRZOWUzeUVPQjRDd1licEtDdExQaGFoQ1VOSUlwZzlKOVhPTUVjQUZs?=
 =?utf-8?B?NlQvb0hHYWE2R3d0cFhXRkl5R2NYZnc2aXZHMDlDN0ltYXNUbzE2U1JEUW43?=
 =?utf-8?B?MTFTNHNwaW1xTStHaVpsQkdGUDNxTHByWDJjeFBDZ2pGMjVQd1A0ZTJMOC9w?=
 =?utf-8?B?eHRhZnlmcXQrVU5XR216Vk84R0V0aE80T0ZaVlI0UmhMZFBjTDRNaDBTZzQz?=
 =?utf-8?B?VDFvS0d1d0JVTzJWNWNkRHllUldYQlRySzhQcmtPU3ZpcnFhNGN4SkpCNWNn?=
 =?utf-8?B?aGpaNW1EWm1odTJ4a1dFalBnMzRGYUhrOW1jZnU0QlFqNEVSS0hjLzc5MDhQ?=
 =?utf-8?B?NEcxbUpIc0lNSmd5VTFNWlFLWTZRUHBVbU00eThmc3A4WmNBQzJJYWU1Ris4?=
 =?utf-8?B?akJ2Z29KTWY3ZlZvZDhxU0IrYnI3NEtpamhPYThNcndFUWNqdjZhYWx1Wjc1?=
 =?utf-8?B?cFVxcGxEalVZQWxtVFlBQjBsUHFZMHd5cWRrSENuVG8ySGJiNVh5UFZaeVJ4?=
 =?utf-8?B?b1U3Y1JMTG1uS2xIVUQybityYzd4a3piVFdhZlVzUEQvc1VMMlJjUGRuMmRM?=
 =?utf-8?B?UG43YTZvTVpxaUtYN1BDZTkvc1J3bXJodWgyNjFmRUs2Rm13djk0RU9GWERJ?=
 =?utf-8?B?K0JkY3BUOUJXbEt6d2VjS0RoT2JBbTh1WlVreWRxQUl1RDZ4ZnZWck9PbFlI?=
 =?utf-8?B?U3dxaHhaRDZ2OEM3cWdSNk1vdm1jY0FUVEpvZ3VRZVJoc25CWEtSTHY3N3BR?=
 =?utf-8?B?dXhiNDdFTWRkQ2FWK1ppZXBsMGZNelh2a1ZjZWg1TFdjT1ZVbVA4aGhJSnJR?=
 =?utf-8?B?ekE2OWpGcjk2OS9PRHpGUTBIRjBJMjd0RitwRmE4eHJaa0RucFNtMUJnWitL?=
 =?utf-8?B?MFRwZElYVnBuSHNWQzZCSkhCMVlNTWtxcHp3eEhRbkFzbWlIV3hnUk5oVjNZ?=
 =?utf-8?B?SjFSOTZVMEw4TU9TZGtGbi9jbmxkRWNNSmp1UXN2aTdpRE1wc2xtWlJYTE1I?=
 =?utf-8?B?dWQ2ZE9HMkQxSzFRSWZlYWljWDZtRUNaN0hWTlZsQzF1TkpOcmRDWHRyWlAx?=
 =?utf-8?B?TldnS3loaitYdE5QU3ovS3k4YnZaZGswTDY4cDJQR29aOXE0bU9BeFBBL1JV?=
 =?utf-8?B?YjRlUFN5cnplSFl0Zm05eHZDT2dManFPWE5ITWRETEtRZTV0OXVTK3k3S21F?=
 =?utf-8?B?ZEpqWWRxc0lUTVE1YjQzNXZjbUV2dHcxWTV1MXF4TU1MVVlQeWdFYjhoRWJu?=
 =?utf-8?B?VWZCRFh6eXJaWG5hdC9CZzBncDNkMHFsbE4yRUxrVXlGSXZVcHBRS0pwZjJt?=
 =?utf-8?B?UXlRSS90dDJnaGpyckRrbXdlZzhqNzdIc1F2dFhKKy9ja3pMRER2Z01PMm5F?=
 =?utf-8?B?Z0wrdERTWituaTNJaXZ0aHNmRk16TXN0RnZ4L1I5bVdHM2ExamhGRXBzWk9O?=
 =?utf-8?B?RFRNWVBIaEM5ZFdEUFlRT2JRQ05RbjhxbWJGM1NvMkdFTXpCZkpwY3JSVnl3?=
 =?utf-8?B?S3FWMnJSTDZ2ZmFUb25iMUo0dThJckhFblJvY3IzTjJJdTFlUmdLM09TZ0Mw?=
 =?utf-8?B?THJnR3dlZ2JrK0h3UkliRzJFZy9ldUh5d2s0VlVMMjMyNkJnQkZGdmdDVGdM?=
 =?utf-8?B?VEtwRDc3UVR2MzM2Tm9TNDlQSTE4czdMcmd3azcxQzYzTStHVTgwOXAyWHNJ?=
 =?utf-8?B?UE95Mzc5enNyc24zaE5HMlRLb3h4Umk3aGc2T1VpS0UzQ1pzS2dJYThMMmt4?=
 =?utf-8?B?Y1oyRXlUbVZCOWNneEw0bmVkS1RnYTlFZ1FKNW5lYm92V3JqdG81ZnJobU8w?=
 =?utf-8?B?dDNZd0I5S0VmenA5K3dMaXk1eTh6QmNML1RoYjU3ZUxJSzdIOXErUTY4Uy9a?=
 =?utf-8?B?dnV1V3ZxdE1oM1NObkVzNXBPMk9iWWtGM282eWlNQXJkRm03QWhnK2Z0NWZk?=
 =?utf-8?B?TFk5ZDNITFhCd3RoMkV4T2VtMitPQ0k2UGdXQWt2NElhOVhWQmkxVlFDcUV4?=
 =?utf-8?B?Nk0xT1lIUG9JeS83WnVDV0pQaDIwVDZCYnNrOC9oa3FQTWR4dmR2WHd1TXdE?=
 =?utf-8?B?aEpmQWR2YjNJbDBHU0JvOFdWNmdsTzNxRnJ1d3hvcFZ5VGMzT0JkUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MTgHFYGziinbCRkiZr4Fi5G4SI7HqTnpRreSkl9kq3L5o9unWFewYJ08EYkpOz/gtYSs3JZwj4CLRyoZllU3+rjjMT2y0xFqEs1AAZR2eD4mH+aBU1mhwr2n417g/co3MLVDlZy80IObFN0ocUpwWLRY1x6ElmHXXsYbzGGsvKCpYH4gCVACbPaOtTKYWABLXf/PSvFh7fqmPEj0f6/MYHCO92lEp1ySC8SAgFPAMq8xH+Rb2tspBiAFdt8NoNDDZZvvG6GLARt08uN7ghjfUATBp+0W9ML73cjmpFSiEUHTdWgv5Ro4Vao88UscVabiuc3stfLOh2CirJ3n5rjoSBUhHSpRAkKs9KiKgj9XZZu4gkZbfHNJll0agi6KVPkwDEGSZMEIQ/WqXvr3G4tm2sXfGIRZEs7cofoJ7LHcTAMncA6as6YWhRD2OT938TNY1WBT7m0y+NOIXrvC1nxOA8O/xi2sJXb1nS4UkY569g3T0iCv+5ia9WTrIng9CSejpVqEwVlqGQa+/lxYutPE98cjvBr+SHoKTdlx00+PmZCRYvVpo83IRFQj2X0E/5eodA8hPcy+GoqzK1gASm0knheICAF62PmHnoATCb5ne6mOYrlQckObk+9DDAjzA3nb
X-OriginatorOrg: westermo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 100140b8-0ec7-4677-84c4-08de5d7d1b3c
X-MS-Exchange-CrossTenant-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 08:21:44.3430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4b2e9b91-de77-4ca7-8130-c80faee67059
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CT39IWZSo4PL6JhRip9RosgrR0/KKJKje5KbqPRJXmyOcA7GzsZUnzf+kdLEd7ZjmIT2+pXZv4pcdbLqftQvew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P192MB2224
X-MS-Exchange-CrossPremises-AuthSource: FRWP192MB2997.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 14
X-MS-Exchange-CrossPremises-Mapi-Admin-Submission: 
X-MS-Exchange-CrossPremises-MessageSource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-OriginalClientIPAddress: 104.151.95.196
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-Antispam-ScanContext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-Processed-By-Journaling: Journal Agent
X-OrganizationHeadersPreserved: AS2P192MB2224.EURP192.PROD.OUTLOOK.COM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2NyBTYWx0ZWRfX2zuJL0/ikLP0
 G/JoqSLoyoeFn82nUW86qNFQivKCpGcMePnRClvZSklOz0V031cjL1lj0Up4XTZQumhnBmvVqI3
 aBVYw5yps4pHRuKs1pz1V8DgaIzGDxcauQmhBo1nNtPe0uyHOvpiXI3fbOPKAvC1ASX8uN5MYW7
 wvE8wVulUCXpA4q4GZzDLMIeXVsySrZ8kYkOEqAT5uTshojUsGSST0zEoZM4akDqLgnM9vSqcSm
 bcqxOK3svK1XH5hL3dMWsyvNOv0+v8Urkpnclj97QasiuyjAeOhjWc8azExWxcEqXeLI+CSv3XF
 QCksMrm0JLGbz0RGiq+XEGQfklCKGtRrJUXSiNMug0Few+6Tqig4lz+4k1fGCnvQN2wEdrbv6+h
 GPbTw4yBPWvc2pAdhuvUBJ/mGTrivXVL/kdG0kj5UVSgxdYjamUxR0XtMPjUdSNDIQVCRiQ0Q1b
 +nOEHNfV76X3rG3VI8w==
X-Proofpoint-ORIG-GUID: W4LTPrFBrsB4hzBk444Ey4BHIUozP0_7
X-Proofpoint-GUID: W4LTPrFBrsB4hzBk444Ey4BHIUozP0_7
X-Authority-Analysis: v=2.4 cv=P+83RyAu c=1 sm=1 tr=0 ts=6978759a cx=c_pps
 a=0VTmEJu8kJrSWnrl2fAwgg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=8gLI3H-aZtYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=3Nu3HZ8-lFzBu4_yR-oA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_002202_209568_7F6BA91E 
X-CRM114-Status: GOOD (  11.16  )
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

Hello developers,

I’m using an NXP LS1046A SoC with the integrated DWC3 USB controller in
host mode. On Linux v5.5.167 my USB flash drive was detected and mountable.
After upgrading to Linux v6.6.110 the USB flash drive is no longer
recognized. If it is already plugged in during boot phase I get the
following errors:

    xhci-hcd xhci-hcd.2.auto: Error while assigning device slot ID: Command Aborted
    xhci-hcd xhci-hcd.2.auto: Max number of devices this xHCI host supports is 127

I have narrowed the issue down to the following commit:

    136975c33894e7b48a6007af0f4c25f423bbd1de
    arm64: dts: ls1046a: make dma-coherent global to the SoC

When I revert this commit, USB works perfectly on my system.

I have already asked on the `linux-usb` mailing list
(https://lore.kernel.org/linux-usb/aTFr17xKxnWGG3vU@FUE-ALEWI-WINX/) and also
forwarded the message to `linux-arm-kernel`, but I haven’t received any replies
so far. Has anyone encountered this problem on the LS1046 or a similar platform?
Any hints or experiences would be greatly appreciated.


Best regards
Alexander Wilhelm

