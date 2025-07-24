Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDE0C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RnDGhuhVntOp6Bg9NBCgGc0N9Ug1qhTvHYB+v00dW0=; b=j0kxIbTcIJEa8RMCRNXyHjoK0K
	tMQX+SFRHRp+3j1r4bPr+QKelt/t6su5MYSfuvND2ZiqGYAe1Ky0zJLMmHDv7Sjzlgvl8v1oH+W7k
	FzTW7mNkzFdNIxMoa5H3a447S3wX8OJ4bMow+a8Ud6rK9pNTCUy8J7FJ0V3QnL1Plmqyr2Sb0Qy8A
	mMBtTT2cUyr4Sn+XofzMcgEhZIo/TI6n9QzVnJs8QDWW4CdzymJor9JuhlS1gjtyABo4Zu9O5j/D7
	OY/zz8BPX2jkpoqa5AosOEP7MYve0oF5bmOM7gH8nJcL4LJAGnLCAR3E5EMi0O6VZp0tBL4tGODY6
	69DXPXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewOm-00000007cDg-48hd;
	Thu, 24 Jul 2025 13:54:16 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueul7-00000007ObT-0xin
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 12:09:15 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OBrGXN014397;
	Thu, 24 Jul 2025 14:08:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3RnDGhuhVntOp6Bg9NBCgGc0N9Ug1qhTvHYB+v00dW0=; b=0tZ/WVhYUJ/aOg/R
	scH3RUnxsqa9j+TqXSLg0ad6+qeu5Yqpc/MO5HTw5hmwdUFL1QzorTPoLIP7+UYA
	9wYcFoLw5Yy0Skm/sktJp2umdkzY1Mwii/e30qhvAHPqFrov6hKaOhSKmARNZHwD
	5yafeHYwLujwoaz7glh5PvGL2ylvQkPapjtz9NWbValnpD6rMlqFsL0mmSMhNrxA
	gTCJLGsoq3PBljWlAx5e8r4eGDZwvF+lR6iwuTbzs9Gmt762tvw26HAhZclAru3b
	gYDmLxKEW59nHDZuPSy/Jes3VhnT+ED2QLp47DT9136WAx7VjD8JEBuLSA0r9MZR
	GIMM7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4802q2hdar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 14:08:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BFB5840046;
	Thu, 24 Jul 2025 14:07:56 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 810B56C49AC;
	Thu, 24 Jul 2025 14:07:20 +0200 (CEST)
Received: from [10.48.86.103] (10.48.86.103) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 14:07:19 +0200
Message-ID: <7ef4ce0e-8690-43ab-90c4-84cebb4e58e7@foss.st.com>
Date: Thu, 24 Jul 2025 14:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] crypto: stm32: Fix spelling mistake
 "STMicrolectronics" -> "STMicroelectronics"
To: Colin Ian King <colin.i.king@gmail.com>,
        Herbert Xu
	<herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        <linux-crypto@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250724105754.140400-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Maxime MERE <maxime.mere@foss.st.com>
In-Reply-To: <20250724105754.140400-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.103]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_050913_915799_90915CAB 
X-CRM114-Status: GOOD (  12.50  )
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

Hi, thanks for the typo fix.

Acked-by: Maxime Méré <maxime.mere@foss.st.com>

On 7/24/25 12:57, Colin Ian King wrote:
> There is a spelling mistake in the module description text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/crypto/stm32/stm32-cryp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/crypto/stm32/stm32-cryp.c b/drivers/crypto/stm32/stm32-cryp.c
> index a89b4c5d62a0..5e82e8a1f71a 100644
> --- a/drivers/crypto/stm32/stm32-cryp.c
> +++ b/drivers/crypto/stm32/stm32-cryp.c
> @@ -2781,5 +2781,5 @@ static struct platform_driver stm32_cryp_driver = {
>   module_platform_driver(stm32_cryp_driver);
>   
>   MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
> -MODULE_DESCRIPTION("STMicrolectronics STM32 CRYP hardware driver");
> +MODULE_DESCRIPTION("STMicroelectronics STM32 CRYP hardware driver");
>   MODULE_LICENSE("GPL");


