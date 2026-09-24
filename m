Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5B6C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nDxhpMOKvdVQ7X7kvq6knNuDGUYquT/1uDI3aMIFxs=; b=lnCUEhB3GZQ/4Jp7gqjjvRE0fw
	Gk87PPC244Fc9Vq5bjJLUhhm7tk+qA5zla2su3nhz32QEgtzRVXjNCYicWFFsQ2wU9siMt6XPsHYg
	dJ1ydK0v1sQlxDjCWQmwImhd1+5uVu97B7GOca8yWT1oZHXcVd/OxjpgLt8CSh88UQGvHHkxZORaP
	5AbVGSK2W+mEo0TPNPnRACAxwPB0PJDnA8LqItVpacCI1a6J9C6GGCNp74AQ9MFiGcvERLbHwy7Ny
	nSzjVO7nRv6+HG6KH6BRes4l3OLnJEyhjFseKtWoP/eZ4CrcbjR1P7gV6J4ntzZQRfVhQ5G6lv1oL
	L+M0mLJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hbb-0000000ArkP-0U6D;
	Thu, 24 Sep 2026 11:27:11 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hbY-0000000ArjU-1yW5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:27:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vM7qYu7LAwhbZJOe7T9pvZD37cQZuLfJB1bE3sYOHBs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790249226; v=1; x=1790854026;
 b=Xkl+zHUBI182iO+sdew9MfCtVzbU+HMaWf2X/q3wY1/wSAtkogIFc8Jc8FiHlJn3mxVTCiIl
 091iUYXk/V+tmh9yNevvup49ibHB4L8t2KrmdYlu/AarfvoTQLAFyK6dX8q8Gm4tsSSqwszK64l
 CpWypaHFluoiEXhDWU2wRe9U=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b13762195ab12c15;
	Thu, 24 Sep 2026 11:27:06 +0000
X-Mizu-Trace-ID: b13762195ab12c15
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b83c1421ecso5729e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:27:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxBVr1ZrtY4cKmP4bEzOahcKFXOW4tLDjNzgQR8s8iZuDyPJDs6TYJskTSlj7GEFr4CKpCAs6d0v8cOjyarBwfM@lists.infradead.org
X-Gm-Message-State: AFuF++n1Mx++R9/rkiHYPPA8zfzjOPCPmSn9V6BQL/H7DIAYbtYIiBiO
	HRXZxKXpci1DIcs6etmeiV3Cw9fWXawgQ+d/z/J0cnZ+IPUD2JMGeD5sW4Cq1PUWwHm4imL5Rhl
	YWt7/szQWMRBlkexk7mYNonCpISsWsTbLfxKrXYHz
X-Received: by 2002:a05:6512:3052:b0:5b1:ca0b:25d2 with SMTP id
 2adb3069b0e04-5b8dd9eff6fmr157966e87.4.1790249221398; Thu, 24 Sep 2026
 04:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-11-fuad.tabba@linux.dev>
 <arK1tHUEJsCQEKzn@google.com> <CA+EHjTx+foVF4CRU5D8bQv8bAqDphMN12UrV+_doUryn2ow6bg@mail.gmail.com>
 <arTfjgvZIhmXLrw1@willie-the-truck>
In-Reply-To: <arTfjgvZIhmXLrw1@willie-the-truck>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 24 Sep 2026 12:26:25 +0100
X-Gmail-Original-Message-ID: <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
X-Gm-Features: AclHuK-lEBftn5qqqH_UN8dVLgif6IiC-dIf778GSBKFjS0hWK4r3fOERPhGRzc
Message-ID: <CA+EHjTxe0JE-tCX4YcEEafdnxjuZLj3EBucZfZF0HCP2PQAekg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260924_042709_034909_4C1CAED6 
X-CRM114-Status: GOOD (  19.17  )
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

On Thu, 24 Sep 2026 09:30:06 +0100, Will Deacon <will@kernel.org> wrote:
[...]
> Sorry, but I'm really confused by this and it appears to be different to
> what we've got in Android as well. Why do we need release semantics for
> the store to 'hyp_vcpu->power_state' in pvm_psci_vcpu_off()? What is it
> that we are publishing here? The comment talks about pkvm_reset_vcpu(),
> but how is that relevant to the vCPU _off_ path? You say the comment is
> wrong, but what _should_ it say?
>
> I'm a bit baffled!

It's not publishing data, it's handing reset_state back. The CPU_ON
winner writes reset_state.{pc, r0, be}, then reset_state.reset with a
release. The target reads them and clears reset in pkvm_reset_vcpu()
on its next run, and its CPU_OFF hands reset_state on to the next
CPU_ON. The release on OFF orders those reads and that clear before
OFF, and an acquire on the winner's cmpxchg orders its writes after
it: release on the way out, acquire on the way in, like a lock.
Without the release, the target's clear of reset can become visible
after the next winner's reset = true, and the target's next
pkvm_reset_vcpu() then reads a clear flag and returns -ECANCELED,
leaving the vCPU stuck at ON_PENDING.

The comment described the flag ordering, which holds through the
winner's release on reset even with a relaxed cmpxchg, and named the
cmpxchg as its pair when the cmpxchg wasn't an acquire. The acquire is
for the winner's plain writes of pc/r0/be: nothing else orders them
after the target's reads. v4 has cmpxchg_acquire() and the two
comments name what's ordered and each other:

        /*
         * Orders pkvm_reset_vcpu()'s accesses to reset_state before OFF. Pairs
         * with the acquire cmpxchg in pvm_psci_vcpu_on().
         */
        smp_store_release(&hyp_vcpu->power_state, PSCI_0_2_AFFINITY_LEVEL_OFF);

and in pvm_psci_vcpu_on():

        /*
         * vCPUs race to power on the same target. The acquire pairs with the
         * release of OFF in pvm_psci_vcpu_off(): the target's accesses to
         * reset_state in pkvm_reset_vcpu() precede the writes below.
         */
        power_state = cmpxchg_acquire(&target->power_state,
                                      PSCI_0_2_AFFINITY_LEVEL_OFF,
                                      PSCI_0_2_AFFINITY_LEVEL_ON_PENDING);

Android has neither end (a WRITE_ONCE() of OFF and a relaxed cmpxchg),
so it has the lost flag above and the data race on pc/r0/be. Both stay
within the guest's own target vCPU, so I haven't treated it as urgent.
I'm working on a fix for Android separately.

Cheers,
/fuad

