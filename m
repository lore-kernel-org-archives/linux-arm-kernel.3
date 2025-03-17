Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614EAC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLQN2rYfbUfknOcr+3k7Zu0rC5DV/UYvyp9DPPr78Rw=; b=YhJCOGV5sjFNsu+JU4VKpDfDjl
	e6t55rm1wsg26Fs/7THi2VKcsjT/e9ywDVKulR4PQSSXnvwLs792DrWUuD/o6xyadTO6eIx+tI32h
	ys2jg694N+hzjLKWAWOMgnJL1rLg3hGxEQY+DmWYRWWK6GxKgfsIu/VksdUlhxjhzNjqPGEuwg7Yc
	pSgyvptDAbXzD0Vfm8VRgFwzYs4hZwNORq9M0FWIJ8i+ayTaAvoFJfw9eDPskaHPP+DdfLsVPCKll
	SanopM9nUmoZRs0rr85IjFyDTRkieXLfz4brceA4hnbTu9pFcvx8soJB9c6Dvy//YDwPDBmnNbiXk
	ZZGOWglw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCOD-0000000394W-3Mnh;
	Mon, 17 Mar 2025 15:28:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuCMX-000000038tb-1ve3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 15:26:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-390fdaf2897so4299563f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 08:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742225204; x=1742830004; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dLQN2rYfbUfknOcr+3k7Zu0rC5DV/UYvyp9DPPr78Rw=;
        b=IMLEQ8135dRA/7kGU/9ZrysgSqX4nLqz0oGaoVJ2exPQuxehCN4qDmaWq2ftNcVJaS
         d8geRdgfwi9Ujlj+768xuY5D5es6UE5/X4ZbZjZnFxElU9KMQIEOVP6pw3JNCKEQtVp5
         XdDr0kHLiEHINBzfMBfqM8Ly1lK/XklldXWXEhqpjTV5pQbZ2S93q8/59DqSLl/clWhR
         qz3i06m/43qCOg5O6RXCyDTWTEjq1mqLsXZST9UhdCgfDTMkf6a3vsTBkZGBHqUAR/FJ
         UGcnrux1Ji5/zN2mRoZZl/axeox23GaQgp811s4DoCjkV8BmI6TqSFuL0UFhN+AQyGtB
         dkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742225204; x=1742830004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dLQN2rYfbUfknOcr+3k7Zu0rC5DV/UYvyp9DPPr78Rw=;
        b=jhDKphnqU55a9enqJtcHIXMYLgiuY2EtBKcvn/lRN7zhvjMOYToW18jcYZsdcEX3sL
         PBOK2oEHWZmJPtGf98bTcY9gTLCS63g/+by+KAEAI/Lp4TLegpQiHmXyIO8qGt2pt5Rn
         +oARArFRaj7ej+BepUk2Qxx3vYMbPe7kbTZ9GUrgI7uTCmM0Z1pnec8kUeQnoDl4dReJ
         N69pJbdRdxhI0nsmj20pUKr17wRsJJ+dhOAMZl+3Wkn1Gt8YLgY8RjS7CqueyiV+yE1+
         lqp20yMTrDfXzhwFhGr6Z9iMu1vuQmfWwsTBeYe9qc2fMNZjeQf6E55rLNIhjJZ9ocA0
         //mw==
X-Forwarded-Encrypted: i=1; AJvYcCWARupCsfjZuiwoXZYvT16CuF9NfqYS93i4Ok8D1wBZVndPXtgZ2cHG/Dw/y2kZ5hGZkt67YEJX86SAX8sRMJqq@lists.infradead.org
X-Gm-Message-State: AOJu0YxdK6JXNFazET5TydkdZ6JAWLtpD1qoErgp5OyePZ2iTDKIRuHR
	+V8/8xXcaR7iybLyh/bxyBZxBnyc+bLHkaHGxCI2KXuC5aq+bqoiMGQ6/xzKxSQ=
X-Gm-Gg: ASbGncvBGu1eIvxGYttGUTyHL+07SP4SmowzNBWGkOQTqV0oXoJZ0OvKOnZLfEg7/+m
	OgER7GDsfW4wKQUf9HaeuUakeXBSbkggLZNwDqnTwxJuFw4AE2oD4AwBXBQgo/FeYDFRispimop
	mRWIZ4vL4wMtwyG6hdfRC4WxrBBeXEKjDeEYcSSGVlyG4v5h/IYLm3xtH2+uzVbSE0N+dmDzwlS
	N4BlzbHlkB7WCMnVNmG1Wcmx7ZeSKIN027sjb1OeJAv2JmWcSQJTHHsYWvIOFZWqvG0JjtYhnDy
	zSWXpmOS1zaoBdclIBdgyHSqju25iF30cEMVOqOvlRDRTugO5LceiSE3pUm4pO+3
X-Google-Smtp-Source: AGHT+IHmlXtTubn1PZxH2CkcujoV8qVJCpVv92ZgYDL+4RbLAnl09dxmfdM8qSfdWo4ezczy/3C0TQ==
X-Received: by 2002:a5d:64c9:0:b0:391:2c67:7999 with SMTP id ffacd0b85a97d-39720779405mr16263191f8f.48.1742225203800;
        Mon, 17 Mar 2025 08:26:43 -0700 (PDT)
Received: from [192.168.1.247] ([145.224.67.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c258bsm14961910f8f.24.2025.03.17.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 08:26:43 -0700 (PDT)
Message-ID: <9d06b27a-c2ce-41b8-9657-151000c0b244@linaro.org>
Date: Mon, 17 Mar 2025 15:26:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] coresight: Remove inlines from static function
 definitions
To: Leo Yan <leo.yan@arm.com>
Cc: lcherian@marvell.com, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250211103945.967495-1-james.clark@linaro.org>
 <20250211103945.967495-7-james.clark@linaro.org>
 <20250314095025.GW9682@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250314095025.GW9682@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_082645_515178_92F9C438 
X-CRM114-Status: GOOD (  22.29  )
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



On 14/03/2025 9:50 am, Leo Yan wrote:
> On Tue, Feb 11, 2025 at 10:39:42AM +0000, James Clark wrote:
>>
>> These are all static and in one compilation unit so the inline has no
>> effect on the binary.
> 
> I read the doc coding-style.rst, the section "15) The inline disease",
> my understanding is though the inline is not encouraged, I prefer we can
> follow up the rule:
> 
>    A reasonable rule of thumb is to not put inline at functions that have more
>    than 3 lines of code in them. An exception to this rule are the cases where
>    a parameter is known to be a compile time constant, and as a result of this
>    constantness you *know* the compiler will be able to optimize most of your
>    function away at compile time. For a good example of this later case, see
>    the kmalloc() inline function.
> 

Isn't this advice about whether to make an inline function in a header 
file or do definition + declaration? I only removed static ones local to 
.c files where 'inline' has no effect at all. We build with optimisation 
enabled so the compiler already auto inlines small functions and ignores 
the inline keyword for large re-used ones anyway.

>> Except if FTRACE is enabled, then some functions
>> which were already not inlined now get the nops added which allows them
>> to be traced.
> 
> I understand it is a side effect that we cannot use function tracer for
> inline functions.  This is not a big issue for me, as we still can use
> "perf probe" and trace_printk() for debugging.
> 
> Thanks,
> Leo
> 

I think it can be useful, I've used it a little bit. Might as well make 
it easier to use for someone if it exists.


