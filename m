Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D73F3380B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 07:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rubzpzzB8MUH8wxty2pbLXKd6ff9MzsvIIp3K5W+Xk=; b=iZRqTLYj8VOXoKkZRTXnVz6M1z
	HxWdRphHBaxHQi5Y2mRvdwTER6fcTBZKecQ4ISi+GtIee6jyTJBS4jVd/bN65WpHEZirLCLNfIecZ
	1uP336LmS8rR/oyFrtDjzzdgJNfc8YeZAt4fwTlgkAfdX5RzL6Mnz3ZCypQlhOlehzXEkN08oSxLD
	KE9nhyKWwbokkslg0Jb6HdnYAADqqg2qd1PlruIXDJz/e5K96i2voTsEEFq6kt2zolCJYKmv59Wqc
	sU8gv9t2slLQbdeMNODeSPmbcTVsTVeJRjsx5+RqqbK8C0xklE1Et5fjK58mhKGe2CwZxXLgCsCDG
	GbPg5APQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Osq-00000005ZjW-49td;
	Tue, 17 Mar 2026 07:30:32 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Oso-00000005Zix-1c4S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 07:30:31 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-899fb2b94c1so70666676d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 00:30:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773732629; cv=none;
        d=google.com; s=arc-20240605;
        b=FiKml3lLnsi4KhYcpDBygAUIe7KyVkevipxeGbWjAppmxjPXszLQUybrxgfsgMkAzT
         ygeJHI71/tQe0EtIoaOMlPakHx76jns0gqu/xDu626PO6ULDdMJfe2tFAASjhVpx6eTY
         iCsUFd5iXoEb18iC6vGy/RNYDupuBgLsEO48Ji3/RBCLIAnQmoGeiDF/snccb5MXIP6Y
         R9P4Uhgkds2v7yMECdHgBcxxdI8BaoWrNFUcAw7Ddfcg9ATBxBkrgLumIXeO3enjlwh3
         cSYWFlMEGoPBWeFgATprfiKgp3ZwEabM3/X73MnaowgIaoouaqsbDI+KLIa14N6xvYU6
         TlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3rubzpzzB8MUH8wxty2pbLXKd6ff9MzsvIIp3K5W+Xk=;
        fh=x6gOQ/sFBaL8jLYE0XCn0kRYgdQBvKl4PGKq2q49BH0=;
        b=UMij5IeKgLdheIyhfjhQupCjc8Mgi+Rn4cL8ZQq5AVcCYpUr3X11hAUaC8dMhU2TaZ
         9pvrhHjF4MyUiEsbzc43PdXbtzQ7pOj6daKNa1Vl/zxh7RrB7fjXlzDZOX7R89HjYeCq
         yRkmmEIlNMSi76Q17QzuTpRsPEapk6/ukzmIPwjgNUQRdvHrqK7+la2MooxM/Kmlx4w8
         6GhdUMl8/DQfvsei+i3+tg9ZYxziuww7AzV/cu/yHvbPCNdXDx/SFTIyv9/NR+Me0Oaq
         qeE3BZdk3g3v0CCMZPrAoSkJYnKe4pl2erTTKc+eHZ8qkwVH2xmnssrHZWUkKkhRnPbT
         GS4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773732629; x=1774337429; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rubzpzzB8MUH8wxty2pbLXKd6ff9MzsvIIp3K5W+Xk=;
        b=aIZmlox9SGW2fL9ET+rEa6rcoYCMlEb0vtdcIXeRJUqSXBnxrcmSn20WBJwrgDtimE
         KelS5oke2XTi3urV4/lyFb7+SuhOEc5fhLfHw2lEJOkFzEe4Y98rvD+xvcU0ApkA1XHJ
         QQ4DYKPT+rWKeaqaUjqHSHl671Rlq3h/b75zYfN5XLmoMkaVMFjxpLP23wmMJUK95U+P
         F6gLyVEI9emGNpgQJIoXW70X5ZXZmsC21BfT3flhRVyhq24AazvblWJgVUnjEsqiycfO
         jqRLnT5hkFhgrX6ARrphFIO01ktd6NpXGsmGd1DiXoSj2r0mX4ZQDOcrLp7wOU+IgeWm
         vlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773732629; x=1774337429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3rubzpzzB8MUH8wxty2pbLXKd6ff9MzsvIIp3K5W+Xk=;
        b=eM4PQcweWCGciPSbT8lUeDspxo9amKH32mXZ/LzJNzNDMt8mMYym5CjOdkrGExC8gg
         fJdgfTJfZPmGIlxgq0csrQQSEJPqk42oHqv7FoJjxBPDff+9wxKQ75Yq5cGzNpt5Paw4
         wm4W9OqiAK5Aqi+VJQcUCIpEUicCaYpFOlKm4poouHOgjGMzKPRJxmZBr1E7zR7p7lil
         kmKus1yl5CN5H3S9JtjS8RFKyD9joPPdywbRkeFLrZYjo7cMPNWM3uwwgrUpY6kjZ7kU
         Qpi7kOVw/4MAmIWozduOBy21N4rKW3I96ErHECkg7MrZUGcC+myvJDrUskt+TVCIMx3x
         mIZA==
X-Forwarded-Encrypted: i=1; AJvYcCVoJJO8tXbUZJ0uIbka/ecgVElapC0oE4yhV41ockUprIvlKOsCK8/0jMW06Z0zprprGYwfJH42ONn6RaGRYUhb@lists.infradead.org
X-Gm-Message-State: AOJu0YzKFMclOu4JeW+TuoxC7U/UD678s+gzOQRYLxZgrOhPOGS3g+CE
	elimuiVYAmftib0xQpUheslVkZKl6F3uMdriZCyuAIQzsFoK7zyER7993mI1pllAta+mcZcN1Hq
	dJdnDw+Tg1rN71r4km0N1kU2PyY4oOeBupLwj
X-Gm-Gg: ATEYQzwDEidTe/pOByztpUMaa5/y41M3NKSzeH0xX1qd0Ov5X7fWP0ShjVfqZXP1wpa
	OqDt+mIdhpOj60oJHnoQNqVzDPqEQdbHS+E6Dqz+3FpyB6uVHi2A+DkJ0GMfJheA01oZ6TIyTJE
	+hx9JHx1+D+fc508yiC/5XeEBmyuVGEwVfcOtIAQW/b/GbuiqdvZFgXKnNXyFaGObTN3K53vFt0
	CzD2nCEdbA5iU+h+7HaYGWN2HNttzrpMatBRY9lAPO+F/wcDCsYXwhnOgsa8d8GRFXWHXsVOraX
	HqziVw==
X-Received: by 2002:a05:6214:d0c:b0:89c:4d0f:d7d1 with SMTP id
 6a1803df08f44-89c4d0fe7c1mr108140756d6.33.1773732628222; Tue, 17 Mar 2026
 00:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <12132694536834262062d1fb304f8f8a064b6750.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4yEWn3kVZPQZatOJX7NLLv-OK9pAqUDuWz25XxG5hpV=w@mail.gmail.com>
 <a4d7cf56-eab4-431d-886b-a32456e44736@linux.alibaba.com> <CAGsJ_4woBVQdYcCbN1Btr2vxOL8OAujaHkNZZ41=S-TdNh-wbw@mail.gmail.com>
 <d6820b1e-52ae-4ef2-8342-11818fdd0cb1@linux.alibaba.com> <43831628-a00f-4292-9797-cb96a029bb00@kernel.org>
 <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
In-Reply-To: <e54e0ec1-b968-4e12-84a3-4e3d331b1c36@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 17 Mar 2026 15:30:16 +0800
X-Gm-Features: AaiRm51v7KZ6LJdp8f59n3252h3VgtjM9y-dQOSuXV4SMcvA6-267GRGnSt_9XY
Message-ID: <CAGsJ_4wZq7ZvMzMq513a89=VYs7gGkeVwSnAczxs_yYCHGFDQA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] mm: rmap: support batched checks of the references
 for large folios
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, akpm@linux-foundation.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_003030_441352_ED040B70 
X-CRM114-Status: GOOD (  23.32  )
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

On Mon, Mar 16, 2026 at 2:25=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 3/10/26 4:17 PM, David Hildenbrand (Arm) wrote:
> > On 3/10/26 02:37, Baolin Wang wrote:
> >>
> >>
> >> On 3/7/26 4:02 PM, Barry Song wrote:
> >>> On Sat, Mar 7, 2026 at 10:22=E2=80=AFAM Baolin Wang
> >>> <baolin.wang@linux.alibaba.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>>
> >>>> Thanks.
> >>>>
> >>>>
> >>>> Yes. In addition, this will involve many architectures=E2=80=99 impl=
ementations
> >>>> and their differing TLB flush mechanisms, so it=E2=80=99s difficult =
to make a
> >>>> reasonable per-architecture measurement. If any architecture has a m=
ore
> >>>> efficient flush method, I=E2=80=99d prefer to implement an architect=
ure=E2=80=91specific
> >>>> clear_flush_young_ptes().
> >>>
> >>> Right! Since TLBI is usually quite expensive, I wonder if a generic
> >>> implementation for architectures lacking clear_flush_young_ptes()
> >>> might benefit from something like the below (just a very rough idea):
> >>>
> >>> int clear_flush_young_ptes(struct vm_area_struct *vma,
> >>>                   unsigned long addr, pte_t *ptep, unsigned int nr)
> >>> {
> >>>           unsigned long curr_addr =3D addr;
> >>>           int young =3D 0;
> >>>
> >>>           while (nr--) {
> >>>                   young |=3D ptep_test_and_clear_young(vma, curr_addr=
,
> >>> ptep);
> >>>                   ptep++;
> >>>                   curr_addr +=3D PAGE_SIZE;
> >>>           }
> >>>
> >>>           if (young)
> >>>                   flush_tlb_range(vma, addr, curr_addr);
> >>>           return young;
> >>> }
> >>
> >> I understand your point. I=E2=80=99m concerned that I can=E2=80=99t te=
st this patch on
> >> every architecture to validate the benefits. Anyway, let me try this o=
n
> >> my X86 machine first.
> >
> > In any case, please make that a follow-up patch :)
>
> Sure. However, after investigating RISC=E2=80=91V and x86, I found that
> ptep_clear_flush_young() does not flush the TLB on these architectures:
>
> int ptep_clear_flush_young(struct vm_area_struct *vma,
>                            unsigned long address, pte_t *ptep)
> {
>         /*
>          * On x86 CPUs, clearing the accessed bit without a TLB flush
>          * doesn't cause data corruption. [ It could cause incorrect
>          * page aging and the (mistaken) reclaim of hot pages, but the
>          * chance of that should be relatively low. ]
>          *
>          * So as a performance optimization don't flush the TLB when
>          * clearing the accessed bit, it will eventually be flushed by
>          * a context switch or a VM operation anyway. [ In the rare
>          * event of it not getting flushed for a long time the delay
>          * shouldn't really matter because there's no real memory
>          * pressure for swapout to react to. ]
>          */
>         return ptep_test_and_clear_young(vma, address, ptep);
> }
>
> I don't have access to other architectures, so I think we can postpone
> this optimization unless someone is interested in optimizing the TLB flus=
h.

The comment is interesting. I think it likely applies to most
architectures, including ARM64. The main reason ARM64 doesn=E2=80=99t use
this approach is probably that it can issue tlbi_nosync and then
rely on a final dsb to ensure all invalidations are completed=E2=80=94
and tlbi_nosync itself is relatively cheap.

Thanks
Barry

