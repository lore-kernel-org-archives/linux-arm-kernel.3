Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752D2D3E799
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Na2ucu6fM7s6QJT4BMpvEJuv3sVjdI3XxnANZwd4Dc=; b=zgIX6JzaH/rkG5t7/OC2euh4JJ
	DMPMNCvLbXmLkW4DqVYuXCG6qenKzUkQJ2ACPmHvLpip+n+KQwQhnrVkIwFKBN3x9z9uiyCONIltp
	YsrZ+l751MSChQ/qgsqLLKmXCAlzUetuKajxUbhpuQsLjPGoAVuuGHpqCypSZJ7R17DeDc6agK0vv
	r2Mj3QIi64HqO3qXZBEVKGK+oT/3lHfjU9aOFisYxppQ1iDIXxlxtEQ4qFgW3ZREWxUyvuwllFyFF
	rtdfUrwPXWvawQBe6bGgg0NANbgNqTjD/Hu1FUrsmkZiuMrX795XqgxHjLQK6wKQEpSCxrZvb5AtE
	13do3zsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cq0-00000002eua-1P6a;
	Wed, 06 Nov 2024 10:00:32 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8cN4-00000002XjB-1pB1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:30:40 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A66feWa015451;
	Wed, 6 Nov 2024 10:30:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5Na2ucu6fM7s6QJT4BMpvEJuv3sVjdI3XxnANZwd4Dc=; b=dU9+ycmjtE42sb8w
	oTYYQKvMNf1mPliKCo9eSgYQpE/QmiAd/sjx5QYvDH8uK094O+5veClJIWnzfbMa
	JUaO12T9ZFiRddmBSaZ/FBllub9nuF8dW0ROzl5v3coLwKIzCs/wURciEvYL2/Yv
	QRhOIPpiWHciYVylXkGVrgqnqH5MjSMb1DuB9lPXp+A1kPSEYIPufORvYirLC9F/
	FvVLk2WVQKKNzeAgvy9TLNYh9sz1iZxna52SpgCyU5GoThmCt+uF/2GJBIt5kR5o
	JL2wIIjI0biOOqd+/2/N4vOjFpV/aVIXifefsl6bwwLHgS5qEPeRnD1SBO5p5Zei
	ySAKJw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42ncxc0cj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 10:30:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EDD3F40058;
	Wed,  6 Nov 2024 10:28:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F30C2251D3;
	Wed,  6 Nov 2024 10:27:56 +0100 (CET)
Received: from [10.252.15.15] (10.252.15.15) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 6 Nov
 2024 10:27:55 +0100
Message-ID: <f2d3778d-5fd6-49db-b418-b5411e617a0a@foss.st.com>
Date: Wed, 6 Nov 2024 10:27:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: stm: Prevent potential division by zero in
 stm32_sai_mclk_round_rate()
To: Luo Yifan <luoyifan@cmss.chinamobile.com>, <arnaud.pouliquen@foss.st.com>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
        <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241106014654.206860-1-luoyifan@cmss.chinamobile.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20241106014654.206860-1-luoyifan@cmss.chinamobile.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.15.15]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_013038_881615_2FD763D0 
X-CRM114-Status: GOOD (  18.90  )
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

Hi Luo,

On 11/6/24 02:46, Luo Yifan wrote:
> This patch checks if div is less than or equal to zero (div <= 0). If
> div is zero or negative, the function returns -EINVAL, ensuring the
> division operation (*prate / div) is safe to perform.
> 
> Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
> ---
>   sound/soc/stm/stm32_sai_sub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
> index 7bc4a96b7..2570daa3e 100644
> --- a/sound/soc/stm/stm32_sai_sub.c
> +++ b/sound/soc/stm/stm32_sai_sub.c
> @@ -378,8 +378,8 @@ static long stm32_sai_mclk_round_rate(struct clk_hw *hw, unsigned long rate,
>   	int div;
>   
>   	div = stm32_sai_get_clk_div(sai, *prate, rate);
> -	if (div < 0)
> -		return div;
> +	if (div <= 0)
> +		return -EINVAL;
>   
>   	mclk->freq = *prate / div;
>   

Thanks for your patch. It looks fine, but I think that it has to
be extended.

In CR1 register, MCKDIV = 0 gives the same result as MCKDIV = 1.
But while MCKDIV = 0 is valid, for sure div = 0 is not valid.

I agree that that div = 0 has to be managed as an error
This could be rather handled in stm32_sai_get_clk_div() function itself,
by returning an error, if div is null.
This is relevant as we may also get an error on test "if (input_rate % 
div)".
I suggest to add a specific test and error message to handle this case 
in stm32_sai_get_clk_div().
Something like:
if (!div)) {
	dev_err(&sai->pdev->dev, "Invalid null divider\n");
	return -EINVAL;
}

BRs
Olivier





