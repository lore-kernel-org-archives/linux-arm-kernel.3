Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4F8C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqomUUPjRLiQmonoip8f3BCduAZxVjsjo6bLnE0yfxE=; b=I739UpHRSlADI8XAgZIJR0Xw4q
	w7C5a6F8ZJOrWWC636s1+zawPnVWmTvHDyTpxFAIn/LU5Xsh9A4ba8wJnYHpYLhJgXC/5NM0uT8ZG
	gz7GlkM96AqW9fEt/rxOWP0J4XLopjoE5mC6ks/FHt8bDrYfYWuvMeY/rTaz+223UcQui1arj4Nnw
	bI8ivOFR40c+QjDS/HOpbPK9Pj6oa0Yt9wVdP4ZR7l2PEm8L+JLpMsjdk2bX0kK8ej/wWZ8U8EKwv
	nBgsoYnJXpHQKfXGfyHK+WF743IXLGfwisIXGsRG5FLrk7hIr3hhfo8MeOsl+keQgUfoJUnG0jqdZ
	jWRvmH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqguH-0000000FmGV-3yEX;
	Fri, 07 Mar 2025 23:15:05 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqgse-0000000Fm2a-1c2Q;
	Fri, 07 Mar 2025 23:13:25 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6e41e18137bso17003226d6.1;
        Fri, 07 Mar 2025 15:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741389203; x=1741994003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqomUUPjRLiQmonoip8f3BCduAZxVjsjo6bLnE0yfxE=;
        b=cWU6/9vH/dnKaJadKdpy1vdtOgvZF+yHjyHfwdB9NIzwS4swToeNFkjwRdl3TsHrJL
         Pk8xaWRQGZdz19qBuagEmeuG0cdbDWdKkSifvmSsfMLelftx3RJmpnam4XMpKUqX2WP2
         UcywrDSVcx9yPiRvzFw4NTCwpWZDVmeAhpqgVwUqEjKnZWBoS5qn9RVUIGrS2Egic8sy
         oGDhRTAhf59sG3Ksv2c8N7ohrL28qgv7Kpn5npUhyndxhJus2whNOKyyJRuKEZ3MzVj0
         jtq3bnJDAvjWA691nzU+pq8nca92PmJqlR4hzxfhM9VkDac7dBW5FBEUbVwzsKhMn7eu
         DVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741389203; x=1741994003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqomUUPjRLiQmonoip8f3BCduAZxVjsjo6bLnE0yfxE=;
        b=XFtuIzyD6qP4eoKThcfVyB+GCeL57qfp9aIfu4R1XEZT9qUNmwAj5SL/2/3KzKSd0x
         Q8vn1ZkcJYbnYVbTIE1B6ytp1OikArR+m4ndu7KNRDLgOahdhrWNJzyx1EMLBhnHJjyg
         55Ll9k1iYtgCoOnN25gwcdWSiaCBLebPzO3vpSr1govd70L9qF9gDdH2xkUlfk0F49fX
         pYCKQnt4OGS6oipmWAdMPaNaF/ZYhCiGtKrjYFL+AsRB23XI9uxoHRrbEswQ+LRHb1Yp
         a/ge1d1h5x6aRqizVq9DveT/20wqRmZDQWHKXdUYC6p/q9id5oT6VOA2m9QKWWn6sXuN
         KAwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDQ5857XwPz4Ma3WgvCdgfD8iORGN9XkIz3DHHpaEZynfwCQCtjZnTl7VwXIUE4FjcPOpbBjwy1uEv2x/fbOM=@lists.infradead.org, AJvYcCXJ2s2gqEY0IeZdGwH9XDsq4By9/oPeWirT7PlbPGf22dCwSkGkZi9zqlNlskSG0DLTQw+Xa0uMGfUaW8n8gF+p@lists.infradead.org
X-Gm-Message-State: AOJu0YyZkBmurdNAuaBEBftsCLdNg78qXyU9qPrKTB0MZeSuSAKicJQa
	52FmYa/JyxhfRORaJUt5VV8WQh/Aw5RJPpbuan6pxrf2qQ73adMcKzeNrrTdvwUL3pmFBa2FBEa
	MoqtK1IPC8yHO2j8dBVv4zT+/cSA=
X-Gm-Gg: ASbGnct615LnH1qCNjl6A9c5KRDJzhT9cciUrkoAL7pStbQoWeCU5kicOxifhAv8bXG
	VR479W2iZF+7Z9JzNPfpZ5m3aV8eMTouRaBDacUL81YXhoGsR/nThceEwyfcyDZusQHarjF9iO5
	v4B52HyzvZUDmpbC6IDiWFzyzRwkcgTcV3tNicovn1ng==
X-Google-Smtp-Source: AGHT+IGgO4waxliJRJEjcjUATYM+tLYXbT7o9vAllgT5zmhdZvJYwca7AqrIUigw62PVDCYdl3bzS0BOeN1gV1tcJBc=
X-Received: by 2002:a05:6214:21a6:b0:6e4:2dd7:5c88 with SMTP id
 6a1803df08f44-6e90068196dmr70464496d6.38.1741389203258; Fri, 07 Mar 2025
 15:13:23 -0800 (PST)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <20250307120141.1566673-3-qun-wei.lin@mediatek.com> <CAGsJ_4xtp9iGPQinu5DOi3R2B47X9o=wS94GdhdY-0JUATf5hw@mail.gmail.com>
In-Reply-To: <CAGsJ_4xtp9iGPQinu5DOi3R2B47X9o=wS94GdhdY-0JUATf5hw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 7 Mar 2025 15:13:12 -0800
X-Gm-Features: AQ5f1JooOtTd4HVR7CCnLuHoQkyIFVDhrvbdPzpgk1fPg8et0mZMLZfSKYeQ1OE
Message-ID: <CAKEwX=OP9PJ9YeUvy3ZMQPByH7ELHLDfeLuuYKvPy3aCQCAJwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kcompressd: Add Kcompressd for accelerated zram compression
To: Barry Song <21cnbao@gmail.com>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Jens Axboe <axboe@kernel.dk>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Kairui Song <kasong@tencent.com>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Casper Li <casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>, 
	Andrew Yang <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_151324_421019_ED7F17B2 
X-CRM114-Status: GOOD (  23.95  )
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

On Fri, Mar 7, 2025 at 11:41=E2=80=AFAM Barry Song <21cnbao@gmail.com> wrot=
e:
>
> On Sat, Mar 8, 2025 at 1:02=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.=
com> wrote:
> >
> > Introduced Kcompressd to offload zram page compression, improving
> > system efficiency by handling compression separately from memory
> > reclaiming. Added necessary configurations and dependencies.
> >
> > Signed-off-by: Qun-Wei Lin <qun-wei.lin@mediatek.com>
> > ---
> >  drivers/block/zram/Kconfig      |  11 ++
> >  drivers/block/zram/Makefile     |   3 +-
> >  drivers/block/zram/kcompressd.c | 340 ++++++++++++++++++++++++++++++++
> >  drivers/block/zram/kcompressd.h |  25 +++
> >  drivers/block/zram/zram_drv.c   |  22 ++-
> >  5 files changed, 397 insertions(+), 4 deletions(-)
> >  create mode 100644 drivers/block/zram/kcompressd.c
> >  create mode 100644 drivers/block/zram/kcompressd.h
> >
> > diff --git a/drivers/block/zram/Kconfig b/drivers/block/zram/Kconfig
> > index 402b7b175863..f0a1b574f770 100644
> > --- a/drivers/block/zram/Kconfig
> > +++ b/drivers/block/zram/Kconfig
> > @@ -145,3 +145,14 @@ config ZRAM_MULTI_COMP
> >           re-compress pages using a potentially slower but more effecti=
ve
> >           compression algorithm. Note, that IDLE page recompression
> >           requires ZRAM_TRACK_ENTRY_ACTIME.
> > +
> > +config KCOMPRESSD
> > +       tristate "Kcompressd: Accelerated zram compression"
> > +       depends on ZRAM
> > +       help
> > +         Kcompressd creates multiple daemons to accelerate the compres=
sion of pages
> > +         in zram, offloading this time-consuming task from the zram dr=
iver.
> > +
> > +         This approach improves system efficiency by handling page com=
pression separately,
> > +         which was originally done by kswapd or direct reclaim.
>
> For direct reclaim, we were previously able to compress using multiple CP=
Us
> with multi-threading.
> After your patch, it seems that only a single thread/CPU is used for comp=
ression
> so it won't necessarily improve direct reclaim performance?
>
> Even for kswapd, we used to have multiple threads like [kswapd0], [kswapd=
1],
> and [kswapd2] for different nodes. Now, are we also limited to just one t=
hread?
> I also wonder if this could be handled at the vmscan level instead of the=
 zram
> level. then it might potentially help other sync devices or even zswap la=
ter.

Agree. A shared solution would be much appreciated. We can keep the
kcompressd idea, but have it accept IO work from multiple sources
(zram, zswap, whatever) through a shared API.

Otherwise we would need to reinvent the wheel multiple times :)

