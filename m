Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE31C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 03:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dixt0o39GPmiD7R1LFsj4ci5HN2s7q23k30NE+Mi48k=; b=aOmAAd4g0nwtEwm64ZP/OXJwaI
	kxT5vtr87egCxNb957Xf0usjau0gG61YVnuFDpUvhQaMJjyrrp4h4SE8fQyz46m4wXpXlMHft+zC5
	bdBgcGVVLmeZwh0aWAyU48kgDauxrRtUibeyH6vDpTmSI08WVq9sPpJClP929HRy7QhuWLWiw1SrH
	TwfW1HXvg6m0LSLAEcM5YyOCmWuJfWe8BbOy+6jZQFLKsAzwEC5vdWq27IsrgEbahGKFNJmtJm9mX
	StY/zfoJIryHkAK2q9M5e0PTJ5hCMyTnl/rvo7jaJmOt3QYQMXFX+eI9aLn2RJUxEzhwL9DoMabTo
	uiZW6u9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZY2-0000000A1G4-3THT;
	Thu, 13 Mar 2025 03:47:54 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsZWK-0000000A13k-2xSV;
	Thu, 13 Mar 2025 03:46:10 +0000
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-868ddc4c6b6so250570241.2;
        Wed, 12 Mar 2025 20:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741837567; x=1742442367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dixt0o39GPmiD7R1LFsj4ci5HN2s7q23k30NE+Mi48k=;
        b=RUH/Mn11GIvXiTmPK9wmgH5n6NzMcSFleF4ls892ws04iauhKxzMztqZ4DVrZhdd6n
         kUN0GaD81wRLkT7Kx77An0LvcyU07kmENRghKGPPTAk2E7lf70a2mlJjseSLd+aId/bD
         tJNG+L4zOHSNhyyXwt5rdywdGfSpFYcd43CoZNAZn3psyqnUI8OM8MLH7APpeC025VzV
         sNU2NPa/xe2cCkvrspi9OlowP4p9FOapmQrB7F+0KtAZd+GUU3o3g2MHYTrj5A5/GWBf
         KeRqR6eTdGvZUQMHVfrKyMRe38ggIdW356vjy5AZELMsZohGQYe/LzCFIxSDX2WV39c4
         ocZA==
X-Forwarded-Encrypted: i=1; AJvYcCVWxekAEmAw8+fQ3NRFGEzP7vKMEJwyzC9FdNGuw1jPf5fq+G82fRZI1VlI5OuqYJdDRfGMjyZQeTQBcb5hys0=@lists.infradead.org, AJvYcCW4nojeYJ7l8/PxfOx8EFGE8pKvKBPF2fFpR52bhxENCjlybX1OnsxL/M4R6aoscrONPs4a9JjUTFc+BTQFcyYC@lists.infradead.org
X-Gm-Message-State: AOJu0YzYqqmHr4qtH46KUDtyC6V0I5qYtsCdiEFcQ7mJC9tU9pgpWyxU
	/rjoHDx9tBNGwIL77SXJ5TssISbmProK05mbq36SS7x8pv02bpN75jtGqJnBk1a/9Yu7T2/nPLU
	C+e8Fmk5jY80VHN1J75Hw3JSRVl0=
X-Gm-Gg: ASbGnctTOcRaRLrn+xMyyt73fzCRSs5UwtNndyN9hIj+wmMn2Lxg+iki8mFZl8NryIK
	6dFqE3fw/Wj25eGw2J1926kMtmz5DVVgIzJa/SgLiwUZxmVgodJKQUmcMddf0gJ4Evi6Cntb30U
	Rw3f9IvUU8IF7c26opolasbgpz4JI=
X-Google-Smtp-Source: AGHT+IGKfJC93Nhzdina8J8KkusxalxlfeWj7d8uwv73O0rWMH3p3y24byG1ZqjULZykunz6Axe6UbH9L31TnbSBip8=
X-Received: by 2002:a05:6102:32cf:b0:4c1:90ee:823e with SMTP id
 ada2fe7eead31-4c30a5aca5cmr18955360137.12.1741837566985; Wed, 12 Mar 2025
 20:46:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <Z9HOavSkFf01K9xh@google.com> <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
In-Reply-To: <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
From: Barry Song <baohua@kernel.org>
Date: Thu, 13 Mar 2025 16:45:54 +1300
X-Gm-Features: AQ5f1JpUJWPRwcbH8KgHq36fZ320naGIJ8qCM44dyq_HWdMuZphdvOhJ0AAxw94
Message-ID: <CAGsJ_4xwnVxn1odj=j+z0VXm1DRUmnhugnwCH-coqBLJweDu9Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
	Jens Axboe <axboe@kernel.dk>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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
X-CRM114-CacheID: sfid-20250312_204608_768458_E2202CDD 
X-CRM114-Status: GOOD (  21.23  )
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

On Thu, Mar 13, 2025 at 4:09=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (25/03/12 11:11), Minchan Kim wrote:
> > On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> > > This patch series introduces a new mechanism called kcompressd to
> > > improve the efficiency of memory reclaiming in the operating system. =
The
> > > main goal is to separate the tasks of page scanning and page compress=
ion
> > > into distinct processes or threads, thereby reducing the load on the
> > > kswapd thread and enhancing overall system performance under high mem=
ory
> > > pressure conditions.
> > >
> > > Problem:
> > >  In the current system, the kswapd thread is responsible for both
> > >  scanning the LRU pages and compressing pages into the ZRAM. This
> > >  combined responsibility can lead to significant performance bottlene=
cks,
> > >  especially under high memory pressure. The kswapd thread becomes a
> > >  single point of contention, causing delays in memory reclaiming and
> > >  overall system performance degradation.
> >
> > Isn't it general problem if backend for swap is slow(but synchronous)?
> > I think zram need to support asynchrnous IO(can do introduce multiple
> > threads to compress batched pages) and doesn't declare it's
> > synchrnous device for the case.
>
> The current conclusion is that kcompressd will sit above zram,
> because zram is not the only compressing swap backend we have.

also. it is not good to hack zram to be aware of if it is kswapd
, direct reclaim , proactive reclaim and block device with
mounted filesystem.

so i am thinking sth as below

page_io.c

if (sync_device or zswap_enabled())
   schedule swap_writepage to a separate per-node thread

btw,  ran the current patchset with one thread(not default 4)
on phones and saw 50%+ allocstall reduction. so the idea
looks like a good direction to go.

Thanks
Barry

