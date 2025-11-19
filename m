Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F6DCF34C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40FUCiNe37Fnq+88hPBjHQqzpAUST38gJZwEDLQ1fMw=; b=dW/RcPeQbwz/R/LOgNy8LyI8PF
	yO1J5q0AkWwZzYQih28oPtnir0DokN3Q0lplYGclgadK2sZ/ijYGqIafZW26Mb53Fkq9PBDb7hk97
	RsvPF3zfTJj4/NG77MDUo5/ckVu25kURlErzvD+bTGzk2/9/3DctRMdm79OCuG8QPztzXeadaD5Ux
	jINyKIoej8vxglxn2EKUSj0M/tdFH9dq0tLH2pJKSoyP+HYTjmffHHnBbwOunsvG+7uKzo2RCnbrD
	ezkbQg/0UOA0sCMRPvdkW2n3IQymKwfD+V+XaO95BWdUee33WbuQLtDtnACwrfal2LeOoKu4tl4EG
	Rk+mKZuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjuK-00000003TTz-388m;
	Wed, 19 Nov 2025 15:15:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjuI-00000003TTD-2d2o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:15:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so4167347f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763565341; x=1764170141; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=40FUCiNe37Fnq+88hPBjHQqzpAUST38gJZwEDLQ1fMw=;
        b=jIzJVgphm/M8WbuCfyuOJGucXV/XAL4VQWWLfXNywhUchqa6ur5MIHn8ocFgMzpkiS
         K+6Kb9IFgQJbRvwLQVsXY/s+Ahsl8LtqMw0GKGQFKOOhd8TDIrY+scKpWIn4sqWzYGJS
         nyZWOFIRLBM4ezREmBMW3QTiKwiXrRCZkeCjzFmk6J2p6kQjpe04qdyZqDFIKtOKetH/
         Taxwb6sSAU62ALnC73FMEVZyVwQ40j+1jGT4mRcIEp4Hvix6vfGwB4kpFHl/ivwcB6MS
         RNR5umJN2lLSME2lEtJLZHmbKhFBCh9x4TeFzG+qpFdceDNAM9T/Wl4x3ytrRozHG680
         Xh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763565341; x=1764170141;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40FUCiNe37Fnq+88hPBjHQqzpAUST38gJZwEDLQ1fMw=;
        b=ZrmW4C42X82FA60unbjtnz+WG+e3LTGHkYEvWETJ/kljdeJhmMHVBT5+vguVOPsvRH
         6AoLpM8oIBOtZqat34YOyXpauJxhng9ab11rTbgwHBXUKZVauoq0HiXyuINOkmZDhPws
         RwdiwY2bWIGFib/Pcs0wS1eSgKoWW0hIVTorjU5p1kfoCWJXZmGABRbMBGG+Dvtz1jN+
         QJ5x1PPIMhfBGGU3lCpZ+ZFJvuFal+hyTYyqlC9cbRfVABZwfk0PasFSeJik9CVOkPDW
         fvTnITPO9DF6Oh94RA2gm4q9FbYdafiM7TsKJK7NWBMRl8f2hnBadykrITt2NZqcjSnF
         fYbA==
X-Forwarded-Encrypted: i=1; AJvYcCU3l6+1RQAkjkaMz5uRBNC1lo94U5KsodqqaIgk+PBAEPfKKST6kNIEtfX8qerYZctRHC5xOt13UdXQd3n4TsxM@lists.infradead.org
X-Gm-Message-State: AOJu0YwhNxwge3psoLU4Ii+mDH+v2fxisM4wURwdj29Hr/Vc9Qa5Kj+L
	8xJiaj2j+CQk1u0Jtes5jcx7RI0r48SDCzhY1W4snNhO/9aZ0MXGnYaEzl29CT1nny8=
X-Gm-Gg: ASbGncv+pb5d+seGFB2WUNfNxPVnC0/3tesgKzbHR/c6rxV9z0ETibhy6gyP8E2Cdyt
	cd7cYdUNvwV5kn5NkW/6UpzjfmoSx3y69w+NduljzK/QLglWN0awGz8Ho+dfMvTbbxqyGcY56P3
	OVcRwZmxTgCWMdmuuHSXci5S1QfXbsb7fZpKu9k2b160JeDmQg0HTYzPmselgd/Hp9FatRVhtxq
	qEPi00qcNZtrBWA2yt1FVpU3IZEkrShjmB1CygEO8wTw1ifwUdgSX4Ndz5qB9N1KJodJulXEVu0
	PrBsjZbRlPH7M5oI1cIPdfMSra9PrA3CPcd9qk2ERCADbsENIrT5vZosN38mrd/LmeTrHnNdilk
	7BL5pACDBKUv5RKAaLFCgwXFXnmPWUhFFfGW+8mhuDCeZxqnREpYiPP3UehiPwx7gqTR10X1xo3
	4n3uq+vn0EbGXdSB8T+Xbb5KZ5p+w=
X-Google-Smtp-Source: AGHT+IEdJcHPoiyWTs3kHkkIy8jDxEKTn292cUpANiNFB7Utp4jeLkleNQmmD+5zgCoeUg929Agzig==
X-Received: by 2002:a5d:5f49:0:b0:42b:36f4:cd21 with SMTP id ffacd0b85a97d-42b593742e7mr20124823f8f.40.1763565340777;
        Wed, 19 Nov 2025 07:15:40 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b62dsm38526469f8f.24.2025.11.19.07.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 07:15:40 -0800 (PST)
Message-ID: <b503a2aa-2f63-49f1-a7c5-c8c19cb5922f@linaro.org>
Date: Wed, 19 Nov 2025 15:15:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
 <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
 <20251119123647.GC8204@e132581.arm.com>
 <a199db90-a344-40e0-8628-b4c3b56fc92c@linaro.org>
 <20251119143751.GD8204@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251119143751.GD8204@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_071542_691061_FE88EB13 
X-CRM114-Status: GOOD (  16.32  )
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



On 19/11/2025 2:37 pm, Leo Yan wrote:
> On Wed, Nov 19, 2025 at 01:55:15PM +0000, James Clark wrote:
> 
> [...]
> 
>>>     static ssize_t format_attr_contextid_show(struct device *dev,
>>>                                               struct device_attribute *attr,
>>>                                               char *page)
>>>     {
>>>     #if IS_ENABLED(CONFIG_ARM64)
>>>          if (is_kernel_in_hyp_mode())
>>>                  return contextid2_show(dev, attr, page);
>>>     #endif
>>>
>>>          return contextid1_show(dev, attr, page);
>>
>> Not having an #else implies that the contextid1_show() part is valid when
>> !CONFIG_ARM64, but that isn't right. That's why I had the WARN_ON because
>> it's dead code.
> 
> Based on ETMv3/v4 spec, would contextid1 always be valid ?  (Though we do
> not support context ID for ETMv3 yet).
> 

It's not currently supported for ETMv3 in perf mode, which is the 
relevant thing here. So format_attr_contextid_show() never gets called 
for ETMv3 (equivalent to !CONFIG_ARM64).

Based on the spec it may be supported, but that's a different discussion 
and I doubt anyone wants it so it's unlikely to be added.

>> Personally I would drop the is_visible(). It makes sense for dynamically
>> hidden things, but these are all compile time. IMO it's cleaner to just not
>> include them to begin with, rather than include and then hide them. Then the
>> extra condition in format_attr_contextid_show() isn't needed because the
>> function doesn't exist:
> 
> This is fine for me, though in general I think the dynamic approach is
> readable and extendable than the compile-time approach.
> 
> Thanks,
> Leo

I agree in a perfect world, but it seems to have caused confusion and 
wasn't that clean because is_kernel_in_hyp_mode() only exists for arm64.

I'll send a new version without it.


