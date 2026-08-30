Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD949C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qAd5YEg8CKVaHSzqWSzab/y49rCvJcw+Xu2rn/DgAc=; b=lbyaDNhAhl/oKwPFb4qX8iCriN
	cnFvMjM9XSmxvqILsxeJiH84bHObAjbZXgB31xL/+dnIeJJe5ac6/GGIAbzNU8XvdZcbqiisYo4Wg
	n6+Fr72dgCJbbbZW5tENeGND8Q0tlyHrmKbc0a1tIuAPzxW6hzwMuD0VATfVQbg0BQuNyAQ1pFrd1
	kFLOvG4ybxYlRsgdGb1g3T+8Ky5EJjYzo7kfJTXr2LWpvizHqQEu8svTv6M78j5tggeozSrMlKNN8
	B0QYeadaB3IMqWlHEKwdOeOE+sT/+etGanq83UZUiXogpsm6LuvcPTFDcLa4LXZ/2CHWBOs8l7KEh
	L9UX0kfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0dXR-00000007gDK-0w3E;
	Sun, 30 Aug 2026 11:17:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0dXN-00000007gCO-3qeq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 11:17:23 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c254fd518efso30203666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 04:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788088639; x=1788693439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8qAd5YEg8CKVaHSzqWSzab/y49rCvJcw+Xu2rn/DgAc=;
        b=hVpuwYovnjOIphvaA5gSTIODkYO//cVAyM9iK9oFN18kRJU9KAU3bolEnxEcKsYaUa
         7xhQ1bAPC6z7SGhxWmQiwdaGVitemiN8Ot12yutE9iNNOjYYMcguvMt3yDrMh+/76mCd
         XhqBWAoAsa7iXzf8YTge6RxPLNwT3UrtSEVU8EhsEc3rcdFo0IFC/rDwsDJQGnbqPJmZ
         YAdvfRrKCu1qo9ZU54B1C4BZ6SUdDVL79DLbzpJrcN+T7SWXsCrhStjBCvUAKrfewFyy
         UoSkemc1aq/cc2YCFewT7SQwv36ldiPuKkYzAjURfBhNrlzVjbd9KsuT8WBsK9hWTeFM
         HBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788088639; x=1788693439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qAd5YEg8CKVaHSzqWSzab/y49rCvJcw+Xu2rn/DgAc=;
        b=l3njYwK/VqsvU05mmwHTyGN21yGQnuZ9c2a6FXDe61HngKsqHQ+NzpYJJBzm5A0iOp
         KN26oA3D+ec7nzjpyplstJVh/cNZ6MdjWTex0/OZKfapU3/F9SttDYIB9pOkmdEigVZ4
         37Rtlx3O2Z6ycYQlGlXz7OMkAozOJ4scYtKLYRjajgptSY41faOQF6C3avBOpHMMa/+K
         /YEClINut5VBfYL5IFAnhLdJeA8veF6de+fqc/3d4l48pq3VDIDR3vbp6c2ix0LjQJXt
         MWxRICBE+M2xUjSuisMsDwUXwtKKB55YTZ00VRCjqelr0aLMP2TmpMt9n6yqbS9tAOp0
         sgew==
X-Gm-Message-State: AFuF++kVNv51j/RvmRVJING/L06M/YDljAt2cZ6J3dDqCtUW31UQrBxq
	PtBitLH25p9tW/UbYhlGT2TUDgLUTHVbq9fiF7TwNbL59cB6yM6zIpYr
X-Gm-Gg: AYBFou3N0Qm2/nV9wnvaWFJ08hbKs3VcCSlppavagLxvxWoRAeExcfCCzpfI1B9tdsK
	0E4D0T5AHHi9o6p+ai3hi4fiZ6dRh5ZiHWYpmOVmgEWBG161++ZBKbOoCFqYTZtlbXKey2nQZku
	Q15ZVND1rzJZkwkRgxD/q8PGz0No3RTYmf4TZguU5eAZeH1xUr99S6GBzwhr2XKwijbctPMx7EO
	EbFcwlkWgpPadzrN2knqtodRrznuzGllfrAJPzmJcxrTF5M0WTg28MeSXocccvRRfFc4UxMBMl/
	Ou6WN0s0kDHVnUoWfH/Lnd17gn69DJnT5ECWiEXxJIhArNHTQsPD/MFFrKRPk58xlLMOgyQG8aZ
	qc/5JBwDUyJ6ITCcBICAPZ5DrmY2ee7tIZNwddSBgW+p5s/WqoBCVeTV+sZK1Tku73Ye2hIyKkx
	dM8GKIRYnK0894+IR7i/meFQEGchU1yNL5AdHOLpyOHwQ7jRZbXFddDRO8jZTYZJY59R/sdSYCf
	oXuA2fXNNgg5AsUUpwK0XBMY50=
X-Received: by 2002:a05:6402:43c6:b0:6a0:d411:930d with SMTP id 4fb4d7f45d1cf-6a60d36c8ddmr5293719a12.2.1788088639174;
        Sun, 30 Aug 2026 04:17:19 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611c38e82sm2188922a12.19.2026.08.30.04.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 04:17:17 -0700 (PDT)
Message-ID: <545b78a0-159b-4ebd-9e2a-47d519c98bf9@gmail.com>
Date: Sun, 30 Aug 2026 13:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: rockchip: smp: enable CPU1 for rk3066a
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?H=C3=BCseyin_BIYIK?=
 <boogiepop@gmx.com>
References: <20260829-cpu-v1-1-33dca576db92@gmail.com>
 <2667576.VLH7GnMWUR@diego>
Content-Language: en-US, ar-EG
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <2667576.VLH7GnMWUR@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_041721_973036_EE8B7FD6 
X-CRM114-Status: GOOD (  19.30  )
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

On 8/29/26 23:59, Heiko Stübner wrote:
> Am Samstag, 29. August 2026, 01:40:57 Mitteleuropäische Sommerzeit schrieb Johan Jonker via B4 Relay:
>> From: Hüseyin BIYIK <boogiepop@gmx.com>
>>
>> RK3066a CPU1 fails to come online. Fix by using
>> a similar mailbox construction as in use with
>> other Rockchip SoCs.
> 

> "RK3066 CPU1 fails to come online with recent kernels....[rest]" or so

Not recent..

> and also please use the line length up a resonable length like around 70> to 75 characters.
> 
> Also, is it known, why that happens - i.e. what changed?


What loader chain did you use then?

This guessing!!!:
From TRM: RK PX2/rk3066a supports to boot from internal bootrom or embedded SRAM
Currently rk3066 U-boot doesn't remap, so we end up in ROM code waiting for deadbeaf:

void main(void)
{
        deadbeaf = 1;
        if ( !(__mrc(15, 0, 0, 0, 5) & 0xF) )
        {
                __set_CPSR(0xD2u);
                __set_CPSR(0xD3u);
                DELAY_write(24);
                CRU_CLKSEL();
                DELAY(10000);
                MAIN_LOOP1x4();
                DNL_LOOP();
                while ( 1 )
                        ;
        }
        __set_CPSR(0xD3u);
        while ( deadbeaf != 0xDEADBEAF )
                __wfe();
        secondary_startup();
}

Can't put a precise time tag on it since when.
Let us lead by what current available open source loaders solutions can do.
Please advise here.
How far does a fixes tag have to go back?

> 
>> Signed-off-by: Hüseyin BIYIK <boogiepop@gmx.com>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>  arch/arm/mach-rockchip/platsmp.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-rockchip/platsmp.c b/arch/arm/mach-rockchip/platsmp.c
>> index f659d894bfae..d7d080c29f3c 100644
>> --- a/arch/arm/mach-rockchip/platsmp.c
>> +++ b/arch/arm/mach-rockchip/platsmp.c
>> @@ -133,7 +133,8 @@ static int rockchip_boot_secondary(unsigned int cpu, struct task_struct *idle)
>>  	if (ret < 0)
>>  		return ret;
>>  
>> -	if (read_cpuid_part() != ARM_CPU_PART_CORTEX_A9) {
>> +	if (read_cpuid_part() != ARM_CPU_PART_CORTEX_A9 ||
>> +	    of_machine_is_compatible("rockchip,rk3066a")) {
>>  		/*
>>  		 * We communicate with the bootrom to active the cpus other
>>  		 * than cpu0, after a blob of initialize code, they will
> 

> isn't now the only user of the old system the RK3188?
> 
> With both rk3066 and rk3188 from a similar time, I'd assume both could
> be switch and thus the the now unused code removed?
> 

> I've never thought to look into that ... need to find my RK3188 board :-)

Let me know what rk3188 U-boot and Kernel end up with how many CPUs, so we can remove the "if" condition altogether.

Johan

> 
> 
> Heiko
> 
> 
===========

https://github.com/armhoff/u-boot-rockchip/blob/u-boot-rk3066-sdcard/board/rockchip/common/platform/rk30/romloader.s#L110
https://github.com/paweljarosz82/u-boot-rk3066/blob/wip/rk3066-8/arch/arm/mach-rockchip/rk3066-board.c#L32

