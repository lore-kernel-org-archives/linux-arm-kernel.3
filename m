Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D5E103E199
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8q0J7KCNx+A8Y+J2RSy7VQj65zrNoynNXfOuxxJlza4=; b=uv0FUJdL5WuCqn1dSHg8teECvm
	b64D4gKFzxf+kQM7AJkxJZWCxxle2Ehbw0iQH/F6i+oQlghsLn+qMVECvFKPkKmWwtM07b4a6BPI+
	wT44drMAX86PaOiGX7NHG9duR5lurqRRxjTJYaK3zNhg/NIX+f2zOIcjkDGKKviHZ6unfiWF49/LJ
	57sG4Nw6RInBrG2KPKvO3g7f1ZmI8ExUoDuZGBIVWNZI0YAeJw8qPdxUeB1Ajn3ZDR7bri3ovAGkc
	onXdyHKd3csTUoIli1ZXtS20cwmfLTdCeI+rW1ZIclfooNSSx8LJpFereJCGnvfsl5jYjBZ09G7wK
	TgeVQbOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tJz-00000008s9S-2ap6;
	Wed, 18 Mar 2026 16:00:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tJx-00000008s7v-3oPM
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=8q0J7KCNx+A8Y+J2RSy7VQj65zrNoynNXfOuxxJlza4=; b=jwtnkYOZYD9suAG3WylU5Gi0Xe
	CZPqDEh0zpJbchbzKGzf1o8H6Co7XJ5Kuzpnp7WGYHGqHnyy4Co2T7n5QLuZyr5UVCDD7xwit36In
	UMZzSbe61nz1qkbsVOKuKWGMnO/OXmrUypUZH9QFvaEDU5T4jDhbpg7nswWWLASPiTwGrCLvFAiDi
	ZYCgQGPCOWAsUeVUEvaetUbCgqjCQDVq4+N1ew5SFt6eTEBvFHyuEOxf57VJ7Ebq05sRZH8Z44Cfw
	xNp+65A5cn4U15eD48LittTer03vDZ06KSEYesP7vFXgKXdAo2Nfzb1EVBhugv7gFx9icNr/nhNLV
	AbWHtBwQ==;
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tJt-0000000Bele-3sa6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:00:31 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-5091ed02c54so687971cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 09:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773849627; cv=none;
        d=google.com; s=arc-20240605;
        b=EQepXFUifV+t6ijds+ftexQR2Jf5hhJvF6kRgGhWovvi8r7cVYwI+/242hwfT2N2mD
         MNmnCWbWD4MeXE20QJENG1gytHoiASMjiuCsZNuSWELVDz3NqQbTnY1pmrKL6ZO62JAV
         GfQFlCczevcGjBzjkQxQYP6EXt4Fy3mf+8CIQvCFistMiUPtspfS6QkkdtaChjMb7JkT
         iCYiw2zbwJm1HQYbIVaoEdbwNcJoBslYUk9v6+DJTCzvlpMbOxPulifsfDt+BloPQcyN
         tKzqJvccM5K8J+aR8cDasgKn77vv6xiNooA8C2lmQC4Nf0/H/tgMqlrNuj1nLLeeFCwL
         ty4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8q0J7KCNx+A8Y+J2RSy7VQj65zrNoynNXfOuxxJlza4=;
        fh=0gdrmC6j5PKl6nXoHl0ZB3hDjOg3J+kkCahsx0+Q/bk=;
        b=i+4PBoCmx9uXCC3QjIahjRDC7BpGEHfqy5wYW//xJWLYs/rm0K2bf/SxYTLoHPVr7B
         M6OhvSnamQo+Rlpq/a5F1ljJL3nuwEPIE8/Bmb0gIx1FbnbWfh63vZK0iBuLoqE1ujNI
         K90/Sli+SI61H3lnfQYbTlKghWlJ5loXeJuZ6Py3QhSLGfXO3bz5L8FQfX47kx26MKQ4
         wPlXhvhAR0OjTafxoAy+xn0r7oKKgR3iUMQ3OU+sqf+D/mfzW7/WCRLFN4JASFzGIkxa
         3pnEbR5l3LDC85ITmOyGeLbveEK1GxaJ4iv+hwEqvSWLM4Vme3XHNYWLvv6rMlGuLhWM
         nxhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773849627; x=1774454427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8q0J7KCNx+A8Y+J2RSy7VQj65zrNoynNXfOuxxJlza4=;
        b=GDDHnjjUQnaEoxKTmnUPtnyRdx1AW1Gob+3IoYaph6waFM54Pmkkpsj9W8aIsUnCey
         4XFXdLBUSbBl9dASIApjuhZg0kk/kO+odFD4Hb6ksGO2m8l8yanNW2HoJkrI8Qrkaj1i
         N7vNyz6F+NLakgw+m/XH7wTXEQTXXWndVN/SF5MBkR1z0DpFn3s18KFs5p/kGnA/2+pk
         qWDirousmMoRbsL2hElLeIqO3RNsYyvctvMiFgSljCiLHRVogv/a5ZukZqmveDtzABrd
         I0JTWbVJFZqYdFUN8SUdK6rzG52WAMeY7EPFwdsMAYMre3+jmGC6hdF44L1830lM+d03
         9eRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773849627; x=1774454427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8q0J7KCNx+A8Y+J2RSy7VQj65zrNoynNXfOuxxJlza4=;
        b=A0Cn0es7NfmYMEKxSBVCAuhyFo05JUx3kbXnmHKFiniBXuNCEz+hPtqUQC8LJRphOI
         azgwG956e7wujQ7KO8jhE0fo/p2gpHySLN6fTlUeYcvbiEqU+5ymKlQqt3j//YEny/KM
         KcHahLtMxppQB+Tm+MhCUNXNwpTfOXqbnBfcDGhUOoN7wFUF8blhqXhcR0bGPgvtzp2X
         KRWPFiaT6nbJ0nsct9Nmg6UkCeBA7a9t1FAbRynSRPukCN4ErgcLvEn8go+kS+TLuvqv
         bK62ZI/o2PP5veyLvLgmszxsDMBpG6+njhHAmRlp2EWirlpfKrPuH9nNlNU0gwzyJJWC
         w1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeNj52B6yhePiXPfAWa+m1AKTSMQ47VrikJapmxVKuc/dfDA5YasK7PTs/dBxIjY02yzb1fq9jSqsY1Z4c7Txi@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4MISaTVkF8k9lRrueSGTFCIYTWydBGbD/jP3vzflF8Ep0fird
	5wuJfDmL2qfaFCluCV7nawFYJYg5fnV94rdNFIYiNyJCQ0dZVAlomDVurHmV+pHSI08YjHq1cVA
	UrYF8HUDoCsGCNWveYwqAJzvOXElNAKFQ6aW2Fm0y
X-Gm-Gg: ATEYQzxSNqWf7JFn5bljPu5WStdvnfPOUxM1Co0AwkH1M9iVwFuJAQ0lijCk3Z5849i
	+YBpW5wHTqOVbqQCFFR9xdB4zOi+bvCn+DkmF9wBzr1zU5kzRRW2qjAoxEsSCrEv1/Sh/Tljf/F
	MTJYkWo8+C6HIIjJxMt9LaeMJEeX8Yf7fID8GfGSDxH2iBc+BXsn1STsOfsThdP/tnyjWo2pOXO
	3uKj4z3NJh86wDEmd8gENdoBk8n47ZWoo/W+5phXp1ySZRFIN/ibkv+wZeRKw+VrWuveXtX18jJ
	3Q0r2qgggvMLbrcimTGDWgP3EdlxF4k37140vA==
X-Received: by 2002:ac8:7f4d:0:b0:509:174d:3224 with SMTP id
 d75a77b69052e-50b15c109d1mr14316251cf.11.1773849625679; Wed, 18 Mar 2026
 09:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1773695307.git.ljs@kernel.org> <8e28e4b63bae67bfa1a59ccbac9dc6db1442d75d.1773695307.git.ljs@kernel.org>
In-Reply-To: <8e28e4b63bae67bfa1a59ccbac9dc6db1442d75d.1773695307.git.ljs@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Mar 2026 09:00:13 -0700
X-Gm-Features: AaiRm51xXcSMS3sQHOtwlzL9JQsE-2S39fLY5xwjkClhFBo1kCA372O2Zp37zjU
Message-ID: <CAJuCfpF6eS18HLgNvQtkLGd=7N0_L1JPmF0GzM-Z0QimRWT7AQ@mail.gmail.com>
Subject: Re: [PATCH v2 15/16] mm: add mmap_action_map_kernel_pages[_full]()
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
X-CRM114-CacheID: sfid-20260318_160030_115847_C5A15DA8 
X-CRM114-Status: GOOD (  40.85  )
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

On Mon, Mar 16, 2026 at 2:14=E2=80=AFPM Lorenzo Stoakes (Oracle) <ljs@kerne=
l.org> wrote:
>
> A user can invoke mmap_action_map_kernel_pages() to specify that the
> mapping should map kernel pages starting from desc->start of a specified
> number of pages specified in an array.
>
> In order to implement this, adjust mmap_action_prepare() to be able to
> return an error code, as it makes sense to assert that the specified
> parameters are valid as quickly as possible as well as updating the VMA
> flags to include VMA_MIXEDMAP_BIT as necessary.
>
> This provides an mmap_prepare equivalent of vm_insert_pages().
>
> We additionally update the existing vm_insert_pages() code to use
> range_in_vma() and add a new range_in_vma_desc() helper function for the
> mmap_prepare case, sharing the code between the two in range_is_subset().
>
> We add both mmap_action_map_kernel_pages() and
> mmap_action_map_kernel_pages_full() to allow for both partial and full VM=
A
> mappings.
>
> We also add mmap_action_map_kernel_pages_discontig() to allow for
> discontiguous mapping of kernel pages should the need arise.
>
> We update the documentation to reflect the new features.
>
> Finally, we update the VMA tests accordingly to reflect the changes.
>
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

With one nit,
Reviewed-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  Documentation/filesystems/mmap_prepare.rst |  8 ++
>  include/linux/mm.h                         | 95 +++++++++++++++++++++-
>  include/linux/mm_types.h                   |  7 ++
>  mm/memory.c                                | 42 +++++++++-
>  mm/util.c                                  |  6 ++
>  tools/testing/vma/include/dup.h            |  7 ++
>  6 files changed, 159 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/filesystems/mmap_prepare.rst b/Documentation/f=
ilesystems/mmap_prepare.rst
> index be76ae475b9c..e810aa4134eb 100644
> --- a/Documentation/filesystems/mmap_prepare.rst
> +++ b/Documentation/filesystems/mmap_prepare.rst
> @@ -156,5 +156,13 @@ pointer. These are:
>  * mmap_action_simple_ioremap() - Sets up an I/O remap from a specified
>    physical address and over a specified length.
>
> +* mmap_action_map_kernel_pages() - Maps a specified array of `struct pag=
e`
> +  pointers in the VMA from a specific offset.
> +
> +* mmap_action_map_kernel_pages_full() - Maps a specified array of `struc=
t
> +  page` pointers over the entire VMA. The caller must ensure there are
> +  sufficient entries in the page array to cover the entire range of the
> +  described VMA.
> +
>  **NOTE:** The ``action`` field should never normally be manipulated dire=
ctly,
>  rather you ought to use one of these helpers.
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index df8fa6e6402b..6f0a3edb24e1 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2912,7 +2912,7 @@ static inline bool folio_maybe_mapped_shared(struct=
 folio *folio)
>   * The caller must add any reference (e.g., from folio_try_get()) it mig=
ht be
>   * holding itself to the result.
>   *
> - * Returns the expected folio refcount.
> + * Returns: the expected folio refcount.

nit: I see both "Returns:" and "Return:" being used in the codebase
but this header file uses "Return:", so for consistency you should
probably do the same. This also applies to later instances in this
patch.

>   */
>  static inline int folio_expected_ref_count(const struct folio *folio)
>  {
> @@ -4364,6 +4364,45 @@ static inline void mmap_action_simple_ioremap(stru=
ct vm_area_desc *desc,
>         action->type =3D MMAP_SIMPLE_IO_REMAP;
>  }
>
> +/**
> + * mmap_action_map_kernel_pages - helper for mmap_prepare hook to specif=
y that
> + * @num kernel pages contained in the @pages array should be mapped to u=
serland
> + * starting at virtual address @start.
> + * @desc: The VMA descriptor for the VMA requiring kernel pags to be map=
ped.
> + * @start: The virtual address from which to map them.
> + * @pages: An array of struct page pointers describing the memory to map=
.
> + * @nr_pages: The number of entries in the @pages aray.
> + */
> +static inline void mmap_action_map_kernel_pages(struct vm_area_desc *des=
c,
> +               unsigned long start, struct page **pages,
> +               unsigned long nr_pages)
> +{
> +       struct mmap_action *action =3D &desc->action;
> +
> +       action->type =3D MMAP_MAP_KERNEL_PAGES;
> +       action->map_kernel.start =3D start;
> +       action->map_kernel.pages =3D pages;
> +       action->map_kernel.nr_pages =3D nr_pages;
> +       action->map_kernel.pgoff =3D desc->pgoff;
> +}
> +
> +/**
> + * mmap_action_map_kernel_pages_full - helper for mmap_prepare hook to s=
pecify that
> + * kernel pages contained in the @pages array should be mapped to userla=
nd
> + * from @desc->start to @desc->end.
> + * @desc: The VMA descriptor for the VMA requiring kernel pags to be map=
ped.
> + * @pages: An array of struct page pointers describing the memory to map=
.
> + *
> + * The caller must ensure that @pages contains sufficient entries to cov=
er the
> + * entire range described by @desc.
> + */
> +static inline void mmap_action_map_kernel_pages_full(struct vm_area_desc=
 *desc,
> +               struct page **pages)
> +{
> +       mmap_action_map_kernel_pages(desc, desc->start, pages,
> +                                    vma_desc_pages(desc));
> +}
> +
>  int mmap_action_prepare(struct vm_area_desc *desc);
>  int mmap_action_complete(struct vm_area_struct *vma,
>                          struct mmap_action *action);
> @@ -4380,10 +4419,59 @@ static inline struct vm_area_struct *find_exact_v=
ma(struct mm_struct *mm,
>         return vma;
>  }
>
> +/**
> + * range_is_subset - Is the specified inner range a subset of the outer =
range?
> + * @outer_start: The start of the outer range.
> + * @outer_end: The exclusive end of the outer range.
> + * @inner_start: The start of the inner range.
> + * @inner_end: The exclusive end of the inner range.
> + *
> + * Returns: %true if [inner_start, inner_end) is a subset of [outer_star=
t,
> + * outer_end), otherwise %false.
> + */
> +static inline bool range_is_subset(unsigned long outer_start,
> +                                  unsigned long outer_end,
> +                                  unsigned long inner_start,
> +                                  unsigned long inner_end)
> +{
> +       return outer_start <=3D inner_start && inner_end <=3D outer_end;
> +}
> +
> +/**
> + * range_in_vma - is the specified [@start, @end) range a subset of the =
VMA?
> + * @vma: The VMA against which we want to check [@start, @end).
> + * @start: The start of the range we wish to check.
> + * @end: The exclusive end of the range we wish to check.
> + *
> + * Returns: %true if [@start, @end) is a subset of [@vma->vm_start,
> + * @vma->vm_end), %false otherwise.
> + */
>  static inline bool range_in_vma(const struct vm_area_struct *vma,
>                                 unsigned long start, unsigned long end)
>  {
> -       return (vma && vma->vm_start <=3D start && end <=3D vma->vm_end);
> +       if (!vma)
> +               return false;
> +
> +       return range_is_subset(vma->vm_start, vma->vm_end, start, end);
> +}
> +
> +/**
> + * range_in_vma_desc - is the specified [@start, @end) range a subset of=
 the VMA
> + * described by @desc, a VMA descriptor?
> + * @desc: The VMA descriptor against which we want to check [@start, @en=
d).
> + * @start: The start of the range we wish to check.
> + * @end: The exclusive end of the range we wish to check.
> + *
> + * Returns: %true if [@start, @end) is a subset of [@desc->start, @desc-=
>end),
> + * %false otherwise.
> + */
> +static inline bool range_in_vma_desc(const struct vm_area_desc *desc,
> +                                    unsigned long start, unsigned long e=
nd)
> +{
> +       if (!desc)
> +               return false;
> +
> +       return range_is_subset(desc->start, desc->end, start, end);
>  }
>
>  #ifdef CONFIG_MMU
> @@ -4427,6 +4515,9 @@ int remap_pfn_range(struct vm_area_struct *vma, uns=
igned long addr,
>  int vm_insert_page(struct vm_area_struct *, unsigned long addr, struct p=
age *);
>  int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
>                         struct page **pages, unsigned long *num);
> +int map_kernel_pages_prepare(struct vm_area_desc *desc);
> +int map_kernel_pages_complete(struct vm_area_struct *vma,
> +                             struct mmap_action *action);
>  int vm_map_pages(struct vm_area_struct *vma, struct page **pages,
>                                 unsigned long num);
>  int vm_map_pages_zero(struct vm_area_struct *vma, struct page **pages,
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 7538d64f8848..c46224020a46 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -815,6 +815,7 @@ enum mmap_action_type {
>         MMAP_REMAP_PFN,         /* Remap PFN range. */
>         MMAP_IO_REMAP_PFN,      /* I/O remap PFN range. */
>         MMAP_SIMPLE_IO_REMAP,   /* I/O remap with guardrails. */
> +       MMAP_MAP_KERNEL_PAGES,  /* Map kernel page range from array. */
>  };
>
>  /*
> @@ -833,6 +834,12 @@ struct mmap_action {
>                         phys_addr_t start_phys_addr;
>                         unsigned long size;
>                 } simple_ioremap;
> +               struct {
> +                       unsigned long start;
> +                       struct page **pages;
> +                       unsigned long nr_pages;
> +                       pgoff_t pgoff;
> +               } map_kernel;
>         };
>         enum mmap_action_type type;
>
> diff --git a/mm/memory.c b/mm/memory.c
> index f3f4046aee97..849d5d9eeb83 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2484,13 +2484,14 @@ static int insert_pages(struct vm_area_struct *vm=
a, unsigned long addr,
>  int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
>                         struct page **pages, unsigned long *num)
>  {
> -       const unsigned long end_addr =3D addr + (*num * PAGE_SIZE) - 1;
> +       const unsigned long nr_pages =3D *num;
> +       const unsigned long end =3D addr + PAGE_SIZE * nr_pages;
>
> -       if (addr < vma->vm_start || end_addr >=3D vma->vm_end)
> +       if (!range_in_vma(vma, addr, end))
>                 return -EFAULT;
>         if (!(vma->vm_flags & VM_MIXEDMAP)) {
> -               BUG_ON(mmap_read_trylock(vma->vm_mm));
> -               BUG_ON(vma->vm_flags & VM_PFNMAP);
> +               VM_WARN_ON_ONCE(mmap_read_trylock(vma->vm_mm));
> +               VM_WARN_ON_ONCE(vma->vm_flags & VM_PFNMAP);
>                 vm_flags_set(vma, VM_MIXEDMAP);
>         }
>         /* Defer page refcount checking till we're about to map that page=
. */
> @@ -2498,6 +2499,39 @@ int vm_insert_pages(struct vm_area_struct *vma, un=
signed long addr,
>  }
>  EXPORT_SYMBOL(vm_insert_pages);
>
> +int map_kernel_pages_prepare(struct vm_area_desc *desc)
> +{
> +       const struct mmap_action *action =3D &desc->action;
> +       const unsigned long addr =3D action->map_kernel.start;
> +       unsigned long nr_pages, end;
> +
> +       if (!vma_desc_test(desc, VMA_MIXEDMAP_BIT)) {
> +               VM_WARN_ON_ONCE(mmap_read_trylock(desc->mm));
> +               VM_WARN_ON_ONCE(vma_desc_test(desc, VMA_PFNMAP_BIT));
> +               vma_desc_set_flags(desc, VMA_MIXEDMAP_BIT);
> +       }
> +
> +       nr_pages =3D action->map_kernel.nr_pages;
> +       end =3D addr + PAGE_SIZE * nr_pages;
> +       if (!range_in_vma_desc(desc, addr, end))
> +               return -EFAULT;
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(map_kernel_pages_prepare);
> +
> +int map_kernel_pages_complete(struct vm_area_struct *vma,
> +                             struct mmap_action *action)
> +{
> +       unsigned long nr_pages;
> +
> +       nr_pages =3D action->map_kernel.nr_pages;
> +       return insert_pages(vma, action->map_kernel.start,
> +                           action->map_kernel.pages,
> +                           &nr_pages, vma->vm_page_prot);
> +}
> +EXPORT_SYMBOL(map_kernel_pages_complete);
> +
>  /**
>   * vm_insert_page - insert single page into user vma
>   * @vma: user vma to map to
> diff --git a/mm/util.c b/mm/util.c
> index a166c48fe894..dea590e7a26c 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1441,6 +1441,8 @@ int mmap_action_prepare(struct vm_area_desc *desc)
>                 return io_remap_pfn_range_prepare(desc);
>         case MMAP_SIMPLE_IO_REMAP:
>                 return simple_ioremap_prepare(desc);
> +       case MMAP_MAP_KERNEL_PAGES:
> +               return map_kernel_pages_prepare(desc);
>         }
>
>         WARN_ON_ONCE(1);
> @@ -1472,6 +1474,9 @@ int mmap_action_complete(struct vm_area_struct *vma=
,
>         case MMAP_IO_REMAP_PFN:
>                 err =3D io_remap_pfn_range_complete(vma, action);
>                 break;
> +       case MMAP_MAP_KERNEL_PAGES:
> +               err =3D map_kernel_pages_complete(vma, action);
> +               break;
>         case MMAP_SIMPLE_IO_REMAP:
>                 /*
>                  * The simple I/O remap should have been delegated to an =
I/O
> @@ -1494,6 +1499,7 @@ int mmap_action_prepare(struct vm_area_desc *desc)
>         case MMAP_REMAP_PFN:
>         case MMAP_IO_REMAP_PFN:
>         case MMAP_SIMPLE_IO_REMAP:
> +       case MMAP_MAP_KERNEL_PAGES:
>                 WARN_ON_ONCE(1); /* nommu cannot handle these. */
>                 break;
>         }
> diff --git a/tools/testing/vma/include/dup.h b/tools/testing/vma/include/=
dup.h
> index 6658df26698a..4407caf207ad 100644
> --- a/tools/testing/vma/include/dup.h
> +++ b/tools/testing/vma/include/dup.h
> @@ -454,6 +454,7 @@ enum mmap_action_type {
>         MMAP_REMAP_PFN,         /* Remap PFN range. */
>         MMAP_IO_REMAP_PFN,      /* I/O remap PFN range. */
>         MMAP_SIMPLE_IO_REMAP,   /* I/O remap with guardrails. */
> +       MMAP_MAP_KERNEL_PAGES,  /* Map kernel page range from an array. *=
/
>  };
>
>  /*
> @@ -472,6 +473,12 @@ struct mmap_action {
>                         phys_addr_t start;
>                         unsigned long len;
>                 } simple_ioremap;
> +               struct {
> +                       unsigned long start;
> +                       struct page **pages;
> +                       unsigned long num;
> +                       pgoff_t pgoff;
> +               } map_kernel;
>         };
>         enum mmap_action_type type;
>
> --
> 2.53.0
>

