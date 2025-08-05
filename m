Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6979C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhrmX+VbZyfEClCyV8Hc7TX19PG0jza5H7iQ8Gy4srE=; b=0Pawd3DTLK//bU4nI2XdmOwuDb
	wnivndy1USckGjFfRpDTSI9aeI7s3HrQkB0lYkFQJA5dKpfF2Ki4gsJtxXSEafijUnMptfdV1N/yd
	qw1Tm70aoWT77pxdjD9pekyN0ASeYDi908NrEWuVBiSQS9BnXYdvQ6djtzE0bRiwjGh+f7JLoXlEu
	1/hDHKb3PcHHYy4PTi0a26P7h8KzETVmpxmP4Z+SvC9Cwsj6sbEp2KWeQR2oSVG4c2rNsSts0NZib
	MtQZSYfN7JjL0FolQ2LRO221IVSvvIsM4KEH6PWK7Xce0E7pCnl5oohdvoemg0fSSxdVgD+5lgv2o
	mHq5NNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJcO-0000000D91n-0aaJ;
	Tue, 05 Aug 2025 15:30:24 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIE3-0000000CvRg-04DM;
	Tue, 05 Aug 2025 14:01:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gE/ldy0FDTt7IC49M5CbfUyy2b5R6vprrDYK+RoAW8E+2Av20tLRQYxSlFmEVVTNpa7z05sENLfK0pAuYn4A+sZAnK4SATyY89kWo4VwG7NgJyRS0Bxb2Dv86V6Lj/PN6y163jP2UEoNYcRru6CIFuWTxxQyPDOPJ71Z/cR9ABG3TgsKDu7ok4OkgU3nK2a0iHP4FZ5wT070/Gt0QpZa1lkUYcJGU7aEBx1HT2vWQhhJAdnEPPmW9ltJkFJTsHUfrFh5Ut7yy/4nZbvW4dkyQ0gvQIIRS9A2wBZECZ3EAPqG3c4Lql66lDavjyUeSdLjoHApV8t/V9x+Q0g8NXeV0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhrmX+VbZyfEClCyV8Hc7TX19PG0jza5H7iQ8Gy4srE=;
 b=sh3baCP+/AVdRKk3ca6LmgEeiDTvjJRnvtUn3DKHGKRC5c6nXo+Jt3bGY2LYhdKHqU6mzZKVKJzOcXss8Ios8lUMbM1Jo3yW8zeBskijE5aKu34pBu+0uZOhi8D9Ebu6I7XPqq5gOitoYeHP0vTwJS4zc4gNjVjRQR7ugLpFW2UCaTrVewrsmEInu9fv8ccics5zwOVr+O8BpdaYV3fCNYG0y6QRixzMLCpdI3gFZPBKKkRTtq2KdMtcStwpoANouqzhghGKbviaYVmbJ1ywJCc0EGHZ9noHprnDNe+oX71HtFEskaYaCnWSstZdXOZo83+d1z8C6VKNARPIfLRxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhrmX+VbZyfEClCyV8Hc7TX19PG0jza5H7iQ8Gy4srE=;
 b=NvuHngQ81Wju2d3/ohcEpW5o3aQ0028R3YIzUofm3v8XPYB42u1h/EvFclEcA4uDMPIpaKRnsFDWSRNLJhetTKjg65nNrIn99WoOR7Q/XHs/AtHLmV1kBphgRmo5CscwDr0YDwa1/PMOm3O+R3/dZZX/Z7OHv+f73wkSK3Jb61k=
Received: from AM0PR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::23) by AS4PR02MB8670.eurprd02.prod.outlook.com
 (2603:10a6:20b:58d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 14:01:02 +0000
Received: from AMS0EPF000001AF.eurprd05.prod.outlook.com
 (2603:10a6:208:168:cafe::d6) by AM0PR01CA0118.outlook.office365.com
 (2603:10a6:208:168::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Tue,
 5 Aug 2025 14:01:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AF.mail.protection.outlook.com (10.167.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 14:01:01 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 16:00:48 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, <kernel@axis.com>,
	<linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] pwm: meson: Remove error print for
 devm_add_action_or_reset()
In-Reply-To: <sveurgnigarzdjreweoibcxkkl7rekcpufuwqr7bxcrdx7zdrd@kz4ohstmfyjh>
	("Uwe =?utf-8?Q?Kleine-K=C3=B6nig=22's?= message of "Tue, 5 Aug 2025
 15:23:12 +0200")
References: <pndwm7ikt8v.a.out@axis.com>
	<sveurgnigarzdjreweoibcxkkl7rekcpufuwqr7bxcrdx7zdrd@kz4ohstmfyjh>
User-Agent: a.out
Date: Tue, 5 Aug 2025 16:00:48 +0200
Message-ID: <pndcy99lvfz.a.out@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AF:EE_|AS4PR02MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 459f408e-5f37-4d04-4919-08ddd428829e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFJmdXRmMEVKMDI5M2RLcVpYY09PUEFsMnlrRS9PV2VlMEp4UDk5cHFrUTl1?=
 =?utf-8?B?UHVyQ0JkTVRpSlBzRDV3QTR5alJ0S0ljK0pCWUFXYkJ3NTR3eUw1TXRWWjg5?=
 =?utf-8?B?U3RUbExhcGd0djZSSnNtVWJIa21kYnVJZmd4OU9oclZqdWNFTjdsRDVvNnVw?=
 =?utf-8?B?Z0dBTFJnam5JSnRIMjArSWdYWTBvdlRhS0p0enlHM1cxbGRpbnlOWTFnQzBY?=
 =?utf-8?B?WXUzRmp4ZUlyQ05VNlRBVTBzU1ZJNVVrZUF4U3ViZVIzNjNIMUpPRDl6dElu?=
 =?utf-8?B?dmh5RTUrQnJMclAwcDZDUzFKTlcwUmxCL1pBanhNV2RIOStUT1A3MlNvQkEy?=
 =?utf-8?B?SG9xZHFVY3Y0N0ttSmI4MnJBRXZKY2daOG5pQllVZ3lGNTA4WG5zTDAyMVps?=
 =?utf-8?B?SjZhOE5mb2h2cm04QnJEelJOeWFyVGo3UlFZejFpK040T3g3S1lZaEx3UytJ?=
 =?utf-8?B?SnFZZy9Wd0pQMW90SUVKQjVZZTYyeGxYVG95MFlqaUtHM0M1WkkzZVllRlhv?=
 =?utf-8?B?MkZuamE2b0JUVFlPUFhhekJ5MlRhaE9TS3k4WmhLTnB2L2xvRzQ4SGxOL3hj?=
 =?utf-8?B?M2RBL3ZRQUdKL0RnVGNBTUxNYXR2WS9XdDJnZ0xrdCtSMWVscE5wVkZabGpv?=
 =?utf-8?B?L2IreGkrRFFpU05GTG9jdUR3eHNPNmltcm9DVHhrajFiSmlqU2JWZ1d3eDdK?=
 =?utf-8?B?MXBDb2ZOdFBCWjJ6STl5dXZPK3BzbEhWY2VNMlB2TmljZTJHNFpaUmNrVHJZ?=
 =?utf-8?B?OFl5Rm1FdHVuaDFPaEUweVpqWTdJTlJMN0k0dGI3VXlJTGVhUC81T2gyNjhJ?=
 =?utf-8?B?cGVEb0tYZ2pPdDQ2LzhjMU1oaTYxUDYySnRnanV4THc3eTBCYVlqMi8rT0NQ?=
 =?utf-8?B?UmpqL1ZCWThLZXZQTjRrYWxVYzNZWmZ5ZWVxbENzS0tmbUxHd3h1MGorWEdK?=
 =?utf-8?B?MVhxdFZpTkVKMzJjS3NhMUN1NTlxRWlLQmlHWGthMk1PNGU1eXROVythRjhF?=
 =?utf-8?B?UDYvaTRhTGxDeTVVMXFzVHJOYzBkOENWQ2hGVkFqSW9KQytEeHhvWW4yNUtP?=
 =?utf-8?B?OWV5eFhDZUF3ZlR0U1VxNmNOT2xWUXY3MThIVGhDc0NwQnpOVFh1VXZXNGNi?=
 =?utf-8?B?bHAvYlpMTkVMOU9LcXpJR1VmdWJOcWIrZS9HTEdZY3NGeG5USjJ2ZXZrZXJH?=
 =?utf-8?B?VUxUWkZLVnh1ZEhsN2FhNnBGQ3J3eFM3Ni90R1czYkROck9nVzBHYkZ4SWk1?=
 =?utf-8?B?NW95a2NOYVMvTEJCNHMxUkVMblZoblZiTEF6TW15Sjltc3hOMkdOZGtmU0lU?=
 =?utf-8?B?OGZ5TlQxV0xKU1FyWUxPa2pab3NkbklTdXR6dmg1REpsV0JmU0VqU1V5UmNt?=
 =?utf-8?B?dkpzRmpFRnJlZ21FNGozLzFUYUZwRnUvOHFUSkVxRS9NbWxUOVJjR1B1QWlu?=
 =?utf-8?B?eGZxTm5QVENEdEtoeDBWYWZFUXlPTXlLYWR5YzNuUDNYK01OV2ZJaWIwNDR1?=
 =?utf-8?B?ODFDcE15cWFySVVnZVVBWFkvb0hydFRDek41VGF4UTZnUFhodXM4VnJlV1FP?=
 =?utf-8?B?ZnYxNFM4NDJwaUpkUFNvdUcwU2NjcTBiQXlRZlFiZEFJSTRDMDh1dSt0aWNp?=
 =?utf-8?B?S05nVnhtQXJ4S2MzOERERStncjBRMmtUZVpRSjdFbnJ6ZDRvbXdSYWRGYVZp?=
 =?utf-8?B?ZUFqUkpRRUFUTXdsUGh0dVROYU8vQ2NtOFFFajgzdkZZa042aXNpejFCVlNS?=
 =?utf-8?B?My9vaVdxVldmSGROdXhEYnJQM2MyaVRLU3d0RlVZY1VET0ZEaGdld1Zla3Rx?=
 =?utf-8?B?bFU2OVcrekVIR3JoZGRpTVVBQkNIWG5CbjJFTmlxTlVkVFVKeGthdENqRm05?=
 =?utf-8?B?QWZRN1A2QW1iakhPa0w1R0laYUxmMEtmSCtVMGQzWENDSVdkMkxJU1JVUmtu?=
 =?utf-8?B?NHZxcnoyVWhhQmVpbmE2UEN3N3UxWnR3YjV2N1NEY2pzOWR6dVBtZFhFdXl4?=
 =?utf-8?B?b2dvWUdtQUNBPT0=?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 14:01:01.1246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 459f408e-5f37-4d04-4919-08ddd428829e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8670
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_070111_102831_4FDD3D57 
X-CRM114-Status: GOOD (  28.36  )
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

On Tue, Aug 05, 2025 at 15:23 +0200 Uwe Kleine-K=C3=B6nig <ukleinek@kernel.=
org> wrote:

> Hello Waqar,
>
> On Tue, Aug 05, 2025 at 11:33:36AM +0200, Waqar Hameed wrote:
>> When `devm_add_action_or_reset()` fails, it is due to a failed memory
>> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
>> anything when error is `-ENOMEM`. Therefore, remove the useless call to
>> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
>> return the value instead.
>>=20
>> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
>> ---
>> Changes in v2:
>>=20
>> * Split the patch to one seperate patch for each sub-system.
>>=20
>> Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/
>>=20
>>  drivers/pwm/pwm-meson.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
>> index 8c6bf3d49753..e90d37d4f956 100644
>> --- a/drivers/pwm/pwm-meson.c
>> +++ b/drivers/pwm/pwm-meson.c
>> @@ -520,8 +520,7 @@ static int meson_pwm_init_channels_s4(struct pwm_chi=
p *chip)
>>  		ret =3D devm_add_action_or_reset(dev, meson_pwm_s4_put_clk,
>>  					       meson->channels[i].clk);
>>  		if (ret)
>> -			return dev_err_probe(dev, ret,
>> -					     "Failed to add clk_put action\n");
>> +			return ret;
>
> On the other hand the call to dev_err_probe() also doesn't hurt, right?
> And when we keep it, it is clear that this error path is correctly
> handled without having to know that devm_add_action_or_reset() can only
> return success or -ENOMEM and we don't have to watch
> devm_add_action_or_reset() to not grow something like
>
> diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
> index ae696d10faff..0876cce68776 100644
> --- a/include/linux/device/devres.h
> +++ b/include/linux/device/devres.h
> @@ -156,6 +156,9 @@ static inline int __devm_add_action_or_reset(struct d=
evice *dev, void (*action)(
>  {
>  	int ret;
>=20=20
> +	if (IS_ERR_OR_NULL(dev))
> +		return -EINVAL;
> +
>  	ret =3D __devm_add_action(dev, action, data, name);
>  	if (ret)
>  		action(data);
>
> From a subsystem maintainer's POV it would be great if it was easy to
> notice if a given function needs an error message or not. One excellent
> way to cover functions that can only return -ENOMEM on failure is to
> optimize out the small overhead of the devm_add_action_or_reset() call.
>
> See
> https://lore.kernel.org/all/ylr7cuxldwb24ccenen4khtyddzq3owgzzfblbohkdxb7=
p7eeo@qpuddn6wrz3x/
> for a prototype of what I imagine. Oh, you were the addressee of that
> mail, so you already know.
>
> To make my position here explicit: This is a nack.

I fully understand your point and agree that there should not be a
mental burden of knowing the exact return values from a function. That
should be handled automatically, e.g. by the compiler or other tools.

There was no real consensus in the previous thread (Jonathan Cameron
even CC:ed some checkpatch-people to get some input for automatic
detection from tools, but with no response). I hope that we can have
some good way of solving these in the future, because this currently
doesn't scale well and I'm fairly sure another driver in the future will
hit this exact situation again...

