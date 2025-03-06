Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DE8C28B23
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmO2EwbHGkr+P1+7wcstUihhZG1NtqV1kCiWMILpW+E=; b=KX1LcDKFsTri8nZnOc81IZ/SsD
	wV04sQDanz6jBr0nR1dsaF+wn9JP/wBsb5KZvXPib8+BKAhp1O1hPxplvmKQaDIeM7C7P3Kb9E+42
	wq5Xt3PVrH4vK782i1p8HGN6XaAYhawwESP7bBAD42eJOcjD792BsY6ybOLI6VpAm22wa37jvAgCp
	ILxeLwQ7eRMzJYIWmX8oSDrMhL0dWTvDEkv+12H6nvcbcGfOCUK41L73vjgX92L5+3EXXzBpKEl3Q
	ZYJvAbiRmRxj3EjtE+P2h6iIjDKEfULewOpkRL3aa/TN7J52le/EWX6vC7iZ7/ThVHegoN1fQOy4U
	wn5FddRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6xR-0000000AOby-2N9M;
	Thu, 06 Mar 2025 08:51:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6tx-0000000ANrB-2dqR;
	Thu, 06 Mar 2025 08:48:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mmO2EwbHGkr+P1+7wcstUihhZG1NtqV1kCiWMILpW+E=; b=amb5DR9MmK1OSOABP5Mv1jAzy0
	JqZm77Aqv4N1AtGWtXrB4JLSur3Kc0tmuLJUvEHjV3xJIvsM3Yn8kiGtErNk2PRVy3sn4r7HXBvdz
	sUCT8FMd4K3P9pWjwQBb2l228LnBPF4TSH8qnLkLNsaWLbXkzD6HJyXPOQYsdFspEVp1bnMPt5xAb
	dM0JuC0AhAhNov/b6wCtL4APcYR+kvfhDtoh74mqR/hht39cZAE98bs8yMluwHb5L2YSElTeLYpKY
	eM25sq2Ub65trXKh3K4A8L60oCKvPmn/c85szQRr7rkinoL6KAhSdaVQ4mQpVMcJANhidi0JFAqt3
	y6Jh6YyQ==;
Received: from mail-eastasiaazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c400::2] helo=HK3PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6tu-00000000yTI-2qPe;
	Thu, 06 Mar 2025 08:48:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aot/fQBN+SO6crRsq+EmPikPgOxmf3+Mg2jq5JjKN1M/jx4Cld8QZCC6ujYnP/kB0nlMpreZqfyCjeg9YdnBjcBXB359Ap1nN37qWRSDpwO1MoAJGCaY0UlmVd5uXYbg6VZSjKNAFpIiOhWkKdSK7YwhPPnKR8KqXmzDCfDmmLmw08gUnf+srn6C2zdzmNj5GTM9JdATnRjmBrElr1VwrjIePgA/cY+QWtJSip4JVc3z5dvBZU1Jt0oZ7ESy+r0PX8rhetiBqWXuynmVkBcBWGELgabzkAnDC+3TFmE1ZUPngsbDfSOYFmYU7q0E8Y2F71JcVLs3GvahgPFVFzHJoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmO2EwbHGkr+P1+7wcstUihhZG1NtqV1kCiWMILpW+E=;
 b=LpN2hx9XQ4hAtOsfd1SYXjkHaXznry14ZwCyK4kSdFPjfTDGzIhC2ih6J/0NB7O3QKI5VqXEhRQdESoma40QeEQMwsIkmkQPzok4iF4oELQZ3zyC9TACSmS2dTPYR6ZSxaq4NBmgB84t+rvMql/3xRQFo2y8yaEGH3j1DtIUDcAJjNHb6RByg837eHHd+zKhGbWwwptjasHCAC1M05CgKaVRAg4h7bQpcByNEoiaf2Mp2m1/GlB9Ti/gBkwgYrlH/ast20dyQcCKZrgi9y3Y2ZBSq6VOc9i/ThT+4oytMT7bknaotMsD6mQfqlNEAgayN1HW07Jb7JRDegPsZdmDFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmO2EwbHGkr+P1+7wcstUihhZG1NtqV1kCiWMILpW+E=;
 b=O7KB3g/FF2kxhGxy3GJPm+ZCpfzjpcYwoq3X1C+Qe0GhFNwsdG4TWMxq9vfSHdQtX5kSHXdM5GrTf4eX69NmXCjGmUqC5Pya1JkZe4fOelNU752Nqfv4LO+NcgH6pvTiueAFFul6dVFK3oxw/X+fZBilTkPSfjzc1K/6UUdTA2zo1EDGUQNUunoc+3J00KZ66zP2qI56GbXr1HAVZ3ZHKHCq1BmtM4+OGM5o48KIQLYj1dLxpWvm8GI771I8ZCeEd2fI8QQvMAfJWDmi5pO+/MU7HqFMQVDwVvIWuU1Ip2IFm1/jKivHKSdD1v7adj8NCIRJSwE/vHfV4HScNiQGeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SG2PR03MB6635.apcprd03.prod.outlook.com (2603:1096:4:1df::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 08:48:05 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 08:48:05 +0000
Message-ID: <0dbd6e4f-3d96-40de-953c-48a7eae0e598@amlogic.com>
Date: Thu, 6 Mar 2025 16:48:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: interrupt-controller: Add support for
 Amlogic A4 and A5 SoCsy
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20250305-irqchip-gpio-a4-a5-v3-0-1eec70352fea@amlogic.com>
 <20250305-irqchip-gpio-a4-a5-v3-1-1eec70352fea@amlogic.com>
 <20250305-corral-unfair-a7f25abbfd64@spud>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <20250305-corral-unfair-a7f25abbfd64@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SG2PR03MB6635:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e6d0db2-b33a-44b5-3fc0-08dd5c8b9c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkhFcU43TW5nT3F5SkorN1Y3d2hldUd1Ymt2bFNRMk5qZEU2MmFhcW9zN1hp?=
 =?utf-8?B?U3ZmaGExejA1TEpFcmhudnZ1eExJRnE0akxNYVBwaWZ4RHlwdjdhTmhnR0Nr?=
 =?utf-8?B?bm9wNWFkeFNxcVlldVNQQTd4ekRRRHh6QW5QTVRaOC9VUmpwckRNdnFLdS84?=
 =?utf-8?B?ZkNRQWxGN0xueDFORmphZG5kY3FHNVhIRGVVRnVxODl4ZkR1RzFZSGVuL29h?=
 =?utf-8?B?Q3NuNmVZeDFCdGd2RTlUamgweEJIaFNRbzlJbjZhb0JISUhSN2hNZ1NmRnI5?=
 =?utf-8?B?V2RTMGtZVWcybU5DbWV3d0UyVXhSRE11aTdLUHVGVGhUc3RxZ0JCK1hoQy8r?=
 =?utf-8?B?MFNYajN3WXNLRHplMWZ2dlNMQTRnREdEc3dCMi95aFl4UnhHODNMU2JneWtu?=
 =?utf-8?B?QjhyOS9DMUtIZllMSklBckVnUmE1L0FFYUd3Q05xMnBmOWtvc1ZoKy9BSzE1?=
 =?utf-8?B?ZFUzYW9kUDRFQ2lEM2poYTRkRlVaQ3RCaW5VdENCUzhJQytlWW1tWGkrT3Fr?=
 =?utf-8?B?VHJENlZtNy95d2ZhT3ZqK2NsZ05ua1pPbmIzSVVGUUw1UW5MRE80RGtZK1By?=
 =?utf-8?B?TEh6bmtOWVBueTFFd3pJR2xmdmZzbncyL3FDcytwaW1zTWQrN3hPeTh3WXl6?=
 =?utf-8?B?Z3hzYnJ4TFBXWEQ3QkpPanlHYmg4VmNiLzVLSFZxamlyd2FVbmthQjZ4c095?=
 =?utf-8?B?aDN3TmVoZjcwSkE2MitOZUszWVpEWTNGQkJ5YWFvNG1wNlYrY3pQMUhHajM4?=
 =?utf-8?B?NERxZ0tKeGJPbk16MTYvYkg0RkhXWitJZnFGOEp0OXY0YkdQUm5iRUlSRU55?=
 =?utf-8?B?SS9JR3lNVTd4dXZQWGFZVlNsNzJMdkxIcCtod1Bob3M4RXpPU25JNUNEeEJu?=
 =?utf-8?B?WWZEblloQjBoZDRFSUpscC9uS1ZUdVhJRXNmNmE4V0h3aHdRbTlmd1phaHVj?=
 =?utf-8?B?TU9FMmNzb0J0bWtnd3VlZU5mSFhpcEY2Y2F5OEdwT3pndkM5cE9UOGZJTFhm?=
 =?utf-8?B?NHZUYTE4c205VnR3ckNnWUQ4STBGTG44SWpLK0FRR25MY1NUS215Y29SZWpR?=
 =?utf-8?B?L25TNTNSOTJtZUJUazlhN0RhYU04MENjWDJ2NXZsOEkyYXNUK1pWclNiWUta?=
 =?utf-8?B?UzFlYVMzNXJNYWp6SW5IOVhsYlE5anNnankvQlVUaHFQdDNIMDhwUW1aTU5L?=
 =?utf-8?B?MVc3TDA5cnFZc2xmY1VCZkJLSVRBYW5pdlVMR090bHR5U0FDajMyejF1YitD?=
 =?utf-8?B?dnB1QzBXZ0xqYU5OeDJZRDF0cTl0THZrTG15QTdyM2JZWmZTWGRwUTR0bVhT?=
 =?utf-8?B?eEdWSU1Bbks4SlQ4TzFlOXNmVVlWbjdScU94NFRZSk03bnhQa0pabGthVUZw?=
 =?utf-8?B?RVRRL1RYQmVlREdHNzd5RzBLQ09FWVo2dVlSSEZBME5Sd3U4a3d1MFBkaEFD?=
 =?utf-8?B?QUhmMHNIb0d0eEE5b0JJbXYzUCtKalBiZ3FEYVJjcWVXVzFRamNQSFFaSHZL?=
 =?utf-8?B?SnQwNW12Vm9sVVhRWVcvZDNiNUEydE44ZHczaDVlc3IwS0FqQWxBRjlhc2JP?=
 =?utf-8?B?bkJ2bjBLNmk4VU5aeUFTeVg3YkVDNWliOE4zaC94M0ZvcXA5MzVFeUNtSWhx?=
 =?utf-8?B?NmVQZ21sMS9reUw5UlRvWEYzSjVVNnNRZHpIblJFbzdYdi85Y0tUMm9BWTBF?=
 =?utf-8?B?aTdvS21oVU9vdEhxLzc1aU4xVmZTVURpVlpWZU5QalpRbEFzeFhKSStKRXRp?=
 =?utf-8?B?RHZmYmpOcnE4WXN2WlFJYmw0ZHhHc1QweDBLYVZSSnJVTDA4ME9nOTJ3MUQr?=
 =?utf-8?B?ZjAyR2dmMXVJa1Z1U2V6QjRIaXFlaEw1dmdyd2FkeVVUZkN1RURiUWNCQ09t?=
 =?utf-8?Q?rczzPGZXm1piG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWFRd2ZQNDVUSjRVVnlGTk1KZ09tbWtFbDd2SlN2Nk5ncUFrZVBSWlNYa1BK?=
 =?utf-8?B?ZTRsaTZsV3R6NWJQMG1lY2FuWW44MStsS2RoTVdiT0Q5dEdkamt1Zko5c3hU?=
 =?utf-8?B?ZFd4OWR0L09ZYmEyelltcFF1dlNGSU1BeDZBeDExR0lueFg3RFVPam4xR3VQ?=
 =?utf-8?B?VzlYa2xxVE04MzlBQURKdWw4Vjh1MnpSbVVxdnhkM1pKTjRrNmV6c3ZwTlkv?=
 =?utf-8?B?SFJHcDlFNC9hQnJ3ZlVEdTU2Y2V0TUR6Tk84dnlCQmF1M1hiRFQxaWRoVUZS?=
 =?utf-8?B?eUxSS2s3TnlnT2N0MFBoRmR2QUVONGhTYUZFY1h5aVdET01HU0NTWjNvY3c0?=
 =?utf-8?B?L3lxZS9GNmlWcG95eElZK1A1RVM3M3VtNzZ5OWwzWWdpZTVOdkJwN3VHaC9v?=
 =?utf-8?B?Q0xSRkg1NGVlWHMwWHlRVnBTZmlPRUsvZ0FGSmpZWTdaMy9UQzE5UktzQU5l?=
 =?utf-8?B?K2htM0xxMVVSSU1HbVU1SlZ2b2h1V0VxdldkbzUxZmplMUViWG44Yk9uY1dn?=
 =?utf-8?B?NmoxaEdkRGhIa1lwSXJ5S0V3cGtydytXR2I0V3M2RmpMeTh3aWNYZU5xY0xP?=
 =?utf-8?B?MXpDdUNvcVk0YkEvckxiSFJlKzFUZ2pDU3NJVnhkVjA2aHJPK1B4TFYwaEt3?=
 =?utf-8?B?ZVMyRmFjYmVTS2NRQTd0ekthV1FZUVJGMmtrK3gyNGVqQjU1S1B0dGw1ay9N?=
 =?utf-8?B?L1BZNkdQK1lncWM4SWJ6NGZCbm1iZUFuVTRUSTRrWDNBcy9peDFkZFRjcTYz?=
 =?utf-8?B?bTg2VVR4MkdMTzliRTU4Mk9CY3pDMFF2RnpoVTh1RktsdzN0aVcvOXJmeXlM?=
 =?utf-8?B?V0tHYTUvUkkwaHpuajFFcHNkYk84MWt0alcyNUJFaGYwWGgwS3NtclY0cStB?=
 =?utf-8?B?VklzL1VyMXJZaTdjM1l3dmFMWE5XTGw4N1krZG9BS3l2V0U5U0U2S3pIZlUv?=
 =?utf-8?B?cWJjMXBOczFtY3h1MnJ6eGhCQkdYNnlxVXAvR3lTcUhKcGtlbFF0QUtvbk9U?=
 =?utf-8?B?SEdwckhYQkxEdW11ZUYrQ0VweEdLMnluUkJVeE1sWDM1dTN2eEo0aEFxSUJX?=
 =?utf-8?B?OWFsa3d4UXErSSsrMjdDVU1iMllVdlRvcE5kY01EOUpaa0tuM0J2bEZycXl4?=
 =?utf-8?B?T29NSEh0SVhXMllVNGZzNXFrWGZFRjNHQi9nODdUcjFZUGh3US9FNFo3cXhv?=
 =?utf-8?B?SEtZellzRmhLQkVFK2RjSDdyeUgwRDlPTXFaLzBhVmY3RGxIenhieHd6TXBs?=
 =?utf-8?B?Z2EwbThydHRhS2NWQXpwZWhDK0I0aFl1dDg5SjdXRjdlamhIL3ByejBRSHNY?=
 =?utf-8?B?TVRSQmFidXRlTUdGdmtXQ01sRjdISTdzeFJDUjhGeG11MW9pSlhpaEtnRlkr?=
 =?utf-8?B?V0F3ZHBhWmEraUo4WERJTkZDK3YyWmFCREZDNytFV3BjT2hnTGxjMHJYTHR1?=
 =?utf-8?B?MklHWDMzT3M2VHJGQVAvYklOWmNTamc0Y2llZFluK0Q3M3YrNW1VYXNGZXU5?=
 =?utf-8?B?RjJSeWF2WXovYVFYMVFwUDJZMDVlUUMzYjJDdVJ5NkpYSXh1L0ZPN3oyRWdz?=
 =?utf-8?B?YmlYbWhzM01zSjg3NGdDL3p1a1dvNUdxS0hYVnpOWmNsQkhzdk04S1c5Q1V2?=
 =?utf-8?B?YzhCanU2R1BNYWtmTEV0akhLZUVxM3FROXlyZ09tbEdOWDFvOWVmNmtQVXNW?=
 =?utf-8?B?S2ZXMGFFQ2FBTllpKzd6UUJ0ZHU2RHpEVE0zU0FnRWgzSHBHbXgvT1hWenYw?=
 =?utf-8?B?Ny9XK0tSaXdQdTBOcjdnOWJmbmRTa3FJZjJVd3lhQy9jaloxTGo4VXZrTkYy?=
 =?utf-8?B?emNNamVrdWVzODQ2ZGdaUEYrbjQyWXZ3YitJbFhZYVZERDlhWlYyaUpxMmFZ?=
 =?utf-8?B?VlI4OTlTMDBpYU1LVmp5c3d6WThJc3BKR2hOTyttcEp4b2h5dFJtbm5ndDE2?=
 =?utf-8?B?TStDenpSWXNTVTVWMDFjb2Q5T3hPa2FzTXNWMEp5U3lyTWFuMG9rTnVaTi9a?=
 =?utf-8?B?L3MwZDN2bzBlWlB5N3pCbzVscTJ3NGNKRDBWK1JoV1dhRklTWWs1RlFRNlhQ?=
 =?utf-8?B?bERZWnpTbGlNZFRhcnl3VU1wQUo2QVlSN2pEd25IVHFtbUllQUZ4dWM2MUp0?=
 =?utf-8?B?aUM1ZGp3SlltMXVKaldieVdqbWFRMnRVcWdQR3YxZGExL2t6UWFIQkVaM2V6?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e6d0db2-b33a-44b5-3fc0-08dd5c8b9c53
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 08:48:05.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bdP6zvgrawtN3R7xwIK5nCyMC17wn9xXzL5l9TyyY4t6fVryktHCs7gMxIIsebNeiIBrjqmrX46GkdyOuyhb/r6I7zahiTiPXrQMSeMvtZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB6635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_084818_888559_47E7C238 
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

Hi Conor,
     Thanks for your advice.

On 2025/3/6 00:28, Conor Dooley wrote:
> On Wed, Mar 05, 2025 at 06:02:56PM +0800, Xianwei Zhao via B4 Relay wrote:
>> From: Xianwei Zhao<xianwei.zhao@amlogic.com>
>>
>> Update dt-binding document for GPIO interrupt controller
>> of Amlogic A4 and A5 SoCs
>>
>> Signed-off-by: Xianwei Zhao<xianwei.zhao@amlogic.com>
>> ---
>>   .../amlogic,meson-gpio-intc.yaml                    | 21 +++++++++++++++++++--
>>   1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
>> index a93744763787..3c5853c71efa 100644
>> --- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
>> +++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
>> @@ -35,6 +35,9 @@ properties:
>>                 - amlogic,meson-sm1-gpio-intc
>>                 - amlogic,meson-a1-gpio-intc
>>                 - amlogic,meson-s4-gpio-intc
>> +              - amlogic,a4-gpio-intc
>> +              - amlogic,a4-gpio-ao-intc
>> +              - amlogic,a5-gpio-intc
>>                 - amlogic,c3-gpio-intc
>>                 - amlogic,t7-gpio-intc
>>             - const: amlogic,meson-gpio-intc
>> @@ -49,8 +52,6 @@ properties:
>>   
>>     amlogic,channel-interrupts:
>>       description: Array with the upstream hwirq numbers
>> -    minItems: 8
>> -    maxItems: 12
> Please leave the widest constraints here, and let the more restricted
> ones in your if/else below.
> 

Will do.

>>       $ref: /schemas/types.yaml#/definitions/uint32-array
>>   
>>   required:
>> @@ -60,6 +61,22 @@ required:
>>     - "#interrupt-cells"
>>     - amlogic,channel-interrupts
>>   
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: amlogic,a4-gpio-ao-intc
>> +then:
>> +  properties:
>> +    amlogic,channel-interrupts:
>> +      minItems: 2
>> +      maxItems: 12
>> +else:
>> +  properties:
>> +    amlogic,channel-interrupts:
>> +      minItems: 8
>> +      maxItems: 12
>> +
>>   additionalProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.37.1
>>
>>

