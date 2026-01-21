Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADF3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=djpJyuMScmlBrHd91p9Wz9+Dh8n8NY06xyptDyrXdV4=; b=wJOGF28Q+V/3XfdgUoQ8IKK+h9
	7JGRLeDDJxeh1juDezb1wMyISmisAMC4G/w3w8sdGQOnopQpxaJrZ6y31W/Cg7Z0HHspcwNY8UUap
	A7kHQhsblDFJTfA0KN6YvcVq3qUkTehsnWg9LNbJLrFFTb0to+OXb7TblCBlcg146sR1oOXbia30+
	TzBazzN83rPuJuI6xzpElgqaSzChrNB0g9CFAwpnKQx3MtrzepdylmPCY/3L/SSjn7U1PWju8jxhJ
	eJ9rjWE9lk33m/XKs4toD1d3VWt/UCRnQC/vh0A6UBzvX4hWqBfcSyk794GbCZ3oamgrrMwVFZIfN
	BqaShUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vif18-000000062X3-0qcD;
	Wed, 21 Jan 2026 20:41:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vif15-000000062WE-300P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 20:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769028086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=djpJyuMScmlBrHd91p9Wz9+Dh8n8NY06xyptDyrXdV4=;
	b=gqdTkXQlgCH9keo/wHQl9NI/JLMScXjv2YMOIHdLuy/Qry48Ogoi+Kd3gM5bcUoMbyEIO4
	a4D5qnUoX/ywnNUp9pzarbHHGCNewu2+5lR+Wj9x+9OwtLf16DKHPs5pi10XRYSZp9degv
	3XkBu4fYJgAvSTREA3s8fYr832NgKg8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-qrrxNNqnOEyD-uk0_BD3QQ-1; Wed, 21 Jan 2026 15:41:25 -0500
X-MC-Unique: qrrxNNqnOEyD-uk0_BD3QQ-1
X-Mimecast-MFC-AGG-ID: qrrxNNqnOEyD-uk0_BD3QQ_1769028082
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8ba026720eeso79318185a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 12:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769028082; x=1769632882;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=djpJyuMScmlBrHd91p9Wz9+Dh8n8NY06xyptDyrXdV4=;
        b=PuwvF8rL34xb9xyuOllzIoPv0yp8SGGSRYDbSEUApqEWS0DOt/iD/Wi6xTEri+nDNS
         ZD7E/zfvEucvC1L0BF+LVL195fJG/kVIxB/+ecfPSbdmZwWiEv9zASxbFYgF4dma7Epl
         rfRIn9u5gUpQdmWn1E4wxeJ6TpkwZ9xwvUVRdcepzYYJZjye5ROExZUyR6QJNOD3q9oL
         AZYhIlBm722OO/43e58YvdPZVVRjlV1JUd4SNX/hcoBJYQwWQxbDPSDfBgGP6k2lj+Ay
         ou2wYSUYu745smCZL9kXhtPF+UZTlZrAROiEqr4+prry2erBZ8+fBOGFUbQpxImVEyQb
         fG+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyRE4mB5ODsw8vtVjh8B5WfiIpv4EfXelPY90mJDR0wUMxh0l36pvgz9xPN8gkiIfFfm+hgdMdVpG2H+QutMgX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv6u4thjUxvAAZWV+prF+UNv9UPJ7C9VB2g5eJgQjKJqJtj5d7
	EcFA0WvPc0mKh+51JPyxjcL1CSSuJdHKAsOG45Q95fybZFszkC0TeQaIHbmfizKTRiv40wJ7Dbo
	AmsONTm7zRPwxHxLs/yRpYkDpiKw4V0aeWQGY0svftM7D7NV6ixwZViPc1rXmitqmXf4zR/PPxt
	rj
X-Gm-Gg: AZuq6aKkIfIs7FcLBJEEgpob7mwJV7GRKYErDC89OxTuhgFig5Q0L/L06TaL9Lurhya
	nWqZXcX48cspipOR7NSrMrLgtQWmG8O0pU97VaFf/qVh+TsPws8wz28nKMJCCdd3cy4Low2j8C6
	ilMFiUBrxnGWE9iTpbFSNKe2gWNqZA1fw9Zbxxl2UmfzfKi5bQsWexpfmqqu/W2qJdP5HKF50SI
	Rq61HfKTQlRyXkCxetQU8UnoodRo5rmOY7yKNTWJU7ZtfLTOH6HX7s01xtMaCNcy3aC09Iz/CZF
	83Hv5XaU0Nu6xGGz3E0WRy1ZBkoC+qj0EW/HXiIGeNSLMsljAxsOW/DmJuyX7XT75NRjNXz66aC
	9kTpPUAje+33Gmil2foseAFVuZHTESSc5IwLOBoRI1TVSJ3Irp4X4niXe
X-Received: by 2002:a05:620a:4714:b0:8c6:a628:8608 with SMTP id af79cd13be357-8c6a66d1d82mr2524754785a.6.1769028081667;
        Wed, 21 Jan 2026 12:41:21 -0800 (PST)
X-Received: by 2002:a05:620a:4714:b0:8c6:a628:8608 with SMTP id af79cd13be357-8c6a66d1d82mr2524752485a.6.1769028081250;
        Wed, 21 Jan 2026 12:41:21 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6b22bb7cbsm1036983185a.39.2026.01.21.12.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 12:41:20 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <4dc6ab03-b2ad-4411-a49b-4513c5d592ea@redhat.com>
Date: Wed, 21 Jan 2026 15:41:19 -0500
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
X-Mimecast-MFC-PROC-ID: 1rh3xOsLUzf32fmPYKu8gaehi9Tq1uOXUwBt3BHX9ME_1769028082
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_124127_833115_53F85C40 
X-CRM114-Status: GOOD (  20.20  )
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

Yes, I have tried out your hack patch and the 2-socket Grace test system 
booted up without producing any bug report for a RT debug kernel. I will 
try out your official patch once it come out. So moving the memory 
allocation to a later part of the hotplug bringup pipeline where 
sleeping is allowed should work.

Cheers,
Longman


