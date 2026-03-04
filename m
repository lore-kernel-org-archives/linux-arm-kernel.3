Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2724EF8FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nBw1fSxD2dFeBYtvLIBCd+WEBb8h9+p5M44FyAJ5Xvo=; b=YLeOSlff6u3IqTYuCnEmVQVO+T
	abzPAiMrQIRhmhaITt8nF3BsiRfHJk0T/JfpdM6Zr/baxAk2q9OkSSUFiILR51SJfKxWwm9LyKHpr
	T36n5DfVdcRFcPtau8CTI5OVoIQjquTtxYyjeyYHkk+oq/r2UYsUbP0rcmhrnYiX5hLyoiD2d39/u
	RO966GF2FLJUhQGR7mRs0iuQzmlsvQEAV7P0UfNbYn7U9HT76o7aQe92MSoJ3Pem3iAR0LJjii86i
	g8hPCaYPKOc6sLvxyn/8SVBDsgSZrHTswO8etxq9yYiEkE02ZxtXDkEk2GJHt6LwUyUfSsq66kRuu
	kJ0BGSpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpf9-000000008L4-0CQH;
	Wed, 04 Mar 2026 17:05:31 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpf7-000000008KW-0GQB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 17:05:30 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-38a2544b52bso33774191fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 09:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643927; x=1773248727; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBw1fSxD2dFeBYtvLIBCd+WEBb8h9+p5M44FyAJ5Xvo=;
        b=KPbXcVque+YyhD5oQXEIEq9RIoV/avL2uAaWgDWogEkHDqaXzdacT+oMNILi1XEyiy
         RYQt+wZFcWK88MV1p5z9d5LY3WCk7qq8whoor3eqFZ3qfpK+RKZU3scwI2CnaUMKUqvj
         m2Tph8zgGlDJPhYgmL80H3ThfhqExOQTY+2GknyMEKjjZTj8t67XZdQ7BPTN5jT9eyTW
         Z5D15jyRr3yVamBBcvL5UhjdNh2/mVNNQ6MG2RHSBPg9H9G3/aMSIGHho4dYT7VBdEal
         npltOuXFbvaVbTorMEeCQLieKx8EvRUrdOEWqSBahgZemnqyWgb2IkmbZHzPDeak/SLW
         xjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643927; x=1773248727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBw1fSxD2dFeBYtvLIBCd+WEBb8h9+p5M44FyAJ5Xvo=;
        b=sKLkk2rUpFMMK8N4Xf0ZxlDKuyCFghx79jFAbM93QEePH5WQq9kAXDoUeLsKbMi/zH
         CVK/vYTG60UF+IcoOqscNHuB22Jor5ei2zAhSC8F3RGY+ZJwSmCsJUJGKYVbxzJDkpyq
         wP2ueO0uu9+qFdIgftXs3t4nLO2TrzXs/ojVdzrvvOe3C+Jrp7BCN4ENAi8le+sTBRll
         4dI8RXBpdlBs6PQBOJdAZLm35VUNM6G920TWr7AFLlcPn9GdiTbd+tErJCGmC9RfT2W8
         qVPse9QA6jdONimArBjejokRuK3uZxSIs/sfogF09BONAND+cgFHLjwJkieYaw10EbrA
         jEJQ==
X-Gm-Message-State: AOJu0YzJTjiT0m0hyC6aSkC5V2Pwy114eJEuWvbWVoGKer05V8lUwTTQ
	kppBkvvK4OKtyrXv6MeTE7w7q32pZQ3OM2XG7HpmWWG2+JzsAVxoi8YT
X-Gm-Gg: ATEYQzxJste2FTKt5WTDHlYjHC/uCvU2W3tlmImTlpWHe3cOi6mXjZc6Ljia9+jdidX
	ZepnWngI//x2Vyh58Y4abOCHg3AotB4sHxsqBNkFrTy00hv1G/7AL+X7vyJUdysIbFSyNwDDjfI
	FQVyQWg9qanmtLiQmaUPbQTE3dsTZZ84+sxRTuaF9/m7j3v0G8yBIY2ZD9NlpM463xZ8+vjsT/6
	6jVp8L6uDMo54psqGXeYKJgfISLRifi2cCqMxjMIBqJxemJm51WGQnBHV9cWxLNotPVNQw3XbMM
	tTxbCLFqe6dXfAyW9mYyCTt+zm9E3pltKnt+X0cCpOCGkKsGhVsWDH7Pz6OWX4HmwUSvkNxT6ht
	tNWK9qXmN+ibJbo+Itphq1VXizb0gGiKpMVZtb+OIuurnmsIsFHjCAYb4oXPVTmHrlu/qkgjcsZ
	bb+tXyc9cJ2CJIOhVtg8F1Y/Een1JFTepYlMbtDPJhibqNYn94Ry+EJU4C9tJS5SklpbR2t6/im
	CUjSNOXZIoBzZY=
X-Received: by 2002:a05:651c:41d8:b0:384:9355:6a7e with SMTP id 38308e7fff4ca-38a2c5906e9mr21403371fa.17.1772643926140;
        Wed, 04 Mar 2026 09:05:26 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:2f9:5688:1071:60fc:93b:c6bf? ([2a00:1fa0:2f9:5688:1071:60fc:93b:c6bf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12d81b51fsm397959e87.84.2026.03.04.09.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 09:05:25 -0800 (PST)
Message-ID: <535cfe49-4f70-4ed9-ae4f-92215140e6f6@gmail.com>
Date: Wed, 4 Mar 2026 20:05:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/gic-v3: Print a warning for out-of-range
 interrupt numbers
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_090529_125092_C9A08FD4 
X-CRM114-Status: GOOD (  17.88  )
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

On 3/4/26 7:31 PM, Geert Uytterhoeven wrote:

> gic_irq_domain_translate() does not check if an interrupt number lies
> within the valid range of the specified interrupt type.  Add these
> checks, and print a warning if the interrupt number is out of range.
> 
> This can help flagging incorrectly described Extended SPI and PPI
> interrupts in DT.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This would have prevented the issue fixed by "[PATCH] arm64: dts:
> renesas: r8a78000: Fix out-of-range SPI interrupt numbers"[1].
> 
> [1] https://lore.kernel.org/1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be
> ---
>  drivers/irqchip/irq-gic-v3.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 20f13b686ab22faf..d75163e71bf22473 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -1603,15 +1603,27 @@ static int gic_irq_domain_translate(struct irq_domain *d,
>  
>  		switch (fwspec->param[0]) {
>  		case 0:			/* SPI */
> +			if (fwspec->param[1] > 987)
> +				pr_warn_once("SPI %u out of range (use ESPI?)\n",
> +					     fwspec->param[1]);
>  			*hwirq = fwspec->param[1] + 32;
>  			break;
>  		case 1:			/* PPI */
> +			if (fwspec->param[1] > 16)

   Not 15? Don't PPIs use INTIDs 16-31?

> +				pr_warn_once("PPI %u out of range (use EPPI?)\n",
> +					     fwspec->param[1]);
>  			*hwirq = fwspec->param[1] + 16;
>  			break;
[...]

MBR, Sergey


