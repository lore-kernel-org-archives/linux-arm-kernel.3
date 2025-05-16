Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC51EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjLIqRmqM8iATan66koGC4b1mSQGnkyDHRBUgumcFk4=; b=34J1PC3ol0Ss5voYuuqNelICMl
	lUtc8y1rvVKZlel478RGtmSD2CWP6CORoWne3Vo9DBzsV81P2UMAdpqpXCp1fQv046LAR1LmONbGP
	oTJsdSBs0j5xW6M4kIh5iPGYgxg0TD3F3OJ9pKHBK6mj9I5/qMoyBVfeJC80ceFzWplrmUwonHIaH
	G79yOMAgi18UuWiGsKuTK4rQmpHZblaio6dwryOKGynJRVY+UxViewPJITJ6WgicINK2NwpXTxFfJ
	d0jtDzXa1nT/BYGF8BggoUWRps079cl3pBn1wlqvRx8immcb/ktYiNK8fwIwCl8A4ZyPCJ2LmeBD7
	2T06xB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFxQI-00000003vIH-2AcP;
	Fri, 16 May 2025 15:56:34 +0000
Received: from smtp-23.smtpout.orange.fr ([80.12.242.23] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFwwm-00000003qa7-3nrN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 15:26:06 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id FwwhurcklA4O7FwwhuuZlc; Fri, 16 May 2025 17:26:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1747409163;
	bh=bjLIqRmqM8iATan66koGC4b1mSQGnkyDHRBUgumcFk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=g85XleWbkPpB980J6oB9JJ1sNnATa4gE3PW4WVxKrWLck3X2699CiaVuUNLNQe/nm
	 7FQBgLBu2xl6nVyM/vCGP2U8HF/FjTFhpG+ShHwkfn/OQQnZWYKKA0wp3hLOJA6c8L
	 FcFQ0JucHXB5I03prTBqbgTfHN1RAzG1GCK5NQZ4xOVtfdvLnDYygK5oIvawoNAyS+
	 9HWdjAaitCW6bLxVPQqYpUZ+bxR7N1CG7ba0NqLEPDJ5sk54tyHh2WKFj3YYjgbkAY
	 228r3OPLIwJ9ZbHyl6/V9h+BckjGv/hpFTqAvDLQTc0gzZVaT5SUjANVkzwsMw02YL
	 UIRTJPQIgc2Jw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 16 May 2025 17:26:03 +0200
X-ME-IP: 90.11.132.44
Message-ID: <eb0b9f89-8c34-4d30-87bd-c4e631f5b1b7@wanadoo.fr>
Date: Fri, 16 May 2025 17:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
To: long.yunjian@zte.com.cn, sudeep.holla@arm.com
Cc: cristian.marussi@arm.com, peng.fan@nxp.com, justin.chen@broadcom.com,
 florian.fainelli@broadcom.com, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fang.yumeng@zte.com.cn, mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn,
 xu.lifeng1@zte.com.cn
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_082605_081986_EA79121C 
X-CRM114-Status: GOOD (  11.58  )
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

Le 15/05/2025 à 14:38, long.yunjian@zte.com.cn a écrit :
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>
> ---
>   drivers/firmware/arm_scmi/transports/mailbox.c | 17 +++++++----------
>   1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
> index bd041c99b92b..816e79537935 100644
> --- a/drivers/firmware/arm_scmi/transports/mailbox.c
> +++ b/drivers/firmware/arm_scmi/transports/mailbox.c
> @@ -13,6 +13,7 @@
>   #include <linux/of_address.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> +#include <linux/dev_printk.h>
> 

includes are (mostly) alphabetically ordered right-now.
So, It would be better to keep this logic, IMHO.

CJ

