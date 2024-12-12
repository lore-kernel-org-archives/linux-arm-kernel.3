Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B12E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c+ZQ2nN+RzQbM3dUetK/hYw3NM5s3P4yw/14c5dtxA=; b=M/LvKHe4S0l/05COAbr5H0SnDY
	j6DtxxaRpzZEDHypvfnnPq/DGhrfHYjBcnqfqmHvzjI2JkGgH4ctm7vpz5RiUb1b49e3AiNy6jAMl
	oSe4U8beFx0pVVzJHsnoDB9HOjQ+B6W4G8kOUvbtxs/561NdQcuQOS+ZqN3BkVtWb+4vju8aq6dgk
	aW0wGHItIP5OwbWQYmy0XRaa4Wp5unbXMWkmzjEYwsMCMoSFihVVZpG70bAkbj+j8HYlgBPld1nCz
	oizp3vtjUxO0WyFhtpx1dO5Iq8MnZ0vN10HQp6bJ+1+eqTSqZZu/CYRCiX/sonLuDcXNvQXNY4hFT
	nVzfzSug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlGm-00000000mYP-1by0;
	Thu, 12 Dec 2024 15:38:28 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlDt-00000000lvO-0c6h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:35:30 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCAVPJv011897;
	Thu, 12 Dec 2024 16:35:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	9c+ZQ2nN+RzQbM3dUetK/hYw3NM5s3P4yw/14c5dtxA=; b=2qJrl9YBhg/OBgMc
	FJRu1WLNsTBqyRl+z0b2p6+8+B0HtXvp+PgODmFKHa6fz/KG+Ps9MrZNGiB1i1zY
	ILVRbJvBKEqrpAUwjNpqpJjRsXt9R9Iq6AlPZZIU7aN2WnLtPeFUpjqs+1Zlv/pt
	HVGiLceSqXXcVIeHFivCwAu2pD+iqgKV7hZFmfc5ODM9RJV3Lx+p0Cg+21Y1Xbcb
	J9rL/GXS7LLbD39BAwg3nzdaLzHRCNl+XRunEMMRJsyPo4Q7wxz0a0kM4IbgDnyv
	iGlfb4wPoCME2N6/bff4pEvDLxroIQC/0EAzIrRow6r/c/7u71prYrx3qZ8ADQcP
	wtb3Gg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43e2w9ywuj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 16:35:14 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 49C7540047;
	Thu, 12 Dec 2024 16:34:12 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 608B42839DA;
	Thu, 12 Dec 2024 16:32:15 +0100 (CET)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 16:32:15 +0100
Message-ID: <d8eb157e-2f35-45a4-ba3e-cb296ced0a80@foss.st.com>
Date: Thu, 12 Dec 2024 16:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firewall: remove misplaced semicolon from
 stm32_firewall_get_firewall
To: guanjing <guanjing@cmss.chinamobile.com>, <mcoquelin.stm32@gmail.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20241109055049.269163-1-guanjing@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_073529_651145_07B8C35B 
X-CRM114-Status: GOOD (  14.04  )
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

Hi

On 11/9/24 06:50, guanjing wrote:
> Remove misplaced colon in stm32_firewall_get_firewall()
> which results in a syntax error when the code is compiled
> without CONFIG_STM32_FIREWALL.
> 
> Fixes: 5c9668cfc6d7 ("firewall: introduce stm32_firewall framework")
> Signed-off-by: guanjing <guanjing@cmss.chinamobile.com>
> ---
>   include/linux/bus/stm32_firewall_device.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
> index 18e0a2fc3816..5178b72bc920 100644
> --- a/include/linux/bus/stm32_firewall_device.h
> +++ b/include/linux/bus/stm32_firewall_device.h
> @@ -115,7 +115,7 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
>   #else /* CONFIG_STM32_FIREWALL */
>   
>   int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
> -				unsigned int nb_firewall);
> +				unsigned int nb_firewall)
>   {
>   	return -ENODEV;
>   }

Applied on stm32-next.

Regards
Alex

