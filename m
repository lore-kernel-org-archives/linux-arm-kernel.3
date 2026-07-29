Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3942CC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 03:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hCeIFdpiZGdMUyND76+nFTdqMQ1AhaFCYWKinOxaws=; b=skKFS5Qk9VZxzkNaNHHKf06cW1
	CR59R4J1rGWNGLpBjhAhd3DHt+WJWvQdiZYgYnjoXINwkTFSr7poMIL2lFIlN6zgY5JgNG+gyBNeT
	c7jk2dpKvV9AceFbCWQg/bzQxvSppxKFA8VyewokzTiOQs2n+rWx83VI2mfQK/6Ikb0oM1f09BHhj
	zFCTA06UE4JOdnPOw1Si62XBTf3G9mv51HpuNHBtbHgLLEmMkS5/UuEYpVkQlBAM4uxqx4lbRipe5
	DPqIsW1QcJ4tdKYOUtDGPI5JvFaFQhPz1LslQ6a3z/ShRMvHalC9PUOHFzClbe3mnCFKrYjImdED/
	1Byz7FlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovFF-00000006mDC-3euj;
	Wed, 29 Jul 2026 03:46:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wovFE-00000006mD4-10Gk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 03:46:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A3E243BC0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5507E1F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 03:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785296771;
	bh=9hCeIFdpiZGdMUyND76+nFTdqMQ1AhaFCYWKinOxaws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dMRmYAe9PSokY48x6I7M3dDK7nXQfEJnBksN/UzmcwZWenaaIMXt6FKt1fjQEDMhC
	 hGvtY3teJTuNZ5/6ZMHptKw0VNgTtDyMlDPzUpx61rlKxRLwdwQsqwmyJLqF9vQEBN
	 MR1jrpdP2oYbcY1SpNCQnzHC9Qtyy+q0aeRb0a/ip2GN9EHMWW91C38xv2FpEVXLtC
	 niJ5gRr+fPJc/MM5a1DVscvZ1req/o7hpaK+4lMClIXt/FgGpvO6EhqlSxQlVkLU8b
	 d/9wrCXkYpchrXqcyIeqMHTSENMgQ5dl03ddVBUzHcfxUfigxDcS5ujmVhIYaCpVvh
	 SJYhY/gKChB5A==
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-92e622cc874so30485285a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 20:46:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoZgZKmLkoR5+iWe/+pjZqB5Es1jKU4eumvGbMraaj6Ruo4fuZYFXMjnxz8E+kQ2ZbdfS4/zII+Jx0pRcNeX8yp@lists.infradead.org
X-Gm-Message-State: AOJu0YyO+OcWZmbMtxzwV+hCnnDCgpfmId13zQ1YKrqft+iChy6WdmVt
	uGQc88f8muDmlp5Y61iD/eHBOeKBUcDNc+8xpXmi9Sj2xoM8VHskdcGl962yk1JA9IRrNDJu89U
	RcBoCu7TjJAq90lNyQ0q626RVl9gd6tI=
X-Received: by 2002:a05:620a:258d:b0:92e:4867:95af with SMTP id
 af79cd13be357-9330264e639mr479318185a.73.1785296770680; Tue, 28 Jul 2026
 20:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260715120813.3609949-3-jiangwen6@xiaomi.com> <20260721181729.305137-1-devnexen@gmail.com>
In-Reply-To: <20260721181729.305137-1-devnexen@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Wed, 29 Jul 2026 11:45:59 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wWhvKA=BmPwCrGv06kq07QMP6CKES1mGUnx=HmiDPGLw@mail.gmail.com>
X-Gm-Features: AUfX_mxEu5tKUyNHmfuUECxYL_B8CLwg9_b_6o8Uh7pr6aO8ZRt_yR9G9xuE8h8
Message-ID: <CAGsJ_4wWhvKA=BmPwCrGv06kq07QMP6CKES1mGUnx=HmiDPGLw@mail.gmail.com>
Subject: Re: [PATCH v7 2/7] arm64/vmalloc: Allow arch_vmap_pte_range_map_size
 to batch multiple CONT_PTE
To: David Carlier <devnexen@gmail.com>
Cc: jiangwenxiaomi@gmail.com, dev.jain@arm.com, david@kernel.org, 
	urezki@gmail.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Jul 22, 2026 at 2:17=E2=80=AFAM David Carlier <devnexen@gmail.com> =
wrote:
>
> Barry, Wen - the returned span is capped at PMD_SIZE >> 1 but only
> checked for CONT_PTE_SIZE alignment. In the batched vmap() path pages
> are only contiguous within a naturally aligned block, so when a PMD
> boundary splits a batch the next region starts mid block and the span
> runs past the contiguous run - set_huge_pte_at() maps the wrong pages,
> tail of the array left unmapped, no warning.
>
> What do you think of clamping the span to the pfn physical alignment,
> like 8xx does:
>
>         while (!IS_ALIGNED(PFN_PHYS(pfn), size))
>                 size >>=3D 1;

Thanks, David.

I noticed that 8xx has simplified this to a simple

    if (!IS_ALIGNED(PFN_PHYS(pfn), size))

Could we do the same here?

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmal=
loc.h
index d665f9d68742..a27101e24f76 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -46,6 +46,8 @@ static inline unsigned long
arch_vmap_pte_range_map_size(unsigned long addr,

        size =3D min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
        size =3D rounddown_pow_of_two(size);
+       if (!IS_ALIGNED(PFN_PHYS(pfn), size) || size < CONT_PTE_SIZE)
+               return PAGE_SIZE;
        return size;
 }

>
> Cheers.

