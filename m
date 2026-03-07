Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6069EFC9EDA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 07:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tX+dqbFssi21Y335rPAh+90TuALSmaMUbgkgea4z6B4=; b=aUD0MRcZaQc/fjQMjKbL6m+uEP
	TvViLwksrRcBrL1ss6Fgcxav8vz59Lbnd831IxdeYW0ZcwFZ3NNPxgNYH1Sq8F0SQ5nED9SeUAC41
	Cp7HH3crakDMcIR5wGL7U2T2lBnG8T2bSi39Rm7307QPCx+A1SaLcXIp02jXx99TmBbxGpxHjZ9H7
	Ey5vvEM+XLL3BSGyMK8mypdigYWI+qwLka+x2hx7/3l1MtEL9WCcZjF5zGAcc625JimOXjVgSRb+e
	ZnwOZzVDAoCIYeK7uxLqRIwHVxYMP+oAncZb+8VMSE9g/W9XMsaTGs3hbUTMISMftA919Ori1Lal5
	UwklF7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymIT-00000004z2E-1VkA;
	Sat, 07 Mar 2026 07:42:01 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vymIP-00000004z1t-33A8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 07:41:59 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-8cd78a4ce8dso39489285a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 23:41:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772869316; cv=none;
        d=google.com; s=arc-20240605;
        b=RHyF9+wYoovYd73r82PmASbZz7GuHOgVlwFfY9rgqfm4YRX0UJk6Up3XjocbmJA/3+
         16PAxBqRkRLaT88lLYoWAWL4yJGdSgVTyAJ7QdpB85E3h5nYYK8nOgjL/+SMdL3h9l8k
         4bJbBVfe/ABzMPTknRq2vSJGVXuaYrYTHcsTqyIpN+a+BOQ6BlgDPib5Enl4Gcxh3fBS
         d4qGKTrpvZ5YNxkKVqxxjUIN340gYJ2tU+1TMlW7UsNKbgFf84K+kNr6MCMzMKjIqDek
         rHxE5UW22st9wgdpguGlZ3ceCRZlfn/v+HVdFswOgJMTEvAKDK7v1j4uInoMT2QFb0C1
         oGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tX+dqbFssi21Y335rPAh+90TuALSmaMUbgkgea4z6B4=;
        fh=MAwQLCN2p8wnxSz4X+Ss5irKvhq2Jyku90rVpKwB0Gg=;
        b=cOUfo2JmuM7pUwIL22dNCYvo5KOkngOEbkvZ5e5U0+JFCN7KpF9NHxg7Mi1+pyMXQc
         3jJrL/uGfNzqee+tLf6Uc+Ui6MYD5Am5g8qP7wT6Hu61MRF/Kwr9U6CsE0Jkjff0Jgt8
         fSVtQXbiWp26DYdP8YYXGRk5Ge8raXHIY5dsCwGMRYAd2cWBZgKnXSdmu7HNgIL1wg+n
         ytDd+Dm7ZQHrvob+XZeQSYODiIkDJzs0kZ0QIHsnKzPHWWY+NNFbtlO6wuiMij5CG9x3
         JXMZQlXnXqh2grujhdzJT6ouCBFFVOALQZRFkpftDys7prk4T2fFkHK885DJOGPArfAf
         Qt1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772869316; x=1773474116; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX+dqbFssi21Y335rPAh+90TuALSmaMUbgkgea4z6B4=;
        b=aifA9cFs7Pfdw7L07FpAo9yRtfLS5B5c8G39jcfzPJUbrQj2ZI+wJnLw02edjVeoV6
         5BhCqLEUVvyb8TlNelW5pcVImpOp1DGRLdCaI+E6BMaAz12QluQ4EbO1RONJhNof5SgL
         032bWFuqJ7LlpkWUlnZ1q93d4trqcGUopmJCwlh/egn8+KaXvwmtAuNyqWCNfLhLWKg4
         zTllKiIT/vD13PuuvQX1f847fwhX3HEfIE7xqa0lzvQBsSf5PEBstihy+e77CS4WcVTH
         kHEy6uhKZcBsF6DpYkXiu4P6ttf2Ua5+t9fJ94m/iEEWw3PdepsNc43WclBVW1zjSg3l
         mmtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772869316; x=1773474116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tX+dqbFssi21Y335rPAh+90TuALSmaMUbgkgea4z6B4=;
        b=QUicbGIi6/gJmfpGiCDS6w1tFY7Jt6IWoxqNbaEoubYIBNov9c1OGBzmWKHfBDJBzf
         GjATCtpgGxqIqR7lmn3h5oWp0D41UiBSVk/Ac57qPCTkjuHllEbn6MK5AtqHjpPBHBp9
         8BSfFlLPLydgLycyxzuWz80+I5vgzAPWeS7l065nz7C4A8TjlqtQ0YrZtYbFTHfyRj11
         xqN5lOKBBOEZ8/pTNKWsyV6w33QkN9tT5YXI42mihDScAluchiRNiW/3NaZ9RKGbCEWc
         gruAK1QUyfOTxca5IzvXkX5aDfv6+c9X4vBYRdEhc3ta731iMOubf4GzvEPlFHofnmuO
         zeOA==
X-Forwarded-Encrypted: i=1; AJvYcCUybhqm5cXPPWgtNJTbfQQTk6GxgTtZvjHVR6pamPjTgO9TIOASsnmakJ3NOCHCJp90oj6KSnyTzN++DJk+URvh@lists.infradead.org
X-Gm-Message-State: AOJu0YwGvHPXnu+Gxc4ZBCd+n4Rc4BDpM9nTexSAJWweH0kTR43cdMbg
	QzqFK8p5NWJOYm4tc3aRDIThjlhj9Eic44zLtU4FdJmTPUrIoDiHjp26okAv6W9eEgIN2MUPbVz
	VuQgIDOXnJdqoAJtQy67zyybqlnfMfzU=
X-Gm-Gg: ATEYQzx6shwnt+nzxr+Ydbuj2YWUivU6sDG4BCxwVlB8xlmaCs97vqRSBGKS/66Z0Ek
	xWtmQmqKJDeyzINtnab/Qsx8fkLHgcKmvAAjiaFTA8etbRKnhbE8euXUsclySWyvxbgg95X+5ul
	AJ70EXuHkBzl5VPexZ7Jtkd4Nmyv3vk2esITVaLxklTHFy6sy0Tft1jRR0nQWJh+7Fm+QuF58LZ
	6rn9DY8068kpGOGYSrq+HHxZOTgtMPJkwndgBmZBEgX5xOJwvZgsH7sioo2paXIQc+71eYfXsm5
	00BiqA==
X-Received: by 2002:a05:620a:4623:b0:8ca:2cfa:822e with SMTP id
 af79cd13be357-8cd6d4f04c4mr588738585a.70.1772869315786; Fri, 06 Mar 2026
 23:41:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770645603.git.baolin.wang@linux.alibaba.com>
 <ce749fbae3e900e733fa104a16fcb3ca9fe4f9bd.1770645603.git.baolin.wang@linux.alibaba.com>
 <CAGsJ_4wA-bpCaY8uLnwmzDT40s4RbsOXdRutvj5bZU+Em6cFeg@mail.gmail.com> <721abb6a-93a0-4db3-9e69-ef23b253e4f5@linux.alibaba.com>
In-Reply-To: <721abb6a-93a0-4db3-9e69-ef23b253e4f5@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 7 Mar 2026 15:41:44 +0800
X-Gm-Features: AaiRm51_Rahv1hV9qlyIIE65VmzabdoLUrAFZtPhvFkXuN5CigKtPXJw7G_VqPk
Message-ID: <CAGsJ_4z5-haVRzeF253Adpugv09qu8xpGd0WVpU3OfegK7sxQw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] arm64: mm: implement the architecture-specific clear_flush_young_ptes()
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, david@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, riel@surriel.com, harry.yoo@oracle.com, jannh@google.com, 
	willy@infradead.org, dev.jain@arm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_234157_789306_9C5B110C 
X-CRM114-Status: GOOD (  25.98  )
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

On Sat, Mar 7, 2026 at 10:14=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 3/7/26 5:20 AM, Barry Song wrote:
> > On Mon, Feb 9, 2026 at 10:07=E2=80=AFPM Baolin Wang
> > <baolin.wang@linux.alibaba.com> wrote:
> >>
> >> Implement the Arm64 architecture-specific clear_flush_young_ptes() to =
enable
> >> batched checking of young flags and TLB flushing, improving performanc=
e during
> >> large folio reclamation.
> >>
> >> Performance testing:
> >> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, an=
d try to
> >> reclaim 8G file-backed folios via the memory.reclaim interface. I can =
observe
> >> 33% performance improvement on my Arm64 32-core server (and 10%+ impro=
vement
> >> on my X86 machine). Meanwhile, the hotspot folio_check_references() dr=
opped
> >> from approximately 35% to around 5%.
> >>
> >> W/o patchset:
> >> real    0m1.518s
> >> user    0m0.000s
> >> sys     0m1.518s
> >>
> >> W/ patchset:
> >> real    0m1.018s
> >> user    0m0.000s
> >> sys     0m1.018s
> >>
> >> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> >> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> >
> > Reviewed-by: Barry Song <baohua@kernel.org>
>
> Thanks Barry. But this series has been upstreamed, I can not add your
> reviewed tag.
>
> >
> >> ---
> >>   arch/arm64/include/asm/pgtable.h | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm=
/pgtable.h
> >> index 3dabf5ea17fa..a17eb8a76788 100644
> >> --- a/arch/arm64/include/asm/pgtable.h
> >> +++ b/arch/arm64/include/asm/pgtable.h
> >> @@ -1838,6 +1838,17 @@ static inline int ptep_clear_flush_young(struct=
 vm_area_struct *vma,
> >>          return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
> >>   }
> >>
> >> +#define clear_flush_young_ptes clear_flush_young_ptes
> >> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
> >> +                                        unsigned long addr, pte_t *pt=
ep,
> >> +                                        unsigned int nr)
> >> +{
> >> +       if (likely(nr =3D=3D 1 && !pte_cont(__ptep_get(ptep))))
> >> +               return __ptep_clear_flush_young(vma, addr, ptep);
> >> +
> >> +       return contpte_clear_flush_young_ptes(vma, addr, ptep, nr);
> >> +}
> >
> > A similar question arises here:
> >
> > If nr =3D 4 for 16KB large folios and one of those entries is young,
> > we end up flushing the TLB for all 4 PTEs.
> >
> > If all four entries are young, we win; if only one is young, it seems
> > we flush 3 redundant pages. but arm64 has TLB coalescing, so
> > maybe they are just one TLB?
>
> We discussed a similar issue in the previous thread [1], and I quote
> some comments from Ryan:
>
> "
> My concern was the opportunity cost of evicting the entries for all the
> non-accessed parts of the folio from the TLB. But of course, I'm talking
> nonsense because the architecture does not allow caching non-accessed
> entries in the TLB.
> "

You and Ryan are clearly smarter than me :-) Thinking about it
again, worrying about shooting down the TLBs of non-accessed
PTEs seems to be nonsense.

>
> [1]
> https://lore.kernel.org/all/02239ca7-9701-4bfa-af0f-dcf0d05a3e89@linux.al=
ibaba.com/
>

Thanks
Barry

