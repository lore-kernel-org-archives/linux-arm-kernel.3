Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE700C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55tmFZvlDhfQ4udOwAM8HxDBVvHY3WF0+nddp767ALw=; b=My0MDCvo77gIlVl474I7K7WwDT
	hqsGN1R07V5x+QdVS/Msdifq5GUXzWUcewb+g4QlhjqAJsw44o23ZuiG0XgrntFLzISOxue2p0dA+
	HN40qLrP6Bx4OC8yZzsTtmQdfLVD0mpeFPFPOzsPwSjIxZnJWw8gRBv8sPSqKaspnB61Zf2pc1Jdz
	PoAF3dKyi+VJBGoDvWaNx2X5Ci6Et5DKXij+9Z5SmOu6rKkNNuO9rIvILj+vJjXP4QcZhIWYViZJ2
	VoPjztPoW60HZ81tzT80T9YhmdErVSoqdySh6gFD7rUgv+3XFdtqULtVsq8u4wgShTlInVYdRyyx7
	FRuVaP5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0G2-00000004SL3-2kC4;
	Mon, 17 Feb 2025 12:29:54 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzTf-00000004L8s-2HXj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:39:56 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so4816924a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 03:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739792394; x=1740397194; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=55tmFZvlDhfQ4udOwAM8HxDBVvHY3WF0+nddp767ALw=;
        b=uPr9RR2LSX1TXgIppmOthjvcb5vCyEgdkixhDxW2/cZZfS4zMVW5ODjTLbFzv73KeN
         wFtDEyKHPA3pOFVjI63V4Lg/l75ipjCrtBIiQwgAe0NUxyinqEd/6E53uAg/Tk3Et8JJ
         Kt+pS3+ZUhUDFUl9yEYyRHQkmrLSkzhbp0Fhm739iHCj+2gAJAI3SbmxoVKPIEj2nXWL
         R2tTaLhH3anhh1l5Ev6Gss2jh2k9ifUU6MnjvBabnDD0muEmXC2VRt1/EgzKQQjB5YY6
         071L2mtdmIosiFX42Qke/+u/T/YSYkICQ04HUW2+Lfc3EsV3mAS1eShAn0vO9QIsyA1N
         XL3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739792394; x=1740397194;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55tmFZvlDhfQ4udOwAM8HxDBVvHY3WF0+nddp767ALw=;
        b=Sb7gRSNOAsjzg8FQN/Jcl45s/DYV3O6330Xn0TmYNSkdFkoPPoAsVp4zt6sdELRIUh
         ryxjvUBR+0XHRFecy2C8a1kPd6ntaVtKpifG89M06r3iiyuAyCj0PCOyrr1lN0VUSTzk
         eluSmb43YWZAU7/RheVYd8U0RuGvTK+ro6TwkSnMoSugBAvHJB0AIS0xB2mAsRt1Hepa
         UxQ1EQPzUkiKrtxrH28CLCsqUnbvaFP9M10Gp/5G05xYl77w8a3a0+np9BYaHjWg3Ubt
         gLbzr6sosZxy0SpDCQCbTEAvmWv7wLvGEyaK8j6ygBdv6EJB23RaHewYDY/jnACIIefI
         B3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXz1hjxVgG9jZHy8kwyx0euMcqoRAcDd/qbdEAND102Ab/q0y6qWHOy8XzXeyyiHYOQfL9ckba8toW+iE3YKzKT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr2argzfvnTn17cug9AxOZ5pPQoAbgdz0h3KDHds7PUTD3rBMP
	HRQEhQIMSVHTGVeNLOrHCoC61JsKM3DfLCStwkMt3Z/yhg6r6F11w3pgjPcEr40=
X-Gm-Gg: ASbGncvbSYTYDYgAlRYT139v1MU+mG8pk14jY9bb6/mZKB+Gw/63SvFz4aYVKXIs1Jg
	R+Y4jDGwjHTl+Er7hJ+0ujxI6BcIwUR1jCLTr+wP3QlqO4klS3qZSPgyVkzAMUUW/xwMlDqZdxp
	O+zKMfRK8a+TEFLT9qFBTsQpeWIybwwR6hfajDWWXia6aWDQjl+DF6Z4DFqiFLy/WQQqZdujuEa
	q53pdPXY+PiR9K/2lkwhVBMM4ogVlll2nTXoXX4yvO4iNYG7WYecFdp7eQhaM6VOUtDLrvaHc5M
	FwzNd/OGc6ivkV7+h1fXhlI=
X-Google-Smtp-Source: AGHT+IGo+bcNzZNZe9/7oqui44xN8WcwrHBLDxTE5jOoOEjQDNDVEBhQceJwnI6a/LC5g+Y2YvDAyg==
X-Received: by 2002:a05:6402:26d1:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5e036063de6mr22010855a12.17.1739792388094;
        Mon, 17 Feb 2025 03:39:48 -0800 (PST)
Received: from [192.168.0.24] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53397f47sm866703466b.127.2025.02.17.03.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 03:39:41 -0800 (PST)
Message-ID: <885a9312-484a-4b60-bec0-5adf8f1e4a0e@linaro.org>
Date: Mon, 17 Feb 2025 13:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
To: Johannes Berg <johannes@sipsolutions.net>, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com,
 linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
 <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
 <b304d582-9328-4e1b-9e34-5604125b0c06@linaro.org>
 <59333d4aa8a3bb3222967d70d10d9288cece444c.camel@sipsolutions.net>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <59333d4aa8a3bb3222967d70d10d9288cece444c.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_033955_634074_40EE3978 
X-CRM114-Status: GOOD (  20.67  )
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



On 2/17/25 13:19, Johannes Berg wrote:
> On Mon, 2025-02-17 at 12:44 +0200, Eugen Hristev wrote:
>>
>> At this moment going through devcoredump is not something that impacts
>> the idea of the implementation.
> 
> Yeah. I don't think it _should_ go through it at all.
> 
>> The whole reason of going through it (because things work without it as
>> well), is to see whether this has any kind of impact or not, and if
>> there is any kind of fit/reason of going through it.
> 
> So it's just a trial balloon?

Yes, that's why it's marked as an RFC.
> 
>> Devcoredump is involved because the whole core registration is similar
>> to a core area that devcoredump could use.
> 
> Yeah but ... 
> 
>> For example, would it be interesting to have a handler going through all
>> devices, and have the dump areas already registered ?
>> Meaning, when there is a request to generate a core dump, one could
>> directly dump this area instead of calling back the driver, and provide
>> that to the userspace instead of the driver calling the dev_coredumpv by
>> its own.
> 
> I'll be blunt ... so you _really_ haven't understood devcoredump then?
> 
> It's really not doing this. It's not meant to do this... It's intended
> to dump data from inside the device when the device crashes.
> 
> Please remove devcoredump involvement from this series.

Thank you for your feedback.

> 
> johannes


