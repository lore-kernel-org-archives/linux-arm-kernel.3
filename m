Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B801FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 17:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZRKJKZ9nlIeWSuKxcLT+2RQaSrxw/L262gLI4l/W7Y=; b=1EBAE8v77rwnJddrkR10cqxnhu
	NR0SXNO1BMnckXIB9kMPXFGGhJHFl7z6liD5o6lakPQUZhq/xWhSBRgcxTJrL+f51co+jdHYKNm4O
	fYcl2HLPydKxwDk6EsYY4KNFEeHfolZS6YU1deyU8qzjosIMGve8jc47hrZ6o/RssxdOmUTrN0tle
	0xDGoj7TUuUV6J0TnsRDKp+k+Ci+Fm8F6QLCzskggnfKC4+q8r2GaE7o+4VLnN2e7N6szw6YiCsoB
	vGWN8ZDfGinUEsFkC26mkWwrXnavA6Mj3HY7wQwEoD6ZRwG6C/qXsoJHC9Mj1y0F0nP0/1L/ABify
	TjGI+uww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgeq-00000003SfQ-0IYz;
	Mon, 10 Mar 2025 17:11:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgSM-00000003QJS-0McQ;
	Mon, 10 Mar 2025 16:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4ZRKJKZ9nlIeWSuKxcLT+2RQaSrxw/L262gLI4l/W7Y=; b=TUZRBR4NBF7CVOp/ZUhRO3qDu2
	+8iw/NwXlgtU5VQ142IuzIVdRhx37yOgD4Pba+JBxBgohX3bvEBAzgfMRfIdE/YDm/6PO0inTK178
	C7tUbH+20kk/lbvOPmf9KSBclx2o7W1OoncjOiw3fCOTZyqfWMx/WAKHIjeGv4Ej+25BXNU2c096J
	FeWkLTPnO3gSJL+U2j/K9e3trm1Q1yp/i1oKYC1K4Y8ee/GAHo+yKz3qqKjipVDVJt1zAjBqa2817
	qn6+cAtUt1OHkuoGr/1tkawR62B+evL+k5xoHkEUE1TKGVCQbdyevb0MV7J5LJNBHoS5+10tqaxX2
	952flW/w==;
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trgSJ-00000001xO4-12Cm;
	Mon, 10 Mar 2025 16:58:21 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c547932d2eso113313185a.0;
        Mon, 10 Mar 2025 09:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741625895; x=1742230695; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZRKJKZ9nlIeWSuKxcLT+2RQaSrxw/L262gLI4l/W7Y=;
        b=e9LlOD1ViXy5rK6yUNI9tKYg3ZnnLCf7zXfhwUkuuNUV4eJLDn9KfjqINEyEVOE2V3
         Vh9HpNRQCcKWqXBFa0tUr50RTBSzh3U/ym98dRRdKNqR4sllF+cDZCVkIe4txUAn1tnF
         z18rXXPzpFnuxeXEVUVesJGWKXbyho6ERDiZO0UigO/sFfgmSt6XU5MFlETcKd9o0jTg
         FSbJGlw7qFvoUTQdXxpxFPP1Qd3sLOFvUXmpFm25Ax2vquEn5YRQiavpel0CdkRHYd3N
         ueVVYl52zQM+4ULZ9FIKYVxLZpWi5lxStnnT+EQVAA2d+ijDGLtRflYXWxFnnPn9maGa
         7yhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741625895; x=1742230695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ZRKJKZ9nlIeWSuKxcLT+2RQaSrxw/L262gLI4l/W7Y=;
        b=tdhnJaLbbB83DdA/TkuFTKrU1WMBr4PlqMH9beFvrK4TCiIqsTi811yUfROgBJ15+4
         Bej3HmhIpYNRo3gmyGfUh9CcmwNG4VywgqsKUSN6IBn3hcaorgfgei9YPLVqUfZsiZPh
         k9N5+qa83ckr+yj5AZh1ByOjqRJxW24odyDUWIO8lvYzdvhC+xftT5d6qgS4zvRJgET3
         0xS8BxH3lhjl+Gz188Z8BvsTJ5wP8MFmfrneEdeEPL1pBklAcoFaOv2PvlFxjTz9x7jl
         i71IvVJgUrnz3vhmdZkU6zM19SVuFiujQdu9TYzvEounC2kwwmD+emUNyu7L/sThXbjU
         iGDw==
X-Forwarded-Encrypted: i=1; AJvYcCUHzjxdXD8Npj6ghyXv03WPo45WnuL0kgqDDDIU6z7U2/OilyA2puwD4d5Zyl14oY8XG9pI2VpE2g0QtC3Q2pnI@lists.infradead.org, AJvYcCVHpVQgQndJhdtUkYN3fEVCFM5edvpmQL/83OIT1WTYRUf5Ma/p6Ef1N5YCsDaOIszFZs55icLwlZGG7dDgd1Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPqnnLGEml7UZFBrVh4hu42BFbWZGOdN8uELjB/qxkVjVZcDzV
	SsZxkEyQ2MUTsGdmZW0JEoeoetPia0QhlpC18PJ15D6XtppllyT9H8SMg8jqKptABMEAO7WAxEX
	A0Y9/eFbsPTdpIsKCymvSIXw0pZ4=
X-Gm-Gg: ASbGnctaV1Hwe59F19229cWSu7tukLvLAixUfm6ZEpp3CZhptC8YxxN6vmKeLX83nfb
	0BEvdWONEZ01CeyDp9iLKS7uRgzb4c/IlSYxVPaNJeag65YU2keGWCtl2vjy9ByIkATz5diVATY
	HR0nxvSAzCDUop15ao867Ps/6R7HWgf0gz19FAGxOqHoNx+C0+8QEMk0Z+3DFxflcfeuEc
X-Google-Smtp-Source: AGHT+IGLgqTmt1SDyAD0npx1AoBzMAH3/wL78InRxx9wcGrHh376yvWmApG86TD6jVVvmno+Mrl+M1sPXtYY48F+++4=
X-Received: by 2002:a05:6214:268b:b0:6e8:9e9c:d212 with SMTP id
 6a1803df08f44-6e9004f8506mr237299696d6.0.1741625894265; Mon, 10 Mar 2025
 09:58:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <CAKEwX=NfKrisQL-DBcNxBwK2ErK-u=MSzHNpETcuWWNBh9s9Bg@mail.gmail.com>
 <CAGsJ_4ysL1xV=902oNM3vBfianF6F_iqDgyck6DGzFrZCtOprw@mail.gmail.com> <52896654fa07a685707b11cfcc141b038a13b649.camel@mediatek.com>
In-Reply-To: <52896654fa07a685707b11cfcc141b038a13b649.camel@mediatek.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 10 Mar 2025 09:58:03 -0700
X-Gm-Features: AQ5f1JoVlbRC8ML7j1bVCk8yzJp1pkIWgzfAiwocC8Jva43BmjLh8eyu6rj7o_I
Message-ID: <CAKEwX=PNHik8O6swwRPsuDovtCNLxXRQUsiXZSSq8ZbzFvJV0w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: =?UTF-8?B?UXVuLXdlaSBMaW4gKOael+e+pOW0tCk=?= <Qun-wei.Lin@mediatek.com>
Cc: "21cnbao@gmail.com" <21cnbao@gmail.com>, =?UTF-8?B?QW5kcmV3IFlhbmcgKOaliuaZuuW8tyk=?= <Andrew.Yang@mediatek.com>, 
	=?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>, 
	"chrisl@kernel.org" <chrisl@kernel.org>, =?UTF-8?B?SmFtZXMgSHN1ICjlvpDmhbbolrAp?= <James.Hsu@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"dave.jiang@intel.com" <dave.jiang@intel.com>, 
	"schatzberg.dan@gmail.com" <schatzberg.dan@gmail.com>, 
	=?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= <chinwen.chang@mediatek.com>, 
	"viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, 
	"minchan@kernel.org" <minchan@kernel.org>, "axboe@kernel.dk" <axboe@kernel.dk>, 
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "kasong@tencent.com" <kasong@tencent.com>, 
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, 
	"vishal.l.verma@intel.com" <vishal.l.verma@intel.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>, 
	"dan.j.williams@intel.com" <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_165819_336806_37E90D29 
X-CRM114-Status: GOOD (  30.29  )
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

On Mon, Mar 10, 2025 at 6:22=E2=80=AFAM Qun-wei Lin (=E6=9E=97=E7=BE=A4=E5=
=B4=B4)
<Qun-wei.Lin@mediatek.com> wrote:
>
>
> Thank you for your explanation. Compared to the original single kswapd,
> we expect t1 to have a slight increase in re-scan time. However, since
> our kcompressd can focus on compression tasks and we can have multiple
> kcompressd instances (kcompressd0, kcompressd1, ...) running in
> parallel, we anticipate that the number of times a folio needs be re-
> scanned will not be too many.
>
> In our experiments, we fixed the CPU and DRAM at a certain frequency.
> We created a high memory pressure enviroment using a memory eater and
> recorded the increase in pgsteal_anon per second, which was around 300,
> 000. Then we applied our patch and measured again, that pgsteal_anon/s
> increased to over 800,000.
>
> > >
> > > >
> > > > Problem:
> > > >  In the current system, the kswapd thread is responsible for both
> > > >  scanning the LRU pages and compressing pages into the ZRAM. This
> > > >  combined responsibility can lead to significant performance
> > > > bottlenecks,
> > >
> > > What bottleneck are we talking about? Is one stage slower than the
> > > other?
> > >
> > > >  especially under high memory pressure. The kswapd thread becomes
> > > > a
> > > >  single point of contention, causing delays in memory reclaiming
> > > > and
> > > >  overall system performance degradation.
> > > >
> > > > Target:
> > > >  The target of this invention is to improve the efficiency of
> > > > memory
> > > >  reclaiming. By separating the tasks of page scanning and page
> > > >  compression into distinct processes or threads, the system can
> > > > handle
> > > >  memory pressure more effectively.
> > >
> > > I'm not a zram maintainer, so I'm definitely not trying to stop
> > > this
> > > patch. But whatever problem zram is facing will likely occur with
> > > zswap too, so I'd like to learn more :)
> >
> > Right, this is likely something that could be addressed more
> > generally
> > for zswap and zram.
> >
>
> Yes, we also hope to extend this to other swap devices, but currently,
> we have only modified zram. We are not very familiar with zswap and
> would like to ask if anyone has any suggestions for modifications?
>

My understanding is right now schedule_bio_write is the work
submission API right? We can make it generic, having it accept a
callback and a generic untyped pointer which can be casted into a
backend-specific context struct. For zram it would contain struct zram
and the bio. For zswap, depending on at which point do you want to
begin offloading the work - it could simply be just the folio itself
if we offload early, or a more complicated scheme.



> > Thanks
> > Barry
>
> Best Regards,
> Qun-wei
>
>

