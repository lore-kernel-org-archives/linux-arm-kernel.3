Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57318E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8ROEpNwN54CjwzNHPuG2+Y99VChvWf6+Visdt/HKmI=; b=K8/CvFE+pCl8p4Ctpu1JHuAwi5
	s1nZ4SVLzHDwXXiwNM0telwION/Gy0zdHjXucc8bzh19q0z72ld7nvE6wgOalMZuQrfYyNrg9OmtV
	z5OTqKN7nLsfYzCK+YU15mWD6R8PMe6hvMVodxPihMRQXqLnmeR4RBlb+s0aPDS8vPG9S0KJm9LKA
	ZDOs2+YnzQFpCDRiL/RnGn0GZ9XIcUOB4d/DjHAODzfFh/9ue0RWVhCCp7/YCBB6SA2evx/Plr3K5
	iyodUb6zhQhET3gX6WNDX6xWViJM/CakAOgEmVv4zVvPlABh7bAJBZnt4FVtNT6+D1wJxd4qyEqb2
	uNKvvL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsexR-00000009fYZ-17pd;
	Wed, 18 Feb 2026 10:39:01 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsexO-00000009fYE-2bdv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 10:39:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEaQSEhZqZWTcmWCqy0B44BtzVdJatYDz1in6yIjYvdaR4yrZTiOgqf8iLE69o7htInKYXV0Vwy7DCE8/v1V0S+cTCmmAlmUX0q/qSF+7yJqvGnRRvv9mTl53CGAemJMoAdh5Oe9SFD8lwyuyN5rEq1pg1BNPv0cvLsMVq2BNYLZdFnxI6KUi4CYsG44S62FH1iuKh6kCqHtmcefDXZ0SfTDpK55LzdmhNipu7GlIPzc3yBCtpVHL88iUp5vImym8r+NPpdgj4DKVF8Tnfz8f+TspXCj+PnE8MD/BJKtZ0zBr4awS1guSfhHN0A7MdKi9Zn7PevpRWBjOjJ1muDLpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8ROEpNwN54CjwzNHPuG2+Y99VChvWf6+Visdt/HKmI=;
 b=CMTpx0dLI/b2CHk/cKRhlPbUZOQA8kZK6ylT8WWJAw1AnzxOaahORthfJPjFO5ZTLB5fWDLAlLRMixjTQZghcDxbikG9WqYRhE9t65RwuNPPsq6PKAI+yMaXDJEkwt8km2vzEwRZJ5aykY73gStAuXH+yN2+AmJX053bEep5CkPcFmr5vMVF/iPxwK3S2Py96G+5V5ehP1I6GsvR1Xsnhmd6nF3q3sOn1w0CKLkW4gNxgZLcQFxjsbc8Df4lcWgq0mJ9ZEDpwmza5qPnYdHD9LxV+aj40SrCH5733U8WTsKSJpq5f6HiC0l1GLW0aI5rtlf4e3Ce8yHk6slKad/x6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8ROEpNwN54CjwzNHPuG2+Y99VChvWf6+Visdt/HKmI=;
 b=bCdVb9JPJnGyK6kknt8H+GVvxVSLLj+b1nJIKBeyq+JAYxs5tL00fQfhh2bpZdhZcJC7G/PpzhU/+OQeMr7Cerq8v9qA0Z3vsOJcGAdOXSGPg5KQ2QqrmJnevhhPn5bIiHGQsHF1VdPR9okuyo9O6/MpihH1/cScUScdBvs9/GUrmlEyaLRWDQ7mmEcfxPgUFwpDe5WfB2d81tD6Nv8jxUnBgCwm4Q1jPAfqF7o4uvFk0FGmsQzc1B/RxfOCVqNUPlMrmIbYsQ2CMCasM2icd98k9NtrzB9Rq/SJHwQdODZQLgNFTLCbf5R2HuY0mvPIi3BnzV7BilL3EUfBU5mLzw==
Received: from AM0P309CA0008.EURP309.PROD.OUTLOOK.COM (2603:10a6:20b:28f::8)
 by AS2PR10MB7107.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5e8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 10:38:37 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::a9) by AM0P309CA0008.outlook.office365.com
 (2603:10a6:20b:28f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10 via Frontend Transport; Wed,
 18 Feb 2026 10:38:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 10:38:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 11:40:32 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 11:38:35 +0100
Message-ID: <ed0ab69f-7aff-423f-8b93-980e79705b6d@foss.st.com>
Date: Wed, 18 Feb 2026 11:38:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: soc: st: document the RISAB firewall
 peripheral
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
 <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
 <516036b6-b825-4a29-a48a-5d3af3234968@foss.st.com>
 <ac793499-bebb-477b-b27e-089529f3ee4b@kernel.org>
 <66ecf6a5-cc1f-4872-971d-6bc32894dbac@foss.st.com>
 <fd73947a-289a-43f9-9506-573fee935d12@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <fd73947a-289a-43f9-9506-573fee935d12@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A60:EE_|AS2PR10MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: bcdfe931-8f15-47a4-36d0-08de6ed9df64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk8rVzEzUjZNMEFKVDRSMHEzZ2tYRWtJSUE3SHU1WE1KYkZwbjJraGx4OCtH?=
 =?utf-8?B?R3hibkdRTFVSdytONUgzWnNOUWc4Y1I1b0ZkSXBLdjVoOURYbFNGNCsrRk1P?=
 =?utf-8?B?WUE1aTdvM0k0TWJ3RjdUQUdGelJ6UWpqQVNyUXMxUVRlbDIydU9rdFdLeGtM?=
 =?utf-8?B?Q0RleVpyYUJVcXNRUTY0SUtGdlc3VnJocGJ0S3ZmVjliLzJpQVh5akp2QlNF?=
 =?utf-8?B?Q1NrcVJkS3VLelU3RURKZFI4clZmcXlERGx5MGxaM1JDakw3RW5TSE56aCtt?=
 =?utf-8?B?djlPRVBBVnVRdTM0SElJaGRUcU9QRUdBOEJucVQxRXUySXRZQlFPS2RYV2Nr?=
 =?utf-8?B?YUtFSGRKODZwMUdJZWEzUzlSVVUzcWNaMXArRVJBODFwdmJISFRKRVhWUmVO?=
 =?utf-8?B?V1RuK0E2V2NsdUZFbSs0dUJvOU5HdE94Y09sUFJWUjAxM1dhUTlEajdyOXNI?=
 =?utf-8?B?OXFxT0c3VzZGcHBqanFFemdMZGdRZjhrQitoRVRLQUltZ3AwRHpXOHlQRUlt?=
 =?utf-8?B?RjlHZTlOb0hoM3daa083YXAyOURTdTV2N043aS9XMDhFR3p5cjhINE1KSjlK?=
 =?utf-8?B?bmMxVHNJdyt6bDZSNFFWUHltdE44TVFwcnZtSjhqV0c4QmVtcFRRTWNnZGxa?=
 =?utf-8?B?QTk1TlpXOWhTd1JwWG5XN1NKV2tTQ2x4M0VWWXBqZmFhZk4xYTNBR1dkRXBN?=
 =?utf-8?B?VFdNdEszN04wV3JDMHpLMko3Y082TnBzWGFyR242WWZJcHV2UGV3UmNaY1Bp?=
 =?utf-8?B?K0RRNFBtWlhYUkM4dGh3NTA2RTFoU0o1SlpuSEY5a0tKWmtGS01WZ1FDYWlZ?=
 =?utf-8?B?aDFydEt0ZWNLRlBPNjBxSDltd01XbHpiVUEwSm94QTZvUVVlS3BXYi9jemxS?=
 =?utf-8?B?UnlHa3BidUFqQkNobHNLd2diTFV5VDJiN3FjOVMvQ25lS2xFeW9jSW1tVG03?=
 =?utf-8?B?eW9zem8xdTBxYk9vSVEwVm5XNXNVcTZUTXYwMzRhQUl5dis0SmJBaEdwaTN4?=
 =?utf-8?B?bDk5L2p4OVRpS1h4akpoZ0NLMG5RRStYMVhpeTMyMkRBNUl5aVc0M243c1Fx?=
 =?utf-8?B?Q3g2c2ZWdnhxN1JMT0F6b29JRE8zSVp0MFMyZmFxQitGU2hPWC9rWHZ5ZkQ5?=
 =?utf-8?B?RjlQc0IrU0UraHpKRWt0VjlKY2Q2eFYwV1Mya0lKZUt5MGw4aVZUVTk1MzNQ?=
 =?utf-8?B?RTkvZHo0S3pjK0NaYXFUd2Q0SGhpY1g0cDg4T09FbEkwVFQwUFdGL3VCSmFI?=
 =?utf-8?B?WFZDNzgySGlOUzEvbXNpaXpLNXo2STcxL1cxdmNtRTVWOFBZZ1MvVjJsK2xN?=
 =?utf-8?B?Q2VHV2VLZGNJalFLakJRcXhMTWVOY3B0REVwUzJzL3B2amRyRTJqU0RTSUsx?=
 =?utf-8?B?UGYrKzBlbTV3Ym55Sno2Wk1mWlY3RGlBMGlSRjdKQm9IOWhRTm4zZ0NhL2Zu?=
 =?utf-8?B?dWdhNFhRSzQxUkxtMnF1UHZSUmY2Q2ZPVTg5LzdsT1JDc05xbzBjRFVhOC9u?=
 =?utf-8?B?L2pEK2ZVL3FNaFhvaThQckxTZHI2ZTNnMENmODlkWTRDeTgxcVFqQ2U1OVV4?=
 =?utf-8?B?cDYwa1hFbndrb0RDeVYxQy9lWEJDSTcwSEhRcXZINkZlejNOeHRzYUxBOGE4?=
 =?utf-8?B?bmpPMUtpSzZFd3Buc0FyUzV3bVBWMmM0KzF1SHNESFFCNzFrSW9CdWZDbm1z?=
 =?utf-8?B?YnZSUVVXaXA0SExvbDVWanJjd29SMksrSndOb1l4YmRHQlNyLzdWc0prTnZ1?=
 =?utf-8?B?V04wVlV1a1hXbW5NbVVnakE5bUF2Mks4N0VsVS9oOHE1QWlnTEJzRTNQM3Zn?=
 =?utf-8?B?NFhHVWdFOWlMazBZTWRmbEttWmxCVGN4ZHpVMTNMMVJrRXRNTzZ2QWJ3a1Vr?=
 =?utf-8?B?d01rN1ZNU0N1NFNFS3NZQmJHY0hIYVJ2QlRzSG85V2JQcllBNS8yS2hjZnll?=
 =?utf-8?B?VHNEQzRhZ2NvYjZGZmZ0d2p2Vjc1K2J0eWZqdEUrQ1JEa0xoNkZhOVZscGVO?=
 =?utf-8?B?c1pobzBxZWxZRXhlNVJpMVY2a2pDR3JzNll4SXF2VG90bHZwU0dHMCt2bmdB?=
 =?utf-8?B?V1p6UERFV1dhZ1dSQmZ0ZndBc2xLNUhvZG5DeEl4VXNiT0JjakNJTlZ6S2E1?=
 =?utf-8?B?M2R3SFFvUzNvTFJNRkl5c1RPYWhHbDJxeGlRQTYwRHZFaXpic2l2cDdxb0di?=
 =?utf-8?B?UEE1dE9RanlVZitnMnpYQURsWmkzTExBOFhubGxmVmZaTG8rL1pISkdwM3FP?=
 =?utf-8?B?YldaTXlqTE03MXVpcnUzTlNTTzVBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Md8THfmsmXwD0VT9eVh//gnjbwczqopvo/xGIvysbL56N+zkMd7kaPjvX+X0l/I5dP6fm7W2SVx3DOKmdd6CVt2eCvz/5sk8rid7dUFOXSwqW6UTNRsAaFtQ8kthulGvM0mNw/d2RfYRaTlwELWjMDukXiFLg7n7XG+q1fhtGbA4FoAwgc/oRRQy1bOO25DgxKdWfxon4hCNTRpu+NBJqALy4gtwTg168fDpPDlwcdwhyzeZGNAY6OZHyN4Ven5qjtvj5LY3ytOQ/hOu7FdY/wBiLShy9j7AVpe7FFy9cbbM2+ts4ZgfSgCQeJONPlNfwfvxkPRMZuExkJPysRqO4i+TtfKQp/yxAi6BURQh4KVXW5sx3YFY24ZAUZ3etjfuOwkkK0jheXwKq2f+hwW1OJjNciqR+kOm2YxbjcABD/Vv1APfoLZpA5FA8HKZ/zRe
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 10:38:36.7189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcdfe931-8f15-47a4-36d0-08de6ed9df64
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_023859_026970_69E57DDB 
X-CRM114-Status: GOOD (  34.10  )
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



On 2/17/26 21:06, Krzysztof Kozlowski wrote:
> On 17/02/2026 14:12, Gatien CHEVALLIER wrote:
>>
>>
>> On 2/13/26 16:06, Krzysztof Kozlowski wrote:
>>> On 10/02/2026 10:55, Gatien CHEVALLIER wrote:
>>>>>> +  memory-region:
>>>>>> +    minItems: 1
>>>>>> +    maxItems: 32
>>>>>> +    description:
>>>>>> +      Phandle to nodes describing memory regions to be configured in the RISAB
>>>>>> +      by the trusted domain of at least a RISAB page size.
>>>>>> +      These regions cannot overlap. A zone must be within st,mem-map range and
>>>>>> +      can be represented by one or more pages.
>>>>>> +
>>>>>> +  st,mem-map:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>>>> +    description: Memory address range covered by the RISAB.
>>>>>> +    items:
>>>>>> +      - description: Memory range base address
>>>>>> +      - description: Memory range size
>>>>>
>>>>> Why do you need this property if you have memory-region already? This
>>>>> also should be part of <reg>, although this mixing with memory-region is
>>>>> anyway confusing.
>>>>>
>>>>
>>>> The RISAB is a memory firewall peripheral covering internal RAMs. It is
>>>> possible to configure multiple memory regions within these RAMs (done by
>>>> the Trusted Domain) with security, privilege and compartment isolation.
>>>> This peripheral allow 4kBytes page granularity. Each page can hold
>>>> different access rights, with 32 pages at most (hence the maxItems: 32).
>>>> That is some information that can be added to the documentation.
>>>>
>>>> Moreover, when a region is delegated to a non-secure privileged
>>>> component, this component can configure the privilege level necessary to
>>>> access the region.
>>>>
>>>> This property gives me the opportunity to get the memory range covered
>>>> by the RISAB. "reg" here is used to access the actual RISAB registers
>>>> holding the configuration.
>>>
>>> Looks awfully like memory regions still :/
>>>
>>
>> IIUC the memory-region property references memory regions within
>> a reserved memory. Which is not really what I want to describe
>> here as I want to get the boundaries of the whole range. The
>> memory-region property would be used by the Trusted Domain / kernel
>> to get each regions (or only one that represents the whole range) of the
>> internal RAM to apply desired access rights to them / use them.
>>
>> Describing the memory range using a reserved memory would make the
>> kernel exclude this memory range from the normal usage, no?
> 
> In general yes, but also depends on the use case/drivers/purpose. I do
> not understand why would you mark some memory for generic use by kernel
> (so not reserved for specific purpose) and still configure it somehow
> for trusted firmware to allow secure read/write access.
> 
> If you mark some part of memory as a meaning for TF for secure access,
> you already claim it is not a generic memory. Otherwise TF just writes
> all over malloced() pages?
> 

While the Trusted Domain applies the configuration, it is entirely
possible for the Trusted domain to give himself access to, let's say,
the first RISAB page to store whatever data, and give the rest to the
kernel. Actually, this is what we do to store OTP data mirrors
or DDR context and give the rest to the kernel or the co-processor.

Now, using internal RAM for generic use by the kernel is unlikely but
I have in mind the last firewall controller of the stm32mp2x platforms,
which is the RISAF. It has the same purpose as the RISAB but for
external memories. One protects the DDR so I do want DDR regions as
accessible for general use (memory node).

This property allows me to describe the boundaries of what is protected
without having to imply anything from frameworks about the regions as I
have no way of knowing what is accessible and what is not.

>>
>> I think declaring a "boundaries" memory region with no usage for the
>> kernel wouldn't make sense. The kernel may not be able to access the
>> whole memory range.
> 
> I don't understand that. reserved-memory is for cases with "no usage for
> the kernel", so it would perfectly make sense.

> 
> Look what your description said:
> 
> "used to protect internal RAMs by applying access"

Yes, access rights are applied by the Trusted Domain. These firewalls
are very flexible because access rights on secure and privilege levels
along with Compartment ID (SoC is divided into multiple compartments
holding a compartment ID) can be configured. Some bits of the
firewall configuration can also be delegated. e.g: When a memory
region is configured for privileged, non-secure access for the
cortex running Linux; then the kernel could reconfigure the
privilege level (unlikely but feasible).

It would be quite complex to explain the whole mechanism without
pointing to some documentation [1].

Anyway, access rights are applied, but access may very well be given to
the privileged non-secure compartment running the kernel. Meaning that
only the kernel can access such memory. Not the Trusted Domain, not the
user-space, not the co-processor.

So you could give some bits of internal RAM to the kernel for whatever
purpose you'd like (Storing particular data you want to keep in some
low-power mode, etc...).


[1]: https://wiki.st.com/stm32mpu/wiki/Resource_Isolation_Framework_overview

> 
> and
> 
> " a trusted domain, or the domain to whom the page configuration has
> been delegated,"
> 
> so how it is not a dedicated, special memory delegated to specific
> devices and/or TF?
> 

The memory is delegated to some contexts. These can be the processor
running Linux, a co-processor, some initiator ports of peripherals
having DMAs, etc...

> Best regards,
> Krzysztof


