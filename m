Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6468BC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CncJ+F7A6Y9Hl4XUc7kG12VL4QgJfQ/zB+kPL7VLBrc=; b=SiyQ6sCI7QjgyFoLifs+nBlkW8
	lNlFoY66EaTMrUS0vaf0nHw4hjyhrY/k9V8Ieh+IUnC5KD8I3C0bkisUg+AaI/Tk5Eo80fSCexDPX
	UXHRXhj9lXnkRKGsLo/8KhifaTOBmBifJsdU5q5L/E4iXnXyJihtmI+VLEMascjmosv13jzSVeNI5
	Ll5Yl6G8CVwU3IbAou+UgHBC0kwsMI5sC6Q+SpKeyArKUf5fr5WoPUNJiZc6dgZzYRQF5eGT3AJlX
	AV9Czqyx3As2UkE1Mcns4sR6Kv0ygXFtudGxbDRLcv1FWr5cNve1fGweHVIfL6rH4JnOo5fS0BHGL
	UrRXqq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibNz-00000005pB1-2pgg;
	Wed, 21 Jan 2026 16:48:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibNu-00000005p9C-0xlU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769014125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CncJ+F7A6Y9Hl4XUc7kG12VL4QgJfQ/zB+kPL7VLBrc=;
	b=cPgf5a0EM5zs9Oz6FuEymkTZ9lTlJ6FOqHlRi8IsFCFtPJHKo0Rap6N32HfTLlquAB5Yiq
	ALpxasOjmlsNmN1+/o3Br5JKg15qvw2Y3BpTnnrhUTL97qCJ9IhGdvyJUrWvAwpS/0JOS8
	QmGhdKcsIk6yVgKe7Qj4mkrU0Yxairo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160--suqzrMoMk2ov2dpa4-DtA-1; Wed, 21 Jan 2026 11:48:43 -0500
X-MC-Unique: -suqzrMoMk2ov2dpa4-DtA-1
X-Mimecast-MFC-AGG-ID: -suqzrMoMk2ov2dpa4-DtA_1769014123
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946f51b8c8so2509066d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014123; x=1769618923;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CncJ+F7A6Y9Hl4XUc7kG12VL4QgJfQ/zB+kPL7VLBrc=;
        b=D4xNeOn0ex7XM9pjXYevU2S9I6pD+9EK8n+QcG4t/D0O81COVrts3Qg57CQHMxbT7q
         36tHavp60gq/4cXIOClGLHfyYeKeuGr90P1ToieM7VLpUJBAxvae//q1a/RmqVmFyjjT
         Vm7ahg6pB3Rr/MVPvrZV/ttZ9ojoP8DoXPyKZnYhR0p0P6egbu6JJkB9ARBrkaRH/sBp
         DDqpo+zE6p+JtxoBZTVTRpT+CJgdRFPBlhzX1bYAs9jafZcwoishGC0kZR5zIzXSqE3C
         d5U7b9JkbTzd4TrQ/8D5fnNdlIAkaIw/JLu6MEKypvsu4O1L2kUqEytqtjRQvhRf7fp1
         Av3w==
X-Forwarded-Encrypted: i=1; AJvYcCVm5CHF0NIJjD/BhaV1xfycYsf5Fd208yb5KzZ0hLs0o4qcvivOgX6ZVqfQPTyt4GQfSDvqnCLTNWfVWXi3Y8dU@lists.infradead.org
X-Gm-Message-State: AOJu0YwG50WhgJPzyoKrQfSUSXs1wiOKMzPxD7rV+tWbqbA+OVEvvK25
	byfsR4E9qR5/gOMgl2i53XngUmgWUt6XZKslfgzkKjXmL/hAzADaZCNyvq6m6Vi/GbUzjdt3cV6
	8IeTq3qKxBqybTlYRNbIFA/GciXpF8Ojl5/d6SBpxis1t/i7Nbai7PafvqzN+IudKNwjSOOGd38
	oi
X-Gm-Gg: AZuq6aKJwl7qaGb7X83Uoeit6VodLrV2M2fgWy35GF536fXYXwGkZC1fIDpUWCDw2jW
	yWP27JsqQmp3ORTM0WQgmX3dp54FGlCLbpJatY0Njr/OXVZPBjJvmlSybpKck5GIrkhemSEqDgi
	Ht8rilxBM/hm77N7bV2dxXSEU/jcsNva5hD4Hxhdo4ubMo2Qosy2f1vwEDwHKIbi6lK6+xZqL36
	7dp/zXESENbwpv9xniyIv3qlJBFk9pCiB+ED6VlUhdE0060U6ybSjRfojHZ71db6yPX1LLhBytW
	1ggPgGMF4xsn+ZUIkUuZ51QBgspa16uoRNFTeSZqQfXhOTDGBWn7RIRaAm25arRvX7/ocQpQM5l
	BZ5AVyc5rDYt141U12cCLA+xSvoQ9osA92rYfD6xNFFwz0bFuMh9PSwoA
X-Received: by 2002:a05:6214:c8b:b0:87c:2900:1f97 with SMTP id 6a1803df08f44-8942e531c13mr267613326d6.44.1769014123211;
        Wed, 21 Jan 2026 08:48:43 -0800 (PST)
X-Received: by 2002:a05:6214:c8b:b0:87c:2900:1f97 with SMTP id 6a1803df08f44-8942e531c13mr267612976d6.44.1769014122782;
        Wed, 21 Jan 2026 08:48:42 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6040casm134934466d6.21.2026.01.21.08.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:48:42 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <0bada1e3-f312-4b72-974c-4b061e577d66@redhat.com>
Date: Wed, 21 Jan 2026 11:48:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org> <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org> <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org> <87pl7gglya.ffs@tglx>
 <86tswrkrh4.wl-maz@kernel.org> <861pjjcqdi.wl-maz@kernel.org>
In-Reply-To: <861pjjcqdi.wl-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xBA9PZgp_fMNU5g_J-p3AZoYOiyCm0aaKlFRCOQ_0DQ_1769014123
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_084846_342881_17FF188F 
X-CRM114-Status: GOOD (  19.31  )
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

On 1/21/26 3:38 AM, Marc Zyngier wrote:
> On Mon, 12 Jan 2026 11:20:07 +0000,
> Marc Zyngier <maz@kernel.org> wrote:
>> On Sun, 11 Jan 2026 16:20:45 +0000,
>> Thomas Gleixner <tglx@kernel.org> wrote:
>>> On Sun, Jan 11 2026 at 10:38, Marc Zyngier wrote:
>>>> On Sun, 11 Jan 2026 09:39:07 +0000,
>>>> Thomas Gleixner <tglx@kernel.org> wrote:
>>>>> On Fri, Jan 09 2026 at 16:13, Marc Zyngier wrote:
>>>>>> On Thu, 08 Jan 2026 22:11:33 +0000,
>>>>>> Thomas Gleixner <tglx@kernel.org> wrote:
>>>>>>> At the point where a CPU is brought up, the topology should be known
>>>>>>> already, which means this can be allocated on the control CPU _before_
>>>>>>> the new CPU comes up, no?
>>>>>> No. Each CPU finds *itself* in the forest of redistributors, and from
>>>>>> there tries to find whether it has some shared resource with a CPU
>>>>>> that has booted before it. That's because firmware is absolutely awful
>>>>>> and can't present a consistent view of the system.
>>>>> Groan....
>>>>>
>>>>>> Anyway, I expect it could be solved by moving this part of the init to
>>>>>> an ONLINE HP callback.
>>>>> Which needs to be before CPUHP_AP_IRQ_AFFINITY_ONLINE, but even that
>>>>> might be to late because there are callbacks in the STARTING section,
>>>>> i.e. timer, perf, which might rely on interrupts being accessible.
>>>> Nah. This stuff is only for direct injection of vLPIs into guests, so
>>>> as long as this is done before we can schedule a vcpu on this physical
>>>> CPU, we're good. No physical interrupt is concerned with this code.
>>> That's fine then. vCPUs are considered "user-space" tasks and can't be
>>> scheduled before CPUHP_AP_ACTIVE sets the CPU active for the scheduler.
>> Waiman, can you please give the following hack a go on your box? The
>> machines I have are thankfully limited to a single ITS group, so I
>> can't directly reproduce your issue.
> Have you managed to try this hack? I may be able to spend some time
> addressing the issue in the next cycle if I have an indication that
> I'm on the right track.

I am sorry that I was busy working on other stuff. Will try out the hack 
today and report back ASAP.

Cheers,
Longman


