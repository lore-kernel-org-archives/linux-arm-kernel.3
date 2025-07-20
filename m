Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0EEC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 00:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMDu15B94CMFfjtDZHBtBYYs1+zD5YCySOnFKbF30Fk=; b=SunEhBhosBsOv10uTC19vsQAyf
	QO6PtQQjqfAfGckS+aMWAFqkV1DcpZHZB7e/nl/IUOz5puU5WUU+Ha1USVQwrqOdqLdiZ3N3Lpvuk
	+rTFzeM+X+UhXT/m2Bl8Z7KlAGoix8ohw1GOBYPmiKRMbv3vKUywqXxEalxrRn1NYsmux930yzlq6
	etq5VQ+gIex2j5Tn/LkyoZryeZYQ8RYYfFdIFYEala1QmOaSlLwDFO9M4E6ByiLAWg6hqWxrlDtD7
	GuolbKMwvQQ9m9LFuN8z0aNCBlmvaHGRM6ptVaYdwHXIPYobDhWyCdCKp6oO2PBbwlVVkeNz7QqJC
	u/gSZCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddz6-0000000FrRJ-0T5E;
	Mon, 21 Jul 2025 00:02:24 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uddwe-0000000FrKo-2kmi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 23:59:54 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-87f36c458afso5366209241.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 16:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753055991; x=1753660791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMDu15B94CMFfjtDZHBtBYYs1+zD5YCySOnFKbF30Fk=;
        b=ChmEFIeTfVI+5Zh1ppiEmmU83ZkLxN4vEIoIdqmNy/kC7NZ2vyedZ0bV7tZpVPY4kL
         Go8mBrIp/4zsapUssl1FYjwUPXO8OGOg5+bL4Hp/r3czPC0Vzw2r3xizeBsJX/PA9uNA
         pZMVqTP1YOtL7oyiHTP/Jd1Kj2B1uhWBq5oQuW+l5YzmTfOR8el+gVZmgthYVOGuUNQ4
         wIQvbimBL8D96EAeNMsXmsffUojFdEnNf88RnRlQwamejQZLlKJOeENAZRIh5ICqLdn8
         jX7e2M6g2RuzJbN4NdsBGeFGKqLfxBKNnUpEAlhkpVUv3IIuiAbS3AGei2NYQHG40u/Y
         Zyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753055991; x=1753660791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rMDu15B94CMFfjtDZHBtBYYs1+zD5YCySOnFKbF30Fk=;
        b=Gr1V6ZRzb8KszFLrtmgDErqSnlai1lF7MKlwt4fqCbkrdELf/+Nn1K8+Zn6zVG2Q2i
         sRFGMqsg7x5tgtqjSlmAm1dF+cwReNBra+d+x7WAvCjWcAttWdGUfi3qvc27HgB8XJEG
         9/cdHH04+aTZNo/cu9IlRD3Z4hmdAtB7FtFY+rBxBu95v7Q2myK8UEw1MZLIrr73mnt3
         3RQEu138oB+Q52VHTfV1ng/PpfDfgkrrS704bJv+kTVbs3O+V9AoRjVfyMXb0S1SkRuj
         srgeKnhimNdDkGHweiKts6+wi4y39IeQs/YZmgC9+Di10Sl5h1chDHQHlCmshMypwtot
         UtSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5zHo7YwQ7ERfrH5bNrYWYz6MOrzy8mxHn9KjHbVLPsFzpnth+bQXdcFcWnoU8zUYBHYtyB1HnHztbd9HNqa1C@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ6oxpLnjatqObkyBrMV6+YonhN2srWij1rPcDPDuMJxc0emvP
	bZL2XObaltARvPP1NzEI9KTM3nsyMbS7KMcAO3wT15z6PXgFjElcLCN65KUSJ0gtla8f7T7NyVD
	vGFFYpfTzioaIJywald4AQl+Rx5tmMVo=
X-Gm-Gg: ASbGncvGvRkDZWMFyQsSUZVGyz0E5VN0/fwofmuQow+tqnfae5QEoe4m108LpIOsEt5
	JgZMcnlmOxYPt0xeteqcs5hwLht/e+qXsMO/v1bmU3c2LwKaq0CMOSL5B7gTaRx07pPvu8LrM8u
	mH3MQPbCL05SI8ZOzcDNN6kedNKuL8jFTqEij8z3QK1GhiBTtEyl9MIIK5ClOayT0HNAdI/OwbZ
	KHLMlY=
X-Google-Smtp-Source: AGHT+IG7L0m6HoBIB4Bw4NGY3fjZtWacuz0hzTbVUc6/5aUuTbOVmBAoM4nq8umtZuw19e9HBRzvUyaNBDZrSXYi79s=
X-Received: by 2002:a05:6102:5490:b0:4e9:b66d:3c11 with SMTP id
 ada2fe7eead31-4f95f41a4bemr9512749137.19.1753055991556; Sun, 20 Jul 2025
 16:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250718090244.21092-1-dev.jain@arm.com> <20250718090244.21092-4-dev.jain@arm.com>
In-Reply-To: <20250718090244.21092-4-dev.jain@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 21 Jul 2025 07:59:39 +0800
X-Gm-Features: Ac12FXyjRyO4euuMXuvHEdYT2dtlu9tE6s7OP6fEeHvddqbhgMqFlrnYNQfVQPE
Message-ID: <CAGsJ_4xiUZzQNR57qpebcwKxV1T_S90j-=Z0EQ0s=1u3Q7rG8w@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] mm: Add batched versions of ptep_modify_prot_start/commit
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com, 
	willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com, 
	anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com, 
	ioworker0@gmail.com, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, 
	christophe.leroy@csgroup.eu, yangyicong@hisilicon.com, 
	linux-arm-kernel@lists.infradead.org, hughd@google.com, 
	yang@os.amperecomputing.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_165952_715066_9DFD8CF2 
X-CRM114-Status: GOOD (  14.40  )
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

On Fri, Jul 18, 2025 at 5:03=E2=80=AFPM Dev Jain <dev.jain@arm.com> wrote:
>
> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotec=
t,
> implementing them as a simple loop over the corresponding single pte
> helpers. Architecture may override these helpers.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>

Reviewed-by: Barry Song <baohua@kernel.org>

> ---
>  include/linux/pgtable.h | 84 ++++++++++++++++++++++++++++++++++++++++-
>  mm/mprotect.c           |  4 +-
>  2 files changed, 85 insertions(+), 3 deletions(-)
>

[...]

> +#ifndef modify_prot_start_ptes
> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> +               unsigned long addr, pte_t *ptep, unsigned int nr)
> +{
> +       pte_t pte, tmp_pte;
> +
> +       pte =3D ptep_modify_prot_start(vma, addr, ptep);
> +       while (--nr) {
> +               ptep++;
> +               addr +=3D PAGE_SIZE;
> +               tmp_pte =3D ptep_modify_prot_start(vma, addr, ptep);
> +               if (pte_dirty(tmp_pte))
> +                       pte =3D pte_mkdirty(pte);
> +               if (pte_young(tmp_pte))
> +                       pte =3D pte_mkyoung(pte);

It might be interesting to explore whether a similar optimization
could apply here as well:
https://lore.kernel.org/linux-mm/20250624152549.2647828-1-xavier.qyxia@gmai=
l.com/
I suspect it would, but it's probably not worth including in this
patch.

> +       }
> +       return pte;
> +}
> +#endif
> +

Thanks
Barry

