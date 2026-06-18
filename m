Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D15BCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3Zre669MYqcM/Oe6qE8drH+HyzXufisv4LydYG4RVg=; b=rEPQ/PkAhR30Yxzge9zF2fbrCF
	tz+P05Qi10xz1G53fR8jtK4LSUHEyNQKPyz50V1HMqdIg0/VDtqlMhtu/Dd4KKjwHiuOQAS4BP+U9
	lRnwi1tufb0KUDSc56anILa7vaasYzWk6t9UP5/HliUjHedD5h4mbOHKvvCC1AzE0PZlAuvkps57o
	fGr0a5yN87fZgKfK6LkyNSm56uuxQ7n8LgVBB/7gXt4Yzhw0sLSyAxaS447WOKXrkO5bkYTXe5xKj
	A25q0iWBDVOW3yJcmDHhqpLTKYlRSG1IgXGoaaYFz0MbQznjPLygOmjOj/MVaOtlEAaiTVdnkISTP
	7N4vSMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa90E-00000000wiO-3vD5;
	Thu, 18 Jun 2026 09:25:38 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa90D-00000000wi3-0HDf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 09:25:38 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5ad2abf31aeso4068e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 02:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781774735; cv=none;
        d=google.com; s=arc-20260327;
        b=aduTWF8rZHUz89iPLYkO/kQOjGw+FIdjYQyv0wxyQLTqti1uRWcu4qIp5bSZxqXCmm
         Gn275YpR+rdpLwHAMNAmi+f1Ka7vktkLKei416SAH6VJ7SVeCs/esCY5jY3w8zetVfDv
         tRpnlkUXrZFQHUb2HnFwlHNzvBUdEgG5/ZcNuOrr+icWUiDN3jnZF0QbzM5nmwofnG3O
         Log8gKBei6mVTRPbkj0Gdwhm3dvmYRaNCyPe3q+46ciBsKwJWkGKt3Xj74nBNqBOgeXI
         SlJ1qDkXafnnDBkKD/EDr3bKlkCFBcttXStsmHt9N3/MwTTa6f4ANRok3+iJSPQmD3xH
         6udw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/3Zre669MYqcM/Oe6qE8drH+HyzXufisv4LydYG4RVg=;
        fh=IfuHKLB5kvdfBpxw5f/PHTiVPyP7elqBs036ptWQUpY=;
        b=Kn2TP2P2G9jlqYSidQxtZJmR9EZlg7RKXKg9YwIwEkXyDYfHqclOM1L91/4CMEWjs8
         /y5gW8eZazknnQPrupwq1SGw5Bm4Y+rDZ5DNUiOc78OqcfXgKHjrxDYnmRe5fn5Lz6co
         aboErhyKKrLe5O/pgVAgQ0Xd28Uiqg1LzKT73PQ/N4K6XIFztDQhnQS/kBhjdwO3uc8H
         fP8iM91XvXH8KyG5PuklYqmCP/Xqmnx5vmIF8y1vIeCTHKMJP395qWu83t6MWRRKRZvh
         pBIFSVRBecE+7YlCjg062VdJGPzd2cxamDThKuTSaaQS+UAXwgF78zova5N3R98KrPFr
         /Ymw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781774735; x=1782379535; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3Zre669MYqcM/Oe6qE8drH+HyzXufisv4LydYG4RVg=;
        b=LoFcAaxULtD8HYI4AQBQTt8oQyMPTLMRNNmLqs+E5xQgBw0c885VDc1uKIEG5lvyum
         SWZcrCYbOpYCicSeNonssWA4QANUkhgKOX90sCgY+aJ25n8NXBMlH9u1MFo1beqkqHOH
         DO0NPQBIxoj4oTUEa3QMwWF8uC9M2lXr9w7wCP4UC/cSbiwoi1X9WohYMEkf+ShoMqIv
         I2n6ED1OPdOIC+GrTiPvBSVQ7+CeRLiMGdyKz3VAju5Zv0uiVgvaknzZHj9y7KMNM5T/
         iKRMsU4RQx00sATbOrxRy6c/4LU96B+KCggCRVJao3pJDWlfRWlRDEB1AqdexICAmrbx
         CS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781774735; x=1782379535;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3Zre669MYqcM/Oe6qE8drH+HyzXufisv4LydYG4RVg=;
        b=RxUsjMjuDICqS6GNZrratnOZMZ1CarQalSaSaK0qYgGWSRKR+TipTGfFbKaJVxih5d
         l8w2h49U1t5GmdeEATSTgbmA5OhmG2a3Z5j7LVWLxgjgtVpz9jL7XwXiHk2RH5NNfAfV
         mRogoNT8pYp4gm8PFaDBmb0/Jf4W9HbaAU/h4w7I8XdqMviizPZyYC1v09WE7uK50SYz
         vlb9h2I+fvkmlouxcaESM3YJMp1s3Riub366P00uHUFGaxqrc198gZn7+5u3AOn5GYo8
         F13LUaATgI2qS6OkNHhxgZgnJ3sJYKOuq2Fc6LXXJy/4l3hfvDt4d9J2xvyI7xSzL/zz
         c8SQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/36+NyBu9QrCcZVT45LJjUaFh00akA4VirJ10ooDy6i24Q06ECZj6pSVAT0jNc2GlO8cg2gN4pX/87wyWhQVs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4yzPGofbgEDOXpxonAYta1Nl7Nc3fDG5kjZdlsPjfPUgaUH9o
	cfQvW1SuzqDZFPAlVe3HGnO8lfLq8cQzwQRHUVq2tC2SrmSssux5hrs3yhkqu6L3SrNuL1913MW
	7Xg7NCuwkswzBMpJsz0hD5PAWojZ+S9fsNeeSmWNh
X-Gm-Gg: AfdE7cnqQXK3W8dcu/dBSmhfxxjHKnCoc6JnZTteOH9kNwKKBiWaGrijoIHaAuaRd9h
	DhB5e9xjFASnEeEBPVTDTdNrZvFB4mnhKk7fdFoJdAgQdes8XFeT1LaHmN0GZCIT78CcxEeSoxT
	sD9oCP20YkHuUx5SJn0bEz4bDCTBFgRmq9TOp966ga8jJG9BSyiPoYVF9fXx9LaIWqfb0a/OBFh
	o7oKMr+uMCdi9GnIDsVrkCb0EuKJX/q3UCNki7VSKv8Pafp/ksxRlH7RzCK6LbmRxV/usy7bw==
X-Received: by 2002:a05:6512:ad2:b0:5a8:73f1:4099 with SMTP id
 2adb3069b0e04-5ad4db0dae4mr128479e87.0.1781774734407; Thu, 18 Jun 2026
 02:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-4-tabba@google.com>
 <86jyrwrymb.wl-maz@kernel.org>
In-Reply-To: <86jyrwrymb.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 10:24:55 +0100
X-Gm-Features: AVVi8Cel1tJy73CjSOqfUflX8FM5l1unqh7veSw-rmZTZN4CJ08nDfEqP60aiRU
Message-ID: <CA+EHjTz-+8M5oSh+7A2vkQ-zPmDkaKptYMoBhLz=rReufKsAHg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260618_022537_191204_20D7C036 
X-CRM114-Status: GOOD (  18.93  )
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

On Thu, 18 Jun 2026 at 10:23, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 12 Jun 2026 07:59:17 +0100,
> tabba@google.com wrote:
> >
> > Convert the manual mutex_lock()/spin_lock() pairs in
> > arch/arm64/kvm/{pkvm,arm,mmu,reset,psci}.c to guard(mutex),
> > guard(spinlock) and scoped_guard(), dropping unlock-only goto labels in
> > favour of direct returns. Centralised cleanup gotos that still serve
> > other resources are preserved.
> >
> > reset.c uses scoped_guard() rather than guard() so the lock covers only
> > the small read/update window inside kvm_reset_vcpu(), leaving the rest
> > of the function outside the critical section.
>
> To be brutally honest, I don't think this sort of widespread changes
> bring us anything. This is just churn.
>
> Sure, if you are reworking a particular bit of code that is goto-heavy
> for the purpose of error handling, this has the potential to cleanup
> the code *while you are changing it*.
>
> But doing it for the sake of doing it? I think we have bigger fish to
> fry right now.

I understand what you mean. Would you like me to drop all of the guard
patches, or only those that go beyond the code changed in this series?

Thanks,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

