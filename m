Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D059AC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfVrtgyewomBl6EnGjNZHi/lbOUkYeWgN23xGtAe3XE=; b=wjhfCqqvTPyicwdsicqIk+8fPm
	df9cYMtMTypZznrToJ2uuUtqyS0rGrCCxiHmYcwjYXJbG951I8wYKvpj3RobO0hWxmkfdbSTFGoJx
	OHzBaUEISBbffb3whoYczJpOVHcjcBaA2rMEf3d/i49Z70XVKRGZAQgHEbrSJevzZsgrh9fOtSJxG
	h1vBolLNwUA8JrgOtEHJoqErniufdUWHLO1EoZH0a83ZbNzt4FVnIkk/y03auLmrxpTUGb4psklle
	56TcZb9LjYvesTIGOlVR4i01wYbI7TZn2PFUfVhxC+XfpFxrm4PdBQ0IB/joDRoUXtdcglXit6P1l
	q/FZgOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Y3Z-00000002wSe-1gvj;
	Fri, 04 Sep 2026 17:50:29 +0000
Received: from mail-northcentralusazon11012006.outbound.protection.outlook.com ([40.107.200.6] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Y3W-00000002wRG-3xUj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:50:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bz5AuuGO+bYccocPd3IanM0mcFBOf1T02UNCR9N6yNKAiVZJzPrSILGfsRR3ekFi3HX2C0+EaceKvRoP6SXeiOiAoyeX+hZBRgl94WFB9/3QsiREvj9B61OmU5odxmyK8gcEfXwcopYL3gW7EfQpzz0jL+3Qwa86DOOFIHdZjETUy9z08j7ssBPBdUxhayM1iU7xhFbYiKrKXRqYtrNQ8XBWLmE7MpP6PTJDJd4AZkDju20ujs8J/JuittMJicP0izhqysBuwCTcufF2A3UGR7tPb4cnDJRrPgEX0RDjtNMuVYKUda9kwj0N3X0G4ui8NwZha/NczX1/ezFLF4G6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfVrtgyewomBl6EnGjNZHi/lbOUkYeWgN23xGtAe3XE=;
 b=CCFtmwfe26wEH4mvXX+iduAkraq0UoAX2EYWCH7tU7qqsY85n2XXEewWA4Z8yrSAhLCO2SIPZ5KIdARYXdeqITI/bYXM2gZeBd2Jrvn/jYK1gSGg2kfKyxIegt8pl3WNgAGcdV5VhcVPJ0fboB/+/XRaX2ObTP76q4tHModWeopF55UWX115Z+JzUfH5Pvo3blRtv/NhAMXV9rJeL7cDxiUfO0bVO0u2bG0/JWU9w7wzxNoDPK6SzhKyyya+pjKB3knxfvyQ7YzjAf25BMwV6nZccuXhTMbN9c8DtlQhPeQuphVEVmazFw3thoaet0m27HRKTXElL2vRKnx1m1dw0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfVrtgyewomBl6EnGjNZHi/lbOUkYeWgN23xGtAe3XE=;
 b=ZUXJlDogPvuyoxw3RPtHqwhZiC800FK/41n4wXPCrqv4pHfr+IdOvc0RL04gOOncbaPiIZuM/k+fVeZloaLKqnnCAsP7rW3sQRM8g38vH+dMTX5ezInqs0iP8+g8/wJiuYfl+fm9FcurtMCHzNUmXUw9hD9NvWbnxCVu4btLdW3qJeGgKCofX1k3JnOiR+CLd0tKHYtkQ7M9hmkm1Y5oKijGVRF7Vns9t2WQDQwy32JCAf3+tOzO5mB7XC1Z+POrMN8VoOZ4od+kVjlC+XTPooJ4za+j0jVFc4Duy1Hkyl2KIvOMn5e4mRLiEZBT3E09ai9iEItKTIgvHq6TnQuyPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA3PR12MB9106.namprd12.prod.outlook.com (2603:10b6:806:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 17:50:15 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 17:50:15 +0000
Date: Fri, 4 Sep 2026 14:50:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260904175013.GW4157646@nvidia.com>
References: <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
 <20260903154626.GL4157646@nvidia.com>
 <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
 <20260903182152.GN4157646@nvidia.com>
 <20260904-keen-fiery-fulmar-702fb3@sudeepholla>
 <20260904135353.GQ4157646@nvidia.com>
 <20260904-imperial-partridge-of-atheism-bafcb3@sudeepholla>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-imperial-partridge-of-atheism-bafcb3@sudeepholla>
X-ClientProxiedBy: YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::16) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA3PR12MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 8beed8d4-859e-4c4c-045d-08df0aacf995
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|56012099006|4143699003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Bq69cXmGCGRjbU+bpkAv9ZBifeC+8dkbCHWbd8dzGn6xrWdTY5FfYRLrlE76KeQKur+k8q+GS2hTa5fcCxDvd5dv/PYfv1Nkh4XJ/3umSejBLOUcTGA5TM7GXXqu5KWhT9NMSbJkMcKCWS0zTuMIu3GdyHlLePsenK5YVnIhQjxd58U+1kPikVLxP9qWL56gaGoDQSv+FQH4V25ehw/2jCGFhXJnwKvG+hUS5KVKaZ92vHuL+lfIQhubesHqpaEkJduSTDPIRcRZ9F7JmDOGAb5B5xGAtR5MAqEiicJjaFpUJL0JklITz0E8931Wgs3n5A8l+1yMnGssXMiLWY7xH/zSPGF3MXQEuvknDF9Z/OkCdtwaE+ItzxCX+pwQre44NOsiWeNggxH8YZDtnSv+yjgCT4320HNi1xoRboQmZoDwcWwEoA025JBAvnTkugieSgwoZTuihyjLi+eXpni9URhF8x5qF9QQIFzq+P+47L7X6Pmpb4KAL00aJRXsz7Dy3MYdXgxjKN2ch8nGnb+MO02DcchUKn7/UHu98s/LNb+A92NLbHRHwzFkK8NP5Tsvi7YYSupoienlIA0m6mvRAdhyyCVxAaWKT/qXO0SU6TcUpGQD0BoKfPWQF1eVvYsfPPbQ/4qy7+yz3WZ6BfFZZj4ABYhDUW2lc79o/Q3x4qw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(56012099006)(4143699003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HLCZgFRiz1TMypK2xHF6iFDYxRMjtaaSpFCtSlCrdbHWJoJN3Nv2Bog63lwS?=
 =?us-ascii?Q?wNfMqMvy1LhZmDt3BTnaA3WHMkyd9E4qyvUHKbGGNmy8WwbzHKnS06AswUgV?=
 =?us-ascii?Q?qnH/gJ/jKvhtJN/uYGoj5wp/LSZp++DCy7Rl67p0ZsJdd9d7/xfJnWVSQq5D?=
 =?us-ascii?Q?i+NxhwBYfpW6zermqAJP2c9TjyXnFPJX26b76Rq9yX2UvslxPMtGK42KtJ+V?=
 =?us-ascii?Q?kRdKyh3QnA2CQvIYoCs3rMcOGJguckJPZE2bHId5u7Tx5UMASmQzbpBQe9AX?=
 =?us-ascii?Q?dkJ3IT6TpoLflrxvryRvI3lJ8inrs0zRB/1Rz7MMUBMqKi0GwG/jYdrSyeoa?=
 =?us-ascii?Q?Rp4NxmrW6tBkOB9ZMonRErzsZlzg5/sv+emMgGbtHyG92D4wm8iaMxcIDIyU?=
 =?us-ascii?Q?al0LQZDbDa9WGNqTl/PjXn2/QTmGdqQOMn/Q+rF6i5Hme4g+OsnWX8jEnZfM?=
 =?us-ascii?Q?vLEjTWzQzqmuw0QNoOn9lREy0nzoxwxa8bY3i9cloar3llzQKLOD0ymA94wV?=
 =?us-ascii?Q?MK4CemmqrDSQeZqeEtZ8Vf9jLxvQjYTLnW5liYaVdqtA1YxZM3NUCHzDABtG?=
 =?us-ascii?Q?O4tEb/e759OfvY3viEhy0bLGgYfJEeRnqNpR3FyRJ8hyV+NIH3CZCEeqDLNC?=
 =?us-ascii?Q?9U7W2ST9pRmt7SrYnIaZ8nPQ9fE5jwvv4sOLikPN9sF1+W0YkKEp12qYxxIz?=
 =?us-ascii?Q?2X1i01FqMT61yT2uH3v4ZyelANjynXvaUM0Axz+HhQH0LCe8bSZL6Yrhffwo?=
 =?us-ascii?Q?2l4H0MuWpIu0WiNy8+IW+L1QvtwtnbN9XJqh9BIr8Nh2YNSxvyhLZ+EoHYhy?=
 =?us-ascii?Q?baWjjIArWfpGw7UqeE7EA/ukhkz7JVerfkEBQANywShj15qfN99X7Pyu+oLU?=
 =?us-ascii?Q?Xb3/aqTxmx6kA+CVVLh04sPmXablfL4Zmus4JMeQ1YoFUPIxsp+So8CI5M87?=
 =?us-ascii?Q?RWqMQn9uiZI3m6SMe85wa4lx7Zci0/e0S/n5BSegUnT5dbPvRGf3b6DNTqrE?=
 =?us-ascii?Q?DwYcsoOnLNVJei+pwJ06+uJkHrlqG4D/lSMU23VwwnHeRTCu6lqKOs6GqG+Q?=
 =?us-ascii?Q?urGngR/TEJHdphwh/5DhRW+aIL1kZCbIWRSNcCFRYvtPfkQ7wXZfIg71OFPQ?=
 =?us-ascii?Q?TpsepgfaFyuVU/ECaNcXXqLnc8a21yaow6EeBjTyFsphaMMnyf3lW7LWuUj5?=
 =?us-ascii?Q?HSktObQ56svYlqN4EpemCdMDXirkfeGW5fLQtEahMMRooak3exWFqTMahXa6?=
 =?us-ascii?Q?ObtVJBccn3QuMkU617isvLyrYlOUNPkVBntCd9+4wSOC6Qh+iPEXdo7tnuQj?=
 =?us-ascii?Q?xXpL18SRfT1r0poTWkFsgZB233zPxxp4MuM4ddUpsK0tsL+7D4Gja+VI+McU?=
 =?us-ascii?Q?I/P2xmaFVsKoxoJYeTGhZgqVYLlOmQrIUwy/dPtYYqSqrTTgc3rldLXbdqe0?=
 =?us-ascii?Q?CjP+TBGjJK+UvC2qa4mIQTnBEfPRMFYghZt+h74My1jMcXcVVLRGEaU6JZ6x?=
 =?us-ascii?Q?y2JLq8X7P5iT+V8bwNgjdzITys9kkcy+9zdcD0+eTkrz3/NutkcafMWoZxtp?=
 =?us-ascii?Q?X5QC+QIuVmi7i9Sn82EIN15wKO056Ysx7msMGc8cgScGlIGV4bc3n/jlWy0K?=
 =?us-ascii?Q?/fX6vWIMilEdiKwUvzp/Jqj6bvScOaPvJo5UmCEuQzW/wa+ID5p5iK1cB2k8?=
 =?us-ascii?Q?dMbC1LGr4hsWEudR9DxLcJAth6pM1z+V7nyHN98q2e29OyWF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8beed8d4-859e-4c4c-045d-08df0aacf995
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 17:50:14.9921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m8EZgY4Phn6zjWeayVbYLuxAePQDFszcYJ9L3BLFIxFgW/J6kdvNRydcRZ6gDtK4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_105026_992707_62E0144A 
X-CRM114-Status: GOOD (  15.14  )
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

On Fri, Sep 04, 2026 at 03:27:27PM +0100, Sudeep Holla wrote:

> > IMHO to lean into the bus design I would have a discovery SMCCC that
> > returns a list of supported ABIs, something like (spec, spec version,
> > ABI, FID, feature supported bitmap).  There could be overlaps if the
> > FW supports several ABI incompatible versions, like RSI v1 and RSI v2.
> > 
> 
> But then we will have to wait for that discovery SMCCC ABI first and that
> mean how will it work on existing deployed systems ? But I like the idea.

Oh, I wasn't saying to wait for anything. This is good enough as is.

I was suggesting a next step to make this even better and solve some
of the real problem the ecosystem feels with the FW/kernel ABI.

> the software that purely relies on feature bits. So a big yes for that
> idea and I think some specs and in some form are doing it. I can't
> recall specific but I have seen it. We just need push only for that
> in future specs.

I was advocating the approach of a discovery spec that codifies
exactly how all this should work. So each team writing a new spec
doesn't have to reinvent it.

Jason

