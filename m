Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C31C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 18:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQSyQdOtaRXXJqY6mJYGU96ThIlQP1CEWPFYxr/eyuc=; b=K0xGC0UdWXA/9aS+FXf0ZonpHx
	LDZLpYaWL2n/4KtGIX2icxt4oH5OvRYCyBDd2VZ+Li5HRdviMlWhLJy3jqzbm+/Nsdwi2A+KjjznF
	7jqDr3pZWLo9KOIkzYwpn0M+51mEFa0lEZs2e6ioMTlGk/7A62/fbjA6hqq4AoyBU7+yb55E4m8Ua
	4Ugq1rPekdN9lpmftYufhBFA2Rz5zwDZ3OqmDDA/nlH3dXEhGAaqUNccH2m9M1ts9v52L15TTo5Jc
	NFQtFPAeH8sXe1C/nxQ+bFmZAANv6wZv0CwEdC048Fvzusy3ITg5JPtMRnc2M0iJ3DQznsceKOSmF
	E5WFz8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVSJ-00000009Li1-0ciR;
	Wed, 26 Mar 2025 18:26:23 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txVQZ-00000009LY8-1ejF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 18:24:36 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-224347aef79so4173835ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743013474; x=1743618274; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KQSyQdOtaRXXJqY6mJYGU96ThIlQP1CEWPFYxr/eyuc=;
        b=ObCtXP/BIsxg8omLbvdf+BZlSTL0R9NnqIJN3njfy6w77ISSgiouz8+uZ0HB08zGjX
         edK5JOcWCFw9CPF29ZFPzyjlSCEYM00C2HHb4xIWDU4MwhMojOzoeWDhGXngQB6rDEb2
         i66em0YCrtNAbTw/kTPHbeQvnDtOI5+Zo2B2WA+KV5G8/7ibyGCaxwrDAbsPAk+RhMLu
         3ORc8vfbf4SeFFY+ooy63yRPlwltZepWrOUyCQlFr89Zrqw0QG6oA6jGHuLTesBXvEzq
         zL/bONWN3g90pNWjhu/Kx/+1qfjFUR6sEL5fVz9rrp+KKSGhEwrPzlekg62dyvcc8gxR
         avsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743013474; x=1743618274;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQSyQdOtaRXXJqY6mJYGU96ThIlQP1CEWPFYxr/eyuc=;
        b=HkUfL4zEBj+aHxA0g7iN+Jo/Ez2Pj7JhCXLCNmeFkTjPrnc22OPoZfbxaVDygktZTa
         dm7oA1tGZGkBAPa2hLOE8MfRExPR7apiAR8L0mMaAgTYFuzMPfJCrvhxaElYJtBkmHJx
         w28ky2zm++RT+AskdFYSnjezP8+it/k+1t/dYuGmNf7EfZnnBJvt4HSXpKNnPRasER5N
         NCdZOsnjIjSynXzE3EFG4cIUgErFEybJWJ+d/I5pwxlJWcG9R5Xq8hLWsmWn55EqnBfa
         BVySM2X8B3HvHcSq4+NAqmSY+CEbGj1HGezr4XKY40PmaDYtLPWG5dWPzmWjetNLai+F
         wsPA==
X-Forwarded-Encrypted: i=1; AJvYcCVaJUEqbB4K8Itmk/yax4QVGvP1p5kIWbP2POUlt0SO2fndsxWf9CDXvvhvCRTfKhHkw5vPXCR0az3+QKnl/sgM@lists.infradead.org
X-Gm-Message-State: AOJu0YyjD3USvbDPf5TgQOu8H9IbNaiIlpFeT+oNC5MOSg5ToPr3tBB3
	KF4Zs2PamM2jpblvuMR3kD2fQ2rMuML+Wr2V45TAEWTuFLRrxIArtbRPdV1OwdoZyV6r/8nCnjR
	zfA==
X-Google-Smtp-Source: AGHT+IH9At4P504/E7QC1PFAI9YXhOi0kk7VTZY2FxHfytUMmysBWuzG1WMVt3IjO8CPrl186Ota31MBAcw=
X-Received: from pfbck7.prod.google.com ([2002:a05:6a00:3287:b0:736:ae72:7543])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c5:b0:215:94eb:adb6
 with SMTP id d9443c01a7336-2280495a14dmr8796425ad.40.1743013473742; Wed, 26
 Mar 2025 11:24:33 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:24:32 -0700
In-Reply-To: <86wmcbllg2.wl-maz@kernel.org>
Mime-Version: 1.0
References: <Z9pryQwy2iwa2bpJ@linux.dev> <20250319170429.GK9311@nvidia.com>
 <Z9sItt8BIgvbBY8M@arm.com> <20250319192246.GQ9311@nvidia.com>
 <Z9s7r2JocpoM_t-m@arm.com> <SA1PR12MB7199C7BD48EB39F536DD34DBB0A62@SA1PR12MB7199.namprd12.prod.outlook.com>
 <Z-QU7qJOf8sEA5R8@google.com> <86y0wrlrxt.wl-maz@kernel.org>
 <Z-QnBcE1TKPChQay@google.com> <86wmcbllg2.wl-maz@kernel.org>
Message-ID: <Z-RGYO3QVj5JNjRB@google.com>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Ankit Agrawal <ankita@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "will@kernel.org" <will@kernel.org>, 
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "shahuang@redhat.com" <shahuang@redhat.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "david@redhat.com" <david@redhat.com>, 
	Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, 
	Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, 
	Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>, 
	Dheeraj Nigam <dnigam@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>, 
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>, 
	"sebastianene@google.com" <sebastianene@google.com>, "coltonlewis@google.com" <coltonlewis@google.com>, 
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "yi.l.liu@intel.com" <yi.l.liu@intel.com>, 
	"ardb@kernel.org" <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"gshan@redhat.com" <gshan@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"ddutile@redhat.com" <ddutile@redhat.com>, "tabba@google.com" <tabba@google.com>, 
	"qperret@google.com" <qperret@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_112435_459761_C56698C9 
X-CRM114-Status: GOOD (  59.35  )
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

On Wed, Mar 26, 2025, Marc Zyngier wrote:
> On Wed, 26 Mar 2025 16:10:45 +0000,
> Sean Christopherson <seanjc@google.com> wrote:
> > 
> > On Wed, Mar 26, 2025, Marc Zyngier wrote:
> > > On Wed, 26 Mar 2025 14:53:34 +0000,
> > > Sean Christopherson <seanjc@google.com> wrote:
> > > > 
> > > > On Wed, Mar 26, 2025, Ankit Agrawal wrote:
> > > > > > On Wed, Mar 19, 2025 at 04:22:46PM -0300, Jason Gunthorpe wrote:
> > > > > > > On Wed, Mar 19, 2025 at 06:11:02PM +0000, Catalin Marinas wrote:
> > > > > > > > On Wed, Mar 19, 2025 at 02:04:29PM -0300, Jason Gunthorpe wrote:
> > > > > > > > > On Wed, Mar 19, 2025 at 12:01:29AM -0700, Oliver Upton wrote:
> > > > > > > > > > You have a very good point that KVM is broken for cacheable PFNMAP'd
> > > > > > > > > > crap since we demote to something non-cacheable, and maybe that
> > > > > > > > > > deserves fixing first. Hopefully nobody notices that we've taken away
> > > > > > > > > > the toys...
> > > > > > > > >
> > > > > > > > > Fixing it is either faulting all access attempts or mapping it
> > > > > > > > > cachable to the S2 (as this series is trying to do)..
> > > > > > > >
> > > > > > > > As I replied earlier, it might be worth doing both - fault on !FWB
> > > > > > > > hardware (or rather reject the memslot creation), cacheable S2
> > > > > > > > otherwise.
> > > > > > >
> > > > > > > I have no objection, Ankit are you able to make a failure patch?
> > > > > >
> > > > > > I'd wait until the KVM maintainers have their say.
> > > > > > 
> > > > > 
> > > > > Maz, Oliver any thoughts on this? Can we conclude to create this failure
> > > > > patch in memslot creation?
> > > > 
> > > > That's not sufficient.  As pointed out multiple times in this thread, any checks
> > > > done at memslot creation are best effort "courtesies" provided to userspace to
> > > > avoid terminating running VMs when the memory is faulted in.
> > > > 
> > > > I.e. checking at memslot creation is optional, checking at fault-in/mapping is
> > > > not.
> > > > 
> > > > With that in place, I don't see any need for a memslot flag.  IIUC, without FWB,
> > > > cacheable pfn-mapped memory is broken and needs to be disallowed.  But with FWB,
> > > > KVM can simply honor the cacheability based on the VMA.  Neither of those requires
> > > 
> > > Remind me how this work with stuff such as guestmemfd, which, by
> > > definition, doesn't have a userspace mapping?
> > 
> > Definitely not through a memslot flag.  The cacheability would be a property of
> > the guest_memfd inode, similar to how it's a property of the underlying device
> > in this case.
> 
> It's *not* a property of the device. It's a property of the mapping.

Sorry, bad phrasing.  I was trying to say that the entity that controls the
cacheability is ultimately whatever kernel subsystem/driver controls the mapping.

> > I don't entirely see what guest_memfd has to do with this.
> 
> You were the one mentioning sampling the cacheability via the VMA. As
> far as I understand guestmemfd, there is no VMA to speak of.
> 
> > One of the big
> > advantages of guest_memfd is that KVM has complete control over the lifecycle of
> > the memory.  IIUC, the issue with !FWB hosts is that KVM can't guarantee there
> > are valid host mappings when memory is unmapped from the guest, and so can't do
> > the necessary maintenance.  I agree with Jason's earlier statement that that's a
> > solvable kernel flaw.
> >
> > For guest_memfd, KVM already does maintenance operations when memory is reclaimed,
> > for both SNP and TDX.  I don't think ARM's cacheability stuff would require any
> > new functionality in guest_memfd.
> 
> I don't know how you reconcile the lack of host mapping and cache
> maintenance. The latter cannot take place without the former.

I assume cache maintenance only requires _a_ mapping to the physical memory.
With guest_memfd, KVM has the pfn (which happens to always be struct page memory
today), and so can establish a VA=>PA mapping as needed.

> > > > a memslot flag.  A KVM capability to enumerate FWB support would be nice though,
> > > > e.g. so userspace can assert and bail early without ever hitting an
> > > > ioctl error.
> > > 
> > > It's not "nice". It's mandatory. And FWB is definitely *not* something
> > > we want to expose as such.
> > 
> > I agree a capability is mandatory if we're adding a memslot flag, but I don't
> > think it's mandatory if this is all handled through kernel plumbing.
> 
> It is mandatory, full stop. Otherwise, userspace is able to migrate a
> VM from an FWB host to a non-FWB one, start the VM, blow up on the
> first page fault. That's not an acceptable outcome.
> 
> > 
> > > > If we want to support existing setups that happen to work by dumb luck or careful
> > > > configuration, then that should probably be an admin decision to support the
> > > > "unsafe" behavior, i.e. an off-by-default KVM module param, not a memslot flag.
> > > 
> > > No. That's not how we handle an ABI issue. VM migration, with and
> > > without FWB, can happen in both direction, and must have clear
> > > semantics. So NAK to a kernel parameter.
> > > 
> > > If I have a VM with a device mapped as *device* on FWB host, I must be
> > > able to migrate it to non-FWB host, and back. A device mapped as
> > > *cacheable* can only be migrated between FWB-capable hosts.
> > 
> > But I thought the whole problem is that mapping this fancy memory as device is
> > unsafe on non-FWB hosts?  If it's safe, then why does KVM needs to reject anything
> > in the first place?
> 
> I don't know where you got that idea. This is all about what memory
> type is exposed to a guest:
> 
> - with FWB, no need for CMOs, so cacheable memory is allowed if the
>   device supports it (i.e. it actually exposes memory), and device
>   otherwise.
> 
> - without FWB, CMOs are required, and we don't have a host mapping for
>   these pages. As a fallback, the mapping is device only, as this
>   doesn't require any CMO by definition.
> 
> There is no notion of "safety" here.

Ah, the safety I'm talking about is the CMO requirement.  IIUC, not doing CMOs
if the memory is cacheable could result in data corruption, i.e. would be a safety
issue for the host.  But I missed that you were proposing that the !FWB behavior
would be to force device mappings.

> > > Importantly, it is *userspace* that is in charge of deciding how the
> > > device is mapped at S2. And the memslot flag is the correct
> > > abstraction for that.
> >  
> > I strongly disagree.  Whatever owns the underlying physical memory is in charge,
> > not userspace.  For memory that's backed by a VMA, userspace can influence the
> > behavior through mmap(), mprotect(), etc., but ultimately KVM needs to pull state
> > from mm/, via the VMA.  Or in the guest_memfd case, from guest_memfd.
> 
> I don't buy that. Userspace needs to know the semantics of the memory
> it gives to the guest. Or at least discover that the same device
> plugged into to different hosts will have different behaviours. Just
> letting things rip is not an acceptable outcome.

Agreed, but that doesn't require a memslot flag.  A capability to enumerate that
KVM can do cacheable mappings for PFNMAP memory would suffice.  And if we want to
have KVM reject memslots that are cachaeable in the VMA, but would get device in
stage-2, then we can provide that functionality through the capability, i.e. let
userspace decide if it wants "fallback to device" vs. "error on creation" on a
per-VM basis.

What I object to is adding a memslot flag.

> > I have no objection to adding KVM uAPI to let userspace add _restrictions_, e.g.
> > to disallow mapping memory as writable even if the VMA is writable.  But IMO,
> > adding a memslot flag to control cacheability isn't purely substractive.
> 
> I don't see how that solves the problem at hand: given the presence or
> absence of FWB, allow userspace to discover as early as possible what
> behaviour a piece of memory provided by a device will have, and
> control it to handle migration.

