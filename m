Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DF4CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 19:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UasgaygcEAyRMWmEw6L6LjHmbIj1q8wLQQcU0N5zRcE=; b=LeoJtPwm/4y+m+fzncCiDyOAh2
	hJuc7WfyStlyqe3qr0vD3aZuMjYYb1de3aTjKapGWwL1dJzJRZzvUGpg9FWRxvSnFaLtFWZa+Pe+R
	4DM4oqnliK9tNe0C8yHC1y7pFHDaOcBneaDdCt5J9fYvfpEzaRqDM/wpmXX3qiE6hYAwjlXtx+tGJ
	Nz3TTNQEsbJbNur/g5dc0bnGGmx2l1CFDI9AcqXpAaT7LpCqeILo4KgOgqxCvXe9f0TM4F5YJ1DDB
	EIgBvxTrzfMyzZBC05ElUJo0Ruir/c9I6xclhTtjrw5L/DPAlCg/IblSpf2Oq8sLEmmCsXU6TfWzR
	xKp/D9Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVt6-0000000EZ0v-1Dm8;
	Mon, 11 May 2026 19:01:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMVt3-0000000EYzZ-27Z1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 19:01:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-671588ab0cfso1028a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 12:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778526111; cv=none;
        d=google.com; s=arc-20240605;
        b=dxYfy0k6KwTAbSubI7qx6r9nHUGy6w7BTv4RVheK0nJYdo8IqG6QEQDR4ypffK6tHG
         s2eCLyKVXbNHsmXFahZohi7la4AD5wfLQhwSbjWS6pYGCj8tVWob+VKpZqP/M9RhoBwq
         SU5Zsr4proScaQw9W6RRQqJazvXsqonFNa0SQTOMsAldeXH03i50Q5x3Mafjb3sM9N0c
         C2yFXtUWLyKcmqiK1p4m5aio/K477JOCyAYw2sh9aRDUaFWTmf5Nax7NGkYM+8LzbT2g
         7tEp2J9rZKb/USZe8RK1XwhGuGiK2qenzaS5EZJ1wBqvf9sgPNNPmrcMnGGo5tMfk5f+
         b5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UasgaygcEAyRMWmEw6L6LjHmbIj1q8wLQQcU0N5zRcE=;
        fh=WpBbF/K/Nqmm6HpvDIbJAwMAXxvzgmnY0JIC7aR+PCc=;
        b=lL5Ey1zSibWv0njEys+5f3TF2/cblKO14vVY83hWqtUjQ3GSwuiOOK4AQ1NGJeHKc1
         Z1f+XHoVAe8LZQP8zloW6J+7Uc2aKDjN8qDTKcSOL0ipknF3lEW+bf24kV9VJpvWFgli
         OebQgRvhNLicQrNd/ABqyA4h91sTitvzTY7V6qSu6f89QdMiVhCb/YpIJrB4KjwZMD71
         Sw9U1KsBVCzQydckANv9YBCxbsj5hWGSKJ0NNmnDiSsdJTHjTEe+EDKtLPetBHlYZobx
         ZxoK7CVUYmn3Pac/OEsp9SbS6csKg4zb/2eJKtr9q28VuCk9MRSC+3jhI2UaSf5pENuq
         2WAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778526111; x=1779130911; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UasgaygcEAyRMWmEw6L6LjHmbIj1q8wLQQcU0N5zRcE=;
        b=njI0WWU1KlZoaLwMYYNNmHEw9RIRlX60LI1fpcZQxFkMxZxRcsfqh9wKTjJ3hDqiQl
         YbWCYGEiprdFdSPSxxuJMI9hrSzzE7uhhHgU+o7phBWe/Y5arX2cXlkqK3MXvRdsOmuW
         TK6RuwNHyGOOC3kfKv+tvpfZRFId0/dNcNz1Nos8u8JU/MJtzzF/jexfcKpBtcfIcJCx
         x4tViHCciH3Aad6/A0Ia3tj+9WOUQ5OyOPa7rHaN7zXWEmjS1LFO34wwqO5P8h29DL0k
         +vS9TJeWvr2nAYFN32w4mWI7ow6uUoAFMVYAKOUg0ITv6eLuIrj6N9DHFltrQobaKc7i
         pnfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526111; x=1779130911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UasgaygcEAyRMWmEw6L6LjHmbIj1q8wLQQcU0N5zRcE=;
        b=bP19XS86ea44OH7Ihah5+HbscAJqtw61TtKLmz45mKt42YFXpAmYU70svkmdTi3FQf
         kzyq/7IazylaFS//uIuf3e1TQvAwalHGEvLUnfhhqEgew/X4SwlBZBHcmu2yNYqR9fLQ
         zgFS/Jo2qWP5UcOWBM+o54kwy0azKzzC/eRUDwzdI3QP5EQkMUQ9Jz1aSE/IUCBHzap6
         KiZ1nJyTUGKJiTeJGw9bniP57POyRl/F5wIJIsJKA3Dot3Xh8MpRETsR0UiFbOL740a5
         pP3Ny3OfNagFPC1bbZZVLIVpEGWfpMEYIl2jzSlT3dQM/kDScs5ryndjgJRANLlmwWOh
         fcUQ==
X-Forwarded-Encrypted: i=1; AFNElJ81XNUx93j1PBXl7ziKCBbcnngNmSamR68RrvUXhU1Skt/yNKyhfHRthPMEOGqfmOHEVborwigph2/K9ZrTAQO+@lists.infradead.org
X-Gm-Message-State: AOJu0YwwntDCz+oIXDqzhcSqNN532QFmhmhOPcZsri3Ff5RLw1oOlPbI
	Ko0FFZ8mjv+SGqRftoaI8wBXJ4HjRmEL0NCGQLXzuuSuU7HKFRfvFNNPXGtxD0YEKgnEmd0Ok6R
	8Pd4n57eYIDYj6A+uY4ODxvPo2W7sZy+3Bi96dU5N
X-Gm-Gg: Acq92OFC1unFmDhsDlO+lzsiwa8ML5ppDCQPv+0bXLzHjRawVKkFe1mAkeY6DpChrZs
	KA6EhjbPUXa8QnrZx2IXFQyrjoWRg8iiHzOs9eXfz+avEMq22/snbk7WCp6nnEQ4ao+ee0M2/+r
	hiwCI81rr4yz/2hTWROfa2gcBRpAEwIMTrRaEh6ztlKFp0Eo/DiWCdX5LtiJ6SGtZQI9Aa+YC4T
	A/eR6Ybet1sd9N61oRnIkfz4YQf4HjdXx0q+7zhFzG1+oHisROpopXQrRsqgLG59FDOQOByDjBa
	lp1DGMxBd/kxHWwIXZDQo6jJFxeIMPV8xHDfCGiS0as1Ew+J
X-Received: by 2002:aa7:c399:0:b0:668:c2b6:9fa2 with SMTP id
 4fb4d7f45d1cf-680b4539f8bmr5944a12.7.1778526111017; Mon, 11 May 2026 12:01:51
 -0700 (PDT)
MIME-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
 <20260427153416.2103979-19-ardb+git@google.com> <CAG48ez1DJ88a0pBCE-Q0VXyDuJgng8zdunb38g4b4JPU88exww@mail.gmail.com>
 <202605111144.349EF737E@keescook>
In-Reply-To: <202605111144.349EF737E@keescook>
From: Jann Horn <jannh@google.com>
Date: Mon, 11 May 2026 21:01:14 +0200
X-Gm-Features: AVHnY4J61JG6Vq5BHLoEJWjDPI-cUqKQQzYAmbcRiKqmBdXYMvgpf6b8RTG6Wkg
Message-ID: <CAG48ez3q2kW9GD-KVDQ_T=C=ADXmSqY2UyfXq_EMJeEsQ6KgRA@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] mm: Make empty_zero_page __ro_after_init
To: Kees Cook <kees@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Mike Rapoport <rppt@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_120153_590344_541783CC 
X-CRM114-Status: GOOD (  25.05  )
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

On Mon, May 11, 2026 at 8:45=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Fri, May 08, 2026 at 07:02:51PM +0200, Jann Horn wrote:
> > On Mon, Apr 27, 2026 at 5:44=E2=80=AFPM Ard Biesheuvel <ardb+git@google=
.com> wrote:
> > > The empty zero page is used to back any kernel or user space mapping
> > > that is supposed to remain cleared, and so the page itself is never
> > > supposed to be modified.
> > >
> > > So make it __ro_after_init rather than __page_aligned_bss: on most
> > > architectures, this ensures that both the kernel's mapping of it and =
any
> > > aliases that are accessible via the kernel direct (linear) map are
> > > mapped read-only, and cannot be used (inadvertently or maliciously) t=
o
> > > corrupt the contents of the zero page.
> > >
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > Reviewed-by: Jann Horn <jannh@google.com>
> >
> > Sorry, I should have looked at this properly earlier instead of ending
> > up duplicating this patch with
> > <https://lore.kernel.org/all/20260508-ro-zeropage-v1-1-9808abc20b49@goo=
gle.com/>.
>
> As you mention in your testing of the patch, could we add an LKDTM test
> that does the same to catch any regressions?

Shouldn't be too hard - LKDTM crashtypes don't accept arguments, so we
couldn't easily pass in a userspace pointer, I think, but we could
make a crashtype that allocates anon memory with do_mmap() (under
mmap_lock), then GUP on the allocated userspace address, then writes
into the obtained address with something like atomic_add(0, <pointer
from kmap(page)>) to trigger a write access without actually changing
memory contents...

