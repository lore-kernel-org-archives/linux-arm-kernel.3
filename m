Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2EDCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6lzTshIWy3JM+cSfZr7xkLn0E7l8XLqxjY9wcBsXSk=; b=sWXuhCXPmI4gyQi6gO6tWRVwZk
	6mtPg9H9nIYwnirCSoxGoHGtEwQ7PRKs5KUU6khUwidwYaprvjZuoxiQsw37A86A+NDEkz1TXsJ/d
	RzgQCN86brCngblD7VevHFpwJpBQ12GyVj9z0/s94nTF6K5aJN0y8s/qpbg7EAqJWLYU7Ngts2VIg
	O2L+/LHVp/YHocZZYjXp/WmZ5rbvASWlCJPjenqrvfJ5dxh4W3pQpTDcV/cCe/TxFHJ6MwV9gwd7y
	e+nnUQAI26FN84cT0tdQ2PS8Nqct7s7Js98cOMw+x0ok/iNGpD4Mnjx/0+su7uC958ctMFtLcIbGy
	A7fZ5hAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LjI-0000000Dv88-0FEF;
	Mon, 13 Oct 2025 16:49:00 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LjF-0000000Dv7O-3aFw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 16:48:59 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-71d5fb5e34cso61507857b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 09:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760374137; x=1760978937; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6lzTshIWy3JM+cSfZr7xkLn0E7l8XLqxjY9wcBsXSk=;
        b=RTtyq26kvZlR/MkfUieeeyHCedFFRKEI5bbWrR1uaJbIdR8EUHQ7QXK7cRUszqzLIx
         rbf80TAhUrhrzw/Udjy0mfb02lmPwNoyxEiKLfNLAjXmD5a24ncvc02BsHVpPsTfqnX2
         cmDXnwcjv0iy+PEhfeXsn4NBPcYkdLzDcat0SYW3g9OX9+aUKkbNDIhCALERMWFWar30
         wfRcf0wUMKVW6JW4BOEUCYI0KXtnat947ja6fz1ossoyr3kJSBg7odDcFbV5X3N04Xkr
         /XqedtUA1loXLMAfdX5YQTVLA+GGA42aVHe/qrDPeVFKKMIYMRAksYJI9u0+yAOufdPa
         kcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760374137; x=1760978937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6lzTshIWy3JM+cSfZr7xkLn0E7l8XLqxjY9wcBsXSk=;
        b=OZRmwFDGG7sjuAsHFPDy2WU2nhsb568dURmmEDCq9B20gi+9IcWFFKIJhG+jXzwTuA
         56w1CP1uVqDYM5gdUme6Mnx1Cz+nSaddgN0+RhCkBgMnVdwv+9KqzXD6cDoTNYj5xUgf
         rOMTmfAVlJIltcV07GrVwxiAedgBB7dIDiUWV0FXXbx+NHAsPeX1p/WyJM/z0zR9hOCI
         nyR9dF6Mz7Poc4ARPN9Pvi1sgUEMmG5U1Q6kFMDv7NTFBnOoPNXTk10r64OAJ9QiXAdN
         S0Lm1Q0MBR93eGyXkCwaUzhzDQehmDJXDwJIF7CDTQKjNox5aTNbfiOzMczzxvsA9ugz
         pbmA==
X-Forwarded-Encrypted: i=1; AJvYcCVXlgAUGT7623JhWet1yonWSI8Ygx3UPHOM3g8k8aqZ+TKyr2R8nxPYoPAqIg4YAVbQBLH1PN64Pp4XxkESE2eF@lists.infradead.org
X-Gm-Message-State: AOJu0YwInZiFJ6ft37gdgst0NrdjxH/oTMz/eEvT4boCYQ4gmKal7YON
	56cuYa2hvIcfQQAWV7FlfkhICMoyWK9JXRdElGHb1DxnEC9FBYGrDgn7nRetCQSs1Vt90HoIxKy
	w9dYnDAfGCjqvz3x1IOp/twwfNXJm/PGpPHghMz+Ygw==
X-Gm-Gg: ASbGncv7yQXOGFqopTUnjVj9xCXu+1rhBIjQU6NglePFWB0bVBtcc7ONyuHYzeUTIhg
	O1P5MiJStx7PJHcZY/B8tXyiZYechQjnS7V4kdYfyZUn/cYHA286seifkXnO/bfyE9jTrGHc6x5
	tfWvSiQkfMt5HX8T5JmtGIHNwqziklEsD4xiirdz7wBM8j+dXSDyLKG3KN9IUK+Z7EWsEEYt6mi
	buZjBfCB4GO6oFgVNB5acSCAAtSMkZeMNeXH5WRmw==
X-Google-Smtp-Source: AGHT+IHqmHzAaVDHnow33cvgGG6Z5YF743Jj5ieEa2OjQWYWO3V5SRTF9BXUMfG7UGOBqyiISijlbKOAc4g+hB8SDas=
X-Received: by 2002:a53:ca52:0:b0:63c:dd26:34e with SMTP id
 956f58d0204a3-63cdd260c73mr10670160d50.21.1760374136718; Mon, 13 Oct 2025
 09:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
 <86v7koxk1z.wl-maz@kernel.org> <CAFEAcA8=yhQ-ygoA-fqxzwg69OkdW2nBM0O9X3Lmww4eXuVMWA@mail.gmail.com>
 <867bwzxe9r.wl-maz@kernel.org>
In-Reply-To: <867bwzxe9r.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Oct 2025 17:48:44 +0100
X-Gm-Features: AS18NWCAS9w1mC8fOxNHNg9CQTZ_Zo0jkRVSjMdF_vJRpxD-dkzMerf3nH7E2I4
Message-ID: <CAFEAcA8FhgcaM_OsHKB3+3Z7B_oZJqU4LHX_j9p-ZQrHfWGX7g@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
To: Marc Zyngier <maz@kernel.org>
Cc: salil.mehta@opnsrc.net, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, salil.mehta@huawei.com, 
	jonathan.cameron@huawei.com, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, james.morse@arm.com, sudeep.holla@arm.com, 
	lpieralisi@kernel.org, jean-philippe@linaro.org, tglx@linutronix.de, 
	oliver.upton@linux.dev, richard.henderson@linaro.org, andrew.jones@linux.dev, 
	mst@redhat.com, david@redhat.com, philmd@linaro.org, ardb@kernel.org, 
	borntraeger@linux.ibm.com, alex.bennee@linaro.org, gustavo.romero@linaro.org, 
	npiggin@gmail.com, linux@armlinux.org.uk, karl.heubaum@oracle.com, 
	miguel.luis@oracle.com, darren@os.amperecomputing.com, 
	ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com, 
	gankulkarni@os.amperecomputing.com, wangyanan55@huawei.com, 
	wangzhou1@hisilicon.com, linuxarm@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_094857_918845_10CD2529 
X-CRM114-Status: GOOD (  43.74  )
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

On Mon, 13 Oct 2025 at 11:55, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 13 Oct 2025 09:42:58 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Thu, 9 Oct 2025 at 14:48, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Wed, 08 Oct 2025 21:19:55 +0100,
> > > salil.mehta@opnsrc.net wrote:
> > > >
> > > > From: Salil Mehta <salil.mehta@huawei.com>
> > > >
> > > > [A rough illustration of the problem and the probable solution]
> > > >
> > > > Userspace reads of ICC_CTLR_EL1 via KVM device attributes currently takes a slow
> > > > path that may acquire all vCPU locks. Under workloads that exercise userspace
> > > > PSCI CPU_ON flows or frequent vCPU resets, this can cause vCPU lock contention
> > > > in KVM and, in the worst cases, -EBUSY returns to userspace.
> > > >
> > > > When PSCI CPU_ON and CPU_OFF calls are handled entirely in KVM, these operations
> > > > are executed under KVM vCPU locks in the host kernel (EL1) and appear atomic to
> > > > other vCPU threads. In this context, system register accesses are serialized
> > > > under KVM vCPU locks, ensuring atomicity with respect to other vCPUs. After
> > > > SMCCC filtering was introduced, PSCI CPU_ON and CPU_OFF calls can now exit to
> > > > userspace (QEMU). During the handling of PSCI CPU_ON call in userspace, a
> > > > cpu_reset() is exerted which reads ICC_CTLR_EL1 through KVM device attribute
> > > > IOCTLs. To avoid transient inconsistency and -EBUSY errors, QEMU is forced to
> > > > pause all vCPUs before issuing these IOCTLs.
> > >
> > > I'm going to repeat in public what I already said in private.
> > >
> > > Why does QEMU need to know this? I don't see how this is related to
> > > PSCI, and outside of save/restore, there is no reason why QEMU should
> > > poke at this. If QEMU needs fixing, please fix QEMU.
> >
> > I don't know the background here, but generally speaking,
> > when we do a CPU reset that includes writing all the CPU state
> > of the "this is freshly reset from userspace's point of view" vcpu
> > back to the kernel. More generally, userspace should be able to
> > read and write sysregs for a vcpu any time it likes, and not
> > arbitrarily get back -EBUSY. What does the kernel expect
> > userspace to do with an errno like that?
>
> The main issue here is that GICv3 is modelled as a device, just like
> GICv2, and that all the sysregs that are relevant to the GIC have the
> same status as the MMIO registers: they can only be accessed when the
> vcpus are not running.
>
> These sysregs are not visible through the normal ONE_REG API, and
> therefore not subjected to the "do whatever you want" rule.

Ah, I'd forgotten that. But the cpuif registers are still
per-cpu, and they do still need to be reset on vcpu reset,
and that might still happen for a single vcpu when the VM
as a whole is still running.

That said, QEMU's current code for this could be refactored
to avoid the reset-time read of ICC_CTLR_EL1 from the kernel.
We do this so we can set the userspace struct field for this
register to the right value. But we could ask the kernel for
that value once on VM startup since it's not going to change mid-run.

That would bring ICC_CTLR_EL1 into line with the other cpuif
registers, where QEMU assumes it knows what the kernel's
reset value of them is (mostly "0") and doesn't bother to ask.
This is different from how we handle ONE_REG sysregs, where
I'm pretty sure we do ask the kernel the value of all of them
on a vcpu reset. (And then write the values back again, which
is a bit silly but nobody's ever said it was a performance
problem for them :-))

> Should we have done something else when the GICv3 save/restore API was
> introduced and agreed upon with the QEMU people? Probably. Can we
> change it now? Probably not. The only thing we could relax is the
> scope of the lock when accessing a sysreg, so that we only mandate
> that the targeted vcpu is not running instead of the whole VM.
>
> And finally, if you object to this API, why should we do for GICv5,
> which is so far implemented by following the exact same principles?

I don't object to the API inherently (I don't care whether we
do these register reads via a dev ioctl or something else,
from userspace's point of view it's just "do some syscall,
get a value") -- I'm just objecting to the kernel's
implementation of it where it might return EBUSY :-)

(Also, if the kernel had failed EINVAL unconditionally for
an attempt to do this on a not-stopped VM then we'd probably
have found this mismatch in understanding about how the
API should work years ago. "Mostly works but sometimes fails
EBUSY" is the worst of all worlds.)

I haven't yet got as far as thinking about the KVM interface
for GICv5 yet...

-- PMM

