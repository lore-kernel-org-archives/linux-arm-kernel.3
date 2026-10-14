Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CFFC3DA7A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 16:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BErtQRFzc28J9pgEsMybjJSr+36WI01qEf+DOn7B0yY=; b=xk5Ojup9BDrRTxYj3ArEIeSQLE
	0154DkceADed6gZmVRB+boxC1bc4VG27IZkSg19gtEHg/hcNDuWQMEvp0yktj/vB+JocjsILkH4iX
	PKUfoQvdxhF21TPNjJ9rp6gZCCDdTUwJxghGcP34HGMTJroO4FlMR2haVxrXfKw9kq1lYcJP4/+go
	GbknHop6oefyBUycF3+NzbgtFN2/G3Y8lK8i0CqyfZ358x9CsjCJEwIrfWC8V8uBEv/nqYsZS7obh
	vUhGEPUZEp+UounXVNu6LW7Y5XyKhHyfCZTbrD5aaoTViqs2IABkNGJwJfC2vXByxZd3ThLENIdBc
	a/Jie85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2Db-0000000G2HJ-1iPl;
	Wed, 14 Oct 2026 16:52:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH2Da-0000000G2H9-0YPg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 16:52:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6596B4052F;
	Wed, 14 Oct 2026 16:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8F31F000C4;
	Wed, 14 Oct 2026 16:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791996761;
	bh=BErtQRFzc28J9pgEsMybjJSr+36WI01qEf+DOn7B0yY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hCywxsXEnPJlW+x8oGO5bEkYhy/yOq8plTJdsB44Sap2xa56QGln2WFxIZc6Elx1s
	 ZKrksgpt0yydUNxA6GcjXvQpOUZEEitKC3XZm6Qts1u4LNogdBfiFu4LlRffDDxM41
	 K2ARXU7WXn/urGAZ3iabW+BLR2g8+e+v2mGbKAmGOjvnWScKOC3r1zmudq6z3HBQcy
	 jHRXJlgXUjiJEWadUB9Pwm0rMDnysoI4DKGrzvMODkbFqAVZwDz0+eFaiZDCfHygOn
	 BWq/e5sjNRHM/PEJwfnrdLl/2uPNgRMGhwIGGexw+tXQafsQ/NULK1+7OCYP+auPqb
	 rRcJaLdflEPtw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xH2DW-00000002xcC-2Y10;
	Wed, 14 Oct 2026 16:52:38 +0000
Date: Wed, 14 Oct 2026 17:52:37 +0100
Message-ID: <86qzhs1ay2.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Amit Machhiwal <amachhiw@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Colton Lewis <coltonlewis@google.com>,
	Eric Auger <eauger@redhat.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gautam Menghani <gautam@linux.ibm.com>,
	Gavin Shan <gshan@redhat.com>,
	Gokul K <gokul02k@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Hiroyuki Katsura <hk590@cam.ac.uk>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Jack Thomson <jackabt@amazon.com>,
	Jiaqi Yan <jiaqiyan@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Jonathan Davies <jonathan.davies@nutanix.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Leonardo Bras <leo.bras@arm.com>,
	Like Xu <likexu@tencent.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
	Oliver Upton <oupton@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Sebastian Ott <sebott@redhat.com>,
	Shen Yongchao <grayhat@foxmail.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Stefan Teodorescu <fane@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Will Deacon <will@kernel.org>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: Re: [GIT PULL] KVM/arm64 updates for Linux 7.4
In-Reply-To: <CABgObfYVHtFGopM=vCY2vt2N-CON=_5BN4YFiZknwvyrgP5mfw@mail.gmail.com>
References: <20261014162126.964330-1-maz@kernel.org>
	<CABgObfYVHtFGopM=vCY2vt2N-CON=_5BN4YFiZknwvyrgP5mfw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, amachhiw@linux.ibm.com, catalin.marinas@arm.com, coltonlewis@google.com, eauger@redhat.com, fuad.tabba@linux.dev, gautam@linux.ibm.com, gshan@redhat.com, gokul02k@gmail.com, hemanth.selam@gmail.com, hk590@cam.ac.uk, itaru.kitayama@fujitsu.com, jackabt@amazon.com, jiaqiyan@google.com, joey.gouly@arm.com, jonathan.cameron@oss.qualcomm.com, jonathan.davies@nutanix.com, kmehltretter@gmail.com, leo.bras@arm.com, likexu@tencent.com, ljs@kernel.org, broonie@kernel.org, nsg@linux.ibm.com, oupton@kernel.org, rdunlap@infradead.org, sascha.bischoff@arm.com, seanjc@google.com, sebastianene@google.com, sebott@redhat.com, grayhat@foxmail.com, xueshuai@linux.alibaba.com, fane@google.com, seiden@linux.ibm.com, steven.price@arm.com, rostedt@goodmis.org, suzuki.poulose@arm.com, tharitt97@gmail.com, vdonnefort@google.com, wanghan@linux.alibaba.com, weilin.chang@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, zenghui.yu@linux.dev, yuzenghui@huawei.com, kvmarm
 @lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Wed, 14 Oct 2026 17:30:50 +0100,
Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> On Wed, Oct 14, 2026 at 6:21=E2=80=AFPM Marc Zyngier <maz@kernel.org> wro=
te:
> >
> > Paolo,
> >
> > Here's the set of KVM/arm64 updates for 7.4. After a couple of
> > releases mostly focused on mopping the AI wave, we're back to merging
> > new code, and there is a lot of it. Given the size and the conflicts
> > that this generates (see below), I've decided to send the pull request
> > early.
> >
> > Details are as usual in the tag below, but there is a few things to
> > call out:
> >
> > - a lot of pKVM updates, finally delivering on the isolation promises,
> >   thanks to Fuad's work on upstreaming this stuff.
> >
> > - the first stab at sharing code with s390... More fun to come, but
> >   that's a start
> >
> > - More GICv5 code. As always with the GIC, it is huge... But for once,
> >   the code is much simpler than the previous iterations, and also
> >   comes with a bunch of selftests from the beginning.
> >
> > As a consequence, the diffstat is a gold-plated pig.
> >
> > Things to note:
> >
> > - this drags the kvmarm-fixes-7.3-1 tag as a way to resolve bad
> >   conflicts with some of the patches
> >
> > - there is some additional conflicts with 7.3-rc6, due to
> >   kvmarm-fixes-7.3-2 landing a bit late. I have stashed a resolution
> >   here [1], which you can either apply if you're basing the merge on
> >   -rc6, or mention to Linus as you send your own PR. For everybody to
> >   enjoy, I also add the resolution at the end of this email.
>=20
> I've done the unspeakable and pulled kvmarm-fixes-7.3-2 into kvm/next
> so that this PR will go on top; that conflict is too much to send to
> Linus. Please check in kvm/queue that I copied your resolution
> correctly. As soon as you confirm I'll move it to kvm/next.

Looks pretty good to me:

$ git diff kvmarm/next-7.4+fixes-7.3-2  kvm/queue arch/arm64/
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm=
_host.h
index 1c6632216e327..5c9843338c510 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -32,6 +32,9 @@
 #include <asm/vncr_mapping.h>
=20
 #define __KVM_HAVE_ARCH_INTC_INITIALIZED
+#define __KVM_HAVE_MSI
+#define __KVM_HAVE_READONLY_MEM
+#define __KVM_HAVE_VCPU_RUN_PID_CHANGE
=20
 #define KVM_HALT_POLL_NS_DEFAULT 500000
=20
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 71233068b7cb6..48d531e302d33 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -22,18 +22,14 @@ menuconfig KVM
        select KVM_COMMON
        select KVM_GENERIC_HARDWARE_ENABLING
        select HAVE_KVM_CPU_RELAX_INTERCEPT
-       select KVM_MMIO
        select KVM_GENERIC_DIRTYLOG_READ_PROTECT
        select VIRT_XFER_TO_GUEST_WORK
        select KVM_VFIO
        select HAVE_KVM_DIRTY_RING_ACQ_REL
        select NEED_KVM_DIRTY_RING_WITH_BITMAP
-       select HAVE_KVM_MSI
        select HAVE_KVM_IRQCHIP
        select HAVE_KVM_IRQ_ROUTING
        select HAVE_KVM_IRQ_BYPASS
-       select HAVE_KVM_READONLY_MEM
-       select HAVE_KVM_VCPU_RUN_PID_CHANGE
        select SCHED_INFO
        select GUEST_PERF_EVENTS if PERF_EVENTS
        select KVM_GUEST_MEMFD

which is what I'd expected. It even builds, so it is obviously
perfect. Go ahead!

Thanks,

	M.

--=20
Without deviation from the norm, progress is not possible.

