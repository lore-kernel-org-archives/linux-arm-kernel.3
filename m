Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A536C561E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hTyEaOgmS03aOgKculGs8mBdlQjNfVXusZZmOidICU=; b=x1ZY/IL8zH7e+ED3Lvv50Cp+6I
	NLfJ0td5KmLQi9o957JWhvun0VALkcILYf3jMPbGws+B2VU63njU/nODHIU6MGaGjBBmYMer4roJo
	IS03kE4g8WlHKODp5oNu88+K2dv3iJ/0HhFSgkKlX9irgkaJsVLQn+dZawDuHzWAFvO8yzdzdiqEh
	7nYXev2hykW02j27d8HHj42pIh8M249DJB7afHcuYk52uCccPJxV81sSXO/8ElSuskSo+EtRfoJmm
	FolHAm45wbDg5IoKSShPPQaqPR+SbHppAQBuQIrP5yJuinuDH4WkzqqmWXKNvp954q6a5b5J86hHi
	jv0bF9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruRM-00000005Nyb-0mHW;
	Thu, 06 Aug 2026 09:31:04 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruRJ-00000005Ny5-1sPi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:31:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso21105825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786008660; x=1786613460; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hTyEaOgmS03aOgKculGs8mBdlQjNfVXusZZmOidICU=;
        b=LJlwb2DhdFMSK9o3WDX/261VjrDOhNFI3LRz0hRTpOsfL+RK1tz3DwGcbpY6/tayHf
         obAQlDIU3kWZ5QVzBPLvMQ/Z8VxJfjmAndlWWOj0VY70litqXwi/AYWTMvMKZF6WpjJx
         +cZNI6LmLKk8nn9MQcPVlaJQ9NjAZ4qbvfr3xPgcKzewV3q7GUS9prvf2DPRLG/YeRnb
         CeU4eNjQM+ueRfazLAVdhO9zdXDYZWtdIEx+tIozxjhbHhlmYXsgQTPlDeypvhbj00w4
         /6OBzhlPl1ADQsOLa8lxp9ooot8eLqip2UmDRuMF0GSR5XAamtKhqOyL6Fi/KvMk2bjP
         WcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786008660; x=1786613460;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8hTyEaOgmS03aOgKculGs8mBdlQjNfVXusZZmOidICU=;
        b=Ji2nBZ3E0yQRS8BkVA5uUy9U7dGNW53LU68EVNxoS681o9me9SGBKvoyJMA4SY1IPP
         F2Zxju+BvH+69CIeZvbUBO3W/YmaUDmY0nJ2BSfEgUoAA8TTlLdUHU7pjRyH6CayEBM4
         RwsD60X9pALqUkf5f0z8aWfWJzPUtrVaWSNjYv8VUKOe6rYhdNBMgaf8c+JI0P2nVwmd
         eAmZZD2gbXdilJvEJwYB4eW6ExtXud147be4PO/Eoxt/lA3NaOprLzdQpRMrOfABfFkJ
         KX58LTRYqmrk4c/eJ4053n+mSu47SAA1hrTQMebAJ+TZQkWT0A9FHp2TLHvR162PPdQT
         Uoag==
X-Forwarded-Encrypted: i=1; AHgh+RpbwC4dxhPx7txDHAJu9rGVzkA8qEkp02okOg9v5/OkH9xUXfolrIEe3tSI1pFfJWn5JtXGkI8Wrpo5iexC//Xe@lists.infradead.org
X-Gm-Message-State: AOJu0YxJTfquxM4ND9dODoHdWKbvtY+6fKc3RX8lTBCOiGc8VtCwswMd
	RHXPBwH/ZdOw/2pKLs7j7sVAr7Z80KF/IrbLWXVI+Y2YWgI54X55FW6J
X-Gm-Gg: AR+sD10WXwYR5LDmQsUGQph3SEwvz3MzTwiZ739WDXfds8/YA/1ztEW8Of/QEa72ELR
	w4HtoYc3FbD0rTj2QLhc+VuVFPbhBL42eLJm0h5MthlgFjLbiBJ0dKR4C26Dr4YHaMRxPmoL7aK
	jXSojAwVN/vROf4ZJ7BB7R7HKURDK1R0w2N3Eup7+I1UH+M4lYHjlKqT7yMg/jbtzOTnupDHK9Q
	ZbddtvJbWxqOGrwQzgadVaPRHp8ifP+FAgR3/tE5IXdik6r55i3tqNeamwDDKyHqN55E8ZJeS62
	P817+inE996EhQscdojKN+Er0hA+dLEDySP8hAUfH8rhQDJuIhGDRSToulLg78N+EysbGJFJyPK
	cEyX3acqHW0vaxR2IoLgSYNzMgKsoQEqV16A1OiOFIjttDJHS3paFn78nKAyWAyMXOtoAaBnw6p
	TCYJ+NAx3Cgr8+rfxm4378HiqXSz/SJR5uungju+shZeB3M/tXVSg8d2t8AAOSvIAtIe2/uXrUa
	cIbeYAgd7JrvGV5hofkBss+8pONmAH2A0i9+Vcz4iqnE1bt
X-Received: by 2002:a17:903:1847:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d0ca711befmr157043905ad.1.1786008660019;
        Thu, 06 Aug 2026 02:31:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9ff4d61sm29662205ad.24.2026.08.06.02.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:30:59 -0700 (PDT)
Message-ID: <81cf90a0-a966-4cab-b5ea-ceb1d241fb3f@roeck-us.net>
Date: Thu, 6 Aug 2026 02:30:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: orion_wdt: Propagate -EPROBE_DEFER from IRQ
 lookup
To: phucduc.bui@gmail.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260806062812.26523-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806062812.26523-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_023101_496867_6EE49AB4 
X-CRM114-Status: GOOD (  18.31  )
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

On 8/5/26 23:28, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
> re-probed when the interrupt resource becomes available instead of
> continuing probe without an IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   drivers/watchdog/orion_wdt.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 0e145f762f6f..8595073a8179 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -606,6 +606,8 @@ static int orion_wdt_probe(struct platform_device *pdev)
>   
>   	/* Request the IRQ only after the watchdog is disabled */
>   	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq == -EPROBE_DEFER)
> +		return irq;

I think this should be

	if (irq < 0 && irq != -ENXIO)
		return irq;

Guenter

>   	if (irq > 0) {
>   		/*
>   		 * Not all supported platforms specify an interrupt for the


