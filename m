Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F078CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Hao5re1+cPlNlzNJBZ4sf1w820eCIPHa6P9dbVUFmE=; b=Y6A25YfyLVeRLbwta7aRW7k3jm
	brdwRgPsaHVICIJfjJcePU9gMpouCzW5+IQg5BLQffU4agcXJzAB3WjRPigtd9RO90d3B6oUvYG6W
	2QpGEsL1yBtk6Q+9ySX21CBVDEVZllxAmZctV3afO/vJj1ar1AAxNRJJFCdYkJHyUHyQqsFY0r1bQ
	onbbRt24GBaQ2h1LkvQp76VXtFrOPggWwUOboKkQIeuxGwCQGv7tQwOHKKggbvERSFqpz6P0MX5QO
	NN019jVX3dG8Bz+Iu5jbaX/il1ueHusVtz8uScFrjonYzuNcwpfPoUbxKHn6skKZL4n0JvLeHEmsh
	lTIhoq6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCiA-00000001MCN-3Wq8;
	Thu, 18 Jun 2026 13:23:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCi9-00000001MC3-20Er
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 13:23:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1B59445AE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 13:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C12E11F0155F
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 13:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781788992;
	bh=+Hao5re1+cPlNlzNJBZ4sf1w820eCIPHa6P9dbVUFmE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EVaQzpYiRqYK5hksirc5nS24Y0fzb4urTSaV/jtRdTqQooIUUArTy1+HgkpKtFwim
	 1+4WlmhNJEAkxfk/lfl5HQjq/Y957Ghxvj8izXGw/06pRWDQPP+ruSGUZgnocnwips
	 nbOIxMtH4SiWbCBweUzm8EhaTU1i0hc0tbBr2uihXX5GFXhUhRfgxP9GVbhs5rMYWN
	 UNGGSkpKbvRFL+6yTa8AVdYBjxBLZUvVNeRIn9og2bs/QNiJX0VZzDE8FhqrkAKrLo
	 Qg38vSG6ryiNQ1C1rfo8rjZkYxReWCmpGf8+iB5xzZqjutTJZyoifdtv8K9wn/4odD
	 sAtImPZz7u1lg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ad4d262fc1so780010e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 06:23:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9P8oHAJUmXkQU/wOcefApaZZp4GchPhjr4i6pUXU+5MhikmykPVTyi6pJ63uCTHXhtn74qZwPXwMJKpBTkkjgu@lists.infradead.org
X-Gm-Message-State: AOJu0YxIblC1NX2ULbdm+26avlKfY3Rk9pWO/aTH0d4zX1V47v18X0XA
	o9gahKVxgGEOjV8xjPPFJvcI9tl0CD1DwdY80Hfo0rCSlwNaVr0NiLFSPcghZT13KhsaMutYwEf
	p3NIEg7DBTerJ/bxP9BDnSDlCm7Zq1JI=
X-Received: by 2002:a05:6512:6487:b0:5aa:6289:e0b5 with SMTP id
 2adb3069b0e04-5ad50ec7bfbmr700610e87.35.1781788991504; Thu, 18 Jun 2026
 06:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com> <20260526-kpkeys-v8-1-eaaacdacc67c@arm.com>
 <70f4dcdf-c45f-47d3-91df-a7897bd86ff4@kernel.org>
In-Reply-To: <70f4dcdf-c45f-47d3-91df-a7897bd86ff4@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 18 Jun 2026 15:22:58 +0200
X-Gmail-Original-Message-ID: <CAD++jL=km9hqTuTMFUhyx_QPuMEwWqmnUVQtPtMXnp8paHH1_A@mail.gmail.com>
X-Gm-Features: AVVi8CdVd_MSXkJ8x_FXRhl-ZhQK3-a6vu0Q8TQoQCS7OolDkuqw-biJhYguwBU
Message-ID: <CAD++jL=km9hqTuTMFUhyx_QPuMEwWqmnUVQtPtMXnp8paHH1_A@mail.gmail.com>
Subject: Re: [PATCH RFC v8 01/24] mm: Introduce kpkeys
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, linux-hardening@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Andy Lutomirski <luto@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Pierre Langlois <pierre.langlois@arm.com>, 
	Quentin Perret <qperret@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, Will Deacon <will@kernel.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org, 
	Lorenzo Stoakes <ljs@kernel.org>, Thomas Gleixner <tglx@kernel.org>
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

On Tue, Jun 16, 2026 at 5:19=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:

> Looking at this, and wondering about "why do we get registers involved in=
 this
> API" I would probably have an interface like:
>
>         arch_kpkeys_enter_context()
>         arch_kpkeys_leave_context()
>
> Whereby you return a "struct kpkeys_state" or sth like that.

This is close to what I was looking for as well.

enter/leave makes the code look more like generic entry.

Passing some kind of state cookie around is inevitable in
this design and IIUC Kevin argued that it would be inefficient
(another level of abstraction) as opposed to just hammering
in the context we want, where we want it.

But I think the compiler will optimize that out by constant
propagation if the backing architecture implementation is
simple.

Yours,
Linus Walleij

