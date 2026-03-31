Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F0FFF60CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7sCxAQo5KUWXDnG0T3DVpfFsu04UXEfoOoLdVgxNOs=; b=ptRG6NgM/joHJU8yUzPEIJXt7s
	1Tsr3er7vebAdfRRqs+eHypTGTIfaQHMkQv8epglxW3K7dmZfsKyq5b6QfDBbUNUeQyQjA2FHGBTL
	oyYi4N4Z8ic5ZzL6mPVWHLIchLVt9DL7vizEjxXX/QUlJoHJTeVU7h/kXi/ANazmZd+q3lEVIT6mY
	y71Dmow6JyeEBBoFARErvHpEqvUf4489nTqbi+aUGtes1wtKCU7XCvUkyeO9o7kZGERD2yMh0DDat
	Sj4AlINM4NtKyKfYh7n+2/am21t5pNV6zfDCv/JBmZstps0cPh2+F55ijC/GW1eAjn/FSrEwq+nV8
	dWeS/N0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TFC-0000000CRAA-1v9V;
	Tue, 31 Mar 2026 07:10:34 +0000
Received: from mail-japaneastazon11023119.outbound.protection.outlook.com ([52.101.127.119] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TF9-0000000CR8k-32SE;
	Tue, 31 Mar 2026 07:10:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ux+YnAWqFo+9a/ezG9f46J63459HzkbVpEef42YTA9B9JBd4Y+R7/6wEfsMv4YRbnieD4NKlFYZBRQW+cVxlPJTrFMtmuOmcSk6hDyZJIRrlTHsMnGd+hCF7F4UHuMcYtXjiMdksZ9Rg0HzE7Zc+WCdUhgyBMTfedipaPFqUXlR41xVdT7RIZO7gqbumOTq8jWfW6lCtyqvMY2AEhrApXvCXdIghiWOpJlmKN2bOZgS4DA4U92GhUjIANxW3Ea5ZiISZ9nBklhb6zzI/EzjXoeZ7UZN4X4a23WPvxoFofalnImsGIdJ6HK21XZJKHbxLj0zY9XL2E0v3GoErpd/KFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7sCxAQo5KUWXDnG0T3DVpfFsu04UXEfoOoLdVgxNOs=;
 b=WtlUa/embiQ5oPxZn7KFk702PuUO9S1RK/v4B3ZOmWeTWvTc3VJVAcspYrquxjgaYa18NVtBWLfk78WJAJ7AN62Nr7iW0meBgS9eWMIP2wK89u4goe5nyceyeIJWaTJ/AVxfCXE7U6cQVMBbd5EC4P2Qk93gcN2Vu6SJuB7TQa6gjE0XZUSdyeXpdS303MdwpoRxJmngQQSG6tUk4cSbuP8g609Js4KfN+LpT7jmbRdM1lTFTWLdoAYz7o+3oC7Y/IQNF5DYHhbPfpXdN4mlWr79+w1wk/AAhlanmNoh9Zxm506Zc1mighyQ5kPCBMO+sC3go2VVQXHG/cr9rNKnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7sCxAQo5KUWXDnG0T3DVpfFsu04UXEfoOoLdVgxNOs=;
 b=qnJN3ZsagsL1zXYEVpb11QTBC7/0JITo0OFzxLaScLvkdqI7fwHh90gaaY+l4QcUOTgqmAh2uoE7V4vSmX0r3UrKI9MbdzRCgnHKiiUdbAk7XruSnprQnWzApKjyj0T0CX854xf4Y86ZHD8/7mJWuRPKpb+nUqKt0MXCM42LKHZmbJsjAUQ7ANYI+WGgDckUZNt/kqIZqvoxM46IyGh/tSeP85BcwWIYUgi7aPdiFmfa7PIIo3fB9z3Cdphr9AZuFhRuvZ84F819IjX9xcFcM1E1R6kQoQkyoSyUHPGZUuLuJcvZoE7R+zEMvRGqpKHU3J34Zdv9ZyJ9uSY7K2jaFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by SEYPR03MB7864.apcprd03.prod.outlook.com (2603:1096:101:16c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:10:22 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::78d4:9dee:2e32:d1e4%3]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 07:10:22 +0000
Message-ID: <70a637b1-a76a-470c-9a97-0b4599a40a1c@amlogic.com>
Date: Tue, 31 Mar 2026 15:10:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add PWM support Amlogic S7 S7D S6
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, Junyi Zhao <junyi.zhao@amlogic.com>
References: <20260326-s6-s7-pwm-v1-0-67e2f72b98bc@amlogic.com>
 <CAFBinCD1GPP82MEBDHg3BwCJg6JY5k2HksEt+kCB=YjnYTO7Tw@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CAFBinCD1GPP82MEBDHg3BwCJg6JY5k2HksEt+kCB=YjnYTO7Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCPR01CA0139.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::16) To TYZPR03MB6896.apcprd03.prod.outlook.com
 (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|SEYPR03MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: 529f9229-6533-4db5-ac89-08de8ef4930e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 80qJ8YYcptynYAYB8CPeHBXYjf5OKGVBhIIMLupxMOZKy5EuvBZ0Z3p9fSpBLvzkUdkm4AP+d2bMoTK/8ZDt08pKFwt9rGB0nq5pozbMzrc0qkt3NejI/mYeLFYvdR8/HJ9IsxVEddO5OE3uxulT6yDp/EwBav5SwLJrzj0oFhRqdHQWrEQH8FqN3SEz3T/YLLPpFCAAoCbLxAK+PFtodA16A0OkHpuYpLknZGJX8yiXeif9JfWIwKB0u/XFvqlq+Pwslv8qAvYiLeO3aPCXvcfsrDR9riXmMl7s5CNB/2n4L0VsEzLc2V+6Iv324TpKzK6Eotzgysd2jTKsK/ev81qC/6kyLLgUfnjADlB3EFMyNnxYK8ZXFxAwWJDDheyD3lUJO3W5Fb6tPhabldl9MPc2BHHW//uK3PHx+S+i74FE7rgCDfxVk+ndLd3VJmRqu4d2kFzpVzDD88NcSZ9DYLiBSLbhsiHNyTi9fyKCcjx5xgIJFCZNGvXF+lkvAgmm5e50zYWtXno0OHTiOWo9zxH5+CWIPzMBIlOuKG3sTDSw4GILHzOSZS2LVetcoyNCOYSPmfzHv0qsY9bmJcrCYyyAkZAANZIqC3TGjKP7BAwyeLyP+Zv+VWxB9DJEGDWDrEGKl2J+Sm/5HUaswR9NuSXGNFFFijK6QCmS1uLjybnAPVjnBmqD2w5AjPTIrrze13em3ykOyew4+ca8GxAeADudIcB600fv9vIUnmk0p0M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFZqdFBlbkJReWk0TWdIRmhKbGRwNXRoZU9jNWNKL0lkSEpQUzIwZWpkQStJ?=
 =?utf-8?B?dkFtTFNKUkVNYy9WdElWaFUzUERhNjMrRHdabXVzYjlpQVlmYlJPUWptZEZ5?=
 =?utf-8?B?U2h1L3lzcXdDYTkxSGUreDJWNmluVlNTTEdpM29wNWdQTVdSRGFJYUgyN0hS?=
 =?utf-8?B?QVJ1Ym4xaTd1OVMxdGJ6SmVRSFFWbCttdWR0MVJNWVV4cE5IVjBrWWJtWWVl?=
 =?utf-8?B?KzZhbHJHUDZKd0JnRU5aU2JReFFwd0dyZVdTNGpOUWJnMDhBUEd3cGkvZVpN?=
 =?utf-8?B?dHBucEtIaEhTZjdiSlg5V1lnc1FtVGNUMXFCVXA1YUxTVUV4R1NRbjRXWFJG?=
 =?utf-8?B?VHNpV01HZHBWYXF6aHhwK0Z6TnVYVDdBMXNUSHEyK1lEaGxXRVh1ZkJQQWlW?=
 =?utf-8?B?TElicVZtQnZUdURFR3JWeWpYR0xXUnQ3M0ZiYkRIYjBBSW5JSjN6N0ljSUJ3?=
 =?utf-8?B?cjZidFFmcnA3d1YwczNlY0wzNnBIbi8vbm5HU0M3NUhqOE5md3o4VFpjNlFR?=
 =?utf-8?B?Z0ZuS1NvWlpyNm43UnlONFZlQXl5SWRFTE1ER0MxQ1hYQmtvTTFsYzd1ZlJ5?=
 =?utf-8?B?YkN2dFJOaEUxbUI0Lzg1UjlyMXVLSHlyS2NXOHIvcTdaS3lqdHZPK2Z1M3E3?=
 =?utf-8?B?UVRlK0R6UWJoUURPdHU0YXZlcWE4MW9qYVYrVkd3NERGamsybUZUNENDVDR4?=
 =?utf-8?B?Vm5vQUpTaG02SE1odFM2VHZJK1Y0TlFVcWVJaHB1V09XQ2dWV1JDVVQ1R0Nj?=
 =?utf-8?B?b3pOWUZFNkN3aUN2bzR5V29OaG1uYXYyOTY4WUdqYnkzMzhoUG5JekV3dUlJ?=
 =?utf-8?B?SGxmeUgydm5TQVIxS0VyVDBhZUI0OVNjUi9uWnBlUjlaRW9PeGRISDBma2NH?=
 =?utf-8?B?Z0pxdTgrckJZbzdkUHdMV3FmNis5UnNieW8vU2xWdnltS0tHcVNIWmhLMUhY?=
 =?utf-8?B?VGJTWFZoc09uSWwzc0IyWkdtb1JyV1FSWVQ0NG9vWklLZHBGbUVYZmtHOTNX?=
 =?utf-8?B?cFNrS1N5M3FDN3FnYTU5UG5tSVhJMkhNaUJGTHcyNkFJVHkzOEs1dmpESDZh?=
 =?utf-8?B?OS9PVllrUTZHUWJFa3p4cUNsUk9KZzA4R3RsMWJkRGNHWmNHQlpwK1BHY0dZ?=
 =?utf-8?B?ektmUCs3clZHakh6T3dxT2x3d1ZFK1M1MFV0MkhlYXZyVWlJbjZkZXpLSTky?=
 =?utf-8?B?YW9POXk4ejJ4KzYrNWZDYmZHV0ptYmVUZVdQeHE3dzR3TEZucWxOWGpYaFdS?=
 =?utf-8?B?UXVDUmdjajVUd0dNakVRK09iVHM0SUwzWnJJY1VuVVRKWEhQM3lqTW1EYXBu?=
 =?utf-8?B?dVFwSVRhcmpmTGtMLzZpcUl2Mlpra05oa2YwOTlibC9wQk9kT0NkK29pekV1?=
 =?utf-8?B?bm1wQ3ZOQ25qZSszKzhUeHdPVTZNdnd0REpWdEF1OFRPVnplZGw4dE45ZGxL?=
 =?utf-8?B?UmRUeGowS3FpL2g3b0Y5R25JM0NmdzYvcTNqR3lVR1NQVTFJdHQ5aVhEcUo5?=
 =?utf-8?B?aTRSeW9nTElJc284dnh0a085ZkoxTjlucGswYyt5bXFuMXNwODBZTVRpYmdw?=
 =?utf-8?B?bjhhUDV3MmZ3SzYrOVVYU0ZUenhnQ09iQ1F6YVhoSXN3WUFaSDhsYVB6dnhw?=
 =?utf-8?B?NHNxYjNnZTU4ZkQzZnp6NmdBQXNBdC80ZFo1NmNTVXNMSFFjUnRUQmY2RElz?=
 =?utf-8?B?TVBsK3JMTWNHOXMyZnhSN3hOcktFeEhNemd3Wm9WYmZPMFdPdm9UbWtKaUFE?=
 =?utf-8?B?cHBiK095dm84S2RnVlk3MGZkQjQxY2dqMVd3VU5WcUFlVy93SnB1UWNBRXVC?=
 =?utf-8?B?dG16aFBFZnN5c2RURlRMZ0ZnZEd2Y1hyTHNWN1JlOUR6Yng3ZmdZaWxYTXdL?=
 =?utf-8?B?bVlhYjNvWnVucnNVS3lidHZLYjROOG5WSzBzT0RZY3VXa1lGMDRRWDZxaCtx?=
 =?utf-8?B?a3V6cGI3aG5uU1Jyd3BLWi9uYUJtV1BtWld0QmkzK0NUTkg4RHZLWmhwb2c4?=
 =?utf-8?B?Qm13V3BBOFY0LzV2Tk1iYXBzOTV3b0I2K05HakJpYWhqQmhDQVRCNVc5Wm9s?=
 =?utf-8?B?b2tFZkFtYTZsYXhxNDF2TG5QZzBMd0c1OEFGcEgzNW8xa1NPTmtocWpxdmps?=
 =?utf-8?B?dGRDVDQ2c01hNWtyKzB3WTIyS2xFYUhKVWkxYUM4NGlBNmxzVGNoNWQ5TSsw?=
 =?utf-8?B?b3p2QVpJTUFwa3pPSWFTTllWL0Q0b3RFTW9sU0FoUVh2Szh5NGNGQ2NtZFFU?=
 =?utf-8?B?dG9BQklraTEyaVYzSVh2NmVvV0MzWWkrS2N0OVlzYS9IVjUvc3hydFpVcW83?=
 =?utf-8?B?b1BKMGtMRm9mcmo2VEZmK01GWTBvcm9wQlJSNFY4NStFanJkczBxZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 529f9229-6533-4db5-ac89-08de8ef4930e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:10:22.4769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kb0CeX3LDy2TtMJ9iS3SyzbNCx1UqLtZyWD0vJOkU5IoDKxA7+B+nrd+LIhzPa/JCVxzrf9F7w7FO6fqDn/r7B/xUuygAseivBaN8kQp9mY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7864
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_001031_783987_0A904506 
X-CRM114-Status: GOOD (  17.49  )
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

Hi Martin,
     I confirmed with Junyi Zhao that the current implementation counts 
from zero, so this submission is correct.
We agree this should be fixed and will address it in a follow-up patch.
Thanks for pointing it out.

On 2026/3/31 05:54, Martin Blumenstingl wrote:
> Hi Xianwei Zhao,
> 
> thanks for your contribution!
> 
> On Thu, Mar 26, 2026 at 7:35 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org>  wrote:
>> Add bindings and driver support Amlogic S7/S7D/S6 SoCs.
> There is an old report that got lost, stating that the current
> pwm-meson driver has an off-by-one error with the hi and lo fields:
> [0]
> Since you are working on bringing up a new platform: is this something
> you can verify in your lab?
> To be clear: I'm not expecting you to work on this ad-hoc or bring a
> patch into this series. However, it would be great if you could verify
> if the findings from [0] are correct and send an updated patch in
> future.
> 
> Thank you and best regards
> Martin

