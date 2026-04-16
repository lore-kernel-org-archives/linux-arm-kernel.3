Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB3BF8A146
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 10:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4x/p20rCdbt363tjV0+ABHeJuaMLyMj2lG+gRWDekg=; b=i4OQZYNRKeAV1yt0cNzKg8Dw0E
	1kgBYJuLzhDBcmWI6XkW6tkWY1SKERsAQXP5a6CpJmD3pQd5lH9/D1pvZ4jrUAVSs7GYDzD3mvfEo
	oPGMYzyQv5UmcpvtKtkA7gJMU5VTuEsX90MXP9xzW+mGTeOizQTz9UPNhMgNLZx8Hm0gSKOthzOWT
	1ZJxnuhtkbYAI+dAkQrqlM868BtOzzq6+iRZv9XAcVW5+tNW2PRb/LHTg3gHgSC2da2TquxDV1xQu
	6KHugmOFQnjTege1VKH1xLB1tDyMlSLaPCsV0sbVS3SYowgA/RDbHZx5IkQeOKaiaFDyagIVAkJwU
	7bQf7ZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJz6-00000002JJx-37eH;
	Thu, 16 Apr 2026 10:30:09 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJz4-00000002JIj-1fpS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 10:30:07 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-67251e91bc8so785212a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Apr 2026 03:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776335404; cv=none;
        d=google.com; s=arc-20240605;
        b=JRf6MoC2eROpqyTNV6KwHFY7mZuq3Ic6TaF+/WTXamT+x10ZJ3zhV+gSF2qB1FO0sr
         TMXWycM5Yuczz9PC9Wil4KbsEDgQ8VARzOESJ2NA9wBJCYe3HgW2yYD809cbBDxMUauf
         RW50RGH/+CbT9kQrQUdmpvz1WLaFMtZ0fZJhbDttF/h4SGD4/q/LR3agsEjziZkfGBDx
         ADlmfn74ryvGRJ9v+eRVFMYIkI/vEpFiXWvzwOmVzCZphQUKr6x9VfCNDWzV2c59jxx8
         xuu6235ViXOvZrk6toLI5mee3dMwpd+T9HiQXHQlUE+MZMPIRYvFehMeKno6Fj/yB3Km
         LjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O4x/p20rCdbt363tjV0+ABHeJuaMLyMj2lG+gRWDekg=;
        fh=wbmu8tPXe1s92iz1xYWMjDeaBAEpXDlOQMzfAW+RtlE=;
        b=E4rX3UfbmXpRp8CU93X2jLjag8uEVdE2IvgH7lcnOYaxDiaTWRPusl2WIDRMeX43mI
         mfpps9Oc7KU8lFWTAIt/cFf9ahxzMjXCuE14GV+asHZm4PrkV68dGEQEXqzUHoQgAQNH
         a77dtY0SdHou19z9RicWrOchJHhLlWsJ2eAkDTRTvSL8RPX1Sd6HmL7ybxioArfZ2/EB
         shoA5BoaoEbH7YZo83LyXuUX58QNhZsi9HUUY7SkYmuP0JR/3+weSHDkDKqg9xyfhEAq
         dV/BzGi/3zA1XxGYOcOQvNdRD1h+eyBDnDgMKyzpUQCGGjP2VVXuudIcZ5lZQp2afpv3
         xFyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776335404; x=1776940204; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4x/p20rCdbt363tjV0+ABHeJuaMLyMj2lG+gRWDekg=;
        b=jsX0NTxo/kixKjhgyfNDP1grCz9IOLtHGaIqnd2hscj8wnpzYprFhy9AOX5zDZ2yim
         bIGH6qFPwBTUCdAbzEi/GIyQClEoLtRODUTzu3JJRHZnB4FK+IGVqkqSe73VbrODdWuj
         /cINLuPUJT3+cAxlw3MxumLGkGDSIM4tfXlgYAsVkLX01tz7wEMsQO8tUeyVMq5F/f4D
         7ye+euvFk3di5ykyKG6zqrxggAqNmP/Sa34Cd8z7+pR2B/CJ/m8m78MdqqxgeIuJhl4k
         ZlsOYOJxTHm0F0fckg0jHO9GiUC9GS35cTkznjAVN1mzz6ilYCSOQ6G3HLKdXQDiBSGn
         /EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776335404; x=1776940204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O4x/p20rCdbt363tjV0+ABHeJuaMLyMj2lG+gRWDekg=;
        b=sKrGCgzHGUSchCtl4P6q2OoNGhm0xeqlQruPy6KNFU1qYg+IWlROXdSx6LBcGBJlq7
         Lfv6fNcOkgs7eAi0DUr78Wc6+/TVSg0I4NVkIfmvzbou6K4IzkyjBsVnvJwb7QSHVweT
         t5QCBfV1TqNPebVuNS+RfT3HulBVLlUbNbosyfnAWhZiGx98usl62RGPLwgBtPIlebbD
         K0NsbMd/LRybmo0o4lI1LzqWdrXmkyBJR9lcrYv2lpFd45+OuuvxYno9b+w37owx8cxJ
         t6zCjje7MlQpvmJ/sX86//wSKjham+Y0gc1KPN5wFH9iKfgI5nmeBuDhTSkKQiv4BRfM
         nQtw==
X-Forwarded-Encrypted: i=1; AFNElJ9ILk1wg9R/OwSd1GfAStFen5v5lFmRmNXx/3Ua9h5HpPWoG32h3oxqoXKxUidPd3Mvk1OehV+ZPS9/zollwLzL@lists.infradead.org
X-Gm-Message-State: AOJu0YyxZSWuexIeK+s8DvWQJihdbvDqYDzbf0gcWdDVr+rlNykPuvEJ
	VWccyEKeCWTmTzr07m7lRWAPJoTPYguEi3Df/S7fNrO/R3IpAcnfH1AlrXUo4SEjPBHJ7RwQgsg
	vxKLzDu+bih3bfDOJcxKHESBAAb6f+Ntbqg==
X-Gm-Gg: AeBDievD/u6lTmTh4b+S7b3hsjOQe6dDExjWo0Kmoe5LP/fKyTHcYlNpU48r+DSA8rx
	HVvYEKaA/NWSd4fIzg/S/HIGKTVx6mP6SstHQv+b+d8BcsAwnBEY4Vt6xESFhnXbNoCG2vO3LpC
	/RJrPpWObwI8FyRV4Djf4v68S6yhWpv+8p0PdCs4t2A9o1Yp1Iqg5L213PltvSoxuE33vDL9azC
	tfdtqcc13/svtA6caXv1THa9mf/UzHOaYsaQQTf4Qg1W6YF96wwliKYFHL85d1cizU0k3bzd2Wi
	VZCfd4B3xDUa7Q3J5LuEc8QN6kUpxDOwRfdka6jqBlKv/a9+hg==
X-Received: by 2002:a05:6402:1bd0:b0:66e:103b:6350 with SMTP id
 4fb4d7f45d1cf-67271085617mr945994a12.7.1776335403710; Thu, 16 Apr 2026
 03:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260413062042.804-1-huangsj@hygon.cn> <76pfiwabdgsej6q2yxfh3efuqvsyg7mt7rvl5itzzjyhdrto5r@53viaxsackzv>
 <ad4EvoDcAKE2Sl4+@hsj-2U-Workstation>
In-Reply-To: <ad4EvoDcAKE2Sl4+@hsj-2U-Workstation>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Thu, 16 Apr 2026 12:29:50 +0200
X-Gm-Features: AQROBzC-j8c2wDPnYX4NqzriRAjav7sQoMIZaVyLzvRZ8lq-CJThcPkUuW_xSxI
Message-ID: <CAGudoHGLaoc+CoBPNCvFRYojnj+6E_Lsdv7NaJWxFMoHezemMQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm: split the file's i_mmap tree for NUMA
To: Huang Shijie <huangsj@hygon.cn>
Cc: akpm@linux-foundation.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	muchun.song@linux.dev, osalvador@suse.de, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-parisc@vger.kernel.org, 
	nvdimm@lists.linux.dev, zhongyuan@hygon.cn, fangbaoshun@hygon.cn, 
	yingzhiwei@hygon.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_033006_488092_C04FA713 
X-CRM114-Status: GOOD (  48.11  )
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

On Tue, Apr 14, 2026 at 11:11=E2=80=AFAM Huang Shijie <huangsj@hygon.cn> wr=
ote:
>
> On Mon, Apr 13, 2026 at 05:33:21PM +0200, Mateusz Guzik wrote:
> > On Mon, Apr 13, 2026 at 02:20:39PM +0800, Huang Shijie wrote:
> > >   In NUMA, there are maybe many NUMA nodes and many CPUs.
> > > For example, a Hygon's server has 12 NUMA nodes, and 384 CPUs.
> > > In the UnixBench tests, there is a test "execl" which tests
> > > the execve system call.
> > >
> > >   When we test our server with "./Run -c 384 execl",
> > > the test result is not good enough. The i_mmap locks contended heavil=
y on
> > > "libc.so" and "ld.so". For example, the i_mmap tree for "libc.so" can=
 have
> > > over 6000 VMAs, all the VMAs can be in different NUMA mode.
> > > The insert/remove operations do not run quickly enough.
> > >
> > > patch 1 & patch 2 are try to hide the direct access of i_mmap.
> > > patch 3 splits the i_mmap into sibling trees, and we can get better
> > > performance with this patch set:
> > >     we can get 77% performance improvement(10 times average)
> > >
> >
> > To my reading you kept the lock as-is and only distributed the protecte=
d
> > state.
> >
> > While I don't doubt the improvement, I'm confident should you take a
> > look at the profile you are going to find this still does not scale wit=
h
> > rwsem being one of the problems (there are other global locks, some of
> > which have experimental patches for).
> IMHO, when the number of VMAs in the i_mmap is very large, only optimise =
the rwsem
> lock does not help too much for our NUMA case.
>
> In our NUMA server, the remote access could be the major issue.
>

I'm confused how this is not supposed to help. You moved your data to
be stored per-domain. With my proposal the lock itself will also get
that treatment.

Modulo the issue of what to do with code wanting to iterate the entire
thing, this is blatantly faster.

>
> >
> > Apart from that this does nothing to help high core systems which are
> > all one node, which imo puts another question mark on this specific
> > proposal.
> Yes, this patch set only focus on the NUMA case.
> The one-node case should use the original i_mmap.
>
> Maybe I can add a new config, CONFIG_SPILT_I_MMAP. The config is disabled
> by default, and enabled when the NUMA node is not one.
>
> >
> > Of course one may question whether a RB tree is the right choice here,
> > it may be the lock-protected cost can go way down with merely a better
> > data structure.
> >
> > Regardless of that, for actual scalability, there will be no way around
> > decentralazing locking around this and partitioning per some core count
> > (not just by numa awareness).
> >
> > Decentralizing locking is definitely possible, but I have not looked
> > into specifics of how problematic it is. Best case scenario it will
> > merely with separate locks. Worst case scenario something needs a fully
> > stabilized state for traversal, in that case another rw lock can be
> Yes.
>
> The traversal may need to hold many locks.
>

The very paragraph you partially quoted answers what to do in that
case: wrap everything with a new rwsem taken for reading when
adding/removing entries and taken for writing when iterating the
entire thing. Then the iteration sticks to one lock.

The new rw lock puts an upper ceiling on scalability of the thing, but
it is way higher than the current state.

Given the extra overhead associated with it one could consider
sticking to one centralized state by default and switching to
distributed state if there is enough contention.

> > slapped around this, creating locking order read lock -> per-subset
> > write lock -- this will suffer scalability due to the read locking, but
> > it will still scale drastically better as apart from that there will be
> > no serialization. In this setting the problematic consumer will write
> > lock the new thing to stabilize the state.
> >
> > So my non-maintainer opinion is that the patchset is not worth it as it
> > fails to address anything for significantly more common and already
> > affected setups.
> This patch set is to reduce the remote access latency for insert/remove V=
MA
> in NUMA.
>

And I am saying the mmap semaphore is a significant problem already on
high-core no-numa setups. Addressing scalability in that case would
sort out the problem in your setup and to a significantly higher
extent.

> >
> > Have you looked into splitting the lock?
> >
> I ever tried.
>
> But there are two disadvantages:
>   1.) The traversal may need to hold many locks which makes the
>       code very horrible.
>

I already above this is avoidable.

>   2.) Even we split the locks. Each lock protects a tree, when the tree b=
ecomes
>       big enough, the VMA insert/remove will also become slow in NUMA.
>       The reason is that the tree has VMAs in different NUMA nodes.
>

This is orthogonal to my proposal. In fact, if one is to pretend this
is never a factor with your patch, I would like to point out it will
remain not a factor if the per-numa struct gets its own lock.

