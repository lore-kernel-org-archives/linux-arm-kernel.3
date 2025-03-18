Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EF9C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 09:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjBamXLhG9t31btVrgsJM7L1wHONxOSaj8rFraH+oxQ=; b=qsJUJkk32nxNj4p67W3zZVV5u3
	jOkz/Z8DxOswM1ahxXgbLoeyc++hYH43SSDgrI9wS50bjumOzOyIHT8xI2KKci0l0Az21bT5opUmH
	R6TOUu2cnf+oF/sfUOu1mjfEHzQOmJYI8dQrjh3NGHy/0WSI6AD0GChXDMrOIFVu+2p6hF3yQr4zx
	YXeip+yr7h92EqDMRp4WPE7OvF1nauxxeUbPEhMJhSz8bO59RdNodbek5IylhyxwdU337uXWkzq3B
	ObNVapton84Qi2HSiqf80TROqk9hJC5e2NzO6B0rOcd3pI/Eo7ptsI1CLrmem9zsukW0BLwAznQ6Y
	N5VCVBsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTRq-00000005M8S-0TVP;
	Tue, 18 Mar 2025 09:41:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTQ7-00000005Lsu-3jdI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 09:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E222A48F13;
	Tue, 18 Mar 2025 09:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FF1C4CEDD;
	Tue, 18 Mar 2025 09:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742290774;
	bh=e/N39kECrZaAZqXOkn575Z5oEd+RpQ3Lp7nzRZQGNro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kx+9FD55olsHSOS5x25jlmc97mqriSkBafms+JbkkGsDo0bB5t+Dpm7M1q5MKXkN7
	 Kp4dQXxtIW8f40PSN9w5Lp+/gdcXXQtfHhNogqadcWrs+DN0JAEQJCavL+YUT0lJVB
	 U8X2qVQY7CNkvrbNXa/s8snf+qRUG3Md0StX1LFLu9fxMnjml5KQvtZO0hH7SCEMVc
	 AZiBMQ+qCgpaY+hqQBz5DA46V0lFjKD5owm3sy8qQMTolWwb/9x6inxi73nnQivdAI
	 fmAdtoBszkVnleKAPLAXOHjPq6Sd+KL2w7XnL9Bdmb+gPMFyuhrQn8gGW9fx5bASoa
	 BcXv8pRa77bGQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tuTQ3-00EcHD-OW;
	Tue, 18 Mar 2025 09:39:31 +0000
Date: Tue, 18 Mar 2025 09:39:30 +0000
Message-ID: <86wmcmn0dp.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ankit Agrawal <ankita@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"david@redhat.com" <david@redhat.com>,
	Aniket Agashe <aniketa@nvidia.com>,
	Neo Jia <cjia@nvidia.com>,
	Kirti Wankhede <kwankhede@nvidia.com>,
	"Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>,
	Andy Currid <acurrid@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Dan Williams <danw@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	Matt Ochs <mochs@nvidia.com>,
	Uday Dhoke <udhoke@nvidia.com>,
	Dheeraj Nigam <dnigam@nvidia.com>,
	Krishnakant Jaju <kjaju@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"sebastianene@google.com" <sebastianene@google.com>,
	"coltonlewis@google.com" <coltonlewis@google.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>,
	"ardb@kernel.org" <ardb@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com" <gshan@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>,
	"tabba@google.com" <tabba@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"seanjc@google.com" <seanjc@google.com>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using VMA flags
In-Reply-To: <Z9h98RhunemcFhhz@arm.com>
References: <20250310103008.3471-1-ankita@nvidia.com>
	<20250310103008.3471-2-ankita@nvidia.com>
	<861pv5p0c3.wl-maz@kernel.org>
	<SA1PR12MB7199DD985C45943A663E7003B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
	<86r033olwv.wl-maz@kernel.org>
	<SA1PR12MB7199500A3683B15A64B663D6B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
	<87tt7y7j6r.wl-maz@kernel.org>
	<SA1PR12MB7199B320DAE42A8D7038A78EB0D32@SA1PR12MB7199.namprd12.prod.outlook.com>
	<8634fcnh0n.wl-maz@kernel.org>
	<Z9h98RhunemcFhhz@arm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.4
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: catalin.marinas@arm.com, ankita@nvidia.com, jgg@nvidia.com, oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org, david@redhat.com, aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com, kjaju@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com, coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org, ddutile@redhat.com, tabba@google.com, qperret@google.com, seanjc@google.com, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_023936_076997_9104A7F2 
X-CRM114-Status: GOOD (  47.91  )
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

On Mon, 17 Mar 2025 19:54:25 +0000,
Catalin Marinas <catalin.marinas@arm.com> wrote:
> 
> On Mon, Mar 17, 2025 at 09:27:52AM +0000, Marc Zyngier wrote:
> > On Mon, 17 Mar 2025 05:55:55 +0000,
> > Ankit Agrawal <ankita@nvidia.com> wrote:
> > > 
> > > >> For my education, what is an accepted way to communicate this? Please let
> > > >> me know if there are any relevant examples that you may be aware of.
> > > >
> > > > A KVM capability is what is usually needed.
> > > 
> > > I see. If IIUC, this would involve a corresponding Qemu (usermode) change
> > > to fetch the new KVM cap. Then it could fail in case the FWB is not
> > > supported with some additional conditions (so that the currently supported
> > > configs with !FWB won't break on usermode). 
> > > 
> > > The proposed code change is to map in S2 as NORMAL when vma flags
> > > has VM_PFNMAP. However, Qemu cannot know that driver is mapping
> > > with PFNMAP or not. So how may Qemu decide whether it is okay to
> > > fail for !FWB or not?
> > 
> > This is not about FWB as far as userspace is concerned. This is about
> > PFNMAP as non-device memory. If the host doesn't have FWB, then the
> > "PFNMAP as non-device memory" capability doesn't exist, and userspace
> > fails early.
> > 
> > Userspace must also have some knowledge of what device it obtains the
> > mapping from, and whether that device requires some extra host
> > capability to be assigned to the guest.
> > 
> > You can then check whether the VMA associated with the memslot is
> > PFNMAP or not, if the memslot has been enabled for PFNMAP mappings
> > (either globally or on a per-memslot basis, I don't really care).
> 
> Trying to page this back in, I think there are three stages:
> 
> 1. A KVM cap that the VMM can use to check for non-device PFNMAP (or
>    rather cacheable PFNMAP since we already support Normal NC).
> 
> 2. Memslot registration - we need a way for the VMM to require such
>    cacheable PFNMAP and for KVM to check. Current patch relies on (a)
>    the stage 1 vma attributes which I'm not a fan of. An alternative I
>    suggested was (b) a VM_FORCE_CACHEABLE vma flag, on the assumption
>    that the vfio driver knows if it supports cacheable (it's a bit of a
>    stretch trying to make this generic). Yet another option is (c) a
>    KVM_MEM_CACHEABLE flag that the VMM passes at memslot registration.
> 
> 3. user_mem_abort() - follows the above logic (whatever we decide),
>    maybe with some extra check and WARN in case we got the logic wrong.
> 
> The problems in (2) are that we need to know that the device supports
> cacheable mappings and we don't introduce additional issues or end up
> with FWB on a PFNMAP that does not support cacheable. Without any vma
> flag like the current VM_ALLOW_ANY_UNCACHED, the next best thing is
> relying on the stage 1 attributes. But we don't know them at the memslot
> registration, only later in step (3) after a GUP on the VMM address
> space.
> 
> So in (2), when !FWB, we only want to reject VM_PFNMAP slots if we know
> they are going to be mapped as cacheable. So we need this information
> somehow, either from the vma->vm_flags or slot->flags.

Yup, that's mostly how I think of it.

Obtaining a mapping from the xPU driver must result in VM_PFNMAP being
set in the VMA. I don't think that's particularly controversial.

The memslot must also be created with a new flag ((2c) in the taxonomy
above) that carries the "Please map VM_PFNMAP VMAs as cacheable". This
flag is only allowed if (1) is valid.

This results in the following behaviours:

- If the VMM creates the memslot with the cacheable attribute without
  (1) being advertised, we fail.

- If the VMM creates the memslot without the cacheable attribute, we
  map as NC, as it is today.

What this doesn't do is *automatically* decide for the VMM what
attributes to use. The VMM must know what it is doing, and only
provide the memslot flag when appropriate. Doing otherwise may eat
your data and/or take the machine down (cacheable mapping on a device
can be great fun). If you want to address this, then "someone" needs
to pass some additional VMA flag that KVM can check.

Of course, all of this only caters for well behaved userspace, and we
need to gracefully handle (3) when the VMM sneaks in a new VMA that
has conflicting attributes.

For that, we need a reasonable fault reporting interface that allows
userspace to correctly handle it. I don't think this is unique to this
case, but also covers things like MTE and other funky stuff that
relies on the backing memory having some particular "attributes".

An alternative could be to require the VMA to be sealed, which would
prevent any overlapping mapping. But I only have looked at that for 2
minutes...

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

