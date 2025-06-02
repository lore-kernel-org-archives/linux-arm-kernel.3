Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C74CC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 23:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4Vpa5WCgPTy+i1VpwapiKrKW/K1L0f0Ol4/XZy6OOw=; b=E8kHFrkdMDCn0dvjj6GlDFPS8b
	6Cu7IgaBL0iKw7n5leuVZRKWPpsInReKq8buURrqR/yhKpUOweFXMifO815luY9O3MV8vUevg7xRy
	yaKp/X8D1ER0g/7HSkh3hjl2SLR20o/5hSGxs8YS4RmiBPlX3eR5uwEf6AsJGRPOtGZ2Zzyvwblec
	3PJsh4KPb48addKo9s28Q3rOsXXZlYNmgkmEf1xr+gPcjAfWoVgXShFNz8+Ads2p6Bj8tXnJ72Olc
	F7/YIbxDy08WOE0ErEujClgN0uj8cdPNe/CA2EbQDYRouNgWyb7ELjJ6/kCwbhs42YWlTVYusp0of
	LOpZUCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMEKt-00000009Jnw-1Xjt;
	Mon, 02 Jun 2025 23:12:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMEIb-00000009JV4-1fYH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 23:10:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45024721cbdso39183465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 16:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748905832; x=1749510632; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4Vpa5WCgPTy+i1VpwapiKrKW/K1L0f0Ol4/XZy6OOw=;
        b=W3imowyifkQp78XNzUygn+6PVyk/iEWPGGPR8dNLSz9HVhDAM6z2JzjVcDU921YuHT
         i9lGG1aXZn72LQ/yelkhiB/XVJCQKmD/10ahtVDe7GcR0+GoYkHqBPm5rYl0+PxpDiHd
         dqJpvBx6HdJd5BkLH5ShE+IZXtlugDCkZIw+iLey8JSVuGcVYteIxQLPZwZA9vrXgqDj
         MGU4Zy+v5AOq9sRLjZImp7AX54M2WxAUteRofes7JXHyufx75JUW19rIgIsYSZR4iD8R
         ckvenAt9uelwn+NSYTgamSoF4mifSGQCs7IZOJiqUP5OUudaus7GpT+bqYA7UNv4ByLc
         1YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748905832; x=1749510632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4Vpa5WCgPTy+i1VpwapiKrKW/K1L0f0Ol4/XZy6OOw=;
        b=lT52niXSfzf6lPd/5L0cVapg5+jzHGAquXQhR+Lnr561IkiJ7yo/6l2xOxPN0CQN+d
         Ya+Q0kVvsuWfxM4QzhRt9XLPDG3URflcRGE7eYonPrQnsgSTVlHc1ZMCjiLmSUVEQJn7
         JYfWssmHaPvePlOFQIHol96gGMEkLO5GeELKH6kj5k9yfeR03tI/dLPG+sx2OHEznWw7
         0YN2zjlOprGU3zOePzikQQAAdQvNgvrQi+lCvyGXxA6LL0cssuHidTsK3Lm4AOHgpL6C
         0GuBqHa8dww5EzAdqAjY/FCSL0HwaJvLKaUHm5Y8Sd0nceEwgx6m7lk1JG1s6yYKrsgi
         XgXA==
X-Gm-Message-State: AOJu0YwKIiyp5Zbyk5z5m5rgmCYAL8FWSmoz+S0Kk3/YlRfblGSsoaR7
	O1J2X/gEf8WQIPx9EFcX7tbKnzd04qbjoZcg1SGb2DRWGZjZYgzhxjZfjBC2qaLCfok=
X-Gm-Gg: ASbGncvggSdNBLVcm/u4+q8mRpAJDIejCTL4WsXxo/6CRsIPSPgiL2/zGtWszOdLiaO
	VInwwqv2yd0cWn0el3IFsD6XEoGyZ9tU8SD1zPrhVUWSQr6NSBkFCcYeE7bUn+TvfsoE8KziRIS
	VtNKON2uPxmqrHIfzvJOZhz720NuT0jea4w99iOfcGWNxnuhwxiq1R8JdZOn6ItKkyWPnLyOa+P
	Xys963ZODBt3VL/NgKb4nMKDFzrT46GWbL+goYtZPPAe9zntx7XP6fH8gPvtS9qZziPFEcI8PHl
	FgEj/9bzycIYzPYT+PUifwZB/OVaoxjuqgkDyz8Kv5/SWoA7+F1Wo9m2VDpHOwX+nKJe4EtPAw4
	poo8=
X-Google-Smtp-Source: AGHT+IHVRb/jNONyUnY0zBCRWyEnP04lsieXvz6H7a2fe24kCCSQoZBv4k3ktjmMiMlGczV3RA5mhg==
X-Received: by 2002:a05:6000:220b:b0:3a4:f50a:bd5f with SMTP id ffacd0b85a97d-3a4f7a825a2mr11742538f8f.31.1748905831575;
        Mon, 02 Jun 2025 16:10:31 -0700 (PDT)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e30b688sm6073962a91.32.2025.06.02.16.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 16:10:30 -0700 (PDT)
Message-ID: <d7383d29-516d-4643-aaac-dfd930ec896e@suse.com>
Date: Tue, 3 Jun 2025 08:40:25 +0930
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel crash on boot, arm64 VM
To: Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, LKML
 <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org,
 rafael.j.wysocki@intel.com, jonathanh@nvidia.com, ulf.hansson@linaro.org
References: <17fc594b-b80b-4918-8945-4aef35dc9c94@suse.com>
 <20250602103521.GA1134@willie-the-truck>
 <20250602-solid-coot-of-karma-cfea5e@sudeepholla>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20250602-solid-coot-of-karma-cfea5e@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_161033_473099_182123E6 
X-CRM114-Status: GOOD (  19.23  )
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



在 2025/6/2 21:42, Sudeep Holla 写道:
> On Mon, Jun 02, 2025 at 11:35:22AM +0100, Will Deacon wrote:
>> [+Sudeep]
>>
> 
> Thanks for adding me.
> 
>> On Mon, Jun 02, 2025 at 10:00:38AM +0930, Qu Wenruo wrote:
>>> It looks like there is a regression related to the device tree/acpi parsing
>>> in the latest upstream kernel branch.
>>
>> I've kept the crash log below, but I suspect this is due to the __free()
>> cleanup path in dt_idle_state_present(), introduced recently by
>> 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT
>> idle states are present").

Reverting works, thanks a lot!

>>
> 
> Hi Qu,
> 
> Do you also have this commit ?
> 
> 39cdf87a97fd ("cpuidle: psci: Fix uninitialized variable in dt_idle_state_present()")

Not yet, the branch I'm using is from btrfs' development branch, which 
is slightly older than the upstream.
(The base commit is a56baa225308 ("Merge tag 'for-6.16-tag' of 
git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux"))


Just tried upstream, which also fixed the problem.

So I guess it's really the same problem.
Sorry for the noise.

I'll just notify the btrfs community to rebase the development branch

And thank you both for pointing out the proper fix.

Thanks,
Qu

> 
> Just trying to see if it is same issue or if this something else even
> with the above commit included.
> 

