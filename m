Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB78ACCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kc+KKthH3EZzvZbA3/zNivfsabMNFBxOZip1Q8c96nE=; b=fffsfHa0C9kYRMx14jTYK/S0Qv
	Cn9E56VPH5DOLsoO5iG31VuQkXX7aY6Ti+gCjDoYb1m9z2Z49yyV90Aaw8+EdDRsR9IOyjLP5bOFn
	SEWGbMIOUdL+qvZ86Hd8IK4L6+YQiWWXn/Yh1hEigYalgmrfuAK9ePQENcL4RVseJwfhAobp5P1NT
	iumRMRvDqa/s1Le77BUzl6z+FlXT4dsDOk12ra8zFzV94eANz4rgP4vqFz3dFv8xNBHIvTE5gibnp
	X1ABcI+tC/Rh880+CWRaguDWOalKebFk43FFxGBfdUJYuje01aADa05PW/xatNa5aXMj8HNClW63a
	+HR+VShQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTzr-000000022dw-0umV;
	Wed, 22 Oct 2025 08:15:03 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTzo-000000022ba-2aIX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:15:01 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-88ed6837e2eso1373318885a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 01:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761120899; x=1761725699; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kc+KKthH3EZzvZbA3/zNivfsabMNFBxOZip1Q8c96nE=;
        b=BUe/bNqmqBJHK65HnfdnuFHYZEgJcQWxNJnRKd6inYaaip2/MtOaaJnLfW7mgj+enw
         8tbnh0wDN0kC6+7Pk0cG8Rlo3bBt5Vn+VmXgS721czkKQNY5OVSM08jRHe2FmeOloMmu
         ryWtcvVrIgISktY28WbE0ezkSpudy9TFtXfyiDd3C1mBV5bPmvMPKkkjFY0A8FLMYc9d
         waKfSMzAuDySBtCZlWpJT/3qmZRU0lAlBSjm/FtZBCzrp6G/uzdF2rqZOiJT3R6wbjJK
         HSTV6SAUs/Ehj7pJ3pLlBKnlnMoZNhR1LkxeLmONs/fULNaDslerV+ob0IH7Oj7w/L3O
         SiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120899; x=1761725699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kc+KKthH3EZzvZbA3/zNivfsabMNFBxOZip1Q8c96nE=;
        b=l7lssknybCFCxw14ZUi7bz4ViRHorHRc3km8Dh30vdZ6x7RW9rnbXyx050MIUU95+p
         6IG7Wi7hGdsuhzq5OvwTbHLMCPZGvPV5ilPyyTM8wXrUU6IBRk88yP7yKd4wKB4+ZJ2O
         vDlmqqJo/TTFuR7J83/mLGJbyb+RSb/CJxbkQCawgCDe2+ybJKaHiIBUY3cLvi8cPST2
         Xp7fxOeH/GfbpqTcKlAluQlQdQ9OhdUP1CezqM7iTpaGVk6h7i6yhAGeH9tMYfl7osQz
         8da9OhU4QvPzvOSIE6ikLNu1x5khkNhZgiZ0n/rKOWcSf9hSq7WdgVpyeJc/Nh2428qp
         fuhw==
X-Forwarded-Encrypted: i=1; AJvYcCVIgywGp3Y335U+hStin/8g++5jYYLsjJ2OgGwFBCjnb5f/c7AC0CDkCIiy7zhXZ/Egeb2gFR2KFsivQW7UW3+G@lists.infradead.org
X-Gm-Message-State: AOJu0YzK53WHbvywFp5WHL9Hrw08tpoIf0nUdL4ppEu2yb2SF+MW15In
	bbFnAqiU/cw6FtSLCy3BG7VJwWSN2O+D9VEIe10bSM+9GLPi4bCd1HVrDEJ3Qc4aDiXNShs+gwk
	ianbpT9zuK6EqjzRMy/zRLth8K/llteA=
X-Gm-Gg: ASbGncvFK0NQRIqjIsfFsGoNVUHjAXxPsRyK2hFLLswSiMmmmqdCdV6T0NIXY7mr2qF
	hMTgk1qvL7UixqrqkCzVd6f5DoPY9K3yFsDiA117xMcHHzUlOf5zNLKMDiAiheJ4qp6u8ZOZe0O
	vjq4QPNe5hMzwH/EpX/Z+qU6Ct2rxOLVBB+MGHIDlg/ecs5soQT3Vl9tmLISAIQRFoSpZ5Y0yeA
	uJzNy6KnYVdN/u+0TpLRooX+zpyBBlLf5S1Cm3BgLJymT7o1GmfWvkoUKTkVEbf+YES2sYLihnm
	Ww1T9lxBqUttPTPT
X-Google-Smtp-Source: AGHT+IEhER7MQg3744Yoz4/uML1arKqJYpMl8e42fCr1hdvltEI2c6JTn5tM+Uei72z9xIzjCvWCn/SXFXsGhGVB7zM=
X-Received: by 2002:a05:620a:471e:b0:892:624f:7f71 with SMTP id
 af79cd13be357-892624f82b4mr1714089585a.88.1761120899131; Wed, 22 Oct 2025
 01:14:59 -0700 (PDT)
MIME-Version: 1.0
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-3-ying.huang@linux.alibaba.com> <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
 <87a51jfl44.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <87a51jfl44.fsf@DESKTOP-5N7EMDA>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 22 Oct 2025 21:14:48 +1300
X-Gm-Features: AS18NWBLKZ7qT2Y1R89WO7GO8UtVmSMjKHbsauP0TH-Q88ewqIZQTW6sMd0AXws
Message-ID: <CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
Subject: Re: [PATCH -v2 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Yin Fengwei <fengwei_yin@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_011500_789523_EB79A1AE 
X-CRM114-Status: GOOD (  16.29  )
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

> >
> > static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
> >                                            unsigned long uaddr)
> > {
> >         unsigned long addr;
> >
> >         dsb(ishst);
> >         addr =3D __TLBI_VADDR(uaddr, ASID(mm));
> >         __tlbi(vale1is, addr);
> >         __tlbi_user(vale1is, addr);
> >         mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE_MA=
SK,
> >                                                 (uaddr & PAGE_MASK) +
> > PAGE_SIZE);
> > }
>
> IIUC, _nosync() here means doesn't synchronize with the following code.
> It still synchronizes with the previous code, mainly the page table
> changing.  And, Yes.  There may be room to improve this.
>
> > On the other hand, __ptep_set_access_flags() doesn=E2=80=99t seem to us=
e
> > set_ptes(), so there=E2=80=99s no guarantee the updated PTEs are visibl=
e to all
> > cores. If a remote CPU later encounters a page fault and performs a TLB
> > invalidation, will it still see a stable PTE?
>
> I don't think so.  We just flush local TLB in local_flush_tlb_page()
> family functions.  So, we only needs to guarantee the page table changes
> are available for the local page table walking.  If a page fault occurs
> on a remote CPU, we will call local_flush_tlb_page() on the remote CPU.
>

My concern is that:

We don=E2=80=99t have a dsb(ish) to ensure the PTE page table is visible to=
 remote
CPUs, since you=E2=80=99re using dsb(nsh). So even if a remote CPU performs
local_flush_tlb_page(), the memory may not be synchronized yet, and it coul=
d
still see the old PTE.

Thanks
Barry

