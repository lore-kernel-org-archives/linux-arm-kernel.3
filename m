Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10DAC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFsVVhebDK1NYCWoS7EgmVQ2tl6qP90tIWoC9j9TLlQ=; b=ulTrVUvXThm4tAymPP8rVB7JrI
	n0fipu/GFcT2PfATlSK/IKaDeLmqfhlzVOZzkG21N521VSqFCzD3nmvoOJ+MIDu1Rxj0BTiplDDU9
	DgIBjVEZoonD9EeHoFFvkWRD2kruqgKvPeDhScAh2v9FAPxH0OsYVMOu5D8TapX7/7UGlZ7yosAKU
	NFUM/z5kcTd9ZrbEF/deuFqu8zsDHJTVGpIDl7TtbrJZ2LppOeErTN1sbBVUxi4nrr+I3QKIGTdF3
	tQlMAI3NejUP2KNrqwRcff9eR/qMS8HLtnOCT2z+oS/Zucxr+WwaZdfQFllfRRE3kPK+d8RLLwv11
	kXOZH9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgyz-0000000G1na-08a8;
	Wed, 07 May 2025 15:46:53 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgR3-0000000FuVD-1Hxr;
	Wed, 07 May 2025 15:11:50 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6f5496972d3so338906d6.0;
        Wed, 07 May 2025 08:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630708; x=1747235508; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFsVVhebDK1NYCWoS7EgmVQ2tl6qP90tIWoC9j9TLlQ=;
        b=OUkN8kMfbQWIqpx9a+AwiVjqQbW+TmZCSJCp87ub13lDJX2zAzGVglXsdGvdG1LfPa
         6YDdgRP/DbTe47oEt9gYM/9luNLrgydkLRjgIiuizolcj8ahZ56waafazRc7JcEtzS8g
         RlmuLaLyophI2nM5BYmXjMEFIhwSxWx2MSjzH/eI/25iae5X5xC8cHWFIE3vooMBV1GV
         WUlhLxxehI5V1PKvGOjdkDYwf2cjWQF4RfrdsD/BCgtKvdIex9/6fG/t86o9JKbHi/XG
         Ne+IQSdSRQTINCa6IJLAeRFytGfBKT6fHAdem/CQzfkb8GILVKuOGUIBP3/YgObs+Tyu
         R9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630708; x=1747235508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFsVVhebDK1NYCWoS7EgmVQ2tl6qP90tIWoC9j9TLlQ=;
        b=Nv4usmZbv2nsF067GvtfakINnKSNaMQhrKwYvh+fogYse5QhKE0wApohKGbgnx4smB
         2f9QZ8wWFIf7iCizsFpg+7hZXr1DFjjFVm+hNo1rT6Nf6oQxoeJgzoONJOtREzMf3Zhh
         xMfAuuvVISpumrmS2pgdNLoJ0sWAHAlDFoOW2sNqb4djQ+t2WXhhDx4G+xjG+ko0mIkD
         6FBKeI7NTfPrDiQprJzTVdvAJsG7lSk9dAyUgncuI6aN657UGEMHLwmCxNiho5d/bf5c
         GJ5s0sVtfdJ6Sqc4yuXVEG1Iw3jDijOitZRPi/HkUVD2DcPOi1Fccf+Hosz45QqyEllF
         dcHw==
X-Forwarded-Encrypted: i=1; AJvYcCUvo4qmzmGDICykRpEb3k+HgpFD8EpRK8EEZ3hKKYsJHwGrU06lxB2CDGVJ1NODPsE+QhP1N2asrvP+tNazPjBN@lists.infradead.org, AJvYcCXD9xSS1Ji+GsG0sWXV8WQcsWRYXBYXkTGPHmFaNDz1mye6xp9vSmPs857Tz+pqm80DoTM1FCNsd4y7MoGk26w=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe5k5FAL3XvDpcdXDeXZkDVut7ITeOt0daUAoEAda1hoveHJv0
	4iVJ37TrVifvMPydcrc49DzvztxgJDTbY1D3HkqECkLQX3/k3pR633toJamzwqRZWaLdPjenYI0
	AsWFh862+kxiu5puxes3FZNAWMKgridkQ
X-Gm-Gg: ASbGncv81kilIX8IS8j1sm+GOpIy+xDfIEQpQYsKxp13yi8E7J6Z2+RKYKms1y7rQUn
	CsScPj/7exZT3U2p2V10KjPw1Qrt88bC+f/zLz0MXFZUbbc2ZnYodHAJscePB8UL30OhYGcc0UP
	iJ6XJfFg162hn68IjRMGoHo3s=
X-Google-Smtp-Source: AGHT+IGgnreWVGqTX/OGt9t1yjfLukHeVyIawQ7JyQXO4oyNHOjm4AAmpDVZh+WGawWTYtY55suI3sZpRR9Poy5HWxA=
X-Received: by 2002:ad4:5f88:0:b0:6e4:4164:8baa with SMTP id
 6a1803df08f44-6f5429e303fmr49840626d6.6.1746630707997; Wed, 07 May 2025
 08:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com>
 <20250430145106.8ce79a05d35cec72aa02baa6@linux-foundation.org> <CAGsJ_4wLuJNe9uPE3-fBNLdiCPBpKt4a1ytuf7-+oiS5rBrg_w@mail.gmail.com>
In-Reply-To: <CAGsJ_4wLuJNe9uPE3-fBNLdiCPBpKt4a1ytuf7-+oiS5rBrg_w@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 7 May 2025 08:11:36 -0700
X-Gm-Features: ATxdqUEcu4e-_kxqbjUBLr1u_eNqQEaHZr7zcbF_KTN22201A4BiR4YT9uX5Xs0
Message-ID: <CAKEwX=PW4YdCx77ZycvqkeW9JXL2PnxyjpseSy3ddtg8QtAKWQ@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Barry Song <21cnbao@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
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
X-CRM114-CacheID: sfid-20250507_081149_346058_1FFCC317 
X-CRM114-Status: GOOD (  35.19  )
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

On Wed, Apr 30, 2025 at 3:50=E2=80=AFPM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Thu, May 1, 2025 at 9:51=E2=80=AFAM Andrew Morton <akpm@linux-foundati=
on.org> wrote:
> >
> > On Wed, 30 Apr 2025 16:26:41 +0800 Qun-Wei Lin <qun-wei.lin@mediatek.co=
m> wrote:
> >
> > > This patch series introduces a new mechanism called kcompressd to
> > > improve the efficiency of memory reclaiming in the operating system.
> > >
> > > Problem:
> > >   In the current system, the kswapd thread is responsible for both sc=
anning
> > >   the LRU pages and handling memory compression tasks (such as those
> > >   involving ZSWAP/ZRAM, if enabled). This combined responsibility can=
 lead
> > >   to significant performance bottlenecks, especially under high memor=
y
> > >   pressure. The kswapd thread becomes a single point of contention, c=
ausing
> > >   delays in memory reclaiming and overall system performance degradat=
ion.
> > >
> > > Solution:
> > >   Introduced kcompressd to handle asynchronous compression during mem=
ory
> > >   reclaim, improving efficiency by offloading compression tasks from
> > >   kswapd. This allows kswapd to focus on its primary task of page rec=
laim
> > >   without being burdened by the additional overhead of compression.
> > >
> > > In our handheld devices, we found that applying this mechanism under =
high
> > > memory pressure scenarios can increase the rate of pgsteal_anon per s=
econd
> > > by over 260% compared to the situation with only kswapd. Additionally=
, we
> > > observed a reduction of over 50% in page allocation stall occurrences=
,
> > > further demonstrating the effectiveness of kcompressd in alleviating =
memory
> > > pressure and improving system responsiveness.
> >
> > It's a significant change and I'm thinking that broader performance
> > testing across a broader range of machines is needed before we can
> > confidently upstream such a change.
>
> We ran the same test on our phones and saw the same results as Qun-Wei.
> The async compression significantly reduces allocation stalls and improve=
s
> reclamation speed. However, I agree that broader testing is needed, and
> we=E2=80=99ll also need the zswap team=E2=80=99s help with testing zswap =
cases.

The warning aside (which I got around by setting and unsetting
PF_MEMALLOC in kcompressd()), I run kernel building tests with zswap.
There is not much performance difference with and without kcompressd.
That probably means kernel building is a mediocre benchmark more than
anything. Ideally, I want to experiment with some real workloads, but
that is a bit more involved to set up, unfortunately :(

I can try again once you have sent v2 that incorporates our review, at
least to make sure everything is stable and there is no obvious
regression. Hopefully I can set up a proper experiment at some point
too...

>
> >
> > Also, it's presumably a small net loss on single-CPU machines (do these
> > exist any more?).  Is it hard to disable this feature on such machines?
>
> A net loss is possible, but kswapd can sometimes enter sleep contexts,
> allowing the parallel kcompressd thread to continue compression.
> This could actually be a win. But I agree that additional testing on
> single-CPU machines may be necessary.
>
> It could be disabled by the following if we discover any regression on
> single-CPU machines?
>
> if (num_online_cpus() =3D=3D 1)
>      return false;
>
> >
> > >
> > > +static bool swap_sched_async_compress(struct folio *folio)
> > > +{
> > > +     struct swap_info_struct *sis =3D swp_swap_info(folio->swap);
> > > +     int nid =3D numa_node_id();
> > > +     pg_data_t *pgdat =3D NODE_DATA(nid);
> > > +
> > > +     if (unlikely(!pgdat->kcompressd))
> > > +             return false;
> > > +
> > > +     if (!current_is_kswapd())
> > > +             return false;
> > > +
> > > +     if (!folio_test_anon(folio))
> > > +             return false;
> >
> > Are you sure the above three tests are really needed?
>
> Currently, it runs as a per-node thread mainly to accelerate asynchronous
> reclamation, which effectively reduces direct reclamation. Since direct
> reclamation already follows the slow path, asynchronous compression offer=
s
> limited additional benefit in that context. Moreover, it's difficult
> to determine
> the optimal number of threads for direct reclamation, whereas the  compre=
ssion
> in the current direct reclamation allows it to utilize all CPUs.
>
> The first condition checks whether kcompressd is present. The second
> ensures that we're in kswapd asynchronous reclamation, not direct
> reclamation. The third condition might be optimized or dropped, at least =
for
> swap-backed shmem, and similar cases.
>
> Thanks
> Barry

