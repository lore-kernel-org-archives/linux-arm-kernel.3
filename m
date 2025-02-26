Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9124C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3L7GGobGPNwe6DNr4VnJw0PN3Yk9Zlm7UNmryqlbZWI=; b=vEfKWLGHv7ksRBtwsKUB39+R8g
	jvNiIhWBxRR3oDnTRobqrBzt+1QaC6ghMthJtozEw8D8KNq2NUqV+7O7ZQUaT6Kk455JVZJsKFnT6
	9x0ZJ6fut+s0tCk3cMxPVykDR2vdoBGr15JhpPXqaDcBjgnoNETw+88AzR2KKNaLKiraRRSZZwvN9
	73aIu0BNFvVCPm/8HzQ7dhvt/+9dvUDka64W/7OpFev3/PGnSbnRzUxeRSpOul8gfpJ4p+cyHGgFV
	rD41FjK2uycu2u8E+ttWHSMi1DZpbBhbGteDGgjOR3U+9Mv8Z/QzHzeyyCedxBeQPktcVmtvpchSH
	wX8Uprzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEEU-00000003Cwv-1Chi;
	Wed, 26 Feb 2025 10:01:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEBX-00000003CDr-14d7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06CB561156;
	Wed, 26 Feb 2025 09:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A171C4CEEB;
	Wed, 26 Feb 2025 09:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740563914;
	bh=3L7GGobGPNwe6DNr4VnJw0PN3Yk9Zlm7UNmryqlbZWI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qy/fifOr2xjT9wRfnq19NMKCv8Y9wgXhMxQRjNd8AfeKESSb8BytQkZvB5K7Y5D2x
	 HNbE1Th9SSIY9+1Hu7lQty8YCNXvijFvlphckwu8pUBx9HN+SZiq8bCqtaLKFrVjg0
	 sRyXaFRyig7suCKmVvngl3LeNMdnVidt3ZIr1e/ByxdfVHCAFYXWLbI38yEZQFynHK
	 BH1b4KmorHsne09A+tBJcINT3V3+8RplroPNfLuDN00/riLFFKKuKcMB4BehE4qm2N
	 3ftpmk4Pt0seXA7Ox29eXafxzuGvncGC8g/CGB331vD+UAbLOzsjWAxIF8LNuA3Jv/
	 eygudQrvMmdSA==
X-Mailer: emacs 30.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Peter Collingbourne <pcc@google.com>
Subject: Re: [PATCH] KVM: arm64: Drop mte_allowed check during memslot creation
In-Reply-To: <86ikozqmsl.wl-maz@kernel.org>
References: <20250224093938.3934386-1-aneesh.kumar@kernel.org>
 <Z7xSfVME4z2ComUm@arm.com> <86ldtvr0nl.wl-maz@kernel.org>
 <Z7yElHKrJGn8XuPS@arm.com> <86jz9fqtbk.wl-maz@kernel.org>
 <yq5aseo3gund.fsf@kernel.org> <86ikozqmsl.wl-maz@kernel.org>
Date: Wed, 26 Feb 2025 15:28:26 +0530
Message-ID: <yq5a8qptauyl.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Marc Zyngier <maz@kernel.org> writes:

> On Mon, 24 Feb 2025 16:44:06 +0000,
> Aneesh Kumar K.V <aneesh.kumar@kernel.org> wrote:
>>=20
>> Marc Zyngier <maz@kernel.org> writes:
>>=20
>> > On Mon, 24 Feb 2025 14:39:16 +0000,
>> > Catalin Marinas <catalin.marinas@arm.com> wrote:
>> >>
>> >> On Mon, Feb 24, 2025 at 12:24:14PM +0000, Marc Zyngier wrote:
>> >> > On Mon, 24 Feb 2025 11:05:33 +0000,
>> >> > Catalin Marinas <catalin.marinas@arm.com> wrote:
>> >> > > On Mon, Feb 24, 2025 at 03:09:38PM +0530, Aneesh Kumar K.V (Arm) =
wrote:
>> >> > > > This change is needed because, without it, users are not able t=
o use MTE
>> >> > > > with VFIO passthrough (currently the mapping is either Device or
>> >> > > > NonCacheable for which tag access check is not applied.), as sh=
own
>> >> > > > below (kvmtool VMM).
>> >> > >
>> >> > > Another nit: "users are not able to user VFIO passthrough when MT=
E is
>> >> > > enabled". At a first read, the above sounded to me like one wants=
 to
>> >> > > enable MTE for VFIO passthrough mappings.
>> >> >
>> >> > What the commit message doesn't spell out is how MTE and VFIO are
>> >> > interacting here. I also don't understand the reference to Device or
>> >> > NC memory here.
>> >>
>> >> I guess it's saying that the guest cannot turn MTE on (Normal Tagged)
>> >> for these ranges anyway since Stage 2 is Device or Normal NC. So we
>> >> don't break any use-case specific to VFIO.
>> >>
>> >> > Isn't the issue that DMA doesn't check/update tags, and therefore it
>> >> > makes little sense to prevent non-tagged memory being associated wi=
th
>> >> > a memslot?
>> >>
>> >> The issue is that some MMIO memory range that does not support MTE
>> >> (well, all MMIO) could be mapped by the guest as Normal Tagged and we
>> >> have no clue what the hardware does as tag accesses, hence we current=
ly
>> >> prevent it altogether. It's not about DMA.
>> >>
>> >> This patch still prevents such MMIO+MTE mappings but moves the decisi=
on
>> >> to user_mem_abort() and it's slightly more relaxed - only rejecting it
>> >> if !VM_MTE_ALLOWED _and_ the Stage 2 is cacheable. The side-effect is
>> >> that it allows device assignment into the guest since Stage 2 is not
>> >> Normal Cacheable (at least for now, we have some patches Ankit but th=
ey
>> >> handle the MTE case).
>> >
>> > The other side effect is that it also allows non-tagged cacheable
>> > memory to be given to the MTE-enabled guest, and the guest has no way
>> > to distinguish between what is tagged and what's not.
>> >
>> >>
>> >> > My other concern is that this gives pretty poor consistency to the
>> >> > guest, which cannot know what can be tagged and what cannot, and
>> >> > breaks a guarantee that the guest should be able to rely on.
>> >>
>> >> The guest should not set Normal Tagged on anything other than what it
>> >> gets as standard RAM. We are not changing this here. KVM than needs to
>> >> prevent a broken/malicious guest from setting MTE on other (physical)
>> >> ranges that don't support MTE. Currently it can only do this by forci=
ng
>> >> Device or Normal NC (or disable MTE altogether). Later we'll add
>> >> FEAT_MTE_PERM to permit Stage 2 Cacheable but trap on tag accesses.
>> >>
>> >> The ABI change is just for the VMM, the guest shouldn't be aware as
>> >> long as it sticks to the typical recommendations for MTE - only enable
>> >> on standard RAM.
>> >
>> > See above. You fall into the same trap with standard memory, since you
>> > now allow userspace to mix things at will, and only realise something
>> > has gone wrong on access (and -EFAULT is not very useful).
>> >
>> >>
>> >> Does any VMM rely on the memory slot being rejected on registration if
>> >> it does not support MTE? After this change, we'd get an exit to the V=
MM
>> >> on guest access with MTE turned on (even if it's not mapped as such at
>> >> Stage 1).
>> >
>> > I really don't know what userspace expects w.r.t. mixing tagged and
>> > non-tagged memory. But I don't expect anything good to come out of it,
>> > given that we provide zero information about the fault context.
>> >
>> > Honestly, if we are going to change this, then let's make sure we give
>> > enough information for userspace to go and fix the mess. Not just "it
>> > all went wrong".
>> >
>>=20
>> What if we trigger a memory fault exit with the TAGACCESS flag, allowing
>> the VMM to use the GPA to retrieve additional details and print extra
>> information to aid in analysis? BTW, we will do this on the first fault
>> in cacheable, non-tagged memory even if there is no tagaccess in that
>> region. This can be further improved using the NoTagAccess series I
>> posted earlier, which ensures the memory fault exit occurs only on
>> actual tag access
>>=20
>> Something like below?
>
> Something like that, only with:
>
> - a capability informing userspace of this behaviour
>
> - a per-VM (or per-VMA) flag as a buy-in for that behaviour
>

If we=E2=80=99re looking for a capability based control, could we tie that =
up to
FEAT_MTE_PERM? That=E2=80=99s what I did here:

https://lore.kernel.org/all/20250110110023.2963795-1-aneesh.kumar@kernel.org

That patch set also addresses the issue mentioned here. Let me know if
you think this is a better approach

> - the relaxation is made conditional on the memslot not being memory
> (i.e. really MMIO-only).
>
> and keep the current behaviour otherwise.
>
> Thanks,

-aneesh

