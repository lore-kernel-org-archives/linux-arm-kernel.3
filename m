Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608E1CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vh5INOYQP0yft49aQssY02xWoFcMU1c5Sbi8TM6XaOs=; b=bnbM2kfMrssu463WTwv8xHonYi
	8RgUW6w6KQBtDnkOp2km1n++h3Rd6npDjqSgFxbU/f7J3HcAF7bNGbBSWCH5qOioo//IlPAkn54o+
	RC+MepPs6oLME1mUAHTwAGV2frfBfBZclffCuOHe6zAnnQF09ImPTlzHHv7YWxIIyAAr3CoeKvB30
	ZlP0A9wGHryc+UmKncIJFqNUAFl6iPrMBNca6zgJZx/GxYMkw3CR6gyKtgv1ljbhWuseobMzULUGS
	kbFit+242fR9GuXg1UceUUhjeiBq0KkDOcOdBgADkmZrFur4zmS63tL4Y9bEJ4B/rBWh6tfSxkDE1
	DBt9h9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cCv-0000000FvOR-1yz4;
	Tue, 14 Oct 2025 10:24:41 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cCs-0000000FvMt-3dsG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:24:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Vh5INOYQP0yft49aQssY02xWoFcMU1c5Sbi8TM6XaOs=;
	b=hXaF+0jQOjkFtklkuEbL1hYw5gbeFfcy1NuBfdw3AtRUhiDm3waPH4DatEgA00qRRQRshr3M5
	F0UGIm7xgjERcXLsOOqG+TM9VVO75MOAmgi7udzcYAvD6rSTp4048BaM6/CofJAKWAQRIt5CsbQ
	ogoJXCgVAcAIKVC7w5GSh0Y=
Received: from frasgout.his.huawei.com (unknown [172.18.146.37])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4cm9LZ45jWz1P6hl;
	Tue, 14 Oct 2025 18:24:22 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cm9HM1MZwz6GDQC;
	Tue, 14 Oct 2025 18:21:35 +0800 (CST)
Received: from dubpeml100006.china.huawei.com (unknown [7.214.145.132])
	by mail.maildlp.com (Postfix) with ESMTPS id A964414037D;
	Tue, 14 Oct 2025 18:24:24 +0800 (CST)
Received: from dubpeml500004.china.huawei.com (7.214.147.1) by
 dubpeml100006.china.huawei.com (7.214.145.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Oct 2025 11:24:24 +0100
Received: from dubpeml500004.china.huawei.com ([7.214.147.1]) by
 dubpeml500004.china.huawei.com ([7.214.147.1]) with mapi id 15.02.1544.011;
 Tue, 14 Oct 2025 11:24:24 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Marc Zyngier <maz@kernel.org>, Peter Maydell <peter.maydell@linaro.org>
CC: "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "will@kernel.org" <will@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "mark.rutland@arm.com"
	<mark.rutland@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "mst@redhat.com"
	<mst@redhat.com>, "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
	<philmd@linaro.org>, "ardb@kernel.org" <ardb@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"gustavo.romero@linaro.org" <gustavo.romero@linaro.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "darren@os.amperecomputing.com"
	<darren@os.amperecomputing.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>, "vishnu@os.amperecomputing.com"
	<vishnu@os.amperecomputing.com>, "gankulkarni@os.amperecomputing.com"
	<gankulkarni@os.amperecomputing.com>, "wangyanan (Y)"
	<wangyanan55@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>, Linuxarm
	<linuxarm@huawei.com>
Subject: RE: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
Thread-Topic: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
Thread-Index: AQHcOJEPLIyaftchIkq5VYDgYw17SLS5xPAAgAXz6gCAACTfAIAAYtoAgAD6VQCAADqV0A==
Date: Tue, 14 Oct 2025 10:24:23 +0000
Message-ID: <8b82541b805b4a9293f15740df73eaa8@huawei.com>
References: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
	<86v7koxk1z.wl-maz@kernel.org>
	<CAFEAcA8=yhQ-ygoA-fqxzwg69OkdW2nBM0O9X3Lmww4eXuVMWA@mail.gmail.com>
	<867bwzxe9r.wl-maz@kernel.org>
	<CAFEAcA8FhgcaM_OsHKB3+3Z7B_oZJqU4LHX_j9p-ZQrHfWGX7g@mail.gmail.com>
 <864is2x6z9.wl-maz@kernel.org>
In-Reply-To: <864is2x6z9.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.67.200]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_032439_646290_9180C737 
X-CRM114-Status: GOOD (  55.50  )
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

HI Marc,

> From: Marc Zyngier <maz@kernel.org>
> Sent: Tuesday, October 14, 2025 8:45 AM
> To: Peter Maydell <peter.maydell@linaro.org>
>=20
> On Mon, 13 Oct 2025 17:48:44 +0100,
> Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 13 Oct 2025 at 11:55, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Mon, 13 Oct 2025 09:42:58 +0100,
> > > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > >
> > > > On Thu, 9 Oct 2025 at 14:48, Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > On Wed, 08 Oct 2025 21:19:55 +0100, salil.mehta@opnsrc.net
> > > > > wrote:
> > > > > >
> > > > > > From: Salil Mehta <salil.mehta@huawei.com>
> > > > > >
> > > > > > [A rough illustration of the problem and the probable
> > > > > > solution]
> > > > > >
> > > > > > Userspace reads of ICC_CTLR_EL1 via KVM device attributes
> > > > > > currently takes a slow path that may acquire all vCPU locks.
> > > > > > Under workloads that exercise userspace PSCI CPU_ON flows or
> > > > > > frequent vCPU resets, this can cause vCPU lock contention in KV=
M
> and, in the worst cases, -EBUSY returns to userspace.
> > > > > >
> > > > > > When PSCI CPU_ON and CPU_OFF calls are handled entirely in
> > > > > > KVM, these operations are executed under KVM vCPU locks in the
> > > > > > host kernel (EL1) and appear atomic to other vCPU threads. In
> > > > > > this context, system register accesses are serialized under
> > > > > > KVM vCPU locks, ensuring atomicity with respect to other
> > > > > > vCPUs. After SMCCC filtering was introduced, PSCI CPU_ON and
> > > > > > CPU_OFF calls can now exit to userspace (QEMU). During the
> > > > > > handling of PSCI CPU_ON call in userspace, a
> > > > > > cpu_reset() is exerted which reads ICC_CTLR_EL1 through KVM
> > > > > > device attribute IOCTLs. To avoid transient inconsistency and
> > > > > > -EBUSY errors, QEMU is forced to pause all vCPUs before issuing
> these IOCTLs.
> > > > >
> > > > > I'm going to repeat in public what I already said in private.
> > > > >
> > > > > Why does QEMU need to know this? I don't see how this is related
> > > > > to PSCI, and outside of save/restore, there is no reason why
> > > > > QEMU should poke at this. If QEMU needs fixing, please fix QEMU.
> > > >
> > > > I don't know the background here, but generally speaking, when we
> > > > do a CPU reset that includes writing all the CPU state of the
> > > > "this is freshly reset from userspace's point of view" vcpu back
> > > > to the kernel. More generally, userspace should be able to read
> > > > and write sysregs for a vcpu any time it likes, and not
> > > > arbitrarily get back -EBUSY. What does the kernel expect userspace
> > > > to do with an errno like that?
> > >
> > > The main issue here is that GICv3 is modelled as a device, just like
> > > GICv2, and that all the sysregs that are relevant to the GIC have
> > > the same status as the MMIO registers: they can only be accessed
> > > when the vcpus are not running.
> > >
> > > These sysregs are not visible through the normal ONE_REG API, and
> > > therefore not subjected to the "do whatever you want" rule.
> >
> > Ah, I'd forgotten that. But the cpuif registers are still per-cpu, and
> > they do still need to be reset on vcpu reset, and that might still
> > happen for a single vcpu when the VM as a whole is still running.
> >
> > That said, QEMU's current code for this could be refactored to avoid
> > the reset-time read of ICC_CTLR_EL1 from the kernel.
> > We do this so we can set the userspace struct field for this register
> > to the right value. But we could ask the kernel for that value once on
> > VM startup since it's not going to change mid-run.
>=20
> The reset value is indeed cast in stone once the GIC has been created.
>=20
> > That would bring ICC_CTLR_EL1 into line with the other cpuif
> > registers, where QEMU assumes it knows what the kernel's reset value
> > of them is (mostly "0") and doesn't bother to ask.
> > This is different from how we handle ONE_REG sysregs, where I'm pretty
> > sure we do ask the kernel the value of all of them on a vcpu reset.
> > (And then write the values back again, which is a bit silly but
> > nobody's ever said it was a performance problem for them :-))
> >
> > > Should we have done something else when the GICv3 save/restore API
> > > was introduced and agreed upon with the QEMU people? Probably. Can
> > > we change it now? Probably not. The only thing we could relax is the
> > > scope of the lock when accessing a sysreg, so that we only mandate
> > > that the targeted vcpu is not running instead of the whole VM.
> > >
> > > And finally, if you object to this API, why should we do for GICv5,
> > > which is so far implemented by following the exact same principles?
> >
> > I don't object to the API inherently (I don't care whether we do these
> > register reads via a dev ioctl or something else, from userspace's
> > point of view it's just "do some syscall, get a value") -- I'm just
> > objecting to the kernel's implementation of it where it might return
> > EBUSY :-)
>=20
> To me, EBUSY has a clear meaning: you're otherwise using the resource, an=
d
> you need to relinquish it first, while EINVAL indicates that the kernel d=
oesn't
> understand what you want.
>=20
> As I said, I'm happy to look at reducing the locking to only the target v=
cpu in
> the case of a sysreg being accessed, but EBUSY will stay.


I forgot to mention that we also saw once the issue of -EBUSY happening whe=
n
userspace GICv3 ITS resets during guest reboot and it calls KVM_DEV_ARM_ITS=
_CTRL_RESET.

File: kvm/vgic/vgic-its.c

static int vgic_its_ctrl(struct kvm *kvm, struct vgic_its *its, u64 attr)
{
[...]
	mutex_lock(&kvm->lock);

	if (kvm_trylock_all_vcpus(kvm)) {
		mutex_unlock(&kvm->lock);
		return -EBUSY;
	}

	mutex_lock(&kvm->arch.config_lock);
	mutex_lock(&its->its_lock);

	switch (attr) {
	case KVM_DEV_ARM_ITS_CTRL_RESET:
		vgic_its_reset(kvm, its);
		break;
[...]
}


Best regards
Salil.

>=20
> >
> > (Also, if the kernel had failed EINVAL unconditionally for an attempt
> > to do this on a not-stopped VM then we'd probably have found this
> > mismatch in understanding about how the API should work years ago.
> > "Mostly works but sometimes fails EBUSY" is the worst of all worlds.)
> >
> > I haven't yet got as far as thinking about the KVM interface for GICv5
> > yet...
>=20
> I guess that for the time being, we'll assume that GICv3 is the reference=
.
>=20
> Thanks,
>=20
> 	M.
>=20
> --
> Without deviation from the norm, progress is not possible.

