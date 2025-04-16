Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD57C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 15:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BqUwR/j4bGZrHGUzeU8HFrJ3dPz6gWbqr9WxRuB4G1Y=; b=dtnObcUb/wkZ9sAUJ6sBEeQZPM
	whvRSGlDUvMu1jgXY/fiM+oc05lCvDhfZb696Og/qWr75fg1JNM5D4aGp0DtrfVdDWulF2aAL5Gw6
	FB1lUQwGLRhlyJEFDQzxOx/oPIaw8Lmt1yv1d8Ka8yypvzcyw65z8Esu9kEKC9qDKCi+6eBVyoITm
	XFwq63ISwIoQ5rO13qPFNcd1jqc0sC1qKkvFZ9VdmbMPKENKZjdPNJWk+Y5t8R+uH0l/5DtI84swD
	/cBlqwtgfP0pE02xa6luG72q/hm+HkUU1hy7QC5rSGSvaO/WKro11ARdphWFJKuD6MRNGRA//KT9r
	zLEzfALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Qf-0000000A1uL-2Tpw;
	Wed, 16 Apr 2025 15:11:57 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53GL-00000009l0J-02wr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 13:57:14 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-60400013960so1792587eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744811831; x=1745416631; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqUwR/j4bGZrHGUzeU8HFrJ3dPz6gWbqr9WxRuB4G1Y=;
        b=PRSnlwpC9G8vM7OXry7t8CP1cGSYOKfqL8rKUq8ho935g8YGz5hCB8n7LwRQjTuCPh
         KwTAyTajR+rTih91GJbITr2jXxmNYxd1CVlMBGi9WaDJPiiGyQdhwURkP/1/1Sa1kzTc
         dK2Eel7S8uedkbsppjB4VaOnGNdRQAOATqNSjbyUuSRd+37fVRQcCf1I4YYV8hMNLYep
         7XPLnWQwSpqOptmKf+pFQeAigtiMzuTJ0J0gs3p5KYcT0RjQn5REGaUXkRWx5ZYpIQ9W
         f33u4h6JoWhoSrngY5RyLMOhohPR9Gx74uUQ1h2tsmhKl0OMSpwFYvb+37zsx6iox1lZ
         FA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744811831; x=1745416631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqUwR/j4bGZrHGUzeU8HFrJ3dPz6gWbqr9WxRuB4G1Y=;
        b=hSy1/ikttYeSwxxO4ZuBklnD5RiAqijakrWT004g45Kv8yoJEq6RR8ErM/bR6LLobq
         Hs7dphACSvD4wdsdmLW62b5Yyjx+6X8RHuSkF5LOD+gtuOFNPLerW83e/c0VJQ9RhpbB
         YkVX8no+2ocxecBTaum43v0/SLwdf8e5muBK52T6oGHIZhS4F1O+jl6aVLy9Ftj0Iv/r
         FlBxHT2zjDuHlvZdwDnoe+6uTk0MS27WJnL9n56KQilBCFGH4lFjnkGvQKJDPMtX65sY
         vEGj5w0aXihuHUsb/G78gl6oxcNy51QoZt3ZSLzSTX7Gs3q5yroJBcm+Fuqysy5+QyIo
         5/IQ==
X-Gm-Message-State: AOJu0Yw/PezNrhwFa1BwsYpeCEdB4CHLVjUpYkycHzlbOQtnHs44S9S6
	eBpYr34H4Z96xCCEigNrOptWZ5knZBVcmh5bI8D91e1HmABpp/1M
X-Gm-Gg: ASbGncsaWlOmkDySAEqVVk5cBfKL4sqgXKfLvHadMSrAnm5/7AmjOyMgktK17lSLStS
	amtnyc5N+gP2nLqLvtVQNQm8pfGgMI83YNPSeXS+qRmgiVbDuHu5ifkqytQ4zfQOOxS3ZeIzeOj
	Qo2r6as7GmWoFYJonTPawaxfHNY63sLfT/x3nAhau3mKCROGf0E53svg6dqYw/+E9D62Foq3Gyy
	Va3l4tYlEAYFfJs1KozvG4/pzYvsQj1TLayxpUQPWuHpTo6lH18Qp76BGcADW8oAIseB5uV9fT3
	zbxwyMrcAifc7N7jAXj5xWenP1quH6NT9UWMiJmUy25dZArCOUxZ2g==
X-Google-Smtp-Source: AGHT+IHsnTz6aRDqS91PsyklJ+2mGSMI2WceYpHCHhbZs6GUjWU0+dDU3rsBet/R6xgdANI/YTXZvw==
X-Received: by 2002:a05:6820:2901:b0:604:66b4:a8f2 with SMTP id 006d021491bc7-604a91e80famr1013000eaf.2.1744811831457;
        Wed, 16 Apr 2025 06:57:11 -0700 (PDT)
Received: from [10.30.57.29] ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-604a5bbac4fsm358847eaf.17.2025.04.16.06.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 06:57:10 -0700 (PDT)
Message-ID: <c7db6fda-bf4e-4d6b-8cca-db82c40ce1b6@gmail.com>
Date: Wed, 16 Apr 2025 08:57:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/memremap: fix arch_memremap_can_ram_remap()
To: Catalin Marinas <catalin.marinas@arm.com>,
 Ross Stutterheim <ross.stutterheim@garmin.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250414133219.107455-1-ross.stutterheim@garmin.com>
 <20250414142140.131756-1-ross.stutterheim@garmin.com>
 <Z_-B5fAhZzShX34I@arm.com>
Content-Language: en-US
From: Ross Stutterheim <ross.sweng@gmail.com>
In-Reply-To: <Z_-B5fAhZzShX34I@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_065713_050494_07ABE0FB 
X-CRM114-Status: GOOD (  12.64  )
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

On 4/16/25 05:09, Catalin Marinas wrote:
>> Fixes: 260364d112bc ("arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map")
>> Signed-off-by: Ross Stutterheim <ross.stutterheim@garmin.com>
> 
> I think you could also add:
> 
> Cc: <stable@vger.kernel.org>
Done. I also added some other Cc: entries on V3 along with Reviewed-by: 
lines . I'm new here, so I'm not sure I've used those 100% properly.

> Not sure how Russell picks patches up these days (I used to send them to
> the patch system -
> https://www.arm.linux.org.uk/developer/patches/info.php).
> 
> It might be simpler with git send-email (that's the alias I had):
> 
>    git send-email --add-header="KernelVersion: $(git describe --abbrev=0)" --no-thread --suppress-cc=all --to="patches@armlinux.org.uk"
> 
Thanks. I created an account there and submitted V3 through the web 
interface (to avoid my SMTP server appending more stuff on the end).

--
Ross

