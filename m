Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80777C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 09:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8frcNR3d7ivP4NC+vlhr7MJ2cYU39BpSTQEOAw1o4aU=; b=39jp5qns30N36qnZShKa1OgErv
	ozjIO1xVb+w7OUVA+MjdhyyE+x5VfslrIWs4wCb6yQCdM2Reyszoj5KYYqd0reSZWq5zLn3CWyfQu
	NrxGULsRGFjvD+MqeYEBGVQUDxZPnc1r9JUMlHuwJXKJbi1AHol4z255oQzotoYzwE+IHuDFWPTl5
	QTI85UbafSIdOYIgyyzuhFvN4j+GlIDRF3rheQrib1nI/nD8Z/XFaVl67rkZ1TuQrdYu7p4SqvRTA
	sTCV8yvDrtClbLPo+H/VASZQbdKAWsFh2+2M0Rb8KJ2xLGSAmuN+n6v+s7tZxZ2TE+8E6zuBNgyyk
	2eTRMMFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5LyZ-0000000CXB5-0ERS;
	Thu, 17 Apr 2025 09:56:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Lwh-0000000CWjb-3lWq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 09:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744883651;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8frcNR3d7ivP4NC+vlhr7MJ2cYU39BpSTQEOAw1o4aU=;
	b=KXbZFsthThQX4mdeM6M9gnvzKTAN4Z6puPrCfRnD1BfkpUY0tjWqu6hKuRM9Qi4wZARzQr
	7r+WjvYl6DqDYkUr9iJt98U0jKngQrpHM4WFhMlwxHrCDFCScaNq+at9XV48ATTWtHI1u4
	z86gBxoTE9YyE5DpyXHfCademR0alqI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-R6OHmNHvOQeF1J1w-fWjzA-1; Thu, 17 Apr 2025 05:54:07 -0400
X-MC-Unique: R6OHmNHvOQeF1J1w-fWjzA-1
X-Mimecast-MFC-AGG-ID: R6OHmNHvOQeF1J1w-fWjzA_1744883646
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39979ad285bso297944f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 02:54:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744883646; x=1745488446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8frcNR3d7ivP4NC+vlhr7MJ2cYU39BpSTQEOAw1o4aU=;
        b=M7o+yEFySToLmh/tRtdeAZetDzdpuZLG07EQIBDRe4TSg56Ns1D4P9jT3YMeqnxG58
         mAMvMvIjDa5kP2PiEElqOgx441py2sGuICipZhO6eeFlul1BVwiWPAPPdOx/Ylb9ICbP
         swhVuLNMvMJpn/ysktJ48X1h0N39KcSvKJ1MoWPgxeFGURj/oNmR/cx8s+QHiOTppzgE
         HCzKTLJCwOJFtPuzl5EbboWh91TKqTwxG+tWckriweROeJ06E5K6MDMiCJrgrw1rtWGO
         Q71aSBy0uW93Da8W2GPD3KAHiW4dc0dKsyshNrm7a9eiFFJmNTwLdetU4WdfJDjrEpxn
         q2Ew==
X-Forwarded-Encrypted: i=1; AJvYcCU58OyX+qbkEzkTT5WjQNULhVJxU1UqMIwM1BPsOHrwA1N3OBM9wDP5TUmX3v3RC2bU/CQgh8JUJl9aWmEBaQ9+@lists.infradead.org
X-Gm-Message-State: AOJu0YyDURBH7c5zLZgC58NAV8og4goV77umntV0u7dD2zixUt7lArtd
	kFreEuKxaQB4t1SZlgYzu0xOPP+E8f9qxdJrO6amvubbpn/9cbSpdx5i9CZymSSA9/YDuINuQP8
	OiQY435mjucRntHoydxH3BRRG3LgMvztuxGadFB7iyMKEjancroWGri1EoAWt0nd+dZ28ExyOEd
	BsdcKjck645y976xfzEwyf2jcsnF4EDSf/Hao7g01GT7LBNNQ=
X-Gm-Gg: ASbGncsHysnJ2varBlYyc1Tm+RXUg1ZfoWYib7GXh0zOj2dE75RgOE8xfCdyI2Mo4ei
	l/keLtJpwmuvNUs34Hp/4GJIMWZvzCqIdxwdU9rwNpPDDpieVqB8VIAhLaRYuDKA/q4WDpA==
X-Received: by 2002:a05:6000:40c7:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-39ee5b9ff8fmr4783280f8f.53.1744883646452;
        Thu, 17 Apr 2025 02:54:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaUAX5A8zAgw7el/T3YwRV3GZLvfWnuHeaTHfLO1ACdU3siatVem4dbx0XtRNKUnrmhQD+B5DLQ7edX2knUB0=
X-Received: by 2002:a05:6000:40c7:b0:398:fd9b:b935 with SMTP id
 ffacd0b85a97d-39ee5b9ff8fmr4783241f8f.53.1744883646039; Thu, 17 Apr 2025
 02:54:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250409014136.2816971-1-mlevitsk@redhat.com> <20250409014136.2816971-3-mlevitsk@redhat.com>
 <20250410081640.GX9833@noisy.programming.kicks-ass.net> <60b7607b-8ada-447d-9dcb-034d93b9abe8@redhat.com>
 <20250416185001.GA38216@noisy.programming.kicks-ass.net>
In-Reply-To: <20250416185001.GA38216@noisy.programming.kicks-ass.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 17 Apr 2025 11:53:54 +0200
X-Gm-Features: ATxdqUE3EOhyuH0suu9pJLVTpoJVqiaHW5bjmzNK_nqhnV7Z7kL2fl3XehvCGu8
Message-ID: <CABgObfbH6JAh0Puu6gTKfkLd+e5uqSyHHP5i86W-=G6x5zr1wg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] KVM: x86: move sev_lock/unlock_vcpus_for_migration
 to kvm_main.c
To: Peter Zijlstra <peterz@infradead.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, kvm-riscv@lists.infradead.org, 
	Oliver Upton <oliver.upton@linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Jing Zhang <jingzhangos@google.com>, Waiman Long <longman@redhat.com>, x86@kernel.org, 
	Kunkun Jiang <jiangkunkun@huawei.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Zenghui Yu <yuzenghui@huawei.com>, 
	Borislav Petkov <bp@alien8.de>, Alexandre Ghiti <alex@ghiti.fr>, 
	Keisuke Nishimura <keisuke.nishimura@inria.fr>, Sebastian Ott <sebott@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Will Deacon <will@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Ingo Molnar <mingo@redhat.com>, 
	Andre Przywara <andre.przywara@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Sean Christopherson <seanjc@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: a86N8Tv1gYyo8UL0f95Y7Ny5ISLYapdt1C4zwk-2sKA_1744883646
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_025412_001770_E8E74F44 
X-CRM114-Status: GOOD (  12.66  )
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

On Wed, Apr 16, 2025 at 8:50=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> > For the ARM case, which is the actual buggy one (it was complaining
> > about too high a depth) it still needs mutex_trylock_nest_lock();
> > the nest_lock is needed to avoid bumping the depth on every
> > mutex_trylock().
>
> Got a link to the ARM code in question ?

lock_all_vcpus() in arch/arm64/kvm/arm.c:

        lockdep_assert_held(&kvm->lock);
        kvm_for_each_vcpu(c, tmp_vcpu, kvm) {
                if (!mutex_trylock(&tmp_vcpu->mutex)) {
                        unlock_vcpus(kvm, c - 1);
                        return false;
                }
        }

> And I'm assuming you're talking about task_struct::lockdep_depth ?
> The nest lock annotation does not in fact increment depth beyond
> one of each type. It does a refcount like thing.

Yes, exactly - mutex_trylock_nest_lock() is needed so that the
code above counts per-lock instead of using the per-task depth.

Paolo


