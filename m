Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302EEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 15:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgmFLvsdJ6iFhFtAs9sBOHn9N6rEmelJpZm6BimX7XE=; b=HX58l6b/Q2m9wCK668wWojI1+R
	Ohb7WuVZkhUqV7Ni0G4aniaTwnS6RghBGGKIjmEqHbqenIrsHkE6z7Hzt7mwnS0p6Rlo6oa/szt4e
	nxUx1BpVzDd1nphpsInAurf903z6DIBHsexZQeLWEpajJnZ+eASJs3DHllJdBRe56+uk8FvaCC6aZ
	xQClW7bhCdWpeeUrennwVxcB38gxH4RNpFeBcWW58EgvPfSDz2EOncto55u5X5XXTuUZwwpDNpnrZ
	/PTVvQFjIn0a/HkN5c9xMCcMKi7BzjS2bkp+6N8u4PvQYQtA1VveWMbLD9dLGVq0oIO/LSmoD3nR8
	iO3nl21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6Og-0000000GtLS-3GEO;
	Fri, 13 Jun 2025 15:32:50 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5TD-0000000GhrN-0iu5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 14:33:28 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4531e146a24so14498805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749825205; x=1750430005; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zgmFLvsdJ6iFhFtAs9sBOHn9N6rEmelJpZm6BimX7XE=;
        b=laWKO2Wl5QgE2gCYQS/jUXeAz82GPgDM3j0cj/KpimctZrDZ7uqAmjKMsfZlUFIDxb
         kk1Im+aWQjYFCH4WE72HKlfn7xCHeVTFnEGgi5Wbz59UWlYF2RM0sbdCVyNVhRFUekN1
         v3CmoU3cEHLb2PQHJeWG1aQGMYYrAJSA6V9ifqFWm35wXSoJgi/sWfYPWH9IDR+O1Y8V
         I4hxNU7hH7ohocE/3BQglaIGe4EJPnEsuvueAoMXQgJNkWd19uV+pTwE5IBJWgejjPnP
         L6nvmKN+cAKlLTKmT1t+hW/gQi0u0s9NVo+XnWAQCDq8MqVeAe44JFKX1fBYHfKiMM5R
         IfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749825205; x=1750430005;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zgmFLvsdJ6iFhFtAs9sBOHn9N6rEmelJpZm6BimX7XE=;
        b=mo9pUofGXMclo6rYBOzwFEnntRBYfucWqw47/JYdAcAzx6nT9ZzvnqM3xvFoGQevga
         WHJVLb+c0UM7SRmxHY5e77XwPRk9mXTV/2TIa5MYATszdxGK1tkiObzjxsd3c7Sgw/Ce
         DHKoX1nlZxoBUn2unnZhUJyZeOixh8kDrmdG62UhuBZ3idrVva3RlGt+KVj+jMA1c96r
         y5pw7sbJaPrtvNNBKIk1H8G3NZNx65OOU0v2Jzbsntu/4Ap2A9aMi0k41wwtwXKjw4oU
         zwwdz+MgHk1lYZHvTfFNVWnaOn8B6iO1+GsvUOVN/aZ1OLFheJ1qPyMt6ui/la2CFRso
         OMYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+qeCTLFrvlqHmgBZQZP3Dvd71urQ2cTcTSA/PqODaaiscDIb9lUjlGX571cNv6l47vUk+Pip1q6QI5u5lMxoQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzO0KStuqaWJdIMoSv1zLfXp9uE49IcMMaZLDKkhiuKjo37D7uM
	u2EEXoYoeZLJC0dsimjpGkQiIZO5aRqAEsMgF+gbrR55PoTkFARbAgQRN2/ipUbcqNA=
X-Gm-Gg: ASbGncvetCo6FI3nJtZtgjjnI6YMFWLxrs7++ygKkadTAXcXIVxOm016mrcOMBbAJZZ
	HHUah9bs7Rbn5XHOdyk3Eheg+ezV0jptZ7vJyTlqC0U69mFykNUZcp4D3we+n/8kho4w2LKpGzA
	ThbnYN2pNN5+uxoNsDM/daTEpeXG49rESeRXeXIPNMRVukwBuNo7Ad27V3oR5w9MDiW9bAtqRBn
	+zs8R9BE5XxzVILju/rg+wAsenb3pQdTkxNBAMPC8PagLjmzUPagC+NuiEMEDcVCLXfVLeGjLqn
	cC/phI6S9Lx5B7LgzYFHg6D1FLMngzmvl5xqEq8XpeULZyOwTTo+8+qZgShdvnmrhca2xunkaHd
	3lKiMhxI6KO7DDWdX8j032tJPj8EDU1OUJF4I3Uc=
X-Google-Smtp-Source: AGHT+IHaqiDiPxrZkJtlgp01dU1UfqfhmbQn8nOwH2pzxfHuCnqJZ61g8lNlq6CgU9ZCy4LVF+0kjQ==
X-Received: by 2002:a05:600c:4f56:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-45334b153aamr39047735e9.13.1749825204341;
        Fri, 13 Jun 2025 07:33:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb1d:1aa:e900:b5a7:96eb:d1b6:fda? ([2a01:cb1d:1aa:e900:b5a7:96eb:d1b6:fda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b798d3sm2516759f8f.100.2025.06.13.07.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:33:24 -0700 (PDT)
Message-ID: <f916cf7f-6d0d-4d31-8e4b-24fc7da13f4d@linaro.org>
Date: Fri, 13 Jun 2025 17:33:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 09/14] genirq: add irq_kmemdump_register
From: Eugen Hristev <eugen.hristev@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, mingo@redhat.com,
 rostedt@goodmis.org, john.ogness@linutronix.de, senozhatsky@chromium.org,
 pmladek@suse.com, peterz@infradead.org, mojha@qti.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, vincent.guittot@linaro.org,
 konradybcio@kernel.org, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
 andersson@kernel.org
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
 <20250422113156.575971-10-eugen.hristev@linaro.org> <87h61wn2qq.ffs@tglx>
 <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Content-Language: en-US
In-Reply-To: <1331aa82-fee9-4788-abd9-ef741d00909e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_073327_231055_91006FD5 
X-CRM114-Status: GOOD (  19.03  )
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



On 5/7/25 13:27, Eugen Hristev wrote:
> 
> 
> On 5/7/25 13:18, Thomas Gleixner wrote:
>>
>> $Subject: ... See
>>
>> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-submission-notes
>>
>> On Tue, Apr 22 2025 at 14:31, Eugen Hristev wrote:
>>> Add function to register irq info into kmemdump.
>>
>> What is irq info? Please explain explicitly which information is exposed
>> and why.
>>
>>>  
>>> +void irq_kmemdump_register(void)
>>> +{
>>> +	kmemdump_register("irq", (void *)&nr_irqs, sizeof(nr_irqs));
>>> +}
>>> +EXPORT_SYMBOL_GPL(irq_kmemdump_register);
>>
>> Are you going to slap a gazillion of those register a single variable
>> functions all over the place?
>>
>> That's a really horrible idea.
>>
>> The obvious way to deal with that is to annotate the variable:
>>
>> static unsigned int nr_irqs = NR_IRQS;
>> KMEMDUMP_VAR(nr_irqs);
>>
>> Let KMEMDUMP_VAR() store the size and the address of 'nr_irqs' in a
>> kmemdump specific section and then kmemdump can just walk that section
>> and dump stuff. No magic register functions and no extra storage
>> management for static/global variables.
>>
>> No?
> 
> Thank you very much for your review ! I will try it out.

I have tried this way and it's much cleaner ! thanks for the suggestion.

The thing that I am trying to figure out now is how to do something
similar for a dynamically allocated memory, e.g.
void *p = kmalloc(...);
and then I can annotate `p` itself, it's address and size, but what I
would also want to so dump the whole memory region pointed out by p. and
that area address and size cannot be figured out at compile time hence I
can't instantiate a struct inside the dedicated section for it.
Any suggestion on how to make that better ? Or just keep the function
call to register the area into kmemdump ?

Thanks again,
Eugen
> 
> Eugen
>>
>> Thanks,
>>
>>         tglx
> 


