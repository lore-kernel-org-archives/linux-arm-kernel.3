Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A561C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 20:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dqu3z7xLiOSf+mcYINqf8wHjgnmfkNcGWDDBMVjmjy8=; b=oWKZUrKFwrXy0ErnaweEDiAzJw
	JjXKo9Xf/++i4nIpYLdeG0lqc8q7s+C+RPSWfjWN20/cJbURqrXj1go4OEsotDGiRjDc9qI63dQx2
	ua2dOPjXPIPcOMYjEONE3jChFL+J7w4QOLh7QDaNzvxS3uHEI0JakIEf/EPC3GANGcjhYMNO+HZUZ
	RW+DR3Afy60iQ2Vd1yzLDLJBDpla/3lwPHOXh/5rX+RyitDz8CgT8EQWEEueCvBjBJ0WHv8aY7auv
	MHV25XK/4ScMdN8Y7ErzEJE6eJtOqtN/GJr5Lj2X3gsCf8ugetE5va9RAzceSyxpcZzbXxfwelaAn
	CUtmZRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tspKW-0000000CSH8-2hBF;
	Thu, 13 Mar 2025 20:39:00 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tspIr-0000000CS7Z-1ISr;
	Thu, 13 Mar 2025 20:37:18 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-524038ba657so1189629e0c.0;
        Thu, 13 Mar 2025 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741898236; x=1742503036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dqu3z7xLiOSf+mcYINqf8wHjgnmfkNcGWDDBMVjmjy8=;
        b=Q6ens7XMw1MhnfO/JXKeohEO1cAUg/PbKyTkefolDkAcPKoLX6P7/AXuzzuvmtZcwj
         zlQb91cmQY5yxKMtU1Hl8VjTvK1xDOr9/zCzRcxGGWeqT2knUP0CoOvuwHKYAP4Shlbo
         RRC2w3Z+fD7mCn7nt4BRR43oJ0P2qNHplA8bmoANrkPP95Gi8XF/CACGJjWKzHIdlGDO
         bBOksesNYOmnz21n8kriK+ye4iCNmb1aFAVyzG5rbb5F9rOpcWcskxYUXEA53+bfTk/Y
         ypk1bMd7yuDegnbJ6OiL9yxW9e/822UVggfKGfcsGcl7fCps5prnfVtZfUlB9qvYODh4
         rNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741898236; x=1742503036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dqu3z7xLiOSf+mcYINqf8wHjgnmfkNcGWDDBMVjmjy8=;
        b=g6Y9jA8zpj46AKt0rp9t6AsxBIbocBhIzJ2qwK9dACxzKEVu8GFI0Jh+zEFy3sqJ+p
         i3JlRHTfiHjDp8zA/NYGuEpPHHMb/ZoqWlLsSdzjNKNU0qjjptDl1edkiShO2AuT2ZLT
         Kf/63qia86N3cLddOdgRe9frk6AEwEx2JfDMfQPjpe+Gz6FOXQmkBMdUOKMj7dF+QgIL
         u1I1TXczs5j46OwqpI0YH4w3YSGSAWbTJ8Exc7yAHHPXOwX6uYMEXvP/p4I+4uWeI3Yw
         MQTLD5fM86865xfW+Bh6PuL2MUR4Mq7mKujproT8LR73ItlXLY8DzSgdCqA9DENeitB9
         Wkbg==
X-Forwarded-Encrypted: i=1; AJvYcCX7I3/KC8u/EELGKjmS3qBfUZZFUzvCG/D49jlSMG/xGbJFySIH2Y1sCGIGLOXCu5QlkCHwfYrtKTwop29h2tM=@lists.infradead.org, AJvYcCXveppYuabSdJPTu2GNnhpp4fTnCyHYmlxXqwquISB5HGzr7Q/FEE9vQy3vDkd874XjZs7XuerhHfwb30vmv4iP@lists.infradead.org
X-Gm-Message-State: AOJu0YyDNWOynhXWJwP3rxElWNJA5lArh+cc4DeSs1tYcCwsR3ZAatOd
	aYZ2mRlW3og1GRUTR0Qb55xhwMRdFhPQ5AJI9U6cKwsukRO/TAOo7i7kEzxLpNPHsOag9aTdzdM
	3lVOfYWGpix/t3TYdmeTbDsD+08M=
X-Gm-Gg: ASbGncs0Kd8CwRdbiaFE/B0WpnUR+TMCHa/QBpjjOQ6e7zLw6OhRjySXJKbafU7XLTf
	2UOKynXSJC5rRqVgZKWv0/artyXW9r2DxV7wnSNzLx+mPNe5LG4I0+9Nv/vVXT/gBRZeclfQG6u
	SyFDnPCzADkObM2CdUZmYpjua/4A==
X-Google-Smtp-Source: AGHT+IGhWPno/cBlLy5i4JFgfTgN4go/KloyhLNpBTEj6UkmZZkGZMKDNDN1ix3of11Oz/UJSScIn1QWnKmOTjaulGI=
X-Received: by 2002:a05:6122:3115:b0:523:6eef:af62 with SMTP id
 71dfb90a1353d-5243a4082e2mr4188850e0c.4.1741898235977; Thu, 13 Mar 2025
 13:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <Z9HOavSkFf01K9xh@google.com> <5gqqbq67th4xiufiw6j3ewih6htdepa4u5lfirdeffrui7hcdn@ly3re3vgez2g>
 <CAGsJ_4xwnVxn1odj=j+z0VXm1DRUmnhugnwCH-coqBLJweDu9Q@mail.gmail.com>
 <Z9MCwXzYDRJoTiIr@google.com> <CAGsJ_4yaSx1vEiZdCouBveeH3D-bQDdvrhRpz=Kbvqn30Eh-nA@mail.gmail.com>
 <Z9MWzDUxUigJrZXt@google.com>
In-Reply-To: <Z9MWzDUxUigJrZXt@google.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 14 Mar 2025 09:37:04 +1300
X-Gm-Features: AQ5f1JogIHzZmp31Tn9SRX0wI-8utb1OhKH-ruNw33einw0Y1Le7Sq_FlEtZGgo
Message-ID: <CAGsJ_4z9pSt=LdfDUmQ7YhNocE6CJGxEwighSygGZrDFSyKU+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: Minchan Kim <minchan@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
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
X-CRM114-CacheID: sfid-20250313_133717_353481_EEF2327F 
X-CRM114-Status: GOOD (  58.03  )
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

On Fri, Mar 14, 2025 at 6:33=E2=80=AFAM Minchan Kim <minchan@kernel.org> wr=
ote:
>
> On Fri, Mar 14, 2025 at 05:58:00AM +1300, Barry Song wrote:
> > On Fri, Mar 14, 2025 at 5:07=E2=80=AFAM Minchan Kim <minchan@kernel.org=
> wrote:
> > >
> > > On Thu, Mar 13, 2025 at 04:45:54PM +1300, Barry Song wrote:
> > > > On Thu, Mar 13, 2025 at 4:09=E2=80=AFPM Sergey Senozhatsky
> > > > <senozhatsky@chromium.org> wrote:
> > > > >
> > > > > On (25/03/12 11:11), Minchan Kim wrote:
> > > > > > On Fri, Mar 07, 2025 at 08:01:02PM +0800, Qun-Wei Lin wrote:
> > > > > > > This patch series introduces a new mechanism called kcompress=
d to
> > > > > > > improve the efficiency of memory reclaiming in the operating =
system. The
> > > > > > > main goal is to separate the tasks of page scanning and page =
compression
> > > > > > > into distinct processes or threads, thereby reducing the load=
 on the
> > > > > > > kswapd thread and enhancing overall system performance under =
high memory
> > > > > > > pressure conditions.
> > > > > > >
> > > > > > > Problem:
> > > > > > >  In the current system, the kswapd thread is responsible for =
both
> > > > > > >  scanning the LRU pages and compressing pages into the ZRAM. =
This
> > > > > > >  combined responsibility can lead to significant performance =
bottlenecks,
> > > > > > >  especially under high memory pressure. The kswapd thread bec=
omes a
> > > > > > >  single point of contention, causing delays in memory reclaim=
ing and
> > > > > > >  overall system performance degradation.
> > > > > >
> > > > > > Isn't it general problem if backend for swap is slow(but synchr=
onous)?
> > > > > > I think zram need to support asynchrnous IO(can do introduce mu=
ltiple
> > > > > > threads to compress batched pages) and doesn't declare it's
> > > > > > synchrnous device for the case.
> > > > >
> > > > > The current conclusion is that kcompressd will sit above zram,
> > > > > because zram is not the only compressing swap backend we have.
> > >
> > > Then, how handles the file IO case?
> >
> > I didn't quite catch your question :-)
>
> Sorry for not clear.
>
> What I meant was zram is also used for fs backend storage, not only
> for swapbackend. The multiple simultaneous compression can help the case,
> too.

I agree that multiple asynchronous threads might transparently improve
userspace read/write performance with just one thread or a very few threads=
.
However, it's unclear how genuine the requirement is. On the other hand,
in such cases, userspace can always optimize read/write bandwidth, for
example, by using aio_write() or similar methods if they do care about
the read/write bandwidth.

Once the user has multiple threads (close to the number of CPU cores),
asynchronous multi-threading won't offer any benefit and will only result
in increased context switching. I guess that is caused by the fundamental
difference between zram and other real devices with hardware offloads -
that zram always relies on the CPU and operates synchronously(no
offload, no interrupt from HW to notify the completion of compression).

>
> >
> > >
> > > >
> > > > also. it is not good to hack zram to be aware of if it is kswapd
> > > > , direct reclaim , proactive reclaim and block device with
> > > > mounted filesystem.
> > >
> > > Why shouldn't zram be aware of that instead of just introducing
> > > queues in the zram with multiple compression threads?
> > >
> >
> > My view is the opposite of yours :-)
> >
> > Integrating kswapd, direct reclaim, etc., into the zram driver
> > would violate layering principles. zram is purely a block device
>
> That's the my question. What's the reason zram need to know about
> kswapd, direct_reclaim and so on? I didn't understand your input.

Qun-Wei's patch 2/2, which modifies the zram driver, contains the following
code within the zram driver:

+int schedule_bio_write(void *mem, struct bio *bio, compress_callback cb)
+{
+ ...
+
+        if (!nr_kcompressd || !current_is_kswapd())
+                 return -EBUSY;
+
+}

It's clear that Qun-Wei decided to disable asynchronous threading unless
the user is kswapd. Qun-Wei might be able to provide more insight on this
decision.

My guess is:

1. Determining the optimal number of threads is challenging due to varying
CPU topologies and software workloads. For example, if there are 8 threads
writing to zram, the default 4 threads might be slower than using all 8 thr=
eads
synchronously. For servers, we could have hundreds of CPUs.
On the other hand, if there is only one thread writing to zram, using 4 thr=
eads
might interfere with other workloads too much and cause the phone to heat u=
p
quickly.

2. kswapd is the user that truly benefits from asynchronous threads. Since
it handles asynchronous memory reclamation, speeding up its process
reduces the likelihood of entering slowpath / direct reclamation. This is
where it has the greatest potential to make a positive impact.

>
> > driver, and how it is used should be handled separately. Callers have
> > greater flexibility to determine its usage, similar to how different
> > I/O models exist in user space.
> >
> > Currently, Qun-Wei's patch checks whether the current thread is kswapd.
> > If it is, compression is performed asynchronously by threads;
> > otherwise, it is done in the current thread. In the future, we may
>
> Okay, then, why should we do that without following normal asynchrnous
> disk storage? VM justs put the IO request and sometimes congestion
> control. Why is other logic needed for the case?

It seems there is still some uncertainty about why current_is_kswapd()
is necessary, so let's get input from Qun-Wei as well.

Despite all the discussions, one important point remains: zswap might
also need this asynchronous thread. For months, Yosry and Nhat have
been urging the zram and zswap teams to collaborate on those shared
requirements. Having one per-node thread for each kswapd could be the
low-hanging fruit for both zswap and zram.

Additionally, I don't see how the prototype I proposed here [1] would confl=
ict
with potential future optimizations in zram, particularly those aimed at
improving filesystem read/write performance through multiple asynchronous
threads, if that is indeed a valid requirement.

[1] https://lore.kernel.org/lkml/20250313093005.13998-1-21cnbao@gmail.com/

>
> > have additional reclaim threads, such as for damon or
> > madv_pageout, etc.
> >
> > > >
> > > > so i am thinking sth as below
> > > >
> > > > page_io.c
> > > >
> > > > if (sync_device or zswap_enabled())
> > > >    schedule swap_writepage to a separate per-node thread
> > >
> > > I am not sure that's a good idea to mix a feature to solve different
> > > layers. That wouldn't be only swap problem. Such an parallelism under
> > > device  is common technique these days and it would help file IO case=
s.
> > >
> >
> > zswap and zram share the same needs, and handling this in page_io
> > can benefit both through common code. It is up to the callers to decide
> > the I/O model.
> >
> > I agree that "parallelism under the device" is a common technique,
> > but our case is different=E2=80=94the device achieves parallelism with
> > offload hardware, whereas we rely on CPUs, which can be scarce.
> > These threads may also preempt CPUs that are critically needed
> > by other non-compression tasks, and burst power consumption
> > can sometimes be difficult to control.
>
> That's general problem for common resources in the system and always
> trace-off domain in the workload areas. Eng folks has tried to tune
> them statically/dynamically depending on system behavior considering
> what they priorites.

Right, but haven't we yet taken on the task of tuning multi-threaded zram?

>
> >
> > > Furthermore, it would open the chance for zram to try compress
> > > multiple pages at once.
> >
> > We are already in this situation when multiple callers use zram simulta=
neously,
> > such as during direct reclaim or with a mounted filesystem.
> >
> > Of course, this allows multiple pages to be compressed simultaneously,
> > even if the user is single-threaded. However, determining when to enabl=
e
> > these threads and whether they will be effective is challenging, as it
> > depends on system load. For example, Qun-Wei's patch chose not to use
> > threads for direct reclaim as, I guess,  it might be harmful.
>
> Direct reclaim is already harmful and that's why VM has the logic
> to throttle writeback or other special logics for kswapd or direct
> reclaim path for th IO, which could be applied into the zram, too.

I'm not entirely sure that the existing congestion or throttled writeback
can automatically tune itself effectively with non-offload resources. For
offload resources, the number of queues and the bandwidth remain stable,
but for CPUs, they fluctuate based on changes in system workloads.

Thanks
Barry

