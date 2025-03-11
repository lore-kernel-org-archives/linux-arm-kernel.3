Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE112C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oci9eEq+toTA4eT0HbbNQG595NfpjyU1+E2PAns3Nzg=; b=meqpKSVCzBoSmZRZXRUlI6IMo4
	0TuidzUEWleVIoKt6VhsvvF8NnwnUbcvrTeBhTtnjZn1DzuEK1hJ/Rzy5SWawYQhO/CJiATv+QUin
	GOZsRNMgUCGdtn0s8rmO5gBQxXePH5Z++7fA/reqjMXYKy8eSy3UNUxs3jEoerz2b6IGcO3tCJdK7
	Ry+wmtHRiLwk3MZOABMFlGnCTDXAYHk5/YzgS7TNffaG7e4zB4mCqQUBopUt0LbmmJS2mKpsF2ftW
	uVmsXTW8HPnswZSGp3TbKy2Cu5XcONTYg1zF4p5wDayJpCMWeALBa+M8ENolrneaoSg+FpLtXu8ow
	Ya3/cFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trw0p-00000005AVV-16OJ;
	Tue, 11 Mar 2025 09:34:59 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvzB-00000005AJw-1MKq;
	Tue, 11 Mar 2025 09:33:18 +0000
Received: by mail-ua1-x930.google.com with SMTP id a1e0cc1a2514c-86d6ac4d5a9so806165241.1;
        Tue, 11 Mar 2025 02:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741685596; x=1742290396; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oci9eEq+toTA4eT0HbbNQG595NfpjyU1+E2PAns3Nzg=;
        b=RV8uA3rxpXLcrruszI/VkNnFxZXiYf4CcnK9NCefATq+c3cSOQ2ZlyUdN6ALVirzX4
         8/8ONqL4qep/uWGlHFYnuOW6r9o8bv2ZnC2Lt9CkyvU9k3h3y+KGhWCCR75wRXqGWMH5
         TdRXo+n97MQmgYsh2+Md/5ExhT9b1pEkjgTc0S07VcDqbcysvrTBxKZHSVB6Xbpvp7Kd
         Z4YFUfvvGJY8/DKkV53SUkvXnkhpAeG83NuVTzBbtSMcLl1iZEmj5sJHz3zEQEyaCv27
         evz9I441C3fdWju71eEeiUPbvpsrUK+mu8WF9/RjkI65Dgc+c/a1hH3PhlbsrAK6CwbV
         Axhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685596; x=1742290396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oci9eEq+toTA4eT0HbbNQG595NfpjyU1+E2PAns3Nzg=;
        b=S56Ijopr02AHIeptSIHXsmUfq7sKKw7Sv6AnwZP2irhg3xOgnGHjDxedfgqGMys//f
         itZsJUjvaFrFV6phd0LIvMLyqUeCJcM8Iqp4Vxiia+3nBFj6ivnkBxU5nJKHe/2kHdAR
         2/iBPt/DfbtbA/id5f3qbqkqJ5Gxg2y5I2FCmj4iKPqqdifbUs8I9Hw/uETGz1YDRt67
         ZFoFn7wKN6K+0Ge7MAxmLg63mA0RmJulS/ZfVhENA2R23ZI8s6+2CdUHXDt3wPiS+UVD
         2EQjPT+WNEL9Uw13CFzuHj6zCzqg3JWwn9R7nKogLBR63A9DFfW4UPqd2e4iOoTNm1JY
         DD+w==
X-Forwarded-Encrypted: i=1; AJvYcCV4FYBkdGgWgbRXZSSM6PzXsJAVn5479Awc9yXTOA4lXQEk1YHBOAJ3HfllPRdgRoLaSk6/62h+CPVluxy4uMY=@lists.infradead.org, AJvYcCViZU9h83laFrgbku0cCRUOmcJXKwLT1cteDt3+HoU0CiHfHEEoUFicD5SSKC6oF4tkwZAHqiFdXrx3BTB2ZIIH@lists.infradead.org
X-Gm-Message-State: AOJu0YxCivxbJn9QkMfKNFnmzPh+sU5yBoNeBnsJYenm4OCxg3nKhv/n
	006SySyj3Ct7yGZMKS73/iUL3fWoX7QxAhj7Mlnl2nYcQ+m9Lu+9nkkoxs839IfwTcJVzALdGZn
	Y7PxxEURlpCQgRjBx34v9BOPDdBI=
X-Gm-Gg: ASbGncvt7yopzG6NYS3qFxgxnSfX6+6y5vHtvlyvP7iVc3LXOYcJNjo0h+o5mnudnC0
	Z0zsuEud3xkDF5lgfw57CN+wvWQR3QSqOwtdAlo35gOXPKc+pfnQyhYtCrgacvEs+/2x2K9/TC6
	5hlHf5TtPpO36dCiHgw1fP5Gdlt+JZoaRDFbDM
X-Google-Smtp-Source: AGHT+IFjbF2BT/V8wuSBTDQZbf6t/hT/Znk/xR8O11b3YilMHbEGP/m6CvuSuPbsGl833OZDuyeAqkTBH4Ybr+MgCeE=
X-Received: by 2002:a05:6102:509f:b0:4c1:9e65:f904 with SMTP id
 ada2fe7eead31-4c30a718b91mr8809313137.23.1741685595784; Tue, 11 Mar 2025
 02:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <CAKEwX=NfKrisQL-DBcNxBwK2ErK-u=MSzHNpETcuWWNBh9s9Bg@mail.gmail.com>
 <CAGsJ_4ysL1xV=902oNM3vBfianF6F_iqDgyck6DGzFrZCtOprw@mail.gmail.com> <dubgo2s3xafoitc2olyjqmkmroiowxbpbswefhdioaeupxoqs2@z3s4uuvojvyu>
In-Reply-To: <dubgo2s3xafoitc2olyjqmkmroiowxbpbswefhdioaeupxoqs2@z3s4uuvojvyu>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 11 Mar 2025 22:33:04 +1300
X-Gm-Features: AQ5f1JpaKY-TJruiEfKLncijqOvg19zgNrZm_fVI7uamNPGD1sBBaPT6nlX2PNg
Message-ID: <CAGsJ_4wbgEGKDdUqa8Kpw952qiM_H5V-3X+BH6SboJMh8k2sRg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Nhat Pham <nphamcs@gmail.com>, 
	Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250311_023317_365182_BD93AE83 
X-CRM114-Status: GOOD (  31.29  )
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

On Tue, Mar 11, 2025 at 5:58=E2=80=AFPM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (25/03/08 18:41), Barry Song wrote:
> > On Sat, Mar 8, 2025 at 12:03=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
> > >
> > > On Fri, Mar 7, 2025 at 4:02=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@media=
tek.com> wrote:
> > > >
> > > > This patch series introduces a new mechanism called kcompressd to
> > > > improve the efficiency of memory reclaiming in the operating system=
. The
> > > > main goal is to separate the tasks of page scanning and page compre=
ssion
> > > > into distinct processes or threads, thereby reducing the load on th=
e
> > > > kswapd thread and enhancing overall system performance under high m=
emory
> > > > pressure conditions.
> > >
> > > Please excuse my ignorance, but from your cover letter I still don't
> > > quite get what is the problem here? And how would decouple compressio=
n
> > > and scanning help?
> >
> > My understanding is as follows:
> >
> > When kswapd attempts to reclaim M anonymous folios and N file folios,
> > the process involves the following steps:
> >
> > * t1: Time to scan and unmap anonymous folios
> > * t2: Time to compress anonymous folios
> > * t3: Time to reclaim file folios
> >
> > Currently, these steps are executed sequentially, meaning the total tim=
e
> > required to reclaim M + N folios is t1 + t2 + t3.
> >
> > However, Qun-Wei's patch enables t1 + t3 and t2 to run in parallel,
> > reducing the total time to max(t1 + t3, t2). This likely improves the
> > reclamation speed, potentially reducing allocation stalls.
>
> If compression kthread-s can run (have CPUs to be scheduled on).
> This looks a bit like a bottleneck.  Is there anything that
> guarantees forward progress?  Also, if compression kthreads
> constantly preempt kswapd, then it might not be worth it to
> have compression kthreads, I assume?

Thanks for your critical insights, all of which are valuable.

Qun-Wei is likely working on an Android case where the CPU is
relatively idle in many scenarios (though there are certainly cases
where all CPUs are busy), but free memory is quite limited.
We may soon see benefits for these types of use cases. I expect
Android might have the opportunity to adopt it before it's fully
ready upstream.

If the workload keeps all CPUs busy, I suppose this async thread
won=E2=80=99t help, but at least we might find a way to mitigate regression=
.

We likely need to collect more data on various scenarios=E2=80=94when
CPUs are relatively idle and when all CPUs are busy=E2=80=94and
determine the proper approach based on the data, which we
currently lack :-)

>
> If we have a pagefault and need to map a page that is still in
> the compression queue (not compressed and stored in zram yet, e.g.
> dut to scheduling latency + slow compression algorithm) then what
> happens?

This is happening now even without the patch?  Right now we are
having 4 steps:
1. add_to_swap: The folio is added to the swapcache.
2. try_to_unmap: PTEs are converted to swap entries.
3. pageout: The folio is written back.
4. Swapcache is cleared.

If a swap-in occurs between 2 and 4, doesn't that mean
we've already encountered the case where we hit
the swapcache for a folio undergoing compression?

It seems we might have an opportunity to terminate
compression if the request is still in the queue and
compression hasn=E2=80=99t started for a folio yet? seems
quite difficult to do?

Thanks
Barry

