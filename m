Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF10CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uY2o/NQpXETTJVNTZ8MfZairXT+IUgstIwNeHhQpjFk=; b=beKgrIZljQ3VWzx+sD8UesZzOI
	Hc6JTwKZ2zeIHK5CnGNavlEtEqhVAhTGwjyRUy8v1HuF34aLy6iCQeT73hRmHIjyuX5CliiMB6R0G
	U7aX1ZphCKl0QPl/8T4u6iVJIhdXgS3LOwwAQy1rS6b8RbfCt8ZdYj5d1LoEq0jy7ZwBhbLoFDj33
	O2H8ZJ6lWCNQKwDdPW+vWOzJ99ef8AtG00CmFtwoJxU+Vz8R0iOxVg9tyFVIzRa42Z9CJitVgT/B4
	sREiJod6VXMMO58IjTqYSVE8ufKmg75dLWq7/4a29BgWqaUWvZaMwx1N+Ta69d75lyXwiyzmxLUUe
	EVMrHnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk5P-00000006Wdh-2eKN;
	Thu, 28 May 2026 23:24:23 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSk5M-00000006Wbo-46Vh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 23:24:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYvoiVexRi6abU8xqT2LXAQ03xGQimDVg0nLaF8X+pPYQ0A0dFXfCrdHB2AcguL2MqNvJXJe6g/Ud2eLY6uyx4ChHO+7RzOc3MjIPvihtYOJKN2IOlROK4V8Iv5MYqSdeKpmP6QCuqVX3fpzrIK3PQzZVVMPRqSVtoxKhOb6wCJSS1706iRky1IoxewW1KAD7XSnoL88/Li5UcL+8/ljcadQI/6fjcm/TjKnhDwwkqw6vUM4uxRcIzi7HKNVCf5DXcgeTtwiQD6ShBJuhC3PYAQOOPlc2B538yuDhtEuT9jHq63TDBarBPuorPhEXM96cqk5ffYvYMrPToQ3jyaihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uY2o/NQpXETTJVNTZ8MfZairXT+IUgstIwNeHhQpjFk=;
 b=nhajmfLX4qDw5XJp2h0EW51u+cKSlMPUjpSnUxJzivRYaebQGTk2uSZyUKxl0Fui7R98pMQt3M7LMH9Y0/FJ6P+211S0NcZYPlKHAwJz99kJlz8foFqyS7XJh+YomNRPqKTX4Qrri/aPw0BcUP8Xp6OFR61AEvNZs9QmVMUTj4rIH9saZJfka+JYODxG8w69zLH3HBQB10PP/0elg+C0gUwIyonK/Zgp0UtCmLPv+drqdKhwTd6eH7YnptgZ72gEr5i7jxm++DvMxDRF4VdZEXbAKi3NpBXkoEDib5A2uapALhDexNhKgQ65p6W9AZN9Qre3B/6GON44kZxUYjqNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uY2o/NQpXETTJVNTZ8MfZairXT+IUgstIwNeHhQpjFk=;
 b=NG+0gIEwHT+3FVWCYnp8d8ja0rt4NfXGJ4xSh3H1JP9jVYY0VJG94XJ9LrMWqCA6kfCEiWew85ORf8Cd8g7rj+EwUekCV7B3UuCj5bhE46RvWpmPoSG6zZISjLK+zJgQDlVs8tRnsSCG94KxMUUg06ZtdizUsfzJU4dEw3GzZUO+FOE3DAojJgC3e28N30OIgUEDtbZ/EXbBzKTVwlD8K2nzfEcRM9zOfHdcPYVxLndjo58jH6DM0oFW6owYO44rLdZbqiBIcsGoOwXiMj464JOl+ZXeZLgk8E9Eu2DN3FfsIyWqMmIhDfbMAcqpGt8Fkmr94eTi7krV8HZCWQIOFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from CO6PR18MB4436.namprd18.prod.outlook.com (2603:10b6:303:138::16)
 by BY1PR18MB5922.namprd18.prod.outlook.com (2603:10b6:a03:4b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 23:24:13 +0000
Received: from CO6PR18MB4436.namprd18.prod.outlook.com
 ([fe80::d3e5:42d6:c423:a253]) by CO6PR18MB4436.namprd18.prod.outlook.com
 ([fe80::d3e5:42d6:c423:a253%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 23:24:06 +0000
Message-ID: <aaf02a2c-7d90-42ac-ba84-6b600e1ac624@axiado.com>
Date: Thu, 28 May 2026 16:24:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] MAINTAINERS: Add Axiado reviewer and Maintainers
To: Karthikeyan Mitran <kmitran@axiado.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Harshit Shah <hshah@axiado.com>
References: <20260527-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-bdfdad4fed91@axiado.com>
Content-Language: en-US
From: Prasad Bolisetty <pbolisetty@axiado.com>
In-Reply-To: <20260527-maintainers-addition-and-axiado-ax3000_dtsi-update-v6-1-bdfdad4fed91@axiado.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0446.namprd03.prod.outlook.com
 (2603:10b6:408:113::31) To CO6PR18MB4436.namprd18.prod.outlook.com
 (2603:10b6:303:138::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR18MB4436:EE_|BY1PR18MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b351a9b-a49a-4a25-03a7-08debd10367e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xuhwo2eyGLYJSAQ0tZ4tgs63Yf/SF+hzrl2GCRgyveFCuKQN4Z5KVO1B7RuL/kZYoBhbH2/HB2JuY/bnGN5cKcXaJ2UEX/jJhWi+bi4jBcDsau+no83uXii7AQEUYEnxE15FvLSGstO3/oVUPzkZev/zPHhd59gPjU1UG0Bn8ICAEivxd87piIbSo+45/GUpefkjHMw47qOgZoxtDzdbKKeJ694N+ZlC2dGHm/Yy1lg0zx8YVsnqvUUjEzZn6yTbtCp5Mtc3p9hJvvG2G4Cxl/CVJoR3KhS9h/okuJRjKyhpIfKka4Bb8q4puvuuCn3+gjuBBJqZNe/R1p4xsC0v99VskOTH+azK+mx3EcQFpsfG9/jatyF9U9da7JHOFjzD55nXVvkeNK5RhkZkpYTvOx0RPASt2Q4BYapN6ihtXY4un+XsmE0iLoJdHjXcUEFPm6Y5d6oMLi2C/qcqEb3H5LjGjvpgQFTpxYUtDAfrrXxWVYwZQxfL//zkpEzaRx/x9AfLJ7wD4RsnsrHskRzb6q2L0PHwIWHlR5Gc00xV66npapfOtG30zK5geXnGFBnsDXgdCSAP+fgDREbkl0bEt6UFdRmKj+zrf7sg9lNzBZcNAFT/xnCMpQlMJxDmRPtLAsEPW3aBGDuKeZLqkSdQl5IOKPunekEgbyqwc1HqHTENtTTKnWE5aWxJudMO7kKeO8iel6jxuwpaZSSIxqBvEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR18MB4436.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODV1SDJkM1gwTXN3VklZckg4cVMwMWJVR2RWbFJxNE5BSHg2MFZaS1R4WDhI?=
 =?utf-8?B?VEdkSVBwM3BiNjhlRmNuV1RSbkhycUJQWGJaV25kTlIvSlZoQjV0cmJWOHAz?=
 =?utf-8?B?UEJwRlpVQVJnSG42MTFnTUxFdmx5MmRIc0xIU3pZVlVMWXpYRXBLSGw2TWpo?=
 =?utf-8?B?MjRUeDUzQ0NGVEY0YkVoK3RDRk5WWDRoUFNyK2VERWV1OEt3c1hTMThwcklv?=
 =?utf-8?B?ZXlGUi9uS1J6aVpyNmRXcGM2NnoyZzlXRC91b2ZMTTEvVmd5ZzdKNDFKNUxo?=
 =?utf-8?B?dGtVL3lLdEhYb3dEY2tMaHZDU0RnaWprUEJRWFBYRktFZzJCTmlvbWEyb2lx?=
 =?utf-8?B?UmxhZkNuR3ZvcVEyaURUNXA5RU5Dc3hYKzJHLzJxUG9HUFo2UmpXejVjZlkr?=
 =?utf-8?B?YnJqZjlqeXVFVk9oUkVoUmc4SzV6YUxPT0kxL3pNNkoyUzdQTmM5ZFpveGti?=
 =?utf-8?B?ZDBnWWcvNXRXdnF3aFF2NTBidEUwUzMrMFdaaFY1TkhkZVU0aGdPRmRaVm41?=
 =?utf-8?B?RDIyM3VQZFJBSFJXZUtqQUIySGloU2pURWxMSXdLTTBjZUVDRWdPMi9nTitj?=
 =?utf-8?B?R2xwcUlrQ3M3dHlIVFZEUFBUa1ZNU096RHY4ZlRKOEJ4ZW1sL01CWTNkamF3?=
 =?utf-8?B?bnZITHUzakJpRUZlMXduaHBIWHpyVHdRcEs3aU5xZXVaYis5MXdXdEtaVDZt?=
 =?utf-8?B?bWtoR0lJa3BDcnVrc3BXbDJ5a3cxRGhRMFpwR3JXckp5MXZ6bWZtY252V01K?=
 =?utf-8?B?R1U3QTBzbE1KYTdENkp2V2RNQWtBK2c1WGRWcVVZK2o5TktoLzRoV05GL0Rl?=
 =?utf-8?B?K3JWVm5PUHl2VFgxQkliZncyZ3FLWUxTSVhkRE1zMUcrZ1pGNHlRVmhOSER1?=
 =?utf-8?B?aWdiTmF1QWpESkFwbVFHZ2w2MlN2L0pWdlRXYjFZblhaaC9RYWNORnhRelox?=
 =?utf-8?B?NE5yNWpHSUFidEx1QUtIOUdnVURMVHdVaHdhaitBSGQxWkZsMkFUTU93SGJC?=
 =?utf-8?B?czBGY0RUSDdkZEtXUEZlRWdFUWxSYnd1OCtkM2w5VkZCZWEra0owY1FzNHBn?=
 =?utf-8?B?c3hTby90M3k3dkd3emhtZjVFQi8wZmNqZ2V1QjliZFBZemw5UncvZHkwVklp?=
 =?utf-8?B?bmFXWkY4Z3JJZEtyQzhvazFBUFE0Z1Nucjl2eTZvVjNqOU9WK3R4bmRRanhR?=
 =?utf-8?B?NmNWWVI5ejE2WnJLYzNuNEZpcmFZSFlJVGNEcWhhNVNVd2NsTnRoZHY0Q2VI?=
 =?utf-8?B?cnBkTjNpQjcyaCs3QWtCUkhXMjZ0cU9Wa0dPYWFkYWx1MDkvWm94WHBBRHg1?=
 =?utf-8?B?TkNudEIySUVTcFo2ZXFBUktGc1pOZVFtZERraHZUaThiNjV0QjlVbkRsWWVV?=
 =?utf-8?B?TXE0NldQOGNpVDI5Nmw2Tkt6dTRjQXdQN3dOSlpKTDNpdmltQ3dIYXVoRTdO?=
 =?utf-8?B?U2hlWmtqNDg3SHRnSXdObUhYbk4zODVUMVAzSDFrZWVjNm1HS2tURzFCSHIv?=
 =?utf-8?B?T3pFamkvMnZNWUcxdUxORlZyb1YvOGNCMWtEOHBzLzhuQ29CenI0S0U3c3Iz?=
 =?utf-8?B?Vm5Ia3lkWk5nK2V3MTNkM251eUZzMmQwdytVa1dCZVJBbWR1cjN5VDIxd3Nx?=
 =?utf-8?B?S2w0dHBGS2RhT29LLzRUa0hSVkpsVDhIYzF1cVU0WjhITTRXcEdWTTF4Nmpk?=
 =?utf-8?B?anhscXBQQ0NOUkM0dnJjTUJDSXB1U25kKzJGU3o5d1VoQkRuM24rWlJjcmtG?=
 =?utf-8?B?SHl1U2xOMW1JNzhkS3FRb0FKcWtnYW5MOW9GRmZnTFdEdE1rdHhudW9sTkVS?=
 =?utf-8?B?NmJhQlBkL1FEVWFUQkVCdkZpdW5MMW9aYTFjQys0NDNlS0NxcHVVU09BNkh2?=
 =?utf-8?B?UXFYcFhHa3g3dEwyYkVHUmNlSENncUhmMWhmTk1lMmhIbHpaNjZ0SmZ5V0tL?=
 =?utf-8?B?TzdVUGszN3ZwNitCQ3dIWWYyMlp2SjZpemxIQzMrTEhhNEhmUDFtSnA1Ykhr?=
 =?utf-8?B?SDM2aFFMOGxVL3o1eTBVck9TckdaSHhTTUtON3dqWXY1N1h1VDkwQUZhbHVa?=
 =?utf-8?B?bFk0WXNrNlhYaWZyZXljWVVneWM5dklIVFhLTjJ0R3B6djQ4bURjTEhURy9o?=
 =?utf-8?B?cTFhSFV6bjJDdEJuNHJlZ08rOGw4M0puampkVjU5cGt4bXpkeWY1M3Q2Tk9U?=
 =?utf-8?B?QlpRTGhGWWhHbGcrOFEyQm96Wk1ORDNKZWx3cCtsUFViOWt6Sm15dWlmRFlr?=
 =?utf-8?B?a1pMaStCL2xWTjlRY0pKSTRJMkhhNnBoTkdpL3lQdFl0MjRNUVZXakZpQnZp?=
 =?utf-8?B?b281RitUdjdBVUJZYkVoaFZSOCtnQ1U2UWwva0NaWDU4bThSbWNVMGlvTHQ5?=
 =?utf-8?Q?HXNJvzEiTe5AK973Jy5JLUx1zaj7SOKSxB5HXueiasQEo?=
X-MS-Exchange-AntiSpam-MessageData-1: 2HcAxswwvEV6Xg==
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b351a9b-a49a-4a25-03a7-08debd10367e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR18MB4436.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 23:24:06.6732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXIQo16emIgTiJYRtAV00HZPD2eexVUkdf4AyIsxJNPHTKHwHRTNAXqYHlQ5LcH71KXuldxcbwntck2UjIJryg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR18MB5922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_162421_056841_EF3AB6A7 
X-CRM114-Status: GOOD (  18.85  )
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


On 5/27/2026 6:56 AM, Karthikeyan Mitran wrote:
> From: Prasad Bolisetty <pbolisetty@axiado.com>
>
> Adding 3 new maintainers Prasad,Tzu-Hao, and Karthikeyan
> Removed previous maintainer as the previous maintainer moved from project
>
> Signed-off-by: Prasad Bolisetty <pbolisetty@axiado.com>
> Acked-by: Harshit Shah <hshah@axiado.com>
> Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
> Signed-off-by: Karthikeyan Mitran <kmitran@axiado.com>
> ---
> ----
> This patch removes a Axiado SoC maintainer and adds 3 more.
>
> A maintainer has moved on from the project, so we are adding three new maintainers (Prasad, Tzu-Hao, and Karthikeyan). also commit message amended to have the same.
>
> Patch 1: Removed one and added 3 new maintainers
>
> Changes since v5:
> - Removed review mail-list R:Axiado Reviewers <linux-maintainer@axiado.com>
> - Link to v5: https://lore.kernel.org/r/20260326-maintainers-addition-and-axiado-ax3000_dtsi-update-v5-1-648dfe9bff29@axiado.com
>
> Changes in v4:
> - Updated commit message to clarify maintainer removal and additions
> - v4: https://lore.kernel.org/linux-devicetree/20260302-maintainers-addition-and-axiado-ax3000_dtsi-update-v4-0-84a5c9df6689@axiado.com/
>
> Changes in v3:
> - Updated commit message
> - v3: https://lore.kernel.org/linux-devicetree/20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-v3-0-a3b095989823@axiado.com/
> ---
>
> ---
>   MAINTAINERS | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..b1349bd178cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2605,7 +2605,9 @@ F:	arch/arm/mach-aspeed/
>   N:	aspeed
>   
>   ARM/AXIADO ARCHITECTURE
> -M:	Harshit Shah <hshah@axiado.com>
> +M:	Prasad Bolisetty <pbolisetty@axiado.com>
> +M:	Tzu-Hao Wei <twei@axiado.com>
> +M:	Karthikeyan Mitran <kmitran@axiado.com>
>   L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/arm/axiado.yaml
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260226-maintainers-addition-and-axiado-ax3000_dtsi-update-2f37e16b9053
>
> Best regards,
Acked-by: Prasad Bolisetty <pbolisetty@axiado.com>

