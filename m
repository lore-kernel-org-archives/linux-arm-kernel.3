Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA11E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVpE42Nm/eglv4AuJiF24kJ0VOC6iIK2FSatfzsCK7c=; b=C/jbbGVLe6kDdBvGChtZZETf7k
	3KgVllHU0miRABodypXoitx9oB+8TjBFzVW1Yy1aKEL6BBlpxMAH27QxX05R2BWGXZQQvsVryPgYa
	fS1SedF9CCJAoaqzPUE29QFjy9loW2/qa1iYrHXGq2n0yyq2ys8QttwpSbf5BDvg5QM2YnpId2FR9
	X+M4cdh0OaicWC5zs/mV0J8tOsFGthZ9IBu2KfyZu98peXQjfrN1pjsgjVN3KcMFyI2o2sQtbAFJ/
	jnFOxql9JyWA9bqu1mA1nyfyGWSaGGE+Cet9Mt3IzGTFkRIKKQLJiHMSg8oC8j7G88cQQMK/RD3k0
	Afb7QKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuht-00000002vbY-1QpB;
	Sun, 28 Dec 2025 17:37:29 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuhq-00000002vb9-1Nwn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:37:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-432777da980so1242495f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766943444; x=1767548244; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVpE42Nm/eglv4AuJiF24kJ0VOC6iIK2FSatfzsCK7c=;
        b=x4oGb5RUQceINrwWx70m37TSCO0Gu2Yqgd2zqa6WuZHw90++f9+7/xRZOnOKtW1SNY
         a9rftOFisNry/LyVEH6RCEczyvtI/38APJSTqzIlqPpxN2xh/ybooID3fNaCvfhUfTir
         VwJLfcydnXtLSYgSw5Booi2RLR9vlXxNUXYofXYHpo7e8zRmMpu3v8DUDaF/Zf7eURAV
         P4wQXLBWvbybj34ZXCRmCaHDp47YT6uOJ7IUd9KfaVU+KraPuvcbBbb4jHeo1mhnCphS
         HfWedOCf7+JnL7sSbdCw/88znmR0xmq3TaWGP9PvTtE9RulfiiVrMY0p1xvheh1mUvF6
         wwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766943444; x=1767548244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wVpE42Nm/eglv4AuJiF24kJ0VOC6iIK2FSatfzsCK7c=;
        b=XigFM9IkjPaqD4Ejc/Gs4qG6iSEzJII6fZVDZJYpIJBJ2QbcxUepUqkZoDBzcB6FtV
         62XHF2HbgfA0eeaM1gR+4kIdeMbZnQoE/DHIUSLk/CCQhIl8xrkkDbfGiT7eQ6tFYTUB
         Jk7n6clgEw3jSwdbZqr5kugDCDkS6PNkB+7/mABnLB7ss36X3e4BmFvLlxc0xXWh07pt
         NeoLtHE+9bVxT9Nl9kFBQoQIao6YEJ0ld9XKF0UpdK1qlq1XYZNGb/rNYcKPLgNkZa2R
         7owWnlEzDhy9vL6Khsf4R5xidEwtEnm1H1YRckyleSPJqAG5h4rqZ/jnRMG46bt0KsLM
         hjNw==
X-Forwarded-Encrypted: i=1; AJvYcCXd0g6VDitI6Y7QP+tedfn29MbPTqjMzgigLC0hlqvXI0CUD2dNlUSTxSVRAwFQpTye+8f/8adrXnpp03yP2l+8@lists.infradead.org
X-Gm-Message-State: AOJu0YzJp20nE2tmSR+9rB6z4KuAfL4Xap0klavBBqK0eoESBnJgA8bH
	SOV7FzzZ7aJ8Dj/5UxAgnG5ddoqnEmBxlhzTnMKA4r0ybs+9ZkvW65epMZnk2OdRSrQ=
X-Gm-Gg: AY/fxX5NKaCb02e8vPWxX+ACkmaC/xCEK3o/soDjv+M2xR3SzXxy+307pqCuWcHc56Y
	P1v9ysbFnRAJlKF6bHffOYB9H8uMseIPlOw60T1wqVn5tuWqZ3JkfG+c1WKLOO+crC+G738pTll
	UEM5RVFQM9UFHV/zX9S886DTh+yIelS1EyMrMyqTWLQJqjhUg2O97TU2rh/x0dRgIucwbPqiTm9
	4NygTeg/au5bZVPdAKO9MSI7jPDRQr0Nr6vRIa1vwxsikzy6ZWgfJiywMhkmEvvwyQUuR6Ugvk1
	CqhGV9W0OHNGkDMGPL94SMMbqXwUc9hUn+FVOT4Vy/UBj4enpZG0LmUqFNpoHaAMynyS3rp3AnL
	JjI9urmfUbDC9mtHccZH7wK1p2VER+LcisV0VZDkCTjErzxmn8hxkidkDyI3jXOtHcDjHuCnK5P
	XdCC2jaI6Abrx6yLLRBD7BsT4DHsdO6aRghU+rcTUnyh93kWsne2503OqX+ByPCGrf/wp9FPKXo
	6uL
X-Google-Smtp-Source: AGHT+IHE0OkFcwTNOw8wEuwIrfhr0vrnj+ENYFnmwQiktK0vMMBBeGZzt5Tqu1ud08sB+J6NZr+fHw==
X-Received: by 2002:a05:6000:2c0e:b0:42b:3afa:5e1d with SMTP id ffacd0b85a97d-4324e4c9d89mr38116918f8f.20.1766943443689;
        Sun, 28 Dec 2025 09:37:23 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:37e6:ed62:3c8b:2621? ([2a05:6e02:1041:c10:37e6:ed62:3c8b:2621])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm56716550f8f.22.2025.12.28.09.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 09:37:23 -0800 (PST)
Message-ID: <ba28863a-a5fe-498f-92a0-d71c356e7189@linaro.org>
Date: Sun, 28 Dec 2025 18:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] counter: Add STM based counter
To: William Breathitt Gray <wbg@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, s32@nxp.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20251217075000.2592966-4-daniel.lezcano@linaro.org>
 <20251228065241.21144-1-wbg@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251228065241.21144-1-wbg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_093726_396848_E5FB88DD 
X-CRM114-Status: GOOD (  22.68  )
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


Hi William,

On 12/28/25 07:52, William Breathitt Gray wrote:
> On Wed, Dec 17, 2025 at 08:49:57AM +0100, Daniel Lezcano wrote:
>> The NXP S32G2 automotive platform integrates four Cortex-A53 cores and
>> three Cortex-M7 cores, along with a large number of timers and
>> counters. These hardware blocks can be used as clocksources or
>> clockevents, or as timestamp counters shared across the various
>> subsystems running alongside the Linux kernel, such as firmware
>> components. Their actual usage depends on the overall platform
>> software design.
>>
>> In a Linux-based system, the kernel controls the counter, which is a
>> read-only shared resource for the other subsystems. One of its primary
>> purposes is to act as a common timestamp source for messages or
>> traces, allowing correlation of events occurring in different
>> operating system contexts.
>>
>> These changes introduce a basic counter driver that can start, stop,
>> and reset the counter. It also handles overflow accounting and
>> configures the prescaler value.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> 
> Hi Daniel,
> 
> It sounds like you're trying to implement a clock for timestamping.

Well no, it is a counter which is used for timestamping. It is an 
automotive design.

> Although the Generic Counter interface is flexible enough to shoehorn a
> a clock into its representation, I don't believe it's the right
> abstraction for this particular device.
 >
> Perhaps reimplementing this
> driver under the Linux common clock framework would be a better approach
> to achieve what you want.

The common clock framework ? Sorry I may have misunderstood the CCF but 
how a counter exported and controlled by the userspace can be managed by 
the CCF. Can you elaborate ?

> Regardless, if you do pursue a Counter driver you'll need to follow the
> Generic Counter paradigm[^1] and define at least three core components:
> a Signal, a Synapse, and a Count. Resetting the Count is typically
> implemented by defining a struct counter_ops counter_write()
> callback[^2], while overflows are typically implemented by pushing
> COUNTER_EVENT_OVERFLOW Counter events[^3] that can be watched by
> userspace.

Yes, I think the Generic counter makes sense here for the goal to be 
achieved. Thanks for the pointers, I'll see how the counter fits with 
the paradigm.

   -- Daniel


> William Breathitt Gray
> 
> [^1] https://docs.kernel.org/driver-api/generic-counter.html#paradigm
> [^2] https://docs.kernel.org/driver-api/generic-counter.html#c.counter_ops
> [^3] https://docs.kernel.org/driver-api/generic-counter.html#counter-events


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

