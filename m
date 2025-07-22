Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04444C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 17:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tQkdq4EeG3TPTC49IBkc6FPF9qdwuyZyGGvdER/8Lg=; b=Fj5ujXD5ssuZddVj+c/yBpKW4v
	Dc249TT0VGXCNLDsAl5LZlNj48uMuDPHLJ3cKv0WMwMZE85cp4Vc0gdA2ENqOZoEbbGliATw3cPR1
	9IClidKyjB9La292OXnNPkRZpOvaKLIg2B/hHWTL1ICs2/jRJrz3RmxXo7cgT8ooYSQhUum+B3TF6
	aH8CF36nqQvihEeq7ZNQ6k2msafyKLZItsVw5CV+dIXOXdQiqBA+HJj1LZg9tqqYdx8PwoZ9lJmOa
	Mu7EouO1V09dRDkVy8EC16d28dJMsr2sXw5KuclDUhG0+ylR1SbuzYjPDZpq/FJ0fNkOxn87DuSxT
	Y93Jn3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueH86-00000003Bfd-2tOf;
	Tue, 22 Jul 2025 17:50:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueH5b-00000003BNU-125T
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Jul 2025 17:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9tQkdq4EeG3TPTC49IBkc6FPF9qdwuyZyGGvdER/8Lg=; b=RCW+M5gI6GoYLguqjzYuSZqury
	J4xavG67rBzM0ePyOfVS56RdRyM656m9aBwN40UZPFzq3hLNATGC3S7BXX1/Go1FgcKosyFe4x+JH
	4Q0TkzwHxKtcM6wp0GvuH08V2ZCf+iNrmAogqGuSbSK6VLQWSB2mHUgHDhymVzMjNXwbK18WFwJ1N
	Mo0wTAhEqcYVZcaU8cOIpUJMumjdYOOqkl2I3awwLPHAgLWQmLRzDDTTgmz7qntseQJIYtUl+nNkW
	qRsoKQKF/XFd7GiysADiF7YXemWtOq8doNQBUh3a+XstSk+yM68yk7mYgyLDpkIPXcvT0cObFnWdh
	tcbY1xTA==;
Received: from mail-bn8nam12on20617.outbound.protection.outlook.com ([2a01:111:f403:2418::617] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueH5X-0000000BKg9-3yU4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 17:47:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxghDVU/CHAbtHitgLyRzrZDLPMLMXnHqZNUYnWhL/PkrBrrk0/lSIwmDYG+hta1KZFLfdrrIzSiQmFZs11MwvxlBpoEzai3WlAzkvAyfgp7011SSaqvgOQYNsxUKes9rHz750WJA6bjaC8akrMko+UBtva7QT3KI3hllwopH97bNH8mAO4h0XCUNNNByukBZRX28hOEqBAcvocFsx3m02CJEtjDbpmim4Eh0gOdeY9QeeTs6jQ6qZNpQC71s+576sP/NaMm5MqCk+SKYMlbmFibhbudTlY8FqgvU+Ww0CUcm8QZ1cZveQcq+SAN5F/uscNlGnMZFsCQaqDCgY0tOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tQkdq4EeG3TPTC49IBkc6FPF9qdwuyZyGGvdER/8Lg=;
 b=sJIuexxd9Sk5KRuS29CTpIu/3DCNmul1C4I9yyUA6DHe2F388PGkVr4KrIN5yheBTs8LGSKyZj+c1Zf8N5ApGMpwelP0s4Qv8ReuGSXw4yTxvr/We7GVZO1a0ZMLdMNxnpVIK0Iooe4ZsDQZkVqGInEYsPuErbb7D3ShWkWEWk8IJMS5p5DfCBXt8nHTFg7p+Au+kuuOtY9BNzasGjK/lsyHBXXUOI58VMT3sa1mOljotNprzkRZ2vudd84OJ0kTMkBN3N+jwFXTAv6R/SJGzAg6dRejBnJNJaAzEot2alDIxRnqQXJCzGi0o6Dsq5ssDdR2Tq0ub7ADJ9551pR2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tQkdq4EeG3TPTC49IBkc6FPF9qdwuyZyGGvdER/8Lg=;
 b=CEkP3ZZUfEGGpMxbltIup99ZW3rQ8zEh4hmM0xcgmUNq6krTh7d/ErquUOWKDOmnFPlGxE5qMS9z9reXW5hL+zwq3WFjKohKefLI9AQXtPRaraqIupE+vshNUhes0mM7JXQpNxfJAHq1c9/jevmtNtSklFOnWRDAYIIywitrAFqqFnFcDNugzyAT4h8VRd29fcS6p5IKlQno8S+J9MocSwzhTGbe48F295/Udu6+MuDMV+VfyqG9HrstXOP2PnRcMFSb7UxwfLs1b2s2yjePuA6H4wJOW/q3a5nK2VkKn/xG1LGi1DpHeaoeX9plV05d54/dnv2ULLHA9ARpWbeCmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 by IA0PR12MB8376.namprd12.prod.outlook.com (2603:10b6:208:40b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Tue, 22 Jul
 2025 17:47:32 +0000
Received: from PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d]) by PH7PR12MB7282.namprd12.prod.outlook.com
 ([fe80::6f03:f851:7f6c:c68d%7]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 17:47:31 +0000
Message-ID: <c6bb6b69-fcf7-40be-9597-883581fa0589@nvidia.com>
Date: Tue, 22 Jul 2025 10:47:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Add device tree for Nvidia's
 GB200 UT3.0b platform BMC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
 andrew@codeconstruct.com.au, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20250718231118.3330855-1-donalds@nvidia.com>
 <20250718231118.3330855-3-donalds@nvidia.com>
 <20250721-hulking-violet-mastodon-16e87a@kuoka>
Content-Language: en-US
From: Donald Shannon <donalds@nvidia.com>
In-Reply-To: <20250721-hulking-violet-mastodon-16e87a@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0034.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::47) To PH7PR12MB7282.namprd12.prod.outlook.com
 (2603:10b6:510:209::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB7282:EE_|IA0PR12MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e6205e-29a8-4794-db31-08ddc947d571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTZ4ZVZTN1pLNVlMT0ZBbGhnbGpiTmdQSGxSSDd0Kzl0NjU4V3h1VkVia3dI?=
 =?utf-8?B?T0J2eTI3NEEyOW1RZWRaMzlYN2ZNZUxxV2tuV3JRRTFGNnJaY2FOc0xOVEE3?=
 =?utf-8?B?WFBiSUVrclJqaUhIczI3T08wK044aVlrOVB3SGpSZFk5WjNmVHpDWTgySlRM?=
 =?utf-8?B?MTlTdlEzSGhJNHN3QzFldERFc25pVUt3eDdDd2o2dnhmQVJxZzlFUDV2dzBq?=
 =?utf-8?B?eGxCaWFrbkp1TU9GMW56TlduZ3UrOG1SanNXV0lKMDhGNEN5TUhteVpTdlBw?=
 =?utf-8?B?S1FyUUp4YzZ1Z0lTNGxobnNQNVdIS3hXRit1aW40UlRtZ3B5aU1VSFVidjVm?=
 =?utf-8?B?eHp6WEs4TWtldTc1ajV1d0U2N3dINmtpQWR6MC96OElpemtqN2Y4YlpHM09L?=
 =?utf-8?B?T1k0ZWRTQXdIbVMwTk9RbThwOGVyb1hlWG4yc1BVSTRuM0FZclBTSG04NE5K?=
 =?utf-8?B?dE1zMjMzSHpHWEVKSmtId0w4Z3I3VG13a3BJeFFId29TZWxLTGhlYU82TjFz?=
 =?utf-8?B?R0psa05LQWI4bHhBYXRsNVVkK2lEN25CR0g5UHRveCtKS1E0V2RYekh2T1Z2?=
 =?utf-8?B?MVljWEdFSXhLem9ZWi92UCs0MnVEaEcyVWcydUpCSUtzang3T1h3L292eUor?=
 =?utf-8?B?dDgzbllxZ2FjVy81YXdtcE9iOG03OWJ0elpXNjdtVHhuRmhDWFN5NFhRUFh5?=
 =?utf-8?B?OERsb0pOeUhLYkJDUWFCZTQ1MHJrOEFuT1llUytkOXdsSmttdEh2ZitzK1Rk?=
 =?utf-8?B?aVB2SGdlamYyT05RWTFGOTUvTHZvcG8rWmNnbzhLRnZHdXpTRElmZDZEVEc1?=
 =?utf-8?B?a3lUakFWUit6Q3JTWXllWm03czF0a25jdFJTS3BXUUdFTytGdnQ5eFpqUGxl?=
 =?utf-8?B?NGtZRW92NjVmK09ZUzZqbHcxVDZmRytGNG5MS1JUUTIrWWpzQ1RsbExZMkZX?=
 =?utf-8?B?QzRyYXNsSHR4eURGRG9rREp3UVMzUE1uc25VTnoyQko4eW9ERGtObkZGbVUy?=
 =?utf-8?B?U2NhdytDT2U2T09NWkpWOXl0NEF3aXJFUFNuQlBwZWNjbE1uUUJWS2tCeW41?=
 =?utf-8?B?WEs3bC9QeURRMmFocW9LWWpaczVkRTVzWjhFRXFQcFgvbzk5TjV5czhRWVFC?=
 =?utf-8?B?cGowWWpFT3VTMGZxelBMOWdmbEJiUVBqS0dWV1YvUEhVWGsxZ3pjSDZJRXlW?=
 =?utf-8?B?UnJyR09lajdtMXZYYlo3QzFQQzR3Vy9WUldPekhvUU0xakl0NVdLUThzTnFS?=
 =?utf-8?B?eDFGMTlDRTZhN3NQdFk1bU5VZm5Cakh5QjVRSkRvb2c1bEVqOGdoQmlmcStE?=
 =?utf-8?B?bGN4ZFhQcXcvSXdrYklYTUpOSGZaSHlxM1gydjVUUERPQkxoYW9lSURMZlcy?=
 =?utf-8?B?Q2RBQThMaC9wczdTWVJPRngybnZCcFJ1ZlBWWTgra3pjQUNJUzBPYk5zTDlC?=
 =?utf-8?B?cXJmclpnOFJBbkdPL0MrK0pRWXlHL1VNVmxNMTdtcDdsMnVqQUpYKytqRzJZ?=
 =?utf-8?B?QXhqaHdFcVZiaTc4N3BXc3lSR1AyUzZuZ2RZdUVoaFF0WHZOSjJUTWtIQTBX?=
 =?utf-8?B?czNRS2hLZG92SFhkd2F6STdYb1JxN0NoemJ2M2hiQ2xFbnp1YTZVRFhnM2c5?=
 =?utf-8?B?TjlrU1llYXFIMXpDYmNXSEpUTWI2cUoyQ00yVVVMd1hpZWQ2SEY5aG5LcGVK?=
 =?utf-8?B?ZXJUdGFUL1JhZkRPbVY0ZGQ1RjlQQURocHpwblpyNVhLVlBKQVl6WFpGc1J5?=
 =?utf-8?B?bE9BWkZUWFZVOEtVSkRKbnRuekxRNkNUeU1mcVB5ZE9pclpaRkZSa3J5TlJo?=
 =?utf-8?B?ZWJzRHd3TmtwOTkzS0c1Q3JiUWhBazdkaGozbFFQb05NMVFxRzVwREZVWWIx?=
 =?utf-8?B?QUtMWDRvendia0VBamlvOEd0SzROd21Ccmx3a283ckpFci9CNlRaTGxXZWto?=
 =?utf-8?Q?jsk0w6t/Jgg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7282.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnlzQXBhbm9CemRLbC9BcElyRVRzRDhnTlR3RDRxRTM2QzVhbnFHdysva2xh?=
 =?utf-8?B?Z3RTenhtb1ZHUGR6UWJpNG56R1Rwb3JLOTVQK0puNHhkNHZNZkFqZ2k4eWI1?=
 =?utf-8?B?SjZrUThNbHA4bllrWS9rS3c4WkJqRGJLNC84Y2VRZTJINE1YWG52Z09EWk9J?=
 =?utf-8?B?U3lsRlFRdVhUT1djeFZCOG4rVWFHbHFkRVNvajlLUmphd3dtQWt1ZXU0WXpD?=
 =?utf-8?B?K3pQR1UrcURmdFV3UGhUM1ZDNFlNUDFhOWE3SU1oVkdLRVc2QitwMTZoK2xj?=
 =?utf-8?B?QzZiTEpFQ21lSmtRUGFzSTcxQ2llQ3FuY3E3VjFxRnNuWW5RamF4Qncvaktr?=
 =?utf-8?B?Q29MZ1Z2U0Q2SDdhYzBTS3l1MzJIREtkL28yM1Nwd3ZDakNlVkdaVTY1Wnp1?=
 =?utf-8?B?M1BpdXJLK1RxclFHUXloU25aV2hia1g4WDA0OG16ODh1TFdiM1JCaXNMYkFs?=
 =?utf-8?B?akdjajd6YStVeXlMMlJoUjIxRUM1RTlKM1MyNyt2bDVpSG5OOW05aHd6N0VG?=
 =?utf-8?B?YU5VMVRaUjlVUjNzY0pTSm5mUkU1bXFUYmd0WVErTzN3VWdNT1BDV29wdUVr?=
 =?utf-8?B?YVdaUE9Lb3RJS2FEYlRtU0NJVEF0U1BKMHA5YzFHRWI5Wk5obnErWms0MGpG?=
 =?utf-8?B?STB1aVJrSEVHRkcxUkRwdTJlOWtjaTAwL0pUOVJhSDNVQWk0ZUlub1dsWlZj?=
 =?utf-8?B?NUdOZEtjTHk0MFJlKzdwbzNiTzJTV3BNNTIxNytqU0VSRkZ2N0R0Yk5xdEdR?=
 =?utf-8?B?YVBqVGxIOVdqTjg5RFczbVlqMUM3VkhGUlg5V3NxeCtka3BmODhZVGQzT0d0?=
 =?utf-8?B?Mkk2SjN3dXcwRlM2cFZCRTNrYjAzdHVDRVl6ajVwbkh2dldNYTBjazRaNW5a?=
 =?utf-8?B?aHhod1R2QldxVC9SamVzRmVNRDNtVlB3WUFWM3NKbmgyNTZMZWxveG5SRjk4?=
 =?utf-8?B?TlJXMUxYZTBoQlZCb0FPM0VEb0lSUk5IUmU1NVQzZnpSRnVZb09Ba3hXR0Ur?=
 =?utf-8?B?enEzZnkvZE1WMDVIYWRaZ0RqRVRqeUozQ3c3TzBuMWp1SFkxWGdldGY2UW9E?=
 =?utf-8?B?YlJvUzVPM21oUDRBaVlnYU1OZDI2Kzl4ekhBQldMSXlhdyt0cVZDczBXZXd4?=
 =?utf-8?B?d2RxV29POUdmVUNscHZCcUo2YlIzc0pmUjFkc0RvVXdGQXR3QUdveStRSWxU?=
 =?utf-8?B?NHkzdXdYT1dvMTJGeHQ2cXJUSXFBblhPOXIxSHFEdUVRZXo5N0czbGhiQkxH?=
 =?utf-8?B?dUlJRVdZSU0yNG54M3gyUVl0SWI0aUd4L1JPdk4ralEwM1VGUEUzT2xQaUd0?=
 =?utf-8?B?RmNQeGdBckxtVit5OFlocUJvVi9lbWNkcDUxUm5DczQ4K3JtQUZVRlR2Zkl2?=
 =?utf-8?B?bFRrNWZyYmt5ellzeG5QS0FieEszcmpXMW9jeGhuMTRsTXRXZ1VnUnlPK2pX?=
 =?utf-8?B?Mkx0UEthdlJ0Y3pxcE03Z0dEOWRnbWoxeUFUclhqQTIwY3VySTRPeTl2OEZm?=
 =?utf-8?B?NmRtaUh1ajdCMEdsamw1Z1Z4YytoQjc3anBhNEIvOGVxQnRqdTlnSk9ZT2xa?=
 =?utf-8?B?ZFBFTUV4cXhla2FwYmZpR0tER3BhRERMSER1WElBOHFKSnI1dnowZmxwa3c0?=
 =?utf-8?B?UHB6cDFqblpoYXRVdFRZMDdhV2l4TnVwZUZuVjVsc1hXKzdnc0dmWVJ4NzdH?=
 =?utf-8?B?cHhPSUpvdnZtdFNSUlp5SnhQOWtzRjlBNmJ6N01UVEhNL0cvVUExemRiYXIy?=
 =?utf-8?B?WkZZQTkxWVhNRFRCcHJTRnpUT1lqbU05UE5vemtGY3Y5Zm5XRWpnNERja3NC?=
 =?utf-8?B?TUd4S2VOL2JhVFcrUVdjR0l3ZSsyWjdvZjVxQk8rOHlFK2RwbjdsOHFSSkg0?=
 =?utf-8?B?L1pLNXF2WlZaUFFIVEtoOTlSa2tqZDMvQkw5QVBJZ3g1MHlJMEpFS09CQjli?=
 =?utf-8?B?ZXZZU1dEd0NIci9QUmNGc050aTdEd09JWXQrbG9ieEhrbVBKYjB6dVNVc0pO?=
 =?utf-8?B?TU1OamViS0xPcGxod2xkd0FyMnBDWXFSSFhzbkRWVWJ0QVEyT1BCM0NVSTVQ?=
 =?utf-8?B?cE9zYU8xMkRweW1NZUg3K3hTaUova1RrbjVYR04yWGcrV01nakp6L3FlQnRD?=
 =?utf-8?Q?XauhfrNjHGDp5FNUuLV98DTRR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e6205e-29a8-4794-db31-08ddc947d571
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 17:47:31.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11+sBahXr8khrAHXOoAiKSR8hR6tPc9rcVqLPXI9CezBnVh0PdYkpOY6vTFiCYpU82mwC94GUaHA/TvuWaf32w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8376
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_184740_239288_D0E70970 
X-CRM114-Status: GOOD (  12.98  )
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

Hi Krzysztof,

Thank you for the button catch.

Though, I don't see a redundant status = "okay"; in the FMC flash.
It is disabled by default in the aspeed-g6.dtsi:

         fmc: spi@1e620000 {
             reg = <0x1e620000 0xc4>, <0x20000000 0x10000000>;
             #address-cells = <1>;
             #size-cells = <0>;
             compatible = "aspeed,ast2600-fmc";
             clocks = <&syscon ASPEED_CLK_AHB>;
             status = "disabled";
             interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
             flash@0 {
                 reg = < 0 >;
                 compatible = "jedec,spi-nor";
                 spi-max-frequency = <50000000>;
                 spi-rx-bus-width = <2>;
                 status = "disabled";
             };

I will reupload v6 with the button and subject line correction and assume the status okay is okay.

Thanks,
Donald

On 7/21/25 00:44, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
>
>
> On Fri, Jul 18, 2025 at 04:11:18PM -0700, Donald Shannon wrote:
>> +
>> +/ {
>> +     model = "AST2600 GB200 UT3.0b BMC";
>> +     compatible = "nvidia,gb200-ut30b", "aspeed,ast2600";
>> +
>> +     aliases {
>> +             serial2 = &uart3;
>> +             serial4 = &uart5;
>> +             i2c16   = &imux16;
>> +             i2c17   = &imux17;
>> +             i2c18   = &imux18;
>> +             i2c19   = &imux19;
>> +             i2c20   = &imux20;
>> +             i2c21   = &imux21;
>> +             i2c22   = &imux22;
>> +             i2c23   = &imux23;
>> +             i2c24   = &imux24;
>> +             i2c25   = &imux25;
>> +             i2c26   = &imux26;
>> +             i2c27   = &imux27;
>> +             i2c28   = &imux28;
>> +             i2c29   = &imux29;
>> +             i2c30   = &imux30;
>> +             i2c31   = &imux31;
>> +             i2c32   = &imux32;
>> +             i2c33   = &imux33;
>> +             i2c34   = &imux34;
>> +             i2c35   = &imux35;
>> +             i2c36   = &imux36;
>> +             i2c37   = &imux37;
>> +             i2c38   = &imux38;
>> +             i2c39   = &imux39;
>> +             i2c40   = &e1si2c0;
>> +             i2c41   = &e1si2c1;
>> +             i2c42   = &e1si2c2;
>> +             i2c43   = &e1si2c3;
>> +             i2c48   = &i2c17mux0;
>> +             i2c49   = &i2c17mux1;
>> +             i2c50   = &i2c17mux2;
>> +             i2c51   = &i2c17mux3;
>> +             i2c52   = &i2c25mux0;
>> +             i2c53   = &i2c25mux1;
>> +             i2c54   = &i2c25mux2;
>> +             i2c55   = &i2c25mux3;
>> +             i2c56   = &i2c29mux0;
>> +             i2c57   = &i2c29mux1;
>> +             i2c58   = &i2c29mux2;
>> +             i2c59   = &i2c29mux3;
>> +     };
>> +
>> +     buttons {
>> +             button-power {
>> +                     label = "power-btn";
> How is this supposed to work? How does anything bind here?
>
>> +                     gpio = <&sgpiom0 156 GPIO_ACTIVE_LOW>;
>> +             };
>> +             button-uid {
>> +                     label = "uid-btn";
>> +                     gpio = <&sgpiom0 154 GPIO_ACTIVE_LOW>;
>> +             };
>> +     };
>> +
>> +     chosen {
>> +             stdout-path = &uart5;
>> +     };
>> +
>> +     leds {
>> +             compatible = "gpio-leds";
>> +             led-0 {
>> +                     label = "uid_led";
>> +                     gpios = <&sgpiom0 27 GPIO_ACTIVE_LOW>;
>> +             };
>> +             led-1 {
>> +                     label = "fault_led";
>> +                     gpios = <&sgpiom0 29 GPIO_ACTIVE_LOW>;
>> +             };
>> +             led-2 {
>> +                     label = "power_led";
>> +                     gpios = <&sgpiom0 31 GPIO_ACTIVE_LOW>;
>> +             };
>> +     };
>> +
>> +     memory@80000000 {
>> +             device_type = "memory";
>> +             reg = <0x80000000 0x80000000>;
>> +     };
>> +
>> +     reg_3v3_stby: regulator-3v3-standby {
>> +             compatible = "regulator-fixed";
>> +             regulator-name = "3v3-standby";
>> +             regulator-min-microvolt = <1800000>;
>> +             regulator-max-microvolt = <1800000>;
>> +             gpio = <&gpio0 ASPEED_GPIO(M, 3) GPIO_ACTIVE_HIGH>;
>> +             enable-active-high;
>> +             regulator-always-on;
>> +     };
>> +
>> +     reserved-memory {
>> +             #address-cells = <1>;
>> +             #size-cells = <1>;
>> +             ranges;
>> +
>> +             vga_memory: framebuffer@9f000000 {
>> +                     no-map;
>> +                     reg = <0x9f000000 0x01000000>; /* 16M */
>> +             };
>> +
>> +             ramoops@a0000000 {
>> +                     compatible = "ramoops";
>> +                     reg = <0xa0000000 0x100000>; /* 1MB */
>> +                     record-size = <0x10000>; /* 64KB */
>> +                     max-reason = <2>; /* KMSG_DUMP_OOPS */
>> +             };
>> +
>> +             gfx_memory: framebuffer {
>> +                     compatible = "shared-dma-pool";
>> +                     reusable;
>> +                     size = <0x01000000>;
>> +                     alignment = <0x01000000>;
>> +             };
>> +
>> +             video_engine_memory: jpegbuffer {
>> +                     compatible = "shared-dma-pool";
>> +                     reusable;
>> +                     size = <0x02000000>;    /* 32M */
>> +                     alignment = <0x01000000>;
>> +             };
>> +     };
>> +};
>> +
>> +// Enable Primary flash on FMC for bring up activity
>> +&fmc {
>> +     status = "okay";
>> +     flash@0 {
>> +             compatible = "jedec,spi-nor";
>> +             label = "bmc";
>> +             spi-max-frequency = <50000000>;
>> +             status = "okay";
> Why do you need it? Anything disabled it?
>
> Best regards,
> Krzysztof
>

