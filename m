Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B74FD6D226
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFN8sTo4qU2JIhCk52bj3rudtjY/hBhSv8ztNRC2Qjg=; b=2m044Ub2Rjpg+W7N54UlA3jRP5
	Gr3+bggE/y+kFejq6Eysls1ceYpFUlbcpOtRH9NMl53BJmADwfaEDViiGu1Grthp46egrgJNH4+Bz
	P+MPOT5fQpfrF9xNeIJnIZrfhG1/AFOOJfMrA1sJgpXs87YsgbGE0HMKKaHcNTEl0Hix/bIigsRmz
	T0Ze/nthA9MftnLgR/2sAOsDbg5ILI6yqYAtCJm3U1gu3dNIGB1QHRcqDb/p1mMHCPmUup/90EIj+
	WTfVPoDl4rmfd9gTXGjn2A5nboxyftnJdzalUx57y6oHI9LarqXzmQ40m6IHCQjIRIMLIKKGxuoWC
	tjbRbW3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEnA-00000008bKR-2aM3;
	Thu, 18 Dec 2025 14:15:44 +0000
Received: from mail-westcentralusazon11013023.outbound.protection.outlook.com ([40.93.201.23] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEn7-00000008bJ5-1Fxy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 14:15:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLQYm1u8NH3IN38Gu6Cbdt6/zvCq1cxr5ON+iauBmsA9eYNKvMaPWRZ0su7qb0xWER8Ehs77q6vP/G9GZ/v71B64tujWeFgSkGyrzfrbIcPHPjIS1cTOOun69P2UhP3wYcoxVrhKFtEPne1u6RQk4rG38zeieTqMF+cHnZIIt0Lyq/XopqVwmDUMFnkilWJb3+rDiK9S4P6vALTOFxMOAp4N8pb75o/GWh5Dfscp6wLWaYQHiMbtBWRkoikBJZR97bsaG3x6hz9p43lNN62akLcrguENfn15IyA221NIBY1h5xxwtAjkS/Q65iVS6Jeed3DnxcbSH8DNiyQouaGJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFN8sTo4qU2JIhCk52bj3rudtjY/hBhSv8ztNRC2Qjg=;
 b=yvGA3UAXchqyppmQKLBPHVxcz2JPo/Cxc/iFZ37r8/fXMkat1hJCL+jdtjP8UIq6WD1p03qnSQ5xZhEFJ76tugfyvSqW+QSy+EdNIS2dPdGMA0WdSjur4gmgx4uFeb10HbU7ZGLVTxPvZKy4Es2lfdL1TD6lZEZbVjxf3gr99z8mX0Kt8z7/KteE7O8ea/nfc+fRhandeIsXEQqwykNYcdZmdsWr+fR8RZS5rl4uGsUIDmkSsRyGT9UplcRwVj1y56hJY+jl/DQyvkPhXVJ/vzuNCtHNs4OnNZKERcG4CBTIZv7puSicFwpad3youbC+y0xU2v5/O9X09PSxejY5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFN8sTo4qU2JIhCk52bj3rudtjY/hBhSv8ztNRC2Qjg=;
 b=eacg3rmscuq14/M9caspWZg0URPH1Sx5MgmMh3VbbHvDY/YX7cnspVUjUPifvYCaYiI7C5M7kal/GP79sI91K+ntNyN2MMGOb5YfPku3YdlFD8s16nmrcdlHl+RGQcbxU7syDJV7x5LYlMUP//CzQnQNq2Zgd5MN5u0PoTRjgzQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 14:15:36 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 14:15:36 +0000
Message-ID: <29b45cc2-e0df-4411-bfb9-cfe51ec4ec67@amd.com>
Date: Thu, 18 Dec 2025 15:15:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: xilinx: Drop "label" property on
 dlg,slg7xl45106
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251216175914.2791200-1-robh@kernel.org>
 <aa064ecf-1714-4d40-8658-19952392cae8@amd.com>
 <CAL_JsqKdrN5UpUWQVQXpJjbTy1gN9_FhhwOoX6zVpG+zZVAptA@mail.gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <CAL_JsqKdrN5UpUWQVQXpJjbTy1gN9_FhhwOoX6zVpG+zZVAptA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR08CA0210.eurprd08.prod.outlook.com
 (2603:10a6:802:15::19) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ecc4d4-9683-4872-e9d9-08de3e3fe9e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0VqN3ZwcmR5U2o1T2p4YmthVWFpblVMd3NPeDJFZG56ZGZTNFJKUlNWTXJi?=
 =?utf-8?B?NEJzYUpPVXBxa0xCYUtCa05uWlQzYTFOWmxqODZ2SnpLTU0wSS8vb1lUNXBI?=
 =?utf-8?B?REJLcERxb3NrWnRRNzluK29RWWtzeWpoeGw1T2JLeGpGYWNNdHJGY0J6L2RQ?=
 =?utf-8?B?YXdVUG8vMFoxVlR0WXhHK1d6UmlTR1pqMmpUZWtIQm9sYldmRXdYVFVKcExN?=
 =?utf-8?B?Q2FXVEE0TUd6K2cwQUYvWS90TlQ2eFZDWlRUK0JLeDNFYnhNQStsNkJzc0ZB?=
 =?utf-8?B?NzdCMi9oWnVsVDBjYjdVR2VWQTNNTDNoRU9Eb1Mrb3dLTVZndUxLWURPSGtn?=
 =?utf-8?B?UmJVUWdnczhOSTZDVUhXUUNRN0Nack5mdVI0WXBxOUtBNU5EaVNxS28ya0Nu?=
 =?utf-8?B?N1VsUkFuVk82OERBWE1xLzMrTElZMkhQRDFDRldIWTIwWmZza25rNlNRZVN3?=
 =?utf-8?B?QU01UnZxK05SdU5zbmNhVjhMSHJJbjdkY1I3VTBDYVZxL211c1VYSnFuaHM4?=
 =?utf-8?B?cjBSc1NGRHdLdXc2K3Z4aEFZZmFyV1hkZTNqVTBGdkUyYjI2N0sxOFY3RElG?=
 =?utf-8?B?UGpVajJramt4UDBaaStVczF2NDhOcGlaejB3U2owcy9EM3JTNHFlbGNmeVRF?=
 =?utf-8?B?U0tSd0ZvSmNtWlFiUXQ3VHppdTVFOXgxWlNidXBQMy9ORlhQbXppakM3OXM1?=
 =?utf-8?B?N0RyMVlXSE8vRHpwSFR3RVdKWTMwMnFVRU03NG1UL29ET0E0Tjh3ei91b21l?=
 =?utf-8?B?VnZra010YjhZNEpNYU1HN2w1QzdpT05qTzBmMTRNSFFxMGtISjZKdW53dXRK?=
 =?utf-8?B?WnF5L2ZwMVRINU5FRkovRDNmWk05U3lTWDYxOGFtdnBHNGFKMFZWV2xTTWEw?=
 =?utf-8?B?d2c4TEw5VXF6ODVBL2l5UnRSM2lDbEZPZ2UrTzlEU0JiSzgxdUxnWHBHaVdi?=
 =?utf-8?B?UVZ2aU5oU3M3Z3k2U1drMDVYVHNTQmdSM3ptK1lXNS9aV2JmU2Fydy9mSUJW?=
 =?utf-8?B?T2U4ZCtiVzYySUFLa2JOaHNtdHZ3eitaV0VOeFZhN0FPUG81bnFkbkZPZks4?=
 =?utf-8?B?LzVWM1AwS25PSmlXbnZodWwrOTRVRGJINGwvNXh6L0JCckRSMFpmcG5vcUJr?=
 =?utf-8?B?blJqL3pGNys2aFFydklZa01ka1ZwZlpwVm1jczhPNmVZNTdOeCtSQzJTYy9o?=
 =?utf-8?B?QnNtN281TEVDZ1FtSHExNW9VdWFlMDBXOEdhamlBYlM4T0hqTXhBd3lTZk4v?=
 =?utf-8?B?aVp3c0RWcUhCa0pjM2gvWjlmZGFqSTZTaytMZHJnZFB3V3VqRFlzVVluc3JC?=
 =?utf-8?B?eUZNeDhjazdxajBJeVpUZnBkd29TdkR6dXdxaWtSaEM4ZUxLSkhneVd4MU9W?=
 =?utf-8?B?cFZtRVRCSUhXWUExdzJKeWhpT3AyQ3RyTUtyT1VXNklNWHlUSlZETDNlUzYr?=
 =?utf-8?B?Sno3OTZScFJFNWVBeGpvWnA1ay9RWkNJQzdSaHcvNzJNdkI0SklhQnJSc1Fk?=
 =?utf-8?B?K2pTdUk2QmxlNG1kbHhMNEJwbWlORFBhKzZzZWtjWklrNTdZUDQ5ZXRiNHFK?=
 =?utf-8?B?T2k4UUdFalZBZlRnNHFydVNlUXU0czlNWmxweDVQZlo0Z2NrVndENEpuTHZq?=
 =?utf-8?B?bWpPNFlZamdmbTNwSVI1UTF0YmpqWWNja0NZV0RNY2xjSlExTE1lUTVPMmd0?=
 =?utf-8?B?UklHQTdia1phT2VuNWpueVlFYnpUZDZCZjFEbElMa3BnWjZCeGFFdFBwZmxY?=
 =?utf-8?B?MWtRb3cwUVRYVFJFQzBXaFdJUEtzdUdFTldsQURMNG9VeDF1VThCek9CaFc3?=
 =?utf-8?B?WEtwcXFHbEU2YU4zdmxWN2dLU1ZYY1NhMS85bGdhK0s4ZGZvQ2JNclR3QkM2?=
 =?utf-8?B?Tmo4RFBSa2J0Smw3VFlhbkp2WldBNXROT3h2ZUVOVkhVTHVHa3d5YWIrT3Nl?=
 =?utf-8?Q?ZuvZn0GWKvwlnlPbH5vQoj0xOilDQwkz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3doUTQzbHdjTC8rZmt2ZjhWNUZMSnJUb1lzWU1SSjJpUGJESmJleFN4S01o?=
 =?utf-8?B?UnZQQXU0VUxlV1h4MFVJZ2xKMVRtRGQ5MmY1RFozb3ZaSUVmTjlhNFoxTUE4?=
 =?utf-8?B?MHJMRDZCYjhzNkVCaW9iNVVUQWg1ZWM0dUFLUExMZFV5d1BvaUExdVN2UytP?=
 =?utf-8?B?aTF5NHRxNldDNEdGSVh2VjRxUTRFbjA4N2lYZnpQMGRybncrMmE5TGFqa2Y0?=
 =?utf-8?B?YS9HR2laY0NpR1JDVVcxb3k3TFZDVEl5QmtxSGtCdFZiMjdtSE9SMDJ1dDg3?=
 =?utf-8?B?eU5DcFp1d0tFRVc5UlFTampJTW9UeEduYkt0S25SSDJ4ZVpzbkdGTlJVYzRt?=
 =?utf-8?B?NWZPNEhsbk1Ielo1czI0d3RNQlFFYTRpTEdlcVZIZWVPMUdYamR5cnNUZTR4?=
 =?utf-8?B?WjN4aEZKaTNidjhVNlR1MzhjaEI4QSsrSkd1OVN4NFltNUJlYkx4b1BGaUt2?=
 =?utf-8?B?NU5DWTVHWDUveUh3Ty9kRHg5L0hDUFZCZUUyTHZoWDhxRWxBRkJJWm9aUU9s?=
 =?utf-8?B?U0Y3YXVDWW1DTlEyc2VET0JBT0FnbXhXNWFRZW15K0RKK1pQWGlQdTZuMGlu?=
 =?utf-8?B?UnZrZmQ3YXZaelczcStwaER5MjQ2ZDFsNWU4TEN0SDZ5TzB2TDEvV3dFQndL?=
 =?utf-8?B?UDVkWE1HWjRLN3hjNHo1WWhnbisxaWh1M1duQ1d3SW9EUUNEcHNIT3ZNWVY0?=
 =?utf-8?B?WjNMelZMQVVkM3hVK25JQVBTSlFQM0grdUQ4OHhCUkFTWVZmVUNBWUcxQ1h5?=
 =?utf-8?B?enh5WjVFKzF5ZEVzc0xiRTZVeGpKa1hETk9GOHpoSzNOVWhMSW9vTXlJKzhN?=
 =?utf-8?B?cnhjbFE4MFpzNlA1U2FSVEVYbG13bFlTZHVscktCWmx4WU81eXdSOWpPYnBM?=
 =?utf-8?B?WFBOcVU2c0pZT3NKSVd5U2hKTldzYlRlNHBOekR4WVJNMjJmOGlySnFJRUNF?=
 =?utf-8?B?MGxUZW9jb0Y3ZmY4aWw5SG9MVVF3M0lFTXVoWHV1TWU1SmNjTmE1emVqbTYx?=
 =?utf-8?B?VEU4aFdnTkYwd1RXZTFEUm9CbVI4dFVBV2JmQ0p2Nk91UERjdU9WajkxSHFL?=
 =?utf-8?B?VmtzT0tacmVsYTNQYnlZMlAxWHZyeW9kMmY3ZC9PNU5WUVEwMjk3TVpTYzlu?=
 =?utf-8?B?VEJiMWUrWjVVUVV5S216QkZWR0dzOGNKTEYyaVdOQkxWOTh1eUl2YnRUb2xM?=
 =?utf-8?B?VUNpUWt5dExxVEVWRGdwc1FMY1lndEZ5OGdWaVR5QkdwbGd0dDhlRXFLdWRL?=
 =?utf-8?B?cGc0NDBzaDM0Vkd4aVI0ZVNybmJEOHJtS1AxRGJ4KytFMVluRTVaYVB6SEM4?=
 =?utf-8?B?M1hMcy83dU4rRmc3b29NeHR2QzRTaWowa2gxNGF4Ymp5RTdQUFpOVFcxbDVN?=
 =?utf-8?B?RmU3MWcxSFd4K0QrQnpZckY1dER4MXhkYTY2RG0rZ3RrNXhiQU1aRDU1Sk5x?=
 =?utf-8?B?blRUc0RPNjVKTHFkNEVkalE0UE02NUt3NG5TMkR4N3N5dXM5S0EyUDdnZzlH?=
 =?utf-8?B?Rm45RVE3QS9PaUtaOVlDaXQ3L1J3T3JuY2ZvWTRLK2ozbUdDdkdySktFdnhv?=
 =?utf-8?B?b216NlRUOEV2cnJyZU5YbFVtWEFoU2FYQmY4MW1HV01SdU0vYzQyZjlFTjRx?=
 =?utf-8?B?TEgrdjZvYXk4N3VXczJSLzkrUVVabkl4QXgzcGRvdno1TWNwMmhydkR1elRD?=
 =?utf-8?B?b2Q3M1B0Nnl4ZlQ2Y2FSeTVZU1BJRUM5UTdMZ0V6djFLZlczblV6OE1kQUs2?=
 =?utf-8?B?NHk4TFM2WGpiK1RmQ3hDbldYSVlyT0laT0ExR1IydmdwNTJKTHZqZkZNTUEy?=
 =?utf-8?B?WjRZblFUeUZyanZRQytYQ1YxdEtrdE5wS3FGU0c2dlB3UFFtRC9abWlGNGpu?=
 =?utf-8?B?OFJRVE5KZHAxN3NMNGR6TVJjMzBycWZmUTZyRW52MGNOb2E4c1BUQWprVlFD?=
 =?utf-8?B?WU1nVEdOK1FaRk5OZFYrK1p3dWxJQ0M0dFJOUXNQak9vWDROQnk4WVVVRU4w?=
 =?utf-8?B?WDVOaFk3cW9YZHFQbndrNUtPeENCM1R1TXFxNnNPSzdTYUtyZVhoVzJ1aDdC?=
 =?utf-8?B?akN4SHJlcTNRaHZrMXp4ZFMyQ2p0ZnpSVGcyUUQ5UGpRd3dvN1BjTEplNmx3?=
 =?utf-8?Q?MOUMjHdpucUoUeGrv79nAsA4e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ecc4d4-9683-4872-e9d9-08de3e3fe9e3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 14:15:36.4472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SnzKnGbRHf5skYnt/OQ0AAO/PFJX3nw41YCwWQF1LftR2POI04t8DnKUUQgJky7a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_061541_487601_5FEF7BB2 
X-CRM114-Status: GOOD (  16.06  )
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



On 12/17/25 21:41, Rob Herring wrote:
> On Wed, Dec 17, 2025 at 6:39 AM Michal Simek <michal.simek@amd.com> wrote:
>> On 12/16/25 18:59, Rob Herring (Arm) wrote:
>>> The "label" property is not documented for the dlg,slg7xl45106. Nor is
>>> it common to use for GPIO controllers. So drop it.
>>>
>>
>> Correct it is not documented but it is at least used in Linux also by
>> drivers/gpio/gpio-mmio.c:810:   err = device_property_read_string(dev, "label",
>> &label);
>>
>> which is also not documented in DT binding.
> 
> It really should be for all GPIO providers or none of them. IMO, it
> should be none of them as we already have "gpio-line-names" which is
> essentially per line labels. I can't see why anyone should care about
> a label for the controller.
> 
>> I don't have a problem with it because I can't see it used anywhere.
>>
>> But there are other devices where label is the part of binding. And IMHO this
>> should be more generic property.
> 
> "label" is the generic property. Not sure what you are suggesting here.

That schema should allow to define label in every node or some class of devices.

Thanks,
Michal

