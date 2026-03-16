Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030A9F30296
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 00:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=; b=ibgcwBGCdpK64TaPDQjxnqqMMF
	zJay9IjHHmFmHDsf6wrN/cPkQEWb8bTu2I1gX+vz6wVDh7sHDrezCJ2B+vsQtg/RfMa+BvT7SOXtx
	kxt2SZTOYgqaFY5IhDrgjkGzV2Ndcyc7L2DK9pRvazEBPnfgL3JqlvVrB97LFA1Vsl75XRo8ZzAD1
	HA/6RGHM1Wgv7E4zwf23B/TFhB+jFHnA4TKQLZ8sULb3mOVY4f5aQFFKxr3NP2aPxoBYlUc/xycSE
	8RRKZAczZV7n4wKCyMD0fDDrWkKZrIcQau+AoEO1LPrVIS6Ukl0GYv7uN48HwEEjhX0frMFBXSQfH
	TEL45HPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1w3p-000000033GG-40F0;
	Mon, 16 Mar 2026 00:43:57 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1w3n-000000033F8-09jS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 00:43:56 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-509062d829dso680041cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 17:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773621834; cv=none;
        d=google.com; s=arc-20240605;
        b=DQr1kPFhgGOGyNMTP4Vb7pb2jLu8u82dHcbvnX4aYn3aqUwn1VqBZVqIxI8XoDGbj9
         LBlN0fT2k2qLEwt2vslntai6zHQhhQu8kAF4raKTzh8sm9KTGEam446VD595IVbnoPTv
         Iz8WbXjg2Ps9OZlJ4FOpCksfqrrJUc2SL8xADzY5Hw6TUul0SAStVk5wxcAnx4fTiXKX
         Uiuku4GVvYvvZT3AeFaoFRTQXuHK68H+k9vzUBNyEk+qijkx60IyOajULzrWhPJMmV+G
         N8zPLI+5xhIlMdOgpO0acfEsmWMs9p1UEGeS22xb4ti6dTbWPqPurZRuHSGKtjbHwgFG
         UmBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        fh=bDc+eB+rsBFEk0lmL8LAKWB2A6siALlWpoKjeHYX0J4=;
        b=dmx0zPBvvZzPL1CR7vxd20s6WqbhH9EVVreIkYRUsCkDuK9riqUukcZH/aXfHZd1mn
         0ibGe+0vKUGYFz3a0+RRV1BH9BF5u6wwpLOqpyMzuIV6FTBhM5nC5tZ8e1NNeKiTIgNN
         yrbe9z9bmHX/xZ3OYN3UCRvlNP4OXS12n/xfjGxglCnmWAbGqtUiva3svB8h1LBoL7D+
         tu+yfOc52xfGNEFJIbnFPspEQOaR2+vRzoOCkxrZh3FwTWBf55r2AUWiu0uAQYpCAr+K
         d351K6OxtOLHaKDfaby5XnOp6YGjudkfBhqkNioiUWaSIx76Ynl1xENs9/9ZAafLCLwr
         UmyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773621834; x=1774226634; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        b=CWnQW5GgkSnZ9XgXp9Hvve3dzMDV97qo3wV0GIdlEqlvbBozoSzHLCA1QrvYL/Ei++
         dTK3cfgAhnoz7DDivHx2IVKvoZQzP5Nz25zh2qpAvOeLxeMgCWqzSdZHp/SxPUnRU5HC
         laJPeazqqymw13M6hOfiQ0b4mA/jn2arL6OKmYzULQOwgQSLS9cXCio1nXSzFWnZO7O3
         a52t/s3JCMDnp5NkhfShU0GTtPO0h7k23hgVYrBXkIeSWsrjtS9QAZNGTdSPHc85fDQ9
         YBpyMi9hu/fjD2kAXJ4R3A1dnLg80s+5RblMQZMkNGA2BGxIpY4jJo1PNUHSiqCKeHFu
         9iCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773621834; x=1774226634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B4iLbVdU6UwNcjWJZqb9n6er3BcFb6HsfZvwCgpauBo=;
        b=bXKlMiWvVQALKVQAwtBhJmvl9WeH2Pqx0QhWHa8NtGeTTa4GPOXtXB1rl8Hbr+ivWc
         0iOvk/pfkxSV04nAMNxE4oAyvCDhD8tmxL2ayr6L0k2f8VWG0ghowTJ0C4hf8fqZqFQd
         7skFlP1BIwcrtAlaQN3xzahiuMMG4Xcf7iD0vIoNn4p1hAQXYKOjNNoOngK9u95HKB9R
         b9vsxwyOsL/dcaodln4RGpRnTflI/7kINlU/dGQiKwITWhPMY2PAgOW/3io72RR3ntpn
         6FlplCgEOP2z+vzeUOZH6O8x/UeTkYz1Cy87rDbfroiCBDoW2TZ4VVXmMH+89rz9C/Mg
         Savw==
X-Forwarded-Encrypted: i=1; AJvYcCUBca7t0AY5Z0PCbD2L2fEe/3hN5GdwnrZpi2gctrWj5FUFJ9JRtovvz7iP1jWW9XQ6nIeoWTs3yoqWgWLnwgMb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7vL5T6EhzXOgqpusEMJHXkTKffXE7ZnNvNEK5yPtgQl8fmVgc
	MKkDWfYSxAdNzfynhqe5AasLqN//I9K9eHLUv86kckwO7SP3PEQZF9npqKVkSD6nUQtte3t9jGe
	bJhKblcfsJUgeJg+Tar+K3IWd0q4Z2Wu7DwpkLKLw
X-Gm-Gg: ATEYQzy9iuezXSAvmBxC/XyfyCyW/IdskX75sULX1TcKpmaordLjCFnw/V2wNYn02Ex
	6hLB2QhLqLwxKpKSovTFB2Zydc1b5/N4OanHTzS+w+mhSJkjyxi3fDfYBLOPieVzFV44wPv1Ias
	JMDiVxtbjl/DKBdUA7jWfJsQPMvOBWsYe00q5D7qzvb1SDNCbpQMplEH/yU4rmj6zMjT5oHOFeD
	NByfjoq74Syq7/r5zsuoFWpL9Mw5G+M/wqcgl0XJTDZZmNnJJDXbpcQ46L31H8jyNCGjDFxJHM3
	8ywAkQ==
X-Received: by 2002:ac8:590e:0:b0:503:4bc:c925 with SMTP id
 d75a77b69052e-5096aa2ae2cmr17578141cf.13.1773621833001; Sun, 15 Mar 2026
 17:43:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773346620.git.ljs@kernel.org> <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
In-Reply-To: <52a7b9a003ea51521ab3c0baf30337a7800a3af7.1773346620.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 15 Mar 2026 17:43:41 -0700
X-Gm-Features: AaiRm51H9IsCynzRpnxAc6_DrzYXD9cjd8fR558hmylwDQfMj5FrJzUnU5dorNw
Message-ID: <CAJuCfpHVN66abFrJgorXKBsjv7Ut=CP-E4NpLMC4SW613tJwtw@mail.gmail.com>
Subject: Re: [PATCH 03/15] mm: document vm_operations_struct->open the same as close()
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "K . Y . Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Bodo Stroesser <bostroesser@gmail.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, David Howells <dhowells@redhat.com>, 
	Marc Dionne <marc.dionne@auristor.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, David Hildenbrand <david@kernel.org>, 
	"Liam R . Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-scsi@vger.kernel.org, 
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	Ryan Roberts <ryan.roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_174355_127047_08167046 
X-CRM114-Status: GOOD (  22.43  )
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

On Thu, Mar 12, 2026 at 1:27=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> Describe when the operation is invoked and the context in which it is
> invoked, matching the description already added for vm_op->close().
>
> While we're here, update all outdated references to an 'area' field for
> VMAs to the more consistent 'vma'.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
> ---
>  include/linux/mm.h | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index cc5960a84382..12a0b4c63736 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -748,15 +748,20 @@ struct vm_uffd_ops;
>   * to the functions called when a no-page or a wp-page exception occurs.
>   */
>  struct vm_operations_struct {
> -       void (*open)(struct vm_area_struct * area);
> +       /**
> +        * @open: Called when a VMA is remapped or split. Not called upon=
 first
> +        * mapping a VMA.

It's also called from dup_mmap() which is part of forking.

> +        * Context: User context.  May sleep.  Caller holds mmap_lock.
> +        */
> +       void (*open)(struct vm_area_struct *vma);
>         /**
>          * @close: Called when the VMA is being removed from the MM.
>          * Context: User context.  May sleep.  Caller holds mmap_lock.
>          */
> -       void (*close)(struct vm_area_struct * area);
> +       void (*close)(struct vm_area_struct *vma);
>         /* Called any time before splitting to check if it's allowed */
> -       int (*may_split)(struct vm_area_struct *area, unsigned long addr)=
;
> -       int (*mremap)(struct vm_area_struct *area);
> +       int (*may_split)(struct vm_area_struct *vma, unsigned long addr);
> +       int (*mremap)(struct vm_area_struct *vma);
>         /*
>          * Called by mprotect() to make driver-specific permission
>          * checks before mprotect() is finalised.   The VMA must not
> @@ -768,7 +773,7 @@ struct vm_operations_struct {
>         vm_fault_t (*huge_fault)(struct vm_fault *vmf, unsigned int order=
);
>         vm_fault_t (*map_pages)(struct vm_fault *vmf,
>                         pgoff_t start_pgoff, pgoff_t end_pgoff);
> -       unsigned long (*pagesize)(struct vm_area_struct * area);
> +       unsigned long (*pagesize)(struct vm_area_struct *vma);
>
>         /* notification that a previously read-only page is about to beco=
me
>          * writable, if an error is returned it will cause a SIGBUS */
> --
> 2.53.0
>

