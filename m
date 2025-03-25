Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974B7C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 22:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQ1y6K6+ej3yRZwY8vjRGO04KNMR+SXa0FKK7FdZ1GE=; b=rRMsl2ljKsH4ysUUVeJV9qsuZ7
	bJAXAN/oJAwFWoTetlRlGbQb8LfZQXswjZeh9E0VWn/QaXhFBq2csKuOayNAX9PNGRFHh5MCt/lOi
	7u1ZyErP1GSwvekZkzPp0+SdquEB2tENdQx7iXSfYZ6NUvFg7bNS750vNyeLokXwe0CgvDtKMLCHs
	MJZG4+rH/o5dWaP+p5y1oVilwQmLMyYSAy141m720/4izi1F8mmPC1CAoUSsKgQtBGPzBaL33p/mg
	gZyM+/zDYdnsg+TEQ+zO9L5eI7GB/Lwzfwm9V3n+EklPJ47GJmhzweJxwhxygHXjQ8ND0H9a2ATOr
	TT22lJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCK6-000000077hX-1cB1;
	Tue, 25 Mar 2025 22:00:38 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCGg-000000077M0-1xiG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 21:57:08 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-47666573242so158831cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Mar 2025 14:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742939825; x=1743544625; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ1y6K6+ej3yRZwY8vjRGO04KNMR+SXa0FKK7FdZ1GE=;
        b=nfQx748wXdkOcT7lFXW1HND8lg3NyNr1x+qXFkdyLaKIiFzpXMpn1J7QlRLV9kjasd
         uGlMV7cbf98wflACzm1cjJY+hpgI8g0x0KJMzhXjt4a1XWI06SGKDvuYPOaN7rIE2djU
         VSW0pgEkw7GMcafItE0Ul0/+XDFSDh9beANVVigeaMm2/LumzkaVc4QPjSWZOeM9JeNH
         Xpf8dLEh+juJ81uPkQNLEeWj7qHBfkZHZIC0VVm8QmzKrJFjmWWAfcwGE1Q1q4glxEyx
         v7DC/0CQ2D/Q38NWWdUaU0NkX4I8EdoFviLrCpopl1NPRaARz7qslR6yxwRBlMdookzV
         6RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939825; x=1743544625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQ1y6K6+ej3yRZwY8vjRGO04KNMR+SXa0FKK7FdZ1GE=;
        b=kdAWr1tQ2GLCRYxFcHMdxpnTnLgf89q7czyqMrqzdLmeOoqXGHQ57v6qSSpAxuEfix
         +KOD1YIVupf2nU3RKRCoCyVdCgNUsjPBKzuSzI3MdWXkpLPNRA6K6qWr8h3RYN4tvSje
         jedOzBTx+sGPI3GdufSMMOIBugnUT0boYIwAo48NpsnVe1V1aNfjwOgwU2x5OgPTSSmW
         SvzaqzBFa/DaR5BsW1tdu9c8o1rb/ysgmGxCyWDoVp4/xcy3pOr0b86/01yMyBJ+m8Zy
         ZQLdctWoTgRirGWUvXNCT0PVkIqwnt+g1nBwzESo8AzfmvN8UhkOTeK/IV48eNM/A5D0
         n2ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU2Ep4QH7rwPxcjSrvVVPOViFRXnMpXlpc4mumzDMv3rHbL1TVD/69XFk3qHkVsa4VfbItHFiIsRa6drhm0dMg+@lists.infradead.org
X-Gm-Message-State: AOJu0YxTR1EiP2BePxQ8v0yg/dJ/AvR3PWj8/5bf1ek/bTWmMi/M9oBO
	79i2QcxFrJ+u6W37OKqbRS8rqkGd30xIdr7XfxE6P0bTSzpcdTZWrSpbVbZkmj5OqXpLNq2q1fN
	yTleuHS5hgkRMawmMAb9S3sesnOUG7sd4r0BO
X-Gm-Gg: ASbGncuw5XPP7vU1yVZ32TQGdmUVqw0yghvjIH7geKxfJ8y1c4rKbe7WuClUHktgOQY
	MdQ06TGdNdjoBFuUF8/xZbrUijIOZtDkBItwAibxPKQ+SZj4xqVTUgdUJfRNM8mZjSI0GfKFGOP
	vg9HNEjrxEIyI5PzxYPj5UhF0=
X-Google-Smtp-Source: AGHT+IH/hOP5cz4/f0sHk0CeJX9EkyXr4jUNyz2/3phYBrvYUFI/aeZIqxahOHueL/ItRZ16YGhpvWcqwmSbOB39SDQ=
X-Received: by 2002:ac8:6f05:0:b0:472:61:652 with SMTP id d75a77b69052e-47762e3319amr159031cf.28.1742939824283;
 Tue, 25 Mar 2025 14:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-8-changyuanl@google.com> <CAPTztWbFXajArSN8yKu32eSoR=xsk1CHM_4V7MJ0eQxydFqPUQ@mail.gmail.com>
 <Z-MB0Cj4tM6QgOAg@kernel.org>
In-Reply-To: <Z-MB0Cj4tM6QgOAg@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 25 Mar 2025 14:56:52 -0700
X-Gm-Features: AQ5f1JoGOY12Onu4tBrwgKWOKiM9GvbU7kfWg3JcOKhqducXkStWehGksThe0mY
Message-ID: <CAPTztWbDtDhKZS89-aEBaZoPW2jZM2CAWW1Y_m3OnNE26=d9UQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/16] kexec: add Kexec HandOver (KHO) generation helpers
To: Mike Rapoport <rppt@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org, graf@amazon.com, 
	akpm@linux-foundation.org, luto@kernel.org, anthony.yznaga@oracle.com, 
	arnd@arndb.de, ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_145706_506352_29101AFA 
X-CRM114-Status: GOOD (  28.15  )
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

On Tue, Mar 25, 2025 at 12:19=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Mon, Mar 24, 2025 at 11:40:43AM -0700, Frank van der Linden wrote:
[...]
> > Thanks for the work on this.
> >
> > Obviously it needs to happen while memblock is still active - but why
> > as close as possible to buddy initialization?
>
> One reason is to have all memblock allocations done to autoscale the
> scratch area. Another reason is to keep memblock structures small as long
> as possible as memblock_reserve()ing the preserved memory would quite
> inflate them.
>
> And it's overall simpler if memblock only allocates from scratch rather
> than doing some of early allocations from scratch and some elsewhere and
> still making sure they avoid the preserved ranges.

Ah, thanks, I see the argument for the scratch area sizing.

>
> > Ordering is always a sticky issue when it comes to doing things during
> > boot, of course. In this case, I can see scenarios where code that
> > runs a little earlier may want to use some preserved memory. The
>
> Can you elaborate about such scenarios?

There has, for example, been some talk about making hugetlbfs
persistent. You could have hugetlb_cma active. The hugetlb CMA areas
are set up quite early, quite some time before KHO restores memory. So
that would have to be changed somehow if the location of the KHO init
call would remain as close as possible to buddy init as possible. I
suspect there may be other uses.

Although I suppose you could just look up the addresses and then
reserve them yourself, you would just need the KHO FDT to be
initialized. And you'd need to avoid the KHO bitmap deserialize trying
to redo the ranges you've already done.

>
> > current requirement in the patch set seems to be "after sparse/page
> > init", but I'm not sure why it needs to be as close as possibly to
> > buddy init.
>
> Why would you say that sparse/page init would be a requirement here?

At least in its current form, the KHO code expects vmemmap to be
initialized, as it does its restore base on page structures, as
deserialize_bitmap expects them. I think the use of the page->private
field was discussed in a separate thread, I think. If that is done
differently, it wouldn't rely on vmemmap being initialized.

A few more things I've noticed (not sure if these were discussed before):

* Should KHO depend on CONFIG_DEFERRED_STRUCT_PAGE_INIT? Essentially,
marking memblock ranges as NOINIT doesn't work without
DEFERRED_STRUCT_PAGE_INIT. Although, if the page->private use
disappears, this wouldn't be an issue anymore.
* As a future extension, it could be nice to store vmemmap init
information in the KHO FDT. Then you can use that to init ranges in an
optimized way (HVO hugetlb or DAX-style persisted ranges) straight
away.

- Frank




> > - Frank
>
> --
> Sincerely yours,
> Mike.

