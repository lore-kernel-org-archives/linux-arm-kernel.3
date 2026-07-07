Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4907C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 13:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3g6ihmbu1wyjLH7zKzF3MDD55Bb9HUmTYIZzZ4qHjk=; b=QCKs5JobUeznwpiWzHBBljejfo
	LkVcM/6RHUcGXGmlSly8uWQ9z9hIXAtkT1y2R9JfBFXyKxvOw8/MWxme70dwRoaAwc2BTGN3JHmxH
	icZNzOSxMFXIQ+kBaFE7Vxt0EO4uzDpHBkaEkv8oq8WSatU2GWkdnXUSZsna9pEpn8SqoKD76gqfG
	+FW1w03JDxbL0mplX4c52Dum+DazUZzq/SBF+YMDxdS2zOLiCLUPwOrG1f9HF4YSwt9gk3mP0OPXh
	kfkLoOLIXcv/XIDicgO3ASlLzhyXNmSqKyDYkhC0LDoqBlB31N0yEMvMWdQZRO3i0FVgYUG3/i88t
	H6VoxkUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6Dn-0000000F5tr-1FNt;
	Tue, 07 Jul 2026 13:52:23 +0000
Received: from mail-northcentralusazon11022085.outbound.protection.outlook.com ([40.107.200.85] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh6Dk-0000000F5t7-3PHp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 13:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVmQl/leHkLDo4T+DJOvKgJl/zLngbHcKscCCHM4LcMaEtiSbuCKDLMd0VTb3TTDpskX6em9rajdRqP430UiOrf0enqwYmQZyJ/otnDjX8OHJ6i8xB+gIHbvMtT9xhLIB2U9p9zp1agfAqYul5bvvas4BVyZc1sqjbp8DRlhHdYcqzEHQO/qxv5r+/YgB+7WV0lNaa+SXdtTumAU92ub7oLxCBXUpKpApgARc5tSQgS0UzPDlYHYG+GGW8AQwq5oDnfvXRfaK95NJgjd5F06M0/ZRZdFj4ahKRniBytTs2YCMgDB1KG3+4PiA6gTeGX70SLOkGsR9+fSHkGwAUzbdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3g6ihmbu1wyjLH7zKzF3MDD55Bb9HUmTYIZzZ4qHjk=;
 b=bN72VMwY02362tPmKzUK4RjwwuNU5ZgS0BTjSZ2KKsy+3z6szMkYXKAKSA/torrM4ssBQZUaqA3umRFRT5nGj4qgHAbtgOOcX3kwyqJHGPHx4emhmdjOKCgGSkegai24iuNvVrdl446qr+D5v9lDYqq7wB1XH/tFmMF0/mui4t7lTQkHHf+iq6/kK7fqamf9fHNstX3qr0E6RZbsoHJ9B/AQxjxwG8eTOrbUfQHmnPZ9XhfylGEhLZdEsvKp3upfmNSI08T8wbJa685ix+7byoNbvVH0AOPCsKkIQjMoZkOqD9V3q4v9DNhjD21giWoUqG2+GNaCQ3obCz9pMdQpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3g6ihmbu1wyjLH7zKzF3MDD55Bb9HUmTYIZzZ4qHjk=;
 b=UX5An98qi6gVlZWBLZu58Wutcv1SEVFCMKeBWx+3SNKmosruw5cuFoLY4iX8j875o+Q3NXMwqesWEA00Ije5yW5wCJXwpNXIOWXaDNv1pr+qteB7WnBxrTGZrswSyyleq7jG6DB/xx8R+a1GuEhQhoqn75kF2lcyAsyrWcjgNOV1xHdGV9WRnLYKeI0xffwZUYJkzL+L3SyvyGV9o7EZDgWOp50DvJd61GXPCi3xGsHbqTHRlijRzuvms6chZzXLbys7FooijShz9NFwZi5Iv94u1FyUDlq/na/7d/RsdYYUAN9rhchRgmJPM6Pklsn9WuVld8spLMy3DkVBnbdzQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c) by SJ0PR18MB4512.namprd18.prod.outlook.com
 (2603:10b6:a03:3ba::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 13:52:13 +0000
Received: from BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::8726:2e55:848b:39e]) by BL1PPF1B62FD55C.namprd18.prod.outlook.com
 ([fe80::8726:2e55:848b:39e%5]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 13:52:13 +0000
Message-ID: <ad4ae81a-5b80-4edf-9d71-e71db0e2b9bb@axiado.com>
Date: Tue, 7 Jul 2026 21:52:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: axiado: Add initial support for AX3005
 SoC and eval board
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260705-upstream-axiado-ax3005-upstream-v2-0-2dfbd1448f81@axiado.com>
 <20260705-upstream-axiado-ax3005-upstream-v2-2-2dfbd1448f81@axiado.com>
 <20260707-quixotic-cobalt-guillemot-6b1aee@quoll>
Content-Language: en-US
From: Swark Yang <syang@axiado.com>
In-Reply-To: <20260707-quixotic-cobalt-guillemot-6b1aee@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TP0P295CA0022.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::18) To BL1PPF1B62FD55C.namprd18.prod.outlook.com
 (2603:10b6:20f:fc04::d8c)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PPF1B62FD55C:EE_|SJ0PR18MB4512:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4a6662-5765-412f-d015-08dedc2ef2af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: Nc/XtWydoRaZ0DExVKD//5gtto7MASLw7cO6DEGlDJXHLzt54g22AwAh43bCrK433ksEveSvC1dWRL+0pT0xkzFGIqhEYXreuTDGsjdKwvyTtSB+LoZZHGFFiMMQLLfE10hncS6SCOHdpVE7MTZdaBRvdc1eieRjX5Xo5IUSDPtXVjd0UG9u5sN1fTE3STWOLKKzO/yhJlats7lcxx5AUkvsgq/QY3vGHbpxYG8Lq0j5YvbS1fhRGApvC0n7U0Hx6MZjBg/d36JYW3zRMfIHm5VCMvx3SIjY6gJPBU856TdVB2Qjf2nxUvV7wwdeGIH7zj+K81ALMBMs7VfOszLqBv/iGo3csEku7uGTvy6XPYejGtQIR6pIq4HONI3Opq8Ao+JYOs7ErRF0xdGiHKEx5KzEOw5KU+961BlBJ+UFsYl/m86mI8p2qzPs4Ns/QAWQAoQCTGesOcVMMbtrj2rzM+c35gUbDM18lDiUDRJxDi1QhH24ecZKm4/0dmtYzQjeQR2hK2kmQ+OosLRIXmo0vDl9YsJqmJxiXiBZqaFAs/fiaapsZHzgU2XYN2uhdbjbAo3Q48axWYekc6WX/pBZwiCrJ+PTb6uJrsRgLmbAmDeS5J4h7Gj7MULdfqIuL0lswOQXuiO78yZ0FiLCrvnB1LCgskcAvYTatKdVtbtzJ3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PPF1B62FD55C.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4143699003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTVzbWJMbFM1U3R6RU03cFRPYmttYVlpcXF6ckJZZVovYkRKVnNkYTArcndL?=
 =?utf-8?B?dGZpdEUwK3d3UmdpdHdnOURLU3pqdExoYmpwSkhJR2ZwUis2OEQyZXlJbHpa?=
 =?utf-8?B?YTNvY0JSQjNCS1J3Q0lpTzVMeWJXZXJScUZQQ3o5cjlGeEtCVzJDZWhSNktB?=
 =?utf-8?B?T002VTR5RFNwU25ueGQ2d2NtVFB0RDVmMzJZdjdUZ3hSRDRkZDZpazlDVnU5?=
 =?utf-8?B?Q1dJNXpJdWtHdEQxeGh3eW0zTjdJMG1DMXFMbFZEb3N6V21CbkpubmYxY0FG?=
 =?utf-8?B?Zmg0VmJvMTg0cXQ2eHdJVnBSOXVZVGQ5dW5PTDVTVlF6amhkdjVuV0RqNWs2?=
 =?utf-8?B?T0Q3eVhhOUhJcFdvYTd6aVRnYTBpZFlZWmpnWGpRNmZTaWFXS0s0Z25IOEVD?=
 =?utf-8?B?ekpSaHFvdDNQWkNPNHE5MnRmaFNZODlrV3Q1R3RZaDA2SGtRaFRocjJ0ek40?=
 =?utf-8?B?MFZOY3hwblZQdkVwNXpxU1RoL29oSzZRVVZMRmxXaytNUlZ6MVorVjN5TTA4?=
 =?utf-8?B?ZWFpcVhla0VseXAzUWVwd3Nyc1VoYTh3dWZTTE8wKzJzdXZXOVU4NFY5ZDRK?=
 =?utf-8?B?ZFQxTTVMamZUc1U1cm84VCtCQkhJK21ScnRtUjlLaGZxc1E4dUVrbk5ZQ3d6?=
 =?utf-8?B?MVErRzRhdVRDY2YzaWtqWEFBak9tYmg0RG4yTWM2bCtrdVJjdXRpRW5JTGpO?=
 =?utf-8?B?N2IwaEdKQ0xkeDVxRCtGSGF1dG5lblY3c3Jka0FGa3dpbVg0N3JPZ1pacEsv?=
 =?utf-8?B?c0F5elNjNkFqNDdqa0tRZ2ttTkVVWkJsMmY1SitSVml6UkRLN2ZkZlFjNWds?=
 =?utf-8?B?Z1F1OVRjTitXREY2ZWwzZk1MR1ZKMGJESlJGNXByc1orTlF1TWZwaExoNHN0?=
 =?utf-8?B?amNhaEkwT3hyZHJEWTdkV3Y0NU5nV2cwaHZteHFaTFdYZndWOU1DWHg2NEll?=
 =?utf-8?B?ZndwRVRWMnRHZFV2bjZudnhRWkxwNU8xTmlaZ2RCVXpwR2YrQnBRS0RGdmRS?=
 =?utf-8?B?eFRma3RHL0hIUWhadVdYYXhpMHJicDFwcnU5bldHRXZHMTBIZklqa2N6V1Zt?=
 =?utf-8?B?L1kwOFQ4L3Z6MWZJSTU0MU41NENPL0MxVDhYcE1mMWo1akx0ck5XenJhSk1w?=
 =?utf-8?B?THBSK1Raa3ZycVlTbGxBTzNiTkR1RTNXaGdjZnFjSXdsdnU5RzJkKytpb2tP?=
 =?utf-8?B?NEMwVW9PM1c1WmJHN3Z5TEJPczR4bk1LSERiQjNOd2pSa3U5QzdEMXVrRFN1?=
 =?utf-8?B?YnlnbURLcnpESU5iOGtzdlMyVDBsWXRmcUk0UGhlQmFyVlJnK3RDV0VGSEtv?=
 =?utf-8?B?V09TV3hXb0dDN2trREdIZHNZb2d2TWc5MWxURVY4TmJhL3JkSzdFUlRsT2lk?=
 =?utf-8?B?MWdiVGxmWHAxUzRZQStEWHFnOVJRZWs3eDFGeGFwSHRXa0JIRlhOUVNXUmdr?=
 =?utf-8?B?YjZremJqcHc4cmE3djJKRUVKdkEyZGMvT0srV2lNc3ZnTldDUEhxZUdheGRz?=
 =?utf-8?B?dSsySFRSdWxSQ05sYzFuM09ibE9OS0t0S0FqUnJBK2IrZ1A3dVRhelJUSDhy?=
 =?utf-8?B?YTBOSm9Kb09iS0VZL2I0a3FBa3pHSEJmY0swS211dEE5SjY5UWd1RkhPaXBI?=
 =?utf-8?B?YlJ0VWwrc3hQbCtHdnJaU2twU24xTEt0SisrL3ZGd3NMcnI5VXFzZnFHQm0y?=
 =?utf-8?B?RlZnSDdLQkV1L0sxRlE1aFFCQjdUVzhLVXpkTjBxWm1OZ1VJb05uWUZqNEVO?=
 =?utf-8?B?SnFwUlFQTWtCWm9EbnRCVDdyZjNiU2Zyd1hkMXRsa3F5ZlR5OE56dEJRem1h?=
 =?utf-8?B?dGlVbUJWZ0pBYmZ1L1RkWC8wNEFFaC8yWE5hMmhoQzZZeDh0QnlXckdKcEFU?=
 =?utf-8?B?TkhRRUlNcm1KTHplem1WL0xuTWhjUHlnZFRUeVdXanhjR0Z4VUtvc2RnaU9B?=
 =?utf-8?B?a0FQd1VRbDVvNG1TdmhicG5JRzlLSVlmQ3FMTHM0Tm1ZQmF0eFd6ZkdzYWQ4?=
 =?utf-8?B?UzhTcDg0eHpReld2Q0s5VUNpd25tUkdFMU9HdjhoVnlLZzlsVmp3d2QrTDY4?=
 =?utf-8?B?MmxjMFp6eUc5dGJGR3paRC9UTlFWdkVYVlBqbXNBbHVSczdQdFJKM2xlTVJo?=
 =?utf-8?B?enFMRnk0MW5zSHZLV2JpTGJpWjRYTWJjVXhBU25lc0ZFZ1d6Q0N5ZHlPczYv?=
 =?utf-8?B?Y0pkclJXN1o3ci9rRFJ3RUs2SVVNdUpxRVhJK0RPQ0Q4SmxLdmFoUWl0NTU0?=
 =?utf-8?B?K2RwYTNlY1VickhtdVBHRjhWMTVXTTJOTDNKQXRqbi9LdHdPZkZFSFg0Rm5V?=
 =?utf-8?B?cG9iRUxFMm9oNUVaOVFIRkpIMkFvZWNOT3A4TFVwa2VMdTlIMVFBdz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4a6662-5765-412f-d015-08dedc2ef2af
X-MS-Exchange-CrossTenant-AuthSource: BL1PPF1B62FD55C.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 13:52:13.3785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ETazKZsm4ASTzxUwEKcnxwhGRrSkutrlGHlwOoM6mN2qZgntiNWKRrz63NxvkAYpfzavYrkgVn6BVGP5v2afw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB4512
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_065220_866948_8D466045 
X-CRM114-Status: GOOD (  11.00  )
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

On 7/7/2026 2:58 PM, Krzysztof Kozlowski wrote:
> On Sun, Jul 05, 2026 at 11:39:06PM -0700, Swark Yang wrote:
>> +
>> +             l2: l2-cache0 {
> 
> l2-cache
> 

Ack.

>> +
>> +     timer {
> 
> Odd node sorting.
> 

Ack.

>> +
>> +             gpio4: gpio-controller@33200000 {
>> +                     compatible = "axiado,ax3000-gpio", "cdns,gpio-r1p02";
> 
> Here...
> and here: wrong compatible, this is ax3005 SoC, no?
> 

Yes, it's the AX3005 SoC. I will add the specific compatibles
with fallbacks for all IPs and send the dt-bindings patches
in v2.

Best Regards,
Swark

> Best regards,
> Krzysztof


