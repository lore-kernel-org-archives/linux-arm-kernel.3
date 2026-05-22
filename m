Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5147CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAdkVdHYlcySFUBOB9d60INI0VTqn7iPCNrUckiEfSA=; b=PZjFhRGq8iPqDzjQRUdI1qcpRZ
	wIbtaxxUU6hDAwlG2NPVOKTmNutDeJ68oreExhkqQ/1+PMXGoLmh2FFozzeAUQHVXK5PQRTnr3ZxG
	C6M3D67FL1cSkfgzHLPtpc/bCQYor6FKpWKwso3Co+T+bCaf557jx1kI7y5yYrYFlYXgACU+CRVGT
	BgHOZtv50k6mjO13SW9UOGnOVqhhswKEfpkYxJFx6eRVVd4+ubwmKNRBKUe6ZyKE/pS/ohRhIObG7
	p4aiS8x7JTKRc2NJ0m/YsL2WIuR7ZczJePcgi9vpsW2j/4jUKiQKD8BXwny61zp5M9UpbVeesfdkB
	L/kRXMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQF8-0000000B2rU-3nrJ;
	Fri, 22 May 2026 13:48:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQF7-0000000B2qw-0hcr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:48:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C31460217
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CADD21F0155F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779457727;
	bh=XAdkVdHYlcySFUBOB9d60INI0VTqn7iPCNrUckiEfSA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fssRPY20Dyxz/cYAZdo1qxjF95zNf6DPwfqO4+J6MWEGH93cmB3q0+MsnYtIf4mOu
	 yb2F/LO4bgXDVVZtWJM+4ct2qMqAk527UXL9PHuTUlPYGw8oHZlNwVpv2sEzAnkcrW
	 rYoPk72XF8cMrkAdvU+bjT79H8QBrkkrFnU3POv8SQ9y83JqXAiA2qGn+LwaCE7CbH
	 mydY4KMHGknk/wbzPm/k4VXT2aMv/tt5hKvMmQYuGoY0PrpI9XAnuVQcyxvRoLuNWj
	 8uaBe6X3EksWrohYip6eKCS7TiRDlXSyUEYD1+I0+oxJ/3PXuXltrCZPf7+nmrAZEo
	 4IW9Ggc3VmhZA==
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6312a0d556cso3383599137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:48:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9IY8N1F9+M6jmoMCO5hXh/+hW/+0Dp7UD+ZIWXt2UjiwXTkzkqZVevSJPEJ72+pVQqFT3wg0B/6EgQFOFOafaw@lists.infradead.org
X-Gm-Message-State: AOJu0YzAV3yTNMmv8tUKmJEX4LLTOlQw8HyjpV571z2ZfaF68aNWeR7m
	rDpdoidYAeoEkSU3cxjFLR5Nt1gzXqK5He5dC/d687T7PHAq7eW+iof26rp8LUMQgIVJxNFTkCf
	c3qS5dD27fXKe9ENIJSPp2oFLcHTO11U=
X-Received: by 2002:a05:6102:3f8e:b0:607:97b7:c283 with SMTP id
 ada2fe7eead31-67c7fff0701mr1602325137.14.1779457727053; Fri, 22 May 2026
 06:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <ag4kj84EcKqamdB-@casper.infradead.org> <20260522023305.98223-1-baohua@kernel.org>
 <ahBVh4NM2uoyhPNm@casper.infradead.org> <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4zQuJx1reJxgV387Gh0AqWF0KdoFn9KahQ1BNLPRm57TQ@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 22 May 2026 21:48:35 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zrm3sCp8Uz0Gh+sAwRcdtNF8rDLqX250sFVG3rZy9HNw@mail.gmail.com>
X-Gm-Features: AVHnY4Kzckk2STAPsRlCTXxCXlI9-5Kzu1EhehIrviADTgZ0pSseIwikwC-HrOY
Message-ID: <CAGsJ_4zrm3sCp8Uz0Gh+sAwRcdtNF8rDLqX250sFVG3rZy9HNw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: akpm@linux-foundation.org, bhe@redhat.com, chentao@kylinos.cn, 
	chrisl@kernel.org, david@kernel.org, jack@suse.cz, kasong@tencent.com, 
	kunwu.chan@gmail.com, liam@infradead.org, lianux.mm@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	liyangouwen1@oppo.com, ljs@kernel.org, loongarch@lists.linux.dev, 
	mhocko@suse.com, nphamcs@gmail.com, nzzhao@126.com, pfalcato@suse.de, 
	rppt@kernel.org, shikemeng@huaweicloud.com, surenb@google.com, 
	vbabka@kernel.org, wanglian@kylinos.cn, youngjun.park@lge.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, May 22, 2026 at 9:36=E2=80=AFPM Barry Song <baohua@kernel.org> wrot=
e:
>
> On Fri, May 22, 2026 at 9:09=E2=80=AFPM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> >
> > On Fri, May 22, 2026 at 10:33:05AM +0800, Barry Song (Xiaomi) wrote:
> > > need to touch `filemap.c` at all (probably because you are already
> > > maintaining `filemap.c` perfectly):
> >
> > I'm going to give you one chance to apologise for that.
>
> Apologies if my wording caused any misunderstanding.
> That was not my intention at all.
>
> What I meant is that filemap.c already has a very
> solid design.
>
> For memory.c, I had to touch several places for the
> blacklist; otherwise, the kernel would hang.
>
> But for filemap.c, I basically didn't need to touch
> anything, and preliminary testing shows no issues after
> moving it from the whitelist to the blacklist. This is

Sorry, I feel I may be causing some misunderstanding
again.

By "whitelist", I mean I used to allow certain cases
to use per-vma retry.

By "blacklist", I mean I am now moving to disallow
certain cases from using per-vma retry.

Right now, I have to add several cases in memory.c
to the blacklist; otherwise, the kernel would hang.

But it seems that everything in filemap.c is fine so
far based on testing.

I'm not sure if I've explained things clearly. Please
let me know if anything is still unclear or insufficient.

