Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD9DCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 23:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=; b=NzkCc3qRNTOlL0B65bZpLffAUQ
	zwfA5U2YfNyDZL/GlZQwQpYTVZF8ua3UOfMAyPuGD/MiVzEmW3XfV+uKrrHVd/Fn6nEOvP0hILNf2
	SGeORCeukmUzaU0BNC6O39B8VTW5VxzmlS8bBfy8x03sz64S7bawlav4Y1HK0SqL1e02eaOzaMGWp
	EIuMlylrkZ40kEyLNXQRJOqB0/UREWH0ipr13thQHkBNRbW0VLqfwFycpyu7UyF7IO9RSAiMdKfUX
	fRlwYOEdsE4Kan6prHUZOFLr4ARWEQ9ycjDJJeCzknhUOZh3gTt2IRAamCs9MYCrNKQeCM0HXwV+i
	9BFqOLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb5R3-00000003dcO-3Iat;
	Sat, 20 Jun 2026 23:49:13 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb5R1-00000003dbi-2bUL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 23:49:12 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-519ed52bcc6so339701cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 16:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781999349; cv=none;
        d=google.com; s=arc-20260327;
        b=bI2Yg3QZKrM9UCMlUVTd6LxW4UnSzIV213/Hm3/y+6vU5/SICmQ0ViQ/RfxUa7KPBn
         YdZDeOhqZQ2lY2t6iHWfvJ7tD80JxoR4MXml74tHLzwjmx0VvLKe8OkUktzQvu/bgG6m
         OMjr8s2aSAH5as62Gp28hdHKDp1w/L8c/seCyt7Cxl3phbO8onFfhZe3e2n4kWq88Xk3
         ZBOjjwawYEoC42wInWekDdN1y9KFl5fjmwa81T3KhHqW+gTsvmEdeW5ntz3sEdPXYa+M
         lI9OsjXL4T58/uYwMQxjCC8IUrRCm7mg/ymNrx+pSLgIjeTK+MjocSJ5frEedqKogY32
         DFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        fh=uBfgXLmk/88heXxZgxLqwgkmFUvnlVPkRtQbq6pDsEo=;
        b=fnXwgiKzGiowY5i30GM57YXVBErQiu6ArQJm5NGmqLT3m1hW7OMp9onucpcn34Ug0V
         BZ65KqdsIKxKbGZCC7UKfTFdlynl8C5ekHQV6CkW64dvLNepuvJ3KZqXD1KXQAssn8mo
         EsDI52tcEGvoLVooGibTa1N+D0zcGsZDf4x3F9PP5Vi1Jd7vI+nqZ0XkhDTG0rQegibt
         Uwx8MZMlajxB+gekmkVrIUYO3Ec9DYGeuE8ugnxN8Zm388w4yOra9Su2rz4R9taUU6IB
         X3foks11OfAtZWn1yJPsDFeyqihuUJaHqAqYtWgps94Io5u33kej7o1KO4dp5Kiz6m2K
         ffTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781999349; x=1782604149; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        b=Fe4pOa8bc2NXC+p3ak8QibgTjeiaOSXqIXt7XuZIVcFtlQwErXnhKgP3O4V53OSHtx
         EebT3b6h1sS/AAM/weXKOjzvIRgnkV3GteIb8gPkgjbA59NoRf0t3pDWIwALIxe0tf0X
         W4OxU+SXcFzl8jSyJYz77XnZqwU5hRPkJ7RTrPD5JtOt34lwMeSzq06vncwgtJZ8jgz4
         cZNT1DyRouP1HlTXHB/gbf/hp5q4WgIk3Ap6OTJllMN4xpiLzbWi8vsijwWR8JKPPMlk
         YJJ7Jwm3AABOSoHdL7qxtQlZh0LjBB4moe9Bqw65yU5HypHr6x1X3tU2ONvdK31EhP7E
         dHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781999349; x=1782604149;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVrIryE2VF1sDSS46HMWn0Px6aDg+06V1VeyZcyjwRw=;
        b=MpX81NR3JQX8maSCtRe/fuin4VlnU91kZ/L1lTnr2+54rDYHdvkA+C1mFrPmGEeBCa
         QC0RH+gGRWyqoCzu2879E8es+FzUtsU3Ks3DVUdDgf084xR2U503EtPzky0DWMuNeECz
         gN6gpGfQYBjiD0blez1H+FsWFgodfL/MyqEgfajYtXvsq9UxFs6cJxk5OaqjjIzZUB3O
         QMUG8kWoFPP0d0rqARaNhL8CL5ob6QZBXmMA5Hc/xeIIWACkd+hKzE5x493+3uYKWNzc
         vNeIndJ1i43WVyCkOQN2k22CNKufKQj+jpUhExsN+kbCvIAd5Ht4DmD6+gyaxinvn3oQ
         ySWg==
X-Forwarded-Encrypted: i=1; AFNElJ84+t0pD+sdke6EhmPTQjcZyLn1EAtneRPjCAKCmXf9Gyc1F/E3t0zdQ4tRu0EFHs9+ttDluErZ4/LVIUcQbcvl@lists.infradead.org
X-Gm-Message-State: AOJu0YwoA/sP5rXCM9qFfHoD16mt8tAecdAQwtOpTwHhvzTrTbVNlGKt
	9C/Jz71MyjjZg9GU7kOmp80Cxu2+8jtd8JzK20oC1rYuwSXalGyUZQtbH0//8k4h4R2Su1KCgKZ
	fshnOkLpW85jEqGDcELWkrZzrSO4SO2z0h1H4Mr/V
X-Gm-Gg: AfdE7ckyinDeEiiyc1KiaY06n9FSNGaMOph05lwheGOnSOAAxKCDNn2OYC/eH0iDMMb
	vnuTNZM6zqkOgzZU5z6XIyli3njUOhBh6XVnxH/oUA9680uf3RGq1vVVxdraV36LluBWVZPFODB
	ChjkOpTszaDkFCCK8P/X4h9f/B4JO5AXfhGkfTnOwIwSNL1BCJJ1wFGXBLqhUGLU0HA8t/qLwr/
	GRK5KcGBaL6Uh7XAKIcc01K7Zn/JU93bZC7GHOYwzRnnd/m6PrN/t1CF0V+SJ6AAcPvblQaBtkU
	ejm5yA==
X-Received: by 2002:a05:622a:580a:b0:516:4f62:85f1 with SMTP id
 d75a77b69052e-519e4a744d4mr15890001cf.22.1781999348457; Sat, 20 Jun 2026
 16:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org> <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org> <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
 <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com>
 <ahB6QyHgYq8ksj65@lucifer> <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
In-Reply-To: <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 20 Jun 2026 16:48:57 -0700
X-Gm-Features: AVVi8CdrqLszoGfh6nxxBjM6ZU4jlgAaXlfN0swetCJNc_4l9-uU6mX0T8CUJHo
Message-ID: <CAJuCfpHTxaU4KdNmefU7C7cWZSLCFDLPdUrnqV6yzxzN+8RQ0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_164911_705550_E1C35826 
X-CRM114-Status: GOOD (  26.65  )
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

On Fri, May 22, 2026 at 2:31=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> >
> > Again this is making me want to sit outside and sip on some lemonade an=
d
> > ice :)
> >
> > Yes - android processes are aggressively multi-threaded, sure of course=
.
> >
> > The missing bit here is the forking - what, where, why, when?
> >
>
> I really want to know the what, where, why, and when
> as well. But since most applications are not
> open-source, it is basically a black hole for anyone
> other than the owners of those apps.
>
> Let me try to do more investigation to understand what
> is going on, although it is really hard.
> To be honest, I would rather the Android framework
> completely prohibit apps from calling fork(), if
> possible.
>
> > And then you say zygote is sometimes multi-threaded but sometimes
> > single-threaded, which is adding a whole bunch of confusion on top of a=
ll
> > that.
> >
> > I don't find these stack trace dumps all that useful (though thanks of
> > course for taking the time to gather them), I think we'd be better off =
with
> > specific data on forking, in some _concise_ _summarised_ form, ideally =
with
> > numbers.
> >
> > There's such a thing as too much information :))
>
> This trace shows PF I/O in one thread overlapping
> with a fork() call in another thread.
> But as I explained, I really do not know what kind of
> user behavior is behind it.
>
> >
> > Anyway, again, please let's see a new _RFC_ with the approach proposed =
by
> > Suren, with some _succinct_ data demonstrating _exactly_ what the probl=
em
> > is, so we can make some headway here.
>
> Okay, sure. Thanks for your patience.

Just checking in on the followup plans. IIUC the RFC mentioned will
try to implement the solution we discussed at LSFMM: splitting
VM_FAULT_RETRY into two flags - one for retrying under per-VMA locks
and another one to fallback to mmap_lock.

Barry, if you need any help or clarification, please do not hesitate
to contact me.
Thanks,
Suren.

>
> >
> > And now I'm off for a cornetto! :)
>
> Sounds good :) Enjoy your cornetto!
>
> Best Regards
> Barry

