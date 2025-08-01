Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E60C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 20:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c95SO1fHz9K24mtQ9wxAd9VJTGRZd8tCH+aRoccaHis=; b=dcVS+vkYzMzHHM6Du3L6iEwOPD
	mnuBUfLUDMLP6fmzvxu8OSX1sdC8DKiqLlK81pqETGPK1LYzGG7OcTeoxnczkyYvBSSlhCvcZaUwX
	EpD+xOI5QaAbCorI70cDqgvH9PJa1nsEYEuLd7eexBce5faqfqq1WvuRMwNICKWA5A2CsTAkNcD1/
	TficrMvZhAhw5ykArQxyPV84E1z5jdN99rMoEMafmNavXFQF/8v0ElaIuthpz6lwhkM2PtY1DGUu4
	TQH4hWU9MgRNz06PrXm+SgDeiF9Trnu2uYQJW41mUnijYGEvAxP4fBGqwmFVwwpFwFA8FnfGcsRn3
	LBRoQMgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhvzF-00000006iqa-1EHM;
	Fri, 01 Aug 2025 20:04:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhvwg-00000006ikz-074R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 20:01:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24070ef9e2eso33935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Aug 2025 13:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754078496; x=1754683296; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c95SO1fHz9K24mtQ9wxAd9VJTGRZd8tCH+aRoccaHis=;
        b=v8pgf8/d+30oa/deIR9MU6gj7JIAKEGMT2xLvQ0Gb1OakVODXVUSbU8cfoh1S0eq2c
         wISRCGSF9MZ8Aih+Epv0awvcz9KSBYRDZimEllhGKUPZQV3vBQup6dHA+M/6Vd6jrCU1
         Upk6hvUrZdyBs/mc5yGBH/zPCZh6fYQj7sUfP2TGZYvlF6ay3syo0TSLpzrpKLe7VAlZ
         Wi/0CstZuUTKogXUWTTgWzIUXddPQnxnzrGqCUQRlM6IjWzMHiPbhgIQl98hFUIWAW6I
         WO40gdvkj2hiI1Na4DR1LyL918AF7deDTkxG24RtgRJd9YsTUKtsvSTEhA6OoPOhJQqG
         TZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754078496; x=1754683296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c95SO1fHz9K24mtQ9wxAd9VJTGRZd8tCH+aRoccaHis=;
        b=ljalHReWFzep6llDgjvoSVWoNETSZ1YBj5ton2RLKornDOZ6Ff3yvomWYT3WSWtl2T
         jT0wDcfbBbG67IxS12grAdnP4N36rGZJq0v994kahFDdwqbD2oB8arWZwwADqxSDr8zt
         px9DZEPjfgX6+j0E3ooAzT7DhSP1GSEd0V4rsjbvI9mUIMleI4cxem+umF1YICzfJxsy
         wrdQqTQ8f9CN0GLimIrMORTDsv5XDOVl+hgi33h9mDYSpjPq2ILQ0posyLMSc/vB72Qs
         nCTv0WIoPxmY9stKr55narhQ7Iq6HUc6HiJK+Wu32v/FcMtkRFXO3ceSfm6E9w1VfDuK
         rAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU108i63l65ytpNmPgZSyISXgQciuV27z11DfYz+HYtYyTiLxwMqRopFPXGmQRQyT4QTIHTnj78yVLiq3RPiM4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2vtbHHvbkBmiiXR1kqY6JM+hnPSfjsvpiCu6LF5CsR+BZm5sK
	m4bwkE3g6yFgcEamKWrlOl5eDUwQqNemQiM5uK0Izu3MIDIXoqJioVHZJaSNpimDAHhGEB5Lvm5
	Y+78heaYCU5Dug8Nt3DiwqZa4hr/sp4ZEzZQwf05a
X-Gm-Gg: ASbGnctbSLqGNxatxEjF451ms92d1fiKJGccAC0Di2w2EXse78aAMUni7giXHx3ybHl
	sI10TnDdVEv4mzZgESJWxxloeCrqUGuyqX8rpgxTywdOsgsWgr5XU1G49UiD3uU5ZQnjTYoWZ8w
	GAipY4SFdPX36YJZZbYo1dMKSe19NjW5iswdETp5QGk1J9zytN2u9ZiLqlqbSp0VCrxNFpHQXTf
	DPTYl8=
X-Google-Smtp-Source: AGHT+IHuOxPllulgogwfmDjrZAE8YEK6VsCz4A2vXAP7UUNBEr6WAK+nuX9eymfhKP0sTBfL0OHu53T1yVXdOSprvqE=
X-Received: by 2002:a17:903:1cb:b0:240:640a:c564 with SMTP id
 d9443c01a7336-24248ba4bd4mr465995ad.3.1754078496365; Fri, 01 Aug 2025
 13:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <CALxfFW5-sXyF+K-PqZAZ7MKXkftnc1C3F59vTDhtWzk13Z3jQg@mail.gmail.com>
 <aIdR-Rv2Oi_hyl1h@willie-the-truck>
In-Reply-To: <aIdR-Rv2Oi_hyl1h@willie-the-truck>
From: Seth Jenkins <sethjenkins@google.com>
Date: Fri, 1 Aug 2025 16:01:25 -0400
X-Gm-Features: Ac12FXxrZblMonwmtq48c65BRuJLFrKBTNPkFb_lkl0dpzEa2aBWovpnwq7QDHA
Message-ID: <CALxfFW7ZdBhwv=978eFQuCwYSuD64Tb-SnKToN0druMwGJpCLg@mail.gmail.com>
Subject: Re: arm64: Linear mapping is mapped at the same static virtual address
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: security <security@kernel.org>, Jann Horn <jannh@google.com>, 
	Project Zero Comms <project-zero-comms@google.com>, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_130138_068721_564D245C 
X-CRM114-Status: GOOD (  27.79  )
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

+linux-arm-kernel

Okay, given that this is already public knowledge and technically
working-as-intended, I derestricted the bug report.

> the decision whether or not to randomize the placement of the system's
> DRAM inside the linear map is based on the capabilities of the CPU
> rather than how much memory is present at boot time. This change was
> necessary because memory hotplug may result in DRAM appearing in places
> that are not covered by the linear region at all (and therefore
> unusable) if the decision is solely based on the memory map at boot.

If I understand correctly, given that the PA space is already larger
than the linear region size, it is *already* impossible to prevent
memory hotplug from theoretically causing DRAM to appear in a place
that the linear region does not cover. Please correct me if I'm wrong
but it sounds like removing randomization doesn't resolve this issue,
*and* it introduces an *exceptionally* useful exploitation
target/primitive that makes KASLR substantially weaker than it already
was.

If we really need to support the absolute maximum amount of memory
hotpluggable RAM and we can't sacrifice a couple GB of address space
to enable randomization by default, maybe we could consider having a
CONFIG option for it instead - and require that config option on
Android GKI if it's not an option just to remove hotplug support from
GKI entirely.

Jann off-handedly suggested having a CONFIG option that says "I will
never need more than X amount of physical RAM" which sounds reasonable
as well.

On Mon, Jul 28, 2025 at 6:33=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> Hi Seth, [+Catalin]
>
> On Fri, Jul 25, 2025 at 01:43:57PM -0400, Seth Jenkins wrote:
> >    On arm64, when the kernel goes to map all of physical memory into th=
e
> >    linear mapping, it attempts to perform some randomization within a r=
ange
> >    calculated via the following logic in arm64_memblock_init():
> >            s64 range =3D linear_region_size -
> >                    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));
> >    On arm64 systems that use 3-level paging (such as Android), the avai=
lable
> >    virtual address space (linear_region_size) is smaller than the physi=
cal
> >    address space size supported by the CPU
> >    (BIT(id_aa64mmfr0_parange_to_phys_shift(parange))). This means
> >    the range is ultimately negative, no ASLR is performed at all, and t=
he
> >    linear mapping is placed at the same static virtual address every bo=
ot.
>
> We've been aware of this limitation for a while but we've not been able
> to improve the situation for kernels where memory hotplug is enabled
> (and that includes the Android GKI kernel used by Pixel).
>
> Consequently, we gave up recently and removed the randomisation entirely
> in 1db780bafa4c ("arm64/mm: Remove randomization of the linear map") so
> it would be better just to discuss this on the list (linux-arm-kernel@)
> if you have any suggestions for how we could perform the randomisation
> effectively in this case.
>
> Cheers,
>
> Will

