Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A7CC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuTntz9BFf5ebn4Es7zVDFmervtvOhJ6FRn+jJiUsIQ=; b=yFRG/CjgQGWa6n8jc4nwvCQ0ux
	dUtpD+6nQOyItTYrfAqrB11gSLmr2dLx3DwtaocUlvs6/ke9wejXBnm3bPPK1w9UCw7PN8fjvjqtw
	j38k3RMwwOVS+o8x5QlITKZBKLbO+V6SM98BipAftV4i6b6IPlSOXhTzD9lqXP23k1vXPGHvDuGPE
	Dr+Au6qcuFuMUycYNQZyGCp7riu1uxBrZoRqyHggppQIfZD1XsfmziOsSvgoZmfYvFLQYBt78dLOY
	qcZPl6TCt9pY2QtmBiD3c/84iO7dY5E7heNWAmD3z2J8819uhMxWn8HqS8TTXNq3LGLkKCBEsirsC
	DZncWD/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYr7-0000000A66G-41sq;
	Wed, 25 Jun 2025 22:44:37 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXHL-00000009w15-3cik;
	Wed, 25 Jun 2025 21:03:40 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7d219896edeso33142785a.1;
        Wed, 25 Jun 2025 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750885415; x=1751490215; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuTntz9BFf5ebn4Es7zVDFmervtvOhJ6FRn+jJiUsIQ=;
        b=Rvw/RFh0S0kWomn2fbt2r8TxoH7g5fraGyvYpJaczCZzrtF1KaNMvNJxXmwZfdq9rJ
         pAMbsCN58iIbLJdYL3rTGLg+LnbHavOiQbA9b+Pk9yFOLS5XNGNdAdxqiYWv5zT9WWPM
         HohbXlaSFexAM5xpNxw+q+UTOMNZFD55k8BNckyoiVeIX6kqK+pKbmalayZvBI2RXhNW
         CKd+/17xwlHhsIYnx9Jd2Zvhd1GI67lXn7CAjoIpepvP/10T9ZgPFQQTTrSLuZ49BnrX
         p7soaS3ZtzzrWXRYYepTYxGBGNM5Qb1oBQTND9iSEuiOTaV1/KfPVUKCRa8kKVFebmjo
         qZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750885415; x=1751490215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuTntz9BFf5ebn4Es7zVDFmervtvOhJ6FRn+jJiUsIQ=;
        b=HfNNHNZ19qv5uGt3GOGjCCfnIR2KUIZKhK1f27qlh126d3MjapR+dhKIz1JAHuN+M7
         +dHM7IdtBIwTho4gGsM2njZXaoiojlL+KTnVeuBpon0Q2WGu61LzrvmN67ZboIr8XK6K
         HoAcok+0tpYCUjcwVJkH+o594mp3SvnEttYLWde7dnpM28jajdkMPLKVc1LyaJbPexJ5
         gCQDYusj7U1Bu9BtxKzl+g4t8pmwl/UMGu7j3Dtn9HiARcRO9BElWNsBD1LJVIDckp6G
         OwLCGCrkbiNfHuebNqTEy9+Nz45DxVGJgNA4Gzteo9/pC7iKcP6MiXcC8Pux1hY4U/l+
         D/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXV63BKlIjI2gVsTS+BTl2j/hYMasvCpuDGUiPc9C3wlpNE00yCuZffs2OeE2klYVTdglIy6gLkATTmgXU=@lists.infradead.org, AJvYcCXvvZmEmnP5Ugw38KLSJAiNQtLbC2o06OQulNty9cWDISogYV0jU2JuCRG9qgBbxjSjHziPx9oBfu2+s7WTdWWV@lists.infradead.org
X-Gm-Message-State: AOJu0YyE39TDcTYaBEq/RPj2Ly8ldNeOcCZ5KoOve4ZviNbNVh02v8eD
	OIeRusVfGYsxxugTYpYGP/CfvAYwqApoChbQpKrLzTV1xfvAPI+M8UcxaC3sZW3lztOgJjcxb2e
	5MNsKqqeskI31iJGTxWFDkXNGkqmXY/Q=
X-Gm-Gg: ASbGnctBgXbdn4MBpU29FPo0w3PmiSaldGhIFljlLA6Je6v6n8j7vuZbfAxyf11aTUC
	6nGsgUlRvmBh23emgwzUzGMYN5YmENm+D1pA1BDSTFAOFVGNPRLQlJAPendXTkVxOkSvL872Jtr
	vrpwn2ZrUMQEG/u0VbxaP6Amd34WcpeFvQAMIpNUDdv8A=
X-Google-Smtp-Source: AGHT+IGkZzN4RHAItzfVLBrQRGdxtXN6wVwXiT3SzYF5su+kRDMMqhI/uAjSaA5p+2yU3Clxr1zSjUyiiTMDtJ2mex0=
X-Received: by 2002:a05:620a:2b93:b0:7c5:4adb:782a with SMTP id
 af79cd13be357-7d4296921f8mr635368985a.9.1750885414506; Wed, 25 Jun 2025
 14:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev> <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com> <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com> <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com> <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
In-Reply-To: <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 26 Jun 2025 09:03:23 +1200
X-Gm-Features: Ac12FXzQ50B3QUTM3cNo6E1eE61G-cA_2po-kY1vzGFbEMDCEnj9ZU8KpCPcWfA
Message-ID: <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_140335_903614_A8C5B0D8 
X-CRM114-Status: GOOD (  13.72  )
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

On Thu, Jun 26, 2025 at 12:25=E2=80=AFAM David Hildenbrand <david@redhat.co=
m> wrote:
>
> On 25.06.25 14:20, Lance Yang wrote:
[...]
> > Hmm... I have a question about the reference counting here ...
> >
> >               if (vma->vm_flags & VM_LOCKED)
> >                       mlock_drain_local();
> >               folio_put(folio);
> >               /* We have already batched the entire folio */
> >
> > Does anyone else still hold a reference to this folio after folio_put()=
?
>
> The caller of the unmap operation should better hold a reference :)
>
> Also, I am not sure why we don't perform a
>
> folio_put_refs(folio, nr_pages);

Because we've already called folio_ref_sub(folio, nr_pages - 1);
Looking back, it=E2=80=99s kind of ugly, huh.

discard:
                if (unlikely(folio_test_hugetlb(folio))) {
                        hugetlb_remove_rmap(folio);
                } else {
                        folio_remove_rmap_ptes(folio, subpage, nr_pages, vm=
a);
                        folio_ref_sub(folio, nr_pages - 1);
                }

I assume Lance will send a patch? If so, remember to remove this
when switching to folio_put_refs(folio, nr_pages);

Thanks
Barry

