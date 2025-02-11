Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E46EC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btgsMkB+KatSBhW2xvQ/HbfeImWKcXqMZC5wzTOtkqg=; b=Dp8NUjnFsE/lbMPCnpmYeaPgfz
	ohD2DbPCsDGL52CJKJZ1JLdegER+L1pT6rYQIu3lE8jzGOWiXMI8Q1Wtk+/YJiLfJkoZx1LGwR51I
	/TrtSWTO7icvrZH9UYq/S7+3hPA5NMHiXxbeDhxZ3Qu5kM4IOekVwHuEFKV8qud4jzIG2LYEt0td4
	2JUotX+yKjFetb+mesjrzoIWZGHWZhBSg7xSt2YL7iiFBrCwU3+2FdJnpszUsBQiDk2NDySwetnAC
	qnmPxCZsnhX5Ui1PKMlacanLAuXIen5rwl1US1K/vlxq7oe/MlJLMCnK+ysIPEESi6vrYrAWHHaBz
	YVEnn3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thnuL-00000003Qv7-3TJZ;
	Tue, 11 Feb 2025 10:54:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnh9-00000003Nxu-1M6D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 10:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739270445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=btgsMkB+KatSBhW2xvQ/HbfeImWKcXqMZC5wzTOtkqg=;
	b=ErD4E/RU1arsLGEYQdfZ5+w7z/KhLH5ynMEcM7nlnSg49gRVbMJ5bVJLxhKKzUhWjPdQ31
	qA4+ym/KEkSn2Upjl9Jg0XI//z6gsZ9F15PM5BEPR3eRih1QPpKa53z1/4P7S7QFtqcCdo
	JnUDqPkyb5rr3n4YS7qtP7byxiDV1z0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-rpGAuc-LNd-NOv0MGVGLCQ-1; Tue, 11 Feb 2025 05:40:44 -0500
X-MC-Unique: rpGAuc-LNd-NOv0MGVGLCQ-1
X-Mimecast-MFC-AGG-ID: rpGAuc-LNd-NOv0MGVGLCQ
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43933eb7e1dso19657345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 02:40:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270443; x=1739875243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btgsMkB+KatSBhW2xvQ/HbfeImWKcXqMZC5wzTOtkqg=;
        b=nXSw1qrqX4N4Uevy+3eXxawBVbU1StRdQSutrNVUKSIe4Hy2zuBY4E9oc9nYNBztAT
         5fqbZvL3Dtbg4FkjfOIlyQ2U2LAuFL3arDSTP7xbSMGXVyIGWuLWBTz1ybvqpVgeiRon
         VzG9Nh/Wkz7mzhvIL1M7BroPwfxmrwDo8O71sCaMYf8TRpQ/NTpzP8TluhktB4YfITp7
         wePWEcRWJa2Z+itGEYyCellweAFN30W6s9LSxW9B1BFuMIzLPgyieMWciyprrmtwZBYA
         Ak9tWuy1VaKhtdPRPVFQZnePwstewZicjph2rai+BsP1Ya9bpjiWMIxj/dtHFQ6OtkQ3
         M2iA==
X-Forwarded-Encrypted: i=1; AJvYcCWeybhzUs0E1bwtlgFtrsk8u5f4I/wd4x847EAGeWJiQLai22Co2Z4223IUCmgXc+pmF35viJpmAp5cTMDhoXfJ@lists.infradead.org
X-Gm-Message-State: AOJu0YysXpcXYvqolnWO5G01fIR/YC5yYzhD4rzqIs17Ay/cwqA6J4VS
	sv8GyvVLoBdAj0rO8rcefgcm79vlzZWRRAljwbmZ7hKsuKEH0gQuUQr9/rc5rjQGmOatoc0Y49b
	3+i+i+XWPWqOB8bm+cTKis0SFJ1kebapCDtP/jJ2ECiJe1RDy5yKjeHJkiTp5ejdVsn7WvnmwvI
	PE/klUb92McpZOm3oeuw0qstdPPkeqjLYciiBYiMfyYdoDLAo=
X-Gm-Gg: ASbGncu3vLSxp3pRvx7+YFym92PubvhIW3R5F4EwOqLxeCZbuBqgAhh4wdbIGZutK+Y
	7voYHnfsXYTl2UlUglaV5uo2SUePgWs2m2q8TnsE5Zf5L4CmVc1pnFSa3jkqd
X-Received: by 2002:a05:600c:c07:b0:439:4832:325f with SMTP id 5b1f17b1804b1-43948323427mr44529165e9.1.1739270442741;
        Tue, 11 Feb 2025 02:40:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGbumiPynQJLdfXR/hK61jc+qEpAs+mRfIkPjt8BvK5dw/XkyvYRl2OENNVY4nN2HiUviGg5p2QXMZIr5RQ2vU=
X-Received: by 2002:a05:600c:c07:b0:439:4832:325f with SMTP id
 5b1f17b1804b1-43948323427mr44528985e9.1.1739270442437; Tue, 11 Feb 2025
 02:40:42 -0800 (PST)
MIME-Version: 1.0
References: <20250211000917.166856-1-mlevitsk@redhat.com> <20250211000917.166856-3-mlevitsk@redhat.com>
 <87seok25qx.wl-maz@kernel.org>
In-Reply-To: <87seok25qx.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 11 Feb 2025 11:40:29 +0100
X-Gm-Features: AWEUYZnT1g0RdyJqMZtSUMcVn2SB8z3GSQjhvL_omNqa0pSFmSAU_EQ9poyWn3Q
Message-ID: <CABgObfa6DGM4X5HKb6FHoeiitTp4ddVaUGLRqK+Z=a-JLc9Bzw@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: switch to using kvm_lock/unlock_all_vcpus
To: Marc Zyngier <maz@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org, 
	Jing Zhang <jingzhangos@google.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	Ingo Molnar <mingo@redhat.com>, linux-riscv@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, kvmarm@lists.linux.dev, 
	Alexander Potapenko <glider@google.com>, x86@kernel.org, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Kunkun Jiang <jiangkunkun@huawei.com>, 
	Atish Patra <atishp@atishpatra.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3KLLS_bUWSyZCxgHu1KicmcDcOKoqbp79b1Js-dTw_0_1739270443
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_024047_427017_C76301E7 
X-CRM114-Status: GOOD (  26.77  )
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

On Tue, Feb 11, 2025 at 10:25=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrot=
e:
> > No functional change intended.
>
> Actually plenty of it.

Yes, definitely. That's not "no functional change intended", it's "no
breakage of sane userspace intended" which is pretty much the
opposite.

> Yet the new helper returns -EINTR, which you blindly forward to userspace=
.

It won't quite reach userspace, since the task won't survive
mutex_lock_killable(). With your current code the kill will arrive
just after the ioctl returns to userspace, so there's no change in
behavior there. The -EBUSY change is the one that matters.

> At the end of the day, the x86 locking serves completely different
> purposes. It wants to gracefully wait for vcpus to exit and is happy
> to replay things, because migration (which is what x86 seems to be
> using this for) is a stupidly long process.

No, it's not using it for the whole length of migration. It serves the
same exact purpose as ARM: do some stuff on something that spans a
whole struct kvm. The only difference is the behavior on contended
mutex, where x86 simply says don't do it.

> Our locking is designed to
> either succeed or fail quickly, because some of the lock paths are on
> the critical path for VM startup and configuration.

The only long-running vCPU ioctl is KVM_RUN and you don't have that
during VM startup and configuration. The interesting case is
snapshotting, i.e. reading attributes.

Failing quickly when reading attributes makes sense, and I'd be
rightly wary of changing it. I know that QEMU is doing them only when
it knows CPUs are stopped, but it does seem to affect crosvm and
Firecracker more, for snapshotting more than startup/configuration.
The GIC snapshotting code in crosvm returns an anyhow::Result and ends
up logging an error with println!, Firecracker is similar as it also
propagates the error. So neither crosvm nor Firecracker have
particularly sophisticated error handling but they do seem to want to
fail their RPCs quickly.

Failing quickly when creating the device or setting attributes makes
less sense (Firecracker for one does an unwrap() there). But anyhow
the change would have to be a separate patch, certainly not one
applied through the generic KVM tree; and if you decide that you're
stuck with it, that would be more than understandable.

> So for this series to be acceptable, you'd have to provide the same
> semantics. It is probably doable with a bit of macro magic, at the
> expense of readability.

Or it can be just an extra bool argument, plus wrappers.

For RISC-V it's only used at device creation time, and the ioctl fails
if the vCPU ran at least once. Removing the "try" in trylock is
totally feasible there, however it must be documented in the commit
message.

Thanks,

Paolo

> What I would also like to see is for this primitive to be usable with
> scoped_cond_guard(), which would make the code much more readable.


