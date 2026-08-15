Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F8CC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 00:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLvPD2Xvd2OCDWk0LusvK3Ba5zPp1t8KCpjF4I/EHLY=; b=mJCvffUw4wYoX681X8p9ol0V1b
	U2h6eAGH05BWJU865n7YEJOHLpe7IjtTl9gV4Pbpx7Ykzy7GK/bL+9OI287uQs25MfrTGbyqdnYDp
	uq/GMfzgD90vrbxaO02wOLa/kbwHICT89weDz0UEC824AKSL/q5fQ+3xnC4R0E+8p7kZlMv9O63Vh
	XgUvrgf8+RTlhMbW3iD4anar/SQPnlgDsqkGHQzLlyR4x0ZD19WBh+3vARN3mGVcaf62Kjou9k13h
	+OFm+Cvb+mKpxUAaglVlJ9PSyHPSgzrlrfGuc6hgHd/Kc8zBAAIblb9l5krCPHoE0TsTfGp7vf11p
	Gma6oZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv273-00000003L1x-3q1X;
	Sat, 15 Aug 2026 00:19:01 +0000
Received: from out-218.mta1.migadu.com ([2001:41d0:203:375::da] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv270-00000003L1Z-2Ux4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 00:19:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=HlDIpqm069G70cSVX9IpKdU7viVskBXwDZemew5s+u8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786753130; v=1; x=1787357930;
 b=X0ucCcTd3ytsyYvJohDIZie4uVrtcbkRiBw/wT6ofliYsbE+aQC0DQe2PPseNYk6qeu3ZPEt
 54Hg39MBkJckXWQRHIPNy6H5CGL4Jav633QJCyl2uyM9Vdw3kkpCAQtOuLYkSttM4UsJMIyBRH5
 I/v0LuZOJRSLuL4iaOOKTv+8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from mail-lf1-f46.google.com (209.85.167.46)
	by smtp.migadu.com with ESMTPS id 45cc349fef6a3fe0;
	Sat, 15 Aug 2026 00:18:40 +0000
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2a73da7e1so15009e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 17:18:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrbP1jbrtnFPy4ElAKrPuYHizfkepSqZ7y5A+zYoXKLxYRRLvp4V+2pYdmjCZMPj9lNjfsmvyXMiEtY0zLz/M3N@lists.infradead.org
X-Gm-Message-State: AOJu0YxRxOJv+lbPPp1DpzjZalAlrFhhSEOjrNXri0AFZFYfPPU8A7tL
	+xxl8wWs2DNa4OpZ/DWmDx9WpXB9YYrB8DBaYRiOqHGJa9GiUayk+SUDZqOIc2QM4xHyObxSbgt
	UFAgEK8VvLyOjPCUU8djOzSIFKO19n6YeyDoZKh8D
X-Received: by 2002:a05:6512:1092:b0:5ae:a4e8:47be with SMTP id
 2adb3069b0e04-5b45975c815mr305656e87.7.1786753119575; Fri, 14 Aug 2026
 17:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
 <20260807104102.2410744-2-fuad.tabba@linux.dev> <0ce5e496-a067-48fd-80d2-94fe9981d505@redhat.com>
In-Reply-To: <0ce5e496-a067-48fd-80d2-94fe9981d505@redhat.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 15 Aug 2026 02:18:03 +0200
X-Gmail-Original-Message-ID: <CA+EHjTzsCgBbaJQpv1ne-0Xo_3wdwv-R1RWMabdLxiMjMh4peA@mail.gmail.com>
X-Gm-Features: AUfX_mxLSNC5ubSrnmPIZs7wo8JAHvSfgoxf3yq_YIzru-oTtZpAGPxeJWhZIZ0
Message-ID: <CA+EHjTzsCgBbaJQpv1ne-0Xo_3wdwv-R1RWMabdLxiMjMh4peA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] KVM: arm64: vgic-its: Don't dereference a NULL
 collection on ITT save
To: Eric Auger <eauger@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Sascha Bischoff <sascha.bischoff@arm.com>, Sebastian Ene <sebastianene@google.com>, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_171858_918397_42DD6E54 
X-CRM114-Status: GOOD (  29.95  )
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

Hi Eric,

On Fri, 14 Aug 2026 at 14:36, Eric Auger <eauger@redhat.com> wrote:
>
> Hi Fuad,
>
> On 8/7/26 12:40 PM, Fuad Tabba wrote:
> > MAPC with V=0 drops ite->collection but leaves the ITE on the device's
> > ITT list, and vgic_its_save_ite() dereferences it unconditionally. A
> > guest that issues MAPD, MAPTI and then MAPC(V=0) therefore oopses the
> > host when the VMM issues KVM_DEV_ARM_ITS_SAVE_TABLES to migrate it.
> Thank you for fixing this bug!
> > That sequence is UNPREDICTABLE per the architecture, but KVM already
> > handles the resulting state in the translate, MOVI and DISCARD paths.
> Maybe: "its_is_collection_mapped() already checks the collection is non
> null in translate, movi and discard"

Agreed, that's more accurate. This went into kvmarm/next on the 8th
[1], so it's the comment rather than the commit message I can still
fix.

...

> > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> > index 36ab3e4929154..ed281fbf008b9 100644
> > --- a/arch/arm64/kvm/vgic/vgic-its.c
> > +++ b/arch/arm64/kvm/vgic/vgic-its.c
> > @@ -2119,6 +2119,14 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
> >       u32 next_offset;
> >       u64 val;
> >
> > +     /*
> > +      * MAPC with V=0 keeps the ITEs mapped but drops their collection,
> > +      * and with it the ICID. Save a zeroed entry, which the restore path
> > +      * reads back as invalid.
> in
>
> https://lore.kernel.org/all/CA+EHjTymdanCKoQO3ATmUZ=7Ph2wv4ES8SfkSsTgmOYAYBWayQ@mail.gmail.com/
>
> you also mentionned this can also happen on clearing
> GITS_BASER<coll>.Valid clear. So maybe don't specifically focus on MAPC
> in in the comment.

Yes, and the BASER case is the one that justifies the check: MAPC(V=0)
is UNPREDICTABLE, so it could be answered by dropping the ITEs, while
clearing GITS_BASER<coll>.Valid on a disabled ITS cannot. The comment
names only the case that doesn't. I'll send a patch on top to reword
it.

>
>
> > +      */
> > +     if (!ite->collection)
> > +             return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);
> I would rather squash 4/4 here to emphasize we are unlinking that entry
> from the scan chain.

1/4 has Cc: stable and 4/4 isn't a fix, so I kept them apart. 4/4
doesn't make the write unnecessary either: an orphaned ITE with no
valid predecessor is read directly, regardless of the offsets.

> Besides I also wonder if we should directly remove those entries from
> the &device->itt_head on MAPC and GITS_BASER<coll>.Valid reset.

For MAPC(V=0) I think it works, and it would stop the event slot being
wedged: an orphaned ITE today can't be DISCARD-ed or remapped with
MAPTI. But the ITT entry has to be zeroed with it, the way DISCARD
does, or an earlier save's entry stays in the slot and restore fails
find_collection() on the destination. Oliver suggested the same on v1
[2].

That pairing is what makes me doubt the BASER reset. There we would be
zeroing every ITE of every mapped device from the GITS_BASER write
handler, which is an unbounded number of guest memory writes on a
register access, and unlike MAPC(V=0) that write isn't UNPREDICTABLE
to begin with.

Cheers,
/fuad

[1] https://lore.kernel.org/all/178621413198.380376.1272590130654213471.b4-ty@kernel.org/
[2] https://lore.kernel.org/all/anQQ3dcbk72N1g1a@kernel.org/

> Thanks
>
> Eric>   next_offset = compute_next_eventid_offset(&dev->itt_head, ite);
> >       val = ((u64)next_offset << KVM_ITS_ITE_NEXT_SHIFT) |
> >              ((u64)ite->irq->intid << KVM_ITS_ITE_PINTID_SHIFT) |
>

