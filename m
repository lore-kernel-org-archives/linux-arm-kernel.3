Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FC1C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 12:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwG4bJ7/mdzDFYMPY5C4D76nQjHjkaEsopktP0VfbWs=; b=tT/SF/G+VPvpKf3JRRcL/ByTYx
	GzZdkn5oXVaCG1wylsAV7FzoS0cIF0Hv+htg7SZQw5UlvWABe10oPwbk7COHc6fRp+OA/FtOy6+Iw
	8T3jLx2z7dkYoW8Piv6zk+xPY1ecmwdGc9lAU1VEngGF+zTkFZNbYeD1+FzZEHEL634WibrXDkFYb
	UpoTRctCmMx6jg7t/1QBZkqCwxZL7YuzEndLLSCwvUq26YkPgrDI0bNqU6EaT7Vlt4QiGc6CaZBcm
	hG8hRSlwG93wcy9CvSvdzWIm8HQnGMktS9TdACz4MXrxpb8GFDj9gEr3c8ACKDFfvxQIneHXXXHYc
	za8b/BBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUlqT-0000000BYV6-0XIi;
	Thu, 26 Jun 2025 12:36:49 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUklI-0000000BQ3L-1sXs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 11:27:25 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QA9Noi009058;
	Thu, 26 Jun 2025 13:27:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=vwG4bJ7/mdzDFYMPY5C4D76n
	QjHjkaEsopktP0VfbWs=; b=dyN/dgUHMztZN9BHU495fNr4g9GL8Bz7w4VC7Ncg
	oXjetj3EJLNs/GerzIwKsq8zgfuqzrsMqixhgwFgkn/E/OlqfeOWuZu+ygP6b2od
	sq2TJGB17hTiurvW0VpdxTkm6aozvYFVUVs1dLcw9i76RYznbuCxzLYYJ7onxvf9
	lArPS9MwOUdN5QywFPw3AQxlsN3pBhMK0dUYYKnTv0lbfw8BS3SAgT8+LxO1f0Ia
	paUCIj8hPOh4sDfiYqSiGRojRbljVzHC+fDu/0VUsMjzwKLjGmFZaoJ8xlt612Yk
	nTzQHWaLW+r9G4D8soKHxstdU2yLcFS4eG2ViHl73HiKpw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33q2g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 13:27:17 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E25874004A;
	Thu, 26 Jun 2025 13:26:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6B515C2EAC;
	Thu, 26 Jun 2025 13:24:35 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 13:24:35 +0200
Date: Thu, 26 Jun 2025 13:24:28 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <long.yunjian@zte.com.cn>
CC: <pierre-yves.mordret@foss.st.com>, <andi.shyti@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <mou.yi@zte.com.cn>, <xu.lifeng1@zte.com.cn>,
        <ouyang.maochun@zte.com.cn>, <fang.yumeng@zte.com.cn>
Subject: Re: PATCH] i2c: stm32f7: Use str_on_off() helper
Message-ID: <20250626112428.GA350099@gnbcxd0016.gnb.st.com>
References: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_042724_982711_AE8F0D87 
X-CRM114-Status: GOOD (  13.84  )
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

Hi,

thank you for your patch.

On Mon, Jun 23, 2025 at 08:31:44PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> Remove hard-coded strings by using the str_on_off() helper.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e4aaeb2262d0..ef15475a7ee1 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -34,6 +34,7 @@
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/string_choices.h>
> 
>  #include "i2c-stm32.h"
> 
> @@ -722,7 +723,7 @@ static int stm32f7_i2c_setup_timing(struct stm32f7_i2c_dev *i2c_dev,
>  	dev_dbg(i2c_dev->dev, "I2C Rise(%i) and Fall(%i) Time\n",
>  		setup->rise_time, setup->fall_time);
>  	dev_dbg(i2c_dev->dev, "I2C Analog Filter(%s), DNF(%i)\n",
> -		(i2c_dev->analog_filter ? "On" : "Off"), i2c_dev->dnf);
> +		str_on_off(i2c_dev->analog_filter), i2c_dev->dnf);
> 
>  	i2c_dev->bus_rate = setup->speed_freq;
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
> -- 
> 2.25.1

