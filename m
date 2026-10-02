Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95920CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 07:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YR6dLgmNvT+blNrmmR9UPpaTcjmKvz6jIJArIcIyWJM=; b=qPV4jYwLaJ1lXiKDbIwLYDWBJQ
	N6LmBdyqupfsgvEdJ/ZELC1E16JMckDhtSRubsFyQdzDI1X5cJx3VRWOR6zLVDlbQ1K9L01BtO2Jz
	3b7E8DXnSmvVX50Da+z13IIdqPw4UBwOd+X8jWYlSVuCaGV73lwiXkpwV5iDyc78fuDWSfdKDPXya
	I3/QNte1Rdiqz5xDaihKHs9dA6nnAOzpZZ8WfdFjjoj/qNFCj2MZJrKQmVRZjYKcajvZwWPRKoAty
	7yAj53ZgZjdMrSxXh3EIq7pklzoIM1/gDPVIQ2vkhDqlIGV0+kqNVXbxKu8dJrurNwLNccbzXccJ0
	7RApz8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXt8-0000000ArzD-2DWJ;
	Fri, 02 Oct 2026 07:41:02 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXt5-0000000AryQ-3wYU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 07:41:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJY4IFgX+1odPVJ5qJzKGgPyD6FtoiOx1IALdruXdfZuFl0+dUKNUwZPBXttn8CQ1tv8GHpCAFisVa2CDJAn1yJTWDhichqedzi2ANr998dtd2zExvHes8BlmNMXUF6ITIkROwD2qQaSYRhRw+FPBVud6PFhdOwXuneXPHx+s7hBUlxglQaB7Wrj0lcROq6un+XqbJ24xP7LXUfQxCEfGCKC8dsEEVGp/i3ySsHrmFuGSDUPr8/R6/6WGsjaHGj4lsh5jsWwShzZPwxfF0BQQ0tfKrYlOi1y+w3VTXYrjOLc1pkfkGCF7UuHMSgPq2WH1nCKwFQ5NrIUJa4EWIAb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR6dLgmNvT+blNrmmR9UPpaTcjmKvz6jIJArIcIyWJM=;
 b=cZjMY7zIOR5w3YWKGVnKG2EdfYI4VhB0K972mZT7X6iG6yp5QwLpraWN0jTo5+buNNkmYlSrUxOYUPhrzmIebeid16H8z4AQnV9/O0nbAHlvtsqSxDCWLbKTgLbBwasjlGWii5Oq9epMTFs9a2y1OaffvVMeDKzO1fInN8ewHVYkpMfVFHU4QxtPCiGtKqLQQI0O0jc0xMlNqzPWL0JIjPDtxlIXAXVlbtI1iZIOV35gZelTcrSk4WdDLHihQhZkI6vOzpUh3kE6c4XsJ7PRqJK3HQaJieJivURP5rp8e7Kxpqa5S8G7kvR6IxTiaTiQz76qT/lsZpOtFQbgYBC9uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YR6dLgmNvT+blNrmmR9UPpaTcjmKvz6jIJArIcIyWJM=;
 b=bw5qxedyOb6Z05Xu7aiSENdlVD5xNUatTSCjyQX7E08pl8a1a+XMq5cvBwABoOFz/t7Xfz2fAAnCiEZXpvKm231N4Ye5slJmAnvazkGAhMyMGCvbDaYk77zQPJVTh7amyBDD7iTmz10u8oLEyaeh8B91r/xybkQLZK6JadcHjKesnVZ/VSc9lKYV59mE9EWhTxPHtwK8Klm6jNYcOyRX2q+TIe1w8DyPxIMMqefHzd/AyJnw40lZyYqg8LWBytSEMx6RjNRKyZFDQLi84CDlrQv7CbcoJhDgmG/7XPK41JorLvVyutMtrPte5Epato+JcPt95LXeq238SW1AMod+2w==
Received: from MM0P280CA0088.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:8::15) by
 AS2PR10MB6893.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5f8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Fri, 2 Oct
 2026 07:40:54 +0000
Received: from CPH1EPF00000527.eurprd05.prod.outlook.com
 (2603:10a6:190:8:cafe::22) by MM0P280CA0088.outlook.office365.com
 (2603:10a6:190:8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 07:40:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF00000527.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 07:40:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 2 Oct
 2026 09:46:48 +0200
Received: from [10.48.86.103] (10.48.86.103) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 2 Oct
 2026 09:40:52 +0200
Message-ID: <0ea5ee19-7ff9-40d1-8351-493457530933@foss.st.com>
Date: Fri, 2 Oct 2026 09:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwrng: stm32 - use swap() in stm32_rng_probe()
To: Thorsten Blum <blum@kernel.org>, Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Can Peng <pengcan@kylinos.cn>, Linus Walleij <linusw@kernel.org>
CC: <linux-crypto@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261001210450.37467-2-blum@kernel.org>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20261001210450.37467-2-blum@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000527:EE_|AS2PR10MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: af076125-411e-4244-d69c-08df20587d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|36860700016|82310400026|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 4mmQYmv9nvXfFNtnBR/N0CoV9zYRnseZzhhEQHqsEqCBIzzWARuZjMj3SSvstwa/9jOT5MHN6+SxM3nZtU48qSLFR7136hX2Eqfhi7PntUVx7Ug8MUlfLTl1U9ySSMD4TIEIwnCBlhOswMILAupCrSx2wfMi7Sck8ms8fy+StYtliEilUNqo3sB9oaWSJYmtDLBKof3XTYbWk+UKPiELVMvg7RpQm/HN4Tka6suJjdhqq3PhVh7dle5oMewpotu29Cycm1jjoA0eP9x3aQd9Yac7NDWEpnItALf0HOWjBKClBTE2Hfo7B7DPiP+dulPFYzt+mH4NS6UzCJSdnaq7BtyYeTyrC6AMMSgORysU4Avym/BBgAuq6C/KjGq0WxstYgeuUiJQFHoAXHUpj9Rl01IPVW6t4clCqEMpZYcvjg2mq12tUVgkceI79w9/ayiPTDDacY7f39ic+ZAKY4+P5D8SelD4cgd7RYK7gjhi7QYNUHhltfm26wXqOUivm0Iu1Lnd7GCPQUz1ASxxnxxJEV+SoA/Kz+UuRgPWRPgQfFDomJzdyM7D2pmCg+B5UJ1g9r0ryADQhbkPfP1wJJLt96oGR1brwC+cT0hJYjMVUWsnNuUyMFXjFBtlvOV6vHvC52qRkMAMvB3WQ8XyVh7iopvpxiFozxELp6qMAn716JTD+BDIot4Kb3kK7m8h7EyaroftieU7e2oUEP007X2hjw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l5tEsuhuvPrnoaXeBUXD0CdN+QeU8+pzY0PPMO8Zo8j28qqN5C4edk7VTXBHVETIzzFPgDytvKDC3rHhQynHkDYHi6gQdm8RbMn9VIo5ZVztu0eX0dKZJ1276n5Z/ikiwpzqyn20grejpSVin7uSfn/Q5Hbi/dXQF4W//OoLaAK8YMXO9uMQ4LqszjZYtHXFK0o87StOnpWihdGFT4V0t8bMC+b3NlcWWA55xwjOwl5oKSWViNNev1z45Y+BlCHL4P9JY5LAtqW8dj19FKL6xh5Q2hG8hCP8B4RmGCV5tIc5aCEJtC7C5sdFYiVBLmxllQucJd7BFmpERycoR/tXkINGDH6U/0dsCkA4pQipfmer7kizjr32CqERJpZixFmp9+sUo6RtLx98u4XDRICdRXYt559uKzfX6UgSDjrImYgYuIOlCGoRVTKJXlE+cSDR
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:40:54.1111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af076125-411e-4244-d69c-08df20587d56
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF00000527.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_004059_982066_56277290 
X-CRM114-Status: GOOD (  12.28  )
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

Acked-by: Maxime Méré <maxime.mere@foss.st.com>

On 10/1/26 23:04, Thorsten Blum wrote:
> Use swap() to simplify stm32_rng_probe().
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>   drivers/char/hw_random/stm32-rng.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/char/hw_random/stm32-rng.c b/drivers/char/hw_random/stm32-rng.c
> index d3fc910f674a..b13361dcad12 100644
> --- a/drivers/char/hw_random/stm32-rng.c
> +++ b/drivers/char/hw_random/stm32-rng.c
> @@ -569,18 +569,11 @@ static int stm32_rng_probe(struct platform_device *ofdev)
>   		return dev_err_probe(dev, -EINVAL, "Failed to get clocks: %d\n", ret);
>   
>   	if (priv->data->nb_clock == 2) {
> -		const char *id = priv->clk_bulk[1].id;
> -		struct clk *clk = priv->clk_bulk[1].clk;
> -
>   		if (!priv->clk_bulk[0].id || !priv->clk_bulk[1].id)
>   			return dev_err_probe(dev, -EINVAL, "Missing clock name\n");
>   
> -		if (strcmp(priv->clk_bulk[0].id, "core")) {
> -			priv->clk_bulk[1].id = priv->clk_bulk[0].id;
> -			priv->clk_bulk[1].clk = priv->clk_bulk[0].clk;
> -			priv->clk_bulk[0].id = id;
> -			priv->clk_bulk[0].clk = clk;
> -		}
> +		if (strcmp(priv->clk_bulk[0].id, "core"))
> +			swap(priv->clk_bulk[0], priv->clk_bulk[1]);
>   	}
>   
>   	pm_runtime_set_autosuspend_delay(dev, 100);
> 


