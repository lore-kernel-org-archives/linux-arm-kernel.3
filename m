Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E33C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 13:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJqvpu1y+4E5NtNYaZ47CWI+OeRMPdsjPIXhqDX1g4c=; b=aeZwCXSCzpc8H+oemsiPOEEyOX
	9lnEkmAiRVYFSWVxYYaexgcgrVVE9xxFiNpQ2C3GFv9iBJYAEsHsfDPH37YDITvmUseghCQt4vW8g
	ZCJ3DHTwqVQvtGAV/L1rMTQFe1nj0Re6AcY1IacHZQGNyapvmnlEraMmuCVv0ZzvjcqJc8YgPp7rk
	vT5PgiIncKPxYhDlsZzXLsQdDFlqeAO6sNqDXB5ztMGbhgrJRSVz5xgSdyOa+E9CQLnrYDfS6ha3P
	IxLmcgUcqXlLMsGikr8rcUPyklNS3ZkTNAzC677+C1uowDVowga5LjWUMWV4iKHjVeHVxzcTX+umo
	LG4FUCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDNd-00000002UAd-3IjS;
	Wed, 26 Aug 2026 13:09:25 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDNb-00000002U9z-0c8I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 13:09:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VB30sGlxWnzCTtUgQxQXf5gMaiGUkS5GDtdrXKwqAx1+lVLixn+pTXXVlY0nMN5kvR9611VPUhF9Te4Oe7Xdn+YkZ2f8G5JbqMkLjG9A2vjnzsCiS5o09c2H4IZjzyoweEfS6xKSekMZyhLdUXO+h86w19wwA92h9xS8ySWxJ7b0flXWpAGgdjQCS/kLIpg7/wrMtwNl9qZrxE6BD9ZAMvUYwOzPf9uyK4YAqMbV5uZQIxgmnEtHJwGuE9IyQJbINfZg25cEbWRFozMNXlg74x3YSHbpGkRIxRKqTOQanoCbo0mQAjHCzgTDP4kro6tAbxm24ZwYseHLptTiHEfz4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJqvpu1y+4E5NtNYaZ47CWI+OeRMPdsjPIXhqDX1g4c=;
 b=T4Hpj9J5uFUTaCjd+2YUvNNEkteOCsnbUyyCxzs9RBHktxdmGEnrQIpIIY01YxAH5mdmr1z+wRf+a0/POABG9CYN5Z4RNPPSjM9JucUwWcNJzCgPjrp/rRePPLIg6c4SXV0NaYyM9suTB85Uu2hY2XcbH3OYuPisb3qdcHZdcIOzfGhWkOgr/8myw2oDgrvQvpmG0viLJch9T0YpvjOmCeg+aR1Eg0Tq4orUBwLczHng7RvjT/FotTBJmaDvspsroqGg67e/1xhvPbfvk4zRN5WBxa2R2edi2AHC2mJWCQbabCKgDoZeviO4RDZbOMK1gnIK91+hc6qk7qHsz7pLmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJqvpu1y+4E5NtNYaZ47CWI+OeRMPdsjPIXhqDX1g4c=;
 b=MU0bqZzjqr0hE3ZK8dlKFje+15ybxqRaIwYFbxEeLxyDfT0se7H+TVNVXrVaLZRuaSYJ8fdVN0MLf6wixhpUnuMVGJON7A7UWcGU+94oGg2MZKX2OQMCmxSUPS/+kvG7xnjCRTdUNz1cVKQjr5QnrPeQD+hFZ/dmvtMol4irBbmVe3NtJcDFmQ+w356+HsTpy/vH9mQ4s1j3REplJuj0F7tqPEsGmKF+XULqT1zTdBDAMuEQgTPHMtgEyFOifwxYbX+g6G/A3+w/6P0SzwxKowca4HcT+l9hDvmUHkiAN1gQQtY9qEotUePYnDmVn/Rr5JmUkkCZgR7iPEGXh7hr3g==
Received: from AS4P251CA0005.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::10)
 by AS2PR10MB7852.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:642::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 13:09:13 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::a5) by AS4P251CA0005.outlook.office365.com
 (2603:10a6:20b:5d2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Wed, 26
 Aug 2026 13:09:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Wed, 26 Aug 2026 13:09:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 15:15:07 +0200
Received: from [10.252.7.70] (10.252.7.70) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 26 Aug
 2026 15:09:11 +0200
Message-ID: <fe85bcab-0467-4cab-97e0-8427387358cc@foss.st.com>
Date: Wed, 26 Aug 2026 15:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32_rproc: Propagate errors
 from optional IRQ lookup
To: <phucduc.bui@gmail.com>, Bjorn Andersson <andersson@kernel.org>, "Mathieu
 Poirier" <mathieu.poirier@linaro.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260810051907.27136-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260810051907.27136-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.7.70]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|AS2PR10MB7852:EE_
X-MS-Office365-Filtering-Correlation-Id: c50034bb-bd25-4cc8-c05d-08df03733996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: OhnVTN/BJZPJKGAhvywMJDH4tFqGsG097UL/roo6q1ufztHo6pPE95U7Hq/bwtZQwuYiD1sT/azhDUebx5GslPqMwe4xm9AnLxaD4VT6xVGAgSlZIasHuo0Lflas/JLr9KMRCh/GTjOAn0nIQM1khZwmhYavi5SJ/31DuMyIJVCTmiXWY/TCBghwdn/BfVUh+kuieaNR7PC/+qyE7eusBqZ2rAOj6d+Mzzi33KqYE4Z7IvMlSSY9eEyOY0XAzfMz6Zn7KVHCXtH8yLvf+hDZwq0CydB6TH9oU8Yxh5lu0jI5uIZ53kqgzn80e57NQLzppWUEPcPjsT+RJrQFRlo5lG6Vi8CGNjjFD5cQ4aofOUqqw/7DwO86p1WYeMnrfRVzLUvgFugvbofuLXOr8r10mSO5qZIBVrAwVQGm9WespZq1Rl5uHwhN1RDyL/bam6IE9PL0+pSddxZuJCZmcIuC6cLnnCyboYMHqP58+K12VxoUvBYdT9Teff0k203gAXvn5weKqI376XBo74f1nHi+K+JyS8aVjQ16XWol3zco4SUDuGzrC8Nro6TWuQxboFIH+AG5SCraRLN3lNqpqJQoHBC0W7FWdgUeDa7hBn7Xw//eFQ0NaC7UrXl+kXzlo8zRZNzFyzToleRrbBul8DhWy9aTviMYLot3wu8ZTnxELPmfUQugxndYzsBdT1GNXU4wd7k7zyEm+gnq1lMfxGUywQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PwSrnEtuqxAxUlDgsa/Gjr+71ep7U6MUAsE8kNWf+/EHkMC57bKaSbL8emqjJU6dvoCnmGu9D0s3F0d7iIQYWJJZi8fw/PK7y9eNK2pqaNnceGcdnjFn/bwMaUuxYJMpOklJ25nvxFy8kGs6MXLrzjLqf+HXYjQdn/OH5+xGMldXqmzp7EdCC9PrQazVwLteZKjvZnmBz7W9jZb9MI8Id2EvxBqUCKTPMvef6OFhK/LJ9ZRbc+wXHkXa7aUgwBYJs/AC66949jrsoUn9KC4FFq1CYG9BQfNnnRUE3hVhvcvqnUwPFCO5Mcuwbo6eTihMacoNO8HvUFuZpMM6x8avJcgyYdrYTsIgeJknM6aJkX8Px9GluuY/W+uoUm1SjdWc0RX5MgNiJsFtsRgwT/NChXdont3RHxhqu7A4vCubwlm4S+1dBWTlQbqyIpEIks/V
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 13:09:13.1087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c50034bb-bd25-4cc8-c05d-08df03733996
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_060923_292841_A64E9FDF 
X-CRM114-Status: GOOD (  15.21  )
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



On 8/10/26 07:19, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Instead of only checking for -EPROBE_DEFER, propagate all error codes
> returned by platform_get_irq_optional() other than -ENXIO, so that
> failures are properly reported to the caller.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Arnaud Pouliquen arnaud.pouliquen@foss.st.com

Thanks!
Arnaud

> ---
>   drivers/remoteproc/stm32_rproc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 632614013dc6..9301e1dab830 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -705,7 +705,7 @@ static int stm32_rproc_parse_dt(struct platform_device *pdev,
>   	int err, irq;
>   
>   	irq = platform_get_irq_optional(pdev, 0);
> -	if (irq == -EPROBE_DEFER)
> +	if (irq < 0 && irq != -ENXIO)
>   		return irq;
>   
>   	if (irq > 0) {


