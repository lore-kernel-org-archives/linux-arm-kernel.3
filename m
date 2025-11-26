Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97695D10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdUO88eikIW9795WfMiemGo+56r2Q4h30VDAVu+3NnY=; b=hlT+YyEf6c7gT4WOwYHUeKIH5y
	iXwr0O2dbjVjXhTd0z64wQzf6NFJxakmu0aBS/XHcK8tWyRQQha3kwhIBYmtDkPdjrChRuKDAJVri
	qeQR1pXEXY737hzJG4a7YrZw2Gj16rPP3XSmjTQYdUhuiolgAbU8OHAkixgbQ/PKOqcvAfA8VkoX1
	wqJasXlTw3PEBUVZQQbLqIAff2F2iPgw1OtuTmPpmmGvIYfXxiwSoTkebkR1k9mevmrG1cqDbuEKd
	BcOW/Lj2a5qfau9ooGG6Hd24sRbNNggyz/wU3u9lZCwvIpumKk55y9qFLctgs0o/lMb1KVZRWsWYf
	ESTQCP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHWK-0000000FBcR-1YUl;
	Wed, 26 Nov 2025 15:33:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHWH-0000000FBc3-2KwT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:33:26 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47118259fd8so60265005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 07:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764171204; x=1764776004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cdUO88eikIW9795WfMiemGo+56r2Q4h30VDAVu+3NnY=;
        b=aIXnZtD22olcT47EpgmVo6gnaaB05UmBZwyAT/pcRGH8WUGDdsYf8nm1yNrJVyVFB4
         eKJydvCUfaTPSUqLcRXBW04U7ijqSpKqEBdx7JQCvit7oZ4S3bb6gLRk8DEy/Bc20mvb
         zgIhf0MtjiMcAEO5ZVl6wT7hzFBDSogDp+AudRbzgEjQKDXKHUIJ89RBfrrig2O1loRM
         ISBsMlRRYljF9m/+lcv+5UThtdy+a5HB+vSPiE16wEhaQV7LYOCYV6mzyhgjDMpbGT5i
         0l5HkbxhIVj/wtoCQuhCbPdY8lLThvsuBGM3qWIp2kHhQ193Dri+K92KVNm6CgDCeJWR
         6F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764171204; x=1764776004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cdUO88eikIW9795WfMiemGo+56r2Q4h30VDAVu+3NnY=;
        b=rgZH93LGHCrwZB/Jocabuno5iDhiuJDPNXlHJsFYALcknRTZxHkgvidMOR9fpN2FGT
         XDivcbfXzmklImRw5HkQ2HFZyQz+blO0l3MJqGN2OqyG6lkbK4b09oElxWl6Z+L3Bzg0
         iEjNpPCimHGw8f09caqnDxjFhLytZwsZ9NCWURY0lCWuE79w8kJlm1hvovXxMdsxLDSJ
         ERlKhQTj0r5Y/QgDi+BqL+KXc7+An3a1Wet2AwhxYy74Bn+jnfYJPog8ORPi74c/vENs
         plONGifoyIy19Eph1z8YTjJtY7//xvc4IY0Z7O2OxgTyrKGapmEcCzNrhPZ+xjJhaLeY
         otVw==
X-Forwarded-Encrypted: i=1; AJvYcCW6p/QBzSGLe2cxcOFrZq/6gwPyQpHRCjyl9cJrtdrQ9WhhLdkYjUfteea5F4Abb+rSOGZzkyyNx6JtQOn0sU/T@lists.infradead.org
X-Gm-Message-State: AOJu0YwIsKrff2qLdSz05pStGFMTI0EOqzX0gT7csH3KroEGO8J2YuJE
	x92zD6lZNbTW92GPjEhHhKMaP0lGpABXBTjqin6bImtFUUjQ1nQHTTP2P65+L0WanxE=
X-Gm-Gg: ASbGncsB+y/Ykx/5Wy6jeBbkZPYmstgj/yvUdlfyzB/W8+XSbjLwBKY5JD81RSSyqRO
	E/9lUmpjGEGcqjUTtQAFBidD28ADQ24Z/4kO/Fcb2XHx2hE2vFh2aHzeCMJ/fFkumM8I/883lPo
	nTQ8mPhwfWZaoCOzeCG7l1JUYEZQRHcPl4O8l2sbT/ZfPr3JnNqMhShvDHMXaPvoDsG+Fcu9fQG
	QxCrgb27tJfmu39hanGbqjmmqBVLy4l2Goyu6LWeWcCwy5nLlsLGMnHbiq8HTKS0/rwA/qKoafe
	klS/rnQjpjdjYmCcrTcobJuqQaO8+yL3VTnXE4wpnCwBcGzefBYAURH/nEZrF1YeHrsMmHt442u
	Thd+6Ex5yErNiMZoxZckNBupH5O9U+SAtUqAiZtpg7V37zwWRaYOeUG6pCrqn7n7U6DfLe84Gwv
	ec0Hj9be+eNr3TkWL/
X-Google-Smtp-Source: AGHT+IGF8bP97JkKg3xI/45hwPHmV/IZkaV8z/cEcedjhdjCGLpD1Us8WMmpJazVJOH1POXHY4my7Q==
X-Received: by 2002:a05:600c:1551:b0:477:7d94:5d0e with SMTP id 5b1f17b1804b1-47904b23c43mr66925455e9.27.1764171203692;
        Wed, 26 Nov 2025 07:33:23 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f2e432sm40399877f8f.9.2025.11.26.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 07:33:23 -0800 (PST)
Message-ID: <15d536f2-0829-4f3f-b111-b15b14236bd2@linaro.org>
Date: Wed, 26 Nov 2025 15:33:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: etm3x: Fix buffer overwrite in cntr_val_show()
To: Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, suzuki.poulose@arm.com,
 alexander.shishkin@linux.intel.com, pratikp@codeaurora.org,
 mathieu.poirier@linaro.org, gregkh@linuxfoundation.org,
 jserv@ccns.ncku.edu.tw, marscheng@google.com, ericchancf@google.com,
 milesjiang@google.com, nickpan@google.com, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251121002350.1166758-1-visitorckw@gmail.com>
 <20251126120914.GH724103@e132581.arm.com>
 <da2a3e18-80e0-4aca-bbc7-45c1353217d3@linaro.org>
 <20251126123147.GI724103@e132581.arm.com>
 <CAJ9a7VhD2p3qMGXNg6deYjE8myB5euHR4FcAFwgg0KWF2HO9JQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CAJ9a7VhD2p3qMGXNg6deYjE8myB5euHR4FcAFwgg0KWF2HO9JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_073325_630266_16A0659C 
X-CRM114-Status: GOOD (  22.12  )
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



On 26/11/2025 1:42 pm, Mike Leach wrote:
> Hi,
> 
> On Wed, 26 Nov 2025 at 12:31, Leo Yan <leo.yan@arm.com> wrote:
>>
>> On Wed, Nov 26, 2025 at 12:11:05PM +0000, James Clark wrote:
>>
>> [...]
>>
>>>> This fix can still be applied to older kernels, but seems to me that
>>>> now might be an appropriate time to consider removing the ETMv3 driver
>>>> from the mainline kernel?
>>>
>>> Yeah, if anyone is using it it would be on an old kernel surely?
>>
>> We can confirm this in another way: if I don't miss anything, over the
>> past several years (since 2017), we have not received any questions or
>> bug reports based on hands-on practice regarding ETMv3 on the Coresight
>> or perf mailing lists.
>>
>> Thanks,
>> Leo
> 
> The key to this is not the questions we are asked, but which platforms
> are still supported by the linux kernel.
> 
> The ETMv3 driver supports both ETMv3 and PTM trace (the programming
> model is the same, even if the trace decode is vastly different).
> 
> So as long as there are  platforms supported that use either of those,
> we need to keep the driver in.
> 
> Mike
> 

We're not running tests though, so if we find out it's fundamentally 
broken somehow it could be another justification to remove it, even if 
the kernel supports the devices. Do you have a board that you can test 
on Mike?

Maintenance hasn't been zero cost either, even build testing for arm32 
is annoying enough.


