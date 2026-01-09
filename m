Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8214D167F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0w7OwqaXfnXTNeQNsDZCTUnreADTF3YrU62VBfH+2sk=; b=13QUoxQNQFIpun4NcK0qK9zT1x
	1MXs4z1zV8hxX/Hu/1CNpjHlW3HaCVVFA8j2HuGeTyIOmpTv0awflgJwa8/RLzrWgfnBwz8KXvF7W
	Z5MiczWAdvQPPZw/6zsse2ikgtCi45zChXDhkF7MlF9ZOPbhF1Yru3/nYf4TH+WErzosAWol8WNY0
	lBrsbwLRemi24QJ/sj1pXe5gk46WjsVcl9XHFmh6Iw3OOAfHOzPPEug37Dnws5F8sd43uJlBBFTYY
	2g1cw9H3Mlf90KqQAWgI8kQWcOERp1K+rVGteAc+MWBkOrF3Czjg2l38cg5q9yeCnUWb32mgTz50j
	/xbEqKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve92E-000000022tU-3xFJ;
	Fri, 09 Jan 2026 09:43:58 +0000
Received: from mail-westus3azon11021101.outbound.protection.outlook.com ([40.107.208.101] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve92A-000000022pl-2S1a;
	Fri, 09 Jan 2026 09:43:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui6jIOUDWxGa7uuhm9Xb7wfWbN2S5uoRMbAgs/4kmr+wrC5ecdMFLSFJKXcCQSNgkqT+jNPQdrvrC4QIfla3LiWftO4XMTLXucB6SmRk+KiNDZuCNVZe56l2dbzihHxSREXXYdk3Kw43rkZx1HHclUcz3DpZJ3JK3bUOpbf2Z9qeG0+Lr8o8iSqphxRk0vjL2jgTafJ0CRTXG9rt9/cQ8youH/tFRoc46d24rspSGAjVtM6epjgN8klJF6+HyHT+RCgCxgExFWEeIjLIUtn1vDDSF0s24VKbZ7TKNHUhqzouzi7BgEz6GAgzIe/x55nAgvIguPiuZs4HNFc/Yu/6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0w7OwqaXfnXTNeQNsDZCTUnreADTF3YrU62VBfH+2sk=;
 b=DN5bKIzlWAe1N1JuVmA9+UNtTZ+BT0vLor/UsqyVIgmrh9WqXtxGxxPa6a+0W8QrY9gQIiHBdtwyQeG/Xt9cuRAQ17dc165K8kjLmotKdxgJXKxBmHW0SUxWFWgZeSSZLJhw6j8BbMKMybbpgMLbURe5ZVcHf7INIlaLEZOkJOz2RQmGLbiqDeXCT6LsuH3rheAni9ZOqZyXvZA2mw1u0ZWLUIDLhHTH4IOn4I2KzbvUlQ7t/gpoOOTbmF8ZQJn5H814B7XSKHJVx7hps5DyzCxLidjSSAYd7CrJytNm6akEnkrHWATOWW8bHTauYUZqhj2mX4A7v2d3V2kMHEYObA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0w7OwqaXfnXTNeQNsDZCTUnreADTF3YrU62VBfH+2sk=;
 b=PrEmG48+Wt7IHHrCla3hzBPwxTpKQuctxkzLSS/FgA9if6iRXbJ1ymElrjfzpIVK7xofq/JrEZzecAHaBmMecUfoU6DflDNtj07n88i0KA5nZZeMTeVHQqrJjRrO4uJelVBw1KQxLp3BuTCyyN7jjIWJloU87g47r9JRQ5EZLhKs0POq35PcjELOGCMLUPqzIcpYxTRBqmDLlpQOE1gtNC+uYOJNMZGgAirgTLlSvhHKgiymMadkBC6Qc8lmQXn2gtDGSZhn/JIaCAQZgzHtjwvfVr1VS3BlbyydmJkTTuGtJm2ghM5nDqI7C8hBmZCyiojVCJBwXxHhNndfB6VEJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from PH0PR18MB4558.namprd18.prod.outlook.com (2603:10b6:510:ac::13)
 by DM3PPF538CF913C.namprd18.prod.outlook.com (2603:10b6:f:fc00::6a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 09:43:46 +0000
Received: from PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311]) by PH0PR18MB4558.namprd18.prod.outlook.com
 ([fe80::7a75:75a5:694b:2311%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 09:43:46 +0000
From: Tzu-Hao Wei <twei@axiado.com>
Date: Fri, 09 Jan 2026 17:43:29 +0800
Subject: [PATCH 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy: add Axiado
 eMMC PHY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-1-dd43459dbfea@axiado.com>
References: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
In-Reply-To: <20260109-axiado-ax3000-add-emmc-phy-driver-support-v1-0-dd43459dbfea@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1504; i=twei@axiado.com;
 h=from:subject:message-id; bh=radl20dW97wYpys38JRVk7caVU17dEFgw9f8qDzMxB0=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpYM3QjKN8pMUbi2gVqs42AYGlCFuL8zdDdmnjY
 VfCfreTW+eJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaWDN0AAKCRB4EDBdxFrx
 1y4oC/48UUDPzyHBXUNMlai0S680cGgX7ZKbdx4EvAZwm78iEKg4UADBm6NS+cir4N7nvk+w6MZ
 xlsquhrmflCWULZv8WGNU6NQnMWoSxEr8Nzz1ZUgnHh5jkTK4nCXnOoS85sENr5YwYHla2s5AOc
 Z/kAG8rp4Qr6xc7U1npM42amd4GaEVxn/1amTWmciINCFaxxOr/m/Z5mICTYbVAEImxfiylLASS
 yI1Nnj8SeK0S/wsP7NhOjOXWOaeYFLKx03bK0yiVn2yyH5+X54qwy7WmSeU5BnYtyn6NDBZoobV
 RJpR5g72QTC/P5mxlsR9YZCvq0iPfLuhtuzw1/f7IzDKK1P2A5ODlytt91UZ3iZRgbTa3m9Schz
 fLJmvEEILs9PyF7v+TVgn9YD1DUk9vf+NcyjPGAhPL2PCyyZY/KPvbyC5pmlvtf6smOsCO7CuFv
 aTyN/0rzSBFSc+UkUkAo6qknzGrADtiAErGDSBWGUZ5kqDHdKzypbsxTvqFkzAWPgp/Nw=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-ClientProxiedBy: PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::28) To PH0PR18MB4558.namprd18.prod.outlook.com
 (2603:10b6:510:ac::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR18MB4558:EE_|DM3PPF538CF913C:EE_
X-MS-Office365-Filtering-Correlation-Id: 92de5bab-8afd-47ca-5f4b-08de4f639521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|366016|376014|42112799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VXNaZUduTzRaMUQwcWRDbUtRTWp0SStqL1V1LzZOQ2tINHpHWmNITHFyUEd5?=
 =?utf-8?B?T3NxRmYwSjNjOXNzWW9IbGYyM1ZHWWVhR3NNV1BuM2E1QzZJM3k0NXJ1cUwr?=
 =?utf-8?B?Q2N0MmErdHV2OVNUMHJWb0ZRWkgveVZNZzRrOE5XbTFzWk01bS81NzVEdDFu?=
 =?utf-8?B?NEthaGNIMEpENnV3ZUM1R2tuS3E4QWt5dzF0S3daTmNJQWlYa2M2QXppTnJW?=
 =?utf-8?B?SHk1TU9JWG50MUExVExwbzczb2pTcjZCcnpmaER3RXVISmQ3bXFiUmZCVUNP?=
 =?utf-8?B?azJFZktrczV2OHlOYjZSaW9wV1NWOEpidThEb3I4QUZkdkJScVFSNlE3d2Jm?=
 =?utf-8?B?bmRKUzdIMU83b1RKaEZRMjYyK0JWTWU3aERGZXNDdUt2WnVvZHppcUVmd3pR?=
 =?utf-8?B?a2g5T0RjV3pmRm5OZ1l1eTF4UU44SHRkWmxjdkx5MGF6SVJ6TUx0bGlweTN3?=
 =?utf-8?B?N3RwKzh1YmZhMjdhWkNOUnVneVhVZzRLdTMydm8xY1RhSXptZGtxWlEybDN4?=
 =?utf-8?B?WmxwVGlUNWF1dEJucnJCdWJpdG1GM0dhZzdReEpIOE0rbW94OU91aUdsV3A5?=
 =?utf-8?B?ai9oclRhei9lN1JkSEJENnUyTGFtNm9CeE9lYmQ4U1IrWFoxeXhzQXdJM1Ny?=
 =?utf-8?B?L1F5UlVyMElNNnd5QzF5MlJWVkJFSmx1V0U0cHRjbjFQMFJ0dGJkMkRPQlpE?=
 =?utf-8?B?SGRaYUdaOTVJTDR4aTZpQkpmeGdZTzNONHRiN0pHbEFxd0V6aGlqY2Jrb2wr?=
 =?utf-8?B?dTJuYWRRNnhaZjhQZVN2NnJEOExILzZXOG5HeUpkQitUR1plNFozVXovTnVt?=
 =?utf-8?B?NXE4SXRCbkJYZmpMcWVaRU9FK01ET0FxNWJvOTl4cTR2YXFCc2Y4aVlqbVMx?=
 =?utf-8?B?MlErTzQ0aFFCWURWRUd5MlZzWGU5VzBKcGJWcVlXa2tManhRKzZXT2lXTmFv?=
 =?utf-8?B?TFFYd3ZGUTRiNFl1WFZaa2NMZHVwYkJRdDY4VDRuZEM2VUdadjRiR2J1bU0y?=
 =?utf-8?B?bWw5WU9OcTUzOHlaUTZGbXRFMnJYNjQ5SlZPSFp5V3YzeUFQbHlkNmRvRHE5?=
 =?utf-8?B?TjlyWThjcWdVUnhRc3IxalZOcVVQUmhwci94TENDcWlvUnc1amk4V0NIR3pq?=
 =?utf-8?B?dWc2MEtxT1IrYjhJVHR2SmQwU3JWNGNYYlBacy9jRjJCdFIxQ2NiMlFhekVx?=
 =?utf-8?B?MmdudW9sdFNGUTkveUk0SFdwdXYrYzJQbTlUME9HYjdMUmczaVhmMmcxWU9m?=
 =?utf-8?B?RTFtNEUvTTBSWmpYaThWZ3UwVFdZSXVzWlB4RjVvaUdIS3dHdGtKY2hZODlr?=
 =?utf-8?B?YkJlTjFSVk81bTZQSlNuVC9QaVgrNkhjalpuK2lxRyt1TFQvMnF2VVYzZzNH?=
 =?utf-8?B?elZ1UjhNc1diV1VOUVY0Q2ZFL1FYQWFOZlhuNTNVZDBEaFRtQTVmTHhZcHBF?=
 =?utf-8?B?aUVTNmM4SXpBTFl6QTV2dGhrYjlDNWkzMytITnlGUkFSdnBRWjZGVEYwU2xV?=
 =?utf-8?B?QlBlaUpaekM5RmNxRjJLR2pBNG5rVTllYUVqMXRZVDdMamtHYnh2REw2ZFEw?=
 =?utf-8?B?YmxQcE9Hd2FTREg1Tmx3OFA5akpCQVlwZWRwUWtHMGFMei9sSGJrM0I0M0Ir?=
 =?utf-8?B?YTFueWlDT3JrVlpZb3RDT2RiSE1lemNyT0Q4QVB1Q2hlS1BtazN4YnVyMlMw?=
 =?utf-8?B?ZkI3eW9CbTdWeU9EVi9VTFNDQWFMNWVPbEJxU1B5NlMrcDlmV1lvTE1jOTNn?=
 =?utf-8?B?QWJJRDB5YVE1NUlGcEYzYUxNTElNU3BHK0tkQnE2aDFqRVFIOXBtRHpJSUxo?=
 =?utf-8?B?bXF2MWgxTitqY1g0ZnFwU0hVcEhZSjgxNHBIdlJORjl0QjV6Rkhqc2hFL05x?=
 =?utf-8?B?KzVxak82ZmJsaGd0SkcrS1FncEtYak44RDhtVVRRRUZqNHpwUmIyZmRrRXNk?=
 =?utf-8?B?UTJUaFp6SzdzalVvQXpaZzIvaTl3ZXZWM0l2YlJZaWlBWVJxdTdWV2FWNGxG?=
 =?utf-8?B?RUxyeWFRMTdJNVhEK29ldUNzTURzNWVBWklvckl0T1BBRmNTaDNDbEd5dVBU?=
 =?utf-8?B?YnMxRHpCUFNVdEtqZnhZclUrRmFnWG5ISy9zdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR18MB4558.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(42112799006)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVlpZW5CQkFSOVpuaVV4UjVtbFpTWTdnTUd1bVNkRS94RklVZ2ZTZ3JRYlNo?=
 =?utf-8?B?by9BVjF4MWpvUGtHeWN1aXVMaG5vR2l5SUNpOEQ4d0VNNEpKNmhhdlBteVdE?=
 =?utf-8?B?UWJOaFFqcFIvOXg3ZXltTGUxa29uaHBhd0dPeGZod25la01NY1IrM01vVjhY?=
 =?utf-8?B?SExPTW94ZDl4S2RIOERuZVNVM0hJb2p6ellMUzB5Ty9GTHJvc1ZBQXBzVzZB?=
 =?utf-8?B?VVl1WjVpdGtJYy9OdjBlaEZNVzUxREhJZUxvZ0k3NXRDQWh0bkl0Tng0RlVo?=
 =?utf-8?B?THIwNGdVcENvdnY3VkZseFRWempzUzREdFJHVjZvaTZMdHcxR0lYRWVzaVVr?=
 =?utf-8?B?N1I3Y2FIbVA4UjlwYWUzK0hrNnR1Mm1Tc2VIMTIrRERlb0pKa2RUc1JjdXVM?=
 =?utf-8?B?b1ZyNE9NOUVIUkJXNC9CM2VKbnV0bUFDZ29IbmwyS3UveU1rTlZocVkrb1hl?=
 =?utf-8?B?eTYxVDhnK3l3dmtCWkpvQitQVXVYMktZVkVydk5HeGVtSDkvd3hRZ1d5UkJ3?=
 =?utf-8?B?VDltZlF2YmNGd2NJRm5LUkhBRm9XYmlFWnFDQzVBNnJXNjJHRnRqSktwN0Vp?=
 =?utf-8?B?RTRzTVkzUURNUTJmTWZOblFMRkVjaW9hS0lyczR4Q25DYjB2VTlXdnhZWm9N?=
 =?utf-8?B?VksrT203OTJOTTFRbmxFSkNoODlqa2I1T0toYW50N3FDUmdiQ2RzTzB3UndQ?=
 =?utf-8?B?SlNqdmhvRytSODNJTTJUU3M2TjBVVWNYNzBSaE1vUENxRy9wVWZoT2JzbEc5?=
 =?utf-8?B?cldOaExlVXlTUGE4V2srYzN4QkZnZ3RaSHNOalVVTVVNNGhndjFjM0VnbHlF?=
 =?utf-8?B?V0tJTjM0ZHpMQlh4ZGRvZTBveUEveUZNNmxid09wcjBWNjU2UERLeGdrc3Nm?=
 =?utf-8?B?MVJLTXBNaWdVRjlsWVNBOVU0eVkwYXdKelJPRGYvQlNSOXc0Mnh4eXZuSFlF?=
 =?utf-8?B?Rnd4UUV3MHU3cnlBY1hibk5pNXozMVFrSm5jSmRSZEFqRzdHa3NPcjFid3lW?=
 =?utf-8?B?Y2ozRkc1ekswTUNWK0F6aTFab0tha0prQVVIVEVUVjNLL1IxU0Y3VS9Oemtj?=
 =?utf-8?B?RnpCaVl1L3BNQnRsNTc0TTc4STlRR3BNRnZGZHJTSmdEaVpnWm1tdEtCU0pz?=
 =?utf-8?B?UHZWQlZla2tsKytMTzlvK2FGeG5jM1ZKSGVkNXhmalVOdnpTNTl2VkdmT0N2?=
 =?utf-8?B?S1hISnB1TWprLzB5L1FGRHB5T0dxSEc3ME5jUStlbkJ5d2o0UDd4UzhaaTZq?=
 =?utf-8?B?eGlDL0hpdVhCUDR1d1RZYUNpeTNZbkdkeDlvazVhUElRT0RlR3VwdlZBRFM1?=
 =?utf-8?B?Wk5LTVk1bUh2SjVwcHdHeURYNkhPTFJLeFdQRENhcHo4aEY2SlNnd1ZCWVB3?=
 =?utf-8?B?aHFIaUxONlVxbngzUzBRM3E4a09XMm93V0k4K2UvckJnbWlnSGN6aWFjZ09Y?=
 =?utf-8?B?eXZmbmFhcmpYTE4wQmRaZGVVcnphakRLKzk0VnAzbnRQbzg3aVBCU05wVjg5?=
 =?utf-8?B?NVpQK0VJVTAxK2xmNngrU1NtenlPdjdDSHVGUXExV1I3NWxHN2FBc2hSWXdX?=
 =?utf-8?B?VFNsSEVCcVhKWmpmT2pmRXRtWDZtMXdZVjgvcEdCYTBuSG9NRmM1NStxNWhB?=
 =?utf-8?B?dGNqbTdUQksvZTBJT25SZ3Q5eXpDVkE0cjVIN2pzaXlGZjFrQU5hb2ZCS3Iy?=
 =?utf-8?B?UDF4T3RDUFpOSmVRTXlVcHBNMS9idXhxRFB3QkxMTDI5NUgzVTRyQXZiMmo1?=
 =?utf-8?B?NTIyQ3dvRUZMS3dSUXNsVHAxRFBXVEpxYjhVWjZ1S1hvMUpMdEhMNXpjTWM3?=
 =?utf-8?B?TzltOTFrL2lTOTI1NVBRQzdmZEhSaFMvVEd2RDNYWE5GMmRiWHY1UWR3WTFO?=
 =?utf-8?B?dFRwUzgwQ0Zwc2szSWhGSE1GY3BOT0NETDRiSFJpcXpvNGJGUElHYm9ydVB5?=
 =?utf-8?B?ajE4WnI4eGluMncxcHZkcnE0dkNIZXF6Vll2ZWNIV2s2SnZ4dVc5bXh2dU1Q?=
 =?utf-8?B?eDVsVWRhMUF6YkFOdDBCUTJ2dys4SHB6SXVkRFVCYXNXaUVmamN1SHBYYlZj?=
 =?utf-8?B?QU5RdUZmM3Q4UGxTQ1ZVa0hJV0Nmdnd1eTdUNXVLM1dxUmFoSUpOV05BY3E0?=
 =?utf-8?B?bTQrRWVoaUFsTk50UUF0TnQ5T04wRngyZHZYbFB4KzE3eXhtdTlXQ1FoT2Rm?=
 =?utf-8?B?a1FiQTJsaGpodjZ0Z1YyNmhMNWFPdFBpSHdEWmVsY0hjRGZ0RmtxR0xueXoz?=
 =?utf-8?B?bGxKUXBETFZDdHRJa1pmZ2ZUR0ZlQmlZRGRvazBNMkhSVDlUM0cyVGV5Qlhx?=
 =?utf-8?B?S1JKMHU5anA1VVU4MGsyK3lqelROVEQ3YVFTQUhXdDVDTTBhOEFFZz09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92de5bab-8afd-47ca-5f4b-08de4f639521
X-MS-Exchange-CrossTenant-AuthSource: PH0PR18MB4558.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:43:45.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdcmLoZrFCPffxhjPP29vCPf8KfcFXn6cU+3CXYnC+fin63xO3Jk3utHmDKTvvnV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF538CF913C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_014354_633067_4E076BD5 
X-CRM114-Status: GOOD (  10.95  )
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

From: SriNavmani A <srinavmani@axiado.com>

Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
HS200 eMMC host controller.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..78194b77ec1bd22a87d7aead430db57bca7942b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/axiado,ax3000-emmc-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 Arasan eMMC PHY
+
+maintainers:
+  - SriNavmani A <srinavmani@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+properties:
+  compatible:
+    const:
+      - axiado,ax3000-emmc-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@80801c00 {
+        compatible = "axiado,ax3000-emmc-phy";
+        reg = <0x80801c00 0x1000>;
+        #phy-cells = <0>;
+    };

-- 
2.34.1


