Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E05CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhkH+62s9AhGNEt/gcdilWodKjE5uLzcv1BGhnCuNyc=; b=bkbAVB9qeB3Qe5SO24b0Crript
	q9/ERC3eUSv4TAEMVs6rF46FRdo0hYQAYRqFSiGIJUr67+IMbuLDxEl2IRoB0wfTiIh4wAubHGqJQ
	irWg+wbfuOmCg38RTkhfniGSzDOtnEoobY1EZdhxmNAGFb3NUml/MhT5lKy8CDap1EDz2B08U6mnf
	VbDWPoHk5q3ul0GvByU0O+lvOe4Nhp1ZFsuTF+YKatDBjeN3QBu2DCTQ0znS71xu+kkOYFbncRQPX
	9lDzhZ2lSOO2s4k4Ccb40TK3fkVaN9IgNu33CqgjsD3PYAAOwwFGTanVmWjNbepzWW5vJhrLO/+1D
	ZJtE73Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUyx-00000002Emm-3NJT;
	Wed, 22 Oct 2025 09:18:11 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBUyu-00000002Em5-3Mxt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:18:10 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-85a4ceb4c3dso875409785a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761124687; x=1761729487; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhkH+62s9AhGNEt/gcdilWodKjE5uLzcv1BGhnCuNyc=;
        b=aiOLv60CJ1U6tMM7t/7VoqFM6nnAPIWEsiJ9hYP+81ExdEIh8UUM5ya7FbSwxT3IiM
         IzM3SxMwaa1+DREQBj79SYCeFrpE2/eNXDEhQcs7AOGyXGMpeXE2RHJDFAilvay4xKyC
         RgsT/AiQc/RBWRGH/f6dwzXWz5/PWYmreb8OaUFrH914CFMTKUviHu1CaM+3wJOvAfxl
         cfQ/SRxZzojfxfds6D05zB7EQgXvZxmMGMShMspxIyuDOmkSxgcirjq05ANsHGKNcExg
         8XCfJx/aYyxSLqr/IDB9V8PQik8cTde0kr1ADIX0jq7zACk+nh36qGy1GdQ1lABYxg2m
         dcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124687; x=1761729487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhkH+62s9AhGNEt/gcdilWodKjE5uLzcv1BGhnCuNyc=;
        b=h3v2HwwEerL+6nXmF7VbdDmVooBxomSwZSiCOSm4VO+ovrnzTWBVcc4BGgj12NlBU1
         Jez2TVGKPozM45Bzkn/656HO53M6bVGiu66V3huB1f9VITi6ooAGSjg0VBQd8c7Ag/46
         f48YT34qf7E/50cX1P6gGeaqa4CDLzSgfANnMDts1Dc34mYicoKKQC2+SdMehqqszRdH
         uPb8IeFfzkshAiOeTa5gFbpgtLQYi/l7k6aoD6PJrhHm5Ef1r9E2AFrp7ocRHOU7pKhf
         cg+amuqMwLBZ47ogP58Gv1wo6LY++dkoVaU4KBE6x3WYC0CRLxQMSoCtfzwOQt0pWoPV
         fB4A==
X-Forwarded-Encrypted: i=1; AJvYcCVdi1+BT9KER+q7Yq5L0Dih5FWyptBBvHe868T0bvMF4Mom4BxtYeQ0FlIgutQcwnGqAJJloDt+Flvsv8/MYCQ6@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjd1ZKR/hlUPIeohxjVX56BE7n8fMxkqkoIaMqCo7CwNFhD6Ey
	oLuyUV2Pby7TlnGpi+C3IcWoxnyCluydY9EiejTXBe/Bbxt9hNUOlM8Qo5B3n0YTBAMwY0TzKXG
	8BKywWe4tRq25Fb8CINayEUxhbfKgh84=
X-Gm-Gg: ASbGncvAzyT2bGt4WQW63UMrm7KjH/Y+2TfFTsrKvREHi9moEYChSMJj2MARPd2uXd9
	HMrrVwF/YJg/btk65kSTSseYlX/k0DoNpsFxXjWfSF2SJ6RO/GLNlv1JeAS5DahvA/tn3o6uxO3
	liEx2WpSK8y1E+O0Ii3S3qdlVA7Z4tp7yZ4gHMuPBUNN2aB/ze6Pqd3Bv2ZfhoDCi3IANgZqWgS
	CSejXII87LZxfn5lD3bVsb6vhekpQlA/b0ZNXnIs1wwLGiSb/ZMAkhG76HxPgFtI9PBIyWX3//v
	qbi4/iA4bYAdgNsD
X-Google-Smtp-Source: AGHT+IF8ppZ20Wu/vkfm6iPYBWUkrNxb51/1c5/VT0XmJ/5FqE678G9roI4AMEu38Z7ygSJiTsaYJgwfrr18a9ZMw5I=
X-Received: by 2002:a05:620a:4710:b0:892:501a:290 with SMTP id
 af79cd13be357-892501a057amr1576601285a.86.1761124687335; Wed, 22 Oct 2025
 02:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-3-ying.huang@linux.alibaba.com> <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
 <87a51jfl44.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
 <871pmv9unr.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <871pmv9unr.fsf@DESKTOP-5N7EMDA>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 22 Oct 2025 22:17:56 +1300
X-Gm-Features: AS18NWD3ObRkO5HEsMcrxUcjKoB8vtoXwTiGu2WDg5GLSA8-uJXsohVYB76Ay-4
Message-ID: <CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251022_021808_895775_2BFC78BF 
X-CRM114-Status: GOOD (  24.98  )
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

On Wed, Oct 22, 2025 at 10:02=E2=80=AFPM Huang, Ying
<ying.huang@linux.alibaba.com> wrote:
>
> Barry Song <21cnbao@gmail.com> writes:
>
> >> >
> >> > static inline void __flush_tlb_page_nosync(struct mm_struct *mm,
> >> >                                            unsigned long uaddr)
> >> > {
> >> >         unsigned long addr;
> >> >
> >> >         dsb(ishst);
> >> >         addr =3D __TLBI_VADDR(uaddr, ASID(mm));
> >> >         __tlbi(vale1is, addr);
> >> >         __tlbi_user(vale1is, addr);
> >> >         mmu_notifier_arch_invalidate_secondary_tlbs(mm, uaddr & PAGE=
_MASK,
> >> >                                                 (uaddr & PAGE_MASK) =
+
> >> > PAGE_SIZE);
> >> > }
> >>
> >> IIUC, _nosync() here means doesn't synchronize with the following code=
.
> >> It still synchronizes with the previous code, mainly the page table
> >> changing.  And, Yes.  There may be room to improve this.
> >>
> >> > On the other hand, __ptep_set_access_flags() doesn=E2=80=99t seem to=
 use
> >> > set_ptes(), so there=E2=80=99s no guarantee the updated PTEs are vis=
ible to all
> >> > cores. If a remote CPU later encounters a page fault and performs a =
TLB
> >> > invalidation, will it still see a stable PTE?
> >>
> >> I don't think so.  We just flush local TLB in local_flush_tlb_page()
> >> family functions.  So, we only needs to guarantee the page table chang=
es
> >> are available for the local page table walking.  If a page fault occur=
s
> >> on a remote CPU, we will call local_flush_tlb_page() on the remote CPU=
.
> >>
> >
> > My concern is that:
> >
> > We don=E2=80=99t have a dsb(ish) to ensure the PTE page table is visibl=
e to remote
> > CPUs, since you=E2=80=99re using dsb(nsh). So even if a remote CPU perf=
orms
> > local_flush_tlb_page(), the memory may not be synchronized yet, and it =
could
> > still see the old PTE.
>
> So, do you think that after the load/store unit of the remote CPU have
> seen the new PTE, the page table walker could still see the old PTE?  I

Without a barrier in the ish domain, remote CPUs=E2=80=99 load/store units =
may not
see the new PTE written by the first CPU performing the reuse.

That=E2=80=99s why we need a barrier in the ish domain to ensure the PTE is
actually visible across the SMP domain. A store instruction doesn=E2=80=99t=
 guarantee
that the data is immediately visible to other CPUs =E2=80=94 at least not f=
or load
instructions.

Though, I=E2=80=99m not entirely sure about the page table walker case.

> doubt it.  Even if so, the worse case is one extra spurious page fault?
> If the possibility of the worst case is low enough, that should be OK.

CPU0:                    CPU1:

write pte;

do local tlbi;

                                       page fault;
                                       do local tlbi; -> still old PTE

pte visible to CPU1

>
> Additionally, the page table lock is held when writing PTE on this CPU
> and re-reading PTE on the remote CPU.  That provides some memory order
> guarantee too.

Right, the PTL might take care of it automatically.

Thanks
Barry

