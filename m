Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC5ECD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:
	Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBApCPg0n7tudhe3UxqEQnkqzXLwbo5XP66QLoDtV30=; b=JGXoBHgjLJySefNBmI/TMxLPOR
	e2U1ZEi/2fT26OVhczCd/BjDrNq0QTNeuDLtrO3QUitYVDTbVGi3yr9XJlKqtCCpDjWE0x/al8L7Z
	Kgx8/+2wcMVd9RbHZXbeLCwZI7I2dzLQIAwdjk62/HK8x3YOMDhPOg5a2Be//mtEBjTu5p4Ol1yRC
	oespKSFalLPkWPCRzQqbB/Y85VjF0TMlDRNjLRqpQgIWpS2FVYGuQ+oo25Thr9F3WD3dK8idoQ1Lv
	gvV6hYHhVoxIXL3uOpM2zH0dtgMTVPMa+j1tZ6GL02km5FEOQWV3UtMzSC2yo/FakFdKhmxdhOFhR
	oDgxbIug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJix-00000001V3b-0QjX;
	Tue, 19 May 2026 12:39:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJiv-00000001V38-381x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:39:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35CF560126;
	Tue, 19 May 2026 12:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AF6C2BCB3;
	Tue, 19 May 2026 12:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779194340;
	bh=8vDTP3D8eciTBIALrAZgpZD5nbooGrzE+oayZi9KF0E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X6t7ol7k8hXaTj/jPvLJ4LNh/i0SOJnXHIXk5IZvumO7d/mN1CRjiMLm+KSTcCp01
	 dpCgfb3aWuWfFvphoRRIUvocz42q1e+gPLCMrk98HK48+ExirdBV2p39MdspXradvs
	 1S8OGLvyb2+JpsVe931jV07V3TurIWCZCvnNvmG/z9BrJiOSkahYsYOo1ZSNsKo2ra
	 Y+gehhYjrv12Lm3yC01nrnbTOX6dWDkJ5zl5bn1iOKENlNlOCBFUr/hY7y5DGNyIh8
	 j8dzCXa37aHLiHFr20/F7wIrW3FgI33uniFpprTdhEdwfVSdoMKI7k1UkTm0mh1dmW
	 8eH0eWogRBXPQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPJis-00000003wup-1KJo;
	Tue, 19 May 2026 12:38:58 +0000
Date: Tue, 19 May 2026 13:38:57 +0100
Message-ID: <86qzn7wp3y.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	kvm <kvm@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Jim Mattson <jmattson@google.com>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kvmarm@lists.linux.dev,
	linux-kselftest <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
In-Reply-To: <CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
	<6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com>
	<57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
	<baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com>
	<86h5obya2r.wl-maz@kernel.org>
	<48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
	<ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com>
	<d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
	<CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
	<3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
	<agxFbniU_6eQ98t2@willie-the-truck>
	<cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
	<CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, dwmw2@infradead.org, will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, seanjc@google.com, jmattson@google.com, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, rananta@google.com, eric.auger@redhat.com, kees@kernel.org, arnd@arndb.de, nathan@kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
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

On Tue, 19 May 2026 13:13:41 +0100,
Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> On Tue, May 19, 2026 at 1:44=E2=80=AFPM David Woodhouse <dwmw2@infradead.=
org> wrote:
> > > > So... what next? Is one of the other KVM/arm64 maintainers going to
> > > > speak up? Paolo would you consider taking the fixes through your tr=
ee
> > > > directly?
>=20
> I admit that my knowledge of Arm is really limited, and I do not
> understand which IIDR values have architecturally allowed behaviors
> and which (if any) were made up by KVM; but even if I cannot honestly
> remark on the code or even the approach, a compatibility knob is the
> right thing to have.  That's a userspace API design matter, not an Arm
> or GIC matter.

I agree that we can have the knob -- not having it is a userspace
issue, and I have said that I was OK with preserving the userspace
interface.

>=20
> I hope that Marc provides a better explanation of why he believes
> https://lore.kernel.org/all/20260511113558.3325004-2-dwmw2@infradead.org/
> shouldn't be accepted, because I am more than a bit puzzled about
> *why* that patch is being rejected or (in v3) so far ignored. Marc in
> this thread wrote: "If userspace is not a total joke, it will read all
> the ID registers, and configure what it wants to see, assuming it is a
> feature that can be configured (not everything can, because the
> architecture itself is not fully backward compatible)".

This was a more general comment on the full mechanism that we use to
save/restore the state and at the same time configure the feature
set. Which is what the GICD_IIDR does to some extent for the GIC.

> But in this case there's an ID register that tells KVM if userspace
> wants the old or the new behavior, independent of whether that old
> behavior is architecturally valid or not.

But the "old behaviour" makes no sense, and cannot be used by a guest:

- either the guest doesn't use the alternative interrupt groups, then
  it wasn't affected by the bug. That's 100% of the guests.

- or the guest did try to use the alternative groups, and it *NEVER*
  worked, as it wouldn't get any interrupt at all. What is the point
  of preserving a "feature" that only results in a non-working guest?

Given that, re-introducing a behaviour that cannot be used makes zero
sense to me.

> I will certainly take this patch, but I won't override Marc. However
> I'd like to better understand his point of view, because right now I
> just don't get it.

I don't get it either, but for different reasons.

>=20
> > If KVM on arm64 doesn't aspire to maintain guest compatibility across
> > host kernel changes =E2=80=94 regardless of whether the previous kernel=
's
> > behaviour was "blessed" by the architecture specification or not =E2=80=
=94 then
> > it does not meet the expectation that we have of KVM implementations in
> > the Linux kernel.
>=20
> I agree with the "aspire" wording. Even if it's not going to be 100%
> achievable, KVM *needs* to aspire to maintain both guest compatibility
> and architecture precision. Sometimes it's impossible, sometimes there
> are constraints that require you to trade off one for another (e.g.
> via quirks, or by breaking behavior that no sane guest would have
> cared about). But in general as a maintainer you don't *get* to
> choose.
>=20
> Paolo
>=20
> > Or indeed the standards that we've held for Linux kernel ABIs for the
> > last 35 years.

As I said before, I'd be OK with something that would restore IIDR to
REV1. But not something that actively breaks the GIC emulation by
reintroducing a bug. That's, by construction, dead code that will only
bitrot, because there is no SW that can make use of this nonsense.

	M.

--=20
Without deviation from the norm, progress is not possible.

