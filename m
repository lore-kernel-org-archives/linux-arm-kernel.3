Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31703C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjFlZ2/sUA2L86ngL9b3sMgbK1PseoDFjEohelsa5Jg=; b=yWVePZD+3v9sQ0JGr/iQy8aRaE
	dKrAHC/dcEpY644IZ2vMHJ7BiY8cjDIV4c9hK5dkoH1AzLL8/l15qyBBKq234cYVVvPq0llESGeuo
	momr8RBRIjE+tsVHzmQHiaXkuJMAyOPIgoEJvJp1kYFOrHVYH38Oi2Wz5qaps21T9PZg3ye/FWk1Q
	irJEKXETmK3nLDBxivjLqwbZ0VT1h+9KEgZV86anpizCy+6J6Ov4aKSMDGlpqdrMDWEZlkBGqW5XM
	cLGGy21q5WtZxoiFo1T0NxZuKF/cWq+HnnucTRh9mxabGT4DTXtTKFYK55Awa+eMMW3eeF36/N2b6
	C/VYAzDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvFv-0000000EE3Z-3c3K;
	Wed, 04 Jun 2025 21:02:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMvCL-0000000EDqE-3t98
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 20:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749070735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IjFlZ2/sUA2L86ngL9b3sMgbK1PseoDFjEohelsa5Jg=;
	b=hKaS5he9ZwmMwa2vzrC1tPtC5wBLDMACM7iumqhIFqYC/THZoykJwm0C0yUVZfx+9npUb/
	E64lOevoeo+fzzs81H491Db3mOCTG1OAAQr0LFwDwSe2QJMmy7qkbsfJV1DbG2kVofSOHr
	v797OkXmDXdXvmeD/F5GQdksGVrVLyY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-U8ATUlbdO6e59xvJTjrr8w-1; Wed, 04 Jun 2025 16:58:51 -0400
X-MC-Unique: U8ATUlbdO6e59xvJTjrr8w-1
X-Mimecast-MFC-AGG-ID: U8ATUlbdO6e59xvJTjrr8w_1749070731
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a503f28b09so139539f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 13:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749070730; x=1749675530;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IjFlZ2/sUA2L86ngL9b3sMgbK1PseoDFjEohelsa5Jg=;
        b=V1pLfvNXgniLOeORc7XRTwq4dDBva99+beh+/dVzh7TByy/mBRMnl3YMRRnYp0LTor
         UimcChqJz3ewX8A/AazwZV/3Vaz7X8kdfjSIkKzccgj+UkZqs63VZSvM8zuWlIp9uxLM
         XXs1+Vie4mEKzUh+Ts2sSCXj8LdHNXlswLLy8SU/ujeo0deu0Prg9KpJTVleJmN8sYBo
         /xM3zhrM2i+eFl/icP5bN61SQvzQPS5hiKJKKeyQ3ySmWh6JJdBrp2I+d9H4cW7lkLeJ
         FapEefRGRXjMDn2aCbH0x3V1wM2xO3rqY0ACV2EjJVQUzWH+HZ/jyXoQTcSx/ThI8hmM
         dNEg==
X-Forwarded-Encrypted: i=1; AJvYcCVdUqW+2PdM2rpj04bXKjU1maAcHx5H/O4aE/wr10nrnVfnbQ0qr2t9z8jBf3W1yjoZ7qYOkzIGCIdSrZ0pkI5y@lists.infradead.org
X-Gm-Message-State: AOJu0YzeDFr/648kRvqy/Cyi6rApZRxngAJpp4jIgp5K6GNKrNiaMWhj
	8Cj2yNI5jc3KKQwDgaASLdyLnMk4Kgag2cr28b6LLgP3WF+YyecArJbNjHkO7srznfWFWgYvwHk
	e1gT9MKTD4xozl6X3jbeZPOzcUd+/pXAXvTMnVKRJ8xYePE+tC4WbQkeS1tHG8OLNGTXnuIORSF
	60
X-Gm-Gg: ASbGncv5sciXrexeH8TcLHWI4SXjmTmVcUAbu1+jbuSfLhMg7BkxAbhoTSJtLLCsDL9
	N0oANMnECubv8MkNhb7oJOH8ujUd/BRoU8Wyo5kx3mZYL8Fkjh2gtWJVHQq4DFefyEbqSRDpw3H
	rBQcafnuzwV40+LV6p/VACv7WUvIGSCtGZtXjlkfXKmyoVDHc0G2IBZ2UmDXQNmez1MjSGnx/F5
	ysUJK/z0crKGxQ+kjwUsuu3v5KMeaQACxSEYeUKh8tASjMnDPCC0cTZGxJgq6Fubn4tSTfBzIYr
	I/dGjms53graqupudzSO8Rb9qS+qb/wEoKuDSFWvnVN74h9xxGUa5SZmqM0y
X-Received: by 2002:a05:6000:2890:b0:3a4:e603:3d2 with SMTP id ffacd0b85a97d-3a526a84717mr847208f8f.0.1749070730441;
        Wed, 04 Jun 2025 13:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa+Gezp8iiTLoB/KqZ3gWK809er5J18zOcbOHxYhrjEk3yJTf+o6JBeAedMNn9aSfhfWFJMQ==
X-Received: by 2002:a05:6000:2890:b0:3a4:e603:3d2 with SMTP id ffacd0b85a97d-3a526a84717mr847196f8f.0.1749070730088;
        Wed, 04 Jun 2025 13:58:50 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe754acsm23052362f8f.59.2025.06.04.13.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 13:58:49 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:58:48 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Zenghui Yu <yuzenghui@huawei.com>
cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Colton Lewis <coltonlewis@google.com>, 
    Ricardo Koller <ricarkol@google.com>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 0/3] KVM: arm64: selftests: arch_timer_edge_cases
 fixes
In-Reply-To: <adf8b877-7ca2-f60b-fb59-578c70d0e3c0@huawei.com>
Message-ID: <9b9f7099-4e81-9b74-a1ac-37cd4965675b@redhat.com>
References: <20250527142434.25209-1-sebott@redhat.com> <adf8b877-7ca2-f60b-fb59-578c70d0e3c0@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: elPsl1k_fbIbnOzYuOJas4QqXYVfEe1Hr1notuY93KQ_1749070731
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_135858_034832_937D916A 
X-CRM114-Status: GOOD (  22.77  )
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

Hi Zenghui,

On Tue, 3 Jun 2025, Zenghui Yu wrote:
> On 2025/5/27 22:24, Sebastian Ott wrote:
>> Some small fixes for arch_timer_edge_cases that I stumbled upon
>> while debugging failures for this selftest on ampere-one.
>>
>> Changes since v1: modified patch 3 based on suggestions from Marc.
>>
>> I've done some tests with this on various machines - seems to be all
>> good, however on ampere-one I now hit this in 10% of the runs:
>> ==== Test Assertion Failure ====
>>   arm64/arch_timer_edge_cases.c:481: timer_get_cntct(timer) >= DEF_CNT + (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
>>   pid=166657 tid=166657 errno=4 - Interrupted system call
>>      1  0x0000000000404db3: test_run at arch_timer_edge_cases.c:933
>>      2  0x0000000000401f9f: main at arch_timer_edge_cases.c:1062
>>      3  0x0000ffffaedd625b: ?? ??:0
>>      4  0x0000ffffaedd633b: ?? ??:0
>>      5  0x00000000004020af: _start at ??:?
>>   timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)
>>
>> This is not new, it was just hidden behind the other failure. I'll
>> try to figure out what this is about (seems to be independent of
>> the wait time)..
>
> Not sure if you have figured it out. I can easily reproduce it on my box
> and I *guess* it is that we have some random XVAL values when we enable
> the timer..

Yes, I think so, too.

> test_reprogramming_timer()
> {
> 	local_irq_disable();
> 	reset_timer_state(timer, DEF_CNT);

My first attempt was to also initialize cval here

>
> 	/* Program the timer to DEF_CNT + delta_1_ms. */
> 	set_tval_irq(timer, msec_to_cycles(delta_1_ms), CTL_ENABLE);
>
> 	[...]
> }
>
> set_tval_irq()
> {
> 	timer_set_ctl(timer, ctl);
>
> 	// There is a window that we enable the timer with *random* XVAL
> 	// values and we may get the unexpected interrupt.. And it's
> 	// unlikely that KVM can be aware of TVAL's change (and
> 	// re-evaluate the interrupt's pending state) before hitting the
> 	// GUEST_ASSERT().
>
> 	timer_set_tval(timer, tval_cycles);

Yes, I stumbled over this as well. I've always assumed that this order is
becauase of this from the architecture "If CNTV_CTL_EL0.ENABLE is 0, the 
value returned is UNKNOWN." However re-reading that part today I realized
that this only concerns register reads.

Maybe somone on cc knows why it's in that order?

I'm currently testing this with the above swapped and it's looking good,
so far.

> }
>
> I'm not familiar with the test so I'm not 100% sure that this is the
> root cause. But I hope this helps with your analysis ;-) .

It did, thanks!

Sebastian


