Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DABCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8aDJKQ6cvZE16He4chc4jDbUQp4o58Up/zmvkoLjo4=; b=wMkX6JiP4LhG1O2tChHBwX7qrX
	Dkz1C9Tgn8gVellY07TbcEo3urGKVAmPfuiseOe8njSqJ8xy182X1L0DB+cAqwFk1VLLzwd15ncWd
	BbvLjtZNXgvCM5wrvBdEJOXeVf5BROOAg18vUZHMbDuIGNYjVHXsm2PCyM1l6SQCPKIqHw5s4ZJYN
	UOzTv1UmEJdYwmQdD0JL8aXVCP+KmUUp9W1T1q8MRdkCtw9qtgmaX4LRi1GN/6WvxrW38KRNBYEr/
	wFfYEQEjrr+HSaEg1oNzYlqBNTvxTJI3rTKUdVyQT+KCXBnxBA97lZUQqfy88/Y/P3bkxtrqqnAqa
	LBdGqgrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5R6-00000001pFX-2Ntv;
	Wed, 13 May 2026 08:59:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5R5-00000001pFC-0OAo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 May 2026 08:59:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R8aDJKQ6cvZE16He4chc4jDbUQp4o58Up/zmvkoLjo4=; b=qUVMEhfytcMdYbt+rIWR5iZq0S
	+y/Xur5qeI6oYV6VdGHRcfRy/kjUhZAQV3Pg3/x9c3nu9L4FbMCTXcxyPF91ZbwuIp8oCMdpLKeCE
	T6F8cEuWxk6XSWZyG+3h/NEac05xUK9ftPN7HssC6hu3Gm1CFsoHoKU5i+wxot3Vk1JmdYKhKnWVA
	v98tMJ+2AetSyCv1DQqkgOZ//NjziLh/yH84xrkmIGdMm5MRmTzVHr+mEHRqniDUeEcvDifAdXEOs
	+qQgW999flZ+k7UT7+Ou/CV8n0fcGljwKMVWyeqZF7xBYfnV9ueWUTRSXUO3TXEQ/Ipv+y4pmZt4x
	h7BcpI1w==;
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5R1-0000000Guj9-1G05
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 08:59:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFF2ADsBxq/w4POQujRutt4ER5gad4WhytOgSnO2HAoFS9f5VgZ8JOswdWJbqIadZWWCruZFYGj3Xn/USEPHQkzX/yVNfqjNpWpcVbetITlDYgNqh5OcGb+JgKBnTt2yHiRKZBZI/pSg54wNl/2dk3H0y4Bec4d/QSC/da7Gmpa4O9OTnrKs3HWZw3whKTD1wV9y4cxa0J0yzOILnvstFJGlXqaXuJleskNpBY7x+IqIHjBVIDVnZxWTbQj0570DGrCpuqdu5G8XxaEGGaVEjCDWnUvkbcfj5B0M1bsR4dOGFTD/NwhA943kdZTuLYjiYpiEokFNt6ag5iVx3zqBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8aDJKQ6cvZE16He4chc4jDbUQp4o58Up/zmvkoLjo4=;
 b=TRlaSUCx/wfwkB9g2l9IFbGZT1AuzoRrvf8Rfwqk9whE4mo9+XWYhqDglWHAoFdaLKbQ3hvbL0G5qAc+Sq+il8fyxSWGrjMyUdrCbRpX/fnOUNuBDhZfrYAWbhfvGzdBdfW32E8tipqkkRaVDoAFPNDGdfzhjKuqNztWM36EZIuEx3/MF1SzjN2r5cSkxf12r93sohSmWS+7G9VfrwHbV/wl6/X0Nnj0YElY2otYi+kfvHqhPN4vGg5syYcN9jJ4FDafmtspYKWUlxH74KxIAAxYhPHXpj4m3F0aypHJ2B5voqMHwfzB3I/ZeSSQcpKezLfOP2Sm/kNd/oGtcTpuiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8aDJKQ6cvZE16He4chc4jDbUQp4o58Up/zmvkoLjo4=;
 b=n4+pZSz6T4NqGXqtth7KtNbaT2t7CSWwA/zsNjB6BWkOebrQKier7prycn4pjMDWl1ayPd/LfMOXgUSC9+qKSOMh5ZXxHKwQBzG7dJPpZ7NSdlWazqZ7/LHJA4W4+rL7tY0RsAKW00NEb4oIYzLR7z3dDfjtJ/6TAOhAUm6wWWrT6HaPdIYJfThJRCGcyovKWUYKmIeQoZ11OFmS9cMq7FEr3Dl+oDxVYfjygSN4xJT5RoE3sCV1kh7nCJgqsgbWCyiEa/ptZnqnvfh2a0qb+hwD0kOkoxlBYDmUZ6IespzuNeRMfyCKZIahTZaudHLZzy4ZCjUOJXKIvslibkadNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 PH7PR18MB5666.namprd18.prod.outlook.com (2603:10b6:510:2e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 08:59:10 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:59:10 +0000
Message-ID: <c20dc0cb-252b-4637-bb22-6078be62b21d@axiado.com>
Date: Wed, 13 May 2026 10:59:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: gpio: add Axiado SGPIO controller
Content-Language: en-GB
To: Linus Walleij <linusw@kernel.org>
Cc: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
 Prasad Bolisetty <pbolisetty@axiado.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 SriNavmani A <srinavmani@axiado.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260414-axiado-ax3000-sgpio-controller-v1-0-b5c7e4c2e69b@axiado.com>
 <20260414-axiado-ax3000-sgpio-controller-v1-1-b5c7e4c2e69b@axiado.com>
 <CAD++jL=yc4rmNELLKUpreUqRbQ1Krg95C-o1xSrnD9Aicm4wgw@mail.gmail.com>
 <106b7b64-ed6e-499f-b5ac-60c1277f2f03@axiado.com>
 <CAD++jLn4R9ubqHsek-56s1sF9YhxYt4-C2TPdYGcYjy2MC6q_Q@mail.gmail.com>
 <fd2ee102-db52-4a37-b96e-c16211e3d8e3@axiado.com>
 <CAD++jL=51iWK2SyxoWOTxSQHAq-Frd0mm6cPxqYu81qifFfHGg@mail.gmail.com>
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <CAD++jL=51iWK2SyxoWOTxSQHAq-Frd0mm6cPxqYu81qifFfHGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P193CA0027.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::32) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|PH7PR18MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff9e5df-509e-4781-31da-08deb0cde569
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info: lUyjsjBrFmxbPp3K+fP5OuUEwUtouhxy4j+hzNAtoIVQ+9xGstwkJ4KKg17uz94iq2PCeyDmhiv8i0Z7VeAErZSblN1Vrze792q+k1mrmZgTBRhRj/7/llZOpcqXcrWLCybUcsy1CLsCVyOUAy7c/mNKlnf4hwPO1BD7BGYWDOCGMXM964cFDUEiUPyJHCxzN+urUXsgsGcKvuhPWxMMPM/w+LBjrKDpVWpG3+TzAe+MEZudHPhT7axpDfV3JotYIxjzbxdXuPe0IHf76fwGDr6zWrzNx3AqyFa2pf1VTGp9wlv4rWaycf776OVKQVGQNY02gU8vvWThm4NmfxfOU47G9WCXvq7IWi8sGdT+43EIkvl6c4sNHPtQT/3iAyqcJqFqGeWfQ/wwnoEqn2YUSHyXHvQu+69Bi292q5/pkpGv/PVqvtybfsrJtWh4KcKYk0roEpbnltbSrdV25ZHYGzMXekAtlqighRp/7TX+xnOylrS/yhqG8jFRGRSv/r7vcEiXwLVFYTmoEyA2opOAuyrqzTBMgMLNGALuWRubOSN9bUtIzXb356HqsvAASwdDNgJzqcn0t+8aIwXUoH6i5+oh2l1HzWwzSFMk+gT6revt13oqkUUkvUAzYjJgWJytk5rKaMz6tMxAE2bhsO4wDH6x/HaJoUWu3IlZtqqcfJ/rPRfU5mOHYLZ5pBfFUure
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(3023799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2UxRnN6MnN3ZWp2cWdZdnQyYU9BQlZsUHRzelBLTzhJT1V5WmVoRlRWYTBR?=
 =?utf-8?B?Wm45VVdjK1pmMzVKMWgxZitMNEJXWFhxU0xCNm42NVgvK2x5R3ljQVJzK0J2?=
 =?utf-8?B?bXRwbENRSUVEeDFrSDc5bUUyRDRSR0FReXA5TFpWNUoreDBVRzdiWHV1K3o5?=
 =?utf-8?B?dGd2WS9tdGVuR0h6NWdrR1JqczFnenQwSVZlT0d0a094c2FYYithbEFZOUV5?=
 =?utf-8?B?bm55N01xUUFaUUkyb3JGblJQbGFnQk9UdjFBaUVsR0Nxb3BtYmZaSGFsbjlD?=
 =?utf-8?B?MWMrSmZIVmRqNkIrU3dyYUdNVDVtaThSSUVrdUh0UEozNjVNeXJvWDdWb05i?=
 =?utf-8?B?WUxtRVNRaHozRHZoNjNNRW5iNlozVkVhS3JmMmN1cFNsdnZyY2hQSWoyK0sw?=
 =?utf-8?B?TWFzeW9nOFk3QW5uUW9FN2ZqSG5JZXNsS3Z3UmpnNFQ1QXBEaENydmk5R0g2?=
 =?utf-8?B?TDhiRDRVZGp3eXY4b2g4UzY1OWdoTWJ5QnUybzJmOVBzVXdHUnhvMzhhRU1Y?=
 =?utf-8?B?WUxuc3ZvVWFMNWxMeGlIZzdYK3R2ZW5tM2pGSkFjSmh3Mk1UTlhRWGxBbXVx?=
 =?utf-8?B?RU9GZzVZd2RUK3FwalYxK2Z5Ri9SSEdDbHJMV2lyc3lzVDhhVnJtRUdDWUV6?=
 =?utf-8?B?VDVrSGhYUEo5WnZOL0kxZDZMU0tZNUN1VDhXNjcyZ2tETnVRWHBUMmJBYnBI?=
 =?utf-8?B?Z2dBZDdCL3hZb0hnOGhLczJZMzFZOXdEK2pCenhWLzBQK3NpbHlVZitYcXBX?=
 =?utf-8?B?R2xDU0xsZ1EvbG1yYlJuUmdWd1ozTVEvc1N0djVHQzhseEQyMytNMUZYMm1S?=
 =?utf-8?B?Nm5mS2FDWVBEYitXc3ZXOHh4d2x2VWZ5YjdJM1Y5R3ZrWVRON0haRGo4TzB5?=
 =?utf-8?B?S0c3RUxIOHZRSjM4UEhtMCtkVkxjb21sdE9GWWxnamZjTldMUkZ3d3lGWEZi?=
 =?utf-8?B?ejFSTjh3bWdSWXlpQ0tkK24yZyt1OVd4VXJYRnNPOUx4SEVCUE5CajBYbUg3?=
 =?utf-8?B?SFJ4bUgyT0d5anpNWGZ5RFBJWTQ1SnNnTi9xZXJwcXNHM2habURsZWVaTDZR?=
 =?utf-8?B?cGpmaTkrQnJuS09aZHlBRVJkUHowWGpvWDdVdzdQdXJ0R0Q5bkpZVUhvUkkz?=
 =?utf-8?B?VXc0UjQ5aXZ1RjUrcFNUdFN4Qk0xRkh0ZFd6WktHK25abE04RWhLdU05RTlP?=
 =?utf-8?B?WCtUKzZUbmxITGlUcC9DN21weGJoTUZrQy8xbWZYZzdFQVMxZkFyeGo4dGF6?=
 =?utf-8?B?aFhZK0t2UlM5L05XbCtCTmlFMUxvYnZXQ0NtVU5UVmpkdWprOXREOXpVVXE2?=
 =?utf-8?B?cmxPSGtCeFhhMDJWZDhSVEdDVTEzclVEVzhDTlU4bEFwZXlUZ0ZpTjVkRy96?=
 =?utf-8?B?U3Jxa3NKYXhidVphbmZ1OEpaZnM2UDF6alhtOGZKQzZhWXNubGZiZlp6M2Ur?=
 =?utf-8?B?SjNRRGNucWNuaklkSHNPODd3MjFWSzlSNTJKV0lxcTFUWmwvVGtQbDBkUmJN?=
 =?utf-8?B?cFVWTFRoOTdjUkJnbWVabVR1MnpDdGdIdkJCbnlkdlFNekplc3lseWppWDNw?=
 =?utf-8?B?ditmbHBjYmxjbHY3NDRWSXZJVGZ6MUlZQ081K2JyQ3ZWNWt2SWtCQmRxTVpC?=
 =?utf-8?B?Wlo1R1RxN2MwWFlYVHc3ZCtBTHRrSGpNVDU1WW5lTDl4MDNYblBoNFdkSC84?=
 =?utf-8?B?OU5MUUtJc3hJUWRJRDRURUYrQVBRTE9jNGJ4WEdhVCtiU2t5bUk5cXJtY0JX?=
 =?utf-8?B?MVppdUc0Z2h5WnlXSnkrNzgrbG1DZXRxdlV0dVpOa1JKWTFmMG1RY0tRZC9x?=
 =?utf-8?B?a0dORG02UGhxU3dtVjE3MHV1UXNVMzJxZE4xaDQ1Zjg2MmNFMXFUSjdvRlor?=
 =?utf-8?B?SFNvYTVaTFZnTDR0ckRUV2hQZmthM2hWdi9ESEtzeTdNZFhZTXRWUGRXbHMx?=
 =?utf-8?B?SUdaUXFUb2h1WnduTEZMM1BoenJKWXlITS9VcDVhQUFBb2JMTEg1dkRyUEE0?=
 =?utf-8?B?ZWtwLzFldkZ5QnYvanJWbFVvcVNQMW5sRVBhbm4yUTZXMHppU1d1SGxXa3Bv?=
 =?utf-8?B?TmErMWIzL3BDblVJQlZ2cUZTUFN6dkRlbmVYczduVnVWbHUxc00xbFk3aVhR?=
 =?utf-8?B?ZkZKU2VqNWNFUHpadWpSM1JrQ0hFaC9FczJBNkh3TnJXQyt3Tlducit5dGZZ?=
 =?utf-8?B?MlBoQkVWcW9ZTm5pZlRkdFFuS0I2N2d0QW5YaWVuL1FIRDcwSFV1djYycUs5?=
 =?utf-8?B?ZTlJZzRqS1kvc0RmVnlkOXNSUVNPT1Y5WEE1WWJCRWpnOEwxRFJybWs3NVF6?=
 =?utf-8?B?dzlxWDBYelpsVytycEN1OFR1Uk9iVGtIb0szOVBnN3RuRFplM1B5UT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff9e5df-509e-4781-31da-08deb0cde569
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:59:10.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DfLV2ryQvWHccvNzOW4z8iZsfhP7qHYhsh1KzVt1Jxq2M7NZp1IPe1ya4o5hQ6UGPQUpBsbBreeyk5VF0tBroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5666
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_095919_788076_402E8704 
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


On 5/11/2026 10:36 AM, Linus Walleij wrote:
> Are they connected to the same physical output line/pin or
> not? That is the only thing that matters. If they in the end control
> the same physical entitiy, it *is* the same GPIO line from Linux'
> point of view.
No, they are not connected to the same physical line/pin.

DIN and DOUT are separate physical SGPIO signals in this hardware. DIN
signals are input-only and DOUT signals are output-only; they are not
bidirectional or interchangeable paths for the same physical pin.

So I agree that Linux should model physical GPIO entities rather than
internal register bits. My previous wording was not clear enough: the
intention was to describe separate physical SGPIO signals, not just separate
register fields.
>> Because the direction is fixed by hardware, the standard
>> lines-initial-states property, which encodes both direction and initial state,
>> does not map cleanly to this design.
> GPIOs with fixed direction is nothing new for Linux, we've had
> that for ages.
>
> I would just have the driver reject configurations that does
> not apply and bail out.
>
> If you absolutely want to enforce the lines-initial-states to match what the
> hardware can do, then use YAML schema restriuctions on what
> values can be encoded into that array.
>
>> For the output lines (DOUT), should their initial values be described in the
>> device tree, or should they be configured by userspace, with the driver only
>> providing default initialization?
> I don't see why userspace should deal with that. The Linux userspace
> ABI is for hacking and odd usecases (like industrial). The nominal
> use is kernel-internal consumers and those must be able to
> request their GPIOs as well without any userspace shenanigans.
>
> But avoiding to deal with initial line states at all is a solution
> of course.
>
> What I don't understand is what purpose this dout-init actually
> does and why it cannot be set dynamically by the driver at runtime.

Some SGPIO outputs may control host-critical signals. For example, if the
BMC reboots while the host/server remains powered on, changing SGPIO output
values during driver initialization could potentially reset or shut down the
running host.

The purpose of `dout-init` is to provide a deterministic safe output state
during SGPIO initialization, before any GPIO consumer has requested the line.

That said, if the preferred approach is to preserve the existing hardware
DOUT state during probe and only change the value when a GPIO consumer
requests the line, I can rework the driver in that direction.

Thnaks,
Petar


