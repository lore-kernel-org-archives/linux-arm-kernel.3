Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D5AC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 16:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6P88DLJwjZTV6+YJp5PA5/tnjoUbLaNgJShCD98PEJw=; b=4ZwxND0f5IH7mMGjGLYyFOfi7g
	l3pICAPRv9TjZRK6+lZ/JPzhnCnFy4w+jJvC6aTah/YZF0DpILL4+RW+DLJMpDObSKaeY/+ZlQsaU
	A6wgZxyR28v80pHr0EZoHx3Iax4N6VTqRzyfTV4U0zJq9+Fn2yg8WDeqM/fSOHK5Cd+q0ZwgQ7TBP
	ChfixGUs+sAiyhAt7V1vGtKoNBh8zn5d6LrvxxLcEb2ActcNnfzKVDnoZdpvIYuUUZZfafk6OU/m2
	ylqxAA60qeNGdo7tzrTAstEo1KYcf0UVt+jQhW0mTkOEMNvo1Bgk0ZfHgyQvhc6BzsnaoVNk/00tD
	XGXPEieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChCg-0000000G4gh-1mw1;
	Wed, 07 May 2025 16:01:02 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgGp-0000000Fsfs-0uIQ;
	Wed, 07 May 2025 15:01:17 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6f0ad744811so66456d6.1;
        Wed, 07 May 2025 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630071; x=1747234871; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P88DLJwjZTV6+YJp5PA5/tnjoUbLaNgJShCD98PEJw=;
        b=NxqHzvQjJTPR5eNXJexUiIYdctVGQPK4YUWKjBwxLg+O6aGyPIxEobA+8OxKWXHNdH
         TtYM41sNdTcKFbWqndXQRw668nRFOhZjoLuhvgi/JTsgsYAITh0MmTDW9EemGkZi4x9J
         qC6J9z+SaaiGCZVtBzJUr7AJjSPPhsGn2tRlm3Tanx1cV+DTn8N7HjmCl/oPfEHA7BFU
         JRpIqtsAANT7yyZsYV6qcg99Ficrk8aFV6ezBqf9Dn9SiChYrUf0eZZycn9dwTPvBIR6
         YMuVS2ANZtqv9hPJpk6VXaxmFUOS7rYgJ09+tKjRf1xr/SDJwXj65AjVTPwMhhwG2ExP
         SVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630071; x=1747234871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P88DLJwjZTV6+YJp5PA5/tnjoUbLaNgJShCD98PEJw=;
        b=vWp5XJ5MLtFzJORqNljhQsBxEbPkWs0XRR3kgeJsPPztjf2fh5Cxx7evPda20fK3b2
         BE8oYbUOMj+Nq5fXXEU2uCe/6RaU/uaDUGnhRSP0mUC9h4/D2GGAQwI1VLrEFMKuaZRN
         OgU3sJcmoM4ozMU77qes+kiuzPIlMuOozV+xJ6G3K9IPoYfGvVYJp35BmVNnCMT+ibQ1
         XCh9RMBzgW6Y+3MCQl05MaU8oYwlbzzTOjEvJuF2eWU2Q1LIDiJD0zCfY+aUOWnfLtog
         q7CjuKT6yQ/6RqJMKjjl2blEAbp//d+NBWZccQAhFoKbt01hFeqNb/d6652ny42r8cAT
         EYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZM4II7Vzn4wzU+xGhgN5otla6VncFVAfJ4kvtnt+m1R9p9eYhAoYUeCCuOR8v2SpaGvSs8wEZ2G2uRKKnj08=@lists.infradead.org, AJvYcCWwrhxP0ouF1UusxIH+1uZjLNU+d2Ps+lcs3DtsDNUI532P3ajpK60PChNOT8rCJZBo0ej7xmbcn0PunSdLgn7H@lists.infradead.org
X-Gm-Message-State: AOJu0YxeRBkCQ8d7bGO2JCimqPnm9DChX/vy9dJN2pANdaVhSCjPL2XJ
	cdfSIN2qVpwjIujxBQcwPhw00THUPHcuX959P94+r0bP0lGWbZEXlrSIc2a4VQIWmq3/NCuPtd0
	qiYVQou7lBpT7ybttE3JY/bRPbxw=
X-Gm-Gg: ASbGncuM7ksITH7YQLOkrKkTwXa6lrG2BQOB3Gls/XydZKVlFF0BPdAO41M3f/LS2bu
	33FlVu1MVuWSeBMLWVr4929ISWPYsjmA8RLvVQ0TLg1zTbwbvHh1Xu7I038SFun6EKIptQ8u1Yr
	bfdnXaV//DYzqTE28vYygkEQ0=
X-Google-Smtp-Source: AGHT+IFFpBEl3tD+vAAO3AKleiaarL+ScnybGt92nCTf5nORPfhlz+Z0Rwo3ogxYQXshqUgF+V+GBVifm7gBsWgoZoE=
X-Received: by 2002:a05:6214:cc4:b0:6e8:9a55:824f with SMTP id
 6a1803df08f44-6f5429b354emr52557756d6.6.1746630070743; Wed, 07 May 2025
 08:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
 <aBqzcIteOzC9mRjY@harry> <A3307E1B-B741-4C23-8053-72A1CA04D923@nvidia.com> <CAGsJ_4yBn7j3WpCttPB0PVuRCYTYBcDbW2221AaPNLOHSmKADA@mail.gmail.com>
In-Reply-To: <CAGsJ_4yBn7j3WpCttPB0PVuRCYTYBcDbW2221AaPNLOHSmKADA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 7 May 2025 08:00:59 -0700
X-Gm-Features: ATxdqUEizMgKIBqWKtTySGenm7msLmuvbZBCtMD6RABSUsHW1bY0saY3YhYcLjM
Message-ID: <CAKEwX=NyZnNmiERFzwMUGQ8CJ7Pqm_XqHWMQoPjJKnBQefZkiw@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Barry Song <21cnbao@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Qun-Wei Lin <qun-wei.lin@mediatek.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_080115_254340_34D6F145 
X-CRM114-Status: GOOD (  29.66  )
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

On Tue, May 6, 2025 at 7:04=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrote=
:
>
> On Wed, May 7, 2025 at 1:50=E2=80=AFPM Zi Yan <ziy@nvidia.com> wrote:
> >
> > On 6 May 2025, at 21:12, Harry Yoo wrote:
> >
> > > On Wed, Apr 30, 2025 at 04:26:41PM +0800, Qun-Wei Lin wrote:
> > >> This patch series introduces a new mechanism called kcompressd to
> > >> improve the efficiency of memory reclaiming in the operating system.
> > >>
> > >> Problem:
> > >>   In the current system, the kswapd thread is responsible for both s=
canning
> > >>   the LRU pages and handling memory compression tasks (such as those
> > >>   involving ZSWAP/ZRAM, if enabled). This combined responsibility ca=
n lead
> > >>   to significant performance bottlenecks, especially under high memo=
ry
> > >>   pressure. The kswapd thread becomes a single point of contention, =
causing
> > >>   delays in memory reclaiming and overall system performance degrada=
tion.
> > >>
> > >> Solution:
> > >>   Introduced kcompressd to handle asynchronous compression during me=
mory
> > >>   reclaim, improving efficiency by offloading compression tasks from
> > >>   kswapd. This allows kswapd to focus on its primary task of page re=
claim
> > >>   without being burdened by the additional overhead of compression.
> > >>
> > >> In our handheld devices, we found that applying this mechanism under=
 high
> > >> memory pressure scenarios can increase the rate of pgsteal_anon per =
second
> > >> by over 260% compared to the situation with only kswapd. Additionall=
y, we
> > >> observed a reduction of over 50% in page allocation stall occurrence=
s,
> > >> further demonstrating the effectiveness of kcompressd in alleviating=
 memory
> > >> pressure and improving system responsiveness.
> > >>
> > >> Co-developed-by: Barry Song <21cnbao@gmail.com>
> > >> Signed-off-by: Barry Song <21cnbao@gmail.com>
> > >> Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> > >> Reference: Re: [PATCH 0/2] Improve Zram by separating compression co=
ntext from kswapd - Barry Song
> > >>           https://lore.kernel.org/lkml/20250313093005.13998-1-21cnba=
o@gmail.com/
> > >> ---
> > >
> > > +Cc Zi Yan, who might be interested in writing a framework (or improv=
ing
> > > the existing one, padata) for parallelizing jobs (e.g. migration/comp=
ression)
> >
> > Thanks.
> >
> > I am currently looking into padata [1] to perform multithreaded page mi=
gration

TIL about padata :)

> > copy job. But based on this patch, it seems that kcompressed is just an=
 additional
> > kernel thread of executing zswap_store(). Is there any need for perform=
ing
> > compression with multiple threads?
>
> The current focus is on enabling kswapd to perform asynchronous compressi=
on,
> which can significantly reduce direct reclaim and allocstall events.
> Therefore, the work begins with supporting a single thread. Supporting
> multiple threads might be possible in the future, but it could be difficu=
lt
> to control=E2=80=94especially on busy phones=E2=80=94since it consumes mo=
re power and may
> interfere with other threads impacting user experience.

Right, yeah.

>
> >
> > BTW, I also notice that zswap IAA compress batching patchset[2] is usin=
g
> > hardware accelerator (Intel Analytics Accelerator) to speed up zswap.
> > I wonder if the handheld devices have similar hardware to get a similar=
 benefit.
>
> Usually, the answer is no. We use zRAM and CPU, but this patch aims to pr=
ovide
> a common capability that can be shared by both zRAM and zswap.
>

Also, not everyone and every setup has access to hardware compression
accelerators :) This provides benefits for all users.

