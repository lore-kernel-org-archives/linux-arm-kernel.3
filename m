Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A7FC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 05:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsL06UvFaIQXEiahdE6DhBRWjwB8pb861e5j/ftXC1c=; b=rcGwu/8zijZ4Rm7FGrXsz3o21M
	NuAMBKvf36zLR1Ob32NGRD2K7SPXK3mg1y6ZPUnTztOiisRYdgkLw+8k5UQae7r6os6JGo1YLb2c2
	rR1JR6O+M1wW4to4UfgynhE5bx4w9RqWjEpWapdHMs5SNyDDfxjDBz3Ik1BT7doeEnGMDOyoFyoRa
	S5pa1jbPEBBQ4+cbViYmt5x+ElFR2LBQ/yJx2kg94j08NrkVTBkVz9F9uX4xg0W/rZDcKWcOjQToc
	cnIw0Di5pBz85b82XVDGuimiJ90JzJUj3CRJF7730cbRBQSC4nIgsYc+Jkj/VkdzSvsETfwHp8cTa
	xF1gYVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trrn9-00000004crX-1PSb;
	Tue, 11 Mar 2025 05:04:35 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trrlT-00000004cc0-2L7b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 05:02:54 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-224019ad9edso113650215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 22:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741669371; x=1742274171; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YsL06UvFaIQXEiahdE6DhBRWjwB8pb861e5j/ftXC1c=;
        b=S8J1D8P3jVPGe+JMNkOS5NrHK/AK1sUFvNlO3lqUG7hIj/oyqyqsD45ZinC3mCRQOL
         Y2dDvTqGvkiPrs4pCmkC8p4w25nJJMOxsKFvUrIYfX+e8kxTirCogMQ09JUQBrHW5Iy9
         OmnQmJfzLehaTtel1Y0k2h27c1MU0NoIrMtXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741669371; x=1742274171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsL06UvFaIQXEiahdE6DhBRWjwB8pb861e5j/ftXC1c=;
        b=O5WzFtIhmaw5ALYY4wO6SLzp87cgXGUxUS6xM4DBzS9Y17RLcSEwtOW5DwiVkHS8ds
         EHgPSi9kjh4jPDSZH23GFY02mrLoJ23HRpWSGjjCle0dCpwtK6+g0zgspRQm+BwJLr/a
         wzngD3RG4cbD8OuLB+CUXjSUm0InitQ5/MHqN2ZbZsOMUzkkdLYE8H0hjHK3Pef1Jg4D
         Y8yk3tC/s87RWy1RcQxjQJ2rdHm3NY5zrutg6nam4D0PGLFBhBPVKj8belTMgoCXg69z
         FgBawIab5Icc8eQOJs81USRylTkTU9YYnTiesu/BSYd2Y/XWrTbpZ14ZbPHsW87K6u4r
         vdDA==
X-Forwarded-Encrypted: i=1; AJvYcCV2hMVwepL/d5QxJpy6SKzdwF1abl75WhNITci5NPe75dJmH7qAqyuow5hkML7TikLFp8oT5+0/fJ1MQRWWGtLg@lists.infradead.org
X-Gm-Message-State: AOJu0YysPeNDLsAxyldbxFxOUot+SNP6W7m9htTN9RejqXWImuaJe1d9
	kq45mgavai5evETY4cwTIza+/AGmsYxi3U0SasebP828Nh4VYE0xfolSEKke3g==
X-Gm-Gg: ASbGncuMq2uBN7h7z/N9PASe6P202bLSYtQeyxzNU7No9pp4DHOdhdZcfHjGdSHp+0v
	5oC3ScPEAl7LkdFjxOnfTw6V+9GlaZVr5dt2FbUa8RmQB9z9czHXlB1tRWLfflERfUx6FXaq/6X
	5cXAIkOjRnVRD9FoOvp6H40ullcFSXchK+QmD0p85xApMoeEjLfFEqwOhLSKZX73mx0vxN0Pf3K
	TIAUiDYVH+j+7Vr7Wu2DMl0WcmuA/n3W7DhGmahGzOjm94ctuQxMs8iiYdIBDnEGdC4GbCT0c84
	pLGKqVJ1gpljOBC2x3GcvwitcK+vS2SpC3Qa0SBbfE1Wjppt
X-Google-Smtp-Source: AGHT+IFKfiFQm8ms/qPRi+wcBaiWNYQfbAZZRcHY4n0zNhnBnJ9IpLaSuc9kTChF2fwrDmR2pqJfNQ==
X-Received: by 2002:a17:903:40cb:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22428ab7691mr283789275ad.41.1741669370601;
        Mon, 10 Mar 2025 22:02:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cce8:82e2:587d:db6a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddca2sm87480825ad.13.2025.03.10.22.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 22:02:50 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:02:42 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Nhat Pham <nphamcs@gmail.com>
Cc: Barry Song <21cnbao@gmail.com>, Qun-Wei Lin <qun-wei.lin@mediatek.com>, 
	Jens Axboe <axboe@kernel.dk>, Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, "Huang, Ying" <ying.huang@intel.com>, 
	Kairui Song <kasong@tencent.com>, Dan Schatzberg <schatzberg.dan@gmail.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>
Subject: Re: [PATCH 2/2] kcompressd: Add Kcompressd for accelerated zram
 compression
Message-ID: <mzythwqmi22gmuunmqcyyn7eiggevvrzkpqmjkoxsj4q4jc46s@64jdco5s6spa>
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <20250307120141.1566673-3-qun-wei.lin@mediatek.com>
 <CAGsJ_4xtp9iGPQinu5DOi3R2B47X9o=wS94GdhdY-0JUATf5hw@mail.gmail.com>
 <CAKEwX=OP9PJ9YeUvy3ZMQPByH7ELHLDfeLuuYKvPy3aCQCAJwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKEwX=OP9PJ9YeUvy3ZMQPByH7ELHLDfeLuuYKvPy3aCQCAJwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_220251_593479_E791723C 
X-CRM114-Status: GOOD (  21.19  )
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

On (25/03/07 15:13), Nhat Pham wrote:
> > > +config KCOMPRESSD
> > > +       tristate "Kcompressd: Accelerated zram compression"
> > > +       depends on ZRAM
> > > +       help
> > > +         Kcompressd creates multiple daemons to accelerate the compression of pages
> > > +         in zram, offloading this time-consuming task from the zram driver.
> > > +
> > > +         This approach improves system efficiency by handling page compression separately,
> > > +         which was originally done by kswapd or direct reclaim.
> >
> > For direct reclaim, we were previously able to compress using multiple CPUs
> > with multi-threading.
> > After your patch, it seems that only a single thread/CPU is used for compression
> > so it won't necessarily improve direct reclaim performance?
> >
> > Even for kswapd, we used to have multiple threads like [kswapd0], [kswapd1],
> > and [kswapd2] for different nodes. Now, are we also limited to just one thread?
> > I also wonder if this could be handled at the vmscan level instead of the zram
> > level. then it might potentially help other sync devices or even zswap later.
> 
> Agree. A shared solution would be much appreciated. We can keep the
> kcompressd idea, but have it accept IO work from multiple sources
> (zram, zswap, whatever) through a shared API.

I guess it also need to take swapoff into consideration (especially
if it takes I/O from multiple sources)?

