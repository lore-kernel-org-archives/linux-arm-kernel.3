Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5ADC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Fl9BeRxb0RlVEI0fxpQpvxpYW4ryPPVgf7Ef4kRGPU=; b=mC8KwDiz9a9QgsyPX2MpldeepO
	kiX7NvwZGwkoEgSgmef3f77foiYiAA1sL3k1JfYZVFkHu1GuoJ+kboeQgmUasGZN71IQX8BrmPCbt
	bPy7WoynjR1EICS+xiTA8/h+1F/oOFUYxAkvLMGG3413NYKAONt9aG9sBXiP6yztPqxRIbXMusxFK
	b5xtn3iGS3yge2CZBOxW48gWtz/+89uqfNud1JLiJlqPRDtKYPTSlJRCNEOF6YWFiXZ8Xhd8trOrC
	BmnWlz7L1mAqIS//ltPQBxb7l/wiOqw6EEVyry1x40e2jlCK7rGkT9wLONd+zEXAOUNv1Slo6v4an
	n5mRggKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibDV-00000005oE7-3Gd5;
	Wed, 21 Jan 2026 16:38:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vibDR-00000005oDM-0lh8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769013474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Fl9BeRxb0RlVEI0fxpQpvxpYW4ryPPVgf7Ef4kRGPU=;
	b=FkcWFzPowlviHyw23aTyP1bdNaY3Dkvpkyra/0VENQW/WomLJF+GXmRLzKuQUDHCR8NCaF
	Pn/S3Cb8Fpbu2AQIOVq6DOY0soqo+uvawxHv3sivzpWZ2pKkkn9YnWRFi2zgko3gusNkid
	G86x0+ThGbMn9Cn6W27k5iUl+WEg8C8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-9YSUm1GwO7y6nEt-Vy1IEA-1; Wed, 21 Jan 2026 11:37:52 -0500
X-MC-Unique: 9YSUm1GwO7y6nEt-Vy1IEA-1
X-Mimecast-MFC-AGG-ID: 9YSUm1GwO7y6nEt-Vy1IEA_1769013472
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8905883e793so1611836d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 08:37:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013472; x=1769618272;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Fl9BeRxb0RlVEI0fxpQpvxpYW4ryPPVgf7Ef4kRGPU=;
        b=iSrrloZQF4/gdikwiPe5g1saxAT4VAUZ9CGD/1q/HqbUeU8RMyMegOsqheZwSTBErc
         NxZ80iLJ++EVSTpIH0nTNoIm5tdHTN38bILMoM4VgUW4eCEmS7Zih/8G6JCm7aOjdyre
         6ygrF+acWoIrBKVGTkZeLN1ut2nf/1NczMLFgGdcZlFn1H4IcGJLZi2Vf90QRb0KiEBd
         P2khGxXcjg9QWx6WYomHe2huN/Fiqzh2UaG+SehvyacnNmeD8tvy9dxSlwH5a4mGekJP
         kOjO6yuhI6gRnKh79ZQudPO5AufnV/x1pU+GeQ04kN5jv2YATKYFq0GvJeYu8rurs3fI
         QmVw==
X-Forwarded-Encrypted: i=1; AJvYcCV+NXcg8e/kXqKlSe44VBZAmiTVH9nZbN/BbVYsM6B8a6ExtRqNXm8MOJZ2HRfU7q2eCEXENIuUd0M/H3tI2Ld2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5yTVkFlsAP+54n+qFcBbulr70c16pHiQuPY0noqUUuL4o+5bc
	5evpDduPcSVN5qfkTUk6HelUqyJCtsPLY50pVfzKaNx+FIFtMHKgoYObVULSRm5Q8n14CIg215K
	A1zbm0wtvnuUQW24lRXnvoLrZ7VoJQlqrdgqGCl0K42x2cm8k48gzm7vfuWh0m/EZih+1y7BkaF
	ys
X-Gm-Gg: AZuq6aJ8rTEzlGRXGcd2TGW00gfBTpSOp9erUmgQd20ubaSJ7AK/XhdibZBnsc80kJc
	6Du+oOy22IBc9jMEiKOY8zuq7/ylBHIgRQ3gkZU06jtNhfBPeIxXfCXClJk0uVQqFJIDW8Mv7kE
	Y7VaDmpgIl45rfb/qpPM/Zya3nfMHU0Hz9pugwczMLpRjsyfP2+LtiUvFTJqJ3LRWgca2EUTE+x
	dpMHikVaPMMpnUKAPb95dbVWz5auf4rJeAN6Dx7Dy/ntMKU2hoBPgQRqjf6N6rfmy0S3jF1iHA8
	pfh+9fSWCdokOEPDc51toGxGcZq4wRToLGIg4QJS/uKYy4YMBSlxT8wSNPCMOdWQHAXVZ96S80Y
	15sKvYhG6g/eUYNaCrGeyXXthk9hdhwlfhUV45Tsq4USFs2+1SnXJXBCI
X-Received: by 2002:a05:6214:2aa8:b0:888:23a9:7b01 with SMTP id 6a1803df08f44-8942ddadaa4mr271203926d6.42.1769013472294;
        Wed, 21 Jan 2026 08:37:52 -0800 (PST)
X-Received: by 2002:a05:6214:2aa8:b0:888:23a9:7b01 with SMTP id 6a1803df08f44-8942ddadaa4mr271203576d6.42.1769013471819;
        Wed, 21 Jan 2026 08:37:51 -0800 (PST)
Received: from ?IPV6:2601:188:c102:b180:1f8b:71d0:77b1:1f6e? ([2601:188:c102:b180:1f8b:71d0:77b1:1f6e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e4a3csm133070566d6.5.2026.01.21.08.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:37:51 -0800 (PST)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <f8ba00be-d98c-4962-a32a-98ac0ddef9b2@redhat.com>
Date: Wed, 21 Jan 2026 11:37:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/gic-v3-its: Don't acquire rt_spin_lock in
 allocate_vpe_l1_table()
To: Vlastimil Babka <vbabka@suse.cz>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Waiman Long <llong@redhat.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>
References: <20260107215353.75612-1-longman@redhat.com>
 <864iowmrx6.wl-maz@kernel.org> <87ms2nsqju.ffs@tglx>
 <86wm1qlq7l.wl-maz@kernel.org> <87ecnwij44.ffs@tglx>
 <86v7h8l9ht.wl-maz@kernel.org>
 <40cec799-f363-4642-969b-24f5a2d56dfb@redhat.com> <87cy3eg94y.ffs@tglx>
 <5f4bfd8b-8699-4bef-bf49-f29965e95ca4@redhat.com>
 <20260113115515.98Mc29Nm@linutronix.de>
 <0c33bdee-6de8-4d9f-92ca-4f72c1b6fb9f@suse.cz>
In-Reply-To: <0c33bdee-6de8-4d9f-92ca-4f72c1b6fb9f@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jSUFjmJTc0O8Pyi0RdVAn6mIZOjk_WhQhz7EHbVVybk_1769013472
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_083757_339909_D9315A15 
X-CRM114-Status: GOOD (  14.66  )
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

On 1/14/26 12:59 PM, Vlastimil Babka wrote:
> On 1/13/26 12:55, Sebastian Andrzej Siewior wrote:
>> On 2026-01-12 12:14:30 [-0500], Waiman Long wrote:
>>> On 1/12/26 10:09 AM, Thomas Gleixner wrote:
>>>> They might be acquired though. Only alloc_pages_nolock() guarantees that
>>>> no lock is taken IIRC.
>>> Thanks for the suggestion. I will look into using that for page allocation.
>>> I had actually attempt to use kmalloc_nolock() to replace kzalloc()
>>> initially. Even though it removed the call to rmqueue(), but there were
>>> other spinlocks in the slub code that were still being acquired like the
>>> local_lock() or the spinlock in the get_random() code. So I gave up using
> Hmm if get_random() code takes a spinlock, we have an unsolved
> incompatibility with kmalloc_nolock() and CONFIG_SLAB_FREELIST_RANDOM.
>
>>> that. Anyway, kmalloc_nolock() doesn't seem to be fully working yet.
>> with kmalloc_nolock() you have to be able to deal with a NULL pointer.
> Yes. So even after we fix the current problems with incompatible context, I
> think kmalloc_nolock() would still be a bad fit for hw bringup code that
> should not really fail. Because the possibility of failure will always
> exist. The BPF use case that motivated it is quite different.

Yes, it is an issue too that kmalloc_nolock() may fail. If that happens, 
we don't have another good alternative.

Cheers,
Longman


