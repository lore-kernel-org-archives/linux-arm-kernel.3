Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF19CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTwLCqYrxP4A65CpeLdDZfX/1/5VrrEeFcGj8O2B7PY=; b=I6lwdfY260WwaOFuSk6cvHbYjN
	tUIwEd361a6++46oDaOkW6FKq+UXb8yHGZi/46ZHeQWsRwkbwA/W7um7ArWyj3qSHy5jn/F/+8Ptb
	/ebDKvt6RW+omU0CihJadl0YxcDTLvQhlf2ByDkBfPenF2WSUqIWZUIUlXmcSOSFUDKlehavr42r7
	5ndlaTqzDe+AgZUxYWQGI6t6HvZYzcqzF5slpwJugnyigRo0U2wOALKyOzvxFOrTvoYld0QAKT9xt
	SczIQRaT7uiHwQGiNoq6kIek0XVjCJbH1Et6OiE3KYadjlGHAG7YF//4ASKCaS0GF5niwQuMklJKB
	+7VJf5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8cr-0000000B1gx-04fP;
	Fri, 12 Sep 2025 18:36:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8cp-0000000B1g1-1F5X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 18:36:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3d19699240dso1893311f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757702157; x=1758306957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTwLCqYrxP4A65CpeLdDZfX/1/5VrrEeFcGj8O2B7PY=;
        b=V7lRbJZbr0kTN6N8QhLBE5xL+Cm23L844pbK3tAg2HsT9umJ2dW62Pv5MNPueHmArf
         maKldJ3beXJ375wvzjzi/eo02aS6JzbTAR4rialOEuzvRvUN1VkByIinGF2lSuN/iUum
         8YsaXFkX+P27y61ItrXF0J5pBd9oAA0jEVav2upn1gjiXjw1ALC1OxFc0JZ7jocsAFC+
         FZgDe6Gt2yTfc321sg1bIV8cUu9VDW3xiqWwEN0E7VguiPsjPrNDLqPV+MLnniXYO4NO
         CRZ5yh2aS8cOMCOMitXL/GvEKSdFSJId8Hb5/kVgzQ8eb0a5VU7yhCCRvjdnN+paror2
         yLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757702157; x=1758306957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTwLCqYrxP4A65CpeLdDZfX/1/5VrrEeFcGj8O2B7PY=;
        b=Gfv0u34rFrN83p28Yf8tn0l4y5L/9ges23+MAKeeFxiFois2D1V8tMp2WV3imINjNx
         IvxJJG7LIdOX7uUFILq4ax19bJaQ4mEBIuQuGfRYe85I2sPEuiC9FCZ/aEWpds/ZtlJW
         RxlKyKrfjrKi/CC1NxlYS0iSboZY4rPYfh6g/JZgS44cySH9wVuN/4MIGn0/GG40ygjE
         MYhFsqfal2z+PBcK6kSdXJFvAduaC/SfDqVBGuziEigiRC8cyxVBeJK9zMeQT8DozXqO
         aAmJWHLAN2ISJ246qXFxaRxS9/Ay3ssSxHQ/jSxNdWWEZgHodwOFn7c3DWAhH7/uo2Ga
         falw==
X-Forwarded-Encrypted: i=1; AJvYcCWhRTA8N94/NtCmz4boxGk2S1gjzKApEKnq+uUCRWbeWRib5fejbFogPNGcrTZy51VzQKVxxKZl4d8D/Gx2U+G5@lists.infradead.org
X-Gm-Message-State: AOJu0YwT1o1lyMnhbARiLD1MULQ5OvRHmCiUxbNSJ06SDF13D7q02bg/
	44Sj3UOis6Ckt8Ae13yR0IE/w8LlUvx6zdfWGf+LKNtgmhZPheKRyuQLuIEc4gB6GTo=
X-Gm-Gg: ASbGncurc8lUVj+T70m+NoqFAquIRgr64OPS9evlKv4veg9Xgao/ZkEG/ghcFwHd3Ix
	Ij0xT/M4pWPC1mLUyDU3h3K0HTwJGaYCM+EjqAUSowZ9SUL4qHzFYtDz+gNKAs0XAFIm0MfiVTV
	GsH7xJzu+PgN7Mu2cievOcuzJaQeylj6Y5NSCf3WYNkapqMWUkN+Xek0++G8tzBK9vuSfn2uUIz
	zeltgv+7GlfJ3B2tXU56Pj6Kq6JpCbN06HjPtOcALxCfWi2450lOlnoz47lNcXeCk+nV4dezhjd
	I6HhsX+z+jiBQQ/KknN8t1yTxu1txs0tm5aHeiBml9BYpiD+6//nQiBcc21OdDfXiST3FZViGbs
	Cg5C95c+Jlz5PSlxKVvTk8fye6Lu9Hxjk2kgYIw5iZfNH3g==
X-Google-Smtp-Source: AGHT+IEFXfAwL8n5C3J9dCog5MqYjz/0z+tjRYy8VBux8QIcdwHNBxHHgPhwuMllRtUOig1ksCGmnw==
X-Received: by 2002:a05:6000:26c6:b0:3cf:3f1:acd8 with SMTP id ffacd0b85a97d-3e765a2367emr4237912f8f.28.1757702157424;
        Fri, 12 Sep 2025 11:35:57 -0700 (PDT)
Received: from [192.168.68.105] ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd0a7sm7293297f8f.39.2025.09.12.11.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 11:35:57 -0700 (PDT)
Message-ID: <0bc838d3-26ad-4f2f-8bb5-1c34748e1fbb@linaro.org>
Date: Fri, 12 Sep 2025 21:35:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH v3 00/16] Introduce kmemdump
To: David Hildenbrand <david@redhat.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, tglx@linutronix.de,
 andersson@kernel.org, pmladek@suse.com, rdunlap@infradead.org,
 corbet@lwn.net, mhocko@suse.com
Cc: tudor.ambarus@linaro.org, mukesh.ojha@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 jonechou@google.com, rostedt@goodmis.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
 <9c2e289c-0258-4e25-aaeb-a97be89ebd84@redhat.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <9c2e289c-0258-4e25-aaeb-a97be89ebd84@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_113559_370162_3605CD6E 
X-CRM114-Status: GOOD (  11.95  )
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



On 9/12/25 18:56, David Hildenbrand wrote:
>>
>> Changelog since the v2 of the RFC:
>> - V2 available here : https://lore.kernel.org/all/20250724135512.518487-1-eugen.hristev@linaro.org/
>> - Removed the .section as requested by David Hildenbrand.
>> - Moved all kmemdump registration(when possible) to vmcoreinfo.
>> - Because of this, some of the variables that I was registering had to be non-static
>> so I had to modify this as per David Hildenbrand suggestion.
>> - Fixed minor things in the Kinfo driver: one field was broken, fixed some
>> compiler warnings, fixed the copyright and remove some useless includes.
>> - Moved the whole kmemdump from drivers/debug into mm/ and Kconfigs into mm/Kconfig.debug
>> and it's now available in kernel hacking, as per Randy Dunlap review
>> - Reworked some of the Documentation as per review from Jon Corbet
> 
> IIUC, it's now only printk.c where we do kmemdump-related magic, right?
> 

Yes. The other places just have some changes such that I am able to
gather the data inside vmcoreinfo. (remove static, add some function to
get sizes)


