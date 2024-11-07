Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D33D5AE7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 09:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=de6Kcufr6UT1ym/eWTdGsV5OFcqLnwSoWKhUAhTVrZw=; b=1YnovzSSY3WzAn+t3SJDfbkVLc
	avLGN6IQkjv5SNQi8scE814aZGIx9Xnw1pTY17OzIoR2SA4GQ5PKpZ1brps3maZxse1GJGUbb5qu5
	obvkVoCjOGuekOo4mwCK/zatHqt6CZtIrGnCYJ6endAUBiTC9hBslzP45sXWBEmQ9NmCNqexW+8Aa
	RjckGf+xgSYH4OqE+QIzf3hqno03/sQfoDDcmXCdjRQ75TaUXnmlEnzD+qb16KsyAV12tWtU7YonL
	gMad5cYaSThQU7zoy6AbuR2dsgDLc3q7krMucLtSEqYgO3lxduIPqv2LcOMFNqxi8Z1aa9zwGzJrt
	J9JO700g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zC6-00000006MNk-11sV;
	Thu, 07 Nov 2024 09:52:50 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8z9m-00000006LvN-38hS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 09:51:02 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A75cHeY006257;
	Thu, 7 Nov 2024 10:50:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	de6Kcufr6UT1ym/eWTdGsV5OFcqLnwSoWKhUAhTVrZw=; b=NfeoeYa8ACbnyhVC
	f26OqBc2GLDkv/KnG0DOaovJoSIIMtWjfIuXMnSDBwcxtGq2wFUIiINqHj+ybLAV
	Ae6sL8Xi40JABcOCkfUwbWOivXvKgkQidqEHJFQyR3Ahs9gsQdJaTpsqgUHQ0qoG
	2LVdln6ztK02pCa9aE4AW1ZF3nsw+1KsUb5LlvmfYHpOXpP2O4WlKSR4C4j4P2gl
	IVAFp/DOpjg3T//MokmTu2PY4XaOUyFpa8ftQ0901DEK0+Kt4A682W9jW6adBjih
	sVAxRCjRCTV5datzzg9hY0Anl3D+Pxx0l5liNSwDEYnCbcyiRQ+cRlBMM1CBNA9e
	Irv0PA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nxh43e5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 10:50:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3D1AA40047;
	Thu,  7 Nov 2024 10:48:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4164B268999;
	Thu,  7 Nov 2024 10:48:13 +0100 (CET)
Received: from [10.48.86.132] (10.48.86.132) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 7 Nov
 2024 10:48:12 +0100
Message-ID: <e40beda1-56cf-4757-8eac-a9263f88e2fc@foss.st.com>
Date: Thu, 7 Nov 2024 10:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: stm: Prevent potential division by zero in
 stm32_sai_get_clk_div()
To: Luo Yifan <luoyifan@cmss.chinamobile.com>
CC: <arnaud.pouliquen@foss.st.com>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <perex@perex.cz>,
        <tiwai@suse.com>
References: <f2d3778d-5fd6-49db-b418-b5411e617a0a@foss.st.com>
 <20241107015936.211902-1-luoyifan@cmss.chinamobile.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20241107015936.211902-1-luoyifan@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_015027_388237_039F9919 
X-CRM114-Status: GOOD (  14.38  )
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

On 11/7/24 02:59, Luo Yifan wrote:
> This patch checks if div is less than or equal to zero (div <= 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation is safe to perform.
> 
> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
> ---
>   sound/soc/stm/stm32_sai_sub.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 7bc4a96b7..43fb1dcb9 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -317,7 +317,7 @@ static int stm32_sai_get_clk_div(struct stm32_sai_sub_data *sai,
>   	int div;
>   
>   	div = DIV_ROUND_CLOSEST(input_rate, output_rate);
> -	if (div > SAI_XCR1_MCKDIV_MAX(version)) {
> +	if (div > SAI_XCR1_MCKDIV_MAX(version) || div <= 0) {
>   		dev_err(&sai->pdev->dev, "Divider %d out of range\n", div);
>   		return -EINVAL;
>   	}

Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

thanks

