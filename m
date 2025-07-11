Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70124C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 00:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0HSRL4HugeXUFVF2xbav3ajCDx1kDmGqq3aBhMDxm4=; b=t/yv/rcsTAxU6xupH+BDgdO06u
	mFrT7tm+BB5j+EBhzigxtDNLaRUyJv/zXdHXhR2E039r1n0AUPvxuaP9K05D1H0sNbVbIdNESDnMF
	dEu583NeiHRoD4A3dt8t4H8ddtarOIiVCk5+aMzF2qws8QMeQe3OHHYWOD+JDRqjHICTsLUe93tL+
	XY0jI5dfEgMyPLvdLpFj8gt6ZKSro5oKzDJUGoCkpTpcv+NY9HVGL6kMM82OJ+0c64d12TP0np7Sh
	H/oUlumF/o6TETilw4/UgoMfoUTgi0yPEaFvSnEugh2R3+t7YCnFmsxL9XR61VXoaLTpbKzyjupmt
	y8Gk5cnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNhH-0000000G54F-2bJm;
	Sat, 12 Jul 2025 00:02:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNe4-0000000G4Ha-0n81
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 23:59:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-456007cfcd7so25985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 16:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752278350; x=1752883150; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0HSRL4HugeXUFVF2xbav3ajCDx1kDmGqq3aBhMDxm4=;
        b=y1x1I6EMaUiRIHwXwetnWpM1DMSEN+TO2rr+iNx3GpehEKZdbQDE/EqmvUxQ1h8cIo
         wQS3tyFEHdn1HLMJiXFeoz3GhMjwn/bsSH5RvVxdRvoVJY7MD3gwbe5CJwjvY38eyLWD
         f383EUdE1llWqbVwaGoHpY1zw+sj00x85xGM0/U85tQpQwVvUfVJgrLgSDX82ngMrcUF
         XteB8RX4jUatunINl3OHyozKM8zed1/nPEKOezmw3GNylUOEVOcLOj83CjnppHmRtyJ4
         vBlyWnPUcsYldbbnm16vXOQHHJ9bHyO1McuHYFNe74KEuXDyN1Nhp3dOAPthgjBBByQ9
         M/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752278350; x=1752883150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0HSRL4HugeXUFVF2xbav3ajCDx1kDmGqq3aBhMDxm4=;
        b=AeeoYP5jx6eY2TlrMBfCKMLZ3Q12jXNT1RNM1VCzhInHt5tQ6BZ201ASN4VYc+n9Lq
         W6fc2J9WMYPWR51yGjCYJg4bDKvitTNnR//2d+JJE62xgz7eBeubdrJfrvjUgUs1+3Z6
         H03rN8wgF5mO2X5Tkzlur8kjc3NQMsKQO268e+Z0vNNFt4y+CO+zXcJ50SeZiZBVpdxT
         l+qITJ6qbCBEks2zMR1ok2dHWqRkG8oXgNltKYdWKMJSvr5GgtkbJwWteOCxPCRJLqJr
         hgGA2YHAKIZfnM4tFMfO7aQIFCMVR8uyAfKjhqpyBecv60dBTJer7iTtKzQf11JzbspV
         Wnvw==
X-Forwarded-Encrypted: i=1; AJvYcCXm0ImOJfqql1CHAVQNrHNLsurOJLvCb2hEz9eaNcQdNY0PKyeAO3YLNmLxqx3Q8HNGQ/TreqYBZqc9ViC+eEp3@lists.infradead.org
X-Gm-Message-State: AOJu0YyE/9ADza6I6/1jTrfZ1DZLlxCGiZzwS8LHaSg1pCF1Nk/GKEiW
	Mx7DKGyRV3edHJ9EOJcSuZDLOlIjta25fW0r1tjgbTYb35QmBWy14phPB5cjnZHw7KlCt3f4FzC
	ViGfWALxz1ayRnwxo4AL4RC1EdR9NIDBvHLk2XEKh
X-Gm-Gg: ASbGncstrm1RVZvFRwZW8rpwrI5YvLuK+q6va4UeXiY21mF/VxQexn8BvCugM0yIeQn
	6vs5AFkeKTlThLf1knAJlnCavXwIX8zXo7QDHFZIJqfxM5q9S7NmmoZVbywHc+QpagoGe7mPqtQ
	tFD/vJYCPj78KH1fqPVVwLlw/iDn3La2mKWUgrs5acFvKhXaPagbAi6bcj+t6mX/szJo07AyL7/
	ONc9TKQH/Sg7SaBjv+MwQCEoq74BxVxr/vDTg==
X-Google-Smtp-Source: AGHT+IH0Yb8i1HbshEYkUfB7pKBzNAZY2a47ozdMS6Ea9eu6/2JNmyxFqwJwxTVebnT7h+QOEYO+783uFnTjwj1f5T4=
X-Received: by 2002:a05:600c:4302:b0:442:feea:622d with SMTP id
 5b1f17b1804b1-45604731777mr157355e9.1.1752278349565; Fri, 11 Jul 2025
 16:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com> <20250604050902.3944054-4-jiaqiyan@google.com>
 <aHFpIpIfqVCQZVgG@linux.dev>
In-Reply-To: <aHFpIpIfqVCQZVgG@linux.dev>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Fri, 11 Jul 2025 16:58:57 -0700
X-Gm-Features: Ac12FXws7N7R5NhC74hDyERmsam_JiCP8QqW0Zl8h8Z88cj84PQ3Wo91uK-jnvY
Message-ID: <CACw3F51xRWr5LXz4-JhK+mjizY7D7Oa+GrJ-OZHktfPzFGKeiw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] KVM: arm64: Allow userspace to inject external
 instruction aborts
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_165912_242823_751A3954 
X-CRM114-Status: GOOD (  21.04  )
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

On Fri, Jul 11, 2025 at 12:42=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> On Wed, Jun 04, 2025 at 05:08:58AM +0000, Jiaqi Yan wrote:
> > From: Raghavendra Rao Ananta <rananta@google.com>
> >
> > When KVM returns to userspace for KVM_EXIT_ARM_SEA, the userspace is
> > encouraged to inject the abort into the guest via KVM_SET_VCPU_EVENTS.
> >
> > KVM_SET_VCPU_EVENTS currently only allows injecting external data abort=
s.
> > However, the synchronous external abort that caused KVM_EXIT_ARM_SEA
> > is possible to be an instruction abort. Userspace is already able to
> > tell if an abort is due to data or instruction via kvm_run.arm_sea.esr,
> > by checking its Exception Class value.
> >
> > Extend the KVM_SET_VCPU_EVENTS ioctl to allow injecting instruction
> > abort into the guest.
> >
> > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
>
> Hmm. Since we expose an ESR value to userspace I get the feeling that we
> should allow the user to supply an ISS for the external abort, similar
> to what we already do for SErrors.

Oh, I will create something in v3, by extending kvm_vcpu_events to
something like:

struct {
  __u8 serror_pending;
  __u8 serror_has_esr;
  __u8 ext_dabt_pending;
  __u8 ext_iabt_pending;
  __u8 ext_abt_has_esr;  // <=3D new
  /* Align it to 8 bytes */
  __u8 pad[3];
  union {
    __u64 serror_esr;
    __u64 ext_abt_esr;  // <=3D new
  };
} exception;

One question about the naming since we cannot change it once
committed. Taking the existing SError injection as example, although
the name in kvm_vcpu_events is serror_has_esr, it is essentially just
the ISS fields of the ESR (which is also written in virt/kvm/api.rst).
Why named after "esr" instead of "iss"? The only reason I can think of
is, KVM wants to leave the room to accept more fields than ISS from
userspace. Does this reason apply to external aborts? Asking in case
if "iss" is a better name in kvm_vcpu_events, maybe for external
aborts, we should use ext_abt_has_iss?

>
> Thanks,
> Oliver

