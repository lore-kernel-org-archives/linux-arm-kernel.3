Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC2ACCF2DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=; b=H4++oEsYmnVUpZUx8FSSxGS9gr
	nPb7FEyDSpf+3aauwKL+PVVQ32A6hJsA/of9Hstj+otgrxeq8RiDx4dNroTMdUD6FVNnAXFvafpLb
	YVLgCeHSExT6D0QoFHhLD/Bmfktp+fJHspg2lOBOTVsLv61/jAcezWZ0Lvdf+siK0APEldR+TOtTC
	vVSWks6s5WZb6vOo4k0BAjiuuPps2TpwLJ8N5K0IXYM9wg0zqAsqRNAg91o10TmANauFTm/AVfht5
	xk/6T8ElWRuWgHyOAVTy3ze8PxeBuySm9YSkParcR8os2PHVdY30+7iMDlemBWWchFeFShL1p6dFA
	DGu/O85w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjfC-000000070Aw-0usw;
	Mon, 19 Oct 2026 09:28:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjf7-0000000708f-40wD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:28:11 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso985853f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 02:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792402088; x=1793006888; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=;
        b=Sr7NKckuwCKjalCpKT5y1Z1ze5lv5UWXkTsREz4IfJKab1HlVjuBxC3G3nfU3IA72D
         9eWfFFzUkMKgHp8ESYqHbEiLDD7TvfNz6Ii2mru1aBFfiV9/K+7ZLBb1VSGjgruWSn34
         RBZbRffvkzHzuKRJAlRijtQEstq/oqZnbkLjNR1CmR2pPn+MvtCrSXs9DobaaRwvEqhX
         c+mtV+KYPQ1169PAwxemEex828TuqT7w1O2bskcCUaMLvdg+m8iCB2IBxV0itoOT8zhZ
         QaPFmt/PwvcGsND4tTcu9q8IzhKfTsCk+gcJ47qhmvqyGmowyR/yrb/N/WFlriKWvaUt
         8LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402088; x=1793006888;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK8j4zExJxC720gbifUR9mDEZ2k0SEqSK8uj/t6ufAU=;
        b=T1jC27JFMtBjBM7HO8ZcOAeARXDqnwwqi+xsHQdJ6USDstxVBrHrX+5V1HizoSeVXv
         cFdNRQLT/kyS4AWVG8e+DiRL05aaFTpInN+j9iqCAorytR1tpEzlJsrC2fsIe2mLChk0
         5zl5Dpe43OimPCz9/o2bWSvu4uku55F8cMktuzbyr8hwvI7wnWmaw9r1tDCn4chhQ8Ed
         3w0ZFm0fF6kNx0c8bzoX6qoLjuE/rVa0NhtsNlWMBTuU13Qd3vBh4KUj06ZIEJeEdNzs
         Nvosxx0WnD9qroQzFOGxQ5OT2XLkunTWivGOURtE81ateWqA2iPmMKyf/uttkMZBrH/0
         J2hw==
X-Forwarded-Encrypted: i=1; AKwUvByqsP0UMqIMrhzbLOWJeuGZDgdAhMop/E4DOegdbfoRXtZjF7DxH6RTyGB6Y6BU89+PHl7QBTqMsPtJueRHijb9@lists.infradead.org
X-Gm-Message-State: AFq9FYJZiyW4FHy3xmKdB7AfRSSHFSo20VkgB8nhGJSzFnR0AKRbFEIM
	esaUgRqnSOsBXzMbwAIoCr1gXGEdFC2CDcbU4gozDumBJcnZ0I3wIwg8sLRUpOXi1AI=
X-Gm-Gg: AYBFou21LUYODZ9QCnu4hDz4r0GQSNHK4iGkTwjjN+VygyhYB0umcEjRJuMRyB6Ps6/
	dXKqcb7OHeHc1ixBVN/Z+iRgP52q8M+tfgXBM/u4rJ/fq/qm0IDijLovzdBqRthinxRJ9MZdL1Q
	nTuQU41BqBfFGPGbJSjts88l5qJ9ORSxPngNJLGkc5fat9ffCH0X8TK/W3rv7hXKXlNJYZw4jxn
	rDwRrc/GdJbuzL3WDe6KCUWuxJxIWIbTBi7EDUYxasdlinQIkeHeN1XRoSIntrgRUV6AA7UZxdZ
	E0ZOQHayELyiZQd82gQ50x7CyOVsJfBzHByZQLPJntH4B6peja4eXF7Ik7IcXQZCNnfyoeqG18S
	E+QeHC7rXXYZV4YICT3we1mBewSZsVRL15OV4zRfrsDsDkm3ofKJ6We+dfR7hUsdJAJ3MHQqYsa
	KaMJBgmTO12YrKFgAq7R8jrH33Wr53JS6fdPpnlw7mDH+DyCxgTcZsZ2UdfkJxEl9VDzuuT61Sq
	NxLpO5g4qKPLhQi5RX6GrOxcFTsYgHNPBPh1mBWrNQQ2TLMrVYMKdbAywqH
X-Received: by 2002:a5d:59c1:0:b0:48c:4d32:ccfd with SMTP id ffacd0b85a97d-48e0797ff49mr16398545f8f.6.1792402087710;
        Mon, 19 Oct 2026 02:28:07 -0700 (PDT)
Received: from ?IPV6:2a0a:ef40:eb0:c501:2c4e:44f:2449:8978? ([2a0a:ef40:eb0:c501:2c4e:44f:2449:8978])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm23498338f8f.6.2026.10.19.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:28:07 -0700 (PDT)
Message-ID: <cb24bc10-aa0f-481f-80d7-71fddf1e428d@linaro.org>
Date: Mon, 19 Oct 2026 10:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ARM: ti81xx: Prevent USB being put into idle
To: Andreas Kemnade <andreas@kemnade.info>,
 Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Christopher Obbard <chris.obbard@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>,
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-1-b4ce30217028@linaro.org>
 <20261017085339.3533e9ab@kemnade.info>
Content-Language: en-GB
From: Andrew Goodbody <andrew.goodbody@linaro.org>
In-Reply-To: <20261017085339.3533e9ab@kemnade.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_022810_018174_0F24A9A8 
X-CRM114-Status: GOOD (  18.99  )
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

On 17/10/2026 07:53, Andreas Kemnade wrote:
> On Fri, 16 Oct 2026 16:41:16 +0200
> Ettore Chimenti <ettore.chimenti@linaro.org> wrote:
> 
>> From: Andrew Goodbody <andrew.goodbody@linaro.org>
>>
>> There is an issue with USB being put into idle with DMA enabled and that
>> is mostly prevented with usbcore.autosuspend=-1 on the kernel command
>> line. Stop the ti,hwmod code from putting it into idle by setting the
>> appropriate flag. This stops the log entry 'clk:0058:0: failed to
>> disable' being generated.
>>
> So the module cannot be put into idle in certain conditions. Why do you
> disable idle under all circumstances and not e.g. adding some
> runtime_resume/suspend pair somewhere?
> 
>> Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> ---
>>   arch/arm/mach-omap2/omap_hwmod_81xx_data.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> index 9b5c728fb7da..2f55dc32e150 100644
>> --- a/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> +++ b/arch/arm/mach-omap2/omap_hwmod_81xx_data.c
>> @@ -650,6 +650,7 @@ static struct omap_hwmod dm816x_usbss_hwmod = {
>>   	.name		= "usb_otg_hs",
>>   	.clkdm_name	= "default_l3_slow_clkdm",
>>   	.main_clk	= "sysclk6_ck",
>> +	.flags		= HWMOD_NO_IDLE,
> 
> and why do we need this here and not in the ti-sysc node?
> 
> Regards,
> Andreas

Sorry for the noise, this can be dropped. It is not needed. It was a 
workaround for another problem that has since been fixed.

Andrew

