Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89966C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 21:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=f5TFKrdlu748ABqlHsuP9NDv0QkMzFjiUtwaLrqTFf0=; b=PZW8BJhhTal1Cs
	XUWp2TYhGBeSyVUlOrZrZO99fAeyk4L+RHCPXbMPPojgubIUYS1Z/897rPx/Sr9KzhyJGEfYoLsrZ
	A8WCBSGd3MAFrnCIDEOnb3hHFchFUMcLvHSqsYTDCxia7SggNzdLuwakbbPxR7qkgH8TWPTfuwF2A
	zcw/jfVAj+41vPFfUdaHbO9nIaw3S5qIOU+VXQ/hhrB8ag61LQGQOt/d+uavkLpu8hTLEFQtc2bqw
	T+66qRHosRG7CDwauRyiQ6wZNWsYquQfg1qmo9zExkQJeRT5f7GxgPALWd4ou0vaxUHJRQk1YSZ5A
	7+L5uZCxVuLE1pfMj1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdFbo-00000007ofg-3is4;
	Wed, 29 Jan 2025 21:28:28 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdFaT-00000007oO9-33Gk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 21:27:06 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3cfba354f79so3364085ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 13:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738186024; x=1738790824; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f5TFKrdlu748ABqlHsuP9NDv0QkMzFjiUtwaLrqTFf0=;
        b=HnbWP2iozqEYnDlJUHf9PXRJ4zn9ZqXA6Yby/5NrZe2mkGtI27mMsB7cjfIt4ahcCP
         TSeFzf5kL2/WU+fM+GHWGQiHeeM+JqPTzUui36N+wlhyDoDVA+QqGDeGUJSAKhsuGQje
         NOhAn/Xu3sBA9ON3fVoAG/4zt1tzUHhKGtLh/DpzoI2/pPV8mZP7dxpgaESnSFS8vLpz
         eLHPlqC5BDK7Uzp8zWZqLHfEI/7yg6dG8fn9PS9dR1yBTnq5Ih9O+uhHitNvAdnPZLGN
         IltYjXRJzNU+bdYDZQk6O/J7GX2GCueoFTpGuoSXJGohKBp/H4viCiOhuzT1mI6u/MJN
         uQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738186024; x=1738790824;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5TFKrdlu748ABqlHsuP9NDv0QkMzFjiUtwaLrqTFf0=;
        b=K+udosjCogfN7j2xGmPaFF/iJhysGKMC8kkClstxTGSEKy0CsK/4bm1B3pIt4+Pwlw
         VrCgEdwnwNVkQ3NjWv5c0zLO7CLC7cYVPP+JTFlNPXSWJ19ZOjQ9BIBlRbLn7aQAYjXE
         EUxfmCFo3QOdUZ4WPDniAc+Be/bcvadZly0cVjRqJ99xeZGwbCsKmrqCh1iDOrE+nQNL
         qizW9g9dKVCOsR44zc27iReyehAVHix/SO+byM1yg+1ttLubhC31mg4Ap874P1Cysnfg
         2Jmscw6kMXwThyv4Xx28B11ugvLKdI4/uRoTzTuZnrxBcixA+NrG1JBkRQXyocN7mh0R
         OMsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH007bJ3RaOmfn/UksT9QJ4jSNA6+9yuMhFO8iRjaBnRwqg49xEJkfjyb8neogXtOZXK/m8qF5aKHQJN05K3QY@lists.infradead.org
X-Gm-Message-State: AOJu0YxE+DAPRWBd74y9zuGYb9Woht6288ciTUYLthD664wyMM9w/so/
	uDF3ZN8mne996UPXiI+Edu5CrYI1momV1ZHXpTDI+KUYx5627GGTzVmBjRbfy/EADNzhcFs3Dhk
	rtF+zloLNJNokQIeeSrKNew==
X-Google-Smtp-Source: AGHT+IEe9UoVLvNSaHlSkXBd6Ho5IN4ChMz7y7gjFQYGYFiTLbvYP7nErowhtJVcYSVDfJu2qMuLzToHlUCNsQ59Ig==
X-Received: from ilbbb15.prod.google.com ([2002:a05:6e02:f:b0:3ce:69d1:ce53])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:20cd:b0:3a7:66e0:a98a with SMTP id e9e14a558f8ab-3cffe3d1e48mr43753655ab.9.1738186023704;
 Wed, 29 Jan 2025 13:27:03 -0800 (PST)
Date: Wed, 29 Jan 2025 21:27:03 +0000
In-Reply-To: <86bjvpvdn5.wl-maz@kernel.org> (message from Marc Zyngier on Wed,
 29 Jan 2025 15:33:02 +0000)
Mime-Version: 1.0
Message-ID: <gsntzfj91fbs.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [RFC PATCH 1/4] perf: arm_pmuv3: Introduce module param to
 partition the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	pbonzini@redhat.com, shuah@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_132705_767416_4AA9880D 
X-CRM114-Status: GOOD (  24.00  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Tue, 28 Jan 2025 22:08:27 +0000,
> Colton Lewis <coltonlewis@google.com> wrote:

>> >> +	bitmap_set(cpu_pmu->cntr_mask, 0, pmcr_n);
>> >> +
>> >> +	if (reserved_guest_counters > 0 && reserved_guest_counters <  
>> pmcr_n) {
>> >> +		cpu_pmu->hpmn = reserved_guest_counters;
>> >> +		cpu_pmu->partitioned = true;

>> > Isn't this going to completely explode on a kernel running at EL1?

>> Trying to access an EL2 register at EL1 can do that. I'll add the
>> appropriate hypercalls.

> But what about a guest that would get passed the magic parameter? I
> think you want to prevent that too.

That doesn't matter because the ARM manual states that when HPMN is set,
reads of PMCR.N from EL1 have that value and I've made sure in the
second patch KVM does that, so a guest believes it has a system where
reserved_guest_counters/HPMN == PMCR.N so there is no partition.


>> > Also, how does it work in an asymmetric configuration where some CPUs
>> > can satisfy the reservation, and some can't?

>> The CPUs that can't read their own value of PMCR.N below what the
>> attempted reservation is and so do not get partitioned. Nothing changes
>> for that CPU if it can't meet the reservation.

> That's not what I meant. The question really is:

> - do we want the reservation to be the number of counters reserved for
>    the host

> - or do we want it to be for the guest?

> On symmetric systems, it doesn't matter. On broken big-little systems,
> this changes everything (it has a direct impact on userspace's ability
> to use the counters).

> I think the design should reflect a decision on the above.

As currently written and reflected in the name reserved_guest_counters
this series is making a reservation for the guest.

After talking with Oliver it probably makes more sense to make a
reservation for the host. This is closer to the semantics of the
underlying CPU feature.

In the limit case it's impossible to leave the host without
counters. All valid values for HPMN leave the host at least 1, but
should we make any guarantees beyond that?

