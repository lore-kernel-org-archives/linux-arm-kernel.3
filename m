Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17474C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 05:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJmfZfA0tNqTdg8bAfZWDeUCZMhc8ZXDtBpkPMyhAvk=; b=pK5r+/mBxWNWnfSNaVCoOiF9ub
	5QfgYGMckLQZSQclFa4RlK5eZa2LVl9fWMPCSLoOe+yoJqrIUNblKe4xEaf3kI3nhDiitBizWiBaG
	JOkfljH5wIzCPe9QFpNgRboOjCXT/c46d6Uoys0eIjthCnbgCvKuZOQTjURQaB+OnELqgqeaKwWBQ
	UpsEhDu+5WHubaWa4ZFtf370iG/DeZpAK0iNfnBKc4HHQHBKYDruNlVrqBM8nCpEYSpYJaBpsuWlh
	FurrHJe9fbUj0yYSlnhZXQxI+StjOzWkFHLy+80VwKXqraQpdp30wBG3zruRwa5TB25tu6psLNiov
	N7PR0+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqmy6-0000000GEZT-3wjz;
	Sat, 08 Mar 2025 05:43:26 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqmwU-0000000GERq-0n2Z;
	Sat, 08 Mar 2025 05:41:47 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-86b9d1f7249so1973263241.2;
        Fri, 07 Mar 2025 21:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741412504; x=1742017304; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJmfZfA0tNqTdg8bAfZWDeUCZMhc8ZXDtBpkPMyhAvk=;
        b=gYJRFfL40QRWKK4p9qPT/tjl/HPl/ak9wPnCi5SfcfGWtbjsNKFift2paHkXB5mkq1
         MARQWUzvJ9UTOvVbnqQcF5J01FPESHCLBst3KuOvN5FyFo2ze6MCkIEhWft5YvJOMpXs
         AqEtdi7qCqYRl/ptCyK8cw1WkUniUEVna+BGSOqqzQ84fD8IwlyhE9UQNTm4gVMREsA5
         T7GvPyZFHk5bzuoi5ZFuJ1uCMtj1HwcuIpuxWgMIPP6d4h9E5mMjRvfZEwsOOZTVKRp+
         5Um/OF/ALyAHf1Owv0n38PTOCxV5iT+fROy8pq8/3EawlLMFnsygzQsfvNwrnRl+jKjT
         /zBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741412504; x=1742017304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJmfZfA0tNqTdg8bAfZWDeUCZMhc8ZXDtBpkPMyhAvk=;
        b=Pqurlwz9X2jqmfJgG265xU6eD/TKjuwf8ypwcStQZn8wq1c93iGphDIe18tt55PWon
         UW+jVS4Lq+egqfJTm8jISKldgaNfKsIwLGx4awkdTVEf5TRODXcGzf7iKTNTRDZ3aLf6
         LMjemOojrXgtQ9HlkteZ/l2tF44vm2MsxZmoavsHiEl4LgEfiWFjo/x2SHPcbRirI3ja
         vHdk+unDfgdy6NnEhrkeV7EGbD/o48En0xGLicz8PnCpIzgz/sA2KnvIEz3EDnTX7B2p
         2SmCttjFp3O08X6JxAmaInQz9nRcHfZ/5lbkCmxAMfgW1lEcOjFLJYDScTWvgtIaQUWp
         HRCw==
X-Forwarded-Encrypted: i=1; AJvYcCVRcuT5vSuxZ80YGDSgSLHSOx6MKAn4Y+qi79OgaNQWGVfoyX+2GwYmChpLM5xJuOvjShsqL/7MiDzyfh/4kosg@lists.infradead.org, AJvYcCXwLgkaS8asai6gxSEwlwA3sJ3aEsoCg5GEvSR3ao58iilpvWgrzODKaDnXRiRLLFKPB2r6zDU2fpkq00rt1so=@lists.infradead.org
X-Gm-Message-State: AOJu0YzEPFygQDsH0zqGP9cM21i8XYoUfDaQZhkylY7qSBgfQGoq0pbz
	oJTEox6uMdgOg8hMr8Q/HipsvjFH0mD1/PBtkHjjcZovBSiHG5INWLTqy34jaVWbb/N7cPcqqQK
	iYBKoPL4QvpnHWUVEIRZJ7yakTD8=
X-Gm-Gg: ASbGncvs5kcB4FEUwckNYi5hWp7FmJOG8kgDlRSBoMv6oQ6GfmLz0VE4go1JH+Bf898
	E0TiacbIdcOZp18x5zaBmyGdGNKk3+0ahru6rwUAr64DLA5Jk05c3UDgKF0Iwn0M6dkgMDlzVE8
	X5sF/Wr7S0pQcpAWUWuCE6oCHUNkc7a/sdc1VF
X-Google-Smtp-Source: AGHT+IHHggIPKrL5d8yR6LTugXbBrgtYx9QYjOVM0FXkszko5m8Bp+SYzJZbZ7yqbzdNsHG/XrgFTdExUecoVmk9yWY=
X-Received: by 2002:a05:6102:809c:b0:4bb:9b46:3f6f with SMTP id
 ada2fe7eead31-4c30a538979mr4607096137.1.1741412504595; Fri, 07 Mar 2025
 21:41:44 -0800 (PST)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com> <CAKEwX=NfKrisQL-DBcNxBwK2ErK-u=MSzHNpETcuWWNBh9s9Bg@mail.gmail.com>
In-Reply-To: <CAKEwX=NfKrisQL-DBcNxBwK2ErK-u=MSzHNpETcuWWNBh9s9Bg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Sat, 8 Mar 2025 18:41:33 +1300
X-Gm-Features: AQ5f1JoraQfrjgklIeJVnsPlZLYjnVJdWtNTlR00z_Bw9q9Ie66lMyjY9JB8lAo
Message-ID: <CAGsJ_4ysL1xV=902oNM3vBfianF6F_iqDgyck6DGzFrZCtOprw@mail.gmail.com>
Subject: Re: [PATCH 0/2] Improve Zram by separating compression context from kswapd
To: Nhat Pham <nphamcs@gmail.com>
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
X-CRM114-CacheID: sfid-20250307_214146_226829_582830FC 
X-CRM114-Status: GOOD (  23.84  )
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

On Sat, Mar 8, 2025 at 12:03=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Fri, Mar 7, 2025 at 4:02=E2=80=AFAM Qun-Wei Lin <qun-wei.lin@mediatek.=
com> wrote:
> >
> > This patch series introduces a new mechanism called kcompressd to
> > improve the efficiency of memory reclaiming in the operating system. Th=
e
> > main goal is to separate the tasks of page scanning and page compressio=
n
> > into distinct processes or threads, thereby reducing the load on the
> > kswapd thread and enhancing overall system performance under high memor=
y
> > pressure conditions.
>
> Please excuse my ignorance, but from your cover letter I still don't
> quite get what is the problem here? And how would decouple compression
> and scanning help?

My understanding is as follows:

When kswapd attempts to reclaim M anonymous folios and N file folios,
the process involves the following steps:

* t1: Time to scan and unmap anonymous folios
* t2: Time to compress anonymous folios
* t3: Time to reclaim file folios

Currently, these steps are executed sequentially, meaning the total time
required to reclaim M + N folios is t1 + t2 + t3.

However, Qun-Wei's patch enables t1 + t3 and t2 to run in parallel,
reducing the total time to max(t1 + t3, t2). This likely improves the
reclamation speed, potentially reducing allocation stalls.

I don=E2=80=99t have concrete data on this. Does Qun-Wei have detailed
performance data?

>
> >
> > Problem:
> >  In the current system, the kswapd thread is responsible for both
> >  scanning the LRU pages and compressing pages into the ZRAM. This
> >  combined responsibility can lead to significant performance bottleneck=
s,
>
> What bottleneck are we talking about? Is one stage slower than the other?
>
> >  especially under high memory pressure. The kswapd thread becomes a
> >  single point of contention, causing delays in memory reclaiming and
> >  overall system performance degradation.
> >
> > Target:
> >  The target of this invention is to improve the efficiency of memory
> >  reclaiming. By separating the tasks of page scanning and page
> >  compression into distinct processes or threads, the system can handle
> >  memory pressure more effectively.
>
> I'm not a zram maintainer, so I'm definitely not trying to stop this
> patch. But whatever problem zram is facing will likely occur with
> zswap too, so I'd like to learn more :)

Right, this is likely something that could be addressed more generally
for zswap and zram.

Thanks
Barry

