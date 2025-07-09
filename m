Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E407C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 11:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7eTAGn9oLO7BzX3bojB6pmRJs3ZzexIgk8LPHS7cmQ=; b=ufzBFNqc0b/mPUbpBNuOYwyWd4
	H0caOOTQVaX//FsBZy7erdWU6eEsWZ5Mi2vXmsRLaWUkot6vLM+xYo9DBgLuzDq+G0eZCWYi7MpYP
	o/2gGyVNfCkqgs3QvIyWMr9zGmZ8M1jqnwHTsrT9O4BHnXbPsPuy5+XyQ7TkfhAlscjth3m5Em/hd
	a2Klb6acORZUBoTCQWF47l1gnGuBzdf0voh3GakzcRTWP6pF7uRp387FjT9ELCYrTiYAha22lvWSP
	ZEwi5j+g0TxDDWToGw/yw0cHgivMAOtITA8bCmqtNIErabhZVn7EIDlbHNSbX7/wmbGDNEIU4muw8
	iThcUWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSqf-00000008Trs-3rU1;
	Wed, 09 Jul 2025 11:20:25 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZRJd-00000008Ac4-3EI5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 09:42:15 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697MTWG022282;
	Wed, 9 Jul 2025 04:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=U7eTAGn9oLO7BzX3bo
	jB6pmRJs3ZzexIgk8LPHS7cmQ=; b=Q5jNPmyAno1lsdfCRv+wZCQmFylmU9Vuda
	0ekfM8WcgGNG9jK/iW2QQ1UafVDW8MoxcDFUh/wtahZslqPoTdFoJeB6V6McMSX9
	FeV+15rGdH1WhE7FjYkhaCTa9vkZ2yUGhBxrWvIskZ6ELtaw0SWL0PXAyx6uHHnx
	9u6poN1urTLa8j7o5aotY+1gWjkRi1rSBnoJX7EY7DWYPFE3ab2Zv6vOAO7nh8Fe
	xrFDCNEgUyAZBhSnOD88Gl0lbs7QnTnSqS2gJsqv0/2ynDwq3ZuLguZbWSF01ujE
	nT07oYHMyh+2EH86UH26PZoWWbZI/XVurvpsLNnObEeBQZW/qDFw==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2104.outbound.protection.outlook.com [40.107.101.104])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47skytr5uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Jul 2025 04:41:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcIPC06RfAZxDO1UhEZLsyZJwq3b3B0tW8xkvCCX16VapcC3piHlDABFqklLVY8f+mGhNi7Tg2V2SZ/rmPHRNEZEpja2J33bNGf5PyGjFQ1p/GrHb6MpNYrZsJdU2o/859SzSdq9iIgBO8Ft/6UZn8cW5ga5ff/KWLyuyTDN10Wc/EFs0l3vh1D38yOb0Plo/QncLwbZXAnsPpcNsCEztHEeS2bXOLhoPxQn1oa+BExlueq2bVSV8f4KgvopjpZuAOgglE/1Bmuyi4IRI/v6gpshkHsc2Y/Q1NGQwtqh3GSE9eixBVOzKeD4qI+RWLLtjzOc95OSZqwNjS1m7l45HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7eTAGn9oLO7BzX3bojB6pmRJs3ZzexIgk8LPHS7cmQ=;
 b=Z7FxI3mhwX2EF2lAknRGdbRwXiiqlKSmDP8MsbFSY37nbjOAbgBM1AgvOz4cV69q4AnrORbkBP+QuWfz2THT1cldieAo6t99JTnGKvWTeSR85hRt7KvP4OLM3Y3kuzZbwtz8KBmGDlT08pzLkq2CkH7tAC/P1yMFP+PguDkNOI/GPsIXdG0L490loKm+8CpTmCV1Dfz+CRv8blI7zk5Of+oPlicyMWZaEskWX/gRm39JovPor/u7DOCAv4McUbJ6G/dC+jZFiIvTB0zebndTybT5fv0aE6DS93Lyp9OYkF+AJRJuIwQtukFKCWNCT19QVWjuX9td25WjuzctfBUPbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=amd.com smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7eTAGn9oLO7BzX3bojB6pmRJs3ZzexIgk8LPHS7cmQ=;
 b=0DlI7ID3nHfFuWujTMhaH4qyzoTrMRIWBeDtZ/uJQJXki2ifiFFVs7RsHi4VCelZMH4aYIzj3LU+TIpxp/rxP2VLDyPMJt3YWBsefBL5lzr3AWmhFf3lbiR8wC/HuYIb+/o/AFTMTaAST8hPJwH4+MGATpUChjdc6Rd1tjcnsTw=
Received: from DM6PR03CA0064.namprd03.prod.outlook.com (2603:10b6:5:100::41)
 by BY5PR19MB3860.namprd19.prod.outlook.com (2603:10b6:a03:221::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 09:41:54 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:5:100:cafe::83) by DM6PR03CA0064.outlook.office365.com
 (2603:10b6:5:100::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Wed,
 9 Jul 2025 09:41:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Wed, 9 Jul 2025 09:41:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 20841406545;
	Wed,  9 Jul 2025 09:41:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 0739382024B;
	Wed,  9 Jul 2025 09:41:52 +0000 (UTC)
Date: Wed, 9 Jul 2025 10:41:50 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, Nandor Han <nandor.han@ge.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 06/19] gpio: wm831x: use new GPIO line value setter
 callbacks
Message-ID: <aG45XiZqc6wCfC53@opensource.cirrus.com>
References: <20250709-gpiochip-set-rv-gpio-remaining-v1-0-b8950f69618d@linaro.org>
 <20250709-gpiochip-set-rv-gpio-remaining-v1-6-b8950f69618d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709-gpiochip-set-rv-gpio-remaining-v1-6-b8950f69618d@linaro.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|BY5PR19MB3860:EE_
X-MS-Office365-Filtering-Correlation-Id: 649300fa-99f1-4fe5-838a-08ddbeccd66c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|61400799027|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Nm0Ftm1j5Fb1aeeRaEU3d/m09jxt8pCelX72iUENaC6z1+67IqKz243zJV+G?=
 =?us-ascii?Q?m2MJUhiRrhSL4zJIhLQmzHN7ZpC7LZEECCZgXMgPe4gb/EtxjU9NTNpLlDXo?=
 =?us-ascii?Q?bYAOKyQwjJ2U9iEZGA6+Ht6GeKVWCMpF1Ap6YEZPVliYsReW9oHqVhc1XQjW?=
 =?us-ascii?Q?cNc3YVog0xZvr9VT0iJtJzxkS4q3dhfqFAGcW/+vaymb6waQKLWd1Jr2WwKz?=
 =?us-ascii?Q?Q2MkXnI+qwCkr/RpCboRLaxexpwe2cRCJ9CnlN6JK3CmNg7J3fJYNTDnQGwc?=
 =?us-ascii?Q?egvLa7xWzgbj/1qiL2iZNbl4D7tbCG7awWUOC9XcOsKkOvkBoo7d32Axnnq+?=
 =?us-ascii?Q?5TozMeTqsKC/4CcL2hTO3zkVfzbGwIVq9MTja7ge11jAokMUHzwXQYPscOwP?=
 =?us-ascii?Q?5UlwWloVmkCQo+bf/aKPdzu3MKHCuagN+TumqUDYrIAfnwYgCy8WHhDQgSGc?=
 =?us-ascii?Q?qC2JKEcM8wHqgtDY42IAxtuAMetLZ5sgPmMhmugwjYXeQuviVUG5HwoWNDj1?=
 =?us-ascii?Q?9bPf9cDj817gIrWnsbwywwDXszf9ngD2nrcWq7JbJeIJcvYMALd75D8I58xh?=
 =?us-ascii?Q?oaDg5vQFhQdQ6PfGt5BzZmRPeC7i8PnLtjkhUi0i5+fGKXS9oVX76fDLt5q0?=
 =?us-ascii?Q?KuaROoId2mADTRSTGb/QloKuaKCn0LzR1sdMEFyRy2A9NdOqP2MHQanjoDtE?=
 =?us-ascii?Q?YQtnrX2qxpFVz2nZPSlmp/V8KbZlrgb+aq6h6l8FnVFg2hnFep15ITrVSA2C?=
 =?us-ascii?Q?HAevssvMdZdIFR9Spa1QRQF5biyEhbbGJc4yaFHu8wtWNhbVfBfpXCh+HHGh?=
 =?us-ascii?Q?9vjyeya+sfkpf0xCCYkbbcQVI4dGl269UbiA1JXRtq7n1QTjEh1a8yCU8J56?=
 =?us-ascii?Q?m1WOBuDYK4Y3/ndU7au0Ivre8QNjVJH7gLlbxJDfbctAKx3Z2Uo3ApMqXIr8?=
 =?us-ascii?Q?LBu3nrARCLt+mBzTMw2ZvDI6akHfwWGjWmWJXNML2iNl1gt9Tm9wdzuTZr2x?=
 =?us-ascii?Q?Zhag/YPoue78Q1u7YiOL19mqwMpDvFMYqXk9PI088ZSpEtyAIM1oNqKm5NgR?=
 =?us-ascii?Q?srjeroBUXlPpSGFzUDQWhp2UQ9gO9AfbewSiUXoYT82eclGLdtSc3DVMiYMd?=
 =?us-ascii?Q?ohI108mEDO+LA3hjHeolEepFhvq3r/gH9GO7UuRNbnu/083RYMxJ8d0q3xID?=
 =?us-ascii?Q?1fXFDkmrg74MLEjfCfZyRJ7fD84gJmLsNXrmjFt68K2v8qUafqgvXDO+Ii8h?=
 =?us-ascii?Q?JfLV7/NgzUmQGa70QFybqzTdyIjK9HPemH0Cwv7yLOlHK/WPWtRn6bQcWDYt?=
 =?us-ascii?Q?czU8AGZB0fpiXPoPN63idA4+vajDH6NCbuWYuu3CPVku0gYRi2Bq11maAxou?=
 =?us-ascii?Q?pP9dvO6Ox+jVSHvA7zhIGpusWPi02jgrjU9r+EclB9znQyWIMqG8kNOE1dhE?=
 =?us-ascii?Q?h8YwZDEChkrn8dy8HUs7FPwqva6vHvN3l87sJyLAZiZNO5muPtI07fqXiXVt?=
 =?us-ascii?Q?i+bRTkxwFUws2LEXfjq42IjUqm7WjggE5Iys?=
X-Forefront-Antispam-Report: CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 09:41:53.3708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649300fa-99f1-4fe5-838a-08ddbeccd66c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR19MB3860
X-Authority-Analysis: v=2.4 cv=BerY0qt2 c=1 sm=1 tr=0 ts=686e3967 cx=c_pps a=DHJt6lk1nRTjsKHDOIGIhw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=RWc_ulEos4gA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=5zIxZziS3Tv_bW8b8BIA:9 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BjZW9AYLN_J7aDXlFa8en0r0_wpqMJrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDA4NiBTYWx0ZWRfX4Xik//5alI8r UFyNTayMbgojvS8tlYlHLqKecH6JYdEL1Q4ggaDwo+xfA1sEg7avUAD33cNApkmpA8LUHSnmuXC 91Bq3g+yDl8kbYLP/tjzwqOcM96b+YbD4i4jpTOMkd1wbEUxDdC8O9sEOUqpz4V2ibuJH3A7cDN
 FAS5lHOmVxL/g0JvpzKYfECIWb/SARvfiXc0gGh42kyapjKD4zB+ME7mc5DIIHcEvXOuCQiutOb vNVHme8AYOO5fHlDR5p2MIoA84vMGC77OT9+Y+eWXMKUKCspoOaapVLBAT8Vud3YFnxk59XloCl 9xsinbyigj8Vd8Gc2UJKixZhjlnVvfdj6S1/337wn/fUHBGu/2UadcSMUtojtXXadynVkYmPH5K
 EB1boRnwG0Ct0gkQFd5iQXZ4eKAePbLhn767AgT309FHXuKwFAgdBgnjH0r4FsRKuSwNv3lW
X-Proofpoint-GUID: BjZW9AYLN_J7aDXlFa8en0r0_wpqMJrE
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_024213_950747_A3A0378F 
X-CRM114-Status: GOOD (  11.22  )
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

On Wed, Jul 09, 2025 at 08:41:43AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

