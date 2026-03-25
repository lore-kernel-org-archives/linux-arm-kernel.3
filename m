Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A719109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqPXz+Sa/AY6Vo8qNYqeoHSuweF/2Tg4HA9dNOaxg0o=; b=A5nb61EF5BTtG7ekrg9rPUl5GC
	+LXfpB+2JQXsiyL8kPDhAcmeRSpJa2LdfmgcvW01WNsB16g1x1sexFJGsDC497gLKMgOIWJp3+k7r
	jOp064It68T4ojkw9nOVDYL6BPU/GJ5ZfCbT5/LcP77kRrtIm3SSSySsQjnGAaachwL7K3Xf7B0bN
	gF+mU8iP2DlXbf6D8oOloQKR8LbC1UWTTPvgPPvkCuzGRpC1LMv/v5ntGfjYNPrRBhJfcCX0vEk80
	QBMElEoIcwhu/px5/g464OlJFnx574K9fNDdNG2HfiCo2MWakcFfmUBeZSJXOSqwyOF7gLunDfEWT
	MdJ35iWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QN8-00000003oJD-19Xi;
	Wed, 25 Mar 2026 15:42:18 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5QN5-00000003oIk-0Sd6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:42:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439b611274bso3636655f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 08:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774453332; x=1775058132; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqPXz+Sa/AY6Vo8qNYqeoHSuweF/2Tg4HA9dNOaxg0o=;
        b=cBEP4X5PjCRwCivaFMxkpC+TyZRVXly1kxTIvA7h/VHrYrrEtoqzLtsAVrc97gPx1x
         Iu3Kl6VRt7Mi4IiqhBlWJFigzE/Tin302rbThn6c75vIvpglQU3OuMWfTCX17UrTAB1m
         zx0S7Etaq/xoGquubn3aqIXHF6RgjoAqQsEH7SaKbX2mg7JWh0Vtv0LJIjSohFj6JlyD
         oN6H+VrvyUjZVuQyO+po9LneTEzKooIhEUxBlwpAUUDEQZg080FiG+5EnjrlL9yo/Lia
         HdfIh8wDZnzSE4sFK/gG30o/OywB21/gM2CHYglJ0PQAT26dBgBEolyqEWSVnYXIztdK
         2MFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774453332; x=1775058132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqPXz+Sa/AY6Vo8qNYqeoHSuweF/2Tg4HA9dNOaxg0o=;
        b=nx9HrsZbGQ9yO9rdox9taa5wNDQHWSIueZYT2g796fCBTh4d7wGDGdUcln5JeiUD2d
         DQW/GJMEetgYA5VEnLdPBJMD1NBbVMUVhcwJzMtpMhrGFw9aYsaC9tsTSseSO1a0iXap
         wUm6hMYvKDw/hVHoLRhnhOw+2wqVnsco6gLcD72C20ki9/vCpOXLQ5cf0hchptWI9SG0
         kL07Vabwl/s7yTjr02AQEbhdMSvSBPW08fjSeD4mLt4HroAEcp0e+N7SZypQ0NADK+z4
         mzG3kMRSVzMFryFOSl5WJRNRnoxIikOkSOvv308kvTdkClCIESYlRgexDq1/Hb4Sbb5y
         bUSA==
X-Forwarded-Encrypted: i=1; AJvYcCU9EaYULQpCiHttbytKKabp6sQNvL1QsbiLCRCbXZel0lWMy8myf7lJM127EtA3ja+Kf5ZicDRUfHpvqD7V+IGW@lists.infradead.org
X-Gm-Message-State: AOJu0YxquM1gMPzK8It0BffJHxAtMKDdosmRecmJjcj2p0pL7poznC6Z
	XkNdYE5jJEPFx4UXPKcABkMZN7wCoObKSl/FzwWjW4wxyU2VIPISH+uS
X-Gm-Gg: ATEYQzwlK8UAnnFT/T3JyFTU5JcsYgSqthdNQFB6Pv5l8htMqb//xZSRp1ElHT8gKoB
	OPw8o493CHiw6zp5WTr7Rg/WVmzYNljLHamyx6GQtCgDfqWsprf0wArVBtYTFnm7KjKbyinoG3Z
	xGmz9y5Lk8r06d0vJXDMIKpg70dNgFaokCyXIZqqTr1QQR36UkZQrfes+VmxbrJaEQT7B6pP7vy
	FKiNuJ+Pv5YNeMe99MQLuew+viuMMBYcodU0IMGAVfMjj3IB0vgIaDz1TuqrddEDYjbxW9gVSc8
	nDrLezCVLRH/Q5zBEmfF2WxvJCdGxuY3KvkP6r/jPgVzLixd0/b2htsXBdbSx+arpBJe5HKcPtT
	GDMbA2jtmllT9dGf4FZLHj4sqGHNK+ZdigzohI//zVYk3MTyICPIBVlb2ns+zxJklVnaCZY2SOG
	KrEUIVHOVREagD8oQz7iQXeeAfjKvmmMrOFRnKtV3aF+8o2yjbug7InBNvQo596Pxu
X-Received: by 2002:a05:6000:2912:b0:43b:8766:6005 with SMTP id ffacd0b85a97d-43b8899d143mr6042308f8f.20.1774453332131;
        Wed, 25 Mar 2026 08:42:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2b2sm609925f8f.18.2026.03.25.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:42:11 -0700 (PDT)
Date: Wed, 25 Mar 2026 15:42:10 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankur Arora <ankur.a.arora@oracle.com>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org, arnd@arndb.de,
 will@kernel.org, peterz@infradead.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 joao.m.martins@oracle.com, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
Subject: Re: [PATCH v10 00/12] barrier: Add
 smp_cond_load_{relaxed,acquire}_timeout()
Message-ID: <20260325154210.79a621df@pumpkin>
In-Reply-To: <acPo7l_pd5rnHpSX@arm.com>
References: <20260316013651.3225328-1-ankur.a.arora@oracle.com>
	<20260315184925.b6f93386e918ca79614843e3@linux-foundation.org>
	<874imftol4.fsf@oracle.com>
	<20260316233712.7cbfac27@pumpkin>
	<87ms07rlp9.fsf@oracle.com>
	<20260317091705.5a64fc56@pumpkin>
	<acPo7l_pd5rnHpSX@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_084215_172106_B2FB83C9 
X-CRM114-Status: GOOD (  25.77  )
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

On Wed, 25 Mar 2026 13:53:50 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Tue, Mar 17, 2026 at 09:17:05AM +0000, David Laight wrote:
> > On Mon, 16 Mar 2026 23:53:22 -0700
> > Ankur Arora <ankur.a.arora@oracle.com> wrote:  
> > > David Laight <david.laight.linux@gmail.com> writes:  
> > > > On arm64 I think you could use explicit sev and wfe - but that will wake all
> > > > 'sleeping' cpu; and you may not want the 'thundering herd'.    
> > > 
> > > Wouldn't we still have the same narrow window where the CPU disregards the IPI?  
> > 
> > You need a 'sevl' in the interrupt exit path.  
> 
> No need to, see the rule below in
> https://developer.arm.com/documentation/ddi0487/maa/2983-beijhbbd:
> 
> R_XRZRK
>   The Event Register for a PE is set by any of the following:
>   [...]
>   - An exception return.
> 

It is a shame the pages for the SEV and WFE instructions don't mention that.
And the copy I found doesn't have working hyperlinks to any other sections.
(Not even references to related instructions...)

You do need to at least comment that the "msr s0_3_c1_c0_0, %[ecycles]" is
actually WFET.
Is that using an absolute cycle count?
If so does it work if the time has already passed?
If it is absolute do you need to recalculate it every time around the loop?
__delay_cycles() contains guard(preempt_notrace()). I haven't looked what
that does but is it needed here since preemption is disabled?

Looking at the code I think the "sevl; wfe" pair should be higher up.
If they were before the evaluation of the condition then an IPI that set
need_resched() just after it was tested would cause a wakeup.
Clearly that won't help if the condition does anything that executes 'wfe'
and won't sleep if it sets the event - but I suspect they are unlikely.

I also wonder how long it takes the cpu to leave any low power state.
We definitely found that was an issue on some x86 cpu and had to both
disable the lowest low power state and completely rework some wakeup
code that really wanted a 'thundering herd' rather than the very gentle
'bring each cpu out of low power one at a time' that cv_broadcast()
gave it.

	David


