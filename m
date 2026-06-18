Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE425CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3nOkEEN7ElYuC9x+a6xshp6SZdg9WydOxf9jhKoXMNQ=; b=byGDaJbeZCydUbmfMySKAnHX+f
	BszUBdWp01mMWiJIq/lYppC+IpPyhcUj4CGG0KzkwvMQ4YNJhVzHpEYb+k3ihIcy5WlrhnNbV+pSg
	C93UETqb9oj9cfkvoDADDl+AdMIllvZEZy/2eJlCMSH/tGHfkdRzTgGLhOyJ5/u4x0y/MMDSS/jyB
	Y6Qjc26MkEG9fvInKnQ/2osbeaqlONLGupB5ZxmDYxVil2663YpEcV5R4Z+lO0Mrj1I3m1GCxiIh4
	MWVzSrg1eVT8bjOJBvdAU7boA7GbCq7AZmb8IL5vDDlFVxovBH8i5kAP+M3xGRyD46SN0zCLa8jNH
	zhqnLhvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9L8-000000010Co-34v5;
	Thu, 18 Jun 2026 09:47:14 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9L6-000000010CC-0CuB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:47:13 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5ad2abf31aeso4259e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:47:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781776030; cv=none;
        d=google.com; s=arc-20260327;
        b=NHD+1k/xIeyij2wbp724wL6PmunD3xWJjmQYYqUiO3xtk4eeKBb8FEGptqtkcfPxCU
         JGcosm2zYwagdXiZztmCgIKiAm8MQ+W09Dulmzy/m9cxFd/v9qgZuEzKrrRgBdoNSEwm
         yRf53i2y2mcDSQM52Y3Enlkihs8njObcD7gQZ2lYki37Pp2VzKSQVTpHa0nDmbPy0gyW
         s1cMB/yhViCUJUAexz0mt81zgT+vLLRzywGi5//70eOfem0ky4WOoj3PI9rjgrLYuRl9
         NG/9qUQHuMDOYK+UnnU4CGCiwOa+pIp3V/Pc/6FyF9IW9ir9dGX7iHx5+d8uJyi41akJ
         qtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3nOkEEN7ElYuC9x+a6xshp6SZdg9WydOxf9jhKoXMNQ=;
        fh=8VxovbEPYkfBgBvrG9I/0ia798Tv78yONu6tFazWafs=;
        b=hfVloWM0L35OQWb5ZQbSRNDOSGf80ojP4VltSl31Dwas8hS0f1oxX6KY6Ds7/cD4jP
         Ip3CMK/g76yqYgCinzr5YeZK2031oLgyFFQm7NDJrOsni+DYxEJKWTQVBFxcAGTcjnDe
         m3s04EOEFIPfmAeqAv23ju5QlOURO51nB+R8yDib3zEw0ly1GEdnMB4xQ8kPJ0+2/Kx9
         XKQIUrnWKeJLU9hS/y7epEjwRW9GVmvwW4tu6dXLZYfrhKfB8X5OQ/M6NjqsxX7JWYxN
         yg3mH46R/W393k8gXJi22C0fiSewMNw2WarEB9JAOLdRTYSUH5rPz8KAuyIxJxSuX8Jy
         F/KQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781776030; x=1782380830; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3nOkEEN7ElYuC9x+a6xshp6SZdg9WydOxf9jhKoXMNQ=;
        b=q1hFH1OZUiO5bqFlLYLrAHvq7Uo8Q6K3bBc5qc1eQiUTavhmd+YPoN8NX2UQhTj0HK
         T8l4pUibA+WPhFcgfAWjBjyDSqKKBWUfodOsBCKL9me8HM89xHPb/hYC1Z9t65QadFWZ
         5fvCXKaKVAdDoiGoZKAMZvUPXUnmhKySBG4AJRR5SJM8Lg0suiAA6+ilUTb/QJtBxxuQ
         Hx042OAWQ6nobPrfrs2ylZg7WYS8M0UEnHZBTStxdHGTjwQjDofKzXfy4XI14W1mmr5c
         ft0BjEMDaKxEUFw84sIOFR3clMUimslp1uTuePfnFUvMU2baoNJ4xDUPPoUi9SlQvXrE
         mKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781776030; x=1782380830;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3nOkEEN7ElYuC9x+a6xshp6SZdg9WydOxf9jhKoXMNQ=;
        b=U6IPs/6M+ROvmQbFbKkxdsQQ26y8QFulXMwru1Fm4RYauVQBPyLAzrX0bsnf/4g/uO
         jl5uGkWfAijqcrrjvyuI8hpu3Exm/p0V6ekCa8WUikTRpBokMpl1RTjaLwuGReG4WJLQ
         ZffWktm8dPwijIOMv3HSET0+IWxJzqqmcWQihjcnDfX+KxRUsdCBldRK6SAN51fq0waK
         jfUBDyOmQZO/zDk5PxF+W9CkLEkN2ZUAqDvBcdLQ+MssFqwrPu+3ppgoW/tRc39bRTcV
         LIZ2Wnw5HYXtrsByfUKt3Tr/HkCWd7dVmOvYcKDpeBUwZy3EfL0m8SlRBJRIbAf3+RAq
         x3eA==
X-Forwarded-Encrypted: i=1; AFNElJ87wIihzXzSqruAp/+iFp7OLuy5RnbI1QEf3ZVNOJQeS0EhjGRHPGfp2q9zzOoH+uyV3azJX9Ttb3R7eaAmEiYM@lists.infradead.org
X-Gm-Message-State: AOJu0YyzIGaIfUNUdo8idI+8dcyKgzQUDlHXopBg/DacF1i1c9k6BEiD
	opL0whZjGc6pbeJfAF7v0kZ3hrSFmSWjENxr2hFajyAu4nvt8ubu5BNahNzndqq9+sADpNdRqC0
	z35DnnBpmTLhSQGNyK/gO1K1hy8CIBGAGBrUN52OJ
X-Gm-Gg: AfdE7cnhC9OYXOco2UIBQT7gtrXggc1/jZA69kBbXJxB9w07ycDjC9b1s4GqQAckW03
	gn/oKUVPp5aHbC0XuMoNdsaSrXScQpeV4xBteP1yqkA5vSvQglzOvfp8kBkMdufpYW33n0jcwau
	nCYhCUoWVLPqfNRci48dXbZ6voVF+iVEaxSp3YjRCV9eQOgCoQsAcgjC1pj7HkJlvtx61QRk9Vk
	RYbCqqR8wCevrxSS3p49Wu20ueIEtW6rqmv4OZbWd7gjSbYjB+pDMbJ+xyoVRav7mKo6dLYMQ==
X-Received: by 2002:a05:6512:3b96:b0:5aa:883f:5da5 with SMTP id
 2adb3069b0e04-5ad4db8f3b5mr127738e87.12.1781776029259; Thu, 18 Jun 2026
 02:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-4-tabba@google.com>
 <86jyrwrymb.wl-maz@kernel.org> <CA+EHjTz-+8M5oSh+7A2vkQ-zPmDkaKptYMoBhLz=rReufKsAHg@mail.gmail.com>
 <86ik7grxrg.wl-maz@kernel.org>
In-Reply-To: <86ik7grxrg.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 10:46:30 +0100
X-Gm-Features: AVVi8Cdj3_cVvPSPYeXrneOqZ9vthmWKgulM3oMPHaqRW3tcDe5Y00kHjlerqkc
Message-ID: <CA+EHjTytu_tKDK5+UHX0EWAweLTD-mKtMw32TiQxc0AU9D0x5g@mail.gmail.com>
Subject: Re: [PATCH v1 03/11] KVM: arm64: Use guard()/scoped_guard() in arm64
 KVM EL1 code
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_024712_106593_D7549CA4 
X-CRM114-Status: GOOD (  23.16  )
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

On Thu, 18 Jun 2026 at 10:41, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 18 Jun 2026 10:24:55 +0100,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > On Thu, 18 Jun 2026 at 10:23, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 12 Jun 2026 07:59:17 +0100,
> > > tabba@google.com wrote:
> > > >
> > > > Convert the manual mutex_lock()/spin_lock() pairs in
> > > > arch/arm64/kvm/{pkvm,arm,mmu,reset,psci}.c to guard(mutex),
> > > > guard(spinlock) and scoped_guard(), dropping unlock-only goto labels in
> > > > favour of direct returns. Centralised cleanup gotos that still serve
> > > > other resources are preserved.
> > > >
> > > > reset.c uses scoped_guard() rather than guard() so the lock covers only
> > > > the small read/update window inside kvm_reset_vcpu(), leaving the rest
> > > > of the function outside the critical section.
> > >
> > > To be brutally honest, I don't think this sort of widespread changes
> > > bring us anything. This is just churn.
> > >
> > > Sure, if you are reworking a particular bit of code that is goto-heavy
> > > for the purpose of error handling, this has the potential to cleanup
> > > the code *while you are changing it*.
> > >
> > > But doing it for the sake of doing it? I think we have bigger fish to
> > > fry right now.
> >
> > I understand what you mean. Would you like me to drop all of the guard
> > patches, or only those that go beyond the code changed in this series?
>
> The latter. I'm fine with conversion that happens while the code is
> being reworked.

Sure, I'll do that on the respin.

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

