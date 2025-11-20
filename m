Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0633CF9C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lypnmxJpV/JFyKomJThQ1c/dR7gMIQLGbpuJSDhhRH0=; b=pjvIBFHdE4L+KkOlO88FEMFrUp
	cuksHxuEZtgyxVY+TdJtTZzMWkou/MP3J7ni3wV+XmGQhwGrfILmLz5s/rh/JELYEQvAeJoSrKLWh
	9Rs5UJ4WXkaMlOVEGiRi0Lugj9yIxR9iDqdJ5eU8IJouhEcHCzPqhim7cjdK7rCIL7lZ8vCIonN05
	EbK9TgqAGuFo/jn6jfrvspRm/2aqZmGbCk6q45XpRIFCGANwGN5njow6fMlJEzFd0veD7rGRCRfwP
	rW9cnupiGSGPcRNqNBm1iWgkEf/4ZRLAaW4CBrOvVOJkI1oNuTPJD5OpISYmp+5FM2I/v7IwfAmyb
	tIhlQjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8X8-00000007A1y-1ufY;
	Thu, 20 Nov 2025 17:33:26 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8X6-00000007A1X-2eeR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:33:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f2ahR2Vlg/TqFlEyxquzW+SHCx8b0rdBwCwaOP6ch7djWjPzQ2GPgN8TW6633D9iwrkYGJAsOkOE0+zXnJ95dDlbv9mmRUsOcK0FQCIzSMRHKkKcdj1Z0WKbqt14VB+SXs1j3h5nRdSBtLR5lKsDo9vFhrelRaHuAASWsoC5040vdDInNnOxbxDk8VeOd4fL4iVWiXS7Ei0v8RfM5IsRqzcesmtvA5UPBOmIeCB1y9Z7ypU6UwXQH9DWj3ZH3iPEI4DwxvdDZNzlj3X7lBTVmbwXfPvZscnOgNATVeP4/Lam9ZxdQZFYlWoVHPi869tXiD8z3t8LQdh+WpYCHom68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lypnmxJpV/JFyKomJThQ1c/dR7gMIQLGbpuJSDhhRH0=;
 b=zGRNz0+iGfR4iPLU96S8arxegLX8HmyYdhUn4NiUh3oeWLYd5tqR52nD4L8jtyNZyrHHjBA2R2pUgYpBuusI+BwGe+nEcKD/e6IdU36P1A4tCw6nRPqJNE/ERwZClPiDh0FbpE4jAwXJ6Ge6LMF9DGs+mimBHqMc3G/2BKGRvPpq8NbUicLS6iehiYXXl2SDMBilrj900htJBwk+kA2hx9g+iwLZo0/s0r4q2OB4oz4bxM2DckGhhN4Zip70MUfJz0cqMRN0d604wJNrMMZLLnoXWxuz26sx58NpHHDsgn+VTQBoqgHUS2fMyvfH2sFo7vScJkG6cMVxhRGa6jB2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lypnmxJpV/JFyKomJThQ1c/dR7gMIQLGbpuJSDhhRH0=;
 b=tJKTy3eS9i8JeEuq2jkBef+m+oOD9qNff4QK55/I+N0V5Uh6GYCImjjfIdwHojTr307wQTh0oSxegzYtVeVHNnZb16gtBTzdkkEByqHwaWfj/4N9dEvPbq3ydG5EmEIQ/v8PUPzULMMsK1FEO4EFa0Ufv/q3g7+kJ7ZOUTDAqMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 DS7PR01MB9167.prod.exchangelabs.com (2603:10b6:8:24f::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Thu, 20 Nov 2025 17:33:18 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%3]) with mapi id 15.20.9343.011; Thu, 20 Nov 2025
 17:33:18 +0000
Message-ID: <6ffacf84-424e-4241-b993-29afcc05da25@os.amperecomputing.com>
Date: Thu, 20 Nov 2025 09:33:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
To: Ryan Roberts <ryan.roberts@arm.com>, cl@gentwo.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251023215210.501168-1-yang@os.amperecomputing.com>
 <3af5d651-5363-47f7-b828-702d9a0c881c@arm.com>
 <0bb112c7-1ed0-4ee1-a1df-6a7d4b224fb6@os.amperecomputing.com>
 <6a3c7a5a-fcb4-4a46-b385-74153f78337a@arm.com>
 <0fb97638-a678-4afc-9d96-cb1b95fc2194@os.amperecomputing.com>
 <33623c93-2d65-4f6f-acf0-7ceb15f36006@arm.com>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <33623c93-2d65-4f6f-acf0-7ceb15f36006@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR15CA0241.namprd15.prod.outlook.com
 (2603:10b6:930:66::10) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|DS7PR01MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: 77d5a9c2-0a0c-4dfb-1c70-08de285ae4db
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2NVRU9hdjdiSk1VdjFBeHZhc2xlcDZ6SzJGQ0V0dXZmeERidTh4M1U3RWEv?=
 =?utf-8?B?elcraEs0WGUzVWt5TXFTV1ZuUlEzSENqQ0lvNzhnUDdtcTVsVW5xejFmWVBP?=
 =?utf-8?B?MzB5UGR6M3I3Umxyc3I2bVdIQTdIdEJmWVdQMEZjNVBOdFhjSnBIenJhWkdo?=
 =?utf-8?B?SDZhTnI4NnpCWHFzNDdvQmxZUEFnc0Z1a3N1RDRMazJwKzE0RGVXaldhZ3hO?=
 =?utf-8?B?dG1NYmsvd3poK0VSaUVHdkRKM3FkZVJZSVpKWFFVcDhBNDZMSE1ZaHVkVUtj?=
 =?utf-8?B?d3M0M2RRQW9tb0xNdXBTdndSYmg4eWdpWk1SWjIxVDBsWnZ1SFBWZWxvaTVS?=
 =?utf-8?B?WlFRd3R4WjBsRVEwdGl2SUpsYnpmTEE2RXFrTmUyWWtpRGIzaldqQ3kyRHpC?=
 =?utf-8?B?SDFXYys3Z2VtTUtrSStlUXVjYXIrYTdzRHViZkhoK3JsZ0NVelBUOW02dGkr?=
 =?utf-8?B?cE9icW1ScEdkUThhQktqRXkvK09pcUQ3NEhBOTB1YmZ5ckxQOTdjMkE3MEcw?=
 =?utf-8?B?Vm5JaHh2MEJQejhLeUhNRWQ3djdvRE5yU2p0NkNSdmluUEVuVnlvbXE5S2tY?=
 =?utf-8?B?WEFzKzJISHBnV1orQXdYdW1MOHhWRXRnNU5YWDkwWUhFRTFFRVhocGRDYVVt?=
 =?utf-8?B?djVSVDdjZ2VwMmFidGpoODNtQTZpdVY1UHc2clQxbE1IM0RjRTBUV0xpTjRi?=
 =?utf-8?B?Y0V6eDFxUHVENjRHSURFemFqNzFYRU9lUG10UG92eTNZbDhJa0R6QU11dlJt?=
 =?utf-8?B?L0pRdmFrWkpZM1BxOGR2S3lTSXlqTnNTTENEREpmSy9oYVYzeGVaUVVod2o0?=
 =?utf-8?B?ZkQyc2dsa1ZvZ3NnYTRYV1pVWFR2Y0RKbEx1L0ZzSDdTdUJVWU1iUXg5K1di?=
 =?utf-8?B?VTNkN2ZUWG1FdW5KdW1EZ0ZueHVKalY4VW9ZdXYrY2NZVHhPZHVHamF6Z1ll?=
 =?utf-8?B?Ky9xMXJJRWRsYmc2aVN2N1diWHErQ3p0L25seTNUcWNMTHpYazFWZmVvemU3?=
 =?utf-8?B?dUJJL0Q3a1ZkMnVtMCtYVUliQ1V3NE9NRmthMXZ0UXhZZjFGdXlFbDlyRm5E?=
 =?utf-8?B?b2w4K0tKNmc3SUkvdXVMbm9uVFYyc215SUxWV0Q0SEhrVEoxRWJ6ZWMyOTNL?=
 =?utf-8?B?TXRsb3JwTm1lWHdYRkExc3RQSitIWXZicHJURmg5Qk9LaG9WYURQbERSWWl0?=
 =?utf-8?B?SENUNmpjT0JWbFZKVDc1a0NsQVVJVEVSWnc2azg3Rjhycmx2cFk2SnhnRE1G?=
 =?utf-8?B?bTk5akN4aGl6cGQwekY3WjlNVUhqNnh6REhpUVpkS1dkWFU0bno2THlkR1pQ?=
 =?utf-8?B?SGgzNjZwcmhneFJHYWVoWExPY1lrUGlkRE5NYXVCNG00cWlOMnYxNlUzUGFL?=
 =?utf-8?B?b3o3cDlvanZUK1IxYjR3cHUwclNFbzZzTVQrRUJ4WG9FWEtKL1JPZkUrOHJq?=
 =?utf-8?B?R3VmcGVCQllrUG9Odi8rSUtTcXJXRUZnM0J0TnA4K3E1UEk5R1g0SkZoNUQw?=
 =?utf-8?B?RmxuTWdVMFRmUXVyR2s0VjlKZDZyWWRIVVl2WUN2TEw2YTNDREhZQUdFaEhO?=
 =?utf-8?B?TlJlWFpjQWd5VXU0TjFnUU9Va29TV2RNcEhCQlAzZzZQZ2ZYUVZselNmVXJr?=
 =?utf-8?B?MklyOGIrK29oM21lK0wvUnM0YjNvVUs4NDM3NG1iZEVPd3BndXB1dWszQ0FJ?=
 =?utf-8?B?NlRhL24zT0xZdk9qRW1qOFFCRElpb04wVGR5V1hZU0h5ZzM0Yk9YaDdzYWJh?=
 =?utf-8?B?T1pLZlhKalhkUVgwREhIdnRjendSMEdZS1FNQXhka0grQ1JPVTJLQWJMUWE2?=
 =?utf-8?B?ZnpRT3AvbUxGVlNhWFZBNFV1cWNHTDR5QjhxK3pKUHl5SW1XNzBTQk50QUkw?=
 =?utf-8?B?ZDZ1R3NWSmh3TnNpdzhkZFlPenVRelZMTDFVa2g3bjdRakdhOVZtVTc0K2t4?=
 =?utf-8?Q?Q9W0HDYQj+V0Hykcb75hJghGqejcS23U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3RxcEhJeDdKYThra2Z1bHNJeEhnYjVCVTd6c2d4bXVKY08yUE1TMUxzQzJO?=
 =?utf-8?B?WVlVa2E1dWtqR2U3ZHAvcXMza3JjbkpXc3lmS2RyMzg1VjJhenY3Y0thcXN2?=
 =?utf-8?B?RGVKdWxTL1NGalk4cEQybXlWNHVhZmkyYnRuTlVzbllMSGN3RHhUUUdQVVdx?=
 =?utf-8?B?OTlQK0tabGRsRnp6a2dyQjNOaVc4ekpMYUp1TDFrM2k4U0dwVnI4V2RIYU8y?=
 =?utf-8?B?TXlmS0I3SWRKQnltVE5JRmdKOW53QUE2ay85Y3RPL3lpVkVoRkdWZy9MYWV4?=
 =?utf-8?B?dC9WdGc3cEY0R1hMalV6ODNjaHFiRnlPdkJIcGhyS0xJaGdnYzZqaEZ2WDNU?=
 =?utf-8?B?NFJEMEVoMUt3dVFyUFpJWHlmbzRjZUE4bml2cmx2TTRVY1JpZUlQRUg3WDJw?=
 =?utf-8?B?UzJoaWJWbVdybG5nY1F3bWQ4aXNXNi9acXE4K0JydWFZUVdXTjZMNEpVa21P?=
 =?utf-8?B?enJHeUtseVo3WTBwaTJ6RUQvUHcrUmUyV0JlYXN2RzUxTTdWT3pZK0VoL3M4?=
 =?utf-8?B?ODJtSTBETkQ3ZUI1ZThzYTFPeEc2enRuZkxLYWFtdGtEeGtPN3czb0xMY1Zy?=
 =?utf-8?B?T1dFZ1J2YUJSYzlab2xpWjZsL3lhQUdIWlpFR09DRXloNkh5QjZUSWczRmFi?=
 =?utf-8?B?eFFzOWZNRlhwQmd6UFdDQXJPbEhOZks2amF5MkVjTG9zRDdvK2poTGo0QWx0?=
 =?utf-8?B?cGtPMTRaUTlmYzQ0cW9DNFhtdU43Nk94NFo2OW1haUM3NmtMSWNMN3BhTVpi?=
 =?utf-8?B?Y2Z5SFRLVlBrRkI5aFBEQmd4Z0FxYyt6bVhUbHYvL1BRQVE4Y2t6Yi9zREw5?=
 =?utf-8?B?Vk9jNUY3T2ZYM3ZLR3FpSXRwU2p4YndzU0p5RkVtcWdwR3ZKaGJQZHBBQWV1?=
 =?utf-8?B?b2tTWUZYbnhscWVja2xFMFZzZjVBaGVTR000b0VaNHJWN1dUbEk3YmJLVC9N?=
 =?utf-8?B?YzFZN3pSTmpMTGpzMVAyTXpMWVE3aFNiVzVKeTJvczQyY055aU1KdEpXWk5H?=
 =?utf-8?B?MXhneDcrcytETkJTdXMxZ2JYUDljc0s5QjF3ejNYcVVZYmdxL01BcW84d2lE?=
 =?utf-8?B?U0NnVDZ3ZmMyanowbDY1bDBDTTVpRDZqYTZlT1ErQXFJVWFLLzY0dXpuNlBk?=
 =?utf-8?B?b1JsUUFTMms3K3ppZGRZdjBNSloyM3ZBdlExSmw2dUE5UVNORHRRZEpKV1Bm?=
 =?utf-8?B?dEJZZWZUditpTE1ianFuSS9RUnk1NHpxa3J6VlZSY01aVXIvTzBBTzlEbmRN?=
 =?utf-8?B?Ny9MMjZoUDE0c3hrMktRUkVGVUZ1SWQzNEpLdXB2NFdubUlhQjlLOE5qV3JH?=
 =?utf-8?B?d2dldWZZdDY0bldoRHpVa3h2aEtoeWlnclFSUUljYXFDS29mWlM4aVRad0NC?=
 =?utf-8?B?V0xOeW00aFhhSTNkM2F0eW1NNTY2azh1VE5KcGV0R2NOM1d2SXNPR0VPWi9i?=
 =?utf-8?B?bmxvaDZKT1Voa0xIQzlXUzlZSWZyUHZHRFpiVUZSNTdWS1ZZYTY3VXMySnJP?=
 =?utf-8?B?cktNc2Z0M05CQU5NZUJjOGFTV2hBMFRWVk9iTklHcWRkK0RET3FvSnRZb0ha?=
 =?utf-8?B?Qk1UZUQ2ckQrZDdIT2M5ZnJtVW1tSkwzZ3pGNjBuV1E2Q2VTN2F2T242dHI2?=
 =?utf-8?B?TlNEUUhmNG9wR0toVy9aU0N1a1RLdHdDVXUxa0pFNm1xTjhjMVU3VWlvUSsy?=
 =?utf-8?B?YmhaTjlENzJIQ0pYQ3BEODhoUWdRRC8rWm9ONjBhdEltSGp4aTlsOTJ1NWt6?=
 =?utf-8?B?YURnZmVKWWM4RTN2QlJsUWdFdEhFZUJ6QmJmbHZvRjY4Um9uVTgzemM0Vm5F?=
 =?utf-8?B?QlVhUk8vaVhIMlJISmNRQTFhTE9DaTduNEd4MmE0RzhFejlLdVN5Ri8xTmhI?=
 =?utf-8?B?VkJmcmE1SGRuR2kzL1lhV2N4ZWJ5SXBCMUhrV3IvbGNaZzc2c1dPYnhWRXBl?=
 =?utf-8?B?VllDeFI5c3pKYUNiS0tGMzBYUkpqeVo3NktqTExJVmp6UkhFbXk0SitOVXAv?=
 =?utf-8?B?WkhEZUd0UWpLV3QrdEo4R1dRTExyMHFvRWVpTlJwSFhYTVFzNXFEVXF1cHp4?=
 =?utf-8?B?L1lOZUpRSW1EeG5QNjhzRjhhUlFieitsMGVNdytYbFluL1U3Yjd0MzFVWGFj?=
 =?utf-8?B?Y1dHMy9ZMWplZk1CRWEwMk1SbjI0MlhLZmdYNEtnQWM5VnJsSlJTVkZoUmda?=
 =?utf-8?Q?0+e8IEoNgu0/t15iqhgcLYw=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77d5a9c2-0a0c-4dfb-1c70-08de285ae4db
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:33:18.6057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlW8C+K4Tf3lnxS6u8aRZvI0Rar4BjyY+at+uRO0YmPSAkyRvjrpWDx3B1im81dkOWZ/DvYd5zKmqLTLBqZ3j1zxQkFLIP+WSQtkqGlhGuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB9167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_093324_698424_131BC495 
X-CRM114-Status: GOOD (  23.51  )
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



On 11/20/25 12:38 AM, Ryan Roberts wrote:
>>>>> I have a long-term aspiration to enable "per-process page size", where each
>>>>> user
>>>>> space process can use a different page size. The first step is to be able to
>>>>> emulate a page size to the process which is larger than the kernel's. For that
>>>>> reason, I really dislike introducing new ABI that exposes the geometry of the
>>>>> kernel page tables to user space. I'd really like to be clear on what use case
>>>>> benefits from this sort of information before we add it.
>>>> Thanks for the information. I'm not sure what "per-process page size" exactly
>>>> is. But isn't it just user space thing? I have hard time to understand how
>>>> exposing kernel page table geometry will have impact on it.
>>> It's a feature I'm working on/thinking about that, if I'm honest, has a fairly
>>> low probability of making it upstream. arm64 supports multiple base page sizes;
>>> 4K, 16K, 64K. The idea is to allow different processes to use a different base
>>> page size and then actually use the native page table for that size in TTBR0.
>>> The idea is to have the kernel use 4K internally and most processes would use 4K
>>> to save memory. But performance critical processes could use 64K.
>> Aha, I see. I thought you were talking about mTHP. IIUC, userspace may have 4K,
>> 16K or 64K base page size, but kernel still uses 4K base page size? Can arm64
>> support have different base page sizes for userspace and kernel? It seems
>> surprising to me if it does.
> Yes arm64 supports exactly this; User page tables are mapped via TTBR0 and
> kernel page tables are mapped via TTBR1. They are both independent structures
> and base page size can be set independently.
>
>> If it doesn't, it sounds you need at least 3 kernel
>> page tables for 4K, 16K and 64K respectively, right?
> No; for my design, the kernel always uses a 4K page table. Only user space page
> tables have different sizes.

I see. IIUC if so you need to let the page fault handler know you need 
16K or 64K so that kernel can allocate 16K or 64K instead of 4K. And you 
also need to let kernel install one single PTE instead of multiple PTEs.

>
>> I'm wondering what kind usecase really needs this. Isn't mTHP good enough for
>> the most usecases? We can have auto mTHP size support on per VMA basis. If I
>> remember correctly, this has been raised a couple of times when we discussed
>> about mTHP. Anyway this may be a little bit off the topic.
> There is still a performance gap between 4K+CONT vs 64K. There are basically 4
> aspects that affect HW performance as the base page size gets bigger:
>
>   - TLB reach (how much memory a single TLB entry can describe)
>   - Walk cache reach (how much memory a single walk cache entry can describe)
>   - number of levels of look up (how many loads are required for full table walk)
>   - data cache efficiency (how efficiently the mappings are described in memory)
>
> 4K+CONT (i.e. 64K-sized mTHP) only solves the first item.

Oh yeah, this is what our benchmarks showed. The cost of page table walk 
is not improved due to the number of levels of look up. So some 
benchmarks don't get too much benefit.

Thanks,
Yang
>
> But as I said, I think there is a high risk of this not actually going anywhere...
>
> Thanks,
> Ryan
>


