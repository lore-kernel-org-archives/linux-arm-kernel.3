Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAB1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 07:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h04dW7cvq5MsrTLRcy+l7A8vi+WnZaRzq7TXJn2e26A=; b=psfavrWXvqsgK5ckTsESzkRto5
	9W4tJFq/bZPfNucb5P/9AdR8adwaVUq2AhnDrlSH5iVI+Liy7xerc7HZc0P7XKtaqs/RcIz2SCb4j
	KiDYKzOLPOj8g5F22yUavgYojBrX6KGZiQLXCfHzR2yxsrwcSJH8WECCyyJRul5oLUgSfkVSC/WIQ
	83IABDyZBTTmdq6ALpBl1vR2iE9r8PeAENnxks8a7U/rffpHtKA21cGrrZ0QUN4LKM8GwZQbsLl63
	0ghL4vu3dB3WOCtFLESmo0WtFr7erdnyaoSdS8W0r+ETy1gBvLDl631Tyfty/uHUYhGBGnN7NCOLV
	7yuZRUdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3jp-0000000DrXF-2ik0;
	Fri, 27 Jun 2025 07:43:09 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3e2-0000000DqFp-09Yq;
	Fri, 27 Jun 2025 07:37:11 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-53185535ed9so1785494e0c.0;
        Fri, 27 Jun 2025 00:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009829; x=1751614629; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h04dW7cvq5MsrTLRcy+l7A8vi+WnZaRzq7TXJn2e26A=;
        b=nrbkViMByj1oYvx8tknIq8z34V2MmlJEFhRW/NdzukAo2iIp8chVUcCd204nQoVE4t
         GvO6FfygROJoP/bptwWNSANiXUl/pwArhGHao9hTQGpozfkwxMWmof1GmFdrEggiZ1dm
         uXqQ43jIvEj+yuR2OzKCcTvjRucMWDubh9R4EXyv+vuVio449zzSaNKJrR0ZrRPwXxzS
         0UnuqR6KgX0QM4pcuKsfXA5LROhFxopwk5Tv+G20xL+dr3R5sd4q4AFRiW3afS4APDAr
         iHXG2CwWBWW3QLnw5c7NPjKlNT90DwKHihywGzsRKNl+h3jbH6+XOQ4FKOBkxjnkfIV9
         /p1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009829; x=1751614629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h04dW7cvq5MsrTLRcy+l7A8vi+WnZaRzq7TXJn2e26A=;
        b=IozRWtSHd4o46zUlily3fN6jMwGZwxg/B/9ZF8xKp+/8MqWQo92/8qHGewTUBSPJC+
         PBxmA83VykpuiRZL0tqGhBql43UWUNniJ6sjFCLcqCt7m0XgpgdoSJsgW8TYUgQeXevf
         KQBf+kWRH1MYqhDfnHKdC8kP/X8SiX2RUGHU4gH9IzmtRtey7IR4pbEHBUdn+Whn5WH5
         fqVtqNTKjBMWFYyunKoCCqVtzFv+ySYllO8Kr+JDCByZ8MB8Mww50jr4b6h7eq/CdjvD
         AudqsfiJ/BC58BYqbaTW14/vlfooR3sRZCxQCs7m5N3qFnJKtBwEyFGPHNgWDt7UfzdV
         fcAg==
X-Forwarded-Encrypted: i=1; AJvYcCW3R32piJw5x7+NwWmgdEM0S/bLxJFe1pZJ2vbmsATDULbS1tzjkIX1huamCtPcT+wlo2NMrhm/VOxUez8=@lists.infradead.org, AJvYcCWyqf/nEYQvJYeqWafi2DucboKc7fMdXGHFEOJf6TIDgMB7mx5RFRsOPkvw50nwwS5ku9kYwKU0B4fo9iafCI13@lists.infradead.org
X-Gm-Message-State: AOJu0YzW/am/AbuEjFWANPvpv8tjtnOa0VzqZg9eggpCUZzewcduU/7w
	BQ5JYJmxDdIDyuciOetWRY4YD7apLRuWM2aLOYQwrm0unpm7J9cb9Tbdzsq0DgTszfxGGartMq5
	KWVJuHBxDea2K3u+jiwOPuVplHMDhAB0=
X-Gm-Gg: ASbGncvAYTDixUHNzXprY7h5Et1H2UrfYefGmpfFwI4jm5eOGa/bES9SA1W9YnEFLKO
	UnGqxR7rgFse1Xv40n8T20REfz3D62VZy8wGCl0pPMo2Kk7kkBleeeyB1WRJX8PXZ+lXqFYkhdV
	2ktuYpVLMrXgp7pXyP54ew21WmVq1K6jZp2zjQ+c2uu9A=
X-Google-Smtp-Source: AGHT+IHo8FRikknOYfNn2v3zzQQPaCulI/LItL1n+PBYdAHqbmLkfddAtgEKwDf2Q40GboOB26M3NfwuovgELxUJcjQ=
X-Received: by 2002:a05:6122:a05:b0:531:1314:618d with SMTP id
 71dfb90a1353d-5330c227301mr1950474e0c.0.1751009828926; Fri, 27 Jun 2025
 00:37:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250627062319.84936-1-lance.yang@linux.dev> <CAGsJ_4xQW3O=-VoC7aTCiwU4NZnK0tNsG1faAUgLvf4aZSm8Eg@mail.gmail.com>
 <CAGsJ_4z+DU-FhNk9vkS-epdxgUMjrCvh31ZBwoAs98uWnbTK-A@mail.gmail.com> <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
In-Reply-To: <1d39b66e-4009-4143-a8fa-5d876bc1f7e7@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 27 Jun 2025 19:36:57 +1200
X-Gm-Features: Ac12FXz5tlMnNgK9S5wGn1B_aw1xub8A6xmoNvbFnezBsQjuxTcX4VyZtOeiAwc
Message-ID: <CAGsJ_4xX+kW1msaXpEPqX7aQ-GYG9QVMo+JYBc18BfLCs8eFyA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm/rmap: fix potential out-of-bounds page table
 access during batched unmap
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@redhat.com, baolin.wang@linux.alibaba.com, 
	chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com, 
	ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org, 
	huang.ying.caritas@gmail.com, zhengtangquan@oppo.com, riel@surriel.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, harry.yoo@oracle.com, 
	mingzhe.yang@ly.com, stable@vger.kernel.org, Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_003710_078973_DF5ADDE4 
X-CRM114-Status: GOOD (  21.33  )
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

On Fri, Jun 27, 2025 at 7:15=E2=80=AFPM Lance Yang <lance.yang@linux.dev> w=
rote:
>
>
>
> On 2025/6/27 14:55, Barry Song wrote:
> > On Fri, Jun 27, 2025 at 6:52=E2=80=AFPM Barry Song <21cnbao@gmail.com> =
wrote:
> >>
> >> On Fri, Jun 27, 2025 at 6:23=E2=80=AFPM Lance Yang <ioworker0@gmail.co=
m> wrote:
> >>>
> >>> From: Lance Yang <lance.yang@linux.dev>
> >>>
> >>> As pointed out by David[1], the batched unmap logic in try_to_unmap_o=
ne()
> >>> can read past the end of a PTE table if a large folio is mapped start=
ing at
> >>> the last entry of that table. It would be quite rare in practice, as
> >>> MADV_FREE typically splits the large folio ;)
> >>>
> >>> So let's fix the potential out-of-bounds read by refactoring the logi=
c into
> >>> a new helper, folio_unmap_pte_batch().
> >>>
> >>> The new helper now correctly calculates the safe number of pages to s=
can by
> >>> limiting the operation to the boundaries of the current VMA and the P=
TE
> >>> table.
> >>>
> >>> In addition, the "all-or-nothing" batching restriction is removed to
> >>> support partial batches. The reference counting is also cleaned up to=
 use
> >>> folio_put_refs().
> >>>
> >>> [1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857=
fcbe@redhat.com
> >>>
> >>
> >> What about ?
> >>
> >> As pointed out by David[1], the batched unmap logic in try_to_unmap_on=
e()
> >> may read past the end of a PTE table when a large folio spans across t=
wo PMDs,
> >> particularly after being remapped with mremap(). This patch fixes the
> >> potential out-of-bounds access by capping the batch at vm_end and the =
PMD
> >> boundary.
> >>
> >> It also refactors the logic into a new helper, folio_unmap_pte_batch()=
,
> >> which supports batching between 1 and folio_nr_pages. This improves co=
de
> >> clarity. Note that such cases are rare in practice, as MADV_FREE typic=
ally
> >> splits large folios.
> >
> > Sorry, I meant that MADV_FREE typically splits large folios if the spec=
ified
> > range doesn't cover the entire folio.
>
> Hmm... I got it wrong as well :( It's the partial coverage that triggers
> the split.
>
> how about this revised version:
>
> As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
> may read past the end of a PTE table when a large folio spans across two
> PMDs, particularly after being remapped with mremap(). This patch fixes
> the potential out-of-bounds access by capping the batch at vm_end and the
> PMD boundary.
>
> It also refactors the logic into a new helper, folio_unmap_pte_batch(),
> which supports batching between 1 and folio_nr_pages. This improves code
> clarity. Note that such boundary-straddling cases are rare in practice, a=
s
> MADV_FREE will typically split a large folio if the advice range does not
> cover the entire folio.

I assume the out-of-bounds access must be fixed, even though it is very
unlikely. It might occur after a large folio is marked with MADV_FREE and
then remapped to an unaligned address, potentially crossing two PTE tables.

A batch size between 2 and nr_pages - 1 is practically rare, as we typicall=
y
split large folios when MADV_FREE does not cover the entire folio range.
Cases where a batch of size 2 or nr_pages - 1 occurs may only happen if a
large folio is partially unmapped after being marked MADV_FREE, which is
quite an unusual pattern in userspace.

Let's wait for David's feedback before preparing a new version :-)

Thanks
Barry

