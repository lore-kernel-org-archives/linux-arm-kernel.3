Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327CDCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 03:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2+vB/o5Z0HvxSwF1pxo/ZbmkiIAbTdDIfPLcr8sr0E=; b=3+/6LnBChFAXkri5gf3y5Ji2f8
	QnKJ06GiY67KRnrk4ckiadISW6ZsJL1b/SvHnjYkIZd3lRoFYkWPqRqRT1Ptqn86z9yDyUlGVNv5j
	XRqyurehIO3QtzqFS2Xv/JRMimn5sxfkbpSbElmtv6oXVRCFL7nXUtSZaCylxum9i/9fcrVEtawqP
	BS4V+bCzJEsMzT1lkeM+/1/iGmpfgVOLpnBmVIm437duzrQh2yC/KZ5cinFzr84Vf74aL94dybkGl
	dHrD3BpCEZjia9ntdBJSzfdIkVTxFTLIkTa6XpZMaKfY3vqPOkWDG1SpkiWwJqlIjWBa1gD1/xaLQ
	O+L8+QaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VJU-0000000F0mt-0tPV;
	Tue, 14 Oct 2025 03:03:00 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VJR-0000000F0mY-1YoA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 03:02:58 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-36f13d00674so3226678fac.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 20:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1760410976; x=1761015776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2+vB/o5Z0HvxSwF1pxo/ZbmkiIAbTdDIfPLcr8sr0E=;
        b=Gd2GQqVKk57Ub9pddSKIjBjfBoKn3rVKriD/pkewO34D5xsLWre+IW4PcxwbhqMlqJ
         bd9vkrjix9ZdCz8lr+uODY8KMhmxiZENwqlSq7ExK20hELO9hk8PJ7pG1aOIbWxaYyXH
         mdKRd1x/ivav5dNmKBykFaYuHz+Gny1YmcOKTxjVq6xM1ClPr+oqllY1As9+ZRlwX9wk
         5EK0XuKEMUrcld//npzZH66uFGXWrWENOGg3ntHBFhh9FOyQDOQZ7viSxYYfUJVqH31j
         YUnWHeEJ8R1/hb+RBiaFcGIS3nPnsfLQgDBw982epdeAzYPMZ+9WNO2v03HUYDsNsc9Q
         7VAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760410976; x=1761015776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2+vB/o5Z0HvxSwF1pxo/ZbmkiIAbTdDIfPLcr8sr0E=;
        b=bi261+ZAULzrQ/3vqTzoinBN0Bn0bbMWNAyf9p9zQCSa+R7shmNWvUhATd97wjnTkW
         rsRzvuACUeGEh6h9+uTEV2HUovOfW1jNKIhWCTZkEf851l8LAyZ0oOYKp4Q0ONo0gs30
         IsShRYUDgRLFhrUKuuBncMaXXRBdKRYi1vb6GIM/LFwdcmwigAQl5XXplkP/QOJGo4nr
         UyFtIoCbM/fpx/B/ZJjTAMlmA6AZmq8UF+oxF87+nxxZQiBAIbeQiYNvpvdcd3dFeVL8
         z8evVPC/E7+bG+2xwlNyhQTsOPCc6dAFsv0uDxq9rN538pa9IiXD8EIm2xYyfyTzyaRk
         U7TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLoKDJHocOvo2PYjUNoUAO9LY+Aq+SKsLJ5xCiIG310SoqHGgaJNsiIP26TgaE6ov4dRumA18ZQH++seGsPohz@lists.infradead.org
X-Gm-Message-State: AOJu0YzveJKuCYFnByZyykUCq+IWVh7/ce9OpOveKpC5Oh8CDVy4Hkz4
	9YanaCafZI+Cm4Qqqu2HrOVUpGyLU9iVVptiFH2Q0+XdtFKL/1ZlR/COi3BvZBXpdJuWcY0eLT9
	RQfrFQZ+tpR5ypV3pfsxwWwKc65AQAxo2vLe9PshYy3829MyEdCw6dgqXBWbP
X-Gm-Gg: ASbGncvjCZZzx1ODj4flNdcvLHv0C+nVDmapPKU7FNs/XRLvowCH0xd68sZXZqtUvjY
	lz0ueyDxtxdbi8bbp1Onr3qSTl5JxAWpXKuNexWDW1ea7NY+CqMVq8MlSlq+NFsbQRXRllMTwGi
	2P6vBWzZ7py52w3gl2U8UTs9a32vWBO95oWZaV0X2gnF4v1KcD9PSb74NpzrHkc/8cQ9xqWoDOf
	0337lAJl4SP2WLPaaCpsHRS/5Dyqz+3yy95XzQJOdppbbvxdGm+8oWsB6ZqpHQObVKxGX5FFm3J
	1WDBZHa+4XiDtiYuxtBzE7jcxyfp
X-Google-Smtp-Source: AGHT+IFuo9BWRk6hYpcALRtWhZkhOZuiJf6QVGwEIxc2I01tkH6J6hjL6coCCzYE7o+uwNX4Z00eSk3vCmxMBTvNOjk=
X-Received: by 2002:a05:6870:e38b:b0:322:2712:c89d with SMTP id
 586e51a60fabf-3c0f66f6f29mr9665301fac.11.1760410975986; Mon, 13 Oct 2025
 20:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251008201955.3919537-1-salil.mehta@opnsrc.net>
 <86v7koxk1z.wl-maz@kernel.org> <CAFEAcA8=yhQ-ygoA-fqxzwg69OkdW2nBM0O9X3Lmww4eXuVMWA@mail.gmail.com>
 <867bwzxe9r.wl-maz@kernel.org> <CAFEAcA8FhgcaM_OsHKB3+3Z7B_oZJqU4LHX_j9p-ZQrHfWGX7g@mail.gmail.com>
In-Reply-To: <CAFEAcA8FhgcaM_OsHKB3+3Z7B_oZJqU4LHX_j9p-ZQrHfWGX7g@mail.gmail.com>
From: Salil Mehta <salil.mehta@opnsrc.net>
Date: Tue, 14 Oct 2025 03:02:44 +0000
X-Gm-Features: AS18NWCHVyfmTyyU2mlQmmXG_PQvjHWpMLxJ42vucNDZHSZthXnK7-j7Wv1f-mw
Message-ID: <CAJ7pxebGOj5Z1iW6VPjzj73eY1hZFjS5uXMkee8XCm09DtFcKQ@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: arm64: vgic-v3: Cache ICC_CTLR_EL1 and allow
 lockless read when ready
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_200257_549533_0B85B2F9 
X-CRM114-Status: GOOD (  50.84  )
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

Hi Peter

On Mon, Oct 13, 2025 at 4:48=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> On Mon, 13 Oct 2025 at 11:55, Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Mon, 13 Oct 2025 09:42:58 +0100,
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > On Thu, 9 Oct 2025 at 14:48, Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On Wed, 08 Oct 2025 21:19:55 +0100,
> > > > salil.mehta@opnsrc.net wrote:
> > > > >
> > > > > From: Salil Mehta <salil.mehta@huawei.com>
> > > > >
> > > > > [A rough illustration of the problem and the probable solution]
> > > > >
> > > > > Userspace reads of ICC_CTLR_EL1 via KVM device attributes current=
ly takes a slow
> > > > > path that may acquire all vCPU locks. Under workloads that exerci=
se userspace
> > > > > PSCI CPU_ON flows or frequent vCPU resets, this can cause vCPU lo=
ck contention
> > > > > in KVM and, in the worst cases, -EBUSY returns to userspace.
> > > > >
> > > > > When PSCI CPU_ON and CPU_OFF calls are handled entirely in KVM, t=
hese operations
> > > > > are executed under KVM vCPU locks in the host kernel (EL1) and ap=
pear atomic to
> > > > > other vCPU threads. In this context, system register accesses are=
 serialized
> > > > > under KVM vCPU locks, ensuring atomicity with respect to other vC=
PUs. After
> > > > > SMCCC filtering was introduced, PSCI CPU_ON and CPU_OFF calls can=
 now exit to
> > > > > userspace (QEMU). During the handling of PSCI CPU_ON call in user=
space, a
> > > > > cpu_reset() is exerted which reads ICC_CTLR_EL1 through KVM devic=
e attribute
> > > > > IOCTLs. To avoid transient inconsistency and -EBUSY errors, QEMU =
is forced to
> > > > > pause all vCPUs before issuing these IOCTLs.
> > > >
> > > > I'm going to repeat in public what I already said in private.
> > > >
> > > > Why does QEMU need to know this? I don't see how this is related to
> > > > PSCI, and outside of save/restore, there is no reason why QEMU shou=
ld
> > > > poke at this. If QEMU needs fixing, please fix QEMU.
> > >
> > > I don't know the background here, but generally speaking,
> > > when we do a CPU reset that includes writing all the CPU state
> > > of the "this is freshly reset from userspace's point of view" vcpu
> > > back to the kernel. More generally, userspace should be able to
> > > read and write sysregs for a vcpu any time it likes, and not
> > > arbitrarily get back -EBUSY. What does the kernel expect
> > > userspace to do with an errno like that?
> >
> > The main issue here is that GICv3 is modelled as a device, just like
> > GICv2, and that all the sysregs that are relevant to the GIC have the
> > same status as the MMIO registers: they can only be accessed when the
> > vcpus are not running.
> >
> > These sysregs are not visible through the normal ONE_REG API, and
> > therefore not subjected to the "do whatever you want" rule.
>
> Ah, I'd forgotten that. But the cpuif registers are still
> per-cpu, and they do still need to be reset on vcpu reset,
> and that might still happen for a single vcpu when the VM
> as a whole is still running.
>
> That said, QEMU's current code for this could be refactored
> to avoid the reset-time read of ICC_CTLR_EL1 from the kernel.
> We do this so we can set the userspace struct field for this
> register to the right value. But we could ask the kernel for
> that value once on VM startup since it's not going to change mid-run.
>
> That would bring ICC_CTLR_EL1 into line with the other cpuif
> registers, where QEMU assumes it knows what the kernel's
> reset value of them is (mostly "0") and doesn't bother to ask.
> This is different from how we handle ONE_REG sysregs, where
> I'm pretty sure we do ask the kernel the value of all of them
> on a vcpu reset. (And then write the values back again, which
> is a bit silly but nobody's ever said it was a performance
> problem for them :-))


This is effectively what the mentioned patch in the commit-log is doing.
Pasting here again:

https://lore.kernel.org/qemu-devel/20251001010127.3092631-22-salil.mehta@op=
nsrc.net/

Can this patch be accepted independently then?


>
> > Should we have done something else when the GICv3 save/restore API was
> > introduced and agreed upon with the QEMU people? Probably. Can we
> > change it now? Probably not. The only thing we could relax is the
> > scope of the lock when accessing a sysreg, so that we only mandate
> > that the targeted vcpu is not running instead of the whole VM.
> >
> > And finally, if you object to this API, why should we do for GICv5,
> > which is so far implemented by following the exact same principles?
>
> I don't object to the API inherently (I don't care whether we
> do these register reads via a dev ioctl or something else,
> from userspace's point of view it's just "do some syscall,
> get a value") -- I'm just objecting to the kernel's
> implementation of it where it might return EBUSY :-)
>
> (Also, if the kernel had failed EINVAL unconditionally for
> an attempt to do this on a not-stopped VM then we'd probably
> have found this mismatch in understanding about how the
> API should work years ago. "Mostly works but sometimes fails
> EBUSY" is the worst of all worlds.)
>
> I haven't yet got as far as thinking about the KVM interface
> for GICv5 yet...
>
> -- PMM

