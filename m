Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06184C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNgMEzj/bkHh3FbLjTA1Gzx4WhUWAp9E0GVBTQvYr0o=; b=b7dvl8Ks2iZUEobpiqLyXiyMKA
	aaA7OGwhAPWaFA0UzMNexkFQ9qfiMqWhc1yyMFPd4HowIsdpWcFnhO5sZtiUAi2tk981fWBOrCflw
	RsE+XKRT5yvnnW/W8e8aSf7ZC7Eq7r+SOzFcS/a+cdatT5shD//XbZNUL7iQ9zhPxbhbMaXB449eV
	P0puYoj0AgE91z2WyhANQ5uVJncmKqySkuMuKMWJW0CtmhL4/ss81TdJuvtXOPzlDMaRu7Gd0ftM2
	iI92tK/bdIUK2YmGudQ0NFZUeVjpbE+5Wn9aErqe2dA2v1ZlBzQMatB0BHV+0XvLH3CdDnqPthiBy
	zolDAoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lGe-0000000BNC7-35T6;
	Thu, 24 Sep 2026 15:21:48 +0000
Received: from out-24.mta0.migadu.com ([2001:41d0:1004:224b::18] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lGb-0000000BNBU-3jv6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:21:47 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=AvUxZyX/tO3G52TZtdDe5cDkHKT09asHJ5InA7+aTqk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790263303; v=1; x=1790868103;
 b=GkOYImNbF+n2IW7WcEp8Fhg8Y6DwjsxC9ie9Fsh4JusJtWWUEDNsb6vpt3nOt5QFlwYjHHh0
 rQeJsgfPqIZPuF2zmDmqqP8+hKZ3YWOjgt3RFtwbDNrkEeJCugEQe6G5qcH5HONtusilWL6/g8P
 Pnrxy3IqTN9QiN2JRm/DbcXk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 5f76bf1499d139fc;
	Thu, 24 Sep 2026 15:21:43 +0000
X-Mizu-Trace-ID: 5f76bf1499d139fc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso8285e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 08:21:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwfOXGZZ1Rxf2qoXOIFoKavAXxJLTHTenLxwJZSsMUamdYTfv7r15ihvskBBUthfW06T2DAty4wt8xUZZVJoyfr@lists.infradead.org
X-Gm-Message-State: AFuF++kV+o2KPF8yWCyIO8Sn9lcV7eQJq/0Scn78m3vRS1tmAthpzEsN
	opye0txrDu9c0wgthiTnyaGCG3w6FPPBQI5z20lvh+XdLAQ+kWInDGtpj0znjLT0vzAqoe5VCZT
	W2ePG+lJ0bYrm8PFu0aFviKjBJwJbG9vker10BIRw
X-Received: by 2002:a05:6512:238b:b0:5b8:d830:be30 with SMTP id
 2adb3069b0e04-5b8dda259a4mr187251e87.16.1790263298205; Thu, 24 Sep 2026
 08:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com> <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
 <arTfjgvZIhmXLrw1@willie-the-truck> <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
 <arUUCFHamX1nOrB1@willie-the-truck>
In-Reply-To: <arUUCFHamX1nOrB1@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 16:21:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyWDvVc4B0mF8+N3QJ=gVPGEY-pxPGZWuTLK6Y=PZnF1w@mail.gmail.com>
X-Gm-Features: AclHuK-Tr-CYuhyqLL3dKaG6eneOkpkAbwBzpQx--EX-XebKJ0QSmyPMwRUhQwc
Message-ID: <CA+EHjTyWDvVc4B0mF8+N3QJ=gVPGEY-pxPGZWuTLK6Y=PZnF1w@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
To: Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, maz@kernel.org, oupton@kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, catalin.marinas@arm.com, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082146_139467_966238BE 
X-CRM114-Status: GOOD (  33.27  )
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

Hi Will,

On Thu, 24 Sep 2026 13:14:00 +0100, Will Deacon <will@kernel.org> wrote:
[...]
> > It's not publishing data, it's handing reset_state back.
>
> What's the difference? The usual pattern for acquire/release is:
>
> <write data>
> <store-release flag>
>
> on one CPU and then on another:
>
> <load-acquire flag>     // If this reads from the release above...
> <read data>             // ... then this is guaranteed to read the written data
>
> That's a message-passing shape and you would normally say that the first
> CPU (the producer) is publishing the data to the other CPU (the consumer).
>
> Is this what is happening with the 'reset_state' (data) and the
> 'power_state' (flag)? If not, then what is the shape?

I don't think so, it's the other direction. That pattern is the pair
on reset_state.reset, and it isn't in question. The pair on
power_state, as I see it, runs the other way: the target's last
accesses to reset_state are its reads of the payload and its clear of
the flag in pkvm_reset_vcpu(), and the next CPU_ON's accesses are
stores. Release on OFF, acquire on the cmpxchg: unlock then lock, with
power_state as the lock word. The winner takes it with the cmpxchg,
hands it to the target through reset, and the target gives it up at
CPU_OFF. Nothing is published. What I was after is the winner's stores
being ordered after the target's reads and its clear.

> > The CPU_ON winner writes reset_state.{pc, r0, be}, then reset_state.reset
> > with a release. The target reads them and clears reset in pkvm_reset_vcpu()
> > on its next run
>
> By 'next run' you mean, at EL2 on the entry path into the guest following
> a successful CPU_ON operation?

Yes. The target's first __kvm_vcpu_run hypercall after the host's
kvm_psci_vcpu_on() has woken it. handle___kvm_vcpu_run() reads
power_state as ON_PENDING and calls pkvm_reset_vcpu() before entering
the guest.

> > and its CPU_OFF hands reset_state on to the next
> > CPU_ON. The release on OFF orders those reads and that clear before
> > OFF, and an acquire on the winner's cmpxchg orders its writes after
> > it: release on the way out, acquire on the way in, like a lock.
>
> That doesn't make sense to me, sorry. You're saying that the release
> store in the EL2 CPU_OFF hypercall handler is ordering stores that were
> made during the initial CPU_ON handling on that vCPU? Since then, we've
> been in and out of the guest. We really shouldn't need extra barriers to
> create order there.

The target's own accesses at its reset, its reads of the payload and
its clear of the flag. You're right that the hardware orders them:
__kvm_vcpu_run() runs dsb(nsh) before it restores the guest's state,
and since R24234 the NSH is only a TLBI/IC scope, so that DSB orders
the target's accesses before OFF for every PE. My reasoning for the
release and the acquire was that the protocol shouldn't rest on a
barrier that is there for the translation regime, that nothing
documents as ordering EL2 state for other CPUs, and that the LKMM,
having no dsb(), can't see: under the model the target's accesses and
the next winner's are unordered without them. Would you rather rely on
the world switch and say so at that dsb(nsh)?

> > Without the release, the target's clear of reset can become visible
> > after the next winner's reset = true, and the target's next
> > pkvm_reset_vcpu() then reads a clear flag and returns -ECANCELED,
> > leaving the vCPU stuck at ON_PENDING.
>
> This needs a litmus test because I can't see it myself. As above,
> CPU_OFF does not clear the reset state, so it's bizarre to put the
> release there.

I'd actually done that earlier.

The flag, under the LKMM (herd7 7.58 with mainline's tools/memory-model):

        C CPU_OFF-flag

        (*
         * P0, the target: its reset clears reset_state.reset, its
         * CPU_OFF stores power_state = OFF. P1, the next CPU_ON:
         * cmpxchg(OFF -> ON_PENDING), then a release of reset.
         * OFF=0 ON=1 ON_PENDING=2.
         *)

        {
                power_state = 1;
                reset = 1;
        }

        P0(int *power_state, int *reset)
        {
                *reset = 0;
                WRITE_ONCE(*power_state, 0);
        }

        P1(int *power_state, int *reset)
        {
                int r1;

                r1 = cmpxchg_relaxed(power_state, 0, 2);
                if (r1 == 0)
                        smp_store_release(reset, 1);
        }

        exists (1:r1=0 /\ reset=0)

As written: Sometimes, and a data race. With smp_store_release() for
the OFF store: Never. CPU_OFF doesn't touch reset_state, but its OFF
store is what a CPU_ON takes with the cmpxchg, so it seemed to me the
store the target's accesses should be ordered before.

> > and in pvm_psci_vcpu_on():
> >
> >         /*
> >          * vCPUs race to power on the same target. The acquire pairs with the
> >          * release of OFF in pvm_psci_vcpu_off(): the target's accesses to
> >          * reset_state in pkvm_reset_vcpu() precede the writes below.
> >          */
> >         power_state = cmpxchg_acquire(&target->power_state,
> >                                       PSCI_0_2_AFFINITY_LEVEL_OFF,
> >                                       PSCI_0_2_AFFINITY_LEVEL_ON_PENDING);
>
> This confused me more :( Why are you talking about accesses preceding an
> acquire? An acquire only orders later accesses.

Agreed, it reads as if the acquire ordered earlier accesses. For v4:

        /*
         * vCPUs race to power on the same target. The acquire orders the
         * writes below after the cmpxchg's read of OFF, and with the release
         * of OFF in pvm_psci_vcpu_off() that puts them after the target's
         * reads and clear of reset_state in pkvm_reset_vcpu().
         */

> I really think we need some litmus tests to understand the general ordering
> problems we have here before adding the memory barriers.

The other direction, the payload:

        C CPU_ON-payload

        (*
         * P0, the target: its reset reads reset_state.pc, its CPU_OFF
         * stores OFF with a release. P1, the next CPU_ON:
         * cmpxchg(OFF -> ON_PENDING), then a plain store to pc.
         * OFF=0 ON=1 ON_PENDING=2.
         *)

        {
                power_state = 1;
                pc = 0;
        }

        P0(int *power_state, int *pc)
        {
                int r0;

                r0 = *pc;
                smp_store_release(power_state, 0);
        }

        P1(int *power_state, int *pc)
        {
                int r1;

                r1 = cmpxchg_relaxed(power_state, 0, 2);
                if (r1 == 0)
                        *pc = 1;
        }

        exists (1:r1=0 /\ 0:r0=1)

As written: Sometimes, and a data race. With cmpxchg_acquire(): Never.
Those two are what's behind the release (v3) and the acquire (v4). The
rollback's ON_PENDING -> OFF cmpxchg in handle_pvm_entry_hvc64() has
the same pattern on the source side, so v4 makes it a release too.

My head is spinning now :)

Cheers,
/fuad

