Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F07C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 22:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=EZXBcUYZbpmp6x6DzHluAVJ44/IpxA3vzPrSsIqdjvc=; b=LGjWTMLxnDpIcR
	8XAYpMSk1jaQizoMHE3vOa7ZlK0Zi/4Hh0nMEuuR1brTcOsRyiL1SgKiyyLdjfMN7WZvL/S3oRLp+
	033TSoLT7L2djj0+uT5AwYXIOQu+D5O9lfSiDKWHbTTpxk8iM+IWfpWoxMsmDh0/c3WUbpoI0Qozv
	qIUuKc+C+PElmywfuKYmrdRh2hd5TUlCWi7Cm1zLCPVl3XmiMNlWrvf8q0Csvw4BbIw8hiX5XWX5D
	ZjYOlZzBVJJojcJDpKp7v8YZ4emT/C1LgvS7iZ+yCF3/JN1IinK3Zw9YY1NsuL9A2L6duEkEilPUa
	L0HUELz+q3kKdY8hcmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZH3t-00000006pK0-06lu;
	Tue, 08 Jul 2025 22:45:17 +0000
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZGxR-00000006oba-0q8Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:38:38 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-3df2d0b7c7eso51166585ab.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 15:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752014316; x=1752619116; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EZXBcUYZbpmp6x6DzHluAVJ44/IpxA3vzPrSsIqdjvc=;
        b=Km6IRhJ6rvIkdRT+WHZrUdmsR2n1ponosat1bubVNTRBpQtPIcUzC4qoqtKx/JZw2L
         /nVAlniWE5Qfg0Ip9FS0cTro3LKIJ5b2qHwIvwM5TUrXq1/0Vhif4mt26is+/mFHUXto
         kfhPc2L/221sQFB8qQsnSBnRfXtOnWn6DwG8lqgdEVnycFFBTk2Bu+pl2+UzYqroKwRL
         T56I7FMylUoQix/W3n5sb+Dx7btWcYWYKQF+SMwPEXMfSeQ7I7wQqZnWaSX49BSqyjJ3
         AzgvZwemB4FtmHzJnQ8p5qM99uymp+KK1TpLKvLCBHX5+wUw4ujDTO73n1KptlT3cxuZ
         KI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752014316; x=1752619116;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EZXBcUYZbpmp6x6DzHluAVJ44/IpxA3vzPrSsIqdjvc=;
        b=aGMqqwksHSM+9JPUCFFM5frZ6xz0l0oCGfuhBHOYjs3Y3hRd615DWnBwvODATTcSCW
         ys+7y38e6FBz7pvRzDsg1d69KPhR/fAhgrC7mAye1dow5bh0R9A3ro1qDI3rd6OmpGpf
         1ms/i2JghnJgJzf0G3UmYw4Mi7/pGBGc/dG5vj1CBroLCcn6eObHoxzKt6kXveHr1uxO
         sqqUqxTN637LNgLvAzyI4UGQIiSlFDXvVUGF19YKunNjMNJeMuYPUcUkunfs0aSmMEqt
         Ru08T1j5jtH8P3UOlPaoPXVW2v21tV+056Sj3KIPGuYv8TIJqW0j/aR/4SOMcHSOtDUC
         h9HA==
X-Forwarded-Encrypted: i=1; AJvYcCWpHvP9yYrrNnMVf4DvlSAqFRk8rlv6FrStyU+tdUxCX2o0aCzQWBkfpkOwoMv9PIP8OdWfhfJEjedH/EcC8+sG@lists.infradead.org
X-Gm-Message-State: AOJu0YwOMykw79PS2qswlPC1zqtldN9JWt1/s3G2VexdOKBoMkx9KdFZ
	/iyijQYGiEbVdFw+PFbwzGy6GdOx4s6LZlH/RVFMkNv+SNx1Yi52BnhLz+YxFY+qiiysBvf/bVm
	6QftPnnzAGngZMHhiKVAObfQ6PA==
X-Google-Smtp-Source: AGHT+IEvTDVKc78dbR3Cm+b+imZg538tK47xlirvMg3Vbi8CZWfQR6eTqrKNEX1iHUh+LNlMNycxyY1EOLwMaUcW0g==
X-Received: from iluf14.prod.google.com ([2002:a05:6e02:b4e:b0:3dc:6ecb:a0cd])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1908:b0:3dd:b4b5:5c9f with SMTP id e9e14a558f8ab-3e1670ec00dmr4568395ab.19.1752014316111;
 Tue, 08 Jul 2025 15:38:36 -0700 (PDT)
Date: Tue, 08 Jul 2025 22:38:35 +0000
In-Reply-To: <aGwa2DGJq3FyxyEK@linux.dev> (message from Oliver Upton on Mon, 7
 Jul 2025 12:07:04 -0700)
Mime-Version: 1.0
Message-ID: <gsnty0syz4t0.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 06/22] perf: arm_pmuv3: Introduce method to partition
 the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: mark.rutland@arm.com, kvm@vger.kernel.org, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, mizhang@google.com, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_153837_237385_2BF61D55 
X-CRM114-Status: GOOD (  33.33  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Mon, Jul 07, 2025 at 05:57:14PM +0100, Mark Rutland wrote:
>> On Thu, Jun 26, 2025 at 08:04:42PM +0000, Colton Lewis wrote:
>> > For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
>> > counters into two ranges where counters 0..HPMN-1 are accessible by
>> > EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
>> > EL2.
>> >
>> > Create module parameter reserved_host_counters to reserve a number of
>> > counters for the host. This number is set at boot because the perf
>> > subsystem assumes the number of counters will not change after the PMU
>> > is probed.
>> >
>> > Introduce the function armv8pmu_partition() to modify the PMU driver's
>> > cntr_mask of available counters to exclude the counters being reserved
>> > for the guest and record reserved_guest_counters as the maximum
>> > allowable value for HPMN.
>> >
>> > Due to the difficulty this feature would create for the driver running
>> > at EL1 on the host, partitioning is only allowed in VHE mode. Working
>> > on nVHE mode would require a hypercall for every counter access in the
>> > driver because the counters reserved for the host by HPMN are only
>> > accessible to EL2.

>> It would be good if we could elaborate on this last point. When exactly
>> do we intend to configure HPMN (e.g. is that static, dynamic at
>> load/put, or dynamic at finer granularity)?

>> I ask becuase it's not immediately clear to me how this would break nVHE
>> without also breaking direct userspace access on VHE, unless we flip
>> HPMN dynamically at load/put, and this is only broken in some transient
>> windows on nVHE.

> Agree that KVM's HPMN can only take effect between vcpu_load() /
> vcpu_put().

> The changelog isn't correct regarding the complications of nVHE, though.
> In order to support a 'partitioned' PMU on nVHE we'd need to explicitly
> disable guest counters on every exit and reset HPMN to place all
> counters in the 'first range'. Unless someone has a use case for this
> stuff on nVHE I'm not too bothered by the VHE-only limitation.

I'll fix this.

>> >
>> > Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> > ---
>> >  arch/arm/include/asm/arm_pmuv3.h   | 14 ++++++
>> >  arch/arm64/include/asm/arm_pmuv3.h |  5 ++
>> >  arch/arm64/include/asm/kvm_pmu.h   |  6 +++
>> >  arch/arm64/kvm/Makefile            |  2 +-
>> >  arch/arm64/kvm/pmu-part.c          | 23 ++++++++++

>> Maybe I'll contradict Oliver and Marc here (and whatever they say
>> rules), but IMO it'd be nice to spell out "partition" rather than "part"
>> here for clarity.

> I'm not too big of a fan of the naming here either. I'd prefer something
> like "pmu-direct". Partitioning is just a side effect of how we're
> allocating counters currently and most of this implementation could be
> reused if we pass the entire PMU to the guest in the future.

Sure.

> With that being said -- Colton I'd focus on getting these patches in
> shape while we figure out what color we want it ;-)

> Thanks,
> Oliver

Trust me I'm working on it.

